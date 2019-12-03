/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

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
%template(Units_TksSequence) NCollection_Sequence <opencascade::handle <Units_Token>>;
%template(Units_QtsSequence) NCollection_Sequence <opencascade::handle <Units_Quantity>>;
%template(Units_UtsSequence) NCollection_Sequence <opencascade::handle <Units_Unit>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <Units_Token>> Units_TksSequence;
typedef NCollection_Sequence <opencascade::handle <Units_Quantity>> Units_QtsSequence;
typedef NCollection_Sequence <opencascade::handle <Units_Unit>> Units_UtsSequence;
/* end typedefs declaration */

/**************
* class Units *
**************/
%rename(units) Units;
class Units {
	public:
		/****************** Convert ******************/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "* Converts <avalue> expressed in <afirstunit> into the <asecondunit>.
	:param avalue:
	:type avalue: float
	:param afirstunit:
	:type afirstunit: char *
	:param asecondunit:
	:type asecondunit: char *
	:rtype: float") Convert;
		static Standard_Real Convert (const Standard_Real avalue,const char * afirstunit,const char * asecondunit);

		/****************** DictionaryOfUnits ******************/
		%feature("compactdefaultargs") DictionaryOfUnits;
		%feature("autodoc", "* Returns a unique instance of the dictionary of units. If <amode> is True, then it forces the recomputation of the dictionary of units.
	:param amode: default value is Standard_False
	:type amode: bool
	:rtype: opencascade::handle<Units_UnitsDictionary>") DictionaryOfUnits;
		static opencascade::handle<Units_UnitsDictionary> DictionaryOfUnits (const Standard_Boolean amode = Standard_False);

		/****************** Dimensions ******************/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "* return the dimension associated to the Type
	:param aType:
	:type aType: char *
	:rtype: opencascade::handle<Units_Dimensions>") Dimensions;
		static opencascade::handle<Units_Dimensions> Dimensions (const char * aType);

		/****************** FirstQuantity ******************/
		%feature("compactdefaultargs") FirstQuantity;
		%feature("autodoc", "* Returns the first quantity string founded from the unit <aUnit>.
	:param aunit:
	:type aunit: char *
	:rtype: char *") FirstQuantity;
		static const char * FirstQuantity (const char * aunit);

		/****************** FromSI ******************/
		%feature("compactdefaultargs") FromSI;
		%feature("autodoc", ":param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:rtype: float") FromSI;
		static Standard_Real FromSI (const Standard_Real aData,const char * aUnit);

		/****************** FromSI ******************/
		%feature("compactdefaultargs") FromSI;
		%feature("autodoc", ":param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:param aDim:
	:type aDim: Units_Dimensions
	:rtype: float") FromSI;
		static Standard_Real FromSI (const Standard_Real aData,const char * aUnit,opencascade::handle<Units_Dimensions> & aDim);

		/****************** LexiconFile ******************/
		%feature("compactdefaultargs") LexiconFile;
		%feature("autodoc", "* Defines the location of the file containing the lexicon useful in manipulating composite units.
	:param afile:
	:type afile: char *
	:rtype: void") LexiconFile;
		static void LexiconFile (const char * afile);

		/****************** LexiconFormula ******************/
		%feature("compactdefaultargs") LexiconFormula;
		%feature("autodoc", "* Return a unique instance of LexiconFormula.
	:rtype: opencascade::handle<Units_Lexicon>") LexiconFormula;
		static opencascade::handle<Units_Lexicon> LexiconFormula ();

		/****************** LexiconUnits ******************/
		%feature("compactdefaultargs") LexiconUnits;
		%feature("autodoc", "* Returns a unique instance of the Units_Lexicon. If <amode> is True, it forces the recomputation of the dictionary of units, and by consequence the completion of the Units_Lexicon.
	:param amode: default value is Standard_True
	:type amode: bool
	:rtype: opencascade::handle<Units_Lexicon>") LexiconUnits;
		static opencascade::handle<Units_Lexicon> LexiconUnits (const Standard_Boolean amode = Standard_True);

		/****************** NullDimensions ******************/
		%feature("compactdefaultargs") NullDimensions;
		%feature("autodoc", "* Returns always the same instance of Dimensions.
	:rtype: opencascade::handle<Units_Dimensions>") NullDimensions;
		static opencascade::handle<Units_Dimensions> NullDimensions ();

		/****************** Quantity ******************/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "* Returns a unique quantity instance corresponding to <aquantity>.
	:param aquantity:
	:type aquantity: char *
	:rtype: opencascade::handle<Units_Quantity>") Quantity;
		static opencascade::handle<Units_Quantity> Quantity (const char * aquantity);

		/****************** ToSI ******************/
		%feature("compactdefaultargs") ToSI;
		%feature("autodoc", ":param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:rtype: float") ToSI;
		static Standard_Real ToSI (const Standard_Real aData,const char * aUnit);

		/****************** ToSI ******************/
		%feature("compactdefaultargs") ToSI;
		%feature("autodoc", ":param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:param aDim:
	:type aDim: Units_Dimensions
	:rtype: float") ToSI;
		static Standard_Real ToSI (const Standard_Real aData,const char * aUnit,opencascade::handle<Units_Dimensions> & aDim);

		/****************** UnitsFile ******************/
		%feature("compactdefaultargs") UnitsFile;
		%feature("autodoc", "* Defines the location of the file containing all the information useful in creating the dictionary of all the units known to the system.
	:param afile:
	:type afile: char *
	:rtype: void") UnitsFile;
		static void UnitsFile (const char * afile);

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
%nodefaultctor Units_Explorer;
class Units_Explorer {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the instance of the class with the UnitsSystem <aunitssystem>.
	:param aunitssystem:
	:type aunitssystem: Units_UnitsSystem
	:rtype: None") Init;
		void Init (const opencascade::handle<Units_UnitsSystem> & aunitssystem);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the instance of the class with the UnitsDictionary <aunitsdictionary>.
	:param aunitsdictionary:
	:type aunitsdictionary: Units_UnitsDictionary
	:rtype: None") Init;
		void Init (const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the instance of the class with the UnitsSystem <aunitssystem> and positioned at the quantity <aquantity>.
	:param aunitssystem:
	:type aunitssystem: Units_UnitsSystem
	:param aquantity:
	:type aquantity: char *
	:rtype: None") Init;
		void Init (const opencascade::handle<Units_UnitsSystem> & aunitssystem,const char * aquantity);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the instance of the class with the UnitsDictionary <aunitsdictionary> and positioned at the quantity <aquantity>.
	:param aunitsdictionary:
	:type aunitsdictionary: Units_UnitsDictionary
	:param aquantity:
	:type aquantity: char *
	:rtype: None") Init;
		void Init (const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary,const char * aquantity);

		/****************** IsActive ******************/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "* If the units system to explore is a user system, returns True if the current unit is active, False otherwise. //! If the units system to explore is the units dictionary, returns True if the current unit is the S.I. unit.
	:rtype: bool") IsActive;
		Standard_Boolean IsActive ();

		/****************** MoreQuantity ******************/
		%feature("compactdefaultargs") MoreQuantity;
		%feature("autodoc", "* Returns True if there is another Quantity to explore, False otherwise.
	:rtype: bool") MoreQuantity;
		Standard_Boolean MoreQuantity ();

		/****************** MoreUnit ******************/
		%feature("compactdefaultargs") MoreUnit;
		%feature("autodoc", "* Returns True if there is another Unit to explore, False otherwise.
	:rtype: bool") MoreUnit;
		Standard_Boolean MoreUnit ();

		/****************** NextQuantity ******************/
		%feature("compactdefaultargs") NextQuantity;
		%feature("autodoc", "* Sets the next Quantity current.
	:rtype: None") NextQuantity;
		void NextQuantity ();

		/****************** NextUnit ******************/
		%feature("compactdefaultargs") NextUnit;
		%feature("autodoc", "* Sets the next Unit current.
	:rtype: None") NextUnit;
		void NextUnit ();

		/****************** Quantity ******************/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "* Returns the name of the current Quantity.
	:rtype: TCollection_AsciiString") Quantity;
		TCollection_AsciiString Quantity ();

		/****************** Unit ******************/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "* Returns the name of the current unit.
	:rtype: TCollection_AsciiString") Unit;
		TCollection_AsciiString Unit ();

		/****************** Units_Explorer ******************/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "* Empty contructor of the class.
	:rtype: None") Units_Explorer;
		 Units_Explorer ();

		/****************** Units_Explorer ******************/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "* Creates a new instance of the class, initialized with the UnitsSystem <aunitssystem>.
	:param aunitssystem:
	:type aunitssystem: Units_UnitsSystem
	:rtype: None") Units_Explorer;
		 Units_Explorer (const opencascade::handle<Units_UnitsSystem> & aunitssystem);

		/****************** Units_Explorer ******************/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "* Creates a new instance of the class, initialized with the UnitsDictionary <aunitsdictionary>.
	:param aunitsdictionary:
	:type aunitsdictionary: Units_UnitsDictionary
	:rtype: None") Units_Explorer;
		 Units_Explorer (const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary);

		/****************** Units_Explorer ******************/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "* Creates a new instance of the class, initialized with the UnitsSystem <aunitssystem> and positioned at the quantity <aquantity>.
	:param aunitssystem:
	:type aunitssystem: Units_UnitsSystem
	:param aquantity:
	:type aquantity: char *
	:rtype: None") Units_Explorer;
		 Units_Explorer (const opencascade::handle<Units_UnitsSystem> & aunitssystem,const char * aquantity);

		/****************** Units_Explorer ******************/
		%feature("compactdefaultargs") Units_Explorer;
		%feature("autodoc", "* Creates a new instance of the class, initialized with the UnitsDictionary <aunitsdictionary> and positioned at the quantity <aquantity>.
	:param aunitsdictionary:
	:type aunitsdictionary: Units_UnitsDictionary
	:param aquantity:
	:type aquantity: char *
	:rtype: None") Units_Explorer;
		 Units_Explorer (const opencascade::handle<Units_UnitsDictionary> & aunitsdictionary,const char * aquantity);

};


%extend Units_Explorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Units_Lexicon *
**********************/
%nodefaultctor Units_Lexicon;
class Units_Lexicon : public Standard_Transient {
	public:
		/****************** AddToken ******************/
		%feature("compactdefaultargs") AddToken;
		%feature("autodoc", "* Adds to the lexicon a new token with <aword>, <amean>, <avalue> as arguments. If there is already a token with the field <theword> equal to <aword>, the existing token is updated.
	:param aword:
	:type aword: char *
	:param amean:
	:type amean: char *
	:param avalue:
	:type avalue: float
	:rtype: None") AddToken;
		void AddToken (const char * aword,const char * amean,const Standard_Real avalue);

		/****************** Creates ******************/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "* Reads the file <afilename> to create a sequence of tokens stored in <thesequenceoftokens>.
	:rtype: None") Creates;
		void Creates ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Useful for debugging.
	:rtype: None") Dump;
		void Dump ();

		/****************** Sequence ******************/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "* Returns the first item of the sequence of tokens.
	:rtype: opencascade::handle<Units_TokensSequence>") Sequence;
		opencascade::handle<Units_TokensSequence> Sequence ();

		/****************** Units_Lexicon ******************/
		%feature("compactdefaultargs") Units_Lexicon;
		%feature("autodoc", "* Creates an empty instance of Lexicon.
	:rtype: None") Units_Lexicon;
		 Units_Lexicon ();

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
%nodefaultctor Units_Measurement;
class Units_Measurement {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Returns (if it is possible) a measurement which is the addition of <self> and <ameasurement>. The chosen returned unit is the unit of <self>.
	:param ameasurement:
	:type ameasurement: Units_Measurement
	:rtype: Units_Measurement") Add;
		Units_Measurement Add (const Units_Measurement & ameasurement);

		/****************** Convert ******************/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "* Converts (if possible) the measurement object into another unit. <aunit> must have the same dimensionality as the unit contained in the token <thetoken>.
	:param aunit:
	:type aunit: char *
	:rtype: None") Convert;
		void Convert (const char * aunit);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "* Returns a measurement which is the division of <self> by <ameasurement>.
	:param ameasurement:
	:type ameasurement: Units_Measurement
	:rtype: Units_Measurement") Divide;
		Units_Measurement Divide (const Units_Measurement & ameasurement);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "* Returns a measurement which is the division of <self> by the constant <avalue>.
	:param avalue:
	:type avalue: float
	:rtype: Units_Measurement") Divide;
		Units_Measurement Divide (const Standard_Real avalue);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Useful for debugging.
	:rtype: None") Dump;
		void Dump ();

		/****************** Fractional ******************/
		%feature("compactdefaultargs") Fractional;
		%feature("autodoc", "* Returns a Measurement object with the fractional value of the measurement contained in <self>.
	:rtype: Units_Measurement") Fractional;
		Units_Measurement Fractional ();

		/****************** HasToken ******************/
		%feature("compactdefaultargs") HasToken;
		%feature("autodoc", ":rtype: bool") HasToken;
		Standard_Boolean HasToken ();

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "* Returns a Measurement object with the integer value of the measurement contained in <self>.
	:rtype: Units_Measurement") Integer;
		Units_Measurement Integer ();

		/****************** Measurement ******************/
		%feature("compactdefaultargs") Measurement;
		%feature("autodoc", "* Returns the value of the measurement.
	:rtype: float") Measurement;
		Standard_Real Measurement ();

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Returns a measurement which is the multiplication of <self> and <ameasurement>.
	:param ameasurement:
	:type ameasurement: Units_Measurement
	:rtype: Units_Measurement") Multiply;
		Units_Measurement Multiply (const Units_Measurement & ameasurement);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Returns a measurement which is the multiplication of <self> with the value <avalue>.
	:param avalue:
	:type avalue: float
	:rtype: Units_Measurement") Multiply;
		Units_Measurement Multiply (const Standard_Real avalue);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "* Returns a measurement which is <self> powered <anexponent>.
	:param anexponent:
	:type anexponent: float
	:rtype: Units_Measurement") Power;
		Units_Measurement Power (const Standard_Real anexponent);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "* Returns (if it is possible) a measurement which is the subtraction of <self> and <ameasurement>. The chosen returned unit is the unit of <self>.
	:param ameasurement:
	:type ameasurement: Units_Measurement
	:rtype: Units_Measurement") Subtract;
		Units_Measurement Subtract (const Units_Measurement & ameasurement);

		/****************** Token ******************/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "* Returns the token contained in <self>.
	:rtype: opencascade::handle<Units_Token>") Token;
		opencascade::handle<Units_Token> Token ();

		/****************** Units_Measurement ******************/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "* It is the empty constructor of the class.
	:rtype: None") Units_Measurement;
		 Units_Measurement ();

		/****************** Units_Measurement ******************/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "* Returns an instance of this class. <avalue> defines the measurement, and <atoken> the token which defines the unit used.
	:param avalue:
	:type avalue: float
	:param atoken:
	:type atoken: Units_Token
	:rtype: None") Units_Measurement;
		 Units_Measurement (const Standard_Real avalue,const opencascade::handle<Units_Token> & atoken);

		/****************** Units_Measurement ******************/
		%feature("compactdefaultargs") Units_Measurement;
		%feature("autodoc", "* Returns an instance of this class. <avalue> defines the measurement, and <aunit> the unit used, described in natural language.
	:param avalue:
	:type avalue: float
	:param aunit:
	:type aunit: char *
	:rtype: None") Units_Measurement;
		 Units_Measurement (const Standard_Real avalue,const char * aunit);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param ameasurement:
	:type ameasurement: Units_Measurement
	:rtype: Units_Measurement") operator *;
		Units_Measurement operator * (const Units_Measurement & ameasurement);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param avalue:
	:type avalue: float
	:rtype: Units_Measurement") operator *;
		Units_Measurement operator * (const Standard_Real avalue);

		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", ":param ameasurement:
	:type ameasurement: Units_Measurement
	:rtype: Units_Measurement") operator +;
		Units_Measurement operator + (const Units_Measurement & ameasurement);

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", ":param ameasurement:
	:type ameasurement: Units_Measurement
	:rtype: Units_Measurement") operator -;
		Units_Measurement operator - (const Units_Measurement & ameasurement);

		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", ":param ameasurement:
	:type ameasurement: Units_Measurement
	:rtype: Units_Measurement") operator /;
		Units_Measurement operator / (const Units_Measurement & ameasurement);

		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", ":param avalue:
	:type avalue: float
	:rtype: Units_Measurement") operator /;
		Units_Measurement operator / (const Standard_Real avalue);

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
%nodefaultctor Units_Sentence;
class Units_Sentence {
	public:
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Useful for debugging.
	:rtype: None") Dump;
		void Dump ();

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "* Computes and returns in a token the result of the expression.
	:rtype: opencascade::handle<Units_Token>") Evaluate;
		opencascade::handle<Units_Token> Evaluate ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Return True if number of created tokens > 0 (i.e creation of sentence is succesfull)
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Sequence ******************/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "* Returns <thesequenceoftokens>.
	:rtype: opencascade::handle<Units_TokensSequence>") Sequence;
		opencascade::handle<Units_TokensSequence> Sequence ();

		/****************** Sequence ******************/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "* Sets the field <thesequenceoftokens> to <asequenceoftokens>.
	:param asequenceoftokens:
	:type asequenceoftokens: Units_TokensSequence
	:rtype: None") Sequence;
		void Sequence (const opencascade::handle<Units_TokensSequence> & asequenceoftokens);

		/****************** SetConstants ******************/
		%feature("compactdefaultargs") SetConstants;
		%feature("autodoc", "* For each constant encountered, sets the value.
	:rtype: None") SetConstants;
		void SetConstants ();

		/****************** Units_Sentence ******************/
		%feature("compactdefaultargs") Units_Sentence;
		%feature("autodoc", "* Creates and returns a Sentence, by analyzing the string <astring> with the lexicon <alexicon>.
	:param alexicon:
	:type alexicon: Units_Lexicon
	:param astring:
	:type astring: char *
	:rtype: None") Units_Sentence;
		 Units_Sentence (const opencascade::handle<Units_Lexicon> & alexicon,const char * astring);

};


%extend Units_Sentence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Units_Token *
********************/
%nodefaultctor Units_Token;
class Units_Token : public Standard_Transient {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param aninteger:
	:type aninteger: int
	:rtype: opencascade::handle<Units_Token>") Add;
		opencascade::handle<Units_Token> Add (const Standard_Integer aninteger);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Returns a token which is the addition of <self> and another token <atoken>. The addition is possible if and only if the dimensions are the same.
	:param atoken:
	:type atoken: Units_Token
	:rtype: opencascade::handle<Units_Token>") Add;
		opencascade::handle<Units_Token> Add (const opencascade::handle<Units_Token> & atoken);

		/****************** Creates ******************/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "* Creates and returns a token, which is a ShiftedToken.
	:rtype: opencascade::handle<Units_Token>") Creates;
		virtual opencascade::handle<Units_Token> Creates ();

		/****************** Dimensions ******************/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "* Returns the dimensions of the token <thedimensions>.
	:rtype: opencascade::handle<Units_Dimensions>") Dimensions;
		opencascade::handle<Units_Dimensions> Dimensions ();

		/****************** Dimensions ******************/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "* Sets the field <thedimensions> to <adimensions>.
	:param adimensions:
	:type adimensions: Units_Dimensions
	:rtype: None") Dimensions;
		void Dimensions (const opencascade::handle<Units_Dimensions> & adimensions);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "* Returns a token which is the division of <self> by another token <atoken>.
	:param atoken:
	:type atoken: Units_Token
	:rtype: opencascade::handle<Units_Token>") Divide;
		opencascade::handle<Units_Token> Divide (const opencascade::handle<Units_Token> & atoken);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "* This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
	:param avalue:
	:type avalue: float
	:rtype: Standard_NODISCARD  float") Divided;
		Standard_NODISCARD virtual Standard_Real Divided (const Standard_Real avalue);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Useful for debugging
	:param ashift:
	:type ashift: int
	:param alevel:
	:type alevel: int
	:rtype: void") Dump;
		virtual void Dump (const Standard_Integer ashift,const Standard_Integer alevel);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns true if the field <theword> and the string <astring> are the same, false otherwise.
	:param astring:
	:type astring: char *
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const char * astring);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns true if the field <theword> and the string <theword> contained in the token <atoken> are the same, false otherwise.
	:param atoken:
	:type atoken: Units_Token
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const opencascade::handle<Units_Token> & atoken);

		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "* Returns false if the field <theword> is strictly contained at the beginning of the string <astring>, true otherwise.
	:param astring:
	:type astring: char *
	:rtype: bool") IsGreater;
		Standard_Boolean IsGreater (const char * astring);

		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "* Returns false if the field <theword> is strictly contained at the beginning of the string <astring>, true otherwise.
	:param atoken:
	:type atoken: Units_Token
	:rtype: bool") IsGreater;
		Standard_Boolean IsGreater (const opencascade::handle<Units_Token> & atoken);

		/****************** IsGreaterOrEqual ******************/
		%feature("compactdefaultargs") IsGreaterOrEqual;
		%feature("autodoc", "* Returns true if the string <astring> is strictly contained at the beginning of the field <theword> false otherwise.
	:param atoken:
	:type atoken: Units_Token
	:rtype: bool") IsGreaterOrEqual;
		Standard_Boolean IsGreaterOrEqual (const opencascade::handle<Units_Token> & atoken);

		/****************** IsLessOrEqual ******************/
		%feature("compactdefaultargs") IsLessOrEqual;
		%feature("autodoc", "* Returns true if the field <theword> is strictly contained at the beginning of the string <astring>, false otherwise.
	:param astring:
	:type astring: char *
	:rtype: bool") IsLessOrEqual;
		Standard_Boolean IsLessOrEqual (const char * astring);

		/****************** IsNotEqual ******************/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "* Returns false if the field <theword> and the string <astring> are the same, true otherwise.
	:param astring:
	:type astring: char *
	:rtype: bool") IsNotEqual;
		Standard_Boolean IsNotEqual (const char * astring);

		/****************** IsNotEqual ******************/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "* Returns false if the field <theword> and the string <theword> contained in the token <atoken> are the same, true otherwise.
	:param atoken:
	:type atoken: Units_Token
	:rtype: bool") IsNotEqual;
		Standard_Boolean IsNotEqual (const opencascade::handle<Units_Token> & atoken);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Returns the length of the word.
	:rtype: int") Length;
		Standard_Integer Length ();

		/****************** Mean ******************/
		%feature("compactdefaultargs") Mean;
		%feature("autodoc", "* Returns the significance of the word <theword>, which is in the field <themean>.
	:rtype: TCollection_AsciiString") Mean;
		TCollection_AsciiString Mean ();

		/****************** Mean ******************/
		%feature("compactdefaultargs") Mean;
		%feature("autodoc", "* Sets the field <themean> to <amean>.
	:param amean:
	:type amean: char *
	:rtype: None") Mean;
		void Mean (const char * amean);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
	:param avalue:
	:type avalue: float
	:rtype: Standard_NODISCARD  float") Multiplied;
		Standard_NODISCARD virtual Standard_Real Multiplied (const Standard_Real avalue);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Returns a token which is the product of <self> and another token <atoken>.
	:param atoken:
	:type atoken: Units_Token
	:rtype: opencascade::handle<Units_Token>") Multiply;
		opencascade::handle<Units_Token> Multiply (const opencascade::handle<Units_Token> & atoken);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "* Returns a token which is <self> to the power of another token <atoken>. The computation is possible only if <atoken> is a dimensionless constant.
	:param atoken:
	:type atoken: Units_Token
	:rtype: opencascade::handle<Units_Token>") Power;
		opencascade::handle<Units_Token> Power (const opencascade::handle<Units_Token> & atoken);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "* Returns a token which is <self> to the power of <anexponent>.
	:param anexponent:
	:type anexponent: float
	:rtype: opencascade::handle<Units_Token>") Power;
		opencascade::handle<Units_Token> Power (const Standard_Real anexponent);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "* Returns a token which is the subtraction of <self> and another token <atoken>. The subtraction is possible if and only if the dimensions are the same.
	:param atoken:
	:type atoken: Units_Token
	:rtype: opencascade::handle<Units_Token>") Subtract;
		opencascade::handle<Units_Token> Subtract (const opencascade::handle<Units_Token> & atoken);

		/****************** Units_Token ******************/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "* Creates and returns a empty token.
	:rtype: None") Units_Token;
		 Units_Token ();

		/****************** Units_Token ******************/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "* Creates and returns a token. <aword> is a string containing the available word.
	:param aword:
	:type aword: char *
	:rtype: None") Units_Token;
		 Units_Token (const char * aword);

		/****************** Units_Token ******************/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "* Creates and returns a token. <atoken> is copied in the returned token.
	:param atoken:
	:type atoken: Units_Token
	:rtype: None") Units_Token;
		 Units_Token (const opencascade::handle<Units_Token> & atoken);

		/****************** Units_Token ******************/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "* Creates and returns a token. <aword> is a string containing the available word and <amean> gives the signification of the token.
	:param aword:
	:type aword: char *
	:param amean:
	:type amean: char *
	:rtype: None") Units_Token;
		 Units_Token (const char * aword,const char * amean);

		/****************** Units_Token ******************/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "* Creates and returns a token. <aword> is a string containing the available word, <amean> gives the signification of the token and <avalue> is the numeric value of the dimension.
	:param aword:
	:type aword: char *
	:param amean:
	:type amean: char *
	:param avalue:
	:type avalue: float
	:rtype: None") Units_Token;
		 Units_Token (const char * aword,const char * amean,const Standard_Real avalue);

		/****************** Units_Token ******************/
		%feature("compactdefaultargs") Units_Token;
		%feature("autodoc", "* Creates and returns a token. <aword> is a string containing the available word, <amean> gives the signification of the token, <avalue> is the numeric value of the dimension, and <adimensions> is the dimension of the given word <aword>.
	:param aword:
	:type aword: char *
	:param amean:
	:type amean: char *
	:param avalue:
	:type avalue: float
	:param adimension:
	:type adimension: Units_Dimensions
	:rtype: None") Units_Token;
		 Units_Token (const char * aword,const char * amean,const Standard_Real avalue,const opencascade::handle<Units_Dimensions> & adimension);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Updates the token <self> with the additional signification <amean> by concatenation of the two strings <themean> and <amean>. If the two significations are the same , an information message is written in the output device.
	:param amean:
	:type amean: char *
	:rtype: None") Update;
		void Update (const char * amean);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the value stored in the field <thevalue>.
	:rtype: float") Value;
		Standard_Real Value ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Sets the field <thevalue> to <avalue>.
	:param avalue:
	:type avalue: float
	:rtype: None") Value;
		void Value (const Standard_Real avalue);

		/****************** Word ******************/
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "* Returns the string <theword>
	:rtype: TCollection_AsciiString") Word;
		TCollection_AsciiString Word ();

		/****************** Word ******************/
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "* Sets the field <theword> to <aword>.
	:param aword:
	:type aword: char *
	:rtype: None") Word;
		void Word (const char * aword);

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
%nodefaultctor Units_Unit;
class Units_Unit : public Standard_Transient {
	public:
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Useful for debugging
	:param ashift:
	:type ashift: int
	:param alevel:
	:type alevel: int
	:rtype: void") Dump;
		virtual void Dump (const Standard_Integer ashift,const Standard_Integer alevel);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Compares all the symbols linked within <self> with the name of <atoken>, and returns True if there is one symbol equal to the name, False otherwise.
	:param astring:
	:type astring: char *
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const char * astring);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the name of the unit <thename>
	:rtype: TCollection_AsciiString") Name;
		TCollection_AsciiString Name ();

		/****************** Quantity ******************/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "* Returns <thequantity> contained in <self>.
	:rtype: opencascade::handle<Units_Quantity>") Quantity;
		opencascade::handle<Units_Quantity> Quantity ();

		/****************** Quantity ******************/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "* Sets the physical Quantity <aquantity> to <self>.
	:param aquantity:
	:type aquantity: Units_Quantity
	:rtype: None") Quantity;
		void Quantity (const opencascade::handle<Units_Quantity> & aquantity);

		/****************** Symbol ******************/
		%feature("compactdefaultargs") Symbol;
		%feature("autodoc", "* Adds a new symbol <asymbol> attached to <self>.
	:param asymbol:
	:type asymbol: char *
	:rtype: None") Symbol;
		void Symbol (const char * asymbol);

		/****************** SymbolsSequence ******************/
		%feature("compactdefaultargs") SymbolsSequence;
		%feature("autodoc", "* Returns the sequence of symbols <thesymbolssequence>
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") SymbolsSequence;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SymbolsSequence ();

		/****************** Token ******************/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "* Starting with <self>, returns a new Token object.
	:rtype: opencascade::handle<Units_Token>") Token;
		virtual opencascade::handle<Units_Token> Token ();

		/****************** Units_Unit ******************/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "* Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit, and <avalue> is the value in relation to the International System of Units.
	:param aname:
	:type aname: char *
	:param asymbol:
	:type asymbol: char *
	:param avalue:
	:type avalue: float
	:param aquantity:
	:type aquantity: Units_Quantity
	:rtype: None") Units_Unit;
		 Units_Unit (const char * aname,const char * asymbol,const Standard_Real avalue,const opencascade::handle<Units_Quantity> & aquantity);

		/****************** Units_Unit ******************/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "* Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit.
	:param aname:
	:type aname: char *
	:param asymbol:
	:type asymbol: char *
	:rtype: None") Units_Unit;
		 Units_Unit (const char * aname,const char * asymbol);

		/****************** Units_Unit ******************/
		%feature("compactdefaultargs") Units_Unit;
		%feature("autodoc", "* Creates and returns a unit. <aname> is the name of the unit.
	:param aname:
	:type aname: char *
	:rtype: None") Units_Unit;
		 Units_Unit (const char * aname);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the value in relation with the International System of Units.
	:rtype: float") Value;
		Standard_Real Value ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Sets the value <avalue> to <self>.
	:param avalue:
	:type avalue: float
	:rtype: None") Value;
		void Value (const Standard_Real avalue);

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
%nodefaultctor Units_UnitsDictionary;
class Units_UnitsDictionary : public Standard_Transient {
	public:
		/****************** ActiveUnit ******************/
		%feature("compactdefaultargs") ActiveUnit;
		%feature("autodoc", "* Returns for <aquantity> the active unit.
	:param aquantity:
	:type aquantity: char *
	:rtype: TCollection_AsciiString") ActiveUnit;
		TCollection_AsciiString ActiveUnit (const char * aquantity);

		/****************** Creates ******************/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "* Returns a UnitsDictionary object which contains the sequence of all the units you want to consider, physical quantity by physical quantity.
	:rtype: None") Creates;
		void Creates ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dumps only the sequence of quantities without the units if <alevel> is equal to zero, and for each quantity all the units stored if <alevel> is equal to one.
	:param alevel:
	:type alevel: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer alevel);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dumps for a designated physical dimensions <adimensions> all the previously stored units.
	:param adimensions:
	:type adimensions: Units_Dimensions
	:rtype: None") Dump;
		void Dump (const opencascade::handle<Units_Dimensions> & adimensions);

		/****************** Sequence ******************/
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "* Returns the head of the sequence of physical quantities.
	:rtype: opencascade::handle<Units_QuantitiesSequence>") Sequence;
		opencascade::handle<Units_QuantitiesSequence> Sequence ();

		/****************** Units_UnitsDictionary ******************/
		%feature("compactdefaultargs") Units_UnitsDictionary;
		%feature("autodoc", "* Returns an empty instance of UnitsDictionary.
	:rtype: None") Units_UnitsDictionary;
		 Units_UnitsDictionary ();

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
%nodefaultctor Units_UnitsSystem;
class Units_UnitsSystem : public Standard_Transient {
	public:
		/****************** Activate ******************/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "* Specifies for <aquantity> the unit <aunit> used.
	:param aquantity:
	:type aquantity: char *
	:param aunit:
	:type aunit: char *
	:rtype: None") Activate;
		void Activate (const char * aquantity,const char * aunit);

		/****************** Activates ******************/
		%feature("compactdefaultargs") Activates;
		%feature("autodoc", "* Activates the first unit of all defined system quantities
	:rtype: None") Activates;
		void Activates ();

		/****************** ActiveUnit ******************/
		%feature("compactdefaultargs") ActiveUnit;
		%feature("autodoc", "* Returns for <aquantity> the active unit.
	:param aquantity:
	:type aquantity: char *
	:rtype: TCollection_AsciiString") ActiveUnit;
		TCollection_AsciiString ActiveUnit (const char * aquantity);

		/****************** ActiveUnitsSequence ******************/
		%feature("compactdefaultargs") ActiveUnitsSequence;
		%feature("autodoc", "* Returns a sequence of integer in correspondance with the sequence of quantities, which indicates, for each redefined quantity, the index into the sequence of units, of the active unit.
	:rtype: opencascade::handle<TColStd_HSequenceOfInteger>") ActiveUnitsSequence;
		opencascade::handle<TColStd_HSequenceOfInteger> ActiveUnitsSequence ();

		/****************** ConvertSIValueToUserSystem ******************/
		%feature("compactdefaultargs") ConvertSIValueToUserSystem;
		%feature("autodoc", "* Converts the real value <avalue> from the S.I. system of units to the user system of units. <aquantity> is the physical dimensions of the measurement.
	:param aquantity:
	:type aquantity: char *
	:param avalue:
	:type avalue: float
	:rtype: float") ConvertSIValueToUserSystem;
		Standard_Real ConvertSIValueToUserSystem (const char * aquantity,const Standard_Real avalue);

		/****************** ConvertUserSystemValueToSI ******************/
		%feature("compactdefaultargs") ConvertUserSystemValueToSI;
		%feature("autodoc", "* Converts the real value <avalue> from the user system of units to the S.I. system of units. <aquantity> is the physical dimensions of the measurement.
	:param aquantity:
	:type aquantity: char *
	:param avalue:
	:type avalue: float
	:rtype: float") ConvertUserSystemValueToSI;
		Standard_Real ConvertUserSystemValueToSI (const char * aquantity,const Standard_Real avalue);

		/****************** ConvertValueToUserSystem ******************/
		%feature("compactdefaultargs") ConvertValueToUserSystem;
		%feature("autodoc", "* Converts a real value <avalue> from the unit <aunit> belonging to the physical dimensions <aquantity> to the corresponding unit of the user system.
	:param aquantity:
	:type aquantity: char *
	:param avalue:
	:type avalue: float
	:param aunit:
	:type aunit: char *
	:rtype: float") ConvertValueToUserSystem;
		Standard_Real ConvertValueToUserSystem (const char * aquantity,const Standard_Real avalue,const char * aunit);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns True if no units has been defined in the system.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** QuantitiesSequence ******************/
		%feature("compactdefaultargs") QuantitiesSequence;
		%feature("autodoc", "* Returns the sequence of refined quantities.
	:rtype: opencascade::handle<Units_QuantitiesSequence>") QuantitiesSequence;
		opencascade::handle<Units_QuantitiesSequence> QuantitiesSequence ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes for <aquantity> the unit <aunit> used.
	:param aquantity:
	:type aquantity: char *
	:param aunit:
	:type aunit: char *
	:rtype: None") Remove;
		void Remove (const char * aquantity,const char * aunit);

		/****************** Specify ******************/
		%feature("compactdefaultargs") Specify;
		%feature("autodoc", "* Specifies for <aquantity> the unit <aunit> used.
	:param aquantity:
	:type aquantity: char *
	:param aunit:
	:type aunit: char *
	:rtype: None") Specify;
		void Specify (const char * aquantity,const char * aunit);

		/****************** Units_UnitsSystem ******************/
		%feature("compactdefaultargs") Units_UnitsSystem;
		%feature("autodoc", "* Returns an instance of UnitsSystem initialized to the S.I. units system.
	:rtype: None") Units_UnitsSystem;
		 Units_UnitsSystem ();

		/****************** Units_UnitsSystem ******************/
		%feature("compactdefaultargs") Units_UnitsSystem;
		%feature("autodoc", "* Returns an instance of UnitsSystem initialized to the S.I. units system upgraded by the base system units decription file. Attempts to find the four following files: $CSF_`aName`Defaults/.aName $CSF_`aName`SiteDefaults/.aName $CSF_`aName`GroupDefaults/.aName $CSF_`aName`UserDefaults/.aName See : Resource_Manager for the description of this file.
	:param aName:
	:type aName: char *
	:param Verbose: default value is Standard_False
	:type Verbose: bool
	:rtype: None") Units_UnitsSystem;
		 Units_UnitsSystem (const char * aName,const Standard_Boolean Verbose = Standard_False);

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
%nodefaultctor Units_MathSentence;
class Units_MathSentence : public Units_Sentence {
	public:
		/****************** Units_MathSentence ******************/
		%feature("compactdefaultargs") Units_MathSentence;
		%feature("autodoc", "* Creates and returns a MathSentence object. The string <astring> describes an algebraic formula in natural language.
	:param astring:
	:type astring: char *
	:rtype: None") Units_MathSentence;
		 Units_MathSentence (const char * astring);

};


%extend Units_MathSentence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Units_ShiftedToken *
***************************/
%nodefaultctor Units_ShiftedToken;
class Units_ShiftedToken : public Units_Token {
	public:
		/****************** Creates ******************/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "* Creates and returns a token, which is a ShiftedToken.
	:rtype: opencascade::handle<Units_Token>") Creates;
		virtual opencascade::handle<Units_Token> Creates ();

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "* This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
	:param avalue:
	:type avalue: float
	:rtype: float") Divided;
		virtual Standard_Real Divided (const Standard_Real avalue);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param ashift:
	:type ashift: int
	:param alevel:
	:type alevel: int
	:rtype: void") Dump;
		virtual void Dump (const Standard_Integer ashift,const Standard_Integer alevel);

		/****************** Move ******************/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "* Returns the gap <themove>
	:rtype: float") Move;
		Standard_Real Move ();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* This virtual method is called by the Measurement methods, to compute the measurement during a conversion.
	:param avalue:
	:type avalue: float
	:rtype: float") Multiplied;
		virtual Standard_Real Multiplied (const Standard_Real avalue);

		/****************** Units_ShiftedToken ******************/
		%feature("compactdefaultargs") Units_ShiftedToken;
		%feature("autodoc", "* Creates and returns a shifted token. <aword> is a string containing the available word, <amean> gives the signification of the token, <avalue> is the numeric value of the dimension, <amove> is the gap, and <adimensions> is the dimension of the given word <aword>.
	:param aword:
	:type aword: char *
	:param amean:
	:type amean: char *
	:param avalue:
	:type avalue: float
	:param amove:
	:type amove: float
	:param adimensions:
	:type adimensions: Units_Dimensions
	:rtype: None") Units_ShiftedToken;
		 Units_ShiftedToken (const char * aword,const char * amean,const Standard_Real avalue,const Standard_Real amove,const opencascade::handle<Units_Dimensions> & adimensions);

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
%nodefaultctor Units_ShiftedUnit;
class Units_ShiftedUnit : public Units_Unit {
	public:
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param ashift:
	:type ashift: int
	:param alevel:
	:type alevel: int
	:rtype: void") Dump;
		virtual void Dump (const Standard_Integer ashift,const Standard_Integer alevel);

		/****************** Move ******************/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "* Sets the field <themove> to <amove>
	:param amove:
	:type amove: float
	:rtype: None") Move;
		void Move (const Standard_Real amove);

		/****************** Move ******************/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "* Returns the shifted value <themove>.
	:rtype: float") Move;
		Standard_Real Move ();

		/****************** Token ******************/
		%feature("compactdefaultargs") Token;
		%feature("autodoc", "* This redefined method returns a ShiftedToken object.
	:rtype: opencascade::handle<Units_Token>") Token;
		virtual opencascade::handle<Units_Token> Token ();

		/****************** Units_ShiftedUnit ******************/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "* Creates and returns a shifted unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit, <avalue> is the value in relation to the International System of Units, and <amove> is the gap in relation to another unit. //! For example Celcius dregee of temperature is an instance of ShiftedUnit with <avalue> equal to 1. and <amove> equal to 273.15.
	:param aname:
	:type aname: char *
	:param asymbol:
	:type asymbol: char *
	:param avalue:
	:type avalue: float
	:param amove:
	:type amove: float
	:param aquantity:
	:type aquantity: Units_Quantity
	:rtype: None") Units_ShiftedUnit;
		 Units_ShiftedUnit (const char * aname,const char * asymbol,const Standard_Real avalue,const Standard_Real amove,const opencascade::handle<Units_Quantity> & aquantity);

		/****************** Units_ShiftedUnit ******************/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "* Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit.
	:param aname:
	:type aname: char *
	:param asymbol:
	:type asymbol: char *
	:rtype: None") Units_ShiftedUnit;
		 Units_ShiftedUnit (const char * aname,const char * asymbol);

		/****************** Units_ShiftedUnit ******************/
		%feature("compactdefaultargs") Units_ShiftedUnit;
		%feature("autodoc", "* Creates and returns a unit. <aname> is the name of the unit.
	:param aname:
	:type aname: char *
	:rtype: None") Units_ShiftedUnit;
		 Units_ShiftedUnit (const char * aname);

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
%nodefaultctor Units_UnitSentence;
class Units_UnitSentence : public Units_Sentence {
	public:
		/****************** Analyse ******************/
		%feature("compactdefaultargs") Analyse;
		%feature("autodoc", "* Analyzes the sequence of tokens created by the constructor to find the true significance of each token.
	:rtype: None") Analyse;
		void Analyse ();

		/****************** SetUnits ******************/
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "* For each token which represents a unit, finds in the sequence of physical quantities all the characteristics of the unit found.
	:param aquantitiessequence:
	:type aquantitiessequence: Units_QuantitiesSequence
	:rtype: None") SetUnits;
		void SetUnits (const opencascade::handle<Units_QuantitiesSequence> & aquantitiessequence);

		/****************** Units_UnitSentence ******************/
		%feature("compactdefaultargs") Units_UnitSentence;
		%feature("autodoc", "* Creates and returns a UnitSentence. The string <astring> describes in natural language the unit or the composed unit to be analysed.
	:param astring:
	:type astring: char *
	:rtype: None") Units_UnitSentence;
		 Units_UnitSentence (const char * astring);

		/****************** Units_UnitSentence ******************/
		%feature("compactdefaultargs") Units_UnitSentence;
		%feature("autodoc", "* Creates and returns a UnitSentence. The string <astring> describes in natural language the unit to be analysed. The sequence of physical quantities <asequenceofquantities> describes the available dictionary of units you want to use.
	:param astring:
	:type astring: char *
	:param aquantitiessequence:
	:type aquantitiessequence: Units_QuantitiesSequence
	:rtype: None") Units_UnitSentence;
		 Units_UnitSentence (const char * astring,const opencascade::handle<Units_QuantitiesSequence> & aquantitiessequence);

};


%extend Units_UnitSentence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Units_UnitsLexicon *
***************************/
%nodefaultctor Units_UnitsLexicon;
class Units_UnitsLexicon : public Units_Lexicon {
	public:
		/****************** Creates ******************/
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "* Reads the files <afilename1> and <afilename2> to create a sequence of tokens stored in <thesequenceoftokens>.
	:param amode: default value is Standard_True
	:type amode: bool
	:rtype: None") Creates;
		void Creates (const Standard_Boolean amode = Standard_True);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Useful for debugging.
	:rtype: None") Dump;
		void Dump ();

		/****************** Units_UnitsLexicon ******************/
		%feature("compactdefaultargs") Units_UnitsLexicon;
		%feature("autodoc", "* Returns an empty instance of UnitsLexicon
	:rtype: None") Units_UnitsLexicon;
		 Units_UnitsLexicon ();

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


