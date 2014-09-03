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
%module (package="OCC") ShapeBuild

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

%include ShapeBuild_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(shapebuild) ShapeBuild;
%nodefaultctor ShapeBuild;
class ShapeBuild {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Geom_Plane

Rebuilds a shape with substitution of some components  Returns a Geom_Surface which is the Plane XOY (Z positive)  
         This allows to consider an UV space homologous to a 3D space,  
         with this support surface") PlaneXOY;
		static Handle_Geom_Plane PlaneXOY ();
};


%feature("shadow") ShapeBuild::~ShapeBuild %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeBuild {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeBuild_Edge;
class ShapeBuild_Edge {
	public:
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	TopoDS_Edge

Copy edge and replace one or both its vertices to a given  
         one(s). Vertex V1 replaces FORWARD vertex, and V2 - REVERSED,  
         as they are found by TopoDS_Iterator.  
         If V1 or V2 is NULL, the original vertex is taken") CopyReplaceVertices;
		TopoDS_Edge CopyReplaceVertices (const TopoDS_Edge & edge,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	toedge(TopoDS_Edge)
	fromedge(TopoDS_Edge)
	alpha(Standard_Real)=0
	beta(Standard_Real)=1

Returns:
	None

Copies ranges for curve3d and all common pcurves from  
         edge <fromedge> into edge <toedge>.") CopyRanges;
		void CopyRanges (const TopoDS_Edge & toedge,const TopoDS_Edge & fromedge,const Standard_Real alpha = 0,const Standard_Real beta = 1);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	first(Standard_Real)
	last(Standard_Real)

Returns:
	None

Sets range on 3d curve only.") SetRange3d;
		void SetRange3d (const TopoDS_Edge & edge,const Standard_Real first,const Standard_Real last);
		%feature("autodoc", "Args:
	toedge(TopoDS_Edge)
	fromedge(TopoDS_Edge)

Returns:
	None

Makes a copy of pcurves from edge <fromedge> into edge  
         <toedge>. Pcurves which are already present in <toedge>,  
         are replaced by copies, other are copied. Ranges are also  
         copied.") CopyPCurves;
		void CopyPCurves (const TopoDS_Edge & toedge,const TopoDS_Edge & fromedge);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	sharepcurves(Standard_Boolean)=Standard_True

Returns:
	TopoDS_Edge

Make a copy of <edge> by call to CopyReplaceVertices()  
         (i.e. construct new TEdge with the same pcurves and vertices).  
         If <sharepcurves> is False, pcurves are also replaced by  
         their copies with help of method CopyPCurves") Copy;
		TopoDS_Edge Copy (const TopoDS_Edge & edge,const Standard_Boolean sharepcurves = Standard_True);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)

Returns:
	None

Removes the PCurve(s) which could be recorded in an Edge for  
          the given Face") RemovePCurve;
		void RemovePCurve (const TopoDS_Edge & edge,const TopoDS_Face & face);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surf(Handle_Geom_Surface)

Returns:
	None

Removes the PCurve(s) which could be recorded in an Edge for  
          the given Surface") RemovePCurve;
		void RemovePCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surf);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surf(Handle_Geom_Surface)
	loc(TopLoc_Location)

Returns:
	None

Removes the PCurve(s) which could be recorded in an Edge for  
          the given Surface, with given Location") RemovePCurve;
		void RemovePCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surf,const TopLoc_Location & loc);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	pcurve(Handle_Geom2d_Curve)
	face(TopoDS_Face)

Returns:
	None

Replace the PCurve in an Edge for the given Face  
          In case if edge is seam, i.e. has 2 pcurves on that face,  
          only pcurve corresponding to the orientation of the edge is  
          replaced") ReplacePCurve;
		void ReplacePCurve (const TopoDS_Edge & edge,const Handle_Geom2d_Curve & pcurve,const TopoDS_Face & face);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	old(TopoDS_Face)
	sub(TopoDS_Face)

Returns:
	Standard_Boolean

Reassign edge pcurve lying on face <old> to another face <sub>.  
         If edge has two pcurves on <old> face, only one of them will be  
         reassigned, and other will left alone. Similarly, if edge already  
         had a pcurve on face <sub>, it will have two pcurves on it.  
         Returns True if succeeded, False if no pcurve lying on <old> found.") ReassignPCurve;
		Standard_Boolean ReassignPCurve (const TopoDS_Edge & edge,const TopoDS_Face & old,const TopoDS_Face & sub);
		%feature("autodoc", "Args:
	pcurve(Handle_Geom2d_Curve)
	trans(gp_Trsf2d)
	uFact(Standard_Real)
	aFirst(Standard_Real)
	aLast(Standard_Real)

Returns:
	Handle_Geom2d_Curve

Transforms the PCurve with given matrix and affinity U factor.") TransformPCurve;
		Handle_Geom2d_Curve TransformPCurve (const Handle_Geom2d_Curve & pcurve,const gp_Trsf2d & trans,const Standard_Real uFact,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)

Returns:
	None

Removes the Curve3D recorded in an Edge") RemoveCurve3d;
		void RemoveCurve3d (const TopoDS_Edge & edge);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)

Returns:
	Standard_Boolean

Calls BRepTools::BuildCurve3D") BuildCurve3d;
		Standard_Boolean BuildCurve3d (const TopoDS_Edge & edge);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	curve(Handle_Geom_Curve)
	L(TopLoc_Location)

Returns:
	None

Makes edge with curve and location") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const Handle_Geom_Curve & curve,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	curve(Handle_Geom_Curve)
	L(TopLoc_Location)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

Makes edge with curve, location and range [p1, p2]") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const Handle_Geom_Curve & curve,const TopLoc_Location & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	pcurve(Handle_Geom2d_Curve)
	face(TopoDS_Face)

Returns:
	None

Makes edge with pcurve and face") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const Handle_Geom2d_Curve & pcurve,const TopoDS_Face & face);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	pcurve(Handle_Geom2d_Curve)
	face(TopoDS_Face)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

Makes edge with pcurve, face and range [p1, p2]") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const Handle_Geom2d_Curve & pcurve,const TopoDS_Face & face,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	pcurve(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	None

Makes edge with pcurve, surface and location") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const Handle_Geom2d_Curve & pcurve,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	pcurve(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

Makes edge with pcurve, surface, location and range [p1, p2]") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const Handle_Geom2d_Curve & pcurve,const Handle_Geom_Surface & S,const TopLoc_Location & L,const Standard_Real p1,const Standard_Real p2);
};


%feature("shadow") ShapeBuild_Edge::~ShapeBuild_Edge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeBuild_Edge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeBuild_ReShape;
class ShapeBuild_ReShape : public BRepTools_ReShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns an empty Reshape") ShapeBuild_ReShape;
		 ShapeBuild_ReShape ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	until(TopAbs_ShapeEnum)
	buildmode(Standard_Integer)

Returns:
	virtual TopoDS_Shape

Applies the substitutions requests to a shape  
 
         <until> gives the level of type until which requests are taken  
         into account. For subshapes of the type <until> no rebuild  
         and futher exploring are done.  
         ACTUALLY, NOT IMPLEMENTED BELOW  TopAbs_FACE  
 
         <buildmode> says how to do on a SOLID,SHELL ... if one of its  
         sub-shapes has been changed:  
         0: at least one Replace or Remove -> COMPOUND, else as such  
         1: at least one Remove (Replace are ignored) -> COMPOUND  
         2: Replace and Remove are both ignored  
         If Replace/Remove are ignored or absent, the result as same  
         type as the starting shape") Apply;
		virtual TopoDS_Shape Apply (const TopoDS_Shape & shape,const TopAbs_ShapeEnum until,const Standard_Integer buildmode);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	until(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	virtual TopoDS_Shape

Applies the substitutions requests to a shape.  
 
         <until> gives the level of type until which requests are taken  
         into account. For subshapes of the type <until> no rebuild  
         and futher exploring are done.  
 
         NOTE: each subshape can be replaced by shape of the same type  
         or by shape containing only shapes of that type (for  
         example, TopoDS_Edge can be replaced by TopoDS_Edge,  
         TopoDS_Wire or TopoDS_Compound containing TopoDS_Edges).  
         If incompatible shape type is encountered, it is ignored  
         and flag FAIL1 is set in Status.") Apply;
		virtual TopoDS_Shape Apply (const TopoDS_Shape & shape,const TopAbs_ShapeEnum until = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	newsh(TopoDS_Shape)
	last(Standard_Boolean)=Standard_False

Returns:
	virtual Standard_Integer

Returns a complete substitution status for a shape  
         0  : not recorded,   <newsh> = original <shape>  
         < 0: to be removed,  <newsh> is NULL  
         > 0: to be replaced, <newsh> is a new item  
         If <last> is False, returns status and new shape recorded in  
         the map directly for the shape, if True and status > 0 then  
         recursively searches for the last status and new shape.") Status;
		virtual Standard_Integer Status (const TopoDS_Shape & shape,TopoDS_Shape & newsh,const Standard_Boolean last = Standard_False);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Queries the status of last call to Apply(shape,enum)  
         OK   : no (sub)shapes replaced or removed  
         DONE1: source (starting) shape replaced  
         DONE2: source (starting) shape removed  
         DONE3: some subshapes replaced  
         DONE4: some subshapes removed  
         FAIL1: some replacements not done because of bad type of subshape") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
};


%feature("shadow") ShapeBuild_ReShape::~ShapeBuild_ReShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeBuild_ReShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeBuild_ReShape {
	Handle_ShapeBuild_ReShape GetHandle() {
	return *(Handle_ShapeBuild_ReShape*) &$self;
	}
};

%nodefaultctor Handle_ShapeBuild_ReShape;
class Handle_ShapeBuild_ReShape : public Handle_BRepTools_ReShape {

    public:
        // constructors
        Handle_ShapeBuild_ReShape();
        Handle_ShapeBuild_ReShape(const Handle_ShapeBuild_ReShape &aHandle);
        Handle_ShapeBuild_ReShape(const ShapeBuild_ReShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeBuild_ReShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeBuild_ReShape {
    ShapeBuild_ReShape* GetObject() {
    return (ShapeBuild_ReShape*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeBuild_ReShape::~Handle_ShapeBuild_ReShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeBuild_ReShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeBuild_Vertex;
class ShapeBuild_Vertex {
	public:
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	tolFactor(Standard_Real)=1.0001

Returns:
	TopoDS_Vertex

Combines new vertex from two others. This new one is the  
         smallest vertex which comprises both of the source vertices.  
         The function takes into account the positions and tolerances  
         of the source vertices.  
         The tolerance of the new vertex will be equal to the minimal  
         tolerance that is required to comprise source vertices  
         multiplied by tolFactor (in order to avoid errors because  
         of discreteness of calculations).") CombineVertex;
		TopoDS_Vertex CombineVertex (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real tolFactor = 1.0001);
		%feature("autodoc", "Args:
	pnt1(gp_Pnt)
	pnt2(gp_Pnt)
	tol1(Standard_Real)
	tol2(Standard_Real)
	tolFactor(Standard_Real)=1.0001

Returns:
	TopoDS_Vertex

The same function as above, except that it accepts two points  
         and two tolerances instead of vertices") CombineVertex;
		TopoDS_Vertex CombineVertex (const gp_Pnt & pnt1,const gp_Pnt & pnt2,const Standard_Real tol1,const Standard_Real tol2,const Standard_Real tolFactor = 1.0001);
};


%feature("shadow") ShapeBuild_Vertex::~ShapeBuild_Vertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeBuild_Vertex {
	void _kill_pointed() {
		delete $self;
	}
};
