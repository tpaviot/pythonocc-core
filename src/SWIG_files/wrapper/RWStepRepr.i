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

%nodefaultctor RWStepRepr_RWAllAroundShapeAspect;
class RWStepRepr_RWAllAroundShapeAspect {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWAllAroundShapeAspect;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWAllAroundShapeAspect;
		 RWStepRepr_RWAllAroundShapeAspect ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads AllAroundShapeAspect

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_AllAroundShapeAspect> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_AllAroundShapeAspect> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AllAroundShapeAspect

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_AllAroundShapeAspect> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent);
};


%extend RWStepRepr_RWAllAroundShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWApex;
class RWStepRepr_RWApex {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWApex;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWApex;
		 RWStepRepr_RWApex ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Apex

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_Apex> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_Apex> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_Apex> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_Apex> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Apex

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_Apex> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_Apex> & ent);
};


%extend RWStepRepr_RWApex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWAssemblyComponentUsage;
class RWStepRepr_RWAssemblyComponentUsage {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWAssemblyComponentUsage;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWAssemblyComponentUsage;
		 RWStepRepr_RWAssemblyComponentUsage ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads AssemblyComponentUsage

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_AssemblyComponentUsage> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_AssemblyComponentUsage> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AssemblyComponentUsage

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_AssemblyComponentUsage> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent);
};


%extend RWStepRepr_RWAssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWAssemblyComponentUsageSubstitute;
class RWStepRepr_RWAssemblyComponentUsageSubstitute {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWAssemblyComponentUsageSubstitute;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWAssemblyComponentUsageSubstitute;
		 RWStepRepr_RWAssemblyComponentUsageSubstitute ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent);
};


%extend RWStepRepr_RWAssemblyComponentUsageSubstitute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWBetweenShapeAspect;
class RWStepRepr_RWBetweenShapeAspect {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWBetweenShapeAspect;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWBetweenShapeAspect;
		 RWStepRepr_RWBetweenShapeAspect ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads BetweenShapeAspect

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_BetweenShapeAspect> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_BetweenShapeAspect> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_BetweenShapeAspect> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_BetweenShapeAspect> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes BetweenShapeAspect

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_BetweenShapeAspect> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_BetweenShapeAspect> & ent);
};


%extend RWStepRepr_RWBetweenShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWCentreOfSymmetry;
class RWStepRepr_RWCentreOfSymmetry {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWCentreOfSymmetry;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWCentreOfSymmetry;
		 RWStepRepr_RWCentreOfSymmetry ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CentreOfSymmetry

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CentreOfSymmetry> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CentreOfSymmetry> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_CentreOfSymmetry> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_CentreOfSymmetry> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CentreOfSymmetry

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CentreOfSymmetry> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CentreOfSymmetry> & ent);
};


%extend RWStepRepr_RWCentreOfSymmetry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWCharacterizedRepresentation;
class RWStepRepr_RWCharacterizedRepresentation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWCharacterizedRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWCharacterizedRepresentation;
		 RWStepRepr_RWCharacterizedRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CharacterizedRepresentation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_CharacterizedRepresentation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CharacterizedRepresentation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent);
};


%extend RWStepRepr_RWCharacterizedRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
class RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
		 RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent);
};


%extend RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWCompShAspAndDatumFeatAndShAsp;
class RWStepRepr_RWCompShAspAndDatumFeatAndShAsp {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWCompShAspAndDatumFeatAndShAsp;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWCompShAspAndDatumFeatAndShAsp;
		 RWStepRepr_RWCompShAspAndDatumFeatAndShAsp ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent);
};


%extend RWStepRepr_RWCompShAspAndDatumFeatAndShAsp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWCompositeGroupShapeAspect;
class RWStepRepr_RWCompositeGroupShapeAspect {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWCompositeGroupShapeAspect;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWCompositeGroupShapeAspect;
		 RWStepRepr_RWCompositeGroupShapeAspect ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CompositeGroupShapeAspect

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CompositeGroupShapeAspect> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_CompositeGroupShapeAspect> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CompositeGroupShapeAspect

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CompositeGroupShapeAspect> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent);
};


%extend RWStepRepr_RWCompositeGroupShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWCompositeShapeAspect;
class RWStepRepr_RWCompositeShapeAspect {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWCompositeShapeAspect;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWCompositeShapeAspect;
		 RWStepRepr_RWCompositeShapeAspect ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CompositeShapeAspect

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CompositeShapeAspect> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CompositeShapeAspect> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_CompositeShapeAspect> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_CompositeShapeAspect> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CompositeShapeAspect

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CompositeShapeAspect> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CompositeShapeAspect> & ent);
};


%extend RWStepRepr_RWCompositeShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWCompoundRepresentationItem;
class RWStepRepr_RWCompoundRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWCompoundRepresentationItem;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWCompoundRepresentationItem;
		 RWStepRepr_RWCompoundRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CompoundRepresentationItem> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_CompoundRepresentationItem> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_CompoundRepresentationItem> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent);
};


%extend RWStepRepr_RWCompoundRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWConfigurationDesign;
class RWStepRepr_RWConfigurationDesign {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWConfigurationDesign;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWConfigurationDesign;
		 RWStepRepr_RWConfigurationDesign ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ConfigurationDesign

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ConfigurationDesign> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ConfigurationDesign> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_ConfigurationDesign> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ConfigurationDesign> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ConfigurationDesign

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ConfigurationDesign> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ConfigurationDesign> & ent);
};


%extend RWStepRepr_RWConfigurationDesign {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWConfigurationEffectivity;
class RWStepRepr_RWConfigurationEffectivity {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWConfigurationEffectivity;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWConfigurationEffectivity;
		 RWStepRepr_RWConfigurationEffectivity ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ConfigurationEffectivity

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ConfigurationEffectivity> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_ConfigurationEffectivity> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ConfigurationEffectivity

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ConfigurationEffectivity> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent);
};


%extend RWStepRepr_RWConfigurationEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWConfigurationItem;
class RWStepRepr_RWConfigurationItem {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWConfigurationItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWConfigurationItem;
		 RWStepRepr_RWConfigurationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ConfigurationItem

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ConfigurationItem> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ConfigurationItem> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_ConfigurationItem> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ConfigurationItem> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ConfigurationItem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ConfigurationItem> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ConfigurationItem> & ent);
};


%extend RWStepRepr_RWConfigurationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWConstructiveGeometryRepresentation;
class RWStepRepr_RWConstructiveGeometryRepresentation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWConstructiveGeometryRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWConstructiveGeometryRepresentation;
		 RWStepRepr_RWConstructiveGeometryRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent);
};


%extend RWStepRepr_RWConstructiveGeometryRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWConstructiveGeometryRepresentationRelationship;
class RWStepRepr_RWConstructiveGeometryRepresentationRelationship {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWConstructiveGeometryRepresentationRelationship;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWConstructiveGeometryRepresentationRelationship;
		 RWStepRepr_RWConstructiveGeometryRepresentationRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent);
};


%extend RWStepRepr_RWConstructiveGeometryRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWContinuosShapeAspect;
class RWStepRepr_RWContinuosShapeAspect {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWContinuosShapeAspect;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWContinuosShapeAspect;
		 RWStepRepr_RWContinuosShapeAspect ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ContinuosShapeAspect

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ContinuosShapeAspect> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_ContinuosShapeAspect> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ContinuosShapeAspect

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ContinuosShapeAspect> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent);
};


%extend RWStepRepr_RWContinuosShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWDataEnvironment;
class RWStepRepr_RWDataEnvironment {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWDataEnvironment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWDataEnvironment;
		 RWStepRepr_RWDataEnvironment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DataEnvironment

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_DataEnvironment> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_DataEnvironment> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_DataEnvironment> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_DataEnvironment> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DataEnvironment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_DataEnvironment> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_DataEnvironment> & ent);
};


%extend RWStepRepr_RWDataEnvironment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWDefinitionalRepresentation;
class RWStepRepr_RWDefinitionalRepresentation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWDefinitionalRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWDefinitionalRepresentation;
		 RWStepRepr_RWDefinitionalRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_DefinitionalRepresentation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_DefinitionalRepresentation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_DefinitionalRepresentation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent);
};


%extend RWStepRepr_RWDefinitionalRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWDerivedShapeAspect;
class RWStepRepr_RWDerivedShapeAspect {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWDerivedShapeAspect;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWDerivedShapeAspect;
		 RWStepRepr_RWDerivedShapeAspect ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DerivedShapeAspect

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_DerivedShapeAspect> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_DerivedShapeAspect> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_DerivedShapeAspect> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_DerivedShapeAspect> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DerivedShapeAspect

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_DerivedShapeAspect> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_DerivedShapeAspect> & ent);
};


%extend RWStepRepr_RWDerivedShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWDescriptiveRepresentationItem;
class RWStepRepr_RWDescriptiveRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWDescriptiveRepresentationItem;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWDescriptiveRepresentationItem;
		 RWStepRepr_RWDescriptiveRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_DescriptiveRepresentationItem> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_DescriptiveRepresentationItem> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_DescriptiveRepresentationItem> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_DescriptiveRepresentationItem> & ent);
};


%extend RWStepRepr_RWDescriptiveRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWExtension;
class RWStepRepr_RWExtension {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWExtension;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWExtension;
		 RWStepRepr_RWExtension ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Extension

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_Extension> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_Extension> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_Extension> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_Extension> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Extension

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_Extension> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_Extension> & ent);
};


%extend RWStepRepr_RWExtension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWFeatureForDatumTargetRelationship;
class RWStepRepr_RWFeatureForDatumTargetRelationship {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWFeatureForDatumTargetRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWFeatureForDatumTargetRelationship;
		 RWStepRepr_RWFeatureForDatumTargetRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ShapeAspectRelationship

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ShapeAspectRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent);
};


%extend RWStepRepr_RWFeatureForDatumTargetRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWFunctionallyDefinedTransformation;
class RWStepRepr_RWFunctionallyDefinedTransformation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWFunctionallyDefinedTransformation;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWFunctionallyDefinedTransformation;
		 RWStepRepr_RWFunctionallyDefinedTransformation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_FunctionallyDefinedTransformation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_FunctionallyDefinedTransformation> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_FunctionallyDefinedTransformation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_FunctionallyDefinedTransformation> & ent);
};


%extend RWStepRepr_RWFunctionallyDefinedTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWGeometricAlignment;
class RWStepRepr_RWGeometricAlignment {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWGeometricAlignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWGeometricAlignment;
		 RWStepRepr_RWGeometricAlignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeometricAlignment

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_GeometricAlignment> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_GeometricAlignment> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_GeometricAlignment> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_GeometricAlignment> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricAlignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_GeometricAlignment> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_GeometricAlignment> & ent);
};


%extend RWStepRepr_RWGeometricAlignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWGlobalUncertaintyAssignedContext;
class RWStepRepr_RWGlobalUncertaintyAssignedContext {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWGlobalUncertaintyAssignedContext;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWGlobalUncertaintyAssignedContext;
		 RWStepRepr_RWGlobalUncertaintyAssignedContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent);
};


%extend RWStepRepr_RWGlobalUncertaintyAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWGlobalUnitAssignedContext;
class RWStepRepr_RWGlobalUnitAssignedContext {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWGlobalUnitAssignedContext;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWGlobalUnitAssignedContext;
		 RWStepRepr_RWGlobalUnitAssignedContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_GlobalUnitAssignedContext> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_GlobalUnitAssignedContext> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_GlobalUnitAssignedContext> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent);
};


%extend RWStepRepr_RWGlobalUnitAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWIntegerRepresentationItem;
class RWStepRepr_RWIntegerRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWIntegerRepresentationItem;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWIntegerRepresentationItem;
		 RWStepRepr_RWIntegerRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_IntegerRepresentationItem> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_IntegerRepresentationItem> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_IntegerRepresentationItem> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_IntegerRepresentationItem> & ent);
};


%extend RWStepRepr_RWIntegerRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWItemDefinedTransformation;
class RWStepRepr_RWItemDefinedTransformation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWItemDefinedTransformation;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWItemDefinedTransformation;
		 RWStepRepr_RWItemDefinedTransformation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ItemDefinedTransformation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_ItemDefinedTransformation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ItemDefinedTransformation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent);
};


%extend RWStepRepr_RWItemDefinedTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWMakeFromUsageOption;
class RWStepRepr_RWMakeFromUsageOption {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWMakeFromUsageOption;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWMakeFromUsageOption;
		 RWStepRepr_RWMakeFromUsageOption ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads MakeFromUsageOption

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MakeFromUsageOption> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MakeFromUsageOption> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_MakeFromUsageOption> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_MakeFromUsageOption> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes MakeFromUsageOption

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MakeFromUsageOption> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MakeFromUsageOption> & ent);
};


%extend RWStepRepr_RWMakeFromUsageOption {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWMappedItem;
class RWStepRepr_RWMappedItem {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWMappedItem;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWMappedItem;
		 RWStepRepr_RWMappedItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MappedItem> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MappedItem> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_MappedItem> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_MappedItem> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MappedItem> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MappedItem> & ent);
};


%extend RWStepRepr_RWMappedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWMaterialDesignation;
class RWStepRepr_RWMaterialDesignation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWMaterialDesignation;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWMaterialDesignation;
		 RWStepRepr_RWMaterialDesignation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MaterialDesignation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MaterialDesignation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_MaterialDesignation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_MaterialDesignation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MaterialDesignation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MaterialDesignation> & ent);
};


%extend RWStepRepr_RWMaterialDesignation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWMaterialProperty;
class RWStepRepr_RWMaterialProperty {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWMaterialProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWMaterialProperty;
		 RWStepRepr_RWMaterialProperty ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads MaterialProperty

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MaterialProperty> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MaterialProperty> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_MaterialProperty> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_MaterialProperty> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes MaterialProperty

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MaterialProperty> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MaterialProperty> & ent);
};


%extend RWStepRepr_RWMaterialProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWMaterialPropertyRepresentation;
class RWStepRepr_RWMaterialPropertyRepresentation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWMaterialPropertyRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWMaterialPropertyRepresentation;
		 RWStepRepr_RWMaterialPropertyRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads MaterialPropertyRepresentation

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MaterialPropertyRepresentation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_MaterialPropertyRepresentation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes MaterialPropertyRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MaterialPropertyRepresentation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent);
};


%extend RWStepRepr_RWMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWMeasureRepresentationItem;
class RWStepRepr_RWMeasureRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWMeasureRepresentationItem;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWMeasureRepresentationItem;
		 RWStepRepr_RWMeasureRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MeasureRepresentationItem> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_MeasureRepresentationItem> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_MeasureRepresentationItem> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent);
};


%extend RWStepRepr_RWMeasureRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWParallelOffset;
class RWStepRepr_RWParallelOffset {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWParallelOffset;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWParallelOffset;
		 RWStepRepr_RWParallelOffset ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ParallelOffset

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ParallelOffset> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ParallelOffset> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_ParallelOffset> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ParallelOffset> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ParallelOffset

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ParallelOffset> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ParallelOffset> & ent);
};


%extend RWStepRepr_RWParallelOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWParametricRepresentationContext;
class RWStepRepr_RWParametricRepresentationContext {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWParametricRepresentationContext;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWParametricRepresentationContext;
		 RWStepRepr_RWParametricRepresentationContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ParametricRepresentationContext> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ParametricRepresentationContext> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ParametricRepresentationContext> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ParametricRepresentationContext> & ent);
};


%extend RWStepRepr_RWParametricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWPerpendicularTo;
class RWStepRepr_RWPerpendicularTo {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWPerpendicularTo;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWPerpendicularTo;
		 RWStepRepr_RWPerpendicularTo ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads PerpendicularTo

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_PerpendicularTo> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_PerpendicularTo> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_PerpendicularTo> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_PerpendicularTo> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PerpendicularTo

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_PerpendicularTo> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_PerpendicularTo> & ent);
};


%extend RWStepRepr_RWPerpendicularTo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWProductConcept;
class RWStepRepr_RWProductConcept {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWProductConcept;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWProductConcept;
		 RWStepRepr_RWProductConcept ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ProductConcept

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ProductConcept> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ProductConcept> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_ProductConcept> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ProductConcept> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ProductConcept

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ProductConcept> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ProductConcept> & ent);
};


%extend RWStepRepr_RWProductConcept {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWProductDefinitionShape;
class RWStepRepr_RWProductDefinitionShape {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWProductDefinitionShape;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWProductDefinitionShape;
		 RWStepRepr_RWProductDefinitionShape ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ProductDefinitionShape

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ProductDefinitionShape> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ProductDefinitionShape> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_ProductDefinitionShape> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ProductDefinitionShape> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ProductDefinitionShape

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ProductDefinitionShape> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ProductDefinitionShape> & ent);
};


%extend RWStepRepr_RWProductDefinitionShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWPropertyDefinition;
class RWStepRepr_RWPropertyDefinition {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWPropertyDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWPropertyDefinition;
		 RWStepRepr_RWPropertyDefinition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads PropertyDefinition

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_PropertyDefinition> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_PropertyDefinition> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_PropertyDefinition> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_PropertyDefinition> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PropertyDefinition

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_PropertyDefinition> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_PropertyDefinition> & ent);
};


%extend RWStepRepr_RWPropertyDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWPropertyDefinitionRelationship;
class RWStepRepr_RWPropertyDefinitionRelationship {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWPropertyDefinitionRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWPropertyDefinitionRelationship;
		 RWStepRepr_RWPropertyDefinitionRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads PropertyDefinitionRelationship

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_PropertyDefinitionRelationship> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_PropertyDefinitionRelationship> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PropertyDefinitionRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_PropertyDefinitionRelationship> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent);
};


%extend RWStepRepr_RWPropertyDefinitionRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWPropertyDefinitionRepresentation;
class RWStepRepr_RWPropertyDefinitionRepresentation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWPropertyDefinitionRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWPropertyDefinitionRepresentation;
		 RWStepRepr_RWPropertyDefinitionRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads PropertyDefinitionRepresentation

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_PropertyDefinitionRepresentation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_PropertyDefinitionRepresentation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PropertyDefinitionRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_PropertyDefinitionRepresentation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent);
};


%extend RWStepRepr_RWPropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWQuantifiedAssemblyComponentUsage;
class RWStepRepr_RWQuantifiedAssemblyComponentUsage {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWQuantifiedAssemblyComponentUsage;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWQuantifiedAssemblyComponentUsage;
		 RWStepRepr_RWQuantifiedAssemblyComponentUsage ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads QuantifiedAssemblyComponentUsage

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes QuantifiedAssemblyComponentUsage

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent);
};


%extend RWStepRepr_RWQuantifiedAssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWReprItemAndLengthMeasureWithUnit;
class RWStepRepr_RWReprItemAndLengthMeasureWithUnit {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndLengthMeasureWithUnit;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWReprItemAndLengthMeasureWithUnit;
		 RWStepRepr_RWReprItemAndLengthMeasureWithUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnit> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnit> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnit> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnit> & ent);
};


%extend RWStepRepr_RWReprItemAndLengthMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI;
class RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI;
		 RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI> & ent);
};


%extend RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit;
class RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit;
		 RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit> & ent);
};


%extend RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI;
class RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		 RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI> & ent);
};


%extend RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWRepresentation;
class RWStepRepr_RWRepresentation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWRepresentation;
		 RWStepRepr_RWRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_Representation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_Representation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_Representation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_Representation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_Representation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_Representation> & ent);
};


%extend RWStepRepr_RWRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWRepresentationContext;
class RWStepRepr_RWRepresentationContext {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationContext;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWRepresentationContext;
		 RWStepRepr_RWRepresentationContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationContext> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_RepresentationContext> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationContext> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_RepresentationContext> & ent);
};


%extend RWStepRepr_RWRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWRepresentationItem;
class RWStepRepr_RWRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationItem;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWRepresentationItem;
		 RWStepRepr_RWRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationItem> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_RepresentationItem> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationItem> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_RepresentationItem> & ent);
};


%extend RWStepRepr_RWRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWRepresentationMap;
class RWStepRepr_RWRepresentationMap {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationMap;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWRepresentationMap;
		 RWStepRepr_RWRepresentationMap ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationMap> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_RepresentationMap> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationMap> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_RepresentationMap> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationMap> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_RepresentationMap> & ent);
};


%extend RWStepRepr_RWRepresentationMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWRepresentationRelationship;
class RWStepRepr_RWRepresentationRelationship {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationRelationship;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWRepresentationRelationship;
		 RWStepRepr_RWRepresentationRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationRelationship> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_RepresentationRelationship> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationRelationship> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_RepresentationRelationship> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationRelationship> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_RepresentationRelationship> & ent);
};


%extend RWStepRepr_RWRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWRepresentationRelationshipWithTransformation;
class RWStepRepr_RWRepresentationRelationshipWithTransformation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationRelationshipWithTransformation;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWRepresentationRelationshipWithTransformation;
		 RWStepRepr_RWRepresentationRelationshipWithTransformation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent);
};


%extend RWStepRepr_RWRepresentationRelationshipWithTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWShapeAspect;
class RWStepRepr_RWShapeAspect {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspect;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWShapeAspect;
		 RWStepRepr_RWShapeAspect ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspect> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ShapeAspect> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspect> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ShapeAspect> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspect> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ShapeAspect> & ent);
};


%extend RWStepRepr_RWShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWShapeAspectDerivingRelationship;
class RWStepRepr_RWShapeAspectDerivingRelationship {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspectDerivingRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWShapeAspectDerivingRelationship;
		 RWStepRepr_RWShapeAspectDerivingRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ShapeAspectDerivingRelationship

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ShapeAspectDerivingRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent);
};


%extend RWStepRepr_RWShapeAspectDerivingRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWShapeAspectRelationship;
class RWStepRepr_RWShapeAspectRelationship {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspectRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWShapeAspectRelationship;
		 RWStepRepr_RWShapeAspectRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ShapeAspectRelationship

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspectRelationship> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspectRelationship> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ShapeAspectRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspectRelationship> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent);
};


%extend RWStepRepr_RWShapeAspectRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWShapeAspectTransition;
class RWStepRepr_RWShapeAspectTransition {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspectTransition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWShapeAspectTransition;
		 RWStepRepr_RWShapeAspectTransition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ShapeAspectTransition

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspectTransition> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ShapeAspectTransition> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspectTransition> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ShapeAspectTransition> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ShapeAspectTransition

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeAspectTransition> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ShapeAspectTransition> & ent);
};


%extend RWStepRepr_RWShapeAspectTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWShapeRepresentationRelationshipWithTransformation;
class RWStepRepr_RWShapeRepresentationRelationshipWithTransformation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWShapeRepresentationRelationshipWithTransformation;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWShapeRepresentationRelationshipWithTransformation;
		 RWStepRepr_RWShapeRepresentationRelationshipWithTransformation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent);
};


%extend RWStepRepr_RWShapeRepresentationRelationshipWithTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWSpecifiedHigherUsageOccurrence;
class RWStepRepr_RWSpecifiedHigherUsageOccurrence {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWSpecifiedHigherUsageOccurrence;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWSpecifiedHigherUsageOccurrence;
		 RWStepRepr_RWSpecifiedHigherUsageOccurrence ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads SpecifiedHigherUsageOccurrence

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SpecifiedHigherUsageOccurrence

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent);
};


%extend RWStepRepr_RWSpecifiedHigherUsageOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWStructuralResponseProperty;
class RWStepRepr_RWStructuralResponseProperty {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWStructuralResponseProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWStructuralResponseProperty;
		 RWStepRepr_RWStructuralResponseProperty ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads StructuralResponseProperty

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_StructuralResponseProperty> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_StructuralResponseProperty> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_StructuralResponseProperty> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_StructuralResponseProperty> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes StructuralResponseProperty

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_StructuralResponseProperty> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_StructuralResponseProperty> & ent);
};


%extend RWStepRepr_RWStructuralResponseProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation;
class RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation;
		 RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads StructuralResponsePropertyDefinitionRepresentation

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes StructuralResponsePropertyDefinitionRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent);
};


%extend RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWTangent;
class RWStepRepr_RWTangent {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWTangent;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepRepr_RWTangent;
		 RWStepRepr_RWTangent ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Tangent

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_Tangent> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_Tangent> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepRepr_Tangent> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepRepr_Tangent> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Tangent

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_Tangent> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_Tangent> & ent);
};


%extend RWStepRepr_RWTangent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepRepr_RWValueRepresentationItem;
class RWStepRepr_RWValueRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepRepr_RWValueRepresentationItem;
		%feature("autodoc", "	:rtype: None
") RWStepRepr_RWValueRepresentationItem;
		 RWStepRepr_RWValueRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ValueRepresentationItem> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepRepr_ValueRepresentationItem> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepRepr_ValueRepresentationItem> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepRepr_ValueRepresentationItem> & ent);
};


%extend RWStepRepr_RWValueRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
