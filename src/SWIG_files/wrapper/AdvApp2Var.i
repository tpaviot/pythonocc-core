/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include AdvApp2Var_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

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
		%feature("compactdefaultargs") AdvApp2Var_ApproxAFunc2Var;
		%feature("autodoc", "	:param Num1DSS:
	:type Num1DSS: int
	:param Num2DSS:
	:type Num2DSS: int
	:param Num3DSS:
	:type Num3DSS: int
	:param OneDTol:
	:type OneDTol: Handle_TColStd_HArray1OfReal &
	:param TwoDTol:
	:type TwoDTol: Handle_TColStd_HArray1OfReal &
	:param ThreeDTol:
	:type ThreeDTol: Handle_TColStd_HArray1OfReal &
	:param OneDTolFr:
	:type OneDTolFr: Handle_TColStd_HArray2OfReal &
	:param TwoDTolFr:
	:type TwoDTolFr: Handle_TColStd_HArray2OfReal &
	:param ThreeDTolFr:
	:type ThreeDTolFr: Handle_TColStd_HArray2OfReal &
	:param FirstInU:
	:type FirstInU: float
	:param LastInU:
	:type LastInU: float
	:param FirstInV:
	:type FirstInV: float
	:param LastInV:
	:type LastInV: float
	:param FavorIso:
	:type FavorIso: GeomAbs_IsoType
	:param ContInU:
	:type ContInU: GeomAbs_Shape
	:param ContInV:
	:type ContInV: GeomAbs_Shape
	:param PrecisCode:
	:type PrecisCode: int
	:param MaxDegInU:
	:type MaxDegInU: int
	:param MaxDegInV:
	:type MaxDegInV: int
	:param MaxPatch:
	:type MaxPatch: int
	:param Func:
	:type Func: AdvApp2Var_EvaluatorFunc2Var &
	:param UChoice:
	:type UChoice: AdvApprox_Cutting &
	:param VChoice:
	:type VChoice: AdvApprox_Cutting &
	:rtype: None
") AdvApp2Var_ApproxAFunc2Var;
		 AdvApp2Var_ApproxAFunc2Var (const Standard_Integer Num1DSS,const Standard_Integer Num2DSS,const Standard_Integer Num3DSS,const Handle_TColStd_HArray1OfReal & OneDTol,const Handle_TColStd_HArray1OfReal & TwoDTol,const Handle_TColStd_HArray1OfReal & ThreeDTol,const Handle_TColStd_HArray2OfReal & OneDTolFr,const Handle_TColStd_HArray2OfReal & TwoDTolFr,const Handle_TColStd_HArray2OfReal & ThreeDTolFr,const Standard_Real FirstInU,const Standard_Real LastInU,const Standard_Real FirstInV,const Standard_Real LastInV,const GeomAbs_IsoType FavorIso,const GeomAbs_Shape ContInU,const GeomAbs_Shape ContInV,const Standard_Integer PrecisCode,const Standard_Integer MaxDegInU,const Standard_Integer MaxDegInV,const Standard_Integer MaxPatch,const AdvApp2Var_EvaluatorFunc2Var & Func,AdvApprox_Cutting & UChoice,AdvApprox_Cutting & VChoice);
		%feature("compactdefaultargs") AdvApp2Var_ApproxAFunc2Var;
		%feature("autodoc", "	:param Num1DSS:
	:type Num1DSS: int
	:param Num2DSS:
	:type Num2DSS: int
	:param Num3DSS:
	:type Num3DSS: int
	:param OneDTol:
	:type OneDTol: Handle_TColStd_HArray1OfReal &
	:param TwoDTol:
	:type TwoDTol: Handle_TColStd_HArray1OfReal &
	:param ThreeDTol:
	:type ThreeDTol: Handle_TColStd_HArray1OfReal &
	:param OneDTolFr:
	:type OneDTolFr: Handle_TColStd_HArray2OfReal &
	:param TwoDTolFr:
	:type TwoDTolFr: Handle_TColStd_HArray2OfReal &
	:param ThreeDTolFr:
	:type ThreeDTolFr: Handle_TColStd_HArray2OfReal &
	:param FirstInU:
	:type FirstInU: float
	:param LastInU:
	:type LastInU: float
	:param FirstInV:
	:type FirstInV: float
	:param LastInV:
	:type LastInV: float
	:param FavorIso:
	:type FavorIso: GeomAbs_IsoType
	:param ContInU:
	:type ContInU: GeomAbs_Shape
	:param ContInV:
	:type ContInV: GeomAbs_Shape
	:param PrecisCode:
	:type PrecisCode: int
	:param MaxDegInU:
	:type MaxDegInU: int
	:param MaxDegInV:
	:type MaxDegInV: int
	:param MaxPatch:
	:type MaxPatch: int
	:param Func:
	:type Func: AdvApp2Var_EvaluatorFunc2Var &
	:param Crit:
	:type Crit: AdvApp2Var_Criterion &
	:param UChoice:
	:type UChoice: AdvApprox_Cutting &
	:param VChoice:
	:type VChoice: AdvApprox_Cutting &
	:rtype: None
") AdvApp2Var_ApproxAFunc2Var;
		 AdvApp2Var_ApproxAFunc2Var (const Standard_Integer Num1DSS,const Standard_Integer Num2DSS,const Standard_Integer Num3DSS,const Handle_TColStd_HArray1OfReal & OneDTol,const Handle_TColStd_HArray1OfReal & TwoDTol,const Handle_TColStd_HArray1OfReal & ThreeDTol,const Handle_TColStd_HArray2OfReal & OneDTolFr,const Handle_TColStd_HArray2OfReal & TwoDTolFr,const Handle_TColStd_HArray2OfReal & ThreeDTolFr,const Standard_Real FirstInU,const Standard_Real LastInU,const Standard_Real FirstInV,const Standard_Real LastInV,const GeomAbs_IsoType FavorIso,const GeomAbs_Shape ContInU,const GeomAbs_Shape ContInV,const Standard_Integer PrecisCode,const Standard_Integer MaxDegInU,const Standard_Integer MaxDegInV,const Standard_Integer MaxPatch,const AdvApp2Var_EvaluatorFunc2Var & Func,const AdvApp2Var_Criterion & Crit,AdvApprox_Cutting & UChoice,AdvApprox_Cutting & VChoice);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the approximation succeeded within the imposed tolerances and the wished continuities

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* True if the approximation did come out with a result that is not NECESSARELY within the required tolerance or a result that is not recognized with the wished continuities

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* returns the BSplineSurface of range Index

	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BSplineSurface
") Surface;
		Handle_Geom_BSplineSurface Surface (const Standard_Integer Index);
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") NumSubSpaces;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:rtype: int
") NumSubSpaces;
		Standard_Integer NumSubSpaces (const Standard_Integer Dimension);
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	* returns the errors max

	:param Dimension:
	:type Dimension: int
	:rtype: Handle_TColStd_HArray1OfReal
") MaxError;
		Handle_TColStd_HArray1OfReal MaxError (const Standard_Integer Dimension);
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	* returns the average errors

	:param Dimension:
	:type Dimension: int
	:rtype: Handle_TColStd_HArray1OfReal
") AverageError;
		Handle_TColStd_HArray1OfReal AverageError (const Standard_Integer Dimension);
		%feature("compactdefaultargs") UFrontError;
		%feature("autodoc", "	* returns the errors max on UFrontiers Warning: Dimension must be equal to 3.

	:param Dimension:
	:type Dimension: int
	:rtype: Handle_TColStd_HArray1OfReal
") UFrontError;
		Handle_TColStd_HArray1OfReal UFrontError (const Standard_Integer Dimension);
		%feature("compactdefaultargs") VFrontError;
		%feature("autodoc", "	* returns the errors max on VFrontiers Warning: Dimension must be equal to 3.

	:param Dimension:
	:type Dimension: int
	:rtype: Handle_TColStd_HArray1OfReal
") VFrontError;
		Handle_TColStd_HArray1OfReal VFrontError (const Standard_Integer Dimension);
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	* returns the error max of the BSplineSurface of range Index

	:param Dimension:
	:type Dimension: int
	:param Index:
	:type Index: int
	:rtype: float
") MaxError;
		Standard_Real MaxError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	* returns the average error of the BSplineSurface of range Index

	:param Dimension:
	:type Dimension: int
	:param Index:
	:type Index: int
	:rtype: float
") AverageError;
		Standard_Real AverageError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("compactdefaultargs") UFrontError;
		%feature("autodoc", "	* returns the error max of the BSplineSurface of range Index on a UFrontier

	:param Dimension:
	:type Dimension: int
	:param Index:
	:type Index: int
	:rtype: float
") UFrontError;
		Standard_Real UFrontError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("compactdefaultargs") VFrontError;
		%feature("autodoc", "	* returns the error max of the BSplineSurface of range Index on a VFrontier

	:param Dimension:
	:type Dimension: int
	:param Index:
	:type Index: int
	:rtype: float
") VFrontError;
		Standard_Real VFrontError (const Standard_Integer Dimension,const Standard_Integer Index);
		%feature("compactdefaultargs") CritError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param Index:
	:type Index: int
	:rtype: float
") CritError;
		Standard_Real CritError (const Standard_Integer Dimension,const Standard_Integer Index);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend AdvApp2Var_ApproxAFunc2Var {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_ApproxF2var;
class AdvApp2Var_ApproxF2var {
	public:
		%feature("compactdefaultargs") mma2fnc_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param nbsesp:
	:type nbsesp: integer *
	:param ndimse:
	:type ndimse: integer *
	:param uvfonc:
	:type uvfonc: doublereal *
	:param foncnp:
	:type foncnp: AdvApp2Var_EvaluatorFunc2Var &
	:param tconst:
	:type tconst: doublereal *
	:param isofav:
	:type isofav: integer *
	:param nbroot:
	:type nbroot: integer *
	:param rootlg:
	:type rootlg: doublereal *
	:param iordre:
	:type iordre: integer *
	:param ideriv:
	:type ideriv: integer *
	:param ndgjac:
	:type ndgjac: integer *
	:param nbcrmx:
	:type nbcrmx: integer *
	:param ncflim:
	:type ncflim: integer *
	:param epsapr:
	:type epsapr: doublereal *
	:param ncoeff:
	:type ncoeff: integer *
	:param courbe:
	:type courbe: doublereal *
	:param nbcrbe:
	:type nbcrbe: integer *
	:param somtab:
	:type somtab: doublereal *
	:param diftab:
	:type diftab: doublereal *
	:param contr1:
	:type contr1: doublereal *
	:param contr2:
	:type contr2: doublereal *
	:param tabdec:
	:type tabdec: doublereal *
	:param errmax:
	:type errmax: doublereal *
	:param errmoy:
	:type errmoy: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mma2fnc_;
		static int mma2fnc_ (integer * ndimen,integer * nbsesp,integer * ndimse,doublereal * uvfonc,const AdvApp2Var_EvaluatorFunc2Var & foncnp,doublereal * tconst,integer * isofav,integer * nbroot,doublereal * rootlg,integer * iordre,integer * ideriv,integer * ndgjac,integer * nbcrmx,integer * ncflim,doublereal * epsapr,integer * ncoeff,doublereal * courbe,integer * nbcrbe,doublereal * somtab,doublereal * diftab,doublereal * contr1,doublereal * contr2,doublereal * tabdec,doublereal * errmax,doublereal * errmoy,integer * iercod);
		%feature("compactdefaultargs") mma2roo_;
		%feature("autodoc", "	:param nbpntu:
	:type nbpntu: integer *
	:param nbpntv:
	:type nbpntv: integer *
	:param urootl:
	:type urootl: doublereal *
	:param vrootl:
	:type vrootl: doublereal *
	:rtype: int
") mma2roo_;
		static int mma2roo_ (integer * nbpntu,integer * nbpntv,doublereal * urootl,doublereal * vrootl);
		%feature("compactdefaultargs") mma2jmx_;
		%feature("autodoc", "	:param ndgjac:
	:type ndgjac: integer *
	:param iordre:
	:type iordre: integer *
	:param xjacmx:
	:type xjacmx: doublereal *
	:rtype: int
") mma2jmx_;
		static int mma2jmx_ (integer * ndgjac,integer * iordre,doublereal * xjacmx);
		%feature("compactdefaultargs") mmapptt_;
		%feature("autodoc", "	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : integer *
	:rtype: int
") mmapptt_;
		static int mmapptt_ (const integer * ,const integer * ,const integer * ,doublereal * ,integer * );
		%feature("compactdefaultargs") mma2cdi_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param nbpntu:
	:type nbpntu: integer *
	:param urootl:
	:type urootl: doublereal *
	:param nbpntv:
	:type nbpntv: integer *
	:param vrootl:
	:type vrootl: doublereal *
	:param iordru:
	:type iordru: integer *
	:param iordrv:
	:type iordrv: integer *
	:param contr1:
	:type contr1: doublereal *
	:param contr2:
	:type contr2: doublereal *
	:param contr3:
	:type contr3: doublereal *
	:param contr4:
	:type contr4: doublereal *
	:param sotbu1:
	:type sotbu1: doublereal *
	:param sotbu2:
	:type sotbu2: doublereal *
	:param ditbu1:
	:type ditbu1: doublereal *
	:param ditbu2:
	:type ditbu2: doublereal *
	:param sotbv1:
	:type sotbv1: doublereal *
	:param sotbv2:
	:type sotbv2: doublereal *
	:param ditbv1:
	:type ditbv1: doublereal *
	:param ditbv2:
	:type ditbv2: doublereal *
	:param sosotb:
	:type sosotb: doublereal *
	:param soditb:
	:type soditb: doublereal *
	:param disotb:
	:type disotb: doublereal *
	:param diditb:
	:type diditb: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mma2cdi_;
		static int mma2cdi_ (integer * ndimen,integer * nbpntu,doublereal * urootl,integer * nbpntv,doublereal * vrootl,integer * iordru,integer * iordrv,doublereal * contr1,doublereal * contr2,doublereal * contr3,doublereal * contr4,doublereal * sotbu1,doublereal * sotbu2,doublereal * ditbu1,doublereal * ditbu2,doublereal * sotbv1,doublereal * sotbv2,doublereal * ditbv1,doublereal * ditbv2,doublereal * sosotb,doublereal * soditb,doublereal * disotb,doublereal * diditb,integer * iercod);
		%feature("compactdefaultargs") mma2ds1_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param uintfn:
	:type uintfn: doublereal *
	:param vintfn:
	:type vintfn: doublereal *
	:param foncnp:
	:type foncnp: AdvApp2Var_EvaluatorFunc2Var &
	:param nbpntu:
	:type nbpntu: integer *
	:param nbpntv:
	:type nbpntv: integer *
	:param urootb:
	:type urootb: doublereal *
	:param vrootb:
	:type vrootb: doublereal *
	:param isofav:
	:type isofav: integer *
	:param sosotb:
	:type sosotb: doublereal *
	:param disotb:
	:type disotb: doublereal *
	:param soditb:
	:type soditb: doublereal *
	:param diditb:
	:type diditb: doublereal *
	:param fpntab:
	:type fpntab: doublereal *
	:param ttable:
	:type ttable: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mma2ds1_;
		static int mma2ds1_ (integer * ndimen,doublereal * uintfn,doublereal * vintfn,const AdvApp2Var_EvaluatorFunc2Var & foncnp,integer * nbpntu,integer * nbpntv,doublereal * urootb,doublereal * vrootb,integer * isofav,doublereal * sosotb,doublereal * disotb,doublereal * soditb,doublereal * diditb,doublereal * fpntab,doublereal * ttable,integer * iercod);
		%feature("compactdefaultargs") mma2ce1_;
		%feature("autodoc", "	:param numdec:
	:type numdec: integer *
	:param ndimen:
	:type ndimen: integer *
	:param nbsesp:
	:type nbsesp: integer *
	:param ndimse:
	:type ndimse: integer *
	:param ndminu:
	:type ndminu: integer *
	:param ndminv:
	:type ndminv: integer *
	:param ndguli:
	:type ndguli: integer *
	:param ndgvli:
	:type ndgvli: integer *
	:param ndjacu:
	:type ndjacu: integer *
	:param ndjacv:
	:type ndjacv: integer *
	:param iordru:
	:type iordru: integer *
	:param iordrv:
	:type iordrv: integer *
	:param nbpntu:
	:type nbpntu: integer *
	:param nbpntv:
	:type nbpntv: integer *
	:param epsapr:
	:type epsapr: doublereal *
	:param sosotb:
	:type sosotb: doublereal *
	:param disotb:
	:type disotb: doublereal *
	:param soditb:
	:type soditb: doublereal *
	:param diditb:
	:type diditb: doublereal *
	:param patjac:
	:type patjac: doublereal *
	:param errmax:
	:type errmax: doublereal *
	:param errmoy:
	:type errmoy: doublereal *
	:param ndegpu:
	:type ndegpu: integer *
	:param ndegpv:
	:type ndegpv: integer *
	:param itydec:
	:type itydec: integer *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mma2ce1_;
		static int mma2ce1_ (integer * numdec,integer * ndimen,integer * nbsesp,integer * ndimse,integer * ndminu,integer * ndminv,integer * ndguli,integer * ndgvli,integer * ndjacu,integer * ndjacv,integer * iordru,integer * iordrv,integer * nbpntu,integer * nbpntv,doublereal * epsapr,doublereal * sosotb,doublereal * disotb,doublereal * soditb,doublereal * diditb,doublereal * patjac,doublereal * errmax,doublereal * errmoy,integer * ndegpu,integer * ndegpv,integer * itydec,integer * iercod);
		%feature("compactdefaultargs") mma2can_;
		%feature("autodoc", "	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : integer *
	:rtype: int
") mma2can_;
		static int mma2can_ (const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const doublereal * ,doublereal * ,doublereal * ,integer * );
		%feature("compactdefaultargs") mma1her_;
		%feature("autodoc", "	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : integer *
	:rtype: int
") mma1her_;
		static int mma1her_ (const integer * ,doublereal * ,integer * );
		%feature("compactdefaultargs") mma2ac2_;
		%feature("autodoc", "	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:rtype: int
") mma2ac2_;
		static int mma2ac2_ (const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const doublereal * ,const integer * ,const doublereal * ,const doublereal * ,doublereal * );
		%feature("compactdefaultargs") mma2ac3_;
		%feature("autodoc", "	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:rtype: int
") mma2ac3_;
		static int mma2ac3_ (const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const doublereal * ,const integer * ,const doublereal * ,const doublereal * ,doublereal * );
		%feature("compactdefaultargs") mma2ac1_;
		%feature("autodoc", "	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:rtype: int
") mma2ac1_;
		static int mma2ac1_ (const integer * ,const integer * ,const integer * ,const integer * ,const integer * ,const doublereal * ,const doublereal * ,const doublereal * ,const doublereal * ,const doublereal * ,const doublereal * ,doublereal * );
		%feature("compactdefaultargs") mma2fx6_;
		%feature("autodoc", "	:param ncfmxu:
	:type ncfmxu: integer *
	:param ncfmxv:
	:type ncfmxv: integer *
	:param ndimen:
	:type ndimen: integer *
	:param nbsesp:
	:type nbsesp: integer *
	:param ndimse:
	:type ndimse: integer *
	:param nbupat:
	:type nbupat: integer *
	:param nbvpat:
	:type nbvpat: integer *
	:param iordru:
	:type iordru: integer *
	:param iordrv:
	:type iordrv: integer *
	:param epsapr:
	:type epsapr: doublereal *
	:param epsfro:
	:type epsfro: doublereal *
	:param patcan:
	:type patcan: doublereal *
	:param errmax:
	:type errmax: doublereal *
	:param ncoefu:
	:type ncoefu: integer *
	:param ncoefv:
	:type ncoefv: integer *
	:rtype: int
") mma2fx6_;
		static int mma2fx6_ (integer * ncfmxu,integer * ncfmxv,integer * ndimen,integer * nbsesp,integer * ndimse,integer * nbupat,integer * nbvpat,integer * iordru,integer * iordrv,doublereal * epsapr,doublereal * epsfro,doublereal * patcan,doublereal * errmax,integer * ncoefu,integer * ncoefv);
};


%extend AdvApp2Var_ApproxF2var {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_Context;
class AdvApp2Var_Context {
	public:
		%feature("compactdefaultargs") AdvApp2Var_Context;
		%feature("autodoc", "	:rtype: None
") AdvApp2Var_Context;
		 AdvApp2Var_Context ();
		%feature("compactdefaultargs") AdvApp2Var_Context;
		%feature("autodoc", "	:param ifav:
	:type ifav: int
	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:param nlimu:
	:type nlimu: int
	:param nlimv:
	:type nlimv: int
	:param iprecis:
	:type iprecis: int
	:param nb1Dss:
	:type nb1Dss: int
	:param nb2Dss:
	:type nb2Dss: int
	:param nb3Dss:
	:type nb3Dss: int
	:param tol1D:
	:type tol1D: Handle_TColStd_HArray1OfReal &
	:param tol2D:
	:type tol2D: Handle_TColStd_HArray1OfReal &
	:param tol3D:
	:type tol3D: Handle_TColStd_HArray1OfReal &
	:param tof1D:
	:type tof1D: Handle_TColStd_HArray2OfReal &
	:param tof2D:
	:type tof2D: Handle_TColStd_HArray2OfReal &
	:param tof3D:
	:type tof3D: Handle_TColStd_HArray2OfReal &
	:rtype: None
") AdvApp2Var_Context;
		 AdvApp2Var_Context (const Standard_Integer ifav,const Standard_Integer iu,const Standard_Integer iv,const Standard_Integer nlimu,const Standard_Integer nlimv,const Standard_Integer iprecis,const Standard_Integer nb1Dss,const Standard_Integer nb2Dss,const Standard_Integer nb3Dss,const Handle_TColStd_HArray1OfReal & tol1D,const Handle_TColStd_HArray1OfReal & tol2D,const Handle_TColStd_HArray1OfReal & tol3D,const Handle_TColStd_HArray2OfReal & tof1D,const Handle_TColStd_HArray2OfReal & tof2D,const Handle_TColStd_HArray2OfReal & tof3D);
		%feature("compactdefaultargs") TotalDimension;
		%feature("autodoc", "	:rtype: int
") TotalDimension;
		Standard_Integer TotalDimension ();
		%feature("compactdefaultargs") TotalNumberSSP;
		%feature("autodoc", "	:rtype: int
") TotalNumberSSP;
		Standard_Integer TotalNumberSSP ();
		%feature("compactdefaultargs") FavorIso;
		%feature("autodoc", "	:rtype: int
") FavorIso;
		Standard_Integer FavorIso ();
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "	:rtype: int
") UOrder;
		Standard_Integer UOrder ();
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "	:rtype: int
") VOrder;
		Standard_Integer VOrder ();
		%feature("compactdefaultargs") ULimit;
		%feature("autodoc", "	:rtype: int
") ULimit;
		Standard_Integer ULimit ();
		%feature("compactdefaultargs") VLimit;
		%feature("autodoc", "	:rtype: int
") VLimit;
		Standard_Integer VLimit ();
		%feature("compactdefaultargs") UJacDeg;
		%feature("autodoc", "	:rtype: int
") UJacDeg;
		Standard_Integer UJacDeg ();
		%feature("compactdefaultargs") VJacDeg;
		%feature("autodoc", "	:rtype: int
") VJacDeg;
		Standard_Integer VJacDeg ();
		%feature("compactdefaultargs") UJacMax;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") UJacMax;
		Handle_TColStd_HArray1OfReal UJacMax ();
		%feature("compactdefaultargs") VJacMax;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") VJacMax;
		Handle_TColStd_HArray1OfReal VJacMax ();
		%feature("compactdefaultargs") URoots;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") URoots;
		Handle_TColStd_HArray1OfReal URoots ();
		%feature("compactdefaultargs") VRoots;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") VRoots;
		Handle_TColStd_HArray1OfReal VRoots ();
		%feature("compactdefaultargs") UGauss;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") UGauss;
		Handle_TColStd_HArray1OfReal UGauss ();
		%feature("compactdefaultargs") VGauss;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") VGauss;
		Handle_TColStd_HArray1OfReal VGauss ();
		%feature("compactdefaultargs") IToler;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") IToler;
		Handle_TColStd_HArray1OfReal IToler ();
		%feature("compactdefaultargs") FToler;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfReal
") FToler;
		Handle_TColStd_HArray2OfReal FToler ();
		%feature("compactdefaultargs") CToler;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfReal
") CToler;
		Handle_TColStd_HArray2OfReal CToler ();
};


%extend AdvApp2Var_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_Criterion;
class AdvApp2Var_Criterion {
	public:
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param P:
	:type P: AdvApp2Var_Patch &
	:param C:
	:type C: AdvApp2Var_Context &
	:rtype: void
") Value;
		virtual void Value (AdvApp2Var_Patch & P,const AdvApp2Var_Context & C);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:param P:
	:type P: AdvApp2Var_Patch &
	:rtype: bool
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied (const AdvApp2Var_Patch & P);
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "	:rtype: float
") MaxValue;
		Standard_Real MaxValue ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: AdvApp2Var_CriterionType
") Type;
		AdvApp2Var_CriterionType Type ();
		%feature("compactdefaultargs") Repartition;
		%feature("autodoc", "	:rtype: AdvApp2Var_CriterionRepartition
") Repartition;
		AdvApp2Var_CriterionRepartition Repartition ();
};


%extend AdvApp2Var_Criterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_Data;
class AdvApp2Var_Data {
	public:
		%feature("compactdefaultargs") Getmdnombr;
		%feature("autodoc", "	:rtype: mdnombr_1_
") Getmdnombr;
		static mdnombr_1_ & Getmdnombr ();
		%feature("compactdefaultargs") Getminombr;
		%feature("autodoc", "	:rtype: minombr_1_
") Getminombr;
		static minombr_1_ & Getminombr ();
		%feature("compactdefaultargs") Getmaovpar;
		%feature("autodoc", "	:rtype: maovpar_1_
") Getmaovpar;
		static maovpar_1_ & Getmaovpar ();
		%feature("compactdefaultargs") Getmaovpch;
		%feature("autodoc", "	:rtype: maovpch_1_
") Getmaovpch;
		static maovpch_1_ & Getmaovpch ();
		%feature("compactdefaultargs") Getmlgdrtl;
		%feature("autodoc", "	:rtype: mlgdrtl_1_
") Getmlgdrtl;
		static mlgdrtl_1_ & Getmlgdrtl ();
		%feature("compactdefaultargs") Getmmjcobi;
		%feature("autodoc", "	:rtype: mmjcobi_1_
") Getmmjcobi;
		static mmjcobi_1_ & Getmmjcobi ();
		%feature("compactdefaultargs") Getmmcmcnp;
		%feature("autodoc", "	:rtype: mmcmcnp_1_
") Getmmcmcnp;
		static mmcmcnp_1_ & Getmmcmcnp ();
		%feature("compactdefaultargs") Getmmapgss;
		%feature("autodoc", "	:rtype: mmapgss_1_
") Getmmapgss;
		static mmapgss_1_ & Getmmapgss ();
		%feature("compactdefaultargs") Getmmapgs0;
		%feature("autodoc", "	:rtype: mmapgs0_1_
") Getmmapgs0;
		static mmapgs0_1_ & Getmmapgs0 ();
		%feature("compactdefaultargs") Getmmapgs1;
		%feature("autodoc", "	:rtype: mmapgs1_1_
") Getmmapgs1;
		static mmapgs1_1_ & Getmmapgs1 ();
		%feature("compactdefaultargs") Getmmapgs2;
		%feature("autodoc", "	:rtype: mmapgs2_1_
") Getmmapgs2;
		static mmapgs2_1_ & Getmmapgs2 ();
};


%extend AdvApp2Var_Data {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_Framework;
class AdvApp2Var_Framework {
	public:
		%feature("compactdefaultargs") AdvApp2Var_Framework;
		%feature("autodoc", "	:rtype: None
") AdvApp2Var_Framework;
		 AdvApp2Var_Framework ();
		%feature("compactdefaultargs") AdvApp2Var_Framework;
		%feature("autodoc", "	:param Frame:
	:type Frame: AdvApp2Var_SequenceOfNode &
	:param UFrontier:
	:type UFrontier: AdvApp2Var_SequenceOfStrip &
	:param VFrontier:
	:type VFrontier: AdvApp2Var_SequenceOfStrip &
	:rtype: None
") AdvApp2Var_Framework;
		 AdvApp2Var_Framework (const AdvApp2Var_SequenceOfNode & Frame,const AdvApp2Var_SequenceOfStrip & UFrontier,const AdvApp2Var_SequenceOfStrip & VFrontier);
		%feature("compactdefaultargs") FirstNotApprox;
		%feature("autodoc", "	* search the Index of the first Iso not approximated, if all Isos are approximated Standard_False is returned.

	:param IndexIso:
	:type IndexIso: int &
	:param IndexStrip:
	:type IndexStrip: int &
	:param anIso:
	:type anIso: AdvApp2Var_Iso &
	:rtype: bool
") FirstNotApprox;
		Standard_Boolean FirstNotApprox (Standard_Integer &OutValue,Standard_Integer &OutValue,AdvApp2Var_Iso & anIso);
		%feature("compactdefaultargs") FirstNode;
		%feature("autodoc", "	:param Type:
	:type Type: GeomAbs_IsoType
	:param IndexIso:
	:type IndexIso: int
	:param IndexStrip:
	:type IndexStrip: int
	:rtype: int
") FirstNode;
		Standard_Integer FirstNode (const GeomAbs_IsoType Type,const Standard_Integer IndexIso,const Standard_Integer IndexStrip);
		%feature("compactdefaultargs") LastNode;
		%feature("autodoc", "	:param Type:
	:type Type: GeomAbs_IsoType
	:param IndexIso:
	:type IndexIso: int
	:param IndexStrip:
	:type IndexStrip: int
	:rtype: int
") LastNode;
		Standard_Integer LastNode (const GeomAbs_IsoType Type,const Standard_Integer IndexIso,const Standard_Integer IndexStrip);
		%feature("compactdefaultargs") ChangeIso;
		%feature("autodoc", "	:param IndexIso:
	:type IndexIso: int
	:param IndexStrip:
	:type IndexStrip: int
	:param anIso:
	:type anIso: AdvApp2Var_Iso &
	:rtype: None
") ChangeIso;
		void ChangeIso (const Standard_Integer IndexIso,const Standard_Integer IndexStrip,const AdvApp2Var_Iso & anIso);
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "	:param IndexNode:
	:type IndexNode: int
	:rtype: AdvApp2Var_Node
") Node;
		const AdvApp2Var_Node & Node (const Standard_Integer IndexNode);
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: AdvApp2Var_Node
") Node;
		const AdvApp2Var_Node & Node (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") IsoU;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V0:
	:type V0: float
	:param V1:
	:type V1: float
	:rtype: AdvApp2Var_Iso
") IsoU;
		const AdvApp2Var_Iso & IsoU (const Standard_Real U,const Standard_Real V0,const Standard_Real V1);
		%feature("compactdefaultargs") IsoV;
		%feature("autodoc", "	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param V:
	:type V: float
	:rtype: AdvApp2Var_Iso
") IsoV;
		const AdvApp2Var_Iso & IsoV (const Standard_Real U0,const Standard_Real U1,const Standard_Real V);
		%feature("compactdefaultargs") ChangeNode;
		%feature("autodoc", "	:param IndexNode:
	:type IndexNode: int
	:rtype: AdvApp2Var_Node
") ChangeNode;
		AdvApp2Var_Node & ChangeNode (const Standard_Integer IndexNode);
		%feature("compactdefaultargs") UpdateInU;
		%feature("autodoc", "	:param CuttingValue:
	:type CuttingValue: float
	:rtype: None
") UpdateInU;
		void UpdateInU (const Standard_Real CuttingValue);
		%feature("compactdefaultargs") UpdateInV;
		%feature("autodoc", "	:param CuttingValue:
	:type CuttingValue: float
	:rtype: None
") UpdateInV;
		void UpdateInV (const Standard_Real CuttingValue);
		%feature("compactdefaultargs") UEquation;
		%feature("autodoc", "	:param IndexIso:
	:type IndexIso: int
	:param IndexStrip:
	:type IndexStrip: int
	:rtype: Handle_TColStd_HArray1OfReal
") UEquation;
		Handle_TColStd_HArray1OfReal UEquation (const Standard_Integer IndexIso,const Standard_Integer IndexStrip);
		%feature("compactdefaultargs") VEquation;
		%feature("autodoc", "	:param IndexIso:
	:type IndexIso: int
	:param IndexStrip:
	:type IndexStrip: int
	:rtype: Handle_TColStd_HArray1OfReal
") VEquation;
		Handle_TColStd_HArray1OfReal VEquation (const Standard_Integer IndexIso,const Standard_Integer IndexStrip);
};


%extend AdvApp2Var_Framework {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_MathBase;
class AdvApp2Var_MathBase {
	public:
		%feature("compactdefaultargs") mmapcmp_;
		%feature("autodoc", "	* ///

	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : double *
	:param :
	:type : double *
	:rtype: int
") mmapcmp_;
		static int mmapcmp_ (integer * ,integer * ,integer * ,double * ,double * );
		%feature("compactdefaultargs") mmdrc11_;
		%feature("autodoc", "	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:rtype: int
") mmdrc11_;
		static int mmdrc11_ (integer * ,integer * ,integer * ,doublereal * ,doublereal * ,doublereal * );
		%feature("compactdefaultargs") mmfmca9_;
		%feature("autodoc", "	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:rtype: int
") mmfmca9_;
		static int mmfmca9_ (integer * ,integer * ,integer * ,integer * ,integer * ,integer * ,doublereal * ,doublereal * );
		%feature("compactdefaultargs") mmfmcb5_;
		%feature("autodoc", "	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:param :
	:type : doublereal *
	:param :
	:type : integer *
	:rtype: int
") mmfmcb5_;
		static int mmfmcb5_ (integer * ,integer * ,integer * ,doublereal * ,integer * ,integer * ,integer * ,doublereal * ,integer * );
		%feature("compactdefaultargs") mmwprcs_;
		%feature("autodoc", "	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : doublereal *
	:param :
	:type : integer *
	:param :
	:type : integer *
	:rtype: void
") mmwprcs_;
		static void mmwprcs_ (doublereal * ,doublereal * ,doublereal * ,doublereal * ,integer * ,integer * );
		%feature("compactdefaultargs") mmcglc1_;
		%feature("autodoc", "	* ///

	:param ndimax:
	:type ndimax: integer *
	:param ndimen:
	:type ndimen: integer *
	:param ncoeff:
	:type ncoeff: integer *
	:param courbe:
	:type courbe: doublereal *
	:param tdebut:
	:type tdebut: doublereal *
	:param tfinal:
	:type tfinal: doublereal *
	:param epsiln:
	:type epsiln: doublereal *
	:param xlongc:
	:type xlongc: doublereal *
	:param erreur:
	:type erreur: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmcglc1_;
		static int mmcglc1_ (integer * ndimax,integer * ndimen,integer * ncoeff,doublereal * courbe,doublereal * tdebut,doublereal * tfinal,doublereal * epsiln,doublereal * xlongc,doublereal * erreur,integer * iercod);
		%feature("compactdefaultargs") mmbulld_;
		%feature("autodoc", "	:param nbcoln:
	:type nbcoln: integer *
	:param nblign:
	:type nblign: integer *
	:param dtabtr:
	:type dtabtr: doublereal *
	:param numcle:
	:type numcle: integer *
	:rtype: int
") mmbulld_;
		static int mmbulld_ (integer * nbcoln,integer * nblign,doublereal * dtabtr,integer * numcle);
		%feature("compactdefaultargs") mmcdriv_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param ncoeff:
	:type ncoeff: integer *
	:param courbe:
	:type courbe: doublereal *
	:param ideriv:
	:type ideriv: integer *
	:param ncofdv:
	:type ncofdv: integer *
	:param crvdrv:
	:type crvdrv: doublereal *
	:rtype: int
") mmcdriv_;
		static int mmcdriv_ (integer * ndimen,integer * ncoeff,doublereal * courbe,integer * ideriv,integer * ncofdv,doublereal * crvdrv);
		%feature("compactdefaultargs") mmcvctx_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param ncofmx:
	:type ncofmx: integer *
	:param nderiv:
	:type nderiv: integer *
	:param ctrtes:
	:type ctrtes: doublereal *
	:param crvres:
	:type crvres: doublereal *
	:param tabaux:
	:type tabaux: doublereal *
	:param xmatri:
	:type xmatri: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmcvctx_;
		static int mmcvctx_ (integer * ndimen,integer * ncofmx,integer * nderiv,doublereal * ctrtes,doublereal * crvres,doublereal * tabaux,doublereal * xmatri,integer * iercod);
		%feature("compactdefaultargs") mdsptpt_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param point1:
	:type point1: doublereal *
	:param point2:
	:type point2: doublereal *
	:param distan:
	:type distan: doublereal *
	:rtype: int
") mdsptpt_;
		static int mdsptpt_ (integer * ndimen,doublereal * point1,doublereal * point2,doublereal * distan);
		%feature("compactdefaultargs") mmaperx_;
		%feature("autodoc", "	:param ncofmx:
	:type ncofmx: integer *
	:param ndimen:
	:type ndimen: integer *
	:param ncoeff:
	:type ncoeff: integer *
	:param iordre:
	:type iordre: integer *
	:param crvjac:
	:type crvjac: doublereal *
	:param ncfnew:
	:type ncfnew: integer *
	:param ycvmax:
	:type ycvmax: doublereal *
	:param errmax:
	:type errmax: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmaperx_;
		static int mmaperx_ (integer * ncofmx,integer * ndimen,integer * ncoeff,integer * iordre,doublereal * crvjac,integer * ncfnew,doublereal * ycvmax,doublereal * errmax,integer * iercod);
		%feature("compactdefaultargs") mmdrvck_;
		%feature("autodoc", "	:param ncoeff:
	:type ncoeff: integer *
	:param ndimen:
	:type ndimen: integer *
	:param courbe:
	:type courbe: doublereal *
	:param ideriv:
	:type ideriv: integer *
	:param tparam:
	:type tparam: doublereal *
	:param pntcrb:
	:type pntcrb: doublereal *
	:rtype: int
") mmdrvck_;
		static int mmdrvck_ (integer * ncoeff,integer * ndimen,doublereal * courbe,integer * ideriv,doublereal * tparam,doublereal * pntcrb);
		%feature("compactdefaultargs") mmeps1_;
		%feature("autodoc", "	:param epsilo:
	:type epsilo: doublereal *
	:rtype: int
") mmeps1_;
		static int mmeps1_ (doublereal * epsilo);
		%feature("compactdefaultargs") mmfmca8_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param ncoefu:
	:type ncoefu: integer *
	:param ncoefv:
	:type ncoefv: integer *
	:param ndimax:
	:type ndimax: integer *
	:param ncfumx:
	:type ncfumx: integer *
	:param ncfvmx:
	:type ncfvmx: integer *
	:param tabini:
	:type tabini: doublereal *
	:param tabres:
	:type tabres: doublereal *
	:rtype: int
") mmfmca8_;
		static int mmfmca8_ (const integer * ndimen,const integer * ncoefu,const integer * ncoefv,const integer * ndimax,const integer * ncfumx,const integer * ncfvmx,doublereal * tabini,doublereal * tabres);
		%feature("compactdefaultargs") mmfmcar_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param ncofmx:
	:type ncofmx: integer *
	:param ncoefu:
	:type ncoefu: integer *
	:param ncoefv:
	:type ncoefv: integer *
	:param patold:
	:type patold: doublereal *
	:param upara1:
	:type upara1: doublereal *
	:param upara2:
	:type upara2: doublereal *
	:param vpara1:
	:type vpara1: doublereal *
	:param vpara2:
	:type vpara2: doublereal *
	:param patnew:
	:type patnew: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmfmcar_;
		static int mmfmcar_ (integer * ndimen,integer * ncofmx,integer * ncoefu,integer * ncoefv,doublereal * patold,doublereal * upara1,doublereal * upara2,doublereal * vpara1,doublereal * vpara2,doublereal * patnew,integer * iercod);
		%feature("compactdefaultargs") mmfmtb1_;
		%feature("autodoc", "	:param maxsz1:
	:type maxsz1: integer *
	:param table1:
	:type table1: doublereal *
	:param isize1:
	:type isize1: integer *
	:param jsize1:
	:type jsize1: integer *
	:param maxsz2:
	:type maxsz2: integer *
	:param table2:
	:type table2: doublereal *
	:param isize2:
	:type isize2: integer *
	:param jsize2:
	:type jsize2: integer *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmfmtb1_;
		static int mmfmtb1_ (integer * maxsz1,doublereal * table1,integer * isize1,integer * jsize1,integer * maxsz2,doublereal * table2,integer * isize2,integer * jsize2,integer * iercod);
		%feature("compactdefaultargs") mmgaus1_;
		%feature("autodoc", "	:param ndimf:
	:type ndimf: integer *
	:param :
	:type : int(*bfunx)(integer*ninteg,doublereal*parame,doublereal*vfunj1,integer*iercod)
	:param k:
	:type k: integer *
	:param xd:
	:type xd: doublereal *
	:param xf:
	:type xf: doublereal *
	:param saux1:
	:type saux1: doublereal *
	:param saux2:
	:type saux2: doublereal *
	:param somme:
	:type somme: doublereal *
	:param niter:
	:type niter: integer *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmgaus1_;
		static int mmgaus1_ (integer * ndimf,int(*bfunx)(integer*ninteg,doublereal*parame,doublereal*vfunj1,integer*iercod) ,integer * k,doublereal * xd,doublereal * xf,doublereal * saux1,doublereal * saux2,doublereal * somme,integer * niter,integer * iercod);
		%feature("compactdefaultargs") mmhjcan_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param ncourb:
	:type ncourb: integer *
	:param ncftab:
	:type ncftab: integer *
	:param orcont:
	:type orcont: integer *
	:param ncflim:
	:type ncflim: integer *
	:param tcbold:
	:type tcbold: doublereal *
	:param tdecop:
	:type tdecop: doublereal *
	:param tcbnew:
	:type tcbnew: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmhjcan_;
		static int mmhjcan_ (integer * ndimen,integer * ncourb,integer * ncftab,integer * orcont,integer * ncflim,doublereal * tcbold,doublereal * tdecop,doublereal * tcbnew,integer * iercod);
		%feature("compactdefaultargs") mminltt_;
		%feature("autodoc", "	:param ncolmx:
	:type ncolmx: integer *
	:param nlgnmx:
	:type nlgnmx: integer *
	:param tabtri:
	:type tabtri: doublereal *
	:param nbrcol:
	:type nbrcol: integer *
	:param nbrlgn:
	:type nbrlgn: integer *
	:param ajoute:
	:type ajoute: doublereal *
	:param epseg:
	:type epseg: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mminltt_;
		static int mminltt_ (integer * ncolmx,integer * nlgnmx,doublereal * tabtri,integer * nbrcol,integer * nbrlgn,doublereal * ajoute,doublereal * epseg,integer * iercod);
		%feature("compactdefaultargs") mmjaccv_;
		%feature("autodoc", "	:param ncoef:
	:type ncoef: integer *
	:param ndim:
	:type ndim: integer *
	:param ider:
	:type ider: integer *
	:param crvlgd:
	:type crvlgd: doublereal *
	:param polaux:
	:type polaux: doublereal *
	:param crvcan:
	:type crvcan: doublereal *
	:rtype: int
") mmjaccv_;
		static int mmjaccv_ (const integer * ncoef,const integer * ndim,const integer * ider,const doublereal * crvlgd,doublereal * polaux,doublereal * crvcan);
		%feature("compactdefaultargs") mmpobas_;
		%feature("autodoc", "	:param tparam:
	:type tparam: doublereal *
	:param iordre:
	:type iordre: integer *
	:param ncoeff:
	:type ncoeff: integer *
	:param nderiv:
	:type nderiv: integer *
	:param valbas:
	:type valbas: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmpobas_;
		static int mmpobas_ (doublereal * tparam,integer * iordre,integer * ncoeff,integer * nderiv,doublereal * valbas,integer * iercod);
		%feature("compactdefaultargs") mmmpocur_;
		%feature("autodoc", "	:param ncofmx:
	:type ncofmx: integer *
	:param ndim:
	:type ndim: integer *
	:param ndeg:
	:type ndeg: integer *
	:param courbe:
	:type courbe: doublereal *
	:param tparam:
	:type tparam: doublereal *
	:param tabval:
	:type tabval: doublereal *
	:rtype: int
") mmmpocur_;
		static int mmmpocur_ (integer * ncofmx,integer * ndim,integer * ndeg,doublereal * courbe,doublereal * tparam,doublereal * tabval);
		%feature("compactdefaultargs") mmposui_;
		%feature("autodoc", "	:param dimmat:
	:type dimmat: integer *
	:param nistoc:
	:type nistoc: integer *
	:param aposit:
	:type aposit: integer *
	:param posuiv:
	:type posuiv: integer *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmposui_;
		static int mmposui_ (integer * dimmat,integer * nistoc,integer * aposit,integer * posuiv,integer * iercod);
		%feature("compactdefaultargs") mmresol_;
		%feature("autodoc", "	:param hdimen:
	:type hdimen: integer *
	:param gdimen:
	:type gdimen: integer *
	:param hnstoc:
	:type hnstoc: integer *
	:param gnstoc:
	:type gnstoc: integer *
	:param mnstoc:
	:type mnstoc: integer *
	:param matsyh:
	:type matsyh: doublereal *
	:param matsyg:
	:type matsyg: doublereal *
	:param vecsyh:
	:type vecsyh: doublereal *
	:param vecsyg:
	:type vecsyg: doublereal *
	:param hposit:
	:type hposit: integer *
	:param hposui:
	:type hposui: integer *
	:param gposit:
	:type gposit: integer *
	:param mmposui:
	:type mmposui: integer *
	:param mposit:
	:type mposit: integer *
	:param vecsol:
	:type vecsol: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmresol_;
		static int mmresol_ (integer * hdimen,integer * gdimen,integer * hnstoc,integer * gnstoc,integer * mnstoc,doublereal * matsyh,doublereal * matsyg,doublereal * vecsyh,doublereal * vecsyg,integer * hposit,integer * hposui,integer * gposit,integer * mmposui,integer * mposit,doublereal * vecsol,integer * iercod);
		%feature("compactdefaultargs") mmrtptt_;
		%feature("autodoc", "	:param ndglgd:
	:type ndglgd: integer *
	:param rtlegd:
	:type rtlegd: doublereal *
	:rtype: int
") mmrtptt_;
		static int mmrtptt_ (integer * ndglgd,doublereal * rtlegd);
		%feature("compactdefaultargs") mmsrre2_;
		%feature("autodoc", "	:param tparam:
	:type tparam: doublereal *
	:param nbrval:
	:type nbrval: integer *
	:param tablev:
	:type tablev: doublereal *
	:param epsil:
	:type epsil: doublereal *
	:param numint:
	:type numint: integer *
	:param itypen:
	:type itypen: integer *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmsrre2_;
		static int mmsrre2_ (doublereal * tparam,integer * nbrval,doublereal * tablev,doublereal * epsil,integer * numint,integer * itypen,integer * iercod);
		%feature("compactdefaultargs") mmtrpjj_;
		%feature("autodoc", "	:param ncofmx:
	:type ncofmx: integer *
	:param ndimen:
	:type ndimen: integer *
	:param ncoeff:
	:type ncoeff: integer *
	:param epsi3d:
	:type epsi3d: doublereal *
	:param iordre:
	:type iordre: integer *
	:param crvlgd:
	:type crvlgd: doublereal *
	:param ycvmax:
	:type ycvmax: doublereal *
	:param errmax:
	:type errmax: doublereal *
	:param ncfnew:
	:type ncfnew: integer *
	:rtype: int
") mmtrpjj_;
		static int mmtrpjj_ (integer * ncofmx,integer * ndimen,integer * ncoeff,doublereal * epsi3d,integer * iordre,doublereal * crvlgd,doublereal * ycvmax,doublereal * errmax,integer * ncfnew);
		%feature("compactdefaultargs") mmunivt_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param vector:
	:type vector: doublereal *
	:param vecnrm:
	:type vecnrm: doublereal *
	:param epsiln:
	:type epsiln: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmunivt_;
		static int mmunivt_ (integer * ndimen,doublereal * vector,doublereal * vecnrm,doublereal * epsiln,integer * iercod);
		%feature("compactdefaultargs") mmvncol_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param vecin:
	:type vecin: doublereal *
	:param vecout:
	:type vecout: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmvncol_;
		static int mmvncol_ (integer * ndimen,doublereal * vecin,doublereal * vecout,integer * iercod);
		%feature("compactdefaultargs") msc_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param vecte1:
	:type vecte1: doublereal *
	:param vecte2:
	:type vecte2: doublereal *
	:rtype: doublereal
") msc_;
		static doublereal msc_ (integer * ndimen,doublereal * vecte1,doublereal * vecte2);
		%feature("compactdefaultargs") mvsheld_;
		%feature("autodoc", "	:param n:
	:type n: integer *
	:param is:
	:type is: integer *
	:param dtab:
	:type dtab: doublereal *
	:param icle:
	:type icle: integer *
	:rtype: int
") mvsheld_;
		static int mvsheld_ (integer * n,integer * is,doublereal * dtab,integer * icle);
		%feature("compactdefaultargs") mmarcin_;
		%feature("autodoc", "	:param ndimax:
	:type ndimax: integer *
	:param ndim:
	:type ndim: integer *
	:param ncoeff:
	:type ncoeff: integer *
	:param crvold:
	:type crvold: doublereal *
	:param u0:
	:type u0: doublereal *
	:param u1:
	:type u1: doublereal *
	:param crvnew:
	:type crvnew: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmarcin_;
		static int mmarcin_ (integer * ndimax,integer * ndim,integer * ncoeff,doublereal * crvold,doublereal * u0,doublereal * u1,doublereal * crvnew,integer * iercod);
		%feature("compactdefaultargs") mmcvinv_;
		%feature("autodoc", "	:param ndimax:
	:type ndimax: integer *
	:param ncoef:
	:type ncoef: integer *
	:param ndim:
	:type ndim: integer *
	:param curveo:
	:type curveo: doublereal *
	:param curve:
	:type curve: doublereal *
	:rtype: int
") mmcvinv_;
		static int mmcvinv_ (integer * ndimax,integer * ncoef,integer * ndim,doublereal * curveo,doublereal * curve);
		%feature("compactdefaultargs") mmjacan_;
		%feature("autodoc", "	:param ideriv:
	:type ideriv: integer *
	:param ndeg:
	:type ndeg: integer *
	:param poljac:
	:type poljac: doublereal *
	:param polcan:
	:type polcan: doublereal *
	:rtype: int
") mmjacan_;
		static int mmjacan_ (const integer * ideriv,integer * ndeg,doublereal * poljac,doublereal * polcan);
		%feature("compactdefaultargs") mmpocrb_;
		%feature("autodoc", "	:param ndimax:
	:type ndimax: integer *
	:param ncoeff:
	:type ncoeff: integer *
	:param courbe:
	:type courbe: doublereal *
	:param ndim:
	:type ndim: integer *
	:param tparam:
	:type tparam: doublereal *
	:param pntcrb:
	:type pntcrb: doublereal *
	:rtype: int
") mmpocrb_;
		static int mmpocrb_ (integer * ndimax,integer * ncoeff,doublereal * courbe,integer * ndim,doublereal * tparam,doublereal * pntcrb);
		%feature("compactdefaultargs") mmmrslwd_;
		%feature("autodoc", "	:param normax:
	:type normax: integer *
	:param nordre:
	:type nordre: integer *
	:param ndim:
	:type ndim: integer *
	:param amat:
	:type amat: doublereal *
	:param bmat:
	:type bmat: doublereal *
	:param epspiv:
	:type epspiv: doublereal *
	:param aaux:
	:type aaux: doublereal *
	:param xmat:
	:type xmat: doublereal *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mmmrslwd_;
		static int mmmrslwd_ (integer * normax,integer * nordre,integer * ndim,doublereal * amat,doublereal * bmat,doublereal * epspiv,doublereal * aaux,doublereal * xmat,integer * iercod);
		%feature("compactdefaultargs") mmveps3_;
		%feature("autodoc", "	:param eps03:
	:type eps03: doublereal *
	:rtype: int
") mmveps3_;
		static int mmveps3_ (doublereal * eps03);
		%feature("compactdefaultargs") pow__di;
		%feature("autodoc", "	:param x:
	:type x: doublereal *
	:param n:
	:type n: integer *
	:rtype: doublereal
") pow__di;
		static doublereal pow__di (doublereal * x,integer * n);
		%feature("compactdefaultargs") mzsnorm_;
		%feature("autodoc", "	:param ndimen:
	:type ndimen: integer *
	:param vecteu:
	:type vecteu: doublereal *
	:rtype: doublereal
") mzsnorm_;
		static doublereal mzsnorm_ (integer * ndimen,doublereal * vecteu);
};


%extend AdvApp2Var_MathBase {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_Network;
class AdvApp2Var_Network {
	public:
		%feature("compactdefaultargs") AdvApp2Var_Network;
		%feature("autodoc", "	:rtype: None
") AdvApp2Var_Network;
		 AdvApp2Var_Network ();
		%feature("compactdefaultargs") AdvApp2Var_Network;
		%feature("autodoc", "	:param Net:
	:type Net: AdvApp2Var_SequenceOfPatch &
	:param TheU:
	:type TheU: TColStd_SequenceOfReal &
	:param TheV:
	:type TheV: TColStd_SequenceOfReal &
	:rtype: None
") AdvApp2Var_Network;
		 AdvApp2Var_Network (const AdvApp2Var_SequenceOfPatch & Net,const TColStd_SequenceOfReal & TheU,const TColStd_SequenceOfReal & TheV);
		%feature("compactdefaultargs") FirstNotApprox;
		%feature("autodoc", "	* search the Index of the first Patch not approximated, if all Patches are approximated Standard_False is returned

	:param Index:
	:type Index: int &
	:rtype: bool
") FirstNotApprox;
		Standard_Boolean FirstNotApprox (Standard_Integer &OutValue);
		%feature("compactdefaultargs") ChangePatch;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AdvApp2Var_Patch
") ChangePatch;
		AdvApp2Var_Patch & ChangePatch (const Standard_Integer Index);
		%feature("compactdefaultargs") UpdateInU;
		%feature("autodoc", "	:param CuttingValue:
	:type CuttingValue: float
	:rtype: None
") UpdateInU;
		void UpdateInU (const Standard_Real CuttingValue);
		%feature("compactdefaultargs") UpdateInV;
		%feature("autodoc", "	:param CuttingValue:
	:type CuttingValue: float
	:rtype: None
") UpdateInV;
		void UpdateInV (const Standard_Real CuttingValue);
		%feature("compactdefaultargs") SameDegree;
		%feature("autodoc", "	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:param ncfu:
	:type ncfu: int &
	:param ncfv:
	:type ncfv: int &
	:rtype: None
") SameDegree;
		void SameDegree (const Standard_Integer iu,const Standard_Integer iv,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") NbPatch;
		%feature("autodoc", "	:rtype: int
") NbPatch;
		Standard_Integer NbPatch ();
		%feature("compactdefaultargs") NbPatchInU;
		%feature("autodoc", "	:rtype: int
") NbPatchInU;
		Standard_Integer NbPatchInU ();
		%feature("compactdefaultargs") NbPatchInV;
		%feature("autodoc", "	:rtype: int
") NbPatchInV;
		Standard_Integer NbPatchInV ();
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") UParameter;
		Standard_Real UParameter (const Standard_Integer Index);
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") VParameter;
		Standard_Real VParameter (const Standard_Integer Index);
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:rtype: AdvApp2Var_Patch
") Patch;
		const AdvApp2Var_Patch & Patch (const Standard_Integer UIndex,const Standard_Integer VIndex);
};


%extend AdvApp2Var_Network {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_Node;
class AdvApp2Var_Node {
	public:
		%feature("compactdefaultargs") AdvApp2Var_Node;
		%feature("autodoc", "	:rtype: None
") AdvApp2Var_Node;
		 AdvApp2Var_Node ();
		%feature("compactdefaultargs") AdvApp2Var_Node;
		%feature("autodoc", "	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:rtype: None
") AdvApp2Var_Node;
		 AdvApp2Var_Node (const Standard_Integer iu,const Standard_Integer iv);
		%feature("compactdefaultargs") AdvApp2Var_Node;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:rtype: None
") AdvApp2Var_Node;
		 AdvApp2Var_Node (const gp_XY & UV,const Standard_Integer iu,const Standard_Integer iv);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	:rtype: gp_XY
") Coord;
		gp_XY Coord ();
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	:param x1:
	:type x1: float
	:param x2:
	:type x2: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real x1,const Standard_Real x2);
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "	:rtype: int
") UOrder;
		Standard_Integer UOrder ();
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "	:rtype: int
") VOrder;
		Standard_Integer VOrder ();
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:param Cte:
	:type Cte: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const Standard_Integer iu,const Standard_Integer iv,const gp_Pnt & Cte);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point (const Standard_Integer iu,const Standard_Integer iv);
		%feature("compactdefaultargs") SetError;
		%feature("autodoc", "	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:param error:
	:type error: float
	:rtype: None
") SetError;
		void SetError (const Standard_Integer iu,const Standard_Integer iv,const Standard_Real error);
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer iu,const Standard_Integer iv);
};


%extend AdvApp2Var_Node {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_Patch;
class AdvApp2Var_Patch {
	public:
		%feature("compactdefaultargs") AdvApp2Var_Patch;
		%feature("autodoc", "	:rtype: None
") AdvApp2Var_Patch;
		 AdvApp2Var_Patch ();
		%feature("compactdefaultargs") AdvApp2Var_Patch;
		%feature("autodoc", "	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param V0:
	:type V0: float
	:param V1:
	:type V1: float
	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:rtype: None
") AdvApp2Var_Patch;
		 AdvApp2Var_Patch (const Standard_Real U0,const Standard_Real U1,const Standard_Real V0,const Standard_Real V1,const Standard_Integer iu,const Standard_Integer iv);
		%feature("compactdefaultargs") IsDiscretised;
		%feature("autodoc", "	:rtype: bool
") IsDiscretised;
		Standard_Boolean IsDiscretised ();
		%feature("compactdefaultargs") Discretise;
		%feature("autodoc", "	:param Conditions:
	:type Conditions: AdvApp2Var_Context &
	:param Constraints:
	:type Constraints: AdvApp2Var_Framework &
	:param func:
	:type func: AdvApp2Var_EvaluatorFunc2Var &
	:rtype: None
") Discretise;
		void Discretise (const AdvApp2Var_Context & Conditions,const AdvApp2Var_Framework & Constraints,const AdvApp2Var_EvaluatorFunc2Var & func);
		%feature("compactdefaultargs") IsApproximated;
		%feature("autodoc", "	:rtype: bool
") IsApproximated;
		Standard_Boolean IsApproximated ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") MakeApprox;
		%feature("autodoc", "	:param Conditions:
	:type Conditions: AdvApp2Var_Context &
	:param Constraints:
	:type Constraints: AdvApp2Var_Framework &
	:param NumDec:
	:type NumDec: int
	:rtype: None
") MakeApprox;
		void MakeApprox (const AdvApp2Var_Context & Conditions,const AdvApp2Var_Framework & Constraints,const Standard_Integer NumDec);
		%feature("compactdefaultargs") AddConstraints;
		%feature("autodoc", "	:param Conditions:
	:type Conditions: AdvApp2Var_Context &
	:param Constraints:
	:type Constraints: AdvApp2Var_Framework &
	:rtype: None
") AddConstraints;
		void AddConstraints (const AdvApp2Var_Context & Conditions,const AdvApp2Var_Framework & Constraints);
		%feature("compactdefaultargs") AddErrors;
		%feature("autodoc", "	:param Constraints:
	:type Constraints: AdvApp2Var_Framework &
	:rtype: None
") AddErrors;
		void AddErrors (const AdvApp2Var_Framework & Constraints);
		%feature("compactdefaultargs") ChangeDomain;
		%feature("autodoc", "	:param a:
	:type a: float
	:param b:
	:type b: float
	:param c:
	:type c: float
	:param d:
	:type d: float
	:rtype: None
") ChangeDomain;
		void ChangeDomain (const Standard_Real a,const Standard_Real b,const Standard_Real c,const Standard_Real d);
		%feature("compactdefaultargs") ResetApprox;
		%feature("autodoc", "	:rtype: None
") ResetApprox;
		void ResetApprox ();
		%feature("compactdefaultargs") OverwriteApprox;
		%feature("autodoc", "	:rtype: None
") OverwriteApprox;
		void OverwriteApprox ();
		%feature("compactdefaultargs") U0;
		%feature("autodoc", "	:rtype: float
") U0;
		Standard_Real U0 ();
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "	:rtype: float
") U1;
		Standard_Real U1 ();
		%feature("compactdefaultargs") V0;
		%feature("autodoc", "	:rtype: float
") V0;
		Standard_Real V0 ();
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "	:rtype: float
") V1;
		Standard_Real V1 ();
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "	:rtype: int
") UOrder;
		Standard_Integer UOrder ();
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "	:rtype: int
") VOrder;
		Standard_Integer VOrder ();
		%feature("compactdefaultargs") CutSense;
		%feature("autodoc", "	:rtype: int
") CutSense;
		Standard_Integer CutSense ();
		%feature("compactdefaultargs") CutSense;
		%feature("autodoc", "	:param Crit:
	:type Crit: AdvApp2Var_Criterion &
	:param NumDec:
	:type NumDec: int
	:rtype: int
") CutSense;
		Standard_Integer CutSense (const AdvApp2Var_Criterion & Crit,const Standard_Integer NumDec);
		%feature("compactdefaultargs") NbCoeffInU;
		%feature("autodoc", "	:rtype: int
") NbCoeffInU;
		Standard_Integer NbCoeffInU ();
		%feature("compactdefaultargs") NbCoeffInV;
		%feature("autodoc", "	:rtype: int
") NbCoeffInV;
		Standard_Integer NbCoeffInV ();
		%feature("compactdefaultargs") ChangeNbCoeff;
		%feature("autodoc", "	:param NbCoeffU:
	:type NbCoeffU: int
	:param NbCoeffV:
	:type NbCoeffV: int
	:rtype: None
") ChangeNbCoeff;
		void ChangeNbCoeff (const Standard_Integer NbCoeffU,const Standard_Integer NbCoeffV);
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	:param SSPIndex:
	:type SSPIndex: int
	:param Conditions:
	:type Conditions: AdvApp2Var_Context &
	:rtype: Handle_TColgp_HArray2OfPnt
") Poles;
		Handle_TColgp_HArray2OfPnt Poles (const Standard_Integer SSPIndex,const AdvApp2Var_Context & Conditions);
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	:param SSPIndex:
	:type SSPIndex: int
	:param Conditions:
	:type Conditions: AdvApp2Var_Context &
	:rtype: Handle_TColStd_HArray1OfReal
") Coefficients;
		Handle_TColStd_HArray1OfReal Coefficients (const Standard_Integer SSPIndex,const AdvApp2Var_Context & Conditions);
		%feature("compactdefaultargs") MaxErrors;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") MaxErrors;
		Handle_TColStd_HArray1OfReal MaxErrors ();
		%feature("compactdefaultargs") AverageErrors;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") AverageErrors;
		Handle_TColStd_HArray1OfReal AverageErrors ();
		%feature("compactdefaultargs") IsoErrors;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfReal
") IsoErrors;
		Handle_TColStd_HArray2OfReal IsoErrors ();
		%feature("compactdefaultargs") CritValue;
		%feature("autodoc", "	:rtype: float
") CritValue;
		Standard_Real CritValue ();
		%feature("compactdefaultargs") SetCritValue;
		%feature("autodoc", "	:param dist:
	:type dist: float
	:rtype: None
") SetCritValue;
		void SetCritValue (const Standard_Real dist);
};


%extend AdvApp2Var_Patch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_SequenceNodeOfSequenceOfNode;
class AdvApp2Var_SequenceNodeOfSequenceOfNode : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") AdvApp2Var_SequenceNodeOfSequenceOfNode;
		%feature("autodoc", "	:param I:
	:type I: AdvApp2Var_Node &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") AdvApp2Var_SequenceNodeOfSequenceOfNode;
		 AdvApp2Var_SequenceNodeOfSequenceOfNode (const AdvApp2Var_Node & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AdvApp2Var_Node
") Value;
		AdvApp2Var_Node & Value ();
};


%extend AdvApp2Var_SequenceNodeOfSequenceOfNode {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode::Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    AdvApp2Var_SequenceNodeOfSequenceOfNode* _get_reference() {
    return (AdvApp2Var_SequenceNodeOfSequenceOfNode*)$self->Access();
    }
};

%extend Handle_AdvApp2Var_SequenceNodeOfSequenceOfNode {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AdvApp2Var_SequenceNodeOfSequenceOfNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_SequenceNodeOfSequenceOfPatch;
class AdvApp2Var_SequenceNodeOfSequenceOfPatch : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") AdvApp2Var_SequenceNodeOfSequenceOfPatch;
		%feature("autodoc", "	:param I:
	:type I: AdvApp2Var_Patch &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") AdvApp2Var_SequenceNodeOfSequenceOfPatch;
		 AdvApp2Var_SequenceNodeOfSequenceOfPatch (const AdvApp2Var_Patch & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AdvApp2Var_Patch
") Value;
		AdvApp2Var_Patch & Value ();
};


%extend AdvApp2Var_SequenceNodeOfSequenceOfPatch {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch::Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    AdvApp2Var_SequenceNodeOfSequenceOfPatch* _get_reference() {
    return (AdvApp2Var_SequenceNodeOfSequenceOfPatch*)$self->Access();
    }
};

%extend Handle_AdvApp2Var_SequenceNodeOfSequenceOfPatch {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AdvApp2Var_SequenceNodeOfSequenceOfPatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_SequenceNodeOfSequenceOfStrip;
class AdvApp2Var_SequenceNodeOfSequenceOfStrip : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") AdvApp2Var_SequenceNodeOfSequenceOfStrip;
		%feature("autodoc", "	:param I:
	:type I: AdvApp2Var_Strip &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") AdvApp2Var_SequenceNodeOfSequenceOfStrip;
		 AdvApp2Var_SequenceNodeOfSequenceOfStrip (const AdvApp2Var_Strip & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AdvApp2Var_Strip
") Value;
		AdvApp2Var_Strip & Value ();
};


%extend AdvApp2Var_SequenceNodeOfSequenceOfStrip {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip::Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    AdvApp2Var_SequenceNodeOfSequenceOfStrip* _get_reference() {
    return (AdvApp2Var_SequenceNodeOfSequenceOfStrip*)$self->Access();
    }
};

%extend Handle_AdvApp2Var_SequenceNodeOfSequenceOfStrip {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AdvApp2Var_SequenceNodeOfSequenceOfStrip {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_SequenceNodeOfStrip;
class AdvApp2Var_SequenceNodeOfStrip : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") AdvApp2Var_SequenceNodeOfStrip;
		%feature("autodoc", "	:param I:
	:type I: AdvApp2Var_Iso &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") AdvApp2Var_SequenceNodeOfStrip;
		 AdvApp2Var_SequenceNodeOfStrip (const AdvApp2Var_Iso & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AdvApp2Var_Iso
") Value;
		AdvApp2Var_Iso & Value ();
};


%extend AdvApp2Var_SequenceNodeOfStrip {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AdvApp2Var_SequenceNodeOfStrip(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AdvApp2Var_SequenceNodeOfStrip::Handle_AdvApp2Var_SequenceNodeOfStrip %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    AdvApp2Var_SequenceNodeOfStrip* _get_reference() {
    return (AdvApp2Var_SequenceNodeOfStrip*)$self->Access();
    }
};

%extend Handle_AdvApp2Var_SequenceNodeOfStrip {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AdvApp2Var_SequenceNodeOfStrip {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_SequenceOfNode;
class AdvApp2Var_SequenceOfNode : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") AdvApp2Var_SequenceOfNode;
		%feature("autodoc", "	:rtype: None
") AdvApp2Var_SequenceOfNode;
		 AdvApp2Var_SequenceOfNode ();
		%feature("compactdefaultargs") AdvApp2Var_SequenceOfNode;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_SequenceOfNode &
	:rtype: None
") AdvApp2Var_SequenceOfNode;
		 AdvApp2Var_SequenceOfNode (const AdvApp2Var_SequenceOfNode & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_SequenceOfNode &
	:rtype: AdvApp2Var_SequenceOfNode
") Assign;
		const AdvApp2Var_SequenceOfNode & Assign (const AdvApp2Var_SequenceOfNode & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_SequenceOfNode &
	:rtype: AdvApp2Var_SequenceOfNode
") operator =;
		const AdvApp2Var_SequenceOfNode & operator = (const AdvApp2Var_SequenceOfNode & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: AdvApp2Var_Node &
	:rtype: None
") Append;
		void Append (const AdvApp2Var_Node & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: AdvApp2Var_SequenceOfNode &
	:rtype: None
") Append;
		void Append (AdvApp2Var_SequenceOfNode & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: AdvApp2Var_Node &
	:rtype: None
") Prepend;
		void Prepend (const AdvApp2Var_Node & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: AdvApp2Var_SequenceOfNode &
	:rtype: None
") Prepend;
		void Prepend (AdvApp2Var_SequenceOfNode & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AdvApp2Var_Node &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const AdvApp2Var_Node & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AdvApp2Var_SequenceOfNode &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AdvApp2Var_SequenceOfNode & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AdvApp2Var_Node &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const AdvApp2Var_Node & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AdvApp2Var_SequenceOfNode &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AdvApp2Var_SequenceOfNode & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: AdvApp2Var_Node
") First;
		const AdvApp2Var_Node & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: AdvApp2Var_Node
") Last;
		const AdvApp2Var_Node & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: AdvApp2Var_SequenceOfNode &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,AdvApp2Var_SequenceOfNode & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AdvApp2Var_Node
") Value;
		const AdvApp2Var_Node & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: AdvApp2Var_Node &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AdvApp2Var_Node & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AdvApp2Var_Node
") ChangeValue;
		AdvApp2Var_Node & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend AdvApp2Var_SequenceOfNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_SequenceOfPatch;
class AdvApp2Var_SequenceOfPatch : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") AdvApp2Var_SequenceOfPatch;
		%feature("autodoc", "	:rtype: None
") AdvApp2Var_SequenceOfPatch;
		 AdvApp2Var_SequenceOfPatch ();
		%feature("compactdefaultargs") AdvApp2Var_SequenceOfPatch;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_SequenceOfPatch &
	:rtype: None
") AdvApp2Var_SequenceOfPatch;
		 AdvApp2Var_SequenceOfPatch (const AdvApp2Var_SequenceOfPatch & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_SequenceOfPatch &
	:rtype: AdvApp2Var_SequenceOfPatch
") Assign;
		const AdvApp2Var_SequenceOfPatch & Assign (const AdvApp2Var_SequenceOfPatch & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_SequenceOfPatch &
	:rtype: AdvApp2Var_SequenceOfPatch
") operator =;
		const AdvApp2Var_SequenceOfPatch & operator = (const AdvApp2Var_SequenceOfPatch & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: AdvApp2Var_Patch &
	:rtype: None
") Append;
		void Append (const AdvApp2Var_Patch & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: AdvApp2Var_SequenceOfPatch &
	:rtype: None
") Append;
		void Append (AdvApp2Var_SequenceOfPatch & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: AdvApp2Var_Patch &
	:rtype: None
") Prepend;
		void Prepend (const AdvApp2Var_Patch & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: AdvApp2Var_SequenceOfPatch &
	:rtype: None
") Prepend;
		void Prepend (AdvApp2Var_SequenceOfPatch & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AdvApp2Var_Patch &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const AdvApp2Var_Patch & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AdvApp2Var_SequenceOfPatch &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AdvApp2Var_SequenceOfPatch & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AdvApp2Var_Patch &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const AdvApp2Var_Patch & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AdvApp2Var_SequenceOfPatch &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AdvApp2Var_SequenceOfPatch & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: AdvApp2Var_Patch
") First;
		const AdvApp2Var_Patch & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: AdvApp2Var_Patch
") Last;
		const AdvApp2Var_Patch & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: AdvApp2Var_SequenceOfPatch &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,AdvApp2Var_SequenceOfPatch & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AdvApp2Var_Patch
") Value;
		const AdvApp2Var_Patch & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: AdvApp2Var_Patch &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AdvApp2Var_Patch & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AdvApp2Var_Patch
") ChangeValue;
		AdvApp2Var_Patch & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend AdvApp2Var_SequenceOfPatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_SequenceOfStrip;
class AdvApp2Var_SequenceOfStrip : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") AdvApp2Var_SequenceOfStrip;
		%feature("autodoc", "	:rtype: None
") AdvApp2Var_SequenceOfStrip;
		 AdvApp2Var_SequenceOfStrip ();
		%feature("compactdefaultargs") AdvApp2Var_SequenceOfStrip;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_SequenceOfStrip &
	:rtype: None
") AdvApp2Var_SequenceOfStrip;
		 AdvApp2Var_SequenceOfStrip (const AdvApp2Var_SequenceOfStrip & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_SequenceOfStrip &
	:rtype: AdvApp2Var_SequenceOfStrip
") Assign;
		const AdvApp2Var_SequenceOfStrip & Assign (const AdvApp2Var_SequenceOfStrip & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_SequenceOfStrip &
	:rtype: AdvApp2Var_SequenceOfStrip
") operator =;
		const AdvApp2Var_SequenceOfStrip & operator = (const AdvApp2Var_SequenceOfStrip & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: AdvApp2Var_Strip &
	:rtype: None
") Append;
		void Append (const AdvApp2Var_Strip & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: AdvApp2Var_SequenceOfStrip &
	:rtype: None
") Append;
		void Append (AdvApp2Var_SequenceOfStrip & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: AdvApp2Var_Strip &
	:rtype: None
") Prepend;
		void Prepend (const AdvApp2Var_Strip & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: AdvApp2Var_SequenceOfStrip &
	:rtype: None
") Prepend;
		void Prepend (AdvApp2Var_SequenceOfStrip & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AdvApp2Var_Strip &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const AdvApp2Var_Strip & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AdvApp2Var_SequenceOfStrip &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AdvApp2Var_SequenceOfStrip & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AdvApp2Var_Strip &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const AdvApp2Var_Strip & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AdvApp2Var_SequenceOfStrip &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AdvApp2Var_SequenceOfStrip & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: AdvApp2Var_Strip
") First;
		const AdvApp2Var_Strip & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: AdvApp2Var_Strip
") Last;
		const AdvApp2Var_Strip & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: AdvApp2Var_SequenceOfStrip &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,AdvApp2Var_SequenceOfStrip & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AdvApp2Var_Strip
") Value;
		const AdvApp2Var_Strip & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: AdvApp2Var_Strip &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AdvApp2Var_Strip & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AdvApp2Var_Strip
") ChangeValue;
		AdvApp2Var_Strip & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend AdvApp2Var_SequenceOfStrip {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_Strip;
class AdvApp2Var_Strip : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") AdvApp2Var_Strip;
		%feature("autodoc", "	:rtype: None
") AdvApp2Var_Strip;
		 AdvApp2Var_Strip ();
		%feature("compactdefaultargs") AdvApp2Var_Strip;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_Strip &
	:rtype: None
") AdvApp2Var_Strip;
		 AdvApp2Var_Strip (const AdvApp2Var_Strip & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_Strip &
	:rtype: AdvApp2Var_Strip
") Assign;
		const AdvApp2Var_Strip & Assign (const AdvApp2Var_Strip & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: AdvApp2Var_Strip &
	:rtype: AdvApp2Var_Strip
") operator =;
		const AdvApp2Var_Strip & operator = (const AdvApp2Var_Strip & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: AdvApp2Var_Iso &
	:rtype: None
") Append;
		void Append (const AdvApp2Var_Iso & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: AdvApp2Var_Strip &
	:rtype: None
") Append;
		void Append (AdvApp2Var_Strip & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: AdvApp2Var_Iso &
	:rtype: None
") Prepend;
		void Prepend (const AdvApp2Var_Iso & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: AdvApp2Var_Strip &
	:rtype: None
") Prepend;
		void Prepend (AdvApp2Var_Strip & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AdvApp2Var_Iso &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const AdvApp2Var_Iso & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AdvApp2Var_Strip &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,AdvApp2Var_Strip & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: AdvApp2Var_Iso &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const AdvApp2Var_Iso & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: AdvApp2Var_Strip &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,AdvApp2Var_Strip & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: AdvApp2Var_Iso
") First;
		const AdvApp2Var_Iso & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: AdvApp2Var_Iso
") Last;
		const AdvApp2Var_Iso & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: AdvApp2Var_Strip &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,AdvApp2Var_Strip & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AdvApp2Var_Iso
") Value;
		const AdvApp2Var_Iso & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: AdvApp2Var_Iso &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const AdvApp2Var_Iso & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AdvApp2Var_Iso
") ChangeValue;
		AdvApp2Var_Iso & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend AdvApp2Var_Strip {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AdvApp2Var_SysBase;
class AdvApp2Var_SysBase {
	public:
		%feature("compactdefaultargs") AdvApp2Var_SysBase;
		%feature("autodoc", "	:rtype: None
") AdvApp2Var_SysBase;
		 AdvApp2Var_SysBase ();
		%feature("compactdefaultargs") mainial_;
		%feature("autodoc", "	:rtype: int
") mainial_;
		int mainial_ ();
		%feature("compactdefaultargs") macinit_;
		%feature("autodoc", "	:param :
	:type : int *
	:param :
	:type : int *
	:rtype: int
") macinit_;
		static int macinit_ (int * ,int * );
		%feature("compactdefaultargs") mcrdelt_;
		%feature("autodoc", "	:param iunit:
	:type iunit: integer *
	:param isize:
	:type isize: integer *
	:param t:
	:type t: void *
	:param iofset:
	:type iofset: intptr_t *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mcrdelt_;
		int mcrdelt_ (integer * iunit,integer * isize,void * t,intptr_t * iofset,integer * iercod);
		%feature("compactdefaultargs") mcrfill_;
		%feature("autodoc", "	:param size:
	:type size: integer *
	:param tin:
	:type tin: void *
	:param tout:
	:type tout: void *
	:rtype: int
") mcrfill_;
		static int mcrfill_ (integer * size,void * tin,void * tout);
		%feature("compactdefaultargs") mcrrqst_;
		%feature("autodoc", "	:param iunit:
	:type iunit: integer *
	:param isize:
	:type isize: integer *
	:param t:
	:type t: void *
	:param iofset:
	:type iofset: intptr_t *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") mcrrqst_;
		int mcrrqst_ (integer * iunit,integer * isize,void * t,intptr_t * iofset,integer * iercod);
		%feature("compactdefaultargs") mnfndeb_;
		%feature("autodoc", "	:rtype: integer
") mnfndeb_;
		static integer mnfndeb_ ();
		%feature("compactdefaultargs") do__fio;
		%feature("autodoc", "	:rtype: int
") do__fio;
		static int do__fio ();
		%feature("compactdefaultargs") do__lio;
		%feature("autodoc", "	:rtype: int
") do__lio;
		static int do__lio ();
		%feature("compactdefaultargs") macrai4_;
		%feature("autodoc", "	:param nbelem:
	:type nbelem: integer *
	:param maxelm:
	:type maxelm: integer *
	:param itablo:
	:type itablo: integer *
	:param iofset:
	:type iofset: intptr_t *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") macrai4_;
		int macrai4_ (integer * nbelem,integer * maxelm,integer * itablo,intptr_t * iofset,integer * iercod);
		%feature("compactdefaultargs") macrar8_;
		%feature("autodoc", "	:param nbelem:
	:type nbelem: integer *
	:param maxelm:
	:type maxelm: integer *
	:param xtablo:
	:type xtablo: doublereal *
	:param iofset:
	:type iofset: intptr_t *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") macrar8_;
		int macrar8_ (integer * nbelem,integer * maxelm,doublereal * xtablo,intptr_t * iofset,integer * iercod);
		%feature("compactdefaultargs") macrdi4_;
		%feature("autodoc", "	:param nbelem:
	:type nbelem: integer *
	:param maxelm:
	:type maxelm: integer *
	:param itablo:
	:type itablo: integer *
	:param iofset:
	:type iofset: intptr_t *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") macrdi4_;
		int macrdi4_ (integer * nbelem,integer * maxelm,integer * itablo,intptr_t * iofset,integer * iercod);
		%feature("compactdefaultargs") macrdr8_;
		%feature("autodoc", "	:param nbelem:
	:type nbelem: integer *
	:param maxelm:
	:type maxelm: integer *
	:param xtablo:
	:type xtablo: doublereal *
	:param iofset:
	:type iofset: intptr_t *
	:param iercod:
	:type iercod: integer *
	:rtype: int
") macrdr8_;
		int macrdr8_ (integer * nbelem,integer * maxelm,doublereal * xtablo,intptr_t * iofset,integer * iercod);
		%feature("compactdefaultargs") maermsg_;
		%feature("autodoc", "	:param cnompg:
	:type cnompg: char *
	:param icoder:
	:type icoder: integer *
	:param cnompg_len:
	:type cnompg_len: ftnlen
	:rtype: int
") maermsg_;
		static int maermsg_ (const char * cnompg,integer * icoder,ftnlen cnompg_len);
		%feature("compactdefaultargs") maitbr8_;
		%feature("autodoc", "	:param itaill:
	:type itaill: integer *
	:param xtab:
	:type xtab: doublereal *
	:param xval:
	:type xval: doublereal *
	:rtype: int
") maitbr8_;
		static int maitbr8_ (integer * itaill,doublereal * xtab,doublereal * xval);
		%feature("compactdefaultargs") maovsr8_;
		%feature("autodoc", "	:param ivalcs:
	:type ivalcs: integer *
	:rtype: int
") maovsr8_;
		static int maovsr8_ (integer * ivalcs);
		%feature("compactdefaultargs") mgenmsg_;
		%feature("autodoc", "	:param nomprg:
	:type nomprg: char *
	:param nomprg_len:
	:type nomprg_len: ftnlen
	:rtype: int
") mgenmsg_;
		static int mgenmsg_ (const char * nomprg,ftnlen nomprg_len);
		%feature("compactdefaultargs") mgsomsg_;
		%feature("autodoc", "	:param nomprg:
	:type nomprg: char *
	:param nomprg_len:
	:type nomprg_len: ftnlen
	:rtype: int
") mgsomsg_;
		static int mgsomsg_ (const char * nomprg,ftnlen nomprg_len);
		%feature("compactdefaultargs") miraz_;
		%feature("autodoc", "	:param taille:
	:type taille: integer *
	:param adt:
	:type adt: void *
	:rtype: void
") miraz_;
		static void miraz_ (integer * taille,void * adt);
		%feature("compactdefaultargs") msifill_;
		%feature("autodoc", "	:param nbintg:
	:type nbintg: integer *
	:param ivecin:
	:type ivecin: integer *
	:param ivecou:
	:type ivecou: integer *
	:rtype: int
") msifill_;
		static int msifill_ (integer * nbintg,integer * ivecin,integer * ivecou);
		%feature("compactdefaultargs") msrfill_;
		%feature("autodoc", "	:param nbreel:
	:type nbreel: integer *
	:param vecent:
	:type vecent: doublereal *
	:param vecsor:
	:type vecsor: doublereal *
	:rtype: int
") msrfill_;
		static int msrfill_ (integer * nbreel,doublereal * vecent,doublereal * vecsor);
		%feature("compactdefaultargs") mswrdbg_;
		%feature("autodoc", "	:param ctexte:
	:type ctexte: char *
	:param ctexte_len:
	:type ctexte_len: ftnlen
	:rtype: int
") mswrdbg_;
		static int mswrdbg_ (const char * ctexte,ftnlen ctexte_len);
		%feature("compactdefaultargs") mvriraz_;
		%feature("autodoc", "	:param taille:
	:type taille: integer *
	:param adt:
	:type adt: void *
	:rtype: void
") mvriraz_;
		static void mvriraz_ (integer * taille,void * adt);
};


%extend AdvApp2Var_SysBase {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
