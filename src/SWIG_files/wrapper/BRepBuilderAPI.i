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
%module (package="OCC") BRepBuilderAPI

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

%include BRepBuilderAPI_headers.i

/* typedefs */
typedef NCollection_CellFilter <BRepBuilderAPI_VertexInspector> BRepBuilderAPI_CellFilter;
typedef NCollection_Vector <gp_XYZ> VectorOfPoint;
typedef NCollection_UBTree <Standard_Integer , Bnd_Box> BRepBuilderAPI_BndBoxTree;
/* end typedefs declaration */

/* public enums */
enum BRepBuilderAPI_EdgeError {
	BRepBuilderAPI_EdgeDone = 0,
	BRepBuilderAPI_PointProjectionFailed = 1,
	BRepBuilderAPI_ParameterOutOfRange = 2,
	BRepBuilderAPI_DifferentPointsOnClosedCurve = 3,
	BRepBuilderAPI_PointWithInfiniteParameter = 4,
	BRepBuilderAPI_DifferentsPointAndParameter = 5,
	BRepBuilderAPI_LineThroughIdenticPoints = 6,
};

enum BRepBuilderAPI_FaceError {
	BRepBuilderAPI_FaceDone = 0,
	BRepBuilderAPI_NoFace = 1,
	BRepBuilderAPI_NotPlanar = 2,
	BRepBuilderAPI_CurveProjectionFailed = 3,
	BRepBuilderAPI_ParametersOutOfRange = 4,
};

enum BRepBuilderAPI_PipeError {
	BRepBuilderAPI_PipeDone = 0,
	BRepBuilderAPI_PipeNotDone = 1,
	BRepBuilderAPI_PlaneNotIntersectGuide = 2,
	BRepBuilderAPI_ImpossibleContact = 3,
};

enum BRepBuilderAPI_ShapeModification {
	BRepBuilderAPI_Preserved = 0,
	BRepBuilderAPI_Deleted = 1,
	BRepBuilderAPI_Trimmed = 2,
	BRepBuilderAPI_Merged = 3,
	BRepBuilderAPI_BoundaryModified = 4,
};

enum BRepBuilderAPI_ShellError {
	BRepBuilderAPI_ShellDone = 0,
	BRepBuilderAPI_EmptyShell = 1,
	BRepBuilderAPI_DisconnectedShell = 2,
	BRepBuilderAPI_ShellParametersOutOfRange = 3,
};

enum BRepBuilderAPI_TransitionMode {
	BRepBuilderAPI_Transformed = 0,
	BRepBuilderAPI_RightCorner = 1,
	BRepBuilderAPI_RoundCorner = 2,
};

enum BRepBuilderAPI_WireError {
	BRepBuilderAPI_WireDone = 0,
	BRepBuilderAPI_EmptyWire = 1,
	BRepBuilderAPI_DisconnectedWire = 2,
	BRepBuilderAPI_NonManifoldWire = 3,
};

/* end public enums declaration */

%rename(brepbuilderapi) BRepBuilderAPI;
%nodefaultctor BRepBuilderAPI;
class BRepBuilderAPI {
	public:
		%feature("autodoc", "Args:
	P(Handle_Geom_Plane)

Returns:
	static void

Sets    the current plane.") Plane;
		static void Plane (const Handle_Geom_Plane & P);
		%feature("autodoc", "Args:
	None
Returns:
	static  Handle_Geom_Plane

Returns the current plane.") Plane;
		static const Handle_Geom_Plane & Plane ();
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
};


%feature("shadow") BRepBuilderAPI::~BRepBuilderAPI %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_Collect;
class BRepBuilderAPI_Collect {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_Collect;
		 BRepBuilderAPI_Collect ();
		%feature("autodoc", "Args:
	SI(TopoDS_Shape)
	MKS(BRepBuilderAPI_MakeShape)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Shape & SI,BRepBuilderAPI_MakeShape & MKS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Gen(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddGenerated;
		void AddGenerated (const TopoDS_Shape & S,const TopoDS_Shape & Gen);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Mod(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddModif;
		void AddModif (const TopoDS_Shape & S,const TopoDS_Shape & Mod);
		%feature("autodoc", "Args:
	SF(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Filter;
		void Filter (const TopoDS_Shape & SF);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeListOfShape

No detailed docstring for this function.") Modification;
		const TopTools_DataMapOfShapeListOfShape & Modification ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeListOfShape

No detailed docstring for this function.") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated ();
};


%feature("shadow") BRepBuilderAPI_Collect::~BRepBuilderAPI_Collect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_Collect {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_Command;
class BRepBuilderAPI_Command {
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
	virtual Standard_Boolean

No detailed docstring for this function.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Raises NotDone if done is false.") Check;
		void Check ();
};


%feature("shadow") BRepBuilderAPI_Command::~BRepBuilderAPI_Command %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_Command {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_FindPlane;
class BRepBuilderAPI_FindPlane {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes an empty algorithm. The function Init is then used to define the shape.") BRepBuilderAPI_FindPlane;
		 BRepBuilderAPI_FindPlane ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Tol(Standard_Real)=- 1

Returns:
	None

Constructs the plane containing the edges of the shape S.  
A plane is built only if all the edges are within a distance  
of less than or equal to tolerance from a planar surface.  
This tolerance value is equal to the larger of the following two values:  
-   Tol, where the default value is negative, or  
-   the largest of the tolerance values assigned to the individual edges of S.  
  Use the function Found to verify that a plane is built.  
The resulting plane is then retrieved using the function Plane.") BRepBuilderAPI_FindPlane;
		 BRepBuilderAPI_FindPlane (const TopoDS_Shape & S,const Standard_Real Tol = - 1);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Tol(Standard_Real)=- 1

Returns:
	None

Constructs the plane containing the edges of the shape S.  
A plane is built only if all the edges are within a distance  
of less than or equal to tolerance from a planar surface.  
This tolerance value is equal to the larger of the following two values:  
-   Tol, where the default value is negative, or  
-   the largest of the tolerance values assigned to the individual edges of S.  
  Use the function Found to verify that a plane is built.  
The resulting plane is then retrieved using the function Plane.") Init;
		void Init (const TopoDS_Shape & S,const Standard_Real Tol = - 1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if a plane containing the edges of the  
shape is found and built. Use the function Plane to consult the result.") Found;
		Standard_Boolean Found ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Plane

Returns the plane containing the edges of the shape.  
Warning  
Use the function Found to verify that the plane is built. If  
a plane is not found, Plane returns a null handle.") Plane;
		Handle_Geom_Plane Plane ();
};


%feature("shadow") BRepBuilderAPI_FindPlane::~BRepBuilderAPI_FindPlane %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_FindPlane {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_Sewing;
class BRepBuilderAPI_Sewing : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	tolerance(Standard_Real)=1.0e-06
	option1(Standard_Boolean)=Standard_True
	option2(Standard_Boolean)=Standard_True
	option3(Standard_Boolean)=Standard_True
	option4(Standard_Boolean)=Standard_False

Returns:
	None

Creates an object with  
         tolerance of connexity  
         option for sewing (if false only control)  
         option for analysis of degenerated shapes  
         option for cutting of free edges.  
         option for non manifold processing") BRepBuilderAPI_Sewing;
		 BRepBuilderAPI_Sewing (const Standard_Real tolerance = 1.0e-06,const Standard_Boolean option1 = Standard_True,const Standard_Boolean option2 = Standard_True,const Standard_Boolean option3 = Standard_True,const Standard_Boolean option4 = Standard_False);
		%feature("autodoc", "Args:
	tolerance(Standard_Real)=1.0e-06
	option1(Standard_Boolean)=Standard_True
	option2(Standard_Boolean)=Standard_True
	option3(Standard_Boolean)=Standard_True
	option4(Standard_Boolean)=Standard_False

Returns:
	None

initialize the parameters if necessary") Init;
		void Init (const Standard_Real tolerance = 1.0e-06,const Standard_Boolean option1 = Standard_True,const Standard_Boolean option2 = Standard_True,const Standard_Boolean option3 = Standard_True,const Standard_Boolean option4 = Standard_False);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	None

Loades the context shape.") Load;
		void Load (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	None

Defines the shapes to be sewed or controlled") Add;
		void Add (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	thePI(Handle_Message_ProgressIndicator)=0

Returns:
	None

Computing  
         thePI - progress indicator of algorithm") Perform;
		void Perform (const Handle_Message_ProgressIndicator & thePI = 0);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Gives the sewed shape  
         a null shape if nothing constructed  
         may be a face, a shell, a solid or a compound") SewedShape;
		const TopoDS_Shape & SewedShape ();
		%feature("autodoc", "Args:
	theContext(Handle_BRepTools_ReShape)

Returns:
	None

set context") SetContext;
		void SetContext (const Handle_BRepTools_ReShape & theContext);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepTools_ReShape

return context") GetContext;
		const Handle_BRepTools_ReShape & GetContext ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of free edges (edge shared by one face)") NbFreeEdges;
		Standard_Integer NbFreeEdges ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	TopoDS_Edge

Gives each free edge") FreeEdge;
		const TopoDS_Edge & FreeEdge (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of multiple edges  
         (edge shared by more than two faces)") NbMultipleEdges;
		Standard_Integer NbMultipleEdges ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	TopoDS_Edge

Gives each multiple edge") MultipleEdge;
		const TopoDS_Edge & MultipleEdge (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of contigous edges (edge shared by two faces)") NbContigousEdges;
		Standard_Integer NbContigousEdges ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	TopoDS_Edge

Gives each contigous edge") ContigousEdge;
		const TopoDS_Edge & ContigousEdge (const Standard_Integer index);
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	TopTools_ListOfShape

Gives the sections (edge) belonging to a contigous edge") ContigousEdgeCouple;
		const TopTools_ListOfShape & ContigousEdgeCouple (const Standard_Integer index);
		%feature("autodoc", "Args:
	section(TopoDS_Edge)

Returns:
	Standard_Boolean

Indicates if a section is bound (before use SectionToBoundary)") IsSectionBound;
		Standard_Boolean IsSectionBound (const TopoDS_Edge & section);
		%feature("autodoc", "Args:
	section(TopoDS_Edge)

Returns:
	TopoDS_Edge

Gives the original edge (free boundary) which becomes the  
         the section. Remember that sections constitute  common edges.  
         This imformation is important for control because with  
         original edge we can find the surface to which the section  
         is attached.") SectionToBoundary;
		const TopoDS_Edge & SectionToBoundary (const TopoDS_Edge & section);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of degenerated shapes") NbDegeneratedShapes;
		Standard_Integer NbDegeneratedShapes ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	TopoDS_Shape

Gives each degenerated shape") DegeneratedShape;
		const TopoDS_Shape & DegeneratedShape (const Standard_Integer index);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	Standard_Boolean

Indicates if a input shape is degenerated") IsDegenerated;
		Standard_Boolean IsDegenerated (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	Standard_Boolean

Indicates if a input shape has been modified") IsModified;
		Standard_Boolean IsModified (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	TopoDS_Shape

Gives a modifieded shape") Modified;
		const TopoDS_Shape & Modified (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	Standard_Boolean

Indicates if a input subshape has been modified") IsModifiedSubShape;
		Standard_Boolean IsModifiedSubShape (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	TopoDS_Shape

Gives a modifieded subshape") ModifiedSubShape;
		TopoDS_Shape ModifiedSubShape (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	None
Returns:
	None

print the informations") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of deleted faces (faces smallest than tolerance)") NbDeletedFaces;
		Standard_Integer NbDeletedFaces ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	TopoDS_Face

Gives each deleted face") DeletedFace;
		const TopoDS_Face & DeletedFace (const Standard_Integer index);
		%feature("autodoc", "Args:
	theEdg(TopoDS_Edge)
	index(Standard_Integer)=1

Returns:
	TopoDS_Face

Gives a modified shape") WhichFace;
		TopoDS_Face WhichFace (const TopoDS_Edge & theEdg,const Standard_Integer index = 1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Gets same parameter mode.") SameParameterMode;
		Standard_Boolean SameParameterMode ();
		%feature("autodoc", "Args:
	SameParameterMode(Standard_Boolean)

Returns:
	None

Sets same parameter mode.") SetSameParameterMode;
		void SetSameParameterMode (const Standard_Boolean SameParameterMode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Gives set tolerance.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	theToler(Standard_Real)

Returns:
	None

Sets tolerance") SetTolerance;
		void SetTolerance (const Standard_Real theToler);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Gives set min tolerance.") MinTolerance;
		Standard_Real MinTolerance ();
		%feature("autodoc", "Args:
	theMinToler(Standard_Real)

Returns:
	None

Sets min tolerance") SetMinTolerance;
		void SetMinTolerance (const Standard_Real theMinToler);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Gives set max tolerance") MaxTolerance;
		Standard_Real MaxTolerance ();
		%feature("autodoc", "Args:
	theMaxToler(Standard_Real)

Returns:
	None

Sets max tolerance.") SetMaxTolerance;
		void SetMaxTolerance (const Standard_Real theMaxToler);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns mode for sewing faces By default - true.") FaceMode;
		Standard_Boolean FaceMode ();
		%feature("autodoc", "Args:
	theFaceMode(Standard_Boolean)

Returns:
	None

Sets mode for sewing faces By default - true.") SetFaceMode;
		void SetFaceMode (const Standard_Boolean theFaceMode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns mode for sewing floating edges By default - false.") FloatingEdgesMode;
		Standard_Boolean FloatingEdgesMode ();
		%feature("autodoc", "Args:
	theFloatingEdgesMode(Standard_Boolean)

Returns:
	None

Sets mode for sewing floating edges By default - false.  Returns mode for cutting floating edges By default - false.  Sets mode for cutting floating edges By default - false.") SetFloatingEdgesMode;
		void SetFloatingEdgesMode (const Standard_Boolean theFloatingEdgesMode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns mode for accounting of local tolerances  
         of edges and vertices during of merging.") LocalTolerancesMode;
		Standard_Boolean LocalTolerancesMode ();
		%feature("autodoc", "Args:
	theLocalTolerancesMode(Standard_Boolean)

Returns:
	None

Sets mode for accounting of local tolerances  
         of edges and vertices during of merging  
         in this case WorkTolerance = myTolerance + tolEdge1+ tolEdg2;") SetLocalTolerancesMode;
		void SetLocalTolerancesMode (const Standard_Boolean theLocalTolerancesMode);
		%feature("autodoc", "Args:
	theNonManifoldMode(Standard_Boolean)

Returns:
	None

Sets mode for non-manifold sewing.") SetNonManifoldMode;
		void SetNonManifoldMode (const Standard_Boolean theNonManifoldMode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Gets mode for non-manifold sewing.  
 
INTERNAL FUCTIONS ---") NonManifoldMode;
		Standard_Boolean NonManifoldMode ();
};


%feature("shadow") BRepBuilderAPI_Sewing::~BRepBuilderAPI_Sewing %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_Sewing {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepBuilderAPI_Sewing {
	Handle_BRepBuilderAPI_Sewing GetHandle() {
	return *(Handle_BRepBuilderAPI_Sewing*) &$self;
	}
};

%nodefaultctor Handle_BRepBuilderAPI_Sewing;
class Handle_BRepBuilderAPI_Sewing : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepBuilderAPI_Sewing();
        Handle_BRepBuilderAPI_Sewing(const Handle_BRepBuilderAPI_Sewing &aHandle);
        Handle_BRepBuilderAPI_Sewing(const BRepBuilderAPI_Sewing *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepBuilderAPI_Sewing DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepBuilderAPI_Sewing {
    BRepBuilderAPI_Sewing* GetObject() {
    return (BRepBuilderAPI_Sewing*)$self->Access();
    }
};
%feature("shadow") Handle_BRepBuilderAPI_Sewing::~Handle_BRepBuilderAPI_Sewing %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepBuilderAPI_Sewing {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepBuilderAPI_VertexInspector;
class BRepBuilderAPI_VertexInspector : public NCollection_CellFilter_InspectorXYZ {
	public:
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

Constructor; remembers the tolerance") BRepBuilderAPI_VertexInspector;
		 BRepBuilderAPI_VertexInspector (const Standard_Real theTol);
		%feature("autodoc", "Args:
	thePnt(gp_XYZ)

Returns:
	None

Keep the points used for comparison") Add;
		void Add (const gp_XYZ & thePnt);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear the list of adjacent points") ClearResList;
		void ClearResList ();
		%feature("autodoc", "Args:
	theCurPnt(gp_XYZ)

Returns:
	None

Set current point to search for coincidence") SetCurrent;
		void SetCurrent (const gp_XYZ & theCurPnt);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

Get list of indexes of points adjacent with the current") ResInd;
		const TColStd_ListOfInteger & ResInd ();
		%feature("autodoc", "Args:
	theTarget(Standard_Integer)

Returns:
	NCollection_CellFilter_Action

Implementation of inspection method") Inspect;
		NCollection_CellFilter_Action Inspect (const Standard_Integer theTarget);
};


%feature("shadow") BRepBuilderAPI_VertexInspector::~BRepBuilderAPI_VertexInspector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_VertexInspector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_BndBoxTreeSelector;
class BRepBuilderAPI_BndBoxTreeSelector : public BRepBuilderAPI_BndBoxTree::Selector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructor; calls the base class constructor") BRepBuilderAPI_BndBoxTreeSelector;
		 BRepBuilderAPI_BndBoxTreeSelector ();
		%feature("autodoc", "Args:
	theBox(Bnd_Box)

Returns:
	Standard_Boolean

Implementation of rejection method
@return
  True if the bounding box does not intersect with the current") Reject;
		Standard_Boolean Reject (const Bnd_Box & theBox);
		%feature("autodoc", "Args:
	theObj(Standard_Integer)

Returns:
	Standard_Boolean

Implementation of acceptance method
  This method is called when the bounding box intersect with the current.
  It stores the object - the index of box in the list of accepted objects.
@return
  True, because the object is accepted") Accept;
		Standard_Boolean Accept (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear the list of intersecting boxes") ClearResList;
		void ClearResList ();
		%feature("autodoc", "Args:
	theBox(Bnd_Box)

Returns:
	None

Set current box to search for overlapping with him") SetCurrent;
		void SetCurrent (const Bnd_Box & theBox);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

Get list of indexes of boxes intersecting with the current box") ResInd;
		const TColStd_ListOfInteger & ResInd ();
};


%feature("shadow") BRepBuilderAPI_BndBoxTreeSelector::~BRepBuilderAPI_BndBoxTreeSelector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_BndBoxTreeSelector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_MakeShape;
class BRepBuilderAPI_MakeShape : public BRepBuilderAPI_Command {
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
	virtual void

This is  called by  Shape().  It does  nothing but  
         may be redefined.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns a shape built by the shape construction algorithm.  
Raises exception StdFail_NotDone if the shape was not built.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Shape;
		 operator TopoDS_Shape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the  list   of shapes generated   from the  
         shape <S>.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes modified from the shape  
         <S>.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

Returns true if the shape S has been deleted.") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);
};


%feature("shadow") BRepBuilderAPI_MakeShape::~BRepBuilderAPI_MakeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_MakeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_MakeEdge;
class BRepBuilderAPI_MakeEdge : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge ();
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Lin & L);
		%feature("autodoc", "Args:
	L(gp_Lin)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Lin & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Lin)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Lin & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Lin)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Lin & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Circ)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Circ & L);
		%feature("autodoc", "Args:
	L(gp_Circ)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Circ & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Circ)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Circ & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Circ)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Circ & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Elips)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Elips & L);
		%feature("autodoc", "Args:
	L(gp_Elips)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Elips & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Elips)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Elips & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Elips)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Elips & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Hypr)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Hypr & L);
		%feature("autodoc", "Args:
	L(gp_Hypr)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Hypr & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Hypr)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Hypr & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Hypr)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Hypr & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Parab)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Parab & L);
		%feature("autodoc", "Args:
	L(gp_Parab)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Parab & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Parab)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Parab & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(gp_Parab)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Parab & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)
	P1(gp_Pnt)
	P2(gp_Pnt)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	P1(gp_Pnt)
	P2(gp_Pnt)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

The general method to directly create an edge is to give  
-      a 3D curve C as the support (geometric domain) of the edge,  
-      two vertices V1 and V2 to limit the curve (definition of the restriction of  
   the edge), and  
-      two real values p1 and p2 which are the parameters for the vertices V1 and V2  
   on the curve.  
The curve may be defined as a 2d curve in the parametric space of a surface: a  
pcurve. The surface on which the edge is built is then kept at the level of the edge.  
The default tolerance will be associated with this edge.  
Rules applied to the arguments:  
For the curve:  
-      The curve must not be a 'null handle'.  
-      If the curve is a trimmed curve the basis curve is used.  
For the vertices:  
-      Vertices may be null shapes. When V1 or V2 is null the edge is open in the  
   corresponding direction and the parameter value p1 or p2 must be infinite  
   (remember that Precision::Infinite() defines an infinite value).  
-      The two vertices must be identical if they have the same 3D location.  
   Identical vertices are used in particular when the curve is closed.  
For the parameters:  
-      The parameters must be in the parametric range of the curve (or the basis  
   curve if the curve is trimmed). If this condition is not satisfied the edge is not  
   built, and the Error function will return BRepAPI_ParameterOutOfRange.  
-      Parameter values must not be equal. If this condition is not satisfied (i.e.  
   if | p1 - p2 | ) the edge is not built, and the Error function will return  
   BRepAPI_LineThroughIdenticPoints.  
Parameter values are expected to be given in increasing order:  
     C->FirstParameter()  
- If the parameter values are given in decreasing order the vertices are switched,  
i.e. the 'first vertex' is on the point of parameter p2 and the 'second vertex' is  
on the point of parameter p1. In such a case, to keep the original intent of the  
construction, the edge will be oriented 'reversed'.  
- On a periodic curve the parameter values p1 and p2 are adjusted by adding or  
subtracting the period to obtain p1 in the parametric range of the curve, and p2]  
such that [ p1 , where Period is the period of the curve.  
- A parameter value may be infinite. The edge is open in the corresponding  
direction. However the corresponding vertex must be a null shape. If this condition  
is not satisfied the edge is not built, and the Error function will return  
BRepAPI_PointWithInfiniteParameter.  
- The distance between the vertex and the point evaluated on the curve with the  
parameter, must be lower than the precision of the vertex. If this condition is not  
satisfied the edge is not built, and the Error function will return  
BRepAPI_DifferentsPointAndParameter.  
 Other edge constructions  
- The parameter values can be omitted, they will be computed by projecting the  
vertices on the curve. Note that projection is the only way to evaluate the  
parameter values of the vertices on the curve: vertices must be given on the curve,  
i.e. the distance from a vertex to the curve must be less than or equal to the  
precision of the vertex. If this condition is not satisfied the edge is not built,  
and the Error function will return BRepAPI_PointProjectionFailed.  
-      3D points can be given in place of vertices. Vertices will be created from the  
   points (with the default topological precision Precision::Confusion()).  
Note:  
-      Giving vertices is useful when creating a connected edge.  
-      If the parameter values correspond to the extremities of a closed curve,  
   points must be identical, or at least coincident. If this condition is not  
   satisfied the edge is not built, and the Error function will return  
  BRepAPI_DifferentPointsOnClosedCurve.  
-      The vertices or points can be omitted if the parameter values are given. The  
   points will be computed from the parameters on the curve.  
The vertices or points and the parameter values can be omitted. The first and last  
  parameters of the curve will then be used.  
 
 Auxiliary methods") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
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

Defines or redefines the arguments for the construction of an edge.  
This function is currently used after the empty constructor BRepAPI_MakeEdge().") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if the edge is built.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBuilderAPI_EdgeError

Returns the construction status  
-   BRepBuilderAPI_EdgeDone if the edge is built, or  
-   another value of the BRepBuilderAPI_EdgeError  
  enumeration indicating the reason of construction failure.") Error;
		BRepBuilderAPI_EdgeError Error ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the constructed edge.  
Exceptions StdFail_NotDone if the edge is not built.") Edge;
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

Returns the second vertex of the edge. May be Null.  
 
Warning  
The returned vertex in each function corresponds respectively to  
-   the lowest, or  
-   the highest parameter on the curve along which the edge is built.  
 It does not correspond to the first or second vertex  
given at the time of the construction, if the edge is oriented reversed.  
Exceptions  
StdFail_NotDone if the edge is not built.") Vertex2;
		const TopoDS_Vertex & Vertex2 ();
};


%feature("shadow") BRepBuilderAPI_MakeEdge::~BRepBuilderAPI_MakeEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_MakeEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_MakeEdge2d;
class BRepBuilderAPI_MakeEdge2d : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Lin2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Lin2d & L);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Lin2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Lin2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Lin2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Circ2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Circ2d & L);
		%feature("autodoc", "Args:
	L(gp_Circ2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Circ2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Circ2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Circ2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Circ2d)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Circ2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Elips2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Elips2d & L);
		%feature("autodoc", "Args:
	L(gp_Elips2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Elips2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Elips2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Elips2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Elips2d)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Elips2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Hypr2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Hypr2d & L);
		%feature("autodoc", "Args:
	L(gp_Hypr2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Hypr2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Hypr2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Hypr2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Hypr2d)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Hypr2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(gp_Parab2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Parab2d & L);
		%feature("autodoc", "Args:
	L(gp_Parab2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Parab2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(gp_Parab2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Parab2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(gp_Parab2d)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Parab2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	L(Handle_Geom2d_Curve)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
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
	virtual Standard_Boolean

No detailed docstring for this function.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBuilderAPI_EdgeError

Returns the error description when NotDone.") Error;
		BRepBuilderAPI_EdgeError Error ();
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


%feature("shadow") BRepBuilderAPI_MakeEdge2d::~BRepBuilderAPI_MakeEdge2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_MakeEdge2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_MakeFace;
class BRepBuilderAPI_MakeFace : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Not done.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Load a face. Usefull to add wires.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	P(gp_Pln)

Returns:
	None

Make a face from a plane.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Pln & P);
		%feature("autodoc", "Args:
	C(gp_Cylinder)

Returns:
	None

Make a face from a cylinder.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cylinder & C);
		%feature("autodoc", "Args:
	C(gp_Cone)

Returns:
	None

Make a face from a cone.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cone & C);
		%feature("autodoc", "Args:
	S(gp_Sphere)

Returns:
	None

Make a face from a sphere.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Sphere & S);
		%feature("autodoc", "Args:
	C(gp_Torus)

Returns:
	None

Make a face from a torus.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Torus & C);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	TolDegen(Standard_Real)

Returns:
	None

Make a face from a Surface. Accepts tolerance value (TolDegen)  
for resolution of degenerated edges.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const Handle_Geom_Surface & S,const Standard_Real TolDegen);
		%feature("autodoc", "Args:
	P(gp_Pln)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a face from a plane.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Pln & P,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	C(gp_Cylinder)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a face from a cylinder.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cylinder & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	C(gp_Cone)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a face from a cone.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cone & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a face from a sphere.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Sphere & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	C(gp_Torus)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a face from a torus.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Torus & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)
	TolDegen(Standard_Real)

Returns:
	None

Make a face from a Surface. Accepts tolerance value (TolDegen)  
         for resolution of degenerated edges.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real TolDegen);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	OnlyPlane(Standard_Boolean)=Standard_False

Returns:
	None

Find a surface from the wire and make a face.  
         if <OnlyPlane> is true, the computed surface will be  
         a plane. If it is not possible to find a plane, the  
         flag NotDone will be set.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const TopoDS_Wire & W,const Standard_Boolean OnlyPlane = Standard_False);
		%feature("autodoc", "Args:
	P(gp_Pln)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a plane and a wire.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Pln & P,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	C(gp_Cylinder)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a cylinder and a wire.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cylinder & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	C(gp_Cone)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a cone and a wire.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cone & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a sphere and a wire.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Sphere & S,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	C(gp_Torus)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a torus and a wire.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Torus & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	W(TopoDS_Wire)
	Inside(Standard_Boolean)=Standard_True

Returns:
	None

Make a face from a Surface and a wire.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const Handle_Geom_Surface & S,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	W(TopoDS_Wire)

Returns:
	None

Adds the wire <W> in the face <F>  A general method to create a face is to give  
-      a surface S as the support (the geometric domain) of the face,  
-      and a wire W to bound it.  
The bounds of the face can also be defined by four parameter values  
umin, umax, vmin, vmax which determine isoparametric limitations on  
the parametric space of the surface. In this way, a patch is  
defined. The parameter values are optional. If they are omitted, the  
natural bounds of the surface are used. A wire is automatically  
built using the defined bounds. Up to four edges and four vertices  
are created with this wire (no edge is created when the  
corresponding parameter value is infinite).  
Wires can then be added using the function Add to define other  
restrictions on the face. These restrictions represent holes. More  
than one wire may be added by this way, provided that the wires do  
not cross each other and that they define only one area on the  
surface. (Be careful, however, as this is not checked).  
 Forbidden addition of wires  
Note that in this schema, the third case is valid if edges of the  
wire W are declared internal to the face. As a result, these edges  
are no longer bounds of the face.  
A default tolerance (Precision::Confusion()) is given to the face,  
this tolerance may be increased during construction of the face  
using various algorithms.  
Rules applied to the arguments  
For the surface:  
-      The surface must not be a 'null handle'.  
-      If the surface is a trimmed surface, the basis surface is used.  
-      For the wire: the wire is composed of connected edges, each  
   edge having a parametric curve description in the parametric  
   domain of the surface; in other words, as a pcurve.  
For the parameters:  
-      The parameter values must be in the parametric range of the  
   surface (or the basis surface, if the surface is trimmed). If this  
   condition is not satisfied, the face is not built, and the Error  
   function will return BRepBuilderAPI_ParametersOutOfRange.  
-      The bounding parameters p1 and p2 are adjusted on a periodic  
   surface in a given parametric direction by adding or subtracting  
   the period to obtain p1 in the parametric range of the surface and  
   such p2, that p2 - p1 <= Period, where Period is the period of the  
   surface in this parametric direction.  
-      A parameter value may be infinite. There will be no edge and  
   no vertex in the corresponding direction.") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const TopoDS_Face & F,const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Initializes (or reinitializes) the  
construction of a face by creating a new object which is a copy of  
the face F, in order to add wires to it, using the function Add.  
Note: this complete copy of the geometry is only required if you  
want to work on the geometries of the two faces independently.") Init;
		void Init (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	Bound(Standard_Boolean)
	TolDegen(Standard_Real)

Returns:
	None

Initializes (or reinitializes) the construction of a face on  
the surface S. If Bound is true, a wire is  
automatically created from the natural bounds of the  
surface S and added to the face in order to bound it. If  
Bound is false, no wire is added. This option is used  
when real bounds are known. These will be added to  
the face after this initialization, using the function Add.  
TolDegen parameter is used for resolution of degenerated edges  
if calculation of natural bounds is turned on.") Init;
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

Initializes (or reinitializes) the construction of a face on  
the surface S, limited in the u parametric direction by  
the two parameter values UMin and UMax and in the  
v parametric direction by the two parameter values VMin and VMax.  
Warning  
 Error returns:  
-      BRepBuilderAPI_ParametersOutOfRange  
   when the parameters given are outside the bounds of the  
   surface or the basis surface of a trimmed surface.  
TolDegen parameter is used for resolution of degenerated edges.") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real TolDegen);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

Adds the wire W to the constructed face as a hole.  
Warning  
W must not cross the other bounds of the face, and all  
the bounds must define only one area on the surface.  
(Be careful, however, as this is not checked.)  
Example  
// a cylinder  
   gp_Cylinder C = ..;  
// a wire  
TopoDS_Wire W = ...;  
BRepBuilderAPI_MakeFace MF(C);  
MF.Add(W);  
TopoDS_Face F = MF;") Add;
		void Add (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if this algorithm has a valid face.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBuilderAPI_FaceError

Returns the construction status  
  BRepBuilderAPI_FaceDone if the face is built, or  
-   another value of the BRepBuilderAPI_FaceError  
  enumeration indicating why the construction failed, in  
  particular when the given parameters are outside the  
  bounds of the surface.") Error;
		BRepBuilderAPI_FaceError Error ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns the constructed face.  
Exceptions  
StdFail_NotDone if no face is built.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Face;
		 operator TopoDS_Face ();
};


%feature("shadow") BRepBuilderAPI_MakeFace::~BRepBuilderAPI_MakeFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_MakeFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_MakePolygon;
class BRepBuilderAPI_MakePolygon : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes an empty polygonal wire, to which points or  
vertices are added using the Add function.  
As soon as the polygonal wire under construction  
contains vertices, it can be consulted using the Wire function.") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon ();
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)
	Close(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)
	P4(gp_Pnt)
	Close(Standard_Boolean)=Standard_False

Returns:
	None

Constructs a polygonal wire from 2, 3 or 4 points. Vertices are  
automatically created on the given points. The polygonal wire is  
closed if Close is true; otherwise it is open. Further vertices can  
be added using the Add function. The polygonal wire under  
construction can be consulted at any time by using the Wire function.  
Example  
//an open polygon from four points  
TopoDS_Wire W = BRepBuilderAPI_MakePolygon(P1,P2,P3,P4);  
Warning: The process is equivalent to:  
  - initializing an empty polygonal wire,  
  - and adding the given points in sequence.  
Consequently, be careful when using this function: if the  
sequence of points p1 - p2 - p1 is found among the arguments of the  
constructor, you will create a polygonal wire with two  
consecutive coincident edges.") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & P4,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	V3(TopoDS_Vertex)
	Close(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const TopoDS_Vertex & V3,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	V3(TopoDS_Vertex)
	V4(TopoDS_Vertex)
	Close(Standard_Boolean)=Standard_False

Returns:
	None

Constructs a polygonal wire from  
2, 3 or 4 vertices. The polygonal wire is closed if Close is true;  
otherwise it is open (default value). Further vertices can be  
added using the Add function. The polygonal wire under  
construction can be consulted at any time by using the Wire function.  
Example  
//a closed triangle from three vertices  
TopoDS_Wire W = BRepBuilderAPI_MakePolygon(V1,V2,V3,Standard_True);  
Warning  
The process is equivalent to:  
-      initializing an empty polygonal wire,  
-      then adding the given points in sequence.  
So be careful, as when using this function, you could create a  
polygonal wire with two consecutive coincident edges if  
the sequence of vertices v1 - v2 - v1 is found among the  
constructor's arguments.") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const TopoDS_Vertex & V3,const TopoDS_Vertex & V4,const Standard_Boolean Close = Standard_False);
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

Adds the point P or the vertex V at the end of the  
polygonal wire under construction. A vertex is  
automatically created on the point P.  
Warning  
-   When P or V is coincident to the previous vertex,  
  no edge is built. The method Added can be used to  
  test for this. Neither P nor V is checked to verify  
  that it is coincident with another vertex than the last  
  one, of the polygonal wire under construction. It is  
  also possible to add vertices on a closed polygon  
  (built for example by using a constructor which  
  declares the polygon closed, or after the use of the Close function).  
 Consequently, be careful using this function: you might create:  
-      a polygonal wire with two consecutive coincident edges, or  
-      a non manifold polygonal wire.  
-      P or V is not checked to verify if it is  
   coincident with another vertex but the last one, of  
   the polygonal wire under construction. It is also  
   possible to add vertices on a closed polygon (built  
   for example by using a constructor which declares  
   the polygon closed, or after the use of the Close function).  
Consequently, be careful when using this function: you might create:  
  -   a polygonal wire with two consecutive coincident edges, or  
  -   a non-manifold polygonal wire.") Add;
		void Add (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the last vertex added to the constructed  
polygonal wire is not coincident with the previous one.") Added;
		Standard_Boolean Added ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Closes the polygonal wire under construction. Note - this  
is equivalent to adding the first vertex to the polygonal  
wire under construction.") Close;
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

Returns the first or the last vertex of the polygonal wire under construction.  
If the constructed polygonal wire is closed, the first and the last vertices are identical.") LastVertex;
		const TopoDS_Vertex & LastVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if this algorithm contains a valid polygonal  
wire (i.e. if there is at least one edge).  
IsDone returns false if fewer than two vertices have  
been chained together by this construction algorithm.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the edge built between the last two points or  
vertices added to the constructed polygonal wire under construction.  
Warning  
If there is only one vertex in the polygonal wire, the result is a null edge.") Edge;
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

Returns the constructed polygonal wire, or the already  
built part of the polygonal wire under construction.  
Exceptions  
StdFail_NotDone if the wire is not built, i.e. if fewer than  
two vertices have been chained together by this construction algorithm.") Wire;
		const TopoDS_Wire & Wire ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Wire;
		 operator TopoDS_Wire ();
};


%feature("shadow") BRepBuilderAPI_MakePolygon::~BRepBuilderAPI_MakePolygon %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_MakePolygon {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_MakeShell;
class BRepBuilderAPI_MakeShell : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty shell framework. The Init  
function is used to define the construction arguments.  
Warning  
The function Error will return  
BRepBuilderAPI_EmptyShell if it is called before the function Init.") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	Segment(Standard_Boolean)=Standard_False

Returns:
	None

Constructs a shell from the surface S.") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell (const Handle_Geom_Surface & S,const Standard_Boolean Segment = Standard_False);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)
	Segment(Standard_Boolean)=Standard_False

Returns:
	None

Constructs a shell from the surface S,  
     limited in the u parametric direction by the two  
     parameter values UMin and UMax, and limited in the v  
     parametric direction by the two parameter values VMin and VMax.") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Boolean Segment = Standard_False);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)
	Segment(Standard_Boolean)=Standard_False

Returns:
	None

Defines or redefines the arguments  
for the construction of a shell. The construction is initialized  
with the surface S, limited in the u parametric direction by the  
two parameter values UMin and UMax, and in the v parametric  
direction by the two parameter values VMin and VMax.  
Warning  
The function Error returns:  
-      BRepBuilderAPI_ShellParametersOutOfRange  
   when the given parameters are outside the bounds of the  
   surface or the basis surface if S is trimmed") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Boolean Segment = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if the shell is built.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBuilderAPI_ShellError

Returns the construction status:  
-   BRepBuilderAPI_ShellDone if the shell is built, or  
-   another value of the BRepBuilderAPI_ShellError  
  enumeration indicating why the construction failed.  
  This is frequently BRepBuilderAPI_ShellParametersOutOfRange  
indicating that the given parameters are outside the bounds of the surface.") Error;
		BRepBuilderAPI_ShellError Error ();
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


%feature("shadow") BRepBuilderAPI_MakeShell::~BRepBuilderAPI_MakeShell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_MakeShell {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_MakeSolid;
class BRepBuilderAPI_MakeSolid : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the construction of a solid. An empty solid is  
considered to cover the whole space. The Add function  
is used to define shells to bound it.") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid ();
		%feature("autodoc", "Args:
	S(TopoDS_CompSolid)

Returns:
	None

Make a solid from a CompSolid.") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_CompSolid & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shell)

Returns:
	None

Make a solid from a shell.") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_Shell & S);
		%feature("autodoc", "Args:
	S1(TopoDS_Shell)
	S2(TopoDS_Shell)

Returns:
	None

Make a solid from two shells.") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_Shell & S1,const TopoDS_Shell & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shell)
	S2(TopoDS_Shell)
	S3(TopoDS_Shell)

Returns:
	None

Make a solid from three shells.  Constructs a solid  
-   covering the whole space, or  
-   from shell S, or  
-   from two shells S1 and S2, or  
-   from three shells S1, S2 and S3, or  
Warning  
No check is done to verify the conditions of coherence  
of the resulting solid. In particular, S1, S2 (and S3) must  
not intersect each other.  
Besides, after all shells have been added using the Add  
function, one of these shells should constitute the outside  
skin of the solid; it may be closed (a finite solid) or open  
(an infinite solid). Other shells form hollows (cavities) in  
these previous ones. Each must bound a closed volume.") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_Shell & S1,const TopoDS_Shell & S2,const TopoDS_Shell & S3);
		%feature("autodoc", "Args:
	So(TopoDS_Solid)

Returns:
	None

Make a solid from a solid. Usefull for adding later.") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_Solid & So);
		%feature("autodoc", "Args:
	So(TopoDS_Solid)
	S(TopoDS_Shell)

Returns:
	None

Add a shell to a solid.  
Constructs a solid:  
-   from the solid So, to which shells can be added, or  
-   by adding the shell S to the solid So.  
  Warning  
No check is done to verify the conditions of coherence  
of the resulting solid. In particular S must not intersect the solid S0.  
Besides, after all shells have been added using the Add  
function, one of these shells should constitute the outside  
skin of the solid. It may be closed (a finite solid) or open  
(an infinite solid). Other shells form hollows (cavities) in  
the previous ones. Each must bound a closed volume.") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_Solid & So,const TopoDS_Shell & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shell)

Returns:
	None

Adds the shell to the current solid.  
//!	Warning  
No check is done to verify the conditions of coherence  
of the resulting solid. In particular, S must not intersect  
other shells of the solid under construction.  
Besides, after all shells have been added, one of  
these shells should constitute the outside skin of the  
solid. It may be closed (a finite solid) or open (an  
infinite solid). Other shells form hollows (cavities) in  
these previous ones. Each must bound a closed volume.") Add;
		void Add (const TopoDS_Shell & S);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if the solid is built.  
For this class, a solid under construction is always valid.  
If no shell has been added, it could be a whole-space  
solid. However, no check was done to verify the  
conditions of coherence of the resulting solid.") IsDone;
		virtual Standard_Boolean IsDone ();
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
	S(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);
};


%feature("shadow") BRepBuilderAPI_MakeSolid::~BRepBuilderAPI_MakeSolid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_MakeSolid {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_MakeVertex;
class BRepBuilderAPI_MakeVertex : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Constructs a vertex from point P.  
Example create a vertex from a 3D point.  
gp_Pnt P(0,0,10);  
TopoDS_Vertex V = BRepBuilderAPI_MakeVertex(P);") BRepBuilderAPI_MakeVertex;
		 BRepBuilderAPI_MakeVertex (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

Returns the constructed vertex.") Vertex;
		const TopoDS_Vertex & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Vertex;
		 operator TopoDS_Vertex ();
};


%feature("shadow") BRepBuilderAPI_MakeVertex::~BRepBuilderAPI_MakeVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_MakeVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_MakeWire;
class BRepBuilderAPI_MakeWire : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty wire framework, to which edges  
are added using the Add function.  
As soon as the wire contains one edge, it can return  
with the use of the function Wire.  
Warning  
The function Error will return  
BRepBuilderAPI_EmptyWire if it is called before at  
least one edge is added to the wire under construction.") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Make a Wire from an edge.") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)

Returns:
	None

Make a Wire from two edges.") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	E3(TopoDS_Edge)

Returns:
	None

Make a Wire from three edges.") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Edge & E3);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	E3(TopoDS_Edge)
	E4(TopoDS_Edge)

Returns:
	None

Make a Wire from four edges.  Constructs a wire  
-   from the TopoDS_Wire W composed of the edge E, or  
-   from edge E, or  
-   from two edges E1 and E2, or  
-   from three edges E1, E2 and E3, or  
-   from four edges E1, E2, E3 and E4.  
Further edges can be added using the function Add.  
Given edges are added in a sequence. Each of them  
must be connectable to the wire under construction,  
and so must satisfy the following condition (unless it is  
the first edge of the wire): one of its vertices must be  
geometrically coincident with one of the vertices of the  
wire (provided that the highest tolerance factor is  
assigned to the two vertices). It could also be the same vertex.  
Warning  
If an edge is not connectable to the wire under  
construction it is not added. The function Error will  
return BRepBuilderAPI_DisconnectedWire, the  
function IsDone will return false and the function Wire  
will raise an error, until a new connectable edge is added.") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Edge & E3,const TopoDS_Edge & E4);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

Make a Wire from a Wire. Usefull for adding later.") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	E(TopoDS_Edge)

Returns:
	None

Add an edge to a wire.") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Wire & W,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Adds the edge E to the wire under construction.  
E must be connectable to the wire under construction, and, unless it  
is the first edge of the wire, must satisfy the following  
condition: one of its vertices must be geometrically coincident  
with one of the vertices of the wire (provided that the highest  
tolerance factor is assigned to the two vertices). It could also  
be the same vertex.  
Warning  
If E is not connectable to the wire under construction it is not  
added. The function Error will return  
BRepBuilderAPI_DisconnectedWire, the function IsDone will return  
false and the function Wire will raise an error, until a new  
connectable edge is added.") Add;
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

Adds  the edges of <L>   to the current  wire.  The  
         edges are not to be consecutive.   But they are to  
         be  all  connected geometrically or topologically.  
         If some of them are  not connected the Status give  
         DisconnectedWire but the 'Maker' is Done() and you  
         can get the  partial result. (ie connected to  the  
         first edgeof the list <L>)") Add;
		void Add (const TopTools_ListOfShape & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if this algorithm contains a valid wire.  
IsDone returns false if:  
-   there are no edges in the wire, or  
-   the last edge which you tried to add was not connectable.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBuilderAPI_WireError

Returns the construction status  
-   BRepBuilderAPI_WireDone if the wire is built, or  
-   another value of the BRepBuilderAPI_WireError  
  enumeration indicating why the construction failed.") Error;
		BRepBuilderAPI_WireError Error ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Returns the constructed wire; or the part of the wire  
under construction already built.  
Exceptions StdFail_NotDone if a wire is not built.") Wire;
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

Returns the last edge added to the wire under construction.  
Warning  
-   This edge can be different from the original one (the  
  argument of the function Add, for instance,)  
-   A null edge is returned if there are no edges in the  
  wire under construction, or if the last edge which you  
  tried to add was not connectable..") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

Returns the last vertex of the last edge added to the  
wire under construction.  
Warning  
A null vertex is returned if there are no edges in the wire  
under construction, or if the last edge which you tried to  
add was not connectableR") Vertex;
		const TopoDS_Vertex & Vertex ();
};


%feature("shadow") BRepBuilderAPI_MakeWire::~BRepBuilderAPI_MakeWire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_MakeWire {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_ModifyShape;
class BRepBuilderAPI_ModifyShape : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes modified from the shape  
         <S>.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopoDS_Shape

Returns the modified shape corresponding to <S>.  
S can correspond to the entire initial shape or to its subshape.  
Exceptions  
Standard_NoSuchObject if S is not the initial shape or  
a subshape of the initial shape to which the  
transformation has been applied. Raises NoSuchObject from Standard  
if S is not the initial shape or a sub-shape  
of the initial shape.") ModifiedShape;
		virtual const TopoDS_Shape & ModifiedShape (const TopoDS_Shape & S);
};


%feature("shadow") BRepBuilderAPI_ModifyShape::~BRepBuilderAPI_ModifyShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_ModifyShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_Copy;
class BRepBuilderAPI_Copy : public BRepBuilderAPI_ModifyShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty copy framework. Use the function  
Perform to copy shapes.") BRepBuilderAPI_Copy;
		 BRepBuilderAPI_Copy ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	copyGeom(Standard_Boolean)=Standard_True

Returns:
	None

Constructs a copy framework and copies the shape S.  
Use the function Shape to access the result.  
If copyGeom is False, only topological objects will be copied, while  
geometry will be shared with original shape.  
Note: the constructed framework can be reused to copy  
other shapes: just specify them with the function Perform.") BRepBuilderAPI_Copy;
		 BRepBuilderAPI_Copy (const TopoDS_Shape & S,const Standard_Boolean copyGeom = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	copyGeom(Standard_Boolean)=Standard_True

Returns:
	None

Copies the shape S.  
Use the function Shape to access the result.  
If copyGeom is False, only topological objects will be copied, while  
geometry will be shared with original shape.") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Boolean copyGeom = Standard_True);
};


%feature("shadow") BRepBuilderAPI_Copy::~BRepBuilderAPI_Copy %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_Copy {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_GTransform;
class BRepBuilderAPI_GTransform : public BRepBuilderAPI_ModifyShape {
	public:
		%feature("autodoc", "Args:
	T(gp_GTrsf)

Returns:
	None

Constructs a framework for applying the geometric  
transformation T to a shape. Use the function  
Perform to define the shape to transform.") BRepBuilderAPI_GTransform;
		 BRepBuilderAPI_GTransform (const gp_GTrsf & T);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	T(gp_GTrsf)
	Copy(Standard_Boolean)=Standard_False

Returns:
	None

Constructs a framework for applying the geometric  
transformation T to a shape, and applies it to the shape S.  
-   If the transformation T is direct and isometric (i.e. if  
  the determinant of the vectorial part of T is equal to  
  1.), and if Copy equals false (default value), the  
  resulting shape is the same as the original but with  
  a new location assigned to it.  
-   In all other cases, the transformation is applied to  
  a duplicate of S.  
Use the function Shape to access the result.  
Note: the constructed framework can be reused to  
apply the same geometric transformation to other  
shapes: just specify them with the function Perform.") BRepBuilderAPI_GTransform;
		 BRepBuilderAPI_GTransform (const TopoDS_Shape & S,const gp_GTrsf & T,const Standard_Boolean Copy = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Copy(Standard_Boolean)=Standard_False

Returns:
	None

Applies the geometric transformation defined at the  
time of construction of this framework to the shape S.  
-   If the transformation T is direct and isometric (i.e. if  
  the determinant of the vectorial part of T is equal to  
  1.), and if Copy equals false (default value), the  
  resulting shape is the same as the original but with  
  a new location assigned to it.  
-   In all other cases, the transformation is applied to a duplicate of S.  
  Use the function Shape to access the result.  
Note: this framework can be reused to apply the same  
geometric transformation to other shapes: just specify  
them by calling the function Perform again.") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Boolean Copy = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes modified from the shape  
         <S>.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopoDS_Shape

Returns the modified shape corresponding to <S>.") ModifiedShape;
		virtual const TopoDS_Shape & ModifiedShape (const TopoDS_Shape & S);
};


%feature("shadow") BRepBuilderAPI_GTransform::~BRepBuilderAPI_GTransform %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_GTransform {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_NurbsConvert;
class BRepBuilderAPI_NurbsConvert : public BRepBuilderAPI_ModifyShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs a framework for converting the geometry of a  
shape into NURBS geometry. Use the function Perform  
to define the shape to convert.") BRepBuilderAPI_NurbsConvert;
		 BRepBuilderAPI_NurbsConvert ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Copy(Standard_Boolean)=Standard_False

Returns:
	None

Builds a new shape by converting the geometry of the  
shape S into NURBS geometry. Specifically, all curves  
supporting edges of S are converted into BSpline  
curves, and all surfaces supporting its faces are  
converted into BSpline surfaces.  
Use the function Shape to access the new shape.  
Note: the constructed framework can be reused to  
convert other shapes. You specify these with the  
function Perform.") BRepBuilderAPI_NurbsConvert;
		 BRepBuilderAPI_NurbsConvert (const TopoDS_Shape & S,const Standard_Boolean Copy = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Copy(Standard_Boolean)=Standard_False

Returns:
	None

Builds a new shape by converting the geometry of the  
shape S into NURBS geometry.  
Specifically, all curves supporting edges of S are  
converted into BSpline curves, and all surfaces  
supporting its faces are converted into BSpline surfaces.  
Use the function Shape to access the new shape.  
Note: this framework can be reused to convert other  
shapes: you specify them by calling the function Perform again.") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Boolean Copy = Standard_False);
};


%feature("shadow") BRepBuilderAPI_NurbsConvert::~BRepBuilderAPI_NurbsConvert %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_NurbsConvert {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepBuilderAPI_Transform;
class BRepBuilderAPI_Transform : public BRepBuilderAPI_ModifyShape {
	public:
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Constructs a framework for applying the geometric  
transformation T to a shape. Use the function Perform  
to define the shape to transform.") BRepBuilderAPI_Transform;
		 BRepBuilderAPI_Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	T(gp_Trsf)
	Copy(Standard_Boolean)=Standard_False

Returns:
	None

Creates a transformation from the gp_Trsf <T>, and  
         applies it to the shape <S>. If the transformation  
         is  direct   and isometric (determinant  =  1) and  
         <Copy> =  Standard_False,  the resulting shape  is  
         <S> on   which  a  new  location has    been  set.  
         Otherwise,  the   transformation is applied   on a  
         duplication of <S>.") BRepBuilderAPI_Transform;
		 BRepBuilderAPI_Transform (const TopoDS_Shape & S,const gp_Trsf & T,const Standard_Boolean Copy = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Copy(Standard_Boolean)=Standard_False

Returns:
	None

pplies the geometric transformation defined at the  
time of construction of this framework to the shape S.  
- If the transformation T is direct and isometric, in  
other words, if the determinant of the vectorial part  
of T is equal to 1., and if Copy equals false (the  
default value), the resulting shape is the same as  
the original but with a new location assigned to it.  
-   In all other cases, the transformation is applied to a duplicate of S.  
Use the function Shape to access the result.  
Note: this framework can be reused to apply the same  
geometric transformation to other shapes. You only  
need to specify them by calling the function Perform again.") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Boolean Copy = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopoDS_Shape

Returns the modified shape corresponding to <S>.") ModifiedShape;
		virtual const TopoDS_Shape & ModifiedShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes modified from the shape  
         <S>.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
};


%feature("shadow") BRepBuilderAPI_Transform::~BRepBuilderAPI_Transform %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBuilderAPI_Transform {
	void _kill_pointed() {
		delete $self;
	}
};
