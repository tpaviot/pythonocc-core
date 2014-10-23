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
%module (package="OCC") BRepAlgo

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
		%feature("autodoc", "	* this method makes a wire whose edges are C1 from a Wire whose edges could be G1. It removes a vertex between G1 edges. Option can be G1 or C1.

	:param Wire:
	:type Wire: TopoDS_Wire &
	:param Option:
	:type Option: GeomAbs_Shape
	:param AngularTolerance: default value is 1.0e-4
	:type AngularTolerance: float
	:rtype: TopoDS_Wire
") ConcatenateWire;
		static TopoDS_Wire ConcatenateWire (const TopoDS_Wire & Wire,const GeomAbs_Shape Option,const Standard_Real AngularTolerance = 1.0e-4);
		%feature("autodoc", "	* this method makes an edge from a wire. Junction points between edges of wire may be sharp, resulting curve of the resulting edge may be C0.

	:param Wire:
	:type Wire: TopoDS_Wire &
	:rtype: TopoDS_Edge
") ConcatenateWireC0;
		static TopoDS_Edge ConcatenateWireC0 (const TopoDS_Wire & Wire);
		%feature("autodoc", "	* Checks if the shape is 'correct'. If not, returns <Standard_False>, else returns <Standard_True>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsValid;
		static Standard_Boolean IsValid (const TopoDS_Shape & S);
		%feature("autodoc", "	* Checks if the Generated and Modified Faces from the shapes <arguments> in the shape <result> are 'correct'. The args may be empty, then all faces will be checked. If <Closed> is True, only closed shape are valid. If <GeomCtrl> is False the geometry of new  vertices and edges are not verified and the auto-intersection of new wires are not searched.

	:param theArgs:
	:type theArgs: TopTools_ListOfShape &
	:param theResult:
	:type theResult: TopoDS_Shape &
	:param closedSolid: default value is Standard_False
	:type closedSolid: bool
	:param GeomCtrl: default value is Standard_True
	:type GeomCtrl: bool
	:rtype: bool
") IsValid;
		static Standard_Boolean IsValid (const TopTools_ListOfShape & theArgs,const TopoDS_Shape & theResult,const Standard_Boolean closedSolid = Standard_False,const Standard_Boolean GeomCtrl = Standard_True);
		%feature("autodoc", "	* Checks if the shape is 'correct'. If not, returns <Standard_False>, else returns <Standard_True>. This method differs from the previous one in the fact that no geometric contols (intersection of wires, pcurve validity) are performed.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsTopologicallyValid;
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
		%feature("autodoc", "	* Creates an empty AsDes.

	:rtype: None
") BRepAlgo_AsDes;
		 BRepAlgo_AsDes ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Stores <SS> as a futur subshape of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:param SS:
	:type SS: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & S,const TopoDS_Shape & SS);
		%feature("autodoc", "	* Stores <SS> as futurs SubShapes of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:param SS:
	:type SS: TopTools_ListOfShape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & S,const TopTools_ListOfShape & SS);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") HasAscendant;
		Standard_Boolean HasAscendant (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") HasDescendant;
		Standard_Boolean HasDescendant (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the Shape containing <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Ascendant;
		const TopTools_ListOfShape & Ascendant (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns futur subhapes of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Descendant;
		const TopTools_ListOfShape & Descendant (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns futur subhapes of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") ChangeDescendant;
		TopTools_ListOfShape & ChangeDescendant (const TopoDS_Shape & S);
		%feature("autodoc", "	* Replace <OldS> by <NewS>. <OldS> disapear from <self>.

	:param OldS:
	:type OldS: TopoDS_Shape &
	:param NewS:
	:type NewS: TopoDS_Shape &
	:rtype: None
") Replace;
		void Replace (const TopoDS_Shape & OldS,const TopoDS_Shape & NewS);
		%feature("autodoc", "	* Remove <S> from me.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Remove;
		void Remove (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns True if (S1> and <S2> has common Descendants. Stores in <LC> the Commons Descendants.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param LC:
	:type LC: TopTools_ListOfShape &
	:rtype: bool
") HasCommonDescendant;
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
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	:rtype: None
") PerformDS;
		void PerformDS ();
		%feature("autodoc", "	:param St1:
	:type St1: TopAbs_State
	:param St2:
	:type St2: TopAbs_State
	:rtype: None
") Perform;
		void Perform (const TopAbs_State St1,const TopAbs_State St2);
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_HBuilder
") Builder;
		Handle_TopOpeBRepBuild_HBuilder Builder ();
		%feature("autodoc", "	* Returns the first shape involved in this Boolean operation.

	:rtype: TopoDS_Shape
") Shape1;
		const TopoDS_Shape & Shape1 ();
		%feature("autodoc", "	* Returns the second shape involved in this Boolean operation.

	:rtype: TopoDS_Shape
") Shape2;
		const TopoDS_Shape & Shape2 ();
		%feature("autodoc", "	* Returns the list of shapes modified from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
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
		%feature("autodoc", "	:rtype: None
") BRepAlgo_BooleanOperations;
		 BRepAlgo_BooleanOperations ();
		%feature("autodoc", "	* S1 is a Shell with ALL faces supported by the SAME S2 is an Edge INCLUDED in that surface with pcurve. this avoids a time-consuming 3D operation, compared to Shapes.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") Shapes2d;
		void Shapes2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	* Defines the arguments.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") Shapes;
		void Shapes (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	* Sets different parameters for the curve approximations : NbPntMax : Maximum number of points to be approximated at  the same time in one curve. Tol3D, Tol2D : Tolerances to be reached by the approximation. RelativeTol : The given tolerances are relative.

	:param NbPntMax:
	:type NbPntMax: Standard_Integer
	:param Tol3D:
	:type Tol3D: float
	:param Tol2D:
	:type Tol2D: float
	:param RelativeTol:
	:type RelativeTol: bool
	:rtype: None
") SetApproxParameters;
		void SetApproxParameters (const Standard_Integer NbPntMax,const Standard_Real Tol3D,const Standard_Real Tol2D,const Standard_Boolean RelativeTol);
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Define;
		void Define (const TopoDS_Shape & S1,const TopoDS_Shape & S2,Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	* returns the common part of the shapes.

	:rtype: TopoDS_Shape
") Common;
		const TopoDS_Shape & Common ();
		%feature("autodoc", "	* returns the fuse part of the shapes.

	:rtype: TopoDS_Shape
") Fus;
		const TopoDS_Shape & Fus ();
		%feature("autodoc", "	* returns the cut part of the shapes.

	:rtype: TopoDS_Shape
") Cut;
		const TopoDS_Shape & Cut ();
		%feature("autodoc", "	* returns the intersection of the shapes.

	:rtype: TopoDS_Shape
") Section;
		const TopoDS_Shape & Section ();
		%feature("autodoc", "	* returns the result of the boolean operation.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "	* Returns the shape(s) resulting of the boolean operation issued from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ShapeFrom;
		const TopoDS_Shape & ShapeFrom (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the list of the descendant shapes of the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the fact that the shape <S> has been deleted or not by the boolean operation.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		Standard_Boolean IsDeleted (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_HDataStructure
") DataStructure;
		const Handle_TopOpeBRepDS_HDataStructure & DataStructure ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_HDataStructure
") ChangeDataStructure;
		Handle_TopOpeBRepDS_HDataStructure & ChangeDataStructure ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_HBuilder
") Builder;
		const Handle_TopOpeBRepBuild_HBuilder & Builder ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_HBuilder
") ChangeBuilder;
		Handle_TopOpeBRepBuild_HBuilder & ChangeBuilder ();
		%feature("autodoc", "	* returns the member myDSA. It is useful to then access the method GetSectionEdgeSet (wich is a member of DSAccess)

	:rtype: BRepAlgo_DSAccess
") DataStructureAccess;
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
		%feature("autodoc", "	:rtype: None
") BRepAlgo_DSAccess;
		 BRepAlgo_DSAccess ();
		%feature("autodoc", "	* Clears the internal data structure, including the

	:rtype: None
") Init;
		void Init ();
		%feature("autodoc", "	* Loads the shape in DS.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Load;
		void Load (const TopoDS_Shape & S);
		%feature("autodoc", "	* Loads two shapes in the DS without intersecting them.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") Load;
		void Load (TopoDS_Shape & S1,TopoDS_Shape & S2);
		%feature("autodoc", "	* Intersects two shapes at input and loads the DS with their intersection. Clears the TopOpeBRepBuild_HBuilder if necessary

	:rtype: None
") Intersect;
		void Intersect ();
		%feature("autodoc", "	* Intersects the faces contained in two given shapes and loads them in the DS. Clears the TopOpeBRepBuild_HBuilder if necessary

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") Intersect;
		void Intersect (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	* This method does the same thing as the previous, but faster. There is no intersection face/face 3D. The faces have the same support(surface). No test of tangency (that is why it is faster). Intersects in 2d the faces tangent F1 anf F2.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") SameDomain;
		void SameDomain (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	* returns compounds of Edge connected with section, which contains sections between faces contained in S1 and S2. returns an empty list of Shape if S1 or S2 do not contain face. calls GetSectionEdgeSet() if it has not already been done

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") GetSectionEdgeSet;
		const TopTools_ListOfShape & GetSectionEdgeSet (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	* returns all compounds of edges connected with section contained in the DS

	:rtype: TopTools_ListOfShape
") GetSectionEdgeSet;
		const TopTools_ListOfShape & GetSectionEdgeSet ();
		%feature("autodoc", "	* NYI

	:param Compound:
	:type Compound: TopoDS_Shape &
	:rtype: bool
") IsWire;
		Standard_Boolean IsWire (const TopoDS_Shape & Compound);
		%feature("autodoc", "	* NYI

	:param Compound:
	:type Compound: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Wire;
		const TopoDS_Shape & Wire (const TopoDS_Shape & Compound);
		%feature("autodoc", "	* NYI returns the vertex of section, which contains the section between face S1 and edge S2 (returns an empty Shape if S1 is not a face or if S2 is not an edge)

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") SectionVertex;
		const TopTools_ListOfShape & SectionVertex (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	* Invalidates a complete line of section. All Edges connected by Vertex or a Wire. Can be a group of connected Edges, which do not form a standard Wire.

	:param Compound:
	:type Compound: TopoDS_Shape &
	:rtype: None
") SuppressEdgeSet;
		void SuppressEdgeSet (const TopoDS_Shape & Compound);
		%feature("autodoc", "	* Modifies a line of section. <New> -- should be a Group of Edges connected by Vertex. -- Can be a Wire. Can be a group of connected Edges that do not form a standard Wire. <New> should be sub-groupn of <Old>

	:param Old:
	:type Old: TopoDS_Shape &
	:param New:
	:type New: TopoDS_Shape &
	:rtype: None
") ChangeEdgeSet;
		void ChangeEdgeSet (const TopoDS_Shape & Old,const TopoDS_Shape & New);
		%feature("autodoc", "	* NYI Make invalid a Vertex of section. The Vertex shoud be reconstructed from a point.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") SuppressSectionVertex;
		void SuppressSectionVertex (const TopoDS_Vertex & V);
		%feature("autodoc", "	:param state1:
	:type state1: TopAbs_State
	:param state2:
	:type state2: TopAbs_State
	:rtype: TopoDS_Shape
") Merge;
		const TopoDS_Shape & Merge (const TopAbs_State state1,const TopAbs_State state2);
		%feature("autodoc", "	:param state1:
	:type state1: TopAbs_State
	:rtype: TopoDS_Shape
") Merge;
		const TopoDS_Shape & Merge (const TopAbs_State state1);
		%feature("autodoc", "	* NYI Propagation of a state starting from the shape FromShape = edge or vertex of section, face or Coumpound de section. LoadShape is either S1, or S2 (see the method Load). Propagation from FromShape, on the states <what> of LoadShape. Return a Wire in 2d, a Shell in 3d. Specifications are incomplete, to be redefined for the typologies correpsonding to <FromShape> and the result : exemple : FromShape resultat  vertex  wire (or edge)  edge of section face (or shell)  compound of section shell ... ...

	:param what:
	:type what: TopAbs_State
	:param FromShape:
	:type FromShape: TopoDS_Shape &
	:param LoadShape:
	:type LoadShape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Propagate;
		const TopoDS_Shape & Propagate (const TopAbs_State what,const TopoDS_Shape & FromShape,const TopoDS_Shape & LoadShape);
		%feature("autodoc", "	* SectionShape est soit un Vertex de section(NYI), soit une Edge de section. Propagation des shapes de section en partant de SectionShape. return un Compound de section.

	:param SectionShape:
	:type SectionShape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") PropagateFromSection;
		const TopoDS_Shape & PropagateFromSection (const TopoDS_Shape & SectionShape);
		%feature("autodoc", "	* Returns the list of the descendant shapes of the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("autodoc", "	* NYI coherence of the internal Data Structure.

	:rtype: BRepAlgo_CheckStatus
") Check;
		BRepAlgo_CheckStatus Check ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_HDataStructure
") DS;
		const Handle_TopOpeBRepDS_HDataStructure & DS ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_HDataStructure
") ChangeDS;
		Handle_TopOpeBRepDS_HDataStructure & ChangeDS ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_HBuilder
") Builder;
		const Handle_TopOpeBRepBuild_HBuilder & Builder ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_HBuilder
") ChangeBuilder;
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
		%feature("autodoc", "	:rtype: None
") BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean;
		 BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean ();
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepAlgo_DataMapOfShapeBoolean &
	:rtype: None
") BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean;
		 BRepAlgo_DataMapIteratorOfDataMapOfShapeBoolean (const BRepAlgo_DataMapOfShapeBoolean & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepAlgo_DataMapOfShapeBoolean &
	:rtype: None
") Initialize;
		void Initialize (const BRepAlgo_DataMapOfShapeBoolean & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "	:rtype: bool
") Value;
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
		%feature("autodoc", "	:rtype: None
") BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference;
		 BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference ();
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepAlgo_DataMapOfShapeInterference &
	:rtype: None
") BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference;
		 BRepAlgo_DataMapIteratorOfDataMapOfShapeInterference (const BRepAlgo_DataMapOfShapeInterference & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepAlgo_DataMapOfShapeInterference &
	:rtype: None
") Initialize;
		void Initialize (const BRepAlgo_DataMapOfShapeInterference & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: bool
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean;
		 BRepAlgo_DataMapNodeOfDataMapOfShapeBoolean (const TopoDS_Shape & K,const Standard_Boolean & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepAlgo_DataMapNodeOfDataMapOfShapeInterference;
		 BRepAlgo_DataMapNodeOfDataMapOfShapeInterference (const TopoDS_Shape & K,const Handle_TopOpeBRepDS_Interference & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_Interference
") Value;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") BRepAlgo_DataMapOfShapeBoolean;
		 BRepAlgo_DataMapOfShapeBoolean (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: BRepAlgo_DataMapOfShapeBoolean &
	:rtype: BRepAlgo_DataMapOfShapeBoolean
") Assign;
		BRepAlgo_DataMapOfShapeBoolean & Assign (const BRepAlgo_DataMapOfShapeBoolean & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BRepAlgo_DataMapOfShapeBoolean &
	:rtype: BRepAlgo_DataMapOfShapeBoolean
") operator=;
		BRepAlgo_DataMapOfShapeBoolean & operator = (const BRepAlgo_DataMapOfShapeBoolean & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: bool
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Standard_Boolean & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Find;
		const Standard_Boolean & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") ChangeFind;
		Standard_Boolean & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") BRepAlgo_DataMapOfShapeInterference;
		 BRepAlgo_DataMapOfShapeInterference (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: BRepAlgo_DataMapOfShapeInterference &
	:rtype: BRepAlgo_DataMapOfShapeInterference
") Assign;
		BRepAlgo_DataMapOfShapeInterference & Assign (const BRepAlgo_DataMapOfShapeInterference & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BRepAlgo_DataMapOfShapeInterference &
	:rtype: BRepAlgo_DataMapOfShapeInterference
") operator=;
		BRepAlgo_DataMapOfShapeInterference & operator = (const BRepAlgo_DataMapOfShapeInterference & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Handle_TopOpeBRepDS_Interference
") Find;
		const Handle_TopOpeBRepDS_Interference & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Handle_TopOpeBRepDS_Interference
") ChangeFind;
		Handle_TopOpeBRepDS_Interference & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:rtype: None
") BRepAlgo_EdgeConnector;
		 BRepAlgo_EdgeConnector ();
		%feature("autodoc", "	:param e:
	:type e: TopoDS_Edge &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & e);
		%feature("autodoc", "	:param LOEdge:
	:type LOEdge: TopTools_ListOfShape &
	:rtype: None
") Add;
		void Add (TopTools_ListOfShape & LOEdge);
		%feature("autodoc", "	:param e:
	:type e: TopoDS_Shape &
	:rtype: None
") AddStart;
		void AddStart (const TopoDS_Shape & e);
		%feature("autodoc", "	:param LOEdge:
	:type LOEdge: TopTools_ListOfShape &
	:rtype: None
") AddStart;
		void AddStart (TopTools_ListOfShape & LOEdge);
		%feature("autodoc", "	:rtype: None
") ClearStartElement;
		void ClearStartElement ();
		%feature("autodoc", "	* returns a list of wire non standard

	:rtype: TopTools_ListOfShape
") MakeBlock;
		TopTools_ListOfShape & MakeBlock ();
		%feature("autodoc", "	:rtype: None
") Done;
		void Done ();
		%feature("autodoc", "	* NYI returns true if proceeded to MakeBlock()

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* NYI returns true if W is a Wire standard. W must belong to the list returned by MakeBlock.

	:param W:
	:type W: TopoDS_Shape &
	:rtype: bool
") IsWire;
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
		%feature("autodoc", "	:rtype: None
") BRepAlgo_FaceRestrictor;
		 BRepAlgo_FaceRestrictor ();
		%feature("autodoc", "	* the surface of <F> will be the the surface of each new faces built. <Proj> is used to update pcurves on edges if necessary. See Add().

	:param F:
	:type F: TopoDS_Face &
	:param Proj: default value is Standard_False
	:type Proj: bool
	:param ControlOrientation: default value is Standard_False
	:type ControlOrientation: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F,const Standard_Boolean Proj = Standard_False,const Standard_Boolean ControlOrientation = Standard_False);
		%feature("autodoc", "	* Add the wire <W> to the set of wires. Warning: The Wires must be closed.  The edges of <W> can be modified if they have not pcurves on the surface <S> of <F>. In this case if <Proj> is false the first pcurve of the edge is positionned on <S>. if <Proj> is True ,the Pcurve On <S> is the projection of the curve 3d on <F>.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") Add;
		void Add (TopoDS_Wire & W);
		%feature("autodoc", "	* Removes all the Wires

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Evaluate all the faces limited by the set of Wires.

	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") Current;
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
		%feature("autodoc", "	:rtype: None
") BRepAlgo_Image;
		 BRepAlgo_Image ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") SetRoot;
		void SetRoot (const TopoDS_Shape & S);
		%feature("autodoc", "	* Links <NewS> as image of <OldS>.

	:param OldS:
	:type OldS: TopoDS_Shape &
	:param NewS:
	:type NewS: TopoDS_Shape &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Shape & OldS,const TopoDS_Shape & NewS);
		%feature("autodoc", "	* Links <NewS> as image of <OldS>.

	:param OldS:
	:type OldS: TopoDS_Shape &
	:param NewS:
	:type NewS: TopTools_ListOfShape &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Shape & OldS,const TopTools_ListOfShape & NewS);
		%feature("autodoc", "	* Add <NewS> to the image of <OldS>.

	:param OldS:
	:type OldS: TopoDS_Shape &
	:param NewS:
	:type NewS: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & OldS,const TopoDS_Shape & NewS);
		%feature("autodoc", "	* Add <NewS> to the image of <OldS>.

	:param OldS:
	:type OldS: TopoDS_Shape &
	:param NewS:
	:type NewS: TopTools_ListOfShape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & OldS,const TopTools_ListOfShape & NewS);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Remove <S> to set of images.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Remove;
		void Remove (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Roots;
		const TopTools_ListOfShape & Roots ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsImage;
		Standard_Boolean IsImage (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the generator of <S>

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ImageFrom;
		const TopoDS_Shape & ImageFrom (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the upper generator of <S>

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Root;
		const TopoDS_Shape & Root (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") HasImage;
		Standard_Boolean HasImage (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the Image of <S>. Returns <S> in the list if HasImage(S) is false.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Image;
		const TopTools_ListOfShape & Image (const TopoDS_Shape & S);
		%feature("autodoc", "	* Stores in <L> the images of images of...images of <S>. <L> contains only <S> if HasImage(S) is false.

	:param S:
	:type S: TopoDS_Shape &
	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") LastImage;
		void LastImage (const TopoDS_Shape & S,TopTools_ListOfShape & L);
		%feature("autodoc", "	* Keeps only the link between roots and lastimage.

	:rtype: None
") Compact;
		void Compact ();
		%feature("autodoc", "	* Deletes in the images the shape of type <ShapeType> which are not in <S>. Warning: Compact() must be call before.

	:param S:
	:type S: TopoDS_Shape &
	:param ShapeType:
	:type ShapeType: TopAbs_ShapeEnum
	:rtype: None
") Filter;
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
		%feature("autodoc", "	:rtype: None
") BRepAlgo_Loop;
		 BRepAlgo_Loop ();
		%feature("autodoc", "	* Init with <F> the set of edges must have pcurves on <F>.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F);
		%feature("autodoc", "	* Add E with <LV>. <E> will be copied and trim by vertices in <LV>.

	:param E:
	:type E: TopoDS_Edge &
	:param LV:
	:type LV: TopTools_ListOfShape &
	:rtype: None
") AddEdge;
		void AddEdge (TopoDS_Edge & E,const TopTools_ListOfShape & LV);
		%feature("autodoc", "	* Add <E> as const edge, E can be in the result.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") AddConstEdge;
		void AddConstEdge (const TopoDS_Edge & E);
		%feature("autodoc", "	* Add <LE> as a set of const edges.

	:param LE:
	:type LE: TopTools_ListOfShape &
	:rtype: None
") AddConstEdges;
		void AddConstEdges (const TopTools_ListOfShape & LE);
		%feature("autodoc", "	* Make loops.

	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	* Cut the edge <E> in several edges <NE> on the vertices<VonE>.

	:param E:
	:type E: TopoDS_Edge &
	:param VonE:
	:type VonE: TopTools_ListOfShape &
	:param NE:
	:type NE: TopTools_ListOfShape &
	:rtype: None
") CutEdge;
		void CutEdge (const TopoDS_Edge & E,const TopTools_ListOfShape & VonE,TopTools_ListOfShape & NE);
		%feature("autodoc", "	* Returns the list of wires performed. can be an empty list.

	:rtype: TopTools_ListOfShape
") NewWires;
		const TopTools_ListOfShape & NewWires ();
		%feature("autodoc", "	* Build faces from the wires result.

	:rtype: None
") WiresToFaces;
		void WiresToFaces ();
		%feature("autodoc", "	* Returns the list of faces. Warning: The method <WiresToFaces> as to be called before. can be an empty list.

	:rtype: TopTools_ListOfShape
") NewFaces;
		const TopTools_ListOfShape & NewFaces ();
		%feature("autodoc", "	* Returns the list of new edges built from an edge <E> it can be an empty list.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges (const TopoDS_Edge & E);
		%feature("autodoc", "	* Returns the datamap of vertices with their substitutes.

	:param VerVerMap:
	:type VerVerMap: TopTools_DataMapOfShapeShape &
	:rtype: None
") GetVerticesForSubstitute;
		void GetVerticesForSubstitute (TopTools_DataMapOfShapeShape & VerVerMap);
		%feature("autodoc", "	:param VerVerMap:
	:type VerVerMap: TopTools_DataMapOfShapeShape &
	:rtype: None
") VerticesForSubstitute;
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
		%feature("autodoc", "	:rtype: None
") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	* Add an edge or a wire to the list of shape to project

	:param ToProj:
	:type ToProj: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & ToProj);
		%feature("autodoc", "	* Set the parameters used for computation Tol3d is the requiered tolerance between the 3d projected curve and its 2d representation InternalContinuity is the order of constraints used for approximation. MaxDeg and MaxSeg are the maximum degree and the maximum number of segment for BSpline resulting of an approximation.

	:param Tol3D:
	:type Tol3D: float
	:param Tol2D:
	:type Tol2D: float
	:param InternalContinuity:
	:type InternalContinuity: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: Standard_Integer
	:param MaxSeg:
	:type MaxSeg: Standard_Integer
	:rtype: None
") SetParams;
		void SetParams (const Standard_Real Tol3D,const Standard_Real Tol2D,const GeomAbs_Shape InternalContinuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSeg);
		%feature("autodoc", "	* Set the parameters used for computation in their default values

	:rtype: None
") SetDefaultParams;
		void SetDefaultParams ();
		%feature("autodoc", "	* Sets the maximum distance between target shape and shape to project. If this condition is not satisfied then corresponding part of solution is discarded. if MaxDist < 0 then this method does not affect the algorithm

	:param MaxDist:
	:type MaxDist: float
	:rtype: None
") SetMaxDistance;
		void SetMaxDistance (const Standard_Real MaxDist);
		%feature("autodoc", "	* if With3d = Standard_False the 3dcurve is not computed the initial 3dcurve is kept to build the resulting edges.

	:param With3d: default value is Standard_True
	:type With3d: bool
	:rtype: None
") Compute3d;
		void Compute3d (const Standard_Boolean With3d = Standard_True);
		%feature("autodoc", "	* Manage limitation of projected edges.

	:param FaceBoundaries: default value is Standard_True
	:type FaceBoundaries: bool
	:rtype: None
") SetLimit;
		void SetLimit (const Standard_Boolean FaceBoundaries = Standard_True);
		%feature("autodoc", "	* Builds the result as a compound.

	:rtype: None
") Build;
		void Build ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* returns the result

	:rtype: TopoDS_Shape
") Projection;
		const TopoDS_Shape & Projection ();
		%feature("autodoc", "	* For a resulting edge, returns the corresponding initial edge.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Shape
") Ancestor;
		const TopoDS_Shape & Ancestor (const TopoDS_Edge & E);
		%feature("autodoc", "	* For a projected edge, returns the corresponding initial face.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Shape
") Couple;
		const TopoDS_Shape & Couple (const TopoDS_Edge & E);
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: bool
") IsElementary;
		Standard_Boolean IsElementary (const Adaptor3d_Curve & C);
		%feature("autodoc", "	* build the result as a list of wire if possible in -- a first returns a wire only if there is only a wire.

	:param Liste:
	:type Liste: TopTools_ListOfShape &
	:rtype: bool
") BuildWire;
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
		%feature("autodoc", "	:param I:
	:type I: TColStd_SequenceOfInteger &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger;
		 BRepAlgo_SequenceNodeOfSequenceOfSequenceOfInteger (const TColStd_SequenceOfInteger & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") Value;
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
		%feature("autodoc", "	:rtype: None
") BRepAlgo_SequenceOfSequenceOfInteger;
		 BRepAlgo_SequenceOfSequenceOfInteger ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: BRepAlgo_SequenceOfSequenceOfInteger &
	:rtype: BRepAlgo_SequenceOfSequenceOfInteger
") Assign;
		const BRepAlgo_SequenceOfSequenceOfInteger & Assign (const BRepAlgo_SequenceOfSequenceOfInteger & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BRepAlgo_SequenceOfSequenceOfInteger &
	:rtype: BRepAlgo_SequenceOfSequenceOfInteger
") operator=;
		const BRepAlgo_SequenceOfSequenceOfInteger & operator = (const BRepAlgo_SequenceOfSequenceOfInteger & Other);
		%feature("autodoc", "	:param T:
	:type T: TColStd_SequenceOfInteger &
	:rtype: None
") Append;
		void Append (const TColStd_SequenceOfInteger & T);
		%feature("autodoc", "	:param S:
	:type S: BRepAlgo_SequenceOfSequenceOfInteger &
	:rtype: None
") Append;
		void Append (BRepAlgo_SequenceOfSequenceOfInteger & S);
		%feature("autodoc", "	:param T:
	:type T: TColStd_SequenceOfInteger &
	:rtype: None
") Prepend;
		void Prepend (const TColStd_SequenceOfInteger & T);
		%feature("autodoc", "	:param S:
	:type S: BRepAlgo_SequenceOfSequenceOfInteger &
	:rtype: None
") Prepend;
		void Prepend (BRepAlgo_SequenceOfSequenceOfInteger & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: TColStd_SequenceOfInteger &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TColStd_SequenceOfInteger & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: BRepAlgo_SequenceOfSequenceOfInteger &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepAlgo_SequenceOfSequenceOfInteger & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: TColStd_SequenceOfInteger &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TColStd_SequenceOfInteger & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: BRepAlgo_SequenceOfSequenceOfInteger &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepAlgo_SequenceOfSequenceOfInteger & S);
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") First;
		const TColStd_SequenceOfInteger & First ();
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") Last;
		const TColStd_SequenceOfInteger & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: BRepAlgo_SequenceOfSequenceOfInteger &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepAlgo_SequenceOfSequenceOfInteger & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TColStd_SequenceOfInteger
") Value;
		const TColStd_SequenceOfInteger & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: TColStd_SequenceOfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_SequenceOfInteger & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TColStd_SequenceOfInteger
") ChangeValue;
		TColStd_SequenceOfInteger & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	* Remove the non valid part of an offsetshape 1 - Remove all the free boundary and the faces connex to such edges. 2 - Remove all the shapes not valid in the result (according to the side of offseting) in this verion only the first point is implemented.

	:param S:
	:type S: TopoDS_Shape &
	:param Boundary:
	:type Boundary: TopTools_MapOfShape &
	:rtype: TopoDS_Shape
") Deboucle3D;
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
		%feature("autodoc", "	* Constructs the common part of shapes S1 and S2.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") BRepAlgo_Common;
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
		%feature("autodoc", "	* Cuts the shape S2 from the shape S1.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") BRepAlgo_Cut;
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
		%feature("autodoc", "	* Fuse S1 and S2.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") BRepAlgo_Fuse;
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
		%feature("autodoc", "	:param Sh1:
	:type Sh1: TopoDS_Shape &
	:param Sh2:
	:type Sh2: TopoDS_Shape &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgo_Section;
		 BRepAlgo_Section (const TopoDS_Shape & Sh1,const TopoDS_Shape & Sh2,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "	:param Sh:
	:type Sh: TopoDS_Shape &
	:param Pl:
	:type Pl: gp_Pln
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgo_Section;
		 BRepAlgo_Section (const TopoDS_Shape & Sh,const gp_Pln & Pl,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "	:param Sh:
	:type Sh: TopoDS_Shape &
	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgo_Section;
		 BRepAlgo_Section (const TopoDS_Shape & Sh,const Handle_Geom_Surface & Sf,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:param Sh:
	:type Sh: TopoDS_Shape &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgo_Section;
		 BRepAlgo_Section (const Handle_Geom_Surface & Sf,const TopoDS_Shape & Sh,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "	* This and the above algorithms construct a framework for computing the section lines of - the two shapes Sh1 and Sh2, or - the shape Sh and the plane Pl, or - the shape Sh and the surface Sf, or - the surface Sf and the shape Sh, or - the two surfaces Sf1 and Sf2, and builds the result if PerformNow equals true, its default value. If PerformNow equals false, the intersection will be computed later by the function Build. The constructed shape will be returned by the function Shape. This is a compound object composed of edges. These intersection edges may be built: - on new intersection lines, or - on coincident portions of edges in the two intersected shapes. These intersection edges are independent: they are not chained or grouped in wires. If no intersection edge exists, the result is an empty compound object. Note that other objects than TopoDS_Shape shapes involved in these syntaxes are converted into faces or shells before performing the computation of the intersection. A shape resulting from this conversion can be retrieved with the function Shape1 or Shape2. Parametric 2D curves on intersection edges No parametric 2D curve (pcurve) is defined for each elementary edge of the result. To attach such parametric curves to the constructed edges you may use a constructor with the PerformNow flag equal to false; then you use: - the function ComputePCurveOn1 to ask for the additional computation of a pcurve in the parametric space of the first shape, - the function ComputePCurveOn2 to ask for the additional computation of a pcurve in the parametric space of the second shape, - in the end, the function Build to construct the result. Note that as a result, pcurves will only be added on edges built on new intersection lines. Approximation of intersection edges The underlying 3D geometry attached to each elementary edge of the result is: - analytic where possible, provided the corresponding geometry corresponds to a type of analytic curve defined in the Geom package; for example, the intersection of a cylindrical shape with a plane gives an ellipse or a circle; - or elsewhere, given as a succession of points grouped together in a BSpline curve of degree 1. If you prefer to have an attached 3D geometry which is a BSpline approximation of the computed set of points on computed elementary intersection edges whose underlying geometry is not analytic, you may use a constructor with the PerformNow flag equal to false. Then you use: - the function Approximation to ask for this computation option, and - the function Build to construct the result. Note that as a result, approximations will only be computed on edges built on new intersection lines. Example You may also combine these computation options. In the following example: - each elementary edge of the computed intersection, built on a new intersection line, which does not correspond to an analytic Geom curve, will be approximated by a BSpline curve whose degree is not greater than 8. - each elementary edge built on a new intersection line, will have: - a pcurve in the parametric space of the shape S1, - no pcurve in the parametric space of the shape S2. // TopoDS_Shape S1 = ... , S2 = ... ; Standard_Boolean PerformNow = Standard_False; BRepAlgo_Section S ( S1, S2, PerformNow ); S.ComputePCurveOn1 (Standard_True); S.Approximation (Standard_True); S.Build(); TopoDS_Shape R = S.Shape();

	:param Sf1:
	:type Sf1: Handle_Geom_Surface &
	:param Sf2:
	:type Sf2: Handle_Geom_Surface &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgo_Section;
		 BRepAlgo_Section (const Handle_Geom_Surface & Sf1,const Handle_Geom_Surface & Sf2,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "	* Initializes the first part

	:param S1:
	:type S1: TopoDS_Shape &
	:rtype: None
") Init1;
		void Init1 (const TopoDS_Shape & S1);
		%feature("autodoc", "	* Initializes the first part

	:param Pl:
	:type Pl: gp_Pln
	:rtype: None
") Init1;
		void Init1 (const gp_Pln & Pl);
		%feature("autodoc", "	* Initializes the first part

	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:rtype: None
") Init1;
		void Init1 (const Handle_Geom_Surface & Sf);
		%feature("autodoc", "	* initialize second part

	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") Init2;
		void Init2 (const TopoDS_Shape & S2);
		%feature("autodoc", "	* Initializes the second part

	:param Pl:
	:type Pl: gp_Pln
	:rtype: None
") Init2;
		void Init2 (const gp_Pln & Pl);
		%feature("autodoc", "	* This and the above algorithms reinitialize the first and the second parts on which this algorithm is going to perform the intersection computation. This is done with either: the surface Sf, the plane Pl or the shape Sh. You use the function Build to construct the result.

	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:rtype: None
") Init2;
		void Init2 (const Handle_Geom_Surface & Sf);
		%feature("autodoc", "	* Defines an option for computation of further intersections. This computation will be performed by the function Build in this framework. By default, the underlying 3D geometry attached to each elementary edge of the result of a computed intersection is: - analytic where possible, provided the corresponding geometry corresponds to a type of analytic curve defined in the Geom package; for example the intersection of a cylindrical shape with a plane gives an ellipse or a circle; - or elsewhere, given as a succession of points grouped together in a BSpline curve of degree 1. If Approx equals true, when further computations are performed in this framework with the function Build, these edges will have an attached 3D geometry which is a BSpline approximation of the computed set of points. Note that as a result, approximations will be computed on edges built only on new intersection lines.

	:param B:
	:type B: bool
	:rtype: None
") Approximation;
		void Approximation (const Standard_Boolean B);
		%feature("autodoc", "	* Indicates if the Pcurve must be (or not) performed on first part.

	:param B:
	:type B: bool
	:rtype: None
") ComputePCurveOn1;
		void ComputePCurveOn1 (const Standard_Boolean B);
		%feature("autodoc", "	* Define options for the computation of further intersections which will be performed by the function Build in this framework. By default, no parametric 2D curve (pcurve) is defined for the elementary edges of the result. If ComputePCurve1 equals true, further computations performed in this framework with the function Build will attach an additional pcurve in the parametric space of the first shape to the constructed edges. If ComputePCurve2 equals true, the additional pcurve will be attached to the constructed edges in the parametric space of the second shape. These two functions may be used together. Note that as a result, pcurves will only be added onto edges built on new intersection lines.

	:param B:
	:type B: bool
	:rtype: None
") ComputePCurveOn2;
		void ComputePCurveOn2 (const Standard_Boolean B);
		%feature("autodoc", "	* Performs the computation of the section lines between the two parts defined at the time of construction of this framework or reinitialized with the Init1 and Init2 functions. The constructed shape will be returned by the function Shape. This is a compound object composed of edges. These intersection edges may be built: - on new intersection lines, or - on coincident portions of edges in the two intersected shapes. These intersection edges are independent: they are not chained or grouped into wires. If no intersection edge exists, the result is an empty compound object. The shapes involved in the construction of the section lines can be retrieved with the function Shape1 or Shape2. Note that other objects than TopoDS_Shape shapes given as arguments at the construction time of this framework, or to the Init1 or Init2 function, are converted into faces or shells before performing the computation of the intersection. Parametric 2D curves on intersection edges No parametric 2D curve (pcurve) is defined for the elementary edges of the result. To attach parametric curves like this to the constructed edges you have to use: - the function ComputePCurveOn1 to ask for the additional computation of a pcurve in the parametric space of the first shape, - the function ComputePCurveOn2 to ask for the additional computation of a pcurve in the parametric space of the second shape. This must be done before calling this function. Note that as a result, pcurves are added on edges built on new intersection lines only. Approximation of intersection edges The underlying 3D geometry attached to each elementary edge of the result is: - analytic where possible provided the corresponding geometry corresponds to a type of analytic curve defined in the Geom package; for example, the intersection of a cylindrical shape with a plane gives an ellipse or a circle; or - elsewhere, given as a succession of points grouped together in a BSpline curve of degree 1. If, on computed elementary intersection edges whose underlying geometry is not analytic, you prefer to have an attached 3D geometry which is a BSpline approximation of the computed set of points, you have to use the function Approximation to ask for this computation option before calling this function. You may also have combined these computation options: look at the example given above to illustrate the use of the constructors.

	:rtype: None
") Build;
		void Build ();
		%feature("autodoc", "	* //!Identifies the ancestor faces of the new intersection edge E resulting from the last computation performed in this framework, that is, the faces of the two original shapes on which the edge E lies: - HasAncestorFaceOn1 gives the ancestor face in the first shape, and These functions return: - true if an ancestor face F is found, or - false if not. An ancestor face is identifiable for the edge E if the three following conditions are satisfied: - the first part on which this algorithm performed its last computation is a shape, that is, it was not given as a surface or a plane at the time of construction of this algorithm or at a later time by the Init1 function, - E is one of the elementary edges built by the last computation of this section algorithm, - the edge E is built on an intersection curve. In other words, E is a new edge built on the intersection curve, not on edges belonging to the intersecting shapes. To use these functions properly, you have to test the returned Boolean value before using the ancestor face: F is significant only if the returned Boolean value equals true.

	:param E:
	:type E: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:rtype: bool
") HasAncestorFaceOn1;
		Standard_Boolean HasAncestorFaceOn1 (const TopoDS_Shape & E,TopoDS_Shape & F);
		%feature("autodoc", "	* Identifies the ancestor faces of the new intersection edge E resulting from the last computation performed in this framework, that is, the faces of the two original shapes on which the edge E lies: - HasAncestorFaceOn2 gives the ancestor face in the second shape. These functions return: - true if an ancestor face F is found, or - false if not. An ancestor face is identifiable for the edge E if the three following conditions are satisfied: - the first part on which this algorithm performed its last computation is a shape, that is, it was not given as a surface or a plane at the time of construction of this algorithm or at a later time by the Init1 function, - E is one of the elementary edges built by the last computation of this section algorithm, - the edge E is built on an intersection curve. In other words, E is a new edge built on the intersection curve, not on edges belonging to the intersecting shapes. To use these functions properly, you have to test the returned Boolean value before using the ancestor face: F is significant only if the returned Boolean value equals true.

	:param E:
	:type E: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:rtype: bool
") HasAncestorFaceOn2;
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
