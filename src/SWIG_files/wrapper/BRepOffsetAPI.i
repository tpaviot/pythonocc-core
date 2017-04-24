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
%module (package="OCC") BRepOffsetAPI

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


%include BRepOffsetAPI_headers.i


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
typedef BRepBuilderAPI_Sewing BRepOffsetAPI_Sewing;
typedef Handle_BRepBuilderAPI_Sewing Handle_BRepOffsetAPI_Sewing;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepOffsetAPI_DraftAngle;
class BRepOffsetAPI_DraftAngle : public BRepBuilderAPI_ModifyShape {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_DraftAngle;
		%feature("autodoc", "	* Constructs an empty algorithm to perform taper-adding transformations on faces of a shape. Use the Init function to define the shape to be tapered.

	:rtype: None
") BRepOffsetAPI_DraftAngle;
		 BRepOffsetAPI_DraftAngle ();
		%feature("compactdefaultargs") BRepOffsetAPI_DraftAngle;
		%feature("autodoc", "	* Initializes an algorithm to perform taper-adding transformations on faces of the shape S. S will be referred to as the initial shape of the algorithm.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") BRepOffsetAPI_DraftAngle;
		 BRepOffsetAPI_DraftAngle (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Cancels the results of all taper-adding transformations performed by this algorithm on the initial shape. These results will have been defined by successive calls to the function Add.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes, or reinitializes this taper-adding algorithm with the shape S. S will be referred to as the initial shape of this algorithm.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the face F, the direction Direction, the angle Angle, the plane NeutralPlane, and the flag Flag to the framework created at construction time, and with this data, defines the taper-adding transformation. F is a face, which belongs to the initial shape of this algorithm or to the shape loaded by the function Init. Only planar, cylindrical or conical faces can be tapered: - If the face F is planar, it is tapered by inclining it through the angle Angle about the line of intersection between the plane NeutralPlane and F. Direction indicates the side of NeutralPlane from which matter is removed if Angle is positive or added if Angle is negative. - If F is cylindrical or conical, it is transformed in the same way on a single face, resulting in a conical face if F is cylindrical, and a conical or cylindrical face if it is already conical. The taper-adding transformation is propagated from the face F along the series of planar, cylindrical or conical faces containing F, which are tangential to one another. Use the function AddDone to check if this taper-adding transformation is successful. Warning Nothing is done if: - the face F does not belong to the initial shape of this algorithm, or - the face F is not planar, cylindrical or conical. Exceptions - Standard_NullObject if the initial shape is not defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the Init function. - Standard_ConstructionError if the previous call to Add has failed. The function AddDone ought to have been used to check for this, and the function Remove to cancel the results of the unsuccessful taper-adding transformation and to retrieve the previous shape.

	:param F:
	:type F: TopoDS_Face &
	:param Direction:
	:type Direction: gp_Dir
	:param Angle:
	:type Angle: float
	:param NeutralPlane:
	:type NeutralPlane: gp_Pln
	:param Flag: default value is Standard_True
	:type Flag: bool
	:rtype: None
") Add;
		void Add (const TopoDS_Face & F,const gp_Dir & Direction,const Standard_Real Angle,const gp_Pln & NeutralPlane,const Standard_Boolean Flag = Standard_True);
		%feature("compactdefaultargs") AddDone;
		%feature("autodoc", "	* Returns true if the previous taper-adding transformation performed by this algorithm in the last call to Add, was successful. If AddDone returns false: - the function ProblematicShape returns the face on which the error occurred, - the function Remove has to be used to cancel the results of the unsuccessful taper-adding transformation and to retrieve the previous shape. Exceptions Standard_NullObject if the initial shape has not been defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the .Init function.

	:rtype: bool
") AddDone;
		Standard_Boolean AddDone ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Cancels the taper-adding transformation previously performed by this algorithm on the face F and the series of tangential faces which contain F, and retrieves the shape before the last taper-adding transformation. Warning You will have to use this function if the previous call to Add fails. Use the function AddDone to check it. Exceptions - Standard_NullObject if the initial shape has not been defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the Init function. - Standard_NoSuchObject if F has not been added or has already been removed.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Remove;
		void Remove (const TopoDS_Face & F);
		%feature("compactdefaultargs") ProblematicShape;
		%feature("autodoc", "	* Returns the shape on which an error occurred after an unsuccessful call to Add or when IsDone returns false. Exceptions Standard_NullObject if the initial shape has not been defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the Init function.

	:rtype: TopoDS_Shape
") ProblematicShape;
		const TopoDS_Shape  ProblematicShape ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns an error status when an error has occured (Face, Edge or Vertex recomputaion problem). Otherwise returns Draft_NoError. The method may be called if AddDone returns Standard_False, or when IsDone returns Standard_False.

	:rtype: Draft_ErrorStatus
") Status;
		Draft_ErrorStatus Status ();
		%feature("compactdefaultargs") ConnectedFaces;
		%feature("autodoc", "	* Returns all the faces which have been added together with the face <F>.

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") ConnectedFaces;
		const TopTools_ListOfShape & ConnectedFaces (const TopoDS_Face & F);
		%feature("compactdefaultargs") ModifiedFaces;
		%feature("autodoc", "	* Returns all the faces on which a modification has been given.

	:rtype: TopTools_ListOfShape
") ModifiedFaces;
		const TopTools_ListOfShape & ModifiedFaces ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting shape (redefined from MakeShape).

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") CorrectWires;
		%feature("autodoc", "	:rtype: None
") CorrectWires;
		void CorrectWires ();
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
};


%extend BRepOffsetAPI_DraftAngle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_FindContigousEdges;
class BRepOffsetAPI_FindContigousEdges {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_FindContigousEdges;
		%feature("autodoc", "	* Initializes an algorithm for identifying contiguous edges on shapes with tolerance as the tolerance of contiguity (defaulted to 1.0e-6). This tolerance value is used to determine whether two edges or sections of edges are coincident. Use the function Add to define the shapes to be checked. Set option to false. This argument (defaulted to true) will serve in subsequent software releases for performing an analysis of degenerated shapes.

	:param tolerance: default value is 1.0e-06
	:type tolerance: float
	:param option: default value is Standard_True
	:type option: bool
	:rtype: None
") BRepOffsetAPI_FindContigousEdges;
		 BRepOffsetAPI_FindContigousEdges (const Standard_Real tolerance = 1.0e-06,const Standard_Boolean option = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes this algorithm for identifying contiguous edges on shapes using the tolerance of contiguity tolerance. This tolerance value is used to determine whether two edges or sections of edges are coincident. Use the function Add to define the shapes to be checked. Sets <option> to false.

	:param tolerance:
	:type tolerance: float
	:param option:
	:type option: bool
	:rtype: None
") Init;
		void Init (const Standard_Real tolerance,const Standard_Boolean option);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the shape shape to the list of shapes to be checked by this algorithm. Once all the shapes to be checked have been added, use the function Perform to find the contiguous edges and the function ContigousEdge to return these edges.

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Finds coincident parts of edges of two or more shapes added to this algorithm and breaks down these edges into contiguous and non-contiguous sections on copies of the initial shapes. The function ContigousEdge returns contiguous edges. The function Modified can be used to return modified copies of the initial shapes where one or more edges were broken down into contiguous and non-contiguous sections. Warning This function must be used once all the shapes to be checked have been added. It is not possible to add further shapes subsequently and then to repeat the call to Perform.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") NbContigousEdges;
		%feature("autodoc", "	* Returns the number of contiguous edges found by the function Perform on the shapes added to this algorithm.

	:rtype: int
") NbContigousEdges;
		Standard_Integer NbContigousEdges ();
		%feature("compactdefaultargs") ContigousEdge;
		%feature("autodoc", "	* Returns the contiguous edge of index index found by the function Perform on the shapes added to this algorithm. Exceptions Standard_OutOfRange if: - index is less than 1, or - index is greater than the number of contiguous edges found by the function Perform on the shapes added to this algorithm.

	:param index:
	:type index: int
	:rtype: TopoDS_Edge
") ContigousEdge;
		const TopoDS_Edge  ContigousEdge (const Standard_Integer index);
		%feature("compactdefaultargs") ContigousEdgeCouple;
		%feature("autodoc", "	* Returns a list of edges coincident with the contiguous edge of index index found by the function Perform. There are as many edges in the list as there are faces adjacent to this contiguous edge. Exceptions Standard_OutOfRange if: - index is less than 1, or - index is greater than the number of contiguous edges found by the function Perform on the shapes added to this algorithm.

	:param index:
	:type index: int
	:rtype: TopTools_ListOfShape
") ContigousEdgeCouple;
		const TopTools_ListOfShape & ContigousEdgeCouple (const Standard_Integer index);
		%feature("compactdefaultargs") SectionToBoundary;
		%feature("autodoc", "	* Returns the edge on the initial shape, of which the modified copy contains the edge section. section is coincident with a contiguous edge found by the function Perform. Use the function ContigousEdgeCouple to obtain a valid section. This information is useful for verification purposes, since it provides a means of determining the surface to which the contiguous edge belongs. Exceptions Standard_NoSuchObject if section is not coincident with a contiguous edge. Use the function ContigousEdgeCouple to obtain a valid section.

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
		%feature("autodoc", "	* Gives a degenerated shape

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
		%feature("autodoc", "	* Returns true if the copy of the initial shape shape was modified by the function Perform (i.e. if one or more of its edges was broken down into contiguous and non-contiguous sections). Warning Returns false if shape is not one of the initial shapes added to this algorithm.

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: bool
") IsModified;
		Standard_Boolean IsModified (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Gives a modifieded shape Raises NoSuchObject if shape has not been modified

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Modified;
		const TopoDS_Shape  Modified (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump properties of resulting shape.

	:rtype: None
") Dump;
		void Dump ();
};


%extend BRepOffsetAPI_FindContigousEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_MakeDraft;
class BRepOffsetAPI_MakeDraft : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_MakeDraft;
		%feature("autodoc", "	* Constructs the draft surface object defined by the shape Shape, the direction Dir, and the angle Angle. Shape must be a TopoDS_Wire, Topo_DS_Face or TopoDS_Shell with free boundaries. Exceptions Standard_NotDone if Shape is not a TopoDS_Wire, Topo_DS_Face or TopoDS_Shell with free boundaries.

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Dir:
	:type Dir: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None
") BRepOffsetAPI_MakeDraft;
		 BRepOffsetAPI_MakeDraft (const TopoDS_Shape & Shape,const gp_Dir & Dir,const Standard_Real Angle);
		%feature("compactdefaultargs") SetOptions;
		%feature("autodoc", "	* Sets the options of this draft tool. If a transition has to be performed, it can be defined by the mode Style as RightCorner or RoundCorner, RightCorner being a corner defined by a sharp angle, and RoundCorner being a rounded corner. AngleMin is an angular tolerance used to detect whether a transition has to be performed or not. AngleMax sets the maximum value within which a RightCorner transition can be performed. AngleMin and AngleMax are expressed in radians.

	:param Style: default value is BRepBuilderAPI_RightCorner
	:type Style: BRepBuilderAPI_TransitionMode
	:param AngleMin: default value is 0.01
	:type AngleMin: float
	:param AngleMax: default value is 3.0
	:type AngleMax: float
	:rtype: None
") SetOptions;
		void SetOptions (const BRepBuilderAPI_TransitionMode Style = BRepBuilderAPI_RightCorner,const Standard_Real AngleMin = 0.01,const Standard_Real AngleMax = 3.0);
		%feature("compactdefaultargs") SetDraft;
		%feature("autodoc", "	* Sets the direction of the draft for this object. If IsInternal is true, the draft is internal to the argument Shape used in the constructor.

	:param IsInternal: default value is Standard_False
	:type IsInternal: bool
	:rtype: None
") SetDraft;
		void SetDraft (const Standard_Boolean IsInternal = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the draft using the length LengthMax as the maximum length for the corner edge between two draft faces.

	:param LengthMax:
	:type LengthMax: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real LengthMax);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the draft up to the surface Surface. If KeepInsideSurface is true, the part of Surface inside the draft is kept in the result.

	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param KeepInsideSurface: default value is Standard_True
	:type KeepInsideSurface: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom_Surface & Surface,const Standard_Boolean KeepInsideSurface = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the draft up to the shape StopShape. If KeepOutSide is true, the part of StopShape which is outside the Draft is kept in the result.

	:param StopShape:
	:type StopShape: TopoDS_Shape &
	:param KeepOutSide: default value is Standard_True
	:type KeepOutSide: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & StopShape,const Standard_Boolean KeepOutSide = Standard_True);
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	* Returns the shell resulting from performance of the draft along the wire.

	:rtype: TopoDS_Shell
") Shell;
		TopoDS_Shell Shell ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
};


%extend BRepOffsetAPI_MakeDraft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_MakeEvolved;
class BRepOffsetAPI_MakeEvolved : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_MakeEvolved;
		%feature("autodoc", "	:rtype: None
") BRepOffsetAPI_MakeEvolved;
		 BRepOffsetAPI_MakeEvolved ();
		%feature("compactdefaultargs") BRepOffsetAPI_MakeEvolved;
		%feature("autodoc", "	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Profil:
	:type Profil: TopoDS_Wire &
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param AxeProf: default value is Standard_True
	:type AxeProf: bool
	:param Solid: default value is Standard_False
	:type Solid: bool
	:param ProfOnSpine: default value is Standard_False
	:type ProfOnSpine: bool
	:param Tol: default value is 0.0000001
	:type Tol: float
	:rtype: None
") BRepOffsetAPI_MakeEvolved;
		 BRepOffsetAPI_MakeEvolved (const TopoDS_Wire & Spine,const TopoDS_Wire & Profil,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean AxeProf = Standard_True,const Standard_Boolean Solid = Standard_False,const Standard_Boolean ProfOnSpine = Standard_False,const Standard_Real Tol = 0.0000001);
		%feature("compactdefaultargs") BRepOffsetAPI_MakeEvolved;
		%feature("autodoc", "	* These constructors construct an evolved shape by sweeping the profile Profile along the spine Spine. The profile is defined in a coordinate system R. The coordinate system is determined by AxeProf: - if AxeProf is true, R is the global coordinate system, - if AxeProf is false, R is computed so that: - its origin is given by the point on the spine which is closest to the profile, - its 'X Axis' is given by the tangent to the spine at this point, and - its 'Z Axis' is the normal to the plane which contains the spine. The position of the profile at the current point of the spine is given by making R coincident with the local coordinate system given by the current point, the tangent vector and the normal to the spine. Join defines the type of pipe generated by the salient vertices of the spine. The default type is GeomAbs_Arc where the vertices generate revolved pipes about the axis passing along the vertex and the normal to the plane of the spine. At present, this is the only construction type implemented.

	:param Spine:
	:type Spine: TopoDS_Face &
	:param Profil:
	:type Profil: TopoDS_Wire &
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param AxeProf: default value is Standard_True
	:type AxeProf: bool
	:param Solid: default value is Standard_False
	:type Solid: bool
	:param ProfOnSpine: default value is Standard_False
	:type ProfOnSpine: bool
	:param Tol: default value is 0.0000001
	:type Tol: float
	:rtype: None
") BRepOffsetAPI_MakeEvolved;
		 BRepOffsetAPI_MakeEvolved (const TopoDS_Face & Spine,const TopoDS_Wire & Profil,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean AxeProf = Standard_True,const Standard_Boolean Solid = Standard_False,const Standard_Boolean ProfOnSpine = Standard_False,const Standard_Real Tol = 0.0000001);
		%feature("compactdefaultargs") Evolved;
		%feature("autodoc", "	:rtype: BRepFill_Evolved
") Evolved;
		const BRepFill_Evolved & Evolved ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting shape (redefined from MakeShape).

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "	* Returns the shapes created from a subshape <SpineShape> of the spine and a subshape <ProfShape> on the profile.

	:param SpineShape:
	:type SpineShape: TopoDS_Shape &
	:param ProfShape:
	:type ProfShape: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SpineShape,const TopoDS_Shape & ProfShape);
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "	* Return the face Top if <Solid> is True in the constructor.

	:rtype: TopoDS_Shape
") Top;
		const TopoDS_Shape  Top ();
		%feature("compactdefaultargs") Bottom;
		%feature("autodoc", "	* Return the face Bottom if <Solid> is True in the constructor.

	:rtype: TopoDS_Shape
") Bottom;
		const TopoDS_Shape  Bottom ();
};


%extend BRepOffsetAPI_MakeEvolved {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_MakeFilling;
class BRepOffsetAPI_MakeFilling : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_MakeFilling;
		%feature("autodoc", "	* Constructs a wire filling object defined by - the energy minimizing criterion Degree - the number of points on the curve NbPntsOnCur - the number of iterations NbIter - the Boolean Anisotropie - the 2D tolerance Tol2d - the 3D tolerance Tol3d - the angular tolerance TolAng - the tolerance for curvature TolCur - the highest polynomial degree MaxDeg - the greatest number of segments MaxSeg. If the Boolean Anistropie is true, the algorithm's performance is better in cases where the ratio of the length U and the length V indicate a great difference between the two. In other words, when the surface is, for example, extremely long.

	:param Degree: default value is 3
	:type Degree: int
	:param NbPtsOnCur: default value is 15
	:type NbPtsOnCur: int
	:param NbIter: default value is 2
	:type NbIter: int
	:param Anisotropie: default value is Standard_False
	:type Anisotropie: bool
	:param Tol2d: default value is 0.00001
	:type Tol2d: float
	:param Tol3d: default value is 0.0001
	:type Tol3d: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:param MaxDeg: default value is 8
	:type MaxDeg: int
	:param MaxSegments: default value is 9
	:type MaxSegments: int
	:rtype: None
") BRepOffsetAPI_MakeFilling;
		 BRepOffsetAPI_MakeFilling (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 15,const Standard_Integer NbIter = 2,const Standard_Boolean Anisotropie = Standard_False,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Integer MaxDeg = 8,const Standard_Integer MaxSegments = 9);
		%feature("compactdefaultargs") SetConstrParam;
		%feature("autodoc", "	* Sets the values of Tolerances used to control the constraint. Tol2d: Tol3d: it is the maximum distance allowed between the support surface and the constraints TolAng: it is the maximum angle allowed between the normal of the surface and the constraints TolCurv: it is the maximum difference of curvature allowed between the surface and the constraint

	:param Tol2d: default value is 0.00001
	:type Tol2d: float
	:param Tol3d: default value is 0.0001
	:type Tol3d: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:rtype: None
") SetConstrParam;
		void SetConstrParam (const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);
		%feature("compactdefaultargs") SetResolParam;
		%feature("autodoc", "	* Sets the parameters used for resolution. The default values of these parameters have been chosen for a good ratio quality/performance. Degree: it is the order of energy criterion to minimize for computing the deformation of the surface. The default value is 3 The recommanded value is i+2 where i is the maximum order of the constraints. NbPtsOnCur: it is the average number of points for discretisation of the edges. NbIter: it is the maximum number of iterations of the process. For each iteration the number of discretisation points is increased. Anisotropie:

	:param Degree: default value is 3
	:type Degree: int
	:param NbPtsOnCur: default value is 15
	:type NbPtsOnCur: int
	:param NbIter: default value is 2
	:type NbIter: int
	:param Anisotropie: default value is Standard_False
	:type Anisotropie: bool
	:rtype: None
") SetResolParam;
		void SetResolParam (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 15,const Standard_Integer NbIter = 2,const Standard_Boolean Anisotropie = Standard_False);
		%feature("compactdefaultargs") SetApproxParam;
		%feature("autodoc", "	* Sets the parameters used to approximate the filling surface. These include: - MaxDeg - the highest degree which the polynomial defining the filling surface can have - MaxSegments - the greatest number of segments which the filling surface can have.

	:param MaxDeg: default value is 8
	:type MaxDeg: int
	:param MaxSegments: default value is 9
	:type MaxSegments: int
	:rtype: None
") SetApproxParam;
		void SetApproxParam (const Standard_Integer MaxDeg = 8,const Standard_Integer MaxSegments = 9);
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "	* Loads the initial surface Surf to begin the construction of the surface. This optional function is useful if the surface resulting from construction for the algorithm is likely to be complex. The support surface of the face under construction is computed by a deformation of Surf which satisfies the given constraints. The set of bounding edges defines the wire of the face. If no initial surface is given, the algorithm computes it automatically. If the set of edges is not connected (Free constraint), missing edges are automatically computed. Important: the initial surface must have orthogonal local coordinates, i.e. partial derivatives dS/du and dS/dv must be orthogonal at each point of surface. If this condition breaks, distortions of resulting surface are possible.

	:param Surf:
	:type Surf: TopoDS_Face &
	:rtype: None
") LoadInitSurface;
		void LoadInitSurface (const TopoDS_Face & Surf);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0 : the surface has to pass by 3D representation of the edge GeomAbs_G1 : the surface has to pass by 3D representation of the edge and to respect tangency with the first face of the edge GeomAbs_G2 : the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the first face of the edge. Raises ConstructionError if the edge has no representation on a face and Order is GeomAbs_G1 or GeomAbs_G2.

	:param Constr:
	:type Constr: TopoDS_Edge &
	:param Order:
	:type Order: GeomAbs_Shape
	:param IsBound: default value is Standard_True
	:type IsBound: bool
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Edge & Constr,const GeomAbs_Shape Order,const Standard_Boolean IsBound = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0 : the surface has to pass by 3D representation of the edge GeomAbs_G1 : the surface has to pass by 3D representation of the edge and to respect tangency with the given face GeomAbs_G2 : the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the given face. Raises ConstructionError if the edge has no 2d representation on the given face

	:param Constr:
	:type Constr: TopoDS_Edge &
	:param Support:
	:type Support: TopoDS_Face &
	:param Order:
	:type Order: GeomAbs_Shape
	:param IsBound: default value is Standard_True
	:type IsBound: bool
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Edge & Constr,const TopoDS_Face & Support,const GeomAbs_Shape Order,const Standard_Boolean IsBound = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a free constraint on a face. The corresponding edge has to be automatically recomputed. It is always a bound.

	:param Support:
	:type Support: TopoDS_Face &
	:param Order:
	:type Order: GeomAbs_Shape
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Face & Support,const GeomAbs_Shape Order);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a punctual constraint.

	:param Point:
	:type Point: gp_Pnt
	:rtype: int
") Add;
		Standard_Integer Add (const gp_Pnt & Point);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a punctual constraint.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Support:
	:type Support: TopoDS_Face &
	:param Order:
	:type Order: GeomAbs_Shape
	:rtype: int
") Add;
		Standard_Integer Add (const Standard_Real U,const Standard_Real V,const TopoDS_Face & Support,const GeomAbs_Shape Order);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting faces

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Tests whether computation of the filling plate has been completed.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "	* Returns the maximum distance between the result and the constraints. This is set at construction time.

	:rtype: float
") G0Error;
		Standard_Real G0Error ();
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "	* Returns the maximum angle between the result and the constraints. This is set at construction time.

	:rtype: float
") G1Error;
		Standard_Real G1Error ();
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "	* Returns the maximum angle between the result and the constraints. This is set at construction time.

	:rtype: float
") G2Error;
		Standard_Real G2Error ();
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "	* Returns the maximum distance attained between the result and the constraint Index. This is set at construction time.

	:param Index:
	:type Index: int
	:rtype: float
") G0Error;
		Standard_Real G0Error (const Standard_Integer Index);
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "	* Returns the maximum angle between the result and the constraints. This is set at construction time.

	:param Index:
	:type Index: int
	:rtype: float
") G1Error;
		Standard_Real G1Error (const Standard_Integer Index);
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "	* Returns the greatest difference in curvature found between the result and the constraint Index.

	:param Index:
	:type Index: int
	:rtype: float
") G2Error;
		Standard_Real G2Error (const Standard_Integer Index);
};


%extend BRepOffsetAPI_MakeFilling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_MakeOffset;
class BRepOffsetAPI_MakeOffset : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffset;
		%feature("autodoc", "	* Constructs an algorithm for creating an empty offset

	:rtype: None
") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset ();
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffset;
		%feature("autodoc", "	* Constructs an algorithm for creating an algorithm to build parallels to the spine Spine

	:param Spine:
	:type Spine: TopoDS_Face &
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None
") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset (const TopoDS_Face & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean IsOpenResult = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the algorithm to construct parallels to the spine Spine. Join defines the type of parallel generated by the salient vertices of the spine. The default type is GeomAbs_Arc where the vertices generate sections of a circle. If join type is GeomAbs_Intersection, the edges that intersect in a salient vertex generate the edges prolonged until intersection.

	:param Spine:
	:type Spine: TopoDS_Face &
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Face & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean IsOpenResult = Standard_False);
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffset;
		%feature("autodoc", "	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None
") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset (const TopoDS_Wire & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean IsOpenResult = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the evaluation of Offseting.

	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None
") Init;
		void Init (const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean IsOpenResult = Standard_False);
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "	* Initializes the algorithm to construct parallels to the wire Spine.

	:param Spine:
	:type Spine: TopoDS_Wire &
	:rtype: None
") AddWire;
		void AddWire (const TopoDS_Wire & Spine);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes a parallel to the spine at distance Offset and at an altitude Alt from the plane of the spine in relation to the normal to the spine. Exceptions: StdFail_NotDone if the offset is not built.

	:param Offset:
	:type Offset: float
	:param Alt: default value is 0.0
	:type Alt: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real Offset,const Standard_Real Alt = 0.0);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting shape (redefined from MakeShape).

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* returns a list of the created shapes from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
};


%extend BRepOffsetAPI_MakeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_MakeOffsetShape;
class BRepOffsetAPI_MakeOffsetShape : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffsetShape;
		%feature("autodoc", "	:rtype: None
") BRepOffsetAPI_MakeOffsetShape;
		 BRepOffsetAPI_MakeOffsetShape ();
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffsetShape;
		%feature("autodoc", "	* Constructs a shape parallel to the shape S, where - S may be a face, a shell, a solid or a compound of these shape kinds; - Offset is the offset value. The offset shape is constructed: - outside S, if Offset is positive, - inside S, if Offset is negative; - Tol defines the coincidence tolerance criterion for generated shapes; - Mode defines the construction type of parallels applied to the free edges of shape S; currently, only one construction type is implemented, namely the one where the free edges do not generate parallels; this corresponds to the default value BRepOffset_Skin; - Intersection specifies how the algorithm must work in order to limit the parallels to two adjacent shapes: - if Intersection is false (default value), the intersection is calculated with the parallels to the two adjacent shapes, - if Intersection is true, the intersection is calculated by taking all generated parallels into account; this computation method is more general as it avoids some self-intersections generated in the offset shape from features of small dimensions on shape S, however this method has not been completely implemented and therefore is not recommended for use; - SelfInter tells the algorithm whether a computation to eliminate self-intersections must be applied to the resulting shape; however, as this functionality is not yet implemented, it is recommended to use the default value (false); - Join defines how to fill the holes that may appear between parallels to the two adjacent faces. It may take values GeomAbs_Arc or GeomAbs_Intersection: - if Join is equal to GeomAbs_Arc, then pipes are generated between two free edges of two adjacent parallels, and spheres are generated on 'images' of vertices; it is the default value, - if Join is equal to GeomAbs_Intersection, then the parallels to the two adjacent faces are enlarged and intersected, so that there are no free edges on parallels to faces. Warnings 1. All the faces of the shape S should be based on the surfaces with continuity at least C1. 2. The offset value should be sufficiently small to avoid self-intersections in resulting shape. Otherwise these self-intersections may appear inside an offset face if its initial surface is not plane or sphere or cylinder, also some non-adjacent offset faces may intersect each other. Also, some offset surfaces may 'turn inside out'. 3. The algorithm may fail if the shape S contains vertices where more than 3 edges converge. 4. Since 3d-offset algorithm involves intersection of surfaces, it is under limitations of surface intersection algorithm. 5. A result cannot be generated if the underlying geometry of S is BSpline with continuity C0. Exceptions Geom_UndefinedDerivative if the underlying geometry of S is BSpline with continuity C0.

	:param S:
	:type S: TopoDS_Shape &
	:param Offset:
	:type Offset: float
	:param Tol:
	:type Tol: float
	:param Mode: default value is BRepOffset_Skin
	:type Mode: BRepOffset_Mode
	:param Intersection: default value is Standard_False
	:type Intersection: bool
	:param SelfInter: default value is Standard_False
	:type SelfInter: bool
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:rtype: None
") BRepOffsetAPI_MakeOffsetShape;
		 BRepOffsetAPI_MakeOffsetShape (const TopoDS_Shape & S,const Standard_Real Offset,const Standard_Real Tol,const BRepOffset_Mode Mode = BRepOffset_Skin,const Standard_Boolean Intersection = Standard_False,const Standard_Boolean SelfInter = Standard_False,const GeomAbs_JoinType Join = GeomAbs_Arc);
		%feature("compactdefaultargs") MakeOffset;
		%feature("autodoc", "	:rtype: BRepOffset_MakeOffset
") MakeOffset;
		virtual const BRepOffset_MakeOffset & MakeOffset ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting shape (redefined from MakeShape).

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("compactdefaultargs") GeneratedEdge;
		%feature("autodoc", "	* Returns the list of edges generated from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") GeneratedEdge;
		const TopTools_ListOfShape & GeneratedEdge (const TopoDS_Shape & S);
		%feature("compactdefaultargs") GetJoinType;
		%feature("autodoc", "	* Returns offset join type.

	:rtype: GeomAbs_JoinType
") GetJoinType;
		GeomAbs_JoinType GetJoinType ();
};


%extend BRepOffsetAPI_MakeOffsetShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_MakePipe;
class BRepOffsetAPI_MakePipe : public BRepPrimAPI_MakeSweep {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_MakePipe;
		%feature("autodoc", "	* Constructs a pipe by sweeping the shape Profile along the wire Spine.The angle made by the spine with the profile is maintained along the length of the pipe. Warning Spine must be G1 continuous; that is, on the connection vertex of two edges of the wire, the tangent vectors on the left and on the right must have the same direction, though not necessarily the same magnitude. Exceptions Standard_DomainError if the profile is a solid or a composite solid.

	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Profile:
	:type Profile: TopoDS_Shape &
	:rtype: None
") BRepOffsetAPI_MakePipe;
		 BRepOffsetAPI_MakePipe (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile);
		%feature("compactdefaultargs") BRepOffsetAPI_MakePipe;
		%feature("autodoc", "	* the same as previous but with setting of mode of sweep and the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0.

	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Profile:
	:type Profile: TopoDS_Shape &
	:param aMode:
	:type aMode: GeomFill_Trihedron
	:param ForceApproxC1: default value is Standard_False
	:type ForceApproxC1: bool
	:rtype: None
") BRepOffsetAPI_MakePipe;
		 BRepOffsetAPI_MakePipe (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile,const GeomFill_Trihedron aMode,const Standard_Boolean ForceApproxC1 = Standard_False);
		%feature("compactdefaultargs") Pipe;
		%feature("autodoc", "	:rtype: BRepFill_Pipe
") Pipe;
		const BRepFill_Pipe & Pipe ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting shape (redefined from MakeShape).

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the bottom of the prism.

	:rtype: TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape ();
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the top of the prism.

	:rtype: TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	:param SSpine:
	:type SSpine: TopoDS_Shape &
	:param SProfile:
	:type SProfile: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Generated;
		TopoDS_Shape Generated (const TopoDS_Shape & SSpine,const TopoDS_Shape & SProfile);
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "	:rtype: float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface ();
};


%extend BRepOffsetAPI_MakePipe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_MakePipeShell;
class BRepOffsetAPI_MakePipeShell : public BRepPrimAPI_MakeSweep {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_MakePipeShell;
		%feature("autodoc", "	* Constructs the shell-generating framework defined by the wire Spine. Sets an sweep's mode If no mode are setted, the mode use in MakePipe is used

	:param Spine:
	:type Spine: TopoDS_Wire &
	:rtype: None
") BRepOffsetAPI_MakePipeShell;
		 BRepOffsetAPI_MakePipeShell (const TopoDS_Wire & Spine);
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "	* Sets a Frenet or a CorrectedFrenet trihedron to perform the sweeping If IsFrenet is false, a corrected Frenet trihedron is used.

	:param IsFrenet: default value is Standard_False
	:type IsFrenet: bool
	:rtype: None
") SetMode;
		void SetMode (const Standard_Boolean IsFrenet = Standard_False);
		%feature("compactdefaultargs") SetDiscreteMode;
		%feature("autodoc", "	* Sets a Discrete trihedron to perform the sweeping

	:rtype: None
") SetDiscreteMode;
		void SetDiscreteMode ();
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "	* Sets a fixed trihedron to perform the sweeping all sections will be parallel.

	:param Axe:
	:type Axe: gp_Ax2
	:rtype: None
") SetMode;
		void SetMode (const gp_Ax2 & Axe);
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "	* Sets a fixed BiNormal direction to perform the -- sweeping. Angular relations beetween the section(s) and <BiNormal> will be constant

	:param BiNormal:
	:type BiNormal: gp_Dir
	:rtype: None
") SetMode;
		void SetMode (const gp_Dir & BiNormal);
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "	* Sets support to the spine to define the BiNormal of the trihedron, like the normal to the surfaces. Warning: To be effective, Each edge of the <spine> must have an representaion on one face of<SpineSupport>

	:param SpineSupport:
	:type SpineSupport: TopoDS_Shape &
	:rtype: bool
") SetMode;
		Standard_Boolean SetMode (const TopoDS_Shape & SpineSupport);
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "	* Sets an auxiliary spine to define the Normal For each Point of the Spine P, an Point Q is evalued on <AuxiliarySpine> If <CurvilinearEquivalence> Q split <AuxiliarySpine> with the same length ratio than P split <Spline>. Else the plan define by P and the tangent to the <Spine> intersect <AuxiliarySpine> in Q. If <KeepContact> equals BRepFill_NoContact: The Normal is defined by the vector PQ. If <KeepContact> equals BRepFill_Contact: The Normal is defined to achieve that the sweeped section is in contact to the auxiliarySpine. The width of section is constant all along the path. In other words, the auxiliary spine lies on the swept surface, but not necessarily is a boundary of this surface. However, the auxiliary spine has to be close enough to the main spine to provide intersection with any section all along the path. If <KeepContact> equals BRepFill_ContactOnBorder: The auxiliary spine becomes a boundary of the swept surface and the width of section varies along the path. Give section to sweep. Possibilities are : - Give one or sevral section - Give one profile and an homotetic law. - Automatic compute of correspondance beetween spine, and section on the sweeped shape - correspondance beetween spine, and section on the sweeped shape defined by a vertex of the spine

	:param AuxiliarySpine:
	:type AuxiliarySpine: TopoDS_Wire &
	:param CurvilinearEquivalence:
	:type CurvilinearEquivalence: bool
	:param KeepContact: default value is BRepFill_NoContact
	:type KeepContact: BRepFill_TypeOfContact
	:rtype: None
") SetMode;
		void SetMode (const TopoDS_Wire & AuxiliarySpine,const Standard_Boolean CurvilinearEquivalence,const BRepFill_TypeOfContact KeepContact = BRepFill_NoContact);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the section Profile to this framework. First and last sections may be punctual, so the shape Profile may be both wire and vertex. Correspondent point on spine is computed automatically. If WithContact is true, the section is translated to be in contact with the spine. If WithCorrection is true, the section is rotated to be orthogonal to the spine?s tangent in the correspondent point. This option has no sense if the section is punctual (Profile is of type TopoDS_Vertex).

	:param Profile:
	:type Profile: TopoDS_Shape &
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & Profile,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the section Profile to this framework. Correspondent point on the spine is given by Location. Warning: To be effective, it is not recommended to combine methods Add and SetLaw.

	:param Profile:
	:type Profile: TopoDS_Shape &
	:param Location:
	:type Location: TopoDS_Vertex &
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & Profile,const TopoDS_Vertex & Location,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "	* Sets the evolution law defined by the wire Profile with its position (Location, WithContact, WithCorrection are the same options as in methods Add) and a homotetic law defined by the function L. Warning: To be effective, it is not recommended to combine methods Add and SetLaw.

	:param Profile:
	:type Profile: TopoDS_Shape &
	:param L:
	:type L: Handle_Law_Function &
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None
") SetLaw;
		void SetLaw (const TopoDS_Shape & Profile,const Handle_Law_Function & L,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "	* Sets the evolution law defined by the wire Profile with its position (Location, WithContact, WithCorrection are the same options as in methods Add) and a homotetic law defined by the function L. Warning: To be effective, it is not recommended to combine methods Add and SetLaw.

	:param Profile:
	:type Profile: TopoDS_Shape &
	:param L:
	:type L: Handle_Law_Function &
	:param Location:
	:type Location: TopoDS_Vertex &
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None
") SetLaw;
		void SetLaw (const TopoDS_Shape & Profile,const Handle_Law_Function & L,const TopoDS_Vertex & Location,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Removes the section Profile from this framework.

	:param Profile:
	:type Profile: TopoDS_Shape &
	:rtype: None
") Delete;
		void Delete (const TopoDS_Shape & Profile);
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "	* Returns true if this tool object is ready to build the shape, i.e. has a definition for the wire section Profile.

	:rtype: bool
") IsReady;
		Standard_Boolean IsReady ();
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "	* Get a status, when Simulate or Build failed. It can be BRepBuilderAPI_PipeDone, BRepBuilderAPI_PipeNotDone, BRepBuilderAPI_PlaneNotIntersectGuide, BRepBuilderAPI_ImpossibleContact.

	:rtype: BRepBuilderAPI_PipeError
") GetStatus;
		BRepBuilderAPI_PipeError GetStatus ();
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets the following tolerance values - 3D tolerance Tol3d - boundary tolerance BoundTol - angular tolerance TolAngular.

	:param Tol3d: default value is 1.0e-4
	:type Tol3d: float
	:param BoundTol: default value is 1.0e-4
	:type BoundTol: float
	:param TolAngular: default value is 1.0e-2
	:type TolAngular: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol3d = 1.0e-4,const Standard_Real BoundTol = 1.0e-4,const Standard_Real TolAngular = 1.0e-2);
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "	* Define the maximum V degree of resulting surface

	:param NewMaxDegree:
	:type NewMaxDegree: int
	:rtype: None
") SetMaxDegree;
		void SetMaxDegree (const Standard_Integer NewMaxDegree);
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "	* Define the maximum number of spans in V-direction on resulting surface

	:param NewMaxSegments:
	:type NewMaxSegments: int
	:rtype: None
") SetMaxSegments;
		void SetMaxSegments (const Standard_Integer NewMaxSegments);
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "	* Set the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0.

	:param ForceApproxC1:
	:type ForceApproxC1: bool
	:rtype: None
") SetForceApproxC1;
		void SetForceApproxC1 (const Standard_Boolean ForceApproxC1);
		%feature("compactdefaultargs") SetTransitionMode;
		%feature("autodoc", "	* Sets the transition mode to manage discontinuities on the swept shape caused by fractures on the spine. The transition mode can be BRepBuilderAPI_Transformed (default value), BRepBuilderAPI_RightCorner, BRepBuilderAPI_RoundCorner: -  RepBuilderAPI_Transformed: discontinuities are treated by modification of the sweeping mode. The pipe is 'transformed' at the fractures of the spine. This mode assumes building a self-intersected shell. -  BRepBuilderAPI_RightCorner: discontinuities are treated like right corner. Two pieces of the pipe corresponding to two adjacent segments of the spine are extended and intersected at a fracture of the spine. -  BRepBuilderAPI_RoundCorner: discontinuities are treated like round corner. The corner is treated as rotation of the profile around an axis which passes through the point of the spine?s fracture. This axis is based on cross product of directions tangent to the adjacent segments of the spine at their common point. Warnings The mode BRepBuilderAPI_RightCorner provides a valid result if intersection of two pieces of the pipe (corresponding to two adjacent segments of the spine) in the neighborhood of the spine?s fracture is connected and planar. This condition can be violated if the spine is non-linear in some neighborhood of the fracture or if the profile was set with a scaling law. The last mode, BRepBuilderAPI_RoundCorner, will assuredly provide a good result only if a profile was set with option WithCorrection = True, i.e. it is strictly orthogonal to the spine.

	:param Mode: default value is BRepBuilderAPI_Transformed
	:type Mode: BRepBuilderAPI_TransitionMode
	:rtype: None
") SetTransitionMode;
		void SetTransitionMode (const BRepBuilderAPI_TransitionMode Mode = BRepBuilderAPI_Transformed);
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "	* Simulates the resulting shape by calculating its cross-sections. The spine is devided by this cross-sections into (NumberOfSection - 1) equal parts, the number of cross-sections is NumberOfSection. The cross-sections are wires and they are returned in the list Result. This gives a rapid preview of the resulting shape, which will be obtained using the settings you have provided. Raises NotDone if <self> it is not Ready

	:param NumberOfSection:
	:type NumberOfSection: int
	:param Result:
	:type Result: TopTools_ListOfShape &
	:rtype: None
") Simulate;
		void Simulate (const Standard_Integer NumberOfSection,TopTools_ListOfShape & Result);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting shape (redefined from MakeShape).

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "	* Transforms the sweeping Shell in Solid. If a propfile is not closed returns False

	:rtype: bool
") MakeSolid;
		Standard_Boolean MakeSolid ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the bottom of the sweep.

	:rtype: TopoDS_Shape
") FirstShape;
		virtual TopoDS_Shape FirstShape ();
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the top of the sweep.

	:rtype: TopoDS_Shape
") LastShape;
		virtual TopoDS_Shape LastShape ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns a list of new shapes generated from the shape S by the shell-generating algorithm. This function is redefined from BRepOffsetAPI_MakeShape::Generated. S can be an edge of the given Spine (see Constructor), it can be an edge or a boundary vertex of a shape returned by the method FirstShape(), it can also be a Profile (see method Add()) closest to the beginning or the end of the Spine. If S is an edge of the given Spine, then method Generated() returns a list of generated faces and a list of edges from a free boundary (if it exists) of the resulting shell. If S is an edge of the start shape (see FirstShape()), method Generated() returns a list of faces generated along the whole spine from the given edge. If S is a boundary vertex of the start shape (see FirstShape()), method Generated() returns a list of edges from the free boundary of the resulting shell, generated along the whole spine. If S is a Profile closest to the beginning of the Spine, method Generated() returns the start shape, that can also be obtained by method FirstShape(). If S is a Profile closest to the end of the Spine, method Generated() returns the end shape, that can also be obtained by method LastShape().

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "	:rtype: float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface ();
};


%extend BRepOffsetAPI_MakePipeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_MiddlePath;
class BRepOffsetAPI_MiddlePath : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_MiddlePath;
		%feature("autodoc", "	* General constructor. StartShape and EndShape may be a wire or a face

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param StartShape:
	:type StartShape: TopoDS_Shape &
	:param EndShape:
	:type EndShape: TopoDS_Shape &
	:rtype: None
") BRepOffsetAPI_MiddlePath;
		 BRepOffsetAPI_MiddlePath (const TopoDS_Shape & aShape,const TopoDS_Shape & StartShape,const TopoDS_Shape & EndShape);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	:rtype: void
") Build;
		virtual void Build ();
};


%extend BRepOffsetAPI_MiddlePath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_NormalProjection;
class BRepOffsetAPI_NormalProjection : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_NormalProjection;
		%feature("autodoc", "	* Constructs an empty framework to define projection on a shape according to the normal from each point to be projected to the shape.

	:rtype: None
") BRepOffsetAPI_NormalProjection;
		 BRepOffsetAPI_NormalProjection ();
		%feature("compactdefaultargs") BRepOffsetAPI_NormalProjection;
		%feature("autodoc", "	* Constructs a framework to define projection onto the basis shape S according to the normal from each point to be projected from the shape added to this framework by Add. Default parameters of the algorithm: Tol3D = 1.e-04, Tol2D =sqr(tol3d) , InternalContinuity = GeomAbs_C2, MaxDegree = 14, MaxSeg = 16.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") BRepOffsetAPI_NormalProjection;
		 BRepOffsetAPI_NormalProjection (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the empty constructor framework with the shape S.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the shape ToProj to the framework for calculation of the projection by Compute3d. ToProj is an edge or a wire and will be projected onto the basis shape. Exceptions Standard_ConstructionError if ToProj is not added.

	:param ToProj:
	:type ToProj: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & ToProj);
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "	* Sets the parameters used for computation Tol3 is the requiered tolerance between the 3d projected curve and its 2d representation InternalContinuity is the order of constraints used for approximation MaxDeg and MaxSeg are the maximum degree and the maximum number of segment for BSpline resulting of an approximation.

	:param Tol3D:
	:type Tol3D: float
	:param Tol2D:
	:type Tol2D: float
	:param InternalContinuity:
	:type InternalContinuity: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: int
	:param MaxSeg:
	:type MaxSeg: int
	:rtype: None
") SetParams;
		void SetParams (const Standard_Real Tol3D,const Standard_Real Tol2D,const GeomAbs_Shape InternalContinuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSeg);
		%feature("compactdefaultargs") SetMaxDistance;
		%feature("autodoc", "	* Sets the maximum distance between target shape and shape to project. If this condition is not satisfied then corresponding part of solution is discarded. if MaxDist < 0 then this method does not affect the algorithm

	:param MaxDist:
	:type MaxDist: float
	:rtype: None
") SetMaxDistance;
		void SetMaxDistance (const Standard_Real MaxDist);
		%feature("compactdefaultargs") SetLimit;
		%feature("autodoc", "	* Manage limitation of projected edges.

	:param FaceBoundaries: default value is Standard_True
	:type FaceBoundaries: bool
	:rtype: None
") SetLimit;
		void SetLimit (const Standard_Boolean FaceBoundaries = Standard_True);
		%feature("compactdefaultargs") Compute3d;
		%feature("autodoc", "	* Returns true if a 3D curve is computed. If not, false is returned and an initial 3D curve is kept to build the resulting edges.

	:param With3d: default value is Standard_True
	:type With3d: bool
	:rtype: None
") Compute3d;
		void Compute3d (const Standard_Boolean With3d = Standard_True);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the result of the projection as a compound of wires. Tries to build oriented wires.

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the object was correctly built by the shape construction algorithm. If at the construction time of the shape, the algorithm cannot be completed, or the original data is corrupted, IsDone returns false and therefore protects the use of functions to access the result of the construction (typically the Shape function).

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Projection;
		%feature("autodoc", "	* Performs the projection. The construction of the result is performed by Build. Exceptions StdFail_NotDone if the projection was not performed.

	:rtype: TopoDS_Shape
") Projection;
		const TopoDS_Shape  Projection ();
		%feature("compactdefaultargs") Couple;
		%feature("autodoc", "	* Returns the initial face corresponding to the projected edge E. Exceptions StdFail_NotDone if no face was found. Standard_NoSuchObject if if a face corresponding to E has already been found.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Shape
") Couple;
		const TopoDS_Shape  Couple (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Ancestor;
		%feature("autodoc", "	* Returns the initial edge corresponding to the edge E resulting from the computation of the projection. Exceptions StdFail_NotDone if no edge was found. Standard_NoSuchObject if an edge corresponding to E has already been found.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Shape
") Ancestor;
		const TopoDS_Shape  Ancestor (const TopoDS_Edge & E);
		%feature("compactdefaultargs") BuildWire;
		%feature("autodoc", "	* build the result as a list of wire if possible in -- a first returns a wire only if there is only a wire.

	:param Liste:
	:type Liste: TopTools_ListOfShape &
	:rtype: bool
") BuildWire;
		Standard_Boolean BuildWire (TopTools_ListOfShape & Liste);
};


%extend BRepOffsetAPI_NormalProjection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal;
class BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal;
		%feature("autodoc", "	:param I:
	:type I: TColStd_SequenceOfReal &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal;
		 BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal (const TColStd_SequenceOfReal & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfReal
") Value;
		TColStd_SequenceOfReal & Value ();
};


%extend BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal::Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal;
class Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal();
        Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal(const Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal &aHandle);
        Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal(const BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal {
    BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal* _get_reference() {
    return (BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal*)$self->Access();
    }
};

%extend Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape;
class BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape;
		%feature("autodoc", "	:param I:
	:type I: TopTools_SequenceOfShape &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape;
		 BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape (const TopTools_SequenceOfShape & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") Value;
		TopTools_SequenceOfShape & Value ();
};


%extend BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape::Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape;
class Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape();
        Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape(const Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape &aHandle);
        Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape(const BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape {
    BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape* _get_reference() {
    return (BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape*)$self->Access();
    }
};

%extend Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_SequenceOfSequenceOfReal;
class BRepOffsetAPI_SequenceOfSequenceOfReal : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_SequenceOfSequenceOfReal;
		%feature("autodoc", "	:rtype: None
") BRepOffsetAPI_SequenceOfSequenceOfReal;
		 BRepOffsetAPI_SequenceOfSequenceOfReal ();
		%feature("compactdefaultargs") BRepOffsetAPI_SequenceOfSequenceOfReal;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffsetAPI_SequenceOfSequenceOfReal &
	:rtype: None
") BRepOffsetAPI_SequenceOfSequenceOfReal;
		 BRepOffsetAPI_SequenceOfSequenceOfReal (const BRepOffsetAPI_SequenceOfSequenceOfReal & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffsetAPI_SequenceOfSequenceOfReal &
	:rtype: BRepOffsetAPI_SequenceOfSequenceOfReal
") Assign;
		const BRepOffsetAPI_SequenceOfSequenceOfReal & Assign (const BRepOffsetAPI_SequenceOfSequenceOfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffsetAPI_SequenceOfSequenceOfReal &
	:rtype: BRepOffsetAPI_SequenceOfSequenceOfReal
") operator =;
		const BRepOffsetAPI_SequenceOfSequenceOfReal & operator = (const BRepOffsetAPI_SequenceOfSequenceOfReal & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: TColStd_SequenceOfReal &
	:rtype: None
") Append;
		void Append (const TColStd_SequenceOfReal & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: BRepOffsetAPI_SequenceOfSequenceOfReal &
	:rtype: None
") Append;
		void Append (BRepOffsetAPI_SequenceOfSequenceOfReal & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: TColStd_SequenceOfReal &
	:rtype: None
") Prepend;
		void Prepend (const TColStd_SequenceOfReal & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: BRepOffsetAPI_SequenceOfSequenceOfReal &
	:rtype: None
") Prepend;
		void Prepend (BRepOffsetAPI_SequenceOfSequenceOfReal & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TColStd_SequenceOfReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TColStd_SequenceOfReal & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepOffsetAPI_SequenceOfSequenceOfReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfReal & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TColStd_SequenceOfReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TColStd_SequenceOfReal & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepOffsetAPI_SequenceOfSequenceOfReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfReal & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfReal
") First;
		const TColStd_SequenceOfReal & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfReal
") Last;
		const TColStd_SequenceOfReal & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: BRepOffsetAPI_SequenceOfSequenceOfReal &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfReal & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_SequenceOfReal
") Value;
		const TColStd_SequenceOfReal & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: TColStd_SequenceOfReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_SequenceOfReal & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_SequenceOfReal
") ChangeValue;
		TColStd_SequenceOfReal & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend BRepOffsetAPI_SequenceOfSequenceOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_SequenceOfSequenceOfShape;
class BRepOffsetAPI_SequenceOfSequenceOfShape : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_SequenceOfSequenceOfShape;
		%feature("autodoc", "	:rtype: None
") BRepOffsetAPI_SequenceOfSequenceOfShape;
		 BRepOffsetAPI_SequenceOfSequenceOfShape ();
		%feature("compactdefaultargs") BRepOffsetAPI_SequenceOfSequenceOfShape;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffsetAPI_SequenceOfSequenceOfShape &
	:rtype: None
") BRepOffsetAPI_SequenceOfSequenceOfShape;
		 BRepOffsetAPI_SequenceOfSequenceOfShape (const BRepOffsetAPI_SequenceOfSequenceOfShape & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffsetAPI_SequenceOfSequenceOfShape &
	:rtype: BRepOffsetAPI_SequenceOfSequenceOfShape
") Assign;
		const BRepOffsetAPI_SequenceOfSequenceOfShape & Assign (const BRepOffsetAPI_SequenceOfSequenceOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffsetAPI_SequenceOfSequenceOfShape &
	:rtype: BRepOffsetAPI_SequenceOfSequenceOfShape
") operator =;
		const BRepOffsetAPI_SequenceOfSequenceOfShape & operator = (const BRepOffsetAPI_SequenceOfSequenceOfShape & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: TopTools_SequenceOfShape &
	:rtype: None
") Append;
		void Append (const TopTools_SequenceOfShape & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: BRepOffsetAPI_SequenceOfSequenceOfShape &
	:rtype: None
") Append;
		void Append (BRepOffsetAPI_SequenceOfSequenceOfShape & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: TopTools_SequenceOfShape &
	:rtype: None
") Prepend;
		void Prepend (const TopTools_SequenceOfShape & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: BRepOffsetAPI_SequenceOfSequenceOfShape &
	:rtype: None
") Prepend;
		void Prepend (BRepOffsetAPI_SequenceOfSequenceOfShape & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TopTools_SequenceOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TopTools_SequenceOfShape & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepOffsetAPI_SequenceOfSequenceOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfShape & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TopTools_SequenceOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TopTools_SequenceOfShape & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepOffsetAPI_SequenceOfSequenceOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfShape & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") First;
		const TopTools_SequenceOfShape & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") Last;
		const TopTools_SequenceOfShape & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: BRepOffsetAPI_SequenceOfSequenceOfShape &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfShape & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopTools_SequenceOfShape
") Value;
		const TopTools_SequenceOfShape & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: TopTools_SequenceOfShape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopTools_SequenceOfShape & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopTools_SequenceOfShape
") ChangeValue;
		TopTools_SequenceOfShape & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend BRepOffsetAPI_SequenceOfSequenceOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_ThruSections;
class BRepOffsetAPI_ThruSections : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_ThruSections;
		%feature("autodoc", "	* Initializes an algorithm for building a shell or a solid passing through a set of sections, where: - isSolid is set to true if the construction algorithm is required to build a solid or to false if it is required to build a shell (the default value), - ruled is set to true if the faces generated between the edges of two consecutive wires are ruled surfaces or to false (the default value) if they are smoothed out by approximation, - pres3d defines the precision criterion used by the approximation algorithm; the default value is 1.0e-6. Use AddWire and AddVertex to define the successive sections of the shell or solid to be built.

	:param isSolid: default value is Standard_False
	:type isSolid: bool
	:param ruled: default value is Standard_False
	:type ruled: bool
	:param pres3d: default value is 1.0e-06
	:type pres3d: float
	:rtype: None
") BRepOffsetAPI_ThruSections;
		 BRepOffsetAPI_ThruSections (const Standard_Boolean isSolid = Standard_False,const Standard_Boolean ruled = Standard_False,const Standard_Real pres3d = 1.0e-06);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes this algorithm for building a shell or a solid passing through a set of sections, where: - isSolid is set to true if this construction algorithm is required to build a solid or to false if it is required to build a shell. false is the default value; - ruled is set to true if the faces generated between the edges of two consecutive wires are ruled surfaces or to false (the default value) if they are smoothed out by approximation, - pres3d defines the precision criterion used by the approximation algorithm; the default value is 1.0e-6. Use AddWire and AddVertex to define the successive sections of the shell or solid to be built.

	:param isSolid: default value is Standard_False
	:type isSolid: bool
	:param ruled: default value is Standard_False
	:type ruled: bool
	:param pres3d: default value is 1.0e-06
	:type pres3d: float
	:rtype: None
") Init;
		void Init (const Standard_Boolean isSolid = Standard_False,const Standard_Boolean ruled = Standard_False,const Standard_Real pres3d = 1.0e-06);
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "	* Adds the wire wire to the set of sections through which the shell or solid is built. Use the Build function to construct the shape.

	:param wire:
	:type wire: TopoDS_Wire &
	:rtype: None
") AddWire;
		void AddWire (const TopoDS_Wire & wire);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds the vertex Vertex (punctual section) to the set of sections through which the shell or solid is built. A vertex may be added to the set of sections only as first or last section. At least one wire must be added to the set of sections by the method AddWire. Use the Build function to construct the shape.

	:param aVertex:
	:type aVertex: TopoDS_Vertex &
	:rtype: None
") AddVertex;
		void AddVertex (const TopoDS_Vertex & aVertex);
		%feature("compactdefaultargs") CheckCompatibility;
		%feature("autodoc", "	* Sets/unsets the option to compute origin and orientation on wires to avoid twisted results and update wires to have same number of edges.

	:param check: default value is Standard_True
	:type check: bool
	:rtype: None
") CheckCompatibility;
		void CheckCompatibility (const Standard_Boolean check = Standard_True);
		%feature("compactdefaultargs") SetSmoothing;
		%feature("autodoc", "	* Define the approximation algorithm

	:param UseSmoothing:
	:type UseSmoothing: bool
	:rtype: None
") SetSmoothing;
		void SetSmoothing (const Standard_Boolean UseSmoothing);
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "	* Define the type of parametrization used in the approximation

	:param ParType:
	:type ParType: Approx_ParametrizationType
	:rtype: None
") SetParType;
		void SetParType (const Approx_ParametrizationType ParType);
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "	* Define the Continuity used in the approximation

	:param C:
	:type C: GeomAbs_Shape
	:rtype: None
") SetContinuity;
		void SetContinuity (const GeomAbs_Shape C);
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "	* define the Weights associed to the criterium used in the optimization. //! if Wi <= 0

	:param W1:
	:type W1: float
	:param W2:
	:type W2: float
	:param W3:
	:type W3: float
	:rtype: None
") SetCriteriumWeight;
		void SetCriteriumWeight (const Standard_Real W1,const Standard_Real W2,const Standard_Real W3);
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "	* Define the maximal U degree of result surface

	:param MaxDeg:
	:type MaxDeg: int
	:rtype: None
") SetMaxDegree;
		void SetMaxDegree (const Standard_Integer MaxDeg);
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "	* returns the type of parametrization used in the approximation

	:rtype: Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* returns the Continuity used in the approximation

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "	* returns the maximal U degree of result surface

	:rtype: int
") MaxDegree;
		Standard_Integer MaxDegree ();
		%feature("compactdefaultargs") UseSmoothing;
		%feature("autodoc", "	* Define the approximation algorithm

	:rtype: bool
") UseSmoothing;
		Standard_Boolean UseSmoothing ();
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "	* returns the Weights associed to the criterium used in the optimization.

	:param W1:
	:type W1: float &
	:param W2:
	:type W2: float &
	:param W3:
	:type W3: float &
	:rtype: None
") CriteriumWeight;
		void CriteriumWeight (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the bottom of the loft if solid

	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the top of the loft if solid

	:rtype: TopoDS_Shape
") LastShape;
		const TopoDS_Shape  LastShape ();
		%feature("compactdefaultargs") GeneratedFace;
		%feature("autodoc", "	* if Ruled Returns the Face generated by each edge except the last wire if smoothed Returns the Face generated by each edge of the first wire

	:param Edge:
	:type Edge: TopoDS_Shape &
	:rtype: TopoDS_Shape
") GeneratedFace;
		TopoDS_Shape GeneratedFace (const TopoDS_Shape & Edge);
};


%extend BRepOffsetAPI_ThruSections {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffsetAPI_MakeThickSolid;
class BRepOffsetAPI_MakeThickSolid : public BRepOffsetAPI_MakeOffsetShape {
	public:
		%feature("compactdefaultargs") BRepOffsetAPI_MakeThickSolid;
		%feature("autodoc", "	:rtype: None
") BRepOffsetAPI_MakeThickSolid;
		 BRepOffsetAPI_MakeThickSolid ();
		%feature("compactdefaultargs") BRepOffsetAPI_MakeThickSolid;
		%feature("autodoc", "	* Constructs a hollowed solid from the solid S by removing the set of faces ClosingFaces from S, where: Offset defines the thickness of the walls. Its sign indicates which side of the surface of the solid the hollowed shape is built on; - Tol defines the tolerance criterion for coincidence in generated shapes; - Mode defines the construction type of parallels applied to free edges of shape S. Currently, only one construction type is implemented, namely the one where the free edges do not generate parallels; this corresponds to the default value BRepOffset_Skin; Intersection specifies how the algorithm must work in order to limit the parallels to two adjacent shapes: - if Intersection is false (default value), the intersection is calculated with the parallels to the two adjacent shapes, - if Intersection is true, the intersection is calculated by taking account of all parallels generated; this computation method is more general as it avoids self-intersections generated in the offset shape from features of small dimensions on shape S, however this method has not been completely implemented and therefore is not recommended for use; - SelfInter tells the algorithm whether a computation to eliminate self-intersections needs to be applied to the resulting shape. However, as this functionality is not yet implemented, you should use the default value (false); - Join defines how to fill the holes that may appear between parallels to the two adjacent faces. It may take values GeomAbs_Arc or GeomAbs_Intersection: - if Join is equal to GeomAbs_Arc, then pipes are generated between two free edges of two adjacent parallels, and spheres are generated on 'images' of vertices; it is the default value, - if Join is equal to GeomAbs_Intersection, then the parallels to the two adjacent faces are enlarged and intersected, so that there are no free edges on parallels to faces. Warnings Since the algorithm of MakeThickSolid is based on MakeOffsetShape algorithm, the warnings are the same as for MakeOffsetShape.

	:param S:
	:type S: TopoDS_Shape &
	:param ClosingFaces:
	:type ClosingFaces: TopTools_ListOfShape &
	:param Offset:
	:type Offset: float
	:param Tol:
	:type Tol: float
	:param Mode: default value is BRepOffset_Skin
	:type Mode: BRepOffset_Mode
	:param Intersection: default value is Standard_False
	:type Intersection: bool
	:param SelfInter: default value is Standard_False
	:type SelfInter: bool
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:rtype: None
") BRepOffsetAPI_MakeThickSolid;
		 BRepOffsetAPI_MakeThickSolid (const TopoDS_Shape & S,const TopTools_ListOfShape & ClosingFaces,const Standard_Real Offset,const Standard_Real Tol,const BRepOffset_Mode Mode = BRepOffset_Skin,const Standard_Boolean Intersection = Standard_False,const Standard_Boolean SelfInter = Standard_False,const GeomAbs_JoinType Join = GeomAbs_Arc);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting shape (redefined from MakeOffsetShape).

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the list of shapes modified from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
};


%extend BRepOffsetAPI_MakeThickSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
