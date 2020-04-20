/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class ChFiDS_State(IntEnum):
	ChFiDS_OnSame = 0
	ChFiDS_OnDiff = 1
	ChFiDS_AllSame = 2
	ChFiDS_BreakPoint = 3
	ChFiDS_FreeBoundary = 4
	ChFiDS_Closed = 5
	ChFiDS_Tangent = 6
ChFiDS_OnSame = ChFiDS_State.ChFiDS_OnSame
ChFiDS_OnDiff = ChFiDS_State.ChFiDS_OnDiff
ChFiDS_AllSame = ChFiDS_State.ChFiDS_AllSame
ChFiDS_BreakPoint = ChFiDS_State.ChFiDS_BreakPoint
ChFiDS_FreeBoundary = ChFiDS_State.ChFiDS_FreeBoundary
ChFiDS_Closed = ChFiDS_State.ChFiDS_Closed
ChFiDS_Tangent = ChFiDS_State.ChFiDS_Tangent

class ChFiDS_ChamfMethod(IntEnum):
	ChFiDS_Sym = 0
	ChFiDS_TwoDist = 1
	ChFiDS_DistAngle = 2
ChFiDS_Sym = ChFiDS_ChamfMethod.ChFiDS_Sym
ChFiDS_TwoDist = ChFiDS_ChamfMethod.ChFiDS_TwoDist
ChFiDS_DistAngle = ChFiDS_ChamfMethod.ChFiDS_DistAngle

class ChFiDS_ChamfMode(IntEnum):
	ChFiDS_ClassicChamfer = 0
	ChFiDS_ConstThroatChamfer = 1
	ChFiDS_ConstThroatWithPenetrationChamfer = 2
ChFiDS_ClassicChamfer = ChFiDS_ChamfMode.ChFiDS_ClassicChamfer
ChFiDS_ConstThroatChamfer = ChFiDS_ChamfMode.ChFiDS_ConstThroatChamfer
ChFiDS_ConstThroatWithPenetrationChamfer = ChFiDS_ChamfMode.ChFiDS_ConstThroatWithPenetrationChamfer

class ChFiDS_ErrorStatus(IntEnum):
	ChFiDS_Ok = 0
	ChFiDS_Error = 1
	ChFiDS_WalkingFailure = 2
	ChFiDS_StartsolFailure = 3
	ChFiDS_TwistedSurface = 4
ChFiDS_Ok = ChFiDS_ErrorStatus.ChFiDS_Ok
ChFiDS_Error = ChFiDS_ErrorStatus.ChFiDS_Error
ChFiDS_WalkingFailure = ChFiDS_ErrorStatus.ChFiDS_WalkingFailure
ChFiDS_StartsolFailure = ChFiDS_ErrorStatus.ChFiDS_StartsolFailure
ChFiDS_TwistedSurface = ChFiDS_ErrorStatus.ChFiDS_TwistedSurface
};
/* end python proxy for enums */

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
%template(ChFiDS_IndexedDataMapOfVertexListOfStripe) NCollection_IndexedDataMap<TopoDS_Vertex,ChFiDS_ListOfStripe,TopTools_ShapeMapHasher>;
%template(ChFiDS_ListIteratorOfListOfHElSpine) NCollection_TListIterator<opencascade::handle<ChFiDS_HElSpine>>;
%template(ChFiDS_ListIteratorOfListOfStripe) NCollection_TListIterator<opencascade::handle<ChFiDS_Stripe>>;
%template(ChFiDS_ListIteratorOfRegularities) NCollection_TListIterator<ChFiDS_Regul>;
%template(ChFiDS_ListOfHElSpine) NCollection_List<opencascade::handle<ChFiDS_HElSpine>>;

%extend NCollection_List<opencascade::handle<ChFiDS_HElSpine>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ChFiDS_ListOfStripe) NCollection_List<opencascade::handle<ChFiDS_Stripe>>;

%extend NCollection_List<opencascade::handle<ChFiDS_Stripe>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ChFiDS_Regularities) NCollection_List<ChFiDS_Regul>;

%extend NCollection_List<ChFiDS_Regul> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ChFiDS_SecArray1) NCollection_Array1<ChFiDS_CircSection>;

%extend NCollection_Array1<ChFiDS_CircSection> {
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
%template(ChFiDS_SequenceOfSpine) NCollection_Sequence<opencascade::handle<ChFiDS_Spine>>;

%extend NCollection_Sequence<opencascade::handle<ChFiDS_Spine>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ChFiDS_SequenceOfSurfData) NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>>;

%extend NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ChFiDS_StripeArray1) NCollection_Array1<opencascade::handle<ChFiDS_Stripe>>;

%extend NCollection_Array1<opencascade::handle<ChFiDS_Stripe>> {
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
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap<TopoDS_Vertex, ChFiDS_ListOfStripe, TopTools_ShapeMapHasher> ChFiDS_IndexedDataMapOfVertexListOfStripe;
typedef NCollection_List<opencascade::handle<ChFiDS_HElSpine>>::Iterator ChFiDS_ListIteratorOfListOfHElSpine;
typedef NCollection_List<opencascade::handle<ChFiDS_Stripe>>::Iterator ChFiDS_ListIteratorOfListOfStripe;
typedef NCollection_List<ChFiDS_Regul>::Iterator ChFiDS_ListIteratorOfRegularities;
typedef NCollection_List<opencascade::handle<ChFiDS_HElSpine>> ChFiDS_ListOfHElSpine;
typedef NCollection_List<opencascade::handle<ChFiDS_Stripe>> ChFiDS_ListOfStripe;
typedef NCollection_List<ChFiDS_Regul> ChFiDS_Regularities;
typedef NCollection_Array1<ChFiDS_CircSection> ChFiDS_SecArray1;
typedef NCollection_Sequence<opencascade::handle<ChFiDS_Spine>> ChFiDS_SequenceOfSpine;
typedef NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>> ChFiDS_SequenceOfSurfData;
typedef NCollection_Array1<opencascade::handle<ChFiDS_Stripe>> ChFiDS_StripeArray1;
/* end typedefs declaration */

/***************************
* class ChFiDS_CircSection *
***************************/
class ChFiDS_CircSection {
	public:
		/****************** ChFiDS_CircSection ******************/
		%feature("compactdefaultargs") ChFiDS_CircSection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_CircSection;
		 ChFiDS_CircSection();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ

Returns
-------
F: float
L: float
") Get;
		void Get(gp_Circ & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
F: float
L: float
") Get;
		void Get(gp_Lin & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
F: float
L: float

Returns
-------
None
") Set;
		void Set(const gp_Circ & C, const Standard_Real F, const Standard_Real L);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
F: float
L: float

Returns
-------
None
") Set;
		void Set(const gp_Lin & C, const Standard_Real F, const Standard_Real L);

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
		/****************** ChFiDS_CommonPoint ******************/
		%feature("compactdefaultargs") ChFiDS_CommonPoint;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ChFiDS_CommonPoint;
		 ChFiDS_CommonPoint();

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Returns the arc of restriction containing the vertex.

Returns
-------
TopoDS_Edge
") Arc;
		const TopoDS_Edge Arc();

		/****************** HasVector ******************/
		%feature("compactdefaultargs") HasVector;
		%feature("autodoc", "Returns true if the output vector is stored.

Returns
-------
bool
") HasVector;
		Standard_Boolean HasVector();

		/****************** IsOnArc ******************/
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "Returns true if the point is a on an edge of the initial restriction facet of the surface.

Returns
-------
bool
") IsOnArc;
		Standard_Boolean IsOnArc();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the surface.

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter the paramter on the spine.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ParameterOnArc ******************/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Returns the parameter of the point on the arc returned by the method arc().

Returns
-------
float
") ParameterOnArc;
		Standard_Real ParameterOnArc();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the 3d point.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Default value for all fields.

Returns
-------
None
") Reset;
		void Reset();

		/****************** SetArc ******************/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "Sets the values of a point which is on the arc a, at parameter param.

Parameters
----------
Tol: float
A: TopoDS_Edge
Param: float
TArc: TopAbs_Orientation

Returns
-------
None
") SetArc;
		void SetArc(const Standard_Real Tol, const TopoDS_Edge & A, const Standard_Real Param, const TopAbs_Orientation TArc);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Sets the value of the parameter on the spine.

Parameters
----------
Param: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real Param);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Set the 3d point for a commonpoint that is not a vertex or on an arc.

Parameters
----------
thePoint: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt & thePoint);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "This method set the fuzziness on the point.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****************** SetVector ******************/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "Set the output 3d vector.

Parameters
----------
theVector: gp_Vec

Returns
-------
None
") SetVector;
		void SetVector(const gp_Vec & theVector);

		/****************** SetVertex ******************/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface.

Parameters
----------
theVertex: TopoDS_Vertex

Returns
-------
None
") SetVertex;
		void SetVertex(const TopoDS_Vertex & theVertex);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "This method returns the fuzziness on the point.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** TransitionOnArc ******************/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Returns the transition of the point on the arc returned by arc().

Returns
-------
TopAbs_Orientation
") TransitionOnArc;
		TopAbs_Orientation TransitionOnArc();

		/****************** Vector ******************/
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "Returns the output 3d vector.

Returns
-------
gp_Vec
") Vector;
		const gp_Vec Vector();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the information about the point when it is on the domain of the first patch, i-e when the function isvertex returns true. otherwise, an exception is raised.

Returns
-------
TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex();

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
		/****************** ChFiDS_ElSpine ******************/
		%feature("compactdefaultargs") ChFiDS_ElSpine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_ElSpine;
		 ChFiDS_ElSpine();

		/****************** AddVertexWithTangent ******************/
		%feature("compactdefaultargs") AddVertexWithTangent;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAx1: gp_Ax1

Returns
-------
None
") AddVertexWithTangent;
		void AddVertexWithTangent(const gp_Ax1 & anAx1);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****************** ChangeNext ******************/
		%feature("compactdefaultargs") ChangeNext;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_SurfData>
") ChangeNext;
		opencascade::handle<ChFiDS_SurfData> & ChangeNext();

		/****************** ChangePrevious ******************/
		%feature("compactdefaultargs") ChangePrevious;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_SurfData>
") ChangePrevious;
		opencascade::handle<ChFiDS_SurfData> & ChangePrevious();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
AbsC: float
P: gp_Pnt

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real AbsC, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
AbsC: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real AbsC, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
AbsC: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real AbsC, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
AbsC: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real AbsC, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float

Returns
-------
None
") FirstParameter;
		void FirstParameter(const Standard_Real P);

		/****************** FirstPointAndTgt ******************/
		%feature("compactdefaultargs") FirstPointAndTgt;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
T: gp_Vec

Returns
-------
None
") FirstPointAndTgt;
		void FirstPointAndTgt(gp_Pnt & P, gp_Vec & T);

		/****************** GetSavedFirstParameter ******************/
		%feature("compactdefaultargs") GetSavedFirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetSavedFirstParameter;
		Standard_Real GetSavedFirstParameter();

		/****************** GetSavedLastParameter ******************/
		%feature("compactdefaultargs") GetSavedLastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetSavedLastParameter;
		Standard_Real GetSavedLastParameter();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		virtual GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float

Returns
-------
None
") LastParameter;
		void LastParameter(const Standard_Real P);

		/****************** LastPointAndTgt ******************/
		%feature("compactdefaultargs") LastPointAndTgt;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
T: gp_Vec

Returns
-------
None
") LastPointAndTgt;
		void LastPointAndTgt(gp_Pnt & P, gp_Vec & T);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVertices ******************/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_SurfData>
") Next;
		const opencascade::handle<ChFiDS_SurfData> & Next();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		virtual Standard_Real Period();

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_SurfData>
") Previous;
		const opencascade::handle<ChFiDS_SurfData> & Previous();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		virtual Standard_Real Resolution(const Standard_Real R3d);

		/****************** SaveFirstParameter ******************/
		%feature("compactdefaultargs") SaveFirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SaveFirstParameter;
		void SaveFirstParameter();

		/****************** SaveLastParameter ******************/
		%feature("compactdefaultargs") SaveLastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SaveLastParameter;
		void SaveLastParameter();

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") SetCurve;
		void SetCurve(const opencascade::handle<Geom_Curve> & C);

		/****************** SetFirstPointAndTgt ******************/
		%feature("compactdefaultargs") SetFirstPointAndTgt;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
T: gp_Vec

Returns
-------
None
") SetFirstPointAndTgt;
		void SetFirstPointAndTgt(const gp_Pnt & P, const gp_Vec & T);

		/****************** SetLastPointAndTgt ******************/
		%feature("compactdefaultargs") SetLastPointAndTgt;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
T: gp_Vec

Returns
-------
None
") SetLastPointAndTgt;
		void SetLastPointAndTgt(const gp_Pnt & P, const gp_Vec & T);

		/****************** SetOrigin ******************/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "No available documentation.

Parameters
----------
O: float

Returns
-------
None
") SetOrigin;
		void SetOrigin(const Standard_Real O);

		/****************** SetPeriodic ******************/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: bool

Returns
-------
None
") SetPeriodic;
		void SetPeriodic(const Standard_Boolean I);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Trim;
		virtual opencascade::handle<Adaptor3d_HCurve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
AbsC: float

Returns
-------
gp_Pnt
") Value;
		virtual gp_Pnt Value(const Standard_Real AbsC);

		/****************** VertexWithTangent ******************/
		%feature("compactdefaultargs") VertexWithTangent;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Ax1
") VertexWithTangent;
		const gp_Ax1 VertexWithTangent(const Standard_Integer Index);

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_FaceInterference;
		 ChFiDS_FaceInterference();

		/****************** ChangePCurveOnFace ******************/
		%feature("compactdefaultargs") ChangePCurveOnFace;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangePCurveOnFace;
		opencascade::handle<Geom2d_Curve> & ChangePCurveOnFace();

		/****************** ChangePCurveOnSurf ******************/
		%feature("compactdefaultargs") ChangePCurveOnSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangePCurveOnSurf;
		opencascade::handle<Geom2d_Curve> & ChangePCurveOnSurf();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LineIndex ******************/
		%feature("compactdefaultargs") LineIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") LineIndex;
		Standard_Integer LineIndex();

		/****************** PCurveOnFace ******************/
		%feature("compactdefaultargs") PCurveOnFace;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurveOnFace;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace();

		/****************** PCurveOnSurf ******************/
		%feature("compactdefaultargs") PCurveOnSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurveOnSurf;
		const opencascade::handle<Geom2d_Curve> & PCurveOnSurf();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsFirst: bool

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Boolean IsFirst);

		/****************** SetFirstParameter ******************/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float

Returns
-------
None
") SetFirstParameter;
		void SetFirstParameter(const Standard_Real U1);

		/****************** SetInterference ******************/
		%feature("compactdefaultargs") SetInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
LineIndex: int
Trans: TopAbs_Orientation
PCurv1: Geom2d_Curve
PCurv2: Geom2d_Curve

Returns
-------
None
") SetInterference;
		void SetInterference(const Standard_Integer LineIndex, const TopAbs_Orientation Trans, const opencascade::handle<Geom2d_Curve> & PCurv1, const opencascade::handle<Geom2d_Curve> & PCurv2);

		/****************** SetLastParameter ******************/
		%feature("compactdefaultargs") SetLastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float

Returns
-------
None
") SetLastParameter;
		void SetLastParameter(const Standard_Real U1);

		/****************** SetLineIndex ******************/
		%feature("compactdefaultargs") SetLineIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") SetLineIndex;
		void SetLineIndex(const Standard_Integer I);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float
IsFirst: bool

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real U1, const Standard_Boolean IsFirst);

		/****************** SetTransition ******************/
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
Trans: TopAbs_Orientation

Returns
-------
None
") SetTransition;
		void SetTransition(const TopAbs_Orientation Trans);

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Transition;
		TopAbs_Orientation Transition();

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
		%feature("autodoc", "Creates an empty genhcurve.

Returns
-------
None
") ChFiDS_HElSpine;
		 ChFiDS_HElSpine();

		/****************** ChFiDS_HElSpine ******************/
		%feature("compactdefaultargs") ChFiDS_HElSpine;
		%feature("autodoc", "Creates a genhcurve from a curve.

Parameters
----------
C: ChFiDS_ElSpine

Returns
-------
None
") ChFiDS_HElSpine;
		 ChFiDS_HElSpine(const ChFiDS_ElSpine & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
ChFiDS_ElSpine
") ChangeCurve;
		ChFiDS_ElSpine & ChangeCurve();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve.

Parameters
----------
C: ChFiDS_ElSpine

Returns
-------
None
") Set;
		void Set(const ChFiDS_ElSpine & C);

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
		%feature("autodoc", "Create an empty map.

Returns
-------
None
") ChFiDS_Map;
		 ChFiDS_Map();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const TopoDS_Shape & S);

		/****************** Fill ******************/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "Fills the map with the subshapes of type t1 as keys and the list of ancestors of type t2 as items.

Parameters
----------
S: TopoDS_Shape
T1: TopAbs_ShapeEnum
T2: TopAbs_ShapeEnum

Returns
-------
None
") Fill;
		void Fill(const TopoDS_Shape & S, const TopAbs_ShapeEnum T1, const TopAbs_ShapeEnum T2);

		/****************** FindFromIndex ******************/
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") FindFromIndex;
		const TopTools_ListOfShape & FindFromIndex(const Standard_Integer I);

		/****************** FindFromKey ******************/
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") FindFromKey;
		const TopTools_ListOfShape & FindFromKey(const TopoDS_Shape & S);

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_Regul;
		 ChFiDS_Regul();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curve;
		Standard_Integer Curve();

		/****************** IsSurface1 ******************/
		%feature("compactdefaultargs") IsSurface1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSurface1;
		Standard_Boolean IsSurface1();

		/****************** IsSurface2 ******************/
		%feature("compactdefaultargs") IsSurface2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSurface2;
		Standard_Boolean IsSurface2();

		/****************** S1 ******************/
		%feature("compactdefaultargs") S1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") S1;
		Standard_Integer S1();

		/****************** S2 ******************/
		%feature("compactdefaultargs") S2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") S2;
		Standard_Integer S2();

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
None
") SetCurve;
		void SetCurve(const Standard_Integer IC);

		/****************** SetS1 ******************/
		%feature("compactdefaultargs") SetS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
IS1: int
IsFace: bool,optional
	default value is Standard_True

Returns
-------
None
") SetS1;
		void SetS1(const Standard_Integer IS1, const Standard_Boolean IsFace = Standard_True);

		/****************** SetS2 ******************/
		%feature("compactdefaultargs") SetS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
IS2: int
IsFace: bool,optional
	default value is Standard_True

Returns
-------
None
") SetS2;
		void SetS2(const Standard_Integer IS2, const Standard_Boolean IsFace = Standard_True);

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
		/****************** ChFiDS_Spine ******************/
		%feature("compactdefaultargs") ChFiDS_Spine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_Spine;
		 ChFiDS_Spine();

		/****************** ChFiDS_Spine ******************/
		%feature("compactdefaultargs") ChFiDS_Spine;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") ChFiDS_Spine;
		 ChFiDS_Spine(const Standard_Real Tol);

		/****************** Absc ******************/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
float
") Absc;
		Standard_Real Absc(const Standard_Real U);

		/****************** Absc ******************/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
I: int

Returns
-------
float
") Absc;
		Standard_Real Absc(const Standard_Real U, const Standard_Integer I);

		/****************** Absc ******************/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
float
") Absc;
		Standard_Real Absc(const TopoDS_Vertex & V);

		/****************** AppendElSpine ******************/
		%feature("compactdefaultargs") AppendElSpine;
		%feature("autodoc", "No available documentation.

Parameters
----------
Els: ChFiDS_HElSpine

Returns
-------
None
") AppendElSpine;
		virtual void AppendElSpine(const opencascade::handle<ChFiDS_HElSpine> & Els);

		/****************** AppendOffsetElSpine ******************/
		%feature("compactdefaultargs") AppendOffsetElSpine;
		%feature("autodoc", "No available documentation.

Parameters
----------
Els: ChFiDS_HElSpine

Returns
-------
None
") AppendOffsetElSpine;
		virtual void AppendOffsetElSpine(const opencascade::handle<ChFiDS_HElSpine> & Els);

		/****************** ChangeElSpines ******************/
		%feature("compactdefaultargs") ChangeElSpines;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_ListOfHElSpine
") ChangeElSpines;
		ChFiDS_ListOfHElSpine & ChangeElSpines();

		/****************** ChangeOffsetElSpines ******************/
		%feature("compactdefaultargs") ChangeOffsetElSpines;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_ListOfHElSpine
") ChangeOffsetElSpines;
		ChFiDS_ListOfHElSpine & ChangeOffsetElSpines();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** CurrentElementarySpine ******************/
		%feature("compactdefaultargs") CurrentElementarySpine;
		%feature("autodoc", "Sets the current curve and returns it.

Parameters
----------
Index: int

Returns
-------
BRepAdaptor_Curve
") CurrentElementarySpine;
		const BRepAdaptor_Curve & CurrentElementarySpine(const Standard_Integer Index);

		/****************** CurrentIndexOfElementarySpine ******************/
		%feature("compactdefaultargs") CurrentIndexOfElementarySpine;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") CurrentIndexOfElementarySpine;
		Standard_Integer CurrentIndexOfElementarySpine();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
AbsC: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real AbsC, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
AbsC: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real AbsC, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
AbsC: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real AbsC, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** Edges ******************/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Edge
") Edges;
		const TopoDS_Edge Edges(const Standard_Integer I);

		/****************** ElSpine ******************/
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", "No available documentation.

Parameters
----------
IE: int

Returns
-------
opencascade::handle<ChFiDS_HElSpine>
") ElSpine;
		opencascade::handle<ChFiDS_HElSpine> ElSpine(const Standard_Integer IE);

		/****************** ElSpine ******************/
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
opencascade::handle<ChFiDS_HElSpine>
") ElSpine;
		opencascade::handle<ChFiDS_HElSpine> ElSpine(const TopoDS_Edge & E);

		/****************** ElSpine ******************/
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: float

Returns
-------
opencascade::handle<ChFiDS_HElSpine>
") ElSpine;
		opencascade::handle<ChFiDS_HElSpine> ElSpine(const Standard_Real W);

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_ErrorStatus
") ErrorStatus;
		ChFiDS_ErrorStatus ErrorStatus();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Gives the total length of all arcs before the number indexsp.

Parameters
----------
IndexSpine: int

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter(const Standard_Integer IndexSpine);

		/****************** FirstStatus ******************/
		%feature("compactdefaultargs") FirstStatus;
		%feature("autodoc", "Returns if the set of edges starts on a free boundary or if the first vertex is a breakpoint or if the set is closed.

Returns
-------
ChFiDS_State
") FirstStatus;
		ChFiDS_State FirstStatus();

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") FirstVertex;
		TopoDS_Vertex FirstVertex();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** HasFirstTgt ******************/
		%feature("compactdefaultargs") HasFirstTgt;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFirstTgt;
		Standard_Boolean HasFirstTgt();

		/****************** HasLastTgt ******************/
		%feature("compactdefaultargs") HasLastTgt;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasLastTgt;
		Standard_Boolean HasLastTgt();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: float
Forward: bool,optional
	default value is Standard_True

Returns
-------
int
") Index;
		Standard_Integer Index(const Standard_Real W, const Standard_Boolean Forward = Standard_True);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
int
") Index;
		Standard_Integer Index(const TopoDS_Edge & E);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsTangencyExtremity ******************/
		%feature("compactdefaultargs") IsTangencyExtremity;
		%feature("autodoc", "Returns if the set of edges starts (or end) on tangency point.

Parameters
----------
IsFirst: bool

Returns
-------
bool
") IsTangencyExtremity;
		Standard_Boolean IsTangencyExtremity(const Standard_Boolean IsFirst);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Gives the total length till the ark with number indexspine (inclus).

Parameters
----------
IndexSpine: int

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter(const Standard_Integer IndexSpine);

		/****************** LastStatus ******************/
		%feature("compactdefaultargs") LastStatus;
		%feature("autodoc", "Returns the state at the end of the set.

Returns
-------
ChFiDS_State
") LastStatus;
		ChFiDS_State LastStatus();

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") LastVertex;
		TopoDS_Vertex LastVertex();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Gives the length of ark with number indexsp.

Parameters
----------
IndexSpine: int

Returns
-------
float
") Length;
		Standard_Real Length(const Standard_Integer IndexSpine);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Prepare the guideline depending on the edges that are elementary arks (take parameters from a single curvilinear abscissa); to be able to call methods on the geometry (first,last,value,d1,d2) it is necessary to start with preparation otherwise an exception will be raised.

Returns
-------
None
") Load;
		void Load();

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return the mode of chamfers used.

Returns
-------
ChFiDS_ChamfMode
") Mode;
		ChFiDS_ChamfMode Mode();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** OffsetEdges ******************/
		%feature("compactdefaultargs") OffsetEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Edge
") OffsetEdges;
		const TopoDS_Edge OffsetEdges(const Standard_Integer I);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
AbsC: float
Oriented: bool,optional
	default value is Standard_True

Returns
-------
U: float
") Parameter;
		void Parameter(const Standard_Real AbsC, Standard_Real &OutValue, const Standard_Boolean Oriented = Standard_True);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
AbsC: float
Oriented: bool,optional
	default value is Standard_True

Returns
-------
U: float
") Parameter;
		void Parameter(const Standard_Integer Index, const Standard_Real AbsC, Standard_Real &OutValue, const Standard_Boolean Oriented = Standard_True);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** PutInFirst ******************/
		%feature("compactdefaultargs") PutInFirst;
		%feature("autodoc", "Store the edge at the first position before all others.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") PutInFirst;
		void PutInFirst(const TopoDS_Edge & E);

		/****************** PutInFirstOffset ******************/
		%feature("compactdefaultargs") PutInFirstOffset;
		%feature("autodoc", "Store the offset edge at the first position before all others.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") PutInFirstOffset;
		void PutInFirstOffset(const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "No available documentation.

Parameters
----------
AllData: bool,optional
	default value is Standard_False

Returns
-------
None
") Reset;
		virtual void Reset(const Standard_Boolean AllData = Standard_False);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** SetCurrent ******************/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") SetCurrent;
		void SetCurrent(const Standard_Integer Index);

		/****************** SetEdges ******************/
		%feature("compactdefaultargs") SetEdges;
		%feature("autodoc", "Store edges composing the guideline.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") SetEdges;
		void SetEdges(const TopoDS_Edge & E);

		/****************** SetErrorStatus ******************/
		%feature("compactdefaultargs") SetErrorStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
state: ChFiDS_ErrorStatus

Returns
-------
None
") SetErrorStatus;
		void SetErrorStatus(const ChFiDS_ErrorStatus state);

		/****************** SetFirstParameter ******************/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Par: float

Returns
-------
None
") SetFirstParameter;
		void SetFirstParameter(const Standard_Real Par);

		/****************** SetFirstStatus ******************/
		%feature("compactdefaultargs") SetFirstStatus;
		%feature("autodoc", "Stores if the start of a set of edges starts on a section of free border or forms a closed contour.

Parameters
----------
S: ChFiDS_State

Returns
-------
None
") SetFirstStatus;
		void SetFirstStatus(const ChFiDS_State S);

		/****************** SetFirstTgt ******************/
		%feature("compactdefaultargs") SetFirstTgt;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: float

Returns
-------
None
") SetFirstTgt;
		void SetFirstTgt(const Standard_Real W);

		/****************** SetLastParameter ******************/
		%feature("compactdefaultargs") SetLastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Par: float

Returns
-------
None
") SetLastParameter;
		void SetLastParameter(const Standard_Real Par);

		/****************** SetLastStatus ******************/
		%feature("compactdefaultargs") SetLastStatus;
		%feature("autodoc", "Stores if the end of a set of edges starts on a section of free border or forms a closed contour.

Parameters
----------
S: ChFiDS_State

Returns
-------
None
") SetLastStatus;
		void SetLastStatus(const ChFiDS_State S);

		/****************** SetLastTgt ******************/
		%feature("compactdefaultargs") SetLastTgt;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: float

Returns
-------
None
") SetLastTgt;
		void SetLastTgt(const Standard_Real W);

		/****************** SetOffsetEdges ******************/
		%feature("compactdefaultargs") SetOffsetEdges;
		%feature("autodoc", "Store offset edges composing the offset guideline.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") SetOffsetEdges;
		void SetOffsetEdges(const TopoDS_Edge & E);

		/****************** SetReference ******************/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "Set a parameter reference for the approx.

Parameters
----------
W: float

Returns
-------
None
") SetReference;
		void SetReference(const Standard_Real W);

		/****************** SetReference ******************/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "Set a parameter reference for the approx, at the middle of edge i.

Parameters
----------
I: int

Returns
-------
None
") SetReference;
		void SetReference(const Standard_Integer I);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: ChFiDS_State
IsFirst: bool

Returns
-------
None
") SetStatus;
		void SetStatus(const ChFiDS_State S, const Standard_Boolean IsFirst);

		/****************** SetTangencyExtremity ******************/
		%feature("compactdefaultargs") SetTangencyExtremity;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsTangency: bool
IsFirst: bool

Returns
-------
None
") SetTangencyExtremity;
		void SetTangencyExtremity(const Standard_Boolean IsTangency, const Standard_Boolean IsFirst);

		/****************** SplitDone ******************/
		%feature("compactdefaultargs") SplitDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SplitDone;
		Standard_Boolean SplitDone();

		/****************** SplitDone ******************/
		%feature("compactdefaultargs") SplitDone;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") SplitDone;
		void SplitDone(const Standard_Boolean B);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsFirst: bool

Returns
-------
ChFiDS_State
") Status;
		ChFiDS_State Status(const Standard_Boolean IsFirst);

		/****************** UnsetReference ******************/
		%feature("compactdefaultargs") UnsetReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetReference;
		void UnsetReference();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
AbsC: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real AbsC);

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_Stripe;
		 ChFiDS_Stripe();

		/****************** ChangeFirstCurve ******************/
		%feature("compactdefaultargs") ChangeFirstCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") ChangeFirstCurve;
		void ChangeFirstCurve(const Standard_Integer Index);

		/****************** ChangeFirstPCurve ******************/
		%feature("compactdefaultargs") ChangeFirstPCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangeFirstPCurve;
		opencascade::handle<Geom2d_Curve> & ChangeFirstPCurve();

		/****************** ChangeFirstParameters ******************/
		%feature("compactdefaultargs") ChangeFirstParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pdeb: float
Pfin: float

Returns
-------
None
") ChangeFirstParameters;
		void ChangeFirstParameters(const Standard_Real Pdeb, const Standard_Real Pfin);

		/****************** ChangeIndexFirstPointOnS1 ******************/
		%feature("compactdefaultargs") ChangeIndexFirstPointOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") ChangeIndexFirstPointOnS1;
		void ChangeIndexFirstPointOnS1(const Standard_Integer Index);

		/****************** ChangeIndexFirstPointOnS2 ******************/
		%feature("compactdefaultargs") ChangeIndexFirstPointOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") ChangeIndexFirstPointOnS2;
		void ChangeIndexFirstPointOnS2(const Standard_Integer Index);

		/****************** ChangeIndexLastPointOnS1 ******************/
		%feature("compactdefaultargs") ChangeIndexLastPointOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") ChangeIndexLastPointOnS1;
		void ChangeIndexLastPointOnS1(const Standard_Integer Index);

		/****************** ChangeIndexLastPointOnS2 ******************/
		%feature("compactdefaultargs") ChangeIndexLastPointOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") ChangeIndexLastPointOnS2;
		void ChangeIndexLastPointOnS2(const Standard_Integer Index);

		/****************** ChangeLastCurve ******************/
		%feature("compactdefaultargs") ChangeLastCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") ChangeLastCurve;
		void ChangeLastCurve(const Standard_Integer Index);

		/****************** ChangeLastPCurve ******************/
		%feature("compactdefaultargs") ChangeLastPCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangeLastPCurve;
		opencascade::handle<Geom2d_Curve> & ChangeLastPCurve();

		/****************** ChangeLastParameters ******************/
		%feature("compactdefaultargs") ChangeLastParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pdeb: float
Pfin: float

Returns
-------
None
") ChangeLastParameters;
		void ChangeLastParameters(const Standard_Real Pdeb, const Standard_Real Pfin);

		/****************** ChangePCurve ******************/
		%feature("compactdefaultargs") ChangePCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: bool

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangePCurve;
		opencascade::handle<Geom2d_Curve> & ChangePCurve(const Standard_Boolean First);

		/****************** ChangeSetOfSurfData ******************/
		%feature("compactdefaultargs") ChangeSetOfSurfData;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_HData>
") ChangeSetOfSurfData;
		opencascade::handle<ChFiDS_HData> & ChangeSetOfSurfData();

		/****************** ChangeSpine ******************/
		%feature("compactdefaultargs") ChangeSpine;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_Spine>
") ChangeSpine;
		opencascade::handle<ChFiDS_Spine> & ChangeSpine();

		/****************** Choix ******************/
		%feature("compactdefaultargs") Choix;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Choix;
		Standard_Integer Choix();

		/****************** Choix ******************/
		%feature("compactdefaultargs") Choix;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: int

Returns
-------
None
") Choix;
		void Choix(const Standard_Integer C);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: bool

Returns
-------
int
") Curve;
		Standard_Integer Curve(const Standard_Boolean First);

		/****************** FirstCurve ******************/
		%feature("compactdefaultargs") FirstCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FirstCurve;
		Standard_Integer FirstCurve();

		/****************** FirstPCurve ******************/
		%feature("compactdefaultargs") FirstPCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") FirstPCurve;
		const opencascade::handle<Geom2d_Curve> & FirstPCurve();

		/****************** FirstPCurveOrientation ******************/
		%feature("compactdefaultargs") FirstPCurveOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") FirstPCurveOrientation;
		TopAbs_Orientation FirstPCurveOrientation();

		/****************** FirstPCurveOrientation ******************/
		%feature("compactdefaultargs") FirstPCurveOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
O: TopAbs_Orientation

Returns
-------
None
") FirstPCurveOrientation;
		void FirstPCurveOrientation(const TopAbs_Orientation O);

		/****************** FirstParameters ******************/
		%feature("compactdefaultargs") FirstParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Pdeb: float
Pfin: float
") FirstParameters;
		void FirstParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** InDS ******************/
		%feature("compactdefaultargs") InDS;
		%feature("autodoc", "Set nb of surfdata's at end put in ds.

Parameters
----------
First: bool
Nb: int,optional
	default value is 1

Returns
-------
None
") InDS;
		void InDS(const Standard_Boolean First, const Standard_Integer Nb = 1);

		/****************** IndexFirstPointOnS1 ******************/
		%feature("compactdefaultargs") IndexFirstPointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexFirstPointOnS1;
		Standard_Integer IndexFirstPointOnS1();

		/****************** IndexFirstPointOnS2 ******************/
		%feature("compactdefaultargs") IndexFirstPointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexFirstPointOnS2;
		Standard_Integer IndexFirstPointOnS2();

		/****************** IndexLastPointOnS1 ******************/
		%feature("compactdefaultargs") IndexLastPointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexLastPointOnS1;
		Standard_Integer IndexLastPointOnS1();

		/****************** IndexLastPointOnS2 ******************/
		%feature("compactdefaultargs") IndexLastPointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexLastPointOnS2;
		Standard_Integer IndexLastPointOnS2();

		/****************** IndexPoint ******************/
		%feature("compactdefaultargs") IndexPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: bool
OnS: int

Returns
-------
int
") IndexPoint;
		Standard_Integer IndexPoint(const Standard_Boolean First, const Standard_Integer OnS);

		/****************** IsInDS ******************/
		%feature("compactdefaultargs") IsInDS;
		%feature("autodoc", "Returns nb of surfdata's at end being in ds.

Parameters
----------
First: bool

Returns
-------
int
") IsInDS;
		Standard_Integer IsInDS(const Standard_Boolean First);

		/****************** LastCurve ******************/
		%feature("compactdefaultargs") LastCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") LastCurve;
		Standard_Integer LastCurve();

		/****************** LastPCurve ******************/
		%feature("compactdefaultargs") LastPCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") LastPCurve;
		const opencascade::handle<Geom2d_Curve> & LastPCurve();

		/****************** LastPCurveOrientation ******************/
		%feature("compactdefaultargs") LastPCurveOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") LastPCurveOrientation;
		TopAbs_Orientation LastPCurveOrientation();

		/****************** LastPCurveOrientation ******************/
		%feature("compactdefaultargs") LastPCurveOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
O: TopAbs_Orientation

Returns
-------
None
") LastPCurveOrientation;
		void LastPCurveOrientation(const TopAbs_Orientation O);

		/****************** LastParameters ******************/
		%feature("compactdefaultargs") LastParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Pdeb: float
Pfin: float
") LastParameters;
		void LastParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnS: int

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation(const Standard_Integer OnS);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: bool

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation(const Standard_Boolean First);

		/****************** OrientationOnFace1 ******************/
		%feature("compactdefaultargs") OrientationOnFace1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") OrientationOnFace1;
		TopAbs_Orientation OrientationOnFace1();

		/****************** OrientationOnFace1 ******************/
		%feature("compactdefaultargs") OrientationOnFace1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Or1: TopAbs_Orientation

Returns
-------
None
") OrientationOnFace1;
		void OrientationOnFace1(const TopAbs_Orientation Or1);

		/****************** OrientationOnFace2 ******************/
		%feature("compactdefaultargs") OrientationOnFace2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") OrientationOnFace2;
		TopAbs_Orientation OrientationOnFace2();

		/****************** OrientationOnFace2 ******************/
		%feature("compactdefaultargs") OrientationOnFace2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Or2: TopAbs_Orientation

Returns
-------
None
") OrientationOnFace2;
		void OrientationOnFace2(const TopAbs_Orientation Or2);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: bool

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve(const Standard_Boolean First);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: bool

Returns
-------
Pdeb: float
Pfin: float
") Parameters;
		void Parameters(const Standard_Boolean First, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset everything except spine.

Returns
-------
None
") Reset;
		void Reset();

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
First: bool

Returns
-------
None
") SetCurve;
		void SetCurve(const Standard_Integer Index, const Standard_Boolean First);

		/****************** SetIndexPoint ******************/
		%feature("compactdefaultargs") SetIndexPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
First: bool
OnS: int

Returns
-------
None
") SetIndexPoint;
		void SetIndexPoint(const Standard_Integer Index, const Standard_Boolean First, const Standard_Integer OnS);

		/****************** SetOfSurfData ******************/
		%feature("compactdefaultargs") SetOfSurfData;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_HData>
") SetOfSurfData;
		const opencascade::handle<ChFiDS_HData> & SetOfSurfData();

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Or: TopAbs_Orientation
OnS: int

Returns
-------
None
") SetOrientation;
		void SetOrientation(const TopAbs_Orientation Or, const Standard_Integer OnS);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Or: TopAbs_Orientation
First: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const TopAbs_Orientation Or, const Standard_Boolean First);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: bool
Pdeb: float
Pfin: float

Returns
-------
None
") SetParameters;
		void SetParameters(const Standard_Boolean First, const Standard_Real Pdeb, const Standard_Real Pfin);

		/****************** SetSolidIndex ******************/
		%feature("compactdefaultargs") SetSolidIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") SetSolidIndex;
		void SetSolidIndex(const Standard_Integer Index);

		/****************** SolidIndex ******************/
		%feature("compactdefaultargs") SolidIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SolidIndex;
		Standard_Integer SolidIndex();

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_Spine>
") Spine;
		const opencascade::handle<ChFiDS_Spine> & Spine();

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
		/****************** ChFiDS_StripeMap ******************/
		%feature("compactdefaultargs") ChFiDS_StripeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_StripeMap;
		 ChFiDS_StripeMap();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex
F: ChFiDS_Stripe

Returns
-------
None
") Add;
		void Add(const TopoDS_Vertex & V, const opencascade::handle<ChFiDS_Stripe> & F);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** FindFromIndex ******************/
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
ChFiDS_ListOfStripe
") FindFromIndex;
		const ChFiDS_ListOfStripe & FindFromIndex(const Standard_Integer I);

		/****************** FindFromKey ******************/
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
ChFiDS_ListOfStripe
") FindFromKey;
		const ChFiDS_ListOfStripe & FindFromKey(const TopoDS_Vertex & V);

		/****************** FindKey ******************/
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Vertex
") FindKey;
		const TopoDS_Vertex FindKey(const Standard_Integer I);

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_SurfData;
		 ChFiDS_SurfData();

		/****************** ChangeIndexOfS1 ******************/
		%feature("compactdefaultargs") ChangeIndexOfS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") ChangeIndexOfS1;
		void ChangeIndexOfS1(const Standard_Integer Index);

		/****************** ChangeIndexOfS2 ******************/
		%feature("compactdefaultargs") ChangeIndexOfS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") ChangeIndexOfS2;
		void ChangeIndexOfS2(const Standard_Integer Index);

		/****************** ChangeInterference ******************/
		%feature("compactdefaultargs") ChangeInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnS: int

Returns
-------
ChFiDS_FaceInterference
") ChangeInterference;
		ChFiDS_FaceInterference & ChangeInterference(const Standard_Integer OnS);

		/****************** ChangeInterferenceOnS1 ******************/
		%feature("compactdefaultargs") ChangeInterferenceOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_FaceInterference
") ChangeInterferenceOnS1;
		ChFiDS_FaceInterference & ChangeInterferenceOnS1();

		/****************** ChangeInterferenceOnS2 ******************/
		%feature("compactdefaultargs") ChangeInterferenceOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_FaceInterference
") ChangeInterferenceOnS2;
		ChFiDS_FaceInterference & ChangeInterferenceOnS2();

		/****************** ChangeOrientation ******************/
		%feature("compactdefaultargs") ChangeOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation();

		/****************** ChangeSurf ******************/
		%feature("compactdefaultargs") ChangeSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") ChangeSurf;
		void ChangeSurf(const Standard_Integer Index);

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Returns one of the four vertices wether first is true or wrong and ons equals 1 or 2.

Parameters
----------
First: bool
OnS: int

Returns
-------
ChFiDS_CommonPoint
") ChangeVertex;
		ChFiDS_CommonPoint & ChangeVertex(const Standard_Boolean First, const Standard_Integer OnS);

		/****************** ChangeVertexFirstOnS1 ******************/
		%feature("compactdefaultargs") ChangeVertexFirstOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") ChangeVertexFirstOnS1;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS1();

		/****************** ChangeVertexFirstOnS2 ******************/
		%feature("compactdefaultargs") ChangeVertexFirstOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") ChangeVertexFirstOnS2;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS2();

		/****************** ChangeVertexLastOnS1 ******************/
		%feature("compactdefaultargs") ChangeVertexLastOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") ChangeVertexLastOnS1;
		ChFiDS_CommonPoint & ChangeVertexLastOnS1();

		/****************** ChangeVertexLastOnS2 ******************/
		%feature("compactdefaultargs") ChangeVertexLastOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") ChangeVertexLastOnS2;
		ChFiDS_CommonPoint & ChangeVertexLastOnS2();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: ChFiDS_SurfData

Returns
-------
None
") Copy;
		void Copy(const opencascade::handle<ChFiDS_SurfData> & Other);

		/****************** FirstExtensionValue ******************/
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstExtensionValue;
		Standard_Real FirstExtensionValue();

		/****************** FirstExtensionValue ******************/
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
Extend: float

Returns
-------
None
") FirstExtensionValue;
		void FirstExtensionValue(const Standard_Real Extend);

		/****************** FirstSpineParam ******************/
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstSpineParam;
		Standard_Real FirstSpineParam();

		/****************** FirstSpineParam ******************/
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", "No available documentation.

Parameters
----------
Par: float

Returns
-------
None
") FirstSpineParam;
		void FirstSpineParam(const Standard_Real Par);

		/****************** Get2dPoints ******************/
		%feature("compactdefaultargs") Get2dPoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: bool
OnS: int

Returns
-------
gp_Pnt2d
") Get2dPoints;
		gp_Pnt2d Get2dPoints(const Standard_Boolean First, const Standard_Integer OnS);

		/****************** Get2dPoints ******************/
		%feature("compactdefaultargs") Get2dPoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
P2df1: gp_Pnt2d
P2dl1: gp_Pnt2d
P2df2: gp_Pnt2d
P2dl2: gp_Pnt2d

Returns
-------
None
") Get2dPoints;
		void Get2dPoints(gp_Pnt2d & P2df1, gp_Pnt2d & P2dl1, gp_Pnt2d & P2df2, gp_Pnt2d & P2dl2);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
OfS: int

Returns
-------
int
") Index;
		Standard_Integer Index(const Standard_Integer OfS);

		/****************** IndexOfC ******************/
		%feature("compactdefaultargs") IndexOfC;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnS: int

Returns
-------
int
") IndexOfC;
		Standard_Integer IndexOfC(const Standard_Integer OnS);

		/****************** IndexOfC1 ******************/
		%feature("compactdefaultargs") IndexOfC1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexOfC1;
		Standard_Integer IndexOfC1();

		/****************** IndexOfC2 ******************/
		%feature("compactdefaultargs") IndexOfC2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexOfC2;
		Standard_Integer IndexOfC2();

		/****************** IndexOfS1 ******************/
		%feature("compactdefaultargs") IndexOfS1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexOfS1;
		Standard_Integer IndexOfS1();

		/****************** IndexOfS2 ******************/
		%feature("compactdefaultargs") IndexOfS2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexOfS2;
		Standard_Integer IndexOfS2();

		/****************** Interference ******************/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnS: int

Returns
-------
ChFiDS_FaceInterference
") Interference;
		const ChFiDS_FaceInterference & Interference(const Standard_Integer OnS);

		/****************** InterferenceOnS1 ******************/
		%feature("compactdefaultargs") InterferenceOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_FaceInterference
") InterferenceOnS1;
		const ChFiDS_FaceInterference & InterferenceOnS1();

		/****************** InterferenceOnS2 ******************/
		%feature("compactdefaultargs") InterferenceOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_FaceInterference
") InterferenceOnS2;
		const ChFiDS_FaceInterference & InterferenceOnS2();

		/****************** IsOnCurve ******************/
		%feature("compactdefaultargs") IsOnCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnS: int

Returns
-------
bool
") IsOnCurve;
		Standard_Boolean IsOnCurve(const Standard_Integer OnS);

		/****************** IsOnCurve1 ******************/
		%feature("compactdefaultargs") IsOnCurve1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOnCurve1;
		Standard_Boolean IsOnCurve1();

		/****************** IsOnCurve2 ******************/
		%feature("compactdefaultargs") IsOnCurve2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOnCurve2;
		Standard_Boolean IsOnCurve2();

		/****************** LastExtensionValue ******************/
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastExtensionValue;
		Standard_Real LastExtensionValue();

		/****************** LastExtensionValue ******************/
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
Extend: float

Returns
-------
None
") LastExtensionValue;
		void LastExtensionValue(const Standard_Real Extend);

		/****************** LastSpineParam ******************/
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastSpineParam;
		Standard_Real LastSpineParam();

		/****************** LastSpineParam ******************/
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", "No available documentation.

Parameters
----------
Par: float

Returns
-------
None
") LastSpineParam;
		void LastSpineParam(const Standard_Real Par);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** ResetSimul ******************/
		%feature("compactdefaultargs") ResetSimul;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetSimul;
		void ResetSimul();

		/****************** Set2dPoints ******************/
		%feature("compactdefaultargs") Set2dPoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
P2df1: gp_Pnt2d
P2dl1: gp_Pnt2d
P2df2: gp_Pnt2d
P2dl2: gp_Pnt2d

Returns
-------
None
") Set2dPoints;
		void Set2dPoints(const gp_Pnt2d & P2df1, const gp_Pnt2d & P2dl1, const gp_Pnt2d & P2df2, const gp_Pnt2d & P2dl2);

		/****************** SetIndexOfC1 ******************/
		%feature("compactdefaultargs") SetIndexOfC1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") SetIndexOfC1;
		void SetIndexOfC1(const Standard_Integer Index);

		/****************** SetIndexOfC2 ******************/
		%feature("compactdefaultargs") SetIndexOfC2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
None
") SetIndexOfC2;
		void SetIndexOfC2(const Standard_Integer Index);

		/****************** SetSimul ******************/
		%feature("compactdefaultargs") SetSimul;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Transient

Returns
-------
None
") SetSimul;
		void SetSimul(const opencascade::handle<Standard_Transient> & S);

		/****************** Simul ******************/
		%feature("compactdefaultargs") Simul;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Transient>
") Simul;
		opencascade::handle<Standard_Transient> Simul();

		/****************** Surf ******************/
		%feature("compactdefaultargs") Surf;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Surf;
		Standard_Integer Surf();

		/****************** TwistOnS1 ******************/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		Standard_Boolean TwistOnS1();

		/****************** TwistOnS1 ******************/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: bool

Returns
-------
None
") TwistOnS1;
		void TwistOnS1(const Standard_Boolean T);

		/****************** TwistOnS2 ******************/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS2;
		Standard_Boolean TwistOnS2();

		/****************** TwistOnS2 ******************/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: bool

Returns
-------
None
") TwistOnS2;
		void TwistOnS2(const Standard_Boolean T);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns one of the four vertices wether first is true or wrong and ons equals 1 or 2.

Parameters
----------
First: bool
OnS: int

Returns
-------
ChFiDS_CommonPoint
") Vertex;
		const ChFiDS_CommonPoint & Vertex(const Standard_Boolean First, const Standard_Integer OnS);

		/****************** VertexFirstOnS1 ******************/
		%feature("compactdefaultargs") VertexFirstOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") VertexFirstOnS1;
		const ChFiDS_CommonPoint & VertexFirstOnS1();

		/****************** VertexFirstOnS2 ******************/
		%feature("compactdefaultargs") VertexFirstOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") VertexFirstOnS2;
		const ChFiDS_CommonPoint & VertexFirstOnS2();

		/****************** VertexLastOnS1 ******************/
		%feature("compactdefaultargs") VertexLastOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") VertexLastOnS1;
		const ChFiDS_CommonPoint & VertexLastOnS1();

		/****************** VertexLastOnS2 ******************/
		%feature("compactdefaultargs") VertexLastOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") VertexLastOnS2;
		const ChFiDS_CommonPoint & VertexLastOnS2();

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine();

		/****************** ChFiDS_ChamfSpine ******************/
		%feature("compactdefaultargs") ChFiDS_ChamfSpine;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine(const Standard_Real Tol);

		/****************** Dists ******************/
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Dis1: float
Dis2: float
") Dists;
		void Dists(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetDist ******************/
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Dis: float
") GetDist;
		void GetDist(Standard_Real &OutValue);

		/****************** GetDistAngle ******************/
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Dis: float
Angle: float
") GetDistAngle;
		void GetDistAngle(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsChamfer ******************/
		%feature("compactdefaultargs") IsChamfer;
		%feature("autodoc", "Return the method of chamfers used.

Returns
-------
ChFiDS_ChamfMethod
") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer();

		/****************** SetDist ******************/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dis: float

Returns
-------
None
") SetDist;
		void SetDist(const Standard_Real Dis);

		/****************** SetDistAngle ******************/
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dis: float
Angle: float

Returns
-------
None
") SetDistAngle;
		void SetDistAngle(const Standard_Real Dis, const Standard_Real Angle);

		/****************** SetDists ******************/
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dis1: float
Dis2: float

Returns
-------
None
") SetDists;
		void SetDists(const Standard_Real Dis1, const Standard_Real Dis2);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMode: ChFiDS_ChamfMode

Returns
-------
None
") SetMode;
		void SetMode(const ChFiDS_ChamfMode theMode);

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
		/****************** ChFiDS_FilSpine ******************/
		%feature("compactdefaultargs") ChFiDS_FilSpine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_FilSpine;
		 ChFiDS_FilSpine();

		/****************** ChFiDS_FilSpine ******************/
		%feature("compactdefaultargs") ChFiDS_FilSpine;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") ChFiDS_FilSpine;
		 ChFiDS_FilSpine(const Standard_Real Tol);

		/****************** AppendElSpine ******************/
		%feature("compactdefaultargs") AppendElSpine;
		%feature("autodoc", "No available documentation.

Parameters
----------
Els: ChFiDS_HElSpine

Returns
-------
None
") AppendElSpine;
		virtual void AppendElSpine(const opencascade::handle<ChFiDS_HElSpine> & Els);

		/****************** ChangeLaw ******************/
		%feature("compactdefaultargs") ChangeLaw;
		%feature("autodoc", "Returns the elementary law.

Parameters
----------
E: TopoDS_Edge

Returns
-------
opencascade::handle<Law_Function>
") ChangeLaw;
		opencascade::handle<Law_Function> & ChangeLaw(const TopoDS_Edge & E);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Returns true if the radius is constant all along the spine.

Returns
-------
bool
") IsConstant;
		Standard_Boolean IsConstant();

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Returns true if the radius is constant all along the edge e.

Parameters
----------
IE: int

Returns
-------
bool
") IsConstant;
		Standard_Boolean IsConstant(const Standard_Integer IE);

		/****************** Law ******************/
		%feature("compactdefaultargs") Law;
		%feature("autodoc", "No available documentation.

Parameters
----------
Els: ChFiDS_HElSpine

Returns
-------
opencascade::handle<Law_Composite>
") Law;
		opencascade::handle<Law_Composite> Law(const opencascade::handle<ChFiDS_HElSpine> & Els);

		/****************** MaxRadFromSeqAndLaws ******************/
		%feature("compactdefaultargs") MaxRadFromSeqAndLaws;
		%feature("autodoc", "Returns the maximum radius if the fillet is non-constant.

Returns
-------
float
") MaxRadFromSeqAndLaws;
		Standard_Real MaxRadFromSeqAndLaws();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius if the fillet is constant all along the spine.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius if the fillet is constant all along the edge e.

Parameters
----------
IE: int

Returns
-------
float
") Radius;
		Standard_Real Radius(const Standard_Integer IE);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius if the fillet is constant all along the edge e.

Parameters
----------
E: TopoDS_Edge

Returns
-------
float
") Radius;
		Standard_Real Radius(const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "No available documentation.

Parameters
----------
AllData: bool,optional
	default value is Standard_False

Returns
-------
None
") Reset;
		virtual void Reset(const Standard_Boolean AllData = Standard_False);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Initializes the constant vector on edge e.

Parameters
----------
Radius: float
E: TopoDS_Edge

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real Radius, const TopoDS_Edge & E);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Initializes the vector on vertex v.

Parameters
----------
Radius: float
V: TopoDS_Vertex

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real Radius, const TopoDS_Vertex & V);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Initializes the vector on the point of parameter w.

Parameters
----------
UandR: gp_XY
IinC: int

Returns
-------
None
") SetRadius;
		void SetRadius(const gp_XY & UandR, const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Initializes the constant vector on all spine.

Parameters
----------
Radius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real Radius);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Initializes the rule of evolution on all spine.

Parameters
----------
C: Law_Function
IinC: int

Returns
-------
None
") SetRadius;
		void SetRadius(const opencascade::handle<Law_Function> & C, const Standard_Integer IinC);

		/****************** UnSetRadius ******************/
		%feature("compactdefaultargs") UnSetRadius;
		%feature("autodoc", "Resets the constant vector on edge e.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") UnSetRadius;
		void UnSetRadius(const TopoDS_Edge & E);

		/****************** UnSetRadius ******************/
		%feature("compactdefaultargs") UnSetRadius;
		%feature("autodoc", "Resets the vector on vertex v.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
None
") UnSetRadius;
		void UnSetRadius(const TopoDS_Vertex & V);

};


%make_alias(ChFiDS_FilSpine)

%extend ChFiDS_FilSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class ChFiDS_SecHArray1 : public ChFiDS_SecArray1, public Standard_Transient {
  public:
    ChFiDS_SecHArray1(const Standard_Integer theLower, const Standard_Integer theUpper);
    ChFiDS_SecHArray1(const Standard_Integer theLower, const Standard_Integer theUpper, const ChFiDS_SecArray1::value_type& theValue);
    ChFiDS_SecHArray1(const ChFiDS_SecArray1& theOther);
    const ChFiDS_SecArray1& Array1();
    ChFiDS_SecArray1& ChangeArray1();
};
%make_alias(ChFiDS_SecHArray1)

/* harray2 classes */
/* hsequence classes */
class ChFiDS_HData : public ChFiDS_SequenceOfSurfData, public Standard_Transient {
  public:
    ChFiDS_HData();
    ChFiDS_HData(const ChFiDS_SequenceOfSurfData& theOther);
    const ChFiDS_SequenceOfSurfData& Sequence();
    void Append (const ChFiDS_SequenceOfSurfData::value_type& theItem);
    void Append (ChFiDS_SequenceOfSurfData& theSequence);
    ChFiDS_SequenceOfSurfData& ChangeSequence();
};
%make_alias(ChFiDS_HData)


