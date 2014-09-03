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
%module (package="OCC") AdvApp2Var

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

%include AdvApp2Var_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum AdvApp2Var_CriterionRepartition {
	AdvApp2Var_Regular = 0,
	AdvApp2Var_Incremental = 1,
};

enum AdvApp2Var_CriterionType {
	AdvApp2Var_Absolute = 0,
	AdvApp2Var_Relative = 1,
};

/* end public enums declaration */

%nodefaultctor AdvApp2Var_ApproxAFunc2Var;
class AdvApp2Var_ApproxAFunc2Var {
	public:
		%feature("autodoc", "Args:
	Num1DSS(Standard_Integer)
	Num2DSS(Standard_Integer)
	Num3DSS(Standard_Integer)
	OneDTol(Handle_TColStd_HArray1OfReal)
	TwoDTol(Handle_TColStd_HArray1OfReal)
	ThreeDTol(Handle_TColStd_HArray1OfReal)
	OneDTolFr(Handle_TColStd_HArray2OfReal)
	TwoDTolFr(Handle_TColStd_HArray2OfReal)
	ThreeDTolFr(Handle_TColStd_HArray2OfReal)
	FirstInU(Standard_Real)
	LastInU(Standard_Real)
	FirstInV(Standard_Real)
	LastInV(Standard_Real)
	FavorIso(GeomAbs_IsoType)
	ContInU(GeomAbs_Shape)
	ContInV(GeomAbs_Shape)
	PrecisCode(Standard_Integer)
	MaxDegInU(Standard_Integer)
	MaxDegInV(Standard_Integer)
	MaxPatch(Standard_Integer)
	Func(AdvApp2Var_EvaluatorFunc2Var)
	UChoice(AdvApprox_Cutting)
	VChoice(AdvApprox_Cutting)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_ApproxAFunc2Var;
		 AdvApp2Var_ApproxAFunc2Var (const Standard_Integer Num1DSS,const Standard_Integer Num2DSS,const Standard_Integer Num3DSS,const Handle_TColStd_HArray1OfReal & OneDTol,const Handle_TColStd_HArray1OfReal & TwoDTol,const Handle_TColStd_HArray1OfReal & ThreeDTol,const Handle_TColStd_HArray2OfReal & OneDTolFr,const Handle_TColStd_HArray2OfReal & TwoDTolFr,const Handle_TColStd_HArray2OfReal & ThreeDTolFr,const Standard_Real FirstInU,const Standard_Real LastInU,const Standard_Real FirstInV,const Standard_Real LastInV,const GeomAbs_IsoType FavorIso,const GeomAbs_Shape ContInU,const GeomAbs_Shape ContInV,const Standard_Integer PrecisCode,const Standard_Integer MaxDegInU,const Standard_Integer MaxDegInV,const Standard_Integer MaxPatch,const AdvApp2Var_EvaluatorFunc2Var & Func,AdvApprox_Cutting & UChoice,AdvApprox_Cutting & VChoice);
		%feature("autodoc", "Args:
	Num1DSS(Standard_Integer)
	Num2DSS(Standard_Integer)
	Num3DSS(Standard_Integer)
	OneDTol(Handle_TColStd_HArray1OfReal)
	TwoDTol(Handle_TColStd_HArray1OfReal)
	ThreeDTol(Handle_TColStd_HArray1OfReal)
	OneDTolFr(Handle_TColStd_HArray2OfReal)
	TwoDTolFr(Handle_TColStd_HArray2OfReal)
	ThreeDTolFr(Handle_TColStd_HArray2OfReal)
	FirstInU(Standard_Real)
	LastInU(Standard_Real)
	FirstInV(Standard_Real)
	LastInV(Standard_Real)
	FavorIso(GeomAbs_IsoType)
	ContInU(GeomAbs_Shape)
	ContInV(GeomAbs_Shape)
	PrecisCode(Standard_Integer)
	MaxDegInU(Standard_Integer)
	MaxDegInV(Standard_Integer)
	MaxPatch(Standard_Integer)
	Func(AdvApp2Var_EvaluatorFunc2Var)
	Crit(AdvApp2Var_Criterion)
	UChoice(AdvApprox_Cutting)
	VChoice(AdvApprox_Cutting)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_ApproxAFunc2Var;
		 AdvApp2Var_ApproxAFunc2Var (const Standard_Integer Num1DSS,const Standard_Integer Num2DSS,const Standard_Integer Num3DSS,const Handle_TColStd_HArray1OfReal & OneDTol,const Handle_TColStd_HArray1OfReal & TwoDTol,const Handle_TColStd_HArray1OfReal & ThreeDTol,const Handle_TColStd_HArray2OfReal & OneDTolFr,const Handle_TColStd_HArray2OfReal & TwoDTolFr,const Handle_TColStd_HArray2OfReal & ThreeDTolFr,const Standard_Real FirstInU,const Standard_Real LastInU,const Standard_Real FirstInV,const Standard_Real LastInV,const GeomAbs_IsoType FavorIso,const GeomAbs_Shape ContInU,const GeomAbs_Shape ContInV,const Standard_Integer PrecisCode,const Standard_Integer MaxDegInU,const Standard_Integer MaxDegInV,const Standard_Integer MaxPatch,const AdvApp2Var_EvaluatorFunc2Var & Func,const AdvApp2Var_Criterion & Crit,AdvApprox_Cutting & UChoice,AdvApprox_Cutting & VChoice);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the approximation succeeded within the imposed  
 tolerances and the wished continuities") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the approximation did come out with a result that  
 is not NECESSARELY within the required tolerance or a result  
 that is not recognized with the wished continuities") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BSplineSurface

returns the BSplineSurface of range Index") Surface;
		Handle_Geom_BSplineSurface Surface (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NumSubSpaces;
		Standard_Integer NumSubSpaces (const Standard_Integer Dimension);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfReal

returns the errors max") MaxError;
		Handle_TColStd_HArray1OfReal MaxError (const Standard_Integer Dimension);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfReal

returns the average errors") AverageError;
		Handle_TColStd_HArray1OfReal AverageError (const Standard_Integer Dimension);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfReal

returns the errors max on UFrontiers  
 Warning:  
    Dimension must be equal to 3.") UFrontError;
		Handle_TColStd_HArray1OfReal UFrontError (const Standard_Integer Dimension);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfReal

returns the errors max on VFrontiers  
 Warning:  
    Dimension must be equal to 3.") VFrontError;
		Handle_TColStd_HArray1OfReal VFrontError (const Standard_Integer Dimension);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the error max of the BSplineSurface of range Index") MaxError;
		Standard_Real MaxError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the average error of the BSplineSurface of range Index") AverageError;
		Standard_Real AverageError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the error max of the BSplineSurface of range Index on a UFrontier") UFrontError;
		Standard_Real UFrontError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the error max of the BSplineSurface of range Index on a VFrontier") VFrontError;
		Standard_Real VFrontError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") CritError;
		Standard_Real CritError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("autodoc", "Args:
	o(Standard_OStream)

Returns:
	None

Prints on the stream o informations on the current state  
         of the object.") Dump;
		void Dump (Standard_OStream & o);
};


%feature("shadow") AdvApp2Var_ApproxAFunc2Var::~AdvApp2Var_ApproxAFunc2Var %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_ApproxAFunc2Var {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_ApproxF2var;
class AdvApp2Var_ApproxF2var {
	public:
		%feature("autodoc", "Args:
	ndimen(integer *)
	nbsesp(integer *)
	ndimse(integer *)
	uvfonc(doublereal *)
	foncnp(AdvApp2Var_EvaluatorFunc2Var)
	tconst(doublereal *)
	isofav(integer *)
	nbroot(integer *)
	rootlg(doublereal *)
	iordre(integer *)
	ideriv(integer *)
	ndgjac(integer *)
	nbcrmx(integer *)
	ncflim(integer *)
	epsapr(doublereal *)
	ncoeff(integer *)
	courbe(doublereal *)
	nbcrbe(integer *)
	somtab(doublereal *)
	diftab(doublereal *)
	contr1(doublereal *)
	contr2(doublereal *)
	tabdec(doublereal *)
	errmax(doublereal *)
	errmoy(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mma2fnc_;
		static int mma2fnc_ (integer * ndimen,integer * nbsesp,integer * ndimse,doublereal * uvfonc,const AdvApp2Var_EvaluatorFunc2Var & foncnp,doublereal * tconst,integer * isofav,integer * nbroot,doublereal * rootlg,integer * iordre,integer * ideriv,integer * ndgjac,integer * nbcrmx,integer * ncflim,doublereal * epsapr,integer * ncoeff,doublereal * courbe,integer * nbcrbe,doublereal * somtab,doublereal * diftab,doublereal * contr1,doublereal * contr2,doublereal * tabdec,doublereal * errmax,doublereal * errmoy,integer * iercod);
		%feature("autodoc", "Args:
	nbpntu(integer *)
	nbpntv(integer *)
	urootl(doublereal *)
	vrootl(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mma2roo_;
		static int mma2roo_ (integer * nbpntu,integer * nbpntv,doublereal * urootl,doublereal * vrootl);
		%feature("autodoc", "Args:
	ndgjac(integer *)
	iordre(integer *)
	xjacmx(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mma2jmx_;
		static int mma2jmx_ (integer * ndgjac,integer * iordre,doublereal * xjacmx);
		%feature("autodoc", "Args:
	(integer *)
	(integer *)
	(integer *)
	(doublereal *)
	(integer *)

Returns:
	static int

No detailed docstring for this function.") mmapptt_;
		static int mmapptt_ (const integer * ,const integer * ,const integer * ,doublereal * ,integer * );
		%feature("autodoc", "Args:
	ndimen(integer *)
	nbpntu(integer *)
	urootl(doublereal *)
	nbpntv(integer *)
	vrootl(doublereal *)
	iordru(integer *)
	iordrv(integer *)
	contr1(doublereal *)
	contr2(doublereal *)
	contr3(doublereal *)
	contr4(doublereal *)
	sotbu1(doublereal *)
	sotbu2(doublereal *)
	ditbu1(doublereal *)
	ditbu2(doublereal *)
	sotbv1(doublereal *)
	sotbv2(doublereal *)
	ditbv1(doublereal *)
	ditbv2(doublereal *)
	sosotb(doublereal *)
	soditb(doublereal *)
	disotb(doublereal *)
	diditb(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mma2cdi_;
		static int mma2cdi_ (integer * ndimen,integer * nbpntu,doublereal * urootl,integer * nbpntv,doublereal * vrootl,integer * iordru,integer * iordrv,doublereal * contr1,doublereal * contr2,doublereal * contr3,doublereal * contr4,doublereal * sotbu1,doublereal * sotbu2,doublereal * ditbu1,doublereal * ditbu2,doublereal * sotbv1,doublereal * sotbv2,doublereal * ditbv1,doublereal * ditbv2,doublereal * sosotb,doublereal * soditb,doublereal * disotb,doublereal * diditb,integer * iercod);
		%feature("autodoc", "Args:
	ndimen(integer *)
	uintfn(doublereal *)
	vintfn(doublereal *)
	foncnp(AdvApp2Var_EvaluatorFunc2Var)
	nbpntu(integer *)
	nbpntv(integer *)
	urootb(doublereal *)
	vrootb(doublereal *)
	isofav(integer *)
	sosotb(doublereal *)
	disotb(doublereal *)
	soditb(doublereal *)
	diditb(doublereal *)
	fpntab(doublereal *)
	ttable(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mma2ds1_;
		static int mma2ds1_ (integer * ndimen,doublereal * uintfn,doublereal * vintfn,const AdvApp2Var_EvaluatorFunc2Var & foncnp,integer * nbpntu,integer * nbpntv,doublereal * urootb,doublereal * vrootb,integer * isofav,doublereal * sosotb,doublereal * disotb,doublereal * soditb,doublereal * diditb,doublereal * fpntab,doublereal * ttable,integer * iercod);
		%feature("autodoc", "Args:
	numdec(integer *)
	ndimen(integer *)
	nbsesp(integer *)
	ndimse(integer *)
	ndminu(integer *)
	ndminv(integer *)
	ndguli(integer *)
	ndgvli(integer *)
	ndjacu(integer *)
	ndjacv(integer *)
	iordru(integer *)
	iordrv(integer *)
	nbpntu(integer *)
	nbpntv(integer *)
	epsapr(doublereal *)
	sosotb(doublereal *)
	disotb(doublereal *)
	soditb(doublereal *)
	diditb(doublereal *)
	patjac(doublereal *)
	errmax(doublereal *)
	errmoy(doublereal *)
	ndegpu(integer *)
	ndegpv(integer *)
	itydec(integer *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mma2ce1_;
		static int mma2ce1_ (integer * numdec,integer * ndimen,integer * nbsesp,integer * ndimse,integer * ndminu,integer * ndminv,integer * ndguli,integer * ndgvli,integer * ndjacu,integer * ndjacv,integer * iordru,integer * iordrv,integer * nbpntu,integer * nbpntv,doublereal * epsapr,doublereal * sosotb,doublereal * disotb,doublereal * soditb,doublereal * diditb,doublereal * patjac,doublereal * errmax,doublereal * errmoy,integer * ndegpu,integer * ndegpv,integer * itydec,integer * iercod);
		%feature("autodoc", "Args:
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(doublereal *)
	(doublereal *)
	(doublereal *)
	(integer *)

Returns:
	static int

No detailed docstring for this function.") mma2can_;
		static int mma2can_ (const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const doublereal * ,doublereal * ,doublereal * ,integer * );
		%feature("autodoc", "Args:
	(integer *)
	(doublereal *)
	(integer *)

Returns:
	static int

No detailed docstring for this function.") mma1her_;
		static int mma1her_ (const integer * ,doublereal * ,integer * );
		%feature("autodoc", "Args:
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(doublereal *)
	(integer *)
	(doublereal *)
	(doublereal *)
	(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mma2ac2_;
		static int mma2ac2_ (const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const doublereal * ,const integer * ,const doublereal * ,const doublereal * ,doublereal * );
		%feature("autodoc", "Args:
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(doublereal *)
	(integer *)
	(doublereal *)
	(doublereal *)
	(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mma2ac3_;
		static int mma2ac3_ (const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const doublereal * ,const integer * ,const doublereal * ,const doublereal * ,doublereal * );
		%feature("autodoc", "Args:
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(doublereal *)
	(doublereal *)
	(doublereal *)
	(doublereal *)
	(doublereal *)
	(doublereal *)
	(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mma2ac1_;
		static int mma2ac1_ (const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const doublereal * ,const doublereal * ,const doublereal * ,const doublereal * ,const doublereal * ,const doublereal * ,doublereal * );
		%feature("autodoc", "Args:
	ncfmxu(integer *)
	ncfmxv(integer *)
	ndimen(integer *)
	nbsesp(integer *)
	ndimse(integer *)
	nbupat(integer *)
	nbvpat(integer *)
	iordru(integer *)
	iordrv(integer *)
	epsapr(doublereal *)
	epsfro(doublereal *)
	patcan(doublereal *)
	errmax(doublereal *)
	ncoefu(integer *)
	ncoefv(integer *)

Returns:
	static int

No detailed docstring for this function.") mma2fx6_;
		static int mma2fx6_ (integer * ncfmxu,integer * ncfmxv,integer * ndimen,integer * nbsesp,integer * ndimse,integer * nbupat,integer * nbvpat,integer * iordru,integer * iordrv,doublereal * epsapr,doublereal * epsfro,doublereal * patcan,doublereal * errmax,integer * ncoefu,integer * ncoefv);
};


%feature("shadow") AdvApp2Var_ApproxF2var::~AdvApp2Var_ApproxF2var %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_ApproxF2var {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_Context;
class AdvApp2Var_Context {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Context;
		 AdvApp2Var_Context ();
		%feature("autodoc", "Args:
	ifav(Standard_Integer)
	iu(Standard_Integer)
	iv(Standard_Integer)
	nlimu(Standard_Integer)
	nlimv(Standard_Integer)
	iprecis(Standard_Integer)
	nb1Dss(Standard_Integer)
	nb2Dss(Standard_Integer)
	nb3Dss(Standard_Integer)
	tol1D(Handle_TColStd_HArray1OfReal)
	tol2D(Handle_TColStd_HArray1OfReal)
	tol3D(Handle_TColStd_HArray1OfReal)
	tof1D(Handle_TColStd_HArray2OfReal)
	tof2D(Handle_TColStd_HArray2OfReal)
	tof3D(Handle_TColStd_HArray2OfReal)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Context;
		 AdvApp2Var_Context (const Standard_Integer ifav,const Standard_Integer iu,const Standard_Integer iv,const Standard_Integer nlimu,const Standard_Integer nlimv,const Standard_Integer iprecis,const Standard_Integer nb1Dss,const Standard_Integer nb2Dss,const Standard_Integer nb3Dss,const Handle_TColStd_HArray1OfReal & tol1D,const Handle_TColStd_HArray1OfReal & tol2D,const Handle_TColStd_HArray1OfReal & tol3D,const Handle_TColStd_HArray2OfReal & tof1D,const Handle_TColStd_HArray2OfReal & tof2D,const Handle_TColStd_HArray2OfReal & tof3D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") TotalDimension;
		Standard_Integer TotalDimension ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") TotalNumberSSP;
		Standard_Integer TotalNumberSSP ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FavorIso;
		Standard_Integer FavorIso ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UOrder;
		Standard_Integer UOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VOrder;
		Standard_Integer VOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ULimit;
		Standard_Integer ULimit ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VLimit;
		Standard_Integer VLimit ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UJacDeg;
		Standard_Integer UJacDeg ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VJacDeg;
		Standard_Integer VJacDeg ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") UJacMax;
		Handle_TColStd_HArray1OfReal UJacMax ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") VJacMax;
		Handle_TColStd_HArray1OfReal VJacMax ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") URoots;
		Handle_TColStd_HArray1OfReal URoots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") VRoots;
		Handle_TColStd_HArray1OfReal VRoots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") UGauss;
		Handle_TColStd_HArray1OfReal UGauss ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") VGauss;
		Handle_TColStd_HArray1OfReal VGauss ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") IToler;
		Handle_TColStd_HArray1OfReal IToler ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray2OfReal

No detailed docstring for this function.") FToler;
		Handle_TColStd_HArray2OfReal FToler ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray2OfReal

No detailed docstring for this function.") CToler;
		Handle_TColStd_HArray2OfReal CToler ();
};


%feature("shadow") AdvApp2Var_Context::~AdvApp2Var_Context %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_Context {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_Criterion;
class AdvApp2Var_Criterion {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	P(AdvApp2Var_Patch)
	C(AdvApp2Var_Context)

Returns:
	virtual void

No detailed docstring for this function.") Value;
		virtual void Value (AdvApp2Var_Patch & P,const AdvApp2Var_Context & C);
		%feature("autodoc", "Args:
	P(AdvApp2Var_Patch)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsSatisfied;
		virtual Standard_Boolean IsSatisfied (const AdvApp2Var_Patch & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxValue;
		Standard_Real MaxValue ();
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_CriterionType

No detailed docstring for this function.") Type;
		AdvApp2Var_CriterionType Type ();
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_CriterionRepartition

No detailed docstring for this function.") Repartition;
		AdvApp2Var_CriterionRepartition Repartition ();
};


%feature("shadow") AdvApp2Var_Criterion::~AdvApp2Var_Criterion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_Criterion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_Data;
class AdvApp2Var_Data {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static mdnombr_1_

No detailed docstring for this function.") Getmdnombr;
		static mdnombr_1_ & Getmdnombr ();
		%feature("autodoc", "Args:
	None
Returns:
	static minombr_1_

No detailed docstring for this function.") Getminombr;
		static minombr_1_ & Getminombr ();
		%feature("autodoc", "Args:
	None
Returns:
	static maovpar_1_

No detailed docstring for this function.") Getmaovpar;
		static maovpar_1_ & Getmaovpar ();
		%feature("autodoc", "Args:
	None
Returns:
	static maovpch_1_

No detailed docstring for this function.") Getmaovpch;
		static maovpch_1_ & Getmaovpch ();
		%feature("autodoc", "Args:
	None
Returns:
	static mlgdrtl_1_

No detailed docstring for this function.") Getmlgdrtl;
		static mlgdrtl_1_ & Getmlgdrtl ();
		%feature("autodoc", "Args:
	None
Returns:
	static mmjcobi_1_

No detailed docstring for this function.") Getmmjcobi;
		static mmjcobi_1_ & Getmmjcobi ();
		%feature("autodoc", "Args:
	None
Returns:
	static mmcmcnp_1_

No detailed docstring for this function.") Getmmcmcnp;
		static mmcmcnp_1_ & Getmmcmcnp ();
		%feature("autodoc", "Args:
	None
Returns:
	static mmapgss_1_

No detailed docstring for this function.") Getmmapgss;
		static mmapgss_1_ & Getmmapgss ();
		%feature("autodoc", "Args:
	None
Returns:
	static mmapgs0_1_

No detailed docstring for this function.") Getmmapgs0;
		static mmapgs0_1_ & Getmmapgs0 ();
		%feature("autodoc", "Args:
	None
Returns:
	static mmapgs1_1_

No detailed docstring for this function.") Getmmapgs1;
		static mmapgs1_1_ & Getmmapgs1 ();
		%feature("autodoc", "Args:
	None
Returns:
	static mmapgs2_1_

No detailed docstring for this function.") Getmmapgs2;
		static mmapgs2_1_ & Getmmapgs2 ();
};


%feature("shadow") AdvApp2Var_Data::~AdvApp2Var_Data %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_Data {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_Framework;
class AdvApp2Var_Framework {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Framework;
		 AdvApp2Var_Framework ();
		%feature("autodoc", "Args:
	Frame(AdvApp2Var_SequenceOfNode)
	UFrontier(AdvApp2Var_SequenceOfStrip)
	VFrontier(AdvApp2Var_SequenceOfStrip)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Framework;
		 AdvApp2Var_Framework (const AdvApp2Var_SequenceOfNode & Frame,const AdvApp2Var_SequenceOfStrip & UFrontier,const AdvApp2Var_SequenceOfStrip & VFrontier);
		%feature("autodoc", "Args:
	IndexIso(Standard_Integer)
	IndexStrip(Standard_Integer)
	anIso(AdvApp2Var_Iso)

Returns:
	Standard_Boolean

search the Index of the first Iso not approximated,  
         if all Isos are approximated Standard_False is returned.") FirstNotApprox;
		Standard_Boolean FirstNotApprox (Standard_Integer &OutValue,Standard_Integer &OutValue,AdvApp2Var_Iso & anIso);
		%feature("autodoc", "Args:
	Type(GeomAbs_IsoType)
	IndexIso(Standard_Integer)
	IndexStrip(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") FirstNode;
		Standard_Integer FirstNode (const GeomAbs_IsoType Type,const Standard_Integer IndexIso,const Standard_Integer IndexStrip);
		%feature("autodoc", "Args:
	Type(GeomAbs_IsoType)
	IndexIso(Standard_Integer)
	IndexStrip(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") LastNode;
		Standard_Integer LastNode (const GeomAbs_IsoType Type,const Standard_Integer IndexIso,const Standard_Integer IndexStrip);
		%feature("autodoc", "Args:
	IndexIso(Standard_Integer)
	IndexStrip(Standard_Integer)
	anIso(AdvApp2Var_Iso)

Returns:
	None

No detailed docstring for this function.") ChangeIso;
		void ChangeIso (const Standard_Integer IndexIso,const Standard_Integer IndexStrip,const AdvApp2Var_Iso & anIso);
		%feature("autodoc", "Args:
	IndexNode(Standard_Integer)

Returns:
	AdvApp2Var_Node

No detailed docstring for this function.") Node;
		const AdvApp2Var_Node & Node (const Standard_Integer IndexNode);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	AdvApp2Var_Node

No detailed docstring for this function.") Node;
		const AdvApp2Var_Node & Node (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V0(Standard_Real)
	V1(Standard_Real)

Returns:
	AdvApp2Var_Iso

No detailed docstring for this function.") IsoU;
		const AdvApp2Var_Iso & IsoU (const Standard_Real U,const Standard_Real V0,const Standard_Real V1);
		%feature("autodoc", "Args:
	U0(Standard_Real)
	U1(Standard_Real)
	V(Standard_Real)

Returns:
	AdvApp2Var_Iso

No detailed docstring for this function.") IsoV;
		const AdvApp2Var_Iso & IsoV (const Standard_Real U0,const Standard_Real U1,const Standard_Real V);
		%feature("autodoc", "Args:
	IndexNode(Standard_Integer)

Returns:
	AdvApp2Var_Node

No detailed docstring for this function.") ChangeNode;
		AdvApp2Var_Node & ChangeNode (const Standard_Integer IndexNode);
		%feature("autodoc", "Args:
	CuttingValue(Standard_Real)

Returns:
	None

No detailed docstring for this function.") UpdateInU;
		void UpdateInU (const Standard_Real CuttingValue);
		%feature("autodoc", "Args:
	CuttingValue(Standard_Real)

Returns:
	None

No detailed docstring for this function.") UpdateInV;
		void UpdateInV (const Standard_Real CuttingValue);
		%feature("autodoc", "Args:
	IndexIso(Standard_Integer)
	IndexStrip(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") UEquation;
		const Handle_TColStd_HArray1OfReal & UEquation (const Standard_Integer IndexIso,const Standard_Integer IndexStrip);
		%feature("autodoc", "Args:
	IndexIso(Standard_Integer)
	IndexStrip(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") VEquation;
		const Handle_TColStd_HArray1OfReal & VEquation (const Standard_Integer IndexIso,const Standard_Integer IndexStrip);
};


%feature("shadow") AdvApp2Var_Framework::~AdvApp2Var_Framework %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_Framework {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_MathBase;
class AdvApp2Var_MathBase {
	public:
		%feature("autodoc", "Args:
	(integer *)
	(integer *)
	(integer *)
	(double *)
	(double *)

Returns:
	static int

///") mmapcmp_;
		static int mmapcmp_ (integer * ,integer * ,integer * ,double * ,double * );
		%feature("autodoc", "Args:
	(integer *)
	(integer *)
	(integer *)
	(doublereal *)
	(doublereal *)
	(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmdrc11_;
		static int mmdrc11_ (integer * ,integer * ,integer * ,doublereal * ,doublereal * ,doublereal * );
		%feature("autodoc", "Args:
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(integer *)
	(doublereal *)
	(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmfmca9_;
		static int mmfmca9_ (integer * ,integer * ,integer * ,integer * ,integer * ,integer * ,doublereal * ,doublereal * );
		%feature("autodoc", "Args:
	(integer *)
	(integer *)
	(integer *)
	(doublereal *)
	(integer *)
	(integer *)
	(integer *)
	(doublereal *)
	(integer *)

Returns:
	static int

No detailed docstring for this function.") mmfmcb5_;
		static int mmfmcb5_ (integer * ,integer * ,integer * ,doublereal * ,integer * ,integer * ,integer * ,doublereal * ,integer * );
		%feature("autodoc", "Args:
	(doublereal *)
	(doublereal *)
	(doublereal *)
	(doublereal *)
	(integer *)
	(integer *)

Returns:
	static void

No detailed docstring for this function.") mmwprcs_;
		static void mmwprcs_ (doublereal * ,doublereal * ,doublereal * ,doublereal * ,integer * ,integer * );
		%feature("autodoc", "Args:
	ndimax(integer *)
	ndimen(integer *)
	ncoeff(integer *)
	courbe(doublereal *)
	tdebut(doublereal *)
	tfinal(doublereal *)
	epsiln(doublereal *)
	xlongc(doublereal *)
	erreur(doublereal *)
	iercod(integer *)

Returns:
	static int

///") mmcglc1_;
		static int mmcglc1_ (integer * ndimax,integer * ndimen,integer * ncoeff,doublereal * courbe,doublereal * tdebut,doublereal * tfinal,doublereal * epsiln,doublereal * xlongc,doublereal * erreur,integer * iercod);
		%feature("autodoc", "Args:
	nbcoln(integer *)
	nblign(integer *)
	dtabtr(doublereal *)
	numcle(integer *)

Returns:
	static int

No detailed docstring for this function.") mmbulld_;
		static int mmbulld_ (integer * nbcoln,integer * nblign,doublereal * dtabtr,integer * numcle);
		%feature("autodoc", "Args:
	ndimen(integer *)
	ncoeff(integer *)
	courbe(doublereal *)
	ideriv(integer *)
	ncofdv(integer *)
	crvdrv(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmcdriv_;
		static int mmcdriv_ (integer * ndimen,integer * ncoeff,doublereal * courbe,integer * ideriv,integer * ncofdv,doublereal * crvdrv);
		%feature("autodoc", "Args:
	ndimen(integer *)
	ncofmx(integer *)
	nderiv(integer *)
	ctrtes(doublereal *)
	crvres(doublereal *)
	tabaux(doublereal *)
	xmatri(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmcvctx_;
		static int mmcvctx_ (integer * ndimen,integer * ncofmx,integer * nderiv,doublereal * ctrtes,doublereal * crvres,doublereal * tabaux,doublereal * xmatri,integer * iercod);
		%feature("autodoc", "Args:
	ndimen(integer *)
	point1(doublereal *)
	point2(doublereal *)
	distan(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mdsptpt_;
		static int mdsptpt_ (integer * ndimen,doublereal * point1,doublereal * point2,doublereal * distan);
		%feature("autodoc", "Args:
	ncofmx(integer *)
	ndimen(integer *)
	ncoeff(integer *)
	iordre(integer *)
	crvjac(doublereal *)
	ncfnew(integer *)
	ycvmax(doublereal *)
	errmax(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmaperx_;
		static int mmaperx_ (integer * ncofmx,integer * ndimen,integer * ncoeff,integer * iordre,doublereal * crvjac,integer * ncfnew,doublereal * ycvmax,doublereal * errmax,integer * iercod);
		%feature("autodoc", "Args:
	ncoeff(integer *)
	ndimen(integer *)
	courbe(doublereal *)
	ideriv(integer *)
	tparam(doublereal *)
	pntcrb(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmdrvck_;
		static int mmdrvck_ (integer * ncoeff,integer * ndimen,doublereal * courbe,integer * ideriv,doublereal * tparam,doublereal * pntcrb);
		%feature("autodoc", "Args:
	epsilo(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmeps1_;
		static int mmeps1_ (doublereal * epsilo);
		%feature("autodoc", "Args:
	ndimen(integer *)
	ncoefu(integer *)
	ncoefv(integer *)
	ndimax(integer *)
	ncfumx(integer *)
	ncfvmx(integer *)
	tabini(doublereal *)
	tabres(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmfmca8_;
		static int mmfmca8_ (const integer * ndimen,const integer * ncoefu,const integer * ncoefv,const integer * ndimax,const integer * ncfumx,const integer * ncfvmx,doublereal * tabini,doublereal * tabres);
		%feature("autodoc", "Args:
	ndimen(integer *)
	ncofmx(integer *)
	ncoefu(integer *)
	ncoefv(integer *)
	patold(doublereal *)
	upara1(doublereal *)
	upara2(doublereal *)
	vpara1(doublereal *)
	vpara2(doublereal *)
	patnew(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmfmcar_;
		static int mmfmcar_ (integer * ndimen,integer * ncofmx,integer * ncoefu,integer * ncoefv,doublereal * patold,doublereal * upara1,doublereal * upara2,doublereal * vpara1,doublereal * vpara2,doublereal * patnew,integer * iercod);
		%feature("autodoc", "Args:
	maxsz1(integer *)
	table1(doublereal *)
	isize1(integer *)
	jsize1(integer *)
	maxsz2(integer *)
	table2(doublereal *)
	isize2(integer *)
	jsize2(integer *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmfmtb1_;
		static int mmfmtb1_ (integer * maxsz1,doublereal * table1,integer * isize1,integer * jsize1,integer * maxsz2,doublereal * table2,integer * isize2,integer * jsize2,integer * iercod);
		%feature("autodoc", "Args:
	ndimf(integer *)
	(int(*bfunx)(integer*ninteg,doublereal*parame,doublereal*vfunj1,integer*iercod))
	k(integer *)
	xd(doublereal *)
	xf(doublereal *)
	saux1(doublereal *)
	saux2(doublereal *)
	somme(doublereal *)
	niter(integer *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmgaus1_;
		static int mmgaus1_ (integer * ndimf,int(*bfunx)(integer*ninteg,doublereal*parame,doublereal*vfunj1,integer*iercod) ,integer * k,doublereal * xd,doublereal * xf,doublereal * saux1,doublereal * saux2,doublereal * somme,integer * niter,integer * iercod);
		%feature("autodoc", "Args:
	ndimen(integer *)
	ncourb(integer *)
	ncftab(integer *)
	orcont(integer *)
	ncflim(integer *)
	tcbold(doublereal *)
	tdecop(doublereal *)
	tcbnew(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmhjcan_;
		static int mmhjcan_ (integer * ndimen,integer * ncourb,integer * ncftab,integer * orcont,integer * ncflim,doublereal * tcbold,doublereal * tdecop,doublereal * tcbnew,integer * iercod);
		%feature("autodoc", "Args:
	ncolmx(integer *)
	nlgnmx(integer *)
	tabtri(doublereal *)
	nbrcol(integer *)
	nbrlgn(integer *)
	ajoute(doublereal *)
	epseg(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mminltt_;
		static int mminltt_ (integer * ncolmx,integer * nlgnmx,doublereal * tabtri,integer * nbrcol,integer * nbrlgn,doublereal * ajoute,doublereal * epseg,integer * iercod);
		%feature("autodoc", "Args:
	ncoef(integer *)
	ndim(integer *)
	ider(integer *)
	crvlgd(doublereal *)
	polaux(doublereal *)
	crvcan(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmjaccv_;
		static int mmjaccv_ (const integer * ncoef,const integer * ndim,const integer * ider,const doublereal * crvlgd,doublereal * polaux,doublereal * crvcan);
		%feature("autodoc", "Args:
	tparam(doublereal *)
	iordre(integer *)
	ncoeff(integer *)
	nderiv(integer *)
	valbas(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmpobas_;
		static int mmpobas_ (doublereal * tparam,integer * iordre,integer * ncoeff,integer * nderiv,doublereal * valbas,integer * iercod);
		%feature("autodoc", "Args:
	ncofmx(integer *)
	ndim(integer *)
	ndeg(integer *)
	courbe(doublereal *)
	tparam(doublereal *)
	tabval(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmmpocur_;
		static int mmmpocur_ (integer * ncofmx,integer * ndim,integer * ndeg,doublereal * courbe,doublereal * tparam,doublereal * tabval);
		%feature("autodoc", "Args:
	dimmat(integer *)
	nistoc(integer *)
	aposit(integer *)
	posuiv(integer *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmposui_;
		static int mmposui_ (integer * dimmat,integer * nistoc,integer * aposit,integer * posuiv,integer * iercod);
		%feature("autodoc", "Args:
	hdimen(integer *)
	gdimen(integer *)
	hnstoc(integer *)
	gnstoc(integer *)
	mnstoc(integer *)
	matsyh(doublereal *)
	matsyg(doublereal *)
	vecsyh(doublereal *)
	vecsyg(doublereal *)
	hposit(integer *)
	hposui(integer *)
	gposit(integer *)
	mmposui(integer *)
	mposit(integer *)
	vecsol(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmresol_;
		static int mmresol_ (integer * hdimen,integer * gdimen,integer * hnstoc,integer * gnstoc,integer * mnstoc,doublereal * matsyh,doublereal * matsyg,doublereal * vecsyh,doublereal * vecsyg,integer * hposit,integer * hposui,integer * gposit,integer * mmposui,integer * mposit,doublereal * vecsol,integer * iercod);
		%feature("autodoc", "Args:
	ndglgd(integer *)
	rtlegd(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmrtptt_;
		static int mmrtptt_ (integer * ndglgd,doublereal * rtlegd);
		%feature("autodoc", "Args:
	tparam(doublereal *)
	nbrval(integer *)
	tablev(doublereal *)
	epsil(doublereal *)
	numint(integer *)
	itypen(integer *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmsrre2_;
		static int mmsrre2_ (doublereal * tparam,integer * nbrval,doublereal * tablev,doublereal * epsil,integer * numint,integer * itypen,integer * iercod);
		%feature("autodoc", "Args:
	ncofmx(integer *)
	ndimen(integer *)
	ncoeff(integer *)
	epsi3d(doublereal *)
	iordre(integer *)
	crvlgd(doublereal *)
	ycvmax(doublereal *)
	errmax(doublereal *)
	ncfnew(integer *)

Returns:
	static int

No detailed docstring for this function.") mmtrpjj_;
		static int mmtrpjj_ (integer * ncofmx,integer * ndimen,integer * ncoeff,doublereal * epsi3d,integer * iordre,doublereal * crvlgd,doublereal * ycvmax,doublereal * errmax,integer * ncfnew);
		%feature("autodoc", "Args:
	ndimen(integer *)
	vector(doublereal *)
	vecnrm(doublereal *)
	epsiln(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmunivt_;
		static int mmunivt_ (integer * ndimen,doublereal * vector,doublereal * vecnrm,doublereal * epsiln,integer * iercod);
		%feature("autodoc", "Args:
	ndimen(integer *)
	vecin(doublereal *)
	vecout(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmvncol_;
		static int mmvncol_ (integer * ndimen,doublereal * vecin,doublereal * vecout,integer * iercod);
		%feature("autodoc", "Args:
	ndimen(integer *)
	vecte1(doublereal *)
	vecte2(doublereal *)

Returns:
	static doublereal

No detailed docstring for this function.") msc_;
		static doublereal msc_ (integer * ndimen,doublereal * vecte1,doublereal * vecte2);
		%feature("autodoc", "Args:
	n(integer *)
	is(integer *)
	dtab(doublereal *)
	icle(integer *)

Returns:
	static int

No detailed docstring for this function.") mvsheld_;
		static int mvsheld_ (integer * n,integer * is,doublereal * dtab,integer * icle);
		%feature("autodoc", "Args:
	ndimax(integer *)
	ndim(integer *)
	ncoeff(integer *)
	crvold(doublereal *)
	u0(doublereal *)
	u1(doublereal *)
	crvnew(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmarcin_;
		static int mmarcin_ (integer * ndimax,integer * ndim,integer * ncoeff,doublereal * crvold,doublereal * u0,doublereal * u1,doublereal * crvnew,integer * iercod);
		%feature("autodoc", "Args:
	ndimax(integer *)
	ncoef(integer *)
	ndim(integer *)
	curveo(doublereal *)
	curve(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmcvinv_;
		static int mmcvinv_ (integer * ndimax,integer * ncoef,integer * ndim,doublereal * curveo,doublereal * curve);
		%feature("autodoc", "Args:
	ideriv(integer *)
	ndeg(integer *)
	poljac(doublereal *)
	polcan(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmjacan_;
		static int mmjacan_ (const integer * ideriv,integer * ndeg,doublereal * poljac,doublereal * polcan);
		%feature("autodoc", "Args:
	ndimax(integer *)
	ncoeff(integer *)
	courbe(doublereal *)
	ndim(integer *)
	tparam(doublereal *)
	pntcrb(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmpocrb_;
		static int mmpocrb_ (integer * ndimax,integer * ncoeff,doublereal * courbe,integer * ndim,doublereal * tparam,doublereal * pntcrb);
		%feature("autodoc", "Args:
	normax(integer *)
	nordre(integer *)
	ndim(integer *)
	amat(doublereal *)
	bmat(doublereal *)
	epspiv(doublereal *)
	aaux(doublereal *)
	xmat(doublereal *)
	iercod(integer *)

Returns:
	static int

No detailed docstring for this function.") mmmrslwd_;
		static int mmmrslwd_ (integer * normax,integer * nordre,integer * ndim,doublereal * amat,doublereal * bmat,doublereal * epspiv,doublereal * aaux,doublereal * xmat,integer * iercod);
		%feature("autodoc", "Args:
	eps03(doublereal *)

Returns:
	static int

No detailed docstring for this function.") mmveps3_;
		static int mmveps3_ (doublereal * eps03);
		%feature("autodoc", "Args:
	x(doublereal *)
	n(integer *)

Returns:
	static doublereal

No detailed docstring for this function.") pow__di;
		static doublereal pow__di (doublereal * x,integer * n);
		%feature("autodoc", "Args:
	ndimen(integer *)
	vecteu(doublereal *)

Returns:
	static doublereal

No detailed docstring for this function.") mzsnorm_;
		static doublereal mzsnorm_ (integer * ndimen,doublereal * vecteu);
};


%feature("shadow") AdvApp2Var_MathBase::~AdvApp2Var_MathBase %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_MathBase {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_Network;
class AdvApp2Var_Network {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Network;
		 AdvApp2Var_Network ();
		%feature("autodoc", "Args:
	Net(AdvApp2Var_SequenceOfPatch)
	TheU(TColStd_SequenceOfReal)
	TheV(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Network;
		 AdvApp2Var_Network (const AdvApp2Var_SequenceOfPatch & Net,const TColStd_SequenceOfReal & TheU,const TColStd_SequenceOfReal & TheV);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

search the Index of the first Patch not approximated,  
         if all Patches are approximated Standard_False is returned") FirstNotApprox;
		Standard_Boolean FirstNotApprox (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	AdvApp2Var_Patch

No detailed docstring for this function.") ChangePatch;
		AdvApp2Var_Patch & ChangePatch (const Standard_Integer Index);
		%feature("autodoc", "Args:
	CuttingValue(Standard_Real)

Returns:
	None

No detailed docstring for this function.") UpdateInU;
		void UpdateInU (const Standard_Real CuttingValue);
		%feature("autodoc", "Args:
	CuttingValue(Standard_Real)

Returns:
	None

No detailed docstring for this function.") UpdateInV;
		void UpdateInV (const Standard_Real CuttingValue);
		%feature("autodoc", "Args:
	iu(Standard_Integer)
	iv(Standard_Integer)
	ncfu(Standard_Integer)
	ncfv(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SameDegree;
		void SameDegree (const Standard_Integer iu,const Standard_Integer iv,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPatch;
		Standard_Integer NbPatch ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPatchInU;
		Standard_Integer NbPatchInU ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPatchInV;
		Standard_Integer NbPatchInV ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") UParameter;
		Standard_Real UParameter (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") VParameter;
		Standard_Real VParameter (const Standard_Integer Index);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)

Returns:
	AdvApp2Var_Patch

No detailed docstring for this function.") Patch;
		const AdvApp2Var_Patch & Patch (const Standard_Integer UIndex,const Standard_Integer VIndex);
};


%feature("shadow") AdvApp2Var_Network::~AdvApp2Var_Network %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_Network {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_Node;
class AdvApp2Var_Node {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Node;
		 AdvApp2Var_Node ();
		%feature("autodoc", "Args:
	iu(Standard_Integer)
	iv(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Node;
		 AdvApp2Var_Node (const Standard_Integer iu,const Standard_Integer iv);
		%feature("autodoc", "Args:
	UV(gp_XY)
	iu(Standard_Integer)
	iv(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Node;
		 AdvApp2Var_Node (const gp_XY & UV,const Standard_Integer iu,const Standard_Integer iv);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") Coord;
		gp_XY Coord ();
		%feature("autodoc", "Args:
	x1(Standard_Real)
	x2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetCoord;
		void SetCoord (const Standard_Real x1,const Standard_Real x2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UOrder;
		Standard_Integer UOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VOrder;
		Standard_Integer VOrder ();
		%feature("autodoc", "Args:
	iu(Standard_Integer)
	iv(Standard_Integer)
	Cte(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const Standard_Integer iu,const Standard_Integer iv,const gp_Pnt & Cte);
		%feature("autodoc", "Args:
	iu(Standard_Integer)
	iv(Standard_Integer)

Returns:
	gp_Pnt

No detailed docstring for this function.") Point;
		gp_Pnt Point (const Standard_Integer iu,const Standard_Integer iv);
		%feature("autodoc", "Args:
	iu(Standard_Integer)
	iv(Standard_Integer)
	error(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetError;
		void SetError (const Standard_Integer iu,const Standard_Integer iv,const Standard_Real error);
		%feature("autodoc", "Args:
	iu(Standard_Integer)
	iv(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Error;
		Standard_Real Error (const Standard_Integer iu,const Standard_Integer iv);
};


%feature("shadow") AdvApp2Var_Node::~AdvApp2Var_Node %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_Node {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_Patch;
class AdvApp2Var_Patch {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Patch;
		 AdvApp2Var_Patch ();
		%feature("autodoc", "Args:
	U0(Standard_Real)
	U1(Standard_Real)
	V0(Standard_Real)
	V1(Standard_Real)
	iu(Standard_Integer)
	iv(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Patch;
		 AdvApp2Var_Patch (const Standard_Real U0,const Standard_Real U1,const Standard_Real V0,const Standard_Real V1,const Standard_Integer iu,const Standard_Integer iv);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDiscretised;
		Standard_Boolean IsDiscretised ();
		%feature("autodoc", "Args:
	Conditions(AdvApp2Var_Context)
	Constraints(AdvApp2Var_Framework)
	func(AdvApp2Var_EvaluatorFunc2Var)

Returns:
	None

No detailed docstring for this function.") Discretise;
		void Discretise (const AdvApp2Var_Context & Conditions,const AdvApp2Var_Framework & Constraints,const AdvApp2Var_EvaluatorFunc2Var & func);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsApproximated;
		Standard_Boolean IsApproximated ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "Args:
	Conditions(AdvApp2Var_Context)
	Constraints(AdvApp2Var_Framework)
	NumDec(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") MakeApprox;
		void MakeApprox (const AdvApp2Var_Context & Conditions,const AdvApp2Var_Framework & Constraints,const Standard_Integer NumDec);
		%feature("autodoc", "Args:
	Conditions(AdvApp2Var_Context)
	Constraints(AdvApp2Var_Framework)

Returns:
	None

No detailed docstring for this function.") AddConstraints;
		void AddConstraints (const AdvApp2Var_Context & Conditions,const AdvApp2Var_Framework & Constraints);
		%feature("autodoc", "Args:
	Constraints(AdvApp2Var_Framework)

Returns:
	None

No detailed docstring for this function.") AddErrors;
		void AddErrors (const AdvApp2Var_Framework & Constraints);
		%feature("autodoc", "Args:
	a(Standard_Real)
	b(Standard_Real)
	c(Standard_Real)
	d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ChangeDomain;
		void ChangeDomain (const Standard_Real a,const Standard_Real b,const Standard_Real c,const Standard_Real d);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ResetApprox;
		void ResetApprox ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") OverwriteApprox;
		void OverwriteApprox ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") U0;
		Standard_Real U0 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") U1;
		Standard_Real U1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") V0;
		Standard_Real V0 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") V1;
		Standard_Real V1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UOrder;
		Standard_Integer UOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VOrder;
		Standard_Integer VOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") CutSense;
		Standard_Integer CutSense ();
		%feature("autodoc", "Args:
	Crit(AdvApp2Var_Criterion)
	NumDec(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") CutSense;
		Standard_Integer CutSense (const AdvApp2Var_Criterion & Crit,const Standard_Integer NumDec);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbCoeffInU;
		Standard_Integer NbCoeffInU ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbCoeffInV;
		Standard_Integer NbCoeffInV ();
		%feature("autodoc", "Args:
	NbCoeffU(Standard_Integer)
	NbCoeffV(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeNbCoeff;
		void ChangeNbCoeff (const Standard_Integer NbCoeffU,const Standard_Integer NbCoeffV);
		%feature("autodoc", "Args:
	SSPIndex(Standard_Integer)
	Conditions(AdvApp2Var_Context)

Returns:
	Handle_TColgp_HArray2OfPnt

No detailed docstring for this function.") Poles;
		Handle_TColgp_HArray2OfPnt Poles (const Standard_Integer SSPIndex,const AdvApp2Var_Context & Conditions);
		%feature("autodoc", "Args:
	SSPIndex(Standard_Integer)
	Conditions(AdvApp2Var_Context)

Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Coefficients;
		Handle_TColStd_HArray1OfReal Coefficients (const Standard_Integer SSPIndex,const AdvApp2Var_Context & Conditions);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") MaxErrors;
		Handle_TColStd_HArray1OfReal MaxErrors ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") AverageErrors;
		Handle_TColStd_HArray1OfReal AverageErrors ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray2OfReal

No detailed docstring for this function.") IsoErrors;
		Handle_TColStd_HArray2OfReal IsoErrors ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") CritValue;
		Standard_Real CritValue ();
		%feature("autodoc", "Args:
	dist(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetCritValue;
		void SetCritValue (const Standard_Real dist);
};


%feature("shadow") AdvApp2Var_Patch::~AdvApp2Var_Patch %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_Patch {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_SequenceNodeOfSequenceOfNode;
class AdvApp2Var_SequenceNodeOfSequenceOfNode : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(AdvApp2Var_Node)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_SequenceNodeOfSequenceOfNode;
		 AdvApp2Var_SequenceNodeOfSequenceOfNode (const AdvApp2Var_Node & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Node

No detailed docstring for this function.") Value;
		AdvApp2Var_Node & Value ();
};


%feature("shadow") AdvApp2Var_SequenceNodeOfSequenceOfNode::~AdvApp2Var_SequenceNodeOfSequenceOfNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_SequenceNodeOfSequenceOfNode {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AdvApp2Var_SequenceNodeOfSequenceOfNode {
	Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode GetHandle() {
	return *(Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode*) &$self;
	}
};

%nodefaultctor Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode;
class Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode();
        Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode(const Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode &aHandle);
        Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode(const AdvApp2Var_SequenceNodeOfSequenceOfNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode {
    AdvApp2Var_SequenceNodeOfSequenceOfNode* GetObject() {
    return (AdvApp2Var_SequenceNodeOfSequenceOfNode*)$self->Access();
    }
};
%feature("shadow") Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode::~Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AdvApp2Var_SequenceNodeOfSequenceOfPatch;
class AdvApp2Var_SequenceNodeOfSequenceOfPatch : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(AdvApp2Var_Patch)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_SequenceNodeOfSequenceOfPatch;
		 AdvApp2Var_SequenceNodeOfSequenceOfPatch (const AdvApp2Var_Patch & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Patch

No detailed docstring for this function.") Value;
		AdvApp2Var_Patch & Value ();
};


%feature("shadow") AdvApp2Var_SequenceNodeOfSequenceOfPatch::~AdvApp2Var_SequenceNodeOfSequenceOfPatch %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_SequenceNodeOfSequenceOfPatch {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AdvApp2Var_SequenceNodeOfSequenceOfPatch {
	Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch GetHandle() {
	return *(Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch*) &$self;
	}
};

%nodefaultctor Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch;
class Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch();
        Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch(const Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch &aHandle);
        Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch(const AdvApp2Var_SequenceNodeOfSequenceOfPatch *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch {
    AdvApp2Var_SequenceNodeOfSequenceOfPatch* GetObject() {
    return (AdvApp2Var_SequenceNodeOfSequenceOfPatch*)$self->Access();
    }
};
%feature("shadow") Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch::~Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AdvApp2Var_SequenceNodeOfSequenceOfStrip;
class AdvApp2Var_SequenceNodeOfSequenceOfStrip : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(AdvApp2Var_Strip)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_SequenceNodeOfSequenceOfStrip;
		 AdvApp2Var_SequenceNodeOfSequenceOfStrip (const AdvApp2Var_Strip & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Strip

No detailed docstring for this function.") Value;
		AdvApp2Var_Strip & Value ();
};


%feature("shadow") AdvApp2Var_SequenceNodeOfSequenceOfStrip::~AdvApp2Var_SequenceNodeOfSequenceOfStrip %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_SequenceNodeOfSequenceOfStrip {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AdvApp2Var_SequenceNodeOfSequenceOfStrip {
	Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip GetHandle() {
	return *(Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip*) &$self;
	}
};

%nodefaultctor Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip;
class Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip();
        Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip(const Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip &aHandle);
        Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip(const AdvApp2Var_SequenceNodeOfSequenceOfStrip *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip {
    AdvApp2Var_SequenceNodeOfSequenceOfStrip* GetObject() {
    return (AdvApp2Var_SequenceNodeOfSequenceOfStrip*)$self->Access();
    }
};
%feature("shadow") Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip::~Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AdvApp2Var_SequenceNodeOfStrip;
class AdvApp2Var_SequenceNodeOfStrip : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(AdvApp2Var_Iso)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") AdvApp2Var_SequenceNodeOfStrip;
		 AdvApp2Var_SequenceNodeOfStrip (const AdvApp2Var_Iso & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Iso

No detailed docstring for this function.") Value;
		AdvApp2Var_Iso & Value ();
};


%feature("shadow") AdvApp2Var_SequenceNodeOfStrip::~AdvApp2Var_SequenceNodeOfStrip %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_SequenceNodeOfStrip {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AdvApp2Var_SequenceNodeOfStrip {
	Handle_AdvApp2Var_SequenceNodeOfStrip GetHandle() {
	return *(Handle_AdvApp2Var_SequenceNodeOfStrip*) &$self;
	}
};

%nodefaultctor Handle_AdvApp2Var_SequenceNodeOfStrip;
class Handle_AdvApp2Var_SequenceNodeOfStrip : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_AdvApp2Var_SequenceNodeOfStrip();
        Handle_AdvApp2Var_SequenceNodeOfStrip(const Handle_AdvApp2Var_SequenceNodeOfStrip &aHandle);
        Handle_AdvApp2Var_SequenceNodeOfStrip(const AdvApp2Var_SequenceNodeOfStrip *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AdvApp2Var_SequenceNodeOfStrip DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AdvApp2Var_SequenceNodeOfStrip {
    AdvApp2Var_SequenceNodeOfStrip* GetObject() {
    return (AdvApp2Var_SequenceNodeOfStrip*)$self->Access();
    }
};
%feature("shadow") Handle_AdvApp2Var_SequenceNodeOfStrip::~Handle_AdvApp2Var_SequenceNodeOfStrip %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AdvApp2Var_SequenceNodeOfStrip {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor AdvApp2Var_SequenceOfNode;
class AdvApp2Var_SequenceOfNode : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApp2Var_SequenceOfNode;
		 AdvApp2Var_SequenceOfNode ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(AdvApp2Var_SequenceOfNode)

Returns:
	AdvApp2Var_SequenceOfNode

No detailed docstring for this function.") Assign;
		const AdvApp2Var_SequenceOfNode & Assign (const AdvApp2Var_SequenceOfNode & Other);
		%feature("autodoc", "Args:
	Other(AdvApp2Var_SequenceOfNode)

Returns:
	AdvApp2Var_SequenceOfNode

No detailed docstring for this function.") operator=;
		const AdvApp2Var_SequenceOfNode & operator = (const AdvApp2Var_SequenceOfNode & Other);
		%feature("autodoc", "Args:
	T(AdvApp2Var_Node)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const AdvApp2Var_Node & T);
		%feature("autodoc", "Args:
	S(AdvApp2Var_SequenceOfNode)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (AdvApp2Var_SequenceOfNode & S);
		%feature("autodoc", "Args:
	T(AdvApp2Var_Node)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const AdvApp2Var_Node & T);
		%feature("autodoc", "Args:
	S(AdvApp2Var_SequenceOfNode)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (AdvApp2Var_SequenceOfNode & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(AdvApp2Var_Node)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const AdvApp2Var_Node & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AdvApp2Var_SequenceOfNode)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AdvApp2Var_SequenceOfNode & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(AdvApp2Var_Node)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const AdvApp2Var_Node & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AdvApp2Var_SequenceOfNode)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AdvApp2Var_SequenceOfNode & S);
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Node

No detailed docstring for this function.") First;
		const AdvApp2Var_Node & First ();
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Node

No detailed docstring for this function.") Last;
		const AdvApp2Var_Node & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(AdvApp2Var_SequenceOfNode)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,AdvApp2Var_SequenceOfNode & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	AdvApp2Var_Node

No detailed docstring for this function.") Value;
		const AdvApp2Var_Node & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(AdvApp2Var_Node)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const AdvApp2Var_Node & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	AdvApp2Var_Node

No detailed docstring for this function.") ChangeValue;
		AdvApp2Var_Node & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") AdvApp2Var_SequenceOfNode::~AdvApp2Var_SequenceOfNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_SequenceOfNode {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_SequenceOfPatch;
class AdvApp2Var_SequenceOfPatch : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApp2Var_SequenceOfPatch;
		 AdvApp2Var_SequenceOfPatch ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(AdvApp2Var_SequenceOfPatch)

Returns:
	AdvApp2Var_SequenceOfPatch

No detailed docstring for this function.") Assign;
		const AdvApp2Var_SequenceOfPatch & Assign (const AdvApp2Var_SequenceOfPatch & Other);
		%feature("autodoc", "Args:
	Other(AdvApp2Var_SequenceOfPatch)

Returns:
	AdvApp2Var_SequenceOfPatch

No detailed docstring for this function.") operator=;
		const AdvApp2Var_SequenceOfPatch & operator = (const AdvApp2Var_SequenceOfPatch & Other);
		%feature("autodoc", "Args:
	T(AdvApp2Var_Patch)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const AdvApp2Var_Patch & T);
		%feature("autodoc", "Args:
	S(AdvApp2Var_SequenceOfPatch)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (AdvApp2Var_SequenceOfPatch & S);
		%feature("autodoc", "Args:
	T(AdvApp2Var_Patch)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const AdvApp2Var_Patch & T);
		%feature("autodoc", "Args:
	S(AdvApp2Var_SequenceOfPatch)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (AdvApp2Var_SequenceOfPatch & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(AdvApp2Var_Patch)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const AdvApp2Var_Patch & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AdvApp2Var_SequenceOfPatch)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AdvApp2Var_SequenceOfPatch & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(AdvApp2Var_Patch)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const AdvApp2Var_Patch & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AdvApp2Var_SequenceOfPatch)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AdvApp2Var_SequenceOfPatch & S);
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Patch

No detailed docstring for this function.") First;
		const AdvApp2Var_Patch & First ();
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Patch

No detailed docstring for this function.") Last;
		const AdvApp2Var_Patch & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(AdvApp2Var_SequenceOfPatch)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,AdvApp2Var_SequenceOfPatch & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	AdvApp2Var_Patch

No detailed docstring for this function.") Value;
		const AdvApp2Var_Patch & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(AdvApp2Var_Patch)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const AdvApp2Var_Patch & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	AdvApp2Var_Patch

No detailed docstring for this function.") ChangeValue;
		AdvApp2Var_Patch & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") AdvApp2Var_SequenceOfPatch::~AdvApp2Var_SequenceOfPatch %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_SequenceOfPatch {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_SequenceOfStrip;
class AdvApp2Var_SequenceOfStrip : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApp2Var_SequenceOfStrip;
		 AdvApp2Var_SequenceOfStrip ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(AdvApp2Var_SequenceOfStrip)

Returns:
	AdvApp2Var_SequenceOfStrip

No detailed docstring for this function.") Assign;
		const AdvApp2Var_SequenceOfStrip & Assign (const AdvApp2Var_SequenceOfStrip & Other);
		%feature("autodoc", "Args:
	Other(AdvApp2Var_SequenceOfStrip)

Returns:
	AdvApp2Var_SequenceOfStrip

No detailed docstring for this function.") operator=;
		const AdvApp2Var_SequenceOfStrip & operator = (const AdvApp2Var_SequenceOfStrip & Other);
		%feature("autodoc", "Args:
	T(AdvApp2Var_Strip)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const AdvApp2Var_Strip & T);
		%feature("autodoc", "Args:
	S(AdvApp2Var_SequenceOfStrip)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (AdvApp2Var_SequenceOfStrip & S);
		%feature("autodoc", "Args:
	T(AdvApp2Var_Strip)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const AdvApp2Var_Strip & T);
		%feature("autodoc", "Args:
	S(AdvApp2Var_SequenceOfStrip)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (AdvApp2Var_SequenceOfStrip & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(AdvApp2Var_Strip)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const AdvApp2Var_Strip & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AdvApp2Var_SequenceOfStrip)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AdvApp2Var_SequenceOfStrip & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(AdvApp2Var_Strip)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const AdvApp2Var_Strip & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AdvApp2Var_SequenceOfStrip)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AdvApp2Var_SequenceOfStrip & S);
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Strip

No detailed docstring for this function.") First;
		const AdvApp2Var_Strip & First ();
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Strip

No detailed docstring for this function.") Last;
		const AdvApp2Var_Strip & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(AdvApp2Var_SequenceOfStrip)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,AdvApp2Var_SequenceOfStrip & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	AdvApp2Var_Strip

No detailed docstring for this function.") Value;
		const AdvApp2Var_Strip & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(AdvApp2Var_Strip)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const AdvApp2Var_Strip & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	AdvApp2Var_Strip

No detailed docstring for this function.") ChangeValue;
		AdvApp2Var_Strip & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") AdvApp2Var_SequenceOfStrip::~AdvApp2Var_SequenceOfStrip %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_SequenceOfStrip {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_Strip;
class AdvApp2Var_Strip : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApp2Var_Strip;
		 AdvApp2Var_Strip ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(AdvApp2Var_Strip)

Returns:
	AdvApp2Var_Strip

No detailed docstring for this function.") Assign;
		const AdvApp2Var_Strip & Assign (const AdvApp2Var_Strip & Other);
		%feature("autodoc", "Args:
	Other(AdvApp2Var_Strip)

Returns:
	AdvApp2Var_Strip

No detailed docstring for this function.") operator=;
		const AdvApp2Var_Strip & operator = (const AdvApp2Var_Strip & Other);
		%feature("autodoc", "Args:
	T(AdvApp2Var_Iso)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const AdvApp2Var_Iso & T);
		%feature("autodoc", "Args:
	S(AdvApp2Var_Strip)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (AdvApp2Var_Strip & S);
		%feature("autodoc", "Args:
	T(AdvApp2Var_Iso)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const AdvApp2Var_Iso & T);
		%feature("autodoc", "Args:
	S(AdvApp2Var_Strip)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (AdvApp2Var_Strip & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(AdvApp2Var_Iso)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const AdvApp2Var_Iso & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AdvApp2Var_Strip)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AdvApp2Var_Strip & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(AdvApp2Var_Iso)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const AdvApp2Var_Iso & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(AdvApp2Var_Strip)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AdvApp2Var_Strip & S);
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Iso

No detailed docstring for this function.") First;
		const AdvApp2Var_Iso & First ();
		%feature("autodoc", "Args:
	None
Returns:
	AdvApp2Var_Iso

No detailed docstring for this function.") Last;
		const AdvApp2Var_Iso & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(AdvApp2Var_Strip)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,AdvApp2Var_Strip & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	AdvApp2Var_Iso

No detailed docstring for this function.") Value;
		const AdvApp2Var_Iso & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(AdvApp2Var_Iso)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const AdvApp2Var_Iso & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	AdvApp2Var_Iso

No detailed docstring for this function.") ChangeValue;
		AdvApp2Var_Iso & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") AdvApp2Var_Strip::~AdvApp2Var_Strip %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_Strip {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor AdvApp2Var_SysBase;
class AdvApp2Var_SysBase {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") AdvApp2Var_SysBase;
		 AdvApp2Var_SysBase ();
		%feature("autodoc", "Args:
	None
Returns:
	int

No detailed docstring for this function.") mainial_;
		int mainial_ ();
		%feature("autodoc", "Args:
	(int *)
	(int *)

Returns:
	static int

No detailed docstring for this function.") macinit_;
		static int macinit_ (int * ,int * );
		%feature("autodoc", "Args:
	iunit(integer *)
	isize(integer *)
	t(void *)
	iofset(intptr_t *)
	iercod(integer *)

Returns:
	int

No detailed docstring for this function.") mcrdelt_;
		int mcrdelt_ (integer * iunit,integer * isize,void * t,intptr_t * iofset,integer * iercod);
		%feature("autodoc", "Args:
	size(integer *)
	tin(void *)
	tout(void *)

Returns:
	static int

No detailed docstring for this function.") mcrfill_;
		static int mcrfill_ (integer * size,void * tin,void * tout);
		%feature("autodoc", "Args:
	iunit(integer *)
	isize(integer *)
	t(void *)
	iofset(intptr_t *)
	iercod(integer *)

Returns:
	int

No detailed docstring for this function.") mcrrqst_;
		int mcrrqst_ (integer * iunit,integer * isize,void * t,intptr_t * iofset,integer * iercod);
		%feature("autodoc", "Args:
	None
Returns:
	static integer

No detailed docstring for this function.") mnfndeb_;
		static integer mnfndeb_ ();
		%feature("autodoc", "Args:
	None
Returns:
	static int

No detailed docstring for this function.") do__fio;
		static int do__fio ();
		%feature("autodoc", "Args:
	None
Returns:
	static int

No detailed docstring for this function.") do__lio;
		static int do__lio ();
		%feature("autodoc", "Args:
	nbelem(integer *)
	maxelm(integer *)
	itablo(integer *)
	iofset(intptr_t *)
	iercod(integer *)

Returns:
	int

No detailed docstring for this function.") macrai4_;
		int macrai4_ (integer * nbelem,integer * maxelm,integer * itablo,intptr_t * iofset,integer * iercod);
		%feature("autodoc", "Args:
	nbelem(integer *)
	maxelm(integer *)
	xtablo(doublereal *)
	iofset(intptr_t *)
	iercod(integer *)

Returns:
	int

No detailed docstring for this function.") macrar8_;
		int macrar8_ (integer * nbelem,integer * maxelm,doublereal * xtablo,intptr_t * iofset,integer * iercod);
		%feature("autodoc", "Args:
	nbelem(integer *)
	maxelm(integer *)
	itablo(integer *)
	iofset(intptr_t *)
	iercod(integer *)

Returns:
	int

No detailed docstring for this function.") macrdi4_;
		int macrdi4_ (integer * nbelem,integer * maxelm,integer * itablo,intptr_t * iofset,integer * iercod);
		%feature("autodoc", "Args:
	nbelem(integer *)
	maxelm(integer *)
	xtablo(doublereal *)
	iofset(intptr_t *)
	iercod(integer *)

Returns:
	int

No detailed docstring for this function.") macrdr8_;
		int macrdr8_ (integer * nbelem,integer * maxelm,doublereal * xtablo,intptr_t * iofset,integer * iercod);
		%feature("autodoc", "Args:
	cnompg(char *)
	icoder(integer *)
	cnompg_len(ftnlen)

Returns:
	static int

No detailed docstring for this function.") maermsg_;
		static int maermsg_ (const char * cnompg,integer * icoder,ftnlen cnompg_len);
		%feature("autodoc", "Args:
	itaill(integer *)
	xtab(doublereal *)
	xval(doublereal *)

Returns:
	static int

No detailed docstring for this function.") maitbr8_;
		static int maitbr8_ (integer * itaill,doublereal * xtab,doublereal * xval);
		%feature("autodoc", "Args:
	ivalcs(integer *)

Returns:
	static int

No detailed docstring for this function.") maovsr8_;
		static int maovsr8_ (integer * ivalcs);
		%feature("autodoc", "Args:
	nomprg(char *)
	nomprg_len(ftnlen)

Returns:
	static int

No detailed docstring for this function.") mgenmsg_;
		static int mgenmsg_ (const char * nomprg,ftnlen nomprg_len);
		%feature("autodoc", "Args:
	nomprg(char *)
	nomprg_len(ftnlen)

Returns:
	static int

No detailed docstring for this function.") mgsomsg_;
		static int mgsomsg_ (const char * nomprg,ftnlen nomprg_len);
		%feature("autodoc", "Args:
	taille(integer *)
	adt(void *)

Returns:
	static void

No detailed docstring for this function.") miraz_;
		static void miraz_ (integer * taille,void * adt);
		%feature("autodoc", "Args:
	nbintg(integer *)
	ivecin(integer *)
	ivecou(integer *)

Returns:
	static int

No detailed docstring for this function.") msifill_;
		static int msifill_ (integer * nbintg,integer * ivecin,integer * ivecou);
		%feature("autodoc", "Args:
	nbreel(integer *)
	vecent(doublereal *)
	vecsor(doublereal *)

Returns:
	static int

No detailed docstring for this function.") msrfill_;
		static int msrfill_ (integer * nbreel,doublereal * vecent,doublereal * vecsor);
		%feature("autodoc", "Args:
	ctexte(char *)
	ctexte_len(ftnlen)

Returns:
	static int

No detailed docstring for this function.") mswrdbg_;
		static int mswrdbg_ (const char * ctexte,ftnlen ctexte_len);
		%feature("autodoc", "Args:
	taille(integer *)
	adt(void *)

Returns:
	static void

No detailed docstring for this function.") mvriraz_;
		static void mvriraz_ (integer * taille,void * adt);
};


%feature("shadow") AdvApp2Var_SysBase::~AdvApp2Var_SysBase %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AdvApp2Var_SysBase {
	void _kill_pointed() {
		delete $self;
	}
};
