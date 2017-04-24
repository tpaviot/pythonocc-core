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
%module (package="OCC") ChFi3d

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


%include ChFi3d_headers.i


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
/* end typedefs declaration */

/* public enums */
enum ChFi3d_FilletShape {
	ChFi3d_Rational = 0,
	ChFi3d_QuasiAngular = 1,
	ChFi3d_Polynomial = 2,
};

/* end public enums declaration */

%rename(chfi3d) ChFi3d;
class ChFi3d {
	public:
		%feature("compactdefaultargs") ConcaveSide;
		%feature("autodoc", "	* Returns Reversed in Or1 and(or) Or2 if the concave edge defined by the interior of faces F1 and F2, in the neighbourhood of their boundary E is of the edge opposite to the normal of their surface support. The orientation of faces is not taken into consideration in the calculation. The function returns 0 if the calculation fails (tangence), if not, it returns the number of choice of the fillet or chamfer corresponding to the orientations calculated and to the tangent to the guide line read in E.

	:param S1:
	:type S1: BRepAdaptor_Surface &
	:param S2:
	:type S2: BRepAdaptor_Surface &
	:param E:
	:type E: TopoDS_Edge &
	:param Or1:
	:type Or1: TopAbs_Orientation &
	:param Or2:
	:type Or2: TopAbs_Orientation &
	:rtype: int
") ConcaveSide;
		static Standard_Integer ConcaveSide (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2,const TopoDS_Edge & E,TopAbs_Orientation & Or1,TopAbs_Orientation & Or2);
		%feature("compactdefaultargs") NextSide;
		%feature("autodoc", "	* Same as ConcaveSide, but the orientations are logically deduced from the result of the call of ConcaveSide on the first pair of faces of the fillet or chamnfer.

	:param Or1:
	:type Or1: TopAbs_Orientation &
	:param Or2:
	:type Or2: TopAbs_Orientation &
	:param OrSave1:
	:type OrSave1: TopAbs_Orientation
	:param OrSave2:
	:type OrSave2: TopAbs_Orientation
	:param ChoixSauv:
	:type ChoixSauv: int
	:rtype: int
") NextSide;
		static Standard_Integer NextSide (TopAbs_Orientation & Or1,TopAbs_Orientation & Or2,const TopAbs_Orientation OrSave1,const TopAbs_Orientation OrSave2,const Standard_Integer ChoixSauv);
		%feature("compactdefaultargs") NextSide;
		%feature("autodoc", "	* Same as the other NextSide, but the calculation is done on an edge only.

	:param Or:
	:type Or: TopAbs_Orientation &
	:param OrSave:
	:type OrSave: TopAbs_Orientation
	:param OrFace:
	:type OrFace: TopAbs_Orientation
	:rtype: void
") NextSide;
		static void NextSide (TopAbs_Orientation & Or,const TopAbs_Orientation OrSave,const TopAbs_Orientation OrFace);
		%feature("compactdefaultargs") SameSide;
		%feature("autodoc", "	* Enables to determine while processing an angle, if two fillets or chamfers constituting a face have identic or opposed concave edges.

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
	:rtype: bool
") SameSide;
		static Standard_Boolean SameSide (const TopAbs_Orientation Or,const TopAbs_Orientation OrSave1,const TopAbs_Orientation OrSave2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2);
};


%extend ChFi3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFi3d_Builder;
class ChFi3d_Builder {
	public:
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "	:param Tang:
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
	:rtype: None
") SetParams;
		void SetParams (const Standard_Real Tang,const Standard_Real Tesp,const Standard_Real T2d,const Standard_Real TApp3d,const Standard_Real TolApp2d,const Standard_Real Fleche);
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "	:param InternalContinuity:
	:type InternalContinuity: GeomAbs_Shape
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: None
") SetContinuity;
		void SetContinuity (const GeomAbs_Shape InternalContinuity,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* extracts from the list the contour containing edge E.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Remove;
		void Remove (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* gives the number of the contour containing E or 0 if E does not belong to any contour.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: int
") Contains;
		Standard_Integer Contains (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* gives the number of the contour containing E or 0 if E does not belong to any contour. Sets in IndexInSpine the index of E in the contour if it's found

	:param E:
	:type E: TopoDS_Edge &
	:param IndexInSpine:
	:type IndexInSpine: int &
	:rtype: int
") Contains;
		Standard_Integer Contains (const TopoDS_Edge & E,Standard_Integer &OutValue);
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "	* gives the number of disjoint contours on which the fillets are calculated

	:rtype: int
") NbElements;
		Standard_Integer NbElements ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* gives the n'th set of edges (contour) if I >NbElements()

	:param I:
	:type I: int
	:rtype: Handle_ChFiDS_Spine
") Value;
		Handle_ChFiDS_Spine Value (const Standard_Integer I);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* returns the length of the contour of index IC.

	:param IC:
	:type IC: int
	:rtype: float
") Length;
		Standard_Real Length (const Standard_Integer IC);
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "	* returns the First vertex V of the contour of index IC.

	:param IC:
	:type IC: int
	:rtype: TopoDS_Vertex
") FirstVertex;
		TopoDS_Vertex FirstVertex (const Standard_Integer IC);
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "	* returns the Last vertex V of the contour of index IC.

	:param IC:
	:type IC: int
	:rtype: TopoDS_Vertex
") LastVertex;
		TopoDS_Vertex LastVertex (const Standard_Integer IC);
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "	* returns the abscissa of the vertex V on the contour of index IC.

	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: float
") Abscissa;
		Standard_Real Abscissa (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "	* returns the relative abscissa([0.,1.]) of the vertex V on the contour of index IC.

	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: float
") RelativeAbscissa;
		Standard_Real RelativeAbscissa (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("compactdefaultargs") ClosedAndTangent;
		%feature("autodoc", "	* returns true if the contour of index IC is closed an tangent.

	:param IC:
	:type IC: int
	:rtype: bool
") ClosedAndTangent;
		Standard_Boolean ClosedAndTangent (const Standard_Integer IC);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	* returns true if the contour of index IC is closed

	:param IC:
	:type IC: int
	:rtype: bool
") Closed;
		Standard_Boolean Closed (const Standard_Integer IC);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* general calculation of geometry on all edges, topologic reconstruction.

	:rtype: None
") Compute;
		void Compute ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if the computation is success

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* if (Isdone()) makes the result. if (!Isdone())

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Advanced function for the history

	:param EouV:
	:type EouV: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & EouV);
		%feature("compactdefaultargs") NbFaultyContours;
		%feature("autodoc", "	* Returns the number of contours on which the calculation has failed.

	:rtype: int
") NbFaultyContours;
		Standard_Integer NbFaultyContours ();
		%feature("compactdefaultargs") FaultyContour;
		%feature("autodoc", "	* Returns the number of I'th contour on which the calculation has failed.

	:param I:
	:type I: int
	:rtype: int
") FaultyContour;
		Standard_Integer FaultyContour (const Standard_Integer I);
		%feature("compactdefaultargs") NbComputedSurfaces;
		%feature("autodoc", "	* Returns the number of surfaces calculated on the contour IC.

	:param IC:
	:type IC: int
	:rtype: int
") NbComputedSurfaces;
		Standard_Integer NbComputedSurfaces (const Standard_Integer IC);
		%feature("compactdefaultargs") ComputedSurface;
		%feature("autodoc", "	* Returns the IS'th surface calculated on the contour IC.

	:param IC:
	:type IC: int
	:param IS:
	:type IS: int
	:rtype: Handle_Geom_Surface
") ComputedSurface;
		Handle_Geom_Surface ComputedSurface (const Standard_Integer IC,const Standard_Integer IS);
		%feature("compactdefaultargs") NbFaultyVertices;
		%feature("autodoc", "	* Returns the number of vertices on which the calculation has failed.

	:rtype: int
") NbFaultyVertices;
		Standard_Integer NbFaultyVertices ();
		%feature("compactdefaultargs") FaultyVertex;
		%feature("autodoc", "	* Returns the IV'th vertex on which the calculation has failed.

	:param IV:
	:type IV: int
	:rtype: TopoDS_Vertex
") FaultyVertex;
		TopoDS_Vertex FaultyVertex (const Standard_Integer IV);
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* returns True if a partial result has been calculated

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") BadShape;
		%feature("autodoc", "	* if (HasResult()) returns partial result if (!HasResult())

	:rtype: TopoDS_Shape
") BadShape;
		TopoDS_Shape BadShape ();
		%feature("compactdefaultargs") StripeStatus;
		%feature("autodoc", "	* for the stripe IC ,indication on the cause of failure WalkingFailure,TwistedSurface,Error, Ok

	:param IC:
	:type IC: int
	:rtype: ChFiDS_ErrorStatus
") StripeStatus;
		ChFiDS_ErrorStatus StripeStatus (const Standard_Integer IC);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Reset all results of compute and returns the algorythm in the state of the last acquisition to enable modification of contours or areas.

	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "	* Returns the Builder of topologic operations.

	:rtype: Handle_TopOpeBRepBuild_HBuilder
") Builder;
		Handle_TopOpeBRepBuild_HBuilder Builder ();
		%feature("compactdefaultargs") SplitKPart;
		%feature("autodoc", "	* Method, implemented in the inheritants, calculates the elements of construction of the surface (fillet or chamfer).

	:param Data:
	:type Data: Handle_ChFiDS_SurfData &
	:param SetData:
	:type SetData: ChFiDS_SequenceOfSurfData &
	:param Spine:
	:type Spine: Handle_ChFiDS_Spine &
	:param Iedge:
	:type Iedge: int
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param I1:
	:type I1: Handle_Adaptor3d_TopolTool &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param I2:
	:type I2: Handle_Adaptor3d_TopolTool &
	:param Intf:
	:type Intf: bool
	:param Intl:
	:type Intl: bool
	:rtype: bool
") SplitKPart;
		Standard_Boolean SplitKPart (const Handle_ChFiDS_SurfData & Data,ChFiDS_SequenceOfSurfData & SetData,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Iedge,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") PerformTwoCornerbyInter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") PerformTwoCornerbyInter;
		Standard_Boolean PerformTwoCornerbyInter (const Standard_Integer Index);
};


%extend ChFi3d_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFi3d_SearchSing;
class ChFi3d_SearchSing : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") ChFi3d_SearchSing;
		%feature("autodoc", "	:param C1:
	:type C1: Handle_Geom_Curve &
	:param C2:
	:type C2: Handle_Geom_Curve &
	:rtype: None
") ChFi3d_SearchSing;
		 ChFi3d_SearchSing (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the value of the function <F> for the variable <X>. returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend ChFi3d_SearchSing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFi3d_ChBuilder;
class ChFi3d_ChBuilder : public ChFi3d_Builder {
	public:
		%feature("compactdefaultargs") ChFi3d_ChBuilder;
		%feature("autodoc", "	* initializes the Builder with the Shape <S> for the computation of chamfers

	:param S:
	:type S: TopoDS_Shape &
	:param Ta: default value is 1.0e-2
	:type Ta: float
	:rtype: None
") ChFi3d_ChBuilder;
		 ChFi3d_ChBuilder (const TopoDS_Shape & S,const Standard_Real Ta = 1.0e-2);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* initializes a contour with the edge <E> as first (the next are found by propagation ). The two distances (parameters of the chamfer) must be set after. if the edge <E> has more than 2 adjacent faces

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* initializes a new contour with the edge <E> as first (the next are found by propagation ), and the distance <Dis> if the edge <E> has more than 2 adjacent faces

	:param Dis:
	:type Dis: float
	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const Standard_Real Dis,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "	* set the distance <Dis> of the fillet contour of index <IC> in the DS with <Dis> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>

	:param Dis:
	:type Dis: float
	:param IC:
	:type IC: int
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") SetDist;
		void SetDist (const Standard_Real Dis,const Standard_Integer IC,const TopoDS_Face & F);
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", "	* gives the distances <Dis> of the fillet contour of index <IC> in the DS

	:param IC:
	:type IC: int
	:param Dis:
	:type Dis: float &
	:rtype: None
") GetDist;
		void GetDist (const Standard_Integer IC,Standard_Real &OutValue);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* initializes a new contour with the edge <E> as first (the next are found by propagation ), and the distance <Dis1> and <Dis2> if the edge <E> has more than 2 adjacent faces

	:param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const Standard_Real Dis1,const Standard_Real Dis2,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "	* set the distances <Dis1> and <Dis2> of the fillet contour of index <IC> in the DS with <Dis1> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>

	:param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:param IC:
	:type IC: int
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") SetDists;
		void SetDists (const Standard_Real Dis1,const Standard_Real Dis2,const Standard_Integer IC,const TopoDS_Face & F);
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "	* gives the distances <Dis1> and <Dis2> of the fillet contour of index <IC> in the DS

	:param IC:
	:type IC: int
	:param Dis1:
	:type Dis1: float &
	:param Dis2:
	:type Dis2: float &
	:rtype: None
") Dists;
		void Dists (const Standard_Integer IC,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") AddDA;
		%feature("autodoc", "	* initializes a new contour with the edge <E> as first (the next are found by propagation ), and the distance <Dis1> and <Angle> if the edge <E> has more than 2 adjacent faces

	:param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") AddDA;
		void AddDA (const Standard_Real Dis,const Standard_Real Angle,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "	* set the distance <Dis> and <Angle> of the fillet contour of index <IC> in the DS with <Dis> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>

	:param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:param IC:
	:type IC: int
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") SetDistAngle;
		void SetDistAngle (const Standard_Real Dis,const Standard_Real Angle,const Standard_Integer IC,const TopoDS_Face & F);
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "	* gives the distances <Dis> and <Angle> of the fillet contour of index <IC> in the DS

	:param IC:
	:type IC: int
	:param Dis:
	:type Dis: float &
	:param Angle:
	:type Angle: float &
	:param DisOnFace1:
	:type DisOnFace1: bool
	:rtype: None
") GetDistAngle;
		void GetDistAngle (const Standard_Integer IC,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") IsChamfer;
		%feature("autodoc", "	* renvoi la methode des chanfreins utilisee

	:param IC:
	:type IC: int
	:rtype: ChFiDS_ChamfMethod
") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer (const Standard_Integer IC);
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "	* Reset tous rayons du contour IC.

	:param IC:
	:type IC: int
	:rtype: None
") ResetContour;
		void ResetContour (const Standard_Integer IC);
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "	:param IC:
	:type IC: int
	:rtype: None
") Simulate;
		void Simulate (const Standard_Integer IC);
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", "	:param IC:
	:type IC: int
	:rtype: int
") NbSurf;
		Standard_Integer NbSurf (const Standard_Integer IC);
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "	:param IC:
	:type IC: int
	:param IS:
	:type IS: int
	:rtype: Handle_ChFiDS_SecHArray1
") Sect;
		Handle_ChFiDS_SecHArray1 Sect (const Standard_Integer IC,const Standard_Integer IS);
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", "	:param Data:
	:type Data: Handle_ChFiDS_SurfData &
	:param Guide:
	:type Guide: Handle_ChFiDS_HElSpine &
	:param Spine:
	:type Spine: Handle_ChFiDS_Spine &
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: Handle_BRepAdaptor_HSurface &
	:param I1:
	:type I1: Handle_Adaptor3d_TopolTool &
	:param PC1:
	:type PC1: Handle_BRepAdaptor_HCurve2d &
	:param Sref1:
	:type Sref1: Handle_BRepAdaptor_HSurface &
	:param PCref1:
	:type PCref1: Handle_BRepAdaptor_HCurve2d &
	:param Decroch1:
	:type Decroch1: bool
	:param S2:
	:type S2: Handle_BRepAdaptor_HSurface &
	:param I2:
	:type I2: Handle_Adaptor3d_TopolTool &
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
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
	:type Soldep: math_Vector &
	:rtype: void
") SimulSurf;
		virtual void SimulSurf (Handle_ChFiDS_SurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_BRepAdaptor_HCurve2d & PC1,const Handle_BRepAdaptor_HSurface & Sref1,const Handle_BRepAdaptor_HCurve2d & PCref1,Standard_Boolean &OutValue,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const TopAbs_Orientation Or2,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", "	:param Data:
	:type Data: Handle_ChFiDS_SurfData &
	:param Guide:
	:type Guide: Handle_ChFiDS_HElSpine &
	:param Spine:
	:type Spine: Handle_ChFiDS_Spine &
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: Handle_BRepAdaptor_HSurface &
	:param I1:
	:type I1: Handle_Adaptor3d_TopolTool &
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param S2:
	:type S2: Handle_BRepAdaptor_HSurface &
	:param I2:
	:type I2: Handle_Adaptor3d_TopolTool &
	:param PC2:
	:type PC2: Handle_BRepAdaptor_HCurve2d &
	:param Sref2:
	:type Sref2: Handle_BRepAdaptor_HSurface &
	:param PCref2:
	:type PCref2: Handle_BRepAdaptor_HCurve2d &
	:param Decroch2:
	:type Decroch2: bool
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
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
	:type Soldep: math_Vector &
	:rtype: void
") SimulSurf;
		virtual void SimulSurf (Handle_ChFiDS_SurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const TopAbs_Orientation Or1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const Handle_BRepAdaptor_HCurve2d & PC2,const Handle_BRepAdaptor_HSurface & Sref2,const Handle_BRepAdaptor_HCurve2d & PCref2,Standard_Boolean &OutValue,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", "	:param Data:
	:type Data: Handle_ChFiDS_SurfData &
	:param Guide:
	:type Guide: Handle_ChFiDS_HElSpine &
	:param Spine:
	:type Spine: Handle_ChFiDS_Spine &
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: Handle_BRepAdaptor_HSurface &
	:param I1:
	:type I1: Handle_Adaptor3d_TopolTool &
	:param PC1:
	:type PC1: Handle_BRepAdaptor_HCurve2d &
	:param Sref1:
	:type Sref1: Handle_BRepAdaptor_HSurface &
	:param PCref1:
	:type PCref1: Handle_BRepAdaptor_HCurve2d &
	:param Decroch1:
	:type Decroch1: bool
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param S2:
	:type S2: Handle_BRepAdaptor_HSurface &
	:param I2:
	:type I2: Handle_Adaptor3d_TopolTool &
	:param PC2:
	:type PC2: Handle_BRepAdaptor_HCurve2d &
	:param Sref2:
	:type Sref2: Handle_BRepAdaptor_HSurface &
	:param PCref2:
	:type PCref2: Handle_BRepAdaptor_HCurve2d &
	:param Decroch2:
	:type Decroch2: bool
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
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
	:type Soldep: math_Vector &
	:rtype: void
") SimulSurf;
		virtual void SimulSurf (Handle_ChFiDS_SurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_BRepAdaptor_HCurve2d & PC1,const Handle_BRepAdaptor_HSurface & Sref1,const Handle_BRepAdaptor_HCurve2d & PCref1,Standard_Boolean &OutValue,const TopAbs_Orientation Or1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const Handle_BRepAdaptor_HCurve2d & PC2,const Handle_BRepAdaptor_HSurface & Sref2,const Handle_BRepAdaptor_HCurve2d & PCref2,Standard_Boolean &OutValue,const TopAbs_Orientation Or2,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP1,const Standard_Boolean RecRst1,const Standard_Boolean RecP2,const Standard_Boolean RecRst2,const math_Vector & Soldep);
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "	* Methode, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer).

	:param Data:
	:type Data: ChFiDS_SequenceOfSurfData &
	:param Guide:
	:type Guide: Handle_ChFiDS_HElSpine &
	:param Spine:
	:type Spine: Handle_ChFiDS_Spine &
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: Handle_BRepAdaptor_HSurface &
	:param I1:
	:type I1: Handle_Adaptor3d_TopolTool &
	:param S2:
	:type S2: Handle_BRepAdaptor_HSurface &
	:param I2:
	:type I2: Handle_Adaptor3d_TopolTool &
	:param MaxStep:
	:type MaxStep: float
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
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
	:type Soldep: math_Vector &
	:param Intf:
	:type Intf: int &
	:param Intl:
	:type Intl: int &
	:rtype: bool
") PerformSurf;
		virtual Standard_Boolean PerformSurf (ChFiDS_SequenceOfSurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecOnS1,const Standard_Boolean RecOnS2,const math_Vector & Soldep,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "	* Method, implemented in the inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/face.

	:param Data:
	:type Data: ChFiDS_SequenceOfSurfData &
	:param Guide:
	:type Guide: Handle_ChFiDS_HElSpine &
	:param Spine:
	:type Spine: Handle_ChFiDS_Spine &
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: Handle_BRepAdaptor_HSurface &
	:param I1:
	:type I1: Handle_Adaptor3d_TopolTool &
	:param PC1:
	:type PC1: Handle_BRepAdaptor_HCurve2d &
	:param Sref1:
	:type Sref1: Handle_BRepAdaptor_HSurface &
	:param PCref1:
	:type PCref1: Handle_BRepAdaptor_HCurve2d &
	:param Decroch1:
	:type Decroch1: bool
	:param S2:
	:type S2: Handle_BRepAdaptor_HSurface &
	:param I2:
	:type I2: Handle_Adaptor3d_TopolTool &
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param MaxStep:
	:type MaxStep: float
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
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
	:type Soldep: math_Vector &
	:rtype: void
") PerformSurf;
		virtual void PerformSurf (ChFiDS_SequenceOfSurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_BRepAdaptor_HCurve2d & PC1,const Handle_BRepAdaptor_HSurface & Sref1,const Handle_BRepAdaptor_HCurve2d & PCref1,Standard_Boolean &OutValue,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const TopAbs_Orientation Or2,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "	* Method, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/face.

	:param Data:
	:type Data: ChFiDS_SequenceOfSurfData &
	:param Guide:
	:type Guide: Handle_ChFiDS_HElSpine &
	:param Spine:
	:type Spine: Handle_ChFiDS_Spine &
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: Handle_BRepAdaptor_HSurface &
	:param I1:
	:type I1: Handle_Adaptor3d_TopolTool &
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param S2:
	:type S2: Handle_BRepAdaptor_HSurface &
	:param I2:
	:type I2: Handle_Adaptor3d_TopolTool &
	:param PC2:
	:type PC2: Handle_BRepAdaptor_HCurve2d &
	:param Sref2:
	:type Sref2: Handle_BRepAdaptor_HSurface &
	:param PCref2:
	:type PCref2: Handle_BRepAdaptor_HCurve2d &
	:param Decroch2:
	:type Decroch2: bool
	:param MaxStep:
	:type MaxStep: float
	:param Fleche:
	:type Fleche: float
	:param TolGuide:
	:type TolGuide: float
	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
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
	:type Soldep: math_Vector &
	:rtype: void
") PerformSurf;
		virtual void PerformSurf (ChFiDS_SequenceOfSurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const TopAbs_Orientation Or1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const Handle_BRepAdaptor_HCurve2d & PC2,const Handle_BRepAdaptor_HSurface & Sref2,const Handle_BRepAdaptor_HCurve2d & PCref2,Standard_Boolean &OutValue,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP,const Standard_Boolean RecS,const Standard_Boolean RecRst,const math_Vector & Soldep);
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "	* Method, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/edge.

	:param Data:
	:type Data: ChFiDS_SequenceOfSurfData &
	:param Guide:
	:type Guide: Handle_ChFiDS_HElSpine &
	:param Spine:
	:type Spine: Handle_ChFiDS_Spine &
	:param Choix:
	:type Choix: int
	:param S1:
	:type S1: Handle_BRepAdaptor_HSurface &
	:param I1:
	:type I1: Handle_Adaptor3d_TopolTool &
	:param PC1:
	:type PC1: Handle_BRepAdaptor_HCurve2d &
	:param Sref1:
	:type Sref1: Handle_BRepAdaptor_HSurface &
	:param PCref1:
	:type PCref1: Handle_BRepAdaptor_HCurve2d &
	:param Decroch1:
	:type Decroch1: bool
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param S2:
	:type S2: Handle_BRepAdaptor_HSurface &
	:param I2:
	:type I2: Handle_Adaptor3d_TopolTool &
	:param PC2:
	:type PC2: Handle_BRepAdaptor_HCurve2d &
	:param Sref2:
	:type Sref2: Handle_BRepAdaptor_HSurface &
	:param PCref2:
	:type PCref2: Handle_BRepAdaptor_HCurve2d &
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
	:type First: float &
	:param Last:
	:type Last: float &
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
	:type Soldep: math_Vector &
	:rtype: void
") PerformSurf;
		virtual void PerformSurf (ChFiDS_SequenceOfSurfData & Data,const Handle_ChFiDS_HElSpine & Guide,const Handle_ChFiDS_Spine & Spine,const Standard_Integer Choix,const Handle_BRepAdaptor_HSurface & S1,const Handle_Adaptor3d_TopolTool & I1,const Handle_BRepAdaptor_HCurve2d & PC1,const Handle_BRepAdaptor_HSurface & Sref1,const Handle_BRepAdaptor_HCurve2d & PCref1,Standard_Boolean &OutValue,const TopAbs_Orientation Or1,const Handle_BRepAdaptor_HSurface & S2,const Handle_Adaptor3d_TopolTool & I2,const Handle_BRepAdaptor_HCurve2d & PC2,const Handle_BRepAdaptor_HSurface & Sref2,const Handle_BRepAdaptor_HCurve2d & PCref2,Standard_Boolean &OutValue,const TopAbs_Orientation Or2,const Standard_Real MaxStep,const Standard_Real Fleche,const Standard_Real TolGuide,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean Inside,const Standard_Boolean Appro,const Standard_Boolean Forward,const Standard_Boolean RecP1,const Standard_Boolean RecRst1,const Standard_Boolean RecP2,const Standard_Boolean RecRst2,const math_Vector & Soldep);
		%feature("compactdefaultargs") FindChoiceDistAngle;
		%feature("autodoc", "	:param Choice:
	:type Choice: int
	:param DisOnF1:
	:type DisOnF1: bool
	:rtype: int
") FindChoiceDistAngle;
		Standard_Integer FindChoiceDistAngle (const Standard_Integer Choice,const Standard_Boolean DisOnF1);
};


%extend ChFi3d_ChBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFi3d_FilBuilder;
class ChFi3d_FilBuilder : public ChFi3d_Builder {
	public:
		%feature("compactdefaultargs") ChFi3d_FilBuilder;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param FShape: default value is ChFi3d_Rational
	:type FShape: ChFi3d_FilletShape
	:param Ta: default value is 1.0e-2
	:type Ta: float
	:rtype: None
") ChFi3d_FilBuilder;
		 ChFi3d_FilBuilder (const TopoDS_Shape & S,const ChFi3d_FilletShape FShape = ChFi3d_Rational,const Standard_Real Ta = 1.0e-2);
		%feature("compactdefaultargs") SetFilletShape;
		%feature("autodoc", "	* Sets the type of fillet surface.

	:param FShape:
	:type FShape: ChFi3d_FilletShape
	:rtype: None
") SetFilletShape;
		void SetFilletShape (const ChFi3d_FilletShape FShape);
		%feature("compactdefaultargs") GetFilletShape;
		%feature("autodoc", "	* Returns the type of fillet surface.

	:rtype: ChFi3d_FilletShape
") GetFilletShape;
		ChFi3d_FilletShape GetFilletShape ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* initialisation of a contour with the first edge (the following are found by propagation). Attention, you need to start with SetRadius.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* initialisation of the constant vector the corresponding 1st edge.

	:param Radius:
	:type Radius: float
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Add;
		void Add (const Standard_Real Radius,const TopoDS_Edge & E);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Set the radius of the contour of index IC.

	:param C:
	:type C: Handle_Law_Function &
	:param IC:
	:type IC: int
	:param IinC:
	:type IinC: int
	:rtype: None
") SetRadius;
		void SetRadius (const Handle_Law_Function & C,const Standard_Integer IC,const Standard_Integer IinC);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Returns true the contour is flaged as edge constant.

	:param IC:
	:type IC: int
	:rtype: bool
") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IC);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* Returns the vector if the contour is flagged as edge constant.

	:param IC:
	:type IC: int
	:rtype: float
") Radius;
		Standard_Real Radius (const Standard_Integer IC);
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "	* Reset all vectors of contour IC.

	:param IC:
	:type IC: int
	:rtype: None
") ResetContour;
		void ResetContour (const Standard_Integer IC);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Set a constant on edge E of the contour of index IC. Since then E is flagged as constant.

	:param Radius:
	:type Radius: float
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("compactdefaultargs") UnSet;
		%feature("autodoc", "	* Extracts the flag constant and the vector of edge E.

	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") UnSet;
		void UnSet (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Set a vector on vertex V of the contour of index IC.

	:param Radius:
	:type Radius: float
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("compactdefaultargs") UnSet;
		%feature("autodoc", "	* Extracts the vector of the vertex V.

	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") UnSet;
		void UnSet (const Standard_Integer IC,const TopoDS_Vertex & V);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Set a vertex on the point of parametre U in the edge IinC of the contour of index IC

	:param UandR:
	:type UandR: gp_XY
	:param IC:
	:type IC: int
	:param IinC:
	:type IinC: int
	:rtype: None
") SetRadius;
		void SetRadius (const gp_XY & UandR,const Standard_Integer IC,const Standard_Integer IinC);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Returns true E is flagged as edge constant.

	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* Returns the vector if E is flagged as edge constant.

	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge &
	:rtype: float
") Radius;
		Standard_Real Radius (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "	* Returns in First and Last les extremities of the part of variable vector framing E, returns False if E is flagged as edge constant.

	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge &
	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: bool
") GetBounds;
		Standard_Boolean GetBounds (const Standard_Integer IC,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetLaw;
		%feature("autodoc", "	* Returns the rule of elementary evolution of the part to variable vector framing E, returns a rule zero if E is flagged as edge constant.

	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge &
	:rtype: Handle_Law_Function
") GetLaw;
		Handle_Law_Function GetLaw (const Standard_Integer IC,const TopoDS_Edge & E);
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "	* Sets the rule of elementary evolution of the part to variable vector framing E.

	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge &
	:param L:
	:type L: Handle_Law_Function &
	:rtype: None
") SetLaw;
		void SetLaw (const Standard_Integer IC,const TopoDS_Edge & E,const Handle_Law_Function & L);
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "	:param IC:
	:type IC: int
	:rtype: None
") Simulate;
		void Simulate (const Standard_Integer IC);
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", "	:param IC:
	:type IC: int
	:rtype: int
") NbSurf;
		Standard_Integer NbSurf (const Standard_Integer IC);
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "	:param IC:
	:type IC: int
	:param IS:
	:type IS: int
	:rtype: Handle_ChFiDS_SecHArray1
") Sect;
		Handle_ChFiDS_SecHArray1 Sect (const Standard_Integer IC,const Standard_Integer IS);
};


%extend ChFi3d_FilBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
