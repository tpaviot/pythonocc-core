/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module BRepAlgo

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include BRepAlgo_required_python_modules.i
%include BRepAlgo_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum BRepAlgo_CheckStatus {
	BRepAlgo_OK = 0,
	BRepAlgo_NOK = 1,
};

/* end public enums declaration */

%rename(brepalgo) BRepAlgo;
%nodefaultctor BRepAlgo;
class BRepAlgo {
	public:
		%feature("autodoc", "Args:
	Wire(TopoDS_Wire)
	Option(GeomAbs_Shape)
	AngularTolerance(Standard_Real)=1.0e-4

Returns:
	static TopoDS_Wire

this method makes a wire whose edges are C1 from  
         a Wire whose edges could be G1. It removes a vertex  
         between G1 edges.  
         Option can be G1 or C1.") ConcatenateWire;
		static TopoDS_Wire ConcatenateWire (const TopoDS_Wire & Wire,const GeomAbs_Shape Option,const Standard_Real AngularTolerance = 1.0e-4);
		%feature("autodoc", "Args:
	Wire(TopoDS_Wire)

Returns:
	static TopoDS_Edge

this method makes an edge from a wire.  
         Junction points between edges of wire may be sharp,  
         resulting curve of the resulting edge may be C0.") ConcatenateWireC0;
		static TopoDS_Edge ConcatenateWireC0 (const TopoDS_Wire & Wire);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static Standard_Boolean

Checks if the  shape is 'correct'. If not, returns  
         <Standard_False>, else returns <Standard_True>.") IsValid;
		static Standard_Boolean IsValid (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	theArgs(TopTools_ListOfShape)
	theResult(TopoDS_Shape)
	closedSolid(Standard_Boolean)=Standard_False
	GeomCtrl(Standard_Boolean)=Standard_True

Returns:
	static Standard_Boolean

Checks if  the  Generated and Modified Faces  from  
         the shapes <arguments> in  the shape <result>  are  
         'correct'. The args   may be empty, then all faces  
         will be checked.  
         If <Closed> is True,  only  closed shape are valid.  
          If <GeomCtrl>  is    False the geometry  of   new  
           vertices and edges   are   not verified and  the  
         auto-intersection of new wires are not searched.") IsValid;
		static Standard_Boolean IsValid (const TopTools_ListOfShape & theArgs,const TopoDS_Shape & theResult,const Standard_Boolean closedSolid = Standard_False,const Standard_Boolean GeomCtrl = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static Standard_Boolean

Checks if the shape is  'correct'. If not, returns  
         <Standard_False>,  else   returns <Standard_True>.  
         This method differs from  the previous one in  the  
         fact that no   geometric contols (intersection  of  
         wires, pcurve validity) are performed.") IsTopologicallyValid;
		static Standard_Boolean IsTopologicallyValid (const TopoDS_Shape & S);
};


%feature("shadow") BRepAlgo::~BRepAlgo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_AsDes;
class BRepAlgo_AsDes : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty AsDes.") BRepAlgo_AsDes;
		 BRepAlgo_AsDes ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	SS(TopoDS_Shape)

Returns:
	None

Stores <SS> as a futur subshape of <S>.") Add;
		void Add (const TopoDS_Shape & S,const TopoDS_Shape & SS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	SS(TopTools_ListOfShape)

Returns:
	None

Stores <SS> as futurs SubShapes of <S>.") Add;
		void Add (const TopoDS_Shape & S,const TopTools_ListOfShape & SS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasAscendant;
		Standard_Boolean HasAscendant (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasDescendant;
		Standard_Boolean HasDescendant (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the Shape containing <S>.") Ascendant;
		const TopTools_ListOfShape & Ascendant (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns futur subhapes of <S>.") Descendant;
		const TopTools_ListOfShape & Descendant (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns futur subhapes of <S>.") ChangeDescendant;
		TopTools_ListOfShape & ChangeDescendant (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	OldS(TopoDS_Shape)
	NewS(TopoDS_Shape)

Returns:
	None

Replace <OldS> by <NewS>.  
         <OldS> disapear from <self>.") Replace;
		void Replace (const TopoDS_Shape & OldS,const TopoDS_Shape & NewS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Remove <S> from me.") Remove;
		void Remove (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	LC(TopTools_ListOfShape)

Returns:
	Standard_Boolean

Returns  True if (S1> and <S2>  has  common  
          Descendants.  Stores in <LC> the Commons Descendants.") HasCommonDescendant;
		Standard_Boolean HasCommonDescendant (const TopoDS_Shape & S1,const TopoDS_Shape & S2,TopTools_ListOfShape & LC);
};


%feature("shadow") BRepAlgo_AsDes::~BRepAlgo_AsDes %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_AsDes {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepAlgo_AsDes {
	Handle_BRepAlgo_AsDes GetHandle() {
	return *(Handle_BRepAlgo_AsDes*) &$self;
	}
};

%nodefaultctor Handle_BRepAlgo_AsDes;
class Handle_BRepAlgo_AsDes : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepAlgo_AsDes();
        Handle_BRepAlgo_AsDes(const Handle_BRepAlgo_AsDes &aHandle);
        Handle_BRepAlgo_AsDes(const BRepAlgo_AsDes *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepAlgo_AsDes DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepAlgo_AsDes {
    BRepAlgo_AsDes* GetObject() {
    return (BRepAlgo_AsDes*)$self->Access();
    }
};
%feature("shadow") Handle_BRepAlgo_AsDes::~Handle_BRepAlgo_AsDes %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepAlgo_AsDes {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepAlgo_BooleanOperation;
class BRepAlgo_BooleanOperation : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") PerformDS;
		void PerformDS ();
		%feature("autodoc", "Args:
	St1(TopAbs_State)
	St2(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopAbs_State St1,const TopAbs_State St2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_HBuilder

No detailed docstring for this function.") Builder;
		Handle_TopOpeBRepBuild_HBuilder Builder ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the first shape involved in this Boolean operation.") Shape1;
		const TopoDS_Shape & Shape1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the second shape involved in this Boolean operation.") Shape2;
		const TopoDS_Shape & Shape2 ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes modified from the shape  
         <S>.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);
};


%feature("shadow") BRepAlgo_BooleanOperation::~BRepAlgo_BooleanOperation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_BooleanOperation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_BooleanOperations;
class BRepAlgo_BooleanOperations {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAlgo_BooleanOperations;
		 BRepAlgo_BooleanOperations ();
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

S1 is a Shell with ALL faces supported by the SAME S2 is  
         an Edge INCLUDED in that surface with pcurve.  
         this avoids a time-consuming 3D operation, compared to Shapes.") Shapes2d;
		void Shapes2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Defines the arguments.") Shapes;
		void Shapes (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	NbPntMax(Standard_Integer)
	Tol3D(Standard_Real)
	Tol2D(Standard_Real)
	RelativeTol(Standard_Boolean)

Returns:
	None

Sets different parameters for the curve approximations :  
         NbPntMax : Maximum number of points to be approximated at  
                    the same time in one curve.  
         Tol3D, Tol2D : Tolerances to be reached by the approximation.  
         RelativeTol : The given tolerances are relative.") SetApproxParameters;
		void SetApproxParameters (const Standard_Integer NbPntMax,const Standard_Real Tol3D,const Standard_Real Tol2D,const Standard_Boolean RelativeTol);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") Define;
		void Define (const TopoDS_Shape & S1,const TopoDS_Shape & S2,Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the common part of the shapes.") Common;
		const TopoDS_Shape & Common ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the fuse part of the shapes.") Fus;
		const TopoDS_Shape & Fus ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the cut part of the shapes.") Cut;
		const TopoDS_Shape & Cut ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the intersection of the shapes.") Section;
		const TopoDS_Shape & Section ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the result of the boolean operation.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the shape(s) resulting of the boolean operation  
         issued from the shape <S>.") ShapeFrom;
		const TopoDS_Shape & ShapeFrom (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the list of the descendant shapes of the shape <S>.") Modified;
		const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

Returns the fact that the shape <S> has been deleted or not  
         by the boolean operation.") IsDeleted;
		Standard_Boolean IsDeleted (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_HDataStructure

No detailed docstring for this function.") DataStructure;
		const Handle_TopOpeBRepDS_HDataStructure & DataStructure ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_HDataStructure

No detailed docstring for this function.") ChangeDataStructure;
		Handle_TopOpeBRepDS_HDataStructure & ChangeDataStructure ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_HBuilder

No detailed docstring for this function.") Builder;
		const Handle_TopOpeBRepBuild_HBuilder & Builder ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_HBuilder

No detailed docstring for this function.") ChangeBuilder;
		Handle_TopOpeBRepBuild_HBuilder & ChangeBuilder ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAlgo_DSAccess

returns the member myDSA. It is useful to then access  
         the method GetSectionEdgeSet (wich is a member of DSAccess)") DataStructureAccess;
		BRepAlgo_DSAccess & DataStructureAccess ();
};


%feature("shadow") BRepAlgo_BooleanOperations::~BRepAlgo_BooleanOperations %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_BooleanOperations {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_DSAccess;
class BRepAlgo_DSAccess {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAlgo_DSAccess;
		 BRepAlgo_DSAccess ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the internal data structure, including the") Init;
		void Init ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Loads the shape in DS.") Load;
		void Load (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Loads two shapes in the DS without intersecting them.") Load;
		void Load (TopoDS_Shape & S1,TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	None
Returns:
	None

Intersects two shapes at input and loads the DS with  
         their intersection. Clears the TopOpeBRepBuild_HBuilder if  
         necessary") Intersect;
		void Intersect ();
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Intersects the faces contained in two given shapes  
         and loads them in the DS. Clears the TopOpeBRepBuild_HBuilder  
         if necessary") Intersect;
		void Intersect (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

This method does the same thing as the previous,  
         but faster. There is no intersection face/face 3D.  
         The faces have the same support(surface). No test of  
         tangency (that is why it is faster). Intersects in 2d  
         the faces tangent F1 anf F2.") SameDomain;
		void SameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

returns compounds of Edge connected with section, which  
         contains sections between faces contained in S1 and S2.  
         returns an empty list of Shape if S1 or S2 do not contain  
         face.  
         calls GetSectionEdgeSet() if it has not already been done") GetSectionEdgeSet;
		const TopTools_ListOfShape & GetSectionEdgeSet (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

returns all compounds of edges connected with section  
         contained in the DS") GetSectionEdgeSet;
		const TopTools_ListOfShape & GetSectionEdgeSet ();
		%feature("autodoc", "Args:
	Compound(TopoDS_Shape)

Returns:
	Standard_Boolean

NYI") IsWire;
		Standard_Boolean IsWire (const TopoDS_Shape & Compound);
		%feature("autodoc", "Args:
	Compound(TopoDS_Shape)

Returns:
	TopoDS_Shape

NYI") Wire;
		const TopoDS_Shape & Wire (const TopoDS_Shape & Compound);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

NYI  
         returns the vertex of section, which contains the section  
         between face S1 and edge S2 (returns an empty Shape  
         if S1 is not a face or if S2 is not an edge)") SectionVertex;
		const TopTools_ListOfShape & SectionVertex (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	Compound(TopoDS_Shape)

Returns:
	None

Invalidates a complete line of section. All  
         Edges connected by Vertex or a Wire. Can be  
         a group of connected Edges, which do not form a  
         standard Wire.") SuppressEdgeSet;
		void SuppressEdgeSet (const TopoDS_Shape & Compound);
		%feature("autodoc", "Args:
	Old(TopoDS_Shape)
	New(TopoDS_Shape)

Returns:
	None

Modifies a line of section.  <New> -- should be a  
         Group of Edges connected by Vertex.  -- Can be a  
         Wire.  Can be a group of connected Edges that do not  
         form a standard Wire.   <New> should be sub-groupn of <Old>") ChangeEdgeSet;
		void ChangeEdgeSet (const TopoDS_Shape & Old,const TopoDS_Shape & New);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	None

NYI  
         Make invalid a Vertex of section. The Vertex shoud be  
         reconstructed from a point.") SuppressSectionVertex;
		void SuppressSectionVertex (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	state1(TopAbs_State)
	state2(TopAbs_State)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Merge;
		const TopoDS_Shape & Merge (const TopAbs_State state1,const TopAbs_State state2);
		%feature("autodoc", "Args:
	state1(TopAbs_State)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Merge;
		const TopoDS_Shape & Merge (const TopAbs_State state1);
		%feature("autodoc", "Args:
	what(TopAbs_State)
	FromShape(TopoDS_Shape)
	LoadShape(TopoDS_Shape)

Returns:
	TopoDS_Shape

NYI   Propagation  of a state starting from the shape  
         FromShape = edge or vertex of section, face or  
         Coumpound de section. LoadShape is either S1,  
         or S2  (see the method Load).   Propagation   from  
         FromShape, on the states <what> of LoadShape.  
         Return a Wire in 2d, a Shell in 3d.  
         Specifications are incomplete, to be redefined for the typologies  
         correpsonding to  <FromShape> and the result :  
         exemple :    FromShape        resultat  
                        vertex           wire (or edge)  
                   edge of section       face (or shell)  
                   compound of section   shell  
                     ...                  ...") Propagate;
		const TopoDS_Shape & Propagate (const TopAbs_State what,const TopoDS_Shape & FromShape,const TopoDS_Shape & LoadShape);
		%feature("autodoc", "Args:
	SectionShape(TopoDS_Shape)

Returns:
	TopoDS_Shape

SectionShape est soit un Vertex de section(NYI), soit  
         une Edge de section. Propagation  des shapes  
         de section en partant de SectionShape.  
         return un Compound de section.") PropagateFromSection;
		const TopoDS_Shape & PropagateFromSection (const TopoDS_Shape & SectionShape);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the list of the descendant shapes of the shape <S>.") Modified;
		const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	BRepAlgo_CheckStatus

NYI  
         coherence of the internal Data Structure.") Check;
		BRepAlgo_CheckStatus Check ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_HDataStructure

No detailed docstring for this function.") DS;
		const Handle_TopOpeBRepDS_HDataStructure & DS ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_HDataStructure

No detailed docstring for this function.") ChangeDS;
		Handle_TopOpeBRepDS_HDataStructure & ChangeDS ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_HBuilder

No detailed docstring for this function.") Builder;
		const Handle_TopOpeBRepBuild_HBuilder & Builder ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_HBuilder

No detailed docstring for this function.") ChangeBuilder;
		Handle_TopOpeBRepBuild_HBuilder & ChangeBuilder ();
};


%feature("shadow") BRepAlgo_DSAccess::~BRepAlgo_DSAccess %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_DSAccess {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean;
class BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean;
		 BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean ();
		%feature("autodoc", "Args:
	aMap(BRepAlgo_DataMapOfShapeBoolean)

Returns:
	None

No detailed docstring for this function.") BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean;
		 BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean (const BRepAlgo_DataMapOfShapeBoolean & aMap);
		%feature("autodoc", "Args:
	aMap(BRepAlgo_DataMapOfShapeBoolean)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepAlgo_DataMapOfShapeBoolean & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		const Standard_Boolean & Value ();
};


%feature("shadow") BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean::~BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference;
class BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference;
		 BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference ();
		%feature("autodoc", "Args:
	aMap(BRepAlgo_DataMapOfShapeInterference)

Returns:
	None

No detailed docstring for this function.") BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference;
		 BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference (const BRepAlgo_DataMapOfShapeInterference & aMap);
		%feature("autodoc", "Args:
	aMap(BRepAlgo_DataMapOfShapeInterference)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepAlgo_DataMapOfShapeInterference & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") Value;
		const Handle_TopOpeBRepDS_Interference & Value ();
};


%feature("shadow") BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference::~BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean;
class BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Boolean)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean;
		 BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean (const TopoDS_Shape & K,const Standard_Boolean & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetValue() {
                return (Standard_Boolean) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Boolean value ) {
                $self->Value()=value;
                }
            };
            };


%feature("shadow") BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean::~BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean {
	Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean GetHandle() {
	return *(Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean*) &$self;
	}
};

%nodefaultctor Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean;
class Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean();
        Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean(const Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean &aHandle);
        Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean(const BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean {
    BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean* GetObject() {
    return (BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean*)$self->Access();
    }
};
%feature("shadow") Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean::~Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepAlgo_DataMapNodeOfDataMapOfShapeInterference;
class BRepAlgo_DataMapNodeOfDataMapOfShapeInterference : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Handle_TopOpeBRepDS_Interference)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepAlgo_DataMapNodeOfDataMapOfShapeInterference;
		 BRepAlgo_DataMapNodeOfDataMapOfShapeInterference (const TopoDS_Shape & K,const Handle_TopOpeBRepDS_Interference & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") Value;
		Handle_TopOpeBRepDS_Interference & Value ();
};


%feature("shadow") BRepAlgo_DataMapNodeOfDataMapOfShapeInterference::~BRepAlgo_DataMapNodeOfDataMapOfShapeInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_DataMapNodeOfDataMapOfShapeInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepAlgo_DataMapNodeOfDataMapOfShapeInterference {
	Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference GetHandle() {
	return *(Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference*) &$self;
	}
};

%nodefaultctor Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference;
class Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference();
        Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference(const Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference &aHandle);
        Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference(const BRepAlgo_DataMapNodeOfDataMapOfShapeInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference {
    BRepAlgo_DataMapNodeOfDataMapOfShapeInterference* GetObject() {
    return (BRepAlgo_DataMapNodeOfDataMapOfShapeInterference*)$self->Access();
    }
};
%feature("shadow") Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference::~Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepAlgo_DataMapNodeOfDataMapOfShapeInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepAlgo_DataMapOfShapeBoolean;
class BRepAlgo_DataMapOfShapeBoolean : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepAlgo_DataMapOfShapeBoolean;
		 BRepAlgo_DataMapOfShapeBoolean (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepAlgo_DataMapOfShapeBoolean)

Returns:
	BRepAlgo_DataMapOfShapeBoolean

No detailed docstring for this function.") Assign;
		BRepAlgo_DataMapOfShapeBoolean & Assign (const BRepAlgo_DataMapOfShapeBoolean & Other);
		%feature("autodoc", "Args:
	Other(BRepAlgo_DataMapOfShapeBoolean)

Returns:
	BRepAlgo_DataMapOfShapeBoolean

No detailed docstring for this function.") operator=;
		BRepAlgo_DataMapOfShapeBoolean & operator = (const BRepAlgo_DataMapOfShapeBoolean & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Boolean)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Standard_Boolean & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Find;
		const Standard_Boolean & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ChangeFind;
		Standard_Boolean & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepAlgo_DataMapOfShapeBoolean::~BRepAlgo_DataMapOfShapeBoolean %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_DataMapOfShapeBoolean {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_DataMapOfShapeInterference;
class BRepAlgo_DataMapOfShapeInterference : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepAlgo_DataMapOfShapeInterference;
		 BRepAlgo_DataMapOfShapeInterference (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepAlgo_DataMapOfShapeInterference)

Returns:
	BRepAlgo_DataMapOfShapeInterference

No detailed docstring for this function.") Assign;
		BRepAlgo_DataMapOfShapeInterference & Assign (const BRepAlgo_DataMapOfShapeInterference & Other);
		%feature("autodoc", "Args:
	Other(BRepAlgo_DataMapOfShapeInterference)

Returns:
	BRepAlgo_DataMapOfShapeInterference

No detailed docstring for this function.") operator=;
		BRepAlgo_DataMapOfShapeInterference & operator = (const BRepAlgo_DataMapOfShapeInterference & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") Find;
		const Handle_TopOpeBRepDS_Interference & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Handle_TopOpeBRepDS_Interference

No detailed docstring for this function.") ChangeFind;
		Handle_TopOpeBRepDS_Interference & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepAlgo_DataMapOfShapeInterference::~BRepAlgo_DataMapOfShapeInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_DataMapOfShapeInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_EdgeConnector;
class BRepAlgo_EdgeConnector : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAlgo_EdgeConnector;
		 BRepAlgo_EdgeConnector ();
		%feature("autodoc", "Args:
	e(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Edge & e);
		%feature("autodoc", "Args:
	LOEdge(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (TopTools_ListOfShape & LOEdge);
		%feature("autodoc", "Args:
	e(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddStart;
		void AddStart (const TopoDS_Shape & e);
		%feature("autodoc", "Args:
	LOEdge(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") AddStart;
		void AddStart (TopTools_ListOfShape & LOEdge);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearStartElement;
		void ClearStartElement ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

returns a list of wire non standard") MakeBlock;
		TopTools_ListOfShape & MakeBlock ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Done;
		void Done ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

NYI  returns true if proceeded  to MakeBlock()") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	W(TopoDS_Shape)

Returns:
	Standard_Boolean

NYI  returns true if W is  a Wire standard.  
         W must belong  to the list returned  by MakeBlock.") IsWire;
		Standard_Boolean IsWire (const TopoDS_Shape & W);
};


%feature("shadow") BRepAlgo_EdgeConnector::~BRepAlgo_EdgeConnector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_EdgeConnector {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepAlgo_EdgeConnector {
	Handle_BRepAlgo_EdgeConnector GetHandle() {
	return *(Handle_BRepAlgo_EdgeConnector*) &$self;
	}
};

%nodefaultctor Handle_BRepAlgo_EdgeConnector;
class Handle_BRepAlgo_EdgeConnector : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepAlgo_EdgeConnector();
        Handle_BRepAlgo_EdgeConnector(const Handle_BRepAlgo_EdgeConnector &aHandle);
        Handle_BRepAlgo_EdgeConnector(const BRepAlgo_EdgeConnector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepAlgo_EdgeConnector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepAlgo_EdgeConnector {
    BRepAlgo_EdgeConnector* GetObject() {
    return (BRepAlgo_EdgeConnector*)$self->Access();
    }
};
%feature("shadow") Handle_BRepAlgo_EdgeConnector::~Handle_BRepAlgo_EdgeConnector %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepAlgo_EdgeConnector {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepAlgo_FaceRestrictor;
class BRepAlgo_FaceRestrictor {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAlgo_FaceRestrictor;
		 BRepAlgo_FaceRestrictor ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Proj(Standard_Boolean)=Standard_False
	ControlOrientation(Standard_Boolean)=Standard_False

Returns:
	None

the surface of <F> will be the the surface of each new  
         faces built.  
         <Proj> is used to update pcurves on edges if necessary.  
         See Add().") Init;
		void Init (const TopoDS_Face & F,const Standard_Boolean Proj = Standard_False,const Standard_Boolean ControlOrientation = Standard_False);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

Add the wire <W> to the set of wires.  
 
 Warning:  
         The Wires must be closed.  
 
         The edges of <W> can be modified if they  have not pcurves  
         on the surface <S>  of <F>. In this  case  
         if <Proj> is false the first pcurve of  the edge  
         is positionned on <S>.  
         if <Proj> is True ,the Pcurve On <S> is the  
         projection of the  curve 3d on <F>.") Add;
		void Add (TopoDS_Wire & W);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all the Wires") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Evaluate all the faces limited by the set of Wires.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Current;
		TopoDS_Face Current ();
};


%feature("shadow") BRepAlgo_FaceRestrictor::~BRepAlgo_FaceRestrictor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_FaceRestrictor {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_Image;
class BRepAlgo_Image {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAlgo_Image;
		 BRepAlgo_Image ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetRoot;
		void SetRoot (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	OldS(TopoDS_Shape)
	NewS(TopoDS_Shape)

Returns:
	None

Links <NewS> as image of <OldS>.") Bind;
		void Bind (const TopoDS_Shape & OldS,const TopoDS_Shape & NewS);
		%feature("autodoc", "Args:
	OldS(TopoDS_Shape)
	NewS(TopTools_ListOfShape)

Returns:
	None

Links <NewS> as image of <OldS>.") Bind;
		void Bind (const TopoDS_Shape & OldS,const TopTools_ListOfShape & NewS);
		%feature("autodoc", "Args:
	OldS(TopoDS_Shape)
	NewS(TopoDS_Shape)

Returns:
	None

Add <NewS> to the image of <OldS>.") Add;
		void Add (const TopoDS_Shape & OldS,const TopoDS_Shape & NewS);
		%feature("autodoc", "Args:
	OldS(TopoDS_Shape)
	NewS(TopTools_ListOfShape)

Returns:
	None

Add <NewS> to the image of <OldS>.") Add;
		void Add (const TopoDS_Shape & OldS,const TopTools_ListOfShape & NewS);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Remove <S> to set of images.") Remove;
		void Remove (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Roots;
		const TopTools_ListOfShape & Roots ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsImage;
		Standard_Boolean IsImage (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the generator of <S>") ImageFrom;
		const TopoDS_Shape & ImageFrom (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the upper generator of <S>") Root;
		const TopoDS_Shape & Root (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasImage;
		Standard_Boolean HasImage (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the Image of <S>.  
         Returns <S> in the list if HasImage(S) is false.") Image;
		const TopTools_ListOfShape & Image (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	L(TopTools_ListOfShape)

Returns:
	None

Stores in <L> the images of images of...images of <S>.  
         <L> contains only <S> if  HasImage(S) is false.") LastImage;
		void LastImage (const TopoDS_Shape & S,TopTools_ListOfShape & L);
		%feature("autodoc", "Args:
	None
Returns:
	None

Keeps only the link between roots and lastimage.") Compact;
		void Compact ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ShapeType(TopAbs_ShapeEnum)

Returns:
	None

Deletes in the images the shape of type <ShapeType>  
         which are not in <S>.  
 Warning:  Compact() must be call before.") Filter;
		void Filter (const TopoDS_Shape & S,const TopAbs_ShapeEnum ShapeType);
};


%feature("shadow") BRepAlgo_Image::~BRepAlgo_Image %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_Image {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_Loop;
class BRepAlgo_Loop {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAlgo_Loop;
		 BRepAlgo_Loop ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Init with <F> the set of edges must have  
         pcurves on <F>.") Init;
		void Init (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	LV(TopTools_ListOfShape)

Returns:
	None

Add E with <LV>. <E> will be copied and trim  
         by vertices in <LV>.") AddEdge;
		void AddEdge (TopoDS_Edge & E,const TopTools_ListOfShape & LV);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Add <E> as const edge, E can be in the result.") AddConstEdge;
		void AddConstEdge (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	LE(TopTools_ListOfShape)

Returns:
	None

Add <LE> as a set of const edges.") AddConstEdges;
		void AddConstEdges (const TopTools_ListOfShape & LE);
		%feature("autodoc", "Args:
	None
Returns:
	None

Make loops.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	VonE(TopTools_ListOfShape)
	NE(TopTools_ListOfShape)

Returns:
	None

Cut the  edge <E>  in  several edges  <NE> on the  
         vertices<VonE>.") CutEdge;
		void CutEdge (const TopoDS_Edge & E,const TopTools_ListOfShape & VonE,TopTools_ListOfShape & NE);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns the list of wires performed.  
         can be an empty list.") NewWires;
		const TopTools_ListOfShape & NewWires ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Build faces from the wires result.") WiresToFaces;
		void WiresToFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns the list of faces.  
 Warning: The method <WiresToFaces> as to be called before.  
         can be an empty list.") NewFaces;
		const TopTools_ListOfShape & NewFaces ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopTools_ListOfShape

Returns the list of new edges built from an edge <E>  
         it can be an empty list.") NewEdges;
		const TopTools_ListOfShape & NewEdges (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	VerVerMap(TopTools_DataMapOfShapeShape)

Returns:
	None

Returns the datamap of vertices with their substitutes.") GetVerticesForSubstitute;
		void GetVerticesForSubstitute (TopTools_DataMapOfShapeShape & VerVerMap);
		%feature("autodoc", "Args:
	VerVerMap(TopTools_DataMapOfShapeShape)

Returns:
	None

No detailed docstring for this function.") VerticesForSubstitute;
		void VerticesForSubstitute (TopTools_DataMapOfShapeShape & VerVerMap);
};


%feature("shadow") BRepAlgo_Loop::~BRepAlgo_Loop %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_Loop {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_NormalProjection;
class BRepAlgo_NormalProjection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	ToProj(TopoDS_Shape)

Returns:
	None

Add an edge or a wire to the list of shape to project") Add;
		void Add (const TopoDS_Shape & ToProj);
		%feature("autodoc", "Args:
	Tol3D(Standard_Real)
	Tol2D(Standard_Real)
	InternalContinuity(GeomAbs_Shape)
	MaxDegree(Standard_Integer)
	MaxSeg(Standard_Integer)

Returns:
	None

Set the parameters  used  for computation  
         Tol3d is the requiered  tolerance between the  3d projected  
         curve  and its 2d representation  
         InternalContinuity  is the order of constraints  
         used for  approximation.  
         MaxDeg and MaxSeg are the maximum degree and the maximum  
         number of segment for BSpline resulting of an approximation.") SetParams;
		void SetParams (const Standard_Real Tol3D,const Standard_Real Tol2D,const GeomAbs_Shape InternalContinuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSeg);
		%feature("autodoc", "Args:
	None
Returns:
	None

Set the parameters  used  for computation  
         in their default values") SetDefaultParams;
		void SetDefaultParams ();
		%feature("autodoc", "Args:
	MaxDist(Standard_Real)

Returns:
	None

Sets the maximum distance between target shape and  
 shape to project. If this condition is not satisfied then  
 corresponding part of solution is discarded.  
 if MaxDist < 0 then this method does not affect the algorithm") SetMaxDistance;
		void SetMaxDistance (const Standard_Real MaxDist);
		%feature("autodoc", "Args:
	With3d(Standard_Boolean)=Standard_True

Returns:
	None

if  With3d = Standard_False the 3dcurve is not computed  
the  initial 3dcurve is kept  to  build the  resulting edges.") Compute3d;
		void Compute3d (const Standard_Boolean With3d = Standard_True);
		%feature("autodoc", "Args:
	FaceBoundaries(Standard_Boolean)=Standard_True

Returns:
	None

Manage  limitation  of  projected  edges.") SetLimit;
		void SetLimit (const Standard_Boolean FaceBoundaries = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds the result as a  compound.") Build;
		void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the result") Projection;
		const TopoDS_Shape & Projection ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopoDS_Shape

For a resulting edge, returns the corresponding initial edge.") Ancestor;
		const TopoDS_Shape & Ancestor (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopoDS_Shape

For a projected edge, returns the corresponding initial face.") Couple;
		const TopoDS_Shape & Couple (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the  list   of shapes generated   from the  
         shape <S>.") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsElementary;
		Standard_Boolean IsElementary (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	Liste(TopTools_ListOfShape)

Returns:
	Standard_Boolean

build the result as a list of wire if possible in --  
 a first returns a wire only if there is only a wire.") BuildWire;
		Standard_Boolean BuildWire (TopTools_ListOfShape & Liste);
};


%feature("shadow") BRepAlgo_NormalProjection::~BRepAlgo_NormalProjection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_NormalProjection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger;
class BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(TColStd_SequenceOfInteger)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger;
		 BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger (const TColStd_SequenceOfInteger & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Value;
		TColStd_SequenceOfInteger & Value ();
};


%feature("shadow") BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger::~BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger {
	Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger GetHandle() {
	return *(Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger*) &$self;
	}
};

%nodefaultctor Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger;
class Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger();
        Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger(const Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger &aHandle);
        Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger(const BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger {
    BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger* GetObject() {
    return (BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger::~Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepAlgo_SequenceOfSequenceOfInteger;
class BRepAlgo_SequenceOfSequenceOfInteger : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAlgo_SequenceOfSequenceOfInteger;
		 BRepAlgo_SequenceOfSequenceOfInteger ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(BRepAlgo_SequenceOfSequenceOfInteger)

Returns:
	BRepAlgo_SequenceOfSequenceOfInteger

No detailed docstring for this function.") Assign;
		const BRepAlgo_SequenceOfSequenceOfInteger & Assign (const BRepAlgo_SequenceOfSequenceOfInteger & Other);
		%feature("autodoc", "Args:
	Other(BRepAlgo_SequenceOfSequenceOfInteger)

Returns:
	BRepAlgo_SequenceOfSequenceOfInteger

No detailed docstring for this function.") operator=;
		const BRepAlgo_SequenceOfSequenceOfInteger & operator = (const BRepAlgo_SequenceOfSequenceOfInteger & Other);
		%feature("autodoc", "Args:
	T(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TColStd_SequenceOfInteger & T);
		%feature("autodoc", "Args:
	S(BRepAlgo_SequenceOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepAlgo_SequenceOfSequenceOfInteger & S);
		%feature("autodoc", "Args:
	T(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TColStd_SequenceOfInteger & T);
		%feature("autodoc", "Args:
	S(BRepAlgo_SequenceOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepAlgo_SequenceOfSequenceOfInteger & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TColStd_SequenceOfInteger & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepAlgo_SequenceOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepAlgo_SequenceOfSequenceOfInteger & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TColStd_SequenceOfInteger & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepAlgo_SequenceOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepAlgo_SequenceOfSequenceOfInteger & S);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") First;
		const TColStd_SequenceOfInteger & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Last;
		const TColStd_SequenceOfInteger & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(BRepAlgo_SequenceOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,BRepAlgo_SequenceOfSequenceOfInteger & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Value;
		const TColStd_SequenceOfInteger & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_SequenceOfInteger & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") ChangeValue;
		TColStd_SequenceOfInteger & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") BRepAlgo_SequenceOfSequenceOfInteger::~BRepAlgo_SequenceOfSequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_SequenceOfSequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_Tool;
class BRepAlgo_Tool {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Boundary(TopTools_MapOfShape)

Returns:
	static TopoDS_Shape

Remove the non valid   part of an offsetshape  
         1 - Remove all the free boundary  and the faces  
         connex to such edges.  
         2 - Remove all the shapes not  valid in the result  
         (according to the side of offseting)  
  in this verion only the first point is implemented.") Deboucle3D;
		static TopoDS_Shape Deboucle3D (const TopoDS_Shape & S,const TopTools_MapOfShape & Boundary);
};


%feature("shadow") BRepAlgo_Tool::~BRepAlgo_Tool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_Tool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_Common;
class BRepAlgo_Common : public BRepAlgo_BooleanOperation {
	public:
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Constructs the common part of shapes S1 and S2.") BRepAlgo_Common;
		 BRepAlgo_Common (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
};


%feature("shadow") BRepAlgo_Common::~BRepAlgo_Common %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_Common {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_Cut;
class BRepAlgo_Cut : public BRepAlgo_BooleanOperation {
	public:
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Cuts the shape S2 from the shape S1.") BRepAlgo_Cut;
		 BRepAlgo_Cut (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
};


%feature("shadow") BRepAlgo_Cut::~BRepAlgo_Cut %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_Cut {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_Fuse;
class BRepAlgo_Fuse : public BRepAlgo_BooleanOperation {
	public:
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Fuse S1 and S2.") BRepAlgo_Fuse;
		 BRepAlgo_Fuse (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
};


%feature("shadow") BRepAlgo_Fuse::~BRepAlgo_Fuse %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_Fuse {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgo_Section;
class BRepAlgo_Section : public BRepAlgo_BooleanOperation {
	public:
		%feature("autodoc", "Args:
	Sh1(TopoDS_Shape)
	Sh2(TopoDS_Shape)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") BRepAlgo_Section;
		 BRepAlgo_Section (const TopoDS_Shape & Sh1,const TopoDS_Shape & Sh2,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	Pl(gp_Pln)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") BRepAlgo_Section;
		 BRepAlgo_Section (const TopoDS_Shape & Sh,const gp_Pln & Pl,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	Sf(Handle_Geom_Surface)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") BRepAlgo_Section;
		 BRepAlgo_Section (const TopoDS_Shape & Sh,const Handle_Geom_Surface & Sf,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	Sf(Handle_Geom_Surface)
	Sh(TopoDS_Shape)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") BRepAlgo_Section;
		 BRepAlgo_Section (const Handle_Geom_Surface & Sf,const TopoDS_Shape & Sh,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	Sf1(Handle_Geom_Surface)
	Sf2(Handle_Geom_Surface)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

This and the above algorithms construct a framework for computing the section lines of  
- the two shapes Sh1 and Sh2, or  
- the shape Sh and the plane Pl, or  
- the shape Sh and the surface Sf, or  
- the surface Sf and the shape Sh, or  
- the two surfaces Sf1 and Sf2,  
  and builds the result if PerformNow equals true, its  
default value. If PerformNow equals false, the  
intersection will be computed later by the function Build.  
The constructed shape will be returned by the  
function Shape. This is a compound object  
composed of edges. These intersection edges may be built:  
- on new intersection lines, or  
- on coincident portions of edges in the two intersected shapes.  
  These intersection edges are independent: they  
are not chained or grouped in wires.  
If no intersection edge exists, the result is an empty compound object.  
Note that other objects than TopoDS_Shape  
shapes involved in these syntaxes are converted  
into faces or shells before performing the  
computation of the intersection. A shape resulting  
from this conversion can be retrieved with the  
function Shape1 or Shape2.  
Parametric 2D curves on intersection edges  
No parametric 2D curve (pcurve) is defined for  
each elementary edge of the result. To attach such  
parametric curves to the constructed edges you  
may use a constructor with the PerformNow flag  
equal to false; then you use:  
- the function ComputePCurveOn1 to ask for the  
  additional computation of a pcurve in the  
  parametric space of the first shape,  
- the function ComputePCurveOn2 to ask for the  
  additional computation of a pcurve in the  
  parametric space of the second shape,  
- in the end, the function Build to construct the result.  
  Note that as a result, pcurves will only be added on  
edges built on new intersection lines.  
Approximation of intersection edges  
The underlying 3D geometry attached to each  
elementary edge of the result is:  
- analytic where possible, provided the  
  corresponding geometry corresponds to a type  
  of analytic curve defined in the Geom package;  
  for example, the intersection of a cylindrical  
  shape with a plane gives an ellipse or a circle;  
- or elsewhere, given as a succession of points  
  grouped together in a BSpline curve of degree 1.  
  If you prefer to have an attached 3D geometry  
which is a BSpline approximation of the computed  
set of points on computed elementary intersection  
edges whose underlying geometry is not analytic,  
you may use a constructor with the PerformNow  
flag equal to false. Then you use:  
- the function Approximation to ask for this  
  computation option, and  
- the function Build to construct the result.  
  Note that as a result, approximations will only be  
computed on edges built on new intersection lines.  
Example  
  You may also combine these computation options.  
In the following example:  
- each elementary edge of the computed  
  intersection, built on a new intersection line,  
  which does not correspond to an analytic Geom  
  curve, will be approximated by a BSpline curve  
  whose degree is not greater than 8.  
- each elementary edge built on a new intersection line, will have:  
  - a pcurve in the parametric space of the shape S1,  
  - no pcurve in the parametric space of the shape S2.  
    // TopoDS_Shape S1 = ... , S2 = ... ;  
Standard_Boolean PerformNow = Standard_False;  
BRepAlgo_Section S ( S1, S2, PerformNow );  
S.ComputePCurveOn1 (Standard_True);  
S.Approximation (Standard_True);  
S.Build();  
TopoDS_Shape R = S.Shape();") BRepAlgo_Section;
		 BRepAlgo_Section (const Handle_Geom_Surface & Sf1,const Handle_Geom_Surface & Sf2,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)

Returns:
	None

Initializes the first part") Init1;
		void Init1 (const TopoDS_Shape & S1);
		%feature("autodoc", "Args:
	Pl(gp_Pln)

Returns:
	None

Initializes the first part") Init1;
		void Init1 (const gp_Pln & Pl);
		%feature("autodoc", "Args:
	Sf(Handle_Geom_Surface)

Returns:
	None

Initializes the first part") Init1;
		void Init1 (const Handle_Geom_Surface & Sf);
		%feature("autodoc", "Args:
	S2(TopoDS_Shape)

Returns:
	None

initialize second part") Init2;
		void Init2 (const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	Pl(gp_Pln)

Returns:
	None

Initializes the second part") Init2;
		void Init2 (const gp_Pln & Pl);
		%feature("autodoc", "Args:
	Sf(Handle_Geom_Surface)

Returns:
	None

This and the above algorithms  
  reinitialize the first and the second parts on which  
this algorithm is going to perform the intersection  
computation. This is done with either: the surface  
Sf, the plane Pl or the shape Sh.  
You use the function Build to construct the result.") Init2;
		void Init2 (const Handle_Geom_Surface & Sf);
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

Defines an option for computation of further  
intersections. This computation will be performed by  
the function Build in this framework.  
By default, the underlying 3D geometry attached to  
each elementary edge of the result of a computed intersection is:  
- analytic where possible, provided the  
  corresponding geometry corresponds to a type of  
  analytic curve defined in the Geom package; for  
  example the intersection of a cylindrical shape with  
  a plane gives an ellipse or a circle;  
- or elsewhere, given as a succession of points  
  grouped together in a BSpline curve of degree 1. If  
  Approx equals true, when further computations are  
  performed in this framework with the function  
  Build, these edges will have an attached 3D  
  geometry which is a BSpline approximation of the  
 computed set of points.  
  Note that as a result, approximations will be computed  
on edges built only on new intersection lines.") Approximation;
		void Approximation (const Standard_Boolean B);
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

Indicates if the Pcurve must be (or not) performed on first part.") ComputePCurveOn1;
		void ComputePCurveOn1 (const Standard_Boolean B);
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

Define options for the computation of further  
intersections which will be performed by the function  
Build in this framework.  
By default, no parametric 2D curve (pcurve) is defined  
for the elementary edges of the result.  
If ComputePCurve1 equals true, further computations  
performed in this framework with the function Build  
will attach an additional pcurve in the parametric  
space of the first shape to the constructed edges.  
If ComputePCurve2 equals true, the additional pcurve  
will be attached to the constructed edges in the  
parametric space of the second shape.  
These two functions may be used together.  
Note that as a result, pcurves will only be added onto  
edges built on new intersection lines.") ComputePCurveOn2;
		void ComputePCurveOn2 (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	None

Performs the computation of the section lines  
between the two parts defined at the time of  
construction of this framework or reinitialized with the  
Init1 and Init2 functions.  
The constructed shape will be returned by the function  
Shape. This is a compound object composed of  
edges. These intersection edges may be built:  
- on new intersection lines, or  
- on coincident portions of edges in the two intersected shapes.  
  These intersection edges are independent: they are  
not chained or grouped into wires.  
If no intersection edge exists, the result is an empty compound object.  
The shapes involved in the construction of the section  
lines can be retrieved with the function Shape1 or  
Shape2. Note that other objects than  
TopoDS_Shape shapes given as arguments at the  
construction time of this framework, or to the Init1 or  
  Init2 function, are converted into faces or shells  
before performing the computation of the intersection.  
Parametric 2D curves on intersection edges  
No parametric 2D curve (pcurve) is defined for the  
elementary edges of the result. To attach parametric  
curves like this to the constructed edges you have to use:  
- the function ComputePCurveOn1 to ask for the  
  additional computation of a pcurve in the  
  parametric space of the first shape,  
- the function ComputePCurveOn2 to ask for the  
  additional computation of a pcurve in the  
  parametric space of the second shape.  
This must be done before calling this function.  
Note that as a result, pcurves are added on edges  
built on new intersection lines only.  
Approximation of intersection edges  
The underlying 3D geometry attached to each  
elementary edge of the result is:  
- analytic where possible provided the corresponding  
  geometry corresponds to a type of analytic curve  
  defined in the Geom package; for example, the  
  intersection of a cylindrical shape with a plane  
  gives an ellipse or a circle; or  
- elsewhere, given as a succession of points grouped  
  together in a BSpline curve of degree 1.  
  If, on computed elementary intersection edges whose  
underlying geometry is not analytic, you prefer to  
have an attached 3D geometry which is a BSpline  
approximation of the computed set of points, you have  
to use the function Approximation to ask for this  
computation option before calling this function.  
You may also have combined these computation  
options: look at the example given above to illustrate  
the use of the constructors.") Build;
		void Build ();
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	F(TopoDS_Shape)

Returns:
	Standard_Boolean

//!Identifies the ancestor faces of the new  
intersection edge E resulting from the last  
computation performed in this framework, that is,  
the faces of the two original shapes on which the edge E lies:  
- HasAncestorFaceOn1 gives the ancestor face  
  in the first shape, and  
  These functions return:  
- true if an ancestor face F is found, or  
- false if not.  
  An ancestor face is identifiable for the edge E if the  
three following conditions are satisfied:  
- the first part on which this algorithm performed  
  its last computation is a shape, that is, it was not  
  given as a surface or a plane at the time of  
  construction of this algorithm or at a later time by  
  the Init1 function,  
- E is one of the elementary edges built by the last  
  computation of this section algorithm,  
- the edge E is built on an intersection curve. In  
  other words, E is a new edge built on the  
  intersection curve, not on edges belonging to the  
  intersecting shapes.  
  To use these functions properly, you have to test  
the returned Boolean value before using the  
ancestor face: F is significant only if the returned  
Boolean value equals true.") HasAncestorFaceOn1;
		Standard_Boolean HasAncestorFaceOn1 (const TopoDS_Shape & E,TopoDS_Shape & F);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	F(TopoDS_Shape)

Returns:
	Standard_Boolean

Identifies the ancestor faces of the new  
intersection edge E resulting from the last  
computation performed in this framework, that is,  
the faces of the two original shapes on which the edge E lies:  
- HasAncestorFaceOn2 gives the ancestor face in the second shape.  
  These functions return:  
- true if an ancestor face F is found, or  
- false if not.  
  An ancestor face is identifiable for the edge E if the  
three following conditions are satisfied:  
- the first part on which this algorithm performed  
  its last computation is a shape, that is, it was not  
  given as a surface or a plane at the time of  
  construction of this algorithm or at a later time by  
  the Init1 function,  
- E is one of the elementary edges built by the last  
  computation of this section algorithm,  
- the edge E is built on an intersection curve. In  
  other words, E is a new edge built on the  
  intersection curve, not on edges belonging to the  
  intersecting shapes.  
  To use these functions properly, you have to test  
the returned Boolean value before using the  
ancestor face: F is significant only if the returned  
Boolean value equals true.") HasAncestorFaceOn2;
		Standard_Boolean HasAncestorFaceOn2 (const TopoDS_Shape & E,TopoDS_Shape & F);
};


%feature("shadow") BRepAlgo_Section::~BRepAlgo_Section %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgo_Section {
	void _kill_pointed() {
		delete $self;
	}
};
