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
%import StepElement.i

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

/*********************************************************
* class RWStepElement_RWAnalysisItemWithinRepresentation *
*********************************************************/
class RWStepElement_RWAnalysisItemWithinRepresentation {
	public:
		/****************** RWStepElement_RWAnalysisItemWithinRepresentation ******************/
		/**** md5 signature: db26eec46aee250d2379bce37d68bb17 ****/
		%feature("compactdefaultargs") RWStepElement_RWAnalysisItemWithinRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWAnalysisItemWithinRepresentation;
		 RWStepElement_RWAnalysisItemWithinRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: f2e2d24653d2db47c1bae343cf4c5c81 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads analysisitemwithinrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_AnalysisItemWithinRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2004effa3580dd82d0a4ad33426fe492 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_AnalysisItemWithinRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 534a00c7bcd9f0790cbb9acf9f3dca60 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes analysisitemwithinrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_AnalysisItemWithinRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & ent);

};


%extend RWStepElement_RWAnalysisItemWithinRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepElement_RWCurve3dElementDescriptor *
*************************************************/
class RWStepElement_RWCurve3dElementDescriptor {
	public:
		/****************** RWStepElement_RWCurve3dElementDescriptor ******************/
		/**** md5 signature: e6f1db3891134c0e76d08016118b7e9a ****/
		%feature("compactdefaultargs") RWStepElement_RWCurve3dElementDescriptor;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWCurve3dElementDescriptor;
		 RWStepElement_RWCurve3dElementDescriptor();

		/****************** ReadStep ******************/
		/**** md5 signature: 4a7227380073b6ac74fe151abf06cdf2 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curve3delementdescriptor.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_Curve3dElementDescriptor

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_Curve3dElementDescriptor> & ent);

		/****************** Share ******************/
		/**** md5 signature: 65647b0c66b6b7e08ab3c0817cb18101 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_Curve3dElementDescriptor
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_Curve3dElementDescriptor> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 011a516665d4ca01429a52d5f76d8621 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curve3delementdescriptor.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_Curve3dElementDescriptor

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_Curve3dElementDescriptor> & ent);

};


%extend RWStepElement_RWCurve3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepElement_RWCurveElementEndReleasePacket *
*****************************************************/
class RWStepElement_RWCurveElementEndReleasePacket {
	public:
		/****************** RWStepElement_RWCurveElementEndReleasePacket ******************/
		/**** md5 signature: d821085e45073aad50aed875fef5b341 ****/
		%feature("compactdefaultargs") RWStepElement_RWCurveElementEndReleasePacket;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWCurveElementEndReleasePacket;
		 RWStepElement_RWCurveElementEndReleasePacket();

		/****************** ReadStep ******************/
		/**** md5 signature: 4cacc89439294db5160f5469d649e7da ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementendreleasepacket.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_CurveElementEndReleasePacket

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_CurveElementEndReleasePacket> & ent);

		/****************** Share ******************/
		/**** md5 signature: 97657d95ca69e5b952126a55b4ade786 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_CurveElementEndReleasePacket
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_CurveElementEndReleasePacket> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 849cc0d5ac51dfb47bdd94fcd342821a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementendreleasepacket.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_CurveElementEndReleasePacket

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_CurveElementEndReleasePacket> & ent);

};


%extend RWStepElement_RWCurveElementEndReleasePacket {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepElement_RWCurveElementSectionDefinition *
******************************************************/
class RWStepElement_RWCurveElementSectionDefinition {
	public:
		/****************** RWStepElement_RWCurveElementSectionDefinition ******************/
		/**** md5 signature: aad3a7f72c116a046948a8a51750bd36 ****/
		%feature("compactdefaultargs") RWStepElement_RWCurveElementSectionDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWCurveElementSectionDefinition;
		 RWStepElement_RWCurveElementSectionDefinition();

		/****************** ReadStep ******************/
		/**** md5 signature: e82197cb56badddef3adcc8737d0b5c8 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementsectiondefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_CurveElementSectionDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_CurveElementSectionDefinition> & ent);

		/****************** Share ******************/
		/**** md5 signature: 73d6a0cd79901a69ec2f432e1ddcae3e ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_CurveElementSectionDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_CurveElementSectionDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8a24cadc45e68f5805bdfeefbbf1ba76 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementsectiondefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_CurveElementSectionDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_CurveElementSectionDefinition> & ent);

};


%extend RWStepElement_RWCurveElementSectionDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class RWStepElement_RWCurveElementSectionDerivedDefinitions *
**************************************************************/
class RWStepElement_RWCurveElementSectionDerivedDefinitions {
	public:
		/****************** RWStepElement_RWCurveElementSectionDerivedDefinitions ******************/
		/**** md5 signature: c6dbd64b34b1b8aee5f8b991c978c439 ****/
		%feature("compactdefaultargs") RWStepElement_RWCurveElementSectionDerivedDefinitions;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWCurveElementSectionDerivedDefinitions;
		 RWStepElement_RWCurveElementSectionDerivedDefinitions();

		/****************** ReadStep ******************/
		/**** md5 signature: b34ee2686177198a764a07a896ac2c89 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementsectionderiveddefinitions.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_CurveElementSectionDerivedDefinitions

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_CurveElementSectionDerivedDefinitions> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3d07ca670f954d5ce7b7b39d37b1a550 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_CurveElementSectionDerivedDefinitions
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_CurveElementSectionDerivedDefinitions> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d0e7a6c8f783b1864e27cabc0f77b3cf ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementsectionderiveddefinitions.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_CurveElementSectionDerivedDefinitions

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_CurveElementSectionDerivedDefinitions> & ent);

};


%extend RWStepElement_RWCurveElementSectionDerivedDefinitions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepElement_RWElementDescriptor *
******************************************/
class RWStepElement_RWElementDescriptor {
	public:
		/****************** RWStepElement_RWElementDescriptor ******************/
		/**** md5 signature: a45fa2e50dbeeaf68640e09dfbe19073 ****/
		%feature("compactdefaultargs") RWStepElement_RWElementDescriptor;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWElementDescriptor;
		 RWStepElement_RWElementDescriptor();

		/****************** ReadStep ******************/
		/**** md5 signature: 7790337f4d6ff39ca050a70020afa4bb ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads elementdescriptor.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_ElementDescriptor

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_ElementDescriptor> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2a9bc9dad23eb43f918134446045915c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_ElementDescriptor
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_ElementDescriptor> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b87c6a422d04a381cbfbd4ef904cd9ab ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes elementdescriptor.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_ElementDescriptor

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_ElementDescriptor> & ent);

};


%extend RWStepElement_RWElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepElement_RWElementMaterial *
****************************************/
class RWStepElement_RWElementMaterial {
	public:
		/****************** RWStepElement_RWElementMaterial ******************/
		/**** md5 signature: 14188cae43401587af8f656bff6162fe ****/
		%feature("compactdefaultargs") RWStepElement_RWElementMaterial;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWElementMaterial;
		 RWStepElement_RWElementMaterial();

		/****************** ReadStep ******************/
		/**** md5 signature: 1e0614dd64aa3b58415ad1b2c4057668 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads elementmaterial.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_ElementMaterial

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_ElementMaterial> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5aecb31a2d76976ac7d9c6834c7f5f61 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_ElementMaterial
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_ElementMaterial> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 7d38b32dcdb9f1a50b1d01a59bac1af8 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes elementmaterial.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_ElementMaterial

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_ElementMaterial> & ent);

};


%extend RWStepElement_RWElementMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepElement_RWSurface3dElementDescriptor *
***************************************************/
class RWStepElement_RWSurface3dElementDescriptor {
	public:
		/****************** RWStepElement_RWSurface3dElementDescriptor ******************/
		/**** md5 signature: 28b644102c405af28e617432ae7ee97f ****/
		%feature("compactdefaultargs") RWStepElement_RWSurface3dElementDescriptor;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWSurface3dElementDescriptor;
		 RWStepElement_RWSurface3dElementDescriptor();

		/****************** ReadStep ******************/
		/**** md5 signature: b270d4a1377a9b08099647b2155fcd92 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads surface3delementdescriptor.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_Surface3dElementDescriptor

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_Surface3dElementDescriptor> & ent);

		/****************** Share ******************/
		/**** md5 signature: c1178821ac9be76546ef087e1945c2ca ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_Surface3dElementDescriptor
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_Surface3dElementDescriptor> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b6d3bce94fe022d16a1fbfd0d48d061b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes surface3delementdescriptor.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_Surface3dElementDescriptor

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_Surface3dElementDescriptor> & ent);

};


%extend RWStepElement_RWSurface3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepElement_RWSurfaceElementProperty *
***********************************************/
class RWStepElement_RWSurfaceElementProperty {
	public:
		/****************** RWStepElement_RWSurfaceElementProperty ******************/
		/**** md5 signature: b2e9af50d2b29f78f0a0f43ca1b87eac ****/
		%feature("compactdefaultargs") RWStepElement_RWSurfaceElementProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWSurfaceElementProperty;
		 RWStepElement_RWSurfaceElementProperty();

		/****************** ReadStep ******************/
		/**** md5 signature: fd509244f9568cadaf0cd094979627da ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads surfaceelementproperty.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_SurfaceElementProperty

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_SurfaceElementProperty> & ent);

		/****************** Share ******************/
		/**** md5 signature: a9cd6d0fbeccb28142f0cad87c5aa8c1 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_SurfaceElementProperty
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_SurfaceElementProperty> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2a4337d3fa6a65e2f39ecc4ef88a8137 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes surfaceelementproperty.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_SurfaceElementProperty

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_SurfaceElementProperty> & ent);

};


%extend RWStepElement_RWSurfaceElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepElement_RWSurfaceSection *
***************************************/
class RWStepElement_RWSurfaceSection {
	public:
		/****************** RWStepElement_RWSurfaceSection ******************/
		/**** md5 signature: 20d0fe23ad94d93a6980b49438a265ed ****/
		%feature("compactdefaultargs") RWStepElement_RWSurfaceSection;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWSurfaceSection;
		 RWStepElement_RWSurfaceSection();

		/****************** ReadStep ******************/
		/**** md5 signature: 040d888912c74439faecfdb462a31ecb ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads surfacesection.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_SurfaceSection

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_SurfaceSection> & ent);

		/****************** Share ******************/
		/**** md5 signature: 8f43ddfce73e62755a6421b430211663 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_SurfaceSection
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_SurfaceSection> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c2bed9de3c608d1a7ac26535b0619276 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes surfacesection.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_SurfaceSection

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_SurfaceSection> & ent);

};


%extend RWStepElement_RWSurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepElement_RWSurfaceSectionField *
********************************************/
class RWStepElement_RWSurfaceSectionField {
	public:
		/****************** RWStepElement_RWSurfaceSectionField ******************/
		/**** md5 signature: 3efc7eb4d86bcbac7bf0bc4ed1b8b146 ****/
		%feature("compactdefaultargs") RWStepElement_RWSurfaceSectionField;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWSurfaceSectionField;
		 RWStepElement_RWSurfaceSectionField();

		/****************** ReadStep ******************/
		/**** md5 signature: dea6dbb3a05946ba6abdfbb9573f6819 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads surfacesectionfield.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_SurfaceSectionField

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_SurfaceSectionField> & ent);

		/****************** Share ******************/
		/**** md5 signature: cdd5105f5da9beb4050ce55886266e4b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_SurfaceSectionField
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_SurfaceSectionField> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b53e5dcecbae03eca121ae0d40f064f7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes surfacesectionfield.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_SurfaceSectionField

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_SurfaceSectionField> & ent);

};


%extend RWStepElement_RWSurfaceSectionField {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepElement_RWSurfaceSectionFieldConstant *
****************************************************/
class RWStepElement_RWSurfaceSectionFieldConstant {
	public:
		/****************** RWStepElement_RWSurfaceSectionFieldConstant ******************/
		/**** md5 signature: d4aa090fc6580823e965bbbfcac3d80d ****/
		%feature("compactdefaultargs") RWStepElement_RWSurfaceSectionFieldConstant;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWSurfaceSectionFieldConstant;
		 RWStepElement_RWSurfaceSectionFieldConstant();

		/****************** ReadStep ******************/
		/**** md5 signature: 9f438c6dbc0baa695e3e019b68e54694 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads surfacesectionfieldconstant.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_SurfaceSectionFieldConstant

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_SurfaceSectionFieldConstant> & ent);

		/****************** Share ******************/
		/**** md5 signature: 46bf22d4986c8f7af841b9e5d6515b0b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_SurfaceSectionFieldConstant
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_SurfaceSectionFieldConstant> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 81d51d060718ba98cc79470e4ae65cc6 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes surfacesectionfieldconstant.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_SurfaceSectionFieldConstant

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_SurfaceSectionFieldConstant> & ent);

};


%extend RWStepElement_RWSurfaceSectionFieldConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepElement_RWSurfaceSectionFieldVarying *
***************************************************/
class RWStepElement_RWSurfaceSectionFieldVarying {
	public:
		/****************** RWStepElement_RWSurfaceSectionFieldVarying ******************/
		/**** md5 signature: 930ffc37cf7e268e2c0b85af3d65e94e ****/
		%feature("compactdefaultargs") RWStepElement_RWSurfaceSectionFieldVarying;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWSurfaceSectionFieldVarying;
		 RWStepElement_RWSurfaceSectionFieldVarying();

		/****************** ReadStep ******************/
		/**** md5 signature: 779ee7b3e5210bf8b68afcec536caf31 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads surfacesectionfieldvarying.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_SurfaceSectionFieldVarying

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_SurfaceSectionFieldVarying> & ent);

		/****************** Share ******************/
		/**** md5 signature: 11693fcc0883b1e4ef6b36059b95fc95 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_SurfaceSectionFieldVarying
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_SurfaceSectionFieldVarying> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1853aff8b4fd78785ad794802e17e55c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes surfacesectionfieldvarying.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_SurfaceSectionFieldVarying

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_SurfaceSectionFieldVarying> & ent);

};


%extend RWStepElement_RWSurfaceSectionFieldVarying {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepElement_RWUniformSurfaceSection *
**********************************************/
class RWStepElement_RWUniformSurfaceSection {
	public:
		/****************** RWStepElement_RWUniformSurfaceSection ******************/
		/**** md5 signature: 38e8058170e69f843155f7eac76d73df ****/
		%feature("compactdefaultargs") RWStepElement_RWUniformSurfaceSection;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWUniformSurfaceSection;
		 RWStepElement_RWUniformSurfaceSection();

		/****************** ReadStep ******************/
		/**** md5 signature: 0ddec3d07541c1c5b5959861e4fc0fb6 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads uniformsurfacesection.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_UniformSurfaceSection

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_UniformSurfaceSection> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7415b33400cf5737f64a8a4cc900aadb ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_UniformSurfaceSection
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_UniformSurfaceSection> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 5c36312a9536bc1633b672dd2fd6f46c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes uniformsurfacesection.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_UniformSurfaceSection

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_UniformSurfaceSection> & ent);

};


%extend RWStepElement_RWUniformSurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepElement_RWVolume3dElementDescriptor *
**************************************************/
class RWStepElement_RWVolume3dElementDescriptor {
	public:
		/****************** RWStepElement_RWVolume3dElementDescriptor ******************/
		/**** md5 signature: f28d7dd7994c7b73893dbbad84095794 ****/
		%feature("compactdefaultargs") RWStepElement_RWVolume3dElementDescriptor;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepElement_RWVolume3dElementDescriptor;
		 RWStepElement_RWVolume3dElementDescriptor();

		/****************** ReadStep ******************/
		/**** md5 signature: daf18205a7f8b9e19bef80667aa42c83 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads volume3delementdescriptor.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepElement_Volume3dElementDescriptor

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepElement_Volume3dElementDescriptor> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7582c9d3c66fdb0de8914f8841366c04 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepElement_Volume3dElementDescriptor
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepElement_Volume3dElementDescriptor> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e0d58dbb60e5fa74fcead658131316bf ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes volume3delementdescriptor.

Parameters
----------
SW: StepData_StepWriter
ent: StepElement_Volume3dElementDescriptor

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepElement_Volume3dElementDescriptor> & ent);

};


%extend RWStepElement_RWVolume3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
