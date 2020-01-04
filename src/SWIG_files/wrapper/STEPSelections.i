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
#include<StepRepr_module.hxx>
#include<StepBasic_module.hxx>
#include<Interface_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepShape.i
%import StepRepr.i
%import StepBasic.i
%import Interface.i
%import IFSelect.i
%import TCollection.i
%import XSControl.i
/* public enums */
/* end public enums declaration */

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
%template(STEPSelections_SequenceOfAssemblyLink) NCollection_Sequence <opencascade::handle <STEPSelections_AssemblyLink>>;
%template(STEPSelections_SequenceOfAssemblyComponent) NCollection_Sequence <opencascade::handle <STEPSelections_AssemblyComponent>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <STEPSelections_AssemblyLink>> STEPSelections_SequenceOfAssemblyLink;
typedef NCollection_Sequence <opencascade::handle <STEPSelections_AssemblyComponent>> STEPSelections_SequenceOfAssemblyComponent;
/* end typedefs declaration */

/*****************************************
* class STEPSelections_AssemblyComponent *
*****************************************/
class STEPSelections_AssemblyComponent : public Standard_Transient {
	public:
		/****************** GetList ******************/
		%feature("compactdefaultargs") GetList;
		%feature("autodoc", ":rtype: opencascade::handle<STEPSelections_HSequenceOfAssemblyLink>") GetList;
		opencascade::handle<STEPSelections_HSequenceOfAssemblyLink> GetList ();

		/****************** GetSDR ******************/
		%feature("compactdefaultargs") GetSDR;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_ShapeDefinitionRepresentation>") GetSDR;
		opencascade::handle<StepShape_ShapeDefinitionRepresentation> GetSDR ();

		/****************** STEPSelections_AssemblyComponent ******************/
		%feature("compactdefaultargs") STEPSelections_AssemblyComponent;
		%feature("autodoc", ":rtype: None") STEPSelections_AssemblyComponent;
		 STEPSelections_AssemblyComponent ();

		/****************** STEPSelections_AssemblyComponent ******************/
		%feature("compactdefaultargs") STEPSelections_AssemblyComponent;
		%feature("autodoc", ":param sdr:
	:type sdr: StepShape_ShapeDefinitionRepresentation
	:param list:
	:type list: STEPSelections_HSequenceOfAssemblyLink
	:rtype: None") STEPSelections_AssemblyComponent;
		 STEPSelections_AssemblyComponent (const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & sdr,const opencascade::handle<STEPSelections_HSequenceOfAssemblyLink> & list);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", ":param list:
	:type list: STEPSelections_HSequenceOfAssemblyLink
	:rtype: None") SetList;
		void SetList (const opencascade::handle<STEPSelections_HSequenceOfAssemblyLink> & list);

		/****************** SetSDR ******************/
		%feature("compactdefaultargs") SetSDR;
		%feature("autodoc", ":param sdr:
	:type sdr: StepShape_ShapeDefinitionRepresentation
	:rtype: None") SetSDR;
		void SetSDR (const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & sdr);

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

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** FillListWithGraph ******************/
		%feature("compactdefaultargs") FillListWithGraph;
		%feature("autodoc", ":param cmp:
	:type cmp: STEPSelections_AssemblyComponent
	:rtype: None") FillListWithGraph;
		void FillListWithGraph (const opencascade::handle<STEPSelections_AssemblyComponent> & cmp);

		/****************** FindItemWithNAUO ******************/
		%feature("compactdefaultargs") FindItemWithNAUO;
		%feature("autodoc", ":param nauo:
	:type nauo: StepRepr_NextAssemblyUsageOccurrence
	:rtype: opencascade::handle<Standard_Transient>") FindItemWithNAUO;
		opencascade::handle<Standard_Transient> FindItemWithNAUO (const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

		/****************** FindSDRWithProduct ******************/
		%feature("compactdefaultargs") FindSDRWithProduct;
		%feature("autodoc", ":param product:
	:type product: StepBasic_ProductDefinition
	:rtype: opencascade::handle<StepShape_ShapeDefinitionRepresentation>") FindSDRWithProduct;
		opencascade::handle<StepShape_ShapeDefinitionRepresentation> FindSDRWithProduct (const opencascade::handle<StepBasic_ProductDefinition> & product);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param G:
	:type G: Interface_Graph
	:rtype: None") Init;
		void Init (const Interface_Graph & G);

		/****************** NbAssemblies ******************/
		%feature("compactdefaultargs") NbAssemblies;
		%feature("autodoc", "* Returns the number of root assemblies;
	:rtype: int") NbAssemblies;
		Standard_Integer NbAssemblies ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "* Returns root of assenbly by its rank;
	:param rank: default value is 1
	:type rank: int
	:rtype: opencascade::handle<STEPSelections_AssemblyComponent>") Root;
		opencascade::handle<STEPSelections_AssemblyComponent> Root (const Standard_Integer rank = 1);

		/****************** STEPSelections_AssemblyExplorer ******************/
		%feature("compactdefaultargs") STEPSelections_AssemblyExplorer;
		%feature("autodoc", ":param G:
	:type G: Interface_Graph
	:rtype: None") STEPSelections_AssemblyExplorer;
		 STEPSelections_AssemblyExplorer (const Interface_Graph & G);

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
		/****************** GetComponent ******************/
		%feature("compactdefaultargs") GetComponent;
		%feature("autodoc", ":rtype: opencascade::handle<STEPSelections_AssemblyComponent>") GetComponent;
		opencascade::handle<STEPSelections_AssemblyComponent> GetComponent ();

		/****************** GetItem ******************/
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", ":rtype: opencascade::handle<Standard_Transient>") GetItem;
		opencascade::handle<Standard_Transient> GetItem ();

		/****************** GetNAUO ******************/
		%feature("compactdefaultargs") GetNAUO;
		%feature("autodoc", ":rtype: opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>") GetNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetNAUO ();

		/****************** STEPSelections_AssemblyLink ******************/
		%feature("compactdefaultargs") STEPSelections_AssemblyLink;
		%feature("autodoc", ":rtype: None") STEPSelections_AssemblyLink;
		 STEPSelections_AssemblyLink ();

		/****************** STEPSelections_AssemblyLink ******************/
		%feature("compactdefaultargs") STEPSelections_AssemblyLink;
		%feature("autodoc", ":param nauo:
	:type nauo: StepRepr_NextAssemblyUsageOccurrence
	:param item:
	:type item: Standard_Transient
	:param part:
	:type part: STEPSelections_AssemblyComponent
	:rtype: None") STEPSelections_AssemblyLink;
		 STEPSelections_AssemblyLink (const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo,const opencascade::handle<Standard_Transient> & item,const opencascade::handle<STEPSelections_AssemblyComponent> & part);

		/****************** SetComponent ******************/
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", ":param part:
	:type part: STEPSelections_AssemblyComponent
	:rtype: None") SetComponent;
		void SetComponent (const opencascade::handle<STEPSelections_AssemblyComponent> & part);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", ":param item:
	:type item: Standard_Transient
	:rtype: None") SetItem;
		void SetItem (const opencascade::handle<Standard_Transient> & item);

		/****************** SetNAUO ******************/
		%feature("compactdefaultargs") SetNAUO;
		%feature("autodoc", ":param nauo:
	:type nauo: StepRepr_NextAssemblyUsageOccurrence
	:rtype: None") SetNAUO;
		void SetNAUO (const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

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
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", ":param graph:
	:type graph: Interface_Graph
	:param start:
	:type start: Standard_Transient
	:rtype: None") Count;
		void Count (const Interface_Graph & graph,const opencascade::handle<Standard_Transient> & start);

		/****************** NbInstancesOfEdges ******************/
		%feature("compactdefaultargs") NbInstancesOfEdges;
		%feature("autodoc", ":rtype: int") NbInstancesOfEdges;
		Standard_Integer NbInstancesOfEdges ();

		/****************** NbInstancesOfFaces ******************/
		%feature("compactdefaultargs") NbInstancesOfFaces;
		%feature("autodoc", ":rtype: int") NbInstancesOfFaces;
		Standard_Integer NbInstancesOfFaces ();

		/****************** NbInstancesOfShells ******************/
		%feature("compactdefaultargs") NbInstancesOfShells;
		%feature("autodoc", ":rtype: int") NbInstancesOfShells;
		Standard_Integer NbInstancesOfShells ();

		/****************** NbInstancesOfSolids ******************/
		%feature("compactdefaultargs") NbInstancesOfSolids;
		%feature("autodoc", ":rtype: int") NbInstancesOfSolids;
		Standard_Integer NbInstancesOfSolids ();

		/****************** NbInstancesOfWires ******************/
		%feature("compactdefaultargs") NbInstancesOfWires;
		%feature("autodoc", ":rtype: int") NbInstancesOfWires;
		Standard_Integer NbInstancesOfWires ();

		/****************** NbSourceEdges ******************/
		%feature("compactdefaultargs") NbSourceEdges;
		%feature("autodoc", ":rtype: int") NbSourceEdges;
		Standard_Integer NbSourceEdges ();

		/****************** NbSourceFaces ******************/
		%feature("compactdefaultargs") NbSourceFaces;
		%feature("autodoc", ":rtype: int") NbSourceFaces;
		Standard_Integer NbSourceFaces ();

		/****************** NbSourceShells ******************/
		%feature("compactdefaultargs") NbSourceShells;
		%feature("autodoc", ":rtype: int") NbSourceShells;
		Standard_Integer NbSourceShells ();

		/****************** NbSourceSolids ******************/
		%feature("compactdefaultargs") NbSourceSolids;
		%feature("autodoc", ":rtype: int") NbSourceSolids;
		Standard_Integer NbSourceSolids ();

		/****************** NbSourceWires ******************/
		%feature("compactdefaultargs") NbSourceWires;
		%feature("autodoc", ":rtype: int") NbSourceWires;
		Standard_Integer NbSourceWires ();

		/****************** STEPSelections_Counter ******************/
		%feature("compactdefaultargs") STEPSelections_Counter;
		%feature("autodoc", ":rtype: None") STEPSelections_Counter;
		 STEPSelections_Counter ();

};


%extend STEPSelections_Counter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class STEPSelections_SelectAssembly *
**************************************/
class STEPSelections_SelectAssembly : public IFSelect_SelectExplore {
	public:
		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "* Explores an entity, to take its faces Works recursively
	:param level:
	:type level: int
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:param explored:
	:type explored: Interface_EntityIterator
	:rtype: bool") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const opencascade::handle<Standard_Transient> & ent,const Interface_Graph & G,Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "* Returns a text defining the criterium : 'Assembly structures'
	:rtype: TCollection_AsciiString") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();

		/****************** STEPSelections_SelectAssembly ******************/
		%feature("compactdefaultargs") STEPSelections_SelectAssembly;
		%feature("autodoc", ":rtype: None") STEPSelections_SelectAssembly;
		 STEPSelections_SelectAssembly ();

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
		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", ":param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:param text:
	:type text: TCollection_AsciiString
	:param exact:
	:type exact: bool
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model,const TCollection_AsciiString & text,const Standard_Boolean exact);

		/****************** STEPSelections_SelectDerived ******************/
		%feature("compactdefaultargs") STEPSelections_SelectDerived;
		%feature("autodoc", ":rtype: None") STEPSelections_SelectDerived;
		 STEPSelections_SelectDerived ();

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
		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "* Explores an entity, to take its faces Works recursively
	:param level:
	:type level: int
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:param explored:
	:type explored: Interface_EntityIterator
	:rtype: bool") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const opencascade::handle<Standard_Transient> & ent,const Interface_Graph & G,Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "* Returns a text defining the criterium : 'Faces'
	:rtype: TCollection_AsciiString") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();

		/****************** STEPSelections_SelectFaces ******************/
		%feature("compactdefaultargs") STEPSelections_SelectFaces;
		%feature("autodoc", ":rtype: None") STEPSelections_SelectFaces;
		 STEPSelections_SelectFaces ();

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
		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", ":param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** STEPSelections_SelectForTransfer ******************/
		%feature("compactdefaultargs") STEPSelections_SelectForTransfer;
		%feature("autodoc", ":rtype: None") STEPSelections_SelectForTransfer;
		 STEPSelections_SelectForTransfer ();

		/****************** STEPSelections_SelectForTransfer ******************/
		%feature("compactdefaultargs") STEPSelections_SelectForTransfer;
		%feature("autodoc", ":param TR:
	:type TR: XSControl_TransferReader
	:rtype: None") STEPSelections_SelectForTransfer;
		 STEPSelections_SelectForTransfer (const opencascade::handle<XSControl_TransferReader> & TR);

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
		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", ":param level:
	:type level: int
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:param explored:
	:type explored: Interface_EntityIterator
	:rtype: bool") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const opencascade::handle<Standard_Transient> & ent,const Interface_Graph & G,Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "* Returns a text defining the criterium : 'Curves'
	:rtype: TCollection_AsciiString") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();

		/****************** STEPSelections_SelectGSCurves ******************/
		%feature("compactdefaultargs") STEPSelections_SelectGSCurves;
		%feature("autodoc", ":rtype: None") STEPSelections_SelectGSCurves;
		 STEPSelections_SelectGSCurves ();

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
		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", ":param level:
	:type level: int
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:param explored:
	:type explored: Interface_EntityIterator
	:rtype: bool") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const opencascade::handle<Standard_Transient> & ent,const Interface_Graph & G,Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "* Returns a text defining the criterium : 'Instances'
	:rtype: TCollection_AsciiString") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", ":param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** STEPSelections_SelectInstances ******************/
		%feature("compactdefaultargs") STEPSelections_SelectInstances;
		%feature("autodoc", ":rtype: None") STEPSelections_SelectInstances;
		 STEPSelections_SelectInstances ();

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


