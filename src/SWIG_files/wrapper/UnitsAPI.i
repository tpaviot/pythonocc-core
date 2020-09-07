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
%define UNITSAPIDOCSTRING
"UnitsAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_unitsapi.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** AnyFromLS ******************/
		/**** md5 signature: 56e084e6a1e979f242ce3261471a2e19 ****/
		%feature("compactdefaultargs") AnyFromLS;
		%feature("autodoc", "Converts the local system units value to the local unit value. example: anyfromls(25.4,'in.') returns 1. if the localsystem is mdtv. note: aunit is also used to identify the type of physical quantity to convert.

Parameters
----------
aData: float
aUnit: char *

Returns
-------
float
") AnyFromLS;
		static Standard_Real AnyFromLS(const Standard_Real aData, const char * aUnit);

		/****************** AnyFromSI ******************/
		/**** md5 signature: 51d298a84e57287a88c41611637a9aa9 ****/
		%feature("compactdefaultargs") AnyFromSI;
		%feature("autodoc", "Converts the si system units value to the local unit value. example: anyfromsi(0.0254,'in.') returns 0.001 note: aunit is also used to identify the type of physical quantity to convert.

Parameters
----------
aData: float
aUnit: char *

Returns
-------
float
") AnyFromSI;
		static Standard_Real AnyFromSI(const Standard_Real aData, const char * aUnit);

		/****************** AnyToAny ******************/
		/**** md5 signature: a34e13f8062d74576011237fdc11241b ****/
		%feature("compactdefaultargs") AnyToAny;
		%feature("autodoc", "Converts the local unit value to another local unit value. example: anytoany(0.0254,'in.','millimeter') returns 1. ;.

Parameters
----------
aData: float
aUnit1: char *
aUnit2: char *

Returns
-------
float
") AnyToAny;
		static Standard_Real AnyToAny(const Standard_Real aData, const char * aUnit1, const char * aUnit2);

		/****************** AnyToLS ******************/
		/**** md5 signature: be97d95d076c1f8b0986e8919aa752ea ****/
		%feature("compactdefaultargs") AnyToLS;
		%feature("autodoc", "Converts the local unit value to the local system units value. example: anytols(1.,'in.') returns 25.4 if the localsystem is mdtv.

Parameters
----------
aData: float
aUnit: char *

Returns
-------
float
") AnyToLS;
		static Standard_Real AnyToLS(const Standard_Real aData, const char * aUnit);

		/****************** AnyToLS ******************/
		/**** md5 signature: 46cdace99266b9ed9c51e1fdd1e1382a ****/
		%feature("compactdefaultargs") AnyToLS;
		%feature("autodoc", "Converts the local unit value to the local system units value. and gives the associated dimension of the unit.

Parameters
----------
aData: float
aUnit: char *
aDim: Units_Dimensions

Returns
-------
float
") AnyToLS;
		static Standard_Real AnyToLS(const Standard_Real aData, const char * aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****************** AnyToSI ******************/
		/**** md5 signature: 2322f8d6fc98e87d4c97235741f5c4c0 ****/
		%feature("compactdefaultargs") AnyToSI;
		%feature("autodoc", "Converts the local unit value to the si system units value. example: anytosi(1.,'in.') returns 0.0254.

Parameters
----------
aData: float
aUnit: char *

Returns
-------
float
") AnyToSI;
		static Standard_Real AnyToSI(const Standard_Real aData, const char * aUnit);

		/****************** AnyToSI ******************/
		/**** md5 signature: 3984bca4e7e6b466dd4cc37343372bd4 ****/
		%feature("compactdefaultargs") AnyToSI;
		%feature("autodoc", "Converts the local unit value to the si system units value. and gives the associated dimension of the unit.

Parameters
----------
aData: float
aUnit: char *
aDim: Units_Dimensions

Returns
-------
float
") AnyToSI;
		static Standard_Real AnyToSI(const Standard_Real aData, const char * aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****************** Check ******************/
		/**** md5 signature: 8fd354cea0b43ea55552afe1a0c9a172 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Checks the coherence between the quantity <aquantity> and the unit <aunits> in the current system and returns false when it's wrong.

Parameters
----------
aQuantity: char *
aUnit: char *

Returns
-------
bool
") Check;
		static Standard_Boolean Check(const char * aQuantity, const char * aUnit);

		/****************** CurrentFromAny ******************/
		/**** md5 signature: e481372ea449ecc215486204b576346a ****/
		%feature("compactdefaultargs") CurrentFromAny;
		%feature("autodoc", "Converts the adata value expressed in the unit aunit, into the current unit for the working environment, as defined for the physical quantity aquantity by the last call to the setcurrentunit function.

Parameters
----------
aData: float
aQuantity: char *
aUnit: char *

Returns
-------
float
") CurrentFromAny;
		static Standard_Real CurrentFromAny(const Standard_Real aData, const char * aQuantity, const char * aUnit);

		/****************** CurrentFromLS ******************/
		/**** md5 signature: baf46d9b2387f58a6af6f0df8c113850 ****/
		%feature("compactdefaultargs") CurrentFromLS;
		%feature("autodoc", "Converts the local system units value to the current unit value. example: currentfromls(1000.,'length') returns 1. if current length unit is meter and localsystem is mdtv.

Parameters
----------
aData: float
aQuantity: char *

Returns
-------
float
") CurrentFromLS;
		static Standard_Real CurrentFromLS(const Standard_Real aData, const char * aQuantity);

		/****************** CurrentFromSI ******************/
		/**** md5 signature: b4cb9aa8765d61361f181d61763312f3 ****/
		%feature("compactdefaultargs") CurrentFromSI;
		%feature("autodoc", "Converts the si system units value to the current unit value. example: currentfromsi(0.001,'length') returns 1 if current length unit is millimeter.

Parameters
----------
aData: float
aQuantity: char *

Returns
-------
float
") CurrentFromSI;
		static Standard_Real CurrentFromSI(const Standard_Real aData, const char * aQuantity);

		/****************** CurrentToAny ******************/
		/**** md5 signature: 626c139702fb138665d6dd8afd9482ae ****/
		%feature("compactdefaultargs") CurrentToAny;
		%feature("autodoc", "Converts the adata value expressed in the current unit for the working environment, as defined for the physical quantity aquantity by the last call to the setcurrentunit function, into the unit aunit.

Parameters
----------
aData: float
aQuantity: char *
aUnit: char *

Returns
-------
float
") CurrentToAny;
		static Standard_Real CurrentToAny(const Standard_Real aData, const char * aQuantity, const char * aUnit);

		/****************** CurrentToLS ******************/
		/**** md5 signature: 6a36e9c67f2ece9a3e15958a515e9454 ****/
		%feature("compactdefaultargs") CurrentToLS;
		%feature("autodoc", "Converts the current unit value to the local system units value. example: currenttols(1.,'length') returns 1000. if the current length unit is meter and localsystem is mdtv.

Parameters
----------
aData: float
aQuantity: char *

Returns
-------
float
") CurrentToLS;
		static Standard_Real CurrentToLS(const Standard_Real aData, const char * aQuantity);

		/****************** CurrentToSI ******************/
		/**** md5 signature: 9286242f061106c9da565bb7a13df149 ****/
		%feature("compactdefaultargs") CurrentToSI;
		%feature("autodoc", "Converts the current unit value to the si system units value. example: currenttosi(1.,'length') returns 0.001 if current length unit is millimeter.

Parameters
----------
aData: float
aQuantity: char *

Returns
-------
float
") CurrentToSI;
		static Standard_Real CurrentToSI(const Standard_Real aData, const char * aQuantity);

		/****************** CurrentUnit ******************/
		/**** md5 signature: f01f00f078d1eec0021f4a2418a15c1f ****/
		%feature("compactdefaultargs") CurrentUnit;
		%feature("autodoc", "Returns the current unit dimension <aunit> from the unit quantity <aquantity>.

Parameters
----------
aQuantity: char *

Returns
-------
char *
") CurrentUnit;
		static const char * CurrentUnit(const char * aQuantity);

		/****************** DimensionAmountOfSubstance ******************/
		/**** md5 signature: 6438adbeca1586be140df666112d9ed8 ****/
		%feature("compactdefaultargs") DimensionAmountOfSubstance;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Units_Dimensions>
") DimensionAmountOfSubstance;
		static opencascade::handle<Units_Dimensions> DimensionAmountOfSubstance();

		/****************** DimensionElectricCurrent ******************/
		/**** md5 signature: 21bd133915dadd609b39c5ec7d5e7629 ****/
		%feature("compactdefaultargs") DimensionElectricCurrent;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Units_Dimensions>
") DimensionElectricCurrent;
		static opencascade::handle<Units_Dimensions> DimensionElectricCurrent();

		/****************** DimensionLength ******************/
		/**** md5 signature: 3673e991eafb1da7b843427cad536a4e ****/
		%feature("compactdefaultargs") DimensionLength;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Units_Dimensions>
") DimensionLength;
		static opencascade::handle<Units_Dimensions> DimensionLength();

		/****************** DimensionLess ******************/
		/**** md5 signature: 00b540e353e845d7ec73923b765c2c02 ****/
		%feature("compactdefaultargs") DimensionLess;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Units_Dimensions>
") DimensionLess;
		static opencascade::handle<Units_Dimensions> DimensionLess();

		/****************** DimensionLuminousIntensity ******************/
		/**** md5 signature: d170b93d2ba83b38edd5fb174d5101ba ****/
		%feature("compactdefaultargs") DimensionLuminousIntensity;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Units_Dimensions>
") DimensionLuminousIntensity;
		static opencascade::handle<Units_Dimensions> DimensionLuminousIntensity();

		/****************** DimensionMass ******************/
		/**** md5 signature: 5f28815039c64689a0d1ee9a899be783 ****/
		%feature("compactdefaultargs") DimensionMass;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Units_Dimensions>
") DimensionMass;
		static opencascade::handle<Units_Dimensions> DimensionMass();

		/****************** DimensionPlaneAngle ******************/
		/**** md5 signature: eafc1b650a4fe5a1e64bbc72ae1d78da ****/
		%feature("compactdefaultargs") DimensionPlaneAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Units_Dimensions>
") DimensionPlaneAngle;
		static opencascade::handle<Units_Dimensions> DimensionPlaneAngle();

		/****************** DimensionSolidAngle ******************/
		/**** md5 signature: 9fc6af7c5044ea7c920307831d9e3649 ****/
		%feature("compactdefaultargs") DimensionSolidAngle;
		%feature("autodoc", "Returns the basic dimensions.

Returns
-------
opencascade::handle<Units_Dimensions>
") DimensionSolidAngle;
		static opencascade::handle<Units_Dimensions> DimensionSolidAngle();

		/****************** DimensionThermodynamicTemperature ******************/
		/**** md5 signature: cc757ceec05d862614f1bd3e3981281e ****/
		%feature("compactdefaultargs") DimensionThermodynamicTemperature;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Units_Dimensions>
") DimensionThermodynamicTemperature;
		static opencascade::handle<Units_Dimensions> DimensionThermodynamicTemperature();

		/****************** DimensionTime ******************/
		/**** md5 signature: 8e5cc932b54c44ede7e6c6bcb709c213 ****/
		%feature("compactdefaultargs") DimensionTime;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Units_Dimensions>
") DimensionTime;
		static opencascade::handle<Units_Dimensions> DimensionTime();

		/****************** Dimensions ******************/
		/**** md5 signature: b774aec0d4cbdadea27cddf0f2f2cc6c ****/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Return the dimension associated to the quantity.

Parameters
----------
aQuantity: char *

Returns
-------
opencascade::handle<Units_Dimensions>
") Dimensions;
		static opencascade::handle<Units_Dimensions> Dimensions(const char * aQuantity);

		/****************** LSToSI ******************/
		/**** md5 signature: b7335812925a563eeda3a379ecb8050c ****/
		%feature("compactdefaultargs") LSToSI;
		%feature("autodoc", "Converts the local system units value to the si system unit value. example: lstosi(1.,'length') returns 0.001 if the local system length unit is millimeter.

Parameters
----------
aData: float
aQuantity: char *

Returns
-------
float
") LSToSI;
		static Standard_Real LSToSI(const Standard_Real aData, const char * aQuantity);

		/****************** LocalSystem ******************/
		/**** md5 signature: 61dd63b9b169d3619a3b18bc847f81b2 ****/
		%feature("compactdefaultargs") LocalSystem;
		%feature("autodoc", "Returns the current local system units.

Returns
-------
UnitsAPI_SystemUnits
") LocalSystem;
		static UnitsAPI_SystemUnits LocalSystem();

		/****************** Reload ******************/
		/**** md5 signature: 1fe01e0ae07372f9d155702586441d4d ****/
		%feature("compactdefaultargs") Reload;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reload;
		static void Reload();

		/****************** SIToLS ******************/
		/**** md5 signature: 3c3f219672fa4407919e8a63ea7f2683 ****/
		%feature("compactdefaultargs") SIToLS;
		%feature("autodoc", "Converts the si system unit value to the local system units value. example: sitols(1.,'length') returns 1000. if the local system length unit is millimeter.

Parameters
----------
aData: float
aQuantity: char *

Returns
-------
float
") SIToLS;
		static Standard_Real SIToLS(const Standard_Real aData, const char * aQuantity);

		/****************** Save ******************/
		/**** md5 signature: 5415c3e3c77906824a66d1620fd32f67 ****/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Saves the units in the file .currentunits of the directory pointed by the csf_currentunitsuserdefaults environment variable.

Returns
-------
None
") Save;
		static void Save();

		/****************** SetCurrentUnit ******************/
		/**** md5 signature: 86203ba633b8d33e2ad9e71b2468ee6b ****/
		%feature("compactdefaultargs") SetCurrentUnit;
		%feature("autodoc", "Sets the current unit dimension <aunit> to the unit quantity <aquantity>. example: setcurrentunit('length','millimeter').

Parameters
----------
aQuantity: char *
aUnit: char *

Returns
-------
None
") SetCurrentUnit;
		static void SetCurrentUnit(const char * aQuantity, const char * aUnit);

		/****************** SetLocalSystem ******************/
		/**** md5 signature: ee27f19c32ea8b52c56dd6af5e661b4b ****/
		%feature("compactdefaultargs") SetLocalSystem;
		%feature("autodoc", "Sets the local system units. example: setlocalsystem(unitsapi_mdtv).

Parameters
----------
aSystemUnit: UnitsAPI_SystemUnits,optional
	default value is UnitsAPI_SI

Returns
-------
None
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
