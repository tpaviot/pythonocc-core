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
%define UNITSDOCSTRING
"Units module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_units.html"
%enddef
%module (package="OCC.Core", docstring=UNITSDOCSTRING) Units


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
#include<Units_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TColStd.i

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
%wrap_handle(Units_Dimensions)
%wrap_handle(Units_Lexicon)
%wrap_handle(Units_Quantity)
%wrap_handle(Units_Token)
%wrap_handle(Units_Unit)
%wrap_handle(Units_UnitsDictionary)
%wrap_handle(Units_UnitsSystem)
%wrap_handle(Units_ShiftedToken)
%wrap_handle(Units_ShiftedUnit)
%wrap_handle(Units_UnitsLexicon)
%wrap_handle(Units_QuantitiesSequence)
%wrap_handle(Units_TokensSequence)
%wrap_handle(Units_UnitsSequence)
/* end handles declaration */

/* templates */
%template(Units_QtsSequence) NCollection_Sequence<opencascade::handle<Units_Quantity>>;

%extend NCollection_Sequence<opencascade::handle<Units_Quantity>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Units_TksSequence) NCollection_Sequence<opencascade::handle<Units_Token>>;

%extend NCollection_Sequence<opencascade::handle<Units_Token>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Units_UtsSequence) NCollection_Sequence<opencascade::handle<Units_Unit>>;

%extend NCollection_Sequence<opencascade::handle<Units_Unit>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<Units_Quantity>> Units_QtsSequence;
typedef NCollection_Sequence<opencascade::handle<Units_Token>> Units_TksSequence;
typedef NCollection_Sequence<opencascade::handle<Units_Unit>> Units_UtsSequence;
/* end typedefs declaration */

/**************
* class Units *
**************/
%rename(units) Units;
class Units {
	public:
		/****** Units::Convert ******/
		/****** md5 signature: 1c016efdc46d58f5baa779f5e55e6c39 ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
avalue: float
afirstunit: str
asecondunit: str

Return
-------
float

Description
-----------
Converts <avalue> expressed in <afirstunit> into the <asecondunit>.
") Convert;
		static Standard_Real Convert(const Standard_Real avalue, Standard_CString afirstunit, Standard_CString asecondunit);

		/****** Units::DictionaryOfUnits ******/
		/****** md5 signature: 165dd792c98e5e7085892c1b5db3c84f ******/
		%feature("compactdefaultargs") DictionaryOfUnits;
		%feature("autodoc", "
Parameters
----------
amode: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<Units_UnitsDictionary>

Description
-----------
Returns a unique instance of the dictionary of units. If <amode> is True, then it forces the recomputation of the dictionary of units.
") DictionaryOfUnits;
		static opencascade::handle<Units_UnitsDictionary> DictionaryOfUnits(const Standard_Boolean amode = Standard_False);

		/****** Units::Dimensions ******/
		/****** md5 signature: c13659c025e8108be67e4b718d7b366b ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "
Parameters
----------
aType: str

Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
return the dimension associated to the Type.
") Dimensions;
		static opencascade::handle<Units_Dimensions> Dimensions(Standard_CString aType);

		/****** Units::FirstQuantity ******/
		/****** md5 signature: 57a438b224674b30f1f3279853c80e80 ******/
		%feature("compactdefaultargs") FirstQuantity;
		%feature("autodoc", "
Parameters
----------
aunit: str

Return
-------
str

Description
-----------
Returns the first quantity string founded from the unit <aUnit>.
") FirstQuantity;
		static Standard_CString FirstQuantity(Standard_CString aunit);

		/****** Units::FromSI ******/
		/****** md5 signature: b9aaa13580eb6b7bec1a75161b3f38bd ******/
		%feature("compactdefaultargs") FromSI;
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
No available documentation.
") FromSI;
		static Standard_Real FromSI(const Standard_Real aData, Standard_CString aUnit);

		/****** Units::FromSI ******/
		/****** md5 signature: e4437e25fa11aff2c1d96274f621aa76 ******/
		%feature("compactdefaultargs") FromSI;
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
No available documentation.
") FromSI;
		static Standard_Real FromSI(const Standard_Real aData, Standard_CString aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****** Units::LexiconFile ******/
		/****** md5 signature: 0d1e1e276fdac596aad4c54270b5ed95 ******/
		%feature("compactdefaultargs") LexiconFile;
		%feature("autodoc", "
Parameters
----------
afile: str

Return
-------
None

Description
-----------
Defines the location of the file containing the lexicon useful in manipulating composite units.
") LexiconFile;
		static void LexiconFile(Standard_CString afile);

		/****** Units::LexiconFormula ******/
		/****** md5 signature: e4b42815e2c05ced10bdf4f597e81ac0 ******/
		%feature("compactdefaultargs") LexiconFormula;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Lexicon>

Description
-----------
Return a unique instance of LexiconFormula.
") LexiconFormula;
		static opencascade::handle<Units_Lexicon> LexiconFormula();

		/****** Units::LexiconUnits ******/
		/****** md5 signature: cc2eda1304ff3791256437396918df9d ******/
		%feature("compactdefaultargs") LexiconUnits;
		%feature("autodoc", "
Parameters
----------
amode: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Units_Lexicon>

Description
-----------
Returns a unique instance of the Units_Lexicon. If <amode> is True, it forces the recomputation of the dictionary of units, and by consequence the completion of the Units_Lexicon.
") LexiconUnits;
		static opencascade::handle<Units_Lexicon> LexiconUnits(const Standard_Boolean amode = Standard_True);

		/****** Units::NullDimensions ******/
		/****** md5 signature: a2857d0ee7f46745e8b0c1814cb059d3 ******/
		%feature("compactdefaultargs") NullDimensions;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
Returns always the same instance of Dimensions.
") NullDimensions;
		static opencascade::handle<Units_Dimensions> NullDimensions();

		/****** Units::Quantity ******/
		/****** md5 signature: cc26c72daf105879e1e70edf50d88e17 ******/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "
Parameters
----------
aquantity: str

Return
-------
opencascade::handle<Units_Quantity>

Description
-----------
Returns a unique quantity instance corresponding to <aquantity>.
") Quantity;
		static opencascade::handle<Units_Quantity> Quantity(Standard_CString aquantity);

		/****** Units::ToSI ******/
		/****** md5 signature: 1f9885a9c585b0ad16edfcb704f20405 ******/
		%feature("compactdefaultargs") ToSI;
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
No available documentation.
") ToSI;
		static Standard_Real ToSI(const Standard_Real aData, Standard_CString aUnit);

		/****** Units::ToSI ******/
		/****** md5 signature: 1e2b0b697b20e12afc0806a8a0fc5525 ******/
		%feature("compactdefaultargs") ToSI;
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
No available documentation.
") ToSI;
		static Standard_Real ToSI(const Standard_Real aData, Standard_CString aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****** Units::UnitsFile ******/
		/****** md5 signature: d1d63a6bfea6a56ddb42b1aeb2170a43 ******/
		%feature("compactdefaultargs") UnitsFile;
		%feature("autodoc", "
Parameters
----------
afile: str

Return
-------
None

Description
-----------
Defines the location of the file containing all the information useful in creating the dictionary of all the units known to the system.
") UnitsFile;
		static void UnitsFile(Standard_CString afile);

};


%extend Units {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Units_Dimensions *
*************************/
class Units_Dimensions : public Standard_Transient {
	public:
		/****** Units_Dimensions::Units_Dimensions ******/
		/****** md5 signature: 975dcf713d046cd058800d166ad813f0 ******/
		%feature("compactdefaultargs") Units_Dimensions;
		%feature("autodoc", "
Parameters
----------
amass: float
alength: float
atime: float
anelectriccurrent: float
athermodynamictemperature: float
anamountofsubstance: float
aluminousintensity: float
aplaneangle: float
asolidangle: float

Return
-------
None

Description
-----------
Returns a Dimensions object which represents the dimension of a physical quantity. Each of the <amass>, <alength>, <atime>, <anelectriccurrent>, <athermodynamictemperature>, <anamountofsubstance>, <aluminousintensity>, <aplaneangle>, <asolidangle> are the powers for the 7 fundamental units of physical quantity and the 2 secondary fundamental units of physical quantity.
") Units_Dimensions;
		 Units_Dimensions(const Standard_Real amass, const Standard_Real alength, const Standard_Real atime, const Standard_Real anelectriccurrent, const Standard_Real athermodynamictemperature, const Standard_Real anamountofsubstance, const Standard_Real aluminousintensity, const Standard_Real aplaneangle, const Standard_Real asolidangle);

		/****** Units_Dimensions::AAmountOfSubstance ******/
		/****** md5 signature: 63abc0e7be931ff72f6ca88e61dd17e2 ******/
		%feature("compactdefaultargs") AAmountOfSubstance;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") AAmountOfSubstance;
		static opencascade::handle<Units_Dimensions> AAmountOfSubstance();

		/****** Units_Dimensions::AElectricCurrent ******/
		/****** md5 signature: f9c24167d985631057846e51d10166df ******/
		%feature("compactdefaultargs") AElectricCurrent;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") AElectricCurrent;
		static opencascade::handle<Units_Dimensions> AElectricCurrent();

		/****** Units_Dimensions::ALength ******/
		/****** md5 signature: 4f64b4d4e2c0ca907acbcdafc4af9fbe ******/
		%feature("compactdefaultargs") ALength;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") ALength;
		static opencascade::handle<Units_Dimensions> ALength();

		/****** Units_Dimensions::ALess ******/
		/****** md5 signature: 5bec61cec7e8ac92b5fa54f4c66293e1 ******/
		%feature("compactdefaultargs") ALess;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") ALess;
		static opencascade::handle<Units_Dimensions> ALess();

		/****** Units_Dimensions::ALuminousIntensity ******/
		/****** md5 signature: 3404de6cf51ae0de3b58b74046913ea0 ******/
		%feature("compactdefaultargs") ALuminousIntensity;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") ALuminousIntensity;
		static opencascade::handle<Units_Dimensions> ALuminousIntensity();

		/****** Units_Dimensions::AMass ******/
		/****** md5 signature: a2414aaa69606a356103ae05576f7edd ******/
		%feature("compactdefaultargs") AMass;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") AMass;
		static opencascade::handle<Units_Dimensions> AMass();

		/****** Units_Dimensions::APlaneAngle ******/
		/****** md5 signature: c9e7da3a1e46cbcfd9ef347668c87c52 ******/
		%feature("compactdefaultargs") APlaneAngle;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") APlaneAngle;
		static opencascade::handle<Units_Dimensions> APlaneAngle();

		/****** Units_Dimensions::ASolidAngle ******/
		/****** md5 signature: bec6fd1521d8717bee8ced3dafec2fd2 ******/
		%feature("compactdefaultargs") ASolidAngle;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
Returns the basic dimensions.
") ASolidAngle;
		static opencascade::handle<Units_Dimensions> ASolidAngle();

		/****** Units_Dimensions::AThermodynamicTemperature ******/
		/****** md5 signature: 33ec66a866f8f2afdbeb44f68a782fbe ******/
		%feature("compactdefaultargs") AThermodynamicTemperature;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") AThermodynamicTemperature;
		static opencascade::handle<Units_Dimensions> AThermodynamicTemperature();

		/****** Units_Dimensions::ATime ******/
		/****** md5 signature: b2807cad2db41c8608f548109ee219c8 ******/
		%feature("compactdefaultargs") ATime;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
No available documentation.
") ATime;
		static opencascade::handle<Units_Dimensions> ATime();

		/****** Units_Dimensions::AmountOfSubstance ******/
		/****** md5 signature: d0a50e7688dd01fdb0a81b6e0ce7c4a7 ******/
		%feature("compactdefaultargs") AmountOfSubstance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the power of quantity of material (mole) stored in the dimensions.
") AmountOfSubstance;
		Standard_Real AmountOfSubstance();

		/****** Units_Dimensions::Divide ******/
		/****** md5 signature: 2017e5023c65919fe4353e5afc314d62 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
adimensions: Units_Dimensions

Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
Creates and returns a new Dimensions object which is the result of the division of <self> by <adimensions>.
") Divide;
		opencascade::handle<Units_Dimensions> Divide(const opencascade::handle<Units_Dimensions> & adimensions);

		/****** Units_Dimensions::Dump ******/
		/****** md5 signature: 9b3bd8d196da0d1f33184e996ae9cbf4 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ashift: int

Return
-------
None

Description
-----------
Useful for degugging.
") Dump;
		void Dump(const Standard_Integer ashift);

		/****** Units_Dimensions::ElectricCurrent ******/
		/****** md5 signature: 57733ce346654d092ffbc2cbbac0213a ******/
		%feature("compactdefaultargs") ElectricCurrent;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the power of electrical intensity (current) stored in the dimensions.
") ElectricCurrent;
		Standard_Real ElectricCurrent();

		/****** Units_Dimensions::IsEqual ******/
		/****** md5 signature: 8e0b598f425a2f805aa6408b0ee4da6e ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
adimensions: Units_Dimensions

Return
-------
bool

Description
-----------
Returns true if <self> and <adimensions> have the same dimensions, false otherwise.
") IsEqual;
		Standard_Boolean IsEqual(const opencascade::handle<Units_Dimensions> & adimensions);

		/****** Units_Dimensions::IsNotEqual ******/
		/****** md5 signature: 9573d9fa7b1efcf9409a939d8e6422a6 ******/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "
Parameters
----------
adimensions: Units_Dimensions

Return
-------
bool

Description
-----------
Returns false if <self> and <adimensions> have the same dimensions, true otherwise.
") IsNotEqual;
		Standard_Boolean IsNotEqual(const opencascade::handle<Units_Dimensions> & adimensions);

		/****** Units_Dimensions::Length ******/
		/****** md5 signature: 7a11021be5ff74a321b964da373ca8bd ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the power of length stored in the dimensions.
") Length;
		Standard_Real Length();

		/****** Units_Dimensions::LuminousIntensity ******/
		/****** md5 signature: 64be7cc0b40448eb05c75dfc2d1eb250 ******/
		%feature("compactdefaultargs") LuminousIntensity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the power of light intensity stored in the dimensions.
") LuminousIntensity;
		Standard_Real LuminousIntensity();

		/****** Units_Dimensions::Mass ******/
		/****** md5 signature: 83051d7e192d0c36782eba6ee49a8a36 ******/
		%feature("compactdefaultargs") Mass;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the power of mass stored in the dimensions.
") Mass;
		Standard_Real Mass();

		/****** Units_Dimensions::Multiply ******/
		/****** md5 signature: 7c9d6fc1a4c76cadbdec3e4e8472d1f2 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
adimensions: Units_Dimensions

Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
Creates and returns a new Dimensions object which is the result of the multiplication of <self> and <adimensions>.
") Multiply;
		opencascade::handle<Units_Dimensions> Multiply(const opencascade::handle<Units_Dimensions> & adimensions);

		/****** Units_Dimensions::PlaneAngle ******/
		/****** md5 signature: f5635a277d24f5fc925f4ee6cbb3589c ******/
		%feature("compactdefaultargs") PlaneAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the power of plane angle stored in the dimensions.
") PlaneAngle;
		Standard_Real PlaneAngle();

		/****** Units_Dimensions::Power ******/
		/****** md5 signature: 75bc7c507c932efa8265856e7393e850 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
anexponent: float

Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
Creates and returns a new Dimensions object which is the result of the power of <self> and <anexponent>.
") Power;
		opencascade::handle<Units_Dimensions> Power(const Standard_Real anexponent);

		/****** Units_Dimensions::Quantity ******/
		/****** md5 signature: c920b8781d89bd17c597f2f399eef4e9 ******/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the quantity string of the dimension.
") Quantity;
		Standard_CString Quantity();

		/****** Units_Dimensions::SolidAngle ******/
		/****** md5 signature: 31e4e2ea379c30067ca33e39d0264cd8 ******/
		%feature("compactdefaultargs") SolidAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the power of solid angle stored in the dimensions.
") SolidAngle;
		Standard_Real SolidAngle();

		/****** Units_Dimensions::ThermodynamicTemperature ******/
		/****** md5 signature: c915fea640de78c930543465bdbfece8 ******/
		%feature("compactdefaultargs") ThermodynamicTemperature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the power of temperature stored in the dimensions.
") ThermodynamicTemperature;
		Standard_Real ThermodynamicTemperature();

		/****** Units_Dimensions::Time ******/
		/****** md5 signature: a359c7d15562aef65105797b80b4fd2d ******/
		%feature("compactdefaultargs") Time;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the power of time stored in the dimensions.
") Time;
		Standard_Real Time();

};


%make_alias(Units_Dimensions)

%extend Units_Dimensions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Units_Explorer *
***********************/
class Units_Explorer {
	public:
		/****** Units_Explorer::Units_Explorer ******/
		/****** md5 signature: 8a8d095abcb8ce4f0921dd302b301d66 ******/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor of the class.
") Units_Explorer;
		 Units_Explorer();

		/****** Units_Explorer::Units_Explorer ******/
		/****** md5 signature: a2fc8cfc32fa4b570576f3cfd7c4c5cc ******/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "
Parameters
----------
aunitssystem: Units_UnitsSystem

Return
-------
None

Description
-----------
Creates a new instance of the class, initialized with the UnitsSystem <aunitssystem>.
") Units_Explorer;
		 Units_Explorer(const opencascade::handle<Units_UnitsSystem> & aunitssystem);

		/****** Units_Explorer::Units_Explorer ******/
		/****** md5 signature: 2f8e197a0effa9080374aa93bcfab8d8 ******/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "
Parameters
----------
aunitsdictionary: Units_UnitsDictionary

Return
-------
None

Description
-----------
Creates a new instance of the class, initialized with the UnitsDictionary <aunitsdictionary>.
") Units_Explorer;
		 Units_Explorer(const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary);

		/****** Units_Explorer::Units_Explorer ******/
		/****** md5 signature: 4068c5e597e84a185faa3fc7eefecb99 ******/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "
Parameters
----------
aunitssystem: Units_UnitsSystem
aquantity: str

Return
-------
None

Description
-----------
Creates a new instance of the class, initialized with the UnitsSystem <aunitssystem> and positioned at the quantity <aquantity>.
") Units_Explorer;
		 Units_Explorer(const opencascade::handle<Units_UnitsSystem> & aunitssystem, Standard_CString aquantity);

		/****** Units_Explorer::Units_Explorer ******/
		/****** md5 signature: 9df61dde1855014446854d9a0f47cb63 ******/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "
Parameters
----------
aunitsdictionary: Units_UnitsDictionary
aquantity: str

Return
-------
None

Description
-----------
Creates a new instance of the class, initialized with the UnitsDictionary <aunitsdictionary> and positioned at the quantity <aquantity>.
") Units_Explorer;
		 Units_Explorer(const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary, Standard_CString aquantity);

		/****** Units_Explorer::Init ******/
		/****** md5 signature: 5d2d604f22b989ac2f8178a5a395c902 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aunitssystem: Units_UnitsSystem

Return
-------
None

Description
-----------
Initializes the instance of the class with the UnitsSystem <aunitssystem>.
") Init;
		void Init(const opencascade::handle<Units_UnitsSystem> & aunitssystem);

		/****** Units_Explorer::Init ******/
		/****** md5 signature: 4fceb2bf5675dcacca6993149be091d6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aunitsdictionary: Units_UnitsDictionary

Return
-------
None

Description
-----------
Initializes the instance of the class with the UnitsDictionary <aunitsdictionary>.
") Init;
		void Init(const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary);

		/****** Units_Explorer::Init ******/
		/****** md5 signature: 335f2d942e838e43cfa1fc9dfa42880e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aunitssystem: Units_UnitsSystem
aquantity: str

Return
-------
None

Description
-----------
Initializes the instance of the class with the UnitsSystem <aunitssystem> and positioned at the quantity <aquantity>.
") Init;
		void Init(const opencascade::handle<Units_UnitsSystem> & aunitssystem, Standard_CString aquantity);

		/****** Units_Explorer::Init ******/
		/****** md5 signature: 3f1f0728105192c0b3260faf5a827ae6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aunitsdictionary: Units_UnitsDictionary
aquantity: str

Return
-------
None

Description
-----------
Initializes the instance of the class with the UnitsDictionary <aunitsdictionary> and positioned at the quantity <aquantity>.
") Init;
		void Init(const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary, Standard_CString aquantity);

		/****** Units_Explorer::IsActive ******/
		/****** md5 signature: 476abafc82a8bb87ac904f5a77e179a3 ******/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
If the units system to explore is a user system, returns True if the current unit is active, False otherwise. //! If the units system to explore is the units dictionary, returns True if the current unit is the S.I. unit.
") IsActive;
		Standard_Boolean IsActive();

		/****** Units_Explorer::MoreQuantity ******/
		/****** md5 signature: 73ce92fd023d2945110ac6c2937dd451 ******/
		%feature("compactdefaultargs") MoreQuantity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is another Quantity to explore, False otherwise.
") MoreQuantity;
		Standard_Boolean MoreQuantity();

		/****** Units_Explorer::MoreUnit ******/
		/****** md5 signature: 0e67eb0488033b4e76d4f420fc1d2d55 ******/
		%feature("compactdefaultargs") MoreUnit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is another Unit to explore, False otherwise.
") MoreUnit;
		Standard_Boolean MoreUnit();

		/****** Units_Explorer::NextQuantity ******/
		/****** md5 signature: 6168313ed72e10d35a3c1a5bb899b752 ******/
		%feature("compactdefaultargs") NextQuantity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the next Quantity current.
") NextQuantity;
		void NextQuantity();

		/****** Units_Explorer::NextUnit ******/
		/****** md5 signature: 625db75ec252f2c2ccb0f729d505b4fb ******/
		%feature("compactdefaultargs") NextUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the next Unit current.
") NextUnit;
		void NextUnit();

		/****** Units_Explorer::Quantity ******/
		/****** md5 signature: ca15ea7df4b9d4a76b282d91cc16f7b6 ******/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the name of the current Quantity.
") Quantity;
		TCollection_AsciiString Quantity();

		/****** Units_Explorer::Unit ******/
		/****** md5 signature: 2b64b8e29a210ddf0a4ebeb8ee6edf2a ******/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the name of the current unit.
") Unit;
		TCollection_AsciiString Unit();

};


%extend Units_Explorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Units_Lexicon *
**********************/
class Units_Lexicon : public Standard_Transient {
	public:
		/****** Units_Lexicon::Units_Lexicon ******/
		/****** md5 signature: 0f1a71f6a310b1fb9bf2427ef9e46cf4 ******/
		%feature("compactdefaultargs") Units_Lexicon;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty instance of Lexicon.
") Units_Lexicon;
		 Units_Lexicon();

		/****** Units_Lexicon::AddToken ******/
		/****** md5 signature: 1a8a6e614b1b4b2941f123ac5204b81c ******/
		%feature("compactdefaultargs") AddToken;
		%feature("autodoc", "
Parameters
----------
aword: str
amean: str
avalue: float

Return
-------
None

Description
-----------
Adds to the lexicon a new token with <aword>, <amean>, <avalue> as arguments. If there is already a token with the field <theword> equal to <aword>, the existing token is updated.
") AddToken;
		void AddToken(Standard_CString aword, Standard_CString amean, const Standard_Real avalue);

		/****** Units_Lexicon::Creates ******/
		/****** md5 signature: 336960f3bd894b74398bcb460f145038 ******/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reads the file <afilename> to create a sequence of tokens stored in <thesequenceoftokens>.
") Creates;
		void Creates();

		/****** Units_Lexicon::Dump ******/
		/****** md5 signature: 73b0c773468e8cceaf80d621d09b8350 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Useful for debugging.
") Dump;
		virtual void Dump();

		/****** Units_Lexicon::Sequence ******/
		/****** md5 signature: 07981295dc97bedc768d3d1077d432cf ******/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_TokensSequence>

Description
-----------
Returns the first item of the sequence of tokens.
") Sequence;
		opencascade::handle<Units_TokensSequence> Sequence();

};


%make_alias(Units_Lexicon)

%extend Units_Lexicon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Units_Measurement *
**************************/
class Units_Measurement {
	public:
		/****** Units_Measurement::Units_Measurement ******/
		/****** md5 signature: d31e4eee11d8efed3d8a9665b5d7ce95 ******/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "Return
-------
None

Description
-----------
It is the empty constructor of the class.
") Units_Measurement;
		 Units_Measurement();

		/****** Units_Measurement::Units_Measurement ******/
		/****** md5 signature: 3e5abeff4182ab97b4afedb6d535fc52 ******/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "
Parameters
----------
avalue: float
atoken: Units_Token

Return
-------
None

Description
-----------
Returns an instance of this class. <avalue> defines the measurement, and <atoken> the token which defines the unit used.
") Units_Measurement;
		 Units_Measurement(const Standard_Real avalue, const opencascade::handle<Units_Token> & atoken);

		/****** Units_Measurement::Units_Measurement ******/
		/****** md5 signature: 7bbfad161dda052e5c352381b5a0b796 ******/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "
Parameters
----------
avalue: float
aunit: str

Return
-------
None

Description
-----------
Returns an instance of this class. <avalue> defines the measurement, and <aunit> the unit used, described in natural language.
") Units_Measurement;
		 Units_Measurement(const Standard_Real avalue, Standard_CString aunit);

		/****** Units_Measurement::Add ******/
		/****** md5 signature: 172bc55901ca00e6db419ccdf92bc025 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
ameasurement: Units_Measurement

Return
-------
Units_Measurement

Description
-----------
Returns (if it is possible) a measurement which is the addition of <self> and <ameasurement>. The chosen returned unit is the unit of <self>.
") Add;
		Units_Measurement Add(const Units_Measurement & ameasurement);

		/****** Units_Measurement::Convert ******/
		/****** md5 signature: ffa44be524b687d8f614a293eddf56a4 ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
aunit: str

Return
-------
None

Description
-----------
Converts (if possible) the measurement object into another unit. <aunit> must have the same dimensionality as the unit contained in the token <thetoken>.
") Convert;
		void Convert(Standard_CString aunit);

		/****** Units_Measurement::Divide ******/
		/****** md5 signature: 5a69bb1fd49d61e815d14674626c2bc3 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
ameasurement: Units_Measurement

Return
-------
Units_Measurement

Description
-----------
Returns a measurement which is the division of <self> by <ameasurement>.
") Divide;
		Units_Measurement Divide(const Units_Measurement & ameasurement);

		/****** Units_Measurement::Divide ******/
		/****** md5 signature: d79fd04520bc32da038d50307ae4fc54 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
avalue: float

Return
-------
Units_Measurement

Description
-----------
Returns a measurement which is the division of <self> by the constant <avalue>.
") Divide;
		Units_Measurement Divide(const Standard_Real avalue);

		/****** Units_Measurement::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Useful for debugging.
") Dump;
		void Dump();

		/****** Units_Measurement::Fractional ******/
		/****** md5 signature: 1b4620d56c93fd765f6e142b9d97a79c ******/
		%feature("compactdefaultargs") Fractional;
		%feature("autodoc", "Return
-------
Units_Measurement

Description
-----------
Returns a Measurement object with the fractional value of the measurement contained in <self>.
") Fractional;
		Units_Measurement Fractional();

		/****** Units_Measurement::HasToken ******/
		/****** md5 signature: 3ec84cfcc11696e61acb84882888bb90 ******/
		%feature("compactdefaultargs") HasToken;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasToken;
		Standard_Boolean HasToken();

		/****** Units_Measurement::Integer ******/
		/****** md5 signature: 8fe9fb5455a25265b4a6463ac40bdf02 ******/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Return
-------
Units_Measurement

Description
-----------
Returns a Measurement object with the integer value of the measurement contained in <self>.
") Integer;
		Units_Measurement Integer();

		/****** Units_Measurement::Measurement ******/
		/****** md5 signature: fa31c6a292bb3873ba7c426fe0ae6b01 ******/
		%feature("compactdefaultargs") Measurement;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the measurement.
") Measurement;
		Standard_Real Measurement();

		/****** Units_Measurement::Multiply ******/
		/****** md5 signature: 6433499acb8478055bcca32f38bf18eb ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
ameasurement: Units_Measurement

Return
-------
Units_Measurement

Description
-----------
Returns a measurement which is the multiplication of <self> and <ameasurement>.
") Multiply;
		Units_Measurement Multiply(const Units_Measurement & ameasurement);

		/****** Units_Measurement::Multiply ******/
		/****** md5 signature: ac88a4da10bca48323c62a7c2e7c5b7f ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
avalue: float

Return
-------
Units_Measurement

Description
-----------
Returns a measurement which is the multiplication of <self> with the value <avalue>.
") Multiply;
		Units_Measurement Multiply(const Standard_Real avalue);

		/****** Units_Measurement::Power ******/
		/****** md5 signature: 4c9722efc96e1a7bfb5d2660cdd33cc9 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
anexponent: float

Return
-------
Units_Measurement

Description
-----------
Returns a measurement which is <self> powered <anexponent>.
") Power;
		Units_Measurement Power(const Standard_Real anexponent);

		/****** Units_Measurement::Subtract ******/
		/****** md5 signature: 030285b9f503cd97118e246fc18ebaf9 ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
ameasurement: Units_Measurement

Return
-------
Units_Measurement

Description
-----------
Returns (if it is possible) a measurement which is the subtraction of <self> and <ameasurement>. The chosen returned unit is the unit of <self>.
") Subtract;
		Units_Measurement Subtract(const Units_Measurement & ameasurement);

		/****** Units_Measurement::Token ******/
		/****** md5 signature: 9620d8f2a9e2df08357e954964938e86 ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Token>

Description
-----------
Returns the token contained in <self>.
") Token;
		opencascade::handle<Units_Token> Token();

		/****** Units_Measurement::operator * ******/
		/****** md5 signature: a67ae8ab340dc1746582c407739e186d ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
ameasurement: Units_Measurement

Return
-------
Units_Measurement

Description
-----------
No available documentation.
") operator *;
		Units_Measurement operator *(const Units_Measurement & ameasurement);

		/****** Units_Measurement::operator * ******/
		/****** md5 signature: fcddee8cd642cff9dc22f8041a42ca0a ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
avalue: float

Return
-------
Units_Measurement

Description
-----------
No available documentation.
") operator *;
		Units_Measurement operator *(const Standard_Real avalue);

		/****** Units_Measurement::operator + ******/
		/****** md5 signature: b3ac3f14ad030c851a4a31fe6518f64f ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
ameasurement: Units_Measurement

Return
-------
Units_Measurement

Description
-----------
No available documentation.
") operator +;
		Units_Measurement operator +(const Units_Measurement & ameasurement);

		/****** Units_Measurement::operator - ******/
		/****** md5 signature: 92a701328f91174ed60566ea094c0b38 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
ameasurement: Units_Measurement

Return
-------
Units_Measurement

Description
-----------
No available documentation.
") operator -;
		Units_Measurement operator -(const Units_Measurement & ameasurement);

		/****** Units_Measurement::operator / ******/
		/****** md5 signature: c20069536cf255816086c127d179c8fb ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
ameasurement: Units_Measurement

Return
-------
Units_Measurement

Description
-----------
No available documentation.
") operator /;
		Units_Measurement operator /(const Units_Measurement & ameasurement);

		/****** Units_Measurement::operator / ******/
		/****** md5 signature: 9c00d7664a25f2eb36b767fcd9ab1a63 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
avalue: float

Return
-------
Units_Measurement

Description
-----------
No available documentation.
") operator /;
		Units_Measurement operator /(const Standard_Real avalue);

};


%extend Units_Measurement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Units_Quantity *
***********************/
class Units_Quantity : public Standard_Transient {
	public:
		/****** Units_Quantity::Units_Quantity ******/
		/****** md5 signature: 29dfd2c01261b16860d7422111c097c6 ******/
		%feature("compactdefaultargs") Units_Quantity;
		%feature("autodoc", "
Parameters
----------
aname: str
adimensions: Units_Dimensions
aunitssequence: Units_UnitsSequence

Return
-------
None

Description
-----------
Creates a new Quantity object with <aname> which is the name of the physical quantity, <adimensions> which is the physical dimensions, and <aunitssequence> which describes all the units known for this quantity.
") Units_Quantity;
		 Units_Quantity(Standard_CString aname, const opencascade::handle<Units_Dimensions> & adimensions, const opencascade::handle<Units_UnitsSequence> & aunitssequence);

		/****** Units_Quantity::Dimensions ******/
		/****** md5 signature: f6d82f417c034a7603f1ff62dccce1d1 ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
Returns the physical dimensions of the quantity.
") Dimensions;
		opencascade::handle<Units_Dimensions> Dimensions();

		/****** Units_Quantity::Dump ******/
		/****** md5 signature: 34be4d9f12ae70558c563310451f527a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ashift: int
alevel: int

Return
-------
None

Description
-----------
Useful for debugging.
") Dump;
		void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****** Units_Quantity::IsEqual ******/
		/****** md5 signature: 4e07c23bce6b8d25cdaaf5ee04a419fb ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
astring: str

Return
-------
bool

Description
-----------
Returns True if the name of the Quantity <self> is equal to <astring>, False otherwise.
") IsEqual;
		Standard_Boolean IsEqual(Standard_CString astring);

		/****** Units_Quantity::Name ******/
		/****** md5 signature: 4ede994349b8ea032efece942c57861d ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns in a AsciiString from TCollection the name of the quantity.
") Name;
		TCollection_AsciiString Name();

		/****** Units_Quantity::Sequence ******/
		/****** md5 signature: c3d2b803f44f670a6ddd44881910c01a ******/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_UnitsSequence>

Description
-----------
Returns <theunitssequence>, which is the sequence of all the units stored for this physical quantity.
") Sequence;
		opencascade::handle<Units_UnitsSequence> Sequence();

};


%make_alias(Units_Quantity)

%extend Units_Quantity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Units_Sentence *
***********************/
class Units_Sentence {
	public:
		/****** Units_Sentence::Units_Sentence ******/
		/****** md5 signature: a3b4863791f70a82b02c3f5f032a94b5 ******/
		%feature("compactdefaultargs") Units_Sentence;
		%feature("autodoc", "
Parameters
----------
alexicon: Units_Lexicon
astring: str

Return
-------
None

Description
-----------
Creates and returns a Sentence, by analyzing the string <astring> with the lexicon <alexicon>.
") Units_Sentence;
		 Units_Sentence(const opencascade::handle<Units_Lexicon> & alexicon, Standard_CString astring);

		/****** Units_Sentence::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Useful for debugging.
") Dump;
		void Dump();

		/****** Units_Sentence::Evaluate ******/
		/****** md5 signature: d1bc3e99afe9ecb89c5515d9b3d091bf ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Token>

Description
-----------
Computes and returns in a token the result of the expression.
") Evaluate;
		opencascade::handle<Units_Token> Evaluate();

		/****** Units_Sentence::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if number of created tokens > 0 (i.e creation of sentence is successful).
") IsDone;
		Standard_Boolean IsDone();

		/****** Units_Sentence::Sequence ******/
		/****** md5 signature: 07981295dc97bedc768d3d1077d432cf ******/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_TokensSequence>

Description
-----------
Returns <thesequenceoftokens>.
") Sequence;
		opencascade::handle<Units_TokensSequence> Sequence();

		/****** Units_Sentence::Sequence ******/
		/****** md5 signature: 3f1e9c4b7f3063e9db16a4170e858f4e ******/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "
Parameters
----------
asequenceoftokens: Units_TokensSequence

Return
-------
None

Description
-----------
Sets the field <thesequenceoftokens> to <asequenceoftokens>.
") Sequence;
		void Sequence(const opencascade::handle<Units_TokensSequence> & asequenceoftokens);

		/****** Units_Sentence::SetConstants ******/
		/****** md5 signature: 09057b17d30a3997a1d663ff1e7333d5 ******/
		%feature("compactdefaultargs") SetConstants;
		%feature("autodoc", "Return
-------
None

Description
-----------
For each constant encountered, sets the value.
") SetConstants;
		void SetConstants();

};


%extend Units_Sentence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Units_Token *
********************/
class Units_Token : public Standard_Transient {
	public:
		/****** Units_Token::Units_Token ******/
		/****** md5 signature: 5c9e0131c4ee2d2e0f3dad64072ae5b0 ******/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates and returns a empty token.
") Units_Token;
		 Units_Token();

		/****** Units_Token::Units_Token ******/
		/****** md5 signature: 936af0aa967aa2b4603deadcf4e4640c ******/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "
Parameters
----------
aword: str

Return
-------
None

Description
-----------
Creates and returns a token. <aword> is a string containing the available word.
") Units_Token;
		 Units_Token(Standard_CString aword);

		/****** Units_Token::Units_Token ******/
		/****** md5 signature: 043758efc301a2c45ea92d46d8230962 ******/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "
Parameters
----------
atoken: Units_Token

Return
-------
None

Description
-----------
Creates and returns a token. <atoken> is copied in the returned token.
") Units_Token;
		 Units_Token(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::Units_Token ******/
		/****** md5 signature: 35fda34f14ecf981a6b52f6a8c585997 ******/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "
Parameters
----------
aword: str
amean: str

Return
-------
None

Description
-----------
Creates and returns a token. <aword> is a string containing the available word and <amean> gives the signification of the token.
") Units_Token;
		 Units_Token(Standard_CString aword, Standard_CString amean);

		/****** Units_Token::Units_Token ******/
		/****** md5 signature: 359d8ddb1e52ec2e76c978a2501dbcd1 ******/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "
Parameters
----------
aword: str
amean: str
avalue: float

Return
-------
None

Description
-----------
Creates and returns a token. <aword> is a string containing the available word, <amean> gives the signification of the token and <avalue> is the numeric value of the dimension.
") Units_Token;
		 Units_Token(Standard_CString aword, Standard_CString amean, const Standard_Real avalue);

		/****** Units_Token::Units_Token ******/
		/****** md5 signature: b4c73c34d1f9cc5658ad15f226b0bd2d ******/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "
Parameters
----------
aword: str
amean: str
avalue: float
adimension: Units_Dimensions

Return
-------
None

Description
-----------
Creates and returns a token. <aword> is a string containing the available word, <amean> gives the signification of the token, <avalue> is the numeric value of the dimension, and <adimensions> is the dimension of the given word <aword>.
") Units_Token;
		 Units_Token(Standard_CString aword, Standard_CString amean, const Standard_Real avalue, const opencascade::handle<Units_Dimensions> & adimension);

		/****** Units_Token::Add ******/
		/****** md5 signature: de749d1f5d36c7125c8cd10bf3bf8ef9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aninteger: int

Return
-------
opencascade::handle<Units_Token>

Description
-----------
No available documentation.
") Add;
		opencascade::handle<Units_Token> Add(const Standard_Integer aninteger);

		/****** Units_Token::Add ******/
		/****** md5 signature: 6b2457ea824d8040cb8cac709490d8d2 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
atoken: Units_Token

Return
-------
opencascade::handle<Units_Token>

Description
-----------
Returns a token which is the addition of <self> and another token <atoken>. The addition is possible if and only if the dimensions are the same.
") Add;
		opencascade::handle<Units_Token> Add(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::Creates ******/
		/****** md5 signature: 760430f09dfbe61d0ca03dde97033b72 ******/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Token>

Description
-----------
Creates and returns a token, which is a ShiftedToken.
") Creates;
		virtual opencascade::handle<Units_Token> Creates();

		/****** Units_Token::Dimensions ******/
		/****** md5 signature: f6d82f417c034a7603f1ff62dccce1d1 ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
Returns the dimensions of the token <thedimensions>.
") Dimensions;
		opencascade::handle<Units_Dimensions> Dimensions();

		/****** Units_Token::Dimensions ******/
		/****** md5 signature: 0dc4820d7c19ca14a8c90ec250fe791e ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "
Parameters
----------
adimensions: Units_Dimensions

Return
-------
None

Description
-----------
Sets the field <thedimensions> to <adimensions>.
") Dimensions;
		void Dimensions(const opencascade::handle<Units_Dimensions> & adimensions);

		/****** Units_Token::Divide ******/
		/****** md5 signature: 11516872c4429151480bdd03f6bff4f8 ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
atoken: Units_Token

Return
-------
opencascade::handle<Units_Token>

Description
-----------
Returns a token which is the division of <self> by another token <atoken>.
") Divide;
		opencascade::handle<Units_Token> Divide(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::Divided ******/
		/****** md5 signature: 779e03303200921a08216372158385d6 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
avalue: float

Return
-------
float

Description
-----------
This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
") Divided;
		virtual Standard_Real Divided(const Standard_Real avalue);

		/****** Units_Token::Dump ******/
		/****** md5 signature: 11a72ea0354ab05ddfe8b781916d167a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ashift: int
alevel: int

Return
-------
None

Description
-----------
Useful for debugging.
") Dump;
		virtual void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****** Units_Token::IsEqual ******/
		/****** md5 signature: 4e07c23bce6b8d25cdaaf5ee04a419fb ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
astring: str

Return
-------
bool

Description
-----------
Returns true if the field <theword> and the string <astring> are the same, false otherwise.
") IsEqual;
		Standard_Boolean IsEqual(Standard_CString astring);

		/****** Units_Token::IsEqual ******/
		/****** md5 signature: 34e3e8dcc8e89d690b9df0f8e1bf7953 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
atoken: Units_Token

Return
-------
bool

Description
-----------
Returns true if the field <theword> and the string <theword> contained in the token <atoken> are the same, false otherwise.
") IsEqual;
		Standard_Boolean IsEqual(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::IsGreater ******/
		/****** md5 signature: 7e9fde33c953167e6a7c483114fecf76 ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
astring: str

Return
-------
bool

Description
-----------
Returns false if the field <theword> is strictly contained at the beginning of the string <astring>, true otherwise.
") IsGreater;
		Standard_Boolean IsGreater(Standard_CString astring);

		/****** Units_Token::IsGreater ******/
		/****** md5 signature: a9772ca3092d476da2a358df580ff45c ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
atoken: Units_Token

Return
-------
bool

Description
-----------
Returns false if the field <theword> is strictly contained at the beginning of the string <astring>, true otherwise.
") IsGreater;
		Standard_Boolean IsGreater(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::IsGreaterOrEqual ******/
		/****** md5 signature: 4ed039460da3250495314843163475e8 ******/
		%feature("compactdefaultargs") IsGreaterOrEqual;
		%feature("autodoc", "
Parameters
----------
atoken: Units_Token

Return
-------
bool

Description
-----------
Returns true if the string <astring> is strictly contained at the beginning of the field <theword> false otherwise.
") IsGreaterOrEqual;
		Standard_Boolean IsGreaterOrEqual(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::IsLessOrEqual ******/
		/****** md5 signature: 82f7f9339e3f8eed44e9985f4cfcd505 ******/
		%feature("compactdefaultargs") IsLessOrEqual;
		%feature("autodoc", "
Parameters
----------
astring: str

Return
-------
bool

Description
-----------
Returns true if the field <theword> is strictly contained at the beginning of the string <astring>, false otherwise.
") IsLessOrEqual;
		Standard_Boolean IsLessOrEqual(Standard_CString astring);

		/****** Units_Token::IsNotEqual ******/
		/****** md5 signature: 36769476e47ab50f5409c20d3d8a3166 ******/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "
Parameters
----------
astring: str

Return
-------
bool

Description
-----------
Returns false if the field <theword> and the string <astring> are the same, true otherwise.
") IsNotEqual;
		Standard_Boolean IsNotEqual(Standard_CString astring);

		/****** Units_Token::IsNotEqual ******/
		/****** md5 signature: e8645ce2ac4cb3ac92c3ea01bf0c8a9e ******/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "
Parameters
----------
atoken: Units_Token

Return
-------
bool

Description
-----------
Returns false if the field <theword> and the string <theword> contained in the token <atoken> are the same, true otherwise.
") IsNotEqual;
		Standard_Boolean IsNotEqual(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of the word.
") Length;
		Standard_Integer Length();

		/****** Units_Token::Mean ******/
		/****** md5 signature: a851fd604fa8b324d39b661d2c2c1a71 ******/
		%feature("compactdefaultargs") Mean;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the significance of the word <theword>, which is in the field <themean>.
") Mean;
		TCollection_AsciiString Mean();

		/****** Units_Token::Mean ******/
		/****** md5 signature: 30779b0f96303270c03e0a3bfc6a5535 ******/
		%feature("compactdefaultargs") Mean;
		%feature("autodoc", "
Parameters
----------
amean: str

Return
-------
None

Description
-----------
Sets the field <themean> to <amean>.
") Mean;
		void Mean(Standard_CString amean);

		/****** Units_Token::Multiplied ******/
		/****** md5 signature: 148d5140f6c68eb1df6adb62bba5b85d ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
avalue: float

Return
-------
float

Description
-----------
This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
") Multiplied;
		virtual Standard_Real Multiplied(const Standard_Real avalue);

		/****** Units_Token::Multiply ******/
		/****** md5 signature: 40be7fb37d2caace6bbf6bdad7be84a0 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
atoken: Units_Token

Return
-------
opencascade::handle<Units_Token>

Description
-----------
Returns a token which is the product of <self> and another token <atoken>.
") Multiply;
		opencascade::handle<Units_Token> Multiply(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::Power ******/
		/****** md5 signature: f6ed6f696422170673e1838df9015a58 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
atoken: Units_Token

Return
-------
opencascade::handle<Units_Token>

Description
-----------
Returns a token which is <self> to the power of another token <atoken>. The computation is possible only if <atoken> is a dimensionless constant.
") Power;
		opencascade::handle<Units_Token> Power(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::Power ******/
		/****** md5 signature: a7b844569c1187f26e58ee2f46dbea49 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
anexponent: float

Return
-------
opencascade::handle<Units_Token>

Description
-----------
Returns a token which is <self> to the power of <anexponent>.
") Power;
		opencascade::handle<Units_Token> Power(const Standard_Real anexponent);

		/****** Units_Token::Subtract ******/
		/****** md5 signature: 7996d8e309aa1d78fe48107d754ab1cb ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
atoken: Units_Token

Return
-------
opencascade::handle<Units_Token>

Description
-----------
Returns a token which is the subtraction of <self> and another token <atoken>. The subtraction is possible if and only if the dimensions are the same.
") Subtract;
		opencascade::handle<Units_Token> Subtract(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::Update ******/
		/****** md5 signature: 7db3a2f3f383a56d65d7cf5e0328bc25 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
amean: str

Return
-------
None

Description
-----------
Updates the token <self> with the additional signification <amean> by concatenation of the two strings <themean> and <amean>. If the two significations are the same , an information message is written in the output device.
") Update;
		void Update(Standard_CString amean);

		/****** Units_Token::Value ******/
		/****** md5 signature: 52655a2fb6642856b2c68a9331826787 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value stored in the field <thevalue>.
") Value;
		Standard_Real Value();

		/****** Units_Token::Value ******/
		/****** md5 signature: 653c49766524df07f29af6c721fab507 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
avalue: float

Return
-------
None

Description
-----------
Sets the field <thevalue> to <avalue>.
") Value;
		void Value(const Standard_Real avalue);

		/****** Units_Token::Word ******/
		/****** md5 signature: 0c0c482fc87882aed5f744e29648096d ******/
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the string <theword>.
") Word;
		TCollection_AsciiString Word();

		/****** Units_Token::Word ******/
		/****** md5 signature: c1acd16f5c770084ce729ac836df1e77 ******/
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "
Parameters
----------
aword: str

Return
-------
None

Description
-----------
Sets the field <theword> to <aword>.
") Word;
		void Word(Standard_CString aword);

};


%make_alias(Units_Token)

%extend Units_Token {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Units_Unit *
*******************/
class Units_Unit : public Standard_Transient {
	public:
		/****** Units_Unit::Units_Unit ******/
		/****** md5 signature: e2d1a64dc5c715311137ec7429175053 ******/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "
Parameters
----------
aname: str
asymbol: str
avalue: float
aquantity: Units_Quantity

Return
-------
None

Description
-----------
Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit, and <avalue> is the value in relation to the International System of Units.
") Units_Unit;
		 Units_Unit(Standard_CString aname, Standard_CString asymbol, const Standard_Real avalue, const opencascade::handle<Units_Quantity> & aquantity);

		/****** Units_Unit::Units_Unit ******/
		/****** md5 signature: d265038d101c891e6b30775b5e2f8260 ******/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "
Parameters
----------
aname: str
asymbol: str

Return
-------
None

Description
-----------
Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit.
") Units_Unit;
		 Units_Unit(Standard_CString aname, Standard_CString asymbol);

		/****** Units_Unit::Units_Unit ******/
		/****** md5 signature: 9a4cbb739b777a0c14088f4803208b58 ******/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "
Parameters
----------
aname: str

Return
-------
None

Description
-----------
Creates and returns a unit. <aname> is the name of the unit.
") Units_Unit;
		 Units_Unit(Standard_CString aname);

		/****** Units_Unit::Dump ******/
		/****** md5 signature: 11a72ea0354ab05ddfe8b781916d167a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ashift: int
alevel: int

Return
-------
None

Description
-----------
Useful for debugging.
") Dump;
		virtual void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****** Units_Unit::IsEqual ******/
		/****** md5 signature: 4e07c23bce6b8d25cdaaf5ee04a419fb ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
astring: str

Return
-------
bool

Description
-----------
Compares all the symbols linked within <self> with the name of <atoken>, and returns True if there is one symbol equal to the name, False otherwise.
") IsEqual;
		Standard_Boolean IsEqual(Standard_CString astring);

		/****** Units_Unit::Name ******/
		/****** md5 signature: 4ede994349b8ea032efece942c57861d ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the name of the unit <thename>.
") Name;
		TCollection_AsciiString Name();

		/****** Units_Unit::Quantity ******/
		/****** md5 signature: 036bc6e13cafa125e70adbda49142954 ******/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Quantity>

Description
-----------
Returns <thequantity> contained in <self>.
") Quantity;
		opencascade::handle<Units_Quantity> Quantity();

		/****** Units_Unit::Quantity ******/
		/****** md5 signature: d07cd92b482216cb1b14ddb2d7e5ef01 ******/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "
Parameters
----------
aquantity: Units_Quantity

Return
-------
None

Description
-----------
Sets the physical Quantity <aquantity> to <self>.
") Quantity;
		void Quantity(const opencascade::handle<Units_Quantity> & aquantity);

		/****** Units_Unit::Symbol ******/
		/****** md5 signature: 1233c55fe8ff0c96d996918dd47fe96c ******/
		%feature("compactdefaultargs") Symbol;
		%feature("autodoc", "
Parameters
----------
asymbol: str

Return
-------
None

Description
-----------
Adds a new symbol <asymbol> attached to <self>.
") Symbol;
		void Symbol(Standard_CString asymbol);

		/****** Units_Unit::SymbolsSequence ******/
		/****** md5 signature: e247f0ae557660cc13b3dac1c873f3cb ******/
		%feature("compactdefaultargs") SymbolsSequence;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the sequence of symbols <thesymbolssequence>.
") SymbolsSequence;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SymbolsSequence();

		/****** Units_Unit::Token ******/
		/****** md5 signature: b1ebc3cec140dca2e0c8fb99dfd7d0f8 ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Token>

Description
-----------
Starting with <self>, returns a new Token object.
") Token;
		virtual opencascade::handle<Units_Token> Token();

		/****** Units_Unit::Value ******/
		/****** md5 signature: 52655a2fb6642856b2c68a9331826787 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value in relation with the International System of Units.
") Value;
		Standard_Real Value();

		/****** Units_Unit::Value ******/
		/****** md5 signature: 653c49766524df07f29af6c721fab507 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
avalue: float

Return
-------
None

Description
-----------
Sets the value <avalue> to <self>.
") Value;
		void Value(const Standard_Real avalue);

};


%make_alias(Units_Unit)

%extend Units_Unit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Units_UnitsDictionary *
******************************/
class Units_UnitsDictionary : public Standard_Transient {
	public:
		/****** Units_UnitsDictionary::Units_UnitsDictionary ******/
		/****** md5 signature: 090b3e8504113868303a771ed3f3f081 ******/
		%feature("compactdefaultargs") Units_UnitsDictionary;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty instance of UnitsDictionary.
") Units_UnitsDictionary;
		 Units_UnitsDictionary();

		/****** Units_UnitsDictionary::ActiveUnit ******/
		/****** md5 signature: 3fb76e7a1376b27e79e71cfa00c462d0 ******/
		%feature("compactdefaultargs") ActiveUnit;
		%feature("autodoc", "
Parameters
----------
aquantity: str

Return
-------
TCollection_AsciiString

Description
-----------
Returns for <aquantity> the active unit.
") ActiveUnit;
		TCollection_AsciiString ActiveUnit(Standard_CString aquantity);

		/****** Units_UnitsDictionary::Creates ******/
		/****** md5 signature: 336960f3bd894b74398bcb460f145038 ******/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a UnitsDictionary object which contains the sequence of all the units you want to consider, physical quantity by physical quantity.
") Creates;
		void Creates();

		/****** Units_UnitsDictionary::Dump ******/
		/****** md5 signature: 111bf2f128127907ad938aca2e7ab282 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
alevel: int

Return
-------
None

Description
-----------
Dumps only the sequence of quantities without the units if <alevel> is equal to zero, and for each quantity all the units stored if <alevel> is equal to one.
") Dump;
		void Dump(const Standard_Integer alevel);

		/****** Units_UnitsDictionary::Dump ******/
		/****** md5 signature: 9b9ad601cef097734a6478b3c9818bd6 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
adimensions: Units_Dimensions

Return
-------
None

Description
-----------
Dumps for a designated physical dimensions <adimensions> all the previously stored units.
") Dump;
		void Dump(const opencascade::handle<Units_Dimensions> & adimensions);

		/****** Units_UnitsDictionary::Sequence ******/
		/****** md5 signature: e372ed19f436f2e278686b379f0b674c ******/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_QuantitiesSequence>

Description
-----------
Returns the head of the sequence of physical quantities.
") Sequence;
		opencascade::handle<Units_QuantitiesSequence> Sequence();

};


%make_alias(Units_UnitsDictionary)

%extend Units_UnitsDictionary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Units_UnitsSystem *
**************************/
class Units_UnitsSystem : public Standard_Transient {
	public:
		/****** Units_UnitsSystem::Units_UnitsSystem ******/
		/****** md5 signature: 01429700ada8b0002a41cd20921fa9ea ******/
		%feature("compactdefaultargs") Units_UnitsSystem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an instance of UnitsSystem initialized to the S.I. units system.
") Units_UnitsSystem;
		 Units_UnitsSystem();

		/****** Units_UnitsSystem::Units_UnitsSystem ******/
		/****** md5 signature: 87e13c76c018885ca60c1b0c9be77315 ******/
		%feature("compactdefaultargs") Units_UnitsSystem;
		%feature("autodoc", "
Parameters
----------
aName: str
Verbose: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Returns an instance of UnitsSystem initialized to the S.I. units system upgraded by the base system units description file. Attempts to find the four following files: $CSF_`aName`Defaults/.aName $CSF_`aName`SiteDefaults/.aName $CSF_`aName`GroupDefaults/.aName $CSF_`aName`UserDefaults/.aName See: Resource_Manager for the description of this file.
") Units_UnitsSystem;
		 Units_UnitsSystem(Standard_CString aName, const Standard_Boolean Verbose = Standard_False);

		/****** Units_UnitsSystem::Activate ******/
		/****** md5 signature: 7fa3572dcf0fdb978c6907bac59daf7f ******/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "
Parameters
----------
aquantity: str
aunit: str

Return
-------
None

Description
-----------
Specifies for <aquantity> the unit <aunit> used.
") Activate;
		void Activate(Standard_CString aquantity, Standard_CString aunit);

		/****** Units_UnitsSystem::Activates ******/
		/****** md5 signature: 4b6ab8581fdb5c0061b065b5a31097f9 ******/
		%feature("compactdefaultargs") Activates;
		%feature("autodoc", "Return
-------
None

Description
-----------
Activates the first unit of all defined system quantities.
") Activates;
		void Activates();

		/****** Units_UnitsSystem::ActiveUnit ******/
		/****** md5 signature: 3fb76e7a1376b27e79e71cfa00c462d0 ******/
		%feature("compactdefaultargs") ActiveUnit;
		%feature("autodoc", "
Parameters
----------
aquantity: str

Return
-------
TCollection_AsciiString

Description
-----------
Returns for <aquantity> the active unit.
") ActiveUnit;
		TCollection_AsciiString ActiveUnit(Standard_CString aquantity);

		/****** Units_UnitsSystem::ActiveUnitsSequence ******/
		/****** md5 signature: 6afbb572a41bd436215c98c3285a0dfc ******/
		%feature("compactdefaultargs") ActiveUnitsSequence;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfInteger>

Description
-----------
Returns a sequence of integer in correspondence with the sequence of quantities, which indicates, for each redefined quantity, the index into the sequence of units, of the active unit.
") ActiveUnitsSequence;
		opencascade::handle<TColStd_HSequenceOfInteger> ActiveUnitsSequence();

		/****** Units_UnitsSystem::ConvertSIValueToUserSystem ******/
		/****** md5 signature: 47ffbd8293fb408e6c11da16def1ef37 ******/
		%feature("compactdefaultargs") ConvertSIValueToUserSystem;
		%feature("autodoc", "
Parameters
----------
aquantity: str
avalue: float

Return
-------
float

Description
-----------
Converts the real value <avalue> from the S.I. system of units to the user system of units. <aquantity> is the physical dimensions of the measurement.
") ConvertSIValueToUserSystem;
		Standard_Real ConvertSIValueToUserSystem(Standard_CString aquantity, const Standard_Real avalue);

		/****** Units_UnitsSystem::ConvertUserSystemValueToSI ******/
		/****** md5 signature: 0183bddd3e718408a18afdd3dd78348a ******/
		%feature("compactdefaultargs") ConvertUserSystemValueToSI;
		%feature("autodoc", "
Parameters
----------
aquantity: str
avalue: float

Return
-------
float

Description
-----------
Converts the real value <avalue> from the user system of units to the S.I. system of units. <aquantity> is the physical dimensions of the measurement.
") ConvertUserSystemValueToSI;
		Standard_Real ConvertUserSystemValueToSI(Standard_CString aquantity, const Standard_Real avalue);

		/****** Units_UnitsSystem::ConvertValueToUserSystem ******/
		/****** md5 signature: 601d7f865a6550eb8aff7e18b582a224 ******/
		%feature("compactdefaultargs") ConvertValueToUserSystem;
		%feature("autodoc", "
Parameters
----------
aquantity: str
avalue: float
aunit: str

Return
-------
float

Description
-----------
Converts a real value <avalue> from the unit <aunit> belonging to the physical dimensions <aquantity> to the corresponding unit of the user system.
") ConvertValueToUserSystem;
		Standard_Real ConvertValueToUserSystem(Standard_CString aquantity, const Standard_Real avalue, Standard_CString aunit);

		/****** Units_UnitsSystem::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** Units_UnitsSystem::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if no units has been defined in the system.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** Units_UnitsSystem::QuantitiesSequence ******/
		/****** md5 signature: 6eab1984988d001095d55f888c102598 ******/
		%feature("compactdefaultargs") QuantitiesSequence;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_QuantitiesSequence>

Description
-----------
Returns the sequence of refined quantities.
") QuantitiesSequence;
		opencascade::handle<Units_QuantitiesSequence> QuantitiesSequence();

		/****** Units_UnitsSystem::Remove ******/
		/****** md5 signature: 34aa69d23ad7daea18c24addc5a312e9 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
aquantity: str
aunit: str

Return
-------
None

Description
-----------
Removes for <aquantity> the unit <aunit> used.
") Remove;
		void Remove(Standard_CString aquantity, Standard_CString aunit);

		/****** Units_UnitsSystem::Specify ******/
		/****** md5 signature: aac6809cfcbfc1f8b1ba4a82bb3e4182 ******/
		%feature("compactdefaultargs") Specify;
		%feature("autodoc", "
Parameters
----------
aquantity: str
aunit: str

Return
-------
None

Description
-----------
Specifies for <aquantity> the unit <aunit> used.
") Specify;
		void Specify(Standard_CString aquantity, Standard_CString aunit);

};


%make_alias(Units_UnitsSystem)

%extend Units_UnitsSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Units_MathSentence *
***************************/
class Units_MathSentence : public Units_Sentence {
	public:
		/****** Units_MathSentence::Units_MathSentence ******/
		/****** md5 signature: b28d02fa95742151d4183536178bfa4e ******/
		%feature("compactdefaultargs") Units_MathSentence;
		%feature("autodoc", "
Parameters
----------
astring: str

Return
-------
None

Description
-----------
Creates and returns a MathSentence object. The string <astring> describes an algebraic formula in natural language.
") Units_MathSentence;
		 Units_MathSentence(Standard_CString astring);

};


%extend Units_MathSentence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Units_ShiftedToken *
***************************/
class Units_ShiftedToken : public Units_Token {
	public:
		/****** Units_ShiftedToken::Units_ShiftedToken ******/
		/****** md5 signature: d7a1d6300111d9009b1c7bb75c90540c ******/
		%feature("compactdefaultargs") Units_ShiftedToken;
		%feature("autodoc", "
Parameters
----------
aword: str
amean: str
avalue: float
amove: float
adimensions: Units_Dimensions

Return
-------
None

Description
-----------
Creates and returns a shifted token. <aword> is a string containing the available word, <amean> gives the signification of the token, <avalue> is the numeric value of the dimension, <amove> is the gap, and <adimensions> is the dimension of the given word <aword>.
") Units_ShiftedToken;
		 Units_ShiftedToken(Standard_CString aword, Standard_CString amean, const Standard_Real avalue, const Standard_Real amove, const opencascade::handle<Units_Dimensions> & adimensions);

		/****** Units_ShiftedToken::Creates ******/
		/****** md5 signature: d0675db69fb4f5482f0096baa17d254b ******/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Token>

Description
-----------
Creates and returns a token, which is a ShiftedToken.
") Creates;
		virtual opencascade::handle<Units_Token> Creates();

		/****** Units_ShiftedToken::Divided ******/
		/****** md5 signature: 70a30d4e82fdfa136029b4b7d198a201 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
avalue: float

Return
-------
float

Description
-----------
This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
") Divided;
		virtual Standard_Real Divided(const Standard_Real avalue);

		/****** Units_ShiftedToken::Dump ******/
		/****** md5 signature: 7ba3a97b6ef5901f04268a088bfd756b ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ashift: int
alevel: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		virtual void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****** Units_ShiftedToken::Move ******/
		/****** md5 signature: 0badba24964bceada17ae3d7e9e3f59a ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the gap <themove>.
") Move;
		Standard_Real Move();

		/****** Units_ShiftedToken::Multiplied ******/
		/****** md5 signature: 232b503aa880dce7590d3656f503d863 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
avalue: float

Return
-------
float

Description
-----------
This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
") Multiplied;
		virtual Standard_Real Multiplied(const Standard_Real avalue);

};


%make_alias(Units_ShiftedToken)

%extend Units_ShiftedToken {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Units_ShiftedUnit *
**************************/
class Units_ShiftedUnit : public Units_Unit {
	public:
		/****** Units_ShiftedUnit::Units_ShiftedUnit ******/
		/****** md5 signature: 723c5258f6e5560ce254ce2750aab52e ******/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "
Parameters
----------
aname: str
asymbol: str
avalue: float
amove: float
aquantity: Units_Quantity

Return
-------
None

Description
-----------
Creates and returns a shifted unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit, <avalue> is the value in relation to the International System of Units, and <amove> is the gap in relation to another unit. //! For example Celsius degree of temperature is an instance of ShiftedUnit with <avalue> equal to 1. and <amove> equal to 273.15.
") Units_ShiftedUnit;
		 Units_ShiftedUnit(Standard_CString aname, Standard_CString asymbol, const Standard_Real avalue, const Standard_Real amove, const opencascade::handle<Units_Quantity> & aquantity);

		/****** Units_ShiftedUnit::Units_ShiftedUnit ******/
		/****** md5 signature: dde8d329bda54e7b68a53aad706deaa7 ******/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "
Parameters
----------
aname: str
asymbol: str

Return
-------
None

Description
-----------
Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit.
") Units_ShiftedUnit;
		 Units_ShiftedUnit(Standard_CString aname, Standard_CString asymbol);

		/****** Units_ShiftedUnit::Units_ShiftedUnit ******/
		/****** md5 signature: 39584d4db24403e14b8abc85b5da37db ******/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "
Parameters
----------
aname: str

Return
-------
None

Description
-----------
Creates and returns a unit. <aname> is the name of the unit.
") Units_ShiftedUnit;
		 Units_ShiftedUnit(Standard_CString aname);

		/****** Units_ShiftedUnit::Dump ******/
		/****** md5 signature: 7ba3a97b6ef5901f04268a088bfd756b ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ashift: int
alevel: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		virtual void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****** Units_ShiftedUnit::Move ******/
		/****** md5 signature: b1ae0e01da8730c4bde335653a27be14 ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "
Parameters
----------
amove: float

Return
-------
None

Description
-----------
Sets the field <themove> to <amove>.
") Move;
		void Move(const Standard_Real amove);

		/****** Units_ShiftedUnit::Move ******/
		/****** md5 signature: 0badba24964bceada17ae3d7e9e3f59a ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the shifted value <themove>.
") Move;
		Standard_Real Move();

		/****** Units_ShiftedUnit::Token ******/
		/****** md5 signature: ced42835337afba3c4436eb1531f10e8 ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Token>

Description
-----------
This redefined method returns a ShiftedToken object.
") Token;
		virtual opencascade::handle<Units_Token> Token();

};


%make_alias(Units_ShiftedUnit)

%extend Units_ShiftedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Units_UnitSentence *
***************************/
class Units_UnitSentence : public Units_Sentence {
	public:
		/****** Units_UnitSentence::Units_UnitSentence ******/
		/****** md5 signature: 79fddd0148d07d98b1f68107a190d9ba ******/
		%feature("compactdefaultargs") Units_UnitSentence;
		%feature("autodoc", "
Parameters
----------
astring: str

Return
-------
None

Description
-----------
Creates and returns a UnitSentence. The string <astring> describes in natural language the unit or the composed unit to be analysed.
") Units_UnitSentence;
		 Units_UnitSentence(Standard_CString astring);

		/****** Units_UnitSentence::Units_UnitSentence ******/
		/****** md5 signature: 5b625b19d02339a0ef47688689e3be65 ******/
		%feature("compactdefaultargs") Units_UnitSentence;
		%feature("autodoc", "
Parameters
----------
astring: str
aquantitiessequence: Units_QuantitiesSequence

Return
-------
None

Description
-----------
Creates and returns a UnitSentence. The string <astring> describes in natural language the unit to be analysed. The sequence of physical quantities <asequenceofquantities> describes the available dictionary of units you want to use.
") Units_UnitSentence;
		 Units_UnitSentence(Standard_CString astring, const opencascade::handle<Units_QuantitiesSequence> & aquantitiessequence);

		/****** Units_UnitSentence::Analyse ******/
		/****** md5 signature: 7a03a82444f6b3d45e5bfd115d1feda6 ******/
		%feature("compactdefaultargs") Analyse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Analyzes the sequence of tokens created by the constructor to find the true significance of each token.
") Analyse;
		void Analyse();

		/****** Units_UnitSentence::SetUnits ******/
		/****** md5 signature: 2e8f5698a9d586cd57b0bb4c5deeb2ab ******/
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "
Parameters
----------
aquantitiessequence: Units_QuantitiesSequence

Return
-------
None

Description
-----------
For each token which represents a unit, finds in the sequence of physical quantities all the characteristics of the unit found.
") SetUnits;
		void SetUnits(const opencascade::handle<Units_QuantitiesSequence> & aquantitiessequence);

};


%extend Units_UnitSentence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Units_UnitsLexicon *
***************************/
class Units_UnitsLexicon : public Units_Lexicon {
	public:
		/****** Units_UnitsLexicon::Units_UnitsLexicon ******/
		/****** md5 signature: 5346984bc371b417d497293a35fd4ee0 ******/
		%feature("compactdefaultargs") Units_UnitsLexicon;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty instance of UnitsLexicon.
") Units_UnitsLexicon;
		 Units_UnitsLexicon();

		/****** Units_UnitsLexicon::Creates ******/
		/****** md5 signature: 6f502018e378671e3e8a24a2bcdb0708 ******/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "
Parameters
----------
amode: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Reads the files <afilename1> and <afilename2> to create a sequence of tokens stored in <thesequenceoftokens>.
") Creates;
		void Creates(const Standard_Boolean amode = Standard_True);

		/****** Units_UnitsLexicon::Dump ******/
		/****** md5 signature: 0122bc94dff7b9dabc6bcac8a9f7fc02 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Useful for debugging.
") Dump;
		virtual void Dump();

};


%make_alias(Units_UnitsLexicon)

%extend Units_UnitsLexicon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class Units_QuantitiesSequence : public Units_QtsSequence, public Standard_Transient {
  public:
    Units_QuantitiesSequence();
    Units_QuantitiesSequence(const Units_QtsSequence& theOther);
    const Units_QtsSequence& Sequence();
    void Append (const Units_QtsSequence::value_type& theItem);
    void Append (Units_QtsSequence& theSequence);
    Units_QtsSequence& ChangeSequence();
};
%make_alias(Units_QuantitiesSequence)


class Units_TokensSequence : public Units_TksSequence, public Standard_Transient {
  public:
    Units_TokensSequence();
    Units_TokensSequence(const Units_TksSequence& theOther);
    const Units_TksSequence& Sequence();
    void Append (const Units_TksSequence::value_type& theItem);
    void Append (Units_TksSequence& theSequence);
    Units_TksSequence& ChangeSequence();
};
%make_alias(Units_TokensSequence)


class Units_UnitsSequence : public Units_UtsSequence, public Standard_Transient {
  public:
    Units_UnitsSequence();
    Units_UnitsSequence(const Units_UtsSequence& theOther);
    const Units_UtsSequence& Sequence();
    void Append (const Units_UtsSequence::value_type& theItem);
    void Append (Units_UtsSequence& theSequence);
    Units_UtsSequence& ChangeSequence();
};
%make_alias(Units_UnitsSequence)


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def units_Convert(*args):
	return units.Convert(*args)

@deprecated
def units_DictionaryOfUnits(*args):
	return units.DictionaryOfUnits(*args)

@deprecated
def units_Dimensions(*args):
	return units.Dimensions(*args)

@deprecated
def units_FirstQuantity(*args):
	return units.FirstQuantity(*args)

@deprecated
def units_FromSI(*args):
	return units.FromSI(*args)

@deprecated
def units_FromSI(*args):
	return units.FromSI(*args)

@deprecated
def units_LexiconFile(*args):
	return units.LexiconFile(*args)

@deprecated
def units_LexiconFormula(*args):
	return units.LexiconFormula(*args)

@deprecated
def units_LexiconUnits(*args):
	return units.LexiconUnits(*args)

@deprecated
def units_NullDimensions(*args):
	return units.NullDimensions(*args)

@deprecated
def units_Quantity(*args):
	return units.Quantity(*args)

@deprecated
def units_ToSI(*args):
	return units.ToSI(*args)

@deprecated
def units_ToSI(*args):
	return units.ToSI(*args)

@deprecated
def units_UnitsFile(*args):
	return units.UnitsFile(*args)

@deprecated
def Units_Dimensions_AAmountOfSubstance(*args):
	return Units_Dimensions.AAmountOfSubstance(*args)

@deprecated
def Units_Dimensions_AElectricCurrent(*args):
	return Units_Dimensions.AElectricCurrent(*args)

@deprecated
def Units_Dimensions_ALength(*args):
	return Units_Dimensions.ALength(*args)

@deprecated
def Units_Dimensions_ALess(*args):
	return Units_Dimensions.ALess(*args)

@deprecated
def Units_Dimensions_ALuminousIntensity(*args):
	return Units_Dimensions.ALuminousIntensity(*args)

@deprecated
def Units_Dimensions_AMass(*args):
	return Units_Dimensions.AMass(*args)

@deprecated
def Units_Dimensions_APlaneAngle(*args):
	return Units_Dimensions.APlaneAngle(*args)

@deprecated
def Units_Dimensions_ASolidAngle(*args):
	return Units_Dimensions.ASolidAngle(*args)

@deprecated
def Units_Dimensions_AThermodynamicTemperature(*args):
	return Units_Dimensions.AThermodynamicTemperature(*args)

@deprecated
def Units_Dimensions_ATime(*args):
	return Units_Dimensions.ATime(*args)

}
