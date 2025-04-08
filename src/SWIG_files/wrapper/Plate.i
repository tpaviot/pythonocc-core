/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_plate.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Plate_HArray1OfPinpointConstraint)
/* end handles declaration */

/* templates */
%template(Plate_Array1OfPinpointConstraint) NCollection_Array1<Plate_PinpointConstraint>;
Array1ExtendIter(Plate_PinpointConstraint)

%template(Plate_SequenceOfLinearScalarConstraint) NCollection_Sequence<Plate_LinearScalarConstraint>;

%extend NCollection_Sequence<Plate_LinearScalarConstraint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Plate_SequenceOfLinearXYZConstraint) NCollection_Sequence<Plate_LinearXYZConstraint>;

%extend NCollection_Sequence<Plate_LinearXYZConstraint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Plate_SequenceOfPinpointConstraint) NCollection_Sequence<Plate_PinpointConstraint>;

%extend NCollection_Sequence<Plate_PinpointConstraint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/****** Plate_D1::Plate_D1 ******/
		/****** md5 signature: 8ba34497219ef530285a65c4e744a342 ******/
		%feature("compactdefaultargs") Plate_D1;
		%feature("autodoc", "
Parameters
----------
du: gp_XYZ
dv: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") Plate_D1;
		 Plate_D1(const gp_XYZ & du, const gp_XYZ & dv);

		/****** Plate_D1::Plate_D1 ******/
		/****** md5 signature: 814df331754f6db2141c738e6283284a ******/
		%feature("compactdefaultargs") Plate_D1;
		%feature("autodoc", "
Parameters
----------
ref: Plate_D1

Return
-------
None

Description
-----------
No available documentation.
") Plate_D1;
		 Plate_D1(const Plate_D1 & ref);

		/****** Plate_D1::DU ******/
		/****** md5 signature: 8cd99c545d3f7e9d7e21920bba53d637 ******/
		%feature("compactdefaultargs") DU;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
No available documentation.
") DU;
		const gp_XYZ DU();

		/****** Plate_D1::DV ******/
		/****** md5 signature: 662b02b959115a9aec2c35a38513ef95 ******/
		%feature("compactdefaultargs") DV;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
No available documentation.
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
		/****** Plate_D2::Plate_D2 ******/
		/****** md5 signature: e12dd38b6c388e496fb78c0a61807e3e ******/
		%feature("compactdefaultargs") Plate_D2;
		%feature("autodoc", "
Parameters
----------
duu: gp_XYZ
duv: gp_XYZ
dvv: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") Plate_D2;
		 Plate_D2(const gp_XYZ & duu, const gp_XYZ & duv, const gp_XYZ & dvv);

		/****** Plate_D2::Plate_D2 ******/
		/****** md5 signature: ed29fd74d8090dd0f07f2132f64e999a ******/
		%feature("compactdefaultargs") Plate_D2;
		%feature("autodoc", "
Parameters
----------
ref: Plate_D2

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Plate_D3::Plate_D3 ******/
		/****** md5 signature: db260c0329a09f1c16aea59f1f719bfc ******/
		%feature("compactdefaultargs") Plate_D3;
		%feature("autodoc", "
Parameters
----------
duuu: gp_XYZ
duuv: gp_XYZ
duvv: gp_XYZ
dvvv: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") Plate_D3;
		 Plate_D3(const gp_XYZ & duuu, const gp_XYZ & duuv, const gp_XYZ & duvv, const gp_XYZ & dvvv);

		/****** Plate_D3::Plate_D3 ******/
		/****** md5 signature: bb42a5f38a8c54484e76acecd0030460 ******/
		%feature("compactdefaultargs") Plate_D3;
		%feature("autodoc", "
Parameters
----------
ref: Plate_D3

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Plate_FreeGtoCConstraint::Plate_FreeGtoCConstraint ******/
		/****** md5 signature: 29b295328ddcb6895dce6a02b405f5f5 ******/
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
IncrementalLoad: float (optional, default to 1.0)
orientation: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Standard_Real IncrementalLoad = 1.0, const Standard_Integer orientation = 0);

		/****** Plate_FreeGtoCConstraint::Plate_FreeGtoCConstraint ******/
		/****** md5 signature: 27d1f8d47334612df4bd5ecbf299db9b ******/
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2
IncrementalLoad: float (optional, default to 1.0)
orientation: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T, const Standard_Real IncrementalLoad = 1.0, const Standard_Integer orientation = 0);

		/****** Plate_FreeGtoCConstraint::Plate_FreeGtoCConstraint ******/
		/****** md5 signature: 325ce01a43177b7fbbe14401a022e1a7 ******/
		%feature("compactdefaultargs") Plate_FreeGtoCConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2
D3S: Plate_D3
D3T: Plate_D3
IncrementalLoad: float (optional, default to 1.0)
orientation: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Plate_FreeGtoCConstraint;
		 Plate_FreeGtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T, const Plate_D3 & D3S, const Plate_D3 & D3T, const Standard_Real IncrementalLoad = 1.0, const Standard_Integer orientation = 0);

		/****** Plate_FreeGtoCConstraint::GetPPC ******/
		/****** md5 signature: 695378f1c780027da746944a9cf65e7c ******/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Plate_PinpointConstraint

Description
-----------
No available documentation.
") GetPPC;
		const Plate_PinpointConstraint & GetPPC(const Standard_Integer Index);

		/****** Plate_FreeGtoCConstraint::LSC ******/
		/****** md5 signature: e14687dbaa35e7d87be4800e1b2b7a0e ******/
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Plate_LinearScalarConstraint

Description
-----------
No available documentation.
") LSC;
		const Plate_LinearScalarConstraint & LSC(const Standard_Integer Index);

		/****** Plate_FreeGtoCConstraint::nb_LSC ******/
		/****** md5 signature: 479420512eeabffd9f945a5e77c48828 ******/
		%feature("compactdefaultargs") nb_LSC;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") nb_LSC;
		const Standard_Integer & nb_LSC();

		/****** Plate_FreeGtoCConstraint::nb_PPC ******/
		/****** md5 signature: 09fff986f7b5f70d54a442a90b2b0e7b ******/
		%feature("compactdefaultargs") nb_PPC;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
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
		/****** Plate_GlobalTranslationConstraint::Plate_GlobalTranslationConstraint ******/
		/****** md5 signature: f6742f1d9db017bae0bb912df773dd39 ******/
		%feature("compactdefaultargs") Plate_GlobalTranslationConstraint;
		%feature("autodoc", "
Parameters
----------
SOfXY: TColgp_SequenceOfXY

Return
-------
None

Description
-----------
No available documentation.
") Plate_GlobalTranslationConstraint;
		 Plate_GlobalTranslationConstraint(const TColgp_SequenceOfXY & SOfXY);

		/****** Plate_GlobalTranslationConstraint::LXYZC ******/
		/****** md5 signature: 422f3ddc3fa5aee73e09010319f27198 ******/
		%feature("compactdefaultargs") LXYZC;
		%feature("autodoc", "Return
-------
Plate_LinearXYZConstraint

Description
-----------
No available documentation.
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
		/****** Plate_GtoCConstraint::Plate_GtoCConstraint ******/
		/****** md5 signature: 7bfd49e2c32ec8ac022c1e9bcc504dd6 ******/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "
Parameters
----------
ref: Plate_GtoCConstraint

Return
-------
None

Description
-----------
No available documentation.
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const Plate_GtoCConstraint & ref);

		/****** Plate_GtoCConstraint::Plate_GtoCConstraint ******/
		/****** md5 signature: 725d1d1e8a584f4116e319e1f8ee4bd3 ******/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1

Return
-------
None

Description
-----------
No available documentation.
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T);

		/****** Plate_GtoCConstraint::Plate_GtoCConstraint ******/
		/****** md5 signature: 2ced1659e3703ada385926d5574097c4 ******/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
nP: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const gp_XYZ & nP);

		/****** Plate_GtoCConstraint::Plate_GtoCConstraint ******/
		/****** md5 signature: b5ef3ecc80b40d1249fa52f04294d99b ******/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2

Return
-------
None

Description
-----------
No available documentation.
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T);

		/****** Plate_GtoCConstraint::Plate_GtoCConstraint ******/
		/****** md5 signature: 7d68402753d6a6c7c90b7b259ca20648 ******/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2
nP: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T, const gp_XYZ & nP);

		/****** Plate_GtoCConstraint::Plate_GtoCConstraint ******/
		/****** md5 signature: b4b603951e9dc5c5b864b4e5e1eeb56f ******/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
D1S: Plate_D1
D1T: Plate_D1
D2S: Plate_D2
D2T: Plate_D2
D3S: Plate_D3
D3T: Plate_D3

Return
-------
None

Description
-----------
No available documentation.
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T, const Plate_D3 & D3S, const Plate_D3 & D3T);

		/****** Plate_GtoCConstraint::Plate_GtoCConstraint ******/
		/****** md5 signature: 5f6af67343fe1725cb9e6526ab4e584e ******/
		%feature("compactdefaultargs") Plate_GtoCConstraint;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Plate_GtoCConstraint;
		 Plate_GtoCConstraint(const gp_XY & point2d, const Plate_D1 & D1S, const Plate_D1 & D1T, const Plate_D2 & D2S, const Plate_D2 & D2T, const Plate_D3 & D3S, const Plate_D3 & D3T, const gp_XYZ & nP);

		/****** Plate_GtoCConstraint::D1SurfInit ******/
		/****** md5 signature: 84c53d131c2997fe4d377ab566a230e2 ******/
		%feature("compactdefaultargs") D1SurfInit;
		%feature("autodoc", "Return
-------
Plate_D1

Description
-----------
No available documentation.
") D1SurfInit;
		const Plate_D1 & D1SurfInit();

		/****** Plate_GtoCConstraint::GetPPC ******/
		/****** md5 signature: 695378f1c780027da746944a9cf65e7c ******/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Plate_PinpointConstraint

Description
-----------
No available documentation.
") GetPPC;
		const Plate_PinpointConstraint & GetPPC(const Standard_Integer Index);

		/****** Plate_GtoCConstraint::nb_PPC ******/
		/****** md5 signature: 09fff986f7b5f70d54a442a90b2b0e7b ******/
		%feature("compactdefaultargs") nb_PPC;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
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
		/****** Plate_LineConstraint::Plate_LineConstraint ******/
		/****** md5 signature: 9e8c5b71f9abe63b78fb3afd294501ca ******/
		%feature("compactdefaultargs") Plate_LineConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
lin: gp_Lin
iu: int (optional, default to 0)
iv: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Plate_LineConstraint;
		 Plate_LineConstraint(const gp_XY & point2d, const gp_Lin & lin, const Standard_Integer iu = 0, const Standard_Integer iv = 0);

		/****** Plate_LineConstraint::LSC ******/
		/****** md5 signature: 38e8ce4a9a7d5c615d696ae043b116ea ******/
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "Return
-------
Plate_LinearScalarConstraint

Description
-----------
No available documentation.
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
		/****** Plate_LinearScalarConstraint::Plate_LinearScalarConstraint ******/
		/****** md5 signature: 47a3e4ed7ff51fc0cf4dfe43a4c85719 ******/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint();

		/****** Plate_LinearScalarConstraint::Plate_LinearScalarConstraint ******/
		/****** md5 signature: 545dedf4fc5374bd82a0e1125663a65b ******/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "
Parameters
----------
thePPC1: Plate_PinpointConstraint
theCoeff: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint(const Plate_PinpointConstraint & thePPC1, const gp_XYZ & theCoeff);

		/****** Plate_LinearScalarConstraint::Plate_LinearScalarConstraint ******/
		/****** md5 signature: da3961e8596b93cc48d49ab64c1ab15a ******/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "
Parameters
----------
thePPC: Plate_Array1OfPinpointConstraint
theCoeff: TColgp_Array1OfXYZ

Return
-------
None

Description
-----------
No available documentation.
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint(const Plate_Array1OfPinpointConstraint & thePPC, const TColgp_Array1OfXYZ & theCoeff);

		/****** Plate_LinearScalarConstraint::Plate_LinearScalarConstraint ******/
		/****** md5 signature: bd9920ac303c0c6e5ffe47897152076b ******/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "
Parameters
----------
thePPC: Plate_Array1OfPinpointConstraint
theCoeff: TColgp_Array2OfXYZ

Return
-------
None

Description
-----------
No available documentation.
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint(const Plate_Array1OfPinpointConstraint & thePPC, const TColgp_Array2OfXYZ & theCoeff);

		/****** Plate_LinearScalarConstraint::Plate_LinearScalarConstraint ******/
		/****** md5 signature: 93e699f78ebeb293f274d15b8e593871 ******/
		%feature("compactdefaultargs") Plate_LinearScalarConstraint;
		%feature("autodoc", "
Parameters
----------
ColLen: int
RowLen: int

Return
-------
None

Description
-----------
No available documentation.
") Plate_LinearScalarConstraint;
		 Plate_LinearScalarConstraint(const Standard_Integer ColLen, const Standard_Integer RowLen);

		/****** Plate_LinearScalarConstraint::Coeff ******/
		/****** md5 signature: 7913c7634d4783c9f642b656f154b277 ******/
		%feature("compactdefaultargs") Coeff;
		%feature("autodoc", "Return
-------
TColgp_Array2OfXYZ

Description
-----------
No available documentation.
") Coeff;
		const TColgp_Array2OfXYZ & Coeff();

		/****** Plate_LinearScalarConstraint::GetPPC ******/
		/****** md5 signature: 8f4d511ec72379feb2e7cbc31c303cda ******/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "Return
-------
Plate_Array1OfPinpointConstraint

Description
-----------
No available documentation.
") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC();

		/****** Plate_LinearScalarConstraint::SetCoeff ******/
		/****** md5 signature: 58d8ef6c7b6183f95bd6ad9a79c4811b ******/
		%feature("compactdefaultargs") SetCoeff;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int
Value: gp_XYZ

Return
-------
None

Description
-----------
Sets the coeff of index (Row,Col) to Value raise if Row (respectively Col) is greater than the Row (respectively Column) length of coeff.
") SetCoeff;
		void SetCoeff(const Standard_Integer Row, const Standard_Integer Col, const gp_XYZ & Value);

		/****** Plate_LinearScalarConstraint::SetPPC ******/
		/****** md5 signature: dd1eab2cb2bd1527024a9768fcfeb4b6 ******/
		%feature("compactdefaultargs") SetPPC;
		%feature("autodoc", "
Parameters
----------
Index: int
Value: Plate_PinpointConstraint

Return
-------
None

Description
-----------
Sets the PinPointConstraint of index Index to Value raise if Index is greater than the length of PPC or the Row length of coeff or lower than 1.
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
		/****** Plate_LinearXYZConstraint::Plate_LinearXYZConstraint ******/
		/****** md5 signature: 8b49643f2a05b8686f5eb4fe29fb00b5 ******/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint();

		/****** Plate_LinearXYZConstraint::Plate_LinearXYZConstraint ******/
		/****** md5 signature: 71848a1749b080c18b7be2e8c103a7b9 ******/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "
Parameters
----------
thePPC: Plate_Array1OfPinpointConstraint
theCoeff: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint(const Plate_Array1OfPinpointConstraint & thePPC, const TColStd_Array1OfReal & theCoeff);

		/****** Plate_LinearXYZConstraint::Plate_LinearXYZConstraint ******/
		/****** md5 signature: 8b50c3134baa426e1a50682f2fc5d3f2 ******/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "
Parameters
----------
thePPC: Plate_Array1OfPinpointConstraint
theCoeff: TColStd_Array2OfReal

Return
-------
None

Description
-----------
No available documentation.
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint(const Plate_Array1OfPinpointConstraint & thePPC, const TColStd_Array2OfReal & theCoeff);

		/****** Plate_LinearXYZConstraint::Plate_LinearXYZConstraint ******/
		/****** md5 signature: 25a773f54445604ce2b2dc0873886620 ******/
		%feature("compactdefaultargs") Plate_LinearXYZConstraint;
		%feature("autodoc", "
Parameters
----------
ColLen: int
RowLen: int

Return
-------
None

Description
-----------
No available documentation.
") Plate_LinearXYZConstraint;
		 Plate_LinearXYZConstraint(const Standard_Integer ColLen, const Standard_Integer RowLen);

		/****** Plate_LinearXYZConstraint::Coeff ******/
		/****** md5 signature: b7ca65ff8c4de9597eb9b525e70b8f26 ******/
		%feature("compactdefaultargs") Coeff;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal

Description
-----------
No available documentation.
") Coeff;
		const TColStd_Array2OfReal & Coeff();

		/****** Plate_LinearXYZConstraint::GetPPC ******/
		/****** md5 signature: 8f4d511ec72379feb2e7cbc31c303cda ******/
		%feature("compactdefaultargs") GetPPC;
		%feature("autodoc", "Return
-------
Plate_Array1OfPinpointConstraint

Description
-----------
No available documentation.
") GetPPC;
		const Plate_Array1OfPinpointConstraint & GetPPC();

		/****** Plate_LinearXYZConstraint::SetCoeff ******/
		/****** md5 signature: 6b3c5367b9fbe33400f0d16eea478cc1 ******/
		%feature("compactdefaultargs") SetCoeff;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int
Value: float

Return
-------
None

Description
-----------
Sets the coeff of index (Row,Col) to Value raise if Row (respectively Col) is greater than the Row (respectively Column) length of coeff.
") SetCoeff;
		void SetCoeff(const Standard_Integer Row, const Standard_Integer Col, const Standard_Real Value);

		/****** Plate_LinearXYZConstraint::SetPPC ******/
		/****** md5 signature: dd1eab2cb2bd1527024a9768fcfeb4b6 ******/
		%feature("compactdefaultargs") SetPPC;
		%feature("autodoc", "
Parameters
----------
Index: int
Value: Plate_PinpointConstraint

Return
-------
None

Description
-----------
Sets the PinPointConstraint of index Index to Value raise if Index is greater than the length of PPC or the Row length of coeff or lower than 1.
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
		/****** Plate_PinpointConstraint::Plate_PinpointConstraint ******/
		/****** md5 signature: 2cd15a31cea900dd581893849ee9c551 ******/
		%feature("compactdefaultargs") Plate_PinpointConstraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Plate_PinpointConstraint;
		 Plate_PinpointConstraint();

		/****** Plate_PinpointConstraint::Plate_PinpointConstraint ******/
		/****** md5 signature: 0f1943cae51c0d49a9ee7af5e5ffdfff ******/
		%feature("compactdefaultargs") Plate_PinpointConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
ImposedValue: gp_XYZ
iu: int (optional, default to 0)
iv: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Plate_PinpointConstraint;
		 Plate_PinpointConstraint(const gp_XY & point2d, const gp_XYZ & ImposedValue, const Standard_Integer iu = 0, const Standard_Integer iv = 0);

		/****** Plate_PinpointConstraint::Idu ******/
		/****** md5 signature: 7e2fc55cdc8d94beee516884bb81e202 ******/
		%feature("compactdefaultargs") Idu;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Idu;
		const Standard_Integer & Idu();

		/****** Plate_PinpointConstraint::Idv ******/
		/****** md5 signature: 0edf326fa1eec836dd81944f5ddf0afc ******/
		%feature("compactdefaultargs") Idv;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Idv;
		const Standard_Integer & Idv();

		/****** Plate_PinpointConstraint::Pnt2d ******/
		/****** md5 signature: 3b3633201b450c67df56dc33d49ac9cf ******/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
No available documentation.
") Pnt2d;
		const gp_XY Pnt2d();

		/****** Plate_PinpointConstraint::Value ******/
		/****** md5 signature: e2670fcf9256a4bd8b7f969afb2e8a04 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
No available documentation.
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
		/****** Plate_PlaneConstraint::Plate_PlaneConstraint ******/
		/****** md5 signature: aaa0777cb029912b7c9481ceb828497a ******/
		%feature("compactdefaultargs") Plate_PlaneConstraint;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
pln: gp_Pln
iu: int (optional, default to 0)
iv: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Plate_PlaneConstraint;
		 Plate_PlaneConstraint(const gp_XY & point2d, const gp_Pln & pln, const Standard_Integer iu = 0, const Standard_Integer iv = 0);

		/****** Plate_PlaneConstraint::LSC ******/
		/****** md5 signature: 38e8ce4a9a7d5c615d696ae043b116ea ******/
		%feature("compactdefaultargs") LSC;
		%feature("autodoc", "Return
-------
Plate_LinearScalarConstraint

Description
-----------
No available documentation.
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
		/****** Plate_Plate::Plate_Plate ******/
		/****** md5 signature: 58edd9d1e1de1a5a9edaf21ae1bd6f0d ******/
		%feature("compactdefaultargs") Plate_Plate;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Plate_Plate;
		 Plate_Plate();

		/****** Plate_Plate::Plate_Plate ******/
		/****** md5 signature: 8719e2ffd1e576e36f43996203e0745b ******/
		%feature("compactdefaultargs") Plate_Plate;
		%feature("autodoc", "
Parameters
----------
Ref: Plate_Plate

Return
-------
None

Description
-----------
No available documentation.
") Plate_Plate;
		 Plate_Plate(const Plate_Plate & Ref);

		/****** Plate_Plate::CoefPol ******/
		/****** md5 signature: 693ab25cab6687e98493b4413c4ff8c8 ******/
		%feature("compactdefaultargs") CoefPol;
		%feature("autodoc", "
Parameters
----------
Coefs: TColgp_HArray2OfXYZ

Return
-------
None

Description
-----------
No available documentation.
") CoefPol;
		void CoefPol(opencascade::handle<TColgp_HArray2OfXYZ> & Coefs);

		/****** Plate_Plate::Continuity ******/
		/****** md5 signature: 4419dd4b2da2aca1389c21e00b442ec1 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Continuity;
		Standard_Integer Continuity();

		/****** Plate_Plate::Copy ******/
		/****** md5 signature: 11161ac3ed152899e6cd888fd0156816 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
Ref: Plate_Plate

Return
-------
Plate_Plate

Description
-----------
No available documentation.
") Copy;
		Plate_Plate & Copy(const Plate_Plate & Ref);

		/****** Plate_Plate::Evaluate ******/
		/****** md5 signature: ea37005a58aaa9db10c00849da660f56 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") Evaluate;
		gp_XYZ Evaluate(const gp_XY & point2d);

		/****** Plate_Plate::EvaluateDerivative ******/
		/****** md5 signature: a5aa59fe21be13fd1db05e43decf620a ******/
		%feature("compactdefaultargs") EvaluateDerivative;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
iu: int
iv: int

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") EvaluateDerivative;
		gp_XYZ EvaluateDerivative(const gp_XY & point2d, const Standard_Integer iu, const Standard_Integer iv);

		/****** Plate_Plate::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
reset the Plate in the initial state ( same as after Create()).
") Init;
		void Init();

		/****** Plate_Plate::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

		/****** Plate_Plate::Load ******/
		/****** md5 signature: 064f1d3f157aabb80335e0398ecf85c0 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
PConst: Plate_PinpointConstraint

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const Plate_PinpointConstraint & PConst);

		/****** Plate_Plate::Load ******/
		/****** md5 signature: bbb1bbd90d1b9d0d98e638752205e2f0 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
LXYZConst: Plate_LinearXYZConstraint

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const Plate_LinearXYZConstraint & LXYZConst);

		/****** Plate_Plate::Load ******/
		/****** md5 signature: ab1ab2febc2fac18616164237d6c1f68 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
LScalarConst: Plate_LinearScalarConstraint

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const Plate_LinearScalarConstraint & LScalarConst);

		/****** Plate_Plate::Load ******/
		/****** md5 signature: b250c301efd7c7081299aca2ac0fb5da ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
GTConst: Plate_GlobalTranslationConstraint

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const Plate_GlobalTranslationConstraint & GTConst);

		/****** Plate_Plate::Load ******/
		/****** md5 signature: 5cf6714f0baf24304dec8653fbe6ef18 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
LConst: Plate_LineConstraint

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const Plate_LineConstraint & LConst);

		/****** Plate_Plate::Load ******/
		/****** md5 signature: a1b097fba94d2e5cf5c61aaeb5a271ca ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
PConst: Plate_PlaneConstraint

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const Plate_PlaneConstraint & PConst);

		/****** Plate_Plate::Load ******/
		/****** md5 signature: 24c0aa364590a5203165f0967ca3c463 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
SCConst: Plate_SampledCurveConstraint

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const Plate_SampledCurveConstraint & SCConst);

		/****** Plate_Plate::Load ******/
		/****** md5 signature: d7aa5b2ff5d3845ac7a8c4293badd5bb ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
GtoCConst: Plate_GtoCConstraint

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const Plate_GtoCConstraint & GtoCConst);

		/****** Plate_Plate::Load ******/
		/****** md5 signature: 2dc1b141a679101fbcc203b81998a49f ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
FGtoCConst: Plate_FreeGtoCConstraint

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const Plate_FreeGtoCConstraint & FGtoCConst);

		/****** Plate_Plate::SetPolynomialPartOnly ******/
		/****** md5 signature: c30b7a41a33baec8da0d64e93f0095e2 ******/
		%feature("compactdefaultargs") SetPolynomialPartOnly;
		%feature("autodoc", "
Parameters
----------
PPOnly: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") SetPolynomialPartOnly;
		void SetPolynomialPartOnly(const Standard_Boolean PPOnly = Standard_True);

		/****** Plate_Plate::SolveTI ******/
		/****** md5 signature: b6f245e5d0ad13246dbcd6e1b4b16e27 ******/
		%feature("compactdefaultargs") SolveTI;
		%feature("autodoc", "
Parameters
----------
ord: int (optional, default to 4)
anisotropie: float (optional, default to 1.0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") SolveTI;
		void SolveTI(const Standard_Integer ord = 4, const Standard_Real anisotropie = 1.0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Plate_Plate::UVBox ******/
		/****** md5 signature: 2932a6c5a69aed4f94ed47869da039af ******/
		%feature("compactdefaultargs") UVBox;
		%feature("autodoc", "
Parameters
----------

Return
-------
UMin: float
UMax: float
VMin: float
VMax: float

Description
-----------
No available documentation.
") UVBox;
		void UVBox(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Plate_Plate::UVConstraints ******/
		/****** md5 signature: d57eab39272d2074498d2a7de968b6db ******/
		%feature("compactdefaultargs") UVConstraints;
		%feature("autodoc", "
Parameters
----------
Seq: TColgp_SequenceOfXY

Return
-------
None

Description
-----------
No available documentation.
") UVConstraints;
		void UVConstraints(TColgp_SequenceOfXY & Seq);

		/****** Plate_Plate::destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** Plate_SampledCurveConstraint::Plate_SampledCurveConstraint ******/
		/****** md5 signature: 1da069f176ed627191a0dcdae227d548 ******/
		%feature("compactdefaultargs") Plate_SampledCurveConstraint;
		%feature("autodoc", "
Parameters
----------
SOPPC: Plate_SequenceOfPinpointConstraint
n: int

Return
-------
None

Description
-----------
No available documentation.
") Plate_SampledCurveConstraint;
		 Plate_SampledCurveConstraint(const Plate_SequenceOfPinpointConstraint & SOPPC, const Standard_Integer n);

		/****** Plate_SampledCurveConstraint::LXYZC ******/
		/****** md5 signature: 422f3ddc3fa5aee73e09010319f27198 ******/
		%feature("compactdefaultargs") LXYZC;
		%feature("autodoc", "Return
-------
Plate_LinearXYZConstraint

Description
-----------
No available documentation.
") LXYZC;
		const Plate_LinearXYZConstraint & LXYZC();

};


%extend Plate_SampledCurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class Plate_HArray1OfPinpointConstraint : public Plate_Array1OfPinpointConstraint, public Standard_Transient {
  public:
    Plate_HArray1OfPinpointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper);
    Plate_HArray1OfPinpointConstraint(const Standard_Integer theLower, const Standard_Integer theUpper, const Plate_Array1OfPinpointConstraint::value_type& theValue);
    Plate_HArray1OfPinpointConstraint(const Plate_Array1OfPinpointConstraint& theOther);
    const Plate_Array1OfPinpointConstraint& Array1();
    Plate_Array1OfPinpointConstraint& ChangeArray1();
};
%make_alias(Plate_HArray1OfPinpointConstraint)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
