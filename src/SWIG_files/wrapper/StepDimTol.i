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
%module (package="OCC") StepDimTol

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


%include StepDimTol_headers.i


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
enum StepDimTol_LimitCondition {
	StepDimTol_MaximumMaterialCondition = 0,
	StepDimTol_LeastMaterialCondition = 1,
	StepDimTol_RegardlessOfFeatureSize = 2,
};

/* end public enums declaration */

%nodefaultctor StepDimTol_Array1OfDatumReference;
class StepDimTol_Array1OfDatumReference {
	public:
		%feature("compactdefaultargs") StepDimTol_Array1OfDatumReference;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepDimTol_Array1OfDatumReference;
		 StepDimTol_Array1OfDatumReference (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepDimTol_Array1OfDatumReference;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepDimTol_DatumReference &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepDimTol_Array1OfDatumReference;
		 StepDimTol_Array1OfDatumReference (const Handle_StepDimTol_DatumReference & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepDimTol_DatumReference &
	:rtype: None
") Init;
		void Init (const Handle_StepDimTol_DatumReference & V);
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
	:type Other: StepDimTol_Array1OfDatumReference &
	:rtype: StepDimTol_Array1OfDatumReference
") Assign;
		const StepDimTol_Array1OfDatumReference & Assign (const StepDimTol_Array1OfDatumReference & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepDimTol_Array1OfDatumReference &
	:rtype: StepDimTol_Array1OfDatumReference
") operator =;
		const StepDimTol_Array1OfDatumReference & operator = (const StepDimTol_Array1OfDatumReference & Other);
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
	:type Value: Handle_StepDimTol_DatumReference &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepDimTol_DatumReference & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepDimTol_DatumReference
") Value;
		Handle_StepDimTol_DatumReference Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepDimTol_DatumReference
") ChangeValue;
		Handle_StepDimTol_DatumReference ChangeValue (const Standard_Integer Index);
};


%extend StepDimTol_Array1OfDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_CommonDatum;
class StepDimTol_CommonDatum : public StepRepr_CompositeShapeAspect {
	public:
		%feature("compactdefaultargs") StepDimTol_CommonDatum;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_CommonDatum;
		 StepDimTol_CommonDatum ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aShapeAspect_Name:
	:type aShapeAspect_Name: Handle_TCollection_HAsciiString &
	:param aShapeAspect_Description:
	:type aShapeAspect_Description: Handle_TCollection_HAsciiString &
	:param aShapeAspect_OfShape:
	:type aShapeAspect_OfShape: Handle_StepRepr_ProductDefinitionShape &
	:param aShapeAspect_ProductDefinitional:
	:type aShapeAspect_ProductDefinitional: StepData_Logical
	:param aDatum_Name:
	:type aDatum_Name: Handle_TCollection_HAsciiString &
	:param aDatum_Description:
	:type aDatum_Description: Handle_TCollection_HAsciiString &
	:param aDatum_OfShape:
	:type aDatum_OfShape: Handle_StepRepr_ProductDefinitionShape &
	:param aDatum_ProductDefinitional:
	:type aDatum_ProductDefinitional: StepData_Logical
	:param aDatum_Identification:
	:type aDatum_Identification: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aShapeAspect_Name,const Handle_TCollection_HAsciiString & aShapeAspect_Description,const Handle_StepRepr_ProductDefinitionShape & aShapeAspect_OfShape,const StepData_Logical aShapeAspect_ProductDefinitional,const Handle_TCollection_HAsciiString & aDatum_Name,const Handle_TCollection_HAsciiString & aDatum_Description,const Handle_StepRepr_ProductDefinitionShape & aDatum_OfShape,const StepData_Logical aDatum_ProductDefinitional,const Handle_TCollection_HAsciiString & aDatum_Identification);
		%feature("compactdefaultargs") Datum;
		%feature("autodoc", "	* Returns data for supertype Datum

	:rtype: Handle_StepDimTol_Datum
") Datum;
		Handle_StepDimTol_Datum Datum ();
		%feature("compactdefaultargs") SetDatum;
		%feature("autodoc", "	* Set data for supertype Datum

	:param Datum:
	:type Datum: Handle_StepDimTol_Datum &
	:rtype: None
") SetDatum;
		void SetDatum (const Handle_StepDimTol_Datum & Datum);
};


%extend StepDimTol_CommonDatum {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_CommonDatum(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_CommonDatum::Handle_StepDimTol_CommonDatum %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_CommonDatum;
class Handle_StepDimTol_CommonDatum : public Handle_StepRepr_CompositeShapeAspect {

    public:
        // constructors
        Handle_StepDimTol_CommonDatum();
        Handle_StepDimTol_CommonDatum(const Handle_StepDimTol_CommonDatum &aHandle);
        Handle_StepDimTol_CommonDatum(const StepDimTol_CommonDatum *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_CommonDatum DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_CommonDatum {
    StepDimTol_CommonDatum* _get_reference() {
    return (StepDimTol_CommonDatum*)$self->Access();
    }
};

%extend Handle_StepDimTol_CommonDatum {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_CommonDatum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_Datum;
class StepDimTol_Datum : public StepRepr_ShapeAspect {
	public:
		%feature("compactdefaultargs") StepDimTol_Datum;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_Datum;
		 StepDimTol_Datum ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aShapeAspect_Name:
	:type aShapeAspect_Name: Handle_TCollection_HAsciiString &
	:param aShapeAspect_Description:
	:type aShapeAspect_Description: Handle_TCollection_HAsciiString &
	:param aShapeAspect_OfShape:
	:type aShapeAspect_OfShape: Handle_StepRepr_ProductDefinitionShape &
	:param aShapeAspect_ProductDefinitional:
	:type aShapeAspect_ProductDefinitional: StepData_Logical
	:param aIdentification:
	:type aIdentification: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aShapeAspect_Name,const Handle_TCollection_HAsciiString & aShapeAspect_Description,const Handle_StepRepr_ProductDefinitionShape & aShapeAspect_OfShape,const StepData_Logical aShapeAspect_ProductDefinitional,const Handle_TCollection_HAsciiString & aIdentification);
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns field Identification

	:rtype: Handle_TCollection_HAsciiString
") Identification;
		Handle_TCollection_HAsciiString Identification ();
		%feature("compactdefaultargs") SetIdentification;
		%feature("autodoc", "	* Set field Identification

	:param Identification:
	:type Identification: Handle_TCollection_HAsciiString &
	:rtype: None
") SetIdentification;
		void SetIdentification (const Handle_TCollection_HAsciiString & Identification);
};


%extend StepDimTol_Datum {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_Datum(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_Datum::Handle_StepDimTol_Datum %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_Datum;
class Handle_StepDimTol_Datum : public Handle_StepRepr_ShapeAspect {

    public:
        // constructors
        Handle_StepDimTol_Datum();
        Handle_StepDimTol_Datum(const Handle_StepDimTol_Datum &aHandle);
        Handle_StepDimTol_Datum(const StepDimTol_Datum *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_Datum DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_Datum {
    StepDimTol_Datum* _get_reference() {
    return (StepDimTol_Datum*)$self->Access();
    }
};

%extend Handle_StepDimTol_Datum {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_Datum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_DatumFeature;
class StepDimTol_DatumFeature : public StepRepr_ShapeAspect {
	public:
		%feature("compactdefaultargs") StepDimTol_DatumFeature;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_DatumFeature;
		 StepDimTol_DatumFeature ();
};


%extend StepDimTol_DatumFeature {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_DatumFeature(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_DatumFeature::Handle_StepDimTol_DatumFeature %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_DatumFeature;
class Handle_StepDimTol_DatumFeature : public Handle_StepRepr_ShapeAspect {

    public:
        // constructors
        Handle_StepDimTol_DatumFeature();
        Handle_StepDimTol_DatumFeature(const Handle_StepDimTol_DatumFeature &aHandle);
        Handle_StepDimTol_DatumFeature(const StepDimTol_DatumFeature *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_DatumFeature DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_DatumFeature {
    StepDimTol_DatumFeature* _get_reference() {
    return (StepDimTol_DatumFeature*)$self->Access();
    }
};

%extend Handle_StepDimTol_DatumFeature {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_DatumFeature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_DatumReference;
class StepDimTol_DatumReference : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepDimTol_DatumReference;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_DatumReference;
		 StepDimTol_DatumReference ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aPrecedence:
	:type aPrecedence: int
	:param aReferencedDatum:
	:type aReferencedDatum: Handle_StepDimTol_Datum &
	:rtype: None
") Init;
		void Init (const Standard_Integer aPrecedence,const Handle_StepDimTol_Datum & aReferencedDatum);
		%feature("compactdefaultargs") Precedence;
		%feature("autodoc", "	* Returns field Precedence

	:rtype: int
") Precedence;
		Standard_Integer Precedence ();
		%feature("compactdefaultargs") SetPrecedence;
		%feature("autodoc", "	* Set field Precedence

	:param Precedence:
	:type Precedence: int
	:rtype: None
") SetPrecedence;
		void SetPrecedence (const Standard_Integer Precedence);
		%feature("compactdefaultargs") ReferencedDatum;
		%feature("autodoc", "	* Returns field ReferencedDatum

	:rtype: Handle_StepDimTol_Datum
") ReferencedDatum;
		Handle_StepDimTol_Datum ReferencedDatum ();
		%feature("compactdefaultargs") SetReferencedDatum;
		%feature("autodoc", "	* Set field ReferencedDatum

	:param ReferencedDatum:
	:type ReferencedDatum: Handle_StepDimTol_Datum &
	:rtype: None
") SetReferencedDatum;
		void SetReferencedDatum (const Handle_StepDimTol_Datum & ReferencedDatum);
};


%extend StepDimTol_DatumReference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_DatumReference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_DatumReference::Handle_StepDimTol_DatumReference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_DatumReference;
class Handle_StepDimTol_DatumReference : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepDimTol_DatumReference();
        Handle_StepDimTol_DatumReference(const Handle_StepDimTol_DatumReference &aHandle);
        Handle_StepDimTol_DatumReference(const StepDimTol_DatumReference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_DatumReference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_DatumReference {
    StepDimTol_DatumReference* _get_reference() {
    return (StepDimTol_DatumReference*)$self->Access();
    }
};

%extend Handle_StepDimTol_DatumReference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_DatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_DatumTarget;
class StepDimTol_DatumTarget : public StepRepr_ShapeAspect {
	public:
		%feature("compactdefaultargs") StepDimTol_DatumTarget;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_DatumTarget;
		 StepDimTol_DatumTarget ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aShapeAspect_Name:
	:type aShapeAspect_Name: Handle_TCollection_HAsciiString &
	:param aShapeAspect_Description:
	:type aShapeAspect_Description: Handle_TCollection_HAsciiString &
	:param aShapeAspect_OfShape:
	:type aShapeAspect_OfShape: Handle_StepRepr_ProductDefinitionShape &
	:param aShapeAspect_ProductDefinitional:
	:type aShapeAspect_ProductDefinitional: StepData_Logical
	:param aTargetId:
	:type aTargetId: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aShapeAspect_Name,const Handle_TCollection_HAsciiString & aShapeAspect_Description,const Handle_StepRepr_ProductDefinitionShape & aShapeAspect_OfShape,const StepData_Logical aShapeAspect_ProductDefinitional,const Handle_TCollection_HAsciiString & aTargetId);
		%feature("compactdefaultargs") TargetId;
		%feature("autodoc", "	* Returns field TargetId

	:rtype: Handle_TCollection_HAsciiString
") TargetId;
		Handle_TCollection_HAsciiString TargetId ();
		%feature("compactdefaultargs") SetTargetId;
		%feature("autodoc", "	* Set field TargetId

	:param TargetId:
	:type TargetId: Handle_TCollection_HAsciiString &
	:rtype: None
") SetTargetId;
		void SetTargetId (const Handle_TCollection_HAsciiString & TargetId);
};


%extend StepDimTol_DatumTarget {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_DatumTarget(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_DatumTarget::Handle_StepDimTol_DatumTarget %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_DatumTarget;
class Handle_StepDimTol_DatumTarget : public Handle_StepRepr_ShapeAspect {

    public:
        // constructors
        Handle_StepDimTol_DatumTarget();
        Handle_StepDimTol_DatumTarget(const Handle_StepDimTol_DatumTarget &aHandle);
        Handle_StepDimTol_DatumTarget(const StepDimTol_DatumTarget *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_DatumTarget DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_DatumTarget {
    StepDimTol_DatumTarget* _get_reference() {
    return (StepDimTol_DatumTarget*)$self->Access();
    }
};

%extend Handle_StepDimTol_DatumTarget {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_DatumTarget {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_GeometricTolerance;
class StepDimTol_GeometricTolerance : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepDimTol_GeometricTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_GeometricTolerance;
		 StepDimTol_GeometricTolerance ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aMagnitude:
	:type aMagnitude: Handle_StepBasic_MeasureWithUnit &
	:param aTolerancedShapeAspect:
	:type aTolerancedShapeAspect: Handle_StepRepr_ShapeAspect &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_MeasureWithUnit & aMagnitude,const Handle_StepRepr_ShapeAspect & aTolerancedShapeAspect);
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
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "	* Returns field Magnitude

	:rtype: Handle_StepBasic_MeasureWithUnit
") Magnitude;
		Handle_StepBasic_MeasureWithUnit Magnitude ();
		%feature("compactdefaultargs") SetMagnitude;
		%feature("autodoc", "	* Set field Magnitude

	:param Magnitude:
	:type Magnitude: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") SetMagnitude;
		void SetMagnitude (const Handle_StepBasic_MeasureWithUnit & Magnitude);
		%feature("compactdefaultargs") TolerancedShapeAspect;
		%feature("autodoc", "	* Returns field TolerancedShapeAspect

	:rtype: Handle_StepRepr_ShapeAspect
") TolerancedShapeAspect;
		Handle_StepRepr_ShapeAspect TolerancedShapeAspect ();
		%feature("compactdefaultargs") SetTolerancedShapeAspect;
		%feature("autodoc", "	* Set field TolerancedShapeAspect

	:param TolerancedShapeAspect:
	:type TolerancedShapeAspect: Handle_StepRepr_ShapeAspect &
	:rtype: None
") SetTolerancedShapeAspect;
		void SetTolerancedShapeAspect (const Handle_StepRepr_ShapeAspect & TolerancedShapeAspect);
};


%extend StepDimTol_GeometricTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_GeometricTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_GeometricTolerance::Handle_StepDimTol_GeometricTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_GeometricTolerance;
class Handle_StepDimTol_GeometricTolerance : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepDimTol_GeometricTolerance();
        Handle_StepDimTol_GeometricTolerance(const Handle_StepDimTol_GeometricTolerance &aHandle);
        Handle_StepDimTol_GeometricTolerance(const StepDimTol_GeometricTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_GeometricTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_GeometricTolerance {
    StepDimTol_GeometricTolerance* _get_reference() {
    return (StepDimTol_GeometricTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_GeometricTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_GeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_GeometricToleranceRelationship;
class StepDimTol_GeometricToleranceRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_GeometricToleranceRelationship;
		 StepDimTol_GeometricToleranceRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRelatingGeometricTolerance:
	:type aRelatingGeometricTolerance: Handle_StepDimTol_GeometricTolerance &
	:param aRelatedGeometricTolerance:
	:type aRelatedGeometricTolerance: Handle_StepDimTol_GeometricTolerance &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepDimTol_GeometricTolerance & aRelatingGeometricTolerance,const Handle_StepDimTol_GeometricTolerance & aRelatedGeometricTolerance);
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
		%feature("compactdefaultargs") RelatingGeometricTolerance;
		%feature("autodoc", "	* Returns field RelatingGeometricTolerance

	:rtype: Handle_StepDimTol_GeometricTolerance
") RelatingGeometricTolerance;
		Handle_StepDimTol_GeometricTolerance RelatingGeometricTolerance ();
		%feature("compactdefaultargs") SetRelatingGeometricTolerance;
		%feature("autodoc", "	* Set field RelatingGeometricTolerance

	:param RelatingGeometricTolerance:
	:type RelatingGeometricTolerance: Handle_StepDimTol_GeometricTolerance &
	:rtype: None
") SetRelatingGeometricTolerance;
		void SetRelatingGeometricTolerance (const Handle_StepDimTol_GeometricTolerance & RelatingGeometricTolerance);
		%feature("compactdefaultargs") RelatedGeometricTolerance;
		%feature("autodoc", "	* Returns field RelatedGeometricTolerance

	:rtype: Handle_StepDimTol_GeometricTolerance
") RelatedGeometricTolerance;
		Handle_StepDimTol_GeometricTolerance RelatedGeometricTolerance ();
		%feature("compactdefaultargs") SetRelatedGeometricTolerance;
		%feature("autodoc", "	* Set field RelatedGeometricTolerance

	:param RelatedGeometricTolerance:
	:type RelatedGeometricTolerance: Handle_StepDimTol_GeometricTolerance &
	:rtype: None
") SetRelatedGeometricTolerance;
		void SetRelatedGeometricTolerance (const Handle_StepDimTol_GeometricTolerance & RelatedGeometricTolerance);
};


%extend StepDimTol_GeometricToleranceRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_GeometricToleranceRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_GeometricToleranceRelationship::Handle_StepDimTol_GeometricToleranceRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_GeometricToleranceRelationship;
class Handle_StepDimTol_GeometricToleranceRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepDimTol_GeometricToleranceRelationship();
        Handle_StepDimTol_GeometricToleranceRelationship(const Handle_StepDimTol_GeometricToleranceRelationship &aHandle);
        Handle_StepDimTol_GeometricToleranceRelationship(const StepDimTol_GeometricToleranceRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_GeometricToleranceRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_GeometricToleranceRelationship {
    StepDimTol_GeometricToleranceRelationship* _get_reference() {
    return (StepDimTol_GeometricToleranceRelationship*)$self->Access();
    }
};

%extend Handle_StepDimTol_GeometricToleranceRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_GeometricToleranceRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_HArray1OfDatumReference;
class StepDimTol_HArray1OfDatumReference : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepDimTol_HArray1OfDatumReference;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepDimTol_HArray1OfDatumReference;
		 StepDimTol_HArray1OfDatumReference (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepDimTol_HArray1OfDatumReference;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepDimTol_DatumReference &
	:rtype: None
") StepDimTol_HArray1OfDatumReference;
		 StepDimTol_HArray1OfDatumReference (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepDimTol_DatumReference & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepDimTol_DatumReference &
	:rtype: None
") Init;
		void Init (const Handle_StepDimTol_DatumReference & V);
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
	:type Value: Handle_StepDimTol_DatumReference &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepDimTol_DatumReference & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepDimTol_DatumReference
") Value;
		Handle_StepDimTol_DatumReference Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepDimTol_DatumReference
") ChangeValue;
		Handle_StepDimTol_DatumReference ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepDimTol_Array1OfDatumReference
") Array1;
		const StepDimTol_Array1OfDatumReference & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepDimTol_Array1OfDatumReference
") ChangeArray1;
		StepDimTol_Array1OfDatumReference & ChangeArray1 ();
};


%extend StepDimTol_HArray1OfDatumReference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_HArray1OfDatumReference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_HArray1OfDatumReference::Handle_StepDimTol_HArray1OfDatumReference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_HArray1OfDatumReference;
class Handle_StepDimTol_HArray1OfDatumReference : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepDimTol_HArray1OfDatumReference();
        Handle_StepDimTol_HArray1OfDatumReference(const Handle_StepDimTol_HArray1OfDatumReference &aHandle);
        Handle_StepDimTol_HArray1OfDatumReference(const StepDimTol_HArray1OfDatumReference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_HArray1OfDatumReference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_HArray1OfDatumReference {
    StepDimTol_HArray1OfDatumReference* _get_reference() {
    return (StepDimTol_HArray1OfDatumReference*)$self->Access();
    }
};

%extend Handle_StepDimTol_HArray1OfDatumReference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_HArray1OfDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_ShapeToleranceSelect;
class StepDimTol_ShapeToleranceSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepDimTol_ShapeToleranceSelect;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_ShapeToleranceSelect;
		 StepDimTol_ShapeToleranceSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ShapeToleranceSelect select type 1 -> GeometricTolerance from StepDimTol 2 -> PlusMinusTolerance from StepShape 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "	* Returns Value as GeometricTolerance (or Null if another type)

	:rtype: Handle_StepDimTol_GeometricTolerance
") GeometricTolerance;
		Handle_StepDimTol_GeometricTolerance GeometricTolerance ();
		%feature("compactdefaultargs") PlusMinusTolerance;
		%feature("autodoc", "	* Returns Value as PlusMinusTolerance (or Null if another type)

	:rtype: Handle_StepShape_PlusMinusTolerance
") PlusMinusTolerance;
		Handle_StepShape_PlusMinusTolerance PlusMinusTolerance ();
};


%extend StepDimTol_ShapeToleranceSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_CylindricityTolerance;
class StepDimTol_CylindricityTolerance : public StepDimTol_GeometricTolerance {
	public:
		%feature("compactdefaultargs") StepDimTol_CylindricityTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_CylindricityTolerance;
		 StepDimTol_CylindricityTolerance ();
};


%extend StepDimTol_CylindricityTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_CylindricityTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_CylindricityTolerance::Handle_StepDimTol_CylindricityTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_CylindricityTolerance;
class Handle_StepDimTol_CylindricityTolerance : public Handle_StepDimTol_GeometricTolerance {

    public:
        // constructors
        Handle_StepDimTol_CylindricityTolerance();
        Handle_StepDimTol_CylindricityTolerance(const Handle_StepDimTol_CylindricityTolerance &aHandle);
        Handle_StepDimTol_CylindricityTolerance(const StepDimTol_CylindricityTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_CylindricityTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_CylindricityTolerance {
    StepDimTol_CylindricityTolerance* _get_reference() {
    return (StepDimTol_CylindricityTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_CylindricityTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_CylindricityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_FlatnessTolerance;
class StepDimTol_FlatnessTolerance : public StepDimTol_GeometricTolerance {
	public:
		%feature("compactdefaultargs") StepDimTol_FlatnessTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_FlatnessTolerance;
		 StepDimTol_FlatnessTolerance ();
};


%extend StepDimTol_FlatnessTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_FlatnessTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_FlatnessTolerance::Handle_StepDimTol_FlatnessTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_FlatnessTolerance;
class Handle_StepDimTol_FlatnessTolerance : public Handle_StepDimTol_GeometricTolerance {

    public:
        // constructors
        Handle_StepDimTol_FlatnessTolerance();
        Handle_StepDimTol_FlatnessTolerance(const Handle_StepDimTol_FlatnessTolerance &aHandle);
        Handle_StepDimTol_FlatnessTolerance(const StepDimTol_FlatnessTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_FlatnessTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_FlatnessTolerance {
    StepDimTol_FlatnessTolerance* _get_reference() {
    return (StepDimTol_FlatnessTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_FlatnessTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_FlatnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
class StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol : public StepDimTol_GeometricTolerance {
	public:
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		%feature("autodoc", "	:rtype: None
") StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aMagnitude:
	:type aMagnitude: Handle_StepBasic_MeasureWithUnit &
	:param aTolerancedShapeAspect:
	:type aTolerancedShapeAspect: Handle_StepRepr_ShapeAspect &
	:param aGTWDR:
	:type aGTWDR: Handle_StepDimTol_GeometricToleranceWithDatumReference &
	:param aMGT:
	:type aMGT: Handle_StepDimTol_ModifiedGeometricTolerance &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_MeasureWithUnit & aMagnitude,const Handle_StepRepr_ShapeAspect & aTolerancedShapeAspect,const Handle_StepDimTol_GeometricToleranceWithDatumReference & aGTWDR,const Handle_StepDimTol_ModifiedGeometricTolerance & aMGT);
		%feature("compactdefaultargs") SetGeometricToleranceWithDatumReference;
		%feature("autodoc", "	:param aGTWDR:
	:type aGTWDR: Handle_StepDimTol_GeometricToleranceWithDatumReference &
	:rtype: None
") SetGeometricToleranceWithDatumReference;
		void SetGeometricToleranceWithDatumReference (const Handle_StepDimTol_GeometricToleranceWithDatumReference & aGTWDR);
		%feature("compactdefaultargs") GetGeometricToleranceWithDatumReference;
		%feature("autodoc", "	:rtype: Handle_StepDimTol_GeometricToleranceWithDatumReference
") GetGeometricToleranceWithDatumReference;
		Handle_StepDimTol_GeometricToleranceWithDatumReference GetGeometricToleranceWithDatumReference ();
		%feature("compactdefaultargs") SetModifiedGeometricTolerance;
		%feature("autodoc", "	:param aMGT:
	:type aMGT: Handle_StepDimTol_ModifiedGeometricTolerance &
	:rtype: None
") SetModifiedGeometricTolerance;
		void SetModifiedGeometricTolerance (const Handle_StepDimTol_ModifiedGeometricTolerance & aMGT);
		%feature("compactdefaultargs") GetModifiedGeometricTolerance;
		%feature("autodoc", "	:rtype: Handle_StepDimTol_ModifiedGeometricTolerance
") GetModifiedGeometricTolerance;
		Handle_StepDimTol_ModifiedGeometricTolerance GetModifiedGeometricTolerance ();
		%feature("compactdefaultargs") SetPositionTolerance;
		%feature("autodoc", "	:param aPT:
	:type aPT: Handle_StepDimTol_PositionTolerance &
	:rtype: None
") SetPositionTolerance;
		void SetPositionTolerance (const Handle_StepDimTol_PositionTolerance & aPT);
		%feature("compactdefaultargs") GetPositionTolerance;
		%feature("autodoc", "	:rtype: Handle_StepDimTol_PositionTolerance
") GetPositionTolerance;
		Handle_StepDimTol_PositionTolerance GetPositionTolerance ();
};


%extend StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol::Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
class Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol : public Handle_StepDimTol_GeometricTolerance {

    public:
        // constructors
        Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol();
        Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol(const Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol &aHandle);
        Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol(const StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol {
    StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol* _get_reference() {
    return (StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol*)$self->Access();
    }
};

%extend Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_GeometricToleranceWithDatumReference;
class StepDimTol_GeometricToleranceWithDatumReference : public StepDimTol_GeometricTolerance {
	public:
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithDatumReference;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_GeometricToleranceWithDatumReference;
		 StepDimTol_GeometricToleranceWithDatumReference ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aGeometricTolerance_Name:
	:type aGeometricTolerance_Name: Handle_TCollection_HAsciiString &
	:param aGeometricTolerance_Description:
	:type aGeometricTolerance_Description: Handle_TCollection_HAsciiString &
	:param aGeometricTolerance_Magnitude:
	:type aGeometricTolerance_Magnitude: Handle_StepBasic_MeasureWithUnit &
	:param aGeometricTolerance_TolerancedShapeAspect:
	:type aGeometricTolerance_TolerancedShapeAspect: Handle_StepRepr_ShapeAspect &
	:param aDatumSystem:
	:type aDatumSystem: Handle_StepDimTol_HArray1OfDatumReference &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aGeometricTolerance_Name,const Handle_TCollection_HAsciiString & aGeometricTolerance_Description,const Handle_StepBasic_MeasureWithUnit & aGeometricTolerance_Magnitude,const Handle_StepRepr_ShapeAspect & aGeometricTolerance_TolerancedShapeAspect,const Handle_StepDimTol_HArray1OfDatumReference & aDatumSystem);
		%feature("compactdefaultargs") DatumSystem;
		%feature("autodoc", "	* Returns field DatumSystem

	:rtype: Handle_StepDimTol_HArray1OfDatumReference
") DatumSystem;
		Handle_StepDimTol_HArray1OfDatumReference DatumSystem ();
		%feature("compactdefaultargs") SetDatumSystem;
		%feature("autodoc", "	* Set field DatumSystem

	:param DatumSystem:
	:type DatumSystem: Handle_StepDimTol_HArray1OfDatumReference &
	:rtype: None
") SetDatumSystem;
		void SetDatumSystem (const Handle_StepDimTol_HArray1OfDatumReference & DatumSystem);
};


%extend StepDimTol_GeometricToleranceWithDatumReference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_GeometricToleranceWithDatumReference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_GeometricToleranceWithDatumReference::Handle_StepDimTol_GeometricToleranceWithDatumReference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_GeometricToleranceWithDatumReference;
class Handle_StepDimTol_GeometricToleranceWithDatumReference : public Handle_StepDimTol_GeometricTolerance {

    public:
        // constructors
        Handle_StepDimTol_GeometricToleranceWithDatumReference();
        Handle_StepDimTol_GeometricToleranceWithDatumReference(const Handle_StepDimTol_GeometricToleranceWithDatumReference &aHandle);
        Handle_StepDimTol_GeometricToleranceWithDatumReference(const StepDimTol_GeometricToleranceWithDatumReference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_GeometricToleranceWithDatumReference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_GeometricToleranceWithDatumReference {
    StepDimTol_GeometricToleranceWithDatumReference* _get_reference() {
    return (StepDimTol_GeometricToleranceWithDatumReference*)$self->Access();
    }
};

%extend Handle_StepDimTol_GeometricToleranceWithDatumReference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_GeometricToleranceWithDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_LineProfileTolerance;
class StepDimTol_LineProfileTolerance : public StepDimTol_GeometricTolerance {
	public:
		%feature("compactdefaultargs") StepDimTol_LineProfileTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_LineProfileTolerance;
		 StepDimTol_LineProfileTolerance ();
};


%extend StepDimTol_LineProfileTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_LineProfileTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_LineProfileTolerance::Handle_StepDimTol_LineProfileTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_LineProfileTolerance;
class Handle_StepDimTol_LineProfileTolerance : public Handle_StepDimTol_GeometricTolerance {

    public:
        // constructors
        Handle_StepDimTol_LineProfileTolerance();
        Handle_StepDimTol_LineProfileTolerance(const Handle_StepDimTol_LineProfileTolerance &aHandle);
        Handle_StepDimTol_LineProfileTolerance(const StepDimTol_LineProfileTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_LineProfileTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_LineProfileTolerance {
    StepDimTol_LineProfileTolerance* _get_reference() {
    return (StepDimTol_LineProfileTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_LineProfileTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_LineProfileTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_ModifiedGeometricTolerance;
class StepDimTol_ModifiedGeometricTolerance : public StepDimTol_GeometricTolerance {
	public:
		%feature("compactdefaultargs") StepDimTol_ModifiedGeometricTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_ModifiedGeometricTolerance;
		 StepDimTol_ModifiedGeometricTolerance ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aGeometricTolerance_Name:
	:type aGeometricTolerance_Name: Handle_TCollection_HAsciiString &
	:param aGeometricTolerance_Description:
	:type aGeometricTolerance_Description: Handle_TCollection_HAsciiString &
	:param aGeometricTolerance_Magnitude:
	:type aGeometricTolerance_Magnitude: Handle_StepBasic_MeasureWithUnit &
	:param aGeometricTolerance_TolerancedShapeAspect:
	:type aGeometricTolerance_TolerancedShapeAspect: Handle_StepRepr_ShapeAspect &
	:param aModifier:
	:type aModifier: StepDimTol_LimitCondition
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aGeometricTolerance_Name,const Handle_TCollection_HAsciiString & aGeometricTolerance_Description,const Handle_StepBasic_MeasureWithUnit & aGeometricTolerance_Magnitude,const Handle_StepRepr_ShapeAspect & aGeometricTolerance_TolerancedShapeAspect,const StepDimTol_LimitCondition aModifier);
		%feature("compactdefaultargs") Modifier;
		%feature("autodoc", "	* Returns field Modifier

	:rtype: StepDimTol_LimitCondition
") Modifier;
		StepDimTol_LimitCondition Modifier ();
		%feature("compactdefaultargs") SetModifier;
		%feature("autodoc", "	* Set field Modifier

	:param Modifier:
	:type Modifier: StepDimTol_LimitCondition
	:rtype: None
") SetModifier;
		void SetModifier (const StepDimTol_LimitCondition Modifier);
};


%extend StepDimTol_ModifiedGeometricTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_ModifiedGeometricTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_ModifiedGeometricTolerance::Handle_StepDimTol_ModifiedGeometricTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_ModifiedGeometricTolerance;
class Handle_StepDimTol_ModifiedGeometricTolerance : public Handle_StepDimTol_GeometricTolerance {

    public:
        // constructors
        Handle_StepDimTol_ModifiedGeometricTolerance();
        Handle_StepDimTol_ModifiedGeometricTolerance(const Handle_StepDimTol_ModifiedGeometricTolerance &aHandle);
        Handle_StepDimTol_ModifiedGeometricTolerance(const StepDimTol_ModifiedGeometricTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_ModifiedGeometricTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_ModifiedGeometricTolerance {
    StepDimTol_ModifiedGeometricTolerance* _get_reference() {
    return (StepDimTol_ModifiedGeometricTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_ModifiedGeometricTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_ModifiedGeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_PlacedDatumTargetFeature;
class StepDimTol_PlacedDatumTargetFeature : public StepDimTol_DatumTarget {
	public:
		%feature("compactdefaultargs") StepDimTol_PlacedDatumTargetFeature;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_PlacedDatumTargetFeature;
		 StepDimTol_PlacedDatumTargetFeature ();
};


%extend StepDimTol_PlacedDatumTargetFeature {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_PlacedDatumTargetFeature(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_PlacedDatumTargetFeature::Handle_StepDimTol_PlacedDatumTargetFeature %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_PlacedDatumTargetFeature;
class Handle_StepDimTol_PlacedDatumTargetFeature : public Handle_StepDimTol_DatumTarget {

    public:
        // constructors
        Handle_StepDimTol_PlacedDatumTargetFeature();
        Handle_StepDimTol_PlacedDatumTargetFeature(const Handle_StepDimTol_PlacedDatumTargetFeature &aHandle);
        Handle_StepDimTol_PlacedDatumTargetFeature(const StepDimTol_PlacedDatumTargetFeature *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_PlacedDatumTargetFeature DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_PlacedDatumTargetFeature {
    StepDimTol_PlacedDatumTargetFeature* _get_reference() {
    return (StepDimTol_PlacedDatumTargetFeature*)$self->Access();
    }
};

%extend Handle_StepDimTol_PlacedDatumTargetFeature {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_PlacedDatumTargetFeature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_PositionTolerance;
class StepDimTol_PositionTolerance : public StepDimTol_GeometricTolerance {
	public:
		%feature("compactdefaultargs") StepDimTol_PositionTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_PositionTolerance;
		 StepDimTol_PositionTolerance ();
};


%extend StepDimTol_PositionTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_PositionTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_PositionTolerance::Handle_StepDimTol_PositionTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_PositionTolerance;
class Handle_StepDimTol_PositionTolerance : public Handle_StepDimTol_GeometricTolerance {

    public:
        // constructors
        Handle_StepDimTol_PositionTolerance();
        Handle_StepDimTol_PositionTolerance(const Handle_StepDimTol_PositionTolerance &aHandle);
        Handle_StepDimTol_PositionTolerance(const StepDimTol_PositionTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_PositionTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_PositionTolerance {
    StepDimTol_PositionTolerance* _get_reference() {
    return (StepDimTol_PositionTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_PositionTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_PositionTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_RoundnessTolerance;
class StepDimTol_RoundnessTolerance : public StepDimTol_GeometricTolerance {
	public:
		%feature("compactdefaultargs") StepDimTol_RoundnessTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_RoundnessTolerance;
		 StepDimTol_RoundnessTolerance ();
};


%extend StepDimTol_RoundnessTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_RoundnessTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_RoundnessTolerance::Handle_StepDimTol_RoundnessTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_RoundnessTolerance;
class Handle_StepDimTol_RoundnessTolerance : public Handle_StepDimTol_GeometricTolerance {

    public:
        // constructors
        Handle_StepDimTol_RoundnessTolerance();
        Handle_StepDimTol_RoundnessTolerance(const Handle_StepDimTol_RoundnessTolerance &aHandle);
        Handle_StepDimTol_RoundnessTolerance(const StepDimTol_RoundnessTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_RoundnessTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_RoundnessTolerance {
    StepDimTol_RoundnessTolerance* _get_reference() {
    return (StepDimTol_RoundnessTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_RoundnessTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_RoundnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_StraightnessTolerance;
class StepDimTol_StraightnessTolerance : public StepDimTol_GeometricTolerance {
	public:
		%feature("compactdefaultargs") StepDimTol_StraightnessTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_StraightnessTolerance;
		 StepDimTol_StraightnessTolerance ();
};


%extend StepDimTol_StraightnessTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_StraightnessTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_StraightnessTolerance::Handle_StepDimTol_StraightnessTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_StraightnessTolerance;
class Handle_StepDimTol_StraightnessTolerance : public Handle_StepDimTol_GeometricTolerance {

    public:
        // constructors
        Handle_StepDimTol_StraightnessTolerance();
        Handle_StepDimTol_StraightnessTolerance(const Handle_StepDimTol_StraightnessTolerance &aHandle);
        Handle_StepDimTol_StraightnessTolerance(const StepDimTol_StraightnessTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_StraightnessTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_StraightnessTolerance {
    StepDimTol_StraightnessTolerance* _get_reference() {
    return (StepDimTol_StraightnessTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_StraightnessTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_StraightnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_SurfaceProfileTolerance;
class StepDimTol_SurfaceProfileTolerance : public StepDimTol_GeometricTolerance {
	public:
		%feature("compactdefaultargs") StepDimTol_SurfaceProfileTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_SurfaceProfileTolerance;
		 StepDimTol_SurfaceProfileTolerance ();
};


%extend StepDimTol_SurfaceProfileTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_SurfaceProfileTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_SurfaceProfileTolerance::Handle_StepDimTol_SurfaceProfileTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_SurfaceProfileTolerance;
class Handle_StepDimTol_SurfaceProfileTolerance : public Handle_StepDimTol_GeometricTolerance {

    public:
        // constructors
        Handle_StepDimTol_SurfaceProfileTolerance();
        Handle_StepDimTol_SurfaceProfileTolerance(const Handle_StepDimTol_SurfaceProfileTolerance &aHandle);
        Handle_StepDimTol_SurfaceProfileTolerance(const StepDimTol_SurfaceProfileTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_SurfaceProfileTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_SurfaceProfileTolerance {
    StepDimTol_SurfaceProfileTolerance* _get_reference() {
    return (StepDimTol_SurfaceProfileTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_SurfaceProfileTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_SurfaceProfileTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_AngularityTolerance;
class StepDimTol_AngularityTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		%feature("compactdefaultargs") StepDimTol_AngularityTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_AngularityTolerance;
		 StepDimTol_AngularityTolerance ();
};


%extend StepDimTol_AngularityTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_AngularityTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_AngularityTolerance::Handle_StepDimTol_AngularityTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_AngularityTolerance;
class Handle_StepDimTol_AngularityTolerance : public Handle_StepDimTol_GeometricToleranceWithDatumReference {

    public:
        // constructors
        Handle_StepDimTol_AngularityTolerance();
        Handle_StepDimTol_AngularityTolerance(const Handle_StepDimTol_AngularityTolerance &aHandle);
        Handle_StepDimTol_AngularityTolerance(const StepDimTol_AngularityTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_AngularityTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_AngularityTolerance {
    StepDimTol_AngularityTolerance* _get_reference() {
    return (StepDimTol_AngularityTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_AngularityTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_AngularityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_CircularRunoutTolerance;
class StepDimTol_CircularRunoutTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		%feature("compactdefaultargs") StepDimTol_CircularRunoutTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_CircularRunoutTolerance;
		 StepDimTol_CircularRunoutTolerance ();
};


%extend StepDimTol_CircularRunoutTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_CircularRunoutTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_CircularRunoutTolerance::Handle_StepDimTol_CircularRunoutTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_CircularRunoutTolerance;
class Handle_StepDimTol_CircularRunoutTolerance : public Handle_StepDimTol_GeometricToleranceWithDatumReference {

    public:
        // constructors
        Handle_StepDimTol_CircularRunoutTolerance();
        Handle_StepDimTol_CircularRunoutTolerance(const Handle_StepDimTol_CircularRunoutTolerance &aHandle);
        Handle_StepDimTol_CircularRunoutTolerance(const StepDimTol_CircularRunoutTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_CircularRunoutTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_CircularRunoutTolerance {
    StepDimTol_CircularRunoutTolerance* _get_reference() {
    return (StepDimTol_CircularRunoutTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_CircularRunoutTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_CircularRunoutTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_CoaxialityTolerance;
class StepDimTol_CoaxialityTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		%feature("compactdefaultargs") StepDimTol_CoaxialityTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_CoaxialityTolerance;
		 StepDimTol_CoaxialityTolerance ();
};


%extend StepDimTol_CoaxialityTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_CoaxialityTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_CoaxialityTolerance::Handle_StepDimTol_CoaxialityTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_CoaxialityTolerance;
class Handle_StepDimTol_CoaxialityTolerance : public Handle_StepDimTol_GeometricToleranceWithDatumReference {

    public:
        // constructors
        Handle_StepDimTol_CoaxialityTolerance();
        Handle_StepDimTol_CoaxialityTolerance(const Handle_StepDimTol_CoaxialityTolerance &aHandle);
        Handle_StepDimTol_CoaxialityTolerance(const StepDimTol_CoaxialityTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_CoaxialityTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_CoaxialityTolerance {
    StepDimTol_CoaxialityTolerance* _get_reference() {
    return (StepDimTol_CoaxialityTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_CoaxialityTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_CoaxialityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_ConcentricityTolerance;
class StepDimTol_ConcentricityTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		%feature("compactdefaultargs") StepDimTol_ConcentricityTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_ConcentricityTolerance;
		 StepDimTol_ConcentricityTolerance ();
};


%extend StepDimTol_ConcentricityTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_ConcentricityTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_ConcentricityTolerance::Handle_StepDimTol_ConcentricityTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_ConcentricityTolerance;
class Handle_StepDimTol_ConcentricityTolerance : public Handle_StepDimTol_GeometricToleranceWithDatumReference {

    public:
        // constructors
        Handle_StepDimTol_ConcentricityTolerance();
        Handle_StepDimTol_ConcentricityTolerance(const Handle_StepDimTol_ConcentricityTolerance &aHandle);
        Handle_StepDimTol_ConcentricityTolerance(const StepDimTol_ConcentricityTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_ConcentricityTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_ConcentricityTolerance {
    StepDimTol_ConcentricityTolerance* _get_reference() {
    return (StepDimTol_ConcentricityTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_ConcentricityTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_ConcentricityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_ParallelismTolerance;
class StepDimTol_ParallelismTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		%feature("compactdefaultargs") StepDimTol_ParallelismTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_ParallelismTolerance;
		 StepDimTol_ParallelismTolerance ();
};


%extend StepDimTol_ParallelismTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_ParallelismTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_ParallelismTolerance::Handle_StepDimTol_ParallelismTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_ParallelismTolerance;
class Handle_StepDimTol_ParallelismTolerance : public Handle_StepDimTol_GeometricToleranceWithDatumReference {

    public:
        // constructors
        Handle_StepDimTol_ParallelismTolerance();
        Handle_StepDimTol_ParallelismTolerance(const Handle_StepDimTol_ParallelismTolerance &aHandle);
        Handle_StepDimTol_ParallelismTolerance(const StepDimTol_ParallelismTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_ParallelismTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_ParallelismTolerance {
    StepDimTol_ParallelismTolerance* _get_reference() {
    return (StepDimTol_ParallelismTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_ParallelismTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_ParallelismTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_PerpendicularityTolerance;
class StepDimTol_PerpendicularityTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		%feature("compactdefaultargs") StepDimTol_PerpendicularityTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_PerpendicularityTolerance;
		 StepDimTol_PerpendicularityTolerance ();
};


%extend StepDimTol_PerpendicularityTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_PerpendicularityTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_PerpendicularityTolerance::Handle_StepDimTol_PerpendicularityTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_PerpendicularityTolerance;
class Handle_StepDimTol_PerpendicularityTolerance : public Handle_StepDimTol_GeometricToleranceWithDatumReference {

    public:
        // constructors
        Handle_StepDimTol_PerpendicularityTolerance();
        Handle_StepDimTol_PerpendicularityTolerance(const Handle_StepDimTol_PerpendicularityTolerance &aHandle);
        Handle_StepDimTol_PerpendicularityTolerance(const StepDimTol_PerpendicularityTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_PerpendicularityTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_PerpendicularityTolerance {
    StepDimTol_PerpendicularityTolerance* _get_reference() {
    return (StepDimTol_PerpendicularityTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_PerpendicularityTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_PerpendicularityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_SymmetryTolerance;
class StepDimTol_SymmetryTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		%feature("compactdefaultargs") StepDimTol_SymmetryTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_SymmetryTolerance;
		 StepDimTol_SymmetryTolerance ();
};


%extend StepDimTol_SymmetryTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_SymmetryTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_SymmetryTolerance::Handle_StepDimTol_SymmetryTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_SymmetryTolerance;
class Handle_StepDimTol_SymmetryTolerance : public Handle_StepDimTol_GeometricToleranceWithDatumReference {

    public:
        // constructors
        Handle_StepDimTol_SymmetryTolerance();
        Handle_StepDimTol_SymmetryTolerance(const Handle_StepDimTol_SymmetryTolerance &aHandle);
        Handle_StepDimTol_SymmetryTolerance(const StepDimTol_SymmetryTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_SymmetryTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_SymmetryTolerance {
    StepDimTol_SymmetryTolerance* _get_reference() {
    return (StepDimTol_SymmetryTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_SymmetryTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_SymmetryTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepDimTol_TotalRunoutTolerance;
class StepDimTol_TotalRunoutTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		%feature("compactdefaultargs") StepDimTol_TotalRunoutTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepDimTol_TotalRunoutTolerance;
		 StepDimTol_TotalRunoutTolerance ();
};


%extend StepDimTol_TotalRunoutTolerance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepDimTol_TotalRunoutTolerance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepDimTol_TotalRunoutTolerance::Handle_StepDimTol_TotalRunoutTolerance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepDimTol_TotalRunoutTolerance;
class Handle_StepDimTol_TotalRunoutTolerance : public Handle_StepDimTol_GeometricToleranceWithDatumReference {

    public:
        // constructors
        Handle_StepDimTol_TotalRunoutTolerance();
        Handle_StepDimTol_TotalRunoutTolerance(const Handle_StepDimTol_TotalRunoutTolerance &aHandle);
        Handle_StepDimTol_TotalRunoutTolerance(const StepDimTol_TotalRunoutTolerance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepDimTol_TotalRunoutTolerance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepDimTol_TotalRunoutTolerance {
    StepDimTol_TotalRunoutTolerance* _get_reference() {
    return (StepDimTol_TotalRunoutTolerance*)$self->Access();
    }
};

%extend Handle_StepDimTol_TotalRunoutTolerance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepDimTol_TotalRunoutTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
