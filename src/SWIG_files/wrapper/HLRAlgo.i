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
%define HLRALGODOCSTRING
"HLRAlgo module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_hlralgo.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<HLRAlgo_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopAbs_module.hxx>
#include<TColStd_module.hxx>
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
%import TColStd.i
%import TColgp.i
%import gp.i

%pythoncode {
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

/* python proy classes for enums */
%pythoncode {

class HLRAlgo_PolyMask:
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
%wrap_handle(HLRAlgo_HArray1OfPINod)
%wrap_handle(HLRAlgo_HArray1OfPHDat)
%wrap_handle(HLRAlgo_HArray1OfTData)
%wrap_handle(HLRAlgo_HArray1OfPISeg)
/* end handles declaration */

/* templates */
%template(HLRAlgo_Array1OfPINod) NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>>;

%extend NCollection_Array1<opencascade::handle<HLRAlgo_PolyInternalNode>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(HLRAlgo_Array1OfPISeg) NCollection_Array1<HLRAlgo_PolyInternalSegment>;

%extend NCollection_Array1<HLRAlgo_PolyInternalSegment> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(HLRAlgo_Array1OfTData) NCollection_Array1<HLRAlgo_TriangleData>;

%extend NCollection_Array1<HLRAlgo_TriangleData> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(HLRAlgo_InterferenceList) NCollection_List<HLRAlgo_Interference>;
%template(HLRAlgo_ListIteratorOfInterferenceList) NCollection_TListIterator<HLRAlgo_Interference>;
%template(HLRAlgo_ListIteratorOfListOfBPoint) NCollection_TListIterator<HLRAlgo_BiPoint>;
%template(HLRAlgo_ListOfBPoint) NCollection_List<HLRAlgo_BiPoint>;
/* end templates declaration */

/* typedefs */
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
		/****************** AddMinMax ******************/
		%feature("compactdefaultargs") AddMinMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
IMin: HLRAlgo_EdgesBlock::MinMaxIndices
IMax: HLRAlgo_EdgesBlock::MinMaxIndices
OMin: HLRAlgo_EdgesBlock::MinMaxIndices
OMax: HLRAlgo_EdgesBlock::MinMaxIndices

Returns
-------
None
") AddMinMax;
		static void AddMinMax(HLRAlgo_EdgesBlock::MinMaxIndices & IMin, HLRAlgo_EdgesBlock::MinMaxIndices & IMax, HLRAlgo_EdgesBlock::MinMaxIndices & OMin, HLRAlgo_EdgesBlock::MinMaxIndices & OMax);

		/****************** CopyMinMax ******************/
		%feature("compactdefaultargs") CopyMinMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
IMin: HLRAlgo_EdgesBlock::MinMaxIndices
IMax: HLRAlgo_EdgesBlock::MinMaxIndices
OMin: HLRAlgo_EdgesBlock::MinMaxIndices
OMax: HLRAlgo_EdgesBlock::MinMaxIndices

Returns
-------
None
") CopyMinMax;
		static void CopyMinMax(HLRAlgo_EdgesBlock::MinMaxIndices & IMin, HLRAlgo_EdgesBlock::MinMaxIndices & IMax, HLRAlgo_EdgesBlock::MinMaxIndices & OMin, HLRAlgo_EdgesBlock::MinMaxIndices & OMax);

		/****************** DecodeMinMax ******************/
		%feature("compactdefaultargs") DecodeMinMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
MinMax: HLRAlgo_EdgesBlock::MinMaxIndices
Min: HLRAlgo_EdgesBlock::MinMaxIndices
Max: HLRAlgo_EdgesBlock::MinMaxIndices

Returns
-------
None
") DecodeMinMax;
		static void DecodeMinMax(const HLRAlgo_EdgesBlock::MinMaxIndices & MinMax, HLRAlgo_EdgesBlock::MinMaxIndices & Min, HLRAlgo_EdgesBlock::MinMaxIndices & Max);

		/****************** EncodeMinMax ******************/
		%feature("compactdefaultargs") EncodeMinMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
Min: HLRAlgo_EdgesBlock::MinMaxIndices
Max: HLRAlgo_EdgesBlock::MinMaxIndices
MinMax: HLRAlgo_EdgesBlock::MinMaxIndices

Returns
-------
None
") EncodeMinMax;
		static void EncodeMinMax(HLRAlgo_EdgesBlock::MinMaxIndices & Min, HLRAlgo_EdgesBlock::MinMaxIndices & Max, HLRAlgo_EdgesBlock::MinMaxIndices & MinMax);

		/****************** EnlargeMinMax ******************/
		%feature("compactdefaultargs") EnlargeMinMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
tol: float
Min: float
Max: float

Returns
-------
None
") EnlargeMinMax;
		static void EnlargeMinMax(const Standard_Real tol, Standard_Real Min[16], Standard_Real Max[16]);

		/****************** InitMinMax ******************/
		%feature("compactdefaultargs") InitMinMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
Big: float
Min: float
Max: float

Returns
-------
None
") InitMinMax;
		static void InitMinMax(const Standard_Real Big, Standard_Real Min[16], Standard_Real Max[16]);

		/****************** SizeBox ******************/
		%feature("compactdefaultargs") SizeBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
Min: HLRAlgo_EdgesBlock::MinMaxIndices
Max: HLRAlgo_EdgesBlock::MinMaxIndices

Returns
-------
float
") SizeBox;
		static Standard_Real SizeBox(HLRAlgo_EdgesBlock::MinMaxIndices & Min, HLRAlgo_EdgesBlock::MinMaxIndices & Max);

		/****************** UpdateMinMax ******************/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "Iterator on the visible or hidden parts of an edgestatus.

Parameters
----------
x: float
y: float
z: float
Min: float
Max: float

Returns
-------
None
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
		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint();

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Integer flag);

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Integer i1, const Standard_Integer i1p1, const Standard_Integer i1p2, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Integer i1, const Standard_Integer i1p1, const Standard_Integer i1p2, const Standard_Integer flag);

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Integer i1, const Standard_Integer i1p1, const Standard_Integer i1p2, const Standard_Integer i2, const Standard_Integer i2p1, const Standard_Integer i2p2, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint(const Standard_Real X1, const Standard_Real Y1, const Standard_Real Z1, const Standard_Real X2, const Standard_Real Y2, const Standard_Real Z2, const Standard_Real XT1, const Standard_Real YT1, const Standard_Real ZT1, const Standard_Real XT2, const Standard_Real YT2, const Standard_Real ZT2, const Standard_Integer Index, const Standard_Integer i1, const Standard_Integer i1p1, const Standard_Integer i1p2, const Standard_Integer i2, const Standard_Integer i2p1, const Standard_Integer i2p2, const Standard_Integer flag);

		/****************** Hidden ******************/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Hidden;
		Standard_Boolean Hidden();

		/****************** Hidden ******************/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Hidden;
		void Hidden(const Standard_Boolean B);

		/****************** IntLine ******************/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IntLine;
		Standard_Boolean IntLine();

		/****************** IntLine ******************/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") IntLine;
		void IntLine(const Standard_Boolean B);

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLine;
		Standard_Boolean OutLine();

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") OutLine;
		void OutLine(const Standard_Boolean B);

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Rg1Line;
		void Rg1Line(const Standard_Boolean B);

		/****************** RgNLine ******************/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") RgNLine;
		Standard_Boolean RgNLine();

		/****************** RgNLine ******************/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
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
		/****************** HLRAlgo_Coincidence ******************/
		%feature("compactdefaultargs") HLRAlgo_Coincidence;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRAlgo_Coincidence;
		 HLRAlgo_Coincidence();

		/****************** Set2D ******************/
		%feature("compactdefaultargs") Set2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
FE: int
Param: float

Returns
-------
None
") Set2D;
		void Set2D(const Standard_Integer FE, const Standard_Real Param);

		/****************** SetState3D ******************/
		%feature("compactdefaultargs") SetState3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
stbef: TopAbs_State
staft: TopAbs_State

Returns
-------
None
") SetState3D;
		void SetState3D(const TopAbs_State stbef, const TopAbs_State staft);

		/****************** State3D ******************/
		%feature("compactdefaultargs") State3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
stbef: TopAbs_State
staft: TopAbs_State

Returns
-------
None
") State3D;
		void State3D(TopAbs_State & stbef, TopAbs_State & staft);

		/****************** Value2D ******************/
		%feature("compactdefaultargs") Value2D;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
FE: int
Param: float
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
		/****************** HLRAlgo_EdgeIterator ******************/
		%feature("compactdefaultargs") HLRAlgo_EdgeIterator;
		%feature("autodoc", "Iterator on the visible or hidden parts of an edge.

Returns
-------
None
") HLRAlgo_EdgeIterator;
		 HLRAlgo_EdgeIterator();

		/****************** Hidden ******************/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "Returns the bounds and the tolerances of the current hidden interval.

Parameters
----------
TolStart: Standard_ShortReal
TolEnd: Standard_ShortReal

Returns
-------
Start: float
End: float
") Hidden;
		void Hidden(Standard_Real &OutValue, Standard_ShortReal & TolStart, Standard_Real &OutValue, Standard_ShortReal & TolEnd);

		/****************** InitHidden ******************/
		%feature("compactdefaultargs") InitHidden;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: HLRAlgo_EdgeStatus

Returns
-------
None
") InitHidden;
		void InitHidden(HLRAlgo_EdgeStatus & status);

		/****************** InitVisible ******************/
		%feature("compactdefaultargs") InitVisible;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: HLRAlgo_EdgeStatus

Returns
-------
None
") InitVisible;
		void InitVisible(HLRAlgo_EdgeStatus & status);

		/****************** MoreHidden ******************/
		%feature("compactdefaultargs") MoreHidden;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreHidden;
		Standard_Boolean MoreHidden();

		/****************** MoreVisible ******************/
		%feature("compactdefaultargs") MoreVisible;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreVisible;
		Standard_Boolean MoreVisible();

		/****************** NextHidden ******************/
		%feature("compactdefaultargs") NextHidden;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextHidden;
		void NextHidden();

		/****************** NextVisible ******************/
		%feature("compactdefaultargs") NextVisible;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextVisible;
		void NextVisible();

		/****************** Visible ******************/
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", "Returns the bounds and the tolerances of the current visible interval.

Parameters
----------
TolStart: Standard_ShortReal
TolEnd: Standard_ShortReal

Returns
-------
Start: float
End: float
") Visible;
		void Visible(Standard_Real &OutValue, Standard_ShortReal & TolStart, Standard_Real &OutValue, Standard_ShortReal & TolEnd);

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
		/****************** HLRAlgo_EdgeStatus ******************/
		%feature("compactdefaultargs") HLRAlgo_EdgeStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus();

		/****************** HLRAlgo_EdgeStatus ******************/
		%feature("compactdefaultargs") HLRAlgo_EdgeStatus;
		%feature("autodoc", "Creates a new edgestatus. default visible. the edge is bounded by the interval <start>, <end> with the tolerances <tolstart>, <tolend>.

Parameters
----------
Start: float
TolStart: Standard_ShortReal
End: float
TolEnd: Standard_ShortReal

Returns
-------
None
") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus(const Standard_Real Start, const Standard_ShortReal TolStart, const Standard_Real End, const Standard_ShortReal TolEnd);

		/****************** AllHidden ******************/
		%feature("compactdefaultargs") AllHidden;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AllHidden;
		Standard_Boolean AllHidden();

		/****************** AllHidden ******************/
		%feature("compactdefaultargs") AllHidden;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") AllHidden;
		void AllHidden(const Standard_Boolean B);

		/****************** AllVisible ******************/
		%feature("compactdefaultargs") AllVisible;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AllVisible;
		Standard_Boolean AllVisible();

		/****************** AllVisible ******************/
		%feature("compactdefaultargs") AllVisible;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") AllVisible;
		void AllVisible(const Standard_Boolean B);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTolStart: Standard_ShortReal
theTolEnd: Standard_ShortReal

Returns
-------
theStart: float
theEnd: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_ShortReal & theTolStart, Standard_Real &OutValue, Standard_ShortReal & theTolEnd);

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "Hides the interval <start>, <end> with the tolerances <tolstart>, <tolend>. this interval is subtracted from the visible parts. if the hidden part is on ( or under ) the face the flag <onface> is true ( or false ). if the hidden part is on ( or inside ) the boundary of the face the flag <onboundary> is true ( or false ).

Parameters
----------
Start: float
TolStart: Standard_ShortReal
End: float
TolEnd: Standard_ShortReal
OnFace: bool
OnBoundary: bool

Returns
-------
None
") Hide;
		void Hide(const Standard_Real Start, const Standard_ShortReal TolStart, const Standard_Real End, const Standard_ShortReal TolEnd, const Standard_Boolean OnFace, const Standard_Boolean OnBoundary);

		/****************** HideAll ******************/
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "Hide the whole edge.

Returns
-------
None
") HideAll;
		void HideAll();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize an edgestatus. default visible. the edge is bounded by the interval <start>, <end> with the tolerances <tolstart>, <tolend>.

Parameters
----------
Start: float
TolStart: Standard_ShortReal
End: float
TolEnd: Standard_ShortReal

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Real Start, const Standard_ShortReal TolStart, const Standard_Real End, const Standard_ShortReal TolEnd);

		/****************** NbVisiblePart ******************/
		%feature("compactdefaultargs") NbVisiblePart;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVisiblePart;
		Standard_Integer NbVisiblePart();

		/****************** ShowAll ******************/
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "Show the whole edge.

Returns
-------
None
") ShowAll;
		void ShowAll();

		/****************** VisiblePart ******************/
		%feature("compactdefaultargs") VisiblePart;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TolStart: Standard_ShortReal
TolEnd: Standard_ShortReal

Returns
-------
Start: float
End: float
") VisiblePart;
		void VisiblePart(const Standard_Integer Index, Standard_Real &OutValue, Standard_ShortReal & TolStart, Standard_Real &OutValue, Standard_ShortReal & TolEnd);

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
		/****************** HLRAlgo_EdgesBlock ******************/
		%feature("compactdefaultargs") HLRAlgo_EdgesBlock;
		%feature("autodoc", "Create a block of edges for a wire.

Parameters
----------
NbEdges: int

Returns
-------
None
") HLRAlgo_EdgesBlock;
		 HLRAlgo_EdgesBlock(const Standard_Integer NbEdges);

		/****************** Double ******************/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") Double;
		Standard_Boolean Double(const Standard_Integer I);

		/****************** Double ******************/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
B: bool

Returns
-------
None
") Double;
		void Double(const Standard_Integer I, const Standard_Boolean B);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
EI: int

Returns
-------
None
") Edge;
		void Edge(const Standard_Integer I, const Standard_Integer EI);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
int
") Edge;
		Standard_Integer Edge(const Standard_Integer I);

		/****************** Internal ******************/
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") Internal;
		Standard_Boolean Internal(const Standard_Integer I);

		/****************** Internal ******************/
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
B: bool

Returns
-------
None
") Internal;
		void Internal(const Standard_Integer I, const Standard_Boolean B);

		/****************** IsoLine ******************/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") IsoLine;
		Standard_Boolean IsoLine(const Standard_Integer I);

		/****************** IsoLine ******************/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
B: bool

Returns
-------
None
") IsoLine;
		void IsoLine(const Standard_Integer I, const Standard_Boolean B);

		/****************** MinMax ******************/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_EdgesBlock::MinMaxIndices
") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices MinMax();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
Or: TopAbs_Orientation

Returns
-------
None
") Orientation;
		void Orientation(const Standard_Integer I, const TopAbs_Orientation Or);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation(const Standard_Integer I);

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") OutLine;
		Standard_Boolean OutLine(const Standard_Integer I);

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
B: bool

Returns
-------
None
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
		/****************** HLRAlgo_Interference ******************/
		%feature("compactdefaultargs") HLRAlgo_Interference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRAlgo_Interference;
		 HLRAlgo_Interference();

		/****************** HLRAlgo_Interference ******************/
		%feature("compactdefaultargs") HLRAlgo_Interference;
		%feature("autodoc", "No available documentation.

Parameters
----------
Inters: HLRAlgo_Intersection
Bound: HLRAlgo_Coincidence
Orient: TopAbs_Orientation
Trans: TopAbs_Orientation
BTrans: TopAbs_Orientation

Returns
-------
None
") HLRAlgo_Interference;
		 HLRAlgo_Interference(const HLRAlgo_Intersection & Inters, const HLRAlgo_Coincidence & Bound, const TopAbs_Orientation Orient, const TopAbs_Orientation Trans, const TopAbs_Orientation BTrans);

		/****************** Boundary ******************/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: HLRAlgo_Coincidence

Returns
-------
None
") Boundary;
		void Boundary(const HLRAlgo_Coincidence & B);

		/****************** Boundary ******************/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Coincidence
") Boundary;
		const HLRAlgo_Coincidence & Boundary();

		/****************** BoundaryTransition ******************/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
BTr: TopAbs_Orientation

Returns
-------
None
") BoundaryTransition;
		void BoundaryTransition(const TopAbs_Orientation BTr);

		/****************** BoundaryTransition ******************/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition();

		/****************** ChangeBoundary ******************/
		%feature("compactdefaultargs") ChangeBoundary;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Coincidence
") ChangeBoundary;
		HLRAlgo_Coincidence & ChangeBoundary();

		/****************** ChangeIntersection ******************/
		%feature("compactdefaultargs") ChangeIntersection;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Intersection
") ChangeIntersection;
		HLRAlgo_Intersection & ChangeIntersection();

		/****************** Intersection ******************/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: HLRAlgo_Intersection

Returns
-------
None
") Intersection;
		void Intersection(const HLRAlgo_Intersection & I);

		/****************** Intersection ******************/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Intersection
") Intersection;
		const HLRAlgo_Intersection & Intersection();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
O: TopAbs_Orientation

Returns
-------
None
") Orientation;
		void Orientation(const TopAbs_Orientation O);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tr: TopAbs_Orientation

Returns
-------
None
") Transition;
		void Transition(const TopAbs_Orientation Tr);

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
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
		/****************** HLRAlgo_Intersection ******************/
		%feature("compactdefaultargs") HLRAlgo_Intersection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRAlgo_Intersection;
		 HLRAlgo_Intersection();

		/****************** HLRAlgo_Intersection ******************/
		%feature("compactdefaultargs") HLRAlgo_Intersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ori: TopAbs_Orientation
Lev: int
SegInd: int
Ind: int
P: float
Tol: Standard_ShortReal
S: TopAbs_State

Returns
-------
None
") HLRAlgo_Intersection;
		 HLRAlgo_Intersection(const TopAbs_Orientation Ori, const Standard_Integer Lev, const Standard_Integer SegInd, const Standard_Integer Ind, const Standard_Real P, const Standard_ShortReal Tol, const TopAbs_State S);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ind: int

Returns
-------
None
") Index;
		void Index(const Standard_Integer Ind);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lev: int

Returns
-------
None
") Level;
		void Level(const Standard_Integer Lev);

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Level;
		Standard_Integer Level();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ori: TopAbs_Orientation

Returns
-------
None
") Orientation;
		void Orientation(const TopAbs_Orientation Ori);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float

Returns
-------
None
") Parameter;
		void Parameter(const Standard_Real P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SegIndex ******************/
		%feature("compactdefaultargs") SegIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
SegInd: int

Returns
-------
None
") SegIndex;
		void SegIndex(const Standard_Integer SegInd);

		/****************** SegIndex ******************/
		%feature("compactdefaultargs") SegIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SegIndex;
		Standard_Integer SegIndex();

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_State

Returns
-------
None
") State;
		void State(const TopAbs_State S);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: Standard_ShortReal

Returns
-------
None
") Tolerance;
		void Tolerance(const Standard_ShortReal T);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
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
		/****************** HLRAlgo_PolyAlgo ******************/
		%feature("compactdefaultargs") HLRAlgo_PolyAlgo;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRAlgo_PolyAlgo;
		 HLRAlgo_PolyAlgo();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "Process hiding between <pt1> and <pt2>.

Parameters
----------
status: HLRAlgo_EdgeStatus

Returns
-------
Index: int
reg1: bool
regn: bool
outl: bool
intl: bool
") Hide;
		HLRAlgo_BiPoint::PointsT & Hide(HLRAlgo_EdgeStatus & status, Standard_Integer &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
HShell: TColStd_HArray1OfTransient

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TColStd_HArray1OfTransient> & HShell);

		/****************** InitHide ******************/
		%feature("compactdefaultargs") InitHide;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitHide;
		void InitHide();

		/****************** InitShow ******************/
		%feature("compactdefaultargs") InitShow;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitShow;
		void InitShow();

		/****************** MoreHide ******************/
		%feature("compactdefaultargs") MoreHide;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreHide;
		Standard_Boolean MoreHide();

		/****************** MoreShow ******************/
		%feature("compactdefaultargs") MoreShow;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreShow;
		Standard_Boolean MoreShow();

		/****************** NextHide ******************/
		%feature("compactdefaultargs") NextHide;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextHide;
		void NextHide();

		/****************** NextShow ******************/
		%feature("compactdefaultargs") NextShow;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextShow;
		void NextShow();

		/****************** PolyShell ******************/
		%feature("compactdefaultargs") PolyShell;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfTransient
") PolyShell;
		TColStd_Array1OfTransient & PolyShell();

		/****************** Show ******************/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "Process hiding between <pt1> and <pt2>.

Parameters
----------

Returns
-------
Index: int
reg1: bool
regn: bool
outl: bool
intl: bool
") Show;
		HLRAlgo_BiPoint::PointsT & Show(Standard_Integer &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Prepare all the data to process the algo.

Returns
-------
None
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
		/****************** HLRAlgo_PolyData ******************/
		%feature("compactdefaultargs") HLRAlgo_PolyData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRAlgo_PolyData;
		 HLRAlgo_PolyData();

		/****************** FaceIndex ******************/
		%feature("compactdefaultargs") FaceIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") FaceIndex;
		void FaceIndex(const Standard_Integer I);

		/****************** FaceIndex ******************/
		%feature("compactdefaultargs") FaceIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FaceIndex;
		Standard_Integer FaceIndex();

		/****************** HNodes ******************/
		%feature("compactdefaultargs") HNodes;
		%feature("autodoc", "No available documentation.

Parameters
----------
HNodes: TColgp_HArray1OfXYZ

Returns
-------
None
") HNodes;
		void HNodes(const opencascade::handle<TColgp_HArray1OfXYZ> & HNodes);

		/****************** HPHDat ******************/
		%feature("compactdefaultargs") HPHDat;
		%feature("autodoc", "No available documentation.

Parameters
----------
HPHDat: HLRAlgo_HArray1OfPHDat

Returns
-------
None
") HPHDat;
		void HPHDat(const opencascade::handle<HLRAlgo_HArray1OfPHDat> & HPHDat);

		/****************** HTData ******************/
		%feature("compactdefaultargs") HTData;
		%feature("autodoc", "No available documentation.

Parameters
----------
HTData: HLRAlgo_HArray1OfTData

Returns
-------
None
") HTData;
		void HTData(const opencascade::handle<HLRAlgo_HArray1OfTData> & HTData);

		/****************** Hiding ******************/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Hiding;
		Standard_Boolean Hiding();

		/****************** Nodes ******************/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array1OfXYZ
") Nodes;
		TColgp_Array1OfXYZ & Nodes();

		/****************** PHDat ******************/
		%feature("compactdefaultargs") PHDat;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Array1OfPHDat
") PHDat;
		HLRAlgo_Array1OfPHDat & PHDat();

		/****************** TData ******************/
		%feature("compactdefaultargs") TData;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Array1OfTData
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

/*********************************
* class HLRAlgo_PolyInternalData *
*********************************/
class HLRAlgo_PolyInternalData : public Standard_Transient {
	public:
		/****************** HLRAlgo_PolyInternalData ******************/
		%feature("compactdefaultargs") HLRAlgo_PolyInternalData;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbNod: int
nbTri: int

Returns
-------
None
") HLRAlgo_PolyInternalData;
		 HLRAlgo_PolyInternalData(const Standard_Integer nbNod, const Standard_Integer nbTri);

		/****************** AddNode ******************/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "No available documentation.

Parameters
----------
Nod1RValues: HLRAlgo_PolyInternalNode::NodeData
Nod2RValues: HLRAlgo_PolyInternalNode::NodeData
PINod1: HLRAlgo_Array1OfPINod *
PINod2: HLRAlgo_Array1OfPINod *
coef1: float
X3: float
Y3: float
Z3: float

Returns
-------
int
") AddNode;
		Standard_Integer AddNode(HLRAlgo_PolyInternalNode::NodeData & Nod1RValues, HLRAlgo_PolyInternalNode::NodeData & Nod2RValues, HLRAlgo_Array1OfPINod * & PINod1, HLRAlgo_Array1OfPINod * & PINod2, const Standard_Real coef1, const Standard_Real X3, const Standard_Real Y3, const Standard_Real Z3);

		/****************** DecPINod ******************/
		%feature("compactdefaultargs") DecPINod;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DecPINod;
		void DecPINod();

		/****************** DecPISeg ******************/
		%feature("compactdefaultargs") DecPISeg;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DecPISeg;
		void DecPISeg();

		/****************** DecTData ******************/
		%feature("compactdefaultargs") DecTData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DecTData;
		void DecTData();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** IncPINod ******************/
		%feature("compactdefaultargs") IncPINod;
		%feature("autodoc", "No available documentation.

Parameters
----------
PINod1: HLRAlgo_Array1OfPINod *
PINod2: HLRAlgo_Array1OfPINod *

Returns
-------
None
") IncPINod;
		void IncPINod(HLRAlgo_Array1OfPINod * & PINod1, HLRAlgo_Array1OfPINod * & PINod2);

		/****************** IncPISeg ******************/
		%feature("compactdefaultargs") IncPISeg;
		%feature("autodoc", "No available documentation.

Parameters
----------
PISeg1: HLRAlgo_Array1OfPISeg *
PISeg2: HLRAlgo_Array1OfPISeg *

Returns
-------
None
") IncPISeg;
		void IncPISeg(HLRAlgo_Array1OfPISeg * & PISeg1, HLRAlgo_Array1OfPISeg * & PISeg2);

		/****************** IncTData ******************/
		%feature("compactdefaultargs") IncTData;
		%feature("autodoc", "No available documentation.

Parameters
----------
TData1: HLRAlgo_Array1OfTData *
TData2: HLRAlgo_Array1OfTData *

Returns
-------
None
") IncTData;
		void IncTData(HLRAlgo_Array1OfTData * & TData1, HLRAlgo_Array1OfTData * & TData2);

		/****************** IntOutL ******************/
		%feature("compactdefaultargs") IntOutL;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IntOutL;
		Standard_Boolean IntOutL();

		/****************** IntOutL ******************/
		%feature("compactdefaultargs") IntOutL;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") IntOutL;
		void IntOutL(const Standard_Boolean B);

		/****************** NbPINod ******************/
		%feature("compactdefaultargs") NbPINod;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPINod;
		Standard_Integer NbPINod();

		/****************** NbPISeg ******************/
		%feature("compactdefaultargs") NbPISeg;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPISeg;
		Standard_Integer NbPISeg();

		/****************** NbTData ******************/
		%feature("compactdefaultargs") NbTData;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbTData;
		Standard_Integer NbTData();

		/****************** PINod ******************/
		%feature("compactdefaultargs") PINod;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Array1OfPINod
") PINod;
		HLRAlgo_Array1OfPINod & PINod();

		/****************** PISeg ******************/
		%feature("compactdefaultargs") PISeg;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Array1OfPISeg
") PISeg;
		HLRAlgo_Array1OfPISeg & PISeg();

		/****************** Planar ******************/
		%feature("compactdefaultargs") Planar;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Planar;
		Standard_Boolean Planar();

		/****************** Planar ******************/
		%feature("compactdefaultargs") Planar;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Planar;
		void Planar(const Standard_Boolean B);

		/****************** TData ******************/
		%feature("compactdefaultargs") TData;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Array1OfTData
") TData;
		HLRAlgo_Array1OfTData & TData();

		/****************** UpdateLinks ******************/
		%feature("compactdefaultargs") UpdateLinks;
		%feature("autodoc", "No available documentation.

Parameters
----------
TData: HLRAlgo_Array1OfTData *
PISeg: HLRAlgo_Array1OfPISeg *
PINod: HLRAlgo_Array1OfPINod *

Returns
-------
None
") UpdateLinks;
		void UpdateLinks(HLRAlgo_Array1OfTData * & TData, HLRAlgo_Array1OfPISeg * & PISeg, HLRAlgo_Array1OfPINod * & PINod);

		/****************** UpdateLinks ******************/
		%feature("compactdefaultargs") UpdateLinks;
		%feature("autodoc", "No available documentation.

Parameters
----------
ip1: int
ip2: int
ip3: int
TData1: HLRAlgo_Array1OfTData *
TData2: HLRAlgo_Array1OfTData *
PISeg1: HLRAlgo_Array1OfPISeg *
PISeg2: HLRAlgo_Array1OfPISeg *
PINod1: HLRAlgo_Array1OfPINod *
PINod2: HLRAlgo_Array1OfPINod *

Returns
-------
None
") UpdateLinks;
		void UpdateLinks(const Standard_Integer ip1, const Standard_Integer ip2, const Standard_Integer ip3, HLRAlgo_Array1OfTData * & TData1, HLRAlgo_Array1OfTData * & TData2, HLRAlgo_Array1OfPISeg * & PISeg1, HLRAlgo_Array1OfPISeg * & PISeg2, HLRAlgo_Array1OfPINod * & PINod1, HLRAlgo_Array1OfPINod * & PINod2);

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
		/****************** HLRAlgo_PolyInternalNode ******************/
		%feature("compactdefaultargs") HLRAlgo_PolyInternalNode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** HLRAlgo_PolyShellData ******************/
		%feature("compactdefaultargs") HLRAlgo_PolyShellData;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbFace: int

Returns
-------
None
") HLRAlgo_PolyShellData;
		 HLRAlgo_PolyShellData(const Standard_Integer nbFace);

		/****************** Edges ******************/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_ListOfBPoint
") Edges;
		HLRAlgo_ListOfBPoint & Edges();

		/****************** Hiding ******************/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Hiding;
		Standard_Boolean Hiding();

		/****************** HidingPolyData ******************/
		%feature("compactdefaultargs") HidingPolyData;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfTransient
") HidingPolyData;
		TColStd_Array1OfTransient & HidingPolyData();

		/****************** PolyData ******************/
		%feature("compactdefaultargs") PolyData;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfTransient
") PolyData;
		TColStd_Array1OfTransient & PolyData();

		/****************** UpdateGlobalMinMax ******************/
		%feature("compactdefaultargs") UpdateGlobalMinMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
theBox: HLRAlgo_PolyData::Box

Returns
-------
None
") UpdateGlobalMinMax;
		void UpdateGlobalMinMax(HLRAlgo_PolyData::Box & theBox);

		/****************** UpdateHiding ******************/
		%feature("compactdefaultargs") UpdateHiding;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbHiding: int

Returns
-------
None
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
		/****************** HLRAlgo_Projector ******************/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRAlgo_Projector;
		 HLRAlgo_Projector();

		/****************** HLRAlgo_Projector ******************/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "Creates an axonometric projector. <cs> is the viewing coordinate system.

Parameters
----------
CS: gp_Ax2

Returns
-------
None
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Ax2 & CS);

		/****************** HLRAlgo_Projector ******************/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "Creates a perspective projector. <cs> is the viewing coordinate system.

Parameters
----------
CS: gp_Ax2
Focus: float

Returns
-------
None
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Ax2 & CS, const Standard_Real Focus);

		/****************** HLRAlgo_Projector ******************/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "Build a projector with automatic minmax directions.

Parameters
----------
T: gp_Trsf
Persp: bool
Focus: float

Returns
-------
None
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Trsf & T, const Standard_Boolean Persp, const Standard_Real Focus);

		/****************** HLRAlgo_Projector ******************/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "Build a projector with given minmax directions.

Parameters
----------
T: gp_Trsf
Persp: bool
Focus: float
v1: gp_Vec2d
v2: gp_Vec2d
v3: gp_Vec2d

Returns
-------
None
") HLRAlgo_Projector;
		 HLRAlgo_Projector(const gp_Trsf & T, const Standard_Boolean Persp, const Standard_Real Focus, const gp_Vec2d & v1, const gp_Vec2d & v2, const gp_Vec2d & v3);

		/****************** Directions ******************/
		%feature("compactdefaultargs") Directions;
		%feature("autodoc", "No available documentation.

Parameters
----------
D1: gp_Vec2d
D2: gp_Vec2d
D3: gp_Vec2d

Returns
-------
None
") Directions;
		void Directions(gp_Vec2d & D1, gp_Vec2d & D2, gp_Vec2d & D3);

		/****************** Focus ******************/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Returns the focal length.

Returns
-------
float
") Focus;
		Standard_Real Focus();

		/****************** FullTransformation ******************/
		%feature("compactdefaultargs") FullTransformation;
		%feature("autodoc", "Returns the original transformation.

Returns
-------
gp_Trsf
") FullTransformation;
		const gp_Trsf FullTransformation();

		/****************** InvertedTransformation ******************/
		%feature("compactdefaultargs") InvertedTransformation;
		%feature("autodoc", "Returns the active inverted transformation.

Returns
-------
gp_Trsf
") InvertedTransformation;
		const gp_Trsf InvertedTransformation();

		/****************** Perspective ******************/
		%feature("compactdefaultargs") Perspective;
		%feature("autodoc", "Returns true if there is a perspective transformation.

Returns
-------
bool
") Perspective;
		Standard_Boolean Perspective();

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Transform and apply perspective if needed.

Parameters
----------
P: gp_Pnt
Pout: gp_Pnt2d

Returns
-------
None
") Project;
		void Project(const gp_Pnt & P, gp_Pnt2d & Pout);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Transform and apply perspective if needed.

Parameters
----------
P: gp_Pnt

Returns
-------
X: float
Y: float
Z: float
") Project;
		void Project(const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Transform and apply perspective if needed.

Parameters
----------
P: gp_Pnt
D1: gp_Vec
Pout: gp_Pnt2d
D1out: gp_Vec2d

Returns
-------
None
") Project;
		void Project(const gp_Pnt & P, const gp_Vec & D1, gp_Pnt2d & Pout, gp_Vec2d & D1out);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "To compute with the given scale and translation.

Parameters
----------
On: bool,optional
	default value is Standard_False

Returns
-------
None
") Scaled;
		void Scaled(const Standard_Boolean On = Standard_False);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Trsf
Persp: bool
Focus: float

Returns
-------
None
") Set;
		void Set(const gp_Trsf & T, const Standard_Boolean Persp, const Standard_Real Focus);

		/****************** Shoot ******************/
		%feature("compactdefaultargs") Shoot;
		%feature("autodoc", "Return a line going through the eye towards the 2d point <x,y>.

Parameters
----------
X: float
Y: float

Returns
-------
gp_Lin
") Shoot;
		gp_Lin Shoot(const Standard_Real X, const Standard_Real Y);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
D: gp_Vec

Returns
-------
None
") Transform;
		void Transform(gp_Vec & D);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pnt: gp_Pnt

Returns
-------
None
") Transform;
		void Transform(gp_Pnt & Pnt);

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Returns the active transformation.

Returns
-------
gp_Trsf
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
		/****************** HLRAlgo_WiresBlock ******************/
		%feature("compactdefaultargs") HLRAlgo_WiresBlock;
		%feature("autodoc", "Create a block of blocks.

Parameters
----------
NbWires: int

Returns
-------
None
") HLRAlgo_WiresBlock;
		 HLRAlgo_WiresBlock(const Standard_Integer NbWires);

		/****************** MinMax ******************/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_EdgesBlock::MinMaxIndices
") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax();

		/****************** NbWires ******************/
		%feature("compactdefaultargs") NbWires;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbWires;
		Standard_Integer NbWires();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
W: HLRAlgo_EdgesBlock

Returns
-------
None
") Set;
		void Set(const Standard_Integer I, const opencascade::handle<HLRAlgo_EdgesBlock> & W);

		/****************** UpdateMinMax ******************/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMinMaxes: HLRAlgo_EdgesBlock::MinMaxIndices

Returns
-------
None
") UpdateMinMax;
		void UpdateMinMax(const HLRAlgo_EdgesBlock::MinMaxIndices & theMinMaxes);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
opencascade::handle<HLRAlgo_EdgesBlock>
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
class HLRAlgo_HArray1OfPINod : public  HLRAlgo_Array1OfPINod, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfPINod(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfPINod(const Standard_Integer theLower, const Standard_Integer theUpper, const  HLRAlgo_Array1OfPINod::value_type& theValue);
    HLRAlgo_HArray1OfPINod(const  HLRAlgo_Array1OfPINod& theOther);
    const  HLRAlgo_Array1OfPINod& Array1();
     HLRAlgo_Array1OfPINod& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfPINod)


class HLRAlgo_HArray1OfPHDat : public  HLRAlgo_Array1OfPHDat, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfPHDat(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfPHDat(const Standard_Integer theLower, const Standard_Integer theUpper, const  HLRAlgo_Array1OfPHDat::value_type& theValue);
    HLRAlgo_HArray1OfPHDat(const  HLRAlgo_Array1OfPHDat& theOther);
    const  HLRAlgo_Array1OfPHDat& Array1();
     HLRAlgo_Array1OfPHDat& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfPHDat)


class HLRAlgo_HArray1OfTData : public  HLRAlgo_Array1OfTData, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfTData(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfTData(const Standard_Integer theLower, const Standard_Integer theUpper, const  HLRAlgo_Array1OfTData::value_type& theValue);
    HLRAlgo_HArray1OfTData(const  HLRAlgo_Array1OfTData& theOther);
    const  HLRAlgo_Array1OfTData& Array1();
     HLRAlgo_Array1OfTData& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfTData)


class HLRAlgo_HArray1OfPISeg : public  HLRAlgo_Array1OfPISeg, public Standard_Transient {
  public:
    HLRAlgo_HArray1OfPISeg(const Standard_Integer theLower, const Standard_Integer theUpper);
    HLRAlgo_HArray1OfPISeg(const Standard_Integer theLower, const Standard_Integer theUpper, const  HLRAlgo_Array1OfPISeg::value_type& theValue);
    HLRAlgo_HArray1OfPISeg(const  HLRAlgo_Array1OfPISeg& theOther);
    const  HLRAlgo_Array1OfPISeg& Array1();
     HLRAlgo_Array1OfPISeg& ChangeArray1();
};
%make_alias(HLRAlgo_HArray1OfPISeg)


/* harray2 classes */
/* hsequence classes */
