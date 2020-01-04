/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
%define CHFI3DDOCSTRING
"ChFi3d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_chfi3d.html"
%enddef
%module (package="OCC.Core", docstring=CHFI3DDOCSTRING) ChFi3d


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<ChFi3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<Geom_module.hxx>
#include<TopTools_module.hxx>
#include<GeomAbs_module.hxx>
#include<ChFiDS_module.hxx>
#include<Adaptor3d_module.hxx>
#include<math_module.hxx>
#include<Law_module.hxx>
#include<gp_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<Geom2d_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<BRepBlend_module.hxx>
#include<IntSurf_module.hxx>
#include<GeomFill_module.hxx>
#include<math_module.hxx>
#include<Extrema_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<Approx_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<TColGeom_module.hxx>
#include<AppParCurves_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepAdaptor.i
%import TopoDS.i
%import TopAbs.i
%import TopOpeBRepBuild.i
%import Geom.i
%import TopTools.i
%import GeomAbs.i
%import ChFiDS.i
%import Adaptor3d.i
%import math.i
%import Law.i
%import gp.i
%import GeomAdaptor.i
%import TopOpeBRepDS.i
%import Geom2d.i
%import TColStd.i
%import Bnd.i
%import BRepBlend.i
%import IntSurf.i
%import GeomFill.i
/* public enums */
enum ChFi3d_FilletShape {
	ChFi3d_Rational = 0,
	ChFi3d_QuasiAngular = 1,
	ChFi3d_Polynomial = 2,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class ChFi3d *
***************/
%rename(chfi3d) ChFi3d;
class ChFi3d {
	public:
		/****************** ConcaveSide ******************/
		%feature("compactdefaultargs") ConcaveSide;
		%feature("autodoc", "* Returns Reversed in Or1 and(or) Or2 if the concave edge defined by the interior of faces F1 and F2, in the neighbourhood of their boundary E is of the edge opposite to the normal of their surface support. The orientation of faces is not taken into consideration in the calculation. The function returns 0 if the calculation fails (tangence), if not, it returns the number of choice of the fillet or chamfer corresponding to the orientations calculated and to the tangent to the guide line read in E.
	:param S1:
	:type S1: BRepAdaptor_Surface
	:param S2:
	:type S2: BRepAdaptor_Surface
	:param E:
	:type E: TopoDS_Edge
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:rtype: int") ConcaveSide;
		static Standard_Integer ConcaveSide (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2,const TopoDS_Edge & E,TopAbs_Orientation & Or1,TopAbs_Orientation & Or2);

		/****************** NextSide ******************/
		%feature("compactdefaultargs") NextSide;
		%feature("autodoc", "* Same as ConcaveSide, but the orientations are logically deduced from the result of the call of ConcaveSide on the first pair of faces of the fillet or chamnfer.
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param OrSave1:
	:type OrSave1: TopAbs_Orientation
	:param OrSave2:
	:type OrSave2: TopAbs_Orientation
	:param ChoixSauv:
	:type ChoixSauv: int
	:rtype: int") NextSide;
		static Standard_Integer NextSide (TopAbs_Orientation & Or1,TopAbs_Orientation & Or2,const TopAbs_Orientation OrSave1,const TopAbs_Orientation OrSave2,const Standard_Integer ChoixSauv);

		/****************** NextSide ******************/
		%feature("compactdefaultargs") NextSide;
		%feature("autodoc", "* Same as the other NextSide, but the calculation is done on an edge only.
	:param Or:
	:type Or: TopAbs_Orientation
	:param OrSave:
	:type OrSave: TopAbs_Orientation
	:param OrFace:
	:type OrFace: TopAbs_Orientation
	:rtype: void") NextSide;
		static void NextSide (TopAbs_Orientation & Or,const TopAbs_Orientation OrSave,const TopAbs_Orientation OrFace);

		/****************** SameSide ******************/
		%feature("compactdefaultargs") SameSide;
		%feature("autodoc", "* Enables to determine while processing an angle, if two fillets or chamfers constituting a face have identic or opposed concave edges.
	:param Or:
	:type Or: TopAbs_Orientation
	:param OrSave1:
	:type OrSave1: TopAbs_Orientation
	:param OrSave2:
	:type OrSave2: TopAbs_Orientation
	:param OrFace1:
	:type OrFace1: TopAbs_Orientation
	:param OrFace2:
	:type OrFace2: TopAbs_Orientation
	:rtype: bool") SameSide;
		static Standard_Boolean SameSide (const TopAbs_Orientation Or,const TopAbs_Orientation OrSave1,const TopAbs_Orientation OrSave2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2);

};


%extend ChFi3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class ChFi3d_Builder *
***********************/
%nodefaultctor ChFi3d_Builder;
class ChFi3d_Builder {
	public:
		/****************** Abscissa ******************/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "* returns the abscissa of the vertex V on the contour of index IC.
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: float") Abscissa;
		Standard_Real Abscissa (const Standard_Integer IC,const TopoDS_Vertex & V);

		/****************** BadShape ******************/
		%feature("compactdefaultargs") BadShape;
		%feature("autodoc", "* if (HasResult()) returns partial result if (!HasResult())
	:rtype: TopoDS_Shape") BadShape;
		TopoDS_Shape BadShape ();

		/****************** Builder ******************/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "* Returns the Builder of topologic operations.
	:rtype: opencascade::handle<TopOpeBRepBuild_HBuilder>") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder ();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* returns true if the contour of index IC is closed
	:param IC:
	:type IC: int
	:rtype: bool") Closed;
		Standard_Boolean Closed (const Standard_Integer IC);

		/****************** ClosedAndTangent ******************/
		%feature("compactdefaultargs") ClosedAndTangent;
		%feature("autodoc", "* returns true if the contour of index IC is closed an tangent.
	:param IC:
	:type IC: int
	:rtype: bool") ClosedAndTangent;
		Standard_Boolean ClosedAndTangent (const Standard_Integer IC);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* general calculation of geometry on all edges, topologic reconstruction.
	:rtype: None") Compute;
		void Compute ();

		/****************** ComputedSurface ******************/
		%feature("compactdefaultargs") ComputedSurface;
		%feature("autodoc", "* Returns the IS'th surface calculated on the contour IC.
	:param IC:
	:type IC: int
	:param IS:
	:type IS: int
	:rtype: opencascade::handle<Geom_Surface>") ComputedSurface;
		opencascade::handle<Geom_Surface> ComputedSurface (const Standard_Integer IC,const Standard_Integer IS);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* gives the number of the contour containing E or 0 if E does not belong to any contour.
	:param E:
	:type E: TopoDS_Edge
	:rtype: int") Contains;
		Standard_Integer Contains (const TopoDS_Edge & E);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* gives the number of the contour containing E or 0 if E does not belong to any contour. Sets in IndexInSpine the index of E in the contour if it's found
	:param E:
	:type E: TopoDS_Edge
	:param IndexInSpine:
	:type IndexInSpine: int
	:rtype: int") Contains;
		Standard_Integer Contains (const TopoDS_Edge & E,Standard_Integer &OutValue);

		/****************** FaultyContour ******************/
		%feature("compactdefaultargs") FaultyContour;
		%feature("autodoc", "* Returns the number of I'th contour on which the calculation has failed.
	:param I:
	:type I: int
	:rtype: int") FaultyContour;
		Standard_Integer FaultyContour (const Standard_Integer I);

		/****************** FaultyVertex ******************/
		%feature("compactdefaultargs") FaultyVertex;
		%feature("autodoc", "* Returns the IV'th vertex on which the calculation has failed.
	:param IV:
	:type IV: int
	:rtype: TopoDS_Vertex") FaultyVertex;
		TopoDS_Vertex FaultyVertex (const Standard_Integer IV);

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "* returns the First vertex V of the contour of index IC.
	:param IC:
	:type IC: int
	:rtype: TopoDS_Vertex") FirstVertex;
		TopoDS_Vertex FirstVertex (const Standard_Integer IC);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Advanced function for the history
	:param EouV:
	:type EouV: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & EouV);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "* returns True if a partial result has been calculated
	:rtype: bool") HasResult;
		Standard_Boolean HasResult ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if the computation is success
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "* returns the Last vertex V of the contour of index IC.
	:param IC:
	:type IC: int
	:rtype: TopoDS_Vertex") LastVertex;
		TopoDS_Vertex LastVertex (const Standard_Integer IC);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* returns the length of the contour of index IC.
	:param IC:
	:type IC: int
	:rtype: float") Length;
		Standard_Real Length (const Standard_Integer IC);

		/****************** NbComputedSurfaces ******************/
		%feature("compactdefaultargs") NbComputedSurfaces;
		%feature("autodoc", "* Returns the number of surfaces calculated on the contour IC.
	:param IC:
	:type IC: int
	:rtype: int") NbComputedSurfaces;
		Standard_Integer NbComputedSurfaces (const Standard_Integer IC);

		/****************** NbElements ******************/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "* gives the number of disjoint contours on which the fillets are calculated
	:rtype: int") NbElements;
		Standard_Integer NbElements ();

		/****************** NbFaultyContours ******************/
		%feature("compactdefaultargs") NbFaultyContours;
		%feature("autodoc", "* Returns the number of contours on which the calculation has failed.
	:rtype: int") NbFaultyContours;
		Standard_Integer NbFaultyContours ();

		/****************** NbFaultyVertices ******************/
		%feature("compactdefaultargs") NbFaultyVertices;
		%feature("autodoc", "* Returns the number of vertices on which the calculation has failed.
	:rtype: int") NbFaultyVertices;
		Standard_Integer NbFaultyVertices ();

		/****************** PerformTwoCornerbyInter ******************/
		%feature("compactdefaultargs") PerformTwoCornerbyInter;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: bool") PerformTwoCornerbyInter;
		Standard_Boolean PerformTwoCornerbyInter (const Standard_Integer Index);

		/****************** RelativeAbscissa ******************/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "* returns the relative abscissa([0.,1.]) of the vertex V on the contour of index IC.
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: float") RelativeAbscissa;
		Standard_Real RelativeAbscissa (const Standard_Integer IC,const TopoDS_Vertex & V);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* extracts from the list the contour containing edge E.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Remove;
		void Remove (const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reset all results of compute and returns the algorythm in the state of the last acquisition to enable modification of contours or areas.
	:rtype: None") Reset;
		void Reset ();

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", ":param InternalContinuity:
	:type InternalContinuity: GeomAbs_Shape
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: None") SetContinuity;
		void SetContinuity (const GeomAbs_Shape InternalContinuity,const Standard_Real AngularTolerance);

		/****************** SetParams ******************/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", ":param Tang:
	:type Tang: float
	:param Tesp:
	:type Tesp: float
	:param T2d:
	:type T2d: float
	:param TApp3d:
	:type TApp3d: float
	:param TolApp2d:
	:type TolApp2d: float
	:param Fleche:
	:type Fleche: float
	:rtype: None") SetParams;
		void SetParams (const Standard_Real Tang,const Standard_Real Tesp,const Standard_Real T2d,const Standard_Real TApp3d,const Standard_Real TolApp2d,const Standard_Real Fleche);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* if (Isdone()) makes the result. if (!Isdone())
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** SplitKPart ******************/
		%feature("compactdefaultargs") SplitKPart;
		%feature("autodoc", "* Method, implemented in the inheritants, calculates the elements of construction of the surface (fillet or chamfer).
	:param Data:
	:type Data: ChFiDS_SurfData
	:param SetData:
	:type SetData: ChFiDS_SequenceOfSurfData
	:param Spine:
	:type Spine: ChFiDS_Spine
	:param Iedge:
	:type Iedge: int
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param I1:
	:type I1: Adaptor3d_TopolTool
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param I2:
	:type I2: Adaptor3d_TopolTool
	:param Intf:
	:type Intf: bool
	:param Intl:
	:type Intl: bool
	:rtype: bool") SplitKPart;
		Standard_Boolean SplitKPart (const opencascade::handle<ChFiDS_SurfData> & Data,ChFiDS_SequenceOfSurfData & SetData,const opencascade::handle<ChFiDS_Spine> & Spine,const Standard_Integer Iedge,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & I1,const opencascade::handle<Adaptor3d_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & I2,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** StripeStatus ******************/
		%feature("compactdefaultargs") StripeStatus;
		%feature("autodoc", "* for the stripe IC ,indication on the cause of failure WalkingFailure,TwistedSurface,Error, Ok
	:param IC:
	:type IC: int
	:rtype: ChFiDS_ErrorStatus") StripeStatus;
		ChFiDS_ErrorStatus StripeStatus (const Standard_Integer IC);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* gives the n'th set of edges (contour) if I >NbElements()
	:param I:
	:type I: int
	:rtype: opencascade::handle<ChFiDS_Spine>") Value;
		opencascade::handle<ChFiDS_Spine> Value (const Standard_Integer I);

};


%extend ChFi3d_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class ChFi3d_SearchSing *
**************************/
class ChFi3d_SearchSing : public math_FunctionWithDerivative {
	public:
		/****************** ChFi3d_SearchSing ******************/
		%feature("compactdefaultargs") ChFi3d_SearchSing;
		%feature("autodoc", ":param C1:
	:type C1: Geom_Curve
	:param C2:
	:type C2: Geom_Curve
	:rtype: None") ChFi3d_SearchSing;
		 ChFi3d_SearchSing (const opencascade::handle<Geom_Curve> & C1,const opencascade::handle<Geom_Curve> & C2);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "* computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
	:param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* computes the value of the function <F> for the variable <X>. returns True if the computation was done successfully, False otherwise.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend ChFi3d_SearchSing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class ChFi3d_ChBuilder *
*************************/
class ChFi3d_ChBuilder : public ChFi3d_Builder {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* initializes a contour with the edge <E> as first (the next are found by propagation ). The two distances (parameters of the chamfer) must be set after. if the edge <E> has more than 2 adjacent faces
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* initializes a new contour with the edge <E> as first (the next are found by propagation ), and the distance <Dis> if the edge <E> has more than 2 adjacent faces
	:param Dis:
	:type Dis: float
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const Standard_Real Dis,const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* initializes a new contour with the edge <E> as first (the next are found by propagation ), and the distance <Dis1> and <Dis2> if the edge <E> has more than 2 adjacent faces
	:param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Add;
		void Add (const Standard_Real Dis1,const Standard_Real Dis2,const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** AddDA ******************/
		%feature("compactdefaultargs") AddDA;
		%feature("autodoc", "* initializes a new contour with the edge <E> as first (the next are found by propagation ), and the distance <Dis1> and <Angle> if the edge <E> has more than 2 adjacent faces
	:param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") AddDA;
		void AddDA (const Standard_Real Dis,const Standard_Real Angle,const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** ChFi3d_ChBuilder ******************/
		%feature("compactdefaultargs") ChFi3d_ChBuilder;
		%feature("autodoc", "* initializes the Builder with the Shape <S> for the computation of chamfers
	:param S:
	:type S: TopoDS_Shape
	:param Ta: default value is 1.0e-2
	:type Ta: float
	:rtype: None") ChFi3d_ChBuilder;
		 ChFi3d_ChBuilder (const TopoDS_Shape & S,const Standard_Real Ta = 1.0e-2);

		/****************** Dists ******************/
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "* gives the distances <Dis1> and <Dis2> of the fillet contour of index <IC> in the DS
	:param IC:
	:type IC: int
	:param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:rtype: None") Dists;
		void Dists (const Standard_Integer IC,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetDist ******************/
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", "* gives the distances <Dis> of the fillet contour of index <IC> in the DS
	:param IC:
	:type IC: int
	:param Dis:
	:type Dis: float
	:rtype: None") GetDist;
		void GetDist (const Standard_Integer IC,Standard_Real &OutValue);

		/****************** GetDistAngle ******************/
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "* gives the distances <Dis> and <Angle> of the fillet contour of index <IC> in the DS
	:param IC:
	:type IC: int
	:param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:rtype: None") GetDistAngle;
		void GetDistAngle (const Standard_Integer IC,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsChamfer ******************/
		%feature("compactdefaultargs") IsChamfer;
		%feature("autodoc", "* renvoi la methode des chanfreins utilisee
	:param IC:
	:type IC: int
	:rtype: ChFiDS_ChamfMethod") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer (const Standard_Integer IC);

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "* returns the mode of chamfer used
	:rtype: ChFiDS_ChamfMode") Mode;
		ChFiDS_ChamfMode Mode ();

		/****************** NbSurf ******************/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: int") NbSurf;
		Standard_Integer NbSurf (const Standard_Integer IC);

		/****************** PerformSurf ******************/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "* Methode, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer).
	:param Data:
	:type Data: ChFiDS_SequenceOfSurfData
	:param Guide:
	:type Guide: ChFiDS_HElSpine
	:param Spine:
	:type Spine: ChFiDS_Spine
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: BRepAdaptor_HSurface
	:param I1:
	:type I1: Adaptor3d_TopolTool
	:param S2:
	:type S2: BRepAdaptor_HSurface
	:param I2:
	:type I2: Adaptor3d_TopolTool
	:param MaxStep:
	:type MaxStep: float
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Inside:
	:type Inside: bool
	:param Appro:
	:type Appro: bool
	:param Forward:
	:type Forward: bool
	:param RecOnS1:
	:type RecOnS1: bool
	:param RecOnS2:
	:type RecOnS2: bool
	:param Soldep:
	:type Soldep: math_Vector
	:param Intf:
	:type Intf: int
	:param Intl:
	:type Intl: int
	:rtype: bool") PerformSurf;
		virtual Standard_Boolean PerformSurf (ChFiDS_SequenceOfSurfData & Data,const opencascade::handle<ChFiDS_HElSpine> & Guide,const opencascade::handle<ChFiDS_Spine> & Spine,const Standard_Integer Choix,const opencascade::handle<BRepAdaptor_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & I1,const opencascade::handle<BRepAdaptor_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & I2,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecOnS1,const Standard_Boolean RecOnS2,const math_Vector & Soldep,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** PerformSurf ******************/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "* Method, implemented in the inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/face.
	:param Data:
	:type Data: ChFiDS_SequenceOfSurfData
	:param Guide:
	:type Guide: ChFiDS_HElSpine
	:param Spine:
	:type Spine: ChFiDS_Spine
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: BRepAdaptor_HSurface
	:param I1:
	:type I1: Adaptor3d_TopolTool
	:param PC1:
	:type PC1: BRepAdaptor_HCurve2d
	:param Sref1:
	:type Sref1: BRepAdaptor_HSurface
	:param PCref1:
	:type PCref1: BRepAdaptor_HCurve2d
	:param Decroch1:
	:type Decroch1: bool
	:param S2:
	:type S2: BRepAdaptor_HSurface
	:param I2:
	:type I2: Adaptor3d_TopolTool
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param MaxStep:
	:type MaxStep: float
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Inside:
	:type Inside: bool
	:param Appro:
	:type Appro: bool
	:param Forward:
	:type Forward: bool
	:param RecP:
	:type RecP: bool
	:param RecS:
	:type RecS: bool
	:param RecRst:
	:type RecRst: bool
	:param Soldep:
	:type Soldep: math_Vector
	:rtype: void") PerformSurf;
		virtual void PerformSurf (ChFiDS_SequenceOfSurfData & Data,const opencascade::handle<ChFiDS_HElSpine> & Guide,const opencascade::handle<ChFiDS_Spine> & Spine,const Standard_Integer Choix,const opencascade::handle<BRepAdaptor_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & I1,const opencascade::handle<BRepAdaptor_HCurve2d> & PC1,const opencascade::handle<BRepAdaptor_HSurface> & Sref1,const opencascade::handle<BRepAdaptor_HCurve2d> & PCref1,Standard_Boolean &OutValue,const opencascade::handle<BRepAdaptor_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & I2,const TopAbs_Orientation Or2,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);

		/****************** PerformSurf ******************/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "* Method, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/face.
	:param Data:
	:type Data: ChFiDS_SequenceOfSurfData
	:param Guide:
	:type Guide: ChFiDS_HElSpine
	:param Spine:
	:type Spine: ChFiDS_Spine
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: BRepAdaptor_HSurface
	:param I1:
	:type I1: Adaptor3d_TopolTool
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param S2:
	:type S2: BRepAdaptor_HSurface
	:param I2:
	:type I2: Adaptor3d_TopolTool
	:param PC2:
	:type PC2: BRepAdaptor_HCurve2d
	:param Sref2:
	:type Sref2: BRepAdaptor_HSurface
	:param PCref2:
	:type PCref2: BRepAdaptor_HCurve2d
	:param Decroch2:
	:type Decroch2: bool
	:param MaxStep:
	:type MaxStep: float
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Inside:
	:type Inside: bool
	:param Appro:
	:type Appro: bool
	:param Forward:
	:type Forward: bool
	:param RecP:
	:type RecP: bool
	:param RecS:
	:type RecS: bool
	:param RecRst:
	:type RecRst: bool
	:param Soldep:
	:type Soldep: math_Vector
	:rtype: void") PerformSurf;
		virtual void PerformSurf (ChFiDS_SequenceOfSurfData & Data,const opencascade::handle<ChFiDS_HElSpine> & Guide,const opencascade::handle<ChFiDS_Spine> & Spine,const Standard_Integer Choix,const opencascade::handle<BRepAdaptor_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & I1,const TopAbs_Orientation Or1,const opencascade::handle<BRepAdaptor_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & I2,const opencascade::handle<BRepAdaptor_HCurve2d> & PC2,const opencascade::handle<BRepAdaptor_HSurface> & Sref2,const opencascade::handle<BRepAdaptor_HCurve2d> & PCref2,Standard_Boolean &OutValue,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);

		/****************** PerformSurf ******************/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "* Method, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/edge.
	:param Data:
	:type Data: ChFiDS_SequenceOfSurfData
	:param Guide:
	:type Guide: ChFiDS_HElSpine
	:param Spine:
	:type Spine: ChFiDS_Spine
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: BRepAdaptor_HSurface
	:param I1:
	:type I1: Adaptor3d_TopolTool
	:param PC1:
	:type PC1: BRepAdaptor_HCurve2d
	:param Sref1:
	:type Sref1: BRepAdaptor_HSurface
	:param PCref1:
	:type PCref1: BRepAdaptor_HCurve2d
	:param Decroch1:
	:type Decroch1: bool
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param S2:
	:type S2: BRepAdaptor_HSurface
	:param I2:
	:type I2: Adaptor3d_TopolTool
	:param PC2:
	:type PC2: BRepAdaptor_HCurve2d
	:param Sref2:
	:type Sref2: BRepAdaptor_HSurface
	:param PCref2:
	:type PCref2: BRepAdaptor_HCurve2d
	:param Decroch2:
	:type Decroch2: bool
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param MaxStep:
	:type MaxStep: float
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Inside:
	:type Inside: bool
	:param Appro:
	:type Appro: bool
	:param Forward:
	:type Forward: bool
	:param RecP1:
	:type RecP1: bool
	:param RecRst1:
	:type RecRst1: bool
	:param RecP2:
	:type RecP2: bool
	:param RecRst2:
	:type RecRst2: bool
	:param Soldep:
	:type Soldep: math_Vector
	:rtype: void") PerformSurf;
		virtual void PerformSurf (ChFiDS_SequenceOfSurfData & Data,const opencascade::handle<ChFiDS_HElSpine> & Guide,const opencascade::handle<ChFiDS_Spine> & Spine,const Standard_Integer Choix,const opencascade::handle<BRepAdaptor_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & I1,const opencascade::handle<BRepAdaptor_HCurve2d> & PC1,const opencascade::handle<BRepAdaptor_HSurface> & Sref1,const opencascade::handle<BRepAdaptor_HCurve2d> & PCref1,Standard_Boolean &OutValue,const TopAbs_Orientation Or1,const opencascade::handle<BRepAdaptor_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & I2,const opencascade::handle<BRepAdaptor_HCurve2d> & PC2,const opencascade::handle<BRepAdaptor_HSurface> & Sref2,const opencascade::handle<BRepAdaptor_HCurve2d> & PCref2,Standard_Boolean &OutValue,const TopAbs_Orientation Or2,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP1,const Standard_Boolean RecRst1,const Standard_Boolean RecP2,const Standard_Boolean RecRst2,const math_Vector & Soldep);

		/****************** ResetContour ******************/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "* Reset tous rayons du contour IC.
	:param IC:
	:type IC: int
	:rtype: None") ResetContour;
		void ResetContour (const Standard_Integer IC);

		/****************** Sect ******************/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", ":param IC:
	:type IC: int
	:param IS:
	:type IS: int
	:rtype: opencascade::handle<ChFiDS_SecHArray1>") Sect;
		opencascade::handle<ChFiDS_SecHArray1> Sect (const Standard_Integer IC,const Standard_Integer IS);

		/****************** SetDist ******************/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "* set the distance <Dis> of the fillet contour of index <IC> in the DS with <Dis> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>
	:param Dis:
	:type Dis: float
	:param IC:
	:type IC: int
	:param F:
	:type F: TopoDS_Face
	:rtype: None") SetDist;
		void SetDist (const Standard_Real Dis,const Standard_Integer IC,const TopoDS_Face & F);

		/****************** SetDistAngle ******************/
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "* set the distance <Dis> and <Angle> of the fillet contour of index <IC> in the DS with <Dis> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>
	:param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:param IC:
	:type IC: int
	:param F:
	:type F: TopoDS_Face
	:rtype: None") SetDistAngle;
		void SetDistAngle (const Standard_Real Dis,const Standard_Real Angle,const Standard_Integer IC,const TopoDS_Face & F);

		/****************** SetDists ******************/
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "* set the distances <Dis1> and <Dis2> of the fillet contour of index <IC> in the DS with <Dis1> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>
	:param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:param IC:
	:type IC: int
	:param F:
	:type F: TopoDS_Face
	:rtype: None") SetDists;
		void SetDists (const Standard_Real Dis1,const Standard_Real Dis2,const Standard_Integer IC,const TopoDS_Face & F);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "* set the mode of shamfer
	:param theMode:
	:type theMode: ChFiDS_ChamfMode
	:rtype: None") SetMode;
		void SetMode (const ChFiDS_ChamfMode theMode);

		/****************** SimulSurf ******************/
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", ":param Data:
	:type Data: ChFiDS_SurfData
	:param Guide:
	:type Guide: ChFiDS_HElSpine
	:param Spine:
	:type Spine: ChFiDS_Spine
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: BRepAdaptor_HSurface
	:param I1:
	:type I1: Adaptor3d_TopolTool
	:param PC1:
	:type PC1: BRepAdaptor_HCurve2d
	:param Sref1:
	:type Sref1: BRepAdaptor_HSurface
	:param PCref1:
	:type PCref1: BRepAdaptor_HCurve2d
	:param Decroch1:
	:type Decroch1: bool
	:param S2:
	:type S2: BRepAdaptor_HSurface
	:param I2:
	:type I2: Adaptor3d_TopolTool
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Inside:
	:type Inside: bool
	:param Appro:
	:type Appro: bool
	:param Forward:
	:type Forward: bool
	:param RecP:
	:type RecP: bool
	:param RecS:
	:type RecS: bool
	:param RecRst:
	:type RecRst: bool
	:param Soldep:
	:type Soldep: math_Vector
	:rtype: void") SimulSurf;
		virtual void SimulSurf (opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<ChFiDS_HElSpine> & Guide,const opencascade::handle<ChFiDS_Spine> & Spine,const Standard_Integer Choix,const opencascade::handle<BRepAdaptor_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & I1,const opencascade::handle<BRepAdaptor_HCurve2d> & PC1,const opencascade::handle<BRepAdaptor_HSurface> & Sref1,const opencascade::handle<BRepAdaptor_HCurve2d> & PCref1,Standard_Boolean &OutValue,const opencascade::handle<BRepAdaptor_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & I2,const TopAbs_Orientation Or2,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);

		/****************** SimulSurf ******************/
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", ":param Data:
	:type Data: ChFiDS_SurfData
	:param Guide:
	:type Guide: ChFiDS_HElSpine
	:param Spine:
	:type Spine: ChFiDS_Spine
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: BRepAdaptor_HSurface
	:param I1:
	:type I1: Adaptor3d_TopolTool
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param S2:
	:type S2: BRepAdaptor_HSurface
	:param I2:
	:type I2: Adaptor3d_TopolTool
	:param PC2:
	:type PC2: BRepAdaptor_HCurve2d
	:param Sref2:
	:type Sref2: BRepAdaptor_HSurface
	:param PCref2:
	:type PCref2: BRepAdaptor_HCurve2d
	:param Decroch2:
	:type Decroch2: bool
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Inside:
	:type Inside: bool
	:param Appro:
	:type Appro: bool
	:param Forward:
	:type Forward: bool
	:param RecP:
	:type RecP: bool
	:param RecS:
	:type RecS: bool
	:param RecRst:
	:type RecRst: bool
	:param Soldep:
	:type Soldep: math_Vector
	:rtype: void") SimulSurf;
		virtual void SimulSurf (opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<ChFiDS_HElSpine> & Guide,const opencascade::handle<ChFiDS_Spine> & Spine,const Standard_Integer Choix,const opencascade::handle<BRepAdaptor_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & I1,const TopAbs_Orientation Or1,const opencascade::handle<BRepAdaptor_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & I2,const opencascade::handle<BRepAdaptor_HCurve2d> & PC2,const opencascade::handle<BRepAdaptor_HSurface> & Sref2,const opencascade::handle<BRepAdaptor_HCurve2d> & PCref2,Standard_Boolean &OutValue,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);

		/****************** SimulSurf ******************/
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", ":param Data:
	:type Data: ChFiDS_SurfData
	:param Guide:
	:type Guide: ChFiDS_HElSpine
	:param Spine:
	:type Spine: ChFiDS_Spine
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: BRepAdaptor_HSurface
	:param I1:
	:type I1: Adaptor3d_TopolTool
	:param PC1:
	:type PC1: BRepAdaptor_HCurve2d
	:param Sref1:
	:type Sref1: BRepAdaptor_HSurface
	:param PCref1:
	:type PCref1: BRepAdaptor_HCurve2d
	:param Decroch1:
	:type Decroch1: bool
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param S2:
	:type S2: BRepAdaptor_HSurface
	:param I2:
	:type I2: Adaptor3d_TopolTool
	:param PC2:
	:type PC2: BRepAdaptor_HCurve2d
	:param Sref2:
	:type Sref2: BRepAdaptor_HSurface
	:param PCref2:
	:type PCref2: BRepAdaptor_HCurve2d
	:param Decroch2:
	:type Decroch2: bool
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Inside:
	:type Inside: bool
	:param Appro:
	:type Appro: bool
	:param Forward:
	:type Forward: bool
	:param RecP1:
	:type RecP1: bool
	:param RecRst1:
	:type RecRst1: bool
	:param RecP2:
	:type RecP2: bool
	:param RecRst2:
	:type RecRst2: bool
	:param Soldep:
	:type Soldep: math_Vector
	:rtype: void") SimulSurf;
		virtual void SimulSurf (opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<ChFiDS_HElSpine> & Guide,const opencascade::handle<ChFiDS_Spine> & Spine,const Standard_Integer Choix,const opencascade::handle<BRepAdaptor_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & I1,const opencascade::handle<BRepAdaptor_HCurve2d> & PC1,const opencascade::handle<BRepAdaptor_HSurface> & Sref1,const opencascade::handle<BRepAdaptor_HCurve2d> & PCref1,Standard_Boolean &OutValue,const TopAbs_Orientation Or1,const opencascade::handle<BRepAdaptor_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & I2,const opencascade::handle<BRepAdaptor_HCurve2d> & PC2,const opencascade::handle<BRepAdaptor_HSurface> & Sref2,const opencascade::handle<BRepAdaptor_HCurve2d> & PCref2,Standard_Boolean &OutValue,const TopAbs_Orientation Or2,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP1,const Standard_Boolean RecRst1,const Standard_Boolean RecP2,const Standard_Boolean RecRst2,const math_Vector & Soldep);

		/****************** Simulate ******************/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: None") Simulate;
		void Simulate (const Standard_Integer IC);

};


%extend ChFi3d_ChBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class ChFi3d_FilBuilder *
**************************/
class ChFi3d_FilBuilder : public ChFi3d_Builder {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* initialisation of a contour with the first edge (the following are found by propagation). Attention, you need to start with SetRadius.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* initialisation of the constant vector the corresponding 1st edge.
	:param Radius:
	:type Radius: float
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const Standard_Real Radius,const TopoDS_Edge & E);

		/****************** ChFi3d_FilBuilder ******************/
		%feature("compactdefaultargs") ChFi3d_FilBuilder;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param FShape: default value is ChFi3d_Rational
	:type FShape: ChFi3d_FilletShape
	:param Ta: default value is 1.0e-2
	:type Ta: float
	:rtype: None") ChFi3d_FilBuilder;
		 ChFi3d_FilBuilder (const TopoDS_Shape & S,const ChFi3d_FilletShape FShape = ChFi3d_Rational,const Standard_Real Ta = 1.0e-2);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "* Returns in First and Last les extremities of the part of variable vector framing E, returns False if E is flagged as edge constant.
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: bool") GetBounds;
		Standard_Boolean GetBounds (const Standard_Integer IC,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetFilletShape ******************/
		%feature("compactdefaultargs") GetFilletShape;
		%feature("autodoc", "* Returns the type of fillet surface.
	:rtype: ChFi3d_FilletShape") GetFilletShape;
		ChFi3d_FilletShape GetFilletShape ();

		/****************** GetLaw ******************/
		%feature("compactdefaultargs") GetLaw;
		%feature("autodoc", "* Returns the rule of elementary evolution of the part to variable vector framing E, returns a rule zero if E is flagged as edge constant.
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: opencascade::handle<Law_Function>") GetLaw;
		opencascade::handle<Law_Function> GetLaw (const Standard_Integer IC,const TopoDS_Edge & E);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "* Returns true the contour is flaged as edge constant.
	:param IC:
	:type IC: int
	:rtype: bool") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IC);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "* Returns true E is flagged as edge constant.
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IC,const TopoDS_Edge & E);

		/****************** NbSurf ******************/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: int") NbSurf;
		Standard_Integer NbSurf (const Standard_Integer IC);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* Returns the vector if the contour is flagged as edge constant.
	:param IC:
	:type IC: int
	:rtype: float") Radius;
		Standard_Real Radius (const Standard_Integer IC);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* Returns the vector if E is flagged as edge constant.
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: float") Radius;
		Standard_Real Radius (const Standard_Integer IC,const TopoDS_Edge & E);

		/****************** ResetContour ******************/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "* Reset all vectors of contour IC.
	:param IC:
	:type IC: int
	:rtype: None") ResetContour;
		void ResetContour (const Standard_Integer IC);

		/****************** Sect ******************/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", ":param IC:
	:type IC: int
	:param IS:
	:type IS: int
	:rtype: opencascade::handle<ChFiDS_SecHArray1>") Sect;
		opencascade::handle<ChFiDS_SecHArray1> Sect (const Standard_Integer IC,const Standard_Integer IS);

		/****************** SetFilletShape ******************/
		%feature("compactdefaultargs") SetFilletShape;
		%feature("autodoc", "* Sets the type of fillet surface.
	:param FShape:
	:type FShape: ChFi3d_FilletShape
	:rtype: None") SetFilletShape;
		void SetFilletShape (const ChFi3d_FilletShape FShape);

		/****************** SetLaw ******************/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "* Sets the rule of elementary evolution of the part to variable vector framing E.
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:param L:
	:type L: Law_Function
	:rtype: None") SetLaw;
		void SetLaw (const Standard_Integer IC,const TopoDS_Edge & E,const opencascade::handle<Law_Function> & L);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Set the radius of the contour of index IC.
	:param C:
	:type C: Law_Function
	:param IC:
	:type IC: int
	:param IinC:
	:type IinC: int
	:rtype: None") SetRadius;
		void SetRadius (const opencascade::handle<Law_Function> & C,const Standard_Integer IC,const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Set a constant on edge E of the contour of index IC. Since then E is flagged as constant.
	:param Radius:
	:type Radius: float
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const TopoDS_Edge & E);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Set a vector on vertex V of the contour of index IC.
	:param Radius:
	:type Radius: float
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const TopoDS_Vertex & V);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Set a vertex on the point of parametre U in the edge IinC of the contour of index IC
	:param UandR:
	:type UandR: gp_XY
	:param IC:
	:type IC: int
	:param IinC:
	:type IinC: int
	:rtype: None") SetRadius;
		void SetRadius (const gp_XY & UandR,const Standard_Integer IC,const Standard_Integer IinC);

		/****************** Simulate ******************/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: None") Simulate;
		void Simulate (const Standard_Integer IC);

		/****************** UnSet ******************/
		%feature("compactdefaultargs") UnSet;
		%feature("autodoc", "* Extracts the flag constant and the vector of edge E.
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") UnSet;
		void UnSet (const Standard_Integer IC,const TopoDS_Edge & E);

		/****************** UnSet ******************/
		%feature("compactdefaultargs") UnSet;
		%feature("autodoc", "* Extracts the vector of the vertex V.
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: None") UnSet;
		void UnSet (const Standard_Integer IC,const TopoDS_Vertex & V);

};


%extend ChFi3d_FilBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
