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
%define ADVAPP2VARDOCSTRING
"AdvApp2Var module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_advapp2var.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
%wrap_handle(AdvApp2Var_Node)
%wrap_handle(AdvApp2Var_Patch)
/* end handles declaration */

/* templates */
%template(AdvApp2Var_SequenceOfNode) NCollection_Sequence<opencascade::handle<AdvApp2Var_Node>>;

%extend NCollection_Sequence<opencascade::handle<AdvApp2Var_Node>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AdvApp2Var_SequenceOfPatch) NCollection_Sequence<opencascade::handle<AdvApp2Var_Patch>>;

%extend NCollection_Sequence<opencascade::handle<AdvApp2Var_Patch>> {
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
%template(AdvApp2Var_Strip) NCollection_Sequence<opencascade::handle<AdvApp2Var_Iso>>;

%extend NCollection_Sequence<opencascade::handle<AdvApp2Var_Iso>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef int ( * S_fp ) ( );
typedef NCollection_Sequence<opencascade::handle<AdvApp2Var_Node>> AdvApp2Var_SequenceOfNode;
typedef NCollection_Sequence<opencascade::handle<AdvApp2Var_Patch>> AdvApp2Var_SequenceOfPatch;
typedef NCollection_Sequence<AdvApp2Var_Strip> AdvApp2Var_SequenceOfStrip;
typedef NCollection_Sequence<opencascade::handle<AdvApp2Var_Iso>> AdvApp2Var_Strip;
typedef VOID C_f;
typedef doublereal E_f;
typedef VOID H_f;
typedef union Multitype Multitype;
typedef struct Namelist Namelist;
typedef struct Vardesc Vardesc;
typedef VOID Z_f;
typedef char * address;
typedef double doublereal;
typedef long int flag;
typedef long int ftnint;
typedef long int ftnlen;
typedef int integer;
typedef char integer1;
typedef long int logical;
typedef char logical1;
typedef long long longint;
typedef float real;
typedef short int shortint;
typedef short int shortlogical;
typedef unsigned long uinteger;
typedef unsigned long long ulongint;
/* end typedefs declaration */

/***********************************
* class AdvApp2Var_ApproxAFunc2Var *
***********************************/
class AdvApp2Var_ApproxAFunc2Var {
	public:
		/****** AdvApp2Var_ApproxAFunc2Var::AdvApp2Var_ApproxAFunc2Var ******/
		/****** md5 signature: 6379ab64b1b4c1e0c124bdc6f7c7f799 ******/
		%feature("compactdefaultargs") AdvApp2Var_ApproxAFunc2Var;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_ApproxAFunc2Var;
		 AdvApp2Var_ApproxAFunc2Var(const Standard_Integer Num1DSS, const Standard_Integer Num2DSS, const Standard_Integer Num3DSS, const opencascade::handle<TColStd_HArray1OfReal> & OneDTol, const opencascade::handle<TColStd_HArray1OfReal> & TwoDTol, const opencascade::handle<TColStd_HArray1OfReal> & ThreeDTol, const opencascade::handle<TColStd_HArray2OfReal> & OneDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & TwoDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & ThreeDTolFr, const Standard_Real FirstInU, const Standard_Real LastInU, const Standard_Real FirstInV, const Standard_Real LastInV, const GeomAbs_IsoType FavorIso, const GeomAbs_Shape ContInU, const GeomAbs_Shape ContInV, const Standard_Integer PrecisCode, const Standard_Integer MaxDegInU, const Standard_Integer MaxDegInV, const Standard_Integer MaxPatch, const AdvApp2Var_EvaluatorFunc2Var & Func, AdvApprox_Cutting & UChoice, AdvApprox_Cutting & VChoice);

		/****** AdvApp2Var_ApproxAFunc2Var::AdvApp2Var_ApproxAFunc2Var ******/
		/****** md5 signature: cb5f144bc0526b9241a11be61366792e ******/
		%feature("compactdefaultargs") AdvApp2Var_ApproxAFunc2Var;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_ApproxAFunc2Var;
		 AdvApp2Var_ApproxAFunc2Var(const Standard_Integer Num1DSS, const Standard_Integer Num2DSS, const Standard_Integer Num3DSS, const opencascade::handle<TColStd_HArray1OfReal> & OneDTol, const opencascade::handle<TColStd_HArray1OfReal> & TwoDTol, const opencascade::handle<TColStd_HArray1OfReal> & ThreeDTol, const opencascade::handle<TColStd_HArray2OfReal> & OneDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & TwoDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & ThreeDTolFr, const Standard_Real FirstInU, const Standard_Real LastInU, const Standard_Real FirstInV, const Standard_Real LastInV, const GeomAbs_IsoType FavorIso, const GeomAbs_Shape ContInU, const GeomAbs_Shape ContInV, const Standard_Integer PrecisCode, const Standard_Integer MaxDegInU, const Standard_Integer MaxDegInV, const Standard_Integer MaxPatch, const AdvApp2Var_EvaluatorFunc2Var & Func, const AdvApp2Var_Criterion & Crit, AdvApprox_Cutting & UChoice, AdvApprox_Cutting & VChoice);

		/****** AdvApp2Var_ApproxAFunc2Var::AverageError ******/
		/****** md5 signature: d3a5b5e32b36bc7e79202cfa1abaedbe ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
Dimension: int

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the average errors.
") AverageError;
		opencascade::handle<TColStd_HArray1OfReal> AverageError(const Standard_Integer Dimension);

		/****** AdvApp2Var_ApproxAFunc2Var::AverageError ******/
		/****** md5 signature: b46c820432bcb3498c5c88e842dca097 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
float

Description
-----------
Returns the average error of the bsplinesurface of range index.
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, const Standard_Integer Index);

		/****** AdvApp2Var_ApproxAFunc2Var::CritError ******/
		/****** md5 signature: cfeaabf78ae9cebfb4b197eb333f93f2 ******/
		%feature("compactdefaultargs") CritError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
float

Description
-----------
No available documentation.
") CritError;
		Standard_Real CritError(const Standard_Integer Dimension, const Standard_Integer Index);

		/****** AdvApp2Var_ApproxAFunc2Var::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream 'o' information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** AdvApp2Var_ApproxAFunc2Var::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the approximation did come out with a result that is not necessarely within the required tolerance or a result that is not recognized with the wished continuities.
") HasResult;
		Standard_Boolean HasResult();

		/****** AdvApp2Var_ApproxAFunc2Var::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the approximation succeeded within the imposed tolerances and the wished continuities.
") IsDone;
		Standard_Boolean IsDone();

		/****** AdvApp2Var_ApproxAFunc2Var::MaxError ******/
		/****** md5 signature: 65f67ba992f5651ddbda653be6688fd1 ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
Dimension: int

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the errors max.
") MaxError;
		opencascade::handle<TColStd_HArray1OfReal> MaxError(const Standard_Integer Dimension);

		/****** AdvApp2Var_ApproxAFunc2Var::MaxError ******/
		/****** md5 signature: 5025e53abdc4b5b4ec15e940b792a6ea ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
float

Description
-----------
Returns the error max of the bsplinesurface of range index.
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, const Standard_Integer Index);

		/****** AdvApp2Var_ApproxAFunc2Var::NumSubSpaces ******/
		/****** md5 signature: 1f04f546c1efa091a0725c4b06bc8324 ******/
		%feature("compactdefaultargs") NumSubSpaces;
		%feature("autodoc", "
Parameters
----------
Dimension: int

Return
-------
int

Description
-----------
No available documentation.
") NumSubSpaces;
		Standard_Integer NumSubSpaces(const Standard_Integer Dimension);

		/****** AdvApp2Var_ApproxAFunc2Var::Surface ******/
		/****** md5 signature: c06dcd87a2a0e19728e106a09c270879 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the bsplinesurface of range index.
") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface(const Standard_Integer Index);

		/****** AdvApp2Var_ApproxAFunc2Var::UDegree ******/
		/****** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		Standard_Integer UDegree();

		/****** AdvApp2Var_ApproxAFunc2Var::UFrontError ******/
		/****** md5 signature: 0a65d91af85c1f21c459707f3707a4be ******/
		%feature("compactdefaultargs") UFrontError;
		%feature("autodoc", "
Parameters
----------
Dimension: int

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the errors max on ufrontiers warning: dimension must be equal to 3.
") UFrontError;
		opencascade::handle<TColStd_HArray1OfReal> UFrontError(const Standard_Integer Dimension);

		/****** AdvApp2Var_ApproxAFunc2Var::UFrontError ******/
		/****** md5 signature: 7013ba67bcdab606aa7a3dff1c57a4d9 ******/
		%feature("compactdefaultargs") UFrontError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
float

Description
-----------
Returns the error max of the bsplinesurface of range index on a ufrontier.
") UFrontError;
		Standard_Real UFrontError(const Standard_Integer Dimension, const Standard_Integer Index);

		/****** AdvApp2Var_ApproxAFunc2Var::VDegree ******/
		/****** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		Standard_Integer VDegree();

		/****** AdvApp2Var_ApproxAFunc2Var::VFrontError ******/
		/****** md5 signature: c67297c0cd6479a8b7b6ed44f0b54d22 ******/
		%feature("compactdefaultargs") VFrontError;
		%feature("autodoc", "
Parameters
----------
Dimension: int

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the errors max on vfrontiers warning: dimension must be equal to 3.
") VFrontError;
		opencascade::handle<TColStd_HArray1OfReal> VFrontError(const Standard_Integer Dimension);

		/****** AdvApp2Var_ApproxAFunc2Var::VFrontError ******/
		/****** md5 signature: 8dd750790f1ee2230900ab6006316f3f ******/
		%feature("compactdefaultargs") VFrontError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
float

Description
-----------
Returns the error max of the bsplinesurface of range index on a vfrontier.
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
		/****** AdvApp2Var_ApproxF2var::mma1her_ ******/
		/****** md5 signature: 340a71780d0d59f85eb5ef4e22592c91 ******/
		%feature("compactdefaultargs") mma1her_;
		%feature("autodoc", "
Parameters
----------
: integer *
: doublereal *
: integer *

Return
-------
int

Description
-----------
No available documentation.
") mma1her_;
		static int mma1her_(const integer * , doublereal * , integer * );

		/****** AdvApp2Var_ApproxF2var::mma2ac1_ ******/
		/****** md5 signature: 2cb2859fe6a263b9e735e90035090c4d ******/
		%feature("compactdefaultargs") mma2ac1_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mma2ac1_;
		static int mma2ac1_(const integer * , const integer * , const integer * , const integer * , const integer * , const doublereal * , const doublereal * , const doublereal * , const doublereal * , const doublereal * , const doublereal * , doublereal * );

		/****** AdvApp2Var_ApproxF2var::mma2ac2_ ******/
		/****** md5 signature: 3fc501ea89c6f69223da0748a5067c51 ******/
		%feature("compactdefaultargs") mma2ac2_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mma2ac2_;
		static int mma2ac2_(const integer * , const integer * , const integer * , const integer * , const integer * , const integer * , const doublereal * , const integer * , const doublereal * , const doublereal * , doublereal * );

		/****** AdvApp2Var_ApproxF2var::mma2ac3_ ******/
		/****** md5 signature: 2014e6f62c9c1b3f4638d01a4d1c8b84 ******/
		%feature("compactdefaultargs") mma2ac3_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mma2ac3_;
		static int mma2ac3_(const integer * , const integer * , const integer * , const integer * , const integer * , const integer * , const doublereal * , const integer * , const doublereal * , const doublereal * , doublereal * );

		/****** AdvApp2Var_ApproxF2var::mma2can_ ******/
		/****** md5 signature: 6567d45f17981e806023a3f3d386ebd4 ******/
		%feature("compactdefaultargs") mma2can_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mma2can_;
		static int mma2can_(const integer * , const integer * , const integer * , const integer * , const integer * , const integer * , const integer * , const doublereal * , doublereal * , doublereal * , integer * );

		/****** AdvApp2Var_ApproxF2var::mma2cdi_ ******/
		/****** md5 signature: 6822f06275dfe10240eb63f63cb8154a ******/
		%feature("compactdefaultargs") mma2cdi_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mma2cdi_;
		static int mma2cdi_(integer * ndimen, integer * nbpntu, doublereal * urootl, integer * nbpntv, doublereal * vrootl, integer * iordru, integer * iordrv, doublereal * contr1, doublereal * contr2, doublereal * contr3, doublereal * contr4, doublereal * sotbu1, doublereal * sotbu2, doublereal * ditbu1, doublereal * ditbu2, doublereal * sotbv1, doublereal * sotbv2, doublereal * ditbv1, doublereal * ditbv2, doublereal * sosotb, doublereal * soditb, doublereal * disotb, doublereal * diditb, integer * iercod);

		/****** AdvApp2Var_ApproxF2var::mma2ce1_ ******/
		/****** md5 signature: 425c3d53b101c9c0f002c96ad41e6fc3 ******/
		%feature("compactdefaultargs") mma2ce1_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mma2ce1_;
		static int mma2ce1_(integer * numdec, integer * ndimen, integer * nbsesp, integer * ndimse, integer * ndminu, integer * ndminv, integer * ndguli, integer * ndgvli, integer * ndjacu, integer * ndjacv, integer * iordru, integer * iordrv, integer * nbpntu, integer * nbpntv, doublereal * epsapr, doublereal * sosotb, doublereal * disotb, doublereal * soditb, doublereal * diditb, doublereal * patjac, doublereal * errmax, doublereal * errmoy, integer * ndegpu, integer * ndegpv, integer * itydec, integer * iercod);

		/****** AdvApp2Var_ApproxF2var::mma2ds1_ ******/
		/****** md5 signature: a21bcf00d7cc3ec0c2e76dc7755429fe ******/
		%feature("compactdefaultargs") mma2ds1_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mma2ds1_;
		static int mma2ds1_(integer * ndimen, doublereal * uintfn, doublereal * vintfn, const AdvApp2Var_EvaluatorFunc2Var & foncnp, integer * nbpntu, integer * nbpntv, doublereal * urootb, doublereal * vrootb, integer * isofav, doublereal * sosotb, doublereal * disotb, doublereal * soditb, doublereal * diditb, doublereal * fpntab, doublereal * ttable, integer * iercod);

		/****** AdvApp2Var_ApproxF2var::mma2fnc_ ******/
		/****** md5 signature: 18763f0e21666ad6ab99c64fb6dbb75d ******/
		%feature("compactdefaultargs") mma2fnc_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mma2fnc_;
		static int mma2fnc_(integer * ndimen, integer * nbsesp, integer * ndimse, doublereal * uvfonc, const AdvApp2Var_EvaluatorFunc2Var & foncnp, doublereal * tconst, integer * isofav, integer * nbroot, doublereal * rootlg, integer * iordre, integer * ideriv, integer * ndgjac, integer * nbcrmx, integer * ncflim, doublereal * epsapr, integer * ncoeff, doublereal * courbe, integer * nbcrbe, doublereal * somtab, doublereal * diftab, doublereal * contr1, doublereal * contr2, doublereal * tabdec, doublereal * errmax, doublereal * errmoy, integer * iercod);

		/****** AdvApp2Var_ApproxF2var::mma2fx6_ ******/
		/****** md5 signature: 3e9466bd52c1a918c5d9e90482550972 ******/
		%feature("compactdefaultargs") mma2fx6_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mma2fx6_;
		static int mma2fx6_(integer * ncfmxu, integer * ncfmxv, integer * ndimen, integer * nbsesp, integer * ndimse, integer * nbupat, integer * nbvpat, integer * iordru, integer * iordrv, doublereal * epsapr, doublereal * epsfro, doublereal * patcan, doublereal * errmax, integer * ncoefu, integer * ncoefv);

		/****** AdvApp2Var_ApproxF2var::mma2jmx_ ******/
		/****** md5 signature: 1d8a613ee6223c570e2deac14273a3d7 ******/
		%feature("compactdefaultargs") mma2jmx_;
		%feature("autodoc", "
Parameters
----------
ndgjac: integer *
iordre: integer *
xjacmx: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mma2jmx_;
		static int mma2jmx_(integer * ndgjac, integer * iordre, doublereal * xjacmx);

		/****** AdvApp2Var_ApproxF2var::mma2roo_ ******/
		/****** md5 signature: 2b9206bd8c653739680ae42d9246a3e2 ******/
		%feature("compactdefaultargs") mma2roo_;
		%feature("autodoc", "
Parameters
----------
nbpntu: integer *
nbpntv: integer *
urootl: doublereal *
vrootl: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mma2roo_;
		static int mma2roo_(integer * nbpntu, integer * nbpntv, doublereal * urootl, doublereal * vrootl);

		/****** AdvApp2Var_ApproxF2var::mmapptt_ ******/
		/****** md5 signature: df26bb1629da819cc478cf38ae76a65b ******/
		%feature("compactdefaultargs") mmapptt_;
		%feature("autodoc", "
Parameters
----------
: integer *
: integer *
: integer *
: doublereal *
: integer *

Return
-------
int

Description
-----------
No available documentation.
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
		/****** AdvApp2Var_Context::AdvApp2Var_Context ******/
		/****** md5 signature: cc918e3d6337a3e3d6fef3c7fa6e90a5 ******/
		%feature("compactdefaultargs") AdvApp2Var_Context;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Context;
		 AdvApp2Var_Context();

		/****** AdvApp2Var_Context::AdvApp2Var_Context ******/
		/****** md5 signature: 21cd87756d9328ae205fa641ee18a3e8 ******/
		%feature("compactdefaultargs") AdvApp2Var_Context;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Context;
		 AdvApp2Var_Context(const Standard_Integer ifav, const Standard_Integer iu, const Standard_Integer iv, const Standard_Integer nlimu, const Standard_Integer nlimv, const Standard_Integer iprecis, const Standard_Integer nb1Dss, const Standard_Integer nb2Dss, const Standard_Integer nb3Dss, const opencascade::handle<TColStd_HArray1OfReal> & tol1D, const opencascade::handle<TColStd_HArray1OfReal> & tol2D, const opencascade::handle<TColStd_HArray1OfReal> & tol3D, const opencascade::handle<TColStd_HArray2OfReal> & tof1D, const opencascade::handle<TColStd_HArray2OfReal> & tof2D, const opencascade::handle<TColStd_HArray2OfReal> & tof3D);

		/****** AdvApp2Var_Context::CToler ******/
		/****** md5 signature: 24bd3fb0eebd880254f8ac1ee89f8d89 ******/
		%feature("compactdefaultargs") CToler;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfReal>

Description
-----------
No available documentation.
") CToler;
		opencascade::handle<TColStd_HArray2OfReal> CToler();

		/****** AdvApp2Var_Context::FToler ******/
		/****** md5 signature: d5ab5676361cb292c8f03db44e65e0b8 ******/
		%feature("compactdefaultargs") FToler;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfReal>

Description
-----------
No available documentation.
") FToler;
		opencascade::handle<TColStd_HArray2OfReal> FToler();

		/****** AdvApp2Var_Context::FavorIso ******/
		/****** md5 signature: c6d174e38329c613da300ca8a0f5d50f ******/
		%feature("compactdefaultargs") FavorIso;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FavorIso;
		Standard_Integer FavorIso();

		/****** AdvApp2Var_Context::IToler ******/
		/****** md5 signature: 2d6a816890d9a18a597840c55f73f6fb ******/
		%feature("compactdefaultargs") IToler;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") IToler;
		opencascade::handle<TColStd_HArray1OfReal> IToler();

		/****** AdvApp2Var_Context::TotalDimension ******/
		/****** md5 signature: f052f99d2f000729ae53d6c6fee257cf ******/
		%feature("compactdefaultargs") TotalDimension;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") TotalDimension;
		Standard_Integer TotalDimension();

		/****** AdvApp2Var_Context::TotalNumberSSP ******/
		/****** md5 signature: faf2dd9e8595d670d21dc10f3c6a6913 ******/
		%feature("compactdefaultargs") TotalNumberSSP;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") TotalNumberSSP;
		Standard_Integer TotalNumberSSP();

		/****** AdvApp2Var_Context::UGauss ******/
		/****** md5 signature: 9a6b5ace3b55823419bfede442d992cd ******/
		%feature("compactdefaultargs") UGauss;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") UGauss;
		opencascade::handle<TColStd_HArray1OfReal> UGauss();

		/****** AdvApp2Var_Context::UJacDeg ******/
		/****** md5 signature: 8044fad5cd7721e5b1833954c8c1f64c ******/
		%feature("compactdefaultargs") UJacDeg;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UJacDeg;
		Standard_Integer UJacDeg();

		/****** AdvApp2Var_Context::UJacMax ******/
		/****** md5 signature: c8c8acc46da154a394ae1ee532d52d75 ******/
		%feature("compactdefaultargs") UJacMax;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") UJacMax;
		opencascade::handle<TColStd_HArray1OfReal> UJacMax();

		/****** AdvApp2Var_Context::ULimit ******/
		/****** md5 signature: 43d12bdc3dda11b989b8554e085d81f0 ******/
		%feature("compactdefaultargs") ULimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ULimit;
		Standard_Integer ULimit();

		/****** AdvApp2Var_Context::UOrder ******/
		/****** md5 signature: 3bb505464047fef2900b8b2c2896c41e ******/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UOrder;
		Standard_Integer UOrder();

		/****** AdvApp2Var_Context::URoots ******/
		/****** md5 signature: 4c908ffe6bc2d725142f172a06cf0c1a ******/
		%feature("compactdefaultargs") URoots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") URoots;
		opencascade::handle<TColStd_HArray1OfReal> URoots();

		/****** AdvApp2Var_Context::VGauss ******/
		/****** md5 signature: 66196d55762d9b1232b870bb36f21d59 ******/
		%feature("compactdefaultargs") VGauss;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") VGauss;
		opencascade::handle<TColStd_HArray1OfReal> VGauss();

		/****** AdvApp2Var_Context::VJacDeg ******/
		/****** md5 signature: f9bfee79cd23f4af3716e80cf6ddba4a ******/
		%feature("compactdefaultargs") VJacDeg;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VJacDeg;
		Standard_Integer VJacDeg();

		/****** AdvApp2Var_Context::VJacMax ******/
		/****** md5 signature: 78706a3e7697c048821f62c71af456df ******/
		%feature("compactdefaultargs") VJacMax;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") VJacMax;
		opencascade::handle<TColStd_HArray1OfReal> VJacMax();

		/****** AdvApp2Var_Context::VLimit ******/
		/****** md5 signature: e8accebaf43ffe9314093c4a788410d4 ******/
		%feature("compactdefaultargs") VLimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VLimit;
		Standard_Integer VLimit();

		/****** AdvApp2Var_Context::VOrder ******/
		/****** md5 signature: 704529177e651451c5029c517db99652 ******/
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VOrder;
		Standard_Integer VOrder();

		/****** AdvApp2Var_Context::VRoots ******/
		/****** md5 signature: 54311a504719af5252d92bb212279e0e ******/
		%feature("compactdefaultargs") VRoots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
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
		/****** AdvApp2Var_Criterion::IsSatisfied ******/
		/****** md5 signature: 628e527776d280624d73fc40a69ddb25 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "
Parameters
----------
P: AdvApp2Var_Patch

Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied(const AdvApp2Var_Patch & P);

		/****** AdvApp2Var_Criterion::MaxValue ******/
		/****** md5 signature: 90bad7204548ba76bfdb4dc2b65fa9de ******/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") MaxValue;
		Standard_Real MaxValue();

		/****** AdvApp2Var_Criterion::Repartition ******/
		/****** md5 signature: cff4f841f0657cd7a89a6b578a81602b ******/
		%feature("compactdefaultargs") Repartition;
		%feature("autodoc", "Return
-------
AdvApp2Var_CriterionRepartition

Description
-----------
No available documentation.
") Repartition;
		AdvApp2Var_CriterionRepartition Repartition();

		/****** AdvApp2Var_Criterion::Type ******/
		/****** md5 signature: 1b9684751cac1e3e89787b772495a1ed ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
AdvApp2Var_CriterionType

Description
-----------
No available documentation.
") Type;
		AdvApp2Var_CriterionType Type();

		/****** AdvApp2Var_Criterion::Value ******/
		/****** md5 signature: bd5a3e3cc8b366204940110914f05bd9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
P: AdvApp2Var_Patch
C: AdvApp2Var_Context

Return
-------
None

Description
-----------
No available documentation.
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
		/****** AdvApp2Var_Data::Getmaovpar ******/
		/****** md5 signature: 8be6c57b8566deaa01e416a23bd10998 ******/
		%feature("compactdefaultargs") Getmaovpar;
		%feature("autodoc", "Return
-------
maovpar_1_

Description
-----------
No available documentation.
") Getmaovpar;
		static maovpar_1_ & Getmaovpar();

		/****** AdvApp2Var_Data::Getmaovpch ******/
		/****** md5 signature: 334543f940b9215443e5709331588bab ******/
		%feature("compactdefaultargs") Getmaovpch;
		%feature("autodoc", "Return
-------
maovpch_1_

Description
-----------
No available documentation.
") Getmaovpch;
		static maovpch_1_ & Getmaovpch();

		/****** AdvApp2Var_Data::Getmdnombr ******/
		/****** md5 signature: ac61a22aa001b1c0a5ee35b5c3602fd3 ******/
		%feature("compactdefaultargs") Getmdnombr;
		%feature("autodoc", "Return
-------
mdnombr_1_

Description
-----------
No available documentation.
") Getmdnombr;
		static mdnombr_1_ & Getmdnombr();

		/****** AdvApp2Var_Data::Getminombr ******/
		/****** md5 signature: e8d64195164353bb0d45e76471e1c166 ******/
		%feature("compactdefaultargs") Getminombr;
		%feature("autodoc", "Return
-------
minombr_1_

Description
-----------
No available documentation.
") Getminombr;
		static minombr_1_ & Getminombr();

		/****** AdvApp2Var_Data::Getmlgdrtl ******/
		/****** md5 signature: 91d40b6c00de974dbdc2bb896a280dcf ******/
		%feature("compactdefaultargs") Getmlgdrtl;
		%feature("autodoc", "Return
-------
mlgdrtl_1_

Description
-----------
No available documentation.
") Getmlgdrtl;
		static mlgdrtl_1_ & Getmlgdrtl();

		/****** AdvApp2Var_Data::Getmmapgs0 ******/
		/****** md5 signature: 79c6c799aa3e3857c5cf09c5affb7c09 ******/
		%feature("compactdefaultargs") Getmmapgs0;
		%feature("autodoc", "Return
-------
mmapgs0_1_

Description
-----------
No available documentation.
") Getmmapgs0;
		static mmapgs0_1_ & Getmmapgs0();

		/****** AdvApp2Var_Data::Getmmapgs1 ******/
		/****** md5 signature: 421c69fcd1506661b0c60d98977952bb ******/
		%feature("compactdefaultargs") Getmmapgs1;
		%feature("autodoc", "Return
-------
mmapgs1_1_

Description
-----------
No available documentation.
") Getmmapgs1;
		static mmapgs1_1_ & Getmmapgs1();

		/****** AdvApp2Var_Data::Getmmapgs2 ******/
		/****** md5 signature: cd17b54466c50e23724fb4ca4086c700 ******/
		%feature("compactdefaultargs") Getmmapgs2;
		%feature("autodoc", "Return
-------
mmapgs2_1_

Description
-----------
No available documentation.
") Getmmapgs2;
		static mmapgs2_1_ & Getmmapgs2();

		/****** AdvApp2Var_Data::Getmmapgss ******/
		/****** md5 signature: 2da5fe3a3d53bfd1ed26a2f7054305e0 ******/
		%feature("compactdefaultargs") Getmmapgss;
		%feature("autodoc", "Return
-------
mmapgss_1_

Description
-----------
No available documentation.
") Getmmapgss;
		static mmapgss_1_ & Getmmapgss();

		/****** AdvApp2Var_Data::Getmmcmcnp ******/
		/****** md5 signature: 7d0b6ef51dfee2c7e36ff733bfb092f1 ******/
		%feature("compactdefaultargs") Getmmcmcnp;
		%feature("autodoc", "Return
-------
mmcmcnp_1_

Description
-----------
No available documentation.
") Getmmcmcnp;
		static mmcmcnp_1_ & Getmmcmcnp();

		/****** AdvApp2Var_Data::Getmmjcobi ******/
		/****** md5 signature: 17e6be3fe538455810b1d4b422cf768d ******/
		%feature("compactdefaultargs") Getmmjcobi;
		%feature("autodoc", "Return
-------
mmjcobi_1_

Description
-----------
No available documentation.
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
		/****** AdvApp2Var_Framework::AdvApp2Var_Framework ******/
		/****** md5 signature: 818737758a4dfd25fda3f71a4e5485ad ******/
		%feature("compactdefaultargs") AdvApp2Var_Framework;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Framework;
		 AdvApp2Var_Framework();

		/****** AdvApp2Var_Framework::AdvApp2Var_Framework ******/
		/****** md5 signature: 960e0b78689457d0b96130210d6b1b29 ******/
		%feature("compactdefaultargs") AdvApp2Var_Framework;
		%feature("autodoc", "
Parameters
----------
Frame: AdvApp2Var_SequenceOfNode
UFrontier: AdvApp2Var_SequenceOfStrip
VFrontier: AdvApp2Var_SequenceOfStrip

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Framework;
		 AdvApp2Var_Framework(const AdvApp2Var_SequenceOfNode & Frame, const AdvApp2Var_SequenceOfStrip & UFrontier, const AdvApp2Var_SequenceOfStrip & VFrontier);

		/****** AdvApp2Var_Framework::ChangeIso ******/
		/****** md5 signature: 3fec201f44a8293dfa569255b6814bbb ******/
		%feature("compactdefaultargs") ChangeIso;
		%feature("autodoc", "
Parameters
----------
IndexIso: int
IndexStrip: int
anIso: AdvApp2Var_Iso

Return
-------
None

Description
-----------
No available documentation.
") ChangeIso;
		void ChangeIso(const Standard_Integer IndexIso, const Standard_Integer IndexStrip, const opencascade::handle<AdvApp2Var_Iso> & anIso);

		/****** AdvApp2Var_Framework::FirstNode ******/
		/****** md5 signature: 7e2537d33d03d4ae88afbab57eff7727 ******/
		%feature("compactdefaultargs") FirstNode;
		%feature("autodoc", "
Parameters
----------
Type: GeomAbs_IsoType
IndexIso: int
IndexStrip: int

Return
-------
int

Description
-----------
No available documentation.
") FirstNode;
		Standard_Integer FirstNode(const GeomAbs_IsoType Type, const Standard_Integer IndexIso, const Standard_Integer IndexStrip);

		/****** AdvApp2Var_Framework::FirstNotApprox ******/
		/****** md5 signature: 227783178d7bb021aee9bed3eb70dd7f ******/
		%feature("compactdefaultargs") FirstNotApprox;
		%feature("autodoc", "
Parameters
----------

Return
-------
IndexIso: int
IndexStrip: int

Description
-----------
Search the index of the first iso not approximated, if all isos are approximated null is returned.
") FirstNotApprox;
		opencascade::handle<AdvApp2Var_Iso> FirstNotApprox(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** AdvApp2Var_Framework::IsoU ******/
		/****** md5 signature: e9d88953cce2797fb11a4e1b24499c34 ******/
		%feature("compactdefaultargs") IsoU;
		%feature("autodoc", "
Parameters
----------
U: float
V0: float
V1: float

Return
-------
AdvApp2Var_Iso

Description
-----------
No available documentation.
") IsoU;
		const AdvApp2Var_Iso & IsoU(const Standard_Real U, const Standard_Real V0, const Standard_Real V1);

		/****** AdvApp2Var_Framework::IsoV ******/
		/****** md5 signature: 359e34e6c22686add688faaa999793c8 ******/
		%feature("compactdefaultargs") IsoV;
		%feature("autodoc", "
Parameters
----------
U0: float
U1: float
V: float

Return
-------
AdvApp2Var_Iso

Description
-----------
No available documentation.
") IsoV;
		const AdvApp2Var_Iso & IsoV(const Standard_Real U0, const Standard_Real U1, const Standard_Real V);

		/****** AdvApp2Var_Framework::LastNode ******/
		/****** md5 signature: c5ec3a09215187eaa4100a7b4686bdb3 ******/
		%feature("compactdefaultargs") LastNode;
		%feature("autodoc", "
Parameters
----------
Type: GeomAbs_IsoType
IndexIso: int
IndexStrip: int

Return
-------
int

Description
-----------
No available documentation.
") LastNode;
		Standard_Integer LastNode(const GeomAbs_IsoType Type, const Standard_Integer IndexIso, const Standard_Integer IndexStrip);

		/****** AdvApp2Var_Framework::Node ******/
		/****** md5 signature: 1d29de45887544e302e72092c1d86599 ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
IndexNode: int

Return
-------
opencascade::handle<AdvApp2Var_Node>

Description
-----------
No available documentation.
") Node;
		const opencascade::handle<AdvApp2Var_Node> & Node(const Standard_Integer IndexNode);

		/****** AdvApp2Var_Framework::Node ******/
		/****** md5 signature: c9d756687d8ab078da4b83b35aee2845 ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
opencascade::handle<AdvApp2Var_Node>

Description
-----------
No available documentation.
") Node;
		const opencascade::handle<AdvApp2Var_Node> & Node(const Standard_Real U, const Standard_Real V);

		/****** AdvApp2Var_Framework::UEquation ******/
		/****** md5 signature: eae095443123601e82f5e427f107c558 ******/
		%feature("compactdefaultargs") UEquation;
		%feature("autodoc", "
Parameters
----------
IndexIso: int
IndexStrip: int

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") UEquation;
		const opencascade::handle<TColStd_HArray1OfReal> & UEquation(const Standard_Integer IndexIso, const Standard_Integer IndexStrip);

		/****** AdvApp2Var_Framework::UpdateInU ******/
		/****** md5 signature: 6ceeb1ee9354cac6afc634b1d9c74e7c ******/
		%feature("compactdefaultargs") UpdateInU;
		%feature("autodoc", "
Parameters
----------
CuttingValue: float

Return
-------
None

Description
-----------
No available documentation.
") UpdateInU;
		void UpdateInU(const Standard_Real CuttingValue);

		/****** AdvApp2Var_Framework::UpdateInV ******/
		/****** md5 signature: c0f8535993a7fefff54e4fb95c170b72 ******/
		%feature("compactdefaultargs") UpdateInV;
		%feature("autodoc", "
Parameters
----------
CuttingValue: float

Return
-------
None

Description
-----------
No available documentation.
") UpdateInV;
		void UpdateInV(const Standard_Real CuttingValue);

		/****** AdvApp2Var_Framework::VEquation ******/
		/****** md5 signature: b409a4641e852e2861825c39dc2922c1 ******/
		%feature("compactdefaultargs") VEquation;
		%feature("autodoc", "
Parameters
----------
IndexIso: int
IndexStrip: int

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
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
		/****** AdvApp2Var_MathBase::mdsptpt_ ******/
		/****** md5 signature: d0cc0c7502e5928d82f8b656b6dd1fa0 ******/
		%feature("compactdefaultargs") mdsptpt_;
		%feature("autodoc", "
Parameters
----------
ndimen: integer *
point1: doublereal *
point2: doublereal *
distan: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mdsptpt_;
		static int mdsptpt_(integer * ndimen, doublereal * point1, doublereal * point2, doublereal * distan);

		/****** AdvApp2Var_MathBase::mmapcmp_ ******/
		/****** md5 signature: ddc220b71480aa8b72622753a27c1a08 ******/
		%feature("compactdefaultargs") mmapcmp_;
		%feature("autodoc", "
Parameters
----------
: integer *
: integer *
: integer *
: double *
: double *

Return
-------
int

Description
-----------
///.
") mmapcmp_;
		static int mmapcmp_(integer * , integer * , integer * , double * , double * );

		/****** AdvApp2Var_MathBase::mmaperx_ ******/
		/****** md5 signature: 3e2559039cb3bda8c6d64ac866023ed5 ******/
		%feature("compactdefaultargs") mmaperx_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmaperx_;
		static int mmaperx_(integer * ncofmx, integer * ndimen, integer * ncoeff, integer * iordre, doublereal * crvjac, integer * ncfnew, doublereal * ycvmax, doublereal * errmax, integer * iercod);

		/****** AdvApp2Var_MathBase::mmarcin_ ******/
		/****** md5 signature: c26a2d31e50b2e630a193421191f8420 ******/
		%feature("compactdefaultargs") mmarcin_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmarcin_;
		static int mmarcin_(integer * ndimax, integer * ndim, integer * ncoeff, doublereal * crvold, doublereal * u0, doublereal * u1, doublereal * crvnew, integer * iercod);

		/****** AdvApp2Var_MathBase::mmbulld_ ******/
		/****** md5 signature: a6e5ee873b96338395e569d9e9188ef2 ******/
		%feature("compactdefaultargs") mmbulld_;
		%feature("autodoc", "
Parameters
----------
nbcoln: integer *
nblign: integer *
dtabtr: doublereal *
numcle: integer *

Return
-------
int

Description
-----------
No available documentation.
") mmbulld_;
		static int mmbulld_(integer * nbcoln, integer * nblign, doublereal * dtabtr, integer * numcle);

		/****** AdvApp2Var_MathBase::mmcdriv_ ******/
		/****** md5 signature: 44a825407cbe882facc2d5a6e2edfbbd ******/
		%feature("compactdefaultargs") mmcdriv_;
		%feature("autodoc", "
Parameters
----------
ndimen: integer *
ncoeff: integer *
courbe: doublereal *
ideriv: integer *
ncofdv: integer *
crvdrv: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmcdriv_;
		static int mmcdriv_(integer * ndimen, integer * ncoeff, doublereal * courbe, integer * ideriv, integer * ncofdv, doublereal * crvdrv);

		/****** AdvApp2Var_MathBase::mmcglc1_ ******/
		/****** md5 signature: 1ced960f022f6bb9a52d4739071f227c ******/
		%feature("compactdefaultargs") mmcglc1_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
///.
") mmcglc1_;
		static int mmcglc1_(integer * ndimax, integer * ndimen, integer * ncoeff, doublereal * courbe, doublereal * tdebut, doublereal * tfinal, doublereal * epsiln, doublereal * xlongc, doublereal * erreur, integer * iercod);

		/****** AdvApp2Var_MathBase::mmcvctx_ ******/
		/****** md5 signature: 5f90652ee7a4410f4c19f327eeb75459 ******/
		%feature("compactdefaultargs") mmcvctx_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmcvctx_;
		static int mmcvctx_(integer * ndimen, integer * ncofmx, integer * nderiv, doublereal * ctrtes, doublereal * crvres, doublereal * tabaux, doublereal * xmatri, integer * iercod);

		/****** AdvApp2Var_MathBase::mmcvinv_ ******/
		/****** md5 signature: d83fa9f36dfce85985ef06a9963e1c45 ******/
		%feature("compactdefaultargs") mmcvinv_;
		%feature("autodoc", "
Parameters
----------
ndimax: integer *
ncoef: integer *
ndim: integer *
curveo: doublereal *
curve: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmcvinv_;
		static int mmcvinv_(integer * ndimax, integer * ncoef, integer * ndim, doublereal * curveo, doublereal * curve);

		/****** AdvApp2Var_MathBase::mmdrc11_ ******/
		/****** md5 signature: a28ee8f5001caafb97564920bd3ce882 ******/
		%feature("compactdefaultargs") mmdrc11_;
		%feature("autodoc", "
Parameters
----------
: integer *
: integer *
: integer *
: doublereal *
: doublereal *
: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmdrc11_;
		static int mmdrc11_(integer * , integer * , integer * , doublereal * , doublereal * , doublereal * );

		/****** AdvApp2Var_MathBase::mmdrvck_ ******/
		/****** md5 signature: 525722fedd3aebf005d25056187dddf4 ******/
		%feature("compactdefaultargs") mmdrvck_;
		%feature("autodoc", "
Parameters
----------
ncoeff: integer *
ndimen: integer *
courbe: doublereal *
ideriv: integer *
tparam: doublereal *
pntcrb: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmdrvck_;
		static int mmdrvck_(integer * ncoeff, integer * ndimen, doublereal * courbe, integer * ideriv, doublereal * tparam, doublereal * pntcrb);

		/****** AdvApp2Var_MathBase::mmeps1_ ******/
		/****** md5 signature: ab904ccf5f764d7370e8f091a5379338 ******/
		%feature("compactdefaultargs") mmeps1_;
		%feature("autodoc", "
Parameters
----------
epsilo: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmeps1_;
		static int mmeps1_(doublereal * epsilo);

		/****** AdvApp2Var_MathBase::mmfmca8_ ******/
		/****** md5 signature: c9877e732829f9386b22d78cdded7be7 ******/
		%feature("compactdefaultargs") mmfmca8_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmfmca8_;
		static int mmfmca8_(const integer * ndimen, const integer * ncoefu, const integer * ncoefv, const integer * ndimax, const integer * ncfumx, const integer * ncfvmx, doublereal * tabini, doublereal * tabres);

		/****** AdvApp2Var_MathBase::mmfmca9_ ******/
		/****** md5 signature: cdef922fdd9cca02e97d563176bdee76 ******/
		%feature("compactdefaultargs") mmfmca9_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmfmca9_;
		static int mmfmca9_(integer * , integer * , integer * , integer * , integer * , integer * , doublereal * , doublereal * );

		/****** AdvApp2Var_MathBase::mmfmcar_ ******/
		/****** md5 signature: 2f3d1dabb652936348dd204ce98331a8 ******/
		%feature("compactdefaultargs") mmfmcar_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmfmcar_;
		static int mmfmcar_(integer * ndimen, integer * ncofmx, integer * ncoefu, integer * ncoefv, doublereal * patold, doublereal * upara1, doublereal * upara2, doublereal * vpara1, doublereal * vpara2, doublereal * patnew, integer * iercod);

		/****** AdvApp2Var_MathBase::mmfmcb5_ ******/
		/****** md5 signature: 56a81c8b6cc564145902ada0223ca749 ******/
		%feature("compactdefaultargs") mmfmcb5_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmfmcb5_;
		static int mmfmcb5_(integer * , integer * , integer * , doublereal * , integer * , integer * , integer * , doublereal * , integer * );

		/****** AdvApp2Var_MathBase::mmfmtb1_ ******/
		/****** md5 signature: 8a4ac823cf2bfaa5d0b3a5b23ce64fec ******/
		%feature("compactdefaultargs") mmfmtb1_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmfmtb1_;
		static int mmfmtb1_(integer * maxsz1, doublereal * table1, integer * isize1, integer * jsize1, integer * maxsz2, doublereal * table2, integer * isize2, integer * jsize2, integer * iercod);

		/****** AdvApp2Var_MathBase::mmhjcan_ ******/
		/****** md5 signature: 446f4e5fc4471218506e9b511d9c6d33 ******/
		%feature("compactdefaultargs") mmhjcan_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmhjcan_;
		static int mmhjcan_(integer * ndimen, integer * ncourb, integer * ncftab, integer * orcont, integer * ncflim, doublereal * tcbold, doublereal * tdecop, doublereal * tcbnew, integer * iercod);

		/****** AdvApp2Var_MathBase::mminltt_ ******/
		/****** md5 signature: f6302a533cf8887921d63b52fd1db29d ******/
		%feature("compactdefaultargs") mminltt_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mminltt_;
		static int mminltt_(integer * ncolmx, integer * nlgnmx, doublereal * tabtri, integer * nbrcol, integer * nbrlgn, doublereal * ajoute, doublereal * epseg, integer * iercod);

		/****** AdvApp2Var_MathBase::mmjacan_ ******/
		/****** md5 signature: 9434e56960effb3e5ef4b134391a328e ******/
		%feature("compactdefaultargs") mmjacan_;
		%feature("autodoc", "
Parameters
----------
ideriv: integer *
ndeg: integer *
poljac: doublereal *
polcan: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmjacan_;
		static int mmjacan_(const integer * ideriv, integer * ndeg, doublereal * poljac, doublereal * polcan);

		/****** AdvApp2Var_MathBase::mmjaccv_ ******/
		/****** md5 signature: b65686bb9f09d9ff3a5414b37737b25f ******/
		%feature("compactdefaultargs") mmjaccv_;
		%feature("autodoc", "
Parameters
----------
ncoef: integer *
ndim: integer *
ider: integer *
crvlgd: doublereal *
polaux: doublereal *
crvcan: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmjaccv_;
		static int mmjaccv_(const integer * ncoef, const integer * ndim, const integer * ider, const doublereal * crvlgd, doublereal * polaux, doublereal * crvcan);

		/****** AdvApp2Var_MathBase::mmmpocur_ ******/
		/****** md5 signature: 74e6aabd8a9a0120f39cdca7f2a2ab4c ******/
		%feature("compactdefaultargs") mmmpocur_;
		%feature("autodoc", "
Parameters
----------
ncofmx: integer *
ndim: integer *
ndeg: integer *
courbe: doublereal *
tparam: doublereal *
tabval: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmmpocur_;
		static int mmmpocur_(integer * ncofmx, integer * ndim, integer * ndeg, doublereal * courbe, doublereal * tparam, doublereal * tabval);

		/****** AdvApp2Var_MathBase::mmmrslwd_ ******/
		/****** md5 signature: a95d2925ac37222049e9bf15d84c3cb5 ******/
		%feature("compactdefaultargs") mmmrslwd_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmmrslwd_;
		static int mmmrslwd_(integer * normax, integer * nordre, integer * ndim, doublereal * amat, doublereal * bmat, doublereal * epspiv, doublereal * aaux, doublereal * xmat, integer * iercod);

		/****** AdvApp2Var_MathBase::mmpobas_ ******/
		/****** md5 signature: 7bc22d5de8ef6a29982a574e3973164e ******/
		%feature("compactdefaultargs") mmpobas_;
		%feature("autodoc", "
Parameters
----------
tparam: doublereal *
iordre: integer *
ncoeff: integer *
nderiv: integer *
valbas: doublereal *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") mmpobas_;
		static int mmpobas_(doublereal * tparam, integer * iordre, integer * ncoeff, integer * nderiv, doublereal * valbas, integer * iercod);

		/****** AdvApp2Var_MathBase::mmpocrb_ ******/
		/****** md5 signature: a12dcc0fd2ee502b557d028a01877b8d ******/
		%feature("compactdefaultargs") mmpocrb_;
		%feature("autodoc", "
Parameters
----------
ndimax: integer *
ncoeff: integer *
courbe: doublereal *
ndim: integer *
tparam: doublereal *
pntcrb: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmpocrb_;
		static int mmpocrb_(integer * ndimax, integer * ncoeff, doublereal * courbe, integer * ndim, doublereal * tparam, doublereal * pntcrb);

		/****** AdvApp2Var_MathBase::mmposui_ ******/
		/****** md5 signature: 34280b75c6efa74cfc4d92b1604d7018 ******/
		%feature("compactdefaultargs") mmposui_;
		%feature("autodoc", "
Parameters
----------
dimmat: integer *
nistoc: integer *
aposit: integer *
posuiv: integer *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") mmposui_;
		static int mmposui_(integer * dimmat, integer * nistoc, integer * aposit, integer * posuiv, integer * iercod);

		/****** AdvApp2Var_MathBase::mmresol_ ******/
		/****** md5 signature: 6a24def37f274fef1c72ffabb3fb8a78 ******/
		%feature("compactdefaultargs") mmresol_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmresol_;
		static int mmresol_(integer * hdimen, integer * gdimen, integer * hnstoc, integer * gnstoc, integer * mnstoc, doublereal * matsyh, doublereal * matsyg, doublereal * vecsyh, doublereal * vecsyg, integer * hposit, integer * hposui, integer * gposit, integer * mmposui, integer * mposit, doublereal * vecsol, integer * iercod);

		/****** AdvApp2Var_MathBase::mmrtptt_ ******/
		/****** md5 signature: bf320f4ce6a9651125680601f69e4537 ******/
		%feature("compactdefaultargs") mmrtptt_;
		%feature("autodoc", "
Parameters
----------
ndglgd: integer *
rtlegd: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmrtptt_;
		static int mmrtptt_(integer * ndglgd, doublereal * rtlegd);

		/****** AdvApp2Var_MathBase::mmsrre2_ ******/
		/****** md5 signature: 11a570be7ee4b84e48a67aa8ec09f727 ******/
		%feature("compactdefaultargs") mmsrre2_;
		%feature("autodoc", "
Parameters
----------
tparam: doublereal *
nbrval: integer *
tablev: doublereal *
epsil: doublereal *
numint: integer *
itypen: integer *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") mmsrre2_;
		static int mmsrre2_(doublereal * tparam, integer * nbrval, doublereal * tablev, doublereal * epsil, integer * numint, integer * itypen, integer * iercod);

		/****** AdvApp2Var_MathBase::mmtrpjj_ ******/
		/****** md5 signature: 0569f5b50e1f2f007294ac92dcbfad1c ******/
		%feature("compactdefaultargs") mmtrpjj_;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") mmtrpjj_;
		static int mmtrpjj_(integer * ncofmx, integer * ndimen, integer * ncoeff, doublereal * epsi3d, integer * iordre, doublereal * crvlgd, doublereal * ycvmax, doublereal * errmax, integer * ncfnew);

		/****** AdvApp2Var_MathBase::mmunivt_ ******/
		/****** md5 signature: 16381a0150e98e032a27d190626c862c ******/
		%feature("compactdefaultargs") mmunivt_;
		%feature("autodoc", "
Parameters
----------
ndimen: integer *
vector: doublereal *
vecnrm: doublereal *
epsiln: doublereal *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") mmunivt_;
		static int mmunivt_(integer * ndimen, doublereal * vector, doublereal * vecnrm, doublereal * epsiln, integer * iercod);

		/****** AdvApp2Var_MathBase::mmveps3_ ******/
		/****** md5 signature: 23174d833a81b088dd2fea3e5aa72ce3 ******/
		%feature("compactdefaultargs") mmveps3_;
		%feature("autodoc", "
Parameters
----------
eps03: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") mmveps3_;
		static int mmveps3_(doublereal * eps03);

		/****** AdvApp2Var_MathBase::mmvncol_ ******/
		/****** md5 signature: 4f89cab0e4d7a63481dc99370fbc8fb2 ******/
		%feature("compactdefaultargs") mmvncol_;
		%feature("autodoc", "
Parameters
----------
ndimen: integer *
vecin: doublereal *
vecout: doublereal *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") mmvncol_;
		static int mmvncol_(integer * ndimen, doublereal * vecin, doublereal * vecout, integer * iercod);

		/****** AdvApp2Var_MathBase::mmwprcs_ ******/
		/****** md5 signature: 477d823794f68972576604130750f753 ******/
		%feature("compactdefaultargs") mmwprcs_;
		%feature("autodoc", "
Parameters
----------
: doublereal *
: doublereal *
: doublereal *
: doublereal *
: integer *
: integer *

Return
-------
None

Description
-----------
No available documentation.
") mmwprcs_;
		static void mmwprcs_(doublereal * , doublereal * , doublereal * , doublereal * , integer * , integer * );

		/****** AdvApp2Var_MathBase::msc_ ******/
		/****** md5 signature: 3114f971d87dcb65a2ab7e6d240393b5 ******/
		%feature("compactdefaultargs") msc_;
		%feature("autodoc", "
Parameters
----------
ndimen: integer *
vecte1: doublereal *
vecte2: doublereal *

Return
-------
doublereal

Description
-----------
No available documentation.
") msc_;
		static doublereal msc_(integer * ndimen, doublereal * vecte1, doublereal * vecte2);

		/****** AdvApp2Var_MathBase::mvsheld_ ******/
		/****** md5 signature: 4ecbda11b378509d5fa7a83d2e283759 ******/
		%feature("compactdefaultargs") mvsheld_;
		%feature("autodoc", "
Parameters
----------
n: integer *
is: integer *
dtab: doublereal *
icle: integer *

Return
-------
int

Description
-----------
No available documentation.
") mvsheld_;
		static int mvsheld_(integer * n, integer * is, doublereal * dtab, integer * icle);

		/****** AdvApp2Var_MathBase::mzsnorm_ ******/
		/****** md5 signature: cdbf39590da261aaf47c5ccd25c4da77 ******/
		%feature("compactdefaultargs") mzsnorm_;
		%feature("autodoc", "
Parameters
----------
ndimen: integer *
vecteu: doublereal *

Return
-------
doublereal

Description
-----------
No available documentation.
") mzsnorm_;
		static doublereal mzsnorm_(integer * ndimen, doublereal * vecteu);

		/****** AdvApp2Var_MathBase::pow__di ******/
		/****** md5 signature: e4a7f433243cba4d130c7523c160c9cd ******/
		%feature("compactdefaultargs") pow__di;
		%feature("autodoc", "
Parameters
----------
x: doublereal *
n: integer *

Return
-------
doublereal

Description
-----------
No available documentation.
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
		/****** AdvApp2Var_Network::AdvApp2Var_Network ******/
		/****** md5 signature: d17d550414bf3ecdb9a7860fb411e42f ******/
		%feature("compactdefaultargs") AdvApp2Var_Network;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Network;
		 AdvApp2Var_Network();

		/****** AdvApp2Var_Network::AdvApp2Var_Network ******/
		/****** md5 signature: 193c289f215945d46188eaeb35e19607 ******/
		%feature("compactdefaultargs") AdvApp2Var_Network;
		%feature("autodoc", "
Parameters
----------
Net: AdvApp2Var_SequenceOfPatch
TheU: TColStd_SequenceOfReal
TheV: TColStd_SequenceOfReal

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Network;
		 AdvApp2Var_Network(const AdvApp2Var_SequenceOfPatch & Net, const TColStd_SequenceOfReal & TheU, const TColStd_SequenceOfReal & TheV);

		/****** AdvApp2Var_Network::ChangePatch ******/
		/****** md5 signature: 49bf90b6471d1093efa33d9d67b1d5ff ******/
		%feature("compactdefaultargs") ChangePatch;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
AdvApp2Var_Patch

Description
-----------
No available documentation.
") ChangePatch;
		AdvApp2Var_Patch & ChangePatch(const Standard_Integer Index);

		/****** AdvApp2Var_Network::FirstNotApprox ******/
		/****** md5 signature: 71bb30feb26f00338924d16d7bd6d369 ******/
		%feature("compactdefaultargs") FirstNotApprox;
		%feature("autodoc", "
Parameters
----------

Return
-------
Index: int

Description
-----------
Search the index of the first patch not approximated, if all patches are approximated standard_false is returned.
") FirstNotApprox;
		Standard_Boolean FirstNotApprox(Standard_Integer &OutValue);

		/****** AdvApp2Var_Network::NbPatch ******/
		/****** md5 signature: e694837768b0b0d655ecd0758a2789f8 ******/
		%feature("compactdefaultargs") NbPatch;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPatch;
		Standard_Integer NbPatch();

		/****** AdvApp2Var_Network::NbPatchInU ******/
		/****** md5 signature: 3f35fc1ac6634939a320e7ad44a7f7a1 ******/
		%feature("compactdefaultargs") NbPatchInU;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPatchInU;
		Standard_Integer NbPatchInU();

		/****** AdvApp2Var_Network::NbPatchInV ******/
		/****** md5 signature: f81c6419ee7410e1e8c617bbe5c3f7ab ******/
		%feature("compactdefaultargs") NbPatchInV;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPatchInV;
		Standard_Integer NbPatchInV();

		/****** AdvApp2Var_Network::Patch ******/
		/****** md5 signature: d7ebd409a545712c8a1fd621e1074507 ******/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "
Parameters
----------
UIndex: int
VIndex: int

Return
-------
AdvApp2Var_Patch

Description
-----------
No available documentation.
") Patch;
		const AdvApp2Var_Patch & Patch(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****** AdvApp2Var_Network::SameDegree ******/
		/****** md5 signature: 7e217979ae78b3668d6f94e6a8ad1993 ******/
		%feature("compactdefaultargs") SameDegree;
		%feature("autodoc", "
Parameters
----------
iu: int
iv: int

Return
-------
ncfu: int
ncfv: int

Description
-----------
No available documentation.
") SameDegree;
		void SameDegree(const Standard_Integer iu, const Standard_Integer iv, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** AdvApp2Var_Network::UParameter ******/
		/****** md5 signature: 71719dc788a69ec419550ca101145d24 ******/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
") UParameter;
		Standard_Real UParameter(const Standard_Integer Index);

		/****** AdvApp2Var_Network::UpdateInU ******/
		/****** md5 signature: 6ceeb1ee9354cac6afc634b1d9c74e7c ******/
		%feature("compactdefaultargs") UpdateInU;
		%feature("autodoc", "
Parameters
----------
CuttingValue: float

Return
-------
None

Description
-----------
No available documentation.
") UpdateInU;
		void UpdateInU(const Standard_Real CuttingValue);

		/****** AdvApp2Var_Network::UpdateInV ******/
		/****** md5 signature: c0f8535993a7fefff54e4fb95c170b72 ******/
		%feature("compactdefaultargs") UpdateInV;
		%feature("autodoc", "
Parameters
----------
CuttingValue: float

Return
-------
None

Description
-----------
No available documentation.
") UpdateInV;
		void UpdateInV(const Standard_Real CuttingValue);

		/****** AdvApp2Var_Network::VParameter ******/
		/****** md5 signature: 33aa4b550b26911e9a612085aed53f03 ******/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
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
class AdvApp2Var_Node : public Standard_Transient {
	public:
		/****** AdvApp2Var_Node::AdvApp2Var_Node ******/
		/****** md5 signature: 757375f90af24c95af5d449c30bcf4b6 ******/
		%feature("compactdefaultargs") AdvApp2Var_Node;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Node;
		 AdvApp2Var_Node();

		/****** AdvApp2Var_Node::AdvApp2Var_Node ******/
		/****** md5 signature: d2cda16fc3142332455215854e92a317 ******/
		%feature("compactdefaultargs") AdvApp2Var_Node;
		%feature("autodoc", "
Parameters
----------
iu: int
iv: int

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Node;
		 AdvApp2Var_Node(const Standard_Integer iu, const Standard_Integer iv);

		/****** AdvApp2Var_Node::AdvApp2Var_Node ******/
		/****** md5 signature: 02101f67a99867a736cba2d1116fa5ee ******/
		%feature("compactdefaultargs") AdvApp2Var_Node;
		%feature("autodoc", "
Parameters
----------
UV: gp_XY
iu: int
iv: int

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Node;
		 AdvApp2Var_Node(const gp_XY & UV, const Standard_Integer iu, const Standard_Integer iv);

		/****** AdvApp2Var_Node::Coord ******/
		/****** md5 signature: 55c3583d2b85a3d85724dfd062f17fa4 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns the coordinates (u,v) of the node.
") Coord;
		const gp_XY Coord();

		/****** AdvApp2Var_Node::Error ******/
		/****** md5 signature: 4813a340da2d4e85dbd4db1c55725856 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
iu: int
iv: int

Return
-------
float

Description
-----------
Returns the error between f(u,v) and its approximation.
") Error;
		Standard_Real Error(const Standard_Integer iu, const Standard_Integer iv);

		/****** AdvApp2Var_Node::Point ******/
		/****** md5 signature: 749335184bea0e3e4adcaec95037b5c4 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
iu: int
iv: int

Return
-------
gp_Pnt

Description
-----------
Returns the value f(u,v) or its derivates on the node (u,v).
") Point;
		const gp_Pnt Point(const Standard_Integer iu, const Standard_Integer iv);

		/****** AdvApp2Var_Node::SetCoord ******/
		/****** md5 signature: 4e5a25b156489466ba1a9a9f348b2305 ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
x1: float
x2: float

Return
-------
None

Description
-----------
Changes the coordinates (u,v) to (x1,x2).
") SetCoord;
		void SetCoord(const Standard_Real x1, const Standard_Real x2);

		/****** AdvApp2Var_Node::SetError ******/
		/****** md5 signature: bdc80934791ff9f2bae407029b05b646 ******/
		%feature("compactdefaultargs") SetError;
		%feature("autodoc", "
Parameters
----------
iu: int
iv: int
error: float

Return
-------
None

Description
-----------
Affects the error between f(u,v) and its approximation.
") SetError;
		void SetError(const Standard_Integer iu, const Standard_Integer iv, const Standard_Real error);

		/****** AdvApp2Var_Node::SetPoint ******/
		/****** md5 signature: 76994ba669d4525ebd26c6236bb72440 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
iu: int
iv: int
Pt: gp_Pnt

Return
-------
None

Description
-----------
Affects the value f(u,v) or its derivates on the node (u,v).
") SetPoint;
		void SetPoint(const Standard_Integer iu, const Standard_Integer iv, const gp_Pnt & Pt);

		/****** AdvApp2Var_Node::UOrder ******/
		/****** md5 signature: 240f145a108dc3ebbbcea6f9c3c264fc ******/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the continuity order in u of the node.
") UOrder;
		Standard_Integer UOrder();

		/****** AdvApp2Var_Node::VOrder ******/
		/****** md5 signature: bacd1acb31115deb5ae2d0800c99aadf ******/
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the continuity order in v of the node.
") VOrder;
		Standard_Integer VOrder();

};


%make_alias(AdvApp2Var_Node)

%extend AdvApp2Var_Node {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class AdvApp2Var_Patch *
*************************/
class AdvApp2Var_Patch : public Standard_Transient {
	public:
		/****** AdvApp2Var_Patch::AdvApp2Var_Patch ******/
		/****** md5 signature: d33d6d4645686ec8d5b284576c0f601e ******/
		%feature("compactdefaultargs") AdvApp2Var_Patch;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Patch;
		 AdvApp2Var_Patch();

		/****** AdvApp2Var_Patch::AdvApp2Var_Patch ******/
		/****** md5 signature: 009293243a6ed1ff77c648dd22d8cf3b ******/
		%feature("compactdefaultargs") AdvApp2Var_Patch;
		%feature("autodoc", "
Parameters
----------
U0: float
U1: float
V0: float
V1: float
iu: int
iv: int

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Patch;
		 AdvApp2Var_Patch(const Standard_Real U0, const Standard_Real U1, const Standard_Real V0, const Standard_Real V1, const Standard_Integer iu, const Standard_Integer iv);

		/****** AdvApp2Var_Patch::AddConstraints ******/
		/****** md5 signature: abf03d99820fa7dc9c1dcf3e4036e911 ******/
		%feature("compactdefaultargs") AddConstraints;
		%feature("autodoc", "
Parameters
----------
Conditions: AdvApp2Var_Context
Constraints: AdvApp2Var_Framework

Return
-------
None

Description
-----------
No available documentation.
") AddConstraints;
		void AddConstraints(const AdvApp2Var_Context & Conditions, const AdvApp2Var_Framework & Constraints);

		/****** AdvApp2Var_Patch::AddErrors ******/
		/****** md5 signature: e042d0a7d13c92b6b2ba54fe1e7f2429 ******/
		%feature("compactdefaultargs") AddErrors;
		%feature("autodoc", "
Parameters
----------
Constraints: AdvApp2Var_Framework

Return
-------
None

Description
-----------
No available documentation.
") AddErrors;
		void AddErrors(const AdvApp2Var_Framework & Constraints);

		/****** AdvApp2Var_Patch::AverageErrors ******/
		/****** md5 signature: d8502ea596eaa24c6ddd3c29b947b322 ******/
		%feature("compactdefaultargs") AverageErrors;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") AverageErrors;
		opencascade::handle<TColStd_HArray1OfReal> AverageErrors();

		/****** AdvApp2Var_Patch::ChangeDomain ******/
		/****** md5 signature: 2ac5144771fa2395ab4c3175f83f7fdd ******/
		%feature("compactdefaultargs") ChangeDomain;
		%feature("autodoc", "
Parameters
----------
a: float
b: float
c: float
d: float

Return
-------
None

Description
-----------
No available documentation.
") ChangeDomain;
		void ChangeDomain(const Standard_Real a, const Standard_Real b, const Standard_Real c, const Standard_Real d);

		/****** AdvApp2Var_Patch::ChangeNbCoeff ******/
		/****** md5 signature: 802370e7ae3255f35692248af680e738 ******/
		%feature("compactdefaultargs") ChangeNbCoeff;
		%feature("autodoc", "
Parameters
----------
NbCoeffU: int
NbCoeffV: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeNbCoeff;
		void ChangeNbCoeff(const Standard_Integer NbCoeffU, const Standard_Integer NbCoeffV);

		/****** AdvApp2Var_Patch::Coefficients ******/
		/****** md5 signature: e17d56434ae80ca1c852d61d7c3ca62a ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------
SSPIndex: int
Conditions: AdvApp2Var_Context

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") Coefficients;
		opencascade::handle<TColStd_HArray1OfReal> Coefficients(const Standard_Integer SSPIndex, const AdvApp2Var_Context & Conditions);

		/****** AdvApp2Var_Patch::CritValue ******/
		/****** md5 signature: 23a54416c5dbe722901061f446e55cde ******/
		%feature("compactdefaultargs") CritValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") CritValue;
		Standard_Real CritValue();

		/****** AdvApp2Var_Patch::CutSense ******/
		/****** md5 signature: 992e37471b9e9d39f6176f987d7026a1 ******/
		%feature("compactdefaultargs") CutSense;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CutSense;
		Standard_Integer CutSense();

		/****** AdvApp2Var_Patch::CutSense ******/
		/****** md5 signature: 521a8a559c48f0a748d039ed8b373ff4 ******/
		%feature("compactdefaultargs") CutSense;
		%feature("autodoc", "
Parameters
----------
Crit: AdvApp2Var_Criterion
NumDec: int

Return
-------
int

Description
-----------
No available documentation.
") CutSense;
		Standard_Integer CutSense(const AdvApp2Var_Criterion & Crit, const Standard_Integer NumDec);

		/****** AdvApp2Var_Patch::Discretise ******/
		/****** md5 signature: c6ff2fab99b0d1f461ae97d16b7121e3 ******/
		%feature("compactdefaultargs") Discretise;
		%feature("autodoc", "
Parameters
----------
Conditions: AdvApp2Var_Context
Constraints: AdvApp2Var_Framework
func: AdvApp2Var_EvaluatorFunc2Var

Return
-------
None

Description
-----------
No available documentation.
") Discretise;
		void Discretise(const AdvApp2Var_Context & Conditions, const AdvApp2Var_Framework & Constraints, const AdvApp2Var_EvaluatorFunc2Var & func);

		/****** AdvApp2Var_Patch::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasResult;
		Standard_Boolean HasResult();

		/****** AdvApp2Var_Patch::IsApproximated ******/
		/****** md5 signature: 7c34eaf99169909b82e07df22d055afb ******/
		%feature("compactdefaultargs") IsApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsApproximated;
		Standard_Boolean IsApproximated();

		/****** AdvApp2Var_Patch::IsDiscretised ******/
		/****** md5 signature: 47baa977dd394ace9e32cb703e3423fb ******/
		%feature("compactdefaultargs") IsDiscretised;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDiscretised;
		Standard_Boolean IsDiscretised();

		/****** AdvApp2Var_Patch::IsoErrors ******/
		/****** md5 signature: 8ea111f68143778d4a8973276e928d0b ******/
		%feature("compactdefaultargs") IsoErrors;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfReal>

Description
-----------
No available documentation.
") IsoErrors;
		opencascade::handle<TColStd_HArray2OfReal> IsoErrors();

		/****** AdvApp2Var_Patch::MakeApprox ******/
		/****** md5 signature: 276a3e9cd61d2de916908db5672bd9b2 ******/
		%feature("compactdefaultargs") MakeApprox;
		%feature("autodoc", "
Parameters
----------
Conditions: AdvApp2Var_Context
Constraints: AdvApp2Var_Framework
NumDec: int

Return
-------
None

Description
-----------
No available documentation.
") MakeApprox;
		void MakeApprox(const AdvApp2Var_Context & Conditions, const AdvApp2Var_Framework & Constraints, const Standard_Integer NumDec);

		/****** AdvApp2Var_Patch::MaxErrors ******/
		/****** md5 signature: 2c31ae61bc19ac28b8afc8aaffbdb3d7 ******/
		%feature("compactdefaultargs") MaxErrors;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") MaxErrors;
		opencascade::handle<TColStd_HArray1OfReal> MaxErrors();

		/****** AdvApp2Var_Patch::NbCoeffInU ******/
		/****** md5 signature: 69cd17080302de88c9d27eb417982d70 ******/
		%feature("compactdefaultargs") NbCoeffInU;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCoeffInU;
		Standard_Integer NbCoeffInU();

		/****** AdvApp2Var_Patch::NbCoeffInV ******/
		/****** md5 signature: 5fdc9c87479a6f2cd28f37494a151db7 ******/
		%feature("compactdefaultargs") NbCoeffInV;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCoeffInV;
		Standard_Integer NbCoeffInV();

		/****** AdvApp2Var_Patch::OverwriteApprox ******/
		/****** md5 signature: 498eeb5383c32fe019241a25212632dc ******/
		%feature("compactdefaultargs") OverwriteApprox;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") OverwriteApprox;
		void OverwriteApprox();

		/****** AdvApp2Var_Patch::Poles ******/
		/****** md5 signature: a678e8da8145f8a2e18659df95598b78 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
SSPIndex: int
Conditions: AdvApp2Var_Context

Return
-------
opencascade::handle<TColgp_HArray2OfPnt>

Description
-----------
No available documentation.
") Poles;
		opencascade::handle<TColgp_HArray2OfPnt> Poles(const Standard_Integer SSPIndex, const AdvApp2Var_Context & Conditions);

		/****** AdvApp2Var_Patch::ResetApprox ******/
		/****** md5 signature: 95158c4db01998815f8d16a93f8762e3 ******/
		%feature("compactdefaultargs") ResetApprox;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetApprox;
		void ResetApprox();

		/****** AdvApp2Var_Patch::SetCritValue ******/
		/****** md5 signature: fa8644c9d9151b6fc16f33d9ba06eb43 ******/
		%feature("compactdefaultargs") SetCritValue;
		%feature("autodoc", "
Parameters
----------
dist: float

Return
-------
None

Description
-----------
No available documentation.
") SetCritValue;
		void SetCritValue(const Standard_Real dist);

		/****** AdvApp2Var_Patch::U0 ******/
		/****** md5 signature: 339bb715a75de7a8b4555f6a339ebd10 ******/
		%feature("compactdefaultargs") U0;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") U0;
		Standard_Real U0();

		/****** AdvApp2Var_Patch::U1 ******/
		/****** md5 signature: dc11e0157513dfb2ced295d3b3c19ebf ******/
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") U1;
		Standard_Real U1();

		/****** AdvApp2Var_Patch::UOrder ******/
		/****** md5 signature: 3bb505464047fef2900b8b2c2896c41e ******/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UOrder;
		Standard_Integer UOrder();

		/****** AdvApp2Var_Patch::V0 ******/
		/****** md5 signature: 00b73901144f5edffff220d5d949eac1 ******/
		%feature("compactdefaultargs") V0;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") V0;
		Standard_Real V0();

		/****** AdvApp2Var_Patch::V1 ******/
		/****** md5 signature: 4690fe5b6fc46d61802a6f0d508c99e5 ******/
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") V1;
		Standard_Real V1();

		/****** AdvApp2Var_Patch::VOrder ******/
		/****** md5 signature: 704529177e651451c5029c517db99652 ******/
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VOrder;
		Standard_Integer VOrder();

};


%make_alias(AdvApp2Var_Patch)

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
		/****** AdvApp2Var_SysBase::AdvApp2Var_SysBase ******/
		/****** md5 signature: 037dbb5c455e29c97a0cdd1615e8c69a ******/
		%feature("compactdefaultargs") AdvApp2Var_SysBase;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_SysBase;
		 AdvApp2Var_SysBase();

		/****** AdvApp2Var_SysBase::do__fio ******/
		/****** md5 signature: 2cf3b2f76e4397a39b6b26f1f24587d6 ******/
		%feature("compactdefaultargs") do__fio;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") do__fio;
		static int do__fio();

		/****** AdvApp2Var_SysBase::do__lio ******/
		/****** md5 signature: 1aad0eab41f21d50ea885ddaf41bd76b ******/
		%feature("compactdefaultargs") do__lio;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") do__lio;
		static int do__lio();

		/****** AdvApp2Var_SysBase::macinit_ ******/
		/****** md5 signature: b882f9f2083ffeb7a4d047c8c9eed173 ******/
		%feature("compactdefaultargs") macinit_;
		%feature("autodoc", "
Parameters
----------
: int *
: int *

Return
-------
int

Description
-----------
No available documentation.
") macinit_;
		static int macinit_(int * , int * );

		/****** AdvApp2Var_SysBase::macrai4_ ******/
		/****** md5 signature: 0b82b8932cd90447e9719c6d0ea6770e ******/
		%feature("compactdefaultargs") macrai4_;
		%feature("autodoc", "
Parameters
----------
nbelem: integer *
maxelm: integer *
itablo: integer *
iofset: intptr_t *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") macrai4_;
		int macrai4_(integer * nbelem, integer * maxelm, integer * itablo, intptr_t * iofset, integer * iercod);

		/****** AdvApp2Var_SysBase::macrar8_ ******/
		/****** md5 signature: 0fe325ba06bc2bb7a2a56adaadaef79f ******/
		%feature("compactdefaultargs") macrar8_;
		%feature("autodoc", "
Parameters
----------
nbelem: integer *
maxelm: integer *
xtablo: doublereal *
iofset: intptr_t *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") macrar8_;
		int macrar8_(integer * nbelem, integer * maxelm, doublereal * xtablo, intptr_t * iofset, integer * iercod);

		/****** AdvApp2Var_SysBase::macrdi4_ ******/
		/****** md5 signature: adbf9dc4998d49cdeb9ec904ae5369d9 ******/
		%feature("compactdefaultargs") macrdi4_;
		%feature("autodoc", "
Parameters
----------
nbelem: integer *
maxelm: integer *
itablo: integer *
iofset: intptr_t *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") macrdi4_;
		int macrdi4_(integer * nbelem, integer * maxelm, integer * itablo, intptr_t * iofset, integer * iercod);

		/****** AdvApp2Var_SysBase::macrdr8_ ******/
		/****** md5 signature: 59c1de640359cc81a9ba0b28ba054a45 ******/
		%feature("compactdefaultargs") macrdr8_;
		%feature("autodoc", "
Parameters
----------
nbelem: integer *
maxelm: integer *
xtablo: doublereal *
iofset: intptr_t *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") macrdr8_;
		int macrdr8_(integer * nbelem, integer * maxelm, doublereal * xtablo, intptr_t * iofset, integer * iercod);

		/****** AdvApp2Var_SysBase::maermsg_ ******/
		/****** md5 signature: 3521f6514eb56f1d2efe552ec8bb7ef0 ******/
		%feature("compactdefaultargs") maermsg_;
		%feature("autodoc", "
Parameters
----------
cnompg: char *
icoder: integer *
cnompg_len: ftnlen

Return
-------
int

Description
-----------
No available documentation.
") maermsg_;
		static int maermsg_(const char * cnompg, integer * icoder, ftnlen cnompg_len);

		/****** AdvApp2Var_SysBase::mainial_ ******/
		/****** md5 signature: 22a172c01af47b94bac0122c7c454091 ******/
		%feature("compactdefaultargs") mainial_;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") mainial_;
		int mainial_();

		/****** AdvApp2Var_SysBase::maitbr8_ ******/
		/****** md5 signature: b9cb20c149f17c408909c17bd7b8ed49 ******/
		%feature("compactdefaultargs") maitbr8_;
		%feature("autodoc", "
Parameters
----------
itaill: integer *
xtab: doublereal *
xval: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") maitbr8_;
		static int maitbr8_(integer * itaill, doublereal * xtab, doublereal * xval);

		/****** AdvApp2Var_SysBase::maovsr8_ ******/
		/****** md5 signature: 4ed73ca13a51d2c0e3c314b21da45c12 ******/
		%feature("compactdefaultargs") maovsr8_;
		%feature("autodoc", "
Parameters
----------
ivalcs: integer *

Return
-------
int

Description
-----------
No available documentation.
") maovsr8_;
		static int maovsr8_(integer * ivalcs);

		/****** AdvApp2Var_SysBase::mcrdelt_ ******/
		/****** md5 signature: 819c57c0f692a59c62677eb50adb81a4 ******/
		%feature("compactdefaultargs") mcrdelt_;
		%feature("autodoc", "
Parameters
----------
iunit: integer *
isize: integer *
t: void *
iofset: intptr_t *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") mcrdelt_;
		int mcrdelt_(integer * iunit, integer * isize, void * t, intptr_t * iofset, integer * iercod);

		/****** AdvApp2Var_SysBase::mcrfill_ ******/
		/****** md5 signature: be4b67960201d9ced29ceedc9f961ab3 ******/
		%feature("compactdefaultargs") mcrfill_;
		%feature("autodoc", "
Parameters
----------
size: integer *
tin: void *
tout: void *

Return
-------
int

Description
-----------
No available documentation.
") mcrfill_;
		static int mcrfill_(integer * size, void * tin, void * tout);

		/****** AdvApp2Var_SysBase::mcrrqst_ ******/
		/****** md5 signature: 4679deece1dda86417c4beb0334c93cb ******/
		%feature("compactdefaultargs") mcrrqst_;
		%feature("autodoc", "
Parameters
----------
iunit: integer *
isize: integer *
t: void *
iofset: intptr_t *
iercod: integer *

Return
-------
int

Description
-----------
No available documentation.
") mcrrqst_;
		int mcrrqst_(integer * iunit, integer * isize, void * t, intptr_t * iofset, integer * iercod);

		/****** AdvApp2Var_SysBase::mgenmsg_ ******/
		/****** md5 signature: 1b59b230a367abddf3b9cd6a99b39487 ******/
		%feature("compactdefaultargs") mgenmsg_;
		%feature("autodoc", "
Parameters
----------
nomprg: char *
nomprg_len: ftnlen

Return
-------
int

Description
-----------
No available documentation.
") mgenmsg_;
		static int mgenmsg_(const char * nomprg, ftnlen nomprg_len);

		/****** AdvApp2Var_SysBase::mgsomsg_ ******/
		/****** md5 signature: 31f3734e692045616afd66e3f8757450 ******/
		%feature("compactdefaultargs") mgsomsg_;
		%feature("autodoc", "
Parameters
----------
nomprg: char *
nomprg_len: ftnlen

Return
-------
int

Description
-----------
No available documentation.
") mgsomsg_;
		static int mgsomsg_(const char * nomprg, ftnlen nomprg_len);

		/****** AdvApp2Var_SysBase::miraz_ ******/
		/****** md5 signature: 24a2a1e4b8fd6828d77f5010fa9d9f7f ******/
		%feature("compactdefaultargs") miraz_;
		%feature("autodoc", "
Parameters
----------
taille: integer *
adt: void *

Return
-------
None

Description
-----------
No available documentation.
") miraz_;
		static void miraz_(integer * taille, void * adt);

		/****** AdvApp2Var_SysBase::mnfndeb_ ******/
		/****** md5 signature: e206e56e1443aff338ea92ec4b50fe55 ******/
		%feature("compactdefaultargs") mnfndeb_;
		%feature("autodoc", "Return
-------
integer

Description
-----------
No available documentation.
") mnfndeb_;
		static integer mnfndeb_();

		/****** AdvApp2Var_SysBase::msifill_ ******/
		/****** md5 signature: b3303f70cf7f1647dd193e2d74bb0381 ******/
		%feature("compactdefaultargs") msifill_;
		%feature("autodoc", "
Parameters
----------
nbintg: integer *
ivecin: integer *
ivecou: integer *

Return
-------
int

Description
-----------
No available documentation.
") msifill_;
		static int msifill_(integer * nbintg, integer * ivecin, integer * ivecou);

		/****** AdvApp2Var_SysBase::msrfill_ ******/
		/****** md5 signature: 4da81a3e2f58e8e272de26cef456ca5c ******/
		%feature("compactdefaultargs") msrfill_;
		%feature("autodoc", "
Parameters
----------
nbreel: integer *
vecent: doublereal *
vecsor: doublereal *

Return
-------
int

Description
-----------
No available documentation.
") msrfill_;
		static int msrfill_(integer * nbreel, doublereal * vecent, doublereal * vecsor);

		/****** AdvApp2Var_SysBase::mswrdbg_ ******/
		/****** md5 signature: b893a114fc87aec8b4d99925d2ba32a0 ******/
		%feature("compactdefaultargs") mswrdbg_;
		%feature("autodoc", "
Parameters
----------
ctexte: char *
ctexte_len: ftnlen

Return
-------
int

Description
-----------
No available documentation.
") mswrdbg_;
		static int mswrdbg_(const char * ctexte, ftnlen ctexte_len);

		/****** AdvApp2Var_SysBase::mvriraz_ ******/
		/****** md5 signature: 50aaf265d23e4b6465b101662340699b ******/
		%feature("compactdefaultargs") mvriraz_;
		%feature("autodoc", "
Parameters
----------
taille: integer *
adt: void *

Return
-------
None

Description
-----------
No available documentation.
") mvriraz_;
		static void mvriraz_(integer * taille, void * adt);

};


%extend AdvApp2Var_SysBase {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Multitype *
******************/
/*****************
* class Namelist *
*****************/
/****************
* class Vardesc *
****************/
/**************
* class alist *
**************/
/***************
* class cilist *
***************/
/***************
* class cllist *
***************/
/****************
* class complex *
****************/
/**********************
* class doublecomplex *
**********************/
/****************
* class icilist *
****************/
/***************
* class inlist *
***************/
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
/**************
* class olist *
**************/
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def AdvApp2Var_Data_Getmaovpar(*args):
	return AdvApp2Var_Data.Getmaovpar(*args)

@deprecated
def AdvApp2Var_Data_Getmaovpch(*args):
	return AdvApp2Var_Data.Getmaovpch(*args)

@deprecated
def AdvApp2Var_Data_Getmdnombr(*args):
	return AdvApp2Var_Data.Getmdnombr(*args)

@deprecated
def AdvApp2Var_Data_Getminombr(*args):
	return AdvApp2Var_Data.Getminombr(*args)

@deprecated
def AdvApp2Var_Data_Getmlgdrtl(*args):
	return AdvApp2Var_Data.Getmlgdrtl(*args)

@deprecated
def AdvApp2Var_Data_Getmmapgs0(*args):
	return AdvApp2Var_Data.Getmmapgs0(*args)

@deprecated
def AdvApp2Var_Data_Getmmapgs1(*args):
	return AdvApp2Var_Data.Getmmapgs1(*args)

@deprecated
def AdvApp2Var_Data_Getmmapgs2(*args):
	return AdvApp2Var_Data.Getmmapgs2(*args)

@deprecated
def AdvApp2Var_Data_Getmmapgss(*args):
	return AdvApp2Var_Data.Getmmapgss(*args)

@deprecated
def AdvApp2Var_Data_Getmmcmcnp(*args):
	return AdvApp2Var_Data.Getmmcmcnp(*args)

@deprecated
def AdvApp2Var_Data_Getmmjcobi(*args):
	return AdvApp2Var_Data.Getmmjcobi(*args)

}
