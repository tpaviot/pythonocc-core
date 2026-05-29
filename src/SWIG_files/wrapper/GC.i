/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_gc.html"
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
%import Geom.i
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

/**********************
* class GC_MakeMirror *
**********************/
class GC_MakeMirror {
	public:
		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: 21f2694dc1fe067099d5a02128917464 ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Constructs a central symmetry about a point. 
Input parameter: thePoint center point.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Pnt & thePoint);

		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: 6c2aa82b8d042265b0fac3d4af188d0e ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1

Return
-------
None

Description
-----------
Constructs an axial symmetry about an axis. 
Input parameter: theAxis mirror axis.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Ax1 & theAxis);

		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: 904c52291fd877d866fe9e6e3ec15e9b ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin

Return
-------
None

Description
-----------
Constructs an axial symmetry about a line. 
Input parameter: theLine mirror line.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Lin & theLine);

		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: 7e7407f2e56670d6ebeaad9639c1a9fb ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt
theDirec: gp_Dir

Return
-------
None

Description
-----------
Constructs an axial symmetry about an axis defined by point and direction. 
Input parameter: thePoint point on the axis 
Input parameter: theDirec axis direction.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Pnt & thePoint, const gp_Dir & theDirec);

		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: 23ed944fc2d721214183961177a07593 ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Pln

Return
-------
None

Description
-----------
Constructs a planar symmetry about a plane. 
Input parameter: thePlane mirror plane.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Pln & thePlane);

		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: 2d05b545d5384cd47313020016dc827f ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Ax2

Return
-------
None

Description
-----------
Constructs a planar symmetry about a plane. 
Input parameter: thePlane mirror plane.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Ax2 & thePlane);

		/****** GC_MakeMirror::Value ******/
		/****** md5 signature: 1a83265d766adbc039817098a76cd59b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
") Value;
		const opencascade::handle<Geom_Transformation> & Value();

};


%extend GC_MakeMirror {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GC_MakeMirror2d *
************************/
class GC_MakeMirror2d {
	public:
		/****** GC_MakeMirror2d::GC_MakeMirror2d ******/
		/****** md5 signature: 23cbf64e3377e8e7abbc6022aa1319b0 ******/
		%feature("compactdefaultargs") GC_MakeMirror2d;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs a central symmetry about a point. 
Input parameter: thePoint center point.
") GC_MakeMirror2d;
		 GC_MakeMirror2d(const gp_Pnt2d & thePoint);

		/****** GC_MakeMirror2d::GC_MakeMirror2d ******/
		/****** md5 signature: 4de7c7a363447f8b9eff3d18c228aaad ******/
		%feature("compactdefaultargs") GC_MakeMirror2d;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax2d

Return
-------
None

Description
-----------
Constructs an axial symmetry about an axis. 
Input parameter: theAxis symmetry axis.
") GC_MakeMirror2d;
		 GC_MakeMirror2d(const gp_Ax2d & theAxis);

		/****** GC_MakeMirror2d::GC_MakeMirror2d ******/
		/****** md5 signature: 30b9927ee7cd39883a7fa0e36145bf53 ******/
		%feature("compactdefaultargs") GC_MakeMirror2d;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin2d

Return
-------
None

Description
-----------
Constructs an axial symmetry about a line. 
Input parameter: theLine symmetry line.
") GC_MakeMirror2d;
		 GC_MakeMirror2d(const gp_Lin2d & theLine);

		/****** GC_MakeMirror2d::GC_MakeMirror2d ******/
		/****** md5 signature: e1dfbb7cb99ab0520cf79ac9239d2c35 ******/
		%feature("compactdefaultargs") GC_MakeMirror2d;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d
theDirec: gp_Dir2d

Return
-------
None

Description
-----------
Constructs an axial symmetry about a line defined by point and direction. 
Input parameter: thePoint point on symmetry axis 
Input parameter: theDirec symmetry direction.
") GC_MakeMirror2d;
		 GC_MakeMirror2d(const gp_Pnt2d & thePoint, const gp_Dir2d & theDirec);

		/****** GC_MakeMirror2d::Value ******/
		/****** md5 signature: ee1994e59e5f8ef53f4ff7a6a35b819c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
") Value;
		const opencascade::handle<Geom2d_Transformation> & Value();

};


%extend GC_MakeMirror2d {
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
		/****** md5 signature: 35af34ffc15fcdfc12fefadf46321cf9 ******/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin
theAngle: double

Return
-------
None

Description
-----------
Constructs a rotation around the axis defined by a line. 
Input parameter: theLine rotation axis 
Input parameter: theAngle rotation angle in radians.
") GC_MakeRotation;
		 GC_MakeRotation(const gp_Lin & theLine, const double theAngle);

		/****** GC_MakeRotation::GC_MakeRotation ******/
		/****** md5 signature: 0460a4fe520b90d39c700f4a562f7ead ******/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1
theAngle: double

Return
-------
None

Description
-----------
Constructs a rotation around an axis. 
Input parameter: theAxis rotation axis 
Input parameter: theAngle rotation angle in radians.
") GC_MakeRotation;
		 GC_MakeRotation(const gp_Ax1 & theAxis, const double theAngle);

		/****** GC_MakeRotation::GC_MakeRotation ******/
		/****** md5 signature: 94aa958a978d4a9496492e1e394dbb18 ******/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt
theDirec: gp_Dir
theAngle: double

Return
-------
None

Description
-----------
Constructs a rotation around an axis defined by point and direction. 
Input parameter: thePoint point on the axis 
Input parameter: theDirec axis direction 
Input parameter: theAngle rotation angle in radians.
") GC_MakeRotation;
		 GC_MakeRotation(const gp_Pnt & thePoint, const gp_Dir & theDirec, const double theAngle);

		/****** GC_MakeRotation::Value ******/
		/****** md5 signature: 1a83265d766adbc039817098a76cd59b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
") Value;
		const opencascade::handle<Geom_Transformation> & Value();

};


%extend GC_MakeRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GC_MakeRotation2d *
**************************/
class GC_MakeRotation2d {
	public:
		/****** GC_MakeRotation2d::GC_MakeRotation2d ******/
		/****** md5 signature: 26b681282e0e824013f8988d3910e380 ******/
		%feature("compactdefaultargs") GC_MakeRotation2d;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d
theAngle: double

Return
-------
None

Description
-----------
Constructs a rotation through angle Angle about the center Point. 
Input parameter: thePoint rotation center 
Input parameter: theAngle rotation angle in radians.
") GC_MakeRotation2d;
		 GC_MakeRotation2d(const gp_Pnt2d & thePoint, const double theAngle);

		/****** GC_MakeRotation2d::Value ******/
		/****** md5 signature: ee1994e59e5f8ef53f4ff7a6a35b819c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
") Value;
		const opencascade::handle<Geom2d_Transformation> & Value();

};


%extend GC_MakeRotation2d {
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
		/****** md5 signature: f24e0933ce2b83d7e38c4bf3b0f0a0d1 ******/
		%feature("compactdefaultargs") GC_MakeScale;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt
theScale: double

Return
-------
None

Description
-----------
Constructs a scaling transformation. 
Input parameter: thePoint center point of scaling 
Input parameter: theScale scale factor.
") GC_MakeScale;
		 GC_MakeScale(const gp_Pnt & thePoint, const double theScale);

		/****** GC_MakeScale::Value ******/
		/****** md5 signature: 1a83265d766adbc039817098a76cd59b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
") Value;
		const opencascade::handle<Geom_Transformation> & Value();

};


%extend GC_MakeScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class GC_MakeScale2d *
***********************/
class GC_MakeScale2d {
	public:
		/****** GC_MakeScale2d::GC_MakeScale2d ******/
		/****** md5 signature: 2e30eb6c07648d3a4ec7e089a7b285a1 ******/
		%feature("compactdefaultargs") GC_MakeScale2d;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d
theScale: double

Return
-------
None

Description
-----------
Constructs a scaling transformation. 
Input parameter: thePoint center point 
Input parameter: theScale scale factor.
") GC_MakeScale2d;
		 GC_MakeScale2d(const gp_Pnt2d & thePoint, const double theScale);

		/****** GC_MakeScale2d::Value ******/
		/****** md5 signature: ee1994e59e5f8ef53f4ff7a6a35b819c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
") Value;
		const opencascade::handle<Geom2d_Transformation> & Value();

};


%extend GC_MakeScale2d {
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
		/****** md5 signature: c4fc09743a3c51b427ea09ed5cb938d4 ******/
		%feature("compactdefaultargs") GC_MakeTranslation;
		%feature("autodoc", "
Parameters
----------
theVect: gp_Vec

Return
-------
None

Description
-----------
Constructs a translation from a vector. 
Input parameter: theVect translation vector.
") GC_MakeTranslation;
		 GC_MakeTranslation(const gp_Vec & theVect);

		/****** GC_MakeTranslation::GC_MakeTranslation ******/
		/****** md5 signature: a07681b0cd0e27dc25b4c683ae71aaa4 ******/
		%feature("compactdefaultargs") GC_MakeTranslation;
		%feature("autodoc", "
Parameters
----------
thePoint1: gp_Pnt
thePoint2: gp_Pnt

Return
-------
None

Description
-----------
Constructs a translation from two points. 
Input parameter: thePoint1 start point 
Input parameter: thePoint2 end point.
") GC_MakeTranslation;
		 GC_MakeTranslation(const gp_Pnt & thePoint1, const gp_Pnt & thePoint2);

		/****** GC_MakeTranslation::Value ******/
		/****** md5 signature: 1a83265d766adbc039817098a76cd59b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
") Value;
		const opencascade::handle<Geom_Transformation> & Value();

};


%extend GC_MakeTranslation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GC_MakeTranslation2d *
*****************************/
class GC_MakeTranslation2d {
	public:
		/****** GC_MakeTranslation2d::GC_MakeTranslation2d ******/
		/****** md5 signature: f7be5bf856ca031a13c10ed324cfdd0c ******/
		%feature("compactdefaultargs") GC_MakeTranslation2d;
		%feature("autodoc", "
Parameters
----------
theVect: gp_Vec2d

Return
-------
None

Description
-----------
Constructs a translation along a vector. 
Input parameter: theVect translation vector.
") GC_MakeTranslation2d;
		 GC_MakeTranslation2d(const gp_Vec2d & theVect);

		/****** GC_MakeTranslation2d::GC_MakeTranslation2d ******/
		/****** md5 signature: a475fbdc8d128f69db2a65af18ff793b ******/
		%feature("compactdefaultargs") GC_MakeTranslation2d;
		%feature("autodoc", "
Parameters
----------
thePoint1: gp_Pnt2d
thePoint2: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs a translation along the vector from one point to another. 
Input parameter: thePoint1 first point 
Input parameter: thePoint2 second point.
") GC_MakeTranslation2d;
		 GC_MakeTranslation2d(const gp_Pnt2d & thePoint1, const gp_Pnt2d & thePoint2);

		/****** GC_MakeTranslation2d::Value ******/
		/****** md5 signature: ee1994e59e5f8ef53f4ff7a6a35b819c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
") Value;
		const opencascade::handle<Geom2d_Transformation> & Value();

};


%extend GC_MakeTranslation2d {
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
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction is successful.
") IsDone;
		bool IsDone();

		/****** GC_Root::IsError ******/
		/****** md5 signature: 926e3ad6adc82382f85c46ca0724537b ******/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction has failed.
") IsError;
		bool IsError();

		/****** GC_Root::Status ******/
		/****** md5 signature: 66f985f20df8a3d887a3bcea9f94ad53 ******/
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
		/****** md5 signature: 7f0f94465c1bc107285e6737f45f49f9 ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ
theAlpha1: double
theAlpha2: double
theSense: bool

Return
-------
None

Description
-----------
Creates an arc of circle from angular bounds. 
Input parameter: theCirc source circle 
Input parameter: theAlpha1 first angle (radians) 
Input parameter: theAlpha2 second angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Circ & theCirc, const double theAlpha1, const double theAlpha2, const bool theSense);

		/****** GC_MakeArcOfCircle::GC_MakeArcOfCircle ******/
		/****** md5 signature: 63b0a3285d95708b15d6d7b242e01a24 ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ
theP: gp_Pnt
theAlpha: double
theSense: bool

Return
-------
None

Description
-----------
Creates an arc of circle from a point and an angular bound. 
Input parameter: theCirc source circle 
Input parameter: theP point on circle 
Input parameter: theAlpha target angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Circ & theCirc, const gp_Pnt & theP, const double theAlpha, const bool theSense);

		/****** GC_MakeArcOfCircle::GC_MakeArcOfCircle ******/
		/****** md5 signature: de1f7ea2044a917e865d266bc478d27a ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ
theP1: gp_Pnt
theP2: gp_Pnt
theSense: bool

Return
-------
None

Description
-----------
Creates an arc of circle from two points on the circle. 
Input parameter: theCirc source circle 
Input parameter: theP1 first point on circle 
Input parameter: theP2 second point on circle 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Circ & theCirc, const gp_Pnt & theP1, const gp_Pnt & theP2, const bool theSense);

		/****** GC_MakeArcOfCircle::GC_MakeArcOfCircle ******/
		/****** md5 signature: b57b3e75e0aeb6da4cd5244882375a8e ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt
theP3: gp_Pnt

Return
-------
None

Description
-----------
Creates an arc of circle passing through three points. 
Input parameter: theP1 first point 
Input parameter: theP2 second point 
Input parameter: theP3 third point.
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Pnt & theP1, const gp_Pnt & theP2, const gp_Pnt & theP3);

		/****** GC_MakeArcOfCircle::GC_MakeArcOfCircle ******/
		/****** md5 signature: e1ae1cb2e7824e134c5cc13e47450d7a ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theV: gp_Vec
theP2: gp_Pnt

Return
-------
None

Description
-----------
Creates an arc of circle from two points and a tangent at the first point. 
Input parameter: theP1 start point 
Input parameter: theV tangent vector at start point 
Input parameter: theP2 end point @note The tangent direction is given by the input vector. The orientation of the arc is: - the sense determined by the order of the three input points; - the sense defined by the input vector; or - for the other constructors: - the sense of the source circle if the orientation flag is true, or - the opposite sense if `theSense` is false. @note Angles are expressed in radians. @note Construction fails with `gce_ConfusedPoints` if `theP1` and `theP2` are coincident. @note Construction fails with `gce_IntersectionError` if the supporting lines used to define circle center do not intersect.
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Pnt & theP1, const gp_Vec & theV, const gp_Pnt & theP2);

		/****** GC_MakeArcOfCircle::Value ******/
		/****** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the constructed arc of circle. Exceptions StdFail_NotDone if no arc of circle is constructed. 
Return: resulting arc.
") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GC_MakeArcOfCircle2d *
*****************************/
class GC_MakeArcOfCircle2d : public GC_Root {
	public:
		/****** GC_MakeArcOfCircle2d::GC_MakeArcOfCircle2d ******/
		/****** md5 signature: 9c6443af3ed27264b13312be688915c6 ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle2d;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ2d
theAlpha1: double
theAlpha2: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc from angular bounds on a circle. 
Input parameter: theCircle source circle 
Input parameter: theAlpha1 first angle (radians) 
Input parameter: theAlpha2 second angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfCircle2d;
		 GC_MakeArcOfCircle2d(const gp_Circ2d & theCircle, const double theAlpha1, const double theAlpha2, const bool theSense = true);

		/****** GC_MakeArcOfCircle2d::GC_MakeArcOfCircle2d ******/
		/****** md5 signature: 48b2628f583a55c363ee410038b6fbf0 ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle2d;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ2d
thePoint: gp_Pnt2d
theAlpha: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc from a point and angular bound on a circle. 
Input parameter: theCircle source circle 
Input parameter: thePoint point on source circle 
Input parameter: theAlpha angle value (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfCircle2d;
		 GC_MakeArcOfCircle2d(const gp_Circ2d & theCircle, const gp_Pnt2d & thePoint, const double theAlpha, const bool theSense = true);

		/****** GC_MakeArcOfCircle2d::GC_MakeArcOfCircle2d ******/
		/****** md5 signature: e6a694b98b858ac6f43cda5944a2e97c ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle2d;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ2d
theP1: gp_Pnt2d
theP2: gp_Pnt2d
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc between two points on a circle. 
Input parameter: theCircle source circle 
Input parameter: theP1 first point on source circle 
Input parameter: theP2 second point on source circle 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfCircle2d;
		 GC_MakeArcOfCircle2d(const gp_Circ2d & theCircle, const gp_Pnt2d & theP1, const gp_Pnt2d & theP2, const bool theSense = true);

		/****** GC_MakeArcOfCircle2d::GC_MakeArcOfCircle2d ******/
		/****** md5 signature: fd78d6c255a973f5372e7a9c4afef488 ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle2d;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d
theP3: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs an arc passing through three points. 
Input parameter: theP1 first point 
Input parameter: theP2 intermediate point 
Input parameter: theP3 last point.
") GC_MakeArcOfCircle2d;
		 GC_MakeArcOfCircle2d(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2, const gp_Pnt2d & theP3);

		/****** GC_MakeArcOfCircle2d::GC_MakeArcOfCircle2d ******/
		/****** md5 signature: 58b5ec81a8107a5ac634d13645bd07e0 ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle2d;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theV: gp_Vec2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs an arc from two points and tangent vector at start point. 
Input parameter: theP1 start point 
Input parameter: theV tangent vector at start point 
Input parameter: theP2 end point.
") GC_MakeArcOfCircle2d;
		 GC_MakeArcOfCircle2d(const gp_Pnt2d & theP1, const gp_Vec2d & theV, const gp_Pnt2d & theP2);

		/****** GC_MakeArcOfCircle2d::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the constructed arc of circle. Exceptions StdFail_NotDone if no arc of circle is constructed. 
Return: resulting trimmed curve.
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfCircle2d {
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
		/****** md5 signature: 0090a4ad7bdc14fe9c0729eedd9402cb ******/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "
Parameters
----------
theElips: gp_Elips
theAlpha1: double
theAlpha2: double
theSense: bool

Return
-------
None

Description
-----------
Constructs an arc from angular bounds on an ellipse. 
Input parameter: theElips source ellipse 
Input parameter: theAlpha1 first angle (radians) 
Input parameter: theAlpha2 second angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse(const gp_Elips & theElips, const double theAlpha1, const double theAlpha2, const bool theSense);

		/****** GC_MakeArcOfEllipse::GC_MakeArcOfEllipse ******/
		/****** md5 signature: 59ad8474b9c59d3a3ae3fe34d08e1032 ******/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "
Parameters
----------
theElips: gp_Elips
theP: gp_Pnt
theAlpha: double
theSense: bool

Return
-------
None

Description
-----------
Constructs an arc from a point and angle on an ellipse. 
Input parameter: theElips source ellipse 
Input parameter: theP point on ellipse 
Input parameter: theAlpha target angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse(const gp_Elips & theElips, const gp_Pnt & theP, const double theAlpha, const bool theSense);

		/****** GC_MakeArcOfEllipse::GC_MakeArcOfEllipse ******/
		/****** md5 signature: 1156ad1885b469764c3f2e71383847c9 ******/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "
Parameters
----------
theElips: gp_Elips
theP1: gp_Pnt
theP2: gp_Pnt
theSense: bool

Return
-------
None

Description
-----------
Constructs an arc between two points on an ellipse. 
Input parameter: theElips source ellipse 
Input parameter: theP1 first point 
Input parameter: theP2 second point 
Input parameter: theSense orientation of resulting arc @note The orientation of the arc of ellipse is: - the orientation of ellipse if `theSense` is true, or - the opposite orientation if `theSense` is false. @note Alpha1, Alpha2 and Alpha are angle values, given in radians. @note IsDone always returns true.
") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse(const gp_Elips & theElips, const gp_Pnt & theP1, const gp_Pnt & theP2, const bool theSense);

		/****** GC_MakeArcOfEllipse::Value ******/
		/****** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the constructed arc of ellipse. 
Return: resulting arc.
") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GC_MakeArcOfEllipse2d *
******************************/
class GC_MakeArcOfEllipse2d : public GC_Root {
	public:
		/****** GC_MakeArcOfEllipse2d::GC_MakeArcOfEllipse2d ******/
		/****** md5 signature: 7ff08e67a84d9e219d39b22e31dea33a ******/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse2d;
		%feature("autodoc", "
Parameters
----------
theEllipse: gp_Elips2d
theAlpha1: double
theAlpha2: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc from angular bounds on an ellipse. 
Input parameter: theEllipse source ellipse 
Input parameter: theAlpha1 first angle (radians) 
Input parameter: theAlpha2 second angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfEllipse2d;
		 GC_MakeArcOfEllipse2d(const gp_Elips2d & theEllipse, const double theAlpha1, const double theAlpha2, const bool theSense = true);

		/****** GC_MakeArcOfEllipse2d::GC_MakeArcOfEllipse2d ******/
		/****** md5 signature: c484445ab553dabed46d4c413322a8ee ******/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse2d;
		%feature("autodoc", "
Parameters
----------
theEllipse: gp_Elips2d
thePoint: gp_Pnt2d
theAlpha: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc from a point and angular bound on an ellipse. 
Input parameter: theEllipse source ellipse 
Input parameter: thePoint point on source ellipse 
Input parameter: theAlpha angle value (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfEllipse2d;
		 GC_MakeArcOfEllipse2d(const gp_Elips2d & theEllipse, const gp_Pnt2d & thePoint, const double theAlpha, const bool theSense = true);

		/****** GC_MakeArcOfEllipse2d::GC_MakeArcOfEllipse2d ******/
		/****** md5 signature: eecf71cb2016d62383015cbf535bacb6 ******/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse2d;
		%feature("autodoc", "
Parameters
----------
theEllipse: gp_Elips2d
theP1: gp_Pnt2d
theP2: gp_Pnt2d
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc between two points on an ellipse. 
Input parameter: theEllipse source ellipse 
Input parameter: theP1 first point on source ellipse 
Input parameter: theP2 second point on source ellipse 
Input parameter: theSense orientation of resulting arc @note Orientation is trigonometric when `theSense` is true, otherwise opposite. @note IsDone always returns true.
") GC_MakeArcOfEllipse2d;
		 GC_MakeArcOfEllipse2d(const gp_Elips2d & theEllipse, const gp_Pnt2d & theP1, const gp_Pnt2d & theP2, const bool theSense = true);

		/****** GC_MakeArcOfEllipse2d::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the constructed arc of ellipse. 
Return: resulting trimmed curve.
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfEllipse2d {
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
		/****** md5 signature: b6111dc6e9f13b61e6a6fa66ae735fd9 ******/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "
Parameters
----------
theHypr: gp_Hypr
theAlpha1: double
theAlpha2: double
theSense: bool

Return
-------
None

Description
-----------
Constructs an arc from angular bounds on a hyperbola. 
Input parameter: theHypr source hyperbola 
Input parameter: theAlpha1 first angle (radians) 
Input parameter: theAlpha2 second angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola(const gp_Hypr & theHypr, const double theAlpha1, const double theAlpha2, const bool theSense);

		/****** GC_MakeArcOfHyperbola::GC_MakeArcOfHyperbola ******/
		/****** md5 signature: 0828876dcddd9fe8c0676030ae2142c7 ******/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "
Parameters
----------
theHypr: gp_Hypr
theP: gp_Pnt
theAlpha: double
theSense: bool

Return
-------
None

Description
-----------
Constructs an arc from a point and angle on a hyperbola. 
Input parameter: theHypr source hyperbola 
Input parameter: theP point on hyperbola 
Input parameter: theAlpha target angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola(const gp_Hypr & theHypr, const gp_Pnt & theP, const double theAlpha, const bool theSense);

		/****** GC_MakeArcOfHyperbola::GC_MakeArcOfHyperbola ******/
		/****** md5 signature: 6cef41ac5dd1d57046a26fc9d482ee58 ******/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "
Parameters
----------
theHypr: gp_Hypr
theP1: gp_Pnt
theP2: gp_Pnt
theSense: bool

Return
-------
None

Description
-----------
Constructs an arc between two points on a hyperbola. 
Input parameter: theHypr source hyperbola 
Input parameter: theP1 first point 
Input parameter: theP2 second point 
Input parameter: theSense orientation of resulting arc @note The orientation of the arc of hyperbola is: - the orientation of hyperbola if `theSense` is true, or - the opposite orientation if `theSense` is false.
") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola(const gp_Hypr & theHypr, const gp_Pnt & theP1, const gp_Pnt & theP2, const bool theSense);

		/****** GC_MakeArcOfHyperbola::Value ******/
		/****** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the constructed arc of hyperbola. 
Return: resulting arc.
") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GC_MakeArcOfHyperbola2d *
********************************/
class GC_MakeArcOfHyperbola2d : public GC_Root {
	public:
		/****** GC_MakeArcOfHyperbola2d::GC_MakeArcOfHyperbola2d ******/
		/****** md5 signature: 14bc50ff8b0b8ead3f449e6e193606b8 ******/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola2d;
		%feature("autodoc", "
Parameters
----------
theHyperbola: gp_Hypr2d
theAlpha1: double
theAlpha2: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc from angular bounds on a hyperbola. 
Input parameter: theHyperbola source hyperbola 
Input parameter: theAlpha1 first angle (radians) 
Input parameter: theAlpha2 second angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfHyperbola2d;
		 GC_MakeArcOfHyperbola2d(const gp_Hypr2d & theHyperbola, const double theAlpha1, const double theAlpha2, const bool theSense = true);

		/****** GC_MakeArcOfHyperbola2d::GC_MakeArcOfHyperbola2d ******/
		/****** md5 signature: 31d7799d4ebc3a7a837ecebbec401801 ******/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola2d;
		%feature("autodoc", "
Parameters
----------
theHyperbola: gp_Hypr2d
thePoint: gp_Pnt2d
theAlpha: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc from a point and angular bound on a hyperbola. 
Input parameter: theHyperbola source hyperbola 
Input parameter: thePoint point on source hyperbola 
Input parameter: theAlpha angle value (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfHyperbola2d;
		 GC_MakeArcOfHyperbola2d(const gp_Hypr2d & theHyperbola, const gp_Pnt2d & thePoint, const double theAlpha, const bool theSense = true);

		/****** GC_MakeArcOfHyperbola2d::GC_MakeArcOfHyperbola2d ******/
		/****** md5 signature: ea0911f10df02b93e131958f3010cf13 ******/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola2d;
		%feature("autodoc", "
Parameters
----------
theHyperbola: gp_Hypr2d
theP1: gp_Pnt2d
theP2: gp_Pnt2d
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc between two points on a hyperbola. 
Input parameter: theHyperbola source hyperbola 
Input parameter: theP1 first point on source hyperbola 
Input parameter: theP2 second point on source hyperbola 
Input parameter: theSense orientation of resulting arc @note Orientation is trigonometric when `theSense` is true, otherwise opposite. @note IsDone always returns true.
") GC_MakeArcOfHyperbola2d;
		 GC_MakeArcOfHyperbola2d(const gp_Hypr2d & theHyperbola, const gp_Pnt2d & theP1, const gp_Pnt2d & theP2, const bool theSense = true);

		/****** GC_MakeArcOfHyperbola2d::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the constructed arc of hyperbola. 
Return: resulting trimmed curve.
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfHyperbola2d {
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
		/****** md5 signature: 818680b001e50732d894657c54a0cb5b ******/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "
Parameters
----------
theParab: gp_Parab
theAlpha1: double
theAlpha2: double
theSense: bool

Return
-------
None

Description
-----------
Constructs an arc from angular bounds on a parabola. 
Input parameter: theParab source parabola 
Input parameter: theAlpha1 first angle (radians) 
Input parameter: theAlpha2 second angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola(const gp_Parab & theParab, const double theAlpha1, const double theAlpha2, const bool theSense);

		/****** GC_MakeArcOfParabola::GC_MakeArcOfParabola ******/
		/****** md5 signature: 167f80fb60b2d3d00e9624148ab85139 ******/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "
Parameters
----------
theParab: gp_Parab
theP: gp_Pnt
theAlpha: double
theSense: bool

Return
-------
None

Description
-----------
Constructs an arc from a point and angle on a parabola. 
Input parameter: theParab source parabola 
Input parameter: theP point on parabola 
Input parameter: theAlpha target angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola(const gp_Parab & theParab, const gp_Pnt & theP, const double theAlpha, const bool theSense);

		/****** GC_MakeArcOfParabola::GC_MakeArcOfParabola ******/
		/****** md5 signature: 8ed521e3293d1400b54875ec45849f10 ******/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "
Parameters
----------
theParab: gp_Parab
theP1: gp_Pnt
theP2: gp_Pnt
theSense: bool

Return
-------
None

Description
-----------
Constructs an arc between two points on a parabola. 
Input parameter: theParab source parabola 
Input parameter: theP1 first point 
Input parameter: theP2 second point 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola(const gp_Parab & theParab, const gp_Pnt & theP1, const gp_Pnt & theP2, const bool theSense);

		/****** GC_MakeArcOfParabola::Value ******/
		/****** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the constructed arc of parabola. 
Return: resulting arc.
") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfParabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GC_MakeArcOfParabola2d *
*******************************/
class GC_MakeArcOfParabola2d : public GC_Root {
	public:
		/****** GC_MakeArcOfParabola2d::GC_MakeArcOfParabola2d ******/
		/****** md5 signature: 3ff52b418ec10aa3ba8cd11242b50b4c ******/
		%feature("compactdefaultargs") GC_MakeArcOfParabola2d;
		%feature("autodoc", "
Parameters
----------
theParabola: gp_Parab2d
theAlpha1: double
theAlpha2: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc from angular bounds on a parabola. 
Input parameter: theParabola source parabola 
Input parameter: theAlpha1 first angle (radians) 
Input parameter: theAlpha2 second angle (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfParabola2d;
		 GC_MakeArcOfParabola2d(const gp_Parab2d & theParabola, const double theAlpha1, const double theAlpha2, const bool theSense = true);

		/****** GC_MakeArcOfParabola2d::GC_MakeArcOfParabola2d ******/
		/****** md5 signature: 6bade1135b248b7c66d81477cdb72e6a ******/
		%feature("compactdefaultargs") GC_MakeArcOfParabola2d;
		%feature("autodoc", "
Parameters
----------
theParabola: gp_Parab2d
thePoint: gp_Pnt2d
theAlpha: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc from a point and angular bound on a parabola. 
Input parameter: theParabola source parabola 
Input parameter: thePoint point on source parabola 
Input parameter: theAlpha angle value (radians) 
Input parameter: theSense orientation of resulting arc.
") GC_MakeArcOfParabola2d;
		 GC_MakeArcOfParabola2d(const gp_Parab2d & theParabola, const gp_Pnt2d & thePoint, const double theAlpha, const bool theSense = true);

		/****** GC_MakeArcOfParabola2d::GC_MakeArcOfParabola2d ******/
		/****** md5 signature: b19bb6115decd3368cf1ec0e3f948b71 ******/
		%feature("compactdefaultargs") GC_MakeArcOfParabola2d;
		%feature("autodoc", "
Parameters
----------
theParabola: gp_Parab2d
theP1: gp_Pnt2d
theP2: gp_Pnt2d
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an arc between two points on a parabola. 
Input parameter: theParabola source parabola 
Input parameter: theP1 first point on source parabola 
Input parameter: theP2 second point on source parabola 
Input parameter: theSense orientation of resulting arc @note Orientation is trigonometric when `theSense` is true, otherwise opposite. @note IsDone always returns true.
") GC_MakeArcOfParabola2d;
		 GC_MakeArcOfParabola2d(const gp_Parab2d & theParabola, const gp_Pnt2d & theP1, const gp_Pnt2d & theP2, const bool theSense = true);

		/****** GC_MakeArcOfParabola2d::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the constructed arc of parabola. 
Return: resulting trimmed curve.
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfParabola2d {
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
		/****** md5 signature: 950c885872e1376f10322554587f0a90 ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
theC: gp_Circ

Return
-------
None

Description
-----------
Creates a circle from a `gp_Circ`. 
Input parameter: theC source circle.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Circ & theC);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: 8904790a052115d00bf75118336df6c8 ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theRadius: double

Return
-------
None

Description
-----------
Creates a circle from axis placement and radius. 
Input parameter: theA2 local coordinate system of the circle 
Input parameter: theRadius circle radius @note Radius equal to `0.0` is allowed. @note The status is `gce_NegativeRadius` if `theRadius < 0.0`.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Ax2 & theA2, const double theRadius);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: 61bb931eddada3896799e60f80f9ff58 ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ
theDist: double

Return
-------
None

Description
-----------
Creates a circle concentric to the input circle with an offset radius. 
Input parameter: theCirc reference circle 
Input parameter: theDist radius offset.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Circ & theCirc, const double theDist);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: 1af26739fcb751461dd721e95d2ac0be ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Creates a circle concentric to the input circle and passing through the input point. 
Input parameter: theCirc source circle 
Input parameter: thePoint point on resulting circle.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Circ & theCirc, const gp_Pnt & thePoint);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: f109c8328bad7d55a5b708765fc26dec ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt
theP3: gp_Pnt

Return
-------
None

Description
-----------
Creates a circle passing through three points. 
Input parameter: theP1 first point 
Input parameter: theP2 second point 
Input parameter: theP3 third point.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Pnt & theP1, const gp_Pnt & theP2, const gp_Pnt & theP3);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: e1f2ec17ead539e2d332c2b90fefd710 ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theNorm: gp_Dir
theRadius: double

Return
-------
None

Description
-----------
Creates a circle from center point, normal and radius. 
Input parameter: theCenter circle center 
Input parameter: theNorm normal direction of circle plane 
Input parameter: theRadius circle radius.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Pnt & theCenter, const gp_Dir & theNorm, const double theRadius);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: e5857bee90bb3817dcd04d428665e82a ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
thePtAxis: gp_Pnt
theRadius: double

Return
-------
None

Description
-----------
Creates a circle from center point, axis point and radius. 
Input parameter: theCenter circle center 
Input parameter: thePtAxis point defining normal direction 
Input parameter: theRadius circle radius @note The direction is defined by vector (`theCenter`,`thePtAxis`).
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Pnt & theCenter, const gp_Pnt & thePtAxis, const double theRadius);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: 7e3ab6b568ff989c511e63e07793991d ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1
theRadius: double

Return
-------
None

Description
-----------
Creates a circle from axis and radius. 
Input parameter: theAxis circle axis 
Input parameter: theRadius circle radius.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Ax1 & theAxis, const double theRadius);

		/****** GC_MakeCircle::Value ******/
		/****** md5 signature: 77b780fd65868a33ad4a6d8ee9ea9e45 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Circle>

Description
-----------
Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed. 
Return: resulting circle.
") Value;
		const opencascade::handle<Geom_Circle> & Value();

};


%extend GC_MakeCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GC_MakeCircle2d *
************************/
class GC_MakeCircle2d : public GC_Root {
	public:
		/****** GC_MakeCircle2d::GC_MakeCircle2d ******/
		/****** md5 signature: f1ba179241fbb3c74dfdecd7ddcac880 ******/
		%feature("compactdefaultargs") GC_MakeCircle2d;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ2d

Return
-------
None

Description
-----------
Creates a circle from a non-persistent one from package gp. 
Input parameter: theCircle source circle.
") GC_MakeCircle2d;
		 GC_MakeCircle2d(const gp_Circ2d & theCircle);

		/****** GC_MakeCircle2d::GC_MakeCircle2d ******/
		/****** md5 signature: 7286e92228fa7c1f64120e9d0338c903 ******/
		%feature("compactdefaultargs") GC_MakeCircle2d;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax2d
theRadius: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a circle from an axis placement and radius. 
Input parameter: theAxis axis placement 
Input parameter: theRadius radius value 
Input parameter: theSense orientation flag @note Construction fails with `gce_NegativeRadius` if `theRadius` is negative.
") GC_MakeCircle2d;
		 GC_MakeCircle2d(const gp_Ax2d & theAxis, const double theRadius, const bool theSense = true);

		/****** GC_MakeCircle2d::GC_MakeCircle2d ******/
		/****** md5 signature: f353464cc946dc9395e09fedf26ed17e ******/
		%feature("compactdefaultargs") GC_MakeCircle2d;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax22d
theRadius: double

Return
-------
None

Description
-----------
Creates a circle from a local coordinate system and radius. 
Input parameter: theAxis local coordinate system 
Input parameter: theRadius radius value @note Construction fails with `gce_NegativeRadius` if `theRadius` is negative.
") GC_MakeCircle2d;
		 GC_MakeCircle2d(const gp_Ax22d & theAxis, const double theRadius);

		/****** GC_MakeCircle2d::GC_MakeCircle2d ******/
		/****** md5 signature: 8aaaf2897eef784f678e81ea4e07d552 ******/
		%feature("compactdefaultargs") GC_MakeCircle2d;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ2d
theDist: double

Return
-------
None

Description
-----------
Creates a circle parallel to another one at signed distance. 
Input parameter: theCircle source circle 
Input parameter: theDist signed distance @note If `theDist` is positive, the resulting circle encloses `theCircle`. @note If `theDist` is negative, the resulting circle is enclosed by `theCircle`. @note Error status is provided by the underlying `gce_MakeCirc2d`.
") GC_MakeCircle2d;
		 GC_MakeCircle2d(const gp_Circ2d & theCircle, const double theDist);

		/****** GC_MakeCircle2d::GC_MakeCircle2d ******/
		/****** md5 signature: 648c9a4e6c5771f3d05cfa4f371cb2b3 ******/
		%feature("compactdefaultargs") GC_MakeCircle2d;
		%feature("autodoc", "
Parameters
----------
theCircle: gp_Circ2d
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a circle parallel to another one and passing through a point. 
Input parameter: theCircle source circle 
Input parameter: thePoint point on resulting circle @note Error status is provided by the underlying `gce_MakeCirc2d`.
") GC_MakeCircle2d;
		 GC_MakeCircle2d(const gp_Circ2d & theCircle, const gp_Pnt2d & thePoint);

		/****** GC_MakeCircle2d::GC_MakeCircle2d ******/
		/****** md5 signature: 54417f7e0b0461dc591db30fe78766a2 ******/
		%feature("compactdefaultargs") GC_MakeCircle2d;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d
theP3: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a circle passing through three points. 
Input parameter: theP1 first point 
Input parameter: theP2 second point 
Input parameter: theP3 third point @note Error status is provided by the underlying `gce_MakeCirc2d`.
") GC_MakeCircle2d;
		 GC_MakeCircle2d(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2, const gp_Pnt2d & theP3);

		/****** GC_MakeCircle2d::GC_MakeCircle2d ******/
		/****** md5 signature: ff105916e6d3419e0390c6ddf8efdee1 ******/
		%feature("compactdefaultargs") GC_MakeCircle2d;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt2d
theRadius: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a circle from center point and radius. 
Input parameter: theCenter center point 
Input parameter: theRadius radius value 
Input parameter: theSense orientation flag @note Error status is provided by the underlying `gce_MakeCirc2d`.
") GC_MakeCircle2d;
		 GC_MakeCircle2d(const gp_Pnt2d & theCenter, const double theRadius, const bool theSense = true);

		/****** GC_MakeCircle2d::GC_MakeCircle2d ******/
		/****** md5 signature: 1fc14399d4fc5d9ebc7046df545a810b ******/
		%feature("compactdefaultargs") GC_MakeCircle2d;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt2d
thePoint: gp_Pnt2d
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a circle from center point and one point on the circle. 
Input parameter: theCenter center point 
Input parameter: thePoint point on resulting circle 
Input parameter: theSense orientation flag @note Error status is provided by the underlying `gce_MakeCirc2d`.
") GC_MakeCircle2d;
		 GC_MakeCircle2d(const gp_Pnt2d & theCenter, const gp_Pnt2d & thePoint, const bool theSense = true);

		/****** GC_MakeCircle2d::Value ******/
		/****** md5 signature: 1f53c76cb56b10f031a04e080a4edcd4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Circle>

Description
-----------
Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed. 
Return: resulting circle.
") Value;
		const opencascade::handle<Geom2d_Circle> & Value();

};


%extend GC_MakeCircle2d {
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
		/****** md5 signature: 033a069c862b6aad61279f36c6bfae8a ******/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theAng: double
theRadius: double

Return
-------
None

Description
-----------
Creates a conical surface from local frame, semi-angle and radius. 
Input parameter: theA2 local coordinate system 
Input parameter: theAng semi-angle 
Input parameter: theRadius reference radius in placement plane @note `theA2` defines the local coordinate system of the conical surface. @note `theAng` is the conical surface semi-angle ]0, PI/2[. @note `theRadius` is the radius of the circle Viso in the placement plane of the conical surface defined with 'XAxis' and 'YAxis'. @note The 'ZDirection' of `theA2` defines the direction of the surface axis of symmetry. @note If the location point of `theA2` is the apex of the surface, `theRadius` is zero. @note The created surface is parametrized such that the normal vector (`N = D1U ^ D1V`) is oriented towards the 'outside region'. @note Status is `gce_NegativeRadius` if `theRadius < 0.0`, or `gce_BadAngle` if `theAng` is outside valid range.
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Ax2 & theA2, const double theAng, const double theRadius);

		/****** GC_MakeConicalSurface::GC_MakeConicalSurface ******/
		/****** md5 signature: 1ed82e12eecb87479e8abc910b37e473 ******/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "
Parameters
----------
theC: gp_Cone

Return
-------
None

Description
-----------
Creates a conical surface from a `gp_Cone`. 
Input parameter: theC source cone.
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Cone & theC);

		/****** GC_MakeConicalSurface::GC_MakeConicalSurface ******/
		/****** md5 signature: 6bf050580e194a6a7cb81470a387bad4 ******/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt
theP3: gp_Pnt
theP4: gp_Pnt

Return
-------
None

Description
-----------
Creates a conical surface from four points. 
Input parameter: theP1 first point defining axis 
Input parameter: theP2 second point defining axis 
Input parameter: theP3 point defining first section radius 
Input parameter: theP4 point defining second section radius @note Axis is defined by points `theP1` and `theP2`, and base radius is the distance between point `theP3` and that axis. @note The distance between point `theP4` and that axis is the radius of the section passing through P4. @note Construction fails if points `theP1`, `theP2`, `theP3` and `theP4` are collinear, or if vector (`theP3`,`theP4`) is perpendicular/collinear to vector (`theP1`,`theP2`).
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Pnt & theP1, const gp_Pnt & theP2, const gp_Pnt & theP3, const gp_Pnt & theP4);

		/****** GC_MakeConicalSurface::GC_MakeConicalSurface ******/
		/****** md5 signature: b418df834c073e600ec83e7f56d77177 ******/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt
theR1: double
theR2: double

Return
-------
None

Description
-----------
Creates a conical surface with two points and two radii. 
Input parameter: theP1 first axis point 
Input parameter: theP2 second axis point 
Input parameter: theR1 radius at P1 
Input parameter: theR2 radius at P2 @note The axis of the solution is the line passing through `theP1` and `theP2`. @note `theR1` and `theR2` are radii of sections passing through `theP1` and `theP2`.
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Pnt & theP1, const gp_Pnt & theP2, const double theR1, const double theR2);

		/****** GC_MakeConicalSurface::Value ******/
		/****** md5 signature: f76b9d8ce2fb13effc98c77c09194361 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_ConicalSurface>

Description
-----------
Returns the constructed cone. Exceptions StdFail_NotDone if no cone is constructed. 
Return: resulting conical surface.
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
		/****** md5 signature: 7f5081b94a5aeb4189fec12a1c155f9a ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theRadius: double

Return
-------
None

Description
-----------
Creates a cylindrical surface from axis placement and radius. 
Input parameter: theA2 local coordinate system 
Input parameter: theRadius cylinder radius @note `theA2` defines the local coordinate system of the cylindrical surface. @note The 'ZDirection' of `theA2` defines the direction of the surface axis of symmetry. @note The created surface is parametrized such that the normal vector (`N = D1U ^ D1V`) is oriented towards the 'outside region'. @note It is valid to create a cylindrical surface with `theRadius = 0.0`. @note Status is `gce_NegativeRadius` if `theRadius < 0.0`.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Ax2 & theA2, const double theRadius);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: 74f0b3d26436463ff69180eaafbade81 ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
theC: gp_Cylinder

Return
-------
None

Description
-----------
Creates a cylindrical surface from a `gp_Cylinder`. 
Input parameter: theC source cylinder.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Cylinder & theC);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: d98e84251d56c4fa00f44a1ca2a1de12 ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
theCyl: gp_Cylinder
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Creates a cylindrical surface parallel to the input cylinder and passing through the input point. 
Input parameter: theCyl source cylinder 
Input parameter: thePoint point on resulting surface.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Cylinder & theCyl, const gp_Pnt & thePoint);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: c9e998a947589e907a680b04a326576b ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
theCyl: gp_Cylinder
theDist: double

Return
-------
None

Description
-----------
Creates a cylindrical surface parallel to the input cylinder at signed distance. 
Input parameter: theCyl source cylinder 
Input parameter: theDist signed offset distance @note The result radius is the absolute value of (source radius + signed distance).
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Cylinder & theCyl, const double theDist);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: e2572ac27bcabf713d4dc110e9c222ec ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt
theP3: gp_Pnt

Return
-------
None

Description
-----------
Creates a cylindrical surface passing through three points. 
Input parameter: theP1 first axis point 
Input parameter: theP2 second axis point 
Input parameter: theP3 point defining radius @note The axis is defined by points `theP1` and `theP2`, and radius is the distance between point `theP3` and that axis.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Pnt & theP1, const gp_Pnt & theP2, const gp_Pnt & theP3);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: 9d00add7d7e86e4206cf207660dbf405 ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1
theRadius: double

Return
-------
None

Description
-----------
Creates a cylindrical surface from axis and radius. 
Input parameter: theAxis cylinder axis 
Input parameter: theRadius cylinder radius.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Ax1 & theAxis, const double theRadius);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: 2809fa6aac152389357e660d90ad97aa ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ

Return
-------
None

Description
-----------
Creates a cylindrical surface from its circular base. 
Input parameter: theCirc base circle.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Circ & theCirc);

		/****** GC_MakeCylindricalSurface::Value ******/
		/****** md5 signature: 30dd9d137690c70664962cf877a84f99 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_CylindricalSurface>

Description
-----------
Returns the constructed cylinder. Exceptions StdFail_NotDone if no cylinder is constructed. 
Return: resulting cylindrical surface.
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
		/****** md5 signature: 4a5a33ebb00f14d6e7dd29b128d28e3b ******/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
theE: gp_Elips

Return
-------
None

Description
-----------
Creates an ellipse from a `gp_Elips`. 
Input parameter: theE source ellipse.
") GC_MakeEllipse;
		 GC_MakeEllipse(const gp_Elips & theE);

		/****** GC_MakeEllipse::GC_MakeEllipse ******/
		/****** md5 signature: 0a807decded5df50ee7169520f5b6764 ******/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theMajorRadius: double
theMinorRadius: double

Return
-------
None

Description
-----------
Constructs an ellipse with major and minor radii MajorRadius and MinorRadius, and located in the plane defined by the 'X Axis' and 'Y Axis' of the coordinate system A2, where: - its center is the origin of A2, and - its major axis is the 'X Axis' of A2; @note Construction with `theMajorRadius == theMinorRadius` is allowed. @note Construction fails with `gce_NegativeRadius` if `theMinorRadius < 0.0`. @note Construction fails with `gce_InvertAxis` if `theMajorRadius < theMinorRadius`. 
Input parameter: theA2 ellipse local coordinate system 
Input parameter: theMajorRadius major radius 
Input parameter: theMinorRadius minor radius.
") GC_MakeEllipse;
		 GC_MakeEllipse(const gp_Ax2 & theA2, const double theMajorRadius, const double theMinorRadius);

		/****** GC_MakeEllipse::GC_MakeEllipse ******/
		/****** md5 signature: 6e67a1db7cfb3780ef93a4900440868c ******/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
theS1: gp_Pnt
theS2: gp_Pnt
theCenter: gp_Pnt

Return
-------
None

Description
-----------
Constructs an ellipse centered on the point Center, where - the plane of the ellipse is defined by Center, S1 and S2, - its major axis is defined by Center and S1, - its major radius is the distance between Center and S1, and - its minor radius is the distance between S2 and the major axis. 
Input parameter: theS1 point defining the major axis 
Input parameter: theS2 point defining the minor radius 
Input parameter: theCenter ellipse center.
") GC_MakeEllipse;
		 GC_MakeEllipse(const gp_Pnt & theS1, const gp_Pnt & theS2, const gp_Pnt & theCenter);

		/****** GC_MakeEllipse::Value ******/
		/****** md5 signature: fe3b3117138e75351b7c9f5b2c0c513e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Ellipse>

Description
-----------
Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed. 
Return: resulting ellipse.
") Value;
		const opencascade::handle<Geom_Ellipse> & Value();

};


%extend GC_MakeEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GC_MakeEllipse2d *
*************************/
class GC_MakeEllipse2d : public GC_Root {
	public:
		/****** GC_MakeEllipse2d::GC_MakeEllipse2d ******/
		/****** md5 signature: 36b9984a20abf8124354a020715bba16 ******/
		%feature("compactdefaultargs") GC_MakeEllipse2d;
		%feature("autodoc", "
Parameters
----------
theEllipse: gp_Elips2d

Return
-------
None

Description
-----------
Creates an ellipse from a non-persistent one from package gp. 
Input parameter: theEllipse source ellipse.
") GC_MakeEllipse2d;
		 GC_MakeEllipse2d(const gp_Elips2d & theEllipse);

		/****** GC_MakeEllipse2d::GC_MakeEllipse2d ******/
		/****** md5 signature: c4efd3b66cec14d47804b86e25b4a399 ******/
		%feature("compactdefaultargs") GC_MakeEllipse2d;
		%feature("autodoc", "
Parameters
----------
theMajorAxis: gp_Ax2d
theMajorRadius: double
theMinorRadius: double
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates an ellipse from major axis placement and radii. 
Input parameter: theMajorAxis major axis placement 
Input parameter: theMajorRadius major radius value 
Input parameter: theMinorRadius minor radius value 
Input parameter: theSense orientation flag @note Error status is provided by the underlying `gce_MakeElips2d` (for example `gce_InvertRadius` or `gce_NegativeRadius`).
") GC_MakeEllipse2d;
		 GC_MakeEllipse2d(const gp_Ax2d & theMajorAxis, const double theMajorRadius, const double theMinorRadius, const bool theSense = true);

		/****** GC_MakeEllipse2d::GC_MakeEllipse2d ******/
		/****** md5 signature: 73c446b788343e7c98c990bbc194fb4d ******/
		%feature("compactdefaultargs") GC_MakeEllipse2d;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax22d
theMajorRadius: double
theMinorRadius: double

Return
-------
None

Description
-----------
Creates an ellipse from a local coordinate system and radii. 
Input parameter: theAxis local coordinate system 
Input parameter: theMajorRadius major radius value 
Input parameter: theMinorRadius minor radius value @note Error status is provided by the underlying `gce_MakeElips2d` (for example `gce_InvertRadius` or `gce_NegativeRadius`).
") GC_MakeEllipse2d;
		 GC_MakeEllipse2d(const gp_Ax22d & theAxis, const double theMajorRadius, const double theMinorRadius);

		/****** GC_MakeEllipse2d::GC_MakeEllipse2d ******/
		/****** md5 signature: 67da5e53cb894f698683cb69a8879ffb ******/
		%feature("compactdefaultargs") GC_MakeEllipse2d;
		%feature("autodoc", "
Parameters
----------
theS1: gp_Pnt2d
theS2: gp_Pnt2d
theCenter: gp_Pnt2d

Return
-------
None

Description
-----------
Creates an ellipse from two apex points and center point. 
Input parameter: theS1 first apex point 
Input parameter: theS2 second point defining minor radius 
Input parameter: theCenter center point @note Error status is provided by the underlying `gce_MakeElips2d`.
") GC_MakeEllipse2d;
		 GC_MakeEllipse2d(const gp_Pnt2d & theS1, const gp_Pnt2d & theS2, const gp_Pnt2d & theCenter);

		/****** GC_MakeEllipse2d::Value ******/
		/****** md5 signature: 2d10ec11666004d739fc242682345a05 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Ellipse>

Description
-----------
Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed. 
Return: resulting ellipse.
") Value;
		const opencascade::handle<Geom2d_Ellipse> & Value();

};


%extend GC_MakeEllipse2d {
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
		/****** md5 signature: 56887d1e85fca537b25ef371a14f4b01 ******/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
theH: gp_Hypr

Return
-------
None

Description
-----------
Creates a hyperbola from a `gp_Hypr`. 
Input parameter: theH source hyperbola.
") GC_MakeHyperbola;
		 GC_MakeHyperbola(const gp_Hypr & theH);

		/****** GC_MakeHyperbola::GC_MakeHyperbola ******/
		/****** md5 signature: 90dbc8e67fabd8c1bdece617dce9025b ******/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theMajorRadius: double
theMinorRadius: double

Return
-------
None

Description
-----------
Constructs a hyperbola centered on the origin of the coordinate system A2, with major and minor radii MajorRadius and MinorRadius, where: the plane of the hyperbola is defined by the 'X Axis' and 'Y Axis' of A2, - its major axis is the 'X Axis' of A2. 
Input parameter: theA2 hyperbola local coordinate system 
Input parameter: theMajorRadius major radius 
Input parameter: theMinorRadius minor radius.
") GC_MakeHyperbola;
		 GC_MakeHyperbola(const gp_Ax2 & theA2, const double theMajorRadius, const double theMinorRadius);

		/****** GC_MakeHyperbola::GC_MakeHyperbola ******/
		/****** md5 signature: 2a8e4c289ad246e1c7e61fc9f0b4f836 ******/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
theS1: gp_Pnt
theS2: gp_Pnt
theCenter: gp_Pnt

Return
-------
None

Description
-----------
Constructs a hyperbola centered on the point Center, where - the plane of the hyperbola is defined by Center, S1 and S2, - its major axis is defined by Center and S1, - its major radius is the distance between Center and S1, and - its minor radius is the distance between S2 and the major axis; 
Input parameter: theS1 point defining the major axis 
Input parameter: theS2 point defining the minor radius 
Input parameter: theCenter hyperbola center.
") GC_MakeHyperbola;
		 GC_MakeHyperbola(const gp_Pnt & theS1, const gp_Pnt & theS2, const gp_Pnt & theCenter);

		/****** GC_MakeHyperbola::Value ******/
		/****** md5 signature: 7d3e15d3ad54c1125b9d13b5ee20322c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Hyperbola>

Description
-----------
Returns the constructed hyperbola. Exceptions StdFail_NotDone if no hyperbola is constructed. 
Return: resulting hyperbola.
") Value;
		const opencascade::handle<Geom_Hyperbola> & Value();

};


%extend GC_MakeHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GC_MakeHyperbola2d *
***************************/
class GC_MakeHyperbola2d : public GC_Root {
	public:
		/****** GC_MakeHyperbola2d::GC_MakeHyperbola2d ******/
		/****** md5 signature: 4a2b27a11015d1ea092ed76899e77878 ******/
		%feature("compactdefaultargs") GC_MakeHyperbola2d;
		%feature("autodoc", "
Parameters
----------
theHyperbola: gp_Hypr2d

Return
-------
None

Description
-----------
Creates a hyperbola from a non-persistent one from package gp. 
Input parameter: theHyperbola source hyperbola.
") GC_MakeHyperbola2d;
		 GC_MakeHyperbola2d(const gp_Hypr2d & theHyperbola);

		/****** GC_MakeHyperbola2d::GC_MakeHyperbola2d ******/
		/****** md5 signature: 6db4315bf650b3dbca90462e8a86e79c ******/
		%feature("compactdefaultargs") GC_MakeHyperbola2d;
		%feature("autodoc", "
Parameters
----------
theMajorAxis: gp_Ax2d
theMajorRadius: double
theMinorRadius: double
theSense: bool

Return
-------
None

Description
-----------
Creates a hyperbola from major axis placement and radii. 
Input parameter: theMajorAxis major axis placement 
Input parameter: theMajorRadius major radius value 
Input parameter: theMinorRadius minor radius value 
Input parameter: theSense orientation flag @note Error status is provided by the underlying `gce_MakeHypr2d` (for example `gce_NegativeRadius`).
") GC_MakeHyperbola2d;
		 GC_MakeHyperbola2d(const gp_Ax2d & theMajorAxis, const double theMajorRadius, const double theMinorRadius, const bool theSense);

		/****** GC_MakeHyperbola2d::GC_MakeHyperbola2d ******/
		/****** md5 signature: 4e351b509580d4f5336ea0f2f1d6e203 ******/
		%feature("compactdefaultargs") GC_MakeHyperbola2d;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax22d
theMajorRadius: double
theMinorRadius: double

Return
-------
None

Description
-----------
Creates a hyperbola from local coordinate system and radii. 
Input parameter: theAxis local coordinate system 
Input parameter: theMajorRadius major radius value 
Input parameter: theMinorRadius minor radius value @note Error status is provided by the underlying `gce_MakeHypr2d` (for example `gce_NegativeRadius`).
") GC_MakeHyperbola2d;
		 GC_MakeHyperbola2d(const gp_Ax22d & theAxis, const double theMajorRadius, const double theMinorRadius);

		/****** GC_MakeHyperbola2d::GC_MakeHyperbola2d ******/
		/****** md5 signature: c2a6135b27c0d29555f73202467e4c83 ******/
		%feature("compactdefaultargs") GC_MakeHyperbola2d;
		%feature("autodoc", "
Parameters
----------
theS1: gp_Pnt2d
theS2: gp_Pnt2d
theCenter: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a hyperbola from two apex points and center point. 
Input parameter: theS1 first apex point 
Input parameter: theS2 second point defining conjugate radius 
Input parameter: theCenter center point @note Error status is provided by the underlying `gce_MakeHypr2d` (for example `gce_ConfusedPoints` or `gce_ColinearPoints`).
") GC_MakeHyperbola2d;
		 GC_MakeHyperbola2d(const gp_Pnt2d & theS1, const gp_Pnt2d & theS2, const gp_Pnt2d & theCenter);

		/****** GC_MakeHyperbola2d::Value ******/
		/****** md5 signature: dd7449388b2bb54bca5d492fce5b636d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Hyperbola>

Description
-----------
Returns the constructed hyperbola. Exceptions: StdFail_NotDone if no hyperbola is constructed. 
Return: resulting hyperbola.
") Value;
		const opencascade::handle<Geom2d_Hyperbola> & Value();

};


%extend GC_MakeHyperbola2d {
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
		/****** md5 signature: 60fa9e1c035785889c9d0592897ae5eb ******/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Creates a line located in 3D space with the axis placement A1. 
Input parameter: theA1 line axis placement @note The location of `theA1` is the origin of the line.
") GC_MakeLine;
		 GC_MakeLine(const gp_Ax1 & theA1);

		/****** GC_MakeLine::GC_MakeLine ******/
		/****** md5 signature: 4ca27629b66920fd04eea2203ebdb0c6 ******/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin

Return
-------
None

Description
-----------
Creates a line from a non-persistent line from package gp. 
Input parameter: theL source line.
") GC_MakeLine;
		 GC_MakeLine(const gp_Lin & theL);

		/****** GC_MakeLine::GC_MakeLine ******/
		/****** md5 signature: f18e2adf33d2deebe44e90a591a35721 ******/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir

Return
-------
None

Description
-----------
Creates a line from point and direction. 
Input parameter: theP line origin 
Input parameter: theV line direction.
") GC_MakeLine;
		 GC_MakeLine(const gp_Pnt & theP, const gp_Dir & theV);

		/****** GC_MakeLine::GC_MakeLine ******/
		/****** md5 signature: 98e4ebe31ee284781f5a8e905e5bf556 ******/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Creates a line parallel to the input line and passing through the input point. 
Input parameter: theLin source line 
Input parameter: thePoint point on resulting line.
") GC_MakeLine;
		 GC_MakeLine(const gp_Lin & theLin, const gp_Pnt & thePoint);

		/****** GC_MakeLine::GC_MakeLine ******/
		/****** md5 signature: 73692e921203d5bf42cf81715b714d22 ******/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Creates a line passing through two points. 
Input parameter: theP1 first point 
Input parameter: theP2 second point @note Construction fails with `gce_ConfusedPoints` if the two points are coincident.
") GC_MakeLine;
		 GC_MakeLine(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** GC_MakeLine::Value ******/
		/****** md5 signature: 5995492bfc97e37ea24602cdfa25a85a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Line>

Description
-----------
Returns the constructed line. Exceptions StdFail_NotDone if no line is constructed. 
Return: resulting line.
") Value;
		const opencascade::handle<Geom_Line> & Value();

};


%extend GC_MakeLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GC_MakeLine2d *
**********************/
class GC_MakeLine2d : public GC_Root {
	public:
		/****** GC_MakeLine2d::GC_MakeLine2d ******/
		/****** md5 signature: f6f62f77a8286dea52fd7482d95ab66a ******/
		%feature("compactdefaultargs") GC_MakeLine2d;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax2d

Return
-------
None

Description
-----------
Creates a line from an axis placement. 
Input parameter: theAxis axis placement @note The location of `theAxis` is the line origin.
") GC_MakeLine2d;
		 GC_MakeLine2d(const gp_Ax2d & theAxis);

		/****** GC_MakeLine2d::GC_MakeLine2d ******/
		/****** md5 signature: 0208f36133c156f6542859a9f9eb76bb ******/
		%feature("compactdefaultargs") GC_MakeLine2d;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin2d

Return
-------
None

Description
-----------
Creates a line from a non-persistent line from package gp. 
Input parameter: theLine source line.
") GC_MakeLine2d;
		 GC_MakeLine2d(const gp_Lin2d & theLine);

		/****** GC_MakeLine2d::GC_MakeLine2d ******/
		/****** md5 signature: 2a4d898e2b993ce36f4d2210c73eebf6 ******/
		%feature("compactdefaultargs") GC_MakeLine2d;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d
theDir: gp_Dir2d

Return
-------
None

Description
-----------
Constructs a line from origin and direction. 
Input parameter: thePoint point on line 
Input parameter: theDir direction.
") GC_MakeLine2d;
		 GC_MakeLine2d(const gp_Pnt2d & thePoint, const gp_Dir2d & theDir);

		/****** GC_MakeLine2d::GC_MakeLine2d ******/
		/****** md5 signature: e74f44e73e66fcc42695d6a8cdb3b5b7 ******/
		%feature("compactdefaultargs") GC_MakeLine2d;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin2d
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs a line parallel to input line and passing through a point. 
Input parameter: theLine source line 
Input parameter: thePoint point on resulting line.
") GC_MakeLine2d;
		 GC_MakeLine2d(const gp_Lin2d & theLine, const gp_Pnt2d & thePoint);

		/****** GC_MakeLine2d::GC_MakeLine2d ******/
		/****** md5 signature: cd4f5b7fb2cf1dbaddb683823e50aac1 ******/
		%feature("compactdefaultargs") GC_MakeLine2d;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin2d
theDist: double

Return
-------
None

Description
-----------
Constructs a line parallel to input line at signed distance. 
Input parameter: theLine source line 
Input parameter: theDist signed distance.
") GC_MakeLine2d;
		 GC_MakeLine2d(const gp_Lin2d & theLine, const double theDist);

		/****** GC_MakeLine2d::GC_MakeLine2d ******/
		/****** md5 signature: 0c0206c5f75dbb0575005a8bb048eaea ******/
		%feature("compactdefaultargs") GC_MakeLine2d;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs a line passing through two points. 
Input parameter: theP1 first point 
Input parameter: theP2 second point @note Status is `gce_ConfusedPoints` if points are coincident.
") GC_MakeLine2d;
		 GC_MakeLine2d(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** GC_MakeLine2d::Value ******/
		/****** md5 signature: b2bd7ed650b8a6f010f325e80f90f0cf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Line>

Description
-----------
Returns the constructed line. Exceptions StdFail_NotDone if no line is constructed. 
Return: resulting line.
") Value;
		const opencascade::handle<Geom2d_Line> & Value();

};


%extend GC_MakeLine2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GC_MakeParabola2d *
**************************/
class GC_MakeParabola2d : public GC_Root {
	public:
		/****** GC_MakeParabola2d::GC_MakeParabola2d ******/
		/****** md5 signature: b3cd1f583da451bf4183109cb2fdcd41 ******/
		%feature("compactdefaultargs") GC_MakeParabola2d;
		%feature("autodoc", "
Parameters
----------
theParabola: gp_Parab2d

Return
-------
None

Description
-----------
Creates a parabola from a non-persistent one from package gp. 
Input parameter: theParabola source parabola.
") GC_MakeParabola2d;
		 GC_MakeParabola2d(const gp_Parab2d & theParabola);

		/****** GC_MakeParabola2d::GC_MakeParabola2d ******/
		/****** md5 signature: 252833682b1c231e89657824d1c5d37b ******/
		%feature("compactdefaultargs") GC_MakeParabola2d;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax22d
theFocal: double

Return
-------
None

Description
-----------
Creates a parabola from a local coordinate system and focal length. 
Input parameter: theAxis local coordinate system 
Input parameter: theFocal focal length @note Construction fails with `gce_NullFocusLength` if `theFocal` is negative.
") GC_MakeParabola2d;
		 GC_MakeParabola2d(const gp_Ax22d & theAxis, const double theFocal);

		/****** GC_MakeParabola2d::GC_MakeParabola2d ******/
		/****** md5 signature: b9c0257b27cbbd164d59b38a703940fb ******/
		%feature("compactdefaultargs") GC_MakeParabola2d;
		%feature("autodoc", "
Parameters
----------
theMirrorAxis: gp_Ax2d
theFocal: double
theSense: bool

Return
-------
None

Description
-----------
Creates a parabola from symmetry axis and focal length. 
Input parameter: theMirrorAxis symmetry axis placement 
Input parameter: theFocal focal length 
Input parameter: theSense orientation flag @note Construction fails with `gce_NullFocusLength` if `theFocal` is negative.
") GC_MakeParabola2d;
		 GC_MakeParabola2d(const gp_Ax2d & theMirrorAxis, const double theFocal, const bool theSense);

		/****** GC_MakeParabola2d::GC_MakeParabola2d ******/
		/****** md5 signature: 108336a66cb90b176abdda6f7051630f ******/
		%feature("compactdefaultargs") GC_MakeParabola2d;
		%feature("autodoc", "
Parameters
----------
theDirectrix: gp_Ax2d
theFocus: gp_Pnt2d
theSense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a parabola from directrix and focus point. 
Input parameter: theDirectrix directrix axis 
Input parameter: theFocus focus point 
Input parameter: theSense orientation flag.
") GC_MakeParabola2d;
		 GC_MakeParabola2d(const gp_Ax2d & theDirectrix, const gp_Pnt2d & theFocus, const bool theSense = true);

		/****** GC_MakeParabola2d::GC_MakeParabola2d ******/
		/****** md5 signature: 1e2d3bc54b532bd863204dce55f13180 ******/
		%feature("compactdefaultargs") GC_MakeParabola2d;
		%feature("autodoc", "
Parameters
----------
theFocus: gp_Pnt2d
theVertex: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a parabola from focus and vertex points. 
Input parameter: theFocus focus point 
Input parameter: theVertex vertex point @note Error status is provided by the underlying `gce_MakeParab2d` (for example `gce_NullAxis`).
") GC_MakeParabola2d;
		 GC_MakeParabola2d(const gp_Pnt2d & theFocus, const gp_Pnt2d & theVertex);

		/****** GC_MakeParabola2d::Value ******/
		/****** md5 signature: 67a8e074f7eb71ab61c9917c17ace1e8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Parabola>

Description
-----------
Returns the constructed parabola. Exceptions StdFail_NotDone if no parabola is constructed. 
Return: resulting parabola.
") Value;
		const opencascade::handle<Geom2d_Parabola> & Value();

};


%extend GC_MakeParabola2d {
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
		/****** md5 signature: abecfed774ea3c1057dc84fd34cdcb60 ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
thePl: gp_Pln

Return
-------
None

Description
-----------
Creates a plane from a non-persistent plane from package gp. 
Input parameter: thePl source plane.
") GC_MakePlane;
		 GC_MakePlane(const gp_Pln & thePl);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: 84eed3378913ed0d456225dcb0409742 ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir

Return
-------
None

Description
-----------
Creates a plane from point and normal direction. 
Input parameter: theP location point of the plane 
Input parameter: theV normal direction.
") GC_MakePlane;
		 GC_MakePlane(const gp_Pnt & theP, const gp_Dir & theV);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: 1af63b9c725e4d816dd30a7fb21ed354 ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
theA: double
theB: double
theC: double
theD: double

Return
-------
None

Description
-----------
Creates a plane from its cartesian equation: `A * x + B * y + C * z + D = 0.0`. 
Input parameter: theA equation coefficient A 
Input parameter: theB equation coefficient B 
Input parameter: theC equation coefficient C 
Input parameter: theD equation coefficient D @note Status is `gce_BadEquation` if `sqrt(theA*theA + theB*theB + theC*theC)` is below gp resolution.
") GC_MakePlane;
		 GC_MakePlane(const double theA, const double theB, const double theC, const double theD);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: dac43070fe70b6e246cf197d3b5853f6 ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
thePln: gp_Pln
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Creates a plane parallel to the input plane and passing through the input point. 
Input parameter: thePln source plane 
Input parameter: thePoint point on resulting plane.
") GC_MakePlane;
		 GC_MakePlane(const gp_Pln & thePln, const gp_Pnt & thePoint);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: abe81486720a049022efd69d10cbefb9 ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
thePln: gp_Pln
theDist: double

Return
-------
None

Description
-----------
Creates a plane parallel to the input plane at signed distance. 
Input parameter: thePln source plane 
Input parameter: theDist signed distance @note Positive distance follows the normal of the input plane.
") GC_MakePlane;
		 GC_MakePlane(const gp_Pln & thePln, const double theDist);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: 270da56f440e2ae4aacd47e01f43761e ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt
theP3: gp_Pnt

Return
-------
None

Description
-----------
Creates a plane passing through three points. 
Input parameter: theP1 first point 
Input parameter: theP2 second point 
Input parameter: theP3 third point @note Construction fails when points are confused/collinear.
") GC_MakePlane;
		 GC_MakePlane(const gp_Pnt & theP1, const gp_Pnt & theP2, const gp_Pnt & theP3);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: 903b6aacbff007fda5dadcd5947a6b0d ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1

Return
-------
None

Description
-----------
Creates a plane through axis location and normal to axis direction. 
Input parameter: theAxis axis defining location and normal.
") GC_MakePlane;
		 GC_MakePlane(const gp_Ax1 & theAxis);

		/****** GC_MakePlane::Value ******/
		/****** md5 signature: 2bfa538a32a02e39c814ddb436054f45 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Returns the constructed plane. Exceptions StdFail_NotDone if no plane is constructed. 
Return: resulting plane.
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
		/****** md5 signature: 6e50d9269c4fa4567d204625ead9c3ec ******/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Creates a segment of a line from two points. 
Input parameter: theP1 first point 
Input parameter: theP2 second point @note Construction fails if the two points are coincident.
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** GC_MakeSegment::GC_MakeSegment ******/
		/****** md5 signature: f703bd13e6409c528f590dd9b766a1b3 ******/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin
theU1: double
theU2: double

Return
-------
None

Description
-----------
Creates a segment of the input line between two parameters. 
Input parameter: theLine source line 
Input parameter: theU1 first parameter 
Input parameter: theU2 second parameter @note Construction fails when both parameters are equal.
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Lin & theLine, const double theU1, const double theU2);

		/****** GC_MakeSegment::GC_MakeSegment ******/
		/****** md5 signature: 880e640f388d0735e23290db29b70118 ******/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin
thePoint: gp_Pnt
theUlast: double

Return
-------
None

Description
-----------
Creates a segment of the input line between a point and a parameter. 
Input parameter: theLine source line 
Input parameter: thePoint start point on line 
Input parameter: theUlast end parameter @note Construction fails if trimming parameters are equal.
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Lin & theLine, const gp_Pnt & thePoint, const double theUlast);

		/****** GC_MakeSegment::GC_MakeSegment ******/
		/****** md5 signature: 2a2d816f41d26f6bbdc2048e5e196877 ******/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Creates a segment of the input line between two points. 
Input parameter: theLine source line 
Input parameter: theP1 first point 
Input parameter: theP2 second point @note Construction fails if trimming parameters are equal.
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Lin & theLine, const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****** GC_MakeSegment::Value ******/
		/****** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the constructed line segment. 
Return: resulting line segment.
") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value();

};


%extend GC_MakeSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GC_MakeSegment2d *
*************************/
class GC_MakeSegment2d : public GC_Root {
	public:
		/****** GC_MakeSegment2d::GC_MakeSegment2d ******/
		/****** md5 signature: 1fe61bdcb4f31ee4878ee09ff09accf1 ******/
		%feature("compactdefaultargs") GC_MakeSegment2d;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a segment between two points. 
Input parameter: theP1 first point 
Input parameter: theP2 second point @note Construction fails with `gce_ConfusedPoints` if points are coincident.
") GC_MakeSegment2d;
		 GC_MakeSegment2d(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** GC_MakeSegment2d::GC_MakeSegment2d ******/
		/****** md5 signature: d1d869c9f47bff6878dbe90b48b5ba25 ******/
		%feature("compactdefaultargs") GC_MakeSegment2d;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theV: gp_Dir2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a segment on a line defined by point and direction. The segment starts at `theP1` and ends at the orthogonal projection of `theP2` onto that line. 
Input parameter: theP1 first point 
Input parameter: theV direction vector 
Input parameter: theP2 second point @note Construction fails with `gce_ConfusedPoints` if the projected endpoint is coincident with `theP1` within resolution.
") GC_MakeSegment2d;
		 GC_MakeSegment2d(const gp_Pnt2d & theP1, const gp_Dir2d & theV, const gp_Pnt2d & theP2);

		/****** GC_MakeSegment2d::GC_MakeSegment2d ******/
		/****** md5 signature: 2804709fa4c620814a42c3be5744474c ******/
		%feature("compactdefaultargs") GC_MakeSegment2d;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin2d
theU1: double
theU2: double

Return
-------
None

Description
-----------
Creates a segment on a line between two parameter values. 
Input parameter: theLine source line 
Input parameter: theU1 first parameter 
Input parameter: theU2 second parameter.
") GC_MakeSegment2d;
		 GC_MakeSegment2d(const gp_Lin2d & theLine, const double theU1, const double theU2);

		/****** GC_MakeSegment2d::GC_MakeSegment2d ******/
		/****** md5 signature: 4c7ddaf24fb013db4ce7949d6540a1d7 ******/
		%feature("compactdefaultargs") GC_MakeSegment2d;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin2d
thePoint: gp_Pnt2d
theUlast: double

Return
-------
None

Description
-----------
Creates a segment on a line between point parameter and target parameter. 
Input parameter: theLine source line 
Input parameter: thePoint first point on segment support line 
Input parameter: theUlast last parameter.
") GC_MakeSegment2d;
		 GC_MakeSegment2d(const gp_Lin2d & theLine, const gp_Pnt2d & thePoint, const double theUlast);

		/****** GC_MakeSegment2d::GC_MakeSegment2d ******/
		/****** md5 signature: 365558f1a48aaf1d82675dd12a63019a ******/
		%feature("compactdefaultargs") GC_MakeSegment2d;
		%feature("autodoc", "
Parameters
----------
theLine: gp_Lin2d
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a segment on a line between projections of two points. 
Input parameter: theLine source line 
Input parameter: theP1 first point 
Input parameter: theP2 second point.
") GC_MakeSegment2d;
		 GC_MakeSegment2d(const gp_Lin2d & theLine, const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****** GC_MakeSegment2d::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the constructed line segment. Exceptions StdFail_NotDone if no line segment is constructed. 
Return: resulting trimmed curve.
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend GC_MakeSegment2d {
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
		/****** md5 signature: b009c4d80756c4986ad33a57ba360216 ******/
		%feature("compactdefaultargs") GC_MakeTrimmedCone;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt
theP3: gp_Pnt
theP4: gp_Pnt

Return
-------
None

Description
-----------
Creates a rectangular trimmed conical surface from four points. 
Input parameter: theP1 first axis point 
Input parameter: theP2 second axis point 
Input parameter: theP3 point defining first trimming section 
Input parameter: theP4 point defining second trimming section @note The surface is trimmed by points P3 and P4. @note The axis is defined by points P1 and P2; the base radius is the distance from point P3 to that axis. @note The distance from point P4 to that axis is the radius of the section passing through P4. @note Construction fails if points P1, P2, P3 and P4 are collinear, or if vector P3P4 is perpendicular/collinear to vector P1P2.
") GC_MakeTrimmedCone;
		 GC_MakeTrimmedCone(const gp_Pnt & theP1, const gp_Pnt & theP2, const gp_Pnt & theP3, const gp_Pnt & theP4);

		/****** GC_MakeTrimmedCone::GC_MakeTrimmedCone ******/
		/****** md5 signature: b9789cafe9621982db5c1853ffe885c3 ******/
		%feature("compactdefaultargs") GC_MakeTrimmedCone;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt
theR1: double
theR2: double

Return
-------
None

Description
-----------
Creates a rectangular trimmed conical surface from two points and two radii. 
Input parameter: theP1 first axis point 
Input parameter: theP2 second axis point 
Input parameter: theR1 radius at P1 
Input parameter: theR2 radius at P2 @note The two radii correspond to sections passing through the two axis points. @note On failure, status is propagated from `GC_MakeConicalSurface(theP1, theP2, theR1, theR2)`.
") GC_MakeTrimmedCone;
		 GC_MakeTrimmedCone(const gp_Pnt & theP1, const gp_Pnt & theP2, const double theR1, const double theR2);

		/****** GC_MakeTrimmedCone::Value ******/
		/****** md5 signature: f107db51d7a8f6cc0f22e8dcf1ab2f34 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_RectangularTrimmedSurface>

Description
-----------
Returns the constructed trimmed cone. StdFail_NotDone if no trimmed cone is constructed. 
Return: resulting trimmed conical surface.
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
		/****** md5 signature: 7743527d3bf2427d8aba06d5d34b2163 ******/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt
theP3: gp_Pnt

Return
-------
None

Description
-----------
Creates a trimmed cylindrical surface from three points. 
Input parameter: theP1 first axis point 
Input parameter: theP2 second axis point 
Input parameter: theP3 point defining radius @note The axis is the line passing through `theP1` and `theP2`. @note The radius is the distance from `theP3` to that axis. @note The height is the distance between `theP1` and `theP2`.
") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder(const gp_Pnt & theP1, const gp_Pnt & theP2, const gp_Pnt & theP3);

		/****** GC_MakeTrimmedCylinder::GC_MakeTrimmedCylinder ******/
		/****** md5 signature: 26182e8f196bef1a9125a5a7e7da8c60 ******/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "
Parameters
----------
theCirc: gp_Circ
theHeight: double

Return
-------
None

Description
-----------
Creates a trimmed cylindrical surface from a base circle and height. 
Input parameter: theCirc base circle 
Input parameter: theHeight trimming height @note The axis is the normal to the plane defined by `theCirc`. @note `theHeight` can be positive or negative. @note If `theHeight` is positive, the V parametric direction of result has the same orientation as the normal to `theCirc`. @note If `theHeight` is negative, it has the opposite orientation.
") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder(const gp_Circ & theCirc, const double theHeight);

		/****** GC_MakeTrimmedCylinder::GC_MakeTrimmedCylinder ******/
		/****** md5 signature: a97e230edc1921fcbbce6039ce080c93 ******/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theRadius: double
theHeight: double

Return
-------
None

Description
-----------
Creates a trimmed cylindrical surface from axis, radius and height. 
Input parameter: theA1 cylinder axis 
Input parameter: theRadius cylinder radius 
Input parameter: theHeight trimming height @note Status is `gce_NegativeRadius` if `theRadius` is less than zero. @note `theHeight` can be positive or negative. @note If `theHeight` is positive, the V parametric direction of result has the same orientation as `theA1`. @note If `theHeight` is negative, it has the opposite orientation.
") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder(const gp_Ax1 & theA1, const double theRadius, const double theHeight);

		/****** GC_MakeTrimmedCylinder::Value ******/
		/****** md5 signature: f107db51d7a8f6cc0f22e8dcf1ab2f34 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_RectangularTrimmedSurface>

Description
-----------
Returns the constructed trimmed cylinder. Exceptions StdFail_NotDone if no trimmed cylinder is constructed. 
Return: resulting trimmed cylindrical surface.
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
