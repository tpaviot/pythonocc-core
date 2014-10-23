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
%module (package="OCC") Extrema

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

%include Extrema_headers.i

/* typedefs */
typedef NCollection_UBTree <Standard_Integer , Bnd_Sphere> Extrema_UBTreeOfSphere;
typedef NCollection_UBTreeFiller <Standard_Integer , Bnd_Sphere> Extrema_UBTreeFillerOfSphere;
typedef NCollection_Handle <Extrema_UBTreeOfSphere> Extrema_HUBTreeOfSphere;
/* end typedefs declaration */

/* public enums */
enum Extrema_ElementType {
	Extrema_Node = 0,
	Extrema_UIsoEdge = 1,
	Extrema_VIsoEdge = 2,
	Extrema_Face = 3,
};

enum Extrema_ExtAlgo {
	Extrema_ExtAlgo_Grad = 0,
	Extrema_ExtAlgo_Tree = 1,
};

enum Extrema_ExtFlag {
	Extrema_ExtFlag_MIN = 0,
	Extrema_ExtFlag_MAX = 1,
	Extrema_ExtFlag_MINMAX = 2,
};

/* end public enums declaration */

%nodefaultctor Extrema_Array1OfPOnCurv;
class Extrema_Array1OfPOnCurv {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Extrema_Array1OfPOnCurv;
		 Extrema_Array1OfPOnCurv (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnCurv &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Extrema_Array1OfPOnCurv;
		 Extrema_Array1OfPOnCurv (const Extrema_POnCurv & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array1OfPOnCurv &
	:rtype: Extrema_Array1OfPOnCurv
") Assign;
		const Extrema_Array1OfPOnCurv & Assign (const Extrema_Array1OfPOnCurv & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array1OfPOnCurv &
	:rtype: Extrema_Array1OfPOnCurv
") operator=;
		const Extrema_Array1OfPOnCurv & operator = (const Extrema_Array1OfPOnCurv & Other);
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
	:type Value: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Extrema_Array1OfPOnCurv::~Extrema_Array1OfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array1OfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array1OfPOnCurv2d;
class Extrema_Array1OfPOnCurv2d {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Extrema_Array1OfPOnCurv2d;
		 Extrema_Array1OfPOnCurv2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnCurv2d &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Extrema_Array1OfPOnCurv2d;
		 Extrema_Array1OfPOnCurv2d (const Extrema_POnCurv2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv2d & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array1OfPOnCurv2d &
	:rtype: Extrema_Array1OfPOnCurv2d
") Assign;
		const Extrema_Array1OfPOnCurv2d & Assign (const Extrema_Array1OfPOnCurv2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array1OfPOnCurv2d &
	:rtype: Extrema_Array1OfPOnCurv2d
") operator=;
		const Extrema_Array1OfPOnCurv2d & operator = (const Extrema_Array1OfPOnCurv2d & Other);
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
	:type Value: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Extrema_Array1OfPOnCurv2d::~Extrema_Array1OfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array1OfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array1OfPOnSurf;
class Extrema_Array1OfPOnSurf {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Extrema_Array1OfPOnSurf;
		 Extrema_Array1OfPOnSurf (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnSurf &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Extrema_Array1OfPOnSurf;
		 Extrema_Array1OfPOnSurf (const Extrema_POnSurf & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurf & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array1OfPOnSurf &
	:rtype: Extrema_Array1OfPOnSurf
") Assign;
		const Extrema_Array1OfPOnSurf & Assign (const Extrema_Array1OfPOnSurf & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array1OfPOnSurf &
	:rtype: Extrema_Array1OfPOnSurf
") operator=;
		const Extrema_Array1OfPOnSurf & operator = (const Extrema_Array1OfPOnSurf & Other);
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
	:type Value: Extrema_POnSurf &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnSurf & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnSurf
") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnSurf
") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Extrema_Array1OfPOnSurf::~Extrema_Array1OfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array1OfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array2OfPOnCurv;
class Extrema_Array2OfPOnCurv {
	public:
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_Array2OfPOnCurv;
		 Extrema_Array2OfPOnCurv (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnCurv &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_Array2OfPOnCurv;
		 Extrema_Array2OfPOnCurv (const Extrema_POnCurv & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnCurv &
	:rtype: Extrema_Array2OfPOnCurv
") Assign;
		const Extrema_Array2OfPOnCurv & Assign (const Extrema_Array2OfPOnCurv & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnCurv &
	:rtype: Extrema_Array2OfPOnCurv
") operator=;
		const Extrema_Array2OfPOnCurv & operator = (const Extrema_Array2OfPOnCurv & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") Extrema_Array2OfPOnCurv::~Extrema_Array2OfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array2OfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array2OfPOnCurv2d;
class Extrema_Array2OfPOnCurv2d {
	public:
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_Array2OfPOnCurv2d;
		 Extrema_Array2OfPOnCurv2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnCurv2d &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_Array2OfPOnCurv2d;
		 Extrema_Array2OfPOnCurv2d (const Extrema_POnCurv2d & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv2d & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnCurv2d &
	:rtype: Extrema_Array2OfPOnCurv2d
") Assign;
		const Extrema_Array2OfPOnCurv2d & Assign (const Extrema_Array2OfPOnCurv2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnCurv2d &
	:rtype: Extrema_Array2OfPOnCurv2d
") operator=;
		const Extrema_Array2OfPOnCurv2d & operator = (const Extrema_Array2OfPOnCurv2d & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv2d & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") Extrema_Array2OfPOnCurv2d::~Extrema_Array2OfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array2OfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array2OfPOnSurf;
class Extrema_Array2OfPOnSurf {
	public:
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_Array2OfPOnSurf;
		 Extrema_Array2OfPOnSurf (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnSurf &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_Array2OfPOnSurf;
		 Extrema_Array2OfPOnSurf (const Extrema_POnSurf & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurf & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnSurf &
	:rtype: Extrema_Array2OfPOnSurf
") Assign;
		const Extrema_Array2OfPOnSurf & Assign (const Extrema_Array2OfPOnSurf & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnSurf &
	:rtype: Extrema_Array2OfPOnSurf
") operator=;
		const Extrema_Array2OfPOnSurf & operator = (const Extrema_Array2OfPOnSurf & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Extrema_POnSurf &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurf & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnSurf
") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnSurf
") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") Extrema_Array2OfPOnSurf::~Extrema_Array2OfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array2OfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array2OfPOnSurfParams;
class Extrema_Array2OfPOnSurfParams {
	public:
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_Array2OfPOnSurfParams;
		 Extrema_Array2OfPOnSurfParams (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnSurfParams &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_Array2OfPOnSurfParams;
		 Extrema_Array2OfPOnSurfParams (const Extrema_POnSurfParams & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurfParams &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurfParams & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnSurfParams &
	:rtype: Extrema_Array2OfPOnSurfParams
") Assign;
		const Extrema_Array2OfPOnSurfParams & Assign (const Extrema_Array2OfPOnSurfParams & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnSurfParams &
	:rtype: Extrema_Array2OfPOnSurfParams
") operator=;
		const Extrema_Array2OfPOnSurfParams & operator = (const Extrema_Array2OfPOnSurfParams & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Extrema_POnSurfParams &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurfParams & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnSurfParams
") Value;
		const Extrema_POnSurfParams & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnSurfParams
") ChangeValue;
		Extrema_POnSurfParams & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") Extrema_Array2OfPOnSurfParams::~Extrema_Array2OfPOnSurfParams %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array2OfPOnSurfParams {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCFOfECC2dOfExtCC2d;
class Extrema_CCFOfECC2dOfExtCC2d : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCFOfECC2dOfExtCC2d;
		 Extrema_CCFOfECC2dOfExtCC2d (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCFOfECC2dOfExtCC2d;
		 Extrema_CCFOfECC2dOfExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor2d_Curve2d & C1);
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: math_Vector &
	:param theUlast:
	:type theUlast: math_Vector &
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCFOfECC2dOfExtCC2d::~Extrema_CCFOfECC2dOfExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCFOfECC2dOfExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCFOfECCOfExtCC;
class Extrema_CCFOfECCOfExtCC : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCFOfECCOfExtCC;
		 Extrema_CCFOfECCOfExtCC (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCFOfECCOfExtCC;
		 Extrema_CCFOfECCOfExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param C1:
	:type C1: Adaptor3d_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C1);
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: math_Vector &
	:param theUlast:
	:type theUlast: math_Vector &
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCFOfECCOfExtCC::~Extrema_CCFOfECCOfExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCFOfECCOfExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCFOfELCC2dOfLocateExtCC2d;
class Extrema_CCFOfELCC2dOfLocateExtCC2d : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCFOfELCC2dOfLocateExtCC2d;
		 Extrema_CCFOfELCC2dOfLocateExtCC2d (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCFOfELCC2dOfLocateExtCC2d;
		 Extrema_CCFOfELCC2dOfLocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor2d_Curve2d & C1);
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: math_Vector &
	:param theUlast:
	:type theUlast: math_Vector &
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCFOfELCC2dOfLocateExtCC2d::~Extrema_CCFOfELCC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCFOfELCC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCFOfELCCOfLocateExtCC;
class Extrema_CCFOfELCCOfLocateExtCC : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCFOfELCCOfLocateExtCC;
		 Extrema_CCFOfELCCOfLocateExtCC (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCFOfELCCOfLocateExtCC;
		 Extrema_CCFOfELCCOfLocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param C1:
	:type C1: Adaptor3d_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C1);
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: math_Vector &
	:param theUlast:
	:type theUlast: math_Vector &
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCFOfELCCOfLocateExtCC::~Extrema_CCFOfELCCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCFOfELCCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCLocFOfLocECC2dOfLocateExtCC2d;
class Extrema_CCLocFOfLocECC2dOfLocateExtCC2d : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECC2dOfLocateExtCC2d;
		 Extrema_CCLocFOfLocECC2dOfLocateExtCC2d (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECC2dOfLocateExtCC2d;
		 Extrema_CCLocFOfLocECC2dOfLocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor2d_Curve2d & C1);
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: math_Vector &
	:param theUlast:
	:type theUlast: math_Vector &
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCLocFOfLocECC2dOfLocateExtCC2d::~Extrema_CCLocFOfLocECC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCLocFOfLocECC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCLocFOfLocECCOfLocateExtCC;
class Extrema_CCLocFOfLocECCOfLocateExtCC : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECCOfLocateExtCC;
		 Extrema_CCLocFOfLocECCOfLocateExtCC (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECCOfLocateExtCC;
		 Extrema_CCLocFOfLocECCOfLocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param C1:
	:type C1: Adaptor3d_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C1);
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: math_Vector &
	:param theUlast:
	:type theUlast: math_Vector &
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCLocFOfLocECCOfLocateExtCC::~Extrema_CCLocFOfLocECCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCLocFOfLocECCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCache2dOfExtCC2d;
class Extrema_CCache2dOfExtCC2d : public Standard_Transient {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_CCache2dOfExtCC2d;
		 Extrema_CCache2dOfExtCC2d ();
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor2d_Curve2d &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") Extrema_CCache2dOfExtCC2d;
		 Extrema_CCache2dOfExtCC2d (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor2d_Curve2d &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param IntervalsCN:
	:type IntervalsCN: TColStd_Array1OfReal &
	:param StartIndex:
	:type StartIndex: Standard_Integer
	:param EndIndex:
	:type EndIndex: Standard_Integer
	:param Coeff:
	:type Coeff: float
	:rtype: None
") Extrema_CCache2dOfExtCC2d;
		 Extrema_CCache2dOfExtCC2d (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const TColStd_Array1OfReal & IntervalsCN,const Standard_Integer StartIndex,const Standard_Integer EndIndex,const Standard_Real Coeff);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor2d_Curve2d &
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetCurve;
		void SetCurve (const Adaptor2d_Curve2d & theC,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor2d_Curve2d &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetCurve;
		void SetCurve (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real Uinf,const Standard_Real Usup,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:rtype: None
") CalculatePoints;
		void CalculatePoints ();
		%feature("autodoc", "	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Parameters;
		const Handle_TColStd_HArray1OfReal & Parameters ();
		%feature("autodoc", "	:rtype: Handle_TColgp_HArray1OfPnt2d
") Points;
		const Handle_TColgp_HArray1OfPnt2d & Points ();
		%feature("autodoc", "	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr ();
		%feature("autodoc", "	:rtype: int
") NbSamples;
		Standard_Integer NbSamples ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: float
") TrimFirstParameter;
		Standard_Real TrimFirstParameter ();
		%feature("autodoc", "	:rtype: float
") TrimLastParameter;
		Standard_Real TrimLastParameter ();
};


%feature("shadow") Extrema_CCache2dOfExtCC2d::~Extrema_CCache2dOfExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCache2dOfExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_CCache2dOfExtCC2d {
	Handle_Extrema_CCache2dOfExtCC2d GetHandle() {
	return *(Handle_Extrema_CCache2dOfExtCC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_CCache2dOfExtCC2d;
class Handle_Extrema_CCache2dOfExtCC2d : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Extrema_CCache2dOfExtCC2d();
        Handle_Extrema_CCache2dOfExtCC2d(const Handle_Extrema_CCache2dOfExtCC2d &aHandle);
        Handle_Extrema_CCache2dOfExtCC2d(const Extrema_CCache2dOfExtCC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_CCache2dOfExtCC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_CCache2dOfExtCC2d {
    Extrema_CCache2dOfExtCC2d* GetObject() {
    return (Extrema_CCache2dOfExtCC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_CCache2dOfExtCC2d::~Handle_Extrema_CCache2dOfExtCC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_CCache2dOfExtCC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_CCacheOfExtCC;
class Extrema_CCacheOfExtCC : public Standard_Transient {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_CCacheOfExtCC;
		 Extrema_CCacheOfExtCC ();
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor3d_Curve &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") Extrema_CCacheOfExtCC;
		 Extrema_CCacheOfExtCC (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor3d_Curve &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param IntervalsCN:
	:type IntervalsCN: TColStd_Array1OfReal &
	:param StartIndex:
	:type StartIndex: Standard_Integer
	:param EndIndex:
	:type EndIndex: Standard_Integer
	:param Coeff:
	:type Coeff: float
	:rtype: None
") Extrema_CCacheOfExtCC;
		 Extrema_CCacheOfExtCC (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const TColStd_Array1OfReal & IntervalsCN,const Standard_Integer StartIndex,const Standard_Integer EndIndex,const Standard_Real Coeff);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor3d_Curve &
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetCurve;
		void SetCurve (const Adaptor3d_Curve & theC,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor3d_Curve &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetCurve;
		void SetCurve (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real Uinf,const Standard_Real Usup,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:rtype: None
") CalculatePoints;
		void CalculatePoints ();
		%feature("autodoc", "	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Parameters;
		const Handle_TColStd_HArray1OfReal & Parameters ();
		%feature("autodoc", "	:rtype: Handle_TColgp_HArray1OfPnt
") Points;
		const Handle_TColgp_HArray1OfPnt & Points ();
		%feature("autodoc", "	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr ();
		%feature("autodoc", "	:rtype: int
") NbSamples;
		Standard_Integer NbSamples ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: float
") TrimFirstParameter;
		Standard_Real TrimFirstParameter ();
		%feature("autodoc", "	:rtype: float
") TrimLastParameter;
		Standard_Real TrimLastParameter ();
};


%feature("shadow") Extrema_CCacheOfExtCC::~Extrema_CCacheOfExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCacheOfExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_CCacheOfExtCC {
	Handle_Extrema_CCacheOfExtCC GetHandle() {
	return *(Handle_Extrema_CCacheOfExtCC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_CCacheOfExtCC;
class Handle_Extrema_CCacheOfExtCC : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Extrema_CCacheOfExtCC();
        Handle_Extrema_CCacheOfExtCC(const Handle_Extrema_CCacheOfExtCC &aHandle);
        Handle_Extrema_CCacheOfExtCC(const Extrema_CCacheOfExtCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_CCacheOfExtCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_CCacheOfExtCC {
    Extrema_CCacheOfExtCC* GetObject() {
    return (Extrema_CCacheOfExtCC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_CCacheOfExtCC::~Handle_Extrema_CCacheOfExtCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_CCacheOfExtCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_Curve2dTool;
class Extrema_Curve2dTool {
	public:
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Adaptor2d_Curve2d & C,const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const Adaptor2d_Curve2d & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") Period;
		static Standard_Real Period (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Adaptor2d_Curve2d & C,const Standard_Real U);
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") D0;
		static void D0 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") D3;
		static void D3 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Adaptor2d_Curve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	* Returns the parametric resolution corresponding  to the real space resolution <R3d>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Adaptor2d_Curve2d & C,const Standard_Real R3d);
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") Degree;
		static Standard_Integer Degree (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: bool
") IsRational;
		static Standard_Boolean IsRational (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") NbPoles;
		static Standard_Integer NbPoles (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") NbKnots;
		static Standard_Integer NbKnots (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Adaptor2d_Curve2d & C);
};


%feature("shadow") Extrema_Curve2dTool::~Extrema_Curve2dTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Curve2dTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CurveTool;
class Extrema_CurveTool {
	public:
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Adaptor3d_Curve & C);
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (Adaptor3d_Curve & C,const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.  The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param C:
	:type C: Adaptor3d_Curve &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (Adaptor3d_Curve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float
") Period;
		static Standard_Real Period (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Adaptor3d_Curve & C,const Standard_Real R3d);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Adaptor3d_Curve & C,const Standard_Real U);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Adaptor3d_Curve & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Lin
") Line;
		static gp_Lin Line (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Circ
") Circle;
		static gp_Circ Circle (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Elips
") Ellipse;
		static gp_Elips Ellipse (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Parab
") Parabola;
		static gp_Parab Parabola (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: int
") Degree;
		static Standard_Integer Degree (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: bool
") IsRational;
		static Standard_Boolean IsRational (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: int
") NbPoles;
		static Standard_Integer NbPoles (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: int
") NbKnots;
		static Standard_Integer NbKnots (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: Handle_Geom_BezierCurve
") Bezier;
		static Handle_Geom_BezierCurve Bezier (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const Adaptor3d_Curve & C);
};


%feature("shadow") Extrema_CurveTool::~Extrema_CurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ECC2dOfExtCC2d;
class Extrema_ECC2dOfExtCC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ECC2dOfExtCC2d;
		 Extrema_ECC2dOfExtCC2d ();
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ECC2dOfExtCC2d;
		 Extrema_ECC2dOfExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ECC2dOfExtCC2d;
		 Extrema_ECC2dOfExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param theCache:
	:type theCache: Handle_Extrema_CCache2dOfExtCC2d &
	:rtype: None
") SetCurveCache;
		void SetCurveCache (const Standard_Integer theRank,const Handle_Extrema_CCache2dOfExtCC2d & theCache);
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N: default value is 1
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%feature("shadow") Extrema_ECC2dOfExtCC2d::~Extrema_ECC2dOfExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ECC2dOfExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ECCOfExtCC;
class Extrema_ECCOfExtCC {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ECCOfExtCC;
		 Extrema_ECCOfExtCC ();
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ECCOfExtCC;
		 Extrema_ECCOfExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ECCOfExtCC;
		 Extrema_ECCOfExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param theCache:
	:type theCache: Handle_Extrema_CCacheOfExtCC &
	:rtype: None
") SetCurveCache;
		void SetCurveCache (const Standard_Integer theRank,const Handle_Extrema_CCacheOfExtCC & theCache);
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N: default value is 1
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%feature("shadow") Extrema_ECCOfExtCC::~Extrema_ECCOfExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ECCOfExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ELCC2dOfLocateExtCC2d;
class Extrema_ELCC2dOfLocateExtCC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ELCC2dOfLocateExtCC2d;
		 Extrema_ELCC2dOfLocateExtCC2d ();
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ELCC2dOfLocateExtCC2d;
		 Extrema_ELCC2dOfLocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ELCC2dOfLocateExtCC2d;
		 Extrema_ELCC2dOfLocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param theCache:
	:type theCache: Handle_Extrema_LCCache2dOfLocateExtCC2d &
	:rtype: None
") SetCurveCache;
		void SetCurveCache (const Standard_Integer theRank,const Handle_Extrema_LCCache2dOfLocateExtCC2d & theCache);
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N: default value is 1
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%feature("shadow") Extrema_ELCC2dOfLocateExtCC2d::~Extrema_ELCC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ELCC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ELCCOfLocateExtCC;
class Extrema_ELCCOfLocateExtCC {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ELCCOfLocateExtCC;
		 Extrema_ELCCOfLocateExtCC ();
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ELCCOfLocateExtCC;
		 Extrema_ELCCOfLocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ELCCOfLocateExtCC;
		 Extrema_ELCCOfLocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param theCache:
	:type theCache: Handle_Extrema_LCCacheOfLocateExtCC &
	:rtype: None
") SetCurveCache;
		void SetCurveCache (const Standard_Integer theRank,const Handle_Extrema_LCCacheOfLocateExtCC & theCache);
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N: default value is 1
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%feature("shadow") Extrema_ELCCOfLocateExtCC::~Extrema_ELCCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ELCCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ELPCOfLocateExtPC;
class Extrema_ELPCOfLocateExtPC {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("autodoc", "	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P1,gp_Pnt & P2);
};


%feature("shadow") Extrema_ELPCOfLocateExtPC::~Extrema_ELPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ELPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ELPCOfLocateExtPC2d;
class Extrema_ELPCOfLocateExtPC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P1,gp_Pnt2d & P2);
};


%feature("shadow") Extrema_ELPCOfLocateExtPC2d::~Extrema_ELPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ELPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_EPCOfELPCOfLocateExtPC;
class Extrema_EPCOfELPCOfLocateExtPC {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_EPCOfELPCOfLocateExtPC::~Extrema_EPCOfELPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_EPCOfELPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_EPCOfELPCOfLocateExtPC2d;
class Extrema_EPCOfELPCOfLocateExtPC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_EPCOfELPCOfLocateExtPC2d::~Extrema_EPCOfELPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_EPCOfELPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_EPCOfExtPC;
class Extrema_EPCOfExtPC {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_EPCOfExtPC::~Extrema_EPCOfExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_EPCOfExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_EPCOfExtPC2d;
class Extrema_EPCOfExtPC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param NbU:
	:type NbU: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_EPCOfExtPC2d::~Extrema_EPCOfExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_EPCOfExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtCC;
class Extrema_ExtCC {
	public:
		%feature("autodoc", "	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC;
		 Extrema_ExtCC (const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC;
		 Extrema_ExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC;
		 Extrema_ExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") SetRange;
		void SetRange (const Standard_Integer theRank,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param theRank:
	:type theRank: Standard_Integer
	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Integer theRank,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "	:param N: default value is 1
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("autodoc", "	:param dist11:
	:type dist11: float &
	:param distP12:
	:type distP12: float &
	:param distP21:
	:type distP21: float &
	:param distP22:
	:type distP22: float &
	:param P11:
	:type P11: gp_Pnt
	:param P12:
	:type P12: gp_Pnt
	:param P21:
	:type P21: gp_Pnt
	:param P22:
	:type P22: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P11,gp_Pnt & P12,gp_Pnt & P21,gp_Pnt & P22);
};


%feature("shadow") Extrema_ExtCC::~Extrema_ExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtCC2d;
class Extrema_ExtCC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d ();
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "	:param N: default value is 1
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("autodoc", "	:param dist11:
	:type dist11: float &
	:param distP12:
	:type distP12: float &
	:param distP21:
	:type distP21: float &
	:param distP22:
	:type distP22: float &
	:param P11:
	:type P11: gp_Pnt2d
	:param P12:
	:type P12: gp_Pnt2d
	:param P21:
	:type P21: gp_Pnt2d
	:param P22:
	:type P22: gp_Pnt2d
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P11,gp_Pnt2d & P12,gp_Pnt2d & P21,gp_Pnt2d & P22);
};


%feature("shadow") Extrema_ExtCC2d::~Extrema_ExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtCS;
class Extrema_ExtCS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtCS;
		 Extrema_ExtCS ();
		%feature("autodoc", "	* It calculates all the distances between C and S.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param TolC:
	:type TolC: float
	:param TolS:
	:type TolS: float
	:rtype: None
") Extrema_ExtCS;
		 Extrema_ExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real TolC,const Standard_Real TolS);
		%feature("autodoc", "	* It calculates all the distances between C and S. UCinf and UCmax are the start and end parameters of the curve.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param UCinf:
	:type UCinf: float
	:param UCsup:
	:type UCsup: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolC:
	:type TolC: float
	:param TolS:
	:type TolS: float
	:rtype: None
") Extrema_ExtCS;
		 Extrema_ExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real UCinf,const Standard_Real UCsup,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolC,const Standard_Real TolS);
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S:
	:type S: Adaptor3d_Surface &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolC:
	:type TolC: float
	:param TolS:
	:type TolS: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolC,const Standard_Real TolS);
		%feature("autodoc", "	* Computes the distances. An exception is raised if the fieds have not been initialized.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns True if the curve is on a parallel surface.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnSurf & P2);
};


%feature("shadow") Extrema_ExtCS::~Extrema_ExtCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtElC;
class Extrema_ExtElC {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC ();
		%feature("autodoc", "	* Calculates the distance between two lines. AngTol is used to test if the lines are parallel: Angle(C1,C2) < AngTol.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Lin
	:param AngTol:
	:type AngTol: float
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Lin & C2,const Standard_Real AngTol);
		%feature("autodoc", "	* Calculates the distance between a line and a circle.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Circ
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Circ & C2,const Standard_Real Tol);
		%feature("autodoc", "	* Calculates the distance between a line and an elipse.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Elips
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Elips & C2);
		%feature("autodoc", "	* Calculates the distance between a line and a hyperbola.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Hypr
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Hypr & C2);
		%feature("autodoc", "	* Calculates the distance between a line and a parabola.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Parab & C2);
		%feature("autodoc", "	* Calculates the distance between two circles. The circles can be parallel or identical.

	:param C1:
	:type C1: gp_Circ
	:param C2:
	:type C2: gp_Circ
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Circ & C2);
		%feature("autodoc", "	* Calculates the distance between a circle and an elipse.

	:param C1:
	:type C1: gp_Circ
	:param C2:
	:type C2: gp_Elips
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Elips & C2);
		%feature("autodoc", "	* Calculates the distance between a circle and a hyperbola.

	:param C1:
	:type C1: gp_Circ
	:param C2:
	:type C2: gp_Hypr
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Hypr & C2);
		%feature("autodoc", "	* Calculates the distance between a circle and a parabola.

	:param C1:
	:type C1: gp_Circ
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Parab & C2);
		%feature("autodoc", "	* Calculates the distance between two elipses. The elipses can be parallel or identical.

	:param C1:
	:type C1: gp_Elips
	:param C2:
	:type C2: gp_Elips
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Elips & C1,const gp_Elips & C2);
		%feature("autodoc", "	* Calculates the distance between an elipse and a hyperbola.

	:param C1:
	:type C1: gp_Elips
	:param C2:
	:type C2: gp_Hypr
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Elips & C1,const gp_Hypr & C2);
		%feature("autodoc", "	* Calculates the distance between an elipse and a parabola.

	:param C1:
	:type C1: gp_Elips
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Elips & C1,const gp_Parab & C2);
		%feature("autodoc", "	* Calculates the distance between two hyperbolas. The hyperbolas can be parallel or identical.

	:param C1:
	:type C1: gp_Hypr
	:param C2:
	:type C2: gp_Hypr
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Hypr & C1,const gp_Hypr & C2);
		%feature("autodoc", "	* Calculates the distance between a hyperbola and a parabola.

	:param C1:
	:type C1: gp_Hypr
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Hypr & C1,const gp_Parab & C2);
		%feature("autodoc", "	* Calculates the distance between two parabolas The parabolas can be parallel or identical.

	:param C1:
	:type C1: gp_Parab
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Parab & C1,const gp_Parab & C2);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns True if the two curves are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%feature("shadow") Extrema_ExtElC::~Extrema_ExtElC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtElC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtElC2d;
class Extrema_ExtElC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d ();
		%feature("autodoc", "	* Calculates the distance between two lines. AngTol is used to test if the lines are parallel: Angle(C1,C2) < AngTol.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Lin2d
	:param AngTol:
	:type AngTol: float
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Lin2d & C2,const Standard_Real AngTol);
		%feature("autodoc", "	* Calculates the distance between a line and a circle.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Circ2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Circ2d & C2,const Standard_Real Tol);
		%feature("autodoc", "	* Calculates the distance between a line and an elipse.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Elips2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Elips2d & C2);
		%feature("autodoc", "	* Calculates the distance between a line and a hyperbola.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Hypr2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Hypr2d & C2);
		%feature("autodoc", "	* Calculates the distance between a line and a parabola.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Parab2d & C2);
		%feature("autodoc", "	* Calculates the distance between two circles. The circles can be parallel or identical.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Circ2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Circ2d & C2);
		%feature("autodoc", "	* Calculates the distance between a circle and an elipse.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Elips2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Elips2d & C2);
		%feature("autodoc", "	* Calculates the distance between a circle and a hyperbola.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Hypr2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Hypr2d & C2);
		%feature("autodoc", "	* Calculates the distance between a circle and a parabola.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Parab2d & C2);
		%feature("autodoc", "	* Calculates the distance between two elipses. The elipses can be parallel or identical.

	:param C1:
	:type C1: gp_Elips2d
	:param C2:
	:type C2: gp_Elips2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Elips2d & C1,const gp_Elips2d & C2);
		%feature("autodoc", "	* Calculates the distance between an elipse and a hyperbola.

	:param C1:
	:type C1: gp_Elips2d
	:param C2:
	:type C2: gp_Hypr2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Elips2d & C1,const gp_Hypr2d & C2);
		%feature("autodoc", "	* Calculates the distance between an elipse and a parabola.

	:param C1:
	:type C1: gp_Elips2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Elips2d & C1,const gp_Parab2d & C2);
		%feature("autodoc", "	* Calculates the distance between two hyperbolas. The hyperbolas can be parallel or identical.

	:param C1:
	:type C1: gp_Hypr2d
	:param C2:
	:type C2: gp_Hypr2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Hypr2d & C1,const gp_Hypr2d & C2);
		%feature("autodoc", "	* Calculates the distance between a hyperbola and a parabola.

	:param C1:
	:type C1: gp_Hypr2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Hypr2d & C1,const gp_Parab2d & C2);
		%feature("autodoc", "	* Calculates the distance between two parabolas The parabolas can be parallel or identical.

	:param C1:
	:type C1: gp_Parab2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Parab2d & C1,const gp_Parab2d & C2);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns True if the two curves are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%feature("shadow") Extrema_ExtElC2d::~Extrema_ExtElC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtElC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtElCS;
class Extrema_ExtElCS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS ();
		%feature("autodoc", "	* Calculates the distances between a line and a plane. The line can be on the plane or on a parallel plane.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Pln
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Pln & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Pln & S);
		%feature("autodoc", "	* Calculates the distances between a line and a cylinder.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Cylinder & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Cylinder & S);
		%feature("autodoc", "	* Calculates the distances between a line and a cone.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cone
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Cone & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cone
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Cone & S);
		%feature("autodoc", "	* Calculates the distances between a line and a sphere.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Sphere & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Sphere & S);
		%feature("autodoc", "	* Calculates the distances between a line and a torus.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Torus
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Torus & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Torus
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Torus & S);
		%feature("autodoc", "	* Calculates the distances between a circle and a plane.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Pln
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Pln & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Pln & S);
		%feature("autodoc", "	* Calculates the distances between a circle and a cylinder.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Cylinder & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Cylinder & S);
		%feature("autodoc", "	* Calculates the distances between a circle and a cone.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cone
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Cone & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cone
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Cone & S);
		%feature("autodoc", "	* Calculates the distances between a circle and a sphere.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Sphere & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Sphere & S);
		%feature("autodoc", "	* Calculates the distances between a circle and a torus.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Torus
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Torus & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Torus
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Torus & S);
		%feature("autodoc", "	* Calculates the distances between a hyperbola and a plane.

	:param C:
	:type C: gp_Hypr
	:param S:
	:type S: gp_Pln
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Hypr & C,const gp_Pln & S);
		%feature("autodoc", "	:param C:
	:type C: gp_Hypr
	:param S:
	:type S: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Hypr & C,const gp_Pln & S);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns True if the curve is on a parallel surface.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the curve, P2 on the surface.

	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnSurf & P2);
};


%feature("shadow") Extrema_ExtElCS::~Extrema_ExtElCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtElCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtElSS;
class Extrema_ExtElSS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS ();
		%feature("autodoc", "	* Calculates the distances between 2 planes. These planes can be parallel.

	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Pln
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Pln & S1,const gp_Pln & S2);
		%feature("autodoc", "	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Pln & S1,const gp_Pln & S2);
		%feature("autodoc", "	* Calculates the distances between a plane and a sphere.

	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Pln & S1,const gp_Sphere & S2);
		%feature("autodoc", "	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Pln & S1,const gp_Sphere & S2);
		%feature("autodoc", "	* Calculates the distances between 2 spheres. These spheres can be parallel.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Sphere & S2);
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Sphere & S2);
		%feature("autodoc", "	* Calculates the distances between a sphere and a cylinder.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cylinder
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Cylinder & S2);
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cylinder
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Cylinder & S2);
		%feature("autodoc", "	* Calculates the distances between a sphere and a cone.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cone
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Cone & S2);
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cone
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Cone & S2);
		%feature("autodoc", "	* Calculates the distances between a sphere and a torus.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Torus
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Torus & S2);
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Torus
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Torus & S2);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns True if the two surfaces are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "	* Returns the points for the Nth resulting distance. P1 is on the first surface, P2 on the second one.

	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnSurf &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnSurf & P1,Extrema_POnSurf & P2);
};


%feature("shadow") Extrema_ExtElSS::~Extrema_ExtElSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtElSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPC;
class Extrema_ExtPC {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPC;
		 Extrema_ExtPC ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC;
		 Extrema_ExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC;
		 Extrema_ExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("autodoc", "	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P1,gp_Pnt & P2);
};


%feature("shadow") Extrema_ExtPC::~Extrema_ExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPC2d;
class Extrema_ExtPC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P1,gp_Pnt2d & P2);
};


%feature("shadow") Extrema_ExtPC2d::~Extrema_ExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPElC;
class Extrema_ExtPElC {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC ();
		%feature("autodoc", "	* Calculates the extremum distance between the point P and the segment [Uinf,Usup] of the line C.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Lin
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Lin & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Lin
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Lin & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* Calculates the 2 extremum distances between the point P and the segment [Uinf,Usup] of the circle C. Tol is used to determine if P is on the axis of the circle or if an extremum is on an endpoint of the segment. If P is on the axis of the circle, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are:  0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Circ
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Circ & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Circ
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Circ & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the elipse C. Tol is used to determine if the point is on the axis of the elipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. If P is on the axis of the elipse, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are:  0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Elips
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Elips & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Elips
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Elips & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* Calculates the extremum distances between the point P and the segment [Uinf,Usup] of the hyperbola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Hypr
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Hypr & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Hypr
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Hypr & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the parabola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Parab
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Parab & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Parab
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Parab & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns True if the Nth extremum distance is a minimum.

	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth extremum distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_ExtPElC::~Extrema_ExtPElC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPElC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPElC2d;
class Extrema_ExtPElC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d ();
		%feature("autodoc", "	* Calculates the extremum distance between the point P and the segment [Uinf,Usup] of the line L.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Lin2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Lin2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Lin2d & L,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* Calculates the 2 extremum distances between the point P and the segment [Uinf,Usup] of the circle C. Tol is used to determine if P is on the axis of the circle or if an extremum is on an endpoint of the segment. If P is on the axis of the circle, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are:  0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Circ2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Circ2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Circ2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Circ2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the elipse C. Tol is used to determine if the point is on the axis of the elipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. If P is on the axis of the elipse, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are:  0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Elips2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Elips2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Elips2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Elips2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* Calculates the extremum distances between the point P and the segment [Uinf,Usup] of the hyperbola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Hypr2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Hypr2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Hypr2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Hypr2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the parabola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Parab2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Parab2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Parab2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Parab2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns True if the Nth extremum distance is a minimum.

	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth extremum distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_ExtPElC2d::~Extrema_ExtPElC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPElC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPElS;
class Extrema_ExtPElS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS ();
		%feature("autodoc", "	* It calculates all the distances between a point and a cylinder from gp. Tol is used to test if the point is on the axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cylinder
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Cylinder & S,const Standard_Real Tol);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cylinder
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Cylinder & S,const Standard_Real Tol);
		%feature("autodoc", "	* It calculates all the distances between a point and a plane from gp. Tol is used to test if the point is on the plane.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Pln
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Pln & S,const Standard_Real Tol);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Pln
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Pln & S,const Standard_Real Tol);
		%feature("autodoc", "	* It calculates all the distances between a point and a cone from gp. Tol is used to test if the point is at the apex or on the axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Cone & S,const Standard_Real Tol);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Cone & S,const Standard_Real Tol);
		%feature("autodoc", "	* It calculates all the distances between a point and a torus from gp. Tol is used to test if the point is on the axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Torus & S,const Standard_Real Tol);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Torus & S,const Standard_Real Tol);
		%feature("autodoc", "	* It calculates all the distances between a point and a sphere from gp. Tol is used to test if the point is at the center.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Sphere & S,const Standard_Real Tol);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Sphere & S,const Standard_Real Tol);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_ExtPElS::~Extrema_ExtPElS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPElS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPExtS;
class Extrema_ExtPExtS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS ();
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a Surface.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_SurfaceOfLinearExtrusion &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS (const gp_Pnt & P,const Adaptor3d_SurfaceOfLinearExtrusion & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a Surface.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_SurfaceOfLinearExtrusion &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS (const gp_Pnt & P,const Adaptor3d_SurfaceOfLinearExtrusion & S,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S:
	:type S: Adaptor3d_SurfaceOfLinearExtrusion &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_SurfaceOfLinearExtrusion & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_ExtPExtS::~Extrema_ExtPExtS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPExtS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPRevS;
class Extrema_ExtPRevS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS ();
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a SurfacePtr from Adaptor3d.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_SurfaceOfRevolution &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS (const gp_Pnt & P,const Adaptor3d_SurfaceOfRevolution & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a SurfacePtr from Adaptor3d.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_SurfaceOfRevolution &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS (const gp_Pnt & P,const Adaptor3d_SurfaceOfRevolution & S,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_SurfaceOfRevolution &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_SurfaceOfRevolution & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_ExtPRevS::~Extrema_ExtPRevS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPRevS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPS;
class Extrema_ExtPS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPS;
		 Extrema_ExtPS ();
		%feature("autodoc", "	* It calculates all the distances. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_ExtPS;
		 Extrema_ExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "	* It calculates all the distances. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_ExtPS;
		 Extrema_ExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S:
	:type S: Adaptor3d_Surface &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	* Computes the distances. An exception is raised if the fieds have not been initialized.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
		%feature("autodoc", "	* if the surface is a trimmed surface, dUfVf is a square distance between <P> and the point of parameter FirstUParameter and FirstVParameter <PUfVf>. dUfVl is a square distance between <P> and the point of parameter FirstUParameter and LastVParameter <PUfVl>. dUlVf is a square distance between <P> and the point of parameter LastUParameter and FirstVParameter <PUlVf>. dUlVl is a square distance between <P> and the point of parameter LastUParameter and LastVParameter <PUlVl>.

	:param dUfVf:
	:type dUfVf: float &
	:param dUfVl:
	:type dUfVl: float &
	:param dUlVf:
	:type dUlVf: float &
	:param dUlVl:
	:type dUlVl: float &
	:param PUfVf:
	:type PUfVf: gp_Pnt
	:param PUfVl:
	:type PUfVl: gp_Pnt
	:param PUlVf:
	:type PUlVf: gp_Pnt
	:param PUlVl:
	:type PUlVl: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & PUfVf,gp_Pnt & PUfVl,gp_Pnt & PUlVf,gp_Pnt & PUlVl);
		%feature("autodoc", "	:param F:
	:type F: Extrema_ExtFlag
	:rtype: None
") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("autodoc", "	:param A:
	:type A: Extrema_ExtAlgo
	:rtype: None
") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
};


%feature("shadow") Extrema_ExtPS::~Extrema_ExtPS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtSS;
class Extrema_ExtSS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_ExtSS;
		 Extrema_ExtSS ();
		%feature("autodoc", "	* It calculates all the distances between S1 and S2.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param TolS1:
	:type TolS1: float
	:param TolS2:
	:type TolS2: float
	:rtype: None
") Extrema_ExtSS;
		 Extrema_ExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real TolS1,const Standard_Real TolS2);
		%feature("autodoc", "	* It calculates all the distances between S1 and S2.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param Uinf1:
	:type Uinf1: float
	:param Usup1:
	:type Usup1: float
	:param Vinf1:
	:type Vinf1: float
	:param Vsup1:
	:type Vsup1: float
	:param Uinf2:
	:type Uinf2: float
	:param Usup2:
	:type Usup2: float
	:param Vinf2:
	:type Vinf2: float
	:param Vsup2:
	:type Vsup2: float
	:param TolS1:
	:type TolS1: float
	:param TolS2:
	:type TolS2: float
	:rtype: None
") Extrema_ExtSS;
		 Extrema_ExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real Uinf1,const Standard_Real Usup1,const Standard_Real Vinf1,const Standard_Real Vsup1,const Standard_Real Uinf2,const Standard_Real Usup2,const Standard_Real Vinf2,const Standard_Real Vsup2,const Standard_Real TolS1,const Standard_Real TolS2);
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S2:
	:type S2: Adaptor3d_Surface &
	:param Uinf2:
	:type Uinf2: float
	:param Usup2:
	:type Usup2: float
	:param Vinf2:
	:type Vinf2: float
	:param Vsup2:
	:type Vsup2: float
	:param TolS1:
	:type TolS1: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Real Uinf2,const Standard_Real Usup2,const Standard_Real Vinf2,const Standard_Real Vsup2,const Standard_Real TolS1);
		%feature("autodoc", "	* Computes the distances. An exception is raised if the fieds have not been initialized.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param Uinf1:
	:type Uinf1: float
	:param Usup1:
	:type Usup1: float
	:param Vinf1:
	:type Vinf1: float
	:param Vsup1:
	:type Vsup1: float
	:param TolS1:
	:type TolS1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real Uinf1,const Standard_Real Usup1,const Standard_Real Vinf1,const Standard_Real Vsup1,const Standard_Real TolS1);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns True if the curve is on a parallel surface.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:param P1:
	:type P1: Extrema_POnSurf &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnSurf & P1,Extrema_POnSurf & P2);
};


%feature("shadow") Extrema_ExtSS::~Extrema_ExtSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_FuncExtCS;
class Extrema_FuncExtCS : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS ();
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S);
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* Calculation of Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "	* Calculation of Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "	* Calculation of Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the Nth extremum on C.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve (const Standard_Integer N);
		%feature("autodoc", "	* Return the Nth extremum on S.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface (const Standard_Integer N);
};


%feature("shadow") Extrema_FuncExtCS::~Extrema_FuncExtCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_FuncExtCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_FuncExtPS;
class Extrema_FuncExtPS : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_FuncExtPS;
		 Extrema_FuncExtPS ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Extrema_FuncExtPS;
		 Extrema_FuncExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S);
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S);
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* Calculate Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "	* Calculate Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "	* Calculate Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the Nth extremum.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_FuncExtPS::~Extrema_FuncExtPS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_FuncExtPS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_FuncExtSS;
class Extrema_FuncExtSS : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS ();
		%feature("autodoc", "	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:rtype: None
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2);
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* Calculate Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "	* Calculate Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "	* Calculate Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Return the Nth extremum on S1.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1 (const Standard_Integer N);
		%feature("autodoc", "	* Renvoie le Nieme extremum sur S2.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2 (const Standard_Integer N);
};


%feature("shadow") Extrema_FuncExtSS::~Extrema_FuncExtSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_FuncExtSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenExtCS;
class Extrema_GenExtCS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_GenExtCS;
		 Extrema_GenExtCS ();
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surfaces. NbU and NbV are used to locate the close points on the surface and NbT on the curve to find the zeros.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbT:
	:type NbT: Standard_Integer
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtCS;
		 Extrema_GenExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer NbT,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbT,NbU and NbV are used to locate the close points to find the zeros.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbT:
	:type NbT: Standard_Integer
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param tmin:
	:type tmin: float
	:param tsup:
	:type tsup: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtCS;
		 Extrema_GenExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer NbT,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real tmin,const Standard_Real tsup,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol2);
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real Tol2);
		%feature("autodoc", "	* the algorithm is done with S An exception is raised if the fields have not been initialized.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbT:
	:type NbT: Standard_Integer
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Integer NbT,const Standard_Real Tol1);
		%feature("autodoc", "	* the algorithm is done with C An exception is raised if the fields have not been initialized.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbT:
	:type NbT: Standard_Integer
	:param tmin:
	:type tmin: float
	:param tsup:
	:type tsup: float
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Integer NbT,const Standard_Real tmin,const Standard_Real tsup,const Standard_Real Tol1);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface (const Standard_Integer N);
};


%feature("shadow") Extrema_GenExtCS::~Extrema_GenExtCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenExtCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenExtPS;
class Extrema_GenExtPS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_GenExtPS;
		 Extrema_GenExtPS ();
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_GenExtPS;
		 Extrema_GenExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_GenExtPS;
		 Extrema_GenExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "	:param F:
	:type F: Extrema_ExtFlag
	:rtype: None
") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("autodoc", "	:param A:
	:type A: Extrema_ExtAlgo
	:rtype: None
") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_GenExtPS::~Extrema_GenExtPS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenExtPS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenExtSS;
class Extrema_GenExtSS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_GenExtSS;
		 Extrema_GenExtSS ();
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surfaces. NbU and NbV are used to locate the close points to find the zeros.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtSS;
		 Extrema_GenExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param U1min:
	:type U1min: float
	:param U1sup:
	:type U1sup: float
	:param V1min:
	:type V1min: float
	:param V1sup:
	:type V1sup: float
	:param U2min:
	:type U2min: float
	:param U2sup:
	:type U2sup: float
	:param V2min:
	:type V2min: float
	:param V2sup:
	:type V2sup: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtSS;
		 Extrema_GenExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real U1min,const Standard_Real U1sup,const Standard_Real V1min,const Standard_Real V1sup,const Standard_Real U2min,const Standard_Real U2sup,const Standard_Real V2min,const Standard_Real V2sup,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol2);
		%feature("autodoc", "	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: Standard_Integer
	:param NbV:
	:type NbV: Standard_Integer
	:param U2min:
	:type U2min: float
	:param U2sup:
	:type U2sup: float
	:param V2min:
	:type V2min: float
	:param V2sup:
	:type V2sup: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real U2min,const Standard_Real U2sup,const Standard_Real V2min,const Standard_Real V2sup,const Standard_Real Tol2);
		%feature("autodoc", "	* the algorithm is done with S1 An exception is raised if the fields have not been initialized.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real Tol1);
		%feature("autodoc", "	* the algorithm is done withS1 An exception is raised if the fields have not been initialized.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param U1min:
	:type U1min: float
	:param U1sup:
	:type U1sup: float
	:param V1min:
	:type V1min: float
	:param V1sup:
	:type V1sup: float
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real U1min,const Standard_Real U1sup,const Standard_Real V1min,const Standard_Real V1sup,const Standard_Real Tol1);
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1 (const Standard_Integer N);
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2 (const Standard_Integer N);
};


%feature("shadow") Extrema_GenExtSS::~Extrema_GenExtSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenExtSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenLocateExtCS;
class Extrema_GenLocateExtCS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS ();
		%feature("autodoc", "	* Calculates the distance with two close points. The close points are defined by the parameter values T for C and (U,V) for S. The function F(t,u,v)=distance(C(t),S(u,v)) has an extremun when gradient(F)=0. The algorithm searchs a zero near the close points.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param T:
	:type T: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real T,const Standard_Real U,const Standard_Real V,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param T:
	:type T: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real T,const Standard_Real U,const Standard_Real V,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	* Returns the point of the extremum distance on C.

	:rtype: Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve ();
		%feature("autodoc", "	* Returns the point of the extremum distance on S.

	:rtype: Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface ();
};


%feature("shadow") Extrema_GenLocateExtCS::~Extrema_GenLocateExtCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenLocateExtCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenLocateExtPS;
class Extrema_GenLocateExtPS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS ();
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter values U0 and V0. The function F(u,v)=distance(S(u,v),p) has an extremun when gradient(F)=0. The algorithm searchs a zero near the close point.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	* Returns the point of the extremum distance.

	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point ();
};


%feature("shadow") Extrema_GenLocateExtPS::~Extrema_GenLocateExtPS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenLocateExtPS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenLocateExtSS;
class Extrema_GenLocateExtSS {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS ();
		%feature("autodoc", "	* Calculates the distance with two close points. The close points are defined by the parameter values (U1,V1) for S1 and (U2,V2) for S2. The function F(u1,v1,u2,v2)=distance(S1(u1,v1),S2(u2,v2)) has an extremun when gradient(F)=0. The algorithm searchs a zero near the close points.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	* Returns the point of the extremum distance on S1.

	:rtype: Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1 ();
		%feature("autodoc", "	* Returns the point of the extremum distance on S2.

	:rtype: Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2 ();
};


%feature("shadow") Extrema_GenLocateExtSS::~Extrema_GenLocateExtSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenLocateExtSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_HArray1OfPOnCurv;
class Extrema_HArray1OfPOnCurv : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Extrema_HArray1OfPOnCurv;
		 Extrema_HArray1OfPOnCurv (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Extrema_HArray1OfPOnCurv;
		 Extrema_HArray1OfPOnCurv (const Standard_Integer Low,const Standard_Integer Up,const Extrema_POnCurv & V);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv & V);
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
	:type Value: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnCurv
") Array1;
		const Extrema_Array1OfPOnCurv & Array1 ();
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnCurv
") ChangeArray1;
		Extrema_Array1OfPOnCurv & ChangeArray1 ();
};


%feature("shadow") Extrema_HArray1OfPOnCurv::~Extrema_HArray1OfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray1OfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray1OfPOnCurv {
	Handle_Extrema_HArray1OfPOnCurv GetHandle() {
	return *(Handle_Extrema_HArray1OfPOnCurv*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray1OfPOnCurv;
class Handle_Extrema_HArray1OfPOnCurv : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray1OfPOnCurv();
        Handle_Extrema_HArray1OfPOnCurv(const Handle_Extrema_HArray1OfPOnCurv &aHandle);
        Handle_Extrema_HArray1OfPOnCurv(const Extrema_HArray1OfPOnCurv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray1OfPOnCurv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray1OfPOnCurv {
    Extrema_HArray1OfPOnCurv* GetObject() {
    return (Extrema_HArray1OfPOnCurv*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray1OfPOnCurv::~Handle_Extrema_HArray1OfPOnCurv %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray1OfPOnCurv {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray1OfPOnCurv2d;
class Extrema_HArray1OfPOnCurv2d : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Extrema_HArray1OfPOnCurv2d;
		 Extrema_HArray1OfPOnCurv2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Extrema_HArray1OfPOnCurv2d;
		 Extrema_HArray1OfPOnCurv2d (const Standard_Integer Low,const Standard_Integer Up,const Extrema_POnCurv2d & V);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv2d & V);
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
	:type Value: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnCurv2d
") Array1;
		const Extrema_Array1OfPOnCurv2d & Array1 ();
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnCurv2d
") ChangeArray1;
		Extrema_Array1OfPOnCurv2d & ChangeArray1 ();
};


%feature("shadow") Extrema_HArray1OfPOnCurv2d::~Extrema_HArray1OfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray1OfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray1OfPOnCurv2d {
	Handle_Extrema_HArray1OfPOnCurv2d GetHandle() {
	return *(Handle_Extrema_HArray1OfPOnCurv2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray1OfPOnCurv2d;
class Handle_Extrema_HArray1OfPOnCurv2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray1OfPOnCurv2d();
        Handle_Extrema_HArray1OfPOnCurv2d(const Handle_Extrema_HArray1OfPOnCurv2d &aHandle);
        Handle_Extrema_HArray1OfPOnCurv2d(const Extrema_HArray1OfPOnCurv2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray1OfPOnCurv2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray1OfPOnCurv2d {
    Extrema_HArray1OfPOnCurv2d* GetObject() {
    return (Extrema_HArray1OfPOnCurv2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray1OfPOnCurv2d::~Handle_Extrema_HArray1OfPOnCurv2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray1OfPOnCurv2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray1OfPOnSurf;
class Extrema_HArray1OfPOnSurf : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Extrema_HArray1OfPOnSurf;
		 Extrema_HArray1OfPOnSurf (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Extrema_HArray1OfPOnSurf;
		 Extrema_HArray1OfPOnSurf (const Standard_Integer Low,const Standard_Integer Up,const Extrema_POnSurf & V);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurf & V);
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
	:type Value: Extrema_POnSurf &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnSurf & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnSurf
") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnSurf
") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnSurf
") Array1;
		const Extrema_Array1OfPOnSurf & Array1 ();
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnSurf
") ChangeArray1;
		Extrema_Array1OfPOnSurf & ChangeArray1 ();
};


%feature("shadow") Extrema_HArray1OfPOnSurf::~Extrema_HArray1OfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray1OfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray1OfPOnSurf {
	Handle_Extrema_HArray1OfPOnSurf GetHandle() {
	return *(Handle_Extrema_HArray1OfPOnSurf*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray1OfPOnSurf;
class Handle_Extrema_HArray1OfPOnSurf : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray1OfPOnSurf();
        Handle_Extrema_HArray1OfPOnSurf(const Handle_Extrema_HArray1OfPOnSurf &aHandle);
        Handle_Extrema_HArray1OfPOnSurf(const Extrema_HArray1OfPOnSurf *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray1OfPOnSurf DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray1OfPOnSurf {
    Extrema_HArray1OfPOnSurf* GetObject() {
    return (Extrema_HArray1OfPOnSurf*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray1OfPOnSurf::~Handle_Extrema_HArray1OfPOnSurf %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray1OfPOnSurf {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray2OfPOnCurv;
class Extrema_HArray2OfPOnCurv : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_HArray2OfPOnCurv;
		 Extrema_HArray2OfPOnCurv (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Extrema_HArray2OfPOnCurv;
		 Extrema_HArray2OfPOnCurv (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnCurv & V);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv & V);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnCurv
") Array2;
		const Extrema_Array2OfPOnCurv & Array2 ();
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnCurv
") ChangeArray2;
		Extrema_Array2OfPOnCurv & ChangeArray2 ();
};


%feature("shadow") Extrema_HArray2OfPOnCurv::~Extrema_HArray2OfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray2OfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray2OfPOnCurv {
	Handle_Extrema_HArray2OfPOnCurv GetHandle() {
	return *(Handle_Extrema_HArray2OfPOnCurv*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray2OfPOnCurv;
class Handle_Extrema_HArray2OfPOnCurv : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnCurv();
        Handle_Extrema_HArray2OfPOnCurv(const Handle_Extrema_HArray2OfPOnCurv &aHandle);
        Handle_Extrema_HArray2OfPOnCurv(const Extrema_HArray2OfPOnCurv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnCurv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnCurv {
    Extrema_HArray2OfPOnCurv* GetObject() {
    return (Extrema_HArray2OfPOnCurv*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray2OfPOnCurv::~Handle_Extrema_HArray2OfPOnCurv %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray2OfPOnCurv {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray2OfPOnCurv2d;
class Extrema_HArray2OfPOnCurv2d : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_HArray2OfPOnCurv2d;
		 Extrema_HArray2OfPOnCurv2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Extrema_HArray2OfPOnCurv2d;
		 Extrema_HArray2OfPOnCurv2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnCurv2d & V);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv2d & V);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv2d & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnCurv2d
") Array2;
		const Extrema_Array2OfPOnCurv2d & Array2 ();
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnCurv2d
") ChangeArray2;
		Extrema_Array2OfPOnCurv2d & ChangeArray2 ();
};


%feature("shadow") Extrema_HArray2OfPOnCurv2d::~Extrema_HArray2OfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray2OfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray2OfPOnCurv2d {
	Handle_Extrema_HArray2OfPOnCurv2d GetHandle() {
	return *(Handle_Extrema_HArray2OfPOnCurv2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray2OfPOnCurv2d;
class Handle_Extrema_HArray2OfPOnCurv2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnCurv2d();
        Handle_Extrema_HArray2OfPOnCurv2d(const Handle_Extrema_HArray2OfPOnCurv2d &aHandle);
        Handle_Extrema_HArray2OfPOnCurv2d(const Extrema_HArray2OfPOnCurv2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnCurv2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnCurv2d {
    Extrema_HArray2OfPOnCurv2d* GetObject() {
    return (Extrema_HArray2OfPOnCurv2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray2OfPOnCurv2d::~Handle_Extrema_HArray2OfPOnCurv2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray2OfPOnCurv2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray2OfPOnSurf;
class Extrema_HArray2OfPOnSurf : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_HArray2OfPOnSurf;
		 Extrema_HArray2OfPOnSurf (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Extrema_HArray2OfPOnSurf;
		 Extrema_HArray2OfPOnSurf (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnSurf & V);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurf & V);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Extrema_POnSurf &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurf & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnSurf
") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnSurf
") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnSurf
") Array2;
		const Extrema_Array2OfPOnSurf & Array2 ();
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnSurf
") ChangeArray2;
		Extrema_Array2OfPOnSurf & ChangeArray2 ();
};


%feature("shadow") Extrema_HArray2OfPOnSurf::~Extrema_HArray2OfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray2OfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray2OfPOnSurf {
	Handle_Extrema_HArray2OfPOnSurf GetHandle() {
	return *(Handle_Extrema_HArray2OfPOnSurf*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray2OfPOnSurf;
class Handle_Extrema_HArray2OfPOnSurf : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnSurf();
        Handle_Extrema_HArray2OfPOnSurf(const Handle_Extrema_HArray2OfPOnSurf &aHandle);
        Handle_Extrema_HArray2OfPOnSurf(const Extrema_HArray2OfPOnSurf *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnSurf DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnSurf {
    Extrema_HArray2OfPOnSurf* GetObject() {
    return (Extrema_HArray2OfPOnSurf*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray2OfPOnSurf::~Handle_Extrema_HArray2OfPOnSurf %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray2OfPOnSurf {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray2OfPOnSurfParams;
class Extrema_HArray2OfPOnSurfParams : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Extrema_HArray2OfPOnSurfParams;
		 Extrema_HArray2OfPOnSurfParams (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Extrema_POnSurfParams &
	:rtype: None
") Extrema_HArray2OfPOnSurfParams;
		 Extrema_HArray2OfPOnSurfParams (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnSurfParams & V);
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurfParams &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurfParams & V);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Extrema_POnSurfParams &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurfParams & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnSurfParams
") Value;
		const Extrema_POnSurfParams & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Extrema_POnSurfParams
") ChangeValue;
		Extrema_POnSurfParams & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnSurfParams
") Array2;
		const Extrema_Array2OfPOnSurfParams & Array2 ();
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnSurfParams
") ChangeArray2;
		Extrema_Array2OfPOnSurfParams & ChangeArray2 ();
};


%feature("shadow") Extrema_HArray2OfPOnSurfParams::~Extrema_HArray2OfPOnSurfParams %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray2OfPOnSurfParams {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray2OfPOnSurfParams {
	Handle_Extrema_HArray2OfPOnSurfParams GetHandle() {
	return *(Handle_Extrema_HArray2OfPOnSurfParams*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray2OfPOnSurfParams;
class Handle_Extrema_HArray2OfPOnSurfParams : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnSurfParams();
        Handle_Extrema_HArray2OfPOnSurfParams(const Handle_Extrema_HArray2OfPOnSurfParams &aHandle);
        Handle_Extrema_HArray2OfPOnSurfParams(const Extrema_HArray2OfPOnSurfParams *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnSurfParams DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnSurfParams {
    Extrema_HArray2OfPOnSurfParams* GetObject() {
    return (Extrema_HArray2OfPOnSurfParams*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray2OfPOnSurfParams::~Handle_Extrema_HArray2OfPOnSurfParams %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray2OfPOnSurfParams {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_LCCache2dOfLocateExtCC2d;
class Extrema_LCCache2dOfLocateExtCC2d : public Standard_Transient {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_LCCache2dOfLocateExtCC2d;
		 Extrema_LCCache2dOfLocateExtCC2d ();
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor2d_Curve2d &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") Extrema_LCCache2dOfLocateExtCC2d;
		 Extrema_LCCache2dOfLocateExtCC2d (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor2d_Curve2d &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param IntervalsCN:
	:type IntervalsCN: TColStd_Array1OfReal &
	:param StartIndex:
	:type StartIndex: Standard_Integer
	:param EndIndex:
	:type EndIndex: Standard_Integer
	:param Coeff:
	:type Coeff: float
	:rtype: None
") Extrema_LCCache2dOfLocateExtCC2d;
		 Extrema_LCCache2dOfLocateExtCC2d (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const TColStd_Array1OfReal & IntervalsCN,const Standard_Integer StartIndex,const Standard_Integer EndIndex,const Standard_Real Coeff);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor2d_Curve2d &
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetCurve;
		void SetCurve (const Adaptor2d_Curve2d & theC,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor2d_Curve2d &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetCurve;
		void SetCurve (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real Uinf,const Standard_Real Usup,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:rtype: None
") CalculatePoints;
		void CalculatePoints ();
		%feature("autodoc", "	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Parameters;
		const Handle_TColStd_HArray1OfReal & Parameters ();
		%feature("autodoc", "	:rtype: Handle_TColgp_HArray1OfPnt2d
") Points;
		const Handle_TColgp_HArray1OfPnt2d & Points ();
		%feature("autodoc", "	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr ();
		%feature("autodoc", "	:rtype: int
") NbSamples;
		Standard_Integer NbSamples ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: float
") TrimFirstParameter;
		Standard_Real TrimFirstParameter ();
		%feature("autodoc", "	:rtype: float
") TrimLastParameter;
		Standard_Real TrimLastParameter ();
};


%feature("shadow") Extrema_LCCache2dOfLocateExtCC2d::~Extrema_LCCache2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LCCache2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_LCCache2dOfLocateExtCC2d {
	Handle_Extrema_LCCache2dOfLocateExtCC2d GetHandle() {
	return *(Handle_Extrema_LCCache2dOfLocateExtCC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_LCCache2dOfLocateExtCC2d;
class Handle_Extrema_LCCache2dOfLocateExtCC2d : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Extrema_LCCache2dOfLocateExtCC2d();
        Handle_Extrema_LCCache2dOfLocateExtCC2d(const Handle_Extrema_LCCache2dOfLocateExtCC2d &aHandle);
        Handle_Extrema_LCCache2dOfLocateExtCC2d(const Extrema_LCCache2dOfLocateExtCC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_LCCache2dOfLocateExtCC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_LCCache2dOfLocateExtCC2d {
    Extrema_LCCache2dOfLocateExtCC2d* GetObject() {
    return (Extrema_LCCache2dOfLocateExtCC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_LCCache2dOfLocateExtCC2d::~Handle_Extrema_LCCache2dOfLocateExtCC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_LCCache2dOfLocateExtCC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_LCCacheOfLocateExtCC;
class Extrema_LCCacheOfLocateExtCC : public Standard_Transient {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_LCCacheOfLocateExtCC;
		 Extrema_LCCacheOfLocateExtCC ();
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor3d_Curve &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") Extrema_LCCacheOfLocateExtCC;
		 Extrema_LCCacheOfLocateExtCC (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor3d_Curve &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param IntervalsCN:
	:type IntervalsCN: TColStd_Array1OfReal &
	:param StartIndex:
	:type StartIndex: Standard_Integer
	:param EndIndex:
	:type EndIndex: Standard_Integer
	:param Coeff:
	:type Coeff: float
	:rtype: None
") Extrema_LCCacheOfLocateExtCC;
		 Extrema_LCCacheOfLocateExtCC (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const TColStd_Array1OfReal & IntervalsCN,const Standard_Integer StartIndex,const Standard_Integer EndIndex,const Standard_Real Coeff);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor3d_Curve &
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetCurve;
		void SetCurve (const Adaptor3d_Curve & theC,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param theC:
	:type theC: Adaptor3d_Curve &
	:param theUFirst:
	:type theUFirst: float
	:param theULast:
	:type theULast: float
	:param theNbSamples:
	:type theNbSamples: Standard_Integer
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetCurve;
		void SetCurve (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param theToCalculate:
	:type theToCalculate: bool
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real Uinf,const Standard_Real Usup,const Standard_Boolean theToCalculate);
		%feature("autodoc", "	:rtype: None
") CalculatePoints;
		void CalculatePoints ();
		%feature("autodoc", "	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Parameters;
		const Handle_TColStd_HArray1OfReal & Parameters ();
		%feature("autodoc", "	:rtype: Handle_TColgp_HArray1OfPnt
") Points;
		const Handle_TColgp_HArray1OfPnt & Points ();
		%feature("autodoc", "	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr ();
		%feature("autodoc", "	:rtype: int
") NbSamples;
		Standard_Integer NbSamples ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: float
") TrimFirstParameter;
		Standard_Real TrimFirstParameter ();
		%feature("autodoc", "	:rtype: float
") TrimLastParameter;
		Standard_Real TrimLastParameter ();
};


%feature("shadow") Extrema_LCCacheOfLocateExtCC::~Extrema_LCCacheOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LCCacheOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_LCCacheOfLocateExtCC {
	Handle_Extrema_LCCacheOfLocateExtCC GetHandle() {
	return *(Handle_Extrema_LCCacheOfLocateExtCC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_LCCacheOfLocateExtCC;
class Handle_Extrema_LCCacheOfLocateExtCC : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Extrema_LCCacheOfLocateExtCC();
        Handle_Extrema_LCCacheOfLocateExtCC(const Handle_Extrema_LCCacheOfLocateExtCC &aHandle);
        Handle_Extrema_LCCacheOfLocateExtCC(const Extrema_LCCacheOfLocateExtCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_LCCacheOfLocateExtCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_LCCacheOfLocateExtCC {
    Extrema_LCCacheOfLocateExtCC* GetObject() {
    return (Extrema_LCCacheOfLocateExtCC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_LCCacheOfLocateExtCC::~Handle_Extrema_LCCacheOfLocateExtCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_LCCacheOfLocateExtCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_LocECC2dOfLocateExtCC2d;
class Extrema_LocECC2dOfLocateExtCC2d {
	public:
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_LocECC2dOfLocateExtCC2d;
		 Extrema_LocECC2dOfLocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%feature("shadow") Extrema_LocECC2dOfLocateExtCC2d::~Extrema_LocECC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocECC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocECCOfLocateExtCC;
class Extrema_LocECCOfLocateExtCC {
	public:
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_LocECCOfLocateExtCC;
		 Extrema_LocECCOfLocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%feature("shadow") Extrema_LocECCOfLocateExtCC::~Extrema_LocECCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocECCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocEPCOfLocateExtPC;
class Extrema_LocEPCOfLocateExtPC {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real U0);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point ();
};


%feature("shadow") Extrema_LocEPCOfLocateExtPC::~Extrema_LocEPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocEPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocEPCOfLocateExtPC2d;
class Extrema_LocEPCOfLocateExtPC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point ();
};


%feature("shadow") Extrema_LocEPCOfLocateExtPC2d::~Extrema_LocEPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocEPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocateExtCC;
class Extrema_LocateExtCC {
	public:
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:rtype: None
") Extrema_LocateExtCC;
		 Extrema_LocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U0,const Standard_Real V0);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%feature("shadow") Extrema_LocateExtCC::~Extrema_LocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocateExtCC2d;
class Extrema_LocateExtCC2d {
	public:
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:rtype: None
") Extrema_LocateExtCC2d;
		 Extrema_LocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U0,const Standard_Real V0);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%feature("shadow") Extrema_LocateExtCC2d::~Extrema_LocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocateExtPC;
class Extrema_LocateExtPC {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real U0);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point ();
};


%feature("shadow") Extrema_LocateExtPC::~Extrema_LocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocateExtPC2d;
class Extrema_LocateExtPC2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point ();
};


%feature("shadow") Extrema_LocateExtPC2d::~Extrema_LocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCFOfEPCOfELPCOfLocateExtPC;
class Extrema_PCFOfEPCOfELPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCFOfEPCOfELPCOfLocateExtPC::~Extrema_PCFOfEPCOfELPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
class Extrema_PCFOfEPCOfELPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::~Extrema_PCFOfEPCOfELPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCFOfEPCOfExtPC;
class Extrema_PCFOfEPCOfExtPC : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCFOfEPCOfExtPC::~Extrema_PCFOfEPCOfExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCFOfEPCOfExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCFOfEPCOfExtPC2d;
class Extrema_PCFOfEPCOfExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCFOfEPCOfExtPC2d::~Extrema_PCFOfEPCOfExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCFOfEPCOfExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCLocFOfLocEPCOfLocateExtPC;
class Extrema_PCLocFOfLocEPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCLocFOfLocEPCOfLocateExtPC::~Extrema_PCLocFOfLocEPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCLocFOfLocEPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
class Extrema_PCLocFOfLocEPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCLocFOfLocEPCOfLocateExtPC2d::~Extrema_PCLocFOfLocEPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCLocFOfLocEPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_POnCurv;
class Extrema_POnCurv {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_POnCurv;
		 Extrema_POnCurv ();
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") Extrema_POnCurv;
		 Extrema_POnCurv (const Standard_Real U,const gp_Pnt & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetValues;
		void SetValues (const Standard_Real U,const gp_Pnt & P);
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetExtrema_POnCurvmyU;
		Standard_Real _CSFDB_GetExtrema_POnCurvmyU ();
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetExtrema_POnCurvmyU;
		void _CSFDB_SetExtrema_POnCurvmyU (const Standard_Real p);
		%feature("autodoc", "	:rtype: gp_Pnt
") _CSFDB_GetExtrema_POnCurvmyP;
		const gp_Pnt  _CSFDB_GetExtrema_POnCurvmyP ();
};


%feature("shadow") Extrema_POnCurv::~Extrema_POnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_POnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_POnCurv2d;
class Extrema_POnCurv2d {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d ();
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d (const Standard_Real U,const gp_Pnt2d & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetValues;
		void SetValues (const Standard_Real U,const gp_Pnt2d & P);
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value ();
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetExtrema_POnCurv2dmyU;
		Standard_Real _CSFDB_GetExtrema_POnCurv2dmyU ();
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetExtrema_POnCurv2dmyU;
		void _CSFDB_SetExtrema_POnCurv2dmyU (const Standard_Real p);
		%feature("autodoc", "	:rtype: gp_Pnt2d
") _CSFDB_GetExtrema_POnCurv2dmyP;
		const gp_Pnt2d  _CSFDB_GetExtrema_POnCurv2dmyP ();
};


%feature("shadow") Extrema_POnCurv2d::~Extrema_POnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_POnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_POnSurf;
class Extrema_POnSurf {
	public:
		%feature("autodoc", "	* Creation of an indefinite point on surface.

	:rtype: None
") Extrema_POnSurf;
		 Extrema_POnSurf ();
		%feature("autodoc", "	* Creation of a point on surface with parameter values on the surface and a Pnt from gp.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") Extrema_POnSurf;
		 Extrema_POnSurf (const Standard_Real U,const Standard_Real V,const gp_Pnt & P);
		%feature("autodoc", "	* Returns the 3d point.

	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("autodoc", "	* Returns the parameter values on the surface.

	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Parameter;
		void Parameter (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Extrema_POnSurf::~Extrema_POnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_POnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
class Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC
") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Assign (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC
") operator=;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & operator = (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC::~Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
class Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d
") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Assign (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d
") operator=;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & operator = (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d::~Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfExtPC;
class Extrema_SeqPCOfPCFOfEPCOfExtPC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfExtPC;
		 Extrema_SeqPCOfPCFOfEPCOfExtPC ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfExtPC
") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC & Assign (const Extrema_SeqPCOfPCFOfEPCOfExtPC & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfExtPC
") operator=;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC & operator = (const Extrema_SeqPCOfPCFOfEPCOfExtPC & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPCOfPCFOfEPCOfExtPC::~Extrema_SeqPCOfPCFOfEPCOfExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCFOfEPCOfExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfExtPC2d;
class Extrema_SeqPCOfPCFOfEPCOfExtPC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfExtPC2d;
		 Extrema_SeqPCOfPCFOfEPCOfExtPC2d ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfExtPC2d
") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Assign (const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfExtPC2d
") operator=;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & operator = (const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPCOfPCFOfEPCOfExtPC2d::~Extrema_SeqPCOfPCFOfEPCOfExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCFOfEPCOfExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC;
class Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC;
		 Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC
") Assign;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Assign (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC
") operator=;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & operator = (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC::~Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
class Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d
") Assign;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Assign (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d
") operator=;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & operator = (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d::~Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d;
class Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d;
		 Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d &
	:rtype: Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d
") Assign;
		const Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & Assign (const Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d &
	:rtype: Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d
") operator=;
		const Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & operator = (const Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d &
	:rtype: None
") Append;
		void Append (Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d::~Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCFOfECCOfExtCC;
class Extrema_SeqPOnCOfCCFOfECCOfExtCC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPOnCOfCCFOfECCOfExtCC;
		 Extrema_SeqPOnCOfCCFOfECCOfExtCC ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCFOfECCOfExtCC &
	:rtype: Extrema_SeqPOnCOfCCFOfECCOfExtCC
") Assign;
		const Extrema_SeqPOnCOfCCFOfECCOfExtCC & Assign (const Extrema_SeqPOnCOfCCFOfECCOfExtCC & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCFOfECCOfExtCC &
	:rtype: Extrema_SeqPOnCOfCCFOfECCOfExtCC
") operator=;
		const Extrema_SeqPOnCOfCCFOfECCOfExtCC & operator = (const Extrema_SeqPOnCOfCCFOfECCOfExtCC & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfECCOfExtCC &
	:rtype: None
") Append;
		void Append (Extrema_SeqPOnCOfCCFOfECCOfExtCC & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfECCOfExtCC &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCFOfECCOfExtCC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfECCOfExtCC &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECCOfExtCC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfECCOfExtCC &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECCOfExtCC & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPOnCOfCCFOfECCOfExtCC &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECCOfExtCC & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPOnCOfCCFOfECCOfExtCC::~Extrema_SeqPOnCOfCCFOfECCOfExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCFOfECCOfExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d;
class Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d;
		 Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d &
	:rtype: Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d
") Assign;
		const Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & Assign (const Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d &
	:rtype: Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d
") operator=;
		const Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & operator = (const Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d &
	:rtype: None
") Append;
		void Append (Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d::~Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC;
class Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC;
		 Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC &
	:rtype: Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC
") Assign;
		const Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & Assign (const Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC &
	:rtype: Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC
") operator=;
		const Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & operator = (const Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC &
	:rtype: None
") Append;
		void Append (Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC::~Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d;
class Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d;
		 Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d &
	:rtype: Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d
") Assign;
		const Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & Assign (const Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d &
	:rtype: Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d
") operator=;
		const Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & operator = (const Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d &
	:rtype: None
") Append;
		void Append (Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d::~Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC;
class Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC;
		 Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC &
	:rtype: Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC
") Assign;
		const Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & Assign (const Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC &
	:rtype: Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC
") operator=;
		const Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & operator = (const Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC &
	:rtype: None
") Append;
		void Append (Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC::~Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC::~Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC::~Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d::~Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d::~Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC::~Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC::~Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d::~Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d::~Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC;
class Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC;
		 Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC::~Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC(const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC(const Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
    Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC::~Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
class Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d::~Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d(const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d(const Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
    Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d::~Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d;
class Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d;
		 Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d::~Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d(const Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d {
    Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC;
class Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC;
		 Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC::~Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC(const Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC {
    Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d;
class Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d;
		 Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d::~Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d(const Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d {
    Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC;
class Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC;
		 Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC::~Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC(const Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC {
    Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d;
class Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d;
		 Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d::~Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d(const Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d {
    Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC;
class Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC;
		 Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC::~Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC(const Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC {
    Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSequenceOfPOnCurv;
class Extrema_SequenceNodeOfSequenceOfPOnCurv : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSequenceOfPOnCurv;
		 Extrema_SequenceNodeOfSequenceOfPOnCurv (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSequenceOfPOnCurv::~Extrema_SequenceNodeOfSequenceOfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSequenceOfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSequenceOfPOnCurv {
	Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv;
class Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv();
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv(const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv &aHandle);
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv(const Extrema_SequenceNodeOfSequenceOfPOnCurv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv {
    Extrema_SequenceNodeOfSequenceOfPOnCurv* GetObject() {
    return (Extrema_SequenceNodeOfSequenceOfPOnCurv*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv::~Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSequenceOfPOnCurv2d;
class Extrema_SequenceNodeOfSequenceOfPOnCurv2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSequenceOfPOnCurv2d;
		 Extrema_SequenceNodeOfSequenceOfPOnCurv2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSequenceOfPOnCurv2d::~Extrema_SequenceNodeOfSequenceOfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
	Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d;
class Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d();
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d(const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d &aHandle);
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d(const Extrema_SequenceNodeOfSequenceOfPOnCurv2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
    Extrema_SequenceNodeOfSequenceOfPOnCurv2d* GetObject() {
    return (Extrema_SequenceNodeOfSequenceOfPOnCurv2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d::~Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSequenceOfPOnSurf;
class Extrema_SequenceNodeOfSequenceOfPOnSurf : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnSurf &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSequenceOfPOnSurf;
		 Extrema_SequenceNodeOfSequenceOfPOnSurf (const Extrema_POnSurf & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnSurf
") Value;
		Extrema_POnSurf & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSequenceOfPOnSurf::~Extrema_SequenceNodeOfSequenceOfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSequenceOfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSequenceOfPOnSurf {
	Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf;
class Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf();
        Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf(const Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf &aHandle);
        Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf(const Extrema_SequenceNodeOfSequenceOfPOnSurf *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf {
    Extrema_SequenceNodeOfSequenceOfPOnSurf* GetObject() {
    return (Extrema_SequenceNodeOfSequenceOfPOnSurf*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf::~Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceOfPOnCurv;
class Extrema_SequenceOfPOnCurv : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SequenceOfPOnCurv;
		 Extrema_SequenceOfPOnCurv ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnCurv &
	:rtype: Extrema_SequenceOfPOnCurv
") Assign;
		const Extrema_SequenceOfPOnCurv & Assign (const Extrema_SequenceOfPOnCurv & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnCurv &
	:rtype: Extrema_SequenceOfPOnCurv
") operator=;
		const Extrema_SequenceOfPOnCurv & operator = (const Extrema_SequenceOfPOnCurv & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnCurv &
	:rtype: None
") Append;
		void Append (Extrema_SequenceOfPOnCurv & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnCurv &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SequenceOfPOnCurv & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SequenceOfPOnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SequenceOfPOnCurv & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SequenceOfPOnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SequenceOfPOnCurv & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SequenceOfPOnCurv &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SequenceOfPOnCurv & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SequenceOfPOnCurv::~Extrema_SequenceOfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceOfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SequenceOfPOnCurv2d;
class Extrema_SequenceOfPOnCurv2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SequenceOfPOnCurv2d;
		 Extrema_SequenceOfPOnCurv2d ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnCurv2d &
	:rtype: Extrema_SequenceOfPOnCurv2d
") Assign;
		const Extrema_SequenceOfPOnCurv2d & Assign (const Extrema_SequenceOfPOnCurv2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnCurv2d &
	:rtype: Extrema_SequenceOfPOnCurv2d
") operator=;
		const Extrema_SequenceOfPOnCurv2d & operator = (const Extrema_SequenceOfPOnCurv2d & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") Append;
		void Append (Extrema_SequenceOfPOnCurv2d & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SequenceOfPOnCurv2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SequenceOfPOnCurv2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SequenceOfPOnCurv2d & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SequenceOfPOnCurv2d & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SequenceOfPOnCurv2d::~Extrema_SequenceOfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceOfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SequenceOfPOnSurf;
class Extrema_SequenceOfPOnSurf : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Extrema_SequenceOfPOnSurf;
		 Extrema_SequenceOfPOnSurf ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnSurf &
	:rtype: Extrema_SequenceOfPOnSurf
") Assign;
		const Extrema_SequenceOfPOnSurf & Assign (const Extrema_SequenceOfPOnSurf & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnSurf &
	:rtype: Extrema_SequenceOfPOnSurf
") operator=;
		const Extrema_SequenceOfPOnSurf & operator = (const Extrema_SequenceOfPOnSurf & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnSurf &
	:rtype: None
") Append;
		void Append (const Extrema_POnSurf & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnSurf &
	:rtype: None
") Append;
		void Append (Extrema_SequenceOfPOnSurf & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnSurf &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnSurf & T);
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnSurf &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SequenceOfPOnSurf & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnSurf &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnSurf & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SequenceOfPOnSurf &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SequenceOfPOnSurf & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnSurf &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnSurf & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Extrema_SequenceOfPOnSurf &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SequenceOfPOnSurf & S);
		%feature("autodoc", "	:rtype: Extrema_POnSurf
") First;
		const Extrema_POnSurf & First ();
		%feature("autodoc", "	:rtype: Extrema_POnSurf
") Last;
		const Extrema_POnSurf & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Extrema_SequenceOfPOnSurf &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SequenceOfPOnSurf & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnSurf
") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnSurf &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnSurf & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnSurf
") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Extrema_SequenceOfPOnSurf::~Extrema_SequenceOfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceOfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_POnSurfParams;
class Extrema_POnSurfParams : public Extrema_POnSurf {
	public:
		%feature("autodoc", "	* empty constructor

	:rtype: None
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams ();
		%feature("autodoc", "	* Creation of a point on surface with parameter values on the surface and a Pnt from gp.

	:param theU:
	:type theU: float
	:param theV:
	:type theV: float
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams (const Standard_Real theU,const Standard_Real theV,const gp_Pnt & thePnt);
		%feature("autodoc", "	* Sets the square distance from this point to another one (e.g. to the point to be projected).

	:param theSqrDistance:
	:type theSqrDistance: float
	:rtype: None
") SetSqrDistance;
		void SetSqrDistance (const Standard_Real theSqrDistance);
		%feature("autodoc", "	* Query the square distance from this point to another one.

	:rtype: float
") GetSqrDistance;
		Standard_Real GetSqrDistance ();
		%feature("autodoc", "	* Sets the element type on which this point is situated.

	:param theElementType:
	:type theElementType: Extrema_ElementType
	:rtype: None
") SetElementType;
		void SetElementType (const Extrema_ElementType theElementType);
		%feature("autodoc", "	* Query the element type on which this point is situated.

	:rtype: Extrema_ElementType
") GetElementType;
		Extrema_ElementType GetElementType ();
		%feature("autodoc", "	* Sets the U and V indices of an element that contains this point.

	:param theIndexU:
	:type theIndexU: Standard_Integer
	:param theIndexV:
	:type theIndexV: Standard_Integer
	:rtype: None
") SetIndices;
		void SetIndices (const Standard_Integer theIndexU,const Standard_Integer theIndexV);
		%feature("autodoc", "	* Query the U and V indices of an element that contains this point.

	:param theIndexU:
	:type theIndexU: Standard_Integer &
	:param theIndexV:
	:type theIndexV: Standard_Integer &
	:rtype: None
") GetIndices;
		void GetIndices (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") Extrema_POnSurfParams::~Extrema_POnSurfParams %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_POnSurfParams {
	void _kill_pointed() {
		delete $self;
	}
};
