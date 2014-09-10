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
%module (package="OCC") TopOpeBRepTool

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

%include TopOpeBRepTool_headers.i

/* typedefs */
typedef TopOpeBRepTool_ShapeClassifier * TopOpeBRepTool_PShapeClassifier;
typedef BRepClass3d_SolidClassifier * TopOpeBRepTool_PSoClassif;
typedef TopTools_ListOfShape * TopOpeBRepTool_Plos;
/* end typedefs declaration */

/* public enums */
enum TopOpeBRepTool_OutCurveType {
	TopOpeBRepTool_BSPLINE1 = 0,
	TopOpeBRepTool_APPROX = 1,
	TopOpeBRepTool_INTERPOL = 2,
};

/* end public enums declaration */

%rename(topopebreptool) TopOpeBRepTool;
%nodefaultctor TopOpeBRepTool;
class TopOpeBRepTool {
	public:
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	FF(TopoDS_Face)
	MWisOld(TopTools_DataMapOfShapeInteger)
	MshNOK(TopTools_IndexedMapOfOrientedShape)

Returns:
	static Standard_Boolean

Fuse  edges (in a   wire) of a  shape   where we have  
         useless vertex.  In case face <FF> is built on UV-non-connexed  wires  
         (with the two closing edges  FORWARD and REVERSED, in  
         spite of one only), we find out the faulty edge, add  
         the faulty shapes (edge,wire,face) to <MshNOK>.  
         <FF> is a face descendant of <F>.  
         <MWisOld>(wire) = 1 if wire is wire of <F>  
                           0    wire results from <F>'s wire splitted.  
         returns false if purge fails") PurgeClosingEdges;
		static Standard_Boolean PurgeClosingEdges (const TopoDS_Face & F,const TopoDS_Face & FF,const TopTools_DataMapOfShapeInteger & MWisOld,TopTools_IndexedMapOfOrientedShape & MshNOK);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	LOF(TopTools_ListOfShape)
	MWisOld(TopTools_DataMapOfShapeInteger)
	MshNOK(TopTools_IndexedMapOfOrientedShape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") PurgeClosingEdges;
		static Standard_Boolean PurgeClosingEdges (const TopoDS_Face & F,const TopTools_ListOfShape & LOF,const TopTools_DataMapOfShapeInteger & MWisOld,TopTools_IndexedMapOfOrientedShape & MshNOK);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Fsp(TopoDS_Face)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") CorrectONUVISO;
		static Standard_Boolean CorrectONUVISO (const TopoDS_Face & F,TopoDS_Face & Fsp);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	LOF(TopTools_ListOfShape)
	MshNOK(TopTools_IndexedMapOfOrientedShape)
	LOFF(TopTools_ListOfShape)

Returns:
	static Standard_Boolean

Builds up the correct list of faces <LOFF> from <LOF>, using  
         faulty shapes from map <MshNOK>.  
         <LOF> is the list of <F>'s descendant faces.  
         returns false if building fails") MakeFaces;
		static Standard_Boolean MakeFaces (const TopoDS_Face & F,const TopTools_ListOfShape & LOF,const TopTools_IndexedMapOfOrientedShape & MshNOK,TopTools_ListOfShape & LOFF);
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)
	aListOfFaces(TopTools_ListOfShape)
	ESplits(TopTools_DataMapOfShapeListOfShape)

Returns:
	static Standard_Boolean

Returns <False>  if  the  face is  valid (the UV  
         representation  of  the  face is   a set   of  pcurves  
         connexed by points with   connexity 2).  
         Else,  splits <aFace> in order to return a list of valid  
         faces.") Regularize;
		static Standard_Boolean Regularize (const TopoDS_Face & aFace,TopTools_ListOfShape & aListOfFaces,TopTools_DataMapOfShapeListOfShape & ESplits);
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)
	OldWiresNewWires(TopTools_DataMapOfShapeListOfShape)
	ESplits(TopTools_DataMapOfShapeListOfShape)

Returns:
	static Standard_Boolean

Returns <False>  if  the  face is  valid (the UV  
         representation  of  the  face is   a set   of  pcurves  
         connexed by points with   connexity 2).  
         Else,  splits wires of the face, these are boundaries of the  
         new faces to build up; <OldWiresNewWires> describes (wire,  
         splits of wire); <ESplits> describes (edge, edge's splits)") RegularizeWires;
		static Standard_Boolean RegularizeWires (const TopoDS_Face & aFace,TopTools_DataMapOfShapeListOfShape & OldWiresNewWires,TopTools_DataMapOfShapeListOfShape & ESplits);
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)
	OldWiresnewWires(TopTools_DataMapOfShapeListOfShape)
	aListOfFaces(TopTools_ListOfShape)

Returns:
	static Standard_Boolean

Classify wire's splits of map <OldWiresnewWires> in order to  
          compute <aListOfFaces>, the splits of <aFace>.") RegularizeFace;
		static Standard_Boolean RegularizeFace (const TopoDS_Face & aFace,const TopTools_DataMapOfShapeListOfShape & OldWiresnewWires,TopTools_ListOfShape & aListOfFaces);
		%feature("autodoc", "Args:
	aSolid(TopoDS_Solid)
	OldSheNewShe(TopTools_DataMapOfShapeListOfShape)
	FSplits(TopTools_DataMapOfShapeListOfShape)

Returns:
	static Standard_Boolean

Returns <False> if the shell is valid (the solid is a set  
         of faces connexed by edges with connexity 2).  
         Else, splits faces of the shell; <OldFacesnewFaces> describes  
         (face, splits of face).") RegularizeShells;
		static Standard_Boolean RegularizeShells (const TopoDS_Solid & aSolid,TopTools_DataMapOfShapeListOfShape & OldSheNewShe,TopTools_DataMapOfShapeListOfShape & FSplits);
		%feature("autodoc", "Args:
	OCT(TopOpeBRepTool_OutCurveType)
	S(Standard_OStream)

Returns:
	static Standard_OStream

Prints <OCT> as string on stream <S>; returns <S>.") Print;
		static Standard_OStream & Print (const TopOpeBRepTool_OutCurveType OCT,Standard_OStream & S);
};


%feature("shadow") TopOpeBRepTool::~TopOpeBRepTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_AncestorsTool;
class TopOpeBRepTool_AncestorsTool {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TS(TopAbs_ShapeEnum)
	TA(TopAbs_ShapeEnum)
	M(TopTools_IndexedDataMapOfShapeListOfShape)

Returns:
	static void

same as package method TopExp::MapShapeListOfShapes()") MakeAncestors;
		static void MakeAncestors (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA,TopTools_IndexedDataMapOfShapeListOfShape & M);
};


%feature("shadow") TopOpeBRepTool_AncestorsTool::~TopOpeBRepTool_AncestorsTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_AncestorsTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_BoxSort;
class TopOpeBRepTool_BoxSort {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort ();
		%feature("autodoc", "Args:
	T(Handle_TopOpeBRepTool_HBoxTool)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort (const Handle_TopOpeBRepTool_HBoxTool & T);
		%feature("autodoc", "Args:
	T(Handle_TopOpeBRepTool_HBoxTool)

Returns:
	None

No detailed docstring for this function.") SetHBoxTool;
		void SetHBoxTool (const Handle_TopOpeBRepTool_HBoxTool & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepTool_HBoxTool

No detailed docstring for this function.") HBoxTool;
		const Handle_TopOpeBRepTool_HBoxTool & HBoxTool ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TS(TopAbs_ShapeEnum)
	TA(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

No detailed docstring for this function.") AddBoxes;
		void AddBoxes (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TS(TopAbs_ShapeEnum)
	TA(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

No detailed docstring for this function.") MakeHAB;
		void MakeHAB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Bnd_HArray1OfBox

No detailed docstring for this function.") HAB;
		const Handle_Bnd_HArray1OfBox & HAB ();
		%feature("autodoc", "Args:
	HAB(Handle_Bnd_HArray1OfBox)
	COB(Bnd_Box)

Returns:
	static void

No detailed docstring for this function.") MakeHABCOB;
		static void MakeHABCOB (const Handle_Bnd_HArray1OfBox & HAB,Bnd_Box & COB);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") HABShape;
		const TopoDS_Shape & HABShape (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TS(TopAbs_ShapeEnum)
	TA(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

No detailed docstring for this function.") MakeCOB;
		void MakeCOB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TS(TopAbs_ShapeEnum)
	TA(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

No detailed docstring for this function.") AddBoxesMakeCOB;
		void AddBoxesMakeCOB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TColStd_ListIteratorOfListOfInteger

No detailed docstring for this function.") Compare;
		const TColStd_ListIteratorOfListOfInteger & Compare (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(TColStd_ListIteratorOfListOfInteger)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") TouchedShape;
		const TopoDS_Shape & TouchedShape (const TColStd_ListIteratorOfListOfInteger & I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Bnd_Box

No detailed docstring for this function.") Box;
		const Bnd_Box & Box (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
};


%feature("shadow") TopOpeBRepTool_BoxSort::~TopOpeBRepTool_BoxSort %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_BoxSort {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_C2DF;
class TopOpeBRepTool_C2DF {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF ();
		%feature("autodoc", "Args:
	PC(Handle_Geom2d_Curve)
	f2d(Standard_Real)
	l2d(Standard_Real)
	tol(Standard_Real)
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF (const Handle_Geom2d_Curve & PC,const Standard_Real f2d,const Standard_Real l2d,const Standard_Real tol,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	PC(Handle_Geom2d_Curve)
	f2d(Standard_Real)
	l2d(Standard_Real)
	tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetPC;
		void SetPC (const Handle_Geom2d_Curve & PC,const Standard_Real f2d,const Standard_Real l2d,const Standard_Real tol);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") SetFace;
		void SetFace (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	f2d(Standard_Real)
	l2d(Standard_Real)
	tol(Standard_Real)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") PC;
		const Handle_Geom2d_Curve & PC (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	PC(Handle_Geom2d_Curve)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPC;
		Standard_Boolean IsPC (const Handle_Geom2d_Curve & PC);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsFace;
		Standard_Boolean IsFace (const TopoDS_Face & F);
};


%feature("shadow") TopOpeBRepTool_C2DF::~TopOpeBRepTool_C2DF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_C2DF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_CLASSI;
class TopOpeBRepTool_CLASSI {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_CLASSI;
		 TopOpeBRepTool_CLASSI ();
		%feature("autodoc", "Args:
	Fref(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Init2d;
		void Init2d (const TopoDS_Face & Fref);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasInit2d;
		Standard_Boolean HasInit2d ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add2d;
		Standard_Boolean Add2d (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Box2d(Bnd_Box2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetBox2d;
		Standard_Boolean GetBox2d (const TopoDS_Shape & S,Bnd_Box2d & Box2d);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	tol(Standard_Real)
	checklarge(Standard_Boolean)

Returns:
	Standard_Integer

No detailed docstring for this function.") ClassiBnd2d;
		Standard_Integer ClassiBnd2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Standard_Real tol,const Standard_Boolean checklarge);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	stabnd2d12(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Classip2d;
		Standard_Integer Classip2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Standard_Integer stabnd2d12);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	fa(TopOpeBRepTool_face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Getface;
		Standard_Boolean Getface (const TopoDS_Shape & S,TopOpeBRepTool_face & fa);
		%feature("autodoc", "Args:
	lS(TopTools_ListOfShape)
	mapgreasma(TopTools_DataMapOfShapeListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Classilist;
		Standard_Boolean Classilist (const TopTools_ListOfShape & lS,TopTools_DataMapOfShapeListOfShape & mapgreasma);
};


%feature("shadow") TopOpeBRepTool_CLASSI::~TopOpeBRepTool_CLASSI %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_CLASSI {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_CORRISO;
class TopOpeBRepTool_CORRISO {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO ();
		%feature("autodoc", "Args:
	FRef(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO (const TopoDS_Face & FRef);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Fref;
		const TopoDS_Face & Fref ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAdaptor_Surface

No detailed docstring for this function.") GASref;
		const GeomAdaptor_Surface & GASref ();
		%feature("autodoc", "Args:
	x(Standard_Integer)
	xperiod(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Refclosed;
		Standard_Boolean Refclosed (const Standard_Integer x,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Init;
		Standard_Boolean Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") S;
		const TopoDS_Shape & S ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Eds;
		const TopTools_ListOfShape & Eds ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") UVClosed;
		Standard_Boolean UVClosed ();
		%feature("autodoc", "Args:
	I(Standard_Integer)
	tol3d(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Tol;
		Standard_Real Tol (const Standard_Integer I,const Standard_Real tol3d);
		%feature("autodoc", "Args:
	ClEds(TopTools_ListOfShape)
	fyClEds(TopTools_ListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") PurgeFyClosingE;
		Standard_Boolean PurgeFyClosingE (const TopTools_ListOfShape & ClEds,TopTools_ListOfShape & fyClEds);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	onU(Standard_Boolean)
	tolx(Standard_Real)
	parspE(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") EdgeOUTofBoundsUV;
		Standard_Integer EdgeOUTofBoundsUV (const TopoDS_Edge & E,const Standard_Boolean onU,const Standard_Real tolx,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	EdsToCheck(TopTools_ListOfShape)
	onU(Standard_Boolean)
	tolx(Standard_Real)
	FyEds(TopTools_DataMapOfOrientedShapeInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") EdgesOUTofBoundsUV;
		Standard_Boolean EdgesOUTofBoundsUV (const TopTools_ListOfShape & EdsToCheck,const Standard_Boolean onU,const Standard_Real tolx,TopTools_DataMapOfOrientedShapeInteger & FyEds);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	Ivfaulty(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") EdgeWithFaultyUV;
		Standard_Boolean EdgeWithFaultyUV (const TopoDS_Edge & E,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	EdsToCheck(TopTools_ListOfShape)
	nfybounds(Standard_Integer)
	FyEds(TopTools_DataMapOfOrientedShapeInteger)
	stopatfirst(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

No detailed docstring for this function.") EdgesWithFaultyUV;
		Standard_Boolean EdgesWithFaultyUV (const TopTools_ListOfShape & EdsToCheck,const Standard_Integer nfybounds,TopTools_DataMapOfOrientedShapeInteger & FyEds,const Standard_Boolean stopatfirst = Standard_False);
		%feature("autodoc", "Args:
	EdsToCheck(TopTools_ListOfShape)
	nfybounds(Standard_Integer)
	fyE(TopoDS_Shape)
	Ifaulty(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") EdgeWithFaultyUV;
		Standard_Boolean EdgeWithFaultyUV (const TopTools_ListOfShape & EdsToCheck,const Standard_Integer nfybounds,TopoDS_Shape & fyE,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	onU(Standard_Boolean)
	FyEds(TopTools_DataMapOfOrientedShapeInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") TrslUV;
		Standard_Boolean TrslUV (const Standard_Boolean onU,const TopTools_DataMapOfOrientedShapeInteger & FyEds);
		%feature("autodoc", "Args:
	newS(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetnewS;
		Standard_Boolean GetnewS (TopoDS_Face & newS);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C2DF(TopOpeBRepTool_C2DF)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UVRep;
		Standard_Boolean UVRep (const TopoDS_Edge & E,TopOpeBRepTool_C2DF & C2DF);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C2DF(TopOpeBRepTool_C2DF)

Returns:
	Standard_Boolean

No detailed docstring for this function.") SetUVRep;
		Standard_Boolean SetUVRep (const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	Eds(TopTools_ListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Connexity;
		Standard_Boolean Connexity (const TopoDS_Vertex & V,TopTools_ListOfShape & Eds);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	Eds(TopTools_ListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") SetConnexity;
		Standard_Boolean SetConnexity (const TopoDS_Vertex & V,const TopTools_ListOfShape & Eds);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") AddNewConnexity;
		Standard_Boolean AddNewConnexity (const TopoDS_Vertex & V,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") RemoveOldConnexity;
		Standard_Boolean RemoveOldConnexity (const TopoDS_Vertex & V,const TopoDS_Edge & E);
};


%feature("shadow") TopOpeBRepTool_CORRISO::~TopOpeBRepTool_CORRISO %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_CORRISO {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_CurveTool;
class TopOpeBRepTool_CurveTool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool ();
		%feature("autodoc", "Args:
	OCT(TopOpeBRepTool_OutCurveType)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool (const TopOpeBRepTool_OutCurveType OCT);
		%feature("autodoc", "Args:
	GT(TopOpeBRepTool_GeomTool)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool (const TopOpeBRepTool_GeomTool & GT);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_GeomTool

No detailed docstring for this function.") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_GeomTool

No detailed docstring for this function.") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool ();
		%feature("autodoc", "Args:
	GT(TopOpeBRepTool_GeomTool)

Returns:
	None

No detailed docstring for this function.") SetGeomTool;
		void SetGeomTool (const TopOpeBRepTool_GeomTool & GT);
		%feature("autodoc", "Args:
	min(Standard_Real)
	max(Standard_Real)
	C3D(Handle_Geom_Curve)
	PC1(Handle_Geom2d_Curve)
	PC2(Handle_Geom2d_Curve)
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	C3DN(Handle_Geom_Curve)
	PC1N(Handle_Geom2d_Curve)
	PC2N(Handle_Geom2d_Curve)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)

Returns:
	Standard_Boolean

Approximates curves.  
         Returns False in the case of failure") MakeCurves;
		Standard_Boolean MakeCurves (const Standard_Real min,const Standard_Real max,const Handle_Geom_Curve & C3D,const Handle_Geom2d_Curve & PC1,const Handle_Geom2d_Curve & PC2,const TopoDS_Shape & S1,const TopoDS_Shape & S2,Handle_Geom_Curve & C3DN,Handle_Geom2d_Curve & PC1N,Handle_Geom2d_Curve & PC2N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P(TColgp_Array1OfPnt)

Returns:
	static Handle_Geom_Curve

No detailed docstring for this function.") MakeBSpline1fromPnt;
		static Handle_Geom_Curve MakeBSpline1fromPnt (const TColgp_Array1OfPnt & P);
		%feature("autodoc", "Args:
	P(TColgp_Array1OfPnt2d)

Returns:
	static Handle_Geom2d_Curve

No detailed docstring for this function.") MakeBSpline1fromPnt2d;
		static Handle_Geom2d_Curve MakeBSpline1fromPnt2d (const TColgp_Array1OfPnt2d & P);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	C(Handle_Geom_Curve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsProjectable;
		static Standard_Boolean IsProjectable (const TopoDS_Shape & S,const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	C(Handle_Geom_Curve)
	TolReached2d(Standard_Real)
	first(Standard_Real)=0.0
	last(Standard_Real)=0.0

Returns:
	static Handle_Geom2d_Curve

No detailed docstring for this function.") MakePCurveOnFace;
		static Handle_Geom2d_Curve MakePCurveOnFace (const TopoDS_Shape & S,const Handle_Geom_Curve & C,Standard_Real &OutValue,const Standard_Real first = 0.0,const Standard_Real last = 0.0);
};


%feature("shadow") TopOpeBRepTool_CurveTool::~TopOpeBRepTool_CurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_CurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF;
class TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepTool_DataMapOfOrientedShapeC2DF)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF (const TopOpeBRepTool_DataMapOfOrientedShapeC2DF & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepTool_DataMapOfOrientedShapeC2DF)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepTool_DataMapOfOrientedShapeC2DF & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_C2DF

No detailed docstring for this function.") Value;
		const TopOpeBRepTool_C2DF & Value ();
};


%feature("shadow") TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF::~TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF;
class TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepTool_DataMapOfShapeListOfC2DF)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF (const TopOpeBRepTool_DataMapOfShapeListOfC2DF & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepTool_DataMapOfShapeListOfC2DF)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepTool_DataMapOfShapeListOfC2DF & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_ListOfC2DF

No detailed docstring for this function.") Value;
		const TopOpeBRepTool_ListOfC2DF & Value ();
};


%feature("shadow") TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF::~TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface;
class TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepTool_DataMapOfShapeface)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface (const TopOpeBRepTool_DataMapOfShapeface & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepTool_DataMapOfShapeface)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepTool_DataMapOfShapeface & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_face

No detailed docstring for this function.") Value;
		const TopOpeBRepTool_face & Value ();
};


%feature("shadow") TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface::~TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF;
class TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepTool_C2DF)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF;
		 TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF (const TopoDS_Shape & K,const TopOpeBRepTool_C2DF & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_C2DF

No detailed docstring for this function.") Value;
		TopOpeBRepTool_C2DF & Value ();
};


%feature("shadow") TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF::~TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF {
	Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF GetHandle() {
	return *(Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF;
class Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF();
        Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF(const Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF &aHandle);
        Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF(const TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF {
    TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF* GetObject() {
    return (TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF::~Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF;
class TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepTool_ListOfC2DF)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF;
		 TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF (const TopoDS_Shape & K,const TopOpeBRepTool_ListOfC2DF & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_ListOfC2DF

No detailed docstring for this function.") Value;
		TopOpeBRepTool_ListOfC2DF & Value ();
};


%feature("shadow") TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF::~TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF {
	Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF GetHandle() {
	return *(Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF;
class Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF();
        Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF(const Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF &aHandle);
        Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF(const TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF {
    TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF* GetObject() {
    return (TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF::~Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface;
class TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepTool_face)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface;
		 TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface (const TopoDS_Shape & K,const TopOpeBRepTool_face & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_face

No detailed docstring for this function.") Value;
		TopOpeBRepTool_face & Value ();
};


%feature("shadow") TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface::~TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface {
	Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface GetHandle() {
	return *(Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface;
class Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface();
        Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface(const Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface &aHandle);
        Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface(const TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface {
    TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface* GetObject() {
    return (TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface::~Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepTool_DataMapOfOrientedShapeC2DF;
class TopOpeBRepTool_DataMapOfOrientedShapeC2DF : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapOfOrientedShapeC2DF;
		 TopOpeBRepTool_DataMapOfOrientedShapeC2DF (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_DataMapOfOrientedShapeC2DF)

Returns:
	TopOpeBRepTool_DataMapOfOrientedShapeC2DF

No detailed docstring for this function.") Assign;
		TopOpeBRepTool_DataMapOfOrientedShapeC2DF & Assign (const TopOpeBRepTool_DataMapOfOrientedShapeC2DF & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_DataMapOfOrientedShapeC2DF)

Returns:
	TopOpeBRepTool_DataMapOfOrientedShapeC2DF

No detailed docstring for this function.") operator=;
		TopOpeBRepTool_DataMapOfOrientedShapeC2DF & operator = (const TopOpeBRepTool_DataMapOfOrientedShapeC2DF & Other);
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
	I(TopOpeBRepTool_C2DF)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopOpeBRepTool_C2DF & I);
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
	TopOpeBRepTool_C2DF

No detailed docstring for this function.") Find;
		const TopOpeBRepTool_C2DF & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepTool_C2DF

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepTool_C2DF & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") TopOpeBRepTool_DataMapOfOrientedShapeC2DF::~TopOpeBRepTool_DataMapOfOrientedShapeC2DF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_DataMapOfOrientedShapeC2DF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_DataMapOfShapeListOfC2DF;
class TopOpeBRepTool_DataMapOfShapeListOfC2DF : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapOfShapeListOfC2DF;
		 TopOpeBRepTool_DataMapOfShapeListOfC2DF (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_DataMapOfShapeListOfC2DF)

Returns:
	TopOpeBRepTool_DataMapOfShapeListOfC2DF

No detailed docstring for this function.") Assign;
		TopOpeBRepTool_DataMapOfShapeListOfC2DF & Assign (const TopOpeBRepTool_DataMapOfShapeListOfC2DF & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_DataMapOfShapeListOfC2DF)

Returns:
	TopOpeBRepTool_DataMapOfShapeListOfC2DF

No detailed docstring for this function.") operator=;
		TopOpeBRepTool_DataMapOfShapeListOfC2DF & operator = (const TopOpeBRepTool_DataMapOfShapeListOfC2DF & Other);
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
	I(TopOpeBRepTool_ListOfC2DF)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopOpeBRepTool_ListOfC2DF & I);
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
	TopOpeBRepTool_ListOfC2DF

No detailed docstring for this function.") Find;
		const TopOpeBRepTool_ListOfC2DF & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepTool_ListOfC2DF

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepTool_ListOfC2DF & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") TopOpeBRepTool_DataMapOfShapeListOfC2DF::~TopOpeBRepTool_DataMapOfShapeListOfC2DF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_DataMapOfShapeListOfC2DF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_DataMapOfShapeface;
class TopOpeBRepTool_DataMapOfShapeface : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_DataMapOfShapeface;
		 TopOpeBRepTool_DataMapOfShapeface (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_DataMapOfShapeface)

Returns:
	TopOpeBRepTool_DataMapOfShapeface

No detailed docstring for this function.") Assign;
		TopOpeBRepTool_DataMapOfShapeface & Assign (const TopOpeBRepTool_DataMapOfShapeface & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_DataMapOfShapeface)

Returns:
	TopOpeBRepTool_DataMapOfShapeface

No detailed docstring for this function.") operator=;
		TopOpeBRepTool_DataMapOfShapeface & operator = (const TopOpeBRepTool_DataMapOfShapeface & Other);
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
	I(TopOpeBRepTool_face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopOpeBRepTool_face & I);
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
	TopOpeBRepTool_face

No detailed docstring for this function.") Find;
		const TopOpeBRepTool_face & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepTool_face

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepTool_face & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") TopOpeBRepTool_DataMapOfShapeface::~TopOpeBRepTool_DataMapOfShapeface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_DataMapOfShapeface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_FuseEdges;
class TopOpeBRepTool_FuseEdges {
	public:
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	PerformNow(Standard_Boolean)=Standard_False

Returns:
	None

Initialise members  and build  construction of map  
         of ancestors.") TopOpeBRepTool_FuseEdges;
		 TopOpeBRepTool_FuseEdges (const TopoDS_Shape & theShape,const Standard_Boolean PerformNow = Standard_False);
		%feature("autodoc", "Args:
	theMapEdg(TopTools_IndexedMapOfShape)

Returns:
	None

set edges to avoid being fused") AvoidEdges;
		void AvoidEdges (const TopTools_IndexedMapOfShape & theMapEdg);
		%feature("autodoc", "Args:
	theMapLstEdg(TopTools_DataMapOfIntegerListOfShape)

Returns:
	None

returns  all the list of edges to be fused  
         each list of the map represent a set of connex edges  
         that can be fused.") Edges;
		void Edges (TopTools_DataMapOfIntegerListOfShape & theMapLstEdg);
		%feature("autodoc", "Args:
	theMapEdg(TopTools_DataMapOfIntegerShape)

Returns:
	None

returns all the fused edges. each integer entry in  
          the   map  corresponds  to  the  integer   in the  
          DataMapOfIntegerListOfShape  we    get in  method  
         Edges.   That is to say, to  the list  of edges in  
         theMapLstEdg(i) corresponds the resulting edge theMapEdge(i)") ResultEdges;
		void ResultEdges (TopTools_DataMapOfIntegerShape & theMapEdg);
		%feature("autodoc", "Args:
	theMapFac(TopTools_DataMapOfShapeShape)

Returns:
	None

returns the map of modified faces.") Faces;
		void Faces (TopTools_DataMapOfShapeShape & theMapFac);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns myShape modified with the list of internal  
         edges removed from it.") Shape;
		TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of vertices candidate to be removed") NbVertices;
		const Standard_Integer NbVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Using  map of list of connex  edges, fuse each list to  
          one edge and then update myShape") Perform;
		void Perform ();
};


%feature("shadow") TopOpeBRepTool_FuseEdges::~TopOpeBRepTool_FuseEdges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_FuseEdges {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_GeomTool;
class TopOpeBRepTool_GeomTool {
	public:
		%feature("autodoc", "Args:
	TypeC3D(TopOpeBRepTool_OutCurveType)=TopOpeBRepTool_BSPLINE1
	CompC3D(Standard_Boolean)=Standard_True
	CompPC1(Standard_Boolean)=Standard_True
	CompPC2(Standard_Boolean)=Standard_True

Returns:
	None

Boolean flags <CompC3D>, <CompPC1>, <CompPC2>  
         indicate whether  the  corresponding result curves  
         <C3D>, <PC1>, <PC2> of MakeCurves method  must or not  
         be computed from an intersection line <L>.  
         When  the line <L> is a walking one, <TypeC3D> is the  
         kind  of the 3D curve <C3D>  to  compute  :  
         - BSPLINE1 to compute  a BSpline of  degree 1 on the  
         walking   points  of  <L>,  
         - APPROX  to build  an  approximation curve on the  
         walking points of <L>.") TopOpeBRepTool_GeomTool;
		 TopOpeBRepTool_GeomTool (const TopOpeBRepTool_OutCurveType TypeC3D = TopOpeBRepTool_BSPLINE1,const Standard_Boolean CompC3D = Standard_True,const Standard_Boolean CompPC1 = Standard_True,const Standard_Boolean CompPC2 = Standard_True);
		%feature("autodoc", "Args:
	TypeC3D(TopOpeBRepTool_OutCurveType)
	CompC3D(Standard_Boolean)
	CompPC1(Standard_Boolean)
	CompPC2(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Define;
		void Define (const TopOpeBRepTool_OutCurveType TypeC3D,const Standard_Boolean CompC3D,const Standard_Boolean CompPC1,const Standard_Boolean CompPC2);
		%feature("autodoc", "Args:
	TypeC3D(TopOpeBRepTool_OutCurveType)

Returns:
	None

No detailed docstring for this function.") Define;
		void Define (const TopOpeBRepTool_OutCurveType TypeC3D);
		%feature("autodoc", "Args:
	CompC3D(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") DefineCurves;
		void DefineCurves (const Standard_Boolean CompC3D);
		%feature("autodoc", "Args:
	CompPC1(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") DefinePCurves1;
		void DefinePCurves1 (const Standard_Boolean CompPC1);
		%feature("autodoc", "Args:
	CompPC2(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") DefinePCurves2;
		void DefinePCurves2 (const Standard_Boolean CompPC2);
		%feature("autodoc", "Args:
	GT(TopOpeBRepTool_GeomTool)

Returns:
	None

No detailed docstring for this function.") Define;
		void Define (const TopOpeBRepTool_GeomTool & GT);
		%feature("autodoc", "Args:
	tol3d(Standard_Real)
	tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetTolerances;
		void GetTolerances (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	tol3d(Standard_Real)
	tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerances;
		void SetTolerances (const Standard_Real tol3d,const Standard_Real tol2d);
		%feature("autodoc", "Args:
	tol3d(Standard_Real)
	tol2d(Standard_Real)
	relative(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") GetTolerances;
		void GetTolerances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean & relative);
		%feature("autodoc", "Args:
	tol3d(Standard_Real)
	tol2d(Standard_Real)
	relative(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetTolerances;
		void SetTolerances (const Standard_Real tol3d,const Standard_Real tol2d,const Standard_Boolean relative);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPntMax;
		Standard_Integer NbPntMax ();
		%feature("autodoc", "Args:
	NbPntMax(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetNbPntMax;
		void SetNbPntMax (const Standard_Integer NbPntMax);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_OutCurveType

No detailed docstring for this function.") TypeC3D;
		TopOpeBRepTool_OutCurveType TypeC3D ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") CompC3D;
		Standard_Boolean CompC3D ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") CompPC1;
		Standard_Boolean CompPC1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") CompPC2;
		Standard_Boolean CompPC2 ();
};


%feature("shadow") TopOpeBRepTool_GeomTool::~TopOpeBRepTool_GeomTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_GeomTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_HBoxTool;
class TopOpeBRepTool_HBoxTool : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_HBoxTool;
		 TopOpeBRepTool_HBoxTool ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TS(TopAbs_ShapeEnum)
	TA(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

No detailed docstring for this function.") AddBoxes;
		void AddBoxes (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddBox;
		void AddBox (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	B(Bnd_Box)

Returns:
	static void

No detailed docstring for this function.") ComputeBox;
		static void ComputeBox (const TopoDS_Shape & S,Bnd_Box & B);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	B(Bnd_Box)

Returns:
	static void

No detailed docstring for this function.") ComputeBoxOnVertices;
		static void ComputeBoxOnVertices (const TopoDS_Shape & S,Bnd_Box & B);
		%feature("autodoc", "Args:
	B(Bnd_Box)

Returns:
	static void

No detailed docstring for this function.") DumpB;
		static void DumpB (const Bnd_Box & B);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Bnd_Box

No detailed docstring for this function.") Box;
		const Bnd_Box & Box (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Bnd_Box

No detailed docstring for this function.") Box;
		const Bnd_Box & Box (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasBox;
		Standard_Boolean HasBox (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_IndexedDataMapOfShapeBox

No detailed docstring for this function.") ChangeIMS;
		TopOpeBRepTool_IndexedDataMapOfShapeBox & ChangeIMS ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_IndexedDataMapOfShapeBox

No detailed docstring for this function.") IMS;
		const TopOpeBRepTool_IndexedDataMapOfShapeBox & IMS ();
};


%feature("shadow") TopOpeBRepTool_HBoxTool::~TopOpeBRepTool_HBoxTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_HBoxTool {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepTool_HBoxTool {
	Handle_TopOpeBRepTool_HBoxTool GetHandle() {
	return *(Handle_TopOpeBRepTool_HBoxTool*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRepTool_HBoxTool;
class Handle_TopOpeBRepTool_HBoxTool : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRepTool_HBoxTool();
        Handle_TopOpeBRepTool_HBoxTool(const Handle_TopOpeBRepTool_HBoxTool &aHandle);
        Handle_TopOpeBRepTool_HBoxTool(const TopOpeBRepTool_HBoxTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepTool_HBoxTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepTool_HBoxTool {
    TopOpeBRepTool_HBoxTool* GetObject() {
    return (TopOpeBRepTool_HBoxTool*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepTool_HBoxTool::~Handle_TopOpeBRepTool_HBoxTool %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepTool_HBoxTool {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox;
class TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(Bnd_Box)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox;
		 TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox (const TopoDS_Shape & K1,const Standard_Integer K2,const Bnd_Box & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		Bnd_Box & Value ();
};


%feature("shadow") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox::~TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox {
	Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox GetHandle() {
	return *(Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox;
class Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox();
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox(const Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox &aHandle);
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox(const TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox {
    TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox* GetObject() {
    return (TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox::~Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d;
class TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(Bnd_Box2d)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d;
		 TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d (const TopoDS_Shape & K1,const Standard_Integer K2,const Bnd_Box2d & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box2d

No detailed docstring for this function.") Value;
		Bnd_Box2d & Value ();
};


%feature("shadow") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d::~TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d {
	Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d GetHandle() {
	return *(Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d;
class Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d();
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d(const Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d &aHandle);
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d(const TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d {
    TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d* GetObject() {
    return (TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d::~Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity;
class TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(TopOpeBRepTool_connexity)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity;
		 TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity (const TopoDS_Shape & K1,const Standard_Integer K2,const TopOpeBRepTool_connexity & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_connexity

No detailed docstring for this function.") Value;
		TopOpeBRepTool_connexity & Value ();
};


%feature("shadow") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity::~TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity {
	Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity GetHandle() {
	return *(Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity;
class Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity();
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity(const Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity &aHandle);
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity(const TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity {
    TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity* GetObject() {
    return (TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity::~Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier;
class TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(BRepClass3d_SolidClassifier)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier;
		 TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier (const TopoDS_Shape & K1,const Standard_Integer K2,const BRepClass3d_SolidClassifier & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepClass3d_SolidClassifier

No detailed docstring for this function.") Value;
		BRepClass3d_SolidClassifier & Value ();
};


%feature("shadow") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier::~TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier {
	Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier GetHandle() {
	return *(Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier;
class Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier();
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier(const Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier &aHandle);
        Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier(const TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier {
    TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier* GetObject() {
    return (TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier::~Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepTool_IndexedDataMapOfShapeBox;
class TopOpeBRepTool_IndexedDataMapOfShapeBox : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_IndexedDataMapOfShapeBox;
		 TopOpeBRepTool_IndexedDataMapOfShapeBox (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_IndexedDataMapOfShapeBox)

Returns:
	TopOpeBRepTool_IndexedDataMapOfShapeBox

No detailed docstring for this function.") Assign;
		TopOpeBRepTool_IndexedDataMapOfShapeBox & Assign (const TopOpeBRepTool_IndexedDataMapOfShapeBox & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_IndexedDataMapOfShapeBox)

Returns:
	TopOpeBRepTool_IndexedDataMapOfShapeBox

No detailed docstring for this function.") operator=;
		TopOpeBRepTool_IndexedDataMapOfShapeBox & operator = (const TopOpeBRepTool_IndexedDataMapOfShapeBox & Other);
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
	I(Bnd_Box)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const Bnd_Box & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const Bnd_Box & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Bnd_Box

No detailed docstring for this function.") FindFromIndex;
		const Bnd_Box & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Bnd_Box

No detailed docstring for this function.") ChangeFromIndex;
		Bnd_Box & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Bnd_Box

No detailed docstring for this function.") FindFromKey;
		const Bnd_Box & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Bnd_Box

No detailed docstring for this function.") ChangeFromKey;
		Bnd_Box & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepTool_IndexedDataMapOfShapeBox::~TopOpeBRepTool_IndexedDataMapOfShapeBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_IndexedDataMapOfShapeBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_IndexedDataMapOfShapeBox2d;
class TopOpeBRepTool_IndexedDataMapOfShapeBox2d : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_IndexedDataMapOfShapeBox2d;
		 TopOpeBRepTool_IndexedDataMapOfShapeBox2d (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_IndexedDataMapOfShapeBox2d)

Returns:
	TopOpeBRepTool_IndexedDataMapOfShapeBox2d

No detailed docstring for this function.") Assign;
		TopOpeBRepTool_IndexedDataMapOfShapeBox2d & Assign (const TopOpeBRepTool_IndexedDataMapOfShapeBox2d & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_IndexedDataMapOfShapeBox2d)

Returns:
	TopOpeBRepTool_IndexedDataMapOfShapeBox2d

No detailed docstring for this function.") operator=;
		TopOpeBRepTool_IndexedDataMapOfShapeBox2d & operator = (const TopOpeBRepTool_IndexedDataMapOfShapeBox2d & Other);
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
	I(Bnd_Box2d)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const Bnd_Box2d & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const Bnd_Box2d & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Bnd_Box2d

No detailed docstring for this function.") FindFromIndex;
		const Bnd_Box2d & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Bnd_Box2d

No detailed docstring for this function.") ChangeFromIndex;
		Bnd_Box2d & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Bnd_Box2d

No detailed docstring for this function.") FindFromKey;
		const Bnd_Box2d & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Bnd_Box2d

No detailed docstring for this function.") ChangeFromKey;
		Bnd_Box2d & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepTool_IndexedDataMapOfShapeBox2d::~TopOpeBRepTool_IndexedDataMapOfShapeBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_IndexedDataMapOfShapeBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_IndexedDataMapOfShapeconnexity;
class TopOpeBRepTool_IndexedDataMapOfShapeconnexity : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_IndexedDataMapOfShapeconnexity;
		 TopOpeBRepTool_IndexedDataMapOfShapeconnexity (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_IndexedDataMapOfShapeconnexity)

Returns:
	TopOpeBRepTool_IndexedDataMapOfShapeconnexity

No detailed docstring for this function.") Assign;
		TopOpeBRepTool_IndexedDataMapOfShapeconnexity & Assign (const TopOpeBRepTool_IndexedDataMapOfShapeconnexity & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_IndexedDataMapOfShapeconnexity)

Returns:
	TopOpeBRepTool_IndexedDataMapOfShapeconnexity

No detailed docstring for this function.") operator=;
		TopOpeBRepTool_IndexedDataMapOfShapeconnexity & operator = (const TopOpeBRepTool_IndexedDataMapOfShapeconnexity & Other);
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
	I(TopOpeBRepTool_connexity)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopOpeBRepTool_connexity & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(TopOpeBRepTool_connexity)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopOpeBRepTool_connexity & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepTool_connexity

No detailed docstring for this function.") FindFromIndex;
		const TopOpeBRepTool_connexity & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepTool_connexity

No detailed docstring for this function.") ChangeFromIndex;
		TopOpeBRepTool_connexity & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepTool_connexity

No detailed docstring for this function.") FindFromKey;
		const TopOpeBRepTool_connexity & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepTool_connexity

No detailed docstring for this function.") ChangeFromKey;
		TopOpeBRepTool_connexity & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepTool_IndexedDataMapOfShapeconnexity::~TopOpeBRepTool_IndexedDataMapOfShapeconnexity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_IndexedDataMapOfShapeconnexity {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_IndexedDataMapOfSolidClassifier;
class TopOpeBRepTool_IndexedDataMapOfSolidClassifier : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_IndexedDataMapOfSolidClassifier;
		 TopOpeBRepTool_IndexedDataMapOfSolidClassifier (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_IndexedDataMapOfSolidClassifier)

Returns:
	TopOpeBRepTool_IndexedDataMapOfSolidClassifier

No detailed docstring for this function.") Assign;
		TopOpeBRepTool_IndexedDataMapOfSolidClassifier & Assign (const TopOpeBRepTool_IndexedDataMapOfSolidClassifier & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_IndexedDataMapOfSolidClassifier)

Returns:
	TopOpeBRepTool_IndexedDataMapOfSolidClassifier

No detailed docstring for this function.") operator=;
		TopOpeBRepTool_IndexedDataMapOfSolidClassifier & operator = (const TopOpeBRepTool_IndexedDataMapOfSolidClassifier & Other);
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
	I(BRepClass3d_SolidClassifier)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const BRepClass3d_SolidClassifier & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(BRepClass3d_SolidClassifier)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const BRepClass3d_SolidClassifier & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	BRepClass3d_SolidClassifier

No detailed docstring for this function.") FindFromIndex;
		const BRepClass3d_SolidClassifier & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	BRepClass3d_SolidClassifier

No detailed docstring for this function.") ChangeFromIndex;
		BRepClass3d_SolidClassifier & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	BRepClass3d_SolidClassifier

No detailed docstring for this function.") FindFromKey;
		const BRepClass3d_SolidClassifier & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	BRepClass3d_SolidClassifier

No detailed docstring for this function.") ChangeFromKey;
		BRepClass3d_SolidClassifier & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepTool_IndexedDataMapOfSolidClassifier::~TopOpeBRepTool_IndexedDataMapOfSolidClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_IndexedDataMapOfSolidClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_ListIteratorOfListOfC2DF;
class TopOpeBRepTool_ListIteratorOfListOfC2DF {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_ListIteratorOfListOfC2DF;
		 TopOpeBRepTool_ListIteratorOfListOfC2DF ();
		%feature("autodoc", "Args:
	L(TopOpeBRepTool_ListOfC2DF)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_ListIteratorOfListOfC2DF;
		 TopOpeBRepTool_ListIteratorOfListOfC2DF (const TopOpeBRepTool_ListOfC2DF & L);
		%feature("autodoc", "Args:
	L(TopOpeBRepTool_ListOfC2DF)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepTool_ListOfC2DF & L);
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
	TopOpeBRepTool_C2DF

No detailed docstring for this function.") Value;
		TopOpeBRepTool_C2DF & Value ();
};


%feature("shadow") TopOpeBRepTool_ListIteratorOfListOfC2DF::~TopOpeBRepTool_ListIteratorOfListOfC2DF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_ListIteratorOfListOfC2DF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_ListNodeOfListOfC2DF;
class TopOpeBRepTool_ListNodeOfListOfC2DF : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(TopOpeBRepTool_C2DF)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_ListNodeOfListOfC2DF;
		 TopOpeBRepTool_ListNodeOfListOfC2DF (const TopOpeBRepTool_C2DF & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_C2DF

No detailed docstring for this function.") Value;
		TopOpeBRepTool_C2DF & Value ();
};


%feature("shadow") TopOpeBRepTool_ListNodeOfListOfC2DF::~TopOpeBRepTool_ListNodeOfListOfC2DF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_ListNodeOfListOfC2DF {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepTool_ListNodeOfListOfC2DF {
	Handle_TopOpeBRepTool_ListNodeOfListOfC2DF GetHandle() {
	return *(Handle_TopOpeBRepTool_ListNodeOfListOfC2DF*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRepTool_ListNodeOfListOfC2DF;
class Handle_TopOpeBRepTool_ListNodeOfListOfC2DF : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepTool_ListNodeOfListOfC2DF();
        Handle_TopOpeBRepTool_ListNodeOfListOfC2DF(const Handle_TopOpeBRepTool_ListNodeOfListOfC2DF &aHandle);
        Handle_TopOpeBRepTool_ListNodeOfListOfC2DF(const TopOpeBRepTool_ListNodeOfListOfC2DF *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepTool_ListNodeOfListOfC2DF DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepTool_ListNodeOfListOfC2DF {
    TopOpeBRepTool_ListNodeOfListOfC2DF* GetObject() {
    return (TopOpeBRepTool_ListNodeOfListOfC2DF*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepTool_ListNodeOfListOfC2DF::~Handle_TopOpeBRepTool_ListNodeOfListOfC2DF %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepTool_ListNodeOfListOfC2DF {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepTool_ListOfC2DF;
class TopOpeBRepTool_ListOfC2DF {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_ListOfC2DF;
		 TopOpeBRepTool_ListOfC2DF ();
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_ListOfC2DF)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopOpeBRepTool_ListOfC2DF & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_ListOfC2DF)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopOpeBRepTool_ListOfC2DF & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(TopOpeBRepTool_C2DF)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopOpeBRepTool_C2DF & I);
		%feature("autodoc", "Args:
	I(TopOpeBRepTool_C2DF)
	theIt(TopOpeBRepTool_ListIteratorOfListOfC2DF)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopOpeBRepTool_C2DF & I,TopOpeBRepTool_ListIteratorOfListOfC2DF & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_ListOfC2DF)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopOpeBRepTool_ListOfC2DF & Other);
		%feature("autodoc", "Args:
	I(TopOpeBRepTool_C2DF)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopOpeBRepTool_C2DF & I);
		%feature("autodoc", "Args:
	I(TopOpeBRepTool_C2DF)
	theIt(TopOpeBRepTool_ListIteratorOfListOfC2DF)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopOpeBRepTool_C2DF & I,TopOpeBRepTool_ListIteratorOfListOfC2DF & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_ListOfC2DF)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopOpeBRepTool_ListOfC2DF & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_C2DF

No detailed docstring for this function.") First;
		TopOpeBRepTool_C2DF & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_C2DF

No detailed docstring for this function.") Last;
		TopOpeBRepTool_C2DF & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TopOpeBRepTool_ListIteratorOfListOfC2DF)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TopOpeBRepTool_ListIteratorOfListOfC2DF & It);
		%feature("autodoc", "Args:
	I(TopOpeBRepTool_C2DF)
	It(TopOpeBRepTool_ListIteratorOfListOfC2DF)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const TopOpeBRepTool_C2DF & I,TopOpeBRepTool_ListIteratorOfListOfC2DF & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_ListOfC2DF)
	It(TopOpeBRepTool_ListIteratorOfListOfC2DF)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TopOpeBRepTool_ListOfC2DF & Other,TopOpeBRepTool_ListIteratorOfListOfC2DF & It);
		%feature("autodoc", "Args:
	I(TopOpeBRepTool_C2DF)
	It(TopOpeBRepTool_ListIteratorOfListOfC2DF)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const TopOpeBRepTool_C2DF & I,TopOpeBRepTool_ListIteratorOfListOfC2DF & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepTool_ListOfC2DF)
	It(TopOpeBRepTool_ListIteratorOfListOfC2DF)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TopOpeBRepTool_ListOfC2DF & Other,TopOpeBRepTool_ListIteratorOfListOfC2DF & It);
};


%feature("shadow") TopOpeBRepTool_ListOfC2DF::~TopOpeBRepTool_ListOfC2DF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_ListOfC2DF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_PurgeInternalEdges;
class TopOpeBRepTool_PurgeInternalEdges {
	public:
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

Initialize   members and  begin  exploration   of  shape  
         depending of the value of PerformNow") TopOpeBRepTool_PurgeInternalEdges;
		 TopOpeBRepTool_PurgeInternalEdges (const TopoDS_Shape & theShape,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	theMapFacLstEdg(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

returns  the list  internal edges associated  with  
         the faces of the  myShape. If PerformNow was False  
         when created, then call the private Perform method  
         that do the main job.") Faces;
		void Faces (TopTools_DataMapOfShapeListOfShape & theMapFacLstEdg);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns myShape modified with the list of internal  
         edges removed from it.") Shape;
		TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of edges candidate to be removed") NbEdges;
		const Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns False  if the list  of internal  edges has  
         not been extracted") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Using   the list  of internal edge    from each face,  
          rebuild myShape by removing thoses edges.") Perform;
		void Perform ();
};


%feature("shadow") TopOpeBRepTool_PurgeInternalEdges::~TopOpeBRepTool_PurgeInternalEdges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_PurgeInternalEdges {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_REGUS;
class TopOpeBRepTool_REGUS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_REGUS;
		 TopOpeBRepTool_REGUS ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") S;
		const TopoDS_Shape & S ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MapS;
		Standard_Boolean MapS ();
		%feature("autodoc", "Args:
	Fanc(TopoDS_Face)
	nWs(TopTools_ListOfShape)
	nFs(TopTools_ListOfShape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") WireToFace;
		static Standard_Boolean WireToFace (const TopoDS_Face & Fanc,const TopTools_ListOfShape & nWs,TopTools_ListOfShape & nFs);
		%feature("autodoc", "Args:
	Fanc(TopoDS_Face)
	FSplits(TopTools_ListOfShape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") SplitF;
		static Standard_Boolean SplitF (const TopoDS_Face & Fanc,TopTools_ListOfShape & FSplits);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") SplitFaces;
		Standard_Boolean SplitFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") REGU;
		Standard_Boolean REGU ();
		%feature("autodoc", "Args:
	Fsplits(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") SetFsplits;
		void SetFsplits (TopTools_DataMapOfShapeListOfShape & Fsplits);
		%feature("autodoc", "Args:
	Fsplits(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") GetFsplits;
		void GetFsplits (TopTools_DataMapOfShapeListOfShape & Fsplits);
		%feature("autodoc", "Args:
	OshNsh(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") SetOshNsh;
		void SetOshNsh (TopTools_DataMapOfShapeListOfShape & OshNsh);
		%feature("autodoc", "Args:
	OshNsh(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") GetOshNsh;
		void GetOshNsh (TopTools_DataMapOfShapeListOfShape & OshNsh);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") InitBlock;
		Standard_Boolean InitBlock ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") NextinBlock;
		Standard_Boolean NextinBlock ();
		%feature("autodoc", "Args:
	e(TopoDS_Edge)
	lof(TopTools_ListOfShape)
	ffound(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") NearestF;
		Standard_Boolean NearestF (const TopoDS_Edge & e,const TopTools_ListOfShape & lof,TopoDS_Face & ffound);
};


%feature("shadow") TopOpeBRepTool_REGUS::~TopOpeBRepTool_REGUS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_REGUS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_REGUW;
class TopOpeBRepTool_REGUW {
	public:
		%feature("autodoc", "Args:
	FRef(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_REGUW;
		 TopOpeBRepTool_REGUW (const TopoDS_Face & FRef);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Fref;
		const TopoDS_Face & Fref ();
		%feature("autodoc", "Args:
	Esplits(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") SetEsplits;
		void SetEsplits (TopTools_DataMapOfShapeListOfShape & Esplits);
		%feature("autodoc", "Args:
	Esplits(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") GetEsplits;
		void GetEsplits (TopTools_DataMapOfShapeListOfShape & Esplits);
		%feature("autodoc", "Args:
	OwNw(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") SetOwNw;
		void SetOwNw (TopTools_DataMapOfShapeListOfShape & OwNw);
		%feature("autodoc", "Args:
	OwNw(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") GetOwNw;
		void GetOwNw (TopTools_DataMapOfShapeListOfShape & OwNw);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") SplitEds;
		Standard_Boolean SplitEds ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") S;
		const TopoDS_Shape & S ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasInit;
		Standard_Boolean HasInit ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MapS;
		Standard_Boolean MapS ();
		%feature("autodoc", "Args:
	istep(Standard_Integer)
	Scur(TopoDS_Shape)
	Splits(TopTools_ListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") REGU;
		Standard_Boolean REGU (const Standard_Integer istep,const TopoDS_Shape & Scur,TopTools_ListOfShape & Splits);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") REGU;
		Standard_Boolean REGU ();
		%feature("autodoc", "Args:
	Splits(TopTools_ListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetSplits;
		Standard_Boolean GetSplits (TopTools_ListOfShape & Splits);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") InitBlock;
		Standard_Boolean InitBlock ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") NextinBlock;
		Standard_Boolean NextinBlock ();
		%feature("autodoc", "Args:
	loe(TopTools_ListOfShape)
	efound(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") NearestE;
		Standard_Boolean NearestE (const TopTools_ListOfShape & loe,TopoDS_Edge & efound);
		%feature("autodoc", "Args:
	v(TopoDS_Vertex)
	co(TopOpeBRepTool_connexity)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Connexity;
		Standard_Boolean Connexity (const TopoDS_Vertex & v,TopOpeBRepTool_connexity & co);
		%feature("autodoc", "Args:
	v(TopoDS_Vertex)
	OriKey(Standard_Integer)
	e(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") AddNewConnexity;
		Standard_Boolean AddNewConnexity (const TopoDS_Vertex & v,const Standard_Integer OriKey,const TopoDS_Edge & e);
		%feature("autodoc", "Args:
	v(TopoDS_Vertex)
	OriKey(Standard_Integer)
	e(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") RemoveOldConnexity;
		Standard_Boolean RemoveOldConnexity (const TopoDS_Vertex & v,const Standard_Integer OriKey,const TopoDS_Edge & e);
		%feature("autodoc", "Args:
	v(TopoDS_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UpdateMultiple;
		Standard_Boolean UpdateMultiple (const TopoDS_Vertex & v);
};


%feature("shadow") TopOpeBRepTool_REGUW::~TopOpeBRepTool_REGUW %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_REGUW {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_ShapeClassifier;
class TopOpeBRepTool_ShapeClassifier {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier ();
		%feature("autodoc", "Args:
	SRef(TopoDS_Shape)

Returns:
	None

SRef is the reference shape.  
StateShapeShape(S) calls will classify S with SRef.") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier (const TopoDS_Shape & SRef);
		%feature("autodoc", "Args:
	None
Returns:
	None

reset all internal data (SolidClassifier included)") ClearAll;
		void ClearAll ();
		%feature("autodoc", "Args:
	None
Returns:
	None

reset all internal data (except SolidClassified)") ClearCurrent;
		void ClearCurrent ();
		%feature("autodoc", "Args:
	SRef(TopoDS_Shape)

Returns:
	None

Set SRef as reference shape  
the next StateShapeReference(S,AvoidS) calls will classify S with SRef.") SetReference;
		void SetReference (const TopoDS_Shape & SRef);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	SRef(TopoDS_Shape)
	samedomain(Standard_Integer)=0

Returns:
	TopAbs_State

classify shape S compared with shape SRef.  
 samedomain = 0 : S1,S2 are not same domain  
 samedomain = 1 : S1,S2 are same domain") StateShapeShape;
		TopAbs_State StateShapeShape (const TopoDS_Shape & S,const TopoDS_Shape & SRef,const Standard_Integer samedomain = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SameDomain;
		Standard_Integer SameDomain ();
		%feature("autodoc", "Args:
	samedomain(Standard_Integer)

Returns:
	None

set mode for next StateShapeShape call  
	  samedomain = true --> S,Sref are same domain --> point  
	  on restriction (ON S) is used to classify S.  
	  samedomain = false --> S,Sref are not domain --> point  
	  not on restriction of S (IN S) is used to classify S.  
	  samedomain value is used only in next StateShapeShape call") SameDomain;
		void SameDomain (const Standard_Integer samedomain);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	AvoidS(TopoDS_Shape)
	SRef(TopoDS_Shape)

Returns:
	TopAbs_State

classify shape S compared with shape SRef.  
AvoidS is not used in classification; AvoidS may be IsNull().  
(usefull to avoid ON or UNKNOWN state in special cases)") StateShapeShape;
		TopAbs_State StateShapeShape (const TopoDS_Shape & S,const TopoDS_Shape & AvoidS,const TopoDS_Shape & SRef);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	LAvoidS(TopTools_ListOfShape)
	SRef(TopoDS_Shape)

Returns:
	TopAbs_State

classify shape S compared with shape SRef.  
LAvoidS is list of S subshapes to avoid in classification  
AvoidS is not used in classification; AvoidS may be IsNull().  
(usefull to avoid ON or UNKNOWN state in special cases)") StateShapeShape;
		TopAbs_State StateShapeShape (const TopoDS_Shape & S,const TopTools_ListOfShape & LAvoidS,const TopoDS_Shape & SRef);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	AvoidS(TopoDS_Shape)

Returns:
	TopAbs_State

classify shape S compared with reference shape.  
AvoidS is not used in classification; AvoidS may be IsNull().  
(usefull to avoid ON or UNKNOWN state in special cases)") StateShapeReference;
		TopAbs_State StateShapeReference (const TopoDS_Shape & S,const TopoDS_Shape & AvoidS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	LAvoidS(TopTools_ListOfShape)

Returns:
	TopAbs_State

classify shape S compared with reference shape.  
LAvoidS is list of S subshapes to avoid in classification  
(usefull to avoid ON or UNKNOWN state in special cases)") StateShapeReference;
		TopAbs_State StateShapeReference (const TopoDS_Shape & S,const TopTools_ListOfShape & LAvoidS);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_SolidClassifier

No detailed docstring for this function.") ChangeSolidClassifier;
		TopOpeBRepTool_SolidClassifier & ChangeSolidClassifier ();
		%feature("autodoc", "Args:
	P2D(gp_Pnt2d)

Returns:
	None

classify point P2D with myRef") StateP2DReference;
		void StateP2DReference (const gp_Pnt2d & P2D);
		%feature("autodoc", "Args:
	P3D(gp_Pnt)

Returns:
	None

classify point P3D with myRef") StateP3DReference;
		void StateP3DReference (const gp_Pnt & P3D);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

return field myState") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") P2D;
		const gp_Pnt2d & P2D ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") P3D;
		const gp_Pnt & P3D ();
};


%feature("shadow") TopOpeBRepTool_ShapeClassifier::~TopOpeBRepTool_ShapeClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_ShapeClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_ShapeExplorer;
class TopOpeBRepTool_ShapeExplorer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty explorer, becomes usefull after Init.") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ToFind(TopAbs_ShapeEnum)
	ToAvoid(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

Creates an Explorer on the Shape <S>.  
 
         <ToFind> is the type of shapes to search.  
             TopAbs_VERTEX, TopAbs_EDGE, ...  
 
         <ToAvoid>   is the type   of shape to  skip in the  
         exploration.   If   <ToAvoid>  is  equal  or  less  
         complex than <ToFind> or if  <ToAVoid> is SHAPE it  
         has no effect on the exploration.") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer (const TopoDS_Shape & S,const TopAbs_ShapeEnum ToFind,const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ToFind(TopAbs_ShapeEnum)
	ToAvoid(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S,const TopAbs_ShapeEnum ToFind,const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  True if  there are   more  shapes in  the  
         exploration.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Moves to the next Shape in the exploration.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the current shape in the exploration.") Current;
		const TopoDS_Shape & Current ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpCurrentToString() {
            std::stringstream s;
            self->DumpCurrent(s);
            return s.str();}
        };
        };


%feature("shadow") TopOpeBRepTool_ShapeExplorer::~TopOpeBRepTool_ShapeExplorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_ShapeExplorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_ShapeTool;
class TopOpeBRepTool_ShapeTool {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static Standard_Real

Returns the tolerance of the shape <S>.  
         If the shape <S> is Null, returns 0.") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static gp_Pnt

Returns 3D point of vertex <S>.") Pnt;
		static gp_Pnt Pnt (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	static Handle_Geom_Curve

No detailed docstring for this function.") BASISCURVE;
		static Handle_Geom_Curve BASISCURVE (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Handle_Geom_Curve

No detailed docstring for this function.") BASISCURVE;
		static Handle_Geom_Curve BASISCURVE (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	static Handle_Geom_Surface

No detailed docstring for this function.") BASISSURFACE;
		static Handle_Geom_Surface BASISSURFACE (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static Handle_Geom_Surface

No detailed docstring for this function.") BASISSURFACE;
		static Handle_Geom_Surface BASISSURFACE (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UPeri(Standard_Boolean)
	VPeri(Standard_Boolean)
	Umin(Standard_Real)
	Umax(Standard_Real)
	Vmin(Standard_Real)
	Vmax(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") UVBOUNDS;
		static void UVBOUNDS (const Handle_Geom_Surface & S,Standard_Boolean & UPeri,Standard_Boolean & VPeri,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	UPeri(Standard_Boolean)
	VPeri(Standard_Boolean)
	Umin(Standard_Real)
	Umax(Standard_Real)
	Vmin(Standard_Real)
	Vmax(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") UVBOUNDS;
		static void UVBOUNDS (const TopoDS_Face & F,Standard_Boolean & UPeri,Standard_Boolean & VPeri,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	u(Standard_Real)
	v(Standard_Real)

Returns:
	static void

ajust u,v values in UVBounds of the domain of the  
         geometric shape <S>, according to Uperiodicity and  
         VPeriodicity of the domain.  
         <S> is assumed to be a face.  
         u and/or v is/are not modified when the domain is  
         not periodic in U and/or V .") AdjustOnPeriodic;
		static void AdjustOnPeriodic (const TopoDS_Shape & S,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	static Standard_Boolean

indicates wheter shape S1 is a closing shape on S2 or not.") Closed;
		static Standard_Boolean Closed (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	par(Standard_Real)
	EE(TopoDS_Shape)
	FF(TopoDS_Shape)

Returns:
	static Standard_Real

No detailed docstring for this function.") PeriodizeParameter;
		static Standard_Real PeriodizeParameter (const Standard_Real par,const TopoDS_Shape & EE,const TopoDS_Shape & FF);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") ShapesSameOriented;
		static Standard_Boolean ShapesSameOriented (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	S1(BRepAdaptor_Surface)
	S2(BRepAdaptor_Surface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") SurfacesSameOriented;
		static Standard_Boolean SurfacesSameOriented (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2);
		%feature("autodoc", "Args:
	F1(TopoDS_Shape)
	F2(TopoDS_Shape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") FacesSameOriented;
		static Standard_Boolean FacesSameOriented (const TopoDS_Shape & F1,const TopoDS_Shape & F2);
		%feature("autodoc", "Args:
	C1(BRepAdaptor_Curve)
	C2(BRepAdaptor_Curve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") CurvesSameOriented;
		static Standard_Boolean CurvesSameOriented (const BRepAdaptor_Curve & C1,const BRepAdaptor_Curve & C2);
		%feature("autodoc", "Args:
	E1(TopoDS_Shape)
	E2(TopoDS_Shape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") EdgesSameOriented;
		static Standard_Boolean EdgesSameOriented (const TopoDS_Shape & E1,const TopoDS_Shape & E2);
		%feature("autodoc", "Args:
	BRAC(BRepAdaptor_Curve)
	P(Standard_Real)
	T(gp_Dir)
	N(gp_Dir)
	C(Standard_Real)

Returns:
	static Standard_Real

Compute tangent T, normal N, curvature C at point of parameter  
P on curve BRAC. Returns the tolerance indicating if T,N are null.") EdgeData;
		static Standard_Real EdgeData (const BRepAdaptor_Curve & BRAC,const Standard_Real P,gp_Dir & T,gp_Dir & N,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	P(Standard_Real)
	T(gp_Dir)
	N(gp_Dir)
	C(Standard_Real)

Returns:
	static Standard_Real

Same as previous on edge E.") EdgeData;
		static Standard_Real EdgeData (const TopoDS_Shape & E,const Standard_Real P,gp_Dir & T,gp_Dir & N,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	SU(Handle_Geom_Surface)
	Tol2d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") Resolution3dU;
		static Standard_Real Resolution3dU (const Handle_Geom_Surface & SU,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	SU(Handle_Geom_Surface)
	Tol2d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") Resolution3dV;
		static Standard_Real Resolution3dV (const Handle_Geom_Surface & SU,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	SU(Handle_Geom_Surface)
	Tol2d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") Resolution3d;
		static Standard_Real Resolution3d (const Handle_Geom_Surface & SU,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Tol2d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") Resolution3d;
		static Standard_Real Resolution3d (const TopoDS_Face & F,const Standard_Real Tol2d);
};


%feature("shadow") TopOpeBRepTool_ShapeTool::~TopOpeBRepTool_ShapeTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_ShapeTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_SolidClassifier;
class TopOpeBRepTool_SolidClassifier {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_SolidClassifier;
		 TopOpeBRepTool_SolidClassifier ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	S(TopoDS_Solid)

Returns:
	None

No detailed docstring for this function.") LoadSolid;
		void LoadSolid (const TopoDS_Solid & S);
		%feature("autodoc", "Args:
	S(TopoDS_Solid)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	TopAbs_State

compute the position of point <P> regarding with the  
geometric domain of the solid <S>.") Classify;
		TopAbs_State Classify (const TopoDS_Solid & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	S(TopoDS_Shell)

Returns:
	None

No detailed docstring for this function.") LoadShell;
		void LoadShell (const TopoDS_Shell & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shell)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	TopAbs_State

compute the position of point <P> regarding with the  
geometric domain of the shell <S>.") Classify;
		TopAbs_State Classify (const TopoDS_Shell & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") State;
		TopAbs_State State ();
};


%feature("shadow") TopOpeBRepTool_SolidClassifier::~TopOpeBRepTool_SolidClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_SolidClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_TOOL;
class TopOpeBRepTool_TOOL {
	public:
		%feature("autodoc", "Args:
	sub(TopoDS_Shape)
	S(TopoDS_Shape)
	checkclo(Standard_Boolean)=Standard_False

Returns:
	static Standard_Integer

No detailed docstring for this function.") OriinSor;
		static Standard_Integer OriinSor (const TopoDS_Shape & sub,const TopoDS_Shape & S,const Standard_Boolean checkclo = Standard_False);
		%feature("autodoc", "Args:
	sub(TopoDS_Shape)
	S(TopoDS_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") OriinSorclosed;
		static Standard_Integer OriinSorclosed (const TopoDS_Shape & sub,const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	vclo(TopoDS_Vertex)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") ClosedE;
		static Standard_Boolean ClosedE (const TopoDS_Edge & E,TopoDS_Vertex & vclo);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") ClosedS;
		static Standard_Boolean ClosedS (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsClosingE;
		static Standard_Boolean IsClosingE (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	W(TopoDS_Shape)
	F(TopoDS_Face)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsClosingE;
		static Standard_Boolean IsClosingE (const TopoDS_Edge & E,const TopoDS_Shape & W,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	Vces(TopTools_Array1OfShape)

Returns:
	static void

No detailed docstring for this function.") Vertices;
		static void Vertices (const TopoDS_Edge & E,TopTools_Array1OfShape & Vces);
		%feature("autodoc", "Args:
	Iv(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	static TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		static TopoDS_Vertex Vertex (const Standard_Integer Iv,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Iv(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	static Standard_Real

No detailed docstring for this function.") ParE;
		static Standard_Real ParE (const Standard_Integer Iv,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	par(Standard_Real)
	E(TopoDS_Edge)

Returns:
	static Standard_Integer

No detailed docstring for this function.") OnBoundary;
		static Standard_Integer OnBoundary (const Standard_Real par,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	par(Standard_Real)
	C2DF(TopOpeBRepTool_C2DF)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") UVF;
		static gp_Pnt2d UVF (const Standard_Real par,const TopOpeBRepTool_C2DF & C2DF);
		%feature("autodoc", "Args:
	p2d(gp_Pnt2d)
	e(TopoDS_Edge)
	f(TopoDS_Face)
	pare(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") ParISO;
		static Standard_Boolean ParISO (const gp_Pnt2d & p2d,const TopoDS_Edge & e,const TopoDS_Face & f,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	p2d(gp_Pnt2d)
	e(TopoDS_Edge)
	f(TopoDS_Face)
	par(Standard_Real)
	dist(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") ParE2d;
		static Standard_Boolean ParE2d (const gp_Pnt2d & p2d,const TopoDS_Edge & e,const TopoDS_Face & f,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	f(TopoDS_Face)
	uv(gp_Pnt2d)
	dir(gp_Vec)
	factor(Standard_Real)
	duv(gp_Dir2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Getduv;
		static Standard_Boolean Getduv (const TopoDS_Face & f,const gp_Pnt2d & uv,const gp_Vec & dir,const Standard_Real factor,gp_Dir2d & duv);
		%feature("autodoc", "Args:
	f(TopoDS_Face)
	e(TopoDS_Edge)
	par(Standard_Real)
	eps(Standard_Real)
	uvapp(gp_Pnt2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") uvApp;
		static Standard_Boolean uvApp (const TopoDS_Face & f,const TopoDS_Edge & e,const Standard_Real par,const Standard_Real eps,gp_Pnt2d & uvapp);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	tol3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") TolUV;
		static Standard_Real TolUV (const TopoDS_Face & F,const Standard_Real tol3d);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	static Standard_Real

No detailed docstring for this function.") TolP;
		static Standard_Real TolP (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static Standard_Real

No detailed docstring for this function.") minDUV;
		static Standard_Real minDUV (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	uv(gp_Pnt2d)
	F(TopoDS_Face)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") outUVbounds;
		static Standard_Boolean outUVbounds (const gp_Pnt2d & uv,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	uv(gp_Pnt2d)
	F(TopoDS_Face)
	onU(Standard_Integer)
	onV(Standard_Integer)

Returns:
	static void

No detailed docstring for this function.") stuvF;
		static void stuvF (const gp_Pnt2d & uv,const TopoDS_Face & F,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	par(Standard_Real)
	BC(BRepAdaptor_Curve)
	Tg(gp_Vec)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") TggeomE;
		static Standard_Boolean TggeomE (const Standard_Real par,const BRepAdaptor_Curve & BC,gp_Vec & Tg);
		%feature("autodoc", "Args:
	par(Standard_Real)
	E(TopoDS_Edge)
	Tg(gp_Vec)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") TggeomE;
		static Standard_Boolean TggeomE (const Standard_Real par,const TopoDS_Edge & E,gp_Vec & Tg);
		%feature("autodoc", "Args:
	v(TopoDS_Vertex)
	E(TopoDS_Edge)
	Tg(gp_Vec)
	OvinE(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") TgINSIDE;
		static Standard_Boolean TgINSIDE (const TopoDS_Vertex & v,const TopoDS_Edge & E,gp_Vec & Tg,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	iv(Standard_Integer)
	E(TopoDS_Edge)
	C2DF(TopOpeBRepTool_C2DF)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") Tg2d;
		static gp_Vec2d Tg2d (const Standard_Integer iv,const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF);
		%feature("autodoc", "Args:
	iv(Standard_Integer)
	E(TopoDS_Edge)
	C2DF(TopOpeBRepTool_C2DF)
	factor(Standard_Real)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") Tg2dApp;
		static gp_Vec2d Tg2dApp (const Standard_Integer iv,const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF,const Standard_Real factor);
		%feature("autodoc", "Args:
	iv(Standard_Integer)
	E(TopoDS_Edge)
	C2DF(TopOpeBRepTool_C2DF)
	factor(Standard_Real)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") tryTg2dApp;
		static gp_Vec2d tryTg2dApp (const Standard_Integer iv,const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF,const Standard_Real factor);
		%feature("autodoc", "Args:
	uv(gp_Pnt2d)
	f(TopoDS_Face)
	par(Standard_Real)
	e(TopoDS_Edge)
	xx(gp_Dir)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") XX;
		static Standard_Boolean XX (const gp_Pnt2d & uv,const TopoDS_Face & f,const Standard_Real par,const TopoDS_Edge & e,gp_Dir & xx);
		%feature("autodoc", "Args:
	uv(gp_Pnt2d)
	f(TopoDS_Face)
	normt(gp_Dir)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Nt;
		static Standard_Boolean Nt (const gp_Pnt2d & uv,const TopoDS_Face & f,gp_Dir & normt);
		%feature("autodoc", "Args:
	uv(gp_Pnt2d)
	F(TopoDS_Face)
	ng(gp_Vec)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") NggeomF;
		static Standard_Boolean NggeomF (const gp_Pnt2d & uv,const TopoDS_Face & F,gp_Vec & ng);
		%feature("autodoc", "Args:
	par(Standard_Real)
	E(TopoDS_Edge)
	F(TopoDS_Face)
	tola(Standard_Real)
	ngApp(gp_Dir)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") NgApp;
		static Standard_Boolean NgApp (const Standard_Real par,const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real tola,gp_Dir & ngApp);
		%feature("autodoc", "Args:
	par(Standard_Real)
	E(TopoDS_Edge)
	F(TopoDS_Face)
	tola(Standard_Real)
	ng(gp_Dir)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") tryNgApp;
		static Standard_Boolean tryNgApp (const Standard_Real par,const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real tola,gp_Dir & ng);
		%feature("autodoc", "Args:
	par(Standard_Real)
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	static Standard_Integer

No detailed docstring for this function.") tryOriEinF;
		static Standard_Integer tryOriEinF (const Standard_Real par,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsQuad;
		static Standard_Boolean IsQuad (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsQuad;
		static Standard_Boolean IsQuad (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	par(Standard_Real)
	tg0(gp_Dir)
	Curv(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") CurvE;
		static Standard_Boolean CurvE (const TopoDS_Edge & E,const Standard_Real par,const gp_Dir & tg0,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	uv(gp_Pnt2d)
	tg0(gp_Dir)
	Curv(Standard_Real)
	direct(Standard_Boolean)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") CurvF;
		static Standard_Boolean CurvF (const TopoDS_Face & F,const gp_Pnt2d & uv,const gp_Dir & tg0,Standard_Real &OutValue,Standard_Boolean & direct);
		%feature("autodoc", "Args:
	PC(Handle_Geom2d_Curve)
	isou(Standard_Boolean)
	isov(Standard_Boolean)
	d2d(gp_Dir2d)
	o2d(gp_Pnt2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") UVISO;
		static Standard_Boolean UVISO (const Handle_Geom2d_Curve & PC,Standard_Boolean & isou,Standard_Boolean & isov,gp_Dir2d & d2d,gp_Pnt2d & o2d);
		%feature("autodoc", "Args:
	C2DF(TopOpeBRepTool_C2DF)
	isou(Standard_Boolean)
	isov(Standard_Boolean)
	d2d(gp_Dir2d)
	o2d(gp_Pnt2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") UVISO;
		static Standard_Boolean UVISO (const TopOpeBRepTool_C2DF & C2DF,Standard_Boolean & isou,Standard_Boolean & isov,gp_Dir2d & d2d,gp_Pnt2d & o2d);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	isou(Standard_Boolean)
	isov(Standard_Boolean)
	d2d(gp_Dir2d)
	o2d(gp_Pnt2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") UVISO;
		static Standard_Boolean UVISO (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Boolean & isou,Standard_Boolean & isov,gp_Dir2d & d2d,gp_Pnt2d & o2d);
		%feature("autodoc", "Args:
	PC(Handle_Geom2d_Curve)
	onU(Standard_Boolean)
	xfirst(Standard_Real)
	xperiod(Standard_Real)
	xtol(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsonCLO;
		static Standard_Boolean IsonCLO (const Handle_Geom2d_Curve & PC,const Standard_Boolean onU,const Standard_Real xfirst,const Standard_Real xperiod,const Standard_Real xtol);
		%feature("autodoc", "Args:
	C2DF(TopOpeBRepTool_C2DF)
	onU(Standard_Boolean)
	xfirst(Standard_Real)
	xperiod(Standard_Real)
	xtol(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsonCLO;
		static Standard_Boolean IsonCLO (const TopOpeBRepTool_C2DF & C2DF,const Standard_Boolean onU,const Standard_Real xfirst,const Standard_Real xperiod,const Standard_Real xtol);
		%feature("autodoc", "Args:
	t2d(gp_Vec2d)
	C2DF(TopOpeBRepTool_C2DF)

Returns:
	static void

No detailed docstring for this function.") TrslUV;
		static void TrslUV (const gp_Vec2d & t2d,TopOpeBRepTool_C2DF & C2DF);
		%feature("autodoc", "Args:
	t2d(gp_Vec2d)
	F(TopoDS_Face)
	E(TopoDS_Edge)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") TrslUVModifE;
		static Standard_Boolean TrslUVModifE (const gp_Vec2d & t2d,const TopoDS_Face & F,TopoDS_Edge & E);
		%feature("autodoc", "Args:
	d1(gp_Vec)
	d2(gp_Vec)
	ref(gp_Vec)

Returns:
	static Standard_Real

No detailed docstring for this function.") Matter;
		static Standard_Real Matter (const gp_Vec & d1,const gp_Vec & d2,const gp_Vec & ref);
		%feature("autodoc", "Args:
	d1(gp_Vec2d)
	d2(gp_Vec2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") Matter;
		static Standard_Real Matter (const gp_Vec2d & d1,const gp_Vec2d & d2);
		%feature("autodoc", "Args:
	xx1(gp_Dir)
	nt1(gp_Dir)
	xx2(gp_Dir)
	nt2(gp_Dir)
	tola(Standard_Real)
	Ang(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Matter;
		static Standard_Boolean Matter (const gp_Dir & xx1,const gp_Dir & nt1,const gp_Dir & xx2,const gp_Dir & nt2,const Standard_Real tola,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	f1(TopoDS_Face)
	f2(TopoDS_Face)
	e(TopoDS_Edge)
	pare(Standard_Real)
	tola(Standard_Real)
	Ang(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Matter;
		static Standard_Boolean Matter (const TopoDS_Face & f1,const TopoDS_Face & f2,const TopoDS_Edge & e,const Standard_Real pare,const Standard_Real tola,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	f1(TopoDS_Face)
	f2(TopoDS_Face)
	e(TopoDS_Edge)
	Ang(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") MatterKPtg;
		static Standard_Boolean MatterKPtg (const TopoDS_Face & f1,const TopoDS_Face & f2,const TopoDS_Edge & e,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	p(gp_Pnt)
	f(TopoDS_Face)
	uv(gp_Pnt2d)
	st(TopAbs_State)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Getstp3dF;
		static Standard_Boolean Getstp3dF (const gp_Pnt & p,const TopoDS_Face & f,gp_Pnt2d & uv,TopAbs_State & st);
		%feature("autodoc", "Args:
	Eanc(TopoDS_Edge)
	Splits(TopTools_ListOfShape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") SplitE;
		static Standard_Boolean SplitE (const TopoDS_Edge & Eanc,TopTools_ListOfShape & Splits);
		%feature("autodoc", "Args:
	lF(TopTools_ListOfShape)
	She(TopoDS_Shape)

Returns:
	static void

No detailed docstring for this function.") MkShell;
		static void MkShell (const TopTools_ListOfShape & lF,TopoDS_Shape & She);
		%feature("autodoc", "Args:
	loS(TopTools_ListOfShape)
	toremove(TopoDS_Shape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Remove;
		static Standard_Boolean Remove (TopTools_ListOfShape & loS,const TopoDS_Shape & toremove);
		%feature("autodoc", "Args:
	Fref(TopoDS_Face)
	mapWlow(TopTools_DataMapOfShapeListOfShape)
	lFs(TopTools_ListOfShape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") WireToFace;
		static Standard_Boolean WireToFace (const TopoDS_Face & Fref,const TopTools_DataMapOfShapeListOfShape & mapWlow,TopTools_ListOfShape & lFs);
		%feature("autodoc", "Args:
	par(Standard_Real)
	ed(TopoDS_Edge)
	uv(gp_Pnt2d)
	fa(TopoDS_Face)
	isonfa(Standard_Boolean)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") EdgeONFace;
		static Standard_Boolean EdgeONFace (const Standard_Real par,const TopoDS_Edge & ed,const gp_Pnt2d & uv,const TopoDS_Face & fa,Standard_Boolean & isonfa);
};


%feature("shadow") TopOpeBRepTool_TOOL::~TopOpeBRepTool_TOOL %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_TOOL {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_connexity;
class TopOpeBRepTool_connexity {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity ();
		%feature("autodoc", "Args:
	Key(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity (const TopoDS_Shape & Key);
		%feature("autodoc", "Args:
	Key(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetKey;
		void SetKey (const TopoDS_Shape & Key);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	OriKey(Standard_Integer)
	Item(TopTools_ListOfShape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Item;
		Standard_Integer Item (const Standard_Integer OriKey,TopTools_ListOfShape & Item);
		%feature("autodoc", "Args:
	Item(TopTools_ListOfShape)

Returns:
	Standard_Integer

No detailed docstring for this function.") AllItems;
		Standard_Integer AllItems (TopTools_ListOfShape & Item);
		%feature("autodoc", "Args:
	OriKey(Standard_Integer)
	Item(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") AddItem;
		void AddItem (const Standard_Integer OriKey,const TopTools_ListOfShape & Item);
		%feature("autodoc", "Args:
	OriKey(Standard_Integer)
	Item(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddItem;
		void AddItem (const Standard_Integer OriKey,const TopoDS_Shape & Item);
		%feature("autodoc", "Args:
	OriKey(Standard_Integer)
	Item(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") RemoveItem;
		Standard_Boolean RemoveItem (const Standard_Integer OriKey,const TopoDS_Shape & Item);
		%feature("autodoc", "Args:
	Item(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") RemoveItem;
		Standard_Boolean RemoveItem (const TopoDS_Shape & Item);
		%feature("autodoc", "Args:
	OriKey(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeItem;
		TopTools_ListOfShape & ChangeItem (const Standard_Integer OriKey);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMultiple;
		Standard_Boolean IsMultiple ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsFaulty;
		Standard_Boolean IsFaulty ();
		%feature("autodoc", "Args:
	Item(TopTools_ListOfShape)

Returns:
	Standard_Integer

No detailed docstring for this function.") IsInternal;
		Standard_Integer IsInternal (TopTools_ListOfShape & Item);
};


%feature("shadow") TopOpeBRepTool_connexity::~TopOpeBRepTool_connexity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_connexity {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_face;
class TopOpeBRepTool_face {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_face;
		 TopOpeBRepTool_face ();
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	Fref(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Init;
		Standard_Boolean Init (const TopoDS_Wire & W,const TopoDS_Face & Fref);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") W;
		const TopoDS_Wire & W ();
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

No detailed docstring for this function.") Finite;
		Standard_Boolean Finite ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Ffinite;
		const TopoDS_Face & Ffinite ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") RealF;
		TopoDS_Face RealF ();
};


%feature("shadow") TopOpeBRepTool_face::~TopOpeBRepTool_face %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_face {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepTool_makeTransition;
class TopOpeBRepTool_makeTransition {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepTool_makeTransition;
		 TopOpeBRepTool_makeTransition ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	pbef(Standard_Real)
	paft(Standard_Real)
	parE(Standard_Real)
	FS(TopoDS_Face)
	uv(gp_Pnt2d)
	factor(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Initialize;
		Standard_Boolean Initialize (const TopoDS_Edge & E,const Standard_Real pbef,const Standard_Real paft,const Standard_Real parE,const TopoDS_Face & FS,const gp_Pnt2d & uv,const Standard_Real factor);
		%feature("autodoc", "Args:
	factor(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Setfactor;
		void Setfactor (const Standard_Real factor);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Getfactor;
		Standard_Real Getfactor ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsT2d;
		Standard_Boolean IsT2d ();
		%feature("autodoc", "Args:
	ES(TopoDS_Edge)
	parES(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") SetRest;
		Standard_Boolean SetRest (const TopoDS_Edge & ES,const Standard_Real parES);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasRest;
		Standard_Boolean HasRest ();
		%feature("autodoc", "Args:
	stb(TopAbs_State)
	sta(TopAbs_State)

Returns:
	Standard_Boolean

No detailed docstring for this function.") MkT2donE;
		Standard_Boolean MkT2donE (TopAbs_State & stb,TopAbs_State & sta);
		%feature("autodoc", "Args:
	stb(TopAbs_State)
	sta(TopAbs_State)

Returns:
	Standard_Boolean

No detailed docstring for this function.") MkT3onE;
		Standard_Boolean MkT3onE (TopAbs_State & stb,TopAbs_State & sta);
		%feature("autodoc", "Args:
	stb(TopAbs_State)
	sta(TopAbs_State)

Returns:
	Standard_Boolean

No detailed docstring for this function.") MkT3dproj;
		Standard_Boolean MkT3dproj (TopAbs_State & stb,TopAbs_State & sta);
		%feature("autodoc", "Args:
	stb(TopAbs_State)
	sta(TopAbs_State)

Returns:
	Standard_Boolean

No detailed docstring for this function.") MkTonE;
		Standard_Boolean MkTonE (TopAbs_State & stb,TopAbs_State & sta);
};


%feature("shadow") TopOpeBRepTool_makeTransition::~TopOpeBRepTool_makeTransition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepTool_makeTransition {
	void _kill_pointed() {
		delete $self;
	}
};
