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
%define GEOMTOSTEPDOCSTRING
"GeomToStep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomtostep.html"
%enddef
%module (package="OCC.Core", docstring=GEOMTOSTEPDOCSTRING) GeomToStep


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
#include<GeomToStep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<StepGeom_module.hxx>
#include<TColgp_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<StepRepr_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<MoniTool_module.hxx>
#include<StepElement_module.hxx>
#include<Interface_module.hxx>
#include<StepData_module.hxx>
#include<StepShape_module.hxx>
#include<TopoDS_module.hxx>
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
%import StepGeom.i
%import TColgp.i

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

/************************
* class GeomToStep_Root *
************************/
class GeomToStep_Root {
	public:
		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

};


%extend GeomToStep_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomToStep_MakeAxis1Placement *
**************************************/
class GeomToStep_MakeAxis1Placement : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeAxis1Placement ******************/
		/**** md5 signature: 2be8f824a962cb6b1a88fffde17c4d5d ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax1

Returns
-------
None
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement(const gp_Ax1 & A);

		/****************** GeomToStep_MakeAxis1Placement ******************/
		/**** md5 signature: a58bb2cefdafd6b258e8b0fd4ada4284 ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement(const gp_Ax2d & A);

		/****************** GeomToStep_MakeAxis1Placement ******************/
		/**** md5 signature: 92f79e539c570438f8a1cfd093a71d04 ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Geom_Axis1Placement

Returns
-------
None
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement(const opencascade::handle<Geom_Axis1Placement> & A);

		/****************** GeomToStep_MakeAxis1Placement ******************/
		/**** md5 signature: 29a48684c1f93bd4b0344358159941c0 ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Geom2d_AxisPlacement

Returns
-------
None
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement(const opencascade::handle<Geom2d_AxisPlacement> & A);

		/****************** Value ******************/
		/**** md5 signature: 826c238a515cde09bfad20f8cb8f997e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Value;
		const opencascade::handle<StepGeom_Axis1Placement> & Value();

};


%extend GeomToStep_MakeAxis1Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class GeomToStep_MakeAxis2Placement2d *
****************************************/
class GeomToStep_MakeAxis2Placement2d : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeAxis2Placement2d ******************/
		/**** md5 signature: 27498f5c01a30d6939af2f37d54f81ec ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2

Returns
-------
None
") GeomToStep_MakeAxis2Placement2d;
		 GeomToStep_MakeAxis2Placement2d(const gp_Ax2 & A);

		/****************** GeomToStep_MakeAxis2Placement2d ******************/
		/**** md5 signature: fd0402e25d800a7748f244fbd2f7180d ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax22d

Returns
-------
None
") GeomToStep_MakeAxis2Placement2d;
		 GeomToStep_MakeAxis2Placement2d(const gp_Ax22d & A);

		/****************** Value ******************/
		/**** md5 signature: fd6775dac4f45bf86ed16a2db3a9ab0e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis2Placement2d>
") Value;
		const opencascade::handle<StepGeom_Axis2Placement2d> & Value();

};


%extend GeomToStep_MakeAxis2Placement2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class GeomToStep_MakeAxis2Placement3d *
****************************************/
class GeomToStep_MakeAxis2Placement3d : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		/**** md5 signature: 7a4344d98382d4c2cc25e0e5690d27b3 ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d();

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		/**** md5 signature: 1e6071e6ee5aedc6a5dd7219e9cdb342 ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2

Returns
-------
None
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d(const gp_Ax2 & A);

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		/**** md5 signature: bc58ab37e147cb21d1f2726d891efdbe ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax3

Returns
-------
None
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d(const gp_Ax3 & A);

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		/**** md5 signature: 589afaf1d1580dd5c7a50dff532ae9e1 ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d(const gp_Trsf & T);

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		/**** md5 signature: f53a75001b9afa02e522665f22736f6e ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Geom_Axis2Placement

Returns
-------
None
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d(const opencascade::handle<Geom_Axis2Placement> & A);

		/****************** Value ******************/
		/**** md5 signature: f95f278cf626b19b259b48adafc008bb ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis2Placement3d>
") Value;
		const opencascade::handle<StepGeom_Axis2Placement3d> & Value();

};


%extend GeomToStep_MakeAxis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class GeomToStep_MakeBSplineCurveWithKnots *
*********************************************/
class GeomToStep_MakeBSplineCurveWithKnots : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBSplineCurveWithKnots ******************/
		/**** md5 signature: 210a890e52b1c00aaf4c5a9276785534 ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
Bsplin: Geom_BSplineCurve

Returns
-------
None
") GeomToStep_MakeBSplineCurveWithKnots;
		 GeomToStep_MakeBSplineCurveWithKnots(const opencascade::handle<Geom_BSplineCurve> & Bsplin);

		/****************** GeomToStep_MakeBSplineCurveWithKnots ******************/
		/**** md5 signature: d537c0e07f2366b24f08cf903b9c169c ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
Bsplin: Geom2d_BSplineCurve

Returns
-------
None
") GeomToStep_MakeBSplineCurveWithKnots;
		 GeomToStep_MakeBSplineCurveWithKnots(const opencascade::handle<Geom2d_BSplineCurve> & Bsplin);

		/****************** Value ******************/
		/**** md5 signature: 1b731bf635b8e50fa67b95f0d582d03d ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_BSplineCurveWithKnots>
") Value;
		const opencascade::handle<StepGeom_BSplineCurveWithKnots> & Value();

};


%extend GeomToStep_MakeBSplineCurveWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve *
********************************************************************/
class GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve ******************/
		/**** md5 signature: 4f5e961efdc1af524431baafb60995fd ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Bsplin: Geom_BSplineCurve

Returns
-------
None
") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		 GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & Bsplin);

		/****************** GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve ******************/
		/**** md5 signature: 10e0b7e94adc782cdcda1fe04867b9a4 ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Bsplin: Geom2d_BSplineCurve

Returns
-------
None
") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		 GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & Bsplin);

		/****************** Value ******************/
		/**** md5 signature: 84cd9e1e595173cabf00e66c8bef9b60 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve>
") Value;
		const opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> & Value();

};


%extend GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class GeomToStep_MakeBSplineSurfaceWithKnots *
***********************************************/
class GeomToStep_MakeBSplineSurfaceWithKnots : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBSplineSurfaceWithKnots ******************/
		/**** md5 signature: 1212fbf8350b3a81384a4de7af90542a ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineSurfaceWithKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
Bsplin: Geom_BSplineSurface

Returns
-------
None
") GeomToStep_MakeBSplineSurfaceWithKnots;
		 GeomToStep_MakeBSplineSurfaceWithKnots(const opencascade::handle<Geom_BSplineSurface> & Bsplin);

		/****************** Value ******************/
		/**** md5 signature: 27aae6d778ee1370363b372f4d752e4e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_BSplineSurfaceWithKnots>
") Value;
		const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & Value();

};


%extend GeomToStep_MakeBSplineSurfaceWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************
* class GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface *
************************************************************************/
class GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface ******************/
		/**** md5 signature: 48b898d7712754710ad00a9af275c9f6 ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
Bsplin: Geom_BSplineSurface

Returns
-------
None
") GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		 GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & Bsplin);

		/****************** Value ******************/
		/**** md5 signature: a06321cb9eb199bcc8e3c8ede0e3269e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface>
") Value;
		const opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> & Value();

};


%extend GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomToStep_MakeBoundedCurve *
************************************/
class GeomToStep_MakeBoundedCurve : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBoundedCurve ******************/
		/**** md5 signature: 7283eca7730952f397fc6a12bec57062 ****/
		%feature("compactdefaultargs") GeomToStep_MakeBoundedCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_BoundedCurve

Returns
-------
None
") GeomToStep_MakeBoundedCurve;
		 GeomToStep_MakeBoundedCurve(const opencascade::handle<Geom_BoundedCurve> & C);

		/****************** GeomToStep_MakeBoundedCurve ******************/
		/**** md5 signature: 303d93fb16e69b6e25d1aff1b7d80702 ****/
		%feature("compactdefaultargs") GeomToStep_MakeBoundedCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_BoundedCurve

Returns
-------
None
") GeomToStep_MakeBoundedCurve;
		 GeomToStep_MakeBoundedCurve(const opencascade::handle<Geom2d_BoundedCurve> & C);

		/****************** Value ******************/
		/**** md5 signature: 693482260abb67f388c20546bc0d24b2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_BoundedCurve>
") Value;
		const opencascade::handle<StepGeom_BoundedCurve> & Value();

};


%extend GeomToStep_MakeBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomToStep_MakeBoundedSurface *
**************************************/
class GeomToStep_MakeBoundedSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBoundedSurface ******************/
		/**** md5 signature: 988748bc048bb20959f60b246582955d ****/
		%feature("compactdefaultargs") GeomToStep_MakeBoundedSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_BoundedSurface

Returns
-------
None
") GeomToStep_MakeBoundedSurface;
		 GeomToStep_MakeBoundedSurface(const opencascade::handle<Geom_BoundedSurface> & C);

		/****************** Value ******************/
		/**** md5 signature: 9a92c08dbdf434f48685da487d3d28f3 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_BoundedSurface>
") Value;
		const opencascade::handle<StepGeom_BoundedSurface> & Value();

};


%extend GeomToStep_MakeBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomToStep_MakeCartesianPoint *
**************************************/
class GeomToStep_MakeCartesianPoint : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeCartesianPoint ******************/
		/**** md5 signature: b84c42af67a942cd68844ada4930e745 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint(const gp_Pnt & P);

		/****************** GeomToStep_MakeCartesianPoint ******************/
		/**** md5 signature: c9724ae97bba9639960007cf82bd31a4 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint(const gp_Pnt2d & P);

		/****************** GeomToStep_MakeCartesianPoint ******************/
		/**** md5 signature: 3daa8f2f1ee05d547e89a0fc9872b000 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Geom_CartesianPoint

Returns
-------
None
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint(const opencascade::handle<Geom_CartesianPoint> & P);

		/****************** GeomToStep_MakeCartesianPoint ******************/
		/**** md5 signature: b0da04ef2617163db5aa8dbb8c5d5fb6 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Geom2d_CartesianPoint

Returns
-------
None
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint(const opencascade::handle<Geom2d_CartesianPoint> & P);

		/****************** Value ******************/
		/**** md5 signature: 4267ef48ebaa9e0394a78b27f265c6a7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_CartesianPoint>
") Value;
		const opencascade::handle<StepGeom_CartesianPoint> & Value();

};


%extend GeomToStep_MakeCartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomToStep_MakeCircle *
******************************/
class GeomToStep_MakeCircle : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeCircle ******************/
		/**** md5 signature: 2f72f8e3f08a90ffd0270a7dfbb23caa ****/
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ

Returns
-------
None
") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle(const gp_Circ & C);

		/****************** GeomToStep_MakeCircle ******************/
		/**** md5 signature: 054957a79af67bdf132c9cf0a6d3cb01 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Circle

Returns
-------
None
") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle(const opencascade::handle<Geom_Circle> & C);

		/****************** GeomToStep_MakeCircle ******************/
		/**** md5 signature: b341801ea270536e460f9dd39243b0e8 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Circle

Returns
-------
None
") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle(const opencascade::handle<Geom2d_Circle> & C);

		/****************** Value ******************/
		/**** md5 signature: 80089f77380b5fe8369810effae824ea ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Circle>
") Value;
		const opencascade::handle<StepGeom_Circle> & Value();

};


%extend GeomToStep_MakeCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomToStep_MakeConic *
*****************************/
class GeomToStep_MakeConic : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeConic ******************/
		/**** md5 signature: e70a236489a0090f7f6fa70f4a394742 ****/
		%feature("compactdefaultargs") GeomToStep_MakeConic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Conic

Returns
-------
None
") GeomToStep_MakeConic;
		 GeomToStep_MakeConic(const opencascade::handle<Geom_Conic> & C);

		/****************** GeomToStep_MakeConic ******************/
		/**** md5 signature: 9a02438248377454c678f7339834ec89 ****/
		%feature("compactdefaultargs") GeomToStep_MakeConic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Conic

Returns
-------
None
") GeomToStep_MakeConic;
		 GeomToStep_MakeConic(const opencascade::handle<Geom2d_Conic> & C);

		/****************** Value ******************/
		/**** md5 signature: a33da9e5838fbe8136b90f4da4466085 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Conic>
") Value;
		const opencascade::handle<StepGeom_Conic> & Value();

};


%extend GeomToStep_MakeConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomToStep_MakeConicalSurface *
**************************************/
class GeomToStep_MakeConicalSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeConicalSurface ******************/
		/**** md5 signature: a605217ad4f974056fcce09709a7c684 ****/
		%feature("compactdefaultargs") GeomToStep_MakeConicalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
CSurf: Geom_ConicalSurface

Returns
-------
None
") GeomToStep_MakeConicalSurface;
		 GeomToStep_MakeConicalSurface(const opencascade::handle<Geom_ConicalSurface> & CSurf);

		/****************** Value ******************/
		/**** md5 signature: 9b07229bd79c88714b08af93e4f07fc7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_ConicalSurface>
") Value;
		const opencascade::handle<StepGeom_ConicalSurface> & Value();

};


%extend GeomToStep_MakeConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomToStep_MakeCurve *
*****************************/
class GeomToStep_MakeCurve : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeCurve ******************/
		/**** md5 signature: bb5255f68512c92d4883862ecc54c574 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") GeomToStep_MakeCurve;
		 GeomToStep_MakeCurve(const opencascade::handle<Geom_Curve> & C);

		/****************** GeomToStep_MakeCurve ******************/
		/**** md5 signature: 5ab1fc83eedad28e334ebf0132972fe5 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") GeomToStep_MakeCurve;
		 GeomToStep_MakeCurve(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Value ******************/
		/**** md5 signature: 90c4cf738d09355ed37f8d102747f878 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Curve>
") Value;
		const opencascade::handle<StepGeom_Curve> & Value();

};


%extend GeomToStep_MakeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class GeomToStep_MakeCylindricalSurface *
******************************************/
class GeomToStep_MakeCylindricalSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeCylindricalSurface ******************/
		/**** md5 signature: 375d2cf6afe8574c544c249abc20cc8b ****/
		%feature("compactdefaultargs") GeomToStep_MakeCylindricalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
CSurf: Geom_CylindricalSurface

Returns
-------
None
") GeomToStep_MakeCylindricalSurface;
		 GeomToStep_MakeCylindricalSurface(const opencascade::handle<Geom_CylindricalSurface> & CSurf);

		/****************** Value ******************/
		/**** md5 signature: 786ce73042a06c87aa97211d7cddaa97 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_CylindricalSurface>
") Value;
		const opencascade::handle<StepGeom_CylindricalSurface> & Value();

};


%extend GeomToStep_MakeCylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomToStep_MakeDirection *
*********************************/
class GeomToStep_MakeDirection : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeDirection ******************/
		/**** md5 signature: cd6f3627647a25f39e7cd02cb2da0708 ****/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
D: gp_Dir

Returns
-------
None
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection(const gp_Dir & D);

		/****************** GeomToStep_MakeDirection ******************/
		/**** md5 signature: 22eee7671784cb208760ec9a25398be3 ****/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
D: gp_Dir2d

Returns
-------
None
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection(const gp_Dir2d & D);

		/****************** GeomToStep_MakeDirection ******************/
		/**** md5 signature: d0999eb55968c79daf96fa39ee4c5161 ****/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
D: Geom_Direction

Returns
-------
None
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection(const opencascade::handle<Geom_Direction> & D);

		/****************** GeomToStep_MakeDirection ******************/
		/**** md5 signature: 6a6448596cba670b8dea600c490f7ac0 ****/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
D: Geom2d_Direction

Returns
-------
None
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection(const opencascade::handle<Geom2d_Direction> & D);

		/****************** Value ******************/
		/**** md5 signature: 6d10c3e670b015320b814ad7d6ea2599 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Direction>
") Value;
		const opencascade::handle<StepGeom_Direction> & Value();

};


%extend GeomToStep_MakeDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class GeomToStep_MakeElementarySurface *
*****************************************/
class GeomToStep_MakeElementarySurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeElementarySurface ******************/
		/**** md5 signature: 3ae7c5ba754dffe8799cf7091b3ff3b8 ****/
		%feature("compactdefaultargs") GeomToStep_MakeElementarySurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_ElementarySurface

Returns
-------
None
") GeomToStep_MakeElementarySurface;
		 GeomToStep_MakeElementarySurface(const opencascade::handle<Geom_ElementarySurface> & S);

		/****************** Value ******************/
		/**** md5 signature: 56d8a982bff3e047141a1101fca174b2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_ElementarySurface>
") Value;
		const opencascade::handle<StepGeom_ElementarySurface> & Value();

};


%extend GeomToStep_MakeElementarySurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomToStep_MakeEllipse *
*******************************/
class GeomToStep_MakeEllipse : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeEllipse ******************/
		/**** md5 signature: 82e5696ac668fe1810c6d1631e6fad8e ****/
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Elips

Returns
-------
None
") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse(const gp_Elips & C);

		/****************** GeomToStep_MakeEllipse ******************/
		/**** md5 signature: 252c59426b9164facf44fb4426fd8625 ****/
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Ellipse

Returns
-------
None
") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse(const opencascade::handle<Geom_Ellipse> & C);

		/****************** GeomToStep_MakeEllipse ******************/
		/**** md5 signature: ae5ce1e20a27e1c70df10153d750bc22 ****/
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Ellipse

Returns
-------
None
") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse(const opencascade::handle<Geom2d_Ellipse> & C);

		/****************** Value ******************/
		/**** md5 signature: 033062f99ca07e5b0fd30154d26db816 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Ellipse>
") Value;
		const opencascade::handle<StepGeom_Ellipse> & Value();

};


%extend GeomToStep_MakeEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomToStep_MakeHyperbola *
*********************************/
class GeomToStep_MakeHyperbola : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeHyperbola ******************/
		/**** md5 signature: 9fe54c9565e13d698d6a49268ae2f1af ****/
		%feature("compactdefaultargs") GeomToStep_MakeHyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Hyperbola

Returns
-------
None
") GeomToStep_MakeHyperbola;
		 GeomToStep_MakeHyperbola(const opencascade::handle<Geom2d_Hyperbola> & C);

		/****************** GeomToStep_MakeHyperbola ******************/
		/**** md5 signature: 3d11cabd65320649f6557be1f82d054e ****/
		%feature("compactdefaultargs") GeomToStep_MakeHyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Hyperbola

Returns
-------
None
") GeomToStep_MakeHyperbola;
		 GeomToStep_MakeHyperbola(const opencascade::handle<Geom_Hyperbola> & C);

		/****************** Value ******************/
		/**** md5 signature: 6c6adecb4fa9565b161e019885d473e4 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Hyperbola>
") Value;
		const opencascade::handle<StepGeom_Hyperbola> & Value();

};


%extend GeomToStep_MakeHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomToStep_MakeLine *
****************************/
class GeomToStep_MakeLine : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeLine ******************/
		/**** md5 signature: c0d438af1b02bfde7a1c8bc592d78786 ****/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine(const gp_Lin & L);

		/****************** GeomToStep_MakeLine ******************/
		/**** md5 signature: 62858f7baad50458662c2c8c9a4271fc ****/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d

Returns
-------
None
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine(const gp_Lin2d & L);

		/****************** GeomToStep_MakeLine ******************/
		/**** md5 signature: 6e42c7ff1cd6a03a6464642c511baf9f ****/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Line

Returns
-------
None
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine(const opencascade::handle<Geom_Line> & C);

		/****************** GeomToStep_MakeLine ******************/
		/**** md5 signature: 18dc6ae6195e56950b2df26c102a4d9c ****/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Line

Returns
-------
None
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine(const opencascade::handle<Geom2d_Line> & C);

		/****************** Value ******************/
		/**** md5 signature: 1b26fd610fca6c8f1a6698b83ca8a479 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Line>
") Value;
		const opencascade::handle<StepGeom_Line> & Value();

};


%extend GeomToStep_MakeLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomToStep_MakeParabola *
********************************/
class GeomToStep_MakeParabola : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeParabola ******************/
		/**** md5 signature: 4a64d084dd41af3e709cad5b2dd9fac9 ****/
		%feature("compactdefaultargs") GeomToStep_MakeParabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Parabola

Returns
-------
None
") GeomToStep_MakeParabola;
		 GeomToStep_MakeParabola(const opencascade::handle<Geom2d_Parabola> & C);

		/****************** GeomToStep_MakeParabola ******************/
		/**** md5 signature: 92261bd165f609d286ca0b65571c5e52 ****/
		%feature("compactdefaultargs") GeomToStep_MakeParabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Parabola

Returns
-------
None
") GeomToStep_MakeParabola;
		 GeomToStep_MakeParabola(const opencascade::handle<Geom_Parabola> & C);

		/****************** Value ******************/
		/**** md5 signature: a296c7ec9f53c22a518a48499f61ba32 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Parabola>
") Value;
		const opencascade::handle<StepGeom_Parabola> & Value();

};


%extend GeomToStep_MakeParabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomToStep_MakePlane *
*****************************/
class GeomToStep_MakePlane : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakePlane ******************/
		/**** md5 signature: 801d7a1779d49353a51b11a3fa85948b ****/
		%feature("compactdefaultargs") GeomToStep_MakePlane;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pln

Returns
-------
None
") GeomToStep_MakePlane;
		 GeomToStep_MakePlane(const gp_Pln & P);

		/****************** GeomToStep_MakePlane ******************/
		/**** md5 signature: f561c716e53a19d27e87e2c79df516c0 ****/
		%feature("compactdefaultargs") GeomToStep_MakePlane;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Geom_Plane

Returns
-------
None
") GeomToStep_MakePlane;
		 GeomToStep_MakePlane(const opencascade::handle<Geom_Plane> & P);

		/****************** Value ******************/
		/**** md5 signature: 9f597b4134bcd4a7e61386b3204aac13 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Plane>
") Value;
		const opencascade::handle<StepGeom_Plane> & Value();

};


%extend GeomToStep_MakePlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomToStep_MakePolyline *
********************************/
class GeomToStep_MakePolyline : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakePolyline ******************/
		/**** md5 signature: 3f26012995f4cb3329c4614f1b3afdc7 ****/
		%feature("compactdefaultargs") GeomToStep_MakePolyline;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TColgp_Array1OfPnt

Returns
-------
None
") GeomToStep_MakePolyline;
		 GeomToStep_MakePolyline(const TColgp_Array1OfPnt & P);

		/****************** GeomToStep_MakePolyline ******************/
		/**** md5 signature: c6f282f72e4c9bb53965b191d5d67ad9 ****/
		%feature("compactdefaultargs") GeomToStep_MakePolyline;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TColgp_Array1OfPnt2d

Returns
-------
None
") GeomToStep_MakePolyline;
		 GeomToStep_MakePolyline(const TColgp_Array1OfPnt2d & P);

		/****************** Value ******************/
		/**** md5 signature: 7a62b6b5beb908aa8df3a455e1d0bf50 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Polyline>
") Value;
		const opencascade::handle<StepGeom_Polyline> & Value();

};


%extend GeomToStep_MakePolyline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class GeomToStep_MakeRectangularTrimmedSurface *
*************************************************/
class GeomToStep_MakeRectangularTrimmedSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeRectangularTrimmedSurface ******************/
		/**** md5 signature: 0fd8d8ad2b2ee1581aee4db6ce450c1c ****/
		%feature("compactdefaultargs") GeomToStep_MakeRectangularTrimmedSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
RTSurf: Geom_RectangularTrimmedSurface

Returns
-------
None
") GeomToStep_MakeRectangularTrimmedSurface;
		 GeomToStep_MakeRectangularTrimmedSurface(const opencascade::handle<Geom_RectangularTrimmedSurface> & RTSurf);

		/****************** Value ******************/
		/**** md5 signature: 7004b5c6ee1fa69dbdca41030ebbbde0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_RectangularTrimmedSurface>
") Value;
		const opencascade::handle<StepGeom_RectangularTrimmedSurface> & Value();

};


%extend GeomToStep_MakeRectangularTrimmedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class GeomToStep_MakeSphericalSurface *
****************************************/
class GeomToStep_MakeSphericalSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeSphericalSurface ******************/
		/**** md5 signature: 7d10a064d2201c8a0f97bec76ff0ebdd ****/
		%feature("compactdefaultargs") GeomToStep_MakeSphericalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
CSurf: Geom_SphericalSurface

Returns
-------
None
") GeomToStep_MakeSphericalSurface;
		 GeomToStep_MakeSphericalSurface(const opencascade::handle<Geom_SphericalSurface> & CSurf);

		/****************** Value ******************/
		/**** md5 signature: 5c4c96e28e4a9a68a945fed65f098946 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_SphericalSurface>
") Value;
		const opencascade::handle<StepGeom_SphericalSurface> & Value();

};


%extend GeomToStep_MakeSphericalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomToStep_MakeSurface *
*******************************/
class GeomToStep_MakeSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeSurface ******************/
		/**** md5 signature: afcc0b60b6e657ec82f3d473b6933d85 ****/
		%feature("compactdefaultargs") GeomToStep_MakeSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Surface

Returns
-------
None
") GeomToStep_MakeSurface;
		 GeomToStep_MakeSurface(const opencascade::handle<Geom_Surface> & C);

		/****************** Value ******************/
		/**** md5 signature: 244a35854a6e95acd7c5691913295e49 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Surface>
") Value;
		const opencascade::handle<StepGeom_Surface> & Value();

};


%extend GeomToStep_MakeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class GeomToStep_MakeSurfaceOfLinearExtrusion *
************************************************/
class GeomToStep_MakeSurfaceOfLinearExtrusion : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeSurfaceOfLinearExtrusion ******************/
		/**** md5 signature: abd84c0b21f04083d774a8b035cdac68 ****/
		%feature("compactdefaultargs") GeomToStep_MakeSurfaceOfLinearExtrusion;
		%feature("autodoc", "No available documentation.

Parameters
----------
CSurf: Geom_SurfaceOfLinearExtrusion

Returns
-------
None
") GeomToStep_MakeSurfaceOfLinearExtrusion;
		 GeomToStep_MakeSurfaceOfLinearExtrusion(const opencascade::handle<Geom_SurfaceOfLinearExtrusion> & CSurf);

		/****************** Value ******************/
		/**** md5 signature: 312250b48ce2d90238af05ea19c0f830 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_SurfaceOfLinearExtrusion>
") Value;
		const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & Value();

};


%extend GeomToStep_MakeSurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class GeomToStep_MakeSurfaceOfRevolution *
*******************************************/
class GeomToStep_MakeSurfaceOfRevolution : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeSurfaceOfRevolution ******************/
		/**** md5 signature: 49401a986d9bd656e7d32899600ba573 ****/
		%feature("compactdefaultargs") GeomToStep_MakeSurfaceOfRevolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
RevSurf: Geom_SurfaceOfRevolution

Returns
-------
None
") GeomToStep_MakeSurfaceOfRevolution;
		 GeomToStep_MakeSurfaceOfRevolution(const opencascade::handle<Geom_SurfaceOfRevolution> & RevSurf);

		/****************** Value ******************/
		/**** md5 signature: f69be605fb08041e2f817b56da3c4768 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_SurfaceOfRevolution>
") Value;
		const opencascade::handle<StepGeom_SurfaceOfRevolution> & Value();

};


%extend GeomToStep_MakeSurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomToStep_MakeSweptSurface *
************************************/
class GeomToStep_MakeSweptSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeSweptSurface ******************/
		/**** md5 signature: 79d0683fbea0a16815c3b58500ae6615 ****/
		%feature("compactdefaultargs") GeomToStep_MakeSweptSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_SweptSurface

Returns
-------
None
") GeomToStep_MakeSweptSurface;
		 GeomToStep_MakeSweptSurface(const opencascade::handle<Geom_SweptSurface> & S);

		/****************** Value ******************/
		/**** md5 signature: a0380db370203c91a9dc85d79a7b90c7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_SweptSurface>
") Value;
		const opencascade::handle<StepGeom_SweptSurface> & Value();

};


%extend GeomToStep_MakeSweptSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomToStep_MakeToroidalSurface *
***************************************/
class GeomToStep_MakeToroidalSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeToroidalSurface ******************/
		/**** md5 signature: 9ee36bfc74ac983ba8fa76b8725b8668 ****/
		%feature("compactdefaultargs") GeomToStep_MakeToroidalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
TorSurf: Geom_ToroidalSurface

Returns
-------
None
") GeomToStep_MakeToroidalSurface;
		 GeomToStep_MakeToroidalSurface(const opencascade::handle<Geom_ToroidalSurface> & TorSurf);

		/****************** Value ******************/
		/**** md5 signature: 2edf9d448c16344361dded7bf98b9bec ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_ToroidalSurface>
") Value;
		const opencascade::handle<StepGeom_ToroidalSurface> & Value();

};


%extend GeomToStep_MakeToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomToStep_MakeVector *
******************************/
class GeomToStep_MakeVector : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeVector ******************/
		/**** md5 signature: be046140949ec667a63e6fc65b19b27c ****/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec

Returns
-------
None
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector(const gp_Vec & V);

		/****************** GeomToStep_MakeVector ******************/
		/**** md5 signature: 110a72e0683080fbf82a32b632bf5e7e ****/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector(const gp_Vec2d & V);

		/****************** GeomToStep_MakeVector ******************/
		/**** md5 signature: 2c8b9414783e81a8713f29edf39b6afc ****/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: Geom_Vector

Returns
-------
None
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector(const opencascade::handle<Geom_Vector> & V);

		/****************** GeomToStep_MakeVector ******************/
		/**** md5 signature: 78475fac79df8750c18b0a8b4d95edcf ****/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: Geom2d_Vector

Returns
-------
None
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector(const opencascade::handle<Geom2d_Vector> & V);

		/****************** Value ******************/
		/**** md5 signature: 1d775fed97804779e81e2e206028af29 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Vector>
") Value;
		const opencascade::handle<StepGeom_Vector> & Value();

};


%extend GeomToStep_MakeVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
