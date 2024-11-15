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
%define HLRALGODOCSTRING
"HLRAlgo module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_hlralgo.html"
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
#include<TColgp_module.hxx>
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
%import TColgp.i
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
%wrap_handle(HLRAlgo_HArray1OfPISeg)
%wrap_handle(HLRAlgo_HArray1OfPINod)
%wrap_handle(HLRAlgo_HArray1OfPHDat)
%wrap_handle(HLRAlgo_HArray1OfTData)
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
		/****** md5 signature: 5c2f922c83583828ccca699f2f5709f7 ******/
		%feature("compactdefaultargs") EnlargeMinMax;
		%feature("autodoc", "
Parameters
----------
tol: float
Min: float
Max: float

Return
-------
None

Description
-----------
No available documentation.
") EnlargeMinMax;
		static void EnlargeMinMax(const Standard_Real tol, Standard_Real Min[16], Standard_Real Max[16]);

		/****** HLRAlgo::InitMinMax ******/
		/****** md5 signature: 15536aa507f7e6592fd3ec5fbf8a33ed ******/
		%feature("compactdefaultargs") InitMinMax;
		%feature("autodoc", "
Parameters
----------
Big: float
Min: float
Max: float

Return
-------
None

Description
-----------
No available documentation.
") InitMinMax;
		static void InitMinMax(const Standard_Real Big, Standard_Real Min[16], Standard_Real Max[16]);

		/****** HLRAlgo::SizeBox ******/
		/****** md5 signature: d368bb25147f397318f1808363e40aa0 ******/
		%feature("compactdefaultargs") SizeBox;
		%feature("autodoc", "
Parameters
----------
Min: HLRAlgo_EdgesBlock::MinMaxIndices
Max: HLRAlgo_EdgesBlock::MinMaxIndices

Return
-------
float

Description
-----------
No available documentation.
") SizeBox;
		static Standard_Real SizeBox(HLRAlgo_EdgesBlock::MinMaxIndices & Min, HLRAlgo_EdgesBlock::MinMaxIndices & Max);

		/****** HLRAlgo::UpdateMinMax ******/
		/****** md5 signature: 5a55c8be19587ba156fc4a1ca38e890d ******/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "
Parameters
----------
x: float
y: float
z: float
Min: float
Max: float

Return
-------
None

Description
-----------
Iterator on the visible or hidden parts of an edgestatus.
") UpdateMinMax;
		static void UpdateMinMax(const Standard_Real x, const Standard_Real y, const Standard_Real z, Standard_Real Min[16], Standard_Real Max[16]);

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
		/****** md5 signature: e91d2b17c17c9f76ee0b8cf3d0db926d ******/
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
		/****** md5 signature: f2c27a8027ad5c17fe60b999ef6e5911 ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: float
Y1: float
Z1: float
X2: float
Y2: float
Z2: float
XT1: float
YT1: float
ZT1: float
XT2: float
YT2: float
ZT2: float
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
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: cd3de09eeb1071d3fa65a62d94e5795a ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: float
Y1: float
Z1: float
X2: float
Y2: float
Z2: float
XT1: float
YT1: float
ZT1: float
XT2: float
YT2: float
ZT2: float
Index: int
flag: int

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Integer flag);

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: edfad3b5a88b464913fe77ec62333903 ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: float
Y1: float
Z1: float
X2: float
Y2: float
Z2: float
XT1: float
YT1: float
ZT1: float
XT2: float
YT2: float
ZT2: float
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
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Integer i1, const Standard_Integer i1p1, const Standard_Integer i1p2, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: b15157f5ad636d4bcdd717568948f374 ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: float
Y1: float
Z1: float
X2: float
Y2: float
Z2: float
XT1: float
YT1: float
ZT1: float
XT2: float
YT2: float
ZT2: float
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
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Integer i1, const Standard_Integer i1p1, const Standard_Integer i1p2, const Standard_Integer flag);

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: 2925fb8b6167a0395245e205d5004995 ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: float
Y1: float
Z1: float
X2: float
Y2: float
Z2: float
XT1: float
YT1: float
ZT1: float
XT2: float
YT2: float
ZT2: float
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
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Integer i1, const Standard_Integer i1p1, const Standard_Integer i1p2, const Standard_Integer i2, const Standard_Integer i2p1, const Standard_Integer i2p2, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****** HLRAlgo_BiPoint::HLRAlgo_BiPoint ******/
		/****** md5 signature: 281c3fa75bed522309a2d1737a095fba ******/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "
Parameters
----------
X1: float
Y1: float
Z1: float
X2: float
Y2: float
Z2: float
XT1: float
YT1: float
ZT1: float
XT2: float
YT2: float
ZT2: float
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
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Integer i1, const Standard_Integer i1p1, const Standard_Integer i1p2, const Standard_Integer i2, const Standard_Integer i2p1, const Standard_Integer i2p2, const Standard_Integer flag);

		/****** HLRAlgo_BiPoint::Hidden ******/
		/****** md5 signature: 07ca7eb361bfb4a9fb7b2173b2ca76f2 ******/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Hidden;
		Standard_Boolean Hidden();

		/****** HLRAlgo_BiPoint::Hidden ******/
		/****** md5 signature: 8ab5f0256de33b7431e8f2b52a788fad ******/
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
		void Hidden(const Standard_Boolean B);

		/****** HLRAlgo_BiPoint::IntLine ******/
		/****** md5 signature: 12d7cbbfcbf9b7024b633fb2f23f4627 ******/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IntLine;
		Standard_Boolean IntLine();

		/****** HLRAlgo_BiPoint::IntLine ******/
		/****** md5 signature: db1141c08b265a5a4892f7f723f2dd5f ******/
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
		void IntLine(const Standard_Boolean B);

		/****** HLRAlgo_BiPoint::OutLine ******/
		/****** md5 signature: 5ca0f10eca0ab31cafc651fcdd487066 ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLine;
		Standard_Boolean OutLine();

		/****** HLRAlgo_BiPoint::OutLine ******/
		/****** md5 signature: b1713b4ae8c761b2d01b059d873779f4 ******/
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
		void OutLine(const Standard_Boolean B);

		/****** HLRAlgo_BiPoint::Rg1Line ******/
		/****** md5 signature: 909228d95e513182f5095879976686a6 ******/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****** HLRAlgo_BiPoint::Rg1Line ******/
		/****** md5 signature: 8664f6dc97a60a9616441f541a3d378e ******/
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
		void Rg1Line(const Standard_Boolean B);

		/****** HLRAlgo_BiPoint::RgNLine ******/
		/****** md5 signature: 9048b7d28453594775a66644606d3856 ******/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") RgNLine;
		Standard_Boolean RgNLine();

		/****** HLRAlgo_BiPoint::RgNLine ******/
		/****** md5 signature: 15cd72eef01a3ba9cd0d52f504140d36 ******/
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
		void RgNLine(const Standard_Boolean B);

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
		/****** md5 signature: 5d464b150cf1323495a90b7c5956012b ******/
		%feature("compactdefaultargs") Set2D;
		%feature("autodoc", "
Parameters
----------
FE: int
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set2D;
		void Set2D(const Standard_Integer FE, const Standard_Real Param);

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
		/****** md5 signature: 586a611fdcd63cd04637ed47ac03c68e ******/
		%feature("compactdefaultargs") Value2D;
		%feature("autodoc", "
Parameters
----------

Return
-------
FE: int
Param: float

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
		/****** md5 signature: cf24ee69879d62fbb2c9eeae038f0432 ******/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "
Parameters
----------

Return
-------
Start: float
TolStart: float
End: float
TolEnd: float

Description
-----------
Returns the bounds and the tolerances of the current hidden interval.
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
		/****** md5 signature: 3b15b62a78bddb9bfa7464762d6947d6 ******/
		%feature("compactdefaultargs") MoreHidden;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreHidden;
		Standard_Boolean MoreHidden();

		/****** HLRAlgo_EdgeIterator::MoreVisible ******/
		/****** md5 signature: 7cca41fab7d11924952196a9afb1cb46 ******/
		%feature("compactdefaultargs") MoreVisible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVisible;
		Standard_Boolean MoreVisible();

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
		/****** md5 signature: 620cbaee211eded4d2daab0691bb9055 ******/
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", "
Parameters
----------

Return
-------
Start: float
TolStart: float
End: float
TolEnd: float

Description
-----------
Returns the bounds and the tolerances of the current visible interval.
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
		/****** md5 signature: 80e5e01e766821f5d6f4b17c3912358d ******/
		%feature("compactdefaultargs") HLRAlgo_EdgeStatus;
		%feature("autodoc", "
Parameters
----------
Start: float
TolStart: float
End: float
TolEnd: float

Return
-------
None

Description
-----------
Creates a new edgestatus. default visible. the edge is bounded by the interval <start>, <end> with the tolerances <tolstart>, <tolend>.
") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus(const Standard_Real Start, const Standard_ShortReal TolStart, const Standard_Real End, const Standard_ShortReal TolEnd);

		/****** HLRAlgo_EdgeStatus::AllHidden ******/
		/****** md5 signature: 427f4f374c4141a2e532cc839a2b03bf ******/
		%feature("compactdefaultargs") AllHidden;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AllHidden;
		Standard_Boolean AllHidden();

		/****** HLRAlgo_EdgeStatus::AllHidden ******/
		/****** md5 signature: c65e34a1d18585ba9232b31c8de73e1a ******/
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
		void AllHidden(const Standard_Boolean B);

		/****** HLRAlgo_EdgeStatus::AllVisible ******/
		/****** md5 signature: 00cf36cbc8257bc423305cc0050e36ea ******/
		%feature("compactdefaultargs") AllVisible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AllVisible;
		Standard_Boolean AllVisible();

		/****** HLRAlgo_EdgeStatus::AllVisible ******/
		/****** md5 signature: 3d549cb3e9164d44dc625873063b6d82 ******/
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
		void AllVisible(const Standard_Boolean B);

		/****** HLRAlgo_EdgeStatus::Bounds ******/
		/****** md5 signature: 2404d913bad202b8990588ec556882a8 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStart: float
theTolStart: float
theEnd: float
theTolEnd: float

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_ShortReal &OutValue, Standard_Real &OutValue, Standard_ShortReal &OutValue);

		/****** HLRAlgo_EdgeStatus::Hide ******/
		/****** md5 signature: ce985d27b09ccae676c4faed96ec3d3d ******/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "
Parameters
----------
Start: float
TolStart: float
End: float
TolEnd: float
OnFace: bool
OnBoundary: bool

Return
-------
None

Description
-----------
Hides the interval <start>, <end> with the tolerances <tolstart>, <tolend>. this interval is subtracted from the visible parts. if the hidden part is on ( or under ) the face the flag <onface> is true ( or false ). if the hidden part is on ( or inside ) the boundary of the face the flag <onboundary> is true ( or false ).
") Hide;
		void Hide(const Standard_Real Start, const Standard_ShortReal TolStart, const Standard_Real End, const Standard_ShortReal TolEnd, const Standard_Boolean OnFace, const Standard_Boolean OnBoundary);

		/****** HLRAlgo_EdgeStatus::HideAll ******/
		/****** md5 signature: b17bc2d765e07d0c3a7ff1493933dbbf ******/
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Hide the whole edge.
") HideAll;
		void HideAll();

		/****** HLRAlgo_EdgeStatus::Initialize ******/
		/****** md5 signature: 66a4d5af44516b8b231058b61351c415 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
Start: float
TolStart: float
End: float
TolEnd: float

Return
-------
None

Description
-----------
Initialize an edgestatus. default visible. the edge is bounded by the interval <start>, <end> with the tolerances <tolstart>, <tolend>.
") Initialize;
		void Initialize(const Standard_Real Start, const Standard_ShortReal TolStart, const Standard_Real End, const Standard_ShortReal TolEnd);

		/****** HLRAlgo_EdgeStatus::NbVisiblePart ******/
		/****** md5 signature: 9a498c897135fb45b8f2666e88e9e8d2 ******/
		%feature("compactdefaultargs") NbVisiblePart;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVisiblePart;
		Standard_Integer NbVisiblePart();

		/****** HLRAlgo_EdgeStatus::ShowAll ******/
		/****** md5 signature: 8830d77e81e4aea9e344b97fb84a4d38 ******/
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Show the whole edge.
") ShowAll;
		void ShowAll();

		/****** HLRAlgo_EdgeStatus::VisiblePart ******/
		/****** md5 signature: 4c46e496ab3812de269341d9f8810e2c ******/
		%feature("compactdefaultargs") VisiblePart;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Start: float
TolStart: float
End: float
TolEnd: float

Description
-----------
No available documentation.
") VisiblePart;
		void VisiblePart(const Standard_Integer Index, Standard_Real &OutValue, Standard_ShortReal &OutValue, Standard_Real &OutValue, Standard_ShortReal &OutValue);

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
		/****** md5 signature: 71e902f31e06a0591c9c4ebc094c8377 ******/
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
Create a block of edges for a wire.
") HLRAlgo_EdgesBlock;
		 HLRAlgo_EdgesBlock(const Standard_Integer NbEdges);

		/****** HLRAlgo_EdgesBlock::Double ******/
		/****** md5 signature: 6c72b8e6b6274e1d3f857b9282cb9b70 ******/
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
		Standard_Boolean Double(const Standard_Integer I);

		/****** HLRAlgo_EdgesBlock::Double ******/
		/****** md5 signature: 7fa4c606f56abb0c7abcd5dcb8adf04a ******/
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
		void Double(const Standard_Integer I, const Standard_Boolean B);

		/****** HLRAlgo_EdgesBlock::Edge ******/
		/****** md5 signature: 62bb8354d821134309ab38d5fed1fbef ******/
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
		void Edge(const Standard_Integer I, const Standard_Integer EI);

		/****** HLRAlgo_EdgesBlock::Edge ******/
		/****** md5 signature: 1d1b2d0e7b27341cb468e475dd87e73c ******/
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
		Standard_Integer Edge(const Standard_Integer I);

		/****** HLRAlgo_EdgesBlock::Internal ******/
		/****** md5 signature: 2ebee6ed32d53f541cd70e45a531b94a ******/
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
		Standard_Boolean Internal(const Standard_Integer I);

		/****** HLRAlgo_EdgesBlock::Internal ******/
		/****** md5 signature: 71c4557631338dca9dcf00500b427528 ******/
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
		void Internal(const Standard_Integer I, const Standard_Boolean B);

		/****** HLRAlgo_EdgesBlock::IsoLine ******/
		/****** md5 signature: 2df012e054083f333566eb45c2e6d38c ******/
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
		Standard_Boolean IsoLine(const Standard_Integer I);

		/****** HLRAlgo_EdgesBlock::IsoLine ******/
		/****** md5 signature: e7af88fec0d17e97ac6b43000ce2a544 ******/
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
		void IsoLine(const Standard_Integer I, const Standard_Boolean B);

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
		/****** md5 signature: 31924aa1f5b2c848f6f0ca402e060038 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEdges;
		Standard_Integer NbEdges();

		/****** HLRAlgo_EdgesBlock::Orientation ******/
		/****** md5 signature: f772f51825c9ab94141dd6f3a70b9b7f ******/
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
		void Orientation(const Standard_Integer I, const TopAbs_Orientation Or);

		/****** HLRAlgo_EdgesBlock::Orientation ******/
		/****** md5 signature: 479760e19ea923e6936cbb01cf1113f7 ******/
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
		TopAbs_Orientation Orientation(const Standard_Integer I);

		/****** HLRAlgo_EdgesBlock::OutLine ******/
		/****** md5 signature: 65c09ab60793633aeb2bb852bc06f097 ******/
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
		Standard_Boolean OutLine(const Standard_Integer I);

		/****** HLRAlgo_EdgesBlock::OutLine ******/
		/****** md5 signature: cd10a7e3e6f18fc4f7ac9c04828c04a8 ******/
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
		void OutLine(const Standard_Integer I, const Standard_Boolean B);

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
		/****** md5 signature: a552b56b3147c6a34521ff3a330adb47 ******/
		%feature("compactdefaultargs") HLRAlgo_Intersection;
		%feature("autodoc", "
Parameters
----------
Ori: TopAbs_Orientation
Lev: int
SegInd: int
Ind: int
P: float
Tol: float
S: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") HLRAlgo_Intersection;
		 HLRAlgo_Intersection(const TopAbs_Orientation Ori, const Standard_Integer Lev, const Standard_Integer SegInd, const Standard_Integer Ind, const Standard_Real P, const Standard_ShortReal Tol, const TopAbs_State S);

		/****** HLRAlgo_Intersection::Index ******/
		/****** md5 signature: d9536fd77c7a838bcbe5ab5b8ec5b47b ******/
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
		void Index(const Standard_Integer Ind);

		/****** HLRAlgo_Intersection::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****** HLRAlgo_Intersection::Level ******/
		/****** md5 signature: 0b9584f63692a34651d63a9002f4c2be ******/
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
		void Level(const Standard_Integer Lev);

		/****** HLRAlgo_Intersection::Level ******/
		/****** md5 signature: 06f7279e938b54c0bc4a49915192a536 ******/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Level;
		Standard_Integer Level();

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
		/****** md5 signature: 26acaf0b4677a7a04af978de63424b8a ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const Standard_Real P);

		/****** HLRAlgo_Intersection::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****** HLRAlgo_Intersection::SegIndex ******/
		/****** md5 signature: 6c0bbfd6ca734f01032cbeaddd314451 ******/
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
		void SegIndex(const Standard_Integer SegInd);

		/****** HLRAlgo_Intersection::SegIndex ******/
		/****** md5 signature: 8443266d1f894bac2a802a9675ebcf0b ******/
		%feature("compactdefaultargs") SegIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") SegIndex;
		Standard_Integer SegIndex();

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
		/****** md5 signature: 727a2a2475c49599237ddd2a82d39f90 ******/
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
		void Tolerance(const Standard_ShortReal T);

		/****** HLRAlgo_Intersection::Tolerance ******/
		/****** md5 signature: 680c1c68cea56ee6a9513e808e1d379c ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_ShortReal Tolerance();

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
		/****** md5 signature: fccc58a3359f48fc2d4621a26ceb7214 ******/
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
Process hiding between <pt1> and <pt2>.
") Hide;
		HLRAlgo_BiPoint::PointsT & Hide(HLRAlgo_EdgeStatus & status, Standard_Integer &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** HLRAlgo_PolyAlgo::Init ******/
		/****** md5 signature: 4f6558833fa45b2851e3cccaa0030ced ******/
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
		void Init(const Standard_Integer theNbShells);

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
		/****** md5 signature: ee934ca6bfa0a4423c581ec95be0690b ******/
		%feature("compactdefaultargs") MoreHide;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreHide;
		Standard_Boolean MoreHide();

		/****** HLRAlgo_PolyAlgo::MoreShow ******/
		/****** md5 signature: 676e76c7f6a46e8688a744d734543b5e ******/
		%feature("compactdefaultargs") MoreShow;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreShow;
		Standard_Boolean MoreShow();

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
		/****** md5 signature: 91aa0cc1a8ccb2620f595ef894877d22 ******/
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
Process hiding between <pt1> and <pt2>.
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
		class Box {};
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
		/****** md5 signature: 5e806ac158a6330b361c999dd9d44981 ******/
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
		void FaceIndex(const Standard_Integer I);

		/****** HLRAlgo_PolyData::FaceIndex ******/
		/****** md5 signature: 366897155dd7b2bff3344d29f2c14f58 ******/
		%feature("compactdefaultargs") FaceIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FaceIndex;
		Standard_Integer FaceIndex();

		/****** HLRAlgo_PolyData::HNodes ******/
		/****** md5 signature: 69a54caea9bb74f119caf9a6bcb60407 ******/
		%feature("compactdefaultargs") HNodes;
		%feature("autodoc", "
Parameters
----------
HNodes: TColgp_HArray1OfXYZ

Return
-------
None

Description
-----------
No available documentation.
") HNodes;
		void HNodes(const opencascade::handle<TColgp_HArray1OfXYZ> & HNodes);

		/****** HLRAlgo_PolyData::HPHDat ******/
		/****** md5 signature: 407ecc7db70700775b2cdea78dae0d56 ******/
		%feature("compactdefaultargs") HPHDat;
		%feature("autodoc", "
Parameters
----------
HPHDat: HLRAlgo_HArray1OfPHDat

Return
-------
None

Description
-----------
No available documentation.
") HPHDat;
		void HPHDat(const opencascade::handle<HLRAlgo_HArray1OfPHDat> & HPHDat);

		/****** HLRAlgo_PolyData::HTData ******/
		/****** md5 signature: 5167f9f4945cedbdd1aaa1e15424c679 ******/
		%feature("compactdefaultargs") HTData;
		%feature("autodoc", "
Parameters
----------
HTData: HLRAlgo_HArray1OfTData

Return
-------
None

Description
-----------
No available documentation.
") HTData;
		void HTData(const opencascade::handle<HLRAlgo_HArray1OfTData> & HTData);

		/****** HLRAlgo_PolyData::Hiding ******/
		/****** md5 signature: bc42207e7cb8f65a46eef744c498e613 ******/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Hiding;
		Standard_Boolean Hiding();

		/****** HLRAlgo_PolyData::Nodes ******/
		/****** md5 signature: 40bed0368afc95a818c5232b7234373d ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Return
-------
TColgp_Array1OfXYZ

Description
-----------
No available documentation.
") Nodes;
		TColgp_Array1OfXYZ & Nodes();

		/****** HLRAlgo_PolyData::PHDat ******/
		/****** md5 signature: 71970b8aaa61be920cefc9b2e2aac141 ******/
		%feature("compactdefaultargs") PHDat;
		%feature("autodoc", "Return
-------
HLRAlgo_Array1OfPHDat

Description
-----------
No available documentation.
") PHDat;
		HLRAlgo_Array1OfPHDat & PHDat();

		/****** HLRAlgo_PolyData::TData ******/
		/****** md5 signature: c515f32c68690ac4f5e95cee5afc6d26 ******/
		%feature("compactdefaultargs") TData;
		%feature("autodoc", "Return
-------
HLRAlgo_Array1OfTData

Description
-----------
No available documentation.
") TData;
		HLRAlgo_Array1OfTData & TData();

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
		/****** md5 signature: 0ff52cf9e5d6520d4bc055b55c64770e ******/
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
		 HLRAlgo_PolyInternalData(const Standard_Integer nbNod, const Standard_Integer nbTri);

		/****** HLRAlgo_PolyInternalData::AddNode ******/
		/****** md5 signature: 030edbaa89e0e51ec1ee836bbe028a9a ******/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "
Parameters
----------
theNod1RValues: HLRAlgo_PolyInternalNode::NodeData
theNod2RValues: HLRAlgo_PolyInternalNode::NodeData
thePINod1: HLRAlgo_Array1OfPINod *
thePINod2: HLRAlgo_Array1OfPINod *
theCoef1: float
theX3: float
theY3: float
theZ3: float

Return
-------
int

Description
-----------
No available documentation.
") AddNode;
		Standard_Integer AddNode(HLRAlgo_PolyInternalNode::NodeData & theNod1RValues, HLRAlgo_PolyInternalNode::NodeData & theNod2RValues, HLRAlgo_Array1OfPINod * & thePINod1, HLRAlgo_Array1OfPINod * & thePINod2, const Standard_Real theCoef1, const Standard_Real theX3, const Standard_Real theY3, const Standard_Real theZ3);

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
		/****** md5 signature: e28e8098a494a718c0df7f109cd14590 ******/
		%feature("compactdefaultargs") IncPINod;
		%feature("autodoc", "
Parameters
----------
thePINod1: HLRAlgo_Array1OfPINod *
thePINod2: HLRAlgo_Array1OfPINod *

Return
-------
None

Description
-----------
No available documentation.
") IncPINod;
		void IncPINod(HLRAlgo_Array1OfPINod * & thePINod1, HLRAlgo_Array1OfPINod * & thePINod2);

		/****** HLRAlgo_PolyInternalData::IncPISeg ******/
		/****** md5 signature: bf0b8293a85db37a0ab57e624faff682 ******/
		%feature("compactdefaultargs") IncPISeg;
		%feature("autodoc", "
Parameters
----------
PISeg1: HLRAlgo_Array1OfPISeg *
PISeg2: HLRAlgo_Array1OfPISeg *

Return
-------
None

Description
-----------
No available documentation.
") IncPISeg;
		void IncPISeg(HLRAlgo_Array1OfPISeg * & PISeg1, HLRAlgo_Array1OfPISeg * & PISeg2);

		/****** HLRAlgo_PolyInternalData::IncTData ******/
		/****** md5 signature: 4202f3d8bfe60b72e74d49bb11fd54b3 ******/
		%feature("compactdefaultargs") IncTData;
		%feature("autodoc", "
Parameters
----------
TData1: HLRAlgo_Array1OfTData *
TData2: HLRAlgo_Array1OfTData *

Return
-------
None

Description
-----------
No available documentation.
") IncTData;
		void IncTData(HLRAlgo_Array1OfTData * & TData1, HLRAlgo_Array1OfTData * & TData2);

		/****** HLRAlgo_PolyInternalData::IntOutL ******/
		/****** md5 signature: 9ebb75c9ccf4fb86133d4f40a9c7e192 ******/
		%feature("compactdefaultargs") IntOutL;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IntOutL;
		Standard_Boolean IntOutL();

		/****** HLRAlgo_PolyInternalData::IntOutL ******/
		/****** md5 signature: df61f55aa2c1a618e8b2da86f8aa5c5c ******/
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
		void IntOutL(const Standard_Boolean B);

		/****** HLRAlgo_PolyInternalData::NbPINod ******/
		/****** md5 signature: d6666dd17f4d73c1bec0ec3989a55dc0 ******/
		%feature("compactdefaultargs") NbPINod;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPINod;
		Standard_Integer NbPINod();

		/****** HLRAlgo_PolyInternalData::NbPISeg ******/
		/****** md5 signature: b79df3ce19221048c26094b09e0e54ec ******/
		%feature("compactdefaultargs") NbPISeg;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPISeg;
		Standard_Integer NbPISeg();

		/****** HLRAlgo_PolyInternalData::NbTData ******/
		/****** md5 signature: 5b32649d54b5514785013f7ef57d84bd ******/
		%feature("compactdefaultargs") NbTData;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTData;
		Standard_Integer NbTData();

		/****** HLRAlgo_PolyInternalData::PINod ******/
		/****** md5 signature: 8bf6e0be7a530ded0d69a23dc6019fab ******/
		%feature("compactdefaultargs") PINod;
		%feature("autodoc", "Return
-------
HLRAlgo_Array1OfPINod

Description
-----------
No available documentation.
") PINod;
		HLRAlgo_Array1OfPINod & PINod();

		/****** HLRAlgo_PolyInternalData::PISeg ******/
		/****** md5 signature: 38e3d567ce2f7112db67ea149a905697 ******/
		%feature("compactdefaultargs") PISeg;
		%feature("autodoc", "Return
-------
HLRAlgo_Array1OfPISeg

Description
-----------
No available documentation.
") PISeg;
		HLRAlgo_Array1OfPISeg & PISeg();

		/****** HLRAlgo_PolyInternalData::Planar ******/
		/****** md5 signature: 4d830f54345a28c8f8e2ff1825b8872b ******/
		%feature("compactdefaultargs") Planar;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Planar;
		Standard_Boolean Planar();

		/****** HLRAlgo_PolyInternalData::Planar ******/
		/****** md5 signature: 31c2d87b16bb517676f748d18b147ffc ******/
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
		void Planar(const Standard_Boolean B);

		/****** HLRAlgo_PolyInternalData::TData ******/
		/****** md5 signature: c515f32c68690ac4f5e95cee5afc6d26 ******/
		%feature("compactdefaultargs") TData;
		%feature("autodoc", "Return
-------
HLRAlgo_Array1OfTData

Description
-----------
No available documentation.
") TData;
		HLRAlgo_Array1OfTData & TData();

		/****** HLRAlgo_PolyInternalData::UpdateLinks ******/
		/****** md5 signature: 6ecb7e49245bc9a027a02cec4a8ab955 ******/
		%feature("compactdefaultargs") UpdateLinks;
		%feature("autodoc", "
Parameters
----------
theTData: HLRAlgo_Array1OfTData
thePISeg: HLRAlgo_Array1OfPISeg
thePINod: HLRAlgo_Array1OfPINod

Return
-------
None

Description
-----------
No available documentation.
") UpdateLinks;
		void UpdateLinks(HLRAlgo_Array1OfTData & theTData, HLRAlgo_Array1OfPISeg & thePISeg, HLRAlgo_Array1OfPINod & thePINod);

		/****** HLRAlgo_PolyInternalData::UpdateLinks ******/
		/****** md5 signature: 12f0176cf18713f7b8c1d91b9594981c ******/
		%feature("compactdefaultargs") UpdateLinks;
		%feature("autodoc", "
Parameters
----------
theIp1: int
theIp2: int
theIp3: int
theTData1: HLRAlgo_Array1OfTData *
theTData2: HLRAlgo_Array1OfTData *
thePISeg1: HLRAlgo_Array1OfPISeg *
thePISeg2: HLRAlgo_Array1OfPISeg *
thePINod1: HLRAlgo_Array1OfPINod *
thePINod2: HLRAlgo_Array1OfPINod *

Return
-------
None

Description
-----------
No available documentation.
") UpdateLinks;
		void UpdateLinks(const Standard_Integer theIp1, const Standard_Integer theIp2, const Standard_Integer theIp3, HLRAlgo_Array1OfTData * & theTData1, HLRAlgo_Array1OfTData * & theTData2, HLRAlgo_Array1OfPISeg * & thePISeg1, HLRAlgo_Array1OfPISeg * & thePISeg2, HLRAlgo_Array1OfPINod * & thePINod1, HLRAlgo_Array1OfPINod * & thePINod2);

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
		/****** md5 signature: 47db112083a4d1df57fb42f2ab31d718 ******/
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
		 HLRAlgo_PolyShellData(const Standard_Integer nbFace);

		/****** HLRAlgo_PolyShellData::Edges ******/
		/****** md5 signature: 3ffe8deadeb0fe47515ab51a09784967 ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Return
-------
HLRAlgo_ListOfBPoint

Description
-----------
No available documentation.
") Edges;
		HLRAlgo_ListOfBPoint & Edges();

		/****** HLRAlgo_PolyShellData::Hiding ******/
		/****** md5 signature: 9e063098b7345ab66f670b3b16d882e5 ******/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Hiding;
		Standard_Boolean Hiding();

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
		/****** md5 signature: 582d6cf1a888375cf933c3643964498a ******/
		%feature("compactdefaultargs") UpdateGlobalMinMax;
		%feature("autodoc", "
Parameters
----------
theBox: HLRAlgo_PolyData::Box

Return
-------
None

Description
-----------
No available documentation.
") UpdateGlobalMinMax;
		void UpdateGlobalMinMax(HLRAlgo_PolyData::Box & theBox);

		/****** HLRAlgo_PolyShellData::UpdateHiding ******/
		/****** md5 signature: 48e4fc2e43d44cd5a98f1e46fb470e26 ******/
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
		void UpdateHiding(const Standard_Integer nbHiding);

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
Creates an axonometric projector. <cs> is the viewing coordinate system.
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Ax2 & CS);

		/****** HLRAlgo_Projector::HLRAlgo_Projector ******/
		/****** md5 signature: ef7cb75d5f445f065cfbfbdb8e57f993 ******/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "
Parameters
----------
CS: gp_Ax2
Focus: float

Return
-------
None

Description
-----------
Creates a perspective projector. <cs> is the viewing coordinate system.
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Ax2 & CS, const Standard_Real Focus);

		/****** HLRAlgo_Projector::HLRAlgo_Projector ******/
		/****** md5 signature: 54f8c71605df068b4ce26364b27a1fb4 ******/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf
Persp: bool
Focus: float

Return
-------
None

Description
-----------
Build a projector with automatic minmax directions.
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Trsf & T, const Standard_Boolean Persp, const Standard_Real Focus);

		/****** HLRAlgo_Projector::HLRAlgo_Projector ******/
		/****** md5 signature: f1a2a7d2f4c76422bc4b7985bc0b8d7d ******/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf
Persp: bool
Focus: float
v1: gp_Vec2d
v2: gp_Vec2d
v3: gp_Vec2d

Return
-------
None

Description
-----------
Build a projector with given minmax directions.
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Trsf & T, const Standard_Boolean Persp, const Standard_Real Focus, const gp_Vec2d & v1, const gp_Vec2d & v2, const gp_Vec2d & v3);

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
		/****** md5 signature: 7f25143d4ee01dbca172f0ac199ce7eb ******/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the focal length.
") Focus;
		Standard_Real Focus();

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
		/****** md5 signature: d485b60782e71223fcfb73cc547c4eaa ******/
		%feature("compactdefaultargs") Perspective;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a perspective transformation.
") Perspective;
		Standard_Boolean Perspective();

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
		/****** md5 signature: ce805b12431d64048a7400b93bc43f0b ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
X: float
Y: float
Z: float

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
		/****** md5 signature: 7f9a7b250b2e4068d09b302fbc93c460 ******/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
On: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
To compute with the given scale and translation.
") Scaled;
		void Scaled(const Standard_Boolean On = Standard_False);

		/****** HLRAlgo_Projector::Set ******/
		/****** md5 signature: 6fb0e09772c01422c0b5d28ac8a1a63a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf
Persp: bool
Focus: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Trsf & T, const Standard_Boolean Persp, const Standard_Real Focus);

		/****** HLRAlgo_Projector::Shoot ******/
		/****** md5 signature: 519282116437ba6a032c9ac364098f98 ******/
		%feature("compactdefaultargs") Shoot;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float

Return
-------
gp_Lin

Description
-----------
Return a line going through the eye towards the 2d point <x,y>.
") Shoot;
		gp_Lin Shoot(const Standard_Real X, const Standard_Real Y);

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
		/****** md5 signature: a3813db1547d3356adc436359819aab0 ******/
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
Create a block of blocks.
") HLRAlgo_WiresBlock;
		 HLRAlgo_WiresBlock(const Standard_Integer NbWires);

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
		/****** md5 signature: bce549b9d0543bc5dacda7fa2e69e8be ******/
		%feature("compactdefaultargs") NbWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWires;
		Standard_Integer NbWires();

		/****** HLRAlgo_WiresBlock::Set ******/
		/****** md5 signature: c1ab1a849e1a595daa7a5f0a0335fbb3 ******/
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
		void Set(const Standard_Integer I, const opencascade::handle<HLRAlgo_EdgesBlock> & W);

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
		/****** md5 signature: f8c17dee52a3648b0a4db214d314823d ******/
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
		opencascade::handle<HLRAlgo_EdgesBlock> & Wire(const Standard_Integer I);

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

class HLRAlgo_HArray1OfPISeg : public HLRAlgo_Array1OfPISeg, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfPISeg(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfPISeg(const Standard_Integer theLower, const Standard_Integer theUpper, const HLRAlgo_Array1OfPISeg::value_type& theValue);
    HLRAlgo_HArray1OfPISeg(const HLRAlgo_Array1OfPISeg& theOther);
    const HLRAlgo_Array1OfPISeg& Array1();
    HLRAlgo_Array1OfPISeg& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfPISeg)


class HLRAlgo_HArray1OfPINod : public HLRAlgo_Array1OfPINod, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfPINod(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfPINod(const Standard_Integer theLower, const Standard_Integer theUpper, const HLRAlgo_Array1OfPINod::value_type& theValue);
    HLRAlgo_HArray1OfPINod(const HLRAlgo_Array1OfPINod& theOther);
    const HLRAlgo_Array1OfPINod& Array1();
    HLRAlgo_Array1OfPINod& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfPINod)


class HLRAlgo_HArray1OfPHDat : public HLRAlgo_Array1OfPHDat, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfPHDat(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfPHDat(const Standard_Integer theLower, const Standard_Integer theUpper, const HLRAlgo_Array1OfPHDat::value_type& theValue);
    HLRAlgo_HArray1OfPHDat(const HLRAlgo_Array1OfPHDat& theOther);
    const HLRAlgo_Array1OfPHDat& Array1();
    HLRAlgo_Array1OfPHDat& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfPHDat)


class HLRAlgo_HArray1OfTData : public HLRAlgo_Array1OfTData, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfTData(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfTData(const Standard_Integer theLower, const Standard_Integer theUpper, const HLRAlgo_Array1OfTData::value_type& theValue);
    HLRAlgo_HArray1OfTData(const HLRAlgo_Array1OfTData& theOther);
    const HLRAlgo_Array1OfTData& Array1();
    HLRAlgo_Array1OfTData& ChangeArray1();
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
