/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_chfids.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
%import Law.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
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

enum ChFiDS_State {
	ChFiDS_OnSame = 0,
	ChFiDS_OnDiff = 1,
	ChFiDS_AllSame = 2,
	ChFiDS_BreakPoint = 3,
	ChFiDS_FreeBoundary = 4,
	ChFiDS_Closed = 5,
	ChFiDS_Tangent = 6,
};

enum ChFiDS_TypeOfConcavity {
	ChFiDS_Concave = 0,
	ChFiDS_Convex = 1,
	ChFiDS_Tangential = 2,
	ChFiDS_FreeBound = 3,
	ChFiDS_Other = 4,
	ChFiDS_Mixed = 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

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

class ChFiDS_TypeOfConcavity(IntEnum):
	ChFiDS_Concave = 0
	ChFiDS_Convex = 1
	ChFiDS_Tangential = 2
	ChFiDS_FreeBound = 3
	ChFiDS_Other = 4
	ChFiDS_Mixed = 5
ChFiDS_Concave = ChFiDS_TypeOfConcavity.ChFiDS_Concave
ChFiDS_Convex = ChFiDS_TypeOfConcavity.ChFiDS_Convex
ChFiDS_Tangential = ChFiDS_TypeOfConcavity.ChFiDS_Tangential
ChFiDS_FreeBound = ChFiDS_TypeOfConcavity.ChFiDS_FreeBound
ChFiDS_Other = ChFiDS_TypeOfConcavity.ChFiDS_Other
ChFiDS_Mixed = ChFiDS_TypeOfConcavity.ChFiDS_Mixed
};
/* end python proxy for enums */

/* handles */
%wrap_handle(ChFiDS_ElSpine)
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
%template(ChFiDS_ListIteratorOfListOfHElSpine) NCollection_TListIterator<opencascade::handle<ChFiDS_ElSpine>>;
%template(ChFiDS_ListIteratorOfListOfStripe) NCollection_TListIterator<opencascade::handle<ChFiDS_Stripe>>;
%template(ChFiDS_ListIteratorOfRegularities) NCollection_TListIterator<ChFiDS_Regul>;
%template(ChFiDS_ListOfHElSpine) NCollection_List<opencascade::handle<ChFiDS_ElSpine>>;

%extend NCollection_List<opencascade::handle<ChFiDS_ElSpine>> {
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
Array1ExtendIter(ChFiDS_CircSection)

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
Array1ExtendIter(opencascade::handle<ChFiDS_Stripe>)

/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap<TopoDS_Vertex, ChFiDS_ListOfStripe, TopTools_ShapeMapHasher> ChFiDS_IndexedDataMapOfVertexListOfStripe;
typedef NCollection_List<opencascade::handle<ChFiDS_ElSpine>>::Iterator ChFiDS_ListIteratorOfListOfHElSpine;
typedef NCollection_List<opencascade::handle<ChFiDS_Stripe>>::Iterator ChFiDS_ListIteratorOfListOfStripe;
typedef NCollection_List<ChFiDS_Regul>::Iterator ChFiDS_ListIteratorOfRegularities;
typedef NCollection_List<opencascade::handle<ChFiDS_ElSpine>> ChFiDS_ListOfHElSpine;
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
		/****** ChFiDS_CircSection::ChFiDS_CircSection ******/
		/****** md5 signature: 6523e873553d9df45ab3ab97e227ce1f ******/
		%feature("compactdefaultargs") ChFiDS_CircSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_CircSection;
		 ChFiDS_CircSection();

		/****** ChFiDS_CircSection::Get ******/
		/****** md5 signature: a1f8c105562696f8f7b9cb3c76886f3b ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
F: float
L: float

Description
-----------
No available documentation.
") Get;
		void Get(gp_Circ & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_CircSection::Get ******/
		/****** md5 signature: 308ba452ddd6c0ba74516bc55b787d5c ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
F: float
L: float

Description
-----------
No available documentation.
") Get;
		void Get(gp_Lin & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_CircSection::Set ******/
		/****** md5 signature: f809c774b4f408588ecfa44007642c36 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
F: float
L: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Circ & C, const Standard_Real F, const Standard_Real L);

		/****** ChFiDS_CircSection::Set ******/
		/****** md5 signature: 51063ff92fa3854b20788a299c724e02 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
F: float
L: float

Return
-------
None

Description
-----------
No available documentation.
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
		/****** ChFiDS_CommonPoint::ChFiDS_CommonPoint ******/
		/****** md5 signature: 1caa644f6c5ddee79ec165570f0bf85e ******/
		%feature("compactdefaultargs") ChFiDS_CommonPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ChFiDS_CommonPoint;
		 ChFiDS_CommonPoint();

		/****** ChFiDS_CommonPoint::Arc ******/
		/****** md5 signature: 5ad70ec93182770590e68292096cc021 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the arc of restriction containing the vertex.
") Arc;
		const TopoDS_Edge Arc();

		/****** ChFiDS_CommonPoint::HasVector ******/
		/****** md5 signature: cdf1102fba87269c204cf4398c655af3 ******/
		%feature("compactdefaultargs") HasVector;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the output vector is stored.
") HasVector;
		Standard_Boolean HasVector();

		/****** ChFiDS_CommonPoint::IsOnArc ******/
		/****** md5 signature: b03b70dd2ee9f895b787f6dbe3e85ce3 ******/
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a on an edge of the initial restriction facet of the surface.
") IsOnArc;
		Standard_Boolean IsOnArc();

		/****** ChFiDS_CommonPoint::IsVertex ******/
		/****** md5 signature: 856b3bdfdec770bc63025788388af574 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a vertex on the initial restriction facet of the surface.
") IsVertex;
		Standard_Boolean IsVertex();

		/****** ChFiDS_CommonPoint::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the spine.
") Parameter;
		Standard_Real Parameter();

		/****** ChFiDS_CommonPoint::ParameterOnArc ******/
		/****** md5 signature: 53d2051734836b1f3c7d9edd7c3c1884 ******/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter of the point on the arc returned by the method Arc().
") ParameterOnArc;
		Standard_Real ParameterOnArc();

		/****** ChFiDS_CommonPoint::Point ******/
		/****** md5 signature: 4e742d9ca138939180edee86d3b37a8f ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 3d point.
") Point;
		const gp_Pnt Point();

		/****** ChFiDS_CommonPoint::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
default value for all fields.
") Reset;
		void Reset();

		/****** ChFiDS_CommonPoint::SetArc ******/
		/****** md5 signature: dd555be3b4e20b36002df68268f8cf7b ******/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "
Parameters
----------
Tol: float
A: TopoDS_Edge
Param: float
TArc: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the values of a point which is on the arc A, at parameter Param.
") SetArc;
		void SetArc(const Standard_Real Tol, const TopoDS_Edge & A, const Standard_Real Param, const TopAbs_Orientation TArc);

		/****** ChFiDS_CommonPoint::SetParameter ******/
		/****** md5 signature: 26222f3f8c770197bec88d8e30e2baa3 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
Sets the value of the parameter on the spine.
") SetParameter;
		void SetParameter(const Standard_Real Param);

		/****** ChFiDS_CommonPoint::SetPoint ******/
		/****** md5 signature: 68bd126cf7c8875dfaa4eadfc6d81506 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Set the 3d point for a commonpoint that is not a vertex or on an arc.
") SetPoint;
		void SetPoint(const gp_Pnt & thePoint);

		/****** ChFiDS_CommonPoint::SetTolerance ******/
		/****** md5 signature: 44b5b8eb060c2e3cbf3e6124065a0e26 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
This method set the fuzziness on the point.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****** ChFiDS_CommonPoint::SetVector ******/
		/****** md5 signature: f00faab372d6b4314d8a10832bbb9931 ******/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "
Parameters
----------
theVector: gp_Vec

Return
-------
None

Description
-----------
Set the output 3d vector.
") SetVector;
		void SetVector(const gp_Vec & theVector);

		/****** ChFiDS_CommonPoint::SetVertex ******/
		/****** md5 signature: a34e1fba1fe64766525e67d94c7483ae ******/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: TopoDS_Vertex

Return
-------
None

Description
-----------
Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface.
") SetVertex;
		void SetVertex(const TopoDS_Vertex & theVertex);

		/****** ChFiDS_CommonPoint::Tolerance ******/
		/****** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
This method returns the fuzziness on the point.
") Tolerance;
		Standard_Real Tolerance();

		/****** ChFiDS_CommonPoint::TransitionOnArc ******/
		/****** md5 signature: e46e4c017a4b2c34dda6e6f7744be5bc ******/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the transition of the point on the arc returned by Arc().
") TransitionOnArc;
		TopAbs_Orientation TransitionOnArc();

		/****** ChFiDS_CommonPoint::Vector ******/
		/****** md5 signature: 1a7a96c96ed619e286fdaba7a529667d ******/
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the output 3d vector.
") Vector;
		const gp_Vec Vector();

		/****** ChFiDS_CommonPoint::Vertex ******/
		/****** md5 signature: f6b9d30df043abdbae2c9dffcc672395 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the information about the point when it is on the domain of the first patch, i-e when the function IsVertex returns True. Otherwise, an exception is raised.
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
		/****** ChFiDS_ElSpine::ChFiDS_ElSpine ******/
		/****** md5 signature: a9de632b7a9fa8e53f36b2ec4b34338f ******/
		%feature("compactdefaultargs") ChFiDS_ElSpine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_ElSpine;
		 ChFiDS_ElSpine();

		/****** ChFiDS_ElSpine::AddVertexWithTangent ******/
		/****** md5 signature: d4168c525b75434c9db32f9bfffa9982 ******/
		%feature("compactdefaultargs") AddVertexWithTangent;
		%feature("autodoc", "
Parameters
----------
anAx1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") AddVertexWithTangent;
		void AddVertexWithTangent(const gp_Ax1 & anAx1);

		/****** ChFiDS_ElSpine::BSpline ******/
		/****** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** ChFiDS_ElSpine::Bezier ******/
		/****** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****** ChFiDS_ElSpine::ChangeNext ******/
		/****** md5 signature: faf634b7d93d7e19adce6371de2a76ac ******/
		%feature("compactdefaultargs") ChangeNext;
		%feature("autodoc", "Return
-------
opencascade::handle<ChFiDS_SurfData>

Description
-----------
No available documentation.
") ChangeNext;
		opencascade::handle<ChFiDS_SurfData> & ChangeNext();

		/****** ChFiDS_ElSpine::ChangePrevious ******/
		/****** md5 signature: 227fdc4f29720a58cc13f577ea0b5ba4 ******/
		%feature("compactdefaultargs") ChangePrevious;
		%feature("autodoc", "Return
-------
opencascade::handle<ChFiDS_SurfData>

Description
-----------
No available documentation.
") ChangePrevious;
		opencascade::handle<ChFiDS_SurfData> & ChangePrevious();

		/****** ChFiDS_ElSpine::Circle ******/
		/****** md5 signature: 5f382e7a6af009845ea6e16d54814298 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** ChFiDS_ElSpine::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** ChFiDS_ElSpine::D0 ******/
		/****** md5 signature: df369f5511c6c7a731860654c0a9c298 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
AbsC: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		virtual void D0(const Standard_Real AbsC, gp_Pnt & P);

		/****** ChFiDS_ElSpine::D1 ******/
		/****** md5 signature: 3b92546c7cd3f352b04381c39c25dd0a ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
AbsC: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		virtual void D1(const Standard_Real AbsC, gp_Pnt & P, gp_Vec & V1);

		/****** ChFiDS_ElSpine::D2 ******/
		/****** md5 signature: 28864d9f51b38b7472bc2136e503c2d9 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
AbsC: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		virtual void D2(const Standard_Real AbsC, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ChFiDS_ElSpine::D3 ******/
		/****** md5 signature: 34fe4c1ec1dee0428cc3c133ef021b7c ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
AbsC: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		virtual void D3(const Standard_Real AbsC, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ChFiDS_ElSpine::Ellipse ******/
		/****** md5 signature: e9a77f14e9bbca29370202de404ea9c1 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** ChFiDS_ElSpine::FirstParameter ******/
		/****** md5 signature: 4764beb92499e70705c5628a20961327 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****** ChFiDS_ElSpine::FirstParameter ******/
		/****** md5 signature: f70a98e5455eda40d623400b3a7621bd ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
None

Description
-----------
No available documentation.
") FirstParameter;
		void FirstParameter(const Standard_Real P);

		/****** ChFiDS_ElSpine::FirstPointAndTgt ******/
		/****** md5 signature: 9251482358a41a8213a518ba9d7054fd ******/
		%feature("compactdefaultargs") FirstPointAndTgt;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
T: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") FirstPointAndTgt;
		void FirstPointAndTgt(gp_Pnt & P, gp_Vec & T);

		/****** ChFiDS_ElSpine::GetSavedFirstParameter ******/
		/****** md5 signature: 75db463c8364b8f77f9e3de51ecbedc6 ******/
		%feature("compactdefaultargs") GetSavedFirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetSavedFirstParameter;
		Standard_Real GetSavedFirstParameter();

		/****** ChFiDS_ElSpine::GetSavedLastParameter ******/
		/****** md5 signature: 6c55b3c4ecd4337f064cf9ed6c0eecaa ******/
		%feature("compactdefaultargs") GetSavedLastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetSavedLastParameter;
		Standard_Real GetSavedLastParameter();

		/****** ChFiDS_ElSpine::GetType ******/
		/****** md5 signature: 33b481526e57ba1551397943374a197a ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		virtual GeomAbs_CurveType GetType();

		/****** ChFiDS_ElSpine::Hyperbola ******/
		/****** md5 signature: a96ca49b2ad017b35bb09d0b86cb690d ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr Hyperbola();

		/****** ChFiDS_ElSpine::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** ChFiDS_ElSpine::IsPeriodic ******/
		/****** md5 signature: 13a0a38f32e22e8a1ec5aa34cbf9bbea ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****** ChFiDS_ElSpine::LastParameter ******/
		/****** md5 signature: 51650ab8b3afb0a24f930d23afae31ca ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		virtual Standard_Real LastParameter();

		/****** ChFiDS_ElSpine::LastParameter ******/
		/****** md5 signature: 960ed927a400b05e09d04421f57f40c3 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
None

Description
-----------
No available documentation.
") LastParameter;
		void LastParameter(const Standard_Real P);

		/****** ChFiDS_ElSpine::LastPointAndTgt ******/
		/****** md5 signature: 93100e74cc6db5e39d9d8d1a6cf42013 ******/
		%feature("compactdefaultargs") LastPointAndTgt;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
T: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") LastPointAndTgt;
		void LastPointAndTgt(gp_Pnt & P, gp_Vec & T);

		/****** ChFiDS_ElSpine::Line ******/
		/****** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** ChFiDS_ElSpine::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** ChFiDS_ElSpine::NbVertices ******/
		/****** md5 signature: 435b05539d6b9d704dc04d9218f26996 ******/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertices;
		Standard_Integer NbVertices();

		/****** ChFiDS_ElSpine::Next ******/
		/****** md5 signature: 39ca926c37bee1c887d1f87f377ea7fd ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<ChFiDS_SurfData>

Description
-----------
No available documentation.
") Next;
		const opencascade::handle<ChFiDS_SurfData> & Next();

		/****** ChFiDS_ElSpine::Parabola ******/
		/****** md5 signature: 68860abab63fd184ea5c7eb97f0762c1 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		gp_Parab Parabola();

		/****** ChFiDS_ElSpine::Period ******/
		/****** md5 signature: a0af1de0407384df43b0e76d6b472231 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Period;
		virtual Standard_Real Period();

		/****** ChFiDS_ElSpine::Previous ******/
		/****** md5 signature: e96ad254506925dd4b71cfbc11e5467e ******/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "Return
-------
opencascade::handle<ChFiDS_SurfData>

Description
-----------
No available documentation.
") Previous;
		const opencascade::handle<ChFiDS_SurfData> & Previous();

		/****** ChFiDS_ElSpine::Resolution ******/
		/****** md5 signature: ff921b502a972d22db1a77196e34d53d ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
No available documentation.
") Resolution;
		virtual Standard_Real Resolution(const Standard_Real R3d);

		/****** ChFiDS_ElSpine::SaveFirstParameter ******/
		/****** md5 signature: ef62d193c97ecc49ce192ba3a979c7aa ******/
		%feature("compactdefaultargs") SaveFirstParameter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SaveFirstParameter;
		void SaveFirstParameter();

		/****** ChFiDS_ElSpine::SaveLastParameter ******/
		/****** md5 signature: 213b0924cd909f6165eac15bb3180fd1 ******/
		%feature("compactdefaultargs") SaveLastParameter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SaveLastParameter;
		void SaveLastParameter();

		/****** ChFiDS_ElSpine::SetCurve ******/
		/****** md5 signature: 33a6119977a9c465ffe7769b5dc4e7f5 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const opencascade::handle<Geom_Curve> & C);

		/****** ChFiDS_ElSpine::SetFirstPointAndTgt ******/
		/****** md5 signature: bfdf2f3c452f6d8c0a2157549e43a8fc ******/
		%feature("compactdefaultargs") SetFirstPointAndTgt;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
T: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetFirstPointAndTgt;
		void SetFirstPointAndTgt(const gp_Pnt & P, const gp_Vec & T);

		/****** ChFiDS_ElSpine::SetLastPointAndTgt ******/
		/****** md5 signature: 4197c08886ae9cb26ecc386f3c2dc846 ******/
		%feature("compactdefaultargs") SetLastPointAndTgt;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
T: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetLastPointAndTgt;
		void SetLastPointAndTgt(const gp_Pnt & P, const gp_Vec & T);

		/****** ChFiDS_ElSpine::SetOrigin ******/
		/****** md5 signature: 90772090782b64db2bef099a0d3c0950 ******/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "
Parameters
----------
O: float

Return
-------
None

Description
-----------
No available documentation.
") SetOrigin;
		void SetOrigin(const Standard_Real O);

		/****** ChFiDS_ElSpine::SetPeriodic ******/
		/****** md5 signature: 350f9c15209db2caa06ef8c73d0952ea ******/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "
Parameters
----------
I: bool

Return
-------
None

Description
-----------
No available documentation.
") SetPeriodic;
		void SetPeriodic(const Standard_Boolean I);

		/****** ChFiDS_ElSpine::ShallowCopy ******/
		/****** md5 signature: 1b6b0927543eab9d05e2c875c0c3efb6 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor3d_Curve> ShallowCopy();

		/****** ChFiDS_ElSpine::Trim ******/
		/****** md5 signature: 974fe27e2868c6786b8c68ef515f97f8 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion.
") Trim;
		virtual opencascade::handle<Adaptor3d_Curve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** ChFiDS_ElSpine::Value ******/
		/****** md5 signature: ba8231e7dc3a72ecafee01b4eb348bbe ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
AbsC: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		virtual gp_Pnt Value(const Standard_Real AbsC);

		/****** ChFiDS_ElSpine::VertexWithTangent ******/
		/****** md5 signature: 8a3fc0491ddd2e2bccd694dc8b3d06ef ******/
		%feature("compactdefaultargs") VertexWithTangent;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Ax1

Description
-----------
No available documentation.
") VertexWithTangent;
		const gp_Ax1 VertexWithTangent(const Standard_Integer Index);

};


%make_alias(ChFiDS_ElSpine)

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
		/****** ChFiDS_FaceInterference::ChFiDS_FaceInterference ******/
		/****** md5 signature: 726bb55f5f15f401281cd7e8a0f99392 ******/
		%feature("compactdefaultargs") ChFiDS_FaceInterference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_FaceInterference;
		 ChFiDS_FaceInterference();

		/****** ChFiDS_FaceInterference::ChangePCurveOnFace ******/
		/****** md5 signature: a4ac08e5cc5b6094d4ba91d7988200d3 ******/
		%feature("compactdefaultargs") ChangePCurveOnFace;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") ChangePCurveOnFace;
		opencascade::handle<Geom2d_Curve> & ChangePCurveOnFace();

		/****** ChFiDS_FaceInterference::ChangePCurveOnSurf ******/
		/****** md5 signature: 93c521145058d145231b405856b20de6 ******/
		%feature("compactdefaultargs") ChangePCurveOnSurf;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") ChangePCurveOnSurf;
		opencascade::handle<Geom2d_Curve> & ChangePCurveOnSurf();

		/****** ChFiDS_FaceInterference::FirstParameter ******/
		/****** md5 signature: 4ccedbaad83be904f510b4760c75f69c ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** ChFiDS_FaceInterference::LastParameter ******/
		/****** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		Standard_Real LastParameter();

		/****** ChFiDS_FaceInterference::LineIndex ******/
		/****** md5 signature: af9fb0debe68e98e2e0bb7899c89cba3 ******/
		%feature("compactdefaultargs") LineIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") LineIndex;
		Standard_Integer LineIndex();

		/****** ChFiDS_FaceInterference::PCurveOnFace ******/
		/****** md5 signature: 9ffab450fa8f2ab4e8bb4275bd561666 ******/
		%feature("compactdefaultargs") PCurveOnFace;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurveOnFace;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace();

		/****** ChFiDS_FaceInterference::PCurveOnSurf ******/
		/****** md5 signature: 8e550434dd2628b5a0b4330a9c950bb2 ******/
		%feature("compactdefaultargs") PCurveOnSurf;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurveOnSurf;
		const opencascade::handle<Geom2d_Curve> & PCurveOnSurf();

		/****** ChFiDS_FaceInterference::Parameter ******/
		/****** md5 signature: 6e1a73f976dcd9d42920accd4007f409 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
IsFirst: bool

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter(const Standard_Boolean IsFirst);

		/****** ChFiDS_FaceInterference::SetFirstParameter ******/
		/****** md5 signature: 66a146ecdaa6c152259c9690094161f5 ******/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "
Parameters
----------
U1: float

Return
-------
None

Description
-----------
No available documentation.
") SetFirstParameter;
		void SetFirstParameter(const Standard_Real U1);

		/****** ChFiDS_FaceInterference::SetInterference ******/
		/****** md5 signature: a98dba3aad417a54ca288a277242d9c2 ******/
		%feature("compactdefaultargs") SetInterference;
		%feature("autodoc", "
Parameters
----------
LineIndex: int
Trans: TopAbs_Orientation
PCurv1: Geom2d_Curve
PCurv2: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetInterference;
		void SetInterference(const Standard_Integer LineIndex, const TopAbs_Orientation Trans, const opencascade::handle<Geom2d_Curve> & PCurv1, const opencascade::handle<Geom2d_Curve> & PCurv2);

		/****** ChFiDS_FaceInterference::SetLastParameter ******/
		/****** md5 signature: 4fb4fec24280eed5cf49207ba2a859cb ******/
		%feature("compactdefaultargs") SetLastParameter;
		%feature("autodoc", "
Parameters
----------
U1: float

Return
-------
None

Description
-----------
No available documentation.
") SetLastParameter;
		void SetLastParameter(const Standard_Real U1);

		/****** ChFiDS_FaceInterference::SetLineIndex ******/
		/****** md5 signature: a5c84457c710effed03309c68b7e0080 ******/
		%feature("compactdefaultargs") SetLineIndex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") SetLineIndex;
		void SetLineIndex(const Standard_Integer I);

		/****** ChFiDS_FaceInterference::SetParameter ******/
		/****** md5 signature: d404d706cf6c6419b8088620190503fe ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
U1: float
IsFirst: bool

Return
-------
None

Description
-----------
No available documentation.
") SetParameter;
		void SetParameter(const Standard_Real U1, const Standard_Boolean IsFirst);

		/****** ChFiDS_FaceInterference::SetTransition ******/
		/****** md5 signature: c6b23800a90c4cbe4b35094ba16f44ff ******/
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "
Parameters
----------
Trans: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") SetTransition;
		void SetTransition(const TopAbs_Orientation Trans);

		/****** ChFiDS_FaceInterference::Transition ******/
		/****** md5 signature: 054591dc4fd0ee1810f89fdf4fe89b33 ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Transition;
		TopAbs_Orientation Transition();

};


%extend ChFiDS_FaceInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class ChFiDS_Map *
*******************/
class ChFiDS_Map {
	public:
		/****** ChFiDS_Map::ChFiDS_Map ******/
		/****** md5 signature: 973dad57111b92e094842a23e8548091 ******/
		%feature("compactdefaultargs") ChFiDS_Map;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create an empty Map.
") ChFiDS_Map;
		 ChFiDS_Map();

		/****** ChFiDS_Map::Contains ******/
		/****** md5 signature: f099b22f53dc3705b9de7f86b775b20a ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") Contains;
		Standard_Boolean Contains(const TopoDS_Shape & S);

		/****** ChFiDS_Map::Fill ******/
		/****** md5 signature: 5e4d793db169463c7138d45a1bebb3bd ******/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T1: TopAbs_ShapeEnum
T2: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
Fills the map with the subshapes of type T1 as keys and the list of ancestors of type T2 as items.
") Fill;
		void Fill(const TopoDS_Shape & S, const TopAbs_ShapeEnum T1, const TopAbs_ShapeEnum T2);

		/****** ChFiDS_Map::FindFromIndex ******/
		/****** md5 signature: e27fc1939ed1a458284d9db1fe7832e5 ******/
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") FindFromIndex;
		const TopTools_ListOfShape & FindFromIndex(const Standard_Integer I);

		/****** ChFiDS_Map::FindFromKey ******/
		/****** md5 signature: f822fc0350ed0d0f3926ef4f484545ff ******/
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
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
		/****** ChFiDS_Regul::ChFiDS_Regul ******/
		/****** md5 signature: b643b3f2994d7987080efae23eeb868b ******/
		%feature("compactdefaultargs") ChFiDS_Regul;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_Regul;
		 ChFiDS_Regul();

		/****** ChFiDS_Regul::Curve ******/
		/****** md5 signature: 246fcc6b84e8ea0976c82438745a18e2 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curve;
		Standard_Integer Curve();

		/****** ChFiDS_Regul::IsSurface1 ******/
		/****** md5 signature: 1c53bb199493b75cd867c8b8f1857b7e ******/
		%feature("compactdefaultargs") IsSurface1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSurface1;
		Standard_Boolean IsSurface1();

		/****** ChFiDS_Regul::IsSurface2 ******/
		/****** md5 signature: 3786cfa4e1033fd0661f2149711c4979 ******/
		%feature("compactdefaultargs") IsSurface2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSurface2;
		Standard_Boolean IsSurface2();

		/****** ChFiDS_Regul::S1 ******/
		/****** md5 signature: 7361e2dcae16373490107e5583aaf589 ******/
		%feature("compactdefaultargs") S1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") S1;
		Standard_Integer S1();

		/****** ChFiDS_Regul::S2 ******/
		/****** md5 signature: c836932bf1af4e841c58b4c6a36aeaf0 ******/
		%feature("compactdefaultargs") S2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") S2;
		Standard_Integer S2();

		/****** ChFiDS_Regul::SetCurve ******/
		/****** md5 signature: ba1234c816a1bb5dd773be07b8fffae8 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const Standard_Integer IC);

		/****** ChFiDS_Regul::SetS1 ******/
		/****** md5 signature: d114cea9a6abd7c04e0272eb6007472c ******/
		%feature("compactdefaultargs") SetS1;
		%feature("autodoc", "
Parameters
----------
IS1: int
IsFace: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") SetS1;
		void SetS1(const Standard_Integer IS1, const Standard_Boolean IsFace = Standard_True);

		/****** ChFiDS_Regul::SetS2 ******/
		/****** md5 signature: 5178f4086ad526928fce374b96c2fec1 ******/
		%feature("compactdefaultargs") SetS2;
		%feature("autodoc", "
Parameters
----------
IS2: int
IsFace: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
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
		/****** ChFiDS_Spine::ChFiDS_Spine ******/
		/****** md5 signature: 0e6c96be283b45848a0526cfc52ba787 ******/
		%feature("compactdefaultargs") ChFiDS_Spine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_Spine;
		 ChFiDS_Spine();

		/****** ChFiDS_Spine::ChFiDS_Spine ******/
		/****** md5 signature: 69bf141eeae74093a4bfd1758f04012c ******/
		%feature("compactdefaultargs") ChFiDS_Spine;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_Spine;
		 ChFiDS_Spine(const Standard_Real Tol);

		/****** ChFiDS_Spine::Absc ******/
		/****** md5 signature: 0fcb71e8c4d0991d4bf628fec7467762 ******/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
No available documentation.
") Absc;
		Standard_Real Absc(const Standard_Real U);

		/****** ChFiDS_Spine::Absc ******/
		/****** md5 signature: 675de99f7389e5730307190bef4c9a62 ******/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "
Parameters
----------
U: float
I: int

Return
-------
float

Description
-----------
No available documentation.
") Absc;
		Standard_Real Absc(const Standard_Real U, const Standard_Integer I);

		/****** ChFiDS_Spine::Absc ******/
		/****** md5 signature: 73e436bf62d13ac2b7905d3f4ff661eb ******/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
float

Description
-----------
No available documentation.
") Absc;
		Standard_Real Absc(const TopoDS_Vertex & V);

		/****** ChFiDS_Spine::AppendElSpine ******/
		/****** md5 signature: ede48293dc1624531bd53eae90637b01 ******/
		%feature("compactdefaultargs") AppendElSpine;
		%feature("autodoc", "
Parameters
----------
Els: ChFiDS_ElSpine

Return
-------
None

Description
-----------
No available documentation.
") AppendElSpine;
		virtual void AppendElSpine(const opencascade::handle<ChFiDS_ElSpine> & Els);

		/****** ChFiDS_Spine::AppendOffsetElSpine ******/
		/****** md5 signature: 95d04dc7c2b33d672976bf39c81489b8 ******/
		%feature("compactdefaultargs") AppendOffsetElSpine;
		%feature("autodoc", "
Parameters
----------
Els: ChFiDS_ElSpine

Return
-------
None

Description
-----------
No available documentation.
") AppendOffsetElSpine;
		virtual void AppendOffsetElSpine(const opencascade::handle<ChFiDS_ElSpine> & Els);

		/****** ChFiDS_Spine::ChangeElSpines ******/
		/****** md5 signature: da07220d851808a3a9bd3eb7b7c1f436 ******/
		%feature("compactdefaultargs") ChangeElSpines;
		%feature("autodoc", "Return
-------
ChFiDS_ListOfHElSpine

Description
-----------
No available documentation.
") ChangeElSpines;
		ChFiDS_ListOfHElSpine & ChangeElSpines();

		/****** ChFiDS_Spine::ChangeOffsetElSpines ******/
		/****** md5 signature: df5b593fad1988821c82858086d7da93 ******/
		%feature("compactdefaultargs") ChangeOffsetElSpines;
		%feature("autodoc", "Return
-------
ChFiDS_ListOfHElSpine

Description
-----------
No available documentation.
") ChangeOffsetElSpines;
		ChFiDS_ListOfHElSpine & ChangeOffsetElSpines();

		/****** ChFiDS_Spine::Circle ******/
		/****** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** ChFiDS_Spine::CurrentElementarySpine ******/
		/****** md5 signature: ebf570cca4dd01a3b354a55130d60083 ******/
		%feature("compactdefaultargs") CurrentElementarySpine;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
BRepAdaptor_Curve

Description
-----------
sets the current curve and returns it.
") CurrentElementarySpine;
		BRepAdaptor_Curve CurrentElementarySpine(const Standard_Integer Index);

		/****** ChFiDS_Spine::CurrentIndexOfElementarySpine ******/
		/****** md5 signature: 6987473580f0e6e3e57d9cf51fd473ea ******/
		%feature("compactdefaultargs") CurrentIndexOfElementarySpine;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CurrentIndexOfElementarySpine;
		Standard_Integer CurrentIndexOfElementarySpine();

		/****** ChFiDS_Spine::D0 ******/
		/****** md5 signature: 44a3de94c03d6c53050ebe26e6846129 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
AbsC: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real AbsC, gp_Pnt & P);

		/****** ChFiDS_Spine::D1 ******/
		/****** md5 signature: 5d82740615c70fe17ed6f28d75ed8f63 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
AbsC: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real AbsC, gp_Pnt & P, gp_Vec & V1);

		/****** ChFiDS_Spine::D2 ******/
		/****** md5 signature: c983c708a57ca80b2c76c9a6dfcbd6d5 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
AbsC: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real AbsC, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ChFiDS_Spine::Edges ******/
		/****** md5 signature: 9520525f1c3103f30fb61fd68a118272 ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edges;
		const TopoDS_Edge Edges(const Standard_Integer I);

		/****** ChFiDS_Spine::ElSpine ******/
		/****** md5 signature: 4f2d3b9c01c3241e7da904843452e45a ******/
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", "
Parameters
----------
IE: int

Return
-------
opencascade::handle<ChFiDS_ElSpine>

Description
-----------
No available documentation.
") ElSpine;
		opencascade::handle<ChFiDS_ElSpine> ElSpine(const Standard_Integer IE);

		/****** ChFiDS_Spine::ElSpine ******/
		/****** md5 signature: ca68c09c1a4fca52b0ec8982006abd2f ******/
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
opencascade::handle<ChFiDS_ElSpine>

Description
-----------
No available documentation.
") ElSpine;
		opencascade::handle<ChFiDS_ElSpine> ElSpine(const TopoDS_Edge & E);

		/****** ChFiDS_Spine::ElSpine ******/
		/****** md5 signature: dea9d922cd6fd6701ac14ca526f46966 ******/
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", "
Parameters
----------
W: float

Return
-------
opencascade::handle<ChFiDS_ElSpine>

Description
-----------
No available documentation.
") ElSpine;
		opencascade::handle<ChFiDS_ElSpine> ElSpine(const Standard_Real W);

		/****** ChFiDS_Spine::ErrorStatus ******/
		/****** md5 signature: 2f7016f891923155aac331ba8260eaa0 ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
ChFiDS_ErrorStatus

Description
-----------
No available documentation.
") ErrorStatus;
		ChFiDS_ErrorStatus ErrorStatus();

		/****** ChFiDS_Spine::FirstParameter ******/
		/****** md5 signature: 4ccedbaad83be904f510b4760c75f69c ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** ChFiDS_Spine::FirstParameter ******/
		/****** md5 signature: 43e78c2d3dcec0442b4c6f7d4e9d550a ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
IndexSpine: int

Return
-------
float

Description
-----------
gives the total length of all arcs before the number IndexSp.
") FirstParameter;
		Standard_Real FirstParameter(const Standard_Integer IndexSpine);

		/****** ChFiDS_Spine::FirstStatus ******/
		/****** md5 signature: 50597ffb992e45ab92d72d217bf44f0d ******/
		%feature("compactdefaultargs") FirstStatus;
		%feature("autodoc", "Return
-------
ChFiDS_State

Description
-----------
returns if the set of edges starts on a free boundary or if the first vertex is a breakpoint or if the set is closed.
") FirstStatus;
		ChFiDS_State FirstStatus();

		/****** ChFiDS_Spine::FirstVertex ******/
		/****** md5 signature: a9d0a449a5497cf4780955cbe0b44200 ******/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") FirstVertex;
		TopoDS_Vertex FirstVertex();

		/****** ChFiDS_Spine::GetTolesp ******/
		/****** md5 signature: 217c13748b3cb2bf2cc59e96cafe8207 ******/
		%feature("compactdefaultargs") GetTolesp;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return tolesp parameter.
") GetTolesp;
		Standard_Real GetTolesp();

		/****** ChFiDS_Spine::GetType ******/
		/****** md5 signature: 6d4e6ae7972633971ba343e8afc91aa1 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		GeomAbs_CurveType GetType();

		/****** ChFiDS_Spine::GetTypeOfConcavity ******/
		/****** md5 signature: 03c88f7995e55bceb70d1b6aab2e61f4 ******/
		%feature("compactdefaultargs") GetTypeOfConcavity;
		%feature("autodoc", "Return
-------
ChFiDS_TypeOfConcavity

Description
-----------
returns the type of concavity in the connection.
") GetTypeOfConcavity;
		ChFiDS_TypeOfConcavity GetTypeOfConcavity();

		/****** ChFiDS_Spine::HasFirstTgt ******/
		/****** md5 signature: 9b196c93880f437114c8ea979581acea ******/
		%feature("compactdefaultargs") HasFirstTgt;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasFirstTgt;
		Standard_Boolean HasFirstTgt();

		/****** ChFiDS_Spine::HasLastTgt ******/
		/****** md5 signature: 2cba4c4f6e09df1a2f01573597139cdc ******/
		%feature("compactdefaultargs") HasLastTgt;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasLastTgt;
		Standard_Boolean HasLastTgt();

		/****** ChFiDS_Spine::Index ******/
		/****** md5 signature: 3f748690e0677200c2dc24172c072dfb ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
W: float
Forward: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index(const Standard_Real W, const Standard_Boolean Forward = Standard_True);

		/****** ChFiDS_Spine::Index ******/
		/****** md5 signature: 49ccac80c083800f0efd13d0804ff82b ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index(const TopoDS_Edge & E);

		/****** ChFiDS_Spine::IsClosed ******/
		/****** md5 signature: 29709d02fadc9fcb79a766bc9679271b ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** ChFiDS_Spine::IsPeriodic ******/
		/****** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** ChFiDS_Spine::IsTangencyExtremity ******/
		/****** md5 signature: a8210f1da4c1179547e590586db2e9fc ******/
		%feature("compactdefaultargs") IsTangencyExtremity;
		%feature("autodoc", "
Parameters
----------
IsFirst: bool

Return
-------
bool

Description
-----------
returns if the set of edges starts (or end) on Tangency point.
") IsTangencyExtremity;
		Standard_Boolean IsTangencyExtremity(const Standard_Boolean IsFirst);

		/****** ChFiDS_Spine::LastParameter ******/
		/****** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		Standard_Real LastParameter();

		/****** ChFiDS_Spine::LastParameter ******/
		/****** md5 signature: 366210a41f77093ca4e26a0a007fd1c7 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
IndexSpine: int

Return
-------
float

Description
-----------
gives the total length till the ark with number IndexSpine (inclus).
") LastParameter;
		Standard_Real LastParameter(const Standard_Integer IndexSpine);

		/****** ChFiDS_Spine::LastStatus ******/
		/****** md5 signature: b6ecda5b6d98b4e6874281ffca404974 ******/
		%feature("compactdefaultargs") LastStatus;
		%feature("autodoc", "Return
-------
ChFiDS_State

Description
-----------
returns the state at the end of the set.
") LastStatus;
		ChFiDS_State LastStatus();

		/****** ChFiDS_Spine::LastVertex ******/
		/****** md5 signature: 51a30300c8c457be7fee4de369d38666 ******/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") LastVertex;
		TopoDS_Vertex LastVertex();

		/****** ChFiDS_Spine::Length ******/
		/****** md5 signature: 926b764d195681905675afe57b7fea5c ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
IndexSpine: int

Return
-------
float

Description
-----------
gives the length of ark with number IndexSp.
") Length;
		Standard_Real Length(const Standard_Integer IndexSpine);

		/****** ChFiDS_Spine::Line ******/
		/****** md5 signature: 63e1fa189ca3bcfdb401241217a93bfb ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** ChFiDS_Spine::Load ******/
		/****** md5 signature: 14bc79a16a4ba0fe93224560bb579cb0 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Return
-------
None

Description
-----------
prepare the guideline depending on the edges that are elementary arks (take parameters from a single curvilinear abscissa); to be able to call methods on the geometry (first,last,value,d1,d2) it is necessary to start with preparation otherwise an exception will be raised.
") Load;
		void Load();

		/****** ChFiDS_Spine::Mode ******/
		/****** md5 signature: 646b757cb6ae4ed9f283015af34597e7 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
ChFiDS_ChamfMode

Description
-----------
Return the mode of chamfers used.
") Mode;
		ChFiDS_ChamfMode Mode();

		/****** ChFiDS_Spine::NbEdges ******/
		/****** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEdges;
		Standard_Integer NbEdges();

		/****** ChFiDS_Spine::OffsetEdges ******/
		/****** md5 signature: 023ae8426dd348d41da1fc3390821a18 ******/
		%feature("compactdefaultargs") OffsetEdges;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") OffsetEdges;
		const TopoDS_Edge OffsetEdges(const Standard_Integer I);

		/****** ChFiDS_Spine::Parameter ******/
		/****** md5 signature: f6408694e8db59cfea682b2df277b46e ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
AbsC: float
Oriented: bool (optional, default to Standard_True)

Return
-------
U: float

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const Standard_Real AbsC, Standard_Real &OutValue, const Standard_Boolean Oriented = Standard_True);

		/****** ChFiDS_Spine::Parameter ******/
		/****** md5 signature: b0623594a2f8c3e8d9682053b9bc9428 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int
AbsC: float
Oriented: bool (optional, default to Standard_True)

Return
-------
U: float

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const Standard_Integer Index, const Standard_Real AbsC, Standard_Real &OutValue, const Standard_Boolean Oriented = Standard_True);

		/****** ChFiDS_Spine::Period ******/
		/****** md5 signature: 0270204961d3b0052ffe029cbcdbacd9 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Period;
		Standard_Real Period();

		/****** ChFiDS_Spine::PutInFirst ******/
		/****** md5 signature: 42323ad897907ad53dba909bcf69916c ******/
		%feature("compactdefaultargs") PutInFirst;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
store the edge at the first position before all others.
") PutInFirst;
		void PutInFirst(const TopoDS_Edge & E);

		/****** ChFiDS_Spine::PutInFirstOffset ******/
		/****** md5 signature: 8ecfdbf9078cc56964347649621d6b37 ******/
		%feature("compactdefaultargs") PutInFirstOffset;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
store the offset edge at the first position before all others.
") PutInFirstOffset;
		void PutInFirstOffset(const TopoDS_Edge & E);

		/****** ChFiDS_Spine::Reset ******/
		/****** md5 signature: b38141635965f0cadd351580233542fa ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
AllData: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Reset;
		virtual void Reset(const Standard_Boolean AllData = Standard_False);

		/****** ChFiDS_Spine::Resolution ******/
		/****** md5 signature: 955dbc498c06516d62e17e1e8d38cba7 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
No available documentation.
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****** ChFiDS_Spine::SetCurrent ******/
		/****** md5 signature: b163c78c1924d8c473179ae0f702e2b8 ******/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") SetCurrent;
		void SetCurrent(const Standard_Integer Index);

		/****** ChFiDS_Spine::SetEdges ******/
		/****** md5 signature: fe28ef02235441ee10e561bb0206a043 ******/
		%feature("compactdefaultargs") SetEdges;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
store edges composing the guideline.
") SetEdges;
		void SetEdges(const TopoDS_Edge & E);

		/****** ChFiDS_Spine::SetErrorStatus ******/
		/****** md5 signature: f9de54b1f1fa50526f053773a4c2fa64 ******/
		%feature("compactdefaultargs") SetErrorStatus;
		%feature("autodoc", "
Parameters
----------
state: ChFiDS_ErrorStatus

Return
-------
None

Description
-----------
No available documentation.
") SetErrorStatus;
		void SetErrorStatus(const ChFiDS_ErrorStatus state);

		/****** ChFiDS_Spine::SetFirstParameter ******/
		/****** md5 signature: 6a2e52e0e61601a1f5ba51e18658c5ce ******/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "
Parameters
----------
Par: float

Return
-------
None

Description
-----------
No available documentation.
") SetFirstParameter;
		void SetFirstParameter(const Standard_Real Par);

		/****** ChFiDS_Spine::SetFirstStatus ******/
		/****** md5 signature: d77c159df2076b6b62b20f6985d86432 ******/
		%feature("compactdefaultargs") SetFirstStatus;
		%feature("autodoc", "
Parameters
----------
S: ChFiDS_State

Return
-------
None

Description
-----------
stores if the start of a set of edges starts on a section of free border or forms a closed contour.
") SetFirstStatus;
		void SetFirstStatus(const ChFiDS_State S);

		/****** ChFiDS_Spine::SetFirstTgt ******/
		/****** md5 signature: d975ed3950244fc7eabbe6c08e8a2878 ******/
		%feature("compactdefaultargs") SetFirstTgt;
		%feature("autodoc", "
Parameters
----------
W: float

Return
-------
None

Description
-----------
No available documentation.
") SetFirstTgt;
		void SetFirstTgt(const Standard_Real W);

		/****** ChFiDS_Spine::SetLastParameter ******/
		/****** md5 signature: ee92068a5cb2a54f8f050c2704670a1b ******/
		%feature("compactdefaultargs") SetLastParameter;
		%feature("autodoc", "
Parameters
----------
Par: float

Return
-------
None

Description
-----------
No available documentation.
") SetLastParameter;
		void SetLastParameter(const Standard_Real Par);

		/****** ChFiDS_Spine::SetLastStatus ******/
		/****** md5 signature: a8144c2e2ced4bb9cfd41e3485bbe1b2 ******/
		%feature("compactdefaultargs") SetLastStatus;
		%feature("autodoc", "
Parameters
----------
S: ChFiDS_State

Return
-------
None

Description
-----------
stores if the end of a set of edges starts on a section of free border or forms a closed contour.
") SetLastStatus;
		void SetLastStatus(const ChFiDS_State S);

		/****** ChFiDS_Spine::SetLastTgt ******/
		/****** md5 signature: e03b8adbbab3a9d6e9fd1f49184126ea ******/
		%feature("compactdefaultargs") SetLastTgt;
		%feature("autodoc", "
Parameters
----------
W: float

Return
-------
None

Description
-----------
No available documentation.
") SetLastTgt;
		void SetLastTgt(const Standard_Real W);

		/****** ChFiDS_Spine::SetOffsetEdges ******/
		/****** md5 signature: 87a9a0e91bf387d101e8a06a591da1b1 ******/
		%feature("compactdefaultargs") SetOffsetEdges;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
store offset edges composing the offset guideline.
") SetOffsetEdges;
		void SetOffsetEdges(const TopoDS_Edge & E);

		/****** ChFiDS_Spine::SetReference ******/
		/****** md5 signature: 3a8b5dd00fd5d7398ee966850f76fe13 ******/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "
Parameters
----------
W: float

Return
-------
None

Description
-----------
set a parameter reference for the approx.
") SetReference;
		void SetReference(const Standard_Real W);

		/****** ChFiDS_Spine::SetReference ******/
		/****** md5 signature: 0f054f194fe4862ac635de5ef9c15f94 ******/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
set a parameter reference for the approx, at the middle of edge I.
") SetReference;
		void SetReference(const Standard_Integer I);

		/****** ChFiDS_Spine::SetStatus ******/
		/****** md5 signature: 5fd64ab9882277f6b1fc7a49a50d1342 ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
S: ChFiDS_State
IsFirst: bool

Return
-------
None

Description
-----------
No available documentation.
") SetStatus;
		void SetStatus(const ChFiDS_State S, const Standard_Boolean IsFirst);

		/****** ChFiDS_Spine::SetTangencyExtremity ******/
		/****** md5 signature: fd36b4a0e9cda0189944269998d8e8fd ******/
		%feature("compactdefaultargs") SetTangencyExtremity;
		%feature("autodoc", "
Parameters
----------
IsTangency: bool
IsFirst: bool

Return
-------
None

Description
-----------
No available documentation.
") SetTangencyExtremity;
		void SetTangencyExtremity(const Standard_Boolean IsTangency, const Standard_Boolean IsFirst);

		/****** ChFiDS_Spine::SetTypeOfConcavity ******/
		/****** md5 signature: ee22fc43cd6253adde8756526c94bf06 ******/
		%feature("compactdefaultargs") SetTypeOfConcavity;
		%feature("autodoc", "
Parameters
----------
theType: ChFiDS_TypeOfConcavity

Return
-------
None

Description
-----------
sets the type of concavity in the connection.
") SetTypeOfConcavity;
		void SetTypeOfConcavity(const ChFiDS_TypeOfConcavity theType);

		/****** ChFiDS_Spine::SplitDone ******/
		/****** md5 signature: fe2c9168a5cde6a3136bcf314c46600a ******/
		%feature("compactdefaultargs") SplitDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SplitDone;
		Standard_Boolean SplitDone();

		/****** ChFiDS_Spine::SplitDone ******/
		/****** md5 signature: 51227265bfba30085217e0dddb32ef11 ******/
		%feature("compactdefaultargs") SplitDone;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") SplitDone;
		void SplitDone(const Standard_Boolean B);

		/****** ChFiDS_Spine::Status ******/
		/****** md5 signature: 2d1d2e8edcc0c537fdec0b339a92e500 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
IsFirst: bool

Return
-------
ChFiDS_State

Description
-----------
No available documentation.
") Status;
		ChFiDS_State Status(const Standard_Boolean IsFirst);

		/****** ChFiDS_Spine::UnsetReference ******/
		/****** md5 signature: 5b60ccb91b7978ec5de638bf27913a17 ******/
		%feature("compactdefaultargs") UnsetReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetReference;
		void UnsetReference();

		/****** ChFiDS_Spine::Value ******/
		/****** md5 signature: 8f4832a5df54c11193b328e54fef02cd ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
AbsC: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
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
		/****** ChFiDS_Stripe::ChFiDS_Stripe ******/
		/****** md5 signature: cd5f6e9ec67c7963807c2979dc44998f ******/
		%feature("compactdefaultargs") ChFiDS_Stripe;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_Stripe;
		 ChFiDS_Stripe();

		/****** ChFiDS_Stripe::ChangeFirstCurve ******/
		/****** md5 signature: 64afe48b2b2e0de75967baed9ae805b2 ******/
		%feature("compactdefaultargs") ChangeFirstCurve;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeFirstCurve;
		void ChangeFirstCurve(const Standard_Integer Index);

		/****** ChFiDS_Stripe::ChangeFirstPCurve ******/
		/****** md5 signature: 4c3a2910e0a4ada6305295597483d2b7 ******/
		%feature("compactdefaultargs") ChangeFirstPCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") ChangeFirstPCurve;
		opencascade::handle<Geom2d_Curve> & ChangeFirstPCurve();

		/****** ChFiDS_Stripe::ChangeFirstParameters ******/
		/****** md5 signature: 1405a444bb650f1cff1e8f70dd710961 ******/
		%feature("compactdefaultargs") ChangeFirstParameters;
		%feature("autodoc", "
Parameters
----------
Pdeb: float
Pfin: float

Return
-------
None

Description
-----------
No available documentation.
") ChangeFirstParameters;
		void ChangeFirstParameters(const Standard_Real Pdeb, const Standard_Real Pfin);

		/****** ChFiDS_Stripe::ChangeIndexFirstPointOnS1 ******/
		/****** md5 signature: dd0905ce8f519caac604d0878819752b ******/
		%feature("compactdefaultargs") ChangeIndexFirstPointOnS1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeIndexFirstPointOnS1;
		void ChangeIndexFirstPointOnS1(const Standard_Integer Index);

		/****** ChFiDS_Stripe::ChangeIndexFirstPointOnS2 ******/
		/****** md5 signature: e717349708084d2ba0268af2f99bae5e ******/
		%feature("compactdefaultargs") ChangeIndexFirstPointOnS2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeIndexFirstPointOnS2;
		void ChangeIndexFirstPointOnS2(const Standard_Integer Index);

		/****** ChFiDS_Stripe::ChangeIndexLastPointOnS1 ******/
		/****** md5 signature: ae86e60291183382f929be0f0181777b ******/
		%feature("compactdefaultargs") ChangeIndexLastPointOnS1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeIndexLastPointOnS1;
		void ChangeIndexLastPointOnS1(const Standard_Integer Index);

		/****** ChFiDS_Stripe::ChangeIndexLastPointOnS2 ******/
		/****** md5 signature: be14a55f58ce51c0c7e8d3ae2a94acc0 ******/
		%feature("compactdefaultargs") ChangeIndexLastPointOnS2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeIndexLastPointOnS2;
		void ChangeIndexLastPointOnS2(const Standard_Integer Index);

		/****** ChFiDS_Stripe::ChangeLastCurve ******/
		/****** md5 signature: ec90f9463a1b17f9446b2ffd17f81783 ******/
		%feature("compactdefaultargs") ChangeLastCurve;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeLastCurve;
		void ChangeLastCurve(const Standard_Integer Index);

		/****** ChFiDS_Stripe::ChangeLastPCurve ******/
		/****** md5 signature: 26816c8546bc85460a1d73fc2ba2ed1a ******/
		%feature("compactdefaultargs") ChangeLastPCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") ChangeLastPCurve;
		opencascade::handle<Geom2d_Curve> & ChangeLastPCurve();

		/****** ChFiDS_Stripe::ChangeLastParameters ******/
		/****** md5 signature: be44a3b27b758b559e9cd0b16c1a19b8 ******/
		%feature("compactdefaultargs") ChangeLastParameters;
		%feature("autodoc", "
Parameters
----------
Pdeb: float
Pfin: float

Return
-------
None

Description
-----------
No available documentation.
") ChangeLastParameters;
		void ChangeLastParameters(const Standard_Real Pdeb, const Standard_Real Pfin);

		/****** ChFiDS_Stripe::ChangePCurve ******/
		/****** md5 signature: 4d15bb5c05522fd834cba04b802760b2 ******/
		%feature("compactdefaultargs") ChangePCurve;
		%feature("autodoc", "
Parameters
----------
First: bool

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") ChangePCurve;
		opencascade::handle<Geom2d_Curve> & ChangePCurve(const Standard_Boolean First);

		/****** ChFiDS_Stripe::ChangeSetOfSurfData ******/
		/****** md5 signature: b816f955dbe517b2d321f59f961a85db ******/
		%feature("compactdefaultargs") ChangeSetOfSurfData;
		%feature("autodoc", "Return
-------
opencascade::handle<ChFiDS_HData>

Description
-----------
No available documentation.
") ChangeSetOfSurfData;
		opencascade::handle<ChFiDS_HData> & ChangeSetOfSurfData();

		/****** ChFiDS_Stripe::ChangeSpine ******/
		/****** md5 signature: 111982dc16f5c59f6e1f0e0a045654cf ******/
		%feature("compactdefaultargs") ChangeSpine;
		%feature("autodoc", "Return
-------
opencascade::handle<ChFiDS_Spine>

Description
-----------
No available documentation.
") ChangeSpine;
		opencascade::handle<ChFiDS_Spine> & ChangeSpine();

		/****** ChFiDS_Stripe::Choix ******/
		/****** md5 signature: 56d44f443206b1fa3fc4d5896c29d333 ******/
		%feature("compactdefaultargs") Choix;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Choix;
		Standard_Integer Choix();

		/****** ChFiDS_Stripe::Choix ******/
		/****** md5 signature: 7098bc3f3221f811ff516ed38dbafc43 ******/
		%feature("compactdefaultargs") Choix;
		%feature("autodoc", "
Parameters
----------
C: int

Return
-------
None

Description
-----------
No available documentation.
") Choix;
		void Choix(const Standard_Integer C);

		/****** ChFiDS_Stripe::Curve ******/
		/****** md5 signature: c42994028e166e54fa54a45e4ff3466f ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
First: bool

Return
-------
int

Description
-----------
No available documentation.
") Curve;
		Standard_Integer Curve(const Standard_Boolean First);

		/****** ChFiDS_Stripe::FirstCurve ******/
		/****** md5 signature: 60996397389363fc426c2e9259e80745 ******/
		%feature("compactdefaultargs") FirstCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FirstCurve;
		Standard_Integer FirstCurve();

		/****** ChFiDS_Stripe::FirstPCurve ******/
		/****** md5 signature: 3275b667b2b0b6418edc91afc7389f29 ******/
		%feature("compactdefaultargs") FirstPCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") FirstPCurve;
		const opencascade::handle<Geom2d_Curve> & FirstPCurve();

		/****** ChFiDS_Stripe::FirstPCurveOrientation ******/
		/****** md5 signature: f941a3a9194fdca769d8d5a48fb4bf2e ******/
		%feature("compactdefaultargs") FirstPCurveOrientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") FirstPCurveOrientation;
		TopAbs_Orientation FirstPCurveOrientation();

		/****** ChFiDS_Stripe::FirstPCurveOrientation ******/
		/****** md5 signature: 7378d4fdf054f6803ef4d1b1c3bfebe1 ******/
		%feature("compactdefaultargs") FirstPCurveOrientation;
		%feature("autodoc", "
Parameters
----------
O: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") FirstPCurveOrientation;
		void FirstPCurveOrientation(const TopAbs_Orientation O);

		/****** ChFiDS_Stripe::FirstParameters ******/
		/****** md5 signature: b43cd7691f73448e706863640f0dca48 ******/
		%feature("compactdefaultargs") FirstParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
Pdeb: float
Pfin: float

Description
-----------
No available documentation.
") FirstParameters;
		void FirstParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_Stripe::InDS ******/
		/****** md5 signature: a5871e23609fcaa44d3f69008692f43a ******/
		%feature("compactdefaultargs") InDS;
		%feature("autodoc", "
Parameters
----------
First: bool
Nb: int (optional, default to 1)

Return
-------
None

Description
-----------
Set nb of SurfData's at end put in DS.
") InDS;
		void InDS(const Standard_Boolean First, const Standard_Integer Nb = 1);

		/****** ChFiDS_Stripe::IndexFirstPointOnS1 ******/
		/****** md5 signature: 0cb214af2c656e7adaca42c868ab4c95 ******/
		%feature("compactdefaultargs") IndexFirstPointOnS1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexFirstPointOnS1;
		Standard_Integer IndexFirstPointOnS1();

		/****** ChFiDS_Stripe::IndexFirstPointOnS2 ******/
		/****** md5 signature: 6fc8025c2af83728a43c896a6e828c5d ******/
		%feature("compactdefaultargs") IndexFirstPointOnS2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexFirstPointOnS2;
		Standard_Integer IndexFirstPointOnS2();

		/****** ChFiDS_Stripe::IndexLastPointOnS1 ******/
		/****** md5 signature: 87ccadbfd52d6d960ecd36487129ed37 ******/
		%feature("compactdefaultargs") IndexLastPointOnS1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexLastPointOnS1;
		Standard_Integer IndexLastPointOnS1();

		/****** ChFiDS_Stripe::IndexLastPointOnS2 ******/
		/****** md5 signature: 604bbd01c4500957c46c3939b989aac6 ******/
		%feature("compactdefaultargs") IndexLastPointOnS2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexLastPointOnS2;
		Standard_Integer IndexLastPointOnS2();

		/****** ChFiDS_Stripe::IndexPoint ******/
		/****** md5 signature: b6c9341a0da84b7f7c54cf09ce53baf1 ******/
		%feature("compactdefaultargs") IndexPoint;
		%feature("autodoc", "
Parameters
----------
First: bool
OnS: int

Return
-------
int

Description
-----------
No available documentation.
") IndexPoint;
		Standard_Integer IndexPoint(const Standard_Boolean First, const Standard_Integer OnS);

		/****** ChFiDS_Stripe::IsInDS ******/
		/****** md5 signature: cd05c727dce6b8210afc351e5ac7fd91 ******/
		%feature("compactdefaultargs") IsInDS;
		%feature("autodoc", "
Parameters
----------
First: bool

Return
-------
int

Description
-----------
Returns nb of SurfData's at end being in DS.
") IsInDS;
		Standard_Integer IsInDS(const Standard_Boolean First);

		/****** ChFiDS_Stripe::LastCurve ******/
		/****** md5 signature: d6610cdfb3323f36ef3f5b49a9fc1453 ******/
		%feature("compactdefaultargs") LastCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") LastCurve;
		Standard_Integer LastCurve();

		/****** ChFiDS_Stripe::LastPCurve ******/
		/****** md5 signature: cb9a448d17d26a7972588092a53e1ea9 ******/
		%feature("compactdefaultargs") LastPCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") LastPCurve;
		const opencascade::handle<Geom2d_Curve> & LastPCurve();

		/****** ChFiDS_Stripe::LastPCurveOrientation ******/
		/****** md5 signature: 260fa231af1e53202bfa91a250f41e7b ******/
		%feature("compactdefaultargs") LastPCurveOrientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") LastPCurveOrientation;
		TopAbs_Orientation LastPCurveOrientation();

		/****** ChFiDS_Stripe::LastPCurveOrientation ******/
		/****** md5 signature: 0b20502ae503e6be8ea2762a18bbd386 ******/
		%feature("compactdefaultargs") LastPCurveOrientation;
		%feature("autodoc", "
Parameters
----------
O: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") LastPCurveOrientation;
		void LastPCurveOrientation(const TopAbs_Orientation O);

		/****** ChFiDS_Stripe::LastParameters ******/
		/****** md5 signature: 339528eb2397be639136e26491e13a98 ******/
		%feature("compactdefaultargs") LastParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
Pdeb: float
Pfin: float

Description
-----------
No available documentation.
") LastParameters;
		void LastParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_Stripe::Orientation ******/
		/****** md5 signature: e459d64aa914c0c6260ec32e9a5b7eae ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
OnS: int

Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation(const Standard_Integer OnS);

		/****** ChFiDS_Stripe::Orientation ******/
		/****** md5 signature: 5e69f6fd26a9a3ace7299c96327f2db6 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
First: bool

Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation(const Standard_Boolean First);

		/****** ChFiDS_Stripe::OrientationOnFace1 ******/
		/****** md5 signature: 99a202362c7060da6590bb4c43c41e5e ******/
		%feature("compactdefaultargs") OrientationOnFace1;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") OrientationOnFace1;
		TopAbs_Orientation OrientationOnFace1();

		/****** ChFiDS_Stripe::OrientationOnFace1 ******/
		/****** md5 signature: d95a2afb74307fb681f8466deee684df ******/
		%feature("compactdefaultargs") OrientationOnFace1;
		%feature("autodoc", "
Parameters
----------
Or1: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") OrientationOnFace1;
		void OrientationOnFace1(const TopAbs_Orientation Or1);

		/****** ChFiDS_Stripe::OrientationOnFace2 ******/
		/****** md5 signature: 0e0542fc626ccc4d814180eacbb452b6 ******/
		%feature("compactdefaultargs") OrientationOnFace2;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") OrientationOnFace2;
		TopAbs_Orientation OrientationOnFace2();

		/****** ChFiDS_Stripe::OrientationOnFace2 ******/
		/****** md5 signature: 16661c6f48616178d38edd0d539a2187 ******/
		%feature("compactdefaultargs") OrientationOnFace2;
		%feature("autodoc", "
Parameters
----------
Or2: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") OrientationOnFace2;
		void OrientationOnFace2(const TopAbs_Orientation Or2);

		/****** ChFiDS_Stripe::PCurve ******/
		/****** md5 signature: 9fa93399392272abea49fa61f719aa07 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
First: bool

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve(const Standard_Boolean First);

		/****** ChFiDS_Stripe::Parameters ******/
		/****** md5 signature: e434f92bc401b080e1f82d4278f0b49d ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
First: bool

Return
-------
Pdeb: float
Pfin: float

Description
-----------
No available documentation.
") Parameters;
		void Parameters(const Standard_Boolean First, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_Stripe::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset everything except Spine.
") Reset;
		void Reset();

		/****** ChFiDS_Stripe::SetCurve ******/
		/****** md5 signature: 33d4a3b4d710b3b8650fa405c30f22f4 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
Index: int
First: bool

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const Standard_Integer Index, const Standard_Boolean First);

		/****** ChFiDS_Stripe::SetIndexPoint ******/
		/****** md5 signature: c41b722b86a09aa685a4475ec2df0601 ******/
		%feature("compactdefaultargs") SetIndexPoint;
		%feature("autodoc", "
Parameters
----------
Index: int
First: bool
OnS: int

Return
-------
None

Description
-----------
No available documentation.
") SetIndexPoint;
		void SetIndexPoint(const Standard_Integer Index, const Standard_Boolean First, const Standard_Integer OnS);

		/****** ChFiDS_Stripe::SetOfSurfData ******/
		/****** md5 signature: a442d39e57ce35749e899380e2ecc9bc ******/
		%feature("compactdefaultargs") SetOfSurfData;
		%feature("autodoc", "Return
-------
opencascade::handle<ChFiDS_HData>

Description
-----------
No available documentation.
") SetOfSurfData;
		const opencascade::handle<ChFiDS_HData> & SetOfSurfData();

		/****** ChFiDS_Stripe::SetOrientation ******/
		/****** md5 signature: 749bd92540850256c711d2ad35ac8cad ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
Or: TopAbs_Orientation
OnS: int

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation;
		void SetOrientation(const TopAbs_Orientation Or, const Standard_Integer OnS);

		/****** ChFiDS_Stripe::SetOrientation ******/
		/****** md5 signature: ae28934bf0dabf2c291cc15de55030e3 ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
Or: TopAbs_Orientation
First: bool

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation;
		void SetOrientation(const TopAbs_Orientation Or, const Standard_Boolean First);

		/****** ChFiDS_Stripe::SetParameters ******/
		/****** md5 signature: 4db950b9a62330a8ee989fda40f71a20 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
First: bool
Pdeb: float
Pfin: float

Return
-------
None

Description
-----------
No available documentation.
") SetParameters;
		void SetParameters(const Standard_Boolean First, const Standard_Real Pdeb, const Standard_Real Pfin);

		/****** ChFiDS_Stripe::SetSolidIndex ******/
		/****** md5 signature: 8eadbe97c4c76389094efc550670c7a2 ******/
		%feature("compactdefaultargs") SetSolidIndex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") SetSolidIndex;
		void SetSolidIndex(const Standard_Integer Index);

		/****** ChFiDS_Stripe::SolidIndex ******/
		/****** md5 signature: a8fd277f867e1d86dd72f41ff6395800 ******/
		%feature("compactdefaultargs") SolidIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") SolidIndex;
		Standard_Integer SolidIndex();

		/****** ChFiDS_Stripe::Spine ******/
		/****** md5 signature: 131048b17dbd5a413d557d000aa4f6ee ******/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "Return
-------
opencascade::handle<ChFiDS_Spine>

Description
-----------
No available documentation.
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
		/****** ChFiDS_StripeMap::ChFiDS_StripeMap ******/
		/****** md5 signature: f2096cdef1c87c863c6adeff2eb996a6 ******/
		%feature("compactdefaultargs") ChFiDS_StripeMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_StripeMap;
		 ChFiDS_StripeMap();

		/****** ChFiDS_StripeMap::Add ******/
		/****** md5 signature: 92a3a1f4eea65565b67b2c2cb1beb02b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
F: ChFiDS_Stripe

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopoDS_Vertex & V, const opencascade::handle<ChFiDS_Stripe> & F);

		/****** ChFiDS_StripeMap::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** ChFiDS_StripeMap::Extent ******/
		/****** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		Standard_Integer Extent();

		/****** ChFiDS_StripeMap::FindFromIndex ******/
		/****** md5 signature: a4cb4e0913cfb62cd51ca90fc6e045c2 ******/
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
ChFiDS_ListOfStripe

Description
-----------
No available documentation.
") FindFromIndex;
		const ChFiDS_ListOfStripe & FindFromIndex(const Standard_Integer I);

		/****** ChFiDS_StripeMap::FindFromKey ******/
		/****** md5 signature: 3e35c916c2d4713eae2d9d28b14b97f0 ******/
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
ChFiDS_ListOfStripe

Description
-----------
No available documentation.
") FindFromKey;
		const ChFiDS_ListOfStripe & FindFromKey(const TopoDS_Vertex & V);

		/****** ChFiDS_StripeMap::FindKey ******/
		/****** md5 signature: 8178cd24d0bbc4f0a4efae070c360666 ******/
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
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
		/****** ChFiDS_SurfData::ChFiDS_SurfData ******/
		/****** md5 signature: d342b06a90e71e18178dddceee0ad15b ******/
		%feature("compactdefaultargs") ChFiDS_SurfData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_SurfData;
		 ChFiDS_SurfData();

		/****** ChFiDS_SurfData::ChangeIndexOfS1 ******/
		/****** md5 signature: 464a81c4ded1d461524d80d6a6781808 ******/
		%feature("compactdefaultargs") ChangeIndexOfS1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeIndexOfS1;
		void ChangeIndexOfS1(const Standard_Integer Index);

		/****** ChFiDS_SurfData::ChangeIndexOfS2 ******/
		/****** md5 signature: 836ea02facf61fa10ec5efea297795bf ******/
		%feature("compactdefaultargs") ChangeIndexOfS2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeIndexOfS2;
		void ChangeIndexOfS2(const Standard_Integer Index);

		/****** ChFiDS_SurfData::ChangeInterference ******/
		/****** md5 signature: 765d18b794185e8b4adc52e73713512a ******/
		%feature("compactdefaultargs") ChangeInterference;
		%feature("autodoc", "
Parameters
----------
OnS: int

Return
-------
ChFiDS_FaceInterference

Description
-----------
No available documentation.
") ChangeInterference;
		ChFiDS_FaceInterference & ChangeInterference(const Standard_Integer OnS);

		/****** ChFiDS_SurfData::ChangeInterferenceOnS1 ******/
		/****** md5 signature: f0413a5ac7c0de69a5d4a3d529a10583 ******/
		%feature("compactdefaultargs") ChangeInterferenceOnS1;
		%feature("autodoc", "Return
-------
ChFiDS_FaceInterference

Description
-----------
No available documentation.
") ChangeInterferenceOnS1;
		ChFiDS_FaceInterference & ChangeInterferenceOnS1();

		/****** ChFiDS_SurfData::ChangeInterferenceOnS2 ******/
		/****** md5 signature: 81ec062a7aad7e9b8aa3621e75ff7ee2 ******/
		%feature("compactdefaultargs") ChangeInterferenceOnS2;
		%feature("autodoc", "Return
-------
ChFiDS_FaceInterference

Description
-----------
No available documentation.
") ChangeInterferenceOnS2;
		ChFiDS_FaceInterference & ChangeInterferenceOnS2();

		/****** ChFiDS_SurfData::ChangeOrientation ******/
		/****** md5 signature: 7d02e9bc719430918056169f5b73af48 ******/
		%feature("compactdefaultargs") ChangeOrientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") ChangeOrientation;
		TopAbs_Orientation  ChangeOrientation();

		/****** ChFiDS_SurfData::ChangeSurf ******/
		/****** md5 signature: 04810584e755bde58033397adab639cd ******/
		%feature("compactdefaultargs") ChangeSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeSurf;
		void ChangeSurf(const Standard_Integer Index);

		/****** ChFiDS_SurfData::ChangeVertex ******/
		/****** md5 signature: a8ddf20f93239324ee9ea0b0bd371c2a ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "
Parameters
----------
First: bool
OnS: int

Return
-------
ChFiDS_CommonPoint

Description
-----------
returns one of the four vertices whether First is true or wrong and OnS equals 1 or 2.
") ChangeVertex;
		ChFiDS_CommonPoint & ChangeVertex(const Standard_Boolean First, const Standard_Integer OnS);

		/****** ChFiDS_SurfData::ChangeVertexFirstOnS1 ******/
		/****** md5 signature: 3108659a3a5bf4019308c76481ef6d62 ******/
		%feature("compactdefaultargs") ChangeVertexFirstOnS1;
		%feature("autodoc", "Return
-------
ChFiDS_CommonPoint

Description
-----------
No available documentation.
") ChangeVertexFirstOnS1;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS1();

		/****** ChFiDS_SurfData::ChangeVertexFirstOnS2 ******/
		/****** md5 signature: 06d669b9caf772c897d0582d11b7c013 ******/
		%feature("compactdefaultargs") ChangeVertexFirstOnS2;
		%feature("autodoc", "Return
-------
ChFiDS_CommonPoint

Description
-----------
No available documentation.
") ChangeVertexFirstOnS2;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS2();

		/****** ChFiDS_SurfData::ChangeVertexLastOnS1 ******/
		/****** md5 signature: eeeb7d2961ba36134fb72bc84375907f ******/
		%feature("compactdefaultargs") ChangeVertexLastOnS1;
		%feature("autodoc", "Return
-------
ChFiDS_CommonPoint

Description
-----------
No available documentation.
") ChangeVertexLastOnS1;
		ChFiDS_CommonPoint & ChangeVertexLastOnS1();

		/****** ChFiDS_SurfData::ChangeVertexLastOnS2 ******/
		/****** md5 signature: c449ad55b0517485ef3ee2434c55704f ******/
		%feature("compactdefaultargs") ChangeVertexLastOnS2;
		%feature("autodoc", "Return
-------
ChFiDS_CommonPoint

Description
-----------
No available documentation.
") ChangeVertexLastOnS2;
		ChFiDS_CommonPoint & ChangeVertexLastOnS2();

		/****** ChFiDS_SurfData::Copy ******/
		/****** md5 signature: ac62b6fd0b6f486fcd7879ad104ed8ee ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
Other: ChFiDS_SurfData

Return
-------
None

Description
-----------
No available documentation.
") Copy;
		void Copy(const opencascade::handle<ChFiDS_SurfData> & Other);

		/****** ChFiDS_SurfData::FirstExtensionValue ******/
		/****** md5 signature: 5762a3564e85ee2c2d5a982d2d5be2b6 ******/
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstExtensionValue;
		Standard_Real FirstExtensionValue();

		/****** ChFiDS_SurfData::FirstExtensionValue ******/
		/****** md5 signature: dffd070f2463c275043731ce8aaa835a ******/
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", "
Parameters
----------
Extend: float

Return
-------
None

Description
-----------
No available documentation.
") FirstExtensionValue;
		void FirstExtensionValue(const Standard_Real Extend);

		/****** ChFiDS_SurfData::FirstSpineParam ******/
		/****** md5 signature: 85cb7fa56a31345ca448ea81a805d5a6 ******/
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstSpineParam;
		Standard_Real FirstSpineParam();

		/****** ChFiDS_SurfData::FirstSpineParam ******/
		/****** md5 signature: a9bff714e1565d13d5330c6d7db44b07 ******/
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", "
Parameters
----------
Par: float

Return
-------
None

Description
-----------
No available documentation.
") FirstSpineParam;
		void FirstSpineParam(const Standard_Real Par);

		/****** ChFiDS_SurfData::Get2dPoints ******/
		/****** md5 signature: c0b76123de363b14c9d65851a4731623 ******/
		%feature("compactdefaultargs") Get2dPoints;
		%feature("autodoc", "
Parameters
----------
First: bool
OnS: int

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Get2dPoints;
		gp_Pnt2d Get2dPoints(const Standard_Boolean First, const Standard_Integer OnS);

		/****** ChFiDS_SurfData::Get2dPoints ******/
		/****** md5 signature: 532fbd8ec9795a1c784ff3fd2dfa42ce ******/
		%feature("compactdefaultargs") Get2dPoints;
		%feature("autodoc", "
Parameters
----------
P2df1: gp_Pnt2d
P2dl1: gp_Pnt2d
P2df2: gp_Pnt2d
P2dl2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Get2dPoints;
		void Get2dPoints(gp_Pnt2d & P2df1, gp_Pnt2d & P2dl1, gp_Pnt2d & P2df2, gp_Pnt2d & P2dl2);

		/****** ChFiDS_SurfData::Index ******/
		/****** md5 signature: aa936d15dc38493d194d98f4e3620447 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
OfS: int

Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index(const Standard_Integer OfS);

		/****** ChFiDS_SurfData::IndexOfC ******/
		/****** md5 signature: 79cb134274da4314c248ce29add33a2d ******/
		%feature("compactdefaultargs") IndexOfC;
		%feature("autodoc", "
Parameters
----------
OnS: int

Return
-------
int

Description
-----------
No available documentation.
") IndexOfC;
		Standard_Integer IndexOfC(const Standard_Integer OnS);

		/****** ChFiDS_SurfData::IndexOfC1 ******/
		/****** md5 signature: 7b68134b11c71080846dd64a481e6cf3 ******/
		%feature("compactdefaultargs") IndexOfC1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexOfC1;
		Standard_Integer IndexOfC1();

		/****** ChFiDS_SurfData::IndexOfC2 ******/
		/****** md5 signature: e15a0488edee7b0d89e07059e021e999 ******/
		%feature("compactdefaultargs") IndexOfC2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexOfC2;
		Standard_Integer IndexOfC2();

		/****** ChFiDS_SurfData::IndexOfS1 ******/
		/****** md5 signature: cae260f6fc1b135c75d40e23b72662b6 ******/
		%feature("compactdefaultargs") IndexOfS1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexOfS1;
		Standard_Integer IndexOfS1();

		/****** ChFiDS_SurfData::IndexOfS2 ******/
		/****** md5 signature: 65bb5d204d53ff0a6f2b801ef29c59c2 ******/
		%feature("compactdefaultargs") IndexOfS2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexOfS2;
		Standard_Integer IndexOfS2();

		/****** ChFiDS_SurfData::Interference ******/
		/****** md5 signature: 721126f8fff1ec76678eac4e5dabfaa8 ******/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "
Parameters
----------
OnS: int

Return
-------
ChFiDS_FaceInterference

Description
-----------
No available documentation.
") Interference;
		const ChFiDS_FaceInterference & Interference(const Standard_Integer OnS);

		/****** ChFiDS_SurfData::InterferenceOnS1 ******/
		/****** md5 signature: 84de26124a5e0740b80f38705ca471b3 ******/
		%feature("compactdefaultargs") InterferenceOnS1;
		%feature("autodoc", "Return
-------
ChFiDS_FaceInterference

Description
-----------
No available documentation.
") InterferenceOnS1;
		const ChFiDS_FaceInterference & InterferenceOnS1();

		/****** ChFiDS_SurfData::InterferenceOnS2 ******/
		/****** md5 signature: f749302ca0babe17f787eff908650488 ******/
		%feature("compactdefaultargs") InterferenceOnS2;
		%feature("autodoc", "Return
-------
ChFiDS_FaceInterference

Description
-----------
No available documentation.
") InterferenceOnS2;
		const ChFiDS_FaceInterference & InterferenceOnS2();

		/****** ChFiDS_SurfData::IsOnCurve ******/
		/****** md5 signature: c7ef125fb459f6494dcf4ad0b12f2685 ******/
		%feature("compactdefaultargs") IsOnCurve;
		%feature("autodoc", "
Parameters
----------
OnS: int

Return
-------
bool

Description
-----------
No available documentation.
") IsOnCurve;
		Standard_Boolean IsOnCurve(const Standard_Integer OnS);

		/****** ChFiDS_SurfData::IsOnCurve1 ******/
		/****** md5 signature: af913d0df1bfdaa10c15b69b831a5528 ******/
		%feature("compactdefaultargs") IsOnCurve1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOnCurve1;
		Standard_Boolean IsOnCurve1();

		/****** ChFiDS_SurfData::IsOnCurve2 ******/
		/****** md5 signature: 461844d6cb2ec1f6b2f31eed5d129109 ******/
		%feature("compactdefaultargs") IsOnCurve2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOnCurve2;
		Standard_Boolean IsOnCurve2();

		/****** ChFiDS_SurfData::LastExtensionValue ******/
		/****** md5 signature: 23c75e037feda815b5430178c48b5b00 ******/
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastExtensionValue;
		Standard_Real LastExtensionValue();

		/****** ChFiDS_SurfData::LastExtensionValue ******/
		/****** md5 signature: b91d11693c0b645a15a8f54908977d42 ******/
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", "
Parameters
----------
Extend: float

Return
-------
None

Description
-----------
No available documentation.
") LastExtensionValue;
		void LastExtensionValue(const Standard_Real Extend);

		/****** ChFiDS_SurfData::LastSpineParam ******/
		/****** md5 signature: e486c269dbc2903bdab7750b7673bcd2 ******/
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastSpineParam;
		Standard_Real LastSpineParam();

		/****** ChFiDS_SurfData::LastSpineParam ******/
		/****** md5 signature: cbf1f2f51110a7d4048655e2098604ac ******/
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", "
Parameters
----------
Par: float

Return
-------
None

Description
-----------
No available documentation.
") LastSpineParam;
		void LastSpineParam(const Standard_Real Par);

		/****** ChFiDS_SurfData::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** ChFiDS_SurfData::ResetSimul ******/
		/****** md5 signature: ef9a205f289935b753cf7e7b693562a5 ******/
		%feature("compactdefaultargs") ResetSimul;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetSimul;
		void ResetSimul();

		/****** ChFiDS_SurfData::Set2dPoints ******/
		/****** md5 signature: c164003b5eb904f6a11f248c01e5e125 ******/
		%feature("compactdefaultargs") Set2dPoints;
		%feature("autodoc", "
Parameters
----------
P2df1: gp_Pnt2d
P2dl1: gp_Pnt2d
P2df2: gp_Pnt2d
P2dl2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Set2dPoints;
		void Set2dPoints(const gp_Pnt2d & P2df1, const gp_Pnt2d & P2dl1, const gp_Pnt2d & P2df2, const gp_Pnt2d & P2dl2);

		/****** ChFiDS_SurfData::SetIndexOfC1 ******/
		/****** md5 signature: e9e20dfa0037167b3db1039fdf9ddbd4 ******/
		%feature("compactdefaultargs") SetIndexOfC1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") SetIndexOfC1;
		void SetIndexOfC1(const Standard_Integer Index);

		/****** ChFiDS_SurfData::SetIndexOfC2 ******/
		/****** md5 signature: 699facddccc422aedc676f7ce2d4ae70 ******/
		%feature("compactdefaultargs") SetIndexOfC2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
No available documentation.
") SetIndexOfC2;
		void SetIndexOfC2(const Standard_Integer Index);

		/****** ChFiDS_SurfData::SetSimul ******/
		/****** md5 signature: 0b9016e6717c670bf80fee8060fff7f8 ******/
		%feature("compactdefaultargs") SetSimul;
		%feature("autodoc", "
Parameters
----------
S: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") SetSimul;
		void SetSimul(const opencascade::handle<Standard_Transient> & S);

		/****** ChFiDS_SurfData::Simul ******/
		/****** md5 signature: 5a64a66fd42dcaca497381aacb1dc73d ******/
		%feature("compactdefaultargs") Simul;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") Simul;
		opencascade::handle<Standard_Transient> Simul();

		/****** ChFiDS_SurfData::Surf ******/
		/****** md5 signature: 1098b0d819c18c444ca2aaecf83fe6fe ******/
		%feature("compactdefaultargs") Surf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Surf;
		Standard_Integer Surf();

		/****** ChFiDS_SurfData::TwistOnS1 ******/
		/****** md5 signature: 9e7cba134041c48814f8e911bc7ceb7d ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		Standard_Boolean TwistOnS1();

		/****** ChFiDS_SurfData::TwistOnS1 ******/
		/****** md5 signature: 0acb5632246f7d8546f899592bf293f6 ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "
Parameters
----------
T: bool

Return
-------
None

Description
-----------
No available documentation.
") TwistOnS1;
		void TwistOnS1(const Standard_Boolean T);

		/****** ChFiDS_SurfData::TwistOnS2 ******/
		/****** md5 signature: d09d14bd26a5c6922f795ecb44cf2f66 ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		Standard_Boolean TwistOnS2();

		/****** ChFiDS_SurfData::TwistOnS2 ******/
		/****** md5 signature: 86b835475f2f1a22123081c9ad1406c3 ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "
Parameters
----------
T: bool

Return
-------
None

Description
-----------
No available documentation.
") TwistOnS2;
		void TwistOnS2(const Standard_Boolean T);

		/****** ChFiDS_SurfData::Vertex ******/
		/****** md5 signature: 18d5b7a519c656abcce6733eb3f805bc ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
First: bool
OnS: int

Return
-------
ChFiDS_CommonPoint

Description
-----------
returns one of the four vertices whether First is true or wrong and OnS equals 1 or 2.
") Vertex;
		const ChFiDS_CommonPoint & Vertex(const Standard_Boolean First, const Standard_Integer OnS);

		/****** ChFiDS_SurfData::VertexFirstOnS1 ******/
		/****** md5 signature: fbdcb24d9af55411ab7405474d1a35b9 ******/
		%feature("compactdefaultargs") VertexFirstOnS1;
		%feature("autodoc", "Return
-------
ChFiDS_CommonPoint

Description
-----------
No available documentation.
") VertexFirstOnS1;
		const ChFiDS_CommonPoint & VertexFirstOnS1();

		/****** ChFiDS_SurfData::VertexFirstOnS2 ******/
		/****** md5 signature: 7c85c07345dd8348e664b3ab7bf9f189 ******/
		%feature("compactdefaultargs") VertexFirstOnS2;
		%feature("autodoc", "Return
-------
ChFiDS_CommonPoint

Description
-----------
No available documentation.
") VertexFirstOnS2;
		const ChFiDS_CommonPoint & VertexFirstOnS2();

		/****** ChFiDS_SurfData::VertexLastOnS1 ******/
		/****** md5 signature: 6427caa61f0bf9234fd05e296984ac27 ******/
		%feature("compactdefaultargs") VertexLastOnS1;
		%feature("autodoc", "Return
-------
ChFiDS_CommonPoint

Description
-----------
No available documentation.
") VertexLastOnS1;
		const ChFiDS_CommonPoint & VertexLastOnS1();

		/****** ChFiDS_SurfData::VertexLastOnS2 ******/
		/****** md5 signature: c890925b005a346f489bb09d9ca4839f ******/
		%feature("compactdefaultargs") VertexLastOnS2;
		%feature("autodoc", "Return
-------
ChFiDS_CommonPoint

Description
-----------
No available documentation.
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
		/****** ChFiDS_ChamfSpine::ChFiDS_ChamfSpine ******/
		/****** md5 signature: 41553b44dd772e00fe86fab46e7d904c ******/
		%feature("compactdefaultargs") ChFiDS_ChamfSpine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine();

		/****** ChFiDS_ChamfSpine::ChFiDS_ChamfSpine ******/
		/****** md5 signature: 33f39a16a9e9fd99378615ca285c48a9 ******/
		%feature("compactdefaultargs") ChFiDS_ChamfSpine;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine(const Standard_Real Tol);

		/****** ChFiDS_ChamfSpine::Dists ******/
		/****** md5 signature: 2e7b681679b701fdc1f1a885c6746b43 ******/
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "
Parameters
----------

Return
-------
Dis1: float
Dis2: float

Description
-----------
No available documentation.
") Dists;
		void Dists(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_ChamfSpine::GetDist ******/
		/****** md5 signature: 6f22d39c9d38288e6a9d1e40741e84b4 ******/
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", "
Parameters
----------

Return
-------
Dis: float

Description
-----------
No available documentation.
") GetDist;
		void GetDist(Standard_Real &OutValue);

		/****** ChFiDS_ChamfSpine::GetDistAngle ******/
		/****** md5 signature: b7e8c4f4dca6f7925ece8caaf424f067 ******/
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "
Parameters
----------

Return
-------
Dis: float
Angle: float

Description
-----------
No available documentation.
") GetDistAngle;
		void GetDistAngle(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_ChamfSpine::IsChamfer ******/
		/****** md5 signature: d658319093da8e4029525963f6dcf77f ******/
		%feature("compactdefaultargs") IsChamfer;
		%feature("autodoc", "Return
-------
ChFiDS_ChamfMethod

Description
-----------
Return the method of chamfers used.
") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer();

		/****** ChFiDS_ChamfSpine::SetDist ******/
		/****** md5 signature: 3234cee1a1528df7657370712255a4e9 ******/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "
Parameters
----------
Dis: float

Return
-------
None

Description
-----------
No available documentation.
") SetDist;
		void SetDist(const Standard_Real Dis);

		/****** ChFiDS_ChamfSpine::SetDistAngle ******/
		/****** md5 signature: dc437b103bb0ff46b0c641a081c767b1 ******/
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "
Parameters
----------
Dis: float
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") SetDistAngle;
		void SetDistAngle(const Standard_Real Dis, const Standard_Real Angle);

		/****** ChFiDS_ChamfSpine::SetDists ******/
		/****** md5 signature: e2a0b86c65b45aa81960cb17a64c4df1 ******/
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "
Parameters
----------
Dis1: float
Dis2: float

Return
-------
None

Description
-----------
No available documentation.
") SetDists;
		void SetDists(const Standard_Real Dis1, const Standard_Real Dis2);

		/****** ChFiDS_ChamfSpine::SetMode ******/
		/****** md5 signature: 85103d8a8712f2721bdad80918d54319 ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
theMode: ChFiDS_ChamfMode

Return
-------
None

Description
-----------
No available documentation.
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
		/****** ChFiDS_FilSpine::ChFiDS_FilSpine ******/
		/****** md5 signature: cba6306b427db3f36fc8b4403f44bd5b ******/
		%feature("compactdefaultargs") ChFiDS_FilSpine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_FilSpine;
		 ChFiDS_FilSpine();

		/****** ChFiDS_FilSpine::ChFiDS_FilSpine ******/
		/****** md5 signature: 62b18d0760aa4d6ecc105f7fa320840e ******/
		%feature("compactdefaultargs") ChFiDS_FilSpine;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_FilSpine;
		 ChFiDS_FilSpine(const Standard_Real Tol);

		/****** ChFiDS_FilSpine::AppendElSpine ******/
		/****** md5 signature: 372916a9ea66113bdf5cde8ef4cde52f ******/
		%feature("compactdefaultargs") AppendElSpine;
		%feature("autodoc", "
Parameters
----------
Els: ChFiDS_ElSpine

Return
-------
None

Description
-----------
No available documentation.
") AppendElSpine;
		virtual void AppendElSpine(const opencascade::handle<ChFiDS_ElSpine> & Els);

		/****** ChFiDS_FilSpine::ChangeLaw ******/
		/****** md5 signature: 8ae71aa7535429ad90f7a710389558b8 ******/
		%feature("compactdefaultargs") ChangeLaw;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
opencascade::handle<Law_Function>

Description
-----------
returns the elementary law.
") ChangeLaw;
		opencascade::handle<Law_Function> & ChangeLaw(const TopoDS_Edge & E);

		/****** ChFiDS_FilSpine::IsConstant ******/
		/****** md5 signature: d04428c0cc470abb832fd48242d18c6c ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the radius is constant all along the spine.
") IsConstant;
		Standard_Boolean IsConstant();

		/****** ChFiDS_FilSpine::IsConstant ******/
		/****** md5 signature: bc11f93510cfff4e44a25f3e84ce1ada ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------
IE: int

Return
-------
bool

Description
-----------
returns true if the radius is constant all along the edge E.
") IsConstant;
		Standard_Boolean IsConstant(const Standard_Integer IE);

		/****** ChFiDS_FilSpine::Law ******/
		/****** md5 signature: 7cf16ab410922973e30dbb370c179506 ******/
		%feature("compactdefaultargs") Law;
		%feature("autodoc", "
Parameters
----------
Els: ChFiDS_ElSpine

Return
-------
opencascade::handle<Law_Composite>

Description
-----------
No available documentation.
") Law;
		opencascade::handle<Law_Composite> Law(const opencascade::handle<ChFiDS_ElSpine> & Els);

		/****** ChFiDS_FilSpine::MaxRadFromSeqAndLaws ******/
		/****** md5 signature: 5d0ba972a5439e16c0aae93c053bd63b ******/
		%feature("compactdefaultargs") MaxRadFromSeqAndLaws;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum radius if the fillet is non-constant.
") MaxRadFromSeqAndLaws;
		Standard_Real MaxRadFromSeqAndLaws();

		/****** ChFiDS_FilSpine::Radius ******/
		/****** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the radius if the fillet is constant all along the spine.
") Radius;
		Standard_Real Radius();

		/****** ChFiDS_FilSpine::Radius ******/
		/****** md5 signature: 75a8a890fcaa49d59f2a13a8dfdd6194 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "
Parameters
----------
IE: int

Return
-------
float

Description
-----------
returns the radius if the fillet is constant all along the edge E.
") Radius;
		Standard_Real Radius(const Standard_Integer IE);

		/****** ChFiDS_FilSpine::Radius ******/
		/****** md5 signature: a7dbde136b0aff6df13e784d945befee ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
float

Description
-----------
returns the radius if the fillet is constant all along the edge E.
") Radius;
		Standard_Real Radius(const TopoDS_Edge & E);

		/****** ChFiDS_FilSpine::Reset ******/
		/****** md5 signature: e8db21712db75c0ab3a6d44938480832 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
AllData: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Reset;
		virtual void Reset(const Standard_Boolean AllData = Standard_False);

		/****** ChFiDS_FilSpine::SetRadius ******/
		/****** md5 signature: 91641ed1cc49aed497341c2960fe1ef2 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: float
E: TopoDS_Edge

Return
-------
None

Description
-----------
initializes the constant vector on edge E.
") SetRadius;
		void SetRadius(const Standard_Real Radius, const TopoDS_Edge & E);

		/****** ChFiDS_FilSpine::SetRadius ******/
		/****** md5 signature: 0b731947b724fee5a279be1cdface2f5 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: float
V: TopoDS_Vertex

Return
-------
None

Description
-----------
initializes the vector on Vertex V.
") SetRadius;
		void SetRadius(const Standard_Real Radius, const TopoDS_Vertex & V);

		/****** ChFiDS_FilSpine::SetRadius ******/
		/****** md5 signature: c46a36f7aea3dca4657dbb13bc50b145 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
UandR: gp_XY
IinC: int

Return
-------
None

Description
-----------
initializes the vector on the point of parameter W.
") SetRadius;
		void SetRadius(const gp_XY & UandR, const Standard_Integer IinC);

		/****** ChFiDS_FilSpine::SetRadius ******/
		/****** md5 signature: 021f3150e83db7a660562352251b37b0 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: float

Return
-------
None

Description
-----------
initializes the constant vector on all spine.
") SetRadius;
		void SetRadius(const Standard_Real Radius);

		/****** ChFiDS_FilSpine::SetRadius ******/
		/****** md5 signature: 99c895e6b68282335620180e915bf49e ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
C: Law_Function
IinC: int

Return
-------
None

Description
-----------
initializes the rule of evolution on all spine.
") SetRadius;
		void SetRadius(const opencascade::handle<Law_Function> & C, const Standard_Integer IinC);

		/****** ChFiDS_FilSpine::UnSetRadius ******/
		/****** md5 signature: 5be1b8d2f909f7cad1be8a39d04d1ce1 ******/
		%feature("compactdefaultargs") UnSetRadius;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
resets the constant vector on edge E.
") UnSetRadius;
		void UnSetRadius(const TopoDS_Edge & E);

		/****** ChFiDS_FilSpine::UnSetRadius ******/
		/****** md5 signature: 5d2002bb5639afbef66d96320c17409b ******/
		%feature("compactdefaultargs") UnSetRadius;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
None

Description
-----------
resets the vector on Vertex V.
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


/* class aliases */
%pythoncode {
}
