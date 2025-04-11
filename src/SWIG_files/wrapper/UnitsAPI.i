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
		/****** md5 signature: 56e084e6a1e979f242ce3261471a2e19 ******/
		%feature("compactdefaultargs") AnyFromLS;
		%feature("autodoc", "
Parameters
----------
aData: float
aUnit: str

Return
-------
float

Description
-----------
Converts the local system units value to the local unit value. Example: AnyFromLS(25.4,'in.') returns 1. if the LocalSystem is MDTV. Note: aUnit is also used to identify the type of physical quantity to convert.
") AnyFromLS;
		static Standard_Real AnyFromLS(const Standard_Real aData, Standard_CString aUnit);

		/****** UnitsAPI::AnyFromSI ******/
		/****** md5 signature: 51d298a84e57287a88c41611637a9aa9 ******/
		%feature("compactdefaultargs") AnyFromSI;
		%feature("autodoc", "
Parameters
----------
aData: float
aUnit: str

Return
-------
float

Description
-----------
Converts the SI system units value to the local unit value. Example: AnyFromSI(0.0254,'in.') returns 0.001 Note: aUnit is also used to identify the type of physical quantity to convert.
") AnyFromSI;
		static Standard_Real AnyFromSI(const Standard_Real aData, Standard_CString aUnit);

		/****** UnitsAPI::AnyToAny ******/
		/****** md5 signature: a34e13f8062d74576011237fdc11241b ******/
		%feature("compactdefaultargs") AnyToAny;
		%feature("autodoc", "
Parameters
----------
aData: float
aUnit1: str
aUnit2: str

Return
-------
float

Description
-----------
Converts the local unit value to another local unit value. Example: AnyToAny(0.0254,'in.','millimeter') returns 1. ;.
") AnyToAny;
		static Standard_Real AnyToAny(const Standard_Real aData, Standard_CString aUnit1, Standard_CString aUnit2);

		/****** UnitsAPI::AnyToLS ******/
		/****** md5 signature: be97d95d076c1f8b0986e8919aa752ea ******/
		%feature("compactdefaultargs") AnyToLS;
		%feature("autodoc", "
Parameters
----------
aData: float
aUnit: str

Return
-------
float

Description
-----------
Converts the local unit value to the local system units value. Example: AnyToLS(1.,'in.') returns 25.4 if the LocalSystem is MDTV.
") AnyToLS;
		static Standard_Real AnyToLS(const Standard_Real aData, Standard_CString aUnit);

		/****** UnitsAPI::AnyToLS ******/
		/****** md5 signature: 46cdace99266b9ed9c51e1fdd1e1382a ******/
		%feature("compactdefaultargs") AnyToLS;
		%feature("autodoc", "
Parameters
----------
aData: float
aUnit: str
aDim: Units_Dimensions

Return
-------
float

Description
-----------
Converts the local unit value to the local system units value. and gives the associated dimension of the unit.
") AnyToLS;
		static Standard_Real AnyToLS(const Standard_Real aData, Standard_CString aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****** UnitsAPI::AnyToSI ******/
		/****** md5 signature: 2322f8d6fc98e87d4c97235741f5c4c0 ******/
		%feature("compactdefaultargs") AnyToSI;
		%feature("autodoc", "
Parameters
----------
aData: float
aUnit: str

Return
-------
float

Description
-----------
Converts the local unit value to the SI system units value. Example: AnyToSI(1.,'in.') returns 0.0254.
") AnyToSI;
		static Standard_Real AnyToSI(const Standard_Real aData, Standard_CString aUnit);

		/****** UnitsAPI::AnyToSI ******/
		/****** md5 signature: 3984bca4e7e6b466dd4cc37343372bd4 ******/
		%feature("compactdefaultargs") AnyToSI;
		%feature("autodoc", "
Parameters
----------
aData: float
aUnit: str
aDim: Units_Dimensions

Return
-------
float

Description
-----------
Converts the local unit value to the SI system units value. and gives the associated dimension of the unit.
") AnyToSI;
		static Standard_Real AnyToSI(const Standard_Real aData, Standard_CString aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****** UnitsAPI::Check ******/
		/****** md5 signature: 8fd354cea0b43ea55552afe1a0c9a172 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
aQuantity: str
aUnit: str

Return
-------
bool

Description
-----------
Checks the coherence between the quantity <aQuantity> and the unit <aUnits> in the current system and returns False when it's WRONG.
") Check;
		static Standard_Boolean Check(Standard_CString aQuantity, Standard_CString aUnit);

		/****** UnitsAPI::CurrentFromAny ******/
		/****** md5 signature: e481372ea449ecc215486204b576346a ******/
		%feature("compactdefaultargs") CurrentFromAny;
		%feature("autodoc", "
Parameters
----------
aData: float
aQuantity: str
aUnit: str

Return
-------
float

Description
-----------
Converts the aData value expressed in the unit aUnit, into the current unit for the working environment, as defined for the physical quantity aQuantity by the last call to the SetCurrentUnit function.
") CurrentFromAny;
		static Standard_Real CurrentFromAny(const Standard_Real aData, Standard_CString aQuantity, Standard_CString aUnit);

		/****** UnitsAPI::CurrentFromLS ******/
		/****** md5 signature: baf46d9b2387f58a6af6f0df8c113850 ******/
		%feature("compactdefaultargs") CurrentFromLS;
		%feature("autodoc", "
Parameters
----------
aData: float
aQuantity: str

Return
-------
float

Description
-----------
Converts the local system units value to the current unit value. Example: CurrentFromLS(1000.,'LENGTH') returns 1. if current length unit is meter and LocalSystem is MDTV.
") CurrentFromLS;
		static Standard_Real CurrentFromLS(const Standard_Real aData, Standard_CString aQuantity);

		/****** UnitsAPI::CurrentFromSI ******/
		/****** md5 signature: b4cb9aa8765d61361f181d61763312f3 ******/
		%feature("compactdefaultargs") CurrentFromSI;
		%feature("autodoc", "
Parameters
----------
aData: float
aQuantity: str

Return
-------
float

Description
-----------
Converts the SI system units value to the current unit value. Example: CurrentFromSI(0.001,'LENGTH') returns 1 if current length unit is millimeter.
") CurrentFromSI;
		static Standard_Real CurrentFromSI(const Standard_Real aData, Standard_CString aQuantity);

		/****** UnitsAPI::CurrentToAny ******/
		/****** md5 signature: 626c139702fb138665d6dd8afd9482ae ******/
		%feature("compactdefaultargs") CurrentToAny;
		%feature("autodoc", "
Parameters
----------
aData: float
aQuantity: str
aUnit: str

Return
-------
float

Description
-----------
Converts the aData value expressed in the current unit for the working environment, as defined for the physical quantity aQuantity by the last call to the SetCurrentUnit function, into the unit aUnit.
") CurrentToAny;
		static Standard_Real CurrentToAny(const Standard_Real aData, Standard_CString aQuantity, Standard_CString aUnit);

		/****** UnitsAPI::CurrentToLS ******/
		/****** md5 signature: 6a36e9c67f2ece9a3e15958a515e9454 ******/
		%feature("compactdefaultargs") CurrentToLS;
		%feature("autodoc", "
Parameters
----------
aData: float
aQuantity: str

Return
-------
float

Description
-----------
Converts the current unit value to the local system units value. Example: CurrentToLS(1.,'LENGTH') returns 1000. if the current length unit is meter and LocalSystem is MDTV.
") CurrentToLS;
		static Standard_Real CurrentToLS(const Standard_Real aData, Standard_CString aQuantity);

		/****** UnitsAPI::CurrentToSI ******/
		/****** md5 signature: 9286242f061106c9da565bb7a13df149 ******/
		%feature("compactdefaultargs") CurrentToSI;
		%feature("autodoc", "
Parameters
----------
aData: float
aQuantity: str

Return
-------
float

Description
-----------
Converts the current unit value to the SI system units value. Example: CurrentToSI(1.,'LENGTH') returns 0.001 if current length unit is millimeter.
") CurrentToSI;
		static Standard_Real CurrentToSI(const Standard_Real aData, Standard_CString aQuantity);

		/****** UnitsAPI::CurrentUnit ******/
		/****** md5 signature: f01f00f078d1eec0021f4a2418a15c1f ******/
		%feature("compactdefaultargs") CurrentUnit;
		%feature("autodoc", "
Parameters
----------
aQuantity: str

Return
-------
str

Description
-----------
Returns the current unit dimension <aUnit> from the unit quantity <aQuantity>.
") CurrentUnit;
		static Standard_CString CurrentUnit(Standard_CString aQuantity);

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
		/****** md5 signature: b774aec0d4cbdadea27cddf0f2f2cc6c ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "
Parameters
----------
aQuantity: str

Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
return the dimension associated to the quantity.
") Dimensions;
		static opencascade::handle<Units_Dimensions> Dimensions(Standard_CString aQuantity);

		/****** UnitsAPI::LSToSI ******/
		/****** md5 signature: b7335812925a563eeda3a379ecb8050c ******/
		%feature("compactdefaultargs") LSToSI;
		%feature("autodoc", "
Parameters
----------
aData: float
aQuantity: str

Return
-------
float

Description
-----------
Converts the local system units value to the SI system unit value. Example: LSToSI(1.,'LENGTH') returns 0.001 if the local system length unit is millimeter.
") LSToSI;
		static Standard_Real LSToSI(const Standard_Real aData, Standard_CString aQuantity);

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
		/****** md5 signature: 3c3f219672fa4407919e8a63ea7f2683 ******/
		%feature("compactdefaultargs") SIToLS;
		%feature("autodoc", "
Parameters
----------
aData: float
aQuantity: str

Return
-------
float

Description
-----------
Converts the SI system unit value to the local system units value. Example: SIToLS(1.,'LENGTH') returns 1000. if the local system length unit is millimeter.
") SIToLS;
		static Standard_Real SIToLS(const Standard_Real aData, Standard_CString aQuantity);

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
		/****** md5 signature: 86203ba633b8d33e2ad9e71b2468ee6b ******/
		%feature("compactdefaultargs") SetCurrentUnit;
		%feature("autodoc", "
Parameters
----------
aQuantity: str
aUnit: str

Return
-------
None

Description
-----------
Sets the current unit dimension <aUnit> to the unit quantity <aQuantity>. Example: SetCurrentUnit('LENGTH','millimeter').
") SetCurrentUnit;
		static void SetCurrentUnit(Standard_CString aQuantity, Standard_CString aUnit);

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
