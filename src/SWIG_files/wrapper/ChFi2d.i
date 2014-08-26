/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module ChFi2d

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include ChFi2d_required_python_modules.i
%include ChFi2d_headers.i

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


%feature("shadow") ChFi2d::~ChFi2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFi2d_AnaFilletAlgo;
class ChFi2d_AnaFilletAlgo {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

An empty constructor.
Use the method Init() to initialize the class.") ChFi2d_AnaFilletAlgo;
		 ChFi2d_AnaFilletAlgo ();
		%feature("autodoc", "Args:
	theWire(TopoDS_Wire)
	thePlane(gp_Pln)

Returns:
	None

A constructor.
It expects a wire consisting of two edges of type (any combination of):
- segment
- arc of circle.") ChFi2d_AnaFilletAlgo;
		 ChFi2d_AnaFilletAlgo (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)
	thePlane(gp_Pln)

Returns:
	None

A constructor.
It expects two edges having a common point of type:
- segment
- arc of circle.") ChFi2d_AnaFilletAlgo;
		 ChFi2d_AnaFilletAlgo (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theWire(TopoDS_Wire)
	thePlane(gp_Pln)

Returns:
	None

Initializes the class by a wire consisting of two edges.") Init;
		void Init (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)
	thePlane(gp_Pln)

Returns:
	None

Initializes the class by two edges.") Init;
		void Init (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	radius(Standard_Real)

Returns:
	Standard_Boolean

Calculates a fillet.") Perform;
		Standard_Boolean Perform (const Standard_Real radius);
		%feature("autodoc", "Args:
	e1(TopoDS_Edge)
	e2(TopoDS_Edge)

Returns:
	TopoDS_Edge

Retrieves a result (fillet and shrinked neighbours).") Result;
		const TopoDS_Edge & Result (TopoDS_Edge & e1,TopoDS_Edge & e2);
};


%feature("shadow") ChFi2d_AnaFilletAlgo::~ChFi2d_AnaFilletAlgo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi2d_AnaFilletAlgo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFi2d_Builder;
class ChFi2d_Builder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFi2d_Builder;
		 ChFi2d_Builder ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

The face  <F> can be build  on a closed or an open  
         wire.") ChFi2d_Builder;
		 ChFi2d_Builder (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	RefFace(TopoDS_Face)
	ModFace(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Face & RefFace,const TopoDS_Face & ModFace);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	Radius(Standard_Real)

Returns:
	TopoDS_Edge

Add  a fillet  of   radius  <Radius> on  the  wire  
         between the two edges connected to the vertex <V>.  
         <AddFillet> returns the  fillet edge. The returned  
         edge has  sense only   if the status   <status> is  
         <IsDone>") AddFillet;
		TopoDS_Edge AddFillet (const TopoDS_Vertex & V,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Fillet(TopoDS_Edge)
	Radius(Standard_Real)

Returns:
	TopoDS_Edge

modify the fillet radius and return the new fillet  
         edge. this    edge has sense  only if   the status  
         <status> is <IsDone>.") ModifyFillet;
		TopoDS_Edge ModifyFillet (const TopoDS_Edge & Fillet,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Fillet(TopoDS_Edge)

Returns:
	TopoDS_Vertex

removes the fillet <Fillet> and returns the vertex  
         connecting the two adjacent edges to  this fillet.") RemoveFillet;
		TopoDS_Vertex RemoveFillet (const TopoDS_Edge & Fillet);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	D1(Standard_Real)
	D2(Standard_Real)

Returns:
	TopoDS_Edge

Add a chamfer on  the  wire between the two  edges  
         connected <E1> and  <E2>. <AddChamfer> returns the  
         chamfer  edge. This  edge  has  sense only if  the  
         status <status> is <IsDone>.") AddChamfer;
		TopoDS_Edge AddChamfer (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const Standard_Real D1,const Standard_Real D2);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	V(TopoDS_Vertex)
	D(Standard_Real)
	Ang(Standard_Real)

Returns:
	TopoDS_Edge

Add  a chamfer on the   wire between the two edges  
         connected to the vertex <V>. The chamfer will make  
         an  angle <Ang> with the edge  <E>, and one of its  
         extremities  will be on  <E>  at distance <D>. The  
         returned   edge has sense   only   if the   status  
         <status> is <IsDone>.  
 Warning: The value of <Ang> must be expressed in Radian.") AddChamfer;
		TopoDS_Edge AddChamfer (const TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real D,const Standard_Real Ang);
		%feature("autodoc", "Args:
	Chamfer(TopoDS_Edge)
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	D1(Standard_Real)
	D2(Standard_Real)

Returns:
	TopoDS_Edge

modify the chamfer <Chamfer>  and returns  the new  
         chamfer edge.  
         This edge as sense only  if the status <status> is  
         <IsDone>.") ModifyChamfer;
		TopoDS_Edge ModifyChamfer (const TopoDS_Edge & Chamfer,const TopoDS_Edge & E1,const TopoDS_Edge & E2,const Standard_Real D1,const Standard_Real D2);
		%feature("autodoc", "Args:
	Chamfer(TopoDS_Edge)
	E(TopoDS_Edge)
	D(Standard_Real)
	Ang(Standard_Real)

Returns:
	TopoDS_Edge

modify the  chamfer <Chamfer>  and returns the new  
         chamfer edge. This    edge as sense  only   if the  
         status <status>   is  <IsDone>.  
 Warning: The value of <Ang> must be expressed in Radian.") ModifyChamfer;
		TopoDS_Edge ModifyChamfer (const TopoDS_Edge & Chamfer,const TopoDS_Edge & E,const Standard_Real D,const Standard_Real Ang);
		%feature("autodoc", "Args:
	Chamfer(TopoDS_Edge)

Returns:
	TopoDS_Vertex

removes   the chamfer  <Chamfer>   and returns the  
         vertex connecting  the two adjacent  edges to this  
         chamfer.") RemoveChamfer;
		TopoDS_Vertex RemoveChamfer (const TopoDS_Edge & Chamfer);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

returns the modified face") Result;
		TopoDS_Face Result ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsModified;
		Standard_Boolean IsModified (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

returns the list of new edges") FilletEdges;
		const TopTools_SequenceOfShape & FilletEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbFillet;
		Standard_Integer NbFillet ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

returns the list of new edges") ChamferEdges;
		const TopTools_SequenceOfShape & ChamferEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbChamfer;
		Standard_Integer NbChamfer ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasDescendant;
		Standard_Boolean HasDescendant (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopoDS_Edge

returns the modified edge if <E> has descendant or  
         <E> in the other case.") DescendantEdge;
		const TopoDS_Edge & DescendantEdge (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopoDS_Edge

Returns the parent edge of  <E>  
 Warning: If <E>is a basis edge,  the returned edge would be  
         equal to <E>") BasisEdge;
		const TopoDS_Edge & BasisEdge (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	ChFi2d_ConstructionError

No detailed docstring for this function.") Status;
		ChFi2d_ConstructionError Status ();
};


%feature("shadow") ChFi2d_Builder::~ChFi2d_Builder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi2d_Builder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFi2d_ChamferAPI;
class ChFi2d_ChamferAPI {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

An empty constructor.") ChFi2d_ChamferAPI;
		 ChFi2d_ChamferAPI ();
		%feature("autodoc", "Args:
	theWire(TopoDS_Wire)

Returns:
	None

A constructor accepting a wire consisting of two linear edges.") ChFi2d_ChamferAPI;
		 ChFi2d_ChamferAPI (const TopoDS_Wire & theWire);
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)

Returns:
	None

A constructor accepting two linear edges.") ChFi2d_ChamferAPI;
		 ChFi2d_ChamferAPI (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2);
		%feature("autodoc", "Args:
	theWire(TopoDS_Wire)

Returns:
	None

Initializes the class by a wire consisting of two libear edges.") Init;
		void Init (const TopoDS_Wire & theWire);
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)

Returns:
	None

Initializes the class by two linear edges.") Init;
		void Init (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Constructs a chamfer edge.
Returns true if the edge is constructed.") Perform;
		Standard_Boolean Perform ();
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)
	theLength1(Standard_Real)
	theLength2(Standard_Real)

Returns:
	TopoDS_Edge

No detailed docstring for this function.") Result;
		TopoDS_Edge Result (TopoDS_Edge & theEdge1,TopoDS_Edge & theEdge2,const Standard_Real theLength1,const Standard_Real theLength2);
};


%feature("shadow") ChFi2d_ChamferAPI::~ChFi2d_ChamferAPI %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi2d_ChamferAPI {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFi2d_FilletAPI;
class ChFi2d_FilletAPI {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

An empty constructor of the fillet algorithm.
Call a method Init() to initialize the algorithm
before calling of a Perform() method.") ChFi2d_FilletAPI;
		 ChFi2d_FilletAPI ();
		%feature("autodoc", "Args:
	theWire(TopoDS_Wire)
	thePlane(gp_Pln)

Returns:
	None

A constructor of a fillet algorithm: accepts a wire consisting of two edges in a plane.") ChFi2d_FilletAPI;
		 ChFi2d_FilletAPI (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)
	thePlane(gp_Pln)

Returns:
	None

A constructor of a fillet algorithm: accepts two edges in a plane.") ChFi2d_FilletAPI;
		 ChFi2d_FilletAPI (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theWire(TopoDS_Wire)
	thePlane(gp_Pln)

Returns:
	None

Initializes a fillet algorithm: accepts a wire consisting of two edges in a plane.") Init;
		void Init (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)
	thePlane(gp_Pln)

Returns:
	None

Initializes a fillet algorithm: accepts two edges in a plane.") Init;
		void Init (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theRadius(Standard_Real)

Returns:
	Standard_Boolean

Constructs a fillet edge.
Returns true if at least one result was found.") Perform;
		Standard_Boolean Perform (const Standard_Real theRadius);
		%feature("autodoc", "Args:
	thePoint(gp_Pnt)

Returns:
	Standard_Integer

Returns number of possible solutions.
<thePoint> chooses a particular fillet in case of several fillets 
may be constructed (for example, a circle intersecting a segment in 2 points).
Put the intersecting (or common) point of the edges.") NbResults;
		Standard_Integer NbResults (const gp_Pnt & thePoint);
		%feature("autodoc", "Args:
	thePoint(gp_Pnt)
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)
	iSolution(Standard_Integer)=- 1

Returns:
	TopoDS_Edge

Returns result (fillet edge, modified edge1, modified edge2), 
nearest to the given point <thePoint> if iSolution == -1
<thePoint> chooses a particular fillet in case of several fillets 
may be constructed (for example, a circle intersecting a segment in 2 points).
Put the intersecting (or common) point of the edges.") Result;
		TopoDS_Edge Result (const gp_Pnt & thePoint,TopoDS_Edge & theEdge1,TopoDS_Edge & theEdge2,const Standard_Integer iSolution = - 1);
};


%feature("shadow") ChFi2d_FilletAPI::~ChFi2d_FilletAPI %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi2d_FilletAPI {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFi2d_FilletAlgo;
class ChFi2d_FilletAlgo {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

An empty constructor of the fillet algorithm.
Call a method Init() to initialize the algorithm
before calling of a Perform() method.") ChFi2d_FilletAlgo;
		 ChFi2d_FilletAlgo ();
		%feature("autodoc", "Args:
	theWire(TopoDS_Wire)
	thePlane(gp_Pln)

Returns:
	None

A constructor of a fillet algorithm: accepts a wire consisting of two edges in a plane.") ChFi2d_FilletAlgo;
		 ChFi2d_FilletAlgo (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)
	thePlane(gp_Pln)

Returns:
	None

A constructor of a fillet algorithm: accepts two edges in a plane.") ChFi2d_FilletAlgo;
		 ChFi2d_FilletAlgo (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theWire(TopoDS_Wire)
	thePlane(gp_Pln)

Returns:
	None

Initializes a fillet algorithm: accepts a wire consisting of two edges in a plane.") Init;
		void Init (const TopoDS_Wire & theWire,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)
	thePlane(gp_Pln)

Returns:
	None

Initializes a fillet algorithm: accepts two edges in a plane.") Init;
		void Init (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const gp_Pln & thePlane);
		%feature("autodoc", "Args:
	theRadius(Standard_Real)

Returns:
	Standard_Boolean

Constructs a fillet edge.
Returns true, if at least one result was found") Perform;
		Standard_Boolean Perform (const Standard_Real theRadius);
		%feature("autodoc", "Args:
	thePoint(gp_Pnt)

Returns:
	Standard_Integer

Returns number of possible solutions.
<thePoint> chooses a particular fillet in case of several fillets 
may be constructed (for example, a circle intersecting a segment in 2 points).
Put the intersecting (or common) point of the edges.") NbResults;
		Standard_Integer NbResults (const gp_Pnt & thePoint);
		%feature("autodoc", "Args:
	thePoint(gp_Pnt)
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)
	iSolution(Standard_Integer)=- 1

Returns:
	TopoDS_Edge

Returns result (fillet edge, modified edge1, modified edge2), 
neares to the given point <thePoint> if iSolution == -1.
<thePoint> chooses a particular fillet in case of several fillets 
may be constructed (for example, a circle intersecting a segment in 2 points).
Put the intersecting (or common) point of the edges.") Result;
		TopoDS_Edge Result (const gp_Pnt & thePoint,TopoDS_Edge & theEdge1,TopoDS_Edge & theEdge2,const Standard_Integer iSolution = - 1);
};


%feature("shadow") ChFi2d_FilletAlgo::~ChFi2d_FilletAlgo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi2d_FilletAlgo {
	void _kill_pointed() {
		delete $self;
	}
};
