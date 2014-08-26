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
%module BRepOffsetAPI

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

%include BRepOffsetAPI_required_python_modules.i
%include BRepOffsetAPI_headers.i

/* typedefs */
typedef BRepBuilderAPI_Sewing BRepOffsetAPI_Sewing;
typedef Handle_BRepBuilderAPI_Sewing Handle_BRepOffsetAPI_Sewing;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepOffsetAPI_DraftAngle;
class BRepOffsetAPI_DraftAngle : public BRepBuilderAPI_ModifyShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty algorithm to perform  
taper-adding transformations on faces of a shape.  
Use the Init function to define the shape to be tapered.") BRepOffsetAPI_DraftAngle;
		 BRepOffsetAPI_DraftAngle ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes an algorithm to perform taper-adding  
transformations on faces of the shape S.  
S will be referred to as the initial shape of the algorithm.") BRepOffsetAPI_DraftAngle;
		 BRepOffsetAPI_DraftAngle (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	None

Cancels the results of all taper-adding transformations  
performed by this algorithm on the initial shape. These  
results will have been defined by successive calls to the function Add.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes, or reinitializes this taper-adding algorithm with the shape S.  
S will be referred to as the initial shape of this algorithm.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Direction(gp_Dir)
	Angle(Standard_Real)
	NeutralPlane(gp_Pln)
	Flag(Standard_Boolean)=Standard_True

Returns:
	None

Adds the face F, the direction  
Direction, the angle Angle, the plane NeutralPlane, and the flag  
Flag to the framework created at construction time, and with this  
data, defines the taper-adding transformation.  
F is a face, which belongs to the initial shape of this algorithm or  
to the shape loaded by the function Init.  
Only planar, cylindrical or conical faces can be tapered:  
- If the face F is planar, it is tapered by inclining it  
  through the angle Angle about the line of intersection between the  
  plane NeutralPlane and F.  
  Direction indicates the side of NeutralPlane from which matter is  
  removed if Angle is positive or added if Angle is negative.  
- If F is cylindrical or conical, it is transformed in the  
  same way on a single face, resulting in a conical face if F  
is cylindrical, and a conical or cylindrical face if it is already conical.  
The taper-adding transformation is propagated from the face F along  
the series of planar, cylindrical or conical faces containing F,  
which are tangential to one another.  
Use the function AddDone to check if this taper-adding transformation is successful.  
Warning  
Nothing is done if:  
- the face F does not belong to the initial shape of this algorithm, or  
- the face F is not planar, cylindrical or conical.  
Exceptions  
- Standard_NullObject if the initial shape is not  
  defined, i.e. if this algorithm has not been initialized  
  with the non-empty constructor or the Init function.  
- Standard_ConstructionError if the previous call to  
  Add has failed. The function AddDone ought to have  
  been used to check for this, and the function Remove  
  to cancel the results of the unsuccessful taper-adding  
  transformation and to retrieve the previous shape.") Add;
		void Add (const TopoDS_Face & F,const gp_Dir & Direction,const Standard_Real Angle,const gp_Pln & NeutralPlane,const Standard_Boolean Flag = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the previous taper-adding  
transformation performed by this algorithm in the last  
call to Add, was successful.  
If AddDone returns false:  
- the function ProblematicShape returns the face  
  on which the error occurred,  
- the function Remove has to be used to cancel the  
  results of the unsuccessful taper-adding  
  transformation and to retrieve the previous shape.  
  Exceptions  
Standard_NullObject if the initial shape has not  
been defined, i.e. if this algorithm has not been  
initialized with the non-empty constructor or the .Init function.") AddDone;
		Standard_Boolean AddDone ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Cancels the taper-adding transformation previously  
performed by this algorithm on the face F and the  
series of tangential faces which contain F, and retrieves  
the shape before the last taper-adding transformation.  
Warning  
You will have to use this function if the previous call to  
Add fails. Use the function AddDone to check it.  
Exceptions  
- Standard_NullObject if the initial shape has not  
 been defined, i.e. if this algorithm has not been  
 initialized with the non-empty constructor or the Init function.  
- Standard_NoSuchObject if F has not been added  
  or has already been removed.") Remove;
		void Remove (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the shape on which an error occurred after an  
unsuccessful call to Add or when IsDone returns false.  
Exceptions  
Standard_NullObject if the initial shape has not been  
defined, i.e. if this algorithm has not been initialized with  
the non-empty constructor or the Init function.") ProblematicShape;
		const TopoDS_Shape & ProblematicShape ();
		%feature("autodoc", "Args:
	None
Returns:
	Draft_ErrorStatus

Returns an error  status when an error has occured  
         (Face,   Edge    or Vertex  recomputaion problem).  
         Otherwise returns Draft_NoError. The method may be  
         called if AddDone  returns Standard_False, or when  
         IsDone returns Standard_False.") Status;
		Draft_ErrorStatus Status ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

Returns all  the  faces   which  have been   added  
         together with the face <F>.") ConnectedFaces;
		const TopTools_ListOfShape & ConnectedFaces (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns all the faces  on which a modification has  
         been given.") ModifiedFaces;
		const TopTools_ListOfShape & ModifiedFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the resulting shape (redefined from MakeShape).") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") CorrectWires;
		void CorrectWires ();
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
};


%feature("shadow") BRepOffsetAPI_DraftAngle::~BRepOffsetAPI_DraftAngle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_DraftAngle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_FindContigousEdges;
class BRepOffsetAPI_FindContigousEdges {
	public:
		%feature("autodoc", "Args:
	tolerance(Standard_Real)=1.0e-06
	option(Standard_Boolean)=Standard_True

Returns:
	None

Initializes an algorithm for identifying contiguous edges  
on shapes with tolerance as the tolerance of contiguity  
(defaulted to 1.0e-6). This tolerance value is used to  
determine whether two edges or sections of edges are coincident.  
Use the function Add to define the shapes to be checked.  
Set option to false. This argument (defaulted to true) will  
serve in subsequent software releases for performing an  
analysis of degenerated shapes.") BRepOffsetAPI_FindContigousEdges;
		 BRepOffsetAPI_FindContigousEdges (const Standard_Real tolerance = 1.0e-06,const Standard_Boolean option = Standard_True);
		%feature("autodoc", "Args:
	tolerance(Standard_Real)
	option(Standard_Boolean)

Returns:
	None

Initializes this algorithm for identifying contiguous edges  
on shapes using the tolerance of contiguity tolerance.  
This tolerance value is used to determine whether two  
edges or sections of edges are coincident.  
Use the function Add to define the shapes to be checked.  
Sets <option> to false.") Init;
		void Init (const Standard_Real tolerance,const Standard_Boolean option);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	None

Adds the shape shape to the list of shapes to be  
checked by this algorithm.  
Once all the shapes to be checked have been added,  
use the function Perform to find the contiguous edges  
and the function ContigousEdge to return these edges.") Add;
		void Add (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	None
Returns:
	None

Finds coincident parts of edges of two or more shapes  
added to this algorithm and breaks down these edges  
into contiguous and non-contiguous sections on copies  
of the initial shapes.  
       The function ContigousEdge returns contiguous  
edges. The function Modified can be used to return  
modified copies of the initial shapes where one or more  
edges were broken down into contiguous and non-contiguous sections.  
Warning  
This function must be used once all the shapes to be  
checked have been added. It is not possible to add  
further shapes subsequently and then to repeat the call to Perform.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of contiguous edges found by the  
function Perform on the shapes added to this algorithm.") NbContigousEdges;
		Standard_Integer NbContigousEdges ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	TopoDS_Edge

Returns the contiguous edge of index index found by  
the function Perform on the shapes added to this algorithm.  
Exceptions  
Standard_OutOfRange if:  
- index is less than 1, or  
- index is greater than the number of contiguous  
  edges found by the function Perform on the shapes added to this algorithm.") ContigousEdge;
		const TopoDS_Edge & ContigousEdge (const Standard_Integer index);
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	TopTools_ListOfShape

Returns a list of edges coincident with the contiguous  
edge of index index found by the function Perform.  
There are as many edges in the list as there are faces  
adjacent to this contiguous edge.  
Exceptions  
Standard_OutOfRange if:  
- index is less than 1, or  
- index is greater than the number of contiguous edges  
  found by the function Perform on the shapes added to this algorithm.") ContigousEdgeCouple;
		const TopTools_ListOfShape & ContigousEdgeCouple (const Standard_Integer index);
		%feature("autodoc", "Args:
	section(TopoDS_Edge)

Returns:
	TopoDS_Edge

Returns the edge on the initial shape, of which the  
modified copy contains the edge section.  
section is coincident with a contiguous edge found by  
the function Perform. Use the function  
ContigousEdgeCouple to obtain a valid section.  
This information is useful for verification purposes, since  
it provides a means of determining the surface to which  
the contiguous edge belongs.  
Exceptions  
Standard_NoSuchObject if section is not coincident  
with a contiguous edge. Use the function  
ContigousEdgeCouple to obtain a valid section.") SectionToBoundary;
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

Gives a degenerated shape") DegeneratedShape;
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

Returns true if the copy of the initial shape shape was  
modified by the function Perform (i.e. if one or more of  
its edges was broken down into contiguous and non-contiguous sections).  
Warning  
Returns false if shape is not one of the initial shapes  
added to this algorithm.") IsModified;
		Standard_Boolean IsModified (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	TopoDS_Shape

Gives a modifieded shape  
Raises   NoSuchObject if shape has not been modified") Modified;
		const TopoDS_Shape & Modified (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	None
Returns:
	None

Dump properties of resulting shape.") Dump;
		void Dump ();
};


%feature("shadow") BRepOffsetAPI_FindContigousEdges::~BRepOffsetAPI_FindContigousEdges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_FindContigousEdges {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_MakeDraft;
class BRepOffsetAPI_MakeDraft : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	Shape(TopoDS_Shape)
	Dir(gp_Dir)
	Angle(Standard_Real)

Returns:
	None

Constructs the draft surface object defined by the shape  
Shape, the direction Dir, and the angle Angle.  
Shape must be a TopoDS_Wire, Topo_DS_Face or  
TopoDS_Shell with free boundaries.  
Exceptions  
Standard_NotDone if Shape is not a TopoDS_Wire,  
Topo_DS_Face or TopoDS_Shell with free boundaries.") BRepOffsetAPI_MakeDraft;
		 BRepOffsetAPI_MakeDraft (const TopoDS_Shape & Shape,const gp_Dir & Dir,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Style(BRepBuilderAPI_TransitionMode)=BRepBuilderAPI_RightCorner
	AngleMin(Standard_Real)=0.01
	AngleMax(Standard_Real)=3.0

Returns:
	None

Sets the options of this draft tool.  
If a transition has to be performed, it can be defined by  
the mode Style as RightCorner or RoundCorner,  
RightCorner being a corner defined by a sharp angle,  
and RoundCorner being a rounded corner.  
AngleMin is an angular tolerance used to detect  
whether a transition has to be performed or not.  
AngleMax sets the maximum value within which a  
RightCorner transition can be performed.  
AngleMin and AngleMax are expressed in radians.") SetOptions;
		void SetOptions (const BRepBuilderAPI_TransitionMode Style = BRepBuilderAPI_RightCorner,const Standard_Real AngleMin = 0.01,const Standard_Real AngleMax = 3.0);
		%feature("autodoc", "Args:
	IsInternal(Standard_Boolean)=Standard_False

Returns:
	None

Sets the direction of the draft for this object.  
If IsInternal is true, the draft is internal to the argument  
Shape used in the constructor.") SetDraft;
		void SetDraft (const Standard_Boolean IsInternal = Standard_False);
		%feature("autodoc", "Args:
	LengthMax(Standard_Real)

Returns:
	None

Performs the draft using the length LengthMax as the  
maximum length for the corner edge between two draft faces.") Perform;
		void Perform (const Standard_Real LengthMax);
		%feature("autodoc", "Args:
	Surface(Handle_Geom_Surface)
	KeepInsideSurface(Standard_Boolean)=Standard_True

Returns:
	None

Performs the draft up to the surface Surface.  
If KeepInsideSurface is true, the part of Surface inside  
the draft is kept in the result.") Perform;
		void Perform (const Handle_Geom_Surface & Surface,const Standard_Boolean KeepInsideSurface = Standard_True);
		%feature("autodoc", "Args:
	StopShape(TopoDS_Shape)
	KeepOutSide(Standard_Boolean)=Standard_True

Returns:
	None

Performs the draft up to the shape StopShape.  
If KeepOutSide is true, the part of StopShape which is  
outside the Draft is kept in the result.") Perform;
		void Perform (const TopoDS_Shape & StopShape,const Standard_Boolean KeepOutSide = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

Returns the shell resulting from performance of the  
draft along the wire.") Shell;
		TopoDS_Shell Shell ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the  list   of shapes generated   from the  
         shape <S>.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
};


%feature("shadow") BRepOffsetAPI_MakeDraft::~BRepOffsetAPI_MakeDraft %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_MakeDraft {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_MakeEvolved;
class BRepOffsetAPI_MakeEvolved : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffsetAPI_MakeEvolved;
		 BRepOffsetAPI_MakeEvolved ();
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)
	Profil(TopoDS_Wire)
	Join(GeomAbs_JoinType)=GeomAbs_Arc
	AxeProf(Standard_Boolean)=Standard_True
	Solid(Standard_Boolean)=Standard_False
	ProfOnSpine(Standard_Boolean)=Standard_False
	Tol(Standard_Real)=0.0000001

Returns:
	None

No detailed docstring for this function.") BRepOffsetAPI_MakeEvolved;
		 BRepOffsetAPI_MakeEvolved (const TopoDS_Wire & Spine,const TopoDS_Wire & Profil,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean AxeProf = Standard_True,const Standard_Boolean Solid = Standard_False,const Standard_Boolean ProfOnSpine = Standard_False,const Standard_Real Tol = 0.0000001);
		%feature("autodoc", "Args:
	Spine(TopoDS_Face)
	Profil(TopoDS_Wire)
	Join(GeomAbs_JoinType)=GeomAbs_Arc
	AxeProf(Standard_Boolean)=Standard_True
	Solid(Standard_Boolean)=Standard_False
	ProfOnSpine(Standard_Boolean)=Standard_False
	Tol(Standard_Real)=0.0000001

Returns:
	None

These constructors construct an evolved shape by sweeping the profile  
Profile along the spine Spine.  
//!	The profile is defined in a coordinate system R.  
The coordinate system is determined by AxeProf:  
- if AxeProf is true, R is the global coordinate system,  
- if AxeProf is false, R is computed so that:  
  - its origin is given by the point on the spine which is  
   closest to the profile,  
  - its 'X Axis' is given by the tangent to the spine at this point, and  
- its 'Z Axis' is the normal to the plane which contains the spine.  
       The position of the profile at the current point of the  
spine is given by making R coincident with the local  
coordinate system given by the current point, the  
tangent vector and the normal to the spine.  
Join defines the type of pipe generated by the salient  
vertices of the spine. The default type is GeomAbs_Arc  
where the vertices generate revolved pipes about the  
axis passing along the vertex and the normal to the  
plane of the spine. At present, this is the only  
construction type implemented.") BRepOffsetAPI_MakeEvolved;
		 BRepOffsetAPI_MakeEvolved (const TopoDS_Face & Spine,const TopoDS_Wire & Profil,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean AxeProf = Standard_True,const Standard_Boolean Solid = Standard_False,const Standard_Boolean ProfOnSpine = Standard_False,const Standard_Real Tol = 0.0000001);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_Evolved

No detailed docstring for this function.") Evolved;
		const BRepFill_Evolved & Evolved ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the resulting shape (redefined from MakeShape).") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	SpineShape(TopoDS_Shape)
	ProfShape(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns   the  shapes  created  from   a  subshape  
         <SpineShape>  of     the  spine   and   a subshape  
         <ProfShape> on the profile.") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SpineShape,const TopoDS_Shape & ProfShape);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Return the face Top if <Solid> is True in the constructor.") Top;
		const TopoDS_Shape & Top ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Return the face Bottom  if <Solid> is True in the constructor.") Bottom;
		const TopoDS_Shape & Bottom ();
};


%feature("shadow") BRepOffsetAPI_MakeEvolved::~BRepOffsetAPI_MakeEvolved %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_MakeEvolved {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_MakeFilling;
class BRepOffsetAPI_MakeFilling : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	Degree(Standard_Integer)=3
	NbPtsOnCur(Standard_Integer)=15
	NbIter(Standard_Integer)=2
	Anisotropie(Standard_Boolean)=Standard_False
	Tol2d(Standard_Real)=0.00001
	Tol3d(Standard_Real)=0.0001
	TolAng(Standard_Real)=0.01
	TolCurv(Standard_Real)=0.1
	MaxDeg(Standard_Integer)=8
	MaxSegments(Standard_Integer)=9

Returns:
	None

Constructs a wire filling object defined by  
- the energy minimizing criterion Degree  
- the number of points on the curve NbPntsOnCur  
- the number of iterations NbIter  
- the Boolean Anisotropie  
- the 2D tolerance Tol2d  
- the 3D tolerance Tol3d  
- the angular tolerance TolAng  
- the tolerance for curvature TolCur  
- the highest polynomial degree MaxDeg  
- the greatest number of segments MaxSeg.  
If the Boolean Anistropie is true, the algorithm's  
performance is better in cases where the ratio of the  
length U and the length V indicate a great difference  
between the two. In other words, when the surface is, for  
example, extremely long.") BRepOffsetAPI_MakeFilling;
		 BRepOffsetAPI_MakeFilling (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 15,const Standard_Integer NbIter = 2,const Standard_Boolean Anisotropie = Standard_False,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Integer MaxDeg = 8,const Standard_Integer MaxSegments = 9);
		%feature("autodoc", "Args:
	Tol2d(Standard_Real)=0.00001
	Tol3d(Standard_Real)=0.0001
	TolAng(Standard_Real)=0.01
	TolCurv(Standard_Real)=0.1

Returns:
	None

Sets the values of Tolerances used to control the constraint.  
//!	Tol2d:  
//!	Tol3d:   it is the maximum distance allowed between the support surface  
//!	         and the constraints  
//!	TolAng:  it is the maximum angle allowed between the normal of the surface  
//!	         and the constraints  
//!	TolCurv: it is the maximum difference of curvature allowed between  
//!	         the surface and the constraint") SetConstrParam;
		void SetConstrParam (const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)=3
	NbPtsOnCur(Standard_Integer)=15
	NbIter(Standard_Integer)=2
	Anisotropie(Standard_Boolean)=Standard_False

Returns:
	None

Sets the parameters used for resolution.  
//!	The default values of these parameters have been chosen for a good  
//!	ratio quality/performance.  
//!	Degree:      it is the order of energy criterion to minimize for computing  
//!	             the deformation of the surface.  
//!	             The default value is 3  
//!	             The recommanded value is i+2 where i is the maximum order of the  
//!	             constraints.  
//!	NbPtsOnCur:  it is the average number of points for discretisation  
//!	             of the edges.  
//!	NbIter:      it is the maximum number of iterations of the process.  
//!	             For each iteration the number of discretisation points is  
//!	             increased.  
//!	Anisotropie:") SetResolParam;
		void SetResolParam (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 15,const Standard_Integer NbIter = 2,const Standard_Boolean Anisotropie = Standard_False);
		%feature("autodoc", "Args:
	MaxDeg(Standard_Integer)=8
	MaxSegments(Standard_Integer)=9

Returns:
	None

Sets the parameters used to approximate the filling  
surface. These include:  
- MaxDeg - the highest degree which the polynomial  
  defining the filling surface can have  
- MaxSegments - the greatest number of segments  
  which the filling surface can have.") SetApproxParam;
		void SetApproxParam (const Standard_Integer MaxDeg = 8,const Standard_Integer MaxSegments = 9);
		%feature("autodoc", "Args:
	Surf(TopoDS_Face)

Returns:
	None

Loads the initial surface Surf to  
begin the construction of the surface.  
This optional function is useful if the surface resulting from  
construction for the algorithm is likely to be complex.  
The support surface of the face under construction is computed by a  
deformation of Surf which satisfies the given constraints.  
The set of bounding edges defines the wire of the face.  
If no initial surface is given, the algorithm computes it  
automatically. If the set of edges is not connected (Free constraint),  
missing edges are automatically computed.") LoadInitSurface;
		void LoadInitSurface (const TopoDS_Face & Surf);
		%feature("autodoc", "Args:
	Constr(TopoDS_Edge)
	Order(GeomAbs_Shape)
	IsBound(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Adds a new constraint which also defines an edge of the wire  
//!	        of the face  
//!	Order: Order of the constraint:  
//!	       GeomAbs_C0 : the surface has to pass by 3D representation  
//!	                    of the edge  
//!	       GeomAbs_G1 : the surface has to pass by 3D representation  
//!	                    of the edge and to respect tangency with the first  
//!	                    face of the edge  
//!	       GeomAbs_G2 : the surface has to pass by 3D representation  
//!	                    of the edge and to respect tangency and curvature  
//!	                    with the first face of the edge.  
 Raises ConstructionError if the edge has no representation on a face and Order is  
GeomAbs_G1 or GeomAbs_G2.") Add;
		Standard_Integer Add (const TopoDS_Edge & Constr,const GeomAbs_Shape Order,const Standard_Boolean IsBound = Standard_True);
		%feature("autodoc", "Args:
	Constr(TopoDS_Edge)
	Support(TopoDS_Face)
	Order(GeomAbs_Shape)
	IsBound(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Adds a new constraint which also defines an edge of the wire  
//!	        of the face  
//!	Order: Order of the constraint:  
//!	       GeomAbs_C0 : the surface has to pass by 3D representation  
//!	                    of the edge  
//!	       GeomAbs_G1 : the surface has to pass by 3D representation  
//!	                    of the edge and to respect tangency with the  
//!	                    given face  
//!	       GeomAbs_G2 : the surface has to pass by 3D representation  
//!	                    of the edge and to respect tangency and curvature  
                   with the given face.  
Raises ConstructionError if the edge has no 2d representation on the given face") Add;
		Standard_Integer Add (const TopoDS_Edge & Constr,const TopoDS_Face & Support,const GeomAbs_Shape Order,const Standard_Boolean IsBound = Standard_True);
		%feature("autodoc", "Args:
	Support(TopoDS_Face)
	Order(GeomAbs_Shape)

Returns:
	Standard_Integer

Adds a free constraint on a face. The corresponding edge has to  
//!	be automatically recomputed. It is always a bound.") Add;
		Standard_Integer Add (const TopoDS_Face & Support,const GeomAbs_Shape Order);
		%feature("autodoc", "Args:
	Point(gp_Pnt)

Returns:
	Standard_Integer

Adds a punctual constraint.") Add;
		Standard_Integer Add (const gp_Pnt & Point);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Support(TopoDS_Face)
	Order(GeomAbs_Shape)

Returns:
	Standard_Integer

Adds a punctual constraint.") Add;
		Standard_Integer Add (const Standard_Real U,const Standard_Real V,const TopoDS_Face & Support,const GeomAbs_Shape Order);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the resulting faces") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Tests whether computation of the filling plate has been completed.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list of shapes generated from the  
         shape <S>.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the maximum distance between the result and  
the constraints. This is set at construction time.") G0Error;
		Standard_Real G0Error ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the maximum angle between the result and the  
constraints. This is set at construction time.") G1Error;
		Standard_Real G1Error ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the maximum angle between the result and the  
constraints. This is set at construction time.") G2Error;
		Standard_Real G2Error ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the maximum distance attained between the  
result and the constraint Index. This is set at construction time.") G0Error;
		Standard_Real G0Error (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the maximum angle between the result and the  
constraints. This is set at construction time.") G1Error;
		Standard_Real G1Error (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the greatest difference in curvature found  
between the result and the constraint Index.") G2Error;
		Standard_Real G2Error (const Standard_Integer Index);
};


%feature("shadow") BRepOffsetAPI_MakeFilling::~BRepOffsetAPI_MakeFilling %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_MakeFilling {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_MakeOffset;
class BRepOffsetAPI_MakeOffset : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an algorithm for creating an empty offset") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset ();
		%feature("autodoc", "Args:
	Spine(TopoDS_Face)
	Join(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

Constructs an algorithm for creating an algorithm  
to build parallels to the spine Spine") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset (const TopoDS_Face & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc);
		%feature("autodoc", "Args:
	Spine(TopoDS_Face)
	Join(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

Initializes the algorithm to construct parallels to the spine Spine.  
Join defines the type of parallel generated by the  
salient vertices of the spine. The default type is  
GeomAbs_Arc where the vertices generate sections  
of a circle. At present, this is the only construction type implemented.") Init;
		void Init (const TopoDS_Face & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc);
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)
	Join(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

No detailed docstring for this function.") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset (const TopoDS_Wire & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc);
		%feature("autodoc", "Args:
	Join(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

Initialize the evaluation of Offseting.") Init;
		void Init (const GeomAbs_JoinType Join = GeomAbs_Arc);
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)

Returns:
	None

Initializes the algorithm to construct parallels to the wire Spine.") AddWire;
		void AddWire (const TopoDS_Wire & Spine);
		%feature("autodoc", "Args:
	Offset(Standard_Real)
	Alt(Standard_Real)=0.0

Returns:
	None

Computes a parallel to the spine at distance Offset and  
at an altitude Alt from the plane of the spine in relation  
to the normal to the spine.  
Exceptions: StdFail_NotDone if the offset is not built.") Perform;
		void Perform (const Standard_Real Offset,const Standard_Real Alt = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the resulting shape (redefined from MakeShape).") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

returns a list of the created shapes  
         from the shape <S>.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
};


%feature("shadow") BRepOffsetAPI_MakeOffset::~BRepOffsetAPI_MakeOffset %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_MakeOffset {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_MakeOffsetShape;
class BRepOffsetAPI_MakeOffsetShape : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffsetAPI_MakeOffsetShape;
		 BRepOffsetAPI_MakeOffsetShape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Offset(Standard_Real)
	Tol(Standard_Real)
	Mode(BRepOffset_Mode)=BRepOffset_Skin
	Intersection(Standard_Boolean)=Standard_False
	SelfInter(Standard_Boolean)=Standard_False
	Join(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

Constructs a shape parallel to the shape S, where  
- S may be a face, a shell, a solid or a compound of these shape kinds;  
- Offset is the offset value. The offset shape is constructed:  
- outside S, if Offset is positive,  
- inside S, if Offset is negative;  
- Tol defines the coincidence tolerance criterion for generated shapes;  
- Mode defines the construction type of parallels  
  applied to the free edges of shape S; currently, only one  
  construction type is implemented, namely the one where the free  
edges do not generate parallels; this corresponds to the default  
  value BRepOffset_Skin;  
- Intersection specifies how the algorithm must work in  
  order to limit the parallels to two adjacent shapes:  
- if Intersection is false (default value), the intersection  
is calculated with the parallels to the two adjacent shapes,  
- if Intersection is true, the intersection is calculated by  
taking all generated parallels into account; this computation method is  
more general as it avoids some self-intersections generated in the  
offset shape from features of small dimensions on shape S, however this  
method has not been completely implemented and therefore is not  
recommended for use;  
- SelfInter tells the algorithm whether a computation  
  to eliminate self-intersections must be applied to the resulting  
shape; however, as this functionality is not yet  
implemented, it is recommended to use the default value (false);  
- Join defines how to fill the holes that may appear between  
  parallels to the two adjacent faces. It may take values  
  GeomAbs_Arc or GeomAbs_Intersection:  
- if Join is equal to GeomAbs_Arc, then pipes are generated  
between two free edges of two adjacent parallels,  
and spheres are generated on 'images' of vertices;  
          it is the default value,  
- if Join is equal to GeomAbs_Intersection, then the parallels to the  
two adjacent faces are enlarged and intersected,  
so that there are no free edges on parallels to faces.  
  Warnings  
1. All the faces of the shape S should be based on the surfaces  
with continuity at least C1.  
2. The offset value should be sufficiently small to avoid  
self-intersections in resulting shape. Otherwise these  
self-intersections may appear inside an offset face if its  
initial surface is not plane or sphere or cylinder, also some  
non-adjacent offset faces may intersect each other. Also, some  
offset surfaces may 'turn inside out'.  
  3. The algorithm may fail if the shape S contains vertices where  
more than 3 edges converge.  
4. Since 3d-offset algorithm involves intersection of surfaces,  
it is under limitations of surface intersection algorithm.  
5. A result cannot be generated if the underlying geometry of S is  
BSpline with continuity C0.  
Exceptions  
Geom_UndefinedDerivative if the underlying  
geometry of S is BSpline with continuity C0.") BRepOffsetAPI_MakeOffsetShape;
		 BRepOffsetAPI_MakeOffsetShape (const TopoDS_Shape & S,const Standard_Real Offset,const Standard_Real Tol,const BRepOffset_Mode Mode = BRepOffset_Skin,const Standard_Boolean Intersection = Standard_False,const Standard_Boolean SelfInter = Standard_False,const GeomAbs_JoinType Join = GeomAbs_Arc);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  BRepOffset_MakeOffset

No detailed docstring for this function.") MakeOffset;
		virtual const BRepOffset_MakeOffset & MakeOffset ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the resulting shape (redefined from MakeShape).") Build;
		virtual void Build ();
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
	TopTools_ListOfShape

Returns the list of edges generated from the shape <S>.") GeneratedEdge;
		const TopTools_ListOfShape & GeneratedEdge (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_JoinType

Returns offset join type.") GetJoinType;
		GeomAbs_JoinType GetJoinType ();
};


%feature("shadow") BRepOffsetAPI_MakeOffsetShape::~BRepOffsetAPI_MakeOffsetShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_MakeOffsetShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_MakePipe;
class BRepOffsetAPI_MakePipe : public BRepPrimAPI_MakeSweep {
	public:
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)
	Profile(TopoDS_Shape)

Returns:
	None

Constructs a pipe by sweeping the shape Profile along  
the wire Spine.The angle made by the spine with the profile is  
maintained along the length of the pipe.  
Warning  
Spine must be G1 continuous; that is, on the connection  
vertex of two edges of the wire, the tangent vectors on  
the left and on the right must have the same direction,  
though not necessarily the same magnitude.  
Exceptions  
Standard_DomainError if the profile is a solid or a  
composite solid.") BRepOffsetAPI_MakePipe;
		 BRepOffsetAPI_MakePipe (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile);
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)
	Profile(TopoDS_Shape)
	aMode(GeomFill_Trihedron)
	ForceApproxC1(Standard_Boolean)=Standard_False

Returns:
	None

the same as previous but with setting of  
         mode of sweep and the flag that indicates attempt  
         to approximate a C1-continuous surface if a swept  
         surface proved to be C0.") BRepOffsetAPI_MakePipe;
		 BRepOffsetAPI_MakePipe (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile,const GeomFill_Trihedron aMode,const Standard_Boolean ForceApproxC1 = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_Pipe

No detailed docstring for this function.") Pipe;
		const BRepFill_Pipe & Pipe ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the resulting shape (redefined from MakeShape).") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the  TopoDS  Shape of the bottom of the prism.") FirstShape;
		TopoDS_Shape FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the top of the prism.") LastShape;
		TopoDS_Shape LastShape ();
		%feature("autodoc", "Args:
	SSpine(TopoDS_Shape)
	SProfile(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Generated;
		TopoDS_Shape Generated (const TopoDS_Shape & SSpine,const TopoDS_Shape & SProfile);
};


%feature("shadow") BRepOffsetAPI_MakePipe::~BRepOffsetAPI_MakePipe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_MakePipe {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_MakePipeShell;
class BRepOffsetAPI_MakePipeShell : public BRepPrimAPI_MakeSweep {
	public:
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)

Returns:
	None

Constructs the shell-generating framework defined by the wire Spine.  Sets an sweep's mode  
        If no mode are setted, the mode use in MakePipe is used") BRepOffsetAPI_MakePipeShell;
		 BRepOffsetAPI_MakePipeShell (const TopoDS_Wire & Spine);
		%feature("autodoc", "Args:
	IsFrenet(Standard_Boolean)=Standard_False

Returns:
	None

Sets a Frenet or a CorrectedFrenet trihedron  
         to  perform  the  sweeping  
//!	 If IsFrenet is false, a corrected Frenet trihedron is used.") SetMode;
		void SetMode (const Standard_Boolean IsFrenet = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets a Discrete trihedron  
         to  perform  the  sweeping") SetDiscreteMode;
		void SetDiscreteMode ();
		%feature("autodoc", "Args:
	Axe(gp_Ax2)

Returns:
	None

Sets  a  fixed  trihedron  to  perform  the  sweeping  
        all sections will be parallel.") SetMode;
		void SetMode (const gp_Ax2 & Axe);
		%feature("autodoc", "Args:
	BiNormal(gp_Dir)

Returns:
	None

Sets a fixed BiNormal  direction to perform the --  
            sweeping.   Angular   relations   beetween  the  
         section(s) and <BiNormal> will be constant") SetMode;
		void SetMode (const gp_Dir & BiNormal);
		%feature("autodoc", "Args:
	SpineSupport(TopoDS_Shape)

Returns:
	Standard_Boolean

Sets support to the spine to define the BiNormal of  
         the trihedron, like the normal  to the surfaces.  
 Warning:  To be effective, Each  edge of the <spine> must  
         have an representaion on one face of<SpineSupport>") SetMode;
		Standard_Boolean SetMode (const TopoDS_Shape & SpineSupport);
		%feature("autodoc", "Args:
	AuxiliarySpine(TopoDS_Wire)
	CurvilinearEquivalence(Standard_Boolean)
	KeepContact(BRepFill_TypeOfContact)=BRepFill_NoContact

Returns:
	None

Sets  an  auxiliary  spine  to  define  the Normal  
 For  each  Point  of  the  Spine  P,  an  Point  Q  is  evalued  
   on  <AuxiliarySpine>  
If <CurvilinearEquivalence>  
  Q split <AuxiliarySpine> with  the  same  length ratio  
  than P split  <Spline>.  
Else  the  plan  define  by  P  and  the  tangent  to  the  <Spine>  
      intersect <AuxiliarySpine> in Q.  
If <KeepContact> equals BRepFill_NoContact: The Normal is defined  
by the vector PQ.  
If <KeepContact> equals BRepFill_Contact: The Normal is defined to  
achieve that the sweeped section is in contact to the  
auxiliarySpine. The width of section is constant all along the path.  
In other words, the auxiliary spine lies on the swept surface,  
but not necessarily is a boundary of this surface. However,  
the auxiliary spine has to be close enough to the main spine  
to provide intersection with any section all along the path.  
If <KeepContact> equals BRepFill_ContactOnBorder: The auxiliary spine  
becomes a boundary of the swept surface and the width of section varies  
along the path.  Give section to sweep.  
Possibilities are :  
//!	- Give one or sevral section  
    - Give one profile and an homotetic law.  
    - Automatic compute of correspondance beetween spine, and section  
                on the sweeped shape  
    - correspondance beetween spine, and section on the sweeped shape  
      defined by a vertex of the spine") SetMode;
		void SetMode (const TopoDS_Wire & AuxiliarySpine,const Standard_Boolean CurvilinearEquivalence,const BRepFill_TypeOfContact KeepContact = BRepFill_NoContact);
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)
	WithContact(Standard_Boolean)=Standard_False
	WithCorrection(Standard_Boolean)=Standard_False

Returns:
	None

Adds the section Profile to this framework. First and last  
sections may be punctual, so the shape Profile may be  
both wire and vertex. Correspondent point on spine is  
computed automatically.  
If WithContact is true, the section is translated to be in  
contact with the spine.  
 If WithCorrection is true, the section is rotated to be  
orthogonal to the spine?s tangent in the correspondent  
point. This option has no sense if the section is punctual  
(Profile is of type TopoDS_Vertex).") Add;
		void Add (const TopoDS_Shape & Profile,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)
	Location(TopoDS_Vertex)
	WithContact(Standard_Boolean)=Standard_False
	WithCorrection(Standard_Boolean)=Standard_False

Returns:
	None

Adds the section Profile to this framework.  
Correspondent point on the spine is given by Location.  
Warning:  
To be effective, it is not recommended to combine methods Add and SetLaw.") Add;
		void Add (const TopoDS_Shape & Profile,const TopoDS_Vertex & Location,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)
	L(Handle_Law_Function)
	WithContact(Standard_Boolean)=Standard_False
	WithCorrection(Standard_Boolean)=Standard_False

Returns:
	None

Sets the evolution law defined by the wire Profile with  
its position (Location, WithContact, WithCorrection  
are the same options as in methods Add) and a  
homotetic law defined by the function L.  
Warning:  
To be effective, it is not recommended to combine methods Add and SetLaw.") SetLaw;
		void SetLaw (const TopoDS_Shape & Profile,const Handle_Law_Function & L,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)
	L(Handle_Law_Function)
	Location(TopoDS_Vertex)
	WithContact(Standard_Boolean)=Standard_False
	WithCorrection(Standard_Boolean)=Standard_False

Returns:
	None

Sets the evolution law defined by the wire Profile with  
its position (Location, WithContact, WithCorrection  
are the same options as in methods Add) and a  
homotetic law defined by the function L.  
Warning:  
To be effective, it is not recommended to combine methods Add and SetLaw.") SetLaw;
		void SetLaw (const TopoDS_Shape & Profile,const Handle_Law_Function & L,const TopoDS_Vertex & Location,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)

Returns:
	None

Removes the section Profile from this framework.") Delete;
		void Delete (const TopoDS_Shape & Profile);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this tool object is ready to build the  
shape, i.e. has a definition for the wire section Profile.") IsReady;
		Standard_Boolean IsReady ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepBuilderAPI_PipeError

Get a status, when Simulate or Build failed.       It can be  
     BRepBuilderAPI_PipeDone,  
     BRepBuilderAPI_PipeNotDone,  
     BRepBuilderAPI_PlaneNotIntersectGuide,  
     BRepBuilderAPI_ImpossibleContact.") GetStatus;
		BRepBuilderAPI_PipeError GetStatus ();
		%feature("autodoc", "Args:
	Tol3d(Standard_Real)=1.0e-4
	BoundTol(Standard_Real)=1.0e-4
	TolAngular(Standard_Real)=1.0e-2

Returns:
	None

Sets the following tolerance values  
- 3D tolerance Tol3d  
- boundary tolerance BoundTol  
- angular tolerance TolAngular.") SetTolerance;
		void SetTolerance (const Standard_Real Tol3d = 1.0e-4,const Standard_Real BoundTol = 1.0e-4,const Standard_Real TolAngular = 1.0e-2);
		%feature("autodoc", "Args:
	ForceApproxC1(Standard_Boolean)

Returns:
	None

Set the flag that indicates attempt to approximate  
         a C1-continuous surface if a swept surface proved  
         to be C0.") SetForceApproxC1;
		void SetForceApproxC1 (const Standard_Boolean ForceApproxC1);
		%feature("autodoc", "Args:
	Mode(BRepBuilderAPI_TransitionMode)=BRepBuilderAPI_Transformed

Returns:
	None

Sets the transition mode to manage discontinuities on  
the swept shape caused by fractures on the spine. The  
transition mode can be BRepBuilderAPI_Transformed  
(default value), BRepBuilderAPI_RightCorner,  
BRepBuilderAPI_RoundCorner:  
     -              RepBuilderAPI_Transformed:  
          discontinuities are treated by  
          modification of the sweeping mode. The  
          pipe is 'transformed' at the fractures of  
          the spine. This mode assumes building a  
          self-intersected shell.  
-              BRepBuilderAPI_RightCorner:  
          discontinuities are treated like right  
          corner. Two pieces of the pipe  
          corresponding to two adjacent  
          segments of the spine are extended  
          and intersected at a fracture of the spine.  
-              BRepBuilderAPI_RoundCorner:  
          discontinuities are treated like round  
          corner. The corner is treated as rotation  
          of the profile around an axis which  
          passes through the point of the spine?s  
          fracture. This axis is based on cross  
          product of directions tangent to the  
     adjacent segments of the spine at their common point.  
Warnings  
The mode BRepBuilderAPI_RightCorner provides a  
valid result if intersection of two pieces of the pipe  
(corresponding to two adjacent segments of the spine)  
in the neighborhood of the spine?s fracture is  
connected and planar. This condition can be violated if  
the spine is non-linear in some neighborhood of the  
fracture or if the profile was set with a scaling law.  
The last mode, BRepBuilderAPI_RoundCorner, will  
assuredly provide a good result only if a profile was set  
with option WithCorrection = True, i.e. it is strictly  
orthogonal to the spine.") SetTransitionMode;
		void SetTransitionMode (const BRepBuilderAPI_TransitionMode Mode = BRepBuilderAPI_Transformed);
		%feature("autodoc", "Args:
	NumberOfSection(Standard_Integer)
	Result(TopTools_ListOfShape)

Returns:
	None

Simulates the resulting shape by calculating its  
cross-sections. The spine is devided by this  
cross-sections into (NumberOfSection - 1) equal  
parts, the number of cross-sections is  
NumberOfSection. The cross-sections are wires and  
they are returned in the list Result.  
This gives a rapid preview of the resulting shape,  
which will be obtained using the settings you have provided.  
Raises  NotDone if  <self> it is not Ready") Simulate;
		void Simulate (const Standard_Integer NumberOfSection,TopTools_ListOfShape & Result);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the resulting shape (redefined from MakeShape).") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Transforms the sweeping Shell in Solid.  
         If a propfile is not closed returns False") MakeSolid;
		Standard_Boolean MakeSolid ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Shape

Returns the  TopoDS  Shape of the bottom of the sweep.") FirstShape;
		virtual TopoDS_Shape FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Shape

Returns the TopoDS Shape of the top of the sweep.") LastShape;
		virtual TopoDS_Shape LastShape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns a list of new shapes generated from the shape  
S by the shell-generating algorithm.  
This function is redefined from BRepOffsetAPI_MakeShape::Generated.  
S can be an edge of the given Spine (see Constructor),  
it can be an edge or a boundary vertex of a shape  
returned by the method FirstShape(), it can also be a  
Profile (see method Add()) closest to the beginning or  
the end of the Spine.  
If S is an edge of the given Spine, then method  
Generated() returns a list of generated faces and a list  
of edges from a free boundary (if it exists) of the  
resulting shell.  
If S is an edge of the start shape (see FirstShape()),  
method Generated() returns a list of faces generated  
along the whole spine from the given edge.  
If S is a boundary vertex of the start shape (see  
FirstShape()), method Generated() returns a list of  
edges from the free boundary of the resulting shell,  
generated along the whole spine.  
If S is a Profile closest to the beginning of the Spine,  
method Generated() returns the start shape, that can  
also be obtained by method FirstShape().  
If S is a Profile closest to the end of the Spine, method  
Generated() returns the end shape, that can also be  
obtained by method LastShape().") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
};


%feature("shadow") BRepOffsetAPI_MakePipeShell::~BRepOffsetAPI_MakePipeShell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_MakePipeShell {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_MiddlePath;
class BRepOffsetAPI_MiddlePath : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	StartShape(TopoDS_Shape)
	EndShape(TopoDS_Shape)

Returns:
	None

General constructor.  
         StartShape and EndShape may be  
         a wire or a face") BRepOffsetAPI_MiddlePath;
		 BRepOffsetAPI_MiddlePath (const TopoDS_Shape & aShape,const TopoDS_Shape & StartShape,const TopoDS_Shape & EndShape);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Build;
		virtual void Build ();
};


%feature("shadow") BRepOffsetAPI_MiddlePath::~BRepOffsetAPI_MiddlePath %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_MiddlePath {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_NormalProjection;
class BRepOffsetAPI_NormalProjection : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty framework to define projection on  
a shape according to the normal from each point to be  
projected to the shape.") BRepOffsetAPI_NormalProjection;
		 BRepOffsetAPI_NormalProjection ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Constructs a framework to define projection onto the  
basis shape S according to the normal from each point  
to be projected from the shape added to this framework by Add.  
Default parameters of the algorithm: Tol3D = 1.e-04, Tol2D =sqr(tol3d)  
, InternalContinuity = GeomAbs_C2, MaxDegree = 14, MaxSeg = 16.") BRepOffsetAPI_NormalProjection;
		 BRepOffsetAPI_NormalProjection (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes the empty constructor framework with the shape S.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	ToProj(TopoDS_Shape)

Returns:
	None

Adds the shape ToProj to the framework for calculation  
of the projection by Compute3d.  
ToProj is an edge or a wire and will be projected onto the basis shape.  
Exceptions  
Standard_ConstructionError if ToProj is not added.") Add;
		void Add (const TopoDS_Shape & ToProj);
		%feature("autodoc", "Args:
	Tol3D(Standard_Real)
	Tol2D(Standard_Real)
	InternalContinuity(GeomAbs_Shape)
	MaxDegree(Standard_Integer)
	MaxSeg(Standard_Integer)

Returns:
	None

Sets the parameters  used  for computation  
         Tol3 is the requiered  tolerance between the  3d projected  
         curve  and     its    2d    representation  
         InternalContinuity  is the order of constraints  
         used for  approximation  
         MaxDeg and MaxSeg are the maximum degree and the maximum  
         number of segment for BSpline resulting of an approximation.") SetParams;
		void SetParams (const Standard_Real Tol3D,const Standard_Real Tol2D,const GeomAbs_Shape InternalContinuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSeg);
		%feature("autodoc", "Args:
	MaxDist(Standard_Real)

Returns:
	None

Sets the maximum distance between target shape and  
 shape to project. If this condition is not satisfied then corresponding  
 part of solution is discarded.  
 if MaxDist < 0 then this method does not affect the algorithm") SetMaxDistance;
		void SetMaxDistance (const Standard_Real MaxDist);
		%feature("autodoc", "Args:
	FaceBoundaries(Standard_Boolean)=Standard_True

Returns:
	None

Manage  limitation  of  projected  edges.") SetLimit;
		void SetLimit (const Standard_Boolean FaceBoundaries = Standard_True);
		%feature("autodoc", "Args:
	With3d(Standard_Boolean)=Standard_True

Returns:
	None

Returns true if a 3D curve is computed. If not, false is  
returned and an initial 3D curve is kept to build the resulting edges.") Compute3d;
		void Compute3d (const Standard_Boolean With3d = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the result of the projection as a compound of  
wires. Tries to build oriented wires.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the object was correctly built by the shape  
construction algorithm.  
If at the construction time of the shape, the algorithm  
cannot be completed, or the original data is corrupted,  
IsDone returns false and therefore protects the use of  
functions to access the result of the construction  
(typically the Shape function).") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Performs the projection.  
The construction of the result is performed by Build.  
Exceptions  
StdFail_NotDone if the projection was not performed.") Projection;
		const TopoDS_Shape & Projection ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopoDS_Shape

Returns the initial face corresponding to the projected edge E.  
Exceptions  
StdFail_NotDone if no face was found.  
Standard_NoSuchObject if if a face corresponding to  
E has already been found.") Couple;
		const TopoDS_Shape & Couple (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the  list   of shapes generated   from the  
         shape <S>.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopoDS_Shape

Returns the initial edge corresponding to the edge E  
resulting from the computation of the projection.  
Exceptions  
StdFail_NotDone if no edge was found.  
Standard_NoSuchObject if an edge corresponding to  
E has already been found.") Ancestor;
		const TopoDS_Shape & Ancestor (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Liste(TopTools_ListOfShape)

Returns:
	Standard_Boolean

build the result as a list of wire if possible in --  
 a first returns a wire only if there is only a wire.") BuildWire;
		Standard_Boolean BuildWire (TopTools_ListOfShape & Liste);
};


%feature("shadow") BRepOffsetAPI_NormalProjection::~BRepOffsetAPI_NormalProjection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_NormalProjection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal;
class BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(TColStd_SequenceOfReal)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal;
		 BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal (const TColStd_SequenceOfReal & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") Value;
		TColStd_SequenceOfReal & Value ();
};


%feature("shadow") BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal::~BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal {
	Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal GetHandle() {
	return *(Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal*) &$self;
	}
};

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
    BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal* GetObject() {
    return (BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal::~Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape;
class BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(TopTools_SequenceOfShape)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape;
		 BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape (const TopTools_SequenceOfShape & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") Value;
		TopTools_SequenceOfShape & Value ();
};


%feature("shadow") BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape::~BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape {
	Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape GetHandle() {
	return *(Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape*) &$self;
	}
};

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
    BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape* GetObject() {
    return (BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape::~Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepOffsetAPI_SequenceNodeOfSequenceOfSequenceOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepOffsetAPI_SequenceOfSequenceOfReal;
class BRepOffsetAPI_SequenceOfSequenceOfReal : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffsetAPI_SequenceOfSequenceOfReal;
		 BRepOffsetAPI_SequenceOfSequenceOfReal ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(BRepOffsetAPI_SequenceOfSequenceOfReal)

Returns:
	BRepOffsetAPI_SequenceOfSequenceOfReal

No detailed docstring for this function.") Assign;
		const BRepOffsetAPI_SequenceOfSequenceOfReal & Assign (const BRepOffsetAPI_SequenceOfSequenceOfReal & Other);
		%feature("autodoc", "Args:
	Other(BRepOffsetAPI_SequenceOfSequenceOfReal)

Returns:
	BRepOffsetAPI_SequenceOfSequenceOfReal

No detailed docstring for this function.") operator=;
		const BRepOffsetAPI_SequenceOfSequenceOfReal & operator = (const BRepOffsetAPI_SequenceOfSequenceOfReal & Other);
		%feature("autodoc", "Args:
	T(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TColStd_SequenceOfReal & T);
		%feature("autodoc", "Args:
	S(BRepOffsetAPI_SequenceOfSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepOffsetAPI_SequenceOfSequenceOfReal & S);
		%feature("autodoc", "Args:
	T(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TColStd_SequenceOfReal & T);
		%feature("autodoc", "Args:
	S(BRepOffsetAPI_SequenceOfSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepOffsetAPI_SequenceOfSequenceOfReal & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TColStd_SequenceOfReal & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepOffsetAPI_SequenceOfSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfReal & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TColStd_SequenceOfReal & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepOffsetAPI_SequenceOfSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfReal & S);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") First;
		const TColStd_SequenceOfReal & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") Last;
		const TColStd_SequenceOfReal & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(BRepOffsetAPI_SequenceOfSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfReal & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") Value;
		const TColStd_SequenceOfReal & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_SequenceOfReal & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") ChangeValue;
		TColStd_SequenceOfReal & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") BRepOffsetAPI_SequenceOfSequenceOfReal::~BRepOffsetAPI_SequenceOfSequenceOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_SequenceOfSequenceOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_SequenceOfSequenceOfShape;
class BRepOffsetAPI_SequenceOfSequenceOfShape : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffsetAPI_SequenceOfSequenceOfShape;
		 BRepOffsetAPI_SequenceOfSequenceOfShape ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(BRepOffsetAPI_SequenceOfSequenceOfShape)

Returns:
	BRepOffsetAPI_SequenceOfSequenceOfShape

No detailed docstring for this function.") Assign;
		const BRepOffsetAPI_SequenceOfSequenceOfShape & Assign (const BRepOffsetAPI_SequenceOfSequenceOfShape & Other);
		%feature("autodoc", "Args:
	Other(BRepOffsetAPI_SequenceOfSequenceOfShape)

Returns:
	BRepOffsetAPI_SequenceOfSequenceOfShape

No detailed docstring for this function.") operator=;
		const BRepOffsetAPI_SequenceOfSequenceOfShape & operator = (const BRepOffsetAPI_SequenceOfSequenceOfShape & Other);
		%feature("autodoc", "Args:
	T(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopTools_SequenceOfShape & T);
		%feature("autodoc", "Args:
	S(BRepOffsetAPI_SequenceOfSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepOffsetAPI_SequenceOfSequenceOfShape & S);
		%feature("autodoc", "Args:
	T(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopTools_SequenceOfShape & T);
		%feature("autodoc", "Args:
	S(BRepOffsetAPI_SequenceOfSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepOffsetAPI_SequenceOfSequenceOfShape & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TopTools_SequenceOfShape & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepOffsetAPI_SequenceOfSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfShape & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TopTools_SequenceOfShape & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepOffsetAPI_SequenceOfSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfShape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") First;
		const TopTools_SequenceOfShape & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") Last;
		const TopTools_SequenceOfShape & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(BRepOffsetAPI_SequenceOfSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,BRepOffsetAPI_SequenceOfSequenceOfShape & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") Value;
		const TopTools_SequenceOfShape & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopTools_SequenceOfShape & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") ChangeValue;
		TopTools_SequenceOfShape & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") BRepOffsetAPI_SequenceOfSequenceOfShape::~BRepOffsetAPI_SequenceOfSequenceOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_SequenceOfSequenceOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_ThruSections;
class BRepOffsetAPI_ThruSections : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	isSolid(Standard_Boolean)=Standard_False
	ruled(Standard_Boolean)=Standard_False
	pres3d(Standard_Real)=1.0e-06

Returns:
	None

Initializes an algorithm for building a shell or a solid  
passing through a set of sections, where:  
-          isSolid is set to true if the construction algorithm is  
  required to build a solid or to false if it is required to build  
  a shell (the default value),  
-          ruled is set to true if the faces generated between  
  the edges of two consecutive wires are ruled surfaces or to  
  false (the default value) if they are smoothed out by approximation,  
-          pres3d defines the precision criterion used by the  
  approximation algorithm; the default value is 1.0e-6.  
  Use AddWire and AddVertex to define the  
successive sections of the shell or solid to be built.") BRepOffsetAPI_ThruSections;
		 BRepOffsetAPI_ThruSections (const Standard_Boolean isSolid = Standard_False,const Standard_Boolean ruled = Standard_False,const Standard_Real pres3d = 1.0e-06);
		%feature("autodoc", "Args:
	isSolid(Standard_Boolean)=Standard_False
	ruled(Standard_Boolean)=Standard_False
	pres3d(Standard_Real)=1.0e-06

Returns:
	None

Initializes this algorithm for building a shell or a solid  
passing through a set of sections, where:  
- isSolid is set to true if this construction algorithm is  
  required to build a solid or to false if it is required to  
  build a shell. false is the default value;  
- ruled is set to true if the faces generated between the  
  edges of two consecutive wires are ruled surfaces or  
to false (the default value) if they are smoothed out by approximation,  
- pres3d defines the precision criterion used by the  
  approximation algorithm; the default value is 1.0e-6.  
  Use AddWire and AddVertex to define the successive  
sections of the shell or solid to be built.") Init;
		void Init (const Standard_Boolean isSolid = Standard_False,const Standard_Boolean ruled = Standard_False,const Standard_Real pres3d = 1.0e-06);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)

Returns:
	None

Adds the wire wire to the set of  
sections through which the shell or solid is built.  
Use the Build function to construct the shape.") AddWire;
		void AddWire (const TopoDS_Wire & wire);
		%feature("autodoc", "Args:
	aVertex(TopoDS_Vertex)

Returns:
	None

Adds the vertex Vertex (punctual section) to the set of sections  
through which the shell or solid is built. A vertex may be added to the  
set of sections only as first or last section. At least one wire  
must be added to the set of sections by the method AddWire.  
Use the Build function to construct the shape.") AddVertex;
		void AddVertex (const TopoDS_Vertex & aVertex);
		%feature("autodoc", "Args:
	check(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") CheckCompatibility;
		void CheckCompatibility (const Standard_Boolean check = Standard_True);
		%feature("autodoc", "Args:
	UseSmoothing(Standard_Boolean)

Returns:
	None

Define the approximation algorithm") SetSmoothing;
		void SetSmoothing (const Standard_Boolean UseSmoothing);
		%feature("autodoc", "Args:
	ParType(Approx_ParametrizationType)

Returns:
	None

Define the type of parametrization   used in the approximation") SetParType;
		void SetParType (const Approx_ParametrizationType ParType);
		%feature("autodoc", "Args:
	C(GeomAbs_Shape)

Returns:
	None

Define the Continuity used in the approximation") SetContinuity;
		void SetContinuity (const GeomAbs_Shape C);
		%feature("autodoc", "Args:
	W1(Standard_Real)
	W2(Standard_Real)
	W3(Standard_Real)

Returns:
	None

define the Weights  associed to the criterium used in  
         the  optimization.  
 
if Wi <= 0") SetCriteriumWeight;
		void SetCriteriumWeight (const Standard_Real W1,const Standard_Real W2,const Standard_Real W3);
		%feature("autodoc", "Args:
	MaxDeg(Standard_Integer)

Returns:
	None

Define the maximal U degree of result surface") SetMaxDegree;
		void SetMaxDegree (const Standard_Integer MaxDeg);
		%feature("autodoc", "Args:
	None
Returns:
	Approx_ParametrizationType

returns the type of parametrization used in the approximation") ParType;
		Approx_ParametrizationType ParType ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

returns the Continuity used in the approximation") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the maximal U degree of result surface") MaxDegree;
		Standard_Integer MaxDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Define the approximation algorithm") UseSmoothing;
		Standard_Boolean UseSmoothing ();
		%feature("autodoc", "Args:
	W1(Standard_Real)
	W2(Standard_Real)
	W3(Standard_Real)

Returns:
	None

returns the Weights associed  to the criterium used in  
         the  optimization.") CriteriumWeight;
		void CriteriumWeight (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the bottom of the loft if solid") FirstShape;
		const TopoDS_Shape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the top of the loft if solid") LastShape;
		const TopoDS_Shape & LastShape ();
		%feature("autodoc", "Args:
	Edge(TopoDS_Shape)

Returns:
	TopoDS_Shape

if Ruled  
           Returns the Face generated by each edge  
           except the last wire  
         if smoothed  
           Returns the Face generated by each edge of the first wire") GeneratedFace;
		TopoDS_Shape GeneratedFace (const TopoDS_Shape & Edge);
};


%feature("shadow") BRepOffsetAPI_ThruSections::~BRepOffsetAPI_ThruSections %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_ThruSections {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffsetAPI_MakeThickSolid;
class BRepOffsetAPI_MakeThickSolid : public BRepOffsetAPI_MakeOffsetShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffsetAPI_MakeThickSolid;
		 BRepOffsetAPI_MakeThickSolid ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ClosingFaces(TopTools_ListOfShape)
	Offset(Standard_Real)
	Tol(Standard_Real)
	Mode(BRepOffset_Mode)=BRepOffset_Skin
	Intersection(Standard_Boolean)=Standard_False
	SelfInter(Standard_Boolean)=Standard_False
	Join(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

Constructs a hollowed solid from  
the solid S by removing the set of faces ClosingFaces from S, where:  
      Offset defines the thickness of the walls. Its sign indicates  
  which side of the surface of the solid the hollowed shape is built on;  
 - Tol defines the tolerance criterion for coincidence in generated shapes;  
 - Mode defines the construction type of parallels applied to free  
  edges of shape S. Currently, only one construction type is  
  implemented, namely the one where the free edges do not generate  
  parallels; this corresponds to the default value BRepOffset_Skin;  
  Intersection specifies how the algorithm must work in order to  
  limit the parallels to two adjacent shapes:  
- if Intersection is false (default value), the intersection  
  is calculated with the parallels to the two adjacent shapes,  
 -     if Intersection is true, the intersection is calculated by  
  taking account of all parallels generated; this computation  
  method is more general as it avoids self-intersections  
  generated in the offset shape from features of small dimensions  
  on shape S, however this method has not been completely  
  implemented and therefore is not recommended for use;  
 -     SelfInter tells the algorithm whether a computation to  
  eliminate self-intersections needs to be applied to the  
  resulting shape. However, as this functionality is not yet  
  implemented, you should use the default value (false);  
 - Join defines how to fill the holes that may appear between  
  parallels to the two adjacent faces. It may take values  
  GeomAbs_Arc or GeomAbs_Intersection:  
- if Join is equal to GeomAbs_Arc, then pipes are generated  
          between two free edges of two adjacent parallels,  
          and spheres are generated on 'images' of vertices;  
          it is the default value,  
- if Join is equal to GeomAbs_Intersection,  
  then the parallels to the two adjacent faces are  
  enlarged and intersected, so that there are no free  
  edges on parallels to faces.  
  Warnings  
Since the algorithm of MakeThickSolid is based on  
MakeOffsetShape algorithm, the warnings are the same as for  
MakeOffsetShape.") BRepOffsetAPI_MakeThickSolid;
		 BRepOffsetAPI_MakeThickSolid (const TopoDS_Shape & S,const TopTools_ListOfShape & ClosingFaces,const Standard_Real Offset,const Standard_Real Tol,const BRepOffset_Mode Mode = BRepOffset_Skin,const Standard_Boolean Intersection = Standard_False,const Standard_Boolean SelfInter = Standard_False,const GeomAbs_JoinType Join = GeomAbs_Arc);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the resulting shape (redefined from MakeOffsetShape).") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes modified from the shape  
         <S>.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
};


%feature("shadow") BRepOffsetAPI_MakeThickSolid::~BRepOffsetAPI_MakeThickSolid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffsetAPI_MakeThickSolid {
	void _kill_pointed() {
		delete $self;
	}
};
