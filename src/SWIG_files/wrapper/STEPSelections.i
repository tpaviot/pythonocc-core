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
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=STEPSELECTIONSDOCSTRING) STEPSelections

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include STEPSelections_headers.i

/* templates */
%template(STEPSelections_SequenceOfAssemblyLink) NCollection_Sequence <Handle_STEPSelections_AssemblyLink>;
%template(STEPSelections_SequenceOfAssemblyComponent) NCollection_Sequence <Handle_STEPSelections_AssemblyComponent>;
/* end templates declaration */


/* typedefs */
typedef NCollection_Sequence <Handle_STEPSelections_AssemblyLink> STEPSelections_SequenceOfAssemblyLink;
typedef NCollection_Sequence <Handle_STEPSelections_AssemblyComponent> STEPSelections_SequenceOfAssemblyComponent;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(STEPSelections_AssemblyComponent)
%wrap_handle(STEPSelections_AssemblyLink)
%wrap_handle(STEPSelections_SelectAssembly)
%wrap_handle(STEPSelections_SelectDerived)
%wrap_handle(STEPSelections_SelectFaces)
%wrap_handle(STEPSelections_SelectForTransfer)
%wrap_handle(STEPSelections_SelectGSCurves)
%wrap_handle(STEPSelections_SelectInstances)

%nodefaultctor STEPSelections_AssemblyComponent;
class STEPSelections_AssemblyComponent : public Standard_Transient {
	public:
		%feature("compactdefaultargs") GetList;
		%feature("autodoc", "	:rtype: Handle_STEPSelections_HSequenceOfAssemblyLink
") GetList;
		Handle_STEPSelections_HSequenceOfAssemblyLink GetList ();
		%feature("compactdefaultargs") GetSDR;
		%feature("autodoc", "	:rtype: Handle_StepShape_ShapeDefinitionRepresentation
") GetSDR;
		Handle_StepShape_ShapeDefinitionRepresentation GetSDR ();
		%feature("compactdefaultargs") STEPSelections_AssemblyComponent;
		%feature("autodoc", "	:rtype: None
") STEPSelections_AssemblyComponent;
		 STEPSelections_AssemblyComponent ();
		%feature("compactdefaultargs") STEPSelections_AssemblyComponent;
		%feature("autodoc", "	:param sdr:
	:type sdr: Handle_StepShape_ShapeDefinitionRepresentation &
	:param list:
	:type list: Handle_STEPSelections_HSequenceOfAssemblyLink &
	:rtype: None
") STEPSelections_AssemblyComponent;
		 STEPSelections_AssemblyComponent (const Handle_StepShape_ShapeDefinitionRepresentation & sdr,const Handle_STEPSelections_HSequenceOfAssemblyLink & list);
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "	:param list:
	:type list: Handle_STEPSelections_HSequenceOfAssemblyLink &
	:rtype: None
") SetList;
		void SetList (const Handle_STEPSelections_HSequenceOfAssemblyLink & list);
		%feature("compactdefaultargs") SetSDR;
		%feature("autodoc", "	:param sdr:
	:type sdr: Handle_StepShape_ShapeDefinitionRepresentation &
	:rtype: None
") SetSDR;
		void SetSDR (const Handle_StepShape_ShapeDefinitionRepresentation & sdr);
};


%make_alias(STEPSelections_AssemblyComponent)

%extend STEPSelections_AssemblyComponent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_AssemblyExplorer;
class STEPSelections_AssemblyExplorer {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") FillListWithGraph;
		%feature("autodoc", "	:param cmp:
	:type cmp: Handle_STEPSelections_AssemblyComponent &
	:rtype: None
") FillListWithGraph;
		void FillListWithGraph (const Handle_STEPSelections_AssemblyComponent & cmp);
		%feature("compactdefaultargs") FindItemWithNAUO;
		%feature("autodoc", "	:param nauo:
	:type nauo: Handle_StepRepr_NextAssemblyUsageOccurrence &
	:rtype: Handle_Standard_Transient
") FindItemWithNAUO;
		Handle_Standard_Transient FindItemWithNAUO (const Handle_StepRepr_NextAssemblyUsageOccurrence & nauo);
		%feature("compactdefaultargs") FindSDRWithProduct;
		%feature("autodoc", "	:param product:
	:type product: Handle_StepBasic_ProductDefinition &
	:rtype: Handle_StepShape_ShapeDefinitionRepresentation
") FindSDRWithProduct;
		Handle_StepShape_ShapeDefinitionRepresentation FindSDRWithProduct (const Handle_StepBasic_ProductDefinition & product);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param G:
	:type G: Interface_Graph &
	:rtype: None
") Init;
		void Init (const Interface_Graph & G);
		%feature("compactdefaultargs") NbAssemblies;
		%feature("autodoc", "	* Returns the number of root assemblies;

	:rtype: int
") NbAssemblies;
		Standard_Integer NbAssemblies ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Returns root of assenbly by its rank;

	:param rank: default value is 1
	:type rank: int
	:rtype: Handle_STEPSelections_AssemblyComponent
") Root;
		Handle_STEPSelections_AssemblyComponent Root (const Standard_Integer rank = 1);
		%feature("compactdefaultargs") STEPSelections_AssemblyExplorer;
		%feature("autodoc", "	:param G:
	:type G: Interface_Graph &
	:rtype: None
") STEPSelections_AssemblyExplorer;
		 STEPSelections_AssemblyExplorer (const Interface_Graph & G);
};


%extend STEPSelections_AssemblyExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_AssemblyLink;
class STEPSelections_AssemblyLink : public Standard_Transient {
	public:
		%feature("compactdefaultargs") GetComponent;
		%feature("autodoc", "	:rtype: Handle_STEPSelections_AssemblyComponent
") GetComponent;
		Handle_STEPSelections_AssemblyComponent GetComponent ();
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") GetItem;
		Handle_Standard_Transient GetItem ();
		%feature("compactdefaultargs") GetNAUO;
		%feature("autodoc", "	:rtype: Handle_StepRepr_NextAssemblyUsageOccurrence
") GetNAUO;
		Handle_StepRepr_NextAssemblyUsageOccurrence GetNAUO ();
		%feature("compactdefaultargs") STEPSelections_AssemblyLink;
		%feature("autodoc", "	:rtype: None
") STEPSelections_AssemblyLink;
		 STEPSelections_AssemblyLink ();
		%feature("compactdefaultargs") STEPSelections_AssemblyLink;
		%feature("autodoc", "	:param nauo:
	:type nauo: Handle_StepRepr_NextAssemblyUsageOccurrence &
	:param item:
	:type item: Handle_Standard_Transient &
	:param part:
	:type part: Handle_STEPSelections_AssemblyComponent &
	:rtype: None
") STEPSelections_AssemblyLink;
		 STEPSelections_AssemblyLink (const Handle_StepRepr_NextAssemblyUsageOccurrence & nauo,const Handle_Standard_Transient & item,const Handle_STEPSelections_AssemblyComponent & part);
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	:param part:
	:type part: Handle_STEPSelections_AssemblyComponent &
	:rtype: None
") SetComponent;
		void SetComponent (const Handle_STEPSelections_AssemblyComponent & part);
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: None
") SetItem;
		void SetItem (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") SetNAUO;
		%feature("autodoc", "	:param nauo:
	:type nauo: Handle_StepRepr_NextAssemblyUsageOccurrence &
	:rtype: None
") SetNAUO;
		void SetNAUO (const Handle_StepRepr_NextAssemblyUsageOccurrence & nauo);
};


%make_alias(STEPSelections_AssemblyLink)

%extend STEPSelections_AssemblyLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_Counter;
class STEPSelections_Counter {
	public:
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "	:param graph:
	:type graph: Interface_Graph &
	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: None
") Count;
		void Count (const Interface_Graph & graph,const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") NbInstancesOfEdges;
		%feature("autodoc", "	:rtype: int
") NbInstancesOfEdges;
		Standard_Integer NbInstancesOfEdges ();
		%feature("compactdefaultargs") NbInstancesOfFaces;
		%feature("autodoc", "	:rtype: int
") NbInstancesOfFaces;
		Standard_Integer NbInstancesOfFaces ();
		%feature("compactdefaultargs") NbInstancesOfShells;
		%feature("autodoc", "	:rtype: int
") NbInstancesOfShells;
		Standard_Integer NbInstancesOfShells ();
		%feature("compactdefaultargs") NbInstancesOfSolids;
		%feature("autodoc", "	:rtype: int
") NbInstancesOfSolids;
		Standard_Integer NbInstancesOfSolids ();
		%feature("compactdefaultargs") NbInstancesOfWires;
		%feature("autodoc", "	:rtype: int
") NbInstancesOfWires;
		Standard_Integer NbInstancesOfWires ();
		%feature("compactdefaultargs") NbSourceEdges;
		%feature("autodoc", "	:rtype: int
") NbSourceEdges;
		Standard_Integer NbSourceEdges ();
		%feature("compactdefaultargs") NbSourceFaces;
		%feature("autodoc", "	:rtype: int
") NbSourceFaces;
		Standard_Integer NbSourceFaces ();
		%feature("compactdefaultargs") NbSourceShells;
		%feature("autodoc", "	:rtype: int
") NbSourceShells;
		Standard_Integer NbSourceShells ();
		%feature("compactdefaultargs") NbSourceSolids;
		%feature("autodoc", "	:rtype: int
") NbSourceSolids;
		Standard_Integer NbSourceSolids ();
		%feature("compactdefaultargs") NbSourceWires;
		%feature("autodoc", "	:rtype: int
") NbSourceWires;
		Standard_Integer NbSourceWires ();
		%feature("compactdefaultargs") STEPSelections_Counter;
		%feature("autodoc", "	:rtype: None
") STEPSelections_Counter;
		 STEPSelections_Counter ();
};


%extend STEPSelections_Counter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectAssembly;
class STEPSelections_SelectAssembly : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "	* Explores an entity, to take its faces Works recursively

	:param level:
	:type level: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param G:
	:type G: Interface_Graph &
	:param explored:
	:type explored: Interface_EntityIterator &
	:rtype: bool
") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Assembly structures'

	:rtype: TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();
		%feature("compactdefaultargs") STEPSelections_SelectAssembly;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectAssembly;
		 STEPSelections_SelectAssembly ();
};


%make_alias(STEPSelections_SelectAssembly)

%extend STEPSelections_SelectAssembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectDerived;
class STEPSelections_SelectDerived : public StepSelect_StepType {
	public:
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param text:
	:type text: TCollection_AsciiString &
	:param exact:
	:type exact: bool
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model,const TCollection_AsciiString & text,const Standard_Boolean exact);
		%feature("compactdefaultargs") STEPSelections_SelectDerived;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectDerived;
		 STEPSelections_SelectDerived ();
};


%make_alias(STEPSelections_SelectDerived)

%extend STEPSelections_SelectDerived {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectFaces;
class STEPSelections_SelectFaces : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "	* Explores an entity, to take its faces Works recursively

	:param level:
	:type level: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param G:
	:type G: Interface_Graph &
	:param explored:
	:type explored: Interface_EntityIterator &
	:rtype: bool
") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Faces'

	:rtype: TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();
		%feature("compactdefaultargs") STEPSelections_SelectFaces;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectFaces;
		 STEPSelections_SelectFaces ();
};


%make_alias(STEPSelections_SelectFaces)

%extend STEPSelections_SelectFaces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectForTransfer;
class STEPSelections_SelectForTransfer : public XSControl_SelectForTransfer {
	public:
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") STEPSelections_SelectForTransfer;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectForTransfer;
		 STEPSelections_SelectForTransfer ();
		%feature("compactdefaultargs") STEPSelections_SelectForTransfer;
		%feature("autodoc", "	:param TR:
	:type TR: Handle_XSControl_TransferReader &
	:rtype: None
") STEPSelections_SelectForTransfer;
		 STEPSelections_SelectForTransfer (const Handle_XSControl_TransferReader & TR);
};


%make_alias(STEPSelections_SelectForTransfer)

%extend STEPSelections_SelectForTransfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectGSCurves;
class STEPSelections_SelectGSCurves : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "	:param level:
	:type level: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param G:
	:type G: Interface_Graph &
	:param explored:
	:type explored: Interface_EntityIterator &
	:rtype: bool
") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Curves'

	:rtype: TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();
		%feature("compactdefaultargs") STEPSelections_SelectGSCurves;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectGSCurves;
		 STEPSelections_SelectGSCurves ();
};


%make_alias(STEPSelections_SelectGSCurves)

%extend STEPSelections_SelectGSCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectInstances;
class STEPSelections_SelectInstances : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "	:param level:
	:type level: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param G:
	:type G: Interface_Graph &
	:param explored:
	:type explored: Interface_EntityIterator &
	:rtype: bool
") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Instances'

	:rtype: TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") STEPSelections_SelectInstances;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectInstances;
		 STEPSelections_SelectInstances ();
};


%make_alias(STEPSelections_SelectInstances)

%extend STEPSelections_SelectInstances {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
%wrap_handle(STEPSelections_HSequenceOfAssemblyLink)
class STEPSelections_HSequenceOfAssemblyLink : public  STEPSelections_SequenceOfAssemblyLink, public Standard_Transient {
    STEPSelections_HSequenceOfAssemblyLink();
    STEPSelections_HSequenceOfAssemblyLink(const  STEPSelections_SequenceOfAssemblyLink& theOther);
    const  STEPSelections_SequenceOfAssemblyLink& Sequence();
    void Append (const  STEPSelections_SequenceOfAssemblyLink::value_type& theItem);
    void Append ( STEPSelections_SequenceOfAssemblyLink& theSequence);
     STEPSelections_SequenceOfAssemblyLink& ChangeSequence();
};
%make_alias(STEPSelections_HSequenceOfAssemblyLink)


