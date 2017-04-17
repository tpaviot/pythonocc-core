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
%module (package="OCC") BRepBuilderAPI

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


%include BRepBuilderAPI_headers.i


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
class BRepBuilderAPI {
	public:
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Sets the current plane.

	:param P:
	:type P: Handle_Geom_Plane &
	:rtype: void
") Plane;
		static void Plane (const Handle_Geom_Plane & P);
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the current plane.

	:rtype: Handle_Geom_Plane
") Plane;
		Handle_Geom_Plane Plane ();
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "	* Sets the default precision. The current Precision is returned.

	:param P:
	:type P: float
	:rtype: void
") Precision;
		static void Precision (const Standard_Real P);
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "	* Returns the default precision.

	:rtype: float
") Precision;
		static Standard_Real Precision ();
};


%extend BRepBuilderAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_Collect;
class BRepBuilderAPI_Collect {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_Collect;
		%feature("autodoc", "	:rtype: None
") BRepBuilderAPI_Collect;
		 BRepBuilderAPI_Collect ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param SI:
	:type SI: TopoDS_Shape &
	:param MKS:
	:type MKS: BRepBuilderAPI_MakeShape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & SI,BRepBuilderAPI_MakeShape & MKS);
		%feature("compactdefaultargs") AddGenerated;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Gen:
	:type Gen: TopoDS_Shape &
	:rtype: None
") AddGenerated;
		void AddGenerated (const TopoDS_Shape & S,const TopoDS_Shape & Gen);
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Mod:
	:type Mod: TopoDS_Shape &
	:rtype: None
") AddModif;
		void AddModif (const TopoDS_Shape & S,const TopoDS_Shape & Mod);
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "	:param SF:
	:type SF: TopoDS_Shape &
	:rtype: None
") Filter;
		void Filter (const TopoDS_Shape & SF);
		%feature("compactdefaultargs") Modification;
		%feature("autodoc", "	:rtype: TopTools_DataMapOfShapeListOfShape
") Modification;
		const TopTools_DataMapOfShapeListOfShape & Modification ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	:rtype: TopTools_DataMapOfShapeListOfShape
") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated ();
};


%extend BRepBuilderAPI_Collect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_Command;
class BRepBuilderAPI_Command {
	public:
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* Raises NotDone if done is false.

	:rtype: None
") Check;
		void Check ();
};


%extend BRepBuilderAPI_Command {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_FastSewing;
class BRepBuilderAPI_FastSewing : public Standard_Transient {
	public:
typedef unsigned int FS_VARStatuses;
/* public enums */
enum FS_Statuses {
	FS_OK = 0,
	FS_Degenerated = 1,
	FS_FindVertexError = 2,
	FS_FindEdgeError = 4,
	FS_FaceWithNullSurface = 8,
	FS_NotNaturalBoundsFace = 16,
	FS_InfiniteSurface = 32,
	FS_EmptyInput = 64,
	FS_Exception = 128,
};

/* end public enums declaration */

		%feature("compactdefaultargs") BRepBuilderAPI_FastSewing;
		%feature("autodoc", "	* Creates an object with tolerance of connexity

	:param theTolerance: default value is 1.0e-06
	:type theTolerance: float
	:rtype: None
") BRepBuilderAPI_FastSewing;
		 BRepBuilderAPI_FastSewing (const Standard_Real theTolerance = 1.0e-06);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds faces of a shape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a surface

	:param theSurface:
	:type theSurface: Handle_Geom_Surface &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Geom_Surface & theSurface);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute resulted shape

	:param :
	:type : void
	:rtype: None
") Perform;
		void Perform (void );
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets tolerance

	:param theToler:
	:type theToler: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theToler);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns tolerance

	:rtype: float
") GetTolerance;
		Standard_Real GetTolerance ();
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "	* Returns resulted shape

	:rtype: TopoDS_Shape
") GetResult;
		const TopoDS_Shape  GetResult ();
};


%extend BRepBuilderAPI_FastSewing {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepBuilderAPI_FastSewing(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepBuilderAPI_FastSewing::Handle_BRepBuilderAPI_FastSewing %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepBuilderAPI_FastSewing;
class Handle_BRepBuilderAPI_FastSewing : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_BRepBuilderAPI_FastSewing();
        Handle_BRepBuilderAPI_FastSewing(const Handle_BRepBuilderAPI_FastSewing &aHandle);
        Handle_BRepBuilderAPI_FastSewing(const BRepBuilderAPI_FastSewing *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepBuilderAPI_FastSewing DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepBuilderAPI_FastSewing {
    BRepBuilderAPI_FastSewing* _get_reference() {
    return (BRepBuilderAPI_FastSewing*)$self->Access();
    }
};

%extend Handle_BRepBuilderAPI_FastSewing {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepBuilderAPI_FastSewing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_FindPlane;
class BRepBuilderAPI_FindPlane {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_FindPlane;
		%feature("autodoc", "	* Initializes an empty algorithm. The function Init is then used to define the shape.

	:rtype: None
") BRepBuilderAPI_FindPlane;
		 BRepBuilderAPI_FindPlane ();
		%feature("compactdefaultargs") BRepBuilderAPI_FindPlane;
		%feature("autodoc", "	* Constructs the plane containing the edges of the shape S. A plane is built only if all the edges are within a distance of less than or equal to tolerance from a planar surface. This tolerance value is equal to the larger of the following two values: - Tol, where the default value is negative, or - the largest of the tolerance values assigned to the individual edges of S. Use the function Found to verify that a plane is built. The resulting plane is then retrieved using the function Plane.

	:param S:
	:type S: TopoDS_Shape &
	:param Tol: default value is -1
	:type Tol: float
	:rtype: None
") BRepBuilderAPI_FindPlane;
		 BRepBuilderAPI_FindPlane (const TopoDS_Shape & S,const Standard_Real Tol = -1);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Constructs the plane containing the edges of the shape S. A plane is built only if all the edges are within a distance of less than or equal to tolerance from a planar surface. This tolerance value is equal to the larger of the following two values: - Tol, where the default value is negative, or - the largest of the tolerance values assigned to the individual edges of S. Use the function Found to verify that a plane is built. The resulting plane is then retrieved using the function Plane.

	:param S:
	:type S: TopoDS_Shape &
	:param Tol: default value is -1
	:type Tol: float
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S,const Standard_Real Tol = -1);
		%feature("compactdefaultargs") Found;
		%feature("autodoc", "	* Returns true if a plane containing the edges of the shape is found and built. Use the function Plane to consult the result.

	:rtype: bool
") Found;
		Standard_Boolean Found ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the plane containing the edges of the shape. Warning Use the function Found to verify that the plane is built. If a plane is not found, Plane returns a null handle.

	:rtype: Handle_Geom_Plane
") Plane;
		Handle_Geom_Plane Plane ();
};


%extend BRepBuilderAPI_FindPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_Sewing;
class BRepBuilderAPI_Sewing : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_Sewing;
		%feature("autodoc", "	* Creates an object with tolerance of connexity option for sewing (if false only control) option for analysis of degenerated shapes option for cutting of free edges. option for non manifold processing

	:param tolerance: default value is 1.0e-06
	:type tolerance: float
	:param option1: default value is Standard_True
	:type option1: bool
	:param option2: default value is Standard_True
	:type option2: bool
	:param option3: default value is Standard_True
	:type option3: bool
	:param option4: default value is Standard_False
	:type option4: bool
	:rtype: None
") BRepBuilderAPI_Sewing;
		 BRepBuilderAPI_Sewing (const Standard_Real tolerance = 1.0e-06,const Standard_Boolean option1 = Standard_True,const Standard_Boolean option2 = Standard_True,const Standard_Boolean option3 = Standard_True,const Standard_Boolean option4 = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* initialize the parameters if necessary

	:param tolerance: default value is 1.0e-06
	:type tolerance: float
	:param option1: default value is Standard_True
	:type option1: bool
	:param option2: default value is Standard_True
	:type option2: bool
	:param option3: default value is Standard_True
	:type option3: bool
	:param option4: default value is Standard_False
	:type option4: bool
	:rtype: None
") Init;
		void Init (const Standard_Real tolerance = 1.0e-06,const Standard_Boolean option1 = Standard_True,const Standard_Boolean option2 = Standard_True,const Standard_Boolean option3 = Standard_True,const Standard_Boolean option4 = Standard_False);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Loades the context shape.

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") Load;
		void Load (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines the shapes to be sewed or controlled

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computing thePI - progress indicator of algorithm

	:param thePI: default value is 0
	:type thePI: Handle_Message_ProgressIndicator &
	:rtype: None
") Perform;
		void Perform (const Handle_Message_ProgressIndicator & thePI = 0);
		%feature("compactdefaultargs") SewedShape;
		%feature("autodoc", "	* Gives the sewed shape a null shape if nothing constructed may be a face, a shell, a solid or a compound

	:rtype: TopoDS_Shape
") SewedShape;
		const TopoDS_Shape  SewedShape ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* set context

	:param theContext:
	:type theContext: Handle_BRepTools_ReShape &
	:rtype: None
") SetContext;
		void SetContext (const Handle_BRepTools_ReShape & theContext);
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "	* return context

	:rtype: Handle_BRepTools_ReShape
") GetContext;
		Handle_BRepTools_ReShape GetContext ();
		%feature("compactdefaultargs") NbFreeEdges;
		%feature("autodoc", "	* Gives the number of free edges (edge shared by one face)

	:rtype: int
") NbFreeEdges;
		Standard_Integer NbFreeEdges ();
		%feature("compactdefaultargs") FreeEdge;
		%feature("autodoc", "	* Gives each free edge

	:param index:
	:type index: int
	:rtype: TopoDS_Edge
") FreeEdge;
		const TopoDS_Edge  FreeEdge (const Standard_Integer index);
		%feature("compactdefaultargs") NbMultipleEdges;
		%feature("autodoc", "	* Gives the number of multiple edges (edge shared by more than two faces)

	:rtype: int
") NbMultipleEdges;
		Standard_Integer NbMultipleEdges ();
		%feature("compactdefaultargs") MultipleEdge;
		%feature("autodoc", "	* Gives each multiple edge

	:param index:
	:type index: int
	:rtype: TopoDS_Edge
") MultipleEdge;
		const TopoDS_Edge  MultipleEdge (const Standard_Integer index);
		%feature("compactdefaultargs") NbContigousEdges;
		%feature("autodoc", "	* Gives the number of contigous edges (edge shared by two faces)

	:rtype: int
") NbContigousEdges;
		Standard_Integer NbContigousEdges ();
		%feature("compactdefaultargs") ContigousEdge;
		%feature("autodoc", "	* Gives each contigous edge

	:param index:
	:type index: int
	:rtype: TopoDS_Edge
") ContigousEdge;
		const TopoDS_Edge  ContigousEdge (const Standard_Integer index);
		%feature("compactdefaultargs") ContigousEdgeCouple;
		%feature("autodoc", "	* Gives the sections (edge) belonging to a contigous edge

	:param index:
	:type index: int
	:rtype: TopTools_ListOfShape
") ContigousEdgeCouple;
		const TopTools_ListOfShape & ContigousEdgeCouple (const Standard_Integer index);
		%feature("compactdefaultargs") IsSectionBound;
		%feature("autodoc", "	* Indicates if a section is bound (before use SectionToBoundary)

	:param section:
	:type section: TopoDS_Edge &
	:rtype: bool
") IsSectionBound;
		Standard_Boolean IsSectionBound (const TopoDS_Edge & section);
		%feature("compactdefaultargs") SectionToBoundary;
		%feature("autodoc", "	* Gives the original edge (free boundary) which becomes the the section. Remember that sections constitute common edges. This imformation is important for control because with original edge we can find the surface to which the section is attached.

	:param section:
	:type section: TopoDS_Edge &
	:rtype: TopoDS_Edge
") SectionToBoundary;
		const TopoDS_Edge  SectionToBoundary (const TopoDS_Edge & section);
		%feature("compactdefaultargs") NbDegeneratedShapes;
		%feature("autodoc", "	* Gives the number of degenerated shapes

	:rtype: int
") NbDegeneratedShapes;
		Standard_Integer NbDegeneratedShapes ();
		%feature("compactdefaultargs") DegeneratedShape;
		%feature("autodoc", "	* Gives each degenerated shape

	:param index:
	:type index: int
	:rtype: TopoDS_Shape
") DegeneratedShape;
		const TopoDS_Shape  DegeneratedShape (const Standard_Integer index);
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "	* Indicates if a input shape is degenerated

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: bool
") IsDegenerated;
		Standard_Boolean IsDegenerated (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	* Indicates if a input shape has been modified

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: bool
") IsModified;
		Standard_Boolean IsModified (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Gives a modifieded shape

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Modified;
		const TopoDS_Shape  Modified (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") IsModifiedSubShape;
		%feature("autodoc", "	* Indicates if a input subshape has been modified

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: bool
") IsModifiedSubShape;
		Standard_Boolean IsModifiedSubShape (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") ModifiedSubShape;
		%feature("autodoc", "	* Gives a modifieded subshape

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ModifiedSubShape;
		TopoDS_Shape ModifiedSubShape (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* print the informations

	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") NbDeletedFaces;
		%feature("autodoc", "	* Gives the number of deleted faces (faces smallest than tolerance)

	:rtype: int
") NbDeletedFaces;
		Standard_Integer NbDeletedFaces ();
		%feature("compactdefaultargs") DeletedFace;
		%feature("autodoc", "	* Gives each deleted face

	:param index:
	:type index: int
	:rtype: TopoDS_Face
") DeletedFace;
		const TopoDS_Face  DeletedFace (const Standard_Integer index);
		%feature("compactdefaultargs") WhichFace;
		%feature("autodoc", "	* Gives a modified shape

	:param theEdg:
	:type theEdg: TopoDS_Edge &
	:param index: default value is 1
	:type index: int
	:rtype: TopoDS_Face
") WhichFace;
		TopoDS_Face WhichFace (const TopoDS_Edge & theEdg,const Standard_Integer index = 1);
		%feature("compactdefaultargs") SameParameterMode;
		%feature("autodoc", "	* Gets same parameter mode.

	:rtype: bool
") SameParameterMode;
		Standard_Boolean SameParameterMode ();
		%feature("compactdefaultargs") SetSameParameterMode;
		%feature("autodoc", "	* Sets same parameter mode.

	:param SameParameterMode:
	:type SameParameterMode: bool
	:rtype: None
") SetSameParameterMode;
		void SetSameParameterMode (const Standard_Boolean SameParameterMode);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Gives set tolerance.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets tolerance

	:param theToler:
	:type theToler: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theToler);
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "	* Gives set min tolerance.

	:rtype: float
") MinTolerance;
		Standard_Real MinTolerance ();
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "	* Sets min tolerance

	:param theMinToler:
	:type theMinToler: float
	:rtype: None
") SetMinTolerance;
		void SetMinTolerance (const Standard_Real theMinToler);
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "	* Gives set max tolerance

	:rtype: float
") MaxTolerance;
		Standard_Real MaxTolerance ();
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "	* Sets max tolerance.

	:param theMaxToler:
	:type theMaxToler: float
	:rtype: None
") SetMaxTolerance;
		void SetMaxTolerance (const Standard_Real theMaxToler);
		%feature("compactdefaultargs") FaceMode;
		%feature("autodoc", "	* Returns mode for sewing faces By default - true.

	:rtype: bool
") FaceMode;
		Standard_Boolean FaceMode ();
		%feature("compactdefaultargs") SetFaceMode;
		%feature("autodoc", "	* Sets mode for sewing faces By default - true.

	:param theFaceMode:
	:type theFaceMode: bool
	:rtype: None
") SetFaceMode;
		void SetFaceMode (const Standard_Boolean theFaceMode);
		%feature("compactdefaultargs") FloatingEdgesMode;
		%feature("autodoc", "	* Returns mode for sewing floating edges By default - false.

	:rtype: bool
") FloatingEdgesMode;
		Standard_Boolean FloatingEdgesMode ();
		%feature("compactdefaultargs") SetFloatingEdgesMode;
		%feature("autodoc", "	* Sets mode for sewing floating edges By default - false. Returns mode for cutting floating edges By default - false. Sets mode for cutting floating edges By default - false.

	:param theFloatingEdgesMode:
	:type theFloatingEdgesMode: bool
	:rtype: None
") SetFloatingEdgesMode;
		void SetFloatingEdgesMode (const Standard_Boolean theFloatingEdgesMode);
		%feature("compactdefaultargs") LocalTolerancesMode;
		%feature("autodoc", "	* Returns mode for accounting of local tolerances of edges and vertices during of merging.

	:rtype: bool
") LocalTolerancesMode;
		Standard_Boolean LocalTolerancesMode ();
		%feature("compactdefaultargs") SetLocalTolerancesMode;
		%feature("autodoc", "	* Sets mode for accounting of local tolerances of edges and vertices during of merging in this case WorkTolerance = myTolerance + tolEdge1+ tolEdg2;

	:param theLocalTolerancesMode:
	:type theLocalTolerancesMode: bool
	:rtype: None
") SetLocalTolerancesMode;
		void SetLocalTolerancesMode (const Standard_Boolean theLocalTolerancesMode);
		%feature("compactdefaultargs") SetNonManifoldMode;
		%feature("autodoc", "	* Sets mode for non-manifold sewing.

	:param theNonManifoldMode:
	:type theNonManifoldMode: bool
	:rtype: None
") SetNonManifoldMode;
		void SetNonManifoldMode (const Standard_Boolean theNonManifoldMode);
		%feature("compactdefaultargs") NonManifoldMode;
		%feature("autodoc", "	* Gets mode for non-manifold sewing. //! INTERNAL FUCTIONS ---

	:rtype: bool
") NonManifoldMode;
		Standard_Boolean NonManifoldMode ();
};


%extend BRepBuilderAPI_Sewing {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepBuilderAPI_Sewing(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepBuilderAPI_Sewing::Handle_BRepBuilderAPI_Sewing %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepBuilderAPI_Sewing* _get_reference() {
    return (BRepBuilderAPI_Sewing*)$self->Access();
    }
};

%extend Handle_BRepBuilderAPI_Sewing {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepBuilderAPI_Sewing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_VertexInspector;
class BRepBuilderAPI_VertexInspector : public NCollection_CellFilter_InspectorXYZ {
	public:
typedef Standard_Integer Target;
		%feature("compactdefaultargs") BRepBuilderAPI_VertexInspector;
		%feature("autodoc", "	* Constructor; remembers the tolerance

	:param theTol:
	:type theTol: float
	:rtype: None
") BRepBuilderAPI_VertexInspector;
		 BRepBuilderAPI_VertexInspector (const Standard_Real theTol);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Keep the points used for comparison

	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: None
") Add;
		void Add (const gp_XYZ & thePnt);
		%feature("compactdefaultargs") ClearResList;
		%feature("autodoc", "	* Clear the list of adjacent points

	:rtype: None
") ClearResList;
		void ClearResList ();
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "	* Set current point to search for coincidence

	:param theCurPnt:
	:type theCurPnt: gp_XYZ
	:rtype: None
") SetCurrent;
		void SetCurrent (const gp_XYZ & theCurPnt);
		%feature("compactdefaultargs") ResInd;
		%feature("autodoc", "	* Get list of indexes of points adjacent with the current

	:rtype: TColStd_ListOfInteger
") ResInd;
		const TColStd_ListOfInteger & ResInd ();
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "	* Implementation of inspection method

	:param theTarget:
	:type theTarget: int
	:rtype: NCollection_CellFilter_Action
") Inspect;
		NCollection_CellFilter_Action Inspect (const Standard_Integer theTarget);
};


%extend BRepBuilderAPI_VertexInspector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_BndBoxTreeSelector;
class BRepBuilderAPI_BndBoxTreeSelector : public BRepBuilderAPI_BndBoxTree::Selector {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_BndBoxTreeSelector;
		%feature("autodoc", "	* Constructor; calls the base class constructor

	:rtype: None
") BRepBuilderAPI_BndBoxTreeSelector;
		 BRepBuilderAPI_BndBoxTreeSelector ();
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "	* Implementation of rejection method returns True if the bounding box does not intersect with the current

	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: bool
") Reject;
		Standard_Boolean Reject (const Bnd_Box & theBox);
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "	* Implementation of acceptance method This method is called when the bounding box intersect with the current. It stores the object - the index of box in the list of accepted objects. returns True, because the object is accepted

	:param theObj:
	:type theObj: int &
	:rtype: bool
") Accept;
		Standard_Boolean Accept (const Standard_Integer & theObj);
		%feature("compactdefaultargs") ClearResList;
		%feature("autodoc", "	* Clear the list of intersecting boxes

	:rtype: None
") ClearResList;
		void ClearResList ();
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "	* Set current box to search for overlapping with him

	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: None
") SetCurrent;
		void SetCurrent (const Bnd_Box & theBox);
		%feature("compactdefaultargs") ResInd;
		%feature("autodoc", "	* Get list of indexes of boxes intersecting with the current box

	:rtype: TColStd_ListOfInteger
") ResInd;
		const TColStd_ListOfInteger & ResInd ();
};


%extend BRepBuilderAPI_BndBoxTreeSelector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_MakeShape;
class BRepBuilderAPI_MakeShape : public BRepBuilderAPI_Command {
	public:
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* This is called by Shape(). It does nothing but may be redefined.

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns a shape built by the shape construction algorithm. Raises exception StdFail_NotDone if the shape was not built.

	:rtype: TopoDS_Shape
") Shape;
		virtual const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") operator TopoDS_Shape;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Shape;
		 operator TopoDS_Shape ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the list of shapes modified from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns true if the shape S has been deleted.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);
};


%extend BRepBuilderAPI_MakeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_MakeEdge;
class BRepBuilderAPI_MakeEdge : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge ();
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Lin & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Lin & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Lin & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Lin & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Circ & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Circ & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Circ & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Circ & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Elips & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Elips & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Elips & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Elips & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Hypr & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Hypr & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Hypr & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Hypr & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Parab & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Parab & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Parab & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const gp_Parab & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	* The general method to directly create an edge is to give - a 3D curve C as the support (geometric domain) of the edge, - two vertices V1 and V2 to limit the curve (definition of the restriction of the edge), and - two real values p1 and p2 which are the parameters for the vertices V1 and V2 on the curve. The curve may be defined as a 2d curve in the parametric space of a surface: a pcurve. The surface on which the edge is built is then kept at the level of the edge. The default tolerance will be associated with this edge. Rules applied to the arguments: For the curve: - The curve must not be a 'null handle'. - If the curve is a trimmed curve the basis curve is used. For the vertices: - Vertices may be null shapes. When V1 or V2 is null the edge is open in the corresponding direction and the parameter value p1 or p2 must be infinite (remember that Precision::Infinite() defines an infinite value). - The two vertices must be identical if they have the same 3D location. Identical vertices are used in particular when the curve is closed. For the parameters: - The parameters must be in the parametric range of the curve (or the basis curve if the curve is trimmed). If this condition is not satisfied the edge is not built, and the Error function will return BRepAPI_ParameterOutOfRange. - Parameter values must not be equal. If this condition is not satisfied (i.e. if | p1 - p2 | ) the edge is not built, and the Error function will return BRepAPI_LineThroughIdenticPoints. Parameter values are expected to be given in increasing order: C->FirstParameter() - If the parameter values are given in decreasing order the vertices are switched, i.e. the 'first vertex' is on the point of parameter p2 and the 'second vertex' is on the point of parameter p1. In such a case, to keep the original intent of the construction, the edge will be oriented 'reversed'. - On a periodic curve the parameter values p1 and p2 are adjusted by adding or subtracting the period to obtain p1 in the parametric range of the curve, and p2] such that [ p1 , where Period is the period of the curve. - A parameter value may be infinite. The edge is open in the corresponding direction. However the corresponding vertex must be a null shape. If this condition is not satisfied the edge is not built, and the Error function will return BRepAPI_PointWithInfiniteParameter. - The distance between the vertex and the point evaluated on the curve with the parameter, must be lower than the precision of the vertex. If this condition is not satisfied the edge is not built, and the Error function will return BRepAPI_DifferentsPointAndParameter. Other edge constructions - The parameter values can be omitted, they will be computed by projecting the vertices on the curve. Note that projection is the only way to evaluate the parameter values of the vertices on the curve: vertices must be given on the curve, i.e. the distance from a vertex to the curve must be less than or equal to the precision of the vertex. If this condition is not satisfied the edge is not built, and the Error function will return BRepAPI_PointProjectionFailed. - 3D points can be given in place of vertices. Vertices will be created from the points (with the default topological precision Precision::Confusion()). Note: - Giving vertices is useful when creating a connected edge. - If the parameter values correspond to the extremities of a closed curve, points must be identical, or at least coincident. If this condition is not satisfied the edge is not built, and the Error function will return BRepAPI_DifferentPointsOnClosedCurve. - The vertices or points can be omitted if the parameter values are given. The points will be computed from the parameters on the curve. The vertices or points and the parameter values can be omitted. The first and last parameters of the curve will then be used. //! Auxiliary methods

	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Defines or redefines the arguments for the construction of an edge. This function is currently used after the empty constructor BRepAPI_MakeEdge().

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the edge is built.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* Returns the construction status - BRepBuilderAPI_EdgeDone if the edge is built, or - another value of the BRepBuilderAPI_EdgeError enumeration indicating the reason of construction failure.

	:rtype: BRepBuilderAPI_EdgeError
") Error;
		BRepBuilderAPI_EdgeError Error ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns the constructed edge. Exceptions StdFail_NotDone if the edge is not built.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") operator TopoDS_Edge;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Edge;
		 operator TopoDS_Edge ();
		%feature("compactdefaultargs") Vertex1;
		%feature("autodoc", "	* Returns the first vertex of the edge. May be Null.

	:rtype: TopoDS_Vertex
") Vertex1;
		const TopoDS_Vertex  Vertex1 ();
		%feature("compactdefaultargs") Vertex2;
		%feature("autodoc", "	* Returns the second vertex of the edge. May be Null. //! Warning The returned vertex in each function corresponds respectively to - the lowest, or - the highest parameter on the curve along which the edge is built. It does not correspond to the first or second vertex given at the time of the construction, if the edge is oriented reversed. Exceptions StdFail_NotDone if the edge is not built.

	:rtype: TopoDS_Vertex
") Vertex2;
		const TopoDS_Vertex  Vertex2 ();
};


%extend BRepBuilderAPI_MakeEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_MakeEdge2d;
class BRepBuilderAPI_MakeEdge2d : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Lin2d & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Lin2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Lin2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Lin2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Circ2d & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Circ2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Circ2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Circ2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Elips2d & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Elips2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Elips2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Elips2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Hypr2d & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Hypr2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Hypr2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Hypr2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Parab2d & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Parab2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Parab2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const gp_Parab2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d (const Handle_Geom2d_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* Returns the error description when NotDone.

	:rtype: BRepBuilderAPI_EdgeError
") Error;
		BRepBuilderAPI_EdgeError Error ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") operator TopoDS_Edge;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Edge;
		 operator TopoDS_Edge ();
		%feature("compactdefaultargs") Vertex1;
		%feature("autodoc", "	* Returns the first vertex of the edge. May be Null.

	:rtype: TopoDS_Vertex
") Vertex1;
		const TopoDS_Vertex  Vertex1 ();
		%feature("compactdefaultargs") Vertex2;
		%feature("autodoc", "	* Returns the second vertex of the edge. May be Null.

	:rtype: TopoDS_Vertex
") Vertex2;
		const TopoDS_Vertex  Vertex2 ();
};


%extend BRepBuilderAPI_MakeEdge2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_MakeFace;
class BRepBuilderAPI_MakeFace : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Not done.

	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace ();
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Load a face. Usefull to add wires.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const TopoDS_Face & F);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a plane.

	:param P:
	:type P: gp_Pln
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Pln & P);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a cylinder.

	:param C:
	:type C: gp_Cylinder
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cylinder & C);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a cone.

	:param C:
	:type C: gp_Cone
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cone & C);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a sphere.

	:param S:
	:type S: gp_Sphere
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Sphere & S);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a torus.

	:param C:
	:type C: gp_Torus
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Torus & C);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a Surface. Accepts tolerance value (TolDegen) for resolution of degenerated edges.

	:param S:
	:type S: Handle_Geom_Surface &
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const Handle_Geom_Surface & S,const Standard_Real TolDegen);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a plane.

	:param P:
	:type P: gp_Pln
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Pln & P,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a cylinder.

	:param C:
	:type C: gp_Cylinder
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cylinder & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a cone.

	:param C:
	:type C: gp_Cone
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cone & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a sphere.

	:param S:
	:type S: gp_Sphere
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Sphere & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a torus.

	:param C:
	:type C: gp_Torus
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Torus & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a Surface. Accepts tolerance value (TolDegen) for resolution of degenerated edges.

	:param S:
	:type S: Handle_Geom_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real TolDegen);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Find a surface from the wire and make a face. if <OnlyPlane> is true, the computed surface will be a plane. If it is not possible to find a plane, the flag NotDone will be set.

	:param W:
	:type W: TopoDS_Wire &
	:param OnlyPlane: default value is Standard_False
	:type OnlyPlane: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const TopoDS_Wire & W,const Standard_Boolean OnlyPlane = Standard_False);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a plane and a wire.

	:param P:
	:type P: gp_Pln
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Pln & P,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a cylinder and a wire.

	:param C:
	:type C: gp_Cylinder
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cylinder & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a cone and a wire.

	:param C:
	:type C: gp_Cone
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Cone & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a sphere and a wire.

	:param S:
	:type S: gp_Sphere
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Sphere & S,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a torus and a wire.

	:param C:
	:type C: gp_Torus
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const gp_Torus & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Make a face from a Surface and a wire.

	:param S:
	:type S: Handle_Geom_Surface &
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const Handle_Geom_Surface & S,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "	* Adds the wire <W> in the face <F> A general method to create a face is to give - a surface S as the support (the geometric domain) of the face, - and a wire W to bound it. The bounds of the face can also be defined by four parameter values umin, umax, vmin, vmax which determine isoparametric limitations on the parametric space of the surface. In this way, a patch is defined. The parameter values are optional. If they are omitted, the natural bounds of the surface are used. A wire is automatically built using the defined bounds. Up to four edges and four vertices are created with this wire (no edge is created when the corresponding parameter value is infinite). Wires can then be added using the function Add to define other restrictions on the face. These restrictions represent holes. More than one wire may be added by this way, provided that the wires do not cross each other and that they define only one area on the surface. (Be careful, however, as this is not checked). Forbidden addition of wires Note that in this schema, the third case is valid if edges of the wire W are declared internal to the face. As a result, these edges are no longer bounds of the face. A default tolerance (Precision::Confusion()) is given to the face, this tolerance may be increased during construction of the face using various algorithms. Rules applied to the arguments For the surface: - The surface must not be a 'null handle'. - If the surface is a trimmed surface, the basis surface is used. - For the wire: the wire is composed of connected edges, each edge having a parametric curve description in the parametric domain of the surface; in other words, as a pcurve. For the parameters: - The parameter values must be in the parametric range of the surface (or the basis surface, if the surface is trimmed). If this condition is not satisfied, the face is not built, and the Error function will return BRepBuilderAPI_ParametersOutOfRange. - The bounding parameters p1 and p2 are adjusted on a periodic surface in a given parametric direction by adding or subtracting the period to obtain p1 in the parametric range of the surface and such p2, that p2 - p1 <= Period, where Period is the period of the surface in this parametric direction. - A parameter value may be infinite. There will be no edge and no vertex in the corresponding direction.

	:param F:
	:type F: TopoDS_Face &
	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace (const TopoDS_Face & F,const TopoDS_Wire & W);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes (or reinitializes) the construction of a face by creating a new object which is a copy of the face F, in order to add wires to it, using the function Add. Note: this complete copy of the geometry is only required if you want to work on the geometries of the two faces independently.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes (or reinitializes) the construction of a face on the surface S. If Bound is true, a wire is automatically created from the natural bounds of the surface S and added to the face in order to bound it. If Bound is false, no wire is added. This option is used when real bounds are known. These will be added to the face after this initialization, using the function Add. TolDegen parameter is used for resolution of degenerated edges if calculation of natural bounds is turned on.

	:param S:
	:type S: Handle_Geom_Surface &
	:param Bound:
	:type Bound: bool
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Boolean Bound,const Standard_Real TolDegen);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes (or reinitializes) the construction of a face on the surface S, limited in the u parametric direction by the two parameter values UMin and UMax and in the v parametric direction by the two parameter values VMin and VMax. Warning Error returns: - BRepBuilderAPI_ParametersOutOfRange when the parameters given are outside the bounds of the surface or the basis surface of a trimmed surface. TolDegen parameter is used for resolution of degenerated edges.

	:param S:
	:type S: Handle_Geom_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real TolDegen);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the wire W to the constructed face as a hole. Warning W must not cross the other bounds of the face, and all the bounds must define only one area on the surface. (Be careful, however, as this is not checked.) Example // a cylinder gp_Cylinder C = ..; // a wire TopoDS_Wire W = ...; BRepBuilderAPI_MakeFace MF(C); MF.Add(W); TopoDS_Face F = MF;

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") Add;
		void Add (const TopoDS_Wire & W);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if this algorithm has a valid face.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* Returns the construction status BRepBuilderAPI_FaceDone if the face is built, or - another value of the BRepBuilderAPI_FaceError enumeration indicating why the construction failed, in particular when the given parameters are outside the bounds of the surface.

	:rtype: BRepBuilderAPI_FaceError
") Error;
		BRepBuilderAPI_FaceError Error ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns the constructed face. Exceptions StdFail_NotDone if no face is built.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") operator TopoDS_Face;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Face;
		 operator TopoDS_Face ();
};


%extend BRepBuilderAPI_MakeFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_MakePolygon;
class BRepBuilderAPI_MakePolygon : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	* Initializes an empty polygonal wire, to which points or vertices are added using the Add function. As soon as the polygonal wire under construction contains vertices, it can be consulted using the Wire function.

	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon ();
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const Standard_Boolean Close = Standard_False);
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	* Constructs a polygonal wire from 2, 3 or 4 points. Vertices are automatically created on the given points. The polygonal wire is closed if Close is true; otherwise it is open. Further vertices can be added using the Add function. The polygonal wire under construction can be consulted at any time by using the Wire function. Example //an open polygon from four points TopoDS_Wire W = BRepBuilderAPI_MakePolygon(P1,P2,P3,P4); Warning: The process is equivalent to: - initializing an empty polygonal wire, - and adding the given points in sequence. Consequently, be careful when using this function: if the sequence of points p1 - p2 - p1 is found among the arguments of the constructor, you will create a polygonal wire with two consecutive coincident edges.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param P4:
	:type P4: gp_Pnt
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & P4,const Standard_Boolean Close = Standard_False);
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param V3:
	:type V3: TopoDS_Vertex &
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const TopoDS_Vertex & V3,const Standard_Boolean Close = Standard_False);
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	* Constructs a polygonal wire from 2, 3 or 4 vertices. The polygonal wire is closed if Close is true; otherwise it is open (default value). Further vertices can be added using the Add function. The polygonal wire under construction can be consulted at any time by using the Wire function. Example //a closed triangle from three vertices TopoDS_Wire W = BRepBuilderAPI_MakePolygon(V1,V2,V3,Standard_True); Warning The process is equivalent to: - initializing an empty polygonal wire, - then adding the given points in sequence. So be careful, as when using this function, you could create a polygonal wire with two consecutive coincident edges if the sequence of vertices v1 - v2 - v1 is found among the constructor's arguments.

	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param V3:
	:type V3: TopoDS_Vertex &
	:param V4:
	:type V4: TopoDS_Vertex &
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const TopoDS_Vertex & V3,const TopoDS_Vertex & V4,const Standard_Boolean Close = Standard_False);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Add;
		void Add (const gp_Pnt & P);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the point P or the vertex V at the end of the polygonal wire under construction. A vertex is automatically created on the point P. Warning - When P or V is coincident to the previous vertex, no edge is built. The method Added can be used to test for this. Neither P nor V is checked to verify that it is coincident with another vertex than the last one, of the polygonal wire under construction. It is also possible to add vertices on a closed polygon (built for example by using a constructor which declares the polygon closed, or after the use of the Close function). Consequently, be careful using this function: you might create: - a polygonal wire with two consecutive coincident edges, or - a non manifold polygonal wire. - P or V is not checked to verify if it is coincident with another vertex but the last one, of the polygonal wire under construction. It is also possible to add vertices on a closed polygon (built for example by using a constructor which declares the polygon closed, or after the use of the Close function). Consequently, be careful when using this function: you might create: - a polygonal wire with two consecutive coincident edges, or - a non-manifold polygonal wire.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") Add;
		void Add (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* Returns true if the last vertex added to the constructed polygonal wire is not coincident with the previous one.

	:rtype: bool
") Added;
		Standard_Boolean Added ();
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "	* Closes the polygonal wire under construction. Note - this is equivalent to adding the first vertex to the polygonal wire under construction.

	:rtype: None
") Close;
		void Close ();
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") FirstVertex;
		const TopoDS_Vertex  FirstVertex ();
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "	* Returns the first or the last vertex of the polygonal wire under construction. If the constructed polygonal wire is closed, the first and the last vertices are identical.

	:rtype: TopoDS_Vertex
") LastVertex;
		const TopoDS_Vertex  LastVertex ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if this algorithm contains a valid polygonal wire (i.e. if there is at least one edge). IsDone returns false if fewer than two vertices have been chained together by this construction algorithm.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns the edge built between the last two points or vertices added to the constructed polygonal wire under construction. Warning If there is only one vertex in the polygonal wire, the result is a null edge.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") operator TopoDS_Edge;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Edge;
		 operator TopoDS_Edge ();
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	* Returns the constructed polygonal wire, or the already built part of the polygonal wire under construction. Exceptions StdFail_NotDone if the wire is not built, i.e. if fewer than two vertices have been chained together by this construction algorithm.

	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire  Wire ();
		%feature("compactdefaultargs") operator TopoDS_Wire;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Wire;
		 operator TopoDS_Wire ();
};


%extend BRepBuilderAPI_MakePolygon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_MakeShell;
class BRepBuilderAPI_MakeShell : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "	* Constructs an empty shell framework. The Init function is used to define the construction arguments. Warning The function Error will return BRepBuilderAPI_EmptyShell if it is called before the function Init.

	:rtype: None
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell ();
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "	* Constructs a shell from the surface S.

	:param S:
	:type S: Handle_Geom_Surface &
	:param Segment: default value is Standard_False
	:type Segment: bool
	:rtype: None
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell (const Handle_Geom_Surface & S,const Standard_Boolean Segment = Standard_False);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "	* Constructs a shell from the surface S, limited in the u parametric direction by the two parameter values UMin and UMax, and limited in the v parametric direction by the two parameter values VMin and VMax.

	:param S:
	:type S: Handle_Geom_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Segment: default value is Standard_False
	:type Segment: bool
	:rtype: None
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Boolean Segment = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Defines or redefines the arguments for the construction of a shell. The construction is initialized with the surface S, limited in the u parametric direction by the two parameter values UMin and UMax, and in the v parametric direction by the two parameter values VMin and VMax. Warning The function Error returns: - BRepBuilderAPI_ShellParametersOutOfRange when the given parameters are outside the bounds of the surface or the basis surface if S is trimmed

	:param S:
	:type S: Handle_Geom_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Segment: default value is Standard_False
	:type Segment: bool
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Boolean Segment = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the shell is built.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* Returns the construction status: - BRepBuilderAPI_ShellDone if the shell is built, or - another value of the BRepBuilderAPI_ShellError enumeration indicating why the construction failed. This is frequently BRepBuilderAPI_ShellParametersOutOfRange indicating that the given parameters are outside the bounds of the surface.

	:rtype: BRepBuilderAPI_ShellError
") Error;
		BRepBuilderAPI_ShellError Error ();
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	* Returns the new Shell.

	:rtype: TopoDS_Shell
") Shell;
		const TopoDS_Shell  Shell ();
		%feature("compactdefaultargs") operator TopoDS_Shell;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Shell;
		 operator TopoDS_Shell ();
};


%extend BRepBuilderAPI_MakeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_MakeSolid;
class BRepBuilderAPI_MakeSolid : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "	* Initializes the construction of a solid. An empty solid is considered to cover the whole space. The Add function is used to define shells to bound it.

	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid ();
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "	* Make a solid from a CompSolid.

	:param S:
	:type S: TopoDS_CompSolid &
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_CompSolid & S);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "	* Make a solid from a shell.

	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_Shell & S);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "	* Make a solid from two shells.

	:param S1:
	:type S1: TopoDS_Shell &
	:param S2:
	:type S2: TopoDS_Shell &
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_Shell & S1,const TopoDS_Shell & S2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "	* Make a solid from three shells. Constructs a solid - covering the whole space, or - from shell S, or - from two shells S1 and S2, or - from three shells S1, S2 and S3, or Warning No check is done to verify the conditions of coherence of the resulting solid. In particular, S1, S2 (and S3) must not intersect each other. Besides, after all shells have been added using the Add function, one of these shells should constitute the outside skin of the solid; it may be closed (a finite solid) or open (an infinite solid). Other shells form hollows (cavities) in these previous ones. Each must bound a closed volume.

	:param S1:
	:type S1: TopoDS_Shell &
	:param S2:
	:type S2: TopoDS_Shell &
	:param S3:
	:type S3: TopoDS_Shell &
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_Shell & S1,const TopoDS_Shell & S2,const TopoDS_Shell & S3);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "	* Make a solid from a solid. Usefull for adding later.

	:param So:
	:type So: TopoDS_Solid &
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_Solid & So);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "	* Add a shell to a solid. //! Constructs a solid: - from the solid So, to which shells can be added, or - by adding the shell S to the solid So. Warning No check is done to verify the conditions of coherence of the resulting solid. In particular S must not intersect the solid S0. Besides, after all shells have been added using the Add function, one of these shells should constitute the outside skin of the solid. It may be closed (a finite solid) or open (an infinite solid). Other shells form hollows (cavities) in the previous ones. Each must bound a closed volume.

	:param So:
	:type So: TopoDS_Solid &
	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid (const TopoDS_Solid & So,const TopoDS_Shell & S);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the shell to the current solid. Warning No check is done to verify the conditions of coherence of the resulting solid. In particular, S must not intersect other shells of the solid under construction. Besides, after all shells have been added, one of these shells should constitute the outside skin of the solid. It may be closed (a finite solid) or open (an infinite solid). Other shells form hollows (cavities) in these previous ones. Each must bound a closed volume.

	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") Add;
		void Add (const TopoDS_Shell & S);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the solid is built. For this class, a solid under construction is always valid. If no shell has been added, it could be a whole-space solid. However, no check was done to verify the conditions of coherence of the resulting solid.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "	* Returns the new Solid.

	:rtype: TopoDS_Solid
") Solid;
		const TopoDS_Solid  Solid ();
		%feature("compactdefaultargs") operator TopoDS_Solid;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Solid;
		 operator TopoDS_Solid ();
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);
};


%extend BRepBuilderAPI_MakeSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_MakeVertex;
class BRepBuilderAPI_MakeVertex : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_MakeVertex;
		%feature("autodoc", "	* Constructs a vertex from point P. Example create a vertex from a 3D point. gp_Pnt P(0,0,10); TopoDS_Vertex V = BRepBuilderAPI_MakeVertex(P);

	:param P:
	:type P: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeVertex;
		 BRepBuilderAPI_MakeVertex (const gp_Pnt & P);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the constructed vertex.

	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
		%feature("compactdefaultargs") operator TopoDS_Vertex;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Vertex;
		 operator TopoDS_Vertex ();
};


%extend BRepBuilderAPI_MakeVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_MakeWire;
class BRepBuilderAPI_MakeWire : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "	* Constructs an empty wire framework, to which edges are added using the Add function. As soon as the wire contains one edge, it can return with the use of the function Wire. Warning The function Error will return BRepBuilderAPI_EmptyWire if it is called before at least one edge is added to the wire under construction.

	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire ();
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "	* Make a Wire from an edge.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Edge & E);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "	* Make a Wire from two edges.

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "	* Make a Wire from three edges.

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param E3:
	:type E3: TopoDS_Edge &
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Edge & E3);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "	* Make a Wire from four edges. Constructs a wire - from the TopoDS_Wire W composed of the edge E, or - from edge E, or - from two edges E1 and E2, or - from three edges E1, E2 and E3, or - from four edges E1, E2, E3 and E4. Further edges can be added using the function Add. Given edges are added in a sequence. Each of them must be connectable to the wire under construction, and so must satisfy the following condition (unless it is the first edge of the wire): one of its vertices must be geometrically coincident with one of the vertices of the wire (provided that the highest tolerance factor is assigned to the two vertices). It could also be the same vertex. Warning If an edge is not connectable to the wire under construction it is not added. The function Error will return BRepBuilderAPI_DisconnectedWire, the function IsDone will return false and the function Wire will raise an error, until a new connectable edge is added.

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param E3:
	:type E3: TopoDS_Edge &
	:param E4:
	:type E4: TopoDS_Edge &
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Edge & E3,const TopoDS_Edge & E4);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "	* Make a Wire from a Wire. Usefull for adding later.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Wire & W);
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "	* Add an edge to a wire.

	:param W:
	:type W: TopoDS_Wire &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire (const TopoDS_Wire & W,const TopoDS_Edge & E);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the edge E to the wire under construction. E must be connectable to the wire under construction, and, unless it is the first edge of the wire, must satisfy the following condition: one of its vertices must be geometrically coincident with one of the vertices of the wire (provided that the highest tolerance factor is assigned to the two vertices). It could also be the same vertex. Warning If E is not connectable to the wire under construction it is not added. The function Error will return BRepBuilderAPI_DisconnectedWire, the function IsDone will return false and the function Wire will raise an error, until a new connectable edge is added.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Add the edges of <W> to the current wire.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") Add;
		void Add (const TopoDS_Wire & W);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the edges of <L> to the current wire. The edges are not to be consecutive. But they are to be all connected geometrically or topologically. If some of them are not connected the Status give DisconnectedWire but the 'Maker' is Done() and you can get the partial result. (ie connected to the first edgeof the list <L>)

	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") Add;
		void Add (const TopTools_ListOfShape & L);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if this algorithm contains a valid wire. IsDone returns false if: - there are no edges in the wire, or - the last edge which you tried to add was not connectable.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* Returns the construction status - BRepBuilderAPI_WireDone if the wire is built, or - another value of the BRepBuilderAPI_WireError enumeration indicating why the construction failed.

	:rtype: BRepBuilderAPI_WireError
") Error;
		BRepBuilderAPI_WireError Error ();
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	* Returns the constructed wire; or the part of the wire under construction already built. Exceptions StdFail_NotDone if a wire is not built.

	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire  Wire ();
		%feature("compactdefaultargs") operator TopoDS_Wire;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Wire;
		 operator TopoDS_Wire ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns the last edge added to the wire under construction. Warning - This edge can be different from the original one (the argument of the function Add, for instance,) - A null edge is returned if there are no edges in the wire under construction, or if the last edge which you tried to add was not connectable..

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the last vertex of the last edge added to the wire under construction. Warning A null vertex is returned if there are no edges in the wire under construction, or if the last edge which you tried to add was not connectableR

	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
};


%extend BRepBuilderAPI_MakeWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_ModifyShape;
class BRepBuilderAPI_ModifyShape : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the list of shapes modified from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "	* Returns the modified shape corresponding to <S>. S can correspond to the entire initial shape or to its subshape. Exceptions Standard_NoSuchObject if S is not the initial shape or a subshape of the initial shape to which the transformation has been applied. Raises NoSuchObject from Standard if S is not the initial shape or a sub-shape of the initial shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape (const TopoDS_Shape & S);
};


%extend BRepBuilderAPI_ModifyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_Copy;
class BRepBuilderAPI_Copy : public BRepBuilderAPI_ModifyShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_Copy;
		%feature("autodoc", "	* Constructs an empty copy framework. Use the function Perform to copy shapes.

	:rtype: None
") BRepBuilderAPI_Copy;
		 BRepBuilderAPI_Copy ();
		%feature("compactdefaultargs") BRepBuilderAPI_Copy;
		%feature("autodoc", "	* Constructs a copy framework and copies the shape S. Use the function Shape to access the result. If copyMesh is True, triangulation contained in original shape will be copied along with geometry (by default, triangulation gets lost). If copyGeom is False, only topological objects will be copied, while geometry and triangulation will be shared with original shape. Note: the constructed framework can be reused to copy other shapes: just specify them with the function Perform.

	:param S:
	:type S: TopoDS_Shape &
	:param copyGeom: default value is Standard_True
	:type copyGeom: bool
	:param copyMesh: default value is Standard_False
	:type copyMesh: bool
	:rtype: None
") BRepBuilderAPI_Copy;
		 BRepBuilderAPI_Copy (const TopoDS_Shape & S,const Standard_Boolean copyGeom = Standard_True,const Standard_Boolean copyMesh = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Copies the shape S. Use the function Shape to access the result. If copyMesh is True, triangulation contained in original shape will be copied along with geometry (by default, triangulation gets lost). If copyGeom is False, only topological objects will be copied, while geometry and triangulation will be shared with original shape.

	:param S:
	:type S: TopoDS_Shape &
	:param copyGeom: default value is Standard_True
	:type copyGeom: bool
	:param copyMesh: default value is Standard_False
	:type copyMesh: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Boolean copyGeom = Standard_True,const Standard_Boolean copyMesh = Standard_False);
};


%extend BRepBuilderAPI_Copy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_GTransform;
class BRepBuilderAPI_GTransform : public BRepBuilderAPI_ModifyShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_GTransform;
		%feature("autodoc", "	* Constructs a framework for applying the geometric transformation T to a shape. Use the function Perform to define the shape to transform.

	:param T:
	:type T: gp_GTrsf
	:rtype: None
") BRepBuilderAPI_GTransform;
		 BRepBuilderAPI_GTransform (const gp_GTrsf & T);
		%feature("compactdefaultargs") BRepBuilderAPI_GTransform;
		%feature("autodoc", "	* Constructs a framework for applying the geometric transformation T to a shape, and applies it to the shape S. - If the transformation T is direct and isometric (i.e. if the determinant of the vectorial part of T is equal to 1.), and if Copy equals false (default value), the resulting shape is the same as the original but with a new location assigned to it. - In all other cases, the transformation is applied to a duplicate of S. Use the function Shape to access the result. Note: the constructed framework can be reused to apply the same geometric transformation to other shapes: just specify them with the function Perform.

	:param S:
	:type S: TopoDS_Shape &
	:param T:
	:type T: gp_GTrsf
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") BRepBuilderAPI_GTransform;
		 BRepBuilderAPI_GTransform (const TopoDS_Shape & S,const gp_GTrsf & T,const Standard_Boolean Copy = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Applies the geometric transformation defined at the time of construction of this framework to the shape S. - If the transformation T is direct and isometric (i.e. if the determinant of the vectorial part of T is equal to 1.), and if Copy equals false (default value), the resulting shape is the same as the original but with a new location assigned to it. - In all other cases, the transformation is applied to a duplicate of S. Use the function Shape to access the result. Note: this framework can be reused to apply the same geometric transformation to other shapes: just specify them by calling the function Perform again.

	:param S:
	:type S: TopoDS_Shape &
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Boolean Copy = Standard_False);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the list of shapes modified from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "	* Returns the modified shape corresponding to <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape (const TopoDS_Shape & S);
};


%extend BRepBuilderAPI_GTransform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_NurbsConvert;
class BRepBuilderAPI_NurbsConvert : public BRepBuilderAPI_ModifyShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_NurbsConvert;
		%feature("autodoc", "	* Constructs a framework for converting the geometry of a shape into NURBS geometry. Use the function Perform to define the shape to convert.

	:rtype: None
") BRepBuilderAPI_NurbsConvert;
		 BRepBuilderAPI_NurbsConvert ();
		%feature("compactdefaultargs") BRepBuilderAPI_NurbsConvert;
		%feature("autodoc", "	* Builds a new shape by converting the geometry of the shape S into NURBS geometry. Specifically, all curves supporting edges of S are converted into BSpline curves, and all surfaces supporting its faces are converted into BSpline surfaces. Use the function Shape to access the new shape. Note: the constructed framework can be reused to convert other shapes. You specify these with the function Perform.

	:param S:
	:type S: TopoDS_Shape &
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") BRepBuilderAPI_NurbsConvert;
		 BRepBuilderAPI_NurbsConvert (const TopoDS_Shape & S,const Standard_Boolean Copy = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Builds a new shape by converting the geometry of the shape S into NURBS geometry. Specifically, all curves supporting edges of S are converted into BSpline curves, and all surfaces supporting its faces are converted into BSpline surfaces. Use the function Shape to access the new shape. Note: this framework can be reused to convert other shapes: you specify them by calling the function Perform again.

	:param S:
	:type S: TopoDS_Shape &
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Boolean Copy = Standard_False);
};


%extend BRepBuilderAPI_NurbsConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepBuilderAPI_Transform;
class BRepBuilderAPI_Transform : public BRepBuilderAPI_ModifyShape {
	public:
		%feature("compactdefaultargs") BRepBuilderAPI_Transform;
		%feature("autodoc", "	* Constructs a framework for applying the geometric transformation T to a shape. Use the function Perform to define the shape to transform.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") BRepBuilderAPI_Transform;
		 BRepBuilderAPI_Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") BRepBuilderAPI_Transform;
		%feature("autodoc", "	* Creates a transformation from the gp_Trsf <T>, and applies it to the shape <S>. If the transformation is direct and isometric (determinant = 1) and <Copy> = Standard_False, the resulting shape is <S> on which a new location has been set. Otherwise, the transformation is applied on a duplication of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:param T:
	:type T: gp_Trsf
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") BRepBuilderAPI_Transform;
		 BRepBuilderAPI_Transform (const TopoDS_Shape & S,const gp_Trsf & T,const Standard_Boolean Copy = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* pplies the geometric transformation defined at the time of construction of this framework to the shape S. - If the transformation T is direct and isometric, in other words, if the determinant of the vectorial part of T is equal to 1., and if Copy equals false (the default value), the resulting shape is the same as the original but with a new location assigned to it. - In all other cases, the transformation is applied to a duplicate of S. Use the function Shape to access the result. Note: this framework can be reused to apply the same geometric transformation to other shapes. You only need to specify them by calling the function Perform again.

	:param S:
	:type S: TopoDS_Shape &
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Boolean Copy = Standard_False);
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "	* Returns the modified shape corresponding to <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the list of shapes modified from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
};


%extend BRepBuilderAPI_Transform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
