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
%define RWSTEPAP242DOCSTRING
"RWStepAP242 module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepap242.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPAP242DOCSTRING) RWStepAP242


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
#include<RWStepAP242_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepAP242_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<Interface_module.hxx>
#include<StepShape_module.hxx>
#include<StepGeom_module.hxx>
#include<StepRepr_module.hxx>
#include<StepVisual_module.hxx>
#include<StepAP214_module.hxx>
#include<StepDimTol_module.hxx>
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
%import StepAP242.i

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

/*****************************************************
* class RWStepAP242_RWDraughtingModelItemAssociation *
*****************************************************/
class RWStepAP242_RWDraughtingModelItemAssociation {
	public:
		/****************** RWStepAP242_RWDraughtingModelItemAssociation ******************/
		/**** md5 signature: dbfb3d49364205432661b665fceafd14 ****/
		%feature("compactdefaultargs") RWStepAP242_RWDraughtingModelItemAssociation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP242_RWDraughtingModelItemAssociation;
		 RWStepAP242_RWDraughtingModelItemAssociation();

		/****************** ReadStep ******************/
		/**** md5 signature: 0abbb9a5c2437c6b5761e691711854a5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP242_DraughtingModelItemAssociation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP242_DraughtingModelItemAssociation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 9346b348717af48142ac7e7f4b4702d8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP242_DraughtingModelItemAssociation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP242_DraughtingModelItemAssociation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9f52d2d7c94084d12f95ad65da9ff683 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP242_DraughtingModelItemAssociation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP242_DraughtingModelItemAssociation> & ent);

};


%extend RWStepAP242_RWDraughtingModelItemAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepAP242_RWGeometricItemSpecificUsage *
*************************************************/
class RWStepAP242_RWGeometricItemSpecificUsage {
	public:
		/****************** RWStepAP242_RWGeometricItemSpecificUsage ******************/
		/**** md5 signature: 7c9dfa09bac8cb2aa685d1ed66e81465 ****/
		%feature("compactdefaultargs") RWStepAP242_RWGeometricItemSpecificUsage;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP242_RWGeometricItemSpecificUsage;
		 RWStepAP242_RWGeometricItemSpecificUsage();

		/****************** ReadStep ******************/
		/**** md5 signature: 9ecf5cd2fcdbeede5841a00bc3d16f96 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP242_GeometricItemSpecificUsage

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP242_GeometricItemSpecificUsage> & ent);

		/****************** Share ******************/
		/**** md5 signature: 02ed373334edda3df13bd62767f1b506 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP242_GeometricItemSpecificUsage
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP242_GeometricItemSpecificUsage> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 658b58508ad20d653ffc5a9218044cf1 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP242_GeometricItemSpecificUsage

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP242_GeometricItemSpecificUsage> & ent);

};


%extend RWStepAP242_RWGeometricItemSpecificUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepAP242_RWIdAttribute *
**********************************/
class RWStepAP242_RWIdAttribute {
	public:
		/****************** RWStepAP242_RWIdAttribute ******************/
		/**** md5 signature: f0eb83ee74c33397b5571b0378722fe0 ****/
		%feature("compactdefaultargs") RWStepAP242_RWIdAttribute;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP242_RWIdAttribute;
		 RWStepAP242_RWIdAttribute();

		/****************** ReadStep ******************/
		/**** md5 signature: 51a0bc6b45a7497648a0242f21aa444a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP242_IdAttribute

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP242_IdAttribute> & ent);

		/****************** Share ******************/
		/**** md5 signature: e60e6a1989c151c14d510567b312fd25 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP242_IdAttribute
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP242_IdAttribute> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a91d57c547a53d84ab4a7f1e0b3cbfbd ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP242_IdAttribute

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP242_IdAttribute> & ent);

};


%extend RWStepAP242_RWIdAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class RWStepAP242_RWItemIdentifiedRepresentationUsage *
********************************************************/
class RWStepAP242_RWItemIdentifiedRepresentationUsage {
	public:
		/****************** RWStepAP242_RWItemIdentifiedRepresentationUsage ******************/
		/**** md5 signature: 2f506dbc78207be04b26d1640dc60c8c ****/
		%feature("compactdefaultargs") RWStepAP242_RWItemIdentifiedRepresentationUsage;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP242_RWItemIdentifiedRepresentationUsage;
		 RWStepAP242_RWItemIdentifiedRepresentationUsage();

		/****************** ReadStep ******************/
		/**** md5 signature: 6ee535343e2679f45d9dc76f6d222523 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP242_ItemIdentifiedRepresentationUsage

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP242_ItemIdentifiedRepresentationUsage> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2b20880f3c8802938966e6065601fadf ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP242_ItemIdentifiedRepresentationUsage
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP242_ItemIdentifiedRepresentationUsage> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2db1166e6f6c6c3d7ac5fd2c86c98a17 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP242_ItemIdentifiedRepresentationUsage

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP242_ItemIdentifiedRepresentationUsage> & ent);

};


%extend RWStepAP242_RWItemIdentifiedRepresentationUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
