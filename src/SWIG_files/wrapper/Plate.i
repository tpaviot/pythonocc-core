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
%define PLATEDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=PLATEDOCSTRING) Plate

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include Plate_headers.i

/* templates */
%template(Plate_Array1OfPinpointConstraint) NCollection_Array1 <Plate_PinpointConstraint>;

%extend NCollection_Array1 <Plate_PinpointConstraint> {
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
%template(Plate_SequenceOfPinpointConstraint) NCollection_Sequence <Plate_PinpointConstraint>;
%template(Plate_SequenceOfLinearXYZConstraint) NCollection_Sequence <Plate_LinearXYZConstraint>;
%template(Plate_SequenceOfLinearScalarConstraint) NCollection_Sequence <Plate_LinearScalarConstraint>;
/* end templates declaration */


/* typedefs */
typedef NCollection_Array1 <Plate_PinpointConstraint> Plate_Array1OfPinpointConstraint;
typedef NCollection_Sequence <Plate_PinpointConstraint> Plate_SequenceOfPinpointConstraint;
typedef NCollection_Sequence <Plate_LinearXYZConstraint> Plate_SequenceOfLinearXYZConstraint;
typedef NCollection_Sequence <Plate_LinearScalarConstraint> Plate_SequenceOfLinearScalarConstraint;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */


%nodefaultctor Plate_D1;
class Plate_D1 {
	public:
		%feature("compactdefaultargs") DU;
		%feature("autodoc", "	:rtype: gp_XYZ
") DU;
		const gp_XYZ  DU ();
		%feature("compactdefaultargs") DV;
		%feature("autodoc", "	:rtype: gp_XYZ
") DV;
		const gp_XYZ  DV ();
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
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint
") GetPPC;
		const Plate_PinpointConstraint & GetPPC (const Standard_Integer Index);
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC (const Standard_Integer Index);
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
		%feature("compactdefaultargs") nb_LSC;
		%feature("autodoc", "	:rtype: int
") nb_LSC;
		const Standard_Integer & nb_LSC ();
		%feature("compactdefaultargs") nb_PPC;
		%feature("autodoc", "	:rtype: int
") nb_PPC;
		const Standard_Integer & nb_PPC ();
};


%extend Plate_FreeGtoCConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_GlobalTranslationConstraint;
class Plate_GlobalTranslationConstraint {
	public:
		%feature("compactdefaultargs") LXYZC;
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC ();
		%feature("compactdefaultargs") Plate_GlobalTranslationConstraint;
		%feature("autodoc", "	:param SOfXY:
	:type SOfXY: TColgp_SequenceOfXY
	:rtype: None
") Plate_GlobalTranslationConstraint;
		 Plate_GlobalTranslationConstraint (const TColgp_SequenceOfXY & SOfXY);
};


%extend Plate_GlobalTranslationConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_GtoCConstraint;
class Plate_GtoCConstraint {
	public:
		%feature("compactdefaultargs") D1SurfInit;
		%feature("autodoc", "	:rtype: Plate_D1
") D1SurfInit;
		const Plate_D1 & D1SurfInit ();
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint
") GetPPC;
		const Plate_PinpointConstraint & GetPPC (const Standard_Integer Index);
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
};


%extend Plate_GtoCConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_LineConstraint;
class Plate_LineConstraint {
	public:
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC ();
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
};


%extend Plate_LineConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_LinearScalarConstraint;
class Plate_LinearScalarConstraint {
	public:
		%feature("compactdefaultargs") Coeff;
		%feature("autodoc", "	:rtype: TColgp_Array2OfXYZ
") Coeff;
		const TColgp_Array2OfXYZ & Coeff ();
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "	:rtype: Plate_Array1OfPinpointConstraint
") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC ();
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint ();
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "	:param thePPC1:
	:type thePPC1: Plate_PinpointConstraint &
	:param theCoeff:
	:type theCoeff: gp_XYZ
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_PinpointConstraint & thePPC1,const gp_XYZ & theCoeff);
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "	:param thePPC:
	:type thePPC: Plate_Array1OfPinpointConstraint &
	:param theCoeff:
	:type theCoeff: TColgp_Array1OfXYZ
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_Array1OfPinpointConstraint & thePPC,const TColgp_Array1OfXYZ & theCoeff);
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "	:param thePPC:
	:type thePPC: Plate_Array1OfPinpointConstraint &
	:param theCoeff:
	:type theCoeff: TColgp_Array2OfXYZ
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_Array1OfPinpointConstraint & thePPC,const TColgp_Array2OfXYZ & theCoeff);
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "	:param ColLen:
	:type ColLen: int
	:param RowLen:
	:type RowLen: int
	:rtype: None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Standard_Integer ColLen,const Standard_Integer RowLen);
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
		%feature("compactdefaultargs") SetPPC;
		%feature("autodoc", "	* Sets the PinPointConstraint of index Index to Value raise if Index is greater than the length of PPC or the Row length of coeff or lower than 1

	:param Index:
	:type Index: int
	:param Value:
	:type Value: Plate_PinpointConstraint &
	:rtype: None
") SetPPC;
		void SetPPC (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
};


%extend Plate_LinearScalarConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_LinearXYZConstraint;
class Plate_LinearXYZConstraint {
	public:
		%feature("compactdefaultargs") Coeff;
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") Coeff;
		const TColStd_Array2OfReal & Coeff ();
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "	:rtype: Plate_Array1OfPinpointConstraint
") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC ();
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint ();
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "	:param thePPC:
	:type thePPC: Plate_Array1OfPinpointConstraint &
	:param theCoeff:
	:type theCoeff: TColStd_Array1OfReal &
	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Plate_Array1OfPinpointConstraint & thePPC,const TColStd_Array1OfReal & theCoeff);
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "	:param thePPC:
	:type thePPC: Plate_Array1OfPinpointConstraint &
	:param theCoeff:
	:type theCoeff: TColStd_Array2OfReal &
	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Plate_Array1OfPinpointConstraint & thePPC,const TColStd_Array2OfReal & theCoeff);
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "	:param ColLen:
	:type ColLen: int
	:param RowLen:
	:type RowLen: int
	:rtype: None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Standard_Integer ColLen,const Standard_Integer RowLen);
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
		%feature("compactdefaultargs") SetPPC;
		%feature("autodoc", "	* Sets the PinPointConstraint of index Index to Value raise if Index is greater than the length of PPC or the Row length of coeff or lower than 1

	:param Index:
	:type Index: int
	:param Value:
	:type Value: Plate_PinpointConstraint &
	:rtype: None
") SetPPC;
		void SetPPC (const Standard_Integer Index,const Plate_PinpointConstraint & Value);
};


%extend Plate_LinearXYZConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_PinpointConstraint;
class Plate_PinpointConstraint {
	public:
		%feature("compactdefaultargs") Idu;
		%feature("autodoc", "	:rtype: int
") Idu;
		const Standard_Integer & Idu ();
		%feature("compactdefaultargs") Idv;
		%feature("autodoc", "	:rtype: int
") Idv;
		const Standard_Integer & Idv ();
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
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "	:rtype: Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC ();
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
};


%extend Plate_PlaneConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_Plate;
class Plate_Plate {
	public:
		%feature("compactdefaultargs") CoefPol;
		%feature("autodoc", "	:param Coefs:
	:type Coefs: Handle_TColgp_HArray2OfXYZ
	:rtype: None
") CoefPol;
		void CoefPol (Handle_TColgp_HArray2OfXYZ & Coefs);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: int
") Continuity;
		Standard_Integer Continuity ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:param Ref:
	:type Ref: Plate_Plate &
	:rtype: Plate_Plate
") Copy;
		Plate_Plate & Copy (const Plate_Plate & Ref);
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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* reset the Plate in the initial state ( same as after Create())

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
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
		%feature("compactdefaultargs") SetPolynomialPartOnly;
		%feature("autodoc", "	:param PPOnly: default value is Standard_True
	:type PPOnly: bool
	:rtype: None
") SetPolynomialPartOnly;
		void SetPolynomialPartOnly (const Standard_Boolean PPOnly = Standard_True);
		%feature("compactdefaultargs") SolveTI;
		%feature("autodoc", "	:param ord: default value is 4
	:type ord: int
	:param anisotropie: default value is 1.0
	:type anisotropie: float
	:rtype: None
") SolveTI;
		void SolveTI (const Standard_Integer ord = 4,const Standard_Real anisotropie = 1.0);
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
		%feature("compactdefaultargs") destroy;
		%feature("autodoc", "	:rtype: None
") destroy;
		void destroy ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Ref:
	:type Ref: Plate_Plate &
	:rtype: Plate_Plate
") operator =;
		Plate_Plate & operator = (const Plate_Plate & Ref);
};


%extend Plate_Plate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Plate_SampledCurveConstraint;
class Plate_SampledCurveConstraint {
	public:
		%feature("compactdefaultargs") LXYZC;
		%feature("autodoc", "	:rtype: Plate_LinearXYZConstraint
") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC ();
		%feature("compactdefaultargs") Plate_SampledCurveConstraint;
		%feature("autodoc", "	:param SOPPC:
	:type SOPPC: Plate_SequenceOfPinpointConstraint &
	:param n:
	:type n: int
	:rtype: None
") Plate_SampledCurveConstraint;
		 Plate_SampledCurveConstraint (const Plate_SequenceOfPinpointConstraint & SOPPC,const Standard_Integer n);
};


%extend Plate_SampledCurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
%wrap_handle(Plate_HArray1OfPinpointConstraint)
class Plate_HArray1OfPinpointConstraint : public  Plate_Array1OfPinpointConstraint, public Standard_Transient {
  public:
    Plate_HArray1OfPinpointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper);
    Plate_HArray1OfPinpointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper, const  Plate_Array1OfPinpointConstraint::value_type& theValue);
    Plate_HArray1OfPinpointConstraint(const  Plate_Array1OfPinpointConstraint& theOther);
    const  Plate_Array1OfPinpointConstraint& Array1();
     Plate_Array1OfPinpointConstraint& ChangeArray1();
};
%make_alias(Plate_HArray1OfPinpointConstraint)


/* harray2 class */
/* harray2 class */
