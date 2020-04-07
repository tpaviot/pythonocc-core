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
%define TOPOPEBREPTOOLDOCSTRING
"TopOpeBRepTool module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topopebreptool.html"
%enddef
%module (package="OCC.Core", docstring=TOPOPEBREPTOOLDOCSTRING) TopOpeBRepTool


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
#include<TopOpeBRepTool_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepClass3d_module.hxx>
#include<TopTools_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<Bnd_module.hxx>
#include<TColStd_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<TopExp_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<Extrema_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Bnd_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<Intf_module.hxx>
#include<IntSurf_module.hxx>
#include<Extrema_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepClass3d.i
%import TopTools.i
%import TopoDS.i
%import TopAbs.i
%import Bnd.i
%import TColStd.i
%import Geom2d.i
%import GeomAdaptor.i
%import Geom.i
%import TColgp.i
%import gp.i
%import TopExp.i
%import BRepAdaptor.i
%import TCollection.i
%import GeomAbs.i
%import Extrema.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TopOpeBRepTool_OutCurveType {
	TopOpeBRepTool_BSPLINE1 = 0,
	TopOpeBRepTool_APPROX = 1,
	TopOpeBRepTool_INTERPOL = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class TopOpeBRepTool_OutCurveType(IntEnum):
	TopOpeBRepTool_BSPLINE1 = 0
	TopOpeBRepTool_APPROX = 1
	TopOpeBRepTool_INTERPOL = 2
TopOpeBRepTool_BSPLINE1 = TopOpeBRepTool_OutCurveType.TopOpeBRepTool_BSPLINE1
TopOpeBRepTool_APPROX = TopOpeBRepTool_OutCurveType.TopOpeBRepTool_APPROX
TopOpeBRepTool_INTERPOL = TopOpeBRepTool_OutCurveType.TopOpeBRepTool_INTERPOL
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TopOpeBRepTool_HBoxTool)
/* end handles declaration */

/* templates */
%template(TopOpeBRepTool_DataMapOfOrientedShapeC2DF) NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_C2DF,TopTools_OrientedShapeMapHasher>;
%template(TopOpeBRepTool_DataMapOfShapeListOfC2DF) NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_ListOfC2DF,TopTools_ShapeMapHasher>;
%template(TopOpeBRepTool_DataMapOfShapeface) NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_face,TopTools_ShapeMapHasher>;
%template(TopOpeBRepTool_IndexedDataMapOfShapeBox) NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box,TopTools_OrientedShapeMapHasher>;
%template(TopOpeBRepTool_IndexedDataMapOfShapeBox2d) NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box2d,TopTools_OrientedShapeMapHasher>;
%template(TopOpeBRepTool_IndexedDataMapOfShapeconnexity) NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepTool_connexity,TopTools_ShapeMapHasher>;
%template(TopOpeBRepTool_ListIteratorOfListOfC2DF) NCollection_TListIterator<TopOpeBRepTool_C2DF>;
%template(TopOpeBRepTool_ListOfC2DF) NCollection_List<TopOpeBRepTool_C2DF>;

%extend NCollection_List<TopOpeBRepTool_C2DF> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_C2DF, TopTools_OrientedShapeMapHasher>::Iterator TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_ListOfC2DF, TopTools_ShapeMapHasher>::Iterator TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_face, TopTools_ShapeMapHasher>::Iterator TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_C2DF, TopTools_OrientedShapeMapHasher> TopOpeBRepTool_DataMapOfOrientedShapeC2DF;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_ListOfC2DF, TopTools_ShapeMapHasher> TopOpeBRepTool_DataMapOfShapeListOfC2DF;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_face, TopTools_ShapeMapHasher> TopOpeBRepTool_DataMapOfShapeface;
typedef NCollection_IndexedDataMap<TopoDS_Shape, Bnd_Box, TopTools_OrientedShapeMapHasher> TopOpeBRepTool_IndexedDataMapOfShapeBox;
typedef NCollection_IndexedDataMap<TopoDS_Shape, Bnd_Box2d, TopTools_OrientedShapeMapHasher> TopOpeBRepTool_IndexedDataMapOfShapeBox2d;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepTool_connexity, TopTools_ShapeMapHasher> TopOpeBRepTool_IndexedDataMapOfShapeconnexity;
typedef NCollection_List<TopOpeBRepTool_C2DF>::Iterator TopOpeBRepTool_ListIteratorOfListOfC2DF;
typedef NCollection_List<TopOpeBRepTool_C2DF> TopOpeBRepTool_ListOfC2DF;
typedef TopOpeBRepTool_ShapeClassifier * TopOpeBRepTool_PShapeClassifier;
typedef BRepClass3d_SolidClassifier * TopOpeBRepTool_PSoClassif;
typedef TopTools_ListOfShape * TopOpeBRepTool_Plos;
/* end typedefs declaration */

/***************
* class TOPKRO *
***************/
/***********************
* class TopOpeBRepTool *
***********************/
%rename(topopebreptool) TopOpeBRepTool;
class TopOpeBRepTool {
	public:
		/****************** CorrectONUVISO ******************/
		%feature("compactdefaultargs") CorrectONUVISO;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
Fsp: TopoDS_Face

Returns
-------
bool
") CorrectONUVISO;
		static Standard_Boolean CorrectONUVISO(const TopoDS_Face & F, TopoDS_Face & Fsp);

		/****************** MakeFaces ******************/
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", "Builds up the correct list of faces <loff> from <lof>, using faulty shapes from map <mshnok>. <lof> is the list of <f>'s descendant faces. returns false if building fails.

Parameters
----------
F: TopoDS_Face
LOF: TopTools_ListOfShape
MshNOK: TopTools_IndexedMapOfOrientedShape
LOFF: TopTools_ListOfShape

Returns
-------
bool
") MakeFaces;
		static Standard_Boolean MakeFaces(const TopoDS_Face & F, const TopTools_ListOfShape & LOF, const TopTools_IndexedMapOfOrientedShape & MshNOK, TopTools_ListOfShape & LOFF);

		/****************** PurgeClosingEdges ******************/
		%feature("compactdefaultargs") PurgeClosingEdges;
		%feature("autodoc", "Fuse edges (in a wire) of a shape where we have useless vertex. in case face <ff> is built on uv-non-connexed wires (with the two closing edges forward and reversed, in spite of one only), we find out the faulty edge, add the faulty shapes (edge,wire,face) to <mshnok>. <ff> is a face descendant of <f>. <mwisold>(wire) = 1 if wire is wire of <f> 0 wire results from <f>'s wire splitted. returns false if purge fails.

Parameters
----------
F: TopoDS_Face
FF: TopoDS_Face
MWisOld: TopTools_DataMapOfShapeInteger
MshNOK: TopTools_IndexedMapOfOrientedShape

Returns
-------
bool
") PurgeClosingEdges;
		static Standard_Boolean PurgeClosingEdges(const TopoDS_Face & F, const TopoDS_Face & FF, const TopTools_DataMapOfShapeInteger & MWisOld, TopTools_IndexedMapOfOrientedShape & MshNOK);

		/****************** PurgeClosingEdges ******************/
		%feature("compactdefaultargs") PurgeClosingEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
LOF: TopTools_ListOfShape
MWisOld: TopTools_DataMapOfShapeInteger
MshNOK: TopTools_IndexedMapOfOrientedShape

Returns
-------
bool
") PurgeClosingEdges;
		static Standard_Boolean PurgeClosingEdges(const TopoDS_Face & F, const TopTools_ListOfShape & LOF, const TopTools_DataMapOfShapeInteger & MWisOld, TopTools_IndexedMapOfOrientedShape & MshNOK);

		/****************** Regularize ******************/
		%feature("compactdefaultargs") Regularize;
		%feature("autodoc", "Returns <false> if the face is valid (the uv representation of the face is a set of pcurves connexed by points with connexity 2). else, splits <aface> in order to return a list of valid faces.

Parameters
----------
aFace: TopoDS_Face
aListOfFaces: TopTools_ListOfShape
ESplits: TopTools_DataMapOfShapeListOfShape

Returns
-------
bool
") Regularize;
		static Standard_Boolean Regularize(const TopoDS_Face & aFace, TopTools_ListOfShape & aListOfFaces, TopTools_DataMapOfShapeListOfShape & ESplits);

		/****************** RegularizeFace ******************/
		%feature("compactdefaultargs") RegularizeFace;
		%feature("autodoc", "Classify wire's splits of map <oldwiresnewwires> in order to compute <alistoffaces>, the splits of <aface>.

Parameters
----------
aFace: TopoDS_Face
OldWiresnewWires: TopTools_DataMapOfShapeListOfShape
aListOfFaces: TopTools_ListOfShape

Returns
-------
bool
") RegularizeFace;
		static Standard_Boolean RegularizeFace(const TopoDS_Face & aFace, const TopTools_DataMapOfShapeListOfShape & OldWiresnewWires, TopTools_ListOfShape & aListOfFaces);

		/****************** RegularizeShells ******************/
		%feature("compactdefaultargs") RegularizeShells;
		%feature("autodoc", "Returns <false> if the shell is valid (the solid is a set of faces connexed by edges with connexity 2). else, splits faces of the shell; <oldfacesnewfaces> describes (face, splits of face).

Parameters
----------
aSolid: TopoDS_Solid
OldSheNewShe: TopTools_DataMapOfShapeListOfShape
FSplits: TopTools_DataMapOfShapeListOfShape

Returns
-------
bool
") RegularizeShells;
		static Standard_Boolean RegularizeShells(const TopoDS_Solid & aSolid, TopTools_DataMapOfShapeListOfShape & OldSheNewShe, TopTools_DataMapOfShapeListOfShape & FSplits);

		/****************** RegularizeWires ******************/
		%feature("compactdefaultargs") RegularizeWires;
		%feature("autodoc", "Returns <false> if the face is valid (the uv representation of the face is a set of pcurves connexed by points with connexity 2). else, splits wires of the face, these are boundaries of the new faces to build up; <oldwiresnewwires> describes (wire, splits of wire); <esplits> describes (edge, edge's splits).

Parameters
----------
aFace: TopoDS_Face
OldWiresNewWires: TopTools_DataMapOfShapeListOfShape
ESplits: TopTools_DataMapOfShapeListOfShape

Returns
-------
bool
") RegularizeWires;
		static Standard_Boolean RegularizeWires(const TopoDS_Face & aFace, TopTools_DataMapOfShapeListOfShape & OldWiresNewWires, TopTools_DataMapOfShapeListOfShape & ESplits);

};


%extend TopOpeBRepTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepTool_AncestorsTool *
*************************************/
class TopOpeBRepTool_AncestorsTool {
	public:
		/****************** MakeAncestors ******************/
		%feature("compactdefaultargs") MakeAncestors;
		%feature("autodoc", "Same as package method topexp::mapshapelistofshapes().

Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum
M: TopTools_IndexedDataMapOfShapeListOfShape

Returns
-------
None
") MakeAncestors;
		static void MakeAncestors(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA, TopTools_IndexedDataMapOfShapeListOfShape & M);

};


%extend TopOpeBRepTool_AncestorsTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepTool_BoxSort *
*******************************/
class TopOpeBRepTool_BoxSort {
	public:
		/****************** TopOpeBRepTool_BoxSort ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_BoxSort;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort();

		/****************** TopOpeBRepTool_BoxSort ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_BoxSort;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: TopOpeBRepTool_HBoxTool

Returns
-------
None
") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort(const opencascade::handle<TopOpeBRepTool_HBoxTool> & T);

		/****************** AddBoxes ******************/
		%feature("compactdefaultargs") AddBoxes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") AddBoxes;
		void AddBoxes(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** AddBoxesMakeCOB ******************/
		%feature("compactdefaultargs") AddBoxesMakeCOB;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") AddBoxesMakeCOB;
		void AddBoxesMakeCOB(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
Bnd_Box
") Box;
		const Bnd_Box & Box(const TopoDS_Shape & S);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TColStd_ListIteratorOfListOfInteger
") Compare;
		const TColStd_ListIteratorOfListOfInteger & Compare(const TopoDS_Shape & S);

		/****************** HAB ******************/
		%feature("compactdefaultargs") HAB;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Bnd_HArray1OfBox>
") HAB;
		const opencascade::handle<Bnd_HArray1OfBox> & HAB();

		/****************** HABShape ******************/
		%feature("compactdefaultargs") HABShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") HABShape;
		const TopoDS_Shape HABShape(const Standard_Integer I);

		/****************** HBoxTool ******************/
		%feature("compactdefaultargs") HBoxTool;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepTool_HBoxTool>
") HBoxTool;
		const opencascade::handle<TopOpeBRepTool_HBoxTool> & HBoxTool();

		/****************** MakeCOB ******************/
		%feature("compactdefaultargs") MakeCOB;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") MakeCOB;
		void MakeCOB(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** MakeHAB ******************/
		%feature("compactdefaultargs") MakeHAB;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") MakeHAB;
		void MakeHAB(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** MakeHABCOB ******************/
		%feature("compactdefaultargs") MakeHABCOB;
		%feature("autodoc", "No available documentation.

Parameters
----------
HAB: Bnd_HArray1OfBox
COB: Bnd_Box

Returns
-------
None
") MakeHABCOB;
		static void MakeHABCOB(const opencascade::handle<Bnd_HArray1OfBox> & HAB, Bnd_Box & COB);

		/****************** SetHBoxTool ******************/
		%feature("compactdefaultargs") SetHBoxTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: TopOpeBRepTool_HBoxTool

Returns
-------
None
") SetHBoxTool;
		void SetHBoxTool(const opencascade::handle<TopOpeBRepTool_HBoxTool> & T);

		/****************** TouchedShape ******************/
		%feature("compactdefaultargs") TouchedShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TColStd_ListIteratorOfListOfInteger

Returns
-------
TopoDS_Shape
") TouchedShape;
		const TopoDS_Shape TouchedShape(const TColStd_ListIteratorOfListOfInteger & I);

};


%extend TopOpeBRepTool_BoxSort {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepTool_C2DF *
****************************/
class TopOpeBRepTool_C2DF {
	public:
		/****************** TopOpeBRepTool_C2DF ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_C2DF;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF();

		/****************** TopOpeBRepTool_C2DF ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_C2DF;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: Geom2d_Curve
f2d: float
l2d: float
tol: float
F: TopoDS_Face

Returns
-------
None
") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF(const opencascade::handle<Geom2d_Curve> & PC, const Standard_Real f2d, const Standard_Real l2d, const Standard_Real tol, const TopoDS_Face & F);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** IsFace ******************/
		%feature("compactdefaultargs") IsFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
bool
") IsFace;
		Standard_Boolean IsFace(const TopoDS_Face & F);

		/****************** IsPC ******************/
		%feature("compactdefaultargs") IsPC;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: Geom2d_Curve

Returns
-------
bool
") IsPC;
		Standard_Boolean IsPC(const opencascade::handle<Geom2d_Curve> & PC);

		/****************** PC ******************/
		%feature("compactdefaultargs") PC;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
f2d: float
l2d: float
tol: float
") PC;
		const opencascade::handle<Geom2d_Curve> & PC(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") SetFace;
		void SetFace(const TopoDS_Face & F);

		/****************** SetPC ******************/
		%feature("compactdefaultargs") SetPC;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: Geom2d_Curve
f2d: float
l2d: float
tol: float

Returns
-------
None
") SetPC;
		void SetPC(const opencascade::handle<Geom2d_Curve> & PC, const Standard_Real f2d, const Standard_Real l2d, const Standard_Real tol);

};


%extend TopOpeBRepTool_C2DF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopOpeBRepTool_CLASSI *
******************************/
class TopOpeBRepTool_CLASSI {
	public:
		/****************** TopOpeBRepTool_CLASSI ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CLASSI;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_CLASSI;
		 TopOpeBRepTool_CLASSI();

		/****************** Add2d ******************/
		%feature("compactdefaultargs") Add2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") Add2d;
		Standard_Boolean Add2d(const TopoDS_Shape & S);

		/****************** ClassiBnd2d ******************/
		%feature("compactdefaultargs") ClassiBnd2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
tol: float
checklarge: bool

Returns
-------
int
") ClassiBnd2d;
		Standard_Integer ClassiBnd2d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Standard_Real tol, const Standard_Boolean checklarge);

		/****************** Classilist ******************/
		%feature("compactdefaultargs") Classilist;
		%feature("autodoc", "No available documentation.

Parameters
----------
lS: TopTools_ListOfShape
mapgreasma: TopTools_DataMapOfShapeListOfShape

Returns
-------
bool
") Classilist;
		Standard_Boolean Classilist(const TopTools_ListOfShape & lS, TopTools_DataMapOfShapeListOfShape & mapgreasma);

		/****************** Classip2d ******************/
		%feature("compactdefaultargs") Classip2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
stabnd2d12: int

Returns
-------
int
") Classip2d;
		Standard_Integer Classip2d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Standard_Integer stabnd2d12);

		/****************** GetBox2d ******************/
		%feature("compactdefaultargs") GetBox2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Box2d: Bnd_Box2d

Returns
-------
bool
") GetBox2d;
		Standard_Boolean GetBox2d(const TopoDS_Shape & S, Bnd_Box2d & Box2d);

		/****************** Getface ******************/
		%feature("compactdefaultargs") Getface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
fa: TopOpeBRepTool_face

Returns
-------
bool
") Getface;
		Standard_Boolean Getface(const TopoDS_Shape & S, TopOpeBRepTool_face & fa);

		/****************** HasInit2d ******************/
		%feature("compactdefaultargs") HasInit2d;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasInit2d;
		Standard_Boolean HasInit2d();

		/****************** Init2d ******************/
		%feature("compactdefaultargs") Init2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Fref: TopoDS_Face

Returns
-------
None
") Init2d;
		void Init2d(const TopoDS_Face & Fref);

};


%extend TopOpeBRepTool_CLASSI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepTool_CORRISO *
*******************************/
class TopOpeBRepTool_CORRISO {
	public:
		/****************** TopOpeBRepTool_CORRISO ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CORRISO;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO();

		/****************** TopOpeBRepTool_CORRISO ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CORRISO;
		%feature("autodoc", "No available documentation.

Parameters
----------
FRef: TopoDS_Face

Returns
-------
None
") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO(const TopoDS_Face & FRef);

		/****************** AddNewConnexity ******************/
		%feature("compactdefaultargs") AddNewConnexity;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Returns
-------
bool
") AddNewConnexity;
		Standard_Boolean AddNewConnexity(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****************** Connexity ******************/
		%feature("compactdefaultargs") Connexity;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex
Eds: TopTools_ListOfShape

Returns
-------
bool
") Connexity;
		Standard_Boolean Connexity(const TopoDS_Vertex & V, TopTools_ListOfShape & Eds);

		/****************** EdgeOUTofBoundsUV ******************/
		%feature("compactdefaultargs") EdgeOUTofBoundsUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
onU: bool
tolx: float

Returns
-------
parspE: float
") EdgeOUTofBoundsUV;
		Standard_Integer EdgeOUTofBoundsUV(const TopoDS_Edge & E, const Standard_Boolean onU, const Standard_Real tolx, Standard_Real &OutValue);

		/****************** EdgeWithFaultyUV ******************/
		%feature("compactdefaultargs") EdgeWithFaultyUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
Ivfaulty: int
") EdgeWithFaultyUV;
		Standard_Boolean EdgeWithFaultyUV(const TopoDS_Edge & E, Standard_Integer &OutValue);

		/****************** EdgeWithFaultyUV ******************/
		%feature("compactdefaultargs") EdgeWithFaultyUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
EdsToCheck: TopTools_ListOfShape
nfybounds: int
fyE: TopoDS_Shape

Returns
-------
Ifaulty: int
") EdgeWithFaultyUV;
		Standard_Boolean EdgeWithFaultyUV(const TopTools_ListOfShape & EdsToCheck, const Standard_Integer nfybounds, TopoDS_Shape & fyE, Standard_Integer &OutValue);

		/****************** EdgesOUTofBoundsUV ******************/
		%feature("compactdefaultargs") EdgesOUTofBoundsUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
EdsToCheck: TopTools_ListOfShape
onU: bool
tolx: float
FyEds: TopTools_DataMapOfOrientedShapeInteger

Returns
-------
bool
") EdgesOUTofBoundsUV;
		Standard_Boolean EdgesOUTofBoundsUV(const TopTools_ListOfShape & EdsToCheck, const Standard_Boolean onU, const Standard_Real tolx, TopTools_DataMapOfOrientedShapeInteger & FyEds);

		/****************** EdgesWithFaultyUV ******************/
		%feature("compactdefaultargs") EdgesWithFaultyUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
EdsToCheck: TopTools_ListOfShape
nfybounds: int
FyEds: TopTools_DataMapOfOrientedShapeInteger
stopatfirst: bool,optional
	default value is Standard_False

Returns
-------
bool
") EdgesWithFaultyUV;
		Standard_Boolean EdgesWithFaultyUV(const TopTools_ListOfShape & EdsToCheck, const Standard_Integer nfybounds, TopTools_DataMapOfOrientedShapeInteger & FyEds, const Standard_Boolean stopatfirst = Standard_False);

		/****************** Eds ******************/
		%feature("compactdefaultargs") Eds;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") Eds;
		const TopTools_ListOfShape & Eds();

		/****************** Fref ******************/
		%feature("compactdefaultargs") Fref;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Fref;
		const TopoDS_Face Fref();

		/****************** GASref ******************/
		%feature("compactdefaultargs") GASref;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAdaptor_Surface
") GASref;
		const GeomAdaptor_Surface & GASref();

		/****************** GetnewS ******************/
		%feature("compactdefaultargs") GetnewS;
		%feature("autodoc", "No available documentation.

Parameters
----------
newS: TopoDS_Face

Returns
-------
bool
") GetnewS;
		Standard_Boolean GetnewS(TopoDS_Face & newS);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") Init;
		Standard_Boolean Init(const TopoDS_Shape & S);

		/****************** PurgeFyClosingE ******************/
		%feature("compactdefaultargs") PurgeFyClosingE;
		%feature("autodoc", "No available documentation.

Parameters
----------
ClEds: TopTools_ListOfShape
fyClEds: TopTools_ListOfShape

Returns
-------
bool
") PurgeFyClosingE;
		Standard_Boolean PurgeFyClosingE(const TopTools_ListOfShape & ClEds, TopTools_ListOfShape & fyClEds);

		/****************** Refclosed ******************/
		%feature("compactdefaultargs") Refclosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
x: int

Returns
-------
xperiod: float
") Refclosed;
		Standard_Boolean Refclosed(const Standard_Integer x, Standard_Real &OutValue);

		/****************** RemoveOldConnexity ******************/
		%feature("compactdefaultargs") RemoveOldConnexity;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Returns
-------
bool
") RemoveOldConnexity;
		Standard_Boolean RemoveOldConnexity(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****************** S ******************/
		%feature("compactdefaultargs") S;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") S;
		const TopoDS_Shape S();

		/****************** SetConnexity ******************/
		%feature("compactdefaultargs") SetConnexity;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex
Eds: TopTools_ListOfShape

Returns
-------
bool
") SetConnexity;
		Standard_Boolean SetConnexity(const TopoDS_Vertex & V, const TopTools_ListOfShape & Eds);

		/****************** SetUVRep ******************/
		%feature("compactdefaultargs") SetUVRep;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF

Returns
-------
bool
") SetUVRep;
		Standard_Boolean SetUVRep(const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF);

		/****************** Tol ******************/
		%feature("compactdefaultargs") Tol;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
tol3d: float

Returns
-------
float
") Tol;
		Standard_Real Tol(const Standard_Integer I, const Standard_Real tol3d);

		/****************** TrslUV ******************/
		%feature("compactdefaultargs") TrslUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
onU: bool
FyEds: TopTools_DataMapOfOrientedShapeInteger

Returns
-------
bool
") TrslUV;
		Standard_Boolean TrslUV(const Standard_Boolean onU, const TopTools_DataMapOfOrientedShapeInteger & FyEds);

		/****************** UVClosed ******************/
		%feature("compactdefaultargs") UVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") UVClosed;
		Standard_Boolean UVClosed();

		/****************** UVRep ******************/
		%feature("compactdefaultargs") UVRep;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF

Returns
-------
bool
") UVRep;
		Standard_Boolean UVRep(const TopoDS_Edge & E, TopOpeBRepTool_C2DF & C2DF);

};


%extend TopOpeBRepTool_CORRISO {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepTool_CurveTool *
*********************************/
class TopOpeBRepTool_CurveTool {
	public:
		/****************** TopOpeBRepTool_CurveTool ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CurveTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool();

		/****************** TopOpeBRepTool_CurveTool ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CurveTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
OCT: TopOpeBRepTool_OutCurveType

Returns
-------
None
") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool(const TopOpeBRepTool_OutCurveType OCT);

		/****************** TopOpeBRepTool_CurveTool ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CurveTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
GT: TopOpeBRepTool_GeomTool

Returns
-------
None
") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool(const TopOpeBRepTool_GeomTool & GT);

		/****************** ChangeGeomTool ******************/
		%feature("compactdefaultargs") ChangeGeomTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_GeomTool
") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool();

		/****************** GetGeomTool ******************/
		%feature("compactdefaultargs") GetGeomTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_GeomTool
") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool();

		/****************** IsProjectable ******************/
		%feature("compactdefaultargs") IsProjectable;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
C: Geom_Curve

Returns
-------
bool
") IsProjectable;
		static Standard_Boolean IsProjectable(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C);

		/****************** MakeBSpline1fromPnt ******************/
		%feature("compactdefaultargs") MakeBSpline1fromPnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TColgp_Array1OfPnt

Returns
-------
opencascade::handle<Geom_Curve>
") MakeBSpline1fromPnt;
		static opencascade::handle<Geom_Curve> MakeBSpline1fromPnt(const TColgp_Array1OfPnt & P);

		/****************** MakeBSpline1fromPnt2d ******************/
		%feature("compactdefaultargs") MakeBSpline1fromPnt2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TColgp_Array1OfPnt2d

Returns
-------
opencascade::handle<Geom2d_Curve>
") MakeBSpline1fromPnt2d;
		static opencascade::handle<Geom2d_Curve> MakeBSpline1fromPnt2d(const TColgp_Array1OfPnt2d & P);

		/****************** MakeCurves ******************/
		%feature("compactdefaultargs") MakeCurves;
		%feature("autodoc", "Approximates curves. returns false in the case of failure.

Parameters
----------
min: float
max: float
C3D: Geom_Curve
PC1: Geom2d_Curve
PC2: Geom2d_Curve
S1: TopoDS_Shape
S2: TopoDS_Shape
C3DN: Geom_Curve
PC1N: Geom2d_Curve
PC2N: Geom2d_Curve

Returns
-------
Tol3d: float
Tol2d: float
") MakeCurves;
		Standard_Boolean MakeCurves(const Standard_Real min, const Standard_Real max, const opencascade::handle<Geom_Curve> & C3D, const opencascade::handle<Geom2d_Curve> & PC1, const opencascade::handle<Geom2d_Curve> & PC2, const TopoDS_Shape & S1, const TopoDS_Shape & S2, opencascade::handle<Geom_Curve> & C3DN, opencascade::handle<Geom2d_Curve> & PC1N, opencascade::handle<Geom2d_Curve> & PC2N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** MakePCurveOnFace ******************/
		%feature("compactdefaultargs") MakePCurveOnFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
C: Geom_Curve
first: float,optional
	default value is 0.0
last: float,optional
	default value is 0.0

Returns
-------
TolReached2d: float
") MakePCurveOnFace;
		static opencascade::handle<Geom2d_Curve> MakePCurveOnFace(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C, Standard_Real &OutValue, const Standard_Real first = 0.0, const Standard_Real last = 0.0);

		/****************** SetGeomTool ******************/
		%feature("compactdefaultargs") SetGeomTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
GT: TopOpeBRepTool_GeomTool

Returns
-------
None
") SetGeomTool;
		void SetGeomTool(const TopOpeBRepTool_GeomTool & GT);

};


%extend TopOpeBRepTool_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepTool_FuseEdges *
*********************************/
class TopOpeBRepTool_FuseEdges {
	public:
		/****************** TopOpeBRepTool_FuseEdges ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_FuseEdges;
		%feature("autodoc", "Initialise members and build construction of map of ancestors.

Parameters
----------
theShape: TopoDS_Shape
PerformNow: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepTool_FuseEdges;
		 TopOpeBRepTool_FuseEdges(const TopoDS_Shape & theShape, const Standard_Boolean PerformNow = Standard_False);

		/****************** AvoidEdges ******************/
		%feature("compactdefaultargs") AvoidEdges;
		%feature("autodoc", "Set edges to avoid being fused.

Parameters
----------
theMapEdg: TopTools_IndexedMapOfShape

Returns
-------
None
") AvoidEdges;
		void AvoidEdges(const TopTools_IndexedMapOfShape & theMapEdg);

		/****************** Edges ******************/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Returns all the list of edges to be fused each list of the map represent a set of connex edges that can be fused.

Parameters
----------
theMapLstEdg: TopTools_DataMapOfIntegerListOfShape

Returns
-------
None
") Edges;
		void Edges(TopTools_DataMapOfIntegerListOfShape & theMapLstEdg);

		/****************** Faces ******************/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Returns the map of modified faces.

Parameters
----------
theMapFac: TopTools_DataMapOfShapeShape

Returns
-------
None
") Faces;
		void Faces(TopTools_DataMapOfShapeShape & theMapFac);

		/****************** NbVertices ******************/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Returns the number of vertices candidate to be removed.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Using map of list of connex edges, fuse each list to one edge and then update myshape.

Returns
-------
None
") Perform;
		void Perform();

		/****************** ResultEdges ******************/
		%feature("compactdefaultargs") ResultEdges;
		%feature("autodoc", "Returns all the fused edges. each integer entry in the map corresponds to the integer in the datamapofintegerlistofshape we get in method edges. that is to say, to the list of edges in themaplstedg(i) corresponds the resulting edge themapedge(i).

Parameters
----------
theMapEdg: TopTools_DataMapOfIntegerShape

Returns
-------
None
") ResultEdges;
		void ResultEdges(TopTools_DataMapOfIntegerShape & theMapEdg);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns myshape modified with the list of internal edges removed from it.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

};


%extend TopOpeBRepTool_FuseEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepTool_GeomTool *
********************************/
class TopOpeBRepTool_GeomTool {
	public:
		/****************** TopOpeBRepTool_GeomTool ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_GeomTool;
		%feature("autodoc", "Boolean flags <compc3d>, <comppc1>, <comppc2> indicate whether the corresponding result curves <c3d>, <pc1>, <pc2> of makecurves method must or not be computed from an intersection line <l>. when the line <l> is a walking one, <typec3d> is the kind of the 3d curve <c3d> to compute : - bspline1 to compute a bspline of degree 1 on the walking points of <l>, - approx to build an approximation curve on the walking points of <l>.

Parameters
----------
TypeC3D: TopOpeBRepTool_OutCurveType,optional
	default value is TopOpeBRepTool_BSPLINE1
CompC3D: bool,optional
	default value is Standard_True
CompPC1: bool,optional
	default value is Standard_True
CompPC2: bool,optional
	default value is Standard_True

Returns
-------
None
") TopOpeBRepTool_GeomTool;
		 TopOpeBRepTool_GeomTool(const TopOpeBRepTool_OutCurveType TypeC3D = TopOpeBRepTool_BSPLINE1, const Standard_Boolean CompC3D = Standard_True, const Standard_Boolean CompPC1 = Standard_True, const Standard_Boolean CompPC2 = Standard_True);

		/****************** CompC3D ******************/
		%feature("compactdefaultargs") CompC3D;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CompC3D;
		Standard_Boolean CompC3D();

		/****************** CompPC1 ******************/
		%feature("compactdefaultargs") CompPC1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CompPC1;
		Standard_Boolean CompPC1();

		/****************** CompPC2 ******************/
		%feature("compactdefaultargs") CompPC2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CompPC2;
		Standard_Boolean CompPC2();

		/****************** Define ******************/
		%feature("compactdefaultargs") Define;
		%feature("autodoc", "No available documentation.

Parameters
----------
TypeC3D: TopOpeBRepTool_OutCurveType
CompC3D: bool
CompPC1: bool
CompPC2: bool

Returns
-------
None
") Define;
		void Define(const TopOpeBRepTool_OutCurveType TypeC3D, const Standard_Boolean CompC3D, const Standard_Boolean CompPC1, const Standard_Boolean CompPC2);

		/****************** Define ******************/
		%feature("compactdefaultargs") Define;
		%feature("autodoc", "No available documentation.

Parameters
----------
TypeC3D: TopOpeBRepTool_OutCurveType

Returns
-------
None
") Define;
		void Define(const TopOpeBRepTool_OutCurveType TypeC3D);

		/****************** Define ******************/
		%feature("compactdefaultargs") Define;
		%feature("autodoc", "No available documentation.

Parameters
----------
GT: TopOpeBRepTool_GeomTool

Returns
-------
None
") Define;
		void Define(const TopOpeBRepTool_GeomTool & GT);

		/****************** DefineCurves ******************/
		%feature("compactdefaultargs") DefineCurves;
		%feature("autodoc", "No available documentation.

Parameters
----------
CompC3D: bool

Returns
-------
None
") DefineCurves;
		void DefineCurves(const Standard_Boolean CompC3D);

		/****************** DefinePCurves1 ******************/
		%feature("compactdefaultargs") DefinePCurves1;
		%feature("autodoc", "No available documentation.

Parameters
----------
CompPC1: bool

Returns
-------
None
") DefinePCurves1;
		void DefinePCurves1(const Standard_Boolean CompPC1);

		/****************** DefinePCurves2 ******************/
		%feature("compactdefaultargs") DefinePCurves2;
		%feature("autodoc", "No available documentation.

Parameters
----------
CompPC2: bool

Returns
-------
None
") DefinePCurves2;
		void DefinePCurves2(const Standard_Boolean CompPC2);

		/****************** GetTolerances ******************/
		%feature("compactdefaultargs") GetTolerances;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
tol3d: float
tol2d: float
") GetTolerances;
		void GetTolerances(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbPntMax ******************/
		%feature("compactdefaultargs") NbPntMax;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPntMax;
		Standard_Integer NbPntMax();

		/****************** SetNbPntMax ******************/
		%feature("compactdefaultargs") SetNbPntMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbPntMax: int

Returns
-------
None
") SetNbPntMax;
		void SetNbPntMax(const Standard_Integer NbPntMax);

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "No available documentation.

Parameters
----------
tol3d: float
tol2d: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real tol3d, const Standard_Real tol2d);

		/****************** TypeC3D ******************/
		%feature("compactdefaultargs") TypeC3D;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_OutCurveType
") TypeC3D;
		TopOpeBRepTool_OutCurveType TypeC3D();

};


%extend TopOpeBRepTool_GeomTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepTool_HBoxTool *
********************************/
class TopOpeBRepTool_HBoxTool : public Standard_Transient {
	public:
		/****************** TopOpeBRepTool_HBoxTool ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_HBoxTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_HBoxTool;
		 TopOpeBRepTool_HBoxTool();

		/****************** AddBox ******************/
		%feature("compactdefaultargs") AddBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddBox;
		void AddBox(const TopoDS_Shape & S);

		/****************** AddBoxes ******************/
		%feature("compactdefaultargs") AddBoxes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") AddBoxes;
		void AddBoxes(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
Bnd_Box
") Box;
		const Bnd_Box & Box(const TopoDS_Shape & S);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
Bnd_Box
") Box;
		const Bnd_Box & Box(const Standard_Integer I);

		/****************** ChangeIMS ******************/
		%feature("compactdefaultargs") ChangeIMS;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_IndexedDataMapOfShapeBox
") ChangeIMS;
		TopOpeBRepTool_IndexedDataMapOfShapeBox & ChangeIMS();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ComputeBox ******************/
		%feature("compactdefaultargs") ComputeBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
B: Bnd_Box

Returns
-------
None
") ComputeBox;
		static void ComputeBox(const TopoDS_Shape & S, Bnd_Box & B);

		/****************** ComputeBoxOnVertices ******************/
		%feature("compactdefaultargs") ComputeBoxOnVertices;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
B: Bnd_Box

Returns
-------
None
") ComputeBoxOnVertices;
		static void ComputeBoxOnVertices(const TopoDS_Shape & S, Bnd_Box & B);

		/****************** DumpB ******************/
		%feature("compactdefaultargs") DumpB;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: Bnd_Box

Returns
-------
None
") DumpB;
		static void DumpB(const Bnd_Box & B);

		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** HasBox ******************/
		%feature("compactdefaultargs") HasBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") HasBox;
		Standard_Boolean HasBox(const TopoDS_Shape & S);

		/****************** IMS ******************/
		%feature("compactdefaultargs") IMS;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_IndexedDataMapOfShapeBox
") IMS;
		const TopOpeBRepTool_IndexedDataMapOfShapeBox & IMS();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") Index;
		Standard_Integer Index(const TopoDS_Shape & S);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer I);

};


%make_alias(TopOpeBRepTool_HBoxTool)

%extend TopOpeBRepTool_HBoxTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class TopOpeBRepTool_PurgeInternalEdges *
******************************************/
class TopOpeBRepTool_PurgeInternalEdges {
	public:
		/****************** TopOpeBRepTool_PurgeInternalEdges ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_PurgeInternalEdges;
		%feature("autodoc", "Initialize members and begin exploration of shape depending of the value of performnow.

Parameters
----------
theShape: TopoDS_Shape
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") TopOpeBRepTool_PurgeInternalEdges;
		 TopOpeBRepTool_PurgeInternalEdges(const TopoDS_Shape & theShape, const Standard_Boolean PerformNow = Standard_True);

		/****************** Faces ******************/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Returns the list internal edges associated with the faces of the myshape. if performnow was false when created, then call the private perform method that do the main job.

Parameters
----------
theMapFacLstEdg: TopTools_DataMapOfShapeListOfShape

Returns
-------
None
") Faces;
		void Faces(TopTools_DataMapOfShapeListOfShape & theMapFacLstEdg);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns false if the list of internal edges has not been extracted.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the number of edges candidate to be removed.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Using the list of internal edge from each face, rebuild myshape by removing thoses edges.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns myshape modified with the list of internal edges removed from it.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

};


%extend TopOpeBRepTool_PurgeInternalEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepTool_REGUS *
*****************************/
class TopOpeBRepTool_REGUS {
	public:
		/****************** TopOpeBRepTool_REGUS ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_REGUS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_REGUS;
		 TopOpeBRepTool_REGUS();

		/****************** GetFsplits ******************/
		%feature("compactdefaultargs") GetFsplits;
		%feature("autodoc", "No available documentation.

Parameters
----------
Fsplits: TopTools_DataMapOfShapeListOfShape

Returns
-------
None
") GetFsplits;
		void GetFsplits(TopTools_DataMapOfShapeListOfShape & Fsplits);

		/****************** GetOshNsh ******************/
		%feature("compactdefaultargs") GetOshNsh;
		%feature("autodoc", "No available documentation.

Parameters
----------
OshNsh: TopTools_DataMapOfShapeListOfShape

Returns
-------
None
") GetOshNsh;
		void GetOshNsh(TopTools_DataMapOfShapeListOfShape & OshNsh);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** InitBlock ******************/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") InitBlock;
		Standard_Boolean InitBlock();

		/****************** MapS ******************/
		%feature("compactdefaultargs") MapS;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MapS;
		Standard_Boolean MapS();

		/****************** NearestF ******************/
		%feature("compactdefaultargs") NearestF;
		%feature("autodoc", "No available documentation.

Parameters
----------
e: TopoDS_Edge
lof: TopTools_ListOfShape
ffound: TopoDS_Face

Returns
-------
bool
") NearestF;
		Standard_Boolean NearestF(const TopoDS_Edge & e, const TopTools_ListOfShape & lof, TopoDS_Face & ffound);

		/****************** NextinBlock ******************/
		%feature("compactdefaultargs") NextinBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") NextinBlock;
		Standard_Boolean NextinBlock();

		/****************** REGU ******************/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") REGU;
		Standard_Boolean REGU();

		/****************** S ******************/
		%feature("compactdefaultargs") S;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") S;
		const TopoDS_Shape S();

		/****************** SetFsplits ******************/
		%feature("compactdefaultargs") SetFsplits;
		%feature("autodoc", "No available documentation.

Parameters
----------
Fsplits: TopTools_DataMapOfShapeListOfShape

Returns
-------
None
") SetFsplits;
		void SetFsplits(TopTools_DataMapOfShapeListOfShape & Fsplits);

		/****************** SetOshNsh ******************/
		%feature("compactdefaultargs") SetOshNsh;
		%feature("autodoc", "No available documentation.

Parameters
----------
OshNsh: TopTools_DataMapOfShapeListOfShape

Returns
-------
None
") SetOshNsh;
		void SetOshNsh(TopTools_DataMapOfShapeListOfShape & OshNsh);

		/****************** SplitF ******************/
		%feature("compactdefaultargs") SplitF;
		%feature("autodoc", "No available documentation.

Parameters
----------
Fanc: TopoDS_Face
FSplits: TopTools_ListOfShape

Returns
-------
bool
") SplitF;
		static Standard_Boolean SplitF(const TopoDS_Face & Fanc, TopTools_ListOfShape & FSplits);

		/****************** SplitFaces ******************/
		%feature("compactdefaultargs") SplitFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SplitFaces;
		Standard_Boolean SplitFaces();

		/****************** WireToFace ******************/
		%feature("compactdefaultargs") WireToFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
Fanc: TopoDS_Face
nWs: TopTools_ListOfShape
nFs: TopTools_ListOfShape

Returns
-------
bool
") WireToFace;
		static Standard_Boolean WireToFace(const TopoDS_Face & Fanc, const TopTools_ListOfShape & nWs, TopTools_ListOfShape & nFs);

};


%extend TopOpeBRepTool_REGUS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepTool_REGUW *
*****************************/
class TopOpeBRepTool_REGUW {
	public:
		/****************** TopOpeBRepTool_REGUW ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_REGUW;
		%feature("autodoc", "No available documentation.

Parameters
----------
FRef: TopoDS_Face

Returns
-------
None
") TopOpeBRepTool_REGUW;
		 TopOpeBRepTool_REGUW(const TopoDS_Face & FRef);

		/****************** AddNewConnexity ******************/
		%feature("compactdefaultargs") AddNewConnexity;
		%feature("autodoc", "No available documentation.

Parameters
----------
v: TopoDS_Vertex
OriKey: int
e: TopoDS_Edge

Returns
-------
bool
") AddNewConnexity;
		Standard_Boolean AddNewConnexity(const TopoDS_Vertex & v, const Standard_Integer OriKey, const TopoDS_Edge & e);

		/****************** Connexity ******************/
		%feature("compactdefaultargs") Connexity;
		%feature("autodoc", "No available documentation.

Parameters
----------
v: TopoDS_Vertex
co: TopOpeBRepTool_connexity

Returns
-------
bool
") Connexity;
		Standard_Boolean Connexity(const TopoDS_Vertex & v, TopOpeBRepTool_connexity & co);

		/****************** Fref ******************/
		%feature("compactdefaultargs") Fref;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Fref;
		const TopoDS_Face Fref();

		/****************** GetEsplits ******************/
		%feature("compactdefaultargs") GetEsplits;
		%feature("autodoc", "No available documentation.

Parameters
----------
Esplits: TopTools_DataMapOfShapeListOfShape

Returns
-------
None
") GetEsplits;
		void GetEsplits(TopTools_DataMapOfShapeListOfShape & Esplits);

		/****************** GetOwNw ******************/
		%feature("compactdefaultargs") GetOwNw;
		%feature("autodoc", "No available documentation.

Parameters
----------
OwNw: TopTools_DataMapOfShapeListOfShape

Returns
-------
None
") GetOwNw;
		void GetOwNw(TopTools_DataMapOfShapeListOfShape & OwNw);

		/****************** GetSplits ******************/
		%feature("compactdefaultargs") GetSplits;
		%feature("autodoc", "No available documentation.

Parameters
----------
Splits: TopTools_ListOfShape

Returns
-------
bool
") GetSplits;
		Standard_Boolean GetSplits(TopTools_ListOfShape & Splits);

		/****************** HasInit ******************/
		%feature("compactdefaultargs") HasInit;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasInit;
		Standard_Boolean HasInit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** InitBlock ******************/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") InitBlock;
		Standard_Boolean InitBlock();

		/****************** MapS ******************/
		%feature("compactdefaultargs") MapS;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MapS;
		Standard_Boolean MapS();

		/****************** NearestE ******************/
		%feature("compactdefaultargs") NearestE;
		%feature("autodoc", "No available documentation.

Parameters
----------
loe: TopTools_ListOfShape
efound: TopoDS_Edge

Returns
-------
bool
") NearestE;
		Standard_Boolean NearestE(const TopTools_ListOfShape & loe, TopoDS_Edge & efound);

		/****************** NextinBlock ******************/
		%feature("compactdefaultargs") NextinBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") NextinBlock;
		Standard_Boolean NextinBlock();

		/****************** REGU ******************/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "No available documentation.

Parameters
----------
istep: int
Scur: TopoDS_Shape
Splits: TopTools_ListOfShape

Returns
-------
bool
") REGU;
		Standard_Boolean REGU(const Standard_Integer istep, const TopoDS_Shape & Scur, TopTools_ListOfShape & Splits);

		/****************** REGU ******************/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") REGU;
		Standard_Boolean REGU();

		/****************** RemoveOldConnexity ******************/
		%feature("compactdefaultargs") RemoveOldConnexity;
		%feature("autodoc", "No available documentation.

Parameters
----------
v: TopoDS_Vertex
OriKey: int
e: TopoDS_Edge

Returns
-------
bool
") RemoveOldConnexity;
		Standard_Boolean RemoveOldConnexity(const TopoDS_Vertex & v, const Standard_Integer OriKey, const TopoDS_Edge & e);

		/****************** S ******************/
		%feature("compactdefaultargs") S;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") S;
		const TopoDS_Shape S();

		/****************** SetEsplits ******************/
		%feature("compactdefaultargs") SetEsplits;
		%feature("autodoc", "No available documentation.

Parameters
----------
Esplits: TopTools_DataMapOfShapeListOfShape

Returns
-------
None
") SetEsplits;
		void SetEsplits(TopTools_DataMapOfShapeListOfShape & Esplits);

		/****************** SetOwNw ******************/
		%feature("compactdefaultargs") SetOwNw;
		%feature("autodoc", "No available documentation.

Parameters
----------
OwNw: TopTools_DataMapOfShapeListOfShape

Returns
-------
None
") SetOwNw;
		void SetOwNw(TopTools_DataMapOfShapeListOfShape & OwNw);

		/****************** SplitEds ******************/
		%feature("compactdefaultargs") SplitEds;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SplitEds;
		Standard_Boolean SplitEds();

		/****************** UpdateMultiple ******************/
		%feature("compactdefaultargs") UpdateMultiple;
		%feature("autodoc", "No available documentation.

Parameters
----------
v: TopoDS_Vertex

Returns
-------
bool
") UpdateMultiple;
		Standard_Boolean UpdateMultiple(const TopoDS_Vertex & v);

};


%extend TopOpeBRepTool_REGUW {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepTool_STATE *
*****************************/
/***************************************
* class TopOpeBRepTool_ShapeClassifier *
***************************************/
class TopOpeBRepTool_ShapeClassifier {
	public:
		/****************** TopOpeBRepTool_ShapeClassifier ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier();

		/****************** TopOpeBRepTool_ShapeClassifier ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeClassifier;
		%feature("autodoc", "Sref is the reference shape. stateshapeshape(s) calls will classify s with sref.

Parameters
----------
SRef: TopoDS_Shape

Returns
-------
None
") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier(const TopoDS_Shape & SRef);

		/****************** ChangeSolidClassifier ******************/
		%feature("compactdefaultargs") ChangeSolidClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_SolidClassifier
") ChangeSolidClassifier;
		TopOpeBRepTool_SolidClassifier & ChangeSolidClassifier();

		/****************** ClearAll ******************/
		%feature("compactdefaultargs") ClearAll;
		%feature("autodoc", "Reset all internal data (solidclassifier included).

Returns
-------
None
") ClearAll;
		void ClearAll();

		/****************** ClearCurrent ******************/
		%feature("compactdefaultargs") ClearCurrent;
		%feature("autodoc", "Reset all internal data (except solidclassified).

Returns
-------
None
") ClearCurrent;
		void ClearCurrent();

		/****************** P2D ******************/
		%feature("compactdefaultargs") P2D;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") P2D;
		const gp_Pnt2d P2D();

		/****************** P3D ******************/
		%feature("compactdefaultargs") P3D;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") P3D;
		const gp_Pnt P3D();

		/****************** SameDomain ******************/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SameDomain;
		Standard_Integer SameDomain();

		/****************** SameDomain ******************/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "Set mode for next stateshapeshape call samedomain = true --> s,sref are same domain --> point on restriction (on s) is used to classify s. samedomain = false --> s,sref are not domain --> point not on restriction of s (in s) is used to classify s. samedomain value is used only in next stateshapeshape call.

Parameters
----------
samedomain: int

Returns
-------
None
") SameDomain;
		void SameDomain(const Standard_Integer samedomain);

		/****************** SetReference ******************/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "Set sref as reference shape the next stateshapereference(s,avoids) calls will classify s with sref.

Parameters
----------
SRef: TopoDS_Shape

Returns
-------
None
") SetReference;
		void SetReference(const TopoDS_Shape & SRef);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return field mystate.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

		/****************** StateP2DReference ******************/
		%feature("compactdefaultargs") StateP2DReference;
		%feature("autodoc", "Classify point p2d with myref.

Parameters
----------
P2D: gp_Pnt2d

Returns
-------
None
") StateP2DReference;
		void StateP2DReference(const gp_Pnt2d & P2D);

		/****************** StateP3DReference ******************/
		%feature("compactdefaultargs") StateP3DReference;
		%feature("autodoc", "Classify point p3d with myref.

Parameters
----------
P3D: gp_Pnt

Returns
-------
None
") StateP3DReference;
		void StateP3DReference(const gp_Pnt & P3D);

		/****************** StateShapeReference ******************/
		%feature("compactdefaultargs") StateShapeReference;
		%feature("autodoc", "Classify shape s compared with reference shape. avoids is not used in classification; avoids may be isnull(). (usefull to avoid on or unknown state in special cases).

Parameters
----------
S: TopoDS_Shape
AvoidS: TopoDS_Shape

Returns
-------
TopAbs_State
") StateShapeReference;
		TopAbs_State StateShapeReference(const TopoDS_Shape & S, const TopoDS_Shape & AvoidS);

		/****************** StateShapeReference ******************/
		%feature("compactdefaultargs") StateShapeReference;
		%feature("autodoc", "Classify shape s compared with reference shape. lavoids is list of s subshapes to avoid in classification (usefull to avoid on or unknown state in special cases).

Parameters
----------
S: TopoDS_Shape
LAvoidS: TopTools_ListOfShape

Returns
-------
TopAbs_State
") StateShapeReference;
		TopAbs_State StateShapeReference(const TopoDS_Shape & S, const TopTools_ListOfShape & LAvoidS);

		/****************** StateShapeShape ******************/
		%feature("compactdefaultargs") StateShapeShape;
		%feature("autodoc", "Classify shape s compared with shape sref. samedomain = 0 : s1,s2 are not same domain samedomain = 1 : s1,s2 are same domain.

Parameters
----------
S: TopoDS_Shape
SRef: TopoDS_Shape
samedomain: int,optional
	default value is 0

Returns
-------
TopAbs_State
") StateShapeShape;
		TopAbs_State StateShapeShape(const TopoDS_Shape & S, const TopoDS_Shape & SRef, const Standard_Integer samedomain = 0);

		/****************** StateShapeShape ******************/
		%feature("compactdefaultargs") StateShapeShape;
		%feature("autodoc", "Classify shape s compared with shape sref. avoids is not used in classification; avoids may be isnull(). (usefull to avoid on or unknown state in special cases).

Parameters
----------
S: TopoDS_Shape
AvoidS: TopoDS_Shape
SRef: TopoDS_Shape

Returns
-------
TopAbs_State
") StateShapeShape;
		TopAbs_State StateShapeShape(const TopoDS_Shape & S, const TopoDS_Shape & AvoidS, const TopoDS_Shape & SRef);

		/****************** StateShapeShape ******************/
		%feature("compactdefaultargs") StateShapeShape;
		%feature("autodoc", "Classify shape s compared with shape sref. lavoids is list of s subshapes to avoid in classification avoids is not used in classification; avoids may be isnull(). (usefull to avoid on or unknown state in special cases).

Parameters
----------
S: TopoDS_Shape
LAvoidS: TopTools_ListOfShape
SRef: TopoDS_Shape

Returns
-------
TopAbs_State
") StateShapeShape;
		TopAbs_State StateShapeShape(const TopoDS_Shape & S, const TopTools_ListOfShape & LAvoidS, const TopoDS_Shape & SRef);

};


%extend TopOpeBRepTool_ShapeClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepTool_ShapeExplorer *
*************************************/
class TopOpeBRepTool_ShapeExplorer : public TopExp_Explorer {
	public:
		/****************** TopOpeBRepTool_ShapeExplorer ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeExplorer;
		%feature("autodoc", "Creates an empty explorer, becomes usefull after init.

Returns
-------
None
") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer();

		/****************** TopOpeBRepTool_ShapeExplorer ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeExplorer;
		%feature("autodoc", "Creates an explorer on the shape <s>. //! <tofind> is the type of shapes to search. topabs_vertex, topabs_edge, ... //! <toavoid> is the type of shape to skip in the exploration. if <toavoid> is equal or less complex than <tofind> or if <toavoid> is shape it has no effect on the exploration.

Parameters
----------
S: TopoDS_Shape
ToFind: TopAbs_ShapeEnum
ToAvoid: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer(const TopoDS_Shape & S, const TopAbs_ShapeEnum ToFind, const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);


        %feature("autodoc", "1");
        %extend{
            std::string DumpCurrentToString() {
            std::stringstream s;
            self->DumpCurrent(s);
            return s.str();}
        };
		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Index of current sub-shape.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
ToFind: TopAbs_ShapeEnum
ToAvoid: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S, const TopAbs_ShapeEnum ToFind, const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves to the next shape in the exploration.

Returns
-------
None
") Next;
		void Next();

};


%extend TopOpeBRepTool_ShapeExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepTool_ShapeTool *
*********************************/
class TopOpeBRepTool_ShapeTool {
	public:
		/****************** AdjustOnPeriodic ******************/
		%feature("compactdefaultargs") AdjustOnPeriodic;
		%feature("autodoc", "Ajust u,v values in uvbounds of the domain of the geometric shape <s>, according to uperiodicity and vperiodicity of the domain. <s> is assumed to be a face. u and/or v is/are not modified when the domain is not periodic in u and/or v .

Parameters
----------
S: TopoDS_Shape

Returns
-------
u: float
v: float
") AdjustOnPeriodic;
		static void AdjustOnPeriodic(const TopoDS_Shape & S, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** BASISCURVE ******************/
		%feature("compactdefaultargs") BASISCURVE;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
opencascade::handle<Geom_Curve>
") BASISCURVE;
		static opencascade::handle<Geom_Curve> BASISCURVE(const opencascade::handle<Geom_Curve> & C);

		/****************** BASISCURVE ******************/
		%feature("compactdefaultargs") BASISCURVE;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
opencascade::handle<Geom_Curve>
") BASISCURVE;
		static opencascade::handle<Geom_Curve> BASISCURVE(const TopoDS_Edge & E);

		/****************** BASISSURFACE ******************/
		%feature("compactdefaultargs") BASISSURFACE;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface

Returns
-------
opencascade::handle<Geom_Surface>
") BASISSURFACE;
		static opencascade::handle<Geom_Surface> BASISSURFACE(const opencascade::handle<Geom_Surface> & S);

		/****************** BASISSURFACE ******************/
		%feature("compactdefaultargs") BASISSURFACE;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
opencascade::handle<Geom_Surface>
") BASISSURFACE;
		static opencascade::handle<Geom_Surface> BASISSURFACE(const TopoDS_Face & F);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Indicates wheter shape s1 is a closing shape on s2 or not.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
bool
") Closed;
		static Standard_Boolean Closed(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** CurvesSameOriented ******************/
		%feature("compactdefaultargs") CurvesSameOriented;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: BRepAdaptor_Curve
C2: BRepAdaptor_Curve

Returns
-------
bool
") CurvesSameOriented;
		static Standard_Boolean CurvesSameOriented(const BRepAdaptor_Curve & C1, const BRepAdaptor_Curve & C2);

		/****************** EdgeData ******************/
		%feature("compactdefaultargs") EdgeData;
		%feature("autodoc", "Compute tangent t, normal n, curvature c at point of parameter p on curve brac. returns the tolerance indicating if t,n are null.

Parameters
----------
BRAC: BRepAdaptor_Curve
P: float
T: gp_Dir
N: gp_Dir

Returns
-------
C: float
") EdgeData;
		static Standard_Real EdgeData(const BRepAdaptor_Curve & BRAC, const Standard_Real P, gp_Dir & T, gp_Dir & N, Standard_Real &OutValue);

		/****************** EdgeData ******************/
		%feature("compactdefaultargs") EdgeData;
		%feature("autodoc", "Same as previous on edge e.

Parameters
----------
E: TopoDS_Shape
P: float
T: gp_Dir
N: gp_Dir

Returns
-------
C: float
") EdgeData;
		static Standard_Real EdgeData(const TopoDS_Shape & E, const Standard_Real P, gp_Dir & T, gp_Dir & N, Standard_Real &OutValue);

		/****************** EdgesSameOriented ******************/
		%feature("compactdefaultargs") EdgesSameOriented;
		%feature("autodoc", "No available documentation.

Parameters
----------
E1: TopoDS_Shape
E2: TopoDS_Shape

Returns
-------
bool
") EdgesSameOriented;
		static Standard_Boolean EdgesSameOriented(const TopoDS_Shape & E1, const TopoDS_Shape & E2);

		/****************** FacesSameOriented ******************/
		%feature("compactdefaultargs") FacesSameOriented;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape

Returns
-------
bool
") FacesSameOriented;
		static Standard_Boolean FacesSameOriented(const TopoDS_Shape & F1, const TopoDS_Shape & F2);

		/****************** PeriodizeParameter ******************/
		%feature("compactdefaultargs") PeriodizeParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
par: float
EE: TopoDS_Shape
FF: TopoDS_Shape

Returns
-------
float
") PeriodizeParameter;
		static Standard_Real PeriodizeParameter(const Standard_Real par, const TopoDS_Shape & EE, const TopoDS_Shape & FF);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns 3d point of vertex <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
gp_Pnt
") Pnt;
		static gp_Pnt Pnt(const TopoDS_Shape & S);

		/****************** Resolution3d ******************/
		%feature("compactdefaultargs") Resolution3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SU: Geom_Surface
Tol2d: float

Returns
-------
float
") Resolution3d;
		static Standard_Real Resolution3d(const opencascade::handle<Geom_Surface> & SU, const Standard_Real Tol2d);

		/****************** Resolution3d ******************/
		%feature("compactdefaultargs") Resolution3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
Tol2d: float

Returns
-------
float
") Resolution3d;
		static Standard_Real Resolution3d(const TopoDS_Face & F, const Standard_Real Tol2d);

		/****************** Resolution3dU ******************/
		%feature("compactdefaultargs") Resolution3dU;
		%feature("autodoc", "No available documentation.

Parameters
----------
SU: Geom_Surface
Tol2d: float

Returns
-------
float
") Resolution3dU;
		static Standard_Real Resolution3dU(const opencascade::handle<Geom_Surface> & SU, const Standard_Real Tol2d);

		/****************** Resolution3dV ******************/
		%feature("compactdefaultargs") Resolution3dV;
		%feature("autodoc", "No available documentation.

Parameters
----------
SU: Geom_Surface
Tol2d: float

Returns
-------
float
") Resolution3dV;
		static Standard_Real Resolution3dV(const opencascade::handle<Geom_Surface> & SU, const Standard_Real Tol2d);

		/****************** ShapesSameOriented ******************/
		%feature("compactdefaultargs") ShapesSameOriented;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
bool
") ShapesSameOriented;
		static Standard_Boolean ShapesSameOriented(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** SurfacesSameOriented ******************/
		%feature("compactdefaultargs") SurfacesSameOriented;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface

Returns
-------
bool
") SurfacesSameOriented;
		static Standard_Boolean SurfacesSameOriented(const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance of the shape <s>. if the shape <s> is null, returns 0.

Parameters
----------
S: TopoDS_Shape

Returns
-------
float
") Tolerance;
		static Standard_Real Tolerance(const TopoDS_Shape & S);

		/****************** UVBOUNDS ******************/
		%feature("compactdefaultargs") UVBOUNDS;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface

Returns
-------
UPeri: bool
VPeri: bool
Umin: float
Umax: float
Vmin: float
Vmax: float
") UVBOUNDS;
		static void UVBOUNDS(const opencascade::handle<Geom_Surface> & S, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UVBOUNDS ******************/
		%feature("compactdefaultargs") UVBOUNDS;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
UPeri: bool
VPeri: bool
Umin: float
Umax: float
Vmin: float
Vmax: float
") UVBOUNDS;
		static void UVBOUNDS(const TopoDS_Face & F, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend TopOpeBRepTool_ShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopOpeBRepTool_SolidClassifier *
***************************************/
class TopOpeBRepTool_SolidClassifier {
	public:
		/****************** TopOpeBRepTool_SolidClassifier ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_SolidClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_SolidClassifier;
		 TopOpeBRepTool_SolidClassifier();

		/****************** Classify ******************/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "Compute the position of point <p> regarding with the geometric domain of the solid <s>.

Parameters
----------
S: TopoDS_Solid
P: gp_Pnt
Tol: float

Returns
-------
TopAbs_State
") Classify;
		TopAbs_State Classify(const TopoDS_Solid & S, const gp_Pnt & P, const Standard_Real Tol);

		/****************** Classify ******************/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "Compute the position of point <p> regarding with the geometric domain of the shell <s>.

Parameters
----------
S: TopoDS_Shell
P: gp_Pnt
Tol: float

Returns
-------
TopAbs_State
") Classify;
		TopAbs_State Classify(const TopoDS_Shell & S, const gp_Pnt & P, const Standard_Real Tol);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** LoadShell ******************/
		%feature("compactdefaultargs") LoadShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shell

Returns
-------
None
") LoadShell;
		void LoadShell(const TopoDS_Shell & S);

		/****************** LoadSolid ******************/
		%feature("compactdefaultargs") LoadSolid;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Solid

Returns
-------
None
") LoadSolid;
		void LoadSolid(const TopoDS_Solid & S);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

};


%extend TopOpeBRepTool_SolidClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepTool_TOOL *
****************************/
class TopOpeBRepTool_TOOL {
	public:
		/****************** ClosedE ******************/
		%feature("compactdefaultargs") ClosedE;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
vclo: TopoDS_Vertex

Returns
-------
bool
") ClosedE;
		static Standard_Boolean ClosedE(const TopoDS_Edge & E, TopoDS_Vertex & vclo);

		/****************** ClosedS ******************/
		%feature("compactdefaultargs") ClosedS;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
bool
") ClosedS;
		static Standard_Boolean ClosedS(const TopoDS_Face & F);

		/****************** CurvE ******************/
		%feature("compactdefaultargs") CurvE;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
par: float
tg0: gp_Dir

Returns
-------
Curv: float
") CurvE;
		static Standard_Boolean CurvE(const TopoDS_Edge & E, const Standard_Real par, const gp_Dir & tg0, Standard_Real &OutValue);

		/****************** CurvF ******************/
		%feature("compactdefaultargs") CurvF;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
uv: gp_Pnt2d
tg0: gp_Dir

Returns
-------
Curv: float
direct: bool
") CurvF;
		static Standard_Boolean CurvF(const TopoDS_Face & F, const gp_Pnt2d & uv, const gp_Dir & tg0, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****************** EdgeONFace ******************/
		%feature("compactdefaultargs") EdgeONFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
par: float
ed: TopoDS_Edge
uv: gp_Pnt2d
fa: TopoDS_Face

Returns
-------
isonfa: bool
") EdgeONFace;
		static Standard_Boolean EdgeONFace(const Standard_Real par, const TopoDS_Edge & ed, const gp_Pnt2d & uv, const TopoDS_Face & fa, Standard_Boolean &OutValue);

		/****************** Getduv ******************/
		%feature("compactdefaultargs") Getduv;
		%feature("autodoc", "No available documentation.

Parameters
----------
f: TopoDS_Face
uv: gp_Pnt2d
dir: gp_Vec
factor: float
duv: gp_Dir2d

Returns
-------
bool
") Getduv;
		static Standard_Boolean Getduv(const TopoDS_Face & f, const gp_Pnt2d & uv, const gp_Vec & dir, const Standard_Real factor, gp_Dir2d & duv);

		/****************** Getstp3dF ******************/
		%feature("compactdefaultargs") Getstp3dF;
		%feature("autodoc", "No available documentation.

Parameters
----------
p: gp_Pnt
f: TopoDS_Face
uv: gp_Pnt2d
st: TopAbs_State

Returns
-------
bool
") Getstp3dF;
		static Standard_Boolean Getstp3dF(const gp_Pnt & p, const TopoDS_Face & f, gp_Pnt2d & uv, TopAbs_State & st);

		/****************** IsClosingE ******************/
		%feature("compactdefaultargs") IsClosingE;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
bool
") IsClosingE;
		static Standard_Boolean IsClosingE(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** IsClosingE ******************/
		%feature("compactdefaultargs") IsClosingE;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
W: TopoDS_Shape
F: TopoDS_Face

Returns
-------
bool
") IsClosingE;
		static Standard_Boolean IsClosingE(const TopoDS_Edge & E, const TopoDS_Shape & W, const TopoDS_Face & F);

		/****************** IsQuad ******************/
		%feature("compactdefaultargs") IsQuad;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") IsQuad;
		static Standard_Boolean IsQuad(const TopoDS_Edge & E);

		/****************** IsQuad ******************/
		%feature("compactdefaultargs") IsQuad;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
bool
") IsQuad;
		static Standard_Boolean IsQuad(const TopoDS_Face & F);

		/****************** IsonCLO ******************/
		%feature("compactdefaultargs") IsonCLO;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: Geom2d_Curve
onU: bool
xfirst: float
xperiod: float
xtol: float

Returns
-------
bool
") IsonCLO;
		static Standard_Boolean IsonCLO(const opencascade::handle<Geom2d_Curve> & PC, const Standard_Boolean onU, const Standard_Real xfirst, const Standard_Real xperiod, const Standard_Real xtol);

		/****************** IsonCLO ******************/
		%feature("compactdefaultargs") IsonCLO;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2DF: TopOpeBRepTool_C2DF
onU: bool
xfirst: float
xperiod: float
xtol: float

Returns
-------
bool
") IsonCLO;
		static Standard_Boolean IsonCLO(const TopOpeBRepTool_C2DF & C2DF, const Standard_Boolean onU, const Standard_Real xfirst, const Standard_Real xperiod, const Standard_Real xtol);

		/****************** Matter ******************/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "No available documentation.

Parameters
----------
d1: gp_Vec
d2: gp_Vec
ref: gp_Vec

Returns
-------
float
") Matter;
		static Standard_Real Matter(const gp_Vec & d1, const gp_Vec & d2, const gp_Vec & ref);

		/****************** Matter ******************/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "No available documentation.

Parameters
----------
d1: gp_Vec2d
d2: gp_Vec2d

Returns
-------
float
") Matter;
		static Standard_Real Matter(const gp_Vec2d & d1, const gp_Vec2d & d2);

		/****************** Matter ******************/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "No available documentation.

Parameters
----------
xx1: gp_Dir
nt1: gp_Dir
xx2: gp_Dir
nt2: gp_Dir
tola: float

Returns
-------
Ang: float
") Matter;
		static Standard_Boolean Matter(const gp_Dir & xx1, const gp_Dir & nt1, const gp_Dir & xx2, const gp_Dir & nt2, const Standard_Real tola, Standard_Real &OutValue);

		/****************** Matter ******************/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "No available documentation.

Parameters
----------
f1: TopoDS_Face
f2: TopoDS_Face
e: TopoDS_Edge
pare: float
tola: float

Returns
-------
Ang: float
") Matter;
		static Standard_Boolean Matter(const TopoDS_Face & f1, const TopoDS_Face & f2, const TopoDS_Edge & e, const Standard_Real pare, const Standard_Real tola, Standard_Real &OutValue);

		/****************** MatterKPtg ******************/
		%feature("compactdefaultargs") MatterKPtg;
		%feature("autodoc", "No available documentation.

Parameters
----------
f1: TopoDS_Face
f2: TopoDS_Face
e: TopoDS_Edge

Returns
-------
Ang: float
") MatterKPtg;
		static Standard_Boolean MatterKPtg(const TopoDS_Face & f1, const TopoDS_Face & f2, const TopoDS_Edge & e, Standard_Real &OutValue);

		/****************** MkShell ******************/
		%feature("compactdefaultargs") MkShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
lF: TopTools_ListOfShape
She: TopoDS_Shape

Returns
-------
None
") MkShell;
		static void MkShell(const TopTools_ListOfShape & lF, TopoDS_Shape & She);

		/****************** NgApp ******************/
		%feature("compactdefaultargs") NgApp;
		%feature("autodoc", "No available documentation.

Parameters
----------
par: float
E: TopoDS_Edge
F: TopoDS_Face
tola: float
ngApp: gp_Dir

Returns
-------
bool
") NgApp;
		static Standard_Boolean NgApp(const Standard_Real par, const TopoDS_Edge & E, const TopoDS_Face & F, const Standard_Real tola, gp_Dir & ngApp);

		/****************** NggeomF ******************/
		%feature("compactdefaultargs") NggeomF;
		%feature("autodoc", "No available documentation.

Parameters
----------
uv: gp_Pnt2d
F: TopoDS_Face
ng: gp_Vec

Returns
-------
bool
") NggeomF;
		static Standard_Boolean NggeomF(const gp_Pnt2d & uv, const TopoDS_Face & F, gp_Vec & ng);

		/****************** Nt ******************/
		%feature("compactdefaultargs") Nt;
		%feature("autodoc", "No available documentation.

Parameters
----------
uv: gp_Pnt2d
f: TopoDS_Face
normt: gp_Dir

Returns
-------
bool
") Nt;
		static Standard_Boolean Nt(const gp_Pnt2d & uv, const TopoDS_Face & f, gp_Dir & normt);

		/****************** OnBoundary ******************/
		%feature("compactdefaultargs") OnBoundary;
		%feature("autodoc", "No available documentation.

Parameters
----------
par: float
E: TopoDS_Edge

Returns
-------
int
") OnBoundary;
		static Standard_Integer OnBoundary(const Standard_Real par, const TopoDS_Edge & E);

		/****************** OriinSor ******************/
		%feature("compactdefaultargs") OriinSor;
		%feature("autodoc", "No available documentation.

Parameters
----------
sub: TopoDS_Shape
S: TopoDS_Shape
checkclo: bool,optional
	default value is Standard_False

Returns
-------
int
") OriinSor;
		static Standard_Integer OriinSor(const TopoDS_Shape & sub, const TopoDS_Shape & S, const Standard_Boolean checkclo = Standard_False);

		/****************** OriinSorclosed ******************/
		%feature("compactdefaultargs") OriinSorclosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
sub: TopoDS_Shape
S: TopoDS_Shape

Returns
-------
int
") OriinSorclosed;
		static Standard_Integer OriinSorclosed(const TopoDS_Shape & sub, const TopoDS_Shape & S);

		/****************** ParE ******************/
		%feature("compactdefaultargs") ParE;
		%feature("autodoc", "No available documentation.

Parameters
----------
Iv: int
E: TopoDS_Edge

Returns
-------
float
") ParE;
		static Standard_Real ParE(const Standard_Integer Iv, const TopoDS_Edge & E);

		/****************** ParE2d ******************/
		%feature("compactdefaultargs") ParE2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
p2d: gp_Pnt2d
e: TopoDS_Edge
f: TopoDS_Face

Returns
-------
par: float
dist: float
") ParE2d;
		static Standard_Boolean ParE2d(const gp_Pnt2d & p2d, const TopoDS_Edge & e, const TopoDS_Face & f, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParISO ******************/
		%feature("compactdefaultargs") ParISO;
		%feature("autodoc", "No available documentation.

Parameters
----------
p2d: gp_Pnt2d
e: TopoDS_Edge
f: TopoDS_Face

Returns
-------
pare: float
") ParISO;
		static Standard_Boolean ParISO(const gp_Pnt2d & p2d, const TopoDS_Edge & e, const TopoDS_Face & f, Standard_Real &OutValue);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "No available documentation.

Parameters
----------
loS: TopTools_ListOfShape
toremove: TopoDS_Shape

Returns
-------
bool
") Remove;
		static Standard_Boolean Remove(TopTools_ListOfShape & loS, const TopoDS_Shape & toremove);

		/****************** SplitE ******************/
		%feature("compactdefaultargs") SplitE;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eanc: TopoDS_Edge
Splits: TopTools_ListOfShape

Returns
-------
bool
") SplitE;
		static Standard_Boolean SplitE(const TopoDS_Edge & Eanc, TopTools_ListOfShape & Splits);

		/****************** Tg2d ******************/
		%feature("compactdefaultargs") Tg2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
iv: int
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF

Returns
-------
gp_Vec2d
") Tg2d;
		static gp_Vec2d Tg2d(const Standard_Integer iv, const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF);

		/****************** Tg2dApp ******************/
		%feature("compactdefaultargs") Tg2dApp;
		%feature("autodoc", "No available documentation.

Parameters
----------
iv: int
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF
factor: float

Returns
-------
gp_Vec2d
") Tg2dApp;
		static gp_Vec2d Tg2dApp(const Standard_Integer iv, const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF, const Standard_Real factor);

		/****************** TgINSIDE ******************/
		%feature("compactdefaultargs") TgINSIDE;
		%feature("autodoc", "No available documentation.

Parameters
----------
v: TopoDS_Vertex
E: TopoDS_Edge
Tg: gp_Vec

Returns
-------
OvinE: int
") TgINSIDE;
		static Standard_Boolean TgINSIDE(const TopoDS_Vertex & v, const TopoDS_Edge & E, gp_Vec & Tg, Standard_Integer &OutValue);

		/****************** TggeomE ******************/
		%feature("compactdefaultargs") TggeomE;
		%feature("autodoc", "No available documentation.

Parameters
----------
par: float
BC: BRepAdaptor_Curve
Tg: gp_Vec

Returns
-------
bool
") TggeomE;
		static Standard_Boolean TggeomE(const Standard_Real par, const BRepAdaptor_Curve & BC, gp_Vec & Tg);

		/****************** TggeomE ******************/
		%feature("compactdefaultargs") TggeomE;
		%feature("autodoc", "No available documentation.

Parameters
----------
par: float
E: TopoDS_Edge
Tg: gp_Vec

Returns
-------
bool
") TggeomE;
		static Standard_Boolean TggeomE(const Standard_Real par, const TopoDS_Edge & E, gp_Vec & Tg);

		/****************** TolP ******************/
		%feature("compactdefaultargs") TolP;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
float
") TolP;
		static Standard_Real TolP(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** TolUV ******************/
		%feature("compactdefaultargs") TolUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
tol3d: float

Returns
-------
float
") TolUV;
		static Standard_Real TolUV(const TopoDS_Face & F, const Standard_Real tol3d);

		/****************** TrslUV ******************/
		%feature("compactdefaultargs") TrslUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
t2d: gp_Vec2d
C2DF: TopOpeBRepTool_C2DF

Returns
-------
None
") TrslUV;
		static void TrslUV(const gp_Vec2d & t2d, TopOpeBRepTool_C2DF & C2DF);

		/****************** TrslUVModifE ******************/
		%feature("compactdefaultargs") TrslUVModifE;
		%feature("autodoc", "No available documentation.

Parameters
----------
t2d: gp_Vec2d
F: TopoDS_Face
E: TopoDS_Edge

Returns
-------
bool
") TrslUVModifE;
		static Standard_Boolean TrslUVModifE(const gp_Vec2d & t2d, const TopoDS_Face & F, TopoDS_Edge & E);

		/****************** UVF ******************/
		%feature("compactdefaultargs") UVF;
		%feature("autodoc", "No available documentation.

Parameters
----------
par: float
C2DF: TopOpeBRepTool_C2DF

Returns
-------
gp_Pnt2d
") UVF;
		static gp_Pnt2d UVF(const Standard_Real par, const TopOpeBRepTool_C2DF & C2DF);

		/****************** UVISO ******************/
		%feature("compactdefaultargs") UVISO;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: Geom2d_Curve
d2d: gp_Dir2d
o2d: gp_Pnt2d

Returns
-------
isou: bool
isov: bool
") UVISO;
		static Standard_Boolean UVISO(const opencascade::handle<Geom2d_Curve> & PC, Standard_Boolean &OutValue, Standard_Boolean &OutValue, gp_Dir2d & d2d, gp_Pnt2d & o2d);

		/****************** UVISO ******************/
		%feature("compactdefaultargs") UVISO;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2DF: TopOpeBRepTool_C2DF
d2d: gp_Dir2d
o2d: gp_Pnt2d

Returns
-------
isou: bool
isov: bool
") UVISO;
		static Standard_Boolean UVISO(const TopOpeBRepTool_C2DF & C2DF, Standard_Boolean &OutValue, Standard_Boolean &OutValue, gp_Dir2d & d2d, gp_Pnt2d & o2d);

		/****************** UVISO ******************/
		%feature("compactdefaultargs") UVISO;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
d2d: gp_Dir2d
o2d: gp_Pnt2d

Returns
-------
isou: bool
isov: bool
") UVISO;
		static Standard_Boolean UVISO(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Boolean &OutValue, Standard_Boolean &OutValue, gp_Dir2d & d2d, gp_Pnt2d & o2d);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Iv: int
E: TopoDS_Edge

Returns
-------
TopoDS_Vertex
") Vertex;
		static TopoDS_Vertex Vertex(const Standard_Integer Iv, const TopoDS_Edge & E);

		/****************** Vertices ******************/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
Vces: TopTools_Array1OfShape

Returns
-------
None
") Vertices;
		static void Vertices(const TopoDS_Edge & E, TopTools_Array1OfShape & Vces);

		/****************** WireToFace ******************/
		%feature("compactdefaultargs") WireToFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
Fref: TopoDS_Face
mapWlow: TopTools_DataMapOfShapeListOfShape
lFs: TopTools_ListOfShape

Returns
-------
bool
") WireToFace;
		static Standard_Boolean WireToFace(const TopoDS_Face & Fref, const TopTools_DataMapOfShapeListOfShape & mapWlow, TopTools_ListOfShape & lFs);

		/****************** XX ******************/
		%feature("compactdefaultargs") XX;
		%feature("autodoc", "No available documentation.

Parameters
----------
uv: gp_Pnt2d
f: TopoDS_Face
par: float
e: TopoDS_Edge
xx: gp_Dir

Returns
-------
bool
") XX;
		static Standard_Boolean XX(const gp_Pnt2d & uv, const TopoDS_Face & f, const Standard_Real par, const TopoDS_Edge & e, gp_Dir & xx);

		/****************** minDUV ******************/
		%feature("compactdefaultargs") minDUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
float
") minDUV;
		static Standard_Real minDUV(const TopoDS_Face & F);

		/****************** outUVbounds ******************/
		%feature("compactdefaultargs") outUVbounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
uv: gp_Pnt2d
F: TopoDS_Face

Returns
-------
bool
") outUVbounds;
		static Standard_Boolean outUVbounds(const gp_Pnt2d & uv, const TopoDS_Face & F);

		/****************** stuvF ******************/
		%feature("compactdefaultargs") stuvF;
		%feature("autodoc", "No available documentation.

Parameters
----------
uv: gp_Pnt2d
F: TopoDS_Face

Returns
-------
onU: int
onV: int
") stuvF;
		static void stuvF(const gp_Pnt2d & uv, const TopoDS_Face & F, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** tryNgApp ******************/
		%feature("compactdefaultargs") tryNgApp;
		%feature("autodoc", "No available documentation.

Parameters
----------
par: float
E: TopoDS_Edge
F: TopoDS_Face
tola: float
ng: gp_Dir

Returns
-------
bool
") tryNgApp;
		static Standard_Boolean tryNgApp(const Standard_Real par, const TopoDS_Edge & E, const TopoDS_Face & F, const Standard_Real tola, gp_Dir & ng);

		/****************** tryOriEinF ******************/
		%feature("compactdefaultargs") tryOriEinF;
		%feature("autodoc", "No available documentation.

Parameters
----------
par: float
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
int
") tryOriEinF;
		static Standard_Integer tryOriEinF(const Standard_Real par, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** tryTg2dApp ******************/
		%feature("compactdefaultargs") tryTg2dApp;
		%feature("autodoc", "No available documentation.

Parameters
----------
iv: int
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF
factor: float

Returns
-------
gp_Vec2d
") tryTg2dApp;
		static gp_Vec2d tryTg2dApp(const Standard_Integer iv, const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF, const Standard_Real factor);

		/****************** uvApp ******************/
		%feature("compactdefaultargs") uvApp;
		%feature("autodoc", "No available documentation.

Parameters
----------
f: TopoDS_Face
e: TopoDS_Edge
par: float
eps: float
uvapp: gp_Pnt2d

Returns
-------
bool
") uvApp;
		static Standard_Boolean uvApp(const TopoDS_Face & f, const TopoDS_Edge & e, const Standard_Real par, const Standard_Real eps, gp_Pnt2d & uvapp);

};


%extend TopOpeBRepTool_TOOL {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepTool_connexity *
*********************************/
class TopOpeBRepTool_connexity {
	public:
		/****************** TopOpeBRepTool_connexity ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_connexity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity();

		/****************** TopOpeBRepTool_connexity ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_connexity;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: TopoDS_Shape

Returns
-------
None
") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity(const TopoDS_Shape & Key);

		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
OriKey: int
Item: TopTools_ListOfShape

Returns
-------
None
") AddItem;
		void AddItem(const Standard_Integer OriKey, const TopTools_ListOfShape & Item);

		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
OriKey: int
Item: TopoDS_Shape

Returns
-------
None
") AddItem;
		void AddItem(const Standard_Integer OriKey, const TopoDS_Shape & Item);

		/****************** AllItems ******************/
		%feature("compactdefaultargs") AllItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
Item: TopTools_ListOfShape

Returns
-------
int
") AllItems;
		Standard_Integer AllItems(TopTools_ListOfShape & Item);

		/****************** ChangeItem ******************/
		%feature("compactdefaultargs") ChangeItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
OriKey: int

Returns
-------
TopTools_ListOfShape
") ChangeItem;
		TopTools_ListOfShape & ChangeItem(const Standard_Integer OriKey);

		/****************** IsFaulty ******************/
		%feature("compactdefaultargs") IsFaulty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsFaulty;
		Standard_Boolean IsFaulty();

		/****************** IsInternal ******************/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "No available documentation.

Parameters
----------
Item: TopTools_ListOfShape

Returns
-------
int
") IsInternal;
		Standard_Integer IsInternal(TopTools_ListOfShape & Item);

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "No available documentation.

Parameters
----------
OriKey: int
Item: TopTools_ListOfShape

Returns
-------
int
") Item;
		Standard_Integer Item(const Standard_Integer OriKey, TopTools_ListOfShape & Item);

		/****************** Key ******************/
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Key;
		const TopoDS_Shape Key();

		/****************** RemoveItem ******************/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
OriKey: int
Item: TopoDS_Shape

Returns
-------
bool
") RemoveItem;
		Standard_Boolean RemoveItem(const Standard_Integer OriKey, const TopoDS_Shape & Item);

		/****************** RemoveItem ******************/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
Item: TopoDS_Shape

Returns
-------
bool
") RemoveItem;
		Standard_Boolean RemoveItem(const TopoDS_Shape & Item);

		/****************** SetKey ******************/
		%feature("compactdefaultargs") SetKey;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: TopoDS_Shape

Returns
-------
None
") SetKey;
		void SetKey(const TopoDS_Shape & Key);

};


%extend TopOpeBRepTool_connexity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepTool_face *
****************************/
class TopOpeBRepTool_face {
	public:
		/****************** TopOpeBRepTool_face ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_face;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_face;
		 TopOpeBRepTool_face();

		/****************** Ffinite ******************/
		%feature("compactdefaultargs") Ffinite;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Ffinite;
		const TopoDS_Face Ffinite();

		/****************** Finite ******************/
		%feature("compactdefaultargs") Finite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Finite;
		Standard_Boolean Finite();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Wire
Fref: TopoDS_Face

Returns
-------
bool
") Init;
		Standard_Boolean Init(const TopoDS_Wire & W, const TopoDS_Face & Fref);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** RealF ******************/
		%feature("compactdefaultargs") RealF;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") RealF;
		TopoDS_Face RealF();

		/****************** W ******************/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Wire
") W;
		const TopoDS_Wire W();

};


%extend TopOpeBRepTool_face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopOpeBRepTool_makeTransition *
**************************************/
class TopOpeBRepTool_makeTransition {
	public:
		/****************** TopOpeBRepTool_makeTransition ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_makeTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_makeTransition;
		 TopOpeBRepTool_makeTransition();

		/****************** Getfactor ******************/
		%feature("compactdefaultargs") Getfactor;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Getfactor;
		Standard_Real Getfactor();

		/****************** HasRest ******************/
		%feature("compactdefaultargs") HasRest;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasRest;
		Standard_Boolean HasRest();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
pbef: float
paft: float
parE: float
FS: TopoDS_Face
uv: gp_Pnt2d
factor: float

Returns
-------
bool
") Initialize;
		Standard_Boolean Initialize(const TopoDS_Edge & E, const Standard_Real pbef, const Standard_Real paft, const Standard_Real parE, const TopoDS_Face & FS, const gp_Pnt2d & uv, const Standard_Real factor);

		/****************** IsT2d ******************/
		%feature("compactdefaultargs") IsT2d;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsT2d;
		Standard_Boolean IsT2d();

		/****************** MkT2donE ******************/
		%feature("compactdefaultargs") MkT2donE;
		%feature("autodoc", "No available documentation.

Parameters
----------
stb: TopAbs_State
sta: TopAbs_State

Returns
-------
bool
") MkT2donE;
		Standard_Boolean MkT2donE(TopAbs_State & stb, TopAbs_State & sta);

		/****************** MkT3dproj ******************/
		%feature("compactdefaultargs") MkT3dproj;
		%feature("autodoc", "No available documentation.

Parameters
----------
stb: TopAbs_State
sta: TopAbs_State

Returns
-------
bool
") MkT3dproj;
		Standard_Boolean MkT3dproj(TopAbs_State & stb, TopAbs_State & sta);

		/****************** MkT3onE ******************/
		%feature("compactdefaultargs") MkT3onE;
		%feature("autodoc", "No available documentation.

Parameters
----------
stb: TopAbs_State
sta: TopAbs_State

Returns
-------
bool
") MkT3onE;
		Standard_Boolean MkT3onE(TopAbs_State & stb, TopAbs_State & sta);

		/****************** MkTonE ******************/
		%feature("compactdefaultargs") MkTonE;
		%feature("autodoc", "No available documentation.

Parameters
----------
stb: TopAbs_State
sta: TopAbs_State

Returns
-------
bool
") MkTonE;
		Standard_Boolean MkTonE(TopAbs_State & stb, TopAbs_State & sta);

		/****************** SetRest ******************/
		%feature("compactdefaultargs") SetRest;
		%feature("autodoc", "No available documentation.

Parameters
----------
ES: TopoDS_Edge
parES: float

Returns
-------
bool
") SetRest;
		Standard_Boolean SetRest(const TopoDS_Edge & ES, const Standard_Real parES);

		/****************** Setfactor ******************/
		%feature("compactdefaultargs") Setfactor;
		%feature("autodoc", "No available documentation.

Parameters
----------
factor: float

Returns
-------
None
") Setfactor;
		void Setfactor(const Standard_Real factor);

};


%extend TopOpeBRepTool_makeTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepTool_mkTondgE *
********************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class TopOpeBRepTool_STATE:
	pass

@classnotwrapped
class TopOpeBRepTool_mkTondgE:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
