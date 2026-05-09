/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_advapp2var.html"
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
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AdvApp2Var_SequenceOfPatch) NCollection_Sequence<opencascade::handle<AdvApp2Var_Patch>>;

%extend NCollection_Sequence<opencascade::handle<AdvApp2Var_Patch>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AdvApp2Var_SequenceOfStrip) NCollection_Sequence<AdvApp2Var_Strip>;

%extend NCollection_Sequence<AdvApp2Var_Strip> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(AdvApp2Var_Strip) NCollection_Sequence<opencascade::handle<AdvApp2Var_Iso>>;

%extend NCollection_Sequence<opencascade::handle<AdvApp2Var_Iso>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<AdvApp2Var_Node>> AdvApp2Var_SequenceOfNode;
typedef NCollection_Sequence<opencascade::handle<AdvApp2Var_Patch>> AdvApp2Var_SequenceOfPatch;
typedef NCollection_Sequence<AdvApp2Var_Strip> AdvApp2Var_SequenceOfStrip;
typedef NCollection_Sequence<opencascade::handle<AdvApp2Var_Iso>> AdvApp2Var_Strip;
/* end typedefs declaration */

/***********************************
* class AdvApp2Var_ApproxAFunc2Var *
***********************************/
class AdvApp2Var_ApproxAFunc2Var {
	public:
		/****** AdvApp2Var_ApproxAFunc2Var::AdvApp2Var_ApproxAFunc2Var ******/
		/****** md5 signature: fcfc865732e1d7f04c94fc16bb4fbfef ******/
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
FirstInU: double
LastInU: double
FirstInV: double
LastInV: double
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
		 AdvApp2Var_ApproxAFunc2Var(const int Num1DSS, const int Num2DSS, const int Num3DSS, const opencascade::handle<TColStd_HArray1OfReal> & OneDTol, const opencascade::handle<TColStd_HArray1OfReal> & TwoDTol, const opencascade::handle<TColStd_HArray1OfReal> & ThreeDTol, const opencascade::handle<TColStd_HArray2OfReal> & OneDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & TwoDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & ThreeDTolFr, const double FirstInU, const double LastInU, const double FirstInV, const double LastInV, const GeomAbs_IsoType FavorIso, const GeomAbs_Shape ContInU, const GeomAbs_Shape ContInV, const int PrecisCode, const int MaxDegInU, const int MaxDegInV, const int MaxPatch, const AdvApp2Var_EvaluatorFunc2Var & Func, AdvApprox_Cutting & UChoice, AdvApprox_Cutting & VChoice);

		/****** AdvApp2Var_ApproxAFunc2Var::AdvApp2Var_ApproxAFunc2Var ******/
		/****** md5 signature: 8fefd392f9b73f8c4f49c482f0ec0197 ******/
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
FirstInU: double
LastInU: double
FirstInV: double
LastInV: double
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
		 AdvApp2Var_ApproxAFunc2Var(const int Num1DSS, const int Num2DSS, const int Num3DSS, const opencascade::handle<TColStd_HArray1OfReal> & OneDTol, const opencascade::handle<TColStd_HArray1OfReal> & TwoDTol, const opencascade::handle<TColStd_HArray1OfReal> & ThreeDTol, const opencascade::handle<TColStd_HArray2OfReal> & OneDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & TwoDTolFr, const opencascade::handle<TColStd_HArray2OfReal> & ThreeDTolFr, const double FirstInU, const double LastInU, const double FirstInV, const double LastInV, const GeomAbs_IsoType FavorIso, const GeomAbs_Shape ContInU, const GeomAbs_Shape ContInV, const int PrecisCode, const int MaxDegInU, const int MaxDegInV, const int MaxPatch, const AdvApp2Var_EvaluatorFunc2Var & Func, const AdvApp2Var_Criterion & Crit, AdvApprox_Cutting & UChoice, AdvApprox_Cutting & VChoice);

		/****** AdvApp2Var_ApproxAFunc2Var::AverageError ******/
		/****** md5 signature: 2f6bf7ea0e0cfb3b392f43df654829e3 ******/
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
returns the average errors.
") AverageError;
		opencascade::handle<TColStd_HArray1OfReal> AverageError(const int Dimension);

		/****** AdvApp2Var_ApproxAFunc2Var::AverageError ******/
		/****** md5 signature: ed4d67908b569de9e3571c9f53547394 ******/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
double

Description
-----------
returns the average error of the BSplineSurface of range Index.
") AverageError;
		double AverageError(const int Dimension, const int Index);

		/****** AdvApp2Var_ApproxAFunc2Var::CritError ******/
		/****** md5 signature: 5576a4d885b37c8a9826654feb83b09d ******/
		%feature("compactdefaultargs") CritError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
double

Description
-----------
No available documentation.
") CritError;
		double CritError(const int Dimension, const int Index);

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
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the approximation did come out with a result that is not NECESSARELY within the required tolerance or a result that is not recognized with the wished continuities.
") HasResult;
		bool HasResult();

		/****** AdvApp2Var_ApproxAFunc2Var::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the approximation succeeded within the imposed tolerances and the wished continuities.
") IsDone;
		bool IsDone();

		/****** AdvApp2Var_ApproxAFunc2Var::MaxError ******/
		/****** md5 signature: ab9966d45e8ce7fa710ffb9f899f7a08 ******/
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
returns the errors max.
") MaxError;
		opencascade::handle<TColStd_HArray1OfReal> MaxError(const int Dimension);

		/****** AdvApp2Var_ApproxAFunc2Var::MaxError ******/
		/****** md5 signature: 61a4677e31f18ea56a128d2bb9e750a6 ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
double

Description
-----------
returns the error max of the BSplineSurface of range Index.
") MaxError;
		double MaxError(const int Dimension, const int Index);

		/****** AdvApp2Var_ApproxAFunc2Var::NumSubSpaces ******/
		/****** md5 signature: 1c9032115985612a399c1ddcdf11e7ff ******/
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
		int NumSubSpaces(const int Dimension);

		/****** AdvApp2Var_ApproxAFunc2Var::Surface ******/
		/****** md5 signature: d7715fe40f77f0bd6483ef647d8ce179 ******/
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
returns the BSplineSurface of range Index.
") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface(const int Index);

		/****** AdvApp2Var_ApproxAFunc2Var::UDegree ******/
		/****** md5 signature: 82316803b09fa91a345f15577c8b3c82 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		int UDegree();

		/****** AdvApp2Var_ApproxAFunc2Var::UFrontError ******/
		/****** md5 signature: 429d2e4592958da983fa29d6fe76c20c ******/
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
returns the errors max on UFrontiers Warning: Dimension must be equal to 3.
") UFrontError;
		opencascade::handle<TColStd_HArray1OfReal> UFrontError(const int Dimension);

		/****** AdvApp2Var_ApproxAFunc2Var::UFrontError ******/
		/****** md5 signature: eb984df2156b3aeaae5f8902482d7a19 ******/
		%feature("compactdefaultargs") UFrontError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
double

Description
-----------
returns the error max of the BSplineSurface of range Index on a UFrontier.
") UFrontError;
		double UFrontError(const int Dimension, const int Index);

		/****** AdvApp2Var_ApproxAFunc2Var::VDegree ******/
		/****** md5 signature: 10a01c94db483e5b8afe43596e767a03 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		int VDegree();

		/****** AdvApp2Var_ApproxAFunc2Var::VFrontError ******/
		/****** md5 signature: eb8759f2ca7816e554e545034e7bffbd ******/
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
returns the errors max on VFrontiers Warning: Dimension must be equal to 3.
") VFrontError;
		opencascade::handle<TColStd_HArray1OfReal> VFrontError(const int Dimension);

		/****** AdvApp2Var_ApproxAFunc2Var::VFrontError ******/
		/****** md5 signature: db589fa08c8c83bc03290cfe5b063ac7 ******/
		%feature("compactdefaultargs") VFrontError;
		%feature("autodoc", "
Parameters
----------
Dimension: int
Index: int

Return
-------
double

Description
-----------
returns the error max of the BSplineSurface of range Index on a VFrontier.
") VFrontError;
		double VFrontError(const int Dimension, const int Index);

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
		/****** md5 signature: bc40155e8dc84f0e2c87faa9751be05a ******/
		%feature("compactdefaultargs") mma1her_;
		%feature("autodoc", "
Parameters
----------
: int *
: double *
: int *

Return
-------
int

Description
-----------
No available documentation.
") mma1her_;
		static int mma1her_(const int * , double * , int * );

		/****** AdvApp2Var_ApproxF2var::mma2ac1_ ******/
		/****** md5 signature: 27c98dbef816e8700cd5ae7fe7e790aa ******/
		%feature("compactdefaultargs") mma2ac1_;
		%feature("autodoc", "
Parameters
----------
: int *
: int *
: int *
: int *
: int *
: double *
: double *
: double *
: double *
: double *
: double *
: double *

Return
-------
int

Description
-----------
No available documentation.
") mma2ac1_;
		static int mma2ac1_(const int * , const int * , const int * , const int * , const int * , const double * , const double * , const double * , const double * , const double * , const double * , double * );

		/****** AdvApp2Var_ApproxF2var::mma2ac2_ ******/
		/****** md5 signature: 67f563c4429688045e6645c15d22553c ******/
		%feature("compactdefaultargs") mma2ac2_;
		%feature("autodoc", "
Parameters
----------
: int *
: int *
: int *
: int *
: int *
: int *
: double *
: int *
: double *
: double *
: double *

Return
-------
int

Description
-----------
No available documentation.
") mma2ac2_;
		static int mma2ac2_(const int * , const int * , const int * , const int * , const int * , const int * , const double * , const int * , const double * , const double * , double * );

		/****** AdvApp2Var_ApproxF2var::mma2ac3_ ******/
		/****** md5 signature: 0646fafd0848c734984336d0bd493efe ******/
		%feature("compactdefaultargs") mma2ac3_;
		%feature("autodoc", "
Parameters
----------
: int *
: int *
: int *
: int *
: int *
: int *
: double *
: int *
: double *
: double *
: double *

Return
-------
int

Description
-----------
No available documentation.
") mma2ac3_;
		static int mma2ac3_(const int * , const int * , const int * , const int * , const int * , const int * , const double * , const int * , const double * , const double * , double * );

		/****** AdvApp2Var_ApproxF2var::mma2can_ ******/
		/****** md5 signature: e00d3f3260dcc61c94b2a5a83f98814c ******/
		%feature("compactdefaultargs") mma2can_;
		%feature("autodoc", "
Parameters
----------
: int *
: int *
: int *
: int *
: int *
: int *
: int *
: double *
: double *
: double *
: int *

Return
-------
int

Description
-----------
No available documentation.
") mma2can_;
		static int mma2can_(const int * , const int * , const int * , const int * , const int * , const int * , const int * , const double * , double * , double * , int * );

		/****** AdvApp2Var_ApproxF2var::mma2cdi_ ******/
		/****** md5 signature: 0a9bec60115c8852d5ac7d73e4ec18d2 ******/
		%feature("compactdefaultargs") mma2cdi_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
nbpntu: int *
urootl: double *
nbpntv: int *
vrootl: double *
iordru: int *
iordrv: int *
contr1: double *
contr2: double *
contr3: double *
contr4: double *
sotbu1: double *
sotbu2: double *
ditbu1: double *
ditbu2: double *
sotbv1: double *
sotbv2: double *
ditbv1: double *
ditbv2: double *
sosotb: double *
soditb: double *
disotb: double *
diditb: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mma2cdi_;
		static int mma2cdi_(int * ndimen, int * nbpntu, double * urootl, int * nbpntv, double * vrootl, int * iordru, int * iordrv, double * contr1, double * contr2, double * contr3, double * contr4, double * sotbu1, double * sotbu2, double * ditbu1, double * ditbu2, double * sotbv1, double * sotbv2, double * ditbv1, double * ditbv2, double * sosotb, double * soditb, double * disotb, double * diditb, int * iercod);

		/****** AdvApp2Var_ApproxF2var::mma2ce1_ ******/
		/****** md5 signature: 5027b84e0acf3c20c538ea89d836e083 ******/
		%feature("compactdefaultargs") mma2ce1_;
		%feature("autodoc", "
Parameters
----------
numdec: int *
ndimen: int *
nbsesp: int *
ndimse: int *
ndminu: int *
ndminv: int *
ndguli: int *
ndgvli: int *
ndjacu: int *
ndjacv: int *
iordru: int *
iordrv: int *
nbpntu: int *
nbpntv: int *
epsapr: double *
sosotb: double *
disotb: double *
soditb: double *
diditb: double *
patjac: double *
errmax: double *
errmoy: double *
ndegpu: int *
ndegpv: int *
itydec: int *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mma2ce1_;
		static int mma2ce1_(int * numdec, int * ndimen, int * nbsesp, int * ndimse, int * ndminu, int * ndminv, int * ndguli, int * ndgvli, int * ndjacu, int * ndjacv, int * iordru, int * iordrv, int * nbpntu, int * nbpntv, double * epsapr, double * sosotb, double * disotb, double * soditb, double * diditb, double * patjac, double * errmax, double * errmoy, int * ndegpu, int * ndegpv, int * itydec, int * iercod);

		/****** AdvApp2Var_ApproxF2var::mma2ds1_ ******/
		/****** md5 signature: 05911ccd4cd5fdf99a0af2f428a9c56e ******/
		%feature("compactdefaultargs") mma2ds1_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
uintfn: double *
vintfn: double *
foncnp: AdvApp2Var_EvaluatorFunc2Var
nbpntu: int *
nbpntv: int *
urootb: double *
vrootb: double *
isofav: int *
sosotb: double *
disotb: double *
soditb: double *
diditb: double *
fpntab: double *
ttable: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mma2ds1_;
		static int mma2ds1_(int * ndimen, double * uintfn, double * vintfn, const AdvApp2Var_EvaluatorFunc2Var & foncnp, int * nbpntu, int * nbpntv, double * urootb, double * vrootb, int * isofav, double * sosotb, double * disotb, double * soditb, double * diditb, double * fpntab, double * ttable, int * iercod);

		/****** AdvApp2Var_ApproxF2var::mma2fnc_ ******/
		/****** md5 signature: 7e6ca9292bfc676fafcf749949b9ad69 ******/
		%feature("compactdefaultargs") mma2fnc_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
nbsesp: int *
ndimse: int *
uvfonc: double *
foncnp: AdvApp2Var_EvaluatorFunc2Var
tconst: double *
isofav: int *
nbroot: int *
rootlg: double *
iordre: int *
ideriv: int *
ndgjac: int *
nbcrmx: int *
ncflim: int *
epsapr: double *
ncoeff: int *
courbe: double *
nbcrbe: int *
somtab: double *
diftab: double *
contr1: double *
contr2: double *
tabdec: double *
errmax: double *
errmoy: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mma2fnc_;
		static int mma2fnc_(int * ndimen, int * nbsesp, int * ndimse, double * uvfonc, const AdvApp2Var_EvaluatorFunc2Var & foncnp, double * tconst, int * isofav, int * nbroot, double * rootlg, int * iordre, int * ideriv, int * ndgjac, int * nbcrmx, int * ncflim, double * epsapr, int * ncoeff, double * courbe, int * nbcrbe, double * somtab, double * diftab, double * contr1, double * contr2, double * tabdec, double * errmax, double * errmoy, int * iercod);

		/****** AdvApp2Var_ApproxF2var::mma2fx6_ ******/
		/****** md5 signature: b26e10b53d814841d08dc54fa6655c8c ******/
		%feature("compactdefaultargs") mma2fx6_;
		%feature("autodoc", "
Parameters
----------
ncfmxu: int *
ncfmxv: int *
ndimen: int *
nbsesp: int *
ndimse: int *
nbupat: int *
nbvpat: int *
iordru: int *
iordrv: int *
epsapr: double *
epsfro: double *
patcan: double *
errmax: double *
ncoefu: int *
ncoefv: int *

Return
-------
int

Description
-----------
No available documentation.
") mma2fx6_;
		static int mma2fx6_(int * ncfmxu, int * ncfmxv, int * ndimen, int * nbsesp, int * ndimse, int * nbupat, int * nbvpat, int * iordru, int * iordrv, double * epsapr, double * epsfro, double * patcan, double * errmax, int * ncoefu, int * ncoefv);

		/****** AdvApp2Var_ApproxF2var::mma2jmx_ ******/
		/****** md5 signature: 1600421c9fb4be71b47a5185f1bf5e1b ******/
		%feature("compactdefaultargs") mma2jmx_;
		%feature("autodoc", "
Parameters
----------
ndgjac: int *
iordre: int *
xjacmx: double *

Return
-------
int

Description
-----------
No available documentation.
") mma2jmx_;
		static int mma2jmx_(int * ndgjac, int * iordre, double * xjacmx);

		/****** AdvApp2Var_ApproxF2var::mma2roo_ ******/
		/****** md5 signature: bac884df0c3c079a25f16d742dcac111 ******/
		%feature("compactdefaultargs") mma2roo_;
		%feature("autodoc", "
Parameters
----------
nbpntu: int *
nbpntv: int *
urootl: double *
vrootl: double *

Return
-------
int

Description
-----------
No available documentation.
") mma2roo_;
		static int mma2roo_(int * nbpntu, int * nbpntv, double * urootl, double * vrootl);

		/****** AdvApp2Var_ApproxF2var::mmapptt_ ******/
		/****** md5 signature: 0bd05d8fc8463e8bc8245f48caf46916 ******/
		%feature("compactdefaultargs") mmapptt_;
		%feature("autodoc", "
Parameters
----------
: int *
: int *
: int *
: double *
: int *

Return
-------
int

Description
-----------
No available documentation.
") mmapptt_;
		static int mmapptt_(const int * , const int * , const int * , double * , int * );

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
		/****** md5 signature: 48171ef4fc9dd886cb3f039631007028 ******/
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
		 AdvApp2Var_Context(const int ifav, const int iu, const int iv, const int nlimu, const int nlimv, const int iprecis, const int nb1Dss, const int nb2Dss, const int nb3Dss, const opencascade::handle<TColStd_HArray1OfReal> & tol1D, const opencascade::handle<TColStd_HArray1OfReal> & tol2D, const opencascade::handle<TColStd_HArray1OfReal> & tol3D, const opencascade::handle<TColStd_HArray2OfReal> & tof1D, const opencascade::handle<TColStd_HArray2OfReal> & tof2D, const opencascade::handle<TColStd_HArray2OfReal> & tof3D);

		/****** AdvApp2Var_Context::CToler ******/
		/****** md5 signature: a9b49fb1378a576ee0797c5fb0aaacd6 ******/
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
		/****** md5 signature: 14bb0bfb9e22c140b38385c2b6f0d4cd ******/
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
		/****** md5 signature: bca98e62e2526dfd7c3b8e7410a2efbb ******/
		%feature("compactdefaultargs") FavorIso;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FavorIso;
		int FavorIso();

		/****** AdvApp2Var_Context::IToler ******/
		/****** md5 signature: 601e9cc220da4e05e084f27b6c1a1396 ******/
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
		/****** md5 signature: eb2eb2144359ee7f54e4a9a55b30922a ******/
		%feature("compactdefaultargs") TotalDimension;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") TotalDimension;
		int TotalDimension();

		/****** AdvApp2Var_Context::TotalNumberSSP ******/
		/****** md5 signature: b57abaeed5cf7c9a66cc8813f41f03c9 ******/
		%feature("compactdefaultargs") TotalNumberSSP;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") TotalNumberSSP;
		int TotalNumberSSP();

		/****** AdvApp2Var_Context::UGauss ******/
		/****** md5 signature: b73f881b679effea3bb8312c60b360a1 ******/
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
		/****** md5 signature: 59cd530bb340f1d7331ad22ca073f97d ******/
		%feature("compactdefaultargs") UJacDeg;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UJacDeg;
		int UJacDeg();

		/****** AdvApp2Var_Context::UJacMax ******/
		/****** md5 signature: 7c10bd303958ca92c52a40188528a796 ******/
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
		/****** md5 signature: 96ae4670ff57713efae1e12d608c0b97 ******/
		%feature("compactdefaultargs") ULimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ULimit;
		int ULimit();

		/****** AdvApp2Var_Context::UOrder ******/
		/****** md5 signature: 506eb4cd965c491ed72c611f4394bbc9 ******/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UOrder;
		int UOrder();

		/****** AdvApp2Var_Context::URoots ******/
		/****** md5 signature: d5d762efcbd9987c3751ba73ad5bbfcc ******/
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
		/****** md5 signature: f1095f4fb01185055b07b72ce2122bbb ******/
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
		/****** md5 signature: 441e0ad1c4126a0ee6dc44641a6e7987 ******/
		%feature("compactdefaultargs") VJacDeg;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VJacDeg;
		int VJacDeg();

		/****** AdvApp2Var_Context::VJacMax ******/
		/****** md5 signature: c00c8bbf8b94285b3924c6e1cdecf102 ******/
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
		/****** md5 signature: b3731c3ae1bb79dc44ec506f14aa2aaa ******/
		%feature("compactdefaultargs") VLimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VLimit;
		int VLimit();

		/****** AdvApp2Var_Context::VOrder ******/
		/****** md5 signature: 7d8c6b6b638dff0483d77f1fe58907bb ******/
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VOrder;
		int VOrder();

		/****** AdvApp2Var_Context::VRoots ******/
		/****** md5 signature: 3bc80b6c847b85526bf5e47fc495de19 ******/
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
		/****** md5 signature: 592bfea2e82dce4941736e1f90e6e244 ******/
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
		virtual bool IsSatisfied(const AdvApp2Var_Patch & P);

		/****** AdvApp2Var_Criterion::MaxValue ******/
		/****** md5 signature: bcb41cb2e4251afb78d7c7cdfd0d2e88 ******/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") MaxValue;
		double MaxValue();

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
		/****** md5 signature: ebfb0cc60b71dfcf7c328ae42d62ca49 ******/
		%feature("compactdefaultargs") AdvApp2Var_Framework;
		%feature("autodoc", "
Parameters
----------
Frame: AdvApp2Var_Node
UFrontier: AdvApp2Var_Iso
VFrontier: AdvApp2Var_Iso

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Framework;
		 AdvApp2Var_Framework(const NCollection_Sequence<opencascade::handle<AdvApp2Var_Node>> & Frame, const NCollection_Sequence<NCollection_Sequence<opencascade::handle<AdvApp2Var_Iso>> > & UFrontier, const NCollection_Sequence<NCollection_Sequence<opencascade::handle<AdvApp2Var_Iso>> > & VFrontier);

		/****** AdvApp2Var_Framework::ChangeIso ******/
		/****** md5 signature: cb76fd10907ee4b73bbcf9054de94d45 ******/
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
		void ChangeIso(const int IndexIso, const int IndexStrip, const opencascade::handle<AdvApp2Var_Iso> & anIso);

		/****** AdvApp2Var_Framework::FirstNode ******/
		/****** md5 signature: e70992e5265d7cbe2646a61e8445b182 ******/
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
		int FirstNode(const GeomAbs_IsoType Type, const int IndexIso, const int IndexStrip);

		/****** AdvApp2Var_Framework::FirstNotApprox ******/
		/****** md5 signature: e96ec88daee82e7cf775c8cae7653386 ******/
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
search the Index of the first Iso not approximated, if all Isos are approximated NULL is returned.
") FirstNotApprox;
		opencascade::handle<AdvApp2Var_Iso> FirstNotApprox(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** AdvApp2Var_Framework::IsoU ******/
		/****** md5 signature: d7c3ced749c23f9d465df94ec07f5edc ******/
		%feature("compactdefaultargs") IsoU;
		%feature("autodoc", "
Parameters
----------
U: double
V0: double
V1: double

Return
-------
AdvApp2Var_Iso

Description
-----------
No available documentation.
") IsoU;
		const AdvApp2Var_Iso & IsoU(const double U, const double V0, const double V1);

		/****** AdvApp2Var_Framework::IsoV ******/
		/****** md5 signature: bd1ccf356d1409bc9024ab4cbc2bb7b0 ******/
		%feature("compactdefaultargs") IsoV;
		%feature("autodoc", "
Parameters
----------
U0: double
U1: double
V: double

Return
-------
AdvApp2Var_Iso

Description
-----------
No available documentation.
") IsoV;
		const AdvApp2Var_Iso & IsoV(const double U0, const double U1, const double V);

		/****** AdvApp2Var_Framework::LastNode ******/
		/****** md5 signature: 7f26eb6c1619d03f5f9a2923b7385a59 ******/
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
		int LastNode(const GeomAbs_IsoType Type, const int IndexIso, const int IndexStrip);

		/****** AdvApp2Var_Framework::Node ******/
		/****** md5 signature: 60c4b71e85516f3b0c58d3d2c84c8e90 ******/
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
		const opencascade::handle<AdvApp2Var_Node> & Node(const int IndexNode);

		/****** AdvApp2Var_Framework::Node ******/
		/****** md5 signature: 3c791f8b847adf258b2d51cd6230ce4c ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
opencascade::handle<AdvApp2Var_Node>

Description
-----------
No available documentation.
") Node;
		const opencascade::handle<AdvApp2Var_Node> & Node(const double U, const double V);

		/****** AdvApp2Var_Framework::UEquation ******/
		/****** md5 signature: a41e3146c52d97d92e4e4c84fe4b6df1 ******/
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
		const opencascade::handle<TColStd_HArray1OfReal> & UEquation(const int IndexIso, const int IndexStrip);

		/****** AdvApp2Var_Framework::UpdateInU ******/
		/****** md5 signature: ea19319ce9faa7d1deb1064607f98a7e ******/
		%feature("compactdefaultargs") UpdateInU;
		%feature("autodoc", "
Parameters
----------
CuttingValue: double

Return
-------
None

Description
-----------
No available documentation.
") UpdateInU;
		void UpdateInU(const double CuttingValue);

		/****** AdvApp2Var_Framework::UpdateInV ******/
		/****** md5 signature: 06633d1c44e0865bb44110b693c69ae6 ******/
		%feature("compactdefaultargs") UpdateInV;
		%feature("autodoc", "
Parameters
----------
CuttingValue: double

Return
-------
None

Description
-----------
No available documentation.
") UpdateInV;
		void UpdateInV(const double CuttingValue);

		/****** AdvApp2Var_Framework::VEquation ******/
		/****** md5 signature: ba67abead88627ba6217055106fe7cd7 ******/
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
		const opencascade::handle<TColStd_HArray1OfReal> & VEquation(const int IndexIso, const int IndexStrip);

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
		/****** md5 signature: 99f4ba7f2f6af77061927f31511deceb ******/
		%feature("compactdefaultargs") mdsptpt_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
point1: double *
point2: double *
distan: double *

Return
-------
int

Description
-----------
No available documentation.
") mdsptpt_;
		static int mdsptpt_(int * ndimen, double * point1, double * point2, double * distan);

		/****** AdvApp2Var_MathBase::mmapcmp_ ******/
		/****** md5 signature: 30a44258fd01a2a8678ddad138262a12 ******/
		%feature("compactdefaultargs") mmapcmp_;
		%feature("autodoc", "
Parameters
----------
: int *
: int *
: int *
: double *
: double *

Return
-------
int

Description
-----------
No available documentation.
") mmapcmp_;
		static int mmapcmp_(int * , int * , int * , double * , double * );

		/****** AdvApp2Var_MathBase::mmaperx_ ******/
		/****** md5 signature: bcfde2eccd06d1df9dae278f3804d912 ******/
		%feature("compactdefaultargs") mmaperx_;
		%feature("autodoc", "
Parameters
----------
ncofmx: int *
ndimen: int *
ncoeff: int *
iordre: int *
crvjac: double *
ncfnew: int *
ycvmax: double *
errmax: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmaperx_;
		static int mmaperx_(int * ncofmx, int * ndimen, int * ncoeff, int * iordre, double * crvjac, int * ncfnew, double * ycvmax, double * errmax, int * iercod);

		/****** AdvApp2Var_MathBase::mmarcin_ ******/
		/****** md5 signature: 930be891cca5c9810a51f933bef3f567 ******/
		%feature("compactdefaultargs") mmarcin_;
		%feature("autodoc", "
Parameters
----------
ndimax: int *
ndim: int *
ncoeff: int *
crvold: double *
u0: double *
u1: double *
crvnew: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmarcin_;
		static int mmarcin_(int * ndimax, int * ndim, int * ncoeff, double * crvold, double * u0, double * u1, double * crvnew, int * iercod);

		/****** AdvApp2Var_MathBase::mmbulld_ ******/
		/****** md5 signature: a8cfc063dc2bac4cf8a367743ce73a83 ******/
		%feature("compactdefaultargs") mmbulld_;
		%feature("autodoc", "
Parameters
----------
nbcoln: int *
nblign: int *
dtabtr: double *
numcle: int *

Return
-------
int

Description
-----------
No available documentation.
") mmbulld_;
		static int mmbulld_(int * nbcoln, int * nblign, double * dtabtr, int * numcle);

		/****** AdvApp2Var_MathBase::mmcdriv_ ******/
		/****** md5 signature: c518477f2b9031c5f65e0e5c51a7c74c ******/
		%feature("compactdefaultargs") mmcdriv_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
ncoeff: int *
courbe: double *
ideriv: int *
ncofdv: int *
crvdrv: double *

Return
-------
int

Description
-----------
No available documentation.
") mmcdriv_;
		static int mmcdriv_(int * ndimen, int * ncoeff, double * courbe, int * ideriv, int * ncofdv, double * crvdrv);

		/****** AdvApp2Var_MathBase::mmcglc1_ ******/
		/****** md5 signature: 8cdf7fa3ab66c2ff8174317e491e9f58 ******/
		%feature("compactdefaultargs") mmcglc1_;
		%feature("autodoc", "
Parameters
----------
ndimax: int *
ndimen: int *
ncoeff: int *
courbe: double *
tdebut: double *
tfinal: double *
epsiln: double *
xlongc: double *
erreur: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmcglc1_;
		static int mmcglc1_(int * ndimax, int * ndimen, int * ncoeff, double * courbe, double * tdebut, double * tfinal, double * epsiln, double * xlongc, double * erreur, int * iercod);

		/****** AdvApp2Var_MathBase::mmcvctx_ ******/
		/****** md5 signature: 828111983de0fdcdca91f66df8b0fcd5 ******/
		%feature("compactdefaultargs") mmcvctx_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
ncofmx: int *
nderiv: int *
ctrtes: double *
crvres: double *
tabaux: double *
xmatri: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmcvctx_;
		static int mmcvctx_(int * ndimen, int * ncofmx, int * nderiv, double * ctrtes, double * crvres, double * tabaux, double * xmatri, int * iercod);

		/****** AdvApp2Var_MathBase::mmcvinv_ ******/
		/****** md5 signature: a9ae3ebebe974f07356bd916163fc810 ******/
		%feature("compactdefaultargs") mmcvinv_;
		%feature("autodoc", "
Parameters
----------
ndimax: int *
ncoef: int *
ndim: int *
curveo: double *
curve: double *

Return
-------
int

Description
-----------
No available documentation.
") mmcvinv_;
		static int mmcvinv_(int * ndimax, int * ncoef, int * ndim, double * curveo, double * curve);

		/****** AdvApp2Var_MathBase::mmdrc11_ ******/
		/****** md5 signature: 10e3f85b0a9ec4b436417455829e93c2 ******/
		%feature("compactdefaultargs") mmdrc11_;
		%feature("autodoc", "
Parameters
----------
: int *
: int *
: int *
: double *
: double *
: double *

Return
-------
int

Description
-----------
No available documentation.
") mmdrc11_;
		static int mmdrc11_(int * , int * , int * , double * , double * , double * );

		/****** AdvApp2Var_MathBase::mmdrvck_ ******/
		/****** md5 signature: 3d2d0a1a1304d5255008fb163e30a864 ******/
		%feature("compactdefaultargs") mmdrvck_;
		%feature("autodoc", "
Parameters
----------
ncoeff: int *
ndimen: int *
courbe: double *
ideriv: int *
tparam: double *
pntcrb: double *

Return
-------
int

Description
-----------
No available documentation.
") mmdrvck_;
		static int mmdrvck_(int * ncoeff, int * ndimen, double * courbe, int * ideriv, double * tparam, double * pntcrb);

		/****** AdvApp2Var_MathBase::mmeps1_ ******/
		/****** md5 signature: 06ebc05f790570e8bebd9d01bf6c8512 ******/
		%feature("compactdefaultargs") mmeps1_;
		%feature("autodoc", "
Parameters
----------
epsilo: double *

Return
-------
int

Description
-----------
No available documentation.
") mmeps1_;
		static int mmeps1_(double * epsilo);

		/****** AdvApp2Var_MathBase::mmfmca8_ ******/
		/****** md5 signature: 4f1d8456127a0f02ce3713c36d3de356 ******/
		%feature("compactdefaultargs") mmfmca8_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
ncoefu: int *
ncoefv: int *
ndimax: int *
ncfumx: int *
ncfvmx: int *
tabini: double *
tabres: double *

Return
-------
int

Description
-----------
No available documentation.
") mmfmca8_;
		static int mmfmca8_(const int * ndimen, const int * ncoefu, const int * ncoefv, const int * ndimax, const int * ncfumx, const int * ncfvmx, double * tabini, double * tabres);

		/****** AdvApp2Var_MathBase::mmfmca9_ ******/
		/****** md5 signature: 4e5804c9f790b352bfcc68c5655c3aa8 ******/
		%feature("compactdefaultargs") mmfmca9_;
		%feature("autodoc", "
Parameters
----------
: int *
: int *
: int *
: int *
: int *
: int *
: double *
: double *

Return
-------
int

Description
-----------
No available documentation.
") mmfmca9_;
		static int mmfmca9_(int * , int * , int * , int * , int * , int * , double * , double * );

		/****** AdvApp2Var_MathBase::mmfmcar_ ******/
		/****** md5 signature: 5c13325d7c675cc598883aa075b88d8c ******/
		%feature("compactdefaultargs") mmfmcar_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
ncofmx: int *
ncoefu: int *
ncoefv: int *
patold: double *
upara1: double *
upara2: double *
vpara1: double *
vpara2: double *
patnew: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmfmcar_;
		static int mmfmcar_(int * ndimen, int * ncofmx, int * ncoefu, int * ncoefv, double * patold, double * upara1, double * upara2, double * vpara1, double * vpara2, double * patnew, int * iercod);

		/****** AdvApp2Var_MathBase::mmfmcb5_ ******/
		/****** md5 signature: 14244cb5e07a156e201cb3ed7b738512 ******/
		%feature("compactdefaultargs") mmfmcb5_;
		%feature("autodoc", "
Parameters
----------
: int *
: int *
: int *
: double *
: int *
: int *
: int *
: double *
: int *

Return
-------
int

Description
-----------
No available documentation.
") mmfmcb5_;
		static int mmfmcb5_(int * , int * , int * , double * , int * , int * , int * , double * , int * );

		/****** AdvApp2Var_MathBase::mmfmtb1_ ******/
		/****** md5 signature: 39014ee424b8879f8abc3f92ecf49eb4 ******/
		%feature("compactdefaultargs") mmfmtb1_;
		%feature("autodoc", "
Parameters
----------
maxsz1: int *
table1: double *
isize1: int *
jsize1: int *
maxsz2: int *
table2: double *
isize2: int *
jsize2: int *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmfmtb1_;
		static int mmfmtb1_(int * maxsz1, double * table1, int * isize1, int * jsize1, int * maxsz2, double * table2, int * isize2, int * jsize2, int * iercod);

		/****** AdvApp2Var_MathBase::mmhjcan_ ******/
		/****** md5 signature: 3218598caa79d9fe49eed2bfb1983029 ******/
		%feature("compactdefaultargs") mmhjcan_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
ncourb: int *
ncftab: int *
orcont: int *
ncflim: int *
tcbold: double *
tdecop: double *
tcbnew: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmhjcan_;
		static int mmhjcan_(int * ndimen, int * ncourb, int * ncftab, int * orcont, int * ncflim, double * tcbold, double * tdecop, double * tcbnew, int * iercod);

		/****** AdvApp2Var_MathBase::mminltt_ ******/
		/****** md5 signature: ce2c2a663371be8a1b3296584571a5de ******/
		%feature("compactdefaultargs") mminltt_;
		%feature("autodoc", "
Parameters
----------
ncolmx: int *
nlgnmx: int *
tabtri: double *
nbrcol: int *
nbrlgn: int *
ajoute: double *
epseg: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mminltt_;
		static int mminltt_(int * ncolmx, int * nlgnmx, double * tabtri, int * nbrcol, int * nbrlgn, double * ajoute, double * epseg, int * iercod);

		/****** AdvApp2Var_MathBase::mmjacan_ ******/
		/****** md5 signature: 9176012dc1e9d477e8e42b4ee022ce69 ******/
		%feature("compactdefaultargs") mmjacan_;
		%feature("autodoc", "
Parameters
----------
ideriv: int *
ndeg: int *
poljac: double *
polcan: double *

Return
-------
int

Description
-----------
No available documentation.
") mmjacan_;
		static int mmjacan_(const int * ideriv, int * ndeg, double * poljac, double * polcan);

		/****** AdvApp2Var_MathBase::mmjaccv_ ******/
		/****** md5 signature: bb6ab131b6ff709d8bb68715be26e59b ******/
		%feature("compactdefaultargs") mmjaccv_;
		%feature("autodoc", "
Parameters
----------
ncoef: int *
ndim: int *
ider: int *
crvlgd: double *
polaux: double *
crvcan: double *

Return
-------
int

Description
-----------
No available documentation.
") mmjaccv_;
		static int mmjaccv_(const int * ncoef, const int * ndim, const int * ider, const double * crvlgd, double * polaux, double * crvcan);

		/****** AdvApp2Var_MathBase::mmmpocur_ ******/
		/****** md5 signature: bc86f56efd8cb7764daff022a6f5d5f4 ******/
		%feature("compactdefaultargs") mmmpocur_;
		%feature("autodoc", "
Parameters
----------
ncofmx: int *
ndim: int *
ndeg: int *
courbe: double *
tparam: double *
tabval: double *

Return
-------
int

Description
-----------
No available documentation.
") mmmpocur_;
		static int mmmpocur_(int * ncofmx, int * ndim, int * ndeg, double * courbe, double * tparam, double * tabval);

		/****** AdvApp2Var_MathBase::mmmrslwd_ ******/
		/****** md5 signature: b76ffb81e9a92bd8d5be9dc8c01dbc54 ******/
		%feature("compactdefaultargs") mmmrslwd_;
		%feature("autodoc", "
Parameters
----------
normax: int *
nordre: int *
ndim: int *
amat: double *
bmat: double *
epspiv: double *
aaux: double *
xmat: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmmrslwd_;
		static int mmmrslwd_(int * normax, int * nordre, int * ndim, double * amat, double * bmat, double * epspiv, double * aaux, double * xmat, int * iercod);

		/****** AdvApp2Var_MathBase::mmpobas_ ******/
		/****** md5 signature: c34ce7313c3d7a96d5d9c70005c50517 ******/
		%feature("compactdefaultargs") mmpobas_;
		%feature("autodoc", "
Parameters
----------
tparam: double *
iordre: int *
ncoeff: int *
nderiv: int *
valbas: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmpobas_;
		static int mmpobas_(double * tparam, int * iordre, int * ncoeff, int * nderiv, double * valbas, int * iercod);

		/****** AdvApp2Var_MathBase::mmpocrb_ ******/
		/****** md5 signature: 3b0eed4c5328380d6d92d20a82deaced ******/
		%feature("compactdefaultargs") mmpocrb_;
		%feature("autodoc", "
Parameters
----------
ndimax: int *
ncoeff: int *
courbe: double *
ndim: int *
tparam: double *
pntcrb: double *

Return
-------
int

Description
-----------
No available documentation.
") mmpocrb_;
		static int mmpocrb_(int * ndimax, int * ncoeff, double * courbe, int * ndim, double * tparam, double * pntcrb);

		/****** AdvApp2Var_MathBase::mmposui_ ******/
		/****** md5 signature: 1188905453d803cdb0af4c56e82e831c ******/
		%feature("compactdefaultargs") mmposui_;
		%feature("autodoc", "
Parameters
----------
dimmat: int *
nistoc: int *
aposit: int *
posuiv: int *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmposui_;
		static int mmposui_(int * dimmat, int * nistoc, int * aposit, int * posuiv, int * iercod);

		/****** AdvApp2Var_MathBase::mmresol_ ******/
		/****** md5 signature: edc2966e0efdcc0e2075effde1243370 ******/
		%feature("compactdefaultargs") mmresol_;
		%feature("autodoc", "
Parameters
----------
hdimen: int *
gdimen: int *
hnstoc: int *
gnstoc: int *
mnstoc: int *
matsyh: double *
matsyg: double *
vecsyh: double *
vecsyg: double *
hposit: int *
hposui: int *
gposit: int *
mmposui: int *
mposit: int *
vecsol: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmresol_;
		static int mmresol_(int * hdimen, int * gdimen, int * hnstoc, int * gnstoc, int * mnstoc, double * matsyh, double * matsyg, double * vecsyh, double * vecsyg, int * hposit, int * hposui, int * gposit, int * mmposui, int * mposit, double * vecsol, int * iercod);

		/****** AdvApp2Var_MathBase::mmrtptt_ ******/
		/****** md5 signature: 1c8382cfa0c886b95be01da8f9b77c7d ******/
		%feature("compactdefaultargs") mmrtptt_;
		%feature("autodoc", "
Parameters
----------
ndglgd: int *
rtlegd: double *

Return
-------
int

Description
-----------
No available documentation.
") mmrtptt_;
		static int mmrtptt_(int * ndglgd, double * rtlegd);

		/****** AdvApp2Var_MathBase::mmsrre2_ ******/
		/****** md5 signature: 616ae1f34f26fb0ee2baa84b719b314a ******/
		%feature("compactdefaultargs") mmsrre2_;
		%feature("autodoc", "
Parameters
----------
tparam: double *
nbrval: int *
tablev: double *
epsil: double *
numint: int *
itypen: int *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmsrre2_;
		static int mmsrre2_(double * tparam, int * nbrval, double * tablev, double * epsil, int * numint, int * itypen, int * iercod);

		/****** AdvApp2Var_MathBase::mmtrpjj_ ******/
		/****** md5 signature: 97383d2c05d4bb94a417c6ca54f37f1f ******/
		%feature("compactdefaultargs") mmtrpjj_;
		%feature("autodoc", "
Parameters
----------
ncofmx: int *
ndimen: int *
ncoeff: int *
epsi3d: double *
iordre: int *
crvlgd: double *
ycvmax: double *
errmax: double *
ncfnew: int *

Return
-------
int

Description
-----------
No available documentation.
") mmtrpjj_;
		static int mmtrpjj_(int * ncofmx, int * ndimen, int * ncoeff, double * epsi3d, int * iordre, double * crvlgd, double * ycvmax, double * errmax, int * ncfnew);

		/****** AdvApp2Var_MathBase::mmunivt_ ******/
		/****** md5 signature: 90d0e6d6f04ff0b5a3289857e0851af1 ******/
		%feature("compactdefaultargs") mmunivt_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
vector: double *
vecnrm: double *
epsiln: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmunivt_;
		static int mmunivt_(int * ndimen, double * vector, double * vecnrm, double * epsiln, int * iercod);

		/****** AdvApp2Var_MathBase::mmveps3_ ******/
		/****** md5 signature: 4b0b80b4c9681cd0f2d8f26278764472 ******/
		%feature("compactdefaultargs") mmveps3_;
		%feature("autodoc", "
Parameters
----------
eps03: double *

Return
-------
int

Description
-----------
No available documentation.
") mmveps3_;
		static int mmveps3_(double * eps03);

		/****** AdvApp2Var_MathBase::mmvncol_ ******/
		/****** md5 signature: 776a593fcdf6df89b07924d3118d1a2b ******/
		%feature("compactdefaultargs") mmvncol_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
vecin: double *
vecout: double *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mmvncol_;
		static int mmvncol_(int * ndimen, double * vecin, double * vecout, int * iercod);

		/****** AdvApp2Var_MathBase::mmwprcs_ ******/
		/****** md5 signature: c93cf997c99c3329a0c311f62d3add43 ******/
		%feature("compactdefaultargs") mmwprcs_;
		%feature("autodoc", "
Parameters
----------
: double *
: double *
: double *
: double *
: int *
: int *

Return
-------
None

Description
-----------
No available documentation.
") mmwprcs_;
		static void mmwprcs_(double * , double * , double * , double * , int * , int * );

		/****** AdvApp2Var_MathBase::msc_ ******/
		/****** md5 signature: cc1523f49ddb7c65ee958cd602f4c25b ******/
		%feature("compactdefaultargs") msc_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
vecte1: double *
vecte2: double *

Return
-------
double

Description
-----------
No available documentation.
") msc_;
		static double msc_(int * ndimen, double * vecte1, double * vecte2);

		/****** AdvApp2Var_MathBase::mvsheld_ ******/
		/****** md5 signature: 2fb3caf82333b3791258b069675471b7 ******/
		%feature("compactdefaultargs") mvsheld_;
		%feature("autodoc", "
Parameters
----------
n: int *
is: int *
dtab: double *
icle: int *

Return
-------
int

Description
-----------
No available documentation.
") mvsheld_;
		static int mvsheld_(int * n, int * is, double * dtab, int * icle);

		/****** AdvApp2Var_MathBase::mzsnorm_ ******/
		/****** md5 signature: 47f09e28421f3310f456efa493da71c8 ******/
		%feature("compactdefaultargs") mzsnorm_;
		%feature("autodoc", "
Parameters
----------
ndimen: int *
vecteu: double *

Return
-------
double

Description
-----------
No available documentation.
") mzsnorm_;
		static double mzsnorm_(int * ndimen, double * vecteu);

		/****** AdvApp2Var_MathBase::pow__di ******/
		/****** md5 signature: 10f0464639a5f2507f7f66611d0d308c ******/
		%feature("compactdefaultargs") pow__di;
		%feature("autodoc", "
Parameters
----------
x: double *
n: int *

Return
-------
double

Description
-----------
No available documentation.
") pow__di;
		static double pow__di(double * x, int * n);

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
		/****** md5 signature: a96fe6324d7a7f9f1786325f69a446fb ******/
		%feature("compactdefaultargs") AdvApp2Var_Network;
		%feature("autodoc", "
Parameters
----------
Net: AdvApp2Var_Patch
TheU: TColStd_SequenceOfReal
TheV: TColStd_SequenceOfReal

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Network;
		 AdvApp2Var_Network(const NCollection_Sequence<opencascade::handle<AdvApp2Var_Patch>> & Net, const TColStd_SequenceOfReal & TheU, const TColStd_SequenceOfReal & TheV);

		/****** AdvApp2Var_Network::ChangePatch ******/
		/****** md5 signature: 8777869a74e6cc79cfda0879af40109a ******/
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
		AdvApp2Var_Patch & ChangePatch(const int Index);

		/****** AdvApp2Var_Network::FirstNotApprox ******/
		/****** md5 signature: f10c61c289ba21f2567a850e3ff8e8a9 ******/
		%feature("compactdefaultargs") FirstNotApprox;
		%feature("autodoc", "
Parameters
----------

Return
-------
Index: int

Description
-----------
search the Index of the first Patch not approximated, if all Patches are approximated false is returned.
") FirstNotApprox;
		bool FirstNotApprox(Standard_Integer &OutValue);

		/****** AdvApp2Var_Network::NbPatch ******/
		/****** md5 signature: e855bb5e925ff1a35cd785081d05af41 ******/
		%feature("compactdefaultargs") NbPatch;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPatch;
		int NbPatch();

		/****** AdvApp2Var_Network::NbPatchInU ******/
		/****** md5 signature: 51dec3f7689e0d32e6506986d86bbbdd ******/
		%feature("compactdefaultargs") NbPatchInU;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPatchInU;
		int NbPatchInU();

		/****** AdvApp2Var_Network::NbPatchInV ******/
		/****** md5 signature: 4b9e84f413bb0388c5cc07d4e8eb9ca1 ******/
		%feature("compactdefaultargs") NbPatchInV;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPatchInV;
		int NbPatchInV();

		/****** AdvApp2Var_Network::Patch ******/
		/****** md5 signature: a1b9839e0f55e33f99ccfe66d2a475ec ******/
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
		const AdvApp2Var_Patch & Patch(const int UIndex, const int VIndex);

		/****** AdvApp2Var_Network::SameDegree ******/
		/****** md5 signature: 5221e853da7b2d3b79242942c1f48f39 ******/
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
		void SameDegree(const int iu, const int iv, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** AdvApp2Var_Network::UParameter ******/
		/****** md5 signature: b3de19b3034c4c34dce3e27a388fe5d0 ******/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") UParameter;
		double UParameter(const int Index);

		/****** AdvApp2Var_Network::UpdateInU ******/
		/****** md5 signature: ea19319ce9faa7d1deb1064607f98a7e ******/
		%feature("compactdefaultargs") UpdateInU;
		%feature("autodoc", "
Parameters
----------
CuttingValue: double

Return
-------
None

Description
-----------
No available documentation.
") UpdateInU;
		void UpdateInU(const double CuttingValue);

		/****** AdvApp2Var_Network::UpdateInV ******/
		/****** md5 signature: 06633d1c44e0865bb44110b693c69ae6 ******/
		%feature("compactdefaultargs") UpdateInV;
		%feature("autodoc", "
Parameters
----------
CuttingValue: double

Return
-------
None

Description
-----------
No available documentation.
") UpdateInV;
		void UpdateInV(const double CuttingValue);

		/****** AdvApp2Var_Network::VParameter ******/
		/****** md5 signature: 8ee4c07b3ed30c3da52af7f4385dad5d ******/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") VParameter;
		double VParameter(const int Index);

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
		/****** md5 signature: f9ce7fb3950e932502411a5efb65ba58 ******/
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
		 AdvApp2Var_Node(const int iu, const int iv);

		/****** AdvApp2Var_Node::AdvApp2Var_Node ******/
		/****** md5 signature: 2f161ce1789b20bb5bfa72166c41086c ******/
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
		 AdvApp2Var_Node(const gp_XY & UV, const int iu, const int iv);

		/****** AdvApp2Var_Node::Coord ******/
		/****** md5 signature: 55c3583d2b85a3d85724dfd062f17fa4 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns the coordinates (U,V) of the node.
") Coord;
		const gp_XY Coord();

		/****** AdvApp2Var_Node::Error ******/
		/****** md5 signature: 4d2d5d427e9f1e5fbd6195a8d8cd99f9 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
iu: int
iv: int

Return
-------
double

Description
-----------
returns the error between F(U,V) and its approximation.
") Error;
		double Error(const int iu, const int iv);

		/****** AdvApp2Var_Node::Point ******/
		/****** md5 signature: 693351c0914cdfb228ef74ab753c646f ******/
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
returns the value F(U,V) or its derivates on the node (U,V).
") Point;
		const gp_Pnt Point(const int iu, const int iv);

		/****** AdvApp2Var_Node::SetCoord ******/
		/****** md5 signature: 12ecc6718ce25db2075839c332af379d ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
x1: double
x2: double

Return
-------
None

Description
-----------
changes the coordinates (U,V) to (x1,x2).
") SetCoord;
		void SetCoord(const double x1, const double x2);

		/****** AdvApp2Var_Node::SetError ******/
		/****** md5 signature: 0d2ab373beb2c1443c9e72e65ea5ac53 ******/
		%feature("compactdefaultargs") SetError;
		%feature("autodoc", "
Parameters
----------
iu: int
iv: int
error: double

Return
-------
None

Description
-----------
affects the error between F(U,V) and its approximation.
") SetError;
		void SetError(const int iu, const int iv, const double error);

		/****** AdvApp2Var_Node::SetPoint ******/
		/****** md5 signature: 8403f7e4bf7396378a7a3c5e426fbff0 ******/
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
affects the value F(U,V) or its derivates on the node (U,V).
") SetPoint;
		void SetPoint(const int iu, const int iv, const gp_Pnt & Pt);

		/****** AdvApp2Var_Node::UOrder ******/
		/****** md5 signature: 6a598cc4d811ae3bd62d9f8cb8ee1158 ******/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the continuity order in U of the node.
") UOrder;
		int UOrder();

		/****** AdvApp2Var_Node::VOrder ******/
		/****** md5 signature: 5af1ae568e8d070e2a6da21db174bedd ******/
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the continuity order in V of the node.
") VOrder;
		int VOrder();

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
		/****** md5 signature: 76225ec27eca4a48fffc371b4862fc3f ******/
		%feature("compactdefaultargs") AdvApp2Var_Patch;
		%feature("autodoc", "
Parameters
----------
U0: double
U1: double
V0: double
V1: double
iu: int
iv: int

Return
-------
None

Description
-----------
No available documentation.
") AdvApp2Var_Patch;
		 AdvApp2Var_Patch(const double U0, const double U1, const double V0, const double V1, const int iu, const int iv);

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
		/****** md5 signature: 36ce9209e949c4708372100373b7d4bc ******/
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
		/****** md5 signature: 8874ec13e8c460de18ff2430b274bc80 ******/
		%feature("compactdefaultargs") ChangeDomain;
		%feature("autodoc", "
Parameters
----------
a: double
b: double
c: double
d: double

Return
-------
None

Description
-----------
No available documentation.
") ChangeDomain;
		void ChangeDomain(const double a, const double b, const double c, const double d);

		/****** AdvApp2Var_Patch::ChangeNbCoeff ******/
		/****** md5 signature: 240c41aabe9d5c757453e691a1f6ed9b ******/
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
		void ChangeNbCoeff(const int NbCoeffU, const int NbCoeffV);

		/****** AdvApp2Var_Patch::Coefficients ******/
		/****** md5 signature: f87e6379d7dbef95626b13ee3f67d9e6 ******/
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
		opencascade::handle<TColStd_HArray1OfReal> Coefficients(const int SSPIndex, const AdvApp2Var_Context & Conditions);

		/****** AdvApp2Var_Patch::CritValue ******/
		/****** md5 signature: 26c513c2f190f5ec950cc46ebea9bd3d ******/
		%feature("compactdefaultargs") CritValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") CritValue;
		double CritValue();

		/****** AdvApp2Var_Patch::CutSense ******/
		/****** md5 signature: c2b1f7a57d8e78d53efeea0c13b20ad9 ******/
		%feature("compactdefaultargs") CutSense;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CutSense;
		int CutSense();

		/****** AdvApp2Var_Patch::CutSense ******/
		/****** md5 signature: f1d738194c25847327495041dc6b660a ******/
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
		int CutSense(const AdvApp2Var_Criterion & Crit, const int NumDec);

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
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasResult;
		bool HasResult();

		/****** AdvApp2Var_Patch::IsApproximated ******/
		/****** md5 signature: f9d78180b289ed12c3c5123e8653c6ac ******/
		%feature("compactdefaultargs") IsApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsApproximated;
		bool IsApproximated();

		/****** AdvApp2Var_Patch::IsDiscretised ******/
		/****** md5 signature: 06c41703ab80be83df138f763c3db243 ******/
		%feature("compactdefaultargs") IsDiscretised;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDiscretised;
		bool IsDiscretised();

		/****** AdvApp2Var_Patch::IsoErrors ******/
		/****** md5 signature: ad16cf88f00b6723b3a176e13fa4ac77 ******/
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
		/****** md5 signature: a16912f8e3be775de02093e3fbfffea1 ******/
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
		void MakeApprox(const AdvApp2Var_Context & Conditions, const AdvApp2Var_Framework & Constraints, const int NumDec);

		/****** AdvApp2Var_Patch::MaxErrors ******/
		/****** md5 signature: 735497f4661ac6a814b5e41a2b1defed ******/
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
		/****** md5 signature: 185957825194353a06a658d8c1042fec ******/
		%feature("compactdefaultargs") NbCoeffInU;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCoeffInU;
		int NbCoeffInU();

		/****** AdvApp2Var_Patch::NbCoeffInV ******/
		/****** md5 signature: 26a9814f65d8baf5c62222e25a9b35ed ******/
		%feature("compactdefaultargs") NbCoeffInV;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCoeffInV;
		int NbCoeffInV();

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
		/****** md5 signature: a83fce725ea81ac29fe69b8e68144ea0 ******/
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
		opencascade::handle<TColgp_HArray2OfPnt> Poles(const int SSPIndex, const AdvApp2Var_Context & Conditions);

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
		/****** md5 signature: baa49c91233aa4ba1970d9b53f91ae03 ******/
		%feature("compactdefaultargs") SetCritValue;
		%feature("autodoc", "
Parameters
----------
dist: double

Return
-------
None

Description
-----------
No available documentation.
") SetCritValue;
		void SetCritValue(const double dist);

		/****** AdvApp2Var_Patch::U0 ******/
		/****** md5 signature: 95ecde208467da41aba7298f13d1de1b ******/
		%feature("compactdefaultargs") U0;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") U0;
		double U0();

		/****** AdvApp2Var_Patch::U1 ******/
		/****** md5 signature: 070c473a14c10a26b7ab54c5fbc40e8d ******/
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") U1;
		double U1();

		/****** AdvApp2Var_Patch::UOrder ******/
		/****** md5 signature: 506eb4cd965c491ed72c611f4394bbc9 ******/
		%feature("compactdefaultargs") UOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UOrder;
		int UOrder();

		/****** AdvApp2Var_Patch::V0 ******/
		/****** md5 signature: 88e978f9e67a30d07e8a385680131951 ******/
		%feature("compactdefaultargs") V0;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") V0;
		double V0();

		/****** AdvApp2Var_Patch::V1 ******/
		/****** md5 signature: c5f7a687b57e1de44b0be2372cc617fd ******/
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") V1;
		double V1();

		/****** AdvApp2Var_Patch::VOrder ******/
		/****** md5 signature: 7d8c6b6b638dff0483d77f1fe58907bb ******/
		%feature("compactdefaultargs") VOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VOrder;
		int VOrder();

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
		/****** md5 signature: 8a39c8ae0355e66f70d13f345c6a3166 ******/
		%feature("compactdefaultargs") macrai4_;
		%feature("autodoc", "
Parameters
----------
nbelem: int *
maxelm: int *
itablo: int *
iofset: intptr_t *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") macrai4_;
		int macrai4_(int * nbelem, int * maxelm, int * itablo, intptr_t * iofset, int * iercod);

		/****** AdvApp2Var_SysBase::macrar8_ ******/
		/****** md5 signature: 4f3ea01823a5227478697b69e4c5fe61 ******/
		%feature("compactdefaultargs") macrar8_;
		%feature("autodoc", "
Parameters
----------
nbelem: int *
maxelm: int *
xtablo: double *
iofset: intptr_t *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") macrar8_;
		int macrar8_(int * nbelem, int * maxelm, double * xtablo, intptr_t * iofset, int * iercod);

		/****** AdvApp2Var_SysBase::macrdi4_ ******/
		/****** md5 signature: c0bc5aff59cf6928a340139ddda17607 ******/
		%feature("compactdefaultargs") macrdi4_;
		%feature("autodoc", "
Parameters
----------
nbelem: int *
maxelm: int *
itablo: int *
iofset: intptr_t *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") macrdi4_;
		int macrdi4_(int * nbelem, int * maxelm, int * itablo, intptr_t * iofset, int * iercod);

		/****** AdvApp2Var_SysBase::macrdr8_ ******/
		/****** md5 signature: 5e531d9ff66ec0bbe2aafc165cbe72fc ******/
		%feature("compactdefaultargs") macrdr8_;
		%feature("autodoc", "
Parameters
----------
nbelem: int *
maxelm: int *
xtablo: double *
iofset: intptr_t *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") macrdr8_;
		int macrdr8_(int * nbelem, int * maxelm, double * xtablo, intptr_t * iofset, int * iercod);

		/****** AdvApp2Var_SysBase::maermsg_ ******/
		/****** md5 signature: 05454a85096d4391cf019aa142a33873 ******/
		%feature("compactdefaultargs") maermsg_;
		%feature("autodoc", "
Parameters
----------
cnompg: char *
icoder: int *
cnompg_len: long

Return
-------
int

Description
-----------
No available documentation.
") maermsg_;
		static int maermsg_(const char * cnompg, int * icoder, long cnompg_len);

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
		/****** md5 signature: 782ec8be6d4fa715ffbb0484188f5135 ******/
		%feature("compactdefaultargs") maitbr8_;
		%feature("autodoc", "
Parameters
----------
itaill: int *
xtab: double *
xval: double *

Return
-------
int

Description
-----------
No available documentation.
") maitbr8_;
		static int maitbr8_(int * itaill, double * xtab, double * xval);

		/****** AdvApp2Var_SysBase::maovsr8_ ******/
		/****** md5 signature: 6fca0801fb38b39f53ac4899666aa7b0 ******/
		%feature("compactdefaultargs") maovsr8_;
		%feature("autodoc", "
Parameters
----------
ivalcs: int *

Return
-------
int

Description
-----------
No available documentation.
") maovsr8_;
		static int maovsr8_(int * ivalcs);

		/****** AdvApp2Var_SysBase::mcrdelt_ ******/
		/****** md5 signature: e947dae46c47f4f091c74e2882c08438 ******/
		%feature("compactdefaultargs") mcrdelt_;
		%feature("autodoc", "
Parameters
----------
iunit: int *
isize: int *
t: void *
iofset: intptr_t *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mcrdelt_;
		int mcrdelt_(int * iunit, int * isize, void * t, intptr_t * iofset, int * iercod);

		/****** AdvApp2Var_SysBase::mcrfill_ ******/
		/****** md5 signature: e868d474dcc031180cb815e4a4eeb79e ******/
		%feature("compactdefaultargs") mcrfill_;
		%feature("autodoc", "
Parameters
----------
size: int *
tin: void *
tout: void *

Return
-------
int

Description
-----------
No available documentation.
") mcrfill_;
		static int mcrfill_(int * size, void * tin, void * tout);

		/****** AdvApp2Var_SysBase::mcrrqst_ ******/
		/****** md5 signature: 5054d1e6d572d91bc7eddf89c0712b11 ******/
		%feature("compactdefaultargs") mcrrqst_;
		%feature("autodoc", "
Parameters
----------
iunit: int *
isize: int *
t: void *
iofset: intptr_t *
iercod: int *

Return
-------
int

Description
-----------
No available documentation.
") mcrrqst_;
		int mcrrqst_(int * iunit, int * isize, void * t, intptr_t * iofset, int * iercod);

		/****** AdvApp2Var_SysBase::mgenmsg_ ******/
		/****** md5 signature: e5aa78aa9aa2e41d09e4949ac64e3c5b ******/
		%feature("compactdefaultargs") mgenmsg_;
		%feature("autodoc", "
Parameters
----------
nomprg: char *
nomprg_len: long

Return
-------
int

Description
-----------
No available documentation.
") mgenmsg_;
		static int mgenmsg_(const char * nomprg, long nomprg_len);

		/****** AdvApp2Var_SysBase::mgsomsg_ ******/
		/****** md5 signature: 0cf14f0ee66d1cfb3f579cf7e91fec1d ******/
		%feature("compactdefaultargs") mgsomsg_;
		%feature("autodoc", "
Parameters
----------
nomprg: char *
nomprg_len: long

Return
-------
int

Description
-----------
No available documentation.
") mgsomsg_;
		static int mgsomsg_(const char * nomprg, long nomprg_len);

		/****** AdvApp2Var_SysBase::miraz_ ******/
		/****** md5 signature: 3ab6d01e654ff409018da68cb1f58b27 ******/
		%feature("compactdefaultargs") miraz_;
		%feature("autodoc", "
Parameters
----------
taille: int *
adt: void *

Return
-------
None

Description
-----------
No available documentation.
") miraz_;
		static void miraz_(int * taille, void * adt);

		/****** AdvApp2Var_SysBase::mnfndeb_ ******/
		/****** md5 signature: 4870de2bb6fb4ee113f7d071794b6785 ******/
		%feature("compactdefaultargs") mnfndeb_;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") mnfndeb_;
		static int mnfndeb_();

		/****** AdvApp2Var_SysBase::msifill_ ******/
		/****** md5 signature: 97e81a8cf83e737788eb9654d19c9d49 ******/
		%feature("compactdefaultargs") msifill_;
		%feature("autodoc", "
Parameters
----------
nbintg: int *
ivecin: int *
ivecou: int *

Return
-------
int

Description
-----------
No available documentation.
") msifill_;
		static int msifill_(int * nbintg, int * ivecin, int * ivecou);

		/****** AdvApp2Var_SysBase::msrfill_ ******/
		/****** md5 signature: 9c680eb13d24a2983dc09a9d8c0e975d ******/
		%feature("compactdefaultargs") msrfill_;
		%feature("autodoc", "
Parameters
----------
nbreel: int *
vecent: double *
vecsor: double *

Return
-------
int

Description
-----------
No available documentation.
") msrfill_;
		static int msrfill_(int * nbreel, double * vecent, double * vecsor);

		/****** AdvApp2Var_SysBase::mswrdbg_ ******/
		/****** md5 signature: bd9d3a2e01061e912f035c4ecd3608be ******/
		%feature("compactdefaultargs") mswrdbg_;
		%feature("autodoc", "
Parameters
----------
ctexte: char *
ctexte_len: long

Return
-------
int

Description
-----------
No available documentation.
") mswrdbg_;
		static int mswrdbg_(const char * ctexte, long ctexte_len);

		/****** AdvApp2Var_SysBase::mvriraz_ ******/
		/****** md5 signature: 90596b4a7eb7cde1ab32119f9f17b40f ******/
		%feature("compactdefaultargs") mvriraz_;
		%feature("autodoc", "
Parameters
----------
taille: int *
adt: void *

Return
-------
None

Description
-----------
No available documentation.
") mvriraz_;
		static void mvriraz_(int * taille, void * adt);

};


%extend AdvApp2Var_SysBase {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

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
