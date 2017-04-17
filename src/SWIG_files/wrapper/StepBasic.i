/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") StepBasic

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include StepBasic_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum StepBasic_AheadOrBehind {
	StepBasic_aobAhead = 0,
	StepBasic_aobExact = 1,
	StepBasic_aobBehind = 2,
};

enum StepBasic_SiPrefix {
	StepBasic_spExa = 0,
	StepBasic_spPeta = 1,
	StepBasic_spTera = 2,
	StepBasic_spGiga = 3,
	StepBasic_spMega = 4,
	StepBasic_spKilo = 5,
	StepBasic_spHecto = 6,
	StepBasic_spDeca = 7,
	StepBasic_spDeci = 8,
	StepBasic_spCenti = 9,
	StepBasic_spMilli = 10,
	StepBasic_spMicro = 11,
	StepBasic_spNano = 12,
	StepBasic_spPico = 13,
	StepBasic_spFemto = 14,
	StepBasic_spAtto = 15,
};

enum StepBasic_SiUnitName {
	StepBasic_sunMetre = 0,
	StepBasic_sunGram = 1,
	StepBasic_sunSecond = 2,
	StepBasic_sunAmpere = 3,
	StepBasic_sunKelvin = 4,
	StepBasic_sunMole = 5,
	StepBasic_sunCandela = 6,
	StepBasic_sunRadian = 7,
	StepBasic_sunSteradian = 8,
	StepBasic_sunHertz = 9,
	StepBasic_sunNewton = 10,
	StepBasic_sunPascal = 11,
	StepBasic_sunJoule = 12,
	StepBasic_sunWatt = 13,
	StepBasic_sunCoulomb = 14,
	StepBasic_sunVolt = 15,
	StepBasic_sunFarad = 16,
	StepBasic_sunOhm = 17,
	StepBasic_sunSiemens = 18,
	StepBasic_sunWeber = 19,
	StepBasic_sunTesla = 20,
	StepBasic_sunHenry = 21,
	StepBasic_sunDegreeCelsius = 22,
	StepBasic_sunLumen = 23,
	StepBasic_sunLux = 24,
	StepBasic_sunBecquerel = 25,
	StepBasic_sunGray = 26,
	StepBasic_sunSievert = 27,
};

enum StepBasic_Source {
	StepBasic_sMade = 0,
	StepBasic_sBought = 1,
	StepBasic_sNotKnown = 2,
};

/* end public enums declaration */

%nodefaultctor StepBasic_Action;
class StepBasic_Action : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Action;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_Action;
		 StepBasic_Action ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aChosenMethod:
	:type aChosenMethod: Handle_StepBasic_ActionMethod &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_ActionMethod & aChosenMethod);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") ChosenMethod;
		%feature("autodoc", "	* Returns field ChosenMethod

	:rtype: Handle_StepBasic_ActionMethod
") ChosenMethod;
		Handle_StepBasic_ActionMethod ChosenMethod ();
		%feature("compactdefaultargs") SetChosenMethod;
		%feature("autodoc", "	* Set field ChosenMethod

	:param ChosenMethod:
	:type ChosenMethod: Handle_StepBasic_ActionMethod &
	:rtype: None
") SetChosenMethod;
		void SetChosenMethod (const Handle_StepBasic_ActionMethod & ChosenMethod);
};


%extend StepBasic_Action {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Action(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Action::Handle_StepBasic_Action %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Action;
class Handle_StepBasic_Action : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Action();
        Handle_StepBasic_Action(const Handle_StepBasic_Action &aHandle);
        Handle_StepBasic_Action(const StepBasic_Action *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Action DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Action {
    StepBasic_Action* _get_reference() {
    return (StepBasic_Action*)$self->Access();
    }
};

%extend Handle_StepBasic_Action {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Action {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ActionAssignment;
class StepBasic_ActionAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ActionAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ActionAssignment;
		 StepBasic_ActionAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedAction:
	:type aAssignedAction: Handle_StepBasic_Action &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Action & aAssignedAction);
		%feature("compactdefaultargs") AssignedAction;
		%feature("autodoc", "	* Returns field AssignedAction

	:rtype: Handle_StepBasic_Action
") AssignedAction;
		Handle_StepBasic_Action AssignedAction ();
		%feature("compactdefaultargs") SetAssignedAction;
		%feature("autodoc", "	* Set field AssignedAction

	:param AssignedAction:
	:type AssignedAction: Handle_StepBasic_Action &
	:rtype: None
") SetAssignedAction;
		void SetAssignedAction (const Handle_StepBasic_Action & AssignedAction);
};


%extend StepBasic_ActionAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ActionAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ActionAssignment::Handle_StepBasic_ActionAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ActionAssignment;
class Handle_StepBasic_ActionAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ActionAssignment();
        Handle_StepBasic_ActionAssignment(const Handle_StepBasic_ActionAssignment &aHandle);
        Handle_StepBasic_ActionAssignment(const StepBasic_ActionAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ActionAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ActionAssignment {
    StepBasic_ActionAssignment* _get_reference() {
    return (StepBasic_ActionAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_ActionAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ActionAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ActionMethod;
class StepBasic_ActionMethod : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ActionMethod;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ActionMethod;
		 StepBasic_ActionMethod ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aConsequence:
	:type aConsequence: Handle_TCollection_HAsciiString &
	:param aPurpose:
	:type aPurpose: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_TCollection_HAsciiString & aConsequence,const Handle_TCollection_HAsciiString & aPurpose);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Consequence;
		%feature("autodoc", "	* Returns field Consequence

	:rtype: Handle_TCollection_HAsciiString
") Consequence;
		Handle_TCollection_HAsciiString Consequence ();
		%feature("compactdefaultargs") SetConsequence;
		%feature("autodoc", "	* Set field Consequence

	:param Consequence:
	:type Consequence: Handle_TCollection_HAsciiString &
	:rtype: None
") SetConsequence;
		void SetConsequence (const Handle_TCollection_HAsciiString & Consequence);
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: Handle_TCollection_HAsciiString
") Purpose;
		Handle_TCollection_HAsciiString Purpose ();
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPurpose;
		void SetPurpose (const Handle_TCollection_HAsciiString & Purpose);
};


%extend StepBasic_ActionMethod {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ActionMethod(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ActionMethod::Handle_StepBasic_ActionMethod %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ActionMethod;
class Handle_StepBasic_ActionMethod : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ActionMethod();
        Handle_StepBasic_ActionMethod(const Handle_StepBasic_ActionMethod &aHandle);
        Handle_StepBasic_ActionMethod(const StepBasic_ActionMethod *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ActionMethod DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ActionMethod {
    StepBasic_ActionMethod* _get_reference() {
    return (StepBasic_ActionMethod*)$self->Access();
    }
};

%extend Handle_StepBasic_ActionMethod {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ActionMethod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ActionRequestAssignment;
class StepBasic_ActionRequestAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ActionRequestAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ActionRequestAssignment;
		 StepBasic_ActionRequestAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedActionRequest:
	:type aAssignedActionRequest: Handle_StepBasic_VersionedActionRequest &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_VersionedActionRequest & aAssignedActionRequest);
		%feature("compactdefaultargs") AssignedActionRequest;
		%feature("autodoc", "	* Returns field AssignedActionRequest

	:rtype: Handle_StepBasic_VersionedActionRequest
") AssignedActionRequest;
		Handle_StepBasic_VersionedActionRequest AssignedActionRequest ();
		%feature("compactdefaultargs") SetAssignedActionRequest;
		%feature("autodoc", "	* Set field AssignedActionRequest

	:param AssignedActionRequest:
	:type AssignedActionRequest: Handle_StepBasic_VersionedActionRequest &
	:rtype: None
") SetAssignedActionRequest;
		void SetAssignedActionRequest (const Handle_StepBasic_VersionedActionRequest & AssignedActionRequest);
};


%extend StepBasic_ActionRequestAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ActionRequestAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ActionRequestAssignment::Handle_StepBasic_ActionRequestAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ActionRequestAssignment;
class Handle_StepBasic_ActionRequestAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ActionRequestAssignment();
        Handle_StepBasic_ActionRequestAssignment(const Handle_StepBasic_ActionRequestAssignment &aHandle);
        Handle_StepBasic_ActionRequestAssignment(const StepBasic_ActionRequestAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ActionRequestAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ActionRequestAssignment {
    StepBasic_ActionRequestAssignment* _get_reference() {
    return (StepBasic_ActionRequestAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_ActionRequestAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ActionRequestAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ActionRequestSolution;
class StepBasic_ActionRequestSolution : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ActionRequestSolution;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ActionRequestSolution;
		 StepBasic_ActionRequestSolution ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aMethod:
	:type aMethod: Handle_StepBasic_ActionMethod &
	:param aRequest:
	:type aRequest: Handle_StepBasic_VersionedActionRequest &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_ActionMethod & aMethod,const Handle_StepBasic_VersionedActionRequest & aRequest);
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "	* Returns field Method

	:rtype: Handle_StepBasic_ActionMethod
") Method;
		Handle_StepBasic_ActionMethod Method ();
		%feature("compactdefaultargs") SetMethod;
		%feature("autodoc", "	* Set field Method

	:param Method:
	:type Method: Handle_StepBasic_ActionMethod &
	:rtype: None
") SetMethod;
		void SetMethod (const Handle_StepBasic_ActionMethod & Method);
		%feature("compactdefaultargs") Request;
		%feature("autodoc", "	* Returns field Request

	:rtype: Handle_StepBasic_VersionedActionRequest
") Request;
		Handle_StepBasic_VersionedActionRequest Request ();
		%feature("compactdefaultargs") SetRequest;
		%feature("autodoc", "	* Set field Request

	:param Request:
	:type Request: Handle_StepBasic_VersionedActionRequest &
	:rtype: None
") SetRequest;
		void SetRequest (const Handle_StepBasic_VersionedActionRequest & Request);
};


%extend StepBasic_ActionRequestSolution {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ActionRequestSolution(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ActionRequestSolution::Handle_StepBasic_ActionRequestSolution %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ActionRequestSolution;
class Handle_StepBasic_ActionRequestSolution : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ActionRequestSolution();
        Handle_StepBasic_ActionRequestSolution(const Handle_StepBasic_ActionRequestSolution &aHandle);
        Handle_StepBasic_ActionRequestSolution(const StepBasic_ActionRequestSolution *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ActionRequestSolution DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ActionRequestSolution {
    StepBasic_ActionRequestSolution* _get_reference() {
    return (StepBasic_ActionRequestSolution*)$self->Access();
    }
};

%extend Handle_StepBasic_ActionRequestSolution {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ActionRequestSolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Address;
class StepBasic_Address : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Address;
		%feature("autodoc", "	* Returns a Address

	:rtype: None
") StepBasic_Address;
		 StepBasic_Address ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAinternalLocation:
	:type hasAinternalLocation: bool
	:param aInternalLocation:
	:type aInternalLocation: Handle_TCollection_HAsciiString &
	:param hasAstreetNumber:
	:type hasAstreetNumber: bool
	:param aStreetNumber:
	:type aStreetNumber: Handle_TCollection_HAsciiString &
	:param hasAstreet:
	:type hasAstreet: bool
	:param aStreet:
	:type aStreet: Handle_TCollection_HAsciiString &
	:param hasApostalBox:
	:type hasApostalBox: bool
	:param aPostalBox:
	:type aPostalBox: Handle_TCollection_HAsciiString &
	:param hasAtown:
	:type hasAtown: bool
	:param aTown:
	:type aTown: Handle_TCollection_HAsciiString &
	:param hasAregion:
	:type hasAregion: bool
	:param aRegion:
	:type aRegion: Handle_TCollection_HAsciiString &
	:param hasApostalCode:
	:type hasApostalCode: bool
	:param aPostalCode:
	:type aPostalCode: Handle_TCollection_HAsciiString &
	:param hasAcountry:
	:type hasAcountry: bool
	:param aCountry:
	:type aCountry: Handle_TCollection_HAsciiString &
	:param hasAfacsimileNumber:
	:type hasAfacsimileNumber: bool
	:param aFacsimileNumber:
	:type aFacsimileNumber: Handle_TCollection_HAsciiString &
	:param hasAtelephoneNumber:
	:type hasAtelephoneNumber: bool
	:param aTelephoneNumber:
	:type aTelephoneNumber: Handle_TCollection_HAsciiString &
	:param hasAelectronicMailAddress:
	:type hasAelectronicMailAddress: bool
	:param aElectronicMailAddress:
	:type aElectronicMailAddress: Handle_TCollection_HAsciiString &
	:param hasAtelexNumber:
	:type hasAtelexNumber: bool
	:param aTelexNumber:
	:type aTelexNumber: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAinternalLocation,const Handle_TCollection_HAsciiString & aInternalLocation,const Standard_Boolean hasAstreetNumber,const Handle_TCollection_HAsciiString & aStreetNumber,const Standard_Boolean hasAstreet,const Handle_TCollection_HAsciiString & aStreet,const Standard_Boolean hasApostalBox,const Handle_TCollection_HAsciiString & aPostalBox,const Standard_Boolean hasAtown,const Handle_TCollection_HAsciiString & aTown,const Standard_Boolean hasAregion,const Handle_TCollection_HAsciiString & aRegion,const Standard_Boolean hasApostalCode,const Handle_TCollection_HAsciiString & aPostalCode,const Standard_Boolean hasAcountry,const Handle_TCollection_HAsciiString & aCountry,const Standard_Boolean hasAfacsimileNumber,const Handle_TCollection_HAsciiString & aFacsimileNumber,const Standard_Boolean hasAtelephoneNumber,const Handle_TCollection_HAsciiString & aTelephoneNumber,const Standard_Boolean hasAelectronicMailAddress,const Handle_TCollection_HAsciiString & aElectronicMailAddress,const Standard_Boolean hasAtelexNumber,const Handle_TCollection_HAsciiString & aTelexNumber);
		%feature("compactdefaultargs") SetInternalLocation;
		%feature("autodoc", "	:param aInternalLocation:
	:type aInternalLocation: Handle_TCollection_HAsciiString &
	:rtype: None
") SetInternalLocation;
		void SetInternalLocation (const Handle_TCollection_HAsciiString & aInternalLocation);
		%feature("compactdefaultargs") UnSetInternalLocation;
		%feature("autodoc", "	:rtype: None
") UnSetInternalLocation;
		void UnSetInternalLocation ();
		%feature("compactdefaultargs") InternalLocation;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") InternalLocation;
		Handle_TCollection_HAsciiString InternalLocation ();
		%feature("compactdefaultargs") HasInternalLocation;
		%feature("autodoc", "	:rtype: bool
") HasInternalLocation;
		Standard_Boolean HasInternalLocation ();
		%feature("compactdefaultargs") SetStreetNumber;
		%feature("autodoc", "	:param aStreetNumber:
	:type aStreetNumber: Handle_TCollection_HAsciiString &
	:rtype: None
") SetStreetNumber;
		void SetStreetNumber (const Handle_TCollection_HAsciiString & aStreetNumber);
		%feature("compactdefaultargs") UnSetStreetNumber;
		%feature("autodoc", "	:rtype: None
") UnSetStreetNumber;
		void UnSetStreetNumber ();
		%feature("compactdefaultargs") StreetNumber;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") StreetNumber;
		Handle_TCollection_HAsciiString StreetNumber ();
		%feature("compactdefaultargs") HasStreetNumber;
		%feature("autodoc", "	:rtype: bool
") HasStreetNumber;
		Standard_Boolean HasStreetNumber ();
		%feature("compactdefaultargs") SetStreet;
		%feature("autodoc", "	:param aStreet:
	:type aStreet: Handle_TCollection_HAsciiString &
	:rtype: None
") SetStreet;
		void SetStreet (const Handle_TCollection_HAsciiString & aStreet);
		%feature("compactdefaultargs") UnSetStreet;
		%feature("autodoc", "	:rtype: None
") UnSetStreet;
		void UnSetStreet ();
		%feature("compactdefaultargs") Street;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Street;
		Handle_TCollection_HAsciiString Street ();
		%feature("compactdefaultargs") HasStreet;
		%feature("autodoc", "	:rtype: bool
") HasStreet;
		Standard_Boolean HasStreet ();
		%feature("compactdefaultargs") SetPostalBox;
		%feature("autodoc", "	:param aPostalBox:
	:type aPostalBox: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPostalBox;
		void SetPostalBox (const Handle_TCollection_HAsciiString & aPostalBox);
		%feature("compactdefaultargs") UnSetPostalBox;
		%feature("autodoc", "	:rtype: None
") UnSetPostalBox;
		void UnSetPostalBox ();
		%feature("compactdefaultargs") PostalBox;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PostalBox;
		Handle_TCollection_HAsciiString PostalBox ();
		%feature("compactdefaultargs") HasPostalBox;
		%feature("autodoc", "	:rtype: bool
") HasPostalBox;
		Standard_Boolean HasPostalBox ();
		%feature("compactdefaultargs") SetTown;
		%feature("autodoc", "	:param aTown:
	:type aTown: Handle_TCollection_HAsciiString &
	:rtype: None
") SetTown;
		void SetTown (const Handle_TCollection_HAsciiString & aTown);
		%feature("compactdefaultargs") UnSetTown;
		%feature("autodoc", "	:rtype: None
") UnSetTown;
		void UnSetTown ();
		%feature("compactdefaultargs") Town;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Town;
		Handle_TCollection_HAsciiString Town ();
		%feature("compactdefaultargs") HasTown;
		%feature("autodoc", "	:rtype: bool
") HasTown;
		Standard_Boolean HasTown ();
		%feature("compactdefaultargs") SetRegion;
		%feature("autodoc", "	:param aRegion:
	:type aRegion: Handle_TCollection_HAsciiString &
	:rtype: None
") SetRegion;
		void SetRegion (const Handle_TCollection_HAsciiString & aRegion);
		%feature("compactdefaultargs") UnSetRegion;
		%feature("autodoc", "	:rtype: None
") UnSetRegion;
		void UnSetRegion ();
		%feature("compactdefaultargs") Region;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Region;
		Handle_TCollection_HAsciiString Region ();
		%feature("compactdefaultargs") HasRegion;
		%feature("autodoc", "	:rtype: bool
") HasRegion;
		Standard_Boolean HasRegion ();
		%feature("compactdefaultargs") SetPostalCode;
		%feature("autodoc", "	:param aPostalCode:
	:type aPostalCode: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPostalCode;
		void SetPostalCode (const Handle_TCollection_HAsciiString & aPostalCode);
		%feature("compactdefaultargs") UnSetPostalCode;
		%feature("autodoc", "	:rtype: None
") UnSetPostalCode;
		void UnSetPostalCode ();
		%feature("compactdefaultargs") PostalCode;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PostalCode;
		Handle_TCollection_HAsciiString PostalCode ();
		%feature("compactdefaultargs") HasPostalCode;
		%feature("autodoc", "	:rtype: bool
") HasPostalCode;
		Standard_Boolean HasPostalCode ();
		%feature("compactdefaultargs") SetCountry;
		%feature("autodoc", "	:param aCountry:
	:type aCountry: Handle_TCollection_HAsciiString &
	:rtype: None
") SetCountry;
		void SetCountry (const Handle_TCollection_HAsciiString & aCountry);
		%feature("compactdefaultargs") UnSetCountry;
		%feature("autodoc", "	:rtype: None
") UnSetCountry;
		void UnSetCountry ();
		%feature("compactdefaultargs") Country;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Country;
		Handle_TCollection_HAsciiString Country ();
		%feature("compactdefaultargs") HasCountry;
		%feature("autodoc", "	:rtype: bool
") HasCountry;
		Standard_Boolean HasCountry ();
		%feature("compactdefaultargs") SetFacsimileNumber;
		%feature("autodoc", "	:param aFacsimileNumber:
	:type aFacsimileNumber: Handle_TCollection_HAsciiString &
	:rtype: None
") SetFacsimileNumber;
		void SetFacsimileNumber (const Handle_TCollection_HAsciiString & aFacsimileNumber);
		%feature("compactdefaultargs") UnSetFacsimileNumber;
		%feature("autodoc", "	:rtype: None
") UnSetFacsimileNumber;
		void UnSetFacsimileNumber ();
		%feature("compactdefaultargs") FacsimileNumber;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") FacsimileNumber;
		Handle_TCollection_HAsciiString FacsimileNumber ();
		%feature("compactdefaultargs") HasFacsimileNumber;
		%feature("autodoc", "	:rtype: bool
") HasFacsimileNumber;
		Standard_Boolean HasFacsimileNumber ();
		%feature("compactdefaultargs") SetTelephoneNumber;
		%feature("autodoc", "	:param aTelephoneNumber:
	:type aTelephoneNumber: Handle_TCollection_HAsciiString &
	:rtype: None
") SetTelephoneNumber;
		void SetTelephoneNumber (const Handle_TCollection_HAsciiString & aTelephoneNumber);
		%feature("compactdefaultargs") UnSetTelephoneNumber;
		%feature("autodoc", "	:rtype: None
") UnSetTelephoneNumber;
		void UnSetTelephoneNumber ();
		%feature("compactdefaultargs") TelephoneNumber;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") TelephoneNumber;
		Handle_TCollection_HAsciiString TelephoneNumber ();
		%feature("compactdefaultargs") HasTelephoneNumber;
		%feature("autodoc", "	:rtype: bool
") HasTelephoneNumber;
		Standard_Boolean HasTelephoneNumber ();
		%feature("compactdefaultargs") SetElectronicMailAddress;
		%feature("autodoc", "	:param aElectronicMailAddress:
	:type aElectronicMailAddress: Handle_TCollection_HAsciiString &
	:rtype: None
") SetElectronicMailAddress;
		void SetElectronicMailAddress (const Handle_TCollection_HAsciiString & aElectronicMailAddress);
		%feature("compactdefaultargs") UnSetElectronicMailAddress;
		%feature("autodoc", "	:rtype: None
") UnSetElectronicMailAddress;
		void UnSetElectronicMailAddress ();
		%feature("compactdefaultargs") ElectronicMailAddress;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") ElectronicMailAddress;
		Handle_TCollection_HAsciiString ElectronicMailAddress ();
		%feature("compactdefaultargs") HasElectronicMailAddress;
		%feature("autodoc", "	:rtype: bool
") HasElectronicMailAddress;
		Standard_Boolean HasElectronicMailAddress ();
		%feature("compactdefaultargs") SetTelexNumber;
		%feature("autodoc", "	:param aTelexNumber:
	:type aTelexNumber: Handle_TCollection_HAsciiString &
	:rtype: None
") SetTelexNumber;
		void SetTelexNumber (const Handle_TCollection_HAsciiString & aTelexNumber);
		%feature("compactdefaultargs") UnSetTelexNumber;
		%feature("autodoc", "	:rtype: None
") UnSetTelexNumber;
		void UnSetTelexNumber ();
		%feature("compactdefaultargs") TelexNumber;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") TelexNumber;
		Handle_TCollection_HAsciiString TelexNumber ();
		%feature("compactdefaultargs") HasTelexNumber;
		%feature("autodoc", "	:rtype: bool
") HasTelexNumber;
		Standard_Boolean HasTelexNumber ();
};


%extend StepBasic_Address {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Address(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Address::Handle_StepBasic_Address %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Address;
class Handle_StepBasic_Address : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Address();
        Handle_StepBasic_Address(const Handle_StepBasic_Address &aHandle);
        Handle_StepBasic_Address(const StepBasic_Address *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Address DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Address {
    StepBasic_Address* _get_reference() {
    return (StepBasic_Address*)$self->Access();
    }
};

%extend Handle_StepBasic_Address {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Address {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApplicationContext;
class StepBasic_ApplicationContext : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ApplicationContext;
		%feature("autodoc", "	* Returns a ApplicationContext

	:rtype: None
") StepBasic_ApplicationContext;
		 StepBasic_ApplicationContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aApplication:
	:type aApplication: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aApplication);
		%feature("compactdefaultargs") SetApplication;
		%feature("autodoc", "	:param aApplication:
	:type aApplication: Handle_TCollection_HAsciiString &
	:rtype: None
") SetApplication;
		void SetApplication (const Handle_TCollection_HAsciiString & aApplication);
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Application;
		Handle_TCollection_HAsciiString Application ();
};


%extend StepBasic_ApplicationContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ApplicationContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ApplicationContext::Handle_StepBasic_ApplicationContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ApplicationContext;
class Handle_StepBasic_ApplicationContext : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ApplicationContext();
        Handle_StepBasic_ApplicationContext(const Handle_StepBasic_ApplicationContext &aHandle);
        Handle_StepBasic_ApplicationContext(const StepBasic_ApplicationContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ApplicationContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApplicationContext {
    StepBasic_ApplicationContext* _get_reference() {
    return (StepBasic_ApplicationContext*)$self->Access();
    }
};

%extend Handle_StepBasic_ApplicationContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ApplicationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApplicationContextElement;
class StepBasic_ApplicationContextElement : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ApplicationContextElement;
		%feature("autodoc", "	* Returns a ApplicationContextElement

	:rtype: None
") StepBasic_ApplicationContextElement;
		 StepBasic_ApplicationContextElement ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aFrameOfReference:
	:type aFrameOfReference: Handle_StepBasic_ApplicationContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_ApplicationContext & aFrameOfReference);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "	:param aFrameOfReference:
	:type aFrameOfReference: Handle_StepBasic_ApplicationContext &
	:rtype: None
") SetFrameOfReference;
		void SetFrameOfReference (const Handle_StepBasic_ApplicationContext & aFrameOfReference);
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ApplicationContext
") FrameOfReference;
		Handle_StepBasic_ApplicationContext FrameOfReference ();
};


%extend StepBasic_ApplicationContextElement {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ApplicationContextElement(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ApplicationContextElement::Handle_StepBasic_ApplicationContextElement %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ApplicationContextElement;
class Handle_StepBasic_ApplicationContextElement : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ApplicationContextElement();
        Handle_StepBasic_ApplicationContextElement(const Handle_StepBasic_ApplicationContextElement &aHandle);
        Handle_StepBasic_ApplicationContextElement(const StepBasic_ApplicationContextElement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ApplicationContextElement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApplicationContextElement {
    StepBasic_ApplicationContextElement* _get_reference() {
    return (StepBasic_ApplicationContextElement*)$self->Access();
    }
};

%extend Handle_StepBasic_ApplicationContextElement {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ApplicationContextElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApplicationProtocolDefinition;
class StepBasic_ApplicationProtocolDefinition : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ApplicationProtocolDefinition;
		%feature("autodoc", "	* Returns a ApplicationProtocolDefinition

	:rtype: None
") StepBasic_ApplicationProtocolDefinition;
		 StepBasic_ApplicationProtocolDefinition ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: Handle_TCollection_HAsciiString &
	:param aApplicationInterpretedModelSchemaName:
	:type aApplicationInterpretedModelSchemaName: Handle_TCollection_HAsciiString &
	:param aApplicationProtocolYear:
	:type aApplicationProtocolYear: int
	:param aApplication:
	:type aApplication: Handle_StepBasic_ApplicationContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aStatus,const Handle_TCollection_HAsciiString & aApplicationInterpretedModelSchemaName,const Standard_Integer aApplicationProtocolYear,const Handle_StepBasic_ApplicationContext & aApplication);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: Handle_TCollection_HAsciiString &
	:rtype: None
") SetStatus;
		void SetStatus (const Handle_TCollection_HAsciiString & aStatus);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Status;
		Handle_TCollection_HAsciiString Status ();
		%feature("compactdefaultargs") SetApplicationInterpretedModelSchemaName;
		%feature("autodoc", "	:param aApplicationInterpretedModelSchemaName:
	:type aApplicationInterpretedModelSchemaName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetApplicationInterpretedModelSchemaName;
		void SetApplicationInterpretedModelSchemaName (const Handle_TCollection_HAsciiString & aApplicationInterpretedModelSchemaName);
		%feature("compactdefaultargs") ApplicationInterpretedModelSchemaName;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") ApplicationInterpretedModelSchemaName;
		Handle_TCollection_HAsciiString ApplicationInterpretedModelSchemaName ();
		%feature("compactdefaultargs") SetApplicationProtocolYear;
		%feature("autodoc", "	:param aApplicationProtocolYear:
	:type aApplicationProtocolYear: int
	:rtype: None
") SetApplicationProtocolYear;
		void SetApplicationProtocolYear (const Standard_Integer aApplicationProtocolYear);
		%feature("compactdefaultargs") ApplicationProtocolYear;
		%feature("autodoc", "	:rtype: int
") ApplicationProtocolYear;
		Standard_Integer ApplicationProtocolYear ();
		%feature("compactdefaultargs") SetApplication;
		%feature("autodoc", "	:param aApplication:
	:type aApplication: Handle_StepBasic_ApplicationContext &
	:rtype: None
") SetApplication;
		void SetApplication (const Handle_StepBasic_ApplicationContext & aApplication);
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ApplicationContext
") Application;
		Handle_StepBasic_ApplicationContext Application ();
};


%extend StepBasic_ApplicationProtocolDefinition {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ApplicationProtocolDefinition(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ApplicationProtocolDefinition::Handle_StepBasic_ApplicationProtocolDefinition %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ApplicationProtocolDefinition;
class Handle_StepBasic_ApplicationProtocolDefinition : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ApplicationProtocolDefinition();
        Handle_StepBasic_ApplicationProtocolDefinition(const Handle_StepBasic_ApplicationProtocolDefinition &aHandle);
        Handle_StepBasic_ApplicationProtocolDefinition(const StepBasic_ApplicationProtocolDefinition *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ApplicationProtocolDefinition DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApplicationProtocolDefinition {
    StepBasic_ApplicationProtocolDefinition* _get_reference() {
    return (StepBasic_ApplicationProtocolDefinition*)$self->Access();
    }
};

%extend Handle_StepBasic_ApplicationProtocolDefinition {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ApplicationProtocolDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Approval;
class StepBasic_Approval : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Approval;
		%feature("autodoc", "	* Returns a Approval

	:rtype: None
") StepBasic_Approval;
		 StepBasic_Approval ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: Handle_StepBasic_ApprovalStatus &
	:param aLevel:
	:type aLevel: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_ApprovalStatus & aStatus,const Handle_TCollection_HAsciiString & aLevel);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: Handle_StepBasic_ApprovalStatus &
	:rtype: None
") SetStatus;
		void SetStatus (const Handle_StepBasic_ApprovalStatus & aStatus);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ApprovalStatus
") Status;
		Handle_StepBasic_ApprovalStatus Status ();
		%feature("compactdefaultargs") SetLevel;
		%feature("autodoc", "	:param aLevel:
	:type aLevel: Handle_TCollection_HAsciiString &
	:rtype: None
") SetLevel;
		void SetLevel (const Handle_TCollection_HAsciiString & aLevel);
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Level;
		Handle_TCollection_HAsciiString Level ();
};


%extend StepBasic_Approval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Approval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Approval::Handle_StepBasic_Approval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Approval;
class Handle_StepBasic_Approval : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Approval();
        Handle_StepBasic_Approval(const Handle_StepBasic_Approval &aHandle);
        Handle_StepBasic_Approval(const StepBasic_Approval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Approval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Approval {
    StepBasic_Approval* _get_reference() {
    return (StepBasic_Approval*)$self->Access();
    }
};

%extend Handle_StepBasic_Approval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Approval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalAssignment;
class StepBasic_ApprovalAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedApproval:
	:type aAssignedApproval: Handle_StepBasic_Approval &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Approval & aAssignedApproval);
		%feature("compactdefaultargs") SetAssignedApproval;
		%feature("autodoc", "	:param aAssignedApproval:
	:type aAssignedApproval: Handle_StepBasic_Approval &
	:rtype: None
") SetAssignedApproval;
		void SetAssignedApproval (const Handle_StepBasic_Approval & aAssignedApproval);
		%feature("compactdefaultargs") AssignedApproval;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Approval
") AssignedApproval;
		Handle_StepBasic_Approval AssignedApproval ();
};


%extend StepBasic_ApprovalAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ApprovalAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ApprovalAssignment::Handle_StepBasic_ApprovalAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ApprovalAssignment;
class Handle_StepBasic_ApprovalAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ApprovalAssignment();
        Handle_StepBasic_ApprovalAssignment(const Handle_StepBasic_ApprovalAssignment &aHandle);
        Handle_StepBasic_ApprovalAssignment(const StepBasic_ApprovalAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ApprovalAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalAssignment {
    StepBasic_ApprovalAssignment* _get_reference() {
    return (StepBasic_ApprovalAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_ApprovalAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalDateTime;
class StepBasic_ApprovalDateTime : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ApprovalDateTime;
		%feature("autodoc", "	:rtype: None
") StepBasic_ApprovalDateTime;
		 StepBasic_ApprovalDateTime ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDateTime:
	:type aDateTime: StepBasic_DateTimeSelect &
	:param aDatedApproval:
	:type aDatedApproval: Handle_StepBasic_Approval &
	:rtype: None
") Init;
		void Init (const StepBasic_DateTimeSelect & aDateTime,const Handle_StepBasic_Approval & aDatedApproval);
		%feature("compactdefaultargs") SetDateTime;
		%feature("autodoc", "	:param aDateTime:
	:type aDateTime: StepBasic_DateTimeSelect &
	:rtype: None
") SetDateTime;
		void SetDateTime (const StepBasic_DateTimeSelect & aDateTime);
		%feature("compactdefaultargs") DateTime;
		%feature("autodoc", "	:rtype: StepBasic_DateTimeSelect
") DateTime;
		StepBasic_DateTimeSelect DateTime ();
		%feature("compactdefaultargs") SetDatedApproval;
		%feature("autodoc", "	:param aDatedApproval:
	:type aDatedApproval: Handle_StepBasic_Approval &
	:rtype: None
") SetDatedApproval;
		void SetDatedApproval (const Handle_StepBasic_Approval & aDatedApproval);
		%feature("compactdefaultargs") DatedApproval;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Approval
") DatedApproval;
		Handle_StepBasic_Approval DatedApproval ();
};


%extend StepBasic_ApprovalDateTime {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ApprovalDateTime(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ApprovalDateTime::Handle_StepBasic_ApprovalDateTime %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ApprovalDateTime;
class Handle_StepBasic_ApprovalDateTime : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ApprovalDateTime();
        Handle_StepBasic_ApprovalDateTime(const Handle_StepBasic_ApprovalDateTime &aHandle);
        Handle_StepBasic_ApprovalDateTime(const StepBasic_ApprovalDateTime *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ApprovalDateTime DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalDateTime {
    StepBasic_ApprovalDateTime* _get_reference() {
    return (StepBasic_ApprovalDateTime*)$self->Access();
    }
};

%extend Handle_StepBasic_ApprovalDateTime {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ApprovalDateTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalPersonOrganization;
class StepBasic_ApprovalPersonOrganization : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ApprovalPersonOrganization;
		%feature("autodoc", "	* Returns a ApprovalPersonOrganization

	:rtype: None
") StepBasic_ApprovalPersonOrganization;
		 StepBasic_ApprovalPersonOrganization ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aPersonOrganization:
	:type aPersonOrganization: StepBasic_PersonOrganizationSelect &
	:param aAuthorizedApproval:
	:type aAuthorizedApproval: Handle_StepBasic_Approval &
	:param aRole:
	:type aRole: Handle_StepBasic_ApprovalRole &
	:rtype: void
") Init;
		virtual void Init (const StepBasic_PersonOrganizationSelect & aPersonOrganization,const Handle_StepBasic_Approval & aAuthorizedApproval,const Handle_StepBasic_ApprovalRole & aRole);
		%feature("compactdefaultargs") SetPersonOrganization;
		%feature("autodoc", "	:param aPersonOrganization:
	:type aPersonOrganization: StepBasic_PersonOrganizationSelect &
	:rtype: None
") SetPersonOrganization;
		void SetPersonOrganization (const StepBasic_PersonOrganizationSelect & aPersonOrganization);
		%feature("compactdefaultargs") PersonOrganization;
		%feature("autodoc", "	:rtype: StepBasic_PersonOrganizationSelect
") PersonOrganization;
		StepBasic_PersonOrganizationSelect PersonOrganization ();
		%feature("compactdefaultargs") SetAuthorizedApproval;
		%feature("autodoc", "	:param aAuthorizedApproval:
	:type aAuthorizedApproval: Handle_StepBasic_Approval &
	:rtype: None
") SetAuthorizedApproval;
		void SetAuthorizedApproval (const Handle_StepBasic_Approval & aAuthorizedApproval);
		%feature("compactdefaultargs") AuthorizedApproval;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Approval
") AuthorizedApproval;
		Handle_StepBasic_Approval AuthorizedApproval ();
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: Handle_StepBasic_ApprovalRole &
	:rtype: None
") SetRole;
		void SetRole (const Handle_StepBasic_ApprovalRole & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ApprovalRole
") Role;
		Handle_StepBasic_ApprovalRole Role ();
};


%extend StepBasic_ApprovalPersonOrganization {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ApprovalPersonOrganization(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ApprovalPersonOrganization::Handle_StepBasic_ApprovalPersonOrganization %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ApprovalPersonOrganization;
class Handle_StepBasic_ApprovalPersonOrganization : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ApprovalPersonOrganization();
        Handle_StepBasic_ApprovalPersonOrganization(const Handle_StepBasic_ApprovalPersonOrganization &aHandle);
        Handle_StepBasic_ApprovalPersonOrganization(const StepBasic_ApprovalPersonOrganization *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ApprovalPersonOrganization DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalPersonOrganization {
    StepBasic_ApprovalPersonOrganization* _get_reference() {
    return (StepBasic_ApprovalPersonOrganization*)$self->Access();
    }
};

%extend Handle_StepBasic_ApprovalPersonOrganization {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ApprovalPersonOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalRelationship;
class StepBasic_ApprovalRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ApprovalRelationship;
		%feature("autodoc", "	* Returns a ApprovalRelationship

	:rtype: None
") StepBasic_ApprovalRelationship;
		 StepBasic_ApprovalRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRelatingApproval:
	:type aRelatingApproval: Handle_StepBasic_Approval &
	:param aRelatedApproval:
	:type aRelatedApproval: Handle_StepBasic_Approval &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_Approval & aRelatingApproval,const Handle_StepBasic_Approval & aRelatedApproval);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetRelatingApproval;
		%feature("autodoc", "	:param aRelatingApproval:
	:type aRelatingApproval: Handle_StepBasic_Approval &
	:rtype: None
") SetRelatingApproval;
		void SetRelatingApproval (const Handle_StepBasic_Approval & aRelatingApproval);
		%feature("compactdefaultargs") RelatingApproval;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Approval
") RelatingApproval;
		Handle_StepBasic_Approval RelatingApproval ();
		%feature("compactdefaultargs") SetRelatedApproval;
		%feature("autodoc", "	:param aRelatedApproval:
	:type aRelatedApproval: Handle_StepBasic_Approval &
	:rtype: None
") SetRelatedApproval;
		void SetRelatedApproval (const Handle_StepBasic_Approval & aRelatedApproval);
		%feature("compactdefaultargs") RelatedApproval;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Approval
") RelatedApproval;
		Handle_StepBasic_Approval RelatedApproval ();
};


%extend StepBasic_ApprovalRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ApprovalRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ApprovalRelationship::Handle_StepBasic_ApprovalRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ApprovalRelationship;
class Handle_StepBasic_ApprovalRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ApprovalRelationship();
        Handle_StepBasic_ApprovalRelationship(const Handle_StepBasic_ApprovalRelationship &aHandle);
        Handle_StepBasic_ApprovalRelationship(const StepBasic_ApprovalRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ApprovalRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalRelationship {
    StepBasic_ApprovalRelationship* _get_reference() {
    return (StepBasic_ApprovalRelationship*)$self->Access();
    }
};

%extend Handle_StepBasic_ApprovalRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ApprovalRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalRole;
class StepBasic_ApprovalRole : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ApprovalRole;
		%feature("autodoc", "	* Returns a ApprovalRole

	:rtype: None
") StepBasic_ApprovalRole;
		 StepBasic_ApprovalRole ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aRole:
	:type aRole: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aRole);
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: Handle_TCollection_HAsciiString &
	:rtype: None
") SetRole;
		void SetRole (const Handle_TCollection_HAsciiString & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Role;
		Handle_TCollection_HAsciiString Role ();
};


%extend StepBasic_ApprovalRole {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ApprovalRole(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ApprovalRole::Handle_StepBasic_ApprovalRole %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ApprovalRole;
class Handle_StepBasic_ApprovalRole : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ApprovalRole();
        Handle_StepBasic_ApprovalRole(const Handle_StepBasic_ApprovalRole &aHandle);
        Handle_StepBasic_ApprovalRole(const StepBasic_ApprovalRole *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ApprovalRole DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalRole {
    StepBasic_ApprovalRole* _get_reference() {
    return (StepBasic_ApprovalRole*)$self->Access();
    }
};

%extend Handle_StepBasic_ApprovalRole {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ApprovalRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalStatus;
class StepBasic_ApprovalStatus : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ApprovalStatus;
		%feature("autodoc", "	* Returns a ApprovalStatus

	:rtype: None
") StepBasic_ApprovalStatus;
		 StepBasic_ApprovalStatus ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
};


%extend StepBasic_ApprovalStatus {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ApprovalStatus(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ApprovalStatus::Handle_StepBasic_ApprovalStatus %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ApprovalStatus;
class Handle_StepBasic_ApprovalStatus : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ApprovalStatus();
        Handle_StepBasic_ApprovalStatus(const Handle_StepBasic_ApprovalStatus &aHandle);
        Handle_StepBasic_ApprovalStatus(const StepBasic_ApprovalStatus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ApprovalStatus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalStatus {
    StepBasic_ApprovalStatus* _get_reference() {
    return (StepBasic_ApprovalStatus*)$self->Access();
    }
};

%extend Handle_StepBasic_ApprovalStatus {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ApprovalStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Array1OfApproval;
class StepBasic_Array1OfApproval {
	public:
		%feature("compactdefaultargs") StepBasic_Array1OfApproval;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfApproval;
		 StepBasic_Array1OfApproval (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_Array1OfApproval;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepBasic_Approval &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfApproval;
		 StepBasic_Array1OfApproval (const Handle_StepBasic_Approval & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_Approval &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Approval & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfApproval &
	:rtype: StepBasic_Array1OfApproval
") Assign;
		const StepBasic_Array1OfApproval & Assign (const StepBasic_Array1OfApproval & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfApproval &
	:rtype: StepBasic_Array1OfApproval
") operator =;
		const StepBasic_Array1OfApproval & operator = (const StepBasic_Array1OfApproval & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_Approval &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_Approval & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Approval
") Value;
		Handle_StepBasic_Approval Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Approval
") ChangeValue;
		Handle_StepBasic_Approval ChangeValue (const Standard_Integer Index);
};


%extend StepBasic_Array1OfApproval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Array1OfDerivedUnitElement;
class StepBasic_Array1OfDerivedUnitElement {
	public:
		%feature("compactdefaultargs") StepBasic_Array1OfDerivedUnitElement;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfDerivedUnitElement;
		 StepBasic_Array1OfDerivedUnitElement (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_Array1OfDerivedUnitElement;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepBasic_DerivedUnitElement &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfDerivedUnitElement;
		 StepBasic_Array1OfDerivedUnitElement (const Handle_StepBasic_DerivedUnitElement & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_DerivedUnitElement &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_DerivedUnitElement & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfDerivedUnitElement &
	:rtype: StepBasic_Array1OfDerivedUnitElement
") Assign;
		const StepBasic_Array1OfDerivedUnitElement & Assign (const StepBasic_Array1OfDerivedUnitElement & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfDerivedUnitElement &
	:rtype: StepBasic_Array1OfDerivedUnitElement
") operator =;
		const StepBasic_Array1OfDerivedUnitElement & operator = (const StepBasic_Array1OfDerivedUnitElement & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_DerivedUnitElement &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_DerivedUnitElement & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_DerivedUnitElement
") Value;
		Handle_StepBasic_DerivedUnitElement Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_DerivedUnitElement
") ChangeValue;
		Handle_StepBasic_DerivedUnitElement ChangeValue (const Standard_Integer Index);
};


%extend StepBasic_Array1OfDerivedUnitElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Array1OfDocument;
class StepBasic_Array1OfDocument {
	public:
		%feature("compactdefaultargs") StepBasic_Array1OfDocument;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfDocument;
		 StepBasic_Array1OfDocument (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_Array1OfDocument;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepBasic_Document &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfDocument;
		 StepBasic_Array1OfDocument (const Handle_StepBasic_Document & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_Document &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Document & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfDocument &
	:rtype: StepBasic_Array1OfDocument
") Assign;
		const StepBasic_Array1OfDocument & Assign (const StepBasic_Array1OfDocument & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfDocument &
	:rtype: StepBasic_Array1OfDocument
") operator =;
		const StepBasic_Array1OfDocument & operator = (const StepBasic_Array1OfDocument & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_Document &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_Document & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Document
") Value;
		Handle_StepBasic_Document Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Document
") ChangeValue;
		Handle_StepBasic_Document ChangeValue (const Standard_Integer Index);
};


%extend StepBasic_Array1OfDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Array1OfNamedUnit;
class StepBasic_Array1OfNamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_Array1OfNamedUnit;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfNamedUnit;
		 StepBasic_Array1OfNamedUnit (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_Array1OfNamedUnit;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepBasic_NamedUnit &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfNamedUnit;
		 StepBasic_Array1OfNamedUnit (const Handle_StepBasic_NamedUnit & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_NamedUnit &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_NamedUnit & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfNamedUnit &
	:rtype: StepBasic_Array1OfNamedUnit
") Assign;
		const StepBasic_Array1OfNamedUnit & Assign (const StepBasic_Array1OfNamedUnit & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfNamedUnit &
	:rtype: StepBasic_Array1OfNamedUnit
") operator =;
		const StepBasic_Array1OfNamedUnit & operator = (const StepBasic_Array1OfNamedUnit & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_NamedUnit &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_NamedUnit & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_NamedUnit
") Value;
		Handle_StepBasic_NamedUnit Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_NamedUnit
") ChangeValue;
		Handle_StepBasic_NamedUnit ChangeValue (const Standard_Integer Index);
};


%extend StepBasic_Array1OfNamedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Array1OfOrganization;
class StepBasic_Array1OfOrganization {
	public:
		%feature("compactdefaultargs") StepBasic_Array1OfOrganization;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfOrganization;
		 StepBasic_Array1OfOrganization (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_Array1OfOrganization;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepBasic_Organization &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfOrganization;
		 StepBasic_Array1OfOrganization (const Handle_StepBasic_Organization & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_Organization &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Organization & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfOrganization &
	:rtype: StepBasic_Array1OfOrganization
") Assign;
		const StepBasic_Array1OfOrganization & Assign (const StepBasic_Array1OfOrganization & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfOrganization &
	:rtype: StepBasic_Array1OfOrganization
") operator =;
		const StepBasic_Array1OfOrganization & operator = (const StepBasic_Array1OfOrganization & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_Organization &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_Organization & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Organization
") Value;
		Handle_StepBasic_Organization Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Organization
") ChangeValue;
		Handle_StepBasic_Organization ChangeValue (const Standard_Integer Index);
};


%extend StepBasic_Array1OfOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Array1OfPerson;
class StepBasic_Array1OfPerson {
	public:
		%feature("compactdefaultargs") StepBasic_Array1OfPerson;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfPerson;
		 StepBasic_Array1OfPerson (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_Array1OfPerson;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepBasic_Person &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfPerson;
		 StepBasic_Array1OfPerson (const Handle_StepBasic_Person & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_Person &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Person & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfPerson &
	:rtype: StepBasic_Array1OfPerson
") Assign;
		const StepBasic_Array1OfPerson & Assign (const StepBasic_Array1OfPerson & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfPerson &
	:rtype: StepBasic_Array1OfPerson
") operator =;
		const StepBasic_Array1OfPerson & operator = (const StepBasic_Array1OfPerson & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_Person &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_Person & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Person
") Value;
		Handle_StepBasic_Person Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Person
") ChangeValue;
		Handle_StepBasic_Person ChangeValue (const Standard_Integer Index);
};


%extend StepBasic_Array1OfPerson {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Array1OfProduct;
class StepBasic_Array1OfProduct {
	public:
		%feature("compactdefaultargs") StepBasic_Array1OfProduct;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfProduct;
		 StepBasic_Array1OfProduct (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_Array1OfProduct;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepBasic_Product &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfProduct;
		 StepBasic_Array1OfProduct (const Handle_StepBasic_Product & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_Product &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Product & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfProduct &
	:rtype: StepBasic_Array1OfProduct
") Assign;
		const StepBasic_Array1OfProduct & Assign (const StepBasic_Array1OfProduct & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfProduct &
	:rtype: StepBasic_Array1OfProduct
") operator =;
		const StepBasic_Array1OfProduct & operator = (const StepBasic_Array1OfProduct & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_Product &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_Product & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Product
") Value;
		Handle_StepBasic_Product Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Product
") ChangeValue;
		Handle_StepBasic_Product ChangeValue (const Standard_Integer Index);
};


%extend StepBasic_Array1OfProduct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Array1OfProductContext;
class StepBasic_Array1OfProductContext {
	public:
		%feature("compactdefaultargs") StepBasic_Array1OfProductContext;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfProductContext;
		 StepBasic_Array1OfProductContext (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_Array1OfProductContext;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepBasic_ProductContext &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfProductContext;
		 StepBasic_Array1OfProductContext (const Handle_StepBasic_ProductContext & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_ProductContext &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_ProductContext & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfProductContext &
	:rtype: StepBasic_Array1OfProductContext
") Assign;
		const StepBasic_Array1OfProductContext & Assign (const StepBasic_Array1OfProductContext & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfProductContext &
	:rtype: StepBasic_Array1OfProductContext
") operator =;
		const StepBasic_Array1OfProductContext & operator = (const StepBasic_Array1OfProductContext & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_ProductContext &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_ProductContext & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_ProductContext
") Value;
		Handle_StepBasic_ProductContext Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_ProductContext
") ChangeValue;
		Handle_StepBasic_ProductContext ChangeValue (const Standard_Integer Index);
};


%extend StepBasic_Array1OfProductContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Array1OfProductDefinition;
class StepBasic_Array1OfProductDefinition {
	public:
		%feature("compactdefaultargs") StepBasic_Array1OfProductDefinition;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfProductDefinition;
		 StepBasic_Array1OfProductDefinition (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_Array1OfProductDefinition;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepBasic_ProductDefinition &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfProductDefinition;
		 StepBasic_Array1OfProductDefinition (const Handle_StepBasic_ProductDefinition & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_ProductDefinition &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_ProductDefinition & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfProductDefinition &
	:rtype: StepBasic_Array1OfProductDefinition
") Assign;
		const StepBasic_Array1OfProductDefinition & Assign (const StepBasic_Array1OfProductDefinition & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfProductDefinition &
	:rtype: StepBasic_Array1OfProductDefinition
") operator =;
		const StepBasic_Array1OfProductDefinition & operator = (const StepBasic_Array1OfProductDefinition & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_ProductDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_ProductDefinition & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_ProductDefinition
") Value;
		Handle_StepBasic_ProductDefinition Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_ProductDefinition
") ChangeValue;
		Handle_StepBasic_ProductDefinition ChangeValue (const Standard_Integer Index);
};


%extend StepBasic_Array1OfProductDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Array1OfUncertaintyMeasureWithUnit;
class StepBasic_Array1OfUncertaintyMeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_Array1OfUncertaintyMeasureWithUnit;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfUncertaintyMeasureWithUnit;
		 StepBasic_Array1OfUncertaintyMeasureWithUnit (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_Array1OfUncertaintyMeasureWithUnit;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepBasic_UncertaintyMeasureWithUnit &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_Array1OfUncertaintyMeasureWithUnit;
		 StepBasic_Array1OfUncertaintyMeasureWithUnit (const Handle_StepBasic_UncertaintyMeasureWithUnit & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_UncertaintyMeasureWithUnit &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_UncertaintyMeasureWithUnit & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfUncertaintyMeasureWithUnit &
	:rtype: StepBasic_Array1OfUncertaintyMeasureWithUnit
") Assign;
		const StepBasic_Array1OfUncertaintyMeasureWithUnit & Assign (const StepBasic_Array1OfUncertaintyMeasureWithUnit & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepBasic_Array1OfUncertaintyMeasureWithUnit &
	:rtype: StepBasic_Array1OfUncertaintyMeasureWithUnit
") operator =;
		const StepBasic_Array1OfUncertaintyMeasureWithUnit & operator = (const StepBasic_Array1OfUncertaintyMeasureWithUnit & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_UncertaintyMeasureWithUnit &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_UncertaintyMeasureWithUnit & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_UncertaintyMeasureWithUnit
") Value;
		Handle_StepBasic_UncertaintyMeasureWithUnit Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_UncertaintyMeasureWithUnit
") ChangeValue;
		Handle_StepBasic_UncertaintyMeasureWithUnit ChangeValue (const Standard_Integer Index);
};


%extend StepBasic_Array1OfUncertaintyMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Certification;
class StepBasic_Certification : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Certification;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_Certification;
		 StepBasic_Certification ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPurpose:
	:type aPurpose: Handle_TCollection_HAsciiString &
	:param aKind:
	:type aKind: Handle_StepBasic_CertificationType &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aPurpose,const Handle_StepBasic_CertificationType & aKind);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: Handle_TCollection_HAsciiString
") Purpose;
		Handle_TCollection_HAsciiString Purpose ();
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPurpose;
		void SetPurpose (const Handle_TCollection_HAsciiString & Purpose);
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "	* Returns field Kind

	:rtype: Handle_StepBasic_CertificationType
") Kind;
		Handle_StepBasic_CertificationType Kind ();
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "	* Set field Kind

	:param Kind:
	:type Kind: Handle_StepBasic_CertificationType &
	:rtype: None
") SetKind;
		void SetKind (const Handle_StepBasic_CertificationType & Kind);
};


%extend StepBasic_Certification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Certification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Certification::Handle_StepBasic_Certification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Certification;
class Handle_StepBasic_Certification : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Certification();
        Handle_StepBasic_Certification(const Handle_StepBasic_Certification &aHandle);
        Handle_StepBasic_Certification(const StepBasic_Certification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Certification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Certification {
    StepBasic_Certification* _get_reference() {
    return (StepBasic_Certification*)$self->Access();
    }
};

%extend Handle_StepBasic_Certification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Certification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_CertificationAssignment;
class StepBasic_CertificationAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_CertificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_CertificationAssignment;
		 StepBasic_CertificationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedCertification:
	:type aAssignedCertification: Handle_StepBasic_Certification &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Certification & aAssignedCertification);
		%feature("compactdefaultargs") AssignedCertification;
		%feature("autodoc", "	* Returns field AssignedCertification

	:rtype: Handle_StepBasic_Certification
") AssignedCertification;
		Handle_StepBasic_Certification AssignedCertification ();
		%feature("compactdefaultargs") SetAssignedCertification;
		%feature("autodoc", "	* Set field AssignedCertification

	:param AssignedCertification:
	:type AssignedCertification: Handle_StepBasic_Certification &
	:rtype: None
") SetAssignedCertification;
		void SetAssignedCertification (const Handle_StepBasic_Certification & AssignedCertification);
};


%extend StepBasic_CertificationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_CertificationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_CertificationAssignment::Handle_StepBasic_CertificationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_CertificationAssignment;
class Handle_StepBasic_CertificationAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_CertificationAssignment();
        Handle_StepBasic_CertificationAssignment(const Handle_StepBasic_CertificationAssignment &aHandle);
        Handle_StepBasic_CertificationAssignment(const StepBasic_CertificationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_CertificationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_CertificationAssignment {
    StepBasic_CertificationAssignment* _get_reference() {
    return (StepBasic_CertificationAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_CertificationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_CertificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_CertificationType;
class StepBasic_CertificationType : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_CertificationType;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_CertificationType;
		 StepBasic_CertificationType ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
};


%extend StepBasic_CertificationType {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_CertificationType(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_CertificationType::Handle_StepBasic_CertificationType %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_CertificationType;
class Handle_StepBasic_CertificationType : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_CertificationType();
        Handle_StepBasic_CertificationType(const Handle_StepBasic_CertificationType &aHandle);
        Handle_StepBasic_CertificationType(const StepBasic_CertificationType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_CertificationType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_CertificationType {
    StepBasic_CertificationType* _get_reference() {
    return (StepBasic_CertificationType*)$self->Access();
    }
};

%extend Handle_StepBasic_CertificationType {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_CertificationType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_CharacterizedObject;
class StepBasic_CharacterizedObject : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_CharacterizedObject;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_CharacterizedObject;
		 StepBasic_CharacterizedObject ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
};


%extend StepBasic_CharacterizedObject {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_CharacterizedObject(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_CharacterizedObject::Handle_StepBasic_CharacterizedObject %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_CharacterizedObject;
class Handle_StepBasic_CharacterizedObject : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_CharacterizedObject();
        Handle_StepBasic_CharacterizedObject(const Handle_StepBasic_CharacterizedObject &aHandle);
        Handle_StepBasic_CharacterizedObject(const StepBasic_CharacterizedObject *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_CharacterizedObject DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_CharacterizedObject {
    StepBasic_CharacterizedObject* _get_reference() {
    return (StepBasic_CharacterizedObject*)$self->Access();
    }
};

%extend Handle_StepBasic_CharacterizedObject {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_CharacterizedObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Contract;
class StepBasic_Contract : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Contract;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_Contract;
		 StepBasic_Contract ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPurpose:
	:type aPurpose: Handle_TCollection_HAsciiString &
	:param aKind:
	:type aKind: Handle_StepBasic_ContractType &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aPurpose,const Handle_StepBasic_ContractType & aKind);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: Handle_TCollection_HAsciiString
") Purpose;
		Handle_TCollection_HAsciiString Purpose ();
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPurpose;
		void SetPurpose (const Handle_TCollection_HAsciiString & Purpose);
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "	* Returns field Kind

	:rtype: Handle_StepBasic_ContractType
") Kind;
		Handle_StepBasic_ContractType Kind ();
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "	* Set field Kind

	:param Kind:
	:type Kind: Handle_StepBasic_ContractType &
	:rtype: None
") SetKind;
		void SetKind (const Handle_StepBasic_ContractType & Kind);
};


%extend StepBasic_Contract {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Contract(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Contract::Handle_StepBasic_Contract %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Contract;
class Handle_StepBasic_Contract : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Contract();
        Handle_StepBasic_Contract(const Handle_StepBasic_Contract &aHandle);
        Handle_StepBasic_Contract(const StepBasic_Contract *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Contract DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Contract {
    StepBasic_Contract* _get_reference() {
    return (StepBasic_Contract*)$self->Access();
    }
};

%extend Handle_StepBasic_Contract {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Contract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ContractAssignment;
class StepBasic_ContractAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ContractAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ContractAssignment;
		 StepBasic_ContractAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedContract:
	:type aAssignedContract: Handle_StepBasic_Contract &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Contract & aAssignedContract);
		%feature("compactdefaultargs") AssignedContract;
		%feature("autodoc", "	* Returns field AssignedContract

	:rtype: Handle_StepBasic_Contract
") AssignedContract;
		Handle_StepBasic_Contract AssignedContract ();
		%feature("compactdefaultargs") SetAssignedContract;
		%feature("autodoc", "	* Set field AssignedContract

	:param AssignedContract:
	:type AssignedContract: Handle_StepBasic_Contract &
	:rtype: None
") SetAssignedContract;
		void SetAssignedContract (const Handle_StepBasic_Contract & AssignedContract);
};


%extend StepBasic_ContractAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ContractAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ContractAssignment::Handle_StepBasic_ContractAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ContractAssignment;
class Handle_StepBasic_ContractAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ContractAssignment();
        Handle_StepBasic_ContractAssignment(const Handle_StepBasic_ContractAssignment &aHandle);
        Handle_StepBasic_ContractAssignment(const StepBasic_ContractAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ContractAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ContractAssignment {
    StepBasic_ContractAssignment* _get_reference() {
    return (StepBasic_ContractAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_ContractAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ContractAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ContractType;
class StepBasic_ContractType : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ContractType;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ContractType;
		 StepBasic_ContractType ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
};


%extend StepBasic_ContractType {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ContractType(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ContractType::Handle_StepBasic_ContractType %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ContractType;
class Handle_StepBasic_ContractType : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ContractType();
        Handle_StepBasic_ContractType(const Handle_StepBasic_ContractType &aHandle);
        Handle_StepBasic_ContractType(const StepBasic_ContractType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ContractType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ContractType {
    StepBasic_ContractType* _get_reference() {
    return (StepBasic_ContractType*)$self->Access();
    }
};

%extend Handle_StepBasic_ContractType {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ContractType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_CoordinatedUniversalTimeOffset;
class StepBasic_CoordinatedUniversalTimeOffset : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_CoordinatedUniversalTimeOffset;
		%feature("autodoc", "	* Returns a CoordinatedUniversalTimeOffset

	:rtype: None
") StepBasic_CoordinatedUniversalTimeOffset;
		 StepBasic_CoordinatedUniversalTimeOffset ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aHourOffset:
	:type aHourOffset: int
	:param hasAminuteOffset:
	:type hasAminuteOffset: bool
	:param aMinuteOffset:
	:type aMinuteOffset: int
	:param aSense:
	:type aSense: StepBasic_AheadOrBehind
	:rtype: void
") Init;
		virtual void Init (const Standard_Integer aHourOffset,const Standard_Boolean hasAminuteOffset,const Standard_Integer aMinuteOffset,const StepBasic_AheadOrBehind aSense);
		%feature("compactdefaultargs") SetHourOffset;
		%feature("autodoc", "	:param aHourOffset:
	:type aHourOffset: int
	:rtype: None
") SetHourOffset;
		void SetHourOffset (const Standard_Integer aHourOffset);
		%feature("compactdefaultargs") HourOffset;
		%feature("autodoc", "	:rtype: int
") HourOffset;
		Standard_Integer HourOffset ();
		%feature("compactdefaultargs") SetMinuteOffset;
		%feature("autodoc", "	:param aMinuteOffset:
	:type aMinuteOffset: int
	:rtype: None
") SetMinuteOffset;
		void SetMinuteOffset (const Standard_Integer aMinuteOffset);
		%feature("compactdefaultargs") UnSetMinuteOffset;
		%feature("autodoc", "	:rtype: None
") UnSetMinuteOffset;
		void UnSetMinuteOffset ();
		%feature("compactdefaultargs") MinuteOffset;
		%feature("autodoc", "	:rtype: int
") MinuteOffset;
		Standard_Integer MinuteOffset ();
		%feature("compactdefaultargs") HasMinuteOffset;
		%feature("autodoc", "	:rtype: bool
") HasMinuteOffset;
		Standard_Boolean HasMinuteOffset ();
		%feature("compactdefaultargs") SetSense;
		%feature("autodoc", "	:param aSense:
	:type aSense: StepBasic_AheadOrBehind
	:rtype: None
") SetSense;
		void SetSense (const StepBasic_AheadOrBehind aSense);
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "	:rtype: StepBasic_AheadOrBehind
") Sense;
		StepBasic_AheadOrBehind Sense ();
};


%extend StepBasic_CoordinatedUniversalTimeOffset {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_CoordinatedUniversalTimeOffset(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_CoordinatedUniversalTimeOffset::Handle_StepBasic_CoordinatedUniversalTimeOffset %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_CoordinatedUniversalTimeOffset;
class Handle_StepBasic_CoordinatedUniversalTimeOffset : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_CoordinatedUniversalTimeOffset();
        Handle_StepBasic_CoordinatedUniversalTimeOffset(const Handle_StepBasic_CoordinatedUniversalTimeOffset &aHandle);
        Handle_StepBasic_CoordinatedUniversalTimeOffset(const StepBasic_CoordinatedUniversalTimeOffset *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_CoordinatedUniversalTimeOffset DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_CoordinatedUniversalTimeOffset {
    StepBasic_CoordinatedUniversalTimeOffset* _get_reference() {
    return (StepBasic_CoordinatedUniversalTimeOffset*)$self->Access();
    }
};

%extend Handle_StepBasic_CoordinatedUniversalTimeOffset {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_CoordinatedUniversalTimeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Date;
class StepBasic_Date : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Date;
		%feature("autodoc", "	* Returns a Date

	:rtype: None
") StepBasic_Date;
		 StepBasic_Date ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Integer aYearComponent);
		%feature("compactdefaultargs") SetYearComponent;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:rtype: None
") SetYearComponent;
		void SetYearComponent (const Standard_Integer aYearComponent);
		%feature("compactdefaultargs") YearComponent;
		%feature("autodoc", "	:rtype: int
") YearComponent;
		Standard_Integer YearComponent ();
};


%extend StepBasic_Date {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Date(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Date::Handle_StepBasic_Date %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Date;
class Handle_StepBasic_Date : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Date();
        Handle_StepBasic_Date(const Handle_StepBasic_Date &aHandle);
        Handle_StepBasic_Date(const StepBasic_Date *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Date DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Date {
    StepBasic_Date* _get_reference() {
    return (StepBasic_Date*)$self->Access();
    }
};

%extend Handle_StepBasic_Date {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Date {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateAndTime;
class StepBasic_DateAndTime : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DateAndTime;
		%feature("autodoc", "	* Returns a DateAndTime

	:rtype: None
") StepBasic_DateAndTime;
		 StepBasic_DateAndTime ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDateComponent:
	:type aDateComponent: Handle_StepBasic_Date &
	:param aTimeComponent:
	:type aTimeComponent: Handle_StepBasic_LocalTime &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Date & aDateComponent,const Handle_StepBasic_LocalTime & aTimeComponent);
		%feature("compactdefaultargs") SetDateComponent;
		%feature("autodoc", "	:param aDateComponent:
	:type aDateComponent: Handle_StepBasic_Date &
	:rtype: None
") SetDateComponent;
		void SetDateComponent (const Handle_StepBasic_Date & aDateComponent);
		%feature("compactdefaultargs") DateComponent;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Date
") DateComponent;
		Handle_StepBasic_Date DateComponent ();
		%feature("compactdefaultargs") SetTimeComponent;
		%feature("autodoc", "	:param aTimeComponent:
	:type aTimeComponent: Handle_StepBasic_LocalTime &
	:rtype: None
") SetTimeComponent;
		void SetTimeComponent (const Handle_StepBasic_LocalTime & aTimeComponent);
		%feature("compactdefaultargs") TimeComponent;
		%feature("autodoc", "	:rtype: Handle_StepBasic_LocalTime
") TimeComponent;
		Handle_StepBasic_LocalTime TimeComponent ();
};


%extend StepBasic_DateAndTime {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DateAndTime(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DateAndTime::Handle_StepBasic_DateAndTime %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DateAndTime;
class Handle_StepBasic_DateAndTime : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DateAndTime();
        Handle_StepBasic_DateAndTime(const Handle_StepBasic_DateAndTime &aHandle);
        Handle_StepBasic_DateAndTime(const StepBasic_DateAndTime *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DateAndTime DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DateAndTime {
    StepBasic_DateAndTime* _get_reference() {
    return (StepBasic_DateAndTime*)$self->Access();
    }
};

%extend Handle_StepBasic_DateAndTime {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DateAndTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateAndTimeAssignment;
class StepBasic_DateAndTimeAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aRole);
		%feature("compactdefaultargs") SetAssignedDateAndTime;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:rtype: None
") SetAssignedDateAndTime;
		void SetAssignedDateAndTime (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime);
		%feature("compactdefaultargs") AssignedDateAndTime;
		%feature("autodoc", "	:rtype: Handle_StepBasic_DateAndTime
") AssignedDateAndTime;
		Handle_StepBasic_DateAndTime AssignedDateAndTime ();
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:rtype: None
") SetRole;
		void SetRole (const Handle_StepBasic_DateTimeRole & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: Handle_StepBasic_DateTimeRole
") Role;
		Handle_StepBasic_DateTimeRole Role ();
};


%extend StepBasic_DateAndTimeAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DateAndTimeAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DateAndTimeAssignment::Handle_StepBasic_DateAndTimeAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DateAndTimeAssignment;
class Handle_StepBasic_DateAndTimeAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DateAndTimeAssignment();
        Handle_StepBasic_DateAndTimeAssignment(const Handle_StepBasic_DateAndTimeAssignment &aHandle);
        Handle_StepBasic_DateAndTimeAssignment(const StepBasic_DateAndTimeAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DateAndTimeAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DateAndTimeAssignment {
    StepBasic_DateAndTimeAssignment* _get_reference() {
    return (StepBasic_DateAndTimeAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_DateAndTimeAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateAssignment;
class StepBasic_DateAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Date & aAssignedDate,const Handle_StepBasic_DateRole & aRole);
		%feature("compactdefaultargs") SetAssignedDate;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:rtype: None
") SetAssignedDate;
		void SetAssignedDate (const Handle_StepBasic_Date & aAssignedDate);
		%feature("compactdefaultargs") AssignedDate;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Date
") AssignedDate;
		Handle_StepBasic_Date AssignedDate ();
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:rtype: None
") SetRole;
		void SetRole (const Handle_StepBasic_DateRole & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: Handle_StepBasic_DateRole
") Role;
		Handle_StepBasic_DateRole Role ();
};


%extend StepBasic_DateAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DateAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DateAssignment::Handle_StepBasic_DateAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DateAssignment;
class Handle_StepBasic_DateAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DateAssignment();
        Handle_StepBasic_DateAssignment(const Handle_StepBasic_DateAssignment &aHandle);
        Handle_StepBasic_DateAssignment(const StepBasic_DateAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DateAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DateAssignment {
    StepBasic_DateAssignment* _get_reference() {
    return (StepBasic_DateAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_DateAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateRole;
class StepBasic_DateRole : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DateRole;
		%feature("autodoc", "	* Returns a DateRole

	:rtype: None
") StepBasic_DateRole;
		 StepBasic_DateRole ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
};


%extend StepBasic_DateRole {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DateRole(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DateRole::Handle_StepBasic_DateRole %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DateRole;
class Handle_StepBasic_DateRole : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DateRole();
        Handle_StepBasic_DateRole(const Handle_StepBasic_DateRole &aHandle);
        Handle_StepBasic_DateRole(const StepBasic_DateRole *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DateRole DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DateRole {
    StepBasic_DateRole* _get_reference() {
    return (StepBasic_DateRole*)$self->Access();
    }
};

%extend Handle_StepBasic_DateRole {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DateRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateTimeRole;
class StepBasic_DateTimeRole : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DateTimeRole;
		%feature("autodoc", "	* Returns a DateTimeRole

	:rtype: None
") StepBasic_DateTimeRole;
		 StepBasic_DateTimeRole ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
};


%extend StepBasic_DateTimeRole {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DateTimeRole(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DateTimeRole::Handle_StepBasic_DateTimeRole %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DateTimeRole;
class Handle_StepBasic_DateTimeRole : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DateTimeRole();
        Handle_StepBasic_DateTimeRole(const Handle_StepBasic_DateTimeRole &aHandle);
        Handle_StepBasic_DateTimeRole(const StepBasic_DateTimeRole *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DateTimeRole DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DateTimeRole {
    StepBasic_DateTimeRole* _get_reference() {
    return (StepBasic_DateTimeRole*)$self->Access();
    }
};

%extend Handle_StepBasic_DateTimeRole {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DateTimeRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateTimeSelect;
class StepBasic_DateTimeSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepBasic_DateTimeSelect;
		%feature("autodoc", "	* Returns a DateTimeSelect SelectType

	:rtype: None
") StepBasic_DateTimeSelect;
		 StepBasic_DateTimeSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a DateTimeSelect Kind Entity that is : 1 -> Date 2 -> LocalTime 3 -> DateAndTime 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "	* returns Value as a Date (Null if another type)

	:rtype: Handle_StepBasic_Date
") Date;
		Handle_StepBasic_Date Date ();
		%feature("compactdefaultargs") LocalTime;
		%feature("autodoc", "	* returns Value as a LocalTime (Null if another type)

	:rtype: Handle_StepBasic_LocalTime
") LocalTime;
		Handle_StepBasic_LocalTime LocalTime ();
		%feature("compactdefaultargs") DateAndTime;
		%feature("autodoc", "	* returns Value as a DateAndTime (Null if another type)

	:rtype: Handle_StepBasic_DateAndTime
") DateAndTime;
		Handle_StepBasic_DateAndTime DateAndTime ();
};


%extend StepBasic_DateTimeSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DerivedUnit;
class StepBasic_DerivedUnit : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DerivedUnit;
		%feature("autodoc", "	:rtype: None
") StepBasic_DerivedUnit;
		 StepBasic_DerivedUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param elements:
	:type elements: Handle_StepBasic_HArray1OfDerivedUnitElement &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_HArray1OfDerivedUnitElement & elements);
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "	:param elements:
	:type elements: Handle_StepBasic_HArray1OfDerivedUnitElement &
	:rtype: None
") SetElements;
		void SetElements (const Handle_StepBasic_HArray1OfDerivedUnitElement & elements);
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfDerivedUnitElement
") Elements;
		Handle_StepBasic_HArray1OfDerivedUnitElement Elements ();
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "	:rtype: int
") NbElements;
		Standard_Integer NbElements ();
		%feature("compactdefaultargs") ElementsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_DerivedUnitElement
") ElementsValue;
		Handle_StepBasic_DerivedUnitElement ElementsValue (const Standard_Integer num);
};


%extend StepBasic_DerivedUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DerivedUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DerivedUnit::Handle_StepBasic_DerivedUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DerivedUnit;
class Handle_StepBasic_DerivedUnit : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DerivedUnit();
        Handle_StepBasic_DerivedUnit(const Handle_StepBasic_DerivedUnit &aHandle);
        Handle_StepBasic_DerivedUnit(const StepBasic_DerivedUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DerivedUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DerivedUnit {
    StepBasic_DerivedUnit* _get_reference() {
    return (StepBasic_DerivedUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_DerivedUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DerivedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DerivedUnitElement;
class StepBasic_DerivedUnitElement : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DerivedUnitElement;
		%feature("autodoc", "	:rtype: None
") StepBasic_DerivedUnitElement;
		 StepBasic_DerivedUnitElement ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aUnit:
	:type aUnit: Handle_StepBasic_NamedUnit &
	:param aExponent:
	:type aExponent: float
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_NamedUnit & aUnit,const Standard_Real aExponent);
		%feature("compactdefaultargs") SetUnit;
		%feature("autodoc", "	:param aUnit:
	:type aUnit: Handle_StepBasic_NamedUnit &
	:rtype: None
") SetUnit;
		void SetUnit (const Handle_StepBasic_NamedUnit & aUnit);
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_NamedUnit
") Unit;
		Handle_StepBasic_NamedUnit Unit ();
		%feature("compactdefaultargs") SetExponent;
		%feature("autodoc", "	:param aExponent:
	:type aExponent: float
	:rtype: None
") SetExponent;
		void SetExponent (const Standard_Real aExponent);
		%feature("compactdefaultargs") Exponent;
		%feature("autodoc", "	:rtype: float
") Exponent;
		Standard_Real Exponent ();
};


%extend StepBasic_DerivedUnitElement {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DerivedUnitElement(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DerivedUnitElement::Handle_StepBasic_DerivedUnitElement %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DerivedUnitElement;
class Handle_StepBasic_DerivedUnitElement : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DerivedUnitElement();
        Handle_StepBasic_DerivedUnitElement(const Handle_StepBasic_DerivedUnitElement &aHandle);
        Handle_StepBasic_DerivedUnitElement(const StepBasic_DerivedUnitElement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DerivedUnitElement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DerivedUnitElement {
    StepBasic_DerivedUnitElement* _get_reference() {
    return (StepBasic_DerivedUnitElement*)$self->Access();
    }
};

%extend Handle_StepBasic_DerivedUnitElement {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DerivedUnitElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DimensionalExponents;
class StepBasic_DimensionalExponents : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DimensionalExponents;
		%feature("autodoc", "	* Returns a DimensionalExponents

	:rtype: None
") StepBasic_DimensionalExponents;
		 StepBasic_DimensionalExponents ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aLengthExponent:
	:type aLengthExponent: float
	:param aMassExponent:
	:type aMassExponent: float
	:param aTimeExponent:
	:type aTimeExponent: float
	:param aElectricCurrentExponent:
	:type aElectricCurrentExponent: float
	:param aThermodynamicTemperatureExponent:
	:type aThermodynamicTemperatureExponent: float
	:param aAmountOfSubstanceExponent:
	:type aAmountOfSubstanceExponent: float
	:param aLuminousIntensityExponent:
	:type aLuminousIntensityExponent: float
	:rtype: void
") Init;
		virtual void Init (const Standard_Real aLengthExponent,const Standard_Real aMassExponent,const Standard_Real aTimeExponent,const Standard_Real aElectricCurrentExponent,const Standard_Real aThermodynamicTemperatureExponent,const Standard_Real aAmountOfSubstanceExponent,const Standard_Real aLuminousIntensityExponent);
		%feature("compactdefaultargs") SetLengthExponent;
		%feature("autodoc", "	:param aLengthExponent:
	:type aLengthExponent: float
	:rtype: None
") SetLengthExponent;
		void SetLengthExponent (const Standard_Real aLengthExponent);
		%feature("compactdefaultargs") LengthExponent;
		%feature("autodoc", "	:rtype: float
") LengthExponent;
		Standard_Real LengthExponent ();
		%feature("compactdefaultargs") SetMassExponent;
		%feature("autodoc", "	:param aMassExponent:
	:type aMassExponent: float
	:rtype: None
") SetMassExponent;
		void SetMassExponent (const Standard_Real aMassExponent);
		%feature("compactdefaultargs") MassExponent;
		%feature("autodoc", "	:rtype: float
") MassExponent;
		Standard_Real MassExponent ();
		%feature("compactdefaultargs") SetTimeExponent;
		%feature("autodoc", "	:param aTimeExponent:
	:type aTimeExponent: float
	:rtype: None
") SetTimeExponent;
		void SetTimeExponent (const Standard_Real aTimeExponent);
		%feature("compactdefaultargs") TimeExponent;
		%feature("autodoc", "	:rtype: float
") TimeExponent;
		Standard_Real TimeExponent ();
		%feature("compactdefaultargs") SetElectricCurrentExponent;
		%feature("autodoc", "	:param aElectricCurrentExponent:
	:type aElectricCurrentExponent: float
	:rtype: None
") SetElectricCurrentExponent;
		void SetElectricCurrentExponent (const Standard_Real aElectricCurrentExponent);
		%feature("compactdefaultargs") ElectricCurrentExponent;
		%feature("autodoc", "	:rtype: float
") ElectricCurrentExponent;
		Standard_Real ElectricCurrentExponent ();
		%feature("compactdefaultargs") SetThermodynamicTemperatureExponent;
		%feature("autodoc", "	:param aThermodynamicTemperatureExponent:
	:type aThermodynamicTemperatureExponent: float
	:rtype: None
") SetThermodynamicTemperatureExponent;
		void SetThermodynamicTemperatureExponent (const Standard_Real aThermodynamicTemperatureExponent);
		%feature("compactdefaultargs") ThermodynamicTemperatureExponent;
		%feature("autodoc", "	:rtype: float
") ThermodynamicTemperatureExponent;
		Standard_Real ThermodynamicTemperatureExponent ();
		%feature("compactdefaultargs") SetAmountOfSubstanceExponent;
		%feature("autodoc", "	:param aAmountOfSubstanceExponent:
	:type aAmountOfSubstanceExponent: float
	:rtype: None
") SetAmountOfSubstanceExponent;
		void SetAmountOfSubstanceExponent (const Standard_Real aAmountOfSubstanceExponent);
		%feature("compactdefaultargs") AmountOfSubstanceExponent;
		%feature("autodoc", "	:rtype: float
") AmountOfSubstanceExponent;
		Standard_Real AmountOfSubstanceExponent ();
		%feature("compactdefaultargs") SetLuminousIntensityExponent;
		%feature("autodoc", "	:param aLuminousIntensityExponent:
	:type aLuminousIntensityExponent: float
	:rtype: None
") SetLuminousIntensityExponent;
		void SetLuminousIntensityExponent (const Standard_Real aLuminousIntensityExponent);
		%feature("compactdefaultargs") LuminousIntensityExponent;
		%feature("autodoc", "	:rtype: float
") LuminousIntensityExponent;
		Standard_Real LuminousIntensityExponent ();
};


%extend StepBasic_DimensionalExponents {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DimensionalExponents(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DimensionalExponents::Handle_StepBasic_DimensionalExponents %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DimensionalExponents;
class Handle_StepBasic_DimensionalExponents : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DimensionalExponents();
        Handle_StepBasic_DimensionalExponents(const Handle_StepBasic_DimensionalExponents &aHandle);
        Handle_StepBasic_DimensionalExponents(const StepBasic_DimensionalExponents *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DimensionalExponents DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DimensionalExponents {
    StepBasic_DimensionalExponents* _get_reference() {
    return (StepBasic_DimensionalExponents*)$self->Access();
    }
};

%extend Handle_StepBasic_DimensionalExponents {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DimensionalExponents {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Document;
class StepBasic_Document : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Document;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_Document;
		 StepBasic_Document ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aKind:
	:type aKind: Handle_StepBasic_DocumentType &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_DocumentType & aKind);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & Id);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "	* Returns field Kind

	:rtype: Handle_StepBasic_DocumentType
") Kind;
		Handle_StepBasic_DocumentType Kind ();
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "	* Set field Kind

	:param Kind:
	:type Kind: Handle_StepBasic_DocumentType &
	:rtype: None
") SetKind;
		void SetKind (const Handle_StepBasic_DocumentType & Kind);
};


%extend StepBasic_Document {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Document(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Document::Handle_StepBasic_Document %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Document;
class Handle_StepBasic_Document : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Document();
        Handle_StepBasic_Document(const Handle_StepBasic_Document &aHandle);
        Handle_StepBasic_Document(const StepBasic_Document *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Document DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Document {
    StepBasic_Document* _get_reference() {
    return (StepBasic_Document*)$self->Access();
    }
};

%extend Handle_StepBasic_Document {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentProductAssociation;
class StepBasic_DocumentProductAssociation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DocumentProductAssociation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_DocumentProductAssociation;
		 StepBasic_DocumentProductAssociation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRelatingDocument:
	:type aRelatingDocument: Handle_StepBasic_Document &
	:param aRelatedProduct:
	:type aRelatedProduct: StepBasic_ProductOrFormationOrDefinition &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_Document & aRelatingDocument,const StepBasic_ProductOrFormationOrDefinition & aRelatedProduct);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") RelatingDocument;
		%feature("autodoc", "	* Returns field RelatingDocument

	:rtype: Handle_StepBasic_Document
") RelatingDocument;
		Handle_StepBasic_Document RelatingDocument ();
		%feature("compactdefaultargs") SetRelatingDocument;
		%feature("autodoc", "	* Set field RelatingDocument

	:param RelatingDocument:
	:type RelatingDocument: Handle_StepBasic_Document &
	:rtype: None
") SetRelatingDocument;
		void SetRelatingDocument (const Handle_StepBasic_Document & RelatingDocument);
		%feature("compactdefaultargs") RelatedProduct;
		%feature("autodoc", "	* Returns field RelatedProduct

	:rtype: StepBasic_ProductOrFormationOrDefinition
") RelatedProduct;
		StepBasic_ProductOrFormationOrDefinition RelatedProduct ();
		%feature("compactdefaultargs") SetRelatedProduct;
		%feature("autodoc", "	* Set field RelatedProduct

	:param RelatedProduct:
	:type RelatedProduct: StepBasic_ProductOrFormationOrDefinition &
	:rtype: None
") SetRelatedProduct;
		void SetRelatedProduct (const StepBasic_ProductOrFormationOrDefinition & RelatedProduct);
};


%extend StepBasic_DocumentProductAssociation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DocumentProductAssociation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DocumentProductAssociation::Handle_StepBasic_DocumentProductAssociation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DocumentProductAssociation;
class Handle_StepBasic_DocumentProductAssociation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DocumentProductAssociation();
        Handle_StepBasic_DocumentProductAssociation(const Handle_StepBasic_DocumentProductAssociation &aHandle);
        Handle_StepBasic_DocumentProductAssociation(const StepBasic_DocumentProductAssociation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DocumentProductAssociation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentProductAssociation {
    StepBasic_DocumentProductAssociation* _get_reference() {
    return (StepBasic_DocumentProductAssociation*)$self->Access();
    }
};

%extend Handle_StepBasic_DocumentProductAssociation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DocumentProductAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentReference;
class StepBasic_DocumentReference : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Init0;
		%feature("autodoc", "	:param aAssignedDocument:
	:type aAssignedDocument: Handle_StepBasic_Document &
	:param aSource:
	:type aSource: Handle_TCollection_HAsciiString &
	:rtype: None
") Init0;
		void Init0 (const Handle_StepBasic_Document & aAssignedDocument,const Handle_TCollection_HAsciiString & aSource);
		%feature("compactdefaultargs") AssignedDocument;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Document
") AssignedDocument;
		Handle_StepBasic_Document AssignedDocument ();
		%feature("compactdefaultargs") SetAssignedDocument;
		%feature("autodoc", "	:param aAssignedDocument:
	:type aAssignedDocument: Handle_StepBasic_Document &
	:rtype: None
") SetAssignedDocument;
		void SetAssignedDocument (const Handle_StepBasic_Document & aAssignedDocument);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Source;
		Handle_TCollection_HAsciiString Source ();
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	:param aSource:
	:type aSource: Handle_TCollection_HAsciiString &
	:rtype: None
") SetSource;
		void SetSource (const Handle_TCollection_HAsciiString & aSource);
};


%extend StepBasic_DocumentReference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DocumentReference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DocumentReference::Handle_StepBasic_DocumentReference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DocumentReference;
class Handle_StepBasic_DocumentReference : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DocumentReference();
        Handle_StepBasic_DocumentReference(const Handle_StepBasic_DocumentReference &aHandle);
        Handle_StepBasic_DocumentReference(const StepBasic_DocumentReference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DocumentReference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentReference {
    StepBasic_DocumentReference* _get_reference() {
    return (StepBasic_DocumentReference*)$self->Access();
    }
};

%extend Handle_StepBasic_DocumentReference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentRelationship;
class StepBasic_DocumentRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DocumentRelationship;
		%feature("autodoc", "	:rtype: None
") StepBasic_DocumentRelationship;
		 StepBasic_DocumentRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRelating:
	:type aRelating: Handle_StepBasic_Document &
	:param aRelated:
	:type aRelated: Handle_StepBasic_Document &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_Document & aRelating,const Handle_StepBasic_Document & aRelated);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") RelatingDocument;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Document
") RelatingDocument;
		Handle_StepBasic_Document RelatingDocument ();
		%feature("compactdefaultargs") SetRelatingDocument;
		%feature("autodoc", "	:param aRelating:
	:type aRelating: Handle_StepBasic_Document &
	:rtype: None
") SetRelatingDocument;
		void SetRelatingDocument (const Handle_StepBasic_Document & aRelating);
		%feature("compactdefaultargs") RelatedDocument;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Document
") RelatedDocument;
		Handle_StepBasic_Document RelatedDocument ();
		%feature("compactdefaultargs") SetRelatedDocument;
		%feature("autodoc", "	:param aRelated:
	:type aRelated: Handle_StepBasic_Document &
	:rtype: None
") SetRelatedDocument;
		void SetRelatedDocument (const Handle_StepBasic_Document & aRelated);
};


%extend StepBasic_DocumentRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DocumentRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DocumentRelationship::Handle_StepBasic_DocumentRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DocumentRelationship;
class Handle_StepBasic_DocumentRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DocumentRelationship();
        Handle_StepBasic_DocumentRelationship(const Handle_StepBasic_DocumentRelationship &aHandle);
        Handle_StepBasic_DocumentRelationship(const StepBasic_DocumentRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DocumentRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentRelationship {
    StepBasic_DocumentRelationship* _get_reference() {
    return (StepBasic_DocumentRelationship*)$self->Access();
    }
};

%extend Handle_StepBasic_DocumentRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DocumentRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentRepresentationType;
class StepBasic_DocumentRepresentationType : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DocumentRepresentationType;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_DocumentRepresentationType;
		 StepBasic_DocumentRepresentationType ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aRepresentedDocument:
	:type aRepresentedDocument: Handle_StepBasic_Document &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_Document & aRepresentedDocument);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") RepresentedDocument;
		%feature("autodoc", "	* Returns field RepresentedDocument

	:rtype: Handle_StepBasic_Document
") RepresentedDocument;
		Handle_StepBasic_Document RepresentedDocument ();
		%feature("compactdefaultargs") SetRepresentedDocument;
		%feature("autodoc", "	* Set field RepresentedDocument

	:param RepresentedDocument:
	:type RepresentedDocument: Handle_StepBasic_Document &
	:rtype: None
") SetRepresentedDocument;
		void SetRepresentedDocument (const Handle_StepBasic_Document & RepresentedDocument);
};


%extend StepBasic_DocumentRepresentationType {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DocumentRepresentationType(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DocumentRepresentationType::Handle_StepBasic_DocumentRepresentationType %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DocumentRepresentationType;
class Handle_StepBasic_DocumentRepresentationType : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DocumentRepresentationType();
        Handle_StepBasic_DocumentRepresentationType(const Handle_StepBasic_DocumentRepresentationType &aHandle);
        Handle_StepBasic_DocumentRepresentationType(const StepBasic_DocumentRepresentationType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DocumentRepresentationType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentRepresentationType {
    StepBasic_DocumentRepresentationType* _get_reference() {
    return (StepBasic_DocumentRepresentationType*)$self->Access();
    }
};

%extend Handle_StepBasic_DocumentRepresentationType {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DocumentRepresentationType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentType;
class StepBasic_DocumentType : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DocumentType;
		%feature("autodoc", "	:rtype: None
") StepBasic_DocumentType;
		 StepBasic_DocumentType ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param apdt:
	:type apdt: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & apdt);
		%feature("compactdefaultargs") ProductDataType;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") ProductDataType;
		Handle_TCollection_HAsciiString ProductDataType ();
		%feature("compactdefaultargs") SetProductDataType;
		%feature("autodoc", "	:param apdt:
	:type apdt: Handle_TCollection_HAsciiString &
	:rtype: None
") SetProductDataType;
		void SetProductDataType (const Handle_TCollection_HAsciiString & apdt);
};


%extend StepBasic_DocumentType {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DocumentType(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DocumentType::Handle_StepBasic_DocumentType %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DocumentType;
class Handle_StepBasic_DocumentType : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DocumentType();
        Handle_StepBasic_DocumentType(const Handle_StepBasic_DocumentType &aHandle);
        Handle_StepBasic_DocumentType(const StepBasic_DocumentType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DocumentType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentType {
    StepBasic_DocumentType* _get_reference() {
    return (StepBasic_DocumentType*)$self->Access();
    }
};

%extend Handle_StepBasic_DocumentType {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DocumentType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentUsageConstraint;
class StepBasic_DocumentUsageConstraint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_DocumentUsageConstraint;
		%feature("autodoc", "	:rtype: None
") StepBasic_DocumentUsageConstraint;
		 StepBasic_DocumentUsageConstraint ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aSource:
	:type aSource: Handle_StepBasic_Document &
	:param ase:
	:type ase: Handle_TCollection_HAsciiString &
	:param asev:
	:type asev: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Document & aSource,const Handle_TCollection_HAsciiString & ase,const Handle_TCollection_HAsciiString & asev);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Document
") Source;
		Handle_StepBasic_Document Source ();
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	:param aSource:
	:type aSource: Handle_StepBasic_Document &
	:rtype: None
") SetSource;
		void SetSource (const Handle_StepBasic_Document & aSource);
		%feature("compactdefaultargs") SubjectElement;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") SubjectElement;
		Handle_TCollection_HAsciiString SubjectElement ();
		%feature("compactdefaultargs") SetSubjectElement;
		%feature("autodoc", "	:param ase:
	:type ase: Handle_TCollection_HAsciiString &
	:rtype: None
") SetSubjectElement;
		void SetSubjectElement (const Handle_TCollection_HAsciiString & ase);
		%feature("compactdefaultargs") SubjectElementValue;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") SubjectElementValue;
		Handle_TCollection_HAsciiString SubjectElementValue ();
		%feature("compactdefaultargs") SetSubjectElementValue;
		%feature("autodoc", "	:param asev:
	:type asev: Handle_TCollection_HAsciiString &
	:rtype: None
") SetSubjectElementValue;
		void SetSubjectElementValue (const Handle_TCollection_HAsciiString & asev);
};


%extend StepBasic_DocumentUsageConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DocumentUsageConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DocumentUsageConstraint::Handle_StepBasic_DocumentUsageConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DocumentUsageConstraint;
class Handle_StepBasic_DocumentUsageConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_DocumentUsageConstraint();
        Handle_StepBasic_DocumentUsageConstraint(const Handle_StepBasic_DocumentUsageConstraint &aHandle);
        Handle_StepBasic_DocumentUsageConstraint(const StepBasic_DocumentUsageConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DocumentUsageConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentUsageConstraint {
    StepBasic_DocumentUsageConstraint* _get_reference() {
    return (StepBasic_DocumentUsageConstraint*)$self->Access();
    }
};

%extend Handle_StepBasic_DocumentUsageConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DocumentUsageConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Effectivity;
class StepBasic_Effectivity : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Effectivity;
		%feature("autodoc", "	:rtype: None
") StepBasic_Effectivity;
		 StepBasic_Effectivity ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aid:
	:type aid: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aid);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aid:
	:type aid: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & aid);
};


%extend StepBasic_Effectivity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Effectivity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Effectivity::Handle_StepBasic_Effectivity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Effectivity;
class Handle_StepBasic_Effectivity : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Effectivity();
        Handle_StepBasic_Effectivity(const Handle_StepBasic_Effectivity &aHandle);
        Handle_StepBasic_Effectivity(const StepBasic_Effectivity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Effectivity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Effectivity {
    StepBasic_Effectivity* _get_reference() {
    return (StepBasic_Effectivity*)$self->Access();
    }
};

%extend Handle_StepBasic_Effectivity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Effectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_EffectivityAssignment;
class StepBasic_EffectivityAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_EffectivityAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_EffectivityAssignment;
		 StepBasic_EffectivityAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedEffectivity:
	:type aAssignedEffectivity: Handle_StepBasic_Effectivity &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Effectivity & aAssignedEffectivity);
		%feature("compactdefaultargs") AssignedEffectivity;
		%feature("autodoc", "	* Returns field AssignedEffectivity

	:rtype: Handle_StepBasic_Effectivity
") AssignedEffectivity;
		Handle_StepBasic_Effectivity AssignedEffectivity ();
		%feature("compactdefaultargs") SetAssignedEffectivity;
		%feature("autodoc", "	* Set field AssignedEffectivity

	:param AssignedEffectivity:
	:type AssignedEffectivity: Handle_StepBasic_Effectivity &
	:rtype: None
") SetAssignedEffectivity;
		void SetAssignedEffectivity (const Handle_StepBasic_Effectivity & AssignedEffectivity);
};


%extend StepBasic_EffectivityAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_EffectivityAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_EffectivityAssignment::Handle_StepBasic_EffectivityAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_EffectivityAssignment;
class Handle_StepBasic_EffectivityAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_EffectivityAssignment();
        Handle_StepBasic_EffectivityAssignment(const Handle_StepBasic_EffectivityAssignment &aHandle);
        Handle_StepBasic_EffectivityAssignment(const StepBasic_EffectivityAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_EffectivityAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_EffectivityAssignment {
    StepBasic_EffectivityAssignment* _get_reference() {
    return (StepBasic_EffectivityAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_EffectivityAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_EffectivityAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_EulerAngles;
class StepBasic_EulerAngles : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_EulerAngles;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_EulerAngles;
		 StepBasic_EulerAngles ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAngles:
	:type aAngles: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Init;
		void Init (const Handle_TColStd_HArray1OfReal & aAngles);
		%feature("compactdefaultargs") Angles;
		%feature("autodoc", "	* Returns field Angles

	:rtype: Handle_TColStd_HArray1OfReal
") Angles;
		Handle_TColStd_HArray1OfReal Angles ();
		%feature("compactdefaultargs") SetAngles;
		%feature("autodoc", "	* Set field Angles

	:param Angles:
	:type Angles: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetAngles;
		void SetAngles (const Handle_TColStd_HArray1OfReal & Angles);
};


%extend StepBasic_EulerAngles {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_EulerAngles(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_EulerAngles::Handle_StepBasic_EulerAngles %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_EulerAngles;
class Handle_StepBasic_EulerAngles : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_EulerAngles();
        Handle_StepBasic_EulerAngles(const Handle_StepBasic_EulerAngles &aHandle);
        Handle_StepBasic_EulerAngles(const StepBasic_EulerAngles *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_EulerAngles DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_EulerAngles {
    StepBasic_EulerAngles* _get_reference() {
    return (StepBasic_EulerAngles*)$self->Access();
    }
};

%extend Handle_StepBasic_EulerAngles {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_EulerAngles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ExternalSource;
class StepBasic_ExternalSource : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ExternalSource;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ExternalSource;
		 StepBasic_ExternalSource ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aSourceId:
	:type aSourceId: StepBasic_SourceItem &
	:rtype: None
") Init;
		void Init (const StepBasic_SourceItem & aSourceId);
		%feature("compactdefaultargs") SourceId;
		%feature("autodoc", "	* Returns field SourceId

	:rtype: StepBasic_SourceItem
") SourceId;
		StepBasic_SourceItem SourceId ();
		%feature("compactdefaultargs") SetSourceId;
		%feature("autodoc", "	* Set field SourceId

	:param SourceId:
	:type SourceId: StepBasic_SourceItem &
	:rtype: None
") SetSourceId;
		void SetSourceId (const StepBasic_SourceItem & SourceId);
};


%extend StepBasic_ExternalSource {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ExternalSource(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ExternalSource::Handle_StepBasic_ExternalSource %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ExternalSource;
class Handle_StepBasic_ExternalSource : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ExternalSource();
        Handle_StepBasic_ExternalSource(const Handle_StepBasic_ExternalSource &aHandle);
        Handle_StepBasic_ExternalSource(const StepBasic_ExternalSource *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ExternalSource DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ExternalSource {
    StepBasic_ExternalSource* _get_reference() {
    return (StepBasic_ExternalSource*)$self->Access();
    }
};

%extend Handle_StepBasic_ExternalSource {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ExternalSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ExternallyDefinedItem;
class StepBasic_ExternallyDefinedItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ExternallyDefinedItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ExternallyDefinedItem;
		 StepBasic_ExternallyDefinedItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aItemId:
	:type aItemId: StepBasic_SourceItem &
	:param aSource:
	:type aSource: Handle_StepBasic_ExternalSource &
	:rtype: None
") Init;
		void Init (const StepBasic_SourceItem & aItemId,const Handle_StepBasic_ExternalSource & aSource);
		%feature("compactdefaultargs") ItemId;
		%feature("autodoc", "	* Returns field ItemId

	:rtype: StepBasic_SourceItem
") ItemId;
		StepBasic_SourceItem ItemId ();
		%feature("compactdefaultargs") SetItemId;
		%feature("autodoc", "	* Set field ItemId

	:param ItemId:
	:type ItemId: StepBasic_SourceItem &
	:rtype: None
") SetItemId;
		void SetItemId (const StepBasic_SourceItem & ItemId);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	* Returns field Source

	:rtype: Handle_StepBasic_ExternalSource
") Source;
		Handle_StepBasic_ExternalSource Source ();
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	* Set field Source

	:param Source:
	:type Source: Handle_StepBasic_ExternalSource &
	:rtype: None
") SetSource;
		void SetSource (const Handle_StepBasic_ExternalSource & Source);
};


%extend StepBasic_ExternallyDefinedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ExternallyDefinedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ExternallyDefinedItem::Handle_StepBasic_ExternallyDefinedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ExternallyDefinedItem;
class Handle_StepBasic_ExternallyDefinedItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ExternallyDefinedItem();
        Handle_StepBasic_ExternallyDefinedItem(const Handle_StepBasic_ExternallyDefinedItem &aHandle);
        Handle_StepBasic_ExternallyDefinedItem(const StepBasic_ExternallyDefinedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ExternallyDefinedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ExternallyDefinedItem {
    StepBasic_ExternallyDefinedItem* _get_reference() {
    return (StepBasic_ExternallyDefinedItem*)$self->Access();
    }
};

%extend Handle_StepBasic_ExternallyDefinedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ExternallyDefinedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_GeneralProperty;
class StepBasic_GeneralProperty : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_GeneralProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_GeneralProperty;
		 StepBasic_GeneralProperty ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & Id);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
};


%extend StepBasic_GeneralProperty {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_GeneralProperty(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_GeneralProperty::Handle_StepBasic_GeneralProperty %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_GeneralProperty;
class Handle_StepBasic_GeneralProperty : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_GeneralProperty();
        Handle_StepBasic_GeneralProperty(const Handle_StepBasic_GeneralProperty &aHandle);
        Handle_StepBasic_GeneralProperty(const StepBasic_GeneralProperty *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_GeneralProperty DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_GeneralProperty {
    StepBasic_GeneralProperty* _get_reference() {
    return (StepBasic_GeneralProperty*)$self->Access();
    }
};

%extend Handle_StepBasic_GeneralProperty {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_GeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Group;
class StepBasic_Group : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Group;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_Group;
		 StepBasic_Group ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
};


%extend StepBasic_Group {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Group(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Group::Handle_StepBasic_Group %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Group;
class Handle_StepBasic_Group : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Group();
        Handle_StepBasic_Group(const Handle_StepBasic_Group &aHandle);
        Handle_StepBasic_Group(const StepBasic_Group *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Group DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Group {
    StepBasic_Group* _get_reference() {
    return (StepBasic_Group*)$self->Access();
    }
};

%extend Handle_StepBasic_Group {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_GroupAssignment;
class StepBasic_GroupAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_GroupAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_GroupAssignment;
		 StepBasic_GroupAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedGroup:
	:type aAssignedGroup: Handle_StepBasic_Group &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Group & aAssignedGroup);
		%feature("compactdefaultargs") AssignedGroup;
		%feature("autodoc", "	* Returns field AssignedGroup

	:rtype: Handle_StepBasic_Group
") AssignedGroup;
		Handle_StepBasic_Group AssignedGroup ();
		%feature("compactdefaultargs") SetAssignedGroup;
		%feature("autodoc", "	* Set field AssignedGroup

	:param AssignedGroup:
	:type AssignedGroup: Handle_StepBasic_Group &
	:rtype: None
") SetAssignedGroup;
		void SetAssignedGroup (const Handle_StepBasic_Group & AssignedGroup);
};


%extend StepBasic_GroupAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_GroupAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_GroupAssignment::Handle_StepBasic_GroupAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_GroupAssignment;
class Handle_StepBasic_GroupAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_GroupAssignment();
        Handle_StepBasic_GroupAssignment(const Handle_StepBasic_GroupAssignment &aHandle);
        Handle_StepBasic_GroupAssignment(const StepBasic_GroupAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_GroupAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_GroupAssignment {
    StepBasic_GroupAssignment* _get_reference() {
    return (StepBasic_GroupAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_GroupAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_GroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_GroupRelationship;
class StepBasic_GroupRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_GroupRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_GroupRelationship;
		 StepBasic_GroupRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRelatingGroup:
	:type aRelatingGroup: Handle_StepBasic_Group &
	:param aRelatedGroup:
	:type aRelatedGroup: Handle_StepBasic_Group &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_Group & aRelatingGroup,const Handle_StepBasic_Group & aRelatedGroup);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") RelatingGroup;
		%feature("autodoc", "	* Returns field RelatingGroup

	:rtype: Handle_StepBasic_Group
") RelatingGroup;
		Handle_StepBasic_Group RelatingGroup ();
		%feature("compactdefaultargs") SetRelatingGroup;
		%feature("autodoc", "	* Set field RelatingGroup

	:param RelatingGroup:
	:type RelatingGroup: Handle_StepBasic_Group &
	:rtype: None
") SetRelatingGroup;
		void SetRelatingGroup (const Handle_StepBasic_Group & RelatingGroup);
		%feature("compactdefaultargs") RelatedGroup;
		%feature("autodoc", "	* Returns field RelatedGroup

	:rtype: Handle_StepBasic_Group
") RelatedGroup;
		Handle_StepBasic_Group RelatedGroup ();
		%feature("compactdefaultargs") SetRelatedGroup;
		%feature("autodoc", "	* Set field RelatedGroup

	:param RelatedGroup:
	:type RelatedGroup: Handle_StepBasic_Group &
	:rtype: None
") SetRelatedGroup;
		void SetRelatedGroup (const Handle_StepBasic_Group & RelatedGroup);
};


%extend StepBasic_GroupRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_GroupRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_GroupRelationship::Handle_StepBasic_GroupRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_GroupRelationship;
class Handle_StepBasic_GroupRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_GroupRelationship();
        Handle_StepBasic_GroupRelationship(const Handle_StepBasic_GroupRelationship &aHandle);
        Handle_StepBasic_GroupRelationship(const StepBasic_GroupRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_GroupRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_GroupRelationship {
    StepBasic_GroupRelationship* _get_reference() {
    return (StepBasic_GroupRelationship*)$self->Access();
    }
};

%extend Handle_StepBasic_GroupRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_GroupRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_HArray1OfApproval;
class StepBasic_HArray1OfApproval : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_HArray1OfApproval;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_HArray1OfApproval;
		 StepBasic_HArray1OfApproval (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_HArray1OfApproval;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepBasic_Approval &
	:rtype: None
") StepBasic_HArray1OfApproval;
		 StepBasic_HArray1OfApproval (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepBasic_Approval & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_Approval &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Approval & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_Approval &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_Approval & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Approval
") Value;
		Handle_StepBasic_Approval Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Approval
") ChangeValue;
		Handle_StepBasic_Approval ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfApproval
") Array1;
		const StepBasic_Array1OfApproval & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfApproval
") ChangeArray1;
		StepBasic_Array1OfApproval & ChangeArray1 ();
};


%extend StepBasic_HArray1OfApproval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_HArray1OfApproval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_HArray1OfApproval::Handle_StepBasic_HArray1OfApproval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_HArray1OfApproval;
class Handle_StepBasic_HArray1OfApproval : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_HArray1OfApproval();
        Handle_StepBasic_HArray1OfApproval(const Handle_StepBasic_HArray1OfApproval &aHandle);
        Handle_StepBasic_HArray1OfApproval(const StepBasic_HArray1OfApproval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_HArray1OfApproval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfApproval {
    StepBasic_HArray1OfApproval* _get_reference() {
    return (StepBasic_HArray1OfApproval*)$self->Access();
    }
};

%extend Handle_StepBasic_HArray1OfApproval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_HArray1OfApproval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_HArray1OfDerivedUnitElement;
class StepBasic_HArray1OfDerivedUnitElement : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_HArray1OfDerivedUnitElement;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_HArray1OfDerivedUnitElement;
		 StepBasic_HArray1OfDerivedUnitElement (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_HArray1OfDerivedUnitElement;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepBasic_DerivedUnitElement &
	:rtype: None
") StepBasic_HArray1OfDerivedUnitElement;
		 StepBasic_HArray1OfDerivedUnitElement (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepBasic_DerivedUnitElement & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_DerivedUnitElement &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_DerivedUnitElement & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_DerivedUnitElement &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_DerivedUnitElement & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_DerivedUnitElement
") Value;
		Handle_StepBasic_DerivedUnitElement Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_DerivedUnitElement
") ChangeValue;
		Handle_StepBasic_DerivedUnitElement ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfDerivedUnitElement
") Array1;
		const StepBasic_Array1OfDerivedUnitElement & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfDerivedUnitElement
") ChangeArray1;
		StepBasic_Array1OfDerivedUnitElement & ChangeArray1 ();
};


%extend StepBasic_HArray1OfDerivedUnitElement {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_HArray1OfDerivedUnitElement(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_HArray1OfDerivedUnitElement::Handle_StepBasic_HArray1OfDerivedUnitElement %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_HArray1OfDerivedUnitElement;
class Handle_StepBasic_HArray1OfDerivedUnitElement : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_HArray1OfDerivedUnitElement();
        Handle_StepBasic_HArray1OfDerivedUnitElement(const Handle_StepBasic_HArray1OfDerivedUnitElement &aHandle);
        Handle_StepBasic_HArray1OfDerivedUnitElement(const StepBasic_HArray1OfDerivedUnitElement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_HArray1OfDerivedUnitElement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfDerivedUnitElement {
    StepBasic_HArray1OfDerivedUnitElement* _get_reference() {
    return (StepBasic_HArray1OfDerivedUnitElement*)$self->Access();
    }
};

%extend Handle_StepBasic_HArray1OfDerivedUnitElement {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_HArray1OfDerivedUnitElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_HArray1OfDocument;
class StepBasic_HArray1OfDocument : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_HArray1OfDocument;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_HArray1OfDocument;
		 StepBasic_HArray1OfDocument (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_HArray1OfDocument;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepBasic_Document &
	:rtype: None
") StepBasic_HArray1OfDocument;
		 StepBasic_HArray1OfDocument (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepBasic_Document & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_Document &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Document & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_Document &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_Document & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Document
") Value;
		Handle_StepBasic_Document Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Document
") ChangeValue;
		Handle_StepBasic_Document ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfDocument
") Array1;
		const StepBasic_Array1OfDocument & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfDocument
") ChangeArray1;
		StepBasic_Array1OfDocument & ChangeArray1 ();
};


%extend StepBasic_HArray1OfDocument {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_HArray1OfDocument(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_HArray1OfDocument::Handle_StepBasic_HArray1OfDocument %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_HArray1OfDocument;
class Handle_StepBasic_HArray1OfDocument : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_HArray1OfDocument();
        Handle_StepBasic_HArray1OfDocument(const Handle_StepBasic_HArray1OfDocument &aHandle);
        Handle_StepBasic_HArray1OfDocument(const StepBasic_HArray1OfDocument *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_HArray1OfDocument DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfDocument {
    StepBasic_HArray1OfDocument* _get_reference() {
    return (StepBasic_HArray1OfDocument*)$self->Access();
    }
};

%extend Handle_StepBasic_HArray1OfDocument {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_HArray1OfDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_HArray1OfNamedUnit;
class StepBasic_HArray1OfNamedUnit : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_HArray1OfNamedUnit;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_HArray1OfNamedUnit;
		 StepBasic_HArray1OfNamedUnit (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_HArray1OfNamedUnit;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepBasic_NamedUnit &
	:rtype: None
") StepBasic_HArray1OfNamedUnit;
		 StepBasic_HArray1OfNamedUnit (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepBasic_NamedUnit & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_NamedUnit &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_NamedUnit & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_NamedUnit &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_NamedUnit & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_NamedUnit
") Value;
		Handle_StepBasic_NamedUnit Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_NamedUnit
") ChangeValue;
		Handle_StepBasic_NamedUnit ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfNamedUnit
") Array1;
		const StepBasic_Array1OfNamedUnit & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfNamedUnit
") ChangeArray1;
		StepBasic_Array1OfNamedUnit & ChangeArray1 ();
};


%extend StepBasic_HArray1OfNamedUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_HArray1OfNamedUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_HArray1OfNamedUnit::Handle_StepBasic_HArray1OfNamedUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_HArray1OfNamedUnit;
class Handle_StepBasic_HArray1OfNamedUnit : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_HArray1OfNamedUnit();
        Handle_StepBasic_HArray1OfNamedUnit(const Handle_StepBasic_HArray1OfNamedUnit &aHandle);
        Handle_StepBasic_HArray1OfNamedUnit(const StepBasic_HArray1OfNamedUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_HArray1OfNamedUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfNamedUnit {
    StepBasic_HArray1OfNamedUnit* _get_reference() {
    return (StepBasic_HArray1OfNamedUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_HArray1OfNamedUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_HArray1OfNamedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_HArray1OfOrganization;
class StepBasic_HArray1OfOrganization : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_HArray1OfOrganization;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_HArray1OfOrganization;
		 StepBasic_HArray1OfOrganization (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_HArray1OfOrganization;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepBasic_Organization &
	:rtype: None
") StepBasic_HArray1OfOrganization;
		 StepBasic_HArray1OfOrganization (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepBasic_Organization & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_Organization &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Organization & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_Organization &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_Organization & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Organization
") Value;
		Handle_StepBasic_Organization Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Organization
") ChangeValue;
		Handle_StepBasic_Organization ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfOrganization
") Array1;
		const StepBasic_Array1OfOrganization & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfOrganization
") ChangeArray1;
		StepBasic_Array1OfOrganization & ChangeArray1 ();
};


%extend StepBasic_HArray1OfOrganization {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_HArray1OfOrganization(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_HArray1OfOrganization::Handle_StepBasic_HArray1OfOrganization %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_HArray1OfOrganization;
class Handle_StepBasic_HArray1OfOrganization : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_HArray1OfOrganization();
        Handle_StepBasic_HArray1OfOrganization(const Handle_StepBasic_HArray1OfOrganization &aHandle);
        Handle_StepBasic_HArray1OfOrganization(const StepBasic_HArray1OfOrganization *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_HArray1OfOrganization DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfOrganization {
    StepBasic_HArray1OfOrganization* _get_reference() {
    return (StepBasic_HArray1OfOrganization*)$self->Access();
    }
};

%extend Handle_StepBasic_HArray1OfOrganization {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_HArray1OfOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_HArray1OfPerson;
class StepBasic_HArray1OfPerson : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_HArray1OfPerson;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_HArray1OfPerson;
		 StepBasic_HArray1OfPerson (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_HArray1OfPerson;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepBasic_Person &
	:rtype: None
") StepBasic_HArray1OfPerson;
		 StepBasic_HArray1OfPerson (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepBasic_Person & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_Person &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Person & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_Person &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_Person & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Person
") Value;
		Handle_StepBasic_Person Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Person
") ChangeValue;
		Handle_StepBasic_Person ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfPerson
") Array1;
		const StepBasic_Array1OfPerson & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfPerson
") ChangeArray1;
		StepBasic_Array1OfPerson & ChangeArray1 ();
};


%extend StepBasic_HArray1OfPerson {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_HArray1OfPerson(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_HArray1OfPerson::Handle_StepBasic_HArray1OfPerson %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_HArray1OfPerson;
class Handle_StepBasic_HArray1OfPerson : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_HArray1OfPerson();
        Handle_StepBasic_HArray1OfPerson(const Handle_StepBasic_HArray1OfPerson &aHandle);
        Handle_StepBasic_HArray1OfPerson(const StepBasic_HArray1OfPerson *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_HArray1OfPerson DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfPerson {
    StepBasic_HArray1OfPerson* _get_reference() {
    return (StepBasic_HArray1OfPerson*)$self->Access();
    }
};

%extend Handle_StepBasic_HArray1OfPerson {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_HArray1OfPerson {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_HArray1OfProduct;
class StepBasic_HArray1OfProduct : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_HArray1OfProduct;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_HArray1OfProduct;
		 StepBasic_HArray1OfProduct (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_HArray1OfProduct;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepBasic_Product &
	:rtype: None
") StepBasic_HArray1OfProduct;
		 StepBasic_HArray1OfProduct (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepBasic_Product & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_Product &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Product & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_Product &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_Product & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Product
") Value;
		Handle_StepBasic_Product Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_Product
") ChangeValue;
		Handle_StepBasic_Product ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfProduct
") Array1;
		const StepBasic_Array1OfProduct & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfProduct
") ChangeArray1;
		StepBasic_Array1OfProduct & ChangeArray1 ();
};


%extend StepBasic_HArray1OfProduct {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_HArray1OfProduct(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_HArray1OfProduct::Handle_StepBasic_HArray1OfProduct %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_HArray1OfProduct;
class Handle_StepBasic_HArray1OfProduct : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_HArray1OfProduct();
        Handle_StepBasic_HArray1OfProduct(const Handle_StepBasic_HArray1OfProduct &aHandle);
        Handle_StepBasic_HArray1OfProduct(const StepBasic_HArray1OfProduct *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_HArray1OfProduct DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfProduct {
    StepBasic_HArray1OfProduct* _get_reference() {
    return (StepBasic_HArray1OfProduct*)$self->Access();
    }
};

%extend Handle_StepBasic_HArray1OfProduct {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_HArray1OfProduct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_HArray1OfProductContext;
class StepBasic_HArray1OfProductContext : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_HArray1OfProductContext;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_HArray1OfProductContext;
		 StepBasic_HArray1OfProductContext (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_HArray1OfProductContext;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepBasic_ProductContext &
	:rtype: None
") StepBasic_HArray1OfProductContext;
		 StepBasic_HArray1OfProductContext (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepBasic_ProductContext & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_ProductContext &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_ProductContext & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_ProductContext &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_ProductContext & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_ProductContext
") Value;
		Handle_StepBasic_ProductContext Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_ProductContext
") ChangeValue;
		Handle_StepBasic_ProductContext ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfProductContext
") Array1;
		const StepBasic_Array1OfProductContext & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfProductContext
") ChangeArray1;
		StepBasic_Array1OfProductContext & ChangeArray1 ();
};


%extend StepBasic_HArray1OfProductContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_HArray1OfProductContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_HArray1OfProductContext::Handle_StepBasic_HArray1OfProductContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_HArray1OfProductContext;
class Handle_StepBasic_HArray1OfProductContext : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_HArray1OfProductContext();
        Handle_StepBasic_HArray1OfProductContext(const Handle_StepBasic_HArray1OfProductContext &aHandle);
        Handle_StepBasic_HArray1OfProductContext(const StepBasic_HArray1OfProductContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_HArray1OfProductContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfProductContext {
    StepBasic_HArray1OfProductContext* _get_reference() {
    return (StepBasic_HArray1OfProductContext*)$self->Access();
    }
};

%extend Handle_StepBasic_HArray1OfProductContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_HArray1OfProductContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_HArray1OfProductDefinition;
class StepBasic_HArray1OfProductDefinition : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_HArray1OfProductDefinition;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_HArray1OfProductDefinition;
		 StepBasic_HArray1OfProductDefinition (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_HArray1OfProductDefinition;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepBasic_ProductDefinition &
	:rtype: None
") StepBasic_HArray1OfProductDefinition;
		 StepBasic_HArray1OfProductDefinition (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepBasic_ProductDefinition & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_ProductDefinition &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_ProductDefinition & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_ProductDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_ProductDefinition & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_ProductDefinition
") Value;
		Handle_StepBasic_ProductDefinition Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_ProductDefinition
") ChangeValue;
		Handle_StepBasic_ProductDefinition ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfProductDefinition
") Array1;
		const StepBasic_Array1OfProductDefinition & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfProductDefinition
") ChangeArray1;
		StepBasic_Array1OfProductDefinition & ChangeArray1 ();
};


%extend StepBasic_HArray1OfProductDefinition {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_HArray1OfProductDefinition(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_HArray1OfProductDefinition::Handle_StepBasic_HArray1OfProductDefinition %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_HArray1OfProductDefinition;
class Handle_StepBasic_HArray1OfProductDefinition : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_HArray1OfProductDefinition();
        Handle_StepBasic_HArray1OfProductDefinition(const Handle_StepBasic_HArray1OfProductDefinition &aHandle);
        Handle_StepBasic_HArray1OfProductDefinition(const StepBasic_HArray1OfProductDefinition *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_HArray1OfProductDefinition DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfProductDefinition {
    StepBasic_HArray1OfProductDefinition* _get_reference() {
    return (StepBasic_HArray1OfProductDefinition*)$self->Access();
    }
};

%extend Handle_StepBasic_HArray1OfProductDefinition {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_HArray1OfProductDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_HArray1OfUncertaintyMeasureWithUnit;
class StepBasic_HArray1OfUncertaintyMeasureWithUnit : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_HArray1OfUncertaintyMeasureWithUnit;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepBasic_HArray1OfUncertaintyMeasureWithUnit;
		 StepBasic_HArray1OfUncertaintyMeasureWithUnit (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepBasic_HArray1OfUncertaintyMeasureWithUnit;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepBasic_UncertaintyMeasureWithUnit &
	:rtype: None
") StepBasic_HArray1OfUncertaintyMeasureWithUnit;
		 StepBasic_HArray1OfUncertaintyMeasureWithUnit (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepBasic_UncertaintyMeasureWithUnit & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepBasic_UncertaintyMeasureWithUnit &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_UncertaintyMeasureWithUnit & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepBasic_UncertaintyMeasureWithUnit &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepBasic_UncertaintyMeasureWithUnit & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_UncertaintyMeasureWithUnit
") Value;
		Handle_StepBasic_UncertaintyMeasureWithUnit Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepBasic_UncertaintyMeasureWithUnit
") ChangeValue;
		Handle_StepBasic_UncertaintyMeasureWithUnit ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfUncertaintyMeasureWithUnit
") Array1;
		const StepBasic_Array1OfUncertaintyMeasureWithUnit & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepBasic_Array1OfUncertaintyMeasureWithUnit
") ChangeArray1;
		StepBasic_Array1OfUncertaintyMeasureWithUnit & ChangeArray1 ();
};


%extend StepBasic_HArray1OfUncertaintyMeasureWithUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit::Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit;
class Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit();
        Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit(const Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit &aHandle);
        Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit(const StepBasic_HArray1OfUncertaintyMeasureWithUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit {
    StepBasic_HArray1OfUncertaintyMeasureWithUnit* _get_reference() {
    return (StepBasic_HArray1OfUncertaintyMeasureWithUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_HArray1OfUncertaintyMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_IdentificationAssignment;
class StepBasic_IdentificationAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_IdentificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_IdentificationAssignment;
		 StepBasic_IdentificationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedId:
	:type aAssignedId: Handle_TCollection_HAsciiString &
	:param aRole:
	:type aRole: Handle_StepBasic_IdentificationRole &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aAssignedId,const Handle_StepBasic_IdentificationRole & aRole);
		%feature("compactdefaultargs") AssignedId;
		%feature("autodoc", "	* Returns field AssignedId

	:rtype: Handle_TCollection_HAsciiString
") AssignedId;
		Handle_TCollection_HAsciiString AssignedId ();
		%feature("compactdefaultargs") SetAssignedId;
		%feature("autodoc", "	* Set field AssignedId

	:param AssignedId:
	:type AssignedId: Handle_TCollection_HAsciiString &
	:rtype: None
") SetAssignedId;
		void SetAssignedId (const Handle_TCollection_HAsciiString & AssignedId);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	* Returns field Role

	:rtype: Handle_StepBasic_IdentificationRole
") Role;
		Handle_StepBasic_IdentificationRole Role ();
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	* Set field Role

	:param Role:
	:type Role: Handle_StepBasic_IdentificationRole &
	:rtype: None
") SetRole;
		void SetRole (const Handle_StepBasic_IdentificationRole & Role);
};


%extend StepBasic_IdentificationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_IdentificationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_IdentificationAssignment::Handle_StepBasic_IdentificationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_IdentificationAssignment;
class Handle_StepBasic_IdentificationAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_IdentificationAssignment();
        Handle_StepBasic_IdentificationAssignment(const Handle_StepBasic_IdentificationAssignment &aHandle);
        Handle_StepBasic_IdentificationAssignment(const StepBasic_IdentificationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_IdentificationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_IdentificationAssignment {
    StepBasic_IdentificationAssignment* _get_reference() {
    return (StepBasic_IdentificationAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_IdentificationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_IdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_IdentificationRole;
class StepBasic_IdentificationRole : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_IdentificationRole;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_IdentificationRole;
		 StepBasic_IdentificationRole ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
};


%extend StepBasic_IdentificationRole {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_IdentificationRole(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_IdentificationRole::Handle_StepBasic_IdentificationRole %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_IdentificationRole;
class Handle_StepBasic_IdentificationRole : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_IdentificationRole();
        Handle_StepBasic_IdentificationRole(const Handle_StepBasic_IdentificationRole &aHandle);
        Handle_StepBasic_IdentificationRole(const StepBasic_IdentificationRole *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_IdentificationRole DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_IdentificationRole {
    StepBasic_IdentificationRole* _get_reference() {
    return (StepBasic_IdentificationRole*)$self->Access();
    }
};

%extend Handle_StepBasic_IdentificationRole {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_IdentificationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_LocalTime;
class StepBasic_LocalTime : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_LocalTime;
		%feature("autodoc", "	* Returns a LocalTime

	:rtype: None
") StepBasic_LocalTime;
		 StepBasic_LocalTime ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aHourComponent:
	:type aHourComponent: int
	:param hasAminuteComponent:
	:type hasAminuteComponent: bool
	:param aMinuteComponent:
	:type aMinuteComponent: int
	:param hasAsecondComponent:
	:type hasAsecondComponent: bool
	:param aSecondComponent:
	:type aSecondComponent: float
	:param aZone:
	:type aZone: Handle_StepBasic_CoordinatedUniversalTimeOffset &
	:rtype: void
") Init;
		virtual void Init (const Standard_Integer aHourComponent,const Standard_Boolean hasAminuteComponent,const Standard_Integer aMinuteComponent,const Standard_Boolean hasAsecondComponent,const Standard_Real aSecondComponent,const Handle_StepBasic_CoordinatedUniversalTimeOffset & aZone);
		%feature("compactdefaultargs") SetHourComponent;
		%feature("autodoc", "	:param aHourComponent:
	:type aHourComponent: int
	:rtype: None
") SetHourComponent;
		void SetHourComponent (const Standard_Integer aHourComponent);
		%feature("compactdefaultargs") HourComponent;
		%feature("autodoc", "	:rtype: int
") HourComponent;
		Standard_Integer HourComponent ();
		%feature("compactdefaultargs") SetMinuteComponent;
		%feature("autodoc", "	:param aMinuteComponent:
	:type aMinuteComponent: int
	:rtype: None
") SetMinuteComponent;
		void SetMinuteComponent (const Standard_Integer aMinuteComponent);
		%feature("compactdefaultargs") UnSetMinuteComponent;
		%feature("autodoc", "	:rtype: None
") UnSetMinuteComponent;
		void UnSetMinuteComponent ();
		%feature("compactdefaultargs") MinuteComponent;
		%feature("autodoc", "	:rtype: int
") MinuteComponent;
		Standard_Integer MinuteComponent ();
		%feature("compactdefaultargs") HasMinuteComponent;
		%feature("autodoc", "	:rtype: bool
") HasMinuteComponent;
		Standard_Boolean HasMinuteComponent ();
		%feature("compactdefaultargs") SetSecondComponent;
		%feature("autodoc", "	:param aSecondComponent:
	:type aSecondComponent: float
	:rtype: None
") SetSecondComponent;
		void SetSecondComponent (const Standard_Real aSecondComponent);
		%feature("compactdefaultargs") UnSetSecondComponent;
		%feature("autodoc", "	:rtype: None
") UnSetSecondComponent;
		void UnSetSecondComponent ();
		%feature("compactdefaultargs") SecondComponent;
		%feature("autodoc", "	:rtype: float
") SecondComponent;
		Standard_Real SecondComponent ();
		%feature("compactdefaultargs") HasSecondComponent;
		%feature("autodoc", "	:rtype: bool
") HasSecondComponent;
		Standard_Boolean HasSecondComponent ();
		%feature("compactdefaultargs") SetZone;
		%feature("autodoc", "	:param aZone:
	:type aZone: Handle_StepBasic_CoordinatedUniversalTimeOffset &
	:rtype: None
") SetZone;
		void SetZone (const Handle_StepBasic_CoordinatedUniversalTimeOffset & aZone);
		%feature("compactdefaultargs") Zone;
		%feature("autodoc", "	:rtype: Handle_StepBasic_CoordinatedUniversalTimeOffset
") Zone;
		Handle_StepBasic_CoordinatedUniversalTimeOffset Zone ();
};


%extend StepBasic_LocalTime {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_LocalTime(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_LocalTime::Handle_StepBasic_LocalTime %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_LocalTime;
class Handle_StepBasic_LocalTime : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_LocalTime();
        Handle_StepBasic_LocalTime(const Handle_StepBasic_LocalTime &aHandle);
        Handle_StepBasic_LocalTime(const StepBasic_LocalTime *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_LocalTime DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_LocalTime {
    StepBasic_LocalTime* _get_reference() {
    return (StepBasic_LocalTime*)$self->Access();
    }
};

%extend Handle_StepBasic_LocalTime {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_LocalTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_MeasureValueMember;
class StepBasic_MeasureValueMember : public StepData_SelectReal {
	public:
		%feature("compactdefaultargs") StepBasic_MeasureValueMember;
		%feature("autodoc", "	:rtype: None
") StepBasic_MeasureValueMember;
		 StepBasic_MeasureValueMember ();
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
};


%extend StepBasic_MeasureValueMember {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_MeasureValueMember(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_MeasureValueMember::Handle_StepBasic_MeasureValueMember %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_MeasureValueMember;
class Handle_StepBasic_MeasureValueMember : public Handle_StepData_SelectReal {

    public:
        // constructors
        Handle_StepBasic_MeasureValueMember();
        Handle_StepBasic_MeasureValueMember(const Handle_StepBasic_MeasureValueMember &aHandle);
        Handle_StepBasic_MeasureValueMember(const StepBasic_MeasureValueMember *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_MeasureValueMember DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_MeasureValueMember {
    StepBasic_MeasureValueMember* _get_reference() {
    return (StepBasic_MeasureValueMember*)$self->Access();
    }
};

%extend Handle_StepBasic_MeasureValueMember {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_MeasureValueMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_MeasureWithUnit;
class StepBasic_MeasureWithUnit : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_MeasureWithUnit;
		%feature("autodoc", "	* Returns a MeasureWithUnit

	:rtype: None
") StepBasic_MeasureWithUnit;
		 StepBasic_MeasureWithUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aValueComponent:
	:type aValueComponent: Handle_StepBasic_MeasureValueMember &
	:param aUnitComponent:
	:type aUnitComponent: StepBasic_Unit &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_MeasureValueMember & aValueComponent,const StepBasic_Unit & aUnitComponent);
		%feature("compactdefaultargs") SetValueComponent;
		%feature("autodoc", "	:param aValueComponent:
	:type aValueComponent: float
	:rtype: None
") SetValueComponent;
		void SetValueComponent (const Standard_Real aValueComponent);
		%feature("compactdefaultargs") ValueComponent;
		%feature("autodoc", "	:rtype: float
") ValueComponent;
		Standard_Real ValueComponent ();
		%feature("compactdefaultargs") ValueComponentMember;
		%feature("autodoc", "	:rtype: Handle_StepBasic_MeasureValueMember
") ValueComponentMember;
		Handle_StepBasic_MeasureValueMember ValueComponentMember ();
		%feature("compactdefaultargs") SetValueComponentMember;
		%feature("autodoc", "	:param val:
	:type val: Handle_StepBasic_MeasureValueMember &
	:rtype: None
") SetValueComponentMember;
		void SetValueComponentMember (const Handle_StepBasic_MeasureValueMember & val);
		%feature("compactdefaultargs") SetUnitComponent;
		%feature("autodoc", "	:param aUnitComponent:
	:type aUnitComponent: StepBasic_Unit &
	:rtype: None
") SetUnitComponent;
		void SetUnitComponent (const StepBasic_Unit & aUnitComponent);
		%feature("compactdefaultargs") UnitComponent;
		%feature("autodoc", "	:rtype: StepBasic_Unit
") UnitComponent;
		StepBasic_Unit UnitComponent ();
};


%extend StepBasic_MeasureWithUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_MeasureWithUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_MeasureWithUnit::Handle_StepBasic_MeasureWithUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_MeasureWithUnit;
class Handle_StepBasic_MeasureWithUnit : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_MeasureWithUnit();
        Handle_StepBasic_MeasureWithUnit(const Handle_StepBasic_MeasureWithUnit &aHandle);
        Handle_StepBasic_MeasureWithUnit(const StepBasic_MeasureWithUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_MeasureWithUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_MeasureWithUnit {
    StepBasic_MeasureWithUnit* _get_reference() {
    return (StepBasic_MeasureWithUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_MeasureWithUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_MeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_NameAssignment;
class StepBasic_NameAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_NameAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_NameAssignment;
		 StepBasic_NameAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedName:
	:type aAssignedName: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aAssignedName);
		%feature("compactdefaultargs") AssignedName;
		%feature("autodoc", "	* Returns field AssignedName

	:rtype: Handle_TCollection_HAsciiString
") AssignedName;
		Handle_TCollection_HAsciiString AssignedName ();
		%feature("compactdefaultargs") SetAssignedName;
		%feature("autodoc", "	* Set field AssignedName

	:param AssignedName:
	:type AssignedName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetAssignedName;
		void SetAssignedName (const Handle_TCollection_HAsciiString & AssignedName);
};


%extend StepBasic_NameAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_NameAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_NameAssignment::Handle_StepBasic_NameAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_NameAssignment;
class Handle_StepBasic_NameAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_NameAssignment();
        Handle_StepBasic_NameAssignment(const Handle_StepBasic_NameAssignment &aHandle);
        Handle_StepBasic_NameAssignment(const StepBasic_NameAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_NameAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_NameAssignment {
    StepBasic_NameAssignment* _get_reference() {
    return (StepBasic_NameAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_NameAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_NameAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_NamedUnit;
class StepBasic_NamedUnit : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_NamedUnit;
		%feature("autodoc", "	* Returns a NamedUnit

	:rtype: None
") StepBasic_NamedUnit;
		 StepBasic_NamedUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") SetDimensions;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") SetDimensions;
		virtual void SetDimensions (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "	:rtype: Handle_StepBasic_DimensionalExponents
") Dimensions;
		virtual Handle_StepBasic_DimensionalExponents Dimensions ();
};


%extend StepBasic_NamedUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_NamedUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_NamedUnit::Handle_StepBasic_NamedUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_NamedUnit;
class Handle_StepBasic_NamedUnit : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_NamedUnit();
        Handle_StepBasic_NamedUnit(const Handle_StepBasic_NamedUnit &aHandle);
        Handle_StepBasic_NamedUnit(const StepBasic_NamedUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_NamedUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_NamedUnit {
    StepBasic_NamedUnit* _get_reference() {
    return (StepBasic_NamedUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_NamedUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_NamedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ObjectRole;
class StepBasic_ObjectRole : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ObjectRole;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ObjectRole;
		 StepBasic_ObjectRole ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
};


%extend StepBasic_ObjectRole {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ObjectRole(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ObjectRole::Handle_StepBasic_ObjectRole %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ObjectRole;
class Handle_StepBasic_ObjectRole : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ObjectRole();
        Handle_StepBasic_ObjectRole(const Handle_StepBasic_ObjectRole &aHandle);
        Handle_StepBasic_ObjectRole(const StepBasic_ObjectRole *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ObjectRole DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ObjectRole {
    StepBasic_ObjectRole* _get_reference() {
    return (StepBasic_ObjectRole*)$self->Access();
    }
};

%extend Handle_StepBasic_ObjectRole {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ObjectRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Organization;
class StepBasic_Organization : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Organization;
		%feature("autodoc", "	* Returns a Organization

	:rtype: None
") StepBasic_Organization;
		 StepBasic_Organization ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAid:
	:type hasAid: bool
	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAid,const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & aId);
		%feature("compactdefaultargs") UnSetId;
		%feature("autodoc", "	:rtype: None
") UnSetId;
		void UnSetId ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") HasId;
		%feature("autodoc", "	:rtype: bool
") HasId;
		Standard_Boolean HasId ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
};


%extend StepBasic_Organization {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Organization(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Organization::Handle_StepBasic_Organization %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Organization;
class Handle_StepBasic_Organization : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Organization();
        Handle_StepBasic_Organization(const Handle_StepBasic_Organization &aHandle);
        Handle_StepBasic_Organization(const StepBasic_Organization *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Organization DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Organization {
    StepBasic_Organization* _get_reference() {
    return (StepBasic_Organization*)$self->Access();
    }
};

%extend Handle_StepBasic_Organization {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Organization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_OrganizationAssignment;
class StepBasic_OrganizationAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedOrganization:
	:type aAssignedOrganization: Handle_StepBasic_Organization &
	:param aRole:
	:type aRole: Handle_StepBasic_OrganizationRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Organization & aAssignedOrganization,const Handle_StepBasic_OrganizationRole & aRole);
		%feature("compactdefaultargs") SetAssignedOrganization;
		%feature("autodoc", "	:param aAssignedOrganization:
	:type aAssignedOrganization: Handle_StepBasic_Organization &
	:rtype: None
") SetAssignedOrganization;
		void SetAssignedOrganization (const Handle_StepBasic_Organization & aAssignedOrganization);
		%feature("compactdefaultargs") AssignedOrganization;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Organization
") AssignedOrganization;
		Handle_StepBasic_Organization AssignedOrganization ();
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: Handle_StepBasic_OrganizationRole &
	:rtype: None
") SetRole;
		void SetRole (const Handle_StepBasic_OrganizationRole & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: Handle_StepBasic_OrganizationRole
") Role;
		Handle_StepBasic_OrganizationRole Role ();
};


%extend StepBasic_OrganizationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_OrganizationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_OrganizationAssignment::Handle_StepBasic_OrganizationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_OrganizationAssignment;
class Handle_StepBasic_OrganizationAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_OrganizationAssignment();
        Handle_StepBasic_OrganizationAssignment(const Handle_StepBasic_OrganizationAssignment &aHandle);
        Handle_StepBasic_OrganizationAssignment(const StepBasic_OrganizationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_OrganizationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_OrganizationAssignment {
    StepBasic_OrganizationAssignment* _get_reference() {
    return (StepBasic_OrganizationAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_OrganizationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_OrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_OrganizationRole;
class StepBasic_OrganizationRole : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_OrganizationRole;
		%feature("autodoc", "	* Returns a OrganizationRole

	:rtype: None
") StepBasic_OrganizationRole;
		 StepBasic_OrganizationRole ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
};


%extend StepBasic_OrganizationRole {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_OrganizationRole(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_OrganizationRole::Handle_StepBasic_OrganizationRole %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_OrganizationRole;
class Handle_StepBasic_OrganizationRole : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_OrganizationRole();
        Handle_StepBasic_OrganizationRole(const Handle_StepBasic_OrganizationRole &aHandle);
        Handle_StepBasic_OrganizationRole(const StepBasic_OrganizationRole *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_OrganizationRole DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_OrganizationRole {
    StepBasic_OrganizationRole* _get_reference() {
    return (StepBasic_OrganizationRole*)$self->Access();
    }
};

%extend Handle_StepBasic_OrganizationRole {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_OrganizationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Person;
class StepBasic_Person : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Person;
		%feature("autodoc", "	* Returns a Person

	:rtype: None
") StepBasic_Person;
		 StepBasic_Person ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param hasAlastName:
	:type hasAlastName: bool
	:param aLastName:
	:type aLastName: Handle_TCollection_HAsciiString &
	:param hasAfirstName:
	:type hasAfirstName: bool
	:param aFirstName:
	:type aFirstName: Handle_TCollection_HAsciiString &
	:param hasAmiddleNames:
	:type hasAmiddleNames: bool
	:param aMiddleNames:
	:type aMiddleNames: Handle_Interface_HArray1OfHAsciiString &
	:param hasAprefixTitles:
	:type hasAprefixTitles: bool
	:param aPrefixTitles:
	:type aPrefixTitles: Handle_Interface_HArray1OfHAsciiString &
	:param hasAsuffixTitles:
	:type hasAsuffixTitles: bool
	:param aSuffixTitles:
	:type aSuffixTitles: Handle_Interface_HArray1OfHAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aId,const Standard_Boolean hasAlastName,const Handle_TCollection_HAsciiString & aLastName,const Standard_Boolean hasAfirstName,const Handle_TCollection_HAsciiString & aFirstName,const Standard_Boolean hasAmiddleNames,const Handle_Interface_HArray1OfHAsciiString & aMiddleNames,const Standard_Boolean hasAprefixTitles,const Handle_Interface_HArray1OfHAsciiString & aPrefixTitles,const Standard_Boolean hasAsuffixTitles,const Handle_Interface_HArray1OfHAsciiString & aSuffixTitles);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & aId);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetLastName;
		%feature("autodoc", "	:param aLastName:
	:type aLastName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetLastName;
		void SetLastName (const Handle_TCollection_HAsciiString & aLastName);
		%feature("compactdefaultargs") UnSetLastName;
		%feature("autodoc", "	:rtype: None
") UnSetLastName;
		void UnSetLastName ();
		%feature("compactdefaultargs") LastName;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") LastName;
		Handle_TCollection_HAsciiString LastName ();
		%feature("compactdefaultargs") HasLastName;
		%feature("autodoc", "	:rtype: bool
") HasLastName;
		Standard_Boolean HasLastName ();
		%feature("compactdefaultargs") SetFirstName;
		%feature("autodoc", "	:param aFirstName:
	:type aFirstName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetFirstName;
		void SetFirstName (const Handle_TCollection_HAsciiString & aFirstName);
		%feature("compactdefaultargs") UnSetFirstName;
		%feature("autodoc", "	:rtype: None
") UnSetFirstName;
		void UnSetFirstName ();
		%feature("compactdefaultargs") FirstName;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") FirstName;
		Handle_TCollection_HAsciiString FirstName ();
		%feature("compactdefaultargs") HasFirstName;
		%feature("autodoc", "	:rtype: bool
") HasFirstName;
		Standard_Boolean HasFirstName ();
		%feature("compactdefaultargs") SetMiddleNames;
		%feature("autodoc", "	:param aMiddleNames:
	:type aMiddleNames: Handle_Interface_HArray1OfHAsciiString &
	:rtype: None
") SetMiddleNames;
		void SetMiddleNames (const Handle_Interface_HArray1OfHAsciiString & aMiddleNames);
		%feature("compactdefaultargs") UnSetMiddleNames;
		%feature("autodoc", "	:rtype: None
") UnSetMiddleNames;
		void UnSetMiddleNames ();
		%feature("compactdefaultargs") MiddleNames;
		%feature("autodoc", "	:rtype: Handle_Interface_HArray1OfHAsciiString
") MiddleNames;
		Handle_Interface_HArray1OfHAsciiString MiddleNames ();
		%feature("compactdefaultargs") HasMiddleNames;
		%feature("autodoc", "	:rtype: bool
") HasMiddleNames;
		Standard_Boolean HasMiddleNames ();
		%feature("compactdefaultargs") MiddleNamesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") MiddleNamesValue;
		Handle_TCollection_HAsciiString MiddleNamesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbMiddleNames;
		%feature("autodoc", "	:rtype: int
") NbMiddleNames;
		Standard_Integer NbMiddleNames ();
		%feature("compactdefaultargs") SetPrefixTitles;
		%feature("autodoc", "	:param aPrefixTitles:
	:type aPrefixTitles: Handle_Interface_HArray1OfHAsciiString &
	:rtype: None
") SetPrefixTitles;
		void SetPrefixTitles (const Handle_Interface_HArray1OfHAsciiString & aPrefixTitles);
		%feature("compactdefaultargs") UnSetPrefixTitles;
		%feature("autodoc", "	:rtype: None
") UnSetPrefixTitles;
		void UnSetPrefixTitles ();
		%feature("compactdefaultargs") PrefixTitles;
		%feature("autodoc", "	:rtype: Handle_Interface_HArray1OfHAsciiString
") PrefixTitles;
		Handle_Interface_HArray1OfHAsciiString PrefixTitles ();
		%feature("compactdefaultargs") HasPrefixTitles;
		%feature("autodoc", "	:rtype: bool
") HasPrefixTitles;
		Standard_Boolean HasPrefixTitles ();
		%feature("compactdefaultargs") PrefixTitlesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") PrefixTitlesValue;
		Handle_TCollection_HAsciiString PrefixTitlesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbPrefixTitles;
		%feature("autodoc", "	:rtype: int
") NbPrefixTitles;
		Standard_Integer NbPrefixTitles ();
		%feature("compactdefaultargs") SetSuffixTitles;
		%feature("autodoc", "	:param aSuffixTitles:
	:type aSuffixTitles: Handle_Interface_HArray1OfHAsciiString &
	:rtype: None
") SetSuffixTitles;
		void SetSuffixTitles (const Handle_Interface_HArray1OfHAsciiString & aSuffixTitles);
		%feature("compactdefaultargs") UnSetSuffixTitles;
		%feature("autodoc", "	:rtype: None
") UnSetSuffixTitles;
		void UnSetSuffixTitles ();
		%feature("compactdefaultargs") SuffixTitles;
		%feature("autodoc", "	:rtype: Handle_Interface_HArray1OfHAsciiString
") SuffixTitles;
		Handle_Interface_HArray1OfHAsciiString SuffixTitles ();
		%feature("compactdefaultargs") HasSuffixTitles;
		%feature("autodoc", "	:rtype: bool
") HasSuffixTitles;
		Standard_Boolean HasSuffixTitles ();
		%feature("compactdefaultargs") SuffixTitlesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") SuffixTitlesValue;
		Handle_TCollection_HAsciiString SuffixTitlesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbSuffixTitles;
		%feature("autodoc", "	:rtype: int
") NbSuffixTitles;
		Standard_Integer NbSuffixTitles ();
};


%extend StepBasic_Person {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Person(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Person::Handle_StepBasic_Person %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Person;
class Handle_StepBasic_Person : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Person();
        Handle_StepBasic_Person(const Handle_StepBasic_Person &aHandle);
        Handle_StepBasic_Person(const StepBasic_Person *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Person DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Person {
    StepBasic_Person* _get_reference() {
    return (StepBasic_Person*)$self->Access();
    }
};

%extend Handle_StepBasic_Person {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Person {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PersonAndOrganization;
class StepBasic_PersonAndOrganization : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_PersonAndOrganization;
		%feature("autodoc", "	* Returns a PersonAndOrganization

	:rtype: None
") StepBasic_PersonAndOrganization;
		 StepBasic_PersonAndOrganization ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aThePerson:
	:type aThePerson: Handle_StepBasic_Person &
	:param aTheOrganization:
	:type aTheOrganization: Handle_StepBasic_Organization &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Person & aThePerson,const Handle_StepBasic_Organization & aTheOrganization);
		%feature("compactdefaultargs") SetThePerson;
		%feature("autodoc", "	:param aThePerson:
	:type aThePerson: Handle_StepBasic_Person &
	:rtype: None
") SetThePerson;
		void SetThePerson (const Handle_StepBasic_Person & aThePerson);
		%feature("compactdefaultargs") ThePerson;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Person
") ThePerson;
		Handle_StepBasic_Person ThePerson ();
		%feature("compactdefaultargs") SetTheOrganization;
		%feature("autodoc", "	:param aTheOrganization:
	:type aTheOrganization: Handle_StepBasic_Organization &
	:rtype: None
") SetTheOrganization;
		void SetTheOrganization (const Handle_StepBasic_Organization & aTheOrganization);
		%feature("compactdefaultargs") TheOrganization;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Organization
") TheOrganization;
		Handle_StepBasic_Organization TheOrganization ();
};


%extend StepBasic_PersonAndOrganization {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_PersonAndOrganization(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_PersonAndOrganization::Handle_StepBasic_PersonAndOrganization %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_PersonAndOrganization;
class Handle_StepBasic_PersonAndOrganization : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_PersonAndOrganization();
        Handle_StepBasic_PersonAndOrganization(const Handle_StepBasic_PersonAndOrganization &aHandle);
        Handle_StepBasic_PersonAndOrganization(const StepBasic_PersonAndOrganization *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_PersonAndOrganization DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PersonAndOrganization {
    StepBasic_PersonAndOrganization* _get_reference() {
    return (StepBasic_PersonAndOrganization*)$self->Access();
    }
};

%extend Handle_StepBasic_PersonAndOrganization {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_PersonAndOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PersonAndOrganizationAssignment;
class StepBasic_PersonAndOrganizationAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aRole);
		%feature("compactdefaultargs") SetAssignedPersonAndOrganization;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:rtype: None
") SetAssignedPersonAndOrganization;
		void SetAssignedPersonAndOrganization (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization);
		%feature("compactdefaultargs") AssignedPersonAndOrganization;
		%feature("autodoc", "	:rtype: Handle_StepBasic_PersonAndOrganization
") AssignedPersonAndOrganization;
		Handle_StepBasic_PersonAndOrganization AssignedPersonAndOrganization ();
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:rtype: None
") SetRole;
		void SetRole (const Handle_StepBasic_PersonAndOrganizationRole & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: Handle_StepBasic_PersonAndOrganizationRole
") Role;
		Handle_StepBasic_PersonAndOrganizationRole Role ();
};


%extend StepBasic_PersonAndOrganizationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_PersonAndOrganizationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_PersonAndOrganizationAssignment::Handle_StepBasic_PersonAndOrganizationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_PersonAndOrganizationAssignment;
class Handle_StepBasic_PersonAndOrganizationAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_PersonAndOrganizationAssignment();
        Handle_StepBasic_PersonAndOrganizationAssignment(const Handle_StepBasic_PersonAndOrganizationAssignment &aHandle);
        Handle_StepBasic_PersonAndOrganizationAssignment(const StepBasic_PersonAndOrganizationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_PersonAndOrganizationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PersonAndOrganizationAssignment {
    StepBasic_PersonAndOrganizationAssignment* _get_reference() {
    return (StepBasic_PersonAndOrganizationAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_PersonAndOrganizationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_PersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PersonAndOrganizationRole;
class StepBasic_PersonAndOrganizationRole : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_PersonAndOrganizationRole;
		%feature("autodoc", "	* Returns a PersonAndOrganizationRole

	:rtype: None
") StepBasic_PersonAndOrganizationRole;
		 StepBasic_PersonAndOrganizationRole ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
};


%extend StepBasic_PersonAndOrganizationRole {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_PersonAndOrganizationRole(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_PersonAndOrganizationRole::Handle_StepBasic_PersonAndOrganizationRole %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_PersonAndOrganizationRole;
class Handle_StepBasic_PersonAndOrganizationRole : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_PersonAndOrganizationRole();
        Handle_StepBasic_PersonAndOrganizationRole(const Handle_StepBasic_PersonAndOrganizationRole &aHandle);
        Handle_StepBasic_PersonAndOrganizationRole(const StepBasic_PersonAndOrganizationRole *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_PersonAndOrganizationRole DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PersonAndOrganizationRole {
    StepBasic_PersonAndOrganizationRole* _get_reference() {
    return (StepBasic_PersonAndOrganizationRole*)$self->Access();
    }
};

%extend Handle_StepBasic_PersonAndOrganizationRole {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_PersonAndOrganizationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PersonOrganizationSelect;
class StepBasic_PersonOrganizationSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepBasic_PersonOrganizationSelect;
		%feature("autodoc", "	* Returns a PersonOrganizationSelect SelectType

	:rtype: None
") StepBasic_PersonOrganizationSelect;
		 StepBasic_PersonOrganizationSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a PersonOrganizationSelect Kind Entity that is : 1 -> Person 2 -> Organization 3 -> PersonAndOrganization 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Person;
		%feature("autodoc", "	* returns Value as a Person (Null if another type)

	:rtype: Handle_StepBasic_Person
") Person;
		Handle_StepBasic_Person Person ();
		%feature("compactdefaultargs") Organization;
		%feature("autodoc", "	* returns Value as a Organization (Null if another type)

	:rtype: Handle_StepBasic_Organization
") Organization;
		Handle_StepBasic_Organization Organization ();
		%feature("compactdefaultargs") PersonAndOrganization;
		%feature("autodoc", "	* returns Value as a PersonAndOrganization (Null if another type)

	:rtype: Handle_StepBasic_PersonAndOrganization
") PersonAndOrganization;
		Handle_StepBasic_PersonAndOrganization PersonAndOrganization ();
};


%extend StepBasic_PersonOrganizationSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Product;
class StepBasic_Product : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_Product;
		%feature("autodoc", "	* Returns a Product

	:rtype: None
") StepBasic_Product;
		 StepBasic_Product ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aFrameOfReference:
	:type aFrameOfReference: Handle_StepBasic_HArray1OfProductContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_HArray1OfProductContext & aFrameOfReference);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & aId);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "	:param aFrameOfReference:
	:type aFrameOfReference: Handle_StepBasic_HArray1OfProductContext &
	:rtype: None
") SetFrameOfReference;
		void SetFrameOfReference (const Handle_StepBasic_HArray1OfProductContext & aFrameOfReference);
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfProductContext
") FrameOfReference;
		Handle_StepBasic_HArray1OfProductContext FrameOfReference ();
		%feature("compactdefaultargs") FrameOfReferenceValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_ProductContext
") FrameOfReferenceValue;
		Handle_StepBasic_ProductContext FrameOfReferenceValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbFrameOfReference;
		%feature("autodoc", "	:rtype: int
") NbFrameOfReference;
		Standard_Integer NbFrameOfReference ();
};


%extend StepBasic_Product {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_Product(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_Product::Handle_StepBasic_Product %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_Product;
class Handle_StepBasic_Product : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_Product();
        Handle_StepBasic_Product(const Handle_StepBasic_Product &aHandle);
        Handle_StepBasic_Product(const StepBasic_Product *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_Product DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Product {
    StepBasic_Product* _get_reference() {
    return (StepBasic_Product*)$self->Access();
    }
};

%extend Handle_StepBasic_Product {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_Product {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductCategory;
class StepBasic_ProductCategory : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ProductCategory;
		%feature("autodoc", "	* Returns a ProductCategory

	:rtype: None
") StepBasic_ProductCategory;
		 StepBasic_ProductCategory ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasAdescription:
	:type hasAdescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasAdescription,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") UnSetDescription;
		%feature("autodoc", "	:rtype: None
") UnSetDescription;
		void UnSetDescription ();
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
};


%extend StepBasic_ProductCategory {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductCategory(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductCategory::Handle_StepBasic_ProductCategory %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductCategory;
class Handle_StepBasic_ProductCategory : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ProductCategory();
        Handle_StepBasic_ProductCategory(const Handle_StepBasic_ProductCategory &aHandle);
        Handle_StepBasic_ProductCategory(const StepBasic_ProductCategory *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductCategory DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductCategory {
    StepBasic_ProductCategory* _get_reference() {
    return (StepBasic_ProductCategory*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductCategory {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductCategoryRelationship;
class StepBasic_ProductCategoryRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ProductCategoryRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductCategoryRelationship;
		 StepBasic_ProductCategoryRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aCategory:
	:type aCategory: Handle_StepBasic_ProductCategory &
	:param aSubCategory:
	:type aSubCategory: Handle_StepBasic_ProductCategory &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_ProductCategory & aCategory,const Handle_StepBasic_ProductCategory & aSubCategory);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Category;
		%feature("autodoc", "	* Returns field Category

	:rtype: Handle_StepBasic_ProductCategory
") Category;
		Handle_StepBasic_ProductCategory Category ();
		%feature("compactdefaultargs") SetCategory;
		%feature("autodoc", "	* Set field Category

	:param Category:
	:type Category: Handle_StepBasic_ProductCategory &
	:rtype: None
") SetCategory;
		void SetCategory (const Handle_StepBasic_ProductCategory & Category);
		%feature("compactdefaultargs") SubCategory;
		%feature("autodoc", "	* Returns field SubCategory

	:rtype: Handle_StepBasic_ProductCategory
") SubCategory;
		Handle_StepBasic_ProductCategory SubCategory ();
		%feature("compactdefaultargs") SetSubCategory;
		%feature("autodoc", "	* Set field SubCategory

	:param SubCategory:
	:type SubCategory: Handle_StepBasic_ProductCategory &
	:rtype: None
") SetSubCategory;
		void SetSubCategory (const Handle_StepBasic_ProductCategory & SubCategory);
};


%extend StepBasic_ProductCategoryRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductCategoryRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductCategoryRelationship::Handle_StepBasic_ProductCategoryRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductCategoryRelationship;
class Handle_StepBasic_ProductCategoryRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ProductCategoryRelationship();
        Handle_StepBasic_ProductCategoryRelationship(const Handle_StepBasic_ProductCategoryRelationship &aHandle);
        Handle_StepBasic_ProductCategoryRelationship(const StepBasic_ProductCategoryRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductCategoryRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductCategoryRelationship {
    StepBasic_ProductCategoryRelationship* _get_reference() {
    return (StepBasic_ProductCategoryRelationship*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductCategoryRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductCategoryRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinition;
class StepBasic_ProductDefinition : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ProductDefinition;
		%feature("autodoc", "	* Returns a ProductDefinition

	:rtype: None
") StepBasic_ProductDefinition;
		 StepBasic_ProductDefinition ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aFormation:
	:type aFormation: Handle_StepBasic_ProductDefinitionFormation &
	:param aFrameOfReference:
	:type aFrameOfReference: Handle_StepBasic_ProductDefinitionContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_ProductDefinitionFormation & aFormation,const Handle_StepBasic_ProductDefinitionContext & aFrameOfReference);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & aId);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetFormation;
		%feature("autodoc", "	:param aFormation:
	:type aFormation: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: None
") SetFormation;
		void SetFormation (const Handle_StepBasic_ProductDefinitionFormation & aFormation);
		%feature("compactdefaultargs") Formation;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionFormation
") Formation;
		Handle_StepBasic_ProductDefinitionFormation Formation ();
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "	:param aFrameOfReference:
	:type aFrameOfReference: Handle_StepBasic_ProductDefinitionContext &
	:rtype: None
") SetFrameOfReference;
		void SetFrameOfReference (const Handle_StepBasic_ProductDefinitionContext & aFrameOfReference);
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionContext
") FrameOfReference;
		Handle_StepBasic_ProductDefinitionContext FrameOfReference ();
};


%extend StepBasic_ProductDefinition {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductDefinition(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductDefinition::Handle_StepBasic_ProductDefinition %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductDefinition;
class Handle_StepBasic_ProductDefinition : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ProductDefinition();
        Handle_StepBasic_ProductDefinition(const Handle_StepBasic_ProductDefinition &aHandle);
        Handle_StepBasic_ProductDefinition(const StepBasic_ProductDefinition *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductDefinition DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinition {
    StepBasic_ProductDefinition* _get_reference() {
    return (StepBasic_ProductDefinition*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductDefinition {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionFormation;
class StepBasic_ProductDefinitionFormation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormation;
		%feature("autodoc", "	* Returns a ProductDefinitionFormation

	:rtype: None
") StepBasic_ProductDefinitionFormation;
		 StepBasic_ProductDefinitionFormation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aOfProduct:
	:type aOfProduct: Handle_StepBasic_Product &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_Product & aOfProduct);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & aId);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetOfProduct;
		%feature("autodoc", "	:param aOfProduct:
	:type aOfProduct: Handle_StepBasic_Product &
	:rtype: None
") SetOfProduct;
		void SetOfProduct (const Handle_StepBasic_Product & aOfProduct);
		%feature("compactdefaultargs") OfProduct;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Product
") OfProduct;
		Handle_StepBasic_Product OfProduct ();
};


%extend StepBasic_ProductDefinitionFormation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductDefinitionFormation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductDefinitionFormation::Handle_StepBasic_ProductDefinitionFormation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductDefinitionFormation;
class Handle_StepBasic_ProductDefinitionFormation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ProductDefinitionFormation();
        Handle_StepBasic_ProductDefinitionFormation(const Handle_StepBasic_ProductDefinitionFormation &aHandle);
        Handle_StepBasic_ProductDefinitionFormation(const StepBasic_ProductDefinitionFormation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductDefinitionFormation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionFormation {
    StepBasic_ProductDefinitionFormation* _get_reference() {
    return (StepBasic_ProductDefinitionFormation*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductDefinitionFormation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductDefinitionFormation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionFormationRelationship;
class StepBasic_ProductDefinitionFormationRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormationRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductDefinitionFormationRelationship;
		 StepBasic_ProductDefinitionFormationRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRelatingProductDefinitionFormation:
	:type aRelatingProductDefinitionFormation: Handle_StepBasic_ProductDefinitionFormation &
	:param aRelatedProductDefinitionFormation:
	:type aRelatedProductDefinitionFormation: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_ProductDefinitionFormation & aRelatingProductDefinitionFormation,const Handle_StepBasic_ProductDefinitionFormation & aRelatedProductDefinitionFormation);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & Id);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") RelatingProductDefinitionFormation;
		%feature("autodoc", "	* Returns field RelatingProductDefinitionFormation

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") RelatingProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation RelatingProductDefinitionFormation ();
		%feature("compactdefaultargs") SetRelatingProductDefinitionFormation;
		%feature("autodoc", "	* Set field RelatingProductDefinitionFormation

	:param RelatingProductDefinitionFormation:
	:type RelatingProductDefinitionFormation: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: None
") SetRelatingProductDefinitionFormation;
		void SetRelatingProductDefinitionFormation (const Handle_StepBasic_ProductDefinitionFormation & RelatingProductDefinitionFormation);
		%feature("compactdefaultargs") RelatedProductDefinitionFormation;
		%feature("autodoc", "	* Returns field RelatedProductDefinitionFormation

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") RelatedProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation RelatedProductDefinitionFormation ();
		%feature("compactdefaultargs") SetRelatedProductDefinitionFormation;
		%feature("autodoc", "	* Set field RelatedProductDefinitionFormation

	:param RelatedProductDefinitionFormation:
	:type RelatedProductDefinitionFormation: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: None
") SetRelatedProductDefinitionFormation;
		void SetRelatedProductDefinitionFormation (const Handle_StepBasic_ProductDefinitionFormation & RelatedProductDefinitionFormation);
};


%extend StepBasic_ProductDefinitionFormationRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductDefinitionFormationRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductDefinitionFormationRelationship::Handle_StepBasic_ProductDefinitionFormationRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductDefinitionFormationRelationship;
class Handle_StepBasic_ProductDefinitionFormationRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ProductDefinitionFormationRelationship();
        Handle_StepBasic_ProductDefinitionFormationRelationship(const Handle_StepBasic_ProductDefinitionFormationRelationship &aHandle);
        Handle_StepBasic_ProductDefinitionFormationRelationship(const StepBasic_ProductDefinitionFormationRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductDefinitionFormationRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionFormationRelationship {
    StepBasic_ProductDefinitionFormationRelationship* _get_reference() {
    return (StepBasic_ProductDefinitionFormationRelationship*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductDefinitionFormationRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductDefinitionFormationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionRelationship;
class StepBasic_ProductDefinitionRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_ProductDefinitionRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductDefinitionRelationship;
		 StepBasic_ProductDefinitionRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRelatingProductDefinition:
	:type aRelatingProductDefinition: Handle_StepBasic_ProductDefinition &
	:param aRelatedProductDefinition:
	:type aRelatedProductDefinition: Handle_StepBasic_ProductDefinition &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_ProductDefinition & aRelatingProductDefinition,const Handle_StepBasic_ProductDefinition & aRelatedProductDefinition);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & Id);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") RelatingProductDefinition;
		%feature("autodoc", "	* Returns field RelatingProductDefinition

	:rtype: Handle_StepBasic_ProductDefinition
") RelatingProductDefinition;
		Handle_StepBasic_ProductDefinition RelatingProductDefinition ();
		%feature("compactdefaultargs") SetRelatingProductDefinition;
		%feature("autodoc", "	* Set field RelatingProductDefinition

	:param RelatingProductDefinition:
	:type RelatingProductDefinition: Handle_StepBasic_ProductDefinition &
	:rtype: None
") SetRelatingProductDefinition;
		void SetRelatingProductDefinition (const Handle_StepBasic_ProductDefinition & RelatingProductDefinition);
		%feature("compactdefaultargs") RelatedProductDefinition;
		%feature("autodoc", "	* Returns field RelatedProductDefinition

	:rtype: Handle_StepBasic_ProductDefinition
") RelatedProductDefinition;
		Handle_StepBasic_ProductDefinition RelatedProductDefinition ();
		%feature("compactdefaultargs") SetRelatedProductDefinition;
		%feature("autodoc", "	* Set field RelatedProductDefinition

	:param RelatedProductDefinition:
	:type RelatedProductDefinition: Handle_StepBasic_ProductDefinition &
	:rtype: None
") SetRelatedProductDefinition;
		void SetRelatedProductDefinition (const Handle_StepBasic_ProductDefinition & RelatedProductDefinition);
};


%extend StepBasic_ProductDefinitionRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductDefinitionRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductDefinitionRelationship::Handle_StepBasic_ProductDefinitionRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductDefinitionRelationship;
class Handle_StepBasic_ProductDefinitionRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_ProductDefinitionRelationship();
        Handle_StepBasic_ProductDefinitionRelationship(const Handle_StepBasic_ProductDefinitionRelationship &aHandle);
        Handle_StepBasic_ProductDefinitionRelationship(const StepBasic_ProductDefinitionRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductDefinitionRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionRelationship {
    StepBasic_ProductDefinitionRelationship* _get_reference() {
    return (StepBasic_ProductDefinitionRelationship*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductDefinitionRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductDefinitionRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductOrFormationOrDefinition;
class StepBasic_ProductOrFormationOrDefinition : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepBasic_ProductOrFormationOrDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductOrFormationOrDefinition;
		 StepBasic_ProductOrFormationOrDefinition ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ProductOrFormationOrDefinition select type 1 -> Product from StepBasic 2 -> ProductDefinitionFormation from StepBasic 3 -> ProductDefinition from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "	* Returns Value as Product (or Null if another type)

	:rtype: Handle_StepBasic_Product
") Product;
		Handle_StepBasic_Product Product ();
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* Returns Value as ProductDefinitionFormation (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* Returns Value as ProductDefinition (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
};


%extend StepBasic_ProductOrFormationOrDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_RoleAssociation;
class StepBasic_RoleAssociation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_RoleAssociation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_RoleAssociation;
		 StepBasic_RoleAssociation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRole:
	:type aRole: Handle_StepBasic_ObjectRole &
	:param aItemWithRole:
	:type aItemWithRole: StepBasic_RoleSelect &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_ObjectRole & aRole,const StepBasic_RoleSelect & aItemWithRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	* Returns field Role

	:rtype: Handle_StepBasic_ObjectRole
") Role;
		Handle_StepBasic_ObjectRole Role ();
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	* Set field Role

	:param Role:
	:type Role: Handle_StepBasic_ObjectRole &
	:rtype: None
") SetRole;
		void SetRole (const Handle_StepBasic_ObjectRole & Role);
		%feature("compactdefaultargs") ItemWithRole;
		%feature("autodoc", "	* Returns field ItemWithRole

	:rtype: StepBasic_RoleSelect
") ItemWithRole;
		StepBasic_RoleSelect ItemWithRole ();
		%feature("compactdefaultargs") SetItemWithRole;
		%feature("autodoc", "	* Set field ItemWithRole

	:param ItemWithRole:
	:type ItemWithRole: StepBasic_RoleSelect &
	:rtype: None
") SetItemWithRole;
		void SetItemWithRole (const StepBasic_RoleSelect & ItemWithRole);
};


%extend StepBasic_RoleAssociation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_RoleAssociation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_RoleAssociation::Handle_StepBasic_RoleAssociation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_RoleAssociation;
class Handle_StepBasic_RoleAssociation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_RoleAssociation();
        Handle_StepBasic_RoleAssociation(const Handle_StepBasic_RoleAssociation &aHandle);
        Handle_StepBasic_RoleAssociation(const StepBasic_RoleAssociation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_RoleAssociation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_RoleAssociation {
    StepBasic_RoleAssociation* _get_reference() {
    return (StepBasic_RoleAssociation*)$self->Access();
    }
};

%extend Handle_StepBasic_RoleAssociation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_RoleAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_RoleSelect;
class StepBasic_RoleSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepBasic_RoleSelect;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_RoleSelect;
		 StepBasic_RoleSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of RoleSelect select type 1 -> ActionAssignment from StepBasic 2 -> ActionRequestAssignment from StepBasic 3 -> ApprovalAssignment from StepBasic 4 -> ApprovalDateTime from StepBasic 5 -> CertificationAssignment from StepBasic 6 -> ContractAssignment from StepBasic 7 -> DocumentReference from StepBasic 8 -> EffectivityAssignment from StepBasic 9 -> GroupAssignment from StepBasic 10 -> NameAssignment from StepBasic 11 -> SecurityClassificationAssignment from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ActionAssignment;
		%feature("autodoc", "	* Returns Value as ActionAssignment (or Null if another type)

	:rtype: Handle_StepBasic_ActionAssignment
") ActionAssignment;
		Handle_StepBasic_ActionAssignment ActionAssignment ();
		%feature("compactdefaultargs") ActionRequestAssignment;
		%feature("autodoc", "	* Returns Value as ActionRequestAssignment (or Null if another type)

	:rtype: Handle_StepBasic_ActionRequestAssignment
") ActionRequestAssignment;
		Handle_StepBasic_ActionRequestAssignment ActionRequestAssignment ();
		%feature("compactdefaultargs") ApprovalAssignment;
		%feature("autodoc", "	* Returns Value as ApprovalAssignment (or Null if another type)

	:rtype: Handle_StepBasic_ApprovalAssignment
") ApprovalAssignment;
		Handle_StepBasic_ApprovalAssignment ApprovalAssignment ();
		%feature("compactdefaultargs") ApprovalDateTime;
		%feature("autodoc", "	* Returns Value as ApprovalDateTime (or Null if another type)

	:rtype: Handle_StepBasic_ApprovalDateTime
") ApprovalDateTime;
		Handle_StepBasic_ApprovalDateTime ApprovalDateTime ();
		%feature("compactdefaultargs") CertificationAssignment;
		%feature("autodoc", "	* Returns Value as CertificationAssignment (or Null if another type)

	:rtype: Handle_StepBasic_CertificationAssignment
") CertificationAssignment;
		Handle_StepBasic_CertificationAssignment CertificationAssignment ();
		%feature("compactdefaultargs") ContractAssignment;
		%feature("autodoc", "	* Returns Value as ContractAssignment (or Null if another type)

	:rtype: Handle_StepBasic_ContractAssignment
") ContractAssignment;
		Handle_StepBasic_ContractAssignment ContractAssignment ();
		%feature("compactdefaultargs") DocumentReference;
		%feature("autodoc", "	* Returns Value as DocumentReference (or Null if another type)

	:rtype: Handle_StepBasic_DocumentReference
") DocumentReference;
		Handle_StepBasic_DocumentReference DocumentReference ();
		%feature("compactdefaultargs") EffectivityAssignment;
		%feature("autodoc", "	* Returns Value as EffectivityAssignment (or Null if another type)

	:rtype: Handle_StepBasic_EffectivityAssignment
") EffectivityAssignment;
		Handle_StepBasic_EffectivityAssignment EffectivityAssignment ();
		%feature("compactdefaultargs") GroupAssignment;
		%feature("autodoc", "	* Returns Value as GroupAssignment (or Null if another type)

	:rtype: Handle_StepBasic_GroupAssignment
") GroupAssignment;
		Handle_StepBasic_GroupAssignment GroupAssignment ();
		%feature("compactdefaultargs") NameAssignment;
		%feature("autodoc", "	* Returns Value as NameAssignment (or Null if another type)

	:rtype: Handle_StepBasic_NameAssignment
") NameAssignment;
		Handle_StepBasic_NameAssignment NameAssignment ();
		%feature("compactdefaultargs") SecurityClassificationAssignment;
		%feature("autodoc", "	* Returns Value as SecurityClassificationAssignment (or Null if another type)

	:rtype: Handle_StepBasic_SecurityClassificationAssignment
") SecurityClassificationAssignment;
		Handle_StepBasic_SecurityClassificationAssignment SecurityClassificationAssignment ();
};


%extend StepBasic_RoleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SecurityClassification;
class StepBasic_SecurityClassification : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_SecurityClassification;
		%feature("autodoc", "	* Returns a SecurityClassification

	:rtype: None
") StepBasic_SecurityClassification;
		 StepBasic_SecurityClassification ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPurpose:
	:type aPurpose: Handle_TCollection_HAsciiString &
	:param aSecurityLevel:
	:type aSecurityLevel: Handle_StepBasic_SecurityClassificationLevel &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aPurpose,const Handle_StepBasic_SecurityClassificationLevel & aSecurityLevel);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	:param aPurpose:
	:type aPurpose: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPurpose;
		void SetPurpose (const Handle_TCollection_HAsciiString & aPurpose);
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Purpose;
		Handle_TCollection_HAsciiString Purpose ();
		%feature("compactdefaultargs") SetSecurityLevel;
		%feature("autodoc", "	:param aSecurityLevel:
	:type aSecurityLevel: Handle_StepBasic_SecurityClassificationLevel &
	:rtype: None
") SetSecurityLevel;
		void SetSecurityLevel (const Handle_StepBasic_SecurityClassificationLevel & aSecurityLevel);
		%feature("compactdefaultargs") SecurityLevel;
		%feature("autodoc", "	:rtype: Handle_StepBasic_SecurityClassificationLevel
") SecurityLevel;
		Handle_StepBasic_SecurityClassificationLevel SecurityLevel ();
};


%extend StepBasic_SecurityClassification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SecurityClassification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SecurityClassification::Handle_StepBasic_SecurityClassification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SecurityClassification;
class Handle_StepBasic_SecurityClassification : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_SecurityClassification();
        Handle_StepBasic_SecurityClassification(const Handle_StepBasic_SecurityClassification &aHandle);
        Handle_StepBasic_SecurityClassification(const StepBasic_SecurityClassification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SecurityClassification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SecurityClassification {
    StepBasic_SecurityClassification* _get_reference() {
    return (StepBasic_SecurityClassification*)$self->Access();
    }
};

%extend Handle_StepBasic_SecurityClassification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SecurityClassification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SecurityClassificationAssignment;
class StepBasic_SecurityClassificationAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedSecurityClassification:
	:type aAssignedSecurityClassification: Handle_StepBasic_SecurityClassification &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_SecurityClassification & aAssignedSecurityClassification);
		%feature("compactdefaultargs") SetAssignedSecurityClassification;
		%feature("autodoc", "	:param aAssignedSecurityClassification:
	:type aAssignedSecurityClassification: Handle_StepBasic_SecurityClassification &
	:rtype: None
") SetAssignedSecurityClassification;
		void SetAssignedSecurityClassification (const Handle_StepBasic_SecurityClassification & aAssignedSecurityClassification);
		%feature("compactdefaultargs") AssignedSecurityClassification;
		%feature("autodoc", "	:rtype: Handle_StepBasic_SecurityClassification
") AssignedSecurityClassification;
		Handle_StepBasic_SecurityClassification AssignedSecurityClassification ();
};


%extend StepBasic_SecurityClassificationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SecurityClassificationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SecurityClassificationAssignment::Handle_StepBasic_SecurityClassificationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SecurityClassificationAssignment;
class Handle_StepBasic_SecurityClassificationAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_SecurityClassificationAssignment();
        Handle_StepBasic_SecurityClassificationAssignment(const Handle_StepBasic_SecurityClassificationAssignment &aHandle);
        Handle_StepBasic_SecurityClassificationAssignment(const StepBasic_SecurityClassificationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SecurityClassificationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SecurityClassificationAssignment {
    StepBasic_SecurityClassificationAssignment* _get_reference() {
    return (StepBasic_SecurityClassificationAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_SecurityClassificationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SecurityClassificationLevel;
class StepBasic_SecurityClassificationLevel : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_SecurityClassificationLevel;
		%feature("autodoc", "	* Returns a SecurityClassificationLevel

	:rtype: None
") StepBasic_SecurityClassificationLevel;
		 StepBasic_SecurityClassificationLevel ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
};


%extend StepBasic_SecurityClassificationLevel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SecurityClassificationLevel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SecurityClassificationLevel::Handle_StepBasic_SecurityClassificationLevel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SecurityClassificationLevel;
class Handle_StepBasic_SecurityClassificationLevel : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_SecurityClassificationLevel();
        Handle_StepBasic_SecurityClassificationLevel(const Handle_StepBasic_SecurityClassificationLevel &aHandle);
        Handle_StepBasic_SecurityClassificationLevel(const StepBasic_SecurityClassificationLevel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SecurityClassificationLevel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SecurityClassificationLevel {
    StepBasic_SecurityClassificationLevel* _get_reference() {
    return (StepBasic_SecurityClassificationLevel*)$self->Access();
    }
};

%extend Handle_StepBasic_SecurityClassificationLevel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SecurityClassificationLevel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SizeMember;
class StepBasic_SizeMember : public StepData_SelectReal {
	public:
		%feature("compactdefaultargs") StepBasic_SizeMember;
		%feature("autodoc", "	:rtype: None
") StepBasic_SizeMember;
		 StepBasic_SizeMember ();
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
};


%extend StepBasic_SizeMember {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SizeMember(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SizeMember::Handle_StepBasic_SizeMember %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SizeMember;
class Handle_StepBasic_SizeMember : public Handle_StepData_SelectReal {

    public:
        // constructors
        Handle_StepBasic_SizeMember();
        Handle_StepBasic_SizeMember(const Handle_StepBasic_SizeMember &aHandle);
        Handle_StepBasic_SizeMember(const StepBasic_SizeMember *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SizeMember DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SizeMember {
    StepBasic_SizeMember* _get_reference() {
    return (StepBasic_SizeMember*)$self->Access();
    }
};

%extend Handle_StepBasic_SizeMember {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SizeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SizeSelect;
class StepBasic_SizeSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepBasic_SizeSelect;
		%feature("autodoc", "	* Returns a SizeSelect SelectType

	:rtype: None
") StepBasic_SizeSelect;
		 StepBasic_SizeSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a TrimmingSelect Kind Entity that is : 1 -> SizeMember 0 else (i.e. Real)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a SizeMember (POSITIVE_LENGTH_MEASURE) as preferred

	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a SelectMember as Real, named as PARAMETER_VALUE 1 -> PositiveLengthMeasure i.e. Real 0 else (i.e. Entity)

	:param ent:
	:type ent: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & ent);
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "	:param aReal:
	:type aReal: float
	:rtype: None
") SetRealValue;
		void SetRealValue (const Standard_Real aReal);
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "	* returns Value as a Real (Null if another type)

	:rtype: float
") RealValue;
		Standard_Real RealValue ();
};


%extend StepBasic_SizeSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SourceItem;
class StepBasic_SourceItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepBasic_SourceItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_SourceItem;
		 StepBasic_SourceItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of SourceItem select type 1 -> HAsciiString from TCollection 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") Identifier;
		%feature("autodoc", "	* Returns Value as Identifier (or Null if another type)

	:rtype: Handle_TCollection_HAsciiString
") Identifier;
		Handle_TCollection_HAsciiString Identifier ();
};


%extend StepBasic_SourceItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Unit;
class StepBasic_Unit : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepBasic_Unit;
		%feature("autodoc", "	* Creates empty object

	:rtype: None
") StepBasic_Unit;
		 StepBasic_Unit ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a type of Unit Entity 1 -> NamedUnit 2 -> DerivedUnit

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") NamedUnit;
		%feature("autodoc", "	* returns Value as a NamedUnit (Null if another type)

	:rtype: Handle_StepBasic_NamedUnit
") NamedUnit;
		Handle_StepBasic_NamedUnit NamedUnit ();
		%feature("compactdefaultargs") DerivedUnit;
		%feature("autodoc", "	* returns Value as a DerivedUnit (Null if another type)

	:rtype: Handle_StepBasic_DerivedUnit
") DerivedUnit;
		Handle_StepBasic_DerivedUnit DerivedUnit ();
};


%extend StepBasic_Unit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_VersionedActionRequest;
class StepBasic_VersionedActionRequest : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepBasic_VersionedActionRequest;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_VersionedActionRequest;
		 StepBasic_VersionedActionRequest ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aVersion:
	:type aVersion: Handle_TCollection_HAsciiString &
	:param aPurpose:
	:type aPurpose: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aVersion,const Handle_TCollection_HAsciiString & aPurpose,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & Id);
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "	* Returns field Version

	:rtype: Handle_TCollection_HAsciiString
") Version;
		Handle_TCollection_HAsciiString Version ();
		%feature("compactdefaultargs") SetVersion;
		%feature("autodoc", "	* Set field Version

	:param Version:
	:type Version: Handle_TCollection_HAsciiString &
	:rtype: None
") SetVersion;
		void SetVersion (const Handle_TCollection_HAsciiString & Version);
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: Handle_TCollection_HAsciiString
") Purpose;
		Handle_TCollection_HAsciiString Purpose ();
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPurpose;
		void SetPurpose (const Handle_TCollection_HAsciiString & Purpose);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
};


%extend StepBasic_VersionedActionRequest {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_VersionedActionRequest(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_VersionedActionRequest::Handle_StepBasic_VersionedActionRequest %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_VersionedActionRequest;
class Handle_StepBasic_VersionedActionRequest : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepBasic_VersionedActionRequest();
        Handle_StepBasic_VersionedActionRequest(const Handle_StepBasic_VersionedActionRequest &aHandle);
        Handle_StepBasic_VersionedActionRequest(const StepBasic_VersionedActionRequest *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_VersionedActionRequest DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_VersionedActionRequest {
    StepBasic_VersionedActionRequest* _get_reference() {
    return (StepBasic_VersionedActionRequest*)$self->Access();
    }
};

%extend Handle_StepBasic_VersionedActionRequest {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_VersionedActionRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_AreaUnit;
class StepBasic_AreaUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_AreaUnit;
		%feature("autodoc", "	:rtype: None
") StepBasic_AreaUnit;
		 StepBasic_AreaUnit ();
};


%extend StepBasic_AreaUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_AreaUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_AreaUnit::Handle_StepBasic_AreaUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_AreaUnit;
class Handle_StepBasic_AreaUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_AreaUnit();
        Handle_StepBasic_AreaUnit(const Handle_StepBasic_AreaUnit &aHandle);
        Handle_StepBasic_AreaUnit(const StepBasic_AreaUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_AreaUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_AreaUnit {
    StepBasic_AreaUnit* _get_reference() {
    return (StepBasic_AreaUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_AreaUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_AreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_CalendarDate;
class StepBasic_CalendarDate : public StepBasic_Date {
	public:
		%feature("compactdefaultargs") StepBasic_CalendarDate;
		%feature("autodoc", "	* Returns a CalendarDate

	:rtype: None
") StepBasic_CalendarDate;
		 StepBasic_CalendarDate ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Integer aYearComponent);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:param aDayComponent:
	:type aDayComponent: int
	:param aMonthComponent:
	:type aMonthComponent: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Integer aYearComponent,const Standard_Integer aDayComponent,const Standard_Integer aMonthComponent);
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "	:param aDayComponent:
	:type aDayComponent: int
	:rtype: None
") SetDayComponent;
		void SetDayComponent (const Standard_Integer aDayComponent);
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "	:rtype: int
") DayComponent;
		Standard_Integer DayComponent ();
		%feature("compactdefaultargs") SetMonthComponent;
		%feature("autodoc", "	:param aMonthComponent:
	:type aMonthComponent: int
	:rtype: None
") SetMonthComponent;
		void SetMonthComponent (const Standard_Integer aMonthComponent);
		%feature("compactdefaultargs") MonthComponent;
		%feature("autodoc", "	:rtype: int
") MonthComponent;
		Standard_Integer MonthComponent ();
};


%extend StepBasic_CalendarDate {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_CalendarDate(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_CalendarDate::Handle_StepBasic_CalendarDate %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_CalendarDate;
class Handle_StepBasic_CalendarDate : public Handle_StepBasic_Date {

    public:
        // constructors
        Handle_StepBasic_CalendarDate();
        Handle_StepBasic_CalendarDate(const Handle_StepBasic_CalendarDate &aHandle);
        Handle_StepBasic_CalendarDate(const StepBasic_CalendarDate *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_CalendarDate DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_CalendarDate {
    StepBasic_CalendarDate* _get_reference() {
    return (StepBasic_CalendarDate*)$self->Access();
    }
};

%extend Handle_StepBasic_CalendarDate {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_CalendarDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnit;
class StepBasic_ConversionBasedUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnit

	:rtype: None
") StepBasic_ConversionBasedUnit;
		 StepBasic_ConversionBasedUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aConversionFactor:
	:type aConversionFactor: Handle_StepBasic_MeasureWithUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions,const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_MeasureWithUnit & aConversionFactor);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetConversionFactor;
		%feature("autodoc", "	:param aConversionFactor:
	:type aConversionFactor: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") SetConversionFactor;
		void SetConversionFactor (const Handle_StepBasic_MeasureWithUnit & aConversionFactor);
		%feature("compactdefaultargs") ConversionFactor;
		%feature("autodoc", "	:rtype: Handle_StepBasic_MeasureWithUnit
") ConversionFactor;
		Handle_StepBasic_MeasureWithUnit ConversionFactor ();
};


%extend StepBasic_ConversionBasedUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ConversionBasedUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ConversionBasedUnit::Handle_StepBasic_ConversionBasedUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ConversionBasedUnit;
class Handle_StepBasic_ConversionBasedUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_ConversionBasedUnit();
        Handle_StepBasic_ConversionBasedUnit(const Handle_StepBasic_ConversionBasedUnit &aHandle);
        Handle_StepBasic_ConversionBasedUnit(const StepBasic_ConversionBasedUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ConversionBasedUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnit {
    StepBasic_ConversionBasedUnit* _get_reference() {
    return (StepBasic_ConversionBasedUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_ConversionBasedUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ConversionBasedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DigitalDocument;
class StepBasic_DigitalDocument : public StepBasic_Document {
	public:
		%feature("compactdefaultargs") StepBasic_DigitalDocument;
		%feature("autodoc", "	:rtype: None
") StepBasic_DigitalDocument;
		 StepBasic_DigitalDocument ();
};


%extend StepBasic_DigitalDocument {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DigitalDocument(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DigitalDocument::Handle_StepBasic_DigitalDocument %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DigitalDocument;
class Handle_StepBasic_DigitalDocument : public Handle_StepBasic_Document {

    public:
        // constructors
        Handle_StepBasic_DigitalDocument();
        Handle_StepBasic_DigitalDocument(const Handle_StepBasic_DigitalDocument &aHandle);
        Handle_StepBasic_DigitalDocument(const StepBasic_DigitalDocument *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DigitalDocument DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DigitalDocument {
    StepBasic_DigitalDocument* _get_reference() {
    return (StepBasic_DigitalDocument*)$self->Access();
    }
};

%extend Handle_StepBasic_DigitalDocument {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DigitalDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentFile;
class StepBasic_DocumentFile : public StepBasic_Document {
	public:
		%feature("compactdefaultargs") StepBasic_DocumentFile;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_DocumentFile;
		 StepBasic_DocumentFile ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDocument_Id:
	:type aDocument_Id: Handle_TCollection_HAsciiString &
	:param aDocument_Name:
	:type aDocument_Name: Handle_TCollection_HAsciiString &
	:param hasDocument_Description:
	:type hasDocument_Description: bool
	:param aDocument_Description:
	:type aDocument_Description: Handle_TCollection_HAsciiString &
	:param aDocument_Kind:
	:type aDocument_Kind: Handle_StepBasic_DocumentType &
	:param aCharacterizedObject_Name:
	:type aCharacterizedObject_Name: Handle_TCollection_HAsciiString &
	:param hasCharacterizedObject_Description:
	:type hasCharacterizedObject_Description: bool
	:param aCharacterizedObject_Description:
	:type aCharacterizedObject_Description: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aDocument_Id,const Handle_TCollection_HAsciiString & aDocument_Name,const Standard_Boolean hasDocument_Description,const Handle_TCollection_HAsciiString & aDocument_Description,const Handle_StepBasic_DocumentType & aDocument_Kind,const Handle_TCollection_HAsciiString & aCharacterizedObject_Name,const Standard_Boolean hasCharacterizedObject_Description,const Handle_TCollection_HAsciiString & aCharacterizedObject_Description);
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "	* Returns data for supertype CharacterizedObject

	:rtype: Handle_StepBasic_CharacterizedObject
") CharacterizedObject;
		Handle_StepBasic_CharacterizedObject CharacterizedObject ();
		%feature("compactdefaultargs") SetCharacterizedObject;
		%feature("autodoc", "	* Set data for supertype CharacterizedObject

	:param CharacterizedObject:
	:type CharacterizedObject: Handle_StepBasic_CharacterizedObject &
	:rtype: None
") SetCharacterizedObject;
		void SetCharacterizedObject (const Handle_StepBasic_CharacterizedObject & CharacterizedObject);
};


%extend StepBasic_DocumentFile {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DocumentFile(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DocumentFile::Handle_StepBasic_DocumentFile %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DocumentFile;
class Handle_StepBasic_DocumentFile : public Handle_StepBasic_Document {

    public:
        // constructors
        Handle_StepBasic_DocumentFile();
        Handle_StepBasic_DocumentFile(const Handle_StepBasic_DocumentFile &aHandle);
        Handle_StepBasic_DocumentFile(const StepBasic_DocumentFile *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DocumentFile DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentFile {
    StepBasic_DocumentFile* _get_reference() {
    return (StepBasic_DocumentFile*)$self->Access();
    }
};

%extend Handle_StepBasic_DocumentFile {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DocumentFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentProductEquivalence;
class StepBasic_DocumentProductEquivalence : public StepBasic_DocumentProductAssociation {
	public:
		%feature("compactdefaultargs") StepBasic_DocumentProductEquivalence;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_DocumentProductEquivalence;
		 StepBasic_DocumentProductEquivalence ();
};


%extend StepBasic_DocumentProductEquivalence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DocumentProductEquivalence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DocumentProductEquivalence::Handle_StepBasic_DocumentProductEquivalence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DocumentProductEquivalence;
class Handle_StepBasic_DocumentProductEquivalence : public Handle_StepBasic_DocumentProductAssociation {

    public:
        // constructors
        Handle_StepBasic_DocumentProductEquivalence();
        Handle_StepBasic_DocumentProductEquivalence(const Handle_StepBasic_DocumentProductEquivalence &aHandle);
        Handle_StepBasic_DocumentProductEquivalence(const StepBasic_DocumentProductEquivalence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DocumentProductEquivalence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentProductEquivalence {
    StepBasic_DocumentProductEquivalence* _get_reference() {
    return (StepBasic_DocumentProductEquivalence*)$self->Access();
    }
};

%extend Handle_StepBasic_DocumentProductEquivalence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DocumentProductEquivalence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ExternalIdentificationAssignment;
class StepBasic_ExternalIdentificationAssignment : public StepBasic_IdentificationAssignment {
	public:
		%feature("compactdefaultargs") StepBasic_ExternalIdentificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ExternalIdentificationAssignment;
		 StepBasic_ExternalIdentificationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aIdentificationAssignment_AssignedId:
	:type aIdentificationAssignment_AssignedId: Handle_TCollection_HAsciiString &
	:param aIdentificationAssignment_Role:
	:type aIdentificationAssignment_Role: Handle_StepBasic_IdentificationRole &
	:param aSource:
	:type aSource: Handle_StepBasic_ExternalSource &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aIdentificationAssignment_AssignedId,const Handle_StepBasic_IdentificationRole & aIdentificationAssignment_Role,const Handle_StepBasic_ExternalSource & aSource);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	* Returns field Source

	:rtype: Handle_StepBasic_ExternalSource
") Source;
		Handle_StepBasic_ExternalSource Source ();
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	* Set field Source

	:param Source:
	:type Source: Handle_StepBasic_ExternalSource &
	:rtype: None
") SetSource;
		void SetSource (const Handle_StepBasic_ExternalSource & Source);
};


%extend StepBasic_ExternalIdentificationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ExternalIdentificationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ExternalIdentificationAssignment::Handle_StepBasic_ExternalIdentificationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ExternalIdentificationAssignment;
class Handle_StepBasic_ExternalIdentificationAssignment : public Handle_StepBasic_IdentificationAssignment {

    public:
        // constructors
        Handle_StepBasic_ExternalIdentificationAssignment();
        Handle_StepBasic_ExternalIdentificationAssignment(const Handle_StepBasic_ExternalIdentificationAssignment &aHandle);
        Handle_StepBasic_ExternalIdentificationAssignment(const StepBasic_ExternalIdentificationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ExternalIdentificationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ExternalIdentificationAssignment {
    StepBasic_ExternalIdentificationAssignment* _get_reference() {
    return (StepBasic_ExternalIdentificationAssignment*)$self->Access();
    }
};

%extend Handle_StepBasic_ExternalIdentificationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ExternalIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_LengthMeasureWithUnit;
class StepBasic_LengthMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_LengthMeasureWithUnit;
		%feature("autodoc", "	* Returns a LengthMeasureWithUnit

	:rtype: None
") StepBasic_LengthMeasureWithUnit;
		 StepBasic_LengthMeasureWithUnit ();
};


%extend StepBasic_LengthMeasureWithUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_LengthMeasureWithUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_LengthMeasureWithUnit::Handle_StepBasic_LengthMeasureWithUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_LengthMeasureWithUnit;
class Handle_StepBasic_LengthMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {

    public:
        // constructors
        Handle_StepBasic_LengthMeasureWithUnit();
        Handle_StepBasic_LengthMeasureWithUnit(const Handle_StepBasic_LengthMeasureWithUnit &aHandle);
        Handle_StepBasic_LengthMeasureWithUnit(const StepBasic_LengthMeasureWithUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_LengthMeasureWithUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_LengthMeasureWithUnit {
    StepBasic_LengthMeasureWithUnit* _get_reference() {
    return (StepBasic_LengthMeasureWithUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_LengthMeasureWithUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_LengthMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_LengthUnit;
class StepBasic_LengthUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_LengthUnit;
		%feature("autodoc", "	* Returns a LengthUnit

	:rtype: None
") StepBasic_LengthUnit;
		 StepBasic_LengthUnit ();
};


%extend StepBasic_LengthUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_LengthUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_LengthUnit::Handle_StepBasic_LengthUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_LengthUnit;
class Handle_StepBasic_LengthUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_LengthUnit();
        Handle_StepBasic_LengthUnit(const Handle_StepBasic_LengthUnit &aHandle);
        Handle_StepBasic_LengthUnit(const StepBasic_LengthUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_LengthUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_LengthUnit {
    StepBasic_LengthUnit* _get_reference() {
    return (StepBasic_LengthUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_LengthUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_LengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_MassMeasureWithUnit;
class StepBasic_MassMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_MassMeasureWithUnit;
		%feature("autodoc", "	* Returns a MassMeasureWithUnit

	:rtype: None
") StepBasic_MassMeasureWithUnit;
		 StepBasic_MassMeasureWithUnit ();
};


%extend StepBasic_MassMeasureWithUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_MassMeasureWithUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_MassMeasureWithUnit::Handle_StepBasic_MassMeasureWithUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_MassMeasureWithUnit;
class Handle_StepBasic_MassMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {

    public:
        // constructors
        Handle_StepBasic_MassMeasureWithUnit();
        Handle_StepBasic_MassMeasureWithUnit(const Handle_StepBasic_MassMeasureWithUnit &aHandle);
        Handle_StepBasic_MassMeasureWithUnit(const StepBasic_MassMeasureWithUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_MassMeasureWithUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_MassMeasureWithUnit {
    StepBasic_MassMeasureWithUnit* _get_reference() {
    return (StepBasic_MassMeasureWithUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_MassMeasureWithUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_MassMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_MassUnit;
class StepBasic_MassUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_MassUnit;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_MassUnit;
		 StepBasic_MassUnit ();
};


%extend StepBasic_MassUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_MassUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_MassUnit::Handle_StepBasic_MassUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_MassUnit;
class Handle_StepBasic_MassUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_MassUnit();
        Handle_StepBasic_MassUnit(const Handle_StepBasic_MassUnit &aHandle);
        Handle_StepBasic_MassUnit(const StepBasic_MassUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_MassUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_MassUnit {
    StepBasic_MassUnit* _get_reference() {
    return (StepBasic_MassUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_MassUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_MassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_OrdinalDate;
class StepBasic_OrdinalDate : public StepBasic_Date {
	public:
		%feature("compactdefaultargs") StepBasic_OrdinalDate;
		%feature("autodoc", "	* Returns a OrdinalDate

	:rtype: None
") StepBasic_OrdinalDate;
		 StepBasic_OrdinalDate ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Integer aYearComponent);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:param aDayComponent:
	:type aDayComponent: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Integer aYearComponent,const Standard_Integer aDayComponent);
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "	:param aDayComponent:
	:type aDayComponent: int
	:rtype: None
") SetDayComponent;
		void SetDayComponent (const Standard_Integer aDayComponent);
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "	:rtype: int
") DayComponent;
		Standard_Integer DayComponent ();
};


%extend StepBasic_OrdinalDate {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_OrdinalDate(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_OrdinalDate::Handle_StepBasic_OrdinalDate %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_OrdinalDate;
class Handle_StepBasic_OrdinalDate : public Handle_StepBasic_Date {

    public:
        // constructors
        Handle_StepBasic_OrdinalDate();
        Handle_StepBasic_OrdinalDate(const Handle_StepBasic_OrdinalDate &aHandle);
        Handle_StepBasic_OrdinalDate(const StepBasic_OrdinalDate *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_OrdinalDate DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_OrdinalDate {
    StepBasic_OrdinalDate* _get_reference() {
    return (StepBasic_OrdinalDate*)$self->Access();
    }
};

%extend Handle_StepBasic_OrdinalDate {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_OrdinalDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_OrganizationalAddress;
class StepBasic_OrganizationalAddress : public StepBasic_Address {
	public:
		%feature("compactdefaultargs") StepBasic_OrganizationalAddress;
		%feature("autodoc", "	* Returns a OrganizationalAddress

	:rtype: None
") StepBasic_OrganizationalAddress;
		 StepBasic_OrganizationalAddress ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAinternalLocation:
	:type hasAinternalLocation: bool
	:param aInternalLocation:
	:type aInternalLocation: Handle_TCollection_HAsciiString &
	:param hasAstreetNumber:
	:type hasAstreetNumber: bool
	:param aStreetNumber:
	:type aStreetNumber: Handle_TCollection_HAsciiString &
	:param hasAstreet:
	:type hasAstreet: bool
	:param aStreet:
	:type aStreet: Handle_TCollection_HAsciiString &
	:param hasApostalBox:
	:type hasApostalBox: bool
	:param aPostalBox:
	:type aPostalBox: Handle_TCollection_HAsciiString &
	:param hasAtown:
	:type hasAtown: bool
	:param aTown:
	:type aTown: Handle_TCollection_HAsciiString &
	:param hasAregion:
	:type hasAregion: bool
	:param aRegion:
	:type aRegion: Handle_TCollection_HAsciiString &
	:param hasApostalCode:
	:type hasApostalCode: bool
	:param aPostalCode:
	:type aPostalCode: Handle_TCollection_HAsciiString &
	:param hasAcountry:
	:type hasAcountry: bool
	:param aCountry:
	:type aCountry: Handle_TCollection_HAsciiString &
	:param hasAfacsimileNumber:
	:type hasAfacsimileNumber: bool
	:param aFacsimileNumber:
	:type aFacsimileNumber: Handle_TCollection_HAsciiString &
	:param hasAtelephoneNumber:
	:type hasAtelephoneNumber: bool
	:param aTelephoneNumber:
	:type aTelephoneNumber: Handle_TCollection_HAsciiString &
	:param hasAelectronicMailAddress:
	:type hasAelectronicMailAddress: bool
	:param aElectronicMailAddress:
	:type aElectronicMailAddress: Handle_TCollection_HAsciiString &
	:param hasAtelexNumber:
	:type hasAtelexNumber: bool
	:param aTelexNumber:
	:type aTelexNumber: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAinternalLocation,const Handle_TCollection_HAsciiString & aInternalLocation,const Standard_Boolean hasAstreetNumber,const Handle_TCollection_HAsciiString & aStreetNumber,const Standard_Boolean hasAstreet,const Handle_TCollection_HAsciiString & aStreet,const Standard_Boolean hasApostalBox,const Handle_TCollection_HAsciiString & aPostalBox,const Standard_Boolean hasAtown,const Handle_TCollection_HAsciiString & aTown,const Standard_Boolean hasAregion,const Handle_TCollection_HAsciiString & aRegion,const Standard_Boolean hasApostalCode,const Handle_TCollection_HAsciiString & aPostalCode,const Standard_Boolean hasAcountry,const Handle_TCollection_HAsciiString & aCountry,const Standard_Boolean hasAfacsimileNumber,const Handle_TCollection_HAsciiString & aFacsimileNumber,const Standard_Boolean hasAtelephoneNumber,const Handle_TCollection_HAsciiString & aTelephoneNumber,const Standard_Boolean hasAelectronicMailAddress,const Handle_TCollection_HAsciiString & aElectronicMailAddress,const Standard_Boolean hasAtelexNumber,const Handle_TCollection_HAsciiString & aTelexNumber);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAinternalLocation:
	:type hasAinternalLocation: bool
	:param aInternalLocation:
	:type aInternalLocation: Handle_TCollection_HAsciiString &
	:param hasAstreetNumber:
	:type hasAstreetNumber: bool
	:param aStreetNumber:
	:type aStreetNumber: Handle_TCollection_HAsciiString &
	:param hasAstreet:
	:type hasAstreet: bool
	:param aStreet:
	:type aStreet: Handle_TCollection_HAsciiString &
	:param hasApostalBox:
	:type hasApostalBox: bool
	:param aPostalBox:
	:type aPostalBox: Handle_TCollection_HAsciiString &
	:param hasAtown:
	:type hasAtown: bool
	:param aTown:
	:type aTown: Handle_TCollection_HAsciiString &
	:param hasAregion:
	:type hasAregion: bool
	:param aRegion:
	:type aRegion: Handle_TCollection_HAsciiString &
	:param hasApostalCode:
	:type hasApostalCode: bool
	:param aPostalCode:
	:type aPostalCode: Handle_TCollection_HAsciiString &
	:param hasAcountry:
	:type hasAcountry: bool
	:param aCountry:
	:type aCountry: Handle_TCollection_HAsciiString &
	:param hasAfacsimileNumber:
	:type hasAfacsimileNumber: bool
	:param aFacsimileNumber:
	:type aFacsimileNumber: Handle_TCollection_HAsciiString &
	:param hasAtelephoneNumber:
	:type hasAtelephoneNumber: bool
	:param aTelephoneNumber:
	:type aTelephoneNumber: Handle_TCollection_HAsciiString &
	:param hasAelectronicMailAddress:
	:type hasAelectronicMailAddress: bool
	:param aElectronicMailAddress:
	:type aElectronicMailAddress: Handle_TCollection_HAsciiString &
	:param hasAtelexNumber:
	:type hasAtelexNumber: bool
	:param aTelexNumber:
	:type aTelexNumber: Handle_TCollection_HAsciiString &
	:param aOrganizations:
	:type aOrganizations: Handle_StepBasic_HArray1OfOrganization &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAinternalLocation,const Handle_TCollection_HAsciiString & aInternalLocation,const Standard_Boolean hasAstreetNumber,const Handle_TCollection_HAsciiString & aStreetNumber,const Standard_Boolean hasAstreet,const Handle_TCollection_HAsciiString & aStreet,const Standard_Boolean hasApostalBox,const Handle_TCollection_HAsciiString & aPostalBox,const Standard_Boolean hasAtown,const Handle_TCollection_HAsciiString & aTown,const Standard_Boolean hasAregion,const Handle_TCollection_HAsciiString & aRegion,const Standard_Boolean hasApostalCode,const Handle_TCollection_HAsciiString & aPostalCode,const Standard_Boolean hasAcountry,const Handle_TCollection_HAsciiString & aCountry,const Standard_Boolean hasAfacsimileNumber,const Handle_TCollection_HAsciiString & aFacsimileNumber,const Standard_Boolean hasAtelephoneNumber,const Handle_TCollection_HAsciiString & aTelephoneNumber,const Standard_Boolean hasAelectronicMailAddress,const Handle_TCollection_HAsciiString & aElectronicMailAddress,const Standard_Boolean hasAtelexNumber,const Handle_TCollection_HAsciiString & aTelexNumber,const Handle_StepBasic_HArray1OfOrganization & aOrganizations,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") SetOrganizations;
		%feature("autodoc", "	:param aOrganizations:
	:type aOrganizations: Handle_StepBasic_HArray1OfOrganization &
	:rtype: None
") SetOrganizations;
		void SetOrganizations (const Handle_StepBasic_HArray1OfOrganization & aOrganizations);
		%feature("compactdefaultargs") Organizations;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfOrganization
") Organizations;
		Handle_StepBasic_HArray1OfOrganization Organizations ();
		%feature("compactdefaultargs") OrganizationsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_Organization
") OrganizationsValue;
		Handle_StepBasic_Organization OrganizationsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbOrganizations;
		%feature("autodoc", "	:rtype: int
") NbOrganizations;
		Standard_Integer NbOrganizations ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
};


%extend StepBasic_OrganizationalAddress {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_OrganizationalAddress(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_OrganizationalAddress::Handle_StepBasic_OrganizationalAddress %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_OrganizationalAddress;
class Handle_StepBasic_OrganizationalAddress : public Handle_StepBasic_Address {

    public:
        // constructors
        Handle_StepBasic_OrganizationalAddress();
        Handle_StepBasic_OrganizationalAddress(const Handle_StepBasic_OrganizationalAddress &aHandle);
        Handle_StepBasic_OrganizationalAddress(const StepBasic_OrganizationalAddress *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_OrganizationalAddress DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_OrganizationalAddress {
    StepBasic_OrganizationalAddress* _get_reference() {
    return (StepBasic_OrganizationalAddress*)$self->Access();
    }
};

%extend Handle_StepBasic_OrganizationalAddress {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_OrganizationalAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PersonalAddress;
class StepBasic_PersonalAddress : public StepBasic_Address {
	public:
		%feature("compactdefaultargs") StepBasic_PersonalAddress;
		%feature("autodoc", "	* Returns a PersonalAddress

	:rtype: None
") StepBasic_PersonalAddress;
		 StepBasic_PersonalAddress ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAinternalLocation:
	:type hasAinternalLocation: bool
	:param aInternalLocation:
	:type aInternalLocation: Handle_TCollection_HAsciiString &
	:param hasAstreetNumber:
	:type hasAstreetNumber: bool
	:param aStreetNumber:
	:type aStreetNumber: Handle_TCollection_HAsciiString &
	:param hasAstreet:
	:type hasAstreet: bool
	:param aStreet:
	:type aStreet: Handle_TCollection_HAsciiString &
	:param hasApostalBox:
	:type hasApostalBox: bool
	:param aPostalBox:
	:type aPostalBox: Handle_TCollection_HAsciiString &
	:param hasAtown:
	:type hasAtown: bool
	:param aTown:
	:type aTown: Handle_TCollection_HAsciiString &
	:param hasAregion:
	:type hasAregion: bool
	:param aRegion:
	:type aRegion: Handle_TCollection_HAsciiString &
	:param hasApostalCode:
	:type hasApostalCode: bool
	:param aPostalCode:
	:type aPostalCode: Handle_TCollection_HAsciiString &
	:param hasAcountry:
	:type hasAcountry: bool
	:param aCountry:
	:type aCountry: Handle_TCollection_HAsciiString &
	:param hasAfacsimileNumber:
	:type hasAfacsimileNumber: bool
	:param aFacsimileNumber:
	:type aFacsimileNumber: Handle_TCollection_HAsciiString &
	:param hasAtelephoneNumber:
	:type hasAtelephoneNumber: bool
	:param aTelephoneNumber:
	:type aTelephoneNumber: Handle_TCollection_HAsciiString &
	:param hasAelectronicMailAddress:
	:type hasAelectronicMailAddress: bool
	:param aElectronicMailAddress:
	:type aElectronicMailAddress: Handle_TCollection_HAsciiString &
	:param hasAtelexNumber:
	:type hasAtelexNumber: bool
	:param aTelexNumber:
	:type aTelexNumber: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAinternalLocation,const Handle_TCollection_HAsciiString & aInternalLocation,const Standard_Boolean hasAstreetNumber,const Handle_TCollection_HAsciiString & aStreetNumber,const Standard_Boolean hasAstreet,const Handle_TCollection_HAsciiString & aStreet,const Standard_Boolean hasApostalBox,const Handle_TCollection_HAsciiString & aPostalBox,const Standard_Boolean hasAtown,const Handle_TCollection_HAsciiString & aTown,const Standard_Boolean hasAregion,const Handle_TCollection_HAsciiString & aRegion,const Standard_Boolean hasApostalCode,const Handle_TCollection_HAsciiString & aPostalCode,const Standard_Boolean hasAcountry,const Handle_TCollection_HAsciiString & aCountry,const Standard_Boolean hasAfacsimileNumber,const Handle_TCollection_HAsciiString & aFacsimileNumber,const Standard_Boolean hasAtelephoneNumber,const Handle_TCollection_HAsciiString & aTelephoneNumber,const Standard_Boolean hasAelectronicMailAddress,const Handle_TCollection_HAsciiString & aElectronicMailAddress,const Standard_Boolean hasAtelexNumber,const Handle_TCollection_HAsciiString & aTelexNumber);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAinternalLocation:
	:type hasAinternalLocation: bool
	:param aInternalLocation:
	:type aInternalLocation: Handle_TCollection_HAsciiString &
	:param hasAstreetNumber:
	:type hasAstreetNumber: bool
	:param aStreetNumber:
	:type aStreetNumber: Handle_TCollection_HAsciiString &
	:param hasAstreet:
	:type hasAstreet: bool
	:param aStreet:
	:type aStreet: Handle_TCollection_HAsciiString &
	:param hasApostalBox:
	:type hasApostalBox: bool
	:param aPostalBox:
	:type aPostalBox: Handle_TCollection_HAsciiString &
	:param hasAtown:
	:type hasAtown: bool
	:param aTown:
	:type aTown: Handle_TCollection_HAsciiString &
	:param hasAregion:
	:type hasAregion: bool
	:param aRegion:
	:type aRegion: Handle_TCollection_HAsciiString &
	:param hasApostalCode:
	:type hasApostalCode: bool
	:param aPostalCode:
	:type aPostalCode: Handle_TCollection_HAsciiString &
	:param hasAcountry:
	:type hasAcountry: bool
	:param aCountry:
	:type aCountry: Handle_TCollection_HAsciiString &
	:param hasAfacsimileNumber:
	:type hasAfacsimileNumber: bool
	:param aFacsimileNumber:
	:type aFacsimileNumber: Handle_TCollection_HAsciiString &
	:param hasAtelephoneNumber:
	:type hasAtelephoneNumber: bool
	:param aTelephoneNumber:
	:type aTelephoneNumber: Handle_TCollection_HAsciiString &
	:param hasAelectronicMailAddress:
	:type hasAelectronicMailAddress: bool
	:param aElectronicMailAddress:
	:type aElectronicMailAddress: Handle_TCollection_HAsciiString &
	:param hasAtelexNumber:
	:type hasAtelexNumber: bool
	:param aTelexNumber:
	:type aTelexNumber: Handle_TCollection_HAsciiString &
	:param aPeople:
	:type aPeople: Handle_StepBasic_HArray1OfPerson &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAinternalLocation,const Handle_TCollection_HAsciiString & aInternalLocation,const Standard_Boolean hasAstreetNumber,const Handle_TCollection_HAsciiString & aStreetNumber,const Standard_Boolean hasAstreet,const Handle_TCollection_HAsciiString & aStreet,const Standard_Boolean hasApostalBox,const Handle_TCollection_HAsciiString & aPostalBox,const Standard_Boolean hasAtown,const Handle_TCollection_HAsciiString & aTown,const Standard_Boolean hasAregion,const Handle_TCollection_HAsciiString & aRegion,const Standard_Boolean hasApostalCode,const Handle_TCollection_HAsciiString & aPostalCode,const Standard_Boolean hasAcountry,const Handle_TCollection_HAsciiString & aCountry,const Standard_Boolean hasAfacsimileNumber,const Handle_TCollection_HAsciiString & aFacsimileNumber,const Standard_Boolean hasAtelephoneNumber,const Handle_TCollection_HAsciiString & aTelephoneNumber,const Standard_Boolean hasAelectronicMailAddress,const Handle_TCollection_HAsciiString & aElectronicMailAddress,const Standard_Boolean hasAtelexNumber,const Handle_TCollection_HAsciiString & aTelexNumber,const Handle_StepBasic_HArray1OfPerson & aPeople,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") SetPeople;
		%feature("autodoc", "	:param aPeople:
	:type aPeople: Handle_StepBasic_HArray1OfPerson &
	:rtype: None
") SetPeople;
		void SetPeople (const Handle_StepBasic_HArray1OfPerson & aPeople);
		%feature("compactdefaultargs") People;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfPerson
") People;
		Handle_StepBasic_HArray1OfPerson People ();
		%feature("compactdefaultargs") PeopleValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_Person
") PeopleValue;
		Handle_StepBasic_Person PeopleValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbPeople;
		%feature("autodoc", "	:rtype: int
") NbPeople;
		Standard_Integer NbPeople ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
};


%extend StepBasic_PersonalAddress {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_PersonalAddress(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_PersonalAddress::Handle_StepBasic_PersonalAddress %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_PersonalAddress;
class Handle_StepBasic_PersonalAddress : public Handle_StepBasic_Address {

    public:
        // constructors
        Handle_StepBasic_PersonalAddress();
        Handle_StepBasic_PersonalAddress(const Handle_StepBasic_PersonalAddress &aHandle);
        Handle_StepBasic_PersonalAddress(const StepBasic_PersonalAddress *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_PersonalAddress DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PersonalAddress {
    StepBasic_PersonalAddress* _get_reference() {
    return (StepBasic_PersonalAddress*)$self->Access();
    }
};

%extend Handle_StepBasic_PersonalAddress {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_PersonalAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PhysicallyModeledProductDefinition;
class StepBasic_PhysicallyModeledProductDefinition : public StepBasic_ProductDefinition {
	public:
		%feature("compactdefaultargs") StepBasic_PhysicallyModeledProductDefinition;
		%feature("autodoc", "	:rtype: None
") StepBasic_PhysicallyModeledProductDefinition;
		 StepBasic_PhysicallyModeledProductDefinition ();
};


%extend StepBasic_PhysicallyModeledProductDefinition {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_PhysicallyModeledProductDefinition(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_PhysicallyModeledProductDefinition::Handle_StepBasic_PhysicallyModeledProductDefinition %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_PhysicallyModeledProductDefinition;
class Handle_StepBasic_PhysicallyModeledProductDefinition : public Handle_StepBasic_ProductDefinition {

    public:
        // constructors
        Handle_StepBasic_PhysicallyModeledProductDefinition();
        Handle_StepBasic_PhysicallyModeledProductDefinition(const Handle_StepBasic_PhysicallyModeledProductDefinition &aHandle);
        Handle_StepBasic_PhysicallyModeledProductDefinition(const StepBasic_PhysicallyModeledProductDefinition *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_PhysicallyModeledProductDefinition DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PhysicallyModeledProductDefinition {
    StepBasic_PhysicallyModeledProductDefinition* _get_reference() {
    return (StepBasic_PhysicallyModeledProductDefinition*)$self->Access();
    }
};

%extend Handle_StepBasic_PhysicallyModeledProductDefinition {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_PhysicallyModeledProductDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PlaneAngleMeasureWithUnit;
class StepBasic_PlaneAngleMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_PlaneAngleMeasureWithUnit;
		%feature("autodoc", "	* Returns a PlaneAngleMeasureWithUnit

	:rtype: None
") StepBasic_PlaneAngleMeasureWithUnit;
		 StepBasic_PlaneAngleMeasureWithUnit ();
};


%extend StepBasic_PlaneAngleMeasureWithUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_PlaneAngleMeasureWithUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_PlaneAngleMeasureWithUnit::Handle_StepBasic_PlaneAngleMeasureWithUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_PlaneAngleMeasureWithUnit;
class Handle_StepBasic_PlaneAngleMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {

    public:
        // constructors
        Handle_StepBasic_PlaneAngleMeasureWithUnit();
        Handle_StepBasic_PlaneAngleMeasureWithUnit(const Handle_StepBasic_PlaneAngleMeasureWithUnit &aHandle);
        Handle_StepBasic_PlaneAngleMeasureWithUnit(const StepBasic_PlaneAngleMeasureWithUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_PlaneAngleMeasureWithUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PlaneAngleMeasureWithUnit {
    StepBasic_PlaneAngleMeasureWithUnit* _get_reference() {
    return (StepBasic_PlaneAngleMeasureWithUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_PlaneAngleMeasureWithUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_PlaneAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PlaneAngleUnit;
class StepBasic_PlaneAngleUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_PlaneAngleUnit;
		%feature("autodoc", "	* Returns a PlaneAngleUnit

	:rtype: None
") StepBasic_PlaneAngleUnit;
		 StepBasic_PlaneAngleUnit ();
};


%extend StepBasic_PlaneAngleUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_PlaneAngleUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_PlaneAngleUnit::Handle_StepBasic_PlaneAngleUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_PlaneAngleUnit;
class Handle_StepBasic_PlaneAngleUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_PlaneAngleUnit();
        Handle_StepBasic_PlaneAngleUnit(const Handle_StepBasic_PlaneAngleUnit &aHandle);
        Handle_StepBasic_PlaneAngleUnit(const StepBasic_PlaneAngleUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_PlaneAngleUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PlaneAngleUnit {
    StepBasic_PlaneAngleUnit* _get_reference() {
    return (StepBasic_PlaneAngleUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_PlaneAngleUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_PlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductConceptContext;
class StepBasic_ProductConceptContext : public StepBasic_ApplicationContextElement {
	public:
		%feature("compactdefaultargs") StepBasic_ProductConceptContext;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductConceptContext;
		 StepBasic_ProductConceptContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aApplicationContextElement_Name:
	:type aApplicationContextElement_Name: Handle_TCollection_HAsciiString &
	:param aApplicationContextElement_FrameOfReference:
	:type aApplicationContextElement_FrameOfReference: Handle_StepBasic_ApplicationContext &
	:param aMarketSegmentType:
	:type aMarketSegmentType: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aApplicationContextElement_Name,const Handle_StepBasic_ApplicationContext & aApplicationContextElement_FrameOfReference,const Handle_TCollection_HAsciiString & aMarketSegmentType);
		%feature("compactdefaultargs") MarketSegmentType;
		%feature("autodoc", "	* Returns field MarketSegmentType

	:rtype: Handle_TCollection_HAsciiString
") MarketSegmentType;
		Handle_TCollection_HAsciiString MarketSegmentType ();
		%feature("compactdefaultargs") SetMarketSegmentType;
		%feature("autodoc", "	* Set field MarketSegmentType

	:param MarketSegmentType:
	:type MarketSegmentType: Handle_TCollection_HAsciiString &
	:rtype: None
") SetMarketSegmentType;
		void SetMarketSegmentType (const Handle_TCollection_HAsciiString & MarketSegmentType);
};


%extend StepBasic_ProductConceptContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductConceptContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductConceptContext::Handle_StepBasic_ProductConceptContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductConceptContext;
class Handle_StepBasic_ProductConceptContext : public Handle_StepBasic_ApplicationContextElement {

    public:
        // constructors
        Handle_StepBasic_ProductConceptContext();
        Handle_StepBasic_ProductConceptContext(const Handle_StepBasic_ProductConceptContext &aHandle);
        Handle_StepBasic_ProductConceptContext(const StepBasic_ProductConceptContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductConceptContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductConceptContext {
    StepBasic_ProductConceptContext* _get_reference() {
    return (StepBasic_ProductConceptContext*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductConceptContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductConceptContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductContext;
class StepBasic_ProductContext : public StepBasic_ApplicationContextElement {
	public:
		%feature("compactdefaultargs") StepBasic_ProductContext;
		%feature("autodoc", "	* Returns a ProductContext

	:rtype: None
") StepBasic_ProductContext;
		 StepBasic_ProductContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aFrameOfReference:
	:type aFrameOfReference: Handle_StepBasic_ApplicationContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_ApplicationContext & aFrameOfReference);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aFrameOfReference:
	:type aFrameOfReference: Handle_StepBasic_ApplicationContext &
	:param aDisciplineType:
	:type aDisciplineType: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_ApplicationContext & aFrameOfReference,const Handle_TCollection_HAsciiString & aDisciplineType);
		%feature("compactdefaultargs") SetDisciplineType;
		%feature("autodoc", "	:param aDisciplineType:
	:type aDisciplineType: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDisciplineType;
		void SetDisciplineType (const Handle_TCollection_HAsciiString & aDisciplineType);
		%feature("compactdefaultargs") DisciplineType;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") DisciplineType;
		Handle_TCollection_HAsciiString DisciplineType ();
};


%extend StepBasic_ProductContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductContext::Handle_StepBasic_ProductContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductContext;
class Handle_StepBasic_ProductContext : public Handle_StepBasic_ApplicationContextElement {

    public:
        // constructors
        Handle_StepBasic_ProductContext();
        Handle_StepBasic_ProductContext(const Handle_StepBasic_ProductContext &aHandle);
        Handle_StepBasic_ProductContext(const StepBasic_ProductContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductContext {
    StepBasic_ProductContext* _get_reference() {
    return (StepBasic_ProductContext*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionContext;
class StepBasic_ProductDefinitionContext : public StepBasic_ApplicationContextElement {
	public:
		%feature("compactdefaultargs") StepBasic_ProductDefinitionContext;
		%feature("autodoc", "	* Returns a ProductDefinitionContext

	:rtype: None
") StepBasic_ProductDefinitionContext;
		 StepBasic_ProductDefinitionContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aFrameOfReference:
	:type aFrameOfReference: Handle_StepBasic_ApplicationContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_ApplicationContext & aFrameOfReference);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aFrameOfReference:
	:type aFrameOfReference: Handle_StepBasic_ApplicationContext &
	:param aLifeCycleStage:
	:type aLifeCycleStage: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_ApplicationContext & aFrameOfReference,const Handle_TCollection_HAsciiString & aLifeCycleStage);
		%feature("compactdefaultargs") SetLifeCycleStage;
		%feature("autodoc", "	:param aLifeCycleStage:
	:type aLifeCycleStage: Handle_TCollection_HAsciiString &
	:rtype: None
") SetLifeCycleStage;
		void SetLifeCycleStage (const Handle_TCollection_HAsciiString & aLifeCycleStage);
		%feature("compactdefaultargs") LifeCycleStage;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") LifeCycleStage;
		Handle_TCollection_HAsciiString LifeCycleStage ();
};


%extend StepBasic_ProductDefinitionContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductDefinitionContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductDefinitionContext::Handle_StepBasic_ProductDefinitionContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductDefinitionContext;
class Handle_StepBasic_ProductDefinitionContext : public Handle_StepBasic_ApplicationContextElement {

    public:
        // constructors
        Handle_StepBasic_ProductDefinitionContext();
        Handle_StepBasic_ProductDefinitionContext(const Handle_StepBasic_ProductDefinitionContext &aHandle);
        Handle_StepBasic_ProductDefinitionContext(const StepBasic_ProductDefinitionContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductDefinitionContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionContext {
    StepBasic_ProductDefinitionContext* _get_reference() {
    return (StepBasic_ProductDefinitionContext*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductDefinitionContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductDefinitionContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionEffectivity;
class StepBasic_ProductDefinitionEffectivity : public StepBasic_Effectivity {
	public:
		%feature("compactdefaultargs") StepBasic_ProductDefinitionEffectivity;
		%feature("autodoc", "	:rtype: None
") StepBasic_ProductDefinitionEffectivity;
		 StepBasic_ProductDefinitionEffectivity ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aUsage:
	:type aUsage: Handle_StepBasic_ProductDefinitionRelationship &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aId,const Handle_StepBasic_ProductDefinitionRelationship & aUsage);
		%feature("compactdefaultargs") Usage;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") Usage;
		Handle_StepBasic_ProductDefinitionRelationship Usage ();
		%feature("compactdefaultargs") SetUsage;
		%feature("autodoc", "	:param aUsage:
	:type aUsage: Handle_StepBasic_ProductDefinitionRelationship &
	:rtype: None
") SetUsage;
		void SetUsage (const Handle_StepBasic_ProductDefinitionRelationship & aUsage);
};


%extend StepBasic_ProductDefinitionEffectivity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductDefinitionEffectivity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductDefinitionEffectivity::Handle_StepBasic_ProductDefinitionEffectivity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductDefinitionEffectivity;
class Handle_StepBasic_ProductDefinitionEffectivity : public Handle_StepBasic_Effectivity {

    public:
        // constructors
        Handle_StepBasic_ProductDefinitionEffectivity();
        Handle_StepBasic_ProductDefinitionEffectivity(const Handle_StepBasic_ProductDefinitionEffectivity &aHandle);
        Handle_StepBasic_ProductDefinitionEffectivity(const StepBasic_ProductDefinitionEffectivity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductDefinitionEffectivity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionEffectivity {
    StepBasic_ProductDefinitionEffectivity* _get_reference() {
    return (StepBasic_ProductDefinitionEffectivity*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductDefinitionEffectivity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductDefinitionEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionFormationWithSpecifiedSource;
class StepBasic_ProductDefinitionFormationWithSpecifiedSource : public StepBasic_ProductDefinitionFormation {
	public:
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormationWithSpecifiedSource;
		%feature("autodoc", "	* Returns a ProductDefinitionFormationWithSpecifiedSource

	:rtype: None
") StepBasic_ProductDefinitionFormationWithSpecifiedSource;
		 StepBasic_ProductDefinitionFormationWithSpecifiedSource ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aOfProduct:
	:type aOfProduct: Handle_StepBasic_Product &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_Product & aOfProduct);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aOfProduct:
	:type aOfProduct: Handle_StepBasic_Product &
	:param aMakeOrBuy:
	:type aMakeOrBuy: StepBasic_Source
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_Product & aOfProduct,const StepBasic_Source aMakeOrBuy);
		%feature("compactdefaultargs") SetMakeOrBuy;
		%feature("autodoc", "	:param aMakeOrBuy:
	:type aMakeOrBuy: StepBasic_Source
	:rtype: None
") SetMakeOrBuy;
		void SetMakeOrBuy (const StepBasic_Source aMakeOrBuy);
		%feature("compactdefaultargs") MakeOrBuy;
		%feature("autodoc", "	:rtype: StepBasic_Source
") MakeOrBuy;
		StepBasic_Source MakeOrBuy ();
};


%extend StepBasic_ProductDefinitionFormationWithSpecifiedSource {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource::Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource;
class Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource : public Handle_StepBasic_ProductDefinitionFormation {

    public:
        // constructors
        Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource();
        Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource(const Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource &aHandle);
        Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource(const StepBasic_ProductDefinitionFormationWithSpecifiedSource *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource {
    StepBasic_ProductDefinitionFormationWithSpecifiedSource* _get_reference() {
    return (StepBasic_ProductDefinitionFormationWithSpecifiedSource*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductDefinitionFormationWithSpecifiedSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionWithAssociatedDocuments;
class StepBasic_ProductDefinitionWithAssociatedDocuments : public StepBasic_ProductDefinition {
	public:
		%feature("compactdefaultargs") StepBasic_ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "	:rtype: None
") StepBasic_ProductDefinitionWithAssociatedDocuments;
		 StepBasic_ProductDefinitionWithAssociatedDocuments ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aFormation:
	:type aFormation: Handle_StepBasic_ProductDefinitionFormation &
	:param aFrame:
	:type aFrame: Handle_StepBasic_ProductDefinitionContext &
	:param aDocIds:
	:type aDocIds: Handle_StepBasic_HArray1OfDocument &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_ProductDefinitionFormation & aFormation,const Handle_StepBasic_ProductDefinitionContext & aFrame,const Handle_StepBasic_HArray1OfDocument & aDocIds);
		%feature("compactdefaultargs") DocIds;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfDocument
") DocIds;
		Handle_StepBasic_HArray1OfDocument DocIds ();
		%feature("compactdefaultargs") SetDocIds;
		%feature("autodoc", "	:param DocIds:
	:type DocIds: Handle_StepBasic_HArray1OfDocument &
	:rtype: None
") SetDocIds;
		void SetDocIds (const Handle_StepBasic_HArray1OfDocument & DocIds);
		%feature("compactdefaultargs") NbDocIds;
		%feature("autodoc", "	:rtype: int
") NbDocIds;
		Standard_Integer NbDocIds ();
		%feature("compactdefaultargs") DocIdsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_Document
") DocIdsValue;
		Handle_StepBasic_Document DocIdsValue (const Standard_Integer num);
		%feature("compactdefaultargs") SetDocIdsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:param adoc:
	:type adoc: Handle_StepBasic_Document &
	:rtype: None
") SetDocIdsValue;
		void SetDocIdsValue (const Standard_Integer num,const Handle_StepBasic_Document & adoc);
};


%extend StepBasic_ProductDefinitionWithAssociatedDocuments {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductDefinitionWithAssociatedDocuments(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductDefinitionWithAssociatedDocuments::Handle_StepBasic_ProductDefinitionWithAssociatedDocuments %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductDefinitionWithAssociatedDocuments;
class Handle_StepBasic_ProductDefinitionWithAssociatedDocuments : public Handle_StepBasic_ProductDefinition {

    public:
        // constructors
        Handle_StepBasic_ProductDefinitionWithAssociatedDocuments();
        Handle_StepBasic_ProductDefinitionWithAssociatedDocuments(const Handle_StepBasic_ProductDefinitionWithAssociatedDocuments &aHandle);
        Handle_StepBasic_ProductDefinitionWithAssociatedDocuments(const StepBasic_ProductDefinitionWithAssociatedDocuments *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductDefinitionWithAssociatedDocuments DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionWithAssociatedDocuments {
    StepBasic_ProductDefinitionWithAssociatedDocuments* _get_reference() {
    return (StepBasic_ProductDefinitionWithAssociatedDocuments*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductDefinitionWithAssociatedDocuments {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductDefinitionWithAssociatedDocuments {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductRelatedProductCategory;
class StepBasic_ProductRelatedProductCategory : public StepBasic_ProductCategory {
	public:
		%feature("compactdefaultargs") StepBasic_ProductRelatedProductCategory;
		%feature("autodoc", "	* Returns a ProductRelatedProductCategory

	:rtype: None
") StepBasic_ProductRelatedProductCategory;
		 StepBasic_ProductRelatedProductCategory ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasAdescription:
	:type hasAdescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasAdescription,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasAdescription:
	:type hasAdescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aProducts:
	:type aProducts: Handle_StepBasic_HArray1OfProduct &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasAdescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_HArray1OfProduct & aProducts);
		%feature("compactdefaultargs") SetProducts;
		%feature("autodoc", "	:param aProducts:
	:type aProducts: Handle_StepBasic_HArray1OfProduct &
	:rtype: None
") SetProducts;
		void SetProducts (const Handle_StepBasic_HArray1OfProduct & aProducts);
		%feature("compactdefaultargs") Products;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfProduct
") Products;
		Handle_StepBasic_HArray1OfProduct Products ();
		%feature("compactdefaultargs") ProductsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_Product
") ProductsValue;
		Handle_StepBasic_Product ProductsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbProducts;
		%feature("autodoc", "	:rtype: int
") NbProducts;
		Standard_Integer NbProducts ();
};


%extend StepBasic_ProductRelatedProductCategory {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductRelatedProductCategory(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductRelatedProductCategory::Handle_StepBasic_ProductRelatedProductCategory %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductRelatedProductCategory;
class Handle_StepBasic_ProductRelatedProductCategory : public Handle_StepBasic_ProductCategory {

    public:
        // constructors
        Handle_StepBasic_ProductRelatedProductCategory();
        Handle_StepBasic_ProductRelatedProductCategory(const Handle_StepBasic_ProductRelatedProductCategory &aHandle);
        Handle_StepBasic_ProductRelatedProductCategory(const StepBasic_ProductRelatedProductCategory *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductRelatedProductCategory DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductRelatedProductCategory {
    StepBasic_ProductRelatedProductCategory* _get_reference() {
    return (StepBasic_ProductRelatedProductCategory*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductRelatedProductCategory {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductRelatedProductCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_RatioMeasureWithUnit;
class StepBasic_RatioMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_RatioMeasureWithUnit;
		%feature("autodoc", "	* Returns a RatioMeasureWithUnit

	:rtype: None
") StepBasic_RatioMeasureWithUnit;
		 StepBasic_RatioMeasureWithUnit ();
};


%extend StepBasic_RatioMeasureWithUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_RatioMeasureWithUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_RatioMeasureWithUnit::Handle_StepBasic_RatioMeasureWithUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_RatioMeasureWithUnit;
class Handle_StepBasic_RatioMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {

    public:
        // constructors
        Handle_StepBasic_RatioMeasureWithUnit();
        Handle_StepBasic_RatioMeasureWithUnit(const Handle_StepBasic_RatioMeasureWithUnit &aHandle);
        Handle_StepBasic_RatioMeasureWithUnit(const StepBasic_RatioMeasureWithUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_RatioMeasureWithUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_RatioMeasureWithUnit {
    StepBasic_RatioMeasureWithUnit* _get_reference() {
    return (StepBasic_RatioMeasureWithUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_RatioMeasureWithUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_RatioMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_RatioUnit;
class StepBasic_RatioUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_RatioUnit;
		%feature("autodoc", "	* Returns a RatioUnit

	:rtype: None
") StepBasic_RatioUnit;
		 StepBasic_RatioUnit ();
};


%extend StepBasic_RatioUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_RatioUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_RatioUnit::Handle_StepBasic_RatioUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_RatioUnit;
class Handle_StepBasic_RatioUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_RatioUnit();
        Handle_StepBasic_RatioUnit(const Handle_StepBasic_RatioUnit &aHandle);
        Handle_StepBasic_RatioUnit(const StepBasic_RatioUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_RatioUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_RatioUnit {
    StepBasic_RatioUnit* _get_reference() {
    return (StepBasic_RatioUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_RatioUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_RatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnit;
class StepBasic_SiUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SiUnit;
		%feature("autodoc", "	* Returns a SiUnit

	:rtype: None
") StepBasic_SiUnit;
		 StepBasic_SiUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetPrefix;
		%feature("autodoc", "	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:rtype: None
") SetPrefix;
		void SetPrefix (const StepBasic_SiPrefix aPrefix);
		%feature("compactdefaultargs") UnSetPrefix;
		%feature("autodoc", "	:rtype: None
") UnSetPrefix;
		void UnSetPrefix ();
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "	:rtype: StepBasic_SiPrefix
") Prefix;
		StepBasic_SiPrefix Prefix ();
		%feature("compactdefaultargs") HasPrefix;
		%feature("autodoc", "	:rtype: bool
") HasPrefix;
		Standard_Boolean HasPrefix ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: None
") SetName;
		void SetName (const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: StepBasic_SiUnitName
") Name;
		StepBasic_SiUnitName Name ();
		%feature("compactdefaultargs") SetDimensions;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") SetDimensions;
		virtual void SetDimensions (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "	:rtype: Handle_StepBasic_DimensionalExponents
") Dimensions;
		virtual Handle_StepBasic_DimensionalExponents Dimensions ();
};


%extend StepBasic_SiUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SiUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SiUnit::Handle_StepBasic_SiUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SiUnit;
class Handle_StepBasic_SiUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_SiUnit();
        Handle_StepBasic_SiUnit(const Handle_StepBasic_SiUnit &aHandle);
        Handle_StepBasic_SiUnit(const StepBasic_SiUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SiUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnit {
    StepBasic_SiUnit* _get_reference() {
    return (StepBasic_SiUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SiUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SiUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SolidAngleMeasureWithUnit;
class StepBasic_SolidAngleMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SolidAngleMeasureWithUnit;
		%feature("autodoc", "	* Returns a SolidAngleMeasureWithUnit

	:rtype: None
") StepBasic_SolidAngleMeasureWithUnit;
		 StepBasic_SolidAngleMeasureWithUnit ();
};


%extend StepBasic_SolidAngleMeasureWithUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SolidAngleMeasureWithUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SolidAngleMeasureWithUnit::Handle_StepBasic_SolidAngleMeasureWithUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SolidAngleMeasureWithUnit;
class Handle_StepBasic_SolidAngleMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {

    public:
        // constructors
        Handle_StepBasic_SolidAngleMeasureWithUnit();
        Handle_StepBasic_SolidAngleMeasureWithUnit(const Handle_StepBasic_SolidAngleMeasureWithUnit &aHandle);
        Handle_StepBasic_SolidAngleMeasureWithUnit(const StepBasic_SolidAngleMeasureWithUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SolidAngleMeasureWithUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SolidAngleMeasureWithUnit {
    StepBasic_SolidAngleMeasureWithUnit* _get_reference() {
    return (StepBasic_SolidAngleMeasureWithUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SolidAngleMeasureWithUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SolidAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SolidAngleUnit;
class StepBasic_SolidAngleUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SolidAngleUnit;
		%feature("autodoc", "	* Returns a SolidAngleUnit

	:rtype: None
") StepBasic_SolidAngleUnit;
		 StepBasic_SolidAngleUnit ();
};


%extend StepBasic_SolidAngleUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SolidAngleUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SolidAngleUnit::Handle_StepBasic_SolidAngleUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SolidAngleUnit;
class Handle_StepBasic_SolidAngleUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_SolidAngleUnit();
        Handle_StepBasic_SolidAngleUnit(const Handle_StepBasic_SolidAngleUnit &aHandle);
        Handle_StepBasic_SolidAngleUnit(const StepBasic_SolidAngleUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SolidAngleUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SolidAngleUnit {
    StepBasic_SolidAngleUnit* _get_reference() {
    return (StepBasic_SolidAngleUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SolidAngleUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ThermodynamicTemperatureUnit;
class StepBasic_ThermodynamicTemperatureUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ThermodynamicTemperatureUnit;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ThermodynamicTemperatureUnit;
		 StepBasic_ThermodynamicTemperatureUnit ();
};


%extend StepBasic_ThermodynamicTemperatureUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ThermodynamicTemperatureUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ThermodynamicTemperatureUnit::Handle_StepBasic_ThermodynamicTemperatureUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ThermodynamicTemperatureUnit;
class Handle_StepBasic_ThermodynamicTemperatureUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_ThermodynamicTemperatureUnit();
        Handle_StepBasic_ThermodynamicTemperatureUnit(const Handle_StepBasic_ThermodynamicTemperatureUnit &aHandle);
        Handle_StepBasic_ThermodynamicTemperatureUnit(const StepBasic_ThermodynamicTemperatureUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ThermodynamicTemperatureUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ThermodynamicTemperatureUnit {
    StepBasic_ThermodynamicTemperatureUnit* _get_reference() {
    return (StepBasic_ThermodynamicTemperatureUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_ThermodynamicTemperatureUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ThermodynamicTemperatureUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_TimeMeasureWithUnit;
class StepBasic_TimeMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_TimeMeasureWithUnit;
		%feature("autodoc", "	* Returns a TimeMeasureWithUnit

	:rtype: None
") StepBasic_TimeMeasureWithUnit;
		 StepBasic_TimeMeasureWithUnit ();
};


%extend StepBasic_TimeMeasureWithUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_TimeMeasureWithUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_TimeMeasureWithUnit::Handle_StepBasic_TimeMeasureWithUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_TimeMeasureWithUnit;
class Handle_StepBasic_TimeMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {

    public:
        // constructors
        Handle_StepBasic_TimeMeasureWithUnit();
        Handle_StepBasic_TimeMeasureWithUnit(const Handle_StepBasic_TimeMeasureWithUnit &aHandle);
        Handle_StepBasic_TimeMeasureWithUnit(const StepBasic_TimeMeasureWithUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_TimeMeasureWithUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_TimeMeasureWithUnit {
    StepBasic_TimeMeasureWithUnit* _get_reference() {
    return (StepBasic_TimeMeasureWithUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_TimeMeasureWithUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_TimeMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_TimeUnit;
class StepBasic_TimeUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_TimeUnit;
		%feature("autodoc", "	* Returns a TimeUnit

	:rtype: None
") StepBasic_TimeUnit;
		 StepBasic_TimeUnit ();
};


%extend StepBasic_TimeUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_TimeUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_TimeUnit::Handle_StepBasic_TimeUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_TimeUnit;
class Handle_StepBasic_TimeUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_TimeUnit();
        Handle_StepBasic_TimeUnit(const Handle_StepBasic_TimeUnit &aHandle);
        Handle_StepBasic_TimeUnit(const StepBasic_TimeUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_TimeUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_TimeUnit {
    StepBasic_TimeUnit* _get_reference() {
    return (StepBasic_TimeUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_TimeUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_TimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_UncertaintyMeasureWithUnit;
class StepBasic_UncertaintyMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_UncertaintyMeasureWithUnit;
		%feature("autodoc", "	* Returns a UncertaintyMeasureWithUnit

	:rtype: None
") StepBasic_UncertaintyMeasureWithUnit;
		 StepBasic_UncertaintyMeasureWithUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aValueComponent:
	:type aValueComponent: Handle_StepBasic_MeasureValueMember &
	:param aUnitComponent:
	:type aUnitComponent: StepBasic_Unit &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_MeasureValueMember & aValueComponent,const StepBasic_Unit & aUnitComponent);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aValueComponent:
	:type aValueComponent: Handle_StepBasic_MeasureValueMember &
	:param aUnitComponent:
	:type aUnitComponent: StepBasic_Unit &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_MeasureValueMember & aValueComponent,const StepBasic_Unit & aUnitComponent,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
};


%extend StepBasic_UncertaintyMeasureWithUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_UncertaintyMeasureWithUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_UncertaintyMeasureWithUnit::Handle_StepBasic_UncertaintyMeasureWithUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_UncertaintyMeasureWithUnit;
class Handle_StepBasic_UncertaintyMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {

    public:
        // constructors
        Handle_StepBasic_UncertaintyMeasureWithUnit();
        Handle_StepBasic_UncertaintyMeasureWithUnit(const Handle_StepBasic_UncertaintyMeasureWithUnit &aHandle);
        Handle_StepBasic_UncertaintyMeasureWithUnit(const StepBasic_UncertaintyMeasureWithUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_UncertaintyMeasureWithUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_UncertaintyMeasureWithUnit {
    StepBasic_UncertaintyMeasureWithUnit* _get_reference() {
    return (StepBasic_UncertaintyMeasureWithUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_UncertaintyMeasureWithUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_UncertaintyMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_VolumeUnit;
class StepBasic_VolumeUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_VolumeUnit;
		%feature("autodoc", "	:rtype: None
") StepBasic_VolumeUnit;
		 StepBasic_VolumeUnit ();
};


%extend StepBasic_VolumeUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_VolumeUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_VolumeUnit::Handle_StepBasic_VolumeUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_VolumeUnit;
class Handle_StepBasic_VolumeUnit : public Handle_StepBasic_NamedUnit {

    public:
        // constructors
        Handle_StepBasic_VolumeUnit();
        Handle_StepBasic_VolumeUnit(const Handle_StepBasic_VolumeUnit &aHandle);
        Handle_StepBasic_VolumeUnit(const StepBasic_VolumeUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_VolumeUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_VolumeUnit {
    StepBasic_VolumeUnit* _get_reference() {
    return (StepBasic_VolumeUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_VolumeUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_VolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_WeekOfYearAndDayDate;
class StepBasic_WeekOfYearAndDayDate : public StepBasic_Date {
	public:
		%feature("compactdefaultargs") StepBasic_WeekOfYearAndDayDate;
		%feature("autodoc", "	* Returns a WeekOfYearAndDayDate

	:rtype: None
") StepBasic_WeekOfYearAndDayDate;
		 StepBasic_WeekOfYearAndDayDate ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Integer aYearComponent);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:param aWeekComponent:
	:type aWeekComponent: int
	:param hasAdayComponent:
	:type hasAdayComponent: bool
	:param aDayComponent:
	:type aDayComponent: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Integer aYearComponent,const Standard_Integer aWeekComponent,const Standard_Boolean hasAdayComponent,const Standard_Integer aDayComponent);
		%feature("compactdefaultargs") SetWeekComponent;
		%feature("autodoc", "	:param aWeekComponent:
	:type aWeekComponent: int
	:rtype: None
") SetWeekComponent;
		void SetWeekComponent (const Standard_Integer aWeekComponent);
		%feature("compactdefaultargs") WeekComponent;
		%feature("autodoc", "	:rtype: int
") WeekComponent;
		Standard_Integer WeekComponent ();
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "	:param aDayComponent:
	:type aDayComponent: int
	:rtype: None
") SetDayComponent;
		void SetDayComponent (const Standard_Integer aDayComponent);
		%feature("compactdefaultargs") UnSetDayComponent;
		%feature("autodoc", "	:rtype: None
") UnSetDayComponent;
		void UnSetDayComponent ();
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "	:rtype: int
") DayComponent;
		Standard_Integer DayComponent ();
		%feature("compactdefaultargs") HasDayComponent;
		%feature("autodoc", "	:rtype: bool
") HasDayComponent;
		Standard_Boolean HasDayComponent ();
};


%extend StepBasic_WeekOfYearAndDayDate {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_WeekOfYearAndDayDate(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_WeekOfYearAndDayDate::Handle_StepBasic_WeekOfYearAndDayDate %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_WeekOfYearAndDayDate;
class Handle_StepBasic_WeekOfYearAndDayDate : public Handle_StepBasic_Date {

    public:
        // constructors
        Handle_StepBasic_WeekOfYearAndDayDate();
        Handle_StepBasic_WeekOfYearAndDayDate(const Handle_StepBasic_WeekOfYearAndDayDate &aHandle);
        Handle_StepBasic_WeekOfYearAndDayDate(const StepBasic_WeekOfYearAndDayDate *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_WeekOfYearAndDayDate DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_WeekOfYearAndDayDate {
    StepBasic_WeekOfYearAndDayDate* _get_reference() {
    return (StepBasic_WeekOfYearAndDayDate*)$self->Access();
    }
};

%extend Handle_StepBasic_WeekOfYearAndDayDate {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_WeekOfYearAndDayDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndAreaUnit;
class StepBasic_ConversionBasedUnitAndAreaUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndAreaUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndAreaUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndAreaUnit;
		 StepBasic_ConversionBasedUnitAndAreaUnit ();
		%feature("compactdefaultargs") SetAreaUnit;
		%feature("autodoc", "	:param anAreaUnit:
	:type anAreaUnit: Handle_StepBasic_AreaUnit &
	:rtype: None
") SetAreaUnit;
		void SetAreaUnit (const Handle_StepBasic_AreaUnit & anAreaUnit);
		%feature("compactdefaultargs") AreaUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_AreaUnit
") AreaUnit;
		Handle_StepBasic_AreaUnit AreaUnit ();
};


%extend StepBasic_ConversionBasedUnitAndAreaUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ConversionBasedUnitAndAreaUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ConversionBasedUnitAndAreaUnit::Handle_StepBasic_ConversionBasedUnitAndAreaUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndAreaUnit;
class Handle_StepBasic_ConversionBasedUnitAndAreaUnit : public Handle_StepBasic_ConversionBasedUnit {

    public:
        // constructors
        Handle_StepBasic_ConversionBasedUnitAndAreaUnit();
        Handle_StepBasic_ConversionBasedUnitAndAreaUnit(const Handle_StepBasic_ConversionBasedUnitAndAreaUnit &aHandle);
        Handle_StepBasic_ConversionBasedUnitAndAreaUnit(const StepBasic_ConversionBasedUnitAndAreaUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ConversionBasedUnitAndAreaUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndAreaUnit {
    StepBasic_ConversionBasedUnitAndAreaUnit* _get_reference() {
    return (StepBasic_ConversionBasedUnitAndAreaUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_ConversionBasedUnitAndAreaUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ConversionBasedUnitAndAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndLengthUnit;
class StepBasic_ConversionBasedUnitAndLengthUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndLengthUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndLengthUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndLengthUnit;
		 StepBasic_ConversionBasedUnitAndLengthUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aConversionFactor:
	:type aConversionFactor: Handle_StepBasic_MeasureWithUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions,const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_MeasureWithUnit & aConversionFactor);
		%feature("compactdefaultargs") SetLengthUnit;
		%feature("autodoc", "	:param aLengthUnit:
	:type aLengthUnit: Handle_StepBasic_LengthUnit &
	:rtype: None
") SetLengthUnit;
		void SetLengthUnit (const Handle_StepBasic_LengthUnit & aLengthUnit);
		%feature("compactdefaultargs") LengthUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_LengthUnit
") LengthUnit;
		Handle_StepBasic_LengthUnit LengthUnit ();
};


%extend StepBasic_ConversionBasedUnitAndLengthUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ConversionBasedUnitAndLengthUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ConversionBasedUnitAndLengthUnit::Handle_StepBasic_ConversionBasedUnitAndLengthUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndLengthUnit;
class Handle_StepBasic_ConversionBasedUnitAndLengthUnit : public Handle_StepBasic_ConversionBasedUnit {

    public:
        // constructors
        Handle_StepBasic_ConversionBasedUnitAndLengthUnit();
        Handle_StepBasic_ConversionBasedUnitAndLengthUnit(const Handle_StepBasic_ConversionBasedUnitAndLengthUnit &aHandle);
        Handle_StepBasic_ConversionBasedUnitAndLengthUnit(const StepBasic_ConversionBasedUnitAndLengthUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ConversionBasedUnitAndLengthUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndLengthUnit {
    StepBasic_ConversionBasedUnitAndLengthUnit* _get_reference() {
    return (StepBasic_ConversionBasedUnitAndLengthUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_ConversionBasedUnitAndLengthUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ConversionBasedUnitAndLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndMassUnit;
class StepBasic_ConversionBasedUnitAndMassUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndMassUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndLengthUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndMassUnit;
		 StepBasic_ConversionBasedUnitAndMassUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aConversionFactor:
	:type aConversionFactor: Handle_StepBasic_MeasureWithUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions,const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_MeasureWithUnit & aConversionFactor);
		%feature("compactdefaultargs") SetMassUnit;
		%feature("autodoc", "	:param aMassUnit:
	:type aMassUnit: Handle_StepBasic_MassUnit &
	:rtype: None
") SetMassUnit;
		void SetMassUnit (const Handle_StepBasic_MassUnit & aMassUnit);
		%feature("compactdefaultargs") MassUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_MassUnit
") MassUnit;
		Handle_StepBasic_MassUnit MassUnit ();
};


%extend StepBasic_ConversionBasedUnitAndMassUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ConversionBasedUnitAndMassUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ConversionBasedUnitAndMassUnit::Handle_StepBasic_ConversionBasedUnitAndMassUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndMassUnit;
class Handle_StepBasic_ConversionBasedUnitAndMassUnit : public Handle_StepBasic_ConversionBasedUnit {

    public:
        // constructors
        Handle_StepBasic_ConversionBasedUnitAndMassUnit();
        Handle_StepBasic_ConversionBasedUnitAndMassUnit(const Handle_StepBasic_ConversionBasedUnitAndMassUnit &aHandle);
        Handle_StepBasic_ConversionBasedUnitAndMassUnit(const StepBasic_ConversionBasedUnitAndMassUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ConversionBasedUnitAndMassUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndMassUnit {
    StepBasic_ConversionBasedUnitAndMassUnit* _get_reference() {
    return (StepBasic_ConversionBasedUnitAndMassUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_ConversionBasedUnitAndMassUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ConversionBasedUnitAndMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
class StepBasic_ConversionBasedUnitAndPlaneAngleUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndPlaneAngleUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
		 StepBasic_ConversionBasedUnitAndPlaneAngleUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aConversionFactor:
	:type aConversionFactor: Handle_StepBasic_MeasureWithUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions,const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_MeasureWithUnit & aConversionFactor);
		%feature("compactdefaultargs") SetPlaneAngleUnit;
		%feature("autodoc", "	:param aPlaneAngleUnit:
	:type aPlaneAngleUnit: Handle_StepBasic_PlaneAngleUnit &
	:rtype: None
") SetPlaneAngleUnit;
		void SetPlaneAngleUnit (const Handle_StepBasic_PlaneAngleUnit & aPlaneAngleUnit);
		%feature("compactdefaultargs") PlaneAngleUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_PlaneAngleUnit
") PlaneAngleUnit;
		Handle_StepBasic_PlaneAngleUnit PlaneAngleUnit ();
};


%extend StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit::Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
class Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit : public Handle_StepBasic_ConversionBasedUnit {

    public:
        // constructors
        Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit();
        Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit(const Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit &aHandle);
        Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit(const StepBasic_ConversionBasedUnitAndPlaneAngleUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
    StepBasic_ConversionBasedUnitAndPlaneAngleUnit* _get_reference() {
    return (StepBasic_ConversionBasedUnitAndPlaneAngleUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndRatioUnit;
class StepBasic_ConversionBasedUnitAndRatioUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndRatioUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndRatioUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndRatioUnit;
		 StepBasic_ConversionBasedUnitAndRatioUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aConversionFactor:
	:type aConversionFactor: Handle_StepBasic_MeasureWithUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions,const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_MeasureWithUnit & aConversionFactor);
		%feature("compactdefaultargs") SetRatioUnit;
		%feature("autodoc", "	:param aRatioUnit:
	:type aRatioUnit: Handle_StepBasic_RatioUnit &
	:rtype: None
") SetRatioUnit;
		void SetRatioUnit (const Handle_StepBasic_RatioUnit & aRatioUnit);
		%feature("compactdefaultargs") RatioUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_RatioUnit
") RatioUnit;
		Handle_StepBasic_RatioUnit RatioUnit ();
};


%extend StepBasic_ConversionBasedUnitAndRatioUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ConversionBasedUnitAndRatioUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ConversionBasedUnitAndRatioUnit::Handle_StepBasic_ConversionBasedUnitAndRatioUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndRatioUnit;
class Handle_StepBasic_ConversionBasedUnitAndRatioUnit : public Handle_StepBasic_ConversionBasedUnit {

    public:
        // constructors
        Handle_StepBasic_ConversionBasedUnitAndRatioUnit();
        Handle_StepBasic_ConversionBasedUnitAndRatioUnit(const Handle_StepBasic_ConversionBasedUnitAndRatioUnit &aHandle);
        Handle_StepBasic_ConversionBasedUnitAndRatioUnit(const StepBasic_ConversionBasedUnitAndRatioUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ConversionBasedUnitAndRatioUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndRatioUnit {
    StepBasic_ConversionBasedUnitAndRatioUnit* _get_reference() {
    return (StepBasic_ConversionBasedUnitAndRatioUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_ConversionBasedUnitAndRatioUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ConversionBasedUnitAndRatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndSolidAngleUnit;
class StepBasic_ConversionBasedUnitAndSolidAngleUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndSolidAngleUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndSolidAngleUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndSolidAngleUnit;
		 StepBasic_ConversionBasedUnitAndSolidAngleUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aConversionFactor:
	:type aConversionFactor: Handle_StepBasic_MeasureWithUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions,const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_MeasureWithUnit & aConversionFactor);
		%feature("compactdefaultargs") SetSolidAngleUnit;
		%feature("autodoc", "	:param aSolidAngleUnit:
	:type aSolidAngleUnit: Handle_StepBasic_SolidAngleUnit &
	:rtype: None
") SetSolidAngleUnit;
		void SetSolidAngleUnit (const Handle_StepBasic_SolidAngleUnit & aSolidAngleUnit);
		%feature("compactdefaultargs") SolidAngleUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_SolidAngleUnit
") SolidAngleUnit;
		Handle_StepBasic_SolidAngleUnit SolidAngleUnit ();
};


%extend StepBasic_ConversionBasedUnitAndSolidAngleUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit::Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit;
class Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit : public Handle_StepBasic_ConversionBasedUnit {

    public:
        // constructors
        Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit();
        Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit(const Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit &aHandle);
        Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit(const StepBasic_ConversionBasedUnitAndSolidAngleUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit {
    StepBasic_ConversionBasedUnitAndSolidAngleUnit* _get_reference() {
    return (StepBasic_ConversionBasedUnitAndSolidAngleUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ConversionBasedUnitAndSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndTimeUnit;
class StepBasic_ConversionBasedUnitAndTimeUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndTimeUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndTimeUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndTimeUnit;
		 StepBasic_ConversionBasedUnitAndTimeUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aConversionFactor:
	:type aConversionFactor: Handle_StepBasic_MeasureWithUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions,const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_MeasureWithUnit & aConversionFactor);
		%feature("compactdefaultargs") SetTimeUnit;
		%feature("autodoc", "	:param aTimeUnit:
	:type aTimeUnit: Handle_StepBasic_TimeUnit &
	:rtype: None
") SetTimeUnit;
		void SetTimeUnit (const Handle_StepBasic_TimeUnit & aTimeUnit);
		%feature("compactdefaultargs") TimeUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_TimeUnit
") TimeUnit;
		Handle_StepBasic_TimeUnit TimeUnit ();
};


%extend StepBasic_ConversionBasedUnitAndTimeUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ConversionBasedUnitAndTimeUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ConversionBasedUnitAndTimeUnit::Handle_StepBasic_ConversionBasedUnitAndTimeUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndTimeUnit;
class Handle_StepBasic_ConversionBasedUnitAndTimeUnit : public Handle_StepBasic_ConversionBasedUnit {

    public:
        // constructors
        Handle_StepBasic_ConversionBasedUnitAndTimeUnit();
        Handle_StepBasic_ConversionBasedUnitAndTimeUnit(const Handle_StepBasic_ConversionBasedUnitAndTimeUnit &aHandle);
        Handle_StepBasic_ConversionBasedUnitAndTimeUnit(const StepBasic_ConversionBasedUnitAndTimeUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ConversionBasedUnitAndTimeUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndTimeUnit {
    StepBasic_ConversionBasedUnitAndTimeUnit* _get_reference() {
    return (StepBasic_ConversionBasedUnitAndTimeUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_ConversionBasedUnitAndTimeUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ConversionBasedUnitAndTimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndVolumeUnit;
class StepBasic_ConversionBasedUnitAndVolumeUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndVolumeUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndVolumeUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndVolumeUnit;
		 StepBasic_ConversionBasedUnitAndVolumeUnit ();
		%feature("compactdefaultargs") SetVolumeUnit;
		%feature("autodoc", "	:param aVolumeUnit:
	:type aVolumeUnit: Handle_StepBasic_VolumeUnit &
	:rtype: None
") SetVolumeUnit;
		void SetVolumeUnit (const Handle_StepBasic_VolumeUnit & aVolumeUnit);
		%feature("compactdefaultargs") VolumeUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_VolumeUnit
") VolumeUnit;
		Handle_StepBasic_VolumeUnit VolumeUnit ();
};


%extend StepBasic_ConversionBasedUnitAndVolumeUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ConversionBasedUnitAndVolumeUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ConversionBasedUnitAndVolumeUnit::Handle_StepBasic_ConversionBasedUnitAndVolumeUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndVolumeUnit;
class Handle_StepBasic_ConversionBasedUnitAndVolumeUnit : public Handle_StepBasic_ConversionBasedUnit {

    public:
        // constructors
        Handle_StepBasic_ConversionBasedUnitAndVolumeUnit();
        Handle_StepBasic_ConversionBasedUnitAndVolumeUnit(const Handle_StepBasic_ConversionBasedUnitAndVolumeUnit &aHandle);
        Handle_StepBasic_ConversionBasedUnitAndVolumeUnit(const StepBasic_ConversionBasedUnitAndVolumeUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ConversionBasedUnitAndVolumeUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndVolumeUnit {
    StepBasic_ConversionBasedUnitAndVolumeUnit* _get_reference() {
    return (StepBasic_ConversionBasedUnitAndVolumeUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_ConversionBasedUnitAndVolumeUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ConversionBasedUnitAndVolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DesignContext;
class StepBasic_DesignContext : public StepBasic_ProductDefinitionContext {
	public:
		%feature("compactdefaultargs") StepBasic_DesignContext;
		%feature("autodoc", "	:rtype: None
") StepBasic_DesignContext;
		 StepBasic_DesignContext ();
};


%extend StepBasic_DesignContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_DesignContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_DesignContext::Handle_StepBasic_DesignContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_DesignContext;
class Handle_StepBasic_DesignContext : public Handle_StepBasic_ProductDefinitionContext {

    public:
        // constructors
        Handle_StepBasic_DesignContext();
        Handle_StepBasic_DesignContext(const Handle_StepBasic_DesignContext &aHandle);
        Handle_StepBasic_DesignContext(const StepBasic_DesignContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_DesignContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DesignContext {
    StepBasic_DesignContext* _get_reference() {
    return (StepBasic_DesignContext*)$self->Access();
    }
};

%extend Handle_StepBasic_DesignContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_DesignContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_MechanicalContext;
class StepBasic_MechanicalContext : public StepBasic_ProductContext {
	public:
		%feature("compactdefaultargs") StepBasic_MechanicalContext;
		%feature("autodoc", "	* Returns a MechanicalContext

	:rtype: None
") StepBasic_MechanicalContext;
		 StepBasic_MechanicalContext ();
};


%extend StepBasic_MechanicalContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_MechanicalContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_MechanicalContext::Handle_StepBasic_MechanicalContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_MechanicalContext;
class Handle_StepBasic_MechanicalContext : public Handle_StepBasic_ProductContext {

    public:
        // constructors
        Handle_StepBasic_MechanicalContext();
        Handle_StepBasic_MechanicalContext(const Handle_StepBasic_MechanicalContext &aHandle);
        Handle_StepBasic_MechanicalContext(const StepBasic_MechanicalContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_MechanicalContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_MechanicalContext {
    StepBasic_MechanicalContext* _get_reference() {
    return (StepBasic_MechanicalContext*)$self->Access();
    }
};

%extend Handle_StepBasic_MechanicalContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_MechanicalContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductType;
class StepBasic_ProductType : public StepBasic_ProductRelatedProductCategory {
	public:
		%feature("compactdefaultargs") StepBasic_ProductType;
		%feature("autodoc", "	* Returns a ProductType

	:rtype: None
") StepBasic_ProductType;
		 StepBasic_ProductType ();
};


%extend StepBasic_ProductType {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_ProductType(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_ProductType::Handle_StepBasic_ProductType %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_ProductType;
class Handle_StepBasic_ProductType : public Handle_StepBasic_ProductRelatedProductCategory {

    public:
        // constructors
        Handle_StepBasic_ProductType();
        Handle_StepBasic_ProductType(const Handle_StepBasic_ProductType &aHandle);
        Handle_StepBasic_ProductType(const StepBasic_ProductType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_ProductType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductType {
    StepBasic_ProductType* _get_reference() {
    return (StepBasic_ProductType*)$self->Access();
    }
};

%extend Handle_StepBasic_ProductType {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_ProductType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndAreaUnit;
class StepBasic_SiUnitAndAreaUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SiUnitAndAreaUnit;
		%feature("autodoc", "	* Returns a SiUnitAndAreaUnit

	:rtype: None
") StepBasic_SiUnitAndAreaUnit;
		 StepBasic_SiUnitAndAreaUnit ();
		%feature("compactdefaultargs") SetAreaUnit;
		%feature("autodoc", "	:param anAreaUnit:
	:type anAreaUnit: Handle_StepBasic_AreaUnit &
	:rtype: None
") SetAreaUnit;
		void SetAreaUnit (const Handle_StepBasic_AreaUnit & anAreaUnit);
		%feature("compactdefaultargs") AreaUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_AreaUnit
") AreaUnit;
		Handle_StepBasic_AreaUnit AreaUnit ();
		%feature("compactdefaultargs") SetDimensions;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") SetDimensions;
		virtual void SetDimensions (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "	:rtype: Handle_StepBasic_DimensionalExponents
") Dimensions;
		virtual Handle_StepBasic_DimensionalExponents Dimensions ();
};


%extend StepBasic_SiUnitAndAreaUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SiUnitAndAreaUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SiUnitAndAreaUnit::Handle_StepBasic_SiUnitAndAreaUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SiUnitAndAreaUnit;
class Handle_StepBasic_SiUnitAndAreaUnit : public Handle_StepBasic_SiUnit {

    public:
        // constructors
        Handle_StepBasic_SiUnitAndAreaUnit();
        Handle_StepBasic_SiUnitAndAreaUnit(const Handle_StepBasic_SiUnitAndAreaUnit &aHandle);
        Handle_StepBasic_SiUnitAndAreaUnit(const StepBasic_SiUnitAndAreaUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SiUnitAndAreaUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndAreaUnit {
    StepBasic_SiUnitAndAreaUnit* _get_reference() {
    return (StepBasic_SiUnitAndAreaUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SiUnitAndAreaUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SiUnitAndAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndLengthUnit;
class StepBasic_SiUnitAndLengthUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SiUnitAndLengthUnit;
		%feature("autodoc", "	* Returns a SiUnitAndLengthUnit

	:rtype: None
") StepBasic_SiUnitAndLengthUnit;
		 StepBasic_SiUnitAndLengthUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetLengthUnit;
		%feature("autodoc", "	:param aLengthUnit:
	:type aLengthUnit: Handle_StepBasic_LengthUnit &
	:rtype: None
") SetLengthUnit;
		void SetLengthUnit (const Handle_StepBasic_LengthUnit & aLengthUnit);
		%feature("compactdefaultargs") LengthUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_LengthUnit
") LengthUnit;
		Handle_StepBasic_LengthUnit LengthUnit ();
};


%extend StepBasic_SiUnitAndLengthUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SiUnitAndLengthUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SiUnitAndLengthUnit::Handle_StepBasic_SiUnitAndLengthUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SiUnitAndLengthUnit;
class Handle_StepBasic_SiUnitAndLengthUnit : public Handle_StepBasic_SiUnit {

    public:
        // constructors
        Handle_StepBasic_SiUnitAndLengthUnit();
        Handle_StepBasic_SiUnitAndLengthUnit(const Handle_StepBasic_SiUnitAndLengthUnit &aHandle);
        Handle_StepBasic_SiUnitAndLengthUnit(const StepBasic_SiUnitAndLengthUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SiUnitAndLengthUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndLengthUnit {
    StepBasic_SiUnitAndLengthUnit* _get_reference() {
    return (StepBasic_SiUnitAndLengthUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SiUnitAndLengthUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SiUnitAndLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndMassUnit;
class StepBasic_SiUnitAndMassUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SiUnitAndMassUnit;
		%feature("autodoc", "	* Returns a SiUnitAndMassUnit

	:rtype: None
") StepBasic_SiUnitAndMassUnit;
		 StepBasic_SiUnitAndMassUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetMassUnit;
		%feature("autodoc", "	:param aMassUnit:
	:type aMassUnit: Handle_StepBasic_MassUnit &
	:rtype: None
") SetMassUnit;
		void SetMassUnit (const Handle_StepBasic_MassUnit & aMassUnit);
		%feature("compactdefaultargs") MassUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_MassUnit
") MassUnit;
		Handle_StepBasic_MassUnit MassUnit ();
};


%extend StepBasic_SiUnitAndMassUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SiUnitAndMassUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SiUnitAndMassUnit::Handle_StepBasic_SiUnitAndMassUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SiUnitAndMassUnit;
class Handle_StepBasic_SiUnitAndMassUnit : public Handle_StepBasic_SiUnit {

    public:
        // constructors
        Handle_StepBasic_SiUnitAndMassUnit();
        Handle_StepBasic_SiUnitAndMassUnit(const Handle_StepBasic_SiUnitAndMassUnit &aHandle);
        Handle_StepBasic_SiUnitAndMassUnit(const StepBasic_SiUnitAndMassUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SiUnitAndMassUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndMassUnit {
    StepBasic_SiUnitAndMassUnit* _get_reference() {
    return (StepBasic_SiUnitAndMassUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SiUnitAndMassUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SiUnitAndMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndPlaneAngleUnit;
class StepBasic_SiUnitAndPlaneAngleUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SiUnitAndPlaneAngleUnit;
		%feature("autodoc", "	* Returns a SiUnitAndPlaneAngleUnit

	:rtype: None
") StepBasic_SiUnitAndPlaneAngleUnit;
		 StepBasic_SiUnitAndPlaneAngleUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetPlaneAngleUnit;
		%feature("autodoc", "	:param aPlaneAngleUnit:
	:type aPlaneAngleUnit: Handle_StepBasic_PlaneAngleUnit &
	:rtype: None
") SetPlaneAngleUnit;
		void SetPlaneAngleUnit (const Handle_StepBasic_PlaneAngleUnit & aPlaneAngleUnit);
		%feature("compactdefaultargs") PlaneAngleUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_PlaneAngleUnit
") PlaneAngleUnit;
		Handle_StepBasic_PlaneAngleUnit PlaneAngleUnit ();
};


%extend StepBasic_SiUnitAndPlaneAngleUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SiUnitAndPlaneAngleUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SiUnitAndPlaneAngleUnit::Handle_StepBasic_SiUnitAndPlaneAngleUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SiUnitAndPlaneAngleUnit;
class Handle_StepBasic_SiUnitAndPlaneAngleUnit : public Handle_StepBasic_SiUnit {

    public:
        // constructors
        Handle_StepBasic_SiUnitAndPlaneAngleUnit();
        Handle_StepBasic_SiUnitAndPlaneAngleUnit(const Handle_StepBasic_SiUnitAndPlaneAngleUnit &aHandle);
        Handle_StepBasic_SiUnitAndPlaneAngleUnit(const StepBasic_SiUnitAndPlaneAngleUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SiUnitAndPlaneAngleUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndPlaneAngleUnit {
    StepBasic_SiUnitAndPlaneAngleUnit* _get_reference() {
    return (StepBasic_SiUnitAndPlaneAngleUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SiUnitAndPlaneAngleUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SiUnitAndPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndRatioUnit;
class StepBasic_SiUnitAndRatioUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SiUnitAndRatioUnit;
		%feature("autodoc", "	* Returns a SiUnitAndRatioUnit

	:rtype: None
") StepBasic_SiUnitAndRatioUnit;
		 StepBasic_SiUnitAndRatioUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetRatioUnit;
		%feature("autodoc", "	:param aRatioUnit:
	:type aRatioUnit: Handle_StepBasic_RatioUnit &
	:rtype: None
") SetRatioUnit;
		void SetRatioUnit (const Handle_StepBasic_RatioUnit & aRatioUnit);
		%feature("compactdefaultargs") RatioUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_RatioUnit
") RatioUnit;
		Handle_StepBasic_RatioUnit RatioUnit ();
};


%extend StepBasic_SiUnitAndRatioUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SiUnitAndRatioUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SiUnitAndRatioUnit::Handle_StepBasic_SiUnitAndRatioUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SiUnitAndRatioUnit;
class Handle_StepBasic_SiUnitAndRatioUnit : public Handle_StepBasic_SiUnit {

    public:
        // constructors
        Handle_StepBasic_SiUnitAndRatioUnit();
        Handle_StepBasic_SiUnitAndRatioUnit(const Handle_StepBasic_SiUnitAndRatioUnit &aHandle);
        Handle_StepBasic_SiUnitAndRatioUnit(const StepBasic_SiUnitAndRatioUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SiUnitAndRatioUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndRatioUnit {
    StepBasic_SiUnitAndRatioUnit* _get_reference() {
    return (StepBasic_SiUnitAndRatioUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SiUnitAndRatioUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SiUnitAndRatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndSolidAngleUnit;
class StepBasic_SiUnitAndSolidAngleUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SiUnitAndSolidAngleUnit;
		%feature("autodoc", "	* Returns a SiUnitAndSolidAngleUnit

	:rtype: None
") StepBasic_SiUnitAndSolidAngleUnit;
		 StepBasic_SiUnitAndSolidAngleUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetSolidAngleUnit;
		%feature("autodoc", "	:param aSolidAngleUnit:
	:type aSolidAngleUnit: Handle_StepBasic_SolidAngleUnit &
	:rtype: None
") SetSolidAngleUnit;
		void SetSolidAngleUnit (const Handle_StepBasic_SolidAngleUnit & aSolidAngleUnit);
		%feature("compactdefaultargs") SolidAngleUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_SolidAngleUnit
") SolidAngleUnit;
		Handle_StepBasic_SolidAngleUnit SolidAngleUnit ();
};


%extend StepBasic_SiUnitAndSolidAngleUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SiUnitAndSolidAngleUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SiUnitAndSolidAngleUnit::Handle_StepBasic_SiUnitAndSolidAngleUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SiUnitAndSolidAngleUnit;
class Handle_StepBasic_SiUnitAndSolidAngleUnit : public Handle_StepBasic_SiUnit {

    public:
        // constructors
        Handle_StepBasic_SiUnitAndSolidAngleUnit();
        Handle_StepBasic_SiUnitAndSolidAngleUnit(const Handle_StepBasic_SiUnitAndSolidAngleUnit &aHandle);
        Handle_StepBasic_SiUnitAndSolidAngleUnit(const StepBasic_SiUnitAndSolidAngleUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SiUnitAndSolidAngleUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndSolidAngleUnit {
    StepBasic_SiUnitAndSolidAngleUnit* _get_reference() {
    return (StepBasic_SiUnitAndSolidAngleUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SiUnitAndSolidAngleUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SiUnitAndSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndThermodynamicTemperatureUnit;
class StepBasic_SiUnitAndThermodynamicTemperatureUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SiUnitAndThermodynamicTemperatureUnit;
		%feature("autodoc", "	* Returns a SiUnitAndThermodynamicTemperatureUnit

	:rtype: None
") StepBasic_SiUnitAndThermodynamicTemperatureUnit;
		 StepBasic_SiUnitAndThermodynamicTemperatureUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetThermodynamicTemperatureUnit;
		%feature("autodoc", "	:param aThermodynamicTemperatureUnit:
	:type aThermodynamicTemperatureUnit: Handle_StepBasic_ThermodynamicTemperatureUnit &
	:rtype: None
") SetThermodynamicTemperatureUnit;
		void SetThermodynamicTemperatureUnit (const Handle_StepBasic_ThermodynamicTemperatureUnit & aThermodynamicTemperatureUnit);
		%feature("compactdefaultargs") ThermodynamicTemperatureUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ThermodynamicTemperatureUnit
") ThermodynamicTemperatureUnit;
		Handle_StepBasic_ThermodynamicTemperatureUnit ThermodynamicTemperatureUnit ();
};


%extend StepBasic_SiUnitAndThermodynamicTemperatureUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit::Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit;
class Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit : public Handle_StepBasic_SiUnit {

    public:
        // constructors
        Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit();
        Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit(const Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit &aHandle);
        Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit(const StepBasic_SiUnitAndThermodynamicTemperatureUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit {
    StepBasic_SiUnitAndThermodynamicTemperatureUnit* _get_reference() {
    return (StepBasic_SiUnitAndThermodynamicTemperatureUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SiUnitAndThermodynamicTemperatureUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndTimeUnit;
class StepBasic_SiUnitAndTimeUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SiUnitAndTimeUnit;
		%feature("autodoc", "	* Returns a SiUnitAndTimeUnit

	:rtype: None
") StepBasic_SiUnitAndTimeUnit;
		 StepBasic_SiUnitAndTimeUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: void
") Init;
		virtual void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetTimeUnit;
		%feature("autodoc", "	:param aTimeUnit:
	:type aTimeUnit: Handle_StepBasic_TimeUnit &
	:rtype: None
") SetTimeUnit;
		void SetTimeUnit (const Handle_StepBasic_TimeUnit & aTimeUnit);
		%feature("compactdefaultargs") TimeUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_TimeUnit
") TimeUnit;
		Handle_StepBasic_TimeUnit TimeUnit ();
};


%extend StepBasic_SiUnitAndTimeUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SiUnitAndTimeUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SiUnitAndTimeUnit::Handle_StepBasic_SiUnitAndTimeUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SiUnitAndTimeUnit;
class Handle_StepBasic_SiUnitAndTimeUnit : public Handle_StepBasic_SiUnit {

    public:
        // constructors
        Handle_StepBasic_SiUnitAndTimeUnit();
        Handle_StepBasic_SiUnitAndTimeUnit(const Handle_StepBasic_SiUnitAndTimeUnit &aHandle);
        Handle_StepBasic_SiUnitAndTimeUnit(const StepBasic_SiUnitAndTimeUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SiUnitAndTimeUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndTimeUnit {
    StepBasic_SiUnitAndTimeUnit* _get_reference() {
    return (StepBasic_SiUnitAndTimeUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SiUnitAndTimeUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SiUnitAndTimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndVolumeUnit;
class StepBasic_SiUnitAndVolumeUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SiUnitAndVolumeUnit;
		%feature("autodoc", "	* Returns a SiUnitAndVolumeUnit

	:rtype: None
") StepBasic_SiUnitAndVolumeUnit;
		 StepBasic_SiUnitAndVolumeUnit ();
		%feature("compactdefaultargs") SetVolumeUnit;
		%feature("autodoc", "	:param aVolumeUnit:
	:type aVolumeUnit: Handle_StepBasic_VolumeUnit &
	:rtype: None
") SetVolumeUnit;
		void SetVolumeUnit (const Handle_StepBasic_VolumeUnit & aVolumeUnit);
		%feature("compactdefaultargs") VolumeUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_VolumeUnit
") VolumeUnit;
		Handle_StepBasic_VolumeUnit VolumeUnit ();
		%feature("compactdefaultargs") SetDimensions;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: Handle_StepBasic_DimensionalExponents &
	:rtype: void
") SetDimensions;
		virtual void SetDimensions (const Handle_StepBasic_DimensionalExponents & aDimensions);
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "	:rtype: Handle_StepBasic_DimensionalExponents
") Dimensions;
		virtual Handle_StepBasic_DimensionalExponents Dimensions ();
};


%extend StepBasic_SiUnitAndVolumeUnit {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepBasic_SiUnitAndVolumeUnit(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepBasic_SiUnitAndVolumeUnit::Handle_StepBasic_SiUnitAndVolumeUnit %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepBasic_SiUnitAndVolumeUnit;
class Handle_StepBasic_SiUnitAndVolumeUnit : public Handle_StepBasic_SiUnit {

    public:
        // constructors
        Handle_StepBasic_SiUnitAndVolumeUnit();
        Handle_StepBasic_SiUnitAndVolumeUnit(const Handle_StepBasic_SiUnitAndVolumeUnit &aHandle);
        Handle_StepBasic_SiUnitAndVolumeUnit(const StepBasic_SiUnitAndVolumeUnit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepBasic_SiUnitAndVolumeUnit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndVolumeUnit {
    StepBasic_SiUnitAndVolumeUnit* _get_reference() {
    return (StepBasic_SiUnitAndVolumeUnit*)$self->Access();
    }
};

%extend Handle_StepBasic_SiUnitAndVolumeUnit {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepBasic_SiUnitAndVolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
