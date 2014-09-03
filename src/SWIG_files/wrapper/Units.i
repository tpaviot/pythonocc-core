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
		%feature("autodoc", "Args:
	afile(char *)

Returns:
	static void

Defines the location of the file containing all the  
         information useful in creating the dictionary of all  
         the units known to the system.") UnitsFile;
		static void UnitsFile (const char * afile);
		%feature("autodoc", "Args:
	afile(char *)

Returns:
	static void

Defines the location of the file containing the lexicon  
         useful in manipulating composite units.") LexiconFile;
		static void LexiconFile (const char * afile);
		%feature("autodoc", "Args:
	amode(Standard_Boolean)=Standard_False

Returns:
	static Handle_Units_UnitsDictionary

Returns a unique instance of the dictionary of units.  
         If <amode> is True, then it forces the recomputation of  
         the dictionary of units.") DictionaryOfUnits;
		static Handle_Units_UnitsDictionary DictionaryOfUnits (const Standard_Boolean amode = Standard_False);
		%feature("autodoc", "Args:
	aquantity(char *)

Returns:
	static Handle_Units_Quantity

Returns a unique quantity instance corresponding to <aquantity>.") Quantity;
		static Handle_Units_Quantity Quantity (const char * aquantity);
		%feature("autodoc", "Args:
	aunit(char *)

Returns:
	static char *

Returns the first quantity string founded from the unit <aUnit>.") FirstQuantity;
		static char * FirstQuantity (const char * aunit);
		%feature("autodoc", "Args:
	amode(Standard_Boolean)=Standard_True

Returns:
	static Handle_Units_Lexicon

Returns a unique instance of the Units_Lexicon.  
         If <amode> is True, it forces the recomputation of  
         the dictionary of units, and by consequence the  
         completion of the Units_Lexicon.") LexiconUnits;
		static Handle_Units_Lexicon LexiconUnits (const Standard_Boolean amode = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Lexicon

Return a unique instance of LexiconFormula.") LexiconFormula;
		static Handle_Units_Lexicon LexiconFormula ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Units_Dimensions

Returns always the same instance of Dimensions.") NullDimensions;
		static Handle_Units_Dimensions NullDimensions ();
		%feature("autodoc", "Args:
	avalue(Standard_Real)
	afirstunit(char *)
	asecondunit(char *)

Returns:
	static Standard_Real

Converts <avalue> expressed in <afirstunit> into the <asecondunit>.") Convert;
		static Standard_Real Convert (const Standard_Real avalue,const char * afirstunit,const char * asecondunit);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit(char *)

Returns:
	static Standard_Real

No detailed docstring for this function.") ToSI;
		static Standard_Real ToSI (const Standard_Real aData,const char * aUnit);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit(char *)
	aDim(Handle_Units_Dimensions)

Returns:
	static Standard_Real

No detailed docstring for this function.") ToSI;
		static Standard_Real ToSI (const Standard_Real aData,const char * aUnit,Handle_Units_Dimensions & aDim);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit(char *)

Returns:
	static Standard_Real

No detailed docstring for this function.") FromSI;
		static Standard_Real FromSI (const Standard_Real aData,const char * aUnit);
		%feature("autodoc", "Args:
	aData(Standard_Real)
	aUnit(char *)
	aDim(Handle_Units_Dimensions)

Returns:
	static Standard_Real

No detailed docstring for this function.") FromSI;
		static Standard_Real FromSI (const Standard_Real aData,const char * aUnit,Handle_Units_Dimensions & aDim);
		%feature("autodoc", "Args:
	aType(char *)

Returns:
	static Handle_Units_Dimensions

return the dimension associated to the Type") Dimensions;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor of the class.") Units_Explorer;
		 Units_Explorer ();
		%feature("autodoc", "Args:
	aunitssystem(Handle_Units_UnitsSystem)

Returns:
	None

Creates a new instance of the class, initialized with  
         the UnitsSystem <aunitssystem>.") Units_Explorer;
		 Units_Explorer (const Handle_Units_UnitsSystem & aunitssystem);
		%feature("autodoc", "Args:
	aunitsdictionary(Handle_Units_UnitsDictionary)

Returns:
	None

Creates a new instance of the class, initialized with  
         the UnitsDictionary <aunitsdictionary>.") Units_Explorer;
		 Units_Explorer (const Handle_Units_UnitsDictionary & aunitsdictionary);
		%feature("autodoc", "Args:
	aunitssystem(Handle_Units_UnitsSystem)
	aquantity(char *)

Returns:
	None

Creates a new instance of the class, initialized with  
         the UnitsSystem <aunitssystem> and positioned at the  
         quantity <aquantity>.") Units_Explorer;
		 Units_Explorer (const Handle_Units_UnitsSystem & aunitssystem,const char * aquantity);
		%feature("autodoc", "Args:
	aunitsdictionary(Handle_Units_UnitsDictionary)
	aquantity(char *)

Returns:
	None

Creates a  new instance of the class,  initialized with  
         the  UnitsDictionary <aunitsdictionary> and positioned  
         at the quantity <aquantity>.") Units_Explorer;
		 Units_Explorer (const Handle_Units_UnitsDictionary & aunitsdictionary,const char * aquantity);
		%feature("autodoc", "Args:
	aunitssystem(Handle_Units_UnitsSystem)

Returns:
	None

Initializes  the  instance  of  the  class  with  the  
         UnitsSystem <aunitssystem>.") Init;
		void Init (const Handle_Units_UnitsSystem & aunitssystem);
		%feature("autodoc", "Args:
	aunitsdictionary(Handle_Units_UnitsDictionary)

Returns:
	None

Initializes  the  instance  of  the  class  with  the  
         UnitsDictionary <aunitsdictionary>.") Init;
		void Init (const Handle_Units_UnitsDictionary & aunitsdictionary);
		%feature("autodoc", "Args:
	aunitssystem(Handle_Units_UnitsSystem)
	aquantity(char *)

Returns:
	None

Initializes  the  instance  of  the   class  with  the  
         UnitsSystem  <aunitssystem>  and   positioned  at  the  
         quantity <aquantity>.") Init;
		void Init (const Handle_Units_UnitsSystem & aunitssystem,const char * aquantity);
		%feature("autodoc", "Args:
	aunitsdictionary(Handle_Units_UnitsDictionary)
	aquantity(char *)

Returns:
	None

Initializes  the  instance   of  the  class  with  the  
         UnitsDictionary  <aunitsdictionary> and positioned  at  
         the quantity <aquantity>.") Init;
		void Init (const Handle_Units_UnitsDictionary & aunitsdictionary,const char * aquantity);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is another Quantity to explore,  
         False otherwise.") MoreQuantity;
		Standard_Boolean MoreQuantity ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the next Quantity current.") NextQuantity;
		void NextQuantity ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the name of the current Quantity.") Quantity;
		TCollection_AsciiString Quantity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is another Unit to explore,  
         False otherwise.") MoreUnit;
		Standard_Boolean MoreUnit ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the next Unit current.") NextUnit;
		void NextUnit ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the name of the current unit.") Unit;
		TCollection_AsciiString Unit ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

If the  units system  to  explore  is  a user  system,  
         returns True  if  the  current unit  is  active, False  
         otherwise.  
 
         If   the   units  system  to  explore  is   the  units  
         dictionary,  returns True if the  current unit is  the  
         S.I. unit.") IsActive;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty instance of Lexicon.") Units_Lexicon;
		 Units_Lexicon ();
		%feature("autodoc", "Args:
	afilename(char *)

Returns:
	None

Reads the file <afilename> to create a sequence  of tokens  
         stored in <thesequenceoftokens>.") Creates;
		void Creates (const char * afilename);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_TokensSequence

Returns the first item of the sequence of tokens.") Sequence;
		Handle_Units_TokensSequence Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns in a AsciiString from TCollection the name of the file.") FileName;
		TCollection_AsciiString FileName ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if  the  file has not  changed  since the  
         creation   of   the  Lexicon   object.   Returns false  
         otherwise.") UpToDate;
		virtual Standard_Boolean UpToDate ();
		%feature("autodoc", "Args:
	aword(char *)
	amean(char *)
	avalue(Standard_Real)

Returns:
	None

Adds to the lexicon a new token with <aword>, <amean>,  
         <avalue>  as  arguments.  If there is  already a token  
         with   the  field  <theword>  equal    to <aword>, the  
         existing token is updated.") AddToken;
		void AddToken (const char * aword,const char * amean,const Standard_Real avalue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Useful for debugging.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

It is the empty constructor of the class.") Units_Measurement;
		 Units_Measurement ();
		%feature("autodoc", "Args:
	avalue(Standard_Real)
	atoken(Handle_Units_Token)

Returns:
	None

Returns an instance  of this class.   <avalue> defines  
         the measurement, and <atoken>  the token which defines  
         the unit used.") Units_Measurement;
		 Units_Measurement (const Standard_Real avalue,const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	avalue(Standard_Real)
	aunit(char *)

Returns:
	None

Returns an  instance of this  class.  <avalue> defines  
         the  measurement, and <aunit> the   unit used,  
         described in natural language.") Units_Measurement;
		 Units_Measurement (const Standard_Real avalue,const char * aunit);
		%feature("autodoc", "Args:
	aunit(char *)

Returns:
	None

Converts (if   possible)  the  measurement   object into  
         another   unit.      <aunit>   must  have    the  same  
         dimensionality as  the  unit  contained in   the token  
         <thetoken>.") Convert;
		void Convert (const char * aunit);
		%feature("autodoc", "Args:
	None
Returns:
	Units_Measurement

Returns a Measurement object with the integer value of  
         the measurement contained in <self>.") Integer;
		Units_Measurement Integer ();
		%feature("autodoc", "Args:
	None
Returns:
	Units_Measurement

Returns a Measurement object with the fractional value  
         of the measurement contained in <self>.") Fractional;
		Units_Measurement Fractional ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the measurement.") Measurement;
		Standard_Real Measurement ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Token

Returns the token contained in <self>.") Token;
		Handle_Units_Token Token ();
		%feature("autodoc", "Args:
	ameasurement(Units_Measurement)

Returns:
	Units_Measurement

Returns (if it is possible) a measurement which is the  
         addition  of  <self>  and  <ameasurement>.  The   chosen  
         returned unit is the unit of <self>.") Add;
		Units_Measurement Add (const Units_Measurement & ameasurement);
		%feature("autodoc", "Args:
	ameasurement(Units_Measurement)

Returns:
	Units_Measurement

No detailed docstring for this function.") operator+;
		Units_Measurement operator + (const Units_Measurement & ameasurement);
		%feature("autodoc", "Args:
	ameasurement(Units_Measurement)

Returns:
	Units_Measurement

Returns (if it is possible) a measurement which is the  
         subtraction of  <self>  and <ameasurement>.   The chosen  
         returned unit is the unit of <self>.") Subtract;
		Units_Measurement Subtract (const Units_Measurement & ameasurement);
		%feature("autodoc", "Args:
	ameasurement(Units_Measurement)

Returns:
	Units_Measurement

No detailed docstring for this function.") operator-;
		Units_Measurement operator - (const Units_Measurement & ameasurement);
		%feature("autodoc", "Args:
	ameasurement(Units_Measurement)

Returns:
	Units_Measurement

Returns  a measurement which  is the multiplication of  
         <self> and <ameasurement>.") Multiply;
		Units_Measurement Multiply (const Units_Measurement & ameasurement);
		%feature("autodoc", "Args:
	ameasurement(Units_Measurement)

Returns:
	Units_Measurement

No detailed docstring for this function.") operator*;
		Units_Measurement operator * (const Units_Measurement & ameasurement);
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	Units_Measurement

Returns  a measurement which  is the multiplication of  
         <self> with the value  <avalue>.") Multiply;
		Units_Measurement Multiply (const Standard_Real avalue);
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	Units_Measurement

No detailed docstring for this function.") operator*;
		Units_Measurement operator * (const Standard_Real avalue);
		%feature("autodoc", "Args:
	ameasurement(Units_Measurement)

Returns:
	Units_Measurement

Returns a measurement which  is the division of  <self> by  
         <ameasurement>.") Divide;
		Units_Measurement Divide (const Units_Measurement & ameasurement);
		%feature("autodoc", "Args:
	ameasurement(Units_Measurement)

Returns:
	Units_Measurement

No detailed docstring for this function.") operator/;
		Units_Measurement operator / (const Units_Measurement & ameasurement);
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	Units_Measurement

Returns  a measurement which  is the division of <self> by  
         the constant <avalue>.") Divide;
		Units_Measurement Divide (const Standard_Real avalue);
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	Units_Measurement

No detailed docstring for this function.") operator/;
		Units_Measurement operator / (const Standard_Real avalue);
		%feature("autodoc", "Args:
	anexponent(Standard_Real)

Returns:
	Units_Measurement

Returns   a    measurement  which   is <self>    powered  
         <anexponent>.") Power;
		Units_Measurement Power (const Standard_Real anexponent);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasToken;
		Standard_Boolean HasToken ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Useful for debugging.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Units_QtsSequence;
		 Units_QtsSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Units_QtsSequence)

Returns:
	Units_QtsSequence

No detailed docstring for this function.") Assign;
		const Units_QtsSequence & Assign (const Units_QtsSequence & Other);
		%feature("autodoc", "Args:
	Other(Units_QtsSequence)

Returns:
	Units_QtsSequence

No detailed docstring for this function.") operator=;
		const Units_QtsSequence & operator = (const Units_QtsSequence & Other);
		%feature("autodoc", "Args:
	T(Handle_Units_Quantity)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Units_Quantity & T);
		%feature("autodoc", "Args:
	S(Units_QtsSequence)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Units_QtsSequence & S);
		%feature("autodoc", "Args:
	T(Handle_Units_Quantity)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Units_Quantity & T);
		%feature("autodoc", "Args:
	S(Units_QtsSequence)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Units_QtsSequence & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Units_Quantity)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Units_Quantity & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Units_QtsSequence)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Units_QtsSequence & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Units_Quantity)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Units_Quantity & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Units_QtsSequence)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Units_QtsSequence & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Quantity

No detailed docstring for this function.") First;
		const Handle_Units_Quantity & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Quantity

No detailed docstring for this function.") Last;
		const Handle_Units_Quantity & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Units_QtsSequence)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Units_QtsSequence & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Units_Quantity

No detailed docstring for this function.") Value;
		const Handle_Units_Quantity & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Units_Quantity)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Units_Quantity & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Units_Quantity

No detailed docstring for this function.") ChangeValue;
		Handle_Units_Quantity & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Units_QuantitiesSequence;
		 Units_QuantitiesSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Units_Quantity)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Units_Quantity & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Units_QuantitiesSequence)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Units_QuantitiesSequence & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Units_Quantity)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Units_Quantity & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Units_QuantitiesSequence)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Units_QuantitiesSequence & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Units_Quantity)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_Quantity & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Units_QuantitiesSequence)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_QuantitiesSequence & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Units_Quantity)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_Quantity & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Units_QuantitiesSequence)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_QuantitiesSequence & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Units_QuantitiesSequence

No detailed docstring for this function.") Split;
		Handle_Units_QuantitiesSequence Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Units_Quantity)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Units_Quantity & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Units_Quantity

No detailed docstring for this function.") Value;
		const Handle_Units_Quantity & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Units_Quantity

No detailed docstring for this function.") ChangeValue;
		Handle_Units_Quantity & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Units_QtsSequence

No detailed docstring for this function.") Sequence;
		const Units_QtsSequence & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Units_QtsSequence

No detailed docstring for this function.") ChangeSequence;
		Units_QtsSequence & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_QuantitiesSequence

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	alexicon(Handle_Units_Lexicon)
	astring(char *)

Returns:
	None

Creates and  returns  a   Sentence, by  analyzing  the  
         string <astring> with the lexicon <alexicon>.") Units_Sentence;
		 Units_Sentence (const Handle_Units_Lexicon & alexicon,const char * astring);
		%feature("autodoc", "Args:
	None
Returns:
	None

For each constant encountered, sets the value.") SetConstants;
		void SetConstants ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_TokensSequence

Returns <thesequenceoftokens>.") Sequence;
		Handle_Units_TokensSequence Sequence ();
		%feature("autodoc", "Args:
	asequenceoftokens(Handle_Units_TokensSequence)

Returns:
	None

Sets the field <thesequenceoftokens> to <asequenceoftokens>.") Sequence;
		void Sequence (const Handle_Units_TokensSequence & asequenceoftokens);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Token

Computes and  returns in a   token the result  of  the  
         expression.") Evaluate;
		Handle_Units_Token Evaluate ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Return True if number of created tokens > 0  
         (i.e creation of sentence is succesfull)") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Useful for debugging.") Dump;
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
		%feature("autodoc", "Args:
	I(Handle_Units_Quantity)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Units_SequenceNodeOfQtsSequence;
		 Units_SequenceNodeOfQtsSequence (const Handle_Units_Quantity & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Quantity

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Units_Token)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Units_SequenceNodeOfTksSequence;
		 Units_SequenceNodeOfTksSequence (const Handle_Units_Token & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Token

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Units_Unit)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Units_SequenceNodeOfUtsSequence;
		 Units_SequenceNodeOfUtsSequence (const Handle_Units_Unit & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Unit

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Units_TksSequence;
		 Units_TksSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Units_TksSequence)

Returns:
	Units_TksSequence

No detailed docstring for this function.") Assign;
		const Units_TksSequence & Assign (const Units_TksSequence & Other);
		%feature("autodoc", "Args:
	Other(Units_TksSequence)

Returns:
	Units_TksSequence

No detailed docstring for this function.") operator=;
		const Units_TksSequence & operator = (const Units_TksSequence & Other);
		%feature("autodoc", "Args:
	T(Handle_Units_Token)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Units_Token & T);
		%feature("autodoc", "Args:
	S(Units_TksSequence)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Units_TksSequence & S);
		%feature("autodoc", "Args:
	T(Handle_Units_Token)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Units_Token & T);
		%feature("autodoc", "Args:
	S(Units_TksSequence)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Units_TksSequence & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Units_Token)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Units_Token & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Units_TksSequence)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Units_TksSequence & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Units_Token)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Units_Token & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Units_TksSequence)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Units_TksSequence & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Token

No detailed docstring for this function.") First;
		const Handle_Units_Token & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Token

No detailed docstring for this function.") Last;
		const Handle_Units_Token & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Units_TksSequence)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Units_TksSequence & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Units_Token

No detailed docstring for this function.") Value;
		const Handle_Units_Token & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Units_Token)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Units_Token & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Units_Token

No detailed docstring for this function.") ChangeValue;
		Handle_Units_Token & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates and returns a empty token.") Units_Token;
		 Units_Token ();
		%feature("autodoc", "Args:
	aword(char *)

Returns:
	None

Creates  and returns  a token.   <aword>  is  a string  
         containing the available word.") Units_Token;
		 Units_Token (const char * aword);
		%feature("autodoc", "Args:
	atoken(Handle_Units_Token)

Returns:
	None

Creates and returns a  token.  <atoken> is  copied  in  
         the returned token.") Units_Token;
		 Units_Token (const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	aword(char *)
	amean(char *)

Returns:
	None

Creates  and  returns a  token.   <aword> is  a string  
         containing the  available word and  <amean>  gives the  
         signification of the token.") Units_Token;
		 Units_Token (const char * aword,const char * amean);
		%feature("autodoc", "Args:
	aword(char *)
	amean(char *)
	avalue(Standard_Real)

Returns:
	None

Creates   and  returns a  token.   <aword> is a string  
         containing   the available  word,  <amean> gives   the  
         signification of the token and <avalue> is the numeric  
         value of the dimension.") Units_Token;
		 Units_Token (const char * aword,const char * amean,const Standard_Real avalue);
		%feature("autodoc", "Args:
	aword(char *)
	amean(char *)
	avalue(Standard_Real)
	adimension(Handle_Units_Dimensions)

Returns:
	None

Creates and returns  a  token.  <aword> is   a  string  
         containing the   available   word, <amean>   gives the  
         signification of  the  token, <avalue> is  the numeric  
         value  of the dimension,  and <adimensions>   is   the  
         dimension of the given word <aword>.") Units_Token;
		 Units_Token (const char * aword,const char * amean,const Standard_Real avalue,const Handle_Units_Dimensions & adimension);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Units_Token

Creates and returns a  token, which is a ShiftedToken.") Creates;
		virtual Handle_Units_Token Creates ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the length of the word.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the string <theword>") Word;
		TCollection_AsciiString Word ();
		%feature("autodoc", "Args:
	aword(char *)

Returns:
	None

Sets the field <theword> to <aword>.") Word;
		void Word (const char * aword);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the significance of the word  <theword>, which  
         is in the field <themean>.") Mean;
		TCollection_AsciiString Mean ();
		%feature("autodoc", "Args:
	amean(char *)

Returns:
	None

Sets the field <themean> to <amean>.") Mean;
		void Mean (const char * amean);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value stored in the field <thevalue>.") Value;
		Standard_Real Value ();
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	None

Sets the field <thevalue> to <avalue>.") Value;
		void Value (const Standard_Real avalue);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Dimensions

Returns the dimensions of the token <thedimensions>.") Dimensions;
		Handle_Units_Dimensions Dimensions ();
		%feature("autodoc", "Args:
	adimensions(Handle_Units_Dimensions)

Returns:
	None

Sets the field <thedimensions> to <adimensions>.") Dimensions;
		void Dimensions (const Handle_Units_Dimensions & adimensions);
		%feature("autodoc", "Args:
	amean(char *)

Returns:
	None

Updates     the  token  <self>    with  the   additional  
         signification  <amean> by  concatenation   of the  two  
         strings   <themean>    and   <amean>.   If    the  two  
         significations are  the same  , an information message  
         is written in the output device.") Update;
		void Update (const char * amean);
		%feature("autodoc", "Args:
	aninteger(Standard_Integer)

Returns:
	Handle_Units_Token

No detailed docstring for this function.") Add;
		Handle_Units_Token Add (const Standard_Integer aninteger);
		%feature("autodoc", "Args:
	atoken(Handle_Units_Token)

Returns:
	Handle_Units_Token

Returns a  token which is  the addition  of  <self>  and  
         another token <atoken>. The  addition  is  possible if  
         and only if the dimensions are the same.") Add;
		Handle_Units_Token Add (const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	atoken(Handle_Units_Token)

Returns:
	Handle_Units_Token

Returns a token  which is the  subtraction of <self> and  
         another token <atoken>. The subtraction is possible if  
         and only if the dimensions are the same.") Subtract;
		Handle_Units_Token Subtract (const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	atoken(Handle_Units_Token)

Returns:
	Handle_Units_Token

Returns a  token  which  is the  product of   <self> and  
         another token <atoken>.") Multiply;
		Handle_Units_Token Multiply (const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	virtual Standard_Real

This   virtual method is   called  by  the Measurement  
         methods,  to  compute    the   measurement   during  a  
         conversion.") Multiplied;
		virtual Standard_Real Multiplied (const Standard_Real avalue);
		%feature("autodoc", "Args:
	atoken(Handle_Units_Token)

Returns:
	Handle_Units_Token

Returns a token which is the division of <self> by another  
         token <atoken>.") Divide;
		Handle_Units_Token Divide (const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	virtual Standard_Real

This  virtual  method  is  called by  the  Measurement  
         methods,   to   compute   the measurement  during    a  
         conversion.") Divided;
		virtual Standard_Real Divided (const Standard_Real avalue);
		%feature("autodoc", "Args:
	atoken(Handle_Units_Token)

Returns:
	Handle_Units_Token

Returns a token which is <self> to the power  of another  
         token <atoken>.  The computation  is possible  only if  
         <atoken> is a dimensionless constant.") Power;
		Handle_Units_Token Power (const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	anexponent(Standard_Real)

Returns:
	Handle_Units_Token

Returns a token which is <self> to the power  of <anexponent>.") Power;
		Handle_Units_Token Power (const Standard_Real anexponent);
		%feature("autodoc", "Args:
	astring(char *)

Returns:
	Standard_Boolean

Returns true if  the  field <theword> and  the  string  
         <astring> are the same, false otherwise.") IsEqual;
		Standard_Boolean IsEqual (const char * astring);
		%feature("autodoc", "Args:
	atoken(Handle_Units_Token)

Returns:
	Standard_Boolean

Returns true  if the  field  <theword> and  the string  
         <theword> contained  in  the  token <atoken>  are  the  
         same, false otherwise.") IsEqual;
		Standard_Boolean IsEqual (const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	astring(char *)

Returns:
	Standard_Boolean

Returns false if  the field <theword>  and the  string  
         <astring> are the same, true otherwise.") IsNotEqual;
		Standard_Boolean IsNotEqual (const char * astring);
		%feature("autodoc", "Args:
	atoken(Handle_Units_Token)

Returns:
	Standard_Boolean

Returns false if  the field <theword>  and the  string  
         <theword> contained  in the  token  <atoken>  are  the  
         same, true otherwise.") IsNotEqual;
		Standard_Boolean IsNotEqual (const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	astring(char *)

Returns:
	Standard_Boolean

Returns   true  if the   field <theword>  is  strictly  
         contained at  the beginning  of the string  <astring>,  
         false otherwise.") IsLessOrEqual;
		Standard_Boolean IsLessOrEqual (const char * astring);
		%feature("autodoc", "Args:
	astring(char *)

Returns:
	Standard_Boolean

Returns false  if   the field   <theword> is  strictly  
         contained at  the  beginning  of the string <astring>,  
         true otherwise.") IsGreater;
		Standard_Boolean IsGreater (const char * astring);
		%feature("autodoc", "Args:
	atoken(Handle_Units_Token)

Returns:
	Standard_Boolean

Returns false  if   the field   <theword> is  strictly  
         contained at  the  beginning  of the string <astring>,  
         true otherwise.") IsGreater;
		Standard_Boolean IsGreater (const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	atoken(Handle_Units_Token)

Returns:
	Standard_Boolean

Returns true  if  the string <astring>   is   strictly  
         contained   at the  beginning  of  the field <theword>  
         false otherwise.") IsGreaterOrEqual;
		Standard_Boolean IsGreaterOrEqual (const Handle_Units_Token & atoken);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Destroies the Token") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	ashift(Standard_Integer)
	alevel(Standard_Integer)

Returns:
	virtual void

Useful for debugging") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Units_TokensSequence;
		 Units_TokensSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Units_Token)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Units_Token & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Units_TokensSequence)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Units_TokensSequence & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Units_Token)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Units_Token & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Units_TokensSequence)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Units_TokensSequence & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Units_Token)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_Token & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Units_TokensSequence)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_TokensSequence & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Units_Token)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_Token & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Units_TokensSequence)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_TokensSequence & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Units_TokensSequence

No detailed docstring for this function.") Split;
		Handle_Units_TokensSequence Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Units_Token)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Units_Token & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Units_Token

No detailed docstring for this function.") Value;
		const Handle_Units_Token & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Units_Token

No detailed docstring for this function.") ChangeValue;
		Handle_Units_Token & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Units_TksSequence

No detailed docstring for this function.") Sequence;
		const Units_TksSequence & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Units_TksSequence

No detailed docstring for this function.") ChangeSequence;
		Units_TksSequence & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_TokensSequence

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	aname(char *)
	asymbol(char *)
	avalue(Standard_Real)
	aquantity(Handle_Units_Quantity)

Returns:
	None

Creates  and returns a  unit.  <aname> is  the name of  
         the  unit, <asymbol> is the  usual abbreviation of the  
         unit,  and  <avalue> is the  value in relation to  the  
         International System of Units.") Units_Unit;
		 Units_Unit (const char * aname,const char * asymbol,const Standard_Real avalue,const Handle_Units_Quantity & aquantity);
		%feature("autodoc", "Args:
	aname(char *)
	asymbol(char *)

Returns:
	None

Creates  and returns a  unit.  <aname> is  the name of  
         the  unit, <asymbol> is the  usual abbreviation of the  
         unit.") Units_Unit;
		 Units_Unit (const char * aname,const char * asymbol);
		%feature("autodoc", "Args:
	aname(char *)

Returns:
	None

Creates  and returns a  unit.  <aname> is  the name of  
         the  unit.") Units_Unit;
		 Units_Unit (const char * aname);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the name of the unit <thename>") Name;
		TCollection_AsciiString Name ();
		%feature("autodoc", "Args:
	asymbol(char *)

Returns:
	None

Adds a new symbol <asymbol> attached to <self>.") Symbol;
		void Symbol (const char * asymbol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the  value in relation  with the International  
         System of Units.") Value;
		Standard_Real Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Quantity

Returns <thequantity> contained in <self>.") Quantity;
		Handle_Units_Quantity Quantity ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns the sequence of symbols <thesymbolssequence>") SymbolsSequence;
		Handle_TColStd_HSequenceOfHAsciiString SymbolsSequence ();
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	None

Sets the value <avalue> to <self>.") Value;
		void Value (const Standard_Real avalue);
		%feature("autodoc", "Args:
	aquantity(Handle_Units_Quantity)

Returns:
	None

Sets the physical Quantity <aquantity> to <self>.") Quantity;
		void Quantity (const Handle_Units_Quantity & aquantity);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Units_Token

Starting with <self>, returns a new Token object.") Token;
		virtual Handle_Units_Token Token ();
		%feature("autodoc", "Args:
	astring(char *)

Returns:
	Standard_Boolean

Compares all the symbols  linked  within <self> with the  
         name of <atoken>,  and returns  True  if there is  one  
         symbol equal to the name, False otherwise.") IsEqual;
		Standard_Boolean IsEqual (const char * astring);
		%feature("autodoc", "Args:
	ashift(Standard_Integer)
	alevel(Standard_Integer)

Returns:
	virtual void

Useful for debugging") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns an empty instance of UnitsDictionary.") Units_UnitsDictionary;
		 Units_UnitsDictionary ();
		%feature("autodoc", "Args:
	afilename(char *)

Returns:
	None

Returns a  UnitsDictionary object  which  contains the  
         sequence  of all   the  units  you want to   consider,  
         physical quantity by physical quantity.") Creates;
		void Creates (const char * afilename);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_QuantitiesSequence

Returns   the  head   of   the  sequence  of  physical  
         quantities.") Sequence;
		Handle_Units_QuantitiesSequence Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there has been no  modification of the  
         file Units.dat  since the   creation of the dictionary  
         object, false otherwise.") UpToDate;
		Standard_Boolean UpToDate ();
		%feature("autodoc", "Args:
	aquantity(char *)

Returns:
	TCollection_AsciiString

Returns for <aquantity> the active unit.") ActiveUnit;
		TCollection_AsciiString ActiveUnit (const char * aquantity);
		%feature("autodoc", "Args:
	alevel(Standard_Integer)

Returns:
	None

Dumps only  the sequence   of  quantities without  the  
         units  if  <alevel> is  equal  to zero,  and  for each  
         quantity all the units stored if <alevel>  is equal to  
         one.") Dump;
		void Dump (const Standard_Integer alevel);
		%feature("autodoc", "Args:
	adimensions(Handle_Units_Dimensions)

Returns:
	None

Dumps  for a     designated  physical       dimensions  
         <adimensions> all the previously stored units.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Units_UnitsSequence;
		 Units_UnitsSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Units_Unit)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Units_Unit & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Units_UnitsSequence)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Units_UnitsSequence & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Units_Unit)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Units_Unit & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Units_UnitsSequence)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Units_UnitsSequence & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Units_Unit)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_Unit & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Units_UnitsSequence)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Units_UnitsSequence & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Units_Unit)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_Unit & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Units_UnitsSequence)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Units_UnitsSequence & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Units_UnitsSequence

No detailed docstring for this function.") Split;
		Handle_Units_UnitsSequence Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Units_Unit)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Units_Unit & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Units_Unit

No detailed docstring for this function.") Value;
		const Handle_Units_Unit & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Units_Unit

No detailed docstring for this function.") ChangeValue;
		Handle_Units_Unit & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Units_UtsSequence

No detailed docstring for this function.") Sequence;
		const Units_UtsSequence & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Units_UtsSequence

No detailed docstring for this function.") ChangeSequence;
		Units_UtsSequence & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_UnitsSequence

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns an instance of UnitsSystem initialized to the  
         S.I. units system.") Units_UnitsSystem;
		 Units_UnitsSystem ();
		%feature("autodoc", "Args:
	aName(char *)
	Verbose(Standard_Boolean)=Standard_False

Returns:
	None

Returns an instance of UnitsSystem initialized to the  
         S.I. units system upgraded by the base system units decription  
//!	 	file.  
         Attempts to find the four following files:  
         $CSF_`aName`Defaults/.aName  
         $CSF_`aName`SiteDefaults/.aName  
         $CSF_`aName`GroupDefaults/.aName  
         $CSF_`aName`UserDefaults/.aName  
//!		See : Resource_Manager for the description of this file.") Units_UnitsSystem;
		 Units_UnitsSystem (const char * aName,const Standard_Boolean Verbose = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_QuantitiesSequence

Returns the sequence of refined quantities.") QuantitiesSequence;
		Handle_Units_QuantitiesSequence QuantitiesSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfInteger

Returns a sequence of integer in correspondance with  
         the sequence of quantities, which indicates, for each  
         redefined quantity, the index into the sequence of  
         units, of the active unit.") ActiveUnitsSequence;
		Handle_TColStd_HSequenceOfInteger ActiveUnitsSequence ();
		%feature("autodoc", "Args:
	aquantity(char *)
	aunit(char *)

Returns:
	None

Specifies for <aquantity> the unit <aunit> used.") Specify;
		void Specify (const char * aquantity,const char * aunit);
		%feature("autodoc", "Args:
	aquantity(char *)
	aunit(char *)

Returns:
	None

Removes for <aquantity> the unit <aunit> used.") Remove;
		void Remove (const char * aquantity,const char * aunit);
		%feature("autodoc", "Args:
	aquantity(char *)
	aunit(char *)

Returns:
	None

Specifies for <aquantity> the unit <aunit> used.") Activate;
		void Activate (const char * aquantity,const char * aunit);
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates the first unit of all defined system quantities") Activates;
		void Activates ();
		%feature("autodoc", "Args:
	aquantity(char *)

Returns:
	TCollection_AsciiString

Returns for <aquantity> the active unit.") ActiveUnit;
		TCollection_AsciiString ActiveUnit (const char * aquantity);
		%feature("autodoc", "Args:
	aquantity(char *)
	avalue(Standard_Real)
	aunit(char *)

Returns:
	Standard_Real

Converts a real value <avalue> from the unit <aunit>  
         belonging to the physical dimensions <aquantity> to  
         the corresponding unit of the user system.") ConvertValueToUserSystem;
		Standard_Real ConvertValueToUserSystem (const char * aquantity,const Standard_Real avalue,const char * aunit);
		%feature("autodoc", "Args:
	aquantity(char *)
	avalue(Standard_Real)

Returns:
	Standard_Real

Converts the real value <avalue> from the S.I. system  
         of units to the user system of units. <aquantity> is  
         the physical dimensions of the measurement.") ConvertSIValueToUserSystem;
		Standard_Real ConvertSIValueToUserSystem (const char * aquantity,const Standard_Real avalue);
		%feature("autodoc", "Args:
	aquantity(char *)
	avalue(Standard_Real)

Returns:
	Standard_Real

Converts the real value <avalue> from the user system  
         of units to the S.I. system of units. <aquantity> is  
         the physical dimensions of the measurement.") ConvertUserSystemValueToSI;
		Standard_Real ConvertUserSystemValueToSI (const char * aquantity,const Standard_Real avalue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if no units has been defined in the system.") IsEmpty;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Units_UtsSequence;
		 Units_UtsSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Units_UtsSequence)

Returns:
	Units_UtsSequence

No detailed docstring for this function.") Assign;
		const Units_UtsSequence & Assign (const Units_UtsSequence & Other);
		%feature("autodoc", "Args:
	Other(Units_UtsSequence)

Returns:
	Units_UtsSequence

No detailed docstring for this function.") operator=;
		const Units_UtsSequence & operator = (const Units_UtsSequence & Other);
		%feature("autodoc", "Args:
	T(Handle_Units_Unit)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Units_Unit & T);
		%feature("autodoc", "Args:
	S(Units_UtsSequence)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Units_UtsSequence & S);
		%feature("autodoc", "Args:
	T(Handle_Units_Unit)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Units_Unit & T);
		%feature("autodoc", "Args:
	S(Units_UtsSequence)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Units_UtsSequence & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Units_Unit)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Units_Unit & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Units_UtsSequence)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Units_UtsSequence & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Units_Unit)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Units_Unit & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Units_UtsSequence)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Units_UtsSequence & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Unit

No detailed docstring for this function.") First;
		const Handle_Units_Unit & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Units_Unit

No detailed docstring for this function.") Last;
		const Handle_Units_Unit & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Units_UtsSequence)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Units_UtsSequence & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Units_Unit

No detailed docstring for this function.") Value;
		const Handle_Units_Unit & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Units_Unit)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Units_Unit & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Units_Unit

No detailed docstring for this function.") ChangeValue;
		Handle_Units_Unit & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	astring(char *)

Returns:
	None

Creates and returns a  MathSentence object. The string  
         <astring>  describes  an algebraic  formula in natural  
         language.") Units_MathSentence;
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
		%feature("autodoc", "Args:
	aword(char *)
	amean(char *)
	avalue(Standard_Real)
	amove(Standard_Real)
	adimensions(Handle_Units_Dimensions)

Returns:
	None

Creates and returns a  shifted   token.  <aword> is  a  
         string containing the   available word, <amean>  gives  
         the signification   of the   token,  <avalue> is   the  
         numeric value  of the  dimension, <amove> is  the gap,  
         and <adimensions> is  the dimension of the given  word  
         <aword>.") Units_ShiftedToken;
		 Units_ShiftedToken (const char * aword,const char * amean,const Standard_Real avalue,const Standard_Real amove,const Handle_Units_Dimensions & adimensions);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Units_Token

Creates and returns a  token, which is a ShiftedToken.") Creates;
		virtual Handle_Units_Token Creates ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the gap <themove>") Move;
		Standard_Real Move ();
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	virtual Standard_Real

This  virtual   method  is  called  by the Measurement  
         methods,  to   compute  the   measurement    during  a  
         conversion.") Multiplied;
		virtual Standard_Real Multiplied (const Standard_Real avalue);
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	virtual Standard_Real

This   virtual  method is  called  by  the Measurement  
         methods,   to   compute   the   measurement   during a  
         conversion.") Divided;
		virtual Standard_Real Divided (const Standard_Real avalue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Destroies the Token") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	ashift(Standard_Integer)
	alevel(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	aname(char *)
	asymbol(char *)
	avalue(Standard_Real)
	amove(Standard_Real)
	aquantity(Handle_Units_Quantity)

Returns:
	None

Creates  and  returns a  shifted unit.   <aname> is the  
         name of the unit,  <asymbol> is the usual abbreviation  
         of the unit, <avalue> is the  value in relation to the  
         International System of Units, and <amove>  is the gap  
         in relation to another unit.  
 
         For  example Celcius   dregee   of temperature  is  an  
         instance of ShiftedUnit  with <avalue> equal to 1. and  
         <amove> equal to 273.15.") Units_ShiftedUnit;
		 Units_ShiftedUnit (const char * aname,const char * asymbol,const Standard_Real avalue,const Standard_Real amove,const Handle_Units_Quantity & aquantity);
		%feature("autodoc", "Args:
	aname(char *)
	asymbol(char *)

Returns:
	None

Creates  and returns a  unit.  <aname> is  the name of  
         the  unit, <asymbol> is the  usual abbreviation of the  
         unit.") Units_ShiftedUnit;
		 Units_ShiftedUnit (const char * aname,const char * asymbol);
		%feature("autodoc", "Args:
	aname(char *)

Returns:
	None

Creates  and returns a  unit.  <aname> is  the name of  
         the  unit.") Units_ShiftedUnit;
		 Units_ShiftedUnit (const char * aname);
		%feature("autodoc", "Args:
	amove(Standard_Real)

Returns:
	None

Sets the field <themove> to <amove>") Move;
		void Move (const Standard_Real amove);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the shifted value <themove>.") Move;
		Standard_Real Move ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Units_Token

This redefined method returns a ShiftedToken object.") Token;
		virtual Handle_Units_Token Token ();
		%feature("autodoc", "Args:
	ashift(Standard_Integer)
	alevel(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	astring(char *)

Returns:
	None

Creates   and   returns a   UnitSentence.   The string  
         <astring> describes in natural  language the  unit  or  
         the composed unit to be analysed.") Units_UnitSentence;
		 Units_UnitSentence (const char * astring);
		%feature("autodoc", "Args:
	astring(char *)
	aquantitiessequence(Handle_Units_QuantitiesSequence)

Returns:
	None

Creates  and returns    a  UnitSentence.  The   string  
         <astring> describes in natural language the unit to be  
         analysed.   The    sequence     of physical quantities  
         <asequenceofquantities>   describes    the   available  
         dictionary of units you want to use.") Units_UnitSentence;
		 Units_UnitSentence (const char * astring,const Handle_Units_QuantitiesSequence & aquantitiessequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

Analyzes   the sequence  of   tokens  created  by  the  
         constructor to  find  the true significance   of  each  
         token.") Analyse;
		void Analyse ();
		%feature("autodoc", "Args:
	aquantitiessequence(Handle_Units_QuantitiesSequence)

Returns:
	None

For each token which  represents a unit, finds  in the  
         sequence    of    physical   quantities      all   the  
         characteristics of the unit found.") SetUnits;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns an empty instance of UnitsLexicon") Units_UnitsLexicon;
		 Units_UnitsLexicon ();
		%feature("autodoc", "Args:
	afilename1(char *)
	afilename2(char *)
	amode(Standard_Boolean)=Standard_True

Returns:
	None

Reads  the files  <afilename1>  and  <afilename2>   to  
         create     a   sequence     of    tokens   stored   in  
         <thesequenceoftokens>.") Creates;
		void Creates (const char * afilename1,const char * afilename2,const Standard_Boolean amode = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns in a AsciiString from TCollection the name of the file.") FileName2;
		TCollection_AsciiString FileName2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if  the  file has not  changed  since the  
         creation   of   the  Lexicon   object.   Returns false  
         otherwise.") UpToDate;
		virtual Standard_Boolean UpToDate ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Useful for debugging.") Dump;
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

