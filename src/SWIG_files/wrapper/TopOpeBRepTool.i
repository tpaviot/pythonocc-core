/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_topopebreptool.html"
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
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<Bnd_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<TopExp_module.hxx>
#include<BRepAdaptor_module.hxx>
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
%import TopoDS.i
%import TopAbs.i
%import Bnd.i
%import Geom2d.i
%import Geom.i
%import gp.i
%import TopExp.i
%import BRepAdaptor.i

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
%ignore NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_C2DF>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_C2DF>::KeyValues;
%template(TopOpeBRepTool_DataMapOfOrientedShapeC2DF) NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_C2DF>;
%ignore NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_ListOfC2DF,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_ListOfC2DF,TopTools_ShapeMapHasher>::KeyValues;
%template(TopOpeBRepTool_DataMapOfShapeListOfC2DF) NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_ListOfC2DF,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_face,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_face,TopTools_ShapeMapHasher>::KeyValues;
%template(TopOpeBRepTool_DataMapOfShapeface) NCollection_DataMap<TopoDS_Shape,TopOpeBRepTool_face,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box>::Contained;
%template(TopOpeBRepTool_IndexedDataMapOfShapeBox) NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box2d>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box2d>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box2d>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box2d>::Contained;
%template(TopOpeBRepTool_IndexedDataMapOfShapeBox2d) NCollection_IndexedDataMap<TopoDS_Shape,Bnd_Box2d>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepTool_connexity,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepTool_connexity,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepTool_connexity,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepTool_connexity,TopTools_ShapeMapHasher>::Contained;
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
		/****** md5 signature: f4242de747657e00814c5112ebb83502 ******/
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
		static bool CorrectONUVISO(const TopoDS_Face & F, TopoDS_Face & Fsp);

		/****** TopOpeBRepTool::MakeFaces ******/
		/****** md5 signature: 01e569e60c4c1d88d67acbe293247dbc ******/
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
LOF: NCollection_List<TopoDS_Shape>
MshNOK: NCollection_IndexedMap<TopoDS_Shape>
LOFF: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
Builds up the correct list of faces <LOFF> from <LOF>, using faulty shapes from map <MshNOK>. <LOF> is the list of <F>'s descendant faces. returns false if building fails.
") MakeFaces;
		static bool MakeFaces(const TopoDS_Face & F, const NCollection_List<TopoDS_Shape> & LOF, const NCollection_IndexedMap<TopoDS_Shape> & MshNOK, NCollection_List<TopoDS_Shape> & LOFF);

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
		/****** md5 signature: 542703d4b720f3d38a6dbea060c104d4 ******/
		%feature("compactdefaultargs") PurgeClosingEdges;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
FF: TopoDS_Face
MWisOld: NCollection_DataMap<TopoDS_Shape, int, TopTools_ShapeMapHasher>
MshNOK: NCollection_IndexedMap<TopoDS_Shape>

Return
-------
bool

Description
-----------
Fuse edges (in a wire) of a shape where we have useless vertex. In case face <FF> is built on UV-non-connexed wires (with the two closing edges FORWARD and REVERSED, in spite of one only), we find out the faulty edge, add the faulty shapes (edge,wire,face) to <MshNOK>. <FF> is a face descendant of <F>. <MWisOld>(wire) = 1 if wire is wire of <F> 0 wire results from <F>'s wire split. returns false if purge fails.
") PurgeClosingEdges;
		static bool PurgeClosingEdges(const TopoDS_Face & F, const TopoDS_Face & FF, const NCollection_DataMap<TopoDS_Shape, int, TopTools_ShapeMapHasher> & MWisOld, NCollection_IndexedMap<TopoDS_Shape> & MshNOK);

		/****** TopOpeBRepTool::PurgeClosingEdges ******/
		/****** md5 signature: 08e7b36b0d7e79610f3b32b343f3e530 ******/
		%feature("compactdefaultargs") PurgeClosingEdges;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
LOF: NCollection_List<TopoDS_Shape>
MWisOld: NCollection_DataMap<TopoDS_Shape, int, TopTools_ShapeMapHasher>
MshNOK: NCollection_IndexedMap<TopoDS_Shape>

Return
-------
bool

Description
-----------
No available documentation.
") PurgeClosingEdges;
		static bool PurgeClosingEdges(const TopoDS_Face & F, const NCollection_List<TopoDS_Shape> & LOF, const NCollection_DataMap<TopoDS_Shape, int, TopTools_ShapeMapHasher> & MWisOld, NCollection_IndexedMap<TopoDS_Shape> & MshNOK);

		/****** TopOpeBRepTool::Regularize ******/
		/****** md5 signature: 747fb413cac4c573bc242f149e1cc0f6 ******/
		%feature("compactdefaultargs") Regularize;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
aListOfFaces: NCollection_List<TopoDS_Shape>
ESplits: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
bool

Description
-----------
Returns <False> if the face is valid (the UV representation of the face is a set of pcurves connexed by points with connexity 2). Else, splits <aFace> in order to return a list of valid faces.
") Regularize;
		static bool Regularize(const TopoDS_Face & aFace, NCollection_List<TopoDS_Shape> & aListOfFaces, NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & ESplits);

		/****** TopOpeBRepTool::RegularizeFace ******/
		/****** md5 signature: d769b105a0d5ad0b69c4299ba8d9c164 ******/
		%feature("compactdefaultargs") RegularizeFace;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
OldWiresnewWires: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>
aListOfFaces: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
Classify wire's splits of map <OldWiresnewWires> in order to compute <aListOfFaces>, the splits of <aFace>.
") RegularizeFace;
		static bool RegularizeFace(const TopoDS_Face & aFace, const NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & OldWiresnewWires, NCollection_List<TopoDS_Shape> & aListOfFaces);

		/****** TopOpeBRepTool::RegularizeShells ******/
		/****** md5 signature: 1f4f9caf57a36be54d24678b7d1a879c ******/
		%feature("compactdefaultargs") RegularizeShells;
		%feature("autodoc", "
Parameters
----------
aSolid: TopoDS_Solid
OldSheNewShe: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>
FSplits: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
bool

Description
-----------
Returns <False> if the shell is valid (the solid is a set of faces connexed by edges with connexity 2). Else, splits faces of the shell; <OldFacesnewFaces> describes (face, splits of face).
") RegularizeShells;
		static bool RegularizeShells(const TopoDS_Solid & aSolid, NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & OldSheNewShe, NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & FSplits);

		/****** TopOpeBRepTool::RegularizeWires ******/
		/****** md5 signature: e5b37e87402715bd78df9d022fc09aff ******/
		%feature("compactdefaultargs") RegularizeWires;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
OldWiresNewWires: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>
ESplits: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
bool

Description
-----------
Returns <False> if the face is valid (the UV representation of the face is a set of pcurves connexed by points with connexity 2). Else, splits wires of the face, these are boundaries of the new faces to build up; <OldWiresNewWires> describes (wire, splits of wire); <ESplits> describes (edge, edge's splits).
") RegularizeWires;
		static bool RegularizeWires(const TopoDS_Face & aFace, NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & OldWiresNewWires, NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & ESplits);

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
		/****** md5 signature: cc8071bf13e5edee76d3ed83739f7098 ******/
		%feature("compactdefaultargs") MakeAncestors;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum
M: NCollection_IndexedDataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
same as package method TopExp::MapShapeListOfShapes().
") MakeAncestors;
		static void MakeAncestors(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA, NCollection_IndexedDataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & M);

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
		/****** md5 signature: b112ba28a9fc68e902326323f30e7b47 ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
NCollection_List<int >::Iterator

Description
-----------
No available documentation.
") Compare;
		const NCollection_List<int >::Iterator & Compare(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_BoxSort::HAB ******/
		/****** md5 signature: 5d9e94e3ae506b2b55b21710eb15ed0e ******/
		%feature("compactdefaultargs") HAB;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<Bnd_Box>>

Description
-----------
No available documentation.
") HAB;
		const opencascade::handle<NCollection_HArray1<Bnd_Box>> & HAB();

		/****** TopOpeBRepTool_BoxSort::HABShape ******/
		/****** md5 signature: 0e5542ba6834800fbd8eabc2b49b9816 ******/
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
		const TopoDS_Shape HABShape(const int I);

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
		/****** md5 signature: 7d77f1f05b6a151998959f1dd277f3a7 ******/
		%feature("compactdefaultargs") MakeHABCOB;
		%feature("autodoc", "
Parameters
----------
HAB: NCollection_HArray1<Bnd_Box
COB: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") MakeHABCOB;
		static void MakeHABCOB(const opencascade::handle<NCollection_HArray1<Bnd_Box> > & HAB, Bnd_Box & COB);

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
		/****** md5 signature: 02a8fa439e7fc174920aa68e8b5b6916 ******/
		%feature("compactdefaultargs") TouchedShape;
		%feature("autodoc", "
Parameters
----------
I: NCollection_List<int >::Iterator

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") TouchedShape;
		const TopoDS_Shape TouchedShape(const NCollection_List<int >::Iterator & I);

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
		/****** md5 signature: 2f76e741e040af1dc48e297c795e4e1f ******/
		%feature("compactdefaultargs") TopOpeBRepTool_C2DF;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve
f2d: double
l2d: double
tol: double
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF(const opencascade::handle<Geom2d_Curve> & PC, const double f2d, const double l2d, const double tol, const TopoDS_Face & F);

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
		/****** md5 signature: b03ff502b98015dd625bb21b62f1572c ******/
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
		bool IsFace(const TopoDS_Face & F);

		/****** TopOpeBRepTool_C2DF::IsPC ******/
		/****** md5 signature: 7b40a35ef14dba89ba233fad07b6ee11 ******/
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
		bool IsPC(const opencascade::handle<Geom2d_Curve> & PC);

		/****** TopOpeBRepTool_C2DF::PC ******/
		/****** md5 signature: 7645576245d359f7bc6832ba7b6f6665 ******/
		%feature("compactdefaultargs") PC;
		%feature("autodoc", "
Parameters
----------

Return
-------
f2d: double
l2d: double
tol: double

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
		/****** md5 signature: 3ef428fca8a5984ea2e1b5e4e9504f16 ******/
		%feature("compactdefaultargs") SetPC;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve
f2d: double
l2d: double
tol: double

Return
-------
None

Description
-----------
No available documentation.
") SetPC;
		void SetPC(const opencascade::handle<Geom2d_Curve> & PC, const double f2d, const double l2d, const double tol);

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
		/****** md5 signature: 186381db25796adba35be0ea1572461f ******/
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
		bool Add2d(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_CLASSI::ClassiBnd2d ******/
		/****** md5 signature: f7c88e5f89f0bb7587375bc0bf69888a ******/
		%feature("compactdefaultargs") ClassiBnd2d;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
tol: double
checklarge: bool

Return
-------
int

Description
-----------
No available documentation.
") ClassiBnd2d;
		int ClassiBnd2d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const double tol, const bool checklarge);

		/****** TopOpeBRepTool_CLASSI::Classilist ******/
		/****** md5 signature: 9248fbed71c22b7388a1d4d426a35718 ******/
		%feature("compactdefaultargs") Classilist;
		%feature("autodoc", "
Parameters
----------
lS: NCollection_List<TopoDS_Shape>
mapgreasma: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
bool

Description
-----------
No available documentation.
") Classilist;
		bool Classilist(const NCollection_List<TopoDS_Shape> & lS, NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & mapgreasma);

		/****** TopOpeBRepTool_CLASSI::Classip2d ******/
		/****** md5 signature: 78441e21b98aa708279397a9065cf864 ******/
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
		int Classip2d(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const int stabnd2d12);

		/****** TopOpeBRepTool_CLASSI::GetBox2d ******/
		/****** md5 signature: a1c3de74e5eecc2ce005f0df2666f32a ******/
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
		bool GetBox2d(const TopoDS_Shape & S, Bnd_Box2d & Box2d);

		/****** TopOpeBRepTool_CLASSI::Getface ******/
		/****** md5 signature: 0689fd1bd5d47e2ede341e50ef613dcc ******/
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
		bool Getface(const TopoDS_Shape & S, TopOpeBRepTool_face & fa);

		/****** TopOpeBRepTool_CLASSI::HasInit2d ******/
		/****** md5 signature: 7ab05ee3df1f41eff9ccbcd3270c3e99 ******/
		%feature("compactdefaultargs") HasInit2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasInit2d;
		bool HasInit2d();

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
		/****** md5 signature: 937dee5ccd94de403fab10255159c21e ******/
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
		bool AddNewConnexity(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****** TopOpeBRepTool_CORRISO::Connexity ******/
		/****** md5 signature: 910051ff6731d4bb0a92d43d82edce1b ******/
		%feature("compactdefaultargs") Connexity;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
Eds: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
No available documentation.
") Connexity;
		bool Connexity(const TopoDS_Vertex & V, NCollection_List<TopoDS_Shape> & Eds);

		/****** TopOpeBRepTool_CORRISO::EdgeOUTofBoundsUV ******/
		/****** md5 signature: e5b63ee34b4252a880a2f08e5853b411 ******/
		%feature("compactdefaultargs") EdgeOUTofBoundsUV;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
onU: bool
tolx: double

Return
-------
parspE: double

Description
-----------
No available documentation.
") EdgeOUTofBoundsUV;
		int EdgeOUTofBoundsUV(const TopoDS_Edge & E, const bool onU, const double tolx, Standard_Real &OutValue);

		/****** TopOpeBRepTool_CORRISO::EdgeWithFaultyUV ******/
		/****** md5 signature: ef2c82f232ae1f0cda2315595b1cc14e ******/
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
		bool EdgeWithFaultyUV(const TopoDS_Edge & E, Standard_Integer &OutValue);

		/****** TopOpeBRepTool_CORRISO::EdgeWithFaultyUV ******/
		/****** md5 signature: 0dbdc102ede5f06aaa57deaccc229e9b ******/
		%feature("compactdefaultargs") EdgeWithFaultyUV;
		%feature("autodoc", "
Parameters
----------
EdsToCheck: NCollection_List<TopoDS_Shape>
nfybounds: int
fyE: TopoDS_Shape

Return
-------
Ifaulty: int

Description
-----------
No available documentation.
") EdgeWithFaultyUV;
		bool EdgeWithFaultyUV(const NCollection_List<TopoDS_Shape> & EdsToCheck, const int nfybounds, TopoDS_Shape & fyE, Standard_Integer &OutValue);

		/****** TopOpeBRepTool_CORRISO::EdgesOUTofBoundsUV ******/
		/****** md5 signature: bb3657780a183dcc1e5380ee289d994a ******/
		%feature("compactdefaultargs") EdgesOUTofBoundsUV;
		%feature("autodoc", "
Parameters
----------
EdsToCheck: NCollection_List<TopoDS_Shape>
onU: bool
tolx: double
FyEds: NCollection_DataMap<TopoDS_Shape, int>

Return
-------
bool

Description
-----------
No available documentation.
") EdgesOUTofBoundsUV;
		bool EdgesOUTofBoundsUV(const NCollection_List<TopoDS_Shape> & EdsToCheck, const bool onU, const double tolx, NCollection_DataMap<TopoDS_Shape, int> & FyEds);

		/****** TopOpeBRepTool_CORRISO::EdgesWithFaultyUV ******/
		/****** md5 signature: 450596c86bf60ae96520614fb31e51da ******/
		%feature("compactdefaultargs") EdgesWithFaultyUV;
		%feature("autodoc", "
Parameters
----------
EdsToCheck: NCollection_List<TopoDS_Shape>
nfybounds: int
FyEds: NCollection_DataMap<TopoDS_Shape, int>
stopatfirst: bool (optional, default to false)

Return
-------
bool

Description
-----------
No available documentation.
") EdgesWithFaultyUV;
		bool EdgesWithFaultyUV(const NCollection_List<TopoDS_Shape> & EdsToCheck, const int nfybounds, NCollection_DataMap<TopoDS_Shape, int> & FyEds, const bool stopatfirst = false);

		/****** TopOpeBRepTool_CORRISO::Eds ******/
		/****** md5 signature: ec7306d78c8c1dd8206f2997acdd821f ******/
		%feature("compactdefaultargs") Eds;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") Eds;
		const NCollection_List<TopoDS_Shape> Eds();

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
		/****** md5 signature: 1efc80a0f65755d7fc89b3690162fc19 ******/
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
		bool GetnewS(TopoDS_Face & newS);

		/****** TopOpeBRepTool_CORRISO::Init ******/
		/****** md5 signature: 90f6d568abd96ed13fe272843345a85d ******/
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
		bool Init(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_CORRISO::PurgeFyClosingE ******/
		/****** md5 signature: d80752df12d13c16aaa52e5d619b6d6f ******/
		%feature("compactdefaultargs") PurgeFyClosingE;
		%feature("autodoc", "
Parameters
----------
ClEds: NCollection_List<TopoDS_Shape>
fyClEds: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
No available documentation.
") PurgeFyClosingE;
		bool PurgeFyClosingE(const NCollection_List<TopoDS_Shape> & ClEds, NCollection_List<TopoDS_Shape> & fyClEds);

		/****** TopOpeBRepTool_CORRISO::Refclosed ******/
		/****** md5 signature: 9e3ff4fef003b3b834f78d726beeed15 ******/
		%feature("compactdefaultargs") Refclosed;
		%feature("autodoc", "
Parameters
----------
x: int

Return
-------
xperiod: double

Description
-----------
No available documentation.
") Refclosed;
		bool Refclosed(const int x, Standard_Real &OutValue);

		/****** TopOpeBRepTool_CORRISO::RemoveOldConnexity ******/
		/****** md5 signature: ab429131195f467e0f59733fa8a46bb0 ******/
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
		bool RemoveOldConnexity(const TopoDS_Vertex & V, const TopoDS_Edge & E);

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
		/****** md5 signature: db5cb344c61cec30c170a9910f32f65a ******/
		%feature("compactdefaultargs") SetConnexity;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
Eds: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
No available documentation.
") SetConnexity;
		bool SetConnexity(const TopoDS_Vertex & V, const NCollection_List<TopoDS_Shape> & Eds);

		/****** TopOpeBRepTool_CORRISO::SetUVRep ******/
		/****** md5 signature: 551cd305b4065133f9d9147f976d75cb ******/
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
		bool SetUVRep(const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF);

		/****** TopOpeBRepTool_CORRISO::Tol ******/
		/****** md5 signature: b133abdff58880a94ff32677eb9e9b9f ******/
		%feature("compactdefaultargs") Tol;
		%feature("autodoc", "
Parameters
----------
I: int
tol3d: double

Return
-------
double

Description
-----------
No available documentation.
") Tol;
		double Tol(const int I, const double tol3d);

		/****** TopOpeBRepTool_CORRISO::TrslUV ******/
		/****** md5 signature: 4ae6fd473611410c5f206db6c265578c ******/
		%feature("compactdefaultargs") TrslUV;
		%feature("autodoc", "
Parameters
----------
onU: bool
FyEds: NCollection_DataMap<TopoDS_Shape, int>

Return
-------
bool

Description
-----------
No available documentation.
") TrslUV;
		bool TrslUV(const bool onU, const NCollection_DataMap<TopoDS_Shape, int> & FyEds);

		/****** TopOpeBRepTool_CORRISO::UVClosed ******/
		/****** md5 signature: ba2b24802cc7754fd91d2ce4c1004dcc ******/
		%feature("compactdefaultargs") UVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") UVClosed;
		bool UVClosed();

		/****** TopOpeBRepTool_CORRISO::UVRep ******/
		/****** md5 signature: e3331a9e6b6cf2f3d18e0de57776aa71 ******/
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
		bool UVRep(const TopoDS_Edge & E, TopOpeBRepTool_C2DF & C2DF);

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
		/****** md5 signature: 9329e3fc88ef0ef689513d965716da38 ******/
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
		static bool IsProjectable(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C);

		/****** TopOpeBRepTool_CurveTool::MakeBSpline1fromPnt ******/
		/****** md5 signature: 551e64f887c6ab1a4ced31e0c8f30678 ******/
		%feature("compactdefaultargs") MakeBSpline1fromPnt;
		%feature("autodoc", "
Parameters
----------
P: NCollection_Array1<gp_Pnt>

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") MakeBSpline1fromPnt;
		static opencascade::handle<Geom_Curve> MakeBSpline1fromPnt(const NCollection_Array1<gp_Pnt> & P);

		/****** TopOpeBRepTool_CurveTool::MakeBSpline1fromPnt2d ******/
		/****** md5 signature: fb0bcfe018f7cb8b7393456b25ee6b94 ******/
		%feature("compactdefaultargs") MakeBSpline1fromPnt2d;
		%feature("autodoc", "
Parameters
----------
P: NCollection_Array1<gp_Pnt2d>

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") MakeBSpline1fromPnt2d;
		static opencascade::handle<Geom2d_Curve> MakeBSpline1fromPnt2d(const NCollection_Array1<gp_Pnt2d> & P);

		/****** TopOpeBRepTool_CurveTool::MakeCurves ******/
		/****** md5 signature: 0c6e9908bfdbaaf05ef0f6e4f40822d5 ******/
		%feature("compactdefaultargs") MakeCurves;
		%feature("autodoc", "
Parameters
----------
min: double
max: double
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
Tol3d: double
Tol2d: double

Description
-----------
Approximates curves. Returns False in the case of failure.
") MakeCurves;
		bool MakeCurves(const double min, const double max, const opencascade::handle<Geom_Curve> & C3D, const opencascade::handle<Geom2d_Curve> & PC1, const opencascade::handle<Geom2d_Curve> & PC2, const TopoDS_Shape & S1, const TopoDS_Shape & S2, opencascade::handle<Geom_Curve> & C3DN, opencascade::handle<Geom2d_Curve> & PC1N, opencascade::handle<Geom2d_Curve> & PC2N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepTool_CurveTool::MakePCurveOnFace ******/
		/****** md5 signature: 7e4b75f5c5c5ebd1f9caa488eb09c626 ******/
		%feature("compactdefaultargs") MakePCurveOnFace;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
C: Geom_Curve
first: double (optional, default to 0.0)
last: double (optional, default to 0.0)

Return
-------
TolReached2d: double

Description
-----------
No available documentation.
") MakePCurveOnFace;
		static opencascade::handle<Geom2d_Curve> MakePCurveOnFace(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C, Standard_Real &OutValue, const double first = 0.0, const double last = 0.0);

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
		/****** md5 signature: 397fe0fc5f2dfbb13831b691528931d0 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_FuseEdges;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
PerformNow: bool (optional, default to false)

Return
-------
None

Description
-----------
Initialise members and build construction of map of ancestors.
") TopOpeBRepTool_FuseEdges;
		 TopOpeBRepTool_FuseEdges(const TopoDS_Shape & theShape, const bool PerformNow = false);

		/****** TopOpeBRepTool_FuseEdges::AvoidEdges ******/
		/****** md5 signature: f818e50fc2b6589ea6e4232f3ecf29b2 ******/
		%feature("compactdefaultargs") AvoidEdges;
		%feature("autodoc", "
Parameters
----------
theMapEdg: NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
set edges to avoid being fused.
") AvoidEdges;
		void AvoidEdges(const NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher> & theMapEdg);

		/****** TopOpeBRepTool_FuseEdges::Edges ******/
		/****** md5 signature: 5379174e9d14e3e3ea311fe7df3bef29 ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "
Parameters
----------
theMapLstEdg: NCollection_DataMap<int, NCollection_List<TopoDS_Shape> >

Return
-------
None

Description
-----------
returns all the list of edges to be fused each list of the map represent a set of connex edges that can be fused.
") Edges;
		void Edges(NCollection_DataMap<int, NCollection_List<TopoDS_Shape> > & theMapLstEdg);

		/****** TopOpeBRepTool_FuseEdges::Faces ******/
		/****** md5 signature: e6edd7a821bbcfb3e5ad657809fa2a22 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "
Parameters
----------
theMapFac: NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
returns the map of modified faces.
") Faces;
		void Faces(NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher> & theMapFac);

		/****** TopOpeBRepTool_FuseEdges::NbVertices ******/
		/****** md5 signature: 45ce1fb31ba11f2d666ff6e9e2192133 ******/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of vertices candidate to be removed.
") NbVertices;
		int NbVertices();

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
		/****** md5 signature: 69dd616f0de4fac58c62191aaa94e718 ******/
		%feature("compactdefaultargs") ResultEdges;
		%feature("autodoc", "
Parameters
----------
theMapEdg: NCollection_DataMap<int, TopoDS_Shape>

Return
-------
None

Description
-----------
returns all the fused edges. each integer entry in the map corresponds to the integer in the DataMapOfIntegerListOfShape we get in method Edges. That is to say, to the list of edges in theMapLstEdg(i) corresponds the resulting edge theMapEdge(i).
") ResultEdges;
		void ResultEdges(NCollection_DataMap<int, TopoDS_Shape> & theMapEdg);

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
		/****** md5 signature: b76130391a14d6e8f3a8b0d2cf759e18 ******/
		%feature("compactdefaultargs") TopOpeBRepTool_GeomTool;
		%feature("autodoc", "
Parameters
----------
TypeC3D: TopOpeBRepTool_OutCurveType (optional, default to TopOpeBRepTool_BSPLINE1)
CompC3D: bool (optional, default to true)
CompPC1: bool (optional, default to true)
CompPC2: bool (optional, default to true)

Return
-------
None

Description
-----------
Boolean flags <CompC3D>, <CompPC1>, <CompPC2> indicate whether the corresponding result curves <C3D>, <PC1>, <PC2> of MakeCurves method must or not be computed from an intersection line <L>. When the line <L> is a walking one, <TypeC3D> is the kind of the 3D curve <C3D> to compute: - BSPLINE1 to compute a BSpline of degree 1 on the walking points of <L>, - APPROX to build an approximation curve on the walking points of <L>.
") TopOpeBRepTool_GeomTool;
		 TopOpeBRepTool_GeomTool(const TopOpeBRepTool_OutCurveType TypeC3D = TopOpeBRepTool_BSPLINE1, const bool CompC3D = true, const bool CompPC1 = true, const bool CompPC2 = true);

		/****** TopOpeBRepTool_GeomTool::CompC3D ******/
		/****** md5 signature: 4f6718f5b118462d7243686ccefd7b84 ******/
		%feature("compactdefaultargs") CompC3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CompC3D;
		bool CompC3D();

		/****** TopOpeBRepTool_GeomTool::CompPC1 ******/
		/****** md5 signature: 689c2d7aa6ef9a379bf4ce09b9f1cc42 ******/
		%feature("compactdefaultargs") CompPC1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CompPC1;
		bool CompPC1();

		/****** TopOpeBRepTool_GeomTool::CompPC2 ******/
		/****** md5 signature: 434e8c3a31b8c6e74e665da3ea26adc3 ******/
		%feature("compactdefaultargs") CompPC2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CompPC2;
		bool CompPC2();

		/****** TopOpeBRepTool_GeomTool::Define ******/
		/****** md5 signature: a9fd75e28b5cfb88837d2a1c5f8b59d6 ******/
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
		void Define(const TopOpeBRepTool_OutCurveType TypeC3D, const bool CompC3D, const bool CompPC1, const bool CompPC2);

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
		/****** md5 signature: 007692659fb7a9a1a376ede3cea1e350 ******/
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
		void DefineCurves(const bool CompC3D);

		/****** TopOpeBRepTool_GeomTool::DefinePCurves1 ******/
		/****** md5 signature: 2f3fffc9e4eb8b8c988945a87b76f2a9 ******/
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
		void DefinePCurves1(const bool CompPC1);

		/****** TopOpeBRepTool_GeomTool::DefinePCurves2 ******/
		/****** md5 signature: 81987b8c45ea4ccdb24fab5c9b8a4036 ******/
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
		void DefinePCurves2(const bool CompPC2);

		/****** TopOpeBRepTool_GeomTool::GetTolerances ******/
		/****** md5 signature: de5101e1353d5941dcbeb731d79a552c ******/
		%feature("compactdefaultargs") GetTolerances;
		%feature("autodoc", "
Parameters
----------

Return
-------
tol3d: double
tol2d: double

Description
-----------
No available documentation.
") GetTolerances;
		void GetTolerances(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepTool_GeomTool::NbPntMax ******/
		/****** md5 signature: 3f4d93e814ee82342ef7cb14603868f7 ******/
		%feature("compactdefaultargs") NbPntMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPntMax;
		int NbPntMax();

		/****** TopOpeBRepTool_GeomTool::SetNbPntMax ******/
		/****** md5 signature: b9f3dbfbd7b73e9583529f1ece318e3e ******/
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
		void SetNbPntMax(const int NbPntMax);

		/****** TopOpeBRepTool_GeomTool::SetTolerances ******/
		/****** md5 signature: 541c85269c1a7bcf565df2f053f52fc7 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
tol3d: double
tol2d: double

Return
-------
None

Description
-----------
No available documentation.
") SetTolerances;
		void SetTolerances(const double tol3d, const double tol2d);

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
		/****** md5 signature: f8608e87ae2c8afd481635d76ba44cac ******/
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
		const Bnd_Box & Box(const int I);

		/****** TopOpeBRepTool_HBoxTool::ChangeIMS ******/
		/****** md5 signature: 74760b1a783449183fa848ed38f75b6e ******/
		%feature("compactdefaultargs") ChangeIMS;
		%feature("autodoc", "Return
-------
NCollection_IndexedDataMap<TopoDS_Shape, Bnd_Box>

Description
-----------
No available documentation.
") ChangeIMS;
		NCollection_IndexedDataMap<TopoDS_Shape, Bnd_Box> ChangeIMS();

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
		/****** md5 signature: 1c9a99c4f72ae2188a5b950ee752d850 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		int Extent();

		/****** TopOpeBRepTool_HBoxTool::HasBox ******/
		/****** md5 signature: 7a53c0b657531b266c69b4d471cbb1d3 ******/
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
		bool HasBox(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_HBoxTool::IMS ******/
		/****** md5 signature: ca63947a07f97758712822650bb51a5c ******/
		%feature("compactdefaultargs") IMS;
		%feature("autodoc", "Return
-------
NCollection_IndexedDataMap<TopoDS_Shape, Bnd_Box>

Description
-----------
No available documentation.
") IMS;
		const NCollection_IndexedDataMap<TopoDS_Shape, Bnd_Box> IMS();

		/****** TopOpeBRepTool_HBoxTool::Index ******/
		/****** md5 signature: 27bedbe3f62518ea8f5e80df9093520c ******/
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
		int Index(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_HBoxTool::Shape ******/
		/****** md5 signature: 423b5916c729d75db6f495221f509ab9 ******/
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
		const TopoDS_Shape Shape(const int I);

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
		/****** md5 signature: 5fca51d53a611cb4179ed44395f4a30b ******/
		%feature("compactdefaultargs") TopOpeBRepTool_PurgeInternalEdges;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
PerformNow: bool (optional, default to true)

Return
-------
None

Description
-----------
Initialize members and begin exploration of shape depending of the value of PerformNow.
") TopOpeBRepTool_PurgeInternalEdges;
		 TopOpeBRepTool_PurgeInternalEdges(const TopoDS_Shape & theShape, const bool PerformNow = true);

		/****** TopOpeBRepTool_PurgeInternalEdges::Faces ******/
		/****** md5 signature: c7a52cc5111c071da51e85f98730d715 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "
Parameters
----------
theMapFacLstEdg: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
returns the list internal edges associated with the faces of the myShape. If PerformNow was False when created, then call the private Perform method that do the main job.
") Faces;
		void Faces(NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & theMapFacLstEdg);

		/****** TopOpeBRepTool_PurgeInternalEdges::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the list of internal edges has not been extracted.
") IsDone;
		bool IsDone();

		/****** TopOpeBRepTool_PurgeInternalEdges::NbEdges ******/
		/****** md5 signature: f741965989565caaff095f09d2955db8 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of edges candidate to be removed.
") NbEdges;
		int NbEdges();

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
		/****** md5 signature: b0c518cbe7a67ced56fd81ab05c7ce18 ******/
		%feature("compactdefaultargs") GetFsplits;
		%feature("autodoc", "
Parameters
----------
Fsplits: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") GetFsplits;
		void GetFsplits(NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & Fsplits);

		/****** TopOpeBRepTool_REGUS::GetOshNsh ******/
		/****** md5 signature: ec06b96eac8e1ea6c6a3fd5917f6925f ******/
		%feature("compactdefaultargs") GetOshNsh;
		%feature("autodoc", "
Parameters
----------
OshNsh: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") GetOshNsh;
		void GetOshNsh(NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & OshNsh);

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
		/****** md5 signature: 7a1f5816a66c01c9c9edbb97be8d6529 ******/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") InitBlock;
		bool InitBlock();

		/****** TopOpeBRepTool_REGUS::MapS ******/
		/****** md5 signature: 13a98471f64a615bb3ef82d531dc3d48 ******/
		%feature("compactdefaultargs") MapS;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MapS;
		bool MapS();

		/****** TopOpeBRepTool_REGUS::NearestF ******/
		/****** md5 signature: 30175560dd3c4fa7d37c062a4ccf287d ******/
		%feature("compactdefaultargs") NearestF;
		%feature("autodoc", "
Parameters
----------
e: TopoDS_Edge
lof: NCollection_List<TopoDS_Shape>
ffound: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") NearestF;
		bool NearestF(const TopoDS_Edge & e, const NCollection_List<TopoDS_Shape> & lof, TopoDS_Face & ffound);

		/****** TopOpeBRepTool_REGUS::NextinBlock ******/
		/****** md5 signature: c3561274269a7a7271fdf1db881e0fb6 ******/
		%feature("compactdefaultargs") NextinBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") NextinBlock;
		bool NextinBlock();

		/****** TopOpeBRepTool_REGUS::REGU ******/
		/****** md5 signature: 1e4f2ebeffad9a08284437031e8950e2 ******/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") REGU;
		bool REGU();

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
		/****** md5 signature: 0fbd04d861fbe92d11db09d5633de665 ******/
		%feature("compactdefaultargs") SetFsplits;
		%feature("autodoc", "
Parameters
----------
Fsplits: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") SetFsplits;
		void SetFsplits(NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & Fsplits);

		/****** TopOpeBRepTool_REGUS::SetOshNsh ******/
		/****** md5 signature: 207c6ebfe7030aad4b1689e808049ead ******/
		%feature("compactdefaultargs") SetOshNsh;
		%feature("autodoc", "
Parameters
----------
OshNsh: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") SetOshNsh;
		void SetOshNsh(NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & OshNsh);

		/****** TopOpeBRepTool_REGUS::SplitF ******/
		/****** md5 signature: 02ea9be6a3b141bb6b629e5cbb1dc2b9 ******/
		%feature("compactdefaultargs") SplitF;
		%feature("autodoc", "
Parameters
----------
Fanc: TopoDS_Face
FSplits: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
No available documentation.
") SplitF;
		static bool SplitF(const TopoDS_Face & Fanc, NCollection_List<TopoDS_Shape> & FSplits);

		/****** TopOpeBRepTool_REGUS::SplitFaces ******/
		/****** md5 signature: 50a561cb56af912258dc36e71d082583 ******/
		%feature("compactdefaultargs") SplitFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SplitFaces;
		bool SplitFaces();

		/****** TopOpeBRepTool_REGUS::WireToFace ******/
		/****** md5 signature: 6e9bf59a51d00599e7ab8721770484e4 ******/
		%feature("compactdefaultargs") WireToFace;
		%feature("autodoc", "
Parameters
----------
Fanc: TopoDS_Face
nWs: NCollection_List<TopoDS_Shape>
nFs: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
No available documentation.
") WireToFace;
		static bool WireToFace(const TopoDS_Face & Fanc, const NCollection_List<TopoDS_Shape> & nWs, NCollection_List<TopoDS_Shape> & nFs);

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
		/****** md5 signature: 855cd0354523507e26b69670aafc597a ******/
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
		bool AddNewConnexity(const TopoDS_Vertex & v, const int OriKey, const TopoDS_Edge & e);

		/****** TopOpeBRepTool_REGUW::Connexity ******/
		/****** md5 signature: e588c0e57b632081f2699cc584d64b79 ******/
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
		bool Connexity(const TopoDS_Vertex & v, TopOpeBRepTool_connexity & co);

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
		/****** md5 signature: d267734e51b7f62cf5775dbf4b6a4a41 ******/
		%feature("compactdefaultargs") GetEsplits;
		%feature("autodoc", "
Parameters
----------
Esplits: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") GetEsplits;
		void GetEsplits(NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & Esplits);

		/****** TopOpeBRepTool_REGUW::GetOwNw ******/
		/****** md5 signature: 164436ffa793c269786b43e7df1a92ee ******/
		%feature("compactdefaultargs") GetOwNw;
		%feature("autodoc", "
Parameters
----------
OwNw: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") GetOwNw;
		void GetOwNw(NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & OwNw);

		/****** TopOpeBRepTool_REGUW::GetSplits ******/
		/****** md5 signature: 56eeca404d9c7426a258435b17b9982e ******/
		%feature("compactdefaultargs") GetSplits;
		%feature("autodoc", "
Parameters
----------
Splits: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
No available documentation.
") GetSplits;
		bool GetSplits(NCollection_List<TopoDS_Shape> & Splits);

		/****** TopOpeBRepTool_REGUW::HasInit ******/
		/****** md5 signature: e09846764de6d31b90cca6e1c2404569 ******/
		%feature("compactdefaultargs") HasInit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasInit;
		bool HasInit();

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
		/****** md5 signature: 7a1f5816a66c01c9c9edbb97be8d6529 ******/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") InitBlock;
		bool InitBlock();

		/****** TopOpeBRepTool_REGUW::MapS ******/
		/****** md5 signature: 13a98471f64a615bb3ef82d531dc3d48 ******/
		%feature("compactdefaultargs") MapS;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MapS;
		bool MapS();

		/****** TopOpeBRepTool_REGUW::NearestE ******/
		/****** md5 signature: d31ce699218052002172119dd7f57ba0 ******/
		%feature("compactdefaultargs") NearestE;
		%feature("autodoc", "
Parameters
----------
loe: NCollection_List<TopoDS_Shape>
efound: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") NearestE;
		bool NearestE(const NCollection_List<TopoDS_Shape> & loe, TopoDS_Edge & efound);

		/****** TopOpeBRepTool_REGUW::NextinBlock ******/
		/****** md5 signature: c3561274269a7a7271fdf1db881e0fb6 ******/
		%feature("compactdefaultargs") NextinBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") NextinBlock;
		bool NextinBlock();

		/****** TopOpeBRepTool_REGUW::REGU ******/
		/****** md5 signature: 40d02e000b061ffe73b80df631257e7c ******/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "
Parameters
----------
istep: int
Scur: TopoDS_Shape
Splits: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
No available documentation.
") REGU;
		bool REGU(const int istep, const TopoDS_Shape & Scur, NCollection_List<TopoDS_Shape> & Splits);

		/****** TopOpeBRepTool_REGUW::REGU ******/
		/****** md5 signature: 1e4f2ebeffad9a08284437031e8950e2 ******/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") REGU;
		bool REGU();

		/****** TopOpeBRepTool_REGUW::RemoveOldConnexity ******/
		/****** md5 signature: 1f424a5edc0be696f1f143d1f4e09d19 ******/
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
		bool RemoveOldConnexity(const TopoDS_Vertex & v, const int OriKey, const TopoDS_Edge & e);

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
		/****** md5 signature: ba78d9f18d956911a2ae34eb6c9ed605 ******/
		%feature("compactdefaultargs") SetEsplits;
		%feature("autodoc", "
Parameters
----------
Esplits: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") SetEsplits;
		void SetEsplits(NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & Esplits);

		/****** TopOpeBRepTool_REGUW::SetOwNw ******/
		/****** md5 signature: 06a6b493e333a3518a7f319556a023ff ******/
		%feature("compactdefaultargs") SetOwNw;
		%feature("autodoc", "
Parameters
----------
OwNw: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") SetOwNw;
		void SetOwNw(NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & OwNw);

		/****** TopOpeBRepTool_REGUW::SplitEds ******/
		/****** md5 signature: 8c391102cc00ab394b14efd652f78184 ******/
		%feature("compactdefaultargs") SplitEds;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SplitEds;
		bool SplitEds();

		/****** TopOpeBRepTool_REGUW::UpdateMultiple ******/
		/****** md5 signature: fc6bea0098574400a031e1f38cbe7207 ******/
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
		bool UpdateMultiple(const TopoDS_Vertex & v);

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
		/****** md5 signature: 1f02211ef6f2403c33db3be690933624 ******/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") SameDomain;
		int SameDomain();

		/****** TopOpeBRepTool_ShapeClassifier::SameDomain ******/
		/****** md5 signature: 919429f8e6addad8b3cbb4662eefa8e1 ******/
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
		void SameDomain(const int samedomain);

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
		/****** md5 signature: f87dc2716f2843a68156cbdf751177b4 ******/
		%feature("compactdefaultargs") StateShapeReference;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LAvoidS: NCollection_List<TopoDS_Shape>

Return
-------
TopAbs_State

Description
-----------
classify shape S compared with reference shape. LAvoidS is list of S subshapes to avoid in classification (useful to avoid ON or UNKNOWN state in special cases).
") StateShapeReference;
		TopAbs_State StateShapeReference(const TopoDS_Shape & S, const NCollection_List<TopoDS_Shape> & LAvoidS);

		/****** TopOpeBRepTool_ShapeClassifier::StateShapeShape ******/
		/****** md5 signature: d40d1179bee32f88a779167a0ef13fb9 ******/
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
		TopAbs_State StateShapeShape(const TopoDS_Shape & S, const TopoDS_Shape & SRef, const int samedomain = 0);

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
		/****** md5 signature: f9f2035435bb4b334a1b880f732abe29 ******/
		%feature("compactdefaultargs") StateShapeShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LAvoidS: NCollection_List<TopoDS_Shape>
SRef: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
classify shape S compared with shape SRef. LAvoidS is list of S subshapes to avoid in classification AvoidS is not used in classification; AvoidS may be IsNull(). (useful to avoid ON or UNKNOWN state in special cases).
") StateShapeShape;
		TopAbs_State StateShapeShape(const TopoDS_Shape & S, const NCollection_List<TopoDS_Shape> & LAvoidS, const TopoDS_Shape & SRef);

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
		/****** md5 signature: 4fc88a71a4ab819038de9a6160c989c2 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Index of current sub-shape.
") Index;
		int Index();

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
		/****** md5 signature: ec5fce7eceddd95eaecc9b21380f00e1 ******/
		%feature("compactdefaultargs") AdjustOnPeriodic;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
u: double
v: double

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
		/****** md5 signature: 2f0371d244aaf8ff4d095502b1cadaa1 ******/
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
		static bool Closed(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepTool_ShapeTool::CurvesSameOriented ******/
		/****** md5 signature: 64d061ae5458a1575ddfda7739c2a971 ******/
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
		static bool CurvesSameOriented(const BRepAdaptor_Curve & C1, const BRepAdaptor_Curve & C2);

		/****** TopOpeBRepTool_ShapeTool::EdgeData ******/
		/****** md5 signature: 658fec0aecd5413840818e5b0d61a48c ******/
		%feature("compactdefaultargs") EdgeData;
		%feature("autodoc", "
Parameters
----------
BRAC: BRepAdaptor_Curve
P: double
T: gp_Dir
N: gp_Dir

Return
-------
C: double

Description
-----------
Compute tangent T, normal N, curvature C at point of parameter P on curve BRAC. Returns the tolerance indicating if T,N are null.
") EdgeData;
		static double EdgeData(const BRepAdaptor_Curve & BRAC, const double P, gp_Dir & T, gp_Dir & N, Standard_Real &OutValue);

		/****** TopOpeBRepTool_ShapeTool::EdgeData ******/
		/****** md5 signature: 2c12944e32ee652612359570530a932e ******/
		%feature("compactdefaultargs") EdgeData;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
P: double
T: gp_Dir
N: gp_Dir

Return
-------
C: double

Description
-----------
Same as previous on edge E.
") EdgeData;
		static double EdgeData(const TopoDS_Shape & E, const double P, gp_Dir & T, gp_Dir & N, Standard_Real &OutValue);

		/****** TopOpeBRepTool_ShapeTool::EdgesSameOriented ******/
		/****** md5 signature: 06bccf8d7971305c5b26065313344b8a ******/
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
		static bool EdgesSameOriented(const TopoDS_Shape & E1, const TopoDS_Shape & E2);

		/****** TopOpeBRepTool_ShapeTool::FacesSameOriented ******/
		/****** md5 signature: b8a84eebe685b02578f221127d5d94eb ******/
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
		static bool FacesSameOriented(const TopoDS_Shape & F1, const TopoDS_Shape & F2);

		/****** TopOpeBRepTool_ShapeTool::PeriodizeParameter ******/
		/****** md5 signature: 544af6ac9ceb3ba4733f79bb66e9b183 ******/
		%feature("compactdefaultargs") PeriodizeParameter;
		%feature("autodoc", "
Parameters
----------
par: double
EE: TopoDS_Shape
FF: TopoDS_Shape

Return
-------
double

Description
-----------
No available documentation.
") PeriodizeParameter;
		static double PeriodizeParameter(const double par, const TopoDS_Shape & EE, const TopoDS_Shape & FF);

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
		/****** md5 signature: 333f7246a9374cca4040bf1b94186726 ******/
		%feature("compactdefaultargs") Resolution3d;
		%feature("autodoc", "
Parameters
----------
SU: Geom_Surface
Tol2d: double

Return
-------
double

Description
-----------
No available documentation.
") Resolution3d;
		static double Resolution3d(const opencascade::handle<Geom_Surface> & SU, const double Tol2d);

		/****** TopOpeBRepTool_ShapeTool::Resolution3d ******/
		/****** md5 signature: 847a4a427361acc811942bc46f3bfc98 ******/
		%feature("compactdefaultargs") Resolution3d;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol2d: double

Return
-------
double

Description
-----------
No available documentation.
") Resolution3d;
		static double Resolution3d(const TopoDS_Face & F, const double Tol2d);

		/****** TopOpeBRepTool_ShapeTool::Resolution3dU ******/
		/****** md5 signature: eb8e548ab6b847a3ac004ccc464583eb ******/
		%feature("compactdefaultargs") Resolution3dU;
		%feature("autodoc", "
Parameters
----------
SU: Geom_Surface
Tol2d: double

Return
-------
double

Description
-----------
No available documentation.
") Resolution3dU;
		static double Resolution3dU(const opencascade::handle<Geom_Surface> & SU, const double Tol2d);

		/****** TopOpeBRepTool_ShapeTool::Resolution3dV ******/
		/****** md5 signature: 43b81f9d250d194ad485dfba7829bda0 ******/
		%feature("compactdefaultargs") Resolution3dV;
		%feature("autodoc", "
Parameters
----------
SU: Geom_Surface
Tol2d: double

Return
-------
double

Description
-----------
No available documentation.
") Resolution3dV;
		static double Resolution3dV(const opencascade::handle<Geom_Surface> & SU, const double Tol2d);

		/****** TopOpeBRepTool_ShapeTool::ShapesSameOriented ******/
		/****** md5 signature: ef654f4d33e8ce239ca66b5698363d6b ******/
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
		static bool ShapesSameOriented(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepTool_ShapeTool::SurfacesSameOriented ******/
		/****** md5 signature: bfdc0a3a9594febab2a60cebddc3009e ******/
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
		static bool SurfacesSameOriented(const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2);

		/****** TopOpeBRepTool_ShapeTool::Tolerance ******/
		/****** md5 signature: 70d765efd6b405975e913a38fd100bba ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
double

Description
-----------
Returns the tolerance of the shape <S>. If the shape <S> is Null, returns 0.
") Tolerance;
		static double Tolerance(const TopoDS_Shape & S);

		/****** TopOpeBRepTool_ShapeTool::UVBOUNDS ******/
		/****** md5 signature: a43c599315594cbad0e9aef92f0b6014 ******/
		%feature("compactdefaultargs") UVBOUNDS;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
UPeri: bool
VPeri: bool
Umin: double
Umax: double
Vmin: double
Vmax: double

Description
-----------
No available documentation.
") UVBOUNDS;
		static void UVBOUNDS(const opencascade::handle<Geom_Surface> & S, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepTool_ShapeTool::UVBOUNDS ******/
		/****** md5 signature: 3f93751b76d3a9746114c3ee78f2ffe5 ******/
		%feature("compactdefaultargs") UVBOUNDS;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
UPeri: bool
VPeri: bool
Umin: double
Umax: double
Vmin: double
Vmax: double

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
		/****** md5 signature: 61f2887b2063f88dc64553c1b5585f0a ******/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid
P: gp_Pnt
Tol: double

Return
-------
TopAbs_State

Description
-----------
compute the position of point <P> regarding with the geometric domain of the solid <S>.
") Classify;
		TopAbs_State Classify(const TopoDS_Solid & S, const gp_Pnt & P, const double Tol);

		/****** TopOpeBRepTool_SolidClassifier::Classify ******/
		/****** md5 signature: ed5eaef2ab58b60869b4a52dfde89f67 ******/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell
P: gp_Pnt
Tol: double

Return
-------
TopAbs_State

Description
-----------
compute the position of point <P> regarding with the geometric domain of the shell <S>.
") Classify;
		TopAbs_State Classify(const TopoDS_Shell & S, const gp_Pnt & P, const double Tol);

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
		/****** md5 signature: 2601f2605289d2653d2192851a617bc5 ******/
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
		static bool ClosedE(const TopoDS_Edge & E, TopoDS_Vertex & vclo);

		/****** TopOpeBRepTool_TOOL::ClosedS ******/
		/****** md5 signature: 4760f6625e4f6fdb9bff93ce294bacbd ******/
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
		static bool ClosedS(const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::CurvE ******/
		/****** md5 signature: 516fb6339d03b0ee213f7cd245796de7 ******/
		%feature("compactdefaultargs") CurvE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
par: double
tg0: gp_Dir

Return
-------
Curv: double

Description
-----------
No available documentation.
") CurvE;
		static bool CurvE(const TopoDS_Edge & E, const double par, const gp_Dir & tg0, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::CurvF ******/
		/****** md5 signature: 11d8f465c1faee7644402914479f0723 ******/
		%feature("compactdefaultargs") CurvF;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
uv: gp_Pnt2d
tg0: gp_Dir

Return
-------
Curv: double
direct: bool

Description
-----------
No available documentation.
") CurvF;
		static bool CurvF(const TopoDS_Face & F, const gp_Pnt2d & uv, const gp_Dir & tg0, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****** TopOpeBRepTool_TOOL::EdgeONFace ******/
		/****** md5 signature: 1577547c430c28699e2ed610304652d8 ******/
		%feature("compactdefaultargs") EdgeONFace;
		%feature("autodoc", "
Parameters
----------
par: double
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
		static bool EdgeONFace(const double par, const TopoDS_Edge & ed, const gp_Pnt2d & uv, const TopoDS_Face & fa, Standard_Boolean &OutValue);

		/****** TopOpeBRepTool_TOOL::Getduv ******/
		/****** md5 signature: cf5b88ff33707e0b562dd9c0723a05aa ******/
		%feature("compactdefaultargs") Getduv;
		%feature("autodoc", "
Parameters
----------
f: TopoDS_Face
uv: gp_Pnt2d
dir: gp_Vec
factor: double
duv: gp_Dir2d

Return
-------
bool

Description
-----------
No available documentation.
") Getduv;
		static bool Getduv(const TopoDS_Face & f, const gp_Pnt2d & uv, const gp_Vec & dir, const double factor, gp_Dir2d & duv);

		/****** TopOpeBRepTool_TOOL::Getstp3dF ******/
		/****** md5 signature: b1ac7256c9c19a91aba0614cddca1e80 ******/
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
		static bool Getstp3dF(const gp_Pnt & p, const TopoDS_Face & f, gp_Pnt2d & uv, TopAbs_State &OutValue);

		/****** TopOpeBRepTool_TOOL::IsClosingE ******/
		/****** md5 signature: 3e762ceafafddb428fcb5ab74b29c5d1 ******/
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
		static bool IsClosingE(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::IsClosingE ******/
		/****** md5 signature: ad2a0d47169ef72d0e0248c60eae8ee2 ******/
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
		static bool IsClosingE(const TopoDS_Edge & E, const TopoDS_Shape & W, const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::IsQuad ******/
		/****** md5 signature: 0d4f77200ac12d26c74570078a1a9a53 ******/
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
		static bool IsQuad(const TopoDS_Edge & E);

		/****** TopOpeBRepTool_TOOL::IsQuad ******/
		/****** md5 signature: e21e5465bb377f108b91d75a3f4b0159 ******/
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
		static bool IsQuad(const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::IsonCLO ******/
		/****** md5 signature: 96cf61c12b86c47f603a0c59c351954b ******/
		%feature("compactdefaultargs") IsonCLO;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve
onU: bool
xfirst: double
xperiod: double
xtol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsonCLO;
		static bool IsonCLO(const opencascade::handle<Geom2d_Curve> & PC, const bool onU, const double xfirst, const double xperiod, const double xtol);

		/****** TopOpeBRepTool_TOOL::IsonCLO ******/
		/****** md5 signature: 5d7eaa74f037468dfc3f0d6609b53fb7 ******/
		%feature("compactdefaultargs") IsonCLO;
		%feature("autodoc", "
Parameters
----------
C2DF: TopOpeBRepTool_C2DF
onU: bool
xfirst: double
xperiod: double
xtol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsonCLO;
		static bool IsonCLO(const TopOpeBRepTool_C2DF & C2DF, const bool onU, const double xfirst, const double xperiod, const double xtol);

		/****** TopOpeBRepTool_TOOL::Matter ******/
		/****** md5 signature: 191cf55c41f137f262c6cce4443be6f4 ******/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "
Parameters
----------
d1: gp_Vec
d2: gp_Vec
ref: gp_Vec

Return
-------
double

Description
-----------
No available documentation.
") Matter;
		static double Matter(const gp_Vec & d1, const gp_Vec & d2, const gp_Vec & ref);

		/****** TopOpeBRepTool_TOOL::Matter ******/
		/****** md5 signature: 2988c9d2e8235ca85fb6b293f9c3756c ******/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "
Parameters
----------
d1: gp_Vec2d
d2: gp_Vec2d

Return
-------
double

Description
-----------
No available documentation.
") Matter;
		static double Matter(const gp_Vec2d & d1, const gp_Vec2d & d2);

		/****** TopOpeBRepTool_TOOL::Matter ******/
		/****** md5 signature: 31a69d87bc7ce3e506c6a9afd37481d0 ******/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "
Parameters
----------
xx1: gp_Dir
nt1: gp_Dir
xx2: gp_Dir
nt2: gp_Dir
tola: double

Return
-------
Ang: double

Description
-----------
No available documentation.
") Matter;
		static bool Matter(const gp_Dir & xx1, const gp_Dir & nt1, const gp_Dir & xx2, const gp_Dir & nt2, const double tola, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::Matter ******/
		/****** md5 signature: cade03e4357ad3eccc188c123e1e498f ******/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", "
Parameters
----------
f1: TopoDS_Face
f2: TopoDS_Face
e: TopoDS_Edge
pare: double
tola: double

Return
-------
Ang: double

Description
-----------
No available documentation.
") Matter;
		static bool Matter(const TopoDS_Face & f1, const TopoDS_Face & f2, const TopoDS_Edge & e, const double pare, const double tola, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::MatterKPtg ******/
		/****** md5 signature: 7b6109d53d6c43c5d1e9c8cbf1b52743 ******/
		%feature("compactdefaultargs") MatterKPtg;
		%feature("autodoc", "
Parameters
----------
f1: TopoDS_Face
f2: TopoDS_Face
e: TopoDS_Edge

Return
-------
Ang: double

Description
-----------
No available documentation.
") MatterKPtg;
		static bool MatterKPtg(const TopoDS_Face & f1, const TopoDS_Face & f2, const TopoDS_Edge & e, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::MkShell ******/
		/****** md5 signature: 08e47ef4e6277291dfc481cb5ecfc6a1 ******/
		%feature("compactdefaultargs") MkShell;
		%feature("autodoc", "
Parameters
----------
lF: NCollection_List<TopoDS_Shape>
She: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MkShell;
		static void MkShell(const NCollection_List<TopoDS_Shape> & lF, TopoDS_Shape & She);

		/****** TopOpeBRepTool_TOOL::NgApp ******/
		/****** md5 signature: de567cea1aa04f99f01379950df430b0 ******/
		%feature("compactdefaultargs") NgApp;
		%feature("autodoc", "
Parameters
----------
par: double
E: TopoDS_Edge
F: TopoDS_Face
tola: double
ngApp: gp_Dir

Return
-------
bool

Description
-----------
No available documentation.
") NgApp;
		static bool NgApp(const double par, const TopoDS_Edge & E, const TopoDS_Face & F, const double tola, gp_Dir & ngApp);

		/****** TopOpeBRepTool_TOOL::NggeomF ******/
		/****** md5 signature: 7a5835e76db9cc90799c290e6975d130 ******/
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
		static bool NggeomF(const gp_Pnt2d & uv, const TopoDS_Face & F, gp_Vec & ng);

		/****** TopOpeBRepTool_TOOL::Nt ******/
		/****** md5 signature: a8f05362e2a02e8bfc8af28cbc502905 ******/
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
		static bool Nt(const gp_Pnt2d & uv, const TopoDS_Face & f, gp_Dir & normt);

		/****** TopOpeBRepTool_TOOL::OnBoundary ******/
		/****** md5 signature: e7cd65245e5032bbd94e342ca745e421 ******/
		%feature("compactdefaultargs") OnBoundary;
		%feature("autodoc", "
Parameters
----------
par: double
E: TopoDS_Edge

Return
-------
int

Description
-----------
No available documentation.
") OnBoundary;
		static int OnBoundary(const double par, const TopoDS_Edge & E);

		/****** TopOpeBRepTool_TOOL::OriinSor ******/
		/****** md5 signature: 1550e364249cee8c0fbcc7f77a5fa008 ******/
		%feature("compactdefaultargs") OriinSor;
		%feature("autodoc", "
Parameters
----------
sub: TopoDS_Shape
S: TopoDS_Shape
checkclo: bool (optional, default to false)

Return
-------
int

Description
-----------
No available documentation.
") OriinSor;
		static int OriinSor(const TopoDS_Shape & sub, const TopoDS_Shape & S, const bool checkclo = false);

		/****** TopOpeBRepTool_TOOL::OriinSorclosed ******/
		/****** md5 signature: 235f359b790cba17659cf5e6aaefec26 ******/
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
		static int OriinSorclosed(const TopoDS_Shape & sub, const TopoDS_Shape & S);

		/****** TopOpeBRepTool_TOOL::ParE ******/
		/****** md5 signature: a72c2e28719c693b4376dcf17123f738 ******/
		%feature("compactdefaultargs") ParE;
		%feature("autodoc", "
Parameters
----------
Iv: int
E: TopoDS_Edge

Return
-------
double

Description
-----------
No available documentation.
") ParE;
		static double ParE(const int Iv, const TopoDS_Edge & E);

		/****** TopOpeBRepTool_TOOL::ParE2d ******/
		/****** md5 signature: 405f604bdeeb3abafba22b28227b954f ******/
		%feature("compactdefaultargs") ParE2d;
		%feature("autodoc", "
Parameters
----------
p2d: gp_Pnt2d
e: TopoDS_Edge
f: TopoDS_Face

Return
-------
par: double
dist: double

Description
-----------
No available documentation.
") ParE2d;
		static bool ParE2d(const gp_Pnt2d & p2d, const TopoDS_Edge & e, const TopoDS_Face & f, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::ParISO ******/
		/****** md5 signature: 3661eff56dec8b1919926a8c237a07da ******/
		%feature("compactdefaultargs") ParISO;
		%feature("autodoc", "
Parameters
----------
p2d: gp_Pnt2d
e: TopoDS_Edge
f: TopoDS_Face

Return
-------
pare: double

Description
-----------
No available documentation.
") ParISO;
		static bool ParISO(const gp_Pnt2d & p2d, const TopoDS_Edge & e, const TopoDS_Face & f, Standard_Real &OutValue);

		/****** TopOpeBRepTool_TOOL::Remove ******/
		/****** md5 signature: a3a2961e7a1ef2c43904f392263cc09d ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
loS: NCollection_List<TopoDS_Shape>
toremove: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") Remove;
		static bool Remove(NCollection_List<TopoDS_Shape> & loS, const TopoDS_Shape & toremove);

		/****** TopOpeBRepTool_TOOL::SplitE ******/
		/****** md5 signature: 9bed0ba9c869d22e9eace5c38221b633 ******/
		%feature("compactdefaultargs") SplitE;
		%feature("autodoc", "
Parameters
----------
Eanc: TopoDS_Edge
Splits: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
No available documentation.
") SplitE;
		static bool SplitE(const TopoDS_Edge & Eanc, NCollection_List<TopoDS_Shape> & Splits);

		/****** TopOpeBRepTool_TOOL::Tg2d ******/
		/****** md5 signature: 98f5ada9c2617f0a1566983fb3693cc2 ******/
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
		static gp_Vec2d Tg2d(const int iv, const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF);

		/****** TopOpeBRepTool_TOOL::Tg2dApp ******/
		/****** md5 signature: ad223885752ee1b212ea0fb7da816542 ******/
		%feature("compactdefaultargs") Tg2dApp;
		%feature("autodoc", "
Parameters
----------
iv: int
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF
factor: double

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tg2dApp;
		static gp_Vec2d Tg2dApp(const int iv, const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF, const double factor);

		/****** TopOpeBRepTool_TOOL::TgINSIDE ******/
		/****** md5 signature: 4097682133e5f2a9a269401b297e1b00 ******/
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
		static bool TgINSIDE(const TopoDS_Vertex & v, const TopoDS_Edge & E, gp_Vec & Tg, Standard_Integer &OutValue);

		/****** TopOpeBRepTool_TOOL::TggeomE ******/
		/****** md5 signature: 137edab7e010222bf61961d115a3ae28 ******/
		%feature("compactdefaultargs") TggeomE;
		%feature("autodoc", "
Parameters
----------
par: double
BC: BRepAdaptor_Curve
Tg: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") TggeomE;
		static bool TggeomE(const double par, const BRepAdaptor_Curve & BC, gp_Vec & Tg);

		/****** TopOpeBRepTool_TOOL::TggeomE ******/
		/****** md5 signature: 07b1ecad761aa9daacb2500664cfe7f4 ******/
		%feature("compactdefaultargs") TggeomE;
		%feature("autodoc", "
Parameters
----------
par: double
E: TopoDS_Edge
Tg: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") TggeomE;
		static bool TggeomE(const double par, const TopoDS_Edge & E, gp_Vec & Tg);

		/****** TopOpeBRepTool_TOOL::TolP ******/
		/****** md5 signature: 49136877f45dd5c961bda9d020e27361 ******/
		%feature("compactdefaultargs") TolP;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
double

Description
-----------
No available documentation.
") TolP;
		static double TolP(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::TolUV ******/
		/****** md5 signature: e658e0bc20b8f2ec6b3271ed9062cc88 ******/
		%feature("compactdefaultargs") TolUV;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
tol3d: double

Return
-------
double

Description
-----------
No available documentation.
") TolUV;
		static double TolUV(const TopoDS_Face & F, const double tol3d);

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
		/****** md5 signature: a6ac54716f5bf9c89d8060c98fffd9a5 ******/
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
		static bool TrslUVModifE(const gp_Vec2d & t2d, const TopoDS_Face & F, TopoDS_Edge & E);

		/****** TopOpeBRepTool_TOOL::UVF ******/
		/****** md5 signature: 64f66c8a7279f4ad944e2a8bc8c6b2d5 ******/
		%feature("compactdefaultargs") UVF;
		%feature("autodoc", "
Parameters
----------
par: double
C2DF: TopOpeBRepTool_C2DF

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") UVF;
		static gp_Pnt2d UVF(const double par, const TopOpeBRepTool_C2DF & C2DF);

		/****** TopOpeBRepTool_TOOL::UVISO ******/
		/****** md5 signature: c832f122feccd8de670ae3b5ee31f6af ******/
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
		static bool UVISO(const opencascade::handle<Geom2d_Curve> & PC, Standard_Boolean &OutValue, Standard_Boolean &OutValue, gp_Dir2d & d2d, gp_Pnt2d & o2d);

		/****** TopOpeBRepTool_TOOL::UVISO ******/
		/****** md5 signature: ad73c3105f1e07dc0bb2f6370c463b4b ******/
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
		static bool UVISO(const TopOpeBRepTool_C2DF & C2DF, Standard_Boolean &OutValue, Standard_Boolean &OutValue, gp_Dir2d & d2d, gp_Pnt2d & o2d);

		/****** TopOpeBRepTool_TOOL::UVISO ******/
		/****** md5 signature: 55e70943727657ca3a4105bb6988b2a3 ******/
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
		static bool UVISO(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Boolean &OutValue, Standard_Boolean &OutValue, gp_Dir2d & d2d, gp_Pnt2d & o2d);

		/****** TopOpeBRepTool_TOOL::Vertex ******/
		/****** md5 signature: 63c5d4bc2b5002f901128f5e5e60e690 ******/
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
		static TopoDS_Vertex Vertex(const int Iv, const TopoDS_Edge & E);

		/****** TopOpeBRepTool_TOOL::Vertices ******/
		/****** md5 signature: 435e2f082b649e4e91ca6eb357b8ffae ******/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
Vces: NCollection_Array1<TopoDS_Shape>

Return
-------
None

Description
-----------
No available documentation.
") Vertices;
		static void Vertices(const TopoDS_Edge & E, NCollection_Array1<TopoDS_Shape> & Vces);

		/****** TopOpeBRepTool_TOOL::WireToFace ******/
		/****** md5 signature: 55fe6c24639394df49cf4fd06b400ee5 ******/
		%feature("compactdefaultargs") WireToFace;
		%feature("autodoc", "
Parameters
----------
Fref: TopoDS_Face
mapWlow: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>
lFs: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
No available documentation.
") WireToFace;
		static bool WireToFace(const TopoDS_Face & Fref, const NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & mapWlow, NCollection_List<TopoDS_Shape> & lFs);

		/****** TopOpeBRepTool_TOOL::XX ******/
		/****** md5 signature: b8a944a9e5ddd1024abe4a72bce34a8a ******/
		%feature("compactdefaultargs") XX;
		%feature("autodoc", "
Parameters
----------
uv: gp_Pnt2d
f: TopoDS_Face
par: double
e: TopoDS_Edge
xx: gp_Dir

Return
-------
bool

Description
-----------
No available documentation.
") XX;
		static bool XX(const gp_Pnt2d & uv, const TopoDS_Face & f, const double par, const TopoDS_Edge & e, gp_Dir & xx);

		/****** TopOpeBRepTool_TOOL::minDUV ******/
		/****** md5 signature: 09f24cb7f2cdfc299a22780d7e1af02f ******/
		%feature("compactdefaultargs") minDUV;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
double

Description
-----------
No available documentation.
") minDUV;
		static double minDUV(const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::outUVbounds ******/
		/****** md5 signature: cb630f1aa79b95fd2b83158a22d74d1d ******/
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
		static bool outUVbounds(const gp_Pnt2d & uv, const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::stuvF ******/
		/****** md5 signature: 3c8cbd05c6a76f35eb7e976b04ffbfd7 ******/
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
		/****** md5 signature: 1f5c18ef35aab7bd11631520fe0114f8 ******/
		%feature("compactdefaultargs") tryNgApp;
		%feature("autodoc", "
Parameters
----------
par: double
E: TopoDS_Edge
F: TopoDS_Face
tola: double
ng: gp_Dir

Return
-------
bool

Description
-----------
No available documentation.
") tryNgApp;
		static bool tryNgApp(const double par, const TopoDS_Edge & E, const TopoDS_Face & F, const double tola, gp_Dir & ng);

		/****** TopOpeBRepTool_TOOL::tryOriEinF ******/
		/****** md5 signature: 6605b362668b85330d101bdced88b254 ******/
		%feature("compactdefaultargs") tryOriEinF;
		%feature("autodoc", "
Parameters
----------
par: double
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
int

Description
-----------
No available documentation.
") tryOriEinF;
		static int tryOriEinF(const double par, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** TopOpeBRepTool_TOOL::tryTg2dApp ******/
		/****** md5 signature: d4ec22c4d1e10e1b1f53db1def4267b9 ******/
		%feature("compactdefaultargs") tryTg2dApp;
		%feature("autodoc", "
Parameters
----------
iv: int
E: TopoDS_Edge
C2DF: TopOpeBRepTool_C2DF
factor: double

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") tryTg2dApp;
		static gp_Vec2d tryTg2dApp(const int iv, const TopoDS_Edge & E, const TopOpeBRepTool_C2DF & C2DF, const double factor);

		/****** TopOpeBRepTool_TOOL::uvApp ******/
		/****** md5 signature: e4a0a29618157b77c63729f72429f57f ******/
		%feature("compactdefaultargs") uvApp;
		%feature("autodoc", "
Parameters
----------
f: TopoDS_Face
e: TopoDS_Edge
par: double
eps: double
uvapp: gp_Pnt2d

Return
-------
bool

Description
-----------
No available documentation.
") uvApp;
		static bool uvApp(const TopoDS_Face & f, const TopoDS_Edge & e, const double par, const double eps, gp_Pnt2d & uvapp);

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
		/****** md5 signature: 6304b8314da98db235ecdb3c80fe4fdb ******/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "
Parameters
----------
OriKey: int
Item: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
No available documentation.
") AddItem;
		void AddItem(const int OriKey, const NCollection_List<TopoDS_Shape> & Item);

		/****** TopOpeBRepTool_connexity::AddItem ******/
		/****** md5 signature: 615c862dd435e13d0ce9540faf467f5c ******/
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
		void AddItem(const int OriKey, const TopoDS_Shape & Item);

		/****** TopOpeBRepTool_connexity::AllItems ******/
		/****** md5 signature: 098b649a40e2868d4e9839d20aa4c2e4 ******/
		%feature("compactdefaultargs") AllItems;
		%feature("autodoc", "
Parameters
----------
Item: NCollection_List<TopoDS_Shape>

Return
-------
int

Description
-----------
No available documentation.
") AllItems;
		int AllItems(NCollection_List<TopoDS_Shape> & Item);

		/****** TopOpeBRepTool_connexity::ChangeItem ******/
		/****** md5 signature: ed1f147f206c674efed247e82c97c0ce ******/
		%feature("compactdefaultargs") ChangeItem;
		%feature("autodoc", "
Parameters
----------
OriKey: int

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") ChangeItem;
		NCollection_List<TopoDS_Shape> ChangeItem(const int OriKey);

		/****** TopOpeBRepTool_connexity::IsFaulty ******/
		/****** md5 signature: b5f45c057392bc4947d7dd9fac1ef73b ******/
		%feature("compactdefaultargs") IsFaulty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsFaulty;
		bool IsFaulty();

		/****** TopOpeBRepTool_connexity::IsInternal ******/
		/****** md5 signature: d56a01409e720e117862d40f9453b12b ******/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "
Parameters
----------
Item: NCollection_List<TopoDS_Shape>

Return
-------
int

Description
-----------
No available documentation.
") IsInternal;
		int IsInternal(NCollection_List<TopoDS_Shape> & Item);

		/****** TopOpeBRepTool_connexity::IsMultiple ******/
		/****** md5 signature: e6f05b42d0997d2397aa555711ac4e5c ******/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsMultiple;
		bool IsMultiple();

		/****** TopOpeBRepTool_connexity::Item ******/
		/****** md5 signature: df074fd9138e1b05f9210500a12661ad ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "
Parameters
----------
OriKey: int
Item: NCollection_List<TopoDS_Shape>

Return
-------
int

Description
-----------
No available documentation.
") Item;
		int Item(const int OriKey, NCollection_List<TopoDS_Shape> & Item);

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
		/****** md5 signature: 54d324bcaa196af683e5fbbb373027cb ******/
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
		bool RemoveItem(const int OriKey, const TopoDS_Shape & Item);

		/****** TopOpeBRepTool_connexity::RemoveItem ******/
		/****** md5 signature: 6791105749029b982f50fdf8737fd164 ******/
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
		bool RemoveItem(const TopoDS_Shape & Item);

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
		/****** md5 signature: 234568a868a0d7ca6085430afeee8474 ******/
		%feature("compactdefaultargs") Finite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Finite;
		bool Finite();

		/****** TopOpeBRepTool_face::Init ******/
		/****** md5 signature: ae2e48dc0ad588e3709271a939984b56 ******/
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
		bool Init(const TopoDS_Wire & W, const TopoDS_Face & Fref);

		/****** TopOpeBRepTool_face::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 9f0453775e65eb01726f795cf4ed7402 ******/
		%feature("compactdefaultargs") Getfactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Getfactor;
		double Getfactor();

		/****** TopOpeBRepTool_makeTransition::HasRest ******/
		/****** md5 signature: 7531b367119c8e46a76a8f2a4b85d00a ******/
		%feature("compactdefaultargs") HasRest;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasRest;
		bool HasRest();

		/****** TopOpeBRepTool_makeTransition::Initialize ******/
		/****** md5 signature: 3d2a8766d0e723025cd99474f3b9eba1 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
pbef: double
paft: double
parE: double
FS: TopoDS_Face
uv: gp_Pnt2d
factor: double

Return
-------
bool

Description
-----------
No available documentation.
") Initialize;
		bool Initialize(const TopoDS_Edge & E, const double pbef, const double paft, const double parE, const TopoDS_Face & FS, const gp_Pnt2d & uv, const double factor);

		/****** TopOpeBRepTool_makeTransition::IsT2d ******/
		/****** md5 signature: bc220e78b6b14e0f98ab753023b31cd5 ******/
		%feature("compactdefaultargs") IsT2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsT2d;
		bool IsT2d();

		/****** TopOpeBRepTool_makeTransition::MkT2donE ******/
		/****** md5 signature: 8b5ab1cfac477a8c92f96bb19ee8dbd7 ******/
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
		bool MkT2donE(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepTool_makeTransition::MkT3dproj ******/
		/****** md5 signature: 733894ffe81035a7340bbc1cf61c3bc3 ******/
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
		bool MkT3dproj(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepTool_makeTransition::MkT3onE ******/
		/****** md5 signature: 494a959c0b76fbc6f22afd4845c5b48c ******/
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
		bool MkT3onE(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepTool_makeTransition::MkTonE ******/
		/****** md5 signature: f00cc57a0bb2e3d6dc3796da5e77de9c ******/
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
		bool MkTonE(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepTool_makeTransition::SetRest ******/
		/****** md5 signature: f9a2f55a6b0e9d75a8fe3f9b118a6435 ******/
		%feature("compactdefaultargs") SetRest;
		%feature("autodoc", "
Parameters
----------
ES: TopoDS_Edge
parES: double

Return
-------
bool

Description
-----------
No available documentation.
") SetRest;
		bool SetRest(const TopoDS_Edge & ES, const double parES);

		/****** TopOpeBRepTool_makeTransition::Setfactor ******/
		/****** md5 signature: ec88dcd9bc8a2ef85e73ddb9ce9a21a6 ******/
		%feature("compactdefaultargs") Setfactor;
		%feature("autodoc", "
Parameters
----------
factor: double

Return
-------
None

Description
-----------
No available documentation.
") Setfactor;
		void Setfactor(const double factor);

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
