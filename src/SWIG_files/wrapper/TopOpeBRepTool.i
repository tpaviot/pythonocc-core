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
		%feature("autodoc", "	* Fuse edges (in a wire) of a shape where we have useless vertex. In case face <FF> is built on UV-non-connexed wires (with the two closing edges FORWARD and REVERSED, in spite of one only), we find out the faulty edge, add the faulty shapes (edge,wire,face) to <MshNOK>. <FF> is a face descendant of <F>. <MWisOld>(wire) = 1 if wire is wire of <F>  0 wire results from <F>'s wire splitted. returns false if purge fails

	:param F:
	:type F: TopoDS_Face &
	:param FF:
	:type FF: TopoDS_Face &
	:param MWisOld:
	:type MWisOld: TopTools_DataMapOfShapeInteger &
	:param MshNOK:
	:type MshNOK: TopTools_IndexedMapOfOrientedShape &
	:rtype: bool
") PurgeClosingEdges;
		static Standard_Boolean PurgeClosingEdges (const TopoDS_Face & F,const TopoDS_Face & FF,const TopTools_DataMapOfShapeInteger & MWisOld,TopTools_IndexedMapOfOrientedShape & MshNOK);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param LOF:
	:type LOF: TopTools_ListOfShape &
	:param MWisOld:
	:type MWisOld: TopTools_DataMapOfShapeInteger &
	:param MshNOK:
	:type MshNOK: TopTools_IndexedMapOfOrientedShape &
	:rtype: bool
") PurgeClosingEdges;
		static Standard_Boolean PurgeClosingEdges (const TopoDS_Face & F,const TopTools_ListOfShape & LOF,const TopTools_DataMapOfShapeInteger & MWisOld,TopTools_IndexedMapOfOrientedShape & MshNOK);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Fsp:
	:type Fsp: TopoDS_Face &
	:rtype: bool
") CorrectONUVISO;
		static Standard_Boolean CorrectONUVISO (const TopoDS_Face & F,TopoDS_Face & Fsp);
		%feature("autodoc", "	* Builds up the correct list of faces <LOFF> from <LOF>, using faulty shapes from map <MshNOK>. <LOF> is the list of <F>'s descendant faces. returns false if building fails

	:param F:
	:type F: TopoDS_Face &
	:param LOF:
	:type LOF: TopTools_ListOfShape &
	:param MshNOK:
	:type MshNOK: TopTools_IndexedMapOfOrientedShape &
	:param LOFF:
	:type LOFF: TopTools_ListOfShape &
	:rtype: bool
") MakeFaces;
		static Standard_Boolean MakeFaces (const TopoDS_Face & F,const TopTools_ListOfShape & LOF,const TopTools_IndexedMapOfOrientedShape & MshNOK,TopTools_ListOfShape & LOFF);
		%feature("autodoc", "	* Returns <False> if the face is valid (the UV representation of the face is a set of pcurves connexed by points with connexity 2). Else, splits <aFace> in order to return a list of valid faces.

	:param aFace:
	:type aFace: TopoDS_Face &
	:param aListOfFaces:
	:type aListOfFaces: TopTools_ListOfShape &
	:param ESplits:
	:type ESplits: TopTools_DataMapOfShapeListOfShape &
	:rtype: bool
") Regularize;
		static Standard_Boolean Regularize (const TopoDS_Face & aFace,TopTools_ListOfShape & aListOfFaces,TopTools_DataMapOfShapeListOfShape & ESplits);
		%feature("autodoc", "	* Returns <False> if the face is valid (the UV representation of the face is a set of pcurves connexed by points with connexity 2). Else, splits wires of the face, these are boundaries of the new faces to build up; <OldWiresNewWires> describes (wire, splits of wire); <ESplits> describes (edge, edge's splits)

	:param aFace:
	:type aFace: TopoDS_Face &
	:param OldWiresNewWires:
	:type OldWiresNewWires: TopTools_DataMapOfShapeListOfShape &
	:param ESplits:
	:type ESplits: TopTools_DataMapOfShapeListOfShape &
	:rtype: bool
") RegularizeWires;
		static Standard_Boolean RegularizeWires (const TopoDS_Face & aFace,TopTools_DataMapOfShapeListOfShape & OldWiresNewWires,TopTools_DataMapOfShapeListOfShape & ESplits);
		%feature("autodoc", "	* Classify wire's splits of map <OldWiresnewWires> in order to compute <aListOfFaces>, the splits of <aFace>.

	:param aFace:
	:type aFace: TopoDS_Face &
	:param OldWiresnewWires:
	:type OldWiresnewWires: TopTools_DataMapOfShapeListOfShape &
	:param aListOfFaces:
	:type aListOfFaces: TopTools_ListOfShape &
	:rtype: bool
") RegularizeFace;
		static Standard_Boolean RegularizeFace (const TopoDS_Face & aFace,const TopTools_DataMapOfShapeListOfShape & OldWiresnewWires,TopTools_ListOfShape & aListOfFaces);
		%feature("autodoc", "	* Returns <False> if the shell is valid (the solid is a set of faces connexed by edges with connexity 2). Else, splits faces of the shell; <OldFacesnewFaces> describes (face, splits of face).

	:param aSolid:
	:type aSolid: TopoDS_Solid &
	:param OldSheNewShe:
	:type OldSheNewShe: TopTools_DataMapOfShapeListOfShape &
	:param FSplits:
	:type FSplits: TopTools_DataMapOfShapeListOfShape &
	:rtype: bool
") RegularizeShells;
		static Standard_Boolean RegularizeShells (const TopoDS_Solid & aSolid,TopTools_DataMapOfShapeListOfShape & OldSheNewShe,TopTools_DataMapOfShapeListOfShape & FSplits);
		%feature("autodoc", "	* Prints <OCT> as string on stream <S>; returns <S>.

	:param OCT:
	:type OCT: TopOpeBRepTool_OutCurveType
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
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
		%feature("autodoc", "	* same as package method TopExp::MapShapeListOfShapes()

	:param S:
	:type S: TopoDS_Shape &
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA:
	:type TA: TopAbs_ShapeEnum
	:param M:
	:type M: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: void
") MakeAncestors;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort ();
		%feature("autodoc", "	:param T:
	:type T: Handle_TopOpeBRepTool_HBoxTool &
	:rtype: None
") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort (const Handle_TopOpeBRepTool_HBoxTool & T);
		%feature("autodoc", "	:param T:
	:type T: Handle_TopOpeBRepTool_HBoxTool &
	:rtype: None
") SetHBoxTool;
		void SetHBoxTool (const Handle_TopOpeBRepTool_HBoxTool & T);
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepTool_HBoxTool
") HBoxTool;
		const Handle_TopOpeBRepTool_HBoxTool & HBoxTool ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None
") AddBoxes;
		void AddBoxes (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None
") MakeHAB;
		void MakeHAB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "	:rtype: Handle_Bnd_HArray1OfBox
") HAB;
		const Handle_Bnd_HArray1OfBox & HAB ();
		%feature("autodoc", "	:param HAB:
	:type HAB: Handle_Bnd_HArray1OfBox &
	:param COB:
	:type COB: Bnd_Box &
	:rtype: void
") MakeHABCOB;
		static void MakeHABCOB (const Handle_Bnd_HArray1OfBox & HAB,Bnd_Box & COB);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") HABShape;
		const TopoDS_Shape  HABShape (const Standard_Integer I);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None
") MakeCOB;
		void MakeCOB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None
") AddBoxesMakeCOB;
		void AddBoxesMakeCOB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TColStd_ListIteratorOfListOfInteger
") Compare;
		const TColStd_ListIteratorOfListOfInteger & Compare (const TopoDS_Shape & S);
		%feature("autodoc", "	:param I:
	:type I: TColStd_ListIteratorOfListOfInteger &
	:rtype: TopoDS_Shape
") TouchedShape;
		const TopoDS_Shape  TouchedShape (const TColStd_ListIteratorOfListOfInteger & I);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: None
") Destroy;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF ();
		%feature("autodoc", "	:param PC:
	:type PC: Handle_Geom2d_Curve &
	:param f2d:
	:type f2d: float
	:param l2d:
	:type l2d: float
	:param tol:
	:type tol: float
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF (const Handle_Geom2d_Curve & PC,const Standard_Real f2d,const Standard_Real l2d,const Standard_Real tol,const TopoDS_Face & F);
		%feature("autodoc", "	:param PC:
	:type PC: Handle_Geom2d_Curve &
	:param f2d:
	:type f2d: float
	:param l2d:
	:type l2d: float
	:param tol:
	:type tol: float
	:rtype: None
") SetPC;
		void SetPC (const Handle_Geom2d_Curve & PC,const Standard_Real f2d,const Standard_Real l2d,const Standard_Real tol);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") SetFace;
		void SetFace (const TopoDS_Face & F);
		%feature("autodoc", "	:param f2d:
	:type f2d: float &
	:param l2d:
	:type l2d: float &
	:param tol:
	:type tol: float &
	:rtype: Handle_Geom2d_Curve
") PC;
		const Handle_Geom2d_Curve & PC (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("autodoc", "	:param PC:
	:type PC: Handle_Geom2d_Curve &
	:rtype: bool
") IsPC;
		Standard_Boolean IsPC (const Handle_Geom2d_Curve & PC);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") IsFace;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_CLASSI;
		 TopOpeBRepTool_CLASSI ();
		%feature("autodoc", "	:param Fref:
	:type Fref: TopoDS_Face &
	:rtype: None
") Init2d;
		void Init2d (const TopoDS_Face & Fref);
		%feature("autodoc", "	:rtype: bool
") HasInit2d;
		Standard_Boolean HasInit2d ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") Add2d;
		Standard_Boolean Add2d (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Box2d:
	:type Box2d: Bnd_Box2d &
	:rtype: bool
") GetBox2d;
		Standard_Boolean GetBox2d (const TopoDS_Shape & S,Bnd_Box2d & Box2d);
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param tol:
	:type tol: float
	:param checklarge:
	:type checklarge: bool
	:rtype: int
") ClassiBnd2d;
		Standard_Integer ClassiBnd2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Standard_Real tol,const Standard_Boolean checklarge);
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param stabnd2d12:
	:type stabnd2d12: Standard_Integer
	:rtype: int
") Classip2d;
		Standard_Integer Classip2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Standard_Integer stabnd2d12);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param fa:
	:type fa: TopOpeBRepTool_face &
	:rtype: bool
") Getface;
		Standard_Boolean Getface (const TopoDS_Shape & S,TopOpeBRepTool_face & fa);
		%feature("autodoc", "	:param lS:
	:type lS: TopTools_ListOfShape &
	:param mapgreasma:
	:type mapgreasma: TopTools_DataMapOfShapeListOfShape &
	:rtype: bool
") Classilist;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO ();
		%feature("autodoc", "	:param FRef:
	:type FRef: TopoDS_Face &
	:rtype: None
") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO (const TopoDS_Face & FRef);
		%feature("autodoc", "	:rtype: TopoDS_Face
") Fref;
		const TopoDS_Face  Fref ();
		%feature("autodoc", "	:rtype: GeomAdaptor_Surface
") GASref;
		const GeomAdaptor_Surface & GASref ();
		%feature("autodoc", "	:param x:
	:type x: Standard_Integer
	:param xperiod:
	:type xperiod: float &
	:rtype: bool
") Refclosed;
		Standard_Boolean Refclosed (const Standard_Integer x,Standard_Real &OutValue);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") Init;
		Standard_Boolean Init (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") S;
		const TopoDS_Shape  S ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Eds;
		const TopTools_ListOfShape & Eds ();
		%feature("autodoc", "	:rtype: bool
") UVClosed;
		Standard_Boolean UVClosed ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param tol3d:
	:type tol3d: float
	:rtype: float
") Tol;
		Standard_Real Tol (const Standard_Integer I,const Standard_Real tol3d);
		%feature("autodoc", "	:param ClEds:
	:type ClEds: TopTools_ListOfShape &
	:param fyClEds:
	:type fyClEds: TopTools_ListOfShape &
	:rtype: bool
") PurgeFyClosingE;
		Standard_Boolean PurgeFyClosingE (const TopTools_ListOfShape & ClEds,TopTools_ListOfShape & fyClEds);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param onU:
	:type onU: bool
	:param tolx:
	:type tolx: float
	:param parspE:
	:type parspE: float &
	:rtype: int
") EdgeOUTofBoundsUV;
		Standard_Integer EdgeOUTofBoundsUV (const TopoDS_Edge & E,const Standard_Boolean onU,const Standard_Real tolx,Standard_Real &OutValue);
		%feature("autodoc", "	:param EdsToCheck:
	:type EdsToCheck: TopTools_ListOfShape &
	:param onU:
	:type onU: bool
	:param tolx:
	:type tolx: float
	:param FyEds:
	:type FyEds: TopTools_DataMapOfOrientedShapeInteger &
	:rtype: bool
") EdgesOUTofBoundsUV;
		Standard_Boolean EdgesOUTofBoundsUV (const TopTools_ListOfShape & EdsToCheck,const Standard_Boolean onU,const Standard_Real tolx,TopTools_DataMapOfOrientedShapeInteger & FyEds);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param Ivfaulty:
	:type Ivfaulty: Standard_Integer &
	:rtype: bool
") EdgeWithFaultyUV;
		Standard_Boolean EdgeWithFaultyUV (const TopoDS_Edge & E,Standard_Integer &OutValue);
		%feature("autodoc", "	:param EdsToCheck:
	:type EdsToCheck: TopTools_ListOfShape &
	:param nfybounds:
	:type nfybounds: Standard_Integer
	:param FyEds:
	:type FyEds: TopTools_DataMapOfOrientedShapeInteger &
	:param stopatfirst: default value is Standard_False
	:type stopatfirst: bool
	:rtype: bool
") EdgesWithFaultyUV;
		Standard_Boolean EdgesWithFaultyUV (const TopTools_ListOfShape & EdsToCheck,const Standard_Integer nfybounds,TopTools_DataMapOfOrientedShapeInteger & FyEds,const Standard_Boolean stopatfirst = Standard_False);
		%feature("autodoc", "	:param EdsToCheck:
	:type EdsToCheck: TopTools_ListOfShape &
	:param nfybounds:
	:type nfybounds: Standard_Integer
	:param fyE:
	:type fyE: TopoDS_Shape &
	:param Ifaulty:
	:type Ifaulty: Standard_Integer &
	:rtype: bool
") EdgeWithFaultyUV;
		Standard_Boolean EdgeWithFaultyUV (const TopTools_ListOfShape & EdsToCheck,const Standard_Integer nfybounds,TopoDS_Shape & fyE,Standard_Integer &OutValue);
		%feature("autodoc", "	:param onU:
	:type onU: bool
	:param FyEds:
	:type FyEds: TopTools_DataMapOfOrientedShapeInteger &
	:rtype: bool
") TrslUV;
		Standard_Boolean TrslUV (const Standard_Boolean onU,const TopTools_DataMapOfOrientedShapeInteger & FyEds);
		%feature("autodoc", "	:param newS:
	:type newS: TopoDS_Face &
	:rtype: bool
") GetnewS;
		Standard_Boolean GetnewS (TopoDS_Face & newS);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF &
	:rtype: bool
") UVRep;
		Standard_Boolean UVRep (const TopoDS_Edge & E,TopOpeBRepTool_C2DF & C2DF);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF &
	:rtype: bool
") SetUVRep;
		Standard_Boolean SetUVRep (const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param Eds:
	:type Eds: TopTools_ListOfShape &
	:rtype: bool
") Connexity;
		Standard_Boolean Connexity (const TopoDS_Vertex & V,TopTools_ListOfShape & Eds);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param Eds:
	:type Eds: TopTools_ListOfShape &
	:rtype: bool
") SetConnexity;
		Standard_Boolean SetConnexity (const TopoDS_Vertex & V,const TopTools_ListOfShape & Eds);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") AddNewConnexity;
		Standard_Boolean AddNewConnexity (const TopoDS_Vertex & V,const TopoDS_Edge & E);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") RemoveOldConnexity;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool ();
		%feature("autodoc", "	:param OCT:
	:type OCT: TopOpeBRepTool_OutCurveType
	:rtype: None
") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool (const TopOpeBRepTool_OutCurveType OCT);
		%feature("autodoc", "	:param GT:
	:type GT: TopOpeBRepTool_GeomTool &
	:rtype: None
") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool (const TopOpeBRepTool_GeomTool & GT);
		%feature("autodoc", "	:rtype: TopOpeBRepTool_GeomTool
") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_GeomTool
") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool ();
		%feature("autodoc", "	:param GT:
	:type GT: TopOpeBRepTool_GeomTool &
	:rtype: None
") SetGeomTool;
		void SetGeomTool (const TopOpeBRepTool_GeomTool & GT);
		%feature("autodoc", "	* Approximates curves. Returns False in the case of failure

	:param min:
	:type min: float
	:param max:
	:type max: float
	:param C3D:
	:type C3D: Handle_Geom_Curve &
	:param PC1:
	:type PC1: Handle_Geom2d_Curve &
	:param PC2:
	:type PC2: Handle_Geom2d_Curve &
	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param C3DN:
	:type C3DN: Handle_Geom_Curve &
	:param PC1N:
	:type PC1N: Handle_Geom2d_Curve &
	:param PC2N:
	:type PC2N: Handle_Geom2d_Curve &
	:param Tol3d:
	:type Tol3d: float &
	:param Tol2d:
	:type Tol2d: float &
	:rtype: bool
") MakeCurves;
		Standard_Boolean MakeCurves (const Standard_Real min,const Standard_Real max,const Handle_Geom_Curve & C3D,const Handle_Geom2d_Curve & PC1,const Handle_Geom2d_Curve & PC2,const TopoDS_Shape & S1,const TopoDS_Shape & S2,Handle_Geom_Curve & C3DN,Handle_Geom2d_Curve & PC1N,Handle_Geom2d_Curve & PC2N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param P:
	:type P: TColgp_Array1OfPnt
	:rtype: Handle_Geom_Curve
") MakeBSpline1fromPnt;
		static Handle_Geom_Curve MakeBSpline1fromPnt (const TColgp_Array1OfPnt & P);
		%feature("autodoc", "	:param P:
	:type P: TColgp_Array1OfPnt2d
	:rtype: Handle_Geom2d_Curve
") MakeBSpline1fromPnt2d;
		static Handle_Geom2d_Curve MakeBSpline1fromPnt2d (const TColgp_Array1OfPnt2d & P);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: bool
") IsProjectable;
		static Standard_Boolean IsProjectable (const TopoDS_Shape & S,const Handle_Geom_Curve & C);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param C:
	:type C: Handle_Geom_Curve &
	:param TolReached2d:
	:type TolReached2d: float &
	:param first: default value is 0.0
	:type first: float
	:param last: default value is 0.0
	:type last: float
	:rtype: Handle_Geom2d_Curve
") MakePCurveOnFace;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepTool_DataMapOfOrientedShapeC2DF &
	:rtype: None
") TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF (const TopOpeBRepTool_DataMapOfOrientedShapeC2DF & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepTool_DataMapOfOrientedShapeC2DF &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepTool_DataMapOfOrientedShapeC2DF & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_C2DF
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepTool_DataMapOfShapeListOfC2DF &
	:rtype: None
") TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF (const TopOpeBRepTool_DataMapOfShapeListOfC2DF & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepTool_DataMapOfShapeListOfC2DF &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepTool_DataMapOfShapeListOfC2DF & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_ListOfC2DF
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepTool_DataMapOfShapeface &
	:rtype: None
") TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface;
		 TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface (const TopOpeBRepTool_DataMapOfShapeface & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepTool_DataMapOfShapeface &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepTool_DataMapOfShapeface & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_face
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepTool_C2DF &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF;
		 TopOpeBRepTool_DataMapNodeOfDataMapOfOrientedShapeC2DF (const TopoDS_Shape & K,const TopOpeBRepTool_C2DF & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_C2DF
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepTool_ListOfC2DF &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF;
		 TopOpeBRepTool_DataMapNodeOfDataMapOfShapeListOfC2DF (const TopoDS_Shape & K,const TopOpeBRepTool_ListOfC2DF & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_ListOfC2DF
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepTool_face &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface;
		 TopOpeBRepTool_DataMapNodeOfDataMapOfShapeface (const TopoDS_Shape & K,const TopOpeBRepTool_face & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_face
") Value;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopOpeBRepTool_DataMapOfOrientedShapeC2DF;
		 TopOpeBRepTool_DataMapOfOrientedShapeC2DF (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_DataMapOfOrientedShapeC2DF &
	:rtype: TopOpeBRepTool_DataMapOfOrientedShapeC2DF
") Assign;
		TopOpeBRepTool_DataMapOfOrientedShapeC2DF & Assign (const TopOpeBRepTool_DataMapOfOrientedShapeC2DF & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_DataMapOfOrientedShapeC2DF &
	:rtype: TopOpeBRepTool_DataMapOfOrientedShapeC2DF
") operator=;
		TopOpeBRepTool_DataMapOfOrientedShapeC2DF & operator = (const TopOpeBRepTool_DataMapOfOrientedShapeC2DF & Other);
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
	:type I: TopOpeBRepTool_C2DF &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopOpeBRepTool_C2DF & I);
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
	:rtype: TopOpeBRepTool_C2DF
") Find;
		const TopOpeBRepTool_C2DF & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepTool_C2DF
") ChangeFind;
		TopOpeBRepTool_C2DF & ChangeFind (const TopoDS_Shape & K);
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopOpeBRepTool_DataMapOfShapeListOfC2DF;
		 TopOpeBRepTool_DataMapOfShapeListOfC2DF (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_DataMapOfShapeListOfC2DF &
	:rtype: TopOpeBRepTool_DataMapOfShapeListOfC2DF
") Assign;
		TopOpeBRepTool_DataMapOfShapeListOfC2DF & Assign (const TopOpeBRepTool_DataMapOfShapeListOfC2DF & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_DataMapOfShapeListOfC2DF &
	:rtype: TopOpeBRepTool_DataMapOfShapeListOfC2DF
") operator=;
		TopOpeBRepTool_DataMapOfShapeListOfC2DF & operator = (const TopOpeBRepTool_DataMapOfShapeListOfC2DF & Other);
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
	:type I: TopOpeBRepTool_ListOfC2DF &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopOpeBRepTool_ListOfC2DF & I);
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
	:rtype: TopOpeBRepTool_ListOfC2DF
") Find;
		const TopOpeBRepTool_ListOfC2DF & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepTool_ListOfC2DF
") ChangeFind;
		TopOpeBRepTool_ListOfC2DF & ChangeFind (const TopoDS_Shape & K);
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopOpeBRepTool_DataMapOfShapeface;
		 TopOpeBRepTool_DataMapOfShapeface (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_DataMapOfShapeface &
	:rtype: TopOpeBRepTool_DataMapOfShapeface
") Assign;
		TopOpeBRepTool_DataMapOfShapeface & Assign (const TopOpeBRepTool_DataMapOfShapeface & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_DataMapOfShapeface &
	:rtype: TopOpeBRepTool_DataMapOfShapeface
") operator=;
		TopOpeBRepTool_DataMapOfShapeface & operator = (const TopOpeBRepTool_DataMapOfShapeface & Other);
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
	:type I: TopOpeBRepTool_face &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopOpeBRepTool_face & I);
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
	:rtype: TopOpeBRepTool_face
") Find;
		const TopOpeBRepTool_face & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepTool_face
") ChangeFind;
		TopOpeBRepTool_face & ChangeFind (const TopoDS_Shape & K);
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
		%feature("autodoc", "	* Initialise members and build construction of map of ancestors.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param PerformNow: default value is Standard_False
	:type PerformNow: bool
	:rtype: None
") TopOpeBRepTool_FuseEdges;
		 TopOpeBRepTool_FuseEdges (const TopoDS_Shape & theShape,const Standard_Boolean PerformNow = Standard_False);
		%feature("autodoc", "	* set edges to avoid being fused

	:param theMapEdg:
	:type theMapEdg: TopTools_IndexedMapOfShape &
	:rtype: None
") AvoidEdges;
		void AvoidEdges (const TopTools_IndexedMapOfShape & theMapEdg);
		%feature("autodoc", "	* returns all the list of edges to be fused each list of the map represent a set of connex edges that can be fused.

	:param theMapLstEdg:
	:type theMapLstEdg: TopTools_DataMapOfIntegerListOfShape &
	:rtype: None
") Edges;
		void Edges (TopTools_DataMapOfIntegerListOfShape & theMapLstEdg);
		%feature("autodoc", "	* returns all the fused edges. each integer entry in the map corresponds to the integer in the DataMapOfIntegerListOfShape we get in method Edges. That is to say, to the list of edges in theMapLstEdg(i) corresponds the resulting edge theMapEdge(i)

	:param theMapEdg:
	:type theMapEdg: TopTools_DataMapOfIntegerShape &
	:rtype: None
") ResultEdges;
		void ResultEdges (TopTools_DataMapOfIntegerShape & theMapEdg);
		%feature("autodoc", "	* returns the map of modified faces.

	:param theMapFac:
	:type theMapFac: TopTools_DataMapOfShapeShape &
	:rtype: None
") Faces;
		void Faces (TopTools_DataMapOfShapeShape & theMapFac);
		%feature("autodoc", "	* returns myShape modified with the list of internal edges removed from it.

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape  Shape ();
		%feature("autodoc", "	* returns the number of vertices candidate to be removed

	:rtype: int
") NbVertices;
		const Standard_Integer NbVertices ();
		%feature("autodoc", "	* Using map of list of connex edges, fuse each list to one edge and then update myShape

	:rtype: None
") Perform;
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
		%feature("autodoc", "	* Boolean flags <CompC3D>, <CompPC1>, <CompPC2> indicate whether the corresponding result curves <C3D>, <PC1>, <PC2> of MakeCurves method must or not be computed from an intersection line <L>. When the line <L> is a walking one, <TypeC3D> is the kind of the 3D curve <C3D> to compute : - BSPLINE1 to compute a BSpline of degree 1 on the walking points of <L>, - APPROX to build an approximation curve on the walking points of <L>.

	:param TypeC3D: default value is TopOpeBRepTool_BSPLINE1
	:type TypeC3D: TopOpeBRepTool_OutCurveType
	:param CompC3D: default value is Standard_True
	:type CompC3D: bool
	:param CompPC1: default value is Standard_True
	:type CompPC1: bool
	:param CompPC2: default value is Standard_True
	:type CompPC2: bool
	:rtype: None
") TopOpeBRepTool_GeomTool;
		 TopOpeBRepTool_GeomTool (const TopOpeBRepTool_OutCurveType TypeC3D = TopOpeBRepTool_BSPLINE1,const Standard_Boolean CompC3D = Standard_True,const Standard_Boolean CompPC1 = Standard_True,const Standard_Boolean CompPC2 = Standard_True);
		%feature("autodoc", "	:param TypeC3D:
	:type TypeC3D: TopOpeBRepTool_OutCurveType
	:param CompC3D:
	:type CompC3D: bool
	:param CompPC1:
	:type CompPC1: bool
	:param CompPC2:
	:type CompPC2: bool
	:rtype: None
") Define;
		void Define (const TopOpeBRepTool_OutCurveType TypeC3D,const Standard_Boolean CompC3D,const Standard_Boolean CompPC1,const Standard_Boolean CompPC2);
		%feature("autodoc", "	:param TypeC3D:
	:type TypeC3D: TopOpeBRepTool_OutCurveType
	:rtype: None
") Define;
		void Define (const TopOpeBRepTool_OutCurveType TypeC3D);
		%feature("autodoc", "	:param CompC3D:
	:type CompC3D: bool
	:rtype: None
") DefineCurves;
		void DefineCurves (const Standard_Boolean CompC3D);
		%feature("autodoc", "	:param CompPC1:
	:type CompPC1: bool
	:rtype: None
") DefinePCurves1;
		void DefinePCurves1 (const Standard_Boolean CompPC1);
		%feature("autodoc", "	:param CompPC2:
	:type CompPC2: bool
	:rtype: None
") DefinePCurves2;
		void DefinePCurves2 (const Standard_Boolean CompPC2);
		%feature("autodoc", "	:param GT:
	:type GT: TopOpeBRepTool_GeomTool &
	:rtype: None
") Define;
		void Define (const TopOpeBRepTool_GeomTool & GT);
		%feature("autodoc", "	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") GetTolerances;
		void GetTolerances (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real tol3d,const Standard_Real tol2d);
		%feature("autodoc", "	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:param relative:
	:type relative: bool
	:rtype: None
") GetTolerances;
		void GetTolerances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean & relative);
		%feature("autodoc", "	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:param relative:
	:type relative: bool
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real tol3d,const Standard_Real tol2d,const Standard_Boolean relative);
		%feature("autodoc", "	:rtype: int
") NbPntMax;
		Standard_Integer NbPntMax ();
		%feature("autodoc", "	:param NbPntMax:
	:type NbPntMax: Standard_Integer
	:rtype: None
") SetNbPntMax;
		void SetNbPntMax (const Standard_Integer NbPntMax);
		%feature("autodoc", "	:rtype: TopOpeBRepTool_OutCurveType
") TypeC3D;
		TopOpeBRepTool_OutCurveType TypeC3D ();
		%feature("autodoc", "	:rtype: bool
") CompC3D;
		Standard_Boolean CompC3D ();
		%feature("autodoc", "	:rtype: bool
") CompPC1;
		Standard_Boolean CompPC1 ();
		%feature("autodoc", "	:rtype: bool
") CompPC2;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_HBoxTool;
		 TopOpeBRepTool_HBoxTool ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None
") AddBoxes;
		void AddBoxes (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") AddBox;
		void AddBox (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") ComputeBox;
		static void ComputeBox (const TopoDS_Shape & S,Bnd_Box & B);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") ComputeBoxOnVertices;
		static void ComputeBoxOnVertices (const TopoDS_Shape & S,Bnd_Box & B);
		%feature("autodoc", "	:param B:
	:type B: Bnd_Box &
	:rtype: void
") DumpB;
		static void DumpB (const Bnd_Box & B);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box (const TopoDS_Shape & S);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box (const Standard_Integer I);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") HasBox;
		Standard_Boolean HasBox (const TopoDS_Shape & S);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer I);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_IndexedDataMapOfShapeBox
") ChangeIMS;
		TopOpeBRepTool_IndexedDataMapOfShapeBox & ChangeIMS ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_IndexedDataMapOfShapeBox
") IMS;
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
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: Standard_Integer
	:param I:
	:type I: Bnd_Box &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox;
		 TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox (const TopoDS_Shape & K1,const Standard_Integer K2,const Bnd_Box & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "	:rtype: Bnd_Box
") Value;
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
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: Standard_Integer
	:param I:
	:type I: Bnd_Box2d &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d;
		 TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeBox2d (const TopoDS_Shape & K1,const Standard_Integer K2,const Bnd_Box2d & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "	:rtype: Bnd_Box2d
") Value;
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
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: Standard_Integer
	:param I:
	:type I: TopOpeBRepTool_connexity &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity;
		 TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfShapeconnexity (const TopoDS_Shape & K1,const Standard_Integer K2,const TopOpeBRepTool_connexity & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_connexity
") Value;
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
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: Standard_Integer
	:param I:
	:type I: BRepClass3d_SolidClassifier &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier;
		 TopOpeBRepTool_IndexedDataMapNodeOfIndexedDataMapOfSolidClassifier (const TopoDS_Shape & K1,const Standard_Integer K2,const BRepClass3d_SolidClassifier & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "	:rtype: BRepClass3d_SolidClassifier
") Value;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopOpeBRepTool_IndexedDataMapOfShapeBox;
		 TopOpeBRepTool_IndexedDataMapOfShapeBox (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_IndexedDataMapOfShapeBox &
	:rtype: TopOpeBRepTool_IndexedDataMapOfShapeBox
") Assign;
		TopOpeBRepTool_IndexedDataMapOfShapeBox & Assign (const TopOpeBRepTool_IndexedDataMapOfShapeBox & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_IndexedDataMapOfShapeBox &
	:rtype: TopOpeBRepTool_IndexedDataMapOfShapeBox
") operator=;
		TopOpeBRepTool_IndexedDataMapOfShapeBox & operator = (const TopOpeBRepTool_IndexedDataMapOfShapeBox & Other);
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
	:type I: Bnd_Box &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const Bnd_Box & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: Bnd_Box &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const Bnd_Box & T);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Bnd_Box
") FindFromIndex;
		const Bnd_Box & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Bnd_Box
") ChangeFromIndex;
		Bnd_Box & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Bnd_Box
") FindFromKey;
		const Bnd_Box & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Bnd_Box
") ChangeFromKey;
		Bnd_Box & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopOpeBRepTool_IndexedDataMapOfShapeBox2d;
		 TopOpeBRepTool_IndexedDataMapOfShapeBox2d (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_IndexedDataMapOfShapeBox2d &
	:rtype: TopOpeBRepTool_IndexedDataMapOfShapeBox2d
") Assign;
		TopOpeBRepTool_IndexedDataMapOfShapeBox2d & Assign (const TopOpeBRepTool_IndexedDataMapOfShapeBox2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_IndexedDataMapOfShapeBox2d &
	:rtype: TopOpeBRepTool_IndexedDataMapOfShapeBox2d
") operator=;
		TopOpeBRepTool_IndexedDataMapOfShapeBox2d & operator = (const TopOpeBRepTool_IndexedDataMapOfShapeBox2d & Other);
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
	:type I: Bnd_Box2d &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const Bnd_Box2d & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: Bnd_Box2d &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const Bnd_Box2d & T);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Bnd_Box2d
") FindFromIndex;
		const Bnd_Box2d & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Bnd_Box2d
") ChangeFromIndex;
		Bnd_Box2d & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Bnd_Box2d
") FindFromKey;
		const Bnd_Box2d & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Bnd_Box2d
") ChangeFromKey;
		Bnd_Box2d & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopOpeBRepTool_IndexedDataMapOfShapeconnexity;
		 TopOpeBRepTool_IndexedDataMapOfShapeconnexity (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_IndexedDataMapOfShapeconnexity &
	:rtype: TopOpeBRepTool_IndexedDataMapOfShapeconnexity
") Assign;
		TopOpeBRepTool_IndexedDataMapOfShapeconnexity & Assign (const TopOpeBRepTool_IndexedDataMapOfShapeconnexity & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_IndexedDataMapOfShapeconnexity &
	:rtype: TopOpeBRepTool_IndexedDataMapOfShapeconnexity
") operator=;
		TopOpeBRepTool_IndexedDataMapOfShapeconnexity & operator = (const TopOpeBRepTool_IndexedDataMapOfShapeconnexity & Other);
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
	:type I: TopOpeBRepTool_connexity &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopOpeBRepTool_connexity & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: TopOpeBRepTool_connexity &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopOpeBRepTool_connexity & T);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRepTool_connexity
") FindFromIndex;
		const TopOpeBRepTool_connexity & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRepTool_connexity
") ChangeFromIndex;
		TopOpeBRepTool_connexity & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepTool_connexity
") FindFromKey;
		const TopOpeBRepTool_connexity & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepTool_connexity
") ChangeFromKey;
		TopOpeBRepTool_connexity & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopOpeBRepTool_IndexedDataMapOfSolidClassifier;
		 TopOpeBRepTool_IndexedDataMapOfSolidClassifier (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_IndexedDataMapOfSolidClassifier &
	:rtype: TopOpeBRepTool_IndexedDataMapOfSolidClassifier
") Assign;
		TopOpeBRepTool_IndexedDataMapOfSolidClassifier & Assign (const TopOpeBRepTool_IndexedDataMapOfSolidClassifier & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_IndexedDataMapOfSolidClassifier &
	:rtype: TopOpeBRepTool_IndexedDataMapOfSolidClassifier
") operator=;
		TopOpeBRepTool_IndexedDataMapOfSolidClassifier & operator = (const TopOpeBRepTool_IndexedDataMapOfSolidClassifier & Other);
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
	:type I: BRepClass3d_SolidClassifier &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const BRepClass3d_SolidClassifier & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: BRepClass3d_SolidClassifier &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const BRepClass3d_SolidClassifier & T);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: BRepClass3d_SolidClassifier
") FindFromIndex;
		const BRepClass3d_SolidClassifier & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: BRepClass3d_SolidClassifier
") ChangeFromIndex;
		BRepClass3d_SolidClassifier & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepClass3d_SolidClassifier
") FindFromKey;
		const BRepClass3d_SolidClassifier & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepClass3d_SolidClassifier
") ChangeFromKey;
		BRepClass3d_SolidClassifier & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_ListIteratorOfListOfC2DF;
		 TopOpeBRepTool_ListIteratorOfListOfC2DF ();
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepTool_ListOfC2DF &
	:rtype: None
") TopOpeBRepTool_ListIteratorOfListOfC2DF;
		 TopOpeBRepTool_ListIteratorOfListOfC2DF (const TopOpeBRepTool_ListOfC2DF & L);
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepTool_ListOfC2DF &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepTool_ListOfC2DF & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_C2DF
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepTool_C2DF &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepTool_ListNodeOfListOfC2DF;
		 TopOpeBRepTool_ListNodeOfListOfC2DF (const TopOpeBRepTool_C2DF & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopOpeBRepTool_C2DF
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_ListOfC2DF;
		 TopOpeBRepTool_ListOfC2DF ();
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_ListOfC2DF &
	:rtype: None
") Assign;
		void Assign (const TopOpeBRepTool_ListOfC2DF & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_ListOfC2DF &
	:rtype: None
") operator=;
		void operator = (const TopOpeBRepTool_ListOfC2DF & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepTool_C2DF &
	:rtype: None
") Prepend;
		void Prepend (const TopOpeBRepTool_C2DF & I);
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepTool_C2DF &
	:param theIt:
	:type theIt: TopOpeBRepTool_ListIteratorOfListOfC2DF &
	:rtype: None
") Prepend;
		void Prepend (const TopOpeBRepTool_C2DF & I,TopOpeBRepTool_ListIteratorOfListOfC2DF & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_ListOfC2DF &
	:rtype: None
") Prepend;
		void Prepend (TopOpeBRepTool_ListOfC2DF & Other);
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepTool_C2DF &
	:rtype: None
") Append;
		void Append (const TopOpeBRepTool_C2DF & I);
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepTool_C2DF &
	:param theIt:
	:type theIt: TopOpeBRepTool_ListIteratorOfListOfC2DF &
	:rtype: None
") Append;
		void Append (const TopOpeBRepTool_C2DF & I,TopOpeBRepTool_ListIteratorOfListOfC2DF & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_ListOfC2DF &
	:rtype: None
") Append;
		void Append (TopOpeBRepTool_ListOfC2DF & Other);
		%feature("autodoc", "	:rtype: TopOpeBRepTool_C2DF
") First;
		TopOpeBRepTool_C2DF & First ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_C2DF
") Last;
		TopOpeBRepTool_C2DF & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: TopOpeBRepTool_ListIteratorOfListOfC2DF &
	:rtype: None
") Remove;
		void Remove (TopOpeBRepTool_ListIteratorOfListOfC2DF & It);
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepTool_C2DF &
	:param It:
	:type It: TopOpeBRepTool_ListIteratorOfListOfC2DF &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopOpeBRepTool_C2DF & I,TopOpeBRepTool_ListIteratorOfListOfC2DF & It);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_ListOfC2DF &
	:param It:
	:type It: TopOpeBRepTool_ListIteratorOfListOfC2DF &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopOpeBRepTool_ListOfC2DF & Other,TopOpeBRepTool_ListIteratorOfListOfC2DF & It);
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepTool_C2DF &
	:param It:
	:type It: TopOpeBRepTool_ListIteratorOfListOfC2DF &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopOpeBRepTool_C2DF & I,TopOpeBRepTool_ListIteratorOfListOfC2DF & It);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepTool_ListOfC2DF &
	:param It:
	:type It: TopOpeBRepTool_ListIteratorOfListOfC2DF &
	:rtype: None
") InsertAfter;
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
		%feature("autodoc", "	* Initialize members and begin exploration of shape depending of the value of PerformNow

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") TopOpeBRepTool_PurgeInternalEdges;
		 TopOpeBRepTool_PurgeInternalEdges (const TopoDS_Shape & theShape,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "	* returns the list internal edges associated with the faces of the myShape. If PerformNow was False when created, then call the private Perform method that do the main job.

	:param theMapFacLstEdg:
	:type theMapFacLstEdg: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") Faces;
		void Faces (TopTools_DataMapOfShapeListOfShape & theMapFacLstEdg);
		%feature("autodoc", "	* returns myShape modified with the list of internal edges removed from it.

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape  Shape ();
		%feature("autodoc", "	* returns the number of edges candidate to be removed

	:rtype: int
") NbEdges;
		const Standard_Integer NbEdges ();
		%feature("autodoc", "	* returns False if the list of internal edges has not been extracted

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Using the list of internal edge from each face, rebuild myShape by removing thoses edges.

	:rtype: None
") Perform;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_REGUS;
		 TopOpeBRepTool_REGUS ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") S;
		const TopoDS_Shape  S ();
		%feature("autodoc", "	:rtype: bool
") MapS;
		Standard_Boolean MapS ();
		%feature("autodoc", "	:param Fanc:
	:type Fanc: TopoDS_Face &
	:param nWs:
	:type nWs: TopTools_ListOfShape &
	:param nFs:
	:type nFs: TopTools_ListOfShape &
	:rtype: bool
") WireToFace;
		static Standard_Boolean WireToFace (const TopoDS_Face & Fanc,const TopTools_ListOfShape & nWs,TopTools_ListOfShape & nFs);
		%feature("autodoc", "	:param Fanc:
	:type Fanc: TopoDS_Face &
	:param FSplits:
	:type FSplits: TopTools_ListOfShape &
	:rtype: bool
") SplitF;
		static Standard_Boolean SplitF (const TopoDS_Face & Fanc,TopTools_ListOfShape & FSplits);
		%feature("autodoc", "	:rtype: bool
") SplitFaces;
		Standard_Boolean SplitFaces ();
		%feature("autodoc", "	:rtype: bool
") REGU;
		Standard_Boolean REGU ();
		%feature("autodoc", "	:param Fsplits:
	:type Fsplits: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") SetFsplits;
		void SetFsplits (TopTools_DataMapOfShapeListOfShape & Fsplits);
		%feature("autodoc", "	:param Fsplits:
	:type Fsplits: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") GetFsplits;
		void GetFsplits (TopTools_DataMapOfShapeListOfShape & Fsplits);
		%feature("autodoc", "	:param OshNsh:
	:type OshNsh: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") SetOshNsh;
		void SetOshNsh (TopTools_DataMapOfShapeListOfShape & OshNsh);
		%feature("autodoc", "	:param OshNsh:
	:type OshNsh: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") GetOshNsh;
		void GetOshNsh (TopTools_DataMapOfShapeListOfShape & OshNsh);
		%feature("autodoc", "	:rtype: bool
") InitBlock;
		Standard_Boolean InitBlock ();
		%feature("autodoc", "	:rtype: bool
") NextinBlock;
		Standard_Boolean NextinBlock ();
		%feature("autodoc", "	:param e:
	:type e: TopoDS_Edge &
	:param lof:
	:type lof: TopTools_ListOfShape &
	:param ffound:
	:type ffound: TopoDS_Face &
	:rtype: bool
") NearestF;
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
		%feature("autodoc", "	:param FRef:
	:type FRef: TopoDS_Face &
	:rtype: None
") TopOpeBRepTool_REGUW;
		 TopOpeBRepTool_REGUW (const TopoDS_Face & FRef);
		%feature("autodoc", "	:rtype: TopoDS_Face
") Fref;
		const TopoDS_Face  Fref ();
		%feature("autodoc", "	:param Esplits:
	:type Esplits: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") SetEsplits;
		void SetEsplits (TopTools_DataMapOfShapeListOfShape & Esplits);
		%feature("autodoc", "	:param Esplits:
	:type Esplits: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") GetEsplits;
		void GetEsplits (TopTools_DataMapOfShapeListOfShape & Esplits);
		%feature("autodoc", "	:param OwNw:
	:type OwNw: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") SetOwNw;
		void SetOwNw (TopTools_DataMapOfShapeListOfShape & OwNw);
		%feature("autodoc", "	:param OwNw:
	:type OwNw: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") GetOwNw;
		void GetOwNw (TopTools_DataMapOfShapeListOfShape & OwNw);
		%feature("autodoc", "	:rtype: bool
") SplitEds;
		Standard_Boolean SplitEds ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") S;
		const TopoDS_Shape  S ();
		%feature("autodoc", "	:rtype: bool
") HasInit;
		Standard_Boolean HasInit ();
		%feature("autodoc", "	:rtype: bool
") MapS;
		Standard_Boolean MapS ();
		%feature("autodoc", "	:param istep:
	:type istep: Standard_Integer
	:param Scur:
	:type Scur: TopoDS_Shape &
	:param Splits:
	:type Splits: TopTools_ListOfShape &
	:rtype: bool
") REGU;
		Standard_Boolean REGU (const Standard_Integer istep,const TopoDS_Shape & Scur,TopTools_ListOfShape & Splits);
		%feature("autodoc", "	:rtype: bool
") REGU;
		Standard_Boolean REGU ();
		%feature("autodoc", "	:param Splits:
	:type Splits: TopTools_ListOfShape &
	:rtype: bool
") GetSplits;
		Standard_Boolean GetSplits (TopTools_ListOfShape & Splits);
		%feature("autodoc", "	:rtype: bool
") InitBlock;
		Standard_Boolean InitBlock ();
		%feature("autodoc", "	:rtype: bool
") NextinBlock;
		Standard_Boolean NextinBlock ();
		%feature("autodoc", "	:param loe:
	:type loe: TopTools_ListOfShape &
	:param efound:
	:type efound: TopoDS_Edge &
	:rtype: bool
") NearestE;
		Standard_Boolean NearestE (const TopTools_ListOfShape & loe,TopoDS_Edge & efound);
		%feature("autodoc", "	:param v:
	:type v: TopoDS_Vertex &
	:param co:
	:type co: TopOpeBRepTool_connexity &
	:rtype: bool
") Connexity;
		Standard_Boolean Connexity (const TopoDS_Vertex & v,TopOpeBRepTool_connexity & co);
		%feature("autodoc", "	:param v:
	:type v: TopoDS_Vertex &
	:param OriKey:
	:type OriKey: Standard_Integer
	:param e:
	:type e: TopoDS_Edge &
	:rtype: bool
") AddNewConnexity;
		Standard_Boolean AddNewConnexity (const TopoDS_Vertex & v,const Standard_Integer OriKey,const TopoDS_Edge & e);
		%feature("autodoc", "	:param v:
	:type v: TopoDS_Vertex &
	:param OriKey:
	:type OriKey: Standard_Integer
	:param e:
	:type e: TopoDS_Edge &
	:rtype: bool
") RemoveOldConnexity;
		Standard_Boolean RemoveOldConnexity (const TopoDS_Vertex & v,const Standard_Integer OriKey,const TopoDS_Edge & e);
		%feature("autodoc", "	:param v:
	:type v: TopoDS_Vertex &
	:rtype: bool
") UpdateMultiple;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier ();
		%feature("autodoc", "	* SRef is the reference shape. StateShapeShape(S) calls will classify S with SRef.

	:param SRef:
	:type SRef: TopoDS_Shape &
	:rtype: None
") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier (const TopoDS_Shape & SRef);
		%feature("autodoc", "	* reset all internal data (SolidClassifier included)

	:rtype: None
") ClearAll;
		void ClearAll ();
		%feature("autodoc", "	* reset all internal data (except SolidClassified)

	:rtype: None
") ClearCurrent;
		void ClearCurrent ();
		%feature("autodoc", "	* Set SRef as reference shape the next StateShapeReference(S,AvoidS) calls will classify S with SRef.

	:param SRef:
	:type SRef: TopoDS_Shape &
	:rtype: None
") SetReference;
		void SetReference (const TopoDS_Shape & SRef);
		%feature("autodoc", "	* classify shape S compared with shape SRef. samedomain = 0 : S1,S2 are not same domain samedomain = 1 : S1,S2 are same domain

	:param S:
	:type S: TopoDS_Shape &
	:param SRef:
	:type SRef: TopoDS_Shape &
	:param samedomain: default value is 0
	:type samedomain: Standard_Integer
	:rtype: TopAbs_State
") StateShapeShape;
		TopAbs_State StateShapeShape (const TopoDS_Shape & S,const TopoDS_Shape & SRef,const Standard_Integer samedomain = 0);
		%feature("autodoc", "	:rtype: int
") SameDomain;
		Standard_Integer SameDomain ();
		%feature("autodoc", "	* set mode for next StateShapeShape call 	 samedomain = true --> S,Sref are same domain --> point 	 on restriction (ON S) is used to classify S. 	 samedomain = false --> S,Sref are not domain --> point 	 not on restriction of S (IN S) is used to classify S. 	 samedomain value is used only in next StateShapeShape call

	:param samedomain:
	:type samedomain: Standard_Integer
	:rtype: None
") SameDomain;
		void SameDomain (const Standard_Integer samedomain);
		%feature("autodoc", "	* classify shape S compared with shape SRef. AvoidS is not used in classification; AvoidS may be IsNull(). (usefull to avoid ON or UNKNOWN state in special cases)

	:param S:
	:type S: TopoDS_Shape &
	:param AvoidS:
	:type AvoidS: TopoDS_Shape &
	:param SRef:
	:type SRef: TopoDS_Shape &
	:rtype: TopAbs_State
") StateShapeShape;
		TopAbs_State StateShapeShape (const TopoDS_Shape & S,const TopoDS_Shape & AvoidS,const TopoDS_Shape & SRef);
		%feature("autodoc", "	* classify shape S compared with shape SRef. LAvoidS is list of S subshapes to avoid in classification AvoidS is not used in classification; AvoidS may be IsNull(). (usefull to avoid ON or UNKNOWN state in special cases)

	:param S:
	:type S: TopoDS_Shape &
	:param LAvoidS:
	:type LAvoidS: TopTools_ListOfShape &
	:param SRef:
	:type SRef: TopoDS_Shape &
	:rtype: TopAbs_State
") StateShapeShape;
		TopAbs_State StateShapeShape (const TopoDS_Shape & S,const TopTools_ListOfShape & LAvoidS,const TopoDS_Shape & SRef);
		%feature("autodoc", "	* classify shape S compared with reference shape. AvoidS is not used in classification; AvoidS may be IsNull(). (usefull to avoid ON or UNKNOWN state in special cases)

	:param S:
	:type S: TopoDS_Shape &
	:param AvoidS:
	:type AvoidS: TopoDS_Shape &
	:rtype: TopAbs_State
") StateShapeReference;
		TopAbs_State StateShapeReference (const TopoDS_Shape & S,const TopoDS_Shape & AvoidS);
		%feature("autodoc", "	* classify shape S compared with reference shape. LAvoidS is list of S subshapes to avoid in classification (usefull to avoid ON or UNKNOWN state in special cases)

	:param S:
	:type S: TopoDS_Shape &
	:param LAvoidS:
	:type LAvoidS: TopTools_ListOfShape &
	:rtype: TopAbs_State
") StateShapeReference;
		TopAbs_State StateShapeReference (const TopoDS_Shape & S,const TopTools_ListOfShape & LAvoidS);
		%feature("autodoc", "	:rtype: TopOpeBRepTool_SolidClassifier
") ChangeSolidClassifier;
		TopOpeBRepTool_SolidClassifier & ChangeSolidClassifier ();
		%feature("autodoc", "	* classify point P2D with myRef

	:param P2D:
	:type P2D: gp_Pnt2d
	:rtype: None
") StateP2DReference;
		void StateP2DReference (const gp_Pnt2d & P2D);
		%feature("autodoc", "	* classify point P3D with myRef

	:param P3D:
	:type P3D: gp_Pnt
	:rtype: None
") StateP3DReference;
		void StateP3DReference (const gp_Pnt & P3D);
		%feature("autodoc", "	* return field myState

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("autodoc", "	:rtype: gp_Pnt2d
") P2D;
		const gp_Pnt2d  P2D ();
		%feature("autodoc", "	:rtype: gp_Pnt
") P3D;
		const gp_Pnt  P3D ();
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
		%feature("autodoc", "	* Creates an empty explorer, becomes usefull after Init.

	:rtype: None
") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer ();
		%feature("autodoc", "	* Creates an Explorer on the Shape <S>.  <ToFind> is the type of shapes to search. TopAbs_VERTEX, TopAbs_EDGE, ...  <ToAvoid> is the type of shape to skip in the exploration. If <ToAvoid> is equal or less complex than <ToFind> or if <ToAVoid> is SHAPE it has no effect on the exploration.

	:param S:
	:type S: TopoDS_Shape &
	:param ToFind:
	:type ToFind: TopAbs_ShapeEnum
	:param ToAvoid: default value is TopAbs_SHAPE
	:type ToAvoid: TopAbs_ShapeEnum
	:rtype: None
") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer (const TopoDS_Shape & S,const TopAbs_ShapeEnum ToFind,const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param ToFind:
	:type ToFind: TopAbs_ShapeEnum
	:param ToAvoid: default value is TopAbs_SHAPE
	:type ToAvoid: TopAbs_ShapeEnum
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S,const TopAbs_ShapeEnum ToFind,const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);
		%feature("autodoc", "	* Returns True if there are more shapes in the exploration.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	* Moves to the next Shape in the exploration.

	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	* Returns the current shape in the exploration.

	:rtype: TopoDS_Shape
") Current;
		const TopoDS_Shape  Current ();
		%feature("autodoc", "	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "	:rtype: int
") Index;
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
		%feature("autodoc", "	* Returns the tolerance of the shape <S>. If the shape <S> is Null, returns 0.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: float
") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns 3D point of vertex <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: gp_Pnt
") Pnt;
		static gp_Pnt Pnt (const TopoDS_Shape & S);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: Handle_Geom_Curve
") BASISCURVE;
		static Handle_Geom_Curve BASISCURVE (const Handle_Geom_Curve & C);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: Handle_Geom_Curve
") BASISCURVE;
		static Handle_Geom_Curve BASISCURVE (const TopoDS_Edge & E);
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: Handle_Geom_Surface
") BASISSURFACE;
		static Handle_Geom_Surface BASISSURFACE (const Handle_Geom_Surface & S);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: Handle_Geom_Surface
") BASISSURFACE;
		static Handle_Geom_Surface BASISSURFACE (const TopoDS_Face & F);
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param UPeri:
	:type UPeri: bool
	:param VPeri:
	:type VPeri: bool
	:param Umin:
	:type Umin: float &
	:param Umax:
	:type Umax: float &
	:param Vmin:
	:type Vmin: float &
	:param Vmax:
	:type Vmax: float &
	:rtype: void
") UVBOUNDS;
		static void UVBOUNDS (const Handle_Geom_Surface & S,Standard_Boolean & UPeri,Standard_Boolean & VPeri,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param UPeri:
	:type UPeri: bool
	:param VPeri:
	:type VPeri: bool
	:param Umin:
	:type Umin: float &
	:param Umax:
	:type Umax: float &
	:param Vmin:
	:type Vmin: float &
	:param Vmax:
	:type Vmax: float &
	:rtype: void
") UVBOUNDS;
		static void UVBOUNDS (const TopoDS_Face & F,Standard_Boolean & UPeri,Standard_Boolean & VPeri,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* ajust u,v values in UVBounds of the domain of the geometric shape <S>, according to Uperiodicity and VPeriodicity of the domain. <S> is assumed to be a face. u and/or v is/are not modified when the domain is not periodic in U and/or V .

	:param S:
	:type S: TopoDS_Shape &
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:rtype: void
") AdjustOnPeriodic;
		static void AdjustOnPeriodic (const TopoDS_Shape & S,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* indicates wheter shape S1 is a closing shape on S2 or not.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: bool
") Closed;
		static Standard_Boolean Closed (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	:param par:
	:type par: float
	:param EE:
	:type EE: TopoDS_Shape &
	:param FF:
	:type FF: TopoDS_Shape &
	:rtype: float
") PeriodizeParameter;
		static Standard_Real PeriodizeParameter (const Standard_Real par,const TopoDS_Shape & EE,const TopoDS_Shape & FF);
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: bool
") ShapesSameOriented;
		static Standard_Boolean ShapesSameOriented (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	:param S1:
	:type S1: BRepAdaptor_Surface &
	:param S2:
	:type S2: BRepAdaptor_Surface &
	:rtype: bool
") SurfacesSameOriented;
		static Standard_Boolean SurfacesSameOriented (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2);
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Shape &
	:param F2:
	:type F2: TopoDS_Shape &
	:rtype: bool
") FacesSameOriented;
		static Standard_Boolean FacesSameOriented (const TopoDS_Shape & F1,const TopoDS_Shape & F2);
		%feature("autodoc", "	:param C1:
	:type C1: BRepAdaptor_Curve &
	:param C2:
	:type C2: BRepAdaptor_Curve &
	:rtype: bool
") CurvesSameOriented;
		static Standard_Boolean CurvesSameOriented (const BRepAdaptor_Curve & C1,const BRepAdaptor_Curve & C2);
		%feature("autodoc", "	:param E1:
	:type E1: TopoDS_Shape &
	:param E2:
	:type E2: TopoDS_Shape &
	:rtype: bool
") EdgesSameOriented;
		static Standard_Boolean EdgesSameOriented (const TopoDS_Shape & E1,const TopoDS_Shape & E2);
		%feature("autodoc", "	* Compute tangent T, normal N, curvature C at point of parameter P on curve BRAC. Returns the tolerance indicating if T,N are null.

	:param BRAC:
	:type BRAC: BRepAdaptor_Curve &
	:param P:
	:type P: float
	:param T:
	:type T: gp_Dir
	:param N:
	:type N: gp_Dir
	:param C:
	:type C: float &
	:rtype: float
") EdgeData;
		static Standard_Real EdgeData (const BRepAdaptor_Curve & BRAC,const Standard_Real P,gp_Dir & T,gp_Dir & N,Standard_Real &OutValue);
		%feature("autodoc", "	* Same as previous on edge E.

	:param E:
	:type E: TopoDS_Shape &
	:param P:
	:type P: float
	:param T:
	:type T: gp_Dir
	:param N:
	:type N: gp_Dir
	:param C:
	:type C: float &
	:rtype: float
") EdgeData;
		static Standard_Real EdgeData (const TopoDS_Shape & E,const Standard_Real P,gp_Dir & T,gp_Dir & N,Standard_Real &OutValue);
		%feature("autodoc", "	:param SU:
	:type SU: Handle_Geom_Surface &
	:param Tol2d:
	:type Tol2d: float
	:rtype: float
") Resolution3dU;
		static Standard_Real Resolution3dU (const Handle_Geom_Surface & SU,const Standard_Real Tol2d);
		%feature("autodoc", "	:param SU:
	:type SU: Handle_Geom_Surface &
	:param Tol2d:
	:type Tol2d: float
	:rtype: float
") Resolution3dV;
		static Standard_Real Resolution3dV (const Handle_Geom_Surface & SU,const Standard_Real Tol2d);
		%feature("autodoc", "	:param SU:
	:type SU: Handle_Geom_Surface &
	:param Tol2d:
	:type Tol2d: float
	:rtype: float
") Resolution3d;
		static Standard_Real Resolution3d (const Handle_Geom_Surface & SU,const Standard_Real Tol2d);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Tol2d:
	:type Tol2d: float
	:rtype: float
") Resolution3d;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_SolidClassifier;
		 TopOpeBRepTool_SolidClassifier ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Solid &
	:rtype: None
") LoadSolid;
		void LoadSolid (const TopoDS_Solid & S);
		%feature("autodoc", "	* compute the position of point <P> regarding with the geometric domain of the solid <S>.

	:param S:
	:type S: TopoDS_Solid &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: TopAbs_State
") Classify;
		TopAbs_State Classify (const TopoDS_Solid & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") LoadShell;
		void LoadShell (const TopoDS_Shell & S);
		%feature("autodoc", "	* compute the position of point <P> regarding with the geometric domain of the shell <S>.

	:param S:
	:type S: TopoDS_Shell &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: TopAbs_State
") Classify;
		TopAbs_State Classify (const TopoDS_Shell & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
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
		%feature("autodoc", "	:param sub:
	:type sub: TopoDS_Shape &
	:param S:
	:type S: TopoDS_Shape &
	:param checkclo: default value is Standard_False
	:type checkclo: bool
	:rtype: int
") OriinSor;
		static Standard_Integer OriinSor (const TopoDS_Shape & sub,const TopoDS_Shape & S,const Standard_Boolean checkclo = Standard_False);
		%feature("autodoc", "	:param sub:
	:type sub: TopoDS_Shape &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") OriinSorclosed;
		static Standard_Integer OriinSorclosed (const TopoDS_Shape & sub,const TopoDS_Shape & S);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param vclo:
	:type vclo: TopoDS_Vertex &
	:rtype: bool
") ClosedE;
		static Standard_Boolean ClosedE (const TopoDS_Edge & E,TopoDS_Vertex & vclo);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") ClosedS;
		static Standard_Boolean ClosedS (const TopoDS_Face & F);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") IsClosingE;
		static Standard_Boolean IsClosingE (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param W:
	:type W: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") IsClosingE;
		static Standard_Boolean IsClosingE (const TopoDS_Edge & E,const TopoDS_Shape & W,const TopoDS_Face & F);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param Vces:
	:type Vces: TopTools_Array1OfShape &
	:rtype: void
") Vertices;
		static void Vertices (const TopoDS_Edge & E,TopTools_Array1OfShape & Vces);
		%feature("autodoc", "	:param Iv:
	:type Iv: Standard_Integer
	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Vertex
") Vertex;
		static TopoDS_Vertex Vertex (const Standard_Integer Iv,const TopoDS_Edge & E);
		%feature("autodoc", "	:param Iv:
	:type Iv: Standard_Integer
	:param E:
	:type E: TopoDS_Edge &
	:rtype: float
") ParE;
		static Standard_Real ParE (const Standard_Integer Iv,const TopoDS_Edge & E);
		%feature("autodoc", "	:param par:
	:type par: float
	:param E:
	:type E: TopoDS_Edge &
	:rtype: int
") OnBoundary;
		static Standard_Integer OnBoundary (const Standard_Real par,const TopoDS_Edge & E);
		%feature("autodoc", "	:param par:
	:type par: float
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF &
	:rtype: gp_Pnt2d
") UVF;
		static gp_Pnt2d UVF (const Standard_Real par,const TopOpeBRepTool_C2DF & C2DF);
		%feature("autodoc", "	:param p2d:
	:type p2d: gp_Pnt2d
	:param e:
	:type e: TopoDS_Edge &
	:param f:
	:type f: TopoDS_Face &
	:param pare:
	:type pare: float &
	:rtype: bool
") ParISO;
		static Standard_Boolean ParISO (const gp_Pnt2d & p2d,const TopoDS_Edge & e,const TopoDS_Face & f,Standard_Real &OutValue);
		%feature("autodoc", "	:param p2d:
	:type p2d: gp_Pnt2d
	:param e:
	:type e: TopoDS_Edge &
	:param f:
	:type f: TopoDS_Face &
	:param par:
	:type par: float &
	:param dist:
	:type dist: float &
	:rtype: bool
") ParE2d;
		static Standard_Boolean ParE2d (const gp_Pnt2d & p2d,const TopoDS_Edge & e,const TopoDS_Face & f,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param f:
	:type f: TopoDS_Face &
	:param uv:
	:type uv: gp_Pnt2d
	:param dir:
	:type dir: gp_Vec
	:param factor:
	:type factor: float
	:param duv:
	:type duv: gp_Dir2d
	:rtype: bool
") Getduv;
		static Standard_Boolean Getduv (const TopoDS_Face & f,const gp_Pnt2d & uv,const gp_Vec & dir,const Standard_Real factor,gp_Dir2d & duv);
		%feature("autodoc", "	:param f:
	:type f: TopoDS_Face &
	:param e:
	:type e: TopoDS_Edge &
	:param par:
	:type par: float
	:param eps:
	:type eps: float
	:param uvapp:
	:type uvapp: gp_Pnt2d
	:rtype: bool
") uvApp;
		static Standard_Boolean uvApp (const TopoDS_Face & f,const TopoDS_Edge & e,const Standard_Real par,const Standard_Real eps,gp_Pnt2d & uvapp);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param tol3d:
	:type tol3d: float
	:rtype: float
") TolUV;
		static Standard_Real TolUV (const TopoDS_Face & F,const Standard_Real tol3d);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: float
") TolP;
		static Standard_Real TolP (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: float
") minDUV;
		static Standard_Real minDUV (const TopoDS_Face & F);
		%feature("autodoc", "	:param uv:
	:type uv: gp_Pnt2d
	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") outUVbounds;
		static Standard_Boolean outUVbounds (const gp_Pnt2d & uv,const TopoDS_Face & F);
		%feature("autodoc", "	:param uv:
	:type uv: gp_Pnt2d
	:param F:
	:type F: TopoDS_Face &
	:param onU:
	:type onU: Standard_Integer &
	:param onV:
	:type onV: Standard_Integer &
	:rtype: void
") stuvF;
		static void stuvF (const gp_Pnt2d & uv,const TopoDS_Face & F,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param par:
	:type par: float
	:param BC:
	:type BC: BRepAdaptor_Curve &
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool
") TggeomE;
		static Standard_Boolean TggeomE (const Standard_Real par,const BRepAdaptor_Curve & BC,gp_Vec & Tg);
		%feature("autodoc", "	:param par:
	:type par: float
	:param E:
	:type E: TopoDS_Edge &
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool
") TggeomE;
		static Standard_Boolean TggeomE (const Standard_Real par,const TopoDS_Edge & E,gp_Vec & Tg);
		%feature("autodoc", "	:param v:
	:type v: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param Tg:
	:type Tg: gp_Vec
	:param OvinE:
	:type OvinE: Standard_Integer &
	:rtype: bool
") TgINSIDE;
		static Standard_Boolean TgINSIDE (const TopoDS_Vertex & v,const TopoDS_Edge & E,gp_Vec & Tg,Standard_Integer &OutValue);
		%feature("autodoc", "	:param iv:
	:type iv: Standard_Integer
	:param E:
	:type E: TopoDS_Edge &
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF &
	:rtype: gp_Vec2d
") Tg2d;
		static gp_Vec2d Tg2d (const Standard_Integer iv,const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF);
		%feature("autodoc", "	:param iv:
	:type iv: Standard_Integer
	:param E:
	:type E: TopoDS_Edge &
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF &
	:param factor:
	:type factor: float
	:rtype: gp_Vec2d
") Tg2dApp;
		static gp_Vec2d Tg2dApp (const Standard_Integer iv,const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF,const Standard_Real factor);
		%feature("autodoc", "	:param iv:
	:type iv: Standard_Integer
	:param E:
	:type E: TopoDS_Edge &
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF &
	:param factor:
	:type factor: float
	:rtype: gp_Vec2d
") tryTg2dApp;
		static gp_Vec2d tryTg2dApp (const Standard_Integer iv,const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF,const Standard_Real factor);
		%feature("autodoc", "	:param uv:
	:type uv: gp_Pnt2d
	:param f:
	:type f: TopoDS_Face &
	:param par:
	:type par: float
	:param e:
	:type e: TopoDS_Edge &
	:param xx:
	:type xx: gp_Dir
	:rtype: bool
") XX;
		static Standard_Boolean XX (const gp_Pnt2d & uv,const TopoDS_Face & f,const Standard_Real par,const TopoDS_Edge & e,gp_Dir & xx);
		%feature("autodoc", "	:param uv:
	:type uv: gp_Pnt2d
	:param f:
	:type f: TopoDS_Face &
	:param normt:
	:type normt: gp_Dir
	:rtype: bool
") Nt;
		static Standard_Boolean Nt (const gp_Pnt2d & uv,const TopoDS_Face & f,gp_Dir & normt);
		%feature("autodoc", "	:param uv:
	:type uv: gp_Pnt2d
	:param F:
	:type F: TopoDS_Face &
	:param ng:
	:type ng: gp_Vec
	:rtype: bool
") NggeomF;
		static Standard_Boolean NggeomF (const gp_Pnt2d & uv,const TopoDS_Face & F,gp_Vec & ng);
		%feature("autodoc", "	:param par:
	:type par: float
	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param tola:
	:type tola: float
	:param ngApp:
	:type ngApp: gp_Dir
	:rtype: bool
") NgApp;
		static Standard_Boolean NgApp (const Standard_Real par,const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real tola,gp_Dir & ngApp);
		%feature("autodoc", "	:param par:
	:type par: float
	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param tola:
	:type tola: float
	:param ng:
	:type ng: gp_Dir
	:rtype: bool
") tryNgApp;
		static Standard_Boolean tryNgApp (const Standard_Real par,const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real tola,gp_Dir & ng);
		%feature("autodoc", "	:param par:
	:type par: float
	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: int
") tryOriEinF;
		static Standard_Integer tryOriEinF (const Standard_Real par,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") IsQuad;
		static Standard_Boolean IsQuad (const TopoDS_Edge & E);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") IsQuad;
		static Standard_Boolean IsQuad (const TopoDS_Face & F);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param par:
	:type par: float
	:param tg0:
	:type tg0: gp_Dir
	:param Curv:
	:type Curv: float &
	:rtype: bool
") CurvE;
		static Standard_Boolean CurvE (const TopoDS_Edge & E,const Standard_Real par,const gp_Dir & tg0,Standard_Real &OutValue);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param uv:
	:type uv: gp_Pnt2d
	:param tg0:
	:type tg0: gp_Dir
	:param Curv:
	:type Curv: float &
	:param direct:
	:type direct: bool
	:rtype: bool
") CurvF;
		static Standard_Boolean CurvF (const TopoDS_Face & F,const gp_Pnt2d & uv,const gp_Dir & tg0,Standard_Real &OutValue,Standard_Boolean & direct);
		%feature("autodoc", "	:param PC:
	:type PC: Handle_Geom2d_Curve &
	:param isou:
	:type isou: bool
	:param isov:
	:type isov: bool
	:param d2d:
	:type d2d: gp_Dir2d
	:param o2d:
	:type o2d: gp_Pnt2d
	:rtype: bool
") UVISO;
		static Standard_Boolean UVISO (const Handle_Geom2d_Curve & PC,Standard_Boolean & isou,Standard_Boolean & isov,gp_Dir2d & d2d,gp_Pnt2d & o2d);
		%feature("autodoc", "	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF &
	:param isou:
	:type isou: bool
	:param isov:
	:type isov: bool
	:param d2d:
	:type d2d: gp_Dir2d
	:param o2d:
	:type o2d: gp_Pnt2d
	:rtype: bool
") UVISO;
		static Standard_Boolean UVISO (const TopOpeBRepTool_C2DF & C2DF,Standard_Boolean & isou,Standard_Boolean & isov,gp_Dir2d & d2d,gp_Pnt2d & o2d);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param isou:
	:type isou: bool
	:param isov:
	:type isov: bool
	:param d2d:
	:type d2d: gp_Dir2d
	:param o2d:
	:type o2d: gp_Pnt2d
	:rtype: bool
") UVISO;
		static Standard_Boolean UVISO (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Boolean & isou,Standard_Boolean & isov,gp_Dir2d & d2d,gp_Pnt2d & o2d);
		%feature("autodoc", "	:param PC:
	:type PC: Handle_Geom2d_Curve &
	:param onU:
	:type onU: bool
	:param xfirst:
	:type xfirst: float
	:param xperiod:
	:type xperiod: float
	:param xtol:
	:type xtol: float
	:rtype: bool
") IsonCLO;
		static Standard_Boolean IsonCLO (const Handle_Geom2d_Curve & PC,const Standard_Boolean onU,const Standard_Real xfirst,const Standard_Real xperiod,const Standard_Real xtol);
		%feature("autodoc", "	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF &
	:param onU:
	:type onU: bool
	:param xfirst:
	:type xfirst: float
	:param xperiod:
	:type xperiod: float
	:param xtol:
	:type xtol: float
	:rtype: bool
") IsonCLO;
		static Standard_Boolean IsonCLO (const TopOpeBRepTool_C2DF & C2DF,const Standard_Boolean onU,const Standard_Real xfirst,const Standard_Real xperiod,const Standard_Real xtol);
		%feature("autodoc", "	:param t2d:
	:type t2d: gp_Vec2d
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF &
	:rtype: void
") TrslUV;
		static void TrslUV (const gp_Vec2d & t2d,TopOpeBRepTool_C2DF & C2DF);
		%feature("autodoc", "	:param t2d:
	:type t2d: gp_Vec2d
	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") TrslUVModifE;
		static Standard_Boolean TrslUVModifE (const gp_Vec2d & t2d,const TopoDS_Face & F,TopoDS_Edge & E);
		%feature("autodoc", "	:param d1:
	:type d1: gp_Vec
	:param d2:
	:type d2: gp_Vec
	:param ref:
	:type ref: gp_Vec
	:rtype: float
") Matter;
		static Standard_Real Matter (const gp_Vec & d1,const gp_Vec & d2,const gp_Vec & ref);
		%feature("autodoc", "	:param d1:
	:type d1: gp_Vec2d
	:param d2:
	:type d2: gp_Vec2d
	:rtype: float
") Matter;
		static Standard_Real Matter (const gp_Vec2d & d1,const gp_Vec2d & d2);
		%feature("autodoc", "	:param xx1:
	:type xx1: gp_Dir
	:param nt1:
	:type nt1: gp_Dir
	:param xx2:
	:type xx2: gp_Dir
	:param nt2:
	:type nt2: gp_Dir
	:param tola:
	:type tola: float
	:param Ang:
	:type Ang: float &
	:rtype: bool
") Matter;
		static Standard_Boolean Matter (const gp_Dir & xx1,const gp_Dir & nt1,const gp_Dir & xx2,const gp_Dir & nt2,const Standard_Real tola,Standard_Real &OutValue);
		%feature("autodoc", "	:param f1:
	:type f1: TopoDS_Face &
	:param f2:
	:type f2: TopoDS_Face &
	:param e:
	:type e: TopoDS_Edge &
	:param pare:
	:type pare: float
	:param tola:
	:type tola: float
	:param Ang:
	:type Ang: float &
	:rtype: bool
") Matter;
		static Standard_Boolean Matter (const TopoDS_Face & f1,const TopoDS_Face & f2,const TopoDS_Edge & e,const Standard_Real pare,const Standard_Real tola,Standard_Real &OutValue);
		%feature("autodoc", "	:param f1:
	:type f1: TopoDS_Face &
	:param f2:
	:type f2: TopoDS_Face &
	:param e:
	:type e: TopoDS_Edge &
	:param Ang:
	:type Ang: float &
	:rtype: bool
") MatterKPtg;
		static Standard_Boolean MatterKPtg (const TopoDS_Face & f1,const TopoDS_Face & f2,const TopoDS_Edge & e,Standard_Real &OutValue);
		%feature("autodoc", "	:param p:
	:type p: gp_Pnt
	:param f:
	:type f: TopoDS_Face &
	:param uv:
	:type uv: gp_Pnt2d
	:param st:
	:type st: TopAbs_State &
	:rtype: bool
") Getstp3dF;
		static Standard_Boolean Getstp3dF (const gp_Pnt & p,const TopoDS_Face & f,gp_Pnt2d & uv,TopAbs_State & st);
		%feature("autodoc", "	:param Eanc:
	:type Eanc: TopoDS_Edge &
	:param Splits:
	:type Splits: TopTools_ListOfShape &
	:rtype: bool
") SplitE;
		static Standard_Boolean SplitE (const TopoDS_Edge & Eanc,TopTools_ListOfShape & Splits);
		%feature("autodoc", "	:param lF:
	:type lF: TopTools_ListOfShape &
	:param She:
	:type She: TopoDS_Shape &
	:rtype: void
") MkShell;
		static void MkShell (const TopTools_ListOfShape & lF,TopoDS_Shape & She);
		%feature("autodoc", "	:param loS:
	:type loS: TopTools_ListOfShape &
	:param toremove:
	:type toremove: TopoDS_Shape &
	:rtype: bool
") Remove;
		static Standard_Boolean Remove (TopTools_ListOfShape & loS,const TopoDS_Shape & toremove);
		%feature("autodoc", "	:param Fref:
	:type Fref: TopoDS_Face &
	:param mapWlow:
	:type mapWlow: TopTools_DataMapOfShapeListOfShape &
	:param lFs:
	:type lFs: TopTools_ListOfShape &
	:rtype: bool
") WireToFace;
		static Standard_Boolean WireToFace (const TopoDS_Face & Fref,const TopTools_DataMapOfShapeListOfShape & mapWlow,TopTools_ListOfShape & lFs);
		%feature("autodoc", "	:param par:
	:type par: float
	:param ed:
	:type ed: TopoDS_Edge &
	:param uv:
	:type uv: gp_Pnt2d
	:param fa:
	:type fa: TopoDS_Face &
	:param isonfa:
	:type isonfa: bool
	:rtype: bool
") EdgeONFace;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity ();
		%feature("autodoc", "	:param Key:
	:type Key: TopoDS_Shape &
	:rtype: None
") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity (const TopoDS_Shape & Key);
		%feature("autodoc", "	:param Key:
	:type Key: TopoDS_Shape &
	:rtype: None
") SetKey;
		void SetKey (const TopoDS_Shape & Key);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:param OriKey:
	:type OriKey: Standard_Integer
	:param Item:
	:type Item: TopTools_ListOfShape &
	:rtype: int
") Item;
		Standard_Integer Item (const Standard_Integer OriKey,TopTools_ListOfShape & Item);
		%feature("autodoc", "	:param Item:
	:type Item: TopTools_ListOfShape &
	:rtype: int
") AllItems;
		Standard_Integer AllItems (TopTools_ListOfShape & Item);
		%feature("autodoc", "	:param OriKey:
	:type OriKey: Standard_Integer
	:param Item:
	:type Item: TopTools_ListOfShape &
	:rtype: None
") AddItem;
		void AddItem (const Standard_Integer OriKey,const TopTools_ListOfShape & Item);
		%feature("autodoc", "	:param OriKey:
	:type OriKey: Standard_Integer
	:param Item:
	:type Item: TopoDS_Shape &
	:rtype: None
") AddItem;
		void AddItem (const Standard_Integer OriKey,const TopoDS_Shape & Item);
		%feature("autodoc", "	:param OriKey:
	:type OriKey: Standard_Integer
	:param Item:
	:type Item: TopoDS_Shape &
	:rtype: bool
") RemoveItem;
		Standard_Boolean RemoveItem (const Standard_Integer OriKey,const TopoDS_Shape & Item);
		%feature("autodoc", "	:param Item:
	:type Item: TopoDS_Shape &
	:rtype: bool
") RemoveItem;
		Standard_Boolean RemoveItem (const TopoDS_Shape & Item);
		%feature("autodoc", "	:param OriKey:
	:type OriKey: Standard_Integer
	:rtype: TopTools_ListOfShape
") ChangeItem;
		TopTools_ListOfShape & ChangeItem (const Standard_Integer OriKey);
		%feature("autodoc", "	:rtype: bool
") IsMultiple;
		Standard_Boolean IsMultiple ();
		%feature("autodoc", "	:rtype: bool
") IsFaulty;
		Standard_Boolean IsFaulty ();
		%feature("autodoc", "	:param Item:
	:type Item: TopTools_ListOfShape &
	:rtype: int
") IsInternal;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_face;
		 TopOpeBRepTool_face ();
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Wire &
	:param Fref:
	:type Fref: TopoDS_Face &
	:rtype: bool
") Init;
		Standard_Boolean Init (const TopoDS_Wire & W,const TopoDS_Face & Fref);
		%feature("autodoc", "	:rtype: TopoDS_Wire
") W;
		const TopoDS_Wire  W ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: bool
") Finite;
		Standard_Boolean Finite ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") Ffinite;
		const TopoDS_Face  Ffinite ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") RealF;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRepTool_makeTransition;
		 TopOpeBRepTool_makeTransition ();
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param pbef:
	:type pbef: float
	:param paft:
	:type paft: float
	:param parE:
	:type parE: float
	:param FS:
	:type FS: TopoDS_Face &
	:param uv:
	:type uv: gp_Pnt2d
	:param factor:
	:type factor: float
	:rtype: bool
") Initialize;
		Standard_Boolean Initialize (const TopoDS_Edge & E,const Standard_Real pbef,const Standard_Real paft,const Standard_Real parE,const TopoDS_Face & FS,const gp_Pnt2d & uv,const Standard_Real factor);
		%feature("autodoc", "	:param factor:
	:type factor: float
	:rtype: None
") Setfactor;
		void Setfactor (const Standard_Real factor);
		%feature("autodoc", "	:rtype: float
") Getfactor;
		Standard_Real Getfactor ();
		%feature("autodoc", "	:rtype: bool
") IsT2d;
		Standard_Boolean IsT2d ();
		%feature("autodoc", "	:param ES:
	:type ES: TopoDS_Edge &
	:param parES:
	:type parES: float
	:rtype: bool
") SetRest;
		Standard_Boolean SetRest (const TopoDS_Edge & ES,const Standard_Real parES);
		%feature("autodoc", "	:rtype: bool
") HasRest;
		Standard_Boolean HasRest ();
		%feature("autodoc", "	:param stb:
	:type stb: TopAbs_State &
	:param sta:
	:type sta: TopAbs_State &
	:rtype: bool
") MkT2donE;
		Standard_Boolean MkT2donE (TopAbs_State & stb,TopAbs_State & sta);
		%feature("autodoc", "	:param stb:
	:type stb: TopAbs_State &
	:param sta:
	:type sta: TopAbs_State &
	:rtype: bool
") MkT3onE;
		Standard_Boolean MkT3onE (TopAbs_State & stb,TopAbs_State & sta);
		%feature("autodoc", "	:param stb:
	:type stb: TopAbs_State &
	:param sta:
	:type sta: TopAbs_State &
	:rtype: bool
") MkT3dproj;
		Standard_Boolean MkT3dproj (TopAbs_State & stb,TopAbs_State & sta);
		%feature("autodoc", "	:param stb:
	:type stb: TopAbs_State &
	:param sta:
	:type sta: TopAbs_State &
	:rtype: bool
") MkTonE;
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
