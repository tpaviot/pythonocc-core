/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") ChFi2d

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include ChFi2d_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

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

%rename(chfi2d) ChFi2d;
%nodefaultctor ChFi2d;
class ChFi2d {
	public:
};


%extend ChFi2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFi2d_AnaFilletAlgo;
class ChFi2d_AnaFilletAlgo {
	public:
		%feature("compactdefaultargs") ChFi2d_AnaFilletAlgo;
		%feature("autodoc", "	* An empty constructor. Use the method Init() to initialize the class.

	:rtype: None
") ChFi2d_AnaFilletAlgo;
		 ChFi2d_AnaFilletAlgo ();
		%feature("compactdefaultargs") ChFi2d_AnaFilletAlgo;
		%feature("autodoc", "	* A constructor. It expects a wire consisting of two edges of type (any combination of): - segment - arc of circle.

	:param theWire:
	:type theWire: TopoDS_Wire &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") ChFi2d_AnaFilletAlgo;
		 ChFi2d_AnaFilletAlgo (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("compactdefaultargs") ChFi2d_AnaFilletAlgo;
		%feature("autodoc", "	* A constructor. It expects two edges having a common point of type: - segment - arc of circle.

	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") ChFi2d_AnaFilletAlgo;
		 ChFi2d_AnaFilletAlgo (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the class by a wire consisting of two edges.

	:param theWire:
	:type theWire: TopoDS_Wire &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the class by two edges.

	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Calculates a fillet.

	:param radius:
	:type radius: float
	:rtype: bool
") Perform;
		Standard_Boolean Perform (const Standard_Real radius);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Retrieves a result (fillet and shrinked neighbours).

	:param e1:
	:type e1: TopoDS_Edge &
	:param e2:
	:type e2: TopoDS_Edge &
	:rtype: TopoDS_Edge
") Result;
		const TopoDS_Edge  Result (TopoDS_Edge & e1,TopoDS_Edge & e2);
};


%extend ChFi2d_AnaFilletAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFi2d_Builder;
class ChFi2d_Builder {
	public:
		%feature("compactdefaultargs") ChFi2d_Builder;
		%feature("autodoc", "	:rtype: None
") ChFi2d_Builder;
		 ChFi2d_Builder ();
		%feature("compactdefaultargs") ChFi2d_Builder;
		%feature("autodoc", "	* The face <F> can be build on a closed or an open wire.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") ChFi2d_Builder;
		 ChFi2d_Builder (const TopoDS_Face & F);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param RefFace:
	:type RefFace: TopoDS_Face &
	:param ModFace:
	:type ModFace: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & RefFace,const TopoDS_Face & ModFace);
		%feature("compactdefaultargs") AddFillet;
		%feature("autodoc", "	* Add a fillet of radius <Radius> on the wire between the two edges connected to the vertex <V>. <AddFillet> returns the fillet edge. The returned edge has sense only if the status <status> is <IsDone>

	:param V:
	:type V: TopoDS_Vertex &
	:param Radius:
	:type Radius: float
	:rtype: TopoDS_Edge
") AddFillet;
		TopoDS_Edge AddFillet (const TopoDS_Vertex & V,const Standard_Real Radius);
		%feature("compactdefaultargs") ModifyFillet;
		%feature("autodoc", "	* modify the fillet radius and return the new fillet edge. this edge has sense only if the status <status> is <IsDone>.

	:param Fillet:
	:type Fillet: TopoDS_Edge &
	:param Radius:
	:type Radius: float
	:rtype: TopoDS_Edge
") ModifyFillet;
		TopoDS_Edge ModifyFillet (const TopoDS_Edge & Fillet,const Standard_Real Radius);
		%feature("compactdefaultargs") RemoveFillet;
		%feature("autodoc", "	* removes the fillet <Fillet> and returns the vertex connecting the two adjacent edges to this fillet.

	:param Fillet:
	:type Fillet: TopoDS_Edge &
	:rtype: TopoDS_Vertex
") RemoveFillet;
		TopoDS_Vertex RemoveFillet (const TopoDS_Edge & Fillet);
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "	* Add a chamfer on the wire between the two edges connected <E1> and <E2>. <AddChamfer> returns the chamfer edge. This edge has sense only if the status <status> is <IsDone>.

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param D1:
	:type D1: float
	:param D2:
	:type D2: float
	:rtype: TopoDS_Edge
") AddChamfer;
		TopoDS_Edge AddChamfer (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const Standard_Real D1,const Standard_Real D2);
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "	* Add a chamfer on the wire between the two edges connected to the vertex <V>. The chamfer will make an angle <Ang> with the edge <E>, and one of its extremities will be on <E> at distance <D>. The returned edge has sense only if the status <status> is <IsDone>. Warning: The value of <Ang> must be expressed in Radian.

	:param E:
	:type E: TopoDS_Edge &
	:param V:
	:type V: TopoDS_Vertex &
	:param D:
	:type D: float
	:param Ang:
	:type Ang: float
	:rtype: TopoDS_Edge
") AddChamfer;
		TopoDS_Edge AddChamfer (const TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real D,const Standard_Real Ang);
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "	* modify the chamfer <Chamfer> and returns the new chamfer edge. This edge as sense only if the status <status> is <IsDone>.

	:param Chamfer:
	:type Chamfer: TopoDS_Edge &
	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param D1:
	:type D1: float
	:param D2:
	:type D2: float
	:rtype: TopoDS_Edge
") ModifyChamfer;
		TopoDS_Edge ModifyChamfer (const TopoDS_Edge & Chamfer,const TopoDS_Edge & E1,const TopoDS_Edge & E2,const Standard_Real D1,const Standard_Real D2);
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "	* modify the chamfer <Chamfer> and returns the new chamfer edge. This edge as sense only if the status <status> is <IsDone>. Warning: The value of <Ang> must be expressed in Radian.

	:param Chamfer:
	:type Chamfer: TopoDS_Edge &
	:param E:
	:type E: TopoDS_Edge &
	:param D:
	:type D: float
	:param Ang:
	:type Ang: float
	:rtype: TopoDS_Edge
") ModifyChamfer;
		TopoDS_Edge ModifyChamfer (const TopoDS_Edge & Chamfer,const TopoDS_Edge & E,const Standard_Real D,const Standard_Real Ang);
		%feature("compactdefaultargs") RemoveChamfer;
		%feature("autodoc", "	* removes the chamfer <Chamfer> and returns the vertex connecting the two adjacent edges to this chamfer.

	:param Chamfer:
	:type Chamfer: TopoDS_Edge &
	:rtype: TopoDS_Vertex
") RemoveChamfer;
		TopoDS_Vertex RemoveChamfer (const TopoDS_Edge & Chamfer);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* returns the modified face

	:rtype: TopoDS_Face
") Result;
		TopoDS_Face Result ();
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") IsModified;
		Standard_Boolean IsModified (const TopoDS_Edge & E);
		%feature("compactdefaultargs") FilletEdges;
		%feature("autodoc", "	* returns the list of new edges

	:rtype: TopTools_SequenceOfShape
") FilletEdges;
		const TopTools_SequenceOfShape & FilletEdges ();
		%feature("compactdefaultargs") NbFillet;
		%feature("autodoc", "	:rtype: int
") NbFillet;
		Standard_Integer NbFillet ();
		%feature("compactdefaultargs") ChamferEdges;
		%feature("autodoc", "	* returns the list of new edges

	:rtype: TopTools_SequenceOfShape
") ChamferEdges;
		const TopTools_SequenceOfShape & ChamferEdges ();
		%feature("compactdefaultargs") NbChamfer;
		%feature("autodoc", "	:rtype: int
") NbChamfer;
		Standard_Integer NbChamfer ();
		%feature("compactdefaultargs") HasDescendant;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") HasDescendant;
		Standard_Boolean HasDescendant (const TopoDS_Edge & E);
		%feature("compactdefaultargs") DescendantEdge;
		%feature("autodoc", "	* returns the modified edge if <E> has descendant or <E> in the other case.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Edge
") DescendantEdge;
		const TopoDS_Edge  DescendantEdge (const TopoDS_Edge & E);
		%feature("compactdefaultargs") BasisEdge;
		%feature("autodoc", "	* Returns the parent edge of <E> Warning: If <E>is a basis edge, the returned edge would be equal to <E>

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Edge
") BasisEdge;
		const TopoDS_Edge  BasisEdge (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:rtype: ChFi2d_ConstructionError
") Status;
		ChFi2d_ConstructionError Status ();
};


%extend ChFi2d_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFi2d_ChamferAPI;
class ChFi2d_ChamferAPI {
	public:
		%feature("compactdefaultargs") ChFi2d_ChamferAPI;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") ChFi2d_ChamferAPI;
		 ChFi2d_ChamferAPI ();
		%feature("compactdefaultargs") ChFi2d_ChamferAPI;
		%feature("autodoc", "	* A constructor accepting a wire consisting of two linear edges.

	:param theWire:
	:type theWire: TopoDS_Wire &
	:rtype: None
") ChFi2d_ChamferAPI;
		 ChFi2d_ChamferAPI (const TopoDS_Wire & theWire);
		%feature("compactdefaultargs") ChFi2d_ChamferAPI;
		%feature("autodoc", "	* A constructor accepting two linear edges.

	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:rtype: None
") ChFi2d_ChamferAPI;
		 ChFi2d_ChamferAPI (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the class by a wire consisting of two libear edges.

	:param theWire:
	:type theWire: TopoDS_Wire &
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & theWire);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the class by two linear edges.

	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Constructs a chamfer edge. Returns true if the edge is constructed.

	:rtype: bool
") Perform;
		Standard_Boolean Perform ();
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:param theLength1:
	:type theLength1: float
	:param theLength2:
	:type theLength2: float
	:rtype: TopoDS_Edge
") Result;
		TopoDS_Edge Result (TopoDS_Edge & theEdge1,TopoDS_Edge & theEdge2,const Standard_Real theLength1,const Standard_Real theLength2);
};


%extend ChFi2d_ChamferAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFi2d_FilletAPI;
class ChFi2d_FilletAPI {
	public:
		%feature("compactdefaultargs") ChFi2d_FilletAPI;
		%feature("autodoc", "	* An empty constructor of the fillet algorithm. Call a method Init() to initialize the algorithm before calling of a Perform() method.

	:rtype: None
") ChFi2d_FilletAPI;
		 ChFi2d_FilletAPI ();
		%feature("compactdefaultargs") ChFi2d_FilletAPI;
		%feature("autodoc", "	* A constructor of a fillet algorithm: accepts a wire consisting of two edges in a plane.

	:param theWire:
	:type theWire: TopoDS_Wire &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") ChFi2d_FilletAPI;
		 ChFi2d_FilletAPI (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("compactdefaultargs") ChFi2d_FilletAPI;
		%feature("autodoc", "	* A constructor of a fillet algorithm: accepts two edges in a plane.

	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") ChFi2d_FilletAPI;
		 ChFi2d_FilletAPI (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes a fillet algorithm: accepts a wire consisting of two edges in a plane.

	:param theWire:
	:type theWire: TopoDS_Wire &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes a fillet algorithm: accepts two edges in a plane.

	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Constructs a fillet edge. Returns true if at least one result was found.

	:param theRadius:
	:type theRadius: float
	:rtype: bool
") Perform;
		Standard_Boolean Perform (const Standard_Real theRadius);
		%feature("compactdefaultargs") NbResults;
		%feature("autodoc", "	* Returns number of possible solutions. <thePoint> chooses a particular fillet in case of several fillets may be constructed (for example, a circle intersecting a segment in 2 points). Put the intersecting (or common) point of the edges.

	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: int
") NbResults;
		Standard_Integer NbResults (const gp_Pnt & thePoint);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Returns result (fillet edge, modified edge1, modified edge2), nearest to the given point <thePoint> if iSolution == -1 <thePoint> chooses a particular fillet in case of several fillets may be constructed (for example, a circle intersecting a segment in 2 points). Put the intersecting (or common) point of the edges.

	:param thePoint:
	:type thePoint: gp_Pnt
	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:param iSolution: default value is -1
	:type iSolution: int
	:rtype: TopoDS_Edge
") Result;
		TopoDS_Edge Result (const gp_Pnt & thePoint,TopoDS_Edge & theEdge1,TopoDS_Edge & theEdge2,const Standard_Integer iSolution = -1);
};


%extend ChFi2d_FilletAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFi2d_FilletAlgo;
class ChFi2d_FilletAlgo {
	public:
		%feature("compactdefaultargs") ChFi2d_FilletAlgo;
		%feature("autodoc", "	* An empty constructor of the fillet algorithm. Call a method Init() to initialize the algorithm before calling of a Perform() method.

	:rtype: None
") ChFi2d_FilletAlgo;
		 ChFi2d_FilletAlgo ();
		%feature("compactdefaultargs") ChFi2d_FilletAlgo;
		%feature("autodoc", "	* A constructor of a fillet algorithm: accepts a wire consisting of two edges in a plane.

	:param theWire:
	:type theWire: TopoDS_Wire &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") ChFi2d_FilletAlgo;
		 ChFi2d_FilletAlgo (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("compactdefaultargs") ChFi2d_FilletAlgo;
		%feature("autodoc", "	* A constructor of a fillet algorithm: accepts two edges in a plane.

	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") ChFi2d_FilletAlgo;
		 ChFi2d_FilletAlgo (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes a fillet algorithm: accepts a wire consisting of two edges in a plane.

	:param theWire:
	:type theWire: TopoDS_Wire &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes a fillet algorithm: accepts two edges in a plane.

	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Constructs a fillet edge. Returns true, if at least one result was found

	:param theRadius:
	:type theRadius: float
	:rtype: bool
") Perform;
		Standard_Boolean Perform (const Standard_Real theRadius);
		%feature("compactdefaultargs") NbResults;
		%feature("autodoc", "	* Returns number of possible solutions. <thePoint> chooses a particular fillet in case of several fillets may be constructed (for example, a circle intersecting a segment in 2 points). Put the intersecting (or common) point of the edges.

	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: int
") NbResults;
		Standard_Integer NbResults (const gp_Pnt & thePoint);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Returns result (fillet edge, modified edge1, modified edge2), neares to the given point <thePoint> if iSolution == -1. <thePoint> chooses a particular fillet in case of several fillets may be constructed (for example, a circle intersecting a segment in 2 points). Put the intersecting (or common) point of the edges.

	:param thePoint:
	:type thePoint: gp_Pnt
	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:param iSolution: default value is -1
	:type iSolution: int
	:rtype: TopoDS_Edge
") Result;
		TopoDS_Edge Result (const gp_Pnt & thePoint,TopoDS_Edge & theEdge1,TopoDS_Edge & theEdge2,const Standard_Integer iSolution = -1);
};


%extend ChFi2d_FilletAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
