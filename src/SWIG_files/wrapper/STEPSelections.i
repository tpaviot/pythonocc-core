/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define STEPSELECTIONSDOCSTRING
"STEPSelections module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepselections.html"
%enddef
%module (package="OCC.Core", docstring=STEPSELECTIONSDOCSTRING) STEPSelections


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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<STEPSelections_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepShape_module.hxx>
#include<Interface_module.hxx>
#include<StepRepr_module.hxx>
#include<StepBasic_module.hxx>
#include<IFSelect_module.hxx>
#include<TCollection_module.hxx>
#include<XSControl_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<TopoDS_module.hxx>
#include<StepGeom_module.hxx>
#include<TopTools_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<StepData_module.hxx>
#include<Transfer_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Resource_module.hxx>
#include<TDF_module.hxx>
#include<TDocStd_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
#include<DE_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepShape.i
%import Interface.i
%import StepRepr.i
%import StepBasic.i
%import IFSelect.i
%import TCollection.i
%import XSControl.i

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
%wrap_handle(STEPSelections_AssemblyComponent)
%wrap_handle(STEPSelections_AssemblyLink)
%wrap_handle(STEPSelections_SelectAssembly)
%wrap_handle(STEPSelections_SelectDerived)
%wrap_handle(STEPSelections_SelectFaces)
%wrap_handle(STEPSelections_SelectForTransfer)
%wrap_handle(STEPSelections_SelectGSCurves)
%wrap_handle(STEPSelections_SelectInstances)
%wrap_handle(STEPSelections_HSequenceOfAssemblyLink)
/* end handles declaration */

/* templates */
%template(STEPSelections_SequenceOfAssemblyComponent) NCollection_Sequence<opencascade::handle<STEPSelections_AssemblyComponent>>;

%extend NCollection_Sequence<opencascade::handle<STEPSelections_AssemblyComponent>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(STEPSelections_SequenceOfAssemblyLink) NCollection_Sequence<opencascade::handle<STEPSelections_AssemblyLink>>;

%extend NCollection_Sequence<opencascade::handle<STEPSelections_AssemblyLink>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<STEPSelections_AssemblyComponent>> STEPSelections_SequenceOfAssemblyComponent;
typedef NCollection_Sequence<opencascade::handle<STEPSelections_AssemblyLink>> STEPSelections_SequenceOfAssemblyLink;
/* end typedefs declaration */

/*****************************************
* class STEPSelections_AssemblyComponent *
*****************************************/
class STEPSelections_AssemblyComponent : public Standard_Transient {
	public:
		/****** STEPSelections_AssemblyComponent::STEPSelections_AssemblyComponent ******/
		/****** md5 signature: 32e790d81d59d215db6fe065306bbf2d ******/
		%feature("compactdefaultargs") STEPSelections_AssemblyComponent;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_AssemblyComponent;
		 STEPSelections_AssemblyComponent();

		/****** STEPSelections_AssemblyComponent::STEPSelections_AssemblyComponent ******/
		/****** md5 signature: 821e42438f5d9172f23f58083dfdec94 ******/
		%feature("compactdefaultargs") STEPSelections_AssemblyComponent;
		%feature("autodoc", "
Parameters
----------
sdr: StepShape_ShapeDefinitionRepresentation
list: STEPSelections_HSequenceOfAssemblyLink

Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_AssemblyComponent;
		 STEPSelections_AssemblyComponent(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & sdr, const opencascade::handle<STEPSelections_HSequenceOfAssemblyLink> & list);

		/****** STEPSelections_AssemblyComponent::GetList ******/
		/****** md5 signature: baa8fc1d4da39ad20abb9d73054d97b8 ******/
		%feature("compactdefaultargs") GetList;
		%feature("autodoc", "Return
-------
opencascade::handle<STEPSelections_HSequenceOfAssemblyLink>

Description
-----------
No available documentation.
") GetList;
		opencascade::handle<STEPSelections_HSequenceOfAssemblyLink> GetList();

		/****** STEPSelections_AssemblyComponent::GetSDR ******/
		/****** md5 signature: faabed04bfe8f4d021f36796932db420 ******/
		%feature("compactdefaultargs") GetSDR;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_ShapeDefinitionRepresentation>

Description
-----------
No available documentation.
") GetSDR;
		opencascade::handle<StepShape_ShapeDefinitionRepresentation> GetSDR();

		/****** STEPSelections_AssemblyComponent::SetList ******/
		/****** md5 signature: ced6586bf0d104075ad70c1d1486179d ******/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "
Parameters
----------
list: STEPSelections_HSequenceOfAssemblyLink

Return
-------
None

Description
-----------
No available documentation.
") SetList;
		void SetList(const opencascade::handle<STEPSelections_HSequenceOfAssemblyLink> & list);

		/****** STEPSelections_AssemblyComponent::SetSDR ******/
		/****** md5 signature: 6e7bfe74d0634693e540292c51836b91 ******/
		%feature("compactdefaultargs") SetSDR;
		%feature("autodoc", "
Parameters
----------
sdr: StepShape_ShapeDefinitionRepresentation

Return
-------
None

Description
-----------
No available documentation.
") SetSDR;
		void SetSDR(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & sdr);

};


%make_alias(STEPSelections_AssemblyComponent)

%extend STEPSelections_AssemblyComponent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class STEPSelections_AssemblyExplorer *
****************************************/
class STEPSelections_AssemblyExplorer {
	public:
		/****** STEPSelections_AssemblyExplorer::STEPSelections_AssemblyExplorer ******/
		/****** md5 signature: fdc8f8c7910a65f2a71d0b6104c7397a ******/
		%feature("compactdefaultargs") STEPSelections_AssemblyExplorer;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_AssemblyExplorer;
		 STEPSelections_AssemblyExplorer(const Interface_Graph & G);

		/****** STEPSelections_AssemblyExplorer::Dump ******/
		/****** md5 signature: e60d722f65a7811be636699da7600e78 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
os: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** STEPSelections_AssemblyExplorer::FillListWithGraph ******/
		/****** md5 signature: 22e0b69a9c944196630d2867ebc6b70f ******/
		%feature("compactdefaultargs") FillListWithGraph;
		%feature("autodoc", "
Parameters
----------
cmp: STEPSelections_AssemblyComponent

Return
-------
None

Description
-----------
No available documentation.
") FillListWithGraph;
		void FillListWithGraph(const opencascade::handle<STEPSelections_AssemblyComponent> & cmp);

		/****** STEPSelections_AssemblyExplorer::FindItemWithNAUO ******/
		/****** md5 signature: e2a54179df4ab2934bcad10c5ac138fd ******/
		%feature("compactdefaultargs") FindItemWithNAUO;
		%feature("autodoc", "
Parameters
----------
nauo: StepRepr_NextAssemblyUsageOccurrence

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") FindItemWithNAUO;
		opencascade::handle<Standard_Transient> FindItemWithNAUO(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

		/****** STEPSelections_AssemblyExplorer::FindSDRWithProduct ******/
		/****** md5 signature: 88a8e6eaf98f8610f6c56d359cbfb155 ******/
		%feature("compactdefaultargs") FindSDRWithProduct;
		%feature("autodoc", "
Parameters
----------
product: StepBasic_ProductDefinition

Return
-------
opencascade::handle<StepShape_ShapeDefinitionRepresentation>

Description
-----------
No available documentation.
") FindSDRWithProduct;
		opencascade::handle<StepShape_ShapeDefinitionRepresentation> FindSDRWithProduct(const opencascade::handle<StepBasic_ProductDefinition> & product);

		/****** STEPSelections_AssemblyExplorer::Init ******/
		/****** md5 signature: 789fbd47d4f3eae4e3e863adce44c5e6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Interface_Graph & G);

		/****** STEPSelections_AssemblyExplorer::NbAssemblies ******/
		/****** md5 signature: dc1428818eb91c6e976d2aeb6e16644c ******/
		%feature("compactdefaultargs") NbAssemblies;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of root assemblies;.
") NbAssemblies;
		Standard_Integer NbAssemblies();

		/****** STEPSelections_AssemblyExplorer::Root ******/
		/****** md5 signature: d67d3cf147a9ad9c102eb501ae27dfa6 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "
Parameters
----------
rank: int (optional, default to 1)

Return
-------
opencascade::handle<STEPSelections_AssemblyComponent>

Description
-----------
Returns root of assenbly by its rank;.
") Root;
		opencascade::handle<STEPSelections_AssemblyComponent> Root(const Standard_Integer rank = 1);

};


%extend STEPSelections_AssemblyExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class STEPSelections_AssemblyLink *
************************************/
class STEPSelections_AssemblyLink : public Standard_Transient {
	public:
		/****** STEPSelections_AssemblyLink::STEPSelections_AssemblyLink ******/
		/****** md5 signature: 3ceeec835491a573f647ade2fab6ea36 ******/
		%feature("compactdefaultargs") STEPSelections_AssemblyLink;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_AssemblyLink;
		 STEPSelections_AssemblyLink();

		/****** STEPSelections_AssemblyLink::STEPSelections_AssemblyLink ******/
		/****** md5 signature: f2f4aae7db5025aac161cc69c8341168 ******/
		%feature("compactdefaultargs") STEPSelections_AssemblyLink;
		%feature("autodoc", "
Parameters
----------
nauo: StepRepr_NextAssemblyUsageOccurrence
item: Standard_Transient
part: STEPSelections_AssemblyComponent

Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_AssemblyLink;
		 STEPSelections_AssemblyLink(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo, const opencascade::handle<Standard_Transient> & item, const opencascade::handle<STEPSelections_AssemblyComponent> & part);

		/****** STEPSelections_AssemblyLink::GetComponent ******/
		/****** md5 signature: 139846538b2887742f2dbd35ab86e98c ******/
		%feature("compactdefaultargs") GetComponent;
		%feature("autodoc", "Return
-------
opencascade::handle<STEPSelections_AssemblyComponent>

Description
-----------
No available documentation.
") GetComponent;
		opencascade::handle<STEPSelections_AssemblyComponent> GetComponent();

		/****** STEPSelections_AssemblyLink::GetItem ******/
		/****** md5 signature: 257a5e4f8f1fae22af683d8ef7302666 ******/
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") GetItem;
		opencascade::handle<Standard_Transient> GetItem();

		/****** STEPSelections_AssemblyLink::GetNAUO ******/
		/****** md5 signature: 7b90e221fdc0670e5cb2da71fe791c94 ******/
		%feature("compactdefaultargs") GetNAUO;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>

Description
-----------
No available documentation.
") GetNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetNAUO();

		/****** STEPSelections_AssemblyLink::SetComponent ******/
		/****** md5 signature: 3a621dd54dc444ff167f89bcb90c6bea ******/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "
Parameters
----------
part: STEPSelections_AssemblyComponent

Return
-------
None

Description
-----------
No available documentation.
") SetComponent;
		void SetComponent(const opencascade::handle<STEPSelections_AssemblyComponent> & part);

		/****** STEPSelections_AssemblyLink::SetItem ******/
		/****** md5 signature: 4fc3f8ba5fcb4fef8940f14e2c460b45 ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") SetItem;
		void SetItem(const opencascade::handle<Standard_Transient> & item);

		/****** STEPSelections_AssemblyLink::SetNAUO ******/
		/****** md5 signature: d41b58ba9b6e97370d7d607d712179d3 ******/
		%feature("compactdefaultargs") SetNAUO;
		%feature("autodoc", "
Parameters
----------
nauo: StepRepr_NextAssemblyUsageOccurrence

Return
-------
None

Description
-----------
No available documentation.
") SetNAUO;
		void SetNAUO(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

};


%make_alias(STEPSelections_AssemblyLink)

%extend STEPSelections_AssemblyLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class STEPSelections_Counter *
*******************************/
class STEPSelections_Counter {
	public:
		/****** STEPSelections_Counter::STEPSelections_Counter ******/
		/****** md5 signature: d7aec9b58d03911c697c408dbf238e6c ******/
		%feature("compactdefaultargs") STEPSelections_Counter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_Counter;
		 STEPSelections_Counter();

		/****** STEPSelections_Counter::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** STEPSelections_Counter::Count ******/
		/****** md5 signature: aaae47e9af4058b80ccfbcd9f92cca82 ******/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "
Parameters
----------
graph: Interface_Graph
start: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") Count;
		void Count(const Interface_Graph & graph, const opencascade::handle<Standard_Transient> & start);

		/****** STEPSelections_Counter::NbInstancesOfEdges ******/
		/****** md5 signature: 9e707fbb9d2dbae6701f885083bdc38b ******/
		%feature("compactdefaultargs") NbInstancesOfEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbInstancesOfEdges;
		Standard_Integer NbInstancesOfEdges();

		/****** STEPSelections_Counter::NbInstancesOfFaces ******/
		/****** md5 signature: 851afe6e292ce2fbcadfb6dd5bd38b7a ******/
		%feature("compactdefaultargs") NbInstancesOfFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbInstancesOfFaces;
		Standard_Integer NbInstancesOfFaces();

		/****** STEPSelections_Counter::NbInstancesOfShells ******/
		/****** md5 signature: bf0aa7a0b515f3507d98dec1da678382 ******/
		%feature("compactdefaultargs") NbInstancesOfShells;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbInstancesOfShells;
		Standard_Integer NbInstancesOfShells();

		/****** STEPSelections_Counter::NbInstancesOfSolids ******/
		/****** md5 signature: 44ab1c26fdac82059198f4fce331e966 ******/
		%feature("compactdefaultargs") NbInstancesOfSolids;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbInstancesOfSolids;
		Standard_Integer NbInstancesOfSolids();

		/****** STEPSelections_Counter::NbInstancesOfWires ******/
		/****** md5 signature: 0b36afcebca0c1914bc030f3c253be5b ******/
		%feature("compactdefaultargs") NbInstancesOfWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbInstancesOfWires;
		Standard_Integer NbInstancesOfWires();

		/****** STEPSelections_Counter::NbSourceEdges ******/
		/****** md5 signature: 23469679a5d64918a0945574907492ea ******/
		%feature("compactdefaultargs") NbSourceEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSourceEdges;
		Standard_Integer NbSourceEdges();

		/****** STEPSelections_Counter::NbSourceFaces ******/
		/****** md5 signature: 21f8e307b8a8a0e510711cf6f11b8373 ******/
		%feature("compactdefaultargs") NbSourceFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSourceFaces;
		Standard_Integer NbSourceFaces();

		/****** STEPSelections_Counter::NbSourceShells ******/
		/****** md5 signature: ec3c243700aeed99904be52fc3589dda ******/
		%feature("compactdefaultargs") NbSourceShells;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSourceShells;
		Standard_Integer NbSourceShells();

		/****** STEPSelections_Counter::NbSourceSolids ******/
		/****** md5 signature: 12cac9a4b0521efe13743e3b679d14f1 ******/
		%feature("compactdefaultargs") NbSourceSolids;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSourceSolids;
		Standard_Integer NbSourceSolids();

		/****** STEPSelections_Counter::NbSourceWires ******/
		/****** md5 signature: f68145444cef7eff65f860dbccf9bab6 ******/
		%feature("compactdefaultargs") NbSourceWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSourceWires;
		Standard_Integer NbSourceWires();

};


%extend STEPSelections_Counter {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def POP(self):
		pass

	@methodnotwrapped
	def POP2(self):
		pass
	}
};

/**************************************
* class STEPSelections_SelectAssembly *
**************************************/
class STEPSelections_SelectAssembly : public IFSelect_SelectExplore {
	public:
		/****** STEPSelections_SelectAssembly::STEPSelections_SelectAssembly ******/
		/****** md5 signature: 7b4f6e61189a8d7ed2cd8ac46e0024e9 ******/
		%feature("compactdefaultargs") STEPSelections_SelectAssembly;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_SelectAssembly;
		 STEPSelections_SelectAssembly();

		/****** STEPSelections_SelectAssembly::Explore ******/
		/****** md5 signature: 50c4444632fd853033919d1a382f1178 ******/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "
Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Return
-------
bool

Description
-----------
Explores an entity, to take its faces Works recursively.
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****** STEPSelections_SelectAssembly::ExploreLabel ******/
		/****** md5 signature: 6716492c1a431b7aec766a1b00353622 ******/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Assembly structures'.
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

};


%make_alias(STEPSelections_SelectAssembly)

%extend STEPSelections_SelectAssembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class STEPSelections_SelectDerived *
*************************************/
class STEPSelections_SelectDerived : public StepSelect_StepType {
	public:
		/****** STEPSelections_SelectDerived::STEPSelections_SelectDerived ******/
		/****** md5 signature: 03ef2b060e52e9f4bc2fc45e1f6e85fb ******/
		%feature("compactdefaultargs") STEPSelections_SelectDerived;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_SelectDerived;
		 STEPSelections_SelectDerived();

		/****** STEPSelections_SelectDerived::Matches ******/
		/****** md5 signature: 6cdb41c3b6f4c6d9bbd3a66d390d7419 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel
text: str
exact: bool

Return
-------
bool

Description
-----------
No available documentation.
") Matches;
		virtual Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model, TCollection_AsciiString text, const Standard_Boolean exact);

};


%make_alias(STEPSelections_SelectDerived)

%extend STEPSelections_SelectDerived {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class STEPSelections_SelectFaces *
***********************************/
class STEPSelections_SelectFaces : public IFSelect_SelectExplore {
	public:
		/****** STEPSelections_SelectFaces::STEPSelections_SelectFaces ******/
		/****** md5 signature: 279a363ea2ae04ed1d52829b1fa853a9 ******/
		%feature("compactdefaultargs") STEPSelections_SelectFaces;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_SelectFaces;
		 STEPSelections_SelectFaces();

		/****** STEPSelections_SelectFaces::Explore ******/
		/****** md5 signature: 50c4444632fd853033919d1a382f1178 ******/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "
Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Return
-------
bool

Description
-----------
Explores an entity, to take its faces Works recursively.
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****** STEPSelections_SelectFaces::ExploreLabel ******/
		/****** md5 signature: 6716492c1a431b7aec766a1b00353622 ******/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Faces'.
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

};


%make_alias(STEPSelections_SelectFaces)

%extend STEPSelections_SelectFaces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class STEPSelections_SelectForTransfer *
*****************************************/
class STEPSelections_SelectForTransfer : public XSControl_SelectForTransfer {
	public:
		/****** STEPSelections_SelectForTransfer::STEPSelections_SelectForTransfer ******/
		/****** md5 signature: 4f94e20aa4d7091e128746d57df3cc4c ******/
		%feature("compactdefaultargs") STEPSelections_SelectForTransfer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_SelectForTransfer;
		 STEPSelections_SelectForTransfer();

		/****** STEPSelections_SelectForTransfer::STEPSelections_SelectForTransfer ******/
		/****** md5 signature: a829b2fdc494f45e8bacb31082d69ded ******/
		%feature("compactdefaultargs") STEPSelections_SelectForTransfer;
		%feature("autodoc", "
Parameters
----------
TR: XSControl_TransferReader

Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_SelectForTransfer;
		 STEPSelections_SelectForTransfer(const opencascade::handle<XSControl_TransferReader> & TR);

		/****** STEPSelections_SelectForTransfer::RootResult ******/
		/****** md5 signature: 06f84f6b90b9fc5b3d5fc4b15404fb86 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
No available documentation.
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(STEPSelections_SelectForTransfer)

%extend STEPSelections_SelectForTransfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class STEPSelections_SelectGSCurves *
**************************************/
class STEPSelections_SelectGSCurves : public IFSelect_SelectExplore {
	public:
		/****** STEPSelections_SelectGSCurves::STEPSelections_SelectGSCurves ******/
		/****** md5 signature: 25ee0997327dc298bc807f5156f8b539 ******/
		%feature("compactdefaultargs") STEPSelections_SelectGSCurves;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_SelectGSCurves;
		 STEPSelections_SelectGSCurves();

		/****** STEPSelections_SelectGSCurves::Explore ******/
		/****** md5 signature: 50c4444632fd853033919d1a382f1178 ******/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "
Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Return
-------
bool

Description
-----------
No available documentation.
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****** STEPSelections_SelectGSCurves::ExploreLabel ******/
		/****** md5 signature: 6716492c1a431b7aec766a1b00353622 ******/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Curves'.
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

};


%make_alias(STEPSelections_SelectGSCurves)

%extend STEPSelections_SelectGSCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class STEPSelections_SelectInstances *
***************************************/
class STEPSelections_SelectInstances : public IFSelect_SelectExplore {
	public:
		/****** STEPSelections_SelectInstances::STEPSelections_SelectInstances ******/
		/****** md5 signature: 8fa67405d3329777b1df0dfa8a1eefd8 ******/
		%feature("compactdefaultargs") STEPSelections_SelectInstances;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPSelections_SelectInstances;
		 STEPSelections_SelectInstances();

		/****** STEPSelections_SelectInstances::Explore ******/
		/****** md5 signature: 50c4444632fd853033919d1a382f1178 ******/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "
Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Return
-------
bool

Description
-----------
No available documentation.
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****** STEPSelections_SelectInstances::ExploreLabel ******/
		/****** md5 signature: 6716492c1a431b7aec766a1b00353622 ******/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'Instances'.
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

		/****** STEPSelections_SelectInstances::RootResult ******/
		/****** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph

Return
-------
Interface_EntityIterator

Description
-----------
No available documentation.
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(STEPSelections_SelectInstances)

%extend STEPSelections_SelectInstances {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class STEPSelections_HSequenceOfAssemblyLink : public STEPSelections_SequenceOfAssemblyLink, public Standard_Transient {
  public:
    STEPSelections_HSequenceOfAssemblyLink();
    STEPSelections_HSequenceOfAssemblyLink(const STEPSelections_SequenceOfAssemblyLink& theOther);
    const STEPSelections_SequenceOfAssemblyLink& Sequence();
    void Append (const STEPSelections_SequenceOfAssemblyLink::value_type& theItem);
    void Append (STEPSelections_SequenceOfAssemblyLink& theSequence);
    STEPSelections_SequenceOfAssemblyLink& ChangeSequence();
};
%make_alias(STEPSelections_HSequenceOfAssemblyLink)


/* class aliases */
%pythoncode {
}
