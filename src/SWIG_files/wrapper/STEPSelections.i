/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") STEPSelections

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include STEPSelections_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor STEPSelections_AssemblyComponent;
class STEPSelections_AssemblyComponent : public MMgt_TShared {
	public:
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
		%feature("compactdefaultargs") GetSDR;
		%feature("autodoc", "	:rtype: Handle_StepShape_ShapeDefinitionRepresentation
") GetSDR;
		Handle_StepShape_ShapeDefinitionRepresentation GetSDR ();
		%feature("compactdefaultargs") GetList;
		%feature("autodoc", "	:rtype: Handle_STEPSelections_HSequenceOfAssemblyLink
") GetList;
		Handle_STEPSelections_HSequenceOfAssemblyLink GetList ();
		%feature("compactdefaultargs") SetSDR;
		%feature("autodoc", "	:param sdr:
	:type sdr: Handle_StepShape_ShapeDefinitionRepresentation &
	:rtype: None
") SetSDR;
		void SetSDR (const Handle_StepShape_ShapeDefinitionRepresentation & sdr);
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "	:param list:
	:type list: Handle_STEPSelections_HSequenceOfAssemblyLink &
	:rtype: None
") SetList;
		void SetList (const Handle_STEPSelections_HSequenceOfAssemblyLink & list);
};


%extend STEPSelections_AssemblyComponent {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_AssemblyComponent(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_AssemblyComponent::Handle_STEPSelections_AssemblyComponent %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_AssemblyComponent;
class Handle_STEPSelections_AssemblyComponent : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_STEPSelections_AssemblyComponent();
        Handle_STEPSelections_AssemblyComponent(const Handle_STEPSelections_AssemblyComponent &aHandle);
        Handle_STEPSelections_AssemblyComponent(const STEPSelections_AssemblyComponent *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_AssemblyComponent DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_AssemblyComponent {
    STEPSelections_AssemblyComponent* _get_reference() {
    return (STEPSelections_AssemblyComponent*)$self->Access();
    }
};

%extend Handle_STEPSelections_AssemblyComponent {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_AssemblyComponent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_AssemblyExplorer;
class STEPSelections_AssemblyExplorer {
	public:
		%feature("compactdefaultargs") STEPSelections_AssemblyExplorer;
		%feature("autodoc", "	:param G:
	:type G: Interface_Graph &
	:rtype: None
") STEPSelections_AssemblyExplorer;
		 STEPSelections_AssemblyExplorer (const Interface_Graph & G);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param G:
	:type G: Interface_Graph &
	:rtype: None
") Init;
		void Init (const Interface_Graph & G);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") FindSDRWithProduct;
		%feature("autodoc", "	:param product:
	:type product: Handle_StepBasic_ProductDefinition &
	:rtype: Handle_StepShape_ShapeDefinitionRepresentation
") FindSDRWithProduct;
		Handle_StepShape_ShapeDefinitionRepresentation FindSDRWithProduct (const Handle_StepBasic_ProductDefinition & product);
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
};


%extend STEPSelections_AssemblyExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_AssemblyLink;
class STEPSelections_AssemblyLink : public MMgt_TShared {
	public:
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
		%feature("compactdefaultargs") GetNAUO;
		%feature("autodoc", "	:rtype: Handle_StepRepr_NextAssemblyUsageOccurrence
") GetNAUO;
		Handle_StepRepr_NextAssemblyUsageOccurrence GetNAUO ();
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") GetItem;
		Handle_Standard_Transient GetItem ();
		%feature("compactdefaultargs") GetComponent;
		%feature("autodoc", "	:rtype: Handle_STEPSelections_AssemblyComponent
") GetComponent;
		Handle_STEPSelections_AssemblyComponent GetComponent ();
		%feature("compactdefaultargs") SetNAUO;
		%feature("autodoc", "	:param nauo:
	:type nauo: Handle_StepRepr_NextAssemblyUsageOccurrence &
	:rtype: None
") SetNAUO;
		void SetNAUO (const Handle_StepRepr_NextAssemblyUsageOccurrence & nauo);
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: None
") SetItem;
		void SetItem (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") SetComponent;
		%feature("autodoc", "	:param part:
	:type part: Handle_STEPSelections_AssemblyComponent &
	:rtype: None
") SetComponent;
		void SetComponent (const Handle_STEPSelections_AssemblyComponent & part);
};


%extend STEPSelections_AssemblyLink {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_AssemblyLink(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_AssemblyLink::Handle_STEPSelections_AssemblyLink %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_AssemblyLink;
class Handle_STEPSelections_AssemblyLink : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_STEPSelections_AssemblyLink();
        Handle_STEPSelections_AssemblyLink(const Handle_STEPSelections_AssemblyLink &aHandle);
        Handle_STEPSelections_AssemblyLink(const STEPSelections_AssemblyLink *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_AssemblyLink DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_AssemblyLink {
    STEPSelections_AssemblyLink* _get_reference() {
    return (STEPSelections_AssemblyLink*)$self->Access();
    }
};

%extend Handle_STEPSelections_AssemblyLink {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_AssemblyLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_Counter;
class STEPSelections_Counter {
	public:
		%feature("compactdefaultargs") STEPSelections_Counter;
		%feature("autodoc", "	:rtype: None
") STEPSelections_Counter;
		 STEPSelections_Counter ();
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "	:param graph:
	:type graph: Interface_Graph &
	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: None
") Count;
		void Count (const Interface_Graph & graph,const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
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
		%feature("compactdefaultargs") NbInstancesOfEdges;
		%feature("autodoc", "	:rtype: int
") NbInstancesOfEdges;
		Standard_Integer NbInstancesOfEdges ();
		%feature("compactdefaultargs") NbInstancesOfWires;
		%feature("autodoc", "	:rtype: int
") NbInstancesOfWires;
		Standard_Integer NbInstancesOfWires ();
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
		%feature("compactdefaultargs") NbSourceEdges;
		%feature("autodoc", "	:rtype: int
") NbSourceEdges;
		Standard_Integer NbSourceEdges ();
		%feature("compactdefaultargs") NbSourceWires;
		%feature("autodoc", "	:rtype: int
") NbSourceWires;
		Standard_Integer NbSourceWires ();
};


%extend STEPSelections_Counter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_HSequenceOfAssemblyLink;
class STEPSelections_HSequenceOfAssemblyLink : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") STEPSelections_HSequenceOfAssemblyLink;
		%feature("autodoc", "	:rtype: None
") STEPSelections_HSequenceOfAssemblyLink;
		 STEPSelections_HSequenceOfAssemblyLink ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_STEPSelections_AssemblyLink &
	:rtype: None
") Append;
		void Append (const Handle_STEPSelections_AssemblyLink & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_STEPSelections_HSequenceOfAssemblyLink &
	:rtype: None
") Append;
		void Append (const Handle_STEPSelections_HSequenceOfAssemblyLink & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_STEPSelections_AssemblyLink &
	:rtype: None
") Prepend;
		void Prepend (const Handle_STEPSelections_AssemblyLink & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_STEPSelections_HSequenceOfAssemblyLink &
	:rtype: None
") Prepend;
		void Prepend (const Handle_STEPSelections_HSequenceOfAssemblyLink & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_STEPSelections_AssemblyLink &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_STEPSelections_AssemblyLink & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_STEPSelections_HSequenceOfAssemblyLink &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_STEPSelections_HSequenceOfAssemblyLink & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_STEPSelections_AssemblyLink &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_STEPSelections_AssemblyLink & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_STEPSelections_HSequenceOfAssemblyLink &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_STEPSelections_HSequenceOfAssemblyLink & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_STEPSelections_HSequenceOfAssemblyLink
") Split;
		Handle_STEPSelections_HSequenceOfAssemblyLink Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_STEPSelections_AssemblyLink &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_STEPSelections_AssemblyLink & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_STEPSelections_AssemblyLink
") Value;
		Handle_STEPSelections_AssemblyLink Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_STEPSelections_AssemblyLink
") ChangeValue;
		Handle_STEPSelections_AssemblyLink ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: STEPSelections_SequenceOfAssemblyLink
") Sequence;
		const STEPSelections_SequenceOfAssemblyLink & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: STEPSelections_SequenceOfAssemblyLink
") ChangeSequence;
		STEPSelections_SequenceOfAssemblyLink & ChangeSequence ();
};


%extend STEPSelections_HSequenceOfAssemblyLink {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_HSequenceOfAssemblyLink(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_HSequenceOfAssemblyLink::Handle_STEPSelections_HSequenceOfAssemblyLink %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_HSequenceOfAssemblyLink;
class Handle_STEPSelections_HSequenceOfAssemblyLink : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_STEPSelections_HSequenceOfAssemblyLink();
        Handle_STEPSelections_HSequenceOfAssemblyLink(const Handle_STEPSelections_HSequenceOfAssemblyLink &aHandle);
        Handle_STEPSelections_HSequenceOfAssemblyLink(const STEPSelections_HSequenceOfAssemblyLink *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_HSequenceOfAssemblyLink DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_HSequenceOfAssemblyLink {
    STEPSelections_HSequenceOfAssemblyLink* _get_reference() {
    return (STEPSelections_HSequenceOfAssemblyLink*)$self->Access();
    }
};

%extend Handle_STEPSelections_HSequenceOfAssemblyLink {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_HSequenceOfAssemblyLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectAssembly;
class STEPSelections_SelectAssembly : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") STEPSelections_SelectAssembly;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectAssembly;
		 STEPSelections_SelectAssembly ();
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
};


%extend STEPSelections_SelectAssembly {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_SelectAssembly(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_SelectAssembly::Handle_STEPSelections_SelectAssembly %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_SelectAssembly;
class Handle_STEPSelections_SelectAssembly : public Handle_IFSelect_SelectExplore {

    public:
        // constructors
        Handle_STEPSelections_SelectAssembly();
        Handle_STEPSelections_SelectAssembly(const Handle_STEPSelections_SelectAssembly &aHandle);
        Handle_STEPSelections_SelectAssembly(const STEPSelections_SelectAssembly *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_SelectAssembly DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_SelectAssembly {
    STEPSelections_SelectAssembly* _get_reference() {
    return (STEPSelections_SelectAssembly*)$self->Access();
    }
};

%extend Handle_STEPSelections_SelectAssembly {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_SelectAssembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectDerived;
class STEPSelections_SelectDerived : public StepSelect_StepType {
	public:
		%feature("compactdefaultargs") STEPSelections_SelectDerived;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectDerived;
		 STEPSelections_SelectDerived ();
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
};


%extend STEPSelections_SelectDerived {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_SelectDerived(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_SelectDerived::Handle_STEPSelections_SelectDerived %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_SelectDerived;
class Handle_STEPSelections_SelectDerived : public Handle_StepSelect_StepType {

    public:
        // constructors
        Handle_STEPSelections_SelectDerived();
        Handle_STEPSelections_SelectDerived(const Handle_STEPSelections_SelectDerived &aHandle);
        Handle_STEPSelections_SelectDerived(const STEPSelections_SelectDerived *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_SelectDerived DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_SelectDerived {
    STEPSelections_SelectDerived* _get_reference() {
    return (STEPSelections_SelectDerived*)$self->Access();
    }
};

%extend Handle_STEPSelections_SelectDerived {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_SelectDerived {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectFaces;
class STEPSelections_SelectFaces : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") STEPSelections_SelectFaces;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectFaces;
		 STEPSelections_SelectFaces ();
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
};


%extend STEPSelections_SelectFaces {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_SelectFaces(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_SelectFaces::Handle_STEPSelections_SelectFaces %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_SelectFaces;
class Handle_STEPSelections_SelectFaces : public Handle_IFSelect_SelectExplore {

    public:
        // constructors
        Handle_STEPSelections_SelectFaces();
        Handle_STEPSelections_SelectFaces(const Handle_STEPSelections_SelectFaces &aHandle);
        Handle_STEPSelections_SelectFaces(const STEPSelections_SelectFaces *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_SelectFaces DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_SelectFaces {
    STEPSelections_SelectFaces* _get_reference() {
    return (STEPSelections_SelectFaces*)$self->Access();
    }
};

%extend Handle_STEPSelections_SelectFaces {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_SelectFaces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectForTransfer;
class STEPSelections_SelectForTransfer : public XSControl_SelectForTransfer {
	public:
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
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
};


%extend STEPSelections_SelectForTransfer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_SelectForTransfer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_SelectForTransfer::Handle_STEPSelections_SelectForTransfer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_SelectForTransfer;
class Handle_STEPSelections_SelectForTransfer : public Handle_XSControl_SelectForTransfer {

    public:
        // constructors
        Handle_STEPSelections_SelectForTransfer();
        Handle_STEPSelections_SelectForTransfer(const Handle_STEPSelections_SelectForTransfer &aHandle);
        Handle_STEPSelections_SelectForTransfer(const STEPSelections_SelectForTransfer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_SelectForTransfer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_SelectForTransfer {
    STEPSelections_SelectForTransfer* _get_reference() {
    return (STEPSelections_SelectForTransfer*)$self->Access();
    }
};

%extend Handle_STEPSelections_SelectForTransfer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_SelectForTransfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectGSCurves;
class STEPSelections_SelectGSCurves : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") STEPSelections_SelectGSCurves;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectGSCurves;
		 STEPSelections_SelectGSCurves ();
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
};


%extend STEPSelections_SelectGSCurves {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_SelectGSCurves(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_SelectGSCurves::Handle_STEPSelections_SelectGSCurves %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_SelectGSCurves;
class Handle_STEPSelections_SelectGSCurves : public Handle_IFSelect_SelectExplore {

    public:
        // constructors
        Handle_STEPSelections_SelectGSCurves();
        Handle_STEPSelections_SelectGSCurves(const Handle_STEPSelections_SelectGSCurves &aHandle);
        Handle_STEPSelections_SelectGSCurves(const STEPSelections_SelectGSCurves *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_SelectGSCurves DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_SelectGSCurves {
    STEPSelections_SelectGSCurves* _get_reference() {
    return (STEPSelections_SelectGSCurves*)$self->Access();
    }
};

%extend Handle_STEPSelections_SelectGSCurves {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_SelectGSCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SelectInstances;
class STEPSelections_SelectInstances : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") STEPSelections_SelectInstances;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SelectInstances;
		 STEPSelections_SelectInstances ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
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
};


%extend STEPSelections_SelectInstances {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_SelectInstances(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_SelectInstances::Handle_STEPSelections_SelectInstances %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_SelectInstances;
class Handle_STEPSelections_SelectInstances : public Handle_IFSelect_SelectExplore {

    public:
        // constructors
        Handle_STEPSelections_SelectInstances();
        Handle_STEPSelections_SelectInstances(const Handle_STEPSelections_SelectInstances &aHandle);
        Handle_STEPSelections_SelectInstances(const STEPSelections_SelectInstances *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_SelectInstances DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_SelectInstances {
    STEPSelections_SelectInstances* _get_reference() {
    return (STEPSelections_SelectInstances*)$self->Access();
    }
};

%extend Handle_STEPSelections_SelectInstances {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_SelectInstances {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent;
class STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent;
		%feature("autodoc", "	:param I:
	:type I: Handle_STEPSelections_AssemblyComponent &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent;
		 STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent (const Handle_STEPSelections_AssemblyComponent & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_STEPSelections_AssemblyComponent
") Value;
		Handle_STEPSelections_AssemblyComponent Value ();
};


%extend STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent::Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent;
class Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent();
        Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent(const Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent &aHandle);
        Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent(const STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent {
    STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent* _get_reference() {
    return (STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent*)$self->Access();
    }
};

%extend Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_SequenceNodeOfSequenceOfAssemblyComponent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SequenceNodeOfSequenceOfAssemblyLink;
class STEPSelections_SequenceNodeOfSequenceOfAssemblyLink : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") STEPSelections_SequenceNodeOfSequenceOfAssemblyLink;
		%feature("autodoc", "	:param I:
	:type I: Handle_STEPSelections_AssemblyLink &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") STEPSelections_SequenceNodeOfSequenceOfAssemblyLink;
		 STEPSelections_SequenceNodeOfSequenceOfAssemblyLink (const Handle_STEPSelections_AssemblyLink & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_STEPSelections_AssemblyLink
") Value;
		Handle_STEPSelections_AssemblyLink Value ();
};


%extend STEPSelections_SequenceNodeOfSequenceOfAssemblyLink {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink::Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink;
class Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink();
        Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink(const Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink &aHandle);
        Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink(const STEPSelections_SequenceNodeOfSequenceOfAssemblyLink *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink {
    STEPSelections_SequenceNodeOfSequenceOfAssemblyLink* _get_reference() {
    return (STEPSelections_SequenceNodeOfSequenceOfAssemblyLink*)$self->Access();
    }
};

%extend Handle_STEPSelections_SequenceNodeOfSequenceOfAssemblyLink {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPSelections_SequenceNodeOfSequenceOfAssemblyLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SequenceOfAssemblyComponent;
class STEPSelections_SequenceOfAssemblyComponent : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") STEPSelections_SequenceOfAssemblyComponent;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SequenceOfAssemblyComponent;
		 STEPSelections_SequenceOfAssemblyComponent ();
		%feature("compactdefaultargs") STEPSelections_SequenceOfAssemblyComponent;
		%feature("autodoc", "	:param Other:
	:type Other: STEPSelections_SequenceOfAssemblyComponent &
	:rtype: None
") STEPSelections_SequenceOfAssemblyComponent;
		 STEPSelections_SequenceOfAssemblyComponent (const STEPSelections_SequenceOfAssemblyComponent & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: STEPSelections_SequenceOfAssemblyComponent &
	:rtype: STEPSelections_SequenceOfAssemblyComponent
") Assign;
		const STEPSelections_SequenceOfAssemblyComponent & Assign (const STEPSelections_SequenceOfAssemblyComponent & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: STEPSelections_SequenceOfAssemblyComponent &
	:rtype: STEPSelections_SequenceOfAssemblyComponent
") operator =;
		const STEPSelections_SequenceOfAssemblyComponent & operator = (const STEPSelections_SequenceOfAssemblyComponent & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_STEPSelections_AssemblyComponent &
	:rtype: None
") Append;
		void Append (const Handle_STEPSelections_AssemblyComponent & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: STEPSelections_SequenceOfAssemblyComponent &
	:rtype: None
") Append;
		void Append (STEPSelections_SequenceOfAssemblyComponent & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_STEPSelections_AssemblyComponent &
	:rtype: None
") Prepend;
		void Prepend (const Handle_STEPSelections_AssemblyComponent & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: STEPSelections_SequenceOfAssemblyComponent &
	:rtype: None
") Prepend;
		void Prepend (STEPSelections_SequenceOfAssemblyComponent & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_STEPSelections_AssemblyComponent &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_STEPSelections_AssemblyComponent & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: STEPSelections_SequenceOfAssemblyComponent &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,STEPSelections_SequenceOfAssemblyComponent & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_STEPSelections_AssemblyComponent &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_STEPSelections_AssemblyComponent & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: STEPSelections_SequenceOfAssemblyComponent &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,STEPSelections_SequenceOfAssemblyComponent & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_STEPSelections_AssemblyComponent
") First;
		Handle_STEPSelections_AssemblyComponent First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_STEPSelections_AssemblyComponent
") Last;
		Handle_STEPSelections_AssemblyComponent Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: STEPSelections_SequenceOfAssemblyComponent &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,STEPSelections_SequenceOfAssemblyComponent & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_STEPSelections_AssemblyComponent
") Value;
		Handle_STEPSelections_AssemblyComponent Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_STEPSelections_AssemblyComponent &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_STEPSelections_AssemblyComponent & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_STEPSelections_AssemblyComponent
") ChangeValue;
		Handle_STEPSelections_AssemblyComponent ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend STEPSelections_SequenceOfAssemblyComponent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPSelections_SequenceOfAssemblyLink;
class STEPSelections_SequenceOfAssemblyLink : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") STEPSelections_SequenceOfAssemblyLink;
		%feature("autodoc", "	:rtype: None
") STEPSelections_SequenceOfAssemblyLink;
		 STEPSelections_SequenceOfAssemblyLink ();
		%feature("compactdefaultargs") STEPSelections_SequenceOfAssemblyLink;
		%feature("autodoc", "	:param Other:
	:type Other: STEPSelections_SequenceOfAssemblyLink &
	:rtype: None
") STEPSelections_SequenceOfAssemblyLink;
		 STEPSelections_SequenceOfAssemblyLink (const STEPSelections_SequenceOfAssemblyLink & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: STEPSelections_SequenceOfAssemblyLink &
	:rtype: STEPSelections_SequenceOfAssemblyLink
") Assign;
		const STEPSelections_SequenceOfAssemblyLink & Assign (const STEPSelections_SequenceOfAssemblyLink & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: STEPSelections_SequenceOfAssemblyLink &
	:rtype: STEPSelections_SequenceOfAssemblyLink
") operator =;
		const STEPSelections_SequenceOfAssemblyLink & operator = (const STEPSelections_SequenceOfAssemblyLink & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_STEPSelections_AssemblyLink &
	:rtype: None
") Append;
		void Append (const Handle_STEPSelections_AssemblyLink & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: STEPSelections_SequenceOfAssemblyLink &
	:rtype: None
") Append;
		void Append (STEPSelections_SequenceOfAssemblyLink & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_STEPSelections_AssemblyLink &
	:rtype: None
") Prepend;
		void Prepend (const Handle_STEPSelections_AssemblyLink & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: STEPSelections_SequenceOfAssemblyLink &
	:rtype: None
") Prepend;
		void Prepend (STEPSelections_SequenceOfAssemblyLink & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_STEPSelections_AssemblyLink &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_STEPSelections_AssemblyLink & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: STEPSelections_SequenceOfAssemblyLink &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,STEPSelections_SequenceOfAssemblyLink & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_STEPSelections_AssemblyLink &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_STEPSelections_AssemblyLink & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: STEPSelections_SequenceOfAssemblyLink &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,STEPSelections_SequenceOfAssemblyLink & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_STEPSelections_AssemblyLink
") First;
		Handle_STEPSelections_AssemblyLink First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_STEPSelections_AssemblyLink
") Last;
		Handle_STEPSelections_AssemblyLink Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: STEPSelections_SequenceOfAssemblyLink &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,STEPSelections_SequenceOfAssemblyLink & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_STEPSelections_AssemblyLink
") Value;
		Handle_STEPSelections_AssemblyLink Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_STEPSelections_AssemblyLink &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_STEPSelections_AssemblyLink & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_STEPSelections_AssemblyLink
") ChangeValue;
		Handle_STEPSelections_AssemblyLink ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend STEPSelections_SequenceOfAssemblyLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
