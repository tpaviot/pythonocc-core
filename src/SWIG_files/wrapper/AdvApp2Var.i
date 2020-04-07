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
%define ADVAPP2VARDOCSTRING
"AdvApp2Var module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_advapp2var.html"
%enddef
%module (package="OCC.Core", docstring=ADVAPP2VARDOCSTRING) AdvApp2Var


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
#if defined(_WIN32)
#include <windows.h>
#endif
#include<AdvApp2Var_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<AdvApprox_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<PLib_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import GeomAbs.i
%import AdvApprox.i
%import Geom.i
%import gp.i
%import TColgp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class AdvApp2Var_CriterionRepartition(IntEnum):
	AdvApp2Var_Regular = 0
	AdvApp2Var_Incremental = 1
AdvApp2Var_Regular = AdvApp2Var_CriterionRepartition.AdvApp2Var_Regular
AdvApp2Var_Incremental = AdvApp2Var_CriterionRepartition.AdvApp2Var_Incremental

class AdvApp2Var_CriterionType(IntEnum):
	AdvApp2Var_Absolute = 0
	AdvApp2Var_Relative = 1
AdvApp2Var_Absolute = AdvApp2Var_CriterionType.AdvApp2Var_Absolute
AdvApp2Var_Relative = AdvApp2Var_CriterionType.AdvApp2Var_Relative
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(AdvApp2Var_SequenceOfNode) NCollection_Sequence<AdvApp2Var_Node>;
%template(AdvApp2Var_SequenceOfPatch) NCollection_Sequence<AdvApp2Var_Patch>;
%template(AdvApp2Var_SequenceOfStrip) NCollection_Sequence<AdvApp2Var_Strip>;
%template(AdvApp2Var_Strip) NCollection_Sequence<AdvApp2Var_Iso>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<AdvApp2Var_Node> AdvApp2Var_SequenceOfNode;
typedef NCollection_Sequence<AdvApp2Var_Patch> AdvApp2Var_SequenceOfPatch;
typedef NCollection_Sequence<AdvApp2Var_Strip> AdvApp2Var_SequenceOfStrip;
typedef NCollection_Sequence<AdvApp2Var_Iso> AdvApp2Var_Strip;
/* end typedefs declaration */

/***********************************
* class AdvApp2Var_ApproxAFunc2Var *
***********************************/
class AdvApp2Var_ApproxAFunc2Var {
	public:
		/****************** AdvApp2Var_ApproxAFunc2Var ******************/
		%feature("compactdefaultargs") AdvApp2Var_ApproxAFunc2Var;
		%feature("autodoc", "No available documentation.

Parameters
----------
Num1DSS: int
Num2DSS: int
Num3DSS: int
OneDTol: TColStd_HArray1OfReal
TwoDTol: TColStd_HArray1OfReal
ThreeDTol: TColStd_HArray1OfReal
OneDTolFr: TColStd_HArray2OfReal
TwoDTolFr: TColStd_HArray2OfReal
ThreeDTolFr: TColStd_HArray2OfReal
FirstInU: float
LastInU: float
FirstInV: float
LastInV: float
FavorIso: GeomAbs_IsoType
ContInU: GeomAbs_Shape
ContInV: GeomAbs_Shape
PrecisCode: int
MaxDegInU: int
MaxDegInV: int
MaxPatch: int
Func: AdvApp2Var_EvaluatorFunc2Var
UChoice: AdvApprox_Cutting
VChoice: AdvApprox_Cutting

Returns
-------
None
") AdvApp2Var_ApproxAFunc2Var;
		 AdvApp2Var_ApproxAFunc2Var(const Standard_Integer Num1DSS, const Standard_Integer Num2DSS, const Standard_Integer Num3DSS, const opencascade::handle<TColStd_HArray1OfReal> & OneDTol, const opencascade::handle<TColStd_HArray1OfReal> & TwoDTol, const opencascade::handle<TColStd_HArray1OfReal> & ThreeDTol, const opencascade::handle<TColStd_HArray2OfReal> & OneDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & TwoDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & ThreeDTolFr, const Standard_Real FirstInU, const Standard_Real LastInU, const Standard_Real FirstInV, const Standard_Real LastInV, const GeomAbs_IsoType FavorIso, const GeomAbs_Shape ContInU, const GeomAbs_Shape ContInV, const Standard_Integer PrecisCode, const Standard_Integer MaxDegInU, const Standard_Integer MaxDegInV, const Standard_Integer MaxPatch, const AdvApp2Var_EvaluatorFunc2Var & Func, AdvApprox_Cutting & UChoice, AdvApprox_Cutting & VChoice);

		/****************** AdvApp2Var_ApproxAFunc2Var ******************/
		%feature("compactdefaultargs") AdvApp2Var_ApproxAFunc2Var;
		%feature("autodoc", "No available documentation.

Parameters
----------
Num1DSS: int
Num2DSS: int
Num3DSS: int
OneDTol: TColStd_HArray1OfReal
TwoDTol: TColStd_HArray1OfReal
ThreeDTol: TColStd_HArray1OfReal
OneDTolFr: TColStd_HArray2OfReal
TwoDTolFr: TColStd_HArray2OfReal
ThreeDTolFr: TColStd_HArray2OfReal
FirstInU: float
LastInU: float
FirstInV: float
LastInV: float
FavorIso: GeomAbs_IsoType
ContInU: GeomAbs_Shape
ContInV: GeomAbs_Shape
PrecisCode: int
MaxDegInU: int
MaxDegInV: int
MaxPatch: int
Func: AdvApp2Var_EvaluatorFunc2Var
Crit: AdvApp2Var_Criterion
UChoice: AdvApprox_Cutting
VChoice: AdvApprox_Cutting

Returns
-------
None
") AdvApp2Var_ApproxAFunc2Var;
		 AdvApp2Var_ApproxAFunc2Var(const Standard_Integer Num1DSS, const Standard_Integer Num2DSS, const Standard_Integer Num3DSS, const opencascade::handle<TColStd_HArray1OfReal> & OneDTol, const opencascade::handle<TColStd_HArray1OfReal> & TwoDTol, const opencascade::handle<TColStd_HArray1OfReal> & ThreeDTol, const opencascade::handle<TColStd_HArray2OfReal> & OneDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & TwoDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & ThreeDTolFr, const Standard_Real FirstInU, const Standard_Real LastInU, const Standard_Real FirstInV, const Standard_Real LastInV, const GeomAbs_IsoType FavorIso, const GeomAbs_Shape ContInU, const GeomAbs_Shape ContInV, const Standard_Integer PrecisCode, const Standard_Integer MaxDegInU, const Standard_Integer MaxDegInV, const Standard_Integer MaxPatch, const AdvApp2Var_EvaluatorFunc2Var & Func, const AdvApp2Var_Criterion & Crit, AdvApprox_Cutting & UChoice, AdvApprox_Cutting & VChoice);

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the average errors.

Parameters
----------
Dimension: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") AverageError;
		opencascade::handle<TColStd_HArray1OfReal> AverageError(const Standard_Integer Dimension);

		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "Returns the average error of the bsplinesurface of range index.

Parameters
----------
Dimension: int
Index: int

Returns
-------
float
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, const Standard_Integer Index);

		/****************** CritError ******************/
		%feature("compactdefaultargs") CritError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
Index: int

Returns
-------
float
") CritError;
		Standard_Real CritError(const Standard_Integer Dimension, const Standard_Integer Index);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "True if the approximation did come out with a result that is not necessarely within the required tolerance or a result that is not recognized with the wished continuities.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the approximation succeeded within the imposed tolerances and the wished continuities.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Returns the errors max.

Parameters
----------
Dimension: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") MaxError;
		opencascade::handle<TColStd_HArray1OfReal> MaxError(const Standard_Integer Dimension);

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Returns the error max of the bsplinesurface of range index.

Parameters
----------
Dimension: int
Index: int

Returns
-------
float
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, const Standard_Integer Index);

		/****************** NumSubSpaces ******************/
		%feature("compactdefaultargs") NumSubSpaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int

Returns
-------
int
") NumSubSpaces;
		Standard_Integer NumSubSpaces(const Standard_Integer Dimension);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the bsplinesurface of range index.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface(const Standard_Integer Index);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** UFrontError ******************/
		%feature("compactdefaultargs") UFrontError;
		%feature("autodoc", "Returns the errors max on ufrontiers warning: dimension must be equal to 3.

Parameters
----------
Dimension: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") UFrontError;
		opencascade::handle<TColStd_HArray1OfReal> UFrontError(const Standard_Integer Dimension);

		/****************** UFrontError ******************/
		%feature("compactdefaultargs") UFrontError;
		%feature("autodoc", "Returns the error max of the bsplinesurface of range index on a ufrontier.

Parameters
----------
Dimension: int
Index: int

Returns
-------
float
") UFrontError;
		Standard_Real UFrontError(const Standard_Integer Dimension, const Standard_Integer Index);

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

		/****************** VFrontError ******************/
		%feature("compactdefaultargs") VFrontError;
		%feature("autodoc", "Returns the errors max on vfrontiers warning: dimension must be equal to 3.

Parameters
----------
Dimension: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") VFrontError;
		opencascade::handle<TColStd_HArray1OfReal> VFrontError(const Standard_Integer Dimension);

		/****************** VFrontError ******************/
		%feature("compactdefaultargs") VFrontError;
		%feature("autodoc", "Returns the error max of the bsplinesurface of range index on a vfrontier.

Parameters
----------
Dimension: int
Index: int

Returns
-------
float
") VFrontError;
		Standard_Real VFrontError(const Standard_Integer Dimension, const Standard_Integer Index);

};


%extend AdvApp2Var_ApproxAFunc2Var {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class AdvApp2Var_ApproxF2var *
*******************************/
class AdvApp2Var_ApproxF2var {
	public:
		/****************** mma1her_ ******************/
		%feature("compactdefaultargs") mma1her_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: integer *
: doublereal *
: integer *

Returns
-------
int
") mma1her_;
		static int mma1her_(const integer * , doublereal * , integer * );

		/****************** mma2ac1_ ******************/
		%feature("compactdefaultargs") mma2ac1_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: integer *
: integer *
: integer *
: integer *
: integer *
: doublereal *
: doublereal *
: doublereal *
: doublereal *
: doublereal *
: doublereal *
: doublereal *

Returns
-------
int
") mma2ac1_;
		static int mma2ac1_(const integer * , const integer * , const integer * , const integer * , const integer * , const doublereal * , const doublereal * , const doublereal * , const doublereal * , const doublereal * , const doublereal * , doublereal * );

		/****************** mma2ac2_ ******************/
		%feature("compactdefaultargs") mma2ac2_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: integer *
: integer *
: integer *
: integer *
: integer *
: integer *
: doublereal *
: integer *
: doublereal *
: doublereal *
: doublereal *

Returns
-------
int
") mma2ac2_;
		static int mma2ac2_(const integer * , const integer * , const integer * , const integer * , const integer * , const integer * , const doublereal * , const integer * , const doublereal * , const doublereal * , doublereal * );

		/****************** mma2ac3_ ******************/
		%feature("compactdefaultargs") mma2ac3_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: integer *
: integer *
: integer *
: integer *
: integer *
: integer *
: doublereal *
: integer *
: doublereal *
: doublereal *
: doublereal *

Returns
-------
int
") mma2ac3_;
		static int mma2ac3_(const integer * , const integer * , const integer * , const integer * , const integer * , const integer * , const doublereal * , const integer * , const doublereal * , const doublereal * , doublereal * );

		/****************** mma2can_ ******************/
		%feature("compactdefaultargs") mma2can_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: integer *
: integer *
: integer *
: integer *
: integer *
: integer *
: integer *
: doublereal *
: doublereal *
: doublereal *
: integer *

Returns
-------
int
") mma2can_;
		static int mma2can_(const integer * , const integer * , const integer * , const integer * , const integer * , const integer * , const integer * , const doublereal * , doublereal * , doublereal * , integer * );

		/****************** mma2cdi_ ******************/
		%feature("compactdefaultargs") mma2cdi_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
nbpntu: integer *
urootl: doublereal *
nbpntv: integer *
vrootl: doublereal *
iordru: integer *
iordrv: integer *
contr1: doublereal *
contr2: doublereal *
contr3: doublereal *
contr4: doublereal *
sotbu1: doublereal *
sotbu2: doublereal *
ditbu1: doublereal *
ditbu2: doublereal *
sotbv1: doublereal *
sotbv2: doublereal *
ditbv1: doublereal *
ditbv2: doublereal *
sosotb: doublereal *
soditb: doublereal *
disotb: doublereal *
diditb: doublereal *
iercod: integer *

Returns
-------
int
") mma2cdi_;
		static int mma2cdi_(integer * ndimen, integer * nbpntu, doublereal * urootl, integer * nbpntv, doublereal * vrootl, integer * iordru, integer * iordrv, doublereal * contr1, doublereal * contr2, doublereal * contr3, doublereal * contr4, doublereal * sotbu1, doublereal * sotbu2, doublereal * ditbu1, doublereal * ditbu2, doublereal * sotbv1, doublereal * sotbv2, doublereal * ditbv1, doublereal * ditbv2, doublereal * sosotb, doublereal * soditb, doublereal * disotb, doublereal * diditb, integer * iercod);

		/****************** mma2ce1_ ******************/
		%feature("compactdefaultargs") mma2ce1_;
		%feature("autodoc", "No available documentation.

Parameters
----------
numdec: integer *
ndimen: integer *
nbsesp: integer *
ndimse: integer *
ndminu: integer *
ndminv: integer *
ndguli: integer *
ndgvli: integer *
ndjacu: integer *
ndjacv: integer *
iordru: integer *
iordrv: integer *
nbpntu: integer *
nbpntv: integer *
epsapr: doublereal *
sosotb: doublereal *
disotb: doublereal *
soditb: doublereal *
diditb: doublereal *
patjac: doublereal *
errmax: doublereal *
errmoy: doublereal *
ndegpu: integer *
ndegpv: integer *
itydec: integer *
iercod: integer *

Returns
-------
int
") mma2ce1_;
		static int mma2ce1_(integer * numdec, integer * ndimen, integer * nbsesp, integer * ndimse, integer * ndminu, integer * ndminv, integer * ndguli, integer * ndgvli, integer * ndjacu, integer * ndjacv, integer * iordru, integer * iordrv, integer * nbpntu, integer * nbpntv, doublereal * epsapr, doublereal * sosotb, doublereal * disotb, doublereal * soditb, doublereal * diditb, doublereal * patjac, doublereal * errmax, doublereal * errmoy, integer * ndegpu, integer * ndegpv, integer * itydec, integer * iercod);

		/****************** mma2ds1_ ******************/
		%feature("compactdefaultargs") mma2ds1_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
uintfn: doublereal *
vintfn: doublereal *
foncnp: AdvApp2Var_EvaluatorFunc2Var
nbpntu: integer *
nbpntv: integer *
urootb: doublereal *
vrootb: doublereal *
isofav: integer *
sosotb: doublereal *
disotb: doublereal *
soditb: doublereal *
diditb: doublereal *
fpntab: doublereal *
ttable: doublereal *
iercod: integer *

Returns
-------
int
") mma2ds1_;
		static int mma2ds1_(integer * ndimen, doublereal * uintfn, doublereal * vintfn, const AdvApp2Var_EvaluatorFunc2Var & foncnp, integer * nbpntu, integer * nbpntv, doublereal * urootb, doublereal * vrootb, integer * isofav, doublereal * sosotb, doublereal * disotb, doublereal * soditb, doublereal * diditb, doublereal * fpntab, doublereal * ttable, integer * iercod);

		/****************** mma2fnc_ ******************/
		%feature("compactdefaultargs") mma2fnc_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
nbsesp: integer *
ndimse: integer *
uvfonc: doublereal *
foncnp: AdvApp2Var_EvaluatorFunc2Var
tconst: doublereal *
isofav: integer *
nbroot: integer *
rootlg: doublereal *
iordre: integer *
ideriv: integer *
ndgjac: integer *
nbcrmx: integer *
ncflim: integer *
epsapr: doublereal *
ncoeff: integer *
courbe: doublereal *
nbcrbe: integer *
somtab: doublereal *
diftab: doublereal *
contr1: doublereal *
contr2: doublereal *
tabdec: doublereal *
errmax: doublereal *
errmoy: doublereal *
iercod: integer *

Returns
-------
int
") mma2fnc_;
		static int mma2fnc_(integer * ndimen, integer * nbsesp, integer * ndimse, doublereal * uvfonc, const AdvApp2Var_EvaluatorFunc2Var & foncnp, doublereal * tconst, integer * isofav, integer * nbroot, doublereal * rootlg, integer * iordre, integer * ideriv, integer * ndgjac, integer * nbcrmx, integer * ncflim, doublereal * epsapr, integer * ncoeff, doublereal * courbe, integer * nbcrbe, doublereal * somtab, doublereal * diftab, doublereal * contr1, doublereal * contr2, doublereal * tabdec, doublereal * errmax, doublereal * errmoy, integer * iercod);

		/****************** mma2fx6_ ******************/
		%feature("compactdefaultargs") mma2fx6_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ncfmxu: integer *
ncfmxv: integer *
ndimen: integer *
nbsesp: integer *
ndimse: integer *
nbupat: integer *
nbvpat: integer *
iordru: integer *
iordrv: integer *
epsapr: doublereal *
epsfro: doublereal *
patcan: doublereal *
errmax: doublereal *
ncoefu: integer *
ncoefv: integer *

Returns
-------
int
") mma2fx6_;
		static int mma2fx6_(integer * ncfmxu, integer * ncfmxv, integer * ndimen, integer * nbsesp, integer * ndimse, integer * nbupat, integer * nbvpat, integer * iordru, integer * iordrv, doublereal * epsapr, doublereal * epsfro, doublereal * patcan, doublereal * errmax, integer * ncoefu, integer * ncoefv);

		/****************** mma2jmx_ ******************/
		%feature("compactdefaultargs") mma2jmx_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndgjac: integer *
iordre: integer *
xjacmx: doublereal *

Returns
-------
int
") mma2jmx_;
		static int mma2jmx_(integer * ndgjac, integer * iordre, doublereal * xjacmx);

		/****************** mma2roo_ ******************/
		%feature("compactdefaultargs") mma2roo_;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbpntu: integer *
nbpntv: integer *
urootl: doublereal *
vrootl: doublereal *

Returns
-------
int
") mma2roo_;
		static int mma2roo_(integer * nbpntu, integer * nbpntv, doublereal * urootl, doublereal * vrootl);

		/****************** mmapptt_ ******************/
		%feature("compactdefaultargs") mmapptt_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: integer *
: integer *
: integer *
: doublereal *
: integer *

Returns
-------
int
") mmapptt_;
		static int mmapptt_(const integer * , const integer * , const integer * , doublereal * , integer * );

};


%extend AdvApp2Var_ApproxF2var {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class AdvApp2Var_Context *
***************************/
class AdvApp2Var_Context {
	public:
		/****************** AdvApp2Var_Context ******************/
		%feature("compactdefaultargs") AdvApp2Var_Context;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_Context;
		 AdvApp2Var_Context();

		/****************** AdvApp2Var_Context ******************/
		%feature("compactdefaultargs") AdvApp2Var_Context;
		%feature("autodoc", "No available documentation.

Parameters
----------
ifav: int
iu: int
iv: int
nlimu: int
nlimv: int
iprecis: int
nb1Dss: int
nb2Dss: int
nb3Dss: int
tol1D: TColStd_HArray1OfReal
tol2D: TColStd_HArray1OfReal
tol3D: TColStd_HArray1OfReal
tof1D: TColStd_HArray2OfReal
tof2D: TColStd_HArray2OfReal
tof3D: TColStd_HArray2OfReal

Returns
-------
None
") AdvApp2Var_Context;
		 AdvApp2Var_Context(const Standard_Integer ifav, const Standard_Integer iu, const Standard_Integer iv, const Standard_Integer nlimu, const Standard_Integer nlimv, const Standard_Integer iprecis, const Standard_Integer nb1Dss, const Standard_Integer nb2Dss, const Standard_Integer nb3Dss, const opencascade::handle<TColStd_HArray1OfReal> & tol1D, const opencascade::handle<TColStd_HArray1OfReal> & tol2D, const opencascade::handle<TColStd_HArray1OfReal> & tol3D, const opencascade::handle<TColStd_HArray2OfReal> & tof1D, const opencascade::handle<TColStd_HArray2OfReal> & tof2D, const opencascade::handle<TColStd_HArray2OfReal> & tof3D);

		/****************** CToler ******************/
		%feature("compactdefaultargs") CToler;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfReal>
") CToler;
		opencascade::handle<TColStd_HArray2OfReal> CToler();

		/****************** FToler ******************/
		%feature("compactdefaultargs") FToler;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfReal>
") FToler;
		opencascade::handle<TColStd_HArray2OfReal> FToler();

		/****************** FavorIso ******************/
		%feature("compactdefaultargs") FavorIso;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FavorIso;
		Standard_Integer FavorIso();

		/****************** IToler ******************/
		%feature("compactdefaultargs") IToler;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") IToler;
		opencascade::handle<TColStd_HArray1OfReal> IToler();

		/****************** TotalDimension ******************/
		%feature("compactdefaultargs") TotalDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") TotalDimension;
		Standard_Integer TotalDimension();

		/****************** TotalNumberSSP ******************/
		%feature("compactdefaultargs") TotalNumberSSP;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") TotalNumberSSP;
		Standard_Integer TotalNumberSSP();

		/****************** UGauss ******************/
		%feature("compactdefaultargs") UGauss;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") UGauss;
		opencascade::handle<TColStd_HArray1OfReal> UGauss();

		/****************** UJacDeg ******************/
		%feature("compactdefaultargs") UJacDeg;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UJacDeg;
		Standard_Integer UJacDeg();

		/****************** UJacMax ******************/
		%feature("compactdefaultargs") UJacMax;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") UJacMax;
		opencascade::handle<TColStd_HArray1OfReal> UJacMax();

		/****************** ULimit ******************/
		%feature("compactdefaultargs") ULimit;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ULimit;
		Standard_Integer ULimit();

		/****************** UOrder ******************/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UOrder;
		Standard_Integer UOrder();

		/****************** URoots ******************/
		%feature("compactdefaultargs") URoots;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") URoots;
		opencascade::handle<TColStd_HArray1OfReal> URoots();

		/****************** VGauss ******************/
		%feature("compactdefaultargs") VGauss;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") VGauss;
		opencascade::handle<TColStd_HArray1OfReal> VGauss();

		/****************** VJacDeg ******************/
		%feature("compactdefaultargs") VJacDeg;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VJacDeg;
		Standard_Integer VJacDeg();

		/****************** VJacMax ******************/
		%feature("compactdefaultargs") VJacMax;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") VJacMax;
		opencascade::handle<TColStd_HArray1OfReal> VJacMax();

		/****************** VLimit ******************/
		%feature("compactdefaultargs") VLimit;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VLimit;
		Standard_Integer VLimit();

		/****************** VOrder ******************/
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VOrder;
		Standard_Integer VOrder();

		/****************** VRoots ******************/
		%feature("compactdefaultargs") VRoots;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") VRoots;
		opencascade::handle<TColStd_HArray1OfReal> VRoots();

};


%extend AdvApp2Var_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class AdvApp2Var_Criterion *
*****************************/
%nodefaultctor AdvApp2Var_Criterion;
class AdvApp2Var_Criterion {
	public:
		/****************** IsSatisfied ******************/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: AdvApp2Var_Patch

Returns
-------
bool
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied(const AdvApp2Var_Patch & P);

		/****************** MaxValue ******************/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaxValue;
		Standard_Real MaxValue();

		/****************** Repartition ******************/
		%feature("compactdefaultargs") Repartition;
		%feature("autodoc", "No available documentation.

Returns
-------
AdvApp2Var_CriterionRepartition
") Repartition;
		AdvApp2Var_CriterionRepartition Repartition();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
AdvApp2Var_CriterionType
") Type;
		AdvApp2Var_CriterionType Type();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: AdvApp2Var_Patch
C: AdvApp2Var_Context

Returns
-------
None
") Value;
		virtual void Value(AdvApp2Var_Patch & P, const AdvApp2Var_Context & C);

};


%extend AdvApp2Var_Criterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class AdvApp2Var_Data *
************************/
class AdvApp2Var_Data {
	public:
		/****************** Getmaovpar ******************/
		%feature("compactdefaultargs") Getmaovpar;
		%feature("autodoc", "No available documentation.

Returns
-------
maovpar_1_
") Getmaovpar;
		static maovpar_1_ & Getmaovpar();

		/****************** Getmaovpch ******************/
		%feature("compactdefaultargs") Getmaovpch;
		%feature("autodoc", "No available documentation.

Returns
-------
maovpch_1_
") Getmaovpch;
		static maovpch_1_ & Getmaovpch();

		/****************** Getmdnombr ******************/
		%feature("compactdefaultargs") Getmdnombr;
		%feature("autodoc", "No available documentation.

Returns
-------
mdnombr_1_
") Getmdnombr;
		static mdnombr_1_ & Getmdnombr();

		/****************** Getminombr ******************/
		%feature("compactdefaultargs") Getminombr;
		%feature("autodoc", "No available documentation.

Returns
-------
minombr_1_
") Getminombr;
		static minombr_1_ & Getminombr();

		/****************** Getmlgdrtl ******************/
		%feature("compactdefaultargs") Getmlgdrtl;
		%feature("autodoc", "No available documentation.

Returns
-------
mlgdrtl_1_
") Getmlgdrtl;
		static mlgdrtl_1_ & Getmlgdrtl();

		/****************** Getmmapgs0 ******************/
		%feature("compactdefaultargs") Getmmapgs0;
		%feature("autodoc", "No available documentation.

Returns
-------
mmapgs0_1_
") Getmmapgs0;
		static mmapgs0_1_ & Getmmapgs0();

		/****************** Getmmapgs1 ******************/
		%feature("compactdefaultargs") Getmmapgs1;
		%feature("autodoc", "No available documentation.

Returns
-------
mmapgs1_1_
") Getmmapgs1;
		static mmapgs1_1_ & Getmmapgs1();

		/****************** Getmmapgs2 ******************/
		%feature("compactdefaultargs") Getmmapgs2;
		%feature("autodoc", "No available documentation.

Returns
-------
mmapgs2_1_
") Getmmapgs2;
		static mmapgs2_1_ & Getmmapgs2();

		/****************** Getmmapgss ******************/
		%feature("compactdefaultargs") Getmmapgss;
		%feature("autodoc", "No available documentation.

Returns
-------
mmapgss_1_
") Getmmapgss;
		static mmapgss_1_ & Getmmapgss();

		/****************** Getmmcmcnp ******************/
		%feature("compactdefaultargs") Getmmcmcnp;
		%feature("autodoc", "No available documentation.

Returns
-------
mmcmcnp_1_
") Getmmcmcnp;
		static mmcmcnp_1_ & Getmmcmcnp();

		/****************** Getmmjcobi ******************/
		%feature("compactdefaultargs") Getmmjcobi;
		%feature("autodoc", "No available documentation.

Returns
-------
mmjcobi_1_
") Getmmjcobi;
		static mmjcobi_1_ & Getmmjcobi();

};


%extend AdvApp2Var_Data {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class AdvApp2Var_EvaluatorFunc2Var *
*************************************/
/*****************************
* class AdvApp2Var_Framework *
*****************************/
class AdvApp2Var_Framework {
	public:
		/****************** AdvApp2Var_Framework ******************/
		%feature("compactdefaultargs") AdvApp2Var_Framework;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_Framework;
		 AdvApp2Var_Framework();

		/****************** AdvApp2Var_Framework ******************/
		%feature("compactdefaultargs") AdvApp2Var_Framework;
		%feature("autodoc", "No available documentation.

Parameters
----------
Frame: AdvApp2Var_SequenceOfNode
UFrontier: AdvApp2Var_SequenceOfStrip
VFrontier: AdvApp2Var_SequenceOfStrip

Returns
-------
None
") AdvApp2Var_Framework;
		 AdvApp2Var_Framework(const AdvApp2Var_SequenceOfNode & Frame, const AdvApp2Var_SequenceOfStrip & UFrontier, const AdvApp2Var_SequenceOfStrip & VFrontier);

		/****************** ChangeIso ******************/
		%feature("compactdefaultargs") ChangeIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexIso: int
IndexStrip: int
anIso: AdvApp2Var_Iso

Returns
-------
None
") ChangeIso;
		void ChangeIso(const Standard_Integer IndexIso, const Standard_Integer IndexStrip, const AdvApp2Var_Iso & anIso);

		/****************** ChangeNode ******************/
		%feature("compactdefaultargs") ChangeNode;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexNode: int

Returns
-------
AdvApp2Var_Node
") ChangeNode;
		AdvApp2Var_Node & ChangeNode(const Standard_Integer IndexNode);

		/****************** FirstNode ******************/
		%feature("compactdefaultargs") FirstNode;
		%feature("autodoc", "No available documentation.

Parameters
----------
Type: GeomAbs_IsoType
IndexIso: int
IndexStrip: int

Returns
-------
int
") FirstNode;
		Standard_Integer FirstNode(const GeomAbs_IsoType Type, const Standard_Integer IndexIso, const Standard_Integer IndexStrip);

		/****************** FirstNotApprox ******************/
		%feature("compactdefaultargs") FirstNotApprox;
		%feature("autodoc", "Search the index of the first iso not approximated, if all isos are approximated standard_false is returned.

Parameters
----------
anIso: AdvApp2Var_Iso

Returns
-------
IndexIso: int
IndexStrip: int
") FirstNotApprox;
		Standard_Boolean FirstNotApprox(Standard_Integer &OutValue, Standard_Integer &OutValue, AdvApp2Var_Iso & anIso);

		/****************** IsoU ******************/
		%feature("compactdefaultargs") IsoU;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V0: float
V1: float

Returns
-------
AdvApp2Var_Iso
") IsoU;
		const AdvApp2Var_Iso & IsoU(const Standard_Real U, const Standard_Real V0, const Standard_Real V1);

		/****************** IsoV ******************/
		%feature("compactdefaultargs") IsoV;
		%feature("autodoc", "No available documentation.

Parameters
----------
U0: float
U1: float
V: float

Returns
-------
AdvApp2Var_Iso
") IsoV;
		const AdvApp2Var_Iso & IsoV(const Standard_Real U0, const Standard_Real U1, const Standard_Real V);

		/****************** LastNode ******************/
		%feature("compactdefaultargs") LastNode;
		%feature("autodoc", "No available documentation.

Parameters
----------
Type: GeomAbs_IsoType
IndexIso: int
IndexStrip: int

Returns
-------
int
") LastNode;
		Standard_Integer LastNode(const GeomAbs_IsoType Type, const Standard_Integer IndexIso, const Standard_Integer IndexStrip);

		/****************** Node ******************/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexNode: int

Returns
-------
AdvApp2Var_Node
") Node;
		const AdvApp2Var_Node & Node(const Standard_Integer IndexNode);

		/****************** Node ******************/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float

Returns
-------
AdvApp2Var_Node
") Node;
		const AdvApp2Var_Node & Node(const Standard_Real U, const Standard_Real V);

		/****************** UEquation ******************/
		%feature("compactdefaultargs") UEquation;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexIso: int
IndexStrip: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") UEquation;
		const opencascade::handle<TColStd_HArray1OfReal> & UEquation(const Standard_Integer IndexIso, const Standard_Integer IndexStrip);

		/****************** UpdateInU ******************/
		%feature("compactdefaultargs") UpdateInU;
		%feature("autodoc", "No available documentation.

Parameters
----------
CuttingValue: float

Returns
-------
None
") UpdateInU;
		void UpdateInU(const Standard_Real CuttingValue);

		/****************** UpdateInV ******************/
		%feature("compactdefaultargs") UpdateInV;
		%feature("autodoc", "No available documentation.

Parameters
----------
CuttingValue: float

Returns
-------
None
") UpdateInV;
		void UpdateInV(const Standard_Real CuttingValue);

		/****************** VEquation ******************/
		%feature("compactdefaultargs") VEquation;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexIso: int
IndexStrip: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") VEquation;
		const opencascade::handle<TColStd_HArray1OfReal> & VEquation(const Standard_Integer IndexIso, const Standard_Integer IndexStrip);

};


%extend AdvApp2Var_Framework {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class AdvApp2Var_Iso *
***********************/
/****************************
* class AdvApp2Var_MathBase *
****************************/
class AdvApp2Var_MathBase {
	public:
		/****************** mdsptpt_ ******************/
		%feature("compactdefaultargs") mdsptpt_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
point1: doublereal *
point2: doublereal *
distan: doublereal *

Returns
-------
int
") mdsptpt_;
		static int mdsptpt_(integer * ndimen, doublereal * point1, doublereal * point2, doublereal * distan);

		/****************** mmapcmp_ ******************/
		%feature("compactdefaultargs") mmapcmp_;
		%feature("autodoc", "///.

Parameters
----------
: integer *
: integer *
: integer *
: double *
: double *

Returns
-------
int
") mmapcmp_;
		static int mmapcmp_(integer * , integer * , integer * , double * , double * );

		/****************** mmaperx_ ******************/
		%feature("compactdefaultargs") mmaperx_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ncofmx: integer *
ndimen: integer *
ncoeff: integer *
iordre: integer *
crvjac: doublereal *
ncfnew: integer *
ycvmax: doublereal *
errmax: doublereal *
iercod: integer *

Returns
-------
int
") mmaperx_;
		static int mmaperx_(integer * ncofmx, integer * ndimen, integer * ncoeff, integer * iordre, doublereal * crvjac, integer * ncfnew, doublereal * ycvmax, doublereal * errmax, integer * iercod);

		/****************** mmarcin_ ******************/
		%feature("compactdefaultargs") mmarcin_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimax: integer *
ndim: integer *
ncoeff: integer *
crvold: doublereal *
u0: doublereal *
u1: doublereal *
crvnew: doublereal *
iercod: integer *

Returns
-------
int
") mmarcin_;
		static int mmarcin_(integer * ndimax, integer * ndim, integer * ncoeff, doublereal * crvold, doublereal * u0, doublereal * u1, doublereal * crvnew, integer * iercod);

		/****************** mmbulld_ ******************/
		%feature("compactdefaultargs") mmbulld_;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbcoln: integer *
nblign: integer *
dtabtr: doublereal *
numcle: integer *

Returns
-------
int
") mmbulld_;
		static int mmbulld_(integer * nbcoln, integer * nblign, doublereal * dtabtr, integer * numcle);

		/****************** mmcdriv_ ******************/
		%feature("compactdefaultargs") mmcdriv_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
ncoeff: integer *
courbe: doublereal *
ideriv: integer *
ncofdv: integer *
crvdrv: doublereal *

Returns
-------
int
") mmcdriv_;
		static int mmcdriv_(integer * ndimen, integer * ncoeff, doublereal * courbe, integer * ideriv, integer * ncofdv, doublereal * crvdrv);

		/****************** mmcglc1_ ******************/
		%feature("compactdefaultargs") mmcglc1_;
		%feature("autodoc", "///.

Parameters
----------
ndimax: integer *
ndimen: integer *
ncoeff: integer *
courbe: doublereal *
tdebut: doublereal *
tfinal: doublereal *
epsiln: doublereal *
xlongc: doublereal *
erreur: doublereal *
iercod: integer *

Returns
-------
int
") mmcglc1_;
		static int mmcglc1_(integer * ndimax, integer * ndimen, integer * ncoeff, doublereal * courbe, doublereal * tdebut, doublereal * tfinal, doublereal * epsiln, doublereal * xlongc, doublereal * erreur, integer * iercod);

		/****************** mmcvctx_ ******************/
		%feature("compactdefaultargs") mmcvctx_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
ncofmx: integer *
nderiv: integer *
ctrtes: doublereal *
crvres: doublereal *
tabaux: doublereal *
xmatri: doublereal *
iercod: integer *

Returns
-------
int
") mmcvctx_;
		static int mmcvctx_(integer * ndimen, integer * ncofmx, integer * nderiv, doublereal * ctrtes, doublereal * crvres, doublereal * tabaux, doublereal * xmatri, integer * iercod);

		/****************** mmcvinv_ ******************/
		%feature("compactdefaultargs") mmcvinv_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimax: integer *
ncoef: integer *
ndim: integer *
curveo: doublereal *
curve: doublereal *

Returns
-------
int
") mmcvinv_;
		static int mmcvinv_(integer * ndimax, integer * ncoef, integer * ndim, doublereal * curveo, doublereal * curve);

		/****************** mmdrc11_ ******************/
		%feature("compactdefaultargs") mmdrc11_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: integer *
: integer *
: integer *
: doublereal *
: doublereal *
: doublereal *

Returns
-------
int
") mmdrc11_;
		static int mmdrc11_(integer * , integer * , integer * , doublereal * , doublereal * , doublereal * );

		/****************** mmdrvck_ ******************/
		%feature("compactdefaultargs") mmdrvck_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ncoeff: integer *
ndimen: integer *
courbe: doublereal *
ideriv: integer *
tparam: doublereal *
pntcrb: doublereal *

Returns
-------
int
") mmdrvck_;
		static int mmdrvck_(integer * ncoeff, integer * ndimen, doublereal * courbe, integer * ideriv, doublereal * tparam, doublereal * pntcrb);

		/****************** mmeps1_ ******************/
		%feature("compactdefaultargs") mmeps1_;
		%feature("autodoc", "No available documentation.

Parameters
----------
epsilo: doublereal *

Returns
-------
int
") mmeps1_;
		static int mmeps1_(doublereal * epsilo);

		/****************** mmfmca8_ ******************/
		%feature("compactdefaultargs") mmfmca8_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
ncoefu: integer *
ncoefv: integer *
ndimax: integer *
ncfumx: integer *
ncfvmx: integer *
tabini: doublereal *
tabres: doublereal *

Returns
-------
int
") mmfmca8_;
		static int mmfmca8_(const integer * ndimen, const integer * ncoefu, const integer * ncoefv, const integer * ndimax, const integer * ncfumx, const integer * ncfvmx, doublereal * tabini, doublereal * tabres);

		/****************** mmfmca9_ ******************/
		%feature("compactdefaultargs") mmfmca9_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: integer *
: integer *
: integer *
: integer *
: integer *
: integer *
: doublereal *
: doublereal *

Returns
-------
int
") mmfmca9_;
		static int mmfmca9_(integer * , integer * , integer * , integer * , integer * , integer * , doublereal * , doublereal * );

		/****************** mmfmcar_ ******************/
		%feature("compactdefaultargs") mmfmcar_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
ncofmx: integer *
ncoefu: integer *
ncoefv: integer *
patold: doublereal *
upara1: doublereal *
upara2: doublereal *
vpara1: doublereal *
vpara2: doublereal *
patnew: doublereal *
iercod: integer *

Returns
-------
int
") mmfmcar_;
		static int mmfmcar_(integer * ndimen, integer * ncofmx, integer * ncoefu, integer * ncoefv, doublereal * patold, doublereal * upara1, doublereal * upara2, doublereal * vpara1, doublereal * vpara2, doublereal * patnew, integer * iercod);

		/****************** mmfmcb5_ ******************/
		%feature("compactdefaultargs") mmfmcb5_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: integer *
: integer *
: integer *
: doublereal *
: integer *
: integer *
: integer *
: doublereal *
: integer *

Returns
-------
int
") mmfmcb5_;
		static int mmfmcb5_(integer * , integer * , integer * , doublereal * , integer * , integer * , integer * , doublereal * , integer * );

		/****************** mmfmtb1_ ******************/
		%feature("compactdefaultargs") mmfmtb1_;
		%feature("autodoc", "No available documentation.

Parameters
----------
maxsz1: integer *
table1: doublereal *
isize1: integer *
jsize1: integer *
maxsz2: integer *
table2: doublereal *
isize2: integer *
jsize2: integer *
iercod: integer *

Returns
-------
int
") mmfmtb1_;
		static int mmfmtb1_(integer * maxsz1, doublereal * table1, integer * isize1, integer * jsize1, integer * maxsz2, doublereal * table2, integer * isize2, integer * jsize2, integer * iercod);

		/****************** mmhjcan_ ******************/
		%feature("compactdefaultargs") mmhjcan_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
ncourb: integer *
ncftab: integer *
orcont: integer *
ncflim: integer *
tcbold: doublereal *
tdecop: doublereal *
tcbnew: doublereal *
iercod: integer *

Returns
-------
int
") mmhjcan_;
		static int mmhjcan_(integer * ndimen, integer * ncourb, integer * ncftab, integer * orcont, integer * ncflim, doublereal * tcbold, doublereal * tdecop, doublereal * tcbnew, integer * iercod);

		/****************** mminltt_ ******************/
		%feature("compactdefaultargs") mminltt_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ncolmx: integer *
nlgnmx: integer *
tabtri: doublereal *
nbrcol: integer *
nbrlgn: integer *
ajoute: doublereal *
epseg: doublereal *
iercod: integer *

Returns
-------
int
") mminltt_;
		static int mminltt_(integer * ncolmx, integer * nlgnmx, doublereal * tabtri, integer * nbrcol, integer * nbrlgn, doublereal * ajoute, doublereal * epseg, integer * iercod);

		/****************** mmjacan_ ******************/
		%feature("compactdefaultargs") mmjacan_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ideriv: integer *
ndeg: integer *
poljac: doublereal *
polcan: doublereal *

Returns
-------
int
") mmjacan_;
		static int mmjacan_(const integer * ideriv, integer * ndeg, doublereal * poljac, doublereal * polcan);

		/****************** mmjaccv_ ******************/
		%feature("compactdefaultargs") mmjaccv_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ncoef: integer *
ndim: integer *
ider: integer *
crvlgd: doublereal *
polaux: doublereal *
crvcan: doublereal *

Returns
-------
int
") mmjaccv_;
		static int mmjaccv_(const integer * ncoef, const integer * ndim, const integer * ider, const doublereal * crvlgd, doublereal * polaux, doublereal * crvcan);

		/****************** mmmpocur_ ******************/
		%feature("compactdefaultargs") mmmpocur_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ncofmx: integer *
ndim: integer *
ndeg: integer *
courbe: doublereal *
tparam: doublereal *
tabval: doublereal *

Returns
-------
int
") mmmpocur_;
		static int mmmpocur_(integer * ncofmx, integer * ndim, integer * ndeg, doublereal * courbe, doublereal * tparam, doublereal * tabval);

		/****************** mmmrslwd_ ******************/
		%feature("compactdefaultargs") mmmrslwd_;
		%feature("autodoc", "No available documentation.

Parameters
----------
normax: integer *
nordre: integer *
ndim: integer *
amat: doublereal *
bmat: doublereal *
epspiv: doublereal *
aaux: doublereal *
xmat: doublereal *
iercod: integer *

Returns
-------
int
") mmmrslwd_;
		static int mmmrslwd_(integer * normax, integer * nordre, integer * ndim, doublereal * amat, doublereal * bmat, doublereal * epspiv, doublereal * aaux, doublereal * xmat, integer * iercod);

		/****************** mmpobas_ ******************/
		%feature("compactdefaultargs") mmpobas_;
		%feature("autodoc", "No available documentation.

Parameters
----------
tparam: doublereal *
iordre: integer *
ncoeff: integer *
nderiv: integer *
valbas: doublereal *
iercod: integer *

Returns
-------
int
") mmpobas_;
		static int mmpobas_(doublereal * tparam, integer * iordre, integer * ncoeff, integer * nderiv, doublereal * valbas, integer * iercod);

		/****************** mmpocrb_ ******************/
		%feature("compactdefaultargs") mmpocrb_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimax: integer *
ncoeff: integer *
courbe: doublereal *
ndim: integer *
tparam: doublereal *
pntcrb: doublereal *

Returns
-------
int
") mmpocrb_;
		static int mmpocrb_(integer * ndimax, integer * ncoeff, doublereal * courbe, integer * ndim, doublereal * tparam, doublereal * pntcrb);

		/****************** mmposui_ ******************/
		%feature("compactdefaultargs") mmposui_;
		%feature("autodoc", "No available documentation.

Parameters
----------
dimmat: integer *
nistoc: integer *
aposit: integer *
posuiv: integer *
iercod: integer *

Returns
-------
int
") mmposui_;
		static int mmposui_(integer * dimmat, integer * nistoc, integer * aposit, integer * posuiv, integer * iercod);

		/****************** mmresol_ ******************/
		%feature("compactdefaultargs") mmresol_;
		%feature("autodoc", "No available documentation.

Parameters
----------
hdimen: integer *
gdimen: integer *
hnstoc: integer *
gnstoc: integer *
mnstoc: integer *
matsyh: doublereal *
matsyg: doublereal *
vecsyh: doublereal *
vecsyg: doublereal *
hposit: integer *
hposui: integer *
gposit: integer *
mmposui: integer *
mposit: integer *
vecsol: doublereal *
iercod: integer *

Returns
-------
int
") mmresol_;
		static int mmresol_(integer * hdimen, integer * gdimen, integer * hnstoc, integer * gnstoc, integer * mnstoc, doublereal * matsyh, doublereal * matsyg, doublereal * vecsyh, doublereal * vecsyg, integer * hposit, integer * hposui, integer * gposit, integer * mmposui, integer * mposit, doublereal * vecsol, integer * iercod);

		/****************** mmrtptt_ ******************/
		%feature("compactdefaultargs") mmrtptt_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndglgd: integer *
rtlegd: doublereal *

Returns
-------
int
") mmrtptt_;
		static int mmrtptt_(integer * ndglgd, doublereal * rtlegd);

		/****************** mmsrre2_ ******************/
		%feature("compactdefaultargs") mmsrre2_;
		%feature("autodoc", "No available documentation.

Parameters
----------
tparam: doublereal *
nbrval: integer *
tablev: doublereal *
epsil: doublereal *
numint: integer *
itypen: integer *
iercod: integer *

Returns
-------
int
") mmsrre2_;
		static int mmsrre2_(doublereal * tparam, integer * nbrval, doublereal * tablev, doublereal * epsil, integer * numint, integer * itypen, integer * iercod);

		/****************** mmtrpjj_ ******************/
		%feature("compactdefaultargs") mmtrpjj_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ncofmx: integer *
ndimen: integer *
ncoeff: integer *
epsi3d: doublereal *
iordre: integer *
crvlgd: doublereal *
ycvmax: doublereal *
errmax: doublereal *
ncfnew: integer *

Returns
-------
int
") mmtrpjj_;
		static int mmtrpjj_(integer * ncofmx, integer * ndimen, integer * ncoeff, doublereal * epsi3d, integer * iordre, doublereal * crvlgd, doublereal * ycvmax, doublereal * errmax, integer * ncfnew);

		/****************** mmunivt_ ******************/
		%feature("compactdefaultargs") mmunivt_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
vector: doublereal *
vecnrm: doublereal *
epsiln: doublereal *
iercod: integer *

Returns
-------
int
") mmunivt_;
		static int mmunivt_(integer * ndimen, doublereal * vector, doublereal * vecnrm, doublereal * epsiln, integer * iercod);

		/****************** mmveps3_ ******************/
		%feature("compactdefaultargs") mmveps3_;
		%feature("autodoc", "No available documentation.

Parameters
----------
eps03: doublereal *

Returns
-------
int
") mmveps3_;
		static int mmveps3_(doublereal * eps03);

		/****************** mmvncol_ ******************/
		%feature("compactdefaultargs") mmvncol_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
vecin: doublereal *
vecout: doublereal *
iercod: integer *

Returns
-------
int
") mmvncol_;
		static int mmvncol_(integer * ndimen, doublereal * vecin, doublereal * vecout, integer * iercod);

		/****************** mmwprcs_ ******************/
		%feature("compactdefaultargs") mmwprcs_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: doublereal *
: doublereal *
: doublereal *
: doublereal *
: integer *
: integer *

Returns
-------
None
") mmwprcs_;
		static void mmwprcs_(doublereal * , doublereal * , doublereal * , doublereal * , integer * , integer * );

		/****************** msc_ ******************/
		%feature("compactdefaultargs") msc_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
vecte1: doublereal *
vecte2: doublereal *

Returns
-------
doublereal
") msc_;
		static doublereal msc_(integer * ndimen, doublereal * vecte1, doublereal * vecte2);

		/****************** mvsheld_ ******************/
		%feature("compactdefaultargs") mvsheld_;
		%feature("autodoc", "No available documentation.

Parameters
----------
n: integer *
is: integer *
dtab: doublereal *
icle: integer *

Returns
-------
int
") mvsheld_;
		static int mvsheld_(integer * n, integer * is, doublereal * dtab, integer * icle);

		/****************** mzsnorm_ ******************/
		%feature("compactdefaultargs") mzsnorm_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ndimen: integer *
vecteu: doublereal *

Returns
-------
doublereal
") mzsnorm_;
		static doublereal mzsnorm_(integer * ndimen, doublereal * vecteu);

		/****************** pow__di ******************/
		%feature("compactdefaultargs") pow__di;
		%feature("autodoc", "No available documentation.

Parameters
----------
x: doublereal *
n: integer *

Returns
-------
doublereal
") pow__di;
		static doublereal pow__di(doublereal * x, integer * n);

};


%extend AdvApp2Var_MathBase {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def mmgaus1_(self):
		pass
	}
};

/***************************
* class AdvApp2Var_Network *
***************************/
class AdvApp2Var_Network {
	public:
		/****************** AdvApp2Var_Network ******************/
		%feature("compactdefaultargs") AdvApp2Var_Network;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_Network;
		 AdvApp2Var_Network();

		/****************** AdvApp2Var_Network ******************/
		%feature("compactdefaultargs") AdvApp2Var_Network;
		%feature("autodoc", "No available documentation.

Parameters
----------
Net: AdvApp2Var_SequenceOfPatch
TheU: TColStd_SequenceOfReal
TheV: TColStd_SequenceOfReal

Returns
-------
None
") AdvApp2Var_Network;
		 AdvApp2Var_Network(const AdvApp2Var_SequenceOfPatch & Net, const TColStd_SequenceOfReal & TheU, const TColStd_SequenceOfReal & TheV);

		/****************** ChangePatch ******************/
		%feature("compactdefaultargs") ChangePatch;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
AdvApp2Var_Patch
") ChangePatch;
		AdvApp2Var_Patch & ChangePatch(const Standard_Integer Index);

		/****************** FirstNotApprox ******************/
		%feature("compactdefaultargs") FirstNotApprox;
		%feature("autodoc", "Search the index of the first patch not approximated, if all patches are approximated standard_false is returned.

Parameters
----------

Returns
-------
Index: int
") FirstNotApprox;
		Standard_Boolean FirstNotApprox(Standard_Integer &OutValue);

		/****************** NbPatch ******************/
		%feature("compactdefaultargs") NbPatch;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPatch;
		Standard_Integer NbPatch();

		/****************** NbPatchInU ******************/
		%feature("compactdefaultargs") NbPatchInU;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPatchInU;
		Standard_Integer NbPatchInU();

		/****************** NbPatchInV ******************/
		%feature("compactdefaultargs") NbPatchInV;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPatchInV;
		Standard_Integer NbPatchInV();

		/****************** Patch ******************/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "No available documentation.

Parameters
----------
UIndex: int
VIndex: int

Returns
-------
AdvApp2Var_Patch
") Patch;
		const AdvApp2Var_Patch & Patch(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****************** SameDegree ******************/
		%feature("compactdefaultargs") SameDegree;
		%feature("autodoc", "No available documentation.

Parameters
----------
iu: int
iv: int

Returns
-------
ncfu: int
ncfv: int
") SameDegree;
		void SameDegree(const Standard_Integer iu, const Standard_Integer iv, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** UParameter ******************/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") UParameter;
		Standard_Real UParameter(const Standard_Integer Index);

		/****************** UpdateInU ******************/
		%feature("compactdefaultargs") UpdateInU;
		%feature("autodoc", "No available documentation.

Parameters
----------
CuttingValue: float

Returns
-------
None
") UpdateInU;
		void UpdateInU(const Standard_Real CuttingValue);

		/****************** UpdateInV ******************/
		%feature("compactdefaultargs") UpdateInV;
		%feature("autodoc", "No available documentation.

Parameters
----------
CuttingValue: float

Returns
-------
None
") UpdateInV;
		void UpdateInV(const Standard_Real CuttingValue);

		/****************** VParameter ******************/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") VParameter;
		Standard_Real VParameter(const Standard_Integer Index);

};


%extend AdvApp2Var_Network {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class AdvApp2Var_Node *
************************/
class AdvApp2Var_Node {
	public:
		/****************** AdvApp2Var_Node ******************/
		%feature("compactdefaultargs") AdvApp2Var_Node;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_Node;
		 AdvApp2Var_Node();

		/****************** AdvApp2Var_Node ******************/
		%feature("compactdefaultargs") AdvApp2Var_Node;
		%feature("autodoc", "No available documentation.

Parameters
----------
iu: int
iv: int

Returns
-------
None
") AdvApp2Var_Node;
		 AdvApp2Var_Node(const Standard_Integer iu, const Standard_Integer iv);

		/****************** AdvApp2Var_Node ******************/
		%feature("compactdefaultargs") AdvApp2Var_Node;
		%feature("autodoc", "No available documentation.

Parameters
----------
UV: gp_XY
iu: int
iv: int

Returns
-------
None
") AdvApp2Var_Node;
		 AdvApp2Var_Node(const gp_XY & UV, const Standard_Integer iu, const Standard_Integer iv);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XY
") Coord;
		gp_XY Coord();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Parameters
----------
iu: int
iv: int

Returns
-------
float
") Error;
		Standard_Real Error(const Standard_Integer iu, const Standard_Integer iv);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
iu: int
iv: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer iu, const Standard_Integer iv);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "No available documentation.

Parameters
----------
x1: float
x2: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real x1, const Standard_Real x2);

		/****************** SetError ******************/
		%feature("compactdefaultargs") SetError;
		%feature("autodoc", "No available documentation.

Parameters
----------
iu: int
iv: int
error: float

Returns
-------
None
") SetError;
		void SetError(const Standard_Integer iu, const Standard_Integer iv, const Standard_Real error);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
iu: int
iv: int
Cte: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const Standard_Integer iu, const Standard_Integer iv, const gp_Pnt & Cte);

		/****************** UOrder ******************/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UOrder;
		Standard_Integer UOrder();

		/****************** VOrder ******************/
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VOrder;
		Standard_Integer VOrder();

};


%extend AdvApp2Var_Node {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class AdvApp2Var_Patch *
*************************/
class AdvApp2Var_Patch {
	public:
		/****************** AdvApp2Var_Patch ******************/
		%feature("compactdefaultargs") AdvApp2Var_Patch;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_Patch;
		 AdvApp2Var_Patch();

		/****************** AdvApp2Var_Patch ******************/
		%feature("compactdefaultargs") AdvApp2Var_Patch;
		%feature("autodoc", "No available documentation.

Parameters
----------
U0: float
U1: float
V0: float
V1: float
iu: int
iv: int

Returns
-------
None
") AdvApp2Var_Patch;
		 AdvApp2Var_Patch(const Standard_Real U0, const Standard_Real U1, const Standard_Real V0, const Standard_Real V1, const Standard_Integer iu, const Standard_Integer iv);

		/****************** AddConstraints ******************/
		%feature("compactdefaultargs") AddConstraints;
		%feature("autodoc", "No available documentation.

Parameters
----------
Conditions: AdvApp2Var_Context
Constraints: AdvApp2Var_Framework

Returns
-------
None
") AddConstraints;
		void AddConstraints(const AdvApp2Var_Context & Conditions, const AdvApp2Var_Framework & Constraints);

		/****************** AddErrors ******************/
		%feature("compactdefaultargs") AddErrors;
		%feature("autodoc", "No available documentation.

Parameters
----------
Constraints: AdvApp2Var_Framework

Returns
-------
None
") AddErrors;
		void AddErrors(const AdvApp2Var_Framework & Constraints);

		/****************** AverageErrors ******************/
		%feature("compactdefaultargs") AverageErrors;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") AverageErrors;
		opencascade::handle<TColStd_HArray1OfReal> AverageErrors();

		/****************** ChangeDomain ******************/
		%feature("compactdefaultargs") ChangeDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
a: float
b: float
c: float
d: float

Returns
-------
None
") ChangeDomain;
		void ChangeDomain(const Standard_Real a, const Standard_Real b, const Standard_Real c, const Standard_Real d);

		/****************** ChangeNbCoeff ******************/
		%feature("compactdefaultargs") ChangeNbCoeff;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbCoeffU: int
NbCoeffV: int

Returns
-------
None
") ChangeNbCoeff;
		void ChangeNbCoeff(const Standard_Integer NbCoeffU, const Standard_Integer NbCoeffV);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "No available documentation.

Parameters
----------
SSPIndex: int
Conditions: AdvApp2Var_Context

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Coefficients;
		opencascade::handle<TColStd_HArray1OfReal> Coefficients(const Standard_Integer SSPIndex, const AdvApp2Var_Context & Conditions);

		/****************** CritValue ******************/
		%feature("compactdefaultargs") CritValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") CritValue;
		Standard_Real CritValue();

		/****************** CutSense ******************/
		%feature("compactdefaultargs") CutSense;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") CutSense;
		Standard_Integer CutSense();

		/****************** CutSense ******************/
		%feature("compactdefaultargs") CutSense;
		%feature("autodoc", "No available documentation.

Parameters
----------
Crit: AdvApp2Var_Criterion
NumDec: int

Returns
-------
int
") CutSense;
		Standard_Integer CutSense(const AdvApp2Var_Criterion & Crit, const Standard_Integer NumDec);

		/****************** Discretise ******************/
		%feature("compactdefaultargs") Discretise;
		%feature("autodoc", "No available documentation.

Parameters
----------
Conditions: AdvApp2Var_Context
Constraints: AdvApp2Var_Framework
func: AdvApp2Var_EvaluatorFunc2Var

Returns
-------
None
") Discretise;
		void Discretise(const AdvApp2Var_Context & Conditions, const AdvApp2Var_Framework & Constraints, const AdvApp2Var_EvaluatorFunc2Var & func);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsApproximated ******************/
		%feature("compactdefaultargs") IsApproximated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsApproximated;
		Standard_Boolean IsApproximated();

		/****************** IsDiscretised ******************/
		%feature("compactdefaultargs") IsDiscretised;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDiscretised;
		Standard_Boolean IsDiscretised();

		/****************** IsoErrors ******************/
		%feature("compactdefaultargs") IsoErrors;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfReal>
") IsoErrors;
		opencascade::handle<TColStd_HArray2OfReal> IsoErrors();

		/****************** MakeApprox ******************/
		%feature("compactdefaultargs") MakeApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
Conditions: AdvApp2Var_Context
Constraints: AdvApp2Var_Framework
NumDec: int

Returns
-------
None
") MakeApprox;
		void MakeApprox(const AdvApp2Var_Context & Conditions, const AdvApp2Var_Framework & Constraints, const Standard_Integer NumDec);

		/****************** MaxErrors ******************/
		%feature("compactdefaultargs") MaxErrors;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") MaxErrors;
		opencascade::handle<TColStd_HArray1OfReal> MaxErrors();

		/****************** NbCoeffInU ******************/
		%feature("compactdefaultargs") NbCoeffInU;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCoeffInU;
		Standard_Integer NbCoeffInU();

		/****************** NbCoeffInV ******************/
		%feature("compactdefaultargs") NbCoeffInV;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCoeffInV;
		Standard_Integer NbCoeffInV();

		/****************** OverwriteApprox ******************/
		%feature("compactdefaultargs") OverwriteApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") OverwriteApprox;
		void OverwriteApprox();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "No available documentation.

Parameters
----------
SSPIndex: int
Conditions: AdvApp2Var_Context

Returns
-------
opencascade::handle<TColgp_HArray2OfPnt>
") Poles;
		opencascade::handle<TColgp_HArray2OfPnt> Poles(const Standard_Integer SSPIndex, const AdvApp2Var_Context & Conditions);

		/****************** ResetApprox ******************/
		%feature("compactdefaultargs") ResetApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetApprox;
		void ResetApprox();

		/****************** SetCritValue ******************/
		%feature("compactdefaultargs") SetCritValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
dist: float

Returns
-------
None
") SetCritValue;
		void SetCritValue(const Standard_Real dist);

		/****************** U0 ******************/
		%feature("compactdefaultargs") U0;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U0;
		Standard_Real U0();

		/****************** U1 ******************/
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U1;
		Standard_Real U1();

		/****************** UOrder ******************/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UOrder;
		Standard_Integer UOrder();

		/****************** V0 ******************/
		%feature("compactdefaultargs") V0;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V0;
		Standard_Real V0();

		/****************** V1 ******************/
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V1;
		Standard_Real V1();

		/****************** VOrder ******************/
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VOrder;
		Standard_Integer VOrder();

};


%extend AdvApp2Var_Patch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class AdvApp2Var_SysBase *
***************************/
class AdvApp2Var_SysBase {
	public:
		class mitem {};
		/****************** AdvApp2Var_SysBase ******************/
		%feature("compactdefaultargs") AdvApp2Var_SysBase;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_SysBase;
		 AdvApp2Var_SysBase();

		/****************** do__fio ******************/
		%feature("compactdefaultargs") do__fio;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") do__fio;
		static int do__fio();

		/****************** do__lio ******************/
		%feature("compactdefaultargs") do__lio;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") do__lio;
		static int do__lio();

		/****************** macinit_ ******************/
		%feature("compactdefaultargs") macinit_;
		%feature("autodoc", "No available documentation.

Parameters
----------
: int *
: int *

Returns
-------
int
") macinit_;
		static int macinit_(int * , int * );

		/****************** macrai4_ ******************/
		%feature("compactdefaultargs") macrai4_;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbelem: integer *
maxelm: integer *
itablo: integer *
iofset: intptr_t *
iercod: integer *

Returns
-------
int
") macrai4_;
		int macrai4_(integer * nbelem, integer * maxelm, integer * itablo, intptr_t * iofset, integer * iercod);

		/****************** macrar8_ ******************/
		%feature("compactdefaultargs") macrar8_;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbelem: integer *
maxelm: integer *
xtablo: doublereal *
iofset: intptr_t *
iercod: integer *

Returns
-------
int
") macrar8_;
		int macrar8_(integer * nbelem, integer * maxelm, doublereal * xtablo, intptr_t * iofset, integer * iercod);

		/****************** macrdi4_ ******************/
		%feature("compactdefaultargs") macrdi4_;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbelem: integer *
maxelm: integer *
itablo: integer *
iofset: intptr_t *
iercod: integer *

Returns
-------
int
") macrdi4_;
		int macrdi4_(integer * nbelem, integer * maxelm, integer * itablo, intptr_t * iofset, integer * iercod);

		/****************** macrdr8_ ******************/
		%feature("compactdefaultargs") macrdr8_;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbelem: integer *
maxelm: integer *
xtablo: doublereal *
iofset: intptr_t *
iercod: integer *

Returns
-------
int
") macrdr8_;
		int macrdr8_(integer * nbelem, integer * maxelm, doublereal * xtablo, intptr_t * iofset, integer * iercod);

		/****************** maermsg_ ******************/
		%feature("compactdefaultargs") maermsg_;
		%feature("autodoc", "No available documentation.

Parameters
----------
cnompg: char *
icoder: integer *
cnompg_len: ftnlen

Returns
-------
int
") maermsg_;
		static int maermsg_(const char * cnompg, integer * icoder, ftnlen cnompg_len);

		/****************** mainial_ ******************/
		%feature("compactdefaultargs") mainial_;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") mainial_;
		int mainial_();

		/****************** maitbr8_ ******************/
		%feature("compactdefaultargs") maitbr8_;
		%feature("autodoc", "No available documentation.

Parameters
----------
itaill: integer *
xtab: doublereal *
xval: doublereal *

Returns
-------
int
") maitbr8_;
		static int maitbr8_(integer * itaill, doublereal * xtab, doublereal * xval);

		/****************** maovsr8_ ******************/
		%feature("compactdefaultargs") maovsr8_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ivalcs: integer *

Returns
-------
int
") maovsr8_;
		static int maovsr8_(integer * ivalcs);

		/****************** mcrdelt_ ******************/
		%feature("compactdefaultargs") mcrdelt_;
		%feature("autodoc", "No available documentation.

Parameters
----------
iunit: integer *
isize: integer *
t: void *
iofset: intptr_t *
iercod: integer *

Returns
-------
int
") mcrdelt_;
		int mcrdelt_(integer * iunit, integer * isize, void * t, intptr_t * iofset, integer * iercod);

		/****************** mcrfill_ ******************/
		%feature("compactdefaultargs") mcrfill_;
		%feature("autodoc", "No available documentation.

Parameters
----------
size: integer *
tin: void *
tout: void *

Returns
-------
int
") mcrfill_;
		static int mcrfill_(integer * size, void * tin, void * tout);

		/****************** mcrrqst_ ******************/
		%feature("compactdefaultargs") mcrrqst_;
		%feature("autodoc", "No available documentation.

Parameters
----------
iunit: integer *
isize: integer *
t: void *
iofset: intptr_t *
iercod: integer *

Returns
-------
int
") mcrrqst_;
		int mcrrqst_(integer * iunit, integer * isize, void * t, intptr_t * iofset, integer * iercod);

		/****************** mgenmsg_ ******************/
		%feature("compactdefaultargs") mgenmsg_;
		%feature("autodoc", "No available documentation.

Parameters
----------
nomprg: char *
nomprg_len: ftnlen

Returns
-------
int
") mgenmsg_;
		static int mgenmsg_(const char * nomprg, ftnlen nomprg_len);

		/****************** mgsomsg_ ******************/
		%feature("compactdefaultargs") mgsomsg_;
		%feature("autodoc", "No available documentation.

Parameters
----------
nomprg: char *
nomprg_len: ftnlen

Returns
-------
int
") mgsomsg_;
		static int mgsomsg_(const char * nomprg, ftnlen nomprg_len);

		/****************** miraz_ ******************/
		%feature("compactdefaultargs") miraz_;
		%feature("autodoc", "No available documentation.

Parameters
----------
taille: integer *
adt: void *

Returns
-------
None
") miraz_;
		static void miraz_(integer * taille, void * adt);

		/****************** mnfndeb_ ******************/
		%feature("compactdefaultargs") mnfndeb_;
		%feature("autodoc", "No available documentation.

Returns
-------
integer
") mnfndeb_;
		static integer mnfndeb_();

		/****************** msifill_ ******************/
		%feature("compactdefaultargs") msifill_;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbintg: integer *
ivecin: integer *
ivecou: integer *

Returns
-------
int
") msifill_;
		static int msifill_(integer * nbintg, integer * ivecin, integer * ivecou);

		/****************** msrfill_ ******************/
		%feature("compactdefaultargs") msrfill_;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbreel: integer *
vecent: doublereal *
vecsor: doublereal *

Returns
-------
int
") msrfill_;
		static int msrfill_(integer * nbreel, doublereal * vecent, doublereal * vecsor);

		/****************** mswrdbg_ ******************/
		%feature("compactdefaultargs") mswrdbg_;
		%feature("autodoc", "No available documentation.

Parameters
----------
ctexte: char *
ctexte_len: ftnlen

Returns
-------
int
") mswrdbg_;
		static int mswrdbg_(const char * ctexte, ftnlen ctexte_len);

		/****************** mvriraz_ ******************/
		%feature("compactdefaultargs") mvriraz_;
		%feature("autodoc", "No available documentation.

Parameters
----------
taille: integer *
adt: void *

Returns
-------
None
") mvriraz_;
		static void mvriraz_(integer * taille, void * adt);

};


%extend AdvApp2Var_SysBase {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class maovpar_1_ *
*******************/
/*******************
* class maovpch_1_ *
*******************/
/*******************
* class mdnombr_1_ *
*******************/
/*******************
* class minombr_1_ *
*******************/
/*******************
* class mlgdrtl_1_ *
*******************/
/*******************
* class mmapgs0_1_ *
*******************/
/*******************
* class mmapgs1_1_ *
*******************/
/*******************
* class mmapgs2_1_ *
*******************/
/*******************
* class mmapgss_1_ *
*******************/
/*******************
* class mmcmcnp_1_ *
*******************/
/*******************
* class mmjcobi_1_ *
*******************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class AdvApp2Var_EvaluatorFunc2Var:
	pass

@classnotwrapped
class AdvApp2Var_Iso:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
