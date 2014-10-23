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
%module (package="OCC") HLRAlgo

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

%include HLRAlgo_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(hlralgo) HLRAlgo;
%nodefaultctor HLRAlgo;
class HLRAlgo {
	public:
		%feature("autodoc", "	* Iterator on the visible or hidden parts of an EdgeStatus.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param Min:
	:type Min: Standard_Address
	:param Max:
	:type Max: Standard_Address
	:rtype: void
") UpdateMinMax;
		static void UpdateMinMax (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Address Min,const Standard_Address Max);
		%feature("autodoc", "	:param tol:
	:type tol: float
	:param Min:
	:type Min: Standard_Address
	:param Max:
	:type Max: Standard_Address
	:rtype: void
") EnlargeMinMax;
		static void EnlargeMinMax (const Standard_Real tol,const Standard_Address Min,const Standard_Address Max);
		%feature("autodoc", "	:param Big:
	:type Big: float
	:param Min:
	:type Min: Standard_Address
	:param Max:
	:type Max: Standard_Address
	:rtype: void
") InitMinMax;
		static void InitMinMax (const Standard_Real Big,const Standard_Address Min,const Standard_Address Max);
		%feature("autodoc", "	:param Min:
	:type Min: Standard_Address
	:param Max:
	:type Max: Standard_Address
	:param MinMax:
	:type MinMax: Standard_Address
	:rtype: void
") EncodeMinMax;
		static void EncodeMinMax (const Standard_Address Min,const Standard_Address Max,const Standard_Address MinMax);
		%feature("autodoc", "	:param Min:
	:type Min: Standard_Address
	:param Max:
	:type Max: Standard_Address
	:rtype: float
") SizeBox;
		static Standard_Real SizeBox (const Standard_Address Min,const Standard_Address Max);
		%feature("autodoc", "	:param MinMax:
	:type MinMax: Standard_Address
	:param Min:
	:type Min: Standard_Address
	:param Max:
	:type Max: Standard_Address
	:rtype: void
") DecodeMinMax;
		static void DecodeMinMax (const Standard_Address MinMax,const Standard_Address Min,const Standard_Address Max);
		%feature("autodoc", "	:param IMin:
	:type IMin: Standard_Address
	:param IMax:
	:type IMax: Standard_Address
	:param OMin:
	:type OMin: Standard_Address
	:param OMax:
	:type OMax: Standard_Address
	:rtype: void
") CopyMinMax;
		static void CopyMinMax (const Standard_Address IMin,const Standard_Address IMax,const Standard_Address OMin,const Standard_Address OMax);
		%feature("autodoc", "	:param IMin:
	:type IMin: Standard_Address
	:param IMax:
	:type IMax: Standard_Address
	:param OMin:
	:type OMin: Standard_Address
	:param OMax:
	:type OMax: Standard_Address
	:rtype: void
") AddMinMax;
		static void AddMinMax (const Standard_Address IMin,const Standard_Address IMax,const Standard_Address OMin,const Standard_Address OMax);
};


%feature("shadow") HLRAlgo::~HLRAlgo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_Array1OfPHDat;
class HLRAlgo_Array1OfPHDat {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_Array1OfPHDat;
		 HLRAlgo_Array1OfPHDat (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: HLRAlgo_PolyHidingData &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_Array1OfPHDat;
		 HLRAlgo_Array1OfPHDat (const HLRAlgo_PolyHidingData & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: HLRAlgo_PolyHidingData &
	:rtype: None
") Init;
		void Init (const HLRAlgo_PolyHidingData & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_Array1OfPHDat &
	:rtype: HLRAlgo_Array1OfPHDat
") Assign;
		const HLRAlgo_Array1OfPHDat & Assign (const HLRAlgo_Array1OfPHDat & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_Array1OfPHDat &
	:rtype: HLRAlgo_Array1OfPHDat
") operator=;
		const HLRAlgo_Array1OfPHDat & operator = (const HLRAlgo_Array1OfPHDat & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: HLRAlgo_PolyHidingData &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_PolyHidingData & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_PolyHidingData
") Value;
		const HLRAlgo_PolyHidingData & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_PolyHidingData
") ChangeValue;
		HLRAlgo_PolyHidingData & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") HLRAlgo_Array1OfPHDat::~HLRAlgo_Array1OfPHDat %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_Array1OfPHDat {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_Array1OfPINod;
class HLRAlgo_Array1OfPINod {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_Array1OfPINod;
		 HLRAlgo_Array1OfPINod (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_HLRAlgo_PolyInternalNode &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_Array1OfPINod;
		 HLRAlgo_Array1OfPINod (const Handle_HLRAlgo_PolyInternalNode & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_HLRAlgo_PolyInternalNode &
	:rtype: None
") Init;
		void Init (const Handle_HLRAlgo_PolyInternalNode & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_Array1OfPINod &
	:rtype: HLRAlgo_Array1OfPINod
") Assign;
		const HLRAlgo_Array1OfPINod & Assign (const HLRAlgo_Array1OfPINod & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_Array1OfPINod &
	:rtype: HLRAlgo_Array1OfPINod
") operator=;
		const HLRAlgo_Array1OfPINod & operator = (const HLRAlgo_Array1OfPINod & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_HLRAlgo_PolyInternalNode &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_HLRAlgo_PolyInternalNode & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_HLRAlgo_PolyInternalNode
") Value;
		const Handle_HLRAlgo_PolyInternalNode & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_HLRAlgo_PolyInternalNode
") ChangeValue;
		Handle_HLRAlgo_PolyInternalNode & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") HLRAlgo_Array1OfPINod::~HLRAlgo_Array1OfPINod %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_Array1OfPINod {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_Array1OfPISeg;
class HLRAlgo_Array1OfPISeg {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_Array1OfPISeg;
		 HLRAlgo_Array1OfPISeg (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: HLRAlgo_PolyInternalSegment &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_Array1OfPISeg;
		 HLRAlgo_Array1OfPISeg (const HLRAlgo_PolyInternalSegment & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: HLRAlgo_PolyInternalSegment &
	:rtype: None
") Init;
		void Init (const HLRAlgo_PolyInternalSegment & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_Array1OfPISeg &
	:rtype: HLRAlgo_Array1OfPISeg
") Assign;
		const HLRAlgo_Array1OfPISeg & Assign (const HLRAlgo_Array1OfPISeg & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_Array1OfPISeg &
	:rtype: HLRAlgo_Array1OfPISeg
") operator=;
		const HLRAlgo_Array1OfPISeg & operator = (const HLRAlgo_Array1OfPISeg & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: HLRAlgo_PolyInternalSegment &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_PolyInternalSegment & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_PolyInternalSegment
") Value;
		const HLRAlgo_PolyInternalSegment & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_PolyInternalSegment
") ChangeValue;
		HLRAlgo_PolyInternalSegment & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") HLRAlgo_Array1OfPISeg::~HLRAlgo_Array1OfPISeg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_Array1OfPISeg {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_Array1OfTData;
class HLRAlgo_Array1OfTData {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_Array1OfTData;
		 HLRAlgo_Array1OfTData (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: HLRAlgo_TriangleData &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_Array1OfTData;
		 HLRAlgo_Array1OfTData (const HLRAlgo_TriangleData & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: HLRAlgo_TriangleData &
	:rtype: None
") Init;
		void Init (const HLRAlgo_TriangleData & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_Array1OfTData &
	:rtype: HLRAlgo_Array1OfTData
") Assign;
		const HLRAlgo_Array1OfTData & Assign (const HLRAlgo_Array1OfTData & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_Array1OfTData &
	:rtype: HLRAlgo_Array1OfTData
") operator=;
		const HLRAlgo_Array1OfTData & operator = (const HLRAlgo_Array1OfTData & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: HLRAlgo_TriangleData &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_TriangleData & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_TriangleData
") Value;
		const HLRAlgo_TriangleData & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_TriangleData
") ChangeValue;
		HLRAlgo_TriangleData & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") HLRAlgo_Array1OfTData::~HLRAlgo_Array1OfTData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_Array1OfTData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_BiPoint;
class HLRAlgo_BiPoint {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint ();
		%feature("autodoc", "	:param X1:
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
	:type Index: Standard_Integer
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);
		%feature("autodoc", "	:param X1:
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
	:type Index: Standard_Integer
	:param flag:
	:type flag: Standard_Integer
	:rtype: None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer flag);
		%feature("autodoc", "	:param X1:
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
	:type Index: Standard_Integer
	:param i1:
	:type i1: Standard_Integer
	:param i1p1:
	:type i1p1: Standard_Integer
	:param i1p2:
	:type i1p2: Standard_Integer
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);
		%feature("autodoc", "	:param X1:
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
	:type Index: Standard_Integer
	:param i1:
	:type i1: Standard_Integer
	:param i1p1:
	:type i1p1: Standard_Integer
	:param i1p2:
	:type i1p2: Standard_Integer
	:param flag:
	:type flag: Standard_Integer
	:rtype: None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Integer flag);
		%feature("autodoc", "	:param X1:
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
	:type Index: Standard_Integer
	:param i1:
	:type i1: Standard_Integer
	:param i1p1:
	:type i1p1: Standard_Integer
	:param i1p2:
	:type i1p2: Standard_Integer
	:param i2:
	:type i2: Standard_Integer
	:param i2p1:
	:type i2p1: Standard_Integer
	:param i2p2:
	:type i2p2: Standard_Integer
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Integer i2,const Standard_Integer i2p1,const Standard_Integer i2p2,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);
		%feature("autodoc", "	:param X1:
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
	:type Index: Standard_Integer
	:param i1:
	:type i1: Standard_Integer
	:param i1p1:
	:type i1p1: Standard_Integer
	:param i1p2:
	:type i1p2: Standard_Integer
	:param i2:
	:type i2: Standard_Integer
	:param i2p1:
	:type i2p1: Standard_Integer
	:param i2p2:
	:type i2p2: Standard_Integer
	:param flag:
	:type flag: Standard_Integer
	:rtype: None
") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Integer i2,const Standard_Integer i2p1,const Standard_Integer i2p2,const Standard_Integer flag);
		%feature("autodoc", "	:rtype: bool
") Rg1Line;
		Standard_Boolean Rg1Line ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Rg1Line;
		void Rg1Line (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") RgNLine;
		Standard_Boolean RgNLine ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") RgNLine;
		void RgNLine (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") OutLine;
		Standard_Boolean OutLine ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") OutLine;
		void OutLine (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") IntLine;
		Standard_Boolean IntLine ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") IntLine;
		void IntLine (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Hidden;
		Standard_Boolean Hidden ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Hidden;
		void Hidden (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: Standard_Address
") Indices;
		Standard_Address Indices ();
		%feature("autodoc", "	:rtype: Standard_Address
") Coordinates;
		Standard_Address Coordinates ();
};


%feature("shadow") HLRAlgo_BiPoint::~HLRAlgo_BiPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_BiPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_Coincidence;
class HLRAlgo_Coincidence {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_Coincidence;
		 HLRAlgo_Coincidence ();
		%feature("autodoc", "	:param FE:
	:type FE: Standard_Integer
	:param Param:
	:type Param: float
	:rtype: None
") Set2D;
		void Set2D (const Standard_Integer FE,const Standard_Real Param);
		%feature("autodoc", "	:param stbef:
	:type stbef: TopAbs_State
	:param staft:
	:type staft: TopAbs_State
	:rtype: None
") SetState3D;
		void SetState3D (const TopAbs_State stbef,const TopAbs_State staft);
		%feature("autodoc", "	:param FE:
	:type FE: Standard_Integer &
	:param Param:
	:type Param: float &
	:rtype: None
") Value2D;
		void Value2D (Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param stbef:
	:type stbef: TopAbs_State &
	:param staft:
	:type staft: TopAbs_State &
	:rtype: None
") State3D;
		void State3D (TopAbs_State & stbef,TopAbs_State & staft);
};


%feature("shadow") HLRAlgo_Coincidence::~HLRAlgo_Coincidence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_Coincidence {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_EdgeIterator;
class HLRAlgo_EdgeIterator {
	public:
		%feature("autodoc", "	* Iterator on the visible or hidden parts of an edge.

	:rtype: None
") HLRAlgo_EdgeIterator;
		 HLRAlgo_EdgeIterator ();
		%feature("autodoc", "	:param status:
	:type status: HLRAlgo_EdgeStatus &
	:rtype: None
") InitHidden;
		void InitHidden (const HLRAlgo_EdgeStatus & status);
		%feature("autodoc", "	:rtype: bool
") MoreHidden;
		Standard_Boolean MoreHidden ();
		%feature("autodoc", "	:rtype: None
") NextHidden;
		void NextHidden ();
		%feature("autodoc", "	* Returns the bounds and the tolerances of the current Hidden Interval

	:param Start:
	:type Start: float &
	:param TolStart:
	:type TolStart: Standard_ShortReal &
	:param End:
	:type End: float &
	:param TolEnd:
	:type TolEnd: Standard_ShortReal &
	:rtype: None
") Hidden;
		void Hidden (Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);
		%feature("autodoc", "	:param status:
	:type status: HLRAlgo_EdgeStatus &
	:rtype: None
") InitVisible;
		void InitVisible (const HLRAlgo_EdgeStatus & status);
		%feature("autodoc", "	:rtype: bool
") MoreVisible;
		Standard_Boolean MoreVisible ();
		%feature("autodoc", "	:rtype: None
") NextVisible;
		void NextVisible ();
		%feature("autodoc", "	* Returns the bounds and the tolerances of the current Visible Interval

	:param Start:
	:type Start: float &
	:param TolStart:
	:type TolStart: Standard_ShortReal &
	:param End:
	:type End: float &
	:param TolEnd:
	:type TolEnd: Standard_ShortReal &
	:rtype: None
") Visible;
		void Visible (Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);
};


%feature("shadow") HLRAlgo_EdgeIterator::~HLRAlgo_EdgeIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_EdgeIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_EdgeStatus;
class HLRAlgo_EdgeStatus {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus ();
		%feature("autodoc", "	* Creates a new EdgeStatus. Default visible. The Edge is bounded by the interval <Start>, <End> with the tolerances <TolStart>, <TolEnd>.

	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None
") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("autodoc", "	* Initialize an EdgeStatus. Default visible. The Edge is bounded by the interval <Start>, <End> with the tolerances <TolStart>, <TolEnd>.

	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None
") Initialize;
		void Initialize (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("autodoc", "	:param Start:
	:type Start: float &
	:param TolStart:
	:type TolStart: Standard_ShortReal &
	:param End:
	:type End: float &
	:param TolEnd:
	:type TolEnd: Standard_ShortReal &
	:rtype: None
") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);
		%feature("autodoc", "	:rtype: int
") NbVisiblePart;
		Standard_Integer NbVisiblePart ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Start:
	:type Start: float &
	:param TolStart:
	:type TolStart: Standard_ShortReal &
	:param End:
	:type End: float &
	:param TolEnd:
	:type TolEnd: Standard_ShortReal &
	:rtype: None
") VisiblePart;
		void VisiblePart (const Standard_Integer Index,Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);
		%feature("autodoc", "	* Hides the interval <Start>, <End> with the tolerances <TolStart>, <TolEnd>. This interval is subtracted from the visible parts. If the hidden part is on ( or under ) the face the flag <OnFace> is True ( or False ). If the hidden part is on ( or inside ) the boundary of the face the flag <OnBoundary> is True ( or False ).

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
	:rtype: None
") Hide;
		void Hide (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd,const Standard_Boolean OnFace,const Standard_Boolean OnBoundary);
		%feature("autodoc", "	* Hide the whole Edge.

	:rtype: None
") HideAll;
		void HideAll ();
		%feature("autodoc", "	* Show the whole Edge.

	:rtype: None
") ShowAll;
		void ShowAll ();
		%feature("autodoc", "	:rtype: bool
") AllHidden;
		Standard_Boolean AllHidden ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") AllHidden;
		void AllHidden (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") AllVisible;
		Standard_Boolean AllVisible ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") AllVisible;
		void AllVisible (const Standard_Boolean B);
};


%feature("shadow") HLRAlgo_EdgeStatus::~HLRAlgo_EdgeStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_EdgeStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_EdgesBlock;
class HLRAlgo_EdgesBlock : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Create a Block of Edges for a wire.

	:param NbEdges:
	:type NbEdges: Standard_Integer
	:rtype: None
") HLRAlgo_EdgesBlock;
		 HLRAlgo_EdgesBlock (const Standard_Integer NbEdges);
		%feature("autodoc", "	:rtype: int
") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param EI:
	:type EI: Standard_Integer
	:rtype: None
") Edge;
		void Edge (const Standard_Integer I,const Standard_Integer EI);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: int
") Edge;
		Standard_Integer Edge (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const Standard_Integer I,const TopAbs_Orientation Or);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: bool
") OutLine;
		Standard_Boolean OutLine (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param B:
	:type B: bool
	:rtype: None
") OutLine;
		void OutLine (const Standard_Integer I,const Standard_Boolean B);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: bool
") Internal;
		Standard_Boolean Internal (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param B:
	:type B: bool
	:rtype: None
") Internal;
		void Internal (const Standard_Integer I,const Standard_Boolean B);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: bool
") Double;
		Standard_Boolean Double (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param B:
	:type B: bool
	:rtype: None
") Double;
		void Double (const Standard_Integer I,const Standard_Boolean B);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: bool
") IsoLine;
		Standard_Boolean IsoLine (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param B:
	:type B: bool
	:rtype: None
") IsoLine;
		void IsoLine (const Standard_Integer I,const Standard_Boolean B);
		%feature("autodoc", "	:param TotMinMax:
	:type TotMinMax: Standard_Address
	:rtype: None
") UpdateMinMax;
		void UpdateMinMax (const Standard_Address TotMinMax);
		%feature("autodoc", "	:rtype: Standard_Address
") MinMax;
		Standard_Address MinMax ();
};


%feature("shadow") HLRAlgo_EdgesBlock::~HLRAlgo_EdgesBlock %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_EdgesBlock {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_EdgesBlock {
	Handle_HLRAlgo_EdgesBlock GetHandle() {
	return *(Handle_HLRAlgo_EdgesBlock*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_EdgesBlock;
class Handle_HLRAlgo_EdgesBlock : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_EdgesBlock();
        Handle_HLRAlgo_EdgesBlock(const Handle_HLRAlgo_EdgesBlock &aHandle);
        Handle_HLRAlgo_EdgesBlock(const HLRAlgo_EdgesBlock *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_EdgesBlock DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_EdgesBlock {
    HLRAlgo_EdgesBlock* GetObject() {
    return (HLRAlgo_EdgesBlock*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_EdgesBlock::~Handle_HLRAlgo_EdgesBlock %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_EdgesBlock {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_HArray1OfPHDat;
class HLRAlgo_HArray1OfPHDat : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_HArray1OfPHDat;
		 HLRAlgo_HArray1OfPHDat (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: HLRAlgo_PolyHidingData &
	:rtype: None
") HLRAlgo_HArray1OfPHDat;
		 HLRAlgo_HArray1OfPHDat (const Standard_Integer Low,const Standard_Integer Up,const HLRAlgo_PolyHidingData & V);
		%feature("autodoc", "	:param V:
	:type V: HLRAlgo_PolyHidingData &
	:rtype: None
") Init;
		void Init (const HLRAlgo_PolyHidingData & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: HLRAlgo_PolyHidingData &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_PolyHidingData & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_PolyHidingData
") Value;
		const HLRAlgo_PolyHidingData & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_PolyHidingData
") ChangeValue;
		HLRAlgo_PolyHidingData & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfPHDat
") Array1;
		const HLRAlgo_Array1OfPHDat & Array1 ();
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfPHDat
") ChangeArray1;
		HLRAlgo_Array1OfPHDat & ChangeArray1 ();
};


%feature("shadow") HLRAlgo_HArray1OfPHDat::~HLRAlgo_HArray1OfPHDat %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_HArray1OfPHDat {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_HArray1OfPHDat {
	Handle_HLRAlgo_HArray1OfPHDat GetHandle() {
	return *(Handle_HLRAlgo_HArray1OfPHDat*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_HArray1OfPHDat;
class Handle_HLRAlgo_HArray1OfPHDat : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_HArray1OfPHDat();
        Handle_HLRAlgo_HArray1OfPHDat(const Handle_HLRAlgo_HArray1OfPHDat &aHandle);
        Handle_HLRAlgo_HArray1OfPHDat(const HLRAlgo_HArray1OfPHDat *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_HArray1OfPHDat DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_HArray1OfPHDat {
    HLRAlgo_HArray1OfPHDat* GetObject() {
    return (HLRAlgo_HArray1OfPHDat*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_HArray1OfPHDat::~Handle_HLRAlgo_HArray1OfPHDat %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_HArray1OfPHDat {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_HArray1OfPINod;
class HLRAlgo_HArray1OfPINod : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_HArray1OfPINod;
		 HLRAlgo_HArray1OfPINod (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_HLRAlgo_PolyInternalNode &
	:rtype: None
") HLRAlgo_HArray1OfPINod;
		 HLRAlgo_HArray1OfPINod (const Standard_Integer Low,const Standard_Integer Up,const Handle_HLRAlgo_PolyInternalNode & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_HLRAlgo_PolyInternalNode &
	:rtype: None
") Init;
		void Init (const Handle_HLRAlgo_PolyInternalNode & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_HLRAlgo_PolyInternalNode &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_HLRAlgo_PolyInternalNode & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_HLRAlgo_PolyInternalNode
") Value;
		const Handle_HLRAlgo_PolyInternalNode & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_HLRAlgo_PolyInternalNode
") ChangeValue;
		Handle_HLRAlgo_PolyInternalNode & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfPINod
") Array1;
		const HLRAlgo_Array1OfPINod & Array1 ();
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfPINod
") ChangeArray1;
		HLRAlgo_Array1OfPINod & ChangeArray1 ();
};


%feature("shadow") HLRAlgo_HArray1OfPINod::~HLRAlgo_HArray1OfPINod %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_HArray1OfPINod {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_HArray1OfPINod {
	Handle_HLRAlgo_HArray1OfPINod GetHandle() {
	return *(Handle_HLRAlgo_HArray1OfPINod*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_HArray1OfPINod;
class Handle_HLRAlgo_HArray1OfPINod : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_HArray1OfPINod();
        Handle_HLRAlgo_HArray1OfPINod(const Handle_HLRAlgo_HArray1OfPINod &aHandle);
        Handle_HLRAlgo_HArray1OfPINod(const HLRAlgo_HArray1OfPINod *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_HArray1OfPINod DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_HArray1OfPINod {
    HLRAlgo_HArray1OfPINod* GetObject() {
    return (HLRAlgo_HArray1OfPINod*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_HArray1OfPINod::~Handle_HLRAlgo_HArray1OfPINod %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_HArray1OfPINod {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_HArray1OfPISeg;
class HLRAlgo_HArray1OfPISeg : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_HArray1OfPISeg;
		 HLRAlgo_HArray1OfPISeg (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: HLRAlgo_PolyInternalSegment &
	:rtype: None
") HLRAlgo_HArray1OfPISeg;
		 HLRAlgo_HArray1OfPISeg (const Standard_Integer Low,const Standard_Integer Up,const HLRAlgo_PolyInternalSegment & V);
		%feature("autodoc", "	:param V:
	:type V: HLRAlgo_PolyInternalSegment &
	:rtype: None
") Init;
		void Init (const HLRAlgo_PolyInternalSegment & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: HLRAlgo_PolyInternalSegment &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_PolyInternalSegment & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_PolyInternalSegment
") Value;
		const HLRAlgo_PolyInternalSegment & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_PolyInternalSegment
") ChangeValue;
		HLRAlgo_PolyInternalSegment & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfPISeg
") Array1;
		const HLRAlgo_Array1OfPISeg & Array1 ();
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfPISeg
") ChangeArray1;
		HLRAlgo_Array1OfPISeg & ChangeArray1 ();
};


%feature("shadow") HLRAlgo_HArray1OfPISeg::~HLRAlgo_HArray1OfPISeg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_HArray1OfPISeg {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_HArray1OfPISeg {
	Handle_HLRAlgo_HArray1OfPISeg GetHandle() {
	return *(Handle_HLRAlgo_HArray1OfPISeg*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_HArray1OfPISeg;
class Handle_HLRAlgo_HArray1OfPISeg : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_HArray1OfPISeg();
        Handle_HLRAlgo_HArray1OfPISeg(const Handle_HLRAlgo_HArray1OfPISeg &aHandle);
        Handle_HLRAlgo_HArray1OfPISeg(const HLRAlgo_HArray1OfPISeg *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_HArray1OfPISeg DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_HArray1OfPISeg {
    HLRAlgo_HArray1OfPISeg* GetObject() {
    return (HLRAlgo_HArray1OfPISeg*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_HArray1OfPISeg::~Handle_HLRAlgo_HArray1OfPISeg %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_HArray1OfPISeg {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_HArray1OfTData;
class HLRAlgo_HArray1OfTData : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRAlgo_HArray1OfTData;
		 HLRAlgo_HArray1OfTData (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: HLRAlgo_TriangleData &
	:rtype: None
") HLRAlgo_HArray1OfTData;
		 HLRAlgo_HArray1OfTData (const Standard_Integer Low,const Standard_Integer Up,const HLRAlgo_TriangleData & V);
		%feature("autodoc", "	:param V:
	:type V: HLRAlgo_TriangleData &
	:rtype: None
") Init;
		void Init (const HLRAlgo_TriangleData & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: HLRAlgo_TriangleData &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_TriangleData & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_TriangleData
") Value;
		const HLRAlgo_TriangleData & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRAlgo_TriangleData
") ChangeValue;
		HLRAlgo_TriangleData & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfTData
") Array1;
		const HLRAlgo_Array1OfTData & Array1 ();
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfTData
") ChangeArray1;
		HLRAlgo_Array1OfTData & ChangeArray1 ();
};


%feature("shadow") HLRAlgo_HArray1OfTData::~HLRAlgo_HArray1OfTData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_HArray1OfTData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_HArray1OfTData {
	Handle_HLRAlgo_HArray1OfTData GetHandle() {
	return *(Handle_HLRAlgo_HArray1OfTData*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_HArray1OfTData;
class Handle_HLRAlgo_HArray1OfTData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_HArray1OfTData();
        Handle_HLRAlgo_HArray1OfTData(const Handle_HLRAlgo_HArray1OfTData &aHandle);
        Handle_HLRAlgo_HArray1OfTData(const HLRAlgo_HArray1OfTData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_HArray1OfTData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_HArray1OfTData {
    HLRAlgo_HArray1OfTData* GetObject() {
    return (HLRAlgo_HArray1OfTData*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_HArray1OfTData::~Handle_HLRAlgo_HArray1OfTData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_HArray1OfTData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_Interference;
class HLRAlgo_Interference {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_Interference;
		 HLRAlgo_Interference ();
		%feature("autodoc", "	:param Inters:
	:type Inters: HLRAlgo_Intersection &
	:param Bound:
	:type Bound: HLRAlgo_Coincidence &
	:param Orient:
	:type Orient: TopAbs_Orientation
	:param Trans:
	:type Trans: TopAbs_Orientation
	:param BTrans:
	:type BTrans: TopAbs_Orientation
	:rtype: None
") HLRAlgo_Interference;
		 HLRAlgo_Interference (const HLRAlgo_Intersection & Inters,const HLRAlgo_Coincidence & Bound,const TopAbs_Orientation Orient,const TopAbs_Orientation Trans,const TopAbs_Orientation BTrans);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_Intersection &
	:rtype: None
") Intersection;
		void Intersection (const HLRAlgo_Intersection & I);
		%feature("autodoc", "	:param B:
	:type B: HLRAlgo_Coincidence &
	:rtype: None
") Boundary;
		void Boundary (const HLRAlgo_Coincidence & B);
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const TopAbs_Orientation O);
		%feature("autodoc", "	:param Tr:
	:type Tr: TopAbs_Orientation
	:rtype: None
") Transition;
		void Transition (const TopAbs_Orientation Tr);
		%feature("autodoc", "	:param BTr:
	:type BTr: TopAbs_Orientation
	:rtype: None
") BoundaryTransition;
		void BoundaryTransition (const TopAbs_Orientation BTr);
		%feature("autodoc", "	:rtype: HLRAlgo_Intersection
") Intersection;
		const HLRAlgo_Intersection & Intersection ();
		%feature("autodoc", "	:rtype: HLRAlgo_Intersection
") ChangeIntersection;
		HLRAlgo_Intersection & ChangeIntersection ();
		%feature("autodoc", "	:rtype: HLRAlgo_Coincidence
") Boundary;
		const HLRAlgo_Coincidence & Boundary ();
		%feature("autodoc", "	:rtype: HLRAlgo_Coincidence
") ChangeBoundary;
		HLRAlgo_Coincidence & ChangeBoundary ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Transition;
		TopAbs_Orientation Transition ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition ();
};


%feature("shadow") HLRAlgo_Interference::~HLRAlgo_Interference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_Interference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_InterferenceList;
class HLRAlgo_InterferenceList {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_InterferenceList;
		 HLRAlgo_InterferenceList ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_InterferenceList &
	:rtype: None
") Assign;
		void Assign (const HLRAlgo_InterferenceList & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_InterferenceList &
	:rtype: None
") operator=;
		void operator = (const HLRAlgo_InterferenceList & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_Interference &
	:rtype: None
") Prepend;
		void Prepend (const HLRAlgo_Interference & I);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_Interference &
	:param theIt:
	:type theIt: HLRAlgo_ListIteratorOfInterferenceList &
	:rtype: None
") Prepend;
		void Prepend (const HLRAlgo_Interference & I,HLRAlgo_ListIteratorOfInterferenceList & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_InterferenceList &
	:rtype: None
") Prepend;
		void Prepend (HLRAlgo_InterferenceList & Other);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_Interference &
	:rtype: None
") Append;
		void Append (const HLRAlgo_Interference & I);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_Interference &
	:param theIt:
	:type theIt: HLRAlgo_ListIteratorOfInterferenceList &
	:rtype: None
") Append;
		void Append (const HLRAlgo_Interference & I,HLRAlgo_ListIteratorOfInterferenceList & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_InterferenceList &
	:rtype: None
") Append;
		void Append (HLRAlgo_InterferenceList & Other);
		%feature("autodoc", "	:rtype: HLRAlgo_Interference
") First;
		HLRAlgo_Interference & First ();
		%feature("autodoc", "	:rtype: HLRAlgo_Interference
") Last;
		HLRAlgo_Interference & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: HLRAlgo_ListIteratorOfInterferenceList &
	:rtype: None
") Remove;
		void Remove (HLRAlgo_ListIteratorOfInterferenceList & It);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_Interference &
	:param It:
	:type It: HLRAlgo_ListIteratorOfInterferenceList &
	:rtype: None
") InsertBefore;
		void InsertBefore (const HLRAlgo_Interference & I,HLRAlgo_ListIteratorOfInterferenceList & It);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_InterferenceList &
	:param It:
	:type It: HLRAlgo_ListIteratorOfInterferenceList &
	:rtype: None
") InsertBefore;
		void InsertBefore (HLRAlgo_InterferenceList & Other,HLRAlgo_ListIteratorOfInterferenceList & It);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_Interference &
	:param It:
	:type It: HLRAlgo_ListIteratorOfInterferenceList &
	:rtype: None
") InsertAfter;
		void InsertAfter (const HLRAlgo_Interference & I,HLRAlgo_ListIteratorOfInterferenceList & It);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_InterferenceList &
	:param It:
	:type It: HLRAlgo_ListIteratorOfInterferenceList &
	:rtype: None
") InsertAfter;
		void InsertAfter (HLRAlgo_InterferenceList & Other,HLRAlgo_ListIteratorOfInterferenceList & It);
};


%feature("shadow") HLRAlgo_InterferenceList::~HLRAlgo_InterferenceList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_InterferenceList {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_Intersection;
class HLRAlgo_Intersection {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_Intersection;
		 HLRAlgo_Intersection ();
		%feature("autodoc", "	:param Ori:
	:type Ori: TopAbs_Orientation
	:param Lev:
	:type Lev: Standard_Integer
	:param SegInd:
	:type SegInd: Standard_Integer
	:param Ind:
	:type Ind: Standard_Integer
	:param P:
	:type P: float
	:param Tol:
	:type Tol: Standard_ShortReal
	:param S:
	:type S: TopAbs_State
	:rtype: None
") HLRAlgo_Intersection;
		 HLRAlgo_Intersection (const TopAbs_Orientation Ori,const Standard_Integer Lev,const Standard_Integer SegInd,const Standard_Integer Ind,const Standard_Real P,const Standard_ShortReal Tol,const TopAbs_State S);
		%feature("autodoc", "	:param Ori:
	:type Ori: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const TopAbs_Orientation Ori);
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "	:param Lev:
	:type Lev: Standard_Integer
	:rtype: None
") Level;
		void Level (const Standard_Integer Lev);
		%feature("autodoc", "	:rtype: int
") Level;
		Standard_Integer Level ();
		%feature("autodoc", "	:param SegInd:
	:type SegInd: Standard_Integer
	:rtype: None
") SegIndex;
		void SegIndex (const Standard_Integer SegInd);
		%feature("autodoc", "	:rtype: int
") SegIndex;
		Standard_Integer SegIndex ();
		%feature("autodoc", "	:param Ind:
	:type Ind: Standard_Integer
	:rtype: None
") Index;
		void Index (const Standard_Integer Ind);
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	:param P:
	:type P: float
	:rtype: None
") Parameter;
		void Parameter (const Standard_Real P);
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	:param T:
	:type T: Standard_ShortReal
	:rtype: None
") Tolerance;
		void Tolerance (const Standard_ShortReal T);
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Tolerance;
		Standard_ShortReal Tolerance ();
		%feature("autodoc", "	:param S:
	:type S: TopAbs_State
	:rtype: None
") State;
		void State (const TopAbs_State S);
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
};


%feature("shadow") HLRAlgo_Intersection::~HLRAlgo_Intersection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_Intersection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_ListIteratorOfInterferenceList;
class HLRAlgo_ListIteratorOfInterferenceList {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_ListIteratorOfInterferenceList;
		 HLRAlgo_ListIteratorOfInterferenceList ();
		%feature("autodoc", "	:param L:
	:type L: HLRAlgo_InterferenceList &
	:rtype: None
") HLRAlgo_ListIteratorOfInterferenceList;
		 HLRAlgo_ListIteratorOfInterferenceList (const HLRAlgo_InterferenceList & L);
		%feature("autodoc", "	:param L:
	:type L: HLRAlgo_InterferenceList &
	:rtype: None
") Initialize;
		void Initialize (const HLRAlgo_InterferenceList & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: HLRAlgo_Interference
") Value;
		HLRAlgo_Interference & Value ();
};


%feature("shadow") HLRAlgo_ListIteratorOfInterferenceList::~HLRAlgo_ListIteratorOfInterferenceList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_ListIteratorOfInterferenceList {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_ListIteratorOfListOfBPoint;
class HLRAlgo_ListIteratorOfListOfBPoint {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_ListIteratorOfListOfBPoint;
		 HLRAlgo_ListIteratorOfListOfBPoint ();
		%feature("autodoc", "	:param L:
	:type L: HLRAlgo_ListOfBPoint &
	:rtype: None
") HLRAlgo_ListIteratorOfListOfBPoint;
		 HLRAlgo_ListIteratorOfListOfBPoint (const HLRAlgo_ListOfBPoint & L);
		%feature("autodoc", "	:param L:
	:type L: HLRAlgo_ListOfBPoint &
	:rtype: None
") Initialize;
		void Initialize (const HLRAlgo_ListOfBPoint & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: HLRAlgo_BiPoint
") Value;
		HLRAlgo_BiPoint & Value ();
};


%feature("shadow") HLRAlgo_ListIteratorOfListOfBPoint::~HLRAlgo_ListIteratorOfListOfBPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_ListIteratorOfListOfBPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_ListNodeOfInterferenceList;
class HLRAlgo_ListNodeOfInterferenceList : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_Interference &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") HLRAlgo_ListNodeOfInterferenceList;
		 HLRAlgo_ListNodeOfInterferenceList (const HLRAlgo_Interference & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: HLRAlgo_Interference
") Value;
		HLRAlgo_Interference & Value ();
};


%feature("shadow") HLRAlgo_ListNodeOfInterferenceList::~HLRAlgo_ListNodeOfInterferenceList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_ListNodeOfInterferenceList {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_ListNodeOfInterferenceList {
	Handle_HLRAlgo_ListNodeOfInterferenceList GetHandle() {
	return *(Handle_HLRAlgo_ListNodeOfInterferenceList*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_ListNodeOfInterferenceList;
class Handle_HLRAlgo_ListNodeOfInterferenceList : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_HLRAlgo_ListNodeOfInterferenceList();
        Handle_HLRAlgo_ListNodeOfInterferenceList(const Handle_HLRAlgo_ListNodeOfInterferenceList &aHandle);
        Handle_HLRAlgo_ListNodeOfInterferenceList(const HLRAlgo_ListNodeOfInterferenceList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_ListNodeOfInterferenceList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_ListNodeOfInterferenceList {
    HLRAlgo_ListNodeOfInterferenceList* GetObject() {
    return (HLRAlgo_ListNodeOfInterferenceList*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_ListNodeOfInterferenceList::~Handle_HLRAlgo_ListNodeOfInterferenceList %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_ListNodeOfInterferenceList {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_ListNodeOfListOfBPoint;
class HLRAlgo_ListNodeOfListOfBPoint : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_BiPoint &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") HLRAlgo_ListNodeOfListOfBPoint;
		 HLRAlgo_ListNodeOfListOfBPoint (const HLRAlgo_BiPoint & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: HLRAlgo_BiPoint
") Value;
		HLRAlgo_BiPoint & Value ();
};


%feature("shadow") HLRAlgo_ListNodeOfListOfBPoint::~HLRAlgo_ListNodeOfListOfBPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_ListNodeOfListOfBPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_ListNodeOfListOfBPoint {
	Handle_HLRAlgo_ListNodeOfListOfBPoint GetHandle() {
	return *(Handle_HLRAlgo_ListNodeOfListOfBPoint*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_ListNodeOfListOfBPoint;
class Handle_HLRAlgo_ListNodeOfListOfBPoint : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_HLRAlgo_ListNodeOfListOfBPoint();
        Handle_HLRAlgo_ListNodeOfListOfBPoint(const Handle_HLRAlgo_ListNodeOfListOfBPoint &aHandle);
        Handle_HLRAlgo_ListNodeOfListOfBPoint(const HLRAlgo_ListNodeOfListOfBPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_ListNodeOfListOfBPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_ListNodeOfListOfBPoint {
    HLRAlgo_ListNodeOfListOfBPoint* GetObject() {
    return (HLRAlgo_ListNodeOfListOfBPoint*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_ListNodeOfListOfBPoint::~Handle_HLRAlgo_ListNodeOfListOfBPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_ListNodeOfListOfBPoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_ListOfBPoint;
class HLRAlgo_ListOfBPoint {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_ListOfBPoint;
		 HLRAlgo_ListOfBPoint ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_ListOfBPoint &
	:rtype: None
") Assign;
		void Assign (const HLRAlgo_ListOfBPoint & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_ListOfBPoint &
	:rtype: None
") operator=;
		void operator = (const HLRAlgo_ListOfBPoint & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_BiPoint &
	:rtype: None
") Prepend;
		void Prepend (const HLRAlgo_BiPoint & I);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_BiPoint &
	:param theIt:
	:type theIt: HLRAlgo_ListIteratorOfListOfBPoint &
	:rtype: None
") Prepend;
		void Prepend (const HLRAlgo_BiPoint & I,HLRAlgo_ListIteratorOfListOfBPoint & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_ListOfBPoint &
	:rtype: None
") Prepend;
		void Prepend (HLRAlgo_ListOfBPoint & Other);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_BiPoint &
	:rtype: None
") Append;
		void Append (const HLRAlgo_BiPoint & I);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_BiPoint &
	:param theIt:
	:type theIt: HLRAlgo_ListIteratorOfListOfBPoint &
	:rtype: None
") Append;
		void Append (const HLRAlgo_BiPoint & I,HLRAlgo_ListIteratorOfListOfBPoint & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_ListOfBPoint &
	:rtype: None
") Append;
		void Append (HLRAlgo_ListOfBPoint & Other);
		%feature("autodoc", "	:rtype: HLRAlgo_BiPoint
") First;
		HLRAlgo_BiPoint & First ();
		%feature("autodoc", "	:rtype: HLRAlgo_BiPoint
") Last;
		HLRAlgo_BiPoint & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: HLRAlgo_ListIteratorOfListOfBPoint &
	:rtype: None
") Remove;
		void Remove (HLRAlgo_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_BiPoint &
	:param It:
	:type It: HLRAlgo_ListIteratorOfListOfBPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const HLRAlgo_BiPoint & I,HLRAlgo_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_ListOfBPoint &
	:param It:
	:type It: HLRAlgo_ListIteratorOfListOfBPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (HLRAlgo_ListOfBPoint & Other,HLRAlgo_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_BiPoint &
	:param It:
	:type It: HLRAlgo_ListIteratorOfListOfBPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const HLRAlgo_BiPoint & I,HLRAlgo_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "	:param Other:
	:type Other: HLRAlgo_ListOfBPoint &
	:param It:
	:type It: HLRAlgo_ListIteratorOfListOfBPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (HLRAlgo_ListOfBPoint & Other,HLRAlgo_ListIteratorOfListOfBPoint & It);
};


%feature("shadow") HLRAlgo_ListOfBPoint::~HLRAlgo_ListOfBPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_ListOfBPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_PolyAlgo;
class HLRAlgo_PolyAlgo : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_PolyAlgo;
		 HLRAlgo_PolyAlgo ();
		%feature("autodoc", "	:param HShell:
	:type HShell: Handle_TColStd_HArray1OfTransient &
	:rtype: None
") Init;
		void Init (const Handle_TColStd_HArray1OfTransient & HShell);
		%feature("autodoc", "	:rtype: TColStd_Array1OfTransient
") PolyShell;
		TColStd_Array1OfTransient & PolyShell ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Prepare all the data to process the algo.

	:rtype: None
") Update;
		void Update ();
		%feature("autodoc", "	:rtype: None
") InitHide;
		void InitHide ();
		%feature("autodoc", "	:rtype: bool
") MoreHide;
		Standard_Boolean MoreHide ();
		%feature("autodoc", "	:rtype: None
") NextHide;
		void NextHide ();
		%feature("autodoc", "	* process hiding between <Pt1> and <Pt2>.

	:param Coordinates:
	:type Coordinates: Standard_Address &
	:param status:
	:type status: HLRAlgo_EdgeStatus &
	:param Index:
	:type Index: Standard_Integer &
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None
") Hide;
		void Hide (Standard_Address & Coordinates,HLRAlgo_EdgeStatus & status,Standard_Integer &OutValue,Standard_Boolean & reg1,Standard_Boolean & regn,Standard_Boolean & outl,Standard_Boolean & intl);
		%feature("autodoc", "	:rtype: None
") InitShow;
		void InitShow ();
		%feature("autodoc", "	:rtype: bool
") MoreShow;
		Standard_Boolean MoreShow ();
		%feature("autodoc", "	:rtype: None
") NextShow;
		void NextShow ();
		%feature("autodoc", "	* process hiding between <Pt1> and <Pt2>.

	:param Coordinates:
	:type Coordinates: Standard_Address &
	:param Index:
	:type Index: Standard_Integer &
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None
") Show;
		void Show (Standard_Address & Coordinates,Standard_Integer &OutValue,Standard_Boolean & reg1,Standard_Boolean & regn,Standard_Boolean & outl,Standard_Boolean & intl);
};


%feature("shadow") HLRAlgo_PolyAlgo::~HLRAlgo_PolyAlgo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_PolyAlgo {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_PolyAlgo {
	Handle_HLRAlgo_PolyAlgo GetHandle() {
	return *(Handle_HLRAlgo_PolyAlgo*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_PolyAlgo;
class Handle_HLRAlgo_PolyAlgo : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_PolyAlgo();
        Handle_HLRAlgo_PolyAlgo(const Handle_HLRAlgo_PolyAlgo &aHandle);
        Handle_HLRAlgo_PolyAlgo(const HLRAlgo_PolyAlgo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_PolyAlgo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_PolyAlgo {
    HLRAlgo_PolyAlgo* GetObject() {
    return (HLRAlgo_PolyAlgo*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_PolyAlgo::~Handle_HLRAlgo_PolyAlgo %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_PolyAlgo {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_PolyData;
class HLRAlgo_PolyData : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_PolyData;
		 HLRAlgo_PolyData ();
		%feature("autodoc", "	:param HNodes:
	:type HNodes: Handle_TColgp_HArray1OfXYZ
	:rtype: None
") HNodes;
		void HNodes (const Handle_TColgp_HArray1OfXYZ & HNodes);
		%feature("autodoc", "	:param HTData:
	:type HTData: Handle_HLRAlgo_HArray1OfTData &
	:rtype: None
") HTData;
		void HTData (const Handle_HLRAlgo_HArray1OfTData & HTData);
		%feature("autodoc", "	:param HPHDat:
	:type HPHDat: Handle_HLRAlgo_HArray1OfPHDat &
	:rtype: None
") HPHDat;
		void HPHDat (const Handle_HLRAlgo_HArray1OfPHDat & HPHDat);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: None
") FaceIndex;
		void FaceIndex (const Standard_Integer I);
		%feature("autodoc", "	:rtype: int
") FaceIndex;
		Standard_Integer FaceIndex ();
		%feature("autodoc", "	:rtype: TColgp_Array1OfXYZ
") Nodes;
		TColgp_Array1OfXYZ & Nodes ();
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfTData
") TData;
		HLRAlgo_Array1OfTData & TData ();
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfPHDat
") PHDat;
		HLRAlgo_Array1OfPHDat & PHDat ();
		%feature("autodoc", "	:param ToTMinMax:
	:type ToTMinMax: Standard_Address
	:rtype: None
") UpdateGlobalMinMax;
		void UpdateGlobalMinMax (const Standard_Address ToTMinMax);
		%feature("autodoc", "	:rtype: bool
") Hiding;
		Standard_Boolean Hiding ();
		%feature("autodoc", "	* process hiding between <Pt1> and <Pt2>.

	:param Coordinates:
	:type Coordinates: Standard_Address
	:param RealPtr:
	:type RealPtr: Standard_Address
	:param Indices:
	:type Indices: Standard_Address
	:param HidingShell:
	:type HidingShell: bool
	:param status:
	:type status: HLRAlgo_EdgeStatus &
	:rtype: None
") HideByPolyData;
		void HideByPolyData (const Standard_Address Coordinates,const Standard_Address RealPtr,const Standard_Address Indices,const Standard_Boolean HidingShell,HLRAlgo_EdgeStatus & status);
		%feature("autodoc", "	:rtype: Standard_Address
") Indices;
		Standard_Address Indices ();
};


%feature("shadow") HLRAlgo_PolyData::~HLRAlgo_PolyData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_PolyData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_PolyData {
	Handle_HLRAlgo_PolyData GetHandle() {
	return *(Handle_HLRAlgo_PolyData*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_PolyData;
class Handle_HLRAlgo_PolyData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_PolyData();
        Handle_HLRAlgo_PolyData(const Handle_HLRAlgo_PolyData &aHandle);
        Handle_HLRAlgo_PolyData(const HLRAlgo_PolyData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_PolyData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_PolyData {
    HLRAlgo_PolyData* GetObject() {
    return (HLRAlgo_PolyData*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_PolyData::~Handle_HLRAlgo_PolyData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_PolyData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_PolyHidingData;
class HLRAlgo_PolyHidingData {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_PolyHidingData;
		 HLRAlgo_PolyHidingData ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Minim:
	:type Minim: Standard_Integer
	:param Maxim:
	:type Maxim: Standard_Integer
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:rtype: None
") Set;
		void Set (const Standard_Integer Index,const Standard_Integer Minim,const Standard_Integer Maxim,const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);
		%feature("autodoc", "	:rtype: Standard_Address
") IndexAndMinMax;
		Standard_Address IndexAndMinMax ();
		%feature("autodoc", "	:rtype: Standard_Address
") Plan;
		Standard_Address Plan ();
};


%feature("shadow") HLRAlgo_PolyHidingData::~HLRAlgo_PolyHidingData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_PolyHidingData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_PolyInternalData;
class HLRAlgo_PolyInternalData : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param nbNod:
	:type nbNod: Standard_Integer
	:param nbTri:
	:type nbTri: Standard_Integer
	:rtype: None
") HLRAlgo_PolyInternalData;
		 HLRAlgo_PolyInternalData (const Standard_Integer nbNod,const Standard_Integer nbTri);
		%feature("autodoc", "	:param TData:
	:type TData: Standard_Address &
	:param PISeg:
	:type PISeg: Standard_Address &
	:param PINod:
	:type PINod: Standard_Address &
	:rtype: None
") UpdateLinks;
		void UpdateLinks (Standard_Address & TData,Standard_Address & PISeg,Standard_Address & PINod);
		%feature("autodoc", "	:param Nod1RValues:
	:type Nod1RValues: Standard_Address
	:param Nod2RValues:
	:type Nod2RValues: Standard_Address
	:param PINod1:
	:type PINod1: Standard_Address &
	:param PINod2:
	:type PINod2: Standard_Address &
	:param coef1:
	:type coef1: float
	:param X3:
	:type X3: float
	:param Y3:
	:type Y3: float
	:param Z3:
	:type Z3: float
	:rtype: int
") AddNode;
		Standard_Integer AddNode (const Standard_Address Nod1RValues,const Standard_Address Nod2RValues,Standard_Address & PINod1,Standard_Address & PINod2,const Standard_Real coef1,const Standard_Real X3,const Standard_Real Y3,const Standard_Real Z3);
		%feature("autodoc", "	:param ip1:
	:type ip1: Standard_Integer
	:param ip2:
	:type ip2: Standard_Integer
	:param ip3:
	:type ip3: Standard_Integer
	:param TData1:
	:type TData1: Standard_Address &
	:param TData2:
	:type TData2: Standard_Address &
	:param PISeg1:
	:type PISeg1: Standard_Address &
	:param PISeg2:
	:type PISeg2: Standard_Address &
	:param PINod1:
	:type PINod1: Standard_Address &
	:param PINod2:
	:type PINod2: Standard_Address &
	:rtype: None
") UpdateLinks;
		void UpdateLinks (const Standard_Integer ip1,const Standard_Integer ip2,const Standard_Integer ip3,Standard_Address & TData1,Standard_Address & TData2,Standard_Address & PISeg1,Standard_Address & PISeg2,Standard_Address & PINod1,Standard_Address & PINod2);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	:param TData1:
	:type TData1: Standard_Address &
	:param TData2:
	:type TData2: Standard_Address &
	:rtype: None
") IncTData;
		void IncTData (Standard_Address & TData1,Standard_Address & TData2);
		%feature("autodoc", "	:param PISeg1:
	:type PISeg1: Standard_Address &
	:param PISeg2:
	:type PISeg2: Standard_Address &
	:rtype: None
") IncPISeg;
		void IncPISeg (Standard_Address & PISeg1,Standard_Address & PISeg2);
		%feature("autodoc", "	:param PINod1:
	:type PINod1: Standard_Address &
	:param PINod2:
	:type PINod2: Standard_Address &
	:rtype: None
") IncPINod;
		void IncPINod (Standard_Address & PINod1,Standard_Address & PINod2);
		%feature("autodoc", "	:rtype: None
") DecTData;
		void DecTData ();
		%feature("autodoc", "	:rtype: None
") DecPISeg;
		void DecPISeg ();
		%feature("autodoc", "	:rtype: None
") DecPINod;
		void DecPINod ();
		%feature("autodoc", "	:rtype: int
") NbTData;
		Standard_Integer NbTData ();
		%feature("autodoc", "	:rtype: int
") NbPISeg;
		Standard_Integer NbPISeg ();
		%feature("autodoc", "	:rtype: int
") NbPINod;
		Standard_Integer NbPINod ();
		%feature("autodoc", "	:rtype: bool
") Planar;
		Standard_Boolean Planar ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Planar;
		void Planar (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") IntOutL;
		Standard_Boolean IntOutL ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") IntOutL;
		void IntOutL (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfTData
") TData;
		HLRAlgo_Array1OfTData & TData ();
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfPISeg
") PISeg;
		HLRAlgo_Array1OfPISeg & PISeg ();
		%feature("autodoc", "	:rtype: HLRAlgo_Array1OfPINod
") PINod;
		HLRAlgo_Array1OfPINod & PINod ();
};


%feature("shadow") HLRAlgo_PolyInternalData::~HLRAlgo_PolyInternalData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_PolyInternalData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_PolyInternalData {
	Handle_HLRAlgo_PolyInternalData GetHandle() {
	return *(Handle_HLRAlgo_PolyInternalData*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_PolyInternalData;
class Handle_HLRAlgo_PolyInternalData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_PolyInternalData();
        Handle_HLRAlgo_PolyInternalData(const Handle_HLRAlgo_PolyInternalData &aHandle);
        Handle_HLRAlgo_PolyInternalData(const HLRAlgo_PolyInternalData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_PolyInternalData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_PolyInternalData {
    HLRAlgo_PolyInternalData* GetObject() {
    return (HLRAlgo_PolyInternalData*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_PolyInternalData::~Handle_HLRAlgo_PolyInternalData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_PolyInternalData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_PolyInternalNode;
class HLRAlgo_PolyInternalNode : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_PolyInternalNode;
		 HLRAlgo_PolyInternalNode ();
		%feature("autodoc", "	:rtype: Standard_Address
") Indices;
		Standard_Address Indices ();
		%feature("autodoc", "	:rtype: Standard_Address
") RValues;
		Standard_Address RValues ();
};


%feature("shadow") HLRAlgo_PolyInternalNode::~HLRAlgo_PolyInternalNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_PolyInternalNode {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_PolyInternalNode {
	Handle_HLRAlgo_PolyInternalNode GetHandle() {
	return *(Handle_HLRAlgo_PolyInternalNode*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_PolyInternalNode;
class Handle_HLRAlgo_PolyInternalNode : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_PolyInternalNode();
        Handle_HLRAlgo_PolyInternalNode(const Handle_HLRAlgo_PolyInternalNode &aHandle);
        Handle_HLRAlgo_PolyInternalNode(const HLRAlgo_PolyInternalNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_PolyInternalNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_PolyInternalNode {
    HLRAlgo_PolyInternalNode* GetObject() {
    return (HLRAlgo_PolyInternalNode*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_PolyInternalNode::~Handle_HLRAlgo_PolyInternalNode %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_PolyInternalNode {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_PolyInternalSegment;
class HLRAlgo_PolyInternalSegment {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_PolyInternalSegment;
		 HLRAlgo_PolyInternalSegment ();
		%feature("autodoc", "	:rtype: Standard_Address
") Indices;
		Standard_Address Indices ();
};


%feature("shadow") HLRAlgo_PolyInternalSegment::~HLRAlgo_PolyInternalSegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_PolyInternalSegment {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_PolyShellData;
class HLRAlgo_PolyShellData : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param nbFace:
	:type nbFace: Standard_Integer
	:rtype: None
") HLRAlgo_PolyShellData;
		 HLRAlgo_PolyShellData (const Standard_Integer nbFace);
		%feature("autodoc", "	:param TotMinMax:
	:type TotMinMax: Standard_Address
	:rtype: None
") UpdateGlobalMinMax;
		void UpdateGlobalMinMax (const Standard_Address TotMinMax);
		%feature("autodoc", "	:param nbHiding:
	:type nbHiding: Standard_Integer
	:rtype: None
") UpdateHiding;
		void UpdateHiding (const Standard_Integer nbHiding);
		%feature("autodoc", "	:rtype: bool
") Hiding;
		Standard_Boolean Hiding ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfTransient
") PolyData;
		TColStd_Array1OfTransient & PolyData ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfTransient
") HidingPolyData;
		TColStd_Array1OfTransient & HidingPolyData ();
		%feature("autodoc", "	:rtype: HLRAlgo_ListOfBPoint
") Edges;
		HLRAlgo_ListOfBPoint & Edges ();
		%feature("autodoc", "	:rtype: Standard_Address
") Indices;
		Standard_Address Indices ();
};


%feature("shadow") HLRAlgo_PolyShellData::~HLRAlgo_PolyShellData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_PolyShellData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_PolyShellData {
	Handle_HLRAlgo_PolyShellData GetHandle() {
	return *(Handle_HLRAlgo_PolyShellData*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_PolyShellData;
class Handle_HLRAlgo_PolyShellData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_PolyShellData();
        Handle_HLRAlgo_PolyShellData(const Handle_HLRAlgo_PolyShellData &aHandle);
        Handle_HLRAlgo_PolyShellData(const HLRAlgo_PolyShellData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_PolyShellData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_PolyShellData {
    HLRAlgo_PolyShellData* GetObject() {
    return (HLRAlgo_PolyShellData*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_PolyShellData::~Handle_HLRAlgo_PolyShellData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_PolyShellData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRAlgo_Projector;
class HLRAlgo_Projector {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_Projector;
		 HLRAlgo_Projector ();
		%feature("autodoc", "	* Creates an axonometric projector. <CS> is the viewing coordinate system.

	:param CS:
	:type CS: gp_Ax2
	:rtype: None
") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Ax2 & CS);
		%feature("autodoc", "	* Creates a perspective projector. <CS> is the viewing coordinate system.

	:param CS:
	:type CS: gp_Ax2
	:param Focus:
	:type Focus: float
	:rtype: None
") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Ax2 & CS,const Standard_Real Focus);
		%feature("autodoc", "	* build a Projector with automatic minmax directions.

	:param T:
	:type T: gp_Trsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:rtype: None
") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("autodoc", "	* build a Projector with given minmax directions.

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
	:rtype: None
") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus,const gp_Vec2d & v1,const gp_Vec2d & v2,const gp_Vec2d & v3);
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:rtype: None
") Set;
		void Set (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("autodoc", "	:param D1:
	:type D1: gp_Vec2d
	:param D2:
	:type D2: gp_Vec2d
	:param D3:
	:type D3: gp_Vec2d
	:rtype: None
") Directions;
		void Directions (gp_Vec2d & D1,gp_Vec2d & D2,gp_Vec2d & D3);
		%feature("autodoc", "	* to compute with the given scale and translation.

	:param On: default value is Standard_False
	:type On: bool
	:rtype: None
") Scaled;
		void Scaled (const Standard_Boolean On = Standard_False);
		%feature("autodoc", "	* Returns True if there is a perspective transformation.

	:rtype: bool
") Perspective;
		Standard_Boolean Perspective ();
		%feature("autodoc", "	* Returns the active transformation.

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf  Transformation ();
		%feature("autodoc", "	* Returns the active inverted transformation.

	:rtype: gp_Trsf
") InvertedTransformation;
		const gp_Trsf  InvertedTransformation ();
		%feature("autodoc", "	* Returns the original transformation.

	:rtype: gp_Trsf
") FullTransformation;
		const gp_Trsf  FullTransformation ();
		%feature("autodoc", "	* Returns the focal length.

	:rtype: float
") Focus;
		Standard_Real Focus ();
		%feature("autodoc", "	:param D:
	:type D: gp_Vec
	:rtype: None
") Transform;
		void Transform (gp_Vec & D);
		%feature("autodoc", "	:param Pnt:
	:type Pnt: gp_Pnt
	:rtype: None
") Transform;
		void Transform (gp_Pnt & Pnt);
		%feature("autodoc", "	* Transform and apply perspective if needed.

	:param P:
	:type P: gp_Pnt
	:param Pout:
	:type Pout: gp_Pnt2d
	:rtype: None
") Project;
		void Project (const gp_Pnt & P,gp_Pnt2d & Pout);
		%feature("autodoc", "	* Transform and apply perspective if needed.

	:param P:
	:type P: gp_Pnt
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Project;
		void Project (const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Transform and apply perspective if needed.

	:param P:
	:type P: gp_Pnt
	:param D1:
	:type D1: gp_Vec
	:param Pout:
	:type Pout: gp_Pnt2d
	:param D1out:
	:type D1out: gp_Vec2d
	:rtype: None
") Project;
		void Project (const gp_Pnt & P,const gp_Vec & D1,gp_Pnt2d & Pout,gp_Vec2d & D1out);
		%feature("autodoc", "	* return a line going through the eye towards the 2d point <X,Y>.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: gp_Lin
") Shoot;
		gp_Lin Shoot (const Standard_Real X,const Standard_Real Y);
};


%feature("shadow") HLRAlgo_Projector::~HLRAlgo_Projector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_Projector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_TriangleData;
class HLRAlgo_TriangleData {
	public:
		%feature("autodoc", "	:rtype: None
") HLRAlgo_TriangleData;
		 HLRAlgo_TriangleData ();
		%feature("autodoc", "	:rtype: Standard_Address
") Indices;
		Standard_Address Indices ();
};


%feature("shadow") HLRAlgo_TriangleData::~HLRAlgo_TriangleData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_TriangleData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRAlgo_WiresBlock;
class HLRAlgo_WiresBlock : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Create a Block of Blocks.

	:param NbWires:
	:type NbWires: Standard_Integer
	:rtype: None
") HLRAlgo_WiresBlock;
		 HLRAlgo_WiresBlock (const Standard_Integer NbWires);
		%feature("autodoc", "	:rtype: int
") NbWires;
		Standard_Integer NbWires ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param W:
	:type W: Handle_HLRAlgo_EdgesBlock &
	:rtype: None
") Set;
		void Set (const Standard_Integer I,const Handle_HLRAlgo_EdgesBlock & W);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Handle_HLRAlgo_EdgesBlock
") Wire;
		Handle_HLRAlgo_EdgesBlock & Wire (const Standard_Integer I);
		%feature("autodoc", "	:param TotMinMax:
	:type TotMinMax: Standard_Address
	:rtype: None
") UpdateMinMax;
		void UpdateMinMax (const Standard_Address TotMinMax);
		%feature("autodoc", "	:rtype: Standard_Address
") MinMax;
		Standard_Address MinMax ();
};


%feature("shadow") HLRAlgo_WiresBlock::~HLRAlgo_WiresBlock %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAlgo_WiresBlock {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRAlgo_WiresBlock {
	Handle_HLRAlgo_WiresBlock GetHandle() {
	return *(Handle_HLRAlgo_WiresBlock*) &$self;
	}
};

%nodefaultctor Handle_HLRAlgo_WiresBlock;
class Handle_HLRAlgo_WiresBlock : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRAlgo_WiresBlock();
        Handle_HLRAlgo_WiresBlock(const Handle_HLRAlgo_WiresBlock &aHandle);
        Handle_HLRAlgo_WiresBlock(const HLRAlgo_WiresBlock *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRAlgo_WiresBlock DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRAlgo_WiresBlock {
    HLRAlgo_WiresBlock* GetObject() {
    return (HLRAlgo_WiresBlock*)$self->Access();
    }
};
%feature("shadow") Handle_HLRAlgo_WiresBlock::~Handle_HLRAlgo_WiresBlock %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRAlgo_WiresBlock {
    void _kill_pointed() {
        delete $self;
    }
};

