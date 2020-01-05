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
%define CHFIDSDOCSTRING
"ChFiDS module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_chfids.html"
%enddef
%module (package="OCC.Core", docstring=CHFIDSDOCSTRING) ChFiDS


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
#include<ChFiDS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Geom2d_module.hxx>
#include<TopTools_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Law_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TopoDS.i
%import TopAbs.i
%import Adaptor3d.i
%import Geom.i
%import GeomAbs.i
%import TColStd.i
%import Geom2d.i
%import TopTools.i
%import BRepAdaptor.i
%import Law.i
/* public enums */
enum ChFiDS_State {
	ChFiDS_OnSame = 0,
	ChFiDS_OnDiff = 1,
	ChFiDS_AllSame = 2,
	ChFiDS_BreakPoint = 3,
	ChFiDS_FreeBoundary = 4,
	ChFiDS_Closed = 5,
	ChFiDS_Tangent = 6,
};

enum ChFiDS_ChamfMethod {
	ChFiDS_Sym = 0,
	ChFiDS_TwoDist = 1,
	ChFiDS_DistAngle = 2,
};

enum ChFiDS_ChamfMode {
	ChFiDS_ClassicChamfer = 0,
	ChFiDS_ConstThroatChamfer = 1,
	ChFiDS_ConstThroatWithPenetrationChamfer = 2,
};

enum ChFiDS_ErrorStatus {
	ChFiDS_Ok = 0,
	ChFiDS_Error = 1,
	ChFiDS_WalkingFailure = 2,
	ChFiDS_StartsolFailure = 3,
	ChFiDS_TwistedSurface = 4,
};

/* end public enums declaration */

/* handles */
%wrap_handle(ChFiDS_HElSpine)
%wrap_handle(ChFiDS_Spine)
%wrap_handle(ChFiDS_Stripe)
%wrap_handle(ChFiDS_SurfData)
%wrap_handle(ChFiDS_ChamfSpine)
%wrap_handle(ChFiDS_FilSpine)
%wrap_handle(ChFiDS_SecHArray1)
%wrap_handle(ChFiDS_HData)
/* end handles declaration */

/* templates */
%template(ChFiDS_SequenceOfSpine) NCollection_Sequence <opencascade::handle <ChFiDS_Spine>>;
%template(ChFiDS_SecArray1) NCollection_Array1 <ChFiDS_CircSection>;

%extend NCollection_Array1 <ChFiDS_CircSection> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(ChFiDS_SequenceOfSurfData) NCollection_Sequence <opencascade::handle <ChFiDS_SurfData>>;
%template(ChFiDS_StripeArray1) NCollection_Array1 <opencascade::handle <ChFiDS_Stripe>>;

%extend NCollection_Array1 <opencascade::handle <ChFiDS_Stripe>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(ChFiDS_ListOfHElSpine) NCollection_List <opencascade::handle <ChFiDS_HElSpine>>;
%template(ChFiDS_ListIteratorOfListOfHElSpine) NCollection_TListIterator<opencascade::handle<ChFiDS_HElSpine>>;
%template(ChFiDS_IndexedDataMapOfVertexListOfStripe) NCollection_IndexedDataMap <TopoDS_Vertex , ChFiDS_ListOfStripe , TopTools_ShapeMapHasher>;
%template(ChFiDS_ListOfStripe) NCollection_List <opencascade::handle <ChFiDS_Stripe>>;
%template(ChFiDS_ListIteratorOfListOfStripe) NCollection_TListIterator<opencascade::handle<ChFiDS_Stripe>>;
%template(ChFiDS_Regularities) NCollection_List <ChFiDS_Regul>;
%template(ChFiDS_ListIteratorOfRegularities) NCollection_TListIterator<ChFiDS_Regul>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <ChFiDS_Spine>> ChFiDS_SequenceOfSpine;
typedef NCollection_Array1 <ChFiDS_CircSection> ChFiDS_SecArray1;
typedef NCollection_Sequence <opencascade::handle <ChFiDS_SurfData>> ChFiDS_SequenceOfSurfData;
typedef NCollection_Array1 <opencascade::handle <ChFiDS_Stripe>> ChFiDS_StripeArray1;
typedef NCollection_List <opencascade::handle <ChFiDS_HElSpine>> ChFiDS_ListOfHElSpine;
typedef NCollection_List <opencascade::handle <ChFiDS_HElSpine>>::Iterator ChFiDS_ListIteratorOfListOfHElSpine;
typedef NCollection_IndexedDataMap <TopoDS_Vertex , ChFiDS_ListOfStripe , TopTools_ShapeMapHasher> ChFiDS_IndexedDataMapOfVertexListOfStripe;
typedef NCollection_List <opencascade::handle <ChFiDS_Stripe>> ChFiDS_ListOfStripe;
typedef NCollection_List <opencascade::handle <ChFiDS_Stripe>>::Iterator ChFiDS_ListIteratorOfListOfStripe;
typedef NCollection_List <ChFiDS_Regul> ChFiDS_Regularities;
typedef NCollection_List <ChFiDS_Regul>::Iterator ChFiDS_ListIteratorOfRegularities;
/* end typedefs declaration */

/***************************
* class ChFiDS_CircSection *
***************************/
class ChFiDS_CircSection {
	public:
		/****************** ChFiDS_CircSection ******************/
		%feature("compactdefaultargs") ChFiDS_CircSection;
		%feature("autodoc", ":rtype: None") ChFiDS_CircSection;
		 ChFiDS_CircSection ();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", ":param C:
	:type C: gp_Circ
	:param F:
	:type F: float
	:param L:
	:type L: float
	:rtype: None") Get;
		void Get (gp_Circ & C,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:param F:
	:type F: float
	:param L:
	:type L: float
	:rtype: None") Get;
		void Get (gp_Lin & C,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param C:
	:type C: gp_Circ
	:param F:
	:type F: float
	:param L:
	:type L: float
	:rtype: None") Set;
		void Set (const gp_Circ & C,const Standard_Real F,const Standard_Real L);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:param F:
	:type F: float
	:param L:
	:type L: float
	:rtype: None") Set;
		void Set (const gp_Lin & C,const Standard_Real F,const Standard_Real L);

};


%extend ChFiDS_CircSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ChFiDS_CommonPoint *
***************************/
class ChFiDS_CommonPoint {
	public:
		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "* Returns the arc of restriction containing the vertex.
	:rtype: TopoDS_Edge") Arc;
		const TopoDS_Edge  Arc ();

		/****************** ChFiDS_CommonPoint ******************/
		%feature("compactdefaultargs") ChFiDS_CommonPoint;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ChFiDS_CommonPoint;
		 ChFiDS_CommonPoint ();

		/****************** HasVector ******************/
		%feature("compactdefaultargs") HasVector;
		%feature("autodoc", "* Returns True if the output vector is stored.
	:rtype: bool") HasVector;
		Standard_Boolean HasVector ();

		/****************** IsOnArc ******************/
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "* Returns True if the point is a on an edge of the initial restriction facet of the surface.
	:rtype: bool") IsOnArc;
		Standard_Boolean IsOnArc ();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Returns True if the point is a vertex on the initial restriction facet of the surface.
	:rtype: bool") IsVertex;
		Standard_Boolean IsVertex ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameter the paramter on the spine
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** ParameterOnArc ******************/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "* Returns the parameter of the point on the arc returned by the method Arc().
	:rtype: float") ParameterOnArc;
		Standard_Real ParameterOnArc ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the 3d point
	:rtype: gp_Pnt") Point;
		const gp_Pnt  Point ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* default value for all fields
	:rtype: None") Reset;
		void Reset ();

		/****************** SetArc ******************/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "* Sets the values of a point which is on the arc A, at parameter Param.
	:param Tol:
	:type Tol: float
	:param A:
	:type A: TopoDS_Edge
	:param Param:
	:type Param: float
	:param TArc:
	:type TArc: TopAbs_Orientation
	:rtype: None") SetArc;
		void SetArc (const Standard_Real Tol,const TopoDS_Edge & A,const Standard_Real Param,const TopAbs_Orientation TArc);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "* Sets the value of the parameter on the spine
	:param Param:
	:type Param: float
	:rtype: None") SetParameter;
		void SetParameter (const Standard_Real Param);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "* Set the 3d point for a commonpoint that is not a vertex or on an arc.
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None") SetPoint;
		void SetPoint (const gp_Pnt & thePoint);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* This method set the fuzziness on the point.
	:param Tol:
	:type Tol: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol);

		/****************** SetVector ******************/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "* Set the output 3d vector
	:param theVector:
	:type theVector: gp_Vec
	:rtype: None") SetVector;
		void SetVector (const gp_Vec & theVector);

		/****************** SetVertex ******************/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "* Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface.
	:param theVertex:
	:type theVertex: TopoDS_Vertex
	:rtype: None") SetVertex;
		void SetVertex (const TopoDS_Vertex & theVertex);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* This method returns the fuzziness on the point.
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** TransitionOnArc ******************/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "* Returns the transition of the point on the arc returned by Arc().
	:rtype: TopAbs_Orientation") TransitionOnArc;
		TopAbs_Orientation TransitionOnArc ();

		/****************** Vector ******************/
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "* Returns the output 3d vector
	:rtype: gp_Vec") Vector;
		const gp_Vec  Vector ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* Returns the information about the point when it is on the domain of the first patch, i-e when the function IsVertex returns True. Otherwise, an exception is raised.
	:rtype: TopoDS_Vertex") Vertex;
		const TopoDS_Vertex  Vertex ();

};


%extend ChFiDS_CommonPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class ChFiDS_ElSpine *
***********************/
class ChFiDS_ElSpine : public Adaptor3d_Curve {
	public:
		/****************** AddVertexWithTangent ******************/
		%feature("compactdefaultargs") AddVertexWithTangent;
		%feature("autodoc", ":param anAx1:
	:type anAx1: gp_Ax1
	:rtype: None") AddVertexWithTangent;
		void AddVertexWithTangent (const gp_Ax1 & anAx1);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier ();

		/****************** ChFiDS_ElSpine ******************/
		%feature("compactdefaultargs") ChFiDS_ElSpine;
		%feature("autodoc", ":rtype: None") ChFiDS_ElSpine;
		 ChFiDS_ElSpine ();

		/****************** ChangeNext ******************/
		%feature("compactdefaultargs") ChangeNext;
		%feature("autodoc", ":rtype: opencascade::handle<ChFiDS_SurfData>") ChangeNext;
		opencascade::handle<ChFiDS_SurfData> & ChangeNext ();

		/****************** ChangePrevious ******************/
		%feature("compactdefaultargs") ChangePrevious;
		%feature("autodoc", ":rtype: opencascade::handle<ChFiDS_SurfData>") ChangePrevious;
		opencascade::handle<ChFiDS_SurfData> & ChangePrevious ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ") Circle;
		gp_Circ Circle ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") D0;
		virtual void D0 (const Standard_Real AbsC,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void") D1;
		virtual void D1 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void") D2;
		virtual void D2 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", ":param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void") D3;
		virtual void D3 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":rtype: gp_Elips") Ellipse;
		gp_Elips Ellipse ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		virtual Standard_Real FirstParameter ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":param P:
	:type P: float
	:rtype: None") FirstParameter;
		void FirstParameter (const Standard_Real P);

		/****************** FirstPointAndTgt ******************/
		%feature("compactdefaultargs") FirstPointAndTgt;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None") FirstPointAndTgt;
		void FirstPointAndTgt (gp_Pnt & P,gp_Vec & T);

		/****************** GetSavedFirstParameter ******************/
		%feature("compactdefaultargs") GetSavedFirstParameter;
		%feature("autodoc", ":rtype: float") GetSavedFirstParameter;
		Standard_Real GetSavedFirstParameter ();

		/****************** GetSavedLastParameter ******************/
		%feature("compactdefaultargs") GetSavedLastParameter;
		%feature("autodoc", ":rtype: float") GetSavedLastParameter;
		Standard_Real GetSavedLastParameter ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":rtype: GeomAbs_CurveType") GetType;
		virtual GeomAbs_CurveType GetType ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr") Hyperbola;
		gp_Hypr Hyperbola ();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", ":param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		virtual Standard_Boolean IsPeriodic ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		virtual Standard_Real LastParameter ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":param P:
	:type P: float
	:rtype: None") LastParameter;
		void LastParameter (const Standard_Real P);

		/****************** LastPointAndTgt ******************/
		%feature("compactdefaultargs") LastPointAndTgt;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None") LastPointAndTgt;
		void LastPointAndTgt (gp_Pnt & P,gp_Vec & T);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin") Line;
		gp_Lin Line ();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", ":param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** NbVertices ******************/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", ":rtype: int") NbVertices;
		Standard_Integer NbVertices ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: opencascade::handle<ChFiDS_SurfData>") Next;
		const opencascade::handle<ChFiDS_SurfData> & Next ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab") Parabola;
		gp_Parab Parabola ();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		virtual Standard_Real Period ();

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", ":rtype: opencascade::handle<ChFiDS_SurfData>") Previous;
		const opencascade::handle<ChFiDS_SurfData> & Previous ();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", ":param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		virtual Standard_Real Resolution (const Standard_Real R3d);

		/****************** SaveFirstParameter ******************/
		%feature("compactdefaultargs") SaveFirstParameter;
		%feature("autodoc", ":rtype: None") SaveFirstParameter;
		void SaveFirstParameter ();

		/****************** SaveLastParameter ******************/
		%feature("compactdefaultargs") SaveLastParameter;
		%feature("autodoc", ":rtype: None") SaveLastParameter;
		void SaveLastParameter ();

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:rtype: None") SetCurve;
		void SetCurve (const opencascade::handle<Geom_Curve> & C);

		/****************** SetFirstPointAndTgt ******************/
		%feature("compactdefaultargs") SetFirstPointAndTgt;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None") SetFirstPointAndTgt;
		void SetFirstPointAndTgt (const gp_Pnt & P,const gp_Vec & T);

		/****************** SetLastPointAndTgt ******************/
		%feature("compactdefaultargs") SetLastPointAndTgt;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None") SetLastPointAndTgt;
		void SetLastPointAndTgt (const gp_Pnt & P,const gp_Vec & T);

		/****************** SetOrigin ******************/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", ":param O:
	:type O: float
	:rtype: None") SetOrigin;
		void SetOrigin (const Standard_Real O);

		/****************** SetPeriodic ******************/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", ":param I:
	:type I: bool
	:rtype: None") SetPeriodic;
		void SetPeriodic (const Standard_Boolean I);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion.
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HCurve>") Trim;
		virtual opencascade::handle<Adaptor3d_HCurve> Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param AbsC:
	:type AbsC: float
	:rtype: gp_Pnt") Value;
		virtual gp_Pnt Value (const Standard_Real AbsC);

		/****************** VertexWithTangent ******************/
		%feature("compactdefaultargs") VertexWithTangent;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: gp_Ax1") VertexWithTangent;
		const gp_Ax1  VertexWithTangent (const Standard_Integer Index);

};


%extend ChFiDS_ElSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class ChFiDS_FaceInterference *
********************************/
class ChFiDS_FaceInterference {
	public:
		/****************** ChFiDS_FaceInterference ******************/
		%feature("compactdefaultargs") ChFiDS_FaceInterference;
		%feature("autodoc", ":rtype: None") ChFiDS_FaceInterference;
		 ChFiDS_FaceInterference ();

		/****************** ChangePCurveOnFace ******************/
		%feature("compactdefaultargs") ChangePCurveOnFace;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") ChangePCurveOnFace;
		opencascade::handle<Geom2d_Curve> & ChangePCurveOnFace ();

		/****************** ChangePCurveOnSurf ******************/
		%feature("compactdefaultargs") ChangePCurveOnSurf;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") ChangePCurveOnSurf;
		opencascade::handle<Geom2d_Curve> & ChangePCurveOnSurf ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** LineIndex ******************/
		%feature("compactdefaultargs") LineIndex;
		%feature("autodoc", ":rtype: int") LineIndex;
		Standard_Integer LineIndex ();

		/****************** PCurveOnFace ******************/
		%feature("compactdefaultargs") PCurveOnFace;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") PCurveOnFace;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace ();

		/****************** PCurveOnSurf ******************/
		%feature("compactdefaultargs") PCurveOnSurf;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") PCurveOnSurf;
		const opencascade::handle<Geom2d_Curve> & PCurveOnSurf ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param IsFirst:
	:type IsFirst: bool
	:rtype: float") Parameter;
		Standard_Real Parameter (const Standard_Boolean IsFirst);

		/****************** SetFirstParameter ******************/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", ":param U1:
	:type U1: float
	:rtype: None") SetFirstParameter;
		void SetFirstParameter (const Standard_Real U1);

		/****************** SetInterference ******************/
		%feature("compactdefaultargs") SetInterference;
		%feature("autodoc", ":param LineIndex:
	:type LineIndex: int
	:param Trans:
	:type Trans: TopAbs_Orientation
	:param PCurv1:
	:type PCurv1: Geom2d_Curve
	:param PCurv2:
	:type PCurv2: Geom2d_Curve
	:rtype: None") SetInterference;
		void SetInterference (const Standard_Integer LineIndex,const TopAbs_Orientation Trans,const opencascade::handle<Geom2d_Curve> & PCurv1,const opencascade::handle<Geom2d_Curve> & PCurv2);

		/****************** SetLastParameter ******************/
		%feature("compactdefaultargs") SetLastParameter;
		%feature("autodoc", ":param U1:
	:type U1: float
	:rtype: None") SetLastParameter;
		void SetLastParameter (const Standard_Real U1);

		/****************** SetLineIndex ******************/
		%feature("compactdefaultargs") SetLineIndex;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") SetLineIndex;
		void SetLineIndex (const Standard_Integer I);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", ":param U1:
	:type U1: float
	:param IsFirst:
	:type IsFirst: bool
	:rtype: None") SetParameter;
		void SetParameter (const Standard_Real U1,const Standard_Boolean IsFirst);

		/****************** SetTransition ******************/
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", ":param Trans:
	:type Trans: TopAbs_Orientation
	:rtype: None") SetTransition;
		void SetTransition (const TopAbs_Orientation Trans);

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Transition;
		TopAbs_Orientation Transition ();

};


%extend ChFiDS_FaceInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class ChFiDS_HElSpine *
************************/
class ChFiDS_HElSpine : public Adaptor3d_HCurve {
	public:
		/****************** ChFiDS_HElSpine ******************/
		%feature("compactdefaultargs") ChFiDS_HElSpine;
		%feature("autodoc", "* Creates an empty GenHCurve.
	:rtype: None") ChFiDS_HElSpine;
		 ChFiDS_HElSpine ();

		/****************** ChFiDS_HElSpine ******************/
		%feature("compactdefaultargs") ChFiDS_HElSpine;
		%feature("autodoc", "* Creates a GenHCurve from a Curve
	:param C:
	:type C: ChFiDS_ElSpine
	:rtype: None") ChFiDS_HElSpine;
		 ChFiDS_HElSpine (const ChFiDS_ElSpine & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: ChFiDS_ElSpine") ChangeCurve;
		ChFiDS_ElSpine & ChangeCurve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") Curve;
		const Adaptor3d_Curve & Curve ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") GetCurve;
		Adaptor3d_Curve & GetCurve ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHCurve.
	:param C:
	:type C: ChFiDS_ElSpine
	:rtype: None") Set;
		void Set (const ChFiDS_ElSpine & C);

};


%make_alias(ChFiDS_HElSpine)

%extend ChFiDS_HElSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class ChFiDS_Map *
*******************/
class ChFiDS_Map {
	public:
		/****************** ChFiDS_Map ******************/
		%feature("compactdefaultargs") ChFiDS_Map;
		%feature("autodoc", "* Create an empty Map
	:rtype: None") ChFiDS_Map;
		 ChFiDS_Map ();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & S);

		/****************** Fill ******************/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "* Fills the map with the subshapes of type T1 as keys and the list of ancestors of type T2 as items.
	:param S:
	:type S: TopoDS_Shape
	:param T1:
	:type T1: TopAbs_ShapeEnum
	:param T2:
	:type T2: TopAbs_ShapeEnum
	:rtype: None") Fill;
		void Fill (const TopoDS_Shape & S,const TopAbs_ShapeEnum T1,const TopAbs_ShapeEnum T2);

		/****************** FindFromIndex ******************/
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopTools_ListOfShape") FindFromIndex;
		const TopTools_ListOfShape & FindFromIndex (const Standard_Integer I);

		/****************** FindFromKey ******************/
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") FindFromKey;
		const TopTools_ListOfShape & FindFromKey (const TopoDS_Shape & S);

};


%extend ChFiDS_Map {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class ChFiDS_Regul *
*********************/
class ChFiDS_Regul {
	public:
		/****************** ChFiDS_Regul ******************/
		%feature("compactdefaultargs") ChFiDS_Regul;
		%feature("autodoc", ":rtype: None") ChFiDS_Regul;
		 ChFiDS_Regul ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":rtype: int") Curve;
		Standard_Integer Curve ();

		/****************** IsSurface1 ******************/
		%feature("compactdefaultargs") IsSurface1;
		%feature("autodoc", ":rtype: bool") IsSurface1;
		Standard_Boolean IsSurface1 ();

		/****************** IsSurface2 ******************/
		%feature("compactdefaultargs") IsSurface2;
		%feature("autodoc", ":rtype: bool") IsSurface2;
		Standard_Boolean IsSurface2 ();

		/****************** S1 ******************/
		%feature("compactdefaultargs") S1;
		%feature("autodoc", ":rtype: int") S1;
		Standard_Integer S1 ();

		/****************** S2 ******************/
		%feature("compactdefaultargs") S2;
		%feature("autodoc", ":rtype: int") S2;
		Standard_Integer S2 ();

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: None") SetCurve;
		void SetCurve (const Standard_Integer IC);

		/****************** SetS1 ******************/
		%feature("compactdefaultargs") SetS1;
		%feature("autodoc", ":param IS1:
	:type IS1: int
	:param IsFace: default value is Standard_True
	:type IsFace: bool
	:rtype: None") SetS1;
		void SetS1 (const Standard_Integer IS1,const Standard_Boolean IsFace = Standard_True);

		/****************** SetS2 ******************/
		%feature("compactdefaultargs") SetS2;
		%feature("autodoc", ":param IS2:
	:type IS2: int
	:param IsFace: default value is Standard_True
	:type IsFace: bool
	:rtype: None") SetS2;
		void SetS2 (const Standard_Integer IS2,const Standard_Boolean IsFace = Standard_True);

};


%extend ChFiDS_Regul {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class ChFiDS_Spine *
*********************/
class ChFiDS_Spine : public Standard_Transient {
	public:
		/****************** Absc ******************/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", ":param U:
	:type U: float
	:rtype: float") Absc;
		Standard_Real Absc (const Standard_Real U);

		/****************** Absc ******************/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", ":param U:
	:type U: float
	:param I:
	:type I: int
	:rtype: float") Absc;
		Standard_Real Absc (const Standard_Real U,const Standard_Integer I);

		/****************** Absc ******************/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:rtype: float") Absc;
		Standard_Real Absc (const TopoDS_Vertex & V);

		/****************** AppendElSpine ******************/
		%feature("compactdefaultargs") AppendElSpine;
		%feature("autodoc", ":param Els:
	:type Els: ChFiDS_HElSpine
	:rtype: void") AppendElSpine;
		virtual void AppendElSpine (const opencascade::handle<ChFiDS_HElSpine> & Els);

		/****************** AppendOffsetElSpine ******************/
		%feature("compactdefaultargs") AppendOffsetElSpine;
		%feature("autodoc", ":param Els:
	:type Els: ChFiDS_HElSpine
	:rtype: void") AppendOffsetElSpine;
		virtual void AppendOffsetElSpine (const opencascade::handle<ChFiDS_HElSpine> & Els);

		/****************** ChFiDS_Spine ******************/
		%feature("compactdefaultargs") ChFiDS_Spine;
		%feature("autodoc", ":rtype: None") ChFiDS_Spine;
		 ChFiDS_Spine ();

		/****************** ChFiDS_Spine ******************/
		%feature("compactdefaultargs") ChFiDS_Spine;
		%feature("autodoc", ":param Tol:
	:type Tol: float
	:rtype: None") ChFiDS_Spine;
		 ChFiDS_Spine (const Standard_Real Tol);

		/****************** ChangeElSpines ******************/
		%feature("compactdefaultargs") ChangeElSpines;
		%feature("autodoc", ":rtype: ChFiDS_ListOfHElSpine") ChangeElSpines;
		ChFiDS_ListOfHElSpine & ChangeElSpines ();

		/****************** ChangeOffsetElSpines ******************/
		%feature("compactdefaultargs") ChangeOffsetElSpines;
		%feature("autodoc", ":rtype: ChFiDS_ListOfHElSpine") ChangeOffsetElSpines;
		ChFiDS_ListOfHElSpine & ChangeOffsetElSpines ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ") Circle;
		gp_Circ Circle ();

		/****************** CurrentElementarySpine ******************/
		%feature("compactdefaultargs") CurrentElementarySpine;
		%feature("autodoc", "* sets the current curve and returns it
	:param Index:
	:type Index: int
	:rtype: BRepAdaptor_Curve") CurrentElementarySpine;
		const BRepAdaptor_Curve & CurrentElementarySpine (const Standard_Integer Index);

		/****************** CurrentIndexOfElementarySpine ******************/
		%feature("compactdefaultargs") CurrentIndexOfElementarySpine;
		%feature("autodoc", ":rtype: int") CurrentIndexOfElementarySpine;
		Standard_Integer CurrentIndexOfElementarySpine ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real AbsC,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") D2;
		void D2 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** Edges ******************/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopoDS_Edge") Edges;
		const TopoDS_Edge  Edges (const Standard_Integer I);

		/****************** ElSpine ******************/
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", ":param IE:
	:type IE: int
	:rtype: opencascade::handle<ChFiDS_HElSpine>") ElSpine;
		opencascade::handle<ChFiDS_HElSpine> ElSpine (const Standard_Integer IE);

		/****************** ElSpine ******************/
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: opencascade::handle<ChFiDS_HElSpine>") ElSpine;
		opencascade::handle<ChFiDS_HElSpine> ElSpine (const TopoDS_Edge & E);

		/****************** ElSpine ******************/
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", ":param W:
	:type W: float
	:rtype: opencascade::handle<ChFiDS_HElSpine>") ElSpine;
		opencascade::handle<ChFiDS_HElSpine> ElSpine (const Standard_Real W);

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", ":rtype: ChFiDS_ErrorStatus") ErrorStatus;
		ChFiDS_ErrorStatus ErrorStatus ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* gives the total length of all arcs before the number IndexSp
	:param IndexSpine:
	:type IndexSpine: int
	:rtype: float") FirstParameter;
		Standard_Real FirstParameter (const Standard_Integer IndexSpine);

		/****************** FirstStatus ******************/
		%feature("compactdefaultargs") FirstStatus;
		%feature("autodoc", "* returns if the set of edges starts on a free boundary or if the first vertex is a breakpoint or if the set is closed
	:rtype: ChFiDS_State") FirstStatus;
		ChFiDS_State FirstStatus ();

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") FirstVertex;
		TopoDS_Vertex FirstVertex ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** HasFirstTgt ******************/
		%feature("compactdefaultargs") HasFirstTgt;
		%feature("autodoc", ":rtype: bool") HasFirstTgt;
		Standard_Boolean HasFirstTgt ();

		/****************** HasLastTgt ******************/
		%feature("compactdefaultargs") HasLastTgt;
		%feature("autodoc", ":rtype: bool") HasLastTgt;
		Standard_Boolean HasLastTgt ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":param W:
	:type W: float
	:param Forward: default value is Standard_True
	:type Forward: bool
	:rtype: int") Index;
		Standard_Integer Index (const Standard_Real W,const Standard_Boolean Forward = Standard_True);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: int") Index;
		Standard_Integer Index (const TopoDS_Edge & E);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** IsTangencyExtremity ******************/
		%feature("compactdefaultargs") IsTangencyExtremity;
		%feature("autodoc", "* returns if the set of edges starts (or end) on Tangency point.
	:param IsFirst:
	:type IsFirst: bool
	:rtype: bool") IsTangencyExtremity;
		Standard_Boolean IsTangencyExtremity (const Standard_Boolean IsFirst);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* gives the total length till the ark with number IndexSpine (inclus)
	:param IndexSpine:
	:type IndexSpine: int
	:rtype: float") LastParameter;
		Standard_Real LastParameter (const Standard_Integer IndexSpine);

		/****************** LastStatus ******************/
		%feature("compactdefaultargs") LastStatus;
		%feature("autodoc", "* returns the state at the end of the set
	:rtype: ChFiDS_State") LastStatus;
		ChFiDS_State LastStatus ();

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") LastVertex;
		TopoDS_Vertex LastVertex ();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* gives the length of ark with number IndexSp
	:param IndexSpine:
	:type IndexSpine: int
	:rtype: float") Length;
		Standard_Real Length (const Standard_Integer IndexSpine);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin") Line;
		gp_Lin Line ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* prepare the guideline depending on the edges that are elementary arks (take parameters from a single curvilinear abscissa); to be able to call methods on the geometry (first,last,value,d1,d2) it is necessary to start with preparation otherwise an exception will be raised
	:rtype: None") Load;
		void Load ();

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "* Return the mode of chamfers used
	:rtype: ChFiDS_ChamfMode") Mode;
		ChFiDS_ChamfMode Mode ();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", ":rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** OffsetEdges ******************/
		%feature("compactdefaultargs") OffsetEdges;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopoDS_Edge") OffsetEdges;
		const TopoDS_Edge  OffsetEdges (const Standard_Integer I);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param AbsC:
	:type AbsC: float
	:param U:
	:type U: float
	:param Oriented: default value is Standard_True
	:type Oriented: bool
	:rtype: None") Parameter;
		void Parameter (const Standard_Real AbsC,Standard_Real &OutValue,const Standard_Boolean Oriented = Standard_True);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param AbsC:
	:type AbsC: float
	:param U:
	:type U: float
	:param Oriented: default value is Standard_True
	:type Oriented: bool
	:rtype: None") Parameter;
		void Parameter (const Standard_Integer Index,const Standard_Real AbsC,Standard_Real &OutValue,const Standard_Boolean Oriented = Standard_True);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		Standard_Real Period ();

		/****************** PutInFirst ******************/
		%feature("compactdefaultargs") PutInFirst;
		%feature("autodoc", "* store the edge at the first position before all others
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") PutInFirst;
		void PutInFirst (const TopoDS_Edge & E);

		/****************** PutInFirstOffset ******************/
		%feature("compactdefaultargs") PutInFirstOffset;
		%feature("autodoc", "* store the offset edge at the first position before all others
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") PutInFirstOffset;
		void PutInFirstOffset (const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", ":param AllData: default value is Standard_False
	:type AllData: bool
	:rtype: void") Reset;
		virtual void Reset (const Standard_Boolean AllData = Standard_False);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", ":param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);

		/****************** SetCurrent ******************/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") SetCurrent;
		void SetCurrent (const Standard_Integer Index);

		/****************** SetEdges ******************/
		%feature("compactdefaultargs") SetEdges;
		%feature("autodoc", "* store edges composing the guideline
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") SetEdges;
		void SetEdges (const TopoDS_Edge & E);

		/****************** SetErrorStatus ******************/
		%feature("compactdefaultargs") SetErrorStatus;
		%feature("autodoc", ":param state:
	:type state: ChFiDS_ErrorStatus
	:rtype: None") SetErrorStatus;
		void SetErrorStatus (const ChFiDS_ErrorStatus state);

		/****************** SetFirstParameter ******************/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", ":param Par:
	:type Par: float
	:rtype: None") SetFirstParameter;
		void SetFirstParameter (const Standard_Real Par);

		/****************** SetFirstStatus ******************/
		%feature("compactdefaultargs") SetFirstStatus;
		%feature("autodoc", "* stores if the start of a set of edges starts on a section of free border or forms a closed contour
	:param S:
	:type S: ChFiDS_State
	:rtype: None") SetFirstStatus;
		void SetFirstStatus (const ChFiDS_State S);

		/****************** SetFirstTgt ******************/
		%feature("compactdefaultargs") SetFirstTgt;
		%feature("autodoc", ":param W:
	:type W: float
	:rtype: None") SetFirstTgt;
		void SetFirstTgt (const Standard_Real W);

		/****************** SetLastParameter ******************/
		%feature("compactdefaultargs") SetLastParameter;
		%feature("autodoc", ":param Par:
	:type Par: float
	:rtype: None") SetLastParameter;
		void SetLastParameter (const Standard_Real Par);

		/****************** SetLastStatus ******************/
		%feature("compactdefaultargs") SetLastStatus;
		%feature("autodoc", "* stores if the end of a set of edges starts on a section of free border or forms a closed contour
	:param S:
	:type S: ChFiDS_State
	:rtype: None") SetLastStatus;
		void SetLastStatus (const ChFiDS_State S);

		/****************** SetLastTgt ******************/
		%feature("compactdefaultargs") SetLastTgt;
		%feature("autodoc", ":param W:
	:type W: float
	:rtype: None") SetLastTgt;
		void SetLastTgt (const Standard_Real W);

		/****************** SetOffsetEdges ******************/
		%feature("compactdefaultargs") SetOffsetEdges;
		%feature("autodoc", "* store offset edges composing the offset guideline
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") SetOffsetEdges;
		void SetOffsetEdges (const TopoDS_Edge & E);

		/****************** SetReference ******************/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "* set a parameter reference for the approx.
	:param W:
	:type W: float
	:rtype: None") SetReference;
		void SetReference (const Standard_Real W);

		/****************** SetReference ******************/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "* set a parameter reference for the approx, at the middle of edge I.
	:param I:
	:type I: int
	:rtype: None") SetReference;
		void SetReference (const Standard_Integer I);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", ":param S:
	:type S: ChFiDS_State
	:param IsFirst:
	:type IsFirst: bool
	:rtype: None") SetStatus;
		void SetStatus (const ChFiDS_State S,const Standard_Boolean IsFirst);

		/****************** SetTangencyExtremity ******************/
		%feature("compactdefaultargs") SetTangencyExtremity;
		%feature("autodoc", ":param IsTangency:
	:type IsTangency: bool
	:param IsFirst:
	:type IsFirst: bool
	:rtype: None") SetTangencyExtremity;
		void SetTangencyExtremity (const Standard_Boolean IsTangency,const Standard_Boolean IsFirst);

		/****************** SplitDone ******************/
		%feature("compactdefaultargs") SplitDone;
		%feature("autodoc", ":rtype: bool") SplitDone;
		Standard_Boolean SplitDone ();

		/****************** SplitDone ******************/
		%feature("compactdefaultargs") SplitDone;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") SplitDone;
		void SplitDone (const Standard_Boolean B);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", ":param IsFirst:
	:type IsFirst: bool
	:rtype: ChFiDS_State") Status;
		ChFiDS_State Status (const Standard_Boolean IsFirst);

		/****************** UnsetReference ******************/
		%feature("compactdefaultargs") UnsetReference;
		%feature("autodoc", ":rtype: None") UnsetReference;
		void UnsetReference ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param AbsC:
	:type AbsC: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real AbsC);

};


%make_alias(ChFiDS_Spine)

%extend ChFiDS_Spine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ChFiDS_Stripe *
**********************/
class ChFiDS_Stripe : public Standard_Transient {
	public:
		/****************** ChFiDS_Stripe ******************/
		%feature("compactdefaultargs") ChFiDS_Stripe;
		%feature("autodoc", ":rtype: None") ChFiDS_Stripe;
		 ChFiDS_Stripe ();

		/****************** ChangeFirstCurve ******************/
		%feature("compactdefaultargs") ChangeFirstCurve;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") ChangeFirstCurve;
		void ChangeFirstCurve (const Standard_Integer Index);

		/****************** ChangeFirstPCurve ******************/
		%feature("compactdefaultargs") ChangeFirstPCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") ChangeFirstPCurve;
		opencascade::handle<Geom2d_Curve> & ChangeFirstPCurve ();

		/****************** ChangeFirstParameters ******************/
		%feature("compactdefaultargs") ChangeFirstParameters;
		%feature("autodoc", ":param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None") ChangeFirstParameters;
		void ChangeFirstParameters (const Standard_Real Pdeb,const Standard_Real Pfin);

		/****************** ChangeIndexFirstPointOnS1 ******************/
		%feature("compactdefaultargs") ChangeIndexFirstPointOnS1;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") ChangeIndexFirstPointOnS1;
		void ChangeIndexFirstPointOnS1 (const Standard_Integer Index);

		/****************** ChangeIndexFirstPointOnS2 ******************/
		%feature("compactdefaultargs") ChangeIndexFirstPointOnS2;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") ChangeIndexFirstPointOnS2;
		void ChangeIndexFirstPointOnS2 (const Standard_Integer Index);

		/****************** ChangeIndexLastPointOnS1 ******************/
		%feature("compactdefaultargs") ChangeIndexLastPointOnS1;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") ChangeIndexLastPointOnS1;
		void ChangeIndexLastPointOnS1 (const Standard_Integer Index);

		/****************** ChangeIndexLastPointOnS2 ******************/
		%feature("compactdefaultargs") ChangeIndexLastPointOnS2;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") ChangeIndexLastPointOnS2;
		void ChangeIndexLastPointOnS2 (const Standard_Integer Index);

		/****************** ChangeLastCurve ******************/
		%feature("compactdefaultargs") ChangeLastCurve;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") ChangeLastCurve;
		void ChangeLastCurve (const Standard_Integer Index);

		/****************** ChangeLastPCurve ******************/
		%feature("compactdefaultargs") ChangeLastPCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") ChangeLastPCurve;
		opencascade::handle<Geom2d_Curve> & ChangeLastPCurve ();

		/****************** ChangeLastParameters ******************/
		%feature("compactdefaultargs") ChangeLastParameters;
		%feature("autodoc", ":param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None") ChangeLastParameters;
		void ChangeLastParameters (const Standard_Real Pdeb,const Standard_Real Pfin);

		/****************** ChangePCurve ******************/
		%feature("compactdefaultargs") ChangePCurve;
		%feature("autodoc", ":param First:
	:type First: bool
	:rtype: opencascade::handle<Geom2d_Curve>") ChangePCurve;
		opencascade::handle<Geom2d_Curve> & ChangePCurve (const Standard_Boolean First);

		/****************** ChangeSetOfSurfData ******************/
		%feature("compactdefaultargs") ChangeSetOfSurfData;
		%feature("autodoc", ":rtype: opencascade::handle<ChFiDS_HData>") ChangeSetOfSurfData;
		opencascade::handle<ChFiDS_HData> & ChangeSetOfSurfData ();

		/****************** ChangeSpine ******************/
		%feature("compactdefaultargs") ChangeSpine;
		%feature("autodoc", ":rtype: opencascade::handle<ChFiDS_Spine>") ChangeSpine;
		opencascade::handle<ChFiDS_Spine> & ChangeSpine ();

		/****************** Choix ******************/
		%feature("compactdefaultargs") Choix;
		%feature("autodoc", ":rtype: int") Choix;
		Standard_Integer Choix ();

		/****************** Choix ******************/
		%feature("compactdefaultargs") Choix;
		%feature("autodoc", ":param C:
	:type C: int
	:rtype: None") Choix;
		void Choix (const Standard_Integer C);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":param First:
	:type First: bool
	:rtype: int") Curve;
		Standard_Integer Curve (const Standard_Boolean First);

		/****************** FirstCurve ******************/
		%feature("compactdefaultargs") FirstCurve;
		%feature("autodoc", ":rtype: int") FirstCurve;
		Standard_Integer FirstCurve ();

		/****************** FirstPCurve ******************/
		%feature("compactdefaultargs") FirstPCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") FirstPCurve;
		const opencascade::handle<Geom2d_Curve> & FirstPCurve ();

		/****************** FirstPCurveOrientation ******************/
		%feature("compactdefaultargs") FirstPCurveOrientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") FirstPCurveOrientation;
		TopAbs_Orientation FirstPCurveOrientation ();

		/****************** FirstPCurveOrientation ******************/
		%feature("compactdefaultargs") FirstPCurveOrientation;
		%feature("autodoc", ":param O:
	:type O: TopAbs_Orientation
	:rtype: None") FirstPCurveOrientation;
		void FirstPCurveOrientation (const TopAbs_Orientation O);

		/****************** FirstParameters ******************/
		%feature("compactdefaultargs") FirstParameters;
		%feature("autodoc", ":param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None") FirstParameters;
		void FirstParameters (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** InDS ******************/
		%feature("compactdefaultargs") InDS;
		%feature("autodoc", "* Set nb of SurfData's at end put in DS
	:param First:
	:type First: bool
	:param Nb: default value is 1
	:type Nb: int
	:rtype: None") InDS;
		void InDS (const Standard_Boolean First,const Standard_Integer Nb = 1);

		/****************** IndexFirstPointOnS1 ******************/
		%feature("compactdefaultargs") IndexFirstPointOnS1;
		%feature("autodoc", ":rtype: int") IndexFirstPointOnS1;
		Standard_Integer IndexFirstPointOnS1 ();

		/****************** IndexFirstPointOnS2 ******************/
		%feature("compactdefaultargs") IndexFirstPointOnS2;
		%feature("autodoc", ":rtype: int") IndexFirstPointOnS2;
		Standard_Integer IndexFirstPointOnS2 ();

		/****************** IndexLastPointOnS1 ******************/
		%feature("compactdefaultargs") IndexLastPointOnS1;
		%feature("autodoc", ":rtype: int") IndexLastPointOnS1;
		Standard_Integer IndexLastPointOnS1 ();

		/****************** IndexLastPointOnS2 ******************/
		%feature("compactdefaultargs") IndexLastPointOnS2;
		%feature("autodoc", ":rtype: int") IndexLastPointOnS2;
		Standard_Integer IndexLastPointOnS2 ();

		/****************** IndexPoint ******************/
		%feature("compactdefaultargs") IndexPoint;
		%feature("autodoc", ":param First:
	:type First: bool
	:param OnS:
	:type OnS: int
	:rtype: int") IndexPoint;
		Standard_Integer IndexPoint (const Standard_Boolean First,const Standard_Integer OnS);

		/****************** IsInDS ******************/
		%feature("compactdefaultargs") IsInDS;
		%feature("autodoc", "* Returns nb of SurfData's at end being in DS
	:param First:
	:type First: bool
	:rtype: int") IsInDS;
		Standard_Integer IsInDS (const Standard_Boolean First);

		/****************** LastCurve ******************/
		%feature("compactdefaultargs") LastCurve;
		%feature("autodoc", ":rtype: int") LastCurve;
		Standard_Integer LastCurve ();

		/****************** LastPCurve ******************/
		%feature("compactdefaultargs") LastPCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") LastPCurve;
		const opencascade::handle<Geom2d_Curve> & LastPCurve ();

		/****************** LastPCurveOrientation ******************/
		%feature("compactdefaultargs") LastPCurveOrientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") LastPCurveOrientation;
		TopAbs_Orientation LastPCurveOrientation ();

		/****************** LastPCurveOrientation ******************/
		%feature("compactdefaultargs") LastPCurveOrientation;
		%feature("autodoc", ":param O:
	:type O: TopAbs_Orientation
	:rtype: None") LastPCurveOrientation;
		void LastPCurveOrientation (const TopAbs_Orientation O);

		/****************** LastParameters ******************/
		%feature("compactdefaultargs") LastParameters;
		%feature("autodoc", ":param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None") LastParameters;
		void LastParameters (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param OnS:
	:type OnS: int
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation (const Standard_Integer OnS);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param First:
	:type First: bool
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation (const Standard_Boolean First);

		/****************** OrientationOnFace1 ******************/
		%feature("compactdefaultargs") OrientationOnFace1;
		%feature("autodoc", ":rtype: TopAbs_Orientation") OrientationOnFace1;
		TopAbs_Orientation OrientationOnFace1 ();

		/****************** OrientationOnFace1 ******************/
		%feature("compactdefaultargs") OrientationOnFace1;
		%feature("autodoc", ":param Or1:
	:type Or1: TopAbs_Orientation
	:rtype: None") OrientationOnFace1;
		void OrientationOnFace1 (const TopAbs_Orientation Or1);

		/****************** OrientationOnFace2 ******************/
		%feature("compactdefaultargs") OrientationOnFace2;
		%feature("autodoc", ":rtype: TopAbs_Orientation") OrientationOnFace2;
		TopAbs_Orientation OrientationOnFace2 ();

		/****************** OrientationOnFace2 ******************/
		%feature("compactdefaultargs") OrientationOnFace2;
		%feature("autodoc", ":param Or2:
	:type Or2: TopAbs_Orientation
	:rtype: None") OrientationOnFace2;
		void OrientationOnFace2 (const TopAbs_Orientation Or2);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":param First:
	:type First: bool
	:rtype: opencascade::handle<Geom2d_Curve>") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve (const Standard_Boolean First);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", ":param First:
	:type First: bool
	:param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None") Parameters;
		void Parameters (const Standard_Boolean First,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reset everything except Spine.
	:rtype: None") Reset;
		void Reset ();

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param First:
	:type First: bool
	:rtype: None") SetCurve;
		void SetCurve (const Standard_Integer Index,const Standard_Boolean First);

		/****************** SetIndexPoint ******************/
		%feature("compactdefaultargs") SetIndexPoint;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param First:
	:type First: bool
	:param OnS:
	:type OnS: int
	:rtype: None") SetIndexPoint;
		void SetIndexPoint (const Standard_Integer Index,const Standard_Boolean First,const Standard_Integer OnS);

		/****************** SetOfSurfData ******************/
		%feature("compactdefaultargs") SetOfSurfData;
		%feature("autodoc", ":rtype: opencascade::handle<ChFiDS_HData>") SetOfSurfData;
		const opencascade::handle<ChFiDS_HData> & SetOfSurfData ();

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", ":param Or:
	:type Or: TopAbs_Orientation
	:param OnS:
	:type OnS: int
	:rtype: None") SetOrientation;
		void SetOrientation (const TopAbs_Orientation Or,const Standard_Integer OnS);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", ":param Or:
	:type Or: TopAbs_Orientation
	:param First:
	:type First: bool
	:rtype: None") SetOrientation;
		void SetOrientation (const TopAbs_Orientation Or,const Standard_Boolean First);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", ":param First:
	:type First: bool
	:param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None") SetParameters;
		void SetParameters (const Standard_Boolean First,const Standard_Real Pdeb,const Standard_Real Pfin);

		/****************** SetSolidIndex ******************/
		%feature("compactdefaultargs") SetSolidIndex;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") SetSolidIndex;
		void SetSolidIndex (const Standard_Integer Index);

		/****************** SolidIndex ******************/
		%feature("compactdefaultargs") SolidIndex;
		%feature("autodoc", ":rtype: int") SolidIndex;
		Standard_Integer SolidIndex ();

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", ":rtype: opencascade::handle<ChFiDS_Spine>") Spine;
		const opencascade::handle<ChFiDS_Spine> & Spine ();

};


%make_alias(ChFiDS_Stripe)

%extend ChFiDS_Stripe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class ChFiDS_StripeMap *
*************************/
class ChFiDS_StripeMap {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:param F:
	:type F: ChFiDS_Stripe
	:rtype: None") Add;
		void Add (const TopoDS_Vertex & V,const opencascade::handle<ChFiDS_Stripe> & F);

		/****************** ChFiDS_StripeMap ******************/
		%feature("compactdefaultargs") ChFiDS_StripeMap;
		%feature("autodoc", ":rtype: None") ChFiDS_StripeMap;
		 ChFiDS_StripeMap ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", ":rtype: int") Extent;
		Standard_Integer Extent ();

		/****************** FindFromIndex ******************/
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: ChFiDS_ListOfStripe") FindFromIndex;
		const ChFiDS_ListOfStripe & FindFromIndex (const Standard_Integer I);

		/****************** FindFromKey ******************/
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:rtype: ChFiDS_ListOfStripe") FindFromKey;
		const ChFiDS_ListOfStripe & FindFromKey (const TopoDS_Vertex & V);

		/****************** FindKey ******************/
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopoDS_Vertex") FindKey;
		const TopoDS_Vertex  FindKey (const Standard_Integer I);

};


%extend ChFiDS_StripeMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class ChFiDS_SurfData *
************************/
class ChFiDS_SurfData : public Standard_Transient {
	public:
		/****************** ChFiDS_SurfData ******************/
		%feature("compactdefaultargs") ChFiDS_SurfData;
		%feature("autodoc", ":rtype: None") ChFiDS_SurfData;
		 ChFiDS_SurfData ();

		/****************** ChangeIndexOfS1 ******************/
		%feature("compactdefaultargs") ChangeIndexOfS1;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") ChangeIndexOfS1;
		void ChangeIndexOfS1 (const Standard_Integer Index);

		/****************** ChangeIndexOfS2 ******************/
		%feature("compactdefaultargs") ChangeIndexOfS2;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") ChangeIndexOfS2;
		void ChangeIndexOfS2 (const Standard_Integer Index);

		/****************** ChangeInterference ******************/
		%feature("compactdefaultargs") ChangeInterference;
		%feature("autodoc", ":param OnS:
	:type OnS: int
	:rtype: ChFiDS_FaceInterference") ChangeInterference;
		ChFiDS_FaceInterference & ChangeInterference (const Standard_Integer OnS);

		/****************** ChangeInterferenceOnS1 ******************/
		%feature("compactdefaultargs") ChangeInterferenceOnS1;
		%feature("autodoc", ":rtype: ChFiDS_FaceInterference") ChangeInterferenceOnS1;
		ChFiDS_FaceInterference & ChangeInterferenceOnS1 ();

		/****************** ChangeInterferenceOnS2 ******************/
		%feature("compactdefaultargs") ChangeInterferenceOnS2;
		%feature("autodoc", ":rtype: ChFiDS_FaceInterference") ChangeInterferenceOnS2;
		ChFiDS_FaceInterference & ChangeInterferenceOnS2 ();

		/****************** ChangeOrientation ******************/
		%feature("compactdefaultargs") ChangeOrientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation ();

		/****************** ChangeSurf ******************/
		%feature("compactdefaultargs") ChangeSurf;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") ChangeSurf;
		void ChangeSurf (const Standard_Integer Index);

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "* returns one of the four vertices wether First is true or wrong and OnS equals 1 or 2.
	:param First:
	:type First: bool
	:param OnS:
	:type OnS: int
	:rtype: ChFiDS_CommonPoint") ChangeVertex;
		ChFiDS_CommonPoint & ChangeVertex (const Standard_Boolean First,const Standard_Integer OnS);

		/****************** ChangeVertexFirstOnS1 ******************/
		%feature("compactdefaultargs") ChangeVertexFirstOnS1;
		%feature("autodoc", ":rtype: ChFiDS_CommonPoint") ChangeVertexFirstOnS1;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS1 ();

		/****************** ChangeVertexFirstOnS2 ******************/
		%feature("compactdefaultargs") ChangeVertexFirstOnS2;
		%feature("autodoc", ":rtype: ChFiDS_CommonPoint") ChangeVertexFirstOnS2;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS2 ();

		/****************** ChangeVertexLastOnS1 ******************/
		%feature("compactdefaultargs") ChangeVertexLastOnS1;
		%feature("autodoc", ":rtype: ChFiDS_CommonPoint") ChangeVertexLastOnS1;
		ChFiDS_CommonPoint & ChangeVertexLastOnS1 ();

		/****************** ChangeVertexLastOnS2 ******************/
		%feature("compactdefaultargs") ChangeVertexLastOnS2;
		%feature("autodoc", ":rtype: ChFiDS_CommonPoint") ChangeVertexLastOnS2;
		ChFiDS_CommonPoint & ChangeVertexLastOnS2 ();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", ":param Other:
	:type Other: ChFiDS_SurfData
	:rtype: None") Copy;
		void Copy (const opencascade::handle<ChFiDS_SurfData> & Other);

		/****************** FirstExtensionValue ******************/
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", ":rtype: float") FirstExtensionValue;
		Standard_Real FirstExtensionValue ();

		/****************** FirstExtensionValue ******************/
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", ":param Extend:
	:type Extend: float
	:rtype: None") FirstExtensionValue;
		void FirstExtensionValue (const Standard_Real Extend);

		/****************** FirstSpineParam ******************/
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", ":rtype: float") FirstSpineParam;
		Standard_Real FirstSpineParam ();

		/****************** FirstSpineParam ******************/
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", ":param Par:
	:type Par: float
	:rtype: None") FirstSpineParam;
		void FirstSpineParam (const Standard_Real Par);

		/****************** Get2dPoints ******************/
		%feature("compactdefaultargs") Get2dPoints;
		%feature("autodoc", ":param First:
	:type First: bool
	:param OnS:
	:type OnS: int
	:rtype: gp_Pnt2d") Get2dPoints;
		gp_Pnt2d Get2dPoints (const Standard_Boolean First,const Standard_Integer OnS);

		/****************** Get2dPoints ******************/
		%feature("compactdefaultargs") Get2dPoints;
		%feature("autodoc", ":param P2df1:
	:type P2df1: gp_Pnt2d
	:param P2dl1:
	:type P2dl1: gp_Pnt2d
	:param P2df2:
	:type P2df2: gp_Pnt2d
	:param P2dl2:
	:type P2dl2: gp_Pnt2d
	:rtype: None") Get2dPoints;
		void Get2dPoints (gp_Pnt2d & P2df1,gp_Pnt2d & P2dl1,gp_Pnt2d & P2df2,gp_Pnt2d & P2dl2);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":param OfS:
	:type OfS: int
	:rtype: int") Index;
		Standard_Integer Index (const Standard_Integer OfS);

		/****************** IndexOfC ******************/
		%feature("compactdefaultargs") IndexOfC;
		%feature("autodoc", ":param OnS:
	:type OnS: int
	:rtype: int") IndexOfC;
		Standard_Integer IndexOfC (const Standard_Integer OnS);

		/****************** IndexOfC1 ******************/
		%feature("compactdefaultargs") IndexOfC1;
		%feature("autodoc", ":rtype: int") IndexOfC1;
		Standard_Integer IndexOfC1 ();

		/****************** IndexOfC2 ******************/
		%feature("compactdefaultargs") IndexOfC2;
		%feature("autodoc", ":rtype: int") IndexOfC2;
		Standard_Integer IndexOfC2 ();

		/****************** IndexOfS1 ******************/
		%feature("compactdefaultargs") IndexOfS1;
		%feature("autodoc", ":rtype: int") IndexOfS1;
		Standard_Integer IndexOfS1 ();

		/****************** IndexOfS2 ******************/
		%feature("compactdefaultargs") IndexOfS2;
		%feature("autodoc", ":rtype: int") IndexOfS2;
		Standard_Integer IndexOfS2 ();

		/****************** Interference ******************/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", ":param OnS:
	:type OnS: int
	:rtype: ChFiDS_FaceInterference") Interference;
		const ChFiDS_FaceInterference & Interference (const Standard_Integer OnS);

		/****************** InterferenceOnS1 ******************/
		%feature("compactdefaultargs") InterferenceOnS1;
		%feature("autodoc", ":rtype: ChFiDS_FaceInterference") InterferenceOnS1;
		const ChFiDS_FaceInterference & InterferenceOnS1 ();

		/****************** InterferenceOnS2 ******************/
		%feature("compactdefaultargs") InterferenceOnS2;
		%feature("autodoc", ":rtype: ChFiDS_FaceInterference") InterferenceOnS2;
		const ChFiDS_FaceInterference & InterferenceOnS2 ();

		/****************** IsOnCurve ******************/
		%feature("compactdefaultargs") IsOnCurve;
		%feature("autodoc", ":param OnS:
	:type OnS: int
	:rtype: bool") IsOnCurve;
		Standard_Boolean IsOnCurve (const Standard_Integer OnS);

		/****************** IsOnCurve1 ******************/
		%feature("compactdefaultargs") IsOnCurve1;
		%feature("autodoc", ":rtype: bool") IsOnCurve1;
		Standard_Boolean IsOnCurve1 ();

		/****************** IsOnCurve2 ******************/
		%feature("compactdefaultargs") IsOnCurve2;
		%feature("autodoc", ":rtype: bool") IsOnCurve2;
		Standard_Boolean IsOnCurve2 ();

		/****************** LastExtensionValue ******************/
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", ":rtype: float") LastExtensionValue;
		Standard_Real LastExtensionValue ();

		/****************** LastExtensionValue ******************/
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", ":param Extend:
	:type Extend: float
	:rtype: None") LastExtensionValue;
		void LastExtensionValue (const Standard_Real Extend);

		/****************** LastSpineParam ******************/
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", ":rtype: float") LastSpineParam;
		Standard_Real LastSpineParam ();

		/****************** LastSpineParam ******************/
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", ":param Par:
	:type Par: float
	:rtype: None") LastSpineParam;
		void LastSpineParam (const Standard_Real Par);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** ResetSimul ******************/
		%feature("compactdefaultargs") ResetSimul;
		%feature("autodoc", ":rtype: None") ResetSimul;
		void ResetSimul ();

		/****************** Set2dPoints ******************/
		%feature("compactdefaultargs") Set2dPoints;
		%feature("autodoc", ":param P2df1:
	:type P2df1: gp_Pnt2d
	:param P2dl1:
	:type P2dl1: gp_Pnt2d
	:param P2df2:
	:type P2df2: gp_Pnt2d
	:param P2dl2:
	:type P2dl2: gp_Pnt2d
	:rtype: None") Set2dPoints;
		void Set2dPoints (const gp_Pnt2d & P2df1,const gp_Pnt2d & P2dl1,const gp_Pnt2d & P2df2,const gp_Pnt2d & P2dl2);

		/****************** SetIndexOfC1 ******************/
		%feature("compactdefaultargs") SetIndexOfC1;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") SetIndexOfC1;
		void SetIndexOfC1 (const Standard_Integer Index);

		/****************** SetIndexOfC2 ******************/
		%feature("compactdefaultargs") SetIndexOfC2;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: None") SetIndexOfC2;
		void SetIndexOfC2 (const Standard_Integer Index);

		/****************** SetSimul ******************/
		%feature("compactdefaultargs") SetSimul;
		%feature("autodoc", ":param S:
	:type S: Standard_Transient
	:rtype: None") SetSimul;
		void SetSimul (const opencascade::handle<Standard_Transient> & S);

		/****************** Simul ******************/
		%feature("compactdefaultargs") Simul;
		%feature("autodoc", ":rtype: opencascade::handle<Standard_Transient>") Simul;
		opencascade::handle<Standard_Transient> Simul ();

		/****************** Surf ******************/
		%feature("compactdefaultargs") Surf;
		%feature("autodoc", ":rtype: int") Surf;
		Standard_Integer Surf ();

		/****************** TwistOnS1 ******************/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", ":rtype: bool") TwistOnS1;
		Standard_Boolean TwistOnS1 ();

		/****************** TwistOnS1 ******************/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", ":param T:
	:type T: bool
	:rtype: None") TwistOnS1;
		void TwistOnS1 (const Standard_Boolean T);

		/****************** TwistOnS2 ******************/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", ":rtype: bool") TwistOnS2;
		Standard_Boolean TwistOnS2 ();

		/****************** TwistOnS2 ******************/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", ":param T:
	:type T: bool
	:rtype: None") TwistOnS2;
		void TwistOnS2 (const Standard_Boolean T);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* returns one of the four vertices wether First is true or wrong and OnS equals 1 or 2.
	:param First:
	:type First: bool
	:param OnS:
	:type OnS: int
	:rtype: ChFiDS_CommonPoint") Vertex;
		const ChFiDS_CommonPoint & Vertex (const Standard_Boolean First,const Standard_Integer OnS);

		/****************** VertexFirstOnS1 ******************/
		%feature("compactdefaultargs") VertexFirstOnS1;
		%feature("autodoc", ":rtype: ChFiDS_CommonPoint") VertexFirstOnS1;
		const ChFiDS_CommonPoint & VertexFirstOnS1 ();

		/****************** VertexFirstOnS2 ******************/
		%feature("compactdefaultargs") VertexFirstOnS2;
		%feature("autodoc", ":rtype: ChFiDS_CommonPoint") VertexFirstOnS2;
		const ChFiDS_CommonPoint & VertexFirstOnS2 ();

		/****************** VertexLastOnS1 ******************/
		%feature("compactdefaultargs") VertexLastOnS1;
		%feature("autodoc", ":rtype: ChFiDS_CommonPoint") VertexLastOnS1;
		const ChFiDS_CommonPoint & VertexLastOnS1 ();

		/****************** VertexLastOnS2 ******************/
		%feature("compactdefaultargs") VertexLastOnS2;
		%feature("autodoc", ":rtype: ChFiDS_CommonPoint") VertexLastOnS2;
		const ChFiDS_CommonPoint & VertexLastOnS2 ();

};


%make_alias(ChFiDS_SurfData)

%extend ChFiDS_SurfData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class ChFiDS_ChamfSpine *
**************************/
class ChFiDS_ChamfSpine : public ChFiDS_Spine {
	public:
		/****************** ChFiDS_ChamfSpine ******************/
		%feature("compactdefaultargs") ChFiDS_ChamfSpine;
		%feature("autodoc", ":rtype: None") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine ();

		/****************** ChFiDS_ChamfSpine ******************/
		%feature("compactdefaultargs") ChFiDS_ChamfSpine;
		%feature("autodoc", ":param Tol:
	:type Tol: float
	:rtype: None") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine (const Standard_Real Tol);

		/****************** Dists ******************/
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", ":param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:rtype: None") Dists;
		void Dists (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetDist ******************/
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", ":param Dis:
	:type Dis: float
	:rtype: None") GetDist;
		void GetDist (Standard_Real &OutValue);

		/****************** GetDistAngle ******************/
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", ":param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:rtype: None") GetDistAngle;
		void GetDistAngle (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsChamfer ******************/
		%feature("compactdefaultargs") IsChamfer;
		%feature("autodoc", "* Return the method of chamfers used
	:rtype: ChFiDS_ChamfMethod") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer ();

		/****************** SetDist ******************/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", ":param Dis:
	:type Dis: float
	:rtype: None") SetDist;
		void SetDist (const Standard_Real Dis);

		/****************** SetDistAngle ******************/
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", ":param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:rtype: None") SetDistAngle;
		void SetDistAngle (const Standard_Real Dis,const Standard_Real Angle);

		/****************** SetDists ******************/
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", ":param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:rtype: None") SetDists;
		void SetDists (const Standard_Real Dis1,const Standard_Real Dis2);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", ":param theMode:
	:type theMode: ChFiDS_ChamfMode
	:rtype: None") SetMode;
		void SetMode (const ChFiDS_ChamfMode theMode);

};


%make_alias(ChFiDS_ChamfSpine)

%extend ChFiDS_ChamfSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class ChFiDS_FilSpine *
************************/
class ChFiDS_FilSpine : public ChFiDS_Spine {
	public:
		/****************** AppendElSpine ******************/
		%feature("compactdefaultargs") AppendElSpine;
		%feature("autodoc", ":param Els:
	:type Els: ChFiDS_HElSpine
	:rtype: void") AppendElSpine;
		virtual void AppendElSpine (const opencascade::handle<ChFiDS_HElSpine> & Els);

		/****************** ChFiDS_FilSpine ******************/
		%feature("compactdefaultargs") ChFiDS_FilSpine;
		%feature("autodoc", ":rtype: None") ChFiDS_FilSpine;
		 ChFiDS_FilSpine ();

		/****************** ChFiDS_FilSpine ******************/
		%feature("compactdefaultargs") ChFiDS_FilSpine;
		%feature("autodoc", ":param Tol:
	:type Tol: float
	:rtype: None") ChFiDS_FilSpine;
		 ChFiDS_FilSpine (const Standard_Real Tol);

		/****************** ChangeLaw ******************/
		%feature("compactdefaultargs") ChangeLaw;
		%feature("autodoc", "* returns the elementary law
	:param E:
	:type E: TopoDS_Edge
	:rtype: opencascade::handle<Law_Function>") ChangeLaw;
		opencascade::handle<Law_Function> & ChangeLaw (const TopoDS_Edge & E);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "* returns true if the radius is constant all along the spine.
	:rtype: bool") IsConstant;
		Standard_Boolean IsConstant ();

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "* returns true if the radius is constant all along the edge E.
	:param IE:
	:type IE: int
	:rtype: bool") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IE);

		/****************** Law ******************/
		%feature("compactdefaultargs") Law;
		%feature("autodoc", ":param Els:
	:type Els: ChFiDS_HElSpine
	:rtype: opencascade::handle<Law_Composite>") Law;
		opencascade::handle<Law_Composite> Law (const opencascade::handle<ChFiDS_HElSpine> & Els);

		/****************** MaxRadFromSeqAndLaws ******************/
		%feature("compactdefaultargs") MaxRadFromSeqAndLaws;
		%feature("autodoc", "* returns the maximum radius if the fillet is non-constant
	:rtype: float") MaxRadFromSeqAndLaws;
		Standard_Real MaxRadFromSeqAndLaws ();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* returns the radius if the fillet is constant all along the spine.
	:rtype: float") Radius;
		Standard_Real Radius ();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* returns the radius if the fillet is constant all along the edge E.
	:param IE:
	:type IE: int
	:rtype: float") Radius;
		Standard_Real Radius (const Standard_Integer IE);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* returns the radius if the fillet is constant all along the edge E.
	:param E:
	:type E: TopoDS_Edge
	:rtype: float") Radius;
		Standard_Real Radius (const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", ":param AllData: default value is Standard_False
	:type AllData: bool
	:rtype: void") Reset;
		virtual void Reset (const Standard_Boolean AllData = Standard_False);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* initializes the constant vector on edge E.
	:param Radius:
	:type Radius: float
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real Radius,const TopoDS_Edge & E);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* initializes the vector on Vertex V.
	:param Radius:
	:type Radius: float
	:param V:
	:type V: TopoDS_Vertex
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real Radius,const TopoDS_Vertex & V);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* initializes the vector on the point of parameter W.
	:param UandR:
	:type UandR: gp_XY
	:param IinC:
	:type IinC: int
	:rtype: None") SetRadius;
		void SetRadius (const gp_XY & UandR,const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* initializes the constant vector on all spine.
	:param Radius:
	:type Radius: float
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real Radius);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* initializes the rule of evolution on all spine.
	:param C:
	:type C: Law_Function
	:param IinC:
	:type IinC: int
	:rtype: None") SetRadius;
		void SetRadius (const opencascade::handle<Law_Function> & C,const Standard_Integer IinC);

		/****************** UnSetRadius ******************/
		%feature("compactdefaultargs") UnSetRadius;
		%feature("autodoc", "* resets the constant vector on edge E.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") UnSetRadius;
		void UnSetRadius (const TopoDS_Edge & E);

		/****************** UnSetRadius ******************/
		%feature("compactdefaultargs") UnSetRadius;
		%feature("autodoc", "* resets the vector on Vertex V.
	:param V:
	:type V: TopoDS_Vertex
	:rtype: None") UnSetRadius;
		void UnSetRadius (const TopoDS_Vertex & V);

};


%make_alias(ChFiDS_FilSpine)

%extend ChFiDS_FilSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class ChFiDS_SecHArray1 : public  ChFiDS_SecArray1, public Standard_Transient {
  public:
    ChFiDS_SecHArray1(const Standard_Integer theLower, const Standard_Integer theUpper);
    ChFiDS_SecHArray1(const Standard_Integer theLower, const Standard_Integer theUpper, const  ChFiDS_SecArray1::value_type& theValue);
    ChFiDS_SecHArray1(const  ChFiDS_SecArray1& theOther);
    const  ChFiDS_SecArray1& Array1();
     ChFiDS_SecArray1& ChangeArray1();
};
%make_alias(ChFiDS_SecHArray1)


/* harray2 classes */
/* hsequence classes */
class ChFiDS_HData : public  ChFiDS_SequenceOfSurfData, public Standard_Transient {
  public:
    ChFiDS_HData();
    ChFiDS_HData(const  ChFiDS_SequenceOfSurfData& theOther);
    const  ChFiDS_SequenceOfSurfData& Sequence();
    void Append (const  ChFiDS_SequenceOfSurfData::value_type& theItem);
    void Append ( ChFiDS_SequenceOfSurfData& theSequence);
     ChFiDS_SequenceOfSurfData& ChangeSequence();
};
%make_alias(ChFiDS_HData)


