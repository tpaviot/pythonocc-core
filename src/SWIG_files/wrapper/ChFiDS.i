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
		/**** md5 signature: 6523e873553d9df45ab3ab97e227ce1f ****/
		%feature("compactdefaultargs") ChFiDS_CircSection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_CircSection;
		 ChFiDS_CircSection();

		/****************** Get ******************/
		/**** md5 signature: a1f8c105562696f8f7b9cb3c76886f3b ****/
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
		/**** md5 signature: 308ba452ddd6c0ba74516bc55b787d5c ****/
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
		/**** md5 signature: f809c774b4f408588ecfa44007642c36 ****/
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
		/**** md5 signature: 51063ff92fa3854b20788a299c724e02 ****/
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
		/**** md5 signature: 1caa644f6c5ddee79ec165570f0bf85e ****/
		%feature("compactdefaultargs") ChFiDS_CommonPoint;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ChFiDS_CommonPoint;
		 ChFiDS_CommonPoint();

		/****************** Arc ******************/
		/**** md5 signature: 5ad70ec93182770590e68292096cc021 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Returns the arc of restriction containing the vertex.

Returns
-------
TopoDS_Edge
") Arc;
		const TopoDS_Edge Arc();

		/****************** HasVector ******************/
		/**** md5 signature: cdf1102fba87269c204cf4398c655af3 ****/
		%feature("compactdefaultargs") HasVector;
		%feature("autodoc", "Returns true if the output vector is stored.

Returns
-------
bool
") HasVector;
		Standard_Boolean HasVector();

		/****************** IsOnArc ******************/
		/**** md5 signature: b03b70dd2ee9f895b787f6dbe3e85ce3 ****/
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "Returns true if the point is a on an edge of the initial restriction facet of the surface.

Returns
-------
bool
") IsOnArc;
		Standard_Boolean IsOnArc();

		/****************** IsVertex ******************/
		/**** md5 signature: 856b3bdfdec770bc63025788388af574 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the surface.

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter the paramter on the spine.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ParameterOnArc ******************/
		/**** md5 signature: 53d2051734836b1f3c7d9edd7c3c1884 ****/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Returns the parameter of the point on the arc returned by the method arc().

Returns
-------
float
") ParameterOnArc;
		Standard_Real ParameterOnArc();

		/****************** Point ******************/
		/**** md5 signature: 4e742d9ca138939180edee86d3b37a8f ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the 3d point.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Default value for all fields.

Returns
-------
None
") Reset;
		void Reset();

		/****************** SetArc ******************/
		/**** md5 signature: dd555be3b4e20b36002df68268f8cf7b ****/
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
		/**** md5 signature: 26222f3f8c770197bec88d8e30e2baa3 ****/
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
		/**** md5 signature: 68bd126cf7c8875dfaa4eadfc6d81506 ****/
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
		/**** md5 signature: 44b5b8eb060c2e3cbf3e6124065a0e26 ****/
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
		/**** md5 signature: f00faab372d6b4314d8a10832bbb9931 ****/
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
		/**** md5 signature: a34e1fba1fe64766525e67d94c7483ae ****/
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
		/**** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "This method returns the fuzziness on the point.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** TransitionOnArc ******************/
		/**** md5 signature: e46e4c017a4b2c34dda6e6f7744be5bc ****/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Returns the transition of the point on the arc returned by arc().

Returns
-------
TopAbs_Orientation
") TransitionOnArc;
		TopAbs_Orientation TransitionOnArc();

		/****************** Vector ******************/
		/**** md5 signature: 1a7a96c96ed619e286fdaba7a529667d ****/
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "Returns the output 3d vector.

Returns
-------
gp_Vec
") Vector;
		const gp_Vec Vector();

		/****************** Vertex ******************/
		/**** md5 signature: f6b9d30df043abdbae2c9dffcc672395 ****/
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
		/**** md5 signature: a9de632b7a9fa8e53f36b2ec4b34338f ****/
		%feature("compactdefaultargs") ChFiDS_ElSpine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_ElSpine;
		 ChFiDS_ElSpine();

		/****************** AddVertexWithTangent ******************/
		/**** md5 signature: d4168c525b75434c9db32f9bfffa9982 ****/
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
		/**** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****************** ChangeNext ******************/
		/**** md5 signature: faf634b7d93d7e19adce6371de2a76ac ****/
		%feature("compactdefaultargs") ChangeNext;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_SurfData>
") ChangeNext;
		opencascade::handle<ChFiDS_SurfData> & ChangeNext();

		/****************** ChangePrevious ******************/
		/**** md5 signature: 227fdc4f29720a58cc13f577ea0b5ba4 ****/
		%feature("compactdefaultargs") ChangePrevious;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_SurfData>
") ChangePrevious;
		opencascade::handle<ChFiDS_SurfData> & ChangePrevious();

		/****************** Circle ******************/
		/**** md5 signature: 5f382e7a6af009845ea6e16d54814298 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		/**** md5 signature: df369f5511c6c7a731860654c0a9c298 ****/
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
		/**** md5 signature: 3b92546c7cd3f352b04381c39c25dd0a ****/
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
		/**** md5 signature: 28864d9f51b38b7472bc2136e503c2d9 ****/
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
		/**** md5 signature: 34fe4c1ec1dee0428cc3c133ef021b7c ****/
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
		/**** md5 signature: e9a77f14e9bbca29370202de404ea9c1 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse();

		/****************** FirstParameter ******************/
		/**** md5 signature: 4764beb92499e70705c5628a20961327 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** FirstParameter ******************/
		/**** md5 signature: f70a98e5455eda40d623400b3a7621bd ****/
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
		/**** md5 signature: 9251482358a41a8213a518ba9d7054fd ****/
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
		/**** md5 signature: 75db463c8364b8f77f9e3de51ecbedc6 ****/
		%feature("compactdefaultargs") GetSavedFirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetSavedFirstParameter;
		Standard_Real GetSavedFirstParameter();

		/****************** GetSavedLastParameter ******************/
		/**** md5 signature: 6c55b3c4ecd4337f064cf9ed6c0eecaa ****/
		%feature("compactdefaultargs") GetSavedLastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetSavedLastParameter;
		Standard_Real GetSavedLastParameter();

		/****************** GetType ******************/
		/**** md5 signature: 33b481526e57ba1551397943374a197a ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		virtual GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: a96ca49b2ad017b35bb09d0b86cb690d ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola();

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 13a0a38f32e22e8a1ec5aa34cbf9bbea ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: 51650ab8b3afb0a24f930d23afae31ca ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** LastParameter ******************/
		/**** md5 signature: 960ed927a400b05e09d04421f57f40c3 ****/
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
		/**** md5 signature: 93100e74cc6db5e39d9d8d1a6cf42013 ****/
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
		/**** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: 435b05539d6b9d704dc04d9218f26996 ****/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** Next ******************/
		/**** md5 signature: 39ca926c37bee1c887d1f87f377ea7fd ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_SurfData>
") Next;
		const opencascade::handle<ChFiDS_SurfData> & Next();

		/****************** Parabola ******************/
		/**** md5 signature: 68860abab63fd184ea5c7eb97f0762c1 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola();

		/****************** Period ******************/
		/**** md5 signature: a0af1de0407384df43b0e76d6b472231 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		virtual Standard_Real Period();

		/****************** Previous ******************/
		/**** md5 signature: e96ad254506925dd4b71cfbc11e5467e ****/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_SurfData>
") Previous;
		const opencascade::handle<ChFiDS_SurfData> & Previous();

		/****************** Resolution ******************/
		/**** md5 signature: ff921b502a972d22db1a77196e34d53d ****/
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
		/**** md5 signature: ef62d193c97ecc49ce192ba3a979c7aa ****/
		%feature("compactdefaultargs") SaveFirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SaveFirstParameter;
		void SaveFirstParameter();

		/****************** SaveLastParameter ******************/
		/**** md5 signature: 213b0924cd909f6165eac15bb3180fd1 ****/
		%feature("compactdefaultargs") SaveLastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SaveLastParameter;
		void SaveLastParameter();

		/****************** SetCurve ******************/
		/**** md5 signature: 33a6119977a9c465ffe7769b5dc4e7f5 ****/
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
		/**** md5 signature: bfdf2f3c452f6d8c0a2157549e43a8fc ****/
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
		/**** md5 signature: 4197c08886ae9cb26ecc386f3c2dc846 ****/
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
		/**** md5 signature: 90772090782b64db2bef099a0d3c0950 ****/
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
		/**** md5 signature: 350f9c15209db2caa06ef8c73d0952ea ****/
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
		/**** md5 signature: c735575affdd5b96379885f735055329 ****/
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
		/**** md5 signature: ba8231e7dc3a72ecafee01b4eb348bbe ****/
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
		/**** md5 signature: 8a3fc0491ddd2e2bccd694dc8b3d06ef ****/
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
		/**** md5 signature: 726bb55f5f15f401281cd7e8a0f99392 ****/
		%feature("compactdefaultargs") ChFiDS_FaceInterference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_FaceInterference;
		 ChFiDS_FaceInterference();

		/****************** ChangePCurveOnFace ******************/
		/**** md5 signature: a4ac08e5cc5b6094d4ba91d7988200d3 ****/
		%feature("compactdefaultargs") ChangePCurveOnFace;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangePCurveOnFace;
		opencascade::handle<Geom2d_Curve> & ChangePCurveOnFace();

		/****************** ChangePCurveOnSurf ******************/
		/**** md5 signature: 93c521145058d145231b405856b20de6 ****/
		%feature("compactdefaultargs") ChangePCurveOnSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangePCurveOnSurf;
		opencascade::handle<Geom2d_Curve> & ChangePCurveOnSurf();

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** LastParameter ******************/
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LineIndex ******************/
		/**** md5 signature: af9fb0debe68e98e2e0bb7899c89cba3 ****/
		%feature("compactdefaultargs") LineIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") LineIndex;
		Standard_Integer LineIndex();

		/****************** PCurveOnFace ******************/
		/**** md5 signature: 9ffab450fa8f2ab4e8bb4275bd561666 ****/
		%feature("compactdefaultargs") PCurveOnFace;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurveOnFace;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace();

		/****************** PCurveOnSurf ******************/
		/**** md5 signature: 8e550434dd2628b5a0b4330a9c950bb2 ****/
		%feature("compactdefaultargs") PCurveOnSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurveOnSurf;
		const opencascade::handle<Geom2d_Curve> & PCurveOnSurf();

		/****************** Parameter ******************/
		/**** md5 signature: 6e1a73f976dcd9d42920accd4007f409 ****/
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
		/**** md5 signature: 66a146ecdaa6c152259c9690094161f5 ****/
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
		/**** md5 signature: a98dba3aad417a54ca288a277242d9c2 ****/
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
		/**** md5 signature: 4fb4fec24280eed5cf49207ba2a859cb ****/
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
		/**** md5 signature: a5c84457c710effed03309c68b7e0080 ****/
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
		/**** md5 signature: d404d706cf6c6419b8088620190503fe ****/
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
		/**** md5 signature: c6b23800a90c4cbe4b35094ba16f44ff ****/
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
		/**** md5 signature: 054591dc4fd0ee1810f89fdf4fe89b33 ****/
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
		/**** md5 signature: 14cc5f50ca22e74292b90d37e71bd1d1 ****/
		%feature("compactdefaultargs") ChFiDS_HElSpine;
		%feature("autodoc", "Creates an empty genhcurve.

Returns
-------
None
") ChFiDS_HElSpine;
		 ChFiDS_HElSpine();

		/****************** ChFiDS_HElSpine ******************/
		/**** md5 signature: 881e265c949a20712e30325911070229 ****/
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
		/**** md5 signature: 9c60c84b9c5da383bfcdec014873f6f7 ****/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
ChFiDS_ElSpine
") ChangeCurve;
		ChFiDS_ElSpine & ChangeCurve();

		/****************** Curve ******************/
		/**** md5 signature: a89f0959dbb9c3c030843720c3636148 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve();

		/****************** GetCurve ******************/
		/**** md5 signature: 73b397b3522011e6948956523664e20c ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve();

		/****************** Set ******************/
		/**** md5 signature: 53cc31f3591dcb70faa37e999b7a651c ****/
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
		/**** md5 signature: 973dad57111b92e094842a23e8548091 ****/
		%feature("compactdefaultargs") ChFiDS_Map;
		%feature("autodoc", "Create an empty map.

Returns
-------
None
") ChFiDS_Map;
		 ChFiDS_Map();

		/****************** Contains ******************/
		/**** md5 signature: f099b22f53dc3705b9de7f86b775b20a ****/
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
		/**** md5 signature: 5e4d793db169463c7138d45a1bebb3bd ****/
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
		/**** md5 signature: e27fc1939ed1a458284d9db1fe7832e5 ****/
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
		/**** md5 signature: f822fc0350ed0d0f3926ef4f484545ff ****/
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
		/**** md5 signature: b643b3f2994d7987080efae23eeb868b ****/
		%feature("compactdefaultargs") ChFiDS_Regul;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_Regul;
		 ChFiDS_Regul();

		/****************** Curve ******************/
		/**** md5 signature: 246fcc6b84e8ea0976c82438745a18e2 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curve;
		Standard_Integer Curve();

		/****************** IsSurface1 ******************/
		/**** md5 signature: 1c53bb199493b75cd867c8b8f1857b7e ****/
		%feature("compactdefaultargs") IsSurface1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSurface1;
		Standard_Boolean IsSurface1();

		/****************** IsSurface2 ******************/
		/**** md5 signature: 3786cfa4e1033fd0661f2149711c4979 ****/
		%feature("compactdefaultargs") IsSurface2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSurface2;
		Standard_Boolean IsSurface2();

		/****************** S1 ******************/
		/**** md5 signature: 7361e2dcae16373490107e5583aaf589 ****/
		%feature("compactdefaultargs") S1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") S1;
		Standard_Integer S1();

		/****************** S2 ******************/
		/**** md5 signature: c836932bf1af4e841c58b4c6a36aeaf0 ****/
		%feature("compactdefaultargs") S2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") S2;
		Standard_Integer S2();

		/****************** SetCurve ******************/
		/**** md5 signature: ba1234c816a1bb5dd773be07b8fffae8 ****/
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
		/**** md5 signature: d114cea9a6abd7c04e0272eb6007472c ****/
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
		/**** md5 signature: 5178f4086ad526928fce374b96c2fec1 ****/
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
		/**** md5 signature: 0e6c96be283b45848a0526cfc52ba787 ****/
		%feature("compactdefaultargs") ChFiDS_Spine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_Spine;
		 ChFiDS_Spine();

		/****************** ChFiDS_Spine ******************/
		/**** md5 signature: 69bf141eeae74093a4bfd1758f04012c ****/
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
		/**** md5 signature: 0fcb71e8c4d0991d4bf628fec7467762 ****/
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
		/**** md5 signature: 675de99f7389e5730307190bef4c9a62 ****/
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
		/**** md5 signature: 73e436bf62d13ac2b7905d3f4ff661eb ****/
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
		/**** md5 signature: 56e42dc92b1863fef793a7b893355531 ****/
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
		/**** md5 signature: a3f67a1f5563c994bda1222e7915f9c8 ****/
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
		/**** md5 signature: da07220d851808a3a9bd3eb7b7c1f436 ****/
		%feature("compactdefaultargs") ChangeElSpines;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_ListOfHElSpine
") ChangeElSpines;
		ChFiDS_ListOfHElSpine & ChangeElSpines();

		/****************** ChangeOffsetElSpines ******************/
		/**** md5 signature: df5b593fad1988821c82858086d7da93 ****/
		%feature("compactdefaultargs") ChangeOffsetElSpines;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_ListOfHElSpine
") ChangeOffsetElSpines;
		ChFiDS_ListOfHElSpine & ChangeOffsetElSpines();

		/****************** Circle ******************/
		/**** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** CurrentElementarySpine ******************/
		/**** md5 signature: ebf570cca4dd01a3b354a55130d60083 ****/
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
		/**** md5 signature: 6987473580f0e6e3e57d9cf51fd473ea ****/
		%feature("compactdefaultargs") CurrentIndexOfElementarySpine;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") CurrentIndexOfElementarySpine;
		Standard_Integer CurrentIndexOfElementarySpine();

		/****************** D0 ******************/
		/**** md5 signature: 44a3de94c03d6c53050ebe26e6846129 ****/
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
		/**** md5 signature: 5d82740615c70fe17ed6f28d75ed8f63 ****/
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
		/**** md5 signature: c983c708a57ca80b2c76c9a6dfcbd6d5 ****/
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
		/**** md5 signature: 9520525f1c3103f30fb61fd68a118272 ****/
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
		/**** md5 signature: 50e1f230b87beebd12561fcb57080d79 ****/
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
		/**** md5 signature: 1df8ba6c79f39bb525fe86f8b4dc1f88 ****/
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
		/**** md5 signature: aaa496a36bc99cc30000c25f82868d13 ****/
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
		/**** md5 signature: 2f7016f891923155aac331ba8260eaa0 ****/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_ErrorStatus
") ErrorStatus;
		ChFiDS_ErrorStatus ErrorStatus();

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** FirstParameter ******************/
		/**** md5 signature: 43e78c2d3dcec0442b4c6f7d4e9d550a ****/
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
		/**** md5 signature: 50597ffb992e45ab92d72d217bf44f0d ****/
		%feature("compactdefaultargs") FirstStatus;
		%feature("autodoc", "Returns if the set of edges starts on a free boundary or if the first vertex is a breakpoint or if the set is closed.

Returns
-------
ChFiDS_State
") FirstStatus;
		ChFiDS_State FirstStatus();

		/****************** FirstVertex ******************/
		/**** md5 signature: a9d0a449a5497cf4780955cbe0b44200 ****/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") FirstVertex;
		TopoDS_Vertex FirstVertex();

		/****************** GetType ******************/
		/**** md5 signature: 6d4e6ae7972633971ba343e8afc91aa1 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** HasFirstTgt ******************/
		/**** md5 signature: 9b196c93880f437114c8ea979581acea ****/
		%feature("compactdefaultargs") HasFirstTgt;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFirstTgt;
		Standard_Boolean HasFirstTgt();

		/****************** HasLastTgt ******************/
		/**** md5 signature: 2cba4c4f6e09df1a2f01573597139cdc ****/
		%feature("compactdefaultargs") HasLastTgt;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasLastTgt;
		Standard_Boolean HasLastTgt();

		/****************** Index ******************/
		/**** md5 signature: 3f748690e0677200c2dc24172c072dfb ****/
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
		/**** md5 signature: 49ccac80c083800f0efd13d0804ff82b ****/
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
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsTangencyExtremity ******************/
		/**** md5 signature: a8210f1da4c1179547e590586db2e9fc ****/
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
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LastParameter ******************/
		/**** md5 signature: 366210a41f77093ca4e26a0a007fd1c7 ****/
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
		/**** md5 signature: b6ecda5b6d98b4e6874281ffca404974 ****/
		%feature("compactdefaultargs") LastStatus;
		%feature("autodoc", "Returns the state at the end of the set.

Returns
-------
ChFiDS_State
") LastStatus;
		ChFiDS_State LastStatus();

		/****************** LastVertex ******************/
		/**** md5 signature: 51a30300c8c457be7fee4de369d38666 ****/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") LastVertex;
		TopoDS_Vertex LastVertex();

		/****************** Length ******************/
		/**** md5 signature: 926b764d195681905675afe57b7fea5c ****/
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
		/**** md5 signature: 63e1fa189ca3bcfdb401241217a93bfb ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** Load ******************/
		/**** md5 signature: 14bc79a16a4ba0fe93224560bb579cb0 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Prepare the guideline depending on the edges that are elementary arks (take parameters from a single curvilinear abscissa); to be able to call methods on the geometry (first,last,value,d1,d2) it is necessary to start with preparation otherwise an exception will be raised.

Returns
-------
None
") Load;
		void Load();

		/****************** Mode ******************/
		/**** md5 signature: 646b757cb6ae4ed9f283015af34597e7 ****/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return the mode of chamfers used.

Returns
-------
ChFiDS_ChamfMode
") Mode;
		ChFiDS_ChamfMode Mode();

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** OffsetEdges ******************/
		/**** md5 signature: 023ae8426dd348d41da1fc3390821a18 ****/
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
		/**** md5 signature: f6408694e8db59cfea682b2df277b46e ****/
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
		/**** md5 signature: b0623594a2f8c3e8d9682053b9bc9428 ****/
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
		/**** md5 signature: 0270204961d3b0052ffe029cbcdbacd9 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** PutInFirst ******************/
		/**** md5 signature: 42323ad897907ad53dba909bcf69916c ****/
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
		/**** md5 signature: 8ecfdbf9078cc56964347649621d6b37 ****/
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
		/**** md5 signature: b38141635965f0cadd351580233542fa ****/
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
		/**** md5 signature: 955dbc498c06516d62e17e1e8d38cba7 ****/
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
		/**** md5 signature: b163c78c1924d8c473179ae0f702e2b8 ****/
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
		/**** md5 signature: fe28ef02235441ee10e561bb0206a043 ****/
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
		/**** md5 signature: f9de54b1f1fa50526f053773a4c2fa64 ****/
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
		/**** md5 signature: 6a2e52e0e61601a1f5ba51e18658c5ce ****/
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
		/**** md5 signature: d77c159df2076b6b62b20f6985d86432 ****/
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
		/**** md5 signature: d975ed3950244fc7eabbe6c08e8a2878 ****/
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
		/**** md5 signature: ee92068a5cb2a54f8f050c2704670a1b ****/
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
		/**** md5 signature: a8144c2e2ced4bb9cfd41e3485bbe1b2 ****/
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
		/**** md5 signature: e03b8adbbab3a9d6e9fd1f49184126ea ****/
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
		/**** md5 signature: 87a9a0e91bf387d101e8a06a591da1b1 ****/
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
		/**** md5 signature: 3a8b5dd00fd5d7398ee966850f76fe13 ****/
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
		/**** md5 signature: 0f054f194fe4862ac635de5ef9c15f94 ****/
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
		/**** md5 signature: 5fd64ab9882277f6b1fc7a49a50d1342 ****/
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
		/**** md5 signature: fd36b4a0e9cda0189944269998d8e8fd ****/
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
		/**** md5 signature: fe2c9168a5cde6a3136bcf314c46600a ****/
		%feature("compactdefaultargs") SplitDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SplitDone;
		Standard_Boolean SplitDone();

		/****************** SplitDone ******************/
		/**** md5 signature: 51227265bfba30085217e0dddb32ef11 ****/
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
		/**** md5 signature: 2d1d2e8edcc0c537fdec0b339a92e500 ****/
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
		/**** md5 signature: 5b60ccb91b7978ec5de638bf27913a17 ****/
		%feature("compactdefaultargs") UnsetReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetReference;
		void UnsetReference();

		/****************** Value ******************/
		/**** md5 signature: 8f4832a5df54c11193b328e54fef02cd ****/
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
		/**** md5 signature: cd5f6e9ec67c7963807c2979dc44998f ****/
		%feature("compactdefaultargs") ChFiDS_Stripe;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_Stripe;
		 ChFiDS_Stripe();

		/****************** ChangeFirstCurve ******************/
		/**** md5 signature: 64afe48b2b2e0de75967baed9ae805b2 ****/
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
		/**** md5 signature: 4c3a2910e0a4ada6305295597483d2b7 ****/
		%feature("compactdefaultargs") ChangeFirstPCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangeFirstPCurve;
		opencascade::handle<Geom2d_Curve> & ChangeFirstPCurve();

		/****************** ChangeFirstParameters ******************/
		/**** md5 signature: 1405a444bb650f1cff1e8f70dd710961 ****/
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
		/**** md5 signature: dd0905ce8f519caac604d0878819752b ****/
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
		/**** md5 signature: e717349708084d2ba0268af2f99bae5e ****/
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
		/**** md5 signature: ae86e60291183382f929be0f0181777b ****/
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
		/**** md5 signature: be14a55f58ce51c0c7e8d3ae2a94acc0 ****/
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
		/**** md5 signature: ec90f9463a1b17f9446b2ffd17f81783 ****/
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
		/**** md5 signature: 26816c8546bc85460a1d73fc2ba2ed1a ****/
		%feature("compactdefaultargs") ChangeLastPCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") ChangeLastPCurve;
		opencascade::handle<Geom2d_Curve> & ChangeLastPCurve();

		/****************** ChangeLastParameters ******************/
		/**** md5 signature: be44a3b27b758b559e9cd0b16c1a19b8 ****/
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
		/**** md5 signature: 4d15bb5c05522fd834cba04b802760b2 ****/
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
		/**** md5 signature: b816f955dbe517b2d321f59f961a85db ****/
		%feature("compactdefaultargs") ChangeSetOfSurfData;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_HData>
") ChangeSetOfSurfData;
		opencascade::handle<ChFiDS_HData> & ChangeSetOfSurfData();

		/****************** ChangeSpine ******************/
		/**** md5 signature: 111982dc16f5c59f6e1f0e0a045654cf ****/
		%feature("compactdefaultargs") ChangeSpine;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_Spine>
") ChangeSpine;
		opencascade::handle<ChFiDS_Spine> & ChangeSpine();

		/****************** Choix ******************/
		/**** md5 signature: 56d44f443206b1fa3fc4d5896c29d333 ****/
		%feature("compactdefaultargs") Choix;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Choix;
		Standard_Integer Choix();

		/****************** Choix ******************/
		/**** md5 signature: 7098bc3f3221f811ff516ed38dbafc43 ****/
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
		/**** md5 signature: c42994028e166e54fa54a45e4ff3466f ****/
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
		/**** md5 signature: 60996397389363fc426c2e9259e80745 ****/
		%feature("compactdefaultargs") FirstCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FirstCurve;
		Standard_Integer FirstCurve();

		/****************** FirstPCurve ******************/
		/**** md5 signature: 3275b667b2b0b6418edc91afc7389f29 ****/
		%feature("compactdefaultargs") FirstPCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") FirstPCurve;
		const opencascade::handle<Geom2d_Curve> & FirstPCurve();

		/****************** FirstPCurveOrientation ******************/
		/**** md5 signature: f941a3a9194fdca769d8d5a48fb4bf2e ****/
		%feature("compactdefaultargs") FirstPCurveOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") FirstPCurveOrientation;
		TopAbs_Orientation FirstPCurveOrientation();

		/****************** FirstPCurveOrientation ******************/
		/**** md5 signature: 7378d4fdf054f6803ef4d1b1c3bfebe1 ****/
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
		/**** md5 signature: b43cd7691f73448e706863640f0dca48 ****/
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
		/**** md5 signature: a5871e23609fcaa44d3f69008692f43a ****/
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
		/**** md5 signature: 0cb214af2c656e7adaca42c868ab4c95 ****/
		%feature("compactdefaultargs") IndexFirstPointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexFirstPointOnS1;
		Standard_Integer IndexFirstPointOnS1();

		/****************** IndexFirstPointOnS2 ******************/
		/**** md5 signature: 6fc8025c2af83728a43c896a6e828c5d ****/
		%feature("compactdefaultargs") IndexFirstPointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexFirstPointOnS2;
		Standard_Integer IndexFirstPointOnS2();

		/****************** IndexLastPointOnS1 ******************/
		/**** md5 signature: 87ccadbfd52d6d960ecd36487129ed37 ****/
		%feature("compactdefaultargs") IndexLastPointOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexLastPointOnS1;
		Standard_Integer IndexLastPointOnS1();

		/****************** IndexLastPointOnS2 ******************/
		/**** md5 signature: 604bbd01c4500957c46c3939b989aac6 ****/
		%feature("compactdefaultargs") IndexLastPointOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexLastPointOnS2;
		Standard_Integer IndexLastPointOnS2();

		/****************** IndexPoint ******************/
		/**** md5 signature: b6c9341a0da84b7f7c54cf09ce53baf1 ****/
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
		/**** md5 signature: cd05c727dce6b8210afc351e5ac7fd91 ****/
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
		/**** md5 signature: d6610cdfb3323f36ef3f5b49a9fc1453 ****/
		%feature("compactdefaultargs") LastCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") LastCurve;
		Standard_Integer LastCurve();

		/****************** LastPCurve ******************/
		/**** md5 signature: cb9a448d17d26a7972588092a53e1ea9 ****/
		%feature("compactdefaultargs") LastPCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") LastPCurve;
		const opencascade::handle<Geom2d_Curve> & LastPCurve();

		/****************** LastPCurveOrientation ******************/
		/**** md5 signature: 260fa231af1e53202bfa91a250f41e7b ****/
		%feature("compactdefaultargs") LastPCurveOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") LastPCurveOrientation;
		TopAbs_Orientation LastPCurveOrientation();

		/****************** LastPCurveOrientation ******************/
		/**** md5 signature: 0b20502ae503e6be8ea2762a18bbd386 ****/
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
		/**** md5 signature: 339528eb2397be639136e26491e13a98 ****/
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
		/**** md5 signature: e459d64aa914c0c6260ec32e9a5b7eae ****/
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
		/**** md5 signature: 5e69f6fd26a9a3ace7299c96327f2db6 ****/
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
		/**** md5 signature: 99a202362c7060da6590bb4c43c41e5e ****/
		%feature("compactdefaultargs") OrientationOnFace1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") OrientationOnFace1;
		TopAbs_Orientation OrientationOnFace1();

		/****************** OrientationOnFace1 ******************/
		/**** md5 signature: d95a2afb74307fb681f8466deee684df ****/
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
		/**** md5 signature: 0e0542fc626ccc4d814180eacbb452b6 ****/
		%feature("compactdefaultargs") OrientationOnFace2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") OrientationOnFace2;
		TopAbs_Orientation OrientationOnFace2();

		/****************** OrientationOnFace2 ******************/
		/**** md5 signature: 16661c6f48616178d38edd0d539a2187 ****/
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
		/**** md5 signature: 9fa93399392272abea49fa61f719aa07 ****/
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
		/**** md5 signature: e434f92bc401b080e1f82d4278f0b49d ****/
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
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset everything except spine.

Returns
-------
None
") Reset;
		void Reset();

		/****************** SetCurve ******************/
		/**** md5 signature: 33d4a3b4d710b3b8650fa405c30f22f4 ****/
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
		/**** md5 signature: c41b722b86a09aa685a4475ec2df0601 ****/
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
		/**** md5 signature: a442d39e57ce35749e899380e2ecc9bc ****/
		%feature("compactdefaultargs") SetOfSurfData;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ChFiDS_HData>
") SetOfSurfData;
		const opencascade::handle<ChFiDS_HData> & SetOfSurfData();

		/****************** SetOrientation ******************/
		/**** md5 signature: 749bd92540850256c711d2ad35ac8cad ****/
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
		/**** md5 signature: ae28934bf0dabf2c291cc15de55030e3 ****/
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
		/**** md5 signature: 4db950b9a62330a8ee989fda40f71a20 ****/
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
		/**** md5 signature: 8eadbe97c4c76389094efc550670c7a2 ****/
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
		/**** md5 signature: a8fd277f867e1d86dd72f41ff6395800 ****/
		%feature("compactdefaultargs") SolidIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SolidIndex;
		Standard_Integer SolidIndex();

		/****************** Spine ******************/
		/**** md5 signature: 131048b17dbd5a413d557d000aa4f6ee ****/
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
		/**** md5 signature: f2096cdef1c87c863c6adeff2eb996a6 ****/
		%feature("compactdefaultargs") ChFiDS_StripeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_StripeMap;
		 ChFiDS_StripeMap();

		/****************** Add ******************/
		/**** md5 signature: 92a3a1f4eea65565b67b2c2cb1beb02b ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Extent ******************/
		/**** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** FindFromIndex ******************/
		/**** md5 signature: a4cb4e0913cfb62cd51ca90fc6e045c2 ****/
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
		/**** md5 signature: 3e35c916c2d4713eae2d9d28b14b97f0 ****/
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
		/**** md5 signature: 8178cd24d0bbc4f0a4efae070c360666 ****/
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
		/**** md5 signature: d342b06a90e71e18178dddceee0ad15b ****/
		%feature("compactdefaultargs") ChFiDS_SurfData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_SurfData;
		 ChFiDS_SurfData();

		/****************** ChangeIndexOfS1 ******************/
		/**** md5 signature: 464a81c4ded1d461524d80d6a6781808 ****/
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
		/**** md5 signature: 836ea02facf61fa10ec5efea297795bf ****/
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
		/**** md5 signature: 765d18b794185e8b4adc52e73713512a ****/
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
		/**** md5 signature: f0413a5ac7c0de69a5d4a3d529a10583 ****/
		%feature("compactdefaultargs") ChangeInterferenceOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_FaceInterference
") ChangeInterferenceOnS1;
		ChFiDS_FaceInterference & ChangeInterferenceOnS1();

		/****************** ChangeInterferenceOnS2 ******************/
		/**** md5 signature: 81ec062a7aad7e9b8aa3621e75ff7ee2 ****/
		%feature("compactdefaultargs") ChangeInterferenceOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_FaceInterference
") ChangeInterferenceOnS2;
		ChFiDS_FaceInterference & ChangeInterferenceOnS2();

		/****************** ChangeOrientation ******************/
		/**** md5 signature: 7d02e9bc719430918056169f5b73af48 ****/
		%feature("compactdefaultargs") ChangeOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation();

		/****************** ChangeSurf ******************/
		/**** md5 signature: 04810584e755bde58033397adab639cd ****/
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
		/**** md5 signature: a8ddf20f93239324ee9ea0b0bd371c2a ****/
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
		/**** md5 signature: 3108659a3a5bf4019308c76481ef6d62 ****/
		%feature("compactdefaultargs") ChangeVertexFirstOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") ChangeVertexFirstOnS1;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS1();

		/****************** ChangeVertexFirstOnS2 ******************/
		/**** md5 signature: 06d669b9caf772c897d0582d11b7c013 ****/
		%feature("compactdefaultargs") ChangeVertexFirstOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") ChangeVertexFirstOnS2;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS2();

		/****************** ChangeVertexLastOnS1 ******************/
		/**** md5 signature: eeeb7d2961ba36134fb72bc84375907f ****/
		%feature("compactdefaultargs") ChangeVertexLastOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") ChangeVertexLastOnS1;
		ChFiDS_CommonPoint & ChangeVertexLastOnS1();

		/****************** ChangeVertexLastOnS2 ******************/
		/**** md5 signature: c449ad55b0517485ef3ee2434c55704f ****/
		%feature("compactdefaultargs") ChangeVertexLastOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") ChangeVertexLastOnS2;
		ChFiDS_CommonPoint & ChangeVertexLastOnS2();

		/****************** Copy ******************/
		/**** md5 signature: ac62b6fd0b6f486fcd7879ad104ed8ee ****/
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
		/**** md5 signature: 5762a3564e85ee2c2d5a982d2d5be2b6 ****/
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstExtensionValue;
		Standard_Real FirstExtensionValue();

		/****************** FirstExtensionValue ******************/
		/**** md5 signature: dffd070f2463c275043731ce8aaa835a ****/
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
		/**** md5 signature: 85cb7fa56a31345ca448ea81a805d5a6 ****/
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstSpineParam;
		Standard_Real FirstSpineParam();

		/****************** FirstSpineParam ******************/
		/**** md5 signature: a9bff714e1565d13d5330c6d7db44b07 ****/
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
		/**** md5 signature: c0b76123de363b14c9d65851a4731623 ****/
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
		/**** md5 signature: 532fbd8ec9795a1c784ff3fd2dfa42ce ****/
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
		/**** md5 signature: aa936d15dc38493d194d98f4e3620447 ****/
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
		/**** md5 signature: 79cb134274da4314c248ce29add33a2d ****/
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
		/**** md5 signature: 7b68134b11c71080846dd64a481e6cf3 ****/
		%feature("compactdefaultargs") IndexOfC1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexOfC1;
		Standard_Integer IndexOfC1();

		/****************** IndexOfC2 ******************/
		/**** md5 signature: e15a0488edee7b0d89e07059e021e999 ****/
		%feature("compactdefaultargs") IndexOfC2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexOfC2;
		Standard_Integer IndexOfC2();

		/****************** IndexOfS1 ******************/
		/**** md5 signature: cae260f6fc1b135c75d40e23b72662b6 ****/
		%feature("compactdefaultargs") IndexOfS1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexOfS1;
		Standard_Integer IndexOfS1();

		/****************** IndexOfS2 ******************/
		/**** md5 signature: 65bb5d204d53ff0a6f2b801ef29c59c2 ****/
		%feature("compactdefaultargs") IndexOfS2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexOfS2;
		Standard_Integer IndexOfS2();

		/****************** Interference ******************/
		/**** md5 signature: 721126f8fff1ec76678eac4e5dabfaa8 ****/
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
		/**** md5 signature: 84de26124a5e0740b80f38705ca471b3 ****/
		%feature("compactdefaultargs") InterferenceOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_FaceInterference
") InterferenceOnS1;
		const ChFiDS_FaceInterference & InterferenceOnS1();

		/****************** InterferenceOnS2 ******************/
		/**** md5 signature: f749302ca0babe17f787eff908650488 ****/
		%feature("compactdefaultargs") InterferenceOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_FaceInterference
") InterferenceOnS2;
		const ChFiDS_FaceInterference & InterferenceOnS2();

		/****************** IsOnCurve ******************/
		/**** md5 signature: c7ef125fb459f6494dcf4ad0b12f2685 ****/
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
		/**** md5 signature: af913d0df1bfdaa10c15b69b831a5528 ****/
		%feature("compactdefaultargs") IsOnCurve1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOnCurve1;
		Standard_Boolean IsOnCurve1();

		/****************** IsOnCurve2 ******************/
		/**** md5 signature: 461844d6cb2ec1f6b2f31eed5d129109 ****/
		%feature("compactdefaultargs") IsOnCurve2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOnCurve2;
		Standard_Boolean IsOnCurve2();

		/****************** LastExtensionValue ******************/
		/**** md5 signature: 23c75e037feda815b5430178c48b5b00 ****/
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastExtensionValue;
		Standard_Real LastExtensionValue();

		/****************** LastExtensionValue ******************/
		/**** md5 signature: b91d11693c0b645a15a8f54908977d42 ****/
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
		/**** md5 signature: e486c269dbc2903bdab7750b7673bcd2 ****/
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastSpineParam;
		Standard_Real LastSpineParam();

		/****************** LastSpineParam ******************/
		/**** md5 signature: cbf1f2f51110a7d4048655e2098604ac ****/
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
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** ResetSimul ******************/
		/**** md5 signature: ef9a205f289935b753cf7e7b693562a5 ****/
		%feature("compactdefaultargs") ResetSimul;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetSimul;
		void ResetSimul();

		/****************** Set2dPoints ******************/
		/**** md5 signature: c164003b5eb904f6a11f248c01e5e125 ****/
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
		/**** md5 signature: e9e20dfa0037167b3db1039fdf9ddbd4 ****/
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
		/**** md5 signature: 699facddccc422aedc676f7ce2d4ae70 ****/
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
		/**** md5 signature: 0b9016e6717c670bf80fee8060fff7f8 ****/
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
		/**** md5 signature: 5a64a66fd42dcaca497381aacb1dc73d ****/
		%feature("compactdefaultargs") Simul;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Transient>
") Simul;
		opencascade::handle<Standard_Transient> Simul();

		/****************** Surf ******************/
		/**** md5 signature: 1098b0d819c18c444ca2aaecf83fe6fe ****/
		%feature("compactdefaultargs") Surf;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Surf;
		Standard_Integer Surf();

		/****************** TwistOnS1 ******************/
		/**** md5 signature: 9e7cba134041c48814f8e911bc7ceb7d ****/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		Standard_Boolean TwistOnS1();

		/****************** TwistOnS1 ******************/
		/**** md5 signature: 0acb5632246f7d8546f899592bf293f6 ****/
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
		/**** md5 signature: d09d14bd26a5c6922f795ecb44cf2f66 ****/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS2;
		Standard_Boolean TwistOnS2();

		/****************** TwistOnS2 ******************/
		/**** md5 signature: 86b835475f2f1a22123081c9ad1406c3 ****/
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
		/**** md5 signature: 18d5b7a519c656abcce6733eb3f805bc ****/
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
		/**** md5 signature: fbdcb24d9af55411ab7405474d1a35b9 ****/
		%feature("compactdefaultargs") VertexFirstOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") VertexFirstOnS1;
		const ChFiDS_CommonPoint & VertexFirstOnS1();

		/****************** VertexFirstOnS2 ******************/
		/**** md5 signature: 7c85c07345dd8348e664b3ab7bf9f189 ****/
		%feature("compactdefaultargs") VertexFirstOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") VertexFirstOnS2;
		const ChFiDS_CommonPoint & VertexFirstOnS2();

		/****************** VertexLastOnS1 ******************/
		/**** md5 signature: 6427caa61f0bf9234fd05e296984ac27 ****/
		%feature("compactdefaultargs") VertexLastOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFiDS_CommonPoint
") VertexLastOnS1;
		const ChFiDS_CommonPoint & VertexLastOnS1();

		/****************** VertexLastOnS2 ******************/
		/**** md5 signature: c890925b005a346f489bb09d9ca4839f ****/
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
		/**** md5 signature: 41553b44dd772e00fe86fab46e7d904c ****/
		%feature("compactdefaultargs") ChFiDS_ChamfSpine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine();

		/****************** ChFiDS_ChamfSpine ******************/
		/**** md5 signature: 33f39a16a9e9fd99378615ca285c48a9 ****/
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
		/**** md5 signature: 2e7b681679b701fdc1f1a885c6746b43 ****/
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
		/**** md5 signature: 6f22d39c9d38288e6a9d1e40741e84b4 ****/
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
		/**** md5 signature: b7e8c4f4dca6f7925ece8caaf424f067 ****/
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
		/**** md5 signature: d658319093da8e4029525963f6dcf77f ****/
		%feature("compactdefaultargs") IsChamfer;
		%feature("autodoc", "Return the method of chamfers used.

Returns
-------
ChFiDS_ChamfMethod
") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer();

		/****************** SetDist ******************/
		/**** md5 signature: 3234cee1a1528df7657370712255a4e9 ****/
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
		/**** md5 signature: dc437b103bb0ff46b0c641a081c767b1 ****/
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
		/**** md5 signature: e2a0b86c65b45aa81960cb17a64c4df1 ****/
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
		/**** md5 signature: 85103d8a8712f2721bdad80918d54319 ****/
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
		/**** md5 signature: cba6306b427db3f36fc8b4403f44bd5b ****/
		%feature("compactdefaultargs") ChFiDS_FilSpine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ChFiDS_FilSpine;
		 ChFiDS_FilSpine();

		/****************** ChFiDS_FilSpine ******************/
		/**** md5 signature: 62b18d0760aa4d6ecc105f7fa320840e ****/
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
		/**** md5 signature: a02ef87558175a76a55d808d58de097f ****/
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
		/**** md5 signature: 8ae71aa7535429ad90f7a710389558b8 ****/
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
		/**** md5 signature: d04428c0cc470abb832fd48242d18c6c ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Returns true if the radius is constant all along the spine.

Returns
-------
bool
") IsConstant;
		Standard_Boolean IsConstant();

		/****************** IsConstant ******************/
		/**** md5 signature: bc11f93510cfff4e44a25f3e84ce1ada ****/
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
		/**** md5 signature: bfc601b38642ba13a3dd383d1a79074b ****/
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
		/**** md5 signature: 5d0ba972a5439e16c0aae93c053bd63b ****/
		%feature("compactdefaultargs") MaxRadFromSeqAndLaws;
		%feature("autodoc", "Returns the maximum radius if the fillet is non-constant.

Returns
-------
float
") MaxRadFromSeqAndLaws;
		Standard_Real MaxRadFromSeqAndLaws();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius if the fillet is constant all along the spine.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Radius ******************/
		/**** md5 signature: 75a8a890fcaa49d59f2a13a8dfdd6194 ****/
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
		/**** md5 signature: a7dbde136b0aff6df13e784d945befee ****/
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
		/**** md5 signature: e8db21712db75c0ab3a6d44938480832 ****/
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
		/**** md5 signature: 91641ed1cc49aed497341c2960fe1ef2 ****/
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
		/**** md5 signature: 0b731947b724fee5a279be1cdface2f5 ****/
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
		/**** md5 signature: c46a36f7aea3dca4657dbb13bc50b145 ****/
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
		/**** md5 signature: 021f3150e83db7a660562352251b37b0 ****/
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
		/**** md5 signature: 99c895e6b68282335620180e915bf49e ****/
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
		/**** md5 signature: 5be1b8d2f909f7cad1be8a39d04d1ce1 ****/
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
		/**** md5 signature: 5d2002bb5639afbef66d96320c17409b ****/
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


