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
%define RWSTEPREPRDOCSTRING
"RWStepRepr module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwsteprepr.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPREPRDOCSTRING) RWStepRepr


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
#include<RWStepRepr_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepRepr_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<Interface_module.hxx>
#include<StepBasic_module.hxx>
#include<StepData_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<StepGeom_module.hxx>
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
%import StepRepr.i

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

/******************************************
* class RWStepRepr_RWAllAroundShapeAspect *
******************************************/
class RWStepRepr_RWAllAroundShapeAspect {
	public:
		/****************** RWStepRepr_RWAllAroundShapeAspect ******************/
		%feature("compactdefaultargs") RWStepRepr_RWAllAroundShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWAllAroundShapeAspect;
		 RWStepRepr_RWAllAroundShapeAspect();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads allaroundshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_AllAroundShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_AllAroundShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes allaroundshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_AllAroundShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent);

};


%extend RWStepRepr_RWAllAroundShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class RWStepRepr_RWApex *
**************************/
class RWStepRepr_RWApex {
	public:
		/****************** RWStepRepr_RWApex ******************/
		%feature("compactdefaultargs") RWStepRepr_RWApex;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWApex;
		 RWStepRepr_RWApex();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads apex.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_Apex

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_Apex> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_Apex
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_Apex> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes apex.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_Apex

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_Apex> & ent);

};


%extend RWStepRepr_RWApex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepRepr_RWAssemblyComponentUsage *
********************************************/
class RWStepRepr_RWAssemblyComponentUsage {
	public:
		/****************** RWStepRepr_RWAssemblyComponentUsage ******************/
		%feature("compactdefaultargs") RWStepRepr_RWAssemblyComponentUsage;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWAssemblyComponentUsage;
		 RWStepRepr_RWAssemblyComponentUsage();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads assemblycomponentusage.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_AssemblyComponentUsage

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_AssemblyComponentUsage
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes assemblycomponentusage.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_AssemblyComponentUsage

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent);

};


%extend RWStepRepr_RWAssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepRepr_RWAssemblyComponentUsageSubstitute *
******************************************************/
class RWStepRepr_RWAssemblyComponentUsageSubstitute {
	public:
		/****************** RWStepRepr_RWAssemblyComponentUsageSubstitute ******************/
		%feature("compactdefaultargs") RWStepRepr_RWAssemblyComponentUsageSubstitute;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWAssemblyComponentUsageSubstitute;
		 RWStepRepr_RWAssemblyComponentUsageSubstitute();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_AssemblyComponentUsageSubstitute

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_AssemblyComponentUsageSubstitute
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_AssemblyComponentUsageSubstitute

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent);

};


%extend RWStepRepr_RWAssemblyComponentUsageSubstitute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepRepr_RWBetweenShapeAspect *
****************************************/
class RWStepRepr_RWBetweenShapeAspect {
	public:
		/****************** RWStepRepr_RWBetweenShapeAspect ******************/
		%feature("compactdefaultargs") RWStepRepr_RWBetweenShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWBetweenShapeAspect;
		 RWStepRepr_RWBetweenShapeAspect();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads betweenshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_BetweenShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_BetweenShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_BetweenShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_BetweenShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes betweenshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_BetweenShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_BetweenShapeAspect> & ent);

};


%extend RWStepRepr_RWBetweenShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepRepr_RWCentreOfSymmetry *
**************************************/
class RWStepRepr_RWCentreOfSymmetry {
	public:
		/****************** RWStepRepr_RWCentreOfSymmetry ******************/
		%feature("compactdefaultargs") RWStepRepr_RWCentreOfSymmetry;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWCentreOfSymmetry;
		 RWStepRepr_RWCentreOfSymmetry();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads centreofsymmetry.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CentreOfSymmetry

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CentreOfSymmetry> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_CentreOfSymmetry
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CentreOfSymmetry> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes centreofsymmetry.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CentreOfSymmetry

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CentreOfSymmetry> & ent);

};


%extend RWStepRepr_RWCentreOfSymmetry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepRepr_RWCharacterizedRepresentation *
*************************************************/
class RWStepRepr_RWCharacterizedRepresentation {
	public:
		/****************** RWStepRepr_RWCharacterizedRepresentation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWCharacterizedRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWCharacterizedRepresentation;
		 RWStepRepr_RWCharacterizedRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CharacterizedRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_CharacterizedRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CharacterizedRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent);

};


%extend RWStepRepr_RWCharacterizedRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp *
********************************************************************/
class RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp {
	public:
		/****************** RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp ******************/
		%feature("compactdefaultargs") RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
		 RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent);

};


%extend RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepRepr_RWCompShAspAndDatumFeatAndShAsp *
***************************************************/
class RWStepRepr_RWCompShAspAndDatumFeatAndShAsp {
	public:
		/****************** RWStepRepr_RWCompShAspAndDatumFeatAndShAsp ******************/
		%feature("compactdefaultargs") RWStepRepr_RWCompShAspAndDatumFeatAndShAsp;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWCompShAspAndDatumFeatAndShAsp;
		 RWStepRepr_RWCompShAspAndDatumFeatAndShAsp();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CompShAspAndDatumFeatAndShAsp

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_CompShAspAndDatumFeatAndShAsp
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CompShAspAndDatumFeatAndShAsp

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent);

};


%extend RWStepRepr_RWCompShAspAndDatumFeatAndShAsp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepRepr_RWCompositeGroupShapeAspect *
***********************************************/
class RWStepRepr_RWCompositeGroupShapeAspect {
	public:
		/****************** RWStepRepr_RWCompositeGroupShapeAspect ******************/
		%feature("compactdefaultargs") RWStepRepr_RWCompositeGroupShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWCompositeGroupShapeAspect;
		 RWStepRepr_RWCompositeGroupShapeAspect();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads compositegroupshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CompositeGroupShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_CompositeGroupShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes compositegroupshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CompositeGroupShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent);

};


%extend RWStepRepr_RWCompositeGroupShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepRepr_RWCompositeShapeAspect *
******************************************/
class RWStepRepr_RWCompositeShapeAspect {
	public:
		/****************** RWStepRepr_RWCompositeShapeAspect ******************/
		%feature("compactdefaultargs") RWStepRepr_RWCompositeShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWCompositeShapeAspect;
		 RWStepRepr_RWCompositeShapeAspect();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads compositeshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CompositeShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CompositeShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_CompositeShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CompositeShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes compositeshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CompositeShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CompositeShapeAspect> & ent);

};


%extend RWStepRepr_RWCompositeShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepRepr_RWCompoundRepresentationItem *
************************************************/
class RWStepRepr_RWCompoundRepresentationItem {
	public:
		/****************** RWStepRepr_RWCompoundRepresentationItem ******************/
		%feature("compactdefaultargs") RWStepRepr_RWCompoundRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWCompoundRepresentationItem;
		 RWStepRepr_RWCompoundRepresentationItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CompoundRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_CompoundRepresentationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CompoundRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent);

};


%extend RWStepRepr_RWCompoundRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepRepr_RWConfigurationDesign *
*****************************************/
class RWStepRepr_RWConfigurationDesign {
	public:
		/****************** RWStepRepr_RWConfigurationDesign ******************/
		%feature("compactdefaultargs") RWStepRepr_RWConfigurationDesign;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWConfigurationDesign;
		 RWStepRepr_RWConfigurationDesign();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads configurationdesign.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ConfigurationDesign

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ConfigurationDesign> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ConfigurationDesign
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ConfigurationDesign> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes configurationdesign.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ConfigurationDesign

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ConfigurationDesign> & ent);

};


%extend RWStepRepr_RWConfigurationDesign {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepRepr_RWConfigurationEffectivity *
**********************************************/
class RWStepRepr_RWConfigurationEffectivity {
	public:
		/****************** RWStepRepr_RWConfigurationEffectivity ******************/
		%feature("compactdefaultargs") RWStepRepr_RWConfigurationEffectivity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWConfigurationEffectivity;
		 RWStepRepr_RWConfigurationEffectivity();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads configurationeffectivity.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ConfigurationEffectivity

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ConfigurationEffectivity
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes configurationeffectivity.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ConfigurationEffectivity

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent);

};


%extend RWStepRepr_RWConfigurationEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepRepr_RWConfigurationItem *
***************************************/
class RWStepRepr_RWConfigurationItem {
	public:
		/****************** RWStepRepr_RWConfigurationItem ******************/
		%feature("compactdefaultargs") RWStepRepr_RWConfigurationItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWConfigurationItem;
		 RWStepRepr_RWConfigurationItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads configurationitem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ConfigurationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ConfigurationItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ConfigurationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ConfigurationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes configurationitem.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ConfigurationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ConfigurationItem> & ent);

};


%extend RWStepRepr_RWConfigurationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class RWStepRepr_RWConstructiveGeometryRepresentation *
********************************************************/
class RWStepRepr_RWConstructiveGeometryRepresentation {
	public:
		/****************** RWStepRepr_RWConstructiveGeometryRepresentation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWConstructiveGeometryRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWConstructiveGeometryRepresentation;
		 RWStepRepr_RWConstructiveGeometryRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ConstructiveGeometryRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_ConstructiveGeometryRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ConstructiveGeometryRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent);

};


%extend RWStepRepr_RWConstructiveGeometryRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class RWStepRepr_RWConstructiveGeometryRepresentationRelationship *
********************************************************************/
class RWStepRepr_RWConstructiveGeometryRepresentationRelationship {
	public:
		/****************** RWStepRepr_RWConstructiveGeometryRepresentationRelationship ******************/
		%feature("compactdefaultargs") RWStepRepr_RWConstructiveGeometryRepresentationRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWConstructiveGeometryRepresentationRelationship;
		 RWStepRepr_RWConstructiveGeometryRepresentationRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ConstructiveGeometryRepresentationRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_ConstructiveGeometryRepresentationRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ConstructiveGeometryRepresentationRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent);

};


%extend RWStepRepr_RWConstructiveGeometryRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepRepr_RWContinuosShapeAspect *
******************************************/
class RWStepRepr_RWContinuosShapeAspect {
	public:
		/****************** RWStepRepr_RWContinuosShapeAspect ******************/
		%feature("compactdefaultargs") RWStepRepr_RWContinuosShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWContinuosShapeAspect;
		 RWStepRepr_RWContinuosShapeAspect();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads continuosshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ContinuosShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ContinuosShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes continuosshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ContinuosShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent);

};


%extend RWStepRepr_RWContinuosShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepRepr_RWDataEnvironment *
*************************************/
class RWStepRepr_RWDataEnvironment {
	public:
		/****************** RWStepRepr_RWDataEnvironment ******************/
		%feature("compactdefaultargs") RWStepRepr_RWDataEnvironment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWDataEnvironment;
		 RWStepRepr_RWDataEnvironment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads dataenvironment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_DataEnvironment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_DataEnvironment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_DataEnvironment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_DataEnvironment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes dataenvironment.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_DataEnvironment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_DataEnvironment> & ent);

};


%extend RWStepRepr_RWDataEnvironment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepRepr_RWDefinitionalRepresentation *
************************************************/
class RWStepRepr_RWDefinitionalRepresentation {
	public:
		/****************** RWStepRepr_RWDefinitionalRepresentation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWDefinitionalRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWDefinitionalRepresentation;
		 RWStepRepr_RWDefinitionalRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_DefinitionalRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_DefinitionalRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_DefinitionalRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent);

};


%extend RWStepRepr_RWDefinitionalRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepRepr_RWDerivedShapeAspect *
****************************************/
class RWStepRepr_RWDerivedShapeAspect {
	public:
		/****************** RWStepRepr_RWDerivedShapeAspect ******************/
		%feature("compactdefaultargs") RWStepRepr_RWDerivedShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWDerivedShapeAspect;
		 RWStepRepr_RWDerivedShapeAspect();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads derivedshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_DerivedShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_DerivedShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_DerivedShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_DerivedShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes derivedshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_DerivedShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_DerivedShapeAspect> & ent);

};


%extend RWStepRepr_RWDerivedShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepRepr_RWDescriptiveRepresentationItem *
***************************************************/
class RWStepRepr_RWDescriptiveRepresentationItem {
	public:
		/****************** RWStepRepr_RWDescriptiveRepresentationItem ******************/
		%feature("compactdefaultargs") RWStepRepr_RWDescriptiveRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWDescriptiveRepresentationItem;
		 RWStepRepr_RWDescriptiveRepresentationItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_DescriptiveRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_DescriptiveRepresentationItem> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_DescriptiveRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_DescriptiveRepresentationItem> & ent);

};


%extend RWStepRepr_RWDescriptiveRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepRepr_RWExtension *
*******************************/
class RWStepRepr_RWExtension {
	public:
		/****************** RWStepRepr_RWExtension ******************/
		%feature("compactdefaultargs") RWStepRepr_RWExtension;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWExtension;
		 RWStepRepr_RWExtension();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads extension.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_Extension

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_Extension> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_Extension
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_Extension> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes extension.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_Extension

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_Extension> & ent);

};


%extend RWStepRepr_RWExtension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepRepr_RWFeatureForDatumTargetRelationship *
*******************************************************/
class RWStepRepr_RWFeatureForDatumTargetRelationship {
	public:
		/****************** RWStepRepr_RWFeatureForDatumTargetRelationship ******************/
		%feature("compactdefaultargs") RWStepRepr_RWFeatureForDatumTargetRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWFeatureForDatumTargetRelationship;
		 RWStepRepr_RWFeatureForDatumTargetRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shapeaspectrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_FeatureForDatumTargetRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_FeatureForDatumTargetRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shapeaspectrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_FeatureForDatumTargetRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent);

};


%extend RWStepRepr_RWFeatureForDatumTargetRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepRepr_RWFunctionallyDefinedTransformation *
*******************************************************/
class RWStepRepr_RWFunctionallyDefinedTransformation {
	public:
		/****************** RWStepRepr_RWFunctionallyDefinedTransformation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWFunctionallyDefinedTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWFunctionallyDefinedTransformation;
		 RWStepRepr_RWFunctionallyDefinedTransformation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_FunctionallyDefinedTransformation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_FunctionallyDefinedTransformation> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_FunctionallyDefinedTransformation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_FunctionallyDefinedTransformation> & ent);

};


%extend RWStepRepr_RWFunctionallyDefinedTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepRepr_RWGeometricAlignment *
****************************************/
class RWStepRepr_RWGeometricAlignment {
	public:
		/****************** RWStepRepr_RWGeometricAlignment ******************/
		%feature("compactdefaultargs") RWStepRepr_RWGeometricAlignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWGeometricAlignment;
		 RWStepRepr_RWGeometricAlignment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometricalignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_GeometricAlignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_GeometricAlignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_GeometricAlignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_GeometricAlignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometricalignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_GeometricAlignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_GeometricAlignment> & ent);

};


%extend RWStepRepr_RWGeometricAlignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepRepr_RWGlobalUncertaintyAssignedContext *
******************************************************/
class RWStepRepr_RWGlobalUncertaintyAssignedContext {
	public:
		/****************** RWStepRepr_RWGlobalUncertaintyAssignedContext ******************/
		%feature("compactdefaultargs") RWStepRepr_RWGlobalUncertaintyAssignedContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWGlobalUncertaintyAssignedContext;
		 RWStepRepr_RWGlobalUncertaintyAssignedContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_GlobalUncertaintyAssignedContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_GlobalUncertaintyAssignedContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_GlobalUncertaintyAssignedContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent);

};


%extend RWStepRepr_RWGlobalUncertaintyAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepRepr_RWGlobalUnitAssignedContext *
***********************************************/
class RWStepRepr_RWGlobalUnitAssignedContext {
	public:
		/****************** RWStepRepr_RWGlobalUnitAssignedContext ******************/
		%feature("compactdefaultargs") RWStepRepr_RWGlobalUnitAssignedContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWGlobalUnitAssignedContext;
		 RWStepRepr_RWGlobalUnitAssignedContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_GlobalUnitAssignedContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_GlobalUnitAssignedContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_GlobalUnitAssignedContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent);

};


%extend RWStepRepr_RWGlobalUnitAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepRepr_RWIntegerRepresentationItem *
***********************************************/
class RWStepRepr_RWIntegerRepresentationItem {
	public:
		/****************** RWStepRepr_RWIntegerRepresentationItem ******************/
		%feature("compactdefaultargs") RWStepRepr_RWIntegerRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWIntegerRepresentationItem;
		 RWStepRepr_RWIntegerRepresentationItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_IntegerRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_IntegerRepresentationItem> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_IntegerRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_IntegerRepresentationItem> & ent);

};


%extend RWStepRepr_RWIntegerRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepRepr_RWItemDefinedTransformation *
***********************************************/
class RWStepRepr_RWItemDefinedTransformation {
	public:
		/****************** RWStepRepr_RWItemDefinedTransformation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWItemDefinedTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWItemDefinedTransformation;
		 RWStepRepr_RWItemDefinedTransformation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ItemDefinedTransformation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_ItemDefinedTransformation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ItemDefinedTransformation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent);

};


%extend RWStepRepr_RWItemDefinedTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepRepr_RWMakeFromUsageOption *
*****************************************/
class RWStepRepr_RWMakeFromUsageOption {
	public:
		/****************** RWStepRepr_RWMakeFromUsageOption ******************/
		%feature("compactdefaultargs") RWStepRepr_RWMakeFromUsageOption;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWMakeFromUsageOption;
		 RWStepRepr_RWMakeFromUsageOption();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads makefromusageoption.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MakeFromUsageOption

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MakeFromUsageOption> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_MakeFromUsageOption
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MakeFromUsageOption> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes makefromusageoption.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MakeFromUsageOption

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MakeFromUsageOption> & ent);

};


%extend RWStepRepr_RWMakeFromUsageOption {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStepRepr_RWMappedItem *
********************************/
class RWStepRepr_RWMappedItem {
	public:
		/****************** RWStepRepr_RWMappedItem ******************/
		%feature("compactdefaultargs") RWStepRepr_RWMappedItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWMappedItem;
		 RWStepRepr_RWMappedItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MappedItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MappedItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_MappedItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MappedItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MappedItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MappedItem> & ent);

};


%extend RWStepRepr_RWMappedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepRepr_RWMaterialDesignation *
*****************************************/
class RWStepRepr_RWMaterialDesignation {
	public:
		/****************** RWStepRepr_RWMaterialDesignation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWMaterialDesignation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWMaterialDesignation;
		 RWStepRepr_RWMaterialDesignation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MaterialDesignation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MaterialDesignation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_MaterialDesignation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MaterialDesignation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MaterialDesignation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MaterialDesignation> & ent);

};


%extend RWStepRepr_RWMaterialDesignation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepRepr_RWMaterialProperty *
**************************************/
class RWStepRepr_RWMaterialProperty {
	public:
		/****************** RWStepRepr_RWMaterialProperty ******************/
		%feature("compactdefaultargs") RWStepRepr_RWMaterialProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWMaterialProperty;
		 RWStepRepr_RWMaterialProperty();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads materialproperty.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MaterialProperty

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MaterialProperty> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_MaterialProperty
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MaterialProperty> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes materialproperty.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MaterialProperty

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MaterialProperty> & ent);

};


%extend RWStepRepr_RWMaterialProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepRepr_RWMaterialPropertyRepresentation *
****************************************************/
class RWStepRepr_RWMaterialPropertyRepresentation {
	public:
		/****************** RWStepRepr_RWMaterialPropertyRepresentation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWMaterialPropertyRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWMaterialPropertyRepresentation;
		 RWStepRepr_RWMaterialPropertyRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads materialpropertyrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MaterialPropertyRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_MaterialPropertyRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes materialpropertyrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MaterialPropertyRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent);

};


%extend RWStepRepr_RWMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepRepr_RWMeasureRepresentationItem *
***********************************************/
class RWStepRepr_RWMeasureRepresentationItem {
	public:
		/****************** RWStepRepr_RWMeasureRepresentationItem ******************/
		%feature("compactdefaultargs") RWStepRepr_RWMeasureRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWMeasureRepresentationItem;
		 RWStepRepr_RWMeasureRepresentationItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MeasureRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_MeasureRepresentationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MeasureRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent);

};


%extend RWStepRepr_RWMeasureRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepRepr_RWParallelOffset *
************************************/
class RWStepRepr_RWParallelOffset {
	public:
		/****************** RWStepRepr_RWParallelOffset ******************/
		%feature("compactdefaultargs") RWStepRepr_RWParallelOffset;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWParallelOffset;
		 RWStepRepr_RWParallelOffset();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads paralleloffset.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ParallelOffset

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ParallelOffset> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ParallelOffset
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ParallelOffset> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes paralleloffset.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ParallelOffset

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ParallelOffset> & ent);

};


%extend RWStepRepr_RWParallelOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepRepr_RWParametricRepresentationContext *
*****************************************************/
class RWStepRepr_RWParametricRepresentationContext {
	public:
		/****************** RWStepRepr_RWParametricRepresentationContext ******************/
		%feature("compactdefaultargs") RWStepRepr_RWParametricRepresentationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWParametricRepresentationContext;
		 RWStepRepr_RWParametricRepresentationContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ParametricRepresentationContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ParametricRepresentationContext> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ParametricRepresentationContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ParametricRepresentationContext> & ent);

};


%extend RWStepRepr_RWParametricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepRepr_RWPerpendicularTo *
*************************************/
class RWStepRepr_RWPerpendicularTo {
	public:
		/****************** RWStepRepr_RWPerpendicularTo ******************/
		%feature("compactdefaultargs") RWStepRepr_RWPerpendicularTo;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWPerpendicularTo;
		 RWStepRepr_RWPerpendicularTo();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads perpendicularto.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_PerpendicularTo

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_PerpendicularTo> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_PerpendicularTo
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_PerpendicularTo> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes perpendicularto.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_PerpendicularTo

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_PerpendicularTo> & ent);

};


%extend RWStepRepr_RWPerpendicularTo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepRepr_RWProductConcept *
************************************/
class RWStepRepr_RWProductConcept {
	public:
		/****************** RWStepRepr_RWProductConcept ******************/
		%feature("compactdefaultargs") RWStepRepr_RWProductConcept;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWProductConcept;
		 RWStepRepr_RWProductConcept();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads productconcept.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ProductConcept

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ProductConcept> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ProductConcept
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ProductConcept> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes productconcept.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ProductConcept

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ProductConcept> & ent);

};


%extend RWStepRepr_RWProductConcept {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepRepr_RWProductDefinitionShape *
********************************************/
class RWStepRepr_RWProductDefinitionShape {
	public:
		/****************** RWStepRepr_RWProductDefinitionShape ******************/
		%feature("compactdefaultargs") RWStepRepr_RWProductDefinitionShape;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWProductDefinitionShape;
		 RWStepRepr_RWProductDefinitionShape();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads productdefinitionshape.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ProductDefinitionShape

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ProductDefinitionShape> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ProductDefinitionShape
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ProductDefinitionShape> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes productdefinitionshape.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ProductDefinitionShape

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ProductDefinitionShape> & ent);

};


%extend RWStepRepr_RWProductDefinitionShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepRepr_RWPropertyDefinition *
****************************************/
class RWStepRepr_RWPropertyDefinition {
	public:
		/****************** RWStepRepr_RWPropertyDefinition ******************/
		%feature("compactdefaultargs") RWStepRepr_RWPropertyDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWPropertyDefinition;
		 RWStepRepr_RWPropertyDefinition();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads propertydefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_PropertyDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_PropertyDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_PropertyDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_PropertyDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes propertydefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_PropertyDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_PropertyDefinition> & ent);

};


%extend RWStepRepr_RWPropertyDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepRepr_RWPropertyDefinitionRelationship *
****************************************************/
class RWStepRepr_RWPropertyDefinitionRelationship {
	public:
		/****************** RWStepRepr_RWPropertyDefinitionRelationship ******************/
		%feature("compactdefaultargs") RWStepRepr_RWPropertyDefinitionRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWPropertyDefinitionRelationship;
		 RWStepRepr_RWPropertyDefinitionRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads propertydefinitionrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_PropertyDefinitionRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_PropertyDefinitionRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes propertydefinitionrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_PropertyDefinitionRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent);

};


%extend RWStepRepr_RWPropertyDefinitionRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepRepr_RWPropertyDefinitionRepresentation *
******************************************************/
class RWStepRepr_RWPropertyDefinitionRepresentation {
	public:
		/****************** RWStepRepr_RWPropertyDefinitionRepresentation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWPropertyDefinitionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWPropertyDefinitionRepresentation;
		 RWStepRepr_RWPropertyDefinitionRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads propertydefinitionrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_PropertyDefinitionRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_PropertyDefinitionRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes propertydefinitionrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_PropertyDefinitionRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent);

};


%extend RWStepRepr_RWPropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepRepr_RWQuantifiedAssemblyComponentUsage *
******************************************************/
class RWStepRepr_RWQuantifiedAssemblyComponentUsage {
	public:
		/****************** RWStepRepr_RWQuantifiedAssemblyComponentUsage ******************/
		%feature("compactdefaultargs") RWStepRepr_RWQuantifiedAssemblyComponentUsage;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWQuantifiedAssemblyComponentUsage;
		 RWStepRepr_RWQuantifiedAssemblyComponentUsage();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads quantifiedassemblycomponentusage.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_QuantifiedAssemblyComponentUsage

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_QuantifiedAssemblyComponentUsage
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes quantifiedassemblycomponentusage.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_QuantifiedAssemblyComponentUsage

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent);

};


%extend RWStepRepr_RWQuantifiedAssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepRepr_RWReprItemAndLengthMeasureWithUnit *
******************************************************/
class RWStepRepr_RWReprItemAndLengthMeasureWithUnit {
	public:
		/****************** RWStepRepr_RWReprItemAndLengthMeasureWithUnit ******************/
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndLengthMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWReprItemAndLengthMeasureWithUnit;
		 RWStepRepr_RWReprItemAndLengthMeasureWithUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ReprItemAndLengthMeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ReprItemAndLengthMeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnit> & ent);

};


%extend RWStepRepr_RWReprItemAndLengthMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI *
************************************************************/
class RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI {
	public:
		/****************** RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI ******************/
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI;
		 RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI> & ent);

};


%extend RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit *
**********************************************************/
class RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit {
	public:
		/****************** RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit ******************/
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit;
		 RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit> & ent);

};


%extend RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI *
****************************************************************/
class RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI {
	public:
		/****************** RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI ******************/
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		 RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI> & ent);

};


%extend RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepRepr_RWRepresentation *
************************************/
class RWStepRepr_RWRepresentation {
	public:
		/****************** RWStepRepr_RWRepresentation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentation;
		 RWStepRepr_RWRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_Representation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_Representation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_Representation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_Representation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_Representation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_Representation> & ent);

};


%extend RWStepRepr_RWRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepRepr_RWRepresentationContext *
*******************************************/
class RWStepRepr_RWRepresentationContext {
	public:
		/****************** RWStepRepr_RWRepresentationContext ******************/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentationContext;
		 RWStepRepr_RWRepresentationContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_RepresentationContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_RepresentationContext> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_RepresentationContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_RepresentationContext> & ent);

};


%extend RWStepRepr_RWRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepRepr_RWRepresentationItem *
****************************************/
class RWStepRepr_RWRepresentationItem {
	public:
		/****************** RWStepRepr_RWRepresentationItem ******************/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentationItem;
		 RWStepRepr_RWRepresentationItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_RepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_RepresentationItem> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_RepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_RepresentationItem> & ent);

};


%extend RWStepRepr_RWRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepRepr_RWRepresentationMap *
***************************************/
class RWStepRepr_RWRepresentationMap {
	public:
		/****************** RWStepRepr_RWRepresentationMap ******************/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationMap;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentationMap;
		 RWStepRepr_RWRepresentationMap();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_RepresentationMap

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_RepresentationMap> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_RepresentationMap
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_RepresentationMap> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_RepresentationMap

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_RepresentationMap> & ent);

};


%extend RWStepRepr_RWRepresentationMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepRepr_RWRepresentationRelationship *
************************************************/
class RWStepRepr_RWRepresentationRelationship {
	public:
		/****************** RWStepRepr_RWRepresentationRelationship ******************/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentationRelationship;
		 RWStepRepr_RWRepresentationRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_RepresentationRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_RepresentationRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_RepresentationRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_RepresentationRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_RepresentationRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_RepresentationRelationship> & ent);

};


%extend RWStepRepr_RWRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************************
* class RWStepRepr_RWRepresentationRelationshipWithTransformation *
******************************************************************/
class RWStepRepr_RWRepresentationRelationshipWithTransformation {
	public:
		/****************** RWStepRepr_RWRepresentationRelationshipWithTransformation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationRelationshipWithTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentationRelationshipWithTransformation;
		 RWStepRepr_RWRepresentationRelationshipWithTransformation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_RepresentationRelationshipWithTransformation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_RepresentationRelationshipWithTransformation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_RepresentationRelationshipWithTransformation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent);

};


%extend RWStepRepr_RWRepresentationRelationshipWithTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepRepr_RWShapeAspect *
*********************************/
class RWStepRepr_RWShapeAspect {
	public:
		/****************** RWStepRepr_RWShapeAspect ******************/
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWShapeAspect;
		 RWStepRepr_RWShapeAspect();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_ShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ShapeAspect> & ent);

};


%extend RWStepRepr_RWShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepRepr_RWShapeAspectDerivingRelationship *
*****************************************************/
class RWStepRepr_RWShapeAspectDerivingRelationship {
	public:
		/****************** RWStepRepr_RWShapeAspectDerivingRelationship ******************/
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspectDerivingRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWShapeAspectDerivingRelationship;
		 RWStepRepr_RWShapeAspectDerivingRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shapeaspectderivingrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ShapeAspectDerivingRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ShapeAspectDerivingRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shapeaspectderivingrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ShapeAspectDerivingRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent);

};


%extend RWStepRepr_RWShapeAspectDerivingRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepRepr_RWShapeAspectRelationship *
*********************************************/
class RWStepRepr_RWShapeAspectRelationship {
	public:
		/****************** RWStepRepr_RWShapeAspectRelationship ******************/
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspectRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWShapeAspectRelationship;
		 RWStepRepr_RWShapeAspectRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shapeaspectrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ShapeAspectRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ShapeAspectRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shapeaspectrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ShapeAspectRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent);

};


%extend RWStepRepr_RWShapeAspectRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepRepr_RWShapeAspectTransition *
*******************************************/
class RWStepRepr_RWShapeAspectTransition {
	public:
		/****************** RWStepRepr_RWShapeAspectTransition ******************/
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspectTransition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWShapeAspectTransition;
		 RWStepRepr_RWShapeAspectTransition();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shapeaspecttransition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ShapeAspectTransition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ShapeAspectTransition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ShapeAspectTransition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ShapeAspectTransition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shapeaspecttransition.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ShapeAspectTransition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ShapeAspectTransition> & ent);

};


%extend RWStepRepr_RWShapeAspectTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************************
* class RWStepRepr_RWShapeRepresentationRelationshipWithTransformation *
***********************************************************************/
class RWStepRepr_RWShapeRepresentationRelationshipWithTransformation {
	public:
		/****************** RWStepRepr_RWShapeRepresentationRelationshipWithTransformation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWShapeRepresentationRelationshipWithTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWShapeRepresentationRelationshipWithTransformation;
		 RWStepRepr_RWShapeRepresentationRelationshipWithTransformation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ShapeRepresentationRelationshipWithTransformation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_ShapeRepresentationRelationshipWithTransformation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ShapeRepresentationRelationshipWithTransformation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent);

};


%extend RWStepRepr_RWShapeRepresentationRelationshipWithTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepRepr_RWSpecifiedHigherUsageOccurrence *
****************************************************/
class RWStepRepr_RWSpecifiedHigherUsageOccurrence {
	public:
		/****************** RWStepRepr_RWSpecifiedHigherUsageOccurrence ******************/
		%feature("compactdefaultargs") RWStepRepr_RWSpecifiedHigherUsageOccurrence;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWSpecifiedHigherUsageOccurrence;
		 RWStepRepr_RWSpecifiedHigherUsageOccurrence();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads specifiedhigherusageoccurrence.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_SpecifiedHigherUsageOccurrence

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_SpecifiedHigherUsageOccurrence
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes specifiedhigherusageoccurrence.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_SpecifiedHigherUsageOccurrence

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent);

};


%extend RWStepRepr_RWSpecifiedHigherUsageOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepRepr_RWStructuralResponseProperty *
************************************************/
class RWStepRepr_RWStructuralResponseProperty {
	public:
		/****************** RWStepRepr_RWStructuralResponseProperty ******************/
		%feature("compactdefaultargs") RWStepRepr_RWStructuralResponseProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWStructuralResponseProperty;
		 RWStepRepr_RWStructuralResponseProperty();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads structuralresponseproperty.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_StructuralResponseProperty

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_StructuralResponseProperty> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_StructuralResponseProperty
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_StructuralResponseProperty> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes structuralresponseproperty.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_StructuralResponseProperty

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_StructuralResponseProperty> & ent);

};


%extend RWStepRepr_RWStructuralResponseProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************
* class RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation *
************************************************************************/
class RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation {
	public:
		/****************** RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation ******************/
		%feature("compactdefaultargs") RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation;
		 RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads structuralresponsepropertydefinitionrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_StructuralResponsePropertyDefinitionRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_StructuralResponsePropertyDefinitionRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes structuralresponsepropertydefinitionrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_StructuralResponsePropertyDefinitionRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent);

};


%extend RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepRepr_RWTangent *
*****************************/
class RWStepRepr_RWTangent {
	public:
		/****************** RWStepRepr_RWTangent ******************/
		%feature("compactdefaultargs") RWStepRepr_RWTangent;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWTangent;
		 RWStepRepr_RWTangent();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads tangent.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_Tangent

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_Tangent> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_Tangent
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_Tangent> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes tangent.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_Tangent

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_Tangent> & ent);

};


%extend RWStepRepr_RWTangent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepRepr_RWValueRepresentationItem *
*********************************************/
class RWStepRepr_RWValueRepresentationItem {
	public:
		/****************** RWStepRepr_RWValueRepresentationItem ******************/
		%feature("compactdefaultargs") RWStepRepr_RWValueRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWValueRepresentationItem;
		 RWStepRepr_RWValueRepresentationItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ValueRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ValueRepresentationItem> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ValueRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ValueRepresentationItem> & ent);

};


%extend RWStepRepr_RWValueRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
