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
%define SHAPEEXTENDDOCSTRING
"ShapeExtend module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapeextend.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

enum ShapeExtend_Parametrisation {
	ShapeExtend_Natural = 0,
	ShapeExtend_Uniform = 1,
	ShapeExtend_Unitary = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

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

class ShapeExtend_Parametrisation(IntEnum):
	ShapeExtend_Natural = 0
	ShapeExtend_Uniform = 1
	ShapeExtend_Unitary = 2
ShapeExtend_Natural = ShapeExtend_Parametrisation.ShapeExtend_Natural
ShapeExtend_Uniform = ShapeExtend_Parametrisation.ShapeExtend_Uniform
ShapeExtend_Unitary = ShapeExtend_Parametrisation.ShapeExtend_Unitary
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
%template(ShapeExtend_DataMapOfTransientListOfMsg) NCollection_DataMap<opencascade::handle<Standard_Transient>,Message_ListOfMsg,TColStd_MapTransientHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, Message_ListOfMsg, TopTools_ShapeMapHasher>::Iterator ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, Message_ListOfMsg, TColStd_MapTransientHasher>::Iterator ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg;
typedef NCollection_DataMap<TopoDS_Shape, Message_ListOfMsg, TopTools_ShapeMapHasher> ShapeExtend_DataMapOfShapeListOfMsg;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, Message_ListOfMsg, TColStd_MapTransientHasher> ShapeExtend_DataMapOfTransientListOfMsg;
/* end typedefs declaration */

/********************
* class ShapeExtend *
********************/
%rename(shapeextend) ShapeExtend;
class ShapeExtend {
	public:
		/****************** DecodeStatus ******************/
		/**** md5 signature: dcd7ae9c9207387fafcd3d787644b189 ****/
		%feature("compactdefaultargs") DecodeStatus;
		%feature("autodoc", "Tells if a bit flag contains bit corresponding to enumerated status.

Parameters
----------
flag: int
status: ShapeExtend_Status

Returns
-------
bool
") DecodeStatus;
		static Standard_Boolean DecodeStatus(const Standard_Integer flag, const ShapeExtend_Status status);

		/****************** EncodeStatus ******************/
		/**** md5 signature: dd82b90b3fd2f1a7647f76ea7b12ba2b ****/
		%feature("compactdefaultargs") EncodeStatus;
		%feature("autodoc", "Encodes status (enumeration) to a bit flag.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
int
") EncodeStatus;
		static Standard_Integer EncodeStatus(const ShapeExtend_Status status);

		/****************** Init ******************/
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Inits using of shapeextend. currently, loads messages output by shapehealing algorithms.

Returns
-------
None
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
		/****************** ShapeExtend_BasicMsgRegistrator ******************/
		/**** md5 signature: d702c519c6e3d4ef167e1150681c8eac ****/
		%feature("compactdefaultargs") ShapeExtend_BasicMsgRegistrator;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeExtend_BasicMsgRegistrator;
		 ShapeExtend_BasicMsgRegistrator();

		/****************** Send ******************/
		/**** md5 signature: da6fbe2eca5e7a814d953765183b291a ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Sends a message to be attached to the object. object can be of any type interpreted by redefined msgregistrator.

Parameters
----------
object: Standard_Transient
message: Message_Msg
gravity: Message_Gravity

Returns
-------
None
") Send;
		virtual void Send(const opencascade::handle<Standard_Transient> & object, const Message_Msg & message, const Message_Gravity gravity);

		/****************** Send ******************/
		/**** md5 signature: 054be7c1da7eaa4937d6b2832814258e ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Sends a message to be attached to the shape.

Parameters
----------
shape: TopoDS_Shape
message: Message_Msg
gravity: Message_Gravity

Returns
-------
None
") Send;
		virtual void Send(const TopoDS_Shape & shape, const Message_Msg & message, const Message_Gravity gravity);

		/****************** Send ******************/
		/**** md5 signature: b2de47162d64d2d3fab87292ed5af94b ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Calls send method with null transient.

Parameters
----------
message: Message_Msg
gravity: Message_Gravity

Returns
-------
None
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
		/****************** CheckConnectivity ******************/
		/**** md5 signature: d85fe1af866a15556de6f47884b5cdff ****/
		%feature("compactdefaultargs") CheckConnectivity;
		%feature("autodoc", "Checks geometrical connectivity of the curves, including closure (sets fields myclosed).

Parameters
----------
Preci: float

Returns
-------
bool
") CheckConnectivity;
		Standard_Boolean CheckConnectivity(const Standard_Real Preci);

		/****************** Continuity ******************/
		/**** md5 signature: f3ed9d27f993b8051d8cf116b3837e8a ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_c0.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** Curve ******************/
		/**** md5 signature: 8e6a949d985ee52fdc0a32db347f8bd4 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns curve given by its index.

Parameters
----------
index: int

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		virtual const opencascade::handle<Geom_Curve> & Curve(const Standard_Integer index);

		/****************** D0 ******************/
		/**** md5 signature: 51907fc492adf822ddaa386ab89a6e16 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns point at parameter u. finds appropriate curve and local parameter on it.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 3172d2da7d491678c13781d50f333062 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		/**** md5 signature: 2b2df3653c3200a8f34857c6e4ebfddc ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: ef86b793d3bf42ef2cc02a4e60cd1d4f ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		/**** md5 signature: 8b3730d9a5184b049d1fc2f5122d8644 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		virtual gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** FirstParameter ******************/
		/**** md5 signature: 4764beb92499e70705c5628a20961327 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns 0.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** GetScaleFactor ******************/
		/**** md5 signature: 98fe73645fe835ff75323eaf2264c340 ****/
		%feature("compactdefaultargs") GetScaleFactor;
		%feature("autodoc", "Returns scale factor for recomputing of deviatives.

Parameters
----------
ind: int

Returns
-------
float
") GetScaleFactor;
		virtual Standard_Real GetScaleFactor(const Standard_Integer ind);

		/****************** IsCN ******************/
		/**** md5 signature: 3c52d0a06cd90d9afee28536901289df ****/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns false if n > 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCN;
		virtual Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		/**** md5 signature: ee5341b93937df820c1211eb1ee92b91 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the curve is closed.

Returns
-------
bool
") IsClosed;
		virtual Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 13a0a38f32e22e8a1ec5aa34cbf9bbea ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: 51650ab8b3afb0a24f930d23afae31ca ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns 1.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** LocalToGlobal ******************/
		/**** md5 signature: 2e6dc5480ad6062633f20d7a31bf672c ****/
		%feature("compactdefaultargs") LocalToGlobal;
		%feature("autodoc", "Returns global parameter for the whole curve according to the segment and local parameter on it.

Parameters
----------
index: int
Ulocal: float

Returns
-------
float
") LocalToGlobal;
		virtual Standard_Real LocalToGlobal(const Standard_Integer index, const Standard_Real Ulocal);

		/****************** LocateParameter ******************/
		/**** md5 signature: d22703cefaed9211fcf1e8faf34f4f2c ****/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "Returns number of the curve for the given parameter u and local paramete r uout for the found curve.

Parameters
----------
U: float

Returns
-------
UOut: float
") LocateParameter;
		virtual Standard_Integer LocateParameter(const Standard_Real U, Standard_Real &OutValue);

		/****************** NbCurves ******************/
		/**** md5 signature: 00c615638a5abc467ec2c383544c5cf8 ****/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Returns number of curves.

Returns
-------
int
") NbCurves;
		virtual Standard_Integer NbCurves();

		/****************** ReversedParameter ******************/
		/**** md5 signature: ba3bf42dda8156e076845171024e85fe ****/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Returns 1 - u.

Parameters
----------
U: float

Returns
-------
float
") ReversedParameter;
		virtual Standard_Real ReversedParameter(const Standard_Real U);

		/****************** Transform ******************/
		/**** md5 signature: 2de73a9941c00fb14731ec58602530d0 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies transformation to each curve.

Parameters
----------
T: gp_Trsf

Returns
-------
None
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
		/****************** ShapeExtend_CompositeSurface ******************/
		/**** md5 signature: ac2e7d39ef6c5af9a68d551d965c0f1b ****/
		%feature("compactdefaultargs") ShapeExtend_CompositeSurface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface();

		/****************** ShapeExtend_CompositeSurface ******************/
		/**** md5 signature: 8c96b9d739e44d535b2912dd9708a855 ****/
		%feature("compactdefaultargs") ShapeExtend_CompositeSurface;
		%feature("autodoc", "Initializes by a grid of surfaces (calls init()).

Parameters
----------
GridSurf: TColGeom_HArray2OfSurface
param: ShapeExtend_Parametrisation,optional
	default value is ShapeExtend_Natural

Returns
-------
None
") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface(const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf, const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****************** ShapeExtend_CompositeSurface ******************/
		/**** md5 signature: 20016c74871e6504488c039f12e5b0c4 ****/
		%feature("compactdefaultargs") ShapeExtend_CompositeSurface;
		%feature("autodoc", "Initializes by a grid of surfaces (calls init()).

Parameters
----------
GridSurf: TColGeom_HArray2OfSurface
UJoints: TColStd_Array1OfReal
VJoints: TColStd_Array1OfReal

Returns
-------
None
") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface(const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf, const TColStd_Array1OfReal & UJoints, const TColStd_Array1OfReal & VJoints);

		/****************** Bounds ******************/
		/**** md5 signature: 014e2123fd08667005a3b193c7391727 ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds of grid.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CheckConnectivity ******************/
		/**** md5 signature: 90bd67b493222d1086d791909b03b08d ****/
		%feature("compactdefaultargs") CheckConnectivity;
		%feature("autodoc", "Checks geometrical connectivity of the patches, including closedness (sets fields muuclosed and myvclosed).

Parameters
----------
prec: float

Returns
-------
bool
") CheckConnectivity;
		Standard_Boolean CheckConnectivity(const Standard_Real prec);

		/****************** ComputeJointValues ******************/
		/**** md5 signature: 770d71062e3f622ec20d9c8cc0ea7fed ****/
		%feature("compactdefaultargs") ComputeJointValues;
		%feature("autodoc", "Computes joint values according to parameter.

Parameters
----------
param: ShapeExtend_Parametrisation,optional
	default value is ShapeExtend_Natural

Returns
-------
None
") ComputeJointValues;
		void ComputeJointValues(const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****************** Continuity ******************/
		/**** md5 signature: f3ed9d27f993b8051d8cf116b3837e8a ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns c0.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: cdab0a14009498bcf8d5047a3b653fd4 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of the surface.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		virtual opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: d703743b1060efe5f30e6bb795ec7841 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u,v on the grid.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 040f0ebc2e2ebafab4ec5391c35a1846 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point p and the first derivatives in the directions u and v at this point.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		/**** md5 signature: b8114c7d18571779e326d7acd07d497d ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point p, the first and the second derivatives in the directions u and v at this point.

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

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		/**** md5 signature: 2fcde2cdd09932f1564ea57c5e638207 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the point p, the first,the second and the third derivatives in the directions u and v at this point.

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

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		/**** md5 signature: c8d8a3dca502cf9791f67c765422b492 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the direction u and nv in the direction v at the point p(u, v).

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		virtual gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** GlobalToLocal ******************/
		/**** md5 signature: 6030bdda51b0128dabdaf3900daca82f ****/
		%feature("compactdefaultargs") GlobalToLocal;
		%feature("autodoc", "Converts global parameters uv to local parameters uv on patch i,j.

Parameters
----------
i: int
j: int
UV: gp_Pnt2d

Returns
-------
gp_Pnt2d
") GlobalToLocal;
		gp_Pnt2d GlobalToLocal(const Standard_Integer i, const Standard_Integer j, const gp_Pnt2d & UV);

		/****************** GlobalToLocalTransformation ******************/
		/**** md5 signature: ed3b70490066b28c3fe080b72afd6ee2 ****/
		%feature("compactdefaultargs") GlobalToLocalTransformation;
		%feature("autodoc", "Computes transformation operator and ufactor descrinbing affine transformation required to convert global parameters on composite surface to local parameters on patch (i,j): uv = ( ufactor, 1. ) x trsf * uv; note: thus trsf contains shift and scale by v, scale by u is stored in ufact. returns true if transformation is not an identity.

Parameters
----------
i: int
j: int
Trsf: gp_Trsf2d

Returns
-------
uFact: float
") GlobalToLocalTransformation;
		Standard_Boolean GlobalToLocalTransformation(const Standard_Integer i, const Standard_Integer j, Standard_Real &OutValue, gp_Trsf2d & Trsf);

		/****************** Init ******************/
		/**** md5 signature: 50a4d0a2eb9d17b1169eb618b7089a39 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes by a grid of surfaces. all the surfaces of the grid must have geometrical connectivity as stated above. if geometrical connectivity is not satisfied, method returns false. however, class is initialized even in that case. //! last parameter defines how global parametrisation (joint values) will be computed: shapeextend_natural: u1 = u11min, ui+1 = ui + (ui1max-ui1min), etc. shapeextend_uniform: ui = i-1, vj = j-1 shapeextend_unitary: ui = (i-1)/nu, vi = (j-1)/nv.

Parameters
----------
GridSurf: TColGeom_HArray2OfSurface
param: ShapeExtend_Parametrisation,optional
	default value is ShapeExtend_Natural

Returns
-------
bool
") Init;
		Standard_Boolean Init(const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf, const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****************** Init ******************/
		/**** md5 signature: d76029a41a655e05acf78e2f267153c7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes by a grid of surfaces with given global parametrisation defined by ujoints and vjoints arrays, each having langth equal to number of patches in corresponding direction + 1. global joint values should be sorted in increasing order. all the surfaces of the grid must have geometrical connectivity as stated above. if geometrical connectivity is not satisfied, method returns false. however, class is initialized even in that case.

Parameters
----------
GridSurf: TColGeom_HArray2OfSurface
UJoints: TColStd_Array1OfReal
VJoints: TColStd_Array1OfReal

Returns
-------
bool
") Init;
		Standard_Boolean Init(const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf, const TColStd_Array1OfReal & UJoints, const TColStd_Array1OfReal & VJoints);

		/****************** IsCNu ******************/
		/**** md5 signature: 31b03fc1d509ad0976d7467a3bd394b7 ****/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "Returns true if n <=0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNu;
		virtual Standard_Boolean IsCNu(const Standard_Integer N);

		/****************** IsCNv ******************/
		/**** md5 signature: ae0b7938459cd292b5b4744525e5249a ****/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "Returns true if n <=0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNv;
		virtual Standard_Boolean IsCNv(const Standard_Integer N);

		/****************** IsUClosed ******************/
		/**** md5 signature: c240e3242256b185362f31b103803abe ****/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Returns true if grid is closed in u direction (i.e. connected with precision::confusion).

Returns
-------
bool
") IsUClosed;
		virtual Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		/**** md5 signature: ee1d04d096d58c0c69971438c1aa71fc ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		/**** md5 signature: 5826a15e603eec763554a14db7394466 ****/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Returns true if grid is closed in v direction (i.e. connected with precision::confusion).

Returns
-------
bool
") IsVClosed;
		virtual Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		/**** md5 signature: c62bf083eb7bc6b915c3cdeea2fc8406 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** LocalToGlobal ******************/
		/**** md5 signature: 3886cd57f7bc5e69b8f70cfb75e749db ****/
		%feature("compactdefaultargs") LocalToGlobal;
		%feature("autodoc", "Converts local parameters uv on patch i,j to global parameters uv.

Parameters
----------
i: int
j: int
uv: gp_Pnt2d

Returns
-------
gp_Pnt2d
") LocalToGlobal;
		gp_Pnt2d LocalToGlobal(const Standard_Integer i, const Standard_Integer j, const gp_Pnt2d & uv);

		/****************** LocateUParameter ******************/
		/**** md5 signature: 0e9e5ebbf05b8a9aac81a0f4ae07db7d ****/
		%feature("compactdefaultargs") LocateUParameter;
		%feature("autodoc", "Returns number of col that contains given (global) parameter.

Parameters
----------
U: float

Returns
-------
int
") LocateUParameter;
		Standard_Integer LocateUParameter(const Standard_Real U);

		/****************** LocateUVPoint ******************/
		/**** md5 signature: e8f91d9fefe7790104c7fb51cec17207 ****/
		%feature("compactdefaultargs") LocateUVPoint;
		%feature("autodoc", "Returns number of row and col of surface that contains given point.

Parameters
----------
pnt: gp_Pnt2d

Returns
-------
i: int
j: int
") LocateUVPoint;
		void LocateUVPoint(const gp_Pnt2d & pnt, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocateVParameter ******************/
		/**** md5 signature: cc621d4473cd8781007a1a4ea808d2ce ****/
		%feature("compactdefaultargs") LocateVParameter;
		%feature("autodoc", "Returns number of row that contains given (global) parameter.

Parameters
----------
V: float

Returns
-------
int
") LocateVParameter;
		Standard_Integer LocateVParameter(const Standard_Real V);

		/****************** NbUPatches ******************/
		/**** md5 signature: 6b0ad1d8cd917ddafd65ec74fe6e89da ****/
		%feature("compactdefaultargs") NbUPatches;
		%feature("autodoc", "Returns number of patches in u direction.

Returns
-------
int
") NbUPatches;
		Standard_Integer NbUPatches();

		/****************** NbVPatches ******************/
		/**** md5 signature: 90a9eb7fe715a81477e403cf8ccff1b9 ****/
		%feature("compactdefaultargs") NbVPatches;
		%feature("autodoc", "Returns number of patches in v direction.

Returns
-------
int
") NbVPatches;
		Standard_Integer NbVPatches();

		/****************** Patch ******************/
		/**** md5 signature: e8398d4fc47f1bbab96955c665a17669 ****/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "Returns one surface patch.

Parameters
----------
i: int
j: int

Returns
-------
opencascade::handle<Geom_Surface>
") Patch;
		const opencascade::handle<Geom_Surface> & Patch(const Standard_Integer i, const Standard_Integer j);

		/****************** Patch ******************/
		/**** md5 signature: 38a7356d10e1ea2a1e6323260e074332 ****/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "Returns one surface patch that contains given (global) parameters.

Parameters
----------
U: float
V: float

Returns
-------
opencascade::handle<Geom_Surface>
") Patch;
		const opencascade::handle<Geom_Surface> & Patch(const Standard_Real U, const Standard_Real V);

		/****************** Patch ******************/
		/**** md5 signature: 9cc716a3abfc8ff89d7ba49df9c2bd7b ****/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "Returns one surface patch that contains given point.

Parameters
----------
pnt: gp_Pnt2d

Returns
-------
opencascade::handle<Geom_Surface>
") Patch;
		const opencascade::handle<Geom_Surface> & Patch(const gp_Pnt2d & pnt);

		/****************** Patches ******************/
		/**** md5 signature: dd509d4d087a753d8c88ea7c6932a3af ****/
		%feature("compactdefaultargs") Patches;
		%feature("autodoc", "Returns grid of surfaces.

Returns
-------
opencascade::handle<TColGeom_HArray2OfSurface>
") Patches;
		const opencascade::handle<TColGeom_HArray2OfSurface> & Patches();

		/****************** SetUFirstValue ******************/
		/**** md5 signature: c48cd2c79d36589c8fb89696f77a9e92 ****/
		%feature("compactdefaultargs") SetUFirstValue;
		%feature("autodoc", "Changes starting value for global u parametrisation (all other joint values are shifted accordingly).

Parameters
----------
UFirst: float

Returns
-------
None
") SetUFirstValue;
		void SetUFirstValue(const Standard_Real UFirst);

		/****************** SetUJointValues ******************/
		/**** md5 signature: 5caa1f14232e408186e29bb4d42f8318 ****/
		%feature("compactdefaultargs") SetUJointValues;
		%feature("autodoc", "Sets the array of u values corresponding to joint points, which define global parametrisation of the surface. number of values in array should be equal to nbupatches()+1. all the values should be sorted in increasing order. if this is not satisfied, does nothing and returns false.

Parameters
----------
UJoints: TColStd_Array1OfReal

Returns
-------
bool
") SetUJointValues;
		Standard_Boolean SetUJointValues(const TColStd_Array1OfReal & UJoints);

		/****************** SetVFirstValue ******************/
		/**** md5 signature: 766cf79731af68776892a4c767ccf890 ****/
		%feature("compactdefaultargs") SetVFirstValue;
		%feature("autodoc", "Changes starting value for global v parametrisation (all other joint values are shifted accordingly).

Parameters
----------
VFirst: float

Returns
-------
None
") SetVFirstValue;
		void SetVFirstValue(const Standard_Real VFirst);

		/****************** SetVJointValues ******************/
		/**** md5 signature: 8f783a94d54b85b9113d4504ff6739a4 ****/
		%feature("compactdefaultargs") SetVJointValues;
		%feature("autodoc", "Sets the array of v values corresponding to joint points, which define global parametrisation of the surface number of values in array should be equal to nbvpatches()+1. all the values should be sorted in increasing order. if this is not satisfied, does nothing and returns false.

Parameters
----------
VJoints: TColStd_Array1OfReal

Returns
-------
bool
") SetVJointValues;
		Standard_Boolean SetVJointValues(const TColStd_Array1OfReal & VJoints);

		/****************** Transform ******************/
		/**** md5 signature: 2de73a9941c00fb14731ec58602530d0 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies transformation to all the patches.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		virtual void Transform(const gp_Trsf & T);

		/****************** UGlobalToLocal ******************/
		/**** md5 signature: e38e93ba598af7f2e97366e473b49279 ****/
		%feature("compactdefaultargs") UGlobalToLocal;
		%feature("autodoc", "Converts global parameter u to local parameter u on patch i,j.

Parameters
----------
i: int
j: int
U: float

Returns
-------
float
") UGlobalToLocal;
		Standard_Real UGlobalToLocal(const Standard_Integer i, const Standard_Integer j, const Standard_Real U);

		/****************** UIso ******************/
		/**** md5 signature: a652d0cc6670b92301ba1f2ca72bb79a ****/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Not implemented (returns null curve).

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		virtual opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UJointValue ******************/
		/**** md5 signature: 670e002b3e58c1b2e3b5fe638fbad6d8 ****/
		%feature("compactdefaultargs") UJointValue;
		%feature("autodoc", "Returns i-th joint value in u direction (1-st is global umin, (nbupatches()+1)-th is global umax on the composite surface).

Parameters
----------
i: int

Returns
-------
float
") UJointValue;
		Standard_Real UJointValue(const Standard_Integer i);

		/****************** UJointValues ******************/
		/**** md5 signature: 88cd76678e6a3978a860181ef45205d1 ****/
		%feature("compactdefaultargs") UJointValues;
		%feature("autodoc", "Returns the array of u values corresponding to joint points between patches as well as to start and end points, which define global parametrisation of the surface.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") UJointValues;
		opencascade::handle<TColStd_HArray1OfReal> UJointValues();

		/****************** ULocalToGlobal ******************/
		/**** md5 signature: ac695bfa57d6979eaa1702e685fb4cc1 ****/
		%feature("compactdefaultargs") ULocalToGlobal;
		%feature("autodoc", "Converts local parameter u on patch i,j to global parameter u.

Parameters
----------
i: int
j: int
u: float

Returns
-------
float
") ULocalToGlobal;
		Standard_Real ULocalToGlobal(const Standard_Integer i, const Standard_Integer j, const Standard_Real u);

		/****************** UReverse ******************/
		/**** md5 signature: d70147d3bce5fe1e36771349f34ded17 ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Not implemented (does nothing).

Returns
-------
None
") UReverse;
		virtual void UReverse();

		/****************** UReversedParameter ******************/
		/**** md5 signature: 455649ad8e72cb371c0686d0e771362f ****/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Returns u.

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		virtual Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VGlobalToLocal ******************/
		/**** md5 signature: 5b91fe4bcdda99113c51c9cabdf5fe8e ****/
		%feature("compactdefaultargs") VGlobalToLocal;
		%feature("autodoc", "Converts global parameter v to local parameter v on patch i,j.

Parameters
----------
i: int
j: int
V: float

Returns
-------
float
") VGlobalToLocal;
		Standard_Real VGlobalToLocal(const Standard_Integer i, const Standard_Integer j, const Standard_Real V);

		/****************** VIso ******************/
		/**** md5 signature: 7231943ddfe038bbb071bb6696d17d04 ****/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Not implemented (returns null curve).

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		virtual opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VJointValue ******************/
		/**** md5 signature: 874819d969e6449276dc3255b5bd3d26 ****/
		%feature("compactdefaultargs") VJointValue;
		%feature("autodoc", "Returns j-th joint value in v direction (1-st is global vmin, (nbvpatches()+1)-th is global vmax on the composite surface).

Parameters
----------
j: int

Returns
-------
float
") VJointValue;
		Standard_Real VJointValue(const Standard_Integer j);

		/****************** VJointValues ******************/
		/**** md5 signature: 8f8c0cbddebed98ac769578d05d1ae5f ****/
		%feature("compactdefaultargs") VJointValues;
		%feature("autodoc", "Returns the array of v values corresponding to joint points between patches as well as to start and end points, which define global parametrisation of the surface.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") VJointValues;
		opencascade::handle<TColStd_HArray1OfReal> VJointValues();

		/****************** VLocalToGlobal ******************/
		/**** md5 signature: cada022c7dd8796ccab060600fdc6748 ****/
		%feature("compactdefaultargs") VLocalToGlobal;
		%feature("autodoc", "Converts local parameter v on patch i,j to global parameter v.

Parameters
----------
i: int
j: int
v: float

Returns
-------
float
") VLocalToGlobal;
		Standard_Real VLocalToGlobal(const Standard_Integer i, const Standard_Integer j, const Standard_Real v);

		/****************** VReverse ******************/
		/**** md5 signature: 60a0c07d53675378b2bcbe23d1e7e281 ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Not implemented (does nothing).

Returns
-------
None
") VReverse;
		virtual void VReverse();

		/****************** VReversedParameter ******************/
		/**** md5 signature: 511e9f30bcc67915e6946bce79705b17 ****/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Returns v.

Parameters
----------
V: float

Returns
-------
float
") VReversedParameter;
		virtual Standard_Real VReversedParameter(const Standard_Real V);

		/****************** Value ******************/
		/**** md5 signature: 7c51fb21324189a4350d8fed0a35c374 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter pnt on the grid.

Parameters
----------
pnt: gp_Pnt2d

Returns
-------
gp_Pnt
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
		/****************** ShapeExtend_Explorer ******************/
		/**** md5 signature: 011a50753a9f4a160039dcdcf83c3214 ****/
		%feature("compactdefaultargs") ShapeExtend_Explorer;
		%feature("autodoc", "Creates an object explorer.

Returns
-------
None
") ShapeExtend_Explorer;
		 ShapeExtend_Explorer();

		/****************** CompoundFromSeq ******************/
		/**** md5 signature: 9c42e270bfcdddbf1929a557984f4fda ****/
		%feature("compactdefaultargs") CompoundFromSeq;
		%feature("autodoc", "Converts a sequence of shapes to a compound.

Parameters
----------
seqval: TopTools_HSequenceOfShape

Returns
-------
TopoDS_Shape
") CompoundFromSeq;
		TopoDS_Shape CompoundFromSeq(const opencascade::handle<TopTools_HSequenceOfShape> & seqval);

		/****************** DispatchList ******************/
		/**** md5 signature: 72677e95978b2702fc412b78c9d37ab8 ****/
		%feature("compactdefaultargs") DispatchList;
		%feature("autodoc", "Dispatches starting list of shapes according to their type, to the appropriate resulting lists for each of these lists, if it is null, it is firstly created else, new items are appended to the already existing ones.

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

Returns
-------
None
") DispatchList;
		void DispatchList(const opencascade::handle<TopTools_HSequenceOfShape> & list, opencascade::handle<TopTools_HSequenceOfShape> & vertices, opencascade::handle<TopTools_HSequenceOfShape> & edges, opencascade::handle<TopTools_HSequenceOfShape> & wires, opencascade::handle<TopTools_HSequenceOfShape> & faces, opencascade::handle<TopTools_HSequenceOfShape> & shells, opencascade::handle<TopTools_HSequenceOfShape> & solids, opencascade::handle<TopTools_HSequenceOfShape> & compsols, opencascade::handle<TopTools_HSequenceOfShape> & compounds);

		/****************** ListFromSeq ******************/
		/**** md5 signature: 19b9a376fbcff81e41c6f52b68739b02 ****/
		%feature("compactdefaultargs") ListFromSeq;
		%feature("autodoc", "Converts a sequence of shapes to a list of shapes <clear> if true (d), commands the list to start from scratch else, the list is cumulated.

Parameters
----------
seqval: TopTools_HSequenceOfShape
lisval: TopTools_ListOfShape
clear: bool,optional
	default value is Standard_True

Returns
-------
None
") ListFromSeq;
		void ListFromSeq(const opencascade::handle<TopTools_HSequenceOfShape> & seqval, TopTools_ListOfShape & lisval, const Standard_Boolean clear = Standard_True);

		/****************** SeqFromCompound ******************/
		/**** md5 signature: 560f0008fe1a70e46fcdb58b55e42287 ****/
		%feature("compactdefaultargs") SeqFromCompound;
		%feature("autodoc", "Converts a compound to a list of shapes if <comp> is not a compound, the list contains only <comp> if <comp> is null, the list is empty if <comp> is a compound, its sub-shapes are put into the list then if <expcomp> is true, if a sub-shape is a compound, it is not put to the list but its sub-shapes are (recursive).

Parameters
----------
comp: TopoDS_Shape
expcomp: bool

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") SeqFromCompound;
		opencascade::handle<TopTools_HSequenceOfShape> SeqFromCompound(const TopoDS_Shape & comp, const Standard_Boolean expcomp);

		/****************** SeqFromList ******************/
		/**** md5 signature: 5cfd1ced143892bb4d8f80f9a062c141 ****/
		%feature("compactdefaultargs") SeqFromList;
		%feature("autodoc", "Converts a list of shapes to a sequence of shapes.

Parameters
----------
lisval: TopTools_ListOfShape

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") SeqFromList;
		opencascade::handle<TopTools_HSequenceOfShape> SeqFromList(const TopTools_ListOfShape & lisval);

		/****************** ShapeType ******************/
		/**** md5 signature: ab636bf5c0d2e486d53891e797ab3d6b ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns the type of a shape: true type if <compound> is false if <compound> is true and <shape> is a compound, iterates on its items. if all are of the same type, returns this type. else, returns compound. if it is empty, returns shape for a null shape, returns shape.

Parameters
----------
shape: TopoDS_Shape
compound: bool

Returns
-------
TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType(const TopoDS_Shape & shape, const Standard_Boolean compound);

		/****************** SortedCompound ******************/
		/**** md5 signature: b55d0015285d0f23fb3c68ccb5f8f79e ****/
		%feature("compactdefaultargs") SortedCompound;
		%feature("autodoc", "Builds a compound from the given shape. it explores the shape level by level, according to the <explore> argument. if <explore> is false, only compound items are explored, else all items are. the following shapes are added to resulting compound: - shapes which comply to <type> - if <type> is wire, considers also free edges (and makes wires) - if <type> is shell, considers also free faces (and makes shells) if <compound> is true, gathers items in compounds which correspond to starting compound,solid or shell containers, or items directly contained in a compound.

Parameters
----------
shape: TopoDS_Shape
type: TopAbs_ShapeEnum
explore: bool
compound: bool

Returns
-------
TopoDS_Shape
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
		/****************** ShapeExtend_WireData ******************/
		/**** md5 signature: 0f3d35aa8708df5a24ccc4e7d7301935 ****/
		%feature("compactdefaultargs") ShapeExtend_WireData;
		%feature("autodoc", "Empty constructor, creates empty wire with no edges.

Returns
-------
None
") ShapeExtend_WireData;
		 ShapeExtend_WireData();

		/****************** ShapeExtend_WireData ******************/
		/**** md5 signature: 5ab7d7363eb0015f9a3077be2505378f ****/
		%feature("compactdefaultargs") ShapeExtend_WireData;
		%feature("autodoc", "Constructor initializing the data from topods_wire. calls init(wire,chained).

Parameters
----------
wire: TopoDS_Wire
chained: bool,optional
	default value is Standard_True
theManifoldMode: bool,optional
	default value is Standard_True

Returns
-------
None
") ShapeExtend_WireData;
		 ShapeExtend_WireData(const TopoDS_Wire & wire, const Standard_Boolean chained = Standard_True, const Standard_Boolean theManifoldMode = Standard_True);

		/****************** Add ******************/
		/**** md5 signature: faf93e4bf33902e064c9e905990c8178 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds an edge to a wire, being defined (not yet ended) this is the plain, basic, function to add an edge <num> = 0 (d): appends at end <num> = 1: preprends at start else, insert before <num> remark : null edge is simply ignored.

Parameters
----------
edge: TopoDS_Edge
atnum: int,optional
	default value is 0

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & edge, const Standard_Integer atnum = 0);

		/****************** Add ******************/
		/**** md5 signature: 191f73dffec406bc9d062ee4d1694d18 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds an entire wire, considered as a list of edges remark : the wire is assumed to be ordered (topods_iterator is used).

Parameters
----------
wire: TopoDS_Wire
atnum: int,optional
	default value is 0

Returns
-------
None
") Add;
		void Add(const TopoDS_Wire & wire, const Standard_Integer atnum = 0);

		/****************** Add ******************/
		/**** md5 signature: 1065156f604c62b8aba230c6c36abbcb ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a wire in the form of wiredata.

Parameters
----------
wire: ShapeExtend_WireData
atnum: int,optional
	default value is 0

Returns
-------
None
") Add;
		void Add(const opencascade::handle<ShapeExtend_WireData> & wire, const Standard_Integer atnum = 0);

		/****************** Add ******************/
		/**** md5 signature: 9e386334d6f0187e5100e94c42ac6004 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds an edge or a wire invoking corresponding method add.

Parameters
----------
shape: TopoDS_Shape
atnum: int,optional
	default value is 0

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & shape, const Standard_Integer atnum = 0);

		/****************** AddOriented ******************/
		/**** md5 signature: ad811585ba1dd40a4670a0034d100af3 ****/
		%feature("compactdefaultargs") AddOriented;
		%feature("autodoc", "Adds an edge to start or end of <self>, according to <mode> 0: at end, as direct 1: at end, as reversed 2: at start, as direct 3: at start, as reversed < 0: no adding.

Parameters
----------
edge: TopoDS_Edge
mode: int

Returns
-------
None
") AddOriented;
		void AddOriented(const TopoDS_Edge & edge, const Standard_Integer mode);

		/****************** AddOriented ******************/
		/**** md5 signature: 6895a004b9d6ee471d85fd8d2a7b0824 ****/
		%feature("compactdefaultargs") AddOriented;
		%feature("autodoc", "Adds a wire to start or end of <self>, according to <mode> 0: at end, as direct 1: at end, as reversed 2: at start, as direct 3: at start, as reversed < 0: no adding.

Parameters
----------
wire: TopoDS_Wire
mode: int

Returns
-------
None
") AddOriented;
		void AddOriented(const TopoDS_Wire & wire, const Standard_Integer mode);

		/****************** AddOriented ******************/
		/**** md5 signature: 097d2be7d234600f10ff3f2b85f0abae ****/
		%feature("compactdefaultargs") AddOriented;
		%feature("autodoc", "Adds an edge or a wire invoking corresponding method addoriented.

Parameters
----------
shape: TopoDS_Shape
mode: int

Returns
-------
None
") AddOriented;
		void AddOriented(const TopoDS_Shape & shape, const Standard_Integer mode);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears data about wire.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ComputeSeams ******************/
		/**** md5 signature: ddb38259639359eb30a7142d9a753b11 ****/
		%feature("compactdefaultargs") ComputeSeams;
		%feature("autodoc", "Computes the list of seam edges by default (direct call), computing is enforced for indirect call (from isseam) it is redone only if not yet already done or if the list of edges has changed remark : a seam edge is an edge present twice in the list, once as forward and once as reversed each sense has its own pcurve, the one for forward must be set in first.

Parameters
----------
enforce: bool,optional
	default value is Standard_True

Returns
-------
None
") ComputeSeams;
		void ComputeSeams(const Standard_Boolean enforce = Standard_True);

		/****************** Edge ******************/
		/**** md5 signature: 825841bc4e9a24f9987724fcade8ecd7 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns <num>th edge.

Parameters
----------
num: int

Returns
-------
TopoDS_Edge
") Edge;
		TopoDS_Edge Edge(const Standard_Integer num);

		/****************** Index ******************/
		/**** md5 signature: 22b90e0d6beeb4ce11ec9f240e4b2793 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of the edge if the edge is a seam the orientation is also checked returns 0 if the edge is not found in the list.

Parameters
----------
edge: TopoDS_Edge

Returns
-------
int
") Index;
		Standard_Integer Index(const TopoDS_Edge & edge);

		/****************** Init ******************/
		/**** md5 signature: 70e65a481c83a045eaf89a13ad75120d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Copies data from another wiredata.

Parameters
----------
other: ShapeExtend_WireData

Returns
-------
None
") Init;
		void Init(const opencascade::handle<ShapeExtend_WireData> & other);

		/****************** Init ******************/
		/**** md5 signature: a9e5faa7293c857497a7c93fe76d0f12 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Loads an already existing wire if <chained> is true (default), edges are added in the sequence as they are explored by topods_iterator else, if <chained> is false, wire is explored by breptools_wireexplorer and it is guaranteed that edges will be sequencially connected. remark : in the latter case it can happen that not all edges will be found (because of limitations of breptools_wireexplorer for disconnected wires and wires with seam edges).

Parameters
----------
wire: TopoDS_Wire
chained: bool,optional
	default value is Standard_True
theManifoldMode: bool,optional
	default value is Standard_True

Returns
-------
bool
") Init;
		Standard_Boolean Init(const TopoDS_Wire & wire, const Standard_Boolean chained = Standard_True, const Standard_Boolean theManifoldMode = Standard_True);

		/****************** IsSeam ******************/
		/**** md5 signature: 3515b6ede46eab1ed4970d48841f2b6f ****/
		%feature("compactdefaultargs") IsSeam;
		%feature("autodoc", "Tells if an edge is seam (see computeseams) an edge is considered as seam if it presents twice in the edge list, once as forward and once as reversed.

Parameters
----------
num: int

Returns
-------
bool
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
		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the count of currently recorded edges.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** NbNonManifoldEdges ******************/
		/**** md5 signature: a61655ffca0f6ad461c5c34924fb2c09 ****/
		%feature("compactdefaultargs") NbNonManifoldEdges;
		%feature("autodoc", "Returns the count of currently recorded non-manifold edges.

Returns
-------
int
") NbNonManifoldEdges;
		Standard_Integer NbNonManifoldEdges();

		/****************** NonmanifoldEdge ******************/
		/**** md5 signature: d94d5856bf592c5d821796b66ad40853 ****/
		%feature("compactdefaultargs") NonmanifoldEdge;
		%feature("autodoc", "Returns <num>th nonmanifold edge.

Parameters
----------
num: int

Returns
-------
TopoDS_Edge
") NonmanifoldEdge;
		TopoDS_Edge NonmanifoldEdge(const Standard_Integer num);

		/****************** NonmanifoldEdges ******************/
		/**** md5 signature: 89dbf7a1d2587fc3263f1d656fd4714f ****/
		%feature("compactdefaultargs") NonmanifoldEdges;
		%feature("autodoc", "Returns sequence of non-manifold edges this sequence can be not empty if wire data set in manifold mode but initial wire has internal orientation or contains internal edges.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") NonmanifoldEdges;
		opencascade::handle<TopTools_HSequenceOfShape> NonmanifoldEdges();

		/****************** Remove ******************/
		/**** md5 signature: 86d2494f11c5eef0ac12ae0f32b8af37 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes an edge, given its rank. by default removes the last edge.

Parameters
----------
num: int,optional
	default value is 0

Returns
-------
None
") Remove;
		void Remove(const Standard_Integer num = 0);

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the sense of the list and the orientation of each edge this method should be called when either wire has no seam edges or face is not available.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reverse ******************/
		/**** md5 signature: c2cddd93d9896d16ec3f067612e7d12d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the sense of the list and the orientation of each edge the face is necessary for swapping pcurves for seam edges (first pcurve corresponds to orientation forward, and second to reversed; when edge is reversed, pcurves must be swapped) if face is null, no swapping is performed.

Parameters
----------
face: TopoDS_Face

Returns
-------
None
") Reverse;
		void Reverse(const TopoDS_Face & face);

		/****************** Set ******************/
		/**** md5 signature: ee9615ecf89e20480c45a3bf6f7c01ce ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Replaces an edge at the given rank number <num> with new one. default is last edge (<num> = 0).

Parameters
----------
edge: TopoDS_Edge
num: int,optional
	default value is 0

Returns
-------
None
") Set;
		void Set(const TopoDS_Edge & edge, const Standard_Integer num = 0);

		/****************** SetDegeneratedLast ******************/
		/**** md5 signature: 0041ff783654edafc0b6489d08204a08 ****/
		%feature("compactdefaultargs") SetDegeneratedLast;
		%feature("autodoc", "When the wire contains at least one degenerated edge, sets it as last one note : it is useful to process pcurves, for instance, while the pcurve of a dgnr may not be computed from its 3d part (there is none) it is computed after the other edges have been computed and chained.

Returns
-------
None
") SetDegeneratedLast;
		void SetDegeneratedLast();

		/****************** SetLast ******************/
		/**** md5 signature: a10b4f8d5f12d7d711a649451913cb53 ****/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "Does a circular permutation in order to set <num>th edge last.

Parameters
----------
num: int

Returns
-------
None
") SetLast;
		void SetLast(const Standard_Integer num);

		/****************** Wire ******************/
		/**** md5 signature: 2fe6e5f402158cff91e9020fddff92e6 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Makes topods_wire using brep_builder (just creates the topods_wire object and adds all edges into it). this method should be called when the wire is correct (for example, after successful fixes by shapefix_wire) and adjacent edges share common vertices. in case if adjacent edges do not share the same vertices the resulting topods_wire will be invalid.

Returns
-------
TopoDS_Wire
") Wire;
		TopoDS_Wire Wire();

		/****************** WireAPIMake ******************/
		/**** md5 signature: ee7817a9b0126700bae42396160d62de ****/
		%feature("compactdefaultargs") WireAPIMake;
		%feature("autodoc", "Makes topods_wire using brepapi_makewire. class brepapi_makewire merges geometrically coincided vertices and can disturb correct order of edges in the wire. if this class fails, null shape is returned.

Returns
-------
TopoDS_Wire
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
		/****************** ShapeExtend_MsgRegistrator ******************/
		/**** md5 signature: aaa4e55dda15b703b6b65b5a1ea58167 ****/
		%feature("compactdefaultargs") ShapeExtend_MsgRegistrator;
		%feature("autodoc", "Creates an object.

Returns
-------
None
") ShapeExtend_MsgRegistrator;
		 ShapeExtend_MsgRegistrator();

		/****************** MapShape ******************/
		/**** md5 signature: 7803eb7c8f00316fc4004f06def61ccf ****/
		%feature("compactdefaultargs") MapShape;
		%feature("autodoc", "Returns a map of shapes and message list.

Returns
-------
ShapeExtend_DataMapOfShapeListOfMsg
") MapShape;
		const ShapeExtend_DataMapOfShapeListOfMsg & MapShape();

		/****************** MapTransient ******************/
		/**** md5 signature: 0c75be6df9953704a1705e6f28d377cc ****/
		%feature("compactdefaultargs") MapTransient;
		%feature("autodoc", "Returns a map of objects and message list.

Returns
-------
ShapeExtend_DataMapOfTransientListOfMsg
") MapTransient;
		const ShapeExtend_DataMapOfTransientListOfMsg & MapTransient();

		/****************** Send ******************/
		/**** md5 signature: b59503dc94dba826d8ba9e2c1cd171f0 ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Sends a message to be attached to the object. if the object is in the map then the message is added to the list, otherwise the object is firstly added to the map.

Parameters
----------
object: Standard_Transient
message: Message_Msg
gravity: Message_Gravity

Returns
-------
None
") Send;
		virtual void Send(const opencascade::handle<Standard_Transient> & object, const Message_Msg & message, const Message_Gravity gravity);

		/****************** Send ******************/
		/**** md5 signature: 0c6eb362a61683b8209d804fa3d94cbf ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Sends a message to be attached to the shape. if the shape is in the map then the message is added to the list, otherwise the shape is firstly added to the map.

Parameters
----------
shape: TopoDS_Shape
message: Message_Msg
gravity: Message_Gravity

Returns
-------
None
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
