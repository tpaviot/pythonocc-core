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
from enum import IntEnum
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

class ChFi2d_ConstructionError(IntEnum):
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
ChFi2d_NotPlanar = ChFi2d_ConstructionError.ChFi2d_NotPlanar
ChFi2d_NoFace = ChFi2d_ConstructionError.ChFi2d_NoFace
ChFi2d_InitialisationError = ChFi2d_ConstructionError.ChFi2d_InitialisationError
ChFi2d_ParametersError = ChFi2d_ConstructionError.ChFi2d_ParametersError
ChFi2d_Ready = ChFi2d_ConstructionError.ChFi2d_Ready
ChFi2d_IsDone = ChFi2d_ConstructionError.ChFi2d_IsDone
ChFi2d_ComputationError = ChFi2d_ConstructionError.ChFi2d_ComputationError
ChFi2d_ConnexionError = ChFi2d_ConstructionError.ChFi2d_ConnexionError
ChFi2d_TangencyError = ChFi2d_ConstructionError.ChFi2d_TangencyError
ChFi2d_FirstEdgeDegenerated = ChFi2d_ConstructionError.ChFi2d_FirstEdgeDegenerated
ChFi2d_LastEdgeDegenerated = ChFi2d_ConstructionError.ChFi2d_LastEdgeDegenerated
ChFi2d_BothEdgesDegenerated = ChFi2d_ConstructionError.ChFi2d_BothEdgesDegenerated
ChFi2d_NotAuthorized = ChFi2d_ConstructionError.ChFi2d_NotAuthorized
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
		/**** md5 signature: 21d0d1b7a94b448a4140e98f20f17340 ****/
		%feature("compactdefaultargs") ChFi2d_AnaFilletAlgo;
		%feature("autodoc", "An empty constructor. use the method init() to initialize the class.

Returns
-------
None
") ChFi2d_AnaFilletAlgo;
		 ChFi2d_AnaFilletAlgo();

		/****************** ChFi2d_AnaFilletAlgo ******************/
		/**** md5 signature: 449576dadb51bb526c64091844c56734 ****/
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
		/**** md5 signature: 862aecdf22004ff111806b6621966f3b ****/
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
		/**** md5 signature: e8c2c152c60d4cde5933a70fdf270367 ****/
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
		/**** md5 signature: 3303addb30b77521be03e6b5b28255c0 ****/
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
		/**** md5 signature: 296d0629ab2caa2b37bca9b5eca4a0fb ****/
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
		/**** md5 signature: 5744648d3de9eb104f52c7316465172c ****/
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
		/**** md5 signature: 3f86ae433ee00d11038ea767a4db5f27 ****/
		%feature("compactdefaultargs") ChFi2d_Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFi2d_Builder;
		 ChFi2d_Builder();

		/****************** ChFi2d_Builder ******************/
		/**** md5 signature: 45a9b36a9d446c861cb1d72485d909ab ****/
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
		/**** md5 signature: 8ab56100a5f8fd93f4f3849863205ed2 ****/
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
		/**** md5 signature: 08ba1f2a5a80f3f12155f274e5ccf476 ****/
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
		/**** md5 signature: 0537608457b4aa5c0d47332a8668ac27 ****/
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
		/**** md5 signature: c244b8627d4ba515112f85786021bf15 ****/
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
		/**** md5 signature: 66edbe74780ce3ab689192aa27e7b595 ****/
		%feature("compactdefaultargs") ChamferEdges;
		%feature("autodoc", "Returns the list of new edges.

Returns
-------
TopTools_SequenceOfShape
") ChamferEdges;
		const TopTools_SequenceOfShape & ChamferEdges();

		/****************** DescendantEdge ******************/
		/**** md5 signature: aeb8944df5eff8bc10450ec6f2cf0e76 ****/
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
		/**** md5 signature: 937d4c9906e8077f48db789584514415 ****/
		%feature("compactdefaultargs") FilletEdges;
		%feature("autodoc", "Returns the list of new edges.

Returns
-------
TopTools_SequenceOfShape
") FilletEdges;
		const TopTools_SequenceOfShape & FilletEdges();

		/****************** HasDescendant ******************/
		/**** md5 signature: 0541f95951f0773111d16c04ab78f51f ****/
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
		/**** md5 signature: a8dfaa68079e743e08190fe58d950a9a ****/
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
		/**** md5 signature: 7b460233038b2f415eaddf1e321fc705 ****/
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
		/**** md5 signature: 16d68e049352482fa8e513ef481ee475 ****/
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
		/**** md5 signature: f4b34f1306057c0cc8ca5f84d6421d3a ****/
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
		/**** md5 signature: 5dc8140e76c07e7e78ad0bb92d51e1c8 ****/
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
		/**** md5 signature: 4ba37be14168b13373613def465683a2 ****/
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
		/**** md5 signature: 1531286606ef0261ac4850615d79f229 ****/
		%feature("compactdefaultargs") NbChamfer;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbChamfer;
		Standard_Integer NbChamfer();

		/****************** NbFillet ******************/
		/**** md5 signature: 213e984e2e53209ba86769e63c780c6f ****/
		%feature("compactdefaultargs") NbFillet;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFillet;
		Standard_Integer NbFillet();

		/****************** RemoveChamfer ******************/
		/**** md5 signature: e2fe904642b9955c8a660d5a9fc1f9db ****/
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
		/**** md5 signature: c523feaddfccc8fecd7b796c40383670 ****/
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
		/**** md5 signature: 1480234eab43dd16d306ca94328a9d8d ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns the modified face.

Returns
-------
TopoDS_Face
") Result;
		TopoDS_Face Result();

		/****************** Status ******************/
		/**** md5 signature: d156d199c4dfd8fe1ae3da07b3861e60 ****/
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
		/**** md5 signature: b9cd31e1f8121990c06abf40877d0300 ****/
		%feature("compactdefaultargs") ChFi2d_ChamferAPI;
		%feature("autodoc", "An empty constructor.

Returns
-------
None
") ChFi2d_ChamferAPI;
		 ChFi2d_ChamferAPI();

		/****************** ChFi2d_ChamferAPI ******************/
		/**** md5 signature: 8938dc914966247537a1b4f01e13de66 ****/
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
		/**** md5 signature: 3dd3a936dc9ed531e13b33cbc7876f45 ****/
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
		/**** md5 signature: ed16fa62288b3a0405e5a9a04635dc04 ****/
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
		/**** md5 signature: b4f8e1f2c356366585a27c517a9813ae ****/
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
		/**** md5 signature: dc83e5133003c9f9c7b166df8b5a4192 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Constructs a chamfer edge. returns true if the edge is constructed.

Returns
-------
bool
") Perform;
		Standard_Boolean Perform();

		/****************** Result ******************/
		/**** md5 signature: 6eae4611de5834ad67d8abd68f9a58f2 ****/
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
		/**** md5 signature: d6d7a1d84e387cac22ee37b78be973d5 ****/
		%feature("compactdefaultargs") ChFi2d_FilletAPI;
		%feature("autodoc", "An empty constructor of the fillet algorithm. call a method init() to initialize the algorithm before calling of a perform() method.

Returns
-------
None
") ChFi2d_FilletAPI;
		 ChFi2d_FilletAPI();

		/****************** ChFi2d_FilletAPI ******************/
		/**** md5 signature: c08e06913ce086487ed3a44c9b9a5ad5 ****/
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
		/**** md5 signature: 8a4385b065acd0ec34522a5a83518fc0 ****/
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
		/**** md5 signature: e8c2c152c60d4cde5933a70fdf270367 ****/
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
		/**** md5 signature: 3303addb30b77521be03e6b5b28255c0 ****/
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
		/**** md5 signature: 1940d6bde20fdd8d7cc964038ca6aa79 ****/
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
		/**** md5 signature: 2b447cf377f0784629ef68c6d522b2f1 ****/
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
		/**** md5 signature: 47609a9593530a1c197f05dabded44c9 ****/
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
		/**** md5 signature: fc489062fd31ea48752549eb4287c14d ****/
		%feature("compactdefaultargs") ChFi2d_FilletAlgo;
		%feature("autodoc", "An empty constructor of the fillet algorithm. call a method init() to initialize the algorithm before calling of a perform() method.

Returns
-------
None
") ChFi2d_FilletAlgo;
		 ChFi2d_FilletAlgo();

		/****************** ChFi2d_FilletAlgo ******************/
		/**** md5 signature: 9d97283b99193e0d155ef1ba9a421036 ****/
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
		/**** md5 signature: 45a3c0afcad6601436a8e4730723dc4e ****/
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
		/**** md5 signature: e8c2c152c60d4cde5933a70fdf270367 ****/
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
		/**** md5 signature: 3303addb30b77521be03e6b5b28255c0 ****/
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
		/**** md5 signature: 1940d6bde20fdd8d7cc964038ca6aa79 ****/
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
		/**** md5 signature: 2b447cf377f0784629ef68c6d522b2f1 ****/
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
		/**** md5 signature: 47609a9593530a1c197f05dabded44c9 ****/
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
