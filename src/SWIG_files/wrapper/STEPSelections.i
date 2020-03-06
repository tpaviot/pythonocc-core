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
%define STEPSELECTIONSDOCSTRING
"STEPSelections module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepselections.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
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
%template(STEPSelections_SequenceOfAssemblyLink) NCollection_Sequence<opencascade::handle<STEPSelections_AssemblyLink>>;
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
		/****************** STEPSelections_AssemblyComponent ******************/
		%feature("compactdefaultargs") STEPSelections_AssemblyComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPSelections_AssemblyComponent;
		 STEPSelections_AssemblyComponent();

		/****************** STEPSelections_AssemblyComponent ******************/
		%feature("compactdefaultargs") STEPSelections_AssemblyComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
sdr: StepShape_ShapeDefinitionRepresentation
list: STEPSelections_HSequenceOfAssemblyLink

Returns
-------
None
") STEPSelections_AssemblyComponent;
		 STEPSelections_AssemblyComponent(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & sdr, const opencascade::handle<STEPSelections_HSequenceOfAssemblyLink> & list);

		/****************** GetList ******************/
		%feature("compactdefaultargs") GetList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<STEPSelections_HSequenceOfAssemblyLink>
") GetList;
		opencascade::handle<STEPSelections_HSequenceOfAssemblyLink> GetList();

		/****************** GetSDR ******************/
		%feature("compactdefaultargs") GetSDR;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_ShapeDefinitionRepresentation>
") GetSDR;
		opencascade::handle<StepShape_ShapeDefinitionRepresentation> GetSDR();

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "No available documentation.

Parameters
----------
list: STEPSelections_HSequenceOfAssemblyLink

Returns
-------
None
") SetList;
		void SetList(const opencascade::handle<STEPSelections_HSequenceOfAssemblyLink> & list);

		/****************** SetSDR ******************/
		%feature("compactdefaultargs") SetSDR;
		%feature("autodoc", "No available documentation.

Parameters
----------
sdr: StepShape_ShapeDefinitionRepresentation

Returns
-------
None
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
		/****************** STEPSelections_AssemblyExplorer ******************/
		%feature("compactdefaultargs") STEPSelections_AssemblyExplorer;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: Interface_Graph

Returns
-------
None
") STEPSelections_AssemblyExplorer;
		 STEPSelections_AssemblyExplorer(const Interface_Graph & G);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FillListWithGraph ******************/
		%feature("compactdefaultargs") FillListWithGraph;
		%feature("autodoc", "No available documentation.

Parameters
----------
cmp: STEPSelections_AssemblyComponent

Returns
-------
None
") FillListWithGraph;
		void FillListWithGraph(const opencascade::handle<STEPSelections_AssemblyComponent> & cmp);

		/****************** FindItemWithNAUO ******************/
		%feature("compactdefaultargs") FindItemWithNAUO;
		%feature("autodoc", "No available documentation.

Parameters
----------
nauo: StepRepr_NextAssemblyUsageOccurrence

Returns
-------
opencascade::handle<Standard_Transient>
") FindItemWithNAUO;
		opencascade::handle<Standard_Transient> FindItemWithNAUO(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

		/****************** FindSDRWithProduct ******************/
		%feature("compactdefaultargs") FindSDRWithProduct;
		%feature("autodoc", "No available documentation.

Parameters
----------
product: StepBasic_ProductDefinition

Returns
-------
opencascade::handle<StepShape_ShapeDefinitionRepresentation>
") FindSDRWithProduct;
		opencascade::handle<StepShape_ShapeDefinitionRepresentation> FindSDRWithProduct(const opencascade::handle<StepBasic_ProductDefinition> & product);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: Interface_Graph

Returns
-------
None
") Init;
		void Init(const Interface_Graph & G);

		/****************** NbAssemblies ******************/
		%feature("compactdefaultargs") NbAssemblies;
		%feature("autodoc", "Returns the number of root assemblies;.

Returns
-------
int
") NbAssemblies;
		Standard_Integer NbAssemblies();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns root of assenbly by its rank;.

Parameters
----------
rank: int,optional
	default value is 1

Returns
-------
opencascade::handle<STEPSelections_AssemblyComponent>
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
		/****************** STEPSelections_AssemblyLink ******************/
		%feature("compactdefaultargs") STEPSelections_AssemblyLink;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPSelections_AssemblyLink;
		 STEPSelections_AssemblyLink();

		/****************** STEPSelections_AssemblyLink ******************/
		%feature("compactdefaultargs") STEPSelections_AssemblyLink;
		%feature("autodoc", "No available documentation.

Parameters
----------
nauo: StepRepr_NextAssemblyUsageOccurrence
item: Standard_Transient
part: STEPSelections_AssemblyComponent

Returns
-------
None
") STEPSelections_AssemblyLink;
		 STEPSelections_AssemblyLink(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo, const opencascade::handle<Standard_Transient> & item, const opencascade::handle<STEPSelections_AssemblyComponent> & part);

		/****************** GetComponent ******************/
		%feature("compactdefaultargs") GetComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<STEPSelections_AssemblyComponent>
") GetComponent;
		opencascade::handle<STEPSelections_AssemblyComponent> GetComponent();

		/****************** GetItem ******************/
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Transient>
") GetItem;
		opencascade::handle<Standard_Transient> GetItem();

		/****************** GetNAUO ******************/
		%feature("compactdefaultargs") GetNAUO;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>
") GetNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetNAUO();

		/****************** SetComponent ******************/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
part: STEPSelections_AssemblyComponent

Returns
-------
None
") SetComponent;
		void SetComponent(const opencascade::handle<STEPSelections_AssemblyComponent> & part);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
item: Standard_Transient

Returns
-------
None
") SetItem;
		void SetItem(const opencascade::handle<Standard_Transient> & item);

		/****************** SetNAUO ******************/
		%feature("compactdefaultargs") SetNAUO;
		%feature("autodoc", "No available documentation.

Parameters
----------
nauo: StepRepr_NextAssemblyUsageOccurrence

Returns
-------
None
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
		/****************** STEPSelections_Counter ******************/
		%feature("compactdefaultargs") STEPSelections_Counter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPSelections_Counter;
		 STEPSelections_Counter();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "No available documentation.

Parameters
----------
graph: Interface_Graph
start: Standard_Transient

Returns
-------
None
") Count;
		void Count(const Interface_Graph & graph, const opencascade::handle<Standard_Transient> & start);

		/****************** NbInstancesOfEdges ******************/
		%feature("compactdefaultargs") NbInstancesOfEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbInstancesOfEdges;
		Standard_Integer NbInstancesOfEdges();

		/****************** NbInstancesOfFaces ******************/
		%feature("compactdefaultargs") NbInstancesOfFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbInstancesOfFaces;
		Standard_Integer NbInstancesOfFaces();

		/****************** NbInstancesOfShells ******************/
		%feature("compactdefaultargs") NbInstancesOfShells;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbInstancesOfShells;
		Standard_Integer NbInstancesOfShells();

		/****************** NbInstancesOfSolids ******************/
		%feature("compactdefaultargs") NbInstancesOfSolids;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbInstancesOfSolids;
		Standard_Integer NbInstancesOfSolids();

		/****************** NbInstancesOfWires ******************/
		%feature("compactdefaultargs") NbInstancesOfWires;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbInstancesOfWires;
		Standard_Integer NbInstancesOfWires();

		/****************** NbSourceEdges ******************/
		%feature("compactdefaultargs") NbSourceEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSourceEdges;
		Standard_Integer NbSourceEdges();

		/****************** NbSourceFaces ******************/
		%feature("compactdefaultargs") NbSourceFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSourceFaces;
		Standard_Integer NbSourceFaces();

		/****************** NbSourceShells ******************/
		%feature("compactdefaultargs") NbSourceShells;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSourceShells;
		Standard_Integer NbSourceShells();

		/****************** NbSourceSolids ******************/
		%feature("compactdefaultargs") NbSourceSolids;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSourceSolids;
		Standard_Integer NbSourceSolids();

		/****************** NbSourceWires ******************/
		%feature("compactdefaultargs") NbSourceWires;
		%feature("autodoc", "No available documentation.

Returns
-------
int
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
		/****************** STEPSelections_SelectAssembly ******************/
		%feature("compactdefaultargs") STEPSelections_SelectAssembly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPSelections_SelectAssembly;
		 STEPSelections_SelectAssembly();

		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Explores an entity, to take its faces works recursively.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'assembly structures'.

Returns
-------
TCollection_AsciiString
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
		/****************** STEPSelections_SelectDerived ******************/
		%feature("compactdefaultargs") STEPSelections_SelectDerived;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPSelections_SelectDerived;
		 STEPSelections_SelectDerived();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel
text: TCollection_AsciiString
exact: bool

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model, const TCollection_AsciiString & text, const Standard_Boolean exact);

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
		/****************** STEPSelections_SelectFaces ******************/
		%feature("compactdefaultargs") STEPSelections_SelectFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPSelections_SelectFaces;
		 STEPSelections_SelectFaces();

		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Explores an entity, to take its faces works recursively.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'faces'.

Returns
-------
TCollection_AsciiString
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
		/****************** STEPSelections_SelectForTransfer ******************/
		%feature("compactdefaultargs") STEPSelections_SelectForTransfer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPSelections_SelectForTransfer;
		 STEPSelections_SelectForTransfer();

		/****************** STEPSelections_SelectForTransfer ******************/
		%feature("compactdefaultargs") STEPSelections_SelectForTransfer;
		%feature("autodoc", "No available documentation.

Parameters
----------
TR: XSControl_TransferReader

Returns
-------
None
") STEPSelections_SelectForTransfer;
		 STEPSelections_SelectForTransfer(const opencascade::handle<XSControl_TransferReader> & TR);

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
		/****************** STEPSelections_SelectGSCurves ******************/
		%feature("compactdefaultargs") STEPSelections_SelectGSCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPSelections_SelectGSCurves;
		 STEPSelections_SelectGSCurves();

		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "No available documentation.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'curves'.

Returns
-------
TCollection_AsciiString
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
		/****************** STEPSelections_SelectInstances ******************/
		%feature("compactdefaultargs") STEPSelections_SelectInstances;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPSelections_SelectInstances;
		 STEPSelections_SelectInstances();

		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "No available documentation.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'instances'.

Returns
-------
TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
class STEPSelections_HSequenceOfAssemblyLink : public  STEPSelections_SequenceOfAssemblyLink, public Standard_Transient {
  public:
    STEPSelections_HSequenceOfAssemblyLink();
    STEPSelections_HSequenceOfAssemblyLink(const  STEPSelections_SequenceOfAssemblyLink& theOther);
    const  STEPSelections_SequenceOfAssemblyLink& Sequence();
    void Append (const  STEPSelections_SequenceOfAssemblyLink::value_type& theItem);
    void Append ( STEPSelections_SequenceOfAssemblyLink& theSequence);
     STEPSelections_SequenceOfAssemblyLink& ChangeSequence();
};
%make_alias(STEPSelections_HSequenceOfAssemblyLink)


