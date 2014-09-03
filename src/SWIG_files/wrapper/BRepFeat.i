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
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Pt(TColgp_SequenceOfPnt)

Returns:
	static void

No detailed docstring for this function.") SampleEdges;
		static void SampleEdges (const TopoDS_Shape & S,TColgp_SequenceOfPnt & Pt);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Pt(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") Barycenter;
		static void Barycenter (const TopoDS_Shape & S,gp_Pnt & Pt);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	C(Handle_Geom_Curve)

Returns:
	static Standard_Real

No detailed docstring for this function.") ParametricBarycenter;
		static Standard_Real ParametricBarycenter (const TopoDS_Shape & S,const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	C(Handle_Geom_Curve)
	prmin(Standard_Real)
	prmax(Standard_Real)
	prbmin(Standard_Real)
	prbmax(Standard_Real)
	flag(Standard_Boolean)
	Ori(Standard_Boolean)=Standard_False

Returns:
	static void

Ori = True taking account the orientation") ParametricMinMax;
		static void ParametricMinMax (const TopoDS_Shape & S,const Handle_Geom_Curve & C,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean & flag,const Standard_Boolean Ori = Standard_False);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsInside;
		static Standard_Boolean IsInside (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	F(TopoDS_Face)

Returns:
	static void

No detailed docstring for this function.") FaceUntil;
		static void FaceUntil (const TopoDS_Shape & S,TopoDS_Face & F);
		%feature("autodoc", "Args:
	SRef(TopoDS_Shape)
	Fac(TopoDS_Face)
	Orf(TopAbs_Orientation)

Returns:
	static TopoDS_Solid

No detailed docstring for this function.") Tool;
		static TopoDS_Solid Tool (const TopoDS_Shape & SRef,const TopoDS_Face & Fac,const TopAbs_Orientation Orf);
		%feature("autodoc", "Args:
	SE(BRepFeat_StatusError)
	S(Standard_OStream)

Returns:
	static Standard_OStream

Prints the Error description of the State <St> as a String on  
         the Stream <S> and returns <S>.") Print;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFeat_Builder;
		 BRepFeat_Builder ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Clears internal fields and arguments.") Clear;
		virtual void Clear ();
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

Initialyzes the object of local boolean operation.") Init;
		void Init (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	theTool(TopoDS_Shape)

Returns:
	None

Initialyzes the arguments of local boolean operation.") Init;
		void Init (const TopoDS_Shape & theShape,const TopoDS_Shape & theTool);
		%feature("autodoc", "Args:
	theFuse(Standard_Integer)

Returns:
	None

Sets the operation of local boolean operation.  
         If theFuse = 0 than the operation is CUT, otherwise FUSE.") SetOperation;
		void SetOperation (const Standard_Integer theFuse);
		%feature("autodoc", "Args:
	theFuse(Standard_Integer)
	theFlag(Standard_Boolean)

Returns:
	None

Sets the operation of local boolean operation.  
         If theFlag = TRUE it means that no selection of parts  
         of the tool is needed, t.e. no second part. In that case  
         if theFuse = 0 than operation is COMMON, otherwise CUT21.  
         If theFlag = FALSE SetOperation(theFuse) function  is called.") SetOperation;
		void SetOperation (const Standard_Integer theFuse,const Standard_Boolean theFlag);
		%feature("autodoc", "Args:
	theLT(TopTools_ListOfShape)

Returns:
	None

Collects parts of the tool.") PartsOfTool;
		void PartsOfTool (TopTools_ListOfShape & theLT);
		%feature("autodoc", "Args:
	theIm(TopTools_ListOfShape)

Returns:
	None

Initialyzes parts of the tool for second step of algorithm.  
         Collects shapes and all sub-shapes into myShapes map.") KeepParts;
		void KeepParts (const TopTools_ListOfShape & theIm);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)

Returns:
	None

Adds shape theS and all its sub-shapes into myShapes map.") KeepPart;
		void KeepPart (const TopoDS_Shape & theS);
		%feature("autodoc", "Args:
	None
Returns:
	None

Main function to build the result of the  
         local operation required.") PerformResult;
		void PerformResult ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Rebuilds faces in accordance with the kept parts of the tool.") RebuildFaces;
		void RebuildFaces ();
		%feature("autodoc", "Args:
	theE(TopoDS_Shape)
	theF(TopoDS_Face)
	theME(BOPCol_MapOfShape)
	aLEIm(BOPCol_ListOfShape)

Returns:
	None

Rebuilds edges in accordance with the kept parts of the tool.") RebuildEdge;
		void RebuildEdge (const TopoDS_Shape & theE,const TopoDS_Face & theF,const BOPCol_MapOfShape & theME,BOPCol_ListOfShape & aLEIm);
		%feature("autodoc", "Args:
	None
Returns:
	None

Collects the images of the object, that contains in  
         the images of the tool.") CheckSolidImages;
		void CheckSolidImages ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Collects the removed parts of the tool into myRemoved map.") FillRemoved;
		void FillRemoved ();
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)
	theM(BOPCol_MapOfShape)

Returns:
	None

Adds the shape S and its sub-shapes into myRemoved map.") FillRemoved;
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
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

returns the list of generated Faces.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

returns a list of the created faces  
         from the shape <S>.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns the list  of shapes created  at the bottom  of  
         the created form.  It may be an empty list.") FirstShape;
		const TopTools_ListOfShape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns  the list of shapes  created at the top of the  
         created form.  It may be an empty list.") LastShape;
		const TopTools_ListOfShape & LastShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns a list of the limiting and glueing edges  
generated by the feature. These edges did not originally  
exist in the basis shape.  
The list provides the information necessary for  
subsequent addition of fillets. It may be an empty list.") NewEdges;
		const TopTools_ListOfShape & NewEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns a list of the tangent edges among the limiting  
and glueing edges generated by the feature. These  
edges did not originally exist in the basis shape and are  
tangent to the face against which the feature is built.  
The list provides the information necessary for  
subsequent addition of fillets. It may be an empty list.  
If an edge is tangent, no fillet is possible, and the edge  
must subsequently be removed if you want to add a fillet.") TgtEdges;
		const TopTools_ListOfShape & TgtEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the topological construction if the basis shape is present.") BasisShapeValid;
		void BasisShapeValid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the topological construction if the generated shape S is present.") GeneratedShapeValid;
		void GeneratedShapeValid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the topological construction if the shape is  
present from the specified integer on.") ShapeFromValid;
		void ShapeFromValid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the topological construction if the shape is  
present until the specified integer.") ShapeUntilValid;
		void ShapeUntilValid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the topological construction if the glued face is present.") GluedFacesValid;
		void GluedFacesValid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the topological construction if the sketch face  
is present. If the sketch face is inside the basis shape,  
local operations such as glueing can be performed.") SketchFaceValid;
		void SketchFaceValid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the topological construction if the selected face is present.") PerfSelectionValid;
		void PerfSelectionValid ();
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfCurve)

Returns:
	virtual void

No detailed docstring for this function.") Curves;
		virtual void Curves (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Geom_Curve

No detailed docstring for this function.") BarycCurve;
		virtual Handle_Geom_Curve BarycCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepFeat_StatusError

No detailed docstring for this function.") CurrentStatusError;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes an empty constructor") BRepFeat_Gluer;
		 BRepFeat_Gluer ();
		%feature("autodoc", "Args:
	Snew(TopoDS_Shape)
	Sbase(TopoDS_Shape)

Returns:
	None

Initializes the shapes to be glued, the new shape  
Snew and the basis shape Sbase.") BRepFeat_Gluer;
		 BRepFeat_Gluer (const TopoDS_Shape & Snew,const TopoDS_Shape & Sbase);
		%feature("autodoc", "Args:
	Snew(TopoDS_Shape)
	Sbase(TopoDS_Shape)

Returns:
	None

Initializes the new shape Snew and the basis shape  
Sbase for the local glueing operation.") Init;
		void Init (const TopoDS_Shape & Snew,const TopoDS_Shape & Sbase);
		%feature("autodoc", "Args:
	Fnew(TopoDS_Face)
	Fbase(TopoDS_Face)

Returns:
	None

Defines a contact between Fnew on the new shape  
Snew and Fbase on the basis shape Sbase. Informs  
other methods that Fnew in the new shape Snew is  
connected to the face Fbase in the basis shape Sbase.  
The contact faces of the glued shape must not have  
parts outside the contact faces of the basis shape.  
This indicates that glueing is possible.") Bind;
		void Bind (const TopoDS_Face & Fnew,const TopoDS_Face & Fbase);
		%feature("autodoc", "Args:
	Enew(TopoDS_Edge)
	Ebase(TopoDS_Edge)

Returns:
	None

nforms other methods that the edge Enew in the new  
shape is the same as the edge Ebase in the basis  
shape and is therefore attached to the basis shape. This  
indicates that glueing is possible.") Bind;
		void Bind (const TopoDS_Edge & Enew,const TopoDS_Edge & Ebase);
		%feature("autodoc", "Args:
	None
Returns:
	LocOpe_Operation

Determine which operation type to use glueing or sliding.") OpeType;
		LocOpe_Operation OpeType ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the basis shape of the compound shape.") BasisShape;
		const TopoDS_Shape & BasisShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the resulting compound shape.") GluedShape;
		const TopoDS_Shape & GluedShape ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

This is  called by  Shape().  It does  nothing but  
         may be redefined.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

returns the status of the Face after  
         the shape creation.") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

returns the list of generated Faces.") Modified;
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
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

Returns true if F a TopoDS_Shape of type edge or face has been deleted.") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list of generated Faces F. This list may be empty.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns a list TopTools_ListOfShape of the faces S created in the shape.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns the list  of shapes created  at the bottom  of  
         the created form.  It may be an empty list.") FirstShape;
		const TopTools_ListOfShape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns  the list of shapes  created at the top of the  
         created form.  It may be an empty list.") LastShape;
		const TopTools_ListOfShape & LastShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns a list of the limiting and glueing faces  
generated by the feature. These faces did not originally exist in the basis shape.  
The list provides the information necessary for  
subsequent addition of a draft to a face. It may be an empty list.  
If a face has tangent edges, no draft is possible, and the tangent edges must  
subsequently be removed if you want to add a draft to the face.") FacesForDraft;
		const TopTools_ListOfShape & FacesForDraft ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns a list of the limiting and glueing edges  
generated by the feature. These edges did not originally exist in the basis shape.  
The list provides the information necessary for  
subsequent addition of fillets. It may be an empty list.") NewEdges;
		const TopTools_ListOfShape & NewEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns a list of the tangent edges among the  
limiting and glueing edges generated by the  
feature. These edges did not originally exist in  
the basis shape and are tangent to the face  
against which the feature is built.  
The list provides the information necessary for  
subsequent addition of fillets. It may be an empty list.  
If an edge is tangent, no fillet is possible, and  
the edge must subsequently be removed if you want to add a fillet.") TgtEdges;
		const TopTools_ListOfShape & TgtEdges ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	P(gp_Pnt)

Returns:
	static Standard_Real

No detailed docstring for this function.") IntPar;
		static Standard_Real IntPar (const Handle_Geom_Curve & C,const gp_Pnt & P);
		%feature("autodoc", "Args:
	faces(TopTools_ListOfShape)
	cc(Handle_Geom_Curve)
	par(Standard_Real)
	bnd(Standard_Real)
	Pln(Handle_Geom_Plane)

Returns:
	static TopoDS_Face

No detailed docstring for this function.") ChoiceOfFaces;
		static TopoDS_Face ChoiceOfFaces (TopTools_ListOfShape & faces,const Handle_Geom_Curve & cc,const Standard_Real par,const Standard_Real bnd,const Handle_Geom_Plane & Pln);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFeat_StatusError

No detailed docstring for this function.") CurrentStatusError;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") BRepFeat_SplitShape;
		 BRepFeat_SplitShape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Creates the process  with the shape <S>.") BRepFeat_SplitShape;
		 BRepFeat_SplitShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes the process on the shape <S>.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	ToCheckInterior(Standard_Boolean)

Returns:
	None

Set the flag of check internal intersections  
         default value is True (to check)") SetCheckInterior;
		void SetCheckInterior (const Standard_Boolean ToCheckInterior);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	F(TopoDS_Face)

Returns:
	None

Adds the wire <W> on the face <F>.  
Raises NoSuchObject  if <F> does not belong to the original shape.") Add;
		void Add (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

Adds the edge <E> on the face <F>.") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Comp(TopoDS_Compound)
	F(TopoDS_Face)

Returns:
	None

Adds the compound <Comp> on the face <F>. The  
         compound <Comp> must consist of edges lying on the  
         face <F>. If edges are geometrically connected,  
         they must be connected topologically, i.e. they  
         must share common vertices.  
 
Raises NoSuchObject  if <F> does not belong to the original shape.") Add;
		void Add (const TopoDS_Compound & Comp,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	EOn(TopoDS_Edge)

Returns:
	None

Adds the edge <E> on the existing edge <EOn>.") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Edge & EOn);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns  the faces   which  are the  left of   the  
         projected wires.") DirectLeft;
		const TopTools_ListOfShape & DirectLeft ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns the faces of the 'left' part on the shape.  
         (It  is build   from  DirectLeft,  with  the faces  
         connected to this set, and so on...).  
Raises NotDone if IsDone returns <Standard_False>.") Left;
		const TopTools_ListOfShape & Left ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds the cut and the resulting faces and edges as well.") Build;
		void Build ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

Returns true if the shape has been deleted.") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the list of generated Faces.") Modified;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") BRepFeat_MakeCylindricalHole;
		 BRepFeat_MakeCylindricalHole ();
		%feature("autodoc", "Args:
	Axis(gp_Ax1)

Returns:
	None

Sets the axis of the hole(s).") Init;
		void Init (const gp_Ax1 & Axis);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Axis(gp_Ax1)

Returns:
	None

Sets the shape and  axis on which hole(s)  will be  
         performed.") Init;
		void Init (const TopoDS_Shape & S,const gp_Ax1 & Axis);
		%feature("autodoc", "Args:
	Radius(Standard_Real)

Returns:
	None

Performs every  holes of   radius  <Radius>.  This  
         command  has the  same effect as   a cut operation  
         with an  infinite cylinder   defined by the  given  
         axis and <Radius>.") Perform;
		void Perform (const Standard_Real Radius);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	PFrom(Standard_Real)
	PTo(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Performs evry   hole  of  radius  <Radius> located  
         between PFrom  and  PTo  on the  given  axis.   If  
         <WithControl> is set  to Standard_False no control  
         are  done  on   the  resulting  shape   after  the  
         operation is performed.") Perform;
		void Perform (const Standard_Real Radius,const Standard_Real PFrom,const Standard_Real PTo,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Performs the first hole of radius <Radius>, in the  
         direction of  the defined axis. First hole signify  
         first encountered after the origin of the axis. If  
         <WithControl> is set  to Standard_False no control  
         are  done  on   the  resulting  shape   after  the  
         operation is performed.") PerformThruNext;
		void PerformThruNext (const Standard_Real Radius,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Performs  evry  holes of  radius  <Radius> located  
         after  the   origin  of   the given    axis.    If  
         <WithControl> is  set to Standard_False no control  
         are done   on   the  resulting  shape   after  the  
         operation is performed.") PerformUntilEnd;
		void PerformUntilEnd (const Standard_Real Radius,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	Length(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Performs a  blind   hole of radius    <Radius> and  
         length <Length>.  The length is  measured from the  
         origin of the given  axis. If <WithControl> is set  
         to  Standard_False no  control  are done after the  
         operation is performed.") PerformBlind;
		void PerformBlind (const Standard_Real Radius,const Standard_Real Length,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFeat_Status

Returns the status after a hole is performed.") Status;
		BRepFeat_Status Status ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds the    resulting shape  (redefined     from  
         MakeShape). Invalidates the  given parts  of tools  
         if  any,   and performs the  result   of the local  
         operation.") Build;
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
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	Pbase(TopoDS_Face)
	Skface(TopoDS_Face)
	Angle(Standard_Real)
	Fuse(Standard_Integer)
	Modify(Standard_Boolean)

Returns:
	None

A face Pbase is selected in the shape  
  Sbase to serve as the basis for the draft prism. The  
  draft will be defined by the angle Angle and Fuse offers a choice between:  
- removing matter with a Boolean cut using the setting 0  
- adding matter with Boolean fusion using the setting 1.  
   The sketch face Skface serves to determine the type of  
operation. If it is inside the basis shape, a local  
operation such as glueing can be performed.  Initializes the draft prism class") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism (const TopoDS_Shape & Sbase,const TopoDS_Face & Pbase,const TopoDS_Face & Skface,const Standard_Real Angle,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism ();
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	Pbase(TopoDS_Face)
	Skface(TopoDS_Face)
	Angle(Standard_Real)
	Fuse(Standard_Integer)
	Modify(Standard_Boolean)

Returns:
	None

Initializes this algorithm for building draft prisms along surfaces.  
A face Pbase is selected in the basis shape Sbase to  
serve as the basis from the draft prism. The draft will be  
defined by the angle Angle and Fuse offers a choice between:  
-   removing matter with a Boolean cut using the setting 0  
-   adding matter with Boolean fusion using the setting  1.  
  The sketch face Skface serves to determine the type of  
operation. If it is inside the basis shape, a local  
operation such as glueing can be performed.") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Face & Pbase,const TopoDS_Face & Skface,const Standard_Real Angle,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	OnFace(TopoDS_Face)

Returns:
	None

Indicates that the edge <E> will slide on the face  
         <OnFace>.  
Raises ConstructionError if the  face does not belong to the  
basis shape, or the edge to the prismed shape.") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "Args:
	Height(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Real Height);
		%feature("autodoc", "Args:
	Until(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & Until);
		%feature("autodoc", "Args:
	From(TopoDS_Shape)
	Until(TopoDS_Shape)

Returns:
	None

Assigns one of the following semantics  
-   to a height Height  
-   to a face Until  
-   from a face From to a height Until.  
Reconstructs the feature topologically according to the semantic option chosen.") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);
		%feature("autodoc", "Args:
	None
Returns:
	None

Realizes a semi-infinite prism, limited by the position of the prism base.") PerformUntilEnd;
		void PerformUntilEnd ();
		%feature("autodoc", "Args:
	FUntil(TopoDS_Shape)

Returns:
	None

Realizes a semi-infinite prism, limited by the face Funtil.") PerformFromEnd;
		void PerformFromEnd (const TopoDS_Shape & FUntil);
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds an infinite prism. The infinite descendants will not be kept in the result.") PerformThruAll;
		void PerformThruAll ();
		%feature("autodoc", "Args:
	Until(TopoDS_Shape)
	Height(Standard_Real)

Returns:
	None

Assigns both a limiting shape, Until from  
TopoDS_Shape, and a height, Height at which to stop  
generation of the prism feature.") PerformUntilHeight;
		void PerformUntilHeight (const TopoDS_Shape & Until,const Standard_Real Height);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") BarycCurve;
		Handle_Geom_Curve BarycCurve ();
		%feature("autodoc", "Args:
	sig(Standard_Integer)

Returns:
	None

Determination of TopEdges and LatEdges.  
         sig = 1 -> TopEdges = FirstShape of the DPrism  
         sig = 2 -> TOpEdges = LastShape of the DPrism") BossEdges;
		void BossEdges (const Standard_Integer sig);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns the list of TopoDS Edges of the top of the boss.") TopEdges;
		const TopTools_ListOfShape & TopEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns the list of TopoDS Edges of the bottom of the boss.") LatEdges;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

initializes the linear form class") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm ();
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	W(TopoDS_Wire)
	P(Handle_Geom_Plane)
	Direction(gp_Vec)
	Direction1(gp_Vec)
	Fuse(Standard_Integer)
	Modify(Standard_Boolean)

Returns:
	None

contour W, a shape Sbase and a  
  plane P are initialized to serve as the basic  
  elements in the construction of the rib or groove.  
  Direction and Direction1 give The vectors for  
  defining the direction(s) in which thickness will be built up.  
 Fuse offers a choice between:  
-   removing matter with a Boolean cut using the  
  setting 0 in case of the groove  
-   adding matter with Boolean fusion using the  
  setting 1 in case of the rib.") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const Handle_Geom_Plane & P,const gp_Vec & Direction,const gp_Vec & Direction1,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	W(TopoDS_Wire)
	P(Handle_Geom_Plane)
	Direction(gp_Vec)
	Direction1(gp_Vec)
	Fuse(Standard_Integer)
	Modify(Standard_Boolean)

Returns:
	None

Initializes this construction algorithm.  
A contour W, a shape Sbase and a plane P are  
initialized to serve as the basic elements in the  
construction of the rib or groove. The vectors for  
defining the direction(s) in which thickness will be built  
up are given by Direction and Direction1.  
Fuse offers a choice between:  
-   removing matter with a Boolean cut using the setting  
  0 in case of the groove  
-   adding matter with Boolean fusion using the setting 1  
  in case of the rib.") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const Handle_Geom_Plane & P,const gp_Vec & Direction,const gp_Vec & Direction1,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	OnFace(TopoDS_Face)

Returns:
	None

Indicates that the edge <E> will slide on the face  
         <OnFace>.  
Raises ConstructionError if the  face does not belong to the  
basis shape, or the edge to the prismed shape.") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "Args:
	None
Returns:
	None

Performs a prism from the wire to the plane along the  
basis shape Sbase. Reconstructs the feature topologically.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	L(TopTools_ListOfShape)
	F(TopoDS_Face)
	FPoint(gp_Pnt)
	LPoint(gp_Pnt)
	falseside(Standard_Boolean)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Propagate;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

initializes the pipe class.") BRepFeat_MakePipe;
		 BRepFeat_MakePipe ();
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	Pbase(TopoDS_Shape)
	Skface(TopoDS_Face)
	Spine(TopoDS_Wire)
	Fuse(Standard_Integer)
	Modify(Standard_Boolean)

Returns:
	None

A face Pbase is selected in the  
shape Sbase to serve as the basis for the  
pipe. It will be defined by the wire Spine.  
Fuse offers a choice between:  
-   removing matter with a Boolean cut using the setting 0  
-   adding matter with Boolean fusion using the setting 1.  
  The sketch face Skface serves to determine  
the type of operation. If it is inside the basis  
shape, a local operation such as glueing can be performed.") BRepFeat_MakePipe;
		 BRepFeat_MakePipe (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const TopoDS_Wire & Spine,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	Pbase(TopoDS_Shape)
	Skface(TopoDS_Face)
	Spine(TopoDS_Wire)
	Fuse(Standard_Integer)
	Modify(Standard_Boolean)

Returns:
	None

Initializes this algorithm for adding pipes to shapes.  
A face Pbase is selected in the shape Sbase to  
serve as the basis for the pipe. It will be defined by the wire Spine.  
Fuse offers a choice between:  
-   removing matter with a Boolean cut using the setting 0  
-   adding matter with Boolean fusion using the setting 1.  
 The sketch face Skface serves to determine  
the type of operation. If it is inside the basis  
shape, a local operation such as glueing can be performed.") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const TopoDS_Wire & Spine,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	OnFace(TopoDS_Face)

Returns:
	None

Indicates that the edge <E> will slide on the face  
         <OnFace>. Raises ConstructionError  if the  face does not belong to the  
basis shape, or the edge to the prismed shape.") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	Until(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & Until);
		%feature("autodoc", "Args:
	From(TopoDS_Shape)
	Until(TopoDS_Shape)

Returns:
	None

Assigns one of the following semantics  
-   to a face Until  
-   from a face From to a height Until.  
Reconstructs the feature topologically according to the semantic option chosen.") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") BarycCurve;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds a prism by projecting a  
wire along the face of a shape. Initializes the prism class.") BRepFeat_MakePrism;
		 BRepFeat_MakePrism ();
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	Pbase(TopoDS_Shape)
	Skface(TopoDS_Face)
	Direction(gp_Dir)
	Fuse(Standard_Integer)
	Modify(Standard_Boolean)

Returns:
	None

Builds a prism by projecting a  
wire along the face of a shape. a face Pbase is selected in  
  the shape Sbase to serve as the basis for  
  the prism. The orientation of the prism will  
  be defined by the vector Direction.  
Fuse offers a choice between:  
-   removing matter with a Boolean cut using the setting 0  
-   adding matter with Boolean fusion using the setting 1.  
  The sketch face Skface serves to determine  
the type of operation. If it is inside the basis  
shape, a local operation such as glueing can be performed.  
Exceptions  
Standard_ConstructionError if the face  
does not belong to the basis or the prism shape.") BRepFeat_MakePrism;
		 BRepFeat_MakePrism (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Dir & Direction,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	Pbase(TopoDS_Shape)
	Skface(TopoDS_Face)
	Direction(gp_Dir)
	Fuse(Standard_Integer)
	Modify(Standard_Boolean)

Returns:
	None

Initializes this algorithm for building prisms along surfaces.  
A face Pbase is selected in the shape Sbase  
to serve as the basis for the prism. The  
orientation of the prism will be defined by the vector Direction.  
Fuse offers a choice between:  
-   removing matter with a Boolean cut using the setting 0  
-   adding matter with Boolean fusion using the setting 1.  
The sketch face Skface serves to determine  
the type of operation. If it is inside the basis  
shape, a local operation such as glueing can be performed.") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Dir & Direction,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	OnFace(TopoDS_Face)

Returns:
	None

Indicates that the edge <E> will slide on the face  
 <OnFace>. Raises ConstructionError if the  face does not belong to the  
basis shape, or the edge to the prismed shape.") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "Args:
	Length(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Real Length);
		%feature("autodoc", "Args:
	Until(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & Until);
		%feature("autodoc", "Args:
	From(TopoDS_Shape)
	Until(TopoDS_Shape)

Returns:
	None

Assigns one of the following semantics  
-   to a height Length  
-   to a face Until  
-   from a face From to a height Until.  
Reconstructs the feature topologically according to the semantic option chosen.") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);
		%feature("autodoc", "Args:
	None
Returns:
	None

Realizes a semi-infinite prism, limited by the  
position of the prism base. All other faces extend infinitely.") PerformUntilEnd;
		void PerformUntilEnd ();
		%feature("autodoc", "Args:
	FUntil(TopoDS_Shape)

Returns:
	None

Realizes a semi-infinite prism, limited by the face Funtil.") PerformFromEnd;
		void PerformFromEnd (const TopoDS_Shape & FUntil);
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds an infinite prism. The infinite descendants will not be kept in the result.") PerformThruAll;
		void PerformThruAll ();
		%feature("autodoc", "Args:
	Until(TopoDS_Shape)
	Length(Standard_Real)

Returns:
	None

Assigns both a limiting shape, Until from  
TopoDS_Shape, and a height, Length at which to stop generation of the prism feature.") PerformUntilHeight;
		void PerformUntilHeight (const TopoDS_Shape & Until,const Standard_Real Length);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfCurve)

Returns:
	None

Returns the list of curves S parallel to the axis of the prism.") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

Generates a curve along the center of mass of the primitive.") BarycCurve;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

initializes the revolved shell class.") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol ();
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	Pbase(TopoDS_Shape)
	Skface(TopoDS_Face)
	Axis(gp_Ax1)
	Fuse(Standard_Integer)
	Modify(Standard_Boolean)

Returns:
	None

a face Pbase is selected in the  
  shape Sbase to serve as the basis for the  
  revolved shell. The revolution will be defined  
  by the axis Axis and Fuse offers a choice between:  
  -   removing matter with a Boolean cut using the setting 0  
  -   adding matter with Boolean fusion using the setting 1.  
    The sketch face Skface serves to determine  
the type of operation. If it is inside the basis  
shape, a local operation such as glueing can be performed.") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Ax1 & Axis,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	Pbase(TopoDS_Shape)
	Skface(TopoDS_Face)
	Axis(gp_Ax1)
	Fuse(Standard_Integer)
	Modify(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Ax1 & Axis,const Standard_Integer Fuse,const Standard_Boolean Modify);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	OnFace(TopoDS_Face)

Returns:
	None

Indicates that the edge <E> will slide on the face  
<OnFace>. Raises ConstructionError if the  face does not belong to the  
basis shape, or the edge to the prismed shape.") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "Args:
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Real Angle);
		%feature("autodoc", "Args:
	Until(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & Until);
		%feature("autodoc", "Args:
	From(TopoDS_Shape)
	Until(TopoDS_Shape)

Returns:
	None

Reconstructs the feature topologically.") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds an infinite shell. The infinite descendants  
will not be kept in the result.") PerformThruAll;
		void PerformThruAll ();
		%feature("autodoc", "Args:
	Until(TopoDS_Shape)
	Angle(Standard_Real)

Returns:
	None

Assigns both a limiting shape, Until from  
TopoDS_Shape, and an angle, Angle at  
which to stop generation of the revolved shell feature.") PerformUntilAngle;
		void PerformUntilAngle (const TopoDS_Shape & Until,const Standard_Real Angle);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") BarycCurve;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

initializes the linear form class.") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm ();
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	W(TopoDS_Wire)
	Plane(Handle_Geom_Plane)
	Axis(gp_Ax1)
	Height1(Standard_Real)
	Height2(Standard_Real)
	Fuse(Standard_Integer)
	Sliding(Standard_Boolean)

Returns:
	None

a contour W, a shape Sbase and a plane P are initialized to serve as  
  the basic elements in the construction of the rib or groove. The axis Axis of the  
  revolved surface in the basis shape defines the feature's axis of revolution.  
  Height1 and Height2 may be used as limits to the construction of the feature.  
Fuse offers a choice between:  
-   removing matter with a Boolean cut using the setting 0 in case of the groove  
-   adding matter with Boolean fusion using the setting 1 in case of the rib.") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const Handle_Geom_Plane & Plane,const gp_Ax1 & Axis,const Standard_Real Height1,const Standard_Real Height2,const Standard_Integer Fuse,Standard_Boolean & Sliding);
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	W(TopoDS_Wire)
	Plane(Handle_Geom_Plane)
	Axis(gp_Ax1)
	Height1(Standard_Real)
	Height2(Standard_Real)
	Fuse(Standard_Integer)
	Sliding(Standard_Boolean)

Returns:
	None

Initializes this construction algorithm  
A contour W, a shape Sbase and a plane P are initialized to serve as the basic elements  
in the construction of the rib or groove. The axis Axis of the revolved surface in the basis  
shape defines the feature's axis of revolution. Height1 and Height2 may be  
used as limits to the construction of the feature.  
Fuse offers a choice between:  
-   removing matter with a Boolean cut using the setting 0 in case of the groove  
-   adding matter with Boolean fusion using the setting 1 in case of the rib.") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const Handle_Geom_Plane & Plane,const gp_Ax1 & Axis,const Standard_Real Height1,const Standard_Real Height2,const Standard_Integer Fuse,Standard_Boolean & Sliding);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	OnFace(TopoDS_Face)

Returns:
	None

Indicates that the edge <E> will slide on the face  
<OnFace>. Raises ConstructionError  if the  face does not belong to the  
basis shape, or the edge to the prismed shape.") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);
		%feature("autodoc", "Args:
	None
Returns:
	None

Performs a prism from the wire to the plane  
along the basis shape S. Reconstructs the feature topologically.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	L(TopTools_ListOfShape)
	F(TopoDS_Face)
	FPoint(gp_Pnt)
	LPoint(gp_Pnt)
	falseside(Standard_Boolean)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Propagate;
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
