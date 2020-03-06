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
%define CHFI2DDOCSTRING
"ChFi2d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_chfi2d.html"
%enddef
%module (package="OCC.Core", docstring=CHFI2DDOCSTRING) ChFi2d


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
#include<ChFi2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TopTools_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i
%import TopTools.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum ChFi2d_ConstructionError {
	ChFi2d_NotPlanar = 0,
	ChFi2d_NoFace = 1,
	ChFi2d_InitialisationError = 2,
	ChFi2d_ParametersError = 3,
	ChFi2d_Ready = 4,
	ChFi2d_IsDone = 5,
	ChFi2d_ComputationError = 6,
	ChFi2d_ConnexionError = 7,
	ChFi2d_TangencyError = 8,
	ChFi2d_FirstEdgeDegenerated = 9,
	ChFi2d_LastEdgeDegenerated = 10,
	ChFi2d_BothEdgesDegenerated = 11,
	ChFi2d_NotAuthorized = 12,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class ChFi2d_ConstructionError:
	ChFi2d_NotPlanar = 0
	ChFi2d_NoFace = 1
	ChFi2d_InitialisationError = 2
	ChFi2d_ParametersError = 3
	ChFi2d_Ready = 4
	ChFi2d_IsDone = 5
	ChFi2d_ComputationError = 6
	ChFi2d_ConnexionError = 7
	ChFi2d_TangencyError = 8
	ChFi2d_FirstEdgeDegenerated = 9
	ChFi2d_LastEdgeDegenerated = 10
	ChFi2d_BothEdgesDegenerated = 11
	ChFi2d_NotAuthorized = 12
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class ChFi2d *
***************/
%rename(chfi2d) ChFi2d;
class ChFi2d {
	public:
};


%extend ChFi2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ChFi2d_AnaFilletAlgo *
*****************************/
class ChFi2d_AnaFilletAlgo {
	public:
		/****************** ChFi2d_AnaFilletAlgo ******************/
		%feature("compactdefaultargs") ChFi2d_AnaFilletAlgo;
		%feature("autodoc", "An empty constructor. use the method init() to initialize the class.

Returns
-------
None
") ChFi2d_AnaFilletAlgo;
		 ChFi2d_AnaFilletAlgo();

		/****************** ChFi2d_AnaFilletAlgo ******************/
		%feature("compactdefaultargs") ChFi2d_AnaFilletAlgo;
		%feature("autodoc", "A constructor. it expects a wire consisting of two edges of type (any combination of): - segment - arc of circle.

Parameters
----------
theWire: TopoDS_Wire
thePlane: gp_Pln

Returns
-------
None
") ChFi2d_AnaFilletAlgo;
		 ChFi2d_AnaFilletAlgo(const TopoDS_Wire & theWire, const gp_Pln & thePlane);

		/****************** ChFi2d_AnaFilletAlgo ******************/
		%feature("compactdefaultargs") ChFi2d_AnaFilletAlgo;
		%feature("autodoc", "A constructor. it expects two edges having a common point of type: - segment - arc of circle.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
thePlane: gp_Pln

Returns
-------
None
") ChFi2d_AnaFilletAlgo;
		 ChFi2d_AnaFilletAlgo(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, const gp_Pln & thePlane);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the class by a wire consisting of two edges.

Parameters
----------
theWire: TopoDS_Wire
thePlane: gp_Pln

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & theWire, const gp_Pln & thePlane);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the class by two edges.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
thePlane: gp_Pln

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, const gp_Pln & thePlane);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Calculates a fillet.

Parameters
----------
radius: float

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const Standard_Real radius);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Retrieves a result (fillet and shrinked neighbours).

Parameters
----------
e1: TopoDS_Edge
e2: TopoDS_Edge

Returns
-------
TopoDS_Edge
") Result;
		const TopoDS_Edge Result(TopoDS_Edge & e1, TopoDS_Edge & e2);

};


%extend ChFi2d_AnaFilletAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class ChFi2d_Builder *
***********************/
class ChFi2d_Builder {
	public:
		/****************** ChFi2d_Builder ******************/
		%feature("compactdefaultargs") ChFi2d_Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFi2d_Builder;
		 ChFi2d_Builder();

		/****************** ChFi2d_Builder ******************/
		%feature("compactdefaultargs") ChFi2d_Builder;
		%feature("autodoc", "The face <f> can be build on a closed or an open wire.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") ChFi2d_Builder;
		 ChFi2d_Builder(const TopoDS_Face & F);

		/****************** AddChamfer ******************/
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "Add a chamfer on the wire between the two edges connected <e1> and <e2>. <addchamfer> returns the chamfer edge. this edge has sense only if the status <status> is <isdone>.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
D1: float
D2: float

Returns
-------
TopoDS_Edge
") AddChamfer;
		TopoDS_Edge AddChamfer(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const Standard_Real D1, const Standard_Real D2);

		/****************** AddChamfer ******************/
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "Add a chamfer on the wire between the two edges connected to the vertex <v>. the chamfer will make an angle <ang> with the edge <e>, and one of its extremities will be on <e> at distance <d>. the returned edge has sense only if the status <status> is <isdone>. warning: the value of <ang> must be expressed in radian.

Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
D: float
Ang: float

Returns
-------
TopoDS_Edge
") AddChamfer;
		TopoDS_Edge AddChamfer(const TopoDS_Edge & E, const TopoDS_Vertex & V, const Standard_Real D, const Standard_Real Ang);

		/****************** AddFillet ******************/
		%feature("compactdefaultargs") AddFillet;
		%feature("autodoc", "Add a fillet of radius <radius> on the wire between the two edges connected to the vertex <v>. <addfillet> returns the fillet edge. the returned edge has sense only if the status <status> is <isdone>.

Parameters
----------
V: TopoDS_Vertex
Radius: float

Returns
-------
TopoDS_Edge
") AddFillet;
		TopoDS_Edge AddFillet(const TopoDS_Vertex & V, const Standard_Real Radius);

		/****************** BasisEdge ******************/
		%feature("compactdefaultargs") BasisEdge;
		%feature("autodoc", "Returns the parent edge of <e> warning: if <e>is a basis edge, the returned edge would be equal to <e>.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopoDS_Edge
") BasisEdge;
		const TopoDS_Edge BasisEdge(const TopoDS_Edge & E);

		/****************** ChamferEdges ******************/
		%feature("compactdefaultargs") ChamferEdges;
		%feature("autodoc", "Returns the list of new edges.

Returns
-------
TopTools_SequenceOfShape
") ChamferEdges;
		const TopTools_SequenceOfShape & ChamferEdges();

		/****************** DescendantEdge ******************/
		%feature("compactdefaultargs") DescendantEdge;
		%feature("autodoc", "Returns the modified edge if <e> has descendant or <e> in the other case.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopoDS_Edge
") DescendantEdge;
		const TopoDS_Edge DescendantEdge(const TopoDS_Edge & E);

		/****************** FilletEdges ******************/
		%feature("compactdefaultargs") FilletEdges;
		%feature("autodoc", "Returns the list of new edges.

Returns
-------
TopTools_SequenceOfShape
") FilletEdges;
		const TopTools_SequenceOfShape & FilletEdges();

		/****************** HasDescendant ******************/
		%feature("compactdefaultargs") HasDescendant;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") HasDescendant;
		Standard_Boolean HasDescendant(const TopoDS_Edge & E);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
RefFace: TopoDS_Face
ModFace: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & RefFace, const TopoDS_Face & ModFace);

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified(const TopoDS_Edge & E);

		/****************** ModifyChamfer ******************/
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "Modify the chamfer <chamfer> and returns the new chamfer edge. this edge as sense only if the status <status> is <isdone>.

Parameters
----------
Chamfer: TopoDS_Edge
E1: TopoDS_Edge
E2: TopoDS_Edge
D1: float
D2: float

Returns
-------
TopoDS_Edge
") ModifyChamfer;
		TopoDS_Edge ModifyChamfer(const TopoDS_Edge & Chamfer, const TopoDS_Edge & E1, const TopoDS_Edge & E2, const Standard_Real D1, const Standard_Real D2);

		/****************** ModifyChamfer ******************/
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "Modify the chamfer <chamfer> and returns the new chamfer edge. this edge as sense only if the status <status> is <isdone>. warning: the value of <ang> must be expressed in radian.

Parameters
----------
Chamfer: TopoDS_Edge
E: TopoDS_Edge
D: float
Ang: float

Returns
-------
TopoDS_Edge
") ModifyChamfer;
		TopoDS_Edge ModifyChamfer(const TopoDS_Edge & Chamfer, const TopoDS_Edge & E, const Standard_Real D, const Standard_Real Ang);

		/****************** ModifyFillet ******************/
		%feature("compactdefaultargs") ModifyFillet;
		%feature("autodoc", "Modify the fillet radius and return the new fillet edge. this edge has sense only if the status <status> is <isdone>.

Parameters
----------
Fillet: TopoDS_Edge
Radius: float

Returns
-------
TopoDS_Edge
") ModifyFillet;
		TopoDS_Edge ModifyFillet(const TopoDS_Edge & Fillet, const Standard_Real Radius);

		/****************** NbChamfer ******************/
		%feature("compactdefaultargs") NbChamfer;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbChamfer;
		Standard_Integer NbChamfer();

		/****************** NbFillet ******************/
		%feature("compactdefaultargs") NbFillet;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFillet;
		Standard_Integer NbFillet();

		/****************** RemoveChamfer ******************/
		%feature("compactdefaultargs") RemoveChamfer;
		%feature("autodoc", "Removes the chamfer <chamfer> and returns the vertex connecting the two adjacent edges to this chamfer.

Parameters
----------
Chamfer: TopoDS_Edge

Returns
-------
TopoDS_Vertex
") RemoveChamfer;
		TopoDS_Vertex RemoveChamfer(const TopoDS_Edge & Chamfer);

		/****************** RemoveFillet ******************/
		%feature("compactdefaultargs") RemoveFillet;
		%feature("autodoc", "Removes the fillet <fillet> and returns the vertex connecting the two adjacent edges to this fillet.

Parameters
----------
Fillet: TopoDS_Edge

Returns
-------
TopoDS_Vertex
") RemoveFillet;
		TopoDS_Vertex RemoveFillet(const TopoDS_Edge & Fillet);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns the modified face.

Returns
-------
TopoDS_Face
") Result;
		TopoDS_Face Result();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFi2d_ConstructionError
") Status;
		ChFi2d_ConstructionError Status();

};


%extend ChFi2d_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class ChFi2d_ChamferAPI *
**************************/
class ChFi2d_ChamferAPI {
	public:
		/****************** ChFi2d_ChamferAPI ******************/
		%feature("compactdefaultargs") ChFi2d_ChamferAPI;
		%feature("autodoc", "An empty constructor.

Returns
-------
None
") ChFi2d_ChamferAPI;
		 ChFi2d_ChamferAPI();

		/****************** ChFi2d_ChamferAPI ******************/
		%feature("compactdefaultargs") ChFi2d_ChamferAPI;
		%feature("autodoc", "A constructor accepting a wire consisting of two linear edges.

Parameters
----------
theWire: TopoDS_Wire

Returns
-------
None
") ChFi2d_ChamferAPI;
		 ChFi2d_ChamferAPI(const TopoDS_Wire & theWire);

		/****************** ChFi2d_ChamferAPI ******************/
		%feature("compactdefaultargs") ChFi2d_ChamferAPI;
		%feature("autodoc", "A constructor accepting two linear edges.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge

Returns
-------
None
") ChFi2d_ChamferAPI;
		 ChFi2d_ChamferAPI(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the class by a wire consisting of two libear edges.

Parameters
----------
theWire: TopoDS_Wire

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & theWire);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the class by two linear edges.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Constructs a chamfer edge. returns true if the edge is constructed.

Returns
-------
bool
") Perform;
		Standard_Boolean Perform();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
theLength1: float
theLength2: float

Returns
-------
TopoDS_Edge
") Result;
		TopoDS_Edge Result(TopoDS_Edge & theEdge1, TopoDS_Edge & theEdge2, const Standard_Real theLength1, const Standard_Real theLength2);

};


%extend ChFi2d_ChamferAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class ChFi2d_FilletAPI *
*************************/
class ChFi2d_FilletAPI {
	public:
		/****************** ChFi2d_FilletAPI ******************/
		%feature("compactdefaultargs") ChFi2d_FilletAPI;
		%feature("autodoc", "An empty constructor of the fillet algorithm. call a method init() to initialize the algorithm before calling of a perform() method.

Returns
-------
None
") ChFi2d_FilletAPI;
		 ChFi2d_FilletAPI();

		/****************** ChFi2d_FilletAPI ******************/
		%feature("compactdefaultargs") ChFi2d_FilletAPI;
		%feature("autodoc", "A constructor of a fillet algorithm: accepts a wire consisting of two edges in a plane.

Parameters
----------
theWire: TopoDS_Wire
thePlane: gp_Pln

Returns
-------
None
") ChFi2d_FilletAPI;
		 ChFi2d_FilletAPI(const TopoDS_Wire & theWire, const gp_Pln & thePlane);

		/****************** ChFi2d_FilletAPI ******************/
		%feature("compactdefaultargs") ChFi2d_FilletAPI;
		%feature("autodoc", "A constructor of a fillet algorithm: accepts two edges in a plane.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
thePlane: gp_Pln

Returns
-------
None
") ChFi2d_FilletAPI;
		 ChFi2d_FilletAPI(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, const gp_Pln & thePlane);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes a fillet algorithm: accepts a wire consisting of two edges in a plane.

Parameters
----------
theWire: TopoDS_Wire
thePlane: gp_Pln

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & theWire, const gp_Pln & thePlane);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes a fillet algorithm: accepts two edges in a plane.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
thePlane: gp_Pln

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, const gp_Pln & thePlane);

		/****************** NbResults ******************/
		%feature("compactdefaultargs") NbResults;
		%feature("autodoc", "Returns number of possible solutions. <thepoint> chooses a particular fillet in case of several fillets may be constructed (for example, a circle intersecting a segment in 2 points). put the intersecting (or common) point of the edges.

Parameters
----------
thePoint: gp_Pnt

Returns
-------
int
") NbResults;
		Standard_Integer NbResults(const gp_Pnt & thePoint);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Constructs a fillet edge. returns true if at least one result was found.

Parameters
----------
theRadius: float

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const Standard_Real theRadius);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns result (fillet edge, modified edge1, modified edge2), nearest to the given point <thepoint> if isolution == -1 <thepoint> chooses a particular fillet in case of several fillets may be constructed (for example, a circle intersecting a segment in 2 points). put the intersecting (or common) point of the edges.

Parameters
----------
thePoint: gp_Pnt
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
iSolution: int,optional
	default value is -1

Returns
-------
TopoDS_Edge
") Result;
		TopoDS_Edge Result(const gp_Pnt & thePoint, TopoDS_Edge & theEdge1, TopoDS_Edge & theEdge2, const Standard_Integer iSolution = -1);

};


%extend ChFi2d_FilletAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class ChFi2d_FilletAlgo *
**************************/
class ChFi2d_FilletAlgo {
	public:
		/****************** ChFi2d_FilletAlgo ******************/
		%feature("compactdefaultargs") ChFi2d_FilletAlgo;
		%feature("autodoc", "An empty constructor of the fillet algorithm. call a method init() to initialize the algorithm before calling of a perform() method.

Returns
-------
None
") ChFi2d_FilletAlgo;
		 ChFi2d_FilletAlgo();

		/****************** ChFi2d_FilletAlgo ******************/
		%feature("compactdefaultargs") ChFi2d_FilletAlgo;
		%feature("autodoc", "A constructor of a fillet algorithm: accepts a wire consisting of two edges in a plane.

Parameters
----------
theWire: TopoDS_Wire
thePlane: gp_Pln

Returns
-------
None
") ChFi2d_FilletAlgo;
		 ChFi2d_FilletAlgo(const TopoDS_Wire & theWire, const gp_Pln & thePlane);

		/****************** ChFi2d_FilletAlgo ******************/
		%feature("compactdefaultargs") ChFi2d_FilletAlgo;
		%feature("autodoc", "A constructor of a fillet algorithm: accepts two edges in a plane.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
thePlane: gp_Pln

Returns
-------
None
") ChFi2d_FilletAlgo;
		 ChFi2d_FilletAlgo(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, const gp_Pln & thePlane);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes a fillet algorithm: accepts a wire consisting of two edges in a plane.

Parameters
----------
theWire: TopoDS_Wire
thePlane: gp_Pln

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & theWire, const gp_Pln & thePlane);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes a fillet algorithm: accepts two edges in a plane.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
thePlane: gp_Pln

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, const gp_Pln & thePlane);

		/****************** NbResults ******************/
		%feature("compactdefaultargs") NbResults;
		%feature("autodoc", "Returns number of possible solutions. <thepoint> chooses a particular fillet in case of several fillets may be constructed (for example, a circle intersecting a segment in 2 points). put the intersecting (or common) point of the edges.

Parameters
----------
thePoint: gp_Pnt

Returns
-------
int
") NbResults;
		Standard_Integer NbResults(const gp_Pnt & thePoint);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Constructs a fillet edge. returns true, if at least one result was found.

Parameters
----------
theRadius: float

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const Standard_Real theRadius);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns result (fillet edge, modified edge1, modified edge2), neares to the given point <thepoint> if isolution == -1. <thepoint> chooses a particular fillet in case of several fillets may be constructed (for example, a circle intersecting a segment in 2 points). put the intersecting (or common) point of the edges.

Parameters
----------
thePoint: gp_Pnt
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
iSolution: int,optional
	default value is -1

Returns
-------
TopoDS_Edge
") Result;
		TopoDS_Edge Result(const gp_Pnt & thePoint, TopoDS_Edge & theEdge1, TopoDS_Edge & theEdge2, const Standard_Integer iSolution = -1);

};


%extend ChFi2d_FilletAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class FilletPoint *
********************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
