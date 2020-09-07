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
%define UNITSDOCSTRING
"Units module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_units.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Units_Lexicon)
%wrap_handle(Units_Token)
%wrap_handle(Units_Unit)
%wrap_handle(Units_UnitsDictionary)
%wrap_handle(Units_UnitsSystem)
%wrap_handle(Units_ShiftedToken)
%wrap_handle(Units_ShiftedUnit)
%wrap_handle(Units_UnitsLexicon)
%wrap_handle(Units_TokensSequence)
%wrap_handle(Units_QuantitiesSequence)
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
		/****************** Convert ******************/
		/**** md5 signature: 1c016efdc46d58f5baa779f5e55e6c39 ****/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "Converts <avalue> expressed in <afirstunit> into the <asecondunit>.

Parameters
----------
avalue: float
afirstunit: char *
asecondunit: char *

Returns
-------
float
") Convert;
		static Standard_Real Convert(const Standard_Real avalue, const char * afirstunit, const char * asecondunit);

		/****************** DictionaryOfUnits ******************/
		/**** md5 signature: 165dd792c98e5e7085892c1b5db3c84f ****/
		%feature("compactdefaultargs") DictionaryOfUnits;
		%feature("autodoc", "Returns a unique instance of the dictionary of units. if <amode> is true, then it forces the recomputation of the dictionary of units.

Parameters
----------
amode: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<Units_UnitsDictionary>
") DictionaryOfUnits;
		static opencascade::handle<Units_UnitsDictionary> DictionaryOfUnits(const Standard_Boolean amode = Standard_False);

		/****************** Dimensions ******************/
		/**** md5 signature: c13659c025e8108be67e4b718d7b366b ****/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Return the dimension associated to the type.

Parameters
----------
aType: char *

Returns
-------
opencascade::handle<Units_Dimensions>
") Dimensions;
		static opencascade::handle<Units_Dimensions> Dimensions(const char * aType);

		/****************** FirstQuantity ******************/
		/**** md5 signature: 57a438b224674b30f1f3279853c80e80 ****/
		%feature("compactdefaultargs") FirstQuantity;
		%feature("autodoc", "Returns the first quantity string founded from the unit <aunit>.

Parameters
----------
aunit: char *

Returns
-------
char *
") FirstQuantity;
		static const char * FirstQuantity(const char * aunit);

		/****************** FromSI ******************/
		/**** md5 signature: b9aaa13580eb6b7bec1a75161b3f38bd ****/
		%feature("compactdefaultargs") FromSI;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: float
aUnit: char *

Returns
-------
float
") FromSI;
		static Standard_Real FromSI(const Standard_Real aData, const char * aUnit);

		/****************** FromSI ******************/
		/**** md5 signature: e4437e25fa11aff2c1d96274f621aa76 ****/
		%feature("compactdefaultargs") FromSI;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: float
aUnit: char *
aDim: Units_Dimensions

Returns
-------
float
") FromSI;
		static Standard_Real FromSI(const Standard_Real aData, const char * aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****************** LexiconFile ******************/
		/**** md5 signature: 0d1e1e276fdac596aad4c54270b5ed95 ****/
		%feature("compactdefaultargs") LexiconFile;
		%feature("autodoc", "Defines the location of the file containing the lexicon useful in manipulating composite units.

Parameters
----------
afile: char *

Returns
-------
None
") LexiconFile;
		static void LexiconFile(const char * afile);

		/****************** LexiconFormula ******************/
		/**** md5 signature: e4b42815e2c05ced10bdf4f597e81ac0 ****/
		%feature("compactdefaultargs") LexiconFormula;
		%feature("autodoc", "Return a unique instance of lexiconformula.

Returns
-------
opencascade::handle<Units_Lexicon>
") LexiconFormula;
		static opencascade::handle<Units_Lexicon> LexiconFormula();

		/****************** LexiconUnits ******************/
		/**** md5 signature: cc2eda1304ff3791256437396918df9d ****/
		%feature("compactdefaultargs") LexiconUnits;
		%feature("autodoc", "Returns a unique instance of the units_lexicon. if <amode> is true, it forces the recomputation of the dictionary of units, and by consequence the completion of the units_lexicon.

Parameters
----------
amode: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Units_Lexicon>
") LexiconUnits;
		static opencascade::handle<Units_Lexicon> LexiconUnits(const Standard_Boolean amode = Standard_True);

		/****************** NullDimensions ******************/
		/**** md5 signature: a2857d0ee7f46745e8b0c1814cb059d3 ****/
		%feature("compactdefaultargs") NullDimensions;
		%feature("autodoc", "Returns always the same instance of dimensions.

Returns
-------
opencascade::handle<Units_Dimensions>
") NullDimensions;
		static opencascade::handle<Units_Dimensions> NullDimensions();

		/****************** Quantity ******************/
		/**** md5 signature: cc26c72daf105879e1e70edf50d88e17 ****/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Returns a unique quantity instance corresponding to <aquantity>.

Parameters
----------
aquantity: char *

Returns
-------
opencascade::handle<Units_Quantity>
") Quantity;
		static opencascade::handle<Units_Quantity> Quantity(const char * aquantity);

		/****************** ToSI ******************/
		/**** md5 signature: 1f9885a9c585b0ad16edfcb704f20405 ****/
		%feature("compactdefaultargs") ToSI;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: float
aUnit: char *

Returns
-------
float
") ToSI;
		static Standard_Real ToSI(const Standard_Real aData, const char * aUnit);

		/****************** ToSI ******************/
		/**** md5 signature: 1e2b0b697b20e12afc0806a8a0fc5525 ****/
		%feature("compactdefaultargs") ToSI;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: float
aUnit: char *
aDim: Units_Dimensions

Returns
-------
float
") ToSI;
		static Standard_Real ToSI(const Standard_Real aData, const char * aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****************** UnitsFile ******************/
		/**** md5 signature: d1d63a6bfea6a56ddb42b1aeb2170a43 ****/
		%feature("compactdefaultargs") UnitsFile;
		%feature("autodoc", "Defines the location of the file containing all the information useful in creating the dictionary of all the units known to the system.

Parameters
----------
afile: char *

Returns
-------
None
") UnitsFile;
		static void UnitsFile(const char * afile);

};


%extend Units {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Units_Dimensions *
*************************/
/***********************
* class Units_Explorer *
***********************/
class Units_Explorer {
	public:
		/****************** Units_Explorer ******************/
		/**** md5 signature: 8a8d095abcb8ce4f0921dd302b301d66 ****/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "Empty contructor of the class.

Returns
-------
None
") Units_Explorer;
		 Units_Explorer();

		/****************** Units_Explorer ******************/
		/**** md5 signature: a2fc8cfc32fa4b570576f3cfd7c4c5cc ****/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "Creates a new instance of the class, initialized with the unitssystem <aunitssystem>.

Parameters
----------
aunitssystem: Units_UnitsSystem

Returns
-------
None
") Units_Explorer;
		 Units_Explorer(const opencascade::handle<Units_UnitsSystem> & aunitssystem);

		/****************** Units_Explorer ******************/
		/**** md5 signature: 2f8e197a0effa9080374aa93bcfab8d8 ****/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "Creates a new instance of the class, initialized with the unitsdictionary <aunitsdictionary>.

Parameters
----------
aunitsdictionary: Units_UnitsDictionary

Returns
-------
None
") Units_Explorer;
		 Units_Explorer(const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary);

		/****************** Units_Explorer ******************/
		/**** md5 signature: 4068c5e597e84a185faa3fc7eefecb99 ****/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "Creates a new instance of the class, initialized with the unitssystem <aunitssystem> and positioned at the quantity <aquantity>.

Parameters
----------
aunitssystem: Units_UnitsSystem
aquantity: char *

Returns
-------
None
") Units_Explorer;
		 Units_Explorer(const opencascade::handle<Units_UnitsSystem> & aunitssystem, const char * aquantity);

		/****************** Units_Explorer ******************/
		/**** md5 signature: 9df61dde1855014446854d9a0f47cb63 ****/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "Creates a new instance of the class, initialized with the unitsdictionary <aunitsdictionary> and positioned at the quantity <aquantity>.

Parameters
----------
aunitsdictionary: Units_UnitsDictionary
aquantity: char *

Returns
-------
None
") Units_Explorer;
		 Units_Explorer(const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary, const char * aquantity);

		/****************** Init ******************/
		/**** md5 signature: 5d2d604f22b989ac2f8178a5a395c902 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the instance of the class with the unitssystem <aunitssystem>.

Parameters
----------
aunitssystem: Units_UnitsSystem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Units_UnitsSystem> & aunitssystem);

		/****************** Init ******************/
		/**** md5 signature: 4fceb2bf5675dcacca6993149be091d6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the instance of the class with the unitsdictionary <aunitsdictionary>.

Parameters
----------
aunitsdictionary: Units_UnitsDictionary

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary);

		/****************** Init ******************/
		/**** md5 signature: 335f2d942e838e43cfa1fc9dfa42880e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the instance of the class with the unitssystem <aunitssystem> and positioned at the quantity <aquantity>.

Parameters
----------
aunitssystem: Units_UnitsSystem
aquantity: char *

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Units_UnitsSystem> & aunitssystem, const char * aquantity);

		/****************** Init ******************/
		/**** md5 signature: 3f1f0728105192c0b3260faf5a827ae6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the instance of the class with the unitsdictionary <aunitsdictionary> and positioned at the quantity <aquantity>.

Parameters
----------
aunitsdictionary: Units_UnitsDictionary
aquantity: char *

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary, const char * aquantity);

		/****************** IsActive ******************/
		/**** md5 signature: 476abafc82a8bb87ac904f5a77e179a3 ****/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "If the units system to explore is a user system, returns true if the current unit is active, false otherwise. //! if the units system to explore is the units dictionary, returns true if the current unit is the s.i. unit.

Returns
-------
bool
") IsActive;
		Standard_Boolean IsActive();

		/****************** MoreQuantity ******************/
		/**** md5 signature: 73ce92fd023d2945110ac6c2937dd451 ****/
		%feature("compactdefaultargs") MoreQuantity;
		%feature("autodoc", "Returns true if there is another quantity to explore, false otherwise.

Returns
-------
bool
") MoreQuantity;
		Standard_Boolean MoreQuantity();

		/****************** MoreUnit ******************/
		/**** md5 signature: 0e67eb0488033b4e76d4f420fc1d2d55 ****/
		%feature("compactdefaultargs") MoreUnit;
		%feature("autodoc", "Returns true if there is another unit to explore, false otherwise.

Returns
-------
bool
") MoreUnit;
		Standard_Boolean MoreUnit();

		/****************** NextQuantity ******************/
		/**** md5 signature: 6168313ed72e10d35a3c1a5bb899b752 ****/
		%feature("compactdefaultargs") NextQuantity;
		%feature("autodoc", "Sets the next quantity current.

Returns
-------
None
") NextQuantity;
		void NextQuantity();

		/****************** NextUnit ******************/
		/**** md5 signature: 625db75ec252f2c2ccb0f729d505b4fb ****/
		%feature("compactdefaultargs") NextUnit;
		%feature("autodoc", "Sets the next unit current.

Returns
-------
None
") NextUnit;
		void NextUnit();

		/****************** Quantity ******************/
		/**** md5 signature: ca15ea7df4b9d4a76b282d91cc16f7b6 ****/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Returns the name of the current quantity.

Returns
-------
TCollection_AsciiString
") Quantity;
		TCollection_AsciiString Quantity();

		/****************** Unit ******************/
		/**** md5 signature: 2b64b8e29a210ddf0a4ebeb8ee6edf2a ****/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "Returns the name of the current unit.

Returns
-------
TCollection_AsciiString
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
		/****************** Units_Lexicon ******************/
		/**** md5 signature: 0f1a71f6a310b1fb9bf2427ef9e46cf4 ****/
		%feature("compactdefaultargs") Units_Lexicon;
		%feature("autodoc", "Creates an empty instance of lexicon.

Returns
-------
None
") Units_Lexicon;
		 Units_Lexicon();

		/****************** AddToken ******************/
		/**** md5 signature: 1a8a6e614b1b4b2941f123ac5204b81c ****/
		%feature("compactdefaultargs") AddToken;
		%feature("autodoc", "Adds to the lexicon a new token with <aword>, <amean>, <avalue> as arguments. if there is already a token with the field <theword> equal to <aword>, the existing token is updated.

Parameters
----------
aword: char *
amean: char *
avalue: float

Returns
-------
None
") AddToken;
		void AddToken(const char * aword, const char * amean, const Standard_Real avalue);

		/****************** Creates ******************/
		/**** md5 signature: 336960f3bd894b74398bcb460f145038 ****/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Reads the file <afilename> to create a sequence of tokens stored in <thesequenceoftokens>.

Returns
-------
None
") Creates;
		void Creates();

		/****************** Dump ******************/
		/**** md5 signature: 73b0c773468e8cceaf80d621d09b8350 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Useful for debugging.

Returns
-------
None
") Dump;
		virtual void Dump();

		/****************** Sequence ******************/
		/**** md5 signature: 07981295dc97bedc768d3d1077d432cf ****/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Returns the first item of the sequence of tokens.

Returns
-------
opencascade::handle<Units_TokensSequence>
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
		/****************** Units_Measurement ******************/
		/**** md5 signature: d31e4eee11d8efed3d8a9665b5d7ce95 ****/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "It is the empty constructor of the class.

Returns
-------
None
") Units_Measurement;
		 Units_Measurement();

		/****************** Units_Measurement ******************/
		/**** md5 signature: 3e5abeff4182ab97b4afedb6d535fc52 ****/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "Returns an instance of this class. <avalue> defines the measurement, and <atoken> the token which defines the unit used.

Parameters
----------
avalue: float
atoken: Units_Token

Returns
-------
None
") Units_Measurement;
		 Units_Measurement(const Standard_Real avalue, const opencascade::handle<Units_Token> & atoken);

		/****************** Units_Measurement ******************/
		/**** md5 signature: 7bbfad161dda052e5c352381b5a0b796 ****/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "Returns an instance of this class. <avalue> defines the measurement, and <aunit> the unit used, described in natural language.

Parameters
----------
avalue: float
aunit: char *

Returns
-------
None
") Units_Measurement;
		 Units_Measurement(const Standard_Real avalue, const char * aunit);

		/****************** Add ******************/
		/**** md5 signature: 172bc55901ca00e6db419ccdf92bc025 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Returns (if it is possible) a measurement which is the addition of <self> and <ameasurement>. the chosen returned unit is the unit of <self>.

Parameters
----------
ameasurement: Units_Measurement

Returns
-------
Units_Measurement
") Add;
		Units_Measurement Add(const Units_Measurement & ameasurement);

		/****************** Convert ******************/
		/**** md5 signature: ffa44be524b687d8f614a293eddf56a4 ****/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "Converts (if possible) the measurement object into another unit. <aunit> must have the same dimensionality as the unit contained in the token <thetoken>.

Parameters
----------
aunit: char *

Returns
-------
None
") Convert;
		void Convert(const char * aunit);

		/****************** Divide ******************/
		/**** md5 signature: 5a69bb1fd49d61e815d14674626c2bc3 ****/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Returns a measurement which is the division of <self> by <ameasurement>.

Parameters
----------
ameasurement: Units_Measurement

Returns
-------
Units_Measurement
") Divide;
		Units_Measurement Divide(const Units_Measurement & ameasurement);

		/****************** Divide ******************/
		/**** md5 signature: d79fd04520bc32da038d50307ae4fc54 ****/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Returns a measurement which is the division of <self> by the constant <avalue>.

Parameters
----------
avalue: float

Returns
-------
Units_Measurement
") Divide;
		Units_Measurement Divide(const Standard_Real avalue);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Useful for debugging.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Fractional ******************/
		/**** md5 signature: 1b4620d56c93fd765f6e142b9d97a79c ****/
		%feature("compactdefaultargs") Fractional;
		%feature("autodoc", "Returns a measurement object with the fractional value of the measurement contained in <self>.

Returns
-------
Units_Measurement
") Fractional;
		Units_Measurement Fractional();

		/****************** HasToken ******************/
		/**** md5 signature: 3ec84cfcc11696e61acb84882888bb90 ****/
		%feature("compactdefaultargs") HasToken;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasToken;
		Standard_Boolean HasToken();

		/****************** Integer ******************/
		/**** md5 signature: 8fe9fb5455a25265b4a6463ac40bdf02 ****/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Returns a measurement object with the integer value of the measurement contained in <self>.

Returns
-------
Units_Measurement
") Integer;
		Units_Measurement Integer();

		/****************** Measurement ******************/
		/**** md5 signature: fa31c6a292bb3873ba7c426fe0ae6b01 ****/
		%feature("compactdefaultargs") Measurement;
		%feature("autodoc", "Returns the value of the measurement.

Returns
-------
float
") Measurement;
		Standard_Real Measurement();

		/****************** Multiply ******************/
		/**** md5 signature: 6433499acb8478055bcca32f38bf18eb ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Returns a measurement which is the multiplication of <self> and <ameasurement>.

Parameters
----------
ameasurement: Units_Measurement

Returns
-------
Units_Measurement
") Multiply;
		Units_Measurement Multiply(const Units_Measurement & ameasurement);

		/****************** Multiply ******************/
		/**** md5 signature: ac88a4da10bca48323c62a7c2e7c5b7f ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Returns a measurement which is the multiplication of <self> with the value <avalue>.

Parameters
----------
avalue: float

Returns
-------
Units_Measurement
") Multiply;
		Units_Measurement Multiply(const Standard_Real avalue);

		/****************** Power ******************/
		/**** md5 signature: 4c9722efc96e1a7bfb5d2660cdd33cc9 ****/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "Returns a measurement which is <self> powered <anexponent>.

Parameters
----------
anexponent: float

Returns
-------
Units_Measurement
") Power;
		Units_Measurement Power(const Standard_Real anexponent);

		/****************** Subtract ******************/
		/**** md5 signature: 030285b9f503cd97118e246fc18ebaf9 ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Returns (if it is possible) a measurement which is the subtraction of <self> and <ameasurement>. the chosen returned unit is the unit of <self>.

Parameters
----------
ameasurement: Units_Measurement

Returns
-------
Units_Measurement
") Subtract;
		Units_Measurement Subtract(const Units_Measurement & ameasurement);

		/****************** Token ******************/
		/**** md5 signature: 9620d8f2a9e2df08357e954964938e86 ****/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Returns the token contained in <self>.

Returns
-------
opencascade::handle<Units_Token>
") Token;
		opencascade::handle<Units_Token> Token();

		/****************** operator * ******************/
		/**** md5 signature: a67ae8ab340dc1746582c407739e186d ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
ameasurement: Units_Measurement

Returns
-------
Units_Measurement
") operator *;
		Units_Measurement operator *(const Units_Measurement & ameasurement);

		/****************** operator * ******************/
		/**** md5 signature: fcddee8cd642cff9dc22f8041a42ca0a ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
avalue: float

Returns
-------
Units_Measurement
") operator *;
		Units_Measurement operator *(const Standard_Real avalue);

		/****************** operator + ******************/
		/**** md5 signature: b3ac3f14ad030c851a4a31fe6518f64f ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
ameasurement: Units_Measurement

Returns
-------
Units_Measurement
") operator +;
		Units_Measurement operator +(const Units_Measurement & ameasurement);

		/****************** operator - ******************/
		/**** md5 signature: 92a701328f91174ed60566ea094c0b38 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
ameasurement: Units_Measurement

Returns
-------
Units_Measurement
") operator -;
		Units_Measurement operator -(const Units_Measurement & ameasurement);

		/****************** operator / ******************/
		/**** md5 signature: c20069536cf255816086c127d179c8fb ****/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
ameasurement: Units_Measurement

Returns
-------
Units_Measurement
") operator /;
		Units_Measurement operator /(const Units_Measurement & ameasurement);

		/****************** operator / ******************/
		/**** md5 signature: 9c00d7664a25f2eb36b767fcd9ab1a63 ****/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
avalue: float

Returns
-------
Units_Measurement
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
/***********************
* class Units_Sentence *
***********************/
class Units_Sentence {
	public:
		/****************** Units_Sentence ******************/
		/**** md5 signature: a3b4863791f70a82b02c3f5f032a94b5 ****/
		%feature("compactdefaultargs") Units_Sentence;
		%feature("autodoc", "Creates and returns a sentence, by analyzing the string <astring> with the lexicon <alexicon>.

Parameters
----------
alexicon: Units_Lexicon
astring: char *

Returns
-------
None
") Units_Sentence;
		 Units_Sentence(const opencascade::handle<Units_Lexicon> & alexicon, const char * astring);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Useful for debugging.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Evaluate ******************/
		/**** md5 signature: d1bc3e99afe9ecb89c5515d9b3d091bf ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Computes and returns in a token the result of the expression.

Returns
-------
opencascade::handle<Units_Token>
") Evaluate;
		opencascade::handle<Units_Token> Evaluate();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return true if number of created tokens > 0 (i.e creation of sentence is succesfull).

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Sequence ******************/
		/**** md5 signature: 07981295dc97bedc768d3d1077d432cf ****/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Returns <thesequenceoftokens>.

Returns
-------
opencascade::handle<Units_TokensSequence>
") Sequence;
		opencascade::handle<Units_TokensSequence> Sequence();

		/****************** Sequence ******************/
		/**** md5 signature: 3f1e9c4b7f3063e9db16a4170e858f4e ****/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Sets the field <thesequenceoftokens> to <asequenceoftokens>.

Parameters
----------
asequenceoftokens: Units_TokensSequence

Returns
-------
None
") Sequence;
		void Sequence(const opencascade::handle<Units_TokensSequence> & asequenceoftokens);

		/****************** SetConstants ******************/
		/**** md5 signature: 09057b17d30a3997a1d663ff1e7333d5 ****/
		%feature("compactdefaultargs") SetConstants;
		%feature("autodoc", "For each constant encountered, sets the value.

Returns
-------
None
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
		/****************** Units_Token ******************/
		/**** md5 signature: 5c9e0131c4ee2d2e0f3dad64072ae5b0 ****/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "Creates and returns a empty token.

Returns
-------
None
") Units_Token;
		 Units_Token();

		/****************** Units_Token ******************/
		/**** md5 signature: 936af0aa967aa2b4603deadcf4e4640c ****/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "Creates and returns a token. <aword> is a string containing the available word.

Parameters
----------
aword: char *

Returns
-------
None
") Units_Token;
		 Units_Token(const char * aword);

		/****************** Units_Token ******************/
		/**** md5 signature: 043758efc301a2c45ea92d46d8230962 ****/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "Creates and returns a token. <atoken> is copied in the returned token.

Parameters
----------
atoken: Units_Token

Returns
-------
None
") Units_Token;
		 Units_Token(const opencascade::handle<Units_Token> & atoken);

		/****************** Units_Token ******************/
		/**** md5 signature: 35fda34f14ecf981a6b52f6a8c585997 ****/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "Creates and returns a token. <aword> is a string containing the available word and <amean> gives the signification of the token.

Parameters
----------
aword: char *
amean: char *

Returns
-------
None
") Units_Token;
		 Units_Token(const char * aword, const char * amean);

		/****************** Units_Token ******************/
		/**** md5 signature: 359d8ddb1e52ec2e76c978a2501dbcd1 ****/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "Creates and returns a token. <aword> is a string containing the available word, <amean> gives the signification of the token and <avalue> is the numeric value of the dimension.

Parameters
----------
aword: char *
amean: char *
avalue: float

Returns
-------
None
") Units_Token;
		 Units_Token(const char * aword, const char * amean, const Standard_Real avalue);

		/****************** Units_Token ******************/
		/**** md5 signature: b4c73c34d1f9cc5658ad15f226b0bd2d ****/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "Creates and returns a token. <aword> is a string containing the available word, <amean> gives the signification of the token, <avalue> is the numeric value of the dimension, and <adimensions> is the dimension of the given word <aword>.

Parameters
----------
aword: char *
amean: char *
avalue: float
adimension: Units_Dimensions

Returns
-------
None
") Units_Token;
		 Units_Token(const char * aword, const char * amean, const Standard_Real avalue, const opencascade::handle<Units_Dimensions> & adimension);

		/****************** Add ******************/
		/**** md5 signature: de749d1f5d36c7125c8cd10bf3bf8ef9 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
aninteger: int

Returns
-------
opencascade::handle<Units_Token>
") Add;
		opencascade::handle<Units_Token> Add(const Standard_Integer aninteger);

		/****************** Add ******************/
		/**** md5 signature: 6b2457ea824d8040cb8cac709490d8d2 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Returns a token which is the addition of <self> and another token <atoken>. the addition is possible if and only if the dimensions are the same.

Parameters
----------
atoken: Units_Token

Returns
-------
opencascade::handle<Units_Token>
") Add;
		opencascade::handle<Units_Token> Add(const opencascade::handle<Units_Token> & atoken);

		/****************** Creates ******************/
		/**** md5 signature: 760430f09dfbe61d0ca03dde97033b72 ****/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Creates and returns a token, which is a shiftedtoken.

Returns
-------
opencascade::handle<Units_Token>
") Creates;
		virtual opencascade::handle<Units_Token> Creates();

		/****************** Dimensions ******************/
		/**** md5 signature: f6d82f417c034a7603f1ff62dccce1d1 ****/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Returns the dimensions of the token <thedimensions>.

Returns
-------
opencascade::handle<Units_Dimensions>
") Dimensions;
		opencascade::handle<Units_Dimensions> Dimensions();

		/****************** Dimensions ******************/
		/**** md5 signature: 0dc4820d7c19ca14a8c90ec250fe791e ****/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Sets the field <thedimensions> to <adimensions>.

Parameters
----------
adimensions: Units_Dimensions

Returns
-------
None
") Dimensions;
		void Dimensions(const opencascade::handle<Units_Dimensions> & adimensions);

		/****************** Divide ******************/
		/**** md5 signature: 11516872c4429151480bdd03f6bff4f8 ****/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Returns a token which is the division of <self> by another token <atoken>.

Parameters
----------
atoken: Units_Token

Returns
-------
opencascade::handle<Units_Token>
") Divide;
		opencascade::handle<Units_Token> Divide(const opencascade::handle<Units_Token> & atoken);

		/****************** Divided ******************/
		/**** md5 signature: 779e03303200921a08216372158385d6 ****/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "This virtual method is called by the measurement methods, to compute the measurement during a conversion.

Parameters
----------
avalue: float

Returns
-------
float
") Divided;
		virtual Standard_Real Divided(const Standard_Real avalue);

		/****************** Dump ******************/
		/**** md5 signature: 11a72ea0354ab05ddfe8b781916d167a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Useful for debugging.

Parameters
----------
ashift: int
alevel: int

Returns
-------
None
") Dump;
		virtual void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****************** IsEqual ******************/
		/**** md5 signature: 4e07c23bce6b8d25cdaaf5ee04a419fb ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the field <theword> and the string <astring> are the same, false otherwise.

Parameters
----------
astring: char *

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const char * astring);

		/****************** IsEqual ******************/
		/**** md5 signature: 34e3e8dcc8e89d690b9df0f8e1bf7953 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the field <theword> and the string <theword> contained in the token <atoken> are the same, false otherwise.

Parameters
----------
atoken: Units_Token

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const opencascade::handle<Units_Token> & atoken);

		/****************** IsGreater ******************/
		/**** md5 signature: 7e9fde33c953167e6a7c483114fecf76 ****/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "Returns false if the field <theword> is strictly contained at the beginning of the string <astring>, true otherwise.

Parameters
----------
astring: char *

Returns
-------
bool
") IsGreater;
		Standard_Boolean IsGreater(const char * astring);

		/****************** IsGreater ******************/
		/**** md5 signature: a9772ca3092d476da2a358df580ff45c ****/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "Returns false if the field <theword> is strictly contained at the beginning of the string <astring>, true otherwise.

Parameters
----------
atoken: Units_Token

Returns
-------
bool
") IsGreater;
		Standard_Boolean IsGreater(const opencascade::handle<Units_Token> & atoken);

		/****************** IsGreaterOrEqual ******************/
		/**** md5 signature: 4ed039460da3250495314843163475e8 ****/
		%feature("compactdefaultargs") IsGreaterOrEqual;
		%feature("autodoc", "Returns true if the string <astring> is strictly contained at the beginning of the field <theword> false otherwise.

Parameters
----------
atoken: Units_Token

Returns
-------
bool
") IsGreaterOrEqual;
		Standard_Boolean IsGreaterOrEqual(const opencascade::handle<Units_Token> & atoken);

		/****************** IsLessOrEqual ******************/
		/**** md5 signature: 82f7f9339e3f8eed44e9985f4cfcd505 ****/
		%feature("compactdefaultargs") IsLessOrEqual;
		%feature("autodoc", "Returns true if the field <theword> is strictly contained at the beginning of the string <astring>, false otherwise.

Parameters
----------
astring: char *

Returns
-------
bool
") IsLessOrEqual;
		Standard_Boolean IsLessOrEqual(const char * astring);

		/****************** IsNotEqual ******************/
		/**** md5 signature: 36769476e47ab50f5409c20d3d8a3166 ****/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "Returns false if the field <theword> and the string <astring> are the same, true otherwise.

Parameters
----------
astring: char *

Returns
-------
bool
") IsNotEqual;
		Standard_Boolean IsNotEqual(const char * astring);

		/****************** IsNotEqual ******************/
		/**** md5 signature: e8645ce2ac4cb3ac92c3ea01bf0c8a9e ****/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "Returns false if the field <theword> and the string <theword> contained in the token <atoken> are the same, true otherwise.

Parameters
----------
atoken: Units_Token

Returns
-------
bool
") IsNotEqual;
		Standard_Boolean IsNotEqual(const opencascade::handle<Units_Token> & atoken);

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the word.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Mean ******************/
		/**** md5 signature: a851fd604fa8b324d39b661d2c2c1a71 ****/
		%feature("compactdefaultargs") Mean;
		%feature("autodoc", "Returns the significance of the word <theword>, which is in the field <themean>.

Returns
-------
TCollection_AsciiString
") Mean;
		TCollection_AsciiString Mean();

		/****************** Mean ******************/
		/**** md5 signature: 30779b0f96303270c03e0a3bfc6a5535 ****/
		%feature("compactdefaultargs") Mean;
		%feature("autodoc", "Sets the field <themean> to <amean>.

Parameters
----------
amean: char *

Returns
-------
None
") Mean;
		void Mean(const char * amean);

		/****************** Multiplied ******************/
		/**** md5 signature: 148d5140f6c68eb1df6adb62bba5b85d ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "This virtual method is called by the measurement methods, to compute the measurement during a conversion.

Parameters
----------
avalue: float

Returns
-------
float
") Multiplied;
		virtual Standard_Real Multiplied(const Standard_Real avalue);

		/****************** Multiply ******************/
		/**** md5 signature: 40be7fb37d2caace6bbf6bdad7be84a0 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Returns a token which is the product of <self> and another token <atoken>.

Parameters
----------
atoken: Units_Token

Returns
-------
opencascade::handle<Units_Token>
") Multiply;
		opencascade::handle<Units_Token> Multiply(const opencascade::handle<Units_Token> & atoken);

		/****************** Power ******************/
		/**** md5 signature: f6ed6f696422170673e1838df9015a58 ****/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "Returns a token which is <self> to the power of another token <atoken>. the computation is possible only if <atoken> is a dimensionless constant.

Parameters
----------
atoken: Units_Token

Returns
-------
opencascade::handle<Units_Token>
") Power;
		opencascade::handle<Units_Token> Power(const opencascade::handle<Units_Token> & atoken);

		/****************** Power ******************/
		/**** md5 signature: a7b844569c1187f26e58ee2f46dbea49 ****/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "Returns a token which is <self> to the power of <anexponent>.

Parameters
----------
anexponent: float

Returns
-------
opencascade::handle<Units_Token>
") Power;
		opencascade::handle<Units_Token> Power(const Standard_Real anexponent);

		/****************** Subtract ******************/
		/**** md5 signature: 7996d8e309aa1d78fe48107d754ab1cb ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Returns a token which is the subtraction of <self> and another token <atoken>. the subtraction is possible if and only if the dimensions are the same.

Parameters
----------
atoken: Units_Token

Returns
-------
opencascade::handle<Units_Token>
") Subtract;
		opencascade::handle<Units_Token> Subtract(const opencascade::handle<Units_Token> & atoken);

		/****************** Update ******************/
		/**** md5 signature: 7db3a2f3f383a56d65d7cf5e0328bc25 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Updates the token <self> with the additional signification <amean> by concatenation of the two strings <themean> and <amean>. if the two significations are the same , an information message is written in the output device.

Parameters
----------
amean: char *

Returns
-------
None
") Update;
		void Update(const char * amean);

		/****************** Value ******************/
		/**** md5 signature: 52655a2fb6642856b2c68a9331826787 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value stored in the field <thevalue>.

Returns
-------
float
") Value;
		Standard_Real Value();

		/****************** Value ******************/
		/**** md5 signature: 653c49766524df07f29af6c721fab507 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Sets the field <thevalue> to <avalue>.

Parameters
----------
avalue: float

Returns
-------
None
") Value;
		void Value(const Standard_Real avalue);

		/****************** Word ******************/
		/**** md5 signature: 0c0c482fc87882aed5f744e29648096d ****/
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "Returns the string <theword>.

Returns
-------
TCollection_AsciiString
") Word;
		TCollection_AsciiString Word();

		/****************** Word ******************/
		/**** md5 signature: c1acd16f5c770084ce729ac836df1e77 ****/
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "Sets the field <theword> to <aword>.

Parameters
----------
aword: char *

Returns
-------
None
") Word;
		void Word(const char * aword);

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
		/****************** Units_Unit ******************/
		/**** md5 signature: e2d1a64dc5c715311137ec7429175053 ****/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit, and <avalue> is the value in relation to the international system of units.

Parameters
----------
aname: char *
asymbol: char *
avalue: float
aquantity: Units_Quantity

Returns
-------
None
") Units_Unit;
		 Units_Unit(const char * aname, const char * asymbol, const Standard_Real avalue, const opencascade::handle<Units_Quantity> & aquantity);

		/****************** Units_Unit ******************/
		/**** md5 signature: d265038d101c891e6b30775b5e2f8260 ****/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit.

Parameters
----------
aname: char *
asymbol: char *

Returns
-------
None
") Units_Unit;
		 Units_Unit(const char * aname, const char * asymbol);

		/****************** Units_Unit ******************/
		/**** md5 signature: 9a4cbb739b777a0c14088f4803208b58 ****/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "Creates and returns a unit. <aname> is the name of the unit.

Parameters
----------
aname: char *

Returns
-------
None
") Units_Unit;
		 Units_Unit(const char * aname);

		/****************** Dump ******************/
		/**** md5 signature: 11a72ea0354ab05ddfe8b781916d167a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Useful for debugging.

Parameters
----------
ashift: int
alevel: int

Returns
-------
None
") Dump;
		virtual void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****************** IsEqual ******************/
		/**** md5 signature: 4e07c23bce6b8d25cdaaf5ee04a419fb ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Compares all the symbols linked within <self> with the name of <atoken>, and returns true if there is one symbol equal to the name, false otherwise.

Parameters
----------
astring: char *

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const char * astring);

		/****************** Name ******************/
		/**** md5 signature: 4ede994349b8ea032efece942c57861d ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of the unit <thename>.

Returns
-------
TCollection_AsciiString
") Name;
		TCollection_AsciiString Name();

		/****************** Quantity ******************/
		/**** md5 signature: 036bc6e13cafa125e70adbda49142954 ****/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Returns <thequantity> contained in <self>.

Returns
-------
opencascade::handle<Units_Quantity>
") Quantity;
		opencascade::handle<Units_Quantity> Quantity();

		/****************** Quantity ******************/
		/**** md5 signature: d07cd92b482216cb1b14ddb2d7e5ef01 ****/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Sets the physical quantity <aquantity> to <self>.

Parameters
----------
aquantity: Units_Quantity

Returns
-------
None
") Quantity;
		void Quantity(const opencascade::handle<Units_Quantity> & aquantity);

		/****************** Symbol ******************/
		/**** md5 signature: 1233c55fe8ff0c96d996918dd47fe96c ****/
		%feature("compactdefaultargs") Symbol;
		%feature("autodoc", "Adds a new symbol <asymbol> attached to <self>.

Parameters
----------
asymbol: char *

Returns
-------
None
") Symbol;
		void Symbol(const char * asymbol);

		/****************** SymbolsSequence ******************/
		/**** md5 signature: e247f0ae557660cc13b3dac1c873f3cb ****/
		%feature("compactdefaultargs") SymbolsSequence;
		%feature("autodoc", "Returns the sequence of symbols <thesymbolssequence>.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") SymbolsSequence;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SymbolsSequence();

		/****************** Token ******************/
		/**** md5 signature: b1ebc3cec140dca2e0c8fb99dfd7d0f8 ****/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Starting with <self>, returns a new token object.

Returns
-------
opencascade::handle<Units_Token>
") Token;
		virtual opencascade::handle<Units_Token> Token();

		/****************** Value ******************/
		/**** md5 signature: 52655a2fb6642856b2c68a9331826787 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value in relation with the international system of units.

Returns
-------
float
") Value;
		Standard_Real Value();

		/****************** Value ******************/
		/**** md5 signature: 653c49766524df07f29af6c721fab507 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Sets the value <avalue> to <self>.

Parameters
----------
avalue: float

Returns
-------
None
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
		/****************** Units_UnitsDictionary ******************/
		/**** md5 signature: 090b3e8504113868303a771ed3f3f081 ****/
		%feature("compactdefaultargs") Units_UnitsDictionary;
		%feature("autodoc", "Returns an empty instance of unitsdictionary.

Returns
-------
None
") Units_UnitsDictionary;
		 Units_UnitsDictionary();

		/****************** ActiveUnit ******************/
		/**** md5 signature: 3fb76e7a1376b27e79e71cfa00c462d0 ****/
		%feature("compactdefaultargs") ActiveUnit;
		%feature("autodoc", "Returns for <aquantity> the active unit.

Parameters
----------
aquantity: char *

Returns
-------
TCollection_AsciiString
") ActiveUnit;
		TCollection_AsciiString ActiveUnit(const char * aquantity);

		/****************** Creates ******************/
		/**** md5 signature: 336960f3bd894b74398bcb460f145038 ****/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Returns a unitsdictionary object which contains the sequence of all the units you want to consider, physical quantity by physical quantity.

Returns
-------
None
") Creates;
		void Creates();

		/****************** Dump ******************/
		/**** md5 signature: 111bf2f128127907ad938aca2e7ab282 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dumps only the sequence of quantities without the units if <alevel> is equal to zero, and for each quantity all the units stored if <alevel> is equal to one.

Parameters
----------
alevel: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer alevel);

		/****************** Dump ******************/
		/**** md5 signature: 9b9ad601cef097734a6478b3c9818bd6 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dumps for a designated physical dimensions <adimensions> all the previously stored units.

Parameters
----------
adimensions: Units_Dimensions

Returns
-------
None
") Dump;
		void Dump(const opencascade::handle<Units_Dimensions> & adimensions);

		/****************** Sequence ******************/
		/**** md5 signature: e372ed19f436f2e278686b379f0b674c ****/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Returns the head of the sequence of physical quantities.

Returns
-------
opencascade::handle<Units_QuantitiesSequence>
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
		/****************** Units_UnitsSystem ******************/
		/**** md5 signature: 01429700ada8b0002a41cd20921fa9ea ****/
		%feature("compactdefaultargs") Units_UnitsSystem;
		%feature("autodoc", "Returns an instance of unitssystem initialized to the s.i. units system.

Returns
-------
None
") Units_UnitsSystem;
		 Units_UnitsSystem();

		/****************** Units_UnitsSystem ******************/
		/**** md5 signature: 87e13c76c018885ca60c1b0c9be77315 ****/
		%feature("compactdefaultargs") Units_UnitsSystem;
		%feature("autodoc", "Returns an instance of unitssystem initialized to the s.i. units system upgraded by the base system units decription file. attempts to find the four following files: $csf_`aname`defaults/.aname $csf_`aname`sitedefaults/.aname $csf_`aname`groupdefaults/.aname $csf_`aname`userdefaults/.aname see : resource_manager for the description of this file.

Parameters
----------
aName: char *
Verbose: bool,optional
	default value is Standard_False

Returns
-------
None
") Units_UnitsSystem;
		 Units_UnitsSystem(const char * aName, const Standard_Boolean Verbose = Standard_False);

		/****************** Activate ******************/
		/**** md5 signature: 7fa3572dcf0fdb978c6907bac59daf7f ****/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "Specifies for <aquantity> the unit <aunit> used.

Parameters
----------
aquantity: char *
aunit: char *

Returns
-------
None
") Activate;
		void Activate(const char * aquantity, const char * aunit);

		/****************** Activates ******************/
		/**** md5 signature: 4b6ab8581fdb5c0061b065b5a31097f9 ****/
		%feature("compactdefaultargs") Activates;
		%feature("autodoc", "Activates the first unit of all defined system quantities.

Returns
-------
None
") Activates;
		void Activates();

		/****************** ActiveUnit ******************/
		/**** md5 signature: 3fb76e7a1376b27e79e71cfa00c462d0 ****/
		%feature("compactdefaultargs") ActiveUnit;
		%feature("autodoc", "Returns for <aquantity> the active unit.

Parameters
----------
aquantity: char *

Returns
-------
TCollection_AsciiString
") ActiveUnit;
		TCollection_AsciiString ActiveUnit(const char * aquantity);

		/****************** ActiveUnitsSequence ******************/
		/**** md5 signature: 6afbb572a41bd436215c98c3285a0dfc ****/
		%feature("compactdefaultargs") ActiveUnitsSequence;
		%feature("autodoc", "Returns a sequence of integer in correspondance with the sequence of quantities, which indicates, for each redefined quantity, the index into the sequence of units, of the active unit.

Returns
-------
opencascade::handle<TColStd_HSequenceOfInteger>
") ActiveUnitsSequence;
		opencascade::handle<TColStd_HSequenceOfInteger> ActiveUnitsSequence();

		/****************** ConvertSIValueToUserSystem ******************/
		/**** md5 signature: 47ffbd8293fb408e6c11da16def1ef37 ****/
		%feature("compactdefaultargs") ConvertSIValueToUserSystem;
		%feature("autodoc", "Converts the real value <avalue> from the s.i. system of units to the user system of units. <aquantity> is the physical dimensions of the measurement.

Parameters
----------
aquantity: char *
avalue: float

Returns
-------
float
") ConvertSIValueToUserSystem;
		Standard_Real ConvertSIValueToUserSystem(const char * aquantity, const Standard_Real avalue);

		/****************** ConvertUserSystemValueToSI ******************/
		/**** md5 signature: 0183bddd3e718408a18afdd3dd78348a ****/
		%feature("compactdefaultargs") ConvertUserSystemValueToSI;
		%feature("autodoc", "Converts the real value <avalue> from the user system of units to the s.i. system of units. <aquantity> is the physical dimensions of the measurement.

Parameters
----------
aquantity: char *
avalue: float

Returns
-------
float
") ConvertUserSystemValueToSI;
		Standard_Real ConvertUserSystemValueToSI(const char * aquantity, const Standard_Real avalue);

		/****************** ConvertValueToUserSystem ******************/
		/**** md5 signature: 601d7f865a6550eb8aff7e18b582a224 ****/
		%feature("compactdefaultargs") ConvertValueToUserSystem;
		%feature("autodoc", "Converts a real value <avalue> from the unit <aunit> belonging to the physical dimensions <aquantity> to the corresponding unit of the user system.

Parameters
----------
aquantity: char *
avalue: float
aunit: char *

Returns
-------
float
") ConvertValueToUserSystem;
		Standard_Real ConvertValueToUserSystem(const char * aquantity, const Standard_Real avalue, const char * aunit);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if no units has been defined in the system.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** QuantitiesSequence ******************/
		/**** md5 signature: 6eab1984988d001095d55f888c102598 ****/
		%feature("compactdefaultargs") QuantitiesSequence;
		%feature("autodoc", "Returns the sequence of refined quantities.

Returns
-------
opencascade::handle<Units_QuantitiesSequence>
") QuantitiesSequence;
		opencascade::handle<Units_QuantitiesSequence> QuantitiesSequence();

		/****************** Remove ******************/
		/**** md5 signature: 34aa69d23ad7daea18c24addc5a312e9 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes for <aquantity> the unit <aunit> used.

Parameters
----------
aquantity: char *
aunit: char *

Returns
-------
None
") Remove;
		void Remove(const char * aquantity, const char * aunit);

		/****************** Specify ******************/
		/**** md5 signature: aac6809cfcbfc1f8b1ba4a82bb3e4182 ****/
		%feature("compactdefaultargs") Specify;
		%feature("autodoc", "Specifies for <aquantity> the unit <aunit> used.

Parameters
----------
aquantity: char *
aunit: char *

Returns
-------
None
") Specify;
		void Specify(const char * aquantity, const char * aunit);

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
		/****************** Units_MathSentence ******************/
		/**** md5 signature: b28d02fa95742151d4183536178bfa4e ****/
		%feature("compactdefaultargs") Units_MathSentence;
		%feature("autodoc", "Creates and returns a mathsentence object. the string <astring> describes an algebraic formula in natural language.

Parameters
----------
astring: char *

Returns
-------
None
") Units_MathSentence;
		 Units_MathSentence(const char * astring);

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
		/****************** Units_ShiftedToken ******************/
		/**** md5 signature: d7a1d6300111d9009b1c7bb75c90540c ****/
		%feature("compactdefaultargs") Units_ShiftedToken;
		%feature("autodoc", "Creates and returns a shifted token. <aword> is a string containing the available word, <amean> gives the signification of the token, <avalue> is the numeric value of the dimension, <amove> is the gap, and <adimensions> is the dimension of the given word <aword>.

Parameters
----------
aword: char *
amean: char *
avalue: float
amove: float
adimensions: Units_Dimensions

Returns
-------
None
") Units_ShiftedToken;
		 Units_ShiftedToken(const char * aword, const char * amean, const Standard_Real avalue, const Standard_Real amove, const opencascade::handle<Units_Dimensions> & adimensions);

		/****************** Creates ******************/
		/**** md5 signature: d0675db69fb4f5482f0096baa17d254b ****/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Creates and returns a token, which is a shiftedtoken.

Returns
-------
opencascade::handle<Units_Token>
") Creates;
		virtual opencascade::handle<Units_Token> Creates();

		/****************** Divided ******************/
		/**** md5 signature: 70a30d4e82fdfa136029b4b7d198a201 ****/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "This virtual method is called by the measurement methods, to compute the measurement during a conversion.

Parameters
----------
avalue: float

Returns
-------
float
") Divided;
		virtual Standard_Real Divided(const Standard_Real avalue);

		/****************** Dump ******************/
		/**** md5 signature: 7ba3a97b6ef5901f04268a088bfd756b ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
ashift: int
alevel: int

Returns
-------
None
") Dump;
		virtual void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****************** Move ******************/
		/**** md5 signature: 0badba24964bceada17ae3d7e9e3f59a ****/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Returns the gap <themove>.

Returns
-------
float
") Move;
		Standard_Real Move();

		/****************** Multiplied ******************/
		/**** md5 signature: 232b503aa880dce7590d3656f503d863 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "This virtual method is called by the measurement methods, to compute the measurement during a conversion.

Parameters
----------
avalue: float

Returns
-------
float
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
		/****************** Units_ShiftedUnit ******************/
		/**** md5 signature: 723c5258f6e5560ce254ce2750aab52e ****/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "Creates and returns a shifted unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit, <avalue> is the value in relation to the international system of units, and <amove> is the gap in relation to another unit. //! for example celcius dregee of temperature is an instance of shiftedunit with <avalue> equal to 1. and <amove> equal to 273.15.

Parameters
----------
aname: char *
asymbol: char *
avalue: float
amove: float
aquantity: Units_Quantity

Returns
-------
None
") Units_ShiftedUnit;
		 Units_ShiftedUnit(const char * aname, const char * asymbol, const Standard_Real avalue, const Standard_Real amove, const opencascade::handle<Units_Quantity> & aquantity);

		/****************** Units_ShiftedUnit ******************/
		/**** md5 signature: dde8d329bda54e7b68a53aad706deaa7 ****/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit.

Parameters
----------
aname: char *
asymbol: char *

Returns
-------
None
") Units_ShiftedUnit;
		 Units_ShiftedUnit(const char * aname, const char * asymbol);

		/****************** Units_ShiftedUnit ******************/
		/**** md5 signature: 39584d4db24403e14b8abc85b5da37db ****/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "Creates and returns a unit. <aname> is the name of the unit.

Parameters
----------
aname: char *

Returns
-------
None
") Units_ShiftedUnit;
		 Units_ShiftedUnit(const char * aname);

		/****************** Dump ******************/
		/**** md5 signature: 7ba3a97b6ef5901f04268a088bfd756b ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
ashift: int
alevel: int

Returns
-------
None
") Dump;
		virtual void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****************** Move ******************/
		/**** md5 signature: b1ae0e01da8730c4bde335653a27be14 ****/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Sets the field <themove> to <amove>.

Parameters
----------
amove: float

Returns
-------
None
") Move;
		void Move(const Standard_Real amove);

		/****************** Move ******************/
		/**** md5 signature: 0badba24964bceada17ae3d7e9e3f59a ****/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Returns the shifted value <themove>.

Returns
-------
float
") Move;
		Standard_Real Move();

		/****************** Token ******************/
		/**** md5 signature: ced42835337afba3c4436eb1531f10e8 ****/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "This redefined method returns a shiftedtoken object.

Returns
-------
opencascade::handle<Units_Token>
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
		/****************** Units_UnitSentence ******************/
		/**** md5 signature: 79fddd0148d07d98b1f68107a190d9ba ****/
		%feature("compactdefaultargs") Units_UnitSentence;
		%feature("autodoc", "Creates and returns a unitsentence. the string <astring> describes in natural language the unit or the composed unit to be analysed.

Parameters
----------
astring: char *

Returns
-------
None
") Units_UnitSentence;
		 Units_UnitSentence(const char * astring);

		/****************** Units_UnitSentence ******************/
		/**** md5 signature: 5b625b19d02339a0ef47688689e3be65 ****/
		%feature("compactdefaultargs") Units_UnitSentence;
		%feature("autodoc", "Creates and returns a unitsentence. the string <astring> describes in natural language the unit to be analysed. the sequence of physical quantities <asequenceofquantities> describes the available dictionary of units you want to use.

Parameters
----------
astring: char *
aquantitiessequence: Units_QuantitiesSequence

Returns
-------
None
") Units_UnitSentence;
		 Units_UnitSentence(const char * astring, const opencascade::handle<Units_QuantitiesSequence> & aquantitiessequence);

		/****************** Analyse ******************/
		/**** md5 signature: 7a03a82444f6b3d45e5bfd115d1feda6 ****/
		%feature("compactdefaultargs") Analyse;
		%feature("autodoc", "Analyzes the sequence of tokens created by the constructor to find the true significance of each token.

Returns
-------
None
") Analyse;
		void Analyse();

		/****************** SetUnits ******************/
		/**** md5 signature: 2e8f5698a9d586cd57b0bb4c5deeb2ab ****/
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "For each token which represents a unit, finds in the sequence of physical quantities all the characteristics of the unit found.

Parameters
----------
aquantitiessequence: Units_QuantitiesSequence

Returns
-------
None
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
		/****************** Units_UnitsLexicon ******************/
		/**** md5 signature: 5346984bc371b417d497293a35fd4ee0 ****/
		%feature("compactdefaultargs") Units_UnitsLexicon;
		%feature("autodoc", "Returns an empty instance of unitslexicon.

Returns
-------
None
") Units_UnitsLexicon;
		 Units_UnitsLexicon();

		/****************** Creates ******************/
		/**** md5 signature: 6f502018e378671e3e8a24a2bcdb0708 ****/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Reads the files <afilename1> and <afilename2> to create a sequence of tokens stored in <thesequenceoftokens>.

Parameters
----------
amode: bool,optional
	default value is Standard_True

Returns
-------
None
") Creates;
		void Creates(const Standard_Boolean amode = Standard_True);

		/****************** Dump ******************/
		/**** md5 signature: 0122bc94dff7b9dabc6bcac8a9f7fc02 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Useful for debugging.

Returns
-------
None
") Dump;
		virtual void Dump();

};


%make_alias(Units_UnitsLexicon)

%extend Units_UnitsLexicon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Units_Quantity:
	pass

@classnotwrapped
class Units_Dimensions:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
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


