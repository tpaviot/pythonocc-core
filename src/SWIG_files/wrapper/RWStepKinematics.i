/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define RWSTEPKINEMATICSDOCSTRING
"RWStepKinematics module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_rwstepkinematics.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPKINEMATICSDOCSTRING) RWStepKinematics


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


%{
#include<RWStepKinematics_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepKinematics_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<StepShape_module.hxx>
#include<StepRepr_module.hxx>
#include<Message_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepData.i
%import Interface.i
%import StepKinematics.i

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

/**********************************************************
* class RWStepKinematics_RWActuatedKinPairAndOrderKinPair *
**********************************************************/
class RWStepKinematics_RWActuatedKinPairAndOrderKinPair {
	public:
		/****************** RWStepKinematics_RWActuatedKinPairAndOrderKinPair ******************/
		/**** md5 signature: e827fc309ebe35edb4e295591b33c80f ****/
		%feature("compactdefaultargs") RWStepKinematics_RWActuatedKinPairAndOrderKinPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWActuatedKinPairAndOrderKinPair;
		 RWStepKinematics_RWActuatedKinPairAndOrderKinPair();

		/****************** ReadStep ******************/
		/**** md5 signature: 7c6bdab73f849a35a2cb66cfda4df1f7 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_ActuatedKinPairAndOrderKinPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_ActuatedKinPairAndOrderKinPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 13caeeede41b01da3532a8c9cbeef844 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_ActuatedKinPairAndOrderKinPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_ActuatedKinPairAndOrderKinPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 49374f0d3bae0f844a450c550f38e1e4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_ActuatedKinPairAndOrderKinPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_ActuatedKinPairAndOrderKinPair> & theEnt);

};


%extend RWStepKinematics_RWActuatedKinPairAndOrderKinPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepKinematics_RWActuatedKinematicPair *
*************************************************/
class RWStepKinematics_RWActuatedKinematicPair {
	public:
		/****************** RWStepKinematics_RWActuatedKinematicPair ******************/
		/**** md5 signature: 321019486ed3b6f2781e8c4bab1fe42d ****/
		%feature("compactdefaultargs") RWStepKinematics_RWActuatedKinematicPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWActuatedKinematicPair;
		 RWStepKinematics_RWActuatedKinematicPair();

		/****************** ReadStep ******************/
		/**** md5 signature: 87e84286ecf55f1d0737df2659634c4b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_ActuatedKinematicPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_ActuatedKinematicPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 182f67df93ad6b9117174c16798ca6fd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_ActuatedKinematicPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_ActuatedKinematicPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: dccae3f13e20e9dc22da747383e24330 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_ActuatedKinematicPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_ActuatedKinematicPair> & theEnt);

};


%extend RWStepKinematics_RWActuatedKinematicPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************************
* class RWStepKinematics_RWContextDependentKinematicLinkRepresentation *
***********************************************************************/
class RWStepKinematics_RWContextDependentKinematicLinkRepresentation {
	public:
		/****************** RWStepKinematics_RWContextDependentKinematicLinkRepresentation ******************/
		/**** md5 signature: 4d7b569b98025ef0b7c9d32e1bc0fcce ****/
		%feature("compactdefaultargs") RWStepKinematics_RWContextDependentKinematicLinkRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWContextDependentKinematicLinkRepresentation;
		 RWStepKinematics_RWContextDependentKinematicLinkRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: f3789def48083b5591447f4501e533af ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_ContextDependentKinematicLinkRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_ContextDependentKinematicLinkRepresentation> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: d5048723c52679c4331ac20f9e3a4f36 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_ContextDependentKinematicLinkRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_ContextDependentKinematicLinkRepresentation> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 65a301bf2638e1b56c88a2d9798e57c5 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_ContextDependentKinematicLinkRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_ContextDependentKinematicLinkRepresentation> & theEnt);

};


%extend RWStepKinematics_RWContextDependentKinematicLinkRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepKinematics_RWCylindricalPair *
*******************************************/
class RWStepKinematics_RWCylindricalPair {
	public:
		/****************** RWStepKinematics_RWCylindricalPair ******************/
		/**** md5 signature: 57ba8142d5ca19497b810ddf1ef0b618 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWCylindricalPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWCylindricalPair;
		 RWStepKinematics_RWCylindricalPair();

		/****************** ReadStep ******************/
		/**** md5 signature: 571e598a62b5e05368c4dd9156773438 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_CylindricalPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_CylindricalPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 194532c6decd463fda8e36bfa4561a0f ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_CylindricalPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_CylindricalPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4693dab058763d818b4b2b293a45da94 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_CylindricalPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_CylindricalPair> & theEnt);

};


%extend RWStepKinematics_RWCylindricalPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepKinematics_RWCylindricalPairValue *
************************************************/
class RWStepKinematics_RWCylindricalPairValue {
	public:
		/****************** RWStepKinematics_RWCylindricalPairValue ******************/
		/**** md5 signature: c06cf9b6d74892050225b3d2c3b4030d ****/
		%feature("compactdefaultargs") RWStepKinematics_RWCylindricalPairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWCylindricalPairValue;
		 RWStepKinematics_RWCylindricalPairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: be760033a175444679013658f6ca1a0b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_CylindricalPairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_CylindricalPairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: e17db5ff7b73858725c7f99db9ed3e16 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_CylindricalPairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_CylindricalPairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9183f7acb5cb24a457070acaa86df8f7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_CylindricalPairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_CylindricalPairValue> & theEnt);

};


%extend RWStepKinematics_RWCylindricalPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepKinematics_RWCylindricalPairWithRange *
****************************************************/
class RWStepKinematics_RWCylindricalPairWithRange {
	public:
		/****************** RWStepKinematics_RWCylindricalPairWithRange ******************/
		/**** md5 signature: 75ffb723460f36e6cae748fdd5219e46 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWCylindricalPairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWCylindricalPairWithRange;
		 RWStepKinematics_RWCylindricalPairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: 3727e7db7b9e9ad51db1a366a8a53375 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_CylindricalPairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_CylindricalPairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 5945b76c3b268326d0fcd827f3689066 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_CylindricalPairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_CylindricalPairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: df41717dc2a85d396634a1a9a2e1f4a7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_CylindricalPairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_CylindricalPairWithRange> & theEnt);

};


%extend RWStepKinematics_RWCylindricalPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepKinematics_RWFullyConstrainedPair *
************************************************/
class RWStepKinematics_RWFullyConstrainedPair {
	public:
		/****************** RWStepKinematics_RWFullyConstrainedPair ******************/
		/**** md5 signature: 3b0c1ef3242ae303e5a7e20cafa99fd3 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWFullyConstrainedPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWFullyConstrainedPair;
		 RWStepKinematics_RWFullyConstrainedPair();

		/****************** ReadStep ******************/
		/**** md5 signature: c9929e02c85efb48332caead1ef7aed1 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_FullyConstrainedPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_FullyConstrainedPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 68242ae628dac28117b074edd94ffb40 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_FullyConstrainedPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_FullyConstrainedPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 206682a999c0e09d3fd2a2557c6d3266 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_FullyConstrainedPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_FullyConstrainedPair> & theEnt);

};


%extend RWStepKinematics_RWFullyConstrainedPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepKinematics_RWGearPair *
************************************/
class RWStepKinematics_RWGearPair {
	public:
		/****************** RWStepKinematics_RWGearPair ******************/
		/**** md5 signature: 21a561ac278f5f5353ea8bf896859649 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWGearPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWGearPair;
		 RWStepKinematics_RWGearPair();

		/****************** ReadStep ******************/
		/**** md5 signature: e2306e211627f63ddd38e7ce0f59b341 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_GearPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_GearPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: dab59c6e9720ceddb84596d9d407599f ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_GearPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_GearPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1f95a1a92ccd9e43c85e7f4c1ed22a81 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_GearPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_GearPair> & theEnt);

};


%extend RWStepKinematics_RWGearPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepKinematics_RWGearPairValue *
*****************************************/
class RWStepKinematics_RWGearPairValue {
	public:
		/****************** RWStepKinematics_RWGearPairValue ******************/
		/**** md5 signature: 12b0d9e3a58a8f97351a78041c5eeea7 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWGearPairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWGearPairValue;
		 RWStepKinematics_RWGearPairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: ac6c14e9235826b13b7ab92e82f7ea2d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_GearPairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_GearPairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 958fb8f981c47c0d56b27f33532bbab8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_GearPairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_GearPairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d5093b6fb567868d32817b9f38bfa303 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_GearPairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_GearPairValue> & theEnt);

};


%extend RWStepKinematics_RWGearPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepKinematics_RWGearPairWithRange *
*********************************************/
class RWStepKinematics_RWGearPairWithRange {
	public:
		/****************** RWStepKinematics_RWGearPairWithRange ******************/
		/**** md5 signature: c34b604732d5a1ff041fbe923f0dec3d ****/
		%feature("compactdefaultargs") RWStepKinematics_RWGearPairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWGearPairWithRange;
		 RWStepKinematics_RWGearPairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: 02c410de360aeefd61d3c3d4c78daf6b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_GearPairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_GearPairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: f0cbe1d401b1429adebf426b7d467aee ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_GearPairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_GearPairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: db39754e187e5568c6eb901ea178f661 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_GearPairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_GearPairWithRange> & theEnt);

};


%extend RWStepKinematics_RWGearPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepKinematics_RWHomokineticPair *
*******************************************/
class RWStepKinematics_RWHomokineticPair {
	public:
		/****************** RWStepKinematics_RWHomokineticPair ******************/
		/**** md5 signature: a552fd93fac305a4a931eae529150b66 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWHomokineticPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWHomokineticPair;
		 RWStepKinematics_RWHomokineticPair();

		/****************** ReadStep ******************/
		/**** md5 signature: ad0427047e8fb9759a626393535bee44 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_HomokineticPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_HomokineticPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: ba8a295f38b825a8937da546741fb626 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_HomokineticPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_HomokineticPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2a926e006ff1b97fafce1baa680cf64b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_HomokineticPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_HomokineticPair> & theEnt);

};


%extend RWStepKinematics_RWHomokineticPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepKinematics_RWKinematicJoint *
******************************************/
class RWStepKinematics_RWKinematicJoint {
	public:
		/****************** RWStepKinematics_RWKinematicJoint ******************/
		/**** md5 signature: 485bca10f0aeec38d42a912599e0ef61 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWKinematicJoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWKinematicJoint;
		 RWStepKinematics_RWKinematicJoint();

		/****************** ReadStep ******************/
		/**** md5 signature: d65ff89460049d23434c99b5773c52a3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_KinematicJoint

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_KinematicJoint> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 5fd4cfeda2598ea6ebe561626b86eb82 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_KinematicJoint
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_KinematicJoint> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e2af9cc5565211f49de1dd1e5331c4ba ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_KinematicJoint

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_KinematicJoint> & theEnt);

};


%extend RWStepKinematics_RWKinematicJoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepKinematics_RWKinematicLink *
*****************************************/
class RWStepKinematics_RWKinematicLink {
	public:
		/****************** RWStepKinematics_RWKinematicLink ******************/
		/**** md5 signature: c77923b7eefc27f79c39bee14fd2b706 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWKinematicLink;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWKinematicLink;
		 RWStepKinematics_RWKinematicLink();

		/****************** ReadStep ******************/
		/**** md5 signature: 537a1438d2056419f38b154c2e36dd95 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_KinematicLink

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_KinematicLink> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: bee5758f4ff864853a91ba611053ca0c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_KinematicLink
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_KinematicLink> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b859bd2e3b8d24d5b606bea29eaecd2f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_KinematicLink

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_KinematicLink> & theEnt);

};


%extend RWStepKinematics_RWKinematicLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************************
* class RWStepKinematics_RWKinematicLinkRepresentationAssociation *
******************************************************************/
class RWStepKinematics_RWKinematicLinkRepresentationAssociation {
	public:
		/****************** RWStepKinematics_RWKinematicLinkRepresentationAssociation ******************/
		/**** md5 signature: 8b3e29f5082bc05c3381ae8b800587b8 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWKinematicLinkRepresentationAssociation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWKinematicLinkRepresentationAssociation;
		 RWStepKinematics_RWKinematicLinkRepresentationAssociation();

		/****************** ReadStep ******************/
		/**** md5 signature: 7539b034601d80762091272e3bf944a5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_KinematicLinkRepresentationAssociation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 33f63ddfc2056dec513c0695904da879 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_KinematicLinkRepresentationAssociation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ba6446e5157670739d9002ae85bdf12e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_KinematicLinkRepresentationAssociation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation> & theEnt);

};


%extend RWStepKinematics_RWKinematicLinkRepresentationAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class RWStepKinematics_RWKinematicPropertyMechanismRepresentation *
********************************************************************/
class RWStepKinematics_RWKinematicPropertyMechanismRepresentation {
	public:
		/****************** RWStepKinematics_RWKinematicPropertyMechanismRepresentation ******************/
		/**** md5 signature: 13870aebb394f34966b6965bd87d888c ****/
		%feature("compactdefaultargs") RWStepKinematics_RWKinematicPropertyMechanismRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWKinematicPropertyMechanismRepresentation;
		 RWStepKinematics_RWKinematicPropertyMechanismRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 349068761168e31c393037c88c2a5d85 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_KinematicPropertyMechanismRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_KinematicPropertyMechanismRepresentation> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 4cf916cd1611fc368f964737f0b146c0 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_KinematicPropertyMechanismRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_KinematicPropertyMechanismRepresentation> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3e384c8c3bbd3226e46ba2e5d186d58f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_KinematicPropertyMechanismRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_KinematicPropertyMechanismRepresentation> & theEnt);

};


%extend RWStepKinematics_RWKinematicPropertyMechanismRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class RWStepKinematics_RWKinematicTopologyDirectedStructure *
**************************************************************/
class RWStepKinematics_RWKinematicTopologyDirectedStructure {
	public:
		/****************** RWStepKinematics_RWKinematicTopologyDirectedStructure ******************/
		/**** md5 signature: 718bf1e49854c1cda6c246b33297ed9e ****/
		%feature("compactdefaultargs") RWStepKinematics_RWKinematicTopologyDirectedStructure;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWKinematicTopologyDirectedStructure;
		 RWStepKinematics_RWKinematicTopologyDirectedStructure();

		/****************** ReadStep ******************/
		/**** md5 signature: 462845b2893dbb93b5614ee8a64f27e5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_KinematicTopologyDirectedStructure

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_KinematicTopologyDirectedStructure> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 430ce488dd0f20f0e0586fe00a4f404c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_KinematicTopologyDirectedStructure
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_KinematicTopologyDirectedStructure> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 089972feeb06b5ba77f26ceaeeb2ac50 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_KinematicTopologyDirectedStructure

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_KinematicTopologyDirectedStructure> & theEnt);

};


%extend RWStepKinematics_RWKinematicTopologyDirectedStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepKinematics_RWKinematicTopologyNetworkStructure *
*************************************************************/
class RWStepKinematics_RWKinematicTopologyNetworkStructure {
	public:
		/****************** RWStepKinematics_RWKinematicTopologyNetworkStructure ******************/
		/**** md5 signature: 4dfa544b2fce68c90807b1d6e10a4e04 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWKinematicTopologyNetworkStructure;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWKinematicTopologyNetworkStructure;
		 RWStepKinematics_RWKinematicTopologyNetworkStructure();

		/****************** ReadStep ******************/
		/**** md5 signature: 5b98bcc79e6dd8b79fe22a0eebd27eaf ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_KinematicTopologyNetworkStructure

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_KinematicTopologyNetworkStructure> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 35fb4295fe48e18eec708a13724367dc ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_KinematicTopologyNetworkStructure
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_KinematicTopologyNetworkStructure> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 21d4c33edb1f7c42e5b51d3f0d6cf2ba ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_KinematicTopologyNetworkStructure

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_KinematicTopologyNetworkStructure> & theEnt);

};


%extend RWStepKinematics_RWKinematicTopologyNetworkStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepKinematics_RWKinematicTopologyStructure *
******************************************************/
class RWStepKinematics_RWKinematicTopologyStructure {
	public:
		/****************** RWStepKinematics_RWKinematicTopologyStructure ******************/
		/**** md5 signature: 63a5ac98bb449e4791ee26fe9f2d0dd7 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWKinematicTopologyStructure;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWKinematicTopologyStructure;
		 RWStepKinematics_RWKinematicTopologyStructure();

		/****************** ReadStep ******************/
		/**** md5 signature: 719efcea2bd8ec2c4709b9cf7fa8f20c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_KinematicTopologyStructure

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_KinematicTopologyStructure> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 2f5c29e8f36c29f110a958e8a28fc31c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_KinematicTopologyStructure
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_KinematicTopologyStructure> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c50fbba704888b57644a69a501a3d179 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_KinematicTopologyStructure

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_KinematicTopologyStructure> & theEnt);

};


%extend RWStepKinematics_RWKinematicTopologyStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepKinematics_RWLinearFlexibleAndPinionPair *
*******************************************************/
class RWStepKinematics_RWLinearFlexibleAndPinionPair {
	public:
		/****************** RWStepKinematics_RWLinearFlexibleAndPinionPair ******************/
		/**** md5 signature: cf1eba383cfa8972768c423d68362525 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWLinearFlexibleAndPinionPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWLinearFlexibleAndPinionPair;
		 RWStepKinematics_RWLinearFlexibleAndPinionPair();

		/****************** ReadStep ******************/
		/**** md5 signature: b57a7ea530bd73afb2c444b64050d919 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_LinearFlexibleAndPinionPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_LinearFlexibleAndPinionPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 86a908f082f187fcb67b764fb8234c21 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_LinearFlexibleAndPinionPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_LinearFlexibleAndPinionPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 87466a2fee424eceed1ffe1bbcba9ce0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_LinearFlexibleAndPinionPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_LinearFlexibleAndPinionPair> & theEnt);

};


%extend RWStepKinematics_RWLinearFlexibleAndPinionPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepKinematics_RWLinearFlexibleAndPlanarCurvePair *
************************************************************/
class RWStepKinematics_RWLinearFlexibleAndPlanarCurvePair {
	public:
		/****************** RWStepKinematics_RWLinearFlexibleAndPlanarCurvePair ******************/
		/**** md5 signature: e7cf2babf0a5c6855bb08343a42c1b80 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWLinearFlexibleAndPlanarCurvePair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWLinearFlexibleAndPlanarCurvePair;
		 RWStepKinematics_RWLinearFlexibleAndPlanarCurvePair();

		/****************** ReadStep ******************/
		/**** md5 signature: cf8262115be2f0b84fea93d850d73ad3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_LinearFlexibleAndPlanarCurvePair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_LinearFlexibleAndPlanarCurvePair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: bab88707ff39fd10fcf8b20c82f79dee ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_LinearFlexibleAndPlanarCurvePair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_LinearFlexibleAndPlanarCurvePair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1f6ac869afce52e8b7ce20a27425edef ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_LinearFlexibleAndPlanarCurvePair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_LinearFlexibleAndPlanarCurvePair> & theEnt);

};


%extend RWStepKinematics_RWLinearFlexibleAndPlanarCurvePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepKinematics_RWLinearFlexibleLinkRepresentation *
************************************************************/
class RWStepKinematics_RWLinearFlexibleLinkRepresentation {
	public:
		/****************** RWStepKinematics_RWLinearFlexibleLinkRepresentation ******************/
		/**** md5 signature: fa70146ae8e4ba41ec547b4f921a616d ****/
		%feature("compactdefaultargs") RWStepKinematics_RWLinearFlexibleLinkRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWLinearFlexibleLinkRepresentation;
		 RWStepKinematics_RWLinearFlexibleLinkRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 6a49d42317555c47881d8d19fa87b6b9 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_LinearFlexibleLinkRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_LinearFlexibleLinkRepresentation> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 584b88e4b08c5aa6e4208e5d09ca07fa ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_LinearFlexibleLinkRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_LinearFlexibleLinkRepresentation> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9d78438674eb0db9bb8211ea72e7c5f7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_LinearFlexibleLinkRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_LinearFlexibleLinkRepresentation> & theEnt);

};


%extend RWStepKinematics_RWLinearFlexibleLinkRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepKinematics_RWLowOrderKinematicPair *
*************************************************/
class RWStepKinematics_RWLowOrderKinematicPair {
	public:
		/****************** RWStepKinematics_RWLowOrderKinematicPair ******************/
		/**** md5 signature: 2030678c7236b90086940eae8a9e8f9f ****/
		%feature("compactdefaultargs") RWStepKinematics_RWLowOrderKinematicPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWLowOrderKinematicPair;
		 RWStepKinematics_RWLowOrderKinematicPair();

		/****************** ReadStep ******************/
		/**** md5 signature: ab8d792c029fb088061146d92236e434 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_LowOrderKinematicPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_LowOrderKinematicPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 642346c63b0783c1a57b154e73fb5dd5 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_LowOrderKinematicPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_LowOrderKinematicPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 301902b7f0834b9359fea0157a93cecf ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_LowOrderKinematicPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_LowOrderKinematicPair> & theEnt);

};


%extend RWStepKinematics_RWLowOrderKinematicPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepKinematics_RWLowOrderKinematicPairValue *
******************************************************/
class RWStepKinematics_RWLowOrderKinematicPairValue {
	public:
		/****************** RWStepKinematics_RWLowOrderKinematicPairValue ******************/
		/**** md5 signature: b0ef339264cfa451a79d2b2313f23fb9 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWLowOrderKinematicPairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWLowOrderKinematicPairValue;
		 RWStepKinematics_RWLowOrderKinematicPairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: b9e36b6da11720a08678e5e9187f082f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_LowOrderKinematicPairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_LowOrderKinematicPairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 47e1d5d438f991579bdc4eef092c2b2c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_LowOrderKinematicPairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_LowOrderKinematicPairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: f4c826ea838abf6f65e4b1da30b111ed ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_LowOrderKinematicPairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_LowOrderKinematicPairValue> & theEnt);

};


%extend RWStepKinematics_RWLowOrderKinematicPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class RWStepKinematics_RWLowOrderKinematicPairWithRange *
**********************************************************/
class RWStepKinematics_RWLowOrderKinematicPairWithRange {
	public:
		/****************** RWStepKinematics_RWLowOrderKinematicPairWithRange ******************/
		/**** md5 signature: c28d2b9318ca9f78d56c4bfb9172a165 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWLowOrderKinematicPairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWLowOrderKinematicPairWithRange;
		 RWStepKinematics_RWLowOrderKinematicPairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: d81cf5285e8413512b5a44deb759025e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_LowOrderKinematicPairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_LowOrderKinematicPairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 8064942c62d80d51b1418a83b53e1324 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_LowOrderKinematicPairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_LowOrderKinematicPairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8769b8274200a05ca17c612c3f2cd179 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_LowOrderKinematicPairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_LowOrderKinematicPairWithRange> & theEnt);

};


%extend RWStepKinematics_RWLowOrderKinematicPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepKinematics_RWMechanismRepresentation *
***************************************************/
class RWStepKinematics_RWMechanismRepresentation {
	public:
		/****************** RWStepKinematics_RWMechanismRepresentation ******************/
		/**** md5 signature: 16879a41e6dbc3de30158af549f5cb14 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWMechanismRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWMechanismRepresentation;
		 RWStepKinematics_RWMechanismRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 0b6d05caedbf7af68896ed6a952c6b9f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_MechanismRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_MechanismRepresentation> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 45af663bd82ac2cf5b723b112238fcda ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_MechanismRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_MechanismRepresentation> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 78152aebce363501fb078ebf9dd353c2 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_MechanismRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_MechanismRepresentation> & theEnt);

};


%extend RWStepKinematics_RWMechanismRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class RWStepKinematics_RWMechanismStateRepresentation *
********************************************************/
class RWStepKinematics_RWMechanismStateRepresentation {
	public:
		/****************** RWStepKinematics_RWMechanismStateRepresentation ******************/
		/**** md5 signature: 6a5578ad87150e1a3120cd1bcb19dfa3 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWMechanismStateRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWMechanismStateRepresentation;
		 RWStepKinematics_RWMechanismStateRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 972487f70c0237f265d9fd589e488c86 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_MechanismStateRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_MechanismStateRepresentation> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: bf28a61b6811ea2e44fed4ad60f8998b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_MechanismStateRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_MechanismStateRepresentation> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 28c2ea158480c755e457dc59bcb7b276 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_MechanismStateRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_MechanismStateRepresentation> & theEnt);

};


%extend RWStepKinematics_RWMechanismStateRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepKinematics_RWOrientedJoint *
*****************************************/
class RWStepKinematics_RWOrientedJoint {
	public:
		/****************** RWStepKinematics_RWOrientedJoint ******************/
		/**** md5 signature: 97ccc59f3e4fb02e60098d5cc3c15877 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWOrientedJoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWOrientedJoint;
		 RWStepKinematics_RWOrientedJoint();

		/****************** ReadStep ******************/
		/**** md5 signature: 4b017631a5f3e9a6e4792ca764ea32ca ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_OrientedJoint

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_OrientedJoint> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 26f84d7045b91375d2f980c637e7804d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_OrientedJoint
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_OrientedJoint> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3e133818315a3011c1c69ef0f3b15116 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_OrientedJoint

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_OrientedJoint> & theEnt);

};


%extend RWStepKinematics_RWOrientedJoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class RWStepKinematics_RWPairRepresentationRelationship *
**********************************************************/
class RWStepKinematics_RWPairRepresentationRelationship {
	public:
		/****************** RWStepKinematics_RWPairRepresentationRelationship ******************/
		/**** md5 signature: 1c0f184e3ce40533fc0aa021f6efd4fe ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPairRepresentationRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPairRepresentationRelationship;
		 RWStepKinematics_RWPairRepresentationRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: 72feec52015e2f9676c7b2ebb13a04b4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PairRepresentationRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PairRepresentationRelationship> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 75561fca4898c27c6292b7e6f5b9e23b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PairRepresentationRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PairRepresentationRelationship> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9ee098d0eb892a471f1d26ff00bdab2a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PairRepresentationRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PairRepresentationRelationship> & theEnt);

};


%extend RWStepKinematics_RWPairRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepKinematics_RWPlanarCurvePair *
*******************************************/
class RWStepKinematics_RWPlanarCurvePair {
	public:
		/****************** RWStepKinematics_RWPlanarCurvePair ******************/
		/**** md5 signature: 78953faa94fe3a13b33358e30260e245 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPlanarCurvePair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPlanarCurvePair;
		 RWStepKinematics_RWPlanarCurvePair();

		/****************** ReadStep ******************/
		/**** md5 signature: ef6b26b40199c3fb5c5ca8e62da95a83 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PlanarCurvePair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PlanarCurvePair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: d024124b7899d3a44f7ba933cb238b6c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PlanarCurvePair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PlanarCurvePair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 653d99e059d4e1ad910314c869b8b003 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PlanarCurvePair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PlanarCurvePair> & theEnt);

};


%extend RWStepKinematics_RWPlanarCurvePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepKinematics_RWPlanarCurvePairRange *
************************************************/
class RWStepKinematics_RWPlanarCurvePairRange {
	public:
		/****************** RWStepKinematics_RWPlanarCurvePairRange ******************/
		/**** md5 signature: 7735478933addb3aef283d595c1b56b0 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPlanarCurvePairRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPlanarCurvePairRange;
		 RWStepKinematics_RWPlanarCurvePairRange();

		/****************** ReadStep ******************/
		/**** md5 signature: f3612554c807ad5145e161b72b0671d3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PlanarCurvePairRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PlanarCurvePairRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 9d26feb49968b71abb594fe723825b77 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PlanarCurvePairRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PlanarCurvePairRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c0d3811d380a4cde9355254ef7c308de ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PlanarCurvePairRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PlanarCurvePairRange> & theEnt);

};


%extend RWStepKinematics_RWPlanarCurvePairRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepKinematics_RWPlanarPair *
**************************************/
class RWStepKinematics_RWPlanarPair {
	public:
		/****************** RWStepKinematics_RWPlanarPair ******************/
		/**** md5 signature: fb7aeebf7792e05a98c9985722b1dedb ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPlanarPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPlanarPair;
		 RWStepKinematics_RWPlanarPair();

		/****************** ReadStep ******************/
		/**** md5 signature: 6b4c9f3f056f0bb3b5c2a6dfaf558d04 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PlanarPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PlanarPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 837fac1c896f81c902e234bccfde0632 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PlanarPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PlanarPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 25378c6271c9c7a88b230b61af2485cf ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PlanarPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PlanarPair> & theEnt);

};


%extend RWStepKinematics_RWPlanarPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepKinematics_RWPlanarPairValue *
*******************************************/
class RWStepKinematics_RWPlanarPairValue {
	public:
		/****************** RWStepKinematics_RWPlanarPairValue ******************/
		/**** md5 signature: deb75b1d1ab4b05973df464571c61d71 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPlanarPairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPlanarPairValue;
		 RWStepKinematics_RWPlanarPairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 630aeb82211c33f02113d123d3aac07c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PlanarPairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PlanarPairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 7725d85131fe4d7e4034289140ff09e2 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PlanarPairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PlanarPairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 53b35b933f73da1e17df9da8b50c17ff ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PlanarPairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PlanarPairValue> & theEnt);

};


%extend RWStepKinematics_RWPlanarPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepKinematics_RWPlanarPairWithRange *
***********************************************/
class RWStepKinematics_RWPlanarPairWithRange {
	public:
		/****************** RWStepKinematics_RWPlanarPairWithRange ******************/
		/**** md5 signature: 014126880eead49a5cb878148e23a170 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPlanarPairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPlanarPairWithRange;
		 RWStepKinematics_RWPlanarPairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: 2ac11f9712061ec557ea28311ec2c800 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PlanarPairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PlanarPairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: ab8e389fb2c545795a253f46a567c31c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PlanarPairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PlanarPairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 208923480602058775f4c0508c155d0f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PlanarPairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PlanarPairWithRange> & theEnt);

};


%extend RWStepKinematics_RWPlanarPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepKinematics_RWPointOnPlanarCurvePair *
**************************************************/
class RWStepKinematics_RWPointOnPlanarCurvePair {
	public:
		/****************** RWStepKinematics_RWPointOnPlanarCurvePair ******************/
		/**** md5 signature: 2dd8369da460ccca66a4ac404cdbbcff ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPointOnPlanarCurvePair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPointOnPlanarCurvePair;
		 RWStepKinematics_RWPointOnPlanarCurvePair();

		/****************** ReadStep ******************/
		/**** md5 signature: 4c13ebf021c62a4456ea59667cf5733b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PointOnPlanarCurvePair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PointOnPlanarCurvePair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 11d834aa385ec7e543b4b423177bf98c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PointOnPlanarCurvePair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PointOnPlanarCurvePair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8388e54386fe49ac8a89c6b5ddb1e1b4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PointOnPlanarCurvePair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PointOnPlanarCurvePair> & theEnt);

};


%extend RWStepKinematics_RWPointOnPlanarCurvePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepKinematics_RWPointOnPlanarCurvePairValue *
*******************************************************/
class RWStepKinematics_RWPointOnPlanarCurvePairValue {
	public:
		/****************** RWStepKinematics_RWPointOnPlanarCurvePairValue ******************/
		/**** md5 signature: bced61552a7d2416984c24600be67493 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPointOnPlanarCurvePairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPointOnPlanarCurvePairValue;
		 RWStepKinematics_RWPointOnPlanarCurvePairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 05b33ea4e94072cdd4c07e7c130a57be ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PointOnPlanarCurvePairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PointOnPlanarCurvePairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 973c5d51cf5f604977449ffd96e0c175 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PointOnPlanarCurvePairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PointOnPlanarCurvePairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2702d6a472475bed95e92dd445bdb22e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PointOnPlanarCurvePairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PointOnPlanarCurvePairValue> & theEnt);

};


%extend RWStepKinematics_RWPointOnPlanarCurvePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class RWStepKinematics_RWPointOnPlanarCurvePairWithRange *
***********************************************************/
class RWStepKinematics_RWPointOnPlanarCurvePairWithRange {
	public:
		/****************** RWStepKinematics_RWPointOnPlanarCurvePairWithRange ******************/
		/**** md5 signature: 52de93ecefd210caa20ebb87ef299683 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPointOnPlanarCurvePairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPointOnPlanarCurvePairWithRange;
		 RWStepKinematics_RWPointOnPlanarCurvePairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: 5dcfe876b7b64cc845560989455de59d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PointOnPlanarCurvePairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PointOnPlanarCurvePairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 66e5d98ec43723a0fd34aeebc324e059 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PointOnPlanarCurvePairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PointOnPlanarCurvePairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 125f8f2fb506e34b0f170c1c8c5db0f1 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PointOnPlanarCurvePairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PointOnPlanarCurvePairWithRange> & theEnt);

};


%extend RWStepKinematics_RWPointOnPlanarCurvePairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepKinematics_RWPointOnSurfacePair *
**********************************************/
class RWStepKinematics_RWPointOnSurfacePair {
	public:
		/****************** RWStepKinematics_RWPointOnSurfacePair ******************/
		/**** md5 signature: 651d5410fca88a0a82caff68e12108c7 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPointOnSurfacePair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPointOnSurfacePair;
		 RWStepKinematics_RWPointOnSurfacePair();

		/****************** ReadStep ******************/
		/**** md5 signature: d6b3f51ca483864e624b41d4f9aeaac6 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PointOnSurfacePair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PointOnSurfacePair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: fcbf349b17b3f7c2cd53a5272e7f6c1f ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PointOnSurfacePair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PointOnSurfacePair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a23fa1cbd4ac42502644aae4d2b8c765 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PointOnSurfacePair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PointOnSurfacePair> & theEnt);

};


%extend RWStepKinematics_RWPointOnSurfacePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepKinematics_RWPointOnSurfacePairValue *
***************************************************/
class RWStepKinematics_RWPointOnSurfacePairValue {
	public:
		/****************** RWStepKinematics_RWPointOnSurfacePairValue ******************/
		/**** md5 signature: ea8d108d2e1166cf4e3192e68c4f6df1 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPointOnSurfacePairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPointOnSurfacePairValue;
		 RWStepKinematics_RWPointOnSurfacePairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 87a6bf0708211649123237c47abbc43b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PointOnSurfacePairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PointOnSurfacePairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: e196e8778009f198b74f144e9db838d4 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PointOnSurfacePairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PointOnSurfacePairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b371f754452c642bfbc88d7e513d2fcd ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PointOnSurfacePairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PointOnSurfacePairValue> & theEnt);

};


%extend RWStepKinematics_RWPointOnSurfacePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepKinematics_RWPointOnSurfacePairWithRange *
*******************************************************/
class RWStepKinematics_RWPointOnSurfacePairWithRange {
	public:
		/****************** RWStepKinematics_RWPointOnSurfacePairWithRange ******************/
		/**** md5 signature: a691c5f5f70a42597cd890117f7663a9 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPointOnSurfacePairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPointOnSurfacePairWithRange;
		 RWStepKinematics_RWPointOnSurfacePairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: 3ca2726e09c9434f1e39f9ab7c8660d3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PointOnSurfacePairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PointOnSurfacePairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: a866e0d9d17413117d8974dde9dec4ed ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PointOnSurfacePairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PointOnSurfacePairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: fbf0b9ded9c6f17e2c8e0de00af8a99b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PointOnSurfacePairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PointOnSurfacePairWithRange> & theEnt);

};


%extend RWStepKinematics_RWPointOnSurfacePairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepKinematics_RWPrismaticPair *
*****************************************/
class RWStepKinematics_RWPrismaticPair {
	public:
		/****************** RWStepKinematics_RWPrismaticPair ******************/
		/**** md5 signature: 010b7bdb91ac651b1c1b1c23b3c91a79 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPrismaticPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPrismaticPair;
		 RWStepKinematics_RWPrismaticPair();

		/****************** ReadStep ******************/
		/**** md5 signature: 4f9e6478e00cabf0562c45030d2a829f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PrismaticPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PrismaticPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 92f3d07517d3a0d4feb223ea9a8c4f5d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PrismaticPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PrismaticPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 0a0e615261694bd69ec5c81b5dc4ed5d ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PrismaticPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PrismaticPair> & theEnt);

};


%extend RWStepKinematics_RWPrismaticPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepKinematics_RWPrismaticPairValue *
**********************************************/
class RWStepKinematics_RWPrismaticPairValue {
	public:
		/****************** RWStepKinematics_RWPrismaticPairValue ******************/
		/**** md5 signature: 0972cff86854e863c32de4e36c901848 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPrismaticPairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPrismaticPairValue;
		 RWStepKinematics_RWPrismaticPairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 63d9e499ec9d794014a0495b2d4c7236 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PrismaticPairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PrismaticPairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: f2d9e1b61b39170edb69b5f35ff88e98 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PrismaticPairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PrismaticPairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 84e19e568874549993ea112c2f0c3be4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PrismaticPairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PrismaticPairValue> & theEnt);

};


%extend RWStepKinematics_RWPrismaticPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepKinematics_RWPrismaticPairWithRange *
**************************************************/
class RWStepKinematics_RWPrismaticPairWithRange {
	public:
		/****************** RWStepKinematics_RWPrismaticPairWithRange ******************/
		/**** md5 signature: a810fcbace1bac38d1791f670a4d7b03 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWPrismaticPairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWPrismaticPairWithRange;
		 RWStepKinematics_RWPrismaticPairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: 0fff907a5ce50c4e9dc67cd2677db122 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_PrismaticPairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_PrismaticPairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 57a18d1ddb7d1e0214171bc42c415464 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_PrismaticPairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_PrismaticPairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 391f5eb88d7f711f1216a3bf7aa052c8 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_PrismaticPairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_PrismaticPairWithRange> & theEnt);

};


%extend RWStepKinematics_RWPrismaticPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepKinematics_RWProductDefinitionKinematics *
*******************************************************/
class RWStepKinematics_RWProductDefinitionKinematics {
	public:
		/****************** RWStepKinematics_RWProductDefinitionKinematics ******************/
		/**** md5 signature: 8166d00a4997c1741205cd1b3fded4b9 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWProductDefinitionKinematics;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWProductDefinitionKinematics;
		 RWStepKinematics_RWProductDefinitionKinematics();

		/****************** ReadStep ******************/
		/**** md5 signature: 13c51946f1781ae7e670e792dd390052 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_ProductDefinitionKinematics

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_ProductDefinitionKinematics> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 3f70f93764d0a9c245d98abf27dde241 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_ProductDefinitionKinematics
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_ProductDefinitionKinematics> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 0749f1850dc28c1147317a395cb8d9a7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_ProductDefinitionKinematics

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_ProductDefinitionKinematics> & theEnt);

};


%extend RWStepKinematics_RWProductDefinitionKinematics {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************************
* class RWStepKinematics_RWProductDefinitionRelationshipKinematics *
*******************************************************************/
class RWStepKinematics_RWProductDefinitionRelationshipKinematics {
	public:
		/****************** RWStepKinematics_RWProductDefinitionRelationshipKinematics ******************/
		/**** md5 signature: aaa9e3cbe2289f743e582bf0637fcbd5 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWProductDefinitionRelationshipKinematics;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWProductDefinitionRelationshipKinematics;
		 RWStepKinematics_RWProductDefinitionRelationshipKinematics();

		/****************** ReadStep ******************/
		/**** md5 signature: e4a3d1bd92291e6b18e20bba435e1702 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_ProductDefinitionRelationshipKinematics

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_ProductDefinitionRelationshipKinematics> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 6e8151c6f6799926c1266f2967c12dde ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_ProductDefinitionRelationshipKinematics
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_ProductDefinitionRelationshipKinematics> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 7175a494c4c819581259a13be01c8438 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_ProductDefinitionRelationshipKinematics

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_ProductDefinitionRelationshipKinematics> & theEnt);

};


%extend RWStepKinematics_RWProductDefinitionRelationshipKinematics {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepKinematics_RWRackAndPinionPair *
*********************************************/
class RWStepKinematics_RWRackAndPinionPair {
	public:
		/****************** RWStepKinematics_RWRackAndPinionPair ******************/
		/**** md5 signature: 119dfb4af4d437c94de098be04b28949 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRackAndPinionPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRackAndPinionPair;
		 RWStepKinematics_RWRackAndPinionPair();

		/****************** ReadStep ******************/
		/**** md5 signature: 5abb0f2d73121f2ca3b1119603730dcf ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RackAndPinionPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RackAndPinionPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: a1bc4cfb4a68ec4241d6f56742370a3c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RackAndPinionPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RackAndPinionPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c05871934ffe0e3245ec8b756e512aa2 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RackAndPinionPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RackAndPinionPair> & theEnt);

};


%extend RWStepKinematics_RWRackAndPinionPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepKinematics_RWRackAndPinionPairValue *
**************************************************/
class RWStepKinematics_RWRackAndPinionPairValue {
	public:
		/****************** RWStepKinematics_RWRackAndPinionPairValue ******************/
		/**** md5 signature: a05bdc68e2d9fc9f394cde1fb718fda3 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRackAndPinionPairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRackAndPinionPairValue;
		 RWStepKinematics_RWRackAndPinionPairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: e7c608130bfc31447a00e7577d8619d5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RackAndPinionPairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RackAndPinionPairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: f986f2e0ae5dbbf5eba62b27e878b2f6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RackAndPinionPairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RackAndPinionPairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 59cd71728b598bdd9702b979d25aa72e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RackAndPinionPairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RackAndPinionPairValue> & theEnt);

};


%extend RWStepKinematics_RWRackAndPinionPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepKinematics_RWRackAndPinionPairWithRange *
******************************************************/
class RWStepKinematics_RWRackAndPinionPairWithRange {
	public:
		/****************** RWStepKinematics_RWRackAndPinionPairWithRange ******************/
		/**** md5 signature: e011d2031d9268d2c2141e31d04a60b6 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRackAndPinionPairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRackAndPinionPairWithRange;
		 RWStepKinematics_RWRackAndPinionPairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: f37da6412a288b15fb32b424995a6b08 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RackAndPinionPairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RackAndPinionPairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 42b44360b086989c2302090dc163c068 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RackAndPinionPairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RackAndPinionPairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 43717292c92a8b7cdb125f4f2ae1b04c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RackAndPinionPairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RackAndPinionPairWithRange> & theEnt);

};


%extend RWStepKinematics_RWRackAndPinionPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepKinematics_RWRevolutePair *
****************************************/
class RWStepKinematics_RWRevolutePair {
	public:
		/****************** RWStepKinematics_RWRevolutePair ******************/
		/**** md5 signature: 82fd3bde2abc376254bd5e0b63c78b0a ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRevolutePair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRevolutePair;
		 RWStepKinematics_RWRevolutePair();

		/****************** ReadStep ******************/
		/**** md5 signature: 2fca1af6af3c834e2f446dd52c5603f9 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RevolutePair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RevolutePair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 25ae1feaf6dc9d8f345ffbf5e20e2906 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RevolutePair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RevolutePair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 24091336ecfba0027a42c63e41c4dc6c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RevolutePair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RevolutePair> & theEnt);

};


%extend RWStepKinematics_RWRevolutePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepKinematics_RWRevolutePairValue *
*********************************************/
class RWStepKinematics_RWRevolutePairValue {
	public:
		/****************** RWStepKinematics_RWRevolutePairValue ******************/
		/**** md5 signature: e73a9dfb9718aa1b1d7fa8536d26254a ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRevolutePairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRevolutePairValue;
		 RWStepKinematics_RWRevolutePairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 406e41f5a7801ee4c113764c07550953 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RevolutePairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RevolutePairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 3223df3b0af5e15399599017de9bd466 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RevolutePairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RevolutePairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d000f7629f004e0b41797bd5a5141869 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RevolutePairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RevolutePairValue> & theEnt);

};


%extend RWStepKinematics_RWRevolutePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepKinematics_RWRevolutePairWithRange *
*************************************************/
class RWStepKinematics_RWRevolutePairWithRange {
	public:
		/****************** RWStepKinematics_RWRevolutePairWithRange ******************/
		/**** md5 signature: 03cc3d915d56c5243436acbb8d398b11 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRevolutePairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRevolutePairWithRange;
		 RWStepKinematics_RWRevolutePairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: f2aaaeae8154bd2dce159947f3c5c78e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RevolutePairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RevolutePairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 1c3e47541f32c12ff0cb6946b0e89b7a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RevolutePairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RevolutePairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4722a351bcc5115e829d2574551fdf91 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RevolutePairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RevolutePairWithRange> & theEnt);

};


%extend RWStepKinematics_RWRevolutePairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepKinematics_RWRigidLinkRepresentation *
***************************************************/
class RWStepKinematics_RWRigidLinkRepresentation {
	public:
		/****************** RWStepKinematics_RWRigidLinkRepresentation ******************/
		/**** md5 signature: a2e7009f4923f498056c3136ca0f8566 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRigidLinkRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRigidLinkRepresentation;
		 RWStepKinematics_RWRigidLinkRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: a9657e366e99c6d0e382c96d95de7cf6 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RigidLinkRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RigidLinkRepresentation> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 129e8f970b670bcf522e86c5920d5fc3 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RigidLinkRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RigidLinkRepresentation> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 218c406054c9ab9b4869f13ec21b7fc4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RigidLinkRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RigidLinkRepresentation> & theEnt);

};


%extend RWStepKinematics_RWRigidLinkRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepKinematics_RWRollingCurvePair *
********************************************/
class RWStepKinematics_RWRollingCurvePair {
	public:
		/****************** RWStepKinematics_RWRollingCurvePair ******************/
		/**** md5 signature: 8c556a865e75409a4b3e2afc5df7a0b3 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRollingCurvePair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRollingCurvePair;
		 RWStepKinematics_RWRollingCurvePair();

		/****************** ReadStep ******************/
		/**** md5 signature: 56759fe3953c4675fa00a8bab4be342e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RollingCurvePair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RollingCurvePair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 705846684ba1ea89212775eb3c1c6be3 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RollingCurvePair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RollingCurvePair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e4aeb8bf3b816756f3622d3c5f86e33e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RollingCurvePair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RollingCurvePair> & theEnt);

};


%extend RWStepKinematics_RWRollingCurvePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepKinematics_RWRollingCurvePairValue *
*************************************************/
class RWStepKinematics_RWRollingCurvePairValue {
	public:
		/****************** RWStepKinematics_RWRollingCurvePairValue ******************/
		/**** md5 signature: 3faa39463ea94139690d341b94ba2db4 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRollingCurvePairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRollingCurvePairValue;
		 RWStepKinematics_RWRollingCurvePairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 297ecd7070eae810e3b42553fb4e9460 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RollingCurvePairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RollingCurvePairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: c6fecd257b704eb85e2561d1a37097e3 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RollingCurvePairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RollingCurvePairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c83d472ec0934d30a4e0844e45f96f71 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RollingCurvePairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RollingCurvePairValue> & theEnt);

};


%extend RWStepKinematics_RWRollingCurvePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepKinematics_RWRollingSurfacePair *
**********************************************/
class RWStepKinematics_RWRollingSurfacePair {
	public:
		/****************** RWStepKinematics_RWRollingSurfacePair ******************/
		/**** md5 signature: f8ed2fc78976b5fcc06a641facc76951 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRollingSurfacePair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRollingSurfacePair;
		 RWStepKinematics_RWRollingSurfacePair();

		/****************** ReadStep ******************/
		/**** md5 signature: abfc7531769def6ce78978d5c794ae04 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RollingSurfacePair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RollingSurfacePair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: e7aa07d82b50e298b9ea9039da4c40d2 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RollingSurfacePair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RollingSurfacePair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ae7e96eca96e22abe2f8b27e774bddc7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RollingSurfacePair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RollingSurfacePair> & theEnt);

};


%extend RWStepKinematics_RWRollingSurfacePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepKinematics_RWRollingSurfacePairValue *
***************************************************/
class RWStepKinematics_RWRollingSurfacePairValue {
	public:
		/****************** RWStepKinematics_RWRollingSurfacePairValue ******************/
		/**** md5 signature: 4274cf420dbc39aa167d468311b11aba ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRollingSurfacePairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRollingSurfacePairValue;
		 RWStepKinematics_RWRollingSurfacePairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 7bcf06f3e9fed8799e5cb8a23e09a0e7 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RollingSurfacePairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RollingSurfacePairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 936f716616f8e2a69e4bc057a00a03cd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RollingSurfacePairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RollingSurfacePairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2935a37fc98efa1856b169b777cbb8ef ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RollingSurfacePairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RollingSurfacePairValue> & theEnt);

};


%extend RWStepKinematics_RWRollingSurfacePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepKinematics_RWRotationAboutDirection *
**************************************************/
class RWStepKinematics_RWRotationAboutDirection {
	public:
		/****************** RWStepKinematics_RWRotationAboutDirection ******************/
		/**** md5 signature: 84a3e910d48f007738cde1de03c90d55 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWRotationAboutDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWRotationAboutDirection;
		 RWStepKinematics_RWRotationAboutDirection();

		/****************** ReadStep ******************/
		/**** md5 signature: 1218007afc14826f1d8fbb6ea6b47826 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_RotationAboutDirection

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_RotationAboutDirection> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 94ebad0ede9b7fb4f0e6f810722558ad ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_RotationAboutDirection
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_RotationAboutDirection> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8aa79ceb663075b4bd7a31d073d7d653 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_RotationAboutDirection

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_RotationAboutDirection> & theEnt);

};


%extend RWStepKinematics_RWRotationAboutDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepKinematics_RWScrewPair *
*************************************/
class RWStepKinematics_RWScrewPair {
	public:
		/****************** RWStepKinematics_RWScrewPair ******************/
		/**** md5 signature: 180a3e5bc4019436c80deb6077a68d01 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWScrewPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWScrewPair;
		 RWStepKinematics_RWScrewPair();

		/****************** ReadStep ******************/
		/**** md5 signature: 49cbcab41ef377b2374e95302e12f145 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_ScrewPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_ScrewPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: cdd5f56b02f4b21711edc549c3a103fe ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_ScrewPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_ScrewPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b5cae11ac3e4fcb6072b37d614db4c09 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_ScrewPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_ScrewPair> & theEnt);

};


%extend RWStepKinematics_RWScrewPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepKinematics_RWScrewPairValue *
******************************************/
class RWStepKinematics_RWScrewPairValue {
	public:
		/****************** RWStepKinematics_RWScrewPairValue ******************/
		/**** md5 signature: 6c5ab0d14a8724771b01ff10a77e035d ****/
		%feature("compactdefaultargs") RWStepKinematics_RWScrewPairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWScrewPairValue;
		 RWStepKinematics_RWScrewPairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 8909ddddc93d03645b2582fcca318c15 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_ScrewPairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_ScrewPairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 11b2c5db63c165cdfcab5a78b5071a77 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_ScrewPairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_ScrewPairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 0adb611ccc100aa47865a7e3529beada ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_ScrewPairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_ScrewPairValue> & theEnt);

};


%extend RWStepKinematics_RWScrewPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepKinematics_RWScrewPairWithRange *
**********************************************/
class RWStepKinematics_RWScrewPairWithRange {
	public:
		/****************** RWStepKinematics_RWScrewPairWithRange ******************/
		/**** md5 signature: eae2dbd104a104a288df961c17b94197 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWScrewPairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWScrewPairWithRange;
		 RWStepKinematics_RWScrewPairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: 6662d27ffd6041add1d0929fa9771d7b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_ScrewPairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_ScrewPairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: e7e0d2a476b44933973c4d539231fd27 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_ScrewPairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_ScrewPairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 5dd07f15f9a15f2e17f12f0ccaf39ecb ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_ScrewPairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_ScrewPairWithRange> & theEnt);

};


%extend RWStepKinematics_RWScrewPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepKinematics_RWSlidingCurvePair *
********************************************/
class RWStepKinematics_RWSlidingCurvePair {
	public:
		/****************** RWStepKinematics_RWSlidingCurvePair ******************/
		/**** md5 signature: d51c5de4214b328d6c7020207c5790a6 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWSlidingCurvePair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWSlidingCurvePair;
		 RWStepKinematics_RWSlidingCurvePair();

		/****************** ReadStep ******************/
		/**** md5 signature: 6936f29a1426664f5236347ae887fd60 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_SlidingCurvePair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_SlidingCurvePair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: b67e8b48a8b38b296a9cbf6f2b7f1ca6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_SlidingCurvePair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_SlidingCurvePair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 5d21c9a04aab2cc1a8805bbd050f89f6 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_SlidingCurvePair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_SlidingCurvePair> & theEnt);

};


%extend RWStepKinematics_RWSlidingCurvePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepKinematics_RWSlidingCurvePairValue *
*************************************************/
class RWStepKinematics_RWSlidingCurvePairValue {
	public:
		/****************** RWStepKinematics_RWSlidingCurvePairValue ******************/
		/**** md5 signature: 0e2c792f6a443ac1830e558b3b4923fc ****/
		%feature("compactdefaultargs") RWStepKinematics_RWSlidingCurvePairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWSlidingCurvePairValue;
		 RWStepKinematics_RWSlidingCurvePairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 9c2f75d30ee35678248c9b2803a74569 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_SlidingCurvePairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_SlidingCurvePairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 0bff3e12c04d1cc44ba3d36ccb1d5356 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_SlidingCurvePairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_SlidingCurvePairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 15b3a4bc327428e601981a5529ec53e2 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_SlidingCurvePairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_SlidingCurvePairValue> & theEnt);

};


%extend RWStepKinematics_RWSlidingCurvePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepKinematics_RWSlidingSurfacePair *
**********************************************/
class RWStepKinematics_RWSlidingSurfacePair {
	public:
		/****************** RWStepKinematics_RWSlidingSurfacePair ******************/
		/**** md5 signature: 5fd5de9b482b30d3cbb85125993cd380 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWSlidingSurfacePair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWSlidingSurfacePair;
		 RWStepKinematics_RWSlidingSurfacePair();

		/****************** ReadStep ******************/
		/**** md5 signature: f341d0138197fae84301511be069222d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_SlidingSurfacePair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_SlidingSurfacePair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 5fd531ef50fe6bcd0ed37c23e6f5b48e ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_SlidingSurfacePair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_SlidingSurfacePair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 5f688c6317d4090f8da0d5671f2aade9 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_SlidingSurfacePair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_SlidingSurfacePair> & theEnt);

};


%extend RWStepKinematics_RWSlidingSurfacePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepKinematics_RWSlidingSurfacePairValue *
***************************************************/
class RWStepKinematics_RWSlidingSurfacePairValue {
	public:
		/****************** RWStepKinematics_RWSlidingSurfacePairValue ******************/
		/**** md5 signature: 49916496e2d77949792d0a3957c482c3 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWSlidingSurfacePairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWSlidingSurfacePairValue;
		 RWStepKinematics_RWSlidingSurfacePairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 10c4721558f8a8f74f5c8af4076f0305 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_SlidingSurfacePairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_SlidingSurfacePairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 681a28e34a4e936c4a62d829b2ac5f86 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_SlidingSurfacePairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_SlidingSurfacePairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b48479cb5d1c5ab86cdd8041083c2a27 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_SlidingSurfacePairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_SlidingSurfacePairValue> & theEnt);

};


%extend RWStepKinematics_RWSlidingSurfacePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepKinematics_RWSphericalPair *
*****************************************/
class RWStepKinematics_RWSphericalPair {
	public:
		/****************** RWStepKinematics_RWSphericalPair ******************/
		/**** md5 signature: 46eb4a1715a939b951f54b80706c9d19 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWSphericalPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWSphericalPair;
		 RWStepKinematics_RWSphericalPair();

		/****************** ReadStep ******************/
		/**** md5 signature: 9d8c18df75ef5b1c222b7e14788bb2ef ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_SphericalPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_SphericalPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 80c89a34012e62cf5dc370de64b3dcaf ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_SphericalPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_SphericalPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 0961e09732d22efed7bb31bf51e2a08c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_SphericalPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_SphericalPair> & theEnt);

};


%extend RWStepKinematics_RWSphericalPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepKinematics_RWSphericalPairValue *
**********************************************/
class RWStepKinematics_RWSphericalPairValue {
	public:
		/****************** RWStepKinematics_RWSphericalPairValue ******************/
		/**** md5 signature: 985b5541a0db8ff25355979bc200e3de ****/
		%feature("compactdefaultargs") RWStepKinematics_RWSphericalPairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWSphericalPairValue;
		 RWStepKinematics_RWSphericalPairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: cdbb7d24e45310bd06ed7e5565807264 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_SphericalPairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_SphericalPairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: c4de65916e5aa55aed04ba165dcf109d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_SphericalPairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_SphericalPairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c81a875deb78d113c030c99efc21eb56 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_SphericalPairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_SphericalPairValue> & theEnt);

};


%extend RWStepKinematics_RWSphericalPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepKinematics_RWSphericalPairWithPin *
************************************************/
class RWStepKinematics_RWSphericalPairWithPin {
	public:
		/****************** RWStepKinematics_RWSphericalPairWithPin ******************/
		/**** md5 signature: cb878a77c0ef35073637554fa763d5c9 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWSphericalPairWithPin;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWSphericalPairWithPin;
		 RWStepKinematics_RWSphericalPairWithPin();

		/****************** ReadStep ******************/
		/**** md5 signature: ab8fa1f438cd8658ce3c520899afca7a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_SphericalPairWithPin

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_SphericalPairWithPin> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 49c9017e0d1c4879ddfa29b015041708 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_SphericalPairWithPin
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_SphericalPairWithPin> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: cdc0ffce8401021bef8149e9eaad21ab ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_SphericalPairWithPin

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_SphericalPairWithPin> & theEnt);

};


%extend RWStepKinematics_RWSphericalPairWithPin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class RWStepKinematics_RWSphericalPairWithPinAndRange *
********************************************************/
class RWStepKinematics_RWSphericalPairWithPinAndRange {
	public:
		/****************** RWStepKinematics_RWSphericalPairWithPinAndRange ******************/
		/**** md5 signature: f1789522bd42065ad440293342080716 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWSphericalPairWithPinAndRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWSphericalPairWithPinAndRange;
		 RWStepKinematics_RWSphericalPairWithPinAndRange();

		/****************** ReadStep ******************/
		/**** md5 signature: ac8ff4dd3ac1307b99850ecc95c24f17 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_SphericalPairWithPinAndRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_SphericalPairWithPinAndRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: e92ea4da85064a7b556af7a508e62938 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_SphericalPairWithPinAndRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_SphericalPairWithPinAndRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 42d490057d3bb7aae1f22045c40e63bd ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_SphericalPairWithPinAndRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_SphericalPairWithPinAndRange> & theEnt);

};


%extend RWStepKinematics_RWSphericalPairWithPinAndRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepKinematics_RWSphericalPairWithRange *
**************************************************/
class RWStepKinematics_RWSphericalPairWithRange {
	public:
		/****************** RWStepKinematics_RWSphericalPairWithRange ******************/
		/**** md5 signature: 91859536d7b87819bfdcfc47b257e55d ****/
		%feature("compactdefaultargs") RWStepKinematics_RWSphericalPairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWSphericalPairWithRange;
		 RWStepKinematics_RWSphericalPairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: ea07a03300de89cc192cd31fce185382 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_SphericalPairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_SphericalPairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 1647e7e8fdd59d54a6ca0766ef117452 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_SphericalPairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_SphericalPairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 960f1c1df485b7a6f4ce70f388d9f335 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_SphericalPairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_SphericalPairWithRange> & theEnt);

};


%extend RWStepKinematics_RWSphericalPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepKinematics_RWSurfacePairWithRange *
************************************************/
class RWStepKinematics_RWSurfacePairWithRange {
	public:
		/****************** RWStepKinematics_RWSurfacePairWithRange ******************/
		/**** md5 signature: cf230f874bbe14e47e94903fc97f050c ****/
		%feature("compactdefaultargs") RWStepKinematics_RWSurfacePairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWSurfacePairWithRange;
		 RWStepKinematics_RWSurfacePairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: c1c230f590e489a981308477a8dcf219 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_SurfacePairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_SurfacePairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 323ecbc20b6d7852c604979b5fb3525d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_SurfacePairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_SurfacePairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 224d3eb49f3fa785d2f0a09c3268ffaa ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_SurfacePairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_SurfacePairWithRange> & theEnt);

};


%extend RWStepKinematics_RWSurfacePairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepKinematics_RWUnconstrainedPair *
*********************************************/
class RWStepKinematics_RWUnconstrainedPair {
	public:
		/****************** RWStepKinematics_RWUnconstrainedPair ******************/
		/**** md5 signature: 10aa45609e4a7d4cf52a577997f30be6 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWUnconstrainedPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWUnconstrainedPair;
		 RWStepKinematics_RWUnconstrainedPair();

		/****************** ReadStep ******************/
		/**** md5 signature: d7c0e8a6844a268aa47380c3b76eb057 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_UnrainedPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_UnconstrainedPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 52e6e84a84fa8c57f492423f3cb92507 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_UnrainedPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_UnconstrainedPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 7aa2156eaad496eeb3380c2991c71baa ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_UnrainedPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_UnconstrainedPair> & theEnt);

};


%extend RWStepKinematics_RWUnconstrainedPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepKinematics_RWUnconstrainedPairValue *
**************************************************/
class RWStepKinematics_RWUnconstrainedPairValue {
	public:
		/****************** RWStepKinematics_RWUnconstrainedPairValue ******************/
		/**** md5 signature: 0c75b19412ffdda1950bbbacb3b5eb10 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWUnconstrainedPairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWUnconstrainedPairValue;
		 RWStepKinematics_RWUnconstrainedPairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 6382aa9d94540082c44820512e1d289f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_UnrainedPairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_UnconstrainedPairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 9d97be3d577ec12c4664e721de0e90db ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_UnrainedPairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_UnconstrainedPairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9f018ccda5834449042b0a7093fb468b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_UnrainedPairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_UnconstrainedPairValue> & theEnt);

};


%extend RWStepKinematics_RWUnconstrainedPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepKinematics_RWUniversalPair *
*****************************************/
class RWStepKinematics_RWUniversalPair {
	public:
		/****************** RWStepKinematics_RWUniversalPair ******************/
		/**** md5 signature: 3956822296a679f2042cfdfad38ab821 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWUniversalPair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWUniversalPair;
		 RWStepKinematics_RWUniversalPair();

		/****************** ReadStep ******************/
		/**** md5 signature: d7b6ec9a5fb42e04b939bdecad8eaa84 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_UniversalPair

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_UniversalPair> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: b50ee64ca9cfe11d189a64e03151aca3 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_UniversalPair
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_UniversalPair> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 00de5f6a910392371829b1bdeef73e04 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_UniversalPair

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_UniversalPair> & theEnt);

};


%extend RWStepKinematics_RWUniversalPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepKinematics_RWUniversalPairValue *
**********************************************/
class RWStepKinematics_RWUniversalPairValue {
	public:
		/****************** RWStepKinematics_RWUniversalPairValue ******************/
		/**** md5 signature: da0ccb2049e9208485faca2239fe4263 ****/
		%feature("compactdefaultargs") RWStepKinematics_RWUniversalPairValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWUniversalPairValue;
		 RWStepKinematics_RWUniversalPairValue();

		/****************** ReadStep ******************/
		/**** md5 signature: b74e47a6168ab97b43b3c4b5268d16e4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_UniversalPairValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_UniversalPairValue> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 522f0827ac699b5795e6e61d89d1df6d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_UniversalPairValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_UniversalPairValue> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: dcc91bea180d4f3f1924aa85babee570 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_UniversalPairValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_UniversalPairValue> & theEnt);

};


%extend RWStepKinematics_RWUniversalPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepKinematics_RWUniversalPairWithRange *
**************************************************/
class RWStepKinematics_RWUniversalPairWithRange {
	public:
		/****************** RWStepKinematics_RWUniversalPairWithRange ******************/
		/**** md5 signature: d83accd16f71dd667ba18603960c463d ****/
		%feature("compactdefaultargs") RWStepKinematics_RWUniversalPairWithRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepKinematics_RWUniversalPairWithRange;
		 RWStepKinematics_RWUniversalPairWithRange();

		/****************** ReadStep ******************/
		/**** md5 signature: 4ea1f0abb57c47527a111995cb4c5d63 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theData: StepData_StepReaderData
theNum: int
theArch: Interface_Check
theEnt: StepKinematics_UniversalPairWithRange

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & theData, const Standard_Integer theNum, opencascade::handle<Interface_Check> & theArch, const opencascade::handle<StepKinematics_UniversalPairWithRange> & theEnt);

		/****************** Share ******************/
		/**** md5 signature: 35950a466c5c0d0d8570e730c71b36af ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEnt: StepKinematics_UniversalPairWithRange
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepKinematics_UniversalPairWithRange> & theEnt, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ff8aa56f535fbaecb8a5f8dd93029a1c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSW: StepData_StepWriter
theEnt: StepKinematics_UniversalPairWithRange

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & theSW, const opencascade::handle<StepKinematics_UniversalPairWithRange> & theEnt);

};


%extend RWStepKinematics_RWUniversalPairWithRange {
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
