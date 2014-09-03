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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Plate_Array1OfPinpointConstraint;
		 Plate_Array1OfPinpointConstraint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Plate_PinpointConstraint)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Plate_Array1OfPinpointConstraint;
		 Plate_Array1OfPinpointConstraint (const Plate_PinpointConstraint & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Plate_PinpointConstraint & V);
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
	Other(Plate_Array1OfPinpointConstraint)

Returns:
	Plate_Array1OfPinpointConstraint

No detailed docstring for this function.") Assign;
		const Plate_Array1OfPinpointConstraint & Assign (const Plate_Array1OfPinpointConstraint & Other);
		%feature("autodoc", "Args:
	Other(Plate_Array1OfPinpointConstraint)

Returns:
	Plate_Array1OfPinpointConstraint

No detailed docstring for this function.") operator=;
		const Plate_Array1OfPinpointConstraint & operator = (const Plate_Array1OfPinpointConstraint & Other);
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
	Value(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") Value;
		const Plate_PinpointConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	du(gp_XYZ)
	dv(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Plate_D1;
		 Plate_D1 (const gp_XYZ & du,const gp_XYZ & dv);
		%feature("autodoc", "Args:
	ref(Plate_D1)

Returns:
	None

No detailed docstring for this function.") Plate_D1;
		 Plate_D1 (const Plate_D1 & ref);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") DU;
		const gp_XYZ & DU ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") DV;
		const gp_XYZ & DV ();
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
		%feature("autodoc", "Args:
	duu(gp_XYZ)
	duv(gp_XYZ)
	dvv(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Plate_D2;
		 Plate_D2 (const gp_XYZ & duu,const gp_XYZ & duv,const gp_XYZ & dvv);
		%feature("autodoc", "Args:
	ref(Plate_D2)

Returns:
	None

No detailed docstring for this function.") Plate_D2;
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
		%feature("autodoc", "Args:
	duuu(gp_XYZ)
	duuv(gp_XYZ)
	duvv(gp_XYZ)
	dvvv(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Plate_D3;
		 Plate_D3 (const gp_XYZ & duuu,const gp_XYZ & duuv,const gp_XYZ & duvv,const gp_XYZ & dvvv);
		%feature("autodoc", "Args:
	ref(Plate_D3)

Returns:
	None

No detailed docstring for this function.") Plate_D3;
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
		%feature("autodoc", "Args:
	point2d(gp_XY)
	D1S(Plate_D1)
	D1T(Plate_D1)
	IncrementalLoad(Standard_Real)=1.0
	orientation(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);
		%feature("autodoc", "Args:
	point2d(gp_XY)
	D1S(Plate_D1)
	D1T(Plate_D1)
	D2S(Plate_D2)
	D2T(Plate_D2)
	IncrementalLoad(Standard_Real)=1.0
	orientation(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);
		%feature("autodoc", "Args:
	point2d(gp_XY)
	D1S(Plate_D1)
	D1T(Plate_D1)
	D2S(Plate_D2)
	D2T(Plate_D2)
	D3S(Plate_D3)
	D3T(Plate_D3)
	IncrementalLoad(Standard_Real)=1.0
	orientation(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Plate_D3 & D3S,const Plate_D3 & D3T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") nb_PPC;
		const Standard_Integer & nb_PPC ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") GetPPC;
		const Plate_PinpointConstraint & GetPPC (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") nb_LSC;
		const Standard_Integer & nb_LSC ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_LinearScalarConstraint

No detailed docstring for this function.") LSC;
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
		%feature("autodoc", "Args:
	SOfXY(TColgp_SequenceOfXY)

Returns:
	None

No detailed docstring for this function.") Plate_GlobalTranslationConstraint;
		 Plate_GlobalTranslationConstraint (const TColgp_SequenceOfXY & SOfXY);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_LinearXYZConstraint

No detailed docstring for this function.") LXYZC;
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
		%feature("autodoc", "Args:
	ref(Plate_GtoCConstraint)

Returns:
	None

No detailed docstring for this function.") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const Plate_GtoCConstraint & ref);
		%feature("autodoc", "Args:
	point2d(gp_XY)
	D1S(Plate_D1)
	D1T(Plate_D1)

Returns:
	None

No detailed docstring for this function.") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T);
		%feature("autodoc", "Args:
	point2d(gp_XY)
	D1S(Plate_D1)
	D1T(Plate_D1)
	nP(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const gp_XYZ & nP);
		%feature("autodoc", "Args:
	point2d(gp_XY)
	D1S(Plate_D1)
	D1T(Plate_D1)
	D2S(Plate_D2)
	D2T(Plate_D2)

Returns:
	None

No detailed docstring for this function.") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T);
		%feature("autodoc", "Args:
	point2d(gp_XY)
	D1S(Plate_D1)
	D1T(Plate_D1)
	D2S(Plate_D2)
	D2T(Plate_D2)
	nP(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const gp_XYZ & nP);
		%feature("autodoc", "Args:
	point2d(gp_XY)
	D1S(Plate_D1)
	D1T(Plate_D1)
	D2S(Plate_D2)
	D2T(Plate_D2)
	D3S(Plate_D3)
	D3T(Plate_D3)

Returns:
	None

No detailed docstring for this function.") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Plate_D3 & D3S,const Plate_D3 & D3T);
		%feature("autodoc", "Args:
	point2d(gp_XY)
	D1S(Plate_D1)
	D1T(Plate_D1)
	D2S(Plate_D2)
	D2T(Plate_D2)
	D3S(Plate_D3)
	D3T(Plate_D3)
	nP(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Plate_D3 & D3S,const Plate_D3 & D3T,const gp_XYZ & nP);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") nb_PPC;
		const Standard_Integer & nb_PPC ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") GetPPC;
		const Plate_PinpointConstraint & GetPPC (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_D1

No detailed docstring for this function.") D1SurfInit;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Plate_HArray1OfPinpointConstraint;
		 Plate_HArray1OfPinpointConstraint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") Plate_HArray1OfPinpointConstraint;
		 Plate_HArray1OfPinpointConstraint (const Standard_Integer Low,const Standard_Integer Up,const Plate_PinpointConstraint & V);
		%feature("autodoc", "Args:
	V(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Plate_PinpointConstraint & V);
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
	Value(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") Value;
		const Plate_PinpointConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") ChangeValue;
		Plate_PinpointConstraint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_Array1OfPinpointConstraint

No detailed docstring for this function.") Array1;
		const Plate_Array1OfPinpointConstraint & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Plate_Array1OfPinpointConstraint

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	point2d(gp_XY)
	lin(gp_Lin)
	iu(Standard_Integer)=0
	iv(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Plate_LineConstraint;
		 Plate_LineConstraint (const gp_XY & point2d,const gp_Lin & lin,const Standard_Integer iu = 0,const Standard_Integer iv = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_LinearScalarConstraint

No detailed docstring for this function.") LSC;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint ();
		%feature("autodoc", "Args:
	PPC1(Plate_PinpointConstraint)
	coeff(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_PinpointConstraint & PPC1,const gp_XYZ & coeff);
		%feature("autodoc", "Args:
	ppc(Plate_Array1OfPinpointConstraint)
	coeff(TColgp_Array1OfXYZ)

Returns:
	None

No detailed docstring for this function.") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColgp_Array1OfXYZ & coeff);
		%feature("autodoc", "Args:
	ppc(Plate_Array1OfPinpointConstraint)
	coeff(TColgp_Array2OfXYZ)

Returns:
	None

No detailed docstring for this function.") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColgp_Array2OfXYZ & coeff);
		%feature("autodoc", "Args:
	ColLen(Standard_Integer)
	RowLen(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Standard_Integer ColLen,const Standard_Integer RowLen);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_Array1OfPinpointConstraint

No detailed docstring for this function.") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array2OfXYZ

No detailed docstring for this function.") Coeff;
		const TColgp_Array2OfXYZ & Coeff ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Plate_PinpointConstraint)

Returns:
	None

Sets   the PinPointConstraint of   index Index to  
         Value raise if Index is greater than the length of  
         ppc or the Row length of coeff or lower  than 1") SetPPC;
		void SetPPC (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(gp_XYZ)

Returns:
	None

Sets the coeff  of index (Row,Col)  to Value  
          raise if  Row (respectively Col)  is greater than the  
         Row (respectively Column) length of coeff") SetCoeff;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint ();
		%feature("autodoc", "Args:
	ppc(Plate_Array1OfPinpointConstraint)
	coeff(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColStd_Array1OfReal & coeff);
		%feature("autodoc", "Args:
	ppc(Plate_Array1OfPinpointConstraint)
	coeff(TColStd_Array2OfReal)

Returns:
	None

No detailed docstring for this function.") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColStd_Array2OfReal & coeff);
		%feature("autodoc", "Args:
	ColLen(Standard_Integer)
	RowLen(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Standard_Integer ColLen,const Standard_Integer RowLen);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_Array1OfPinpointConstraint

No detailed docstring for this function.") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfReal

No detailed docstring for this function.") Coeff;
		const TColStd_Array2OfReal & Coeff ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Plate_PinpointConstraint)

Returns:
	None

Sets   the PinPointConstraint of   index Index to  
         Value raise if Index is greater than the length of  
         ppc or the Row length of coeff or lower  than 1") SetPPC;
		void SetPPC (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Real)

Returns:
	None

Sets the coeff  of index (Row,Col)  to Value  
          raise if  Row (respectively Col)  is greater than the  
         Row (respectively Column) length of coeff") SetCoeff;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Plate_PinpointConstraint;
		 Plate_PinpointConstraint ();
		%feature("autodoc", "Args:
	point2d(gp_XY)
	ImposedValue(gp_XYZ)
	iu(Standard_Integer)=0
	iv(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Plate_PinpointConstraint;
		 Plate_PinpointConstraint (const gp_XY & point2d,const gp_XYZ & ImposedValue,const Standard_Integer iu = 0,const Standard_Integer iv = 0);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") Pnt2d;
		const gp_XY & Pnt2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Idu;
		const Standard_Integer & Idu ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Idv;
		const Standard_Integer & Idv ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") Value;
		const gp_XYZ & Value ();
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
		%feature("autodoc", "Args:
	point2d(gp_XY)
	pln(gp_Pln)
	iu(Standard_Integer)=0
	iv(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Plate_PlaneConstraint;
		 Plate_PlaneConstraint (const gp_XY & point2d,const gp_Pln & pln,const Standard_Integer iu = 0,const Standard_Integer iv = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_LinearScalarConstraint

No detailed docstring for this function.") LSC;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Plate_Plate;
		 Plate_Plate ();
		%feature("autodoc", "Args:
	Ref(Plate_Plate)

Returns:
	None

No detailed docstring for this function.") Plate_Plate;
		 Plate_Plate (const Plate_Plate & Ref);
		%feature("autodoc", "Args:
	Ref(Plate_Plate)

Returns:
	Plate_Plate

No detailed docstring for this function.") Copy;
		Plate_Plate & Copy (const Plate_Plate & Ref);
		%feature("autodoc", "Args:
	Ref(Plate_Plate)

Returns:
	Plate_Plate

No detailed docstring for this function.") operator=;
		Plate_Plate & operator = (const Plate_Plate & Ref);
		%feature("autodoc", "Args:
	PConst(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Plate_PinpointConstraint & PConst);
		%feature("autodoc", "Args:
	LXYZConst(Plate_LinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Plate_LinearXYZConstraint & LXYZConst);
		%feature("autodoc", "Args:
	LScalarConst(Plate_LinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Plate_LinearScalarConstraint & LScalarConst);
		%feature("autodoc", "Args:
	GTConst(Plate_GlobalTranslationConstraint)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Plate_GlobalTranslationConstraint & GTConst);
		%feature("autodoc", "Args:
	LConst(Plate_LineConstraint)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Plate_LineConstraint & LConst);
		%feature("autodoc", "Args:
	PConst(Plate_PlaneConstraint)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Plate_PlaneConstraint & PConst);
		%feature("autodoc", "Args:
	SCConst(Plate_SampledCurveConstraint)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Plate_SampledCurveConstraint & SCConst);
		%feature("autodoc", "Args:
	GtoCConst(Plate_GtoCConstraint)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Plate_GtoCConstraint & GtoCConst);
		%feature("autodoc", "Args:
	FGtoCConst(Plate_FreeGtoCConstraint)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Plate_FreeGtoCConstraint & FGtoCConst);
		%feature("autodoc", "Args:
	ord(Standard_Integer)=4
	anisotropie(Standard_Real)=1.0

Returns:
	None

No detailed docstring for this function.") SolveTI;
		void SolveTI (const Standard_Integer ord = 4,const Standard_Real anisotropie = 1.0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if all has been correctly done.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") destroy;
		void destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	None

reset the Plate in the initial state  
          ( same as after Create())") Init;
		void Init ();
		%feature("autodoc", "Args:
	point2d(gp_XY)

Returns:
	gp_XYZ

No detailed docstring for this function.") Evaluate;
		gp_XYZ Evaluate (const gp_XY & point2d);
		%feature("autodoc", "Args:
	point2d(gp_XY)
	iu(Standard_Integer)
	iv(Standard_Integer)

Returns:
	gp_XYZ

No detailed docstring for this function.") EvaluateDerivative;
		gp_XYZ EvaluateDerivative (const gp_XY & point2d,const Standard_Integer iu,const Standard_Integer iv);
		%feature("autodoc", "Args:
	Coefs(Handle_TColgp_HArray2OfXYZ)

Returns:
	None

No detailed docstring for this function.") CoefPol;
		void CoefPol (Handle_TColgp_HArray2OfXYZ & Coefs);
		%feature("autodoc", "Args:
	PPOnly(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetPolynomialPartOnly;
		void SetPolynomialPartOnly (const Standard_Boolean PPOnly = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Continuity;
		Standard_Integer Continuity ();
		%feature("autodoc", "Args:
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

No detailed docstring for this function.") UVBox;
		void UVBox (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Seq(TColgp_SequenceOfXY)

Returns:
	None

No detailed docstring for this function.") UVConstraints;
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
		%feature("autodoc", "Args:
	SOPPC(Plate_SequenceOfPinpointConstraint)
	n(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Plate_SampledCurveConstraint;
		 Plate_SampledCurveConstraint (const Plate_SequenceOfPinpointConstraint & SOPPC,const Standard_Integer n);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_LinearXYZConstraint

No detailed docstring for this function.") LXYZC;
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
		%feature("autodoc", "Args:
	I(Plate_LinearScalarConstraint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Plate_SequenceNodeOfSequenceOfLinearScalarConstraint;
		 Plate_SequenceNodeOfSequenceOfLinearScalarConstraint (const Plate_LinearScalarConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_LinearScalarConstraint

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Plate_LinearXYZConstraint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Plate_SequenceNodeOfSequenceOfLinearXYZConstraint;
		 Plate_SequenceNodeOfSequenceOfLinearXYZConstraint (const Plate_LinearXYZConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_LinearXYZConstraint

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Plate_PinpointConstraint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Plate_SequenceNodeOfSequenceOfPinpointConstraint;
		 Plate_SequenceNodeOfSequenceOfPinpointConstraint (const Plate_PinpointConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Plate_SequenceOfLinearScalarConstraint;
		 Plate_SequenceOfLinearScalarConstraint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Plate_SequenceOfLinearScalarConstraint)

Returns:
	Plate_SequenceOfLinearScalarConstraint

No detailed docstring for this function.") Assign;
		const Plate_SequenceOfLinearScalarConstraint & Assign (const Plate_SequenceOfLinearScalarConstraint & Other);
		%feature("autodoc", "Args:
	Other(Plate_SequenceOfLinearScalarConstraint)

Returns:
	Plate_SequenceOfLinearScalarConstraint

No detailed docstring for this function.") operator=;
		const Plate_SequenceOfLinearScalarConstraint & operator = (const Plate_SequenceOfLinearScalarConstraint & Other);
		%feature("autodoc", "Args:
	T(Plate_LinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Plate_LinearScalarConstraint & T);
		%feature("autodoc", "Args:
	S(Plate_SequenceOfLinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Plate_SequenceOfLinearScalarConstraint & S);
		%feature("autodoc", "Args:
	T(Plate_LinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Plate_LinearScalarConstraint & T);
		%feature("autodoc", "Args:
	S(Plate_SequenceOfLinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Plate_SequenceOfLinearScalarConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Plate_LinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Plate_LinearScalarConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Plate_SequenceOfLinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Plate_SequenceOfLinearScalarConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Plate_LinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Plate_LinearScalarConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Plate_SequenceOfLinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Plate_SequenceOfLinearScalarConstraint & S);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_LinearScalarConstraint

No detailed docstring for this function.") First;
		const Plate_LinearScalarConstraint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Plate_LinearScalarConstraint

No detailed docstring for this function.") Last;
		const Plate_LinearScalarConstraint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Plate_SequenceOfLinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Plate_SequenceOfLinearScalarConstraint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_LinearScalarConstraint

No detailed docstring for this function.") Value;
		const Plate_LinearScalarConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Plate_LinearScalarConstraint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_LinearScalarConstraint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_LinearScalarConstraint

No detailed docstring for this function.") ChangeValue;
		Plate_LinearScalarConstraint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Plate_SequenceOfLinearXYZConstraint;
		 Plate_SequenceOfLinearXYZConstraint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Plate_SequenceOfLinearXYZConstraint)

Returns:
	Plate_SequenceOfLinearXYZConstraint

No detailed docstring for this function.") Assign;
		const Plate_SequenceOfLinearXYZConstraint & Assign (const Plate_SequenceOfLinearXYZConstraint & Other);
		%feature("autodoc", "Args:
	Other(Plate_SequenceOfLinearXYZConstraint)

Returns:
	Plate_SequenceOfLinearXYZConstraint

No detailed docstring for this function.") operator=;
		const Plate_SequenceOfLinearXYZConstraint & operator = (const Plate_SequenceOfLinearXYZConstraint & Other);
		%feature("autodoc", "Args:
	T(Plate_LinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Plate_LinearXYZConstraint & T);
		%feature("autodoc", "Args:
	S(Plate_SequenceOfLinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Plate_SequenceOfLinearXYZConstraint & S);
		%feature("autodoc", "Args:
	T(Plate_LinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Plate_LinearXYZConstraint & T);
		%feature("autodoc", "Args:
	S(Plate_SequenceOfLinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Plate_SequenceOfLinearXYZConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Plate_LinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Plate_LinearXYZConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Plate_SequenceOfLinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Plate_SequenceOfLinearXYZConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Plate_LinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Plate_LinearXYZConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Plate_SequenceOfLinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Plate_SequenceOfLinearXYZConstraint & S);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_LinearXYZConstraint

No detailed docstring for this function.") First;
		const Plate_LinearXYZConstraint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Plate_LinearXYZConstraint

No detailed docstring for this function.") Last;
		const Plate_LinearXYZConstraint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Plate_SequenceOfLinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Plate_SequenceOfLinearXYZConstraint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_LinearXYZConstraint

No detailed docstring for this function.") Value;
		const Plate_LinearXYZConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Plate_LinearXYZConstraint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_LinearXYZConstraint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_LinearXYZConstraint

No detailed docstring for this function.") ChangeValue;
		Plate_LinearXYZConstraint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Plate_SequenceOfPinpointConstraint;
		 Plate_SequenceOfPinpointConstraint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Plate_SequenceOfPinpointConstraint)

Returns:
	Plate_SequenceOfPinpointConstraint

No detailed docstring for this function.") Assign;
		const Plate_SequenceOfPinpointConstraint & Assign (const Plate_SequenceOfPinpointConstraint & Other);
		%feature("autodoc", "Args:
	Other(Plate_SequenceOfPinpointConstraint)

Returns:
	Plate_SequenceOfPinpointConstraint

No detailed docstring for this function.") operator=;
		const Plate_SequenceOfPinpointConstraint & operator = (const Plate_SequenceOfPinpointConstraint & Other);
		%feature("autodoc", "Args:
	T(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Plate_PinpointConstraint & T);
		%feature("autodoc", "Args:
	S(Plate_SequenceOfPinpointConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Plate_SequenceOfPinpointConstraint & S);
		%feature("autodoc", "Args:
	T(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Plate_PinpointConstraint & T);
		%feature("autodoc", "Args:
	S(Plate_SequenceOfPinpointConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Plate_SequenceOfPinpointConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Plate_PinpointConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Plate_SequenceOfPinpointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Plate_SequenceOfPinpointConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Plate_PinpointConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Plate_SequenceOfPinpointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Plate_SequenceOfPinpointConstraint & S);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") First;
		const Plate_PinpointConstraint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") Last;
		const Plate_PinpointConstraint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Plate_SequenceOfPinpointConstraint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Plate_SequenceOfPinpointConstraint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") Value;
		const Plate_PinpointConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Plate_PinpointConstraint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_PinpointConstraint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Plate_PinpointConstraint

No detailed docstring for this function.") ChangeValue;
		Plate_PinpointConstraint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
