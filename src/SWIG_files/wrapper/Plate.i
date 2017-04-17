/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include Plate_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Plate_Array1OfPinpointConstraint;
class Plate_Array1OfPinpointConstraint {
	public:
		%feature("compactdefaultargs") Plate_Array1OfPinpointConstraint;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Plate_Array1OfPinpointConstraint;
		 Plate_Array1OfPinpointConstraint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Plate_Array1OfPinpointConstraint;
		%feature("autodoc", "	:param Item:
	:type Item: Plate_PinpointConstraint &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Plate_Array1OfPinpointConstraint;
		 Plate_Array1OfPinpointConstraint (const Plate_PinpointConstraint & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Plate_PinpointConstraint &
	:rtype: None
") Init;
		void Init (const Plate_PinpointConstraint & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_Array1OfPinpointConstraint &
	:rtype: Plate_Array1OfPinpointConstraint
") Assign;
		const Plate_Array1OfPinpointConstraint & Assign (const Plate_Array1OfPinpointConstraint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_Array1OfPinpointConstraint &
	:rtype: Plate_Array1OfPinpointConstraint
") operator =;
		const Plate_Array1OfPinpointConstraint & operator = (const Plate_Array1OfPinpointConstraint & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Plate_PinpointConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint
") Value;
		const Plate_PinpointConstraint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint
") ChangeValue;
		Plate_PinpointConstraint & ChangeValue (const Standard_Integer Index);
};


%extend Plate_Array1OfPinpointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_D1;
class Plate_D1 {
	public:
		%feature("compactdefaultargs") Plate_D1;
		%feature("autodoc", "	:param du:
	:type du: gp_XYZ
	:param dv:
	:type dv: gp_XYZ
	:rtype: None
") Plate_D1;
		 Plate_D1 (const gp_XYZ & du,const gp_XYZ & dv);
		%feature("compactdefaultargs") Plate_D1;
		%feature("autodoc", "	:param ref:
	:type ref: Plate_D1 &
	:rtype: None
") Plate_D1;
		 Plate_D1 (const Plate_D1 & ref);
		%feature("compactdefaultargs") DU;
		%feature("autodoc", "	:rtype: gp_XYZ
") DU;
		const gp_XYZ  DU ();
		%feature("compactdefaultargs") DV;
		%feature("autodoc", "	:rtype: gp_XYZ
") DV;
		const gp_XYZ  DV ();
};


%extend Plate_D1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_D2;
class Plate_D2 {
	public:
		%feature("compactdefaultargs") Plate_D2;
		%feature("autodoc", "	:param duu:
	:type duu: gp_XYZ
	:param duv:
	:type duv: gp_XYZ
	:param dvv:
	:type dvv: gp_XYZ
	:rtype: None
") Plate_D2;
		 Plate_D2 (const gp_XYZ & duu,const gp_XYZ & duv,const gp_XYZ & dvv);
		%feature("compactdefaultargs") Plate_D2;
		%feature("autodoc", "	:param ref:
	:type ref: Plate_D2 &
	:rtype: None
") Plate_D2;
		 Plate_D2 (const Plate_D2 & ref);
};


%extend Plate_D2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_D3;
class Plate_D3 {
	public:
		%feature("compactdefaultargs") Plate_D3;
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
		%feature("compactdefaultargs") Plate_D3;
		%feature("autodoc", "	:param ref:
	:type ref: Plate_D3 &
	:rtype: None
") Plate_D3;
		 Plate_D3 (const Plate_D3 & ref);
};


%extend Plate_D3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_FreeGtoCConstraint;
class Plate_FreeGtoCConstraint {
	public:
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:param IncrementalLoad: default value is 1.0
	:type IncrementalLoad: float
	:param orientation: default value is 0
	:type orientation: int
	:rtype: None
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
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
	:type orientation: int
	:rtype: None
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
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
	:type orientation: int
	:rtype: None
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Plate_D3 & D3S,const Plate_D3 & D3T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);
		%feature("compactdefaultargs") nb_PPC;
		%feature("autodoc", "	:rtype: int
") nb_PPC;
		const Standard_Integer & nb_PPC ();
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint
") GetPPC;
		const Plate_PinpointConstraint & GetPPC (const Standard_Integer Index);
		%feature("compactdefaultargs") nb_LSC;
		%feature("autodoc", "	:rtype: int
") nb_LSC;
		const Standard_Integer & nb_LSC ();
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC (const Standard_Integer Index);
};


%extend Plate_FreeGtoCConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_GlobalTranslationConstraint;
class Plate_GlobalTranslationConstraint {
	public:
		%feature("compactdefaultargs") Plate_GlobalTranslationConstraint;
		%feature("autodoc", "	:param SOfXY:
	:type SOfXY: TColgp_SequenceOfXY
	:rtype: None
") Plate_GlobalTranslationConstraint;
		 Plate_GlobalTranslationConstraint (const TColgp_SequenceOfXY & SOfXY);
		%feature("compactdefaultargs") LXYZC;
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC ();
};


%extend Plate_GlobalTranslationConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_GtoCConstraint;
class Plate_GtoCConstraint {
	public:
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "	:param ref:
	:type ref: Plate_GtoCConstraint &
	:rtype: None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const Plate_GtoCConstraint & ref);
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1 &
	:param D1T:
	:type D1T: Plate_D1 &
	:rtype: None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T);
		%feature("compactdefaultargs") Plate_GtoCConstraint;
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
		%feature("compactdefaultargs") Plate_GtoCConstraint;
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
		%feature("compactdefaultargs") Plate_GtoCConstraint;
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
		%feature("compactdefaultargs") Plate_GtoCConstraint;
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
		%feature("compactdefaultargs") Plate_GtoCConstraint;
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
		%feature("compactdefaultargs") nb_PPC;
		%feature("autodoc", "	:rtype: int
") nb_PPC;
		const Standard_Integer & nb_PPC ();
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint
") GetPPC;
		const Plate_PinpointConstraint & GetPPC (const Standard_Integer Index);
		%feature("compactdefaultargs") D1SurfInit;
		%feature("autodoc", "	:rtype: Plate_D1
") D1SurfInit;
		const Plate_D1 & D1SurfInit ();
};


%extend Plate_GtoCConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_HArray1OfPinpointConstraint;
class Plate_HArray1OfPinpointConstraint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Plate_HArray1OfPinpointConstraint;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Plate_HArray1OfPinpointConstraint;
		 Plate_HArray1OfPinpointConstraint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Plate_HArray1OfPinpointConstraint;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Plate_PinpointConstraint &
	:rtype: None
") Plate_HArray1OfPinpointConstraint;
		 Plate_HArray1OfPinpointConstraint (const Standard_Integer Low,const Standard_Integer Up,const Plate_PinpointConstraint & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Plate_PinpointConstraint &
	:rtype: None
") Init;
		void Init (const Plate_PinpointConstraint & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Plate_PinpointConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint
") Value;
		const Plate_PinpointConstraint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint
") ChangeValue;
		Plate_PinpointConstraint & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: Plate_Array1OfPinpointConstraint
") Array1;
		const Plate_Array1OfPinpointConstraint & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: Plate_Array1OfPinpointConstraint
") ChangeArray1;
		Plate_Array1OfPinpointConstraint & ChangeArray1 ();
};


%extend Plate_HArray1OfPinpointConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Plate_HArray1OfPinpointConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Plate_HArray1OfPinpointConstraint::Handle_Plate_HArray1OfPinpointConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Plate_HArray1OfPinpointConstraint* _get_reference() {
    return (Plate_HArray1OfPinpointConstraint*)$self->Access();
    }
};

%extend Handle_Plate_HArray1OfPinpointConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Plate_HArray1OfPinpointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_LineConstraint;
class Plate_LineConstraint {
	public:
		%feature("compactdefaultargs") Plate_LineConstraint;
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param lin:
	:type lin: gp_Lin
	:param iu: default value is 0
	:type iu: int
	:param iv: default value is 0
	:type iv: int
	:rtype: None
") Plate_LineConstraint;
		 Plate_LineConstraint (const gp_XY & point2d,const gp_Lin & lin,const Standard_Integer iu = 0,const Standard_Integer iv = 0);
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC ();
};


%extend Plate_LineConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_LinearScalarConstraint;
class Plate_LinearScalarConstraint {
	public:
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint ();
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "	:param PPC1:
	:type PPC1: Plate_PinpointConstraint &
	:param coeff:
	:type coeff: gp_XYZ
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_PinpointConstraint & PPC1,const gp_XYZ & coeff);
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "	:param ppc:
	:type ppc: Plate_Array1OfPinpointConstraint &
	:param coeff:
	:type coeff: TColgp_Array1OfXYZ
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColgp_Array1OfXYZ & coeff);
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "	:param ppc:
	:type ppc: Plate_Array1OfPinpointConstraint &
	:param coeff:
	:type coeff: TColgp_Array2OfXYZ
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColgp_Array2OfXYZ & coeff);
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "	:param ColLen:
	:type ColLen: int
	:param RowLen:
	:type RowLen: int
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Standard_Integer ColLen,const Standard_Integer RowLen);
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "	:rtype: Plate_Array1OfPinpointConstraint
") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC ();
		%feature("compactdefaultargs") Coeff;
		%feature("autodoc", "	:rtype: TColgp_Array2OfXYZ
") Coeff;
		const TColgp_Array2OfXYZ & Coeff ();
		%feature("compactdefaultargs") SetPPC;
		%feature("autodoc", "	* Sets the PinPointConstraint of index Index to Value raise if Index is greater than the length of ppc or the Row length of coeff or lower than 1

	:param Index:
	:type Index: int
	:param Value:
	:type Value: Plate_PinpointConstraint &
	:rtype: None
") SetPPC;
		void SetPPC (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("compactdefaultargs") SetCoeff;
		%feature("autodoc", "	* Sets the coeff of index (Row,Col) to Value raise if Row (respectively Col) is greater than the Row (respectively Column) length of coeff

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: gp_XYZ
	:rtype: None
") SetCoeff;
		void SetCoeff (const Standard_Integer Row,const Standard_Integer Col,const gp_XYZ & Value);
};


%extend Plate_LinearScalarConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_LinearXYZConstraint;
class Plate_LinearXYZConstraint {
	public:
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint ();
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "	:param ppc:
	:type ppc: Plate_Array1OfPinpointConstraint &
	:param coeff:
	:type coeff: TColStd_Array1OfReal &
	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColStd_Array1OfReal & coeff);
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "	:param ppc:
	:type ppc: Plate_Array1OfPinpointConstraint &
	:param coeff:
	:type coeff: TColStd_Array2OfReal &
	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Plate_Array1OfPinpointConstraint & ppc,const TColStd_Array2OfReal & coeff);
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "	:param ColLen:
	:type ColLen: int
	:param RowLen:
	:type RowLen: int
	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Standard_Integer ColLen,const Standard_Integer RowLen);
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "	:rtype: Plate_Array1OfPinpointConstraint
") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC ();
		%feature("compactdefaultargs") Coeff;
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") Coeff;
		const TColStd_Array2OfReal & Coeff ();
		%feature("compactdefaultargs") SetPPC;
		%feature("autodoc", "	* Sets the PinPointConstraint of index Index to Value raise if Index is greater than the length of ppc or the Row length of coeff or lower than 1

	:param Index:
	:type Index: int
	:param Value:
	:type Value: Plate_PinpointConstraint &
	:rtype: None
") SetPPC;
		void SetPPC (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
		%feature("compactdefaultargs") SetCoeff;
		%feature("autodoc", "	* Sets the coeff of index (Row,Col) to Value raise if Row (respectively Col) is greater than the Row (respectively Column) length of coeff

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float
	:rtype: None
") SetCoeff;
		void SetCoeff (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);
};


%extend Plate_LinearXYZConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_PinpointConstraint;
class Plate_PinpointConstraint {
	public:
		%feature("compactdefaultargs") Plate_PinpointConstraint;
		%feature("autodoc", "	:rtype: None
") Plate_PinpointConstraint;
		 Plate_PinpointConstraint ();
		%feature("compactdefaultargs") Plate_PinpointConstraint;
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param ImposedValue:
	:type ImposedValue: gp_XYZ
	:param iu: default value is 0
	:type iu: int
	:param iv: default value is 0
	:type iv: int
	:rtype: None
") Plate_PinpointConstraint;
		 Plate_PinpointConstraint (const gp_XY & point2d,const gp_XYZ & ImposedValue,const Standard_Integer iu = 0,const Standard_Integer iv = 0);
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "	:rtype: gp_XY
") Pnt2d;
		const gp_XY  Pnt2d ();
		%feature("compactdefaultargs") Idu;
		%feature("autodoc", "	:rtype: int
") Idu;
		const Standard_Integer & Idu ();
		%feature("compactdefaultargs") Idv;
		%feature("autodoc", "	:rtype: int
") Idv;
		const Standard_Integer & Idv ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_XYZ
") Value;
		const gp_XYZ  Value ();
};


%extend Plate_PinpointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_PlaneConstraint;
class Plate_PlaneConstraint {
	public:
		%feature("compactdefaultargs") Plate_PlaneConstraint;
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param pln:
	:type pln: gp_Pln
	:param iu: default value is 0
	:type iu: int
	:param iv: default value is 0
	:type iv: int
	:rtype: None
") Plate_PlaneConstraint;
		 Plate_PlaneConstraint (const gp_XY & point2d,const gp_Pln & pln,const Standard_Integer iu = 0,const Standard_Integer iv = 0);
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC ();
};


%extend Plate_PlaneConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_Plate;
class Plate_Plate {
	public:
		%feature("compactdefaultargs") Plate_Plate;
		%feature("autodoc", "	:rtype: None
") Plate_Plate;
		 Plate_Plate ();
		%feature("compactdefaultargs") Plate_Plate;
		%feature("autodoc", "	:param Ref:
	:type Ref: Plate_Plate &
	:rtype: None
") Plate_Plate;
		 Plate_Plate (const Plate_Plate & Ref);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:param Ref:
	:type Ref: Plate_Plate &
	:rtype: Plate_Plate
") Copy;
		Plate_Plate & Copy (const Plate_Plate & Ref);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Ref:
	:type Ref: Plate_Plate &
	:rtype: Plate_Plate
") operator =;
		Plate_Plate & operator = (const Plate_Plate & Ref);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param PConst:
	:type PConst: Plate_PinpointConstraint &
	:rtype: None
") Load;
		void Load (const Plate_PinpointConstraint & PConst);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param LXYZConst:
	:type LXYZConst: Plate_LinearXYZConstraint &
	:rtype: None
") Load;
		void Load (const Plate_LinearXYZConstraint & LXYZConst);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param LScalarConst:
	:type LScalarConst: Plate_LinearScalarConstraint &
	:rtype: None
") Load;
		void Load (const Plate_LinearScalarConstraint & LScalarConst);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param GTConst:
	:type GTConst: Plate_GlobalTranslationConstraint &
	:rtype: None
") Load;
		void Load (const Plate_GlobalTranslationConstraint & GTConst);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param LConst:
	:type LConst: Plate_LineConstraint &
	:rtype: None
") Load;
		void Load (const Plate_LineConstraint & LConst);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param PConst:
	:type PConst: Plate_PlaneConstraint &
	:rtype: None
") Load;
		void Load (const Plate_PlaneConstraint & PConst);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param SCConst:
	:type SCConst: Plate_SampledCurveConstraint &
	:rtype: None
") Load;
		void Load (const Plate_SampledCurveConstraint & SCConst);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param GtoCConst:
	:type GtoCConst: Plate_GtoCConstraint &
	:rtype: None
") Load;
		void Load (const Plate_GtoCConstraint & GtoCConst);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param FGtoCConst:
	:type FGtoCConst: Plate_FreeGtoCConstraint &
	:rtype: None
") Load;
		void Load (const Plate_FreeGtoCConstraint & FGtoCConst);
		%feature("compactdefaultargs") SolveTI;
		%feature("autodoc", "	:param ord: default value is 4
	:type ord: int
	:param anisotropie: default value is 1.0
	:type anisotropie: float
	:rtype: None
") SolveTI;
		void SolveTI (const Standard_Integer ord = 4,const Standard_Real anisotropie = 1.0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") destroy;
		%feature("autodoc", "	:rtype: None
") destroy;
		void destroy ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* reset the Plate in the initial state ( same as after Create())

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:rtype: gp_XYZ
") Evaluate;
		gp_XYZ Evaluate (const gp_XY & point2d);
		%feature("compactdefaultargs") EvaluateDerivative;
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:rtype: gp_XYZ
") EvaluateDerivative;
		gp_XYZ EvaluateDerivative (const gp_XY & point2d,const Standard_Integer iu,const Standard_Integer iv);
		%feature("compactdefaultargs") CoefPol;
		%feature("autodoc", "	:param Coefs:
	:type Coefs: Handle_TColgp_HArray2OfXYZ
	:rtype: None
") CoefPol;
		void CoefPol (Handle_TColgp_HArray2OfXYZ & Coefs);
		%feature("compactdefaultargs") SetPolynomialPartOnly;
		%feature("autodoc", "	:param PPOnly: default value is Standard_True
	:type PPOnly: bool
	:rtype: None
") SetPolynomialPartOnly;
		void SetPolynomialPartOnly (const Standard_Boolean PPOnly = Standard_True);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: int
") Continuity;
		Standard_Integer Continuity ();
		%feature("compactdefaultargs") UVBox;
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
		%feature("compactdefaultargs") UVConstraints;
		%feature("autodoc", "	:param Seq:
	:type Seq: TColgp_SequenceOfXY
	:rtype: None
") UVConstraints;
		void UVConstraints (TColgp_SequenceOfXY & Seq);
};


%extend Plate_Plate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_SampledCurveConstraint;
class Plate_SampledCurveConstraint {
	public:
		%feature("compactdefaultargs") Plate_SampledCurveConstraint;
		%feature("autodoc", "	:param SOPPC:
	:type SOPPC: Plate_SequenceOfPinpointConstraint &
	:param n:
	:type n: int
	:rtype: None
") Plate_SampledCurveConstraint;
		 Plate_SampledCurveConstraint (const Plate_SequenceOfPinpointConstraint & SOPPC,const Standard_Integer n);
		%feature("compactdefaultargs") LXYZC;
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC ();
};


%extend Plate_SampledCurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_SequenceNodeOfSequenceOfLinearScalarConstraint;
class Plate_SequenceNodeOfSequenceOfLinearScalarConstraint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Plate_SequenceNodeOfSequenceOfLinearScalarConstraint;
		%feature("autodoc", "	:param I:
	:type I: Plate_LinearScalarConstraint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Plate_SequenceNodeOfSequenceOfLinearScalarConstraint;
		 Plate_SequenceNodeOfSequenceOfLinearScalarConstraint (const Plate_LinearScalarConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") Value;
		Plate_LinearScalarConstraint & Value ();
};


%extend Plate_SequenceNodeOfSequenceOfLinearScalarConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint::Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Plate_SequenceNodeOfSequenceOfLinearScalarConstraint* _get_reference() {
    return (Plate_SequenceNodeOfSequenceOfLinearScalarConstraint*)$self->Access();
    }
};

%extend Handle_Plate_SequenceNodeOfSequenceOfLinearScalarConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Plate_SequenceNodeOfSequenceOfLinearScalarConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_SequenceNodeOfSequenceOfLinearXYZConstraint;
class Plate_SequenceNodeOfSequenceOfLinearXYZConstraint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Plate_SequenceNodeOfSequenceOfLinearXYZConstraint;
		%feature("autodoc", "	:param I:
	:type I: Plate_LinearXYZConstraint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Plate_SequenceNodeOfSequenceOfLinearXYZConstraint;
		 Plate_SequenceNodeOfSequenceOfLinearXYZConstraint (const Plate_LinearXYZConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") Value;
		Plate_LinearXYZConstraint & Value ();
};


%extend Plate_SequenceNodeOfSequenceOfLinearXYZConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint::Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Plate_SequenceNodeOfSequenceOfLinearXYZConstraint* _get_reference() {
    return (Plate_SequenceNodeOfSequenceOfLinearXYZConstraint*)$self->Access();
    }
};

%extend Handle_Plate_SequenceNodeOfSequenceOfLinearXYZConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Plate_SequenceNodeOfSequenceOfLinearXYZConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_SequenceNodeOfSequenceOfPinpointConstraint;
class Plate_SequenceNodeOfSequenceOfPinpointConstraint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Plate_SequenceNodeOfSequenceOfPinpointConstraint;
		%feature("autodoc", "	:param I:
	:type I: Plate_PinpointConstraint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Plate_SequenceNodeOfSequenceOfPinpointConstraint;
		 Plate_SequenceNodeOfSequenceOfPinpointConstraint (const Plate_PinpointConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Plate_PinpointConstraint
") Value;
		Plate_PinpointConstraint & Value ();
};


%extend Plate_SequenceNodeOfSequenceOfPinpointConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint::Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Plate_SequenceNodeOfSequenceOfPinpointConstraint* _get_reference() {
    return (Plate_SequenceNodeOfSequenceOfPinpointConstraint*)$self->Access();
    }
};

%extend Handle_Plate_SequenceNodeOfSequenceOfPinpointConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Plate_SequenceNodeOfSequenceOfPinpointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_SequenceOfLinearScalarConstraint;
class Plate_SequenceOfLinearScalarConstraint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Plate_SequenceOfLinearScalarConstraint;
		%feature("autodoc", "	:rtype: None
") Plate_SequenceOfLinearScalarConstraint;
		 Plate_SequenceOfLinearScalarConstraint ();
		%feature("compactdefaultargs") Plate_SequenceOfLinearScalarConstraint;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") Plate_SequenceOfLinearScalarConstraint;
		 Plate_SequenceOfLinearScalarConstraint (const Plate_SequenceOfLinearScalarConstraint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfLinearScalarConstraint &
	:rtype: Plate_SequenceOfLinearScalarConstraint
") Assign;
		const Plate_SequenceOfLinearScalarConstraint & Assign (const Plate_SequenceOfLinearScalarConstraint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfLinearScalarConstraint &
	:rtype: Plate_SequenceOfLinearScalarConstraint
") operator =;
		const Plate_SequenceOfLinearScalarConstraint & operator = (const Plate_SequenceOfLinearScalarConstraint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Plate_LinearScalarConstraint &
	:rtype: None
") Append;
		void Append (const Plate_LinearScalarConstraint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") Append;
		void Append (Plate_SequenceOfLinearScalarConstraint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Plate_LinearScalarConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Plate_LinearScalarConstraint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") Prepend;
		void Prepend (Plate_SequenceOfLinearScalarConstraint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Plate_LinearScalarConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Plate_LinearScalarConstraint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Plate_SequenceOfLinearScalarConstraint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Plate_LinearScalarConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Plate_LinearScalarConstraint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Plate_SequenceOfLinearScalarConstraint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") First;
		const Plate_LinearScalarConstraint & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") Last;
		const Plate_LinearScalarConstraint & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Plate_SequenceOfLinearScalarConstraint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Plate_SequenceOfLinearScalarConstraint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_LinearScalarConstraint
") Value;
		const Plate_LinearScalarConstraint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Plate_LinearScalarConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_LinearScalarConstraint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_LinearScalarConstraint
") ChangeValue;
		Plate_LinearScalarConstraint & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Plate_SequenceOfLinearScalarConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_SequenceOfLinearXYZConstraint;
class Plate_SequenceOfLinearXYZConstraint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Plate_SequenceOfLinearXYZConstraint;
		%feature("autodoc", "	:rtype: None
") Plate_SequenceOfLinearXYZConstraint;
		 Plate_SequenceOfLinearXYZConstraint ();
		%feature("compactdefaultargs") Plate_SequenceOfLinearXYZConstraint;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") Plate_SequenceOfLinearXYZConstraint;
		 Plate_SequenceOfLinearXYZConstraint (const Plate_SequenceOfLinearXYZConstraint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfLinearXYZConstraint &
	:rtype: Plate_SequenceOfLinearXYZConstraint
") Assign;
		const Plate_SequenceOfLinearXYZConstraint & Assign (const Plate_SequenceOfLinearXYZConstraint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfLinearXYZConstraint &
	:rtype: Plate_SequenceOfLinearXYZConstraint
") operator =;
		const Plate_SequenceOfLinearXYZConstraint & operator = (const Plate_SequenceOfLinearXYZConstraint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Plate_LinearXYZConstraint &
	:rtype: None
") Append;
		void Append (const Plate_LinearXYZConstraint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") Append;
		void Append (Plate_SequenceOfLinearXYZConstraint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Plate_LinearXYZConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Plate_LinearXYZConstraint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") Prepend;
		void Prepend (Plate_SequenceOfLinearXYZConstraint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Plate_LinearXYZConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Plate_LinearXYZConstraint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Plate_SequenceOfLinearXYZConstraint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Plate_LinearXYZConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Plate_LinearXYZConstraint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Plate_SequenceOfLinearXYZConstraint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") First;
		const Plate_LinearXYZConstraint & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") Last;
		const Plate_LinearXYZConstraint & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Plate_SequenceOfLinearXYZConstraint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Plate_SequenceOfLinearXYZConstraint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_LinearXYZConstraint
") Value;
		const Plate_LinearXYZConstraint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Plate_LinearXYZConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_LinearXYZConstraint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_LinearXYZConstraint
") ChangeValue;
		Plate_LinearXYZConstraint & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Plate_SequenceOfLinearXYZConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_SequenceOfPinpointConstraint;
class Plate_SequenceOfPinpointConstraint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Plate_SequenceOfPinpointConstraint;
		%feature("autodoc", "	:rtype: None
") Plate_SequenceOfPinpointConstraint;
		 Plate_SequenceOfPinpointConstraint ();
		%feature("compactdefaultargs") Plate_SequenceOfPinpointConstraint;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") Plate_SequenceOfPinpointConstraint;
		 Plate_SequenceOfPinpointConstraint (const Plate_SequenceOfPinpointConstraint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfPinpointConstraint &
	:rtype: Plate_SequenceOfPinpointConstraint
") Assign;
		const Plate_SequenceOfPinpointConstraint & Assign (const Plate_SequenceOfPinpointConstraint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Plate_SequenceOfPinpointConstraint &
	:rtype: Plate_SequenceOfPinpointConstraint
") operator =;
		const Plate_SequenceOfPinpointConstraint & operator = (const Plate_SequenceOfPinpointConstraint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Plate_PinpointConstraint &
	:rtype: None
") Append;
		void Append (const Plate_PinpointConstraint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") Append;
		void Append (Plate_SequenceOfPinpointConstraint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Plate_PinpointConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Plate_PinpointConstraint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") Prepend;
		void Prepend (Plate_SequenceOfPinpointConstraint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Plate_PinpointConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Plate_PinpointConstraint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Plate_SequenceOfPinpointConstraint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Plate_PinpointConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Plate_PinpointConstraint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Plate_SequenceOfPinpointConstraint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Plate_PinpointConstraint
") First;
		const Plate_PinpointConstraint & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Plate_PinpointConstraint
") Last;
		const Plate_PinpointConstraint & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Plate_SequenceOfPinpointConstraint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Plate_SequenceOfPinpointConstraint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint
") Value;
		const Plate_PinpointConstraint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Plate_PinpointConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Plate_PinpointConstraint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint
") ChangeValue;
		Plate_PinpointConstraint & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Plate_SequenceOfPinpointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
