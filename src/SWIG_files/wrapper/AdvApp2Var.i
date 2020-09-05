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

%extend NCollection_Sequence<AdvApp2Var_Node> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AdvApp2Var_SequenceOfPatch) NCollection_Sequence<AdvApp2Var_Patch>;

%extend NCollection_Sequence<AdvApp2Var_Patch> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AdvApp2Var_SequenceOfStrip) NCollection_Sequence<AdvApp2Var_Strip>;

%extend NCollection_Sequence<AdvApp2Var_Strip> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AdvApp2Var_Strip) NCollection_Sequence<AdvApp2Var_Iso>;

%extend NCollection_Sequence<AdvApp2Var_Iso> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: 6379ab64b1b4c1e0c124bdc6f7c7f799 ****/
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
		/**** md5 signature: cb5f144bc0526b9241a11be61366792e ****/
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
		/**** md5 signature: d3a5b5e32b36bc7e79202cfa1abaedbe ****/
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
		/**** md5 signature: b46c820432bcb3498c5c88e842dca097 ****/
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
		/**** md5 signature: cfeaabf78ae9cebfb4b197eb333f93f2 ****/
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
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "True if the approximation did come out with a result that is not necessarely within the required tolerance or a result that is not recognized with the wished continuities.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the approximation succeeded within the imposed tolerances and the wished continuities.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError ******************/
		/**** md5 signature: 65f67ba992f5651ddbda653be6688fd1 ****/
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
		/**** md5 signature: 5025e53abdc4b5b4ec15e940b792a6ea ****/
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
		/**** md5 signature: 1f04f546c1efa091a0725c4b06bc8324 ****/
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
		/**** md5 signature: c06dcd87a2a0e19728e106a09c270879 ****/
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
		/**** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** UFrontError ******************/
		/**** md5 signature: 0a65d91af85c1f21c459707f3707a4be ****/
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
		/**** md5 signature: 7013ba67bcdab606aa7a3dff1c57a4d9 ****/
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
		/**** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ****/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

		/****************** VFrontError ******************/
		/**** md5 signature: c67297c0cd6479a8b7b6ed44f0b54d22 ****/
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
		/**** md5 signature: 8dd750790f1ee2230900ab6006316f3f ****/
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
		/**** md5 signature: 340a71780d0d59f85eb5ef4e22592c91 ****/
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
		/**** md5 signature: 2cb2859fe6a263b9e735e90035090c4d ****/
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
		/**** md5 signature: 3fc501ea89c6f69223da0748a5067c51 ****/
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
		/**** md5 signature: 2014e6f62c9c1b3f4638d01a4d1c8b84 ****/
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
		/**** md5 signature: 6567d45f17981e806023a3f3d386ebd4 ****/
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
		/**** md5 signature: 6822f06275dfe10240eb63f63cb8154a ****/
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
		/**** md5 signature: 425c3d53b101c9c0f002c96ad41e6fc3 ****/
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
		/**** md5 signature: a21bcf00d7cc3ec0c2e76dc7755429fe ****/
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
		/**** md5 signature: 18763f0e21666ad6ab99c64fb6dbb75d ****/
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
		/**** md5 signature: 3e9466bd52c1a918c5d9e90482550972 ****/
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
		/**** md5 signature: 1d8a613ee6223c570e2deac14273a3d7 ****/
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
		/**** md5 signature: 2b9206bd8c653739680ae42d9246a3e2 ****/
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
		/**** md5 signature: df26bb1629da819cc478cf38ae76a65b ****/
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
		/**** md5 signature: cc918e3d6337a3e3d6fef3c7fa6e90a5 ****/
		%feature("compactdefaultargs") AdvApp2Var_Context;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_Context;
		 AdvApp2Var_Context();

		/****************** AdvApp2Var_Context ******************/
		/**** md5 signature: 21cd87756d9328ae205fa641ee18a3e8 ****/
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
		/**** md5 signature: 24bd3fb0eebd880254f8ac1ee89f8d89 ****/
		%feature("compactdefaultargs") CToler;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfReal>
") CToler;
		opencascade::handle<TColStd_HArray2OfReal> CToler();

		/****************** FToler ******************/
		/**** md5 signature: d5ab5676361cb292c8f03db44e65e0b8 ****/
		%feature("compactdefaultargs") FToler;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfReal>
") FToler;
		opencascade::handle<TColStd_HArray2OfReal> FToler();

		/****************** FavorIso ******************/
		/**** md5 signature: c6d174e38329c613da300ca8a0f5d50f ****/
		%feature("compactdefaultargs") FavorIso;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FavorIso;
		Standard_Integer FavorIso();

		/****************** IToler ******************/
		/**** md5 signature: 2d6a816890d9a18a597840c55f73f6fb ****/
		%feature("compactdefaultargs") IToler;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") IToler;
		opencascade::handle<TColStd_HArray1OfReal> IToler();

		/****************** TotalDimension ******************/
		/**** md5 signature: f052f99d2f000729ae53d6c6fee257cf ****/
		%feature("compactdefaultargs") TotalDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") TotalDimension;
		Standard_Integer TotalDimension();

		/****************** TotalNumberSSP ******************/
		/**** md5 signature: faf2dd9e8595d670d21dc10f3c6a6913 ****/
		%feature("compactdefaultargs") TotalNumberSSP;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") TotalNumberSSP;
		Standard_Integer TotalNumberSSP();

		/****************** UGauss ******************/
		/**** md5 signature: 9a6b5ace3b55823419bfede442d992cd ****/
		%feature("compactdefaultargs") UGauss;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") UGauss;
		opencascade::handle<TColStd_HArray1OfReal> UGauss();

		/****************** UJacDeg ******************/
		/**** md5 signature: 8044fad5cd7721e5b1833954c8c1f64c ****/
		%feature("compactdefaultargs") UJacDeg;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UJacDeg;
		Standard_Integer UJacDeg();

		/****************** UJacMax ******************/
		/**** md5 signature: c8c8acc46da154a394ae1ee532d52d75 ****/
		%feature("compactdefaultargs") UJacMax;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") UJacMax;
		opencascade::handle<TColStd_HArray1OfReal> UJacMax();

		/****************** ULimit ******************/
		/**** md5 signature: 43d12bdc3dda11b989b8554e085d81f0 ****/
		%feature("compactdefaultargs") ULimit;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ULimit;
		Standard_Integer ULimit();

		/****************** UOrder ******************/
		/**** md5 signature: 3bb505464047fef2900b8b2c2896c41e ****/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UOrder;
		Standard_Integer UOrder();

		/****************** URoots ******************/
		/**** md5 signature: 4c908ffe6bc2d725142f172a06cf0c1a ****/
		%feature("compactdefaultargs") URoots;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") URoots;
		opencascade::handle<TColStd_HArray1OfReal> URoots();

		/****************** VGauss ******************/
		/**** md5 signature: 66196d55762d9b1232b870bb36f21d59 ****/
		%feature("compactdefaultargs") VGauss;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") VGauss;
		opencascade::handle<TColStd_HArray1OfReal> VGauss();

		/****************** VJacDeg ******************/
		/**** md5 signature: f9bfee79cd23f4af3716e80cf6ddba4a ****/
		%feature("compactdefaultargs") VJacDeg;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VJacDeg;
		Standard_Integer VJacDeg();

		/****************** VJacMax ******************/
		/**** md5 signature: 78706a3e7697c048821f62c71af456df ****/
		%feature("compactdefaultargs") VJacMax;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") VJacMax;
		opencascade::handle<TColStd_HArray1OfReal> VJacMax();

		/****************** VLimit ******************/
		/**** md5 signature: e8accebaf43ffe9314093c4a788410d4 ****/
		%feature("compactdefaultargs") VLimit;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VLimit;
		Standard_Integer VLimit();

		/****************** VOrder ******************/
		/**** md5 signature: 704529177e651451c5029c517db99652 ****/
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VOrder;
		Standard_Integer VOrder();

		/****************** VRoots ******************/
		/**** md5 signature: 54311a504719af5252d92bb212279e0e ****/
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
		/**** md5 signature: 628e527776d280624d73fc40a69ddb25 ****/
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
		/**** md5 signature: 90bad7204548ba76bfdb4dc2b65fa9de ****/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaxValue;
		Standard_Real MaxValue();

		/****************** Repartition ******************/
		/**** md5 signature: cff4f841f0657cd7a89a6b578a81602b ****/
		%feature("compactdefaultargs") Repartition;
		%feature("autodoc", "No available documentation.

Returns
-------
AdvApp2Var_CriterionRepartition
") Repartition;
		AdvApp2Var_CriterionRepartition Repartition();

		/****************** Type ******************/
		/**** md5 signature: 1b9684751cac1e3e89787b772495a1ed ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
AdvApp2Var_CriterionType
") Type;
		AdvApp2Var_CriterionType Type();

		/****************** Value ******************/
		/**** md5 signature: bd5a3e3cc8b366204940110914f05bd9 ****/
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
		/**** md5 signature: 8be6c57b8566deaa01e416a23bd10998 ****/
		%feature("compactdefaultargs") Getmaovpar;
		%feature("autodoc", "No available documentation.

Returns
-------
maovpar_1_
") Getmaovpar;
		static maovpar_1_ & Getmaovpar();

		/****************** Getmaovpch ******************/
		/**** md5 signature: 334543f940b9215443e5709331588bab ****/
		%feature("compactdefaultargs") Getmaovpch;
		%feature("autodoc", "No available documentation.

Returns
-------
maovpch_1_
") Getmaovpch;
		static maovpch_1_ & Getmaovpch();

		/****************** Getmdnombr ******************/
		/**** md5 signature: ac61a22aa001b1c0a5ee35b5c3602fd3 ****/
		%feature("compactdefaultargs") Getmdnombr;
		%feature("autodoc", "No available documentation.

Returns
-------
mdnombr_1_
") Getmdnombr;
		static mdnombr_1_ & Getmdnombr();

		/****************** Getminombr ******************/
		/**** md5 signature: e8d64195164353bb0d45e76471e1c166 ****/
		%feature("compactdefaultargs") Getminombr;
		%feature("autodoc", "No available documentation.

Returns
-------
minombr_1_
") Getminombr;
		static minombr_1_ & Getminombr();

		/****************** Getmlgdrtl ******************/
		/**** md5 signature: 91d40b6c00de974dbdc2bb896a280dcf ****/
		%feature("compactdefaultargs") Getmlgdrtl;
		%feature("autodoc", "No available documentation.

Returns
-------
mlgdrtl_1_
") Getmlgdrtl;
		static mlgdrtl_1_ & Getmlgdrtl();

		/****************** Getmmapgs0 ******************/
		/**** md5 signature: 79c6c799aa3e3857c5cf09c5affb7c09 ****/
		%feature("compactdefaultargs") Getmmapgs0;
		%feature("autodoc", "No available documentation.

Returns
-------
mmapgs0_1_
") Getmmapgs0;
		static mmapgs0_1_ & Getmmapgs0();

		/****************** Getmmapgs1 ******************/
		/**** md5 signature: 421c69fcd1506661b0c60d98977952bb ****/
		%feature("compactdefaultargs") Getmmapgs1;
		%feature("autodoc", "No available documentation.

Returns
-------
mmapgs1_1_
") Getmmapgs1;
		static mmapgs1_1_ & Getmmapgs1();

		/****************** Getmmapgs2 ******************/
		/**** md5 signature: cd17b54466c50e23724fb4ca4086c700 ****/
		%feature("compactdefaultargs") Getmmapgs2;
		%feature("autodoc", "No available documentation.

Returns
-------
mmapgs2_1_
") Getmmapgs2;
		static mmapgs2_1_ & Getmmapgs2();

		/****************** Getmmapgss ******************/
		/**** md5 signature: 2da5fe3a3d53bfd1ed26a2f7054305e0 ****/
		%feature("compactdefaultargs") Getmmapgss;
		%feature("autodoc", "No available documentation.

Returns
-------
mmapgss_1_
") Getmmapgss;
		static mmapgss_1_ & Getmmapgss();

		/****************** Getmmcmcnp ******************/
		/**** md5 signature: 7d0b6ef51dfee2c7e36ff733bfb092f1 ****/
		%feature("compactdefaultargs") Getmmcmcnp;
		%feature("autodoc", "No available documentation.

Returns
-------
mmcmcnp_1_
") Getmmcmcnp;
		static mmcmcnp_1_ & Getmmcmcnp();

		/****************** Getmmjcobi ******************/
		/**** md5 signature: 17e6be3fe538455810b1d4b422cf768d ****/
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
		/**** md5 signature: 818737758a4dfd25fda3f71a4e5485ad ****/
		%feature("compactdefaultargs") AdvApp2Var_Framework;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_Framework;
		 AdvApp2Var_Framework();

		/****************** AdvApp2Var_Framework ******************/
		/**** md5 signature: 960e0b78689457d0b96130210d6b1b29 ****/
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
		/**** md5 signature: 0ff887cc84d0842b97772f4b8c5ce214 ****/
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
		/**** md5 signature: 45c4ceb2eca4cf141afcac3f8044c892 ****/
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
		/**** md5 signature: 7e2537d33d03d4ae88afbab57eff7727 ****/
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
		/**** md5 signature: 7f446684d0cea79d172f56c0636129dc ****/
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
		/**** md5 signature: e9d88953cce2797fb11a4e1b24499c34 ****/
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
		/**** md5 signature: 359e34e6c22686add688faaa999793c8 ****/
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
		/**** md5 signature: c5ec3a09215187eaa4100a7b4686bdb3 ****/
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
		/**** md5 signature: 3b3eea2f78aa12b05cf9e628b8ed4152 ****/
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
		/**** md5 signature: eaa527c5431aed735170128d4123da4c ****/
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
		/**** md5 signature: eae095443123601e82f5e427f107c558 ****/
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
		/**** md5 signature: 6ceeb1ee9354cac6afc634b1d9c74e7c ****/
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
		/**** md5 signature: c0f8535993a7fefff54e4fb95c170b72 ****/
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
		/**** md5 signature: b409a4641e852e2861825c39dc2922c1 ****/
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
		/**** md5 signature: d0cc0c7502e5928d82f8b656b6dd1fa0 ****/
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
		/**** md5 signature: ddc220b71480aa8b72622753a27c1a08 ****/
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
		/**** md5 signature: 3e2559039cb3bda8c6d64ac866023ed5 ****/
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
		/**** md5 signature: c26a2d31e50b2e630a193421191f8420 ****/
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
		/**** md5 signature: a6e5ee873b96338395e569d9e9188ef2 ****/
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
		/**** md5 signature: 44a825407cbe882facc2d5a6e2edfbbd ****/
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
		/**** md5 signature: 1ced960f022f6bb9a52d4739071f227c ****/
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
		/**** md5 signature: 5f90652ee7a4410f4c19f327eeb75459 ****/
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
		/**** md5 signature: d83fa9f36dfce85985ef06a9963e1c45 ****/
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
		/**** md5 signature: a28ee8f5001caafb97564920bd3ce882 ****/
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
		/**** md5 signature: 525722fedd3aebf005d25056187dddf4 ****/
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
		/**** md5 signature: ab904ccf5f764d7370e8f091a5379338 ****/
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
		/**** md5 signature: c9877e732829f9386b22d78cdded7be7 ****/
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
		/**** md5 signature: cdef922fdd9cca02e97d563176bdee76 ****/
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
		/**** md5 signature: 2f3d1dabb652936348dd204ce98331a8 ****/
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
		/**** md5 signature: 56a81c8b6cc564145902ada0223ca749 ****/
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
		/**** md5 signature: 8a4ac823cf2bfaa5d0b3a5b23ce64fec ****/
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
		/**** md5 signature: 446f4e5fc4471218506e9b511d9c6d33 ****/
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
		/**** md5 signature: f6302a533cf8887921d63b52fd1db29d ****/
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
		/**** md5 signature: 9434e56960effb3e5ef4b134391a328e ****/
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
		/**** md5 signature: b65686bb9f09d9ff3a5414b37737b25f ****/
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
		/**** md5 signature: 74e6aabd8a9a0120f39cdca7f2a2ab4c ****/
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
		/**** md5 signature: a95d2925ac37222049e9bf15d84c3cb5 ****/
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
		/**** md5 signature: 7bc22d5de8ef6a29982a574e3973164e ****/
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
		/**** md5 signature: a12dcc0fd2ee502b557d028a01877b8d ****/
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
		/**** md5 signature: 34280b75c6efa74cfc4d92b1604d7018 ****/
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
		/**** md5 signature: 6a24def37f274fef1c72ffabb3fb8a78 ****/
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
		/**** md5 signature: bf320f4ce6a9651125680601f69e4537 ****/
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
		/**** md5 signature: 11a570be7ee4b84e48a67aa8ec09f727 ****/
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
		/**** md5 signature: 0569f5b50e1f2f007294ac92dcbfad1c ****/
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
		/**** md5 signature: 16381a0150e98e032a27d190626c862c ****/
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
		/**** md5 signature: 23174d833a81b088dd2fea3e5aa72ce3 ****/
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
		/**** md5 signature: 4f89cab0e4d7a63481dc99370fbc8fb2 ****/
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
		/**** md5 signature: 477d823794f68972576604130750f753 ****/
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
		/**** md5 signature: 3114f971d87dcb65a2ab7e6d240393b5 ****/
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
		/**** md5 signature: 4ecbda11b378509d5fa7a83d2e283759 ****/
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
		/**** md5 signature: cdbf39590da261aaf47c5ccd25c4da77 ****/
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
		/**** md5 signature: e4a7f433243cba4d130c7523c160c9cd ****/
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
		/**** md5 signature: d17d550414bf3ecdb9a7860fb411e42f ****/
		%feature("compactdefaultargs") AdvApp2Var_Network;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_Network;
		 AdvApp2Var_Network();

		/****************** AdvApp2Var_Network ******************/
		/**** md5 signature: 193c289f215945d46188eaeb35e19607 ****/
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
		/**** md5 signature: a15f81a970c2b3d0bff85da1732019c4 ****/
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
		/**** md5 signature: 71bb30feb26f00338924d16d7bd6d369 ****/
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
		/**** md5 signature: e694837768b0b0d655ecd0758a2789f8 ****/
		%feature("compactdefaultargs") NbPatch;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPatch;
		Standard_Integer NbPatch();

		/****************** NbPatchInU ******************/
		/**** md5 signature: 3f35fc1ac6634939a320e7ad44a7f7a1 ****/
		%feature("compactdefaultargs") NbPatchInU;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPatchInU;
		Standard_Integer NbPatchInU();

		/****************** NbPatchInV ******************/
		/**** md5 signature: f81c6419ee7410e1e8c617bbe5c3f7ab ****/
		%feature("compactdefaultargs") NbPatchInV;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPatchInV;
		Standard_Integer NbPatchInV();

		/****************** Patch ******************/
		/**** md5 signature: 1b17fe2ea4c46a2234238847bb3d16a2 ****/
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
		/**** md5 signature: 7e217979ae78b3668d6f94e6a8ad1993 ****/
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
		/**** md5 signature: 71719dc788a69ec419550ca101145d24 ****/
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
		/**** md5 signature: 6ceeb1ee9354cac6afc634b1d9c74e7c ****/
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
		/**** md5 signature: c0f8535993a7fefff54e4fb95c170b72 ****/
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
		/**** md5 signature: 33aa4b550b26911e9a612085aed53f03 ****/
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
		/**** md5 signature: 757375f90af24c95af5d449c30bcf4b6 ****/
		%feature("compactdefaultargs") AdvApp2Var_Node;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_Node;
		 AdvApp2Var_Node();

		/****************** AdvApp2Var_Node ******************/
		/**** md5 signature: d2cda16fc3142332455215854e92a317 ****/
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
		/**** md5 signature: 02101f67a99867a736cba2d1116fa5ee ****/
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
		/**** md5 signature: 27ed9c0f0c0b0a05a292954f0e886ef8 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XY
") Coord;
		gp_XY Coord();

		/****************** Error ******************/
		/**** md5 signature: 6fe2dd8bc0797287b91665293fb827c8 ****/
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
		/**** md5 signature: 93ffc77789713df75048f8eab8f2f157 ****/
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
		/**** md5 signature: 9e86c72ca511d80323361a05f0b2976f ****/
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
		/**** md5 signature: c923bddfb684bdaec8dd9ef6a9072d1a ****/
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
		/**** md5 signature: 3373951466e08e6f834d158efd12ad35 ****/
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
		/**** md5 signature: 3bb505464047fef2900b8b2c2896c41e ****/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UOrder;
		Standard_Integer UOrder();

		/****************** VOrder ******************/
		/**** md5 signature: 704529177e651451c5029c517db99652 ****/
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
		/**** md5 signature: d33d6d4645686ec8d5b284576c0f601e ****/
		%feature("compactdefaultargs") AdvApp2Var_Patch;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_Patch;
		 AdvApp2Var_Patch();

		/****************** AdvApp2Var_Patch ******************/
		/**** md5 signature: 009293243a6ed1ff77c648dd22d8cf3b ****/
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
		/**** md5 signature: abf03d99820fa7dc9c1dcf3e4036e911 ****/
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
		/**** md5 signature: e042d0a7d13c92b6b2ba54fe1e7f2429 ****/
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
		/**** md5 signature: d8502ea596eaa24c6ddd3c29b947b322 ****/
		%feature("compactdefaultargs") AverageErrors;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") AverageErrors;
		opencascade::handle<TColStd_HArray1OfReal> AverageErrors();

		/****************** ChangeDomain ******************/
		/**** md5 signature: 2ac5144771fa2395ab4c3175f83f7fdd ****/
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
		/**** md5 signature: 802370e7ae3255f35692248af680e738 ****/
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
		/**** md5 signature: e17d56434ae80ca1c852d61d7c3ca62a ****/
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
		/**** md5 signature: 23a54416c5dbe722901061f446e55cde ****/
		%feature("compactdefaultargs") CritValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") CritValue;
		Standard_Real CritValue();

		/****************** CutSense ******************/
		/**** md5 signature: 992e37471b9e9d39f6176f987d7026a1 ****/
		%feature("compactdefaultargs") CutSense;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") CutSense;
		Standard_Integer CutSense();

		/****************** CutSense ******************/
		/**** md5 signature: 521a8a559c48f0a748d039ed8b373ff4 ****/
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
		/**** md5 signature: c6ff2fab99b0d1f461ae97d16b7121e3 ****/
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
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsApproximated ******************/
		/**** md5 signature: 7c34eaf99169909b82e07df22d055afb ****/
		%feature("compactdefaultargs") IsApproximated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsApproximated;
		Standard_Boolean IsApproximated();

		/****************** IsDiscretised ******************/
		/**** md5 signature: 47baa977dd394ace9e32cb703e3423fb ****/
		%feature("compactdefaultargs") IsDiscretised;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDiscretised;
		Standard_Boolean IsDiscretised();

		/****************** IsoErrors ******************/
		/**** md5 signature: 8ea111f68143778d4a8973276e928d0b ****/
		%feature("compactdefaultargs") IsoErrors;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfReal>
") IsoErrors;
		opencascade::handle<TColStd_HArray2OfReal> IsoErrors();

		/****************** MakeApprox ******************/
		/**** md5 signature: 276a3e9cd61d2de916908db5672bd9b2 ****/
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
		/**** md5 signature: 2c31ae61bc19ac28b8afc8aaffbdb3d7 ****/
		%feature("compactdefaultargs") MaxErrors;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") MaxErrors;
		opencascade::handle<TColStd_HArray1OfReal> MaxErrors();

		/****************** NbCoeffInU ******************/
		/**** md5 signature: 69cd17080302de88c9d27eb417982d70 ****/
		%feature("compactdefaultargs") NbCoeffInU;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCoeffInU;
		Standard_Integer NbCoeffInU();

		/****************** NbCoeffInV ******************/
		/**** md5 signature: 5fdc9c87479a6f2cd28f37494a151db7 ****/
		%feature("compactdefaultargs") NbCoeffInV;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCoeffInV;
		Standard_Integer NbCoeffInV();

		/****************** OverwriteApprox ******************/
		/**** md5 signature: 498eeb5383c32fe019241a25212632dc ****/
		%feature("compactdefaultargs") OverwriteApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") OverwriteApprox;
		void OverwriteApprox();

		/****************** Poles ******************/
		/**** md5 signature: a678e8da8145f8a2e18659df95598b78 ****/
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
		/**** md5 signature: 95158c4db01998815f8d16a93f8762e3 ****/
		%feature("compactdefaultargs") ResetApprox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetApprox;
		void ResetApprox();

		/****************** SetCritValue ******************/
		/**** md5 signature: fa8644c9d9151b6fc16f33d9ba06eb43 ****/
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
		/**** md5 signature: 339bb715a75de7a8b4555f6a339ebd10 ****/
		%feature("compactdefaultargs") U0;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U0;
		Standard_Real U0();

		/****************** U1 ******************/
		/**** md5 signature: dc11e0157513dfb2ced295d3b3c19ebf ****/
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U1;
		Standard_Real U1();

		/****************** UOrder ******************/
		/**** md5 signature: 3bb505464047fef2900b8b2c2896c41e ****/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UOrder;
		Standard_Integer UOrder();

		/****************** V0 ******************/
		/**** md5 signature: 00b73901144f5edffff220d5d949eac1 ****/
		%feature("compactdefaultargs") V0;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V0;
		Standard_Real V0();

		/****************** V1 ******************/
		/**** md5 signature: 4690fe5b6fc46d61802a6f0d508c99e5 ****/
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V1;
		Standard_Real V1();

		/****************** VOrder ******************/
		/**** md5 signature: 704529177e651451c5029c517db99652 ****/
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
		/**** md5 signature: 037dbb5c455e29c97a0cdd1615e8c69a ****/
		%feature("compactdefaultargs") AdvApp2Var_SysBase;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AdvApp2Var_SysBase;
		 AdvApp2Var_SysBase();

		/****************** do__fio ******************/
		/**** md5 signature: 2cf3b2f76e4397a39b6b26f1f24587d6 ****/
		%feature("compactdefaultargs") do__fio;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") do__fio;
		static int do__fio();

		/****************** do__lio ******************/
		/**** md5 signature: 1aad0eab41f21d50ea885ddaf41bd76b ****/
		%feature("compactdefaultargs") do__lio;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") do__lio;
		static int do__lio();

		/****************** macinit_ ******************/
		/**** md5 signature: b882f9f2083ffeb7a4d047c8c9eed173 ****/
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
		/**** md5 signature: 0b82b8932cd90447e9719c6d0ea6770e ****/
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
		/**** md5 signature: 0fe325ba06bc2bb7a2a56adaadaef79f ****/
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
		/**** md5 signature: adbf9dc4998d49cdeb9ec904ae5369d9 ****/
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
		/**** md5 signature: 59c1de640359cc81a9ba0b28ba054a45 ****/
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
		/**** md5 signature: 3521f6514eb56f1d2efe552ec8bb7ef0 ****/
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
		/**** md5 signature: 22a172c01af47b94bac0122c7c454091 ****/
		%feature("compactdefaultargs") mainial_;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") mainial_;
		int mainial_();

		/****************** maitbr8_ ******************/
		/**** md5 signature: b9cb20c149f17c408909c17bd7b8ed49 ****/
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
		/**** md5 signature: 4ed73ca13a51d2c0e3c314b21da45c12 ****/
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
		/**** md5 signature: 819c57c0f692a59c62677eb50adb81a4 ****/
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
		/**** md5 signature: be4b67960201d9ced29ceedc9f961ab3 ****/
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
		/**** md5 signature: 4679deece1dda86417c4beb0334c93cb ****/
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
		/**** md5 signature: 1b59b230a367abddf3b9cd6a99b39487 ****/
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
		/**** md5 signature: 31f3734e692045616afd66e3f8757450 ****/
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
		/**** md5 signature: 24a2a1e4b8fd6828d77f5010fa9d9f7f ****/
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
		/**** md5 signature: e206e56e1443aff338ea92ec4b50fe55 ****/
		%feature("compactdefaultargs") mnfndeb_;
		%feature("autodoc", "No available documentation.

Returns
-------
integer
") mnfndeb_;
		static integer mnfndeb_();

		/****************** msifill_ ******************/
		/**** md5 signature: b3303f70cf7f1647dd193e2d74bb0381 ****/
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
		/**** md5 signature: 4da81a3e2f58e8e272de26cef456ca5c ****/
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
		/**** md5 signature: b893a114fc87aec8b4d99925d2ba32a0 ****/
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
		/**** md5 signature: 50aaf265d23e4b6465b101662340699b ****/
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
