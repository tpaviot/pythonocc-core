/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWAllAroundShapeAspect;
		 RWStepRepr_RWAllAroundShapeAspect ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads AllAroundShapeAspect
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_AllAroundShapeAspect
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_AllAroundShapeAspect
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes AllAroundShapeAspect
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_AllAroundShapeAspect
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWApex;
		 RWStepRepr_RWApex ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Apex
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_Apex
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_Apex> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_Apex
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_Apex> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Apex
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_Apex
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_Apex> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWAssemblyComponentUsage;
		 RWStepRepr_RWAssemblyComponentUsage ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads AssemblyComponentUsage
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_AssemblyComponentUsage
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_AssemblyComponentUsage
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes AssemblyComponentUsage
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_AssemblyComponentUsage
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWAssemblyComponentUsageSubstitute;
		 RWStepRepr_RWAssemblyComponentUsageSubstitute ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_AssemblyComponentUsageSubstitute
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_AssemblyComponentUsageSubstitute
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_AssemblyComponentUsageSubstitute
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWBetweenShapeAspect;
		 RWStepRepr_RWBetweenShapeAspect ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads BetweenShapeAspect
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_BetweenShapeAspect
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_BetweenShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_BetweenShapeAspect
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_BetweenShapeAspect> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes BetweenShapeAspect
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_BetweenShapeAspect
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_BetweenShapeAspect> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWCentreOfSymmetry;
		 RWStepRepr_RWCentreOfSymmetry ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CentreOfSymmetry
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_CentreOfSymmetry
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CentreOfSymmetry> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_CentreOfSymmetry
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_CentreOfSymmetry> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CentreOfSymmetry
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_CentreOfSymmetry
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CentreOfSymmetry> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWCharacterizedRepresentation;
		 RWStepRepr_RWCharacterizedRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_CharacterizedRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_CharacterizedRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_CharacterizedRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
		 RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWCompShAspAndDatumFeatAndShAsp;
		 RWStepRepr_RWCompShAspAndDatumFeatAndShAsp ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_CompShAspAndDatumFeatAndShAsp
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_CompShAspAndDatumFeatAndShAsp
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_CompShAspAndDatumFeatAndShAsp
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWCompositeGroupShapeAspect;
		 RWStepRepr_RWCompositeGroupShapeAspect ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CompositeGroupShapeAspect
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_CompositeGroupShapeAspect
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_CompositeGroupShapeAspect
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CompositeGroupShapeAspect
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_CompositeGroupShapeAspect
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWCompositeShapeAspect;
		 RWStepRepr_RWCompositeShapeAspect ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CompositeShapeAspect
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_CompositeShapeAspect
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CompositeShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_CompositeShapeAspect
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_CompositeShapeAspect> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CompositeShapeAspect
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_CompositeShapeAspect
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CompositeShapeAspect> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWCompoundRepresentationItem;
		 RWStepRepr_RWCompoundRepresentationItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_CompoundRepresentationItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_CompoundRepresentationItem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_CompoundRepresentationItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWConfigurationDesign;
		 RWStepRepr_RWConfigurationDesign ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ConfigurationDesign
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ConfigurationDesign
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ConfigurationDesign> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_ConfigurationDesign
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ConfigurationDesign> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ConfigurationDesign
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ConfigurationDesign
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ConfigurationDesign> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWConfigurationEffectivity;
		 RWStepRepr_RWConfigurationEffectivity ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ConfigurationEffectivity
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ConfigurationEffectivity
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_ConfigurationEffectivity
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ConfigurationEffectivity
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ConfigurationEffectivity
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWConfigurationItem;
		 RWStepRepr_RWConfigurationItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ConfigurationItem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ConfigurationItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ConfigurationItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_ConfigurationItem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ConfigurationItem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ConfigurationItem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ConfigurationItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ConfigurationItem> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWConstructiveGeometryRepresentation;
		 RWStepRepr_RWConstructiveGeometryRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ConstructiveGeometryRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_ConstructiveGeometryRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ConstructiveGeometryRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWConstructiveGeometryRepresentationRelationship;
		 RWStepRepr_RWConstructiveGeometryRepresentationRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ConstructiveGeometryRepresentationRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_ConstructiveGeometryRepresentationRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ConstructiveGeometryRepresentationRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWContinuosShapeAspect;
		 RWStepRepr_RWContinuosShapeAspect ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ContinuosShapeAspect
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ContinuosShapeAspect
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_ContinuosShapeAspect
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ContinuosShapeAspect
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ContinuosShapeAspect
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWDataEnvironment;
		 RWStepRepr_RWDataEnvironment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DataEnvironment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_DataEnvironment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_DataEnvironment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_DataEnvironment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_DataEnvironment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DataEnvironment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_DataEnvironment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_DataEnvironment> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWDefinitionalRepresentation;
		 RWStepRepr_RWDefinitionalRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_DefinitionalRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_DefinitionalRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_DefinitionalRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWDerivedShapeAspect;
		 RWStepRepr_RWDerivedShapeAspect ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DerivedShapeAspect
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_DerivedShapeAspect
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_DerivedShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_DerivedShapeAspect
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_DerivedShapeAspect> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DerivedShapeAspect
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_DerivedShapeAspect
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_DerivedShapeAspect> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWDescriptiveRepresentationItem;
		 RWStepRepr_RWDescriptiveRepresentationItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_DescriptiveRepresentationItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_DescriptiveRepresentationItem> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_DescriptiveRepresentationItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_DescriptiveRepresentationItem> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWExtension;
		 RWStepRepr_RWExtension ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Extension
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_Extension
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_Extension> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_Extension
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_Extension> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Extension
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_Extension
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_Extension> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWFeatureForDatumTargetRelationship;
		 RWStepRepr_RWFeatureForDatumTargetRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ShapeAspectRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_FeatureForDatumTargetRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_FeatureForDatumTargetRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ShapeAspectRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_FeatureForDatumTargetRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWFunctionallyDefinedTransformation;
		 RWStepRepr_RWFunctionallyDefinedTransformation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_FunctionallyDefinedTransformation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_FunctionallyDefinedTransformation> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_FunctionallyDefinedTransformation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_FunctionallyDefinedTransformation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWGeometricAlignment;
		 RWStepRepr_RWGeometricAlignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeometricAlignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_GeometricAlignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_GeometricAlignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_GeometricAlignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_GeometricAlignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeometricAlignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_GeometricAlignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_GeometricAlignment> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWGlobalUncertaintyAssignedContext;
		 RWStepRepr_RWGlobalUncertaintyAssignedContext ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_GlobalUncertaintyAssignedContext
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_GlobalUncertaintyAssignedContext
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_GlobalUncertaintyAssignedContext
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWGlobalUnitAssignedContext;
		 RWStepRepr_RWGlobalUnitAssignedContext ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_GlobalUnitAssignedContext
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_GlobalUnitAssignedContext
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_GlobalUnitAssignedContext
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWIntegerRepresentationItem;
		 RWStepRepr_RWIntegerRepresentationItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_IntegerRepresentationItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_IntegerRepresentationItem> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_IntegerRepresentationItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_IntegerRepresentationItem> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWItemDefinedTransformation;
		 RWStepRepr_RWItemDefinedTransformation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ItemDefinedTransformation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_ItemDefinedTransformation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ItemDefinedTransformation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWMakeFromUsageOption;
		 RWStepRepr_RWMakeFromUsageOption ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads MakeFromUsageOption
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_MakeFromUsageOption
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MakeFromUsageOption> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_MakeFromUsageOption
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_MakeFromUsageOption> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes MakeFromUsageOption
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_MakeFromUsageOption
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MakeFromUsageOption> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWMappedItem;
		 RWStepRepr_RWMappedItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_MappedItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MappedItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_MappedItem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_MappedItem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_MappedItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MappedItem> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWMaterialDesignation;
		 RWStepRepr_RWMaterialDesignation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_MaterialDesignation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MaterialDesignation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_MaterialDesignation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_MaterialDesignation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_MaterialDesignation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MaterialDesignation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWMaterialProperty;
		 RWStepRepr_RWMaterialProperty ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads MaterialProperty
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_MaterialProperty
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MaterialProperty> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_MaterialProperty
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_MaterialProperty> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes MaterialProperty
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_MaterialProperty
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MaterialProperty> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWMaterialPropertyRepresentation;
		 RWStepRepr_RWMaterialPropertyRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads MaterialPropertyRepresentation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_MaterialPropertyRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_MaterialPropertyRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes MaterialPropertyRepresentation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_MaterialPropertyRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWMeasureRepresentationItem;
		 RWStepRepr_RWMeasureRepresentationItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_MeasureRepresentationItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_MeasureRepresentationItem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_MeasureRepresentationItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWParallelOffset;
		 RWStepRepr_RWParallelOffset ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ParallelOffset
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ParallelOffset
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ParallelOffset> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_ParallelOffset
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ParallelOffset> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ParallelOffset
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ParallelOffset
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ParallelOffset> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWParametricRepresentationContext;
		 RWStepRepr_RWParametricRepresentationContext ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ParametricRepresentationContext
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ParametricRepresentationContext> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ParametricRepresentationContext
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ParametricRepresentationContext> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWPerpendicularTo;
		 RWStepRepr_RWPerpendicularTo ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads PerpendicularTo
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_PerpendicularTo
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_PerpendicularTo> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_PerpendicularTo
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_PerpendicularTo> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes PerpendicularTo
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_PerpendicularTo
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_PerpendicularTo> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWProductConcept;
		 RWStepRepr_RWProductConcept ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ProductConcept
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ProductConcept
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ProductConcept> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_ProductConcept
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ProductConcept> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ProductConcept
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ProductConcept
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ProductConcept> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWProductDefinitionShape;
		 RWStepRepr_RWProductDefinitionShape ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ProductDefinitionShape
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ProductDefinitionShape
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ProductDefinitionShape> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_ProductDefinitionShape
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ProductDefinitionShape> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ProductDefinitionShape
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ProductDefinitionShape
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ProductDefinitionShape> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWPropertyDefinition;
		 RWStepRepr_RWPropertyDefinition ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads PropertyDefinition
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_PropertyDefinition
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_PropertyDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_PropertyDefinition
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_PropertyDefinition> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes PropertyDefinition
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_PropertyDefinition
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_PropertyDefinition> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWPropertyDefinitionRelationship;
		 RWStepRepr_RWPropertyDefinitionRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads PropertyDefinitionRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_PropertyDefinitionRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_PropertyDefinitionRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes PropertyDefinitionRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_PropertyDefinitionRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWPropertyDefinitionRepresentation;
		 RWStepRepr_RWPropertyDefinitionRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads PropertyDefinitionRepresentation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_PropertyDefinitionRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_PropertyDefinitionRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes PropertyDefinitionRepresentation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_PropertyDefinitionRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWQuantifiedAssemblyComponentUsage;
		 RWStepRepr_RWQuantifiedAssemblyComponentUsage ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads QuantifiedAssemblyComponentUsage
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_QuantifiedAssemblyComponentUsage
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_QuantifiedAssemblyComponentUsage
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes QuantifiedAssemblyComponentUsage
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_QuantifiedAssemblyComponentUsage
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWReprItemAndLengthMeasureWithUnit;
		 RWStepRepr_RWReprItemAndLengthMeasureWithUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ReprItemAndLengthMeasureWithUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ReprItemAndLengthMeasureWithUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI;
		 RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit;
		 RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		 RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWRepresentation;
		 RWStepRepr_RWRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_Representation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_Representation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_Representation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_Representation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_Representation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_Representation> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWRepresentationContext;
		 RWStepRepr_RWRepresentationContext ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_RepresentationContext
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_RepresentationContext> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_RepresentationContext
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_RepresentationContext> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWRepresentationItem;
		 RWStepRepr_RWRepresentationItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_RepresentationItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_RepresentationItem> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_RepresentationItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_RepresentationItem> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWRepresentationMap;
		 RWStepRepr_RWRepresentationMap ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_RepresentationMap
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_RepresentationMap> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_RepresentationMap
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_RepresentationMap> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_RepresentationMap
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_RepresentationMap> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWRepresentationRelationship;
		 RWStepRepr_RWRepresentationRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_RepresentationRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_RepresentationRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_RepresentationRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_RepresentationRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_RepresentationRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_RepresentationRelationship> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWRepresentationRelationshipWithTransformation;
		 RWStepRepr_RWRepresentationRelationshipWithTransformation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_RepresentationRelationshipWithTransformation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_RepresentationRelationshipWithTransformation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_RepresentationRelationshipWithTransformation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWShapeAspect;
		 RWStepRepr_RWShapeAspect ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ShapeAspect
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ShapeAspect> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_ShapeAspect
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ShapeAspect> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ShapeAspect
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ShapeAspect> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWShapeAspectDerivingRelationship;
		 RWStepRepr_RWShapeAspectDerivingRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ShapeAspectDerivingRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ShapeAspectDerivingRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_ShapeAspectDerivingRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ShapeAspectDerivingRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ShapeAspectDerivingRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWShapeAspectRelationship;
		 RWStepRepr_RWShapeAspectRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ShapeAspectRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ShapeAspectRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_ShapeAspectRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ShapeAspectRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ShapeAspectRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWShapeAspectTransition;
		 RWStepRepr_RWShapeAspectTransition ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ShapeAspectTransition
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ShapeAspectTransition
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ShapeAspectTransition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_ShapeAspectTransition
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ShapeAspectTransition> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ShapeAspectTransition
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ShapeAspectTransition
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ShapeAspectTransition> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWShapeRepresentationRelationshipWithTransformation;
		 RWStepRepr_RWShapeRepresentationRelationshipWithTransformation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ShapeRepresentationRelationshipWithTransformation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepRepr_ShapeRepresentationRelationshipWithTransformation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ShapeRepresentationRelationshipWithTransformation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWSpecifiedHigherUsageOccurrence;
		 RWStepRepr_RWSpecifiedHigherUsageOccurrence ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads SpecifiedHigherUsageOccurrence
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_SpecifiedHigherUsageOccurrence
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_SpecifiedHigherUsageOccurrence
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes SpecifiedHigherUsageOccurrence
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_SpecifiedHigherUsageOccurrence
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWStructuralResponseProperty;
		 RWStepRepr_RWStructuralResponseProperty ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads StructuralResponseProperty
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_StructuralResponseProperty
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_StructuralResponseProperty> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_StructuralResponseProperty
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_StructuralResponseProperty> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes StructuralResponseProperty
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_StructuralResponseProperty
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_StructuralResponseProperty> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation;
		 RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads StructuralResponsePropertyDefinitionRepresentation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_StructuralResponsePropertyDefinitionRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_StructuralResponsePropertyDefinitionRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes StructuralResponsePropertyDefinitionRepresentation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_StructuralResponsePropertyDefinitionRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepRepr_RWTangent;
		 RWStepRepr_RWTangent ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Tangent
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_Tangent
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_Tangent> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepRepr_Tangent
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepRepr_Tangent> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Tangent
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_Tangent
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_Tangent> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepRepr_RWValueRepresentationItem;
		 RWStepRepr_RWValueRepresentationItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepRepr_ValueRepresentationItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ValueRepresentationItem> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepRepr_ValueRepresentationItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ValueRepresentationItem> & ent);

};


%extend RWStepRepr_RWValueRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
