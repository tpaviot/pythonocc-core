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
%module (package="OCC") BRepFeat

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

%include BRepFeat_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum BRepFeat_PerfSelection {
	BRepFeat_NoSelection = 0,
	BRepFeat_SelectionFU = 1,
	BRepFeat_SelectionU = 2,
	BRepFeat_SelectionSh = 3,
	BRepFeat_SelectionShU = 4,
};

enum BRepFeat_Status {
	BRepFeat_NoError = 0,
	BRepFeat_InvalidPlacement = 1,
	BRepFeat_HoleTooLong = 2,
};

enum BRepFeat_StatusError {
	BRepFeat_OK = 0,
	BRepFeat_BadDirect = 1,
	BRepFeat_BadIntersect = 2,
	BRepFeat_EmptyBaryCurve = 3,
	BRepFeat_EmptyCutResult = 4,
	BRepFeat_FalseSide = 5,
	BRepFeat_IncDirection = 6,
	BRepFeat_IncSlidFace = 7,
	BRepFeat_IncParameter = 8,
	BRepFeat_IncTypes = 9,
	BRepFeat_IntervalOverlap = 10,
	BRepFeat_InvFirstShape = 11,
	BRepFeat_InvOption = 12,
	BRepFeat_InvShape = 13,
	BRepFeat_LocOpeNotDone = 14,
	BRepFeat_LocOpeInvNotDone = 15,
	BRepFeat_NoExtFace = 16,
	BRepFeat_NoFaceProf = 17,
	BRepFeat_NoGluer = 18,
	BRepFeat_NoIntersectF = 19,
	BRepFeat_NoIntersectU = 20,
	BRepFeat_NoParts = 21,
	BRepFeat_NoProjPt = 22,
	BRepFeat_NotInitialized = 23,
	BRepFeat_NotYetImplemented = 24,
	BRepFeat_NullRealTool = 25,
	BRepFeat_NullToolF = 26,
	BRepFeat_NullToolU = 27,
};

/* end public enums declaration */

%rename(brepfeat) BRepFeat;
%nodefaultctor BRepFeat;
class BRepFeat {
	public:
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Pt:
	:type Pt: TColgp_SequenceOfPnt
	:rtype: void
") SampleEdges;
		static void SampleEdges (const TopoDS_Shape & S,TColgp_SequenceOfPnt & Pt);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Pt:
	:type Pt: gp_Pnt
	:rtype: void
") Barycenter;
		static void Barycenter (const TopoDS_Shape & S,gp_Pnt & Pt);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: float
") ParametricBarycenter;
		static Standard_Real ParametricBarycenter (const TopoDS_Shape & S,const Handle_Geom_Curve & C);
		%feature("autodoc", "	* Ori = True taking account the orientation

	:param S:
	:type S: TopoDS_Shape &
	:param C:
	:type C: Handle_Geom_Curve &
	:param prmin:
	:type prmin: float &
	:param prmax:
	:type prmax: float &
	:param prbmin:
	:type prbmin: float &
	:param prbmax:
	:type prbmax: float &
	:param flag:
	:type flag: bool
	:param Ori: default value is Standard_False
	:type Ori: bool
	:rtype: void
") ParametricMinMax;
		static void ParametricMinMax (const TopoDS_Shape & S,const Handle_Geom_Curve & C,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean & flag,const Standard_Boolean Ori = Standard_False);
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: bool
") IsInside;
		static Standard_Boolean IsInside (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Face &
	:rtype: void
") FaceUntil;
		static void FaceUntil (const TopoDS_Shape & S,TopoDS_Face & F);
		%feature("autodoc", "	:param SRef:
	:type SRef: TopoDS_Shape &
	:param Fac:
	:type Fac: TopoDS_Face &
	:param Orf:
	:type Orf: TopAbs_Orientation
	:rtype: TopoDS_Solid
") Tool;
		static TopoDS_Solid Tool (const TopoDS_Shape & SRef,const TopoDS_Face & Fac,const TopAbs_Orientation Orf);
		%feature("autodoc", "	* Prints the Error description of the State <St> as a String on the Stream <S> and returns <S>.

	:param SE:
	:type SE: BRepFeat_StatusError
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const BRepFeat_StatusError SE,Standard_OStream & S);
};


%feature("shadow") BRepFeat::~BRepFeat %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_Builder;
class BRepFeat_Builder : public BOPAlgo_BOP {
	public:
		%feature("autodoc", "	:rtype: None
") BRepFeat_Builder;
		 BRepFeat_Builder ();
		%feature("autodoc", "	* Clears internal fields and arguments.

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("autodoc", "	* Initialyzes the object of local boolean operation.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & theShape);
		%feature("autodoc", "	* Initialyzes the arguments of local boolean operation.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theTool:
	:type theTool: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & theShape,const TopoDS_Shape & theTool);
		%feature("autodoc", "	* Sets the operation of local boolean operation. If theFuse = 0 than the operation is CUT, otherwise FUSE.

	:param theFuse:
	:type theFuse: Standard_Integer
	:rtype: None
") SetOperation;
		void SetOperation (const Standard_Integer theFuse);
		%feature("autodoc", "	* Sets the operation of local boolean operation. If theFlag = True it means that no selection of parts of the tool is needed, t.e. no second part. In that case if theFuse = 0 than operation is COMMON, otherwise CUT21. If theFlag = False SetOperation(theFuse) function is called.

	:param theFuse:
	:type theFuse: Standard_Integer
	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetOperation;
		void SetOperation (const Standard_Integer theFuse,const Standard_Boolean theFlag);
		%feature("autodoc", "	* Collects parts of the tool.

	:param theLT:
	:type theLT: TopTools_ListOfShape &
	:rtype: None
") PartsOfTool;
		void PartsOfTool (TopTools_ListOfShape & theLT);
		%feature("autodoc", "	* Initialyzes parts of the tool for second step of algorithm. Collects shapes and all sub-shapes into myShapes map.

	:param theIm:
	:type theIm: TopTools_ListOfShape &
	:rtype: None
") KeepParts;
		void KeepParts (const TopTools_ListOfShape & theIm);
		%feature("autodoc", "	* Adds shape theS and all its sub-shapes into myShapes map.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: None
") KeepPart;
		void KeepPart (const TopoDS_Shape & theS);
		%feature("autodoc", "	* Main function to build the result of the local operation required.

	:rtype: None
") PerformResult;
		void PerformResult ();
		%feature("autodoc", "	* Rebuilds faces in accordance with the kept parts of the tool.

	:rtype: None
") RebuildFaces;
		void RebuildFaces ();
		%feature("autodoc", "	* Rebuilds edges in accordance with the kept parts of the tool.

	:param theE:
	:type theE: TopoDS_Shape &
	:param theF:
	:type theF: TopoDS_Face &
	:param theME:
	:type theME: BOPCol_MapOfShape &
	:param aLEIm:
	:type aLEIm: BOPCol_ListOfShape &
	:rtype: None
") RebuildEdge;
		void RebuildEdge (const TopoDS_Shape & theE,const TopoDS_Face & theF,const BOPCol_MapOfShape & theME,BOPCol_ListOfShape & aLEIm);
		%feature("autodoc", "	* Collects the images of the object, that contains in the images of the tool.

	:rtype: None
") CheckSolidImages;
		void CheckSolidImages ();
		%feature("autodoc", "	* Collects the removed parts of the tool into myRemoved map.

	:rtype: None
") FillRemoved;
		void FillRemoved ();
		%feature("autodoc", "	* Adds the shape S and its sub-shapes into myRemoved map.

	:param theS:
	:type theS: TopoDS_Shape &
	:param theM:
	:type theM: BOPCol_MapOfShape &
	:rtype: None
") FillRemoved;
		void FillRemoved (const TopoDS_Shape & theS,BOPCol_MapOfShape & theM);
};


%feature("shadow") BRepFeat_Builder::~BRepFeat_Builder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_Builder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_Form;
class BRepFeat_Form : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "	* returns the list of generated Faces.

	:param F:
	:type F: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);
		%feature("autodoc", "	* returns a list of the created faces from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the list of shapes created at the bottom of the created form. It may be an empty list.

	:rtype: TopTools_ListOfShape
") FirstShape;
		const TopTools_ListOfShape & FirstShape ();
		%feature("autodoc", "	* Returns the list of shapes created at the top of the created form. It may be an empty list.

	:rtype: TopTools_ListOfShape
") LastShape;
		const TopTools_ListOfShape & LastShape ();
		%feature("autodoc", "	* Returns a list of the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape. The list provides the information necessary for subsequent addition of fillets. It may be an empty list.

	:rtype: TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges ();
		%feature("autodoc", "	* Returns a list of the tangent edges among the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape and are tangent to the face against which the feature is built. The list provides the information necessary for subsequent addition of fillets. It may be an empty list. If an edge is tangent, no fillet is possible, and the edge must subsequently be removed if you want to add a fillet.

	:rtype: TopTools_ListOfShape
") TgtEdges;
		const TopTools_ListOfShape & TgtEdges ();
		%feature("autodoc", "	* Initializes the topological construction if the basis shape is present.

	:rtype: None
") BasisShapeValid;
		void BasisShapeValid ();
		%feature("autodoc", "	* Initializes the topological construction if the generated shape S is present.

	:rtype: None
") GeneratedShapeValid;
		void GeneratedShapeValid ();
		%feature("autodoc", "	* Initializes the topological construction if the shape is present from the specified integer on.

	:rtype: None
") ShapeFromValid;
		void ShapeFromValid ();
		%feature("autodoc", "	* Initializes the topological construction if the shape is present until the specified integer.

	:rtype: None
") ShapeUntilValid;
		void ShapeUntilValid ();
		%feature("autodoc", "	* Initializes the topological construction if the glued face is present.

	:rtype: None
") GluedFacesValid;
		void GluedFacesValid ();
		%feature("autodoc", "	* Initializes the topological construction if the sketch face is present. If the sketch face is inside the basis shape, local operations such as glueing can be performed.

	:rtype: None
") SketchFaceValid;
		void SketchFaceValid ();
		%feature("autodoc", "	* Initializes the topological construction if the selected face is present.

	:rtype: None
") PerfSelectionValid;
		void PerfSelectionValid ();
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: void
") Curves;
		virtual void Curves (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") BarycCurve;
		virtual Handle_Geom_Curve BarycCurve ();
		%feature("autodoc", "	:rtype: BRepFeat_StatusError
") CurrentStatusError;
		BRepFeat_StatusError CurrentStatusError ();
};


%feature("shadow") BRepFeat_Form::~BRepFeat_Form %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_Form {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_Gluer;
class BRepFeat_Gluer : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "	* Initializes an empty constructor

	:rtype: None
") BRepFeat_Gluer;
		 BRepFeat_Gluer ();
		%feature("autodoc", "	* Initializes the shapes to be glued, the new shape Snew and the basis shape Sbase.

	:param Snew:
	:type Snew: TopoDS_Shape &
	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:rtype: None
") BRepFeat_Gluer;
		 BRepFeat_Gluer (const TopoDS_Shape & Snew,const TopoDS_Shape & Sbase);
		%feature("autodoc", "	* Initializes the new shape Snew and the basis shape Sbase for the local glueing operation.

	:param Snew:
	:type Snew: TopoDS_Shape &
	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Snew,const TopoDS_Shape & Sbase);
		%feature("autodoc", "	* Defines a contact between Fnew on the new shape Snew and Fbase on the basis shape Sbase. Informs other methods that Fnew in the new shape Snew is connected to the face Fbase in the basis shape Sbase. The contact faces of the glued shape must not have parts outside the contact faces of the basis shape. This indicates that glueing is possible.

	:param Fnew:
	:type Fnew: TopoDS_Face &
	:param Fbase:
	:type Fbase: TopoDS_Face &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Face & Fnew,const TopoDS_Face & Fbase);
		%feature("autodoc", "	* nforms other methods that the edge Enew in the new shape is the same as the edge Ebase in the basis shape and is therefore attached to the basis shape. This indicates that glueing is possible.

	:param Enew:
	:type Enew: TopoDS_Edge &
	:param Ebase:
	:type Ebase: TopoDS_Edge &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Edge & Enew,const TopoDS_Edge & Ebase);
		%feature("autodoc", "	* Determine which operation type to use glueing or sliding.

	:rtype: LocOpe_Operation
") OpeType;
		LocOpe_Operation OpeType ();
		%feature("autodoc", "	* Returns the basis shape of the compound shape.

	:rtype: TopoDS_Shape
") BasisShape;
		const TopoDS_Shape  BasisShape ();
		%feature("autodoc", "	* Returns the resulting compound shape.

	:rtype: TopoDS_Shape
") GluedShape;
		const TopoDS_Shape  GluedShape ();
		%feature("autodoc", "	* This is called by Shape(). It does nothing but may be redefined.

	:rtype: void
") Build;
		virtual void Build ();
		%feature("autodoc", "	* returns the status of the Face after the shape creation.

	:param F:
	:type F: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & F);
		%feature("autodoc", "	* returns the list of generated Faces.

	:param F:
	:type F: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);
};


%feature("shadow") BRepFeat_Gluer::~BRepFeat_Gluer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_Gluer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_RibSlot;
class BRepFeat_RibSlot : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "	* Returns true if F a TopoDS_Shape of type edge or face has been deleted.

	:param F:
	:type F: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & F);
		%feature("autodoc", "	* Returns the list of generated Faces F. This list may be empty.

	:param F:
	:type F: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);
		%feature("autodoc", "	* Returns a list TopTools_ListOfShape of the faces S created in the shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the list of shapes created at the bottom of the created form. It may be an empty list.

	:rtype: TopTools_ListOfShape
") FirstShape;
		const TopTools_ListOfShape & FirstShape ();
		%feature("autodoc", "	* Returns the list of shapes created at the top of the created form. It may be an empty list.

	:rtype: TopTools_ListOfShape
") LastShape;
		const TopTools_ListOfShape & LastShape ();
		%feature("autodoc", "	* Returns a list of the limiting and glueing faces generated by the feature. These faces did not originally exist in the basis shape. The list provides the information necessary for subsequent addition of a draft to a face. It may be an empty list. If a face has tangent edges, no draft is possible, and the tangent edges must subsequently be removed if you want to add a draft to the face.

	:rtype: TopTools_ListOfShape
") FacesForDraft;
		const TopTools_ListOfShape & FacesForDraft ();
		%feature("autodoc", "	* Returns a list of the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape. The list provides the information necessary for subsequent addition of fillets. It may be an empty list.

	:rtype: TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges ();
		%feature("autodoc", "	* Returns a list of the tangent edges among the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape and are tangent to the face against which the feature is built. The list provides the information necessary for subsequent addition of fillets. It may be an empty list. If an edge is tangent, no fillet is possible, and the edge must subsequently be removed if you want to add a fillet.

	:rtype: TopTools_ListOfShape
") TgtEdges;
		const TopTools_ListOfShape & TgtEdges ();
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param P:
	:type P: gp_Pnt
	:rtype: float
") IntPar;
		static Standard_Real IntPar (const Handle_Geom_Curve & C,const gp_Pnt & P);
		%feature("autodoc", "	:param faces:
	:type faces: TopTools_ListOfShape &
	:param cc:
	:type cc: Handle_Geom_Curve &
	:param par:
	:type par: float
	:param bnd:
	:type bnd: float
	:param Pln:
	:type Pln: Handle_Geom_Plane &
	:rtype: TopoDS_Face
") ChoiceOfFaces;
		static TopoDS_Face ChoiceOfFaces (TopTools_ListOfShape & faces,const Handle_Geom_Curve & cc,const Standard_Real par,const Standard_Real bnd,const Handle_Geom_Plane & Pln);
		%feature("autodoc", "	:rtype: BRepFeat_StatusError
") CurrentStatusError;
		BRepFeat_StatusError CurrentStatusError ();
};


%feature("shadow") BRepFeat_RibSlot::~BRepFeat_RibSlot %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_RibSlot {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_SplitShape;
class BRepFeat_SplitShape : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BRepFeat_SplitShape;
		 BRepFeat_SplitShape ();
		%feature("autodoc", "	* Creates the process with the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") BRepFeat_SplitShape;
		 BRepFeat_SplitShape (const TopoDS_Shape & S);
		%feature("autodoc", "	* Initializes the process on the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	* Set the flag of check internal intersections default value is True (to check)

	:param ToCheckInterior:
	:type ToCheckInterior: bool
	:rtype: None
") SetCheckInterior;
		void SetCheckInterior (const Standard_Boolean ToCheckInterior);
		%feature("autodoc", "	* Adds the wire <W> on the face <F>. Raises NoSuchObject if <F> does not belong to the original shape.

	:param W:
	:type W: TopoDS_Wire &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "	* Adds the edge <E> on the face <F>.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	* Adds the compound <Comp> on the face <F>. The compound <Comp> must consist of edges lying on the face <F>. If edges are geometrically connected, they must be connected topologically, i.e. they must share common vertices. Raises NoSuchObject if <F> does not belong to the original shape.

	:param Comp:
	:type Comp: TopoDS_Compound &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Compound & Comp,const TopoDS_Face & F);
		%feature("autodoc", "	* Adds the edge <E> on the existing edge <EOn>.

	:param E:
	:type E: TopoDS_Edge &
	:param EOn:
	:type EOn: TopoDS_Edge &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Edge & EOn);
		%feature("autodoc", "	* Returns the faces which are the left of the projected wires.

	:rtype: TopTools_ListOfShape
") DirectLeft;
		const TopTools_ListOfShape & DirectLeft ();
		%feature("autodoc", "	* Returns the faces of the 'left' part on the shape. (It is build from DirectLeft, with the faces connected to this set, and so on...). Raises NotDone if IsDone returns <Standard_False>.

	:rtype: TopTools_ListOfShape
") Left;
		const TopTools_ListOfShape & Left ();
		%feature("autodoc", "	* Builds the cut and the resulting faces and edges as well.

	:rtype: None
") Build;
		void Build ();
		%feature("autodoc", "	* Returns true if the shape has been deleted.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the list of generated Faces.

	:param F:
	:type F: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);
};


%feature("shadow") BRepFeat_SplitShape::~BRepFeat_SplitShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_SplitShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_MakeCylindricalHole;
class BRepFeat_MakeCylindricalHole : public BRepFeat_Builder {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") BRepFeat_MakeCylindricalHole;
		 BRepFeat_MakeCylindricalHole ();
		%feature("autodoc", "	* Sets the axis of the hole(s).

	:param Axis:
	:type Axis: gp_Ax1
	:rtype: None
") Init;
		void Init (const gp_Ax1 & Axis);
		%feature("autodoc", "	* Sets the shape and axis on which hole(s) will be performed.

	:param S:
	:type S: TopoDS_Shape &
	:param Axis:
	:type Axis: gp_Ax1
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S,const gp_Ax1 & Axis);
		%feature("autodoc", "	* Performs every holes of radius <Radius>. This command has the same effect as a cut operation with an infinite cylinder defined by the given axis and <Radius>.

	:param Radius:
	:type Radius: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real Radius);
		%feature("autodoc", "	* Performs evry hole of radius <Radius> located between PFrom and PTo on the given axis. If <WithControl> is set to Standard_False no control are done on the resulting shape after the operation is performed.

	:param Radius:
	:type Radius: float
	:param PFrom:
	:type PFrom: float
	:param PTo:
	:type PTo: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") Perform;
		void Perform (const Standard_Real Radius,const Standard_Real PFrom,const Standard_Real PTo,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "	* Performs the first hole of radius <Radius>, in the direction of the defined axis. First hole signify first encountered after the origin of the axis. If <WithControl> is set to Standard_False no control are done on the resulting shape after the operation is performed.

	:param Radius:
	:type Radius: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") PerformThruNext;
		void PerformThruNext (const Standard_Real Radius,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "	* Performs evry holes of radius <Radius> located after the origin of the given axis. If <WithControl> is set to Standard_False no control are done on the resulting shape after the operation is performed.

	:param Radius:
	:type Radius: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") PerformUntilEnd;
		void PerformUntilEnd (const Standard_Real Radius,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "	* Performs a blind hole of radius <Radius> and length <Length>. The length is measured from the origin of the given axis. If <WithControl> is set to Standard_False no control are done after the operation is performed.

	:param Radius:
	:type Radius: float
	:param Length:
	:type Length: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") PerformBlind;
		void PerformBlind (const Standard_Real Radius,const Standard_Real Length,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "	* Returns the status after a hole is performed.

	:rtype: BRepFeat_Status
") Status;
		BRepFeat_Status Status ();
		%feature("autodoc", "	* Builds the resulting shape (redefined from MakeShape). Invalidates the given parts of tools if any, and performs the result of the local operation.

	:rtype: None
") Build;
		void Build ();
};


%feature("shadow") BRepFeat_MakeCylindricalHole::~BRepFeat_MakeCylindricalHole %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_MakeCylindricalHole {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_MakeDPrism;
class BRepFeat_MakeDPrism : public BRepFeat_Form {
	public:
		%feature("autodoc", "	* A face Pbase is selected in the shape Sbase to serve as the basis for the draft prism. The draft will be defined by the angle Angle and Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed. Initializes the draft prism class

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param Pbase:
	:type Pbase: TopoDS_Face &
	:param Skface:
	:type Skface: TopoDS_Face &
	:param Angle:
	:type Angle: float
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Modify:
	:type Modify: bool
	:rtype: None
") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism (const TopoDS_Shape & Sbase,const TopoDS_Face & Pbase,const TopoDS_Face & Skface,const Standard_Real Angle,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "	:rtype: None
") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism ();
		%feature("autodoc", "	* Initializes this algorithm for building draft prisms along surfaces. A face Pbase is selected in the basis shape Sbase to serve as the basis from the draft prism. The draft will be defined by the angle Angle and Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param Pbase:
	:type Pbase: TopoDS_Face &
	:param Skface:
	:type Skface: TopoDS_Face &
	:param Angle:
	:type Angle: float
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Modify:
	:type Modify: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Face & Pbase,const TopoDS_Face & Skface,const Standard_Real Angle,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "	* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.

	:param E:
	:type E: TopoDS_Edge &
	:param OnFace:
	:type OnFace: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "	:param Height:
	:type Height: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real Height);
		%feature("autodoc", "	:param Until:
	:type Until: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & Until);
		%feature("autodoc", "	* Assigns one of the following semantics - to a height Height - to a face Until - from a face From to a height Until. Reconstructs the feature topologically according to the semantic option chosen.

	:param From:
	:type From: TopoDS_Shape &
	:param Until:
	:type Until: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);
		%feature("autodoc", "	* Realizes a semi-infinite prism, limited by the position of the prism base.

	:rtype: None
") PerformUntilEnd;
		void PerformUntilEnd ();
		%feature("autodoc", "	* Realizes a semi-infinite prism, limited by the face Funtil.

	:param FUntil:
	:type FUntil: TopoDS_Shape &
	:rtype: None
") PerformFromEnd;
		void PerformFromEnd (const TopoDS_Shape & FUntil);
		%feature("autodoc", "	* Builds an infinite prism. The infinite descendants will not be kept in the result.

	:rtype: None
") PerformThruAll;
		void PerformThruAll ();
		%feature("autodoc", "	* Assigns both a limiting shape, Until from TopoDS_Shape, and a height, Height at which to stop generation of the prism feature.

	:param Until:
	:type Until: TopoDS_Shape &
	:param Height:
	:type Height: float
	:rtype: None
") PerformUntilHeight;
		void PerformUntilHeight (const TopoDS_Shape & Until,const Standard_Real Height);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") BarycCurve;
		Handle_Geom_Curve BarycCurve ();
		%feature("autodoc", "	* Determination of TopEdges and LatEdges. sig = 1 -> TopEdges = FirstShape of the DPrism sig = 2 -> TOpEdges = LastShape of the DPrism

	:param sig:
	:type sig: Standard_Integer
	:rtype: None
") BossEdges;
		void BossEdges (const Standard_Integer sig);
		%feature("autodoc", "	* Returns the list of TopoDS Edges of the top of the boss.

	:rtype: TopTools_ListOfShape
") TopEdges;
		const TopTools_ListOfShape & TopEdges ();
		%feature("autodoc", "	* Returns the list of TopoDS Edges of the bottom of the boss.

	:rtype: TopTools_ListOfShape
") LatEdges;
		const TopTools_ListOfShape & LatEdges ();
};


%feature("shadow") BRepFeat_MakeDPrism::~BRepFeat_MakeDPrism %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_MakeDPrism {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_MakeLinearForm;
class BRepFeat_MakeLinearForm : public BRepFeat_RibSlot {
	public:
		%feature("autodoc", "	* initializes the linear form class

	:rtype: None
") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm ();
		%feature("autodoc", "	* contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. Direction and Direction1 give The vectors for defining the direction(s) in which thickness will be built up. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param W:
	:type W: TopoDS_Wire &
	:param P:
	:type P: Handle_Geom_Plane &
	:param Direction:
	:type Direction: gp_Vec
	:param Direction1:
	:type Direction1: gp_Vec
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Modify:
	:type Modify: bool
	:rtype: None
") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const Handle_Geom_Plane & P,const gp_Vec & Direction,const gp_Vec & Direction1,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "	* Initializes this construction algorithm. A contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. The vectors for defining the direction(s) in which thickness will be built up are given by Direction and Direction1. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param W:
	:type W: TopoDS_Wire &
	:param P:
	:type P: Handle_Geom_Plane &
	:param Direction:
	:type Direction: gp_Vec
	:param Direction1:
	:type Direction1: gp_Vec
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Modify:
	:type Modify: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const Handle_Geom_Plane & P,const gp_Vec & Direction,const gp_Vec & Direction1,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "	* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.

	:param E:
	:type E: TopoDS_Edge &
	:param OnFace:
	:type OnFace: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "	* Performs a prism from the wire to the plane along the basis shape Sbase. Reconstructs the feature topologically.

	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:param L:
	:type L: TopTools_ListOfShape &
	:param F:
	:type F: TopoDS_Face &
	:param FPoint:
	:type FPoint: gp_Pnt
	:param LPoint:
	:type LPoint: gp_Pnt
	:param falseside:
	:type falseside: bool
	:rtype: bool
") Propagate;
		Standard_Boolean Propagate (TopTools_ListOfShape & L,const TopoDS_Face & F,const gp_Pnt & FPoint,const gp_Pnt & LPoint,Standard_Boolean & falseside);
};


%feature("shadow") BRepFeat_MakeLinearForm::~BRepFeat_MakeLinearForm %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_MakeLinearForm {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_MakePipe;
class BRepFeat_MakePipe : public BRepFeat_Form {
	public:
		%feature("autodoc", "	* initializes the pipe class.

	:rtype: None
") BRepFeat_MakePipe;
		 BRepFeat_MakePipe ();
		%feature("autodoc", "	* A face Pbase is selected in the shape Sbase to serve as the basis for the pipe. It will be defined by the wire Spine. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param Pbase:
	:type Pbase: TopoDS_Shape &
	:param Skface:
	:type Skface: TopoDS_Face &
	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Modify:
	:type Modify: bool
	:rtype: None
") BRepFeat_MakePipe;
		 BRepFeat_MakePipe (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const TopoDS_Wire & Spine,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "	* Initializes this algorithm for adding pipes to shapes. A face Pbase is selected in the shape Sbase to serve as the basis for the pipe. It will be defined by the wire Spine. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param Pbase:
	:type Pbase: TopoDS_Shape &
	:param Skface:
	:type Skface: TopoDS_Face &
	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Modify:
	:type Modify: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const TopoDS_Wire & Spine,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "	* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.

	:param E:
	:type E: TopoDS_Edge &
	:param OnFace:
	:type OnFace: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:param Until:
	:type Until: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & Until);
		%feature("autodoc", "	* Assigns one of the following semantics - to a face Until - from a face From to a height Until. Reconstructs the feature topologically according to the semantic option chosen.

	:param From:
	:type From: TopoDS_Shape &
	:param Until:
	:type Until: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") BarycCurve;
		Handle_Geom_Curve BarycCurve ();
};


%feature("shadow") BRepFeat_MakePipe::~BRepFeat_MakePipe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_MakePipe {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_MakePrism;
class BRepFeat_MakePrism : public BRepFeat_Form {
	public:
		%feature("autodoc", "	* Builds a prism by projecting a wire along the face of a shape. Initializes the prism class.

	:rtype: None
") BRepFeat_MakePrism;
		 BRepFeat_MakePrism ();
		%feature("autodoc", "	* Builds a prism by projecting a wire along the face of a shape. a face Pbase is selected in the shape Sbase to serve as the basis for the prism. The orientation of the prism will be defined by the vector Direction. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed. Exceptions Standard_ConstructionError if the face does not belong to the basis or the prism shape.

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param Pbase:
	:type Pbase: TopoDS_Shape &
	:param Skface:
	:type Skface: TopoDS_Face &
	:param Direction:
	:type Direction: gp_Dir
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Modify:
	:type Modify: bool
	:rtype: None
") BRepFeat_MakePrism;
		 BRepFeat_MakePrism (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Dir & Direction,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "	* Initializes this algorithm for building prisms along surfaces. A face Pbase is selected in the shape Sbase to serve as the basis for the prism. The orientation of the prism will be defined by the vector Direction. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param Pbase:
	:type Pbase: TopoDS_Shape &
	:param Skface:
	:type Skface: TopoDS_Face &
	:param Direction:
	:type Direction: gp_Dir
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Modify:
	:type Modify: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Dir & Direction,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "	* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.

	:param E:
	:type E: TopoDS_Edge &
	:param OnFace:
	:type OnFace: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "	:param Length:
	:type Length: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real Length);
		%feature("autodoc", "	:param Until:
	:type Until: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & Until);
		%feature("autodoc", "	* Assigns one of the following semantics - to a height Length - to a face Until - from a face From to a height Until. Reconstructs the feature topologically according to the semantic option chosen.

	:param From:
	:type From: TopoDS_Shape &
	:param Until:
	:type Until: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);
		%feature("autodoc", "	* Realizes a semi-infinite prism, limited by the position of the prism base. All other faces extend infinitely.

	:rtype: None
") PerformUntilEnd;
		void PerformUntilEnd ();
		%feature("autodoc", "	* Realizes a semi-infinite prism, limited by the face Funtil.

	:param FUntil:
	:type FUntil: TopoDS_Shape &
	:rtype: None
") PerformFromEnd;
		void PerformFromEnd (const TopoDS_Shape & FUntil);
		%feature("autodoc", "	* Builds an infinite prism. The infinite descendants will not be kept in the result.

	:rtype: None
") PerformThruAll;
		void PerformThruAll ();
		%feature("autodoc", "	* Assigns both a limiting shape, Until from TopoDS_Shape, and a height, Length at which to stop generation of the prism feature.

	:param Until:
	:type Until: TopoDS_Shape &
	:param Length:
	:type Length: float
	:rtype: None
") PerformUntilHeight;
		void PerformUntilHeight (const TopoDS_Shape & Until,const Standard_Real Length);
		%feature("autodoc", "	* Returns the list of curves S parallel to the axis of the prism.

	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "	* Generates a curve along the center of mass of the primitive.

	:rtype: Handle_Geom_Curve
") BarycCurve;
		Handle_Geom_Curve BarycCurve ();
};


%feature("shadow") BRepFeat_MakePrism::~BRepFeat_MakePrism %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_MakePrism {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_MakeRevol;
class BRepFeat_MakeRevol : public BRepFeat_Form {
	public:
		%feature("autodoc", "	* initializes the revolved shell class.

	:rtype: None
") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol ();
		%feature("autodoc", "	* a face Pbase is selected in the shape Sbase to serve as the basis for the revolved shell. The revolution will be defined by the axis Axis and Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param Pbase:
	:type Pbase: TopoDS_Shape &
	:param Skface:
	:type Skface: TopoDS_Face &
	:param Axis:
	:type Axis: gp_Ax1
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Modify:
	:type Modify: bool
	:rtype: None
") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Ax1 & Axis,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param Pbase:
	:type Pbase: TopoDS_Shape &
	:param Skface:
	:type Skface: TopoDS_Face &
	:param Axis:
	:type Axis: gp_Ax1
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Modify:
	:type Modify: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Ax1 & Axis,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "	* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.

	:param E:
	:type E: TopoDS_Edge &
	:param OnFace:
	:type OnFace: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "	:param Angle:
	:type Angle: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real Angle);
		%feature("autodoc", "	:param Until:
	:type Until: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & Until);
		%feature("autodoc", "	* Reconstructs the feature topologically.

	:param From:
	:type From: TopoDS_Shape &
	:param Until:
	:type Until: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);
		%feature("autodoc", "	* Builds an infinite shell. The infinite descendants will not be kept in the result.

	:rtype: None
") PerformThruAll;
		void PerformThruAll ();
		%feature("autodoc", "	* Assigns both a limiting shape, Until from TopoDS_Shape, and an angle, Angle at which to stop generation of the revolved shell feature.

	:param Until:
	:type Until: TopoDS_Shape &
	:param Angle:
	:type Angle: float
	:rtype: None
") PerformUntilAngle;
		void PerformUntilAngle (const TopoDS_Shape & Until,const Standard_Real Angle);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") BarycCurve;
		Handle_Geom_Curve BarycCurve ();
};


%feature("shadow") BRepFeat_MakeRevol::~BRepFeat_MakeRevol %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_MakeRevol {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFeat_MakeRevolutionForm;
class BRepFeat_MakeRevolutionForm : public BRepFeat_RibSlot {
	public:
		%feature("autodoc", "	* initializes the linear form class.

	:rtype: None
") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm ();
		%feature("autodoc", "	* a contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. The axis Axis of the revolved surface in the basis shape defines the feature's axis of revolution. Height1 and Height2 may be used as limits to the construction of the feature. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param W:
	:type W: TopoDS_Wire &
	:param Plane:
	:type Plane: Handle_Geom_Plane &
	:param Axis:
	:type Axis: gp_Ax1
	:param Height1:
	:type Height1: float
	:param Height2:
	:type Height2: float
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Sliding:
	:type Sliding: bool
	:rtype: None
") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const Handle_Geom_Plane & Plane,const gp_Ax1 & Axis,const Standard_Real Height1,const Standard_Real Height2,const Standard_Integer Fuse,Standard_Boolean & Sliding);
		%feature("autodoc", "	* Initializes this construction algorithm A contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. The axis Axis of the revolved surface in the basis shape defines the feature's axis of revolution. Height1 and Height2 may be used as limits to the construction of the feature. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.

	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param W:
	:type W: TopoDS_Wire &
	:param Plane:
	:type Plane: Handle_Geom_Plane &
	:param Axis:
	:type Axis: gp_Ax1
	:param Height1:
	:type Height1: float
	:param Height2:
	:type Height2: float
	:param Fuse:
	:type Fuse: Standard_Integer
	:param Sliding:
	:type Sliding: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const Handle_Geom_Plane & Plane,const gp_Ax1 & Axis,const Standard_Real Height1,const Standard_Real Height2,const Standard_Integer Fuse,Standard_Boolean & Sliding);
		%feature("autodoc", "	* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.

	:param E:
	:type E: TopoDS_Edge &
	:param OnFace:
	:type OnFace: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "	* Performs a prism from the wire to the plane along the basis shape S. Reconstructs the feature topologically.

	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:param L:
	:type L: TopTools_ListOfShape &
	:param F:
	:type F: TopoDS_Face &
	:param FPoint:
	:type FPoint: gp_Pnt
	:param LPoint:
	:type LPoint: gp_Pnt
	:param falseside:
	:type falseside: bool
	:rtype: bool
") Propagate;
		Standard_Boolean Propagate (TopTools_ListOfShape & L,const TopoDS_Face & F,const gp_Pnt & FPoint,const gp_Pnt & LPoint,Standard_Boolean & falseside);
};


%feature("shadow") BRepFeat_MakeRevolutionForm::~BRepFeat_MakeRevolutionForm %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFeat_MakeRevolutionForm {
	void _kill_pointed() {
		delete $self;
	}
};
