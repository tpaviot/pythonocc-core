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

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Plate_HArray1OfPinpointConstraint)
/* end handles declaration */

/* templates */
%template(Plate_Array1OfPinpointConstraint) NCollection_Array1<Plate_PinpointConstraint>;

%extend NCollection_Array1<Plate_PinpointConstraint> {
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
%template(Plate_SequenceOfLinearScalarConstraint) NCollection_Sequence<Plate_LinearScalarConstraint>;
%template(Plate_SequenceOfLinearXYZConstraint) NCollection_Sequence<Plate_LinearXYZConstraint>;
%template(Plate_SequenceOfPinpointConstraint) NCollection_Sequence<Plate_PinpointConstraint>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Plate_PinpointConstraint> Plate_Array1OfPinpointConstraint;
typedef NCollection_Sequence<Plate_LinearScalarConstraint> Plate_SequenceOfLinearScalarConstraint;
typedef NCollection_Sequence<Plate_LinearXYZConstraint> Plate_SequenceOfLinearXYZConstraint;
typedef NCollection_Sequence<Plate_PinpointConstraint> Plate_SequenceOfPinpointConstraint;
/* end typedefs declaration */

/*****************
* class Plate_D1 *
*****************/
class Plate_D1 {
	public:
		/****************** Plate_D1 ******************/
		%feature("compactdefaultargs") Plate_D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
du: gp_XYZ
dv: gp_XYZ

Returns
-------
None
") Plate_D1;
		 Plate_D1(const gp_XYZ & du, const gp_XYZ & dv);

		/****************** Plate_D1 ******************/
		%feature("compactdefaultargs") Plate_D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
ref: Plate_D1

Returns
-------
None
") Plate_D1;
		 Plate_D1(const Plate_D1 & ref);

		/****************** DU ******************/
		%feature("compactdefaultargs") DU;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XYZ
") DU;
		const gp_XYZ DU();

		/****************** DV ******************/
		%feature("compactdefaultargs") DV;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XYZ
") DV;
		const gp_XYZ DV();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
duu: gp_XYZ
duv: gp_XYZ
dvv: gp_XYZ

Returns
-------
None
") Plate_D2;
		 Plate_D2(const gp_XYZ & duu, const gp_XYZ & duv, const gp_XYZ & dvv);

		/****************** Plate_D2 ******************/
		%feature("compactdefaultargs") Plate_D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
ref: Plate_D2

Returns
-------
None
") Plate_D2;
		 Plate_D2(const Plate_D2 & ref);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
duuu: gp_XYZ
duuv: gp_XYZ
duvv: gp_XYZ
dvvv: gp_XYZ

Returns
-------
None
") Plate_D3;
		 Plate_D3(const gp_XYZ & duuu, const gp_XYZ & duuv, const gp_XYZ & duvv, const gp_XYZ & dvvv);

		/****************** Plate_D3 ******************/
		%feature("compactdefaultargs") Plate_D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
ref: Plate_D3

Returns
-------
None
") Plate_D3;
		 Plate_D3(const Plate_D3 & ref);

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
		/****************** Plate_FreeGtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
IncrementalLoad: float,optional
	default value is 1.0
orientation: int,optional
	default value is 0

Returns
-------
None
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Standard_Real IncrementalLoad = 1.0, const Standard_Integer orientation = 0);

		/****************** Plate_FreeGtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2
IncrementalLoad: float,optional
	default value is 1.0
orientation: int,optional
	default value is 0

Returns
-------
None
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T, const Standard_Real IncrementalLoad = 1.0, const Standard_Integer orientation = 0);

		/****************** Plate_FreeGtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2
D3S: Plate_D3
D3T: Plate_D3
IncrementalLoad: float,optional
	default value is 1.0
orientation: int,optional
	default value is 0

Returns
-------
None
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T, const Plate_D3 & D3S, const Plate_D3 & D3T, const Standard_Real IncrementalLoad = 1.0, const Standard_Integer orientation = 0);

		/****************** GetPPC ******************/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
Plate_PinpointConstraint
") GetPPC;
		const Plate_PinpointConstraint & GetPPC(const Standard_Integer Index);

		/****************** LSC ******************/
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC(const Standard_Integer Index);

		/****************** nb_LSC ******************/
		%feature("compactdefaultargs") nb_LSC;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") nb_LSC;
		const Standard_Integer & nb_LSC();

		/****************** nb_PPC ******************/
		%feature("compactdefaultargs") nb_PPC;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") nb_PPC;
		const Standard_Integer & nb_PPC();

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
		/****************** Plate_GlobalTranslationConstraint ******************/
		%feature("compactdefaultargs") Plate_GlobalTranslationConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
SOfXY: TColgp_SequenceOfXY

Returns
-------
None
") Plate_GlobalTranslationConstraint;
		 Plate_GlobalTranslationConstraint(const TColgp_SequenceOfXY & SOfXY);

		/****************** LXYZC ******************/
		%feature("compactdefaultargs") LXYZC;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_LinearXYZConstraint
") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC();

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
		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
ref: Plate_GtoCConstraint

Returns
-------
None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const Plate_GtoCConstraint & ref);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1

Returns
-------
None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
nP: gp_XYZ

Returns
-------
None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const gp_XYZ & nP);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2

Returns
-------
None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2
nP: gp_XYZ

Returns
-------
None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T, const gp_XYZ & nP);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2
D3S: Plate_D3
D3T: Plate_D3

Returns
-------
None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T, const Plate_D3 & D3S, const Plate_D3 & D3T);

		/****************** Plate_GtoCConstraint ******************/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2
D3S: Plate_D3
D3T: Plate_D3
nP: gp_XYZ

Returns
-------
None
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T, const Plate_D3 & D3S, const Plate_D3 & D3T, const gp_XYZ & nP);

		/****************** D1SurfInit ******************/
		%feature("compactdefaultargs") D1SurfInit;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_D1
") D1SurfInit;
		const Plate_D1 & D1SurfInit();

		/****************** GetPPC ******************/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
Plate_PinpointConstraint
") GetPPC;
		const Plate_PinpointConstraint & GetPPC(const Standard_Integer Index);

		/****************** nb_PPC ******************/
		%feature("compactdefaultargs") nb_PPC;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") nb_PPC;
		const Standard_Integer & nb_PPC();

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
		/****************** Plate_LineConstraint ******************/
		%feature("compactdefaultargs") Plate_LineConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
lin: gp_Lin
iu: int,optional
	default value is 0
iv: int,optional
	default value is 0

Returns
-------
None
") Plate_LineConstraint;
		 Plate_LineConstraint(const gp_XY & point2d, const gp_Lin & lin, const Standard_Integer iu = 0, const Standard_Integer iv = 0);

		/****************** LSC ******************/
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC();

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
		/****************** Plate_LinearScalarConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint();

		/****************** Plate_LinearScalarConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePPC1: Plate_PinpointConstraint
theCoeff: gp_XYZ

Returns
-------
None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint(const Plate_PinpointConstraint & thePPC1, const gp_XYZ & theCoeff);

		/****************** Plate_LinearScalarConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePPC: Plate_Array1OfPinpointConstraint
theCoeff: TColgp_Array1OfXYZ

Returns
-------
None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint(const Plate_Array1OfPinpointConstraint & thePPC, const TColgp_Array1OfXYZ & theCoeff);

		/****************** Plate_LinearScalarConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePPC: Plate_Array1OfPinpointConstraint
theCoeff: TColgp_Array2OfXYZ

Returns
-------
None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint(const Plate_Array1OfPinpointConstraint & thePPC, const TColgp_Array2OfXYZ & theCoeff);

		/****************** Plate_LinearScalarConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
ColLen: int
RowLen: int

Returns
-------
None
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint(const Standard_Integer ColLen, const Standard_Integer RowLen);

		/****************** Coeff ******************/
		%feature("compactdefaultargs") Coeff;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfXYZ
") Coeff;
		const TColgp_Array2OfXYZ & Coeff();

		/****************** GetPPC ******************/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_Array1OfPinpointConstraint
") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC();

		/****************** SetCoeff ******************/
		%feature("compactdefaultargs") SetCoeff;
		%feature("autodoc", "Sets the coeff of index (row,col) to value raise if row (respectively col) is greater than the row (respectively column) length of coeff.

Parameters
----------
Row: int
Col: int
Value: gp_XYZ

Returns
-------
None
") SetCoeff;
		void SetCoeff(const Standard_Integer Row, const Standard_Integer Col, const gp_XYZ & Value);

		/****************** SetPPC ******************/
		%feature("compactdefaultargs") SetPPC;
		%feature("autodoc", "Sets the pinpointconstraint of index index to value raise if index is greater than the length of ppc or the row length of coeff or lower than 1.

Parameters
----------
Index: int
Value: Plate_PinpointConstraint

Returns
-------
None
") SetPPC;
		void SetPPC(const Standard_Integer Index, const Plate_PinpointConstraint & Value);

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
		/****************** Plate_LinearXYZConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint();

		/****************** Plate_LinearXYZConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePPC: Plate_Array1OfPinpointConstraint
theCoeff: TColStd_Array1OfReal

Returns
-------
None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint(const Plate_Array1OfPinpointConstraint & thePPC, const TColStd_Array1OfReal & theCoeff);

		/****************** Plate_LinearXYZConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePPC: Plate_Array1OfPinpointConstraint
theCoeff: TColStd_Array2OfReal

Returns
-------
None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint(const Plate_Array1OfPinpointConstraint & thePPC, const TColStd_Array2OfReal & theCoeff);

		/****************** Plate_LinearXYZConstraint ******************/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
ColLen: int
RowLen: int

Returns
-------
None
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint(const Standard_Integer ColLen, const Standard_Integer RowLen);

		/****************** Coeff ******************/
		%feature("compactdefaultargs") Coeff;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") Coeff;
		const TColStd_Array2OfReal & Coeff();

		/****************** GetPPC ******************/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_Array1OfPinpointConstraint
") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC();

		/****************** SetCoeff ******************/
		%feature("compactdefaultargs") SetCoeff;
		%feature("autodoc", "Sets the coeff of index (row,col) to value raise if row (respectively col) is greater than the row (respectively column) length of coeff.

Parameters
----------
Row: int
Col: int
Value: float

Returns
-------
None
") SetCoeff;
		void SetCoeff(const Standard_Integer Row, const Standard_Integer Col, const Standard_Real Value);

		/****************** SetPPC ******************/
		%feature("compactdefaultargs") SetPPC;
		%feature("autodoc", "Sets the pinpointconstraint of index index to value raise if index is greater than the length of ppc or the row length of coeff or lower than 1.

Parameters
----------
Index: int
Value: Plate_PinpointConstraint

Returns
-------
None
") SetPPC;
		void SetPPC(const Standard_Integer Index, const Plate_PinpointConstraint & Value);

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
		/****************** Plate_PinpointConstraint ******************/
		%feature("compactdefaultargs") Plate_PinpointConstraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Plate_PinpointConstraint;
		 Plate_PinpointConstraint();

		/****************** Plate_PinpointConstraint ******************/
		%feature("compactdefaultargs") Plate_PinpointConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
ImposedValue: gp_XYZ
iu: int,optional
	default value is 0
iv: int,optional
	default value is 0

Returns
-------
None
") Plate_PinpointConstraint;
		 Plate_PinpointConstraint(const gp_XY & point2d, const gp_XYZ & ImposedValue, const Standard_Integer iu = 0, const Standard_Integer iv = 0);

		/****************** Idu ******************/
		%feature("compactdefaultargs") Idu;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Idu;
		const Standard_Integer & Idu();

		/****************** Idv ******************/
		%feature("compactdefaultargs") Idv;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Idv;
		const Standard_Integer & Idv();

		/****************** Pnt2d ******************/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XY
") Pnt2d;
		const gp_XY Pnt2d();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XYZ
") Value;
		const gp_XYZ Value();

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
		/****************** Plate_PlaneConstraint ******************/
		%feature("compactdefaultargs") Plate_PlaneConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
pln: gp_Pln
iu: int,optional
	default value is 0
iv: int,optional
	default value is 0

Returns
-------
None
") Plate_PlaneConstraint;
		 Plate_PlaneConstraint(const gp_XY & point2d, const gp_Pln & pln, const Standard_Integer iu = 0, const Standard_Integer iv = 0);

		/****************** LSC ******************/
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_LinearScalarConstraint
") LSC;
		const Plate_LinearScalarConstraint & LSC();

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
		/****************** Plate_Plate ******************/
		%feature("compactdefaultargs") Plate_Plate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Plate_Plate;
		 Plate_Plate();

		/****************** Plate_Plate ******************/
		%feature("compactdefaultargs") Plate_Plate;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ref: Plate_Plate

Returns
-------
None
") Plate_Plate;
		 Plate_Plate(const Plate_Plate & Ref);

		/****************** CoefPol ******************/
		%feature("compactdefaultargs") CoefPol;
		%feature("autodoc", "No available documentation.

Parameters
----------
Coefs: TColgp_HArray2OfXYZ

Returns
-------
None
") CoefPol;
		void CoefPol(opencascade::handle<TColgp_HArray2OfXYZ> & Coefs);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Continuity;
		Standard_Integer Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ref: Plate_Plate

Returns
-------
Plate_Plate
") Copy;
		Plate_Plate & Copy(const Plate_Plate & Ref);

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY

Returns
-------
gp_XYZ
") Evaluate;
		gp_XYZ Evaluate(const gp_XY & point2d);

		/****************** EvaluateDerivative ******************/
		%feature("compactdefaultargs") EvaluateDerivative;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
iu: int
iv: int

Returns
-------
gp_XYZ
") EvaluateDerivative;
		gp_XYZ EvaluateDerivative(const gp_XY & point2d, const Standard_Integer iu, const Standard_Integer iv);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Reset the plate in the initial state ( same as after create()).

Returns
-------
None
") Init;
		void Init();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
PConst: Plate_PinpointConstraint

Returns
-------
None
") Load;
		void Load(const Plate_PinpointConstraint & PConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
LXYZConst: Plate_LinearXYZConstraint

Returns
-------
None
") Load;
		void Load(const Plate_LinearXYZConstraint & LXYZConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
LScalarConst: Plate_LinearScalarConstraint

Returns
-------
None
") Load;
		void Load(const Plate_LinearScalarConstraint & LScalarConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
GTConst: Plate_GlobalTranslationConstraint

Returns
-------
None
") Load;
		void Load(const Plate_GlobalTranslationConstraint & GTConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
LConst: Plate_LineConstraint

Returns
-------
None
") Load;
		void Load(const Plate_LineConstraint & LConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
PConst: Plate_PlaneConstraint

Returns
-------
None
") Load;
		void Load(const Plate_PlaneConstraint & PConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
SCConst: Plate_SampledCurveConstraint

Returns
-------
None
") Load;
		void Load(const Plate_SampledCurveConstraint & SCConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
GtoCConst: Plate_GtoCConstraint

Returns
-------
None
") Load;
		void Load(const Plate_GtoCConstraint & GtoCConst);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
FGtoCConst: Plate_FreeGtoCConstraint

Returns
-------
None
") Load;
		void Load(const Plate_FreeGtoCConstraint & FGtoCConst);

		/****************** SetPolynomialPartOnly ******************/
		%feature("compactdefaultargs") SetPolynomialPartOnly;
		%feature("autodoc", "No available documentation.

Parameters
----------
PPOnly: bool,optional
	default value is Standard_True

Returns
-------
None
") SetPolynomialPartOnly;
		void SetPolynomialPartOnly(const Standard_Boolean PPOnly = Standard_True);

		/****************** SolveTI ******************/
		%feature("compactdefaultargs") SolveTI;
		%feature("autodoc", "No available documentation.

Parameters
----------
ord: int,optional
	default value is 4
anisotropie: float,optional
	default value is 1.0
aProgress: Message_ProgressIndicator,optional
	default value is opencascade::handle<Message_ProgressIndicator>()

Returns
-------
None
") SolveTI;
		void SolveTI(const Standard_Integer ord = 4, const Standard_Real anisotropie = 1.0, const opencascade::handle<Message_ProgressIndicator> & aProgress = opencascade::handle<Message_ProgressIndicator>());

		/****************** UVBox ******************/
		%feature("compactdefaultargs") UVBox;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
UMin: float
UMax: float
VMin: float
VMax: float
") UVBox;
		void UVBox(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UVConstraints ******************/
		%feature("compactdefaultargs") UVConstraints;
		%feature("autodoc", "No available documentation.

Parameters
----------
Seq: TColgp_SequenceOfXY

Returns
-------
None
") UVConstraints;
		void UVConstraints(TColgp_SequenceOfXY & Seq);

		/****************** destroy ******************/
		%feature("compactdefaultargs") destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") destroy;
		void destroy();

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
		/****************** Plate_SampledCurveConstraint ******************/
		%feature("compactdefaultargs") Plate_SampledCurveConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
SOPPC: Plate_SequenceOfPinpointConstraint
n: int

Returns
-------
None
") Plate_SampledCurveConstraint;
		 Plate_SampledCurveConstraint(const Plate_SequenceOfPinpointConstraint & SOPPC, const Standard_Integer n);

		/****************** LXYZC ******************/
		%feature("compactdefaultargs") LXYZC;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_LinearXYZConstraint
") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC();

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
