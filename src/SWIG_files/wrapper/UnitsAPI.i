/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define UNITSAPIDOCSTRING
"UnitsAPI module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_unitsapi.html"
%enddef
%module (package="OCC.Core", docstring=UNITSAPIDOCSTRING) UnitsAPI


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
#include<UnitsAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Units_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Units.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum UnitsAPI_SystemUnits {
	UnitsAPI_DEFAULT = 0,
	UnitsAPI_SI = 1,
	UnitsAPI_MDTV = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class UnitsAPI_SystemUnits(IntEnum):
	UnitsAPI_DEFAULT = 0
	UnitsAPI_SI = 1
	UnitsAPI_MDTV = 2
UnitsAPI_DEFAULT = UnitsAPI_SystemUnits.UnitsAPI_DEFAULT
UnitsAPI_SI = UnitsAPI_SystemUnits.UnitsAPI_SI
UnitsAPI_MDTV = UnitsAPI_SystemUnits.UnitsAPI_MDTV
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************
* class UnitsAPI *
*****************/
%rename(unitsapi) UnitsAPI;
class UnitsAPI {
	public:
		/****** UnitsAPI::AnyFromLS ******/
		/****** md5 signature: 801ddd863cc7b6e8dedd6599b5fd8ef5 ******/
		%feature("compactdefaultargs") AnyFromLS;
		%feature("autodoc", "
Parameters
----------
aData: double
aUnit: char *

Return
-------
double

Description
-----------
Converts the local system units value to the local unit value. Example: AnyFromLS(25.4,'in.') returns 1. if the LocalSystem is MDTV. Note: aUnit is also used to identify the type of physical quantity to convert.
") AnyFromLS;
		static double AnyFromLS(const double aData, const char * const aUnit);

		/****** UnitsAPI::AnyFromSI ******/
		/****** md5 signature: 61630b29b0b15ef4ee27097acf491941 ******/
		%feature("compactdefaultargs") AnyFromSI;
		%feature("autodoc", "
Parameters
----------
aData: double
aUnit: char *

Return
-------
double

Description
-----------
Converts the SI system units value to the local unit value. Example: AnyFromSI(0.0254,'in.') returns 0.001 Note: aUnit is also used to identify the type of physical quantity to convert.
") AnyFromSI;
		static double AnyFromSI(const double aData, const char * const aUnit);

		/****** UnitsAPI::AnyToAny ******/
		/****** md5 signature: cadad28827ad93db87ebeb53aca9486b ******/
		%feature("compactdefaultargs") AnyToAny;
		%feature("autodoc", "
Parameters
----------
aData: double
aUnit1: char *
aUnit2: char *

Return
-------
double

Description
-----------
Converts the local unit value to another local unit value. Example: AnyToAny(0.0254,'in.','mm') returns 1. ;.
") AnyToAny;
		static double AnyToAny(const double aData, const char * const aUnit1, const char * const aUnit2);

		/****** UnitsAPI::AnyToLS ******/
		/****** md5 signature: f6311f81ca190371e92153db758ab40a ******/
		%feature("compactdefaultargs") AnyToLS;
		%feature("autodoc", "
Parameters
----------
aData: double
aUnit: char *

Return
-------
double

Description
-----------
Converts the local unit value to the local system units value. Example: AnyToLS(1.,'in.') returns 25.4 if the LocalSystem is MDTV.
") AnyToLS;
		static double AnyToLS(const double aData, const char * const aUnit);

		/****** UnitsAPI::AnyToLS ******/
		/****** md5 signature: 3392d5a0c6202efa257ffec8c2d18b4d ******/
		%feature("compactdefaultargs") AnyToLS;
		%feature("autodoc", "
Parameters
----------
aData: double
aUnit: char *
aDim: Units_Dimensions

Return
-------
double

Description
-----------
Converts the local unit value to the local system units value. and gives the associated dimension of the unit.
") AnyToLS;
		static double AnyToLS(const double aData, const char * const aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****** UnitsAPI::AnyToSI ******/
		/****** md5 signature: 6105e05ea69ea128d0081d07c0eeb2b5 ******/
		%feature("compactdefaultargs") AnyToSI;
		%feature("autodoc", "
Parameters
----------
aData: double
aUnit: char *

Return
-------
double

Description
-----------
Converts the local unit value to the SI system units value. Example: AnyToSI(1.,'in.') returns 0.0254.
") AnyToSI;
		static double AnyToSI(const double aData, const char * const aUnit);

		/****** UnitsAPI::AnyToSI ******/
		/****** md5 signature: eb74e5becd565dbe0135f9b2e0e5f44c ******/
		%feature("compactdefaultargs") AnyToSI;
		%feature("autodoc", "
Parameters
----------
aData: double
aUnit: char *
aDim: Units_Dimensions

Return
-------
double

Description
-----------
Converts the local unit value to the SI system units value. and gives the associated dimension of the unit.
") AnyToSI;
		static double AnyToSI(const double aData, const char * const aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****** UnitsAPI::Check ******/
		/****** md5 signature: 6fbeeb258b2e520c2bad6f92cd559305 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
aQuantity: char *
aUnit: char *

Return
-------
bool

Description
-----------
Checks the coherence between the quantity <aQuantity> and the unit <aUnits> in the current system and returns False when it's WRONG.
") Check;
		static bool Check(const char * const aQuantity, const char * const aUnit);

		/****** UnitsAPI::CurrentFromAny ******/
		/****** md5 signature: 18ebcb03c4b4b154c576078ba1e9b83a ******/
		%feature("compactdefaultargs") CurrentFromAny;
		%feature("autodoc", "
Parameters
----------
aData: double
aQuantity: char *
aUnit: char *

Return
-------
double

Description
-----------
Converts the aData value expressed in the unit aUnit, into the current unit for the working environment, as defined for the physical quantity aQuantity by the last call to the SetCurrentUnit function.
") CurrentFromAny;
		static double CurrentFromAny(const double aData, const char * const aQuantity, const char * const aUnit);

		/****** UnitsAPI::CurrentFromLS ******/
		/****** md5 signature: 862e81322d7333f15e53d444a7ca1aa6 ******/
		%feature("compactdefaultargs") CurrentFromLS;
		%feature("autodoc", "
Parameters
----------
aData: double
aQuantity: char *

Return
-------
double

Description
-----------
Converts the local system units value to the current unit value. Example: CurrentFromLS(1000.,'LENGTH') returns 1. if current length unit is meter and LocalSystem is MDTV.
") CurrentFromLS;
		static double CurrentFromLS(const double aData, const char * const aQuantity);

		/****** UnitsAPI::CurrentFromSI ******/
		/****** md5 signature: 453660e71e2b4409214d805bc8990d9c ******/
		%feature("compactdefaultargs") CurrentFromSI;
		%feature("autodoc", "
Parameters
----------
aData: double
aQuantity: char *

Return
-------
double

Description
-----------
Converts the SI system units value to the current unit value. Example: CurrentFromSI(0.001,'LENGTH') returns 1 if current length unit is millimeter.
") CurrentFromSI;
		static double CurrentFromSI(const double aData, const char * const aQuantity);

		/****** UnitsAPI::CurrentToAny ******/
		/****** md5 signature: afc464ddbc6c0e86291077207457a729 ******/
		%feature("compactdefaultargs") CurrentToAny;
		%feature("autodoc", "
Parameters
----------
aData: double
aQuantity: char *
aUnit: char *

Return
-------
double

Description
-----------
Converts the aData value expressed in the current unit for the working environment, as defined for the physical quantity aQuantity by the last call to the SetCurrentUnit function, into the unit aUnit.
") CurrentToAny;
		static double CurrentToAny(const double aData, const char * const aQuantity, const char * const aUnit);

		/****** UnitsAPI::CurrentToLS ******/
		/****** md5 signature: f32bff4aaacc6ecc58405002f24e097a ******/
		%feature("compactdefaultargs") CurrentToLS;
		%feature("autodoc", "
Parameters
----------
aData: double
aQuantity: char *

Return
-------
double

Description
-----------
Converts the current unit value to the local system units value. Example: CurrentToLS(1.,'LENGTH') returns 1000. if the current length unit is meter and LocalSystem is MDTV.
") CurrentToLS;
		static double CurrentToLS(const double aData, const char * const aQuantity);

		/****** UnitsAPI::CurrentToSI ******/
		/****** md5 signature: 32126c6378974a40255765aea0babeaf ******/
		%feature("compactdefaultargs") CurrentToSI;
		%feature("autodoc", "
Parameters
----------
aData: double
aQuantity: char *

Return
-------
double

Description
-----------
Converts the current unit value to the SI system units value. Example: CurrentToSI(1.,'LENGTH') returns 0.001 if current length unit is millimeter.
") CurrentToSI;
		static double CurrentToSI(const double aData, const char * const aQuantity);

		/****** UnitsAPI::CurrentUnit ******/
		/****** md5 signature: 1d70fa17a72fc218913055145d5b33d4 ******/
		%feature("compactdefaultargs") CurrentUnit;
		%feature("autodoc", "
Parameters
----------
aQuantity: char *

Return
-------
char *

Description
-----------
Returns the current unit dimension <aUnit> from the unit quantity <aQuantity>.
") CurrentUnit;
		static const char * CurrentUnit(const char * const aQuantity);

		/****** UnitsAPI::DimensionAmountOfSubstance ******/
		/****** md5 signature: 6438adbeca1586be140df666112d9ed8 ******/
		%feature("compactdefaultargs") DimensionAmountOfSubstance;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") DimensionAmountOfSubstance;
		static opencascade::handle<Units_Dimensions> DimensionAmountOfSubstance();

		/****** UnitsAPI::DimensionElectricCurrent ******/
		/****** md5 signature: 21bd133915dadd609b39c5ec7d5e7629 ******/
		%feature("compactdefaultargs") DimensionElectricCurrent;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") DimensionElectricCurrent;
		static opencascade::handle<Units_Dimensions> DimensionElectricCurrent();

		/****** UnitsAPI::DimensionLength ******/
		/****** md5 signature: 3673e991eafb1da7b843427cad536a4e ******/
		%feature("compactdefaultargs") DimensionLength;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") DimensionLength;
		static opencascade::handle<Units_Dimensions> DimensionLength();

		/****** UnitsAPI::DimensionLess ******/
		/****** md5 signature: 00b540e353e845d7ec73923b765c2c02 ******/
		%feature("compactdefaultargs") DimensionLess;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") DimensionLess;
		static opencascade::handle<Units_Dimensions> DimensionLess();

		/****** UnitsAPI::DimensionLuminousIntensity ******/
		/****** md5 signature: d170b93d2ba83b38edd5fb174d5101ba ******/
		%feature("compactdefaultargs") DimensionLuminousIntensity;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") DimensionLuminousIntensity;
		static opencascade::handle<Units_Dimensions> DimensionLuminousIntensity();

		/****** UnitsAPI::DimensionMass ******/
		/****** md5 signature: 5f28815039c64689a0d1ee9a899be783 ******/
		%feature("compactdefaultargs") DimensionMass;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") DimensionMass;
		static opencascade::handle<Units_Dimensions> DimensionMass();

		/****** UnitsAPI::DimensionPlaneAngle ******/
		/****** md5 signature: eafc1b650a4fe5a1e64bbc72ae1d78da ******/
		%feature("compactdefaultargs") DimensionPlaneAngle;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") DimensionPlaneAngle;
		static opencascade::handle<Units_Dimensions> DimensionPlaneAngle();

		/****** UnitsAPI::DimensionSolidAngle ******/
		/****** md5 signature: 9fc6af7c5044ea7c920307831d9e3649 ******/
		%feature("compactdefaultargs") DimensionSolidAngle;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
Returns the basic dimensions.
") DimensionSolidAngle;
		static opencascade::handle<Units_Dimensions> DimensionSolidAngle();

		/****** UnitsAPI::DimensionThermodynamicTemperature ******/
		/****** md5 signature: cc757ceec05d862614f1bd3e3981281e ******/
		%feature("compactdefaultargs") DimensionThermodynamicTemperature;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") DimensionThermodynamicTemperature;
		static opencascade::handle<Units_Dimensions> DimensionThermodynamicTemperature();

		/****** UnitsAPI::DimensionTime ******/
		/****** md5 signature: 8e5cc932b54c44ede7e6c6bcb709c213 ******/
		%feature("compactdefaultargs") DimensionTime;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") DimensionTime;
		static opencascade::handle<Units_Dimensions> DimensionTime();

		/****** UnitsAPI::Dimensions ******/
		/****** md5 signature: 5c0f04fad3514a2cb60d2a5fc9d3ac5c ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "
Parameters
----------
aQuantity: char *

Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
return the dimension associated to the quantity.
") Dimensions;
		static opencascade::handle<Units_Dimensions> Dimensions(const char * const aQuantity);

		/****** UnitsAPI::LSToSI ******/
		/****** md5 signature: 5bd1edb82f1c448144f953dd1b46da14 ******/
		%feature("compactdefaultargs") LSToSI;
		%feature("autodoc", "
Parameters
----------
aData: double
aQuantity: char *

Return
-------
double

Description
-----------
Converts the local system units value to the SI system unit value. Example: LSToSI(1.,'LENGTH') returns 0.001 if the local system length unit is millimeter.
") LSToSI;
		static double LSToSI(const double aData, const char * const aQuantity);

		/****** UnitsAPI::LocalSystem ******/
		/****** md5 signature: 61dd63b9b169d3619a3b18bc847f81b2 ******/
		%feature("compactdefaultargs") LocalSystem;
		%feature("autodoc", "Return
-------
UnitsAPI_SystemUnits

Description
-----------
Returns the current local system units.
") LocalSystem;
		static UnitsAPI_SystemUnits LocalSystem();

		/****** UnitsAPI::Reload ******/
		/****** md5 signature: 1fe01e0ae07372f9d155702586441d4d ******/
		%feature("compactdefaultargs") Reload;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reload;
		static void Reload();

		/****** UnitsAPI::SIToLS ******/
		/****** md5 signature: d65dd07f4e5827f95bc7e11f952240a7 ******/
		%feature("compactdefaultargs") SIToLS;
		%feature("autodoc", "
Parameters
----------
aData: double
aQuantity: char *

Return
-------
double

Description
-----------
Converts the SI system unit value to the local system units value. Example: SIToLS(1.,'LENGTH') returns 1000. if the local system length unit is millimeter.
") SIToLS;
		static double SIToLS(const double aData, const char * const aQuantity);

		/****** UnitsAPI::Save ******/
		/****** md5 signature: 5415c3e3c77906824a66d1620fd32f67 ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Return
-------
None

Description
-----------
saves the units in the file .CurrentUnits of the directory pointed by the CSF_CurrentUnitsUserDefaults environment variable.
") Save;
		static void Save();

		/****** UnitsAPI::SetCurrentUnit ******/
		/****** md5 signature: 3dc59886b34cfdd2f58fcdd3bdfc05f8 ******/
		%feature("compactdefaultargs") SetCurrentUnit;
		%feature("autodoc", "
Parameters
----------
aQuantity: char *
aUnit: char *

Return
-------
None

Description
-----------
Sets the current unit dimension <aUnit> to the unit quantity <aQuantity>. Example: SetCurrentUnit('LENGTH','mm').
") SetCurrentUnit;
		static void SetCurrentUnit(const char * const aQuantity, const char * const aUnit);

		/****** UnitsAPI::SetLocalSystem ******/
		/****** md5 signature: ee27f19c32ea8b52c56dd6af5e661b4b ******/
		%feature("compactdefaultargs") SetLocalSystem;
		%feature("autodoc", "
Parameters
----------
aSystemUnit: UnitsAPI_SystemUnits (optional, default to UnitsAPI_SI)

Return
-------
None

Description
-----------
Sets the local system units. Example: SetLocalSystem(UnitsAPI_MDTV).
") SetLocalSystem;
		static void SetLocalSystem(const UnitsAPI_SystemUnits aSystemUnit = UnitsAPI_SI);

};


%extend UnitsAPI {
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
def unitsapi_AnyFromLS(*args):
	return unitsapi.AnyFromLS(*args)

@deprecated
def unitsapi_AnyFromSI(*args):
	return unitsapi.AnyFromSI(*args)

@deprecated
def unitsapi_AnyToAny(*args):
	return unitsapi.AnyToAny(*args)

@deprecated
def unitsapi_AnyToLS(*args):
	return unitsapi.AnyToLS(*args)

@deprecated
def unitsapi_AnyToLS(*args):
	return unitsapi.AnyToLS(*args)

@deprecated
def unitsapi_AnyToSI(*args):
	return unitsapi.AnyToSI(*args)

@deprecated
def unitsapi_AnyToSI(*args):
	return unitsapi.AnyToSI(*args)

@deprecated
def unitsapi_Check(*args):
	return unitsapi.Check(*args)

@deprecated
def unitsapi_CurrentFromAny(*args):
	return unitsapi.CurrentFromAny(*args)

@deprecated
def unitsapi_CurrentFromLS(*args):
	return unitsapi.CurrentFromLS(*args)

@deprecated
def unitsapi_CurrentFromSI(*args):
	return unitsapi.CurrentFromSI(*args)

@deprecated
def unitsapi_CurrentToAny(*args):
	return unitsapi.CurrentToAny(*args)

@deprecated
def unitsapi_CurrentToLS(*args):
	return unitsapi.CurrentToLS(*args)

@deprecated
def unitsapi_CurrentToSI(*args):
	return unitsapi.CurrentToSI(*args)

@deprecated
def unitsapi_CurrentUnit(*args):
	return unitsapi.CurrentUnit(*args)

@deprecated
def unitsapi_DimensionAmountOfSubstance(*args):
	return unitsapi.DimensionAmountOfSubstance(*args)

@deprecated
def unitsapi_DimensionElectricCurrent(*args):
	return unitsapi.DimensionElectricCurrent(*args)

@deprecated
def unitsapi_DimensionLength(*args):
	return unitsapi.DimensionLength(*args)

@deprecated
def unitsapi_DimensionLess(*args):
	return unitsapi.DimensionLess(*args)

@deprecated
def unitsapi_DimensionLuminousIntensity(*args):
	return unitsapi.DimensionLuminousIntensity(*args)

@deprecated
def unitsapi_DimensionMass(*args):
	return unitsapi.DimensionMass(*args)

@deprecated
def unitsapi_DimensionPlaneAngle(*args):
	return unitsapi.DimensionPlaneAngle(*args)

@deprecated
def unitsapi_DimensionSolidAngle(*args):
	return unitsapi.DimensionSolidAngle(*args)

@deprecated
def unitsapi_DimensionThermodynamicTemperature(*args):
	return unitsapi.DimensionThermodynamicTemperature(*args)

@deprecated
def unitsapi_DimensionTime(*args):
	return unitsapi.DimensionTime(*args)

@deprecated
def unitsapi_Dimensions(*args):
	return unitsapi.Dimensions(*args)

@deprecated
def unitsapi_LSToSI(*args):
	return unitsapi.LSToSI(*args)

@deprecated
def unitsapi_LocalSystem(*args):
	return unitsapi.LocalSystem(*args)

@deprecated
def unitsapi_Reload(*args):
	return unitsapi.Reload(*args)

@deprecated
def unitsapi_SIToLS(*args):
	return unitsapi.SIToLS(*args)

@deprecated
def unitsapi_Save(*args):
	return unitsapi.Save(*args)

@deprecated
def unitsapi_SetCurrentUnit(*args):
	return unitsapi.SetCurrentUnit(*args)

@deprecated
def unitsapi_SetLocalSystem(*args):
	return unitsapi.SetLocalSystem(*args)

}
