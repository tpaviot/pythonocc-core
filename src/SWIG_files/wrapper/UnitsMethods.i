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
%define UNITSMETHODSDOCSTRING
"UnitsMethods module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_unitsmethods.html"
%enddef
%module (package="OCC.Core", docstring=UNITSMETHODSDOCSTRING) UnitsMethods


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
#include<UnitsMethods_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum UnitsMethods_LengthUnit {
	UnitsMethods_LengthUnit_Undefined = 0,
	UnitsMethods_LengthUnit_Inch = 1,
	UnitsMethods_LengthUnit_Millimeter = 2,
	UnitsMethods_LengthUnit_Foot = 4,
	UnitsMethods_LengthUnit_Mile = 5,
	UnitsMethods_LengthUnit_Meter = 6,
	UnitsMethods_LengthUnit_Kilometer = 7,
	UnitsMethods_LengthUnit_Mil = 8,
	UnitsMethods_LengthUnit_Micron = 9,
	UnitsMethods_LengthUnit_Centimeter = 10,
	UnitsMethods_LengthUnit_Microinch = 11,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class UnitsMethods_LengthUnit(IntEnum):
	UnitsMethods_LengthUnit_Undefined = 0
	UnitsMethods_LengthUnit_Inch = 1
	UnitsMethods_LengthUnit_Millimeter = 2
	UnitsMethods_LengthUnit_Foot = 4
	UnitsMethods_LengthUnit_Mile = 5
	UnitsMethods_LengthUnit_Meter = 6
	UnitsMethods_LengthUnit_Kilometer = 7
	UnitsMethods_LengthUnit_Mil = 8
	UnitsMethods_LengthUnit_Micron = 9
	UnitsMethods_LengthUnit_Centimeter = 10
	UnitsMethods_LengthUnit_Microinch = 11
UnitsMethods_LengthUnit_Undefined = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Undefined
UnitsMethods_LengthUnit_Inch = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Inch
UnitsMethods_LengthUnit_Millimeter = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Millimeter
UnitsMethods_LengthUnit_Foot = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Foot
UnitsMethods_LengthUnit_Mile = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Mile
UnitsMethods_LengthUnit_Meter = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Meter
UnitsMethods_LengthUnit_Kilometer = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Kilometer
UnitsMethods_LengthUnit_Mil = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Mil
UnitsMethods_LengthUnit_Micron = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Micron
UnitsMethods_LengthUnit_Centimeter = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Centimeter
UnitsMethods_LengthUnit_Microinch = UnitsMethods_LengthUnit.UnitsMethods_LengthUnit_Microinch
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class UnitsMethods *
*********************/
%rename(unitsmethods) UnitsMethods;
class UnitsMethods {
	public:
		/****** UnitsMethods::DumpLengthUnit ******/
		/****** md5 signature: 7e9f29252fe39aeb476d32067ef2003b ******/
		%feature("compactdefaultargs") DumpLengthUnit;
		%feature("autodoc", "
Parameters
----------
theScaleFactor: float
theBaseUnit: UnitsMethods_LengthUnit (optional, default to UnitsMethods_LengthUnit_Millimeter)

Return
-------
str

Description
-----------
Returns string name for the given scale factor.
") DumpLengthUnit;
		static Standard_CString DumpLengthUnit(const Standard_Real theScaleFactor, const UnitsMethods_LengthUnit theBaseUnit = UnitsMethods_LengthUnit_Millimeter);

		/****** UnitsMethods::DumpLengthUnit ******/
		/****** md5 signature: 041378fbbb50f903a1e84aa7dd62133b ******/
		%feature("compactdefaultargs") DumpLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnit: UnitsMethods_LengthUnit

Return
-------
str

Description
-----------
Returns string for the given value of lengthunit.
") DumpLengthUnit;
		static Standard_CString DumpLengthUnit(const UnitsMethods_LengthUnit theUnit);

		/****** UnitsMethods::GetCasCadeLengthUnit ******/
		/****** md5 signature: 4a35e7f810a7fd635427969f415c00c2 ******/
		%feature("compactdefaultargs") GetCasCadeLengthUnit;
		%feature("autodoc", "
Parameters
----------
theBaseUnit: UnitsMethods_LengthUnit (optional, default to UnitsMethods_LengthUnit_Millimeter)

Return
-------
float

Description
-----------
Returns value of current internal unit for cascade in millemeters by default.
") GetCasCadeLengthUnit;
		static Standard_Real GetCasCadeLengthUnit(const UnitsMethods_LengthUnit theBaseUnit = UnitsMethods_LengthUnit_Millimeter);

		/****** UnitsMethods::GetLengthFactorValue ******/
		/****** md5 signature: 17395326a1aa02b6c1d23575c8d21a16 ******/
		%feature("compactdefaultargs") GetLengthFactorValue;
		%feature("autodoc", "
Parameters
----------
theUnit: int

Return
-------
float

Description
-----------
Returns value of unit encoded by parameter theunit (integer value denoting unit, as described in iges standard) in millimeters by default.
") GetLengthFactorValue;
		static Standard_Real GetLengthFactorValue(const Standard_Integer theUnit);

		/****** UnitsMethods::GetLengthUnitByFactorValue ******/
		/****** md5 signature: c591653a1cdd834dd045be23996370a7 ******/
		%feature("compactdefaultargs") GetLengthUnitByFactorValue;
		%feature("autodoc", "
Parameters
----------
theFactorValue: float
theBaseUnit: UnitsMethods_LengthUnit (optional, default to UnitsMethods_LengthUnit_Millimeter)

Return
-------
UnitsMethods_LengthUnit

Description
-----------
Returns the enumeration corresponding to the given scale factor.
") GetLengthUnitByFactorValue;
		static UnitsMethods_LengthUnit GetLengthUnitByFactorValue(const Standard_Real theFactorValue, const UnitsMethods_LengthUnit theBaseUnit = UnitsMethods_LengthUnit_Millimeter);

		/****** UnitsMethods::GetLengthUnitScale ******/
		/****** md5 signature: 6bccef8b04bf4f4544844ae745cb54b1 ******/
		%feature("compactdefaultargs") GetLengthUnitScale;
		%feature("autodoc", "
Parameters
----------
theFromUnit: UnitsMethods_LengthUnit
theToUnit: UnitsMethods_LengthUnit

Return
-------
float

Description
-----------
Returns the scale factor for switch from first given unit to second given unit.
") GetLengthUnitScale;
		static Standard_Real GetLengthUnitScale(const UnitsMethods_LengthUnit theFromUnit, const UnitsMethods_LengthUnit theToUnit);

		/****** UnitsMethods::LengthUnitFromString ******/
		/****** md5 signature: 9c68ff81b8a33221a8ac8c7a597944f3 ******/
		%feature("compactdefaultargs") LengthUnitFromString;
		%feature("autodoc", "
Parameters
----------
theStr: str
theCaseSensitive: bool

Return
-------
UnitsMethods_LengthUnit

Description
-----------
Make conversion of given string to value of lengthunit.
") LengthUnitFromString;
		static UnitsMethods_LengthUnit LengthUnitFromString(Standard_CString theStr, const Standard_Boolean theCaseSensitive);

		/****** UnitsMethods::SetCasCadeLengthUnit ******/
		/****** md5 signature: bae022cf6fb5e154dc0ccbb433978128 ******/
		%feature("compactdefaultargs") SetCasCadeLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnitValue: float
theBaseUnit: UnitsMethods_LengthUnit (optional, default to UnitsMethods_LengthUnit_Millimeter)

Return
-------
None

Description
-----------
Sets value of current internal unit for cascade.
") SetCasCadeLengthUnit;
		static void SetCasCadeLengthUnit(const Standard_Real theUnitValue, const UnitsMethods_LengthUnit theBaseUnit = UnitsMethods_LengthUnit_Millimeter);

		/****** UnitsMethods::SetCasCadeLengthUnit ******/
		/****** md5 signature: 888651f664c4b13f838427a3d533c4b5 ******/
		%feature("compactdefaultargs") SetCasCadeLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnit: int

Return
-------
None

Description
-----------
Sets value of current internal unit for cascade by parameter theunit (integer value denoting unit, as described in iges standard).
") SetCasCadeLengthUnit;
		static void SetCasCadeLengthUnit(const Standard_Integer theUnit);

};


%extend UnitsMethods {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def unitsmethods_DumpLengthUnit(*args):
	return unitsmethods.DumpLengthUnit(*args)

@deprecated
def unitsmethods_DumpLengthUnit(*args):
	return unitsmethods.DumpLengthUnit(*args)

@deprecated
def unitsmethods_GetCasCadeLengthUnit(*args):
	return unitsmethods.GetCasCadeLengthUnit(*args)

@deprecated
def unitsmethods_GetLengthFactorValue(*args):
	return unitsmethods.GetLengthFactorValue(*args)

@deprecated
def unitsmethods_GetLengthUnitByFactorValue(*args):
	return unitsmethods.GetLengthUnitByFactorValue(*args)

@deprecated
def unitsmethods_GetLengthUnitScale(*args):
	return unitsmethods.GetLengthUnitScale(*args)

@deprecated
def unitsmethods_LengthUnitFromString(*args):
	return unitsmethods.LengthUnitFromString(*args)

@deprecated
def unitsmethods_SetCasCadeLengthUnit(*args):
	return unitsmethods.SetCasCadeLengthUnit(*args)

@deprecated
def unitsmethods_SetCasCadeLengthUnit(*args):
	return unitsmethods.SetCasCadeLengthUnit(*args)

}
