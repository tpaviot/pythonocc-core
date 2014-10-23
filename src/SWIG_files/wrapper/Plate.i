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
%module (package="OCC") Plate

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

%include Plate_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Plate_Array1OfPinpointConstraint;
class Plate_Array1OfPinpointConstraint {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Plate_Array1OfPinpointConstraint;
		 Plate_Array1OfPinpointConstraint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Plate_PinpointConstraint &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Plate_Array1OfPinpointConstraint;
		 Plate_Array1OfPinpointConstraint (const Plate_PinpointConstraint & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Plate_PinpointConstraint &
	:rtype: None
") Init;
		void Init (const Plate_PinpointConstraint & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Plate_Array1OfPinpointConstraint &
	:rtype: Plate_Array1OfPinpointConstraint
") Assign;
		const Plate_Array1OfPinpointConstraint & Assign (const Plate_Array1OfPinpointConstraint & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Plate_Array1OfPinpointConstraint &
	:rtype: Plate_Array1OfPinpointConstraint
") operator=;
		const Plate_Array1OfPinpointConstraint & operator = (const Plate_Array1OfPinpointConstraint & Other);
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
	:type Value: Plate_PinpointConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_PinpointConstraint
") Value;
		const Plate_PinpointConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_PinpointConstraint
") ChangeValue;
		Plate_PinpointConstraint & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Plate_Array1OfPinpointConstraint::~Plate_Array1OfPinpointConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_Array1OfPinpointConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_D1;
class Plate_D1 {
	public:
		%feature("autodoc", "	:param du:
	:type du: gp_XYZ
	:param dv:
	:type dv: gp_XYZ
	:rtype: None
") Plate_D1;
		 Plate_D1 (const gp_XYZ & du,const gp_XYZ & dv);
		%feature("autodoc", "	:param ref:
	:type ref: Plate_D1 &
	:rtype: None
") Plate_D1;
		 Plate_D1 (const Plate_D1 & ref);
		%feature("autodoc", "	:rtype: gp_XYZ
") DU;
		const gp_XYZ  DU ();
		%feature("autodoc", "	:rtype: gp_XYZ
") DV;
		const gp_XYZ  DV ();
};


%feature("shadow") Plate_D1::~Plate_D1 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_D1 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_D2;
class Plate_D2 {
	public:
		%feature("autodoc", "	:param duu:
	:type duu: gp_XYZ
	:param duv:
	:type duv: gp_XYZ
	:param dvv:
	:type dvv: gp_XYZ
	:rtype: None
") Plate_D2;
		 Plate_D2 (const gp_XYZ & duu,const gp_XYZ & duv,const gp_XYZ & dvv);
		%feature("autodoc", "	:param ref:
	:type ref: Plate_D2 &
	:rtype: None
") Plate_D2;
		 Plate_D2 (const Plate_D2 & ref);
};


%feature("shadow") Plate_D2::~Plate_D2 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_D2 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_D3;
class Plate_D3 {
	public:
		%feature("autodoc", "	:param duuu:
	:type duuu: gp_XYZ
	:param duuv:
	:type duuv: gp_XYZ
	:param duvv:
	:type duvv: gp_XYZ
	:param dvvv:
	:type dvvv: gp_XYZ
	:rtype: None
") Plate_D3;
		 Plate_D3 (const gp_XYZ & duuu,const gp_XYZ & duuv,const gp_XYZ & duvv,const gp_XYZ & dvvv);
		%feature("autodoc", "	:param ref:
	:type ref: Plate_D3 &
	:rtype: None
") Plate_D3;
		 Plate_D3 (const Plate_D3 & ref);
};


%feature("shadow") Plate_D3::~Plate_D3 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_D3 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_FreeGtoCConstraint;
class Plate_FreeGtoCConstraint {
	public:
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:param IncrementalLoad: default value is 1.0
	:type IncrementalLoad: float
	:param orientation: default value is 0
	:type orientation: Standard_Integer
	:rtype: None
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:param D2S:
	:type D2S: Plate_D2 &
	:param D2T:
	:type D2T: Plate_D2 &
	:param IncrementalLoad: default value is 1.0
	:type IncrementalLoad: float
	:param orientation: default value is 0
	:type orientation: Standard_Integer
	:rtype: None
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:param D2S:
	:type D2S: Plate_D2 &
	:param D2T:
	:type D2T: Plate_D2 &
	:param D3S:
	:type D3S: Plate_D3 &
	:param D3T:
	:type D3T: Plate_D3 &
	:param IncrementalLoad: default value is 1.0
	:type IncrementalLoad: float
	:param orientation: default value is 0
	:type orientation: Standard_Integer
	:rtype: None
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Plate_D3 & D3S,const Plate_D3 & D3T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);
		%feature("autodoc", "	:rtype: int
") nb_PPC;
		const Standard_Integer & nb_PPC ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_PinpointConstraint
") GetPPC;
		const Plate_PinpointConstraint & GetPPC (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: int
") nb_LSC;
		const Standard_Integer & nb_LSC ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC (const Standard_Integer Index);
};


%feature("shadow") Plate_FreeGtoCConstraint::~Plate_FreeGtoCConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_FreeGtoCConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_GlobalTranslationConstraint;
class Plate_GlobalTranslationConstraint {
	public:
		%feature("autodoc", "	:param SOfXY:
	:type SOfXY: TColgp_SequenceOfXY
	:rtype: None
") Plate_GlobalTranslationConstraint;
		 Plate_GlobalTranslationConstraint (const TColgp_SequenceOfXY & SOfXY);
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC ();
};


%feature("shadow") Plate_GlobalTranslationConstraint::~Plate_GlobalTranslationConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_GlobalTranslationConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_GtoCConstraint;
class Plate_GtoCConstraint {
	public:
		%feature("autodoc", "	:param ref:
	:type ref: Plate_GtoCConstraint &
	:rtype: None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const Plate_GtoCConstraint & ref);
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:rtype: None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T);
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:param nP:
	:type nP: gp_XYZ
	:rtype: None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const gp_XYZ & nP);
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:param D2S:
	:type D2S: Plate_D2 &
	:param D2T:
	:type D2T: Plate_D2 &
	:rtype: None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T);
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:param D2S:
	:type D2S: Plate_D2 &
	:param D2T:
	:type D2T: Plate_D2 &
	:param nP:
	:type nP: gp_XYZ
	:rtype: None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const gp_XYZ & nP);
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:param D2S:
	:type D2S: Plate_D2 &
	:param D2T:
	:type D2T: Plate_D2 &
	:param D3S:
	:type D3S: Plate_D3 &
	:param D3T:
	:type D3T: Plate_D3 &
	:rtype: None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Plate_D3 & D3S,const Plate_D3 & D3T);
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:param D2S:
	:type D2S: Plate_D2 &
	:param D2T:
	:type D2T: Plate_D2 &
	:param D3S:
	:type D3S: Plate_D3 &
	:param D3T:
	:type D3T: Plate_D3 &
	:param nP:
	:type nP: gp_XYZ
	:rtype: None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Plate_D3 & D3S,const Plate_D3 & D3T,const gp_XYZ & nP);
		%feature("autodoc", "	:rtype: int
") nb_PPC;
		const Standard_Integer & nb_PPC ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_PinpointConstraint
") GetPPC;
		const Plate_PinpointConstraint & GetPPC (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Plate_D1
") D1SurfInit;
		const Plate_D1 & D1SurfInit ();
};


%feature("shadow") Plate_GtoCConstraint::~Plate_GtoCConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_GtoCConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_HArray1OfPinpointConstraint;
class Plate_HArray1OfPinpointConstraint : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Plate_HArray1OfPinpointConstraint;
		 Plate_HArray1OfPinpointConstraint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Plate_PinpointConstraint &
	:rtype: None
") Plate_HArray1OfPinpointConstraint;
		 Plate_HArray1OfPinpointConstraint (const Standard_Integer Low,const Standard_Integer Up,const Plate_PinpointConstraint & V);
		%feature("autodoc", "	:param V:
	:type V: Plate_PinpointConstraint &
	:rtype: None
") Init;
		void Init (const Plate_PinpointConstraint & V);
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
	:type Value: Plate_PinpointConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_PinpointConstraint
") Value;
		const Plate_PinpointConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_PinpointConstraint
") ChangeValue;
		Plate_PinpointConstraint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Plate_Array1OfPinpointConstraint
") Array1;
		const Plate_Array1OfPinpointConstraint & Array1 ();
		%feature("autodoc", "	:rtype: Plate_Array1OfPinpointConstraint
") ChangeArray1;
		Plate_Array1OfPinpointConstraint & ChangeArray1 ();
};


%feature("shadow") Plate_HArray1OfPinpointConstraint::~Plate_HArray1OfPinpointConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_HArray1OfPinpointConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Plate_HArray1OfPinpointConstraint {
	Handle_Plate_HArray1OfPinpointConstraint GetHandle() {
	return *(Handle_Plate_HArray1OfPinpointConstraint*) &$self;
	}
};

%nodefaultctor Handle_Plate_HArray1OfPinpointConstraint;
class Handle_Plate_HArray1OfPinpointConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Plate_HArray1OfPinpointConstraint();
        Handle_Plate_HArray1OfPinpointConstraint(const Handle_Plate_HArray1OfPinpointConstraint &aHandle);
        Handle_Plate_HArray1OfPinpointConstraint(const Plate_HArray1OfPinpointConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Plate_HArray1OfPinpointConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Plate_HArray1OfPinpointConstraint {
    Plate_HArray1OfPinpointConstraint* GetObject() {
    return (Plate_HArray1OfPinpointConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_Plate_HArray1OfPinpointConstraint::~Handle_Plate_HArray1OfPinpointConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Plate_HArray1OfPinpointConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Plate_LineConstraint;
class Plate_LineConstraint {
	public:
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param lin:
	:type lin: gp_Lin
	:param iu: default value is 0
	:type iu: Standard_Integer
	:param iv: default value is 0
	:type iv: Standard_Integer
	:rtype: None
") Plate_LineConstraint;
		 Plate_LineConstraint (const gp_XY & point2d,const gp_Lin & lin,const Standard_Integer iu = 0,const Standard_Integer iv = 0);
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC ();
};


%feature("shadow") Plate_LineConstraint::~Plate_LineConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_LineConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_LinearScalarConstraint;
class Plate_LinearScalarConstraint {
	public:
		%feature("autodoc", "	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint ();
		%feature("autodoc", "	:param PPC1:
	:type PPC1: Plate_PinpointConstraint &
	:param coeff:
	:type coeff: gp_XYZ
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_PinpointConstraint & PPC1,const gp_XYZ & coeff);
		%feature("autodoc", "	:param ppc:
	:type ppc: Plate_Array1OfPinpointConstraint &
	:param coeff:
	:type coeff: TColgp_Array1OfXYZ
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColgp_Array1OfXYZ & coeff);
		%feature("autodoc", "	:param ppc:
	:type ppc: Plate_Array1OfPinpointConstraint &
	:param coeff:
	:type coeff: TColgp_Array2OfXYZ
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColgp_Array2OfXYZ & coeff);
		%feature("autodoc", "	:param ColLen:
	:type ColLen: Standard_Integer
	:param RowLen:
	:type RowLen: Standard_Integer
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Standard_Integer ColLen,const Standard_Integer RowLen);
		%feature("autodoc", "	:rtype: Plate_Array1OfPinpointConstraint
") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC ();
		%feature("autodoc", "	:rtype: TColgp_Array2OfXYZ
") Coeff;
		const TColgp_Array2OfXYZ & Coeff ();
		%feature("autodoc", "	* Sets the PinPointConstraint of index Index to Value raise if Index is greater than the length of ppc or the Row length of coeff or lower than 1

	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Plate_PinpointConstraint &
	:rtype: None
") SetPPC;
		void SetPPC (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("autodoc", "	* Sets the coeff of index (Row,Col) to Value raise if Row (respectively Col) is greater than the Row (respectively Column) length of coeff

	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: gp_XYZ
	:rtype: None
") SetCoeff;
		void SetCoeff (const Standard_Integer Row,const Standard_Integer Col,const gp_XYZ & Value);
};


%feature("shadow") Plate_LinearScalarConstraint::~Plate_LinearScalarConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_LinearScalarConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_LinearXYZConstraint;
class Plate_LinearXYZConstraint {
	public:
		%feature("autodoc", "	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint ();
		%feature("autodoc", "	:param ppc:
	:type ppc: Plate_Array1OfPinpointConstraint &
	:param coeff:
	:type coeff: TColStd_Array1OfReal &
	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColStd_Array1OfReal & coeff);
		%feature("autodoc", "	:param ppc:
	:type ppc: Plate_Array1OfPinpointConstraint &
	:param coeff:
	:type coeff: TColStd_Array2OfReal &
	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColStd_Array2OfReal & coeff);
		%feature("autodoc", "	:param ColLen:
	:type ColLen: Standard_Integer
	:param RowLen:
	:type RowLen: Standard_Integer
	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Standard_Integer ColLen,const Standard_Integer RowLen);
		%feature("autodoc", "	:rtype: Plate_Array1OfPinpointConstraint
") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC ();
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") Coeff;
		const TColStd_Array2OfReal & Coeff ();
		%feature("autodoc", "	* Sets the PinPointConstraint of index Index to Value raise if Index is greater than the length of ppc or the Row length of coeff or lower than 1

	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Plate_PinpointConstraint &
	:rtype: None
") SetPPC;
		void SetPPC (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("autodoc", "	* Sets the coeff of index (Row,Col) to Value raise if Row (respectively Col) is greater than the Row (respectively Column) length of coeff

	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: float
	:rtype: None
") SetCoeff;
		void SetCoeff (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);
};


%feature("shadow") Plate_LinearXYZConstraint::~Plate_LinearXYZConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_LinearXYZConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_PinpointConstraint;
class Plate_PinpointConstraint {
	public:
		%feature("autodoc", "	:rtype: None
") Plate_PinpointConstraint;
		 Plate_PinpointConstraint ();
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param ImposedValue:
	:type ImposedValue: gp_XYZ
	:param iu: default value is 0
	:type iu: Standard_Integer
	:param iv: default value is 0
	:type iv: Standard_Integer
	:rtype: None
") Plate_PinpointConstraint;
		 Plate_PinpointConstraint (const gp_XY & point2d,const gp_XYZ & ImposedValue,const Standard_Integer iu = 0,const Standard_Integer iv = 0);
		%feature("autodoc", "	:rtype: gp_XY
") Pnt2d;
		const gp_XY  Pnt2d ();
		%feature("autodoc", "	:rtype: int
") Idu;
		const Standard_Integer & Idu ();
		%feature("autodoc", "	:rtype: int
") Idv;
		const Standard_Integer & Idv ();
		%feature("autodoc", "	:rtype: gp_XYZ
") Value;
		const gp_XYZ  Value ();
};


%feature("shadow") Plate_PinpointConstraint::~Plate_PinpointConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_PinpointConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_PlaneConstraint;
class Plate_PlaneConstraint {
	public:
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param pln:
	:type pln: gp_Pln
	:param iu: default value is 0
	:type iu: Standard_Integer
	:param iv: default value is 0
	:type iv: Standard_Integer
	:rtype: None
") Plate_PlaneConstraint;
		 Plate_PlaneConstraint (const gp_XY & point2d,const gp_Pln & pln,const Standard_Integer iu = 0,const Standard_Integer iv = 0);
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC ();
};


%feature("shadow") Plate_PlaneConstraint::~Plate_PlaneConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_PlaneConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_Plate;
class Plate_Plate {
	public:
		%feature("autodoc", "	:rtype: None
") Plate_Plate;
		 Plate_Plate ();
		%feature("autodoc", "	:param Ref:
	:type Ref: Plate_Plate &
	:rtype: None
") Plate_Plate;
		 Plate_Plate (const Plate_Plate & Ref);
		%feature("autodoc", "	:param Ref:
	:type Ref: Plate_Plate &
	:rtype: Plate_Plate
") Copy;
		Plate_Plate & Copy (const Plate_Plate & Ref);
		%feature("autodoc", "	:param Ref:
	:type Ref: Plate_Plate &
	:rtype: Plate_Plate
") operator=;
		Plate_Plate & operator = (const Plate_Plate & Ref);
		%feature("autodoc", "	:param PConst:
	:type PConst: Plate_PinpointConstraint &
	:rtype: None
") Load;
		void Load (const Plate_PinpointConstraint & PConst);
		%feature("autodoc", "	:param LXYZConst:
	:type LXYZConst: Plate_LinearXYZConstraint &
	:rtype: None
") Load;
		void Load (const Plate_LinearXYZConstraint & LXYZConst);
		%feature("autodoc", "	:param LScalarConst:
	:type LScalarConst: Plate_LinearScalarConstraint &
	:rtype: None
") Load;
		void Load (const Plate_LinearScalarConstraint & LScalarConst);
		%feature("autodoc", "	:param GTConst:
	:type GTConst: Plate_GlobalTranslationConstraint &
	:rtype: None
") Load;
		void Load (const Plate_GlobalTranslationConstraint & GTConst);
		%feature("autodoc", "	:param LConst:
	:type LConst: Plate_LineConstraint &
	:rtype: None
") Load;
		void Load (const Plate_LineConstraint & LConst);
		%feature("autodoc", "	:param PConst:
	:type PConst: Plate_PlaneConstraint &
	:rtype: None
") Load;
		void Load (const Plate_PlaneConstraint & PConst);
		%feature("autodoc", "	:param SCConst:
	:type SCConst: Plate_SampledCurveConstraint &
	:rtype: None
") Load;
		void Load (const Plate_SampledCurveConstraint & SCConst);
		%feature("autodoc", "	:param GtoCConst:
	:type GtoCConst: Plate_GtoCConstraint &
	:rtype: None
") Load;
		void Load (const Plate_GtoCConstraint & GtoCConst);
		%feature("autodoc", "	:param FGtoCConst:
	:type FGtoCConst: Plate_FreeGtoCConstraint &
	:rtype: None
") Load;
		void Load (const Plate_FreeGtoCConstraint & FGtoCConst);
		%feature("autodoc", "	:param ord: default value is 4
	:type ord: Standard_Integer
	:param anisotropie: default value is 1.0
	:type anisotropie: float
	:rtype: None
") SolveTI;
		void SolveTI (const Standard_Integer ord = 4,const Standard_Real anisotropie = 1.0);
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: None
") destroy;
		void destroy ();
		%feature("autodoc", "	* reset the Plate in the initial state ( same as after Create())

	:rtype: None
") Init;
		void Init ();
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:rtype: gp_XYZ
") Evaluate;
		gp_XYZ Evaluate (const gp_XY & point2d);
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param iu:
	:type iu: Standard_Integer
	:param iv:
	:type iv: Standard_Integer
	:rtype: gp_XYZ
") EvaluateDerivative;
		gp_XYZ EvaluateDerivative (const gp_XY & point2d,const Standard_Integer iu,const Standard_Integer iv);
		%feature("autodoc", "	:param Coefs:
	:type Coefs: Handle_TColgp_HArray2OfXYZ
	:rtype: None
") CoefPol;
		void CoefPol (Handle_TColgp_HArray2OfXYZ & Coefs);
		%feature("autodoc", "	:param PPOnly: default value is Standard_True
	:type PPOnly: bool
	:rtype: None
") SetPolynomialPartOnly;
		void SetPolynomialPartOnly (const Standard_Boolean PPOnly = Standard_True);
		%feature("autodoc", "	:rtype: int
") Continuity;
		Standard_Integer Continuity ();
		%feature("autodoc", "	:param UMin:
	:type UMin: float &
	:param UMax:
	:type UMax: float &
	:param VMin:
	:type VMin: float &
	:param VMax:
	:type VMax: float &
	:rtype: None
") UVBox;
		void UVBox (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Seq:
	:type Seq: TColgp_SequenceOfXY
	:rtype: None
") UVConstraints;
		void UVConstraints (TColgp_SequenceOfXY & Seq);
};


%feature("shadow") Plate_Plate::~Plate_Plate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_Plate {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_SampledCurveConstraint;
class Plate_SampledCurveConstraint {
	public:
		%feature("autodoc", "	:param SOPPC:
	:type SOPPC: Plate_SequenceOfPinpointConstraint &
	:param n:
	:type n: Standard_Integer
	:rtype: None
") Plate_SampledCurveConstraint;
		 Plate_SampledCurveConstraint (const Plate_SequenceOfPinpointConstraint & SOPPC,const Standard_Integer n);
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC ();
};


%feature("shadow") Plate_SampledCurveConstraint::~Plate_SampledCurveConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_SampledCurveConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_SequenceNodeOfSequenceOfLinearScalarConstraint;
class Plate_SequenceNodeOfSequenceOfLinearScalarConstraint : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Plate_LinearScalarConstraint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Plate_SequenceNodeOfSequenceOfLinearScalarConstraint;
		 Plate_SequenceNodeOfSequenceOfLinearScalarConstraint (const Plate_LinearScalarConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") Value;
		Plate_LinearScalarConstraint & Value ();
};


%feature("shadow") Plate_SequenceNodeOfSequenceOfLinearScalarConstraint::~Plate_SequenceNodeOfSequenceOfLinearScalarConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_SequenceNodeOfSequenceOfLinearScalarConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Plate_SequenceNodeOfSequenceOfLinearScalarConstraint {
	Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint GetHandle() {
	return *(Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint*) &$self;
	}
};

%nodefaultctor Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint;
class Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint();
        Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint(const Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint &aHandle);
        Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint(const Plate_SequenceNodeOfSequenceOfLinearScalarConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint {
    Plate_SequenceNodeOfSequenceOfLinearScalarConstraint* GetObject() {
    return (Plate_SequenceNodeOfSequenceOfLinearScalarConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint::~Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Plate_SequenceNodeOfSequenceOfLinearXYZConstraint;
class Plate_SequenceNodeOfSequenceOfLinearXYZConstraint : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Plate_LinearXYZConstraint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Plate_SequenceNodeOfSequenceOfLinearXYZConstraint;
		 Plate_SequenceNodeOfSequenceOfLinearXYZConstraint (const Plate_LinearXYZConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") Value;
		Plate_LinearXYZConstraint & Value ();
};


%feature("shadow") Plate_SequenceNodeOfSequenceOfLinearXYZConstraint::~Plate_SequenceNodeOfSequenceOfLinearXYZConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_SequenceNodeOfSequenceOfLinearXYZConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Plate_SequenceNodeOfSequenceOfLinearXYZConstraint {
	Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint GetHandle() {
	return *(Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint*) &$self;
	}
};

%nodefaultctor Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint;
class Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint();
        Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint(const Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint &aHandle);
        Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint(const Plate_SequenceNodeOfSequenceOfLinearXYZConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint {
    Plate_SequenceNodeOfSequenceOfLinearXYZConstraint* GetObject() {
    return (Plate_SequenceNodeOfSequenceOfLinearXYZConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint::~Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Plate_SequenceNodeOfSequenceOfPinpointConstraint;
class Plate_SequenceNodeOfSequenceOfPinpointConstraint : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Plate_PinpointConstraint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Plate_SequenceNodeOfSequenceOfPinpointConstraint;
		 Plate_SequenceNodeOfSequenceOfPinpointConstraint (const Plate_PinpointConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Plate_PinpointConstraint
") Value;
		Plate_PinpointConstraint & Value ();
};


%feature("shadow") Plate_SequenceNodeOfSequenceOfPinpointConstraint::~Plate_SequenceNodeOfSequenceOfPinpointConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_SequenceNodeOfSequenceOfPinpointConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Plate_SequenceNodeOfSequenceOfPinpointConstraint {
	Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint GetHandle() {
	return *(Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint*) &$self;
	}
};

%nodefaultctor Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint;
class Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint();
        Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint(const Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint &aHandle);
        Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint(const Plate_SequenceNodeOfSequenceOfPinpointConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint {
    Plate_SequenceNodeOfSequenceOfPinpointConstraint* GetObject() {
    return (Plate_SequenceNodeOfSequenceOfPinpointConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint::~Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Plate_SequenceOfLinearScalarConstraint;
class Plate_SequenceOfLinearScalarConstraint : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Plate_SequenceOfLinearScalarConstraint;
		 Plate_SequenceOfLinearScalarConstraint ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfLinearScalarConstraint &
	:rtype: Plate_SequenceOfLinearScalarConstraint
") Assign;
		const Plate_SequenceOfLinearScalarConstraint & Assign (const Plate_SequenceOfLinearScalarConstraint & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfLinearScalarConstraint &
	:rtype: Plate_SequenceOfLinearScalarConstraint
") operator=;
		const Plate_SequenceOfLinearScalarConstraint & operator = (const Plate_SequenceOfLinearScalarConstraint & Other);
		%feature("autodoc", "	:param T:
	:type T: Plate_LinearScalarConstraint &
	:rtype: None
") Append;
		void Append (const Plate_LinearScalarConstraint & T);
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") Append;
		void Append (Plate_SequenceOfLinearScalarConstraint & S);
		%feature("autodoc", "	:param T:
	:type T: Plate_LinearScalarConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Plate_LinearScalarConstraint & T);
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") Prepend;
		void Prepend (Plate_SequenceOfLinearScalarConstraint & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Plate_LinearScalarConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Plate_LinearScalarConstraint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Plate_SequenceOfLinearScalarConstraint & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Plate_LinearScalarConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Plate_LinearScalarConstraint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Plate_SequenceOfLinearScalarConstraint & S);
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") First;
		const Plate_LinearScalarConstraint & First ();
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") Last;
		const Plate_LinearScalarConstraint & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Plate_SequenceOfLinearScalarConstraint & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_LinearScalarConstraint
") Value;
		const Plate_LinearScalarConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Plate_LinearScalarConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_LinearScalarConstraint & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_LinearScalarConstraint
") ChangeValue;
		Plate_LinearScalarConstraint & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Plate_SequenceOfLinearScalarConstraint::~Plate_SequenceOfLinearScalarConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_SequenceOfLinearScalarConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_SequenceOfLinearXYZConstraint;
class Plate_SequenceOfLinearXYZConstraint : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Plate_SequenceOfLinearXYZConstraint;
		 Plate_SequenceOfLinearXYZConstraint ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfLinearXYZConstraint &
	:rtype: Plate_SequenceOfLinearXYZConstraint
") Assign;
		const Plate_SequenceOfLinearXYZConstraint & Assign (const Plate_SequenceOfLinearXYZConstraint & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfLinearXYZConstraint &
	:rtype: Plate_SequenceOfLinearXYZConstraint
") operator=;
		const Plate_SequenceOfLinearXYZConstraint & operator = (const Plate_SequenceOfLinearXYZConstraint & Other);
		%feature("autodoc", "	:param T:
	:type T: Plate_LinearXYZConstraint &
	:rtype: None
") Append;
		void Append (const Plate_LinearXYZConstraint & T);
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") Append;
		void Append (Plate_SequenceOfLinearXYZConstraint & S);
		%feature("autodoc", "	:param T:
	:type T: Plate_LinearXYZConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Plate_LinearXYZConstraint & T);
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") Prepend;
		void Prepend (Plate_SequenceOfLinearXYZConstraint & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Plate_LinearXYZConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Plate_LinearXYZConstraint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Plate_SequenceOfLinearXYZConstraint & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Plate_LinearXYZConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Plate_LinearXYZConstraint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Plate_SequenceOfLinearXYZConstraint & S);
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") First;
		const Plate_LinearXYZConstraint & First ();
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") Last;
		const Plate_LinearXYZConstraint & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Plate_SequenceOfLinearXYZConstraint & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_LinearXYZConstraint
") Value;
		const Plate_LinearXYZConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Plate_LinearXYZConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_LinearXYZConstraint & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_LinearXYZConstraint
") ChangeValue;
		Plate_LinearXYZConstraint & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Plate_SequenceOfLinearXYZConstraint::~Plate_SequenceOfLinearXYZConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_SequenceOfLinearXYZConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Plate_SequenceOfPinpointConstraint;
class Plate_SequenceOfPinpointConstraint : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Plate_SequenceOfPinpointConstraint;
		 Plate_SequenceOfPinpointConstraint ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfPinpointConstraint &
	:rtype: Plate_SequenceOfPinpointConstraint
") Assign;
		const Plate_SequenceOfPinpointConstraint & Assign (const Plate_SequenceOfPinpointConstraint & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfPinpointConstraint &
	:rtype: Plate_SequenceOfPinpointConstraint
") operator=;
		const Plate_SequenceOfPinpointConstraint & operator = (const Plate_SequenceOfPinpointConstraint & Other);
		%feature("autodoc", "	:param T:
	:type T: Plate_PinpointConstraint &
	:rtype: None
") Append;
		void Append (const Plate_PinpointConstraint & T);
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") Append;
		void Append (Plate_SequenceOfPinpointConstraint & S);
		%feature("autodoc", "	:param T:
	:type T: Plate_PinpointConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Plate_PinpointConstraint & T);
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") Prepend;
		void Prepend (Plate_SequenceOfPinpointConstraint & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Plate_PinpointConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Plate_PinpointConstraint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Plate_SequenceOfPinpointConstraint & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Plate_PinpointConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Plate_PinpointConstraint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Plate_SequenceOfPinpointConstraint & S);
		%feature("autodoc", "	:rtype: Plate_PinpointConstraint
") First;
		const Plate_PinpointConstraint & First ();
		%feature("autodoc", "	:rtype: Plate_PinpointConstraint
") Last;
		const Plate_PinpointConstraint & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Plate_SequenceOfPinpointConstraint & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_PinpointConstraint
") Value;
		const Plate_PinpointConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Plate_PinpointConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_PinpointConstraint & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Plate_PinpointConstraint
") ChangeValue;
		Plate_PinpointConstraint & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Plate_SequenceOfPinpointConstraint::~Plate_SequenceOfPinpointConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Plate_SequenceOfPinpointConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
