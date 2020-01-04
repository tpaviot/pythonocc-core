/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
%template(HLRAlgo_InterferenceList) NCollection_List <HLRAlgo_Interference>;
%template(HLRAlgo_ListIteratorOfInterferenceList) NCollection_TListIterator<HLRAlgo_Interference>;
%template(HLRAlgo_ListOfBPoint) NCollection_List <HLRAlgo_BiPoint>;
%template(HLRAlgo_ListIteratorOfListOfBPoint) NCollection_TListIterator<HLRAlgo_BiPoint>;
%template(HLRAlgo_Array1OfTData) NCollection_Array1 <HLRAlgo_TriangleData>;

%extend NCollection_Array1 <HLRAlgo_TriangleData> {
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
%template(HLRAlgo_Array1OfPISeg) NCollection_Array1 <HLRAlgo_PolyInternalSegment>;

%extend NCollection_Array1 <HLRAlgo_PolyInternalSegment> {
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
%template(HLRAlgo_Array1OfPINod) NCollection_Array1 <opencascade::handle <HLRAlgo_PolyInternalNode>>;

%extend NCollection_Array1 <opencascade::handle <HLRAlgo_PolyInternalNode>> {
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
/* end templates declaration */

/* typedefs */
typedef NCollection_List <HLRAlgo_Interference> HLRAlgo_InterferenceList;
typedef NCollection_List <HLRAlgo_Interference>::Iterator HLRAlgo_ListIteratorOfInterferenceList;
typedef NCollection_List <HLRAlgo_BiPoint> HLRAlgo_ListOfBPoint;
typedef NCollection_List <HLRAlgo_BiPoint>::Iterator HLRAlgo_ListIteratorOfListOfBPoint;
typedef NCollection_Array1 <HLRAlgo_TriangleData> HLRAlgo_Array1OfTData;
typedef NCollection_Array1 <HLRAlgo_PolyInternalSegment> HLRAlgo_Array1OfPISeg;
typedef NCollection_Array1 <opencascade::handle <HLRAlgo_PolyInternalNode>> HLRAlgo_Array1OfPINod;
/* end typedefs declaration */

/****************
* class HLRAlgo *
****************/
%rename(hlralgo) HLRAlgo;
class HLRAlgo {
	public:
		/****************** AddMinMax ******************/
		%feature("compactdefaultargs") AddMinMax;
		%feature("autodoc", ":param IMin:
	:type IMin: HLRAlgo_EdgesBlock::MinMaxIndices
	:param IMax:
	:type IMax: HLRAlgo_EdgesBlock::MinMaxIndices
	:param OMin:
	:type OMin: HLRAlgo_EdgesBlock::MinMaxIndices
	:param OMax:
	:type OMax: HLRAlgo_EdgesBlock::MinMaxIndices
	:rtype: void") AddMinMax;
		static void AddMinMax (HLRAlgo_EdgesBlock::MinMaxIndices & IMin,HLRAlgo_EdgesBlock::MinMaxIndices & IMax,HLRAlgo_EdgesBlock::MinMaxIndices & OMin,HLRAlgo_EdgesBlock::MinMaxIndices & OMax);

		/****************** CopyMinMax ******************/
		%feature("compactdefaultargs") CopyMinMax;
		%feature("autodoc", ":param IMin:
	:type IMin: HLRAlgo_EdgesBlock::MinMaxIndices
	:param IMax:
	:type IMax: HLRAlgo_EdgesBlock::MinMaxIndices
	:param OMin:
	:type OMin: HLRAlgo_EdgesBlock::MinMaxIndices
	:param OMax:
	:type OMax: HLRAlgo_EdgesBlock::MinMaxIndices
	:rtype: None") CopyMinMax;
		static void CopyMinMax (HLRAlgo_EdgesBlock::MinMaxIndices & IMin,HLRAlgo_EdgesBlock::MinMaxIndices & IMax,HLRAlgo_EdgesBlock::MinMaxIndices & OMin,HLRAlgo_EdgesBlock::MinMaxIndices & OMax);

		/****************** DecodeMinMax ******************/
		%feature("compactdefaultargs") DecodeMinMax;
		%feature("autodoc", ":param MinMax:
	:type MinMax: HLRAlgo_EdgesBlock::MinMaxIndices
	:param Min:
	:type Min: HLRAlgo_EdgesBlock::MinMaxIndices
	:param Max:
	:type Max: HLRAlgo_EdgesBlock::MinMaxIndices
	:rtype: void") DecodeMinMax;
		static void DecodeMinMax (const HLRAlgo_EdgesBlock::MinMaxIndices & MinMax,HLRAlgo_EdgesBlock::MinMaxIndices & Min,HLRAlgo_EdgesBlock::MinMaxIndices & Max);

		/****************** EncodeMinMax ******************/
		%feature("compactdefaultargs") EncodeMinMax;
		%feature("autodoc", ":param Min:
	:type Min: HLRAlgo_EdgesBlock::MinMaxIndices
	:param Max:
	:type Max: HLRAlgo_EdgesBlock::MinMaxIndices
	:param MinMax:
	:type MinMax: HLRAlgo_EdgesBlock::MinMaxIndices
	:rtype: void") EncodeMinMax;
		static void EncodeMinMax (HLRAlgo_EdgesBlock::MinMaxIndices & Min,HLRAlgo_EdgesBlock::MinMaxIndices & Max,HLRAlgo_EdgesBlock::MinMaxIndices & MinMax);

		/****************** EnlargeMinMax ******************/
		%feature("compactdefaultargs") EnlargeMinMax;
		%feature("autodoc", ":param tol:
	:type tol: float
	:param Min:
	:type Min: float
	:param Max:
	:type Max: float
	:rtype: void") EnlargeMinMax;
		static void EnlargeMinMax (const Standard_Real tol,Standard_Real Min[16],Standard_Real Max[16]);

		/****************** InitMinMax ******************/
		%feature("compactdefaultargs") InitMinMax;
		%feature("autodoc", ":param Big:
	:type Big: float
	:param Min:
	:type Min: float
	:param Max:
	:type Max: float
	:rtype: void") InitMinMax;
		static void InitMinMax (const Standard_Real Big,Standard_Real Min[16],Standard_Real Max[16]);

		/****************** SizeBox ******************/
		%feature("compactdefaultargs") SizeBox;
		%feature("autodoc", ":param Min:
	:type Min: HLRAlgo_EdgesBlock::MinMaxIndices
	:param Max:
	:type Max: HLRAlgo_EdgesBlock::MinMaxIndices
	:rtype: float") SizeBox;
		static Standard_Real SizeBox (HLRAlgo_EdgesBlock::MinMaxIndices & Min,HLRAlgo_EdgesBlock::MinMaxIndices & Max);

		/****************** UpdateMinMax ******************/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "* Iterator on the visible or hidden parts of an EdgeStatus.
	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param Min:
	:type Min: float
	:param Max:
	:type Max: float
	:rtype: void") UpdateMinMax;
		static void UpdateMinMax (const Standard_Real x,const Standard_Real y,const Standard_Real z,Standard_Real Min[16],Standard_Real Max[16]);

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
		%feature("autodoc", ":rtype: None") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint ();

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", ":param X1:
	:type X1: float
	:param Y1:
	:type Y1: float
	:param Z1:
	:type Z1: float
	:param X2:
	:type X2: float
	:param Y2:
	:type Y2: float
	:param Z2:
	:type Z2: float
	:param XT1:
	:type XT1: float
	:param YT1:
	:type YT1: float
	:param ZT1:
	:type ZT1: float
	:param XT2:
	:type XT2: float
	:param YT2:
	:type YT2: float
	:param ZT2:
	:type ZT2: float
	:param Index:
	:type Index: int
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", ":param X1:
	:type X1: float
	:param Y1:
	:type Y1: float
	:param Z1:
	:type Z1: float
	:param X2:
	:type X2: float
	:param Y2:
	:type Y2: float
	:param Z2:
	:type Z2: float
	:param XT1:
	:type XT1: float
	:param YT1:
	:type YT1: float
	:param ZT1:
	:type ZT1: float
	:param XT2:
	:type XT2: float
	:param YT2:
	:type YT2: float
	:param ZT2:
	:type ZT2: float
	:param Index:
	:type Index: int
	:param flag:
	:type flag: int
	:rtype: None") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer flag);

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", ":param X1:
	:type X1: float
	:param Y1:
	:type Y1: float
	:param Z1:
	:type Z1: float
	:param X2:
	:type X2: float
	:param Y2:
	:type Y2: float
	:param Z2:
	:type Z2: float
	:param XT1:
	:type XT1: float
	:param YT1:
	:type YT1: float
	:param ZT1:
	:type ZT1: float
	:param XT2:
	:type XT2: float
	:param YT2:
	:type YT2: float
	:param ZT2:
	:type ZT2: float
	:param Index:
	:type Index: int
	:param i1:
	:type i1: int
	:param i1p1:
	:type i1p1: int
	:param i1p2:
	:type i1p2: int
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", ":param X1:
	:type X1: float
	:param Y1:
	:type Y1: float
	:param Z1:
	:type Z1: float
	:param X2:
	:type X2: float
	:param Y2:
	:type Y2: float
	:param Z2:
	:type Z2: float
	:param XT1:
	:type XT1: float
	:param YT1:
	:type YT1: float
	:param ZT1:
	:type ZT1: float
	:param XT2:
	:type XT2: float
	:param YT2:
	:type YT2: float
	:param ZT2:
	:type ZT2: float
	:param Index:
	:type Index: int
	:param i1:
	:type i1: int
	:param i1p1:
	:type i1p1: int
	:param i1p2:
	:type i1p2: int
	:param flag:
	:type flag: int
	:rtype: None") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Integer flag);

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", ":param X1:
	:type X1: float
	:param Y1:
	:type Y1: float
	:param Z1:
	:type Z1: float
	:param X2:
	:type X2: float
	:param Y2:
	:type Y2: float
	:param Z2:
	:type Z2: float
	:param XT1:
	:type XT1: float
	:param YT1:
	:type YT1: float
	:param ZT1:
	:type ZT1: float
	:param XT2:
	:type XT2: float
	:param YT2:
	:type YT2: float
	:param ZT2:
	:type ZT2: float
	:param Index:
	:type Index: int
	:param i1:
	:type i1: int
	:param i1p1:
	:type i1p1: int
	:param i1p2:
	:type i1p2: int
	:param i2:
	:type i2: int
	:param i2p1:
	:type i2p1: int
	:param i2p2:
	:type i2p2: int
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Integer i2,const Standard_Integer i2p1,const Standard_Integer i2p2,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);

		/****************** HLRAlgo_BiPoint ******************/
		%feature("compactdefaultargs") HLRAlgo_BiPoint;
		%feature("autodoc", ":param X1:
	:type X1: float
	:param Y1:
	:type Y1: float
	:param Z1:
	:type Z1: float
	:param X2:
	:type X2: float
	:param Y2:
	:type Y2: float
	:param Z2:
	:type Z2: float
	:param XT1:
	:type XT1: float
	:param YT1:
	:type YT1: float
	:param ZT1:
	:type ZT1: float
	:param XT2:
	:type XT2: float
	:param YT2:
	:type YT2: float
	:param ZT2:
	:type ZT2: float
	:param Index:
	:type Index: int
	:param i1:
	:type i1: int
	:param i1p1:
	:type i1p1: int
	:param i1p2:
	:type i1p2: int
	:param i2:
	:type i2: int
	:param i2p1:
	:type i2p1: int
	:param i2p2:
	:type i2p2: int
	:param flag:
	:type flag: int
	:rtype: None") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Integer i2,const Standard_Integer i2p1,const Standard_Integer i2p2,const Standard_Integer flag);

		/****************** Hidden ******************/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", ":rtype: bool") Hidden;
		Standard_Boolean Hidden ();

		/****************** Hidden ******************/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Hidden;
		void Hidden (const Standard_Boolean B);

		/****************** IntLine ******************/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", ":rtype: bool") IntLine;
		Standard_Boolean IntLine ();

		/****************** IntLine ******************/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") IntLine;
		void IntLine (const Standard_Boolean B);

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", ":rtype: bool") OutLine;
		Standard_Boolean OutLine ();

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") OutLine;
		void OutLine (const Standard_Boolean B);

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", ":rtype: bool") Rg1Line;
		Standard_Boolean Rg1Line ();

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Rg1Line;
		void Rg1Line (const Standard_Boolean B);

		/****************** RgNLine ******************/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", ":rtype: bool") RgNLine;
		Standard_Boolean RgNLine ();

		/****************** RgNLine ******************/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") RgNLine;
		void RgNLine (const Standard_Boolean B);

};


%extend HLRAlgo_BiPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class HLRAlgo_Coincidence *
****************************/
class HLRAlgo_Coincidence {
	public:
		/****************** HLRAlgo_Coincidence ******************/
		%feature("compactdefaultargs") HLRAlgo_Coincidence;
		%feature("autodoc", ":rtype: None") HLRAlgo_Coincidence;
		 HLRAlgo_Coincidence ();

		/****************** Set2D ******************/
		%feature("compactdefaultargs") Set2D;
		%feature("autodoc", ":param FE:
	:type FE: int
	:param Param:
	:type Param: float
	:rtype: None") Set2D;
		void Set2D (const Standard_Integer FE,const Standard_Real Param);

		/****************** SetState3D ******************/
		%feature("compactdefaultargs") SetState3D;
		%feature("autodoc", ":param stbef:
	:type stbef: TopAbs_State
	:param staft:
	:type staft: TopAbs_State
	:rtype: None") SetState3D;
		void SetState3D (const TopAbs_State stbef,const TopAbs_State staft);

		/****************** State3D ******************/
		%feature("compactdefaultargs") State3D;
		%feature("autodoc", ":param stbef:
	:type stbef: TopAbs_State
	:param staft:
	:type staft: TopAbs_State
	:rtype: None") State3D;
		void State3D (TopAbs_State & stbef,TopAbs_State & staft);

		/****************** Value2D ******************/
		%feature("compactdefaultargs") Value2D;
		%feature("autodoc", ":param FE:
	:type FE: int
	:param Param:
	:type Param: float
	:rtype: None") Value2D;
		void Value2D (Standard_Integer &OutValue,Standard_Real &OutValue);

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
		%feature("autodoc", "* Iterator on the visible or hidden parts of an edge.
	:rtype: None") HLRAlgo_EdgeIterator;
		 HLRAlgo_EdgeIterator ();

		/****************** Hidden ******************/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "* Returns the bounds and the tolerances of the current Hidden Interval
	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None") Hidden;
		void Hidden (Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);

		/****************** InitHidden ******************/
		%feature("compactdefaultargs") InitHidden;
		%feature("autodoc", ":param status:
	:type status: HLRAlgo_EdgeStatus
	:rtype: None") InitHidden;
		void InitHidden (HLRAlgo_EdgeStatus & status);

		/****************** InitVisible ******************/
		%feature("compactdefaultargs") InitVisible;
		%feature("autodoc", ":param status:
	:type status: HLRAlgo_EdgeStatus
	:rtype: None") InitVisible;
		void InitVisible (HLRAlgo_EdgeStatus & status);

		/****************** MoreHidden ******************/
		%feature("compactdefaultargs") MoreHidden;
		%feature("autodoc", ":rtype: bool") MoreHidden;
		Standard_Boolean MoreHidden ();

		/****************** MoreVisible ******************/
		%feature("compactdefaultargs") MoreVisible;
		%feature("autodoc", ":rtype: bool") MoreVisible;
		Standard_Boolean MoreVisible ();

		/****************** NextHidden ******************/
		%feature("compactdefaultargs") NextHidden;
		%feature("autodoc", ":rtype: None") NextHidden;
		void NextHidden ();

		/****************** NextVisible ******************/
		%feature("compactdefaultargs") NextVisible;
		%feature("autodoc", ":rtype: None") NextVisible;
		void NextVisible ();

		/****************** Visible ******************/
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", "* Returns the bounds and the tolerances of the current Visible Interval
	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None") Visible;
		void Visible (Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);

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
		/****************** AllHidden ******************/
		%feature("compactdefaultargs") AllHidden;
		%feature("autodoc", ":rtype: bool") AllHidden;
		Standard_Boolean AllHidden ();

		/****************** AllHidden ******************/
		%feature("compactdefaultargs") AllHidden;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") AllHidden;
		void AllHidden (const Standard_Boolean B);

		/****************** AllVisible ******************/
		%feature("compactdefaultargs") AllVisible;
		%feature("autodoc", ":rtype: bool") AllVisible;
		Standard_Boolean AllVisible ();

		/****************** AllVisible ******************/
		%feature("compactdefaultargs") AllVisible;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") AllVisible;
		void AllVisible (const Standard_Boolean B);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", ":param theStart:
	:type theStart: float
	:param theTolStart:
	:type theTolStart: Standard_ShortReal
	:param theEnd:
	:type theEnd: float
	:param theTolEnd:
	:type theTolEnd: Standard_ShortReal
	:rtype: None") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_ShortReal & theTolStart,Standard_Real &OutValue,Standard_ShortReal & theTolEnd);

		/****************** HLRAlgo_EdgeStatus ******************/
		%feature("compactdefaultargs") HLRAlgo_EdgeStatus;
		%feature("autodoc", ":rtype: None") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus ();

		/****************** HLRAlgo_EdgeStatus ******************/
		%feature("compactdefaultargs") HLRAlgo_EdgeStatus;
		%feature("autodoc", "* Creates a new EdgeStatus. Default visible. The Edge is bounded by the interval <Start>, <End> with the tolerances <TolStart>, <TolEnd>.
	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "* Hides the interval <Start>, <End> with the tolerances <TolStart>, <TolEnd>. This interval is subtracted from the visible parts. If the hidden part is on ( or under ) the face the flag <OnFace> is True ( or False ). If the hidden part is on ( or inside ) the boundary of the face the flag <OnBoundary> is True ( or False ).
	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:param OnFace:
	:type OnFace: bool
	:param OnBoundary:
	:type OnBoundary: bool
	:rtype: None") Hide;
		void Hide (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd,const Standard_Boolean OnFace,const Standard_Boolean OnBoundary);

		/****************** HideAll ******************/
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "* Hide the whole Edge.
	:rtype: None") HideAll;
		void HideAll ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initialize an EdgeStatus. Default visible. The Edge is bounded by the interval <Start>, <End> with the tolerances <TolStart>, <TolEnd>.
	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None") Initialize;
		void Initialize (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);

		/****************** NbVisiblePart ******************/
		%feature("compactdefaultargs") NbVisiblePart;
		%feature("autodoc", ":rtype: int") NbVisiblePart;
		Standard_Integer NbVisiblePart ();

		/****************** ShowAll ******************/
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "* Show the whole Edge.
	:rtype: None") ShowAll;
		void ShowAll ();

		/****************** VisiblePart ******************/
		%feature("compactdefaultargs") VisiblePart;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None") VisiblePart;
		void VisiblePart (const Standard_Integer Index,Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);

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
		/****************** Double ******************/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") Double;
		Standard_Boolean Double (const Standard_Integer I);

		/****************** Double ******************/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", ":param I:
	:type I: int
	:param B:
	:type B: bool
	:rtype: None") Double;
		void Double (const Standard_Integer I,const Standard_Boolean B);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":param I:
	:type I: int
	:param EI:
	:type EI: int
	:rtype: None") Edge;
		void Edge (const Standard_Integer I,const Standard_Integer EI);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: int") Edge;
		Standard_Integer Edge (const Standard_Integer I);

		/****************** HLRAlgo_EdgesBlock ******************/
		%feature("compactdefaultargs") HLRAlgo_EdgesBlock;
		%feature("autodoc", "* Create a Block of Edges for a wire.
	:param NbEdges:
	:type NbEdges: int
	:rtype: None") HLRAlgo_EdgesBlock;
		 HLRAlgo_EdgesBlock (const Standard_Integer NbEdges);

		/****************** Internal ******************/
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") Internal;
		Standard_Boolean Internal (const Standard_Integer I);

		/****************** Internal ******************/
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", ":param I:
	:type I: int
	:param B:
	:type B: bool
	:rtype: None") Internal;
		void Internal (const Standard_Integer I,const Standard_Boolean B);

		/****************** IsoLine ******************/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") IsoLine;
		Standard_Boolean IsoLine (const Standard_Integer I);

		/****************** IsoLine ******************/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", ":param I:
	:type I: int
	:param B:
	:type B: bool
	:rtype: None") IsoLine;
		void IsoLine (const Standard_Integer I,const Standard_Boolean B);

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", ":rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param I:
	:type I: int
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None") Orientation;
		void Orientation (const Standard_Integer I,const TopAbs_Orientation Or);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation (const Standard_Integer I);

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") OutLine;
		Standard_Boolean OutLine (const Standard_Integer I);

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", ":param I:
	:type I: int
	:param B:
	:type B: bool
	:rtype: None") OutLine;
		void OutLine (const Standard_Integer I,const Standard_Boolean B);

};


%make_alias(HLRAlgo_EdgesBlock)

%extend HLRAlgo_EdgesBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRAlgo_Interference *
*****************************/
class HLRAlgo_Interference {
	public:
		/****************** Boundary ******************/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", ":param B:
	:type B: HLRAlgo_Coincidence
	:rtype: None") Boundary;
		void Boundary (const HLRAlgo_Coincidence & B);

		/****************** Boundary ******************/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", ":rtype: HLRAlgo_Coincidence") Boundary;
		const HLRAlgo_Coincidence & Boundary ();

		/****************** BoundaryTransition ******************/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", ":param BTr:
	:type BTr: TopAbs_Orientation
	:rtype: None") BoundaryTransition;
		void BoundaryTransition (const TopAbs_Orientation BTr);

		/****************** BoundaryTransition ******************/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", ":rtype: TopAbs_Orientation") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition ();

		/****************** ChangeBoundary ******************/
		%feature("compactdefaultargs") ChangeBoundary;
		%feature("autodoc", ":rtype: HLRAlgo_Coincidence") ChangeBoundary;
		HLRAlgo_Coincidence & ChangeBoundary ();

		/****************** ChangeIntersection ******************/
		%feature("compactdefaultargs") ChangeIntersection;
		%feature("autodoc", ":rtype: HLRAlgo_Intersection") ChangeIntersection;
		HLRAlgo_Intersection & ChangeIntersection ();

		/****************** HLRAlgo_Interference ******************/
		%feature("compactdefaultargs") HLRAlgo_Interference;
		%feature("autodoc", ":rtype: None") HLRAlgo_Interference;
		 HLRAlgo_Interference ();

		/****************** HLRAlgo_Interference ******************/
		%feature("compactdefaultargs") HLRAlgo_Interference;
		%feature("autodoc", ":param Inters:
	:type Inters: HLRAlgo_Intersection
	:param Bound:
	:type Bound: HLRAlgo_Coincidence
	:param Orient:
	:type Orient: TopAbs_Orientation
	:param Trans:
	:type Trans: TopAbs_Orientation
	:param BTrans:
	:type BTrans: TopAbs_Orientation
	:rtype: None") HLRAlgo_Interference;
		 HLRAlgo_Interference (const HLRAlgo_Intersection & Inters,const HLRAlgo_Coincidence & Bound,const TopAbs_Orientation Orient,const TopAbs_Orientation Trans,const TopAbs_Orientation BTrans);

		/****************** Intersection ******************/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", ":param I:
	:type I: HLRAlgo_Intersection
	:rtype: None") Intersection;
		void Intersection (const HLRAlgo_Intersection & I);

		/****************** Intersection ******************/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", ":rtype: HLRAlgo_Intersection") Intersection;
		const HLRAlgo_Intersection & Intersection ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param O:
	:type O: TopAbs_Orientation
	:rtype: None") Orientation;
		void Orientation (const TopAbs_Orientation O);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", ":param Tr:
	:type Tr: TopAbs_Orientation
	:rtype: None") Transition;
		void Transition (const TopAbs_Orientation Tr);

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Transition;
		TopAbs_Orientation Transition ();

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
		%feature("autodoc", ":rtype: None") HLRAlgo_Intersection;
		 HLRAlgo_Intersection ();

		/****************** HLRAlgo_Intersection ******************/
		%feature("compactdefaultargs") HLRAlgo_Intersection;
		%feature("autodoc", ":param Ori:
	:type Ori: TopAbs_Orientation
	:param Lev:
	:type Lev: int
	:param SegInd:
	:type SegInd: int
	:param Ind:
	:type Ind: int
	:param P:
	:type P: float
	:param Tol:
	:type Tol: Standard_ShortReal
	:param S:
	:type S: TopAbs_State
	:rtype: None") HLRAlgo_Intersection;
		 HLRAlgo_Intersection (const TopAbs_Orientation Ori,const Standard_Integer Lev,const Standard_Integer SegInd,const Standard_Integer Ind,const Standard_Real P,const Standard_ShortReal Tol,const TopAbs_State S);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":param Ind:
	:type Ind: int
	:rtype: None") Index;
		void Index (const Standard_Integer Ind);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":rtype: int") Index;
		Standard_Integer Index ();

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", ":param Lev:
	:type Lev: int
	:rtype: None") Level;
		void Level (const Standard_Integer Lev);

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", ":rtype: int") Level;
		Standard_Integer Level ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param Ori:
	:type Ori: TopAbs_Orientation
	:rtype: None") Orientation;
		void Orientation (const TopAbs_Orientation Ori);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param P:
	:type P: float
	:rtype: None") Parameter;
		void Parameter (const Standard_Real P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** SegIndex ******************/
		%feature("compactdefaultargs") SegIndex;
		%feature("autodoc", ":param SegInd:
	:type SegInd: int
	:rtype: None") SegIndex;
		void SegIndex (const Standard_Integer SegInd);

		/****************** SegIndex ******************/
		%feature("compactdefaultargs") SegIndex;
		%feature("autodoc", ":rtype: int") SegIndex;
		Standard_Integer SegIndex ();

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:rtype: None") State;
		void State (const TopAbs_State S);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", ":rtype: TopAbs_State") State;
		TopAbs_State State ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":param T:
	:type T: Standard_ShortReal
	:rtype: None") Tolerance;
		void Tolerance (const Standard_ShortReal T);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: Standard_ShortReal") Tolerance;
		Standard_ShortReal Tolerance ();

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
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** HLRAlgo_PolyAlgo ******************/
		%feature("compactdefaultargs") HLRAlgo_PolyAlgo;
		%feature("autodoc", ":rtype: None") HLRAlgo_PolyAlgo;
		 HLRAlgo_PolyAlgo ();

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "* process hiding between <Pt1> and <Pt2>.
	:param status:
	:type status: HLRAlgo_EdgeStatus
	:param Index:
	:type Index: int
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: HLRAlgo_BiPoint::PointsT") Hide;
		HLRAlgo_BiPoint::PointsT & Hide (HLRAlgo_EdgeStatus & status,Standard_Integer &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param HShell:
	:type HShell: TColStd_HArray1OfTransient
	:rtype: None") Init;
		void Init (const opencascade::handle<TColStd_HArray1OfTransient> & HShell);

		/****************** InitHide ******************/
		%feature("compactdefaultargs") InitHide;
		%feature("autodoc", ":rtype: None") InitHide;
		void InitHide ();

		/****************** InitShow ******************/
		%feature("compactdefaultargs") InitShow;
		%feature("autodoc", ":rtype: None") InitShow;
		void InitShow ();

		/****************** MoreHide ******************/
		%feature("compactdefaultargs") MoreHide;
		%feature("autodoc", ":rtype: bool") MoreHide;
		Standard_Boolean MoreHide ();

		/****************** MoreShow ******************/
		%feature("compactdefaultargs") MoreShow;
		%feature("autodoc", ":rtype: bool") MoreShow;
		Standard_Boolean MoreShow ();

		/****************** NextHide ******************/
		%feature("compactdefaultargs") NextHide;
		%feature("autodoc", ":rtype: None") NextHide;
		void NextHide ();

		/****************** NextShow ******************/
		%feature("compactdefaultargs") NextShow;
		%feature("autodoc", ":rtype: None") NextShow;
		void NextShow ();

		/****************** PolyShell ******************/
		%feature("compactdefaultargs") PolyShell;
		%feature("autodoc", ":rtype: TColStd_Array1OfTransient") PolyShell;
		TColStd_Array1OfTransient & PolyShell ();

		/****************** Show ******************/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "* process hiding between <Pt1> and <Pt2>.
	:param Index:
	:type Index: int
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: HLRAlgo_BiPoint::PointsT") Show;
		HLRAlgo_BiPoint::PointsT & Show (Standard_Integer &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Prepare all the data to process the algo.
	:rtype: None") Update;
		void Update ();

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
		/****************** FaceIndex ******************/
		%feature("compactdefaultargs") FaceIndex;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") FaceIndex;
		void FaceIndex (const Standard_Integer I);

		/****************** FaceIndex ******************/
		%feature("compactdefaultargs") FaceIndex;
		%feature("autodoc", ":rtype: int") FaceIndex;
		Standard_Integer FaceIndex ();

		/****************** HLRAlgo_PolyData ******************/
		%feature("compactdefaultargs") HLRAlgo_PolyData;
		%feature("autodoc", ":rtype: None") HLRAlgo_PolyData;
		 HLRAlgo_PolyData ();

		/****************** HNodes ******************/
		%feature("compactdefaultargs") HNodes;
		%feature("autodoc", ":param HNodes:
	:type HNodes: TColgp_HArray1OfXYZ
	:rtype: None") HNodes;
		void HNodes (const opencascade::handle<TColgp_HArray1OfXYZ> & HNodes);

		/****************** HPHDat ******************/
		%feature("compactdefaultargs") HPHDat;
		%feature("autodoc", ":param HPHDat:
	:type HPHDat: HLRAlgo_HArray1OfPHDat
	:rtype: None") HPHDat;
		void HPHDat (const opencascade::handle<HLRAlgo_HArray1OfPHDat> & HPHDat);

		/****************** HTData ******************/
		%feature("compactdefaultargs") HTData;
		%feature("autodoc", ":param HTData:
	:type HTData: HLRAlgo_HArray1OfTData
	:rtype: None") HTData;
		void HTData (const opencascade::handle<HLRAlgo_HArray1OfTData> & HTData);

		/****************** Hiding ******************/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", ":rtype: bool") Hiding;
		Standard_Boolean Hiding ();

		/****************** Nodes ******************/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", ":rtype: TColgp_Array1OfXYZ") Nodes;
		TColgp_Array1OfXYZ & Nodes ();

		/****************** PHDat ******************/
		%feature("compactdefaultargs") PHDat;
		%feature("autodoc", ":rtype: HLRAlgo_Array1OfPHDat") PHDat;
		HLRAlgo_Array1OfPHDat & PHDat ();

		/****************** TData ******************/
		%feature("compactdefaultargs") TData;
		%feature("autodoc", ":rtype: HLRAlgo_Array1OfTData") TData;
		HLRAlgo_Array1OfTData & TData ();

};


%make_alias(HLRAlgo_PolyData)

%extend HLRAlgo_PolyData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class HLRAlgo_PolyInternalData *
*********************************/
class HLRAlgo_PolyInternalData : public Standard_Transient {
	public:
		/****************** AddNode ******************/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", ":param Nod1RValues:
	:type Nod1RValues: HLRAlgo_PolyInternalNode::NodeData
	:param Nod2RValues:
	:type Nod2RValues: HLRAlgo_PolyInternalNode::NodeData
	:param PINod1:
	:type PINod1: HLRAlgo_Array1OfPINod *
	:param PINod2:
	:type PINod2: HLRAlgo_Array1OfPINod *
	:param coef1:
	:type coef1: float
	:param X3:
	:type X3: float
	:param Y3:
	:type Y3: float
	:param Z3:
	:type Z3: float
	:rtype: int") AddNode;
		Standard_Integer AddNode (HLRAlgo_PolyInternalNode::NodeData & Nod1RValues,HLRAlgo_PolyInternalNode::NodeData & Nod2RValues,HLRAlgo_Array1OfPINod * & PINod1,HLRAlgo_Array1OfPINod * & PINod2,const Standard_Real coef1,const Standard_Real X3,const Standard_Real Y3,const Standard_Real Z3);

		/****************** DecPINod ******************/
		%feature("compactdefaultargs") DecPINod;
		%feature("autodoc", ":rtype: None") DecPINod;
		void DecPINod ();

		/****************** DecPISeg ******************/
		%feature("compactdefaultargs") DecPISeg;
		%feature("autodoc", ":rtype: None") DecPISeg;
		void DecPISeg ();

		/****************** DecTData ******************/
		%feature("compactdefaultargs") DecTData;
		%feature("autodoc", ":rtype: None") DecTData;
		void DecTData ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** HLRAlgo_PolyInternalData ******************/
		%feature("compactdefaultargs") HLRAlgo_PolyInternalData;
		%feature("autodoc", ":param nbNod:
	:type nbNod: int
	:param nbTri:
	:type nbTri: int
	:rtype: None") HLRAlgo_PolyInternalData;
		 HLRAlgo_PolyInternalData (const Standard_Integer nbNod,const Standard_Integer nbTri);

		/****************** IncPINod ******************/
		%feature("compactdefaultargs") IncPINod;
		%feature("autodoc", ":param PINod1:
	:type PINod1: HLRAlgo_Array1OfPINod *
	:param PINod2:
	:type PINod2: HLRAlgo_Array1OfPINod *
	:rtype: None") IncPINod;
		void IncPINod (HLRAlgo_Array1OfPINod * & PINod1,HLRAlgo_Array1OfPINod * & PINod2);

		/****************** IncPISeg ******************/
		%feature("compactdefaultargs") IncPISeg;
		%feature("autodoc", ":param PISeg1:
	:type PISeg1: HLRAlgo_Array1OfPISeg *
	:param PISeg2:
	:type PISeg2: HLRAlgo_Array1OfPISeg *
	:rtype: None") IncPISeg;
		void IncPISeg (HLRAlgo_Array1OfPISeg * & PISeg1,HLRAlgo_Array1OfPISeg * & PISeg2);

		/****************** IncTData ******************/
		%feature("compactdefaultargs") IncTData;
		%feature("autodoc", ":param TData1:
	:type TData1: HLRAlgo_Array1OfTData *
	:param TData2:
	:type TData2: HLRAlgo_Array1OfTData *
	:rtype: None") IncTData;
		void IncTData (HLRAlgo_Array1OfTData * & TData1,HLRAlgo_Array1OfTData * & TData2);

		/****************** IntOutL ******************/
		%feature("compactdefaultargs") IntOutL;
		%feature("autodoc", ":rtype: bool") IntOutL;
		Standard_Boolean IntOutL ();

		/****************** IntOutL ******************/
		%feature("compactdefaultargs") IntOutL;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") IntOutL;
		void IntOutL (const Standard_Boolean B);

		/****************** NbPINod ******************/
		%feature("compactdefaultargs") NbPINod;
		%feature("autodoc", ":rtype: int") NbPINod;
		Standard_Integer NbPINod ();

		/****************** NbPISeg ******************/
		%feature("compactdefaultargs") NbPISeg;
		%feature("autodoc", ":rtype: int") NbPISeg;
		Standard_Integer NbPISeg ();

		/****************** NbTData ******************/
		%feature("compactdefaultargs") NbTData;
		%feature("autodoc", ":rtype: int") NbTData;
		Standard_Integer NbTData ();

		/****************** PINod ******************/
		%feature("compactdefaultargs") PINod;
		%feature("autodoc", ":rtype: HLRAlgo_Array1OfPINod") PINod;
		HLRAlgo_Array1OfPINod & PINod ();

		/****************** PISeg ******************/
		%feature("compactdefaultargs") PISeg;
		%feature("autodoc", ":rtype: HLRAlgo_Array1OfPISeg") PISeg;
		HLRAlgo_Array1OfPISeg & PISeg ();

		/****************** Planar ******************/
		%feature("compactdefaultargs") Planar;
		%feature("autodoc", ":rtype: bool") Planar;
		Standard_Boolean Planar ();

		/****************** Planar ******************/
		%feature("compactdefaultargs") Planar;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Planar;
		void Planar (const Standard_Boolean B);

		/****************** TData ******************/
		%feature("compactdefaultargs") TData;
		%feature("autodoc", ":rtype: HLRAlgo_Array1OfTData") TData;
		HLRAlgo_Array1OfTData & TData ();

		/****************** UpdateLinks ******************/
		%feature("compactdefaultargs") UpdateLinks;
		%feature("autodoc", ":param TData:
	:type TData: HLRAlgo_Array1OfTData *
	:param PISeg:
	:type PISeg: HLRAlgo_Array1OfPISeg *
	:param PINod:
	:type PINod: HLRAlgo_Array1OfPINod *
	:rtype: None") UpdateLinks;
		void UpdateLinks (HLRAlgo_Array1OfTData * & TData,HLRAlgo_Array1OfPISeg * & PISeg,HLRAlgo_Array1OfPINod * & PINod);

		/****************** UpdateLinks ******************/
		%feature("compactdefaultargs") UpdateLinks;
		%feature("autodoc", ":param ip1:
	:type ip1: int
	:param ip2:
	:type ip2: int
	:param ip3:
	:type ip3: int
	:param TData1:
	:type TData1: HLRAlgo_Array1OfTData *
	:param TData2:
	:type TData2: HLRAlgo_Array1OfTData *
	:param PISeg1:
	:type PISeg1: HLRAlgo_Array1OfPISeg *
	:param PISeg2:
	:type PISeg2: HLRAlgo_Array1OfPISeg *
	:param PINod1:
	:type PINod1: HLRAlgo_Array1OfPINod *
	:param PINod2:
	:type PINod2: HLRAlgo_Array1OfPINod *
	:rtype: None") UpdateLinks;
		void UpdateLinks (const Standard_Integer ip1,const Standard_Integer ip2,const Standard_Integer ip3,HLRAlgo_Array1OfTData * & TData1,HLRAlgo_Array1OfTData * & TData2,HLRAlgo_Array1OfPISeg * & PISeg1,HLRAlgo_Array1OfPISeg * & PISeg2,HLRAlgo_Array1OfPINod * & PINod1,HLRAlgo_Array1OfPINod * & PINod2);

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
		%feature("autodoc", ":rtype: None") HLRAlgo_PolyInternalNode;
		 HLRAlgo_PolyInternalNode ();

};


%make_alias(HLRAlgo_PolyInternalNode)

%extend HLRAlgo_PolyInternalNode {
	%pythoncode {
	__repr__ = _dumps_object
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
		/****************** Edges ******************/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", ":rtype: HLRAlgo_ListOfBPoint") Edges;
		HLRAlgo_ListOfBPoint & Edges ();

		/****************** HLRAlgo_PolyShellData ******************/
		%feature("compactdefaultargs") HLRAlgo_PolyShellData;
		%feature("autodoc", ":param nbFace:
	:type nbFace: int
	:rtype: None") HLRAlgo_PolyShellData;
		 HLRAlgo_PolyShellData (const Standard_Integer nbFace);

		/****************** Hiding ******************/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", ":rtype: bool") Hiding;
		Standard_Boolean Hiding ();

		/****************** HidingPolyData ******************/
		%feature("compactdefaultargs") HidingPolyData;
		%feature("autodoc", ":rtype: TColStd_Array1OfTransient") HidingPolyData;
		TColStd_Array1OfTransient & HidingPolyData ();

		/****************** PolyData ******************/
		%feature("compactdefaultargs") PolyData;
		%feature("autodoc", ":rtype: TColStd_Array1OfTransient") PolyData;
		TColStd_Array1OfTransient & PolyData ();

		/****************** UpdateGlobalMinMax ******************/
		%feature("compactdefaultargs") UpdateGlobalMinMax;
		%feature("autodoc", ":param theBox:
	:type theBox: HLRAlgo_PolyData::Box
	:rtype: None") UpdateGlobalMinMax;
		void UpdateGlobalMinMax (HLRAlgo_PolyData::Box & theBox);

		/****************** UpdateHiding ******************/
		%feature("compactdefaultargs") UpdateHiding;
		%feature("autodoc", ":param nbHiding:
	:type nbHiding: int
	:rtype: None") UpdateHiding;
		void UpdateHiding (const Standard_Integer nbHiding);

};


%make_alias(HLRAlgo_PolyShellData)

%extend HLRAlgo_PolyShellData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class HLRAlgo_Projector *
**************************/
class HLRAlgo_Projector {
	public:
		/****************** Directions ******************/
		%feature("compactdefaultargs") Directions;
		%feature("autodoc", ":param D1:
	:type D1: gp_Vec2d
	:param D2:
	:type D2: gp_Vec2d
	:param D3:
	:type D3: gp_Vec2d
	:rtype: None") Directions;
		void Directions (gp_Vec2d & D1,gp_Vec2d & D2,gp_Vec2d & D3);

		/****************** Focus ******************/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "* Returns the focal length.
	:rtype: float") Focus;
		Standard_Real Focus ();

		/****************** FullTransformation ******************/
		%feature("compactdefaultargs") FullTransformation;
		%feature("autodoc", "* Returns the original transformation.
	:rtype: gp_Trsf") FullTransformation;
		const gp_Trsf  FullTransformation ();

		/****************** HLRAlgo_Projector ******************/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", ":rtype: None") HLRAlgo_Projector;
		 HLRAlgo_Projector ();

		/****************** HLRAlgo_Projector ******************/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "* Creates an axonometric projector. <CS> is the viewing coordinate system.
	:param CS:
	:type CS: gp_Ax2
	:rtype: None") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Ax2 & CS);

		/****************** HLRAlgo_Projector ******************/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "* Creates a perspective projector. <CS> is the viewing coordinate system.
	:param CS:
	:type CS: gp_Ax2
	:param Focus:
	:type Focus: float
	:rtype: None") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Ax2 & CS,const Standard_Real Focus);

		/****************** HLRAlgo_Projector ******************/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "* build a Projector with automatic minmax directions.
	:param T:
	:type T: gp_Trsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:rtype: None") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);

		/****************** HLRAlgo_Projector ******************/
		%feature("compactdefaultargs") HLRAlgo_Projector;
		%feature("autodoc", "* build a Projector with given minmax directions.
	:param T:
	:type T: gp_Trsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:param v1:
	:type v1: gp_Vec2d
	:param v2:
	:type v2: gp_Vec2d
	:param v3:
	:type v3: gp_Vec2d
	:rtype: None") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus,const gp_Vec2d & v1,const gp_Vec2d & v2,const gp_Vec2d & v3);

		/****************** InvertedTransformation ******************/
		%feature("compactdefaultargs") InvertedTransformation;
		%feature("autodoc", "* Returns the active inverted transformation.
	:rtype: gp_Trsf") InvertedTransformation;
		const gp_Trsf  InvertedTransformation ();

		/****************** Perspective ******************/
		%feature("compactdefaultargs") Perspective;
		%feature("autodoc", "* Returns True if there is a perspective transformation.
	:rtype: bool") Perspective;
		Standard_Boolean Perspective ();

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Transform and apply perspective if needed.
	:param P:
	:type P: gp_Pnt
	:param Pout:
	:type Pout: gp_Pnt2d
	:rtype: None") Project;
		void Project (const gp_Pnt & P,gp_Pnt2d & Pout);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Transform and apply perspective if needed.
	:param P:
	:type P: gp_Pnt
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None") Project;
		void Project (const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Transform and apply perspective if needed.
	:param P:
	:type P: gp_Pnt
	:param D1:
	:type D1: gp_Vec
	:param Pout:
	:type Pout: gp_Pnt2d
	:param D1out:
	:type D1out: gp_Vec2d
	:rtype: None") Project;
		void Project (const gp_Pnt & P,const gp_Vec & D1,gp_Pnt2d & Pout,gp_Vec2d & D1out);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* to compute with the given scale and translation.
	:param On: default value is Standard_False
	:type On: bool
	:rtype: None") Scaled;
		void Scaled (const Standard_Boolean On = Standard_False);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:rtype: None") Set;
		void Set (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);

		/****************** Shoot ******************/
		%feature("compactdefaultargs") Shoot;
		%feature("autodoc", "* return a line going through the eye towards the 2d point <X,Y>.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: gp_Lin") Shoot;
		gp_Lin Shoot (const Standard_Real X,const Standard_Real Y);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param D:
	:type D: gp_Vec
	:rtype: None") Transform;
		void Transform (gp_Vec & D);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param Pnt:
	:type Pnt: gp_Pnt
	:rtype: None") Transform;
		void Transform (gp_Pnt & Pnt);

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "* Returns the active transformation.
	:rtype: gp_Trsf") Transformation;
		const gp_Trsf  Transformation ();

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
		%feature("autodoc", "* Create a Block of Blocks.
	:param NbWires:
	:type NbWires: int
	:rtype: None") HLRAlgo_WiresBlock;
		 HLRAlgo_WiresBlock (const Standard_Integer NbWires);

		/****************** MinMax ******************/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", ":rtype: HLRAlgo_EdgesBlock::MinMaxIndices") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax ();

		/****************** NbWires ******************/
		%feature("compactdefaultargs") NbWires;
		%feature("autodoc", ":rtype: int") NbWires;
		Standard_Integer NbWires ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param I:
	:type I: int
	:param W:
	:type W: HLRAlgo_EdgesBlock
	:rtype: None") Set;
		void Set (const Standard_Integer I,const opencascade::handle<HLRAlgo_EdgesBlock> & W);

		/****************** UpdateMinMax ******************/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", ":param theMinMaxes:
	:type theMinMaxes: HLRAlgo_EdgesBlock::MinMaxIndices
	:rtype: None") UpdateMinMax;
		void UpdateMinMax (const HLRAlgo_EdgesBlock::MinMaxIndices & theMinMaxes);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: opencascade::handle<HLRAlgo_EdgesBlock>") Wire;
		opencascade::handle<HLRAlgo_EdgesBlock> & Wire (const Standard_Integer I);

};


%make_alias(HLRAlgo_WiresBlock)

%extend HLRAlgo_WiresBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

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
