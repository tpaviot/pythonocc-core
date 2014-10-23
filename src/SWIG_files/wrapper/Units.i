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
%module (package="OCC") Units

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

%include Units_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(units) Units;
%nodefaultctor Units;
class Units {
	public:
		%feature("autodoc", "	* Defines the location of the file containing all the information useful in creating the dictionary of all the units known to the system.

	:param afile:
	:type afile: char *
	:rtype: void
") UnitsFile;
		static void UnitsFile (const char * afile);
		%feature("autodoc", "	* Defines the location of the file containing the lexicon useful in manipulating composite units.

	:param afile:
	:type afile: char *
	:rtype: void
") LexiconFile;
		static void LexiconFile (const char * afile);
		%feature("autodoc", "	* Returns a unique instance of the dictionary of units. If <amode> is True, then it forces the recomputation of the dictionary of units.

	:param amode: default value is Standard_False
	:type amode: bool
	:rtype: Handle_Units_UnitsDictionary
") DictionaryOfUnits;
		static Handle_Units_UnitsDictionary DictionaryOfUnits (const Standard_Boolean amode = Standard_False);
		%feature("autodoc", "	* Returns a unique quantity instance corresponding to <aquantity>.

	:param aquantity:
	:type aquantity: char *
	:rtype: Handle_Units_Quantity
") Quantity;
		static Handle_Units_Quantity Quantity (const char * aquantity);
		%feature("autodoc", "	* Returns the first quantity string founded from the unit <aUnit>.

	:param aunit:
	:type aunit: char *
	:rtype: char *
") FirstQuantity;
		static char * FirstQuantity (const char * aunit);
		%feature("autodoc", "	* Returns a unique instance of the Units_Lexicon. If <amode> is True, it forces the recomputation of the dictionary of units, and by consequence the completion of the Units_Lexicon.

	:param amode: default value is Standard_True
	:type amode: bool
	:rtype: Handle_Units_Lexicon
") LexiconUnits;
		static Handle_Units_Lexicon LexiconUnits (const Standard_Boolean amode = Standard_True);
		%feature("autodoc", "	* Return a unique instance of LexiconFormula.

	:rtype: Handle_Units_Lexicon
") LexiconFormula;
		static Handle_Units_Lexicon LexiconFormula ();
		%feature("autodoc", "	* Returns always the same instance of Dimensions.

	:rtype: Handle_Units_Dimensions
") NullDimensions;
		static Handle_Units_Dimensions NullDimensions ();
		%feature("autodoc", "	* Converts <avalue> expressed in <afirstunit> into the <asecondunit>.

	:param avalue:
	:type avalue: float
	:param afirstunit:
	:type afirstunit: char *
	:param asecondunit:
	:type asecondunit: char *
	:rtype: float
") Convert;
		static Standard_Real Convert (const Standard_Real avalue,const char * afirstunit,const char * asecondunit);
		%feature("autodoc", "	:param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:rtype: float
") ToSI;
		static Standard_Real ToSI (const Standard_Real aData,const char * aUnit);
		%feature("autodoc", "	:param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:param aDim:
	:type aDim: Handle_Units_Dimensions &
	:rtype: float
") ToSI;
		static Standard_Real ToSI (const Standard_Real aData,const char * aUnit,Handle_Units_Dimensions & aDim);
		%feature("autodoc", "	:param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:rtype: float
") FromSI;
		static Standard_Real FromSI (const Standard_Real aData,const char * aUnit);
		%feature("autodoc", "	:param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:param aDim:
	:type aDim: Handle_Units_Dimensions &
	:rtype: float
") FromSI;
		static Standard_Real FromSI (const Standard_Real aData,const char * aUnit,Handle_Units_Dimensions & aDim);
		%feature("autodoc", "	* return the dimension associated to the Type

	:param aType:
	:type aType: char *
	:rtype: Handle_Units_Dimensions
") Dimensions;
		static Handle_Units_Dimensions Dimensions (const char * aType);
};


%feature("shadow") Units::~Units %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Units_Explorer;
class Units_Explorer {
	public:
		%feature("autodoc", "	* Empty contructor of the class.

	:rtype: None
") Units_Explorer;
		 Units_Explorer ();
		%feature("autodoc", "	* Creates a new instance of the class, initialized with the UnitsSystem <aunitssystem>.

	:param aunitssystem:
	:type aunitssystem: Handle_Units_UnitsSystem &
	:rtype: None
") Units_Explorer;
		 Units_Explorer (const Handle_Units_UnitsSystem & aunitssystem);
		%feature("autodoc", "	* Creates a new instance of the class, initialized with the UnitsDictionary <aunitsdictionary>.

	:param aunitsdictionary:
	:type aunitsdictionary: Handle_Units_UnitsDictionary &
	:rtype: None
") Units_Explorer;
		 Units_Explorer (const Handle_Units_UnitsDictionary & aunitsdictionary);
		%feature("autodoc", "	* Creates a new instance of the class, initialized with the UnitsSystem <aunitssystem> and positioned at the quantity <aquantity>.

	:param aunitssystem:
	:type aunitssystem: Handle_Units_UnitsSystem &
	:param aquantity:
	:type aquantity: char *
	:rtype: None
") Units_Explorer;
		 Units_Explorer (const Handle_Units_UnitsSystem & aunitssystem,const char * aquantity);
		%feature("autodoc", "	* Creates a new instance of the class, initialized with the UnitsDictionary <aunitsdictionary> and positioned at the quantity <aquantity>.

	:param aunitsdictionary:
	:type aunitsdictionary: Handle_Units_UnitsDictionary &
	:param aquantity:
	:type aquantity: char *
	:rtype: None
") Units_Explorer;
		 Units_Explorer (const Handle_Units_UnitsDictionary & aunitsdictionary,const char * aquantity);
		%feature("autodoc", "	* Initializes the instance of the class with the UnitsSystem <aunitssystem>.

	:param aunitssystem:
	:type aunitssystem: Handle_Units_UnitsSystem &
	:rtype: None
") Init;
		void Init (const Handle_Units_UnitsSystem & aunitssystem);
		%feature("autodoc", "	* Initializes the instance of the class with the UnitsDictionary <aunitsdictionary>.

	:param aunitsdictionary:
	:type aunitsdictionary: Handle_Units_UnitsDictionary &
	:rtype: None
") Init;
		void Init (const Handle_Units_UnitsDictionary & aunitsdictionary);
		%feature("autodoc", "	* Initializes the instance of the class with the UnitsSystem <aunitssystem> and positioned at the quantity <aquantity>.

	:param aunitssystem:
	:type aunitssystem: Handle_Units_UnitsSystem &
	:param aquantity:
	:type aquantity: char *
	:rtype: None
") Init;
		void Init (const Handle_Units_UnitsSystem & aunitssystem,const char * aquantity);
		%feature("autodoc", "	* Initializes the instance of the class with the UnitsDictionary <aunitsdictionary> and positioned at the quantity <aquantity>.

	:param aunitsdictionary:
	:type aunitsdictionary: Handle_Units_UnitsDictionary &
	:param aquantity:
	:type aquantity: char *
	:rtype: None
") Init;
		void Init (const Handle_Units_UnitsDictionary & aunitsdictionary,const char * aquantity);
		%feature("autodoc", "	* Returns True if there is another Quantity to explore, False otherwise.

	:rtype: bool
") MoreQuantity;
		Standard_Boolean MoreQuantity ();
		%feature("autodoc", "	* Sets the next Quantity current.

	:rtype: None
") NextQuantity;
		void NextQuantity ();
		%feature("autodoc", "	* Returns the name of the current Quantity.

	:rtype: TCollection_AsciiString
") Quantity;
		TCollection_AsciiString Quantity ();
		%feature("autodoc", "	* Returns True if there is another Unit to explore, False otherwise.

	:rtype: bool
") MoreUnit;
		Standard_Boolean MoreUnit ();
		%feature("autodoc", "	* Sets the next Unit current.

	:rtype: None
") NextUnit;
		void NextUnit ();
		%feature("autodoc", "	* Returns the name of the current unit.

	:rtype: TCollection_AsciiString
") Unit;
		TCollection_AsciiString Unit ();
		%feature("autodoc", "	* If the units system to explore is a user system, returns True if the current unit is active, False otherwise.  If the units system to explore is the units dictionary, returns True if the current unit is the S.I. unit.

	:rtype: bool
") IsActive;
		Standard_Boolean IsActive ();
};


%feature("shadow") Units_Explorer::~Units_Explorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_Explorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Units_Lexicon;
class Units_Lexicon : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Creates an empty instance of Lexicon.

	:rtype: None
") Units_Lexicon;
		 Units_Lexicon ();
		%feature("autodoc", "	* Reads the file <afilename> to create a sequence of tokens stored in <thesequenceoftokens>.

	:param afilename:
	:type afilename: char *
	:rtype: None
") Creates;
		void Creates (const char * afilename);
		%feature("autodoc", "	* Returns the first item of the sequence of tokens.

	:rtype: Handle_Units_TokensSequence
") Sequence;
		Handle_Units_TokensSequence Sequence ();
		%feature("autodoc", "	* Returns in a AsciiString from TCollection the name of the file.

	:rtype: TCollection_AsciiString
") FileName;
		TCollection_AsciiString FileName ();
		%feature("autodoc", "	* Returns true if the file has not changed since the creation of the Lexicon object. Returns false otherwise.

	:rtype: bool
") UpToDate;
		virtual Standard_Boolean UpToDate ();
		%feature("autodoc", "	* Adds to the lexicon a new token with <aword>, <amean>, <avalue> as arguments. If there is already a token with the field <theword> equal to <aword>, the existing token is updated.

	:param aword:
	:type aword: char *
	:param amean:
	:type amean: char *
	:param avalue:
	:type avalue: float
	:rtype: None
") AddToken;
		void AddToken (const char * aword,const char * amean,const Standard_Real avalue);
		%feature("autodoc", "	* Useful for debugging.

	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") Units_Lexicon::~Units_Lexicon %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_Lexicon {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_Lexicon {
	Handle_Units_Lexicon GetHandle() {
	return *(Handle_Units_Lexicon*) &$self;
	}
};

%nodefaultctor Handle_Units_Lexicon;
class Handle_Units_Lexicon : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Units_Lexicon();
        Handle_Units_Lexicon(const Handle_Units_Lexicon &aHandle);
        Handle_Units_Lexicon(const Units_Lexicon *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_Lexicon DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_Lexicon {
    Units_Lexicon* GetObject() {
    return (Units_Lexicon*)$self->Access();
    }
};
%feature("shadow") Handle_Units_Lexicon::~Handle_Units_Lexicon %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_Lexicon {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_Measurement;
class Units_Measurement {
	public:
		%feature("autodoc", "	* It is the empty constructor of the class.

	:rtype: None
") Units_Measurement;
		 Units_Measurement ();
		%feature("autodoc", "	* Returns an instance of this class. <avalue> defines the measurement, and <atoken> the token which defines the unit used.

	:param avalue:
	:type avalue: float
	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: None
") Units_Measurement;
		 Units_Measurement (const Standard_Real avalue,const Handle_Units_Token & atoken);
		%feature("autodoc", "	* Returns an instance of this class. <avalue> defines the measurement, and <aunit> the unit used, described in natural language.

	:param avalue:
	:type avalue: float
	:param aunit:
	:type aunit: char *
	:rtype: None
") Units_Measurement;
		 Units_Measurement (const Standard_Real avalue,const char * aunit);
		%feature("autodoc", "	* Converts (if possible) the measurement object into another unit. <aunit> must have the same dimensionality as the unit contained in the token <thetoken>.

	:param aunit:
	:type aunit: char *
	:rtype: None
") Convert;
		void Convert (const char * aunit);
		%feature("autodoc", "	* Returns a Measurement object with the integer value of the measurement contained in <self>.

	:rtype: Units_Measurement
") Integer;
		Units_Measurement Integer ();
		%feature("autodoc", "	* Returns a Measurement object with the fractional value of the measurement contained in <self>.

	:rtype: Units_Measurement
") Fractional;
		Units_Measurement Fractional ();
		%feature("autodoc", "	* Returns the value of the measurement.

	:rtype: float
") Measurement;
		Standard_Real Measurement ();
		%feature("autodoc", "	* Returns the token contained in <self>.

	:rtype: Handle_Units_Token
") Token;
		Handle_Units_Token Token ();
		%feature("autodoc", "	* Returns (if it is possible) a measurement which is the addition of <self> and <ameasurement>. The chosen returned unit is the unit of <self>.

	:param ameasurement:
	:type ameasurement: Units_Measurement &
	:rtype: Units_Measurement
") Add;
		Units_Measurement Add (const Units_Measurement & ameasurement);
		%feature("autodoc", "	:param ameasurement:
	:type ameasurement: Units_Measurement &
	:rtype: Units_Measurement
") operator+;
		Units_Measurement operator + (const Units_Measurement & ameasurement);
		%feature("autodoc", "	* Returns (if it is possible) a measurement which is the subtraction of <self> and <ameasurement>. The chosen returned unit is the unit of <self>.

	:param ameasurement:
	:type ameasurement: Units_Measurement &
	:rtype: Units_Measurement
") Subtract;
		Units_Measurement Subtract (const Units_Measurement & ameasurement);
		%feature("autodoc", "	:param ameasurement:
	:type ameasurement: Units_Measurement &
	:rtype: Units_Measurement
") operator-;
		Units_Measurement operator - (const Units_Measurement & ameasurement);
		%feature("autodoc", "	* Returns a measurement which is the multiplication of <self> and <ameasurement>.

	:param ameasurement:
	:type ameasurement: Units_Measurement &
	:rtype: Units_Measurement
") Multiply;
		Units_Measurement Multiply (const Units_Measurement & ameasurement);
		%feature("autodoc", "	:param ameasurement:
	:type ameasurement: Units_Measurement &
	:rtype: Units_Measurement
") operator*;
		Units_Measurement operator * (const Units_Measurement & ameasurement);
		%feature("autodoc", "	* Returns a measurement which is the multiplication of <self> with the value <avalue>.

	:param avalue:
	:type avalue: float
	:rtype: Units_Measurement
") Multiply;
		Units_Measurement Multiply (const Standard_Real avalue);
		%feature("autodoc", "	:param avalue:
	:type avalue: float
	:rtype: Units_Measurement
") operator*;
		Units_Measurement operator * (const Standard_Real avalue);
		%feature("autodoc", "	* Returns a measurement which is the division of <self> by <ameasurement>.

	:param ameasurement:
	:type ameasurement: Units_Measurement &
	:rtype: Units_Measurement
") Divide;
		Units_Measurement Divide (const Units_Measurement & ameasurement);
		%feature("autodoc", "	:param ameasurement:
	:type ameasurement: Units_Measurement &
	:rtype: Units_Measurement
") operator/;
		Units_Measurement operator / (const Units_Measurement & ameasurement);
		%feature("autodoc", "	* Returns a measurement which is the division of <self> by the constant <avalue>.

	:param avalue:
	:type avalue: float
	:rtype: Units_Measurement
") Divide;
		Units_Measurement Divide (const Standard_Real avalue);
		%feature("autodoc", "	:param avalue:
	:type avalue: float
	:rtype: Units_Measurement
") operator/;
		Units_Measurement operator / (const Standard_Real avalue);
		%feature("autodoc", "	* Returns a measurement which is <self> powered <anexponent>.

	:param anexponent:
	:type anexponent: float
	:rtype: Units_Measurement
") Power;
		Units_Measurement Power (const Standard_Real anexponent);
		%feature("autodoc", "	:rtype: bool
") HasToken;
		Standard_Boolean HasToken ();
		%feature("autodoc", "	* Useful for debugging.

	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") Units_Measurement::~Units_Measurement %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_Measurement {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Units_QtsSequence;
class Units_QtsSequence : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Units_QtsSequence;
		 Units_QtsSequence ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Units_QtsSequence &
	:rtype: Units_QtsSequence
") Assign;
		const Units_QtsSequence & Assign (const Units_QtsSequence & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Units_QtsSequence &
	:rtype: Units_QtsSequence
") operator=;
		const Units_QtsSequence & operator = (const Units_QtsSequence & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Units_Quantity &
	:rtype: None
") Append;
		void Append (const Handle_Units_Quantity & T);
		%feature("autodoc", "	:param S:
	:type S: Units_QtsSequence &
	:rtype: None
") Append;
		void Append (Units_QtsSequence & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Units_Quantity &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Units_Quantity & T);
		%feature("autodoc", "	:param S:
	:type S: Units_QtsSequence &
	:rtype: None
") Prepend;
		void Prepend (Units_QtsSequence & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Units_Quantity &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Units_Quantity & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Units_QtsSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Units_QtsSequence & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Units_Quantity &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Units_Quantity & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Units_QtsSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Units_QtsSequence & S);
		%feature("autodoc", "	:rtype: Handle_Units_Quantity
") First;
		const Handle_Units_Quantity & First ();
		%feature("autodoc", "	:rtype: Handle_Units_Quantity
") Last;
		const Handle_Units_Quantity & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Units_QtsSequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Units_QtsSequence & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Units_Quantity
") Value;
		const Handle_Units_Quantity & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Units_Quantity &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Units_Quantity & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Units_Quantity
") ChangeValue;
		Handle_Units_Quantity & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Units_QtsSequence::~Units_QtsSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_QtsSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Units_QuantitiesSequence;
class Units_QuantitiesSequence : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Units_QuantitiesSequence;
		 Units_QuantitiesSequence ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Units_Quantity &
	:rtype: None
") Append;
		void Append (const Handle_Units_Quantity & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Units_QuantitiesSequence &
	:rtype: None
") Append;
		void Append (const Handle_Units_QuantitiesSequence & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Units_Quantity &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Units_Quantity & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Units_QuantitiesSequence &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Units_QuantitiesSequence & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Units_Quantity &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_Quantity & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Units_QuantitiesSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_QuantitiesSequence & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Units_Quantity &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_Quantity & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Units_QuantitiesSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_QuantitiesSequence & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Units_QuantitiesSequence
") Split;
		Handle_Units_QuantitiesSequence Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Units_Quantity &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Units_Quantity & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Units_Quantity
") Value;
		const Handle_Units_Quantity & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Units_Quantity
") ChangeValue;
		Handle_Units_Quantity & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Units_QtsSequence
") Sequence;
		const Units_QtsSequence & Sequence ();
		%feature("autodoc", "	:rtype: Units_QtsSequence
") ChangeSequence;
		Units_QtsSequence & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Units_QuantitiesSequence
") ShallowCopy;
		Handle_Units_QuantitiesSequence ShallowCopy ();
};


%feature("shadow") Units_QuantitiesSequence::~Units_QuantitiesSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_QuantitiesSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_QuantitiesSequence {
	Handle_Units_QuantitiesSequence GetHandle() {
	return *(Handle_Units_QuantitiesSequence*) &$self;
	}
};

%nodefaultctor Handle_Units_QuantitiesSequence;
class Handle_Units_QuantitiesSequence : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Units_QuantitiesSequence();
        Handle_Units_QuantitiesSequence(const Handle_Units_QuantitiesSequence &aHandle);
        Handle_Units_QuantitiesSequence(const Units_QuantitiesSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_QuantitiesSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_QuantitiesSequence {
    Units_QuantitiesSequence* GetObject() {
    return (Units_QuantitiesSequence*)$self->Access();
    }
};
%feature("shadow") Handle_Units_QuantitiesSequence::~Handle_Units_QuantitiesSequence %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_QuantitiesSequence {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_Sentence;
class Units_Sentence {
	public:
		%feature("autodoc", "	* Creates and returns a Sentence, by analyzing the string <astring> with the lexicon <alexicon>.

	:param alexicon:
	:type alexicon: Handle_Units_Lexicon &
	:param astring:
	:type astring: char *
	:rtype: None
") Units_Sentence;
		 Units_Sentence (const Handle_Units_Lexicon & alexicon,const char * astring);
		%feature("autodoc", "	* For each constant encountered, sets the value.

	:rtype: None
") SetConstants;
		void SetConstants ();
		%feature("autodoc", "	* Returns <thesequenceoftokens>.

	:rtype: Handle_Units_TokensSequence
") Sequence;
		Handle_Units_TokensSequence Sequence ();
		%feature("autodoc", "	* Sets the field <thesequenceoftokens> to <asequenceoftokens>.

	:param asequenceoftokens:
	:type asequenceoftokens: Handle_Units_TokensSequence &
	:rtype: None
") Sequence;
		void Sequence (const Handle_Units_TokensSequence & asequenceoftokens);
		%feature("autodoc", "	* Computes and returns in a token the result of the expression.

	:rtype: Handle_Units_Token
") Evaluate;
		Handle_Units_Token Evaluate ();
		%feature("autodoc", "	* Return True if number of created tokens > 0 (i.e creation of sentence is succesfull)

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Useful for debugging.

	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") Units_Sentence::~Units_Sentence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_Sentence {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Units_SequenceNodeOfQtsSequence;
class Units_SequenceNodeOfQtsSequence : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Units_Quantity &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Units_SequenceNodeOfQtsSequence;
		 Units_SequenceNodeOfQtsSequence (const Handle_Units_Quantity & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Units_Quantity
") Value;
		Handle_Units_Quantity & Value ();
};


%feature("shadow") Units_SequenceNodeOfQtsSequence::~Units_SequenceNodeOfQtsSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_SequenceNodeOfQtsSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_SequenceNodeOfQtsSequence {
	Handle_Units_SequenceNodeOfQtsSequence GetHandle() {
	return *(Handle_Units_SequenceNodeOfQtsSequence*) &$self;
	}
};

%nodefaultctor Handle_Units_SequenceNodeOfQtsSequence;
class Handle_Units_SequenceNodeOfQtsSequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Units_SequenceNodeOfQtsSequence();
        Handle_Units_SequenceNodeOfQtsSequence(const Handle_Units_SequenceNodeOfQtsSequence &aHandle);
        Handle_Units_SequenceNodeOfQtsSequence(const Units_SequenceNodeOfQtsSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_SequenceNodeOfQtsSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_SequenceNodeOfQtsSequence {
    Units_SequenceNodeOfQtsSequence* GetObject() {
    return (Units_SequenceNodeOfQtsSequence*)$self->Access();
    }
};
%feature("shadow") Handle_Units_SequenceNodeOfQtsSequence::~Handle_Units_SequenceNodeOfQtsSequence %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_SequenceNodeOfQtsSequence {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_SequenceNodeOfTksSequence;
class Units_SequenceNodeOfTksSequence : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Units_Token &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Units_SequenceNodeOfTksSequence;
		 Units_SequenceNodeOfTksSequence (const Handle_Units_Token & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Units_Token
") Value;
		Handle_Units_Token & Value ();
};


%feature("shadow") Units_SequenceNodeOfTksSequence::~Units_SequenceNodeOfTksSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_SequenceNodeOfTksSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_SequenceNodeOfTksSequence {
	Handle_Units_SequenceNodeOfTksSequence GetHandle() {
	return *(Handle_Units_SequenceNodeOfTksSequence*) &$self;
	}
};

%nodefaultctor Handle_Units_SequenceNodeOfTksSequence;
class Handle_Units_SequenceNodeOfTksSequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Units_SequenceNodeOfTksSequence();
        Handle_Units_SequenceNodeOfTksSequence(const Handle_Units_SequenceNodeOfTksSequence &aHandle);
        Handle_Units_SequenceNodeOfTksSequence(const Units_SequenceNodeOfTksSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_SequenceNodeOfTksSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_SequenceNodeOfTksSequence {
    Units_SequenceNodeOfTksSequence* GetObject() {
    return (Units_SequenceNodeOfTksSequence*)$self->Access();
    }
};
%feature("shadow") Handle_Units_SequenceNodeOfTksSequence::~Handle_Units_SequenceNodeOfTksSequence %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_SequenceNodeOfTksSequence {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_SequenceNodeOfUtsSequence;
class Units_SequenceNodeOfUtsSequence : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Units_Unit &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Units_SequenceNodeOfUtsSequence;
		 Units_SequenceNodeOfUtsSequence (const Handle_Units_Unit & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Units_Unit
") Value;
		Handle_Units_Unit & Value ();
};


%feature("shadow") Units_SequenceNodeOfUtsSequence::~Units_SequenceNodeOfUtsSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_SequenceNodeOfUtsSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_SequenceNodeOfUtsSequence {
	Handle_Units_SequenceNodeOfUtsSequence GetHandle() {
	return *(Handle_Units_SequenceNodeOfUtsSequence*) &$self;
	}
};

%nodefaultctor Handle_Units_SequenceNodeOfUtsSequence;
class Handle_Units_SequenceNodeOfUtsSequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Units_SequenceNodeOfUtsSequence();
        Handle_Units_SequenceNodeOfUtsSequence(const Handle_Units_SequenceNodeOfUtsSequence &aHandle);
        Handle_Units_SequenceNodeOfUtsSequence(const Units_SequenceNodeOfUtsSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_SequenceNodeOfUtsSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_SequenceNodeOfUtsSequence {
    Units_SequenceNodeOfUtsSequence* GetObject() {
    return (Units_SequenceNodeOfUtsSequence*)$self->Access();
    }
};
%feature("shadow") Handle_Units_SequenceNodeOfUtsSequence::~Handle_Units_SequenceNodeOfUtsSequence %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_SequenceNodeOfUtsSequence {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_TksSequence;
class Units_TksSequence : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Units_TksSequence;
		 Units_TksSequence ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Units_TksSequence &
	:rtype: Units_TksSequence
") Assign;
		const Units_TksSequence & Assign (const Units_TksSequence & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Units_TksSequence &
	:rtype: Units_TksSequence
") operator=;
		const Units_TksSequence & operator = (const Units_TksSequence & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Units_Token &
	:rtype: None
") Append;
		void Append (const Handle_Units_Token & T);
		%feature("autodoc", "	:param S:
	:type S: Units_TksSequence &
	:rtype: None
") Append;
		void Append (Units_TksSequence & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Units_Token &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Units_Token & T);
		%feature("autodoc", "	:param S:
	:type S: Units_TksSequence &
	:rtype: None
") Prepend;
		void Prepend (Units_TksSequence & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Units_Token &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Units_Token & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Units_TksSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Units_TksSequence & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Units_Token &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Units_Token & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Units_TksSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Units_TksSequence & S);
		%feature("autodoc", "	:rtype: Handle_Units_Token
") First;
		const Handle_Units_Token & First ();
		%feature("autodoc", "	:rtype: Handle_Units_Token
") Last;
		const Handle_Units_Token & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Units_TksSequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Units_TksSequence & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Units_Token
") Value;
		const Handle_Units_Token & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Units_Token &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Units_Token & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Units_Token
") ChangeValue;
		Handle_Units_Token & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Units_TksSequence::~Units_TksSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_TksSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Units_Token;
class Units_Token : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Creates and returns a empty token.

	:rtype: None
") Units_Token;
		 Units_Token ();
		%feature("autodoc", "	* Creates and returns a token. <aword> is a string containing the available word.

	:param aword:
	:type aword: char *
	:rtype: None
") Units_Token;
		 Units_Token (const char * aword);
		%feature("autodoc", "	* Creates and returns a token. <atoken> is copied in the returned token.

	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: None
") Units_Token;
		 Units_Token (const Handle_Units_Token & atoken);
		%feature("autodoc", "	* Creates and returns a token. <aword> is a string containing the available word and <amean> gives the signification of the token.

	:param aword:
	:type aword: char *
	:param amean:
	:type amean: char *
	:rtype: None
") Units_Token;
		 Units_Token (const char * aword,const char * amean);
		%feature("autodoc", "	* Creates and returns a token. <aword> is a string containing the available word, <amean> gives the signification of the token and <avalue> is the numeric value of the dimension.

	:param aword:
	:type aword: char *
	:param amean:
	:type amean: char *
	:param avalue:
	:type avalue: float
	:rtype: None
") Units_Token;
		 Units_Token (const char * aword,const char * amean,const Standard_Real avalue);
		%feature("autodoc", "	* Creates and returns a token. <aword> is a string containing the available word, <amean> gives the signification of the token, <avalue> is the numeric value of the dimension, and <adimensions> is the dimension of the given word <aword>.

	:param aword:
	:type aword: char *
	:param amean:
	:type amean: char *
	:param avalue:
	:type avalue: float
	:param adimension:
	:type adimension: Handle_Units_Dimensions &
	:rtype: None
") Units_Token;
		 Units_Token (const char * aword,const char * amean,const Standard_Real avalue,const Handle_Units_Dimensions & adimension);
		%feature("autodoc", "	* Creates and returns a token, which is a ShiftedToken.

	:rtype: Handle_Units_Token
") Creates;
		virtual Handle_Units_Token Creates ();
		%feature("autodoc", "	* Returns the length of the word.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	* Returns the string <theword>

	:rtype: TCollection_AsciiString
") Word;
		TCollection_AsciiString Word ();
		%feature("autodoc", "	* Sets the field <theword> to <aword>.

	:param aword:
	:type aword: char *
	:rtype: None
") Word;
		void Word (const char * aword);
		%feature("autodoc", "	* Returns the significance of the word <theword>, which is in the field <themean>.

	:rtype: TCollection_AsciiString
") Mean;
		TCollection_AsciiString Mean ();
		%feature("autodoc", "	* Sets the field <themean> to <amean>.

	:param amean:
	:type amean: char *
	:rtype: None
") Mean;
		void Mean (const char * amean);
		%feature("autodoc", "	* Returns the value stored in the field <thevalue>.

	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("autodoc", "	* Sets the field <thevalue> to <avalue>.

	:param avalue:
	:type avalue: float
	:rtype: None
") Value;
		void Value (const Standard_Real avalue);
		%feature("autodoc", "	* Returns the dimensions of the token <thedimensions>.

	:rtype: Handle_Units_Dimensions
") Dimensions;
		Handle_Units_Dimensions Dimensions ();
		%feature("autodoc", "	* Sets the field <thedimensions> to <adimensions>.

	:param adimensions:
	:type adimensions: Handle_Units_Dimensions &
	:rtype: None
") Dimensions;
		void Dimensions (const Handle_Units_Dimensions & adimensions);
		%feature("autodoc", "	* Updates the token <self> with the additional signification <amean> by concatenation of the two strings <themean> and <amean>. If the two significations are the same , an information message is written in the output device.

	:param amean:
	:type amean: char *
	:rtype: None
") Update;
		void Update (const char * amean);
		%feature("autodoc", "	:param aninteger:
	:type aninteger: Standard_Integer
	:rtype: Handle_Units_Token
") Add;
		Handle_Units_Token Add (const Standard_Integer aninteger);
		%feature("autodoc", "	* Returns a token which is the addition of <self> and another token <atoken>. The addition is possible if and only if the dimensions are the same.

	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: Handle_Units_Token
") Add;
		Handle_Units_Token Add (const Handle_Units_Token & atoken);
		%feature("autodoc", "	* Returns a token which is the subtraction of <self> and another token <atoken>. The subtraction is possible if and only if the dimensions are the same.

	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: Handle_Units_Token
") Subtract;
		Handle_Units_Token Subtract (const Handle_Units_Token & atoken);
		%feature("autodoc", "	* Returns a token which is the product of <self> and another token <atoken>.

	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: Handle_Units_Token
") Multiply;
		Handle_Units_Token Multiply (const Handle_Units_Token & atoken);
		%feature("autodoc", "	* This virtual method is called by the Measurement methods, to compute the measurement during a conversion.

	:param avalue:
	:type avalue: float
	:rtype: float
") Multiplied;
		virtual Standard_Real Multiplied (const Standard_Real avalue);
		%feature("autodoc", "	* Returns a token which is the division of <self> by another token <atoken>.

	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: Handle_Units_Token
") Divide;
		Handle_Units_Token Divide (const Handle_Units_Token & atoken);
		%feature("autodoc", "	* This virtual method is called by the Measurement methods, to compute the measurement during a conversion.

	:param avalue:
	:type avalue: float
	:rtype: float
") Divided;
		virtual Standard_Real Divided (const Standard_Real avalue);
		%feature("autodoc", "	* Returns a token which is <self> to the power of another token <atoken>. The computation is possible only if <atoken> is a dimensionless constant.

	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: Handle_Units_Token
") Power;
		Handle_Units_Token Power (const Handle_Units_Token & atoken);
		%feature("autodoc", "	* Returns a token which is <self> to the power of <anexponent>.

	:param anexponent:
	:type anexponent: float
	:rtype: Handle_Units_Token
") Power;
		Handle_Units_Token Power (const Standard_Real anexponent);
		%feature("autodoc", "	* Returns true if the field <theword> and the string <astring> are the same, false otherwise.

	:param astring:
	:type astring: char *
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const char * astring);
		%feature("autodoc", "	* Returns true if the field <theword> and the string <theword> contained in the token <atoken> are the same, false otherwise.

	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Handle_Units_Token & atoken);
		%feature("autodoc", "	* Returns false if the field <theword> and the string <astring> are the same, true otherwise.

	:param astring:
	:type astring: char *
	:rtype: bool
") IsNotEqual;
		Standard_Boolean IsNotEqual (const char * astring);
		%feature("autodoc", "	* Returns false if the field <theword> and the string <theword> contained in the token <atoken> are the same, true otherwise.

	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: bool
") IsNotEqual;
		Standard_Boolean IsNotEqual (const Handle_Units_Token & atoken);
		%feature("autodoc", "	* Returns true if the field <theword> is strictly contained at the beginning of the string <astring>, false otherwise.

	:param astring:
	:type astring: char *
	:rtype: bool
") IsLessOrEqual;
		Standard_Boolean IsLessOrEqual (const char * astring);
		%feature("autodoc", "	* Returns false if the field <theword> is strictly contained at the beginning of the string <astring>, true otherwise.

	:param astring:
	:type astring: char *
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const char * astring);
		%feature("autodoc", "	* Returns false if the field <theword> is strictly contained at the beginning of the string <astring>, true otherwise.

	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const Handle_Units_Token & atoken);
		%feature("autodoc", "	* Returns true if the string <astring> is strictly contained at the beginning of the field <theword> false otherwise.

	:param atoken:
	:type atoken: Handle_Units_Token &
	:rtype: bool
") IsGreaterOrEqual;
		Standard_Boolean IsGreaterOrEqual (const Handle_Units_Token & atoken);
		%feature("autodoc", "	* Destroies the Token

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "	* Useful for debugging

	:param ashift:
	:type ashift: Standard_Integer
	:param alevel:
	:type alevel: Standard_Integer
	:rtype: void
") Dump;
		virtual void Dump (const Standard_Integer ashift,const Standard_Integer alevel);
};


%feature("shadow") Units_Token::~Units_Token %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_Token {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_Token {
	Handle_Units_Token GetHandle() {
	return *(Handle_Units_Token*) &$self;
	}
};

%nodefaultctor Handle_Units_Token;
class Handle_Units_Token : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Units_Token();
        Handle_Units_Token(const Handle_Units_Token &aHandle);
        Handle_Units_Token(const Units_Token *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_Token DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_Token {
    Units_Token* GetObject() {
    return (Units_Token*)$self->Access();
    }
};
%feature("shadow") Handle_Units_Token::~Handle_Units_Token %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_Token {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_TokensSequence;
class Units_TokensSequence : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Units_TokensSequence;
		 Units_TokensSequence ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Units_Token &
	:rtype: None
") Append;
		void Append (const Handle_Units_Token & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Units_TokensSequence &
	:rtype: None
") Append;
		void Append (const Handle_Units_TokensSequence & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Units_Token &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Units_Token & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Units_TokensSequence &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Units_TokensSequence & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Units_Token &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_Token & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Units_TokensSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_TokensSequence & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Units_Token &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_Token & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Units_TokensSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_TokensSequence & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Units_TokensSequence
") Split;
		Handle_Units_TokensSequence Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Units_Token &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Units_Token & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Units_Token
") Value;
		const Handle_Units_Token & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Units_Token
") ChangeValue;
		Handle_Units_Token & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Units_TksSequence
") Sequence;
		const Units_TksSequence & Sequence ();
		%feature("autodoc", "	:rtype: Units_TksSequence
") ChangeSequence;
		Units_TksSequence & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Units_TokensSequence
") ShallowCopy;
		Handle_Units_TokensSequence ShallowCopy ();
};


%feature("shadow") Units_TokensSequence::~Units_TokensSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_TokensSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_TokensSequence {
	Handle_Units_TokensSequence GetHandle() {
	return *(Handle_Units_TokensSequence*) &$self;
	}
};

%nodefaultctor Handle_Units_TokensSequence;
class Handle_Units_TokensSequence : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Units_TokensSequence();
        Handle_Units_TokensSequence(const Handle_Units_TokensSequence &aHandle);
        Handle_Units_TokensSequence(const Units_TokensSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_TokensSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_TokensSequence {
    Units_TokensSequence* GetObject() {
    return (Units_TokensSequence*)$self->Access();
    }
};
%feature("shadow") Handle_Units_TokensSequence::~Handle_Units_TokensSequence %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_TokensSequence {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_Unit;
class Units_Unit : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit, and <avalue> is the value in relation to the International System of Units.

	:param aname:
	:type aname: char *
	:param asymbol:
	:type asymbol: char *
	:param avalue:
	:type avalue: float
	:param aquantity:
	:type aquantity: Handle_Units_Quantity &
	:rtype: None
") Units_Unit;
		 Units_Unit (const char * aname,const char * asymbol,const Standard_Real avalue,const Handle_Units_Quantity & aquantity);
		%feature("autodoc", "	* Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit.

	:param aname:
	:type aname: char *
	:param asymbol:
	:type asymbol: char *
	:rtype: None
") Units_Unit;
		 Units_Unit (const char * aname,const char * asymbol);
		%feature("autodoc", "	* Creates and returns a unit. <aname> is the name of the unit.

	:param aname:
	:type aname: char *
	:rtype: None
") Units_Unit;
		 Units_Unit (const char * aname);
		%feature("autodoc", "	* Returns the name of the unit <thename>

	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();
		%feature("autodoc", "	* Adds a new symbol <asymbol> attached to <self>.

	:param asymbol:
	:type asymbol: char *
	:rtype: None
") Symbol;
		void Symbol (const char * asymbol);
		%feature("autodoc", "	* Returns the value in relation with the International System of Units.

	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("autodoc", "	* Returns <thequantity> contained in <self>.

	:rtype: Handle_Units_Quantity
") Quantity;
		Handle_Units_Quantity Quantity ();
		%feature("autodoc", "	* Returns the sequence of symbols <thesymbolssequence>

	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") SymbolsSequence;
		Handle_TColStd_HSequenceOfHAsciiString SymbolsSequence ();
		%feature("autodoc", "	* Sets the value <avalue> to <self>.

	:param avalue:
	:type avalue: float
	:rtype: None
") Value;
		void Value (const Standard_Real avalue);
		%feature("autodoc", "	* Sets the physical Quantity <aquantity> to <self>.

	:param aquantity:
	:type aquantity: Handle_Units_Quantity &
	:rtype: None
") Quantity;
		void Quantity (const Handle_Units_Quantity & aquantity);
		%feature("autodoc", "	* Starting with <self>, returns a new Token object.

	:rtype: Handle_Units_Token
") Token;
		virtual Handle_Units_Token Token ();
		%feature("autodoc", "	* Compares all the symbols linked within <self> with the name of <atoken>, and returns True if there is one symbol equal to the name, False otherwise.

	:param astring:
	:type astring: char *
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const char * astring);
		%feature("autodoc", "	* Useful for debugging

	:param ashift:
	:type ashift: Standard_Integer
	:param alevel:
	:type alevel: Standard_Integer
	:rtype: void
") Dump;
		virtual void Dump (const Standard_Integer ashift,const Standard_Integer alevel);
};


%feature("shadow") Units_Unit::~Units_Unit %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_Unit {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_Unit {
	Handle_Units_Unit GetHandle() {
	return *(Handle_Units_Unit*) &$self;
	}
};

%nodefaultctor Handle_Units_Unit;
class Handle_Units_Unit : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Units_Unit();
        Handle_Units_Unit(const Handle_Units_Unit &aHandle);
        Handle_Units_Unit(const Units_Unit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_Unit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_Unit {
    Units_Unit* GetObject() {
    return (Units_Unit*)$self->Access();
    }
};
%feature("shadow") Handle_Units_Unit::~Handle_Units_Unit %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_Unit {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_UnitsDictionary;
class Units_UnitsDictionary : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Returns an empty instance of UnitsDictionary.

	:rtype: None
") Units_UnitsDictionary;
		 Units_UnitsDictionary ();
		%feature("autodoc", "	* Returns a UnitsDictionary object which contains the sequence of all the units you want to consider, physical quantity by physical quantity.

	:param afilename:
	:type afilename: char *
	:rtype: None
") Creates;
		void Creates (const char * afilename);
		%feature("autodoc", "	* Returns the head of the sequence of physical quantities.

	:rtype: Handle_Units_QuantitiesSequence
") Sequence;
		Handle_Units_QuantitiesSequence Sequence ();
		%feature("autodoc", "	* Returns true if there has been no modification of the file Units.dat since the creation of the dictionary object, false otherwise.

	:rtype: bool
") UpToDate;
		Standard_Boolean UpToDate ();
		%feature("autodoc", "	* Returns for <aquantity> the active unit.

	:param aquantity:
	:type aquantity: char *
	:rtype: TCollection_AsciiString
") ActiveUnit;
		TCollection_AsciiString ActiveUnit (const char * aquantity);
		%feature("autodoc", "	* Dumps only the sequence of quantities without the units if <alevel> is equal to zero, and for each quantity all the units stored if <alevel> is equal to one.

	:param alevel:
	:type alevel: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer alevel);
		%feature("autodoc", "	* Dumps for a designated physical dimensions <adimensions> all the previously stored units.

	:param adimensions:
	:type adimensions: Handle_Units_Dimensions &
	:rtype: None
") Dump;
		void Dump (const Handle_Units_Dimensions & adimensions);
};


%feature("shadow") Units_UnitsDictionary::~Units_UnitsDictionary %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_UnitsDictionary {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_UnitsDictionary {
	Handle_Units_UnitsDictionary GetHandle() {
	return *(Handle_Units_UnitsDictionary*) &$self;
	}
};

%nodefaultctor Handle_Units_UnitsDictionary;
class Handle_Units_UnitsDictionary : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Units_UnitsDictionary();
        Handle_Units_UnitsDictionary(const Handle_Units_UnitsDictionary &aHandle);
        Handle_Units_UnitsDictionary(const Units_UnitsDictionary *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_UnitsDictionary DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_UnitsDictionary {
    Units_UnitsDictionary* GetObject() {
    return (Units_UnitsDictionary*)$self->Access();
    }
};
%feature("shadow") Handle_Units_UnitsDictionary::~Handle_Units_UnitsDictionary %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_UnitsDictionary {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_UnitsSequence;
class Units_UnitsSequence : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Units_UnitsSequence;
		 Units_UnitsSequence ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Units_Unit &
	:rtype: None
") Append;
		void Append (const Handle_Units_Unit & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Units_UnitsSequence &
	:rtype: None
") Append;
		void Append (const Handle_Units_UnitsSequence & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Units_Unit &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Units_Unit & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Units_UnitsSequence &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Units_UnitsSequence & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Units_Unit &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_Unit & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Units_UnitsSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_UnitsSequence & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Units_Unit &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_Unit & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Units_UnitsSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_UnitsSequence & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Units_UnitsSequence
") Split;
		Handle_Units_UnitsSequence Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Units_Unit &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Units_Unit & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Units_Unit
") Value;
		const Handle_Units_Unit & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Units_Unit
") ChangeValue;
		Handle_Units_Unit & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Units_UtsSequence
") Sequence;
		const Units_UtsSequence & Sequence ();
		%feature("autodoc", "	:rtype: Units_UtsSequence
") ChangeSequence;
		Units_UtsSequence & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Units_UnitsSequence
") ShallowCopy;
		Handle_Units_UnitsSequence ShallowCopy ();
};


%feature("shadow") Units_UnitsSequence::~Units_UnitsSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_UnitsSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_UnitsSequence {
	Handle_Units_UnitsSequence GetHandle() {
	return *(Handle_Units_UnitsSequence*) &$self;
	}
};

%nodefaultctor Handle_Units_UnitsSequence;
class Handle_Units_UnitsSequence : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Units_UnitsSequence();
        Handle_Units_UnitsSequence(const Handle_Units_UnitsSequence &aHandle);
        Handle_Units_UnitsSequence(const Units_UnitsSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_UnitsSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_UnitsSequence {
    Units_UnitsSequence* GetObject() {
    return (Units_UnitsSequence*)$self->Access();
    }
};
%feature("shadow") Handle_Units_UnitsSequence::~Handle_Units_UnitsSequence %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_UnitsSequence {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_UnitsSystem;
class Units_UnitsSystem : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Returns an instance of UnitsSystem initialized to the S.I. units system.

	:rtype: None
") Units_UnitsSystem;
		 Units_UnitsSystem ();
		%feature("autodoc", "	* Returns an instance of UnitsSystem initialized to the S.I. units system upgraded by the base system units decription //!	 	file. Attempts to find the four following files: $CSF_`aName`Defaults/.aName $CSF_`aName`SiteDefaults/.aName $CSF_`aName`GroupDefaults/.aName $CSF_`aName`UserDefaults/.aName //!		See : Resource_Manager for the description of this file.

	:param aName:
	:type aName: char *
	:param Verbose: default value is Standard_False
	:type Verbose: bool
	:rtype: None
") Units_UnitsSystem;
		 Units_UnitsSystem (const char * aName,const Standard_Boolean Verbose = Standard_False);
		%feature("autodoc", "	* Returns the sequence of refined quantities.

	:rtype: Handle_Units_QuantitiesSequence
") QuantitiesSequence;
		Handle_Units_QuantitiesSequence QuantitiesSequence ();
		%feature("autodoc", "	* Returns a sequence of integer in correspondance with the sequence of quantities, which indicates, for each redefined quantity, the index into the sequence of units, of the active unit.

	:rtype: Handle_TColStd_HSequenceOfInteger
") ActiveUnitsSequence;
		Handle_TColStd_HSequenceOfInteger ActiveUnitsSequence ();
		%feature("autodoc", "	* Specifies for <aquantity> the unit <aunit> used.

	:param aquantity:
	:type aquantity: char *
	:param aunit:
	:type aunit: char *
	:rtype: None
") Specify;
		void Specify (const char * aquantity,const char * aunit);
		%feature("autodoc", "	* Removes for <aquantity> the unit <aunit> used.

	:param aquantity:
	:type aquantity: char *
	:param aunit:
	:type aunit: char *
	:rtype: None
") Remove;
		void Remove (const char * aquantity,const char * aunit);
		%feature("autodoc", "	* Specifies for <aquantity> the unit <aunit> used.

	:param aquantity:
	:type aquantity: char *
	:param aunit:
	:type aunit: char *
	:rtype: None
") Activate;
		void Activate (const char * aquantity,const char * aunit);
		%feature("autodoc", "	* Activates the first unit of all defined system quantities

	:rtype: None
") Activates;
		void Activates ();
		%feature("autodoc", "	* Returns for <aquantity> the active unit.

	:param aquantity:
	:type aquantity: char *
	:rtype: TCollection_AsciiString
") ActiveUnit;
		TCollection_AsciiString ActiveUnit (const char * aquantity);
		%feature("autodoc", "	* Converts a real value <avalue> from the unit <aunit> belonging to the physical dimensions <aquantity> to the corresponding unit of the user system.

	:param aquantity:
	:type aquantity: char *
	:param avalue:
	:type avalue: float
	:param aunit:
	:type aunit: char *
	:rtype: float
") ConvertValueToUserSystem;
		Standard_Real ConvertValueToUserSystem (const char * aquantity,const Standard_Real avalue,const char * aunit);
		%feature("autodoc", "	* Converts the real value <avalue> from the S.I. system of units to the user system of units. <aquantity> is the physical dimensions of the measurement.

	:param aquantity:
	:type aquantity: char *
	:param avalue:
	:type avalue: float
	:rtype: float
") ConvertSIValueToUserSystem;
		Standard_Real ConvertSIValueToUserSystem (const char * aquantity,const Standard_Real avalue);
		%feature("autodoc", "	* Converts the real value <avalue> from the user system of units to the S.I. system of units. <aquantity> is the physical dimensions of the measurement.

	:param aquantity:
	:type aquantity: char *
	:param avalue:
	:type avalue: float
	:rtype: float
") ConvertUserSystemValueToSI;
		Standard_Real ConvertUserSystemValueToSI (const char * aquantity,const Standard_Real avalue);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	* Returns True if no units has been defined in the system.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
};


%feature("shadow") Units_UnitsSystem::~Units_UnitsSystem %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_UnitsSystem {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_UnitsSystem {
	Handle_Units_UnitsSystem GetHandle() {
	return *(Handle_Units_UnitsSystem*) &$self;
	}
};

%nodefaultctor Handle_Units_UnitsSystem;
class Handle_Units_UnitsSystem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Units_UnitsSystem();
        Handle_Units_UnitsSystem(const Handle_Units_UnitsSystem &aHandle);
        Handle_Units_UnitsSystem(const Units_UnitsSystem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_UnitsSystem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_UnitsSystem {
    Units_UnitsSystem* GetObject() {
    return (Units_UnitsSystem*)$self->Access();
    }
};
%feature("shadow") Handle_Units_UnitsSystem::~Handle_Units_UnitsSystem %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_UnitsSystem {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_UtsSequence;
class Units_UtsSequence : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Units_UtsSequence;
		 Units_UtsSequence ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Units_UtsSequence &
	:rtype: Units_UtsSequence
") Assign;
		const Units_UtsSequence & Assign (const Units_UtsSequence & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Units_UtsSequence &
	:rtype: Units_UtsSequence
") operator=;
		const Units_UtsSequence & operator = (const Units_UtsSequence & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Units_Unit &
	:rtype: None
") Append;
		void Append (const Handle_Units_Unit & T);
		%feature("autodoc", "	:param S:
	:type S: Units_UtsSequence &
	:rtype: None
") Append;
		void Append (Units_UtsSequence & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Units_Unit &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Units_Unit & T);
		%feature("autodoc", "	:param S:
	:type S: Units_UtsSequence &
	:rtype: None
") Prepend;
		void Prepend (Units_UtsSequence & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Units_Unit &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Units_Unit & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Units_UtsSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Units_UtsSequence & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Units_Unit &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Units_Unit & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Units_UtsSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Units_UtsSequence & S);
		%feature("autodoc", "	:rtype: Handle_Units_Unit
") First;
		const Handle_Units_Unit & First ();
		%feature("autodoc", "	:rtype: Handle_Units_Unit
") Last;
		const Handle_Units_Unit & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Units_UtsSequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Units_UtsSequence & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Units_Unit
") Value;
		const Handle_Units_Unit & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Units_Unit &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Units_Unit & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Units_Unit
") ChangeValue;
		Handle_Units_Unit & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Units_UtsSequence::~Units_UtsSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_UtsSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Units_MathSentence;
class Units_MathSentence : public Units_Sentence {
	public:
		%feature("autodoc", "	* Creates and returns a MathSentence object. The string <astring> describes an algebraic formula in natural language.

	:param astring:
	:type astring: char *
	:rtype: None
") Units_MathSentence;
		 Units_MathSentence (const char * astring);
};


%feature("shadow") Units_MathSentence::~Units_MathSentence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_MathSentence {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Units_ShiftedToken;
class Units_ShiftedToken : public Units_Token {
	public:
		%feature("autodoc", "	* Creates and returns a shifted token. <aword> is a string containing the available word, <amean> gives the signification of the token, <avalue> is the numeric value of the dimension, <amove> is the gap, and <adimensions> is the dimension of the given word <aword>.

	:param aword:
	:type aword: char *
	:param amean:
	:type amean: char *
	:param avalue:
	:type avalue: float
	:param amove:
	:type amove: float
	:param adimensions:
	:type adimensions: Handle_Units_Dimensions &
	:rtype: None
") Units_ShiftedToken;
		 Units_ShiftedToken (const char * aword,const char * amean,const Standard_Real avalue,const Standard_Real amove,const Handle_Units_Dimensions & adimensions);
		%feature("autodoc", "	* Creates and returns a token, which is a ShiftedToken.

	:rtype: Handle_Units_Token
") Creates;
		virtual Handle_Units_Token Creates ();
		%feature("autodoc", "	* Returns the gap <themove>

	:rtype: float
") Move;
		Standard_Real Move ();
		%feature("autodoc", "	* This virtual method is called by the Measurement methods, to compute the measurement during a conversion.

	:param avalue:
	:type avalue: float
	:rtype: float
") Multiplied;
		virtual Standard_Real Multiplied (const Standard_Real avalue);
		%feature("autodoc", "	* This virtual method is called by the Measurement methods, to compute the measurement during a conversion.

	:param avalue:
	:type avalue: float
	:rtype: float
") Divided;
		virtual Standard_Real Divided (const Standard_Real avalue);
		%feature("autodoc", "	* Destroies the Token

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "	:param ashift:
	:type ashift: Standard_Integer
	:param alevel:
	:type alevel: Standard_Integer
	:rtype: void
") Dump;
		virtual void Dump (const Standard_Integer ashift,const Standard_Integer alevel);
};


%feature("shadow") Units_ShiftedToken::~Units_ShiftedToken %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_ShiftedToken {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_ShiftedToken {
	Handle_Units_ShiftedToken GetHandle() {
	return *(Handle_Units_ShiftedToken*) &$self;
	}
};

%nodefaultctor Handle_Units_ShiftedToken;
class Handle_Units_ShiftedToken : public Handle_Units_Token {

    public:
        // constructors
        Handle_Units_ShiftedToken();
        Handle_Units_ShiftedToken(const Handle_Units_ShiftedToken &aHandle);
        Handle_Units_ShiftedToken(const Units_ShiftedToken *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_ShiftedToken DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_ShiftedToken {
    Units_ShiftedToken* GetObject() {
    return (Units_ShiftedToken*)$self->Access();
    }
};
%feature("shadow") Handle_Units_ShiftedToken::~Handle_Units_ShiftedToken %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_ShiftedToken {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_ShiftedUnit;
class Units_ShiftedUnit : public Units_Unit {
	public:
		%feature("autodoc", "	* Creates and returns a shifted unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit, <avalue> is the value in relation to the International System of Units, and <amove> is the gap in relation to another unit.  For example Celcius dregee of temperature is an instance of ShiftedUnit with <avalue> equal to 1. and <amove> equal to 273.15.

	:param aname:
	:type aname: char *
	:param asymbol:
	:type asymbol: char *
	:param avalue:
	:type avalue: float
	:param amove:
	:type amove: float
	:param aquantity:
	:type aquantity: Handle_Units_Quantity &
	:rtype: None
") Units_ShiftedUnit;
		 Units_ShiftedUnit (const char * aname,const char * asymbol,const Standard_Real avalue,const Standard_Real amove,const Handle_Units_Quantity & aquantity);
		%feature("autodoc", "	* Creates and returns a unit. <aname> is the name of the unit, <asymbol> is the usual abbreviation of the unit.

	:param aname:
	:type aname: char *
	:param asymbol:
	:type asymbol: char *
	:rtype: None
") Units_ShiftedUnit;
		 Units_ShiftedUnit (const char * aname,const char * asymbol);
		%feature("autodoc", "	* Creates and returns a unit. <aname> is the name of the unit.

	:param aname:
	:type aname: char *
	:rtype: None
") Units_ShiftedUnit;
		 Units_ShiftedUnit (const char * aname);
		%feature("autodoc", "	* Sets the field <themove> to <amove>

	:param amove:
	:type amove: float
	:rtype: None
") Move;
		void Move (const Standard_Real amove);
		%feature("autodoc", "	* Returns the shifted value <themove>.

	:rtype: float
") Move;
		Standard_Real Move ();
		%feature("autodoc", "	* This redefined method returns a ShiftedToken object.

	:rtype: Handle_Units_Token
") Token;
		virtual Handle_Units_Token Token ();
		%feature("autodoc", "	:param ashift:
	:type ashift: Standard_Integer
	:param alevel:
	:type alevel: Standard_Integer
	:rtype: void
") Dump;
		virtual void Dump (const Standard_Integer ashift,const Standard_Integer alevel);
};


%feature("shadow") Units_ShiftedUnit::~Units_ShiftedUnit %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_ShiftedUnit {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_ShiftedUnit {
	Handle_Units_ShiftedUnit GetHandle() {
	return *(Handle_Units_ShiftedUnit*) &$self;
	}
};

%nodefaultctor Handle_Units_ShiftedUnit;
class Handle_Units_ShiftedUnit : public Handle_Units_Unit {

    public:
        // constructors
        Handle_Units_ShiftedUnit();
        Handle_Units_ShiftedUnit(const Handle_Units_ShiftedUnit &aHandle);
        Handle_Units_ShiftedUnit(const Units_ShiftedUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_ShiftedUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_ShiftedUnit {
    Units_ShiftedUnit* GetObject() {
    return (Units_ShiftedUnit*)$self->Access();
    }
};
%feature("shadow") Handle_Units_ShiftedUnit::~Handle_Units_ShiftedUnit %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_ShiftedUnit {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Units_UnitSentence;
class Units_UnitSentence : public Units_Sentence {
	public:
		%feature("autodoc", "	* Creates and returns a UnitSentence. The string <astring> describes in natural language the unit or the composed unit to be analysed.

	:param astring:
	:type astring: char *
	:rtype: None
") Units_UnitSentence;
		 Units_UnitSentence (const char * astring);
		%feature("autodoc", "	* Creates and returns a UnitSentence. The string <astring> describes in natural language the unit to be analysed. The sequence of physical quantities <asequenceofquantities> describes the available dictionary of units you want to use.

	:param astring:
	:type astring: char *
	:param aquantitiessequence:
	:type aquantitiessequence: Handle_Units_QuantitiesSequence &
	:rtype: None
") Units_UnitSentence;
		 Units_UnitSentence (const char * astring,const Handle_Units_QuantitiesSequence & aquantitiessequence);
		%feature("autodoc", "	* Analyzes the sequence of tokens created by the constructor to find the true significance of each token.

	:rtype: None
") Analyse;
		void Analyse ();
		%feature("autodoc", "	* For each token which represents a unit, finds in the sequence of physical quantities all the characteristics of the unit found.

	:param aquantitiessequence:
	:type aquantitiessequence: Handle_Units_QuantitiesSequence &
	:rtype: None
") SetUnits;
		void SetUnits (const Handle_Units_QuantitiesSequence & aquantitiessequence);
};


%feature("shadow") Units_UnitSentence::~Units_UnitSentence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_UnitSentence {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Units_UnitsLexicon;
class Units_UnitsLexicon : public Units_Lexicon {
	public:
		%feature("autodoc", "	* Returns an empty instance of UnitsLexicon

	:rtype: None
") Units_UnitsLexicon;
		 Units_UnitsLexicon ();
		%feature("autodoc", "	* Reads the files <afilename1> and <afilename2> to create a sequence of tokens stored in <thesequenceoftokens>.

	:param afilename1:
	:type afilename1: char *
	:param afilename2:
	:type afilename2: char *
	:param amode: default value is Standard_True
	:type amode: bool
	:rtype: None
") Creates;
		void Creates (const char * afilename1,const char * afilename2,const Standard_Boolean amode = Standard_True);
		%feature("autodoc", "	* Returns in a AsciiString from TCollection the name of the file.

	:rtype: TCollection_AsciiString
") FileName2;
		TCollection_AsciiString FileName2 ();
		%feature("autodoc", "	* Returns true if the file has not changed since the creation of the Lexicon object. Returns false otherwise.

	:rtype: bool
") UpToDate;
		virtual Standard_Boolean UpToDate ();
		%feature("autodoc", "	* Useful for debugging.

	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") Units_UnitsLexicon::~Units_UnitsLexicon %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Units_UnitsLexicon {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Units_UnitsLexicon {
	Handle_Units_UnitsLexicon GetHandle() {
	return *(Handle_Units_UnitsLexicon*) &$self;
	}
};

%nodefaultctor Handle_Units_UnitsLexicon;
class Handle_Units_UnitsLexicon : public Handle_Units_Lexicon {

    public:
        // constructors
        Handle_Units_UnitsLexicon();
        Handle_Units_UnitsLexicon(const Handle_Units_UnitsLexicon &aHandle);
        Handle_Units_UnitsLexicon(const Units_UnitsLexicon *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Units_UnitsLexicon DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Units_UnitsLexicon {
    Units_UnitsLexicon* GetObject() {
    return (Units_UnitsLexicon*)$self->Access();
    }
};
%feature("shadow") Handle_Units_UnitsLexicon::~Handle_Units_UnitsLexicon %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Units_UnitsLexicon {
    void _kill_pointed() {
        delete $self;
    }
};

