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
%define HLRTOPOBREPDOCSTRING
"HLRTopoBRep module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_hlrtopobrep.html"
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
#include<BRepTopAdaptor_module.hxx>
#include<TopTools_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Contap.i
%import BRepTopAdaptor.i
%import TopTools.i
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
%template(HLRTopoBRep_DataMapOfShapeFaceData) NCollection_DataMap<TopoDS_Shape,HLRTopoBRep_FaceData,TopTools_ShapeMapHasher>;
%template(HLRTopoBRep_ListIteratorOfListOfVData) NCollection_TListIterator<HLRTopoBRep_VData>;
%template(HLRTopoBRep_ListOfVData) NCollection_List<HLRTopoBRep_VData>;

%extend NCollection_List<HLRTopoBRep_VData> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/****** md5 signature: b2e552304e7f9ebfee5763c251f737f6 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FO: Contap_Contour
DS: HLRTopoBRep_Data
MST: BRepTopAdaptor_MapOfShapeTool
nbIso: int

Return
-------
None

Description
-----------
Stores in <DS> the outlines of <S> using the current outliner and stores the isolines in <DS> using a Hatcher.
") Insert;
		static void Insert(const TopoDS_Shape & S, Contap_Contour & FO, HLRTopoBRep_Data & DS, BRepTopAdaptor_MapOfShapeTool & MST, const Standard_Integer nbIso);

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
		/****** md5 signature: 1456d9912c4df1aca0dfdeeb10fc4f3b ******/
		%feature("compactdefaultargs") AddIntL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") AddIntL;
		TopTools_ListOfShape & AddIntL(const TopoDS_Face & F);

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
		/****** md5 signature: 3cf27e0469b23f78087d22be94a92b60 ******/
		%feature("compactdefaultargs") AddIsoL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") AddIsoL;
		TopTools_ListOfShape & AddIsoL(const TopoDS_Face & F);

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
		/****** md5 signature: 1cf3533e8294630d040101c9faef5d28 ******/
		%feature("compactdefaultargs") AddOutL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") AddOutL;
		TopTools_ListOfShape & AddOutL(const TopoDS_Face & F);

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
		/****** md5 signature: 73c316e7b2adf39f31ad6b48f1a5d62d ******/
		%feature("compactdefaultargs") AddSplE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") AddSplE;
		TopTools_ListOfShape & AddSplE(const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::Append ******/
		/****** md5 signature: 00475ef41389f61adcb6b0b67841bbb8 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: float

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const TopoDS_Vertex & V, const Standard_Real P);

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
		/****** md5 signature: 991a1f39de0c081cc71ee5fb6a1cfa50 ******/
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
		Standard_Boolean EdgeHasSplE(const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::EdgeSplE ******/
		/****** md5 signature: 0292eaf6d4ac823dc5f147ac96d5ec15 ******/
		%feature("compactdefaultargs") EdgeSplE;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of the edges.
") EdgeSplE;
		const TopTools_ListOfShape & EdgeSplE(const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::FaceHasIntL ******/
		/****** md5 signature: 59332e80ae15e68fd1c1ee6d3eabfb36 ******/
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
		Standard_Boolean FaceHasIntL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::FaceHasIsoL ******/
		/****** md5 signature: 04be6df8d9262693dc280e7814154667 ******/
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
		Standard_Boolean FaceHasIsoL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::FaceHasOutL ******/
		/****** md5 signature: fe706a496b25d02d4155871806cf6627 ******/
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
		Standard_Boolean FaceHasOutL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::FaceIntL ******/
		/****** md5 signature: f6a871453aa4795fac9d0529e35de862 ******/
		%feature("compactdefaultargs") FaceIntL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of the internal OutLines.
") FaceIntL;
		const TopTools_ListOfShape & FaceIntL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::FaceIsoL ******/
		/****** md5 signature: 76e6d85b9d054144eac64c16c2ec17d9 ******/
		%feature("compactdefaultargs") FaceIsoL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of the IsoLines.
") FaceIsoL;
		const TopTools_ListOfShape & FaceIsoL(const TopoDS_Face & F);

		/****** HLRTopoBRep_Data::FaceOutL ******/
		/****** md5 signature: f57ccf08ba31bbdd7034c0d7aa3b9925 ******/
		%feature("compactdefaultargs") FaceOutL;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of the OutLines on restriction.
") FaceOutL;
		const TopTools_ListOfShape & FaceOutL(const TopoDS_Face & F);

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
		/****** md5 signature: 4a1798f5c836121497b4ee790871fffe ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: float

Return
-------
None

Description
-----------
Insert before the current position.
") InsertBefore;
		void InsertBefore(const TopoDS_Vertex & V, const Standard_Real P);

		/****** HLRTopoBRep_Data::IsIntLFaceEdge ******/
		/****** md5 signature: bb84ad682e05a1f730f15e117ef30da8 ******/
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
		Standard_Boolean IsIntLFaceEdge(const TopoDS_Face & F, const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::IsIntV ******/
		/****** md5 signature: b1b24e644dc69921a94917b90c1c26fa ******/
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
		Standard_Boolean IsIntV(const TopoDS_Vertex & V);

		/****** HLRTopoBRep_Data::IsIsoLFaceEdge ******/
		/****** md5 signature: 0b0eb36c5c1197f74d6946c5c7ec1f0e ******/
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
		Standard_Boolean IsIsoLFaceEdge(const TopoDS_Face & F, const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::IsOutLFaceEdge ******/
		/****** md5 signature: 522753da8edeea9778c9baccf12a6f7e ******/
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
		Standard_Boolean IsOutLFaceEdge(const TopoDS_Face & F, const TopoDS_Edge & E);

		/****** HLRTopoBRep_Data::IsOutV ******/
		/****** md5 signature: 2a2bde77fa4c60fff4bd75d117c2a205 ******/
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
		Standard_Boolean IsOutV(const TopoDS_Vertex & V);

		/****** HLRTopoBRep_Data::IsSplEEdgeEdge ******/
		/****** md5 signature: 847be34284baaf807b3f295ed2b4eec2 ******/
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
		Standard_Boolean IsSplEEdgeEdge(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****** HLRTopoBRep_Data::MoreEdge ******/
		/****** md5 signature: 3deabda73e93b20e8a72f2f0ebea4e02 ******/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****** HLRTopoBRep_Data::MoreVertex ******/
		/****** md5 signature: a83eb0d708855c09e405b7e894d8577e ******/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVertex;
		Standard_Boolean MoreVertex();

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
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

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
		/****** md5 signature: ed5756c462704226d2db9de9c0cee89b ******/
		%feature("compactdefaultargs") AddIntL;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") AddIntL;
		TopTools_ListOfShape & AddIntL();

		/****** HLRTopoBRep_FaceData::AddIsoL ******/
		/****** md5 signature: 2c8902f8914b566f4bb45a10a866ce82 ******/
		%feature("compactdefaultargs") AddIsoL;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") AddIsoL;
		TopTools_ListOfShape & AddIsoL();

		/****** HLRTopoBRep_FaceData::AddOutL ******/
		/****** md5 signature: 28cc103f74fc7ef6b72420f014db9735 ******/
		%feature("compactdefaultargs") AddOutL;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") AddOutL;
		TopTools_ListOfShape & AddOutL();

		/****** HLRTopoBRep_FaceData::FaceIntL ******/
		/****** md5 signature: 58941f3a1440a39f9f9cb11cd209e9a8 ******/
		%feature("compactdefaultargs") FaceIntL;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") FaceIntL;
		const TopTools_ListOfShape & FaceIntL();

		/****** HLRTopoBRep_FaceData::FaceIsoL ******/
		/****** md5 signature: 131042b7c0ce17e204549c5b5450bc6c ******/
		%feature("compactdefaultargs") FaceIsoL;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") FaceIsoL;
		const TopTools_ListOfShape & FaceIsoL();

		/****** HLRTopoBRep_FaceData::FaceOutL ******/
		/****** md5 signature: 661b3afd1d426ffa8d3f898fd948bc40 ******/
		%feature("compactdefaultargs") FaceOutL;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") FaceOutL;
		const TopTools_ListOfShape & FaceOutL();

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
		/****** md5 signature: d2b34f6e7e126f0c703d940f98997863 ******/
		%feature("compactdefaultargs") MakeIsoLine;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Iso: Geom2d_Line
V1: TopoDS_Vertex
V2: TopoDS_Vertex
U1: float
U2: float
Tol: float
DS: HLRTopoBRep_Data

Return
-------
None

Description
-----------
No available documentation.
") MakeIsoLine;
		static void MakeIsoLine(const TopoDS_Face & F, const opencascade::handle<Geom2d_Line> & Iso, TopoDS_Vertex & V1, TopoDS_Vertex & V2, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, HLRTopoBRep_Data & DS);

		/****** HLRTopoBRep_FaceIsoLiner::MakeVertex ******/
		/****** md5 signature: 2c31f8e73ac2feb716fb4d1c1fd32e65 ******/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: gp_Pnt
Par: float
Tol: float
DS: HLRTopoBRep_Data

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") MakeVertex;
		static TopoDS_Vertex MakeVertex(const TopoDS_Edge & E, const gp_Pnt & P, const Standard_Real Par, const Standard_Real Tol, HLRTopoBRep_Data & DS);

		/****** HLRTopoBRep_FaceIsoLiner::Perform ******/
		/****** md5 signature: bc74be90af4fd07ffb7264f81ab5bdd1 ******/
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
		static void Perform(const Standard_Integer FI, const TopoDS_Face & F, HLRTopoBRep_Data & DS, const Standard_Integer nbIsos);

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
		/****** md5 signature: d575dc70cb5c7eb9b21e06993ed1023d ******/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "
Parameters
----------
P: HLRAlgo_Projector
MST: BRepTopAdaptor_MapOfShapeTool
nbIso: int

Return
-------
None

Description
-----------
No available documentation.
") Fill;
		void Fill(const HLRAlgo_Projector & P, BRepTopAdaptor_MapOfShapeTool & MST, const Standard_Integer nbIso);

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
		/****** md5 signature: 551d0e885e84ccb3b20ceb28cfb50e28 ******/
		%feature("compactdefaultargs") HLRTopoBRep_VData;
		%feature("autodoc", "
Parameters
----------
P: float
V: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") HLRTopoBRep_VData;
		 HLRTopoBRep_VData(const Standard_Real P, const TopoDS_Shape & V);

		/****** HLRTopoBRep_VData::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

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
