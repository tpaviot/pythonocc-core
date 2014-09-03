/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") UnitsAPI

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include UnitsAPI_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum UnitsAPI_SystemUnits {
	UnitsAPI_DEFAULT = 0,
	UnitsAPI_SI = 1,
	UnitsAPI_MDTV = 2,
};

/* end public enums declaration */

%rename(unitsapi) UnitsAPI;
%nodefaultctor UnitsAPI;
class UnitsAPI {
	public:
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aQuantity(char *)

Returns:
	static Standard_Real

Converts the current unit value to the local system units value.  
 Example: CurrentToLS(1.,'LENGTH') returns 1000. if the current length unit  
         is meter and LocalSystem is MDTV.") CurrentToLS;
		static Standard_Real CurrentToLS (const Standard_Real aData,const char * aQuantity);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aQuantity(char *)

Returns:
	static Standard_Real

Converts the current unit value to the SI system units value.  
 Example: CurrentToSI(1.,'LENGTH') returns 0.001 if current length unit  
         is millimeter.") CurrentToSI;
		static Standard_Real CurrentToSI (const Standard_Real aData,const char * aQuantity);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aQuantity(char *)

Returns:
	static Standard_Real

Converts the local system units value to the current unit value.  
 Example: CurrentFromLS(1000.,'LENGTH') returns 1. if current length unit  
         is meter and LocalSystem is MDTV.") CurrentFromLS;
		static Standard_Real CurrentFromLS (const Standard_Real aData,const char * aQuantity);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aQuantity(char *)

Returns:
	static Standard_Real

Converts the SI system units value to the current unit value.  
 Example: CurrentFromSI(0.001,'LENGTH') returns 1 if current length unit  
         is millimeter.") CurrentFromSI;
		static Standard_Real CurrentFromSI (const Standard_Real aData,const char * aQuantity);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit(char *)

Returns:
	static Standard_Real

Converts the local unit value to the local system units value.  
 Example: AnyToLS(1.,'in.') returns 25.4 if the LocalSystem is MDTV.") AnyToLS;
		static Standard_Real AnyToLS (const Standard_Real aData,const char * aUnit);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit(char *)
	aDim(Handle_Units_Dimensions)

Returns:
	static Standard_Real

Converts the local unit value to the local system units value.  
         and gives the associated dimension of the unit") AnyToLS;
		static Standard_Real AnyToLS (const Standard_Real aData,const char * aUnit,Handle_Units_Dimensions & aDim);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit(char *)

Returns:
	static Standard_Real

Converts the local unit value to the SI system units value.  
 Example: AnyToSI(1.,'in.') returns 0.0254") AnyToSI;
		static Standard_Real AnyToSI (const Standard_Real aData,const char * aUnit);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit(char *)
	aDim(Handle_Units_Dimensions)

Returns:
	static Standard_Real

Converts the local unit value to the SI system units value.  
         and gives the associated dimension of the unit") AnyToSI;
		static Standard_Real AnyToSI (const Standard_Real aData,const char * aUnit,Handle_Units_Dimensions & aDim);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit(char *)

Returns:
	static Standard_Real

Converts the local system units value to the local unit value.  
 Example: AnyFromLS(25.4,'in.') returns 1. if the LocalSystem is MDTV.  
Note: aUnit is also used to identify the type of physical quantity to convert.") AnyFromLS;
		static Standard_Real AnyFromLS (const Standard_Real aData,const char * aUnit);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit(char *)

Returns:
	static Standard_Real

Converts the SI system units value to the local unit value.  
 Example: AnyFromSI(0.0254,'in.') returns 0.001  
Note: aUnit is also used to identify the type of physical quantity to convert.") AnyFromSI;
		static Standard_Real AnyFromSI (const Standard_Real aData,const char * aUnit);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aQuantity(char *)
	aUnit(char *)

Returns:
	static Standard_Real

Converts the aData value expressed in the  
current unit for the working environment, as  
defined for the physical quantity aQuantity by the  
last call to the SetCurrentUnit function, into the unit aUnit.") CurrentToAny;
		static Standard_Real CurrentToAny (const Standard_Real aData,const char * aQuantity,const char * aUnit);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aQuantity(char *)
	aUnit(char *)

Returns:
	static Standard_Real

Converts the aData value expressed in the unit  
aUnit, into the current unit for the working  
environment, as defined for the physical quantity  
aQuantity by the last call to the SetCurrentUnit function.") CurrentFromAny;
		static Standard_Real CurrentFromAny (const Standard_Real aData,const char * aQuantity,const char * aUnit);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit1(char *)
	aUnit2(char *)

Returns:
	static Standard_Real

Converts the local unit value to another local unit value.  
 Example: AnyToAny(0.0254,'in.','millimeter') returns 1. ;") AnyToAny;
		static Standard_Real AnyToAny (const Standard_Real aData,const char * aUnit1,const char * aUnit2);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aQuantity(char *)

Returns:
	static Standard_Real

Converts the local system units value to the SI system unit value.  
 Example: LSToSI(1.,'LENGTH') returns 0.001 if the local system  
//!		length unit is millimeter.") LSToSI;
		static Standard_Real LSToSI (const Standard_Real aData,const char * aQuantity);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aQuantity(char *)

Returns:
	static Standard_Real

Converts the SI system unit value to the local system units value.  
 Example: SIToLS(1.,'LENGTH') returns 1000. if the local system  
//!		length unit is millimeter.") SIToLS;
		static Standard_Real SIToLS (const Standard_Real aData,const char * aQuantity);
		%feature("autodoc", "Args:
	aSystemUnit(UnitsAPI_SystemUnits)=UnitsAPI_SI

Returns:
	static void

Sets the local system units.  
 Example: SetLocalSystem(UnitsAPI_MDTV)") SetLocalSystem;
		static void SetLocalSystem (const UnitsAPI_SystemUnits aSystemUnit = UnitsAPI_SI);
		%feature("autodoc", "Args:
	None
Returns:
	static UnitsAPI_SystemUnits

Returns the current local system units.") LocalSystem;
		static UnitsAPI_SystemUnits LocalSystem ();
		%feature("autodoc", "Args:
	aQuantity(char *)
	aUnit(char *)

Returns:
	static void

Sets the current unit dimension <aUnit> to the unit quantity <aQuantity>.  
 Example: SetCurrentUnit('LENGTH','millimeter')") SetCurrentUnit;
		static void SetCurrentUnit (const char * aQuantity,const char * aUnit);
		%feature("autodoc", "Args:
	aQuantity(char *)

Returns:
	static char *

Returns the current unit dimension <aUnit> from the unit quantity <aQuantity>.") CurrentUnit;
		static char * CurrentUnit (const char * aQuantity);
		%feature("autodoc", "Args:
	None
Returns:
	static void

saves the units in the file .CurrentUnits of the directory pointed by the  
         CSF_CurrentUnitsUserDefaults environment variable.") Save;
		static void Save ();
		%feature("autodoc", "Args:
	None
Returns:
	static void

No detailed docstring for this function.") Reload;
		static void Reload ();
		%feature("autodoc", "Args:
	aQuantity(char *)

Returns:
	static Handle_Units_Dimensions

return the dimension associated to the quantity") Dimensions;
		static Handle_Units_Dimensions Dimensions (const char * aQuantity);
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

No detailed docstring for this function.") DimensionLess;
		static Handle_Units_Dimensions DimensionLess ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

No detailed docstring for this function.") DimensionMass;
		static Handle_Units_Dimensions DimensionMass ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

No detailed docstring for this function.") DimensionLength;
		static Handle_Units_Dimensions DimensionLength ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

No detailed docstring for this function.") DimensionTime;
		static Handle_Units_Dimensions DimensionTime ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

No detailed docstring for this function.") DimensionElectricCurrent;
		static Handle_Units_Dimensions DimensionElectricCurrent ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

No detailed docstring for this function.") DimensionThermodynamicTemperature;
		static Handle_Units_Dimensions DimensionThermodynamicTemperature ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

No detailed docstring for this function.") DimensionAmountOfSubstance;
		static Handle_Units_Dimensions DimensionAmountOfSubstance ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

No detailed docstring for this function.") DimensionLuminousIntensity;
		static Handle_Units_Dimensions DimensionLuminousIntensity ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

No detailed docstring for this function.") DimensionPlaneAngle;
		static Handle_Units_Dimensions DimensionPlaneAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

Returns the basic dimensions.") DimensionSolidAngle;
		static Handle_Units_Dimensions DimensionSolidAngle ();
		%feature("autodoc", "Args:
	aQuantity(char *)
	aUnit(char *)

Returns:
	static Standard_Boolean

Checks the coherence between the quantity <aQuantity>  
 	and the unit <aUnits> in the current system and  
//!		returns FALSE when it's WRONG.") Check;
		static Standard_Boolean Check (const char * aQuantity,const char * aUnit);
};


%feature("shadow") UnitsAPI::~UnitsAPI %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend UnitsAPI {
	void _kill_pointed() {
		delete $self;
	}
};
