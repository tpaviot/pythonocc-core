/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") ShapeExtend

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include ShapeExtend_headers.i

/* typedefs */
/* end typedefs declaration */

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

%rename(shapeextend) ShapeExtend;
%nodefaultctor ShapeExtend;
class ShapeExtend {
	public:
		%feature("autodoc", "	* Inits using of ShapeExtend. Currently, loads messages output by ShapeHealing algorithms.

	:rtype: void
") Init;
		static void Init ();
		%feature("autodoc", "	* Encodes status (enumeration) to a bit flag

	:param status:
	:type status: ShapeExtend_Status
	:rtype: int
") EncodeStatus;
		static Standard_Integer EncodeStatus (const ShapeExtend_Status status);
		%feature("autodoc", "	* Tells if a bit flag contains bit corresponding to enumerated status

	:param flag:
	:type flag: Standard_Integer
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") DecodeStatus;
		static Standard_Boolean DecodeStatus (const Standard_Integer flag,const ShapeExtend_Status status);
};


%feature("shadow") ShapeExtend::~ShapeExtend %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeExtend_BasicMsgRegistrator;
class ShapeExtend_BasicMsgRegistrator : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeExtend_BasicMsgRegistrator;
		 ShapeExtend_BasicMsgRegistrator ();
		%feature("autodoc", "	* Sends a message to be attached to the object. Object can be of any type interpreted by redefined MsgRegistrator.

	:param object:
	:type object: Handle_Standard_Transient &
	:param message:
	:type message: Message_Msg &
	:param gravity:
	:type gravity: Message_Gravity
	:rtype: void
") Send;
		virtual void Send (const Handle_Standard_Transient & object,const Message_Msg & message,const Message_Gravity gravity);
		%feature("autodoc", "	* Sends a message to be attached to the shape.

	:param shape:
	:type shape: TopoDS_Shape &
	:param message:
	:type message: Message_Msg &
	:param gravity:
	:type gravity: Message_Gravity
	:rtype: void
") Send;
		virtual void Send (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity);
		%feature("autodoc", "	* Calls Send method with Null Transient.

	:param message:
	:type message: Message_Msg &
	:param gravity:
	:type gravity: Message_Gravity
	:rtype: void
") Send;
		virtual void Send (const Message_Msg & message,const Message_Gravity gravity);
};


%feature("shadow") ShapeExtend_BasicMsgRegistrator::~ShapeExtend_BasicMsgRegistrator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_BasicMsgRegistrator {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeExtend_BasicMsgRegistrator {
	Handle_ShapeExtend_BasicMsgRegistrator GetHandle() {
	return *(Handle_ShapeExtend_BasicMsgRegistrator*) &$self;
	}
};

%nodefaultctor Handle_ShapeExtend_BasicMsgRegistrator;
class Handle_ShapeExtend_BasicMsgRegistrator : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeExtend_BasicMsgRegistrator();
        Handle_ShapeExtend_BasicMsgRegistrator(const Handle_ShapeExtend_BasicMsgRegistrator &aHandle);
        Handle_ShapeExtend_BasicMsgRegistrator(const ShapeExtend_BasicMsgRegistrator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeExtend_BasicMsgRegistrator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeExtend_BasicMsgRegistrator {
    ShapeExtend_BasicMsgRegistrator* GetObject() {
    return (ShapeExtend_BasicMsgRegistrator*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeExtend_BasicMsgRegistrator::~Handle_ShapeExtend_BasicMsgRegistrator %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeExtend_BasicMsgRegistrator {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeExtend_ComplexCurve;
class ShapeExtend_ComplexCurve : public Geom_Curve {
	public:
		%feature("autodoc", "	* Returns number of curves

	:rtype: int
") NbCurves;
		virtual Standard_Integer NbCurves ();
		%feature("autodoc", "	* Returns curve given by its index

	:param index:
	:type index: Standard_Integer
	:rtype: Handle_Geom_Curve
") Curve;
		virtual const Handle_Geom_Curve & Curve (const Standard_Integer index);
		%feature("autodoc", "	* Returns number of the curve for the given parameter U and local paramete r UOut for the found curve

	:param U:
	:type U: float
	:param UOut:
	:type UOut: float &
	:rtype: int
") LocateParameter;
		virtual Standard_Integer LocateParameter (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns global parameter for the whole curve according to the segment and local parameter on it

	:param index:
	:type index: Standard_Integer
	:param Ulocal:
	:type Ulocal: float
	:rtype: float
") LocalToGlobal;
		virtual Standard_Real LocalToGlobal (const Standard_Integer index,const Standard_Real Ulocal);
		%feature("autodoc", "	* Applies transformation to each curve

	:param T:
	:type T: gp_Trsf
	:rtype: void
") Transform;
		virtual void Transform (const gp_Trsf & T);
		%feature("autodoc", "	* Returns 1 - U

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "	* Returns 0

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	* Returns 1

	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	* Returns True if the curve is closed

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "	* Returns False

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	* Returns GeomAbs_C0

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "	* Returns False if N > 0

	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "	* Returns point at parameter U. Finds appropriate curve and local parameter on it.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		virtual void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		virtual void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") D3;
		virtual void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec
") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	* Returns scale factor for recomputing of deviatives.

	:param ind:
	:type ind: Standard_Integer
	:rtype: float
") GetScaleFactor;
		virtual Standard_Real GetScaleFactor (const Standard_Integer ind);
		%feature("autodoc", "	* Checks geometrical connectivity of the curves, including closure (sets fields myClosed)

	:param Preci:
	:type Preci: float
	:rtype: bool
") CheckConnectivity;
		Standard_Boolean CheckConnectivity (const Standard_Real Preci);
};


%feature("shadow") ShapeExtend_ComplexCurve::~ShapeExtend_ComplexCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_ComplexCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeExtend_ComplexCurve {
	Handle_ShapeExtend_ComplexCurve GetHandle() {
	return *(Handle_ShapeExtend_ComplexCurve*) &$self;
	}
};

%nodefaultctor Handle_ShapeExtend_ComplexCurve;
class Handle_ShapeExtend_ComplexCurve : public Handle_Geom_Curve {

    public:
        // constructors
        Handle_ShapeExtend_ComplexCurve();
        Handle_ShapeExtend_ComplexCurve(const Handle_ShapeExtend_ComplexCurve &aHandle);
        Handle_ShapeExtend_ComplexCurve(const ShapeExtend_ComplexCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeExtend_ComplexCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeExtend_ComplexCurve {
    ShapeExtend_ComplexCurve* GetObject() {
    return (ShapeExtend_ComplexCurve*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeExtend_ComplexCurve::~Handle_ShapeExtend_ComplexCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeExtend_ComplexCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeExtend_CompositeSurface;
class ShapeExtend_CompositeSurface : public Geom_Surface {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface ();
		%feature("autodoc", "	* Initializes by a grid of surfaces (calls Init()).

	:param GridSurf:
	:type GridSurf: Handle_TColGeom_HArray2OfSurface &
	:param param: default value is ShapeExtend_Natural
	:type param: ShapeExtend_Parametrisation
	:rtype: None
") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface (const Handle_TColGeom_HArray2OfSurface & GridSurf,const ShapeExtend_Parametrisation param = ShapeExtend_Natural);
		%feature("autodoc", "	* Initializes by a grid of surfaces (calls Init()).

	:param GridSurf:
	:type GridSurf: Handle_TColGeom_HArray2OfSurface &
	:param UJoints:
	:type UJoints: TColStd_Array1OfReal &
	:param VJoints:
	:type VJoints: TColStd_Array1OfReal &
	:rtype: None
") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface (const Handle_TColGeom_HArray2OfSurface & GridSurf,const TColStd_Array1OfReal & UJoints,const TColStd_Array1OfReal & VJoints);
		%feature("autodoc", "	* Initializes by a grid of surfaces. All the Surfaces of the grid must have geometrical connectivity as stated above. If geometrical connectivity is not satisfied, method returns False. However, class is initialized even in that case.  Last parameter defines how global parametrisation (joint values) will be computed: ShapeExtend_Natural: U1 = u11min, Ui+1 = Ui + (ui1max-ui1min), etc. ShapeExtend_Uniform: Ui = i-1, Vj = j-1 ShapeExtend_Unitary: Ui = (i-1)/Nu, Vi = (j-1)/Nv

	:param GridSurf:
	:type GridSurf: Handle_TColGeom_HArray2OfSurface &
	:param param: default value is ShapeExtend_Natural
	:type param: ShapeExtend_Parametrisation
	:rtype: bool
") Init;
		Standard_Boolean Init (const Handle_TColGeom_HArray2OfSurface & GridSurf,const ShapeExtend_Parametrisation param = ShapeExtend_Natural);
		%feature("autodoc", "	* Initializes by a grid of surfaces with given global parametrisation defined by UJoints and VJoints arrays, each having langth equal to number of patches in corresponding direction + 1. Global joint values should be sorted in increasing order. All the Surfaces of the grid must have geometrical connectivity as stated above. If geometrical connectivity is not satisfied, method returns False. However, class is initialized even in that case.

	:param GridSurf:
	:type GridSurf: Handle_TColGeom_HArray2OfSurface &
	:param UJoints:
	:type UJoints: TColStd_Array1OfReal &
	:param VJoints:
	:type VJoints: TColStd_Array1OfReal &
	:rtype: bool
") Init;
		Standard_Boolean Init (const Handle_TColGeom_HArray2OfSurface & GridSurf,const TColStd_Array1OfReal & UJoints,const TColStd_Array1OfReal & VJoints);
		%feature("autodoc", "	* Returns number of patches in U direction.

	:rtype: int
") NbUPatches;
		Standard_Integer NbUPatches ();
		%feature("autodoc", "	* Returns number of patches in V direction.

	:rtype: int
") NbVPatches;
		Standard_Integer NbVPatches ();
		%feature("autodoc", "	* Returns one surface patch

	:param i:
	:type i: Standard_Integer
	:param j:
	:type j: Standard_Integer
	:rtype: Handle_Geom_Surface
") Patch;
		const Handle_Geom_Surface & Patch (const Standard_Integer i,const Standard_Integer j);
		%feature("autodoc", "	* Returns grid of surfaces

	:rtype: Handle_TColGeom_HArray2OfSurface
") Patches;
		const Handle_TColGeom_HArray2OfSurface & Patches ();
		%feature("autodoc", "	* Returns the array of U values corresponding to joint points between patches as well as to start and end points, which define global parametrisation of the surface

	:rtype: Handle_TColStd_HArray1OfReal
") UJointValues;
		Handle_TColStd_HArray1OfReal UJointValues ();
		%feature("autodoc", "	* Returns the array of V values corresponding to joint points between patches as well as to start and end points, which define global parametrisation of the surface

	:rtype: Handle_TColStd_HArray1OfReal
") VJointValues;
		Handle_TColStd_HArray1OfReal VJointValues ();
		%feature("autodoc", "	* Returns i-th joint value in U direction (1-st is global Umin, (NbUPatches()+1)-th is global Umax on the composite surface)

	:param i:
	:type i: Standard_Integer
	:rtype: float
") UJointValue;
		Standard_Real UJointValue (const Standard_Integer i);
		%feature("autodoc", "	* Returns j-th joint value in V direction (1-st is global Vmin, (NbVPatches()+1)-th is global Vmax on the composite surface)

	:param j:
	:type j: Standard_Integer
	:rtype: float
") VJointValue;
		Standard_Real VJointValue (const Standard_Integer j);
		%feature("autodoc", "	* Sets the array of U values corresponding to joint points, which define global parametrisation of the surface. Number of values in array should be equal to NbUPatches()+1. All the values should be sorted in increasing order. If this is not satisfied, does nothing and returns False.

	:param UJoints:
	:type UJoints: TColStd_Array1OfReal &
	:rtype: bool
") SetUJointValues;
		Standard_Boolean SetUJointValues (const TColStd_Array1OfReal & UJoints);
		%feature("autodoc", "	* Sets the array of V values corresponding to joint points, which define global parametrisation of the surface Number of values in array should be equal to NbVPatches()+1. All the values should be sorted in increasing order. If this is not satisfied, does nothing and returns False.

	:param VJoints:
	:type VJoints: TColStd_Array1OfReal &
	:rtype: bool
") SetVJointValues;
		Standard_Boolean SetVJointValues (const TColStd_Array1OfReal & VJoints);
		%feature("autodoc", "	* Changes starting value for global U parametrisation (all other joint values are shifted accordingly)

	:param UFirst:
	:type UFirst: float
	:rtype: None
") SetUFirstValue;
		void SetUFirstValue (const Standard_Real UFirst);
		%feature("autodoc", "	* Changes starting value for global V parametrisation (all other joint values are shifted accordingly)

	:param VFirst:
	:type VFirst: float
	:rtype: None
") SetVFirstValue;
		void SetVFirstValue (const Standard_Real VFirst);
		%feature("autodoc", "	* Returns number of col that contains given (global) parameter

	:param U:
	:type U: float
	:rtype: int
") LocateUParameter;
		Standard_Integer LocateUParameter (const Standard_Real U);
		%feature("autodoc", "	* Returns number of row that contains given (global) parameter

	:param V:
	:type V: float
	:rtype: int
") LocateVParameter;
		Standard_Integer LocateVParameter (const Standard_Real V);
		%feature("autodoc", "	* Returns number of row and col of surface that contains given point

	:param pnt:
	:type pnt: gp_Pnt2d
	:param i:
	:type i: Standard_Integer &
	:param j:
	:type j: Standard_Integer &
	:rtype: None
") LocateUVPoint;
		void LocateUVPoint (const gp_Pnt2d & pnt,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns one surface patch that contains given (global) parameters

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: Handle_Geom_Surface
") Patch;
		const Handle_Geom_Surface & Patch (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "	* Returns one surface patch that contains given point

	:param pnt:
	:type pnt: gp_Pnt2d
	:rtype: Handle_Geom_Surface
") Patch;
		const Handle_Geom_Surface & Patch (const gp_Pnt2d & pnt);
		%feature("autodoc", "	* Converts local parameter u on patch i,j to global parameter U

	:param i:
	:type i: Standard_Integer
	:param j:
	:type j: Standard_Integer
	:param u:
	:type u: float
	:rtype: float
") ULocalToGlobal;
		Standard_Real ULocalToGlobal (const Standard_Integer i,const Standard_Integer j,const Standard_Real u);
		%feature("autodoc", "	* Converts local parameter v on patch i,j to global parameter V

	:param i:
	:type i: Standard_Integer
	:param j:
	:type j: Standard_Integer
	:param v:
	:type v: float
	:rtype: float
") VLocalToGlobal;
		Standard_Real VLocalToGlobal (const Standard_Integer i,const Standard_Integer j,const Standard_Real v);
		%feature("autodoc", "	* Converts local parameters uv on patch i,j to global parameters UV

	:param i:
	:type i: Standard_Integer
	:param j:
	:type j: Standard_Integer
	:param uv:
	:type uv: gp_Pnt2d
	:rtype: gp_Pnt2d
") LocalToGlobal;
		gp_Pnt2d LocalToGlobal (const Standard_Integer i,const Standard_Integer j,const gp_Pnt2d & uv);
		%feature("autodoc", "	* Converts global parameter U to local parameter u on patch i,j

	:param i:
	:type i: Standard_Integer
	:param j:
	:type j: Standard_Integer
	:param U:
	:type U: float
	:rtype: float
") UGlobalToLocal;
		Standard_Real UGlobalToLocal (const Standard_Integer i,const Standard_Integer j,const Standard_Real U);
		%feature("autodoc", "	* Converts global parameter V to local parameter v on patch i,j

	:param i:
	:type i: Standard_Integer
	:param j:
	:type j: Standard_Integer
	:param V:
	:type V: float
	:rtype: float
") VGlobalToLocal;
		Standard_Real VGlobalToLocal (const Standard_Integer i,const Standard_Integer j,const Standard_Real V);
		%feature("autodoc", "	* Converts global parameters UV to local parameters uv on patch i,j

	:param i:
	:type i: Standard_Integer
	:param j:
	:type j: Standard_Integer
	:param UV:
	:type UV: gp_Pnt2d
	:rtype: gp_Pnt2d
") GlobalToLocal;
		gp_Pnt2d GlobalToLocal (const Standard_Integer i,const Standard_Integer j,const gp_Pnt2d & UV);
		%feature("autodoc", "	* Computes transformation operator and uFactor descrinbing affine transformation required to convert global parameters on composite surface to local parameters on patch (i,j): uv = ( uFactor, 1. ) X Trsf * UV; NOTE: Thus Trsf contains shift and scale by V, scale by U is stored in uFact. Returns True if transformation is not an identity

	:param i:
	:type i: Standard_Integer
	:param j:
	:type j: Standard_Integer
	:param uFact:
	:type uFact: float &
	:param Trsf:
	:type Trsf: gp_Trsf2d
	:rtype: bool
") GlobalToLocalTransformation;
		Standard_Boolean GlobalToLocalTransformation (const Standard_Integer i,const Standard_Integer j,Standard_Real &OutValue,gp_Trsf2d & Trsf);
		%feature("autodoc", "	* Applies transformation to all the patches

	:param T:
	:type T: gp_Trsf
	:rtype: void
") Transform;
		virtual void Transform (const gp_Trsf & T);
		%feature("autodoc", "	* Returns a copy of the surface

	:rtype: Handle_Geom_Geometry
") Copy;
		virtual Handle_Geom_Geometry Copy ();
		%feature("autodoc", "	* NOT IMPLEMENTED (does nothing)

	:rtype: void
") UReverse;
		virtual void UReverse ();
		%feature("autodoc", "	* Returns U

	:param U:
	:type U: float
	:rtype: float
") UReversedParameter;
		virtual Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "	* NOT IMPLEMENTED (does nothing)

	:rtype: void
") VReverse;
		virtual void VReverse ();
		%feature("autodoc", "	* Returns V

	:param V:
	:type V: float
	:rtype: float
") VReversedParameter;
		virtual Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "	* Returns the parametric bounds of grid

	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:param V1:
	:type V1: float &
	:param V2:
	:type V2: float &
	:rtype: void
") Bounds;
		virtual void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns True if grid is closed in U direction (i.e. connected with Precision::Confusion)

	:rtype: bool
") IsUClosed;
		virtual Standard_Boolean IsUClosed ();
		%feature("autodoc", "	* Returns True if grid is closed in V direction (i.e. connected with Precision::Confusion)

	:rtype: bool
") IsVClosed;
		virtual Standard_Boolean IsVClosed ();
		%feature("autodoc", "	* Returns False

	:rtype: bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "	* Returns False

	:rtype: bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "	* NOT IMPLEMENTED (returns Null curve)

	:param U:
	:type U: float
	:rtype: Handle_Geom_Curve
") UIso;
		virtual Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "	* NOT IMPLEMENTED (returns Null curve)

	:param V:
	:type V: float
	:rtype: Handle_Geom_Curve
") VIso;
		virtual Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "	* returns C0

	:rtype: GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity ();
		%feature("autodoc", "	* returns True if N <=0

	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsCNu;
		virtual Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "	* returns True if N <=0

	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsCNv;
		virtual Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("autodoc", "	* Computes the point of parameter U,V on the grid.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point P and the first derivatives in the directions U and V at this point.

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
	:rtype: void
") D1;
		virtual void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "	* Computes the point P, the first and the second derivatives in the directions U and V at this point.

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
	:rtype: void
") D2;
		virtual void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "	* Computes the point P, the first,the second and the third derivatives in the directions U and V at this point.

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
	:rtype: void
") D3;
		virtual void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "	* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V).

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: Standard_Integer
	:param Nv:
	:type Nv: Standard_Integer
	:rtype: gp_Vec
") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "	* Computes the point of parameter pnt on the grid.

	:param pnt:
	:type pnt: gp_Pnt2d
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const gp_Pnt2d & pnt);
		%feature("autodoc", "	* Computes Joint values according to parameter

	:param param: default value is ShapeExtend_Natural
	:type param: ShapeExtend_Parametrisation
	:rtype: None
") ComputeJointValues;
		void ComputeJointValues (const ShapeExtend_Parametrisation param = ShapeExtend_Natural);
		%feature("autodoc", "	* Checks geometrical connectivity of the patches, including closedness (sets fields muUClosed and myVClosed)

	:param prec:
	:type prec: float
	:rtype: bool
") CheckConnectivity;
		Standard_Boolean CheckConnectivity (const Standard_Real prec);
};


%feature("shadow") ShapeExtend_CompositeSurface::~ShapeExtend_CompositeSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_CompositeSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeExtend_CompositeSurface {
	Handle_ShapeExtend_CompositeSurface GetHandle() {
	return *(Handle_ShapeExtend_CompositeSurface*) &$self;
	}
};

%nodefaultctor Handle_ShapeExtend_CompositeSurface;
class Handle_ShapeExtend_CompositeSurface : public Handle_Geom_Surface {

    public:
        // constructors
        Handle_ShapeExtend_CompositeSurface();
        Handle_ShapeExtend_CompositeSurface(const Handle_ShapeExtend_CompositeSurface &aHandle);
        Handle_ShapeExtend_CompositeSurface(const ShapeExtend_CompositeSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeExtend_CompositeSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeExtend_CompositeSurface {
    ShapeExtend_CompositeSurface* GetObject() {
    return (ShapeExtend_CompositeSurface*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeExtend_CompositeSurface::~Handle_ShapeExtend_CompositeSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeExtend_CompositeSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg;
class ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg;
		 ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg ();
		%feature("autodoc", "	:param aMap:
	:type aMap: ShapeExtend_DataMapOfShapeListOfMsg &
	:rtype: None
") ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg;
		 ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg (const ShapeExtend_DataMapOfShapeListOfMsg & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: ShapeExtend_DataMapOfShapeListOfMsg &
	:rtype: None
") Initialize;
		void Initialize (const ShapeExtend_DataMapOfShapeListOfMsg & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: Message_ListOfMsg
") Value;
		const Message_ListOfMsg & Value ();
};


%feature("shadow") ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg::~ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg;
class ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg;
		 ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg ();
		%feature("autodoc", "	:param aMap:
	:type aMap: ShapeExtend_DataMapOfTransientListOfMsg &
	:rtype: None
") ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg;
		 ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg (const ShapeExtend_DataMapOfTransientListOfMsg & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: ShapeExtend_DataMapOfTransientListOfMsg &
	:rtype: None
") Initialize;
		void Initialize (const ShapeExtend_DataMapOfTransientListOfMsg & aMap);
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key;
		const Handle_Standard_Transient & Key ();
		%feature("autodoc", "	:rtype: Message_ListOfMsg
") Value;
		const Message_ListOfMsg & Value ();
};


%feature("shadow") ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg::~ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg;
class ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Message_ListOfMsg &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg;
		 ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg (const TopoDS_Shape & K,const Message_ListOfMsg & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: Message_ListOfMsg
") Value;
		Message_ListOfMsg & Value ();
};


%feature("shadow") ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg::~ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg {
	Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg GetHandle() {
	return *(Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg*) &$self;
	}
};

%nodefaultctor Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg;
class Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg();
        Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg(const Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg &aHandle);
        Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg(const ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg {
    ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg* GetObject() {
    return (ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg::~Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg;
class ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: Message_ListOfMsg &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg;
		 ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg (const Handle_Standard_Transient & K,const Message_ListOfMsg & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key;
		Handle_Standard_Transient & Key ();
		%feature("autodoc", "	:rtype: Message_ListOfMsg
") Value;
		Message_ListOfMsg & Value ();
};


%feature("shadow") ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg::~ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg {
	Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg GetHandle() {
	return *(Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg*) &$self;
	}
};

%nodefaultctor Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg;
class Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg();
        Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg(const Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg &aHandle);
        Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg(const ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg {
    ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg* GetObject() {
    return (ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg::~Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeExtend_DataMapOfShapeListOfMsg;
class ShapeExtend_DataMapOfShapeListOfMsg : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") ShapeExtend_DataMapOfShapeListOfMsg;
		 ShapeExtend_DataMapOfShapeListOfMsg (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: ShapeExtend_DataMapOfShapeListOfMsg &
	:rtype: ShapeExtend_DataMapOfShapeListOfMsg
") Assign;
		ShapeExtend_DataMapOfShapeListOfMsg & Assign (const ShapeExtend_DataMapOfShapeListOfMsg & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ShapeExtend_DataMapOfShapeListOfMsg &
	:rtype: ShapeExtend_DataMapOfShapeListOfMsg
") operator=;
		ShapeExtend_DataMapOfShapeListOfMsg & operator = (const ShapeExtend_DataMapOfShapeListOfMsg & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Message_ListOfMsg &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Message_ListOfMsg & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Message_ListOfMsg
") Find;
		const Message_ListOfMsg & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Message_ListOfMsg
") ChangeFind;
		Message_ListOfMsg & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") ShapeExtend_DataMapOfShapeListOfMsg::~ShapeExtend_DataMapOfShapeListOfMsg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_DataMapOfShapeListOfMsg {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeExtend_DataMapOfTransientListOfMsg;
class ShapeExtend_DataMapOfTransientListOfMsg : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") ShapeExtend_DataMapOfTransientListOfMsg;
		 ShapeExtend_DataMapOfTransientListOfMsg (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: ShapeExtend_DataMapOfTransientListOfMsg &
	:rtype: ShapeExtend_DataMapOfTransientListOfMsg
") Assign;
		ShapeExtend_DataMapOfTransientListOfMsg & Assign (const ShapeExtend_DataMapOfTransientListOfMsg & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ShapeExtend_DataMapOfTransientListOfMsg &
	:rtype: ShapeExtend_DataMapOfTransientListOfMsg
") operator=;
		ShapeExtend_DataMapOfTransientListOfMsg & operator = (const ShapeExtend_DataMapOfTransientListOfMsg & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: Message_ListOfMsg &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_Standard_Transient & K,const Message_ListOfMsg & I);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Message_ListOfMsg
") Find;
		const Message_ListOfMsg & Find (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Message_ListOfMsg
") ChangeFind;
		Message_ListOfMsg & ChangeFind (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Transient & K);
};


%feature("shadow") ShapeExtend_DataMapOfTransientListOfMsg::~ShapeExtend_DataMapOfTransientListOfMsg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_DataMapOfTransientListOfMsg {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeExtend_Explorer;
class ShapeExtend_Explorer {
	public:
		%feature("autodoc", "	* Creates an object Explorer

	:rtype: None
") ShapeExtend_Explorer;
		 ShapeExtend_Explorer ();
		%feature("autodoc", "	* Converts a sequence of Shapes to a Compound

	:param seqval:
	:type seqval: Handle_TopTools_HSequenceOfShape &
	:rtype: TopoDS_Shape
") CompoundFromSeq;
		TopoDS_Shape CompoundFromSeq (const Handle_TopTools_HSequenceOfShape & seqval);
		%feature("autodoc", "	* Converts a Compound to a list of Shapes if <comp> is not a compound, the list contains only <comp> if <comp> is Null, the list is empty if <comp> is a Compound, its sub-shapes are put into the list then if <expcomp> is True, if a sub-shape is a Compound, it is not put to the list but its sub-shapes are (recursive)

	:param comp:
	:type comp: TopoDS_Shape &
	:param expcomp:
	:type expcomp: bool
	:rtype: Handle_TopTools_HSequenceOfShape
") SeqFromCompound;
		Handle_TopTools_HSequenceOfShape SeqFromCompound (const TopoDS_Shape & comp,const Standard_Boolean expcomp);
		%feature("autodoc", "	* Converts a Sequence of Shapes to a List of Shapes <clear> if True (D), commands the list to start from scratch else, the list is cumulated

	:param seqval:
	:type seqval: Handle_TopTools_HSequenceOfShape &
	:param lisval:
	:type lisval: TopTools_ListOfShape &
	:param clear: default value is Standard_True
	:type clear: bool
	:rtype: None
") ListFromSeq;
		void ListFromSeq (const Handle_TopTools_HSequenceOfShape & seqval,TopTools_ListOfShape & lisval,const Standard_Boolean clear = Standard_True);
		%feature("autodoc", "	* Converts a List of Shapes to a Sequence of Shapes

	:param lisval:
	:type lisval: TopTools_ListOfShape &
	:rtype: Handle_TopTools_HSequenceOfShape
") SeqFromList;
		Handle_TopTools_HSequenceOfShape SeqFromList (const TopTools_ListOfShape & lisval);
		%feature("autodoc", "	* Returns the type of a Shape: true type if <compound> is False If <compound> is True and <shape> is a Compound, iterates on its items. If all are of the same type, returns this type. Else, returns COMPOUND. If it is empty, returns SHAPE For a Null Shape, returns SHAPE

	:param shape:
	:type shape: TopoDS_Shape &
	:param compound:
	:type compound: bool
	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType (const TopoDS_Shape & shape,const Standard_Boolean compound);
		%feature("autodoc", "	* Builds a COMPOUND from the given shape. It explores the shape level by level, according to the <explore> argument. If <explore> is False, only COMPOUND items are explored, else all items are. The following shapes are added to resulting compound: - shapes which comply to <type> - if <type> is WIRE, considers also free edges (and makes wires) - if <type> is SHELL, considers also free faces (and makes shells) If <compound> is True, gathers items in compounds which correspond to starting COMPOUND,SOLID or SHELL containers, or items directly contained in a Compound

	:param shape:
	:type shape: TopoDS_Shape &
	:param type:
	:type type: TopAbs_ShapeEnum
	:param explore:
	:type explore: bool
	:param compound:
	:type compound: bool
	:rtype: TopoDS_Shape
") SortedCompound;
		TopoDS_Shape SortedCompound (const TopoDS_Shape & shape,const TopAbs_ShapeEnum type,const Standard_Boolean explore,const Standard_Boolean compound);
		%feature("autodoc", "	* Dispatches starting list of shapes according to their type, to the appropriate resulting lists For each of these lists, if it is null, it is firstly created else, new items are appended to the already existing ones

	:param list:
	:type list: Handle_TopTools_HSequenceOfShape &
	:param vertices:
	:type vertices: Handle_TopTools_HSequenceOfShape &
	:param edges:
	:type edges: Handle_TopTools_HSequenceOfShape &
	:param wires:
	:type wires: Handle_TopTools_HSequenceOfShape &
	:param faces:
	:type faces: Handle_TopTools_HSequenceOfShape &
	:param shells:
	:type shells: Handle_TopTools_HSequenceOfShape &
	:param solids:
	:type solids: Handle_TopTools_HSequenceOfShape &
	:param compsols:
	:type compsols: Handle_TopTools_HSequenceOfShape &
	:param compounds:
	:type compounds: Handle_TopTools_HSequenceOfShape &
	:rtype: None
") DispatchList;
		void DispatchList (const Handle_TopTools_HSequenceOfShape & list,Handle_TopTools_HSequenceOfShape & vertices,Handle_TopTools_HSequenceOfShape & edges,Handle_TopTools_HSequenceOfShape & wires,Handle_TopTools_HSequenceOfShape & faces,Handle_TopTools_HSequenceOfShape & shells,Handle_TopTools_HSequenceOfShape & solids,Handle_TopTools_HSequenceOfShape & compsols,Handle_TopTools_HSequenceOfShape & compounds);
};


%feature("shadow") ShapeExtend_Explorer::~ShapeExtend_Explorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_Explorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeExtend_WireData;
class ShapeExtend_WireData : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Empty constructor, creates empty wire with no edges

	:rtype: None
") ShapeExtend_WireData;
		 ShapeExtend_WireData ();
		%feature("autodoc", "	* Constructor initializing the data from TopoDS_Wire. Calls Init(wire,chained).

	:param wire:
	:type wire: TopoDS_Wire &
	:param chained: default value is Standard_True
	:type chained: bool
	:param theManifoldMode: default value is Standard_True
	:type theManifoldMode: bool
	:rtype: None
") ShapeExtend_WireData;
		 ShapeExtend_WireData (const TopoDS_Wire & wire,const Standard_Boolean chained = Standard_True,const Standard_Boolean theManifoldMode = Standard_True);
		%feature("autodoc", "	* Copies data from another WireData

	:param other:
	:type other: Handle_ShapeExtend_WireData &
	:rtype: None
") Init;
		void Init (const Handle_ShapeExtend_WireData & other);
		%feature("autodoc", "	* Loads an already existing wire If <chained> is True (default), edges are added in the sequence as they are explored by TopoDS_Iterator Else, if <chained> is False, wire is explored by BRepTools_WireExplorer and it is guaranteed that edges will be sequencially connected. Remark : In the latter case it can happen that not all edges will be found (because of limitations of BRepTools_WireExplorer for disconnected wires and wires with seam edges).

	:param wire:
	:type wire: TopoDS_Wire &
	:param chained: default value is Standard_True
	:type chained: bool
	:param theManifoldMode: default value is Standard_True
	:type theManifoldMode: bool
	:rtype: bool
") Init;
		Standard_Boolean Init (const TopoDS_Wire & wire,const Standard_Boolean chained = Standard_True,const Standard_Boolean theManifoldMode = Standard_True);
		%feature("autodoc", "	* Clears data about Wire.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Computes the list of seam edges By default (direct call), computing is enforced For indirect call (from IsSeam) it is redone only if not yet already done or if the list of edges has changed Remark : A Seam Edge is an Edge present twice in the list, once as FORWARD and once as REVERSED Each sense has its own PCurve, the one for FORWARD must be set in first

	:param enforce: default value is Standard_True
	:type enforce: bool
	:rtype: None
") ComputeSeams;
		void ComputeSeams (const Standard_Boolean enforce = Standard_True);
		%feature("autodoc", "	* Does a circular permutation in order to set <num>th edge last

	:param num:
	:type num: Standard_Integer
	:rtype: None
") SetLast;
		void SetLast (const Standard_Integer num);
		%feature("autodoc", "	* When the wire contains at least one degenerated edge, sets it as last one Note : It is useful to process pcurves, for instance, while the pcurve of a DGNR may not be computed from its 3D part (there is none) it is computed after the other edges have been computed and chained.

	:rtype: None
") SetDegeneratedLast;
		void SetDegeneratedLast ();
		%feature("autodoc", "	* Adds an edge to a wire, being defined (not yet ended) This is the plain, basic, function to add an edge <num> = 0 (D): Appends at end <num> = 1: Preprends at start else, Insert before <num> Remark : Null Edge is simply ignored

	:param edge:
	:type edge: TopoDS_Edge &
	:param atnum: default value is 0
	:type atnum: Standard_Integer
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & edge,const Standard_Integer atnum = 0);
		%feature("autodoc", "	* Adds an entire wire, considered as a list of edges Remark : The wire is assumed to be ordered (TopoDS_Iterator is used)

	:param wire:
	:type wire: TopoDS_Wire &
	:param atnum: default value is 0
	:type atnum: Standard_Integer
	:rtype: None
") Add;
		void Add (const TopoDS_Wire & wire,const Standard_Integer atnum = 0);
		%feature("autodoc", "	* Adds a wire in the form of WireData

	:param wire:
	:type wire: Handle_ShapeExtend_WireData &
	:param atnum: default value is 0
	:type atnum: Standard_Integer
	:rtype: None
") Add;
		void Add (const Handle_ShapeExtend_WireData & wire,const Standard_Integer atnum = 0);
		%feature("autodoc", "	* Adds an edge or a wire invoking corresponding method Add

	:param shape:
	:type shape: TopoDS_Shape &
	:param atnum: default value is 0
	:type atnum: Standard_Integer
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & shape,const Standard_Integer atnum = 0);
		%feature("autodoc", "	* Adds an edge to start or end of <self>, according to <mode> 0: at end, as direct 1: at end, as reversed 2: at start, as direct 3: at start, as reversed < 0: no adding

	:param edge:
	:type edge: TopoDS_Edge &
	:param mode:
	:type mode: Standard_Integer
	:rtype: None
") AddOriented;
		void AddOriented (const TopoDS_Edge & edge,const Standard_Integer mode);
		%feature("autodoc", "	* Adds a wire to start or end of <self>, according to <mode> 0: at end, as direct 1: at end, as reversed 2: at start, as direct 3: at start, as reversed < 0: no adding

	:param wire:
	:type wire: TopoDS_Wire &
	:param mode:
	:type mode: Standard_Integer
	:rtype: None
") AddOriented;
		void AddOriented (const TopoDS_Wire & wire,const Standard_Integer mode);
		%feature("autodoc", "	* Adds an edge or a wire invoking corresponding method AddOriented

	:param shape:
	:type shape: TopoDS_Shape &
	:param mode:
	:type mode: Standard_Integer
	:rtype: None
") AddOriented;
		void AddOriented (const TopoDS_Shape & shape,const Standard_Integer mode);
		%feature("autodoc", "	* Removes an Edge, given its rank. By default removes the last edge.

	:param num: default value is 0
	:type num: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer num = 0);
		%feature("autodoc", "	* Replaces an edge at the given rank number <num> with new one. Default is last edge (<num> = 0).

	:param edge:
	:type edge: TopoDS_Edge &
	:param num: default value is 0
	:type num: Standard_Integer
	:rtype: None
") Set;
		void Set (const TopoDS_Edge & edge,const Standard_Integer num = 0);
		%feature("autodoc", "	* Reverses the sense of the list and the orientation of each Edge This method should be called when either wire has no seam edges or face is not available

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	* Reverses the sense of the list and the orientation of each Edge The face is necessary for swapping pcurves for seam edges (first pcurve corresponds to orientation FORWARD, and second to REVERSED; when edge is reversed, pcurves must be swapped) If face is NULL, no swapping is performed

	:param face:
	:type face: TopoDS_Face &
	:rtype: None
") Reverse;
		void Reverse (const TopoDS_Face & face);
		%feature("autodoc", "	* Returns the count of currently recorded edges

	:rtype: int
") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "	* Returns the count of currently recorded non-manifold edges

	:rtype: int
") NbNonManifoldEdges;
		Standard_Integer NbNonManifoldEdges ();
		%feature("autodoc", "	* Returns <num>th nonmanifold Edge

	:param num:
	:type num: Standard_Integer
	:rtype: TopoDS_Edge
") NonmanifoldEdge;
		TopoDS_Edge NonmanifoldEdge (const Standard_Integer num);
		%feature("autodoc", "	* Returns sequence of non-manifold edges This sequence can be not empty if wire data set in manifold mode but initial wire has INTERNAL orientation or contains INTERNAL edges

	:rtype: Handle_TopTools_HSequenceOfShape
") NonmanifoldEdges;
		Handle_TopTools_HSequenceOfShape NonmanifoldEdges ();

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetManifoldMode() {
                return (Standard_Boolean) $self->ManifoldMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetManifoldMode(Standard_Boolean value ) {
                $self->ManifoldMode()=value;
                }
            };
            		%feature("autodoc", "	* Returns <num>th Edge

	:param num:
	:type num: Standard_Integer
	:rtype: TopoDS_Edge
") Edge;
		TopoDS_Edge Edge (const Standard_Integer num);
		%feature("autodoc", "	* Returns the index of the edge If the edge is a seam the orientation is also checked Returns 0 if the edge is not found in the list

	:param edge:
	:type edge: TopoDS_Edge &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Edge & edge);
		%feature("autodoc", "	* Tells if an Edge is seam (see ComputeSeams) An edge is considered as seam if it presents twice in the edge list, once as FORWARD and once as REVERSED.

	:param num:
	:type num: Standard_Integer
	:rtype: bool
") IsSeam;
		Standard_Boolean IsSeam (const Standard_Integer num);
		%feature("autodoc", "	* Makes TopoDS_Wire using BRep_Builder (just creates the TopoDS_Wire object and adds all edges into it). This method should be called when the wire is correct (for example, after successful fixes by ShapeFix_Wire) and adjacent edges share common vertices. In case if adjacent edges do not share the same vertices the resulting TopoDS_Wire will be invalid.

	:rtype: TopoDS_Wire
") Wire;
		TopoDS_Wire Wire ();
		%feature("autodoc", "	* Makes TopoDS_Wire using BRepAPI_MakeWire. Class BRepAPI_MakeWire merges geometrically coincided vertices and can disturb correct order of edges in the wire. If this class fails, null shape is returned.

	:rtype: TopoDS_Wire
") WireAPIMake;
		TopoDS_Wire WireAPIMake ();
};


%feature("shadow") ShapeExtend_WireData::~ShapeExtend_WireData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_WireData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeExtend_WireData {
	Handle_ShapeExtend_WireData GetHandle() {
	return *(Handle_ShapeExtend_WireData*) &$self;
	}
};

%nodefaultctor Handle_ShapeExtend_WireData;
class Handle_ShapeExtend_WireData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeExtend_WireData();
        Handle_ShapeExtend_WireData(const Handle_ShapeExtend_WireData &aHandle);
        Handle_ShapeExtend_WireData(const ShapeExtend_WireData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeExtend_WireData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeExtend_WireData {
    ShapeExtend_WireData* GetObject() {
    return (ShapeExtend_WireData*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeExtend_WireData::~Handle_ShapeExtend_WireData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeExtend_WireData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeExtend_MsgRegistrator;
class ShapeExtend_MsgRegistrator : public ShapeExtend_BasicMsgRegistrator {
	public:
		%feature("autodoc", "	* Creates an object.

	:rtype: None
") ShapeExtend_MsgRegistrator;
		 ShapeExtend_MsgRegistrator ();
		%feature("autodoc", "	* Sends a message to be attached to the object. If the object is in the map then the message is added to the list, otherwise the object is firstly added to the map.

	:param object:
	:type object: Handle_Standard_Transient &
	:param message:
	:type message: Message_Msg &
	:param gravity:
	:type gravity: Message_Gravity
	:rtype: void
") Send;
		virtual void Send (const Handle_Standard_Transient & object,const Message_Msg & message,const Message_Gravity gravity);
		%feature("autodoc", "	* Sends a message to be attached to the shape. If the shape is in the map then the message is added to the list, otherwise the shape is firstly added to the map.

	:param shape:
	:type shape: TopoDS_Shape &
	:param message:
	:type message: Message_Msg &
	:param gravity:
	:type gravity: Message_Gravity
	:rtype: void
") Send;
		virtual void Send (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity);
		%feature("autodoc", "	* Returns a Map of objects and message list

	:rtype: ShapeExtend_DataMapOfTransientListOfMsg
") MapTransient;
		const ShapeExtend_DataMapOfTransientListOfMsg & MapTransient ();
		%feature("autodoc", "	* Returns a Map of shapes and message list

	:rtype: ShapeExtend_DataMapOfShapeListOfMsg
") MapShape;
		const ShapeExtend_DataMapOfShapeListOfMsg & MapShape ();
};


%feature("shadow") ShapeExtend_MsgRegistrator::~ShapeExtend_MsgRegistrator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeExtend_MsgRegistrator {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeExtend_MsgRegistrator {
	Handle_ShapeExtend_MsgRegistrator GetHandle() {
	return *(Handle_ShapeExtend_MsgRegistrator*) &$self;
	}
};

%nodefaultctor Handle_ShapeExtend_MsgRegistrator;
class Handle_ShapeExtend_MsgRegistrator : public Handle_ShapeExtend_BasicMsgRegistrator {

    public:
        // constructors
        Handle_ShapeExtend_MsgRegistrator();
        Handle_ShapeExtend_MsgRegistrator(const Handle_ShapeExtend_MsgRegistrator &aHandle);
        Handle_ShapeExtend_MsgRegistrator(const ShapeExtend_MsgRegistrator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeExtend_MsgRegistrator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeExtend_MsgRegistrator {
    ShapeExtend_MsgRegistrator* GetObject() {
    return (ShapeExtend_MsgRegistrator*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeExtend_MsgRegistrator::~Handle_ShapeExtend_MsgRegistrator %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeExtend_MsgRegistrator {
    void _kill_pointed() {
        delete $self;
    }
};

