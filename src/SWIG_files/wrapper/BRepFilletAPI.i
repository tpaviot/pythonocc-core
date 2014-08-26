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
%module BRepFilletAPI

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

%include BRepFilletAPI_required_python_modules.i
%include BRepFilletAPI_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepFilletAPI_LocalOperation;
class BRepFilletAPI_LocalOperation : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	virtual void

Adds a  contour in  the  builder  (builds a  
         contour  of tangent edges).") Add;
		virtual void Add (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	virtual void

Reset the contour of index IC, there is nomore  
         information in the contour.") ResetContour;
		virtual void ResetContour (const Standard_Integer IC);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Number of contours.") NbContours;
		virtual Standard_Integer NbContours ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	virtual Standard_Integer

Returns the index of  the  contour containing the edge  
         E, returns 0 if E doesn't belong to any contour.") Contour;
		virtual Standard_Integer Contour (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	virtual Standard_Integer

Number of Edges in the contour I.") NbEdges;
		virtual Standard_Integer NbEdges (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)

Returns:
	virtual  TopoDS_Edge

Returns the Edge J in the contour I.") Edge;
		virtual const TopoDS_Edge & Edge (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	virtual void

remove the contour containing the Edge E.") Remove;
		virtual void Remove (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	virtual Standard_Real

returns the length the contour of index IC.") Length;
		virtual Standard_Real Length (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	virtual TopoDS_Vertex

Returns the first Vertex of the contour of index IC.") FirstVertex;
		virtual TopoDS_Vertex FirstVertex (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	virtual TopoDS_Vertex

Returns the last Vertex of the contour of index IC.") LastVertex;
		virtual TopoDS_Vertex LastVertex (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	virtual Standard_Real

returns the abscissa of the vertex V on  
         the contour of index IC.") Abscissa;
		virtual Standard_Real Abscissa (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	virtual Standard_Real

returns the relative abscissa([0.,1.]) of the  
         vertex V on the contour of index IC.") RelativeAbscissa;
		virtual Standard_Real RelativeAbscissa (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	virtual Standard_Boolean

returns true if the contour of index IC is closed  
         an tangent.") ClosedAndTangent;
		virtual Standard_Boolean ClosedAndTangent (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	virtual Standard_Boolean

returns true if the contour of index IC is closed") Closed;
		virtual Standard_Boolean Closed (const Standard_Integer IC);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Reset all the fields updated   by Build operation  and  
         leave the  algorithm in  the  same state  than  before  
         build    call.  It   allows   contours    and   radius  
         modifications  to build the result another time.") Reset;
		virtual void Reset ();
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") Simulate;
		virtual void Simulate (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	virtual Standard_Integer

No detailed docstring for this function.") NbSurf;
		virtual Standard_Integer NbSurf (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	IS(Standard_Integer)

Returns:
	virtual Handle_ChFiDS_SecHArray1

No detailed docstring for this function.") Sect;
		virtual Handle_ChFiDS_SecHArray1 Sect (const Standard_Integer IC,const Standard_Integer IS);
};


%feature("shadow") BRepFilletAPI_LocalOperation::~BRepFilletAPI_LocalOperation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFilletAPI_LocalOperation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFilletAPI_MakeFillet2d;
class BRepFilletAPI_MakeFillet2d : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes an empty algorithm for computing fillets and  
  chamfers. The face on which the fillets and  
  chamfers are built is defined using the Init function.  
The vertices on which fillets or chamfers are built are  
defined using the AddFillet or AddChamfer function.  
Warning  
The status of the initialization, as given by the Status  
function, can be one of the following:  
-   ChFi2d_Ready if the initialization is correct,  
-   ChFi2d_NotPlanar if F is not planar,  
-   ChFi2d_NoFace if F is a null face.") BRepFilletAPI_MakeFillet2d;
		 BRepFilletAPI_MakeFillet2d ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Initializes an algorithm for computing fillets and chamfers on the face F.  
The vertices on which fillets or chamfers are built are  
defined using the AddFillet or AddChamfer function.  
Warning  
The status of the initialization, as given by the Status  
function, can be one of the following:  
-   ChFi2d_Ready if the initialization is correct,  
-   ChFi2d_NotPlanar if F is not planar,  
-   ChFi2d_NoFace if F is a null face.") BRepFilletAPI_MakeFillet2d;
		 BRepFilletAPI_MakeFillet2d (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Initializes this algorithm for constructing fillets or  
chamfers with the face F.  
Warning  
The status of the initialization, as given by the Status  
function, can be one of the following:  
-   ChFi2d_Ready if the initialization is correct,  
-   ChFi2d_NotPlanar if F is not planar,  
-   ChFi2d_NoFace if F is a null face.") Init;
		void Init (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	RefFace(TopoDS_Face)
	ModFace(TopoDS_Face)

Returns:
	None

This initialize  method allow  to init the builder  
         from a  face <RefFace> and  another face <ModFace>  
         which derive from  <RefFace>.  This  is usefull to  
         modify a fillet or   a chamfer already created  on  
         <ModFace> .") Init;
		void Init (const TopoDS_Face & RefFace,const TopoDS_Face & ModFace);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	Radius(Standard_Real)

Returns:
	TopoDS_Edge

Adds a fillet of radius Radius between the two edges  
adjacent to the vertex V on the face modified by this  
algorithm. The two edges do not need to be rectilinear.  
This function returns the fillet and builds the resulting face.  
Warning  
The status of the construction, as given by the Status  
function, can be one of the following:  
- ChFi2d_IsDone if the fillet is built,  
- ChFi2d_ConnexionError if V does not belong to the initial face,  
-   ChFi2d_ComputationError if Radius is too large  
  to build a fillet between the two adjacent edges,  
-   ChFi2d_NotAuthorized  
-   if one of the two edges connected to V is a fillet or chamfer, or  
-   if a curve other than a straight line or an arc of a  
   circle is used as E, E1 or E2.  
Do not use the returned fillet if the status of the construction is not ChFi2d_IsDone.  
Exceptions  
Standard_NegativeValue if Radius is less than or equal to zero.") AddFillet;
		TopoDS_Edge AddFillet (const TopoDS_Vertex & V,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Fillet(TopoDS_Edge)
	Radius(Standard_Real)

Returns:
	TopoDS_Edge

Assigns the radius Radius to the fillet Fillet already  
built on the face modified by this algorithm.  
This function returns the new fillet and modifies the existing face.  
Warning  
The status of the construction, as given by the Status  
function, can be one of the following:  
-   ChFi2d_IsDone if the new fillet is built,  
-   ChFi2d_ConnexionError if Fillet does not  
  belong to the existing face,  
-   ChFi2d_ComputationError if Radius is too  
 large to build a fillet between the two adjacent edges.  
  Do not use the returned fillet if the status of the  
construction is not ChFi2d_IsDone.  
Exceptions  
Standard_NegativeValue if Radius is less than or equal to zero.") ModifyFillet;
		TopoDS_Edge ModifyFillet (const TopoDS_Edge & Fillet,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Fillet(TopoDS_Edge)

Returns:
	TopoDS_Vertex

Removes the fillet Fillet already built on the face  
modified by this algorithm.  
This function returns the vertex connecting the two  
adjacent edges of Fillet and modifies the existing face.  
Warning  
-   The returned vertex is only valid if the Status  
  function returns ChFi2d_IsDone.  
-   A null vertex is returned if the edge Fillet does not  
  belong to the initial face.") RemoveFillet;
		TopoDS_Vertex RemoveFillet (const TopoDS_Edge & Fillet);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	D1(Standard_Real)
	D2(Standard_Real)

Returns:
	TopoDS_Edge

Adds a chamfer on the face modified by this algorithm  
   between the two adjacent edges E1 and E2, where  
  the extremities of the chamfer are on E1 and E2 at  
  distances D1 and D2 respectively  
   In cases where the edges are not rectilinear, distances  
are measured using the curvilinear abscissa of the  
edges and the angle is measured with respect to the  
tangent at the corresponding point.  
The angle Ang is given in radians.  
This function returns the chamfer and builds the resulting face.") AddChamfer;
		TopoDS_Edge AddChamfer (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const Standard_Real D1,const Standard_Real D2);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	V(TopoDS_Vertex)
	D(Standard_Real)
	Ang(Standard_Real)

Returns:
	TopoDS_Edge

Adds a chamfer on the face modified by this algorithm  
  between the two edges connected by the vertex V,  
  where E is one of the two edges. The chamfer makes  
  an angle Ang with E and one of its extremities is on  
  E at distance D from V.  
   In cases where the edges are not rectilinear, distances  
are measured using the curvilinear abscissa of the  
edges and the angle is measured with respect to the  
tangent at the corresponding point.  
The angle Ang is given in radians.  
This function returns the chamfer and builds the resulting face.  
Warning  
The status of the construction, as given by the Status function, can  
be one of the following:  
-          ChFi2d_IsDone if the chamfer is built,  
-  ChFi2d_ParametersError if D1, D2, D or Ang is less than or equal to zero,  
-          ChFi2d_ConnexionError if:  
- the edge E, E1 or E2 does not belong to the initial face, or  
-  the edges E1 and E2 are not adjacent, or  
-  the vertex V is not one of the limit points of the edge E,  
-          ChFi2d_ComputationError if the parameters of the chamfer  
  are too large to build a chamfer between the two adjacent edges,  
-          ChFi2d_NotAuthorized if:  
- the edge E1, E2 or one of the two edges connected to V is a fillet or chamfer, or  
- a curve other than a straight line or an arc of a circle is used as E, E1 or E2.  
Do not use the returned chamfer if  
the status of the construction is not ChFi2d_IsDone.") AddChamfer;
		TopoDS_Edge AddChamfer (const TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real D,const Standard_Real Ang);
		%feature("autodoc", "Args:
	Chamfer(TopoDS_Edge)
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	D1(Standard_Real)
	D2(Standard_Real)

Returns:
	TopoDS_Edge

Modifies the chamfer Chamfer on the face modified  
by this algorithm, where:  
  E1 and E2 are the two adjacent edges on which  
  Chamfer is already built; the extremities of the new  
  chamfer are on E1 and E2 at distances D1 and D2 respectively.") ModifyChamfer;
		TopoDS_Edge ModifyChamfer (const TopoDS_Edge & Chamfer,const TopoDS_Edge & E1,const TopoDS_Edge & E2,const Standard_Real D1,const Standard_Real D2);
		%feature("autodoc", "Args:
	Chamfer(TopoDS_Edge)
	E(TopoDS_Edge)
	D(Standard_Real)
	Ang(Standard_Real)

Returns:
	TopoDS_Edge

Modifies the chamfer Chamfer on the face modified  
by this algorithm, where:  
  E is one of the two adjacent edges on which  
  Chamfer is already built; the new chamfer makes  
  an angle Ang with E and one of its extremities is  
on E at distance D from the vertex on which the chamfer is built.  
  In cases where the edges are not rectilinear, the  
distances are measured using the curvilinear abscissa  
of the edges and the angle is measured with respect  
to the tangent at the corresponding point.  
The angle Ang is given in radians.  
This function returns the new chamfer and modifies the existing face.  
Warning  
The status of the construction, as given by the Status  
function, can be one of the following:  
-   ChFi2d_IsDone if the chamfer is built,  
-   ChFi2d_ParametersError if D1, D2, D or Ang is less than or equal to zero,  
-   ChFi2d_ConnexionError if:  
  -   the edge E, E1, E2 or Chamfer does not belong  
   to the existing face, or  
  -   the edges E1 and E2 are not adjacent,  
-   ChFi2d_ComputationError if the parameters of  
  the chamfer are too large to build a chamfer  
  between the two adjacent edges,  
-   ChFi2d_NotAuthorized if E1 or E2 is a fillet or chamfer.  
Do not use the returned chamfer if the status of the  
construction is not ChFi2d_IsDone.") ModifyChamfer;
		TopoDS_Edge ModifyChamfer (const TopoDS_Edge & Chamfer,const TopoDS_Edge & E,const Standard_Real D,const Standard_Real Ang);
		%feature("autodoc", "Args:
	Chamfer(TopoDS_Edge)

Returns:
	TopoDS_Vertex

Removes the chamfer Chamfer already built on the face  
modified by this algorithm.  
This function returns the vertex connecting the two  
adjacent edges of Chamfer and modifies the existing face.  
Warning  
-   The returned vertex is only valid if the Status  
  function returns ChFi2d_IsDone.  
-   A null vertex is returned if the edge Chamfer does  
  not belong to the initial face.") RemoveChamfer;
		TopoDS_Vertex RemoveChamfer (const TopoDS_Edge & Chamfer);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

Returns true if the edge E on the face modified by this  
algorithm is chamfered or filleted.  
Warning  
Returns false if E does not belong to the face modified by this algorithm.") IsModified;
		Standard_Boolean IsModified (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

Returns the table of fillets on the face modified by this algorithm.") FilletEdges;
		const TopTools_SequenceOfShape & FilletEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of fillets on the face modified by this algorithm.") NbFillet;
		Standard_Integer NbFillet ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

Returns the table of chamfers on the face modified by this algorithm.") ChamferEdges;
		const TopTools_SequenceOfShape & ChamferEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of chamfers on the face modified by this algorithm.") NbChamfer;
		Standard_Integer NbChamfer ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes modified from the shape  
         <S>.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of new curves  
         after the shape creation.") NbCurves;
		Standard_Integer NbCurves ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

Return the Edges created for curve I.") NewEdges;
		const TopTools_ListOfShape & NewEdges (const Standard_Integer I);
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

Returns the chamfered or filleted edge built from the  
edge E on the face modified by this algorithm. If E has  
not been modified, this function returns E.  
Exceptions  
Standard_NoSuchObject if the edge E does not  
belong to the initial face.") DescendantEdge;
		const TopoDS_Edge & DescendantEdge (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopoDS_Edge

Returns the basis edge on the face modified by this  
algorithm from which the chamfered or filleted edge E is  
built. If E has not been modified, this function returns E.  
Warning  
E is returned if it does not belong to the initial face.") BasisEdge;
		const TopoDS_Edge & BasisEdge (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	ChFi2d_ConstructionError

No detailed docstring for this function.") Status;
		ChFi2d_ConstructionError Status ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Update the result and set the Done flag") Build;
		virtual void Build ();
};


%feature("shadow") BRepFilletAPI_MakeFillet2d::~BRepFilletAPI_MakeFillet2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFilletAPI_MakeFillet2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFilletAPI_MakeChamfer;
class BRepFilletAPI_MakeChamfer : public BRepFilletAPI_LocalOperation {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes an algorithm for computing chamfers on the shape S.  
The edges on which chamfers are built are defined using the Add function.") BRepFilletAPI_MakeChamfer;
		 BRepFilletAPI_MakeChamfer (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Adds edge E to the table of edges used by this  
algorithm to build chamfers, where the parameters  
     of the chamfer must be set after the") Add;
		void Add (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Dis(Standard_Real)
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

Adds edge E to the table of edges used by this  
algorithm to build chamfers, where  
       the parameters of the chamfer are given by the two  
  distances Dis1 and Dis2; the face F identifies the side  
  where Dis1 is measured.  
The Add function results in a contour being built by  
propagation from the edge E (i.e. the contour contains at  
least this edge). This contour is composed of edges of  
the shape which are tangential to one another and  
which delimit two series of tangential faces, with one  
series of faces being located on either side of the contour.  
Warning  
Nothing is done if edge E or the face F does not belong to the initial shape.") Add;
		void Add (const Standard_Real Dis,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Dis(Standard_Real)
	IC(Standard_Integer)
	F(TopoDS_Face)

Returns:
	None

Sets the distances Dis1 and Dis2 which give the  
parameters of the chamfer along the contour of index  
IC generated using the Add function in the internal  
data structure of this algorithm. The face F identifies  
the side where Dis1 is measured.  
Warning  
Nothing is done if either the edge E or the face F  
does not belong to the initial shape.") SetDist;
		void SetDist (const Standard_Real Dis,const Standard_Integer IC,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	Dis(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetDist;
		void GetDist (const Standard_Integer IC,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Dis1(Standard_Real)
	Dis2(Standard_Real)
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

Adds a  fillet contour in  the  builder  (builds a  
          contour  of tangent edges to <E> and sets the two  
          distances <Dis1> and <Dis2> ( parameters of the chamfer ) ).") Add;
		void Add (const Standard_Real Dis1,const Standard_Real Dis2,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Dis1(Standard_Real)
	Dis2(Standard_Real)
	IC(Standard_Integer)
	F(TopoDS_Face)

Returns:
	None

Sets the distances Dis1 and Dis2 which give the  
parameters of the chamfer along the contour of index  
IC generated using the Add function in the internal  
data structure of this algorithm. The face F identifies  
the side where Dis1 is measured.  
Warning  
Nothing is done if either the edge E or the face F  
does not belong to the initial shape.") SetDists;
		void SetDists (const Standard_Real Dis1,const Standard_Real Dis2,const Standard_Integer IC,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	Dis1(Standard_Real)
	Dis2(Standard_Real)

Returns:
	None

Returns the distances Dis1 and Dis2 which give the  
parameters of the chamfer along the contour of index IC  
in the internal data structure of this algorithm.  
Warning  
-1. is returned if IC is outside the bounds of the table of contours.") Dists;
		void Dists (const Standard_Integer IC,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Dis(Standard_Real)
	Angle(Standard_Real)
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

Adds a  fillet contour in  the  builder  (builds a  
          contour  of tangent edges to <E> and sets the  
          distance <Dis1> and angle <Angle> ( parameters of the chamfer ) ).") AddDA;
		void AddDA (const Standard_Real Dis,const Standard_Real Angle,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Dis(Standard_Real)
	Angle(Standard_Real)
	IC(Standard_Integer)
	F(TopoDS_Face)

Returns:
	None

set the distance <Dis> and <Angle> of the fillet  
         contour of index <IC> in the DS with <Dis> on <F>.  if the face <F> is not one of common faces  
         of an edge of the contour <IC>") SetDistAngle;
		void SetDistAngle (const Standard_Real Dis,const Standard_Real Angle,const Standard_Integer IC,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	Dis(Standard_Real)
	Angle(Standard_Real)
	DisOnFace1(Standard_Boolean)

Returns:
	None

gives the distances <Dis> and <Angle> of the fillet  
         contour of index <IC> in the DS") GetDistAngle;
		void GetDistAngle (const Standard_Integer IC,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean & DisOnFace1);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

return True if chamfer symetric false else.") IsSymetric;
		Standard_Boolean IsSymetric (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

return True if chamfer is made with two distances false else.") IsTwoDistances;
		Standard_Boolean IsTwoDistances (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

return True if chamfer is made with distance and angle false else.") IsDistanceAngle;
		Standard_Boolean IsDistanceAngle (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	None

Erases the chamfer parameters on the contour of  
index IC in the internal data structure of this algorithm.  
Use the SetDists function to reset this data.  
Warning  
Nothing is done if IC is outside the bounds of the table of contours.") ResetContour;
		void ResetContour (const Standard_Integer IC);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of contours generated using the  
Add function in the internal data structure of this algorithm.") NbContours;
		Standard_Integer NbContours ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Integer

Returns the index of the contour in the internal data  
structure of this algorithm, which contains the edge E of the shape.  
This function returns 0 if the edge E does not belong to any contour.  
Warning  
This index can change if a contour is removed from the  
internal data structure of this algorithm using the function Remove.") Contour;
		Standard_Integer Contour (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

Returns the number of edges in the contour of index I in  
the internal data structure of this algorithm.  
Warning  
Returns 0 if I is outside the bounds of the table of contours.") NbEdges;
		Standard_Integer NbEdges (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)

Returns:
	TopoDS_Edge

Returns the edge of index J in the contour of index I in  
the internal data structure of this algorithm.  
Warning  
Returns a null shape if:  
-   I is outside the bounds of the table of contours, or  
-   J is outside the bounds of the table of edges of the contour of index I.") Edge;
		const TopoDS_Edge & Edge (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Removes the contour in the internal data structure of  
this algorithm which contains the edge E of the shape.  
Warning  
Nothing is done if the edge E does not belong to the  
contour in the internal data structure of this algorithm.") Remove;
		void Remove (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Real

Returns the length of the contour of index IC in the  
internal data structure of this algorithm.  
Warning  
Returns -1. if IC is outside the bounds of the table of contours.") Length;
		Standard_Real Length (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	TopoDS_Vertex

Returns the first vertex of the contour of index IC  
in the internal data structure of this algorithm.  
Warning  
Returns a null shape if IC is outside the bounds of the table of contours.") FirstVertex;
		TopoDS_Vertex FirstVertex (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	TopoDS_Vertex

Returns the last vertex of the contour of index IC  
in the internal data structure of this algorithm.  
Warning  
Returns a null shape if IC is outside the bounds of the table of contours.") LastVertex;
		TopoDS_Vertex LastVertex (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	Standard_Real

Returns the curvilinear abscissa of the vertex V on the  
contour of index IC in the internal data structure of this algorithm.  
Warning  
Returns -1. if:  
-   IC is outside the bounds of the table of contours, or  
-   V is not on the contour of index IC.") Abscissa;
		Standard_Real Abscissa (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	Standard_Real

Returns the relative curvilinear abscissa (i.e. between 0  
and 1) of the vertex V on the contour of index IC in the  
internal data structure of this algorithm.  
Warning  
Returns -1. if:  
-   IC is outside the bounds of the table of contours, or  
-   V is not on the contour of index IC.") RelativeAbscissa;
		Standard_Real RelativeAbscissa (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

eturns true if the contour of index IC in the internal  
data structure of this algorithm is closed and tangential at the point of closure.  
Warning  
Returns false if IC is outside the bounds of the table of contours.") ClosedAndTangent;
		Standard_Boolean ClosedAndTangent (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the contour of index IC in the internal  
data structure of this algorithm is closed.  
Warning  
Returns false if IC is outside the bounds of the table of contours.") Closed;
		Standard_Boolean Closed (const Standard_Integer IC);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the chamfers on all the contours in the internal  
data structure of this algorithm and constructs the resulting shape.  
Use the function IsDone to verify that the chamfered  
shape is built. Use the function Shape to retrieve the chamfered shape.  
Warning  
The construction of chamfers implements highly complex  
construction algorithms. Consequently, there may be  
instances where the algorithm fails, for example if the  
data defining the parameters of the chamfer is not  
compatible with the geometry of the initial shape. There  
is no initial analysis of errors and these only become  
evident at the construction stage.  
Additionally, in the current software release, the following  
cases are not handled:  
-   the end point of the contour is the point of  
  intersection of 4 or more edges of the shape, or  
-   the intersection of the chamfer with a face which  
  limits the contour is not fully contained in this face.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reinitializes this algorithm, thus canceling the effects of the Build function.  
This function allows modifications to be made to the  
contours and chamfer parameters in order to rebuild the shape.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_HBuilder

Returns the internal filleting algorithm.") Builder;
		Handle_TopOpeBRepBuild_HBuilder Builder ();
		%feature("autodoc", "Args:
	EorV(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the  list   of shapes generated   from the  
         shape <EorV>.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & EorV);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes modified from the shape  
         <F>.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Simulate;
		void Simulate (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbSurf;
		Standard_Integer NbSurf (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	IS(Standard_Integer)

Returns:
	Handle_ChFiDS_SecHArray1

No detailed docstring for this function.") Sect;
		Handle_ChFiDS_SecHArray1 Sect (const Standard_Integer IC,const Standard_Integer IS);
};


%feature("shadow") BRepFilletAPI_MakeChamfer::~BRepFilletAPI_MakeChamfer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFilletAPI_MakeChamfer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFilletAPI_MakeFillet;
class BRepFilletAPI_MakeFillet : public BRepFilletAPI_LocalOperation {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	FShape(ChFi3d_FilletShape)=ChFi3d_Rational

Returns:
	None

Initializes   the computation    of   the  fillets.  
         <FShape> sets   the type   of fillet  surface. The  
         default value is ChFi3d_Rational (classical  nurbs  
         representation of  circles).   ChFi3d_QuasiAngular  
         corresponds to  a  nurbs representation of circles  
         which   parameterisation matches  the  circle one.  
         ChFi3d_Polynomial  corresponds to  a    polynomial  
         representation of circles.") BRepFilletAPI_MakeFillet;
		 BRepFilletAPI_MakeFillet (const TopoDS_Shape & S,const ChFi3d_FilletShape FShape = ChFi3d_Rational);
		%feature("autodoc", "Args:
	Tang(Standard_Real)
	Tesp(Standard_Real)
	T2d(Standard_Real)
	TApp3d(Standard_Real)
	TolApp2d(Standard_Real)
	Fleche(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetParams;
		void SetParams (const Standard_Real Tang,const Standard_Real Tesp,const Standard_Real T2d,const Standard_Real TApp3d,const Standard_Real TolApp2d,const Standard_Real Fleche);
		%feature("autodoc", "Args:
	InternalContinuity(GeomAbs_Shape)
	AngularTolerance(Standard_Real)

Returns:
	None

Changes     the      parameters     of  continiuity  
         InternalContinuity to produce fillet'surfaces with  
         an continuity   Ci (i=0,1 or    2).  
         By defaultInternalContinuity = GeomAbs_C1.  
         AngularTolerance  is the G1 tolerance between fillet  
         and support'faces.") SetContinuity;
		void SetContinuity (const GeomAbs_Shape InternalContinuity,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Adds a  fillet contour in  the  builder  (builds a  
         contour  of tangent edges).  
         The Radius must be set after.") Add;
		void Add (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	E(TopoDS_Edge)

Returns:
	None

Adds a  fillet description in  the  builder  
         - builds a contour  of tangent edges,  
         - sets the radius.") Add;
		void Add (const Standard_Real Radius,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	R1(Standard_Real)
	R2(Standard_Real)
	E(TopoDS_Edge)

Returns:
	None

Adds a  fillet description in  the  builder  
         - builds a contour  of tangent edges,  
         - sets a linear radius evolution law between  
           the first and last vertex of the spine.") Add;
		void Add (const Standard_Real R1,const Standard_Real R2,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	L(Handle_Law_Function)
	E(TopoDS_Edge)

Returns:
	None

Adds a  fillet description in  the  builder  
         - builds a contour  of tangent edges,  
         - sest the radius evolution law.") Add;
		void Add (const Handle_Law_Function & L,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	UandR(TColgp_Array1OfPnt2d)
	E(TopoDS_Edge)

Returns:
	None

Adds a  fillet description in  the  builder  
         - builds a contour  of tangent edges,  
         - sets the radius evolution law interpolating the values  
         given in the array UandR :  
 
         p2d.X() = relative parameter on the spine [0,1]  
         p2d.Y() = value of the radius.") Add;
		void Add (const TColgp_Array1OfPnt2d & UandR,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	IC(Standard_Integer)
	IinC(Standard_Integer)

Returns:
	None

Sets the parameters of the fillet  
along the contour of index IC generated using the Add function  
in the internal data structure of  
this algorithm, where Radius is the radius of the fillet.") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const Standard_Integer IinC);
		%feature("autodoc", "Args:
	R1(Standard_Real)
	R2(Standard_Real)
	IC(Standard_Integer)
	IinC(Standard_Integer)

Returns:
	None

Sets the parameters of the fillet  
along the contour of index IC generated using the Add function  
in the internal data structure of this algorithm, where the radius of the  
  fillet evolves according to a linear evolution law defined  
  from R1 to R2, between the first and last vertices of the contour of index IC.") SetRadius;
		void SetRadius (const Standard_Real R1,const Standard_Real R2,const Standard_Integer IC,const Standard_Integer IinC);
		%feature("autodoc", "Args:
	L(Handle_Law_Function)
	IC(Standard_Integer)
	IinC(Standard_Integer)

Returns:
	None

Sets the parameters of the fillet  
along the contour of index IC generated using the Add function  
in the internal data structure of this algorithm, where the radius of the  
  fillet evolves according to the evolution law L, between the  
  first and last vertices of the contour of index IC.") SetRadius;
		void SetRadius (const Handle_Law_Function & L,const Standard_Integer IC,const Standard_Integer IinC);
		%feature("autodoc", "Args:
	UandR(TColgp_Array1OfPnt2d)
	IC(Standard_Integer)
	IinC(Standard_Integer)

Returns:
	None

Sets the parameters of the fillet  
along the contour of index IC generated using the Add function  
in the internal data structure of this algorithm,  
where the radius of the fillet evolves according to the evolution law  
which interpolates the set of parameter and radius pairs given  
in the array UandR as follows:  
-   the X coordinate of a point in UandR defines a  
  relative parameter on the contour (i.e. a parameter between 0 and 1),  
-          the Y coordinate of a point in UandR gives the  
  corresponding value of the radius, and the radius evolves  
  between the first and last vertices of the contour of index IC.") SetRadius;
		void SetRadius (const TColgp_Array1OfPnt2d & UandR,const Standard_Integer IC,const Standard_Integer IinC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	None

Erases the radius information on the contour of index  
IC in the internal data structure of this algorithm.  
Use the SetRadius function to reset this data.  
Warning  
Nothing is done if IC is outside the bounds of the table of contours.") ResetContour;
		void ResetContour (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the radius of the fillet along the contour of index IC  
  in the internal data structure of this algorithm is constant,  
  Warning  
False is returned if IC is outside the bounds of the table  
of contours or if E does not belong to the contour of index IC.") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Real

Returns the radius of the fillet along the contour of index IC in the  
 internal data structure of this algorithm  
    Warning  
-   Use this function only if the radius is constant.  
-   -1. is returned if IC is outside the bounds of the  
  table of contours or if E does not belong to the contour of index IC.") Radius;
		Standard_Real Radius (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

Returns true if the radius of the fillet along the edge E of the  
 contour of index IC in the internal data structure of  
 this algorithm is constant.  
  Warning  
False is returned if IC is outside the bounds of the table  
of contours or if E does not belong to the contour of index IC.") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	Standard_Real

Returns the radius of the fillet along the edge E of the contour of index  
IC in the internal data structure of this algorithm.  
Warning  
-   Use this function only if the radius is constant.  
-   -1 is returned if IC is outside the bounds of the  
table of contours or if E does not belong to the contour of index IC.") Radius;
		Standard_Real Radius (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	IC(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	None

Assigns Radius as the radius of the fillet on the edge E") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)
	F(Standard_Real)
	L(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetBounds;
		Standard_Boolean GetBounds (const Standard_Integer IC,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	Handle_Law_Function

No detailed docstring for this function.") GetLaw;
		Handle_Law_Function GetLaw (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)
	L(Handle_Law_Function)

Returns:
	None

No detailed docstring for this function.") SetLaw;
		void SetLaw (const Standard_Integer IC,const TopoDS_Edge & E,const Handle_Law_Function & L);
		%feature("autodoc", "Args:
	FShape(ChFi3d_FilletShape)

Returns:
	None

Assigns FShape as the type of fillet shape built by this algorithm.") SetFilletShape;
		void SetFilletShape (const ChFi3d_FilletShape FShape);
		%feature("autodoc", "Args:
	None
Returns:
	ChFi3d_FilletShape

Returns the type of fillet shape built by this algorithm.") GetFilletShape;
		ChFi3d_FilletShape GetFilletShape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of contours generated using the  
Add function in the internal data structure of this algorithm.") NbContours;
		Standard_Integer NbContours ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Integer

Returns the index of the contour in the internal data  
structure of this algorithm which contains the edge E of the shape.  
This function returns 0 if the edge E does not belong to any contour.  
Warning  
This index can change if a contour is removed from the  
internal data structure of this algorithm using the function Remove.") Contour;
		Standard_Integer Contour (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

Returns the number of edges in the contour of index I in  
the internal data structure of this algorithm.  
Warning  
Returns 0 if I is outside the bounds of the table of contours.") NbEdges;
		Standard_Integer NbEdges (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)

Returns:
	TopoDS_Edge

Returns the edge of index J in the contour of index I in  
the internal data structure of this algorithm.  
Warning  
Returns a null shape if:  
-   I is outside the bounds of the table of contours, or  
-   J is outside the bounds of the table of edges of the index I contour.") Edge;
		const TopoDS_Edge & Edge (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Removes the contour in the internal data structure of  
this algorithm which contains the edge E of the shape.  
Warning  
Nothing is done if the edge E does not belong to the  
contour in the internal data structure of this algorithm.") Remove;
		void Remove (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Real

Returns the length of the contour of index IC in the  
internal data structure of this algorithm.  
Warning  
Returns -1. if IC is outside the bounds of the table of contours.") Length;
		Standard_Real Length (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	TopoDS_Vertex

Returns the first vertex of the contour of index IC  
in the internal data structure of this algorithm.  
Warning  
Returns a null shape if IC is outside the bounds of the table of contours.") FirstVertex;
		TopoDS_Vertex FirstVertex (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	TopoDS_Vertex

Returns the  last vertex of the contour of index IC  
in the internal data structure of this algorithm.  
Warning  
Returns a null shape if IC is outside the bounds of the table of contours.") LastVertex;
		TopoDS_Vertex LastVertex (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	Standard_Real

Returns the curvilinear abscissa of the vertex V on the  
contour of index IC in the internal data structure of this algorithm.  
Warning  
Returns -1. if:  
-   IC is outside the bounds of the table of contours, or  
-   V is not on the contour of index IC.") Abscissa;
		Standard_Real Abscissa (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	Standard_Real

Returns the relative curvilinear abscissa (i.e. between 0  
and 1) of the vertex V on the contour of index IC in the  
internal data structure of this algorithm.  
Warning  
Returns -1. if:  
-   IC is outside the bounds of the table of contours, or  
-   V is not on the contour of index IC.") RelativeAbscissa;
		Standard_Real RelativeAbscissa (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the contour of index IC in the internal  
data structure of this algorithm is closed and tangential  
at the point of closure.  
Warning  
Returns false if IC is outside the bounds of the table of contours.") ClosedAndTangent;
		Standard_Boolean ClosedAndTangent (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the contour of index IC in the internal  
data structure of this algorithm is closed.  
Warning  
Returns false if IC is outside the bounds of the table of contours.") Closed;
		Standard_Boolean Closed (const Standard_Integer IC);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the fillets on all the contours in the internal data  
structure of this algorithm and constructs the resulting shape.  
Use the function IsDone to verify that the filleted shape  
is built. Use the function Shape to retrieve the filleted shape.  
Warning  
The construction of fillets implements highly complex  
construction algorithms. Consequently, there may be  
instances where the algorithm fails, for example if the  
data defining the radius of the fillet is not compatible  
with the geometry of the initial shape. There is no initial  
analysis of errors and they only become evident at the  
construction stage.  
Additionally, in the current software release, the  
following cases are not handled:  
-   the end point of the contour is the point of  
  intersection of 4 or more edges of the shape, or  
-   the intersection of the fillet with a face which limits  
  the contour is not fully contained in this face.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reinitializes this algorithm, thus canceling the effects of the Build function.  
This function allows modifications to be made to the  
contours and fillet parameters in order to rebuild the shape.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_HBuilder

Returns the internal topology building algorithm.") Builder;
		Handle_TopOpeBRepBuild_HBuilder Builder ();
		%feature("autodoc", "Args:
	EorV(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the  list   of shapes generated   from the  
         shape <EorV>.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & EorV);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes modified from the shape  
         <F>.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of surfaces  
         after the shape creation.") NbSurfaces;
		Standard_Integer NbSurfaces ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

Return the faces created for surface <I>.") NewFaces;
		const TopTools_ListOfShape & NewFaces (const Standard_Integer I);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Simulate;
		void Simulate (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbSurf;
		Standard_Integer NbSurf (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	IS(Standard_Integer)

Returns:
	Handle_ChFiDS_SecHArray1

No detailed docstring for this function.") Sect;
		Handle_ChFiDS_SecHArray1 Sect (const Standard_Integer IC,const Standard_Integer IS);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of contours where the computation  
of the fillet failed") NbFaultyContours;
		Standard_Integer NbFaultyContours ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

for each I in [1.. NbFaultyContours] returns the index IC of  
the contour where the computation of the fillet failed.  
the method NbEdges(IC) gives the number of edges in the contour IC  
the method Edge(IC,ie) gives the edge number ie of the contour IC") FaultyContour;
		Standard_Integer FaultyContour (const Standard_Integer I);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Integer

returns the number of surfaces which have been  
         computed on the contour IC") NbComputedSurfaces;
		Standard_Integer NbComputedSurfaces (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	IS(Standard_Integer)

Returns:
	Handle_Geom_Surface

returns the surface number IS concerning the contour IC") ComputedSurface;
		Handle_Geom_Surface ComputedSurface (const Standard_Integer IC,const Standard_Integer IS);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of vertices where the computation failed") NbFaultyVertices;
		Standard_Integer NbFaultyVertices ();
		%feature("autodoc", "Args:
	IV(Standard_Integer)

Returns:
	TopoDS_Vertex

returns the vertex where the computation failed") FaultyVertex;
		TopoDS_Vertex FaultyVertex (const Standard_Integer IV);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if a part of the result has been computed  
if the filling in a corner failed a shape with a hole is returned") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

if (HasResult()) returns the partial result") BadShape;
		TopoDS_Shape BadShape ();
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	ChFiDS_ErrorStatus

returns the status concerning the contour IC in case of error  
ChFiDS_Ok : the computation is Ok  
ChFiDS_StartsolFailure : the computation can't start, perhaps the  
                         the radius is too big  
ChFiDS_TwistedSurface : the computation failed because of a twisted  
                        surface  
ChFiDS_WalkingFailure : there is a problem in the walking  
ChFiDS_Error:  other error different from above") StripeStatus;
		ChFiDS_ErrorStatus StripeStatus (const Standard_Integer IC);
};


%feature("shadow") BRepFilletAPI_MakeFillet::~BRepFilletAPI_MakeFillet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFilletAPI_MakeFillet {
	void _kill_pointed() {
		delete $self;
	}
};
