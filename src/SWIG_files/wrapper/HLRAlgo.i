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
		%feature("autodoc", "Args:
	x(Standard_Real)
	y(Standard_Real)
	z(Standard_Real)
	Min(Standard_Address)
	Max(Standard_Address)

Returns:
	static void

Iterator  on the  visible or  hidden  parts of  an  
         EdgeStatus.") UpdateMinMax;
		static void UpdateMinMax (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Address Min,const Standard_Address Max);
		%feature("autodoc", "Args:
	tol(Standard_Real)
	Min(Standard_Address)
	Max(Standard_Address)

Returns:
	static void

No detailed docstring for this function.") EnlargeMinMax;
		static void EnlargeMinMax (const Standard_Real tol,const Standard_Address Min,const Standard_Address Max);
		%feature("autodoc", "Args:
	Big(Standard_Real)
	Min(Standard_Address)
	Max(Standard_Address)

Returns:
	static void

No detailed docstring for this function.") InitMinMax;
		static void InitMinMax (const Standard_Real Big,const Standard_Address Min,const Standard_Address Max);
		%feature("autodoc", "Args:
	Min(Standard_Address)
	Max(Standard_Address)
	MinMax(Standard_Address)

Returns:
	static void

No detailed docstring for this function.") EncodeMinMax;
		static void EncodeMinMax (const Standard_Address Min,const Standard_Address Max,const Standard_Address MinMax);
		%feature("autodoc", "Args:
	Min(Standard_Address)
	Max(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") SizeBox;
		static Standard_Real SizeBox (const Standard_Address Min,const Standard_Address Max);
		%feature("autodoc", "Args:
	MinMax(Standard_Address)
	Min(Standard_Address)
	Max(Standard_Address)

Returns:
	static void

No detailed docstring for this function.") DecodeMinMax;
		static void DecodeMinMax (const Standard_Address MinMax,const Standard_Address Min,const Standard_Address Max);
		%feature("autodoc", "Args:
	IMin(Standard_Address)
	IMax(Standard_Address)
	OMin(Standard_Address)
	OMax(Standard_Address)

Returns:
	static void

No detailed docstring for this function.") CopyMinMax;
		static void CopyMinMax (const Standard_Address IMin,const Standard_Address IMax,const Standard_Address OMin,const Standard_Address OMax);
		%feature("autodoc", "Args:
	IMin(Standard_Address)
	IMax(Standard_Address)
	OMin(Standard_Address)
	OMax(Standard_Address)

Returns:
	static void

No detailed docstring for this function.") AddMinMax;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_Array1OfPHDat;
		 HLRAlgo_Array1OfPHDat (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(HLRAlgo_PolyHidingData)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_Array1OfPHDat;
		 HLRAlgo_Array1OfPHDat (const HLRAlgo_PolyHidingData & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(HLRAlgo_PolyHidingData)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const HLRAlgo_PolyHidingData & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(HLRAlgo_Array1OfPHDat)

Returns:
	HLRAlgo_Array1OfPHDat

No detailed docstring for this function.") Assign;
		const HLRAlgo_Array1OfPHDat & Assign (const HLRAlgo_Array1OfPHDat & Other);
		%feature("autodoc", "Args:
	Other(HLRAlgo_Array1OfPHDat)

Returns:
	HLRAlgo_Array1OfPHDat

No detailed docstring for this function.") operator=;
		const HLRAlgo_Array1OfPHDat & operator = (const HLRAlgo_Array1OfPHDat & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(HLRAlgo_PolyHidingData)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_PolyHidingData & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_PolyHidingData

No detailed docstring for this function.") Value;
		const HLRAlgo_PolyHidingData & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_PolyHidingData

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_Array1OfPINod;
		 HLRAlgo_Array1OfPINod (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_HLRAlgo_PolyInternalNode)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_Array1OfPINod;
		 HLRAlgo_Array1OfPINod (const Handle_HLRAlgo_PolyInternalNode & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_HLRAlgo_PolyInternalNode)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_HLRAlgo_PolyInternalNode & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(HLRAlgo_Array1OfPINod)

Returns:
	HLRAlgo_Array1OfPINod

No detailed docstring for this function.") Assign;
		const HLRAlgo_Array1OfPINod & Assign (const HLRAlgo_Array1OfPINod & Other);
		%feature("autodoc", "Args:
	Other(HLRAlgo_Array1OfPINod)

Returns:
	HLRAlgo_Array1OfPINod

No detailed docstring for this function.") operator=;
		const HLRAlgo_Array1OfPINod & operator = (const HLRAlgo_Array1OfPINod & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_HLRAlgo_PolyInternalNode)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_HLRAlgo_PolyInternalNode & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_HLRAlgo_PolyInternalNode

No detailed docstring for this function.") Value;
		const Handle_HLRAlgo_PolyInternalNode & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_HLRAlgo_PolyInternalNode

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_Array1OfPISeg;
		 HLRAlgo_Array1OfPISeg (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(HLRAlgo_PolyInternalSegment)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_Array1OfPISeg;
		 HLRAlgo_Array1OfPISeg (const HLRAlgo_PolyInternalSegment & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(HLRAlgo_PolyInternalSegment)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const HLRAlgo_PolyInternalSegment & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(HLRAlgo_Array1OfPISeg)

Returns:
	HLRAlgo_Array1OfPISeg

No detailed docstring for this function.") Assign;
		const HLRAlgo_Array1OfPISeg & Assign (const HLRAlgo_Array1OfPISeg & Other);
		%feature("autodoc", "Args:
	Other(HLRAlgo_Array1OfPISeg)

Returns:
	HLRAlgo_Array1OfPISeg

No detailed docstring for this function.") operator=;
		const HLRAlgo_Array1OfPISeg & operator = (const HLRAlgo_Array1OfPISeg & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(HLRAlgo_PolyInternalSegment)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_PolyInternalSegment & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_PolyInternalSegment

No detailed docstring for this function.") Value;
		const HLRAlgo_PolyInternalSegment & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_PolyInternalSegment

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_Array1OfTData;
		 HLRAlgo_Array1OfTData (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(HLRAlgo_TriangleData)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_Array1OfTData;
		 HLRAlgo_Array1OfTData (const HLRAlgo_TriangleData & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(HLRAlgo_TriangleData)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const HLRAlgo_TriangleData & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(HLRAlgo_Array1OfTData)

Returns:
	HLRAlgo_Array1OfTData

No detailed docstring for this function.") Assign;
		const HLRAlgo_Array1OfTData & Assign (const HLRAlgo_Array1OfTData & Other);
		%feature("autodoc", "Args:
	Other(HLRAlgo_Array1OfTData)

Returns:
	HLRAlgo_Array1OfTData

No detailed docstring for this function.") operator=;
		const HLRAlgo_Array1OfTData & operator = (const HLRAlgo_Array1OfTData & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(HLRAlgo_TriangleData)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_TriangleData & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_TriangleData

No detailed docstring for this function.") Value;
		const HLRAlgo_TriangleData & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_TriangleData

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint ();
		%feature("autodoc", "Args:
	X1(Standard_Real)
	Y1(Standard_Real)
	Z1(Standard_Real)
	X2(Standard_Real)
	Y2(Standard_Real)
	Z2(Standard_Real)
	XT1(Standard_Real)
	YT1(Standard_Real)
	ZT1(Standard_Real)
	XT2(Standard_Real)
	YT2(Standard_Real)
	ZT2(Standard_Real)
	Index(Standard_Integer)
	reg1(Standard_Boolean)
	regn(Standard_Boolean)
	outl(Standard_Boolean)
	intl(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);
		%feature("autodoc", "Args:
	X1(Standard_Real)
	Y1(Standard_Real)
	Z1(Standard_Real)
	X2(Standard_Real)
	Y2(Standard_Real)
	Z2(Standard_Real)
	XT1(Standard_Real)
	YT1(Standard_Real)
	ZT1(Standard_Real)
	XT2(Standard_Real)
	YT2(Standard_Real)
	ZT2(Standard_Real)
	Index(Standard_Integer)
	flag(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer flag);
		%feature("autodoc", "Args:
	X1(Standard_Real)
	Y1(Standard_Real)
	Z1(Standard_Real)
	X2(Standard_Real)
	Y2(Standard_Real)
	Z2(Standard_Real)
	XT1(Standard_Real)
	YT1(Standard_Real)
	ZT1(Standard_Real)
	XT2(Standard_Real)
	YT2(Standard_Real)
	ZT2(Standard_Real)
	Index(Standard_Integer)
	i1(Standard_Integer)
	i1p1(Standard_Integer)
	i1p2(Standard_Integer)
	reg1(Standard_Boolean)
	regn(Standard_Boolean)
	outl(Standard_Boolean)
	intl(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);
		%feature("autodoc", "Args:
	X1(Standard_Real)
	Y1(Standard_Real)
	Z1(Standard_Real)
	X2(Standard_Real)
	Y2(Standard_Real)
	Z2(Standard_Real)
	XT1(Standard_Real)
	YT1(Standard_Real)
	ZT1(Standard_Real)
	XT2(Standard_Real)
	YT2(Standard_Real)
	ZT2(Standard_Real)
	Index(Standard_Integer)
	i1(Standard_Integer)
	i1p1(Standard_Integer)
	i1p2(Standard_Integer)
	flag(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Integer flag);
		%feature("autodoc", "Args:
	X1(Standard_Real)
	Y1(Standard_Real)
	Z1(Standard_Real)
	X2(Standard_Real)
	Y2(Standard_Real)
	Z2(Standard_Real)
	XT1(Standard_Real)
	YT1(Standard_Real)
	ZT1(Standard_Real)
	XT2(Standard_Real)
	YT2(Standard_Real)
	ZT2(Standard_Real)
	Index(Standard_Integer)
	i1(Standard_Integer)
	i1p1(Standard_Integer)
	i1p2(Standard_Integer)
	i2(Standard_Integer)
	i2p1(Standard_Integer)
	i2p2(Standard_Integer)
	reg1(Standard_Boolean)
	regn(Standard_Boolean)
	outl(Standard_Boolean)
	intl(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Integer i2,const Standard_Integer i2p1,const Standard_Integer i2p2,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);
		%feature("autodoc", "Args:
	X1(Standard_Real)
	Y1(Standard_Real)
	Z1(Standard_Real)
	X2(Standard_Real)
	Y2(Standard_Real)
	Z2(Standard_Real)
	XT1(Standard_Real)
	YT1(Standard_Real)
	ZT1(Standard_Real)
	XT2(Standard_Real)
	YT2(Standard_Real)
	ZT2(Standard_Real)
	Index(Standard_Integer)
	i1(Standard_Integer)
	i1p1(Standard_Integer)
	i1p2(Standard_Integer)
	i2(Standard_Integer)
	i2p1(Standard_Integer)
	i2p2(Standard_Integer)
	flag(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_BiPoint;
		 HLRAlgo_BiPoint (const Standard_Real X1,const Standard_Real Y1,const Standard_Real Z1,const Standard_Real X2,const Standard_Real Y2,const Standard_Real Z2,const Standard_Real XT1,const Standard_Real YT1,const Standard_Real ZT1,const Standard_Real XT2,const Standard_Real YT2,const Standard_Real ZT2,const Standard_Integer Index,const Standard_Integer i1,const Standard_Integer i1p1,const Standard_Integer i1p2,const Standard_Integer i2,const Standard_Integer i2p1,const Standard_Integer i2p2,const Standard_Integer flag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Rg1Line;
		Standard_Boolean Rg1Line ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Rg1Line;
		void Rg1Line (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") RgNLine;
		Standard_Boolean RgNLine ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") RgNLine;
		void RgNLine (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") OutLine;
		Standard_Boolean OutLine ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") OutLine;
		void OutLine (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IntLine;
		Standard_Boolean IntLine ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") IntLine;
		void IntLine (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Hidden;
		Standard_Boolean Hidden ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Hidden;
		void Hidden (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Indices;
		Standard_Address Indices ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Coordinates;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_Coincidence;
		 HLRAlgo_Coincidence ();
		%feature("autodoc", "Args:
	FE(Standard_Integer)
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set2D;
		void Set2D (const Standard_Integer FE,const Standard_Real Param);
		%feature("autodoc", "Args:
	stbef(TopAbs_State)
	staft(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") SetState3D;
		void SetState3D (const TopAbs_State stbef,const TopAbs_State staft);
		%feature("autodoc", "Args:
	FE(Standard_Integer)
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Value2D;
		void Value2D (Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	stbef(TopAbs_State)
	staft(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") State3D;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Iterator  on the  visible or  hidden  parts of  an  
         edge.") HLRAlgo_EdgeIterator;
		 HLRAlgo_EdgeIterator ();
		%feature("autodoc", "Args:
	status(HLRAlgo_EdgeStatus)

Returns:
	None

No detailed docstring for this function.") InitHidden;
		void InitHidden (const HLRAlgo_EdgeStatus & status);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreHidden;
		Standard_Boolean MoreHidden ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextHidden;
		void NextHidden ();
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

Returns the bounds and the tolerances  
         of the current Hidden Interval") Hidden;
		void Hidden (Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);
		%feature("autodoc", "Args:
	status(HLRAlgo_EdgeStatus)

Returns:
	None

No detailed docstring for this function.") InitVisible;
		void InitVisible (const HLRAlgo_EdgeStatus & status);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreVisible;
		Standard_Boolean MoreVisible ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextVisible;
		void NextVisible ();
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

Returns the bounds and the tolerances  
         of the current Visible Interval") Visible;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus ();
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

Creates a  new  EdgeStatus.  Default visible.  The  
         Edge is   bounded by the  interval  <Start>, <End>  
         with the tolerances <TolStart>, <TolEnd>.") HLRAlgo_EdgeStatus;
		 HLRAlgo_EdgeStatus (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

Initialize  an  EdgeStatus.  Default visible.  The  
         Edge is   bounded by the  interval  <Start>, <End>  
         with the tolerances <TolStart>, <TolEnd>.") Initialize;
		void Initialize (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVisiblePart;
		Standard_Integer NbVisiblePart ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Start(Standard_Real)
	TolStart(Standard_ShortReal)
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") VisiblePart;
		void VisiblePart (const Standard_Integer Index,Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)
	End(Standard_Real)
	TolEnd(Standard_ShortReal)
	OnFace(Standard_Boolean)
	OnBoundary(Standard_Boolean)

Returns:
	None

Hides  the  interval  <Start>,    <End>   with the  
         tolerances <TolStart>,  <TolEnd>. This interval is  
         subtracted from the visible  parts.  If the hidden  
         part is on ( or under ) the face the flag <OnFace>  
         is True ( or False ).  If the hidden  part is on (  
         or  inside  ) the boundary  of  the  face the flag  
         <OnBoundary> is True ( or False ).") Hide;
		void Hide (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd,const Standard_Boolean OnFace,const Standard_Boolean OnBoundary);
		%feature("autodoc", "Args:
	None
Returns:
	None

Hide the whole Edge.") HideAll;
		void HideAll ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Show the whole Edge.") ShowAll;
		void ShowAll ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AllHidden;
		Standard_Boolean AllHidden ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") AllHidden;
		void AllHidden (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AllVisible;
		Standard_Boolean AllVisible ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") AllVisible;
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
		%feature("autodoc", "Args:
	NbEdges(Standard_Integer)

Returns:
	None

Create a Block of Edges for a wire.") HLRAlgo_EdgesBlock;
		 HLRAlgo_EdgesBlock (const Standard_Integer NbEdges);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	I(Standard_Integer)
	EI(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Edge;
		void Edge (const Standard_Integer I,const Standard_Integer EI);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Edge;
		Standard_Integer Edge (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	Or(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Orientation;
		void Orientation (const Standard_Integer I,const TopAbs_Orientation Or);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") OutLine;
		Standard_Boolean OutLine (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") OutLine;
		void OutLine (const Standard_Integer I,const Standard_Boolean B);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Internal;
		Standard_Boolean Internal (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Internal;
		void Internal (const Standard_Integer I,const Standard_Boolean B);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Double;
		Standard_Boolean Double (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Double;
		void Double (const Standard_Integer I,const Standard_Boolean B);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsoLine;
		Standard_Boolean IsoLine (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") IsoLine;
		void IsoLine (const Standard_Integer I,const Standard_Boolean B);
		%feature("autodoc", "Args:
	TotMinMax(Standard_Address)

Returns:
	None

No detailed docstring for this function.") UpdateMinMax;
		void UpdateMinMax (const Standard_Address TotMinMax);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") MinMax;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_HArray1OfPHDat;
		 HLRAlgo_HArray1OfPHDat (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(HLRAlgo_PolyHidingData)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_HArray1OfPHDat;
		 HLRAlgo_HArray1OfPHDat (const Standard_Integer Low,const Standard_Integer Up,const HLRAlgo_PolyHidingData & V);
		%feature("autodoc", "Args:
	V(HLRAlgo_PolyHidingData)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const HLRAlgo_PolyHidingData & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(HLRAlgo_PolyHidingData)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_PolyHidingData & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_PolyHidingData

No detailed docstring for this function.") Value;
		const HLRAlgo_PolyHidingData & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_PolyHidingData

No detailed docstring for this function.") ChangeValue;
		HLRAlgo_PolyHidingData & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfPHDat

No detailed docstring for this function.") Array1;
		const HLRAlgo_Array1OfPHDat & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfPHDat

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_HArray1OfPINod;
		 HLRAlgo_HArray1OfPINod (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_HLRAlgo_PolyInternalNode)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_HArray1OfPINod;
		 HLRAlgo_HArray1OfPINod (const Standard_Integer Low,const Standard_Integer Up,const Handle_HLRAlgo_PolyInternalNode & V);
		%feature("autodoc", "Args:
	V(Handle_HLRAlgo_PolyInternalNode)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_HLRAlgo_PolyInternalNode & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_HLRAlgo_PolyInternalNode)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_HLRAlgo_PolyInternalNode & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_HLRAlgo_PolyInternalNode

No detailed docstring for this function.") Value;
		const Handle_HLRAlgo_PolyInternalNode & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_HLRAlgo_PolyInternalNode

No detailed docstring for this function.") ChangeValue;
		Handle_HLRAlgo_PolyInternalNode & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfPINod

No detailed docstring for this function.") Array1;
		const HLRAlgo_Array1OfPINod & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfPINod

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_HArray1OfPISeg;
		 HLRAlgo_HArray1OfPISeg (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(HLRAlgo_PolyInternalSegment)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_HArray1OfPISeg;
		 HLRAlgo_HArray1OfPISeg (const Standard_Integer Low,const Standard_Integer Up,const HLRAlgo_PolyInternalSegment & V);
		%feature("autodoc", "Args:
	V(HLRAlgo_PolyInternalSegment)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const HLRAlgo_PolyInternalSegment & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(HLRAlgo_PolyInternalSegment)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_PolyInternalSegment & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_PolyInternalSegment

No detailed docstring for this function.") Value;
		const HLRAlgo_PolyInternalSegment & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_PolyInternalSegment

No detailed docstring for this function.") ChangeValue;
		HLRAlgo_PolyInternalSegment & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfPISeg

No detailed docstring for this function.") Array1;
		const HLRAlgo_Array1OfPISeg & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfPISeg

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_HArray1OfTData;
		 HLRAlgo_HArray1OfTData (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(HLRAlgo_TriangleData)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_HArray1OfTData;
		 HLRAlgo_HArray1OfTData (const Standard_Integer Low,const Standard_Integer Up,const HLRAlgo_TriangleData & V);
		%feature("autodoc", "Args:
	V(HLRAlgo_TriangleData)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const HLRAlgo_TriangleData & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(HLRAlgo_TriangleData)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HLRAlgo_TriangleData & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_TriangleData

No detailed docstring for this function.") Value;
		const HLRAlgo_TriangleData & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRAlgo_TriangleData

No detailed docstring for this function.") ChangeValue;
		HLRAlgo_TriangleData & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfTData

No detailed docstring for this function.") Array1;
		const HLRAlgo_Array1OfTData & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfTData

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_Interference;
		 HLRAlgo_Interference ();
		%feature("autodoc", "Args:
	Inters(HLRAlgo_Intersection)
	Bound(HLRAlgo_Coincidence)
	Orient(TopAbs_Orientation)
	Trans(TopAbs_Orientation)
	BTrans(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_Interference;
		 HLRAlgo_Interference (const HLRAlgo_Intersection & Inters,const HLRAlgo_Coincidence & Bound,const TopAbs_Orientation Orient,const TopAbs_Orientation Trans,const TopAbs_Orientation BTrans);
		%feature("autodoc", "Args:
	I(HLRAlgo_Intersection)

Returns:
	None

No detailed docstring for this function.") Intersection;
		void Intersection (const HLRAlgo_Intersection & I);
		%feature("autodoc", "Args:
	B(HLRAlgo_Coincidence)

Returns:
	None

No detailed docstring for this function.") Boundary;
		void Boundary (const HLRAlgo_Coincidence & B);
		%feature("autodoc", "Args:
	O(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Orientation;
		void Orientation (const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	Tr(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Transition;
		void Transition (const TopAbs_Orientation Tr);
		%feature("autodoc", "Args:
	BTr(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") BoundaryTransition;
		void BoundaryTransition (const TopAbs_Orientation BTr);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Intersection

No detailed docstring for this function.") Intersection;
		const HLRAlgo_Intersection & Intersection ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Intersection

No detailed docstring for this function.") ChangeIntersection;
		HLRAlgo_Intersection & ChangeIntersection ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Coincidence

No detailed docstring for this function.") Boundary;
		const HLRAlgo_Coincidence & Boundary ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Coincidence

No detailed docstring for this function.") ChangeBoundary;
		HLRAlgo_Coincidence & ChangeBoundary ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Transition;
		TopAbs_Orientation Transition ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") BoundaryTransition;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_InterferenceList;
		 HLRAlgo_InterferenceList ();
		%feature("autodoc", "Args:
	Other(HLRAlgo_InterferenceList)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const HLRAlgo_InterferenceList & Other);
		%feature("autodoc", "Args:
	Other(HLRAlgo_InterferenceList)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const HLRAlgo_InterferenceList & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(HLRAlgo_Interference)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRAlgo_Interference & I);
		%feature("autodoc", "Args:
	I(HLRAlgo_Interference)
	theIt(HLRAlgo_ListIteratorOfInterferenceList)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRAlgo_Interference & I,HLRAlgo_ListIteratorOfInterferenceList & theIt);
		%feature("autodoc", "Args:
	Other(HLRAlgo_InterferenceList)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (HLRAlgo_InterferenceList & Other);
		%feature("autodoc", "Args:
	I(HLRAlgo_Interference)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRAlgo_Interference & I);
		%feature("autodoc", "Args:
	I(HLRAlgo_Interference)
	theIt(HLRAlgo_ListIteratorOfInterferenceList)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRAlgo_Interference & I,HLRAlgo_ListIteratorOfInterferenceList & theIt);
		%feature("autodoc", "Args:
	Other(HLRAlgo_InterferenceList)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (HLRAlgo_InterferenceList & Other);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Interference

No detailed docstring for this function.") First;
		HLRAlgo_Interference & First ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Interference

No detailed docstring for this function.") Last;
		HLRAlgo_Interference & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(HLRAlgo_ListIteratorOfInterferenceList)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (HLRAlgo_ListIteratorOfInterferenceList & It);
		%feature("autodoc", "Args:
	I(HLRAlgo_Interference)
	It(HLRAlgo_ListIteratorOfInterferenceList)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const HLRAlgo_Interference & I,HLRAlgo_ListIteratorOfInterferenceList & It);
		%feature("autodoc", "Args:
	Other(HLRAlgo_InterferenceList)
	It(HLRAlgo_ListIteratorOfInterferenceList)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (HLRAlgo_InterferenceList & Other,HLRAlgo_ListIteratorOfInterferenceList & It);
		%feature("autodoc", "Args:
	I(HLRAlgo_Interference)
	It(HLRAlgo_ListIteratorOfInterferenceList)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const HLRAlgo_Interference & I,HLRAlgo_ListIteratorOfInterferenceList & It);
		%feature("autodoc", "Args:
	Other(HLRAlgo_InterferenceList)
	It(HLRAlgo_ListIteratorOfInterferenceList)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_Intersection;
		 HLRAlgo_Intersection ();
		%feature("autodoc", "Args:
	Ori(TopAbs_Orientation)
	Lev(Standard_Integer)
	SegInd(Standard_Integer)
	Ind(Standard_Integer)
	P(Standard_Real)
	Tol(Standard_ShortReal)
	S(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_Intersection;
		 HLRAlgo_Intersection (const TopAbs_Orientation Ori,const Standard_Integer Lev,const Standard_Integer SegInd,const Standard_Integer Ind,const Standard_Real P,const Standard_ShortReal Tol,const TopAbs_State S);
		%feature("autodoc", "Args:
	Ori(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Orientation;
		void Orientation (const TopAbs_Orientation Ori);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	Lev(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Level;
		void Level (const Standard_Integer Lev);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Level;
		Standard_Integer Level ();
		%feature("autodoc", "Args:
	SegInd(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SegIndex;
		void SegIndex (const Standard_Integer SegInd);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SegIndex;
		Standard_Integer SegIndex ();
		%feature("autodoc", "Args:
	Ind(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Index;
		void Index (const Standard_Integer Ind);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameter;
		void Parameter (const Standard_Real P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	T(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Tolerance;
		void Tolerance (const Standard_ShortReal T);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") Tolerance;
		Standard_ShortReal Tolerance ();
		%feature("autodoc", "Args:
	S(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") State;
		void State (const TopAbs_State S);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") State;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_ListIteratorOfInterferenceList;
		 HLRAlgo_ListIteratorOfInterferenceList ();
		%feature("autodoc", "Args:
	L(HLRAlgo_InterferenceList)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_ListIteratorOfInterferenceList;
		 HLRAlgo_ListIteratorOfInterferenceList (const HLRAlgo_InterferenceList & L);
		%feature("autodoc", "Args:
	L(HLRAlgo_InterferenceList)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const HLRAlgo_InterferenceList & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Interference

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_ListIteratorOfListOfBPoint;
		 HLRAlgo_ListIteratorOfListOfBPoint ();
		%feature("autodoc", "Args:
	L(HLRAlgo_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_ListIteratorOfListOfBPoint;
		 HLRAlgo_ListIteratorOfListOfBPoint (const HLRAlgo_ListOfBPoint & L);
		%feature("autodoc", "Args:
	L(HLRAlgo_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const HLRAlgo_ListOfBPoint & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_BiPoint

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(HLRAlgo_Interference)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_ListNodeOfInterferenceList;
		 HLRAlgo_ListNodeOfInterferenceList (const HLRAlgo_Interference & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Interference

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(HLRAlgo_BiPoint)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_ListNodeOfListOfBPoint;
		 HLRAlgo_ListNodeOfListOfBPoint (const HLRAlgo_BiPoint & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_BiPoint

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_ListOfBPoint;
		 HLRAlgo_ListOfBPoint ();
		%feature("autodoc", "Args:
	Other(HLRAlgo_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const HLRAlgo_ListOfBPoint & Other);
		%feature("autodoc", "Args:
	Other(HLRAlgo_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const HLRAlgo_ListOfBPoint & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(HLRAlgo_BiPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRAlgo_BiPoint & I);
		%feature("autodoc", "Args:
	I(HLRAlgo_BiPoint)
	theIt(HLRAlgo_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRAlgo_BiPoint & I,HLRAlgo_ListIteratorOfListOfBPoint & theIt);
		%feature("autodoc", "Args:
	Other(HLRAlgo_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (HLRAlgo_ListOfBPoint & Other);
		%feature("autodoc", "Args:
	I(HLRAlgo_BiPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRAlgo_BiPoint & I);
		%feature("autodoc", "Args:
	I(HLRAlgo_BiPoint)
	theIt(HLRAlgo_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRAlgo_BiPoint & I,HLRAlgo_ListIteratorOfListOfBPoint & theIt);
		%feature("autodoc", "Args:
	Other(HLRAlgo_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (HLRAlgo_ListOfBPoint & Other);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_BiPoint

No detailed docstring for this function.") First;
		HLRAlgo_BiPoint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_BiPoint

No detailed docstring for this function.") Last;
		HLRAlgo_BiPoint & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(HLRAlgo_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (HLRAlgo_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "Args:
	I(HLRAlgo_BiPoint)
	It(HLRAlgo_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const HLRAlgo_BiPoint & I,HLRAlgo_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "Args:
	Other(HLRAlgo_ListOfBPoint)
	It(HLRAlgo_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (HLRAlgo_ListOfBPoint & Other,HLRAlgo_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "Args:
	I(HLRAlgo_BiPoint)
	It(HLRAlgo_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const HLRAlgo_BiPoint & I,HLRAlgo_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "Args:
	Other(HLRAlgo_ListOfBPoint)
	It(HLRAlgo_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_PolyAlgo;
		 HLRAlgo_PolyAlgo ();
		%feature("autodoc", "Args:
	HShell(Handle_TColStd_HArray1OfTransient)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_TColStd_HArray1OfTransient & HShell);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfTransient

No detailed docstring for this function.") PolyShell;
		TColStd_Array1OfTransient & PolyShell ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Prepare all the data to process the algo.") Update;
		void Update ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitHide;
		void InitHide ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreHide;
		Standard_Boolean MoreHide ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextHide;
		void NextHide ();
		%feature("autodoc", "Args:
	Coordinates(Standard_Address)
	status(HLRAlgo_EdgeStatus)
	Index(Standard_Integer)
	reg1(Standard_Boolean)
	regn(Standard_Boolean)
	outl(Standard_Boolean)
	intl(Standard_Boolean)

Returns:
	None

process hiding between <Pt1> and <Pt2>.") Hide;
		void Hide (Standard_Address & Coordinates,HLRAlgo_EdgeStatus & status,Standard_Integer &OutValue,Standard_Boolean & reg1,Standard_Boolean & regn,Standard_Boolean & outl,Standard_Boolean & intl);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitShow;
		void InitShow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreShow;
		Standard_Boolean MoreShow ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextShow;
		void NextShow ();
		%feature("autodoc", "Args:
	Coordinates(Standard_Address)
	Index(Standard_Integer)
	reg1(Standard_Boolean)
	regn(Standard_Boolean)
	outl(Standard_Boolean)
	intl(Standard_Boolean)

Returns:
	None

process hiding between <Pt1> and <Pt2>.") Show;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_PolyData;
		 HLRAlgo_PolyData ();
		%feature("autodoc", "Args:
	HNodes(Handle_TColgp_HArray1OfXYZ)

Returns:
	None

No detailed docstring for this function.") HNodes;
		void HNodes (const Handle_TColgp_HArray1OfXYZ & HNodes);
		%feature("autodoc", "Args:
	HTData(Handle_HLRAlgo_HArray1OfTData)

Returns:
	None

No detailed docstring for this function.") HTData;
		void HTData (const Handle_HLRAlgo_HArray1OfTData & HTData);
		%feature("autodoc", "Args:
	HPHDat(Handle_HLRAlgo_HArray1OfPHDat)

Returns:
	None

No detailed docstring for this function.") HPHDat;
		void HPHDat (const Handle_HLRAlgo_HArray1OfPHDat & HPHDat);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") FaceIndex;
		void FaceIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FaceIndex;
		Standard_Integer FaceIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array1OfXYZ

No detailed docstring for this function.") Nodes;
		TColgp_Array1OfXYZ & Nodes ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfTData

No detailed docstring for this function.") TData;
		HLRAlgo_Array1OfTData & TData ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfPHDat

No detailed docstring for this function.") PHDat;
		HLRAlgo_Array1OfPHDat & PHDat ();
		%feature("autodoc", "Args:
	ToTMinMax(Standard_Address)

Returns:
	None

No detailed docstring for this function.") UpdateGlobalMinMax;
		void UpdateGlobalMinMax (const Standard_Address ToTMinMax);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Hiding;
		Standard_Boolean Hiding ();
		%feature("autodoc", "Args:
	Coordinates(Standard_Address)
	RealPtr(Standard_Address)
	Indices(Standard_Address)
	HidingShell(Standard_Boolean)
	status(HLRAlgo_EdgeStatus)

Returns:
	None

process hiding between <Pt1> and <Pt2>.") HideByPolyData;
		void HideByPolyData (const Standard_Address Coordinates,const Standard_Address RealPtr,const Standard_Address Indices,const Standard_Boolean HidingShell,HLRAlgo_EdgeStatus & status);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Indices;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_PolyHidingData;
		 HLRAlgo_PolyHidingData ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Minim(Standard_Integer)
	Maxim(Standard_Integer)
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Integer Index,const Standard_Integer Minim,const Standard_Integer Maxim,const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") IndexAndMinMax;
		Standard_Address IndexAndMinMax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Plan;
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
		%feature("autodoc", "Args:
	nbNod(Standard_Integer)
	nbTri(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_PolyInternalData;
		 HLRAlgo_PolyInternalData (const Standard_Integer nbNod,const Standard_Integer nbTri);
		%feature("autodoc", "Args:
	TData(Standard_Address)
	PISeg(Standard_Address)
	PINod(Standard_Address)

Returns:
	None

No detailed docstring for this function.") UpdateLinks;
		void UpdateLinks (Standard_Address & TData,Standard_Address & PISeg,Standard_Address & PINod);
		%feature("autodoc", "Args:
	Nod1RValues(Standard_Address)
	Nod2RValues(Standard_Address)
	PINod1(Standard_Address)
	PINod2(Standard_Address)
	coef1(Standard_Real)
	X3(Standard_Real)
	Y3(Standard_Real)
	Z3(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") AddNode;
		Standard_Integer AddNode (const Standard_Address Nod1RValues,const Standard_Address Nod2RValues,Standard_Address & PINod1,Standard_Address & PINod2,const Standard_Real coef1,const Standard_Real X3,const Standard_Real Y3,const Standard_Real Z3);
		%feature("autodoc", "Args:
	ip1(Standard_Integer)
	ip2(Standard_Integer)
	ip3(Standard_Integer)
	TData1(Standard_Address)
	TData2(Standard_Address)
	PISeg1(Standard_Address)
	PISeg2(Standard_Address)
	PINod1(Standard_Address)
	PINod2(Standard_Address)

Returns:
	None

No detailed docstring for this function.") UpdateLinks;
		void UpdateLinks (const Standard_Integer ip1,const Standard_Integer ip2,const Standard_Integer ip3,Standard_Address & TData1,Standard_Address & TData2,Standard_Address & PISeg1,Standard_Address & PISeg2,Standard_Address & PINod1,Standard_Address & PINod2);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	TData1(Standard_Address)
	TData2(Standard_Address)

Returns:
	None

No detailed docstring for this function.") IncTData;
		void IncTData (Standard_Address & TData1,Standard_Address & TData2);
		%feature("autodoc", "Args:
	PISeg1(Standard_Address)
	PISeg2(Standard_Address)

Returns:
	None

No detailed docstring for this function.") IncPISeg;
		void IncPISeg (Standard_Address & PISeg1,Standard_Address & PISeg2);
		%feature("autodoc", "Args:
	PINod1(Standard_Address)
	PINod2(Standard_Address)

Returns:
	None

No detailed docstring for this function.") IncPINod;
		void IncPINod (Standard_Address & PINod1,Standard_Address & PINod2);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") DecTData;
		void DecTData ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") DecPISeg;
		void DecPISeg ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") DecPINod;
		void DecPINod ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbTData;
		Standard_Integer NbTData ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPISeg;
		Standard_Integer NbPISeg ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPINod;
		Standard_Integer NbPINod ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Planar;
		Standard_Boolean Planar ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Planar;
		void Planar (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IntOutL;
		Standard_Boolean IntOutL ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") IntOutL;
		void IntOutL (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfTData

No detailed docstring for this function.") TData;
		HLRAlgo_Array1OfTData & TData ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfPISeg

No detailed docstring for this function.") PISeg;
		HLRAlgo_Array1OfPISeg & PISeg ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Array1OfPINod

No detailed docstring for this function.") PINod;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_PolyInternalNode;
		 HLRAlgo_PolyInternalNode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Indices;
		Standard_Address Indices ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") RValues;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_PolyInternalSegment;
		 HLRAlgo_PolyInternalSegment ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Indices;
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
		%feature("autodoc", "Args:
	nbFace(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRAlgo_PolyShellData;
		 HLRAlgo_PolyShellData (const Standard_Integer nbFace);
		%feature("autodoc", "Args:
	TotMinMax(Standard_Address)

Returns:
	None

No detailed docstring for this function.") UpdateGlobalMinMax;
		void UpdateGlobalMinMax (const Standard_Address TotMinMax);
		%feature("autodoc", "Args:
	nbHiding(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") UpdateHiding;
		void UpdateHiding (const Standard_Integer nbHiding);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Hiding;
		Standard_Boolean Hiding ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfTransient

No detailed docstring for this function.") PolyData;
		TColStd_Array1OfTransient & PolyData ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfTransient

No detailed docstring for this function.") HidingPolyData;
		TColStd_Array1OfTransient & HidingPolyData ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_ListOfBPoint

No detailed docstring for this function.") Edges;
		HLRAlgo_ListOfBPoint & Edges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Indices;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_Projector;
		 HLRAlgo_Projector ();
		%feature("autodoc", "Args:
	CS(gp_Ax2)

Returns:
	None

Creates   an axonometric  projector.   <CS> is the  
         viewing coordinate system.") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Ax2 & CS);
		%feature("autodoc", "Args:
	CS(gp_Ax2)
	Focus(Standard_Real)

Returns:
	None

Creates  a  perspective  projector.   <CS>  is the  
         viewing coordinate system.") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Ax2 & CS,const Standard_Real Focus);
		%feature("autodoc", "Args:
	T(gp_Trsf)
	Persp(Standard_Boolean)
	Focus(Standard_Real)

Returns:
	None

build a Projector with automatic minmax directions.") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("autodoc", "Args:
	T(gp_Trsf)
	Persp(Standard_Boolean)
	Focus(Standard_Real)
	v1(gp_Vec2d)
	v2(gp_Vec2d)
	v3(gp_Vec2d)

Returns:
	None

build a Projector with given minmax directions.") HLRAlgo_Projector;
		 HLRAlgo_Projector (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus,const gp_Vec2d & v1,const gp_Vec2d & v2,const gp_Vec2d & v3);
		%feature("autodoc", "Args:
	T(gp_Trsf)
	Persp(Standard_Boolean)
	Focus(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("autodoc", "Args:
	D1(gp_Vec2d)
	D2(gp_Vec2d)
	D3(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Directions;
		void Directions (gp_Vec2d & D1,gp_Vec2d & D2,gp_Vec2d & D3);
		%feature("autodoc", "Args:
	On(Standard_Boolean)=Standard_False

Returns:
	None

to compute with the given scale and translation.") Scaled;
		void Scaled (const Standard_Boolean On = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is a perspective transformation.") Perspective;
		Standard_Boolean Perspective ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns the active transformation.") Transformation;
		const gp_Trsf & Transformation ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns the active inverted transformation.") InvertedTransformation;
		const gp_Trsf & InvertedTransformation ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns the original transformation.") FullTransformation;
		const gp_Trsf & FullTransformation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the focal length.") Focus;
		Standard_Real Focus ();
		%feature("autodoc", "Args:
	D(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (gp_Vec & D);
		%feature("autodoc", "Args:
	Pnt(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (gp_Pnt & Pnt);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Pout(gp_Pnt2d)

Returns:
	None

Transform and apply perspective if needed.") Project;
		void Project (const gp_Pnt & P,gp_Pnt2d & Pout);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Transform and apply perspective if needed.") Project;
		void Project (const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	D1(gp_Vec)
	Pout(gp_Pnt2d)
	D1out(gp_Vec2d)

Returns:
	None

Transform and apply perspective if needed.") Project;
		void Project (const gp_Pnt & P,const gp_Vec & D1,gp_Pnt2d & Pout,gp_Vec2d & D1out);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	gp_Lin

return a line going through the eye towards the  
         2d point <X,Y>.") Shoot;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRAlgo_TriangleData;
		 HLRAlgo_TriangleData ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Indices;
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
		%feature("autodoc", "Args:
	NbWires(Standard_Integer)

Returns:
	None

Create a Block of Blocks.") HLRAlgo_WiresBlock;
		 HLRAlgo_WiresBlock (const Standard_Integer NbWires);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbWires;
		Standard_Integer NbWires ();
		%feature("autodoc", "Args:
	I(Standard_Integer)
	W(Handle_HLRAlgo_EdgesBlock)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Integer I,const Handle_HLRAlgo_EdgesBlock & W);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_HLRAlgo_EdgesBlock

No detailed docstring for this function.") Wire;
		Handle_HLRAlgo_EdgesBlock & Wire (const Standard_Integer I);
		%feature("autodoc", "Args:
	TotMinMax(Standard_Address)

Returns:
	None

No detailed docstring for this function.") UpdateMinMax;
		void UpdateMinMax (const Standard_Address TotMinMax);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") MinMax;
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

