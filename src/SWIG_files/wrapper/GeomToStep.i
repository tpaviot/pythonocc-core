/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_geomtostep.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i


%{
#include<GeomToStep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<StepData_module.hxx>
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
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import StepData.i
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

/************************
* class GeomToStep_Root *
************************/
class GeomToStep_Root {
	public:
		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
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
		/**** md5 signature: 23f2a720ef6a9ff46fccf01ef039010d ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax1
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement(const gp_Ax1 & A, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeAxis1Placement ******************/
		/**** md5 signature: 6a352872423705f883664707e9adf56c ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement(const gp_Ax2d & A, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeAxis1Placement ******************/
		/**** md5 signature: 12f19716b6c46af2ff8e6dd1b5cb8c98 ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "
Parameters
----------
A: Geom_Axis1Placement
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement(const opencascade::handle<Geom_Axis1Placement> & A, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeAxis1Placement ******************/
		/**** md5 signature: aa958acf9c1e205cc70bd93c519f72ba ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "
Parameters
----------
A: Geom2d_AxisPlacement
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement(const opencascade::handle<Geom2d_AxisPlacement> & A, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 826c238a515cde09bfad20f8cb8f997e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis1Placement>

Description
-----------
No available documentation.
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
		/**** md5 signature: 91cfaee62700f7fb0dba18448b931a94 ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement2d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis2Placement2d;
		 GeomToStep_MakeAxis2Placement2d(const gp_Ax2 & A, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeAxis2Placement2d ******************/
		/**** md5 signature: 5c3ac906770d613dd9242c3bb625f00d ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement2d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax22d
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis2Placement2d;
		 GeomToStep_MakeAxis2Placement2d(const gp_Ax22d & A, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: fd6775dac4f45bf86ed16a2db3a9ab0e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement2d>

Description
-----------
No available documentation.
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
		/**** md5 signature: 19d9a3ada51620a86dc7e908de37a18c ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "
Parameters
----------
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d(const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		/**** md5 signature: ed8aa9891cb80732968dd41849ea4572 ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d(const gp_Ax2 & A, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		/**** md5 signature: e2f6ac232af9d39883b4a8fec9440c2f ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax3
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d(const gp_Ax3 & A, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		/**** md5 signature: 6078a629914631707647428e102d195d ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d(const gp_Trsf & T, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		/**** md5 signature: 42b13374be48240aeb5830789486ed45 ****/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "
Parameters
----------
A: Geom_Axis2Placement
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d(const opencascade::handle<Geom_Axis2Placement> & A, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: f95f278cf626b19b259b48adafc008bb ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement3d>

Description
-----------
No available documentation.
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
		/**** md5 signature: bec85a435d922e4b3b46dfc98c36e6c8 ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnots;
		%feature("autodoc", "
Parameters
----------
Bsplin: Geom_BSplineCurve
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeBSplineCurveWithKnots;
		 GeomToStep_MakeBSplineCurveWithKnots(const opencascade::handle<Geom_BSplineCurve> & Bsplin, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeBSplineCurveWithKnots ******************/
		/**** md5 signature: e7fba3748d588484242892ad375ed7a9 ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnots;
		%feature("autodoc", "
Parameters
----------
Bsplin: Geom2d_BSplineCurve
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeBSplineCurveWithKnots;
		 GeomToStep_MakeBSplineCurveWithKnots(const opencascade::handle<Geom2d_BSplineCurve> & Bsplin, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 1b731bf635b8e50fa67b95f0d582d03d ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BSplineCurveWithKnots>

Description
-----------
No available documentation.
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
		/**** md5 signature: c9d8c32f8c827e1703c474b20b211ad7 ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "
Parameters
----------
Bsplin: Geom_BSplineCurve
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		 GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & Bsplin, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve ******************/
		/**** md5 signature: 01fde1523d35fa4a9b35556bd3f4d537 ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "
Parameters
----------
Bsplin: Geom2d_BSplineCurve
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		 GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & Bsplin, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 84cd9e1e595173cabf00e66c8bef9b60 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve>

Description
-----------
No available documentation.
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
		/**** md5 signature: e742c3889349bb47d4968ba413eed4de ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineSurfaceWithKnots;
		%feature("autodoc", "
Parameters
----------
Bsplin: Geom_BSplineSurface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeBSplineSurfaceWithKnots;
		 GeomToStep_MakeBSplineSurfaceWithKnots(const opencascade::handle<Geom_BSplineSurface> & Bsplin, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 27aae6d778ee1370363b372f4d752e4e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BSplineSurfaceWithKnots>

Description
-----------
No available documentation.
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
		/**** md5 signature: b291b4bf758b8b7d2f72668c8e555fed ****/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		%feature("autodoc", "
Parameters
----------
Bsplin: Geom_BSplineSurface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		 GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & Bsplin, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: a06321cb9eb199bcc8e3c8ede0e3269e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface>

Description
-----------
No available documentation.
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
		/**** md5 signature: 230725ff67a6f1ad318ee87223791295 ****/
		%feature("compactdefaultargs") GeomToStep_MakeBoundedCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_BoundedCurve
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeBoundedCurve;
		 GeomToStep_MakeBoundedCurve(const opencascade::handle<Geom_BoundedCurve> & C, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeBoundedCurve ******************/
		/**** md5 signature: 26533e2ae4a23960277cb97ecec565bf ****/
		%feature("compactdefaultargs") GeomToStep_MakeBoundedCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_BoundedCurve
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeBoundedCurve;
		 GeomToStep_MakeBoundedCurve(const opencascade::handle<Geom2d_BoundedCurve> & C, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 693482260abb67f388c20546bc0d24b2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BoundedCurve>

Description
-----------
No available documentation.
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
		/**** md5 signature: f662ed1f5eba3321fdd9c6b84afbdc4c ****/
		%feature("compactdefaultargs") GeomToStep_MakeBoundedSurface;
		%feature("autodoc", "
Parameters
----------
C: Geom_BoundedSurface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeBoundedSurface;
		 GeomToStep_MakeBoundedSurface(const opencascade::handle<Geom_BoundedSurface> & C, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 9a92c08dbdf434f48685da487d3d28f3 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BoundedSurface>

Description
-----------
No available documentation.
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
		/**** md5 signature: 74e9f5cbf9842287ca51dc34abbad5b6 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
aFactor: float

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint(const gp_Pnt & P, const Standard_Real aFactor);

		/****************** GeomToStep_MakeCartesianPoint ******************/
		/**** md5 signature: 46436d2765f98b7fe67cf41815e72b94 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
aFactor: float

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint(const gp_Pnt2d & P, const Standard_Real aFactor);

		/****************** GeomToStep_MakeCartesianPoint ******************/
		/**** md5 signature: c518b49d4336bfbe94bf5b60e7979eaf ****/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "
Parameters
----------
P: Geom_CartesianPoint
aFactor: float

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint(const opencascade::handle<Geom_CartesianPoint> & P, const Standard_Real aFactor);

		/****************** GeomToStep_MakeCartesianPoint ******************/
		/**** md5 signature: b0da04ef2617163db5aa8dbb8c5d5fb6 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "
Parameters
----------
P: Geom2d_CartesianPoint

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint(const opencascade::handle<Geom2d_CartesianPoint> & P);

		/****************** Value ******************/
		/**** md5 signature: 4267ef48ebaa9e0394a78b27f265c6a7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
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
		/**** md5 signature: 8f0182feb970bff3f107869e72d3e430 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle(const gp_Circ & C, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeCircle ******************/
		/**** md5 signature: 703a19c0ee3ef88894aeb2a08c688a90 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", "
Parameters
----------
C: Geom_Circle
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle(const opencascade::handle<Geom_Circle> & C, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeCircle ******************/
		/**** md5 signature: 3834eee34cdad5f19122324d0ffa33eb ****/
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Circle
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle(const opencascade::handle<Geom2d_Circle> & C, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 80089f77380b5fe8369810effae824ea ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Circle>

Description
-----------
No available documentation.
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
		/**** md5 signature: 7300d50d377e0943b5d2f1933e3b2e1b ****/
		%feature("compactdefaultargs") GeomToStep_MakeConic;
		%feature("autodoc", "
Parameters
----------
C: Geom_Conic
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeConic;
		 GeomToStep_MakeConic(const opencascade::handle<Geom_Conic> & C, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeConic ******************/
		/**** md5 signature: af76a76241c9a650158b41a030617afe ****/
		%feature("compactdefaultargs") GeomToStep_MakeConic;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Conic
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeConic;
		 GeomToStep_MakeConic(const opencascade::handle<Geom2d_Conic> & C, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: a33da9e5838fbe8136b90f4da4466085 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Conic>

Description
-----------
No available documentation.
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
		/**** md5 signature: f6d2a358a91b794dec4babc3c3e49a26 ****/
		%feature("compactdefaultargs") GeomToStep_MakeConicalSurface;
		%feature("autodoc", "
Parameters
----------
CSurf: Geom_ConicalSurface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeConicalSurface;
		 GeomToStep_MakeConicalSurface(const opencascade::handle<Geom_ConicalSurface> & CSurf, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 9b07229bd79c88714b08af93e4f07fc7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_ConicalSurface>

Description
-----------
No available documentation.
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
		/**** md5 signature: 6cd947dba721787b09944fc02ec93285 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeCurve;
		 GeomToStep_MakeCurve(const opencascade::handle<Geom_Curve> & C, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeCurve ******************/
		/**** md5 signature: aeec745ed860fe4966eeb0c02c55987d ****/
		%feature("compactdefaultargs") GeomToStep_MakeCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeCurve;
		 GeomToStep_MakeCurve(const opencascade::handle<Geom2d_Curve> & C, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 90c4cf738d09355ed37f8d102747f878 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
No available documentation.
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
		/**** md5 signature: 9d5957654d4a87ffd5ac56d7d8914d89 ****/
		%feature("compactdefaultargs") GeomToStep_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
CSurf: Geom_CylindricalSurface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeCylindricalSurface;
		 GeomToStep_MakeCylindricalSurface(const opencascade::handle<Geom_CylindricalSurface> & CSurf, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 786ce73042a06c87aa97211d7cddaa97 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CylindricalSurface>

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
D: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection(const gp_Dir & D);

		/****************** GeomToStep_MakeDirection ******************/
		/**** md5 signature: 22eee7671784cb208760ec9a25398be3 ****/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir2d

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection(const gp_Dir2d & D);

		/****************** GeomToStep_MakeDirection ******************/
		/**** md5 signature: d0999eb55968c79daf96fa39ee4c5161 ****/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "
Parameters
----------
D: Geom_Direction

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection(const opencascade::handle<Geom_Direction> & D);

		/****************** GeomToStep_MakeDirection ******************/
		/**** md5 signature: 6a6448596cba670b8dea600c490f7ac0 ****/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "
Parameters
----------
D: Geom2d_Direction

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection(const opencascade::handle<Geom2d_Direction> & D);

		/****************** Value ******************/
		/**** md5 signature: 6d10c3e670b015320b814ad7d6ea2599 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
No available documentation.
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
		/**** md5 signature: fb0459c21925460d03b247c03b6462a3 ****/
		%feature("compactdefaultargs") GeomToStep_MakeElementarySurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_ElementarySurface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeElementarySurface;
		 GeomToStep_MakeElementarySurface(const opencascade::handle<Geom_ElementarySurface> & S, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 56d8a982bff3e047141a1101fca174b2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_ElementarySurface>

Description
-----------
No available documentation.
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
		/**** md5 signature: 23448c3f57fb3705c21256625a4b2c68 ****/
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
C: gp_Elips
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse(const gp_Elips & C, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeEllipse ******************/
		/**** md5 signature: f92a44781a9f8486b5d4137f775affe8 ****/
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
C: Geom_Ellipse
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse(const opencascade::handle<Geom_Ellipse> & C, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeEllipse ******************/
		/**** md5 signature: eb87499c5f5b4bff86d41edd98e6cef5 ****/
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Ellipse
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse(const opencascade::handle<Geom2d_Ellipse> & C, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 033062f99ca07e5b0fd30154d26db816 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Ellipse>

Description
-----------
No available documentation.
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
		/**** md5 signature: 8553f5e1c4464c996be770957d023fd4 ****/
		%feature("compactdefaultargs") GeomToStep_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Hyperbola
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeHyperbola;
		 GeomToStep_MakeHyperbola(const opencascade::handle<Geom2d_Hyperbola> & C, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeHyperbola ******************/
		/**** md5 signature: 53863d6f33160b5cf2ac0c14cf1810c8 ****/
		%feature("compactdefaultargs") GeomToStep_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
C: Geom_Hyperbola
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeHyperbola;
		 GeomToStep_MakeHyperbola(const opencascade::handle<Geom_Hyperbola> & C, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 6c6adecb4fa9565b161e019885d473e4 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Hyperbola>

Description
-----------
No available documentation.
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
		/**** md5 signature: 1dfae9a238b269fb0317b5d578063660 ****/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine(const gp_Lin & L, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeLine ******************/
		/**** md5 signature: 35ec3b23443bff8dcb9ba548bb3ca6a6 ****/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine(const gp_Lin2d & L, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeLine ******************/
		/**** md5 signature: fc5eea45ae7e3adcb149960d80680c89 ****/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "
Parameters
----------
C: Geom_Line
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine(const opencascade::handle<Geom_Line> & C, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeLine ******************/
		/**** md5 signature: 14d9e5e86478ef2be3db763f3a180efd ****/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Line
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine(const opencascade::handle<Geom2d_Line> & C, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 1b26fd610fca6c8f1a6698b83ca8a479 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Line>

Description
-----------
No available documentation.
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
		/**** md5 signature: ba2fc02ba2ae1fbc5094a0c225c1bcb6 ****/
		%feature("compactdefaultargs") GeomToStep_MakeParabola;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Parabola
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeParabola;
		 GeomToStep_MakeParabola(const opencascade::handle<Geom2d_Parabola> & C, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeParabola ******************/
		/**** md5 signature: 78751a750f4cc7027214fd3df3d1b677 ****/
		%feature("compactdefaultargs") GeomToStep_MakeParabola;
		%feature("autodoc", "
Parameters
----------
C: Geom_Parabola
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeParabola;
		 GeomToStep_MakeParabola(const opencascade::handle<Geom_Parabola> & C, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: a296c7ec9f53c22a518a48499f61ba32 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Parabola>

Description
-----------
No available documentation.
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
		/**** md5 signature: 2d7f74de7db9884298bbc9301ce8a21d ****/
		%feature("compactdefaultargs") GeomToStep_MakePlane;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakePlane;
		 GeomToStep_MakePlane(const gp_Pln & P, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakePlane ******************/
		/**** md5 signature: da09601d3077cb467eaecce0e404a231 ****/
		%feature("compactdefaultargs") GeomToStep_MakePlane;
		%feature("autodoc", "
Parameters
----------
P: Geom_Plane
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakePlane;
		 GeomToStep_MakePlane(const opencascade::handle<Geom_Plane> & P, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 9f597b4134bcd4a7e61386b3204aac13 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Plane>

Description
-----------
No available documentation.
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
		/**** md5 signature: e2eb7531dbd85c394aab964bdf5ed50d ****/
		%feature("compactdefaultargs") GeomToStep_MakePolyline;
		%feature("autodoc", "
Parameters
----------
P: TColgp_Array1OfPnt
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakePolyline;
		 GeomToStep_MakePolyline(const TColgp_Array1OfPnt & P, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakePolyline ******************/
		/**** md5 signature: be1a390ee3dd02b701e4f13d58b3a77f ****/
		%feature("compactdefaultargs") GeomToStep_MakePolyline;
		%feature("autodoc", "
Parameters
----------
P: TColgp_Array1OfPnt2d
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakePolyline;
		 GeomToStep_MakePolyline(const TColgp_Array1OfPnt2d & P, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 7a62b6b5beb908aa8df3a455e1d0bf50 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Polyline>

Description
-----------
No available documentation.
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
		/**** md5 signature: 7cf6c675e441e682aaf06e3d3b3fcbd7 ****/
		%feature("compactdefaultargs") GeomToStep_MakeRectangularTrimmedSurface;
		%feature("autodoc", "
Parameters
----------
RTSurf: Geom_RectangularTrimmedSurface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeRectangularTrimmedSurface;
		 GeomToStep_MakeRectangularTrimmedSurface(const opencascade::handle<Geom_RectangularTrimmedSurface> & RTSurf, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 7004b5c6ee1fa69dbdca41030ebbbde0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RectangularTrimmedSurface>

Description
-----------
No available documentation.
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
		/**** md5 signature: 385b084b11f96a21112d6211a1b698b0 ****/
		%feature("compactdefaultargs") GeomToStep_MakeSphericalSurface;
		%feature("autodoc", "
Parameters
----------
CSurf: Geom_SphericalSurface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeSphericalSurface;
		 GeomToStep_MakeSphericalSurface(const opencascade::handle<Geom_SphericalSurface> & CSurf, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 5c4c96e28e4a9a68a945fed65f098946 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_SphericalSurface>

Description
-----------
No available documentation.
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
		/**** md5 signature: 6fd014173523a87891b6be24263b7c8a ****/
		%feature("compactdefaultargs") GeomToStep_MakeSurface;
		%feature("autodoc", "
Parameters
----------
C: Geom_Surface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeSurface;
		 GeomToStep_MakeSurface(const opencascade::handle<Geom_Surface> & C, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 244a35854a6e95acd7c5691913295e49 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
No available documentation.
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
		/**** md5 signature: 84dafe22d5b9ef3b774084d838fcd4e7 ****/
		%feature("compactdefaultargs") GeomToStep_MakeSurfaceOfLinearExtrusion;
		%feature("autodoc", "
Parameters
----------
CSurf: Geom_SurfaceOfLinearExtrusion
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeSurfaceOfLinearExtrusion;
		 GeomToStep_MakeSurfaceOfLinearExtrusion(const opencascade::handle<Geom_SurfaceOfLinearExtrusion> & CSurf, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 312250b48ce2d90238af05ea19c0f830 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_SurfaceOfLinearExtrusion>

Description
-----------
No available documentation.
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
		/**** md5 signature: da9355170765d89ba81a6c9790867d64 ****/
		%feature("compactdefaultargs") GeomToStep_MakeSurfaceOfRevolution;
		%feature("autodoc", "
Parameters
----------
RevSurf: Geom_SurfaceOfRevolution
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeSurfaceOfRevolution;
		 GeomToStep_MakeSurfaceOfRevolution(const opencascade::handle<Geom_SurfaceOfRevolution> & RevSurf, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: f69be605fb08041e2f817b56da3c4768 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_SurfaceOfRevolution>

Description
-----------
No available documentation.
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
		/**** md5 signature: dcfd9d8e07e18589887cd34bf629bf90 ****/
		%feature("compactdefaultargs") GeomToStep_MakeSweptSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_SweptSurface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeSweptSurface;
		 GeomToStep_MakeSweptSurface(const opencascade::handle<Geom_SweptSurface> & S, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: a0380db370203c91a9dc85d79a7b90c7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_SweptSurface>

Description
-----------
No available documentation.
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
		/**** md5 signature: 919f5ff44ac4d8fedd16c7050b895a03 ****/
		%feature("compactdefaultargs") GeomToStep_MakeToroidalSurface;
		%feature("autodoc", "
Parameters
----------
TorSurf: Geom_ToroidalSurface
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeToroidalSurface;
		 GeomToStep_MakeToroidalSurface(const opencascade::handle<Geom_ToroidalSurface> & TorSurf, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 2edf9d448c16344361dded7bf98b9bec ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_ToroidalSurface>

Description
-----------
No available documentation.
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
		/**** md5 signature: 39a2bf6e4ffa4513d85fc956bc1db166 ****/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector(const gp_Vec & V, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeVector ******************/
		/**** md5 signature: 603e1681fde695a5c02febdec1200e6d ****/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec2d
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector(const gp_Vec2d & V, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeVector ******************/
		/**** md5 signature: f3f8d4e051c545d7782b02dc38d98ae2 ****/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "
Parameters
----------
V: Geom_Vector
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector(const opencascade::handle<Geom_Vector> & V, const StepData_Factors & theLocalFactors);

		/****************** GeomToStep_MakeVector ******************/
		/**** md5 signature: c1942d2790b268640c554a824b9320ea ****/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "
Parameters
----------
V: Geom2d_Vector
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector(const opencascade::handle<Geom2d_Vector> & V, const StepData_Factors & theLocalFactors);

		/****************** Value ******************/
		/**** md5 signature: 1d775fed97804779e81e2e206028af29 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Vector>

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
}
