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
%module ShapeExtend

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

%include ShapeExtend_required_python_modules.i
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
		%feature("autodoc", "Args:
	None
Returns:
	static void

Inits using of ShapeExtend.  
         Currently, loads messages output by ShapeHealing algorithms.") Init;
		static void Init ();
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	static Standard_Integer

Encodes status (enumeration) to a bit flag") EncodeStatus;
		static Standard_Integer EncodeStatus (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	flag(Standard_Integer)
	status(ShapeExtend_Status)

Returns:
	static Standard_Boolean

Tells if a bit flag contains bit corresponding to enumerated status") DecodeStatus;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeExtend_BasicMsgRegistrator;
		 ShapeExtend_BasicMsgRegistrator ();
		%feature("autodoc", "Args:
	object(Handle_Standard_Transient)
	message(Message_Msg)
	gravity(Message_Gravity)

Returns:
	virtual void

Sends a message to be attached to the object.  
         Object can be of any type interpreted by redefined MsgRegistrator.") Send;
		virtual void Send (const Handle_Standard_Transient & object,const Message_Msg & message,const Message_Gravity gravity);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	message(Message_Msg)
	gravity(Message_Gravity)

Returns:
	virtual void

Sends a message to be attached to the shape.") Send;
		virtual void Send (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity);
		%feature("autodoc", "Args:
	message(Message_Msg)
	gravity(Message_Gravity)

Returns:
	virtual void

Calls Send method with Null Transient.") Send;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns number of curves") NbCurves;
		virtual Standard_Integer NbCurves ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	virtual  Handle_Geom_Curve

Returns curve given by its index") Curve;
		virtual const Handle_Geom_Curve & Curve (const Standard_Integer index);
		%feature("autodoc", "Args:
	U(Standard_Real)
	UOut(Standard_Real)

Returns:
	virtual Standard_Integer

Returns number of the curve for the given parameter U  
         and local paramete r UOut for the found curve") LocateParameter;
		virtual Standard_Integer LocateParameter (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	index(Standard_Integer)
	Ulocal(Standard_Real)

Returns:
	virtual Standard_Real

Returns global parameter for the whole curve according  
         to the segment and local parameter on it") LocalToGlobal;
		virtual Standard_Real LocalToGlobal (const Standard_Integer index,const Standard_Real Ulocal);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual void

Applies transformation to each curve") Transform;
		virtual void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns 1 - U") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns 0") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns 1") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the curve is closed") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns GeomAbs_C0") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns False if N > 0") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	virtual void

Returns point at parameter U.  
         Finds appropriate curve and local parameter on it.") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	virtual void

No detailed docstring for this function.") D1;
		virtual void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	virtual void

No detailed docstring for this function.") D2;
		virtual void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	virtual void

No detailed docstring for this function.") D3;
		virtual void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	virtual gp_Vec

No detailed docstring for this function.") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	ind(Standard_Integer)

Returns:
	virtual Standard_Real

Returns scale factor for recomputing of deviatives.") GetScaleFactor;
		virtual Standard_Real GetScaleFactor (const Standard_Integer ind);
		%feature("autodoc", "Args:
	Preci(Standard_Real)

Returns:
	Standard_Boolean

Checks geometrical connectivity of the curves, including  
         closure (sets fields myClosed)") CheckConnectivity;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface ();
		%feature("autodoc", "Args:
	GridSurf(Handle_TColGeom_HArray2OfSurface)
	param(ShapeExtend_Parametrisation)=ShapeExtend_Natural

Returns:
	None

Initializes by a grid of surfaces (calls Init()).") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface (const Handle_TColGeom_HArray2OfSurface & GridSurf,const ShapeExtend_Parametrisation param = ShapeExtend_Natural);
		%feature("autodoc", "Args:
	GridSurf(Handle_TColGeom_HArray2OfSurface)
	UJoints(TColStd_Array1OfReal)
	VJoints(TColStd_Array1OfReal)

Returns:
	None

Initializes by a grid of surfaces (calls Init()).") ShapeExtend_CompositeSurface;
		 ShapeExtend_CompositeSurface (const Handle_TColGeom_HArray2OfSurface & GridSurf,const TColStd_Array1OfReal & UJoints,const TColStd_Array1OfReal & VJoints);
		%feature("autodoc", "Args:
	GridSurf(Handle_TColGeom_HArray2OfSurface)
	param(ShapeExtend_Parametrisation)=ShapeExtend_Natural

Returns:
	Standard_Boolean

Initializes by a grid of surfaces.  
         All the Surfaces of the grid must have geometrical  
         connectivity as stated above.  
         If geometrical connectivity is not satisfied, method  
         returns False.  
         However, class is initialized even in that case.  
 
         Last parameter defines how global parametrisation  
         (joint values) will be computed:  
         ShapeExtend_Natural: U1 = u11min, Ui+1 = Ui + (ui1max-ui1min), etc.  
         ShapeExtend_Uniform: Ui = i-1, Vj = j-1  
         ShapeExtend_Unitary: Ui = (i-1)/Nu, Vi = (j-1)/Nv") Init;
		Standard_Boolean Init (const Handle_TColGeom_HArray2OfSurface & GridSurf,const ShapeExtend_Parametrisation param = ShapeExtend_Natural);
		%feature("autodoc", "Args:
	GridSurf(Handle_TColGeom_HArray2OfSurface)
	UJoints(TColStd_Array1OfReal)
	VJoints(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Initializes by a grid of surfaces with given global  
         parametrisation defined by UJoints and VJoints arrays,  
         each having langth equal to number of patches in corresponding  
         direction + 1. Global joint values should be sorted in  
         increasing order.  
         All the Surfaces of the grid must have geometrical  
         connectivity as stated above.  
         If geometrical connectivity is not satisfied, method  
         returns False.  
         However, class is initialized even in that case.") Init;
		Standard_Boolean Init (const Handle_TColGeom_HArray2OfSurface & GridSurf,const TColStd_Array1OfReal & UJoints,const TColStd_Array1OfReal & VJoints);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of patches in U direction.") NbUPatches;
		Standard_Integer NbUPatches ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of patches in V direction.") NbVPatches;
		Standard_Integer NbVPatches ();
		%feature("autodoc", "Args:
	i(Standard_Integer)
	j(Standard_Integer)

Returns:
	Handle_Geom_Surface

Returns one surface patch") Patch;
		const Handle_Geom_Surface & Patch (const Standard_Integer i,const Standard_Integer j);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom_HArray2OfSurface

Returns grid of surfaces") Patches;
		const Handle_TColGeom_HArray2OfSurface & Patches ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

Returns the array of U values corresponding to joint  
         points between patches as well as to start and end points,  
         which define global parametrisation of the surface") UJointValues;
		Handle_TColStd_HArray1OfReal UJointValues ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

Returns the array of V values corresponding to joint  
         points between patches as well as to start and end points,  
         which define global parametrisation of the surface") VJointValues;
		Handle_TColStd_HArray1OfReal VJointValues ();
		%feature("autodoc", "Args:
	i(Standard_Integer)

Returns:
	Standard_Real

Returns i-th joint value in U direction  
         (1-st is global Umin, (NbUPatches()+1)-th is global Umax  
         on the composite surface)") UJointValue;
		Standard_Real UJointValue (const Standard_Integer i);
		%feature("autodoc", "Args:
	j(Standard_Integer)

Returns:
	Standard_Real

Returns j-th joint value in V direction  
         (1-st is global Vmin, (NbVPatches()+1)-th is global Vmax  
         on the composite surface)") VJointValue;
		Standard_Real VJointValue (const Standard_Integer j);
		%feature("autodoc", "Args:
	UJoints(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Sets the array of U values corresponding to joint  
         points, which define global parametrisation of the surface.  
         Number of values in array should be equal to NbUPatches()+1.  
         All the values should be sorted in increasing order.  
         If this is not satisfied, does nothing and returns False.") SetUJointValues;
		Standard_Boolean SetUJointValues (const TColStd_Array1OfReal & UJoints);
		%feature("autodoc", "Args:
	VJoints(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

Sets the array of V values corresponding to joint  
         points, which define global parametrisation of the surface  
         Number of values in array should be equal to NbVPatches()+1.  
         All the values should be sorted in increasing order.  
         If this is not satisfied, does nothing and returns False.") SetVJointValues;
		Standard_Boolean SetVJointValues (const TColStd_Array1OfReal & VJoints);
		%feature("autodoc", "Args:
	UFirst(Standard_Real)

Returns:
	None

Changes starting value for global U parametrisation (all  
         other joint values are shifted accordingly)") SetUFirstValue;
		void SetUFirstValue (const Standard_Real UFirst);
		%feature("autodoc", "Args:
	VFirst(Standard_Real)

Returns:
	None

Changes starting value for global V parametrisation (all  
         other joint values are shifted accordingly)") SetVFirstValue;
		void SetVFirstValue (const Standard_Real VFirst);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Integer

Returns number of col that contains given (global) parameter") LocateUParameter;
		Standard_Integer LocateUParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Integer

Returns number of row that contains given (global) parameter") LocateVParameter;
		Standard_Integer LocateVParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	pnt(gp_Pnt2d)
	i(Standard_Integer)
	j(Standard_Integer)

Returns:
	None

Returns number of row and col of surface that contains  
         given point") LocateUVPoint;
		void LocateUVPoint (const gp_Pnt2d & pnt,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	Handle_Geom_Surface

Returns one surface patch that contains given (global) parameters") Patch;
		const Handle_Geom_Surface & Patch (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	pnt(gp_Pnt2d)

Returns:
	Handle_Geom_Surface

Returns one surface patch that contains given point") Patch;
		const Handle_Geom_Surface & Patch (const gp_Pnt2d & pnt);
		%feature("autodoc", "Args:
	i(Standard_Integer)
	j(Standard_Integer)
	u(Standard_Real)

Returns:
	Standard_Real

Converts local parameter u on patch i,j to global parameter U") ULocalToGlobal;
		Standard_Real ULocalToGlobal (const Standard_Integer i,const Standard_Integer j,const Standard_Real u);
		%feature("autodoc", "Args:
	i(Standard_Integer)
	j(Standard_Integer)
	v(Standard_Real)

Returns:
	Standard_Real

Converts local parameter v on patch i,j to global parameter V") VLocalToGlobal;
		Standard_Real VLocalToGlobal (const Standard_Integer i,const Standard_Integer j,const Standard_Real v);
		%feature("autodoc", "Args:
	i(Standard_Integer)
	j(Standard_Integer)
	uv(gp_Pnt2d)

Returns:
	gp_Pnt2d

Converts local parameters uv on patch i,j to global parameters UV") LocalToGlobal;
		gp_Pnt2d LocalToGlobal (const Standard_Integer i,const Standard_Integer j,const gp_Pnt2d & uv);
		%feature("autodoc", "Args:
	i(Standard_Integer)
	j(Standard_Integer)
	U(Standard_Real)

Returns:
	Standard_Real

Converts global parameter U to local parameter u on patch i,j") UGlobalToLocal;
		Standard_Real UGlobalToLocal (const Standard_Integer i,const Standard_Integer j,const Standard_Real U);
		%feature("autodoc", "Args:
	i(Standard_Integer)
	j(Standard_Integer)
	V(Standard_Real)

Returns:
	Standard_Real

Converts global parameter V to local parameter v on patch i,j") VGlobalToLocal;
		Standard_Real VGlobalToLocal (const Standard_Integer i,const Standard_Integer j,const Standard_Real V);
		%feature("autodoc", "Args:
	i(Standard_Integer)
	j(Standard_Integer)
	UV(gp_Pnt2d)

Returns:
	gp_Pnt2d

Converts global parameters UV to local parameters uv on patch i,j") GlobalToLocal;
		gp_Pnt2d GlobalToLocal (const Standard_Integer i,const Standard_Integer j,const gp_Pnt2d & UV);
		%feature("autodoc", "Args:
	i(Standard_Integer)
	j(Standard_Integer)
	uFact(Standard_Real)
	Trsf(gp_Trsf2d)

Returns:
	Standard_Boolean

Computes transformation operator and uFactor descrinbing affine  
         transformation required to convert global parameters on composite  
         surface to local parameters on patch (i,j):  
         uv = ( uFactor, 1. ) X Trsf * UV;  
         NOTE: Thus Trsf contains shift and scale by V, scale by U is stored in uFact.  
         Returns True if transformation is not an identity") GlobalToLocalTransformation;
		Standard_Boolean GlobalToLocalTransformation (const Standard_Integer i,const Standard_Integer j,Standard_Real &OutValue,gp_Trsf2d & Trsf);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual void

Applies transformation to all the patches") Transform;
		virtual void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Geom_Geometry

Returns a copy of the surface") Copy;
		virtual Handle_Geom_Geometry Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

NOT IMPLEMENTED (does nothing)") UReverse;
		virtual void UReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	virtual Standard_Real

Returns U") UReversedParameter;
		virtual Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

NOT IMPLEMENTED (does nothing)") VReverse;
		virtual void VReverse ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	virtual Standard_Real

Returns V") VReversedParameter;
		virtual Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	virtual void

Returns the parametric bounds of grid") Bounds;
		virtual void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if grid is closed in U direction  
         (i.e. connected with Precision::Confusion)") IsUClosed;
		virtual Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if grid is closed in V direction  
         (i.e. connected with Precision::Confusion)") IsVClosed;
		virtual Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns False") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns False") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	virtual Handle_Geom_Curve

NOT IMPLEMENTED (returns Null curve)") UIso;
		virtual Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	virtual Handle_Geom_Curve

NOT IMPLEMENTED (returns Null curve)") VIso;
		virtual Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	virtual GeomAbs_Shape

returns C0") Continuity;
		virtual GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	virtual Standard_Boolean

returns True if N <=0") IsCNu;
		virtual Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	virtual Standard_Boolean

returns True if N <=0") IsCNv;
		virtual Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	virtual void

Computes the point of parameter U,V on the grid.") D0;
		virtual void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	virtual void

Computes the point P and the first derivatives in the  
         directions U and V at this point.") D1;
		virtual void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	virtual void

Computes the point P, the first and the second derivatives in  
         the directions U and V at this point.") D2;
		virtual void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	virtual void

Computes the point P, the first,the second and the third  
         derivatives in the directions U and V at this point.") D3;
		virtual void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	virtual gp_Vec

Computes the derivative of order Nu in the direction U and Nv  
         in the direction V at the point P(U, V).") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	pnt(gp_Pnt2d)

Returns:
	gp_Pnt

Computes the point of parameter pnt on the grid.") Value;
		gp_Pnt Value (const gp_Pnt2d & pnt);
		%feature("autodoc", "Args:
	param(ShapeExtend_Parametrisation)=ShapeExtend_Natural

Returns:
	None

Computes Joint values according to parameter") ComputeJointValues;
		void ComputeJointValues (const ShapeExtend_Parametrisation param = ShapeExtend_Natural);
		%feature("autodoc", "Args:
	prec(Standard_Real)

Returns:
	Standard_Boolean

Checks geometrical connectivity of the patches, including  
         closedness (sets fields muUClosed and myVClosed)") CheckConnectivity;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg;
		 ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg ();
		%feature("autodoc", "Args:
	aMap(ShapeExtend_DataMapOfShapeListOfMsg)

Returns:
	None

No detailed docstring for this function.") ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg;
		 ShapeExtend_DataMapIteratorOfDataMapOfShapeListOfMsg (const ShapeExtend_DataMapOfShapeListOfMsg & aMap);
		%feature("autodoc", "Args:
	aMap(ShapeExtend_DataMapOfShapeListOfMsg)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const ShapeExtend_DataMapOfShapeListOfMsg & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Message_ListOfMsg

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg;
		 ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg ();
		%feature("autodoc", "Args:
	aMap(ShapeExtend_DataMapOfTransientListOfMsg)

Returns:
	None

No detailed docstring for this function.") ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg;
		 ShapeExtend_DataMapIteratorOfDataMapOfTransientListOfMsg (const ShapeExtend_DataMapOfTransientListOfMsg & aMap);
		%feature("autodoc", "Args:
	aMap(ShapeExtend_DataMapOfTransientListOfMsg)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const ShapeExtend_DataMapOfTransientListOfMsg & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key;
		const Handle_Standard_Transient & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Message_ListOfMsg

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Message_ListOfMsg)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg;
		 ShapeExtend_DataMapNodeOfDataMapOfShapeListOfMsg (const TopoDS_Shape & K,const Message_ListOfMsg & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Message_ListOfMsg

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)
	I(Message_ListOfMsg)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg;
		 ShapeExtend_DataMapNodeOfDataMapOfTransientListOfMsg (const Handle_Standard_Transient & K,const Message_ListOfMsg & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key;
		Handle_Standard_Transient & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Message_ListOfMsg

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") ShapeExtend_DataMapOfShapeListOfMsg;
		 ShapeExtend_DataMapOfShapeListOfMsg (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(ShapeExtend_DataMapOfShapeListOfMsg)

Returns:
	ShapeExtend_DataMapOfShapeListOfMsg

No detailed docstring for this function.") Assign;
		ShapeExtend_DataMapOfShapeListOfMsg & Assign (const ShapeExtend_DataMapOfShapeListOfMsg & Other);
		%feature("autodoc", "Args:
	Other(ShapeExtend_DataMapOfShapeListOfMsg)

Returns:
	ShapeExtend_DataMapOfShapeListOfMsg

No detailed docstring for this function.") operator=;
		ShapeExtend_DataMapOfShapeListOfMsg & operator = (const ShapeExtend_DataMapOfShapeListOfMsg & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Message_ListOfMsg)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Message_ListOfMsg & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Message_ListOfMsg

No detailed docstring for this function.") Find;
		const Message_ListOfMsg & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Message_ListOfMsg

No detailed docstring for this function.") ChangeFind;
		Message_ListOfMsg & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") ShapeExtend_DataMapOfTransientListOfMsg;
		 ShapeExtend_DataMapOfTransientListOfMsg (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(ShapeExtend_DataMapOfTransientListOfMsg)

Returns:
	ShapeExtend_DataMapOfTransientListOfMsg

No detailed docstring for this function.") Assign;
		ShapeExtend_DataMapOfTransientListOfMsg & Assign (const ShapeExtend_DataMapOfTransientListOfMsg & Other);
		%feature("autodoc", "Args:
	Other(ShapeExtend_DataMapOfTransientListOfMsg)

Returns:
	ShapeExtend_DataMapOfTransientListOfMsg

No detailed docstring for this function.") operator=;
		ShapeExtend_DataMapOfTransientListOfMsg & operator = (const ShapeExtend_DataMapOfTransientListOfMsg & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)
	I(Message_ListOfMsg)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_Standard_Transient & K,const Message_ListOfMsg & I);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Message_ListOfMsg

No detailed docstring for this function.") Find;
		const Message_ListOfMsg & Find (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Message_ListOfMsg

No detailed docstring for this function.") ChangeFind;
		Message_ListOfMsg & ChangeFind (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an object Explorer") ShapeExtend_Explorer;
		 ShapeExtend_Explorer ();
		%feature("autodoc", "Args:
	seqval(Handle_TopTools_HSequenceOfShape)

Returns:
	TopoDS_Shape

Converts a sequence of Shapes to a Compound") CompoundFromSeq;
		TopoDS_Shape CompoundFromSeq (const Handle_TopTools_HSequenceOfShape & seqval);
		%feature("autodoc", "Args:
	comp(TopoDS_Shape)
	expcomp(Standard_Boolean)

Returns:
	Handle_TopTools_HSequenceOfShape

Converts a Compound to a list of Shapes  
         if <comp> is not a compound, the list contains only <comp>  
         if <comp> is Null, the list is empty  
         if <comp> is a Compound, its sub-shapes are put into the list  
         then if <expcomp> is True, if a sub-shape is a Compound, it  
         is not put to the list but its sub-shapes are (recursive)") SeqFromCompound;
		Handle_TopTools_HSequenceOfShape SeqFromCompound (const TopoDS_Shape & comp,const Standard_Boolean expcomp);
		%feature("autodoc", "Args:
	seqval(Handle_TopTools_HSequenceOfShape)
	lisval(TopTools_ListOfShape)
	clear(Standard_Boolean)=Standard_True

Returns:
	None

Converts a Sequence of Shapes to a List of Shapes  
         <clear> if True (D), commands the list to start from scratch  
         else, the list is cumulated") ListFromSeq;
		void ListFromSeq (const Handle_TopTools_HSequenceOfShape & seqval,TopTools_ListOfShape & lisval,const Standard_Boolean clear = Standard_True);
		%feature("autodoc", "Args:
	lisval(TopTools_ListOfShape)

Returns:
	Handle_TopTools_HSequenceOfShape

Converts a List of Shapes to a Sequence of Shapes") SeqFromList;
		Handle_TopTools_HSequenceOfShape SeqFromList (const TopTools_ListOfShape & lisval);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	compound(Standard_Boolean)

Returns:
	TopAbs_ShapeEnum

Returns the type of a Shape: true type if <compound> is False  
         If <compound> is True and <shape> is a Compound, iterates on  
         its items. If all are of the same type, returns this type.  
         Else, returns COMPOUND. If it is empty, returns SHAPE  
         For a Null Shape, returns SHAPE") ShapeType;
		TopAbs_ShapeEnum ShapeType (const TopoDS_Shape & shape,const Standard_Boolean compound);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	type(TopAbs_ShapeEnum)
	explore(Standard_Boolean)
	compound(Standard_Boolean)

Returns:
	TopoDS_Shape

Builds a COMPOUND from the given shape.  
         It explores the shape level by level, according to the  
         <explore> argument. If <explore> is False, only COMPOUND  
         items are explored, else all items are.  
         The following shapes are added to resulting compound:  
       - shapes which comply to <type>  
       - if <type> is WIRE, considers also free edges (and makes wires)  
       - if <type> is SHELL, considers also free faces (and makes shells)  
         If <compound> is True, gathers items in compounds which  
         correspond to starting COMPOUND,SOLID or SHELL containers, or  
         items directly contained in a Compound") SortedCompound;
		TopoDS_Shape SortedCompound (const TopoDS_Shape & shape,const TopAbs_ShapeEnum type,const Standard_Boolean explore,const Standard_Boolean compound);
		%feature("autodoc", "Args:
	list(Handle_TopTools_HSequenceOfShape)
	vertices(Handle_TopTools_HSequenceOfShape)
	edges(Handle_TopTools_HSequenceOfShape)
	wires(Handle_TopTools_HSequenceOfShape)
	faces(Handle_TopTools_HSequenceOfShape)
	shells(Handle_TopTools_HSequenceOfShape)
	solids(Handle_TopTools_HSequenceOfShape)
	compsols(Handle_TopTools_HSequenceOfShape)
	compounds(Handle_TopTools_HSequenceOfShape)

Returns:
	None

Dispatches starting list of shapes according to their type,  
         to the appropriate resulting lists  
         For each of these lists, if it is null, it is firstly created  
         else, new items are appended to the already existing ones") DispatchList;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor, creates empty wire with no edges") ShapeExtend_WireData;
		 ShapeExtend_WireData ();
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	chained(Standard_Boolean)=Standard_True
	theManifoldMode(Standard_Boolean)=Standard_True

Returns:
	None

Constructor initializing the data from TopoDS_Wire. Calls Init(wire,chained).") ShapeExtend_WireData;
		 ShapeExtend_WireData (const TopoDS_Wire & wire,const Standard_Boolean chained = Standard_True,const Standard_Boolean theManifoldMode = Standard_True);
		%feature("autodoc", "Args:
	other(Handle_ShapeExtend_WireData)

Returns:
	None

Copies data from another WireData") Init;
		void Init (const Handle_ShapeExtend_WireData & other);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	chained(Standard_Boolean)=Standard_True
	theManifoldMode(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Loads an already existing wire  
         If <chained> is True (default), edges are added in the  
         sequence as they are explored by TopoDS_Iterator  
         Else, if <chained> is False, wire is explored by  
         BRepTools_WireExplorer and it is guaranteed that edges will  
         be sequencially connected.  
Remark : In the latter case it can happen that not all edges  
         will be found (because of limitations of  
         BRepTools_WireExplorer for disconnected wires and wires  
         with seam edges).") Init;
		Standard_Boolean Init (const TopoDS_Wire & wire,const Standard_Boolean chained = Standard_True,const Standard_Boolean theManifoldMode = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears data about Wire.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	enforce(Standard_Boolean)=Standard_True

Returns:
	None

Computes the list of seam edges  
         By default (direct call), computing is enforced  
         For indirect call (from IsSeam) it is redone only if not yet  
         already done or if the list of edges has changed  
Remark : A Seam Edge is an Edge present twice in the list, once as  
         FORWARD and once as REVERSED  
         Each sense has its own PCurve, the one for FORWARD  
         must be set in first") ComputeSeams;
		void ComputeSeams (const Standard_Boolean enforce = Standard_True);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Does a circular permutation in order to set <num>th edge last") SetLast;
		void SetLast (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	None

When the wire contains at least one degenerated edge, sets it  
         as last one  
Note   : It is useful to process pcurves, for instance, while the pcurve  
         of a DGNR may not be computed from its 3D part (there is none)  
         it is computed after the other edges have been computed and  
         chained.") SetDegeneratedLast;
		void SetDegeneratedLast ();
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	atnum(Standard_Integer)=0

Returns:
	None

Adds an edge to a wire, being defined (not yet ended)  
         This is the plain, basic, function to add an edge  
         <num> = 0 (D): Appends at end  
         <num> = 1: Preprends at start  
         else, Insert before <num>  
Remark : Null Edge is simply ignored") Add;
		void Add (const TopoDS_Edge & edge,const Standard_Integer atnum = 0);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	atnum(Standard_Integer)=0

Returns:
	None

Adds an entire wire, considered as a list of edges  
Remark : The wire is assumed to be ordered (TopoDS_Iterator  
         is used)") Add;
		void Add (const TopoDS_Wire & wire,const Standard_Integer atnum = 0);
		%feature("autodoc", "Args:
	wire(Handle_ShapeExtend_WireData)
	atnum(Standard_Integer)=0

Returns:
	None

Adds a wire in the form of WireData") Add;
		void Add (const Handle_ShapeExtend_WireData & wire,const Standard_Integer atnum = 0);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	atnum(Standard_Integer)=0

Returns:
	None

Adds an edge or a wire invoking corresponding method Add") Add;
		void Add (const TopoDS_Shape & shape,const Standard_Integer atnum = 0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	mode(Standard_Integer)

Returns:
	None

Adds an edge to start or end of <self>, according to <mode>  
         0: at end, as direct  
         1: at end, as reversed  
         2: at start, as direct  
         3: at start, as reversed  
         < 0: no adding") AddOriented;
		void AddOriented (const TopoDS_Edge & edge,const Standard_Integer mode);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	mode(Standard_Integer)

Returns:
	None

Adds a wire to start or end of <self>, according to <mode>  
         0: at end, as direct  
         1: at end, as reversed  
         2: at start, as direct  
         3: at start, as reversed  
         < 0: no adding") AddOriented;
		void AddOriented (const TopoDS_Wire & wire,const Standard_Integer mode);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	mode(Standard_Integer)

Returns:
	None

Adds an edge or a wire invoking corresponding method  
         AddOriented") AddOriented;
		void AddOriented (const TopoDS_Shape & shape,const Standard_Integer mode);
		%feature("autodoc", "Args:
	num(Standard_Integer)=0

Returns:
	None

Removes an Edge, given its rank. By default removes the last edge.") Remove;
		void Remove (const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	num(Standard_Integer)=0

Returns:
	None

Replaces an edge at the given  
         rank number <num> with new one. Default is last edge (<num> = 0).") Set;
		void Set (const TopoDS_Edge & edge,const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the sense of the list and the orientation of each Edge  
         This method should be called when either wire has no seam edges  
         or face is not available") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	face(TopoDS_Face)

Returns:
	None

Reverses the sense of the list and the orientation of each Edge  
         The face is necessary for swapping pcurves for seam edges  
         (first pcurve corresponds to orientation FORWARD, and second to  
         REVERSED; when edge is reversed, pcurves must be swapped)  
         If face is NULL, no swapping is performed") Reverse;
		void Reverse (const TopoDS_Face & face);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of currently recorded edges") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of currently recorded non-manifold edges") NbNonManifoldEdges;
		Standard_Integer NbNonManifoldEdges ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	TopoDS_Edge

Returns <num>th nonmanifold Edge") NonmanifoldEdge;
		TopoDS_Edge NonmanifoldEdge (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

Returns sequence of non-manifold edges  
         This sequence can be not empty if wire data set in manifold mode but  
         initial wire has INTERNAL orientation or contains INTERNAL edges") NonmanifoldEdges;
		Handle_TopTools_HSequenceOfShape NonmanifoldEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns mode defining manifold wire data or not.  
         If manifold that nonmanifold edges will not be not  
         consider during operations(previous behaviour)  
        and they will be added only in result wire  
         else non-manifold edges will consider during operations") ManifoldMode;
		Standard_Boolean & ManifoldMode ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	TopoDS_Edge

Returns <num>th Edge") Edge;
		TopoDS_Edge Edge (const Standard_Integer num);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)

Returns:
	Standard_Integer

Returns the index of the edge  
         If the edge is a seam the orientation is also checked  
         Returns 0 if the edge is not found in the list") Index;
		Standard_Integer Index (const TopoDS_Edge & edge);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Tells if an Edge is seam (see ComputeSeams)  
An edge is considered as seam if it presents twice in  
the edge list, once as FORWARD and once as REVERSED.") IsSeam;
		Standard_Boolean IsSeam (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Makes TopoDS_Wire using  
BRep_Builder (just creates the TopoDS_Wire object and adds  
all edges into it). This method should be called when  
the wire is correct (for example, after successful  
fixes by ShapeFix_Wire) and adjacent edges share common  
vertices. In case if adjacent edges do not share the same  
vertices the resulting TopoDS_Wire will be invalid.") Wire;
		TopoDS_Wire Wire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Makes TopoDS_Wire using  
BRepAPI_MakeWire. Class BRepAPI_MakeWire merges  
geometrically coincided vertices and can disturb  
correct order of edges in the wire. If this class fails,  
null shape is returned.") WireAPIMake;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an object.") ShapeExtend_MsgRegistrator;
		 ShapeExtend_MsgRegistrator ();
		%feature("autodoc", "Args:
	object(Handle_Standard_Transient)
	message(Message_Msg)
	gravity(Message_Gravity)

Returns:
	virtual void

Sends a message to be attached to the object.  
         If the object is in the map then the message is added to the  
         list, otherwise the object is firstly added to the map.") Send;
		virtual void Send (const Handle_Standard_Transient & object,const Message_Msg & message,const Message_Gravity gravity);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	message(Message_Msg)
	gravity(Message_Gravity)

Returns:
	virtual void

Sends a message to be attached to the shape.  
         If the shape is in the map then the message is added to the  
         list, otherwise the shape is firstly added to the map.") Send;
		virtual void Send (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity);
		%feature("autodoc", "Args:
	None
Returns:
	ShapeExtend_DataMapOfTransientListOfMsg

Returns a Map of objects and message list") MapTransient;
		const ShapeExtend_DataMapOfTransientListOfMsg & MapTransient ();
		%feature("autodoc", "Args:
	None
Returns:
	ShapeExtend_DataMapOfShapeListOfMsg

Returns a Map of shapes and message list") MapShape;
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

