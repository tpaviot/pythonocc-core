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
%define HLRALGODOCSTRING
"HLRAlgo module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_hlralgo.html"
%enddef
%module (package="OCC.Core", docstring=HLRALGODOCSTRING) HLRAlgo


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
#include<HLRAlgo_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopAbs_module.hxx>
#include<Bnd_module.hxx>
#include<gp_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopAbs.i
%import Bnd.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum HLRAlgo_PolyMask {
	HLRAlgo_PolyMask_EMskOutLin1 = 1,
	HLRAlgo_PolyMask_EMskOutLin2 = 2,
	HLRAlgo_PolyMask_EMskOutLin3 = 4,
	HLRAlgo_PolyMask_EMskGrALin1 = 8,
	HLRAlgo_PolyMask_EMskGrALin2 = 16,
	HLRAlgo_PolyMask_EMskGrALin3 = 32,
	HLRAlgo_PolyMask_FMskBack = 64,
	HLRAlgo_PolyMask_FMskSide = 128,
	HLRAlgo_PolyMask_FMskHiding = 256,
	HLRAlgo_PolyMask_FMskFlat = 512,
	HLRAlgo_PolyMask_FMskOnOutL = 1024,
	HLRAlgo_PolyMask_FMskOrBack = 2048,
	HLRAlgo_PolyMask_FMskFrBack = 4096,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class HLRAlgo_PolyMask(IntEnum):
	HLRAlgo_PolyMask_EMskOutLin1 = 1
	HLRAlgo_PolyMask_EMskOutLin2 = 2
	HLRAlgo_PolyMask_EMskOutLin3 = 4
	HLRAlgo_PolyMask_EMskGrALin1 = 8
	HLRAlgo_PolyMask_EMskGrALin2 = 16
	HLRAlgo_PolyMask_EMskGrALin3 = 32
	HLRAlgo_PolyMask_FMskBack = 64
	HLRAlgo_PolyMask_FMskSide = 128
	HLRAlgo_PolyMask_FMskHiding = 256
	HLRAlgo_PolyMask_FMskFlat = 512
	HLRAlgo_PolyMask_FMskOnOutL = 1024
	HLRAlgo_PolyMask_FMskOrBack = 2048
	HLRAlgo_PolyMask_FMskFrBack = 4096
HLRAlgo_PolyMask_EMskOutLin1 = HLRAlgo_PolyMask.HLRAlgo_PolyMask_EMskOutLin1
HLRAlgo_PolyMask_EMskOutLin2 = HLRAlgo_PolyMask.HLRAlgo_PolyMask_EMskOutLin2
HLRAlgo_PolyMask_EMskOutLin3 = HLRAlgo_PolyMask.HLRAlgo_PolyMask_EMskOutLin3
HLRAlgo_PolyMask_EMskGrALin1 = HLRAlgo_PolyMask.HLRAlgo_PolyMask_EMskGrALin1
HLRAlgo_PolyMask_EMskGrALin2 = HLRAlgo_PolyMask.HLRAlgo_PolyMask_EMskGrALin2
HLRAlgo_PolyMask_EMskGrALin3 = HLRAlgo_PolyMask.HLRAlgo_PolyMask_EMskGrALin3
HLRAlgo_PolyMask_FMskBack = HLRAlgo_PolyMask.HLRAlgo_PolyMask_FMskBack
HLRAlgo_PolyMask_FMskSide = HLRAlgo_PolyMask.HLRAlgo_PolyMask_FMskSide
HLRAlgo_PolyMask_FMskHiding = HLRAlgo_PolyMask.HLRAlgo_PolyMask_FMskHiding
HLRAlgo_PolyMask_FMskFlat = HLRAlgo_PolyMask.HLRAlgo_PolyMask_FMskFlat
HLRAlgo_PolyMask_FMskOnOutL = HLRAlgo_PolyMask.HLRAlgo_PolyMask_FMskOnOutL
HLRAlgo_PolyMask_FMskOrBack = HLRAlgo_PolyMask.HLRAlgo_PolyMask_FMskOrBack
HLRAlgo_PolyMask_FMskFrBack = HLRAlgo_PolyMask.HLRAlgo_PolyMask_FMskFrBack
};
/* end python proxy for enums */

/* handles */
%wrap_handle(HLRAlgo_EdgesBlock)
%wrap_handle(HLRAlgo_PolyAlgo)
%wrap_handle(HLRAlgo_PolyData)
%wrap_handle(HLRAlgo_PolyInternalData)
%wrap_handle(HLRAlgo_PolyInternalNode)
%wrap_handle(HLRAlgo_PolyShellData)
%wrap_handle(HLRAlgo_WiresBlock)
/* end handles declaration */

/* templates */
%template(HLRAlgo_Array1OfPHDat) NCollection_Array1<HLRAlgo_PolyHidingData>;
Array1ExtendIter(HLRAlgo_PolyHidingData)

%template(HLRAlgo_Array1OfPINod) NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>>;
Array1ExtendIter(opencascade::handle<HLRAlgo_PolyInternalNode>)

%template(HLRAlgo_Array1OfPISeg) NCollection_Array1<HLRAlgo_PolyInternalSegment>;
Array1ExtendIter(HLRAlgo_PolyInternalSegment)

%template(HLRAlgo_Array1OfTData) NCollection_Array1<HLRAlgo_TriangleData>;
Array1ExtendIter(HLRAlgo_TriangleData)

%template(HLRAlgo_InterferenceList) NCollection_List<HLRAlgo_Interference>;

%extend NCollection_List<HLRAlgo_Interference> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(HLRAlgo_ListIteratorOfInterferenceList) NCollection_TListIterator<HLRAlgo_Interference>;
%template(HLRAlgo_ListIteratorOfListOfBPoint) NCollection_TListIterator<HLRAlgo_BiPoint>;
%template(HLRAlgo_ListOfBPoint) NCollection_List<HLRAlgo_BiPoint>;

%extend NCollection_List<HLRAlgo_BiPoint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<HLRAlgo_PolyHidingData> HLRAlgo_Array1OfPHDat;
typedef NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>> HLRAlgo_Array1OfPINod;
typedef NCollection_Array1<HLRAlgo_PolyInternalSegment> HLRAlgo_Array1OfPISeg;
typedef NCollection_Array1<HLRAlgo_TriangleData> HLRAlgo_Array1OfTData;
typedef NCollection_HArray1<HLRAlgo_PolyHidingData> HLRAlgo_HArray1OfPHDat;
typedef NCollection_HArray1<opencascade::handle<HLRAlgo_PolyInternalNode>> HLRAlgo_HArray1OfPINod;
typedef NCollection_HArray1<HLRAlgo_PolyInternalSegment> HLRAlgo_HArray1OfPISeg;
typedef NCollection_HArray1<HLRAlgo_TriangleData> HLRAlgo_HArray1OfTData;
typedef NCollection_List<HLRAlgo_Interference> HLRAlgo_InterferenceList;
typedef NCollection_List<HLRAlgo_Interference>::Iterator HLRAlgo_ListIteratorOfInterferenceList;
typedef NCollection_List<HLRAlgo_BiPoint>::Iterator HLRAlgo_ListIteratorOfListOfBPoint;
typedef NCollection_List<HLRAlgo_BiPoint> HLRAlgo_ListOfBPoint;
/* end typedefs declaration */

/****************
* class HLRAlgo *
****************/
%rename(hlralgo) HLRAlgo;
class HLRAlgo {
	public:
		/****** HLRAlgo::AddMinMax ******/
		/****** md5 signature: f8c62d66c5b73a298c56e89d663989f1 ******/
		%feature("compactdefaultargs") AddMinMax;
		%feature("autodoc", "
Parameters
----------
IMin: HLRAlgo_EdgesBlock::MinMaxIndices
IMax: HLRAlgo_EdgesBlock::MinMaxIndices
OMin: HLRAlgo_EdgesBlock::MinMaxIndices
OMax: HLRAlgo_EdgesBlock::MinMaxIndices

Return
-------
None

Description
-----------
No available documentation.
") AddMinMax;
		static void AddMinMax(HLRAlgo_EdgesBlock::MinMaxIndices & IMin, HLRAlgo_EdgesBlock::MinMaxIndices & IMax, HLRAlgo_EdgesBlock::MinMaxIndices & OMin, HLRAlgo_EdgesBlock::MinMaxIndices & OMax);

		/****** HLRAlgo::CopyMinMax ******/
		/****** md5 signature: c945d8e20998d154e02bac1063159ad1 ******/
		%feature("compactdefaultargs") CopyMinMax;
		%feature("autodoc", "
Parameters
----------
IMin: HLRAlgo_EdgesBlock::MinMaxIndices
IMax: HLRAlgo_EdgesBlock::MinMaxIndices
OMin: HLRAlgo_EdgesBlock::MinMaxIndices
OMax: HLRAlgo_EdgesBlock::MinMaxIndices

Return
-------
None

Description
-----------
No available documentation.
") CopyMinMax;
		static void CopyMinMax(HLRAlgo_EdgesBlock::MinMaxIndices & IMin, HLRAlgo_EdgesBlock::MinMaxIndices & IMax, HLRAlgo_EdgesBlock::MinMaxIndices & OMin, HLRAlgo_EdgesBlock::MinMaxIndices & OMax);

		/****** HLRAlgo::DecodeMinMax ******/
		/****** md5 signature: 762fb56a23d8512be22907c87b344287 ******/
		%feature("compactdefaultargs") DecodeMinMax;
		%feature("autodoc", "
Parameters
----------
MinMax: HLRAlgo_EdgesBlock::MinMaxIndices
Min: HLRAlgo_EdgesBlock::MinMaxIndices
Max: HLRAlgo_EdgesBlock::MinMaxIndices

Return
-------
None

Description
-----------
No available documentation.
") DecodeMinMax;
		static void DecodeMinMax(const HLRAlgo_EdgesBlock::MinMaxIndices & MinMax, HLRAlgo_EdgesBlock::MinMaxIndices & Min, HLRAlgo_EdgesBlock::MinMaxIndices & Max);

		/****** HLRAlgo::EncodeMinMax ******/
		/****** md5 signature: 416ede2a1d52e0d718951c7479f53cf9 ******/
		%feature("compactdefaultargs") EncodeMinMax;
		%feature("autodoc", "
Parameters
----------
Min: HLRAlgo_EdgesBlock::MinMaxIndices
Max: HLRAlgo_EdgesBlock::MinMaxIndices
MinMax: HLRAlgo_EdgesBlock::MinMaxIndices

Return
-------
None

Description
-----------
No available documentation.
") EncodeMinMax;
		static void EncodeMinMax(HLRAlgo_EdgesBlock::MinMaxIndices & Min, HLRAlgo_EdgesBlock::MinMaxIndices & Max, HLRAlgo_EdgesBlock::MinMaxIndices & MinMax);

		/****** HLRAlgo::EnlargeMinMax ******/
		/****** md5 signature: b7acf0d6a18b400218f0adcf96380a0c ******/
		%feature("compactdefaultargs") EnlargeMinMax;
		%feature("autodoc", "
Parameters
----------
tol: double
Min: double
Max: double

Return
-------
None

Description
-----------
No available documentation.
") EnlargeMinMax;
		static void EnlargeMinMax(const double tol, double Min[16], double Max[16]);

		/****** HLRAlgo::InitMinMax ******/
		/****** md5 signature: 2bac3d22c3d13863f425c23379c2031c ******/
		%feature("compactdefaultargs") InitMinMax;
		%feature("autodoc", "
Parameters
----------
Big: double
Min: double
Max: double

Return
-------
None

Description
-----------
No available documentation.
") InitMinMax;
		static void InitMinMax(const double Big, double Min[16], double Max[16]);

		/****** HLRAlgo::SizeBox ******/
		/****** md5 signature: 126eb29e273ed2fad4addd1ae3f2a535 ******/
		%feature("compactdefaultargs") SizeBox;
		%feature("autodoc", "
Parameters
----------
Min: HLRAlgo_EdgesBlock::MinMaxIndices
Max: HLRAlgo_EdgesBlock::MinMaxIndices

Return
-------
double

Description
-----------
No available documentation.
") SizeBox;
		static double SizeBox(HLRAlgo_EdgesBlock::MinMaxIndices & Min, HLRAlgo_EdgesBlock::MinMaxIndices & Max);

		/****** HLRAlgo::UpdateMinMax ******/
		/****** md5 signature: bd8d617dda77ec3c5776bb5c909fe807 ******/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "
Parameters
----------
x: double
y: double
z: double
Min: double
Max: double

Return
-------
None

Description
-----------
Iterator on the visible or hidden parts of an EdgeStatus.
") UpdateMinMax;
		static void UpdateMinMax(const double x, const double y, const double z, double Min[16], double Max[16]);

};


%extend HLRAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class HLRAlgo_BiPoint *
************************/
class HLRAlgo_BiPoint {
	public:
		class IndicesT {};
		class PointsT {};
		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: 91aea238c574f0670b5110a680fc5e85 ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint();

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: 07abb7e5d903eb1d8f688b12afd0ffb7 ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: double
Y1: double
Z1: double
X2: double
Y2: double
Z2: double
XT1: double
YT1: double
ZT1: double
XT2: double
YT2: double
ZT2: double
Index: int
reg1: bool
regn: bool
outl: bool
intl: bool

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const double X1, const double Y1, const double Z1, const double X2, const double Y2, const double Z2, const double XT1, const double YT1, const double ZT1, const double XT2, const double YT2, const double ZT2, const int Index, const bool reg1, const bool regn, const bool outl, const bool intl);

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: ac1367791e7eb14c120fb3c4854a1956 ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: double
Y1: double
Z1: double
X2: double
Y2: double
Z2: double
XT1: double
YT1: double
ZT1: double
XT2: double
YT2: double
ZT2: double
Index: int
flag: int

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const double X1, const double Y1, const double Z1, const double X2, const double Y2, const double Z2, const double XT1, const double YT1, const double ZT1, const double XT2, const double YT2, const double ZT2, const int Index, const int flag);

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: 71b3f56a371cef22e25b8b75bee902eb ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: double
Y1: double
Z1: double
X2: double
Y2: double
Z2: double
XT1: double
YT1: double
ZT1: double
XT2: double
YT2: double
ZT2: double
Index: int
i1: int
i1p1: int
i1p2: int
reg1: bool
regn: bool
outl: bool
intl: bool

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const double X1, const double Y1, const double Z1, const double X2, const double Y2, const double Z2, const double XT1, const double YT1, const double ZT1, const double XT2, const double YT2, const double ZT2, const int Index, const int i1, const int i1p1, const int i1p2, const bool reg1, const bool regn, const bool outl, const bool intl);

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: f655455753af2dfc110ea0285a685212 ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: double
Y1: double
Z1: double
X2: double
Y2: double
Z2: double
XT1: double
YT1: double
ZT1: double
XT2: double
YT2: double
ZT2: double
Index: int
i1: int
i1p1: int
i1p2: int
flag: int

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const double X1, const double Y1, const double Z1, const double X2, const double Y2, const double Z2, const double XT1, const double YT1, const double ZT1, const double XT2, const double YT2, const double ZT2, const int Index, const int i1, const int i1p1, const int i1p2, const int flag);

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: cbc782e2d20b3ea03a828aa63fef8ee8 ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: double
Y1: double
Z1: double
X2: double
Y2: double
Z2: double
XT1: double
YT1: double
ZT1: double
XT2: double
YT2: double
ZT2: double
Index: int
i1: int
i1p1: int
i1p2: int
i2: int
i2p1: int
i2p2: int
reg1: bool
regn: bool
outl: bool
intl: bool

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const double X1, const double Y1, const double Z1, const double X2, const double Y2, const double Z2, const double XT1, const double YT1, const double ZT1, const double XT2, const double YT2, const double ZT2, const int Index, const int i1, const int i1p1, const int i1p2, const int i2, const int i2p1, const int i2p2, const bool reg1, const bool regn, const bool outl, const bool intl);

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: a9a5530f5346b601332bf17883180992 ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: double
Y1: double
Z1: double
X2: double
Y2: double
Z2: double
XT1: double
YT1: double
ZT1: double
XT2: double
YT2: double
ZT2: double
Index: int
i1: int
i1p1: int
i1p2: int
i2: int
i2p1: int
i2p2: int
flag: int

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const double X1, const double Y1, const double Z1, const double X2, const double Y2, const double Z2, const double XT1, const double YT1, const double ZT1, const double XT2, const double YT2, const double ZT2, const int Index, const int i1, const int i1p1, const int i1p2, const int i2, const int i2p1, const int i2p2, const int flag);

		/****** HLRAlgo_BiPoint::Hidden ******/
		/****** md5 signature: 4a52f7e7fa2f144a4861edbf89396c4f ******/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Hidden;
		bool Hidden();

		/****** HLRAlgo_BiPoint::Hidden ******/
		/****** md5 signature: 628456a72e36ae958539bb80f24d36a5 ******/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") Hidden;
		void Hidden(const bool B);

		/****** HLRAlgo_BiPoint::IntLine ******/
		/****** md5 signature: c9edcd05c0ec34762bc524e689d9f660 ******/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IntLine;
		bool IntLine();

		/****** HLRAlgo_BiPoint::IntLine ******/
		/****** md5 signature: f256923667b92d1083769dbd58725016 ******/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") IntLine;
		void IntLine(const bool B);

		/****** HLRAlgo_BiPoint::OutLine ******/
		/****** md5 signature: 42477242ba91d27bc1eca8a82bfa084d ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLine;
		bool OutLine();

		/****** HLRAlgo_BiPoint::OutLine ******/
		/****** md5 signature: f28eafd4b7d27aa4a239d843dbdb30c1 ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") OutLine;
		void OutLine(const bool B);

		/****** HLRAlgo_BiPoint::Rg1Line ******/
		/****** md5 signature: 2fe8ba46c5783bf24f6be03f02a12483 ******/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Rg1Line;
		bool Rg1Line();

		/****** HLRAlgo_BiPoint::Rg1Line ******/
		/****** md5 signature: 42a79575c6aef6c3cb7b530ee0aad078 ******/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") Rg1Line;
		void Rg1Line(const bool B);

		/****** HLRAlgo_BiPoint::RgNLine ******/
		/****** md5 signature: 4d91c982e83f116a8b076b5c72ecd8df ******/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") RgNLine;
		bool RgNLine();

		/****** HLRAlgo_BiPoint::RgNLine ******/
		/****** md5 signature: f244442396bb29b5e7c9917acbcf1d62 ******/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") RgNLine;
		void RgNLine(const bool B);

};


%extend HLRAlgo_BiPoint {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Indices(self):
		pass

	@methodnotwrapped
	def Points(self):
		pass
	}
};

/****************************
* class HLRAlgo_Coincidence *
****************************/
class HLRAlgo_Coincidence {
	public:
		/****** HLRAlgo_Coincidence::HLRAlgo_Coincidence ******/
		/****** md5 signature: aa06ac22acb71819bf2eda53bcf6183e ******/
		%feature("compactdefaultargs") HLRAlgo_Coincidence;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_Coincidence;
		 HLRAlgo_Coincidence();

		/****** HLRAlgo_Coincidence::Set2D ******/
		/****** md5 signature: 5cbc4e5388d2a1dcdad75b621c9a13ce ******/
		%feature("compactdefaultargs") Set2D;
		%feature("autodoc", "
Parameters
----------
FE: int
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set2D;
		void Set2D(const int FE, const double Param);

		/****** HLRAlgo_Coincidence::SetState3D ******/
		/****** md5 signature: 98648fa1b750de4495372d866bcef275 ******/
		%feature("compactdefaultargs") SetState3D;
		%feature("autodoc", "
Parameters
----------
stbef: TopAbs_State
staft: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") SetState3D;
		void SetState3D(const TopAbs_State stbef, const TopAbs_State staft);

		/****** HLRAlgo_Coincidence::State3D ******/
		/****** md5 signature: a82805dd78c6a2dc3d3b8f480f5e55b0 ******/
		%feature("compactdefaultargs") State3D;
		%feature("autodoc", "
Parameters
----------

Return
-------
stbef: TopAbs_State
staft: TopAbs_State

Description
-----------
No available documentation.
") State3D;
		void State3D(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** HLRAlgo_Coincidence::Value2D ******/
		/****** md5 signature: e4af4f8779bcb5a87856b8367246d4d3 ******/
		%feature("compactdefaultargs") Value2D;
		%feature("autodoc", "
Parameters
----------

Return
-------
FE: int
Param: double

Description
-----------
No available documentation.
") Value2D;
		void Value2D(Standard_Integer &OutValue, Standard_Real &OutValue);

};


%extend HLRAlgo_Coincidence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRAlgo_EdgeIterator *
*****************************/
class HLRAlgo_EdgeIterator {
	public:
		/****** HLRAlgo_EdgeIterator::HLRAlgo_EdgeIterator ******/
		/****** md5 signature: 1b451da77240c28cae818de181ccc2d5 ******/
		%feature("compactdefaultargs") HLRAlgo_EdgeIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Iterator on the visible or hidden parts of an edge.
") HLRAlgo_EdgeIterator;
		 HLRAlgo_EdgeIterator();

		/****** HLRAlgo_EdgeIterator::Hidden ******/
		/****** md5 signature: bbde5c8b2fce1ec6571a17a4ad2f420e ******/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "
Parameters
----------

Return
-------
Start: double
TolStart: float
End: double
TolEnd: float

Description
-----------
Returns the bounds and the tolerances of the current Hidden Interval.
") Hidden;
		void Hidden(Standard_Real &OutValue, Standard_ShortReal &OutValue, Standard_Real &OutValue, Standard_ShortReal &OutValue);

		/****** HLRAlgo_EdgeIterator::InitHidden ******/
		/****** md5 signature: 94f1415b23db23cda63dd5f0d3b0a1c8 ******/
		%feature("compactdefaultargs") InitHidden;
		%feature("autodoc", "
Parameters
----------
status: HLRAlgo_EdgeStatus

Return
-------
None

Description
-----------
No available documentation.
") InitHidden;
		void InitHidden(HLRAlgo_EdgeStatus & status);

		/****** HLRAlgo_EdgeIterator::InitVisible ******/
		/****** md5 signature: d4ae2184eb5fb24653da2206f8c49725 ******/
		%feature("compactdefaultargs") InitVisible;
		%feature("autodoc", "
Parameters
----------
status: HLRAlgo_EdgeStatus

Return
-------
None

Description
-----------
No available documentation.
") InitVisible;
		void InitVisible(HLRAlgo_EdgeStatus & status);

		/****** HLRAlgo_EdgeIterator::MoreHidden ******/
		/****** md5 signature: b1b35ce90b158cbbad012e8a7724583d ******/
		%feature("compactdefaultargs") MoreHidden;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreHidden;
		bool MoreHidden();

		/****** HLRAlgo_EdgeIterator::MoreVisible ******/
		/****** md5 signature: 4ec4c68284a05299b93e00ede44db1af ******/
		%feature("compactdefaultargs") MoreVisible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVisible;
		bool MoreVisible();

		/****** HLRAlgo_EdgeIterator::NextHidden ******/
		/****** md5 signature: e264eab7635073c92511d973f449cac3 ******/
		%feature("compactdefaultargs") NextHidden;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextHidden;
		void NextHidden();

		/****** HLRAlgo_EdgeIterator::NextVisible ******/
		/****** md5 signature: 58f9164627fb81fb53c82fbb8a4e698b ******/
		%feature("compactdefaultargs") NextVisible;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextVisible;
		void NextVisible();

		/****** HLRAlgo_EdgeIterator::Visible ******/
		/****** md5 signature: bc3e2ee3f919a9d155cd8742fa167c6d ******/
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", "
Parameters
----------

Return
-------
Start: double
TolStart: float
End: double
TolEnd: float

Description
-----------
Returns the bounds and the tolerances of the current Visible Interval.
") Visible;
		void Visible(Standard_Real &OutValue, Standard_ShortReal &OutValue, Standard_Real &OutValue, Standard_ShortReal &OutValue);

};


%extend HLRAlgo_EdgeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class HLRAlgo_EdgeStatus *
***************************/
class HLRAlgo_EdgeStatus {
	public:
		/****** HLRAlgo_EdgeStatus::HLRAlgo_EdgeStatus ******/
		/****** md5 signature: 9a9a4bb03a81798a20dc91803511d2db ******/
		%feature("compactdefaultargs") HLRAlgo_EdgeStatus;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus();

		/****** HLRAlgo_EdgeStatus::HLRAlgo_EdgeStatus ******/
		/****** md5 signature: a9158626ec8b31c14e3423617dd37b90 ******/
		%feature("compactdefaultargs") HLRAlgo_EdgeStatus;
		%feature("autodoc", "
Parameters
----------
Start: double
TolStart: float
End: double
TolEnd: float

Return
-------
None

Description
-----------
Creates a new EdgeStatus. Default visible. The Edge is bounded by the interval <Start>, <End> with the tolerances <TolStart>, <TolEnd>.
") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus(const double Start, const float TolStart, const double End, const float TolEnd);

		/****** HLRAlgo_EdgeStatus::AllHidden ******/
		/****** md5 signature: df5c7dd2ff5c0b17a0883b1ff3ea85ea ******/
		%feature("compactdefaultargs") AllHidden;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AllHidden;
		bool AllHidden();

		/****** HLRAlgo_EdgeStatus::AllHidden ******/
		/****** md5 signature: 83c4779ebbffa74ed15c5ca651aeddd1 ******/
		%feature("compactdefaultargs") AllHidden;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") AllHidden;
		void AllHidden(const bool B);

		/****** HLRAlgo_EdgeStatus::AllVisible ******/
		/****** md5 signature: 4bab10fcd0e493d4ed022b55a189aaa5 ******/
		%feature("compactdefaultargs") AllVisible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AllVisible;
		bool AllVisible();

		/****** HLRAlgo_EdgeStatus::AllVisible ******/
		/****** md5 signature: 42edbcee6738137bdb1fd20bac632b97 ******/
		%feature("compactdefaultargs") AllVisible;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") AllVisible;
		void AllVisible(const bool B);

		/****** HLRAlgo_EdgeStatus::Bounds ******/
		/****** md5 signature: 8a50db3eac1d5413c4019ef5f48b8f08 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStart: double
theTolStart: float
theEnd: double
theTolEnd: float

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_ShortReal &OutValue, Standard_Real &OutValue, Standard_ShortReal &OutValue);

		/****** HLRAlgo_EdgeStatus::Hide ******/
		/****** md5 signature: 15b738dc9e16c2605465635d177c2f29 ******/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "
Parameters
----------
Start: double
TolStart: float
End: double
TolEnd: float
OnFace: bool
OnBoundary: bool

Return
-------
None

Description
-----------
Hides the interval <Start>, <End> with the tolerances <TolStart>, <TolEnd>. This interval is subtracted from the visible parts. If the hidden part is on (or under) the face the flag <OnFace> is True (or False). If the hidden part is on (or inside) the boundary of the face the flag <OnBoundary> is True (or False).
") Hide;
		void Hide(const double Start, const float TolStart, const double End, const float TolEnd, const bool OnFace, const bool OnBoundary);

		/****** HLRAlgo_EdgeStatus::HideAll ******/
		/****** md5 signature: b17bc2d765e07d0c3a7ff1493933dbbf ******/
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Hide the whole Edge.
") HideAll;
		void HideAll();

		/****** HLRAlgo_EdgeStatus::Initialize ******/
		/****** md5 signature: 23c1b9607d7214380c18237c526277b8 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
Start: double
TolStart: float
End: double
TolEnd: float

Return
-------
None

Description
-----------
Initialize an EdgeStatus. Default visible. The Edge is bounded by the interval <Start>, <End> with the tolerances <TolStart>, <TolEnd>.
") Initialize;
		void Initialize(const double Start, const float TolStart, const double End, const float TolEnd);

		/****** HLRAlgo_EdgeStatus::NbVisiblePart ******/
		/****** md5 signature: e2cd2fa0fc1dafb7582d28f78c900e42 ******/
		%feature("compactdefaultargs") NbVisiblePart;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVisiblePart;
		int NbVisiblePart();

		/****** HLRAlgo_EdgeStatus::ShowAll ******/
		/****** md5 signature: 8830d77e81e4aea9e344b97fb84a4d38 ******/
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Show the whole Edge.
") ShowAll;
		void ShowAll();

		/****** HLRAlgo_EdgeStatus::VisiblePart ******/
		/****** md5 signature: 82b3eee1e4e3cef5f92244020b907887 ******/
		%feature("compactdefaultargs") VisiblePart;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Start: double
TolStart: float
End: double
TolEnd: float

Description
-----------
No available documentation.
") VisiblePart;
		void VisiblePart(const int Index, Standard_Real &OutValue, Standard_ShortReal &OutValue, Standard_Real &OutValue, Standard_ShortReal &OutValue);

};


%extend HLRAlgo_EdgeStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class HLRAlgo_EdgesBlock *
***************************/
class HLRAlgo_EdgesBlock : public Standard_Transient {
	public:
		class MinMaxIndices {};
		/****** HLRAlgo_EdgesBlock::HLRAlgo_EdgesBlock ******/
		/****** md5 signature: 2a05a49f3793248b50593f5f083cb87c ******/
		%feature("compactdefaultargs") HLRAlgo_EdgesBlock;
		%feature("autodoc", "
Parameters
----------
NbEdges: int

Return
-------
None

Description
-----------
Create a Block of Edges for a wire.
") HLRAlgo_EdgesBlock;
		 HLRAlgo_EdgesBlock(const int NbEdges);

		/****** HLRAlgo_EdgesBlock::Double ******/
		/****** md5 signature: 158983b058e18cf69e411138fe5f7b3b ******/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") Double;
		bool Double(const int I);

		/****** HLRAlgo_EdgesBlock::Double ******/
		/****** md5 signature: da761495d7c7bec77285197077c7d8fa ******/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", "
Parameters
----------
I: int
B: bool

Return
-------
None

Description
-----------
No available documentation.
") Double;
		void Double(const int I, const bool B);

		/****** HLRAlgo_EdgesBlock::Edge ******/
		/****** md5 signature: f7c40698714a9fe6fb4c290f7b99a688 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
I: int
EI: int

Return
-------
None

Description
-----------
No available documentation.
") Edge;
		void Edge(const int I, const int EI);

		/****** HLRAlgo_EdgesBlock::Edge ******/
		/****** md5 signature: 243c047291324cef20dc8b4ba1853e3a ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
No available documentation.
") Edge;
		int Edge(const int I);

		/****** HLRAlgo_EdgesBlock::Internal ******/
		/****** md5 signature: b3faced342912ce93fab7a4ff895bb49 ******/
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") Internal;
		bool Internal(const int I);

		/****** HLRAlgo_EdgesBlock::Internal ******/
		/****** md5 signature: 629eec2ed00955af26bf9aec0e461664 ******/
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", "
Parameters
----------
I: int
B: bool

Return
-------
None

Description
-----------
No available documentation.
") Internal;
		void Internal(const int I, const bool B);

		/****** HLRAlgo_EdgesBlock::IsoLine ******/
		/****** md5 signature: 3f6a4b7b7605a8fb0ca65c399783ff4b ******/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") IsoLine;
		bool IsoLine(const int I);

		/****** HLRAlgo_EdgesBlock::IsoLine ******/
		/****** md5 signature: a3037212dba2062bd90f707928bceefa ******/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", "
Parameters
----------
I: int
B: bool

Return
-------
None

Description
-----------
No available documentation.
") IsoLine;
		void IsoLine(const int I, const bool B);

		/****** HLRAlgo_EdgesBlock::MinMax ******/
		/****** md5 signature: 6e0edc4d2c658ff135af2a2e1e510838 ******/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "Return
-------
HLRAlgo_EdgesBlock::MinMaxIndices

Description
-----------
No available documentation.
") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices MinMax();

		/****** HLRAlgo_EdgesBlock::NbEdges ******/
		/****** md5 signature: 54a1d338afeb2b34e693b9eb0a27ecb6 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEdges;
		int NbEdges();

		/****** HLRAlgo_EdgesBlock::Orientation ******/
		/****** md5 signature: 55e6f045f74eef4e9b7564ba961730f3 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
I: int
Or: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") Orientation;
		void Orientation(const int I, const TopAbs_Orientation Or);

		/****** HLRAlgo_EdgesBlock::Orientation ******/
		/****** md5 signature: 1ea86af50f0936d7bb6a7e990ac2aa71 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation(const int I);

		/****** HLRAlgo_EdgesBlock::OutLine ******/
		/****** md5 signature: 3120bfb4f898cf7bc36d3f7eafa9d556 ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") OutLine;
		bool OutLine(const int I);

		/****** HLRAlgo_EdgesBlock::OutLine ******/
		/****** md5 signature: 11aebcac3ebf8d0c3ec19ff24b824c51 ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "
Parameters
----------
I: int
B: bool

Return
-------
None

Description
-----------
No available documentation.
") OutLine;
		void OutLine(const int I, const bool B);

};


%make_alias(HLRAlgo_EdgesBlock)

%extend HLRAlgo_EdgesBlock {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def UpdateMinMax(self):
		pass
	}
};

/*****************************
* class HLRAlgo_Interference *
*****************************/
class HLRAlgo_Interference {
	public:
		/****** HLRAlgo_Interference::HLRAlgo_Interference ******/
		/****** md5 signature: 107b50394bbf4b16c3d0e557d613292e ******/
		%feature("compactdefaultargs") HLRAlgo_Interference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_Interference;
		 HLRAlgo_Interference();

		/****** HLRAlgo_Interference::HLRAlgo_Interference ******/
		/****** md5 signature: 2b344e3bdf272ee8c17b0a2857b3e6ce ******/
		%feature("compactdefaultargs") HLRAlgo_Interference;
		%feature("autodoc", "
Parameters
----------
Inters: HLRAlgo_Intersection
Bound: HLRAlgo_Coincidence
Orient: TopAbs_Orientation
Trans: TopAbs_Orientation
BTrans: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_Interference;
		 HLRAlgo_Interference(const HLRAlgo_Intersection & Inters, const HLRAlgo_Coincidence & Bound, const TopAbs_Orientation Orient, const TopAbs_Orientation Trans, const TopAbs_Orientation BTrans);

		/****** HLRAlgo_Interference::Boundary ******/
		/****** md5 signature: 6ca36eab7e6bee88933efbc7e34b06b7 ******/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "
Parameters
----------
B: HLRAlgo_Coincidence

Return
-------
None

Description
-----------
No available documentation.
") Boundary;
		void Boundary(const HLRAlgo_Coincidence & B);

		/****** HLRAlgo_Interference::Boundary ******/
		/****** md5 signature: 2971c67da6489e1f413cba7598a26a4d ******/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "Return
-------
HLRAlgo_Coincidence

Description
-----------
No available documentation.
") Boundary;
		const HLRAlgo_Coincidence & Boundary();

		/****** HLRAlgo_Interference::BoundaryTransition ******/
		/****** md5 signature: 91679118cf407fa213ebb9eb07832014 ******/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "
Parameters
----------
BTr: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") BoundaryTransition;
		void BoundaryTransition(const TopAbs_Orientation BTr);

		/****** HLRAlgo_Interference::BoundaryTransition ******/
		/****** md5 signature: 74f690bd95102dfac559cd0dc3a25347 ******/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition();

		/****** HLRAlgo_Interference::ChangeBoundary ******/
		/****** md5 signature: fe43e764cb5ec1f639a5f072c221ae07 ******/
		%feature("compactdefaultargs") ChangeBoundary;
		%feature("autodoc", "Return
-------
HLRAlgo_Coincidence

Description
-----------
No available documentation.
") ChangeBoundary;
		HLRAlgo_Coincidence & ChangeBoundary();

		/****** HLRAlgo_Interference::ChangeIntersection ******/
		/****** md5 signature: cba888b946477402b772f2b6fb39852d ******/
		%feature("compactdefaultargs") ChangeIntersection;
		%feature("autodoc", "Return
-------
HLRAlgo_Intersection

Description
-----------
No available documentation.
") ChangeIntersection;
		HLRAlgo_Intersection & ChangeIntersection();

		/****** HLRAlgo_Interference::Intersection ******/
		/****** md5 signature: e8313e0293d76e53d43c706c92569b48 ******/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "
Parameters
----------
I: HLRAlgo_Intersection

Return
-------
None

Description
-----------
No available documentation.
") Intersection;
		void Intersection(const HLRAlgo_Intersection & I);

		/****** HLRAlgo_Interference::Intersection ******/
		/****** md5 signature: 5b027f6499edb1b5f29980b69a9b1c22 ******/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "Return
-------
HLRAlgo_Intersection

Description
-----------
No available documentation.
") Intersection;
		const HLRAlgo_Intersection & Intersection();

		/****** HLRAlgo_Interference::Orientation ******/
		/****** md5 signature: 21772d27fe13757c215d17da49a64c59 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
O: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") Orientation;
		void Orientation(const TopAbs_Orientation O);

		/****** HLRAlgo_Interference::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** HLRAlgo_Interference::Transition ******/
		/****** md5 signature: bd64fa200b58d8f275e2f343a85da4ac ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "
Parameters
----------
Tr: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") Transition;
		void Transition(const TopAbs_Orientation Tr);

		/****** HLRAlgo_Interference::Transition ******/
		/****** md5 signature: 054591dc4fd0ee1810f89fdf4fe89b33 ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Transition;
		TopAbs_Orientation Transition();

};


%extend HLRAlgo_Interference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRAlgo_Intersection *
*****************************/
class HLRAlgo_Intersection {
	public:
		/****** HLRAlgo_Intersection::HLRAlgo_Intersection ******/
		/****** md5 signature: ede8c9f5e4bbc065a3c9ba13bb311b98 ******/
		%feature("compactdefaultargs") HLRAlgo_Intersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_Intersection;
		 HLRAlgo_Intersection();

		/****** HLRAlgo_Intersection::HLRAlgo_Intersection ******/
		/****** md5 signature: ea5f3031f10e8fb51492e5edce0ef0ec ******/
		%feature("compactdefaultargs") HLRAlgo_Intersection;
		%feature("autodoc", "
Parameters
----------
Ori: TopAbs_Orientation
Lev: int
SegInd: int
Ind: int
P: double
Tol: float
S: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_Intersection;
		 HLRAlgo_Intersection(const TopAbs_Orientation Ori, const int Lev, const int SegInd, const int Ind, const double P, const float Tol, const TopAbs_State S);

		/****** HLRAlgo_Intersection::Index ******/
		/****** md5 signature: b3e032ab67148993191fd5375e70e609 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
Ind: int

Return
-------
None

Description
-----------
No available documentation.
") Index;
		void Index(const int Ind);

		/****** HLRAlgo_Intersection::Index ******/
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		int Index();

		/****** HLRAlgo_Intersection::Level ******/
		/****** md5 signature: d37ab5f86e04c89ac1e90ad5c47a8afa ******/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "
Parameters
----------
Lev: int

Return
-------
None

Description
-----------
No available documentation.
") Level;
		void Level(const int Lev);

		/****** HLRAlgo_Intersection::Level ******/
		/****** md5 signature: 1c6749a8f4fa3c4b1ef506600d9abb66 ******/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Level;
		int Level();

		/****** HLRAlgo_Intersection::Orientation ******/
		/****** md5 signature: f8caec47636351355ae298c52891751a ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
Ori: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") Orientation;
		void Orientation(const TopAbs_Orientation Ori);

		/****** HLRAlgo_Intersection::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** HLRAlgo_Intersection::Parameter ******/
		/****** md5 signature: bd5fcf434c6f44bcf7a174a8658fcc12 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const double P);

		/****** HLRAlgo_Intersection::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** HLRAlgo_Intersection::SegIndex ******/
		/****** md5 signature: be852527cab282bba22baa0fce0b3a9f ******/
		%feature("compactdefaultargs") SegIndex;
		%feature("autodoc", "
Parameters
----------
SegInd: int

Return
-------
None

Description
-----------
No available documentation.
") SegIndex;
		void SegIndex(const int SegInd);

		/****** HLRAlgo_Intersection::SegIndex ******/
		/****** md5 signature: 18cc7eedd3d2dd7041a8b66f193e96ee ******/
		%feature("compactdefaultargs") SegIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") SegIndex;
		int SegIndex();

		/****** HLRAlgo_Intersection::State ******/
		/****** md5 signature: 6c0c61660b3c195e1ef8292e9b6ce7fe ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") State;
		void State(const TopAbs_State S);

		/****** HLRAlgo_Intersection::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") State;
		TopAbs_State State();

		/****** HLRAlgo_Intersection::Tolerance ******/
		/****** md5 signature: 44c1d03f65a75afa45dfd9b1634ae75c ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
T: float

Return
-------
None

Description
-----------
No available documentation.
") Tolerance;
		void Tolerance(const float T);

		/****** HLRAlgo_Intersection::Tolerance ******/
		/****** md5 signature: 27173cec126fd48cceae62b7a1012170 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		float Tolerance();

};


%extend HLRAlgo_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class HLRAlgo_PolyAlgo *
*************************/
class HLRAlgo_PolyAlgo : public Standard_Transient {
	public:
		/****** HLRAlgo_PolyAlgo::HLRAlgo_PolyAlgo ******/
		/****** md5 signature: 5363ba38b67de094bdb3309344301f87 ******/
		%feature("compactdefaultargs") HLRAlgo_PolyAlgo;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_PolyAlgo;
		 HLRAlgo_PolyAlgo();

		/****** HLRAlgo_PolyAlgo::ChangePolyShell ******/
		/****** md5 signature: f8b52f4813ca4e760c91710a23a4a32e ******/
		%feature("compactdefaultargs") ChangePolyShell;
		%feature("autodoc", "Return
-------
NCollection_Array1<opencascade::handle<HLRAlgo_PolyShellData>>

Description
-----------
No available documentation.
") ChangePolyShell;
		NCollection_Array1<opencascade::handle<HLRAlgo_PolyShellData>> & ChangePolyShell();

		/****** HLRAlgo_PolyAlgo::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** HLRAlgo_PolyAlgo::Hide ******/
		/****** md5 signature: 3f2ba13cf204b919f9bd203b04422ae1 ******/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "
Parameters
----------
status: HLRAlgo_EdgeStatus

Return
-------
Index: int
reg1: bool
regn: bool
outl: bool
intl: bool

Description
-----------
process hiding between <Pt1> and <Pt2>.
") Hide;
		HLRAlgo_BiPoint::PointsT & Hide(HLRAlgo_EdgeStatus & status, Standard_Integer &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** HLRAlgo_PolyAlgo::Init ******/
		/****** md5 signature: 6ff90aa8ae853ee01d7b5c874bd81bc6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theNbShells: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const int theNbShells);

		/****** HLRAlgo_PolyAlgo::InitHide ******/
		/****** md5 signature: 6d3a01e37a94e3705475c3d6870e3eb9 ******/
		%feature("compactdefaultargs") InitHide;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitHide;
		void InitHide();

		/****** HLRAlgo_PolyAlgo::InitShow ******/
		/****** md5 signature: 0c19b9d9bad511b1134c595c7ff3584f ******/
		%feature("compactdefaultargs") InitShow;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitShow;
		void InitShow();

		/****** HLRAlgo_PolyAlgo::MoreHide ******/
		/****** md5 signature: 209e689301a035d18ddc46a73d4882f7 ******/
		%feature("compactdefaultargs") MoreHide;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreHide;
		bool MoreHide();

		/****** HLRAlgo_PolyAlgo::MoreShow ******/
		/****** md5 signature: 43df07479bdbac7168dbf918778d43e2 ******/
		%feature("compactdefaultargs") MoreShow;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreShow;
		bool MoreShow();

		/****** HLRAlgo_PolyAlgo::NextHide ******/
		/****** md5 signature: 22f8ebe157186c9b9096225d279bf0df ******/
		%feature("compactdefaultargs") NextHide;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextHide;
		void NextHide();

		/****** HLRAlgo_PolyAlgo::NextShow ******/
		/****** md5 signature: e69996302b094708790ccdf13c4fece3 ******/
		%feature("compactdefaultargs") NextShow;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextShow;
		void NextShow();

		/****** HLRAlgo_PolyAlgo::PolyShell ******/
		/****** md5 signature: 8fa2b2862bf6f2793a727c50d438f4fc ******/
		%feature("compactdefaultargs") PolyShell;
		%feature("autodoc", "Return
-------
NCollection_Array1<opencascade::handle<HLRAlgo_PolyShellData>>

Description
-----------
No available documentation.
") PolyShell;
		const NCollection_Array1<opencascade::handle<HLRAlgo_PolyShellData>> & PolyShell();

		/****** HLRAlgo_PolyAlgo::Show ******/
		/****** md5 signature: 4a3ac2af0902e9ef8d96b4c5e8c0a7d6 ******/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "
Parameters
----------

Return
-------
Index: int
reg1: bool
regn: bool
outl: bool
intl: bool

Description
-----------
process hiding between <Pt1> and <Pt2>.
") Show;
		HLRAlgo_BiPoint::PointsT & Show(Standard_Integer &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** HLRAlgo_PolyAlgo::Update ******/
		/****** md5 signature: 997c8dd85f474bf26af99d1a07d6fa3f ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Prepare all the data to process the algo.
") Update;
		void Update();

};


%make_alias(HLRAlgo_PolyAlgo)

%extend HLRAlgo_PolyAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class HLRAlgo_PolyData *
*************************/
class HLRAlgo_PolyData : public Standard_Transient {
	public:
		class FaceIndices {};
		class Triangle {};
		/****** HLRAlgo_PolyData::HLRAlgo_PolyData ******/
		/****** md5 signature: 1c65d84b4a3839b161f93cf8e2da4233 ******/
		%feature("compactdefaultargs") HLRAlgo_PolyData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_PolyData;
		 HLRAlgo_PolyData();

		/****** HLRAlgo_PolyData::FaceIndex ******/
		/****** md5 signature: 99ffed997535aaa31d88f3c3118404c3 ******/
		%feature("compactdefaultargs") FaceIndex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") FaceIndex;
		void FaceIndex(const int I);

		/****** HLRAlgo_PolyData::FaceIndex ******/
		/****** md5 signature: a77371bfb81df3325321feb280590e13 ******/
		%feature("compactdefaultargs") FaceIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FaceIndex;
		int FaceIndex();

		/****** HLRAlgo_PolyData::HNodes ******/
		/****** md5 signature: 7c52b6b6464a1c7965e020e8d78676b8 ******/
		%feature("compactdefaultargs") HNodes;
		%feature("autodoc", "
Parameters
----------
HNodes: NCollection_HArray1<gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") HNodes;
		void HNodes(const opencascade::handle<NCollection_HArray1<gp_XYZ> > & HNodes);

		/****** HLRAlgo_PolyData::HPHDat ******/
		/****** md5 signature: 84b21d416f83099f9d82765a2d1f1a52 ******/
		%feature("compactdefaultargs") HPHDat;
		%feature("autodoc", "
Parameters
----------
HPHDat: NCollection_HArray1<HLRAlgo_PolyHidingData

Return
-------
None

Description
-----------
No available documentation.
") HPHDat;
		void HPHDat(const opencascade::handle<NCollection_HArray1<HLRAlgo_PolyHidingData> > & HPHDat);

		/****** HLRAlgo_PolyData::HTData ******/
		/****** md5 signature: 288d50379a08f7af5d7d65b1bd7d29d7 ******/
		%feature("compactdefaultargs") HTData;
		%feature("autodoc", "
Parameters
----------
HTData: NCollection_HArray1<HLRAlgo_TriangleData

Return
-------
None

Description
-----------
No available documentation.
") HTData;
		void HTData(const opencascade::handle<NCollection_HArray1<HLRAlgo_TriangleData> > & HTData);

		/****** HLRAlgo_PolyData::Hiding ******/
		/****** md5 signature: 1ecaf9532c51f7586db9e63b215ba79e ******/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Hiding;
		bool Hiding();

		/****** HLRAlgo_PolyData::Nodes ******/
		/****** md5 signature: 741b03c10a2bfd7b83a86b9cc1df986f ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Return
-------
NCollection_Array1<gp_XYZ>

Description
-----------
No available documentation.
") Nodes;
		NCollection_Array1<gp_XYZ> Nodes();

		/****** HLRAlgo_PolyData::PHDat ******/
		/****** md5 signature: 9f59ebc4007ceaf4a2c3717d66bcfa38 ******/
		%feature("compactdefaultargs") PHDat;
		%feature("autodoc", "Return
-------
NCollection_Array1<HLRAlgo_PolyHidingData>

Description
-----------
No available documentation.
") PHDat;
		NCollection_Array1<HLRAlgo_PolyHidingData> & PHDat();

		/****** HLRAlgo_PolyData::TData ******/
		/****** md5 signature: 575c003ec7645c6f29de58fdbf9ad6b3 ******/
		%feature("compactdefaultargs") TData;
		%feature("autodoc", "Return
-------
NCollection_Array1<HLRAlgo_TriangleData>

Description
-----------
No available documentation.
") TData;
		NCollection_Array1<HLRAlgo_TriangleData> & TData();

};


%make_alias(HLRAlgo_PolyData)

%extend HLRAlgo_PolyData {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def UpdateGlobalMinMax(self):
		pass

	@methodnotwrapped
	def HideByPolyData(self):
		pass

	@methodnotwrapped
	def Indices(self):
		pass
	}
};

/*******************************
* class HLRAlgo_PolyHidingData *
*******************************/
/*********************************
* class HLRAlgo_PolyInternalData *
*********************************/
class HLRAlgo_PolyInternalData : public Standard_Transient {
	public:
		/****** HLRAlgo_PolyInternalData::HLRAlgo_PolyInternalData ******/
		/****** md5 signature: 716788ebe8fd7e34556278e15f1e66a5 ******/
		%feature("compactdefaultargs") HLRAlgo_PolyInternalData;
		%feature("autodoc", "
Parameters
----------
nbNod: int
nbTri: int

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_PolyInternalData;
		 HLRAlgo_PolyInternalData(const int nbNod, const int nbTri);

		/****** HLRAlgo_PolyInternalData::AddNode ******/
		/****** md5 signature: d636afe1171e2318a01c03579b2a3acc ******/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "
Parameters
----------
theNod1RValues: HLRAlgo_PolyInternalNode::NodeData
theNod2RValues: HLRAlgo_PolyInternalNode::NodeData
thePINod1: HLRAlgo_PolyInternalNode
thePINod2: HLRAlgo_PolyInternalNode
theCoef1: double
theX3: double
theY3: double
theZ3: double

Return
-------
int

Description
-----------
No available documentation.
") AddNode;
		int AddNode(HLRAlgo_PolyInternalNode::NodeData & theNod1RValues, HLRAlgo_PolyInternalNode::NodeData & theNod2RValues, NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode> > * & thePINod1, NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode> > * & thePINod2, const double theCoef1, const double theX3, const double theY3, const double theZ3);

		/****** HLRAlgo_PolyInternalData::DecPINod ******/
		/****** md5 signature: 23c9a454c260ae9304cb22b337d0f0ff ******/
		%feature("compactdefaultargs") DecPINod;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DecPINod;
		void DecPINod();

		/****** HLRAlgo_PolyInternalData::DecPISeg ******/
		/****** md5 signature: 38c1cd8ddcc649ede166b551d0f56550 ******/
		%feature("compactdefaultargs") DecPISeg;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DecPISeg;
		void DecPISeg();

		/****** HLRAlgo_PolyInternalData::DecTData ******/
		/****** md5 signature: 64729b7a0415fc5a56c8c4a61cf1bd6b ******/
		%feature("compactdefaultargs") DecTData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DecTData;
		void DecTData();

		/****** HLRAlgo_PolyInternalData::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** HLRAlgo_PolyInternalData::IncPINod ******/
		/****** md5 signature: 6f6e1576b65c68d1831d86ceb77680ae ******/
		%feature("compactdefaultargs") IncPINod;
		%feature("autodoc", "
Parameters
----------
thePINod1: HLRAlgo_PolyInternalNode
thePINod2: HLRAlgo_PolyInternalNode

Return
-------
None

Description
-----------
No available documentation.
") IncPINod;
		void IncPINod(NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode> > * & thePINod1, NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode> > * & thePINod2);

		/****** HLRAlgo_PolyInternalData::IncPISeg ******/
		/****** md5 signature: cdfae8b14010c8c1896073e40d2a74b0 ******/
		%feature("compactdefaultargs") IncPISeg;
		%feature("autodoc", "
Parameters
----------
PISeg1: NCollection_Array1<HLRAlgo_PolyInternalSegment> *
PISeg2: NCollection_Array1<HLRAlgo_PolyInternalSegment> *

Return
-------
None

Description
-----------
No available documentation.
") IncPISeg;
		void IncPISeg(NCollection_Array1<HLRAlgo_PolyInternalSegment> * & PISeg1, NCollection_Array1<HLRAlgo_PolyInternalSegment> * & PISeg2);

		/****** HLRAlgo_PolyInternalData::IncTData ******/
		/****** md5 signature: 2eebf4fb6d2530a97070a6e6bbefd61b ******/
		%feature("compactdefaultargs") IncTData;
		%feature("autodoc", "
Parameters
----------
TData1: NCollection_Array1<HLRAlgo_TriangleData> *
TData2: NCollection_Array1<HLRAlgo_TriangleData> *

Return
-------
None

Description
-----------
No available documentation.
") IncTData;
		void IncTData(NCollection_Array1<HLRAlgo_TriangleData> * & TData1, NCollection_Array1<HLRAlgo_TriangleData> * & TData2);

		/****** HLRAlgo_PolyInternalData::IntOutL ******/
		/****** md5 signature: 937e55216c84228194f36e04ec657e9a ******/
		%feature("compactdefaultargs") IntOutL;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IntOutL;
		bool IntOutL();

		/****** HLRAlgo_PolyInternalData::IntOutL ******/
		/****** md5 signature: 83ba7d0c87aab7a57d06feccab43ff56 ******/
		%feature("compactdefaultargs") IntOutL;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") IntOutL;
		void IntOutL(const bool B);

		/****** HLRAlgo_PolyInternalData::NbPINod ******/
		/****** md5 signature: 3149e0afc0e3186b626fad14fc9d67ab ******/
		%feature("compactdefaultargs") NbPINod;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPINod;
		int NbPINod();

		/****** HLRAlgo_PolyInternalData::NbPISeg ******/
		/****** md5 signature: bd8afbf8cff45e09da70458d8df50ee1 ******/
		%feature("compactdefaultargs") NbPISeg;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPISeg;
		int NbPISeg();

		/****** HLRAlgo_PolyInternalData::NbTData ******/
		/****** md5 signature: 464d5aa5b707478f2c555f54175949fb ******/
		%feature("compactdefaultargs") NbTData;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTData;
		int NbTData();

		/****** HLRAlgo_PolyInternalData::PINod ******/
		/****** md5 signature: 0d3e2bbf673dfbf2e1a6ccd6cc38b646 ******/
		%feature("compactdefaultargs") PINod;
		%feature("autodoc", "Return
-------
NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>>

Description
-----------
No available documentation.
") PINod;
		NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>> & PINod();

		/****** HLRAlgo_PolyInternalData::PISeg ******/
		/****** md5 signature: 0eb5a4d7c5cc4d8808b7862615347c1d ******/
		%feature("compactdefaultargs") PISeg;
		%feature("autodoc", "Return
-------
NCollection_Array1<HLRAlgo_PolyInternalSegment>

Description
-----------
No available documentation.
") PISeg;
		NCollection_Array1<HLRAlgo_PolyInternalSegment> & PISeg();

		/****** HLRAlgo_PolyInternalData::Planar ******/
		/****** md5 signature: b1499fd072312701f35006b5034e5034 ******/
		%feature("compactdefaultargs") Planar;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Planar;
		bool Planar();

		/****** HLRAlgo_PolyInternalData::Planar ******/
		/****** md5 signature: 5c01ac18c79cd3ca98c82a3e92bbca6b ******/
		%feature("compactdefaultargs") Planar;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") Planar;
		void Planar(const bool B);

		/****** HLRAlgo_PolyInternalData::TData ******/
		/****** md5 signature: 575c003ec7645c6f29de58fdbf9ad6b3 ******/
		%feature("compactdefaultargs") TData;
		%feature("autodoc", "Return
-------
NCollection_Array1<HLRAlgo_TriangleData>

Description
-----------
No available documentation.
") TData;
		NCollection_Array1<HLRAlgo_TriangleData> & TData();

		/****** HLRAlgo_PolyInternalData::UpdateLinks ******/
		/****** md5 signature: edd888e73ee32c04e002b34567e65673 ******/
		%feature("compactdefaultargs") UpdateLinks;
		%feature("autodoc", "
Parameters
----------
theTData: NCollection_Array1<HLRAlgo_TriangleData>
thePISeg: NCollection_Array1<HLRAlgo_PolyInternalSegment>
thePINod: HLRAlgo_PolyInternalNode

Return
-------
None

Description
-----------
No available documentation.
") UpdateLinks;
		void UpdateLinks(NCollection_Array1<HLRAlgo_TriangleData> & theTData, NCollection_Array1<HLRAlgo_PolyInternalSegment> & thePISeg, NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode> > & thePINod);

		/****** HLRAlgo_PolyInternalData::UpdateLinks ******/
		/****** md5 signature: b9caa06ceffbea68f86030781de62747 ******/
		%feature("compactdefaultargs") UpdateLinks;
		%feature("autodoc", "
Parameters
----------
theIp1: int
theIp2: int
theIp3: int
theTData1: NCollection_Array1<HLRAlgo_TriangleData> *
theTData2: NCollection_Array1<HLRAlgo_TriangleData> *
thePISeg1: NCollection_Array1<HLRAlgo_PolyInternalSegment> *
thePISeg2: NCollection_Array1<HLRAlgo_PolyInternalSegment> *
thePINod1: HLRAlgo_PolyInternalNode
thePINod2: HLRAlgo_PolyInternalNode

Return
-------
None

Description
-----------
No available documentation.
") UpdateLinks;
		void UpdateLinks(const int theIp1, const int theIp2, const int theIp3, NCollection_Array1<HLRAlgo_TriangleData> * & theTData1, NCollection_Array1<HLRAlgo_TriangleData> * & theTData2, NCollection_Array1<HLRAlgo_PolyInternalSegment> * & thePISeg1, NCollection_Array1<HLRAlgo_PolyInternalSegment> * & thePISeg2, NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode> > * & thePINod1, NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode> > * & thePINod2);

};


%make_alias(HLRAlgo_PolyInternalData)

%extend HLRAlgo_PolyInternalData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class HLRAlgo_PolyInternalNode *
*********************************/
class HLRAlgo_PolyInternalNode : public Standard_Transient {
	public:
		class NodeIndices {};
		class NodeData {};
		/****** HLRAlgo_PolyInternalNode::HLRAlgo_PolyInternalNode ******/
		/****** md5 signature: 1aafd0a57380cf1890f6259fab5f5d04 ******/
		%feature("compactdefaultargs") HLRAlgo_PolyInternalNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_PolyInternalNode;
		 HLRAlgo_PolyInternalNode();

};


%make_alias(HLRAlgo_PolyInternalNode)

%extend HLRAlgo_PolyInternalNode {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Indices(self):
		pass

	@methodnotwrapped
	def Data(self):
		pass
	}
};

/************************************
* class HLRAlgo_PolyInternalSegment *
************************************/
/******************************
* class HLRAlgo_PolyShellData *
******************************/
class HLRAlgo_PolyShellData : public Standard_Transient {
	public:
		class ShellIndices {};
		/****** HLRAlgo_PolyShellData::HLRAlgo_PolyShellData ******/
		/****** md5 signature: f45e97fd9e2679a58f7c299871e96e83 ******/
		%feature("compactdefaultargs") HLRAlgo_PolyShellData;
		%feature("autodoc", "
Parameters
----------
nbFace: int

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_PolyShellData;
		 HLRAlgo_PolyShellData(const int nbFace);

		/****** HLRAlgo_PolyShellData::Edges ******/
		/****** md5 signature: a560831d1ad3546dff68467a7a8896af ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Return
-------
NCollection_List<HLRAlgo_BiPoint>

Description
-----------
No available documentation.
") Edges;
		NCollection_List<HLRAlgo_BiPoint> & Edges();

		/****** HLRAlgo_PolyShellData::Hiding ******/
		/****** md5 signature: 873b9a53c522527c5a77c05a27c28b8b ******/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Hiding;
		bool Hiding();

		/****** HLRAlgo_PolyShellData::HidingPolyData ******/
		/****** md5 signature: 1677904005cfe756ecd5ae731539a322 ******/
		%feature("compactdefaultargs") HidingPolyData;
		%feature("autodoc", "Return
-------
NCollection_Array1<opencascade::handle<HLRAlgo_PolyData>>

Description
-----------
No available documentation.
") HidingPolyData;
		NCollection_Array1<opencascade::handle<HLRAlgo_PolyData>> & HidingPolyData();

		/****** HLRAlgo_PolyShellData::PolyData ******/
		/****** md5 signature: c0ab2919646d9484965293aecdaa1af1 ******/
		%feature("compactdefaultargs") PolyData;
		%feature("autodoc", "Return
-------
NCollection_Array1<opencascade::handle<HLRAlgo_PolyData>>

Description
-----------
No available documentation.
") PolyData;
		NCollection_Array1<opencascade::handle<HLRAlgo_PolyData>> & PolyData();

		/****** HLRAlgo_PolyShellData::UpdateGlobalMinMax ******/
		/****** md5 signature: 65504e67a52e19904c177bf36a5a960f ******/
		%feature("compactdefaultargs") UpdateGlobalMinMax;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") UpdateGlobalMinMax;
		void UpdateGlobalMinMax(Bnd_Box & theBox);

		/****** HLRAlgo_PolyShellData::UpdateHiding ******/
		/****** md5 signature: b5e81227262148b00a654ec8bd03a63b ******/
		%feature("compactdefaultargs") UpdateHiding;
		%feature("autodoc", "
Parameters
----------
nbHiding: int

Return
-------
None

Description
-----------
No available documentation.
") UpdateHiding;
		void UpdateHiding(const int nbHiding);

};


%make_alias(HLRAlgo_PolyShellData)

%extend HLRAlgo_PolyShellData {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Indices(self):
		pass
	}
};

/**************************
* class HLRAlgo_Projector *
**************************/
class HLRAlgo_Projector {
	public:
		/****** HLRAlgo_Projector::HLRAlgo_Projector ******/
		/****** md5 signature: 4a3875ee832c751de0d5fa3d5c7e12a5 ******/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_Projector;
		 HLRAlgo_Projector();

		/****** HLRAlgo_Projector::HLRAlgo_Projector ******/
		/****** md5 signature: b4417cf83478c029d5fda17b72178261 ******/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "
Parameters
----------
CS: gp_Ax2

Return
-------
None

Description
-----------
Creates an axonometric projector. <CS> is the viewing coordinate system.
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Ax2 & CS);

		/****** HLRAlgo_Projector::HLRAlgo_Projector ******/
		/****** md5 signature: eccf510c370852be35d093eab3079790 ******/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "
Parameters
----------
CS: gp_Ax2
Focus: double

Return
-------
None

Description
-----------
Creates a perspective projector. <CS> is the viewing coordinate system.
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Ax2 & CS, const double Focus);

		/****** HLRAlgo_Projector::HLRAlgo_Projector ******/
		/****** md5 signature: 7bb17c8604ea3c0acf2e4a6b71e121e9 ******/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf
Persp: bool
Focus: double

Return
-------
None

Description
-----------
build a Projector with automatic minmax directions.
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Trsf & T, const bool Persp, const double Focus);

		/****** HLRAlgo_Projector::HLRAlgo_Projector ******/
		/****** md5 signature: 719879665359f8b4082a4d53a87d1017 ******/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf
Persp: bool
Focus: double
v1: gp_Vec2d
v2: gp_Vec2d
v3: gp_Vec2d

Return
-------
None

Description
-----------
build a Projector with given minmax directions.
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Trsf & T, const bool Persp, const double Focus, const gp_Vec2d & v1, const gp_Vec2d & v2, const gp_Vec2d & v3);

		/****** HLRAlgo_Projector::Directions ******/
		/****** md5 signature: 896ac6730deebeb97ba07e51ae851bb0 ******/
		%feature("compactdefaultargs") Directions;
		%feature("autodoc", "
Parameters
----------
D1: gp_Vec2d
D2: gp_Vec2d
D3: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Directions;
		void Directions(gp_Vec2d & D1, gp_Vec2d & D2, gp_Vec2d & D3);

		/****** HLRAlgo_Projector::Focus ******/
		/****** md5 signature: 7b37f21a5b277bef2347e2820d959069 ******/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the focal length.
") Focus;
		double Focus();

		/****** HLRAlgo_Projector::FullTransformation ******/
		/****** md5 signature: 2fd1c84627aa6ce62b5b2fab31952206 ******/
		%feature("compactdefaultargs") FullTransformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the original transformation.
") FullTransformation;
		const gp_Trsf FullTransformation();

		/****** HLRAlgo_Projector::InvertedTransformation ******/
		/****** md5 signature: a89b4ad17003aaf37d99644a84f34f32 ******/
		%feature("compactdefaultargs") InvertedTransformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the active inverted transformation.
") InvertedTransformation;
		const gp_Trsf InvertedTransformation();

		/****** HLRAlgo_Projector::Perspective ******/
		/****** md5 signature: f01917bba551bc5ea062216167b1e4a0 ******/
		%feature("compactdefaultargs") Perspective;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a perspective transformation.
") Perspective;
		bool Perspective();

		/****** HLRAlgo_Projector::Project ******/
		/****** md5 signature: 8f672feab377350a4417b6e7b72f5cd2 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Pout: gp_Pnt2d

Return
-------
None

Description
-----------
Transform and apply perspective if needed.
") Project;
		void Project(const gp_Pnt & P, gp_Pnt2d & Pout);

		/****** HLRAlgo_Projector::Project ******/
		/****** md5 signature: 041825ebceef31d236dfacddc15cde6e ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
X: double
Y: double
Z: double

Description
-----------
Transform and apply perspective if needed.
") Project;
		void Project(const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRAlgo_Projector::Project ******/
		/****** md5 signature: 7000b93590a38c91efe09137a95d8a8b ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
D1: gp_Vec
Pout: gp_Pnt2d
D1out: gp_Vec2d

Return
-------
None

Description
-----------
Transform and apply perspective if needed.
") Project;
		void Project(const gp_Pnt & P, const gp_Vec & D1, gp_Pnt2d & Pout, gp_Vec2d & D1out);

		/****** HLRAlgo_Projector::Scaled ******/
		/****** md5 signature: bbafb9338c0fbe4d4912665f77c12580 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
On: bool (optional, default to false)

Return
-------
None

Description
-----------
to compute with the given scale and translation.
") Scaled;
		void Scaled(const bool On = false);

		/****** HLRAlgo_Projector::Set ******/
		/****** md5 signature: cbba7a282b7b445a3f53fb424e0f5722 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf
Persp: bool
Focus: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Trsf & T, const bool Persp, const double Focus);

		/****** HLRAlgo_Projector::Shoot ******/
		/****** md5 signature: ca35193decd8da911b70b447a55d8e8b ******/
		%feature("compactdefaultargs") Shoot;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
gp_Lin

Description
-----------
return a line going through the eye towards the 2d point <X,Y>.
") Shoot;
		gp_Lin Shoot(const double X, const double Y);

		/****** HLRAlgo_Projector::Transform ******/
		/****** md5 signature: 10baf6732f1abbea1a4e7de2bad21710 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
D: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(gp_Vec & D);

		/****** HLRAlgo_Projector::Transform ******/
		/****** md5 signature: f8bbccc7082e5de088b76c55ea554590 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
Pnt: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(gp_Pnt & Pnt);

		/****** HLRAlgo_Projector::Transformation ******/
		/****** md5 signature: 567e6ee373139970f4679dbb49e28e7c ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the active transformation.
") Transformation;
		const gp_Trsf Transformation();

};


%extend HLRAlgo_Projector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRAlgo_TriangleData *
*****************************/
/***************************
* class HLRAlgo_WiresBlock *
***************************/
class HLRAlgo_WiresBlock : public Standard_Transient {
	public:
		/****** HLRAlgo_WiresBlock::HLRAlgo_WiresBlock ******/
		/****** md5 signature: b1a5379df8bee04eefa7845fd5afd920 ******/
		%feature("compactdefaultargs") HLRAlgo_WiresBlock;
		%feature("autodoc", "
Parameters
----------
NbWires: int

Return
-------
None

Description
-----------
Create a Block of Blocks.
") HLRAlgo_WiresBlock;
		 HLRAlgo_WiresBlock(const int NbWires);

		/****** HLRAlgo_WiresBlock::MinMax ******/
		/****** md5 signature: b360e6f636632e8d4f24d53763098bae ******/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "Return
-------
HLRAlgo_EdgesBlock::MinMaxIndices

Description
-----------
No available documentation.
") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax();

		/****** HLRAlgo_WiresBlock::NbWires ******/
		/****** md5 signature: fd4feeac48e0420944f46658b8fcc010 ******/
		%feature("compactdefaultargs") NbWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWires;
		int NbWires();

		/****** HLRAlgo_WiresBlock::Set ******/
		/****** md5 signature: b703dd7c35a4086479856456e22fd975 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
I: int
W: HLRAlgo_EdgesBlock

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const int I, const opencascade::handle<HLRAlgo_EdgesBlock> & W);

		/****** HLRAlgo_WiresBlock::UpdateMinMax ******/
		/****** md5 signature: 26c6b0e6335e69c3bc9452c803f3a7a7 ******/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "
Parameters
----------
theMinMaxes: HLRAlgo_EdgesBlock::MinMaxIndices

Return
-------
None

Description
-----------
No available documentation.
") UpdateMinMax;
		void UpdateMinMax(const HLRAlgo_EdgesBlock::MinMaxIndices & theMinMaxes);

		/****** HLRAlgo_WiresBlock::Wire ******/
		/****** md5 signature: d133c0e0bcaa1a0c6a6c1f5e2c1bf6fe ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<HLRAlgo_EdgesBlock>

Description
-----------
No available documentation.
") Wire;
		opencascade::handle<HLRAlgo_EdgesBlock> & Wire(const int I);

};


%make_alias(HLRAlgo_WiresBlock)

%extend HLRAlgo_WiresBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class HLRAlgo_TriangleData:
	pass

@classnotwrapped
class HLRAlgo_PolyInternalSegment:
	pass

@classnotwrapped
class HLRAlgo_PolyHidingData:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class HLRAlgo_HArray1OfPHDat : public NCollection_Array1<HLRAlgo_PolyHidingData>, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfPHDat(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfPHDat(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<HLRAlgo_PolyHidingData>::value_type& theValue);
    HLRAlgo_HArray1OfPHDat(const NCollection_Array1<HLRAlgo_PolyHidingData>& theOther);
    const NCollection_Array1<HLRAlgo_PolyHidingData>& Array1();
    NCollection_Array1<HLRAlgo_PolyHidingData>& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfPHDat)


class HLRAlgo_HArray1OfPINod : public NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>>, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfPINod(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfPINod(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>>::value_type& theValue);
    HLRAlgo_HArray1OfPINod(const NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>>& theOther);
    const NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>>& Array1();
    NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>>& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfPINod)


class HLRAlgo_HArray1OfPISeg : public NCollection_Array1<HLRAlgo_PolyInternalSegment>, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfPISeg(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfPISeg(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<HLRAlgo_PolyInternalSegment>::value_type& theValue);
    HLRAlgo_HArray1OfPISeg(const NCollection_Array1<HLRAlgo_PolyInternalSegment>& theOther);
    const NCollection_Array1<HLRAlgo_PolyInternalSegment>& Array1();
    NCollection_Array1<HLRAlgo_PolyInternalSegment>& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfPISeg)


class HLRAlgo_HArray1OfTData : public NCollection_Array1<HLRAlgo_TriangleData>, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfTData(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfTData(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<HLRAlgo_TriangleData>::value_type& theValue);
    HLRAlgo_HArray1OfTData(const NCollection_Array1<HLRAlgo_TriangleData>& theOther);
    const NCollection_Array1<HLRAlgo_TriangleData>& Array1();
    NCollection_Array1<HLRAlgo_TriangleData>& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfTData)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def hlralgo_AddMinMax(*args):
	return hlralgo.AddMinMax(*args)

@deprecated
def hlralgo_CopyMinMax(*args):
	return hlralgo.CopyMinMax(*args)

@deprecated
def hlralgo_DecodeMinMax(*args):
	return hlralgo.DecodeMinMax(*args)

@deprecated
def hlralgo_EncodeMinMax(*args):
	return hlralgo.EncodeMinMax(*args)

@deprecated
def hlralgo_EnlargeMinMax(*args):
	return hlralgo.EnlargeMinMax(*args)

@deprecated
def hlralgo_InitMinMax(*args):
	return hlralgo.InitMinMax(*args)

@deprecated
def hlralgo_SizeBox(*args):
	return hlralgo.SizeBox(*args)

@deprecated
def hlralgo_UpdateMinMax(*args):
	return hlralgo.UpdateMinMax(*args)

}
