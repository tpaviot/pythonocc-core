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
"Plate module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_plate.html"
%enddef
%module (package="OCC.Core", docstring=PLATEDOCSTRING) Plate


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
#include<Plate_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TColgp.i
%import TColStd.i
%import Message.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(Plate_HArray1OfPinpointConstraint)
/* end handles declaration */

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

/*****************
* class Plate_D1 *
*****************/
class Plate_D1 {
	public:
		/****************** DU ******************/
		%feature("compactdefaultargs") DU;
		%feature("autodoc", ":rtype: gp_XYZ") DU;
		const gp_XYZ  DU ();

		/****************** DV ******************/
		%feature("compactdefaultargs") DV;
		%feature("autodoc", ":rtype: gp_XYZ") DV;
		const gp_XYZ  DV ();

		/****************** Plate_D1 ******************/
		%feature("compactdefaultargs") Plate_D1;
		%feature("autodoc", ":param du:
	:type du: gp_XYZ
	:param dv:
	:type dv: gp_XYZ
	:rtype: None") Plate_D1;
		 Plate_D1 (const gp_XYZ & du,const gp_XYZ & dv);

		/****************** Plate_D1 ******************/
		%feature("compactdefaultargs") Plate_D1;
		%feature("autodoc", ":param ref:
	:type ref: Plate_D1
	:rtype: None") Plate_D1;
		 Plate_D1 (const Plate_D1 & ref);

};


%extend Plate_D1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class Plate_D2 *
*****************/
class Plate_D2 {
	public:
		/****************** Plate_D2 ******************/
		%feature("compactdefaultargs") Plate_D2;
		%feature("autodoc", ":param duu:
	:type duu: gp_XYZ
	:param duv:
	:type duv: gp_XYZ
	:param dvv:
	:type dvv: gp_XYZ
	:rtype: None") Plate_D2;
		 Plate_D2 (const gp_XYZ & duu,const gp_XYZ & duv,const gp_XYZ & dvv);

		/****************** Plate_D2 ******************/
		%feature("compactdefaultargs") Plate_D2;
		%feature("autodoc", ":param ref:
	:type ref: Plate_D2
	:rtype: None") Plate_D2;
		 Plate_D2 (const Plate_D2 & ref);

};


%extend Plate_D2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class Plate_D3 *
*****************/
class Plate_D3 {
	public:
		/****************** Plate_D3 ******************/
		%feature("compactdefaultargs") Plate_D3;
		%feature("autodoc", ":param duuu:
	:type duuu: gp_XYZ
	:param duuv:
	:type duuv: gp_XYZ
	:param duvv:
	:type duvv: gp_XYZ
	:param dvvv:
	:type dvvv: gp_XYZ
	:rtype: None") Plate_D3;
		 Plate_D3 (const gp_XYZ & duuu,const gp_XYZ & duuv,const gp_XYZ & duvv,const gp_XYZ & dvvv);

		/****************** Plate_D3 ******************/
		%feature("compactdefaultargs") Plate_D3;
		%feature("autodoc", ":param ref:
	:type ref: Plate_D3
	:rtype: None") Plate_D3;
		 Plate_D3 (const Plate_D3 & ref);

};


%extend Plate_D3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Plate_FreeGtoCConstraint *
*********************************/
class Plate_FreeGtoCConstraint {
	public:
		/****************** GetPPC ******************/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint") GetPPC;
		const Plate_PinpointConstraint & GetPPC (const Standard_Integer Index);

		/****************** LSC ******************/
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: Plate_LinearScalarConstraint") LSC;
		const Plate_LinearScalarConstraint & LSC (const Standard_Integer Index);

		/****************** Plate_FreeGtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1
	:param D1T:
	:type D1T: Plate_D1
	:param IncrementalLoad: default value is 1.0
	:type IncrementalLoad: float
	:param orientation: default value is 0
	:type orientation: int
	:rtype: None") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);

		/****************** Plate_FreeGtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1
	:param D1T:
	:type D1T: Plate_D1
	:param D2S:
	:type D2S: Plate_D2
	:param D2T:
	:type D2T: Plate_D2
	:param IncrementalLoad: default value is 1.0
	:type IncrementalLoad: float
	:param orientation: default value is 0
	:type orientation: int
	:rtype: None") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);

		/****************** Plate_FreeGtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1
	:param D1T:
	:type D1T: Plate_D1
	:param D2S:
	:type D2S: Plate_D2
	:param D2T:
	:type D2T: Plate_D2
	:param D3S:
	:type D3S: Plate_D3
	:param D3T:
	:type D3T: Plate_D3
	:param IncrementalLoad: default value is 1.0
	:type IncrementalLoad: float
	:param orientation: default value is 0
	:type orientation: int
	:rtype: None") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Plate_D3 & D3S,const Plate_D3 & D3T,const Standard_Real IncrementalLoad = 1.0,const Standard_Integer orientation = 0);

		/****************** nb_LSC ******************/
		%feature("compactdefaultargs") nb_LSC;
		%feature("autodoc", ":rtype: int") nb_LSC;
		const Standard_Integer & nb_LSC ();

		/****************** nb_PPC ******************/
		%feature("compactdefaultargs") nb_PPC;
		%feature("autodoc", ":rtype: int") nb_PPC;
		const Standard_Integer & nb_PPC ();

};


%extend Plate_FreeGtoCConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class Plate_GlobalTranslationConstraint *
******************************************/
class Plate_GlobalTranslationConstraint {
	public:
		/****************** LXYZC ******************/
		%feature("compactdefaultargs") LXYZC;
		%feature("autodoc", ":rtype: Plate_LinearXYZConstraint") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC ();

		/****************** Plate_GlobalTranslationConstraint ******************/
		%feature("compactdefaultargs") Plate_GlobalTranslationConstraint;
		%feature("autodoc", ":param SOfXY:
	:type SOfXY: TColgp_SequenceOfXY
	:rtype: None") Plate_GlobalTranslationConstraint;
		 Plate_GlobalTranslationConstraint (const TColgp_SequenceOfXY & SOfXY);

};


%extend Plate_GlobalTranslationConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Plate_GtoCConstraint *
*****************************/
class Plate_GtoCConstraint {
	public:
		/****************** D1SurfInit ******************/
		%feature("compactdefaultargs") D1SurfInit;
		%feature("autodoc", ":rtype: Plate_D1") D1SurfInit;
		const Plate_D1 & D1SurfInit ();

		/****************** GetPPC ******************/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: Plate_PinpointConstraint") GetPPC;
		const Plate_PinpointConstraint & GetPPC (const Standard_Integer Index);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", ":param ref:
	:type ref: Plate_GtoCConstraint
	:rtype: None") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const Plate_GtoCConstraint & ref);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1
	:param D1T:
	:type D1T: Plate_D1
	:rtype: None") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1
	:param D1T:
	:type D1T: Plate_D1
	:param nP:
	:type nP: gp_XYZ
	:rtype: None") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const gp_XYZ & nP);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1
	:param D1T:
	:type D1T: Plate_D1
	:param D2S:
	:type D2S: Plate_D2
	:param D2T:
	:type D2T: Plate_D2
	:rtype: None") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1
	:param D1T:
	:type D1T: Plate_D1
	:param D2S:
	:type D2S: Plate_D2
	:param D2T:
	:type D2T: Plate_D2
	:param nP:
	:type nP: gp_XYZ
	:rtype: None") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const gp_XYZ & nP);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1
	:param D1T:
	:type D1T: Plate_D1
	:param D2S:
	:type D2S: Plate_D2
	:param D2T:
	:type D2T: Plate_D2
	:param D3S:
	:type D3S: Plate_D3
	:param D3T:
	:type D3T: Plate_D3
	:rtype: None") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Plate_D3 & D3S,const Plate_D3 & D3T);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param D1S:
	:type D1S: Plate_D1
	:param D1T:
	:type D1T: Plate_D1
	:param D2S:
	:type D2S: Plate_D2
	:param D2T:
	:type D2T: Plate_D2
	:param D3S:
	:type D3S: Plate_D3
	:param D3T:
	:type D3T: Plate_D3
	:param nP:
	:type nP: gp_XYZ
	:rtype: None") Plate_GtoCConstraint;
		 Plate_GtoCConstraint (const gp_XY & point2d,const Plate_D1 & D1S,const Plate_D1 & D1T,const Plate_D2 & D2S,const Plate_D2 & D2T,const Plate_D3 & D3S,const Plate_D3 & D3T,const gp_XYZ & nP);

		/****************** nb_PPC ******************/
		%feature("compactdefaultargs") nb_PPC;
		%feature("autodoc", ":rtype: int") nb_PPC;
		const Standard_Integer & nb_PPC ();

};


%extend Plate_GtoCConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Plate_LineConstraint *
*****************************/
class Plate_LineConstraint {
	public:
		/****************** LSC ******************/
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", ":rtype: Plate_LinearScalarConstraint") LSC;
		const Plate_LinearScalarConstraint & LSC ();

		/****************** Plate_LineConstraint ******************/
		%feature("compactdefaultargs") Plate_LineConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param lin:
	:type lin: gp_Lin
	:param iu: default value is 0
	:type iu: int
	:param iv: default value is 0
	:type iv: int
	:rtype: None") Plate_LineConstraint;
		 Plate_LineConstraint (const gp_XY & point2d,const gp_Lin & lin,const Standard_Integer iu = 0,const Standard_Integer iv = 0);

};


%extend Plate_LineConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Plate_LinearScalarConstraint *
*************************************/
class Plate_LinearScalarConstraint {
	public:
		/****************** Coeff ******************/
		%feature("compactdefaultargs") Coeff;
		%feature("autodoc", ":rtype: TColgp_Array2OfXYZ") Coeff;
		const TColgp_Array2OfXYZ & Coeff ();

		/****************** GetPPC ******************/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", ":rtype: Plate_Array1OfPinpointConstraint") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC ();

		/****************** Plate_LinearScalarConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", ":rtype: None") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint ();

		/****************** Plate_LinearScalarConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", ":param thePPC1:
	:type thePPC1: Plate_PinpointConstraint
	:param theCoeff:
	:type theCoeff: gp_XYZ
	:rtype: None") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_PinpointConstraint & thePPC1,const gp_XYZ & theCoeff);

		/****************** Plate_LinearScalarConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", ":param thePPC:
	:type thePPC: Plate_Array1OfPinpointConstraint
	:param theCoeff:
	:type theCoeff: TColgp_Array1OfXYZ
	:rtype: None") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_Array1OfPinpointConstraint & thePPC,const TColgp_Array1OfXYZ & theCoeff);

		/****************** Plate_LinearScalarConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", ":param thePPC:
	:type thePPC: Plate_Array1OfPinpointConstraint
	:param theCoeff:
	:type theCoeff: TColgp_Array2OfXYZ
	:rtype: None") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Plate_Array1OfPinpointConstraint & thePPC,const TColgp_Array2OfXYZ & theCoeff);

		/****************** Plate_LinearScalarConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", ":param ColLen:
	:type ColLen: int
	:param RowLen:
	:type RowLen: int
	:rtype: None") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint (const Standard_Integer ColLen,const Standard_Integer RowLen);

		/****************** SetCoeff ******************/
		%feature("compactdefaultargs") SetCoeff;
		%feature("autodoc", "* Sets the coeff of index (Row,Col) to Value raise if Row (respectively Col) is greater than the Row (respectively Column) length of coeff
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: gp_XYZ
	:rtype: None") SetCoeff;
		void SetCoeff (const Standard_Integer Row,const Standard_Integer Col,const gp_XYZ & Value);

		/****************** SetPPC ******************/
		%feature("compactdefaultargs") SetPPC;
		%feature("autodoc", "* Sets the PinPointConstraint of index Index to Value raise if Index is greater than the length of PPC or the Row length of coeff or lower than 1
	:param Index:
	:type Index: int
	:param Value:
	:type Value: Plate_PinpointConstraint
	:rtype: None") SetPPC;
		void SetPPC (const Standard_Integer Index,const Plate_PinpointConstraint & Value);

};


%extend Plate_LinearScalarConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Plate_LinearXYZConstraint *
**********************************/
class Plate_LinearXYZConstraint {
	public:
		/****************** Coeff ******************/
		%feature("compactdefaultargs") Coeff;
		%feature("autodoc", ":rtype: TColStd_Array2OfReal") Coeff;
		const TColStd_Array2OfReal & Coeff ();

		/****************** GetPPC ******************/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", ":rtype: Plate_Array1OfPinpointConstraint") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC ();

		/****************** Plate_LinearXYZConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", ":rtype: None") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint ();

		/****************** Plate_LinearXYZConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", ":param thePPC:
	:type thePPC: Plate_Array1OfPinpointConstraint
	:param theCoeff:
	:type theCoeff: TColStd_Array1OfReal
	:rtype: None") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Plate_Array1OfPinpointConstraint & thePPC,const TColStd_Array1OfReal & theCoeff);

		/****************** Plate_LinearXYZConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", ":param thePPC:
	:type thePPC: Plate_Array1OfPinpointConstraint
	:param theCoeff:
	:type theCoeff: TColStd_Array2OfReal
	:rtype: None") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Plate_Array1OfPinpointConstraint & thePPC,const TColStd_Array2OfReal & theCoeff);

		/****************** Plate_LinearXYZConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", ":param ColLen:
	:type ColLen: int
	:param RowLen:
	:type RowLen: int
	:rtype: None") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint (const Standard_Integer ColLen,const Standard_Integer RowLen);

		/****************** SetCoeff ******************/
		%feature("compactdefaultargs") SetCoeff;
		%feature("autodoc", "* Sets the coeff of index (Row,Col) to Value raise if Row (respectively Col) is greater than the Row (respectively Column) length of coeff
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float
	:rtype: None") SetCoeff;
		void SetCoeff (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);

		/****************** SetPPC ******************/
		%feature("compactdefaultargs") SetPPC;
		%feature("autodoc", "* Sets the PinPointConstraint of index Index to Value raise if Index is greater than the length of PPC or the Row length of coeff or lower than 1
	:param Index:
	:type Index: int
	:param Value:
	:type Value: Plate_PinpointConstraint
	:rtype: None") SetPPC;
		void SetPPC (const Standard_Integer Index,const Plate_PinpointConstraint & Value);

};


%extend Plate_LinearXYZConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Plate_PinpointConstraint *
*********************************/
class Plate_PinpointConstraint {
	public:
		/****************** Idu ******************/
		%feature("compactdefaultargs") Idu;
		%feature("autodoc", ":rtype: int") Idu;
		const Standard_Integer & Idu ();

		/****************** Idv ******************/
		%feature("compactdefaultargs") Idv;
		%feature("autodoc", ":rtype: int") Idv;
		const Standard_Integer & Idv ();

		/****************** Plate_PinpointConstraint ******************/
		%feature("compactdefaultargs") Plate_PinpointConstraint;
		%feature("autodoc", ":rtype: None") Plate_PinpointConstraint;
		 Plate_PinpointConstraint ();

		/****************** Plate_PinpointConstraint ******************/
		%feature("compactdefaultargs") Plate_PinpointConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param ImposedValue:
	:type ImposedValue: gp_XYZ
	:param iu: default value is 0
	:type iu: int
	:param iv: default value is 0
	:type iv: int
	:rtype: None") Plate_PinpointConstraint;
		 Plate_PinpointConstraint (const gp_XY & point2d,const gp_XYZ & ImposedValue,const Standard_Integer iu = 0,const Standard_Integer iv = 0);

		/****************** Pnt2d ******************/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", ":rtype: gp_XY") Pnt2d;
		const gp_XY  Pnt2d ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: gp_XYZ") Value;
		const gp_XYZ  Value ();

};


%extend Plate_PinpointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Plate_PlaneConstraint *
******************************/
class Plate_PlaneConstraint {
	public:
		/****************** LSC ******************/
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", ":rtype: Plate_LinearScalarConstraint") LSC;
		const Plate_LinearScalarConstraint & LSC ();

		/****************** Plate_PlaneConstraint ******************/
		%feature("compactdefaultargs") Plate_PlaneConstraint;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param pln:
	:type pln: gp_Pln
	:param iu: default value is 0
	:type iu: int
	:param iv: default value is 0
	:type iv: int
	:rtype: None") Plate_PlaneConstraint;
		 Plate_PlaneConstraint (const gp_XY & point2d,const gp_Pln & pln,const Standard_Integer iu = 0,const Standard_Integer iv = 0);

};


%extend Plate_PlaneConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Plate_Plate *
********************/
class Plate_Plate {
	public:
		/****************** CoefPol ******************/
		%feature("compactdefaultargs") CoefPol;
		%feature("autodoc", ":param Coefs:
	:type Coefs: TColgp_HArray2OfXYZ
	:rtype: None") CoefPol;
		void CoefPol (opencascade::handle<TColgp_HArray2OfXYZ> & Coefs);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: int") Continuity;
		Standard_Integer Continuity ();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", ":param Ref:
	:type Ref: Plate_Plate
	:rtype: Plate_Plate") Copy;
		Plate_Plate & Copy (const Plate_Plate & Ref);

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:rtype: gp_XYZ") Evaluate;
		gp_XYZ Evaluate (const gp_XY & point2d);

		/****************** EvaluateDerivative ******************/
		%feature("compactdefaultargs") EvaluateDerivative;
		%feature("autodoc", ":param point2d:
	:type point2d: gp_XY
	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:rtype: gp_XYZ") EvaluateDerivative;
		gp_XYZ EvaluateDerivative (const gp_XY & point2d,const Standard_Integer iu,const Standard_Integer iv);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* reset the Plate in the initial state ( same as after Create())
	:rtype: None") Init;
		void Init ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True if all has been correctly done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param PConst:
	:type PConst: Plate_PinpointConstraint
	:rtype: None") Load;
		void Load (const Plate_PinpointConstraint & PConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param LXYZConst:
	:type LXYZConst: Plate_LinearXYZConstraint
	:rtype: None") Load;
		void Load (const Plate_LinearXYZConstraint & LXYZConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param LScalarConst:
	:type LScalarConst: Plate_LinearScalarConstraint
	:rtype: None") Load;
		void Load (const Plate_LinearScalarConstraint & LScalarConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param GTConst:
	:type GTConst: Plate_GlobalTranslationConstraint
	:rtype: None") Load;
		void Load (const Plate_GlobalTranslationConstraint & GTConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param LConst:
	:type LConst: Plate_LineConstraint
	:rtype: None") Load;
		void Load (const Plate_LineConstraint & LConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param PConst:
	:type PConst: Plate_PlaneConstraint
	:rtype: None") Load;
		void Load (const Plate_PlaneConstraint & PConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param SCConst:
	:type SCConst: Plate_SampledCurveConstraint
	:rtype: None") Load;
		void Load (const Plate_SampledCurveConstraint & SCConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param GtoCConst:
	:type GtoCConst: Plate_GtoCConstraint
	:rtype: None") Load;
		void Load (const Plate_GtoCConstraint & GtoCConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param FGtoCConst:
	:type FGtoCConst: Plate_FreeGtoCConstraint
	:rtype: None") Load;
		void Load (const Plate_FreeGtoCConstraint & FGtoCConst);

		/****************** Plate_Plate ******************/
		%feature("compactdefaultargs") Plate_Plate;
		%feature("autodoc", ":rtype: None") Plate_Plate;
		 Plate_Plate ();

		/****************** Plate_Plate ******************/
		%feature("compactdefaultargs") Plate_Plate;
		%feature("autodoc", ":param Ref:
	:type Ref: Plate_Plate
	:rtype: None") Plate_Plate;
		 Plate_Plate (const Plate_Plate & Ref);

		/****************** SetPolynomialPartOnly ******************/
		%feature("compactdefaultargs") SetPolynomialPartOnly;
		%feature("autodoc", ":param PPOnly: default value is Standard_True
	:type PPOnly: bool
	:rtype: None") SetPolynomialPartOnly;
		void SetPolynomialPartOnly (const Standard_Boolean PPOnly = Standard_True);

		/****************** SolveTI ******************/
		%feature("compactdefaultargs") SolveTI;
		%feature("autodoc", ":param ord: default value is 4
	:type ord: int
	:param anisotropie: default value is 1.0
	:type anisotropie: float
	:param aProgress: default value is opencascade::handle<Message_ProgressIndicator>()
	:type aProgress: Message_ProgressIndicator
	:rtype: None") SolveTI;
		void SolveTI (const Standard_Integer ord = 4,const Standard_Real anisotropie = 1.0,const opencascade::handle<Message_ProgressIndicator> & aProgress = opencascade::handle<Message_ProgressIndicator>());

		/****************** UVBox ******************/
		%feature("compactdefaultargs") UVBox;
		%feature("autodoc", ":param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None") UVBox;
		void UVBox (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** UVConstraints ******************/
		%feature("compactdefaultargs") UVConstraints;
		%feature("autodoc", ":param Seq:
	:type Seq: TColgp_SequenceOfXY
	:rtype: None") UVConstraints;
		void UVConstraints (TColgp_SequenceOfXY & Seq);

		/****************** destroy ******************/
		%feature("compactdefaultargs") destroy;
		%feature("autodoc", ":rtype: None") destroy;
		void destroy ();

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param Ref:
	:type Ref: Plate_Plate
	:rtype: Plate_Plate") operator =;
		Plate_Plate & operator = (const Plate_Plate & Ref);

};


%extend Plate_Plate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Plate_SampledCurveConstraint *
*************************************/
class Plate_SampledCurveConstraint {
	public:
		/****************** LXYZC ******************/
		%feature("compactdefaultargs") LXYZC;
		%feature("autodoc", ":rtype: Plate_LinearXYZConstraint") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC ();

		/****************** Plate_SampledCurveConstraint ******************/
		%feature("compactdefaultargs") Plate_SampledCurveConstraint;
		%feature("autodoc", ":param SOPPC:
	:type SOPPC: Plate_SequenceOfPinpointConstraint
	:param n:
	:type n: int
	:rtype: None") Plate_SampledCurveConstraint;
		 Plate_SampledCurveConstraint (const Plate_SequenceOfPinpointConstraint & SOPPC,const Standard_Integer n);

};


%extend Plate_SampledCurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class Plate_HArray1OfPinpointConstraint : public  Plate_Array1OfPinpointConstraint, public Standard_Transient {
  public:
    Plate_HArray1OfPinpointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper);
    Plate_HArray1OfPinpointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper, const  Plate_Array1OfPinpointConstraint::value_type& theValue);
    Plate_HArray1OfPinpointConstraint(const  Plate_Array1OfPinpointConstraint& theOther);
    const  Plate_Array1OfPinpointConstraint& Array1();
     Plate_Array1OfPinpointConstraint& ChangeArray1();
};
%make_alias(Plate_HArray1OfPinpointConstraint)


/* harray2 classes */
/* hsequence classes */
