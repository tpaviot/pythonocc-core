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
%module (package="OCC") ChFi3d

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

%include ChFi3d_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum ChFi3d_FilletShape {
	ChFi3d_Rational = 0,
	ChFi3d_QuasiAngular = 1,
	ChFi3d_Polynomial = 2,
};

/* end public enums declaration */

%rename(chfi3d) ChFi3d;
%nodefaultctor ChFi3d;
class ChFi3d {
	public:
		%feature("autodoc", "Args:
	S1(BRepAdaptor_Surface)
	S2(BRepAdaptor_Surface)
	E(TopoDS_Edge)
	Or1(TopAbs_Orientation)
	Or2(TopAbs_Orientation)

Returns:
	static Standard_Integer

Returns  Reversed  in  Or1  and(or)  Or2  if  
         the  concave edge  defined by the  interior of faces F1 and F2,  
         in  the  neighbourhood of  their boundary E is of the edge opposite to  the  
         normal  of their surface  support.  The  orientation of  
         faces is  not  taken  into  consideration in  the calculation. The  
         function  returns  0 if  the calculation fails (tangence),  
         if  not, it  returns the  number of  choice of  the fillet  
         or chamfer corresponding to  the orientations  calculated  
         and  to  the tangent to  the  guide line read in  E.") ConcaveSide;
		static Standard_Integer ConcaveSide (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2,const TopoDS_Edge & E,TopAbs_Orientation & Or1,TopAbs_Orientation & Or2);
		%feature("autodoc", "Args:
	Or1(TopAbs_Orientation)
	Or2(TopAbs_Orientation)
	OrSave1(TopAbs_Orientation)
	OrSave2(TopAbs_Orientation)
	ChoixSauv(Standard_Integer)

Returns:
	static Standard_Integer

Same  as ConcaveSide, but the orientations are  
         logically  deduced from  the result of  the call of  
         ConcaveSide on  the  first pair of faces of  the fillet or  
         chamnfer.") NextSide;
		static Standard_Integer NextSide (TopAbs_Orientation & Or1,TopAbs_Orientation & Or2,const TopAbs_Orientation OrSave1,const TopAbs_Orientation OrSave2,const Standard_Integer ChoixSauv);
		%feature("autodoc", "Args:
	Or(TopAbs_Orientation)
	OrSave(TopAbs_Orientation)
	OrFace(TopAbs_Orientation)

Returns:
	static void

Same  as  the  other NextSide, but the calculation is  done  
         on an edge  only.") NextSide;
		static void NextSide (TopAbs_Orientation & Or,const TopAbs_Orientation OrSave,const TopAbs_Orientation OrFace);
		%feature("autodoc", "Args:
	Or(TopAbs_Orientation)
	OrSave1(TopAbs_Orientation)
	OrSave2(TopAbs_Orientation)
	OrFace1(TopAbs_Orientation)
	OrFace2(TopAbs_Orientation)

Returns:
	static Standard_Boolean

Enables  to  determine while  processing  an  angle, if  
         two fillets or chamfers constituting a face have  
         identic or opposed  concave  edges.") SameSide;
		static Standard_Boolean SameSide (const TopAbs_Orientation Or,const TopAbs_Orientation OrSave1,const TopAbs_Orientation OrSave2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2);
};


%feature("shadow") ChFi3d::~ChFi3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi3d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFi3d_Builder;
class ChFi3d_Builder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
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

No detailed docstring for this function.") SetContinuity;
		void SetContinuity (const GeomAbs_Shape InternalContinuity,const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

extracts from  the list the contour containing edge E.") Remove;
		void Remove (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Integer

gives the number of  the contour containing E or 0  
         if E does  not  belong to  any  contour.") Contains;
		Standard_Integer Contains (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	IndexInSpine(Standard_Integer)

Returns:
	Standard_Integer

gives  the number of  the contour containing E or 0  
         if E does  not  belong  to  any  contour.  
//!	        Sets in IndexInSpine the index of E in the contour if it's found") Contains;
		Standard_Integer Contains (const TopoDS_Edge & E,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

gives the number of  disjoint contours on  which  
         the  fillets  are  calculated") NbElements;
		Standard_Integer NbElements ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_ChFiDS_Spine

gives the n'th set  of edges (contour)  if I >NbElements()") Value;
		Handle_ChFiDS_Spine Value (const Standard_Integer I);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Real

returns the length of  the contour of index IC.") Length;
		Standard_Real Length (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	TopoDS_Vertex

returns the First vertex V of  
         the contour of index IC.") FirstVertex;
		TopoDS_Vertex FirstVertex (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	TopoDS_Vertex

returns the Last vertex V of  
         the contour of index IC.") LastVertex;
		TopoDS_Vertex LastVertex (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	Standard_Real

returns the abscissa of the vertex V on  
         the contour of index IC.") Abscissa;
		Standard_Real Abscissa (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	Standard_Real

returns the relative abscissa([0.,1.]) of the  
         vertex V on the contour of index IC.") RelativeAbscissa;
		Standard_Real RelativeAbscissa (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

returns true if the contour of index IC is closed  
         an tangent.") ClosedAndTangent;
		Standard_Boolean ClosedAndTangent (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

returns true if the contour of index IC is closed") Closed;
		Standard_Boolean Closed (const Standard_Integer IC);
		%feature("autodoc", "Args:
	None
Returns:
	None

general calculation of geometry on all edges,  
         topologic reconstruction.") Compute;
		void Compute ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if the computation  is  success") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

if (Isdone()) makes the result.  if (!Isdone())") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	EouV(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Advanced  function for the history") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & EouV);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of contours on  which the calculation  
         has failed.") NbFaultyContours;
		Standard_Integer NbFaultyContours ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

Returns the number of  I'th contour on  which the calculation  
         has failed.") FaultyContour;
		Standard_Integer FaultyContour (const Standard_Integer I);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Integer

Returns the number of  surfaces calculated  on  the contour IC.") NbComputedSurfaces;
		Standard_Integer NbComputedSurfaces (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	IS(Standard_Integer)

Returns:
	Handle_Geom_Surface

Returns the IS'th surface calculated on  the contour IC.") ComputedSurface;
		Handle_Geom_Surface ComputedSurface (const Standard_Integer IC,const Standard_Integer IS);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of vertices on  which the calculation  
         has failed.") NbFaultyVertices;
		Standard_Integer NbFaultyVertices ();
		%feature("autodoc", "Args:
	IV(Standard_Integer)

Returns:
	TopoDS_Vertex

Returns the IV'th vertex on  which the calculation has failed.") FaultyVertex;
		TopoDS_Vertex FaultyVertex (const Standard_Integer IV);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if  a partial result has  been  calculated") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

if (HasResult()) returns partial result  if (!HasResult())") BadShape;
		TopoDS_Shape BadShape ();
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	ChFiDS_ErrorStatus

for the stripe IC ,indication on the cause  
         of  failure WalkingFailure,TwistedSurface,Error, Ok") StripeStatus;
		ChFiDS_ErrorStatus StripeStatus (const Standard_Integer IC);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reset all  results of   compute and returns the  algorythm  
         in  the  state  of  the  last  acquisition to  
         enable modification of contours or areas.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_HBuilder

Returns the Builder of  topologic operations.") Builder;
		Handle_TopOpeBRepBuild_HBuilder Builder ();
		%feature("autodoc", "Args:
	Data(Handle_ChFiDS_SurfData)
	SetData(ChFiDS_SequenceOfSurfData)
	Spine(Handle_ChFiDS_Spine)
	Iedge(Standard_Integer)
	S1(Handle_Adaptor3d_HSurface)
	I1(Handle_Adaptor3d_TopolTool)
	S2(Handle_Adaptor3d_HSurface)
	I2(Handle_Adaptor3d_TopolTool)
	Intf(Standard_Boolean)
	Intl(Standard_Boolean)

Returns:
	Standard_Boolean

Method, implemented in the inheritants, calculates  
         the elements of construction of the surface (fillet or  
         chamfer).") SplitKPart;
		Standard_Boolean SplitKPart (const Handle_ChFiDS_SurfData & Data,ChFiDS_SequenceOfSurfData & SetData,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Iedge,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,Standard_Boolean & Intf,Standard_Boolean & Intl);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") PerformTwoCornerbyInter;
		Standard_Boolean PerformTwoCornerbyInter (const Standard_Integer Index);
};


%feature("shadow") ChFi3d_Builder::~ChFi3d_Builder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi3d_Builder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFi3d_SearchSing;
class ChFi3d_SearchSing : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	C1(Handle_Geom_Curve)
	C2(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") ChFi3d_SearchSing;
		 ChFi3d_SearchSing (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

computes the value of the function <F> for the  
         variable <X>.  
         returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

computes the derivative <D> of the function  
         for the variable <X>.  
          Returns True if the calculation were successfully done,  
          False otherwise.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

computes the value <F> and the derivative <D> of the  
         function for the variable <X>.  
         Returns True if the calculation were successfully done,  
         False otherwise.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") ChFi3d_SearchSing::~ChFi3d_SearchSing %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi3d_SearchSing {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFi3d_ChBuilder;
class ChFi3d_ChBuilder : public ChFi3d_Builder {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Ta(Standard_Real)=1.0e-2

Returns:
	None

initializes the Builder with the Shape <S> for the  
         computation of chamfers") ChFi3d_ChBuilder;
		 ChFi3d_ChBuilder (const TopoDS_Shape & S,const Standard_Real Ta = 1.0e-2);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

initializes a contour with the edge <E> as first  
         (the next are found by propagation ).  
         The two distances (parameters of the chamfer) must  
         be set after.  if the edge <E> has more than 2 adjacent faces") Add;
		void Add (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Dis(Standard_Real)
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

initializes a new contour with the edge <E> as first  
         (the next are found by propagation ), and  the  
         distance <Dis>  if the edge <E> has more than 2 adjacent faces") Add;
		void Add (const Standard_Real Dis,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Dis(Standard_Real)
	IC(Standard_Integer)
	F(TopoDS_Face)

Returns:
	None

set the distance <Dis> of the fillet  
         contour of index <IC> in the DS with <Dis> on <F>.  if the face <F> is not one of common faces  
         of an edge of the contour <IC>") SetDist;
		void SetDist (const Standard_Real Dis,const Standard_Integer IC,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	Dis(Standard_Real)

Returns:
	None

gives the distances <Dis> of the fillet  
         contour of index <IC> in the DS") GetDist;
		void GetDist (const Standard_Integer IC,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Dis1(Standard_Real)
	Dis2(Standard_Real)
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

initializes a new contour with the edge <E> as first  
         (the next are found by propagation ), and  the  
         distance <Dis1> and <Dis2>  if the edge <E> has more than 2 adjacent faces") Add;
		void Add (const Standard_Real Dis1,const Standard_Real Dis2,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Dis1(Standard_Real)
	Dis2(Standard_Real)
	IC(Standard_Integer)
	F(TopoDS_Face)

Returns:
	None

set the distances <Dis1> and <Dis2> of the fillet  
         contour of index <IC> in the DS with <Dis1> on <F>.  if the face <F> is not one of common faces  
         of an edge of the contour <IC>") SetDists;
		void SetDists (const Standard_Real Dis1,const Standard_Real Dis2,const Standard_Integer IC,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	Dis1(Standard_Real)
	Dis2(Standard_Real)

Returns:
	None

gives the distances <Dis1> and <Dis2> of the fillet  
         contour of index <IC> in the DS") Dists;
		void Dists (const Standard_Integer IC,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Dis(Standard_Real)
	Angle(Standard_Real)
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

initializes a new contour with the edge <E> as first  
         (the next are found by propagation ), and  the  
         distance <Dis1> and <Angle>  if the edge <E> has more than 2 adjacent faces") AddDA;
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
	ChFiDS_ChamfMethod

renvoi la methode des chanfreins utilisee") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	None

Reset tous rayons du contour IC.") ResetContour;
		void ResetContour (const Standard_Integer IC);
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
	Data(Handle_ChFiDS_SurfData)
	Guide(Handle_ChFiDS_HElSpine)
	Spine(Handle_ChFiDS_Spine)
	Choix(Standard_Integer)
	S1(Handle_BRepAdaptor_HSurface)
	I1(Handle_Adaptor3d_TopolTool)
	PC1(Handle_BRepAdaptor_HCurve2d)
	Sref1(Handle_BRepAdaptor_HSurface)
	PCref1(Handle_BRepAdaptor_HCurve2d)
	Decroch1(Standard_Boolean)
	S2(Handle_BRepAdaptor_HSurface)
	I2(Handle_Adaptor3d_TopolTool)
	Or2(TopAbs_Orientation)
	Fleche(Standard_Real)
	TolGuide(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Inside(Standard_Boolean)
	Appro(Standard_Boolean)
	Forward(Standard_Boolean)
	RecP(Standard_Boolean)
	RecS(Standard_Boolean)
	RecRst(Standard_Boolean)
	Soldep(math_Vector)

Returns:
	virtual void

No detailed docstring for this function.") SimulSurf;
		virtual void SimulSurf (Handle_ChFiDS_SurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_BRepAdaptor_HCurve2d & PC1,const Handle_BRepAdaptor_HSurface & Sref1,const Handle_BRepAdaptor_HCurve2d & PCref1,Standard_Boolean & Decroch1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const TopAbs_Orientation Or2,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);
		%feature("autodoc", "Args:
	Data(Handle_ChFiDS_SurfData)
	Guide(Handle_ChFiDS_HElSpine)
	Spine(Handle_ChFiDS_Spine)
	Choix(Standard_Integer)
	S1(Handle_BRepAdaptor_HSurface)
	I1(Handle_Adaptor3d_TopolTool)
	Or1(TopAbs_Orientation)
	S2(Handle_BRepAdaptor_HSurface)
	I2(Handle_Adaptor3d_TopolTool)
	PC2(Handle_BRepAdaptor_HCurve2d)
	Sref2(Handle_BRepAdaptor_HSurface)
	PCref2(Handle_BRepAdaptor_HCurve2d)
	Decroch2(Standard_Boolean)
	Fleche(Standard_Real)
	TolGuide(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Inside(Standard_Boolean)
	Appro(Standard_Boolean)
	Forward(Standard_Boolean)
	RecP(Standard_Boolean)
	RecS(Standard_Boolean)
	RecRst(Standard_Boolean)
	Soldep(math_Vector)

Returns:
	virtual void

No detailed docstring for this function.") SimulSurf;
		virtual void SimulSurf (Handle_ChFiDS_SurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const TopAbs_Orientation Or1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const Handle_BRepAdaptor_HCurve2d & PC2,const Handle_BRepAdaptor_HSurface & Sref2,const Handle_BRepAdaptor_HCurve2d & PCref2,Standard_Boolean & Decroch2,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);
		%feature("autodoc", "Args:
	Data(Handle_ChFiDS_SurfData)
	Guide(Handle_ChFiDS_HElSpine)
	Spine(Handle_ChFiDS_Spine)
	Choix(Standard_Integer)
	S1(Handle_BRepAdaptor_HSurface)
	I1(Handle_Adaptor3d_TopolTool)
	PC1(Handle_BRepAdaptor_HCurve2d)
	Sref1(Handle_BRepAdaptor_HSurface)
	PCref1(Handle_BRepAdaptor_HCurve2d)
	Decroch1(Standard_Boolean)
	Or1(TopAbs_Orientation)
	S2(Handle_BRepAdaptor_HSurface)
	I2(Handle_Adaptor3d_TopolTool)
	PC2(Handle_BRepAdaptor_HCurve2d)
	Sref2(Handle_BRepAdaptor_HSurface)
	PCref2(Handle_BRepAdaptor_HCurve2d)
	Decroch2(Standard_Boolean)
	Or2(TopAbs_Orientation)
	Fleche(Standard_Real)
	TolGuide(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Inside(Standard_Boolean)
	Appro(Standard_Boolean)
	Forward(Standard_Boolean)
	RecP1(Standard_Boolean)
	RecRst1(Standard_Boolean)
	RecP2(Standard_Boolean)
	RecRst2(Standard_Boolean)
	Soldep(math_Vector)

Returns:
	virtual void

No detailed docstring for this function.") SimulSurf;
		virtual void SimulSurf (Handle_ChFiDS_SurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_BRepAdaptor_HCurve2d & PC1,const Handle_BRepAdaptor_HSurface & Sref1,const Handle_BRepAdaptor_HCurve2d & PCref1,Standard_Boolean & Decroch1,const TopAbs_Orientation Or1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const Handle_BRepAdaptor_HCurve2d & PC2,const Handle_BRepAdaptor_HSurface & Sref2,const Handle_BRepAdaptor_HCurve2d & PCref2,Standard_Boolean & Decroch2,const TopAbs_Orientation Or2,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP1,const Standard_Boolean RecRst1,const Standard_Boolean RecP2,const Standard_Boolean RecRst2,const math_Vector & Soldep);
		%feature("autodoc", "Args:
	Data(ChFiDS_SequenceOfSurfData)
	Guide(Handle_ChFiDS_HElSpine)
	Spine(Handle_ChFiDS_Spine)
	Choix(Standard_Integer)
	S1(Handle_BRepAdaptor_HSurface)
	I1(Handle_Adaptor3d_TopolTool)
	S2(Handle_BRepAdaptor_HSurface)
	I2(Handle_Adaptor3d_TopolTool)
	MaxStep(Standard_Real)
	Fleche(Standard_Real)
	TolGuide(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Inside(Standard_Boolean)
	Appro(Standard_Boolean)
	Forward(Standard_Boolean)
	RecOnS1(Standard_Boolean)
	RecOnS2(Standard_Boolean)
	Soldep(math_Vector)
	Intf(Standard_Integer)
	Intl(Standard_Integer)

Returns:
	virtual Standard_Boolean

Methode, implemented in inheritants, calculates  
         the elements of construction of  the surface (fillet  
         or chamfer).") PerformSurf;
		virtual Standard_Boolean PerformSurf (ChFiDS_SequenceOfSurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecOnS1,const Standard_Boolean RecOnS2,const math_Vector & Soldep,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Data(ChFiDS_SequenceOfSurfData)
	Guide(Handle_ChFiDS_HElSpine)
	Spine(Handle_ChFiDS_Spine)
	Choix(Standard_Integer)
	S1(Handle_BRepAdaptor_HSurface)
	I1(Handle_Adaptor3d_TopolTool)
	PC1(Handle_BRepAdaptor_HCurve2d)
	Sref1(Handle_BRepAdaptor_HSurface)
	PCref1(Handle_BRepAdaptor_HCurve2d)
	Decroch1(Standard_Boolean)
	S2(Handle_BRepAdaptor_HSurface)
	I2(Handle_Adaptor3d_TopolTool)
	Or2(TopAbs_Orientation)
	MaxStep(Standard_Real)
	Fleche(Standard_Real)
	TolGuide(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Inside(Standard_Boolean)
	Appro(Standard_Boolean)
	Forward(Standard_Boolean)
	RecP(Standard_Boolean)
	RecS(Standard_Boolean)
	RecRst(Standard_Boolean)
	Soldep(math_Vector)

Returns:
	virtual void

Method, implemented in  the inheritants, calculates  
         the elements of construction of  the surface (fillet  
         or chamfer) contact edge/face.") PerformSurf;
		virtual void PerformSurf (ChFiDS_SequenceOfSurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_BRepAdaptor_HCurve2d & PC1,const Handle_BRepAdaptor_HSurface & Sref1,const Handle_BRepAdaptor_HCurve2d & PCref1,Standard_Boolean & Decroch1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const TopAbs_Orientation Or2,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);
		%feature("autodoc", "Args:
	Data(ChFiDS_SequenceOfSurfData)
	Guide(Handle_ChFiDS_HElSpine)
	Spine(Handle_ChFiDS_Spine)
	Choix(Standard_Integer)
	S1(Handle_BRepAdaptor_HSurface)
	I1(Handle_Adaptor3d_TopolTool)
	Or1(TopAbs_Orientation)
	S2(Handle_BRepAdaptor_HSurface)
	I2(Handle_Adaptor3d_TopolTool)
	PC2(Handle_BRepAdaptor_HCurve2d)
	Sref2(Handle_BRepAdaptor_HSurface)
	PCref2(Handle_BRepAdaptor_HCurve2d)
	Decroch2(Standard_Boolean)
	MaxStep(Standard_Real)
	Fleche(Standard_Real)
	TolGuide(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Inside(Standard_Boolean)
	Appro(Standard_Boolean)
	Forward(Standard_Boolean)
	RecP(Standard_Boolean)
	RecS(Standard_Boolean)
	RecRst(Standard_Boolean)
	Soldep(math_Vector)

Returns:
	virtual void

Method, implemented in inheritants, calculates  
         the elements of construction of  the surface (fillet  
         or chamfer) contact edge/face.") PerformSurf;
		virtual void PerformSurf (ChFiDS_SequenceOfSurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const TopAbs_Orientation Or1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const Handle_BRepAdaptor_HCurve2d & PC2,const Handle_BRepAdaptor_HSurface & Sref2,const Handle_BRepAdaptor_HCurve2d & PCref2,Standard_Boolean & Decroch2,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);
		%feature("autodoc", "Args:
	Data(ChFiDS_SequenceOfSurfData)
	Guide(Handle_ChFiDS_HElSpine)
	Spine(Handle_ChFiDS_Spine)
	Choix(Standard_Integer)
	S1(Handle_BRepAdaptor_HSurface)
	I1(Handle_Adaptor3d_TopolTool)
	PC1(Handle_BRepAdaptor_HCurve2d)
	Sref1(Handle_BRepAdaptor_HSurface)
	PCref1(Handle_BRepAdaptor_HCurve2d)
	Decroch1(Standard_Boolean)
	Or1(TopAbs_Orientation)
	S2(Handle_BRepAdaptor_HSurface)
	I2(Handle_Adaptor3d_TopolTool)
	PC2(Handle_BRepAdaptor_HCurve2d)
	Sref2(Handle_BRepAdaptor_HSurface)
	PCref2(Handle_BRepAdaptor_HCurve2d)
	Decroch2(Standard_Boolean)
	Or2(TopAbs_Orientation)
	MaxStep(Standard_Real)
	Fleche(Standard_Real)
	TolGuide(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Inside(Standard_Boolean)
	Appro(Standard_Boolean)
	Forward(Standard_Boolean)
	RecP1(Standard_Boolean)
	RecRst1(Standard_Boolean)
	RecP2(Standard_Boolean)
	RecRst2(Standard_Boolean)
	Soldep(math_Vector)

Returns:
	virtual void

Method, implemented in  inheritants, calculates  
         the elements of construction of  the surface (fillet  
         or chamfer) contact edge/edge.") PerformSurf;
		virtual void PerformSurf (ChFiDS_SequenceOfSurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_BRepAdaptor_HCurve2d & PC1,const Handle_BRepAdaptor_HSurface & Sref1,const Handle_BRepAdaptor_HCurve2d & PCref1,Standard_Boolean & Decroch1,const TopAbs_Orientation Or1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const Handle_BRepAdaptor_HCurve2d & PC2,const Handle_BRepAdaptor_HSurface & Sref2,const Handle_BRepAdaptor_HCurve2d & PCref2,Standard_Boolean & Decroch2,const TopAbs_Orientation Or2,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP1,const Standard_Boolean RecRst1,const Standard_Boolean RecP2,const Standard_Boolean RecRst2,const math_Vector & Soldep);
		%feature("autodoc", "Args:
	Choice(Standard_Integer)
	DisOnF1(Standard_Boolean)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindChoiceDistAngle;
		Standard_Integer FindChoiceDistAngle (const Standard_Integer Choice,const Standard_Boolean DisOnF1);
};


%feature("shadow") ChFi3d_ChBuilder::~ChFi3d_ChBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi3d_ChBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFi3d_FilBuilder;
class ChFi3d_FilBuilder : public ChFi3d_Builder {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	FShape(ChFi3d_FilletShape)=ChFi3d_Rational
	Ta(Standard_Real)=1.0e-2

Returns:
	None

No detailed docstring for this function.") ChFi3d_FilBuilder;
		 ChFi3d_FilBuilder (const TopoDS_Shape & S,const ChFi3d_FilletShape FShape = ChFi3d_Rational,const Standard_Real Ta = 1.0e-2);
		%feature("autodoc", "Args:
	FShape(ChFi3d_FilletShape)

Returns:
	None

Sets the type of fillet surface.") SetFilletShape;
		void SetFilletShape (const ChFi3d_FilletShape FShape);
		%feature("autodoc", "Args:
	None
Returns:
	ChFi3d_FilletShape

Returns the type of fillet surface.") GetFilletShape;
		ChFi3d_FilletShape GetFilletShape ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

initialisation of  a contour with the first edge  
         (the following are found  by propagation).  
         Attention, you  need  to start  with  SetRadius.") Add;
		void Add (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	E(TopoDS_Edge)

Returns:
	None

initialisation of the constant vector the corresponding  1st  edge.") Add;
		void Add (const Standard_Real Radius,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	C(Handle_Law_Function)
	IC(Standard_Integer)
	IinC(Standard_Integer)

Returns:
	None

Set the radius of the contour of index IC.") SetRadius;
		void SetRadius (const Handle_Law_Function & C,const Standard_Integer IC,const Standard_Integer IinC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Boolean

Returns true the contour is flaged as edge constant.") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	Standard_Real

Returns the vector if the contour is flagged as edge  
         constant.") Radius;
		Standard_Real Radius (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	None

Reset all vectors of contour IC.") ResetContour;
		void ResetContour (const Standard_Integer IC);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	IC(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	None

Set a constant on edge E of  the contour of  
         index IC. Since  then  E is flagged as constant.") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	None

Extracts the flag constant and the vector of edge E.") UnSet;
		void UnSet (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	None

Set a vector on vertex  V of  the contour of index IC.") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	None

Extracts the vector of  the vertex V.") UnSet;
		void UnSet (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	UandR(gp_XY)
	IC(Standard_Integer)
	IinC(Standard_Integer)

Returns:
	None

Set  a vertex on the point of parametre U in the edge IinC  
         of  the contour of index IC") SetRadius;
		void SetRadius (const gp_XY & UandR,const Standard_Integer IC,const Standard_Integer IinC);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

Returns true E is flagged as edge constant.") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	Standard_Real

Returns the vector if E is flagged as edge constant.") Radius;
		Standard_Real Radius (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	Standard_Boolean

Returns in First and Last  les extremities of  the  
         part of variable  vector framing E, returns  
         False  if  E is flagged as edge constant.") GetBounds;
		Standard_Boolean GetBounds (const Standard_Integer IC,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)

Returns:
	Handle_Law_Function

Returns the rule of  elementary  evolution of  the  
         part to  variable vector framing E, returns a  
         rule zero if E is flagged as edge constant.") GetLaw;
		Handle_Law_Function GetLaw (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	IC(Standard_Integer)
	E(TopoDS_Edge)
	L(Handle_Law_Function)

Returns:
	None

Sets the rule of elementary evolution of  the  
         part to variable  vector framing E.") SetLaw;
		void SetLaw (const Standard_Integer IC,const TopoDS_Edge & E,const Handle_Law_Function & L);
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


%feature("shadow") ChFi3d_FilBuilder::~ChFi3d_FilBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFi3d_FilBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
