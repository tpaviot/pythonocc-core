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
%define DRAFTDOCSTRING
"Draft module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_draft.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the draft angle of the face <f> using the direction <direction>. the method is valid for : - plane faces, - cylindrical or conical faces, when the direction of the axis of the surface is colinear with the direction. otherwise, the exception domainerror is raised.

Parameters
----------
F: TopoDS_Face
Direction: gp_Dir

Returns
-------
float
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
		/****************** Draft_EdgeInfo ******************/
		%feature("compactdefaultargs") Draft_EdgeInfo;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Draft_EdgeInfo;
		 Draft_EdgeInfo();

		/****************** Draft_EdgeInfo ******************/
		%feature("compactdefaultargs") Draft_EdgeInfo;
		%feature("autodoc", "No available documentation.

Parameters
----------
HasNewGeometry: bool

Returns
-------
None
") Draft_EdgeInfo;
		 Draft_EdgeInfo(const Standard_Boolean HasNewGeometry);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Face & F);

		/****************** ChangeFirstPC ******************/
		%feature("compactdefaultargs") ChangeFirstPC;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangeFirstPC;
		opencascade::handle<Geom2d_Curve> & ChangeFirstPC();

		/****************** ChangeGeometry ******************/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") ChangeGeometry;
		opencascade::handle<Geom_Curve> & ChangeGeometry();

		/****************** ChangeSecondPC ******************/
		%feature("compactdefaultargs") ChangeSecondPC;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangeSecondPC;
		opencascade::handle<Geom2d_Curve> & ChangeSecondPC();

		/****************** FirstFace ******************/
		%feature("compactdefaultargs") FirstFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") FirstFace;
		const TopoDS_Face FirstFace();

		/****************** FirstPC ******************/
		%feature("compactdefaultargs") FirstPC;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") FirstPC;
		const opencascade::handle<Geom2d_Curve> & FirstPC();

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Geometry;
		const opencascade::handle<Geom_Curve> & Geometry();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent(gp_Pnt & P);

		/****************** NewGeometry ******************/
		%feature("compactdefaultargs") NewGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") NewGeometry;
		Standard_Boolean NewGeometry();

		/****************** RootFace ******************/
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") RootFace;
		void RootFace(const TopoDS_Face & F);

		/****************** RootFace ******************/
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") RootFace;
		const TopoDS_Face RootFace();

		/****************** SecondFace ******************/
		%feature("compactdefaultargs") SecondFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") SecondFace;
		const TopoDS_Face SecondFace();

		/****************** SecondPC ******************/
		%feature("compactdefaultargs") SecondPC;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") SecondPC;
		const opencascade::handle<Geom2d_Curve> & SecondPC();

		/****************** SetNewGeometry ******************/
		%feature("compactdefaultargs") SetNewGeometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
NewGeom: bool

Returns
-------
None
") SetNewGeometry;
		void SetNewGeometry(const Standard_Boolean NewGeom);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Tangent;
		void Tangent(const gp_Pnt & P);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
tol: float

Returns
-------
None
") Tolerance;
		void Tolerance(const Standard_Real tol);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
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
		/****************** Draft_FaceInfo ******************/
		%feature("compactdefaultargs") Draft_FaceInfo;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Draft_FaceInfo;
		 Draft_FaceInfo();

		/****************** Draft_FaceInfo ******************/
		%feature("compactdefaultargs") Draft_FaceInfo;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface
HasNewGeometry: bool

Returns
-------
None
") Draft_FaceInfo;
		 Draft_FaceInfo(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean HasNewGeometry);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Face & F);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") ChangeCurve;
		opencascade::handle<Geom_Curve> & ChangeCurve();

		/****************** ChangeGeometry ******************/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") ChangeGeometry;
		opencascade::handle<Geom_Surface> & ChangeGeometry();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** FirstFace ******************/
		%feature("compactdefaultargs") FirstFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") FirstFace;
		const TopoDS_Face FirstFace();

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Geometry;
		const opencascade::handle<Geom_Surface> & Geometry();

		/****************** NewGeometry ******************/
		%feature("compactdefaultargs") NewGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") NewGeometry;
		Standard_Boolean NewGeometry();

		/****************** RootFace ******************/
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") RootFace;
		void RootFace(const TopoDS_Face & F);

		/****************** RootFace ******************/
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") RootFace;
		const TopoDS_Face RootFace();

		/****************** SecondFace ******************/
		%feature("compactdefaultargs") SecondFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
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
		/****************** Draft_Modification ******************/
		%feature("compactdefaultargs") Draft_Modification;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Draft_Modification;
		 Draft_Modification(const TopoDS_Shape & S);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the face f and propagates the draft modification to its neighbour faces if they are tangent. if an error occurs, will return false and problematicshape will return the 'bad' face.

Parameters
----------
F: TopoDS_Face
Direction: gp_Dir
Angle: float
NeutralPlane: gp_Pln
Flag: bool,optional
	default value is Standard_True

Returns
-------
bool
") Add;
		Standard_Boolean Add(const TopoDS_Face & F, const gp_Dir & Direction, const Standard_Real Angle, const gp_Pln & NeutralPlane, const Standard_Boolean Flag = Standard_True);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Resets on the same shape.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ConnectedFaces ******************/
		%feature("compactdefaultargs") ConnectedFaces;
		%feature("autodoc", "Returns all the faces which have been added together with the face <f>.

Parameters
----------
F: TopoDS_Face

Returns
-------
TopTools_ListOfShape
") ConnectedFaces;
		const TopTools_ListOfShape & ConnectedFaces(const TopoDS_Face & F);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of <newe> between <newf1> and <newf2>. //! <newe> is the new edge created from <e>. <newf1> (resp. <newf2>) is the new face created from <f1> (resp. <f2>).

Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
Draft_ErrorStatus
") Error;
		Draft_ErrorStatus Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Changes the basis shape and resets.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if perform has been succesfully called. otherwise more information can be obtained using the methods error() and problematicshape().

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** ModifiedFaces ******************/
		%feature("compactdefaultargs") ModifiedFaces;
		%feature("autodoc", "Returns all the faces on which a modification has been given.

Returns
-------
TopTools_ListOfShape
") ModifiedFaces;
		const TopTools_ListOfShape & ModifiedFaces();

		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "Returns standard_true if the edge <e> has been modified. in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. otherwise, returns standard_false, and <c>, <l>, <tol> are not significant.

Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Returns
-------
Tol: float
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "Returns standard_true if the edge <e> has a new curve on surface on the face <f>.in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. //! otherwise, returns standard_false, and <c>, <l>, <tol> are not significant. //! <newe> is the new edge created from <e>. <newf> is the new face created from <f>. they may be usefull.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve

Returns
-------
Tol: float
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****************** NewParameter ******************/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "Returns standard_true if the vertex <v> has a new parameter on the edge <e>. in this case, <p> is the parameter, <tol> the new tolerance. otherwise, returns standard_false, and <p>, <tol> are not significant.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Returns
-------
P: float
Tol: float
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NewPoint ******************/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "Returns standard_true if the vertex <v> has been modified. in this case, <p> is the new geometric support of the vertex, <tol> the new tolerance. otherwise, returns standard_false, and <p>, <tol> are not significant.

Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Returns
-------
Tol: float
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "Returns standard_true if the face <f> has been modified. in this case, <s> is the new geometric support of the face, <l> the new location,<tol> the new tolerance.<revwires> has to be set to standard_true when the modification reverses the normal of the surface.(the wires have to be reversed). <revface> has to be set to standard_true if the orientation of the modified face changes in the shells which contain it. here it will be set to standard_false. //! otherwise, returns standard_false, and <s>, <l>, <tol> , <revwires> ,<revface> are not significant.

Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Returns
-------
Tol: float
RevWires: bool
RevFace: bool
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the draft angle modification and sets the value returned by the method isdone. if an error occurs, isdone will return standard_false, and an error status will be given by the method error, and the shape on which the problem appeared will be given by problematicshape.

Returns
-------
None
") Perform;
		void Perform();

		/****************** ProblematicShape ******************/
		%feature("compactdefaultargs") ProblematicShape;
		%feature("autodoc", "Returns the shape (face, edge or vertex) on which an error occured.

Returns
-------
TopoDS_Shape
") ProblematicShape;
		const TopoDS_Shape ProblematicShape();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the face f and the neighbour faces if they are tangent. it will be necessary to call this method if the method add returns standard_false, to unset problematicface.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
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
		/****************** Draft_VertexInfo ******************/
		%feature("compactdefaultargs") Draft_VertexInfo;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Draft_VertexInfo;
		 Draft_VertexInfo();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E);

		/****************** ChangeGeometry ******************/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
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
		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Geometry;
		const gp_Pnt Geometry();

		/****************** InitEdgeIterator ******************/
		%feature("compactdefaultargs") InitEdgeIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitEdgeIterator;
		void InitEdgeIterator();

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextEdge;
		void NextEdge();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
float
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
