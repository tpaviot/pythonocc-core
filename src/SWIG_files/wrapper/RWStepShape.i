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
		%feature("compactdefaultargs") RWStepShape_RWAdvancedBrepShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWAdvancedBrepShapeRepresentation;
		 RWStepShape_RWAdvancedBrepShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWAdvancedFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWAdvancedFace;
		 RWStepShape_RWAdvancedFace();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWAngularLocation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWAngularLocation;
		 RWStepShape_RWAngularLocation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWAngularSize;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWAngularSize;
		 RWStepShape_RWAngularSize();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWBlock;
		 RWStepShape_RWBlock();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWBooleanResult;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWBooleanResult;
		 RWStepShape_RWBooleanResult();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWBoxDomain;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWBoxDomain;
		 RWStepShape_RWBoxDomain();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWBoxedHalfSpace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWBoxedHalfSpace;
		 RWStepShape_RWBoxedHalfSpace();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWBrepWithVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWBrepWithVoids;
		 RWStepShape_RWBrepWithVoids();

		/****************** Check ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWClosedShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWClosedShell;
		 RWStepShape_RWClosedShell();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWCompoundShapeRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWCompoundShapeRepresentation;
		 RWStepShape_RWCompoundShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWConnectedEdgeSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWConnectedEdgeSet;
		 RWStepShape_RWConnectedEdgeSet();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWConnectedFaceSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWConnectedFaceSet;
		 RWStepShape_RWConnectedFaceSet();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWConnectedFaceShapeRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWConnectedFaceShapeRepresentation;
		 RWStepShape_RWConnectedFaceShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWConnectedFaceSubSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWConnectedFaceSubSet;
		 RWStepShape_RWConnectedFaceSubSet();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWContextDependentShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWContextDependentShapeRepresentation;
		 RWStepShape_RWContextDependentShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWCsgShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWCsgShapeRepresentation;
		 RWStepShape_RWCsgShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWCsgSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWCsgSolid;
		 RWStepShape_RWCsgSolid();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation;
		 RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWDimensionalCharacteristicRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWDimensionalCharacteristicRepresentation;
		 RWStepShape_RWDimensionalCharacteristicRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWDimensionalLocation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWDimensionalLocation;
		 RWStepShape_RWDimensionalLocation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWDimensionalLocationWithPath;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWDimensionalLocationWithPath;
		 RWStepShape_RWDimensionalLocationWithPath();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWDimensionalSize;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWDimensionalSize;
		 RWStepShape_RWDimensionalSize();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWDimensionalSizeWithPath;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWDimensionalSizeWithPath;
		 RWStepShape_RWDimensionalSizeWithPath();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWEdge;
		 RWStepShape_RWEdge();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWEdgeBasedWireframeModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWEdgeBasedWireframeModel;
		 RWStepShape_RWEdgeBasedWireframeModel();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWEdgeBasedWireframeShapeRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWEdgeBasedWireframeShapeRepresentation;
		 RWStepShape_RWEdgeBasedWireframeShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWEdgeCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWEdgeCurve;
		 RWStepShape_RWEdgeCurve();

		/****************** Check ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWEdgeLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWEdgeLoop;
		 RWStepShape_RWEdgeLoop();

		/****************** Check ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWExtrudedAreaSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWExtrudedAreaSolid;
		 RWStepShape_RWExtrudedAreaSolid();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWExtrudedFaceSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWExtrudedFaceSolid;
		 RWStepShape_RWExtrudedFaceSolid();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFace;
		 RWStepShape_RWFace();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWFaceBasedSurfaceModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWFaceBasedSurfaceModel;
		 RWStepShape_RWFaceBasedSurfaceModel();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWFaceBound;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFaceBound;
		 RWStepShape_RWFaceBound();

		/****************** Check ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWFaceOuterBound;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFaceOuterBound;
		 RWStepShape_RWFaceOuterBound();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWFaceSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFaceSurface;
		 RWStepShape_RWFaceSurface();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWFacetedBrep;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFacetedBrep;
		 RWStepShape_RWFacetedBrep();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWFacetedBrepAndBrepWithVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFacetedBrepAndBrepWithVoids;
		 RWStepShape_RWFacetedBrepAndBrepWithVoids();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWFacetedBrepShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWFacetedBrepShapeRepresentation;
		 RWStepShape_RWFacetedBrepShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWGeometricCurveSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWGeometricCurveSet;
		 RWStepShape_RWGeometricCurveSet();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWGeometricSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWGeometricSet;
		 RWStepShape_RWGeometricSet();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation;
		 RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation;
		 RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWHalfSpaceSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWHalfSpaceSolid;
		 RWStepShape_RWHalfSpaceSolid();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWLimitsAndFits;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWLimitsAndFits;
		 RWStepShape_RWLimitsAndFits();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWLoop;
		 RWStepShape_RWLoop();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWLoopAndPath;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWLoopAndPath;
		 RWStepShape_RWLoopAndPath();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWManifoldSolidBrep;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWManifoldSolidBrep;
		 RWStepShape_RWManifoldSolidBrep();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWManifoldSurfaceShapeRepresentation;
		 RWStepShape_RWManifoldSurfaceShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWMeasureQualification;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWMeasureQualification;
		 RWStepShape_RWMeasureQualification();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem;
		 RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWNonManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWNonManifoldSurfaceShapeRepresentation;
		 RWStepShape_RWNonManifoldSurfaceShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWOpenShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOpenShell;
		 RWStepShape_RWOpenShell();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWOrientedClosedShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOrientedClosedShell;
		 RWStepShape_RWOrientedClosedShell();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWOrientedEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOrientedEdge;
		 RWStepShape_RWOrientedEdge();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWOrientedFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOrientedFace;
		 RWStepShape_RWOrientedFace();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWOrientedOpenShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOrientedOpenShell;
		 RWStepShape_RWOrientedOpenShell();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWOrientedPath;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWOrientedPath;
		 RWStepShape_RWOrientedPath();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWPath;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWPath;
		 RWStepShape_RWPath();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWPlusMinusTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWPlusMinusTolerance;
		 RWStepShape_RWPlusMinusTolerance();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWPointRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWPointRepresentation;
		 RWStepShape_RWPointRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWPolyLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWPolyLoop;
		 RWStepShape_RWPolyLoop();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWPrecisionQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWPrecisionQualifier;
		 RWStepShape_RWPrecisionQualifier();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWQualifiedRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWQualifiedRepresentationItem;
		 RWStepShape_RWQualifiedRepresentationItem();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWRevolvedAreaSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWRevolvedAreaSolid;
		 RWStepShape_RWRevolvedAreaSolid();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWRevolvedFaceSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWRevolvedFaceSolid;
		 RWStepShape_RWRevolvedFaceSolid();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWRightAngularWedge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWRightAngularWedge;
		 RWStepShape_RWRightAngularWedge();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWRightCircularCone;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWRightCircularCone;
		 RWStepShape_RWRightCircularCone();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWRightCircularCylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWRightCircularCylinder;
		 RWStepShape_RWRightCircularCylinder();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWSeamEdge;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWSeamEdge;
		 RWStepShape_RWSeamEdge();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWShapeDefinitionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWShapeDefinitionRepresentation;
		 RWStepShape_RWShapeDefinitionRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWShapeDimensionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWShapeDimensionRepresentation;
		 RWStepShape_RWShapeDimensionRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWShapeRepresentation;
		 RWStepShape_RWShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWShapeRepresentationWithParameters;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWShapeRepresentationWithParameters;
		 RWStepShape_RWShapeRepresentationWithParameters();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWShellBasedSurfaceModel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWShellBasedSurfaceModel;
		 RWStepShape_RWShellBasedSurfaceModel();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWSolidModel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWSolidModel;
		 RWStepShape_RWSolidModel();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWSolidReplica;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWSolidReplica;
		 RWStepShape_RWSolidReplica();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWSphere;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWSphere;
		 RWStepShape_RWSphere();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWSubedge;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWSubedge;
		 RWStepShape_RWSubedge();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWSubface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWSubface;
		 RWStepShape_RWSubface();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWSweptAreaSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWSweptAreaSolid;
		 RWStepShape_RWSweptAreaSolid();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWSweptFaceSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWSweptFaceSolid;
		 RWStepShape_RWSweptFaceSolid();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWToleranceValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWToleranceValue;
		 RWStepShape_RWToleranceValue();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWTopologicalRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWTopologicalRepresentationItem;
		 RWStepShape_RWTopologicalRepresentationItem();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWTorus;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWTorus;
		 RWStepShape_RWTorus();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWTransitionalShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWTransitionalShapeRepresentation;
		 RWStepShape_RWTransitionalShapeRepresentation();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWTypeQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWTypeQualifier;
		 RWStepShape_RWTypeQualifier();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWValueFormatTypeQualifier;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepShape_RWValueFormatTypeQualifier;
		 RWStepShape_RWValueFormatTypeQualifier();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWVertex;
		 RWStepShape_RWVertex();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWVertexLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWVertexLoop;
		 RWStepShape_RWVertexLoop();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepShape_RWVertexPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepShape_RWVertexPoint;
		 RWStepShape_RWVertexPoint();

		/****************** ReadStep ******************/
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
