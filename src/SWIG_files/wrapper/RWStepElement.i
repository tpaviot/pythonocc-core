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
%define RWSTEPELEMENTDOCSTRING
"RWStepElement module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepelement.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPELEMENTDOCSTRING) RWStepElement


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
#include<RWStepElement_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepElement_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<StepRepr_module.hxx>
#include<StepElement_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepData.i
%import Interface.i
%import StepElement.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%nodefaultctor RWStepElement_RWAnalysisItemWithinRepresentation;
class RWStepElement_RWAnalysisItemWithinRepresentation {
	public:
		%feature("compactdefaultargs") RWStepElement_RWAnalysisItemWithinRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWAnalysisItemWithinRepresentation;
		 RWStepElement_RWAnalysisItemWithinRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads AnalysisItemWithinRepresentation

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_AnalysisItemWithinRepresentation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_AnalysisItemWithinRepresentation> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AnalysisItemWithinRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_AnalysisItemWithinRepresentation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & ent);
};


%extend RWStepElement_RWAnalysisItemWithinRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWCurve3dElementDescriptor;
class RWStepElement_RWCurve3dElementDescriptor {
	public:
		%feature("compactdefaultargs") RWStepElement_RWCurve3dElementDescriptor;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWCurve3dElementDescriptor;
		 RWStepElement_RWCurve3dElementDescriptor ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Curve3dElementDescriptor

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_Curve3dElementDescriptor> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_Curve3dElementDescriptor> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_Curve3dElementDescriptor> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_Curve3dElementDescriptor> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Curve3dElementDescriptor

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_Curve3dElementDescriptor> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_Curve3dElementDescriptor> & ent);
};


%extend RWStepElement_RWCurve3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWCurveElementEndReleasePacket;
class RWStepElement_RWCurveElementEndReleasePacket {
	public:
		%feature("compactdefaultargs") RWStepElement_RWCurveElementEndReleasePacket;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWCurveElementEndReleasePacket;
		 RWStepElement_RWCurveElementEndReleasePacket ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CurveElementEndReleasePacket

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_CurveElementEndReleasePacket> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_CurveElementEndReleasePacket> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_CurveElementEndReleasePacket> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_CurveElementEndReleasePacket> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CurveElementEndReleasePacket

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_CurveElementEndReleasePacket> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_CurveElementEndReleasePacket> & ent);
};


%extend RWStepElement_RWCurveElementEndReleasePacket {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWCurveElementSectionDefinition;
class RWStepElement_RWCurveElementSectionDefinition {
	public:
		%feature("compactdefaultargs") RWStepElement_RWCurveElementSectionDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWCurveElementSectionDefinition;
		 RWStepElement_RWCurveElementSectionDefinition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CurveElementSectionDefinition

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_CurveElementSectionDefinition> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_CurveElementSectionDefinition> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_CurveElementSectionDefinition> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_CurveElementSectionDefinition> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CurveElementSectionDefinition

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_CurveElementSectionDefinition> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_CurveElementSectionDefinition> & ent);
};


%extend RWStepElement_RWCurveElementSectionDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWCurveElementSectionDerivedDefinitions;
class RWStepElement_RWCurveElementSectionDerivedDefinitions {
	public:
		%feature("compactdefaultargs") RWStepElement_RWCurveElementSectionDerivedDefinitions;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWCurveElementSectionDerivedDefinitions;
		 RWStepElement_RWCurveElementSectionDerivedDefinitions ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CurveElementSectionDerivedDefinitions

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_CurveElementSectionDerivedDefinitions> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_CurveElementSectionDerivedDefinitions> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_CurveElementSectionDerivedDefinitions> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_CurveElementSectionDerivedDefinitions> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CurveElementSectionDerivedDefinitions

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_CurveElementSectionDerivedDefinitions> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_CurveElementSectionDerivedDefinitions> & ent);
};


%extend RWStepElement_RWCurveElementSectionDerivedDefinitions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWElementDescriptor;
class RWStepElement_RWElementDescriptor {
	public:
		%feature("compactdefaultargs") RWStepElement_RWElementDescriptor;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWElementDescriptor;
		 RWStepElement_RWElementDescriptor ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ElementDescriptor

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_ElementDescriptor> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_ElementDescriptor> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_ElementDescriptor> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_ElementDescriptor> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ElementDescriptor

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_ElementDescriptor> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_ElementDescriptor> & ent);
};


%extend RWStepElement_RWElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWElementMaterial;
class RWStepElement_RWElementMaterial {
	public:
		%feature("compactdefaultargs") RWStepElement_RWElementMaterial;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWElementMaterial;
		 RWStepElement_RWElementMaterial ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ElementMaterial

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_ElementMaterial> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_ElementMaterial> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_ElementMaterial> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_ElementMaterial> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ElementMaterial

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_ElementMaterial> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_ElementMaterial> & ent);
};


%extend RWStepElement_RWElementMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWSurface3dElementDescriptor;
class RWStepElement_RWSurface3dElementDescriptor {
	public:
		%feature("compactdefaultargs") RWStepElement_RWSurface3dElementDescriptor;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWSurface3dElementDescriptor;
		 RWStepElement_RWSurface3dElementDescriptor ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Surface3dElementDescriptor

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_Surface3dElementDescriptor> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_Surface3dElementDescriptor> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_Surface3dElementDescriptor> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_Surface3dElementDescriptor> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Surface3dElementDescriptor

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_Surface3dElementDescriptor> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_Surface3dElementDescriptor> & ent);
};


%extend RWStepElement_RWSurface3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWSurfaceElementProperty;
class RWStepElement_RWSurfaceElementProperty {
	public:
		%feature("compactdefaultargs") RWStepElement_RWSurfaceElementProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWSurfaceElementProperty;
		 RWStepElement_RWSurfaceElementProperty ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads SurfaceElementProperty

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceElementProperty> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_SurfaceElementProperty> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceElementProperty> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_SurfaceElementProperty> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SurfaceElementProperty

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceElementProperty> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_SurfaceElementProperty> & ent);
};


%extend RWStepElement_RWSurfaceElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWSurfaceSection;
class RWStepElement_RWSurfaceSection {
	public:
		%feature("compactdefaultargs") RWStepElement_RWSurfaceSection;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWSurfaceSection;
		 RWStepElement_RWSurfaceSection ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads SurfaceSection

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSection> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_SurfaceSection> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSection> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_SurfaceSection> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SurfaceSection

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSection> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_SurfaceSection> & ent);
};


%extend RWStepElement_RWSurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWSurfaceSectionField;
class RWStepElement_RWSurfaceSectionField {
	public:
		%feature("compactdefaultargs") RWStepElement_RWSurfaceSectionField;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWSurfaceSectionField;
		 RWStepElement_RWSurfaceSectionField ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads SurfaceSectionField

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSectionField> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_SurfaceSectionField> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSectionField> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_SurfaceSectionField> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SurfaceSectionField

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSectionField> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_SurfaceSectionField> & ent);
};


%extend RWStepElement_RWSurfaceSectionField {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWSurfaceSectionFieldConstant;
class RWStepElement_RWSurfaceSectionFieldConstant {
	public:
		%feature("compactdefaultargs") RWStepElement_RWSurfaceSectionFieldConstant;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWSurfaceSectionFieldConstant;
		 RWStepElement_RWSurfaceSectionFieldConstant ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads SurfaceSectionFieldConstant

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSectionFieldConstant> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_SurfaceSectionFieldConstant> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSectionFieldConstant> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_SurfaceSectionFieldConstant> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SurfaceSectionFieldConstant

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSectionFieldConstant> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_SurfaceSectionFieldConstant> & ent);
};


%extend RWStepElement_RWSurfaceSectionFieldConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWSurfaceSectionFieldVarying;
class RWStepElement_RWSurfaceSectionFieldVarying {
	public:
		%feature("compactdefaultargs") RWStepElement_RWSurfaceSectionFieldVarying;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWSurfaceSectionFieldVarying;
		 RWStepElement_RWSurfaceSectionFieldVarying ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads SurfaceSectionFieldVarying

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSectionFieldVarying> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_SurfaceSectionFieldVarying> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSectionFieldVarying> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_SurfaceSectionFieldVarying> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SurfaceSectionFieldVarying

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_SurfaceSectionFieldVarying> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_SurfaceSectionFieldVarying> & ent);
};


%extend RWStepElement_RWSurfaceSectionFieldVarying {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWUniformSurfaceSection;
class RWStepElement_RWUniformSurfaceSection {
	public:
		%feature("compactdefaultargs") RWStepElement_RWUniformSurfaceSection;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWUniformSurfaceSection;
		 RWStepElement_RWUniformSurfaceSection ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads UniformSurfaceSection

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_UniformSurfaceSection> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_UniformSurfaceSection> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_UniformSurfaceSection> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_UniformSurfaceSection> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes UniformSurfaceSection

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_UniformSurfaceSection> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_UniformSurfaceSection> & ent);
};


%extend RWStepElement_RWUniformSurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepElement_RWVolume3dElementDescriptor;
class RWStepElement_RWVolume3dElementDescriptor {
	public:
		%feature("compactdefaultargs") RWStepElement_RWVolume3dElementDescriptor;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepElement_RWVolume3dElementDescriptor;
		 RWStepElement_RWVolume3dElementDescriptor ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Volume3dElementDescriptor

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepElement_Volume3dElementDescriptor> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepElement_Volume3dElementDescriptor> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepElement_Volume3dElementDescriptor> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepElement_Volume3dElementDescriptor> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Volume3dElementDescriptor

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepElement_Volume3dElementDescriptor> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepElement_Volume3dElementDescriptor> & ent);
};


%extend RWStepElement_RWVolume3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
