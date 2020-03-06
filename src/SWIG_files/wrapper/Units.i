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
%template(Units_TksSequence) NCollection_Sequence<opencascade::handle<Units_Token>>;
%template(Units_UtsSequence) NCollection_Sequence<opencascade::handle<Units_Unit>>;
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
		%feature("compactdefaultargs") LexiconFormula;
		%feature("autodoc", "Return a unique instance of lexiconformula.

Returns
-------
opencascade::handle<Units_Lexicon>
") LexiconFormula;
		static opencascade::handle<Units_Lexicon> LexiconFormula();

		/****************** LexiconUnits ******************/
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
		%feature("compactdefaultargs") NullDimensions;
		%feature("autodoc", "Returns always the same instance of dimensions.

Returns
-------
opencascade::handle<Units_Dimensions>
") NullDimensions;
		static opencascade::handle<Units_Dimensions> NullDimensions();

		/****************** Quantity ******************/
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
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "Empty contructor of the class.

Returns
-------
None
") Units_Explorer;
		 Units_Explorer();

		/****************** Units_Explorer ******************/
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
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "If the units system to explore is a user system, returns true if the current unit is active, false otherwise. //! if the units system to explore is the units dictionary, returns true if the current unit is the s.i. unit.

Returns
-------
bool
") IsActive;
		Standard_Boolean IsActive();

		/****************** MoreQuantity ******************/
		%feature("compactdefaultargs") MoreQuantity;
		%feature("autodoc", "Returns true if there is another quantity to explore, false otherwise.

Returns
-------
bool
") MoreQuantity;
		Standard_Boolean MoreQuantity();

		/****************** MoreUnit ******************/
		%feature("compactdefaultargs") MoreUnit;
		%feature("autodoc", "Returns true if there is another unit to explore, false otherwise.

Returns
-------
bool
") MoreUnit;
		Standard_Boolean MoreUnit();

		/****************** NextQuantity ******************/
		%feature("compactdefaultargs") NextQuantity;
		%feature("autodoc", "Sets the next quantity current.

Returns
-------
None
") NextQuantity;
		void NextQuantity();

		/****************** NextUnit ******************/
		%feature("compactdefaultargs") NextUnit;
		%feature("autodoc", "Sets the next unit current.

Returns
-------
None
") NextUnit;
		void NextUnit();

		/****************** Quantity ******************/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Returns the name of the current quantity.

Returns
-------
TCollection_AsciiString
") Quantity;
		TCollection_AsciiString Quantity();

		/****************** Unit ******************/
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
		%feature("compactdefaultargs") Units_Lexicon;
		%feature("autodoc", "Creates an empty instance of lexicon.

Returns
-------
None
") Units_Lexicon;
		 Units_Lexicon();

		/****************** AddToken ******************/
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
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Reads the file <afilename> to create a sequence of tokens stored in <thesequenceoftokens>.

Returns
-------
None
") Creates;
		void Creates();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Useful for debugging.

Returns
-------
None
") Dump;
		virtual void Dump();

		/****************** Sequence ******************/
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
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "It is the empty constructor of the class.

Returns
-------
None
") Units_Measurement;
		 Units_Measurement();

		/****************** Units_Measurement ******************/
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
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Useful for debugging.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Fractional ******************/
		%feature("compactdefaultargs") Fractional;
		%feature("autodoc", "Returns a measurement object with the fractional value of the measurement contained in <self>.

Returns
-------
Units_Measurement
") Fractional;
		Units_Measurement Fractional();

		/****************** HasToken ******************/
		%feature("compactdefaultargs") HasToken;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasToken;
		Standard_Boolean HasToken();

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Returns a measurement object with the integer value of the measurement contained in <self>.

Returns
-------
Units_Measurement
") Integer;
		Units_Measurement Integer();

		/****************** Measurement ******************/
		%feature("compactdefaultargs") Measurement;
		%feature("autodoc", "Returns the value of the measurement.

Returns
-------
float
") Measurement;
		Standard_Real Measurement();

		/****************** Multiply ******************/
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
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Returns the token contained in <self>.

Returns
-------
opencascade::handle<Units_Token>
") Token;
		opencascade::handle<Units_Token> Token();

		/****************** operator * ******************/
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
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Useful for debugging.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Computes and returns in a token the result of the expression.

Returns
-------
opencascade::handle<Units_Token>
") Evaluate;
		opencascade::handle<Units_Token> Evaluate();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return true if number of created tokens > 0 (i.e creation of sentence is succesfull).

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Sequence ******************/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "Returns <thesequenceoftokens>.

Returns
-------
opencascade::handle<Units_TokensSequence>
") Sequence;
		opencascade::handle<Units_TokensSequence> Sequence();

		/****************** Sequence ******************/
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
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "Creates and returns a empty token.

Returns
-------
None
") Units_Token;
		 Units_Token();

		/****************** Units_Token ******************/
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
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Creates and returns a token, which is a shiftedtoken.

Returns
-------
opencascade::handle<Units_Token>
") Creates;
		virtual opencascade::handle<Units_Token> Creates();

		/****************** Dimensions ******************/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Returns the dimensions of the token <thedimensions>.

Returns
-------
opencascade::handle<Units_Dimensions>
") Dimensions;
		opencascade::handle<Units_Dimensions> Dimensions();

		/****************** Dimensions ******************/
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
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the word.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Mean ******************/
		%feature("compactdefaultargs") Mean;
		%feature("autodoc", "Returns the significance of the word <theword>, which is in the field <themean>.

Returns
-------
TCollection_AsciiString
") Mean;
		TCollection_AsciiString Mean();

		/****************** Mean ******************/
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value stored in the field <thevalue>.

Returns
-------
float
") Value;
		Standard_Real Value();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "Returns the string <theword>.

Returns
-------
TCollection_AsciiString
") Word;
		TCollection_AsciiString Word();

		/****************** Word ******************/
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
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of the unit <thename>.

Returns
-------
TCollection_AsciiString
") Name;
		TCollection_AsciiString Name();

		/****************** Quantity ******************/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Returns <thequantity> contained in <self>.

Returns
-------
opencascade::handle<Units_Quantity>
") Quantity;
		opencascade::handle<Units_Quantity> Quantity();

		/****************** Quantity ******************/
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
		%feature("compactdefaultargs") SymbolsSequence;
		%feature("autodoc", "Returns the sequence of symbols <thesymbolssequence>.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") SymbolsSequence;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SymbolsSequence();

		/****************** Token ******************/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "Starting with <self>, returns a new token object.

Returns
-------
opencascade::handle<Units_Token>
") Token;
		virtual opencascade::handle<Units_Token> Token();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value in relation with the international system of units.

Returns
-------
float
") Value;
		Standard_Real Value();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") Units_UnitsDictionary;
		%feature("autodoc", "Returns an empty instance of unitsdictionary.

Returns
-------
None
") Units_UnitsDictionary;
		 Units_UnitsDictionary();

		/****************** ActiveUnit ******************/
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
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Returns a unitsdictionary object which contains the sequence of all the units you want to consider, physical quantity by physical quantity.

Returns
-------
None
") Creates;
		void Creates();

		/****************** Dump ******************/
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
		%feature("compactdefaultargs") Units_UnitsSystem;
		%feature("autodoc", "Returns an instance of unitssystem initialized to the s.i. units system.

Returns
-------
None
") Units_UnitsSystem;
		 Units_UnitsSystem();

		/****************** Units_UnitsSystem ******************/
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
		%feature("compactdefaultargs") Activates;
		%feature("autodoc", "Activates the first unit of all defined system quantities.

Returns
-------
None
") Activates;
		void Activates();

		/****************** ActiveUnit ******************/
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
		%feature("compactdefaultargs") ActiveUnitsSequence;
		%feature("autodoc", "Returns a sequence of integer in correspondance with the sequence of quantities, which indicates, for each redefined quantity, the index into the sequence of units, of the active unit.

Returns
-------
opencascade::handle<TColStd_HSequenceOfInteger>
") ActiveUnitsSequence;
		opencascade::handle<TColStd_HSequenceOfInteger> ActiveUnitsSequence();

		/****************** ConvertSIValueToUserSystem ******************/
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
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if no units has been defined in the system.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** QuantitiesSequence ******************/
		%feature("compactdefaultargs") QuantitiesSequence;
		%feature("autodoc", "Returns the sequence of refined quantities.

Returns
-------
opencascade::handle<Units_QuantitiesSequence>
") QuantitiesSequence;
		opencascade::handle<Units_QuantitiesSequence> QuantitiesSequence();

		/****************** Remove ******************/
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
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "Creates and returns a token, which is a shiftedtoken.

Returns
-------
opencascade::handle<Units_Token>
") Creates;
		virtual opencascade::handle<Units_Token> Creates();

		/****************** Divided ******************/
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
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Returns the gap <themove>.

Returns
-------
float
") Move;
		Standard_Real Move();

		/****************** Multiplied ******************/
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
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Returns the shifted value <themove>.

Returns
-------
float
") Move;
		Standard_Real Move();

		/****************** Token ******************/
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
		%feature("compactdefaultargs") Analyse;
		%feature("autodoc", "Analyzes the sequence of tokens created by the constructor to find the true significance of each token.

Returns
-------
None
") Analyse;
		void Analyse();

		/****************** SetUnits ******************/
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
		%feature("compactdefaultargs") Units_UnitsLexicon;
		%feature("autodoc", "Returns an empty instance of unitslexicon.

Returns
-------
None
") Units_UnitsLexicon;
		 Units_UnitsLexicon();

		/****************** Creates ******************/
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
class Units_TokensSequence : public  Units_TksSequence, public Standard_Transient {
  public:
    Units_TokensSequence();
    Units_TokensSequence(const  Units_TksSequence& theOther);
    const  Units_TksSequence& Sequence();
    void Append (const  Units_TksSequence::value_type& theItem);
    void Append ( Units_TksSequence& theSequence);
     Units_TksSequence& ChangeSequence();
};
%make_alias(Units_TokensSequence)


class Units_QuantitiesSequence : public  Units_QtsSequence, public Standard_Transient {
  public:
    Units_QuantitiesSequence();
    Units_QuantitiesSequence(const  Units_QtsSequence& theOther);
    const  Units_QtsSequence& Sequence();
    void Append (const  Units_QtsSequence::value_type& theItem);
    void Append ( Units_QtsSequence& theSequence);
     Units_QtsSequence& ChangeSequence();
};
%make_alias(Units_QuantitiesSequence)


class Units_UnitsSequence : public  Units_UtsSequence, public Standard_Transient {
  public:
    Units_UnitsSequence();
    Units_UnitsSequence(const  Units_UtsSequence& theOther);
    const  Units_UtsSequence& Sequence();
    void Append (const  Units_UtsSequence::value_type& theItem);
    void Append ( Units_UtsSequence& theSequence);
     Units_UtsSequence& ChangeSequence();
};
%make_alias(Units_UnitsSequence)


