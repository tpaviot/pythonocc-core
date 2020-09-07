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
%define RWSTEPSHAPEDOCSTRING
"RWStepShape module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepshape.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPSHAPEDOCSTRING) RWStepShape


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
#include<RWStepShape_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepShape_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<Interface_module.hxx>
#include<StepBasic_module.hxx>
#include<Message_module.hxx>
#include<StepGeom_module.hxx>
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
%import StepShape.i

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

/******************************************************
* class RWStepShape_RWAdvancedBrepShapeRepresentation *
******************************************************/
class RWStepShape_RWAdvancedBrepShapeRepresentation {
	public:
		/****************** RWStepShape_RWAdvancedBrepShapeRepresentation ******************/
		/**** md5 signature: 514131e0e59f65bedf13128f281dd879 ****/
		%feature("compactdefaultargs") RWStepShape_RWAdvancedBrepShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWAdvancedBrepShapeRepresentation;
		 RWStepShape_RWAdvancedBrepShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 83a4d3e49b9edfc4086875defa49a01e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_AdvancedBrepShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_AdvancedBrepShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 91f20864576720740b52bb7fd6ddfa5e ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_AdvancedBrepShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_AdvancedBrepShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b28b6d8bd06811f582a23df04a7d6f61 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_AdvancedBrepShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_AdvancedBrepShapeRepresentation> & ent);

};


%extend RWStepShape_RWAdvancedBrepShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepShape_RWAdvancedFace *
***********************************/
class RWStepShape_RWAdvancedFace {
	public:
		/****************** RWStepShape_RWAdvancedFace ******************/
		/**** md5 signature: c347176e444a9a907a782c9880534ff7 ****/
		%feature("compactdefaultargs") RWStepShape_RWAdvancedFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWAdvancedFace;
		 RWStepShape_RWAdvancedFace();

		/****************** ReadStep ******************/
		/**** md5 signature: fc4566ad55f79d3b33e47b70a94612d8 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_AdvancedFace

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_AdvancedFace> & ent);

		/****************** Share ******************/
		/**** md5 signature: 70aeaa8c7f476562687363c3a232c288 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_AdvancedFace
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_AdvancedFace> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 7cf18386999f05eead1f56123add8c5f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_AdvancedFace

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_AdvancedFace> & ent);

};


%extend RWStepShape_RWAdvancedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepShape_RWAngularLocation *
**************************************/
class RWStepShape_RWAngularLocation {
	public:
		/****************** RWStepShape_RWAngularLocation ******************/
		/**** md5 signature: 59477f4ca3ddb1f711c196ec5eefc518 ****/
		%feature("compactdefaultargs") RWStepShape_RWAngularLocation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWAngularLocation;
		 RWStepShape_RWAngularLocation();

		/****************** ReadStep ******************/
		/**** md5 signature: 3bab707d7d325d3eb43f47aaf02ce40d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads angularlocation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_AngularLocation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_AngularLocation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0ae16c2557154d3bbcab70684dccd6c3 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_AngularLocation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_AngularLocation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a7f93eb877e68f75ebb8c93ad85b2057 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes angularlocation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_AngularLocation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_AngularLocation> & ent);

};


%extend RWStepShape_RWAngularLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepShape_RWAngularSize *
**********************************/
class RWStepShape_RWAngularSize {
	public:
		/****************** RWStepShape_RWAngularSize ******************/
		/**** md5 signature: aa21697bd914b157780e6fd6a7658054 ****/
		%feature("compactdefaultargs") RWStepShape_RWAngularSize;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWAngularSize;
		 RWStepShape_RWAngularSize();

		/****************** ReadStep ******************/
		/**** md5 signature: e493d7edc5ee142bfce71a3f43d27160 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads angularsize.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_AngularSize

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_AngularSize> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3d39fd26458868ca8083718dcda2e555 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_AngularSize
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_AngularSize> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d0b945233de1ed9938c961ab0faaf79f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes angularsize.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_AngularSize

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_AngularSize> & ent);

};


%extend RWStepShape_RWAngularSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWStepShape_RWBlock *
****************************/
class RWStepShape_RWBlock {
	public:
		/****************** RWStepShape_RWBlock ******************/
		/**** md5 signature: 5ae9fc67debc10acbde827b00542b240 ****/
		%feature("compactdefaultargs") RWStepShape_RWBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWBlock;
		 RWStepShape_RWBlock();

		/****************** ReadStep ******************/
		/**** md5 signature: dd3c37a4fc2939bf6351d8d123b261af ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_Block

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_Block> & ent);

		/****************** Share ******************/
		/**** md5 signature: 4c2c22cfa232940eb46ccf38b84f5f46 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_Block
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_Block> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8b36d01ae901378e9a318e0f26cbceec ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_Block

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_Block> & ent);

};


%extend RWStepShape_RWBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepShape_RWBooleanResult *
************************************/
class RWStepShape_RWBooleanResult {
	public:
		/****************** RWStepShape_RWBooleanResult ******************/
		/**** md5 signature: 775b7ff89179b024c470cdf2007b8816 ****/
		%feature("compactdefaultargs") RWStepShape_RWBooleanResult;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWBooleanResult;
		 RWStepShape_RWBooleanResult();

		/****************** ReadStep ******************/
		/**** md5 signature: d312cb9af5cc4ca985a57825bacf8ce9 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_BooleanResult

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_BooleanResult> & ent);

		/****************** Share ******************/
		/**** md5 signature: 93df8d813ee84ac395bd98fe8ca18fb9 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_BooleanResult
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_BooleanResult> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1d62711b69a7a1b953657154a3f91695 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_BooleanResult

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_BooleanResult> & ent);

};


%extend RWStepShape_RWBooleanResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStepShape_RWBoxDomain *
********************************/
class RWStepShape_RWBoxDomain {
	public:
		/****************** RWStepShape_RWBoxDomain ******************/
		/**** md5 signature: 782ba0f90e0994eaa30ca4d418fd4139 ****/
		%feature("compactdefaultargs") RWStepShape_RWBoxDomain;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWBoxDomain;
		 RWStepShape_RWBoxDomain();

		/****************** ReadStep ******************/
		/**** md5 signature: 1ccdc760a5c7650c96e66df7910421ad ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_BoxDomain

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_BoxDomain> & ent);

		/****************** Share ******************/
		/**** md5 signature: c24bd742acd593068811cea0ccb4d523 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_BoxDomain
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_BoxDomain> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 17058407b360438b12b836b5c6794017 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_BoxDomain

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_BoxDomain> & ent);

};


%extend RWStepShape_RWBoxDomain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepShape_RWBoxedHalfSpace *
*************************************/
class RWStepShape_RWBoxedHalfSpace {
	public:
		/****************** RWStepShape_RWBoxedHalfSpace ******************/
		/**** md5 signature: 85cab260c78a517dc35025ac01e6f51d ****/
		%feature("compactdefaultargs") RWStepShape_RWBoxedHalfSpace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWBoxedHalfSpace;
		 RWStepShape_RWBoxedHalfSpace();

		/****************** ReadStep ******************/
		/**** md5 signature: a4adbcf5d922f16e51a6c7105cef9547 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_BoxedHalfSpace

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_BoxedHalfSpace> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6249f66fb35903512ba069e2065004d7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_BoxedHalfSpace
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_BoxedHalfSpace> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4d4ecd47425ebae11afc9e4f2a8356a0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_BoxedHalfSpace

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_BoxedHalfSpace> & ent);

};


%extend RWStepShape_RWBoxedHalfSpace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepShape_RWBrepWithVoids *
************************************/
class RWStepShape_RWBrepWithVoids {
	public:
		/****************** RWStepShape_RWBrepWithVoids ******************/
		/**** md5 signature: 1bde189f68979beb6f291fd53f40cf91 ****/
		%feature("compactdefaultargs") RWStepShape_RWBrepWithVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWBrepWithVoids;
		 RWStepShape_RWBrepWithVoids();

		/****************** Check ******************/
		/**** md5 signature: 022d8ad2d7d58eef02a2cc4e881e2f96 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_BrepWithVoids
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepShape_BrepWithVoids> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		/**** md5 signature: a030aa84c69072d42e2a29b70c57298f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_BrepWithVoids

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_BrepWithVoids> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0c5e88e339557a492f0522997c5504ef ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_BrepWithVoids
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_BrepWithVoids> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ec216884033d4dfdfe16d4c82080e9a4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_BrepWithVoids

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_BrepWithVoids> & ent);

};


%extend RWStepShape_RWBrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepShape_RWClosedShell *
**********************************/
class RWStepShape_RWClosedShell {
	public:
		/****************** RWStepShape_RWClosedShell ******************/
		/**** md5 signature: 231e7a9947bb0035e35838f353101017 ****/
		%feature("compactdefaultargs") RWStepShape_RWClosedShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWClosedShell;
		 RWStepShape_RWClosedShell();

		/****************** ReadStep ******************/
		/**** md5 signature: 6108b150c7caf771189934b689652a22 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ClosedShell

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ClosedShell> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3a16d34e1f8a0822419c768636f18af0 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_ClosedShell
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ClosedShell> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3860015e8fff803eeab71508feb5ce11 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ClosedShell

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ClosedShell> & ent);

};


%extend RWStepShape_RWClosedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepShape_RWCompoundShapeRepresentation *
**************************************************/
class RWStepShape_RWCompoundShapeRepresentation {
	public:
		/****************** RWStepShape_RWCompoundShapeRepresentation ******************/
		/**** md5 signature: 04c1777fcdc8dbca99a545e73f7ae936 ****/
		%feature("compactdefaultargs") RWStepShape_RWCompoundShapeRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWCompoundShapeRepresentation;
		 RWStepShape_RWCompoundShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 20ba1a2cd104c6d7bd567fca2cb0e2b5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads compoundshaperepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_CompoundShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_CompoundShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: afe20cd3ccb872fae398ec6a61c60e63 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_CompoundShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_CompoundShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c67d5aa25cc573dc1872f40c5bb34cd8 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes compoundshaperepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_CompoundShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_CompoundShapeRepresentation> & ent);

};


%extend RWStepShape_RWCompoundShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepShape_RWConnectedEdgeSet *
***************************************/
class RWStepShape_RWConnectedEdgeSet {
	public:
		/****************** RWStepShape_RWConnectedEdgeSet ******************/
		/**** md5 signature: debd3d031752db3e0c46d05bd4d14b1c ****/
		%feature("compactdefaultargs") RWStepShape_RWConnectedEdgeSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWConnectedEdgeSet;
		 RWStepShape_RWConnectedEdgeSet();

		/****************** ReadStep ******************/
		/**** md5 signature: d156ae8db923f8419a75221d5aa41d34 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads connectededgeset.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ConnectedEdgeSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ConnectedEdgeSet> & ent);

		/****************** Share ******************/
		/**** md5 signature: a456122d1c2b7248a535a8c86e59277c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_ConnectedEdgeSet
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ConnectedEdgeSet> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: bf3deef4c68adf1d87e0fae9da6f4d5f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes connectededgeset.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ConnectedEdgeSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ConnectedEdgeSet> & ent);

};


%extend RWStepShape_RWConnectedEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepShape_RWConnectedFaceSet *
***************************************/
class RWStepShape_RWConnectedFaceSet {
	public:
		/****************** RWStepShape_RWConnectedFaceSet ******************/
		/**** md5 signature: df1aa3310abd24db8562e38fe51cd642 ****/
		%feature("compactdefaultargs") RWStepShape_RWConnectedFaceSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWConnectedFaceSet;
		 RWStepShape_RWConnectedFaceSet();

		/****************** ReadStep ******************/
		/**** md5 signature: dcc2669811167f716bf79992d345dadd ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ConnectedFaceSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ConnectedFaceSet> & ent);

		/****************** Share ******************/
		/**** md5 signature: 454c3cea0a32881ccb5ee398ea4f525b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_ConnectedFaceSet
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ConnectedFaceSet> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ed11b716fe9eef26480a695536028d47 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ConnectedFaceSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ConnectedFaceSet> & ent);

};


%extend RWStepShape_RWConnectedFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepShape_RWConnectedFaceShapeRepresentation *
*******************************************************/
class RWStepShape_RWConnectedFaceShapeRepresentation {
	public:
		/****************** RWStepShape_RWConnectedFaceShapeRepresentation ******************/
		/**** md5 signature: a7842940e035e037406feed4518344c8 ****/
		%feature("compactdefaultargs") RWStepShape_RWConnectedFaceShapeRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWConnectedFaceShapeRepresentation;
		 RWStepShape_RWConnectedFaceShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 81353ff4db4174c5c570edcc51c40026 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads connectedfaceshaperepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ConnectedFaceShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ConnectedFaceShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 207cbaf4b3f0167a05e16ac251f0635f ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_ConnectedFaceShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ConnectedFaceShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8a40fe328b00b55663f9821733776514 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes connectedfaceshaperepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ConnectedFaceShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ConnectedFaceShapeRepresentation> & ent);

};


%extend RWStepShape_RWConnectedFaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepShape_RWConnectedFaceSubSet *
******************************************/
class RWStepShape_RWConnectedFaceSubSet {
	public:
		/****************** RWStepShape_RWConnectedFaceSubSet ******************/
		/**** md5 signature: d07cf822eed07477ee6435fef105bbd1 ****/
		%feature("compactdefaultargs") RWStepShape_RWConnectedFaceSubSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWConnectedFaceSubSet;
		 RWStepShape_RWConnectedFaceSubSet();

		/****************** ReadStep ******************/
		/**** md5 signature: 9a73d507f8b7e17c5b74dfeeb8ea0efb ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads connectedfacesubset.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ConnectedFaceSubSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ConnectedFaceSubSet> & ent);

		/****************** Share ******************/
		/**** md5 signature: 197fb899a581b9cea7dfec67b33a0270 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_ConnectedFaceSubSet
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ConnectedFaceSubSet> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 37a3043e38108e575dfd012ecccee9d4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes connectedfacesubset.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ConnectedFaceSubSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ConnectedFaceSubSet> & ent);

};


%extend RWStepShape_RWConnectedFaceSubSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class RWStepShape_RWContextDependentShapeRepresentation *
**********************************************************/
class RWStepShape_RWContextDependentShapeRepresentation {
	public:
		/****************** RWStepShape_RWContextDependentShapeRepresentation ******************/
		/**** md5 signature: efb402be18fd91d1d4f48226c29a4bea ****/
		%feature("compactdefaultargs") RWStepShape_RWContextDependentShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWContextDependentShapeRepresentation;
		 RWStepShape_RWContextDependentShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: c577c82affb0f909223f3c3ea7166546 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ContextDependentShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 700ba4326de255219860eafb30b50376 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_ContextDependentShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a76ccbc0f7fd63b2b06c800d2795f6ec ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ContextDependentShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & ent);

};


%extend RWStepShape_RWContextDependentShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepShape_RWCsgShapeRepresentation *
*********************************************/
class RWStepShape_RWCsgShapeRepresentation {
	public:
		/****************** RWStepShape_RWCsgShapeRepresentation ******************/
		/**** md5 signature: 11e9c710dc76f090eb63833bf30cb9af ****/
		%feature("compactdefaultargs") RWStepShape_RWCsgShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWCsgShapeRepresentation;
		 RWStepShape_RWCsgShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: a7165699ae5dbb30780148f54b4d4303 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_CsgShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_CsgShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6861d9ad48d9184034126f72ab3c1e24 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_CsgShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_CsgShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 33cc92421a49e9f9cda975afc2115a66 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_CsgShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_CsgShapeRepresentation> & ent);

};


%extend RWStepShape_RWCsgShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepShape_RWCsgSolid *
*******************************/
class RWStepShape_RWCsgSolid {
	public:
		/****************** RWStepShape_RWCsgSolid ******************/
		/**** md5 signature: 9257ec9a5cecd0fe4040d07085b3c004 ****/
		%feature("compactdefaultargs") RWStepShape_RWCsgSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWCsgSolid;
		 RWStepShape_RWCsgSolid();

		/****************** ReadStep ******************/
		/**** md5 signature: a7d508ab69985d1cb1e59b32cdd1f03a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_CsgSolid

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_CsgSolid> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3219299f4584d6cfe3820af432c356eb ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_CsgSolid
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_CsgSolid> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a6f97e739d4bde65b2979a4814330d5b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_CsgSolid

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_CsgSolid> & ent);

};


%extend RWStepShape_RWCsgSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************************
* class RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation *
***********************************************************************/
class RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation {
	public:
		/****************** RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation ******************/
		/**** md5 signature: 6a89ab0ca3d83110825468005f99c607 ****/
		%feature("compactdefaultargs") RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation;
		 RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 91e081ea3f19c9c5adbf3043542d3f7d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_DefinitionalRepresentationAndShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_DefinitionalRepresentationAndShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: f699cd31c1f2c1daab3475e6e78a7965 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_DefinitionalRepresentationAndShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_DefinitionalRepresentationAndShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 410b6d44e4eb4f38ad5a883cb9d90e84 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_DefinitionalRepresentationAndShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_DefinitionalRepresentationAndShapeRepresentation> & ent);

};


%extend RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class RWStepShape_RWDimensionalCharacteristicRepresentation *
**************************************************************/
class RWStepShape_RWDimensionalCharacteristicRepresentation {
	public:
		/****************** RWStepShape_RWDimensionalCharacteristicRepresentation ******************/
		/**** md5 signature: 79b1af218f65fec7cda2fec1a8929454 ****/
		%feature("compactdefaultargs") RWStepShape_RWDimensionalCharacteristicRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWDimensionalCharacteristicRepresentation;
		 RWStepShape_RWDimensionalCharacteristicRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 60a2aad50bd9d9ce987eeeb5a5466b12 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads dimensionalcharacteristicrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_DimensionalCharacteristicRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_DimensionalCharacteristicRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: cc809ccdf5b90fd4c1bdec63e15f4d28 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_DimensionalCharacteristicRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_DimensionalCharacteristicRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d43b760b15a73de8c487555392660c7c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes dimensionalcharacteristicrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_DimensionalCharacteristicRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_DimensionalCharacteristicRepresentation> & ent);

};


%extend RWStepShape_RWDimensionalCharacteristicRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepShape_RWDimensionalLocation *
******************************************/
class RWStepShape_RWDimensionalLocation {
	public:
		/****************** RWStepShape_RWDimensionalLocation ******************/
		/**** md5 signature: 34bb20d355f3647fa68cfe842f47e2b2 ****/
		%feature("compactdefaultargs") RWStepShape_RWDimensionalLocation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWDimensionalLocation;
		 RWStepShape_RWDimensionalLocation();

		/****************** ReadStep ******************/
		/**** md5 signature: e1c981c85dcf0543ce6d1803c82160a5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads dimensionallocation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_DimensionalLocation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_DimensionalLocation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 02c514a0417bd7c2839d0af61ae2c370 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_DimensionalLocation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_DimensionalLocation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: da84c7d7694fa46a9616a328650f81e7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes dimensionallocation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_DimensionalLocation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_DimensionalLocation> & ent);

};


%extend RWStepShape_RWDimensionalLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepShape_RWDimensionalLocationWithPath *
**************************************************/
class RWStepShape_RWDimensionalLocationWithPath {
	public:
		/****************** RWStepShape_RWDimensionalLocationWithPath ******************/
		/**** md5 signature: 82df71b8c8c6863bc0cecac517aeb885 ****/
		%feature("compactdefaultargs") RWStepShape_RWDimensionalLocationWithPath;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWDimensionalLocationWithPath;
		 RWStepShape_RWDimensionalLocationWithPath();

		/****************** ReadStep ******************/
		/**** md5 signature: fcf6e45336aaf415af18748a232d923a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads dimensionallocationwithpath.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_DimensionalLocationWithPath

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_DimensionalLocationWithPath> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7c5a553e0428198ba79007a41ac70dc6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_DimensionalLocationWithPath
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_DimensionalLocationWithPath> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 23fee97b364a9f5d55f52207f75dd4db ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes dimensionallocationwithpath.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_DimensionalLocationWithPath

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_DimensionalLocationWithPath> & ent);

};


%extend RWStepShape_RWDimensionalLocationWithPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepShape_RWDimensionalSize *
**************************************/
class RWStepShape_RWDimensionalSize {
	public:
		/****************** RWStepShape_RWDimensionalSize ******************/
		/**** md5 signature: 289fee743828d0fe9fd2eb61688660f8 ****/
		%feature("compactdefaultargs") RWStepShape_RWDimensionalSize;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWDimensionalSize;
		 RWStepShape_RWDimensionalSize();

		/****************** ReadStep ******************/
		/**** md5 signature: 1412a1438969b39ab0a35de7af915d85 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads dimensionalsize.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_DimensionalSize

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_DimensionalSize> & ent);

		/****************** Share ******************/
		/**** md5 signature: 42e664c91a9f17d641f5d3c516cf58f6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_DimensionalSize
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_DimensionalSize> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 82b34bca5aecd22b09c4a5184be0b085 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes dimensionalsize.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_DimensionalSize

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_DimensionalSize> & ent);

};


%extend RWStepShape_RWDimensionalSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepShape_RWDimensionalSizeWithPath *
**********************************************/
class RWStepShape_RWDimensionalSizeWithPath {
	public:
		/****************** RWStepShape_RWDimensionalSizeWithPath ******************/
		/**** md5 signature: ef966cbb534967975623c0cdfee803ef ****/
		%feature("compactdefaultargs") RWStepShape_RWDimensionalSizeWithPath;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWDimensionalSizeWithPath;
		 RWStepShape_RWDimensionalSizeWithPath();

		/****************** ReadStep ******************/
		/**** md5 signature: c13695bf8f5bdc170cd44247ba45ed6f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads dimensionalsizewithpath.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_DimensionalSizeWithPath

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_DimensionalSizeWithPath> & ent);

		/****************** Share ******************/
		/**** md5 signature: 8c2354dcd393f1e690677cc3fdc81983 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_DimensionalSizeWithPath
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_DimensionalSizeWithPath> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a397ee1740a0e02f32c8093274594476 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes dimensionalsizewithpath.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_DimensionalSizeWithPath

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_DimensionalSizeWithPath> & ent);

};


%extend RWStepShape_RWDimensionalSizeWithPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWStepShape_RWEdge *
***************************/
class RWStepShape_RWEdge {
	public:
		/****************** RWStepShape_RWEdge ******************/
		/**** md5 signature: 1fcf4771728354572b19cd11d26b33ab ****/
		%feature("compactdefaultargs") RWStepShape_RWEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWEdge;
		 RWStepShape_RWEdge();

		/****************** ReadStep ******************/
		/**** md5 signature: d9c088d46a2e5d5652ae39b149194aa7 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_Edge

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_Edge> & ent);

		/****************** Share ******************/
		/**** md5 signature: 542d645c55ded9ea0767552b6e0994c7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_Edge
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_Edge> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 65636e94df84ae80ddbb9aec29bb61c6 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_Edge

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_Edge> & ent);

};


%extend RWStepShape_RWEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepShape_RWEdgeBasedWireframeModel *
**********************************************/
class RWStepShape_RWEdgeBasedWireframeModel {
	public:
		/****************** RWStepShape_RWEdgeBasedWireframeModel ******************/
		/**** md5 signature: 0dfba69352d17fbe01789daaf7fdbbfd ****/
		%feature("compactdefaultargs") RWStepShape_RWEdgeBasedWireframeModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWEdgeBasedWireframeModel;
		 RWStepShape_RWEdgeBasedWireframeModel();

		/****************** ReadStep ******************/
		/**** md5 signature: bf0213557ee2e769663b05108cd41cca ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads edgebasedwireframemodel.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_EdgeBasedWireframeModel

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_EdgeBasedWireframeModel> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0352eaa59f56bc468e01f421aefe2a67 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_EdgeBasedWireframeModel
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_EdgeBasedWireframeModel> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a3cc3e3c74aaa410ee9911be5a7b2a0c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes edgebasedwireframemodel.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_EdgeBasedWireframeModel

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_EdgeBasedWireframeModel> & ent);

};


%extend RWStepShape_RWEdgeBasedWireframeModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepShape_RWEdgeBasedWireframeShapeRepresentation *
************************************************************/
class RWStepShape_RWEdgeBasedWireframeShapeRepresentation {
	public:
		/****************** RWStepShape_RWEdgeBasedWireframeShapeRepresentation ******************/
		/**** md5 signature: 0399c0837fa8678f412d7079ce19df1b ****/
		%feature("compactdefaultargs") RWStepShape_RWEdgeBasedWireframeShapeRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWEdgeBasedWireframeShapeRepresentation;
		 RWStepShape_RWEdgeBasedWireframeShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 5c7adcd7c52bdd577ee604948b42c31a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads edgebasedwireframeshaperepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_EdgeBasedWireframeShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_EdgeBasedWireframeShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 412ce77b9d0ca6fe42cb751aa3ce65cd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_EdgeBasedWireframeShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_EdgeBasedWireframeShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a87174a62fa7910299628d6a5f86da0c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes edgebasedwireframeshaperepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_EdgeBasedWireframeShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_EdgeBasedWireframeShapeRepresentation> & ent);

};


%extend RWStepShape_RWEdgeBasedWireframeShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStepShape_RWEdgeCurve *
********************************/
class RWStepShape_RWEdgeCurve {
	public:
		/****************** RWStepShape_RWEdgeCurve ******************/
		/**** md5 signature: cb7fda01811de0ac1481426eb9fb6375 ****/
		%feature("compactdefaultargs") RWStepShape_RWEdgeCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWEdgeCurve;
		 RWStepShape_RWEdgeCurve();

		/****************** Check ******************/
		/**** md5 signature: c4de4c95e51cf680b82fe5d8af5a988e ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_EdgeCurve
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepShape_EdgeCurve> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		/**** md5 signature: 8722a25a3ac460b30b0321ed3860d82e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_EdgeCurve

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_EdgeCurve> & ent);

		/****************** Share ******************/
		/**** md5 signature: 849e99d0738c647841ef43573cb5fae4 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_EdgeCurve
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_EdgeCurve> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 474fb09fd1e202615392033da9db3667 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_EdgeCurve

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_EdgeCurve> & ent);

};


%extend RWStepShape_RWEdgeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepShape_RWEdgeLoop *
*******************************/
class RWStepShape_RWEdgeLoop {
	public:
		/****************** RWStepShape_RWEdgeLoop ******************/
		/**** md5 signature: 3b4f161eef926b1a5a82a473cad80422 ****/
		%feature("compactdefaultargs") RWStepShape_RWEdgeLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWEdgeLoop;
		 RWStepShape_RWEdgeLoop();

		/****************** Check ******************/
		/**** md5 signature: bc51ae5dab733b3091dddc748cf8db2e ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_EdgeLoop
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepShape_EdgeLoop> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		/**** md5 signature: b6183ffe5198ba107adc2b9e4b6207f5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_EdgeLoop

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_EdgeLoop> & ent);

		/****************** Share ******************/
		/**** md5 signature: d8f8af9d4a254176d174ad46010a88ad ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_EdgeLoop
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_EdgeLoop> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 363bc3fe07fca38583f707e87a7c8c51 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_EdgeLoop

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_EdgeLoop> & ent);

};


%extend RWStepShape_RWEdgeLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepShape_RWExtrudedAreaSolid *
****************************************/
class RWStepShape_RWExtrudedAreaSolid {
	public:
		/****************** RWStepShape_RWExtrudedAreaSolid ******************/
		/**** md5 signature: f588e4dcdd15dbad1f909662780cfbd4 ****/
		%feature("compactdefaultargs") RWStepShape_RWExtrudedAreaSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWExtrudedAreaSolid;
		 RWStepShape_RWExtrudedAreaSolid();

		/****************** ReadStep ******************/
		/**** md5 signature: eacd34b007037480e281f337541a2659 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ExtrudedAreaSolid

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ExtrudedAreaSolid> & ent);

		/****************** Share ******************/
		/**** md5 signature: d4c5a6cb1dea513009916065da241c43 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_ExtrudedAreaSolid
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ExtrudedAreaSolid> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 7311527763701dbbf25e5c975e7db30a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ExtrudedAreaSolid

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ExtrudedAreaSolid> & ent);

};


%extend RWStepShape_RWExtrudedAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepShape_RWExtrudedFaceSolid *
****************************************/
class RWStepShape_RWExtrudedFaceSolid {
	public:
		/****************** RWStepShape_RWExtrudedFaceSolid ******************/
		/**** md5 signature: f76c438ac3eb74f2b5ec67d1438cf08c ****/
		%feature("compactdefaultargs") RWStepShape_RWExtrudedFaceSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWExtrudedFaceSolid;
		 RWStepShape_RWExtrudedFaceSolid();

		/****************** ReadStep ******************/
		/**** md5 signature: 03f471b5a130c59aa7d0e6e97aec0afc ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ExtrudedFaceSolid

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ExtrudedFaceSolid> & ent);

		/****************** Share ******************/
		/**** md5 signature: f46ade7001ec205acb01f78797220c46 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_ExtrudedFaceSolid
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ExtrudedFaceSolid> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 768c6b9f0fcae957cdd2fec93120b266 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ExtrudedFaceSolid

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ExtrudedFaceSolid> & ent);

};


%extend RWStepShape_RWExtrudedFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWStepShape_RWFace *
***************************/
class RWStepShape_RWFace {
	public:
		/****************** RWStepShape_RWFace ******************/
		/**** md5 signature: a9d8f8e0a14a0a6c478d45a2e1f0a8af ****/
		%feature("compactdefaultargs") RWStepShape_RWFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFace;
		 RWStepShape_RWFace();

		/****************** ReadStep ******************/
		/**** md5 signature: c45838ff7545f9e384b647ae4fc0b8be ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_Face

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_Face> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7a2a44ae1b5e83ebbe638ebc79f5c960 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_Face
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_Face> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d272df37d45ddf39c013eca836dd838e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_Face

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_Face> & ent);

};


%extend RWStepShape_RWFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepShape_RWFaceBasedSurfaceModel *
********************************************/
class RWStepShape_RWFaceBasedSurfaceModel {
	public:
		/****************** RWStepShape_RWFaceBasedSurfaceModel ******************/
		/**** md5 signature: d557ddc45c1a978ff479e0c4372f7692 ****/
		%feature("compactdefaultargs") RWStepShape_RWFaceBasedSurfaceModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWFaceBasedSurfaceModel;
		 RWStepShape_RWFaceBasedSurfaceModel();

		/****************** ReadStep ******************/
		/**** md5 signature: ebb77b7c1787a52599fd136d2916036e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads facebasedsurfacemodel.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_FaceBasedSurfaceModel

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_FaceBasedSurfaceModel> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1316296529d0ea50929e0c94b8afb32e ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_FaceBasedSurfaceModel
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_FaceBasedSurfaceModel> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8b830f4a3da8ab520cf65791bf538b82 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes facebasedsurfacemodel.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_FaceBasedSurfaceModel

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_FaceBasedSurfaceModel> & ent);

};


%extend RWStepShape_RWFaceBasedSurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStepShape_RWFaceBound *
********************************/
class RWStepShape_RWFaceBound {
	public:
		/****************** RWStepShape_RWFaceBound ******************/
		/**** md5 signature: eb40a1c304b2882e4aa9dc1401d60d69 ****/
		%feature("compactdefaultargs") RWStepShape_RWFaceBound;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFaceBound;
		 RWStepShape_RWFaceBound();

		/****************** Check ******************/
		/**** md5 signature: 8eb2d6ed1ea7619a9ce51b0c5a8fc0d2 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_FaceBound
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(const opencascade::handle<StepShape_FaceBound> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** ReadStep ******************/
		/**** md5 signature: b94f27a0c095bb709096442b43934b58 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_FaceBound

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_FaceBound> & ent);

		/****************** Share ******************/
		/**** md5 signature: 25087ef56339e4d75a7dccaaffcdba0d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_FaceBound
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_FaceBound> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c7e08e9c4dd635fae232fb07abc4d143 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_FaceBound

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_FaceBound> & ent);

};


%extend RWStepShape_RWFaceBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepShape_RWFaceOuterBound *
*************************************/
class RWStepShape_RWFaceOuterBound {
	public:
		/****************** RWStepShape_RWFaceOuterBound ******************/
		/**** md5 signature: 7273d62efefb9ae56efa2779b794f311 ****/
		%feature("compactdefaultargs") RWStepShape_RWFaceOuterBound;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFaceOuterBound;
		 RWStepShape_RWFaceOuterBound();

		/****************** ReadStep ******************/
		/**** md5 signature: 22ef8e566cda4bf5ae4980c862c35c05 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_FaceOuterBound

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_FaceOuterBound> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3a466b4f502c5d7ed9cbdfa7fe4b1601 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_FaceOuterBound
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_FaceOuterBound> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: dd994ea6a9833ad3430fc71c07516e7f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_FaceOuterBound

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_FaceOuterBound> & ent);

};


%extend RWStepShape_RWFaceOuterBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepShape_RWFaceSurface *
**********************************/
class RWStepShape_RWFaceSurface {
	public:
		/****************** RWStepShape_RWFaceSurface ******************/
		/**** md5 signature: 1d69f8e916cb89ab3c336a16159d6ec2 ****/
		%feature("compactdefaultargs") RWStepShape_RWFaceSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFaceSurface;
		 RWStepShape_RWFaceSurface();

		/****************** ReadStep ******************/
		/**** md5 signature: 535d91edade4797d1b4837a09afc7634 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_FaceSurface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_FaceSurface> & ent);

		/****************** Share ******************/
		/**** md5 signature: a5ab4596a47b1f5bdf546395503afa9d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_FaceSurface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_FaceSurface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 51c58721e09849f40516729cb06da69e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_FaceSurface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_FaceSurface> & ent);

};


%extend RWStepShape_RWFaceSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepShape_RWFacetedBrep *
**********************************/
class RWStepShape_RWFacetedBrep {
	public:
		/****************** RWStepShape_RWFacetedBrep ******************/
		/**** md5 signature: 1d2e5d2d03a47cecc207331faeea0a96 ****/
		%feature("compactdefaultargs") RWStepShape_RWFacetedBrep;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFacetedBrep;
		 RWStepShape_RWFacetedBrep();

		/****************** ReadStep ******************/
		/**** md5 signature: f0dfa1417a28f8748ec80a8b660b3ac4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_FacetedBrep

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_FacetedBrep> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7561eefe8cfd65633e61acb1f3694c08 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_FacetedBrep
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_FacetedBrep> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e4d3d5c78330957653a7472b33af12cd ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_FacetedBrep

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_FacetedBrep> & ent);

};


%extend RWStepShape_RWFacetedBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepShape_RWFacetedBrepAndBrepWithVoids *
**************************************************/
class RWStepShape_RWFacetedBrepAndBrepWithVoids {
	public:
		/****************** RWStepShape_RWFacetedBrepAndBrepWithVoids ******************/
		/**** md5 signature: 917ed1398144c6d2c27a4267f34a56f8 ****/
		%feature("compactdefaultargs") RWStepShape_RWFacetedBrepAndBrepWithVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFacetedBrepAndBrepWithVoids;
		 RWStepShape_RWFacetedBrepAndBrepWithVoids();

		/****************** ReadStep ******************/
		/**** md5 signature: 416f247fab4ae290c356c008589de5a2 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_FacetedBrepAndBrepWithVoids

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_FacetedBrepAndBrepWithVoids> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1226652349725da236e0277d74fcde41 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_FacetedBrepAndBrepWithVoids
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_FacetedBrepAndBrepWithVoids> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 17ed82e470b999e0eda4623832a3be11 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_FacetedBrepAndBrepWithVoids

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_FacetedBrepAndBrepWithVoids> & ent);

};


%extend RWStepShape_RWFacetedBrepAndBrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepShape_RWFacetedBrepShapeRepresentation *
*****************************************************/
class RWStepShape_RWFacetedBrepShapeRepresentation {
	public:
		/****************** RWStepShape_RWFacetedBrepShapeRepresentation ******************/
		/**** md5 signature: 6087aaaa8acde8395e48b4741b6136e5 ****/
		%feature("compactdefaultargs") RWStepShape_RWFacetedBrepShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFacetedBrepShapeRepresentation;
		 RWStepShape_RWFacetedBrepShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 394ad58da864538e06ac36643604f5e3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_FacetedBrepShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_FacetedBrepShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 833ef2302a0b5aab945c1c5c5d9ed64c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_FacetedBrepShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_FacetedBrepShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 087760c5d7e3f2e41029f22efcab7893 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_FacetedBrepShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_FacetedBrepShapeRepresentation> & ent);

};


%extend RWStepShape_RWFacetedBrepShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepShape_RWGeometricCurveSet *
****************************************/
class RWStepShape_RWGeometricCurveSet {
	public:
		/****************** RWStepShape_RWGeometricCurveSet ******************/
		/**** md5 signature: e954d2ba332ff8ee069cd8244963420d ****/
		%feature("compactdefaultargs") RWStepShape_RWGeometricCurveSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWGeometricCurveSet;
		 RWStepShape_RWGeometricCurveSet();

		/****************** ReadStep ******************/
		/**** md5 signature: 2e33fd811a4f32557343bb35589ba140 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_GeometricCurveSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_GeometricCurveSet> & ent);

		/****************** Share ******************/
		/**** md5 signature: 00120c1526d716e96affe29fbb46bae1 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_GeometricCurveSet
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_GeometricCurveSet> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d4549621c6aa332e9bdfc5a0bd0dc8e1 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_GeometricCurveSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_GeometricCurveSet> & ent);

};


%extend RWStepShape_RWGeometricCurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepShape_RWGeometricSet *
***********************************/
class RWStepShape_RWGeometricSet {
	public:
		/****************** RWStepShape_RWGeometricSet ******************/
		/**** md5 signature: a21218e2c81902814ba36f6529321900 ****/
		%feature("compactdefaultargs") RWStepShape_RWGeometricSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWGeometricSet;
		 RWStepShape_RWGeometricSet();

		/****************** ReadStep ******************/
		/**** md5 signature: 27012dd347e9489808dbefb7497661d9 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_GeometricSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_GeometricSet> & ent);

		/****************** Share ******************/
		/**** md5 signature: b99bcdfb96060291aa6d161029007aa8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_GeometricSet
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_GeometricSet> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 0af90262af72731b193dfb8a592070d8 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_GeometricSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_GeometricSet> & ent);

};


%extend RWStepShape_RWGeometricSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************************
* class RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation *
*********************************************************************/
class RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation {
	public:
		/****************** RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation ******************/
		/**** md5 signature: 8e170f95e48b65318a1406f2507e2bf8 ****/
		%feature("compactdefaultargs") RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation;
		 RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: a00a5b36c244bdac15bf99a9efb6ba9f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_GeometricallyBoundedSurfaceShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_GeometricallyBoundedSurfaceShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 108a308dbd8633099c63c5770e21eea7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_GeometricallyBoundedSurfaceShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_GeometricallyBoundedSurfaceShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4397037850b94eb974d55338b834701f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_GeometricallyBoundedSurfaceShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_GeometricallyBoundedSurfaceShapeRepresentation> & ent);

};


%extend RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************************
* class RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation *
***********************************************************************/
class RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation {
	public:
		/****************** RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation ******************/
		/**** md5 signature: fcab925852e2ff36d90efe7eedf3d823 ****/
		%feature("compactdefaultargs") RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation;
		 RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: cfc6169eb734bde09611c1053a5fbb91 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_GeometricallyBoundedWireframeShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_GeometricallyBoundedWireframeShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: addd1ae02f209b69957b6acdae281cc9 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_GeometricallyBoundedWireframeShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_GeometricallyBoundedWireframeShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 956ef93eab54da626509940760072ece ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_GeometricallyBoundedWireframeShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_GeometricallyBoundedWireframeShapeRepresentation> & ent);

};


%extend RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepShape_RWHalfSpaceSolid *
*************************************/
class RWStepShape_RWHalfSpaceSolid {
	public:
		/****************** RWStepShape_RWHalfSpaceSolid ******************/
		/**** md5 signature: 56eb9db5090251d0380510cf1c952de4 ****/
		%feature("compactdefaultargs") RWStepShape_RWHalfSpaceSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWHalfSpaceSolid;
		 RWStepShape_RWHalfSpaceSolid();

		/****************** ReadStep ******************/
		/**** md5 signature: b8fb2375d2290bcf424e6c9b99cb33e1 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_HalfSpaceSolid

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_HalfSpaceSolid> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5346ef42a3fa6c76432c0e1784f217a2 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_HalfSpaceSolid
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_HalfSpaceSolid> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: f82cf29114dfb0ec811afa4cda8e7193 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_HalfSpaceSolid

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_HalfSpaceSolid> & ent);

};


%extend RWStepShape_RWHalfSpaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepShape_RWLimitsAndFits *
************************************/
class RWStepShape_RWLimitsAndFits {
	public:
		/****************** RWStepShape_RWLimitsAndFits ******************/
		/**** md5 signature: e89b986411fb3b636d44f8ac4b0fe24c ****/
		%feature("compactdefaultargs") RWStepShape_RWLimitsAndFits;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWLimitsAndFits;
		 RWStepShape_RWLimitsAndFits();

		/****************** ReadStep ******************/
		/**** md5 signature: f627342eeba4ade214fd8e977836e5f3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_LimitsAndFits

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_LimitsAndFits> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 42baa483b3da29617b9ddd512e5db800 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_LimitsAndFits

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_LimitsAndFits> & ent);

};


%extend RWStepShape_RWLimitsAndFits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWStepShape_RWLoop *
***************************/
class RWStepShape_RWLoop {
	public:
		/****************** RWStepShape_RWLoop ******************/
		/**** md5 signature: c94c67f548e813d6c3f7a8d6b7e4d88d ****/
		%feature("compactdefaultargs") RWStepShape_RWLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWLoop;
		 RWStepShape_RWLoop();

		/****************** ReadStep ******************/
		/**** md5 signature: 674d03bbd9bdd3f2d468f4e29d9492ea ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_Loop

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_Loop> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 6b53b0b424b60532bda14aef46c6b8d4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_Loop

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_Loop> & ent);

};


%extend RWStepShape_RWLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepShape_RWLoopAndPath *
**********************************/
class RWStepShape_RWLoopAndPath {
	public:
		/****************** RWStepShape_RWLoopAndPath ******************/
		/**** md5 signature: 7f05daa1e0450ef3262956de6aec4463 ****/
		%feature("compactdefaultargs") RWStepShape_RWLoopAndPath;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWLoopAndPath;
		 RWStepShape_RWLoopAndPath();

		/****************** ReadStep ******************/
		/**** md5 signature: 152a5b7c85e87012ca906e6aabde8d50 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_LoopAndPath

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_LoopAndPath> & ent);

		/****************** Share ******************/
		/**** md5 signature: 897bab9949e378a367489c62f70fedcb ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_LoopAndPath
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_LoopAndPath> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 362b61dbb56fdcaf885b428d33486158 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_LoopAndPath

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_LoopAndPath> & ent);

};


%extend RWStepShape_RWLoopAndPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepShape_RWManifoldSolidBrep *
****************************************/
class RWStepShape_RWManifoldSolidBrep {
	public:
		/****************** RWStepShape_RWManifoldSolidBrep ******************/
		/**** md5 signature: 0e2f82052cc272b66628dc80cc2eff22 ****/
		%feature("compactdefaultargs") RWStepShape_RWManifoldSolidBrep;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWManifoldSolidBrep;
		 RWStepShape_RWManifoldSolidBrep();

		/****************** ReadStep ******************/
		/**** md5 signature: 0fa020c339a60c344987361e049aa808 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ManifoldSolidBrep

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ManifoldSolidBrep> & ent);

		/****************** Share ******************/
		/**** md5 signature: edd3cbfd7bb369f56432c40a4b5cf5c8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_ManifoldSolidBrep
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ManifoldSolidBrep> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 31b87a2b91df3218b8232e08962d799c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ManifoldSolidBrep

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ManifoldSolidBrep> & ent);

};


%extend RWStepShape_RWManifoldSolidBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class RWStepShape_RWManifoldSurfaceShapeRepresentation *
*********************************************************/
class RWStepShape_RWManifoldSurfaceShapeRepresentation {
	public:
		/****************** RWStepShape_RWManifoldSurfaceShapeRepresentation ******************/
		/**** md5 signature: 5b5d9440423ab0fc30d53bc98f75db9c ****/
		%feature("compactdefaultargs") RWStepShape_RWManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWManifoldSurfaceShapeRepresentation;
		 RWStepShape_RWManifoldSurfaceShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 844eaf74e35e3e62bba35af505ac72ca ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ManifoldSurfaceShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ManifoldSurfaceShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1856224d1ee649b0ee2c2f8b82ba0ebf ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_ManifoldSurfaceShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ManifoldSurfaceShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 66a8f314072b234adfe6e988d63c53e6 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ManifoldSurfaceShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ManifoldSurfaceShapeRepresentation> & ent);

};


%extend RWStepShape_RWManifoldSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepShape_RWMeasureQualification *
*******************************************/
class RWStepShape_RWMeasureQualification {
	public:
		/****************** RWStepShape_RWMeasureQualification ******************/
		/**** md5 signature: c44733c2e8ef47affcbf4d2811f3b8ce ****/
		%feature("compactdefaultargs") RWStepShape_RWMeasureQualification;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWMeasureQualification;
		 RWStepShape_RWMeasureQualification();

		/****************** ReadStep ******************/
		/**** md5 signature: 351b46e280a2e696986569ccb438afc2 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_MeasureQualification

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_MeasureQualification> & ent);

		/****************** Share ******************/
		/**** md5 signature: 33760e7c722d98dec41be5ab031f3e14 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_MeasureQualification
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_MeasureQualification> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a625c0be007c9281d2db467fd9f76223 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_MeasureQualification

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_MeasureQualification> & ent);

};


%extend RWStepShape_RWMeasureQualification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************************************
* class RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem *
******************************************************************************/
class RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem {
	public:
		/****************** RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem ******************/
		/**** md5 signature: b821b36a863e42b72713d2312b968985 ****/
		%feature("compactdefaultargs") RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem;
		 RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: d5a6a3c4c02b26b88509425a6aa6739f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 97b5350b29bd5ee75f389a0451a1bbbc ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c619f6995a9e38b7db1444b4c9746367 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem> & ent);

};


%extend RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepShape_RWNonManifoldSurfaceShapeRepresentation *
************************************************************/
class RWStepShape_RWNonManifoldSurfaceShapeRepresentation {
	public:
		/****************** RWStepShape_RWNonManifoldSurfaceShapeRepresentation ******************/
		/**** md5 signature: 68d3251c2c52879fd8dc91853dd4c9cd ****/
		%feature("compactdefaultargs") RWStepShape_RWNonManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWNonManifoldSurfaceShapeRepresentation;
		 RWStepShape_RWNonManifoldSurfaceShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: a0f693b1378a916cf2a57155a244bf04 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nonmanifoldsurfaceshaperepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_NonManifoldSurfaceShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_NonManifoldSurfaceShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5462d9295cf3cdf3a08184eeeb84942c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_NonManifoldSurfaceShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_NonManifoldSurfaceShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 66f3112c280e98896bc378b7b87a67bb ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nonmanifoldsurfaceshaperepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_NonManifoldSurfaceShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_NonManifoldSurfaceShapeRepresentation> & ent);

};


%extend RWStepShape_RWNonManifoldSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStepShape_RWOpenShell *
********************************/
class RWStepShape_RWOpenShell {
	public:
		/****************** RWStepShape_RWOpenShell ******************/
		/**** md5 signature: 22fe2c94e98394bbd654f1c9231e3b59 ****/
		%feature("compactdefaultargs") RWStepShape_RWOpenShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOpenShell;
		 RWStepShape_RWOpenShell();

		/****************** ReadStep ******************/
		/**** md5 signature: 771d5fdabba42253fcd6037424b67cd0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_OpenShell

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_OpenShell> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1b70ea2ab32e1d95b9b90efb0cd6650d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_OpenShell
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_OpenShell> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 960272f47e61febca8b6622cfed947c8 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_OpenShell

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_OpenShell> & ent);

};


%extend RWStepShape_RWOpenShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepShape_RWOrientedClosedShell *
******************************************/
class RWStepShape_RWOrientedClosedShell {
	public:
		/****************** RWStepShape_RWOrientedClosedShell ******************/
		/**** md5 signature: 946d8b9c9e50f6e11be7d9dfc76bef65 ****/
		%feature("compactdefaultargs") RWStepShape_RWOrientedClosedShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOrientedClosedShell;
		 RWStepShape_RWOrientedClosedShell();

		/****************** ReadStep ******************/
		/**** md5 signature: 1a60cfffb8ef08318c58d7a284a80dcd ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_OrientedClosedShell

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_OrientedClosedShell> & ent);

		/****************** Share ******************/
		/**** md5 signature: 184014e75797c68358baace1b3c7a073 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_OrientedClosedShell
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_OrientedClosedShell> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 886e5d3269a2f1fcb3a35cbef08a25f2 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_OrientedClosedShell

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_OrientedClosedShell> & ent);

};


%extend RWStepShape_RWOrientedClosedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepShape_RWOrientedEdge *
***********************************/
class RWStepShape_RWOrientedEdge {
	public:
		/****************** RWStepShape_RWOrientedEdge ******************/
		/**** md5 signature: 9c3a3dac22a67f1e01d49c96ecd48f87 ****/
		%feature("compactdefaultargs") RWStepShape_RWOrientedEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOrientedEdge;
		 RWStepShape_RWOrientedEdge();

		/****************** ReadStep ******************/
		/**** md5 signature: 0a983ffc8c9e03b5b1457aa1956669b2 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_OrientedEdge

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_OrientedEdge> & ent);

		/****************** Share ******************/
		/**** md5 signature: 05a6babfc8cbf7717081fe3296027e73 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_OrientedEdge
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_OrientedEdge> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: cb1e57fc1f35405f52cd708152766116 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_OrientedEdge

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_OrientedEdge> & ent);

};


%extend RWStepShape_RWOrientedEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepShape_RWOrientedFace *
***********************************/
class RWStepShape_RWOrientedFace {
	public:
		/****************** RWStepShape_RWOrientedFace ******************/
		/**** md5 signature: faa7c9368a7e8c9668ebc36c575eb193 ****/
		%feature("compactdefaultargs") RWStepShape_RWOrientedFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOrientedFace;
		 RWStepShape_RWOrientedFace();

		/****************** ReadStep ******************/
		/**** md5 signature: 7ef7c3e60bff1ee0c952c96f34645ec7 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_OrientedFace

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_OrientedFace> & ent);

		/****************** Share ******************/
		/**** md5 signature: 8fb3c668c1ea60e64b5745c5f33816c3 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_OrientedFace
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_OrientedFace> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ad10667c4bbd4f12b4bd721e1aa5f99b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_OrientedFace

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_OrientedFace> & ent);

};


%extend RWStepShape_RWOrientedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepShape_RWOrientedOpenShell *
****************************************/
class RWStepShape_RWOrientedOpenShell {
	public:
		/****************** RWStepShape_RWOrientedOpenShell ******************/
		/**** md5 signature: ea9ed8b117d12ff0bd9090a22a54a7b7 ****/
		%feature("compactdefaultargs") RWStepShape_RWOrientedOpenShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOrientedOpenShell;
		 RWStepShape_RWOrientedOpenShell();

		/****************** ReadStep ******************/
		/**** md5 signature: f1e8095607f569f900a46fa022541f92 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_OrientedOpenShell

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_OrientedOpenShell> & ent);

		/****************** Share ******************/
		/**** md5 signature: 12e4d8921b6bf807e5034bdf5cbc08bc ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_OrientedOpenShell
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_OrientedOpenShell> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 27c7820f912863c5bd7aa20d71a2d77a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_OrientedOpenShell

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_OrientedOpenShell> & ent);

};


%extend RWStepShape_RWOrientedOpenShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepShape_RWOrientedPath *
***********************************/
class RWStepShape_RWOrientedPath {
	public:
		/****************** RWStepShape_RWOrientedPath ******************/
		/**** md5 signature: 737f67c3a38f9ea3a64d337b842ac624 ****/
		%feature("compactdefaultargs") RWStepShape_RWOrientedPath;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOrientedPath;
		 RWStepShape_RWOrientedPath();

		/****************** ReadStep ******************/
		/**** md5 signature: 0b169ab1ffcd655fde04ac82cb196883 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_OrientedPath

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_OrientedPath> & ent);

		/****************** Share ******************/
		/**** md5 signature: f27dd156e32970cdaff88733c87a71a0 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_OrientedPath
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_OrientedPath> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: cfe8b699aa454946898797d868932b2a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_OrientedPath

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_OrientedPath> & ent);

};


%extend RWStepShape_RWOrientedPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWStepShape_RWPath *
***************************/
class RWStepShape_RWPath {
	public:
		/****************** RWStepShape_RWPath ******************/
		/**** md5 signature: 68038691f2b437ca732e4abf46d0c60b ****/
		%feature("compactdefaultargs") RWStepShape_RWPath;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWPath;
		 RWStepShape_RWPath();

		/****************** ReadStep ******************/
		/**** md5 signature: a8c906f03e43073e7ce943494698542e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_Path

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_Path> & ent);

		/****************** Share ******************/
		/**** md5 signature: d2d746c7a5125034a67c6eb19e74cac8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_Path
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_Path> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 6af8af7042c459abdbc1ba265c77418f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_Path

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_Path> & ent);

};


%extend RWStepShape_RWPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepShape_RWPlusMinusTolerance *
*****************************************/
class RWStepShape_RWPlusMinusTolerance {
	public:
		/****************** RWStepShape_RWPlusMinusTolerance ******************/
		/**** md5 signature: 3cfdcef9e995a5a073888c7294da985d ****/
		%feature("compactdefaultargs") RWStepShape_RWPlusMinusTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWPlusMinusTolerance;
		 RWStepShape_RWPlusMinusTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: e4b4d9ce2d101064a89f40ee1af94e5d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_PlusMinusTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_PlusMinusTolerance> & ent);

		/****************** Share ******************/
		/**** md5 signature: 62c567040c35a0a74f987f2ee44a6611 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_PlusMinusTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_PlusMinusTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e50328f25465a0bd3b400609c6353010 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_PlusMinusTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_PlusMinusTolerance> & ent);

};


%extend RWStepShape_RWPlusMinusTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepShape_RWPointRepresentation *
******************************************/
class RWStepShape_RWPointRepresentation {
	public:
		/****************** RWStepShape_RWPointRepresentation ******************/
		/**** md5 signature: 0c0b15afffe5daba50436ce1e3bb5ba7 ****/
		%feature("compactdefaultargs") RWStepShape_RWPointRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWPointRepresentation;
		 RWStepShape_RWPointRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 40f2ba6e88751b0abd45baf402d983f5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads pointrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_PointRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_PointRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6e334b7884e05f333107bc31d36f5d48 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_PointRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_PointRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 37e596bce949297ae90dc3ca9d866c46 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes pointrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_PointRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_PointRepresentation> & ent);

};


%extend RWStepShape_RWPointRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepShape_RWPolyLoop *
*******************************/
class RWStepShape_RWPolyLoop {
	public:
		/****************** RWStepShape_RWPolyLoop ******************/
		/**** md5 signature: ceb1637dcbc9706c4f716c2a3befa441 ****/
		%feature("compactdefaultargs") RWStepShape_RWPolyLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWPolyLoop;
		 RWStepShape_RWPolyLoop();

		/****************** ReadStep ******************/
		/**** md5 signature: 7b5d0310f6b6c2351795fe29b51de73c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_PolyLoop

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_PolyLoop> & ent);

		/****************** Share ******************/
		/**** md5 signature: 14f66fe0b9c4ff28192c9b5e81017423 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_PolyLoop
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_PolyLoop> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: aeae20cd4081a9373d2278da0ea5c9d4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_PolyLoop

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_PolyLoop> & ent);

};


%extend RWStepShape_RWPolyLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepShape_RWPrecisionQualifier *
*****************************************/
class RWStepShape_RWPrecisionQualifier {
	public:
		/****************** RWStepShape_RWPrecisionQualifier ******************/
		/**** md5 signature: 4fcd0e327dee0f3e79e63420e60fe241 ****/
		%feature("compactdefaultargs") RWStepShape_RWPrecisionQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWPrecisionQualifier;
		 RWStepShape_RWPrecisionQualifier();

		/****************** ReadStep ******************/
		/**** md5 signature: f84a4ae9d7c5168c6d277d7ad58c935c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_PrecisionQualifier

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_PrecisionQualifier> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: ebba54ccd2a13a7e3614139794b5525b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_PrecisionQualifier

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_PrecisionQualifier> & ent);

};


%extend RWStepShape_RWPrecisionQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepShape_RWQualifiedRepresentationItem *
**************************************************/
class RWStepShape_RWQualifiedRepresentationItem {
	public:
		/****************** RWStepShape_RWQualifiedRepresentationItem ******************/
		/**** md5 signature: 4f1a54ed492aff922bcc28eb15da4fb9 ****/
		%feature("compactdefaultargs") RWStepShape_RWQualifiedRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWQualifiedRepresentationItem;
		 RWStepShape_RWQualifiedRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 5a8ae836d9585f5f9df7071bfafe5207 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_QualifiedRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_QualifiedRepresentationItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 224fec5adf8efc5593be09c4d0cc1883 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_QualifiedRepresentationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_QualifiedRepresentationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: fe1762dfb731fd3481b1359798b01a61 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_QualifiedRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_QualifiedRepresentationItem> & ent);

};


%extend RWStepShape_RWQualifiedRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepShape_RWRevolvedAreaSolid *
****************************************/
class RWStepShape_RWRevolvedAreaSolid {
	public:
		/****************** RWStepShape_RWRevolvedAreaSolid ******************/
		/**** md5 signature: 07bc1c81cf472fd8201d3fb7411223d7 ****/
		%feature("compactdefaultargs") RWStepShape_RWRevolvedAreaSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWRevolvedAreaSolid;
		 RWStepShape_RWRevolvedAreaSolid();

		/****************** ReadStep ******************/
		/**** md5 signature: 3a59da613b13f79214cd7a9b99bb2dd5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_RevolvedAreaSolid

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_RevolvedAreaSolid> & ent);

		/****************** Share ******************/
		/**** md5 signature: 82e99b5748d184972ee3654ec19b6bc4 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_RevolvedAreaSolid
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_RevolvedAreaSolid> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9ddb463dc526379f2717655a349a5e00 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_RevolvedAreaSolid

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_RevolvedAreaSolid> & ent);

};


%extend RWStepShape_RWRevolvedAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepShape_RWRevolvedFaceSolid *
****************************************/
class RWStepShape_RWRevolvedFaceSolid {
	public:
		/****************** RWStepShape_RWRevolvedFaceSolid ******************/
		/**** md5 signature: e1e06bc8a9989a31cf50fac41fa9ff7b ****/
		%feature("compactdefaultargs") RWStepShape_RWRevolvedFaceSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWRevolvedFaceSolid;
		 RWStepShape_RWRevolvedFaceSolid();

		/****************** ReadStep ******************/
		/**** md5 signature: b4dc2cb6fd70e1b0aa7ffc3281d3080a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_RevolvedFaceSolid

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_RevolvedFaceSolid> & ent);

		/****************** Share ******************/
		/**** md5 signature: b8a79910351a9f13f8adf42d74277001 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_RevolvedFaceSolid
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_RevolvedFaceSolid> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 17e66e1bef3f4ed0e4115ec3325038ec ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_RevolvedFaceSolid

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_RevolvedFaceSolid> & ent);

};


%extend RWStepShape_RWRevolvedFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepShape_RWRightAngularWedge *
****************************************/
class RWStepShape_RWRightAngularWedge {
	public:
		/****************** RWStepShape_RWRightAngularWedge ******************/
		/**** md5 signature: 29cb7ea524d43012f11d6ebb11ffc723 ****/
		%feature("compactdefaultargs") RWStepShape_RWRightAngularWedge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWRightAngularWedge;
		 RWStepShape_RWRightAngularWedge();

		/****************** ReadStep ******************/
		/**** md5 signature: 1d11a5500b59081527448ca7ccd7a353 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_RightAngularWedge

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_RightAngularWedge> & ent);

		/****************** Share ******************/
		/**** md5 signature: d213fe67d3f08b76ea1dd3d1cbed3a23 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_RightAngularWedge
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_RightAngularWedge> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: cd46f4fdff7dd65ab5527adee5662309 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_RightAngularWedge

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_RightAngularWedge> & ent);

};


%extend RWStepShape_RWRightAngularWedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepShape_RWRightCircularCone *
****************************************/
class RWStepShape_RWRightCircularCone {
	public:
		/****************** RWStepShape_RWRightCircularCone ******************/
		/**** md5 signature: 31d03487de2f10a8295755882d089e98 ****/
		%feature("compactdefaultargs") RWStepShape_RWRightCircularCone;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWRightCircularCone;
		 RWStepShape_RWRightCircularCone();

		/****************** ReadStep ******************/
		/**** md5 signature: a60bfb4643a94a298e6fd7833343b582 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_RightCircularCone

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_RightCircularCone> & ent);

		/****************** Share ******************/
		/**** md5 signature: 9cb4e43051b3e7b3253498a75c8c903b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_RightCircularCone
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_RightCircularCone> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 372cefacc1e6ee07e52ae5f4125eaffd ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_RightCircularCone

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_RightCircularCone> & ent);

};


%extend RWStepShape_RWRightCircularCone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepShape_RWRightCircularCylinder *
********************************************/
class RWStepShape_RWRightCircularCylinder {
	public:
		/****************** RWStepShape_RWRightCircularCylinder ******************/
		/**** md5 signature: 7a7dfed946f79dd1cdf3f9c091e44abe ****/
		%feature("compactdefaultargs") RWStepShape_RWRightCircularCylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWRightCircularCylinder;
		 RWStepShape_RWRightCircularCylinder();

		/****************** ReadStep ******************/
		/**** md5 signature: 44e73d6fea92a6f22505bc8d4b31c74f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_RightCircularCylinder

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_RightCircularCylinder> & ent);

		/****************** Share ******************/
		/**** md5 signature: c522b2dcdb4a544f8bc2237519033f67 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_RightCircularCylinder
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_RightCircularCylinder> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 171f290e0340ad4e0498688dd8b2499a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_RightCircularCylinder

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_RightCircularCylinder> & ent);

};


%extend RWStepShape_RWRightCircularCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepShape_RWSeamEdge *
*******************************/
class RWStepShape_RWSeamEdge {
	public:
		/****************** RWStepShape_RWSeamEdge ******************/
		/**** md5 signature: 380b62460a559c055fe5d626837d7246 ****/
		%feature("compactdefaultargs") RWStepShape_RWSeamEdge;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWSeamEdge;
		 RWStepShape_RWSeamEdge();

		/****************** ReadStep ******************/
		/**** md5 signature: 8d07b81822d75160ea66565db3b458d4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads seamedge.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_SeamEdge

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_SeamEdge> & ent);

		/****************** Share ******************/
		/**** md5 signature: 32c3ff8bd3702b4f7ab814e6588d4a17 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_SeamEdge
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_SeamEdge> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4a8f51efb3b2cdd820ff9e29f6ca9f33 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes seamedge.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_SeamEdge

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_SeamEdge> & ent);

};


%extend RWStepShape_RWSeamEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepShape_RWShapeDefinitionRepresentation *
****************************************************/
class RWStepShape_RWShapeDefinitionRepresentation {
	public:
		/****************** RWStepShape_RWShapeDefinitionRepresentation ******************/
		/**** md5 signature: 34289c90f52c5950d38eed63d5d7933a ****/
		%feature("compactdefaultargs") RWStepShape_RWShapeDefinitionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWShapeDefinitionRepresentation;
		 RWStepShape_RWShapeDefinitionRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 3aa92bd167ec4c42014f4e75079f3fe1 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shapedefinitionrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ShapeDefinitionRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: bb21b291f54cbd0525972eb65e2fda4d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_ShapeDefinitionRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4038e6bfef1da6eb83b7ac35513c9e0e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shapedefinitionrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ShapeDefinitionRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & ent);

};


%extend RWStepShape_RWShapeDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepShape_RWShapeDimensionRepresentation *
***************************************************/
class RWStepShape_RWShapeDimensionRepresentation {
	public:
		/****************** RWStepShape_RWShapeDimensionRepresentation ******************/
		/**** md5 signature: ae3f17e5f2f298f9b49325c6e32ce3e0 ****/
		%feature("compactdefaultargs") RWStepShape_RWShapeDimensionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWShapeDimensionRepresentation;
		 RWStepShape_RWShapeDimensionRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 66d0e9be1737fe1a0e21e47cf41cbe34 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shapedimensionrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ShapeDimensionRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ShapeDimensionRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5b02e1938427c0f466d793440b25f4a5 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_ShapeDimensionRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ShapeDimensionRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2aa8a5f91de6ac429e2cf60ce15fef4a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shapedimensionrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ShapeDimensionRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ShapeDimensionRepresentation> & ent);

};


%extend RWStepShape_RWShapeDimensionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepShape_RWShapeRepresentation *
******************************************/
class RWStepShape_RWShapeRepresentation {
	public:
		/****************** RWStepShape_RWShapeRepresentation ******************/
		/**** md5 signature: 1dfa11a549aa889de7e81f75592c432d ****/
		%feature("compactdefaultargs") RWStepShape_RWShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWShapeRepresentation;
		 RWStepShape_RWShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 442d23811019f590e20d4bf6a909f025 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: d8b0245456c6030025abf3fd4d9aed8f ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_ShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b2a25f073d467ec21afd15e227c67921 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ShapeRepresentation> & ent);

};


%extend RWStepShape_RWShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class RWStepShape_RWShapeRepresentationWithParameters *
********************************************************/
class RWStepShape_RWShapeRepresentationWithParameters {
	public:
		/****************** RWStepShape_RWShapeRepresentationWithParameters ******************/
		/**** md5 signature: 85eaad4b2173690a0192128b086db2fc ****/
		%feature("compactdefaultargs") RWStepShape_RWShapeRepresentationWithParameters;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWShapeRepresentationWithParameters;
		 RWStepShape_RWShapeRepresentationWithParameters();

		/****************** ReadStep ******************/
		/**** md5 signature: 5d3fc05c0bd9c8d504da94cedb79d72e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shaperepresentationwithparameters.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ShapeRepresentationWithParameters

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ShapeRepresentationWithParameters> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5aeec52fffba4a3c8506e61e40345d54 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_ShapeRepresentationWithParameters
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ShapeRepresentationWithParameters> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 475a045dbee4361ae07c90d0f5b42644 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shaperepresentationwithparameters.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ShapeRepresentationWithParameters

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ShapeRepresentationWithParameters> & ent);

};


%extend RWStepShape_RWShapeRepresentationWithParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepShape_RWShellBasedSurfaceModel *
*********************************************/
class RWStepShape_RWShellBasedSurfaceModel {
	public:
		/****************** RWStepShape_RWShellBasedSurfaceModel ******************/
		/**** md5 signature: 6b5d9be9e12cefbef37db84dc301acc0 ****/
		%feature("compactdefaultargs") RWStepShape_RWShellBasedSurfaceModel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWShellBasedSurfaceModel;
		 RWStepShape_RWShellBasedSurfaceModel();

		/****************** ReadStep ******************/
		/**** md5 signature: 771c6bc40d28d1234fd178d4507258fe ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ShellBasedSurfaceModel

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ShellBasedSurfaceModel> & ent);

		/****************** Share ******************/
		/**** md5 signature: 8765b080ffb2a278bb8c7d71f650435a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_ShellBasedSurfaceModel
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ShellBasedSurfaceModel> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 22e51a6fd37f2c2a4d05b4f201d1bd06 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ShellBasedSurfaceModel

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ShellBasedSurfaceModel> & ent);

};


%extend RWStepShape_RWShellBasedSurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepShape_RWSolidModel *
*********************************/
class RWStepShape_RWSolidModel {
	public:
		/****************** RWStepShape_RWSolidModel ******************/
		/**** md5 signature: f2cdc68d0bb80b3e092161d61e44a63c ****/
		%feature("compactdefaultargs") RWStepShape_RWSolidModel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWSolidModel;
		 RWStepShape_RWSolidModel();

		/****************** ReadStep ******************/
		/**** md5 signature: 780f0d81bdf360d877986c89cbadf4d2 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_SolidModel

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_SolidModel> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 6f2e4476d05b7a0ceac696ff7856fd40 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_SolidModel

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_SolidModel> & ent);

};


%extend RWStepShape_RWSolidModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepShape_RWSolidReplica *
***********************************/
class RWStepShape_RWSolidReplica {
	public:
		/****************** RWStepShape_RWSolidReplica ******************/
		/**** md5 signature: 3ddf3f95018931dc27eddfe99df6fd4f ****/
		%feature("compactdefaultargs") RWStepShape_RWSolidReplica;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWSolidReplica;
		 RWStepShape_RWSolidReplica();

		/****************** ReadStep ******************/
		/**** md5 signature: 82c99d04db0d434bcf78358cb56cdc6b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_SolidReplica

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_SolidReplica> & ent);

		/****************** Share ******************/
		/**** md5 signature: 784dd3a405822b8789f9a74ab0ddd806 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_SolidReplica
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_SolidReplica> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4660c98f8e911e78fb4e3c61008158ad ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_SolidReplica

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_SolidReplica> & ent);

};


%extend RWStepShape_RWSolidReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepShape_RWSphere *
*****************************/
class RWStepShape_RWSphere {
	public:
		/****************** RWStepShape_RWSphere ******************/
		/**** md5 signature: c29b532e1a402566c57e7ab906b879a5 ****/
		%feature("compactdefaultargs") RWStepShape_RWSphere;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWSphere;
		 RWStepShape_RWSphere();

		/****************** ReadStep ******************/
		/**** md5 signature: 0e1c2ec5cdadb3f26016fbdacb71140c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_Sphere

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_Sphere> & ent);

		/****************** Share ******************/
		/**** md5 signature: d061963a272c55c808006fa236f8ab15 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_Sphere
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_Sphere> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 0e37578b6a03116cb0d9a1cddccb7b50 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_Sphere

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_Sphere> & ent);

};


%extend RWStepShape_RWSphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepShape_RWSubedge *
******************************/
class RWStepShape_RWSubedge {
	public:
		/****************** RWStepShape_RWSubedge ******************/
		/**** md5 signature: 039d0e05725fdcdc0fb1848d6d3790b8 ****/
		%feature("compactdefaultargs") RWStepShape_RWSubedge;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWSubedge;
		 RWStepShape_RWSubedge();

		/****************** ReadStep ******************/
		/**** md5 signature: d5e87788594acfc22054d30f22106618 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads subedge.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_Subedge

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_Subedge> & ent);

		/****************** Share ******************/
		/**** md5 signature: c728a44f4be1341f8190ea4e92389bbe ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_Subedge
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_Subedge> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 57876c89349bcf5e3a4ee4d7a8e7017f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes subedge.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_Subedge

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_Subedge> & ent);

};


%extend RWStepShape_RWSubedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepShape_RWSubface *
******************************/
class RWStepShape_RWSubface {
	public:
		/****************** RWStepShape_RWSubface ******************/
		/**** md5 signature: 290191504b32e10c70c19acb24309cba ****/
		%feature("compactdefaultargs") RWStepShape_RWSubface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWSubface;
		 RWStepShape_RWSubface();

		/****************** ReadStep ******************/
		/**** md5 signature: 07902627d32f64a53ae6e730956885ff ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads subface.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_Subface

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_Subface> & ent);

		/****************** Share ******************/
		/**** md5 signature: c6eaf6ce753e783cb59cdd5ecdb2c1d3 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepShape_Subface
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_Subface> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 10c8dea604d345c823c3d5a53c168a37 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes subface.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_Subface

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_Subface> & ent);

};


%extend RWStepShape_RWSubface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepShape_RWSweptAreaSolid *
*************************************/
class RWStepShape_RWSweptAreaSolid {
	public:
		/****************** RWStepShape_RWSweptAreaSolid ******************/
		/**** md5 signature: 617e3f18274adb1d5f9c18d92eff2bdc ****/
		%feature("compactdefaultargs") RWStepShape_RWSweptAreaSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWSweptAreaSolid;
		 RWStepShape_RWSweptAreaSolid();

		/****************** ReadStep ******************/
		/**** md5 signature: ae2b31f9eb1ef0060751bdcf5a1854e1 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_SweptAreaSolid

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_SweptAreaSolid> & ent);

		/****************** Share ******************/
		/**** md5 signature: 75130dc8189ae1313e7d78b096f3d6d4 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_SweptAreaSolid
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_SweptAreaSolid> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9dbab545a8365f953bcf83edb050db26 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_SweptAreaSolid

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_SweptAreaSolid> & ent);

};


%extend RWStepShape_RWSweptAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepShape_RWSweptFaceSolid *
*************************************/
class RWStepShape_RWSweptFaceSolid {
	public:
		/****************** RWStepShape_RWSweptFaceSolid ******************/
		/**** md5 signature: ee47ceead5aaf1def00aba04ad1dc31d ****/
		%feature("compactdefaultargs") RWStepShape_RWSweptFaceSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWSweptFaceSolid;
		 RWStepShape_RWSweptFaceSolid();

		/****************** ReadStep ******************/
		/**** md5 signature: e860a6aa7bc634ff46eca44f12669a72 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_SweptFaceSolid

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_SweptFaceSolid> & ent);

		/****************** Share ******************/
		/**** md5 signature: 444655be43f3777051a4a625fdd98b10 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_SweptFaceSolid
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_SweptFaceSolid> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 44a9d2bf27b3d3258a60043015a1c05c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_SweptFaceSolid

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_SweptFaceSolid> & ent);

};


%extend RWStepShape_RWSweptFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepShape_RWToleranceValue *
*************************************/
class RWStepShape_RWToleranceValue {
	public:
		/****************** RWStepShape_RWToleranceValue ******************/
		/**** md5 signature: a145c2650b19231008706d4672dcd6ab ****/
		%feature("compactdefaultargs") RWStepShape_RWToleranceValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWToleranceValue;
		 RWStepShape_RWToleranceValue();

		/****************** ReadStep ******************/
		/**** md5 signature: a699e327f78f9728debdc8357491f5d9 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ToleranceValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ToleranceValue> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5c28ca22d429a1902b15deba8015cd58 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_ToleranceValue
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_ToleranceValue> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 6115eb486fac8547650618417964ed59 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ToleranceValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ToleranceValue> & ent);

};


%extend RWStepShape_RWToleranceValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepShape_RWTopologicalRepresentationItem *
****************************************************/
class RWStepShape_RWTopologicalRepresentationItem {
	public:
		/****************** RWStepShape_RWTopologicalRepresentationItem ******************/
		/**** md5 signature: fb7d0e9d52c8e56a319e866cfd389dad ****/
		%feature("compactdefaultargs") RWStepShape_RWTopologicalRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWTopologicalRepresentationItem;
		 RWStepShape_RWTopologicalRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 4f24da22b5453b21115e830d5fc5abb5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_TopologicalRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_TopologicalRepresentationItem> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: b3a640f3a7db18aa89615defb6eabc33 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_TopologicalRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_TopologicalRepresentationItem> & ent);

};


%extend RWStepShape_RWTopologicalRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWStepShape_RWTorus *
****************************/
class RWStepShape_RWTorus {
	public:
		/****************** RWStepShape_RWTorus ******************/
		/**** md5 signature: 950ba092b0925f373fd46f65c8c11989 ****/
		%feature("compactdefaultargs") RWStepShape_RWTorus;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWTorus;
		 RWStepShape_RWTorus();

		/****************** ReadStep ******************/
		/**** md5 signature: 89d5b19cc07942a9d31ca9e490efa59c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_Torus

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_Torus> & ent);

		/****************** Share ******************/
		/**** md5 signature: 88b273553e068e4e169df2e58b50abc6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_Torus
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_Torus> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ce5e4e6cc8c19c298163d49e908ed145 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_Torus

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_Torus> & ent);

};


%extend RWStepShape_RWTorus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepShape_RWTransitionalShapeRepresentation *
******************************************************/
class RWStepShape_RWTransitionalShapeRepresentation {
	public:
		/****************** RWStepShape_RWTransitionalShapeRepresentation ******************/
		/**** md5 signature: 384fa2a35bcca67e97c6d9a1d3bdaf19 ****/
		%feature("compactdefaultargs") RWStepShape_RWTransitionalShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWTransitionalShapeRepresentation;
		 RWStepShape_RWTransitionalShapeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 210719592ddd06fa3ad20cb75dd6018a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_TransitionalShapeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_TransitionalShapeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1f98dd7b1c213a3da9c5082987478f17 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_TransitionalShapeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_TransitionalShapeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3c656152e9dda62e36d68de5eabdbce4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_TransitionalShapeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_TransitionalShapeRepresentation> & ent);

};


%extend RWStepShape_RWTransitionalShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepShape_RWTypeQualifier *
************************************/
class RWStepShape_RWTypeQualifier {
	public:
		/****************** RWStepShape_RWTypeQualifier ******************/
		/**** md5 signature: b0599bc048af0b2ff05db6f6181cc518 ****/
		%feature("compactdefaultargs") RWStepShape_RWTypeQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWTypeQualifier;
		 RWStepShape_RWTypeQualifier();

		/****************** ReadStep ******************/
		/**** md5 signature: 808e92cd527ea66b593f30f1cb1322e7 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_TypeQualifier

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_TypeQualifier> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 3cf204c62862097dcb98d1a3b6f11d37 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_TypeQualifier

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_TypeQualifier> & ent);

};


%extend RWStepShape_RWTypeQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepShape_RWValueFormatTypeQualifier *
***********************************************/
class RWStepShape_RWValueFormatTypeQualifier {
	public:
		/****************** RWStepShape_RWValueFormatTypeQualifier ******************/
		/**** md5 signature: 7f09d81a2bd342de2ad55f58c51d6a46 ****/
		%feature("compactdefaultargs") RWStepShape_RWValueFormatTypeQualifier;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWValueFormatTypeQualifier;
		 RWStepShape_RWValueFormatTypeQualifier();

		/****************** ReadStep ******************/
		/**** md5 signature: e5b4151a2a5503e0d27d1aafc347cfdc ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads valueformattypequalifier.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_ValueFormatTypeQualifier

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_ValueFormatTypeQualifier> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 7dc59f934a1bb7ad11473159bdd8db93 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes valueformattypequalifier.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_ValueFormatTypeQualifier

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_ValueFormatTypeQualifier> & ent);

};


%extend RWStepShape_RWValueFormatTypeQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepShape_RWVertex *
*****************************/
class RWStepShape_RWVertex {
	public:
		/****************** RWStepShape_RWVertex ******************/
		/**** md5 signature: 2787b0dc81981a1776dcfc8f8f8ec9e3 ****/
		%feature("compactdefaultargs") RWStepShape_RWVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWVertex;
		 RWStepShape_RWVertex();

		/****************** ReadStep ******************/
		/**** md5 signature: d6d5776ba375de35b609d582349769c0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_Vertex

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_Vertex> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 8e4869ba8f62c375a21b2a58a2ba3480 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_Vertex

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_Vertex> & ent);

};


%extend RWStepShape_RWVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepShape_RWVertexLoop *
*********************************/
class RWStepShape_RWVertexLoop {
	public:
		/****************** RWStepShape_RWVertexLoop ******************/
		/**** md5 signature: fd9f521e9648a82e708fc3d797925528 ****/
		%feature("compactdefaultargs") RWStepShape_RWVertexLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWVertexLoop;
		 RWStepShape_RWVertexLoop();

		/****************** ReadStep ******************/
		/**** md5 signature: f619354c65dc926b419de25d5e87c231 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_VertexLoop

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_VertexLoop> & ent);

		/****************** Share ******************/
		/**** md5 signature: cfae0c0f83ce4f6bed6234933048d6de ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_VertexLoop
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_VertexLoop> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b80a3418bdea97fe22757c3de1a2fef0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_VertexLoop

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_VertexLoop> & ent);

};


%extend RWStepShape_RWVertexLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepShape_RWVertexPoint *
**********************************/
class RWStepShape_RWVertexPoint {
	public:
		/****************** RWStepShape_RWVertexPoint ******************/
		/**** md5 signature: c3070332ed8ca22a2174a5e0fa4781bb ****/
		%feature("compactdefaultargs") RWStepShape_RWVertexPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWVertexPoint;
		 RWStepShape_RWVertexPoint();

		/****************** ReadStep ******************/
		/**** md5 signature: a7ab696a66be61306167231048d4bbb8 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepShape_VertexPoint

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepShape_VertexPoint> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1b452897fee99f225d79b513d8da2b05 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepShape_VertexPoint
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepShape_VertexPoint> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: af14378527b23624be6afe2b61f89909 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepShape_VertexPoint

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepShape_VertexPoint> & ent);

};


%extend RWStepShape_RWVertexPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
