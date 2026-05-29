/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_chfids.html"
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
/* end handles declaration */

/* templates */
%ignore NCollection_IndexedDataMap<TopoDS_Vertex,ChFiDS_ListOfStripe,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Vertex,ChFiDS_ListOfStripe,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Vertex,ChFiDS_ListOfStripe,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Vertex,ChFiDS_ListOfStripe,TopTools_ShapeMapHasher>::Contained;
%template(ChFiDS_IndexedDataMapOfVertexListOfStripe) NCollection_IndexedDataMap<TopoDS_Vertex,ChFiDS_ListOfStripe,TopTools_ShapeMapHasher>;
%template(ChFiDS_ListIteratorOfListOfHElSpine) NCollection_TListIterator<opencascade::handle<ChFiDS_ElSpine>>;
%template(ChFiDS_ListIteratorOfListOfStripe) NCollection_TListIterator<opencascade::handle<ChFiDS_Stripe>>;
%template(ChFiDS_ListIteratorOfRegularities) NCollection_TListIterator<ChFiDS_Regul>;
%template(ChFiDS_ListOfHElSpine) NCollection_List<opencascade::handle<ChFiDS_ElSpine>>;

%extend NCollection_List<opencascade::handle<ChFiDS_ElSpine>> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = ChFiDS_ListIteratorOfListOfHElSpine(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(ChFiDS_ListOfStripe) NCollection_List<opencascade::handle<ChFiDS_Stripe>>;

%extend NCollection_List<opencascade::handle<ChFiDS_Stripe>> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = ChFiDS_ListIteratorOfListOfStripe(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(ChFiDS_Regularities) NCollection_List<ChFiDS_Regul>;

%extend NCollection_List<ChFiDS_Regul> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = ChFiDS_Regularities(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(ChFiDS_SecArray1) NCollection_Array1<ChFiDS_CircSection>;
Array1ExtendIter(ChFiDS_CircSection)

%template(ChFiDS_SequenceOfSpine) NCollection_Sequence<opencascade::handle<ChFiDS_Spine>>;

%extend NCollection_Sequence<opencascade::handle<ChFiDS_Spine>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ChFiDS_SequenceOfSurfData) NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>>;

%extend NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ChFiDS_StripeArray1) NCollection_Array1<opencascade::handle<ChFiDS_Stripe>>;
Array1ExtendIter(opencascade::handle<ChFiDS_Stripe>)

/* end templates declaration */

/* typedefs */
typedef NCollection_HSequence<opencascade::handle<ChFiDS_SurfData>> ChFiDS_HData;
typedef NCollection_IndexedDataMap<TopoDS_Vertex, ChFiDS_ListOfStripe, TopTools_ShapeMapHasher> ChFiDS_IndexedDataMapOfVertexListOfStripe;
typedef NCollection_List<opencascade::handle<ChFiDS_ElSpine>>::Iterator ChFiDS_ListIteratorOfListOfHElSpine;
typedef NCollection_List<opencascade::handle<ChFiDS_Stripe>>::Iterator ChFiDS_ListIteratorOfListOfStripe;
typedef NCollection_List<ChFiDS_Regul>::Iterator ChFiDS_ListIteratorOfRegularities;
typedef NCollection_List<opencascade::handle<ChFiDS_ElSpine>> ChFiDS_ListOfHElSpine;
typedef NCollection_List<opencascade::handle<ChFiDS_Stripe>> ChFiDS_ListOfStripe;
typedef NCollection_List<ChFiDS_Regul> ChFiDS_Regularities;
typedef NCollection_Array1<ChFiDS_CircSection> ChFiDS_SecArray1;
typedef NCollection_HArray1<ChFiDS_CircSection> ChFiDS_SecHArray1;
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
		/****** md5 signature: 375785218b6b484a451ff981b1084ea6 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
F: double
L: double

Description
-----------
No available documentation.
") Get;
		void Get(gp_Circ & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_CircSection::Get ******/
		/****** md5 signature: a6d673d9976da9ad29aaf40350672c8b ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
F: double
L: double

Description
-----------
No available documentation.
") Get;
		void Get(gp_Lin & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_CircSection::Set ******/
		/****** md5 signature: a1e5df207a7d08b10da5372a9988ec0d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
F: double
L: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Circ & C, const double F, const double L);

		/****** ChFiDS_CircSection::Set ******/
		/****** md5 signature: 08056a36f2e35c238aebba8619331f12 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
F: double
L: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Lin & C, const double F, const double L);

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
		/****** md5 signature: c9bc907d1d8266e593a3dd743b74f2f5 ******/
		%feature("compactdefaultargs") HasVector;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the output vector is stored.
") HasVector;
		bool HasVector();

		/****** ChFiDS_CommonPoint::IsOnArc ******/
		/****** md5 signature: 63f7b12ba969383d793d907b816e8342 ******/
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a on an edge of the initial restriction facet of the surface.
") IsOnArc;
		bool IsOnArc();

		/****** ChFiDS_CommonPoint::IsVertex ******/
		/****** md5 signature: 4f009a9ae0099801e234ea40f8be9cb2 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a vertex on the initial restriction facet of the surface.
") IsVertex;
		bool IsVertex();

		/****** ChFiDS_CommonPoint::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the spine.
") Parameter;
		double Parameter();

		/****** ChFiDS_CommonPoint::ParameterOnArc ******/
		/****** md5 signature: 325a1d6a3796b5402c690f182eda9fae ******/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the point on the arc returned by the method Arc().
") ParameterOnArc;
		double ParameterOnArc();

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
		/****** md5 signature: 0196d1361ff948eed8a471e64a65361e ******/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "
Parameters
----------
Tol: double
A: TopoDS_Edge
Param: double
TArc: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the values of a point which is on the arc A, at parameter Param.
") SetArc;
		void SetArc(const double Tol, const TopoDS_Edge & A, const double Param, const TopAbs_Orientation TArc);

		/****** ChFiDS_CommonPoint::SetParameter ******/
		/****** md5 signature: 0f95a348489d7d61925025ebfc2018ad ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
Sets the value of the parameter on the spine.
") SetParameter;
		void SetParameter(const double Param);

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
		/****** md5 signature: a15d19c9a732229b4d3bda7594347be6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
This method set the fuzziness on the point.
") SetTolerance;
		void SetTolerance(const double Tol);

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
		/****** md5 signature: 0f371f25723fe3719d8c637d644b341d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
This method returns the fuzziness on the point.
") Tolerance;
		double Tolerance();

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
		/****** md5 signature: 7bed4aa4788773a8c748371dea2999b6 ******/
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
		/****** md5 signature: 18c746ed347d210e28744f5b1c7eb527 ******/
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
		/****** md5 signature: 7475f3d2915ecc09ceb3114f02b43080 ******/
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
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** ChFiDS_ElSpine::Ellipse ******/
		/****** md5 signature: b7cf7020e3992d6d2378fd2118e8d198 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** ChFiDS_ElSpine::EvalD0 ******/
		/****** md5 signature: fc8320117964af4b9e741cd6724988a1 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theAbsC: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter theAbsC on the curve.
") EvalD0;
		gp_Pnt EvalD0(const double theAbsC);

		/****** ChFiDS_ElSpine::EvalD1 ******/
		/****** md5 signature: 370bbc0ca07eb145a16b6eabdfc24efc ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theAbsC: double

Return
-------
Geom_Curve::ResD1

Description
-----------
Computes the point and first derivative at parameter theAbsC.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double theAbsC);

		/****** ChFiDS_ElSpine::EvalD2 ******/
		/****** md5 signature: e1b8fb04b6b3a628144e8596e3e43020 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theAbsC: double

Return
-------
Geom_Curve::ResD2

Description
-----------
Computes the point and first two derivatives at parameter theAbsC.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double theAbsC);

		/****** ChFiDS_ElSpine::EvalD3 ******/
		/****** md5 signature: 8f2233ab525d22b30b45c7ccb686c6c7 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theAbsC: double

Return
-------
Geom_Curve::ResD3

Description
-----------
Computes the point and first three derivatives at parameter theAbsC.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double theAbsC);

		/****** ChFiDS_ElSpine::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** ChFiDS_ElSpine::FirstParameter ******/
		/****** md5 signature: 07bc10e080cd242ff5ccc59e74bed29c ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
No available documentation.
") FirstParameter;
		void FirstParameter(const double P);

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
		/****** md5 signature: 0ac1c896a0affe364049abd440b09cda ******/
		%feature("compactdefaultargs") GetSavedFirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") GetSavedFirstParameter;
		double GetSavedFirstParameter();

		/****** ChFiDS_ElSpine::GetSavedLastParameter ******/
		/****** md5 signature: d4a0ba21ee102b9391a2bd2c317e0429 ******/
		%feature("compactdefaultargs") GetSavedLastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") GetSavedLastParameter;
		double GetSavedLastParameter();

		/****** ChFiDS_ElSpine::GetType ******/
		/****** md5 signature: 5a645f79981f2ae05742e39e35676600 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		GeomAbs_CurveType GetType();

		/****** ChFiDS_ElSpine::Hyperbola ******/
		/****** md5 signature: 308d3b34f3aaba706261ba7e6cb1678e ******/
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
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** ChFiDS_ElSpine::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** ChFiDS_ElSpine::LastParameter ******/
		/****** md5 signature: 5002e4e2350408e3a97fc87e1cc2e926 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
No available documentation.
") LastParameter;
		void LastParameter(const double P);

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
		/****** md5 signature: acdc8f5fc99e967530fe196307d05538 ******/
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
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** ChFiDS_ElSpine::NbVertices ******/
		/****** md5 signature: 859a4b3acdcc81718e66502bc37368ea ******/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertices;
		int NbVertices();

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
		/****** md5 signature: de70ebd3fa2d227512b9d0058ee94ca5 ******/
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
		/****** md5 signature: 1f089b3595450d6c97092473e379f329 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		double Period();

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
		/****** md5 signature: 7cb383c1a004c01dc3f51b7088c4d899 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
No available documentation.
") Resolution;
		double Resolution(const double R3d);

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
		/****** md5 signature: 5f0a660a8ca489213219850a7ac41c60 ******/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "
Parameters
----------
O: double

Return
-------
None

Description
-----------
No available documentation.
") SetOrigin;
		void SetOrigin(const double O);

		/****** ChFiDS_ElSpine::SetPeriodic ******/
		/****** md5 signature: e36775b4742c5c2f7a7ee6d7be464681 ******/
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
		void SetPeriodic(const bool I);

		/****** ChFiDS_ElSpine::ShallowCopy ******/
		/****** md5 signature: 20e70b6ba2d95db55811b68454eb9003 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Curve> ShallowCopy();

		/****** ChFiDS_ElSpine::Trim ******/
		/****** md5 signature: 91538b497dfbccd564dbd54083e8e395 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const double First, const double Last, const double Tol);

		/****** ChFiDS_ElSpine::VertexWithTangent ******/
		/****** md5 signature: 30c55ce34f31dd6e8c0ecc5cb25e7c5f ******/
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
		const gp_Ax1 VertexWithTangent(const int Index);

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
		/****** md5 signature: 663a02fdcfecea2f8437f306e48dfc6b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** ChFiDS_FaceInterference::LastParameter ******/
		/****** md5 signature: fca5164159fd9f44a10664b338b6e402 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** ChFiDS_FaceInterference::LineIndex ******/
		/****** md5 signature: 32f076db83081d15923726f955bd63d3 ******/
		%feature("compactdefaultargs") LineIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") LineIndex;
		int LineIndex();

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
		/****** md5 signature: a4c9d984b0c752364fca72d1ad4ecfc7 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
IsFirst: bool

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter(const bool IsFirst);

		/****** ChFiDS_FaceInterference::SetFirstParameter ******/
		/****** md5 signature: 0a2ff6d29731f00fc2527ff1d1d19560 ******/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "
Parameters
----------
U1: double

Return
-------
None

Description
-----------
No available documentation.
") SetFirstParameter;
		void SetFirstParameter(const double U1);

		/****** ChFiDS_FaceInterference::SetInterference ******/
		/****** md5 signature: 0d2ac6de03efddc2be31d376740b0088 ******/
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
		void SetInterference(const int LineIndex, const TopAbs_Orientation Trans, const opencascade::handle<Geom2d_Curve> & PCurv1, const opencascade::handle<Geom2d_Curve> & PCurv2);

		/****** ChFiDS_FaceInterference::SetLastParameter ******/
		/****** md5 signature: 3879b26a3f6e52f8a5fdf8edebb5c6c7 ******/
		%feature("compactdefaultargs") SetLastParameter;
		%feature("autodoc", "
Parameters
----------
U1: double

Return
-------
None

Description
-----------
No available documentation.
") SetLastParameter;
		void SetLastParameter(const double U1);

		/****** ChFiDS_FaceInterference::SetLineIndex ******/
		/****** md5 signature: f05e46de57820b665c6268ef02283bd4 ******/
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
		void SetLineIndex(const int I);

		/****** ChFiDS_FaceInterference::SetParameter ******/
		/****** md5 signature: 374c2b862907526bf8718303752c4275 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
U1: double
IsFirst: bool

Return
-------
None

Description
-----------
No available documentation.
") SetParameter;
		void SetParameter(const double U1, const bool IsFirst);

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
		/****** md5 signature: 9d115853c7c7f9bc8f52911395e69be8 ******/
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
		bool Contains(const TopoDS_Shape & S);

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
		/****** md5 signature: 03f0408e7296dd7493e34944d2e1a5e5 ******/
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
		const TopTools_ListOfShape & FindFromIndex(const int I);

		/****** ChFiDS_Map::FindFromKey ******/
		/****** md5 signature: 4ed5dc4ed7b3f32ad3e73446a96f35ad ******/
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
		/****** md5 signature: e68eed5ce3ee0bd0eba65900dac7dd46 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curve;
		int Curve();

		/****** ChFiDS_Regul::IsSurface1 ******/
		/****** md5 signature: cd717a80c611f84c9ab50a27d58faa56 ******/
		%feature("compactdefaultargs") IsSurface1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSurface1;
		bool IsSurface1();

		/****** ChFiDS_Regul::IsSurface2 ******/
		/****** md5 signature: 2655c888eec4e00c9c54cd6959ff5180 ******/
		%feature("compactdefaultargs") IsSurface2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSurface2;
		bool IsSurface2();

		/****** ChFiDS_Regul::S1 ******/
		/****** md5 signature: 798bcdcfff7476e6a2edc7101e2db028 ******/
		%feature("compactdefaultargs") S1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") S1;
		int S1();

		/****** ChFiDS_Regul::S2 ******/
		/****** md5 signature: 5c4564d059f31465aeed449d621b85c5 ******/
		%feature("compactdefaultargs") S2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") S2;
		int S2();

		/****** ChFiDS_Regul::SetCurve ******/
		/****** md5 signature: 142601de41915b91b6b05688526625ab ******/
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
		void SetCurve(const int IC);

		/****** ChFiDS_Regul::SetS1 ******/
		/****** md5 signature: 10490dfb2a805f779396279e92aa3f60 ******/
		%feature("compactdefaultargs") SetS1;
		%feature("autodoc", "
Parameters
----------
IS1: int
IsFace: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") SetS1;
		void SetS1(const int IS1, const bool IsFace = true);

		/****** ChFiDS_Regul::SetS2 ******/
		/****** md5 signature: 5290c3ad5afafe079fd866a953c1e3a5 ******/
		%feature("compactdefaultargs") SetS2;
		%feature("autodoc", "
Parameters
----------
IS2: int
IsFace: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") SetS2;
		void SetS2(const int IS2, const bool IsFace = true);

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
		/****** md5 signature: ebaa28550d5dd7144b68d5d91990f411 ******/
		%feature("compactdefaultargs") ChFiDS_Spine;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_Spine;
		 ChFiDS_Spine(const double Tol);

		/****** ChFiDS_Spine::Absc ******/
		/****** md5 signature: 16e12bfc776c8fe7e1cdc8aefa58b7fd ******/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
No available documentation.
") Absc;
		double Absc(const double U);

		/****** ChFiDS_Spine::Absc ******/
		/****** md5 signature: cb27f5db99d57909d28ec0ead5b2eb8d ******/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "
Parameters
----------
U: double
I: int

Return
-------
double

Description
-----------
No available documentation.
") Absc;
		double Absc(const double U, const int I);

		/****** ChFiDS_Spine::Absc ******/
		/****** md5 signature: 98114f5b6c432cad659c614500762b3a ******/
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
double

Description
-----------
No available documentation.
") Absc;
		double Absc(const TopoDS_Vertex & V);

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
		/****** md5 signature: 0a5e0f3c49192fd0462ade762556c25e ******/
		%feature("compactdefaultargs") ChangeElSpines;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<ChFiDS_ElSpine>>

Description
-----------
No available documentation.
") ChangeElSpines;
		NCollection_List<opencascade::handle<ChFiDS_ElSpine>> & ChangeElSpines();

		/****** ChFiDS_Spine::ChangeOffsetElSpines ******/
		/****** md5 signature: 3849b96b1fb6924aea5ad26c9a2d95e4 ******/
		%feature("compactdefaultargs") ChangeOffsetElSpines;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<ChFiDS_ElSpine>>

Description
-----------
No available documentation.
") ChangeOffsetElSpines;
		NCollection_List<opencascade::handle<ChFiDS_ElSpine>> & ChangeOffsetElSpines();

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
		/****** md5 signature: 0eab64bbd28f8de6a879bdc64a22efdf ******/
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
		BRepAdaptor_Curve CurrentElementarySpine(const int Index);

		/****** ChFiDS_Spine::CurrentIndexOfElementarySpine ******/
		/****** md5 signature: e210a6f3b68801f5f6ad5bd907a2633c ******/
		%feature("compactdefaultargs") CurrentIndexOfElementarySpine;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CurrentIndexOfElementarySpine;
		int CurrentIndexOfElementarySpine();

		/****** ChFiDS_Spine::D0 ******/
		/****** md5 signature: 2a48bd1bf91762cb87ff875c59b77a12 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
AbsC: double
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const double AbsC, gp_Pnt & P);

		/****** ChFiDS_Spine::D1 ******/
		/****** md5 signature: a2e16d8e6a8c3b48bddb4d7d79301c1d ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
AbsC: double
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const double AbsC, gp_Pnt & P, gp_Vec & V1);

		/****** ChFiDS_Spine::D2 ******/
		/****** md5 signature: 0bcbc1e0667b8988fe4b58b202346479 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
AbsC: double
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
		void D2(const double AbsC, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ChFiDS_Spine::Edges ******/
		/****** md5 signature: 6cae6f6cd17af46c200bc5948283eebf ******/
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
		const TopoDS_Edge Edges(const int I);

		/****** ChFiDS_Spine::ElSpine ******/
		/****** md5 signature: 00126911aac4d8dc2cc8ced3c9264503 ******/
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
		opencascade::handle<ChFiDS_ElSpine> ElSpine(const int IE);

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
		/****** md5 signature: eff16573e470961cd6b21bdec65dae0e ******/
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", "
Parameters
----------
W: double

Return
-------
opencascade::handle<ChFiDS_ElSpine>

Description
-----------
No available documentation.
") ElSpine;
		opencascade::handle<ChFiDS_ElSpine> ElSpine(const double W);

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
		/****** md5 signature: 663a02fdcfecea2f8437f306e48dfc6b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** ChFiDS_Spine::FirstParameter ******/
		/****** md5 signature: 2f57dc035a7e8c58efa245dac9a53c23 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
IndexSpine: int

Return
-------
double

Description
-----------
gives the total length of all arcs before the number IndexSp.
") FirstParameter;
		double FirstParameter(const int IndexSpine);

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
		/****** md5 signature: 0f357cca0110e213b676b4cbb0b99078 ******/
		%feature("compactdefaultargs") GetTolesp;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return tolesp parameter.
") GetTolesp;
		double GetTolesp();

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
		/****** md5 signature: b586680dc8378ebbd804b3d50b1cc964 ******/
		%feature("compactdefaultargs") HasFirstTgt;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasFirstTgt;
		bool HasFirstTgt();

		/****** ChFiDS_Spine::HasLastTgt ******/
		/****** md5 signature: a620f9a0e4ae93c1a24bedaf1dff28e5 ******/
		%feature("compactdefaultargs") HasLastTgt;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasLastTgt;
		bool HasLastTgt();

		/****** ChFiDS_Spine::Index ******/
		/****** md5 signature: 92e3601a1710b1c683706b6bf37769a7 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
W: double
Forward: bool (optional, default to true)

Return
-------
int

Description
-----------
No available documentation.
") Index;
		int Index(const double W, const bool Forward = true);

		/****** ChFiDS_Spine::Index ******/
		/****** md5 signature: 8cd205e30fc8428a0509544a4b319bfb ******/
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
		int Index(const TopoDS_Edge & E);

		/****** ChFiDS_Spine::IsClosed ******/
		/****** md5 signature: 66fc0caa1853d24780b1d28b8296bc6c ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** ChFiDS_Spine::IsPeriodic ******/
		/****** md5 signature: d36764d6f9b1283d23b2bfdabe28da79 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** ChFiDS_Spine::IsTangencyExtremity ******/
		/****** md5 signature: 60440c1c811e1e5351273e3d3b01692f ******/
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
		bool IsTangencyExtremity(const bool IsFirst);

		/****** ChFiDS_Spine::LastParameter ******/
		/****** md5 signature: fca5164159fd9f44a10664b338b6e402 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** ChFiDS_Spine::LastParameter ******/
		/****** md5 signature: 4906ad0993820a0564231854eeba071d ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
IndexSpine: int

Return
-------
double

Description
-----------
gives the total length till the ark with number IndexSpine (inclus).
") LastParameter;
		double LastParameter(const int IndexSpine);

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
		/****** md5 signature: 248c8deff49def7fc5acf100c3446815 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
IndexSpine: int

Return
-------
double

Description
-----------
gives the length of ark with number IndexSp.
") Length;
		double Length(const int IndexSpine);

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
		/****** md5 signature: f741965989565caaff095f09d2955db8 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEdges;
		int NbEdges();

		/****** ChFiDS_Spine::OffsetEdges ******/
		/****** md5 signature: 2c1f09e693ddfc14e4c9c7234c23ef1c ******/
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
		const TopoDS_Edge OffsetEdges(const int I);

		/****** ChFiDS_Spine::Parameter ******/
		/****** md5 signature: 97986a03b4a48a77a7cf202eb922c7ef ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
AbsC: double
Oriented: bool (optional, default to true)

Return
-------
U: double

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const double AbsC, Standard_Real &OutValue, const bool Oriented = true);

		/****** ChFiDS_Spine::Parameter ******/
		/****** md5 signature: 24ae49a3b0e6c17284a7f28023a7f6ec ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int
AbsC: double
Oriented: bool (optional, default to true)

Return
-------
U: double

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const int Index, const double AbsC, Standard_Real &OutValue, const bool Oriented = true);

		/****** ChFiDS_Spine::Period ******/
		/****** md5 signature: 46c44a3d0a70e4379c4de5440be6b09a ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		double Period();

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
		/****** md5 signature: 056263a4209bfdacd1bac210497aac10 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
AllData: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Reset;
		virtual void Reset(const bool AllData = false);

		/****** ChFiDS_Spine::Resolution ******/
		/****** md5 signature: 9e003da76059b4ae9d259081be3b319a ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
No available documentation.
") Resolution;
		double Resolution(const double R3d);

		/****** ChFiDS_Spine::SetCurrent ******/
		/****** md5 signature: 7c48206721d0dc4bb701d0447c651d2b ******/
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
		void SetCurrent(const int Index);

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
		/****** md5 signature: ab3c8aa7120dadb4aa17eca12807883e ******/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "
Parameters
----------
Par: double

Return
-------
None

Description
-----------
No available documentation.
") SetFirstParameter;
		void SetFirstParameter(const double Par);

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
		/****** md5 signature: 0f4b4ad6ae4be18a5bf9e31ed2d75df3 ******/
		%feature("compactdefaultargs") SetFirstTgt;
		%feature("autodoc", "
Parameters
----------
W: double

Return
-------
None

Description
-----------
No available documentation.
") SetFirstTgt;
		void SetFirstTgt(const double W);

		/****** ChFiDS_Spine::SetLastParameter ******/
		/****** md5 signature: fb0180633452f5c5da2de2897bd6108d ******/
		%feature("compactdefaultargs") SetLastParameter;
		%feature("autodoc", "
Parameters
----------
Par: double

Return
-------
None

Description
-----------
No available documentation.
") SetLastParameter;
		void SetLastParameter(const double Par);

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
		/****** md5 signature: 260f0d4e7c614e2a3db391d144b4e730 ******/
		%feature("compactdefaultargs") SetLastTgt;
		%feature("autodoc", "
Parameters
----------
W: double

Return
-------
None

Description
-----------
No available documentation.
") SetLastTgt;
		void SetLastTgt(const double W);

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
		/****** md5 signature: 1cfc6f5caa731396fe8468cda49359e8 ******/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "
Parameters
----------
W: double

Return
-------
None

Description
-----------
set a parameter reference for the approx.
") SetReference;
		void SetReference(const double W);

		/****** ChFiDS_Spine::SetReference ******/
		/****** md5 signature: 43516a38da4ce43037dc89b18e136d3c ******/
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
		void SetReference(const int I);

		/****** ChFiDS_Spine::SetStatus ******/
		/****** md5 signature: 2d1f716c17288242de51951eca364454 ******/
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
		void SetStatus(const ChFiDS_State S, const bool IsFirst);

		/****** ChFiDS_Spine::SetTangencyExtremity ******/
		/****** md5 signature: a07ad893b26868eb5d5bbcf64c5ee6bc ******/
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
		void SetTangencyExtremity(const bool IsTangency, const bool IsFirst);

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
		/****** md5 signature: e9702a61cdfec28783efa4b68a0281b8 ******/
		%feature("compactdefaultargs") SplitDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SplitDone;
		bool SplitDone();

		/****** ChFiDS_Spine::SplitDone ******/
		/****** md5 signature: b5c4f626d41ac4541620221074f1ad23 ******/
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
		void SplitDone(const bool B);

		/****** ChFiDS_Spine::Status ******/
		/****** md5 signature: bf695a58c89bc8e41720f23373049f7d ******/
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
		ChFiDS_State Status(const bool IsFirst);

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
		/****** md5 signature: 998630f5e9e2a22e14fc0f39875e7427 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
AbsC: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		gp_Pnt Value(const double AbsC);

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
		/****** md5 signature: a76c2c21a37b887cfed5e857114bc941 ******/
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
		void ChangeFirstCurve(const int Index);

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
		/****** md5 signature: 8a461292d7609e65ea111808ed90c6ee ******/
		%feature("compactdefaultargs") ChangeFirstParameters;
		%feature("autodoc", "
Parameters
----------
Pdeb: double
Pfin: double

Return
-------
None

Description
-----------
No available documentation.
") ChangeFirstParameters;
		void ChangeFirstParameters(const double Pdeb, const double Pfin);

		/****** ChFiDS_Stripe::ChangeIndexFirstPointOnS1 ******/
		/****** md5 signature: 8e92e1fda8fd8a6a395228a1aa4126b8 ******/
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
		void ChangeIndexFirstPointOnS1(const int Index);

		/****** ChFiDS_Stripe::ChangeIndexFirstPointOnS2 ******/
		/****** md5 signature: fed1ecccbf40232a77b34f438ef9e052 ******/
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
		void ChangeIndexFirstPointOnS2(const int Index);

		/****** ChFiDS_Stripe::ChangeIndexLastPointOnS1 ******/
		/****** md5 signature: 5ae4b68a436b2454c73a44d5ef502c72 ******/
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
		void ChangeIndexLastPointOnS1(const int Index);

		/****** ChFiDS_Stripe::ChangeIndexLastPointOnS2 ******/
		/****** md5 signature: 42dab0575ca0d8f2b0b570b1274ac1ff ******/
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
		void ChangeIndexLastPointOnS2(const int Index);

		/****** ChFiDS_Stripe::ChangeLastCurve ******/
		/****** md5 signature: 6d4a207e348f6c289ad092218c110b00 ******/
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
		void ChangeLastCurve(const int Index);

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
		/****** md5 signature: d93ea8ac6918d48d9251352ee5a29159 ******/
		%feature("compactdefaultargs") ChangeLastParameters;
		%feature("autodoc", "
Parameters
----------
Pdeb: double
Pfin: double

Return
-------
None

Description
-----------
No available documentation.
") ChangeLastParameters;
		void ChangeLastParameters(const double Pdeb, const double Pfin);

		/****** ChFiDS_Stripe::ChangePCurve ******/
		/****** md5 signature: e4139e86c9056c93443a9747128746a6 ******/
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
		opencascade::handle<Geom2d_Curve> & ChangePCurve(const bool First);

		/****** ChFiDS_Stripe::ChangeSetOfSurfData ******/
		/****** md5 signature: d4be66f827b4938a3a3cf93685b242ef ******/
		%feature("compactdefaultargs") ChangeSetOfSurfData;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<ChFiDS_SurfData>>>

Description
-----------
No available documentation.
") ChangeSetOfSurfData;
		opencascade::handle<NCollection_HSequence<opencascade::handle<ChFiDS_SurfData>>> & ChangeSetOfSurfData();

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
		/****** md5 signature: 6589f93472052df99f5c7301b10bcef9 ******/
		%feature("compactdefaultargs") Choix;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Choix;
		int Choix();

		/****** ChFiDS_Stripe::Choix ******/
		/****** md5 signature: 81c3a864aac9d3e8896e5a480ed156d3 ******/
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
		void Choix(const int C);

		/****** ChFiDS_Stripe::Curve ******/
		/****** md5 signature: 5b1b46a92df7fc5dde280bd1c9cf7c9c ******/
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
		int Curve(const bool First);

		/****** ChFiDS_Stripe::FirstCurve ******/
		/****** md5 signature: b1a84a637e4300fa952bb817485c92e1 ******/
		%feature("compactdefaultargs") FirstCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FirstCurve;
		int FirstCurve();

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
		/****** md5 signature: 9d61cb296df139e438e557874fc1a80b ******/
		%feature("compactdefaultargs") FirstParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
Pdeb: double
Pfin: double

Description
-----------
No available documentation.
") FirstParameters;
		void FirstParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_Stripe::InDS ******/
		/****** md5 signature: c8f7cca183f0cf32760b671d8e764bde ******/
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
		void InDS(const bool First, const int Nb = 1);

		/****** ChFiDS_Stripe::IndexFirstPointOnS1 ******/
		/****** md5 signature: a0b9146199bbfd25d712e2dbe5c59063 ******/
		%feature("compactdefaultargs") IndexFirstPointOnS1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexFirstPointOnS1;
		int IndexFirstPointOnS1();

		/****** ChFiDS_Stripe::IndexFirstPointOnS2 ******/
		/****** md5 signature: 8f705a385086f68c05e281e0d22f127b ******/
		%feature("compactdefaultargs") IndexFirstPointOnS2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexFirstPointOnS2;
		int IndexFirstPointOnS2();

		/****** ChFiDS_Stripe::IndexLastPointOnS1 ******/
		/****** md5 signature: 760a7ee5f3ea7e3e690efc402e1b5088 ******/
		%feature("compactdefaultargs") IndexLastPointOnS1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexLastPointOnS1;
		int IndexLastPointOnS1();

		/****** ChFiDS_Stripe::IndexLastPointOnS2 ******/
		/****** md5 signature: 4ddddc0b085ef76e0e2ec08a0a07a05b ******/
		%feature("compactdefaultargs") IndexLastPointOnS2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexLastPointOnS2;
		int IndexLastPointOnS2();

		/****** ChFiDS_Stripe::IndexPoint ******/
		/****** md5 signature: 7ceec7458875413275c07a0eea0412ff ******/
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
		int IndexPoint(const bool First, const int OnS);

		/****** ChFiDS_Stripe::IsInDS ******/
		/****** md5 signature: 147b6043b773bd5fdb18bc9d8fff61cd ******/
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
		int IsInDS(const bool First);

		/****** ChFiDS_Stripe::LastCurve ******/
		/****** md5 signature: ea98f3fd4cb9e1227ec18caaa39d50ea ******/
		%feature("compactdefaultargs") LastCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") LastCurve;
		int LastCurve();

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
		/****** md5 signature: 47146059692e148ade883a2168c309ff ******/
		%feature("compactdefaultargs") LastParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
Pdeb: double
Pfin: double

Description
-----------
No available documentation.
") LastParameters;
		void LastParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_Stripe::Orientation ******/
		/****** md5 signature: 24653536b8386ef927ed37fe6e171bd8 ******/
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
		TopAbs_Orientation Orientation(const int OnS);

		/****** ChFiDS_Stripe::Orientation ******/
		/****** md5 signature: 48851096f84f37ce4e55a1458d42ed3e ******/
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
		TopAbs_Orientation Orientation(const bool First);

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
		/****** md5 signature: ba1977b038780db0454eb21920012797 ******/
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
		const opencascade::handle<Geom2d_Curve> & PCurve(const bool First);

		/****** ChFiDS_Stripe::Parameters ******/
		/****** md5 signature: 703de8c8188d3f24f1789f22ffe261f6 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
First: bool

Return
-------
Pdeb: double
Pfin: double

Description
-----------
No available documentation.
") Parameters;
		void Parameters(const bool First, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 450319b92ef907358f09d50f1f1af5c4 ******/
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
		void SetCurve(const int Index, const bool First);

		/****** ChFiDS_Stripe::SetIndexPoint ******/
		/****** md5 signature: 0940f980a0ab8818aa0ceb4ce471de90 ******/
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
		void SetIndexPoint(const int Index, const bool First, const int OnS);

		/****** ChFiDS_Stripe::SetOfSurfData ******/
		/****** md5 signature: c4b15200f7d00a3b0f4eaa1b05a6af40 ******/
		%feature("compactdefaultargs") SetOfSurfData;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<ChFiDS_SurfData>>>

Description
-----------
No available documentation.
") SetOfSurfData;
		const opencascade::handle<NCollection_HSequence<opencascade::handle<ChFiDS_SurfData>>> & SetOfSurfData();

		/****** ChFiDS_Stripe::SetOrientation ******/
		/****** md5 signature: 6304d7b103fbbd01638f77530d048171 ******/
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
		void SetOrientation(const TopAbs_Orientation Or, const int OnS);

		/****** ChFiDS_Stripe::SetOrientation ******/
		/****** md5 signature: 9b21c8aa0ce59112fd49d8c396c7ef6c ******/
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
		void SetOrientation(const TopAbs_Orientation Or, const bool First);

		/****** ChFiDS_Stripe::SetParameters ******/
		/****** md5 signature: 647d015fccb4dd0d7b5311f34a06de48 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
First: bool
Pdeb: double
Pfin: double

Return
-------
None

Description
-----------
No available documentation.
") SetParameters;
		void SetParameters(const bool First, const double Pdeb, const double Pfin);

		/****** ChFiDS_Stripe::SetSolidIndex ******/
		/****** md5 signature: fa6df0a18043a2fc9938d2d98678978a ******/
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
		void SetSolidIndex(const int Index);

		/****** ChFiDS_Stripe::SolidIndex ******/
		/****** md5 signature: a06a4332a9a5b28dc194f9bc97e03052 ******/
		%feature("compactdefaultargs") SolidIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") SolidIndex;
		int SolidIndex();

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
		/****** md5 signature: 1c9a99c4f72ae2188a5b950ee752d850 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		int Extent();

		/****** ChFiDS_StripeMap::FindFromIndex ******/
		/****** md5 signature: 6b0310d29845174cf9dc06bb275ef011 ******/
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<opencascade::handle<ChFiDS_Stripe>>

Description
-----------
No available documentation.
") FindFromIndex;
		const NCollection_List<opencascade::handle<ChFiDS_Stripe>> & FindFromIndex(const int I);

		/****** ChFiDS_StripeMap::FindFromKey ******/
		/****** md5 signature: 7f6b9008eede8d7e67f2a1172629fc5d ******/
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
NCollection_List<opencascade::handle<ChFiDS_Stripe>>

Description
-----------
No available documentation.
") FindFromKey;
		const NCollection_List<opencascade::handle<ChFiDS_Stripe>> & FindFromKey(const TopoDS_Vertex & V);

		/****** ChFiDS_StripeMap::FindKey ******/
		/****** md5 signature: dca0436e919be63a88534c6ba2238f56 ******/
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
		const TopoDS_Vertex FindKey(const int I);

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
		/****** md5 signature: 85558f812ebb19d3d70f7d8cfa77ef57 ******/
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
		void ChangeIndexOfS1(const int Index);

		/****** ChFiDS_SurfData::ChangeIndexOfS2 ******/
		/****** md5 signature: 14f1966ba67be4a61892f52bc6d85e44 ******/
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
		void ChangeIndexOfS2(const int Index);

		/****** ChFiDS_SurfData::ChangeInterference ******/
		/****** md5 signature: 36d14e4e084257d7b4db489595508239 ******/
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
		ChFiDS_FaceInterference & ChangeInterference(const int OnS);

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
		/****** md5 signature: 514ab442a1b55d1fb30e1fca4d7262a9 ******/
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
		void ChangeSurf(const int Index);

		/****** ChFiDS_SurfData::ChangeVertex ******/
		/****** md5 signature: e3c554114ad1c885d9f2a9b2b59a91c3 ******/
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
		ChFiDS_CommonPoint & ChangeVertex(const bool First, const int OnS);

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
		/****** md5 signature: 0a5eda5f9fc5a448f73d4f4b523c4bb2 ******/
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstExtensionValue;
		double FirstExtensionValue();

		/****** ChFiDS_SurfData::FirstExtensionValue ******/
		/****** md5 signature: 4dae1b698fd28156bf84d12b841cea5a ******/
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", "
Parameters
----------
Extend: double

Return
-------
None

Description
-----------
No available documentation.
") FirstExtensionValue;
		void FirstExtensionValue(const double Extend);

		/****** ChFiDS_SurfData::FirstSpineParam ******/
		/****** md5 signature: 91f104c1e5d13cc47d64d7c1af97b499 ******/
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstSpineParam;
		double FirstSpineParam();

		/****** ChFiDS_SurfData::FirstSpineParam ******/
		/****** md5 signature: 04d76da2c7c4c6a44f88ed227daa2d19 ******/
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", "
Parameters
----------
Par: double

Return
-------
None

Description
-----------
No available documentation.
") FirstSpineParam;
		void FirstSpineParam(const double Par);

		/****** ChFiDS_SurfData::Get2dPoints ******/
		/****** md5 signature: 469782d07bd166c38676b6de4ec7733f ******/
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
		gp_Pnt2d Get2dPoints(const bool First, const int OnS);

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
		/****** md5 signature: 675cee3f6aafb4507629df7e4570b884 ******/
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
		int Index(const int OfS);

		/****** ChFiDS_SurfData::IndexOfC ******/
		/****** md5 signature: c211683d7ee0df9d62e2fb43ede40cde ******/
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
		int IndexOfC(const int OnS);

		/****** ChFiDS_SurfData::IndexOfC1 ******/
		/****** md5 signature: 7e6fa593bbde04d5ea478ce1ade7aca9 ******/
		%feature("compactdefaultargs") IndexOfC1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexOfC1;
		int IndexOfC1();

		/****** ChFiDS_SurfData::IndexOfC2 ******/
		/****** md5 signature: 51cc96af3f80358500e6dfa436212ebe ******/
		%feature("compactdefaultargs") IndexOfC2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexOfC2;
		int IndexOfC2();

		/****** ChFiDS_SurfData::IndexOfS1 ******/
		/****** md5 signature: df83f6ea6ce4d45d146795af7ed9ec83 ******/
		%feature("compactdefaultargs") IndexOfS1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexOfS1;
		int IndexOfS1();

		/****** ChFiDS_SurfData::IndexOfS2 ******/
		/****** md5 signature: 9fa3279a3160a50b417960ec676944d9 ******/
		%feature("compactdefaultargs") IndexOfS2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexOfS2;
		int IndexOfS2();

		/****** ChFiDS_SurfData::Interference ******/
		/****** md5 signature: 53c241186e4dfbe0dfc65a481319b8aa ******/
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
		const ChFiDS_FaceInterference & Interference(const int OnS);

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
		/****** md5 signature: 1b7fd2b30728dd17064ca8adf6feb1cc ******/
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
		bool IsOnCurve(const int OnS);

		/****** ChFiDS_SurfData::IsOnCurve1 ******/
		/****** md5 signature: 2749a3fcc0a4edfdd8368336afd1b0ce ******/
		%feature("compactdefaultargs") IsOnCurve1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOnCurve1;
		bool IsOnCurve1();

		/****** ChFiDS_SurfData::IsOnCurve2 ******/
		/****** md5 signature: 917e66c937fd698cbc1466eeaf9d1087 ******/
		%feature("compactdefaultargs") IsOnCurve2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOnCurve2;
		bool IsOnCurve2();

		/****** ChFiDS_SurfData::LastExtensionValue ******/
		/****** md5 signature: 1fbcb6fb381b823ecddec97d4e9b4529 ******/
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastExtensionValue;
		double LastExtensionValue();

		/****** ChFiDS_SurfData::LastExtensionValue ******/
		/****** md5 signature: 4e410ffe2c3c35ab2e284d67b3e5c50f ******/
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", "
Parameters
----------
Extend: double

Return
-------
None

Description
-----------
No available documentation.
") LastExtensionValue;
		void LastExtensionValue(const double Extend);

		/****** ChFiDS_SurfData::LastSpineParam ******/
		/****** md5 signature: 2ac30ccbd6c6f466cec1c367bde2e216 ******/
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastSpineParam;
		double LastSpineParam();

		/****** ChFiDS_SurfData::LastSpineParam ******/
		/****** md5 signature: 5a275eed5b3f4b4335089530b51014e2 ******/
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", "
Parameters
----------
Par: double

Return
-------
None

Description
-----------
No available documentation.
") LastSpineParam;
		void LastSpineParam(const double Par);

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
		/****** md5 signature: e2724afd5c345afc90c326c5ae14dedc ******/
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
		void SetIndexOfC1(const int Index);

		/****** ChFiDS_SurfData::SetIndexOfC2 ******/
		/****** md5 signature: 429a2d993d8279e54f18fd6e231c50ee ******/
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
		void SetIndexOfC2(const int Index);

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
		/****** md5 signature: be9f6994c804bfc3d091dfe3d52ea6c3 ******/
		%feature("compactdefaultargs") Surf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Surf;
		int Surf();

		/****** ChFiDS_SurfData::TwistOnS1 ******/
		/****** md5 signature: a5d52f8dc5c7eae9b23cdd5e7c7908f7 ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		bool TwistOnS1();

		/****** ChFiDS_SurfData::TwistOnS1 ******/
		/****** md5 signature: 9adc1d225dc85be8fbb76ea6a9bee180 ******/
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
		void TwistOnS1(const bool T);

		/****** ChFiDS_SurfData::TwistOnS2 ******/
		/****** md5 signature: 0923ad99b335481d4c13cea7964daa51 ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		bool TwistOnS2();

		/****** ChFiDS_SurfData::TwistOnS2 ******/
		/****** md5 signature: f15266844334672a75a4c0b2524f4918 ******/
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
		void TwistOnS2(const bool T);

		/****** ChFiDS_SurfData::Vertex ******/
		/****** md5 signature: cec1750e21135bf25c0ce71693137297 ******/
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
		const ChFiDS_CommonPoint & Vertex(const bool First, const int OnS);

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
		/****** md5 signature: 1b828eeeb09cede56ba8d0f2d0ce5cd5 ******/
		%feature("compactdefaultargs") ChFiDS_ChamfSpine;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine(const double Tol);

		/****** ChFiDS_ChamfSpine::Dists ******/
		/****** md5 signature: 3db0c46352072f7a870a306dac2dfdb3 ******/
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "
Parameters
----------

Return
-------
Dis1: double
Dis2: double

Description
-----------
No available documentation.
") Dists;
		void Dists(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFiDS_ChamfSpine::GetDist ******/
		/****** md5 signature: 04221547c3f9fcf80972494db5df889e ******/
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", "
Parameters
----------

Return
-------
Dis: double

Description
-----------
No available documentation.
") GetDist;
		void GetDist(Standard_Real &OutValue);

		/****** ChFiDS_ChamfSpine::GetDistAngle ******/
		/****** md5 signature: c5322e4013afc162a1b48301a7e99325 ******/
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "
Parameters
----------

Return
-------
Dis: double
Angle: double

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
		/****** md5 signature: f871d05972b8bf2844bca7e8655efaf2 ******/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "
Parameters
----------
Dis: double

Return
-------
None

Description
-----------
No available documentation.
") SetDist;
		void SetDist(const double Dis);

		/****** ChFiDS_ChamfSpine::SetDistAngle ******/
		/****** md5 signature: e63d91cc45e186969eb4eb9173da7670 ******/
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "
Parameters
----------
Dis: double
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") SetDistAngle;
		void SetDistAngle(const double Dis, const double Angle);

		/****** ChFiDS_ChamfSpine::SetDists ******/
		/****** md5 signature: b54cc627052c37a06984f6d7a52bc48a ******/
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "
Parameters
----------
Dis1: double
Dis2: double

Return
-------
None

Description
-----------
No available documentation.
") SetDists;
		void SetDists(const double Dis1, const double Dis2);

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
		/****** md5 signature: 07f26883239bca09ce358e4667e1b675 ******/
		%feature("compactdefaultargs") ChFiDS_FilSpine;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") ChFiDS_FilSpine;
		 ChFiDS_FilSpine(const double Tol);

		/****** ChFiDS_FilSpine::AppendElSpine ******/
		/****** md5 signature: 5a9e220830af64996d9273a7835d30ab ******/
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
		void AppendElSpine(const opencascade::handle<ChFiDS_ElSpine> & Els);

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
		/****** md5 signature: 004cfe784b2152966984d86bf19ad8a1 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the radius is constant all along the spine.
") IsConstant;
		bool IsConstant();

		/****** ChFiDS_FilSpine::IsConstant ******/
		/****** md5 signature: aca8861275eec200d0b5bbfa54f32c56 ******/
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
		bool IsConstant(const int IE);

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
		/****** md5 signature: 1a4deb9574088c4b551dc03c72238b74 ******/
		%feature("compactdefaultargs") MaxRadFromSeqAndLaws;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum radius if the fillet is non-constant.
") MaxRadFromSeqAndLaws;
		double MaxRadFromSeqAndLaws();

		/****** ChFiDS_FilSpine::Radius ******/
		/****** md5 signature: 3f212b2355d53c03baacfd2fb8e2678a ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the radius if the fillet is constant all along the spine.
") Radius;
		double Radius();

		/****** ChFiDS_FilSpine::Radius ******/
		/****** md5 signature: c04d1880ddb5efd03c01c2e2f2c7d9a5 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "
Parameters
----------
IE: int

Return
-------
double

Description
-----------
returns the radius if the fillet is constant all along the edge E.
") Radius;
		double Radius(const int IE);

		/****** ChFiDS_FilSpine::Radius ******/
		/****** md5 signature: 398a9614a5e885a486845668431f2da9 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
double

Description
-----------
returns the radius if the fillet is constant all along the edge E.
") Radius;
		double Radius(const TopoDS_Edge & E);

		/****** ChFiDS_FilSpine::Reset ******/
		/****** md5 signature: 241d0d1cac116ce917a39aed931277cb ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
AllData: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Reset;
		void Reset(const bool AllData = false);

		/****** ChFiDS_FilSpine::SetRadius ******/
		/****** md5 signature: 7b55786418268e67777d80c2948dc4bb ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: double
E: TopoDS_Edge

Return
-------
None

Description
-----------
initializes the constant vector on edge E.
") SetRadius;
		void SetRadius(const double Radius, const TopoDS_Edge & E);

		/****** ChFiDS_FilSpine::SetRadius ******/
		/****** md5 signature: 48c975486c35c27c3b5115ea3dd8528d ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: double
V: TopoDS_Vertex

Return
-------
None

Description
-----------
initializes the vector on Vertex V.
") SetRadius;
		void SetRadius(const double Radius, const TopoDS_Vertex & V);

		/****** ChFiDS_FilSpine::SetRadius ******/
		/****** md5 signature: 314cb004ed4a0e1fc6f9c8d57568e2a0 ******/
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
		void SetRadius(const gp_XY & UandR, const int IinC);

		/****** ChFiDS_FilSpine::SetRadius ******/
		/****** md5 signature: 09837d8d7c15cdc696d2bc10c3316421 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: double

Return
-------
None

Description
-----------
initializes the constant vector on all spine.
") SetRadius;
		void SetRadius(const double Radius);

		/****** ChFiDS_FilSpine::SetRadius ******/
		/****** md5 signature: 40d29f6ca9160fb3fd88b0f904db1bb2 ******/
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
		void SetRadius(const opencascade::handle<Law_Function> & C, const int IinC);

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

class ChFiDS_SecHArray1 : public NCollection_Array1<ChFiDS_CircSection>, public Standard_Transient {
  public:
    ChFiDS_SecHArray1(const Standard_Integer theLower, const Standard_Integer theUpper);
    ChFiDS_SecHArray1(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<ChFiDS_CircSection>::value_type& theValue);
    ChFiDS_SecHArray1(const NCollection_Array1<ChFiDS_CircSection>& theOther);
    const NCollection_Array1<ChFiDS_CircSection>& Array1();
    NCollection_Array1<ChFiDS_CircSection>& ChangeArray1();
};
%make_alias(ChFiDS_SecHArray1)

/* harray2 classes */
/* hsequence classes */
class ChFiDS_HData : public NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>>, public Standard_Transient {
  public:
    ChFiDS_HData();
    ChFiDS_HData(const NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>>& theOther);
    const NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>>& theSequence);
    NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>>& ChangeSequence();
};
%make_alias(ChFiDS_HData)


/* class aliases */
%pythoncode {
}
