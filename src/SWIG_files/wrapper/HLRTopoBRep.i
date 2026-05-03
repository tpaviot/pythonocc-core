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
%define HLRTOPOBREPDOCSTRING
"HLRTopoBRep module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_hlrtopobrep.html"
%enddef
%module (package="OCC.Core", docstring=HLRTOPOBREPDOCSTRING) HLRTopoBRep


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
#include<HLRTopoBRep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Contap_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<IntSurf_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Contap.i
%import Geom2d.i
%import gp.i
%import HLRAlgo.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(HLRTopoBRep_OutLiner)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<TopoDS_Shape,HLRTopoBRep_FaceData,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,HLRTopoBRep_FaceData,TopTools_ShapeMapHasher>::KeyValues;
%template(HLRTopoBRep_DataMapOfShapeFaceData) NCollection_DataMap<TopoDS_Shape,HLRTopoBRep_FaceData,TopTools_ShapeMapHasher>;
%template(HLRTopoBRep_ListIteratorOfListOfVData) NCollection_TListIterator<HLRTopoBRep_VData>;
%template(HLRTopoBRep_ListOfVData) NCollection_List<HLRTopoBRep_VData>;

%extend NCollection_List<HLRTopoBRep_VData> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%ignore NCollection_DataMap<TopoDS_Shape,HLRTopoBRep_ListOfVData,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,HLRTopoBRep_ListOfVData,TopTools_ShapeMapHasher>::KeyValues;
%template(HLRTopoBRep_MapOfShapeListOfVData) NCollection_DataMap<TopoDS_Shape,HLRTopoBRep_ListOfVData,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, HLRTopoBRep_FaceData, TopTools_ShapeMapHasher>::Iterator HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
typedef NCollection_DataMap<TopoDS_Shape, HLRTopoBRep_ListOfVData, TopTools_ShapeMapHasher>::Iterator HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
typedef NCollection_DataMap<TopoDS_Shape, HLRTopoBRep_FaceData, TopTools_ShapeMapHasher> HLRTopoBRep_DataMapOfShapeFaceData;
typedef NCollection_List<HLRTopoBRep_VData>::Iterator HLRTopoBRep_ListIteratorOfListOfVData;
typedef NCollection_List<HLRTopoBRep_VData> HLRTopoBRep_ListOfVData;
typedef NCollection_DataMap<TopoDS_Shape, HLRTopoBRep_ListOfVData, TopTools_ShapeMapHasher> HLRTopoBRep_MapOfShapeListOfVData;
/* end typedefs declaration */

/*****************************
* class HLRTopoBRep_DSFiller *
*****************************/
class HLRTopoBRep_DSFiller {
	public:
		/****** HLRTopoBRep_DSFiller::Insert ******/
		/****** md5 signature: 8d9c4e50f1bfbffad41514dce6fb61be ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FO: Contap_Contour
DS: HLRTopoBRep_Data
MST: NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher>
nbIso: int

Return
-------
None

Description
-----------
Stores in <DS> the outlines of <S> using the current outliner and stores the isolines in <DS> using a Hatcher.
") Insert;
		static void Insert(const TopoDS_Shape & S, Contap_Contour & FO, HLRTopoBRep_Data & DS, NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher> & MST, const int nbIso);

};


%extend HLRTopoBRep_DSFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class HLRTopoBRep_Data *
*************************/
class HLRTopoBRep_Data {
	public:
		/****** HLRTopoBRep_Data::HLRTopoBRep_Data ******/
		/****** md5 signature: 2cc82809a2a7d5f4e9e5168f4c413f42 ******/
		%feature("compactdefaultargs") HLRTopoBRep_Data;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRTopoBRep_Data;
		 HLRTopoBRep_Data();

		/****** HLRTopoBRep_Data::AddIntL ******/
		/****** md5 signature: 117fa0e798f34918db31b4fb35dd551a ******/
		%feature("compactdefaultargs") AddIntL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") AddIntL;
		NCollection_List<TopoDS_Shape> AddIntL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::AddIntV ******/
		/****** md5 signature: 5e98927600b04f5897dcb0892a001128 ******/
		%feature("compactdefaultargs") AddIntV;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") AddIntV;
		void AddIntV(const TopoDS_Vertex & V);

		/****** HLRTopoBRep_Data::AddIsoL ******/
		/****** md5 signature: 27d1a6615124f4f946a02523ff27e9a6 ******/
		%feature("compactdefaultargs") AddIsoL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") AddIsoL;
		NCollection_List<TopoDS_Shape> AddIsoL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::AddOldS ******/
		/****** md5 signature: 879d3ca3686db00613d78566c0341220 ******/
		%feature("compactdefaultargs") AddOldS;
		%feature("autodoc", "
Parameters
----------
NewS: TopoDS_Shape
OldS: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddOldS;
		void AddOldS(const TopoDS_Shape & NewS, const TopoDS_Shape & OldS);

		/****** HLRTopoBRep_Data::AddOutL ******/
		/****** md5 signature: 69adbe1b3b72c0e8d1c3505237acf4b7 ******/
		%feature("compactdefaultargs") AddOutL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") AddOutL;
		NCollection_List<TopoDS_Shape> AddOutL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::AddOutV ******/
		/****** md5 signature: 290502373d4127c32e710710e5cb8afd ******/
		%feature("compactdefaultargs") AddOutV;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") AddOutV;
		void AddOutV(const TopoDS_Vertex & V);

		/****** HLRTopoBRep_Data::AddSplE ******/
		/****** md5 signature: afe4ecb8b04ed31c849436a7afb7c5d6 ******/
		%feature("compactdefaultargs") AddSplE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") AddSplE;
		NCollection_List<TopoDS_Shape> AddSplE(const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::Append ******/
		/****** md5 signature: 6ca99ff105599a5775060bfc4892ff2b ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: double

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const TopoDS_Vertex & V, const double P);

		/****** HLRTopoBRep_Data::Clean ******/
		/****** md5 signature: 2b06aa6e249aa983252ec57e01a88d51 ******/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear of all the data not needed during and after the hiding process.
") Clean;
		void Clean();

		/****** HLRTopoBRep_Data::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear of all the maps.
") Clear;
		void Clear();

		/****** HLRTopoBRep_Data::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Edge Edge();

		/****** HLRTopoBRep_Data::EdgeHasSplE ******/
		/****** md5 signature: ccd313fabb0dfbc6f32846214c95869b ******/
		%feature("compactdefaultargs") EdgeHasSplE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Returns True if the Edge is split.
") EdgeHasSplE;
		bool EdgeHasSplE(const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::EdgeSplE ******/
		/****** md5 signature: d974f386c17d3f75ab7f9fb101344fc2 ******/
		%feature("compactdefaultargs") EdgeSplE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of the edges.
") EdgeSplE;
		const NCollection_List<TopoDS_Shape> EdgeSplE(const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::FaceHasIntL ******/
		/****** md5 signature: 2d0b80a7d2835c96c3af947cd3d235af ******/
		%feature("compactdefaultargs") FaceHasIntL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
Returns True if the Face has internal outline.
") FaceHasIntL;
		bool FaceHasIntL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::FaceHasIsoL ******/
		/****** md5 signature: 76d623b8e5626c99c2dfbfcfd6ba916d ******/
		%feature("compactdefaultargs") FaceHasIsoL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
Returns True if the Face has isolines.
") FaceHasIsoL;
		bool FaceHasIsoL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::FaceHasOutL ******/
		/****** md5 signature: 58f2a78fd53bd111fe47704a0af35c50 ******/
		%feature("compactdefaultargs") FaceHasOutL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
Returns True if the Face has outlines on restriction.
") FaceHasOutL;
		bool FaceHasOutL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::FaceIntL ******/
		/****** md5 signature: 680c77f08734f23b56cc39c96bc1cf1e ******/
		%feature("compactdefaultargs") FaceIntL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of the internal OutLines.
") FaceIntL;
		const NCollection_List<TopoDS_Shape> FaceIntL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::FaceIsoL ******/
		/****** md5 signature: 1e21e035c66d29438c1c72cca2804285 ******/
		%feature("compactdefaultargs") FaceIsoL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of the IsoLines.
") FaceIsoL;
		const NCollection_List<TopoDS_Shape> FaceIsoL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::FaceOutL ******/
		/****** md5 signature: 44fa904040e95a2cc6a2c84cfa883869 ******/
		%feature("compactdefaultargs") FaceOutL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of the OutLines on restriction.
") FaceOutL;
		const NCollection_List<TopoDS_Shape> FaceOutL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::InitEdge ******/
		/****** md5 signature: 13e3d303d78cdf9134a0106c465fdb17 ******/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitEdge;
		void InitEdge();

		/****** HLRTopoBRep_Data::InitVertex ******/
		/****** md5 signature: c50778eaaf1eb7bc44f85769da07f853 ******/
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Start an iteration on the vertices of E.
") InitVertex;
		void InitVertex(const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::InsertBefore ******/
		/****** md5 signature: 689929be1642138497f6af9171b0078f ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: double

Return
-------
None

Description
-----------
Insert before the current position.
") InsertBefore;
		void InsertBefore(const TopoDS_Vertex & V, const double P);

		/****** HLRTopoBRep_Data::IsIntLFaceEdge ******/
		/****** md5 signature: c9b24f5bf2e38a3595c35f5936eefb1d ******/
		%feature("compactdefaultargs") IsIntLFaceEdge;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") IsIntLFaceEdge;
		bool IsIntLFaceEdge(const TopoDS_Face & F, const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::IsIntV ******/
		/****** md5 signature: b927a2444cc74598b39e7a21cc871182 ******/
		%feature("compactdefaultargs") IsIntV;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
bool

Description
-----------
Returns True if V is an internal outline vertex.
") IsIntV;
		bool IsIntV(const TopoDS_Vertex & V);

		/****** HLRTopoBRep_Data::IsIsoLFaceEdge ******/
		/****** md5 signature: 2dc9faf0501b3c98b717d45e1f8660fb ******/
		%feature("compactdefaultargs") IsIsoLFaceEdge;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") IsIsoLFaceEdge;
		bool IsIsoLFaceEdge(const TopoDS_Face & F, const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::IsOutLFaceEdge ******/
		/****** md5 signature: 297f300facd31cf1e0b390b8bca6cd56 ******/
		%feature("compactdefaultargs") IsOutLFaceEdge;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") IsOutLFaceEdge;
		bool IsOutLFaceEdge(const TopoDS_Face & F, const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::IsOutV ******/
		/****** md5 signature: 290f1c580131e83adb89b18d1919363f ******/
		%feature("compactdefaultargs") IsOutV;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
bool

Description
-----------
Returns True if V is an outline vertex on a restriction.
") IsOutV;
		bool IsOutV(const TopoDS_Vertex & V);

		/****** HLRTopoBRep_Data::IsSplEEdgeEdge ******/
		/****** md5 signature: 9e8b942b25953f69bac8210fe8233fa9 ******/
		%feature("compactdefaultargs") IsSplEEdgeEdge;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") IsSplEEdgeEdge;
		bool IsSplEEdgeEdge(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****** HLRTopoBRep_Data::MoreEdge ******/
		/****** md5 signature: 6ad80ac0d66dad5013f4fe4cff20c934 ******/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		bool MoreEdge();

		/****** HLRTopoBRep_Data::MoreVertex ******/
		/****** md5 signature: 73bec1e3a9592b7ee376cebfedb62bcf ******/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVertex;
		bool MoreVertex();

		/****** HLRTopoBRep_Data::NewSOldS ******/
		/****** md5 signature: 3f59a742699025ce4e0f9c924b81eadc ******/
		%feature("compactdefaultargs") NewSOldS;
		%feature("autodoc", "
Parameters
----------
New: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") NewSOldS;
		TopoDS_Shape NewSOldS(const TopoDS_Shape & New);

		/****** HLRTopoBRep_Data::NextEdge ******/
		/****** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ******/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge();

		/****** HLRTopoBRep_Data::NextVertex ******/
		/****** md5 signature: c800122ce4f2c3bd5f52dba7f14e300c ******/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextVertex;
		void NextVertex();

		/****** HLRTopoBRep_Data::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** HLRTopoBRep_Data::Vertex ******/
		/****** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Vertex Vertex();

};


%extend HLRTopoBRep_Data {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRTopoBRep_FaceData *
*****************************/
class HLRTopoBRep_FaceData {
	public:
		/****** HLRTopoBRep_FaceData::HLRTopoBRep_FaceData ******/
		/****** md5 signature: 59dba40e2a8b08386da7a4f1b13afbb4 ******/
		%feature("compactdefaultargs") HLRTopoBRep_FaceData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRTopoBRep_FaceData;
		 HLRTopoBRep_FaceData();

		/****** HLRTopoBRep_FaceData::AddIntL ******/
		/****** md5 signature: 53589e462157dbc594977bce9c465a43 ******/
		%feature("compactdefaultargs") AddIntL;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") AddIntL;
		NCollection_List<TopoDS_Shape> AddIntL();

		/****** HLRTopoBRep_FaceData::AddIsoL ******/
		/****** md5 signature: ce5e7b86b3df29bdb876a740cdf989e5 ******/
		%feature("compactdefaultargs") AddIsoL;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") AddIsoL;
		NCollection_List<TopoDS_Shape> AddIsoL();

		/****** HLRTopoBRep_FaceData::AddOutL ******/
		/****** md5 signature: 4149b6951ab812961ff5fd8a3b7e3023 ******/
		%feature("compactdefaultargs") AddOutL;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") AddOutL;
		NCollection_List<TopoDS_Shape> AddOutL();

		/****** HLRTopoBRep_FaceData::FaceIntL ******/
		/****** md5 signature: 76e3332fb465028cdb9c0bb01e717eb6 ******/
		%feature("compactdefaultargs") FaceIntL;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") FaceIntL;
		const NCollection_List<TopoDS_Shape> FaceIntL();

		/****** HLRTopoBRep_FaceData::FaceIsoL ******/
		/****** md5 signature: 3e948e1d73dfd44abb5b12dcdf7ec82d ******/
		%feature("compactdefaultargs") FaceIsoL;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") FaceIsoL;
		const NCollection_List<TopoDS_Shape> FaceIsoL();

		/****** HLRTopoBRep_FaceData::FaceOutL ******/
		/****** md5 signature: 207b5955a63dd20f0f9c99fe89293504 ******/
		%feature("compactdefaultargs") FaceOutL;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") FaceOutL;
		const NCollection_List<TopoDS_Shape> FaceOutL();

};


%extend HLRTopoBRep_FaceData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class HLRTopoBRep_FaceIsoLiner *
*********************************/
class HLRTopoBRep_FaceIsoLiner {
	public:
		/****** HLRTopoBRep_FaceIsoLiner::MakeIsoLine ******/
		/****** md5 signature: d7e09f49a0ec80de0c620ea4abc8b985 ******/
		%feature("compactdefaultargs") MakeIsoLine;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Iso: Geom2d_Line
V1: TopoDS_Vertex
V2: TopoDS_Vertex
U1: double
U2: double
Tol: double
DS: HLRTopoBRep_Data

Return
-------
None

Description
-----------
No available documentation.
") MakeIsoLine;
		static void MakeIsoLine(const TopoDS_Face & F, const opencascade::handle<Geom2d_Line> & Iso, TopoDS_Vertex & V1, TopoDS_Vertex & V2, const double U1, const double U2, const double Tol, HLRTopoBRep_Data & DS);

		/****** HLRTopoBRep_FaceIsoLiner::MakeVertex ******/
		/****** md5 signature: 27040f9ff225068b4d4efc2c2f5e124c ******/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: gp_Pnt
Par: double
Tol: double
DS: HLRTopoBRep_Data

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") MakeVertex;
		static TopoDS_Vertex MakeVertex(const TopoDS_Edge & E, const gp_Pnt & P, const double Par, const double Tol, HLRTopoBRep_Data & DS);

		/****** HLRTopoBRep_FaceIsoLiner::Perform ******/
		/****** md5 signature: 93cb78b20a1e17c3e8e2c28b2a0d7d22 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
FI: int
F: TopoDS_Face
DS: HLRTopoBRep_Data
nbIsos: int

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		static void Perform(const int FI, const TopoDS_Face & F, HLRTopoBRep_Data & DS, const int nbIsos);

};


%extend HLRTopoBRep_FaceIsoLiner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRTopoBRep_OutLiner *
*****************************/
class HLRTopoBRep_OutLiner : public Standard_Transient {
	public:
		/****** HLRTopoBRep_OutLiner::HLRTopoBRep_OutLiner ******/
		/****** md5 signature: 5778c4cd0df3efde438d9c80a7e8e72b ******/
		%feature("compactdefaultargs") HLRTopoBRep_OutLiner;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner();

		/****** HLRTopoBRep_OutLiner::HLRTopoBRep_OutLiner ******/
		/****** md5 signature: 3639c30b8efe3a098cbaaa619ae9a845 ******/
		%feature("compactdefaultargs") HLRTopoBRep_OutLiner;
		%feature("autodoc", "
Parameters
----------
OriSh: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner(const TopoDS_Shape & OriSh);

		/****** HLRTopoBRep_OutLiner::HLRTopoBRep_OutLiner ******/
		/****** md5 signature: 9a2f296f82c50acc55bba00f63b25cef ******/
		%feature("compactdefaultargs") HLRTopoBRep_OutLiner;
		%feature("autodoc", "
Parameters
----------
OriS: TopoDS_Shape
OutS: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner(const TopoDS_Shape & OriS, const TopoDS_Shape & OutS);

		/****** HLRTopoBRep_OutLiner::DataStructure ******/
		/****** md5 signature: b254132ad26d4f0e7e5d04ebeaa6f7fe ******/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "Return
-------
HLRTopoBRep_Data

Description
-----------
No available documentation.
") DataStructure;
		HLRTopoBRep_Data & DataStructure();

		/****** HLRTopoBRep_OutLiner::Fill ******/
		/****** md5 signature: a71f6d7c10824851fa66f2a1f15f0df7 ******/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "
Parameters
----------
P: HLRAlgo_Projector
MST: NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher>
nbIso: int

Return
-------
None

Description
-----------
No available documentation.
") Fill;
		void Fill(const HLRAlgo_Projector & P, NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher> & MST, const int nbIso);

		/****** HLRTopoBRep_OutLiner::OriginalShape ******/
		/****** md5 signature: 2b6491e3d80cdba3d8f6bd93e377fdf8 ******/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "
Parameters
----------
OriS: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") OriginalShape;
		void OriginalShape(const TopoDS_Shape & OriS);

		/****** HLRTopoBRep_OutLiner::OriginalShape ******/
		/****** md5 signature: b131a5fce7bf33995f68a7dd29252dee ******/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") OriginalShape;
		TopoDS_Shape OriginalShape();

		/****** HLRTopoBRep_OutLiner::OutLinedShape ******/
		/****** md5 signature: 576c41765edf52124f0cc49e5bc80b2e ******/
		%feature("compactdefaultargs") OutLinedShape;
		%feature("autodoc", "
Parameters
----------
OutS: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") OutLinedShape;
		void OutLinedShape(const TopoDS_Shape & OutS);

		/****** HLRTopoBRep_OutLiner::OutLinedShape ******/
		/****** md5 signature: d5d4df7e5e22b813e25778b6d9b01de8 ******/
		%feature("compactdefaultargs") OutLinedShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") OutLinedShape;
		TopoDS_Shape OutLinedShape();

};


%make_alias(HLRTopoBRep_OutLiner)

%extend HLRTopoBRep_OutLiner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class HLRTopoBRep_VData *
**************************/
class HLRTopoBRep_VData {
	public:
		/****** HLRTopoBRep_VData::HLRTopoBRep_VData ******/
		/****** md5 signature: 2ff4d05c2f22a2f1301a9b3ec50a7257 ******/
		%feature("compactdefaultargs") HLRTopoBRep_VData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRTopoBRep_VData;
		 HLRTopoBRep_VData();

		/****** HLRTopoBRep_VData::HLRTopoBRep_VData ******/
		/****** md5 signature: 5aa82c0239abfa66bc154915bc7fc288 ******/
		%feature("compactdefaultargs") HLRTopoBRep_VData;
		%feature("autodoc", "
Parameters
----------
P: double
V: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") HLRTopoBRep_VData;
		 HLRTopoBRep_VData(const double P, const TopoDS_Shape & V);

		/****** HLRTopoBRep_VData::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** HLRTopoBRep_VData::Vertex ******/
		/****** md5 signature: 4b1334c642d4415d88330a5fa6216463 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Shape Vertex();

};


%extend HLRTopoBRep_VData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def HLRTopoBRep_DSFiller_Insert(*args):
	return HLRTopoBRep_DSFiller.Insert(*args)

@deprecated
def HLRTopoBRep_FaceIsoLiner_MakeIsoLine(*args):
	return HLRTopoBRep_FaceIsoLiner.MakeIsoLine(*args)

@deprecated
def HLRTopoBRep_FaceIsoLiner_MakeVertex(*args):
	return HLRTopoBRep_FaceIsoLiner.MakeVertex(*args)

@deprecated
def HLRTopoBRep_FaceIsoLiner_Perform(*args):
	return HLRTopoBRep_FaceIsoLiner.Perform(*args)

}
