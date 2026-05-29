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
/* end handles declaration */

/* templates */
%template(Units_QtsSequence) NCollection_Sequence<opencascade::handle<Units_Quantity>>;

%extend NCollection_Sequence<opencascade::handle<Units_Quantity>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Units_TksSequence) NCollection_Sequence<opencascade::handle<Units_Token>>;

%extend NCollection_Sequence<opencascade::handle<Units_Token>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Units_UtsSequence) NCollection_Sequence<opencascade::handle<Units_Unit>>;

%extend NCollection_Sequence<opencascade::handle<Units_Unit>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<Units_Quantity>> Units_QtsSequence;
typedef NCollection_HSequence<opencascade::handle<Units_Quantity>> Units_QuantitiesSequence;
typedef NCollection_Sequence<opencascade::handle<Units_Token>> Units_TksSequence;
typedef NCollection_HSequence<opencascade::handle<Units_Token>> Units_TokensSequence;
typedef NCollection_HSequence<opencascade::handle<Units_Unit>> Units_UnitsSequence;
typedef NCollection_Sequence<opencascade::handle<Units_Unit>> Units_UtsSequence;
/* end typedefs declaration */

/**************
* class Units *
**************/
%rename(units) Units;
class Units {
	public:
		/****** Units::Convert ******/
		/****** md5 signature: f6b2c64b3e7cb53961dc8ba85421ad26 ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
avalue: double
afirstunit: char *
asecondunit: char *

Return
-------
double

Description
-----------
Converts <avalue> expressed in <afirstunit> into the <asecondunit>.
") Convert;
		static double Convert(const double avalue, const char * const afirstunit, const char * const asecondunit);

		/****** Units::DictionaryOfUnits ******/
		/****** md5 signature: f7e4e22ac434e396770e85e904cf4674 ******/
		%feature("compactdefaultargs") DictionaryOfUnits;
		%feature("autodoc", "
Parameters
----------
amode: bool (optional, default to false)

Return
-------
opencascade::handle<Units_UnitsDictionary>

Description
-----------
Returns a unique instance of the dictionary of units. If <amode> is True, then it forces the recomputation of the dictionary of units.
") DictionaryOfUnits;
		static opencascade::handle<Units_UnitsDictionary> DictionaryOfUnits(const bool amode = false);

		/****** Units::Dimensions ******/
		/****** md5 signature: e8f312ed534bc49acd22da3123019036 ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "
Parameters
----------
aType: char *

Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
return the dimension associated to the Type.
") Dimensions;
		static opencascade::handle<Units_Dimensions> Dimensions(const char * const aType);

		/****** Units::FirstQuantity ******/
		/****** md5 signature: bb4e4a1f0da9a78f1e0697f133c4e1b2 ******/
		%feature("compactdefaultargs") FirstQuantity;
		%feature("autodoc", "
Parameters
----------
aunit: char *

Return
-------
char *

Description
-----------
Returns the first quantity string founded from the unit <aUnit>.
") FirstQuantity;
		static const char * FirstQuantity(const char * const aunit);

		/****** Units::FromSI ******/
		/****** md5 signature: 9dcb8da55b25f2f9d08e45d4c1aef391 ******/
		%feature("compactdefaultargs") FromSI;
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
No available documentation.
") FromSI;
		static double FromSI(const double aData, const char * const aUnit);

		/****** Units::FromSI ******/
		/****** md5 signature: d9766fbefc7dd1501e8f884354748b8d ******/
		%feature("compactdefaultargs") FromSI;
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
No available documentation.
") FromSI;
		static double FromSI(const double aData, const char * const aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****** Units::LexiconFile ******/
		/****** md5 signature: 2ca1ebfcd937ed7f185a0593b08f7d9e ******/
		%feature("compactdefaultargs") LexiconFile;
		%feature("autodoc", "
Parameters
----------
afile: char *

Return
-------
None

Description
-----------
Defines the location of the file containing the lexicon useful in manipulating composite units.
") LexiconFile;
		static void LexiconFile(const char * const afile);

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
		/****** md5 signature: 1623d85f6b52eedf34232c573a5e8427 ******/
		%feature("compactdefaultargs") LexiconUnits;
		%feature("autodoc", "
Parameters
----------
amode: bool (optional, default to true)

Return
-------
opencascade::handle<Units_Lexicon>

Description
-----------
Returns a unique instance of the Units_Lexicon. If <amode> is True, it forces the recomputation of the dictionary of units, and by consequence the completion of the Units_Lexicon.
") LexiconUnits;
		static opencascade::handle<Units_Lexicon> LexiconUnits(const bool amode = true);

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
		/****** md5 signature: 4610fa5f9efc34788e994ea914b4fc0a ******/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "
Parameters
----------
aquantity: char *

Return
-------
opencascade::handle<Units_Quantity>

Description
-----------
Returns a unique quantity instance corresponding to <aquantity>.
") Quantity;
		static opencascade::handle<Units_Quantity> Quantity(const char * const aquantity);

		/****** Units::ToSI ******/
		/****** md5 signature: 7f6709f7e21815cf50069a97f3d97505 ******/
		%feature("compactdefaultargs") ToSI;
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
No available documentation.
") ToSI;
		static double ToSI(const double aData, const char * const aUnit);

		/****** Units::ToSI ******/
		/****** md5 signature: 8a3e6a4d8c53e212a6278de4aa444f92 ******/
		%feature("compactdefaultargs") ToSI;
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
No available documentation.
") ToSI;
		static double ToSI(const double aData, const char * const aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****** Units::UnitsFile ******/
		/****** md5 signature: c08b7ecab830e200b294c90fc2bcec1d ******/
		%feature("compactdefaultargs") UnitsFile;
		%feature("autodoc", "
Parameters
----------
afile: char *

Return
-------
None

Description
-----------
Defines the location of the file containing all the information useful in creating the dictionary of all the units known to the system.
") UnitsFile;
		static void UnitsFile(const char * const afile);

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
		/****** md5 signature: db8208315e801782d533e1a6fab0b0d6 ******/
		%feature("compactdefaultargs") Units_Dimensions;
		%feature("autodoc", "
Parameters
----------
amass: double
alength: double
atime: double
anelectriccurrent: double
athermodynamictemperature: double
anamountofsubstance: double
aluminousintensity: double
aplaneangle: double
asolidangle: double

Return
-------
None

Description
-----------
Returns a Dimensions object which represents the dimension of a physical quantity. Each of the <amass>, <alength>, <atime>, <anelectriccurrent>, <athermodynamictemperature>, <anamountofsubstance>, <aluminousintensity>, <aplaneangle>, <asolidangle> are the powers for the 7 fundamental units of physical quantity and the 2 secondary fundamental units of physical quantity.
") Units_Dimensions;
		 Units_Dimensions(const double amass, const double alength, const double atime, const double anelectriccurrent, const double athermodynamictemperature, const double anamountofsubstance, const double aluminousintensity, const double aplaneangle, const double asolidangle);

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
		/****** md5 signature: 75edcf15e9909d498b59b53faa11d056 ******/
		%feature("compactdefaultargs") AmountOfSubstance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the power of quantity of material (mole) stored in the dimensions.
") AmountOfSubstance;
		double AmountOfSubstance();

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
		/****** md5 signature: f27f590e92dc795d05dc99128be4b433 ******/
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
		void Dump(const int ashift);

		/****** Units_Dimensions::ElectricCurrent ******/
		/****** md5 signature: 94505a6c3d401c0998b9ccf96f7f2226 ******/
		%feature("compactdefaultargs") ElectricCurrent;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the power of electrical intensity (current) stored in the dimensions.
") ElectricCurrent;
		double ElectricCurrent();

		/****** Units_Dimensions::IsEqual ******/
		/****** md5 signature: 894c431fc768d629827b4ad17d02ae5d ******/
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
		bool IsEqual(const opencascade::handle<Units_Dimensions> & adimensions);

		/****** Units_Dimensions::IsNotEqual ******/
		/****** md5 signature: e4b362306b4806cfdabd76d3d59fece5 ******/
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
		bool IsNotEqual(const opencascade::handle<Units_Dimensions> & adimensions);

		/****** Units_Dimensions::Length ******/
		/****** md5 signature: afabe704e541a27500507f266f05913c ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the power of length stored in the dimensions.
") Length;
		double Length();

		/****** Units_Dimensions::LuminousIntensity ******/
		/****** md5 signature: 2f16056af14030d3eb669dfa7871b18d ******/
		%feature("compactdefaultargs") LuminousIntensity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the power of light intensity stored in the dimensions.
") LuminousIntensity;
		double LuminousIntensity();

		/****** Units_Dimensions::Mass ******/
		/****** md5 signature: 66da788acb9e988f1bfd50432117140e ******/
		%feature("compactdefaultargs") Mass;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the power of mass stored in the dimensions.
") Mass;
		double Mass();

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
		/****** md5 signature: 1e2f931d33d405b5eb9fb53aa35f1047 ******/
		%feature("compactdefaultargs") PlaneAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the power of plane angle stored in the dimensions.
") PlaneAngle;
		double PlaneAngle();

		/****** Units_Dimensions::Power ******/
		/****** md5 signature: 923975cd243cec040e6ef4d78066a1c1 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
anexponent: double

Return
-------
opencascade::handle<Units_Dimensions>

Description
-----------
Creates and returns a new Dimensions object which is the result of the power of <self> and <anexponent>.
") Power;
		opencascade::handle<Units_Dimensions> Power(const double anexponent);

		/****** Units_Dimensions::Quantity ******/
		/****** md5 signature: 6e64f9aabfd8c9ecfea4aef5bea71758 ******/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the quantity string of the dimension.
") Quantity;
		const char * Quantity();

		/****** Units_Dimensions::SolidAngle ******/
		/****** md5 signature: 004b8d91a06ebe9e93c84430a58b89d1 ******/
		%feature("compactdefaultargs") SolidAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the power of solid angle stored in the dimensions.
") SolidAngle;
		double SolidAngle();

		/****** Units_Dimensions::ThermodynamicTemperature ******/
		/****** md5 signature: 52d46a923ceb79d850e638fd538f0afa ******/
		%feature("compactdefaultargs") ThermodynamicTemperature;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the power of temperature stored in the dimensions.
") ThermodynamicTemperature;
		double ThermodynamicTemperature();

		/****** Units_Dimensions::Time ******/
		/****** md5 signature: 75497130a98c81bd581d706077039d2d ******/
		%feature("compactdefaultargs") Time;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the power of time stored in the dimensions.
") Time;
		double Time();

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
		/****** md5 signature: f1a55e85f9dd49e613b1a2cbfabfb2bd ******/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "
Parameters
----------
aunitssystem: Units_UnitsSystem
aquantity: char *

Return
-------
None

Description
-----------
Creates a new instance of the class, initialized with the UnitsSystem <aunitssystem> and positioned at the quantity <aquantity>.
") Units_Explorer;
		 Units_Explorer(const opencascade::handle<Units_UnitsSystem> & aunitssystem, const char * const aquantity);

		/****** Units_Explorer::Units_Explorer ******/
		/****** md5 signature: e1f842becd0e1800dad447f1764e1bf5 ******/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "
Parameters
----------
aunitsdictionary: Units_UnitsDictionary
aquantity: char *

Return
-------
None

Description
-----------
Creates a new instance of the class, initialized with the UnitsDictionary <aunitsdictionary> and positioned at the quantity <aquantity>.
") Units_Explorer;
		 Units_Explorer(const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary, const char * const aquantity);

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
		/****** md5 signature: 3fbceaae0ef79e319cb2f5cf21f8208c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aunitssystem: Units_UnitsSystem
aquantity: char *

Return
-------
None

Description
-----------
Initializes the instance of the class with the UnitsSystem <aunitssystem> and positioned at the quantity <aquantity>.
") Init;
		void Init(const opencascade::handle<Units_UnitsSystem> & aunitssystem, const char * const aquantity);

		/****** Units_Explorer::Init ******/
		/****** md5 signature: 854541d5107fd849f1184035619a58e3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aunitsdictionary: Units_UnitsDictionary
aquantity: char *

Return
-------
None

Description
-----------
Initializes the instance of the class with the UnitsDictionary <aunitsdictionary> and positioned at the quantity <aquantity>.
") Init;
		void Init(const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary, const char * const aquantity);

		/****** Units_Explorer::IsActive ******/
		/****** md5 signature: 8e968f083ce219897192deb87af3e187 ******/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
If the units system to explore is a user system, returns True if the current unit is active, False otherwise. //! If the units system to explore is the units dictionary, returns True if the current unit is the S.I. unit.
") IsActive;
		bool IsActive();

		/****** Units_Explorer::MoreQuantity ******/
		/****** md5 signature: 4474a9a39f777c5c2bf866e39a4733f8 ******/
		%feature("compactdefaultargs") MoreQuantity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is another Quantity to explore, False otherwise.
") MoreQuantity;
		bool MoreQuantity();

		/****** Units_Explorer::MoreUnit ******/
		/****** md5 signature: 1454ae631a21895f8259d3496dc8bb1e ******/
		%feature("compactdefaultargs") MoreUnit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is another Unit to explore, False otherwise.
") MoreUnit;
		bool MoreUnit();

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
		/****** md5 signature: 0b57a7d6606cbde20370a84232efb084 ******/
		%feature("compactdefaultargs") AddToken;
		%feature("autodoc", "
Parameters
----------
aword: char *
amean: char *
avalue: double

Return
-------
None

Description
-----------
Adds to the lexicon a new token with <aword>, <amean>, <avalue> as arguments. If there is already a token with the field <theword> equal to <aword>, the existing token is updated.
") AddToken;
		void AddToken(const char * const aword, const char * const amean, const double avalue);

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
		/****** md5 signature: 2b72171540638c87ba736cc1ccaf2fa9 ******/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Token>>>

Description
-----------
Returns the first item of the sequence of tokens.
") Sequence;
		opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Token>>> Sequence();

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
		/****** md5 signature: 77ee67aa84cb5d90b432253eff3f98bd ******/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "
Parameters
----------
avalue: double
atoken: Units_Token

Return
-------
None

Description
-----------
Returns an instance of this class. <avalue> defines the measurement, and <atoken> the token which defines the unit used.
") Units_Measurement;
		 Units_Measurement(const double avalue, const opencascade::handle<Units_Token> & atoken);

		/****** Units_Measurement::Units_Measurement ******/
		/****** md5 signature: 8f6f64f54a756d882c38fed2947d24c6 ******/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "
Parameters
----------
avalue: double
aunit: char *

Return
-------
None

Description
-----------
Returns an instance of this class. <avalue> defines the measurement, and <aunit> the unit used, described in natural language.
") Units_Measurement;
		 Units_Measurement(const double avalue, const char * const aunit);

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
		/****** md5 signature: e5db275452b8355c64df049da4451349 ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
aunit: char *

Return
-------
None

Description
-----------
Converts (if possible) the measurement object into another unit. <aunit> must have the same dimensionality as the unit contained in the token <thetoken>.
") Convert;
		void Convert(const char * const aunit);

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
		/****** md5 signature: 5c2c35daf5bd46f7a5bce344c39aa76b ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
avalue: double

Return
-------
Units_Measurement

Description
-----------
Returns a measurement which is the division of <self> by the constant <avalue>.
") Divide;
		Units_Measurement Divide(const double avalue);

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
		/****** md5 signature: d7d514bfb712dbaf742bbd33ef233656 ******/
		%feature("compactdefaultargs") HasToken;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasToken;
		bool HasToken();

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
		/****** md5 signature: db3c6d91c697c3cb82a68055b55203f7 ******/
		%feature("compactdefaultargs") Measurement;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the measurement.
") Measurement;
		double Measurement();

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
		/****** md5 signature: 04c12c52dd450347c30fd24a97fdb8e7 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
avalue: double

Return
-------
Units_Measurement

Description
-----------
Returns a measurement which is the multiplication of <self> with the value <avalue>.
") Multiply;
		Units_Measurement Multiply(const double avalue);

		/****** Units_Measurement::Power ******/
		/****** md5 signature: fa3e868342fbe4540c22eaa562d0cc90 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
anexponent: double

Return
-------
Units_Measurement

Description
-----------
Returns a measurement which is <self> powered <anexponent>.
") Power;
		Units_Measurement Power(const double anexponent);

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
		/****** md5 signature: 03b86ba0c862cc8ddc4bd1750d6eb53b ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
avalue: double

Return
-------
Units_Measurement

Description
-----------
No available documentation.
") operator *;
		Units_Measurement operator *(const double avalue);

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
		/****** md5 signature: 9b40a8967a2d8a0316b6c972ac979330 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
avalue: double

Return
-------
Units_Measurement

Description
-----------
No available documentation.
") operator /;
		Units_Measurement operator /(const double avalue);

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
		/****** md5 signature: 325e05c64d7c534040233a3e55f65733 ******/
		%feature("compactdefaultargs") Units_Quantity;
		%feature("autodoc", "
Parameters
----------
aname: char *
adimensions: Units_Dimensions
aunitssequence: NCollection_HSequence<

Return
-------
None

Description
-----------
Creates a new Quantity object with <aname> which is the name of the physical quantity, <adimensions> which is the physical dimensions, and <aunitssequence> which describes all the units known for this quantity.
") Units_Quantity;
		 Units_Quantity(const char * const aname, const opencascade::handle<Units_Dimensions> & adimensions, const opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Unit>> > & aunitssequence);

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
		/****** md5 signature: 966e007ece23310393e329f5ad77af13 ******/
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
		void Dump(const int ashift, const int alevel);

		/****** Units_Quantity::IsEqual ******/
		/****** md5 signature: fc2f8336bdc3f331f6474ab6548c9012 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
astring: char *

Return
-------
bool

Description
-----------
Returns True if the name of the Quantity <self> is equal to <astring>, False otherwise.
") IsEqual;
		bool IsEqual(const char * const astring);

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
		/****** md5 signature: 8a8082353217948739cc933b6e2da3f2 ******/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Unit>>>

Description
-----------
Returns <theunitssequence>, which is the sequence of all the units stored for this physical quantity.
") Sequence;
		opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Unit>>> Sequence();

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
		/****** md5 signature: 7628ded14a49b796a1848015e9beefce ******/
		%feature("compactdefaultargs") Units_Sentence;
		%feature("autodoc", "
Parameters
----------
alexicon: Units_Lexicon
astring: char *

Return
-------
None

Description
-----------
Createsand returns a Sentence, by analyzing the string <astring> with the lexicon <alexicon>.
") Units_Sentence;
		 Units_Sentence(const opencascade::handle<Units_Lexicon> & alexicon, const char * const astring);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if number of created tokens > 0 (i.e creation of sentence is successful).
") IsDone;
		bool IsDone();

		/****** Units_Sentence::Sequence ******/
		/****** md5 signature: 2b72171540638c87ba736cc1ccaf2fa9 ******/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Token>>>

Description
-----------
Returns <thesequenceoftokens>.
") Sequence;
		opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Token>>> Sequence();

		/****** Units_Sentence::Sequence ******/
		/****** md5 signature: 6b8382ed14af5a2a8ea1e821f278229f ******/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "
Parameters
----------
asequenceoftokens: NCollection_HSequence<

Return
-------
None

Description
-----------
Sets the field <thesequenceoftokens> to <asequenceoftokens>.
") Sequence;
		void Sequence(const opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Token>> > & asequenceoftokens);

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
		/****** md5 signature: ed966a5fdf30f9fc85b7c92f49facd11 ******/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "
Parameters
----------
aword: char *

Return
-------
None

Description
-----------
Creates and returns a token. <aword> is a string containing the available word.
") Units_Token;
		 Units_Token(const char * const aword);

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
		/****** md5 signature: 070ef2e37322f218623b2c00a24fd750 ******/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "
Parameters
----------
aword: char *
amean: char *

Return
-------
None

Description
-----------
Creates and returns a token. <aword> is a string containing the available word and <amean> gives the signification of the token.
") Units_Token;
		 Units_Token(const char * const aword, const char * const amean);

		/****** Units_Token::Units_Token ******/
		/****** md5 signature: 0f2d21cd88941609d4b4e0ace1b8097a ******/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "
Parameters
----------
aword: char *
amean: char *
avalue: double

Return
-------
None

Description
-----------
Creates and returns a token. <aword> is a string containing the available word, <amean> gives the signification of the token and <avalue> is the numeric value of the dimension.
") Units_Token;
		 Units_Token(const char * const aword, const char * const amean, const double avalue);

		/****** Units_Token::Units_Token ******/
		/****** md5 signature: b405a12f3c8fe4680f60874453c8a646 ******/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "
Parameters
----------
aword: char *
amean: char *
avalue: double
adimension: Units_Dimensions

Return
-------
None

Description
-----------
Creates and returns a token. <aword> is a string containing the available word, <amean> gives the signification of the token, <avalue> is the numeric value of the dimension, and <adimensions> is the dimension of the given word <aword>.
") Units_Token;
		 Units_Token(const char * const aword, const char * const amean, const double avalue, const opencascade::handle<Units_Dimensions> & adimension);

		/****** Units_Token::Add ******/
		/****** md5 signature: 77a30e05f7fa4e2a8d8ac43e20d87287 ******/
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
		opencascade::handle<Units_Token> Add(const int aninteger);

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
		/****** md5 signature: 7ed77e4162d81e49d7da03507f59c6c3 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
avalue: double

Return
-------
double

Description
-----------
This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
") Divided;
		virtual double Divided(const double avalue);

		/****** Units_Token::Dump ******/
		/****** md5 signature: 0a190defccd7dbd006a30496dbbac447 ******/
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
		virtual void Dump(const int ashift, const int alevel);

		/****** Units_Token::IsEqual ******/
		/****** md5 signature: fc2f8336bdc3f331f6474ab6548c9012 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
astring: char *

Return
-------
bool

Description
-----------
Returns true if the field <theword> and the string <astring> are the same, false otherwise.
") IsEqual;
		bool IsEqual(const char * const astring);

		/****** Units_Token::IsEqual ******/
		/****** md5 signature: f6faab79e9231947323a359bf2bd006c ******/
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
		bool IsEqual(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::IsGreater ******/
		/****** md5 signature: ad3e3c777d0e7b6dfb93a7613f77fc31 ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
astring: char *

Return
-------
bool

Description
-----------
Returns false if the field <theword> is strictly contained at the beginning of the string <astring>, true otherwise.
") IsGreater;
		bool IsGreater(const char * const astring);

		/****** Units_Token::IsGreater ******/
		/****** md5 signature: e991663541dd2ede4345be6ed522df70 ******/
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
		bool IsGreater(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::IsGreaterOrEqual ******/
		/****** md5 signature: 9f4d46400b1f3f1f6813f27539435348 ******/
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
		bool IsGreaterOrEqual(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::IsLessOrEqual ******/
		/****** md5 signature: 478c2d1d8b47705388482bdd9067cbc0 ******/
		%feature("compactdefaultargs") IsLessOrEqual;
		%feature("autodoc", "
Parameters
----------
astring: char *

Return
-------
bool

Description
-----------
Returns true if the field <theword> is strictly contained at the beginning of the string <astring>, false otherwise.
") IsLessOrEqual;
		bool IsLessOrEqual(const char * const astring);

		/****** Units_Token::IsNotEqual ******/
		/****** md5 signature: 08b1768264401c11317353e4f8f7f745 ******/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "
Parameters
----------
astring: char *

Return
-------
bool

Description
-----------
Returns false if the field <theword> and the string <astring> are the same, true otherwise.
") IsNotEqual;
		bool IsNotEqual(const char * const astring);

		/****** Units_Token::IsNotEqual ******/
		/****** md5 signature: 1cafed6497fd2b3292faeccd4f53231a ******/
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
		bool IsNotEqual(const opencascade::handle<Units_Token> & atoken);

		/****** Units_Token::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of the word.
") Length;
		int Length();

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
		/****** md5 signature: 581ed5bc24c46ba2873f72131ba0229a ******/
		%feature("compactdefaultargs") Mean;
		%feature("autodoc", "
Parameters
----------
amean: char *

Return
-------
None

Description
-----------
Sets the field <themean> to <amean>.
") Mean;
		void Mean(const char * const amean);

		/****** Units_Token::Multiplied ******/
		/****** md5 signature: b762bca0002e78699529490c1dde91fa ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
avalue: double

Return
-------
double

Description
-----------
This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
") Multiplied;
		virtual double Multiplied(const double avalue);

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
		/****** md5 signature: 59bc8e2957e4ed7b7b0461c709a87469 ******/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
anexponent: double

Return
-------
opencascade::handle<Units_Token>

Description
-----------
Returns a token which is <self> to the power of <anexponent>.
") Power;
		opencascade::handle<Units_Token> Power(const double anexponent);

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
		/****** md5 signature: 24211addaa358997de5d1b32d737bef5 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
amean: char *

Return
-------
None

Description
-----------
Updates the token <self> with the additional signification <amean> by concatenation of the two strings <themean> and <amean>. If the two significations are the same, an information message is written in the output device.
") Update;
		void Update(const char * const amean);

		/****** Units_Token::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value stored in the field <thevalue>.
") Value;
		double Value();

		/****** Units_Token::Value ******/
		/****** md5 signature: e1d21aaf26e5c12f56615de344e24da8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
avalue: double

Return
-------
None

Description
-----------
Sets the field <thevalue> to <avalue>.
") Value;
		void Value(const double avalue);

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
		/****** md5 signature: f361c45bc55515836eff0542af11eb05 ******/
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "
Parameters
----------
aword: char *

Return
-------
None

Description
-----------
Sets the field <theword> to <aword>.
") Word;
		void Word(const char * const aword);

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
		/****** md5 signature: 6e0a3f75d19a2f543eeed1c9e2b4857b ******/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "
Parameters
----------
aname: char *
asymbol: char *
avalue: double
aquantity: Units_Quantity

Return
-------
None

Description
-----------
Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit, and <avalue> is the value in relation to the International System of Units.
") Units_Unit;
		 Units_Unit(const char * const aname, const char * const asymbol, const double avalue, const opencascade::handle<Units_Quantity> & aquantity);

		/****** Units_Unit::Units_Unit ******/
		/****** md5 signature: 8d44062d4f7cb80b0b9a8ec453cd6b00 ******/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "
Parameters
----------
aname: char *
asymbol: char *

Return
-------
None

Description
-----------
Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit.
") Units_Unit;
		 Units_Unit(const char * const aname, const char * const asymbol);

		/****** Units_Unit::Units_Unit ******/
		/****** md5 signature: 386a1412b72c52c63c5b3fb3ff6d5c14 ******/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "
Parameters
----------
aname: char *

Return
-------
None

Description
-----------
Creates and returns a unit. <aname> is the name of the unit.
") Units_Unit;
		 Units_Unit(const char * const aname);

		/****** Units_Unit::Dump ******/
		/****** md5 signature: 0a190defccd7dbd006a30496dbbac447 ******/
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
		virtual void Dump(const int ashift, const int alevel);

		/****** Units_Unit::IsEqual ******/
		/****** md5 signature: fc2f8336bdc3f331f6474ab6548c9012 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
astring: char *

Return
-------
bool

Description
-----------
Compares all the symbols linked within <self> with the name of <atoken>, and returns True if there is one symbol equal to the name, False otherwise.
") IsEqual;
		bool IsEqual(const char * const astring);

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
		/****** md5 signature: e8c34e5c78419c2a9ae1acc287610555 ******/
		%feature("compactdefaultargs") Symbol;
		%feature("autodoc", "
Parameters
----------
asymbol: char *

Return
-------
None

Description
-----------
Adds a new symbol <asymbol> attached to <self>.
") Symbol;
		void Symbol(const char * const asymbol);

		/****** Units_Unit::SymbolsSequence ******/
		/****** md5 signature: 56775542f19807b6104687f0a2beab2a ******/
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
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value in relation with the International System of Units.
") Value;
		double Value();

		/****** Units_Unit::Value ******/
		/****** md5 signature: e1d21aaf26e5c12f56615de344e24da8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
avalue: double

Return
-------
None

Description
-----------
Sets the value <avalue> to <self>.
") Value;
		void Value(const double avalue);

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
		/****** md5 signature: 5daebeda28dc79de03798ed86d08a005 ******/
		%feature("compactdefaultargs") ActiveUnit;
		%feature("autodoc", "
Parameters
----------
aquantity: char *

Return
-------
TCollection_AsciiString

Description
-----------
Returns for <aquantity> the active unit.
") ActiveUnit;
		TCollection_AsciiString ActiveUnit(const char * const aquantity);

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
		/****** md5 signature: 40642115e28198348cbc6cf1bca29cba ******/
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
		void Dump(const int alevel);

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
		/****** md5 signature: 1c7b6153608dcd4f18daefe4f59ec667 ******/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Quantity>>>

Description
-----------
Returns the head of the sequence of physical quantities.
") Sequence;
		opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Quantity>>> Sequence();

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
		/****** md5 signature: d7c2bf5a904bfea9257c39d37d5d0438 ******/
		%feature("compactdefaultargs") Units_UnitsSystem;
		%feature("autodoc", "
Parameters
----------
aName: char *
Verbose: bool (optional, default to false)

Return
-------
None

Description
-----------
Returns an instance of UnitsSystem initialized to the S.I. units system upgraded by the base system units description file. Attempts to find the four following files: $CSF_`aName`Defaults/.aName $CSF_`aName`SiteDefaults/.aName $CSF_`aName`GroupDefaults/.aName $CSF_`aName`UserDefaults/.aName See: Resource_Manager for the description of this file.
") Units_UnitsSystem;
		 Units_UnitsSystem(const char * const aName, const bool Verbose = false);

		/****** Units_UnitsSystem::Activate ******/
		/****** md5 signature: bf0cba5abbbfa9c47c954e6a2a8fbb76 ******/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "
Parameters
----------
aquantity: char *
aunit: char *

Return
-------
None

Description
-----------
Specifies for <aquantity> the unit <aunit> used.
") Activate;
		void Activate(const char * const aquantity, const char * const aunit);

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
		/****** md5 signature: 5daebeda28dc79de03798ed86d08a005 ******/
		%feature("compactdefaultargs") ActiveUnit;
		%feature("autodoc", "
Parameters
----------
aquantity: char *

Return
-------
TCollection_AsciiString

Description
-----------
Returns for <aquantity> the active unit.
") ActiveUnit;
		TCollection_AsciiString ActiveUnit(const char * const aquantity);

		/****** Units_UnitsSystem::ActiveUnitsSequence ******/
		/****** md5 signature: db397a7bf420148a6a6d1d4be8b00027 ******/
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
		/****** md5 signature: b2bf5f73e866137be19d06acbc13e683 ******/
		%feature("compactdefaultargs") ConvertSIValueToUserSystem;
		%feature("autodoc", "
Parameters
----------
aquantity: char *
avalue: double

Return
-------
double

Description
-----------
Converts the real value <avalue> from the S.I. system of units to the user system of units. <aquantity> is the physical dimensions of the measurement.
") ConvertSIValueToUserSystem;
		double ConvertSIValueToUserSystem(const char * const aquantity, const double avalue);

		/****** Units_UnitsSystem::ConvertUserSystemValueToSI ******/
		/****** md5 signature: 96457a5f5c756f08f1eba76b290b8564 ******/
		%feature("compactdefaultargs") ConvertUserSystemValueToSI;
		%feature("autodoc", "
Parameters
----------
aquantity: char *
avalue: double

Return
-------
double

Description
-----------
Converts the real value <avalue> from the user system of units to the S.I. system of units. <aquantity> is the physical dimensions of the measurement.
") ConvertUserSystemValueToSI;
		double ConvertUserSystemValueToSI(const char * const aquantity, const double avalue);

		/****** Units_UnitsSystem::ConvertValueToUserSystem ******/
		/****** md5 signature: cb84b5c7d797e6a398afbdd284ac0a38 ******/
		%feature("compactdefaultargs") ConvertValueToUserSystem;
		%feature("autodoc", "
Parameters
----------
aquantity: char *
avalue: double
aunit: char *

Return
-------
double

Description
-----------
Converts a real value <avalue> from the unit <aunit> belonging to the physical dimensions <aquantity> to the corresponding unit of the user system.
") ConvertValueToUserSystem;
		double ConvertValueToUserSystem(const char * const aquantity, const double avalue, const char * const aunit);

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
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if no units has been defined in the system.
") IsEmpty;
		bool IsEmpty();

		/****** Units_UnitsSystem::QuantitiesSequence ******/
		/****** md5 signature: 1af2255d15e78d73c86fe4ed4a2a8f90 ******/
		%feature("compactdefaultargs") QuantitiesSequence;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Quantity>>>

Description
-----------
Returns the sequence of refined quantities.
") QuantitiesSequence;
		opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Quantity>>> QuantitiesSequence();

		/****** Units_UnitsSystem::Remove ******/
		/****** md5 signature: c71ced153bce269b12d56e66e822d8c1 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
aquantity: char *
aunit: char *

Return
-------
None

Description
-----------
Removes for <aquantity> the unit <aunit> used.
") Remove;
		void Remove(const char * const aquantity, const char * const aunit);

		/****** Units_UnitsSystem::Specify ******/
		/****** md5 signature: 9b978504fcfbdd69c44051258274253b ******/
		%feature("compactdefaultargs") Specify;
		%feature("autodoc", "
Parameters
----------
aquantity: char *
aunit: char *

Return
-------
None

Description
-----------
Specifies for <aquantity> the unit <aunit> used.
") Specify;
		void Specify(const char * const aquantity, const char * const aunit);

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
		/****** md5 signature: 11ae96c35b27b524ea44cb4a59ce66fb ******/
		%feature("compactdefaultargs") Units_MathSentence;
		%feature("autodoc", "
Parameters
----------
astring: char *

Return
-------
None

Description
-----------
Creates and returns a MathSentence object. The string <astring> describes an algebraic formula in natural language.
") Units_MathSentence;
		 Units_MathSentence(const char * const astring);

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
		/****** md5 signature: 970b772daca0c3be95800a03b52f9382 ******/
		%feature("compactdefaultargs") Units_ShiftedToken;
		%feature("autodoc", "
Parameters
----------
aword: char *
amean: char *
avalue: double
amove: double
adimensions: Units_Dimensions

Return
-------
None

Description
-----------
Creates and returns a shifted token. <aword> is a string containing the available word, <amean> gives the signification of the token, <avalue> is the numeric value of the dimension, <amove> is the gap, and <adimensions> is the dimension of the given word <aword>.
") Units_ShiftedToken;
		 Units_ShiftedToken(const char * const aword, const char * const amean, const double avalue, const double amove, const opencascade::handle<Units_Dimensions> & adimensions);

		/****** Units_ShiftedToken::Creates ******/
		/****** md5 signature: 7a5180841c4f7add558ce64be8a9b86b ******/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Token>

Description
-----------
Creates and returns a token, which is a ShiftedToken.
") Creates;
		opencascade::handle<Units_Token> Creates();

		/****** Units_ShiftedToken::Divided ******/
		/****** md5 signature: 379a770430c2dd964c39b5f9a114a21a ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
avalue: double

Return
-------
double

Description
-----------
This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
") Divided;
		double Divided(const double avalue);

		/****** Units_ShiftedToken::Dump ******/
		/****** md5 signature: 9d43806df55510fcfed8ecb444c66924 ******/
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
		void Dump(const int ashift, const int alevel);

		/****** Units_ShiftedToken::Move ******/
		/****** md5 signature: 89eec54ed38b0da9b6cdacd07381a67c ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the gap <themove>.
") Move;
		double Move();

		/****** Units_ShiftedToken::Multiplied ******/
		/****** md5 signature: 50c4d5e371e458896ed0dcc3636eb3d9 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
avalue: double

Return
-------
double

Description
-----------
This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
") Multiplied;
		double Multiplied(const double avalue);

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
		/****** md5 signature: d1735fbc10dfdfe379eae422e62c465e ******/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "
Parameters
----------
aname: char *
asymbol: char *
avalue: double
amove: double
aquantity: Units_Quantity

Return
-------
None

Description
-----------
Creates and returns a shifted unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit, <avalue> is the value in relation to the International System of Units, and <amove> is the gap in relation to another unit. //! For example Celsius degree of temperature is an instance of ShiftedUnit with <avalue> equal to 1. and <amove> equal to 273.15.
") Units_ShiftedUnit;
		 Units_ShiftedUnit(const char * const aname, const char * const asymbol, const double avalue, const double amove, const opencascade::handle<Units_Quantity> & aquantity);

		/****** Units_ShiftedUnit::Units_ShiftedUnit ******/
		/****** md5 signature: 7ca5a7e99f320e795c50b2f0222786d0 ******/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "
Parameters
----------
aname: char *
asymbol: char *

Return
-------
None

Description
-----------
Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit.
") Units_ShiftedUnit;
		 Units_ShiftedUnit(const char * const aname, const char * const asymbol);

		/****** Units_ShiftedUnit::Units_ShiftedUnit ******/
		/****** md5 signature: ce738b6bb7f6f7faaccbe4b6f74c753c ******/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "
Parameters
----------
aname: char *

Return
-------
None

Description
-----------
Creates and returns a unit. <aname> is the name of the unit.
") Units_ShiftedUnit;
		 Units_ShiftedUnit(const char * const aname);

		/****** Units_ShiftedUnit::Dump ******/
		/****** md5 signature: 9d43806df55510fcfed8ecb444c66924 ******/
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
		void Dump(const int ashift, const int alevel);

		/****** Units_ShiftedUnit::Move ******/
		/****** md5 signature: 9f380345565706ebf686ebe4bf987f49 ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "
Parameters
----------
amove: double

Return
-------
None

Description
-----------
Sets the field <themove> to <amove>.
") Move;
		void Move(const double amove);

		/****** Units_ShiftedUnit::Move ******/
		/****** md5 signature: 89eec54ed38b0da9b6cdacd07381a67c ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the shifted value <themove>.
") Move;
		double Move();

		/****** Units_ShiftedUnit::Token ******/
		/****** md5 signature: ad41d3534a6534725a58ec16e1348fbc ******/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Return
-------
opencascade::handle<Units_Token>

Description
-----------
This redefined method returns a ShiftedToken object.
") Token;
		opencascade::handle<Units_Token> Token();

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
		/****** md5 signature: 8d6f9112d176f937ae7d8611b509ac5e ******/
		%feature("compactdefaultargs") Units_UnitSentence;
		%feature("autodoc", "
Parameters
----------
astring: char *

Return
-------
None

Description
-----------
Creates and returns a UnitSentence. The string <astring> describes in natural language the unit or the composed unit to be analysed.
") Units_UnitSentence;
		 Units_UnitSentence(const char * const astring);

		/****** Units_UnitSentence::Units_UnitSentence ******/
		/****** md5 signature: b7ae8ce936c0655dcc49b999bd62f703 ******/
		%feature("compactdefaultargs") Units_UnitSentence;
		%feature("autodoc", "
Parameters
----------
astring: char *
aquantitiessequence: NCollection_HSequence<

Return
-------
None

Description
-----------
Creates and returns a UnitSentence. The string <astring> describes in natural language the unit to be analysed. The sequence of physical quantities <asequenceofquantities> describes the available dictionary of units you want to use.
") Units_UnitSentence;
		 Units_UnitSentence(const char * const astring, const opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Quantity>> > & aquantitiessequence);

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
		/****** md5 signature: a00fc5bd73da90051f0855c94d21b5ad ******/
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "
Parameters
----------
aquantitiessequence: NCollection_HSequence<

Return
-------
None

Description
-----------
For each token which represents a unit, finds in the sequence of physical quantities all the characteristics of the unit found.
") SetUnits;
		void SetUnits(const opencascade::handle<NCollection_HSequence<opencascade::handle<Units_Quantity>> > & aquantitiessequence);

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
		/****** md5 signature: 57ac2746240a0e661336bffd40f44cc7 ******/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "
Parameters
----------
amode: bool (optional, default to true)

Return
-------
None

Description
-----------
Reads the files <afilename1> and <afilename2> to create a sequence of tokens stored in <thesequenceoftokens>.
") Creates;
		void Creates(const bool amode = true);

		/****** Units_UnitsLexicon::Dump ******/
		/****** md5 signature: 1e8267eb1be0e9cb1f766e2160451c4e ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Useful for debugging.
") Dump;
		void Dump();

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
class Units_QuantitiesSequence : public NCollection_Sequence<opencascade::handle<Units_Quantity>>, public Standard_Transient {
  public:
    Units_QuantitiesSequence();
    Units_QuantitiesSequence(const NCollection_Sequence<opencascade::handle<Units_Quantity>>& theOther);
    const NCollection_Sequence<opencascade::handle<Units_Quantity>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<Units_Quantity>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<Units_Quantity>>& theSequence);
    NCollection_Sequence<opencascade::handle<Units_Quantity>>& ChangeSequence();
};
%make_alias(Units_QuantitiesSequence)


class Units_TokensSequence : public NCollection_Sequence<opencascade::handle<Units_Token>>, public Standard_Transient {
  public:
    Units_TokensSequence();
    Units_TokensSequence(const NCollection_Sequence<opencascade::handle<Units_Token>>& theOther);
    const NCollection_Sequence<opencascade::handle<Units_Token>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<Units_Token>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<Units_Token>>& theSequence);
    NCollection_Sequence<opencascade::handle<Units_Token>>& ChangeSequence();
};
%make_alias(Units_TokensSequence)


class Units_UnitsSequence : public NCollection_Sequence<opencascade::handle<Units_Unit>>, public Standard_Transient {
  public:
    Units_UnitsSequence();
    Units_UnitsSequence(const NCollection_Sequence<opencascade::handle<Units_Unit>>& theOther);
    const NCollection_Sequence<opencascade::handle<Units_Unit>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<Units_Unit>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<Units_Unit>>& theSequence);
    NCollection_Sequence<opencascade::handle<Units_Unit>>& ChangeSequence();
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
