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
		/**** md5 signature: 85cef8033e6f3f391f1cb348a8b1612d ****/
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
		/**** md5 signature: a96806a934597f65e71d245166047f1a ****/
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
		/**** md5 signature: 3f09068948e5882f4cb7f9c6684a5042 ****/
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
		/**** md5 signature: 4b5734264542267cb9d454bd3f635384 ****/
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
		/**** md5 signature: f4cd016a0697e4e0011f0bc405e3dcdb ****/
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
		/**** md5 signature: 865107d9f8d87aa231aa88da75d2c6a3 ****/
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
		/**** md5 signature: d760e1a6c51babc77f97fae698ca63ed ****/
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
		/**** md5 signature: 4a0be17b313c18c4cdda59d805315ed1 ****/
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
		/**** md5 signature: 9a7443f967b9ed1734d3a25a3b67d496 ****/
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
		/**** md5 signature: 0dd0c04e6c3eeaea0bf0f2840789a3e5 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_BoxSort;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort();

		/****************** TopOpeBRepTool_BoxSort ******************/
		/**** md5 signature: 321425f5c2c97b02ed7f0803784241ec ****/
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
		/**** md5 signature: 2cd1fa34a8ea0fb980853741a96d2b9f ****/
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
		/**** md5 signature: a07ac8ca368d90fd9dd48b88e87007c7 ****/
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
		/**** md5 signature: 37e6d08d3ed2136fa02c2d0d74d16b61 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Compare ******************/
		/**** md5 signature: a96c5a65ae32dd4c3cc230da0eb73a81 ****/
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
		/**** md5 signature: 57b51f88b586ea3ddcd154fd687bbbac ****/
		%feature("compactdefaultargs") HAB;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Bnd_HArray1OfBox>
") HAB;
		const opencascade::handle<Bnd_HArray1OfBox> & HAB();

		/****************** HABShape ******************/
		/**** md5 signature: 38eaa0d53259f858b8967867cfe3ee14 ****/
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
		/**** md5 signature: 3467f45d288ab6fb370eee9ae14e9e4b ****/
		%feature("compactdefaultargs") HBoxTool;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepTool_HBoxTool>
") HBoxTool;
		const opencascade::handle<TopOpeBRepTool_HBoxTool> & HBoxTool();

		/****************** MakeCOB ******************/
		/**** md5 signature: 0ea54cdb22f74ba0ae5f56fa343a4e66 ****/
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
		/**** md5 signature: 0e2e8fd68158d128e3ec8266a0c08a5c ****/
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
		/**** md5 signature: bde81cdf056af255d42d1118671fba00 ****/
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
		/**** md5 signature: 521c0737b950ca27bae0cffc56a3fb1f ****/
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
		/**** md5 signature: 6ddb85bb3aec3cd838112714ab427bd9 ****/
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
		/**** md5 signature: b2fe262a969a325fd07f373186357860 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_C2DF;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF();

		/****************** TopOpeBRepTool_C2DF ******************/
		/**** md5 signature: c18fcd93ba72a14c534d146df0a8d092 ****/
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
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** IsFace ******************/
		/**** md5 signature: c8b2f8c363a6edf51ddcd9625147974e ****/
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
		/**** md5 signature: 76b9f04fd5d9444b03b81ba0ddb21a17 ****/
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
		/**** md5 signature: 7a059fdc8618508c375af9278e96d859 ****/
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
		/**** md5 signature: 9e665fdaf60532a860d6b82abd61fc4e ****/
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
		/**** md5 signature: a2a10397bc3afdc85489deaa9001794c ****/
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
		/**** md5 signature: 2696063af1ee55f62b5a4848765af587 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_CLASSI;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_CLASSI;
		 TopOpeBRepTool_CLASSI();

		/****************** Add2d ******************/
		/**** md5 signature: ba9897f90bdd1d90365795f3b32df0dc ****/
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
		/**** md5 signature: da9d7b5df9208bc7763aa7009b4934f2 ****/
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
		/**** md5 signature: 535033dcb290eabb6f96d4af745b1115 ****/
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
		/**** md5 signature: d19f28cace265dc52586b77fbc802b0e ****/
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
		/**** md5 signature: 127a4f64600e693e3202a8629a4d876b ****/
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
		/**** md5 signature: 90195f4317ecad5dc698cca1f66de489 ****/
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
		/**** md5 signature: fe84e6cfa90ba1276e2b8639508a1c46 ****/
		%feature("compactdefaultargs") HasInit2d;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasInit2d;
		Standard_Boolean HasInit2d();

		/****************** Init2d ******************/
		/**** md5 signature: c377d9ad7bcd8bfc9fdb057883151a80 ****/
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
		/**** md5 signature: 4d7c93df93c996da1079d30064fb7316 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_CORRISO;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO();

		/****************** TopOpeBRepTool_CORRISO ******************/
		/**** md5 signature: 66dbf04868a4dd0e4ce51ceaee9f762a ****/
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
		/**** md5 signature: 53212a0341d6722289e4388ef9ff1c95 ****/
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
		/**** md5 signature: 2f28821bbc74f6c7af68b25f8c08fcfb ****/
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
		/**** md5 signature: 2e01c8e916beb2a4a9432f48e8175c6d ****/
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
		/**** md5 signature: c7540c6070192b28dce6afad4ddb27bd ****/
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
		/**** md5 signature: 9e6560d82805ace1097b2204864f5ae2 ****/
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
		/**** md5 signature: cdcb860a581614e4d0fac9e4d27ee538 ****/
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
		/**** md5 signature: ff21cd7e0d7f5ca1f85cb8f9c3f01980 ****/
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
		/**** md5 signature: 5b7cf28ede6fc30cef6a776d8d953f6a ****/
		%feature("compactdefaultargs") Eds;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") Eds;
		const TopTools_ListOfShape & Eds();

		/****************** Fref ******************/
		/**** md5 signature: 733abf9bb1c22efd3a5f2a93983dadc2 ****/
		%feature("compactdefaultargs") Fref;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Fref;
		const TopoDS_Face Fref();

		/****************** GASref ******************/
		/**** md5 signature: 09ffa8c57f9ac38cacd0782120dd4043 ****/
		%feature("compactdefaultargs") GASref;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAdaptor_Surface
") GASref;
		const GeomAdaptor_Surface & GASref();

		/****************** GetnewS ******************/
		/**** md5 signature: 1028993659225ad8087e09930d5f8d97 ****/
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
		/**** md5 signature: 7bb40f721e74938a50980f5d4c6181e9 ****/
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
		/**** md5 signature: a239655054f16495caaffa4062d5bd7f ****/
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
		/**** md5 signature: 4e203e89be08ed398632e35d6d70e329 ****/
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
		/**** md5 signature: 104cb0dcb6767a5b5b1687accb204cf4 ****/
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
		/**** md5 signature: 049ce2b58b0c290e443940bdecc2abf8 ****/
		%feature("compactdefaultargs") S;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") S;
		const TopoDS_Shape S();

		/****************** SetConnexity ******************/
		/**** md5 signature: b565a486de7861bc7f16cd99e51e2a20 ****/
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
		/**** md5 signature: 607c0de76260096103e3889e59ea4e5f ****/
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
		/**** md5 signature: 468ad068355499fbea745bf803204733 ****/
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
		/**** md5 signature: 88413f7b29df335e32d077e9ddd7dc85 ****/
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
		/**** md5 signature: 6d93bab04303399b6d4e1401fc193edf ****/
		%feature("compactdefaultargs") UVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") UVClosed;
		Standard_Boolean UVClosed();

		/****************** UVRep ******************/
		/**** md5 signature: 993296b43d4b341a64d6069d4f69b239 ****/
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
		/**** md5 signature: 4b31861c3524f7ab85cdc35225868e46 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_CurveTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool();

		/****************** TopOpeBRepTool_CurveTool ******************/
		/**** md5 signature: 1115c08356cccfcce6eac601f58a143a ****/
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
		/**** md5 signature: 98672ff406116cb80fd96749d7558135 ****/
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
		/**** md5 signature: ec177d99f76bb4ed7e436f53436adf03 ****/
		%feature("compactdefaultargs") ChangeGeomTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_GeomTool
") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool();

		/****************** GetGeomTool ******************/
		/**** md5 signature: 6b33ef83138f718a68f748ea1ea7a345 ****/
		%feature("compactdefaultargs") GetGeomTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_GeomTool
") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool();

		/****************** IsProjectable ******************/
		/**** md5 signature: 36e4eef298a71cba9d9ea9e3ef462568 ****/
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
		/**** md5 signature: 33c44e8405512156caf9d55f28a73eb6 ****/
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
		/**** md5 signature: 1944d9b07beaffaa170bf1f59932a3f2 ****/
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
		/**** md5 signature: 9ef689ecf21715c98a64e1be405fe583 ****/
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
		/**** md5 signature: 8d734cb4073b7b1a90dc7b21986ee47e ****/
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
		/**** md5 signature: 041b33c42bdef202df315ff4480a908a ****/
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
		/**** md5 signature: 1cfc31eed760cc0d132ba241c8ce8e4a ****/
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
		/**** md5 signature: d76ba44d4c0d9554fdf47f67049f8da0 ****/
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
		/**** md5 signature: 8084c179e24e67079a00b4a173ee9313 ****/
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
		/**** md5 signature: f5abad97fb8ff03cd2b7955c20acd767 ****/
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
		/**** md5 signature: 18584eb261816370021ae75041e9f83a ****/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Returns the number of vertices candidate to be removed.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Using map of list of connex edges, fuse each list to one edge and then update myshape.

Returns
-------
None
") Perform;
		void Perform();

		/****************** ResultEdges ******************/
		/**** md5 signature: c473d3c90614f31ceb4528d8ba7addb5 ****/
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
		/**** md5 signature: 4968b0e4669317ad9b7893680ac9a219 ****/
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
		/**** md5 signature: d01b8c142cf19541362d859895914ada ****/
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
		/**** md5 signature: 40681220558ee3b5bd19c07df18c1a44 ****/
		%feature("compactdefaultargs") CompC3D;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CompC3D;
		Standard_Boolean CompC3D();

		/****************** CompPC1 ******************/
		/**** md5 signature: 3678feec1ba0ab6d2d54174ccd579de1 ****/
		%feature("compactdefaultargs") CompPC1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CompPC1;
		Standard_Boolean CompPC1();

		/****************** CompPC2 ******************/
		/**** md5 signature: 8574b52039878e7d352a56db32d0fc8c ****/
		%feature("compactdefaultargs") CompPC2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CompPC2;
		Standard_Boolean CompPC2();

		/****************** Define ******************/
		/**** md5 signature: 1a2ca1d83d0c076b07598cd82d5b88a6 ****/
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
		/**** md5 signature: 364ff9869dfc5bf11a46c0e3b44f54e0 ****/
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
		/**** md5 signature: 2430aa4868f376222f9a04a80291e246 ****/
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
		/**** md5 signature: 3452faf24c6e0480ca702e40b2c1dd1b ****/
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
		/**** md5 signature: 3330a75772c161486eea234727069ee2 ****/
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
		/**** md5 signature: ceaf89b140c61b3ec41f059b2d935fd4 ****/
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
		/**** md5 signature: b18e674cbe44aec53e449b968d1c2176 ****/
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
		/**** md5 signature: d609e3033852ad8f0a24921f95b73adc ****/
		%feature("compactdefaultargs") NbPntMax;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPntMax;
		Standard_Integer NbPntMax();

		/****************** SetNbPntMax ******************/
		/**** md5 signature: 0a5bb405f6833e24e46a363db5bed120 ****/
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
		/**** md5 signature: 339458fe96b2ad7d34024acfdbfca9b1 ****/
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
		/**** md5 signature: 58f2faab50d53cccd7f6b68b3426821c ****/
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
		/**** md5 signature: 010ed1b1ed60b7eef0bc288a16322d85 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_HBoxTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_HBoxTool;
		 TopOpeBRepTool_HBoxTool();

		/****************** AddBox ******************/
		/**** md5 signature: f62a76bf7368433197fa671688d05a44 ****/
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
		/**** md5 signature: 2cd1fa34a8ea0fb980853741a96d2b9f ****/
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
		/**** md5 signature: af249e0e9bb7d1be028515317ec98922 ****/
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
		/**** md5 signature: 7ab565390775fcf668de23937e770659 ****/
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
		/**** md5 signature: 0b4c9265ecef95f1bf800b263ddbe0cb ****/
		%feature("compactdefaultargs") ChangeIMS;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_IndexedDataMapOfShapeBox
") ChangeIMS;
		TopOpeBRepTool_IndexedDataMapOfShapeBox & ChangeIMS();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ComputeBox ******************/
		/**** md5 signature: 3539ff63be7c96e193dd6d5231f309b3 ****/
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
		/**** md5 signature: dcccc48162c0d679a533058de4d94922 ****/
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
		/**** md5 signature: ebd878e0fd3870d4ce9053793e066c55 ****/
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
		/**** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** HasBox ******************/
		/**** md5 signature: 7a957fa764c8901e8091cc88a06918b5 ****/
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
		/**** md5 signature: b45998d59ac0fac07c8b4210f92a2541 ****/
		%feature("compactdefaultargs") IMS;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_IndexedDataMapOfShapeBox
") IMS;
		const TopOpeBRepTool_IndexedDataMapOfShapeBox & IMS();

		/****************** Index ******************/
		/**** md5 signature: 9e94bb6d7b4221be4165f8639cd27d92 ****/
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
		/**** md5 signature: 243b850f6d21a0fba84095c942dbd917 ****/
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
		/**** md5 signature: 3e1d4dab936a6fdd4d9981d1644db7ad ****/
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
		/**** md5 signature: 687bf433db6c89ba516ef3a7cfa0195c ****/
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
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns false if the list of internal edges has not been extracted.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the number of edges candidate to be removed.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Using the list of internal edge from each face, rebuild myshape by removing thoses edges.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Shape ******************/
		/**** md5 signature: 4968b0e4669317ad9b7893680ac9a219 ****/
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
		/**** md5 signature: e017f2b3ab04ea7a21c6d4f4cd09c5a7 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_REGUS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_REGUS;
		 TopOpeBRepTool_REGUS();

		/****************** GetFsplits ******************/
		/**** md5 signature: 844b9c43737fc228c688485661112d69 ****/
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
		/**** md5 signature: 5967855cd372594a93960679dbafd060 ****/
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
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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
		/**** md5 signature: 90379730ba21583365bb0303180dd0a2 ****/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") InitBlock;
		Standard_Boolean InitBlock();

		/****************** MapS ******************/
		/**** md5 signature: 1af19920146b7bc2ae285cdcf05ea017 ****/
		%feature("compactdefaultargs") MapS;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MapS;
		Standard_Boolean MapS();

		/****************** NearestF ******************/
		/**** md5 signature: a322f0d1cc525aa328f7c8d5fcc17ea6 ****/
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
		/**** md5 signature: 599d6ab854924787d5fac7998d2f8209 ****/
		%feature("compactdefaultargs") NextinBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") NextinBlock;
		Standard_Boolean NextinBlock();

		/****************** REGU ******************/
		/**** md5 signature: ceb9ceb1ae21cde29ffc9ecbc5b05359 ****/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") REGU;
		Standard_Boolean REGU();

		/****************** S ******************/
		/**** md5 signature: 049ce2b58b0c290e443940bdecc2abf8 ****/
		%feature("compactdefaultargs") S;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") S;
		const TopoDS_Shape S();

		/****************** SetFsplits ******************/
		/**** md5 signature: e4c5fd90a880976ef722cb904d6ba8d6 ****/
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
		/**** md5 signature: 4b61fe16eca2b5c04d502b44dfd596a0 ****/
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
		/**** md5 signature: eb3bcc42fa4abd728b270a23269c18f4 ****/
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
		/**** md5 signature: 32e6943186fe813d3ecaa24db698feac ****/
		%feature("compactdefaultargs") SplitFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SplitFaces;
		Standard_Boolean SplitFaces();

		/****************** WireToFace ******************/
		/**** md5 signature: 4d2720640aa667fff62c3c8698ea76bf ****/
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
		/**** md5 signature: a774ddde07931dfe6b1a1cf5dbcc8068 ****/
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
		/**** md5 signature: 6322a95a68aa32de420cf66f8e840b5f ****/
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
		/**** md5 signature: 2e43eb3f6dc500370b32d833be11a49e ****/
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
		/**** md5 signature: 733abf9bb1c22efd3a5f2a93983dadc2 ****/
		%feature("compactdefaultargs") Fref;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Fref;
		const TopoDS_Face Fref();

		/****************** GetEsplits ******************/
		/**** md5 signature: 5b1696e94a15609b83f470d5e03e17f0 ****/
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
		/**** md5 signature: 627d61573571ef559061a1dd0805bd5a ****/
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
		/**** md5 signature: 5b5800106400dd759bb1f7cd2b273b70 ****/
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
		/**** md5 signature: c78b587d4171014ca73e99d370a25bbe ****/
		%feature("compactdefaultargs") HasInit;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasInit;
		Standard_Boolean HasInit();

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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
		/**** md5 signature: 90379730ba21583365bb0303180dd0a2 ****/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") InitBlock;
		Standard_Boolean InitBlock();

		/****************** MapS ******************/
		/**** md5 signature: 1af19920146b7bc2ae285cdcf05ea017 ****/
		%feature("compactdefaultargs") MapS;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MapS;
		Standard_Boolean MapS();

		/****************** NearestE ******************/
		/**** md5 signature: 211a2dd0aff24953b381ba8c7e98c522 ****/
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
		/**** md5 signature: 599d6ab854924787d5fac7998d2f8209 ****/
		%feature("compactdefaultargs") NextinBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") NextinBlock;
		Standard_Boolean NextinBlock();

		/****************** REGU ******************/
		/**** md5 signature: 5add4d95f53cd7004021b2f66c994627 ****/
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
		/**** md5 signature: ceb9ceb1ae21cde29ffc9ecbc5b05359 ****/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") REGU;
		Standard_Boolean REGU();

		/****************** RemoveOldConnexity ******************/
		/**** md5 signature: 59cb1cde5bae8e60c997a3dabaa7e8c1 ****/
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
		/**** md5 signature: 049ce2b58b0c290e443940bdecc2abf8 ****/
		%feature("compactdefaultargs") S;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") S;
		const TopoDS_Shape S();

		/****************** SetEsplits ******************/
		/**** md5 signature: 9b33fdbd118749d1bb7b2b3acbc3bda8 ****/
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
		/**** md5 signature: 0172dd89f1fe65f7a30898a5003596f0 ****/
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
		/**** md5 signature: ec2fff92d4f60ca1001eb1a7dcdf4b8f ****/
		%feature("compactdefaultargs") SplitEds;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SplitEds;
		Standard_Boolean SplitEds();

		/****************** UpdateMultiple ******************/
		/**** md5 signature: 4aedffc7cefe22b28f7a2e2c1e8bf248 ****/
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
		/**** md5 signature: 47e475c851fcc8aa1d1347869ef44b42 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier();

		/****************** TopOpeBRepTool_ShapeClassifier ******************/
		/**** md5 signature: 1dcf48988991006ebda6b0b8481c987e ****/
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
		/**** md5 signature: 8c12af5c190e314233212ab057f4d330 ****/
		%feature("compactdefaultargs") ChangeSolidClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_SolidClassifier
") ChangeSolidClassifier;
		TopOpeBRepTool_SolidClassifier & ChangeSolidClassifier();

		/****************** ClearAll ******************/
		/**** md5 signature: 5be75d83899bbdded2f36544edffc69b ****/
		%feature("compactdefaultargs") ClearAll;
		%feature("autodoc", "Reset all internal data (solidclassifier included).

Returns
-------
None
") ClearAll;
		void ClearAll();

		/****************** ClearCurrent ******************/
		/**** md5 signature: 49324106cdcd23dcc0ac32a86ee1cb05 ****/
		%feature("compactdefaultargs") ClearCurrent;
		%feature("autodoc", "Reset all internal data (except solidclassified).

Returns
-------
None
") ClearCurrent;
		void ClearCurrent();

		/****************** P2D ******************/
		/**** md5 signature: 5a707cfd998e370ce557a93ff46a6d9d ****/
		%feature("compactdefaultargs") P2D;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") P2D;
		const gp_Pnt2d P2D();

		/****************** P3D ******************/
		/**** md5 signature: b5b7e58c88b66f972f71a47a2651d80d ****/
		%feature("compactdefaultargs") P3D;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") P3D;
		const gp_Pnt P3D();

		/****************** SameDomain ******************/
		/**** md5 signature: d5b1d3fad5490e5e3c5b25bfb9c1ca82 ****/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SameDomain;
		Standard_Integer SameDomain();

		/****************** SameDomain ******************/
		/**** md5 signature: 25520a8e3d8102ad77060502cb9c9ed1 ****/
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
		/**** md5 signature: f2cedcd357511023da2cb1b7f5da9644 ****/
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
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return field mystate.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

		/****************** StateP2DReference ******************/
		/**** md5 signature: 4e46d91b3871c3f356e03dc2232a3f46 ****/
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
		/**** md5 signature: 975293f5c8dbedcfea4301225508e5fc ****/
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
		/**** md5 signature: 21275217b285152340efe576bdf6e98b ****/
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
		/**** md5 signature: 539dc2bd0e65d0b7433a78853b5d0784 ****/
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
		/**** md5 signature: fb64a2e8acba6c2562ff8bf875acba08 ****/
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
		/**** md5 signature: 18821ac5fc4ff711b33a9f2fd0875739 ****/
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
		/**** md5 signature: 01f8acc6bc763ab47ed4fc86c9290f60 ****/
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
		/**** md5 signature: d28ec3a269705b3d2788cbb540c525f1 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeExplorer;
		%feature("autodoc", "Creates an empty explorer, becomes usefull after init.

Returns
-------
None
") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer();

		/****************** TopOpeBRepTool_ShapeExplorer ******************/
		/**** md5 signature: 840772ab2f0f6c2524995886174d9288 ****/
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
		/**** md5 signature: 0be2d384cf83d16771bb3f9c857c6326 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Index of current sub-shape.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Init ******************/
		/**** md5 signature: 8826aacd703d41bf1b9e9fe36f73edb5 ****/
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
		/**** md5 signature: 1201a55f750036045cd397a65f07fc7d ****/
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
		/**** md5 signature: 41bcb4e57dc28b5f5437e0900ab4acb9 ****/
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
		/**** md5 signature: 18370617682da3b284ec43bb56c1297c ****/
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
		/**** md5 signature: 3894bc6644bb3b9bada8d485645b9c1a ****/
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
		/**** md5 signature: 6b33c26587fb578ad92297a1733699fc ****/
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
		/**** md5 signature: 5d77135684c3fabd15965df3bc855017 ****/
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
		/**** md5 signature: 3b8ea13bf165f42e4e92ae659707a9b1 ****/
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
		/**** md5 signature: 19797c101ba1f31a7200659db9a946e4 ****/
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
		/**** md5 signature: 7949890efd5bb7e702b4a07079dd1fda ****/
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
		/**** md5 signature: b600ee85939b85c4a4a80d31c2cb3aad ****/
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
		/**** md5 signature: f4c046df1ea96e4eab999157f27935e6 ****/
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
		/**** md5 signature: 13c31c9844cc300fe33d87893b42177c ****/
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
		/**** md5 signature: 97d557248bb79c234cf3b66e72057226 ****/
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
		/**** md5 signature: 3acf1ba14d36c8ae249fce7024949728 ****/
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
		/**** md5 signature: 1e4ab31f7ec052b9d44f03d2c2ff2830 ****/
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
		/**** md5 signature: 822ca59ea53e10a35a138b7ab0e87920 ****/
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
		/**** md5 signature: 060ab3240e763ff9deca7358d4f049a8 ****/
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
		/**** md5 signature: adc23d94c5cfda98ee592b13b8ac9f54 ****/
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
		/**** md5 signature: 1774142272116a126a4487f3c75046f6 ****/
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
		/**** md5 signature: c23e10c40a09ee0221e59102aebc29e7 ****/
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
		/**** md5 signature: 67b96879aad45cc1466e0e43d1c5d14a ****/
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
		/**** md5 signature: 06dac66867e53b145380e1cb501436cf ****/
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
		/**** md5 signature: c57f844e7083f36b7b1deea19d8ce61d ****/
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
		/**** md5 signature: 4efcf0a71fcdab6bf54f1d32c1be059c ****/
		%feature("compactdefaultargs") TopOpeBRepTool_SolidClassifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_SolidClassifier;
		 TopOpeBRepTool_SolidClassifier();

		/****************** Classify ******************/
		/**** md5 signature: 2df1deb61308951b8385a78c42c032cb ****/
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
		/**** md5 signature: f55a91007adbb8cc2b9fce8b6045cdcd ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** LoadShell ******************/
		/**** md5 signature: b5911871a5a06deb53507c87e0d033ad ****/
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
		/**** md5 signature: 9652e6ee4594196093792bd38627a2ce ****/
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
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
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
		/**** md5 signature: 19c3955778583acbdd48b8dc78a75944 ****/
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
		/**** md5 signature: dba03fb1a1ade00a9a9d530ba5d98808 ****/
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
		/**** md5 signature: 175da19eaac43d80668908f1e2e31859 ****/
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
		/**** md5 signature: e59b013c0afe5329c6d088fce8603969 ****/
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
		/**** md5 signature: eeaef4fe63af1f781d99831b2e298bf0 ****/
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
		/**** md5 signature: e6d4d00c8ecf0de0cab9691a90e68493 ****/
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
		/**** md5 signature: 95b39091c8c2894fc2b661022e2bce5f ****/
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
		/**** md5 signature: b1deb72133a371dcd0c8e2f71ea1743c ****/
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
		/**** md5 signature: f56f64c9b8428ec58da2dc005cada15f ****/
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
		/**** md5 signature: 3b269eea6d6e1a73695a621ec63192a1 ****/
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
		/**** md5 signature: e6c5119cc1926899ad5acf3967fd39f9 ****/
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
		/**** md5 signature: a2eb28589389ea616cce2ee1fe51ca1c ****/
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
		/**** md5 signature: 5e633f7781088c6725c02ffee6d6d6f0 ****/
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
		/**** md5 signature: ae26f7312aaa31bd6e2f415e1946f9af ****/
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
		/**** md5 signature: bf01ef73c717f1f4b320755a85697148 ****/
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
		/**** md5 signature: 957f4cbdc37297cbb7e50232e8826db6 ****/
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
		/**** md5 signature: 7e6178798d5e1c67a22e1dc2efdb2bab ****/
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
		/**** md5 signature: 1c21759d1ac9f42b549e2878e1cd7144 ****/
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
		/**** md5 signature: ae5616b046c3d5483d998f0165fe64a1 ****/
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
		/**** md5 signature: f69b51fc56af2bc0f57dd022eadb634a ****/
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
		/**** md5 signature: 111d400c8b7c52ef123ad0b4c3e772d3 ****/
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
		/**** md5 signature: eefbc198930a2945348fffbaa6164988 ****/
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
		/**** md5 signature: b4eebb873cfda587d3871a09c7bd7e93 ****/
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
		/**** md5 signature: d8654d13b34ce01eb6a0205edd9a1fdd ****/
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
		/**** md5 signature: f5c2d35a824e09a217f98bfc586237b8 ****/
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
		/**** md5 signature: b6140c8dece2c36b9aecb34b74ea835c ****/
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
		/**** md5 signature: af78713bc95e3e068d734d674de43e2c ****/
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
		/**** md5 signature: 251bd30dc2be563f4ba1ab85f347b815 ****/
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
		/**** md5 signature: 59f8eb981c9a9971548d25034b9baf4c ****/
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
		/**** md5 signature: 8d1afe5a2f98d61f5c9fbc636c41a588 ****/
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
		/**** md5 signature: daa86325679f80363d6069d34ea6e2d9 ****/
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
		/**** md5 signature: 6da7e11fb763d1194c88845292765b53 ****/
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
		/**** md5 signature: f43200aadaa7f55e2213c624b55d9e9a ****/
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
		/**** md5 signature: f02f01248a071870bd70ac4b1df329c3 ****/
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
		/**** md5 signature: 6302c8730bc64421dd6562f3cf60f781 ****/
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
		/**** md5 signature: 432ec3be21d5e35dd993ec4256a53aba ****/
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
		/**** md5 signature: f00a0865f6f7815aafd23315a1bdb60e ****/
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
		/**** md5 signature: 48e6ccb205628916330fc3e63633e5fd ****/
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
		/**** md5 signature: 936807ce29ed9679ea583a0d926daedc ****/
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
		/**** md5 signature: 9cf77ed17a4ce47bcc986cc089baaa04 ****/
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
		/**** md5 signature: 85f19a7afffc658abfe22449fa119995 ****/
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
		/**** md5 signature: eee22cf05889f8de6db4536b859e25ee ****/
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
		/**** md5 signature: 9b29262143d153ddc2988aa4005cf6cb ****/
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
		/**** md5 signature: 341bc41f4c0dc9c551d1008ef50fdd44 ****/
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
		/**** md5 signature: f5f1ad790d65b9ce4e9bb71f37d3a429 ****/
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
		/**** md5 signature: ba2b2e423747368601e36bb4348bcd3c ****/
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
		/**** md5 signature: 4f7828ff22f2a54087691ec542a848e0 ****/
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
		/**** md5 signature: 7313e43db0992aaa9450223669434d89 ****/
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
		/**** md5 signature: 88ebffcf8577e8a66811a636f24874ca ****/
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
		/**** md5 signature: 1b0a550169b81219c40456ad20314c7c ****/
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
		/**** md5 signature: 985f983dedcd8acb2a69335690eec606 ****/
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
		/**** md5 signature: 82779199eada3d9b1107306add1ef428 ****/
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
		/**** md5 signature: b4b106229fc17200eab299345ed07526 ****/
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
		/**** md5 signature: 211eb4e61da26c627ba1130ba5586230 ****/
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
		/**** md5 signature: 42da8153f349ff3b0275ec2b14477fa6 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_connexity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity();

		/****************** TopOpeBRepTool_connexity ******************/
		/**** md5 signature: a158b6669991caea8a5380d5780cc4f2 ****/
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
		/**** md5 signature: ba7b2d859a60cd84ca633a5a0fd473ac ****/
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
		/**** md5 signature: 88ea9446993ae6ad747eb05cbebf3344 ****/
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
		/**** md5 signature: 65f47013ada687f1b3dfb3815c667702 ****/
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
		/**** md5 signature: 56b357a90405cc0cd4281427da804676 ****/
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
		/**** md5 signature: bf2f339702c735676fd194adb8d144e7 ****/
		%feature("compactdefaultargs") IsFaulty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsFaulty;
		Standard_Boolean IsFaulty();

		/****************** IsInternal ******************/
		/**** md5 signature: c3f02e348d92ee17df757ed608ecc877 ****/
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
		/**** md5 signature: d5ff9ea3f75ee3e6e0efda5814b9e44e ****/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****************** Item ******************/
		/**** md5 signature: c2167caea9712bae0a3832faccdb7d44 ****/
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
		/**** md5 signature: c7bbdf014250e7fdf336ffffdd980713 ****/
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Key;
		const TopoDS_Shape Key();

		/****************** RemoveItem ******************/
		/**** md5 signature: 3f293909bf050d4feea293647a9cebb4 ****/
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
		/**** md5 signature: d9a4a037df4d0b1e5e65da0a8b7f9bbb ****/
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
		/**** md5 signature: d15adeac661de401d61ca8c535e02537 ****/
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
		/**** md5 signature: c4e6b2239c6683d4564a2bedb9011878 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_face;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_face;
		 TopOpeBRepTool_face();

		/****************** Ffinite ******************/
		/**** md5 signature: 2f5b2c65ca62a0569db1dcbaccdb66ce ****/
		%feature("compactdefaultargs") Ffinite;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Ffinite;
		const TopoDS_Face Ffinite();

		/****************** Finite ******************/
		/**** md5 signature: 03be9a7fe7c55f493438efb633d6f01d ****/
		%feature("compactdefaultargs") Finite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Finite;
		Standard_Boolean Finite();

		/****************** Init ******************/
		/**** md5 signature: d6c213113bc51bee64853ea6105be91b ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** RealF ******************/
		/**** md5 signature: 74e4826dc638209b6f2bd12e098e5c26 ****/
		%feature("compactdefaultargs") RealF;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") RealF;
		TopoDS_Face RealF();

		/****************** W ******************/
		/**** md5 signature: 038e666ee840fa85a4f62ad880400775 ****/
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
		/**** md5 signature: 4361e0a8aa5133248f58328f09615204 ****/
		%feature("compactdefaultargs") TopOpeBRepTool_makeTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepTool_makeTransition;
		 TopOpeBRepTool_makeTransition();

		/****************** Getfactor ******************/
		/**** md5 signature: 1828f68bf4f04801b4bda7da7e5e0093 ****/
		%feature("compactdefaultargs") Getfactor;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Getfactor;
		Standard_Real Getfactor();

		/****************** HasRest ******************/
		/**** md5 signature: 4cfbb6555bc020d7a24bcc4c3777d657 ****/
		%feature("compactdefaultargs") HasRest;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasRest;
		Standard_Boolean HasRest();

		/****************** Initialize ******************/
		/**** md5 signature: 7f21b3b7ebc6d8d8dbbdd08680928295 ****/
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
		/**** md5 signature: a4cb2022d4117c56f82cab4e584a5353 ****/
		%feature("compactdefaultargs") IsT2d;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsT2d;
		Standard_Boolean IsT2d();

		/****************** MkT2donE ******************/
		/**** md5 signature: 6a09a4aab4609f6db8e37033bf28490a ****/
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
		/**** md5 signature: 68012640242489ad984fee9c261695a4 ****/
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
		/**** md5 signature: 9cc4d2c89c6a39036b825ee178bbab15 ****/
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
		/**** md5 signature: 6cdb2b05d8ba4be20425b28835a6aeb5 ****/
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
		/**** md5 signature: 370455842d64ac60659e9621012e9701 ****/
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
		/**** md5 signature: be3c472504c350d4b188d276e24584b8 ****/
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
