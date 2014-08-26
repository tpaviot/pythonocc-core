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
%module BRepLib

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

%include BRepLib_required_python_modules.i
%include BRepLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum BRepLib_EdgeError {
	BRepLib_EdgeDone = 0,
	BRepLib_PointProjectionFailed = 1,
	BRepLib_ParameterOutOfRange = 2,
	BRepLib_DifferentPointsOnClosedCurve = 3,
	BRepLib_PointWithInfiniteParameter = 4,
	BRepLib_DifferentsPointAndParameter = 5,
	BRepLib_LineThroughIdenticPoints = 6,
};

enum BRepLib_FaceError {
	BRepLib_FaceDone = 0,
	BRepLib_NoFace = 1,
	BRepLib_NotPlanar = 2,
	BRepLib_CurveProjectionFailed = 3,
	BRepLib_ParametersOutOfRange = 4,
};

enum BRepLib_ShapeModification {
	BRepLib_Preserved = 0,
	BRepLib_Deleted = 1,
	BRepLib_Trimmed = 2,
	BRepLib_Merged = 3,
	BRepLib_BoundaryModified = 4,
};

enum BRepLib_ShellError {
	BRepLib_ShellDone = 0,
	BRepLib_EmptyShell = 1,
	BRepLib_DisconnectedShell = 2,
	BRepLib_ShellParametersOutOfRange = 3,
};

enum BRepLib_WireError {
	BRepLib_WireDone = 0,
	BRepLib_EmptyWire = 1,
	BRepLib_DisconnectedWire = 2,
	BRepLib_NonManifoldWire = 3,
};

/* end public enums declaration */

%rename(breplib) BRepLib;
%nodefaultctor BRepLib;
class BRepLib {
	public:
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	static void

Sets the default precision.  The current Precision  
         is returned.") Precision;
		static void Precision (const Standard_Real P);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Real

Returns the default precision.") Precision;
		static Standard_Real Precision ();
		%feature("autodoc", "Args:
	P(Handle_Geom_Plane)

Returns:
	static void

Sets the current plane to P.") Plane;
		static void Plane (const Handle_Geom_Plane & P);
		%feature("autodoc", "Args:
	None
Returns:
	static  Handle_Geom_Plane

Returns the current plane.") Plane;
		static const Handle_Geom_Plane & Plane ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	Confusion(Standard_Real)=1.0e-12

Returns:
	static Standard_Boolean

checks if the Edge is same range IGNORING  
         the same range flag of the edge  
         Confusion argument is to compare real numbers  
         idenpendently of any model space tolerance") CheckSameRange;
		static Standard_Boolean CheckSameRange (const TopoDS_Edge & E,const Standard_Real Confusion = 1.0e-12);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	Tolerance(Standard_Real)=1.0e-5

Returns:
	static void

will make all the curve representation have  
         the same range domain for the parameters.  
         This will IGNORE the same range flag value  
         to proceed.  
         If there is a 3D curve there it will the  
         range of that curve. If not the first curve representation  
         encountered in the list will give its range to  
         the all the other curves.") SameRange;
		static void SameRange (const TopoDS_Edge & E,const Standard_Real Tolerance = 1.0e-5);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	Tolerance(Standard_Real)=1.0e-5
	Continuity(GeomAbs_Shape)=GeomAbs_C1
	MaxDegree(Standard_Integer)=14
	MaxSegment(Standard_Integer)=0

Returns:
	static Standard_Boolean

Computes the 3d curve for the edge  <E> if it does  
         not exist. Returns True  if the curve was computed  
         or  existed. Returns False  if there is no  planar  
         pcurve or the computation failed.  
         <MaxSegment> >= 30 in approximation") BuildCurve3d;
		static Standard_Boolean BuildCurve3d (const TopoDS_Edge & E,const Standard_Real Tolerance = 1.0e-5,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Integer MaxDegree = 14,const Standard_Integer MaxSegment = 0);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Tolerance(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C1
	MaxDegree(Standard_Integer)=14
	MaxSegment(Standard_Integer)=0

Returns:
	static Standard_Boolean

Computes  the 3d curves  for all the  edges of <S>  
         return False if one of the computation failed.  
         <MaxSegment> >= 30 in approximation") BuildCurves3d;
		static Standard_Boolean BuildCurves3d (const TopoDS_Shape & S,const Standard_Real Tolerance,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Integer MaxDegree = 14,const Standard_Integer MaxSegment = 0);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static Standard_Boolean

Computes  the 3d curves  for all the  edges of <S>  
         return False if one of the computation failed.") BuildCurves3d;
		static Standard_Boolean BuildCurves3d (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	MinToleranceRequest(Standard_Real)
	MaxToleranceToCheck(Standard_Real)

Returns:
	static Standard_Boolean

Checks if the edge has a  Tolerance smaller than -- --  
      -- -- MaxToleranceToCheck  if  so it will compute  the  
      radius    of  -- the   cylindrical  pipe  surface that  
      MinToleranceRequest is the minimum tolerance before it  
      is usefull to start testing. Usually it should be arround  
      10e-5  
      contains all  --  the curve represenation of  the edge  
      returns True if the Edge tolerance had to be updated") UpdateEdgeTol;
		static Standard_Boolean UpdateEdgeTol (const TopoDS_Edge & E,const Standard_Real MinToleranceRequest,const Standard_Real MaxToleranceToCheck);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	MinToleranceRequest(Standard_Real)
	MaxToleranceToCheck(Standard_Real)

Returns:
	static Standard_Boolean

-- Checks all the edges of the shape whose -- -- --  
         Tolerance  is  smaller than  MaxToleranceToCheck --  
          Returns True if at  least  one edge was updated --  
         MinToleranceRequest is the minimum tolerance before  
         --  it -- is  usefull to start  testing. Usually it  
         should be arround -- 10e-5--  
 
 Warning :The  method is  very  slow  as it  checks all.  
        Use  only  in interfaces or  processing assimilate batch") UpdateEdgeTolerance;
		static Standard_Boolean UpdateEdgeTolerance (const TopoDS_Shape & S,const Standard_Real MinToleranceRequest,const Standard_Real MaxToleranceToCheck);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	Tolerance(Standard_Real)=1.0e-5

Returns:
	static void

Computes new 2d curve(s)  for the edge <E> to have  
         the same parameter  as  the  3d curve.  
         The algorithm is not done if the flag SameParameter  
         was True  on the  Edge.") SameParameter;
		static void SameParameter (const TopoDS_Edge & E,const Standard_Real Tolerance = 1.0e-5);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Tolerance(Standard_Real)=1.0e-5
	forced(Standard_Boolean)=Standard_False

Returns:
	static void

Computes new 2d curve(s) for all the edges of  <S>  
         to have the same parameter  as  the  3d curve.  
         The algorithm is not done if the flag SameParameter  
         was True  on an  Edge.") SameParameter;
		static void SameParameter (const TopoDS_Shape & S,const Standard_Real Tolerance = 1.0e-5,const Standard_Boolean forced = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	verifyFaceTolerance(Standard_Boolean)=Standard_False

Returns:
	static void

Replaces tolerance   of  FACE EDGE VERTEX  by  the  
         tolerance Max of their connected handling shapes.  
         It is not necessary to use this call after  
         SameParameter. (called in)") UpdateTolerances;
		static void UpdateTolerances (const TopoDS_Shape & S,const Standard_Boolean verifyFaceTolerance = Standard_False);
		%feature("autodoc", "Args:
	solid(TopoDS_Solid)

Returns:
	static Standard_Boolean

Orients the solid forward  and the  shell with the  
          orientation to have  matter in the solid. Returns  
         False if the solid is unOrientable (open or incoherent)") OrientClosedSolid;
		static Standard_Boolean OrientClosedSolid (TopoDS_Solid & solid);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TolAng(Standard_Real)=1.0e-10

Returns:
	static void

Encodes the Regularity of edges on a Shape.  
 Warning: <TolAng> is an angular tolerance, expressed in Rad.  
 Warning: If the edges's regularity are coded before, nothing  
         is done.") EncodeRegularity;
		static void EncodeRegularity (const TopoDS_Shape & S,const Standard_Real TolAng = 1.0e-10);
		%feature("autodoc", "Args:
	S(TopoDS_Edge)
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	TolAng(Standard_Real)=1.0e-10

Returns:
	static void

Encodes the Regularity beetween <F1> and <F2> by <E>  
Warning: <TolAng> is an angular tolerance, expressed in Rad.  
Warning: If the edge's regularity is coded before, nothing  
         is done.") EncodeRegularity;
		static void EncodeRegularity (TopoDS_Edge & S,const TopoDS_Face & F1,const TopoDS_Face & F2,const Standard_Real TolAng = 1.0e-10);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	LF(TopTools_ListOfShape)

Returns:
	static void

Sorts in  LF the Faces of   S on the  complexity of  
                            their                  surfaces  
         (Plane,Cylinder,Cone,Sphere,Torus,other)") SortFaces;
		static void SortFaces (const TopoDS_Shape & S,TopTools_ListOfShape & LF);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	LF(TopTools_ListOfShape)

Returns:
	static void

Sorts in  LF  the   Faces  of S   on the reverse  
              complexity       of       their      surfaces  
         (other,Torus,Sphere,Cone,Cylinder,Plane)") ReverseSortFaces;
		static void ReverseSortFaces (const TopoDS_Shape & S,TopTools_ListOfShape & LF);
};


%feature("shadow") BRepLib::~BRepLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_Command;
class BRepLib_Command {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Raises NotDone if done is false.") Check;
		void Check ();
};


%feature("shadow") BRepLib_Command::~BRepLib_Command %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_Command {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_FindSurface;
class BRepLib_FindSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepLib_FindSurface;
		 BRepLib_FindSurface ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Tol(Standard_Real)=- 1
	OnlyPlane(Standard_Boolean)=Standard_False
	OnlyClosed(Standard_Boolean)=Standard_False

Returns:
	None

Computes the Surface from the edges of  <S> with the  
         given tolerance.  
         if <OnlyPlane> is true, the computed surface will be  
         a plane. If it is not possible to find a plane, the  
         flag NotDone will be set.  
         If <OnlyClosed> is true,  then  S  sould be a wire  
         and the existing surface,  on  which wire S is not  
         closed in 2D, will be ignored.") BRepLib_FindSurface;
		 BRepLib_FindSurface (const TopoDS_Shape & S,const Standard_Real Tol = - 1,const Standard_Boolean OnlyPlane = Standard_False,const Standard_Boolean OnlyClosed = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Tol(Standard_Real)=- 1
	OnlyPlane(Standard_Boolean)=Standard_False
	OnlyClosed(Standard_Boolean)=Standard_False

Returns:
	None

Computes the Surface from the edges of  <S> with the  
         given tolerance.  
         if <OnlyPlane> is true, the computed surface will be  
         a plane. If it is not possible to find a plane, the  
         flag NotDone will be set.  
         If <OnlyClosed> is true,  then  S  sould be a wire  
         and the existing surface,  on  which wire S is not  
         closed in 2D, will be ignored.") Init;
		void Init (const TopoDS_Shape & S,const Standard_Real Tol = - 1,const Standard_Boolean OnlyPlane = Standard_False,const Standard_Boolean OnlyClosed = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Found;
		Standard_Boolean Found ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Surface;
		Handle_Geom_Surface Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ToleranceReached;
		Standard_Real ToleranceReached ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Existed;
		Standard_Boolean Existed ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

No detailed docstring for this function.") Location;
		TopLoc_Location Location ();
};


%feature("shadow") BRepLib_FindSurface::~BRepLib_FindSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_FindSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_FuseEdges;
class BRepLib_FuseEdges {
	public:
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	PerformNow(Standard_Boolean)=Standard_False

Returns:
	None

Initialise members  and build  construction of map  
         of ancestors.") BRepLib_FuseEdges;
		 BRepLib_FuseEdges (const TopoDS_Shape & theShape,const Standard_Boolean PerformNow = Standard_False);
		%feature("autodoc", "Args:
	theMapEdg(TopTools_IndexedMapOfShape)

Returns:
	None

set edges to avoid being fused") AvoidEdges;
		void AvoidEdges (const TopTools_IndexedMapOfShape & theMapEdg);
		%feature("autodoc", "Args:
	theConcatBSpl(Standard_Boolean)=Standard_True

Returns:
	None

set mode to enable concatenation G1 BSpline edges in one  
 End  Modified  by  IFV  19.04.07") SetConcatBSpl;
		void SetConcatBSpl (const Standard_Boolean theConcatBSpl = Standard_True);
		%feature("autodoc", "Args:
	theMapLstEdg(TopTools_DataMapOfIntegerListOfShape)

Returns:
	None

returns  all the list of edges to be fused  
         each list of the map represent a set of connex edges  
         that can be fused.") Edges;
		void Edges (TopTools_DataMapOfIntegerListOfShape & theMapLstEdg);
		%feature("autodoc", "Args:
	theMapEdg(TopTools_DataMapOfIntegerShape)

Returns:
	None

returns all the fused edges. each integer entry in  
          the   map  corresponds  to  the  integer   in the  
          DataMapOfIntegerListOfShape  we    get in  method  
         Edges.   That is to say, to  the list  of edges in  
         theMapLstEdg(i) corresponds the resulting edge theMapEdge(i)") ResultEdges;
		void ResultEdges (TopTools_DataMapOfIntegerShape & theMapEdg);
		%feature("autodoc", "Args:
	theMapFac(TopTools_DataMapOfShapeShape)

Returns:
	None

returns the map of modified faces.") Faces;
		void Faces (TopTools_DataMapOfShapeShape & theMapFac);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns myShape modified with the list of internal  
         edges removed from it.") Shape;
		TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of vertices candidate to be removed") NbVertices;
		Standard_Integer NbVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Using  map of list of connex  edges, fuse each list to  
          one edge and then update myShape") Perform;
		void Perform ();
};


%feature("shadow") BRepLib_FuseEdges::~BRepLib_FuseEdges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_FuseEdges {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeShape;
class BRepLib_MakeShape : public BRepLib_Command {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

This is  called by  Shape().  It does  nothing but  
         may be redefined.") Build;
		void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Shape;
		 operator TopoDS_Shape ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	virtual BRepLib_ShapeModification

returns the status of the Face after  
         the shape creation.") FaceStatus;
		virtual BRepLib_ShapeModification FaceStatus (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	virtual Standard_Boolean

Returns True if the Face generates new topology.") HasDescendants;
		virtual Standard_Boolean HasDescendants (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	virtual  TopTools_ListOfShape

returns the list of generated Faces.") DescendantFaces;
		virtual const TopTools_ListOfShape & DescendantFaces (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of surfaces  
         after the shape creation.") NbSurfaces;
		virtual Standard_Integer NbSurfaces ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	virtual  TopTools_ListOfShape

Return the faces created for surface I.") NewFaces;
		virtual const TopTools_ListOfShape & NewFaces (const Standard_Integer I);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	virtual  TopTools_ListOfShape

returns a list of the created faces  
         from the edge <E>.") FacesFromEdges;
		virtual const TopTools_ListOfShape & FacesFromEdges (const TopoDS_Edge & E);
};


%feature("shadow") BRepLib_MakeShape::~BRepLib_MakeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeEdge;
class BRepLib_MakeEdge : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge ();
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Lin & L);
		%feature("autodoc", "Args:
	L(gp_Lin)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Lin & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Lin)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Lin & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Lin)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Lin & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Circ)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Circ & L);
		%feature("autodoc", "Args:
	L(gp_Circ)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Circ & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Circ)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Circ & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Circ)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Circ & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Elips)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Elips & L);
		%feature("autodoc", "Args:
	L(gp_Elips)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Elips & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Elips)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Elips & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Elips)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Elips & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Hypr)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Hypr & L);
		%feature("autodoc", "Args:
	L(gp_Hypr)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Hypr & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Hypr)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Hypr & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Hypr)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Hypr & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Parab)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Parab & L);
		%feature("autodoc", "Args:
	L(gp_Parab)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Parab & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Parab)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Parab & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Parab)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Parab & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)
	P1(gp_Pnt)
	P2(gp_Pnt)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	P1(gp_Pnt)
	P2(gp_Pnt)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Curve & C,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Curve & C,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	P1(gp_Pnt)
	P2(gp_Pnt)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Curve & C,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	P1(gp_Pnt)
	P2(gp_Pnt)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	None
Returns:
	BRepLib_EdgeError

Returns the error description when NotDone.") Error;
		BRepLib_EdgeError Error ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Edge;
		 operator TopoDS_Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

Returns the first vertex of the edge. May be Null.") Vertex1;
		const TopoDS_Vertex & Vertex1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

Returns the second vertex of the edge. May be Null.") Vertex2;
		const TopoDS_Vertex & Vertex2 ();
};


%feature("shadow") BRepLib_MakeEdge::~BRepLib_MakeEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeEdge2d;
class BRepLib_MakeEdge2d : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Lin2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Lin2d & L);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Lin2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Lin2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Lin2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Circ2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Circ2d & L);
		%feature("autodoc", "Args:
	L(gp_Circ2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Circ2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Circ2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Circ2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Circ2d)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Circ2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Elips2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Elips2d & L);
		%feature("autodoc", "Args:
	L(gp_Elips2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Elips2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Elips2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Elips2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Elips2d)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Elips2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Hypr2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Hypr2d & L);
		%feature("autodoc", "Args:
	L(gp_Hypr2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Hypr2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Hypr2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Hypr2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Hypr2d)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Hypr2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Parab2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Parab2d & L);
		%feature("autodoc", "Args:
	L(gp_Parab2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Parab2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Parab2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Parab2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Parab2d)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Parab2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	None
Returns:
	BRepLib_EdgeError

Returns the error description when NotDone.") Error;
		BRepLib_EdgeError Error ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Edge;
		 operator TopoDS_Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

Returns the first vertex of the edge. May be Null.") Vertex1;
		const TopoDS_Vertex & Vertex1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

Returns the second vertex of the edge. May be Null.") Vertex2;
		const TopoDS_Vertex & Vertex2 ();
};


%feature("shadow") BRepLib_MakeEdge2d::~BRepLib_MakeEdge2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeEdge2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeFace;
class BRepLib_MakeFace : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Not done.") BRepLib_MakeFace;
		 BRepLib_MakeFace ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Load a face. Usefull to add wires.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	P(gp_Pln)

Returns:
	None

Make a face from a plane.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Pln & P);
		%feature("autodoc", "Args:
	C(gp_Cylinder)

Returns:
	None

Make a face from a cylinder.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cylinder & C);
		%feature("autodoc", "Args:
	C(gp_Cone)

Returns:
	None

Make a face from a cone.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cone & C);
		%feature("autodoc", "Args:
	S(gp_Sphere)

Returns:
	None

Make a face from a sphere.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Sphere & S);
		%feature("autodoc", "Args:
	C(gp_Torus)

Returns:
	None

Make a face from a torus.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Torus & C);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	TolDegen(Standard_Real)

Returns:
	None

Make a face from a Surface. Accepts tolerance value (TolDegen)  
         for resolution of degenerated edges.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const Handle_Geom_Surface & S,const Standard_Real TolDegen);
		%feature("autodoc", "Args:
	P(gp_Pln)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a face from a plane.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Pln & P,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	C(gp_Cylinder)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a face from a cylinder.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cylinder & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	C(gp_Cone)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a face from a cone.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cone & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a face from a sphere.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Sphere & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	C(gp_Torus)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a face from a torus.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Torus & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)
	TolDegen(Standard_Real)

Returns:
	None

Make a face from a Surface. Accepts min & max parameters  
         to construct the face's bounds. Also accepts tolerance value (TolDegen)  
         for resolution of degenerated edges.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real TolDegen);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	OnlyPlane(Standard_Boolean)=Standard_False

Returns:
	None

Find a surface from the wire and make a face.  
         if <OnlyPlane> is true, the computed surface will be  
         a plane. If it is not possible to find a plane, the  
         flag NotDone will be set.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const TopoDS_Wire & W,const Standard_Boolean OnlyPlane = Standard_False);
		%feature("autodoc", "Args:
	P(gp_Pln)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a plane and a wire.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Pln & P,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	C(gp_Cylinder)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a cylinder and a wire.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cylinder & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	C(gp_Cone)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a cone and a wire.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cone & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a sphere and a wire.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Sphere & S,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	C(gp_Torus)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a torus and a wire.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Torus & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a Surface and a wire.") BRepLib_MakeFace;
		 BRepLib_MakeFace (const Handle_Geom_Surface & S,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	W(TopoDS_Wire)

Returns:
	None

Adds the wire <W> in the face <F>") BRepLib_MakeFace;
		 BRepLib_MakeFace (const TopoDS_Face & F,const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Load the face.") Init;
		void Init (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	Bound(Standard_Boolean)
	TolDegen(Standard_Real)

Returns:
	None

Creates the face  from the  surface. If Bound is  
         True a wire is made from the natural bounds.  
         Accepts tolerance value (TolDegen) for resolution  
         of degenerated edges.") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Boolean Bound,const Standard_Real TolDegen);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)
	TolDegen(Standard_Real)

Returns:
	None

Creates the face from the surface and the min-max  
         values. Accepts tolerance value (TolDegen) for resolution  
         of degenerated edges.") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real TolDegen);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

Adds the wire <W> in the current face.") Add;
		void Add (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	None
Returns:
	BRepLib_FaceError

No detailed docstring for this function.") Error;
		BRepLib_FaceError Error ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns the new face.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Face;
		 operator TopoDS_Face ();
};


%feature("shadow") BRepLib_MakeFace::~BRepLib_MakeFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakePolygon;
class BRepLib_MakePolygon : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty MakePolygon.") BRepLib_MakePolygon;
		 BRepLib_MakePolygon ();
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)
	Close(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)
	P4(gp_Pnt)
	Close(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & P4,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	V3(TopoDS_Vertex)
	Close(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const TopoDS_Vertex & V3,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	V3(TopoDS_Vertex)
	V4(TopoDS_Vertex)
	Close(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const TopoDS_Vertex & V3,const TopoDS_Vertex & V4,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_Pnt & P);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  True if  the last   vertex  or point  was  
         succesfully added.") Added;
		Standard_Boolean Added ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Close;
		void Close ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") FirstVertex;
		const TopoDS_Vertex & FirstVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") LastVertex;
		const TopoDS_Vertex & LastVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the last edge added to the polygon.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Edge;
		 operator TopoDS_Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") Wire;
		const TopoDS_Wire & Wire ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Wire;
		 operator TopoDS_Wire ();
};


%feature("shadow") BRepLib_MakePolygon::~BRepLib_MakePolygon %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakePolygon {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeShell;
class BRepLib_MakeShell : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Not done.") BRepLib_MakeShell;
		 BRepLib_MakeShell ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	Segment(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeShell;
		 BRepLib_MakeShell (const Handle_Geom_Surface & S,const Standard_Boolean Segment = Standard_False);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)
	Segment(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeShell;
		 BRepLib_MakeShell (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Boolean Segment = Standard_False);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)
	Segment(Standard_Boolean)=Standard_False

Returns:
	None

Creates the shell from the surface  and the min-max  
         values.") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Boolean Segment = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	BRepLib_ShellError

No detailed docstring for this function.") Error;
		BRepLib_ShellError Error ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

Returns the new Shell.") Shell;
		const TopoDS_Shell & Shell ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Shell;
		 operator TopoDS_Shell ();
};


%feature("shadow") BRepLib_MakeShell::~BRepLib_MakeShell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeShell {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeSolid;
class BRepLib_MakeSolid : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Solid covers whole space.") BRepLib_MakeSolid;
		 BRepLib_MakeSolid ();
		%feature("autodoc", "Args:
	S(TopoDS_CompSolid)

Returns:
	None

Make a solid from a CompSolid.") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_CompSolid & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shell)

Returns:
	None

Make a solid from a shell.") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_Shell & S);
		%feature("autodoc", "Args:
	S1(TopoDS_Shell)
	S2(TopoDS_Shell)

Returns:
	None

Make a solid from two shells.") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_Shell & S1,const TopoDS_Shell & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shell)
	S2(TopoDS_Shell)
	S3(TopoDS_Shell)

Returns:
	None

Make a solid from three shells.") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_Shell & S1,const TopoDS_Shell & S2,const TopoDS_Shell & S3);
		%feature("autodoc", "Args:
	So(TopoDS_Solid)

Returns:
	None

Make a solid from a solid. Usefull for adding later.") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_Solid & So);
		%feature("autodoc", "Args:
	So(TopoDS_Solid)
	S(TopoDS_Shell)

Returns:
	None

Add a shell to a solid.") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_Solid & So,const TopoDS_Shell & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shell)

Returns:
	None

Add the shell to the current solid.") Add;
		void Add (const TopoDS_Shell & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Solid

Returns the new Solid.") Solid;
		const TopoDS_Solid & Solid ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Solid;
		 operator TopoDS_Solid ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	virtual BRepLib_ShapeModification

returns the status of the Face after  
         the shape creation.") FaceStatus;
		virtual BRepLib_ShapeModification FaceStatus (const TopoDS_Face & F);
};


%feature("shadow") BRepLib_MakeSolid::~BRepLib_MakeSolid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeSolid {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeVertex;
class BRepLib_MakeVertex : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepLib_MakeVertex;
		 BRepLib_MakeVertex (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		const TopoDS_Vertex & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Vertex;
		 operator TopoDS_Vertex ();
};


%feature("shadow") BRepLib_MakeVertex::~BRepLib_MakeVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeWire;
class BRepLib_MakeWire : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

NotDone MakeWire.") BRepLib_MakeWire;
		 BRepLib_MakeWire ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Make a Wire from an edge.") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)

Returns:
	None

Make a Wire from two edges.") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	E3(TopoDS_Edge)

Returns:
	None

Make a Wire from three edges.") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Edge & E3);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	E3(TopoDS_Edge)
	E4(TopoDS_Edge)

Returns:
	None

Make a Wire from four edges.") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Edge & E3,const TopoDS_Edge & E4);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

Make a Wire from a Wire. Usefull for adding later.") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	E(TopoDS_Edge)

Returns:
	None

Add an edge to a wire.") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Wire & W,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Add the edge <E> to the current wire.") Add;
		void Add (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

Add the edges of <W> to the current wire.") Add;
		void Add (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	L(TopTools_ListOfShape)

Returns:
	None

Add the edges of <L> to the current wire.  
         The edges are not to be consecutive.  But they are  
         to be all connected geometrically or topologically.") Add;
		void Add (const TopTools_ListOfShape & L);
		%feature("autodoc", "Args:
	None
Returns:
	BRepLib_WireError

No detailed docstring for this function.") Error;
		BRepLib_WireError Error ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Returns the new wire.") Wire;
		const TopoDS_Wire & Wire ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Wire;
		 operator TopoDS_Wire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the last edge added to the wire.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

Returns the last connecting vertex.") Vertex;
		const TopoDS_Vertex & Vertex ();
};


%feature("shadow") BRepLib_MakeWire::~BRepLib_MakeWire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeWire {
	void _kill_pointed() {
		delete $self;
	}
};
