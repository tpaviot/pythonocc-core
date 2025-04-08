/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_topopebreptool.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
%template(TopOpeBRepTool_DataMapOfOrientedShapeC2DF) NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_C2DF>;
%template(TopOpeBRepTool_DataMapOfShapeListOfC2DF) NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_ListOfC2DF,TopTools_ShapeMapHasher>;
%template(TopOpeBRepTool_DataMapOfShapeface) NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_face,TopTools_ShapeMapHasher>;
%template(TopOpeBRepTool_IndexedDataMapOfShapeBox) NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box>;
%template(TopOpeBRepTool_IndexedDataMapOfShapeBox2d) NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box2d>;
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
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_C2DF>::Iterator TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_ListOfC2DF, TopTools_ShapeMapHasher>::Iterator TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_face, TopTools_ShapeMapHasher>::Iterator TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_C2DF> TopOpeBRepTool_DataMapOfOrientedShapeC2DF;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_ListOfC2DF, TopTools_ShapeMapHasher> TopOpeBRepTool_DataMapOfShapeListOfC2DF;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepTool_face, TopTools_ShapeMapHasher> TopOpeBRepTool_DataMapOfShapeface;
typedef NCollection_IndexedDataMap<TopoDS_Shape, Bnd_Box> TopOpeBRepTool_IndexedDataMapOfShapeBox;
typedef NCollection_IndexedDataMap<TopoDS_Shape, Bnd_Box2d> TopOpeBRepTool_IndexedDataMapOfShapeBox2d;
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
		/****** TopOpeBRepTool::CorrectONUVISO ******/
		/****** md5 signature: 85cef8033e6f3f391f1cb348a8b1612d ******/
		%feature("compactdefaultargs") CorrectONUVISO;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Fsp: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") CorrectONUVISO;
		static Standard_Boolean CorrectONUVISO(const TopoDS_Face & F, TopoDS_Face & Fsp);

		/****** TopOpeBRepTool::MakeFaces ******/
		/****** md5 signature: a96806a934597f65e71d245166047f1a ******/
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
LOF: TopTools_ListOfShape
MshNOK: TopTools_IndexedMapOfOrientedShape
LOFF: TopTools_ListOfShape

Return
-------
bool

Description
-----------
Builds up the correct list of faces <LOFF> from <LOF>, using faulty shapes from map <MshNOK>. <LOF> is the list of <F>'s descendant faces. returns false if building fails.
") MakeFaces;
		static Standard_Boolean MakeFaces(const TopoDS_Face & F, const TopTools_ListOfShape & LOF, const TopTools_IndexedMapOfOrientedShape & MshNOK, TopTools_ListOfShape & LOFF);

		/****** TopOpeBRepTool::Print ******/
		/****** md5 signature: f7153ca19881868c1f5cfcc1057b3413 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
OCT: TopOpeBRepTool_OutCurveType

Return
-------
S: Standard_OStream

Description
-----------
Prints <OCT> as string on stream <S>; returns <S>.
") Print;
		static Standard_OStream & Print(const TopOpeBRepTool_OutCurveType OCT, std::ostream &OutValue);

		/****** TopOpeBRepTool::PurgeClosingEdges ******/
		/****** md5 signature: 3f09068948e5882f4cb7f9c6684a5042 ******/
		%feature("compactdefaultargs") PurgeClosingEdges;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
FF: TopoDS_Face
MWisOld: TopTools_DataMapOfShapeInteger
MshNOK: TopTools_IndexedMapOfOrientedShape

Return
-------
bool

Description
-----------
Fuse edges (in a wire) of a shape where we have useless vertex. In case face <FF> is built on UV-non-connexed wires (with the two closing edges FORWARD and REVERSED, in spite of one only), we find out the faulty edge, add the faulty shapes (edge,wire,face) to <MshNOK>. <FF> is a face descendant of <F>. <MWisOld>(wire) = 1 if wire is wire of <F> 0 wire results from <F>'s wire split. returns false if purge fails.
") PurgeClosingEdges;
		static Standard_Boolean PurgeClosingEdges(const TopoDS_Face & F, const TopoDS_Face & FF, const TopTools_DataMapOfShapeInteger & MWisOld, TopTools_IndexedMapOfOrientedShape & MshNOK);

		/****** TopOpeBRepTool::PurgeClosingEdges ******/
		/****** md5 signature: 4b5734264542267cb9d454bd3f635384 ******/
		%feature("compactdefaultargs") PurgeClosingEdges;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
LOF: TopTools_ListOfShape
MWisOld: TopTools_DataMapOfShapeInteger
MshNOK: TopTools_IndexedMapOfOrientedShape

Return
-------
bool

Description
-----------
No available documentation.
") PurgeClosingEdges;
		static Standard_Boolean PurgeClosingEdges(const TopoDS_Face & F, const TopTools_ListOfShape & LOF, const TopTools_DataMapOfShapeInteger & MWisOld, TopTools_IndexedMapOfOrientedShape & MshNOK);

		/****** TopOpeBRepTool::Regularize ******/
		/****** md5 signature: f4cd016a0697e4e0011f0bc405e3dcdb ******/
		%feature("compactdefaultargs") Regularize;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
aListOfFaces: TopTools_ListOfShape
ESplits: TopTools_DataMapOfShapeListOfShape

Return
-------
bool

Description
-----------
Returns <False> if the face is valid (the UV representation of the face is a set of pcurves connexed by points with connexity 2). Else, splits <aFace> in order to return a list of valid faces.
") Regularize;
		static Standard_Boolean Regularize(const TopoDS_Face & aFace, TopTools_ListOfShape & aListOfFaces, TopTools_DataMapOfShapeListOfShape & ESplits);

		/****** TopOpeBRepTool::RegularizeFace ******/
		/****** md5 signature: 865107d9f8d87aa231aa88da75d2c6a3 ******/
		%feature("compactdefaultargs") RegularizeFace;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
OldWiresnewWires: TopTools_DataMapOfShapeListOfShape
aListOfFaces: TopTools_ListOfShape

Return
-------
bool

Description
-----------
Classify wire's splits of map <OldWiresnewWires> in order to compute <aListOfFaces>, the splits of <aFace>.
") RegularizeFace;
		static Standard_Boolean RegularizeFace(const TopoDS_Face & aFace, const TopTools_DataMapOfShapeListOfShape & OldWiresnewWires, TopTools_ListOfShape & aListOfFaces);

		/****** TopOpeBRepTool::RegularizeShells ******/
		/****** md5 signature: d760e1a6c51babc77f97fae698ca63ed ******/
		%feature("compactdefaultargs") RegularizeShells;
		%feature("autodoc", "
Parameters
----------
aSolid: TopoDS_Solid
OldSheNewShe: TopTools_DataMapOfShapeListOfShape
FSplits: TopTools_DataMapOfShapeListOfShape

Return
-------
bool

Description
-----------
Returns <False> if the shell is valid (the solid is a set of faces connexed by edges with connexity 2). Else, splits faces of the shell; <OldFacesnewFaces> describes (face, splits of face).
") RegularizeShells;
		static Standard_Boolean RegularizeShells(const TopoDS_Solid & aSolid, TopTools_DataMapOfShapeListOfShape & OldSheNewShe, TopTools_DataMapOfShapeListOfShape & FSplits);

		/****** TopOpeBRepTool::RegularizeWires ******/
		/****** md5 signature: 4a0be17b313c18c4cdda59d805315ed1 ******/
		%feature("compactdefaultargs") RegularizeWires;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
OldWiresNewWires: TopTools_DataMapOfShapeListOfShape
ESplits: TopTools_DataMapOfShapeListOfShape

Return
-------
bool

Description
-----------
Returns <False> if the face is valid (the UV representation of the face is a set of pcurves connexed by points with connexity 2). Else, splits wires of the face, these are boundaries of the new faces to build up; <OldWiresNewWires> describes (wire, splits of wire); <ESplits> describes (edge, edge's splits).
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
		/****** TopOpeBRepTool_AncestorsTool::MakeAncestors ******/
		/****** md5 signature: 9a7443f967b9ed1734d3a25a3b67d496 ******/
		%feature("compactdefaultargs") MakeAncestors;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum
M: TopTools_IndexedDataMapOfShapeListOfShape

Return
-------
None

Description
-----------
same as package method TopExp::MapShapeListOfShapes().
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
		/****** TopOpeBRepTool_BoxSort::TopOpeBRepTool_BoxSort ******/
		/****** md5 signature: 0dd0c04e6c3eeaea0bf0f2840789a3e5 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_BoxSort;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort();

		/****** TopOpeBRepTool_BoxSort::TopOpeBRepTool_BoxSort ******/
		/****** md5 signature: 321425f5c2c97b02ed7f0803784241ec ******/
		%feature("compactdefaultargs") TopOpeBRepTool_BoxSort;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepTool_HBoxTool

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort(const opencascade::handle<TopOpeBRepTool_HBoxTool> & T);

		/****** TopOpeBRepTool_BoxSort::AddBoxes ******/
		/****** md5 signature: 2cd1fa34a8ea0fb980853741a96d2b9f ******/
		%feature("compactdefaultargs") AddBoxes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
No available documentation.
") AddBoxes;
		void AddBoxes(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****** TopOpeBRepTool_BoxSort::AddBoxesMakeCOB ******/
		/****** md5 signature: a07ac8ca368d90fd9dd48b88e87007c7 ******/
		%feature("compactdefaultargs") AddBoxesMakeCOB;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
No available documentation.
") AddBoxesMakeCOB;
		void AddBoxesMakeCOB(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****** TopOpeBRepTool_BoxSort::Box ******/
		/****** md5 signature: 37e6d08d3ed2136fa02c2d0d74d16b61 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
Bnd_Box

Description
-----------
No available documentation.
") Box;
		const Bnd_Box & Box(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_BoxSort::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TopOpeBRepTool_BoxSort::Compare ******/
		/****** md5 signature: a96c5a65ae32dd4c3cc230da0eb73a81 ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TColStd_ListIteratorOfListOfInteger

Description
-----------
No available documentation.
") Compare;
		const TColStd_ListIteratorOfListOfInteger & Compare(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_BoxSort::HAB ******/
		/****** md5 signature: 57b51f88b586ea3ddcd154fd687bbbac ******/
		%feature("compactdefaultargs") HAB;
		%feature("autodoc", "Return
-------
opencascade::handle<Bnd_HArray1OfBox>

Description
-----------
No available documentation.
") HAB;
		const opencascade::handle<Bnd_HArray1OfBox> & HAB();

		/****** TopOpeBRepTool_BoxSort::HABShape ******/
		/****** md5 signature: 38eaa0d53259f858b8967867cfe3ee14 ******/
		%feature("compactdefaultargs") HABShape;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") HABShape;
		const TopoDS_Shape HABShape(const Standard_Integer I);

		/****** TopOpeBRepTool_BoxSort::HBoxTool ******/
		/****** md5 signature: 3467f45d288ab6fb370eee9ae14e9e4b ******/
		%feature("compactdefaultargs") HBoxTool;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepTool_HBoxTool>

Description
-----------
No available documentation.
") HBoxTool;
		const opencascade::handle<TopOpeBRepTool_HBoxTool> & HBoxTool();

		/****** TopOpeBRepTool_BoxSort::MakeCOB ******/
		/****** md5 signature: 0ea54cdb22f74ba0ae5f56fa343a4e66 ******/
		%feature("compactdefaultargs") MakeCOB;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
No available documentation.
") MakeCOB;
		void MakeCOB(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****** TopOpeBRepTool_BoxSort::MakeHAB ******/
		/****** md5 signature: 0e2e8fd68158d128e3ec8266a0c08a5c ******/
		%feature("compactdefaultargs") MakeHAB;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
No available documentation.
") MakeHAB;
		void MakeHAB(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****** TopOpeBRepTool_BoxSort::MakeHABCOB ******/
		/****** md5 signature: bde81cdf056af255d42d1118671fba00 ******/
		%feature("compactdefaultargs") MakeHABCOB;
		%feature("autodoc", "
Parameters
----------
HAB: Bnd_HArray1OfBox
COB: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") MakeHABCOB;
		static void MakeHABCOB(const opencascade::handle<Bnd_HArray1OfBox> & HAB, Bnd_Box & COB);

		/****** TopOpeBRepTool_BoxSort::SetHBoxTool ******/
		/****** md5 signature: 521c0737b950ca27bae0cffc56a3fb1f ******/
		%feature("compactdefaultargs") SetHBoxTool;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepTool_HBoxTool

Return
-------
None

Description
-----------
No available documentation.
") SetHBoxTool;
		void SetHBoxTool(const opencascade::handle<TopOpeBRepTool_HBoxTool> & T);

		/****** TopOpeBRepTool_BoxSort::TouchedShape ******/
		/****** md5 signature: 6ddb85bb3aec3cd838112714ab427bd9 ******/
		%feature("compactdefaultargs") TouchedShape;
		%feature("autodoc", "
Parameters
----------
I: TColStd_ListIteratorOfListOfInteger

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_C2DF::TopOpeBRepTool_C2DF ******/
		/****** md5 signature: b2fe262a969a325fd07f373186357860 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_C2DF;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF();

		/****** TopOpeBRepTool_C2DF::TopOpeBRepTool_C2DF ******/
		/****** md5 signature: c18fcd93ba72a14c534d146df0a8d092 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_C2DF;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve
f2d: float
l2d: float
tol: float
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF(const opencascade::handle<Geom2d_Curve> & PC, const Standard_Real f2d, const Standard_Real l2d, const Standard_Real tol, const TopoDS_Face & F);

		/****** TopOpeBRepTool_C2DF::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face();

		/****** TopOpeBRepTool_C2DF::IsFace ******/
		/****** md5 signature: c8b2f8c363a6edf51ddcd9625147974e ******/
		%feature("compactdefaultargs") IsFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") IsFace;
		Standard_Boolean IsFace(const TopoDS_Face & F);

		/****** TopOpeBRepTool_C2DF::IsPC ******/
		/****** md5 signature: 76b9f04fd5d9444b03b81ba0ddb21a17 ******/
		%feature("compactdefaultargs") IsPC;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsPC;
		Standard_Boolean IsPC(const opencascade::handle<Geom2d_Curve> & PC);

		/****** TopOpeBRepTool_C2DF::PC ******/
		/****** md5 signature: 7a059fdc8618508c375af9278e96d859 ******/
		%feature("compactdefaultargs") PC;
		%feature("autodoc", "
Parameters
----------

Return
-------
f2d: float
l2d: float
tol: float

Description
-----------
No available documentation.
") PC;
		const opencascade::handle<Geom2d_Curve> & PC(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepTool_C2DF::SetFace ******/
		/****** md5 signature: 9e665fdaf60532a860d6b82abd61fc4e ******/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") SetFace;
		void SetFace(const TopoDS_Face & F);

		/****** TopOpeBRepTool_C2DF::SetPC ******/
		/****** md5 signature: a2a10397bc3afdc85489deaa9001794c ******/
		%feature("compactdefaultargs") SetPC;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve
f2d: float
l2d: float
tol: float

Return
-------
None

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_CLASSI::TopOpeBRepTool_CLASSI ******/
		/****** md5 signature: 2696063af1ee55f62b5a4848765af587 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_CLASSI;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_CLASSI;
		 TopOpeBRepTool_CLASSI();

		/****** TopOpeBRepTool_CLASSI::Add2d ******/
		/****** md5 signature: ba9897f90bdd1d90365795f3b32df0dc ******/
		%feature("compactdefaultargs") Add2d;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") Add2d;
		Standard_Boolean Add2d(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_CLASSI::ClassiBnd2d ******/
		/****** md5 signature: da9d7b5df9208bc7763aa7009b4934f2 ******/
		%feature("compactdefaultargs") ClassiBnd2d;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
tol: float
checklarge: bool

Return
-------
int

Description
-----------
No available documentation.
") ClassiBnd2d;
		Standard_Integer ClassiBnd2d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Standard_Real tol, const Standard_Boolean checklarge);

		/****** TopOpeBRepTool_CLASSI::Classilist ******/
		/****** md5 signature: 535033dcb290eabb6f96d4af745b1115 ******/
		%feature("compactdefaultargs") Classilist;
		%feature("autodoc", "
Parameters
----------
lS: TopTools_ListOfShape
mapgreasma: TopTools_DataMapOfShapeListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") Classilist;
		Standard_Boolean Classilist(const TopTools_ListOfShape & lS, TopTools_DataMapOfShapeListOfShape & mapgreasma);

		/****** TopOpeBRepTool_CLASSI::Classip2d ******/
		/****** md5 signature: d19f28cace265dc52586b77fbc802b0e ******/
		%feature("compactdefaultargs") Classip2d;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
stabnd2d12: int

Return
-------
int

Description
-----------
No available documentation.
") Classip2d;
		Standard_Integer Classip2d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Standard_Integer stabnd2d12);

		/****** TopOpeBRepTool_CLASSI::GetBox2d ******/
		/****** md5 signature: 127a4f64600e693e3202a8629a4d876b ******/
		%feature("compactdefaultargs") GetBox2d;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Box2d: Bnd_Box2d

Return
-------
bool

Description
-----------
No available documentation.
") GetBox2d;
		Standard_Boolean GetBox2d(const TopoDS_Shape & S, Bnd_Box2d & Box2d);

		/****** TopOpeBRepTool_CLASSI::Getface ******/
		/****** md5 signature: 90195f4317ecad5dc698cca1f66de489 ******/
		%feature("compactdefaultargs") Getface;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
fa: TopOpeBRepTool_face

Return
-------
bool

Description
-----------
No available documentation.
") Getface;
		Standard_Boolean Getface(const TopoDS_Shape & S, TopOpeBRepTool_face & fa);

		/****** TopOpeBRepTool_CLASSI::HasInit2d ******/
		/****** md5 signature: fe84e6cfa90ba1276e2b8639508a1c46 ******/
		%feature("compactdefaultargs") HasInit2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasInit2d;
		Standard_Boolean HasInit2d();

		/****** TopOpeBRepTool_CLASSI::Init2d ******/
		/****** md5 signature: c377d9ad7bcd8bfc9fdb057883151a80 ******/
		%feature("compactdefaultargs") Init2d;
		%feature("autodoc", "
Parameters
----------
Fref: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_CORRISO::TopOpeBRepTool_CORRISO ******/
		/****** md5 signature: 4d7c93df93c996da1079d30064fb7316 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_CORRISO;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO();

		/****** TopOpeBRepTool_CORRISO::TopOpeBRepTool_CORRISO ******/
		/****** md5 signature: 66dbf04868a4dd0e4ce51ceaee9f762a ******/
		%feature("compactdefaultargs") TopOpeBRepTool_CORRISO;
		%feature("autodoc", "
Parameters
----------
FRef: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO(const TopoDS_Face & FRef);

		/****** TopOpeBRepTool_CORRISO::AddNewConnexity ******/
		/****** md5 signature: 53212a0341d6722289e4388ef9ff1c95 ******/
		%feature("compactdefaultargs") AddNewConnexity;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") AddNewConnexity;
		Standard_Boolean AddNewConnexity(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****** TopOpeBRepTool_CORRISO::Connexity ******/
		/****** md5 signature: 2f28821bbc74f6c7af68b25f8c08fcfb ******/
		%feature("compactdefaultargs") Connexity;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
Eds: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") Connexity;
		Standard_Boolean Connexity(const TopoDS_Vertex & V, TopTools_ListOfShape & Eds);

		/****** TopOpeBRepTool_CORRISO::EdgeOUTofBoundsUV ******/
		/****** md5 signature: 2e01c8e916beb2a4a9432f48e8175c6d ******/
		%feature("compactdefaultargs") EdgeOUTofBoundsUV;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
onU: bool
tolx: float

Return
-------
parspE: float

Description
-----------
No available documentation.
") EdgeOUTofBoundsUV;
		Standard_Integer EdgeOUTofBoundsUV(const TopoDS_Edge & E, const Standard_Boolean onU, const Standard_Real tolx, Standard_Real &OutValue);

		/****** TopOpeBRepTool_CORRISO::EdgeWithFaultyUV ******/
		/****** md5 signature: c7540c6070192b28dce6afad4ddb27bd ******/
		%feature("compactdefaultargs") EdgeWithFaultyUV;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
Ivfaulty: int

Description
-----------
No available documentation.
") EdgeWithFaultyUV;
		Standard_Boolean EdgeWithFaultyUV(const TopoDS_Edge & E, Standard_Integer &OutValue);

		/****** TopOpeBRepTool_CORRISO::EdgeWithFaultyUV ******/
		/****** md5 signature: 9e6560d82805ace1097b2204864f5ae2 ******/
		%feature("compactdefaultargs") EdgeWithFaultyUV;
		%feature("autodoc", "
Parameters
----------
EdsToCheck: TopTools_ListOfShape
nfybounds: int
fyE: TopoDS_Shape

Return
-------
Ifaulty: int

Description
-----------
No available documentation.
") EdgeWithFaultyUV;
		Standard_Boolean EdgeWithFaultyUV(const TopTools_ListOfShape & EdsToCheck, const Standard_Integer nfybounds, TopoDS_Shape & fyE, Standard_Integer &OutValue);

		/****** TopOpeBRepTool_CORRISO::EdgesOUTofBoundsUV ******/
		/****** md5 signature: cdcb860a581614e4d0fac9e4d27ee538 ******/
		%feature("compactdefaultargs") EdgesOUTofBoundsUV;
		%feature("autodoc", "
Parameters
----------
EdsToCheck: TopTools_ListOfShape
onU: bool
tolx: float
FyEds: TopTools_DataMapOfOrientedShapeInteger

Return
-------
bool

Description
-----------
No available documentation.
") EdgesOUTofBoundsUV;
		Standard_Boolean EdgesOUTofBoundsUV(const TopTools_ListOfShape & EdsToCheck, const Standard_Boolean onU, const Standard_Real tolx, TopTools_DataMapOfOrientedShapeInteger & FyEds);

		/****** TopOpeBRepTool_CORRISO::EdgesWithFaultyUV ******/
		/****** md5 signature: ff21cd7e0d7f5ca1f85cb8f9c3f01980 ******/
		%feature("compactdefaultargs") EdgesWithFaultyUV;
		%feature("autodoc", "
Parameters
----------
EdsToCheck: TopTools_ListOfShape
nfybounds: int
FyEds: TopTools_DataMapOfOrientedShapeInteger
stopatfirst: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
No available documentation.
") EdgesWithFaultyUV;
		Standard_Boolean EdgesWithFaultyUV(const TopTools_ListOfShape & EdsToCheck, const Standard_Integer nfybounds, TopTools_DataMapOfOrientedShapeInteger & FyEds, const Standard_Boolean stopatfirst = Standard_False);

		/****** TopOpeBRepTool_CORRISO::Eds ******/
		/****** md5 signature: 5b7cf28ede6fc30cef6a776d8d953f6a ******/
		%feature("compactdefaultargs") Eds;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Eds;
		const TopTools_ListOfShape & Eds();

		/****** TopOpeBRepTool_CORRISO::Fref ******/
		/****** md5 signature: 733abf9bb1c22efd3a5f2a93983dadc2 ******/
		%feature("compactdefaultargs") Fref;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Fref;
		const TopoDS_Face Fref();

		/****** TopOpeBRepTool_CORRISO::GASref ******/
		/****** md5 signature: 09ffa8c57f9ac38cacd0782120dd4043 ******/
		%feature("compactdefaultargs") GASref;
		%feature("autodoc", "Return
-------
GeomAdaptor_Surface

Description
-----------
No available documentation.
") GASref;
		GeomAdaptor_Surface GASref();

		/****** TopOpeBRepTool_CORRISO::GetnewS ******/
		/****** md5 signature: 1028993659225ad8087e09930d5f8d97 ******/
		%feature("compactdefaultargs") GetnewS;
		%feature("autodoc", "
Parameters
----------
newS: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") GetnewS;
		Standard_Boolean GetnewS(TopoDS_Face & newS);

		/****** TopOpeBRepTool_CORRISO::Init ******/
		/****** md5 signature: 7bb40f721e74938a50980f5d4c6181e9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") Init;
		Standard_Boolean Init(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_CORRISO::PurgeFyClosingE ******/
		/****** md5 signature: a239655054f16495caaffa4062d5bd7f ******/
		%feature("compactdefaultargs") PurgeFyClosingE;
		%feature("autodoc", "
Parameters
----------
ClEds: TopTools_ListOfShape
fyClEds: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") PurgeFyClosingE;
		Standard_Boolean PurgeFyClosingE(const TopTools_ListOfShape & ClEds, TopTools_ListOfShape & fyClEds);

		/****** TopOpeBRepTool_CORRISO::Refclosed ******/
		/****** md5 signature: 4e203e89be08ed398632e35d6d70e329 ******/
		%feature("compactdefaultargs") Refclosed;
		%feature("autodoc", "
Parameters
----------
x: int

Return
-------
xperiod: float

Description
-----------
No available documentation.
") Refclosed;
		Standard_Boolean Refclosed(const Standard_Integer x, Standard_Real &OutValue);

		/****** TopOpeBRepTool_CORRISO::RemoveOldConnexity ******/
		/****** md5 signature: 104cb0dcb6767a5b5b1687accb204cf4 ******/
		%feature("compactdefaultargs") RemoveOldConnexity;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") RemoveOldConnexity;
		Standard_Boolean RemoveOldConnexity(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****** TopOpeBRepTool_CORRISO::S ******/
		/****** md5 signature: 049ce2b58b0c290e443940bdecc2abf8 ******/
		%feature("compactdefaultargs") S;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") S;
		const TopoDS_Shape S();

		/****** TopOpeBRepTool_CORRISO::SetConnexity ******/
		/****** md5 signature: b565a486de7861bc7f16cd99e51e2a20 ******/
		%feature("compactdefaultargs") SetConnexity;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
Eds: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") SetConnexity;
		Standard_Boolean SetConnexity(const TopoDS_Vertex & V, const TopTools_ListOfShape & Eds);

		/****** TopOpeBRepTool_CORRISO::SetUVRep ******/
		/****** md5 signature: 607c0de76260096103e3889e59ea4e5f ******/
		%feature("compactdefaultargs") SetUVRep;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF

Return
-------
bool

Description
-----------
No available documentation.
") SetUVRep;
		Standard_Boolean SetUVRep(const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF);

		/****** TopOpeBRepTool_CORRISO::Tol ******/
		/****** md5 signature: 468ad068355499fbea745bf803204733 ******/
		%feature("compactdefaultargs") Tol;
		%feature("autodoc", "
Parameters
----------
I: int
tol3d: float

Return
-------
float

Description
-----------
No available documentation.
") Tol;
		Standard_Real Tol(const Standard_Integer I, const Standard_Real tol3d);

		/****** TopOpeBRepTool_CORRISO::TrslUV ******/
		/****** md5 signature: 88413f7b29df335e32d077e9ddd7dc85 ******/
		%feature("compactdefaultargs") TrslUV;
		%feature("autodoc", "
Parameters
----------
onU: bool
FyEds: TopTools_DataMapOfOrientedShapeInteger

Return
-------
bool

Description
-----------
No available documentation.
") TrslUV;
		Standard_Boolean TrslUV(const Standard_Boolean onU, const TopTools_DataMapOfOrientedShapeInteger & FyEds);

		/****** TopOpeBRepTool_CORRISO::UVClosed ******/
		/****** md5 signature: 6d93bab04303399b6d4e1401fc193edf ******/
		%feature("compactdefaultargs") UVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") UVClosed;
		Standard_Boolean UVClosed();

		/****** TopOpeBRepTool_CORRISO::UVRep ******/
		/****** md5 signature: 993296b43d4b341a64d6069d4f69b239 ******/
		%feature("compactdefaultargs") UVRep;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_CurveTool::TopOpeBRepTool_CurveTool ******/
		/****** md5 signature: 4b31861c3524f7ab85cdc35225868e46 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_CurveTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool();

		/****** TopOpeBRepTool_CurveTool::TopOpeBRepTool_CurveTool ******/
		/****** md5 signature: 1115c08356cccfcce6eac601f58a143a ******/
		%feature("compactdefaultargs") TopOpeBRepTool_CurveTool;
		%feature("autodoc", "
Parameters
----------
OCT: TopOpeBRepTool_OutCurveType

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool(const TopOpeBRepTool_OutCurveType OCT);

		/****** TopOpeBRepTool_CurveTool::TopOpeBRepTool_CurveTool ******/
		/****** md5 signature: 98672ff406116cb80fd96749d7558135 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_CurveTool;
		%feature("autodoc", "
Parameters
----------
GT: TopOpeBRepTool_GeomTool

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool(const TopOpeBRepTool_GeomTool & GT);

		/****** TopOpeBRepTool_CurveTool::ChangeGeomTool ******/
		/****** md5 signature: ec177d99f76bb4ed7e436f53436adf03 ******/
		%feature("compactdefaultargs") ChangeGeomTool;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_GeomTool

Description
-----------
No available documentation.
") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool();

		/****** TopOpeBRepTool_CurveTool::GetGeomTool ******/
		/****** md5 signature: 6b33ef83138f718a68f748ea1ea7a345 ******/
		%feature("compactdefaultargs") GetGeomTool;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_GeomTool

Description
-----------
No available documentation.
") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool();

		/****** TopOpeBRepTool_CurveTool::IsProjectable ******/
		/****** md5 signature: 36e4eef298a71cba9d9ea9e3ef462568 ******/
		%feature("compactdefaultargs") IsProjectable;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
C: Geom_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsProjectable;
		static Standard_Boolean IsProjectable(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C);

		/****** TopOpeBRepTool_CurveTool::MakeBSpline1fromPnt ******/
		/****** md5 signature: 33c44e8405512156caf9d55f28a73eb6 ******/
		%feature("compactdefaultargs") MakeBSpline1fromPnt;
		%feature("autodoc", "
Parameters
----------
P: TColgp_Array1OfPnt

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") MakeBSpline1fromPnt;
		static opencascade::handle<Geom_Curve> MakeBSpline1fromPnt(const TColgp_Array1OfPnt & P);

		/****** TopOpeBRepTool_CurveTool::MakeBSpline1fromPnt2d ******/
		/****** md5 signature: 1944d9b07beaffaa170bf1f59932a3f2 ******/
		%feature("compactdefaultargs") MakeBSpline1fromPnt2d;
		%feature("autodoc", "
Parameters
----------
P: TColgp_Array1OfPnt2d

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") MakeBSpline1fromPnt2d;
		static opencascade::handle<Geom2d_Curve> MakeBSpline1fromPnt2d(const TColgp_Array1OfPnt2d & P);

		/****** TopOpeBRepTool_CurveTool::MakeCurves ******/
		/****** md5 signature: 9ef689ecf21715c98a64e1be405fe583 ******/
		%feature("compactdefaultargs") MakeCurves;
		%feature("autodoc", "
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

Return
-------
Tol3d: float
Tol2d: float

Description
-----------
Approximates curves. Returns False in the case of failure.
") MakeCurves;
		Standard_Boolean MakeCurves(const Standard_Real min, const Standard_Real max, const opencascade::handle<Geom_Curve> & C3D, const opencascade::handle<Geom2d_Curve> & PC1, const opencascade::handle<Geom2d_Curve> & PC2, const TopoDS_Shape & S1, const TopoDS_Shape & S2, opencascade::handle<Geom_Curve> & C3DN, opencascade::handle<Geom2d_Curve> & PC1N, opencascade::handle<Geom2d_Curve> & PC2N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepTool_CurveTool::MakePCurveOnFace ******/
		/****** md5 signature: 8d734cb4073b7b1a90dc7b21986ee47e ******/
		%feature("compactdefaultargs") MakePCurveOnFace;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
C: Geom_Curve
first: float (optional, default to 0.0)
last: float (optional, default to 0.0)

Return
-------
TolReached2d: float

Description
-----------
No available documentation.
") MakePCurveOnFace;
		static opencascade::handle<Geom2d_Curve> MakePCurveOnFace(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C, Standard_Real &OutValue, const Standard_Real first = 0.0, const Standard_Real last = 0.0);

		/****** TopOpeBRepTool_CurveTool::SetGeomTool ******/
		/****** md5 signature: 041b33c42bdef202df315ff4480a908a ******/
		%feature("compactdefaultargs") SetGeomTool;
		%feature("autodoc", "
Parameters
----------
GT: TopOpeBRepTool_GeomTool

Return
-------
None

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_FuseEdges::TopOpeBRepTool_FuseEdges ******/
		/****** md5 signature: 1cfc31eed760cc0d132ba241c8ce8e4a ******/
		%feature("compactdefaultargs") TopOpeBRepTool_FuseEdges;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
PerformNow: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initialise members and build construction of map of ancestors.
") TopOpeBRepTool_FuseEdges;
		 TopOpeBRepTool_FuseEdges(const TopoDS_Shape & theShape, const Standard_Boolean PerformNow = Standard_False);

		/****** TopOpeBRepTool_FuseEdges::AvoidEdges ******/
		/****** md5 signature: d76ba44d4c0d9554fdf47f67049f8da0 ******/
		%feature("compactdefaultargs") AvoidEdges;
		%feature("autodoc", "
Parameters
----------
theMapEdg: TopTools_IndexedMapOfShape

Return
-------
None

Description
-----------
set edges to avoid being fused.
") AvoidEdges;
		void AvoidEdges(const TopTools_IndexedMapOfShape & theMapEdg);

		/****** TopOpeBRepTool_FuseEdges::Edges ******/
		/****** md5 signature: 8084c179e24e67079a00b4a173ee9313 ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "
Parameters
----------
theMapLstEdg: TopTools_DataMapOfIntegerListOfShape

Return
-------
None

Description
-----------
returns all the list of edges to be fused each list of the map represent a set of connex edges that can be fused.
") Edges;
		void Edges(TopTools_DataMapOfIntegerListOfShape & theMapLstEdg);

		/****** TopOpeBRepTool_FuseEdges::Faces ******/
		/****** md5 signature: f5abad97fb8ff03cd2b7955c20acd767 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "
Parameters
----------
theMapFac: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
returns the map of modified faces.
") Faces;
		void Faces(TopTools_DataMapOfShapeShape & theMapFac);

		/****** TopOpeBRepTool_FuseEdges::NbVertices ******/
		/****** md5 signature: 18584eb261816370021ae75041e9f83a ******/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of vertices candidate to be removed.
") NbVertices;
		Standard_Integer NbVertices();

		/****** TopOpeBRepTool_FuseEdges::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Using map of list of connex edges, fuse each list to one edge and then update myShape.
") Perform;
		void Perform();

		/****** TopOpeBRepTool_FuseEdges::ResultEdges ******/
		/****** md5 signature: c473d3c90614f31ceb4528d8ba7addb5 ******/
		%feature("compactdefaultargs") ResultEdges;
		%feature("autodoc", "
Parameters
----------
theMapEdg: TopTools_DataMapOfIntegerShape

Return
-------
None

Description
-----------
returns all the fused edges. each integer entry in the map corresponds to the integer in the DataMapOfIntegerListOfShape we get in method Edges. That is to say, to the list of edges in theMapLstEdg(i) corresponds the resulting edge theMapEdge(i).
") ResultEdges;
		void ResultEdges(TopTools_DataMapOfIntegerShape & theMapEdg);

		/****** TopOpeBRepTool_FuseEdges::Shape ******/
		/****** md5 signature: 4968b0e4669317ad9b7893680ac9a219 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns myShape modified with the list of internal edges removed from it.
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
		/****** TopOpeBRepTool_GeomTool::TopOpeBRepTool_GeomTool ******/
		/****** md5 signature: d01b8c142cf19541362d859895914ada ******/
		%feature("compactdefaultargs") TopOpeBRepTool_GeomTool;
		%feature("autodoc", "
Parameters
----------
TypeC3D: TopOpeBRepTool_OutCurveType (optional, default to TopOpeBRepTool_BSPLINE1)
CompC3D: bool (optional, default to Standard_True)
CompPC1: bool (optional, default to Standard_True)
CompPC2: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Boolean flags <CompC3D>, <CompPC1>, <CompPC2> indicate whether the corresponding result curves <C3D>, <PC1>, <PC2> of MakeCurves method must or not be computed from an intersection line <L>. When the line <L> is a walking one, <TypeC3D> is the kind of the 3D curve <C3D> to compute: - BSPLINE1 to compute a BSpline of degree 1 on the walking points of <L>, - APPROX to build an approximation curve on the walking points of <L>.
") TopOpeBRepTool_GeomTool;
		 TopOpeBRepTool_GeomTool(const TopOpeBRepTool_OutCurveType TypeC3D = TopOpeBRepTool_BSPLINE1, const Standard_Boolean CompC3D = Standard_True, const Standard_Boolean CompPC1 = Standard_True, const Standard_Boolean CompPC2 = Standard_True);

		/****** TopOpeBRepTool_GeomTool::CompC3D ******/
		/****** md5 signature: 40681220558ee3b5bd19c07df18c1a44 ******/
		%feature("compactdefaultargs") CompC3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CompC3D;
		Standard_Boolean CompC3D();

		/****** TopOpeBRepTool_GeomTool::CompPC1 ******/
		/****** md5 signature: 3678feec1ba0ab6d2d54174ccd579de1 ******/
		%feature("compactdefaultargs") CompPC1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CompPC1;
		Standard_Boolean CompPC1();

		/****** TopOpeBRepTool_GeomTool::CompPC2 ******/
		/****** md5 signature: 8574b52039878e7d352a56db32d0fc8c ******/
		%feature("compactdefaultargs") CompPC2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CompPC2;
		Standard_Boolean CompPC2();

		/****** TopOpeBRepTool_GeomTool::Define ******/
		/****** md5 signature: 1a2ca1d83d0c076b07598cd82d5b88a6 ******/
		%feature("compactdefaultargs") Define;
		%feature("autodoc", "
Parameters
----------
TypeC3D: TopOpeBRepTool_OutCurveType
CompC3D: bool
CompPC1: bool
CompPC2: bool

Return
-------
None

Description
-----------
No available documentation.
") Define;
		void Define(const TopOpeBRepTool_OutCurveType TypeC3D, const Standard_Boolean CompC3D, const Standard_Boolean CompPC1, const Standard_Boolean CompPC2);

		/****** TopOpeBRepTool_GeomTool::Define ******/
		/****** md5 signature: 364ff9869dfc5bf11a46c0e3b44f54e0 ******/
		%feature("compactdefaultargs") Define;
		%feature("autodoc", "
Parameters
----------
TypeC3D: TopOpeBRepTool_OutCurveType

Return
-------
None

Description
-----------
No available documentation.
") Define;
		void Define(const TopOpeBRepTool_OutCurveType TypeC3D);

		/****** TopOpeBRepTool_GeomTool::Define ******/
		/****** md5 signature: 2430aa4868f376222f9a04a80291e246 ******/
		%feature("compactdefaultargs") Define;
		%feature("autodoc", "
Parameters
----------
GT: TopOpeBRepTool_GeomTool

Return
-------
None

Description
-----------
No available documentation.
") Define;
		void Define(const TopOpeBRepTool_GeomTool & GT);

		/****** TopOpeBRepTool_GeomTool::DefineCurves ******/
		/****** md5 signature: 3452faf24c6e0480ca702e40b2c1dd1b ******/
		%feature("compactdefaultargs") DefineCurves;
		%feature("autodoc", "
Parameters
----------
CompC3D: bool

Return
-------
None

Description
-----------
No available documentation.
") DefineCurves;
		void DefineCurves(const Standard_Boolean CompC3D);

		/****** TopOpeBRepTool_GeomTool::DefinePCurves1 ******/
		/****** md5 signature: 3330a75772c161486eea234727069ee2 ******/
		%feature("compactdefaultargs") DefinePCurves1;
		%feature("autodoc", "
Parameters
----------
CompPC1: bool

Return
-------
None

Description
-----------
No available documentation.
") DefinePCurves1;
		void DefinePCurves1(const Standard_Boolean CompPC1);

		/****** TopOpeBRepTool_GeomTool::DefinePCurves2 ******/
		/****** md5 signature: ceaf89b140c61b3ec41f059b2d935fd4 ******/
		%feature("compactdefaultargs") DefinePCurves2;
		%feature("autodoc", "
Parameters
----------
CompPC2: bool

Return
-------
None

Description
-----------
No available documentation.
") DefinePCurves2;
		void DefinePCurves2(const Standard_Boolean CompPC2);

		/****** TopOpeBRepTool_GeomTool::GetTolerances ******/
		/****** md5 signature: b18e674cbe44aec53e449b968d1c2176 ******/
		%feature("compactdefaultargs") GetTolerances;
		%feature("autodoc", "
Parameters
----------

Return
-------
tol3d: float
tol2d: float

Description
-----------
No available documentation.
") GetTolerances;
		void GetTolerances(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepTool_GeomTool::NbPntMax ******/
		/****** md5 signature: d609e3033852ad8f0a24921f95b73adc ******/
		%feature("compactdefaultargs") NbPntMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPntMax;
		Standard_Integer NbPntMax();

		/****** TopOpeBRepTool_GeomTool::SetNbPntMax ******/
		/****** md5 signature: 0a5bb405f6833e24e46a363db5bed120 ******/
		%feature("compactdefaultargs") SetNbPntMax;
		%feature("autodoc", "
Parameters
----------
NbPntMax: int

Return
-------
None

Description
-----------
No available documentation.
") SetNbPntMax;
		void SetNbPntMax(const Standard_Integer NbPntMax);

		/****** TopOpeBRepTool_GeomTool::SetTolerances ******/
		/****** md5 signature: 339458fe96b2ad7d34024acfdbfca9b1 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
tol3d: float
tol2d: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolerances;
		void SetTolerances(const Standard_Real tol3d, const Standard_Real tol2d);

		/****** TopOpeBRepTool_GeomTool::TypeC3D ******/
		/****** md5 signature: 58f2faab50d53cccd7f6b68b3426821c ******/
		%feature("compactdefaultargs") TypeC3D;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_OutCurveType

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_HBoxTool::TopOpeBRepTool_HBoxTool ******/
		/****** md5 signature: 010ed1b1ed60b7eef0bc288a16322d85 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_HBoxTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_HBoxTool;
		 TopOpeBRepTool_HBoxTool();

		/****** TopOpeBRepTool_HBoxTool::AddBox ******/
		/****** md5 signature: f62a76bf7368433197fa671688d05a44 ******/
		%feature("compactdefaultargs") AddBox;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddBox;
		void AddBox(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_HBoxTool::AddBoxes ******/
		/****** md5 signature: 2cd1fa34a8ea0fb980853741a96d2b9f ******/
		%feature("compactdefaultargs") AddBoxes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
No available documentation.
") AddBoxes;
		void AddBoxes(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****** TopOpeBRepTool_HBoxTool::Box ******/
		/****** md5 signature: af249e0e9bb7d1be028515317ec98922 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
Bnd_Box

Description
-----------
No available documentation.
") Box;
		const Bnd_Box & Box(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_HBoxTool::Box ******/
		/****** md5 signature: 7ab565390775fcf668de23937e770659 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
Bnd_Box

Description
-----------
No available documentation.
") Box;
		const Bnd_Box & Box(const Standard_Integer I);

		/****** TopOpeBRepTool_HBoxTool::ChangeIMS ******/
		/****** md5 signature: 0b4c9265ecef95f1bf800b263ddbe0cb ******/
		%feature("compactdefaultargs") ChangeIMS;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_IndexedDataMapOfShapeBox

Description
-----------
No available documentation.
") ChangeIMS;
		TopOpeBRepTool_IndexedDataMapOfShapeBox & ChangeIMS();

		/****** TopOpeBRepTool_HBoxTool::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TopOpeBRepTool_HBoxTool::ComputeBox ******/
		/****** md5 signature: 3539ff63be7c96e193dd6d5231f309b3 ******/
		%feature("compactdefaultargs") ComputeBox;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") ComputeBox;
		static void ComputeBox(const TopoDS_Shape & S, Bnd_Box & B);

		/****** TopOpeBRepTool_HBoxTool::ComputeBoxOnVertices ******/
		/****** md5 signature: dcccc48162c0d679a533058de4d94922 ******/
		%feature("compactdefaultargs") ComputeBoxOnVertices;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") ComputeBoxOnVertices;
		static void ComputeBoxOnVertices(const TopoDS_Shape & S, Bnd_Box & B);

		/****** TopOpeBRepTool_HBoxTool::DumpB ******/
		/****** md5 signature: ebd878e0fd3870d4ce9053793e066c55 ******/
		%feature("compactdefaultargs") DumpB;
		%feature("autodoc", "
Parameters
----------
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") DumpB;
		static void DumpB(const Bnd_Box & B);

		/****** TopOpeBRepTool_HBoxTool::Extent ******/
		/****** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		Standard_Integer Extent();

		/****** TopOpeBRepTool_HBoxTool::HasBox ******/
		/****** md5 signature: 7a957fa764c8901e8091cc88a06918b5 ******/
		%feature("compactdefaultargs") HasBox;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") HasBox;
		Standard_Boolean HasBox(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_HBoxTool::IMS ******/
		/****** md5 signature: b45998d59ac0fac07c8b4210f92a2541 ******/
		%feature("compactdefaultargs") IMS;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_IndexedDataMapOfShapeBox

Description
-----------
No available documentation.
") IMS;
		const TopOpeBRepTool_IndexedDataMapOfShapeBox & IMS();

		/****** TopOpeBRepTool_HBoxTool::Index ******/
		/****** md5 signature: 9e94bb6d7b4221be4165f8639cd27d92 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_HBoxTool::Shape ******/
		/****** md5 signature: 243b850f6d21a0fba84095c942dbd917 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_PurgeInternalEdges::TopOpeBRepTool_PurgeInternalEdges ******/
		/****** md5 signature: 3e1d4dab936a6fdd4d9981d1644db7ad ******/
		%feature("compactdefaultargs") TopOpeBRepTool_PurgeInternalEdges;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
PerformNow: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Initialize members and begin exploration of shape depending of the value of PerformNow.
") TopOpeBRepTool_PurgeInternalEdges;
		 TopOpeBRepTool_PurgeInternalEdges(const TopoDS_Shape & theShape, const Standard_Boolean PerformNow = Standard_True);

		/****** TopOpeBRepTool_PurgeInternalEdges::Faces ******/
		/****** md5 signature: 687bf433db6c89ba516ef3a7cfa0195c ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "
Parameters
----------
theMapFacLstEdg: TopTools_DataMapOfShapeListOfShape

Return
-------
None

Description
-----------
returns the list internal edges associated with the faces of the myShape. If PerformNow was False when created, then call the private Perform method that do the main job.
") Faces;
		void Faces(TopTools_DataMapOfShapeListOfShape & theMapFacLstEdg);

		/****** TopOpeBRepTool_PurgeInternalEdges::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the list of internal edges has not been extracted.
") IsDone;
		Standard_Boolean IsDone();

		/****** TopOpeBRepTool_PurgeInternalEdges::NbEdges ******/
		/****** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of edges candidate to be removed.
") NbEdges;
		Standard_Integer NbEdges();

		/****** TopOpeBRepTool_PurgeInternalEdges::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Using the list of internal edges from each face, rebuild myShape by removing those edges.
") Perform;
		void Perform();

		/****** TopOpeBRepTool_PurgeInternalEdges::Shape ******/
		/****** md5 signature: 4968b0e4669317ad9b7893680ac9a219 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns myShape modified with the list of internal edges removed from it.
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
		/****** TopOpeBRepTool_REGUS::TopOpeBRepTool_REGUS ******/
		/****** md5 signature: e017f2b3ab04ea7a21c6d4f4cd09c5a7 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_REGUS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_REGUS;
		 TopOpeBRepTool_REGUS();

		/****** TopOpeBRepTool_REGUS::GetFsplits ******/
		/****** md5 signature: 844b9c43737fc228c688485661112d69 ******/
		%feature("compactdefaultargs") GetFsplits;
		%feature("autodoc", "
Parameters
----------
Fsplits: TopTools_DataMapOfShapeListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GetFsplits;
		void GetFsplits(TopTools_DataMapOfShapeListOfShape & Fsplits);

		/****** TopOpeBRepTool_REGUS::GetOshNsh ******/
		/****** md5 signature: 5967855cd372594a93960679dbafd060 ******/
		%feature("compactdefaultargs") GetOshNsh;
		%feature("autodoc", "
Parameters
----------
OshNsh: TopTools_DataMapOfShapeListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GetOshNsh;
		void GetOshNsh(TopTools_DataMapOfShapeListOfShape & OshNsh);

		/****** TopOpeBRepTool_REGUS::Init ******/
		/****** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_REGUS::InitBlock ******/
		/****** md5 signature: 90379730ba21583365bb0303180dd0a2 ******/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") InitBlock;
		Standard_Boolean InitBlock();

		/****** TopOpeBRepTool_REGUS::MapS ******/
		/****** md5 signature: 1af19920146b7bc2ae285cdcf05ea017 ******/
		%feature("compactdefaultargs") MapS;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MapS;
		Standard_Boolean MapS();

		/****** TopOpeBRepTool_REGUS::NearestF ******/
		/****** md5 signature: a322f0d1cc525aa328f7c8d5fcc17ea6 ******/
		%feature("compactdefaultargs") NearestF;
		%feature("autodoc", "
Parameters
----------
e: TopoDS_Edge
lof: TopTools_ListOfShape
ffound: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") NearestF;
		Standard_Boolean NearestF(const TopoDS_Edge & e, const TopTools_ListOfShape & lof, TopoDS_Face & ffound);

		/****** TopOpeBRepTool_REGUS::NextinBlock ******/
		/****** md5 signature: 599d6ab854924787d5fac7998d2f8209 ******/
		%feature("compactdefaultargs") NextinBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") NextinBlock;
		Standard_Boolean NextinBlock();

		/****** TopOpeBRepTool_REGUS::REGU ******/
		/****** md5 signature: ceb9ceb1ae21cde29ffc9ecbc5b05359 ******/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") REGU;
		Standard_Boolean REGU();

		/****** TopOpeBRepTool_REGUS::S ******/
		/****** md5 signature: 049ce2b58b0c290e443940bdecc2abf8 ******/
		%feature("compactdefaultargs") S;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") S;
		const TopoDS_Shape S();

		/****** TopOpeBRepTool_REGUS::SetFsplits ******/
		/****** md5 signature: e4c5fd90a880976ef722cb904d6ba8d6 ******/
		%feature("compactdefaultargs") SetFsplits;
		%feature("autodoc", "
Parameters
----------
Fsplits: TopTools_DataMapOfShapeListOfShape

Return
-------
None

Description
-----------
No available documentation.
") SetFsplits;
		void SetFsplits(TopTools_DataMapOfShapeListOfShape & Fsplits);

		/****** TopOpeBRepTool_REGUS::SetOshNsh ******/
		/****** md5 signature: 4b61fe16eca2b5c04d502b44dfd596a0 ******/
		%feature("compactdefaultargs") SetOshNsh;
		%feature("autodoc", "
Parameters
----------
OshNsh: TopTools_DataMapOfShapeListOfShape

Return
-------
None

Description
-----------
No available documentation.
") SetOshNsh;
		void SetOshNsh(TopTools_DataMapOfShapeListOfShape & OshNsh);

		/****** TopOpeBRepTool_REGUS::SplitF ******/
		/****** md5 signature: eb3bcc42fa4abd728b270a23269c18f4 ******/
		%feature("compactdefaultargs") SplitF;
		%feature("autodoc", "
Parameters
----------
Fanc: TopoDS_Face
FSplits: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") SplitF;
		static Standard_Boolean SplitF(const TopoDS_Face & Fanc, TopTools_ListOfShape & FSplits);

		/****** TopOpeBRepTool_REGUS::SplitFaces ******/
		/****** md5 signature: 32e6943186fe813d3ecaa24db698feac ******/
		%feature("compactdefaultargs") SplitFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SplitFaces;
		Standard_Boolean SplitFaces();

		/****** TopOpeBRepTool_REGUS::WireToFace ******/
		/****** md5 signature: 4d2720640aa667fff62c3c8698ea76bf ******/
		%feature("compactdefaultargs") WireToFace;
		%feature("autodoc", "
Parameters
----------
Fanc: TopoDS_Face
nWs: TopTools_ListOfShape
nFs: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_REGUW::TopOpeBRepTool_REGUW ******/
		/****** md5 signature: a774ddde07931dfe6b1a1cf5dbcc8068 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_REGUW;
		%feature("autodoc", "
Parameters
----------
FRef: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_REGUW;
		 TopOpeBRepTool_REGUW(const TopoDS_Face & FRef);

		/****** TopOpeBRepTool_REGUW::AddNewConnexity ******/
		/****** md5 signature: 6322a95a68aa32de420cf66f8e840b5f ******/
		%feature("compactdefaultargs") AddNewConnexity;
		%feature("autodoc", "
Parameters
----------
v: TopoDS_Vertex
OriKey: int
e: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") AddNewConnexity;
		Standard_Boolean AddNewConnexity(const TopoDS_Vertex & v, const Standard_Integer OriKey, const TopoDS_Edge & e);

		/****** TopOpeBRepTool_REGUW::Connexity ******/
		/****** md5 signature: 2e43eb3f6dc500370b32d833be11a49e ******/
		%feature("compactdefaultargs") Connexity;
		%feature("autodoc", "
Parameters
----------
v: TopoDS_Vertex
co: TopOpeBRepTool_connexity

Return
-------
bool

Description
-----------
No available documentation.
") Connexity;
		Standard_Boolean Connexity(const TopoDS_Vertex & v, TopOpeBRepTool_connexity & co);

		/****** TopOpeBRepTool_REGUW::Fref ******/
		/****** md5 signature: 733abf9bb1c22efd3a5f2a93983dadc2 ******/
		%feature("compactdefaultargs") Fref;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Fref;
		const TopoDS_Face Fref();

		/****** TopOpeBRepTool_REGUW::GetEsplits ******/
		/****** md5 signature: 5b1696e94a15609b83f470d5e03e17f0 ******/
		%feature("compactdefaultargs") GetEsplits;
		%feature("autodoc", "
Parameters
----------
Esplits: TopTools_DataMapOfShapeListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GetEsplits;
		void GetEsplits(TopTools_DataMapOfShapeListOfShape & Esplits);

		/****** TopOpeBRepTool_REGUW::GetOwNw ******/
		/****** md5 signature: 627d61573571ef559061a1dd0805bd5a ******/
		%feature("compactdefaultargs") GetOwNw;
		%feature("autodoc", "
Parameters
----------
OwNw: TopTools_DataMapOfShapeListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GetOwNw;
		void GetOwNw(TopTools_DataMapOfShapeListOfShape & OwNw);

		/****** TopOpeBRepTool_REGUW::GetSplits ******/
		/****** md5 signature: 5b5800106400dd759bb1f7cd2b273b70 ******/
		%feature("compactdefaultargs") GetSplits;
		%feature("autodoc", "
Parameters
----------
Splits: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") GetSplits;
		Standard_Boolean GetSplits(TopTools_ListOfShape & Splits);

		/****** TopOpeBRepTool_REGUW::HasInit ******/
		/****** md5 signature: c78b587d4171014ca73e99d370a25bbe ******/
		%feature("compactdefaultargs") HasInit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasInit;
		Standard_Boolean HasInit();

		/****** TopOpeBRepTool_REGUW::Init ******/
		/****** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_REGUW::InitBlock ******/
		/****** md5 signature: 90379730ba21583365bb0303180dd0a2 ******/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") InitBlock;
		Standard_Boolean InitBlock();

		/****** TopOpeBRepTool_REGUW::MapS ******/
		/****** md5 signature: 1af19920146b7bc2ae285cdcf05ea017 ******/
		%feature("compactdefaultargs") MapS;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MapS;
		Standard_Boolean MapS();

		/****** TopOpeBRepTool_REGUW::NearestE ******/
		/****** md5 signature: 211a2dd0aff24953b381ba8c7e98c522 ******/
		%feature("compactdefaultargs") NearestE;
		%feature("autodoc", "
Parameters
----------
loe: TopTools_ListOfShape
efound: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") NearestE;
		Standard_Boolean NearestE(const TopTools_ListOfShape & loe, TopoDS_Edge & efound);

		/****** TopOpeBRepTool_REGUW::NextinBlock ******/
		/****** md5 signature: 599d6ab854924787d5fac7998d2f8209 ******/
		%feature("compactdefaultargs") NextinBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") NextinBlock;
		Standard_Boolean NextinBlock();

		/****** TopOpeBRepTool_REGUW::REGU ******/
		/****** md5 signature: 5add4d95f53cd7004021b2f66c994627 ******/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "
Parameters
----------
istep: int
Scur: TopoDS_Shape
Splits: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") REGU;
		Standard_Boolean REGU(const Standard_Integer istep, const TopoDS_Shape & Scur, TopTools_ListOfShape & Splits);

		/****** TopOpeBRepTool_REGUW::REGU ******/
		/****** md5 signature: ceb9ceb1ae21cde29ffc9ecbc5b05359 ******/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") REGU;
		Standard_Boolean REGU();

		/****** TopOpeBRepTool_REGUW::RemoveOldConnexity ******/
		/****** md5 signature: 59cb1cde5bae8e60c997a3dabaa7e8c1 ******/
		%feature("compactdefaultargs") RemoveOldConnexity;
		%feature("autodoc", "
Parameters
----------
v: TopoDS_Vertex
OriKey: int
e: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") RemoveOldConnexity;
		Standard_Boolean RemoveOldConnexity(const TopoDS_Vertex & v, const Standard_Integer OriKey, const TopoDS_Edge & e);

		/****** TopOpeBRepTool_REGUW::S ******/
		/****** md5 signature: 049ce2b58b0c290e443940bdecc2abf8 ******/
		%feature("compactdefaultargs") S;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") S;
		const TopoDS_Shape S();

		/****** TopOpeBRepTool_REGUW::SetEsplits ******/
		/****** md5 signature: 9b33fdbd118749d1bb7b2b3acbc3bda8 ******/
		%feature("compactdefaultargs") SetEsplits;
		%feature("autodoc", "
Parameters
----------
Esplits: TopTools_DataMapOfShapeListOfShape

Return
-------
None

Description
-----------
No available documentation.
") SetEsplits;
		void SetEsplits(TopTools_DataMapOfShapeListOfShape & Esplits);

		/****** TopOpeBRepTool_REGUW::SetOwNw ******/
		/****** md5 signature: 0172dd89f1fe65f7a30898a5003596f0 ******/
		%feature("compactdefaultargs") SetOwNw;
		%feature("autodoc", "
Parameters
----------
OwNw: TopTools_DataMapOfShapeListOfShape

Return
-------
None

Description
-----------
No available documentation.
") SetOwNw;
		void SetOwNw(TopTools_DataMapOfShapeListOfShape & OwNw);

		/****** TopOpeBRepTool_REGUW::SplitEds ******/
		/****** md5 signature: ec2fff92d4f60ca1001eb1a7dcdf4b8f ******/
		%feature("compactdefaultargs") SplitEds;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SplitEds;
		Standard_Boolean SplitEds();

		/****** TopOpeBRepTool_REGUW::UpdateMultiple ******/
		/****** md5 signature: 4aedffc7cefe22b28f7a2e2c1e8bf248 ******/
		%feature("compactdefaultargs") UpdateMultiple;
		%feature("autodoc", "
Parameters
----------
v: TopoDS_Vertex

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_ShapeClassifier::TopOpeBRepTool_ShapeClassifier ******/
		/****** md5 signature: 47e475c851fcc8aa1d1347869ef44b42 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier();

		/****** TopOpeBRepTool_ShapeClassifier::TopOpeBRepTool_ShapeClassifier ******/
		/****** md5 signature: 1dcf48988991006ebda6b0b8481c987e ******/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeClassifier;
		%feature("autodoc", "
Parameters
----------
SRef: TopoDS_Shape

Return
-------
None

Description
-----------
SRef is the reference shape. StateShapeShape(S) calls will classify S with SRef.
") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier(const TopoDS_Shape & SRef);

		/****** TopOpeBRepTool_ShapeClassifier::ChangeSolidClassifier ******/
		/****** md5 signature: 8c12af5c190e314233212ab057f4d330 ******/
		%feature("compactdefaultargs") ChangeSolidClassifier;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_SolidClassifier

Description
-----------
No available documentation.
") ChangeSolidClassifier;
		TopOpeBRepTool_SolidClassifier & ChangeSolidClassifier();

		/****** TopOpeBRepTool_ShapeClassifier::ClearAll ******/
		/****** md5 signature: 5be75d83899bbdded2f36544edffc69b ******/
		%feature("compactdefaultargs") ClearAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
reset all internal data (SolidClassifier included).
") ClearAll;
		void ClearAll();

		/****** TopOpeBRepTool_ShapeClassifier::ClearCurrent ******/
		/****** md5 signature: 49324106cdcd23dcc0ac32a86ee1cb05 ******/
		%feature("compactdefaultargs") ClearCurrent;
		%feature("autodoc", "Return
-------
None

Description
-----------
reset all internal data (except SolidClassified).
") ClearCurrent;
		void ClearCurrent();

		/****** TopOpeBRepTool_ShapeClassifier::P2D ******/
		/****** md5 signature: 5a707cfd998e370ce557a93ff46a6d9d ******/
		%feature("compactdefaultargs") P2D;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") P2D;
		const gp_Pnt2d P2D();

		/****** TopOpeBRepTool_ShapeClassifier::P3D ******/
		/****** md5 signature: b5b7e58c88b66f972f71a47a2651d80d ******/
		%feature("compactdefaultargs") P3D;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") P3D;
		const gp_Pnt P3D();

		/****** TopOpeBRepTool_ShapeClassifier::SameDomain ******/
		/****** md5 signature: d5b1d3fad5490e5e3c5b25bfb9c1ca82 ******/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") SameDomain;
		Standard_Integer SameDomain();

		/****** TopOpeBRepTool_ShapeClassifier::SameDomain ******/
		/****** md5 signature: 25520a8e3d8102ad77060502cb9c9ed1 ******/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "
Parameters
----------
samedomain: int

Return
-------
None

Description
-----------
set mode for next StateShapeShape call samedomain = true --> S,Sref are same domain --> point on restriction (ON S) is used to classify S. samedomain = false --> S,Sref are not domain --> point not on restriction of S (IN S) is used to classify S. samedomain value is used only in next StateShapeShape call.
") SameDomain;
		void SameDomain(const Standard_Integer samedomain);

		/****** TopOpeBRepTool_ShapeClassifier::SetReference ******/
		/****** md5 signature: f2cedcd357511023da2cb1b7f5da9644 ******/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "
Parameters
----------
SRef: TopoDS_Shape

Return
-------
None

Description
-----------
Set SRef as reference shape the next StateShapeReference(S,AvoidS) calls will classify S with SRef.
") SetReference;
		void SetReference(const TopoDS_Shape & SRef);

		/****** TopOpeBRepTool_ShapeClassifier::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
return field myState.
") State;
		TopAbs_State State();

		/****** TopOpeBRepTool_ShapeClassifier::StateP2DReference ******/
		/****** md5 signature: 4e46d91b3871c3f356e03dc2232a3f46 ******/
		%feature("compactdefaultargs") StateP2DReference;
		%feature("autodoc", "
Parameters
----------
P2D: gp_Pnt2d

Return
-------
None

Description
-----------
classify point P2D with myRef.
") StateP2DReference;
		void StateP2DReference(const gp_Pnt2d & P2D);

		/****** TopOpeBRepTool_ShapeClassifier::StateP3DReference ******/
		/****** md5 signature: 975293f5c8dbedcfea4301225508e5fc ******/
		%feature("compactdefaultargs") StateP3DReference;
		%feature("autodoc", "
Parameters
----------
P3D: gp_Pnt

Return
-------
None

Description
-----------
classify point P3D with myRef.
") StateP3DReference;
		void StateP3DReference(const gp_Pnt & P3D);

		/****** TopOpeBRepTool_ShapeClassifier::StateShapeReference ******/
		/****** md5 signature: 21275217b285152340efe576bdf6e98b ******/
		%feature("compactdefaultargs") StateShapeReference;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
AvoidS: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
classify shape S compared with reference shape. AvoidS is not used in classification; AvoidS may be IsNull(). (useful to avoid ON or UNKNOWN state in special cases).
") StateShapeReference;
		TopAbs_State StateShapeReference(const TopoDS_Shape & S, const TopoDS_Shape & AvoidS);

		/****** TopOpeBRepTool_ShapeClassifier::StateShapeReference ******/
		/****** md5 signature: 539dc2bd0e65d0b7433a78853b5d0784 ******/
		%feature("compactdefaultargs") StateShapeReference;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LAvoidS: TopTools_ListOfShape

Return
-------
TopAbs_State

Description
-----------
classify shape S compared with reference shape. LAvoidS is list of S subshapes to avoid in classification (useful to avoid ON or UNKNOWN state in special cases).
") StateShapeReference;
		TopAbs_State StateShapeReference(const TopoDS_Shape & S, const TopTools_ListOfShape & LAvoidS);

		/****** TopOpeBRepTool_ShapeClassifier::StateShapeShape ******/
		/****** md5 signature: fb64a2e8acba6c2562ff8bf875acba08 ******/
		%feature("compactdefaultargs") StateShapeShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
SRef: TopoDS_Shape
samedomain: int (optional, default to 0)

Return
-------
TopAbs_State

Description
-----------
classify shape S compared with shape SRef. samedomain = 0: S1,S2 are not same domain samedomain = 1: S1,S2 are same domain.
") StateShapeShape;
		TopAbs_State StateShapeShape(const TopoDS_Shape & S, const TopoDS_Shape & SRef, const Standard_Integer samedomain = 0);

		/****** TopOpeBRepTool_ShapeClassifier::StateShapeShape ******/
		/****** md5 signature: 18821ac5fc4ff711b33a9f2fd0875739 ******/
		%feature("compactdefaultargs") StateShapeShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
AvoidS: TopoDS_Shape
SRef: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
classify shape S compared with shape SRef. AvoidS is not used in classification; AvoidS may be IsNull(). (useful to avoid ON or UNKNOWN state in special cases).
") StateShapeShape;
		TopAbs_State StateShapeShape(const TopoDS_Shape & S, const TopoDS_Shape & AvoidS, const TopoDS_Shape & SRef);

		/****** TopOpeBRepTool_ShapeClassifier::StateShapeShape ******/
		/****** md5 signature: 01f8acc6bc763ab47ed4fc86c9290f60 ******/
		%feature("compactdefaultargs") StateShapeShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LAvoidS: TopTools_ListOfShape
SRef: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
classify shape S compared with shape SRef. LAvoidS is list of S subshapes to avoid in classification AvoidS is not used in classification; AvoidS may be IsNull(). (useful to avoid ON or UNKNOWN state in special cases).
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
		/****** TopOpeBRepTool_ShapeExplorer::TopOpeBRepTool_ShapeExplorer ******/
		/****** md5 signature: d28ec3a269705b3d2788cbb540c525f1 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeExplorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty explorer, becomes useful after Init.
") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer();

		/****** TopOpeBRepTool_ShapeExplorer::TopOpeBRepTool_ShapeExplorer ******/
		/****** md5 signature: 840772ab2f0f6c2524995886174d9288 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeExplorer;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ToFind: TopAbs_ShapeEnum
ToAvoid: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
Creates an Explorer on the Shape <S>. //! <ToFind> is the type of shapes to search. TopAbs_VERTEX, TopAbs_EDGE, ... //! <ToAvoid> is the type of shape to skip in the exploration. If <ToAvoid> is equal or less complex than <ToFind> or if <ToAVoid> is SHAPE it has no effect on the exploration.
") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer(const TopoDS_Shape & S, const TopAbs_ShapeEnum ToFind, const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);

		/****** TopOpeBRepTool_ShapeExplorer::DumpCurrent ******/
		/****** md5 signature: db73845179d5206e02697128b933f101 ******/
		%feature("compactdefaultargs") DumpCurrent;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dump info on current shape to stream.
") DumpCurrent;
		Standard_OStream & DumpCurrent(std::ostream &OutValue);

		/****** TopOpeBRepTool_ShapeExplorer::Index ******/
		/****** md5 signature: 0be2d384cf83d16771bb3f9c857c6326 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Index of current sub-shape.
") Index;
		Standard_Integer Index();

		/****** TopOpeBRepTool_ShapeExplorer::Init ******/
		/****** md5 signature: 8826aacd703d41bf1b9e9fe36f73edb5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ToFind: TopAbs_ShapeEnum
ToAvoid: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S, const TopAbs_ShapeEnum ToFind, const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);

		/****** TopOpeBRepTool_ShapeExplorer::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves to the next Shape in the exploration.
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
		/****** TopOpeBRepTool_ShapeTool::AdjustOnPeriodic ******/
		/****** md5 signature: 41bcb4e57dc28b5f5437e0900ab4acb9 ******/
		%feature("compactdefaultargs") AdjustOnPeriodic;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
u: float
v: float

Description
-----------
adjust u,v values in UVBounds of the domain of the geometric shape <S>, according to Uperiodicity and VPeriodicity of the domain. <S> is assumed to be a face. u and/or v is/are not modified when the domain is not periodic in U and/or V .
") AdjustOnPeriodic;
		static void AdjustOnPeriodic(const TopoDS_Shape & S, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepTool_ShapeTool::BASISCURVE ******/
		/****** md5 signature: 18370617682da3b284ec43bb56c1297c ******/
		%feature("compactdefaultargs") BASISCURVE;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BASISCURVE;
		static opencascade::handle<Geom_Curve> BASISCURVE(const opencascade::handle<Geom_Curve> & C);

		/****** TopOpeBRepTool_ShapeTool::BASISCURVE ******/
		/****** md5 signature: 3894bc6644bb3b9bada8d485645b9c1a ******/
		%feature("compactdefaultargs") BASISCURVE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BASISCURVE;
		static opencascade::handle<Geom_Curve> BASISCURVE(const TopoDS_Edge & E);

		/****** TopOpeBRepTool_ShapeTool::BASISSURFACE ******/
		/****** md5 signature: 6b33c26587fb578ad92297a1733699fc ******/
		%feature("compactdefaultargs") BASISSURFACE;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") BASISSURFACE;
		static opencascade::handle<Geom_Surface> BASISSURFACE(const opencascade::handle<Geom_Surface> & S);

		/****** TopOpeBRepTool_ShapeTool::BASISSURFACE ******/
		/****** md5 signature: 5d77135684c3fabd15965df3bc855017 ******/
		%feature("compactdefaultargs") BASISSURFACE;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") BASISSURFACE;
		static opencascade::handle<Geom_Surface> BASISSURFACE(const TopoDS_Face & F);

		/****** TopOpeBRepTool_ShapeTool::Closed ******/
		/****** md5 signature: 3b8ea13bf165f42e4e92ae659707a9b1 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
bool

Description
-----------
indicates whether shape S1 is a closing shape on S2 or not.
") Closed;
		static Standard_Boolean Closed(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepTool_ShapeTool::CurvesSameOriented ******/
		/****** md5 signature: 19797c101ba1f31a7200659db9a946e4 ******/
		%feature("compactdefaultargs") CurvesSameOriented;
		%feature("autodoc", "
Parameters
----------
C1: BRepAdaptor_Curve
C2: BRepAdaptor_Curve

Return
-------
bool

Description
-----------
No available documentation.
") CurvesSameOriented;
		static Standard_Boolean CurvesSameOriented(const BRepAdaptor_Curve & C1, const BRepAdaptor_Curve & C2);

		/****** TopOpeBRepTool_ShapeTool::EdgeData ******/
		/****** md5 signature: 7949890efd5bb7e702b4a07079dd1fda ******/
		%feature("compactdefaultargs") EdgeData;
		%feature("autodoc", "
Parameters
----------
BRAC: BRepAdaptor_Curve
P: float
T: gp_Dir
N: gp_Dir

Return
-------
C: float

Description
-----------
Compute tangent T, normal N, curvature C at point of parameter P on curve BRAC. Returns the tolerance indicating if T,N are null.
") EdgeData;
		static Standard_Real EdgeData(const BRepAdaptor_Curve & BRAC, const Standard_Real P, gp_Dir & T, gp_Dir & N, Standard_Real &OutValue);

		/****** TopOpeBRepTool_ShapeTool::EdgeData ******/
		/****** md5 signature: b600ee85939b85c4a4a80d31c2cb3aad ******/
		%feature("compactdefaultargs") EdgeData;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
P: float
T: gp_Dir
N: gp_Dir

Return
-------
C: float

Description
-----------
Same as previous on edge E.
") EdgeData;
		static Standard_Real EdgeData(const TopoDS_Shape & E, const Standard_Real P, gp_Dir & T, gp_Dir & N, Standard_Real &OutValue);

		/****** TopOpeBRepTool_ShapeTool::EdgesSameOriented ******/
		/****** md5 signature: f4c046df1ea96e4eab999157f27935e6 ******/
		%feature("compactdefaultargs") EdgesSameOriented;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Shape
E2: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") EdgesSameOriented;
		static Standard_Boolean EdgesSameOriented(const TopoDS_Shape & E1, const TopoDS_Shape & E2);

		/****** TopOpeBRepTool_ShapeTool::FacesSameOriented ******/
		/****** md5 signature: 13c31c9844cc300fe33d87893b42177c ******/
		%feature("compactdefaultargs") FacesSameOriented;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") FacesSameOriented;
		static Standard_Boolean FacesSameOriented(const TopoDS_Shape & F1, const TopoDS_Shape & F2);

		/****** TopOpeBRepTool_ShapeTool::PeriodizeParameter ******/
		/****** md5 signature: 97d557248bb79c234cf3b66e72057226 ******/
		%feature("compactdefaultargs") PeriodizeParameter;
		%feature("autodoc", "
Parameters
----------
par: float
EE: TopoDS_Shape
FF: TopoDS_Shape

Return
-------
float

Description
-----------
No available documentation.
") PeriodizeParameter;
		static Standard_Real PeriodizeParameter(const Standard_Real par, const TopoDS_Shape & EE, const TopoDS_Shape & FF);

		/****** TopOpeBRepTool_ShapeTool::Pnt ******/
		/****** md5 signature: 3acf1ba14d36c8ae249fce7024949728 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
gp_Pnt

Description
-----------
Returns 3D point of vertex <S>.
") Pnt;
		static gp_Pnt Pnt(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_ShapeTool::Resolution3d ******/
		/****** md5 signature: 1e4ab31f7ec052b9d44f03d2c2ff2830 ******/
		%feature("compactdefaultargs") Resolution3d;
		%feature("autodoc", "
Parameters
----------
SU: Geom_Surface
Tol2d: float

Return
-------
float

Description
-----------
No available documentation.
") Resolution3d;
		static Standard_Real Resolution3d(const opencascade::handle<Geom_Surface> & SU, const Standard_Real Tol2d);

		/****** TopOpeBRepTool_ShapeTool::Resolution3d ******/
		/****** md5 signature: 822ca59ea53e10a35a138b7ab0e87920 ******/
		%feature("compactdefaultargs") Resolution3d;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol2d: float

Return
-------
float

Description
-----------
No available documentation.
") Resolution3d;
		static Standard_Real Resolution3d(const TopoDS_Face & F, const Standard_Real Tol2d);

		/****** TopOpeBRepTool_ShapeTool::Resolution3dU ******/
		/****** md5 signature: 060ab3240e763ff9deca7358d4f049a8 ******/
		%feature("compactdefaultargs") Resolution3dU;
		%feature("autodoc", "
Parameters
----------
SU: Geom_Surface
Tol2d: float

Return
-------
float

Description
-----------
No available documentation.
") Resolution3dU;
		static Standard_Real Resolution3dU(const opencascade::handle<Geom_Surface> & SU, const Standard_Real Tol2d);

		/****** TopOpeBRepTool_ShapeTool::Resolution3dV ******/
		/****** md5 signature: adc23d94c5cfda98ee592b13b8ac9f54 ******/
		%feature("compactdefaultargs") Resolution3dV;
		%feature("autodoc", "
Parameters
----------
SU: Geom_Surface
Tol2d: float

Return
-------
float

Description
-----------
No available documentation.
") Resolution3dV;
		static Standard_Real Resolution3dV(const opencascade::handle<Geom_Surface> & SU, const Standard_Real Tol2d);

		/****** TopOpeBRepTool_ShapeTool::ShapesSameOriented ******/
		/****** md5 signature: 1774142272116a126a4487f3c75046f6 ******/
		%feature("compactdefaultargs") ShapesSameOriented;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") ShapesSameOriented;
		static Standard_Boolean ShapesSameOriented(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepTool_ShapeTool::SurfacesSameOriented ******/
		/****** md5 signature: c23e10c40a09ee0221e59102aebc29e7 ******/
		%feature("compactdefaultargs") SurfacesSameOriented;
		%feature("autodoc", "
Parameters
----------
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SurfacesSameOriented;
		static Standard_Boolean SurfacesSameOriented(const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2);

		/****** TopOpeBRepTool_ShapeTool::Tolerance ******/
		/****** md5 signature: 67b96879aad45cc1466e0e43d1c5d14a ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
float

Description
-----------
Returns the tolerance of the shape <S>. If the shape <S> is Null, returns 0.
") Tolerance;
		static Standard_Real Tolerance(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_ShapeTool::UVBOUNDS ******/
		/****** md5 signature: 06dac66867e53b145380e1cb501436cf ******/
		%feature("compactdefaultargs") UVBOUNDS;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
UPeri: bool
VPeri: bool
Umin: float
Umax: float
Vmin: float
Vmax: float

Description
-----------
No available documentation.
") UVBOUNDS;
		static void UVBOUNDS(const opencascade::handle<Geom_Surface> & S, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepTool_ShapeTool::UVBOUNDS ******/
		/****** md5 signature: c57f844e7083f36b7b1deea19d8ce61d ******/
		%feature("compactdefaultargs") UVBOUNDS;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
UPeri: bool
VPeri: bool
Umin: float
Umax: float
Vmin: float
Vmax: float

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_SolidClassifier::TopOpeBRepTool_SolidClassifier ******/
		/****** md5 signature: 4efcf0a71fcdab6bf54f1d32c1be059c ******/
		%feature("compactdefaultargs") TopOpeBRepTool_SolidClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_SolidClassifier;
		 TopOpeBRepTool_SolidClassifier();

		/****** TopOpeBRepTool_SolidClassifier::Classify ******/
		/****** md5 signature: 2df1deb61308951b8385a78c42c032cb ******/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid
P: gp_Pnt
Tol: float

Return
-------
TopAbs_State

Description
-----------
compute the position of point <P> regarding with the geometric domain of the solid <S>.
") Classify;
		TopAbs_State Classify(const TopoDS_Solid & S, const gp_Pnt & P, const Standard_Real Tol);

		/****** TopOpeBRepTool_SolidClassifier::Classify ******/
		/****** md5 signature: f55a91007adbb8cc2b9fce8b6045cdcd ******/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell
P: gp_Pnt
Tol: float

Return
-------
TopAbs_State

Description
-----------
compute the position of point <P> regarding with the geometric domain of the shell <S>.
") Classify;
		TopAbs_State Classify(const TopoDS_Shell & S, const gp_Pnt & P, const Standard_Real Tol);

		/****** TopOpeBRepTool_SolidClassifier::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TopOpeBRepTool_SolidClassifier::LoadShell ******/
		/****** md5 signature: b5911871a5a06deb53507c87e0d033ad ******/
		%feature("compactdefaultargs") LoadShell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell

Return
-------
None

Description
-----------
No available documentation.
") LoadShell;
		void LoadShell(const TopoDS_Shell & S);

		/****** TopOpeBRepTool_SolidClassifier::LoadSolid ******/
		/****** md5 signature: 9652e6ee4594196093792bd38627a2ce ******/
		%feature("compactdefaultargs") LoadSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid

Return
-------
None

Description
-----------
No available documentation.
") LoadSolid;
		void LoadSolid(const TopoDS_Solid & S);

		/****** TopOpeBRepTool_SolidClassifier::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_TOOL::ClosedE ******/
		/****** md5 signature: 19c3955778583acbdd48b8dc78a75944 ******/
		%feature("compactdefaultargs") ClosedE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
vclo: TopoDS_Vertex

Return
-------
bool

Description
-----------
No available documentation.
") ClosedE;
		static Standard_Boolean ClosedE(const TopoDS_Edge & E, TopoDS_Vertex & vclo);

		/****** TopOpeBRepTool_TOOL::ClosedS ******/
		/****** md5 signature: dba03fb1a1ade00a9a9d530ba5d98808 ******/
		%feature("compactdefaultargs") ClosedS;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") ClosedS;
		static Standard_Boolean ClosedS(const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::CurvE ******/
		/****** md5 signature: 175da19eaac43d80668908f1e2e31859 ******/
		%feature("compactdefaultargs") CurvE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
par: float
tg0: gp_Dir

Return
-------
Curv: float

Description
-----------
No available documentation.
") CurvE;
		static Standard_Boolean CurvE(const TopoDS_Edge & E, const Standard_Real par, const gp_Dir & tg0, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::CurvF ******/
		/****** md5 signature: e59b013c0afe5329c6d088fce8603969 ******/
		%feature("compactdefaultargs") CurvF;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
uv: gp_Pnt2d
tg0: gp_Dir

Return
-------
Curv: float
direct: bool

Description
-----------
No available documentation.
") CurvF;
		static Standard_Boolean CurvF(const TopoDS_Face & F, const gp_Pnt2d & uv, const gp_Dir & tg0, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****** TopOpeBRepTool_TOOL::EdgeONFace ******/
		/****** md5 signature: eeaef4fe63af1f781d99831b2e298bf0 ******/
		%feature("compactdefaultargs") EdgeONFace;
		%feature("autodoc", "
Parameters
----------
par: float
ed: TopoDS_Edge
uv: gp_Pnt2d
fa: TopoDS_Face

Return
-------
isonfa: bool

Description
-----------
No available documentation.
") EdgeONFace;
		static Standard_Boolean EdgeONFace(const Standard_Real par, const TopoDS_Edge & ed, const gp_Pnt2d & uv, const TopoDS_Face & fa, Standard_Boolean &OutValue);

		/****** TopOpeBRepTool_TOOL::Getduv ******/
		/****** md5 signature: e6d4d00c8ecf0de0cab9691a90e68493 ******/
		%feature("compactdefaultargs") Getduv;
		%feature("autodoc", "
Parameters
----------
f: TopoDS_Face
uv: gp_Pnt2d
dir: gp_Vec
factor: float
duv: gp_Dir2d

Return
-------
bool

Description
-----------
No available documentation.
") Getduv;
		static Standard_Boolean Getduv(const TopoDS_Face & f, const gp_Pnt2d & uv, const gp_Vec & dir, const Standard_Real factor, gp_Dir2d & duv);

		/****** TopOpeBRepTool_TOOL::Getstp3dF ******/
		/****** md5 signature: 95b39091c8c2894fc2b661022e2bce5f ******/
		%feature("compactdefaultargs") Getstp3dF;
		%feature("autodoc", "
Parameters
----------
p: gp_Pnt
f: TopoDS_Face
uv: gp_Pnt2d

Return
-------
st: TopAbs_State

Description
-----------
No available documentation.
") Getstp3dF;
		static Standard_Boolean Getstp3dF(const gp_Pnt & p, const TopoDS_Face & f, gp_Pnt2d & uv, TopAbs_State &OutValue);

		/****** TopOpeBRepTool_TOOL::IsClosingE ******/
		/****** md5 signature: b1deb72133a371dcd0c8e2f71ea1743c ******/
		%feature("compactdefaultargs") IsClosingE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") IsClosingE;
		static Standard_Boolean IsClosingE(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::IsClosingE ******/
		/****** md5 signature: f56f64c9b8428ec58da2dc005cada15f ******/
		%feature("compactdefaultargs") IsClosingE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
W: TopoDS_Shape
F: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") IsClosingE;
		static Standard_Boolean IsClosingE(const TopoDS_Edge & E, const TopoDS_Shape & W, const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::IsQuad ******/
		/****** md5 signature: 3b269eea6d6e1a73695a621ec63192a1 ******/
		%feature("compactdefaultargs") IsQuad;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") IsQuad;
		static Standard_Boolean IsQuad(const TopoDS_Edge & E);

		/****** TopOpeBRepTool_TOOL::IsQuad ******/
		/****** md5 signature: e6c5119cc1926899ad5acf3967fd39f9 ******/
		%feature("compactdefaultargs") IsQuad;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") IsQuad;
		static Standard_Boolean IsQuad(const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::IsonCLO ******/
		/****** md5 signature: a2eb28589389ea616cce2ee1fe51ca1c ******/
		%feature("compactdefaultargs") IsonCLO;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve
onU: bool
xfirst: float
xperiod: float
xtol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsonCLO;
		static Standard_Boolean IsonCLO(const opencascade::handle<Geom2d_Curve> & PC, const Standard_Boolean onU, const Standard_Real xfirst, const Standard_Real xperiod, const Standard_Real xtol);

		/****** TopOpeBRepTool_TOOL::IsonCLO ******/
		/****** md5 signature: 5e633f7781088c6725c02ffee6d6d6f0 ******/
		%feature("compactdefaultargs") IsonCLO;
		%feature("autodoc", "
Parameters
----------
C2DF: TopOpeBRepTool_C2DF
onU: bool
xfirst: float
xperiod: float
xtol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsonCLO;
		static Standard_Boolean IsonCLO(const TopOpeBRepTool_C2DF & C2DF, const Standard_Boolean onU, const Standard_Real xfirst, const Standard_Real xperiod, const Standard_Real xtol);

		/****** TopOpeBRepTool_TOOL::Matter ******/
		/****** md5 signature: ae26f7312aaa31bd6e2f415e1946f9af ******/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "
Parameters
----------
d1: gp_Vec
d2: gp_Vec
ref: gp_Vec

Return
-------
float

Description
-----------
No available documentation.
") Matter;
		static Standard_Real Matter(const gp_Vec & d1, const gp_Vec & d2, const gp_Vec & ref);

		/****** TopOpeBRepTool_TOOL::Matter ******/
		/****** md5 signature: bf01ef73c717f1f4b320755a85697148 ******/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "
Parameters
----------
d1: gp_Vec2d
d2: gp_Vec2d

Return
-------
float

Description
-----------
No available documentation.
") Matter;
		static Standard_Real Matter(const gp_Vec2d & d1, const gp_Vec2d & d2);

		/****** TopOpeBRepTool_TOOL::Matter ******/
		/****** md5 signature: 957f4cbdc37297cbb7e50232e8826db6 ******/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "
Parameters
----------
xx1: gp_Dir
nt1: gp_Dir
xx2: gp_Dir
nt2: gp_Dir
tola: float

Return
-------
Ang: float

Description
-----------
No available documentation.
") Matter;
		static Standard_Boolean Matter(const gp_Dir & xx1, const gp_Dir & nt1, const gp_Dir & xx2, const gp_Dir & nt2, const Standard_Real tola, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::Matter ******/
		/****** md5 signature: 7e6178798d5e1c67a22e1dc2efdb2bab ******/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "
Parameters
----------
f1: TopoDS_Face
f2: TopoDS_Face
e: TopoDS_Edge
pare: float
tola: float

Return
-------
Ang: float

Description
-----------
No available documentation.
") Matter;
		static Standard_Boolean Matter(const TopoDS_Face & f1, const TopoDS_Face & f2, const TopoDS_Edge & e, const Standard_Real pare, const Standard_Real tola, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::MatterKPtg ******/
		/****** md5 signature: 1c21759d1ac9f42b549e2878e1cd7144 ******/
		%feature("compactdefaultargs") MatterKPtg;
		%feature("autodoc", "
Parameters
----------
f1: TopoDS_Face
f2: TopoDS_Face
e: TopoDS_Edge

Return
-------
Ang: float

Description
-----------
No available documentation.
") MatterKPtg;
		static Standard_Boolean MatterKPtg(const TopoDS_Face & f1, const TopoDS_Face & f2, const TopoDS_Edge & e, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::MkShell ******/
		/****** md5 signature: ae5616b046c3d5483d998f0165fe64a1 ******/
		%feature("compactdefaultargs") MkShell;
		%feature("autodoc", "
Parameters
----------
lF: TopTools_ListOfShape
She: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MkShell;
		static void MkShell(const TopTools_ListOfShape & lF, TopoDS_Shape & She);

		/****** TopOpeBRepTool_TOOL::NgApp ******/
		/****** md5 signature: f69b51fc56af2bc0f57dd022eadb634a ******/
		%feature("compactdefaultargs") NgApp;
		%feature("autodoc", "
Parameters
----------
par: float
E: TopoDS_Edge
F: TopoDS_Face
tola: float
ngApp: gp_Dir

Return
-------
bool

Description
-----------
No available documentation.
") NgApp;
		static Standard_Boolean NgApp(const Standard_Real par, const TopoDS_Edge & E, const TopoDS_Face & F, const Standard_Real tola, gp_Dir & ngApp);

		/****** TopOpeBRepTool_TOOL::NggeomF ******/
		/****** md5 signature: 111d400c8b7c52ef123ad0b4c3e772d3 ******/
		%feature("compactdefaultargs") NggeomF;
		%feature("autodoc", "
Parameters
----------
uv: gp_Pnt2d
F: TopoDS_Face
ng: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") NggeomF;
		static Standard_Boolean NggeomF(const gp_Pnt2d & uv, const TopoDS_Face & F, gp_Vec & ng);

		/****** TopOpeBRepTool_TOOL::Nt ******/
		/****** md5 signature: eefbc198930a2945348fffbaa6164988 ******/
		%feature("compactdefaultargs") Nt;
		%feature("autodoc", "
Parameters
----------
uv: gp_Pnt2d
f: TopoDS_Face
normt: gp_Dir

Return
-------
bool

Description
-----------
No available documentation.
") Nt;
		static Standard_Boolean Nt(const gp_Pnt2d & uv, const TopoDS_Face & f, gp_Dir & normt);

		/****** TopOpeBRepTool_TOOL::OnBoundary ******/
		/****** md5 signature: b4eebb873cfda587d3871a09c7bd7e93 ******/
		%feature("compactdefaultargs") OnBoundary;
		%feature("autodoc", "
Parameters
----------
par: float
E: TopoDS_Edge

Return
-------
int

Description
-----------
No available documentation.
") OnBoundary;
		static Standard_Integer OnBoundary(const Standard_Real par, const TopoDS_Edge & E);

		/****** TopOpeBRepTool_TOOL::OriinSor ******/
		/****** md5 signature: d8654d13b34ce01eb6a0205edd9a1fdd ******/
		%feature("compactdefaultargs") OriinSor;
		%feature("autodoc", "
Parameters
----------
sub: TopoDS_Shape
S: TopoDS_Shape
checkclo: bool (optional, default to Standard_False)

Return
-------
int

Description
-----------
No available documentation.
") OriinSor;
		static Standard_Integer OriinSor(const TopoDS_Shape & sub, const TopoDS_Shape & S, const Standard_Boolean checkclo = Standard_False);

		/****** TopOpeBRepTool_TOOL::OriinSorclosed ******/
		/****** md5 signature: f5c2d35a824e09a217f98bfc586237b8 ******/
		%feature("compactdefaultargs") OriinSorclosed;
		%feature("autodoc", "
Parameters
----------
sub: TopoDS_Shape
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") OriinSorclosed;
		static Standard_Integer OriinSorclosed(const TopoDS_Shape & sub, const TopoDS_Shape & S);

		/****** TopOpeBRepTool_TOOL::ParE ******/
		/****** md5 signature: b6140c8dece2c36b9aecb34b74ea835c ******/
		%feature("compactdefaultargs") ParE;
		%feature("autodoc", "
Parameters
----------
Iv: int
E: TopoDS_Edge

Return
-------
float

Description
-----------
No available documentation.
") ParE;
		static Standard_Real ParE(const Standard_Integer Iv, const TopoDS_Edge & E);

		/****** TopOpeBRepTool_TOOL::ParE2d ******/
		/****** md5 signature: af78713bc95e3e068d734d674de43e2c ******/
		%feature("compactdefaultargs") ParE2d;
		%feature("autodoc", "
Parameters
----------
p2d: gp_Pnt2d
e: TopoDS_Edge
f: TopoDS_Face

Return
-------
par: float
dist: float

Description
-----------
No available documentation.
") ParE2d;
		static Standard_Boolean ParE2d(const gp_Pnt2d & p2d, const TopoDS_Edge & e, const TopoDS_Face & f, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::ParISO ******/
		/****** md5 signature: 251bd30dc2be563f4ba1ab85f347b815 ******/
		%feature("compactdefaultargs") ParISO;
		%feature("autodoc", "
Parameters
----------
p2d: gp_Pnt2d
e: TopoDS_Edge
f: TopoDS_Face

Return
-------
pare: float

Description
-----------
No available documentation.
") ParISO;
		static Standard_Boolean ParISO(const gp_Pnt2d & p2d, const TopoDS_Edge & e, const TopoDS_Face & f, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::Remove ******/
		/****** md5 signature: 59f8eb981c9a9971548d25034b9baf4c ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
loS: TopTools_ListOfShape
toremove: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") Remove;
		static Standard_Boolean Remove(TopTools_ListOfShape & loS, const TopoDS_Shape & toremove);

		/****** TopOpeBRepTool_TOOL::SplitE ******/
		/****** md5 signature: 8d1afe5a2f98d61f5c9fbc636c41a588 ******/
		%feature("compactdefaultargs") SplitE;
		%feature("autodoc", "
Parameters
----------
Eanc: TopoDS_Edge
Splits: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") SplitE;
		static Standard_Boolean SplitE(const TopoDS_Edge & Eanc, TopTools_ListOfShape & Splits);

		/****** TopOpeBRepTool_TOOL::Tg2d ******/
		/****** md5 signature: daa86325679f80363d6069d34ea6e2d9 ******/
		%feature("compactdefaultargs") Tg2d;
		%feature("autodoc", "
Parameters
----------
iv: int
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tg2d;
		static gp_Vec2d Tg2d(const Standard_Integer iv, const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF);

		/****** TopOpeBRepTool_TOOL::Tg2dApp ******/
		/****** md5 signature: 6da7e11fb763d1194c88845292765b53 ******/
		%feature("compactdefaultargs") Tg2dApp;
		%feature("autodoc", "
Parameters
----------
iv: int
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF
factor: float

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tg2dApp;
		static gp_Vec2d Tg2dApp(const Standard_Integer iv, const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF, const Standard_Real factor);

		/****** TopOpeBRepTool_TOOL::TgINSIDE ******/
		/****** md5 signature: f43200aadaa7f55e2213c624b55d9e9a ******/
		%feature("compactdefaultargs") TgINSIDE;
		%feature("autodoc", "
Parameters
----------
v: TopoDS_Vertex
E: TopoDS_Edge
Tg: gp_Vec

Return
-------
OvinE: int

Description
-----------
No available documentation.
") TgINSIDE;
		static Standard_Boolean TgINSIDE(const TopoDS_Vertex & v, const TopoDS_Edge & E, gp_Vec & Tg, Standard_Integer &OutValue);

		/****** TopOpeBRepTool_TOOL::TggeomE ******/
		/****** md5 signature: f02f01248a071870bd70ac4b1df329c3 ******/
		%feature("compactdefaultargs") TggeomE;
		%feature("autodoc", "
Parameters
----------
par: float
BC: BRepAdaptor_Curve
Tg: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") TggeomE;
		static Standard_Boolean TggeomE(const Standard_Real par, const BRepAdaptor_Curve & BC, gp_Vec & Tg);

		/****** TopOpeBRepTool_TOOL::TggeomE ******/
		/****** md5 signature: 6302c8730bc64421dd6562f3cf60f781 ******/
		%feature("compactdefaultargs") TggeomE;
		%feature("autodoc", "
Parameters
----------
par: float
E: TopoDS_Edge
Tg: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") TggeomE;
		static Standard_Boolean TggeomE(const Standard_Real par, const TopoDS_Edge & E, gp_Vec & Tg);

		/****** TopOpeBRepTool_TOOL::TolP ******/
		/****** md5 signature: 432ec3be21d5e35dd993ec4256a53aba ******/
		%feature("compactdefaultargs") TolP;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
float

Description
-----------
No available documentation.
") TolP;
		static Standard_Real TolP(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::TolUV ******/
		/****** md5 signature: f00a0865f6f7815aafd23315a1bdb60e ******/
		%feature("compactdefaultargs") TolUV;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
tol3d: float

Return
-------
float

Description
-----------
No available documentation.
") TolUV;
		static Standard_Real TolUV(const TopoDS_Face & F, const Standard_Real tol3d);

		/****** TopOpeBRepTool_TOOL::TrslUV ******/
		/****** md5 signature: 48e6ccb205628916330fc3e63633e5fd ******/
		%feature("compactdefaultargs") TrslUV;
		%feature("autodoc", "
Parameters
----------
t2d: gp_Vec2d
C2DF: TopOpeBRepTool_C2DF

Return
-------
None

Description
-----------
No available documentation.
") TrslUV;
		static void TrslUV(const gp_Vec2d & t2d, TopOpeBRepTool_C2DF & C2DF);

		/****** TopOpeBRepTool_TOOL::TrslUVModifE ******/
		/****** md5 signature: 936807ce29ed9679ea583a0d926daedc ******/
		%feature("compactdefaultargs") TrslUVModifE;
		%feature("autodoc", "
Parameters
----------
t2d: gp_Vec2d
F: TopoDS_Face
E: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") TrslUVModifE;
		static Standard_Boolean TrslUVModifE(const gp_Vec2d & t2d, const TopoDS_Face & F, TopoDS_Edge & E);

		/****** TopOpeBRepTool_TOOL::UVF ******/
		/****** md5 signature: 9cf77ed17a4ce47bcc986cc089baaa04 ******/
		%feature("compactdefaultargs") UVF;
		%feature("autodoc", "
Parameters
----------
par: float
C2DF: TopOpeBRepTool_C2DF

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") UVF;
		static gp_Pnt2d UVF(const Standard_Real par, const TopOpeBRepTool_C2DF & C2DF);

		/****** TopOpeBRepTool_TOOL::UVISO ******/
		/****** md5 signature: 85f19a7afffc658abfe22449fa119995 ******/
		%feature("compactdefaultargs") UVISO;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve
d2d: gp_Dir2d
o2d: gp_Pnt2d

Return
-------
isou: bool
isov: bool

Description
-----------
No available documentation.
") UVISO;
		static Standard_Boolean UVISO(const opencascade::handle<Geom2d_Curve> & PC, Standard_Boolean &OutValue, Standard_Boolean &OutValue, gp_Dir2d & d2d, gp_Pnt2d & o2d);

		/****** TopOpeBRepTool_TOOL::UVISO ******/
		/****** md5 signature: eee22cf05889f8de6db4536b859e25ee ******/
		%feature("compactdefaultargs") UVISO;
		%feature("autodoc", "
Parameters
----------
C2DF: TopOpeBRepTool_C2DF
d2d: gp_Dir2d
o2d: gp_Pnt2d

Return
-------
isou: bool
isov: bool

Description
-----------
No available documentation.
") UVISO;
		static Standard_Boolean UVISO(const TopOpeBRepTool_C2DF & C2DF, Standard_Boolean &OutValue, Standard_Boolean &OutValue, gp_Dir2d & d2d, gp_Pnt2d & o2d);

		/****** TopOpeBRepTool_TOOL::UVISO ******/
		/****** md5 signature: 9b29262143d153ddc2988aa4005cf6cb ******/
		%feature("compactdefaultargs") UVISO;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
d2d: gp_Dir2d
o2d: gp_Pnt2d

Return
-------
isou: bool
isov: bool

Description
-----------
No available documentation.
") UVISO;
		static Standard_Boolean UVISO(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Boolean &OutValue, Standard_Boolean &OutValue, gp_Dir2d & d2d, gp_Pnt2d & o2d);

		/****** TopOpeBRepTool_TOOL::Vertex ******/
		/****** md5 signature: 341bc41f4c0dc9c551d1008ef50fdd44 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Iv: int
E: TopoDS_Edge

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		static TopoDS_Vertex Vertex(const Standard_Integer Iv, const TopoDS_Edge & E);

		/****** TopOpeBRepTool_TOOL::Vertices ******/
		/****** md5 signature: f5f1ad790d65b9ce4e9bb71f37d3a429 ******/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
Vces: TopTools_Array1OfShape

Return
-------
None

Description
-----------
No available documentation.
") Vertices;
		static void Vertices(const TopoDS_Edge & E, TopTools_Array1OfShape & Vces);

		/****** TopOpeBRepTool_TOOL::WireToFace ******/
		/****** md5 signature: ba2b2e423747368601e36bb4348bcd3c ******/
		%feature("compactdefaultargs") WireToFace;
		%feature("autodoc", "
Parameters
----------
Fref: TopoDS_Face
mapWlow: TopTools_DataMapOfShapeListOfShape
lFs: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") WireToFace;
		static Standard_Boolean WireToFace(const TopoDS_Face & Fref, const TopTools_DataMapOfShapeListOfShape & mapWlow, TopTools_ListOfShape & lFs);

		/****** TopOpeBRepTool_TOOL::XX ******/
		/****** md5 signature: 4f7828ff22f2a54087691ec542a848e0 ******/
		%feature("compactdefaultargs") XX;
		%feature("autodoc", "
Parameters
----------
uv: gp_Pnt2d
f: TopoDS_Face
par: float
e: TopoDS_Edge
xx: gp_Dir

Return
-------
bool

Description
-----------
No available documentation.
") XX;
		static Standard_Boolean XX(const gp_Pnt2d & uv, const TopoDS_Face & f, const Standard_Real par, const TopoDS_Edge & e, gp_Dir & xx);

		/****** TopOpeBRepTool_TOOL::minDUV ******/
		/****** md5 signature: 7313e43db0992aaa9450223669434d89 ******/
		%feature("compactdefaultargs") minDUV;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
float

Description
-----------
No available documentation.
") minDUV;
		static Standard_Real minDUV(const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::outUVbounds ******/
		/****** md5 signature: 88ebffcf8577e8a66811a636f24874ca ******/
		%feature("compactdefaultargs") outUVbounds;
		%feature("autodoc", "
Parameters
----------
uv: gp_Pnt2d
F: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") outUVbounds;
		static Standard_Boolean outUVbounds(const gp_Pnt2d & uv, const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::stuvF ******/
		/****** md5 signature: 1b0a550169b81219c40456ad20314c7c ******/
		%feature("compactdefaultargs") stuvF;
		%feature("autodoc", "
Parameters
----------
uv: gp_Pnt2d
F: TopoDS_Face

Return
-------
onU: int
onV: int

Description
-----------
No available documentation.
") stuvF;
		static void stuvF(const gp_Pnt2d & uv, const TopoDS_Face & F, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRepTool_TOOL::tryNgApp ******/
		/****** md5 signature: 985f983dedcd8acb2a69335690eec606 ******/
		%feature("compactdefaultargs") tryNgApp;
		%feature("autodoc", "
Parameters
----------
par: float
E: TopoDS_Edge
F: TopoDS_Face
tola: float
ng: gp_Dir

Return
-------
bool

Description
-----------
No available documentation.
") tryNgApp;
		static Standard_Boolean tryNgApp(const Standard_Real par, const TopoDS_Edge & E, const TopoDS_Face & F, const Standard_Real tola, gp_Dir & ng);

		/****** TopOpeBRepTool_TOOL::tryOriEinF ******/
		/****** md5 signature: 82779199eada3d9b1107306add1ef428 ******/
		%feature("compactdefaultargs") tryOriEinF;
		%feature("autodoc", "
Parameters
----------
par: float
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
int

Description
-----------
No available documentation.
") tryOriEinF;
		static Standard_Integer tryOriEinF(const Standard_Real par, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::tryTg2dApp ******/
		/****** md5 signature: b4b106229fc17200eab299345ed07526 ******/
		%feature("compactdefaultargs") tryTg2dApp;
		%feature("autodoc", "
Parameters
----------
iv: int
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF
factor: float

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") tryTg2dApp;
		static gp_Vec2d tryTg2dApp(const Standard_Integer iv, const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF, const Standard_Real factor);

		/****** TopOpeBRepTool_TOOL::uvApp ******/
		/****** md5 signature: 211eb4e61da26c627ba1130ba5586230 ******/
		%feature("compactdefaultargs") uvApp;
		%feature("autodoc", "
Parameters
----------
f: TopoDS_Face
e: TopoDS_Edge
par: float
eps: float
uvapp: gp_Pnt2d

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_connexity::TopOpeBRepTool_connexity ******/
		/****** md5 signature: 42da8153f349ff3b0275ec2b14477fa6 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_connexity;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity();

		/****** TopOpeBRepTool_connexity::TopOpeBRepTool_connexity ******/
		/****** md5 signature: a158b6669991caea8a5380d5780cc4f2 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_connexity;
		%feature("autodoc", "
Parameters
----------
Key: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity(const TopoDS_Shape & Key);

		/****** TopOpeBRepTool_connexity::AddItem ******/
		/****** md5 signature: ba7b2d859a60cd84ca633a5a0fd473ac ******/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "
Parameters
----------
OriKey: int
Item: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") AddItem;
		void AddItem(const Standard_Integer OriKey, const TopTools_ListOfShape & Item);

		/****** TopOpeBRepTool_connexity::AddItem ******/
		/****** md5 signature: 88ea9446993ae6ad747eb05cbebf3344 ******/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "
Parameters
----------
OriKey: int
Item: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddItem;
		void AddItem(const Standard_Integer OriKey, const TopoDS_Shape & Item);

		/****** TopOpeBRepTool_connexity::AllItems ******/
		/****** md5 signature: 65f47013ada687f1b3dfb3815c667702 ******/
		%feature("compactdefaultargs") AllItems;
		%feature("autodoc", "
Parameters
----------
Item: TopTools_ListOfShape

Return
-------
int

Description
-----------
No available documentation.
") AllItems;
		Standard_Integer AllItems(TopTools_ListOfShape & Item);

		/****** TopOpeBRepTool_connexity::ChangeItem ******/
		/****** md5 signature: 56b357a90405cc0cd4281427da804676 ******/
		%feature("compactdefaultargs") ChangeItem;
		%feature("autodoc", "
Parameters
----------
OriKey: int

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ChangeItem;
		TopTools_ListOfShape & ChangeItem(const Standard_Integer OriKey);

		/****** TopOpeBRepTool_connexity::IsFaulty ******/
		/****** md5 signature: bf2f339702c735676fd194adb8d144e7 ******/
		%feature("compactdefaultargs") IsFaulty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsFaulty;
		Standard_Boolean IsFaulty();

		/****** TopOpeBRepTool_connexity::IsInternal ******/
		/****** md5 signature: c3f02e348d92ee17df757ed608ecc877 ******/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "
Parameters
----------
Item: TopTools_ListOfShape

Return
-------
int

Description
-----------
No available documentation.
") IsInternal;
		Standard_Integer IsInternal(TopTools_ListOfShape & Item);

		/****** TopOpeBRepTool_connexity::IsMultiple ******/
		/****** md5 signature: d5ff9ea3f75ee3e6e0efda5814b9e44e ******/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****** TopOpeBRepTool_connexity::Item ******/
		/****** md5 signature: c2167caea9712bae0a3832faccdb7d44 ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "
Parameters
----------
OriKey: int
Item: TopTools_ListOfShape

Return
-------
int

Description
-----------
No available documentation.
") Item;
		Standard_Integer Item(const Standard_Integer OriKey, TopTools_ListOfShape & Item);

		/****** TopOpeBRepTool_connexity::Key ******/
		/****** md5 signature: c7bbdf014250e7fdf336ffffdd980713 ******/
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Key;
		const TopoDS_Shape Key();

		/****** TopOpeBRepTool_connexity::RemoveItem ******/
		/****** md5 signature: 3f293909bf050d4feea293647a9cebb4 ******/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "
Parameters
----------
OriKey: int
Item: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") RemoveItem;
		Standard_Boolean RemoveItem(const Standard_Integer OriKey, const TopoDS_Shape & Item);

		/****** TopOpeBRepTool_connexity::RemoveItem ******/
		/****** md5 signature: d9a4a037df4d0b1e5e65da0a8b7f9bbb ******/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "
Parameters
----------
Item: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") RemoveItem;
		Standard_Boolean RemoveItem(const TopoDS_Shape & Item);

		/****** TopOpeBRepTool_connexity::SetKey ******/
		/****** md5 signature: d15adeac661de401d61ca8c535e02537 ******/
		%feature("compactdefaultargs") SetKey;
		%feature("autodoc", "
Parameters
----------
Key: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_face::TopOpeBRepTool_face ******/
		/****** md5 signature: c4e6b2239c6683d4564a2bedb9011878 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_face;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_face;
		 TopOpeBRepTool_face();

		/****** TopOpeBRepTool_face::Ffinite ******/
		/****** md5 signature: 2f5b2c65ca62a0569db1dcbaccdb66ce ******/
		%feature("compactdefaultargs") Ffinite;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Ffinite;
		const TopoDS_Face Ffinite();

		/****** TopOpeBRepTool_face::Finite ******/
		/****** md5 signature: 03be9a7fe7c55f493438efb633d6f01d ******/
		%feature("compactdefaultargs") Finite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Finite;
		Standard_Boolean Finite();

		/****** TopOpeBRepTool_face::Init ******/
		/****** md5 signature: d6c213113bc51bee64853ea6105be91b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
Fref: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") Init;
		Standard_Boolean Init(const TopoDS_Wire & W, const TopoDS_Face & Fref);

		/****** TopOpeBRepTool_face::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** TopOpeBRepTool_face::RealF ******/
		/****** md5 signature: 74e4826dc638209b6f2bd12e098e5c26 ******/
		%feature("compactdefaultargs") RealF;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") RealF;
		TopoDS_Face RealF();

		/****** TopOpeBRepTool_face::W ******/
		/****** md5 signature: 038e666ee840fa85a4f62ad880400775 ******/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
No available documentation.
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
		/****** TopOpeBRepTool_makeTransition::TopOpeBRepTool_makeTransition ******/
		/****** md5 signature: 4361e0a8aa5133248f58328f09615204 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_makeTransition;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_makeTransition;
		 TopOpeBRepTool_makeTransition();

		/****** TopOpeBRepTool_makeTransition::Getfactor ******/
		/****** md5 signature: 1828f68bf4f04801b4bda7da7e5e0093 ******/
		%feature("compactdefaultargs") Getfactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Getfactor;
		Standard_Real Getfactor();

		/****** TopOpeBRepTool_makeTransition::HasRest ******/
		/****** md5 signature: 4cfbb6555bc020d7a24bcc4c3777d657 ******/
		%feature("compactdefaultargs") HasRest;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasRest;
		Standard_Boolean HasRest();

		/****** TopOpeBRepTool_makeTransition::Initialize ******/
		/****** md5 signature: 7f21b3b7ebc6d8d8dbbdd08680928295 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
pbef: float
paft: float
parE: float
FS: TopoDS_Face
uv: gp_Pnt2d
factor: float

Return
-------
bool

Description
-----------
No available documentation.
") Initialize;
		Standard_Boolean Initialize(const TopoDS_Edge & E, const Standard_Real pbef, const Standard_Real paft, const Standard_Real parE, const TopoDS_Face & FS, const gp_Pnt2d & uv, const Standard_Real factor);

		/****** TopOpeBRepTool_makeTransition::IsT2d ******/
		/****** md5 signature: a4cb2022d4117c56f82cab4e584a5353 ******/
		%feature("compactdefaultargs") IsT2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsT2d;
		Standard_Boolean IsT2d();

		/****** TopOpeBRepTool_makeTransition::MkT2donE ******/
		/****** md5 signature: 6a09a4aab4609f6db8e37033bf28490a ******/
		%feature("compactdefaultargs") MkT2donE;
		%feature("autodoc", "
Parameters
----------

Return
-------
stb: TopAbs_State
sta: TopAbs_State

Description
-----------
No available documentation.
") MkT2donE;
		Standard_Boolean MkT2donE(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepTool_makeTransition::MkT3dproj ******/
		/****** md5 signature: 68012640242489ad984fee9c261695a4 ******/
		%feature("compactdefaultargs") MkT3dproj;
		%feature("autodoc", "
Parameters
----------

Return
-------
stb: TopAbs_State
sta: TopAbs_State

Description
-----------
No available documentation.
") MkT3dproj;
		Standard_Boolean MkT3dproj(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepTool_makeTransition::MkT3onE ******/
		/****** md5 signature: 9cc4d2c89c6a39036b825ee178bbab15 ******/
		%feature("compactdefaultargs") MkT3onE;
		%feature("autodoc", "
Parameters
----------

Return
-------
stb: TopAbs_State
sta: TopAbs_State

Description
-----------
No available documentation.
") MkT3onE;
		Standard_Boolean MkT3onE(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepTool_makeTransition::MkTonE ******/
		/****** md5 signature: 6cdb2b05d8ba4be20425b28835a6aeb5 ******/
		%feature("compactdefaultargs") MkTonE;
		%feature("autodoc", "
Parameters
----------

Return
-------
stb: TopAbs_State
sta: TopAbs_State

Description
-----------
No available documentation.
") MkTonE;
		Standard_Boolean MkTonE(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepTool_makeTransition::SetRest ******/
		/****** md5 signature: 370455842d64ac60659e9621012e9701 ******/
		%feature("compactdefaultargs") SetRest;
		%feature("autodoc", "
Parameters
----------
ES: TopoDS_Edge
parES: float

Return
-------
bool

Description
-----------
No available documentation.
") SetRest;
		Standard_Boolean SetRest(const TopoDS_Edge & ES, const Standard_Real parES);

		/****** TopOpeBRepTool_makeTransition::Setfactor ******/
		/****** md5 signature: be3c472504c350d4b188d276e24584b8 ******/
		%feature("compactdefaultargs") Setfactor;
		%feature("autodoc", "
Parameters
----------
factor: float

Return
-------
None

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def topopebreptool_CorrectONUVISO(*args):
	return topopebreptool.CorrectONUVISO(*args)

@deprecated
def topopebreptool_MakeFaces(*args):
	return topopebreptool.MakeFaces(*args)

@deprecated
def topopebreptool_Print(*args):
	return topopebreptool.Print(*args)

@deprecated
def topopebreptool_PurgeClosingEdges(*args):
	return topopebreptool.PurgeClosingEdges(*args)

@deprecated
def topopebreptool_PurgeClosingEdges(*args):
	return topopebreptool.PurgeClosingEdges(*args)

@deprecated
def topopebreptool_Regularize(*args):
	return topopebreptool.Regularize(*args)

@deprecated
def topopebreptool_RegularizeFace(*args):
	return topopebreptool.RegularizeFace(*args)

@deprecated
def topopebreptool_RegularizeShells(*args):
	return topopebreptool.RegularizeShells(*args)

@deprecated
def topopebreptool_RegularizeWires(*args):
	return topopebreptool.RegularizeWires(*args)

@deprecated
def TopOpeBRepTool_AncestorsTool_MakeAncestors(*args):
	return TopOpeBRepTool_AncestorsTool.MakeAncestors(*args)

@deprecated
def TopOpeBRepTool_BoxSort_MakeHABCOB(*args):
	return TopOpeBRepTool_BoxSort.MakeHABCOB(*args)

@deprecated
def TopOpeBRepTool_CurveTool_IsProjectable(*args):
	return TopOpeBRepTool_CurveTool.IsProjectable(*args)

@deprecated
def TopOpeBRepTool_CurveTool_MakeBSpline1fromPnt(*args):
	return TopOpeBRepTool_CurveTool.MakeBSpline1fromPnt(*args)

@deprecated
def TopOpeBRepTool_CurveTool_MakeBSpline1fromPnt2d(*args):
	return TopOpeBRepTool_CurveTool.MakeBSpline1fromPnt2d(*args)

@deprecated
def TopOpeBRepTool_CurveTool_MakePCurveOnFace(*args):
	return TopOpeBRepTool_CurveTool.MakePCurveOnFace(*args)

@deprecated
def TopOpeBRepTool_HBoxTool_ComputeBox(*args):
	return TopOpeBRepTool_HBoxTool.ComputeBox(*args)

@deprecated
def TopOpeBRepTool_HBoxTool_ComputeBoxOnVertices(*args):
	return TopOpeBRepTool_HBoxTool.ComputeBoxOnVertices(*args)

@deprecated
def TopOpeBRepTool_HBoxTool_DumpB(*args):
	return TopOpeBRepTool_HBoxTool.DumpB(*args)

@deprecated
def TopOpeBRepTool_REGUS_SplitF(*args):
	return TopOpeBRepTool_REGUS.SplitF(*args)

@deprecated
def TopOpeBRepTool_REGUS_WireToFace(*args):
	return TopOpeBRepTool_REGUS.WireToFace(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_AdjustOnPeriodic(*args):
	return TopOpeBRepTool_ShapeTool.AdjustOnPeriodic(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_BASISCURVE(*args):
	return TopOpeBRepTool_ShapeTool.BASISCURVE(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_BASISCURVE(*args):
	return TopOpeBRepTool_ShapeTool.BASISCURVE(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_BASISSURFACE(*args):
	return TopOpeBRepTool_ShapeTool.BASISSURFACE(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_BASISSURFACE(*args):
	return TopOpeBRepTool_ShapeTool.BASISSURFACE(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_Closed(*args):
	return TopOpeBRepTool_ShapeTool.Closed(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_CurvesSameOriented(*args):
	return TopOpeBRepTool_ShapeTool.CurvesSameOriented(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_EdgeData(*args):
	return TopOpeBRepTool_ShapeTool.EdgeData(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_EdgeData(*args):
	return TopOpeBRepTool_ShapeTool.EdgeData(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_EdgesSameOriented(*args):
	return TopOpeBRepTool_ShapeTool.EdgesSameOriented(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_FacesSameOriented(*args):
	return TopOpeBRepTool_ShapeTool.FacesSameOriented(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_PeriodizeParameter(*args):
	return TopOpeBRepTool_ShapeTool.PeriodizeParameter(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_Pnt(*args):
	return TopOpeBRepTool_ShapeTool.Pnt(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_Resolution3d(*args):
	return TopOpeBRepTool_ShapeTool.Resolution3d(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_Resolution3d(*args):
	return TopOpeBRepTool_ShapeTool.Resolution3d(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_Resolution3dU(*args):
	return TopOpeBRepTool_ShapeTool.Resolution3dU(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_Resolution3dV(*args):
	return TopOpeBRepTool_ShapeTool.Resolution3dV(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_ShapesSameOriented(*args):
	return TopOpeBRepTool_ShapeTool.ShapesSameOriented(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_SurfacesSameOriented(*args):
	return TopOpeBRepTool_ShapeTool.SurfacesSameOriented(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_Tolerance(*args):
	return TopOpeBRepTool_ShapeTool.Tolerance(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_UVBOUNDS(*args):
	return TopOpeBRepTool_ShapeTool.UVBOUNDS(*args)

@deprecated
def TopOpeBRepTool_ShapeTool_UVBOUNDS(*args):
	return TopOpeBRepTool_ShapeTool.UVBOUNDS(*args)

@deprecated
def TopOpeBRepTool_TOOL_ClosedE(*args):
	return TopOpeBRepTool_TOOL.ClosedE(*args)

@deprecated
def TopOpeBRepTool_TOOL_ClosedS(*args):
	return TopOpeBRepTool_TOOL.ClosedS(*args)

@deprecated
def TopOpeBRepTool_TOOL_CurvE(*args):
	return TopOpeBRepTool_TOOL.CurvE(*args)

@deprecated
def TopOpeBRepTool_TOOL_CurvF(*args):
	return TopOpeBRepTool_TOOL.CurvF(*args)

@deprecated
def TopOpeBRepTool_TOOL_EdgeONFace(*args):
	return TopOpeBRepTool_TOOL.EdgeONFace(*args)

@deprecated
def TopOpeBRepTool_TOOL_Getduv(*args):
	return TopOpeBRepTool_TOOL.Getduv(*args)

@deprecated
def TopOpeBRepTool_TOOL_Getstp3dF(*args):
	return TopOpeBRepTool_TOOL.Getstp3dF(*args)

@deprecated
def TopOpeBRepTool_TOOL_IsClosingE(*args):
	return TopOpeBRepTool_TOOL.IsClosingE(*args)

@deprecated
def TopOpeBRepTool_TOOL_IsClosingE(*args):
	return TopOpeBRepTool_TOOL.IsClosingE(*args)

@deprecated
def TopOpeBRepTool_TOOL_IsQuad(*args):
	return TopOpeBRepTool_TOOL.IsQuad(*args)

@deprecated
def TopOpeBRepTool_TOOL_IsQuad(*args):
	return TopOpeBRepTool_TOOL.IsQuad(*args)

@deprecated
def TopOpeBRepTool_TOOL_IsonCLO(*args):
	return TopOpeBRepTool_TOOL.IsonCLO(*args)

@deprecated
def TopOpeBRepTool_TOOL_IsonCLO(*args):
	return TopOpeBRepTool_TOOL.IsonCLO(*args)

@deprecated
def TopOpeBRepTool_TOOL_Matter(*args):
	return TopOpeBRepTool_TOOL.Matter(*args)

@deprecated
def TopOpeBRepTool_TOOL_Matter(*args):
	return TopOpeBRepTool_TOOL.Matter(*args)

@deprecated
def TopOpeBRepTool_TOOL_Matter(*args):
	return TopOpeBRepTool_TOOL.Matter(*args)

@deprecated
def TopOpeBRepTool_TOOL_Matter(*args):
	return TopOpeBRepTool_TOOL.Matter(*args)

@deprecated
def TopOpeBRepTool_TOOL_MatterKPtg(*args):
	return TopOpeBRepTool_TOOL.MatterKPtg(*args)

@deprecated
def TopOpeBRepTool_TOOL_MkShell(*args):
	return TopOpeBRepTool_TOOL.MkShell(*args)

@deprecated
def TopOpeBRepTool_TOOL_NgApp(*args):
	return TopOpeBRepTool_TOOL.NgApp(*args)

@deprecated
def TopOpeBRepTool_TOOL_NggeomF(*args):
	return TopOpeBRepTool_TOOL.NggeomF(*args)

@deprecated
def TopOpeBRepTool_TOOL_Nt(*args):
	return TopOpeBRepTool_TOOL.Nt(*args)

@deprecated
def TopOpeBRepTool_TOOL_OnBoundary(*args):
	return TopOpeBRepTool_TOOL.OnBoundary(*args)

@deprecated
def TopOpeBRepTool_TOOL_OriinSor(*args):
	return TopOpeBRepTool_TOOL.OriinSor(*args)

@deprecated
def TopOpeBRepTool_TOOL_OriinSorclosed(*args):
	return TopOpeBRepTool_TOOL.OriinSorclosed(*args)

@deprecated
def TopOpeBRepTool_TOOL_ParE(*args):
	return TopOpeBRepTool_TOOL.ParE(*args)

@deprecated
def TopOpeBRepTool_TOOL_ParE2d(*args):
	return TopOpeBRepTool_TOOL.ParE2d(*args)

@deprecated
def TopOpeBRepTool_TOOL_ParISO(*args):
	return TopOpeBRepTool_TOOL.ParISO(*args)

@deprecated
def TopOpeBRepTool_TOOL_Remove(*args):
	return TopOpeBRepTool_TOOL.Remove(*args)

@deprecated
def TopOpeBRepTool_TOOL_SplitE(*args):
	return TopOpeBRepTool_TOOL.SplitE(*args)

@deprecated
def TopOpeBRepTool_TOOL_Tg2d(*args):
	return TopOpeBRepTool_TOOL.Tg2d(*args)

@deprecated
def TopOpeBRepTool_TOOL_Tg2dApp(*args):
	return TopOpeBRepTool_TOOL.Tg2dApp(*args)

@deprecated
def TopOpeBRepTool_TOOL_TgINSIDE(*args):
	return TopOpeBRepTool_TOOL.TgINSIDE(*args)

@deprecated
def TopOpeBRepTool_TOOL_TggeomE(*args):
	return TopOpeBRepTool_TOOL.TggeomE(*args)

@deprecated
def TopOpeBRepTool_TOOL_TggeomE(*args):
	return TopOpeBRepTool_TOOL.TggeomE(*args)

@deprecated
def TopOpeBRepTool_TOOL_TolP(*args):
	return TopOpeBRepTool_TOOL.TolP(*args)

@deprecated
def TopOpeBRepTool_TOOL_TolUV(*args):
	return TopOpeBRepTool_TOOL.TolUV(*args)

@deprecated
def TopOpeBRepTool_TOOL_TrslUV(*args):
	return TopOpeBRepTool_TOOL.TrslUV(*args)

@deprecated
def TopOpeBRepTool_TOOL_TrslUVModifE(*args):
	return TopOpeBRepTool_TOOL.TrslUVModifE(*args)

@deprecated
def TopOpeBRepTool_TOOL_UVF(*args):
	return TopOpeBRepTool_TOOL.UVF(*args)

@deprecated
def TopOpeBRepTool_TOOL_UVISO(*args):
	return TopOpeBRepTool_TOOL.UVISO(*args)

@deprecated
def TopOpeBRepTool_TOOL_UVISO(*args):
	return TopOpeBRepTool_TOOL.UVISO(*args)

@deprecated
def TopOpeBRepTool_TOOL_UVISO(*args):
	return TopOpeBRepTool_TOOL.UVISO(*args)

@deprecated
def TopOpeBRepTool_TOOL_Vertex(*args):
	return TopOpeBRepTool_TOOL.Vertex(*args)

@deprecated
def TopOpeBRepTool_TOOL_Vertices(*args):
	return TopOpeBRepTool_TOOL.Vertices(*args)

@deprecated
def TopOpeBRepTool_TOOL_WireToFace(*args):
	return TopOpeBRepTool_TOOL.WireToFace(*args)

@deprecated
def TopOpeBRepTool_TOOL_XX(*args):
	return TopOpeBRepTool_TOOL.XX(*args)

@deprecated
def TopOpeBRepTool_TOOL_minDUV(*args):
	return TopOpeBRepTool_TOOL.minDUV(*args)

@deprecated
def TopOpeBRepTool_TOOL_outUVbounds(*args):
	return TopOpeBRepTool_TOOL.outUVbounds(*args)

@deprecated
def TopOpeBRepTool_TOOL_stuvF(*args):
	return TopOpeBRepTool_TOOL.stuvF(*args)

@deprecated
def TopOpeBRepTool_TOOL_tryNgApp(*args):
	return TopOpeBRepTool_TOOL.tryNgApp(*args)

@deprecated
def TopOpeBRepTool_TOOL_tryOriEinF(*args):
	return TopOpeBRepTool_TOOL.tryOriEinF(*args)

@deprecated
def TopOpeBRepTool_TOOL_tryTg2dApp(*args):
	return TopOpeBRepTool_TOOL.tryTg2dApp(*args)

@deprecated
def TopOpeBRepTool_TOOL_uvApp(*args):
	return TopOpeBRepTool_TOOL.uvApp(*args)

}
