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
%define SHAPEEXTENDDOCSTRING
"ShapeExtend module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_shapeextend.html"
%enddef
%module (package="OCC.Core", docstring=SHAPEEXTENDDOCSTRING) ShapeExtend


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
#include<ShapeExtend_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<TColGeom_module.hxx>
#include<TColStd_module.hxx>
#include<TopTools_module.hxx>
#include<TopAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TopLoc_module.hxx>
#include<Poly_module.hxx>
#include<IntRes2d_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i
%import TopoDS.i
%import Geom.i
%import GeomAbs.i
%import gp.i
%import TColGeom.i
%import TColStd.i
%import TopTools.i
%import TopAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum ShapeExtend_Parametrisation {
	ShapeExtend_Natural = 0,
	ShapeExtend_Uniform = 1,
	ShapeExtend_Unitary = 2,
};

enum ShapeExtend_Status {
	ShapeExtend_OK = 0,
	ShapeExtend_DONE1 = 1,
	ShapeExtend_DONE2 = 2,
	ShapeExtend_DONE3 = 3,
	ShapeExtend_DONE4 = 4,
	ShapeExtend_DONE5 = 5,
	ShapeExtend_DONE6 = 6,
	ShapeExtend_DONE7 = 7,
	ShapeExtend_DONE8 = 8,
	ShapeExtend_DONE = 9,
	ShapeExtend_FAIL1 = 10,
	ShapeExtend_FAIL2 = 11,
	ShapeExtend_FAIL3 = 12,
	ShapeExtend_FAIL4 = 13,
	ShapeExtend_FAIL5 = 14,
	ShapeExtend_FAIL6 = 15,
	ShapeExtend_FAIL7 = 16,
	ShapeExtend_FAIL8 = 17,
	ShapeExtend_FAIL = 18,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class ShapeExtend_Parametrisation(IntEnum):
	ShapeExtend_Natural = 0
	ShapeExtend_Uniform = 1
	ShapeExtend_Unitary = 2
ShapeExtend_Natural = ShapeExtend_Parametrisation.ShapeExtend_Natural
ShapeExtend_Uniform = ShapeExtend_Parametrisation.ShapeExtend_Uniform
ShapeExtend_Unitary = ShapeExtend_Parametrisation.ShapeExtend_Unitary

class ShapeExtend_Status(IntEnum):
	ShapeExtend_OK = 0
	ShapeExtend_DONE1 = 1
	ShapeExtend_DONE2 = 2
	ShapeExtend_DONE3 = 3
	ShapeExtend_DONE4 = 4
	ShapeExtend_DONE5 = 5
	ShapeExtend_DONE6 = 6
	ShapeExtend_DONE7 = 7
	ShapeExtend_DONE8 = 8
	ShapeExtend_DONE = 9
	ShapeExtend_FAIL1 = 10
	ShapeExtend_FAIL2 = 11
	ShapeExtend_FAIL3 = 12
	ShapeExtend_FAIL4 = 13
	ShapeExtend_FAIL5 = 14
	ShapeExtend_FAIL6 = 15
	ShapeExtend_FAIL7 = 16
	ShapeExtend_FAIL8 = 17
	ShapeExtend_FAIL = 18
ShapeExtend_OK = ShapeExtend_Status.ShapeExtend_OK
ShapeExtend_DONE1 = ShapeExtend_Status.ShapeExtend_DONE1
ShapeExtend_DONE2 = ShapeExtend_Status.ShapeExtend_DONE2
ShapeExtend_DONE3 = ShapeExtend_Status.ShapeExtend_DONE3
ShapeExtend_DONE4 = ShapeExtend_Status.ShapeExtend_DONE4
ShapeExtend_DONE5 = ShapeExtend_Status.ShapeExtend_DONE5
ShapeExtend_DONE6 = ShapeExtend_Status.ShapeExtend_DONE6
ShapeExtend_DONE7 = ShapeExtend_Status.ShapeExtend_DONE7
ShapeExtend_DONE8 = ShapeExtend_Status.ShapeExtend_DONE8
ShapeExtend_DONE = ShapeExtend_Status.ShapeExtend_DONE
ShapeExtend_FAIL1 = ShapeExtend_Status.ShapeExtend_FAIL1
ShapeExtend_FAIL2 = ShapeExtend_Status.ShapeExtend_FAIL2
ShapeExtend_FAIL3 = ShapeExtend_Status.ShapeExtend_FAIL3
ShapeExtend_FAIL4 = ShapeExtend_Status.ShapeExtend_FAIL4
ShapeExtend_FAIL5 = ShapeExtend_Status.ShapeExtend_FAIL5
ShapeExtend_FAIL6 = ShapeExtend_Status.ShapeExtend_FAIL6
ShapeExtend_FAIL7 = ShapeExtend_Status.ShapeExtend_FAIL7
ShapeExtend_FAIL8 = ShapeExtend_Status.ShapeExtend_FAIL8
ShapeExtend_FAIL = ShapeExtend_Status.ShapeExtend_FAIL
};
/* end python proxy for enums */

/* handles */
%wrap_handle(ShapeExtend_BasicMsgRegistrator)
%wrap_handle(ShapeExtend_ComplexCurve)
%wrap_handle(ShapeExtend_CompositeSurface)
%wrap_handle(ShapeExtend_WireData)
%wrap_handle(ShapeExtend_MsgRegistrator)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<TopoDS_Shape,Message_ListOfMsg,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,Message_ListOfMsg,TopTools_ShapeMapHasher>::KeyValues;
%template(ShapeExtend_DataMapOfShapeListOfMsg) NCollection_DataMap<TopoDS_Shape,Message_ListOfMsg,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<opencascade::handle<Standard_Transient>,Message_ListOfMsg>::Items;
%ignore NCollection_DataMap<opencascade::handle<Standard_Transient>,Message_ListOfMsg>::KeyValues;
%template(ShapeExtend_DataMapOfTransientListOfMsg) NCollection_DataMap<opencascade::handle<Standard_Transient>,Message_ListOfMsg>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, Message_ListOfMsg, TopTools_ShapeMapHasher>::Iterator ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, Message_ListOfMsg>::Iterator ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg;
typedef NCollection_DataMap<TopoDS_Shape, Message_ListOfMsg, TopTools_ShapeMapHasher> ShapeExtend_DataMapOfShapeListOfMsg;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, Message_ListOfMsg> ShapeExtend_DataMapOfTransientListOfMsg;
/* end typedefs declaration */

/********************
* class ShapeExtend *
********************/
%rename(shapeextend) ShapeExtend;
class ShapeExtend {
	public:
		/****** ShapeExtend::DecodeStatus ******/
		/****** md5 signature: e95c27710790f8db82cc818d0a6bc7cc ******/
		%feature("compactdefaultargs") DecodeStatus;
		%feature("autodoc", "
Parameters
----------
flag: int
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
Tells if a bit flag contains bit corresponding to enumerated status.
") DecodeStatus;
		static bool DecodeStatus(const int flag, const ShapeExtend_Status status);

		/****** ShapeExtend::EncodeStatus ******/
		/****** md5 signature: e1b869c52b702ddc6596c29d8d544669 ******/
		%feature("compactdefaultargs") EncodeStatus;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
int

Description
-----------
Encodes status (enumeration) to a bit flag.
") EncodeStatus;
		static int EncodeStatus(const ShapeExtend_Status status);

		/****** ShapeExtend::Init ******/
		/****** md5 signature: 342fdccc4643f67c269591c4b6447108 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Inits using of ShapeExtend. Currently, loads messages output by ShapeHealing algorithms.
") Init;
		static void Init();

};


%extend ShapeExtend {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class ShapeExtend_BasicMsgRegistrator *
****************************************/
class ShapeExtend_BasicMsgRegistrator : public Standard_Transient {
	public:
		/****** ShapeExtend_BasicMsgRegistrator::ShapeExtend_BasicMsgRegistrator ******/
		/****** md5 signature: d702c519c6e3d4ef167e1150681c8eac ******/
		%feature("compactdefaultargs") ShapeExtend_BasicMsgRegistrator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeExtend_BasicMsgRegistrator;
		 ShapeExtend_BasicMsgRegistrator();

		/****** ShapeExtend_BasicMsgRegistrator::Send ******/
		/****** md5 signature: da6fbe2eca5e7a814d953765183b291a ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
object: Standard_Transient
message: Message_Msg
gravity: Message_Gravity

Return
-------
None

Description
-----------
Sends a message to be attached to the object. Object can be of any type interpreted by redefined MsgRegistrator.
") Send;
		virtual void Send(const opencascade::handle<Standard_Transient> & object, const Message_Msg & message, const Message_Gravity gravity);

		/****** ShapeExtend_BasicMsgRegistrator::Send ******/
		/****** md5 signature: 054be7c1da7eaa4937d6b2832814258e ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
message: Message_Msg
gravity: Message_Gravity

Return
-------
None

Description
-----------
Sends a message to be attached to the shape.
") Send;
		virtual void Send(const TopoDS_Shape & shape, const Message_Msg & message, const Message_Gravity gravity);

		/****** ShapeExtend_BasicMsgRegistrator::Send ******/
		/****** md5 signature: b2de47162d64d2d3fab87292ed5af94b ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
message: Message_Msg
gravity: Message_Gravity

Return
-------
None

Description
-----------
Calls Send method with Null Transient.
") Send;
		virtual void Send(const Message_Msg & message, const Message_Gravity gravity);

};


%make_alias(ShapeExtend_BasicMsgRegistrator)

%extend ShapeExtend_BasicMsgRegistrator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ShapeExtend_ComplexCurve *
*********************************/
%nodefaultctor ShapeExtend_ComplexCurve;
class ShapeExtend_ComplexCurve : public Geom_Curve {
	public:
		/****** ShapeExtend_ComplexCurve::CheckConnectivity ******/
		/****** md5 signature: b761cfe135a0fb4678d3c6981b6d094c ******/
		%feature("compactdefaultargs") CheckConnectivity;
		%feature("autodoc", "
Parameters
----------
Preci: double

Return
-------
bool

Description
-----------
Checks geometrical connectivity of the curves, including closure (sets fields myClosed).
") CheckConnectivity;
		bool CheckConnectivity(const double Preci);

		/****** ShapeExtend_ComplexCurve::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_C0.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** ShapeExtend_ComplexCurve::Curve ******/
		/****** md5 signature: 4e45ce6487d3b0672dfa774934b88f2d ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns curve given by its index.
") Curve;
		virtual const opencascade::handle<Geom_Curve> & Curve(const int index);

		/****** ShapeExtend_ComplexCurve::EvalD0 ******/
		/****** md5 signature: 7d2136079fd2b23e6a6640ff4aa95ab3 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
Returns point at parameter U. Finds appropriate curve and local parameter on it.
") EvalD0;
		gp_Pnt EvalD0(const double U);

		/****** ShapeExtend_ComplexCurve::EvalD1 ******/
		/****** md5 signature: 574852a1b0438f098fc992aa03cb4c71 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD1

Description
-----------
No available documentation.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double U);

		/****** ShapeExtend_ComplexCurve::EvalD2 ******/
		/****** md5 signature: 728f16921036d1f252a453ed8bb97aa7 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD2

Description
-----------
No available documentation.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double U);

		/****** ShapeExtend_ComplexCurve::EvalD3 ******/
		/****** md5 signature: f60a1e031ec27c55a8793878a1cd54b4 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
Geom_Curve::ResD3

Description
-----------
No available documentation.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double U);

		/****** ShapeExtend_ComplexCurve::EvalDN ******/
		/****** md5 signature: abe0bfeb219108c8a83d6b4b914869e9 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") EvalDN;
		gp_Vec EvalDN(const double U, const int N);

		/****** ShapeExtend_ComplexCurve::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns 0.
") FirstParameter;
		double FirstParameter();

		/****** ShapeExtend_ComplexCurve::GetScaleFactor ******/
		/****** md5 signature: 26b7b7a77781f417493b5e5ad1351753 ******/
		%feature("compactdefaultargs") GetScaleFactor;
		%feature("autodoc", "
Parameters
----------
ind: int

Return
-------
double

Description
-----------
Returns scale factor for recomputing of deviatives.
") GetScaleFactor;
		virtual double GetScaleFactor(const int ind);

		/****** ShapeExtend_ComplexCurve::IsCN ******/
		/****** md5 signature: 7148abeb948e78dbe081ec4edd4357f0 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns False if N > 0.
") IsCN;
		bool IsCN(const int N);

		/****** ShapeExtend_ComplexCurve::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is closed.
") IsClosed;
		bool IsClosed();

		/****** ShapeExtend_ComplexCurve::IsPeriodic ******/
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsPeriodic;
		bool IsPeriodic();

		/****** ShapeExtend_ComplexCurve::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns 1.
") LastParameter;
		double LastParameter();

		/****** ShapeExtend_ComplexCurve::LocalToGlobal ******/
		/****** md5 signature: 66603f7360706e0723acaf911d6fa065 ******/
		%feature("compactdefaultargs") LocalToGlobal;
		%feature("autodoc", "
Parameters
----------
index: int
Ulocal: double

Return
-------
double

Description
-----------
Returns global parameter for the whole curve according to the segment and local parameter on it.
") LocalToGlobal;
		virtual double LocalToGlobal(const int index, const double Ulocal);

		/****** ShapeExtend_ComplexCurve::LocateParameter ******/
		/****** md5 signature: da910478867e50103727891bb2ce59b4 ******/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
UOut: double

Description
-----------
Returns number of the curve for the given parameter U and local parameter UOut for the found curve.
") LocateParameter;
		virtual int LocateParameter(const double U, Standard_Real &OutValue);

		/****** ShapeExtend_ComplexCurve::NbCurves ******/
		/****** md5 signature: 595b4261753bb66073c22d8391bc39a2 ******/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of curves.
") NbCurves;
		virtual int NbCurves();

		/****** ShapeExtend_ComplexCurve::ReversedParameter ******/
		/****** md5 signature: d1c5381c0a990adfec963bc4b96f0b60 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns 1 - U.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** ShapeExtend_ComplexCurve::Transform ******/
		/****** md5 signature: 439ee2b24a3348dae5069270ca07eb56 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies transformation to each curve.
") Transform;
		void Transform(const gp_Trsf & T);

};


%make_alias(ShapeExtend_ComplexCurve)

%extend ShapeExtend_ComplexCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeExtend_CompositeSurface *
*************************************/
class ShapeExtend_CompositeSurface : public Geom_Surface {
	public:
		/****** ShapeExtend_CompositeSurface::ShapeExtend_CompositeSurface ******/
		/****** md5 signature: ac2e7d39ef6c5af9a68d551d965c0f1b ******/
		%feature("compactdefaultargs") ShapeExtend_CompositeSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface();

		/****** ShapeExtend_CompositeSurface::ShapeExtend_CompositeSurface ******/
		/****** md5 signature: 7f6c00b6910c82f47b8f8360f22e33f3 ******/
		%feature("compactdefaultargs") ShapeExtend_CompositeSurface;
		%feature("autodoc", "
Parameters
----------
GridSurf: TColGeom_HArray2OfSurface
param: ShapeExtend_Parametrisation (optional, default to ShapeExtend_Natural)

Return
-------
None

Description
-----------
Initializes by a grid of surfaces (calls Init()).
") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface(const opencascade::handle<TColGeom_HArray2OfSurface > & GridSurf, const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****** ShapeExtend_CompositeSurface::ShapeExtend_CompositeSurface ******/
		/****** md5 signature: d8080ee2c250171ea0a74354bc5c480f ******/
		%feature("compactdefaultargs") ShapeExtend_CompositeSurface;
		%feature("autodoc", "
Parameters
----------
GridSurf: TColGeom_HArray2OfSurface
UJoints: TColStd_Array1OfReal
VJoints: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Initializes by a grid of surfaces (calls Init()).
") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface(const opencascade::handle<TColGeom_HArray2OfSurface > & GridSurf, const TColStd_Array1OfReal & UJoints, const TColStd_Array1OfReal & VJoints);

		/****** ShapeExtend_CompositeSurface::Bounds ******/
		/****** md5 signature: 7f1a4954e4b71238771f442fdca29c3c ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
U2: double
V1: double
V2: double

Description
-----------
Returns the parametric bounds of grid.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeExtend_CompositeSurface::CheckConnectivity ******/
		/****** md5 signature: 3f8dffd5219bd5b09159180001e91603 ******/
		%feature("compactdefaultargs") CheckConnectivity;
		%feature("autodoc", "
Parameters
----------
prec: double

Return
-------
bool

Description
-----------
Checks geometrical connectivity of the patches, including closedness (sets fields muUClosed and myVClosed).
") CheckConnectivity;
		bool CheckConnectivity(const double prec);

		/****** ShapeExtend_CompositeSurface::ComputeJointValues ******/
		/****** md5 signature: 770d71062e3f622ec20d9c8cc0ea7fed ******/
		%feature("compactdefaultargs") ComputeJointValues;
		%feature("autodoc", "
Parameters
----------
param: ShapeExtend_Parametrisation (optional, default to ShapeExtend_Natural)

Return
-------
None

Description
-----------
Computes Joint values according to parameter.
") ComputeJointValues;
		void ComputeJointValues(const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****** ShapeExtend_CompositeSurface::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
returns C0.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** ShapeExtend_CompositeSurface::Copy ******/
		/****** md5 signature: 4931da9603d5b3bcede1c1210c5d8c3f ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Returns a copy of the surface.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** ShapeExtend_CompositeSurface::EvalD0 ******/
		/****** md5 signature: 1046a8f73ae1a8fffe777fdefe071ada ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U,V on the grid.
") EvalD0;
		gp_Pnt EvalD0(const double U, const double V);

		/****** ShapeExtend_CompositeSurface::EvalD1 ******/
		/****** md5 signature: c55b624ed921898185694d11b9c5628f ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD1

Description
-----------
Computes the point P and the first derivatives in the directions U and V at this point.
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double U, const double V);

		/****** ShapeExtend_CompositeSurface::EvalD2 ******/
		/****** md5 signature: f6a44e7aae3253ecad3ffd20b8d918e4 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD2

Description
-----------
Computes the point P, the first and the second derivatives in the directions U and V at this point.
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double U, const double V);

		/****** ShapeExtend_CompositeSurface::EvalD3 ******/
		/****** md5 signature: a71e0c31958103799dbcac00589886e4 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
Geom_Surface::ResD3

Description
-----------
Computes the point P, the first,the second and the third derivatives in the directions U and V at this point.
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double U, const double V);

		/****** ShapeExtend_CompositeSurface::EvalDN ******/
		/****** md5 signature: 1ef4fac99419b60efd50e8567b76b4d1 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V).
") EvalDN;
		gp_Vec EvalDN(const double U, const double V, const int Nu, const int Nv);

		/****** ShapeExtend_CompositeSurface::GlobalToLocal ******/
		/****** md5 signature: 82d1abcb9fdcc3c28069ee8d57faf9f4 ******/
		%feature("compactdefaultargs") GlobalToLocal;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
UV: gp_Pnt2d

Return
-------
gp_Pnt2d

Description
-----------
Converts global parameters UV to local parameters uv on patch i,j.
") GlobalToLocal;
		gp_Pnt2d GlobalToLocal(const int i, const int j, const gp_Pnt2d & UV);

		/****** ShapeExtend_CompositeSurface::GlobalToLocalTransformation ******/
		/****** md5 signature: 5c721f24bad188537d48f6fceede7fb3 ******/
		%feature("compactdefaultargs") GlobalToLocalTransformation;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
Trsf: gp_Trsf2d

Return
-------
uFact: double

Description
-----------
Computes transformation operator and uFactor descrinbing affine transformation required to convert global parameters on composite surface to local parameters on patch (i,j): uv = ( uFactor, 1. ) X Trsf * UV; NOTE: Thus Trsf contains shift and scale by V, scale by U is stored in uFact. Returns True if transformation is not an identity.
") GlobalToLocalTransformation;
		bool GlobalToLocalTransformation(const int i, const int j, Standard_Real &OutValue, gp_Trsf2d & Trsf);

		/****** ShapeExtend_CompositeSurface::Init ******/
		/****** md5 signature: f2288c4c472850a31f4eeecce534b6ec ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
GridSurf: TColGeom_HArray2OfSurface
param: ShapeExtend_Parametrisation (optional, default to ShapeExtend_Natural)

Return
-------
bool

Description
-----------
Initializes by a grid of surfaces. All the Surfaces of the grid must have geometrical connectivity as stated above. If geometrical connectivity is not satisfied, method returns False. However, class is initialized even in that case. //! Last parameter defines how global parametrisation (joint values) will be computed: ShapeExtend_Natural: U1 = u11min, Ui+1 = Ui + (ui1max-ui1min), etc. ShapeExtend_Uniform: Ui = i-1, Vj = j-1 ShapeExtend_Unitary: Ui = (i-1)/Nu, Vi = (j-1)/Nv.
") Init;
		bool Init(const opencascade::handle<TColGeom_HArray2OfSurface > & GridSurf, const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****** ShapeExtend_CompositeSurface::Init ******/
		/****** md5 signature: 5fe393900a1833b20c7080664f276212 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
GridSurf: TColGeom_HArray2OfSurface
UJoints: TColStd_Array1OfReal
VJoints: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Initializes by a grid of surfaces with given global parametrisation defined by UJoints and VJoints arrays, each having length equal to number of patches in corresponding direction + 1. Global joint values should be sorted in increasing order. All the Surfaces of the grid must have geometrical connectivity as stated above. If geometrical connectivity is not satisfied, method returns False. However, class is initialized even in that case.
") Init;
		bool Init(const opencascade::handle<TColGeom_HArray2OfSurface > & GridSurf, const TColStd_Array1OfReal & UJoints, const TColStd_Array1OfReal & VJoints);

		/****** ShapeExtend_CompositeSurface::IsCNu ******/
		/****** md5 signature: 2f1fcdee848f1e9a21e718a5b5c41401 ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
returns True if N <=0.
") IsCNu;
		bool IsCNu(const int N);

		/****** ShapeExtend_CompositeSurface::IsCNv ******/
		/****** md5 signature: 3b3be48e3062f448d523572dfc48fb76 ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
returns True if N <=0.
") IsCNv;
		bool IsCNv(const int N);

		/****** ShapeExtend_CompositeSurface::IsUClosed ******/
		/****** md5 signature: 91c191879c9b39e0c4f123772c17dbd2 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if grid is closed in U direction (i.e. connected with Precision::Confusion).
") IsUClosed;
		bool IsUClosed();

		/****** ShapeExtend_CompositeSurface::IsUPeriodic ******/
		/****** md5 signature: 7236661160e2b4989ea98f769e60fafb ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** ShapeExtend_CompositeSurface::IsVClosed ******/
		/****** md5 signature: b42d07343ce292533f9bd94d419cf3f6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if grid is closed in V direction (i.e. connected with Precision::Confusion).
") IsVClosed;
		bool IsVClosed();

		/****** ShapeExtend_CompositeSurface::IsVPeriodic ******/
		/****** md5 signature: 0654a6d88753f46bfbed67995e913efa ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** ShapeExtend_CompositeSurface::LocalToGlobal ******/
		/****** md5 signature: 492ea1b9c382b8ec795dd1b97ccc73aa ******/
		%feature("compactdefaultargs") LocalToGlobal;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
uv: gp_Pnt2d

Return
-------
gp_Pnt2d

Description
-----------
Converts local parameters uv on patch i,j to global parameters UV.
") LocalToGlobal;
		gp_Pnt2d LocalToGlobal(const int i, const int j, const gp_Pnt2d & uv);

		/****** ShapeExtend_CompositeSurface::LocateUParameter ******/
		/****** md5 signature: 18d31a983ca66975941742d102ff0f83 ******/
		%feature("compactdefaultargs") LocateUParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
int

Description
-----------
Returns number of col that contains given (global) parameter.
") LocateUParameter;
		int LocateUParameter(const double U);

		/****** ShapeExtend_CompositeSurface::LocateUVPoint ******/
		/****** md5 signature: 77f97f902cc74fd932999ada902a1da4 ******/
		%feature("compactdefaultargs") LocateUVPoint;
		%feature("autodoc", "
Parameters
----------
pnt: gp_Pnt2d

Return
-------
i: int
j: int

Description
-----------
Returns number of row and col of surface that contains given point.
") LocateUVPoint;
		void LocateUVPoint(const gp_Pnt2d & pnt, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** ShapeExtend_CompositeSurface::LocateVParameter ******/
		/****** md5 signature: c2eabe06a821ea813cdb93da91a2a245 ******/
		%feature("compactdefaultargs") LocateVParameter;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
int

Description
-----------
Returns number of row that contains given (global) parameter.
") LocateVParameter;
		int LocateVParameter(const double V);

		/****** ShapeExtend_CompositeSurface::NbUPatches ******/
		/****** md5 signature: c3277061f278847e336ea5563aab05a0 ******/
		%feature("compactdefaultargs") NbUPatches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of patches in U direction.
") NbUPatches;
		int NbUPatches();

		/****** ShapeExtend_CompositeSurface::NbVPatches ******/
		/****** md5 signature: 32d47250a5cb3e96bb06b22d6dd9800e ******/
		%feature("compactdefaultargs") NbVPatches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of patches in V direction.
") NbVPatches;
		int NbVPatches();

		/****** ShapeExtend_CompositeSurface::Patch ******/
		/****** md5 signature: 8deb40c5cf5fe19650011f9765333963 ******/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "
Parameters
----------
i: int
j: int

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns one surface patch.
") Patch;
		const opencascade::handle<Geom_Surface> & Patch(const int i, const int j);

		/****** ShapeExtend_CompositeSurface::Patch ******/
		/****** md5 signature: 37392bd50678e2d98ddf742f1a28f883 ******/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns one surface patch that contains given (global) parameters.
") Patch;
		const opencascade::handle<Geom_Surface> & Patch(const double U, const double V);

		/****** ShapeExtend_CompositeSurface::Patch ******/
		/****** md5 signature: 9cc716a3abfc8ff89d7ba49df9c2bd7b ******/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "
Parameters
----------
pnt: gp_Pnt2d

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns one surface patch that contains given point.
") Patch;
		const opencascade::handle<Geom_Surface> & Patch(const gp_Pnt2d & pnt);

		/****** ShapeExtend_CompositeSurface::Patches ******/
		/****** md5 signature: 505726c2472c4cd2a2a255c2621b8fcb ******/
		%feature("compactdefaultargs") Patches;
		%feature("autodoc", "Return
-------
opencascade::handle<TColGeom_HArray2OfSurface>

Description
-----------
Returns grid of surfaces.
") Patches;
		const opencascade::handle<TColGeom_HArray2OfSurface> & Patches();

		/****** ShapeExtend_CompositeSurface::SetUFirstValue ******/
		/****** md5 signature: 522f4549b8a3e03f18102cec4540debe ******/
		%feature("compactdefaultargs") SetUFirstValue;
		%feature("autodoc", "
Parameters
----------
UFirst: double

Return
-------
None

Description
-----------
Changes starting value for global U parametrisation (all other joint values are shifted accordingly).
") SetUFirstValue;
		void SetUFirstValue(const double UFirst);

		/****** ShapeExtend_CompositeSurface::SetUJointValues ******/
		/****** md5 signature: 10e1f2465be3ebc3bbb3da21834bf07c ******/
		%feature("compactdefaultargs") SetUJointValues;
		%feature("autodoc", "
Parameters
----------
UJoints: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Sets the array of U values corresponding to joint points, which define global parametrisation of the surface. Number of values in array should be equal to NbUPatches()+1. All the values should be sorted in increasing order. If this is not satisfied, does nothing and returns False.
") SetUJointValues;
		bool SetUJointValues(const TColStd_Array1OfReal & UJoints);

		/****** ShapeExtend_CompositeSurface::SetVFirstValue ******/
		/****** md5 signature: 8e52e7654ebabe5b752c5aead6871a81 ******/
		%feature("compactdefaultargs") SetVFirstValue;
		%feature("autodoc", "
Parameters
----------
VFirst: double

Return
-------
None

Description
-----------
Changes starting value for global V parametrisation (all other joint values are shifted accordingly).
") SetVFirstValue;
		void SetVFirstValue(const double VFirst);

		/****** ShapeExtend_CompositeSurface::SetVJointValues ******/
		/****** md5 signature: 5fe7aed00af612c8c13be16c279bf3ea ******/
		%feature("compactdefaultargs") SetVJointValues;
		%feature("autodoc", "
Parameters
----------
VJoints: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Sets the array of V values corresponding to joint points, which define global parametrisation of the surface Number of values in array should be equal to NbVPatches()+1. All the values should be sorted in increasing order. If this is not satisfied, does nothing and returns False.
") SetVJointValues;
		bool SetVJointValues(const TColStd_Array1OfReal & VJoints);

		/****** ShapeExtend_CompositeSurface::Transform ******/
		/****** md5 signature: 439ee2b24a3348dae5069270ca07eb56 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Applies transformation to all the patches.
") Transform;
		void Transform(const gp_Trsf & T);

		/****** ShapeExtend_CompositeSurface::UGlobalToLocal ******/
		/****** md5 signature: 7a8900be6fb31279a975befea953b4ac ******/
		%feature("compactdefaultargs") UGlobalToLocal;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
U: double

Return
-------
double

Description
-----------
Converts global parameter U to local parameter u on patch i,j.
") UGlobalToLocal;
		double UGlobalToLocal(const int i, const int j, const double U);

		/****** ShapeExtend_CompositeSurface::UIso ******/
		/****** md5 signature: d8a57b487d7cd48cf38f0c957e3249cf ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
NOT IMPLEMENTED (returns Null curve).
") UIso;
		opencascade::handle<Geom_Curve> UIso(const double U);

		/****** ShapeExtend_CompositeSurface::UJointValue ******/
		/****** md5 signature: 49d64e544679b81eeb06fb56525e57e0 ******/
		%feature("compactdefaultargs") UJointValue;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
double

Description
-----------
Returns i-th joint value in U direction (1-st is global Umin, (NbUPatches()+1)-th is global Umax on the composite surface).
") UJointValue;
		double UJointValue(const int i);

		/****** ShapeExtend_CompositeSurface::UJointValues ******/
		/****** md5 signature: d67157b455aaa75440fa200996a21e00 ******/
		%feature("compactdefaultargs") UJointValues;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the array of U values corresponding to joint points between patches as well as to start and end points, which define global parametrisation of the surface.
") UJointValues;
		opencascade::handle<TColStd_HArray1OfReal> UJointValues();

		/****** ShapeExtend_CompositeSurface::ULocalToGlobal ******/
		/****** md5 signature: 572b4ae20d1d5eda56ad76410e2ffc55 ******/
		%feature("compactdefaultargs") ULocalToGlobal;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
u: double

Return
-------
double

Description
-----------
Converts local parameter u on patch i,j to global parameter U.
") ULocalToGlobal;
		double ULocalToGlobal(const int i, const int j, const double u);

		/****** ShapeExtend_CompositeSurface::UReverse ******/
		/****** md5 signature: a985506a01d4ef5da425c5f8327a341d ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
NOT IMPLEMENTED (does nothing).
") UReverse;
		void UReverse();

		/****** ShapeExtend_CompositeSurface::UReversedParameter ******/
		/****** md5 signature: 05e3d33e6c2ca68b5a0e18b9bb568fd7 ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns U.
") UReversedParameter;
		double UReversedParameter(const double U);

		/****** ShapeExtend_CompositeSurface::VGlobalToLocal ******/
		/****** md5 signature: b8ddfdf8faa0f06ecebdae40bfc4cfca ******/
		%feature("compactdefaultargs") VGlobalToLocal;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
V: double

Return
-------
double

Description
-----------
Converts global parameter V to local parameter v on patch i,j.
") VGlobalToLocal;
		double VGlobalToLocal(const int i, const int j, const double V);

		/****** ShapeExtend_CompositeSurface::VIso ******/
		/****** md5 signature: 3b15e0839a90a1a188d31a753e205519 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
NOT IMPLEMENTED (returns Null curve).
") VIso;
		opencascade::handle<Geom_Curve> VIso(const double V);

		/****** ShapeExtend_CompositeSurface::VJointValue ******/
		/****** md5 signature: e1c3c172ea03bcbe15455574fc0cc697 ******/
		%feature("compactdefaultargs") VJointValue;
		%feature("autodoc", "
Parameters
----------
j: int

Return
-------
double

Description
-----------
Returns j-th joint value in V direction (1-st is global Vmin, (NbVPatches()+1)-th is global Vmax on the composite surface).
") VJointValue;
		double VJointValue(const int j);

		/****** ShapeExtend_CompositeSurface::VJointValues ******/
		/****** md5 signature: 9df0c7bd17e85598b3fc8229522b3837 ******/
		%feature("compactdefaultargs") VJointValues;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the array of V values corresponding to joint points between patches as well as to start and end points, which define global parametrisation of the surface.
") VJointValues;
		opencascade::handle<TColStd_HArray1OfReal> VJointValues();

		/****** ShapeExtend_CompositeSurface::VLocalToGlobal ******/
		/****** md5 signature: 664be8f707c0c526bd402efb49c46757 ******/
		%feature("compactdefaultargs") VLocalToGlobal;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
v: double

Return
-------
double

Description
-----------
Converts local parameter v on patch i,j to global parameter V.
") VLocalToGlobal;
		double VLocalToGlobal(const int i, const int j, const double v);

		/****** ShapeExtend_CompositeSurface::VReverse ******/
		/****** md5 signature: f0b1c2d85d545f70e432fc3c0f035672 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
NOT IMPLEMENTED (does nothing).
") VReverse;
		void VReverse();

		/****** ShapeExtend_CompositeSurface::VReversedParameter ******/
		/****** md5 signature: 9f09cbdc0d05c88de49b614a8ac2ef58 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
double

Description
-----------
Returns V.
") VReversedParameter;
		double VReversedParameter(const double V);

		/****** ShapeExtend_CompositeSurface::Value ******/
		/****** md5 signature: 7c51fb21324189a4350d8fed0a35c374 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
pnt: gp_Pnt2d

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter pnt on the grid.
") Value;
		gp_Pnt Value(const gp_Pnt2d & pnt);

};


%make_alias(ShapeExtend_CompositeSurface)

%extend ShapeExtend_CompositeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ShapeExtend_Explorer *
*****************************/
class ShapeExtend_Explorer {
	public:
		/****** ShapeExtend_Explorer::ShapeExtend_Explorer ******/
		/****** md5 signature: 011a50753a9f4a160039dcdcf83c3214 ******/
		%feature("compactdefaultargs") ShapeExtend_Explorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an object Explorer.
") ShapeExtend_Explorer;
		 ShapeExtend_Explorer();

		/****** ShapeExtend_Explorer::CompoundFromSeq ******/
		/****** md5 signature: 27a84130a2840f58777945acde23bdfd ******/
		%feature("compactdefaultargs") CompoundFromSeq;
		%feature("autodoc", "
Parameters
----------
seqval: TopTools_HSequenceOfShape

Return
-------
TopoDS_Shape

Description
-----------
Converts a sequence of Shapes to a Compound.
") CompoundFromSeq;
		TopoDS_Shape CompoundFromSeq(const opencascade::handle<TopTools_HSequenceOfShape> & seqval);

		/****** ShapeExtend_Explorer::DispatchList ******/
		/****** md5 signature: c4657ae48c42ba30c7b31defa2dfb5dc ******/
		%feature("compactdefaultargs") DispatchList;
		%feature("autodoc", "
Parameters
----------
list: TopTools_HSequenceOfShape
vertices: TopTools_HSequenceOfShape
edges: TopTools_HSequenceOfShape
wires: TopTools_HSequenceOfShape
faces: TopTools_HSequenceOfShape
shells: TopTools_HSequenceOfShape
solids: TopTools_HSequenceOfShape
compsols: TopTools_HSequenceOfShape
compounds: TopTools_HSequenceOfShape

Return
-------
None

Description
-----------
Dispatches starting list of shapes according to their type, to the appropriate resulting lists For each of these lists, if it is null, it is firstly created else, new items are appended to the already existing ones.
") DispatchList;
		void DispatchList(const opencascade::handle<TopTools_HSequenceOfShape> & list, opencascade::handle<TopTools_HSequenceOfShape> & vertices, opencascade::handle<TopTools_HSequenceOfShape> & edges, opencascade::handle<TopTools_HSequenceOfShape> & wires, opencascade::handle<TopTools_HSequenceOfShape> & faces, opencascade::handle<TopTools_HSequenceOfShape> & shells, opencascade::handle<TopTools_HSequenceOfShape> & solids, opencascade::handle<TopTools_HSequenceOfShape> & compsols, opencascade::handle<TopTools_HSequenceOfShape> & compounds);

		/****** ShapeExtend_Explorer::ListFromSeq ******/
		/****** md5 signature: a757258b68896377eb3515b65eeef68a ******/
		%feature("compactdefaultargs") ListFromSeq;
		%feature("autodoc", "
Parameters
----------
seqval: TopTools_HSequenceOfShape
lisval: TopTools_ListOfShape
clear: bool (optional, default to true)

Return
-------
None

Description
-----------
Converts a Sequence of Shapes to a List of Shapes <clear> if True (D), commands the list to start from scratch else, the list is cumulated.
") ListFromSeq;
		void ListFromSeq(const opencascade::handle<TopTools_HSequenceOfShape> & seqval, TopTools_ListOfShape & lisval, const bool clear = true);

		/****** ShapeExtend_Explorer::SeqFromCompound ******/
		/****** md5 signature: d9612d42e9f053876f56e66a70bf528a ******/
		%feature("compactdefaultargs") SeqFromCompound;
		%feature("autodoc", "
Parameters
----------
comp: TopoDS_Shape
expcomp: bool

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Converts a Compound to a list of Shapes if <comp> is not a compound, the list contains only <comp> if <comp> is Null, the list is empty if <comp> is a Compound, its sub-shapes are put into the list then if <expcomp> is True, if a sub-shape is a Compound, it is not put to the list but its sub-shapes are (recursive).
") SeqFromCompound;
		opencascade::handle<TopTools_HSequenceOfShape> SeqFromCompound(const TopoDS_Shape & comp, const bool expcomp);

		/****** ShapeExtend_Explorer::SeqFromList ******/
		/****** md5 signature: 2bad836dc7e00bdf51d9b9b3cdccc627 ******/
		%feature("compactdefaultargs") SeqFromList;
		%feature("autodoc", "
Parameters
----------
lisval: TopTools_ListOfShape

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Converts a List of Shapes to a Sequence of Shapes.
") SeqFromList;
		opencascade::handle<TopTools_HSequenceOfShape> SeqFromList(const TopTools_ListOfShape & lisval);

		/****** ShapeExtend_Explorer::ShapeType ******/
		/****** md5 signature: b5a1f3ccc175f4568637685b40d0ed30 ******/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
compound: bool

Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns the type of a Shape: true type if <compound> is False If <compound> is True and <shape> is a Compound, iterates on its items. If all are of the same type, returns this type. Else, returns COMPOUND. If it is empty, returns SHAPE For a Null Shape, returns SHAPE.
") ShapeType;
		TopAbs_ShapeEnum ShapeType(const TopoDS_Shape & shape, const bool compound);

		/****** ShapeExtend_Explorer::SortedCompound ******/
		/****** md5 signature: 47ef4a3fddd5fa7c9493ab75d99d42c2 ******/
		%feature("compactdefaultargs") SortedCompound;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
type: TopAbs_ShapeEnum
explore: bool
compound: bool

Return
-------
TopoDS_Shape

Description
-----------
Builds a COMPOUND from the given shape. It explores the shape level by level, according to the <explore> argument. If <explore> is False, only COMPOUND items are explored, else all items are. The following shapes are added to resulting compound: - shapes which comply to <type> - if <type> is WIRE, considers also free edges (and makes wires) - if <type> is SHELL, considers also free faces (and makes shells) If <compound> is True, gathers items in compounds which correspond to starting COMPOUND,SOLID or SHELL containers, or items directly contained in a Compound.
") SortedCompound;
		TopoDS_Shape SortedCompound(const TopoDS_Shape & shape, const TopAbs_ShapeEnum type, const bool explore, const bool compound);

};


%extend ShapeExtend_Explorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ShapeExtend_WireData *
*****************************/
class ShapeExtend_WireData : public Standard_Transient {
	public:
		/****** ShapeExtend_WireData::ShapeExtend_WireData ******/
		/****** md5 signature: 0f3d35aa8708df5a24ccc4e7d7301935 ******/
		%feature("compactdefaultargs") ShapeExtend_WireData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor, creates empty wire with no edges.
") ShapeExtend_WireData;
		 ShapeExtend_WireData();

		/****** ShapeExtend_WireData::ShapeExtend_WireData ******/
		/****** md5 signature: dd53bd52e76409ed4d93a61e704f40d9 ******/
		%feature("compactdefaultargs") ShapeExtend_WireData;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
chained: bool (optional, default to true)
theManifoldMode: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructor initializing the data from TopoDS_Wire. Calls Init(wire,chained).
") ShapeExtend_WireData;
		 ShapeExtend_WireData(const TopoDS_Wire & wire, const bool chained = true, const bool theManifoldMode = true);

		/****** ShapeExtend_WireData::Add ******/
		/****** md5 signature: 331da52d15cf20e4535395d7b41c22cf ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
atnum: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds an edge to a wire, being defined (not yet ended) This is the plain, basic, function to add an edge <num> = 0 (D): Appends at end <num> = 1: Preprends at start else, Insert before <num> Remark: Null Edge is simply ignored.
") Add;
		void Add(const TopoDS_Edge & edge, const int atnum = 0);

		/****** ShapeExtend_WireData::Add ******/
		/****** md5 signature: cd4d7b1b99f586aae43d1c93fedd7fb8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
atnum: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds an entire wire, considered as a list of edges Remark: The wire is assumed to be ordered (TopoDS_Iterator is used).
") Add;
		void Add(const TopoDS_Wire & wire, const int atnum = 0);

		/****** ShapeExtend_WireData::Add ******/
		/****** md5 signature: f6d37f9ad1d062b2092ecf84bae42391 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
wire: ShapeExtend_WireData
atnum: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds a wire in the form of WireData.
") Add;
		void Add(const opencascade::handle<ShapeExtend_WireData> & wire, const int atnum = 0);

		/****** ShapeExtend_WireData::Add ******/
		/****** md5 signature: 4cb1d5d596e3aeb447d2d5eeb63ac6e3 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
atnum: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds an edge or a wire invoking corresponding method Add.
") Add;
		void Add(const TopoDS_Shape & shape, const int atnum = 0);

		/****** ShapeExtend_WireData::AddOriented ******/
		/****** md5 signature: 764ba560549724a8bbff83c7917fdeb2 ******/
		%feature("compactdefaultargs") AddOriented;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
mode: int

Return
-------
None

Description
-----------
Adds an edge to start or end of <self>, according to <mode> 0: at end, as direct 1: at end, as reversed 2: at start, as direct 3: at start, as reversed < 0: no adding.
") AddOriented;
		void AddOriented(const TopoDS_Edge & edge, const int mode);

		/****** ShapeExtend_WireData::AddOriented ******/
		/****** md5 signature: 601c6cd94d91c4d12f30c253bf65c78b ******/
		%feature("compactdefaultargs") AddOriented;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
mode: int

Return
-------
None

Description
-----------
Adds a wire to start or end of <self>, according to <mode> 0: at end, as direct 1: at end, as reversed 2: at start, as direct 3: at start, as reversed < 0: no adding.
") AddOriented;
		void AddOriented(const TopoDS_Wire & wire, const int mode);

		/****** ShapeExtend_WireData::AddOriented ******/
		/****** md5 signature: 36616f045342ad747abf45e44d96c378 ******/
		%feature("compactdefaultargs") AddOriented;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
mode: int

Return
-------
None

Description
-----------
Adds an edge or a wire invoking corresponding method AddOriented.
") AddOriented;
		void AddOriented(const TopoDS_Shape & shape, const int mode);

		/****** ShapeExtend_WireData::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears data about Wire.
") Clear;
		void Clear();

		/****** ShapeExtend_WireData::ComputeSeams ******/
		/****** md5 signature: 7422f87bd26fef4942de66c6c20678ca ******/
		%feature("compactdefaultargs") ComputeSeams;
		%feature("autodoc", "
Parameters
----------
enforce: bool (optional, default to true)

Return
-------
None

Description
-----------
Computes the list of seam edges By default (direct call), computing is enforced For indirect call (from IsSeam) it is redone only if not yet already done or if the list of edges has changed Remark: A Seam Edge is an Edge present twice in the list, once as FORWARD and once as REVERSED Each sense has its own PCurve, the one for FORWARD must be set in first.
") ComputeSeams;
		void ComputeSeams(const bool enforce = true);

		/****** ShapeExtend_WireData::Edge ******/
		/****** md5 signature: 94efb4c91a253aa8f1ccf8b1009cbb01 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Edge

Description
-----------
Returns <num>th Edge.
") Edge;
		TopoDS_Edge Edge(const int num);

		/****** ShapeExtend_WireData::Index ******/
		/****** md5 signature: b3faa1c2f5264fa64e373723c6009b46 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
int

Description
-----------
Returns the index of the edge If the edge is a seam the orientation is also checked Returns 0 if the edge is not found in the list.
") Index;
		int Index(const TopoDS_Edge & edge);

		/****** ShapeExtend_WireData::Init ******/
		/****** md5 signature: 70e65a481c83a045eaf89a13ad75120d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
other: ShapeExtend_WireData

Return
-------
None

Description
-----------
Copies data from another WireData.
") Init;
		void Init(const opencascade::handle<ShapeExtend_WireData> & other);

		/****** ShapeExtend_WireData::Init ******/
		/****** md5 signature: 054cdb57a82030c3b451b1d169830d53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
chained: bool (optional, default to true)
theManifoldMode: bool (optional, default to true)

Return
-------
bool

Description
-----------
Loads an already existing wire If <chained> is True (default), edges are added in the sequence as they are explored by TopoDS_Iterator Else, if <chained> is False, wire is explored by BRepTools_WireExplorer and it is guaranteed that edges will be sequentially connected. Remark: In the latter case it can happen that not all edges will be found (because of limitations of BRepTools_WireExplorer for disconnected wires and wires with seam edges).
") Init;
		bool Init(const TopoDS_Wire & wire, const bool chained = true, const bool theManifoldMode = true);

		/****** ShapeExtend_WireData::IsSeam ******/
		/****** md5 signature: 04bd6a1201c377992dd77ea41a15e625 ******/
		%feature("compactdefaultargs") IsSeam;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Tells if an Edge is seam (see ComputeSeams) An edge is considered as seam if it presents twice in the edge list, once as FORWARD and once as REVERSED.
") IsSeam;
		bool IsSeam(const int num);

		/****** ShapeExtend_WireData::ManifoldMode ******/
		/****** md5 signature: be26413551533594d9cb7ddaaa0c917d ******/
		%feature("compactdefaultargs") ManifoldMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns mode defining manifold wire data or not. If manifold that nonmanifold edges will not be not consider during operations(previous behaviour) and they will be added only in result wire else non-manifold edges will consider during operations.
") ManifoldMode;
		bool & ManifoldMode();

		/****** ShapeExtend_WireData::NbEdges ******/
		/****** md5 signature: f741965989565caaff095f09d2955db8 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of currently recorded edges.
") NbEdges;
		int NbEdges();

		/****** ShapeExtend_WireData::NbNonManifoldEdges ******/
		/****** md5 signature: 5be4c6934c553eb20618177d0726db22 ******/
		%feature("compactdefaultargs") NbNonManifoldEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of currently recorded non-manifold edges.
") NbNonManifoldEdges;
		int NbNonManifoldEdges();

		/****** ShapeExtend_WireData::NonmanifoldEdge ******/
		/****** md5 signature: 9d3cda627b738ee7b9dfbf6d8ecffa40 ******/
		%feature("compactdefaultargs") NonmanifoldEdge;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Edge

Description
-----------
Returns <num>th nonmanifold Edge.
") NonmanifoldEdge;
		TopoDS_Edge NonmanifoldEdge(const int num);

		/****** ShapeExtend_WireData::NonmanifoldEdges ******/
		/****** md5 signature: e0bea35e428b94b7ed0f51d26c242581 ******/
		%feature("compactdefaultargs") NonmanifoldEdges;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Returns sequence of non-manifold edges This sequence can be not empty if wire data set in manifold mode but initial wire has INTERNAL orientation or contains INTERNAL edges.
") NonmanifoldEdges;
		opencascade::handle<TopTools_HSequenceOfShape> NonmanifoldEdges();

		/****** ShapeExtend_WireData::Remove ******/
		/****** md5 signature: d828786471a07b9ccd2a3c10e346fa07 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)

Return
-------
None

Description
-----------
Removes an Edge, given its rank. By default removes the last edge.
") Remove;
		void Remove(const int num = 0);

		/****** ShapeExtend_WireData::Reverse ******/
		/****** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the sense of the list and the orientation of each Edge This method should be called when either wire has no seam edges or face is not available.
") Reverse;
		void Reverse();

		/****** ShapeExtend_WireData::Reverse ******/
		/****** md5 signature: c2cddd93d9896d16ec3f067612e7d12d ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
face: TopoDS_Face

Return
-------
None

Description
-----------
Reverses the sense of the list and the orientation of each Edge The face is necessary for swapping pcurves for seam edges (first pcurve corresponds to orientation FORWARD, and second to REVERSED; when edge is reversed, pcurves must be swapped) If face is NULL, no swapping is performed.
") Reverse;
		void Reverse(const TopoDS_Face & face);

		/****** ShapeExtend_WireData::Set ******/
		/****** md5 signature: 635118c4ddb11282602dc016dccba634 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
num: int (optional, default to 0)

Return
-------
None

Description
-----------
Replaces an edge at the given rank number <num> with new one. Default is last edge (<num> = 0).
") Set;
		void Set(const TopoDS_Edge & edge, const int num = 0);

		/****** ShapeExtend_WireData::SetDegeneratedLast ******/
		/****** md5 signature: 0041ff783654edafc0b6489d08204a08 ******/
		%feature("compactdefaultargs") SetDegeneratedLast;
		%feature("autodoc", "Return
-------
None

Description
-----------
When the wire contains at least one degenerated edge, sets it as last one Note: It is useful to process pcurves, for instance, while the pcurve of a DGNR may not be computed from its 3D part (there is none) it is computed after the other edges have been computed and chained.
") SetDegeneratedLast;
		void SetDegeneratedLast();

		/****** ShapeExtend_WireData::SetLast ******/
		/****** md5 signature: cdf86cd3f43d75d1e2177ea56b0012ac ******/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Does a circular permutation in order to set <num>th edge last.
") SetLast;
		void SetLast(const int num);

		/****** ShapeExtend_WireData::Wire ******/
		/****** md5 signature: 2fe6e5f402158cff91e9020fddff92e6 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Makes TopoDS_Wire using BRep_Builder (just creates the TopoDS_Wire object and adds all edges into it). This method should be called when the wire is correct (for example, after successful fixes by ShapeFix_Wire) and adjacent edges share common vertices. In case if adjacent edges do not share the same vertices the resulting TopoDS_Wire will be invalid.
") Wire;
		TopoDS_Wire Wire();

		/****** ShapeExtend_WireData::WireAPIMake ******/
		/****** md5 signature: ee7817a9b0126700bae42396160d62de ******/
		%feature("compactdefaultargs") WireAPIMake;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Makes TopoDS_Wire using BRepAPI_MakeWire. Class BRepAPI_MakeWire merges geometrically coincided vertices and can disturb correct order of edges in the wire. If this class fails, null shape is returned.
") WireAPIMake;
		TopoDS_Wire WireAPIMake();

		%extend{
			bool GetManifoldMode() { return self->ManifoldMode(); }
			void SetManifoldMode(bool value) { self->ManifoldMode() = value; }
		};
};


%make_alias(ShapeExtend_WireData)

%extend ShapeExtend_WireData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class ShapeExtend_MsgRegistrator *
***********************************/
class ShapeExtend_MsgRegistrator : public ShapeExtend_BasicMsgRegistrator {
	public:
		/****** ShapeExtend_MsgRegistrator::ShapeExtend_MsgRegistrator ******/
		/****** md5 signature: aaa4e55dda15b703b6b65b5a1ea58167 ******/
		%feature("compactdefaultargs") ShapeExtend_MsgRegistrator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an object.
") ShapeExtend_MsgRegistrator;
		 ShapeExtend_MsgRegistrator();

		/****** ShapeExtend_MsgRegistrator::MapShape ******/
		/****** md5 signature: 9b44b13412a9b601d30afb914f211d8a ******/
		%feature("compactdefaultargs") MapShape;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TopoDS_Shape, NCollection_List<Message_Msg>, TopTools_ShapeMapHasher>

Description
-----------
Returns a Map of shapes and message list.
") MapShape;
		const NCollection_DataMap<TopoDS_Shape, NCollection_List<Message_Msg>, TopTools_ShapeMapHasher> MapShape();

		/****** ShapeExtend_MsgRegistrator::MapTransient ******/
		/****** md5 signature: 8011bc2c05e1d084c7c29a468a1320db ******/
		%feature("compactdefaultargs") MapTransient;
		%feature("autodoc", "Return
-------
NCollection_DataMap<opencascade::handle<Standard_Transient>, NCollection_List<Message_Msg>>

Description
-----------
Returns a Map of objects and message list.
") MapTransient;
		const NCollection_DataMap<opencascade::handle<Standard_Transient>, NCollection_List<Message_Msg>> & MapTransient();

		/****** ShapeExtend_MsgRegistrator::Send ******/
		/****** md5 signature: 5a8cee92945955fe13caf99ead33ffab ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
object: Standard_Transient
message: Message_Msg
gravity: Message_Gravity

Return
-------
None

Description
-----------
Sends a message to be attached to the object. If the object is in the map then the message is added to the list, otherwise the object is firstly added to the map.
") Send;
		void Send(const opencascade::handle<Standard_Transient> & object, const Message_Msg & message, const Message_Gravity gravity);

		/****** ShapeExtend_MsgRegistrator::Send ******/
		/****** md5 signature: b82b6f33ab8a4c4299d5578771c86b9d ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
message: Message_Msg
gravity: Message_Gravity

Return
-------
None

Description
-----------
Sends a message to be attached to the shape. If the shape is in the map then the message is added to the list, otherwise the shape is firstly added to the map.
") Send;
		void Send(const TopoDS_Shape & shape, const Message_Msg & message, const Message_Gravity gravity);

};


%make_alias(ShapeExtend_MsgRegistrator)

%extend ShapeExtend_MsgRegistrator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def shapeextend_DecodeStatus(*args):
	return shapeextend.DecodeStatus(*args)

@deprecated
def shapeextend_EncodeStatus(*args):
	return shapeextend.EncodeStatus(*args)

@deprecated
def shapeextend_Init(*args):
	return shapeextend.Init(*args)

}
