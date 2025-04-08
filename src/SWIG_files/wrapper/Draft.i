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
%define DRAFTDOCSTRING
"Draft module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_draft.html"
%enddef
%module (package="OCC.Core", docstring=DRAFTDOCSTRING) Draft


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
#include<Draft_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<BRepTools_module.hxx>
#include<TopTools_module.hxx>
#include<GeomAbs_module.hxx>
#include<TopLoc_module.hxx>
#include<BRep_module.hxx>
#include<Bnd_module.hxx>
#include<TShort_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i
%import Geom2d.i
%import Geom.i
%import BRepTools.i
%import TopTools.i
%import GeomAbs.i
%import TopLoc.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Draft_ErrorStatus {
	Draft_NoError = 0,
	Draft_FaceRecomputation = 1,
	Draft_EdgeRecomputation = 2,
	Draft_VertexRecomputation = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Draft_ErrorStatus(IntEnum):
	Draft_NoError = 0
	Draft_FaceRecomputation = 1
	Draft_EdgeRecomputation = 2
	Draft_VertexRecomputation = 3
Draft_NoError = Draft_ErrorStatus.Draft_NoError
Draft_FaceRecomputation = Draft_ErrorStatus.Draft_FaceRecomputation
Draft_EdgeRecomputation = Draft_ErrorStatus.Draft_EdgeRecomputation
Draft_VertexRecomputation = Draft_ErrorStatus.Draft_VertexRecomputation
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Draft_Modification)
/* end handles declaration */

/* templates */
%template(Draft_IndexedDataMapOfEdgeEdgeInfo) NCollection_IndexedDataMap<TopoDS_Edge,Draft_EdgeInfo,TopTools_ShapeMapHasher>;
%template(Draft_IndexedDataMapOfFaceFaceInfo) NCollection_IndexedDataMap<TopoDS_Face,Draft_FaceInfo,TopTools_ShapeMapHasher>;
%template(Draft_IndexedDataMapOfVertexVertexInfo) NCollection_IndexedDataMap<TopoDS_Vertex,Draft_VertexInfo,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap<TopoDS_Edge, Draft_EdgeInfo, TopTools_ShapeMapHasher> Draft_IndexedDataMapOfEdgeEdgeInfo;
typedef NCollection_IndexedDataMap<TopoDS_Face, Draft_FaceInfo, TopTools_ShapeMapHasher> Draft_IndexedDataMapOfFaceFaceInfo;
typedef NCollection_IndexedDataMap<TopoDS_Vertex, Draft_VertexInfo, TopTools_ShapeMapHasher> Draft_IndexedDataMapOfVertexVertexInfo;
/* end typedefs declaration */

/**************
* class Draft *
**************/
%rename(draft) Draft;
class Draft {
	public:
		/****** Draft::Angle ******/
		/****** md5 signature: 9c06be269f55f53a58d115e47c4bf6d4 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Direction: gp_Dir

Return
-------
float

Description
-----------
Returns the draft angle of the face <F> using the direction <Direction>. The method is valid for: - Plane faces, - Cylindrical or conical faces, when the direction of the axis of the surface is colinear with the direction. Otherwise, the exception DomainError is raised.
") Angle;
		static Standard_Real Angle(const TopoDS_Face & F, const gp_Dir & Direction);

};


%extend Draft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Draft_EdgeInfo *
***********************/
class Draft_EdgeInfo {
	public:
		/****** Draft_EdgeInfo::Draft_EdgeInfo ******/
		/****** md5 signature: 550c9df9a0488d69cdca7e28fb62ed7d ******/
		%feature("compactdefaultargs") Draft_EdgeInfo;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Draft_EdgeInfo;
		 Draft_EdgeInfo();

		/****** Draft_EdgeInfo::Draft_EdgeInfo ******/
		/****** md5 signature: 32faf9b533f6634f32c06fc744729696 ******/
		%feature("compactdefaultargs") Draft_EdgeInfo;
		%feature("autodoc", "
Parameters
----------
HasNewGeometry: bool

Return
-------
None

Description
-----------
No available documentation.
") Draft_EdgeInfo;
		 Draft_EdgeInfo(const Standard_Boolean HasNewGeometry);

		/****** Draft_EdgeInfo::Add ******/
		/****** md5 signature: 6a18239b90a20cc9cb60c404eb3bcb6e ******/
		%feature("compactdefaultargs") Add;
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
") Add;
		void Add(const TopoDS_Face & F);

		/****** Draft_EdgeInfo::ChangeFirstPC ******/
		/****** md5 signature: c39973b37168c95f36ff56bd99525b44 ******/
		%feature("compactdefaultargs") ChangeFirstPC;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") ChangeFirstPC;
		opencascade::handle<Geom2d_Curve> & ChangeFirstPC();

		/****** Draft_EdgeInfo::ChangeGeometry ******/
		/****** md5 signature: ab61f00777a78cbf8ad401fefb57e065 ******/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") ChangeGeometry;
		opencascade::handle<Geom_Curve> & ChangeGeometry();

		/****** Draft_EdgeInfo::ChangeSecondPC ******/
		/****** md5 signature: edde882d9b53da4f63b6d7da71b6e7b7 ******/
		%feature("compactdefaultargs") ChangeSecondPC;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") ChangeSecondPC;
		opencascade::handle<Geom2d_Curve> & ChangeSecondPC();

		/****** Draft_EdgeInfo::FirstFace ******/
		/****** md5 signature: 73d5fe614486030d467267b05674294d ******/
		%feature("compactdefaultargs") FirstFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") FirstFace;
		const TopoDS_Face FirstFace();

		/****** Draft_EdgeInfo::FirstPC ******/
		/****** md5 signature: bdfdf78dfbeeb49141a4f72206191bf1 ******/
		%feature("compactdefaultargs") FirstPC;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") FirstPC;
		const opencascade::handle<Geom2d_Curve> & FirstPC();

		/****** Draft_EdgeInfo::Geometry ******/
		/****** md5 signature: d58817627a13637ceca1407ecdc19cd0 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_Curve> & Geometry();

		/****** Draft_EdgeInfo::IsTangent ******/
		/****** md5 signature: a19d139d03b1a16c5545791a57f0513c ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
bool

Description
-----------
No available documentation.
") IsTangent;
		Standard_Boolean IsTangent(gp_Pnt & P);

		/****** Draft_EdgeInfo::NewGeometry ******/
		/****** md5 signature: 737e33ae76e3be5f43dd03c59c3068fa ******/
		%feature("compactdefaultargs") NewGeometry;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") NewGeometry;
		Standard_Boolean NewGeometry();

		/****** Draft_EdgeInfo::RootFace ******/
		/****** md5 signature: 8ddaa1bb319cc46fc9731294149bd597 ******/
		%feature("compactdefaultargs") RootFace;
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
") RootFace;
		void RootFace(const TopoDS_Face & F);

		/****** Draft_EdgeInfo::RootFace ******/
		/****** md5 signature: 98f13ed3fe4d31fdc140449b0bef108c ******/
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") RootFace;
		const TopoDS_Face RootFace();

		/****** Draft_EdgeInfo::SecondFace ******/
		/****** md5 signature: 571cd9cc57d087d6b77c1f9cf1da6348 ******/
		%feature("compactdefaultargs") SecondFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") SecondFace;
		const TopoDS_Face SecondFace();

		/****** Draft_EdgeInfo::SecondPC ******/
		/****** md5 signature: 8b570b150499ccc186067191e3f72b58 ******/
		%feature("compactdefaultargs") SecondPC;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") SecondPC;
		const opencascade::handle<Geom2d_Curve> & SecondPC();

		/****** Draft_EdgeInfo::SetNewGeometry ******/
		/****** md5 signature: 074b98438d51c46dd5f6a30b1690133a ******/
		%feature("compactdefaultargs") SetNewGeometry;
		%feature("autodoc", "
Parameters
----------
NewGeom: bool

Return
-------
None

Description
-----------
No available documentation.
") SetNewGeometry;
		void SetNewGeometry(const Standard_Boolean NewGeom);

		/****** Draft_EdgeInfo::Tangent ******/
		/****** md5 signature: d59a769e05ec5e0c96c6f84def24f7e9 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Tangent;
		void Tangent(const gp_Pnt & P);

		/****** Draft_EdgeInfo::Tolerance ******/
		/****** md5 signature: e925b87131cc380a2e6cb497cb7384fa ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
tol: float

Return
-------
None

Description
-----------
No available documentation.
") Tolerance;
		void Tolerance(const Standard_Real tol);

		/****** Draft_EdgeInfo::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

};


%extend Draft_EdgeInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Draft_FaceInfo *
***********************/
class Draft_FaceInfo {
	public:
		/****** Draft_FaceInfo::Draft_FaceInfo ******/
		/****** md5 signature: f6edc453c2684f1ce978cd05942f8bfa ******/
		%feature("compactdefaultargs") Draft_FaceInfo;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Draft_FaceInfo;
		 Draft_FaceInfo();

		/****** Draft_FaceInfo::Draft_FaceInfo ******/
		/****** md5 signature: d3e40a7c43b56d2afb934b980f03dbb3 ******/
		%feature("compactdefaultargs") Draft_FaceInfo;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
HasNewGeometry: bool

Return
-------
None

Description
-----------
No available documentation.
") Draft_FaceInfo;
		 Draft_FaceInfo(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean HasNewGeometry);

		/****** Draft_FaceInfo::Add ******/
		/****** md5 signature: 6a18239b90a20cc9cb60c404eb3bcb6e ******/
		%feature("compactdefaultargs") Add;
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
") Add;
		void Add(const TopoDS_Face & F);

		/****** Draft_FaceInfo::ChangeCurve ******/
		/****** md5 signature: e819346faf86cc2bea5f869865af9ed2 ******/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") ChangeCurve;
		opencascade::handle<Geom_Curve> & ChangeCurve();

		/****** Draft_FaceInfo::ChangeGeometry ******/
		/****** md5 signature: d5e0995865ff37f1bbb71d3d0296f44f ******/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") ChangeGeometry;
		opencascade::handle<Geom_Surface> & ChangeGeometry();

		/****** Draft_FaceInfo::Curve ******/
		/****** md5 signature: 976a03829ec92d091e0b58dd7f58e869 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****** Draft_FaceInfo::FirstFace ******/
		/****** md5 signature: 73d5fe614486030d467267b05674294d ******/
		%feature("compactdefaultargs") FirstFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") FirstFace;
		const TopoDS_Face FirstFace();

		/****** Draft_FaceInfo::Geometry ******/
		/****** md5 signature: 363c7d30b26691ad16b94ef8fafddf85 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Geometry;
		const opencascade::handle<Geom_Surface> & Geometry();

		/****** Draft_FaceInfo::NewGeometry ******/
		/****** md5 signature: 737e33ae76e3be5f43dd03c59c3068fa ******/
		%feature("compactdefaultargs") NewGeometry;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") NewGeometry;
		Standard_Boolean NewGeometry();

		/****** Draft_FaceInfo::RootFace ******/
		/****** md5 signature: 8ddaa1bb319cc46fc9731294149bd597 ******/
		%feature("compactdefaultargs") RootFace;
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
") RootFace;
		void RootFace(const TopoDS_Face & F);

		/****** Draft_FaceInfo::RootFace ******/
		/****** md5 signature: 98f13ed3fe4d31fdc140449b0bef108c ******/
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") RootFace;
		const TopoDS_Face RootFace();

		/****** Draft_FaceInfo::SecondFace ******/
		/****** md5 signature: 571cd9cc57d087d6b77c1f9cf1da6348 ******/
		%feature("compactdefaultargs") SecondFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") SecondFace;
		const TopoDS_Face SecondFace();

};


%extend Draft_FaceInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Draft_Modification *
***************************/
class Draft_Modification : public BRepTools_Modification {
	public:
		/****** Draft_Modification::Draft_Modification ******/
		/****** md5 signature: 3d3a6ed4845283beaa7fffc60cb99c41 ******/
		%feature("compactdefaultargs") Draft_Modification;
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
") Draft_Modification;
		 Draft_Modification(const TopoDS_Shape & S);

		/****** Draft_Modification::Add ******/
		/****** md5 signature: 27bb34ce100b2d99d741b10ebd3c13e3 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Direction: gp_Dir
Angle: float
NeutralPlane: gp_Pln
Flag: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Adds the face F and propagates the draft modification to its neighbour faces if they are tangent. If an error occurs, will return False and ProblematicShape will return the 'bad' face.
") Add;
		Standard_Boolean Add(const TopoDS_Face & F, const gp_Dir & Direction, const Standard_Real Angle, const gp_Pln & NeutralPlane, const Standard_Boolean Flag = Standard_True);

		/****** Draft_Modification::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets on the same shape.
") Clear;
		void Clear();

		/****** Draft_Modification::ConnectedFaces ******/
		/****** md5 signature: a4fc3d2c43b1adbbbe06cce811df08da ******/
		%feature("compactdefaultargs") ConnectedFaces;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
Returns all the faces which have been added together with the face <F>.
") ConnectedFaces;
		const TopTools_ListOfShape & ConnectedFaces(const TopoDS_Face & F);

		/****** Draft_Modification::Continuity ******/
		/****** md5 signature: a3c3d5a955b90f2e1cefb3c12dc67277 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****** Draft_Modification::Error ******/
		/****** md5 signature: e3e881b71c6af27537c889ff1dd4e542 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
Draft_ErrorStatus

Description
-----------
No available documentation.
") Error;
		Draft_ErrorStatus Error();

		/****** Draft_Modification::Init ******/
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
Changes the basis shape and resets.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** Draft_Modification::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Perform has been successfully called. Otherwise more information can be obtained using the methods Error() and ProblematicShape().
") IsDone;
		Standard_Boolean IsDone();

		/****** Draft_Modification::ModifiedFaces ******/
		/****** md5 signature: 73e8015abae16637419c4ff99016a307 ******/
		%feature("compactdefaultargs") ModifiedFaces;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns all the faces on which a modification has been given.
") ModifiedFaces;
		const TopTools_ListOfShape & ModifiedFaces();

		/****** Draft_Modification::NewCurve ******/
		/****** md5 signature: fae0c201ae8f07a170a1eb576572768a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** Draft_Modification::NewCurve2d ******/
		/****** md5 signature: ea858177828b71b789a2564d89f64210 ******/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. //! Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant. //! <NewE> is the new edge created from <E>. <NewF> is the new face created from <F>. They may be useful.
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** Draft_Modification::NewParameter ******/
		/****** md5 signature: e14926b54c8548936ba9a49d140b8da3 ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: float
Tol: float

Description
-----------
Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Draft_Modification::NewPoint ******/
		/****** md5 signature: 936cfe13f9c774f9038d7f0e2f3e521b ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** Draft_Modification::NewSurface ******/
		/****** md5 signature: 001097e1d949f85581f605ce49276ada ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: float
RevWires: bool
RevFace: bool

Description
-----------
Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location,<Tol> the new tolerance.<RevWires> has to be set to Standard_True when the modification reverses the normal of the surface.(the wires have to be reversed). <RevFace> has to be set to Standard_True if the orientation of the modified face changes in the shells which contain it. Here it will be set to Standard_False. //! Otherwise, returns Standard_False, and <S>, <L>, <Tol> , <RevWires> ,<RevFace> are not significant.
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** Draft_Modification::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs the draft angle modification and sets the value returned by the method IsDone. If an error occurs, IsDone will return Standard_False, and an error status will be given by the method Error, and the shape on which the problem appeared will be given by ProblematicShape.
") Perform;
		void Perform();

		/****** Draft_Modification::ProblematicShape ******/
		/****** md5 signature: 4b993ee84b1645cd4a03936d51cfc6ec ******/
		%feature("compactdefaultargs") ProblematicShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the shape (Face, Edge or Vertex) on which an error occurred.
") ProblematicShape;
		const TopoDS_Shape ProblematicShape();

		/****** Draft_Modification::Remove ******/
		/****** md5 signature: 2dda97e74bdcd077a8ecce9d227e7fa7 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Removes the face F and the neighbour faces if they are tangent. It will be necessary to call this method if the method Add returns Standard_False, to unset ProblematicFace.
") Remove;
		void Remove(const TopoDS_Face & F);

};


%make_alias(Draft_Modification)

%extend Draft_Modification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Draft_VertexInfo *
*************************/
class Draft_VertexInfo {
	public:
		/****** Draft_VertexInfo::Draft_VertexInfo ******/
		/****** md5 signature: 30edb4a202df1c872899ce3a030bfa34 ******/
		%feature("compactdefaultargs") Draft_VertexInfo;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Draft_VertexInfo;
		 Draft_VertexInfo();

		/****** Draft_VertexInfo::Add ******/
		/****** md5 signature: 2689ece383041802da1cd80a0167e44a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopoDS_Edge & E);

		/****** Draft_VertexInfo::ChangeGeometry ******/
		/****** md5 signature: 6b1487abcc29a2eb7c668f853e2ca436 ******/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") ChangeGeometry;
		gp_Pnt ChangeGeometry();


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeParameter(const TopoDS_Edge & E) {
            return (Standard_Real) $self->ChangeParameter(E);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeParameter(const TopoDS_Edge & E,Standard_Real value) {
            $self->ChangeParameter(E)=value;
            }
        };
		/****** Draft_VertexInfo::Edge ******/
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

		/****** Draft_VertexInfo::Geometry ******/
		/****** md5 signature: 98a4d8790fc14c68177e7e159ed08a37 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Geometry;
		const gp_Pnt Geometry();

		/****** Draft_VertexInfo::InitEdgeIterator ******/
		/****** md5 signature: 33903e2afb34dc5222bb42326d13a964 ******/
		%feature("compactdefaultargs") InitEdgeIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitEdgeIterator;
		void InitEdgeIterator();

		/****** Draft_VertexInfo::MoreEdge ******/
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

		/****** Draft_VertexInfo::NextEdge ******/
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

		/****** Draft_VertexInfo::Parameter ******/
		/****** md5 signature: 3f70b30d659d0fce4ed446c734d378ee ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter(const TopoDS_Edge & E);

};


%extend Draft_VertexInfo {
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
def draft_Angle(*args):
	return draft.Angle(*args)

}
