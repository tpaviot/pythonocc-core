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

/* handles */
%wrap_handle(ShapeExtend_BasicMsgRegistrator)
%wrap_handle(ShapeExtend_ComplexCurve)
%wrap_handle(ShapeExtend_CompositeSurface)
%wrap_handle(ShapeExtend_WireData)
%wrap_handle(ShapeExtend_MsgRegistrator)
/* end handles declaration */

/* templates */
%template(ShapeExtend_DataMapOfTransientListOfMsg) NCollection_DataMap <opencascade::handle <Standard_Transient>, Message_ListOfMsg , TColStd_MapTransientHasher>;
%template(ShapeExtend_DataMapOfShapeListOfMsg) NCollection_DataMap <TopoDS_Shape , Message_ListOfMsg , TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <opencascade::handle <Standard_Transient>, Message_ListOfMsg , TColStd_MapTransientHasher> ShapeExtend_DataMapOfTransientListOfMsg;
typedef NCollection_DataMap <opencascade::handle <Standard_Transient>, Message_ListOfMsg , TColStd_MapTransientHasher>::Iterator ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg;
typedef NCollection_DataMap <TopoDS_Shape , Message_ListOfMsg , TopTools_ShapeMapHasher> ShapeExtend_DataMapOfShapeListOfMsg;
typedef NCollection_DataMap <TopoDS_Shape , Message_ListOfMsg , TopTools_ShapeMapHasher>::Iterator ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg;
/* end typedefs declaration */

/********************
* class ShapeExtend *
********************/
%rename(shapeextend) ShapeExtend;
class ShapeExtend {
	public:
		/****************** DecodeStatus ******************/
		%feature("compactdefaultargs") DecodeStatus;
		%feature("autodoc", "* Tells if a bit flag contains bit corresponding to enumerated status
	:param flag:
	:type flag: int
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") DecodeStatus;
		static Standard_Boolean DecodeStatus (const Standard_Integer flag,const ShapeExtend_Status status);

		/****************** EncodeStatus ******************/
		%feature("compactdefaultargs") EncodeStatus;
		%feature("autodoc", "* Encodes status (enumeration) to a bit flag
	:param status:
	:type status: ShapeExtend_Status
	:rtype: int") EncodeStatus;
		static Standard_Integer EncodeStatus (const ShapeExtend_Status status);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Inits using of ShapeExtend. Currently, loads messages output by ShapeHealing algorithms.
	:rtype: void") Init;
		static void Init ();

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
		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "* Sends a message to be attached to the object. Object can be of any type interpreted by redefined MsgRegistrator.
	:param object:
	:type object: Standard_Transient
	:param message:
	:type message: Message_Msg
	:param gravity:
	:type gravity: Message_Gravity
	:rtype: void") Send;
		virtual void Send (const opencascade::handle<Standard_Transient> & object,const Message_Msg & message,const Message_Gravity gravity);

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "* Sends a message to be attached to the shape.
	:param shape:
	:type shape: TopoDS_Shape
	:param message:
	:type message: Message_Msg
	:param gravity:
	:type gravity: Message_Gravity
	:rtype: void") Send;
		virtual void Send (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity);

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "* Calls Send method with Null Transient.
	:param message:
	:type message: Message_Msg
	:param gravity:
	:type gravity: Message_Gravity
	:rtype: void") Send;
		virtual void Send (const Message_Msg & message,const Message_Gravity gravity);

		/****************** ShapeExtend_BasicMsgRegistrator ******************/
		%feature("compactdefaultargs") ShapeExtend_BasicMsgRegistrator;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeExtend_BasicMsgRegistrator;
		 ShapeExtend_BasicMsgRegistrator ();

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
		%feature("autodoc", "* Checks geometrical connectivity of the curves, including closure (sets fields myClosed)
	:param Preci:
	:type Preci: float
	:rtype: bool") CheckConnectivity;
		Standard_Boolean CheckConnectivity (const Standard_Real Preci);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Returns GeomAbs_C0
	:rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns curve given by its index
	:param index:
	:type index: int
	:rtype: opencascade::handle<Geom_Curve>") Curve;
		virtual const opencascade::handle<Geom_Curve> & Curve (const Standard_Integer index);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Returns point at parameter U. Finds appropriate curve and local parameter on it.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void") D1;
		virtual void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void") D2;
		virtual void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void") D3;
		virtual void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Integer N);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* Returns 0
	:rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** GetScaleFactor ******************/
		%feature("compactdefaultargs") GetScaleFactor;
		%feature("autodoc", "* Returns scale factor for recomputing of deviatives.
	:param ind:
	:type ind: int
	:rtype: float") GetScaleFactor;
		virtual Standard_Real GetScaleFactor (const Standard_Integer ind);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "* Returns False if N > 0
	:param N:
	:type N: int
	:rtype: bool") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Returns True if the curve is closed
	:rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "* Returns False
	:rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* Returns 1
	:rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** LocalToGlobal ******************/
		%feature("compactdefaultargs") LocalToGlobal;
		%feature("autodoc", "* Returns global parameter for the whole curve according to the segment and local parameter on it
	:param index:
	:type index: int
	:param Ulocal:
	:type Ulocal: float
	:rtype: float") LocalToGlobal;
		virtual Standard_Real LocalToGlobal (const Standard_Integer index,const Standard_Real Ulocal);

		/****************** LocateParameter ******************/
		%feature("compactdefaultargs") LocateParameter;
		%feature("autodoc", "* Returns number of the curve for the given parameter U and local paramete r UOut for the found curve
	:param U:
	:type U: float
	:param UOut:
	:type UOut: float
	:rtype: int") LocateParameter;
		virtual Standard_Integer LocateParameter (const Standard_Real U,Standard_Real &OutValue);

		/****************** NbCurves ******************/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "* Returns number of curves
	:rtype: int") NbCurves;
		virtual Standard_Integer NbCurves ();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "* Returns 1 - U
	:param U:
	:type U: float
	:rtype: float") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Applies transformation to each curve
	:param T:
	:type T: gp_Trsf
	:rtype: void") Transform;
		virtual void Transform (const gp_Trsf & T);

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
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "* Returns the parametric bounds of grid
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: void") Bounds;
		virtual void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CheckConnectivity ******************/
		%feature("compactdefaultargs") CheckConnectivity;
		%feature("autodoc", "* Checks geometrical connectivity of the patches, including closedness (sets fields muUClosed and myVClosed)
	:param prec:
	:type prec: float
	:rtype: bool") CheckConnectivity;
		Standard_Boolean CheckConnectivity (const Standard_Real prec);

		/****************** ComputeJointValues ******************/
		%feature("compactdefaultargs") ComputeJointValues;
		%feature("autodoc", "* Computes Joint values according to parameter
	:param param: default value is ShapeExtend_Natural
	:type param: ShapeExtend_Parametrisation
	:rtype: None") ComputeJointValues;
		void ComputeJointValues (const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* returns C0
	:rtype: GeomAbs_Shape") Continuity;
		virtual GeomAbs_Shape Continuity ();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Returns a copy of the surface
	:rtype: opencascade::handle<Geom_Geometry>") Copy;
		virtual opencascade::handle<Geom_Geometry> Copy ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U,V on the grid.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") D0;
		virtual void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point P and the first derivatives in the directions U and V at this point.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: void") D1;
		virtual void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point P, the first and the second derivatives in the directions U and V at this point.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:rtype: void") D2;
		virtual void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Computes the point P, the first,the second and the third derivatives in the directions U and V at this point.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:param D3U:
	:type D3U: gp_Vec
	:param D3V:
	:type D3V: gp_Vec
	:param D3UUV:
	:type D3UUV: gp_Vec
	:param D3UVV:
	:type D3UVV: gp_Vec
	:rtype: void") D3;
		virtual void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V).
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);

		/****************** GlobalToLocal ******************/
		%feature("compactdefaultargs") GlobalToLocal;
		%feature("autodoc", "* Converts global parameters UV to local parameters uv on patch i,j
	:param i:
	:type i: int
	:param j:
	:type j: int
	:param UV:
	:type UV: gp_Pnt2d
	:rtype: gp_Pnt2d") GlobalToLocal;
		gp_Pnt2d GlobalToLocal (const Standard_Integer i,const Standard_Integer j,const gp_Pnt2d & UV);

		/****************** GlobalToLocalTransformation ******************/
		%feature("compactdefaultargs") GlobalToLocalTransformation;
		%feature("autodoc", "* Computes transformation operator and uFactor descrinbing affine transformation required to convert global parameters on composite surface to local parameters on patch (i,j): uv = ( uFactor, 1. ) X Trsf * UV; NOTE: Thus Trsf contains shift and scale by V, scale by U is stored in uFact. Returns True if transformation is not an identity
	:param i:
	:type i: int
	:param j:
	:type j: int
	:param uFact:
	:type uFact: float
	:param Trsf:
	:type Trsf: gp_Trsf2d
	:rtype: bool") GlobalToLocalTransformation;
		Standard_Boolean GlobalToLocalTransformation (const Standard_Integer i,const Standard_Integer j,Standard_Real &OutValue,gp_Trsf2d & Trsf);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes by a grid of surfaces. All the Surfaces of the grid must have geometrical connectivity as stated above. If geometrical connectivity is not satisfied, method returns False. However, class is initialized even in that case. //! Last parameter defines how global parametrisation (joint values) will be computed: ShapeExtend_Natural: U1 = u11min, Ui+1 = Ui + (ui1max-ui1min), etc. ShapeExtend_Uniform: Ui = i-1, Vj = j-1 ShapeExtend_Unitary: Ui = (i-1)/Nu, Vi = (j-1)/Nv
	:param GridSurf:
	:type GridSurf: TColGeom_HArray2OfSurface
	:param param: default value is ShapeExtend_Natural
	:type param: ShapeExtend_Parametrisation
	:rtype: bool") Init;
		Standard_Boolean Init (const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf,const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes by a grid of surfaces with given global parametrisation defined by UJoints and VJoints arrays, each having langth equal to number of patches in corresponding direction + 1. Global joint values should be sorted in increasing order. All the Surfaces of the grid must have geometrical connectivity as stated above. If geometrical connectivity is not satisfied, method returns False. However, class is initialized even in that case.
	:param GridSurf:
	:type GridSurf: TColGeom_HArray2OfSurface
	:param UJoints:
	:type UJoints: TColStd_Array1OfReal
	:param VJoints:
	:type VJoints: TColStd_Array1OfReal
	:rtype: bool") Init;
		Standard_Boolean Init (const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf,const TColStd_Array1OfReal & UJoints,const TColStd_Array1OfReal & VJoints);

		/****************** IsCNu ******************/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "* returns True if N <=0
	:param N:
	:type N: int
	:rtype: bool") IsCNu;
		virtual Standard_Boolean IsCNu (const Standard_Integer N);

		/****************** IsCNv ******************/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "* returns True if N <=0
	:param N:
	:type N: int
	:rtype: bool") IsCNv;
		virtual Standard_Boolean IsCNv (const Standard_Integer N);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "* Returns True if grid is closed in U direction (i.e. connected with Precision::Confusion)
	:rtype: bool") IsUClosed;
		virtual Standard_Boolean IsUClosed ();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "* Returns False
	:rtype: bool") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic ();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "* Returns True if grid is closed in V direction (i.e. connected with Precision::Confusion)
	:rtype: bool") IsVClosed;
		virtual Standard_Boolean IsVClosed ();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "* Returns False
	:rtype: bool") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic ();

		/****************** LocalToGlobal ******************/
		%feature("compactdefaultargs") LocalToGlobal;
		%feature("autodoc", "* Converts local parameters uv on patch i,j to global parameters UV
	:param i:
	:type i: int
	:param j:
	:type j: int
	:param uv:
	:type uv: gp_Pnt2d
	:rtype: gp_Pnt2d") LocalToGlobal;
		gp_Pnt2d LocalToGlobal (const Standard_Integer i,const Standard_Integer j,const gp_Pnt2d & uv);

		/****************** LocateUParameter ******************/
		%feature("compactdefaultargs") LocateUParameter;
		%feature("autodoc", "* Returns number of col that contains given (global) parameter
	:param U:
	:type U: float
	:rtype: int") LocateUParameter;
		Standard_Integer LocateUParameter (const Standard_Real U);

		/****************** LocateUVPoint ******************/
		%feature("compactdefaultargs") LocateUVPoint;
		%feature("autodoc", "* Returns number of row and col of surface that contains given point
	:param pnt:
	:type pnt: gp_Pnt2d
	:param i:
	:type i: int
	:param j:
	:type j: int
	:rtype: None") LocateUVPoint;
		void LocateUVPoint (const gp_Pnt2d & pnt,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** LocateVParameter ******************/
		%feature("compactdefaultargs") LocateVParameter;
		%feature("autodoc", "* Returns number of row that contains given (global) parameter
	:param V:
	:type V: float
	:rtype: int") LocateVParameter;
		Standard_Integer LocateVParameter (const Standard_Real V);

		/****************** NbUPatches ******************/
		%feature("compactdefaultargs") NbUPatches;
		%feature("autodoc", "* Returns number of patches in U direction.
	:rtype: int") NbUPatches;
		Standard_Integer NbUPatches ();

		/****************** NbVPatches ******************/
		%feature("compactdefaultargs") NbVPatches;
		%feature("autodoc", "* Returns number of patches in V direction.
	:rtype: int") NbVPatches;
		Standard_Integer NbVPatches ();

		/****************** Patch ******************/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "* Returns one surface patch
	:param i:
	:type i: int
	:param j:
	:type j: int
	:rtype: opencascade::handle<Geom_Surface>") Patch;
		const opencascade::handle<Geom_Surface> & Patch (const Standard_Integer i,const Standard_Integer j);

		/****************** Patch ******************/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "* Returns one surface patch that contains given (global) parameters
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: opencascade::handle<Geom_Surface>") Patch;
		const opencascade::handle<Geom_Surface> & Patch (const Standard_Real U,const Standard_Real V);

		/****************** Patch ******************/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "* Returns one surface patch that contains given point
	:param pnt:
	:type pnt: gp_Pnt2d
	:rtype: opencascade::handle<Geom_Surface>") Patch;
		const opencascade::handle<Geom_Surface> & Patch (const gp_Pnt2d & pnt);

		/****************** Patches ******************/
		%feature("compactdefaultargs") Patches;
		%feature("autodoc", "* Returns grid of surfaces
	:rtype: opencascade::handle<TColGeom_HArray2OfSurface>") Patches;
		const opencascade::handle<TColGeom_HArray2OfSurface> & Patches ();

		/****************** SetUFirstValue ******************/
		%feature("compactdefaultargs") SetUFirstValue;
		%feature("autodoc", "* Changes starting value for global U parametrisation (all other joint values are shifted accordingly)
	:param UFirst:
	:type UFirst: float
	:rtype: None") SetUFirstValue;
		void SetUFirstValue (const Standard_Real UFirst);

		/****************** SetUJointValues ******************/
		%feature("compactdefaultargs") SetUJointValues;
		%feature("autodoc", "* Sets the array of U values corresponding to joint points, which define global parametrisation of the surface. Number of values in array should be equal to NbUPatches()+1. All the values should be sorted in increasing order. If this is not satisfied, does nothing and returns False.
	:param UJoints:
	:type UJoints: TColStd_Array1OfReal
	:rtype: bool") SetUJointValues;
		Standard_Boolean SetUJointValues (const TColStd_Array1OfReal & UJoints);

		/****************** SetVFirstValue ******************/
		%feature("compactdefaultargs") SetVFirstValue;
		%feature("autodoc", "* Changes starting value for global V parametrisation (all other joint values are shifted accordingly)
	:param VFirst:
	:type VFirst: float
	:rtype: None") SetVFirstValue;
		void SetVFirstValue (const Standard_Real VFirst);

		/****************** SetVJointValues ******************/
		%feature("compactdefaultargs") SetVJointValues;
		%feature("autodoc", "* Sets the array of V values corresponding to joint points, which define global parametrisation of the surface Number of values in array should be equal to NbVPatches()+1. All the values should be sorted in increasing order. If this is not satisfied, does nothing and returns False.
	:param VJoints:
	:type VJoints: TColStd_Array1OfReal
	:rtype: bool") SetVJointValues;
		Standard_Boolean SetVJointValues (const TColStd_Array1OfReal & VJoints);

		/****************** ShapeExtend_CompositeSurface ******************/
		%feature("compactdefaultargs") ShapeExtend_CompositeSurface;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface ();

		/****************** ShapeExtend_CompositeSurface ******************/
		%feature("compactdefaultargs") ShapeExtend_CompositeSurface;
		%feature("autodoc", "* Initializes by a grid of surfaces (calls Init()).
	:param GridSurf:
	:type GridSurf: TColGeom_HArray2OfSurface
	:param param: default value is ShapeExtend_Natural
	:type param: ShapeExtend_Parametrisation
	:rtype: None") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface (const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf,const ShapeExtend_Parametrisation param = ShapeExtend_Natural);

		/****************** ShapeExtend_CompositeSurface ******************/
		%feature("compactdefaultargs") ShapeExtend_CompositeSurface;
		%feature("autodoc", "* Initializes by a grid of surfaces (calls Init()).
	:param GridSurf:
	:type GridSurf: TColGeom_HArray2OfSurface
	:param UJoints:
	:type UJoints: TColStd_Array1OfReal
	:param VJoints:
	:type VJoints: TColStd_Array1OfReal
	:rtype: None") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface (const opencascade::handle<TColGeom_HArray2OfSurface> & GridSurf,const TColStd_Array1OfReal & UJoints,const TColStd_Array1OfReal & VJoints);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Applies transformation to all the patches
	:param T:
	:type T: gp_Trsf
	:rtype: void") Transform;
		virtual void Transform (const gp_Trsf & T);

		/****************** UGlobalToLocal ******************/
		%feature("compactdefaultargs") UGlobalToLocal;
		%feature("autodoc", "* Converts global parameter U to local parameter u on patch i,j
	:param i:
	:type i: int
	:param j:
	:type j: int
	:param U:
	:type U: float
	:rtype: float") UGlobalToLocal;
		Standard_Real UGlobalToLocal (const Standard_Integer i,const Standard_Integer j,const Standard_Real U);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "* NOT IMPLEMENTED (returns Null curve)
	:param U:
	:type U: float
	:rtype: opencascade::handle<Geom_Curve>") UIso;
		virtual opencascade::handle<Geom_Curve> UIso (const Standard_Real U);

		/****************** UJointValue ******************/
		%feature("compactdefaultargs") UJointValue;
		%feature("autodoc", "* Returns i-th joint value in U direction (1-st is global Umin, (NbUPatches()+1)-th is global Umax on the composite surface)
	:param i:
	:type i: int
	:rtype: float") UJointValue;
		Standard_Real UJointValue (const Standard_Integer i);

		/****************** UJointValues ******************/
		%feature("compactdefaultargs") UJointValues;
		%feature("autodoc", "* Returns the array of U values corresponding to joint points between patches as well as to start and end points, which define global parametrisation of the surface
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") UJointValues;
		opencascade::handle<TColStd_HArray1OfReal> UJointValues ();

		/****************** ULocalToGlobal ******************/
		%feature("compactdefaultargs") ULocalToGlobal;
		%feature("autodoc", "* Converts local parameter u on patch i,j to global parameter U
	:param i:
	:type i: int
	:param j:
	:type j: int
	:param u:
	:type u: float
	:rtype: float") ULocalToGlobal;
		Standard_Real ULocalToGlobal (const Standard_Integer i,const Standard_Integer j,const Standard_Real u);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "* NOT IMPLEMENTED (does nothing)
	:rtype: void") UReverse;
		virtual void UReverse ();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "* Returns U
	:param U:
	:type U: float
	:rtype: float") UReversedParameter;
		virtual Standard_Real UReversedParameter (const Standard_Real U);

		/****************** VGlobalToLocal ******************/
		%feature("compactdefaultargs") VGlobalToLocal;
		%feature("autodoc", "* Converts global parameter V to local parameter v on patch i,j
	:param i:
	:type i: int
	:param j:
	:type j: int
	:param V:
	:type V: float
	:rtype: float") VGlobalToLocal;
		Standard_Real VGlobalToLocal (const Standard_Integer i,const Standard_Integer j,const Standard_Real V);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "* NOT IMPLEMENTED (returns Null curve)
	:param V:
	:type V: float
	:rtype: opencascade::handle<Geom_Curve>") VIso;
		virtual opencascade::handle<Geom_Curve> VIso (const Standard_Real V);

		/****************** VJointValue ******************/
		%feature("compactdefaultargs") VJointValue;
		%feature("autodoc", "* Returns j-th joint value in V direction (1-st is global Vmin, (NbVPatches()+1)-th is global Vmax on the composite surface)
	:param j:
	:type j: int
	:rtype: float") VJointValue;
		Standard_Real VJointValue (const Standard_Integer j);

		/****************** VJointValues ******************/
		%feature("compactdefaultargs") VJointValues;
		%feature("autodoc", "* Returns the array of V values corresponding to joint points between patches as well as to start and end points, which define global parametrisation of the surface
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") VJointValues;
		opencascade::handle<TColStd_HArray1OfReal> VJointValues ();

		/****************** VLocalToGlobal ******************/
		%feature("compactdefaultargs") VLocalToGlobal;
		%feature("autodoc", "* Converts local parameter v on patch i,j to global parameter V
	:param i:
	:type i: int
	:param j:
	:type j: int
	:param v:
	:type v: float
	:rtype: float") VLocalToGlobal;
		Standard_Real VLocalToGlobal (const Standard_Integer i,const Standard_Integer j,const Standard_Real v);

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "* NOT IMPLEMENTED (does nothing)
	:rtype: void") VReverse;
		virtual void VReverse ();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "* Returns V
	:param V:
	:type V: float
	:rtype: float") VReversedParameter;
		virtual Standard_Real VReversedParameter (const Standard_Real V);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter pnt on the grid.
	:param pnt:
	:type pnt: gp_Pnt2d
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const gp_Pnt2d & pnt);

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
		/****************** CompoundFromSeq ******************/
		%feature("compactdefaultargs") CompoundFromSeq;
		%feature("autodoc", "* Converts a sequence of Shapes to a Compound
	:param seqval:
	:type seqval: TopTools_HSequenceOfShape
	:rtype: TopoDS_Shape") CompoundFromSeq;
		TopoDS_Shape CompoundFromSeq (const opencascade::handle<TopTools_HSequenceOfShape> & seqval);

		/****************** DispatchList ******************/
		%feature("compactdefaultargs") DispatchList;
		%feature("autodoc", "* Dispatches starting list of shapes according to their type, to the appropriate resulting lists For each of these lists, if it is null, it is firstly created else, new items are appended to the already existing ones
	:param list:
	:type list: TopTools_HSequenceOfShape
	:param vertices:
	:type vertices: TopTools_HSequenceOfShape
	:param edges:
	:type edges: TopTools_HSequenceOfShape
	:param wires:
	:type wires: TopTools_HSequenceOfShape
	:param faces:
	:type faces: TopTools_HSequenceOfShape
	:param shells:
	:type shells: TopTools_HSequenceOfShape
	:param solids:
	:type solids: TopTools_HSequenceOfShape
	:param compsols:
	:type compsols: TopTools_HSequenceOfShape
	:param compounds:
	:type compounds: TopTools_HSequenceOfShape
	:rtype: None") DispatchList;
		void DispatchList (const opencascade::handle<TopTools_HSequenceOfShape> & list,opencascade::handle<TopTools_HSequenceOfShape> & vertices,opencascade::handle<TopTools_HSequenceOfShape> & edges,opencascade::handle<TopTools_HSequenceOfShape> & wires,opencascade::handle<TopTools_HSequenceOfShape> & faces,opencascade::handle<TopTools_HSequenceOfShape> & shells,opencascade::handle<TopTools_HSequenceOfShape> & solids,opencascade::handle<TopTools_HSequenceOfShape> & compsols,opencascade::handle<TopTools_HSequenceOfShape> & compounds);

		/****************** ListFromSeq ******************/
		%feature("compactdefaultargs") ListFromSeq;
		%feature("autodoc", "* Converts a Sequence of Shapes to a List of Shapes <clear> if True (D), commands the list to start from scratch else, the list is cumulated
	:param seqval:
	:type seqval: TopTools_HSequenceOfShape
	:param lisval:
	:type lisval: TopTools_ListOfShape
	:param clear: default value is Standard_True
	:type clear: bool
	:rtype: None") ListFromSeq;
		void ListFromSeq (const opencascade::handle<TopTools_HSequenceOfShape> & seqval,TopTools_ListOfShape & lisval,const Standard_Boolean clear = Standard_True);

		/****************** SeqFromCompound ******************/
		%feature("compactdefaultargs") SeqFromCompound;
		%feature("autodoc", "* Converts a Compound to a list of Shapes if <comp> is not a compound, the list contains only <comp> if <comp> is Null, the list is empty if <comp> is a Compound, its sub-shapes are put into the list then if <expcomp> is True, if a sub-shape is a Compound, it is not put to the list but its sub-shapes are (recursive)
	:param comp:
	:type comp: TopoDS_Shape
	:param expcomp:
	:type expcomp: bool
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>") SeqFromCompound;
		opencascade::handle<TopTools_HSequenceOfShape> SeqFromCompound (const TopoDS_Shape & comp,const Standard_Boolean expcomp);

		/****************** SeqFromList ******************/
		%feature("compactdefaultargs") SeqFromList;
		%feature("autodoc", "* Converts a List of Shapes to a Sequence of Shapes
	:param lisval:
	:type lisval: TopTools_ListOfShape
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>") SeqFromList;
		opencascade::handle<TopTools_HSequenceOfShape> SeqFromList (const TopTools_ListOfShape & lisval);

		/****************** ShapeExtend_Explorer ******************/
		%feature("compactdefaultargs") ShapeExtend_Explorer;
		%feature("autodoc", "* Creates an object Explorer
	:rtype: None") ShapeExtend_Explorer;
		 ShapeExtend_Explorer ();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "* Returns the type of a Shape: true type if <compound> is False If <compound> is True and <shape> is a Compound, iterates on its items. If all are of the same type, returns this type. Else, returns COMPOUND. If it is empty, returns SHAPE For a Null Shape, returns SHAPE
	:param shape:
	:type shape: TopoDS_Shape
	:param compound:
	:type compound: bool
	:rtype: TopAbs_ShapeEnum") ShapeType;
		TopAbs_ShapeEnum ShapeType (const TopoDS_Shape & shape,const Standard_Boolean compound);

		/****************** SortedCompound ******************/
		%feature("compactdefaultargs") SortedCompound;
		%feature("autodoc", "* Builds a COMPOUND from the given shape. It explores the shape level by level, according to the <explore> argument. If <explore> is False, only COMPOUND items are explored, else all items are. The following shapes are added to resulting compound: - shapes which comply to <type> - if <type> is WIRE, considers also free edges (and makes wires) - if <type> is SHELL, considers also free faces (and makes shells) If <compound> is True, gathers items in compounds which correspond to starting COMPOUND,SOLID or SHELL containers, or items directly contained in a Compound
	:param shape:
	:type shape: TopoDS_Shape
	:param type:
	:type type: TopAbs_ShapeEnum
	:param explore:
	:type explore: bool
	:param compound:
	:type compound: bool
	:rtype: TopoDS_Shape") SortedCompound;
		TopoDS_Shape SortedCompound (const TopoDS_Shape & shape,const TopAbs_ShapeEnum type,const Standard_Boolean explore,const Standard_Boolean compound);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds an edge to a wire, being defined (not yet ended) This is the plain, basic, function to add an edge <num> = 0 (D): Appends at end <num> = 1: Preprends at start else, Insert before <num> Remark : Null Edge is simply ignored
	:param edge:
	:type edge: TopoDS_Edge
	:param atnum: default value is 0
	:type atnum: int
	:rtype: None") Add;
		void Add (const TopoDS_Edge & edge,const Standard_Integer atnum = 0);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds an entire wire, considered as a list of edges Remark : The wire is assumed to be ordered (TopoDS_Iterator is used)
	:param wire:
	:type wire: TopoDS_Wire
	:param atnum: default value is 0
	:type atnum: int
	:rtype: None") Add;
		void Add (const TopoDS_Wire & wire,const Standard_Integer atnum = 0);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a wire in the form of WireData
	:param wire:
	:type wire: ShapeExtend_WireData
	:param atnum: default value is 0
	:type atnum: int
	:rtype: None") Add;
		void Add (const opencascade::handle<ShapeExtend_WireData> & wire,const Standard_Integer atnum = 0);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds an edge or a wire invoking corresponding method Add
	:param shape:
	:type shape: TopoDS_Shape
	:param atnum: default value is 0
	:type atnum: int
	:rtype: None") Add;
		void Add (const TopoDS_Shape & shape,const Standard_Integer atnum = 0);

		/****************** AddOriented ******************/
		%feature("compactdefaultargs") AddOriented;
		%feature("autodoc", "* Adds an edge to start or end of <self>, according to <mode> 0: at end, as direct 1: at end, as reversed 2: at start, as direct 3: at start, as reversed < 0: no adding
	:param edge:
	:type edge: TopoDS_Edge
	:param mode:
	:type mode: int
	:rtype: None") AddOriented;
		void AddOriented (const TopoDS_Edge & edge,const Standard_Integer mode);

		/****************** AddOriented ******************/
		%feature("compactdefaultargs") AddOriented;
		%feature("autodoc", "* Adds a wire to start or end of <self>, according to <mode> 0: at end, as direct 1: at end, as reversed 2: at start, as direct 3: at start, as reversed < 0: no adding
	:param wire:
	:type wire: TopoDS_Wire
	:param mode:
	:type mode: int
	:rtype: None") AddOriented;
		void AddOriented (const TopoDS_Wire & wire,const Standard_Integer mode);

		/****************** AddOriented ******************/
		%feature("compactdefaultargs") AddOriented;
		%feature("autodoc", "* Adds an edge or a wire invoking corresponding method AddOriented
	:param shape:
	:type shape: TopoDS_Shape
	:param mode:
	:type mode: int
	:rtype: None") AddOriented;
		void AddOriented (const TopoDS_Shape & shape,const Standard_Integer mode);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears data about Wire.
	:rtype: None") Clear;
		void Clear ();

		/****************** ComputeSeams ******************/
		%feature("compactdefaultargs") ComputeSeams;
		%feature("autodoc", "* Computes the list of seam edges By default (direct call), computing is enforced For indirect call (from IsSeam) it is redone only if not yet already done or if the list of edges has changed Remark : A Seam Edge is an Edge present twice in the list, once as FORWARD and once as REVERSED Each sense has its own PCurve, the one for FORWARD must be set in first
	:param enforce: default value is Standard_True
	:type enforce: bool
	:rtype: None") ComputeSeams;
		void ComputeSeams (const Standard_Boolean enforce = Standard_True);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns <num>th Edge
	:param num:
	:type num: int
	:rtype: TopoDS_Edge") Edge;
		TopoDS_Edge Edge (const Standard_Integer num);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Returns the index of the edge If the edge is a seam the orientation is also checked Returns 0 if the edge is not found in the list
	:param edge:
	:type edge: TopoDS_Edge
	:rtype: int") Index;
		Standard_Integer Index (const TopoDS_Edge & edge);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Copies data from another WireData
	:param other:
	:type other: ShapeExtend_WireData
	:rtype: None") Init;
		void Init (const opencascade::handle<ShapeExtend_WireData> & other);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Loads an already existing wire If <chained> is True (default), edges are added in the sequence as they are explored by TopoDS_Iterator Else, if <chained> is False, wire is explored by BRepTools_WireExplorer and it is guaranteed that edges will be sequencially connected. Remark : In the latter case it can happen that not all edges will be found (because of limitations of BRepTools_WireExplorer for disconnected wires and wires with seam edges).
	:param wire:
	:type wire: TopoDS_Wire
	:param chained: default value is Standard_True
	:type chained: bool
	:param theManifoldMode: default value is Standard_True
	:type theManifoldMode: bool
	:rtype: bool") Init;
		Standard_Boolean Init (const TopoDS_Wire & wire,const Standard_Boolean chained = Standard_True,const Standard_Boolean theManifoldMode = Standard_True);

		/****************** IsSeam ******************/
		%feature("compactdefaultargs") IsSeam;
		%feature("autodoc", "* Tells if an Edge is seam (see ComputeSeams) An edge is considered as seam if it presents twice in the edge list, once as FORWARD and once as REVERSED.
	:param num:
	:type num: int
	:rtype: bool") IsSeam;
		Standard_Boolean IsSeam (const Standard_Integer num);


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
		%feature("autodoc", "* Returns the count of currently recorded edges
	:rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** NbNonManifoldEdges ******************/
		%feature("compactdefaultargs") NbNonManifoldEdges;
		%feature("autodoc", "* Returns the count of currently recorded non-manifold edges
	:rtype: int") NbNonManifoldEdges;
		Standard_Integer NbNonManifoldEdges ();

		/****************** NonmanifoldEdge ******************/
		%feature("compactdefaultargs") NonmanifoldEdge;
		%feature("autodoc", "* Returns <num>th nonmanifold Edge
	:param num:
	:type num: int
	:rtype: TopoDS_Edge") NonmanifoldEdge;
		TopoDS_Edge NonmanifoldEdge (const Standard_Integer num);

		/****************** NonmanifoldEdges ******************/
		%feature("compactdefaultargs") NonmanifoldEdges;
		%feature("autodoc", "* Returns sequence of non-manifold edges This sequence can be not empty if wire data set in manifold mode but initial wire has INTERNAL orientation or contains INTERNAL edges
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>") NonmanifoldEdges;
		opencascade::handle<TopTools_HSequenceOfShape> NonmanifoldEdges ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes an Edge, given its rank. By default removes the last edge.
	:param num: default value is 0
	:type num: int
	:rtype: None") Remove;
		void Remove (const Standard_Integer num = 0);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Reverses the sense of the list and the orientation of each Edge This method should be called when either wire has no seam edges or face is not available
	:rtype: None") Reverse;
		void Reverse ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Reverses the sense of the list and the orientation of each Edge The face is necessary for swapping pcurves for seam edges (first pcurve corresponds to orientation FORWARD, and second to REVERSED; when edge is reversed, pcurves must be swapped) If face is NULL, no swapping is performed
	:param face:
	:type face: TopoDS_Face
	:rtype: None") Reverse;
		void Reverse (const TopoDS_Face & face);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Replaces an edge at the given rank number <num> with new one. Default is last edge (<num> = 0).
	:param edge:
	:type edge: TopoDS_Edge
	:param num: default value is 0
	:type num: int
	:rtype: None") Set;
		void Set (const TopoDS_Edge & edge,const Standard_Integer num = 0);

		/****************** SetDegeneratedLast ******************/
		%feature("compactdefaultargs") SetDegeneratedLast;
		%feature("autodoc", "* When the wire contains at least one degenerated edge, sets it as last one Note : It is useful to process pcurves, for instance, while the pcurve of a DGNR may not be computed from its 3D part (there is none) it is computed after the other edges have been computed and chained.
	:rtype: None") SetDegeneratedLast;
		void SetDegeneratedLast ();

		/****************** SetLast ******************/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "* Does a circular permutation in order to set <num>th edge last
	:param num:
	:type num: int
	:rtype: None") SetLast;
		void SetLast (const Standard_Integer num);

		/****************** ShapeExtend_WireData ******************/
		%feature("compactdefaultargs") ShapeExtend_WireData;
		%feature("autodoc", "* Empty constructor, creates empty wire with no edges
	:rtype: None") ShapeExtend_WireData;
		 ShapeExtend_WireData ();

		/****************** ShapeExtend_WireData ******************/
		%feature("compactdefaultargs") ShapeExtend_WireData;
		%feature("autodoc", "* Constructor initializing the data from TopoDS_Wire. Calls Init(wire,chained).
	:param wire:
	:type wire: TopoDS_Wire
	:param chained: default value is Standard_True
	:type chained: bool
	:param theManifoldMode: default value is Standard_True
	:type theManifoldMode: bool
	:rtype: None") ShapeExtend_WireData;
		 ShapeExtend_WireData (const TopoDS_Wire & wire,const Standard_Boolean chained = Standard_True,const Standard_Boolean theManifoldMode = Standard_True);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "* Makes TopoDS_Wire using BRep_Builder (just creates the TopoDS_Wire object and adds all edges into it). This method should be called when the wire is correct (for example, after successful fixes by ShapeFix_Wire) and adjacent edges share common vertices. In case if adjacent edges do not share the same vertices the resulting TopoDS_Wire will be invalid.
	:rtype: TopoDS_Wire") Wire;
		TopoDS_Wire Wire ();

		/****************** WireAPIMake ******************/
		%feature("compactdefaultargs") WireAPIMake;
		%feature("autodoc", "* Makes TopoDS_Wire using BRepAPI_MakeWire. Class BRepAPI_MakeWire merges geometrically coincided vertices and can disturb correct order of edges in the wire. If this class fails, null shape is returned.
	:rtype: TopoDS_Wire") WireAPIMake;
		TopoDS_Wire WireAPIMake ();

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
		/****************** MapShape ******************/
		%feature("compactdefaultargs") MapShape;
		%feature("autodoc", "* Returns a Map of shapes and message list
	:rtype: ShapeExtend_DataMapOfShapeListOfMsg") MapShape;
		const ShapeExtend_DataMapOfShapeListOfMsg & MapShape ();

		/****************** MapTransient ******************/
		%feature("compactdefaultargs") MapTransient;
		%feature("autodoc", "* Returns a Map of objects and message list
	:rtype: ShapeExtend_DataMapOfTransientListOfMsg") MapTransient;
		const ShapeExtend_DataMapOfTransientListOfMsg & MapTransient ();

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "* Sends a message to be attached to the object. If the object is in the map then the message is added to the list, otherwise the object is firstly added to the map.
	:param object:
	:type object: Standard_Transient
	:param message:
	:type message: Message_Msg
	:param gravity:
	:type gravity: Message_Gravity
	:rtype: void") Send;
		virtual void Send (const opencascade::handle<Standard_Transient> & object,const Message_Msg & message,const Message_Gravity gravity);

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "* Sends a message to be attached to the shape. If the shape is in the map then the message is added to the list, otherwise the shape is firstly added to the map.
	:param shape:
	:type shape: TopoDS_Shape
	:param message:
	:type message: Message_Msg
	:param gravity:
	:type gravity: Message_Gravity
	:rtype: void") Send;
		virtual void Send (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity);

		/****************** ShapeExtend_MsgRegistrator ******************/
		%feature("compactdefaultargs") ShapeExtend_MsgRegistrator;
		%feature("autodoc", "* Creates an object.
	:rtype: None") ShapeExtend_MsgRegistrator;
		 ShapeExtend_MsgRegistrator ();

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
