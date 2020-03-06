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
%define RWSTEPGEOMDOCSTRING
"RWStepGeom module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepgeom.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPGEOMDOCSTRING) RWStepGeom


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
#include<RWStepGeom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepGeom_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<StepBasic_module.hxx>
#include<StepData_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<StepRepr_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepData.i
%import Interface.i
%import StepGeom.i

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

/************************************
* class RWStepGeom_RWAxis1Placement *
************************************/
class RWStepGeom_RWAxis1Placement {
	public:
		/****************** RWStepGeom_RWAxis1Placement ******************/
		%feature("compactdefaultargs") RWStepGeom_RWAxis1Placement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWAxis1Placement;
		 RWStepGeom_RWAxis1Placement();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Axis1Placement

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Axis1Placement> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Axis1Placement
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Axis1Placement> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Axis1Placement

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Axis1Placement> & ent);

};


%extend RWStepGeom_RWAxis1Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepGeom_RWAxis2Placement2d *
**************************************/
class RWStepGeom_RWAxis2Placement2d {
	public:
		/****************** RWStepGeom_RWAxis2Placement2d ******************/
		%feature("compactdefaultargs") RWStepGeom_RWAxis2Placement2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWAxis2Placement2d;
		 RWStepGeom_RWAxis2Placement2d();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Axis2Placement2d

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Axis2Placement2d> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Axis2Placement2d
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Axis2Placement2d> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Axis2Placement2d

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Axis2Placement2d> & ent);

};


%extend RWStepGeom_RWAxis2Placement2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepGeom_RWAxis2Placement3d *
**************************************/
class RWStepGeom_RWAxis2Placement3d {
	public:
		/****************** RWStepGeom_RWAxis2Placement3d ******************/
		%feature("compactdefaultargs") RWStepGeom_RWAxis2Placement3d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWAxis2Placement3d;
		 RWStepGeom_RWAxis2Placement3d();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Axis2Placement3d

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Axis2Placement3d> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Axis2Placement3d
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Axis2Placement3d> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Axis2Placement3d

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Axis2Placement3d> & ent);

};


%extend RWStepGeom_RWAxis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepGeom_RWBSplineCurve *
**********************************/
class RWStepGeom_RWBSplineCurve {
	public:
		/****************** RWStepGeom_RWBSplineCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineCurve;
		 RWStepGeom_RWBSplineCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BSplineCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BSplineCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BSplineCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BSplineCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BSplineCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BSplineCurve> & ent);

};


%extend RWStepGeom_RWBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepGeom_RWBSplineCurveWithKnots *
*******************************************/
class RWStepGeom_RWBSplineCurveWithKnots {
	public:
		/****************** RWStepGeom_RWBSplineCurveWithKnots ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineCurveWithKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineCurveWithKnots;
		 RWStepGeom_RWBSplineCurveWithKnots();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BSplineCurveWithKnots
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepGeom_BSplineCurveWithKnots> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BSplineCurveWithKnots

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BSplineCurveWithKnots> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BSplineCurveWithKnots
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BSplineCurveWithKnots> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BSplineCurveWithKnots

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BSplineCurveWithKnots> & ent);

};


%extend RWStepGeom_RWBSplineCurveWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************************
* class RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve *
******************************************************************/
class RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve {
	public:
		/****************** RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve;
		 RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> & ent);

};


%extend RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepGeom_RWBSplineSurface *
************************************/
class RWStepGeom_RWBSplineSurface {
	public:
		/****************** RWStepGeom_RWBSplineSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineSurface;
		 RWStepGeom_RWBSplineSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BSplineSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BSplineSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BSplineSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BSplineSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BSplineSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BSplineSurface> & ent);

};


%extend RWStepGeom_RWBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepGeom_RWBSplineSurfaceWithKnots *
*********************************************/
class RWStepGeom_RWBSplineSurfaceWithKnots {
	public:
		/****************** RWStepGeom_RWBSplineSurfaceWithKnots ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineSurfaceWithKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineSurfaceWithKnots;
		 RWStepGeom_RWBSplineSurfaceWithKnots();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BSplineSurfaceWithKnots
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BSplineSurfaceWithKnots

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BSplineSurfaceWithKnots
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BSplineSurfaceWithKnots

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & ent);

};


%extend RWStepGeom_RWBSplineSurfaceWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************************
* class RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface *
**********************************************************************/
class RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface {
	public:
		/****************** RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		 RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> & ent);

};


%extend RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepGeom_RWBezierCurve *
*********************************/
class RWStepGeom_RWBezierCurve {
	public:
		/****************** RWStepGeom_RWBezierCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBezierCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBezierCurve;
		 RWStepGeom_RWBezierCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BezierCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BezierCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BezierCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BezierCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BezierCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BezierCurve> & ent);

};


%extend RWStepGeom_RWBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class RWStepGeom_RWBezierCurveAndRationalBSplineCurve *
********************************************************/
class RWStepGeom_RWBezierCurveAndRationalBSplineCurve {
	public:
		/****************** RWStepGeom_RWBezierCurveAndRationalBSplineCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBezierCurveAndRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBezierCurveAndRationalBSplineCurve;
		 RWStepGeom_RWBezierCurveAndRationalBSplineCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BezierCurveAndRationalBSplineCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BezierCurveAndRationalBSplineCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BezierCurveAndRationalBSplineCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BezierCurveAndRationalBSplineCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BezierCurveAndRationalBSplineCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BezierCurveAndRationalBSplineCurve> & ent);

};


%extend RWStepGeom_RWBezierCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepGeom_RWBezierSurface *
***********************************/
class RWStepGeom_RWBezierSurface {
	public:
		/****************** RWStepGeom_RWBezierSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBezierSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBezierSurface;
		 RWStepGeom_RWBezierSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BezierSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BezierSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BezierSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BezierSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BezierSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BezierSurface> & ent);

};


%extend RWStepGeom_RWBezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface *
************************************************************/
class RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface {
	public:
		/****************** RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface;
		 RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BezierSurfaceAndRationalBSplineSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BezierSurfaceAndRationalBSplineSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BezierSurfaceAndRationalBSplineSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BezierSurfaceAndRationalBSplineSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BezierSurfaceAndRationalBSplineSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BezierSurfaceAndRationalBSplineSurface> & ent);

};


%extend RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepGeom_RWBoundaryCurve *
***********************************/
class RWStepGeom_RWBoundaryCurve {
	public:
		/****************** RWStepGeom_RWBoundaryCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBoundaryCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBoundaryCurve;
		 RWStepGeom_RWBoundaryCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BoundaryCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BoundaryCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_BoundaryCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_BoundaryCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BoundaryCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BoundaryCurve> & ent);

};


%extend RWStepGeom_RWBoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepGeom_RWBoundedCurve *
**********************************/
class RWStepGeom_RWBoundedCurve {
	public:
		/****************** RWStepGeom_RWBoundedCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBoundedCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBoundedCurve;
		 RWStepGeom_RWBoundedCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BoundedCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BoundedCurve> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BoundedCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BoundedCurve> & ent);

};


%extend RWStepGeom_RWBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepGeom_RWBoundedSurface *
************************************/
class RWStepGeom_RWBoundedSurface {
	public:
		/****************** RWStepGeom_RWBoundedSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWBoundedSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBoundedSurface;
		 RWStepGeom_RWBoundedSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_BoundedSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_BoundedSurface> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_BoundedSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_BoundedSurface> & ent);

};


%extend RWStepGeom_RWBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepGeom_RWCartesianPoint *
************************************/
class RWStepGeom_RWCartesianPoint {
	public:
		/****************** RWStepGeom_RWCartesianPoint ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCartesianPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCartesianPoint;
		 RWStepGeom_RWCartesianPoint();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_CartesianPoint

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_CartesianPoint> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_CartesianPoint

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_CartesianPoint> & ent);

};


%extend RWStepGeom_RWCartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepGeom_RWCartesianTransformationOperator *
*****************************************************/
class RWStepGeom_RWCartesianTransformationOperator {
	public:
		/****************** RWStepGeom_RWCartesianTransformationOperator ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCartesianTransformationOperator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCartesianTransformationOperator;
		 RWStepGeom_RWCartesianTransformationOperator();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_CartesianTransformationOperator

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_CartesianTransformationOperator> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_CartesianTransformationOperator
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_CartesianTransformationOperator> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_CartesianTransformationOperator

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_CartesianTransformationOperator> & ent);

};


%extend RWStepGeom_RWCartesianTransformationOperator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepGeom_RWCartesianTransformationOperator3d *
*******************************************************/
class RWStepGeom_RWCartesianTransformationOperator3d {
	public:
		/****************** RWStepGeom_RWCartesianTransformationOperator3d ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCartesianTransformationOperator3d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCartesianTransformationOperator3d;
		 RWStepGeom_RWCartesianTransformationOperator3d();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_CartesianTransformationOperator3d

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_CartesianTransformationOperator3d
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_CartesianTransformationOperator3d

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & ent);

};


%extend RWStepGeom_RWCartesianTransformationOperator3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWStepGeom_RWCircle *
****************************/
class RWStepGeom_RWCircle {
	public:
		/****************** RWStepGeom_RWCircle ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCircle;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCircle;
		 RWStepGeom_RWCircle();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Circle

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Circle> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Circle
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Circle> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Circle

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Circle> & ent);

};


%extend RWStepGeom_RWCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepGeom_RWCompositeCurve *
************************************/
class RWStepGeom_RWCompositeCurve {
	public:
		/****************** RWStepGeom_RWCompositeCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCompositeCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCompositeCurve;
		 RWStepGeom_RWCompositeCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_CompositeCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_CompositeCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_CompositeCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_CompositeCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_CompositeCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_CompositeCurve> & ent);

};


%extend RWStepGeom_RWCompositeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepGeom_RWCompositeCurveOnSurface *
*********************************************/
class RWStepGeom_RWCompositeCurveOnSurface {
	public:
		/****************** RWStepGeom_RWCompositeCurveOnSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCompositeCurveOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCompositeCurveOnSurface;
		 RWStepGeom_RWCompositeCurveOnSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_CompositeCurveOnSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_CompositeCurveOnSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_CompositeCurveOnSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_CompositeCurveOnSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_CompositeCurveOnSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_CompositeCurveOnSurface> & ent);

};


%extend RWStepGeom_RWCompositeCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepGeom_RWCompositeCurveSegment *
*******************************************/
class RWStepGeom_RWCompositeCurveSegment {
	public:
		/****************** RWStepGeom_RWCompositeCurveSegment ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCompositeCurveSegment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCompositeCurveSegment;
		 RWStepGeom_RWCompositeCurveSegment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_CompositeCurveSegment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_CompositeCurveSegment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_CompositeCurveSegment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_CompositeCurveSegment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_CompositeCurveSegment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_CompositeCurveSegment> & ent);

};


%extend RWStepGeom_RWCompositeCurveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWStepGeom_RWConic *
***************************/
class RWStepGeom_RWConic {
	public:
		/****************** RWStepGeom_RWConic ******************/
		%feature("compactdefaultargs") RWStepGeom_RWConic;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWConic;
		 RWStepGeom_RWConic();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Conic

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Conic> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Conic
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Conic> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Conic

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Conic> & ent);

};


%extend RWStepGeom_RWConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepGeom_RWConicalSurface *
************************************/
class RWStepGeom_RWConicalSurface {
	public:
		/****************** RWStepGeom_RWConicalSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWConicalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWConicalSurface;
		 RWStepGeom_RWConicalSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_ConicalSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_ConicalSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_ConicalSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_ConicalSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_ConicalSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_ConicalSurface> & ent);

};


%extend RWStepGeom_RWConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWStepGeom_RWCurve *
***************************/
class RWStepGeom_RWCurve {
	public:
		/****************** RWStepGeom_RWCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCurve;
		 RWStepGeom_RWCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Curve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Curve> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Curve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Curve> & ent);

};


%extend RWStepGeom_RWCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepGeom_RWCurveBoundedSurface *
*****************************************/
class RWStepGeom_RWCurveBoundedSurface {
	public:
		/****************** RWStepGeom_RWCurveBoundedSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCurveBoundedSurface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepGeom_RWCurveBoundedSurface;
		 RWStepGeom_RWCurveBoundedSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveboundedsurface.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_CurveBoundedSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_CurveBoundedSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepGeom_CurveBoundedSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_CurveBoundedSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveboundedsurface.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_CurveBoundedSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_CurveBoundedSurface> & ent);

};


%extend RWStepGeom_RWCurveBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepGeom_RWCurveReplica *
**********************************/
class RWStepGeom_RWCurveReplica {
	public:
		/****************** RWStepGeom_RWCurveReplica ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCurveReplica;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCurveReplica;
		 RWStepGeom_RWCurveReplica();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_CurveReplica

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_CurveReplica> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_CurveReplica
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_CurveReplica> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_CurveReplica

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_CurveReplica> & ent);

};


%extend RWStepGeom_RWCurveReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepGeom_RWCylindricalSurface *
****************************************/
class RWStepGeom_RWCylindricalSurface {
	public:
		/****************** RWStepGeom_RWCylindricalSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWCylindricalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCylindricalSurface;
		 RWStepGeom_RWCylindricalSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_CylindricalSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_CylindricalSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_CylindricalSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_CylindricalSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_CylindricalSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_CylindricalSurface> & ent);

};


%extend RWStepGeom_RWCylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepGeom_RWDegeneratePcurve *
**************************************/
class RWStepGeom_RWDegeneratePcurve {
	public:
		/****************** RWStepGeom_RWDegeneratePcurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWDegeneratePcurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWDegeneratePcurve;
		 RWStepGeom_RWDegeneratePcurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_DegeneratePcurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_DegeneratePcurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_DegeneratePcurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_DegeneratePcurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_DegeneratePcurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_DegeneratePcurve> & ent);

};


%extend RWStepGeom_RWDegeneratePcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepGeom_RWDegenerateToroidalSurface *
***********************************************/
class RWStepGeom_RWDegenerateToroidalSurface {
	public:
		/****************** RWStepGeom_RWDegenerateToroidalSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWDegenerateToroidalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWDegenerateToroidalSurface;
		 RWStepGeom_RWDegenerateToroidalSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_DegenerateToroidalSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_DegenerateToroidalSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_DegenerateToroidalSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_DegenerateToroidalSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_DegenerateToroidalSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_DegenerateToroidalSurface> & ent);

};


%extend RWStepGeom_RWDegenerateToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepGeom_RWDirection *
*******************************/
class RWStepGeom_RWDirection {
	public:
		/****************** RWStepGeom_RWDirection ******************/
		%feature("compactdefaultargs") RWStepGeom_RWDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWDirection;
		 RWStepGeom_RWDirection();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Direction
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepGeom_Direction> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Direction

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Direction> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Direction

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Direction> & ent);

};


%extend RWStepGeom_RWDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepGeom_RWElementarySurface *
***************************************/
class RWStepGeom_RWElementarySurface {
	public:
		/****************** RWStepGeom_RWElementarySurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWElementarySurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWElementarySurface;
		 RWStepGeom_RWElementarySurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_ElementarySurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_ElementarySurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_ElementarySurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_ElementarySurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_ElementarySurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_ElementarySurface> & ent);

};


%extend RWStepGeom_RWElementarySurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepGeom_RWEllipse *
*****************************/
class RWStepGeom_RWEllipse {
	public:
		/****************** RWStepGeom_RWEllipse ******************/
		%feature("compactdefaultargs") RWStepGeom_RWEllipse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWEllipse;
		 RWStepGeom_RWEllipse();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Ellipse
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepGeom_Ellipse> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Ellipse

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Ellipse> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Ellipse
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Ellipse> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Ellipse

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Ellipse> & ent);

};


%extend RWStepGeom_RWEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepGeom_RWEvaluatedDegeneratePcurve *
***********************************************/
class RWStepGeom_RWEvaluatedDegeneratePcurve {
	public:
		/****************** RWStepGeom_RWEvaluatedDegeneratePcurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWEvaluatedDegeneratePcurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWEvaluatedDegeneratePcurve;
		 RWStepGeom_RWEvaluatedDegeneratePcurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_EvaluatedDegeneratePcurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_EvaluatedDegeneratePcurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_EvaluatedDegeneratePcurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_EvaluatedDegeneratePcurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_EvaluatedDegeneratePcurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_EvaluatedDegeneratePcurve> & ent);

};


%extend RWStepGeom_RWEvaluatedDegeneratePcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************************
* class RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx *
*****************************************************************************/
class RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx {
	public:
		/****************** RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx ******************/
		%feature("compactdefaultargs") RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
		 RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> & ent);

};


%extend RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepGeom_RWGeometricRepresentationContext *
****************************************************/
class RWStepGeom_RWGeometricRepresentationContext {
	public:
		/****************** RWStepGeom_RWGeometricRepresentationContext ******************/
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWGeometricRepresentationContext;
		 RWStepGeom_RWGeometricRepresentationContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_GeometricRepresentationContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_GeometricRepresentationContext> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_GeometricRepresentationContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_GeometricRepresentationContext> & ent);

};


%extend RWStepGeom_RWGeometricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************************
* class RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext *
********************************************************************************/
class RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext {
	public:
		/****************** RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext ******************/
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext;
		 RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext> & ent);

};


%extend RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************************************
* class RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext *
**************************************************************************************/
class RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext {
	public:
		/****************** RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext ******************/
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext;
		 RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_GeometricRepresentationContextAndParametricRepresentationContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_GeometricRepresentationContextAndParametricRepresentationContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_GeometricRepresentationContextAndParametricRepresentationContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext> & ent);

};


%extend RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepGeom_RWGeometricRepresentationItem *
*************************************************/
class RWStepGeom_RWGeometricRepresentationItem {
	public:
		/****************** RWStepGeom_RWGeometricRepresentationItem ******************/
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWGeometricRepresentationItem;
		 RWStepGeom_RWGeometricRepresentationItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_GeometricRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_GeometricRepresentationItem> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_GeometricRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_GeometricRepresentationItem> & ent);

};


%extend RWStepGeom_RWGeometricRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepGeom_RWHyperbola *
*******************************/
class RWStepGeom_RWHyperbola {
	public:
		/****************** RWStepGeom_RWHyperbola ******************/
		%feature("compactdefaultargs") RWStepGeom_RWHyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWHyperbola;
		 RWStepGeom_RWHyperbola();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Hyperbola

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Hyperbola> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Hyperbola
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Hyperbola> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Hyperbola

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Hyperbola> & ent);

};


%extend RWStepGeom_RWHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepGeom_RWIntersectionCurve *
***************************************/
class RWStepGeom_RWIntersectionCurve {
	public:
		/****************** RWStepGeom_RWIntersectionCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWIntersectionCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWIntersectionCurve;
		 RWStepGeom_RWIntersectionCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_IntersectionCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_IntersectionCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_IntersectionCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_IntersectionCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_IntersectionCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_IntersectionCurve> & ent);

};


%extend RWStepGeom_RWIntersectionCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class RWStepGeom_RWLine *
**************************/
class RWStepGeom_RWLine {
	public:
		/****************** RWStepGeom_RWLine ******************/
		%feature("compactdefaultargs") RWStepGeom_RWLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWLine;
		 RWStepGeom_RWLine();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Line

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Line> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Line
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Line> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Line

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Line> & ent);

};


%extend RWStepGeom_RWLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepGeom_RWOffsetCurve3d *
***********************************/
class RWStepGeom_RWOffsetCurve3d {
	public:
		/****************** RWStepGeom_RWOffsetCurve3d ******************/
		%feature("compactdefaultargs") RWStepGeom_RWOffsetCurve3d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWOffsetCurve3d;
		 RWStepGeom_RWOffsetCurve3d();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_OffsetCurve3d

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_OffsetCurve3d> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_OffsetCurve3d
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_OffsetCurve3d> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_OffsetCurve3d

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_OffsetCurve3d> & ent);

};


%extend RWStepGeom_RWOffsetCurve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepGeom_RWOffsetSurface *
***********************************/
class RWStepGeom_RWOffsetSurface {
	public:
		/****************** RWStepGeom_RWOffsetSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWOffsetSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWOffsetSurface;
		 RWStepGeom_RWOffsetSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_OffsetSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_OffsetSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_OffsetSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_OffsetSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_OffsetSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_OffsetSurface> & ent);

};


%extend RWStepGeom_RWOffsetSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepGeom_RWOrientedSurface *
*************************************/
class RWStepGeom_RWOrientedSurface {
	public:
		/****************** RWStepGeom_RWOrientedSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWOrientedSurface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepGeom_RWOrientedSurface;
		 RWStepGeom_RWOrientedSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads orientedsurface.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_OrientedSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_OrientedSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepGeom_OrientedSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_OrientedSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes orientedsurface.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_OrientedSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_OrientedSurface> & ent);

};


%extend RWStepGeom_RWOrientedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepGeom_RWOuterBoundaryCurve *
****************************************/
class RWStepGeom_RWOuterBoundaryCurve {
	public:
		/****************** RWStepGeom_RWOuterBoundaryCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWOuterBoundaryCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWOuterBoundaryCurve;
		 RWStepGeom_RWOuterBoundaryCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_OuterBoundaryCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_OuterBoundaryCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_OuterBoundaryCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_OuterBoundaryCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_OuterBoundaryCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_OuterBoundaryCurve> & ent);

};


%extend RWStepGeom_RWOuterBoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepGeom_RWParabola *
******************************/
class RWStepGeom_RWParabola {
	public:
		/****************** RWStepGeom_RWParabola ******************/
		%feature("compactdefaultargs") RWStepGeom_RWParabola;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWParabola;
		 RWStepGeom_RWParabola();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Parabola

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Parabola> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Parabola
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Parabola> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Parabola

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Parabola> & ent);

};


%extend RWStepGeom_RWParabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWStepGeom_RWPcurve *
****************************/
class RWStepGeom_RWPcurve {
	public:
		/****************** RWStepGeom_RWPcurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWPcurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPcurve;
		 RWStepGeom_RWPcurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Pcurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Pcurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Pcurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Pcurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Pcurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Pcurve> & ent);

};


%extend RWStepGeom_RWPcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepGeom_RWPlacement *
*******************************/
class RWStepGeom_RWPlacement {
	public:
		/****************** RWStepGeom_RWPlacement ******************/
		%feature("compactdefaultargs") RWStepGeom_RWPlacement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPlacement;
		 RWStepGeom_RWPlacement();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Placement

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Placement> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Placement
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Placement> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Placement

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Placement> & ent);

};


%extend RWStepGeom_RWPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWStepGeom_RWPlane *
***************************/
class RWStepGeom_RWPlane {
	public:
		/****************** RWStepGeom_RWPlane ******************/
		%feature("compactdefaultargs") RWStepGeom_RWPlane;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPlane;
		 RWStepGeom_RWPlane();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Plane

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Plane> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Plane
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Plane> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Plane

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Plane> & ent);

};


%extend RWStepGeom_RWPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWStepGeom_RWPoint *
***************************/
class RWStepGeom_RWPoint {
	public:
		/****************** RWStepGeom_RWPoint ******************/
		%feature("compactdefaultargs") RWStepGeom_RWPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPoint;
		 RWStepGeom_RWPoint();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Point

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Point> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Point

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Point> & ent);

};


%extend RWStepGeom_RWPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepGeom_RWPointOnCurve *
**********************************/
class RWStepGeom_RWPointOnCurve {
	public:
		/****************** RWStepGeom_RWPointOnCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWPointOnCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPointOnCurve;
		 RWStepGeom_RWPointOnCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_PointOnCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_PointOnCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_PointOnCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_PointOnCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_PointOnCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_PointOnCurve> & ent);

};


%extend RWStepGeom_RWPointOnCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepGeom_RWPointOnSurface *
************************************/
class RWStepGeom_RWPointOnSurface {
	public:
		/****************** RWStepGeom_RWPointOnSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWPointOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPointOnSurface;
		 RWStepGeom_RWPointOnSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_PointOnSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_PointOnSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_PointOnSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_PointOnSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_PointOnSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_PointOnSurface> & ent);

};


%extend RWStepGeom_RWPointOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepGeom_RWPointReplica *
**********************************/
class RWStepGeom_RWPointReplica {
	public:
		/****************** RWStepGeom_RWPointReplica ******************/
		%feature("compactdefaultargs") RWStepGeom_RWPointReplica;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPointReplica;
		 RWStepGeom_RWPointReplica();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_PointReplica

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_PointReplica> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_PointReplica
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_PointReplica> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_PointReplica

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_PointReplica> & ent);

};


%extend RWStepGeom_RWPointReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepGeom_RWPolyline *
******************************/
class RWStepGeom_RWPolyline {
	public:
		/****************** RWStepGeom_RWPolyline ******************/
		%feature("compactdefaultargs") RWStepGeom_RWPolyline;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPolyline;
		 RWStepGeom_RWPolyline();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Polyline

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Polyline> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Polyline
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Polyline> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Polyline

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Polyline> & ent);

};


%extend RWStepGeom_RWPolyline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepGeom_RWQuasiUniformCurve *
***************************************/
class RWStepGeom_RWQuasiUniformCurve {
	public:
		/****************** RWStepGeom_RWQuasiUniformCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWQuasiUniformCurve;
		 RWStepGeom_RWQuasiUniformCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_QuasiUniformCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_QuasiUniformCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_QuasiUniformCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_QuasiUniformCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_QuasiUniformCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_QuasiUniformCurve> & ent);

};


%extend RWStepGeom_RWQuasiUniformCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve *
**************************************************************/
class RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve {
	public:
		/****************** RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve;
		 RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_QuasiUniformCurveAndRationalBSplineCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_QuasiUniformCurveAndRationalBSplineCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_QuasiUniformCurveAndRationalBSplineCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_QuasiUniformCurveAndRationalBSplineCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_QuasiUniformCurveAndRationalBSplineCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_QuasiUniformCurveAndRationalBSplineCurve> & ent);

};


%extend RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepGeom_RWQuasiUniformSurface *
*****************************************/
class RWStepGeom_RWQuasiUniformSurface {
	public:
		/****************** RWStepGeom_RWQuasiUniformSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWQuasiUniformSurface;
		 RWStepGeom_RWQuasiUniformSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_QuasiUniformSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_QuasiUniformSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_QuasiUniformSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_QuasiUniformSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_QuasiUniformSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_QuasiUniformSurface> & ent);

};


%extend RWStepGeom_RWQuasiUniformSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************************
* class RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface *
******************************************************************/
class RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface {
	public:
		/****************** RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface;
		 RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface> & ent);

};


%extend RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepGeom_RWRationalBSplineCurve *
******************************************/
class RWStepGeom_RWRationalBSplineCurve {
	public:
		/****************** RWStepGeom_RWRationalBSplineCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWRationalBSplineCurve;
		 RWStepGeom_RWRationalBSplineCurve();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_RationalBSplineCurve
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepGeom_RationalBSplineCurve> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_RationalBSplineCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_RationalBSplineCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_RationalBSplineCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_RationalBSplineCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_RationalBSplineCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_RationalBSplineCurve> & ent);

};


%extend RWStepGeom_RWRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepGeom_RWRationalBSplineSurface *
********************************************/
class RWStepGeom_RWRationalBSplineSurface {
	public:
		/****************** RWStepGeom_RWRationalBSplineSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWRationalBSplineSurface;
		 RWStepGeom_RWRationalBSplineSurface();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_RationalBSplineSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepGeom_RationalBSplineSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_RationalBSplineSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_RationalBSplineSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_RationalBSplineSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_RationalBSplineSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_RationalBSplineSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_RationalBSplineSurface> & ent);

};


%extend RWStepGeom_RWRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepGeom_RWRectangularCompositeSurface *
*************************************************/
class RWStepGeom_RWRectangularCompositeSurface {
	public:
		/****************** RWStepGeom_RWRectangularCompositeSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWRectangularCompositeSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWRectangularCompositeSurface;
		 RWStepGeom_RWRectangularCompositeSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_RectangularCompositeSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_RectangularCompositeSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_RectangularCompositeSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_RectangularCompositeSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_RectangularCompositeSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_RectangularCompositeSurface> & ent);

};


%extend RWStepGeom_RWRectangularCompositeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepGeom_RWRectangularTrimmedSurface *
***********************************************/
class RWStepGeom_RWRectangularTrimmedSurface {
	public:
		/****************** RWStepGeom_RWRectangularTrimmedSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWRectangularTrimmedSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWRectangularTrimmedSurface;
		 RWStepGeom_RWRectangularTrimmedSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_RectangularTrimmedSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_RectangularTrimmedSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_RectangularTrimmedSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_RectangularTrimmedSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_RectangularTrimmedSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_RectangularTrimmedSurface> & ent);

};


%extend RWStepGeom_RWRectangularTrimmedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class RWStepGeom_RWReparametrisedCompositeCurveSegment *
*********************************************************/
class RWStepGeom_RWReparametrisedCompositeCurveSegment {
	public:
		/****************** RWStepGeom_RWReparametrisedCompositeCurveSegment ******************/
		%feature("compactdefaultargs") RWStepGeom_RWReparametrisedCompositeCurveSegment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWReparametrisedCompositeCurveSegment;
		 RWStepGeom_RWReparametrisedCompositeCurveSegment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_ReparametrisedCompositeCurveSegment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_ReparametrisedCompositeCurveSegment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_ReparametrisedCompositeCurveSegment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_ReparametrisedCompositeCurveSegment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_ReparametrisedCompositeCurveSegment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_ReparametrisedCompositeCurveSegment> & ent);

};


%extend RWStepGeom_RWReparametrisedCompositeCurveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepGeom_RWSeamCurve *
*******************************/
class RWStepGeom_RWSeamCurve {
	public:
		/****************** RWStepGeom_RWSeamCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWSeamCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSeamCurve;
		 RWStepGeom_RWSeamCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_SeamCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_SeamCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_SeamCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_SeamCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_SeamCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_SeamCurve> & ent);

};


%extend RWStepGeom_RWSeamCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepGeom_RWSphericalSurface *
**************************************/
class RWStepGeom_RWSphericalSurface {
	public:
		/****************** RWStepGeom_RWSphericalSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWSphericalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSphericalSurface;
		 RWStepGeom_RWSphericalSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_SphericalSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_SphericalSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_SphericalSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_SphericalSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_SphericalSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_SphericalSurface> & ent);

};


%extend RWStepGeom_RWSphericalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepGeom_RWSurface *
*****************************/
class RWStepGeom_RWSurface {
	public:
		/****************** RWStepGeom_RWSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurface;
		 RWStepGeom_RWSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Surface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Surface> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Surface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Surface> & ent);

};


%extend RWStepGeom_RWSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepGeom_RWSurfaceCurve *
**********************************/
class RWStepGeom_RWSurfaceCurve {
	public:
		/****************** RWStepGeom_RWSurfaceCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfaceCurve;
		 RWStepGeom_RWSurfaceCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_SurfaceCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_SurfaceCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_SurfaceCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_SurfaceCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_SurfaceCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_SurfaceCurve> & ent);

};


%extend RWStepGeom_RWSurfaceCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepGeom_RWSurfaceCurveAndBoundedCurve *
*************************************************/
class RWStepGeom_RWSurfaceCurveAndBoundedCurve {
	public:
		/****************** RWStepGeom_RWSurfaceCurveAndBoundedCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceCurveAndBoundedCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfaceCurveAndBoundedCurve;
		 RWStepGeom_RWSurfaceCurveAndBoundedCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_SurfaceCurveAndBoundedCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_SurfaceCurveAndBoundedCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_SurfaceCurveAndBoundedCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_SurfaceCurveAndBoundedCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_SurfaceCurveAndBoundedCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_SurfaceCurveAndBoundedCurve> & ent);

};


%extend RWStepGeom_RWSurfaceCurveAndBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepGeom_RWSurfaceOfLinearExtrusion *
**********************************************/
class RWStepGeom_RWSurfaceOfLinearExtrusion {
	public:
		/****************** RWStepGeom_RWSurfaceOfLinearExtrusion ******************/
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceOfLinearExtrusion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfaceOfLinearExtrusion;
		 RWStepGeom_RWSurfaceOfLinearExtrusion();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_SurfaceOfLinearExtrusion

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_SurfaceOfLinearExtrusion
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_SurfaceOfLinearExtrusion

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & ent);

};


%extend RWStepGeom_RWSurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepGeom_RWSurfaceOfRevolution *
*****************************************/
class RWStepGeom_RWSurfaceOfRevolution {
	public:
		/****************** RWStepGeom_RWSurfaceOfRevolution ******************/
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfaceOfRevolution;
		 RWStepGeom_RWSurfaceOfRevolution();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_SurfaceOfRevolution

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_SurfaceOfRevolution> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_SurfaceOfRevolution
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_SurfaceOfRevolution> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_SurfaceOfRevolution

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_SurfaceOfRevolution> & ent);

};


%extend RWStepGeom_RWSurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepGeom_RWSurfacePatch *
**********************************/
class RWStepGeom_RWSurfacePatch {
	public:
		/****************** RWStepGeom_RWSurfacePatch ******************/
		%feature("compactdefaultargs") RWStepGeom_RWSurfacePatch;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfacePatch;
		 RWStepGeom_RWSurfacePatch();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_SurfacePatch

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_SurfacePatch> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_SurfacePatch
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_SurfacePatch> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_SurfacePatch

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_SurfacePatch> & ent);

};


%extend RWStepGeom_RWSurfacePatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepGeom_RWSurfaceReplica *
************************************/
class RWStepGeom_RWSurfaceReplica {
	public:
		/****************** RWStepGeom_RWSurfaceReplica ******************/
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceReplica;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfaceReplica;
		 RWStepGeom_RWSurfaceReplica();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_SurfaceReplica

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_SurfaceReplica> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_SurfaceReplica
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_SurfaceReplica> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_SurfaceReplica

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_SurfaceReplica> & ent);

};


%extend RWStepGeom_RWSurfaceReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepGeom_RWSweptSurface *
**********************************/
class RWStepGeom_RWSweptSurface {
	public:
		/****************** RWStepGeom_RWSweptSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWSweptSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSweptSurface;
		 RWStepGeom_RWSweptSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_SweptSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_SweptSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_SweptSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_SweptSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_SweptSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_SweptSurface> & ent);

};


%extend RWStepGeom_RWSweptSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepGeom_RWToroidalSurface *
*************************************/
class RWStepGeom_RWToroidalSurface {
	public:
		/****************** RWStepGeom_RWToroidalSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWToroidalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWToroidalSurface;
		 RWStepGeom_RWToroidalSurface();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_ToroidalSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepGeom_ToroidalSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_ToroidalSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_ToroidalSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_ToroidalSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_ToroidalSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_ToroidalSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_ToroidalSurface> & ent);

};


%extend RWStepGeom_RWToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepGeom_RWTrimmedCurve *
**********************************/
class RWStepGeom_RWTrimmedCurve {
	public:
		/****************** RWStepGeom_RWTrimmedCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWTrimmedCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWTrimmedCurve;
		 RWStepGeom_RWTrimmedCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_TrimmedCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_TrimmedCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_TrimmedCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_TrimmedCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_TrimmedCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_TrimmedCurve> & ent);

};


%extend RWStepGeom_RWTrimmedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepGeom_RWUniformCurve *
**********************************/
class RWStepGeom_RWUniformCurve {
	public:
		/****************** RWStepGeom_RWUniformCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWUniformCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWUniformCurve;
		 RWStepGeom_RWUniformCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_UniformCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_UniformCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_UniformCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_UniformCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_UniformCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_UniformCurve> & ent);

};


%extend RWStepGeom_RWUniformCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class RWStepGeom_RWUniformCurveAndRationalBSplineCurve *
*********************************************************/
class RWStepGeom_RWUniformCurveAndRationalBSplineCurve {
	public:
		/****************** RWStepGeom_RWUniformCurveAndRationalBSplineCurve ******************/
		%feature("compactdefaultargs") RWStepGeom_RWUniformCurveAndRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWUniformCurveAndRationalBSplineCurve;
		 RWStepGeom_RWUniformCurveAndRationalBSplineCurve();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_UniformCurveAndRationalBSplineCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_UniformCurveAndRationalBSplineCurve> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_UniformCurveAndRationalBSplineCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_UniformCurveAndRationalBSplineCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_UniformCurveAndRationalBSplineCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_UniformCurveAndRationalBSplineCurve> & ent);

};


%extend RWStepGeom_RWUniformCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepGeom_RWUniformSurface *
************************************/
class RWStepGeom_RWUniformSurface {
	public:
		/****************** RWStepGeom_RWUniformSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWUniformSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWUniformSurface;
		 RWStepGeom_RWUniformSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_UniformSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_UniformSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_UniformSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_UniformSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_UniformSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_UniformSurface> & ent);

};


%extend RWStepGeom_RWUniformSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface *
*************************************************************/
class RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface {
	public:
		/****************** RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface ******************/
		%feature("compactdefaultargs") RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface;
		 RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_UniformSurfaceAndRationalBSplineSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_UniformSurfaceAndRationalBSplineSurface> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_UniformSurfaceAndRationalBSplineSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_UniformSurfaceAndRationalBSplineSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_UniformSurfaceAndRationalBSplineSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_UniformSurfaceAndRationalBSplineSurface> & ent);

};


%extend RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWStepGeom_RWVector *
****************************/
class RWStepGeom_RWVector {
	public:
		/****************** RWStepGeom_RWVector ******************/
		%feature("compactdefaultargs") RWStepGeom_RWVector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWVector;
		 RWStepGeom_RWVector();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Vector
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepGeom_Vector> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepGeom_Vector

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepGeom_Vector> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepGeom_Vector
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepGeom_Vector> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepGeom_Vector

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepGeom_Vector> & ent);

};


%extend RWStepGeom_RWVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
