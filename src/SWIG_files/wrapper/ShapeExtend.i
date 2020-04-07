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
		%feature("compactdefaultargs") ShapeExtend_BasicMsgRegistrator;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeExtend_BasicMsgRegistrator;
		 ShapeExtend_BasicMsgRegistrator();

		/****************** Send ******************/
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
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_c0.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** Curve ******************/
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
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns 0.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** GetScaleFactor ******************/
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the curve is closed.

Returns
-------
bool
") IsClosed;
		virtual Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns 1.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** LocalToGlobal ******************/
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
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Returns number of curves.

Returns
-------
int
") NbCurves;
		virtual Standard_Integer NbCurves();

		/****************** ReversedParameter ******************/
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
		%feature("compactdefaultargs") ShapeExtend_CompositeSurface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface();

		/****************** ShapeExtend_CompositeSurface ******************/
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
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns c0.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of the surface.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		virtual opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
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
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Returns true if grid is closed in u direction (i.e. connected with precision::confusion).

Returns
-------
bool
") IsUClosed;
		virtual Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Returns true if grid is closed in v direction (i.e. connected with precision::confusion).

Returns
-------
bool
") IsVClosed;
		virtual Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** LocalToGlobal ******************/
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
		%feature("compactdefaultargs") NbUPatches;
		%feature("autodoc", "Returns number of patches in u direction.

Returns
-------
int
") NbUPatches;
		Standard_Integer NbUPatches();

		/****************** NbVPatches ******************/
		%feature("compactdefaultargs") NbVPatches;
		%feature("autodoc", "Returns number of patches in v direction.

Returns
-------
int
") NbVPatches;
		Standard_Integer NbVPatches();

		/****************** Patch ******************/
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
		%feature("compactdefaultargs") Patches;
		%feature("autodoc", "Returns grid of surfaces.

Returns
-------
opencascade::handle<TColGeom_HArray2OfSurface>
") Patches;
		const opencascade::handle<TColGeom_HArray2OfSurface> & Patches();

		/****************** SetUFirstValue ******************/
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
		%feature("compactdefaultargs") UJointValues;
		%feature("autodoc", "Returns the array of u values corresponding to joint points between patches as well as to start and end points, which define global parametrisation of the surface.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") UJointValues;
		opencascade::handle<TColStd_HArray1OfReal> UJointValues();

		/****************** ULocalToGlobal ******************/
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
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Not implemented (does nothing).

Returns
-------
None
") UReverse;
		virtual void UReverse();

		/****************** UReversedParameter ******************/
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
		%feature("compactdefaultargs") VJointValues;
		%feature("autodoc", "Returns the array of v values corresponding to joint points between patches as well as to start and end points, which define global parametrisation of the surface.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") VJointValues;
		opencascade::handle<TColStd_HArray1OfReal> VJointValues();

		/****************** VLocalToGlobal ******************/
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
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Not implemented (does nothing).

Returns
-------
None
") VReverse;
		virtual void VReverse();

		/****************** VReversedParameter ******************/
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
		%feature("compactdefaultargs") ShapeExtend_Explorer;
		%feature("autodoc", "Creates an object explorer.

Returns
-------
None
") ShapeExtend_Explorer;
		 ShapeExtend_Explorer();

		/****************** CompoundFromSeq ******************/
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
		%feature("compactdefaultargs") ShapeExtend_WireData;
		%feature("autodoc", "Empty constructor, creates empty wire with no edges.

Returns
-------
None
") ShapeExtend_WireData;
		 ShapeExtend_WireData();

		/****************** ShapeExtend_WireData ******************/
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears data about wire.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ComputeSeams ******************/
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
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the count of currently recorded edges.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** NbNonManifoldEdges ******************/
		%feature("compactdefaultargs") NbNonManifoldEdges;
		%feature("autodoc", "Returns the count of currently recorded non-manifold edges.

Returns
-------
int
") NbNonManifoldEdges;
		Standard_Integer NbNonManifoldEdges();

		/****************** NonmanifoldEdge ******************/
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
		%feature("compactdefaultargs") NonmanifoldEdges;
		%feature("autodoc", "Returns sequence of non-manifold edges this sequence can be not empty if wire data set in manifold mode but initial wire has internal orientation or contains internal edges.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") NonmanifoldEdges;
		opencascade::handle<TopTools_HSequenceOfShape> NonmanifoldEdges();

		/****************** Remove ******************/
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
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the sense of the list and the orientation of each edge this method should be called when either wire has no seam edges or face is not available.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reverse ******************/
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
		%feature("compactdefaultargs") SetDegeneratedLast;
		%feature("autodoc", "When the wire contains at least one degenerated edge, sets it as last one note : it is useful to process pcurves, for instance, while the pcurve of a dgnr may not be computed from its 3d part (there is none) it is computed after the other edges have been computed and chained.

Returns
-------
None
") SetDegeneratedLast;
		void SetDegeneratedLast();

		/****************** SetLast ******************/
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
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Makes topods_wire using brep_builder (just creates the topods_wire object and adds all edges into it). this method should be called when the wire is correct (for example, after successful fixes by shapefix_wire) and adjacent edges share common vertices. in case if adjacent edges do not share the same vertices the resulting topods_wire will be invalid.

Returns
-------
TopoDS_Wire
") Wire;
		TopoDS_Wire Wire();

		/****************** WireAPIMake ******************/
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
		%feature("compactdefaultargs") ShapeExtend_MsgRegistrator;
		%feature("autodoc", "Creates an object.

Returns
-------
None
") ShapeExtend_MsgRegistrator;
		 ShapeExtend_MsgRegistrator();

		/****************** MapShape ******************/
		%feature("compactdefaultargs") MapShape;
		%feature("autodoc", "Returns a map of shapes and message list.

Returns
-------
ShapeExtend_DataMapOfShapeListOfMsg
") MapShape;
		const ShapeExtend_DataMapOfShapeListOfMsg & MapShape();

		/****************** MapTransient ******************/
		%feature("compactdefaultargs") MapTransient;
		%feature("autodoc", "Returns a map of objects and message list.

Returns
-------
ShapeExtend_DataMapOfTransientListOfMsg
") MapTransient;
		const ShapeExtend_DataMapOfTransientListOfMsg & MapTransient();

		/****************** Send ******************/
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
