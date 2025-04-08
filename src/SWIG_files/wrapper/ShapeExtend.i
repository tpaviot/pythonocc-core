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
%define SHAPEEXTENDDOCSTRING
"ShapeExtend module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_shapeextend.html"
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
%template(ShapeExtend_DataMapOfShapeListOfMsg) NCollection_DataMap<TopoDS_Shape,Message_ListOfMsg,TopTools_ShapeMapHasher>;
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
		/****** md5 signature: dcd7ae9c9207387fafcd3d787644b189 ******/
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
		static Standard_Boolean DecodeStatus(const Standard_Integer flag, const ShapeExtend_Status status);

		/****** ShapeExtend::EncodeStatus ******/
		/****** md5 signature: dd82b90b3fd2f1a7647f76ea7b12ba2b ******/
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
		static Standard_Integer EncodeStatus(const ShapeExtend_Status status);

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
		/****** md5 signature: d85fe1af866a15556de6f47884b5cdff ******/
		%feature("compactdefaultargs") CheckConnectivity;
		%feature("autodoc", "
Parameters
----------
Preci: float

Return
-------
bool

Description
-----------
Checks geometrical connectivity of the curves, including closure (sets fields myClosed).
") CheckConnectivity;
		Standard_Boolean CheckConnectivity(const Standard_Real Preci);

		/****** ShapeExtend_ComplexCurve::Continuity ******/
		/****** md5 signature: f3ed9d27f993b8051d8cf116b3837e8a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_C0.
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****** ShapeExtend_ComplexCurve::Curve ******/
		/****** md5 signature: 8e6a949d985ee52fdc0a32db347f8bd4 ******/
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
		virtual const opencascade::handle<Geom_Curve> & Curve(const Standard_Integer index);

		/****** ShapeExtend_ComplexCurve::D0 ******/
		/****** md5 signature: 51907fc492adf822ddaa386ab89a6e16 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Returns point at parameter U. Finds appropriate curve and local parameter on it.
") D0;
		virtual void D0(const Standard_Real U, gp_Pnt & P);

		/****** ShapeExtend_ComplexCurve::D1 ******/
		/****** md5 signature: 3172d2da7d491678c13781d50f333062 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		virtual void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** ShapeExtend_ComplexCurve::D2 ******/
		/****** md5 signature: 2b2df3653c3200a8f34857c6e4ebfddc ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
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
		virtual void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** ShapeExtend_ComplexCurve::D3 ******/
		/****** md5 signature: ef86b793d3bf42ef2cc02a4e60cd1d4f ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
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
		virtual void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** ShapeExtend_ComplexCurve::DN ******/
		/****** md5 signature: 8b3730d9a5184b049d1fc2f5122d8644 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		virtual gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** ShapeExtend_ComplexCurve::FirstParameter ******/
		/****** md5 signature: 4764beb92499e70705c5628a20961327 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns 0.
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****** ShapeExtend_ComplexCurve::GetScaleFactor ******/
		/****** md5 signature: 98fe73645fe835ff75323eaf2264c340 ******/
		%feature("compactdefaultargs") GetScaleFactor;
		%feature("autodoc", "
Parameters
----------
ind: int

Return
-------
float

Description
-----------
Returns scale factor for recomputing of deviatives.
") GetScaleFactor;
		virtual Standard_Real GetScaleFactor(const Standard_Integer ind);

		/****** ShapeExtend_ComplexCurve::IsCN ******/
		/****** md5 signature: 3c52d0a06cd90d9afee28536901289df ******/
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
		virtual Standard_Boolean IsCN(const Standard_Integer N);

		/****** ShapeExtend_ComplexCurve::IsClosed ******/
		/****** md5 signature: ee5341b93937df820c1211eb1ee92b91 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is closed.
") IsClosed;
		virtual Standard_Boolean IsClosed();

		/****** ShapeExtend_ComplexCurve::IsPeriodic ******/
		/****** md5 signature: 13a0a38f32e22e8a1ec5aa34cbf9bbea ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****** ShapeExtend_ComplexCurve::LastParameter ******/
		/****** md5 signature: 51650ab8b3afb0a24f930d23afae31ca ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns 1.
") LastParameter;
		virtual Standard_Real LastParameter();

		/****** ShapeExtend_ComplexCurve::LocalToGlobal ******/
		/****** md5 signature: 2e6dc5480ad6062633f20d7a31bf672c ******/
		%feature("compactdefaultargs") LocalToGlobal;
		%feature("autodoc", "
Parameters
----------
index: int
Ulocal: float

Return
-------
float

Description
-----------
Returns global parameter for the whole curve according to the segment and local parameter on it.
") LocalToGlobal;
		virtual Standard_Real LocalToGlobal(const Standard_Integer index, const Standard_Real Ulocal);

		/****** ShapeExtend_ComplexCurve::LocateParameter ******/
		/****** md5 signature: d22703cefaed9211fcf1e8faf34f4f2c ******/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
UOut: float

Description
-----------
Returns number of the curve for the given parameter U and local parameter UOut for the found curve.
") LocateParameter;
		virtual Standard_Integer LocateParameter(const Standard_Real U, Standard_Real &OutValue);

		/****** ShapeExtend_ComplexCurve::NbCurves ******/
		/****** md5 signature: 00c615638a5abc467ec2c383544c5cf8 ******/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of curves.
") NbCurves;
		virtual Standard_Integer NbCurves();

		/****** ShapeExtend_ComplexCurve::ReversedParameter ******/
		/****** md5 signature: ba3bf42dda8156e076845171024e85fe ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns 1 - U.
") ReversedParameter;
		virtual Standard_Real ReversedParameter(const Standard_Real U);

		/****** ShapeExtend_ComplexCurve::Transform ******/
		/****** md5 signature: 2de73a9941c00fb14731ec58602530d0 ******/
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
		virtual void Transform(const gp_Trsf & T);

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
		/****** md5 signature: 8c96b9d739e44d535b2912dd9708a855 ******/
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
		 ShapeExtend_CompositeSurface(const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf, const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****** ShapeExtend_CompositeSurface::ShapeExtend_CompositeSurface ******/
		/****** md5 signature: 20016c74871e6504488c039f12e5b0c4 ******/
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
		 ShapeExtend_CompositeSurface(const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf, const TColStd_Array1OfReal & UJoints, const TColStd_Array1OfReal & VJoints);

		/****** ShapeExtend_CompositeSurface::Bounds ******/
		/****** md5 signature: 014e2123fd08667005a3b193c7391727 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds of grid.
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeExtend_CompositeSurface::CheckConnectivity ******/
		/****** md5 signature: 90bd67b493222d1086d791909b03b08d ******/
		%feature("compactdefaultargs") CheckConnectivity;
		%feature("autodoc", "
Parameters
----------
prec: float

Return
-------
bool

Description
-----------
Checks geometrical connectivity of the patches, including closedness (sets fields muUClosed and myVClosed).
") CheckConnectivity;
		Standard_Boolean CheckConnectivity(const Standard_Real prec);

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
		/****** md5 signature: f3ed9d27f993b8051d8cf116b3837e8a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
returns C0.
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****** ShapeExtend_CompositeSurface::Copy ******/
		/****** md5 signature: cdab0a14009498bcf8d5047a3b653fd4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
Returns a copy of the surface.
") Copy;
		virtual opencascade::handle<Geom_Geometry> Copy();

		/****** ShapeExtend_CompositeSurface::D0 ******/
		/****** md5 signature: d703743b1060efe5f30e6bb795ec7841 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U,V on the grid.
") D0;
		virtual void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** ShapeExtend_CompositeSurface::D1 ******/
		/****** md5 signature: 040f0ebc2e2ebafab4ec5391c35a1846 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the point P and the first derivatives in the directions U and V at this point.
") D1;
		virtual void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** ShapeExtend_CompositeSurface::D2 ******/
		/****** md5 signature: b8114c7d18571779e326d7acd07d497d ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Return
-------
None

Description
-----------
Computes the point P, the first and the second derivatives in the directions U and V at this point.
") D2;
		virtual void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** ShapeExtend_CompositeSurface::D3 ******/
		/****** md5 signature: 2fcde2cdd09932f1564ea57c5e638207 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Return
-------
None

Description
-----------
Computes the point P, the first,the second and the third derivatives in the directions U and V at this point.
") D3;
		virtual void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** ShapeExtend_CompositeSurface::DN ******/
		/****** md5 signature: c8d8a3dca502cf9791f67c765422b492 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V).
") DN;
		virtual gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****** ShapeExtend_CompositeSurface::GlobalToLocal ******/
		/****** md5 signature: 6030bdda51b0128dabdaf3900daca82f ******/
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
		gp_Pnt2d GlobalToLocal(const Standard_Integer i, const Standard_Integer j, const gp_Pnt2d & UV);

		/****** ShapeExtend_CompositeSurface::GlobalToLocalTransformation ******/
		/****** md5 signature: ed3b70490066b28c3fe080b72afd6ee2 ******/
		%feature("compactdefaultargs") GlobalToLocalTransformation;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
Trsf: gp_Trsf2d

Return
-------
uFact: float

Description
-----------
Computes transformation operator and uFactor descrinbing affine transformation required to convert global parameters on composite surface to local parameters on patch (i,j): uv = ( uFactor, 1. ) X Trsf * UV; NOTE: Thus Trsf contains shift and scale by V, scale by U is stored in uFact. Returns True if transformation is not an identity.
") GlobalToLocalTransformation;
		Standard_Boolean GlobalToLocalTransformation(const Standard_Integer i, const Standard_Integer j, Standard_Real &OutValue, gp_Trsf2d & Trsf);

		/****** ShapeExtend_CompositeSurface::Init ******/
		/****** md5 signature: 50a4d0a2eb9d17b1169eb618b7089a39 ******/
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
		Standard_Boolean Init(const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf, const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****** ShapeExtend_CompositeSurface::Init ******/
		/****** md5 signature: d76029a41a655e05acf78e2f267153c7 ******/
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
		Standard_Boolean Init(const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf, const TColStd_Array1OfReal & UJoints, const TColStd_Array1OfReal & VJoints);

		/****** ShapeExtend_CompositeSurface::IsCNu ******/
		/****** md5 signature: 31b03fc1d509ad0976d7467a3bd394b7 ******/
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
		virtual Standard_Boolean IsCNu(const Standard_Integer N);

		/****** ShapeExtend_CompositeSurface::IsCNv ******/
		/****** md5 signature: ae0b7938459cd292b5b4744525e5249a ******/
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
		virtual Standard_Boolean IsCNv(const Standard_Integer N);

		/****** ShapeExtend_CompositeSurface::IsUClosed ******/
		/****** md5 signature: c240e3242256b185362f31b103803abe ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if grid is closed in U direction (i.e. connected with Precision::Confusion).
") IsUClosed;
		virtual Standard_Boolean IsUClosed();

		/****** ShapeExtend_CompositeSurface::IsUPeriodic ******/
		/****** md5 signature: ee1d04d096d58c0c69971438c1aa71fc ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****** ShapeExtend_CompositeSurface::IsVClosed ******/
		/****** md5 signature: 5826a15e603eec763554a14db7394466 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if grid is closed in V direction (i.e. connected with Precision::Confusion).
") IsVClosed;
		virtual Standard_Boolean IsVClosed();

		/****** ShapeExtend_CompositeSurface::IsVPeriodic ******/
		/****** md5 signature: c62bf083eb7bc6b915c3cdeea2fc8406 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****** ShapeExtend_CompositeSurface::LocalToGlobal ******/
		/****** md5 signature: 3886cd57f7bc5e69b8f70cfb75e749db ******/
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
		gp_Pnt2d LocalToGlobal(const Standard_Integer i, const Standard_Integer j, const gp_Pnt2d & uv);

		/****** ShapeExtend_CompositeSurface::LocateUParameter ******/
		/****** md5 signature: 0e9e5ebbf05b8a9aac81a0f4ae07db7d ******/
		%feature("compactdefaultargs") LocateUParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
int

Description
-----------
Returns number of col that contains given (global) parameter.
") LocateUParameter;
		Standard_Integer LocateUParameter(const Standard_Real U);

		/****** ShapeExtend_CompositeSurface::LocateUVPoint ******/
		/****** md5 signature: e8f91d9fefe7790104c7fb51cec17207 ******/
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
		/****** md5 signature: cc621d4473cd8781007a1a4ea808d2ce ******/
		%feature("compactdefaultargs") LocateVParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
int

Description
-----------
Returns number of row that contains given (global) parameter.
") LocateVParameter;
		Standard_Integer LocateVParameter(const Standard_Real V);

		/****** ShapeExtend_CompositeSurface::NbUPatches ******/
		/****** md5 signature: 6b0ad1d8cd917ddafd65ec74fe6e89da ******/
		%feature("compactdefaultargs") NbUPatches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of patches in U direction.
") NbUPatches;
		Standard_Integer NbUPatches();

		/****** ShapeExtend_CompositeSurface::NbVPatches ******/
		/****** md5 signature: 90a9eb7fe715a81477e403cf8ccff1b9 ******/
		%feature("compactdefaultargs") NbVPatches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of patches in V direction.
") NbVPatches;
		Standard_Integer NbVPatches();

		/****** ShapeExtend_CompositeSurface::Patch ******/
		/****** md5 signature: e8398d4fc47f1bbab96955c665a17669 ******/
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
		const opencascade::handle<Geom_Surface> & Patch(const Standard_Integer i, const Standard_Integer j);

		/****** ShapeExtend_CompositeSurface::Patch ******/
		/****** md5 signature: 38a7356d10e1ea2a1e6323260e074332 ******/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns one surface patch that contains given (global) parameters.
") Patch;
		const opencascade::handle<Geom_Surface> & Patch(const Standard_Real U, const Standard_Real V);

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
		/****** md5 signature: dd509d4d087a753d8c88ea7c6932a3af ******/
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
		/****** md5 signature: c48cd2c79d36589c8fb89696f77a9e92 ******/
		%feature("compactdefaultargs") SetUFirstValue;
		%feature("autodoc", "
Parameters
----------
UFirst: float

Return
-------
None

Description
-----------
Changes starting value for global U parametrisation (all other joint values are shifted accordingly).
") SetUFirstValue;
		void SetUFirstValue(const Standard_Real UFirst);

		/****** ShapeExtend_CompositeSurface::SetUJointValues ******/
		/****** md5 signature: 5caa1f14232e408186e29bb4d42f8318 ******/
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
		Standard_Boolean SetUJointValues(const TColStd_Array1OfReal & UJoints);

		/****** ShapeExtend_CompositeSurface::SetVFirstValue ******/
		/****** md5 signature: 766cf79731af68776892a4c767ccf890 ******/
		%feature("compactdefaultargs") SetVFirstValue;
		%feature("autodoc", "
Parameters
----------
VFirst: float

Return
-------
None

Description
-----------
Changes starting value for global V parametrisation (all other joint values are shifted accordingly).
") SetVFirstValue;
		void SetVFirstValue(const Standard_Real VFirst);

		/****** ShapeExtend_CompositeSurface::SetVJointValues ******/
		/****** md5 signature: 8f783a94d54b85b9113d4504ff6739a4 ******/
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
		Standard_Boolean SetVJointValues(const TColStd_Array1OfReal & VJoints);

		/****** ShapeExtend_CompositeSurface::Transform ******/
		/****** md5 signature: 2de73a9941c00fb14731ec58602530d0 ******/
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
		virtual void Transform(const gp_Trsf & T);

		/****** ShapeExtend_CompositeSurface::UGlobalToLocal ******/
		/****** md5 signature: e38e93ba598af7f2e97366e473b49279 ******/
		%feature("compactdefaultargs") UGlobalToLocal;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
U: float

Return
-------
float

Description
-----------
Converts global parameter U to local parameter u on patch i,j.
") UGlobalToLocal;
		Standard_Real UGlobalToLocal(const Standard_Integer i, const Standard_Integer j, const Standard_Real U);

		/****** ShapeExtend_CompositeSurface::UIso ******/
		/****** md5 signature: a652d0cc6670b92301ba1f2ca72bb79a ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
NOT IMPLEMENTED (returns Null curve).
") UIso;
		virtual opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** ShapeExtend_CompositeSurface::UJointValue ******/
		/****** md5 signature: 670e002b3e58c1b2e3b5fe638fbad6d8 ******/
		%feature("compactdefaultargs") UJointValue;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
float

Description
-----------
Returns i-th joint value in U direction (1-st is global Umin, (NbUPatches()+1)-th is global Umax on the composite surface).
") UJointValue;
		Standard_Real UJointValue(const Standard_Integer i);

		/****** ShapeExtend_CompositeSurface::UJointValues ******/
		/****** md5 signature: 88cd76678e6a3978a860181ef45205d1 ******/
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
		/****** md5 signature: ac695bfa57d6979eaa1702e685fb4cc1 ******/
		%feature("compactdefaultargs") ULocalToGlobal;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
u: float

Return
-------
float

Description
-----------
Converts local parameter u on patch i,j to global parameter U.
") ULocalToGlobal;
		Standard_Real ULocalToGlobal(const Standard_Integer i, const Standard_Integer j, const Standard_Real u);

		/****** ShapeExtend_CompositeSurface::UReverse ******/
		/****** md5 signature: d70147d3bce5fe1e36771349f34ded17 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
NOT IMPLEMENTED (does nothing).
") UReverse;
		virtual void UReverse();

		/****** ShapeExtend_CompositeSurface::UReversedParameter ******/
		/****** md5 signature: 455649ad8e72cb371c0686d0e771362f ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns U.
") UReversedParameter;
		virtual Standard_Real UReversedParameter(const Standard_Real U);

		/****** ShapeExtend_CompositeSurface::VGlobalToLocal ******/
		/****** md5 signature: 5b91fe4bcdda99113c51c9cabdf5fe8e ******/
		%feature("compactdefaultargs") VGlobalToLocal;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
V: float

Return
-------
float

Description
-----------
Converts global parameter V to local parameter v on patch i,j.
") VGlobalToLocal;
		Standard_Real VGlobalToLocal(const Standard_Integer i, const Standard_Integer j, const Standard_Real V);

		/****** ShapeExtend_CompositeSurface::VIso ******/
		/****** md5 signature: 7231943ddfe038bbb071bb6696d17d04 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
NOT IMPLEMENTED (returns Null curve).
") VIso;
		virtual opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** ShapeExtend_CompositeSurface::VJointValue ******/
		/****** md5 signature: 874819d969e6449276dc3255b5bd3d26 ******/
		%feature("compactdefaultargs") VJointValue;
		%feature("autodoc", "
Parameters
----------
j: int

Return
-------
float

Description
-----------
Returns j-th joint value in V direction (1-st is global Vmin, (NbVPatches()+1)-th is global Vmax on the composite surface).
") VJointValue;
		Standard_Real VJointValue(const Standard_Integer j);

		/****** ShapeExtend_CompositeSurface::VJointValues ******/
		/****** md5 signature: 8f8c0cbddebed98ac769578d05d1ae5f ******/
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
		/****** md5 signature: cada022c7dd8796ccab060600fdc6748 ******/
		%feature("compactdefaultargs") VLocalToGlobal;
		%feature("autodoc", "
Parameters
----------
i: int
j: int
v: float

Return
-------
float

Description
-----------
Converts local parameter v on patch i,j to global parameter V.
") VLocalToGlobal;
		Standard_Real VLocalToGlobal(const Standard_Integer i, const Standard_Integer j, const Standard_Real v);

		/****** ShapeExtend_CompositeSurface::VReverse ******/
		/****** md5 signature: 60a0c07d53675378b2bcbe23d1e7e281 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
NOT IMPLEMENTED (does nothing).
") VReverse;
		virtual void VReverse();

		/****** ShapeExtend_CompositeSurface::VReversedParameter ******/
		/****** md5 signature: 511e9f30bcc67915e6946bce79705b17 ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Returns V.
") VReversedParameter;
		virtual Standard_Real VReversedParameter(const Standard_Real V);

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
		/****** md5 signature: 9c42e270bfcdddbf1929a557984f4fda ******/
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
		/****** md5 signature: 72677e95978b2702fc412b78c9d37ab8 ******/
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
		/****** md5 signature: 19b9a376fbcff81e41c6f52b68739b02 ******/
		%feature("compactdefaultargs") ListFromSeq;
		%feature("autodoc", "
Parameters
----------
seqval: TopTools_HSequenceOfShape
lisval: TopTools_ListOfShape
clear: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Converts a Sequence of Shapes to a List of Shapes <clear> if True (D), commands the list to start from scratch else, the list is cumulated.
") ListFromSeq;
		void ListFromSeq(const opencascade::handle<TopTools_HSequenceOfShape> & seqval, TopTools_ListOfShape & lisval, const Standard_Boolean clear = Standard_True);

		/****** ShapeExtend_Explorer::SeqFromCompound ******/
		/****** md5 signature: 560f0008fe1a70e46fcdb58b55e42287 ******/
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
		opencascade::handle<TopTools_HSequenceOfShape> SeqFromCompound(const TopoDS_Shape & comp, const Standard_Boolean expcomp);

		/****** ShapeExtend_Explorer::SeqFromList ******/
		/****** md5 signature: 5cfd1ced143892bb4d8f80f9a062c141 ******/
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
		/****** md5 signature: ab636bf5c0d2e486d53891e797ab3d6b ******/
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
		TopAbs_ShapeEnum ShapeType(const TopoDS_Shape & shape, const Standard_Boolean compound);

		/****** ShapeExtend_Explorer::SortedCompound ******/
		/****** md5 signature: b55d0015285d0f23fb3c68ccb5f8f79e ******/
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
		TopoDS_Shape SortedCompound(const TopoDS_Shape & shape, const TopAbs_ShapeEnum type, const Standard_Boolean explore, const Standard_Boolean compound);

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
		/****** md5 signature: 5ab7d7363eb0015f9a3077be2505378f ******/
		%feature("compactdefaultargs") ShapeExtend_WireData;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
chained: bool (optional, default to Standard_True)
theManifoldMode: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Constructor initializing the data from TopoDS_Wire. Calls Init(wire,chained).
") ShapeExtend_WireData;
		 ShapeExtend_WireData(const TopoDS_Wire & wire, const Standard_Boolean chained = Standard_True, const Standard_Boolean theManifoldMode = Standard_True);

		/****** ShapeExtend_WireData::Add ******/
		/****** md5 signature: faf93e4bf33902e064c9e905990c8178 ******/
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
		void Add(const TopoDS_Edge & edge, const Standard_Integer atnum = 0);

		/****** ShapeExtend_WireData::Add ******/
		/****** md5 signature: 191f73dffec406bc9d062ee4d1694d18 ******/
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
		void Add(const TopoDS_Wire & wire, const Standard_Integer atnum = 0);

		/****** ShapeExtend_WireData::Add ******/
		/****** md5 signature: 1065156f604c62b8aba230c6c36abbcb ******/
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
		void Add(const opencascade::handle<ShapeExtend_WireData> & wire, const Standard_Integer atnum = 0);

		/****** ShapeExtend_WireData::Add ******/
		/****** md5 signature: 9e386334d6f0187e5100e94c42ac6004 ******/
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
		void Add(const TopoDS_Shape & shape, const Standard_Integer atnum = 0);

		/****** ShapeExtend_WireData::AddOriented ******/
		/****** md5 signature: ad811585ba1dd40a4670a0034d100af3 ******/
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
		void AddOriented(const TopoDS_Edge & edge, const Standard_Integer mode);

		/****** ShapeExtend_WireData::AddOriented ******/
		/****** md5 signature: 6895a004b9d6ee471d85fd8d2a7b0824 ******/
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
		void AddOriented(const TopoDS_Wire & wire, const Standard_Integer mode);

		/****** ShapeExtend_WireData::AddOriented ******/
		/****** md5 signature: 097d2be7d234600f10ff3f2b85f0abae ******/
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
		void AddOriented(const TopoDS_Shape & shape, const Standard_Integer mode);

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
		/****** md5 signature: ddb38259639359eb30a7142d9a753b11 ******/
		%feature("compactdefaultargs") ComputeSeams;
		%feature("autodoc", "
Parameters
----------
enforce: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Computes the list of seam edges By default (direct call), computing is enforced For indirect call (from IsSeam) it is redone only if not yet already done or if the list of edges has changed Remark: A Seam Edge is an Edge present twice in the list, once as FORWARD and once as REVERSED Each sense has its own PCurve, the one for FORWARD must be set in first.
") ComputeSeams;
		void ComputeSeams(const Standard_Boolean enforce = Standard_True);

		/****** ShapeExtend_WireData::Edge ******/
		/****** md5 signature: 825841bc4e9a24f9987724fcade8ecd7 ******/
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
		TopoDS_Edge Edge(const Standard_Integer num);

		/****** ShapeExtend_WireData::Index ******/
		/****** md5 signature: 22b90e0d6beeb4ce11ec9f240e4b2793 ******/
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
		Standard_Integer Index(const TopoDS_Edge & edge);

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
		/****** md5 signature: a9e5faa7293c857497a7c93fe76d0f12 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
chained: bool (optional, default to Standard_True)
theManifoldMode: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Loads an already existing wire If <chained> is True (default), edges are added in the sequence as they are explored by TopoDS_Iterator Else, if <chained> is False, wire is explored by BRepTools_WireExplorer and it is guaranteed that edges will be sequentially connected. Remark: In the latter case it can happen that not all edges will be found (because of limitations of BRepTools_WireExplorer for disconnected wires and wires with seam edges).
") Init;
		Standard_Boolean Init(const TopoDS_Wire & wire, const Standard_Boolean chained = Standard_True, const Standard_Boolean theManifoldMode = Standard_True);

		/****** ShapeExtend_WireData::IsSeam ******/
		/****** md5 signature: 3515b6ede46eab1ed4970d48841f2b6f ******/
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
		Standard_Boolean IsSeam(const Standard_Integer num);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetManifoldMode() {
            return (Standard_Boolean) $self->ManifoldMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetManifoldMode(Standard_Boolean value) {
            $self->ManifoldMode()=value;
            }
        };
		/****** ShapeExtend_WireData::NbEdges ******/
		/****** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of currently recorded edges.
") NbEdges;
		Standard_Integer NbEdges();

		/****** ShapeExtend_WireData::NbNonManifoldEdges ******/
		/****** md5 signature: a61655ffca0f6ad461c5c34924fb2c09 ******/
		%feature("compactdefaultargs") NbNonManifoldEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of currently recorded non-manifold edges.
") NbNonManifoldEdges;
		Standard_Integer NbNonManifoldEdges();

		/****** ShapeExtend_WireData::NonmanifoldEdge ******/
		/****** md5 signature: d94d5856bf592c5d821796b66ad40853 ******/
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
		TopoDS_Edge NonmanifoldEdge(const Standard_Integer num);

		/****** ShapeExtend_WireData::NonmanifoldEdges ******/
		/****** md5 signature: 89dbf7a1d2587fc3263f1d656fd4714f ******/
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
		/****** md5 signature: 86d2494f11c5eef0ac12ae0f32b8af37 ******/
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
		void Remove(const Standard_Integer num = 0);

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
		/****** md5 signature: ee9615ecf89e20480c45a3bf6f7c01ce ******/
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
		void Set(const TopoDS_Edge & edge, const Standard_Integer num = 0);

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
		/****** md5 signature: a10b4f8d5f12d7d711a649451913cb53 ******/
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
		void SetLast(const Standard_Integer num);

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
		/****** md5 signature: 7803eb7c8f00316fc4004f06def61ccf ******/
		%feature("compactdefaultargs") MapShape;
		%feature("autodoc", "Return
-------
ShapeExtend_DataMapOfShapeListOfMsg

Description
-----------
Returns a Map of shapes and message list.
") MapShape;
		const ShapeExtend_DataMapOfShapeListOfMsg & MapShape();

		/****** ShapeExtend_MsgRegistrator::MapTransient ******/
		/****** md5 signature: 0c75be6df9953704a1705e6f28d377cc ******/
		%feature("compactdefaultargs") MapTransient;
		%feature("autodoc", "Return
-------
ShapeExtend_DataMapOfTransientListOfMsg

Description
-----------
Returns a Map of objects and message list.
") MapTransient;
		const ShapeExtend_DataMapOfTransientListOfMsg & MapTransient();

		/****** ShapeExtend_MsgRegistrator::Send ******/
		/****** md5 signature: b59503dc94dba826d8ba9e2c1cd171f0 ******/
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
		virtual void Send(const opencascade::handle<Standard_Transient> & object, const Message_Msg & message, const Message_Gravity gravity);

		/****** ShapeExtend_MsgRegistrator::Send ******/
		/****** md5 signature: 0c6eb362a61683b8209d804fa3d94cbf ******/
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
		virtual void Send(const TopoDS_Shape & shape, const Message_Msg & message, const Message_Gravity gravity);

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
