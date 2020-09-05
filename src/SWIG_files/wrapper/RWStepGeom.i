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

/************************************
* class RWStepGeom_RWAxis1Placement *
************************************/
class RWStepGeom_RWAxis1Placement {
	public:
		/****************** RWStepGeom_RWAxis1Placement ******************/
		/**** md5 signature: 7d4b9ea5eb9173ec432c3d62341ea964 ****/
		%feature("compactdefaultargs") RWStepGeom_RWAxis1Placement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWAxis1Placement;
		 RWStepGeom_RWAxis1Placement();

		/****************** ReadStep ******************/
		/**** md5 signature: 37ff6fba46036689b63b092586546d4c ****/
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
		/**** md5 signature: ac2da0a82abe6cefffc05f0cc195aeaf ****/
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
		/**** md5 signature: 47ccd9be27b4b6bd86adf23299858bd3 ****/
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
		/**** md5 signature: 9b8bcc4fc25f7ed1789e5c2160ff4e8f ****/
		%feature("compactdefaultargs") RWStepGeom_RWAxis2Placement2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWAxis2Placement2d;
		 RWStepGeom_RWAxis2Placement2d();

		/****************** ReadStep ******************/
		/**** md5 signature: 4f68d50f72a55a25c12e7deb36d5ec2a ****/
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
		/**** md5 signature: 6f6373b5a3901b5bf0c4bcae386bbe33 ****/
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
		/**** md5 signature: edbdfb0142e604b74b6ebe4ad8bf9a39 ****/
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
		/**** md5 signature: 8086ab84889f85327998b167e510d3ca ****/
		%feature("compactdefaultargs") RWStepGeom_RWAxis2Placement3d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWAxis2Placement3d;
		 RWStepGeom_RWAxis2Placement3d();

		/****************** ReadStep ******************/
		/**** md5 signature: 03f13cde30c1a78033774cd1f9acb2f6 ****/
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
		/**** md5 signature: 6d91656225cc2bd709a0f58e876a47bf ****/
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
		/**** md5 signature: 64fc360e37dcc0050fe9ada546bb21c7 ****/
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
		/**** md5 signature: f6fd29c4b3fd84cb71637a23ae157aee ****/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineCurve;
		 RWStepGeom_RWBSplineCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 4808a791963c7dda8f860296b13ed036 ****/
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
		/**** md5 signature: cf0d69907f6ba898ac7cade7ec1d455a ****/
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
		/**** md5 signature: 55802db3dabbca7aca587c0b13aa17fe ****/
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
		/**** md5 signature: f512effaf4519c82cd62aedb2c23457f ****/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineCurveWithKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineCurveWithKnots;
		 RWStepGeom_RWBSplineCurveWithKnots();

		/****************** Check ******************/
		/**** md5 signature: 187fbf75e8abb639240358f5368a9154 ****/
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
		/**** md5 signature: 6310e9d1b1c5652558af31c39f42baf6 ****/
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
		/**** md5 signature: bbb136386346caf740c44c1315d3fcda ****/
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
		/**** md5 signature: cc1025e0dd10768dc5348b65fc4b4747 ****/
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
		/**** md5 signature: 36344859ba60b7e884b524c6a044652b ****/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve;
		 RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve();

		/****************** Check ******************/
		/**** md5 signature: 90fb7858d03c16bfd9ebdfead45a3ae0 ****/
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
		/**** md5 signature: 0b4b25de46b1ab9251daee965d9ad6d0 ****/
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
		/**** md5 signature: 57100b2d9e58d8d201c4d3cef04fa6eb ****/
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
		/**** md5 signature: a3ace3b906f0481927fe8d2c835b7fa3 ****/
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
		/**** md5 signature: 13e6dfb6bd3d7f82a2890c3e4e6825c8 ****/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineSurface;
		 RWStepGeom_RWBSplineSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 89df478557f7cbbc57f996422c6907d7 ****/
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
		/**** md5 signature: 637a90735d575ed631cf3df4337dacbc ****/
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
		/**** md5 signature: 1d88aa1da36e97063cc86bf44e7b9a04 ****/
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
		/**** md5 signature: c8fc6a702c9a9bdc71b3599c9a6b0617 ****/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineSurfaceWithKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineSurfaceWithKnots;
		 RWStepGeom_RWBSplineSurfaceWithKnots();

		/****************** Check ******************/
		/**** md5 signature: 3e8602a1a1df72c774f4e611449c2a6a ****/
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
		/**** md5 signature: 056e6480822babbbf99eda3028e67432 ****/
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
		/**** md5 signature: 1af8c07e6c8ef7f7ee60f22e7564d43e ****/
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
		/**** md5 signature: 2fa59cec5bc4664e0b8b31688731c879 ****/
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
		/**** md5 signature: ef76adac172b14e6a8b93fc8b7ad79e4 ****/
		%feature("compactdefaultargs") RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		 RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface();

		/****************** Check ******************/
		/**** md5 signature: 70783b7ee9775d9ed689e4bba4eb0f41 ****/
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
		/**** md5 signature: 3b9d2dbd80f16e0c2d0823e19bc0a5d4 ****/
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
		/**** md5 signature: 5bb08a31c3c8561f5da355994a011d5d ****/
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
		/**** md5 signature: 7db97ed3b9811a6c15957f8a03f3d29c ****/
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
		/**** md5 signature: ee0389dbc05d58ddea4864ad35aac046 ****/
		%feature("compactdefaultargs") RWStepGeom_RWBezierCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBezierCurve;
		 RWStepGeom_RWBezierCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 2dda0214e0516dd8d915d607d05f40b1 ****/
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
		/**** md5 signature: d7dd92bf669f5a6edf117656ba97b964 ****/
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
		/**** md5 signature: 5383e2b8e5338a832a9351511a74a347 ****/
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
		/**** md5 signature: b9224654b0ee61fa797f2d1f11c079e5 ****/
		%feature("compactdefaultargs") RWStepGeom_RWBezierCurveAndRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBezierCurveAndRationalBSplineCurve;
		 RWStepGeom_RWBezierCurveAndRationalBSplineCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: b97ce471ea72e7a14e4fee4fcf3b2da0 ****/
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
		/**** md5 signature: 68296c039abf8840cf272071c73a3ca1 ****/
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
		/**** md5 signature: 8e386946b01489fd506b6d93abe0c69a ****/
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
		/**** md5 signature: 21eacf9a1a66e01d70d7eb66a41f4b15 ****/
		%feature("compactdefaultargs") RWStepGeom_RWBezierSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBezierSurface;
		 RWStepGeom_RWBezierSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 71446d317a76341a4d4a1309755159e9 ****/
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
		/**** md5 signature: 984771d6d0bfe577b74e782ab66b0b64 ****/
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
		/**** md5 signature: 658b0703a2df7caefd6450d5422e5275 ****/
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
		/**** md5 signature: 8d08fa4d3d1045157899a3bcb8d055ab ****/
		%feature("compactdefaultargs") RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface;
		 RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 1a368cc12a782c99a6bd499a9644ffe8 ****/
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
		/**** md5 signature: 5af71746d7dad23277c5895c22c9975d ****/
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
		/**** md5 signature: 3c1090a05993ed6f5b3bde856439e9b1 ****/
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
		/**** md5 signature: 72dcf7328235eaa17482283b4adb27a6 ****/
		%feature("compactdefaultargs") RWStepGeom_RWBoundaryCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBoundaryCurve;
		 RWStepGeom_RWBoundaryCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: d4c1de5cfc177301f99a53ab2cbc1d9c ****/
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
		/**** md5 signature: cfb98ecce42137dc1a9767bcb25fe9bf ****/
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
		/**** md5 signature: 648c7ecdafa6310388625d47d998fa55 ****/
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
		/**** md5 signature: f16197708f6b64b1408fd5c0564271e7 ****/
		%feature("compactdefaultargs") RWStepGeom_RWBoundedCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBoundedCurve;
		 RWStepGeom_RWBoundedCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: a594d723d26f3e8d3ef97978474c55ce ****/
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
		/**** md5 signature: ebbe95e2f52916b1d12f588ec719bf64 ****/
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
		/**** md5 signature: 8999c3dca2db9895e749b199001c809a ****/
		%feature("compactdefaultargs") RWStepGeom_RWBoundedSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWBoundedSurface;
		 RWStepGeom_RWBoundedSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 47ff8f8a603caf5b7f3dc4b40e0275e5 ****/
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
		/**** md5 signature: 19ba553787eed0c5b0fea914643ee56c ****/
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
		/**** md5 signature: de7375d957c4b5e37eb83070cb323d2a ****/
		%feature("compactdefaultargs") RWStepGeom_RWCartesianPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCartesianPoint;
		 RWStepGeom_RWCartesianPoint();

		/****************** ReadStep ******************/
		/**** md5 signature: 73d1b9c6ccc4efc8e357af127bb9067b ****/
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
		/**** md5 signature: 29107e912c53e050b5f06bba353b764a ****/
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
		/**** md5 signature: d312e7a41bf344e32108a629a861f04c ****/
		%feature("compactdefaultargs") RWStepGeom_RWCartesianTransformationOperator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCartesianTransformationOperator;
		 RWStepGeom_RWCartesianTransformationOperator();

		/****************** ReadStep ******************/
		/**** md5 signature: 12bb6007e0e4608a701a5dc9780c6973 ****/
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
		/**** md5 signature: faae25a3652b8c6ac6d35fa4ebca9f46 ****/
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
		/**** md5 signature: a163466733ad0557c5b4e6c7099d4e62 ****/
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
		/**** md5 signature: 45dbfdff425174ba0164dfa71318e728 ****/
		%feature("compactdefaultargs") RWStepGeom_RWCartesianTransformationOperator3d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCartesianTransformationOperator3d;
		 RWStepGeom_RWCartesianTransformationOperator3d();

		/****************** ReadStep ******************/
		/**** md5 signature: bf6b9ce5cdf7739303e1878d2761ae0c ****/
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
		/**** md5 signature: 33c3e35889a18a73119e17c582521f9b ****/
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
		/**** md5 signature: 87b5827381423469affc12efb588c998 ****/
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
		/**** md5 signature: e8949437b5536dd358f4fe93d3d00cca ****/
		%feature("compactdefaultargs") RWStepGeom_RWCircle;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCircle;
		 RWStepGeom_RWCircle();

		/****************** ReadStep ******************/
		/**** md5 signature: 3cdb944ec294a873ad9190b8b59d9ffa ****/
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
		/**** md5 signature: 14cdaf787f7ee74fecc0217f937bb6e3 ****/
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
		/**** md5 signature: 1b114a97e27672c3b73af9df91151db5 ****/
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
		/**** md5 signature: 5a13133f61c2662bb539bd1a8a97c1b7 ****/
		%feature("compactdefaultargs") RWStepGeom_RWCompositeCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCompositeCurve;
		 RWStepGeom_RWCompositeCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 0957c3743b007b455d31ed5348c15ca4 ****/
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
		/**** md5 signature: 121a9abafad962ad55de6f1e7511b58d ****/
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
		/**** md5 signature: ae94706f02555fadceabbcbadff8e09d ****/
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
		/**** md5 signature: a18eaf7d941598486204a52bee49be59 ****/
		%feature("compactdefaultargs") RWStepGeom_RWCompositeCurveOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCompositeCurveOnSurface;
		 RWStepGeom_RWCompositeCurveOnSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 71133eca3c5d544caa70ed8707ab593b ****/
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
		/**** md5 signature: 83098f0b96d39fd5304c2f16aef47053 ****/
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
		/**** md5 signature: c0cf2722183eedcbcea4ade5c01ea934 ****/
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
		/**** md5 signature: c8d5956aec79d31bd302047e18ce570b ****/
		%feature("compactdefaultargs") RWStepGeom_RWCompositeCurveSegment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCompositeCurveSegment;
		 RWStepGeom_RWCompositeCurveSegment();

		/****************** ReadStep ******************/
		/**** md5 signature: 8369a8ea2f1e9dc84f83903a04b394a0 ****/
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
		/**** md5 signature: ebbe5e40ca944d91e43da66322f66b99 ****/
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
		/**** md5 signature: eb4bb65d2442fe6e2e0d74b4a72b146e ****/
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
		/**** md5 signature: 7fa46345f111694403753987e5e54c91 ****/
		%feature("compactdefaultargs") RWStepGeom_RWConic;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWConic;
		 RWStepGeom_RWConic();

		/****************** ReadStep ******************/
		/**** md5 signature: 3dbabc62d93b54ecd07ab06a74b30d59 ****/
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
		/**** md5 signature: c05d84428dfa436bcdac3c0cacb6e6a0 ****/
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
		/**** md5 signature: 0b868c8010b1bed653adeadb1fe68b19 ****/
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
		/**** md5 signature: 502e63d997881352df807c9661aedee9 ****/
		%feature("compactdefaultargs") RWStepGeom_RWConicalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWConicalSurface;
		 RWStepGeom_RWConicalSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 99b35c5ff5a853ea73489814047eeec3 ****/
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
		/**** md5 signature: f886410e40361f2c863f9a08dff9807e ****/
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
		/**** md5 signature: 2976cac801e1a07b5482892c75890720 ****/
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
		/**** md5 signature: 552a0a05453539e5609cc6e1014ed72d ****/
		%feature("compactdefaultargs") RWStepGeom_RWCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCurve;
		 RWStepGeom_RWCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: cda2c2b624c864a4a4802eca208552de ****/
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
		/**** md5 signature: 51468748049a4c54575a170670578915 ****/
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
		/**** md5 signature: 56e856d96ab6294564e63dcc606f3ff9 ****/
		%feature("compactdefaultargs") RWStepGeom_RWCurveBoundedSurface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepGeom_RWCurveBoundedSurface;
		 RWStepGeom_RWCurveBoundedSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 2d1adc41178c24048804c004800c45a0 ****/
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
		/**** md5 signature: 423b874f8447af9058e3ce078a38b35c ****/
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
		/**** md5 signature: 722b2bf929de328cbdfc78af3b2fc8d7 ****/
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
		/**** md5 signature: 4889e2af9e706f785818b2349d73d857 ****/
		%feature("compactdefaultargs") RWStepGeom_RWCurveReplica;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCurveReplica;
		 RWStepGeom_RWCurveReplica();

		/****************** ReadStep ******************/
		/**** md5 signature: 8cf80c168bd83f8932c19974b7391f34 ****/
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
		/**** md5 signature: 4e985ac7e9f0d8afca7bfb5a303c195d ****/
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
		/**** md5 signature: fd398494b6f53e2cafcd76a28b0d6f93 ****/
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
		/**** md5 signature: 286bf9c2b077c5e41461180c50f62421 ****/
		%feature("compactdefaultargs") RWStepGeom_RWCylindricalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWCylindricalSurface;
		 RWStepGeom_RWCylindricalSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 2b221051c396a912d61edf5d6a6cb8f0 ****/
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
		/**** md5 signature: c4dbb85846b7a43fb3c4b4707f4874ac ****/
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
		/**** md5 signature: 4f88bad8d8c06160f5ad730915f2439c ****/
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
		/**** md5 signature: a7ff5cb866f1de3690e5648c02a1942f ****/
		%feature("compactdefaultargs") RWStepGeom_RWDegeneratePcurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWDegeneratePcurve;
		 RWStepGeom_RWDegeneratePcurve();

		/****************** ReadStep ******************/
		/**** md5 signature: e7a754a41572448638c50e711717ce1b ****/
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
		/**** md5 signature: 9eae7a6a4b24b550ec10b6527b400c0f ****/
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
		/**** md5 signature: b9a750f98acd98f94b06ec9b94e15fe0 ****/
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
		/**** md5 signature: e81698d39aa3b9a72663bf7d6ba292c9 ****/
		%feature("compactdefaultargs") RWStepGeom_RWDegenerateToroidalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWDegenerateToroidalSurface;
		 RWStepGeom_RWDegenerateToroidalSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 9a90649c3ec27bc3633ba5396382541a ****/
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
		/**** md5 signature: ca17921479ca8eb4217810d4a59a6972 ****/
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
		/**** md5 signature: 8a8eee86f647c8d6674dae2b4c73ae15 ****/
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
		/**** md5 signature: c79ffb9f74109585dda59b45b9b5b9bc ****/
		%feature("compactdefaultargs") RWStepGeom_RWDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWDirection;
		 RWStepGeom_RWDirection();

		/****************** Check ******************/
		/**** md5 signature: a788a0733a4079069d15c715ba03f6cd ****/
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
		/**** md5 signature: a90a7e7ca3de4207e1e5449f650ec6d6 ****/
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
		/**** md5 signature: 070175d94e2aabd132939503b24b9a46 ****/
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
		/**** md5 signature: da16fcfede1fbedefcadf1c6f3b32f1b ****/
		%feature("compactdefaultargs") RWStepGeom_RWElementarySurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWElementarySurface;
		 RWStepGeom_RWElementarySurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 2d87b8ec35f90906d54d2b51ae3abe3a ****/
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
		/**** md5 signature: 624bafc27498ac1311a6b8ba54959cb3 ****/
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
		/**** md5 signature: 02a1bdb0e100adcd1b9c9532721eef61 ****/
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
		/**** md5 signature: 7d7e8ce308951d7291ba4985062a3718 ****/
		%feature("compactdefaultargs") RWStepGeom_RWEllipse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWEllipse;
		 RWStepGeom_RWEllipse();

		/****************** Check ******************/
		/**** md5 signature: 7c047e94383cf38f0ffea9692111e0f1 ****/
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
		/**** md5 signature: 400d3abd51d4f7a106772e9645bab985 ****/
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
		/**** md5 signature: 70e6731c96f6be40d3ccdc5b47896084 ****/
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
		/**** md5 signature: f737f384f80ae5452349eefa8855879c ****/
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
		/**** md5 signature: e5a036e2253513339e18cc73b893eca2 ****/
		%feature("compactdefaultargs") RWStepGeom_RWEvaluatedDegeneratePcurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWEvaluatedDegeneratePcurve;
		 RWStepGeom_RWEvaluatedDegeneratePcurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 9a3e50571c8667f33dba1c5a3f905598 ****/
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
		/**** md5 signature: 4c6ebfb749fc52321efb00824dfb7d75 ****/
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
		/**** md5 signature: a745371d6b34084e36166ca838b4c057 ****/
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
		/**** md5 signature: 9e5acf84efbbf54ac3def4e891dc2809 ****/
		%feature("compactdefaultargs") RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
		 RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx();

		/****************** ReadStep ******************/
		/**** md5 signature: 17896afc12c5c5dc82e3cba971022c74 ****/
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
		/**** md5 signature: 660a7d7d0a2bd3c3f39f85d75e4b885f ****/
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
		/**** md5 signature: b44e5f1c080cf94e979c3ea1c661bac0 ****/
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
		/**** md5 signature: 02909e3e182d7c02ae4c98a4f03d9a38 ****/
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWGeometricRepresentationContext;
		 RWStepGeom_RWGeometricRepresentationContext();

		/****************** ReadStep ******************/
		/**** md5 signature: 469b32563208a1c5e71983d9e94bcb04 ****/
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
		/**** md5 signature: a4342837b753eaa802481db3a0b883d1 ****/
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
		/**** md5 signature: b6985cdea62cf149b533c5208774b228 ****/
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext;
		 RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext();

		/****************** ReadStep ******************/
		/**** md5 signature: 70ab6b52c267fb6814ff49d996f2b44e ****/
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
		/**** md5 signature: 19806ef6682ec5548a5b1f6943748325 ****/
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
		/**** md5 signature: ae9d63b4db6fb9a6d93ad43263e22725 ****/
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
		/**** md5 signature: 170d02d17ae5ae7ef9be3a16bf5a7747 ****/
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext;
		 RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext();

		/****************** ReadStep ******************/
		/**** md5 signature: 0dbe8fcd7d557dbb6d7af96e69e70834 ****/
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
		/**** md5 signature: 5e491c6201c0a880352c8a361fc1d173 ****/
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
		/**** md5 signature: 684203954e3c1da0ab1a887071c1d977 ****/
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
		/**** md5 signature: 32bc321f358b4f25ab353b658662b3ec ****/
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWGeometricRepresentationItem;
		 RWStepGeom_RWGeometricRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 83d765962e97d6e0bd8c6227a013309c ****/
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
		/**** md5 signature: 965fdf0d56dcb268c297224b12749ea5 ****/
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
		/**** md5 signature: 8d742cf57bd26be48f884f152b4d99a9 ****/
		%feature("compactdefaultargs") RWStepGeom_RWHyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWHyperbola;
		 RWStepGeom_RWHyperbola();

		/****************** ReadStep ******************/
		/**** md5 signature: 0efa305c5097526715e61c9056e6e394 ****/
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
		/**** md5 signature: 4339ce7e5bf24e237982e85da3ac10a7 ****/
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
		/**** md5 signature: 6c83c1a75dd991ba888042945861806e ****/
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
		/**** md5 signature: d3d198233d4ba691a771e87abe94e429 ****/
		%feature("compactdefaultargs") RWStepGeom_RWIntersectionCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWIntersectionCurve;
		 RWStepGeom_RWIntersectionCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: debe323d4a4be855b3954361f8a1a079 ****/
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
		/**** md5 signature: c9c00e4f0e28fc70b0c7788af44bad3d ****/
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
		/**** md5 signature: 84bc8a7ab038f3a97b704f07bbd44876 ****/
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
		/**** md5 signature: 6ceb8dd154a6d2fb3a259cfdb9278683 ****/
		%feature("compactdefaultargs") RWStepGeom_RWLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWLine;
		 RWStepGeom_RWLine();

		/****************** ReadStep ******************/
		/**** md5 signature: cdeb3ba605377b634974b66e9ea13b1d ****/
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
		/**** md5 signature: 862a97733f088cab4e25ec931de0a029 ****/
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
		/**** md5 signature: 747f1330370c9e370a860448ee1885b9 ****/
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
		/**** md5 signature: df035e73f6440eaafafc55170fdb56a8 ****/
		%feature("compactdefaultargs") RWStepGeom_RWOffsetCurve3d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWOffsetCurve3d;
		 RWStepGeom_RWOffsetCurve3d();

		/****************** ReadStep ******************/
		/**** md5 signature: 1c8d01465ec08ab6d070358292f241a1 ****/
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
		/**** md5 signature: 3b81585291f19dd350055cf8e23fd5f1 ****/
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
		/**** md5 signature: 937f84e93014043e60354a4e70421457 ****/
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
		/**** md5 signature: 084cc30ea561dbe6213eb281499ffa1e ****/
		%feature("compactdefaultargs") RWStepGeom_RWOffsetSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWOffsetSurface;
		 RWStepGeom_RWOffsetSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 44de17b4bfcb6f96b4600b76732fc1ed ****/
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
		/**** md5 signature: 34119399f0e4229d44f6772603d43133 ****/
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
		/**** md5 signature: 86fe1f350e7886f5531bbb879cab0845 ****/
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
		/**** md5 signature: 9009b9ee8a6406d60b2f65d11c230145 ****/
		%feature("compactdefaultargs") RWStepGeom_RWOrientedSurface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepGeom_RWOrientedSurface;
		 RWStepGeom_RWOrientedSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: b40957dd73c11d53a729a7680edf0516 ****/
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
		/**** md5 signature: a2972cca4722e633fb3b148e56158747 ****/
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
		/**** md5 signature: 7f8afc403f242dceee0ae5232ebcf52c ****/
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
		/**** md5 signature: 729feaa676f276d0c22914ef201a9f39 ****/
		%feature("compactdefaultargs") RWStepGeom_RWOuterBoundaryCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWOuterBoundaryCurve;
		 RWStepGeom_RWOuterBoundaryCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 305bae04b8ef253be2f93e9386742316 ****/
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
		/**** md5 signature: 33aa783a5369a70bd53f9b379b0bd78d ****/
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
		/**** md5 signature: 5f391052ef6e88ea5ea0b97286ff33e7 ****/
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
		/**** md5 signature: 9d349061747d3ff17ad53acbac3af5ca ****/
		%feature("compactdefaultargs") RWStepGeom_RWParabola;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWParabola;
		 RWStepGeom_RWParabola();

		/****************** ReadStep ******************/
		/**** md5 signature: a137ce5cf827fe5ff8ffeb3cd3c3471f ****/
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
		/**** md5 signature: 1b7385016b24f8b36a4999c004bde3c6 ****/
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
		/**** md5 signature: 5a1c28dce4213e260807eadfee7dafe1 ****/
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
		/**** md5 signature: a3f7bf2c7f4f5ef3d2250873591da47e ****/
		%feature("compactdefaultargs") RWStepGeom_RWPcurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPcurve;
		 RWStepGeom_RWPcurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 08a4fe6f7f84fa1903861e96f512cb9b ****/
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
		/**** md5 signature: f668f7222d6d45a263a2936de193318f ****/
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
		/**** md5 signature: 36d0ebb996cada81f88beca4f71b3096 ****/
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
		/**** md5 signature: 93c285c2be48cb40c3891e895ee2ed88 ****/
		%feature("compactdefaultargs") RWStepGeom_RWPlacement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPlacement;
		 RWStepGeom_RWPlacement();

		/****************** ReadStep ******************/
		/**** md5 signature: 189c44ccadf8e835f2aaadec57ae9bbc ****/
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
		/**** md5 signature: c291d9eac5b3ad45efa44ff73e49c1d9 ****/
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
		/**** md5 signature: 8c4f374a1dcce505d69c7b9b716e550f ****/
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
		/**** md5 signature: b2d83b3e7e29da5bca586b6e19792ef3 ****/
		%feature("compactdefaultargs") RWStepGeom_RWPlane;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPlane;
		 RWStepGeom_RWPlane();

		/****************** ReadStep ******************/
		/**** md5 signature: d2c6dc29969b4e57b73e1fbd07912266 ****/
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
		/**** md5 signature: 1188efd7c80feeb13462dde80524d66a ****/
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
		/**** md5 signature: 28ee72dd522cc279dd2c97359b975545 ****/
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
		/**** md5 signature: 8c5ffb8ebc4ac05460f3a497d7153b15 ****/
		%feature("compactdefaultargs") RWStepGeom_RWPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPoint;
		 RWStepGeom_RWPoint();

		/****************** ReadStep ******************/
		/**** md5 signature: 246b390abc793c2e2b06d9d77bca6a1d ****/
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
		/**** md5 signature: 54ee152c68f32466f22adfd2ca19226e ****/
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
		/**** md5 signature: 98b60b904b45e471abdbaf22e69431c0 ****/
		%feature("compactdefaultargs") RWStepGeom_RWPointOnCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPointOnCurve;
		 RWStepGeom_RWPointOnCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: be85eaa7906e08cbf0b84d207701496b ****/
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
		/**** md5 signature: 1b1fae3278542d9db0f04d9e34db2335 ****/
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
		/**** md5 signature: 2ee8dde04338a749196f8dc30c0a4350 ****/
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
		/**** md5 signature: 55f751177629595f08161e177cd2a517 ****/
		%feature("compactdefaultargs") RWStepGeom_RWPointOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPointOnSurface;
		 RWStepGeom_RWPointOnSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: f27dd37df91308fe7ce462a7ed50558f ****/
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
		/**** md5 signature: 0283544195763adb93e71cc722d5910a ****/
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
		/**** md5 signature: 3b370b97ba64c7c43c3f68c640f73454 ****/
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
		/**** md5 signature: bc9e88cf267b0e80145a16ae2c41a49a ****/
		%feature("compactdefaultargs") RWStepGeom_RWPointReplica;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPointReplica;
		 RWStepGeom_RWPointReplica();

		/****************** ReadStep ******************/
		/**** md5 signature: dbcba54c7324d5e4be7172db56f637e3 ****/
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
		/**** md5 signature: 014e4270f7cf25ad48087f4eb562b95a ****/
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
		/**** md5 signature: 718c436e8cb449247ed3bd6a94223901 ****/
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
		/**** md5 signature: 81e738bee5fc5b8baa2bb5c11548dcd4 ****/
		%feature("compactdefaultargs") RWStepGeom_RWPolyline;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWPolyline;
		 RWStepGeom_RWPolyline();

		/****************** ReadStep ******************/
		/**** md5 signature: 177c808b61723ced00668d26834ac6db ****/
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
		/**** md5 signature: 84a30eb3c55fd8f80109f65fd6bd791c ****/
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
		/**** md5 signature: 3a59c7fd8ff03a7d0388febf087019b5 ****/
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
		/**** md5 signature: 039ec554b5ba5cfdbdb977c86590d066 ****/
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWQuasiUniformCurve;
		 RWStepGeom_RWQuasiUniformCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: ff1812a20da0454cacf0de0f4d556e7a ****/
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
		/**** md5 signature: 63af369f175ad83b1d191002232ab41d ****/
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
		/**** md5 signature: dcbaca55d2f1f60dee90bdd88892eeba ****/
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
		/**** md5 signature: 621e31a70f4911687466203f69e35198 ****/
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve;
		 RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: cf6de311809f26e9c6c73776af4ac1c9 ****/
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
		/**** md5 signature: 3bdb7a520271a76f2b71c3ac62d41630 ****/
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
		/**** md5 signature: a5ff936544c7cf2d7ff0b5ca2b72f563 ****/
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
		/**** md5 signature: f309fafcb637bd36aa2c9682af2b77fd ****/
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWQuasiUniformSurface;
		 RWStepGeom_RWQuasiUniformSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: a9b86c8d5ae59ef84364211fd985005d ****/
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
		/**** md5 signature: 136d1514722b045cbe36f9028443004b ****/
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
		/**** md5 signature: e317076fcac85cb27667fc4f67373d7f ****/
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
		/**** md5 signature: 54fa816d66574c7bf5c8634367ba3a7d ****/
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface;
		 RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 61a007a4855830f64fc80be09baa9bed ****/
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
		/**** md5 signature: 1ea14a0c1a557d7280522fc5351877b8 ****/
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
		/**** md5 signature: 75f335e2007be441bd243c393056df7d ****/
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
		/**** md5 signature: ca168c8ad279d2ece2baf08611893679 ****/
		%feature("compactdefaultargs") RWStepGeom_RWRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWRationalBSplineCurve;
		 RWStepGeom_RWRationalBSplineCurve();

		/****************** Check ******************/
		/**** md5 signature: 0b41057af9ae1211340ecd0a0b331d93 ****/
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
		/**** md5 signature: 618ac19b39464596c92bd64a2b40b6e7 ****/
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
		/**** md5 signature: ccf9237cd4187e59f770108f189dc938 ****/
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
		/**** md5 signature: dd146a1572150c7ea391cab4ebf418d0 ****/
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
		/**** md5 signature: e262d313fa3b22b9f337347ba9dcc2c6 ****/
		%feature("compactdefaultargs") RWStepGeom_RWRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWRationalBSplineSurface;
		 RWStepGeom_RWRationalBSplineSurface();

		/****************** Check ******************/
		/**** md5 signature: 4c41204e61886bc637ed024522fd1974 ****/
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
		/**** md5 signature: 4a60f753402e977e143a20db8118fcf7 ****/
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
		/**** md5 signature: 6a47e3e27f6ec7037aa30e33423b6ac6 ****/
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
		/**** md5 signature: c7f72db1313a44810dbfde1954261e28 ****/
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
		/**** md5 signature: acbe0477581509ca7d50d445e351df6a ****/
		%feature("compactdefaultargs") RWStepGeom_RWRectangularCompositeSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWRectangularCompositeSurface;
		 RWStepGeom_RWRectangularCompositeSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 8a3a5e7a22e254b66f7c3a872faaed1a ****/
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
		/**** md5 signature: 8c6530ed87ed4dc4fc98b7d98e66c901 ****/
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
		/**** md5 signature: 6b55275ca8a40902c923c2f951a0fe20 ****/
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
		/**** md5 signature: a2fbf7107974363ea110bfa5455ce828 ****/
		%feature("compactdefaultargs") RWStepGeom_RWRectangularTrimmedSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWRectangularTrimmedSurface;
		 RWStepGeom_RWRectangularTrimmedSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 10a37f924bce933b57dd3a93da053c1a ****/
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
		/**** md5 signature: ab77da3b6103b2852404589a5c791e3e ****/
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
		/**** md5 signature: 43d6b5b02762b1e2aacd878895b25b7c ****/
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
		/**** md5 signature: e585638b16da206e53a15158982c3616 ****/
		%feature("compactdefaultargs") RWStepGeom_RWReparametrisedCompositeCurveSegment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWReparametrisedCompositeCurveSegment;
		 RWStepGeom_RWReparametrisedCompositeCurveSegment();

		/****************** ReadStep ******************/
		/**** md5 signature: dd156184d17797bff9a68a60dd602b8b ****/
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
		/**** md5 signature: 80bb7b8798f563ddd2fb2a3a04d004eb ****/
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
		/**** md5 signature: 7d96990fd4c7ad5f3590c9eed10e4262 ****/
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
		/**** md5 signature: 0d5b4e551c02e4b558d8b0e579ae8979 ****/
		%feature("compactdefaultargs") RWStepGeom_RWSeamCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSeamCurve;
		 RWStepGeom_RWSeamCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 7d5516a9fad63d0ea16e9ef820580fd9 ****/
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
		/**** md5 signature: 5a859ff6ff74473b462d5a19b371cd96 ****/
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
		/**** md5 signature: 8beba0f2f6037208ccb8c74d92df8ec4 ****/
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
		/**** md5 signature: 5bc0a8a127d82adf9db1772c20f31103 ****/
		%feature("compactdefaultargs") RWStepGeom_RWSphericalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSphericalSurface;
		 RWStepGeom_RWSphericalSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 3ffdf8bdd76cfd136ee88d294edaa186 ****/
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
		/**** md5 signature: ecdf3891282ad13d6d328d8d9fb4a97e ****/
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
		/**** md5 signature: c54afb38093a75120e28dffe06cbd49d ****/
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
		/**** md5 signature: 600be62550365adc83b7870d95a786ba ****/
		%feature("compactdefaultargs") RWStepGeom_RWSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurface;
		 RWStepGeom_RWSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 827c2398b3eedb642ad293ad0946b9ce ****/
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
		/**** md5 signature: bbb85dd7c1caffb27a7f5fb3dcacdbdb ****/
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
		/**** md5 signature: d228a88d5e363221edff3053483983cf ****/
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfaceCurve;
		 RWStepGeom_RWSurfaceCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 5a2580f3ff759d66e6cd1027a3363ddb ****/
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
		/**** md5 signature: 740eb120379bbc738cf1c9f2a7ab7a32 ****/
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
		/**** md5 signature: af2ecd44f33ff6a5248fe47ff8cb7f9c ****/
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
		/**** md5 signature: 0a50f7aba55f7afad7de07a2aa5a5c48 ****/
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceCurveAndBoundedCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfaceCurveAndBoundedCurve;
		 RWStepGeom_RWSurfaceCurveAndBoundedCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 04f75df590741f710280093c971f5182 ****/
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
		/**** md5 signature: 9ec92d4b0ab878069ca6318f6ee26be0 ****/
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
		/**** md5 signature: 3f22ee4dae76601f4b45853da6c190e1 ****/
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
		/**** md5 signature: a04b0a60caf283f30dd8b11c677572de ****/
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceOfLinearExtrusion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfaceOfLinearExtrusion;
		 RWStepGeom_RWSurfaceOfLinearExtrusion();

		/****************** ReadStep ******************/
		/**** md5 signature: a5f51254fa6bf9232629e6217530fdca ****/
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
		/**** md5 signature: 357a5f59eaca6caa11c11776a9e46569 ****/
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
		/**** md5 signature: e4ca413ae7af44c6c7356a6d3c48d458 ****/
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
		/**** md5 signature: 8cb698498408e1a52233b6149a395a8b ****/
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfaceOfRevolution;
		 RWStepGeom_RWSurfaceOfRevolution();

		/****************** ReadStep ******************/
		/**** md5 signature: 35e13f238801dc5fafa73bcb1d18e772 ****/
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
		/**** md5 signature: 81d0be23c060f02ea598bd68cbe1b99a ****/
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
		/**** md5 signature: 08c79201c37082519131c434ea566102 ****/
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
		/**** md5 signature: 844117723a3dfa1ed63829babdf7dfca ****/
		%feature("compactdefaultargs") RWStepGeom_RWSurfacePatch;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfacePatch;
		 RWStepGeom_RWSurfacePatch();

		/****************** ReadStep ******************/
		/**** md5 signature: 70986cbaf7ce17ebeea7b3191f079dbe ****/
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
		/**** md5 signature: ea68651a4e3b59e91412d56857fdf3dc ****/
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
		/**** md5 signature: 0e4f1ae70d9409da13ec891ada207ff8 ****/
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
		/**** md5 signature: 0ee6b6d26e26793d1e088ab816fa5d2a ****/
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceReplica;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSurfaceReplica;
		 RWStepGeom_RWSurfaceReplica();

		/****************** ReadStep ******************/
		/**** md5 signature: 80eeb7b68f9ebfe5386f34ea14610959 ****/
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
		/**** md5 signature: 9425d79231f8e9977804ab041e18500f ****/
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
		/**** md5 signature: b29b19356e5a7c882d3f9e4d2721ae32 ****/
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
		/**** md5 signature: 44b746455c8caa10b50c348b922c6ce4 ****/
		%feature("compactdefaultargs") RWStepGeom_RWSweptSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWSweptSurface;
		 RWStepGeom_RWSweptSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: d8c066a0add9dc58bfb4362f4f701cdd ****/
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
		/**** md5 signature: 52b3fd0781ea147b9ec3b232a5b8ec0b ****/
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
		/**** md5 signature: b099141d6ca44dd251e469bd2dc254b6 ****/
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
		/**** md5 signature: 4e908995a7cdf91f929f29dd62d388d3 ****/
		%feature("compactdefaultargs") RWStepGeom_RWToroidalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWToroidalSurface;
		 RWStepGeom_RWToroidalSurface();

		/****************** Check ******************/
		/**** md5 signature: 546d733250741f5fb00de50f3decb39d ****/
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
		/**** md5 signature: f9e54adc0c00cfb25632f55bb6947cd6 ****/
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
		/**** md5 signature: 298a207f1dab39cd1bbb2dcc850d1e54 ****/
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
		/**** md5 signature: 4b0c2eec6f94dcc79eaec18552232596 ****/
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
		/**** md5 signature: 9637aeb9fde570439ea8e2c3a25fa810 ****/
		%feature("compactdefaultargs") RWStepGeom_RWTrimmedCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWTrimmedCurve;
		 RWStepGeom_RWTrimmedCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 89b6863a8c94770d0810fc8dfd534590 ****/
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
		/**** md5 signature: 48bfd613406f6eb6aa79ef2f49dd2e04 ****/
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
		/**** md5 signature: bc69592963afe1f9e6a9a7ebb10d4943 ****/
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
		/**** md5 signature: 8113dad57c531d10fbcabccfc9b048e1 ****/
		%feature("compactdefaultargs") RWStepGeom_RWUniformCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWUniformCurve;
		 RWStepGeom_RWUniformCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 89e4f1408614c785ca45b09b80aae4f1 ****/
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
		/**** md5 signature: c0a3bd82959b3a29cf3664f0bcc196eb ****/
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
		/**** md5 signature: 00bd6b8abfef8b6382bbce1a594e024b ****/
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
		/**** md5 signature: 9e41e029063fe54b0208519b90b30380 ****/
		%feature("compactdefaultargs") RWStepGeom_RWUniformCurveAndRationalBSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWUniformCurveAndRationalBSplineCurve;
		 RWStepGeom_RWUniformCurveAndRationalBSplineCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: 99d5c8504c7bcbb1fc916fa033bafb8f ****/
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
		/**** md5 signature: 55ee804f3aa53d60e3f126f47a71d6bf ****/
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
		/**** md5 signature: b19574f47f30d968971e395cbdd25d08 ****/
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
		/**** md5 signature: 5d787dfd70ebbe5ee0a924a7e3c595d0 ****/
		%feature("compactdefaultargs") RWStepGeom_RWUniformSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWUniformSurface;
		 RWStepGeom_RWUniformSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 5fd04558caf993133e965d23f4d133fd ****/
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
		/**** md5 signature: 69ddf79f5665ec0e34b438f7d6452f3c ****/
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
		/**** md5 signature: 2bd5129e65c48ff26744c50d2826650f ****/
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
		/**** md5 signature: 3e2ccf138ec408b101bf8e209dbf2376 ****/
		%feature("compactdefaultargs") RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface;
		 RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: d1d7120f84eeb4957b4caae9015f9f0c ****/
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
		/**** md5 signature: 90f1e7305f8665ce07ab8147e275e34c ****/
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
		/**** md5 signature: 68e56ab79fe4faccba3a7c0e4b6b6156 ****/
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
		/**** md5 signature: d7f12a1ca0fd789a97cfc98ac4dd4af7 ****/
		%feature("compactdefaultargs") RWStepGeom_RWVector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepGeom_RWVector;
		 RWStepGeom_RWVector();

		/****************** Check ******************/
		/**** md5 signature: 0ab6823c4c44bb18eb9a3076903b3439 ****/
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
		/**** md5 signature: 6a87bc6dec71e3d79050d6a6843ad6e9 ****/
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
		/**** md5 signature: bb9ff0b9552d294dcb2cf1f74d1d8ec9 ****/
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
		/**** md5 signature: dc159ba5a484e5b989e47623ccb55efc ****/
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
