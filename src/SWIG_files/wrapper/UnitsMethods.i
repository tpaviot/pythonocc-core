/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_unitsmethods.html"
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
		/****** md5 signature: c1d42045b661fcd1a815493ac34b0d58 ******/
		%feature("compactdefaultargs") DumpLengthUnit;
		%feature("autodoc", "
Parameters
----------
theScaleFactor: double
theBaseUnit: UnitsMethods_LengthUnit (optional, default to UnitsMethods_LengthUnit_Millimeter)

Return
-------
char *

Description
-----------
Returns string name for the given scale factor.
") DumpLengthUnit;
		static const char * DumpLengthUnit(const double theScaleFactor, const UnitsMethods_LengthUnit theBaseUnit = UnitsMethods_LengthUnit_Millimeter);

		/****** UnitsMethods::DumpLengthUnit ******/
		/****** md5 signature: bb4652d1f5f145a80412aa4f3bed7eb2 ******/
		%feature("compactdefaultargs") DumpLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnit: UnitsMethods_LengthUnit

Return
-------
char *

Description
-----------
Returns string for the given value of LengthUnit.
") DumpLengthUnit;
		static const char * DumpLengthUnit(const UnitsMethods_LengthUnit theUnit);

		/****** UnitsMethods::GetCasCadeLengthUnit ******/
		/****** md5 signature: 56fb48d5269c52e14475fde13cd10fe4 ******/
		%feature("compactdefaultargs") GetCasCadeLengthUnit;
		%feature("autodoc", "
Parameters
----------
theBaseUnit: UnitsMethods_LengthUnit (optional, default to UnitsMethods_LengthUnit_Millimeter)

Return
-------
double

Description
-----------
Returns value of current internal unit for CASCADE in millemeters by default.
") GetCasCadeLengthUnit;
		static double GetCasCadeLengthUnit(const UnitsMethods_LengthUnit theBaseUnit = UnitsMethods_LengthUnit_Millimeter);

		/****** UnitsMethods::GetLengthFactorValue ******/
		/****** md5 signature: 163cb23487d25aeb5800dfe12c3522fd ******/
		%feature("compactdefaultargs") GetLengthFactorValue;
		%feature("autodoc", "
Parameters
----------
theUnit: int

Return
-------
double

Description
-----------
Returns value of unit encoded by parameter theUnit (integer value denoting unit, as described in IGES standard) in millimeters by default.
") GetLengthFactorValue;
		static double GetLengthFactorValue(const int theUnit);

		/****** UnitsMethods::GetLengthUnitByFactorValue ******/
		/****** md5 signature: f4933809957dd0d9b593b7316508cd75 ******/
		%feature("compactdefaultargs") GetLengthUnitByFactorValue;
		%feature("autodoc", "
Parameters
----------
theFactorValue: double
theBaseUnit: UnitsMethods_LengthUnit (optional, default to UnitsMethods_LengthUnit_Millimeter)

Return
-------
UnitsMethods_LengthUnit

Description
-----------
Returns the enumeration corresponding to the given scale factor.
") GetLengthUnitByFactorValue;
		static UnitsMethods_LengthUnit GetLengthUnitByFactorValue(const double theFactorValue, const UnitsMethods_LengthUnit theBaseUnit = UnitsMethods_LengthUnit_Millimeter);

		/****** UnitsMethods::GetLengthUnitScale ******/
		/****** md5 signature: 68b67b7769a1a53a3e5c4b2ada4bb30d ******/
		%feature("compactdefaultargs") GetLengthUnitScale;
		%feature("autodoc", "
Parameters
----------
theFromUnit: UnitsMethods_LengthUnit
theToUnit: UnitsMethods_LengthUnit

Return
-------
double

Description
-----------
Returns the scale factor for switch from first given unit to second given unit.
") GetLengthUnitScale;
		static double GetLengthUnitScale(const UnitsMethods_LengthUnit theFromUnit, const UnitsMethods_LengthUnit theToUnit);

		/****** UnitsMethods::LengthUnitFromString ******/
		/****** md5 signature: f83887e3c2382cb8f89e079e5e50595b ******/
		%feature("compactdefaultargs") LengthUnitFromString;
		%feature("autodoc", "
Parameters
----------
theStr: char *
theCaseSensitive: bool

Return
-------
UnitsMethods_LengthUnit

Description
-----------
Make conversion of given string to value of LengthUnit.
") LengthUnitFromString;
		static UnitsMethods_LengthUnit LengthUnitFromString(const char * theStr, const bool theCaseSensitive);

		/****** UnitsMethods::SetCasCadeLengthUnit ******/
		/****** md5 signature: 6e1696597159c5f9f4f271f4fdc1350c ******/
		%feature("compactdefaultargs") SetCasCadeLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnitValue: double
theBaseUnit: UnitsMethods_LengthUnit (optional, default to UnitsMethods_LengthUnit_Millimeter)

Return
-------
None

Description
-----------
Sets value of current internal unit for CASCADE.
") SetCasCadeLengthUnit;
		static void SetCasCadeLengthUnit(const double theUnitValue, const UnitsMethods_LengthUnit theBaseUnit = UnitsMethods_LengthUnit_Millimeter);

		/****** UnitsMethods::SetCasCadeLengthUnit ******/
		/****** md5 signature: 9cd8941060719d1a54ccf2ab64f019a2 ******/
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
Sets value of current internal unit for CASCADE by parameter theUnit (integer value denoting unit, as described in IGES standard).
") SetCasCadeLengthUnit;
		static void SetCasCadeLengthUnit(const int theUnit);

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
