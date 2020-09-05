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
%define RWSTEPVISUALDOCSTRING
"RWStepVisual module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepvisual.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPVISUALDOCSTRING) RWStepVisual


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
#include<RWStepVisual_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepVisual_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<StepRepr_module.hxx>
#include<StepElement_module.hxx>
#include<MoniTool_module.hxx>
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
%import StepVisual.i

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

/*************************************************
* class RWStepVisual_RWAnnotationCurveOccurrence *
*************************************************/
class RWStepVisual_RWAnnotationCurveOccurrence {
	public:
		/****************** RWStepVisual_RWAnnotationCurveOccurrence ******************/
		/**** md5 signature: c94a60c5a879768b873e4c7da3b67339 ****/
		%feature("compactdefaultargs") RWStepVisual_RWAnnotationCurveOccurrence;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWAnnotationCurveOccurrence;
		 RWStepVisual_RWAnnotationCurveOccurrence();

		/****************** ReadStep ******************/
		/**** md5 signature: 7af54a135d80a48e60a730e76ffc4d4c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_AnnotationCurveOccurrence

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_AnnotationCurveOccurrence> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5959405f8093731d0a43f6c75b4320b6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_AnnotationCurveOccurrence
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_AnnotationCurveOccurrence> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 398684b32b63826cde5fb3172a8a8534 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_AnnotationCurveOccurrence

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_AnnotationCurveOccurrence> & ent);

};


%extend RWStepVisual_RWAnnotationCurveOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************************************************************
* class RWStepVisual_RWAnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem *
***************************************************************************************************************/
class RWStepVisual_RWAnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem {
	public:
		/****************** RWStepVisual_RWAnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem ******************/
		/**** md5 signature: 2a33b5cb3d683ca438d7cd37a7ce38c8 ****/
		%feature("compactdefaultargs") RWStepVisual_RWAnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWAnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem;
		 RWStepVisual_RWAnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem();

		/****************** ReadStep ******************/
		/**** md5 signature: e668f2cad37dc67325c47b797c55fa18 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 68456b067ccb919f9eef4eb08e314e7d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: af604c05349ea643ce80089e03d9db6b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem> & ent);

};


%extend RWStepVisual_RWAnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepVisual_RWAnnotationFillArea *
******************************************/
class RWStepVisual_RWAnnotationFillArea {
	public:
		/****************** RWStepVisual_RWAnnotationFillArea ******************/
		/**** md5 signature: e7cdf9394ce5ae83e8e5b84cda0d8ddc ****/
		%feature("compactdefaultargs") RWStepVisual_RWAnnotationFillArea;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWAnnotationFillArea;
		 RWStepVisual_RWAnnotationFillArea();

		/****************** ReadStep ******************/
		/**** md5 signature: 03d2cbc6723016d0bebdd0a23c1a998e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_AnnotationFillArea

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_AnnotationFillArea> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0aa775dd9220e338b64edf65cad3f8c4 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_AnnotationFillArea
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_AnnotationFillArea> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 5f28f7971435221aca78bbad8d9f8fb7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_AnnotationFillArea

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_AnnotationFillArea> & ent);

};


%extend RWStepVisual_RWAnnotationFillArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepVisual_RWAnnotationFillAreaOccurrence *
****************************************************/
class RWStepVisual_RWAnnotationFillAreaOccurrence {
	public:
		/****************** RWStepVisual_RWAnnotationFillAreaOccurrence ******************/
		/**** md5 signature: 2f44ca702f637a99aeff2263172b901c ****/
		%feature("compactdefaultargs") RWStepVisual_RWAnnotationFillAreaOccurrence;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWAnnotationFillAreaOccurrence;
		 RWStepVisual_RWAnnotationFillAreaOccurrence();

		/****************** ReadStep ******************/
		/**** md5 signature: 508a5790ddf4dde8dd58df8516c0e329 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_AnnotationFillAreaOccurrence

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_AnnotationFillAreaOccurrence> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2ad9261ac6c42da27564b9925ed64bb5 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_AnnotationFillAreaOccurrence
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_AnnotationFillAreaOccurrence> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 6041c0e72e75838160a75a7f88892f28 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_AnnotationFillAreaOccurrence

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_AnnotationFillAreaOccurrence> & ent);

};


%extend RWStepVisual_RWAnnotationFillAreaOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepVisual_RWAnnotationOccurrence *
********************************************/
class RWStepVisual_RWAnnotationOccurrence {
	public:
		/****************** RWStepVisual_RWAnnotationOccurrence ******************/
		/**** md5 signature: 6ec4b888f2854a354a5346d6003734e3 ****/
		%feature("compactdefaultargs") RWStepVisual_RWAnnotationOccurrence;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWAnnotationOccurrence;
		 RWStepVisual_RWAnnotationOccurrence();

		/****************** ReadStep ******************/
		/**** md5 signature: aacbdc1431bcc6ea3ac61bfcdf5e81b3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_AnnotationOccurrence

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_AnnotationOccurrence> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0818dac8a21ffd431b5e7d7acd632628 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_AnnotationOccurrence
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_AnnotationOccurrence> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4ca5e0ee4cd3b631b0d2f1d45738ca93 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_AnnotationOccurrence

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_AnnotationOccurrence> & ent);

};


%extend RWStepVisual_RWAnnotationOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepVisual_RWAnnotationPlane *
***************************************/
class RWStepVisual_RWAnnotationPlane {
	public:
		/****************** RWStepVisual_RWAnnotationPlane ******************/
		/**** md5 signature: c7e00a0db68810f65689ff5d64aac661 ****/
		%feature("compactdefaultargs") RWStepVisual_RWAnnotationPlane;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWAnnotationPlane;
		 RWStepVisual_RWAnnotationPlane();

		/****************** ReadStep ******************/
		/**** md5 signature: d6e1bf5d1284c467092cb437bf29b605 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_AnnotationPlane

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_AnnotationPlane> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0fb95ec089cfad42f7eb1052e06bdd7d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_AnnotationPlane
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_AnnotationPlane> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9a1c597735158fb8bff17f859824cd48 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_AnnotationPlane

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_AnnotationPlane> & ent);

};


%extend RWStepVisual_RWAnnotationPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepVisual_RWAreaInSet *
*********************************/
class RWStepVisual_RWAreaInSet {
	public:
		/****************** RWStepVisual_RWAreaInSet ******************/
		/**** md5 signature: 4b01b9d344070127bc8c4f282ee9d7e8 ****/
		%feature("compactdefaultargs") RWStepVisual_RWAreaInSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWAreaInSet;
		 RWStepVisual_RWAreaInSet();

		/****************** ReadStep ******************/
		/**** md5 signature: 400e53e7eb6b7cc6e4a3eb26ff51750c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_AreaInSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_AreaInSet> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3f08613828a97606d50a32f8ad23d5c0 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_AreaInSet
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_AreaInSet> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 0701b407a576876cc663c4c0cf5825ee ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_AreaInSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_AreaInSet> & ent);

};


%extend RWStepVisual_RWAreaInSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepVisual_RWBackgroundColour *
****************************************/
class RWStepVisual_RWBackgroundColour {
	public:
		/****************** RWStepVisual_RWBackgroundColour ******************/
		/**** md5 signature: c6154dd2b7cc9afe2d191cda8449d405 ****/
		%feature("compactdefaultargs") RWStepVisual_RWBackgroundColour;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWBackgroundColour;
		 RWStepVisual_RWBackgroundColour();

		/****************** ReadStep ******************/
		/**** md5 signature: 01477b1a764573fc9d597354640ce53b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_BackgroundColour

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_BackgroundColour> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1f2525bbfcb7e7c7a7e2ae8f7cc672ec ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_BackgroundColour
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_BackgroundColour> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: f344c50c9013bc60ca223b198a375e88 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_BackgroundColour

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_BackgroundColour> & ent);

};


%extend RWStepVisual_RWBackgroundColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepVisual_RWCameraImage *
***********************************/
class RWStepVisual_RWCameraImage {
	public:
		/****************** RWStepVisual_RWCameraImage ******************/
		/**** md5 signature: cdb01087162cbb11b69385b7583d3910 ****/
		%feature("compactdefaultargs") RWStepVisual_RWCameraImage;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCameraImage;
		 RWStepVisual_RWCameraImage();

		/****************** ReadStep ******************/
		/**** md5 signature: a07338f51fca7968d05cedc2afc24d52 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CameraImage

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CameraImage> & ent);

		/****************** Share ******************/
		/**** md5 signature: e807e793edf5c5024caaf0c99163adca ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CameraImage
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CameraImage> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: cfdee3570e1a091230b8fe9bb0ca2e72 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CameraImage

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CameraImage> & ent);

};


%extend RWStepVisual_RWCameraImage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepVisual_RWCameraModel *
***********************************/
class RWStepVisual_RWCameraModel {
	public:
		/****************** RWStepVisual_RWCameraModel ******************/
		/**** md5 signature: 714b5b4e6993802fdd28f58fe6c5965f ****/
		%feature("compactdefaultargs") RWStepVisual_RWCameraModel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCameraModel;
		 RWStepVisual_RWCameraModel();

		/****************** ReadStep ******************/
		/**** md5 signature: d7bc221495aad3cff92c8ed604f191f5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CameraModel

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CameraModel> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: baf52ea48044b439e990f79efb5a765c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CameraModel

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CameraModel> & ent);

};


%extend RWStepVisual_RWCameraModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepVisual_RWCameraModelD2 *
*************************************/
class RWStepVisual_RWCameraModelD2 {
	public:
		/****************** RWStepVisual_RWCameraModelD2 ******************/
		/**** md5 signature: 7e9d431c7cb966c19b797516e189b88e ****/
		%feature("compactdefaultargs") RWStepVisual_RWCameraModelD2;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCameraModelD2;
		 RWStepVisual_RWCameraModelD2();

		/****************** ReadStep ******************/
		/**** md5 signature: e472f614447cfe0dd53fdbeeb4e9d175 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CameraModelD2

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CameraModelD2> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3d8a66e7e124e3881e6d73b701a76bc7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CameraModelD2
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CameraModelD2> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 21c986cf860c2b1a92b1c0bea6c89f49 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CameraModelD2

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CameraModelD2> & ent);

};


%extend RWStepVisual_RWCameraModelD2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepVisual_RWCameraModelD3 *
*************************************/
class RWStepVisual_RWCameraModelD3 {
	public:
		/****************** RWStepVisual_RWCameraModelD3 ******************/
		/**** md5 signature: bcffb3bc379ffe8ab2cb8eab1e5a46b1 ****/
		%feature("compactdefaultargs") RWStepVisual_RWCameraModelD3;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCameraModelD3;
		 RWStepVisual_RWCameraModelD3();

		/****************** ReadStep ******************/
		/**** md5 signature: 6730a7ad0ba65c1b257113ad2cb33295 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CameraModelD3

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CameraModelD3> & ent);

		/****************** Share ******************/
		/**** md5 signature: f2be5e32b72ed4e26023bb5e516ce16c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CameraModelD3
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CameraModelD3> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 324450457f64fd0880ca5d4ab6a7c5b0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CameraModelD3

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CameraModelD3> & ent);

};


%extend RWStepVisual_RWCameraModelD3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepVisual_RWCameraModelD3MultiClipping *
**************************************************/
class RWStepVisual_RWCameraModelD3MultiClipping {
	public:
		/****************** RWStepVisual_RWCameraModelD3MultiClipping ******************/
		/**** md5 signature: 398899b78467a2164eb7521e6d38ae6f ****/
		%feature("compactdefaultargs") RWStepVisual_RWCameraModelD3MultiClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCameraModelD3MultiClipping;
		 RWStepVisual_RWCameraModelD3MultiClipping();

		/****************** ReadStep ******************/
		/**** md5 signature: a7c866255f7902a251bf8c540192c31f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CameraModelD3MultiClipping

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CameraModelD3MultiClipping> & ent);

		/****************** Share ******************/
		/**** md5 signature: 527acb8fb95a3d25ad0e7423af67a6ae ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CameraModelD3MultiClipping
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CameraModelD3MultiClipping> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 89461ad43890830771f24aed44286476 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CameraModelD3MultiClipping

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CameraModelD3MultiClipping> & ent);

};


%extend RWStepVisual_RWCameraModelD3MultiClipping {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class RWStepVisual_RWCameraModelD3MultiClippingIntersection *
**************************************************************/
class RWStepVisual_RWCameraModelD3MultiClippingIntersection {
	public:
		/****************** RWStepVisual_RWCameraModelD3MultiClippingIntersection ******************/
		/**** md5 signature: 967e15f6c6341ac07f8936f2017c7a7b ****/
		%feature("compactdefaultargs") RWStepVisual_RWCameraModelD3MultiClippingIntersection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCameraModelD3MultiClippingIntersection;
		 RWStepVisual_RWCameraModelD3MultiClippingIntersection();

		/****************** ReadStep ******************/
		/**** md5 signature: 1637b41439a70620016d8285c9fe1ef0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CameraModelD3MultiClippingIntersection

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CameraModelD3MultiClippingIntersection> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5a42170f0aa8e959630457fe3880a49d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CameraModelD3MultiClippingIntersection
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CameraModelD3MultiClippingIntersection> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: caf7dd2872cdeb06fddfedb1eddc0357 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CameraModelD3MultiClippingIntersection

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CameraModelD3MultiClippingIntersection> & ent);

};


%extend RWStepVisual_RWCameraModelD3MultiClippingIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepVisual_RWCameraModelD3MultiClippingUnion *
*******************************************************/
class RWStepVisual_RWCameraModelD3MultiClippingUnion {
	public:
		/****************** RWStepVisual_RWCameraModelD3MultiClippingUnion ******************/
		/**** md5 signature: 2451aa5ba6c372c101dae79598334633 ****/
		%feature("compactdefaultargs") RWStepVisual_RWCameraModelD3MultiClippingUnion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCameraModelD3MultiClippingUnion;
		 RWStepVisual_RWCameraModelD3MultiClippingUnion();

		/****************** ReadStep ******************/
		/**** md5 signature: 0f1fa29cb2473d569d649366e7c0f0d0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CameraModelD3MultiClippingUnion

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CameraModelD3MultiClippingUnion> & ent);

		/****************** Share ******************/
		/**** md5 signature: deb6da650cf6236b38d83ded5b9e9406 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CameraModelD3MultiClippingUnion
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CameraModelD3MultiClippingUnion> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3c74559efec4c72cece5af52704597a7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CameraModelD3MultiClippingUnion

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CameraModelD3MultiClippingUnion> & ent);

};


%extend RWStepVisual_RWCameraModelD3MultiClippingUnion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepVisual_RWCameraUsage *
***********************************/
class RWStepVisual_RWCameraUsage {
	public:
		/****************** RWStepVisual_RWCameraUsage ******************/
		/**** md5 signature: 52294c1aaf82dda2c959b829c659bb3d ****/
		%feature("compactdefaultargs") RWStepVisual_RWCameraUsage;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCameraUsage;
		 RWStepVisual_RWCameraUsage();

		/****************** ReadStep ******************/
		/**** md5 signature: 23bdd90e44a4e631bd920df4cd35a2ff ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CameraUsage

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CameraUsage> & ent);

		/****************** Share ******************/
		/**** md5 signature: 38ce4dc3d00d8795cb5fef93290cc329 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CameraUsage
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CameraUsage> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3eb10eae932eabe1ea814fc0be0e3e6a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CameraUsage

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CameraUsage> & ent);

};


%extend RWStepVisual_RWCameraUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************************************************
* class RWStepVisual_RWCharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation *
************************************************************************************************************/
class RWStepVisual_RWCharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation {
	public:
		/****************** RWStepVisual_RWCharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation ******************/
		/**** md5 signature: 071ed10056ca8aea349faed0a4765222 ****/
		%feature("compactdefaultargs") RWStepVisual_RWCharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation;
		 RWStepVisual_RWCharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 71b52d3ec457691055fe1cc0578172ae ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 4d67df6480633280b4738c602d121497 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9f03082b90c21619834a5927c115f536 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation> & ent);

};


%extend RWStepVisual_RWCharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepVisual_RWColour *
******************************/
class RWStepVisual_RWColour {
	public:
		/****************** RWStepVisual_RWColour ******************/
		/**** md5 signature: 549d0c8fcb94d92ce6560e866d1f809b ****/
		%feature("compactdefaultargs") RWStepVisual_RWColour;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWColour;
		 RWStepVisual_RWColour();

		/****************** ReadStep ******************/
		/**** md5 signature: 70a6c40ea62a827393360f76c06b413e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_Colour

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_Colour> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: f819330bfa91b79d7de0910ba755fb3e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_Colour

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_Colour> & ent);

};


%extend RWStepVisual_RWColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepVisual_RWColourRgb *
*********************************/
class RWStepVisual_RWColourRgb {
	public:
		/****************** RWStepVisual_RWColourRgb ******************/
		/**** md5 signature: beb8e3c0cef80895f94a6638f247105b ****/
		%feature("compactdefaultargs") RWStepVisual_RWColourRgb;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWColourRgb;
		 RWStepVisual_RWColourRgb();

		/****************** ReadStep ******************/
		/**** md5 signature: b6ebe3b8f26d8d23178502dfd4c9b4f7 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_ColourRgb

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_ColourRgb> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: faee35098c002327a6bfb7ce3d44cd38 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_ColourRgb

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_ColourRgb> & ent);

};


%extend RWStepVisual_RWColourRgb {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepVisual_RWColourSpecification *
*******************************************/
class RWStepVisual_RWColourSpecification {
	public:
		/****************** RWStepVisual_RWColourSpecification ******************/
		/**** md5 signature: ab71af756d0b7db872264ca01e88e332 ****/
		%feature("compactdefaultargs") RWStepVisual_RWColourSpecification;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWColourSpecification;
		 RWStepVisual_RWColourSpecification();

		/****************** ReadStep ******************/
		/**** md5 signature: 82353a25fc10cedc87c648eb6e2aa884 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_ColourSpecification

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_ColourSpecification> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 5787b604349138d0eb11ecffee5f4b24 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_ColourSpecification

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_ColourSpecification> & ent);

};


%extend RWStepVisual_RWColourSpecification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepVisual_RWCompositeText *
*************************************/
class RWStepVisual_RWCompositeText {
	public:
		/****************** RWStepVisual_RWCompositeText ******************/
		/**** md5 signature: 9b5d7c9743dcc86177e74b6350b742a0 ****/
		%feature("compactdefaultargs") RWStepVisual_RWCompositeText;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCompositeText;
		 RWStepVisual_RWCompositeText();

		/****************** ReadStep ******************/
		/**** md5 signature: fa702049db0de62980e99df2ea9154e7 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CompositeText

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CompositeText> & ent);

		/****************** Share ******************/
		/**** md5 signature: b97610662e32a48687c6f09573975bc7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CompositeText
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CompositeText> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2744cb4a0010e3066fbccbeb55ceef7d ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CompositeText

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CompositeText> & ent);

};


%extend RWStepVisual_RWCompositeText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepVisual_RWCompositeTextWithExtent *
***********************************************/
class RWStepVisual_RWCompositeTextWithExtent {
	public:
		/****************** RWStepVisual_RWCompositeTextWithExtent ******************/
		/**** md5 signature: 954bbd361c58754bc52ef328303295a3 ****/
		%feature("compactdefaultargs") RWStepVisual_RWCompositeTextWithExtent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCompositeTextWithExtent;
		 RWStepVisual_RWCompositeTextWithExtent();

		/****************** ReadStep ******************/
		/**** md5 signature: 66a941f4988077bb271a3210a1b40531 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CompositeTextWithExtent

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CompositeTextWithExtent> & ent);

		/****************** Share ******************/
		/**** md5 signature: 8c540db3c9981df718b66525e4e51e34 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CompositeTextWithExtent
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CompositeTextWithExtent> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 059853887fcfb0990c72d250e9ff52cb ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CompositeTextWithExtent

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CompositeTextWithExtent> & ent);

};


%extend RWStepVisual_RWCompositeTextWithExtent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepVisual_RWContextDependentInvisibility *
****************************************************/
class RWStepVisual_RWContextDependentInvisibility {
	public:
		/****************** RWStepVisual_RWContextDependentInvisibility ******************/
		/**** md5 signature: 88026aed304b3869e059427dea947382 ****/
		%feature("compactdefaultargs") RWStepVisual_RWContextDependentInvisibility;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWContextDependentInvisibility;
		 RWStepVisual_RWContextDependentInvisibility();

		/****************** ReadStep ******************/
		/**** md5 signature: 2051042f4228483ba6a4b7970354dbaf ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_ContextDependentInvisibility

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_ContextDependentInvisibility> & ent);

		/****************** Share ******************/
		/**** md5 signature: d78f7a947af59cc46f58859296d7b801 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_ContextDependentInvisibility
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_ContextDependentInvisibility> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d073d4a60ed87b953fef18ba6c09db87 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_ContextDependentInvisibility

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_ContextDependentInvisibility> & ent);

};


%extend RWStepVisual_RWContextDependentInvisibility {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepVisual_RWContextDependentOverRidingStyledItem *
************************************************************/
class RWStepVisual_RWContextDependentOverRidingStyledItem {
	public:
		/****************** RWStepVisual_RWContextDependentOverRidingStyledItem ******************/
		/**** md5 signature: 3a48adeaba7b505ce5a2ca58aea0da73 ****/
		%feature("compactdefaultargs") RWStepVisual_RWContextDependentOverRidingStyledItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWContextDependentOverRidingStyledItem;
		 RWStepVisual_RWContextDependentOverRidingStyledItem();

		/****************** ReadStep ******************/
		/**** md5 signature: afef21554d1e6020d7f374701484c756 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_ContextDependentOverRidingStyledItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_ContextDependentOverRidingStyledItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3805ef4d0d8fad3ec6df17348f4917f2 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_ContextDependentOverRidingStyledItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_ContextDependentOverRidingStyledItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 071655b451895b90333eb7eee08c1cbd ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_ContextDependentOverRidingStyledItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_ContextDependentOverRidingStyledItem> & ent);

};


%extend RWStepVisual_RWContextDependentOverRidingStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepVisual_RWCoordinatesList *
***************************************/
class RWStepVisual_RWCoordinatesList {
	public:
		/****************** RWStepVisual_RWCoordinatesList ******************/
		/**** md5 signature: 0c4c6c69ce111e675c1ca3c672b06385 ****/
		%feature("compactdefaultargs") RWStepVisual_RWCoordinatesList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCoordinatesList;
		 RWStepVisual_RWCoordinatesList();

		/****************** ReadStep ******************/
		/**** md5 signature: 4c55e95630b93f6defb7b2087b1fbbce ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CoordinatesList

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CoordinatesList> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 873ee739a2a7a68c2e344d6274aa480c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CoordinatesList

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CoordinatesList> & ent);

};


%extend RWStepVisual_RWCoordinatesList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepVisual_RWCurveStyle *
**********************************/
class RWStepVisual_RWCurveStyle {
	public:
		/****************** RWStepVisual_RWCurveStyle ******************/
		/**** md5 signature: f524bb8e470e43cce3169c2dbf5380e5 ****/
		%feature("compactdefaultargs") RWStepVisual_RWCurveStyle;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCurveStyle;
		 RWStepVisual_RWCurveStyle();

		/****************** ReadStep ******************/
		/**** md5 signature: c2e22a8a68cc45df9b410cb483b5b53c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CurveStyle

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CurveStyle> & ent);

		/****************** Share ******************/
		/**** md5 signature: 826ab6d8986cc8e03ac6a945b0ec1a9b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CurveStyle
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CurveStyle> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: cc242fd7c33a6e8b22c5b4ee2271cf62 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CurveStyle

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CurveStyle> & ent);

};


%extend RWStepVisual_RWCurveStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepVisual_RWCurveStyleFont *
**************************************/
class RWStepVisual_RWCurveStyleFont {
	public:
		/****************** RWStepVisual_RWCurveStyleFont ******************/
		/**** md5 signature: d765453e01071b9ff23b47398f6cf097 ****/
		%feature("compactdefaultargs") RWStepVisual_RWCurveStyleFont;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCurveStyleFont;
		 RWStepVisual_RWCurveStyleFont();

		/****************** ReadStep ******************/
		/**** md5 signature: 631a07d89a9ad070da565c7276dbf81c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CurveStyleFont

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CurveStyleFont> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3be5847bfbb3aae417516c1f3cf42716 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_CurveStyleFont
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_CurveStyleFont> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 35861657fada11f8c3f1e74144bc2091 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CurveStyleFont

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CurveStyleFont> & ent);

};


%extend RWStepVisual_RWCurveStyleFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepVisual_RWCurveStyleFontPattern *
*********************************************/
class RWStepVisual_RWCurveStyleFontPattern {
	public:
		/****************** RWStepVisual_RWCurveStyleFontPattern ******************/
		/**** md5 signature: cb1ccb403dd18700dc6fa24ac4d7080a ****/
		%feature("compactdefaultargs") RWStepVisual_RWCurveStyleFontPattern;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWCurveStyleFontPattern;
		 RWStepVisual_RWCurveStyleFontPattern();

		/****************** ReadStep ******************/
		/**** md5 signature: 64f3cd1a2fa6ccf21dfffed7bffb9054 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_CurveStyleFontPattern

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_CurveStyleFontPattern> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 08f4e864bcfd2aef29adb20c47d94aee ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_CurveStyleFontPattern

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_CurveStyleFontPattern> & ent);

};


%extend RWStepVisual_RWCurveStyleFontPattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepVisual_RWDraughtingCallout *
*****************************************/
class RWStepVisual_RWDraughtingCallout {
	public:
		/****************** RWStepVisual_RWDraughtingCallout ******************/
		/**** md5 signature: 96d8e1724a04e34041ee001fad3c511e ****/
		%feature("compactdefaultargs") RWStepVisual_RWDraughtingCallout;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWDraughtingCallout;
		 RWStepVisual_RWDraughtingCallout();

		/****************** ReadStep ******************/
		/**** md5 signature: cf396b5567f5e80c1c97a4cfe1185d02 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_DraughtingCallout

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_DraughtingCallout> & ent);

		/****************** Share ******************/
		/**** md5 signature: a810ab2707c7faa538f549ddda9a99a1 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_DraughtingCallout
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_DraughtingCallout> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8c21f2f3cf9b1411fa2a364e5f385394 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_DraughtingCallout

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_DraughtingCallout> & ent);

};


%extend RWStepVisual_RWDraughtingCallout {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepVisual_RWDraughtingModel *
***************************************/
class RWStepVisual_RWDraughtingModel {
	public:
		/****************** RWStepVisual_RWDraughtingModel ******************/
		/**** md5 signature: 1d341f2957f8957a62b6b0da59a43385 ****/
		%feature("compactdefaultargs") RWStepVisual_RWDraughtingModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepVisual_RWDraughtingModel;
		 RWStepVisual_RWDraughtingModel();

		/****************** ReadStep ******************/
		/**** md5 signature: 68e311b6d673a4ab9c75186d5b5e94cd ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads draughtingmodel.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_DraughtingModel

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_DraughtingModel> & ent);

		/****************** Share ******************/
		/**** md5 signature: a41dcfaa27db19bfd100b99bd198b017 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepVisual_DraughtingModel
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_DraughtingModel> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: cccb73c9c593d51e436145e699322de2 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes draughtingmodel.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_DraughtingModel

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_DraughtingModel> & ent);

};


%extend RWStepVisual_RWDraughtingModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepVisual_RWDraughtingPreDefinedColour *
**************************************************/
class RWStepVisual_RWDraughtingPreDefinedColour {
	public:
		/****************** RWStepVisual_RWDraughtingPreDefinedColour ******************/
		/**** md5 signature: 013aa062f41f341d2be4f09527f89663 ****/
		%feature("compactdefaultargs") RWStepVisual_RWDraughtingPreDefinedColour;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWDraughtingPreDefinedColour;
		 RWStepVisual_RWDraughtingPreDefinedColour();

		/****************** ReadStep ******************/
		/**** md5 signature: 5e0c0911c92e7ea7942c45eb029aad9b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_DraughtingPreDefinedColour

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_DraughtingPreDefinedColour> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: f4c314c0a152a52786b1fd65c1fd9928 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_DraughtingPreDefinedColour

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_DraughtingPreDefinedColour> & ent);

};


%extend RWStepVisual_RWDraughtingPreDefinedColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepVisual_RWDraughtingPreDefinedCurveFont *
*****************************************************/
class RWStepVisual_RWDraughtingPreDefinedCurveFont {
	public:
		/****************** RWStepVisual_RWDraughtingPreDefinedCurveFont ******************/
		/**** md5 signature: 9a10353412991133bd7f1032304e9d58 ****/
		%feature("compactdefaultargs") RWStepVisual_RWDraughtingPreDefinedCurveFont;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWDraughtingPreDefinedCurveFont;
		 RWStepVisual_RWDraughtingPreDefinedCurveFont();

		/****************** ReadStep ******************/
		/**** md5 signature: 7044eade233cc57170594890e88a58e8 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_DraughtingPreDefinedCurveFont

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_DraughtingPreDefinedCurveFont> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 164f7706529e225061a53d78672f61f6 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_DraughtingPreDefinedCurveFont

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_DraughtingPreDefinedCurveFont> & ent);

};


%extend RWStepVisual_RWDraughtingPreDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepVisual_RWExternallyDefinedCurveFont *
**************************************************/
class RWStepVisual_RWExternallyDefinedCurveFont {
	public:
		/****************** RWStepVisual_RWExternallyDefinedCurveFont ******************/
		/**** md5 signature: 2378af20356e2167c0510df5de19ca21 ****/
		%feature("compactdefaultargs") RWStepVisual_RWExternallyDefinedCurveFont;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepVisual_RWExternallyDefinedCurveFont;
		 RWStepVisual_RWExternallyDefinedCurveFont();

		/****************** ReadStep ******************/
		/**** md5 signature: 8dc6af8295b0dc0251f5c5943987f3fc ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads externallydefinedcurvefont.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_ExternallyDefinedCurveFont

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_ExternallyDefinedCurveFont> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2155a2bb4c9f6b650a6875ce2bbe9a12 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepVisual_ExternallyDefinedCurveFont
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_ExternallyDefinedCurveFont> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b6bee65aad48d98c3ba816672133e0a2 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes externallydefinedcurvefont.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_ExternallyDefinedCurveFont

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_ExternallyDefinedCurveFont> & ent);

};


%extend RWStepVisual_RWExternallyDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepVisual_RWFillAreaStyle *
*************************************/
class RWStepVisual_RWFillAreaStyle {
	public:
		/****************** RWStepVisual_RWFillAreaStyle ******************/
		/**** md5 signature: d23739d8189459a5a75c8103dfe0fcac ****/
		%feature("compactdefaultargs") RWStepVisual_RWFillAreaStyle;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWFillAreaStyle;
		 RWStepVisual_RWFillAreaStyle();

		/****************** ReadStep ******************/
		/**** md5 signature: 1eb8ffa03c4fe7e2d82caf667889bbdb ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_FillAreaStyle

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_FillAreaStyle> & ent);

		/****************** Share ******************/
		/**** md5 signature: 179399286edc92f96d57e7a51ea7be4c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_FillAreaStyle
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_FillAreaStyle> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 89b501914a68d19f7915753f2172a018 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_FillAreaStyle

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_FillAreaStyle> & ent);

};


%extend RWStepVisual_RWFillAreaStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepVisual_RWFillAreaStyleColour *
*******************************************/
class RWStepVisual_RWFillAreaStyleColour {
	public:
		/****************** RWStepVisual_RWFillAreaStyleColour ******************/
		/**** md5 signature: 15feb270cb1044635ec3bc8dc6c4247f ****/
		%feature("compactdefaultargs") RWStepVisual_RWFillAreaStyleColour;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWFillAreaStyleColour;
		 RWStepVisual_RWFillAreaStyleColour();

		/****************** ReadStep ******************/
		/**** md5 signature: 45079e19b00abb31088748b5cac843be ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_FillAreaStyleColour

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_FillAreaStyleColour> & ent);

		/****************** Share ******************/
		/**** md5 signature: 64a539a2e76ceb6b17b6b70854ce89ab ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_FillAreaStyleColour
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_FillAreaStyleColour> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ce33981799039332a101a7f8c4948602 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_FillAreaStyleColour

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_FillAreaStyleColour> & ent);

};


%extend RWStepVisual_RWFillAreaStyleColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepVisual_RWInvisibility *
************************************/
class RWStepVisual_RWInvisibility {
	public:
		/****************** RWStepVisual_RWInvisibility ******************/
		/**** md5 signature: d0a11e52286f9331e7528233dd348e89 ****/
		%feature("compactdefaultargs") RWStepVisual_RWInvisibility;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWInvisibility;
		 RWStepVisual_RWInvisibility();

		/****************** ReadStep ******************/
		/**** md5 signature: 76416d89c63a1474de129b3a915c79f0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_Invisibility

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_Invisibility> & ent);

		/****************** Share ******************/
		/**** md5 signature: 357a6a2adf432025cb1a9948bb389562 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_Invisibility
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_Invisibility> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ac752915172634d8ee13191f8636f748 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_Invisibility

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_Invisibility> & ent);

};


%extend RWStepVisual_RWInvisibility {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************
* class RWStepVisual_RWMechanicalDesignGeometricPresentationArea *
*****************************************************************/
class RWStepVisual_RWMechanicalDesignGeometricPresentationArea {
	public:
		/****************** RWStepVisual_RWMechanicalDesignGeometricPresentationArea ******************/
		/**** md5 signature: 671861cd00d13a470c9ca4c3f384b462 ****/
		%feature("compactdefaultargs") RWStepVisual_RWMechanicalDesignGeometricPresentationArea;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWMechanicalDesignGeometricPresentationArea;
		 RWStepVisual_RWMechanicalDesignGeometricPresentationArea();

		/****************** ReadStep ******************/
		/**** md5 signature: 8898a9931a20bd86e9ce35257c2b30b3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_MechanicalDesignGeometricPresentationArea

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationArea> & ent);

		/****************** Share ******************/
		/**** md5 signature: c195b7d7014d74866871b61145b6f053 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_MechanicalDesignGeometricPresentationArea
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationArea> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 99329d45092a587e8ef4a5f91825c2bb ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_MechanicalDesignGeometricPresentationArea

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationArea> & ent);

};


%extend RWStepVisual_RWMechanicalDesignGeometricPresentationArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************************
* class RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation *
***************************************************************************/
class RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation {
	public:
		/****************** RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation ******************/
		/**** md5 signature: 704612ccf421fb6a3d9aa721a85404a7 ****/
		%feature("compactdefaultargs") RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation;
		 RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 242a23bb4be5252e21f1b47ecbd769d5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_MechanicalDesignGeometricPresentationRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: b2ce7f44e97dc483bdc732e31bbbce56 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_MechanicalDesignGeometricPresentationRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: f66e0f40338d9be4d19d474baec93967 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_MechanicalDesignGeometricPresentationRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> & ent);

};


%extend RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepVisual_RWOverRidingStyledItem *
********************************************/
class RWStepVisual_RWOverRidingStyledItem {
	public:
		/****************** RWStepVisual_RWOverRidingStyledItem ******************/
		/**** md5 signature: b787fd1904b1fa3737a7eb5269da2997 ****/
		%feature("compactdefaultargs") RWStepVisual_RWOverRidingStyledItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWOverRidingStyledItem;
		 RWStepVisual_RWOverRidingStyledItem();

		/****************** ReadStep ******************/
		/**** md5 signature: cc9f672db4937274b17314c0c46e1c90 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_OverRidingStyledItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_OverRidingStyledItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: bbe1594faca460c99b081422471149ec ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_OverRidingStyledItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_OverRidingStyledItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 91452ee8743b9edd47c4d36f82e2c07b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_OverRidingStyledItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_OverRidingStyledItem> & ent);

};


%extend RWStepVisual_RWOverRidingStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepVisual_RWPlanarBox *
*********************************/
class RWStepVisual_RWPlanarBox {
	public:
		/****************** RWStepVisual_RWPlanarBox ******************/
		/**** md5 signature: 7f9bad210da679d199d8de583c841621 ****/
		%feature("compactdefaultargs") RWStepVisual_RWPlanarBox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPlanarBox;
		 RWStepVisual_RWPlanarBox();

		/****************** ReadStep ******************/
		/**** md5 signature: 48606474be3be19f6371ea07cf258420 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PlanarBox

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PlanarBox> & ent);

		/****************** Share ******************/
		/**** md5 signature: 8dfda7085b321114cf2a4582799bacb6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PlanarBox
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PlanarBox> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8e61b83c46f2c8ed36f72ad9a851a6a1 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PlanarBox

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PlanarBox> & ent);

};


%extend RWStepVisual_RWPlanarBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepVisual_RWPlanarExtent *
************************************/
class RWStepVisual_RWPlanarExtent {
	public:
		/****************** RWStepVisual_RWPlanarExtent ******************/
		/**** md5 signature: 57873ce0cc4dff76d07d453d54934a61 ****/
		%feature("compactdefaultargs") RWStepVisual_RWPlanarExtent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPlanarExtent;
		 RWStepVisual_RWPlanarExtent();

		/****************** ReadStep ******************/
		/**** md5 signature: 70bf1ff5e263f5c684d84c919e22db4b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PlanarExtent

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PlanarExtent> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: c8369f7895f62100d8fa4770c47eaf70 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PlanarExtent

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PlanarExtent> & ent);

};


%extend RWStepVisual_RWPlanarExtent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepVisual_RWPointStyle *
**********************************/
class RWStepVisual_RWPointStyle {
	public:
		/****************** RWStepVisual_RWPointStyle ******************/
		/**** md5 signature: 6352bc08f745c6814ab65fafaa48ed7a ****/
		%feature("compactdefaultargs") RWStepVisual_RWPointStyle;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPointStyle;
		 RWStepVisual_RWPointStyle();

		/****************** ReadStep ******************/
		/**** md5 signature: d0ea77339b8b606c57f8efc7772e03da ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PointStyle

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PointStyle> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0cb9beda8007f2f0c959c25f16e5f3fc ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PointStyle
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PointStyle> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b9f664c8071a6c794a0a5bc211739e7b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PointStyle

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PointStyle> & ent);

};


%extend RWStepVisual_RWPointStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepVisual_RWPreDefinedColour *
****************************************/
class RWStepVisual_RWPreDefinedColour {
	public:
		/****************** RWStepVisual_RWPreDefinedColour ******************/
		/**** md5 signature: d2cd60ad5a57dff910fa9be4e4e9200d ****/
		%feature("compactdefaultargs") RWStepVisual_RWPreDefinedColour;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPreDefinedColour;
		 RWStepVisual_RWPreDefinedColour();

		/****************** ReadStep ******************/
		/**** md5 signature: 7adfde0d16b805d58f0cd2acc5a7472b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PreDefinedColour

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PreDefinedColour> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 7fad5799e7a44ec14c1dbb74fe9e066c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PreDefinedColour

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PreDefinedColour> & ent);

};


%extend RWStepVisual_RWPreDefinedColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepVisual_RWPreDefinedCurveFont *
*******************************************/
class RWStepVisual_RWPreDefinedCurveFont {
	public:
		/****************** RWStepVisual_RWPreDefinedCurveFont ******************/
		/**** md5 signature: 55b56d7d17069407f77c7a190e796a86 ****/
		%feature("compactdefaultargs") RWStepVisual_RWPreDefinedCurveFont;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPreDefinedCurveFont;
		 RWStepVisual_RWPreDefinedCurveFont();

		/****************** ReadStep ******************/
		/**** md5 signature: bbda8c016e5b5abbc4e2664971beb9d1 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PreDefinedCurveFont

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PreDefinedCurveFont> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: c1977b5506023e2c1fab9b8954d81424 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PreDefinedCurveFont

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PreDefinedCurveFont> & ent);

};


%extend RWStepVisual_RWPreDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepVisual_RWPreDefinedItem *
**************************************/
class RWStepVisual_RWPreDefinedItem {
	public:
		/****************** RWStepVisual_RWPreDefinedItem ******************/
		/**** md5 signature: a92e72671f92ed48707c6aab85da97ea ****/
		%feature("compactdefaultargs") RWStepVisual_RWPreDefinedItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPreDefinedItem;
		 RWStepVisual_RWPreDefinedItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 271e07a7ebd6a2185cc7145a40ac2fbe ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PreDefinedItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PreDefinedItem> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: ba638c62f3fbdd3fc10fac2e3bfa2bdc ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PreDefinedItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PreDefinedItem> & ent);

};


%extend RWStepVisual_RWPreDefinedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepVisual_RWPresentationArea *
****************************************/
class RWStepVisual_RWPresentationArea {
	public:
		/****************** RWStepVisual_RWPresentationArea ******************/
		/**** md5 signature: cc9c647bea884c06d06bf3e5fb726668 ****/
		%feature("compactdefaultargs") RWStepVisual_RWPresentationArea;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPresentationArea;
		 RWStepVisual_RWPresentationArea();

		/****************** ReadStep ******************/
		/**** md5 signature: 18aa2a5e765c1f4705a9016c8eb10ed8 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PresentationArea

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PresentationArea> & ent);

		/****************** Share ******************/
		/**** md5 signature: abde35d2134cc54e081231d789d371f8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PresentationArea
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PresentationArea> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d3b5aec060e47846f3a26e7b537b375c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PresentationArea

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PresentationArea> & ent);

};


%extend RWStepVisual_RWPresentationArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepVisual_RWPresentationLayerAssignment *
***************************************************/
class RWStepVisual_RWPresentationLayerAssignment {
	public:
		/****************** RWStepVisual_RWPresentationLayerAssignment ******************/
		/**** md5 signature: d10c88038afae8dcbb905afd16e79dd0 ****/
		%feature("compactdefaultargs") RWStepVisual_RWPresentationLayerAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPresentationLayerAssignment;
		 RWStepVisual_RWPresentationLayerAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 0402d0199da76d9e4c472fe927ac9a91 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PresentationLayerAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PresentationLayerAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: fe8b49e7b7bde350cab658a43815d1a8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PresentationLayerAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PresentationLayerAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2063c608367d322fb465ebafbb3ff58f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PresentationLayerAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PresentationLayerAssignment> & ent);

};


%extend RWStepVisual_RWPresentationLayerAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepVisual_RWPresentationLayerUsage *
**********************************************/
class RWStepVisual_RWPresentationLayerUsage {
	public:
		/****************** RWStepVisual_RWPresentationLayerUsage ******************/
		/**** md5 signature: 2b328873b99b52823d8fc4d27f61952f ****/
		%feature("compactdefaultargs") RWStepVisual_RWPresentationLayerUsage;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPresentationLayerUsage;
		 RWStepVisual_RWPresentationLayerUsage();

		/****************** ReadStep ******************/
		/**** md5 signature: fba79b1d6f0b5a3ed182395f4b36d0b4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PresentationLayerUsage

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PresentationLayerUsage> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0dd048156c584c1d461795876e13f570 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PresentationLayerUsage
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PresentationLayerUsage> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1b51f7a6f51783c818ff8b2539293c52 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PresentationLayerUsage

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PresentationLayerUsage> & ent);

};


%extend RWStepVisual_RWPresentationLayerUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepVisual_RWPresentationRepresentation *
**************************************************/
class RWStepVisual_RWPresentationRepresentation {
	public:
		/****************** RWStepVisual_RWPresentationRepresentation ******************/
		/**** md5 signature: 0928347a3ea46cac0991df7d612cfed0 ****/
		%feature("compactdefaultargs") RWStepVisual_RWPresentationRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPresentationRepresentation;
		 RWStepVisual_RWPresentationRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: d10583b60d310413629a82d4f00ebcb8 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PresentationRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PresentationRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: dd249698c7086d7fbcabac4a1e899d54 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PresentationRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PresentationRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 60302865d851653c1c05a414427df985 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PresentationRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PresentationRepresentation> & ent);

};


%extend RWStepVisual_RWPresentationRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepVisual_RWPresentationSet *
***************************************/
class RWStepVisual_RWPresentationSet {
	public:
		/****************** RWStepVisual_RWPresentationSet ******************/
		/**** md5 signature: c6ccdb67a11607ee199ae23d70bb1687 ****/
		%feature("compactdefaultargs") RWStepVisual_RWPresentationSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPresentationSet;
		 RWStepVisual_RWPresentationSet();

		/****************** ReadStep ******************/
		/**** md5 signature: dfcae590df254b4a5e9ece8947f64847 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PresentationSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PresentationSet> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: fb9285d138add79992c88c48c3a33ddf ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PresentationSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PresentationSet> & ent);

};


%extend RWStepVisual_RWPresentationSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepVisual_RWPresentationSize *
****************************************/
class RWStepVisual_RWPresentationSize {
	public:
		/****************** RWStepVisual_RWPresentationSize ******************/
		/**** md5 signature: c1866834a38f1e05f6d9314b4696859f ****/
		%feature("compactdefaultargs") RWStepVisual_RWPresentationSize;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPresentationSize;
		 RWStepVisual_RWPresentationSize();

		/****************** ReadStep ******************/
		/**** md5 signature: 78136a98ac24f7c74db1e399b884b68a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PresentationSize

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PresentationSize> & ent);

		/****************** Share ******************/
		/**** md5 signature: ac54ae69eaf6f4aae2d9b27ab5778abf ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PresentationSize
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PresentationSize> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c570f86a2ede1d07be69b202381a9213 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PresentationSize

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PresentationSize> & ent);

};


%extend RWStepVisual_RWPresentationSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepVisual_RWPresentationStyleAssignment *
***************************************************/
class RWStepVisual_RWPresentationStyleAssignment {
	public:
		/****************** RWStepVisual_RWPresentationStyleAssignment ******************/
		/**** md5 signature: a9937769e714b4acd45221b631a23b15 ****/
		%feature("compactdefaultargs") RWStepVisual_RWPresentationStyleAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPresentationStyleAssignment;
		 RWStepVisual_RWPresentationStyleAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: d0f571b326e2fe187a40ad91c9676ac2 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PresentationStyleAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PresentationStyleAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: c9f50d48845960e38054696bdf0c76b1 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PresentationStyleAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PresentationStyleAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c08ee21da96ac5157e414da8d68a5f24 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PresentationStyleAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PresentationStyleAssignment> & ent);

};


%extend RWStepVisual_RWPresentationStyleAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepVisual_RWPresentationStyleByContext *
**************************************************/
class RWStepVisual_RWPresentationStyleByContext {
	public:
		/****************** RWStepVisual_RWPresentationStyleByContext ******************/
		/**** md5 signature: eb22652c45182cd4bc35bec3404b76ff ****/
		%feature("compactdefaultargs") RWStepVisual_RWPresentationStyleByContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPresentationStyleByContext;
		 RWStepVisual_RWPresentationStyleByContext();

		/****************** ReadStep ******************/
		/**** md5 signature: 88cca75eafbb739279e06251a43c57d9 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PresentationStyleByContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PresentationStyleByContext> & ent);

		/****************** Share ******************/
		/**** md5 signature: a8df939b98ed055112a5fde725b20231 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PresentationStyleByContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PresentationStyleByContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: bdcfaaadefdd265b464c68e589003e00 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PresentationStyleByContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PresentationStyleByContext> & ent);

};


%extend RWStepVisual_RWPresentationStyleByContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepVisual_RWPresentationView *
****************************************/
class RWStepVisual_RWPresentationView {
	public:
		/****************** RWStepVisual_RWPresentationView ******************/
		/**** md5 signature: bf8037b9afc94d0935284bc435b67a3a ****/
		%feature("compactdefaultargs") RWStepVisual_RWPresentationView;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPresentationView;
		 RWStepVisual_RWPresentationView();

		/****************** ReadStep ******************/
		/**** md5 signature: a5dd3e2ead3ac2b5398735511ac33a3f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PresentationView

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PresentationView> & ent);

		/****************** Share ******************/
		/**** md5 signature: 45dbd74cecc7a48775432632615545dd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PresentationView
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PresentationView> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 5433c328b1b627f476632945cb1698f9 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PresentationView

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PresentationView> & ent);

};


%extend RWStepVisual_RWPresentationView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepVisual_RWPresentedItemRepresentation *
***************************************************/
class RWStepVisual_RWPresentedItemRepresentation {
	public:
		/****************** RWStepVisual_RWPresentedItemRepresentation ******************/
		/**** md5 signature: 793f934e8be8bfb84dff3c3d3835dd31 ****/
		%feature("compactdefaultargs") RWStepVisual_RWPresentedItemRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWPresentedItemRepresentation;
		 RWStepVisual_RWPresentedItemRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 7d036c5ffca16ce47ce0fdfb68d3d05a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_PresentedItemRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_PresentedItemRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: f4984019808b0359bbd583b088984185 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_PresentedItemRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_PresentedItemRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2a57d9bfe59b11e9fa0edfaa1d0df9f4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_PresentedItemRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_PresentedItemRepresentation> & ent);

};


%extend RWStepVisual_RWPresentedItemRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepVisual_RWStyledItem *
**********************************/
class RWStepVisual_RWStyledItem {
	public:
		/****************** RWStepVisual_RWStyledItem ******************/
		/**** md5 signature: 9297fa1144c5c698559a46f20bb184f7 ****/
		%feature("compactdefaultargs") RWStepVisual_RWStyledItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWStyledItem;
		 RWStepVisual_RWStyledItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 35953b7c4e6f2614c6f81958f11bd87b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_StyledItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_StyledItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 98ff0c5216319ef9c9ecec832ac39ddd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_StyledItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_StyledItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: fedb3f01213af43f9b4ee21772957792 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_StyledItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_StyledItem> & ent);

};


%extend RWStepVisual_RWStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepVisual_RWSurfaceSideStyle *
****************************************/
class RWStepVisual_RWSurfaceSideStyle {
	public:
		/****************** RWStepVisual_RWSurfaceSideStyle ******************/
		/**** md5 signature: 8e90680933e665d5d7da8ef1436074ee ****/
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceSideStyle;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWSurfaceSideStyle;
		 RWStepVisual_RWSurfaceSideStyle();

		/****************** ReadStep ******************/
		/**** md5 signature: d9bee0b13ef8f57d38c04356c6fe4591 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_SurfaceSideStyle

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_SurfaceSideStyle> & ent);

		/****************** Share ******************/
		/**** md5 signature: 494b31a6ed771bebdddccae3599bafcd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_SurfaceSideStyle
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_SurfaceSideStyle> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: bb5a9caf525dbc7459e81822dca9d7b6 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_SurfaceSideStyle

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_SurfaceSideStyle> & ent);

};


%extend RWStepVisual_RWSurfaceSideStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepVisual_RWSurfaceStyleBoundary *
********************************************/
class RWStepVisual_RWSurfaceStyleBoundary {
	public:
		/****************** RWStepVisual_RWSurfaceStyleBoundary ******************/
		/**** md5 signature: 44c5e9184110f14873f5236dc5133b8a ****/
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleBoundary;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWSurfaceStyleBoundary;
		 RWStepVisual_RWSurfaceStyleBoundary();

		/****************** ReadStep ******************/
		/**** md5 signature: 4bcae95605dc26ca9a3768565f0c3ace ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_SurfaceStyleBoundary

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_SurfaceStyleBoundary> & ent);

		/****************** Share ******************/
		/**** md5 signature: 8b419d908a6322d3067402dd89ba5987 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_SurfaceStyleBoundary
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_SurfaceStyleBoundary> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 276cd5fb8852a638c4d25bc69a1cff19 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_SurfaceStyleBoundary

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_SurfaceStyleBoundary> & ent);

};


%extend RWStepVisual_RWSurfaceStyleBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepVisual_RWSurfaceStyleControlGrid *
***********************************************/
class RWStepVisual_RWSurfaceStyleControlGrid {
	public:
		/****************** RWStepVisual_RWSurfaceStyleControlGrid ******************/
		/**** md5 signature: 2c22124b7c6c365302b6cd4bf550618f ****/
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleControlGrid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWSurfaceStyleControlGrid;
		 RWStepVisual_RWSurfaceStyleControlGrid();

		/****************** ReadStep ******************/
		/**** md5 signature: 3d176cf35c97c77702f0c4ad40ca31d4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_SurfaceStyleControlGrid

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_SurfaceStyleControlGrid> & ent);

		/****************** Share ******************/
		/**** md5 signature: 04d12e347ed4db2b26c6945b08abbd71 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_SurfaceStyleControlGrid
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_SurfaceStyleControlGrid> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 418c8d402a5ee9cbbfdff0f7d1d75eab ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_SurfaceStyleControlGrid

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_SurfaceStyleControlGrid> & ent);

};


%extend RWStepVisual_RWSurfaceStyleControlGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepVisual_RWSurfaceStyleFillArea *
********************************************/
class RWStepVisual_RWSurfaceStyleFillArea {
	public:
		/****************** RWStepVisual_RWSurfaceStyleFillArea ******************/
		/**** md5 signature: 78059f552a2362cd1afb8c800b1fe2e9 ****/
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleFillArea;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWSurfaceStyleFillArea;
		 RWStepVisual_RWSurfaceStyleFillArea();

		/****************** ReadStep ******************/
		/**** md5 signature: 7dae6f7421f2ed0957c268aa891300bd ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_SurfaceStyleFillArea

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_SurfaceStyleFillArea> & ent);

		/****************** Share ******************/
		/**** md5 signature: bff7fcd59a633c04c56150190bf8425a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_SurfaceStyleFillArea
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_SurfaceStyleFillArea> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c5dee2ecf406002b1c1c2c7d017e5960 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_SurfaceStyleFillArea

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_SurfaceStyleFillArea> & ent);

};


%extend RWStepVisual_RWSurfaceStyleFillArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepVisual_RWSurfaceStyleParameterLine *
*************************************************/
class RWStepVisual_RWSurfaceStyleParameterLine {
	public:
		/****************** RWStepVisual_RWSurfaceStyleParameterLine ******************/
		/**** md5 signature: 05c71d4ff717ff51a777922a4cd34d17 ****/
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleParameterLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWSurfaceStyleParameterLine;
		 RWStepVisual_RWSurfaceStyleParameterLine();

		/****************** ReadStep ******************/
		/**** md5 signature: 8c7bc81ba96b825a9da4a793cdcc78cc ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_SurfaceStyleParameterLine

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_SurfaceStyleParameterLine> & ent);

		/****************** Share ******************/
		/**** md5 signature: 072dfdcc8a465be8302b84edbf7636c7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_SurfaceStyleParameterLine
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_SurfaceStyleParameterLine> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ac816ecca40e76b2bb0dddb07a950d63 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_SurfaceStyleParameterLine

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_SurfaceStyleParameterLine> & ent);

};


%extend RWStepVisual_RWSurfaceStyleParameterLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepVisual_RWSurfaceStyleSegmentationCurve *
*****************************************************/
class RWStepVisual_RWSurfaceStyleSegmentationCurve {
	public:
		/****************** RWStepVisual_RWSurfaceStyleSegmentationCurve ******************/
		/**** md5 signature: f455d37177257a658eb99d6ac9699f38 ****/
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleSegmentationCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWSurfaceStyleSegmentationCurve;
		 RWStepVisual_RWSurfaceStyleSegmentationCurve();

		/****************** ReadStep ******************/
		/**** md5 signature: e042405262e7f813a3d941f95d60282a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_SurfaceStyleSegmentationCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_SurfaceStyleSegmentationCurve> & ent);

		/****************** Share ******************/
		/**** md5 signature: 662d4690806e0ee5006707cedd63eff4 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_SurfaceStyleSegmentationCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_SurfaceStyleSegmentationCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e5aed518e7591a085bc7d97f688fce36 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_SurfaceStyleSegmentationCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_SurfaceStyleSegmentationCurve> & ent);

};


%extend RWStepVisual_RWSurfaceStyleSegmentationCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepVisual_RWSurfaceStyleSilhouette *
**********************************************/
class RWStepVisual_RWSurfaceStyleSilhouette {
	public:
		/****************** RWStepVisual_RWSurfaceStyleSilhouette ******************/
		/**** md5 signature: daacd7646e4ae1d586a15e71b3a63988 ****/
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleSilhouette;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWSurfaceStyleSilhouette;
		 RWStepVisual_RWSurfaceStyleSilhouette();

		/****************** ReadStep ******************/
		/**** md5 signature: a60ae95e4c310e88d9b5b2de04625937 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_SurfaceStyleSilhouette

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_SurfaceStyleSilhouette> & ent);

		/****************** Share ******************/
		/**** md5 signature: c15df5cf8bd3baad02ef1acf628a2a5a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_SurfaceStyleSilhouette
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_SurfaceStyleSilhouette> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 08b0168dc220a84fac7eabf04927c42b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_SurfaceStyleSilhouette

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_SurfaceStyleSilhouette> & ent);

};


%extend RWStepVisual_RWSurfaceStyleSilhouette {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepVisual_RWSurfaceStyleUsage *
*****************************************/
class RWStepVisual_RWSurfaceStyleUsage {
	public:
		/****************** RWStepVisual_RWSurfaceStyleUsage ******************/
		/**** md5 signature: 4d7276a577ee5e82fbac16d2b9a19337 ****/
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleUsage;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWSurfaceStyleUsage;
		 RWStepVisual_RWSurfaceStyleUsage();

		/****************** ReadStep ******************/
		/**** md5 signature: 0c4544efb8076f2dc438b4ea0d031011 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_SurfaceStyleUsage

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_SurfaceStyleUsage> & ent);

		/****************** Share ******************/
		/**** md5 signature: b8fafcf5d526ad17cd7b6952f0cff869 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_SurfaceStyleUsage
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_SurfaceStyleUsage> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 435c07aac439d67411be8c4068903396 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_SurfaceStyleUsage

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_SurfaceStyleUsage> & ent);

};


%extend RWStepVisual_RWSurfaceStyleUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStepVisual_RWTemplate *
********************************/
class RWStepVisual_RWTemplate {
	public:
		/****************** RWStepVisual_RWTemplate ******************/
		/**** md5 signature: aca93b3364344a41ddabb27132ef19e3 ****/
		%feature("compactdefaultargs") RWStepVisual_RWTemplate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWTemplate;
		 RWStepVisual_RWTemplate();

		/****************** ReadStep ******************/
		/**** md5 signature: b50ceebd9751e4c8d33ef4bd5293c07f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_Template

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_Template> & ent);

		/****************** Share ******************/
		/**** md5 signature: 56e317fbade06a049bece698ec400e08 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_Template
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_Template> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8285613f97ad1fdca6815e6cbc1b299c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_Template

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_Template> & ent);

};


%extend RWStepVisual_RWTemplate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepVisual_RWTemplateInstance *
****************************************/
class RWStepVisual_RWTemplateInstance {
	public:
		/****************** RWStepVisual_RWTemplateInstance ******************/
		/**** md5 signature: b7915b5ac3bea8dd212128dc28ac3620 ****/
		%feature("compactdefaultargs") RWStepVisual_RWTemplateInstance;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWTemplateInstance;
		 RWStepVisual_RWTemplateInstance();

		/****************** ReadStep ******************/
		/**** md5 signature: da876e8a16913ec7d4444fcb36335c36 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_TemplateInstance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_TemplateInstance> & ent);

		/****************** Share ******************/
		/**** md5 signature: 9fbce86b8a002861beb97dcc80049bf0 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_TemplateInstance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_TemplateInstance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: fd8e8089cc232a3c4f8746babf0a1d01 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_TemplateInstance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_TemplateInstance> & ent);

};


%extend RWStepVisual_RWTemplateInstance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepVisual_RWTessellatedAnnotationOccurrence *
*******************************************************/
class RWStepVisual_RWTessellatedAnnotationOccurrence {
	public:
		/****************** RWStepVisual_RWTessellatedAnnotationOccurrence ******************/
		/**** md5 signature: 2bdf869854a997915e9aa2d3f3e04069 ****/
		%feature("compactdefaultargs") RWStepVisual_RWTessellatedAnnotationOccurrence;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWTessellatedAnnotationOccurrence;
		 RWStepVisual_RWTessellatedAnnotationOccurrence();

		/****************** ReadStep ******************/
		/**** md5 signature: 796faedefb692f344cda18768f3fc967 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_TessellatedAnnotationOccurrence

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_TessellatedAnnotationOccurrence> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0b00c9b740706311d143c0fb5033a538 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_TessellatedAnnotationOccurrence
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_TessellatedAnnotationOccurrence> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3eacad27266a30c4f92d54c29221e8ca ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_TessellatedAnnotationOccurrence

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_TessellatedAnnotationOccurrence> & ent);

};


%extend RWStepVisual_RWTessellatedAnnotationOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepVisual_RWTessellatedCurveSet *
*******************************************/
class RWStepVisual_RWTessellatedCurveSet {
	public:
		/****************** RWStepVisual_RWTessellatedCurveSet ******************/
		/**** md5 signature: bd7ded0f766d48f19735de7676dad1b9 ****/
		%feature("compactdefaultargs") RWStepVisual_RWTessellatedCurveSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWTessellatedCurveSet;
		 RWStepVisual_RWTessellatedCurveSet();

		/****************** ReadStep ******************/
		/**** md5 signature: b8be2d327a089edc5f23affa3e84884e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_TessellatedCurveSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_TessellatedCurveSet> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3796fc148f907a8a1629e37f264e8bbd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_TessellatedCurveSet
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_TessellatedCurveSet> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: bb5f14c5bf1d8dd0dbdb702c2ccadbec ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_TessellatedCurveSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_TessellatedCurveSet> & ent);

};


%extend RWStepVisual_RWTessellatedCurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepVisual_RWTessellatedGeometricSet *
***********************************************/
class RWStepVisual_RWTessellatedGeometricSet {
	public:
		/****************** RWStepVisual_RWTessellatedGeometricSet ******************/
		/**** md5 signature: af2efde76c68fc974ad24b04cdd706fc ****/
		%feature("compactdefaultargs") RWStepVisual_RWTessellatedGeometricSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWTessellatedGeometricSet;
		 RWStepVisual_RWTessellatedGeometricSet();

		/****************** ReadStep ******************/
		/**** md5 signature: 353904f93c8a47cc833a8211b69bd5e9 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_TessellatedGeometricSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_TessellatedGeometricSet> & ent);

		/****************** Share ******************/
		/**** md5 signature: 36d5833e445f6a95f83629531067b5e8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_TessellatedGeometricSet
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_TessellatedGeometricSet> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 90c86693eac02955f39a810e597d171b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_TessellatedGeometricSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_TessellatedGeometricSet> & ent);

};


%extend RWStepVisual_RWTessellatedGeometricSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepVisual_RWTessellatedItem *
***************************************/
class RWStepVisual_RWTessellatedItem {
	public:
		/****************** RWStepVisual_RWTessellatedItem ******************/
		/**** md5 signature: 9c564201b2814745ad2798e92cd9f40e ****/
		%feature("compactdefaultargs") RWStepVisual_RWTessellatedItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWTessellatedItem;
		 RWStepVisual_RWTessellatedItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 4f6d1faddd55d0e10866ebadff704452 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_TessellatedItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_TessellatedItem> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: a386e5690041bf76fbfb01650d06bad3 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_TessellatedItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_TessellatedItem> & ent);

};


%extend RWStepVisual_RWTessellatedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepVisual_RWTextLiteral *
***********************************/
class RWStepVisual_RWTextLiteral {
	public:
		/****************** RWStepVisual_RWTextLiteral ******************/
		/**** md5 signature: 352a51d478e798b4cf70e4a25ea51c60 ****/
		%feature("compactdefaultargs") RWStepVisual_RWTextLiteral;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWTextLiteral;
		 RWStepVisual_RWTextLiteral();

		/****************** ReadStep ******************/
		/**** md5 signature: 9ca0646600bc44f8beaeca5e50042f99 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_TextLiteral

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_TextLiteral> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7491833aa25a0f5042afaf6d30621718 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_TextLiteral
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_TextLiteral> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 739c3d5ee638109331bb70a68ebce936 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_TextLiteral

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_TextLiteral> & ent);

};


%extend RWStepVisual_RWTextLiteral {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepVisual_RWTextStyle *
*********************************/
class RWStepVisual_RWTextStyle {
	public:
		/****************** RWStepVisual_RWTextStyle ******************/
		/**** md5 signature: 66b2b06a50b3b07654b18ec3269c9b12 ****/
		%feature("compactdefaultargs") RWStepVisual_RWTextStyle;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWTextStyle;
		 RWStepVisual_RWTextStyle();

		/****************** ReadStep ******************/
		/**** md5 signature: d666015a3ad41cc788b1df2875196e04 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_TextStyle

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_TextStyle> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6bf6a7cf08dd7a9aaf674147dde6ae4a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_TextStyle
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_TextStyle> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 6dae4919ad57211e36e24a84b5d21b31 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_TextStyle

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_TextStyle> & ent);

};


%extend RWStepVisual_RWTextStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepVisual_RWTextStyleForDefinedFont *
***********************************************/
class RWStepVisual_RWTextStyleForDefinedFont {
	public:
		/****************** RWStepVisual_RWTextStyleForDefinedFont ******************/
		/**** md5 signature: ec210f39c42081e7388a40599a4d5a5a ****/
		%feature("compactdefaultargs") RWStepVisual_RWTextStyleForDefinedFont;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWTextStyleForDefinedFont;
		 RWStepVisual_RWTextStyleForDefinedFont();

		/****************** ReadStep ******************/
		/**** md5 signature: fdb23c4a880cda091974efc316fe8109 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_TextStyleForDefinedFont

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_TextStyleForDefinedFont> & ent);

		/****************** Share ******************/
		/**** md5 signature: f5271ef4315202f7a0133efcc3432895 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_TextStyleForDefinedFont
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_TextStyleForDefinedFont> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 715ba76921bef12069f22506275eadba ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_TextStyleForDefinedFont

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_TextStyleForDefinedFont> & ent);

};


%extend RWStepVisual_RWTextStyleForDefinedFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepVisual_RWTextStyleWithBoxCharacteristics *
*******************************************************/
class RWStepVisual_RWTextStyleWithBoxCharacteristics {
	public:
		/****************** RWStepVisual_RWTextStyleWithBoxCharacteristics ******************/
		/**** md5 signature: f9b354ae619a4398c3798182124036e8 ****/
		%feature("compactdefaultargs") RWStepVisual_RWTextStyleWithBoxCharacteristics;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWTextStyleWithBoxCharacteristics;
		 RWStepVisual_RWTextStyleWithBoxCharacteristics();

		/****************** ReadStep ******************/
		/**** md5 signature: 01adbf66b19ab7167c1f974fa7536427 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_TextStyleWithBoxCharacteristics

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_TextStyleWithBoxCharacteristics> & ent);

		/****************** Share ******************/
		/**** md5 signature: 32a94965caa55ff47b637fb7893788a1 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_TextStyleWithBoxCharacteristics
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_TextStyleWithBoxCharacteristics> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1b5b2b9a2aba682c731658ac1fb4def0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_TextStyleWithBoxCharacteristics

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_TextStyleWithBoxCharacteristics> & ent);

};


%extend RWStepVisual_RWTextStyleWithBoxCharacteristics {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepVisual_RWViewVolume *
**********************************/
class RWStepVisual_RWViewVolume {
	public:
		/****************** RWStepVisual_RWViewVolume ******************/
		/**** md5 signature: 2b0243384334d5d237dc8faa9c5d2dcf ****/
		%feature("compactdefaultargs") RWStepVisual_RWViewVolume;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepVisual_RWViewVolume;
		 RWStepVisual_RWViewVolume();

		/****************** ReadStep ******************/
		/**** md5 signature: b6394074771d0da8c5867bc4f912700f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepVisual_ViewVolume

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepVisual_ViewVolume> & ent);

		/****************** Share ******************/
		/**** md5 signature: b49fb51f3893c265b4f8d3188e003000 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepVisual_ViewVolume
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepVisual_ViewVolume> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 51bf2bf73e7b50d9f9735dff0dc7e23f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepVisual_ViewVolume

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepVisual_ViewVolume> & ent);

};


%extend RWStepVisual_RWViewVolume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
