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
%module (package="OCC") StepVisual

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


%include StepVisual_headers.i


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
enum StepVisual_CentralOrParallel {
	StepVisual_copCentral = 0,
	StepVisual_copParallel = 1,
};

enum StepVisual_MarkerType {
	StepVisual_mtDot = 0,
	StepVisual_mtX = 1,
	StepVisual_mtPlus = 2,
	StepVisual_mtAsterisk = 3,
	StepVisual_mtRing = 4,
	StepVisual_mtSquare = 5,
	StepVisual_mtTriangle = 6,
};

enum StepVisual_SurfaceSide {
	StepVisual_ssNegative = 0,
	StepVisual_ssPositive = 1,
	StepVisual_ssBoth = 2,
};

enum StepVisual_TextPath {
	StepVisual_tpUp = 0,
	StepVisual_tpRight = 1,
	StepVisual_tpDown = 2,
	StepVisual_tpLeft = 3,
};

/* end public enums declaration */

%nodefaultctor StepVisual_AnnotationText;
class StepVisual_AnnotationText : public StepRepr_MappedItem {
	public:
		%feature("compactdefaultargs") StepVisual_AnnotationText;
		%feature("autodoc", "	* Returns a AnnotationText

	:rtype: None
") StepVisual_AnnotationText;
		 StepVisual_AnnotationText ();
};


%extend StepVisual_AnnotationText {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_AnnotationText(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_AnnotationText::Handle_StepVisual_AnnotationText %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_AnnotationText;
class Handle_StepVisual_AnnotationText : public Handle_StepRepr_MappedItem {

    public:
        // constructors
        Handle_StepVisual_AnnotationText();
        Handle_StepVisual_AnnotationText(const Handle_StepVisual_AnnotationText &aHandle);
        Handle_StepVisual_AnnotationText(const StepVisual_AnnotationText *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_AnnotationText DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_AnnotationText {
    StepVisual_AnnotationText* _get_reference() {
    return (StepVisual_AnnotationText*)$self->Access();
    }
};

%extend Handle_StepVisual_AnnotationText {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_AnnotationText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_AreaInSet;
class StepVisual_AreaInSet : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_AreaInSet;
		%feature("autodoc", "	* Returns a AreaInSet

	:rtype: None
") StepVisual_AreaInSet;
		 StepVisual_AreaInSet ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aArea:
	:type aArea: Handle_StepVisual_PresentationArea &
	:param aInSet:
	:type aInSet: Handle_StepVisual_PresentationSet &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_PresentationArea & aArea,const Handle_StepVisual_PresentationSet & aInSet);
		%feature("compactdefaultargs") SetArea;
		%feature("autodoc", "	:param aArea:
	:type aArea: Handle_StepVisual_PresentationArea &
	:rtype: None
") SetArea;
		void SetArea (const Handle_StepVisual_PresentationArea & aArea);
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PresentationArea
") Area;
		Handle_StepVisual_PresentationArea Area ();
		%feature("compactdefaultargs") SetInSet;
		%feature("autodoc", "	:param aInSet:
	:type aInSet: Handle_StepVisual_PresentationSet &
	:rtype: None
") SetInSet;
		void SetInSet (const Handle_StepVisual_PresentationSet & aInSet);
		%feature("compactdefaultargs") InSet;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PresentationSet
") InSet;
		Handle_StepVisual_PresentationSet InSet ();
};


%extend StepVisual_AreaInSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_AreaInSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_AreaInSet::Handle_StepVisual_AreaInSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_AreaInSet;
class Handle_StepVisual_AreaInSet : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_AreaInSet();
        Handle_StepVisual_AreaInSet(const Handle_StepVisual_AreaInSet &aHandle);
        Handle_StepVisual_AreaInSet(const StepVisual_AreaInSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_AreaInSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_AreaInSet {
    StepVisual_AreaInSet* _get_reference() {
    return (StepVisual_AreaInSet*)$self->Access();
    }
};

%extend Handle_StepVisual_AreaInSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_AreaInSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_AreaOrView;
class StepVisual_AreaOrView : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_AreaOrView;
		%feature("autodoc", "	* Returns a AreaOrView SelectType

	:rtype: None
") StepVisual_AreaOrView;
		 StepVisual_AreaOrView ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AreaOrView Kind Entity that is : 1 -> PresentationArea 2 -> PresentationView 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "	* returns Value as a PresentationArea (Null if another type)

	:rtype: Handle_StepVisual_PresentationArea
") PresentationArea;
		Handle_StepVisual_PresentationArea PresentationArea ();
		%feature("compactdefaultargs") PresentationView;
		%feature("autodoc", "	* returns Value as a PresentationView (Null if another type)

	:rtype: Handle_StepVisual_PresentationView
") PresentationView;
		Handle_StepVisual_PresentationView PresentationView ();
};


%extend StepVisual_AreaOrView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfBoxCharacteristicSelect;
class StepVisual_Array1OfBoxCharacteristicSelect {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfBoxCharacteristicSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfBoxCharacteristicSelect;
		 StepVisual_Array1OfBoxCharacteristicSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfBoxCharacteristicSelect;
		%feature("autodoc", "	:param Item:
	:type Item: StepVisual_BoxCharacteristicSelect &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfBoxCharacteristicSelect;
		 StepVisual_Array1OfBoxCharacteristicSelect (const StepVisual_BoxCharacteristicSelect & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_BoxCharacteristicSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_BoxCharacteristicSelect & V);
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
	:type Other: StepVisual_Array1OfBoxCharacteristicSelect &
	:rtype: StepVisual_Array1OfBoxCharacteristicSelect
") Assign;
		const StepVisual_Array1OfBoxCharacteristicSelect & Assign (const StepVisual_Array1OfBoxCharacteristicSelect & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfBoxCharacteristicSelect &
	:rtype: StepVisual_Array1OfBoxCharacteristicSelect
") operator =;
		const StepVisual_Array1OfBoxCharacteristicSelect & operator = (const StepVisual_Array1OfBoxCharacteristicSelect & Other);
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
	:type Value: StepVisual_BoxCharacteristicSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_BoxCharacteristicSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_BoxCharacteristicSelect
") Value;
		const StepVisual_BoxCharacteristicSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_BoxCharacteristicSelect
") ChangeValue;
		StepVisual_BoxCharacteristicSelect & ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfBoxCharacteristicSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfCurveStyleFontPattern;
class StepVisual_Array1OfCurveStyleFontPattern {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfCurveStyleFontPattern;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfCurveStyleFontPattern;
		 StepVisual_Array1OfCurveStyleFontPattern (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfCurveStyleFontPattern;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepVisual_CurveStyleFontPattern &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfCurveStyleFontPattern;
		 StepVisual_Array1OfCurveStyleFontPattern (const Handle_StepVisual_CurveStyleFontPattern & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepVisual_CurveStyleFontPattern &
	:rtype: None
") Init;
		void Init (const Handle_StepVisual_CurveStyleFontPattern & V);
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
	:type Other: StepVisual_Array1OfCurveStyleFontPattern &
	:rtype: StepVisual_Array1OfCurveStyleFontPattern
") Assign;
		const StepVisual_Array1OfCurveStyleFontPattern & Assign (const StepVisual_Array1OfCurveStyleFontPattern & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfCurveStyleFontPattern &
	:rtype: StepVisual_Array1OfCurveStyleFontPattern
") operator =;
		const StepVisual_Array1OfCurveStyleFontPattern & operator = (const StepVisual_Array1OfCurveStyleFontPattern & Other);
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
	:type Value: Handle_StepVisual_CurveStyleFontPattern &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepVisual_CurveStyleFontPattern & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepVisual_CurveStyleFontPattern
") Value;
		Handle_StepVisual_CurveStyleFontPattern Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepVisual_CurveStyleFontPattern
") ChangeValue;
		Handle_StepVisual_CurveStyleFontPattern ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfCurveStyleFontPattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfDirectionCountSelect;
class StepVisual_Array1OfDirectionCountSelect {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfDirectionCountSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfDirectionCountSelect;
		 StepVisual_Array1OfDirectionCountSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfDirectionCountSelect;
		%feature("autodoc", "	:param Item:
	:type Item: StepVisual_DirectionCountSelect &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfDirectionCountSelect;
		 StepVisual_Array1OfDirectionCountSelect (const StepVisual_DirectionCountSelect & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_DirectionCountSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_DirectionCountSelect & V);
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
	:type Other: StepVisual_Array1OfDirectionCountSelect &
	:rtype: StepVisual_Array1OfDirectionCountSelect
") Assign;
		const StepVisual_Array1OfDirectionCountSelect & Assign (const StepVisual_Array1OfDirectionCountSelect & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfDirectionCountSelect &
	:rtype: StepVisual_Array1OfDirectionCountSelect
") operator =;
		const StepVisual_Array1OfDirectionCountSelect & operator = (const StepVisual_Array1OfDirectionCountSelect & Other);
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
	:type Value: StepVisual_DirectionCountSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_DirectionCountSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_DirectionCountSelect
") Value;
		const StepVisual_DirectionCountSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_DirectionCountSelect
") ChangeValue;
		StepVisual_DirectionCountSelect & ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfDirectionCountSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfFillStyleSelect;
class StepVisual_Array1OfFillStyleSelect {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfFillStyleSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfFillStyleSelect;
		 StepVisual_Array1OfFillStyleSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfFillStyleSelect;
		%feature("autodoc", "	:param Item:
	:type Item: StepVisual_FillStyleSelect &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfFillStyleSelect;
		 StepVisual_Array1OfFillStyleSelect (const StepVisual_FillStyleSelect & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_FillStyleSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_FillStyleSelect & V);
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
	:type Other: StepVisual_Array1OfFillStyleSelect &
	:rtype: StepVisual_Array1OfFillStyleSelect
") Assign;
		const StepVisual_Array1OfFillStyleSelect & Assign (const StepVisual_Array1OfFillStyleSelect & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfFillStyleSelect &
	:rtype: StepVisual_Array1OfFillStyleSelect
") operator =;
		const StepVisual_Array1OfFillStyleSelect & operator = (const StepVisual_Array1OfFillStyleSelect & Other);
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
	:type Value: StepVisual_FillStyleSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_FillStyleSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_FillStyleSelect
") Value;
		const StepVisual_FillStyleSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_FillStyleSelect
") ChangeValue;
		StepVisual_FillStyleSelect & ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfFillStyleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfInvisibleItem;
class StepVisual_Array1OfInvisibleItem {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfInvisibleItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfInvisibleItem;
		 StepVisual_Array1OfInvisibleItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfInvisibleItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepVisual_InvisibleItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfInvisibleItem;
		 StepVisual_Array1OfInvisibleItem (const StepVisual_InvisibleItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_InvisibleItem &
	:rtype: None
") Init;
		void Init (const StepVisual_InvisibleItem & V);
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
	:type Other: StepVisual_Array1OfInvisibleItem &
	:rtype: StepVisual_Array1OfInvisibleItem
") Assign;
		const StepVisual_Array1OfInvisibleItem & Assign (const StepVisual_Array1OfInvisibleItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfInvisibleItem &
	:rtype: StepVisual_Array1OfInvisibleItem
") operator =;
		const StepVisual_Array1OfInvisibleItem & operator = (const StepVisual_Array1OfInvisibleItem & Other);
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
	:type Value: StepVisual_InvisibleItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_InvisibleItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_InvisibleItem
") Value;
		const StepVisual_InvisibleItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_InvisibleItem
") ChangeValue;
		StepVisual_InvisibleItem & ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfInvisibleItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfLayeredItem;
class StepVisual_Array1OfLayeredItem {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfLayeredItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfLayeredItem;
		 StepVisual_Array1OfLayeredItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfLayeredItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepVisual_LayeredItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfLayeredItem;
		 StepVisual_Array1OfLayeredItem (const StepVisual_LayeredItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_LayeredItem &
	:rtype: None
") Init;
		void Init (const StepVisual_LayeredItem & V);
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
	:type Other: StepVisual_Array1OfLayeredItem &
	:rtype: StepVisual_Array1OfLayeredItem
") Assign;
		const StepVisual_Array1OfLayeredItem & Assign (const StepVisual_Array1OfLayeredItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfLayeredItem &
	:rtype: StepVisual_Array1OfLayeredItem
") operator =;
		const StepVisual_Array1OfLayeredItem & operator = (const StepVisual_Array1OfLayeredItem & Other);
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
	:type Value: StepVisual_LayeredItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_LayeredItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_LayeredItem
") Value;
		const StepVisual_LayeredItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_LayeredItem
") ChangeValue;
		StepVisual_LayeredItem & ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfLayeredItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfPresentationStyleAssignment;
class StepVisual_Array1OfPresentationStyleAssignment {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfPresentationStyleAssignment;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfPresentationStyleAssignment;
		 StepVisual_Array1OfPresentationStyleAssignment (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfPresentationStyleAssignment;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepVisual_PresentationStyleAssignment &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfPresentationStyleAssignment;
		 StepVisual_Array1OfPresentationStyleAssignment (const Handle_StepVisual_PresentationStyleAssignment & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepVisual_PresentationStyleAssignment &
	:rtype: None
") Init;
		void Init (const Handle_StepVisual_PresentationStyleAssignment & V);
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
	:type Other: StepVisual_Array1OfPresentationStyleAssignment &
	:rtype: StepVisual_Array1OfPresentationStyleAssignment
") Assign;
		const StepVisual_Array1OfPresentationStyleAssignment & Assign (const StepVisual_Array1OfPresentationStyleAssignment & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfPresentationStyleAssignment &
	:rtype: StepVisual_Array1OfPresentationStyleAssignment
") operator =;
		const StepVisual_Array1OfPresentationStyleAssignment & operator = (const StepVisual_Array1OfPresentationStyleAssignment & Other);
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
	:type Value: Handle_StepVisual_PresentationStyleAssignment &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepVisual_PresentationStyleAssignment & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepVisual_PresentationStyleAssignment
") Value;
		Handle_StepVisual_PresentationStyleAssignment Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepVisual_PresentationStyleAssignment
") ChangeValue;
		Handle_StepVisual_PresentationStyleAssignment ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfPresentationStyleAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfPresentationStyleSelect;
class StepVisual_Array1OfPresentationStyleSelect {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfPresentationStyleSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfPresentationStyleSelect;
		 StepVisual_Array1OfPresentationStyleSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfPresentationStyleSelect;
		%feature("autodoc", "	:param Item:
	:type Item: StepVisual_PresentationStyleSelect &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfPresentationStyleSelect;
		 StepVisual_Array1OfPresentationStyleSelect (const StepVisual_PresentationStyleSelect & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_PresentationStyleSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_PresentationStyleSelect & V);
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
	:type Other: StepVisual_Array1OfPresentationStyleSelect &
	:rtype: StepVisual_Array1OfPresentationStyleSelect
") Assign;
		const StepVisual_Array1OfPresentationStyleSelect & Assign (const StepVisual_Array1OfPresentationStyleSelect & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfPresentationStyleSelect &
	:rtype: StepVisual_Array1OfPresentationStyleSelect
") operator =;
		const StepVisual_Array1OfPresentationStyleSelect & operator = (const StepVisual_Array1OfPresentationStyleSelect & Other);
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
	:type Value: StepVisual_PresentationStyleSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_PresentationStyleSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_PresentationStyleSelect
") Value;
		const StepVisual_PresentationStyleSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_PresentationStyleSelect
") ChangeValue;
		StepVisual_PresentationStyleSelect & ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfPresentationStyleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfStyleContextSelect;
class StepVisual_Array1OfStyleContextSelect {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfStyleContextSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfStyleContextSelect;
		 StepVisual_Array1OfStyleContextSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfStyleContextSelect;
		%feature("autodoc", "	:param Item:
	:type Item: StepVisual_StyleContextSelect &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfStyleContextSelect;
		 StepVisual_Array1OfStyleContextSelect (const StepVisual_StyleContextSelect & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_StyleContextSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_StyleContextSelect & V);
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
	:type Other: StepVisual_Array1OfStyleContextSelect &
	:rtype: StepVisual_Array1OfStyleContextSelect
") Assign;
		const StepVisual_Array1OfStyleContextSelect & Assign (const StepVisual_Array1OfStyleContextSelect & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfStyleContextSelect &
	:rtype: StepVisual_Array1OfStyleContextSelect
") operator =;
		const StepVisual_Array1OfStyleContextSelect & operator = (const StepVisual_Array1OfStyleContextSelect & Other);
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
	:type Value: StepVisual_StyleContextSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_StyleContextSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_StyleContextSelect
") Value;
		const StepVisual_StyleContextSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_StyleContextSelect
") ChangeValue;
		StepVisual_StyleContextSelect & ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfStyleContextSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfSurfaceStyleElementSelect;
class StepVisual_Array1OfSurfaceStyleElementSelect {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfSurfaceStyleElementSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfSurfaceStyleElementSelect;
		 StepVisual_Array1OfSurfaceStyleElementSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfSurfaceStyleElementSelect;
		%feature("autodoc", "	:param Item:
	:type Item: StepVisual_SurfaceStyleElementSelect &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfSurfaceStyleElementSelect;
		 StepVisual_Array1OfSurfaceStyleElementSelect (const StepVisual_SurfaceStyleElementSelect & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_SurfaceStyleElementSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_SurfaceStyleElementSelect & V);
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
	:type Other: StepVisual_Array1OfSurfaceStyleElementSelect &
	:rtype: StepVisual_Array1OfSurfaceStyleElementSelect
") Assign;
		const StepVisual_Array1OfSurfaceStyleElementSelect & Assign (const StepVisual_Array1OfSurfaceStyleElementSelect & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfSurfaceStyleElementSelect &
	:rtype: StepVisual_Array1OfSurfaceStyleElementSelect
") operator =;
		const StepVisual_Array1OfSurfaceStyleElementSelect & operator = (const StepVisual_Array1OfSurfaceStyleElementSelect & Other);
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
	:type Value: StepVisual_SurfaceStyleElementSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_SurfaceStyleElementSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_SurfaceStyleElementSelect
") Value;
		const StepVisual_SurfaceStyleElementSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_SurfaceStyleElementSelect
") ChangeValue;
		StepVisual_SurfaceStyleElementSelect & ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfSurfaceStyleElementSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Array1OfTextOrCharacter;
class StepVisual_Array1OfTextOrCharacter {
	public:
		%feature("compactdefaultargs") StepVisual_Array1OfTextOrCharacter;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfTextOrCharacter;
		 StepVisual_Array1OfTextOrCharacter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_Array1OfTextOrCharacter;
		%feature("autodoc", "	:param Item:
	:type Item: StepVisual_TextOrCharacter &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_Array1OfTextOrCharacter;
		 StepVisual_Array1OfTextOrCharacter (const StepVisual_TextOrCharacter & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_TextOrCharacter &
	:rtype: None
") Init;
		void Init (const StepVisual_TextOrCharacter & V);
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
	:type Other: StepVisual_Array1OfTextOrCharacter &
	:rtype: StepVisual_Array1OfTextOrCharacter
") Assign;
		const StepVisual_Array1OfTextOrCharacter & Assign (const StepVisual_Array1OfTextOrCharacter & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepVisual_Array1OfTextOrCharacter &
	:rtype: StepVisual_Array1OfTextOrCharacter
") operator =;
		const StepVisual_Array1OfTextOrCharacter & operator = (const StepVisual_Array1OfTextOrCharacter & Other);
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
	:type Value: StepVisual_TextOrCharacter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_TextOrCharacter & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_TextOrCharacter
") Value;
		const StepVisual_TextOrCharacter & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_TextOrCharacter
") ChangeValue;
		StepVisual_TextOrCharacter & ChangeValue (const Standard_Integer Index);
};


%extend StepVisual_Array1OfTextOrCharacter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_BoxCharacteristicSelect;
class StepVisual_BoxCharacteristicSelect {
	public:
		%feature("compactdefaultargs") StepVisual_BoxCharacteristicSelect;
		%feature("autodoc", "	:rtype: None
") StepVisual_BoxCharacteristicSelect;
		 StepVisual_BoxCharacteristicSelect ();
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "	:rtype: int
") TypeOfContent;
		Standard_Integer TypeOfContent ();
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", "	:param aType:
	:type aType: int
	:rtype: None
") SetTypeOfContent;
		void SetTypeOfContent (const Standard_Integer aType);
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "	:rtype: float
") RealValue;
		Standard_Real RealValue ();
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: float
	:rtype: None
") SetRealValue;
		void SetRealValue (const Standard_Real aValue);
};


%extend StepVisual_BoxCharacteristicSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CameraImage;
class StepVisual_CameraImage : public StepRepr_MappedItem {
	public:
		%feature("compactdefaultargs") StepVisual_CameraImage;
		%feature("autodoc", "	* Returns a CameraImage

	:rtype: None
") StepVisual_CameraImage;
		 StepVisual_CameraImage ();
};


%extend StepVisual_CameraImage {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CameraImage(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CameraImage::Handle_StepVisual_CameraImage %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CameraImage;
class Handle_StepVisual_CameraImage : public Handle_StepRepr_MappedItem {

    public:
        // constructors
        Handle_StepVisual_CameraImage();
        Handle_StepVisual_CameraImage(const Handle_StepVisual_CameraImage &aHandle);
        Handle_StepVisual_CameraImage(const StepVisual_CameraImage *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CameraImage DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CameraImage {
    StepVisual_CameraImage* _get_reference() {
    return (StepVisual_CameraImage*)$self->Access();
    }
};

%extend Handle_StepVisual_CameraImage {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CameraImage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CameraModel;
class StepVisual_CameraModel : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepVisual_CameraModel;
		%feature("autodoc", "	* Returns a CameraModel

	:rtype: None
") StepVisual_CameraModel;
		 StepVisual_CameraModel ();
};


%extend StepVisual_CameraModel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CameraModel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CameraModel::Handle_StepVisual_CameraModel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CameraModel;
class Handle_StepVisual_CameraModel : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepVisual_CameraModel();
        Handle_StepVisual_CameraModel(const Handle_StepVisual_CameraModel &aHandle);
        Handle_StepVisual_CameraModel(const StepVisual_CameraModel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CameraModel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CameraModel {
    StepVisual_CameraModel* _get_reference() {
    return (StepVisual_CameraModel*)$self->Access();
    }
};

%extend Handle_StepVisual_CameraModel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CameraModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CameraUsage;
class StepVisual_CameraUsage : public StepRepr_RepresentationMap {
	public:
		%feature("compactdefaultargs") StepVisual_CameraUsage;
		%feature("autodoc", "	* Returns a CameraUsage

	:rtype: None
") StepVisual_CameraUsage;
		 StepVisual_CameraUsage ();
};


%extend StepVisual_CameraUsage {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CameraUsage(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CameraUsage::Handle_StepVisual_CameraUsage %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CameraUsage;
class Handle_StepVisual_CameraUsage : public Handle_StepRepr_RepresentationMap {

    public:
        // constructors
        Handle_StepVisual_CameraUsage();
        Handle_StepVisual_CameraUsage(const Handle_StepVisual_CameraUsage &aHandle);
        Handle_StepVisual_CameraUsage(const StepVisual_CameraUsage *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CameraUsage DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CameraUsage {
    StepVisual_CameraUsage* _get_reference() {
    return (StepVisual_CameraUsage*)$self->Access();
    }
};

%extend Handle_StepVisual_CameraUsage {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CameraUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Colour;
class StepVisual_Colour : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_Colour;
		%feature("autodoc", "	* Returns a Colour

	:rtype: None
") StepVisual_Colour;
		 StepVisual_Colour ();
};


%extend StepVisual_Colour {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_Colour(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_Colour::Handle_StepVisual_Colour %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_Colour;
class Handle_StepVisual_Colour : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_Colour();
        Handle_StepVisual_Colour(const Handle_StepVisual_Colour &aHandle);
        Handle_StepVisual_Colour(const StepVisual_Colour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_Colour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_Colour {
    StepVisual_Colour* _get_reference() {
    return (StepVisual_Colour*)$self->Access();
    }
};

%extend Handle_StepVisual_Colour {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_Colour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CompositeText;
class StepVisual_CompositeText : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepVisual_CompositeText;
		%feature("autodoc", "	* Returns a CompositeText

	:rtype: None
") StepVisual_CompositeText;
		 StepVisual_CompositeText ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCollectedText:
	:type aCollectedText: Handle_StepVisual_HArray1OfTextOrCharacter &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfTextOrCharacter & aCollectedText);
		%feature("compactdefaultargs") SetCollectedText;
		%feature("autodoc", "	:param aCollectedText:
	:type aCollectedText: Handle_StepVisual_HArray1OfTextOrCharacter &
	:rtype: None
") SetCollectedText;
		void SetCollectedText (const Handle_StepVisual_HArray1OfTextOrCharacter & aCollectedText);
		%feature("compactdefaultargs") CollectedText;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfTextOrCharacter
") CollectedText;
		Handle_StepVisual_HArray1OfTextOrCharacter CollectedText ();
		%feature("compactdefaultargs") CollectedTextValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepVisual_TextOrCharacter
") CollectedTextValue;
		StepVisual_TextOrCharacter CollectedTextValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbCollectedText;
		%feature("autodoc", "	:rtype: int
") NbCollectedText;
		Standard_Integer NbCollectedText ();
};


%extend StepVisual_CompositeText {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CompositeText(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CompositeText::Handle_StepVisual_CompositeText %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CompositeText;
class Handle_StepVisual_CompositeText : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepVisual_CompositeText();
        Handle_StepVisual_CompositeText(const Handle_StepVisual_CompositeText &aHandle);
        Handle_StepVisual_CompositeText(const StepVisual_CompositeText *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CompositeText DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CompositeText {
    StepVisual_CompositeText* _get_reference() {
    return (StepVisual_CompositeText*)$self->Access();
    }
};

%extend Handle_StepVisual_CompositeText {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CompositeText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CurveStyle;
class StepVisual_CurveStyle : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_CurveStyle;
		%feature("autodoc", "	* Returns a CurveStyle

	:rtype: None
") StepVisual_CurveStyle;
		 StepVisual_CurveStyle ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCurveFont:
	:type aCurveFont: StepVisual_CurveStyleFontSelect &
	:param aCurveWidth:
	:type aCurveWidth: StepBasic_SizeSelect &
	:param aCurveColour:
	:type aCurveColour: Handle_StepVisual_Colour &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepVisual_CurveStyleFontSelect & aCurveFont,const StepBasic_SizeSelect & aCurveWidth,const Handle_StepVisual_Colour & aCurveColour);
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
		%feature("compactdefaultargs") SetCurveFont;
		%feature("autodoc", "	:param aCurveFont:
	:type aCurveFont: StepVisual_CurveStyleFontSelect &
	:rtype: None
") SetCurveFont;
		void SetCurveFont (const StepVisual_CurveStyleFontSelect & aCurveFont);
		%feature("compactdefaultargs") CurveFont;
		%feature("autodoc", "	:rtype: StepVisual_CurveStyleFontSelect
") CurveFont;
		StepVisual_CurveStyleFontSelect CurveFont ();
		%feature("compactdefaultargs") SetCurveWidth;
		%feature("autodoc", "	:param aCurveWidth:
	:type aCurveWidth: StepBasic_SizeSelect &
	:rtype: None
") SetCurveWidth;
		void SetCurveWidth (const StepBasic_SizeSelect & aCurveWidth);
		%feature("compactdefaultargs") CurveWidth;
		%feature("autodoc", "	:rtype: StepBasic_SizeSelect
") CurveWidth;
		StepBasic_SizeSelect CurveWidth ();
		%feature("compactdefaultargs") SetCurveColour;
		%feature("autodoc", "	:param aCurveColour:
	:type aCurveColour: Handle_StepVisual_Colour &
	:rtype: None
") SetCurveColour;
		void SetCurveColour (const Handle_StepVisual_Colour & aCurveColour);
		%feature("compactdefaultargs") CurveColour;
		%feature("autodoc", "	:rtype: Handle_StepVisual_Colour
") CurveColour;
		Handle_StepVisual_Colour CurveColour ();
};


%extend StepVisual_CurveStyle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CurveStyle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CurveStyle::Handle_StepVisual_CurveStyle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CurveStyle;
class Handle_StepVisual_CurveStyle : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_CurveStyle();
        Handle_StepVisual_CurveStyle(const Handle_StepVisual_CurveStyle &aHandle);
        Handle_StepVisual_CurveStyle(const StepVisual_CurveStyle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CurveStyle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CurveStyle {
    StepVisual_CurveStyle* _get_reference() {
    return (StepVisual_CurveStyle*)$self->Access();
    }
};

%extend Handle_StepVisual_CurveStyle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CurveStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CurveStyleFont;
class StepVisual_CurveStyleFont : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_CurveStyleFont;
		%feature("autodoc", "	* Returns a CurveStyleFont

	:rtype: None
") StepVisual_CurveStyleFont;
		 StepVisual_CurveStyleFont ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPatternList:
	:type aPatternList: Handle_StepVisual_HArray1OfCurveStyleFontPattern &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfCurveStyleFontPattern & aPatternList);
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
		%feature("compactdefaultargs") SetPatternList;
		%feature("autodoc", "	:param aPatternList:
	:type aPatternList: Handle_StepVisual_HArray1OfCurveStyleFontPattern &
	:rtype: None
") SetPatternList;
		void SetPatternList (const Handle_StepVisual_HArray1OfCurveStyleFontPattern & aPatternList);
		%feature("compactdefaultargs") PatternList;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfCurveStyleFontPattern
") PatternList;
		Handle_StepVisual_HArray1OfCurveStyleFontPattern PatternList ();
		%feature("compactdefaultargs") PatternListValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepVisual_CurveStyleFontPattern
") PatternListValue;
		Handle_StepVisual_CurveStyleFontPattern PatternListValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbPatternList;
		%feature("autodoc", "	:rtype: int
") NbPatternList;
		Standard_Integer NbPatternList ();
};


%extend StepVisual_CurveStyleFont {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CurveStyleFont(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CurveStyleFont::Handle_StepVisual_CurveStyleFont %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CurveStyleFont;
class Handle_StepVisual_CurveStyleFont : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_CurveStyleFont();
        Handle_StepVisual_CurveStyleFont(const Handle_StepVisual_CurveStyleFont &aHandle);
        Handle_StepVisual_CurveStyleFont(const StepVisual_CurveStyleFont *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CurveStyleFont DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CurveStyleFont {
    StepVisual_CurveStyleFont* _get_reference() {
    return (StepVisual_CurveStyleFont*)$self->Access();
    }
};

%extend Handle_StepVisual_CurveStyleFont {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CurveStyleFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CurveStyleFontPattern;
class StepVisual_CurveStyleFontPattern : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_CurveStyleFontPattern;
		%feature("autodoc", "	* Returns a CurveStyleFontPattern

	:rtype: None
") StepVisual_CurveStyleFontPattern;
		 StepVisual_CurveStyleFontPattern ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aVisibleSegmentLength:
	:type aVisibleSegmentLength: float
	:param aInvisibleSegmentLength:
	:type aInvisibleSegmentLength: float
	:rtype: void
") Init;
		virtual void Init (const Standard_Real aVisibleSegmentLength,const Standard_Real aInvisibleSegmentLength);
		%feature("compactdefaultargs") SetVisibleSegmentLength;
		%feature("autodoc", "	:param aVisibleSegmentLength:
	:type aVisibleSegmentLength: float
	:rtype: None
") SetVisibleSegmentLength;
		void SetVisibleSegmentLength (const Standard_Real aVisibleSegmentLength);
		%feature("compactdefaultargs") VisibleSegmentLength;
		%feature("autodoc", "	:rtype: float
") VisibleSegmentLength;
		Standard_Real VisibleSegmentLength ();
		%feature("compactdefaultargs") SetInvisibleSegmentLength;
		%feature("autodoc", "	:param aInvisibleSegmentLength:
	:type aInvisibleSegmentLength: float
	:rtype: None
") SetInvisibleSegmentLength;
		void SetInvisibleSegmentLength (const Standard_Real aInvisibleSegmentLength);
		%feature("compactdefaultargs") InvisibleSegmentLength;
		%feature("autodoc", "	:rtype: float
") InvisibleSegmentLength;
		Standard_Real InvisibleSegmentLength ();
};


%extend StepVisual_CurveStyleFontPattern {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CurveStyleFontPattern(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CurveStyleFontPattern::Handle_StepVisual_CurveStyleFontPattern %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CurveStyleFontPattern;
class Handle_StepVisual_CurveStyleFontPattern : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_CurveStyleFontPattern();
        Handle_StepVisual_CurveStyleFontPattern(const Handle_StepVisual_CurveStyleFontPattern &aHandle);
        Handle_StepVisual_CurveStyleFontPattern(const StepVisual_CurveStyleFontPattern *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CurveStyleFontPattern DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CurveStyleFontPattern {
    StepVisual_CurveStyleFontPattern* _get_reference() {
    return (StepVisual_CurveStyleFontPattern*)$self->Access();
    }
};

%extend Handle_StepVisual_CurveStyleFontPattern {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CurveStyleFontPattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CurveStyleFontSelect;
class StepVisual_CurveStyleFontSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_CurveStyleFontSelect;
		%feature("autodoc", "	* Returns a CurveStyleFontSelect SelectType

	:rtype: None
") StepVisual_CurveStyleFontSelect;
		 StepVisual_CurveStyleFontSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a CurveStyleFontSelect Kind Entity that is : 1 -> CurveStyleFont 2 -> PreDefinedCurveFont 3 -> ExternallyDefinedCurveFont 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CurveStyleFont;
		%feature("autodoc", "	* returns Value as a CurveStyleFont (Null if another type)

	:rtype: Handle_StepVisual_CurveStyleFont
") CurveStyleFont;
		Handle_StepVisual_CurveStyleFont CurveStyleFont ();
		%feature("compactdefaultargs") PreDefinedCurveFont;
		%feature("autodoc", "	* returns Value as a PreDefinedCurveFont (Null if another type)

	:rtype: Handle_StepVisual_PreDefinedCurveFont
") PreDefinedCurveFont;
		Handle_StepVisual_PreDefinedCurveFont PreDefinedCurveFont ();
		%feature("compactdefaultargs") ExternallyDefinedCurveFont;
		%feature("autodoc", "	* returns Value as a ExternallyDefinedCurveFont (Null if another type)

	:rtype: Handle_StepVisual_ExternallyDefinedCurveFont
") ExternallyDefinedCurveFont;
		Handle_StepVisual_ExternallyDefinedCurveFont ExternallyDefinedCurveFont ();
};


%extend StepVisual_CurveStyleFontSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_DirectionCountSelect;
class StepVisual_DirectionCountSelect {
	public:
		%feature("compactdefaultargs") StepVisual_DirectionCountSelect;
		%feature("autodoc", "	:rtype: None
") StepVisual_DirectionCountSelect;
		 StepVisual_DirectionCountSelect ();
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", "	:param aTypeOfContent:
	:type aTypeOfContent: int
	:rtype: None
") SetTypeOfContent;
		void SetTypeOfContent (const Standard_Integer aTypeOfContent);
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "	:rtype: int
") TypeOfContent;
		Standard_Integer TypeOfContent ();
		%feature("compactdefaultargs") UDirectionCount;
		%feature("autodoc", "	:rtype: int
") UDirectionCount;
		Standard_Integer UDirectionCount ();
		%feature("compactdefaultargs") SetUDirectionCount;
		%feature("autodoc", "	:param aUDirectionCount:
	:type aUDirectionCount: int
	:rtype: None
") SetUDirectionCount;
		void SetUDirectionCount (const Standard_Integer aUDirectionCount);
		%feature("compactdefaultargs") VDirectionCount;
		%feature("autodoc", "	:rtype: int
") VDirectionCount;
		Standard_Integer VDirectionCount ();
		%feature("compactdefaultargs") SetVDirectionCount;
		%feature("autodoc", "	:param aUDirectionCount:
	:type aUDirectionCount: int
	:rtype: None
") SetVDirectionCount;
		void SetVDirectionCount (const Standard_Integer aUDirectionCount);
};


%extend StepVisual_DirectionCountSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_DraughtingModel;
class StepVisual_DraughtingModel : public StepRepr_Representation {
	public:
		%feature("compactdefaultargs") StepVisual_DraughtingModel;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepVisual_DraughtingModel;
		 StepVisual_DraughtingModel ();
};


%extend StepVisual_DraughtingModel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_DraughtingModel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_DraughtingModel::Handle_StepVisual_DraughtingModel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_DraughtingModel;
class Handle_StepVisual_DraughtingModel : public Handle_StepRepr_Representation {

    public:
        // constructors
        Handle_StepVisual_DraughtingModel();
        Handle_StepVisual_DraughtingModel(const Handle_StepVisual_DraughtingModel &aHandle);
        Handle_StepVisual_DraughtingModel(const StepVisual_DraughtingModel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_DraughtingModel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_DraughtingModel {
    StepVisual_DraughtingModel* _get_reference() {
    return (StepVisual_DraughtingModel*)$self->Access();
    }
};

%extend Handle_StepVisual_DraughtingModel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_DraughtingModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_ExternallyDefinedCurveFont;
class StepVisual_ExternallyDefinedCurveFont : public StepBasic_ExternallyDefinedItem {
	public:
		%feature("compactdefaultargs") StepVisual_ExternallyDefinedCurveFont;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepVisual_ExternallyDefinedCurveFont;
		 StepVisual_ExternallyDefinedCurveFont ();
};


%extend StepVisual_ExternallyDefinedCurveFont {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_ExternallyDefinedCurveFont(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_ExternallyDefinedCurveFont::Handle_StepVisual_ExternallyDefinedCurveFont %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_ExternallyDefinedCurveFont;
class Handle_StepVisual_ExternallyDefinedCurveFont : public Handle_StepBasic_ExternallyDefinedItem {

    public:
        // constructors
        Handle_StepVisual_ExternallyDefinedCurveFont();
        Handle_StepVisual_ExternallyDefinedCurveFont(const Handle_StepVisual_ExternallyDefinedCurveFont &aHandle);
        Handle_StepVisual_ExternallyDefinedCurveFont(const StepVisual_ExternallyDefinedCurveFont *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_ExternallyDefinedCurveFont DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_ExternallyDefinedCurveFont {
    StepVisual_ExternallyDefinedCurveFont* _get_reference() {
    return (StepVisual_ExternallyDefinedCurveFont*)$self->Access();
    }
};

%extend Handle_StepVisual_ExternallyDefinedCurveFont {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_ExternallyDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_ExternallyDefinedTextFont;
class StepVisual_ExternallyDefinedTextFont : public StepBasic_ExternallyDefinedItem {
	public:
		%feature("compactdefaultargs") StepVisual_ExternallyDefinedTextFont;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepVisual_ExternallyDefinedTextFont;
		 StepVisual_ExternallyDefinedTextFont ();
};


%extend StepVisual_ExternallyDefinedTextFont {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_ExternallyDefinedTextFont(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_ExternallyDefinedTextFont::Handle_StepVisual_ExternallyDefinedTextFont %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_ExternallyDefinedTextFont;
class Handle_StepVisual_ExternallyDefinedTextFont : public Handle_StepBasic_ExternallyDefinedItem {

    public:
        // constructors
        Handle_StepVisual_ExternallyDefinedTextFont();
        Handle_StepVisual_ExternallyDefinedTextFont(const Handle_StepVisual_ExternallyDefinedTextFont &aHandle);
        Handle_StepVisual_ExternallyDefinedTextFont(const StepVisual_ExternallyDefinedTextFont *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_ExternallyDefinedTextFont DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_ExternallyDefinedTextFont {
    StepVisual_ExternallyDefinedTextFont* _get_reference() {
    return (StepVisual_ExternallyDefinedTextFont*)$self->Access();
    }
};

%extend Handle_StepVisual_ExternallyDefinedTextFont {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_ExternallyDefinedTextFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_FillAreaStyle;
class StepVisual_FillAreaStyle : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_FillAreaStyle;
		%feature("autodoc", "	* Returns a FillAreaStyle

	:rtype: None
") StepVisual_FillAreaStyle;
		 StepVisual_FillAreaStyle ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aFillStyles:
	:type aFillStyles: Handle_StepVisual_HArray1OfFillStyleSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfFillStyleSelect & aFillStyles);
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
		%feature("compactdefaultargs") SetFillStyles;
		%feature("autodoc", "	:param aFillStyles:
	:type aFillStyles: Handle_StepVisual_HArray1OfFillStyleSelect &
	:rtype: None
") SetFillStyles;
		void SetFillStyles (const Handle_StepVisual_HArray1OfFillStyleSelect & aFillStyles);
		%feature("compactdefaultargs") FillStyles;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfFillStyleSelect
") FillStyles;
		Handle_StepVisual_HArray1OfFillStyleSelect FillStyles ();
		%feature("compactdefaultargs") FillStylesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepVisual_FillStyleSelect
") FillStylesValue;
		StepVisual_FillStyleSelect FillStylesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbFillStyles;
		%feature("autodoc", "	:rtype: int
") NbFillStyles;
		Standard_Integer NbFillStyles ();
};


%extend StepVisual_FillAreaStyle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_FillAreaStyle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_FillAreaStyle::Handle_StepVisual_FillAreaStyle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_FillAreaStyle;
class Handle_StepVisual_FillAreaStyle : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_FillAreaStyle();
        Handle_StepVisual_FillAreaStyle(const Handle_StepVisual_FillAreaStyle &aHandle);
        Handle_StepVisual_FillAreaStyle(const StepVisual_FillAreaStyle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_FillAreaStyle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_FillAreaStyle {
    StepVisual_FillAreaStyle* _get_reference() {
    return (StepVisual_FillAreaStyle*)$self->Access();
    }
};

%extend Handle_StepVisual_FillAreaStyle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_FillAreaStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_FillAreaStyleColour;
class StepVisual_FillAreaStyleColour : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_FillAreaStyleColour;
		%feature("autodoc", "	* Returns a FillAreaStyleColour

	:rtype: None
") StepVisual_FillAreaStyleColour;
		 StepVisual_FillAreaStyleColour ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aFillColour:
	:type aFillColour: Handle_StepVisual_Colour &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_Colour & aFillColour);
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
		%feature("compactdefaultargs") SetFillColour;
		%feature("autodoc", "	:param aFillColour:
	:type aFillColour: Handle_StepVisual_Colour &
	:rtype: None
") SetFillColour;
		void SetFillColour (const Handle_StepVisual_Colour & aFillColour);
		%feature("compactdefaultargs") FillColour;
		%feature("autodoc", "	:rtype: Handle_StepVisual_Colour
") FillColour;
		Handle_StepVisual_Colour FillColour ();
};


%extend StepVisual_FillAreaStyleColour {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_FillAreaStyleColour(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_FillAreaStyleColour::Handle_StepVisual_FillAreaStyleColour %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_FillAreaStyleColour;
class Handle_StepVisual_FillAreaStyleColour : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_FillAreaStyleColour();
        Handle_StepVisual_FillAreaStyleColour(const Handle_StepVisual_FillAreaStyleColour &aHandle);
        Handle_StepVisual_FillAreaStyleColour(const StepVisual_FillAreaStyleColour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_FillAreaStyleColour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_FillAreaStyleColour {
    StepVisual_FillAreaStyleColour* _get_reference() {
    return (StepVisual_FillAreaStyleColour*)$self->Access();
    }
};

%extend Handle_StepVisual_FillAreaStyleColour {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_FillAreaStyleColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_FillStyleSelect;
class StepVisual_FillStyleSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_FillStyleSelect;
		%feature("autodoc", "	* Returns a FillStyleSelect SelectType

	:rtype: None
") StepVisual_FillStyleSelect;
		 StepVisual_FillStyleSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a FillStyleSelect Kind Entity that is : 1 -> FillAreaStyleColour 2 -> ExternallyDefinedTileStyle 3 -> FillAreaStyleTiles 4 -> ExternallyDefinedHatchStyle 5 -> FillAreaStyleHatching 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") FillAreaStyleColour;
		%feature("autodoc", "	* returns Value as a FillAreaStyleColour (Null if another type)

	:rtype: Handle_StepVisual_FillAreaStyleColour
") FillAreaStyleColour;
		Handle_StepVisual_FillAreaStyleColour FillAreaStyleColour ();
};


%extend StepVisual_FillStyleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_FontSelect;
class StepVisual_FontSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_FontSelect;
		%feature("autodoc", "	* Returns a FontSelect SelectType

	:rtype: None
") StepVisual_FontSelect;
		 StepVisual_FontSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a FontSelect Kind Entity that is : 1 -> PreDefinedTextFont 2 -> ExternallyDefinedTextFont 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") PreDefinedTextFont;
		%feature("autodoc", "	* returns Value as a PreDefinedTextFont (Null if another type)

	:rtype: Handle_StepVisual_PreDefinedTextFont
") PreDefinedTextFont;
		Handle_StepVisual_PreDefinedTextFont PreDefinedTextFont ();
		%feature("compactdefaultargs") ExternallyDefinedTextFont;
		%feature("autodoc", "	* returns Value as a ExternallyDefinedTextFont (Null if another type)

	:rtype: Handle_StepVisual_ExternallyDefinedTextFont
") ExternallyDefinedTextFont;
		Handle_StepVisual_ExternallyDefinedTextFont ExternallyDefinedTextFont ();
};


%extend StepVisual_FontSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfBoxCharacteristicSelect;
class StepVisual_HArray1OfBoxCharacteristicSelect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfBoxCharacteristicSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfBoxCharacteristicSelect;
		 StepVisual_HArray1OfBoxCharacteristicSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfBoxCharacteristicSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepVisual_BoxCharacteristicSelect &
	:rtype: None
") StepVisual_HArray1OfBoxCharacteristicSelect;
		 StepVisual_HArray1OfBoxCharacteristicSelect (const Standard_Integer Low,const Standard_Integer Up,const StepVisual_BoxCharacteristicSelect & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_BoxCharacteristicSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_BoxCharacteristicSelect & V);
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
	:type Value: StepVisual_BoxCharacteristicSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_BoxCharacteristicSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_BoxCharacteristicSelect
") Value;
		const StepVisual_BoxCharacteristicSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_BoxCharacteristicSelect
") ChangeValue;
		StepVisual_BoxCharacteristicSelect & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfBoxCharacteristicSelect
") Array1;
		const StepVisual_Array1OfBoxCharacteristicSelect & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfBoxCharacteristicSelect
") ChangeArray1;
		StepVisual_Array1OfBoxCharacteristicSelect & ChangeArray1 ();
};


%extend StepVisual_HArray1OfBoxCharacteristicSelect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfBoxCharacteristicSelect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfBoxCharacteristicSelect::Handle_StepVisual_HArray1OfBoxCharacteristicSelect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfBoxCharacteristicSelect;
class Handle_StepVisual_HArray1OfBoxCharacteristicSelect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfBoxCharacteristicSelect();
        Handle_StepVisual_HArray1OfBoxCharacteristicSelect(const Handle_StepVisual_HArray1OfBoxCharacteristicSelect &aHandle);
        Handle_StepVisual_HArray1OfBoxCharacteristicSelect(const StepVisual_HArray1OfBoxCharacteristicSelect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfBoxCharacteristicSelect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfBoxCharacteristicSelect {
    StepVisual_HArray1OfBoxCharacteristicSelect* _get_reference() {
    return (StepVisual_HArray1OfBoxCharacteristicSelect*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfBoxCharacteristicSelect {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfBoxCharacteristicSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfCurveStyleFontPattern;
class StepVisual_HArray1OfCurveStyleFontPattern : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfCurveStyleFontPattern;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfCurveStyleFontPattern;
		 StepVisual_HArray1OfCurveStyleFontPattern (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfCurveStyleFontPattern;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepVisual_CurveStyleFontPattern &
	:rtype: None
") StepVisual_HArray1OfCurveStyleFontPattern;
		 StepVisual_HArray1OfCurveStyleFontPattern (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepVisual_CurveStyleFontPattern & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepVisual_CurveStyleFontPattern &
	:rtype: None
") Init;
		void Init (const Handle_StepVisual_CurveStyleFontPattern & V);
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
	:type Value: Handle_StepVisual_CurveStyleFontPattern &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepVisual_CurveStyleFontPattern & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepVisual_CurveStyleFontPattern
") Value;
		Handle_StepVisual_CurveStyleFontPattern Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepVisual_CurveStyleFontPattern
") ChangeValue;
		Handle_StepVisual_CurveStyleFontPattern ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfCurveStyleFontPattern
") Array1;
		const StepVisual_Array1OfCurveStyleFontPattern & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfCurveStyleFontPattern
") ChangeArray1;
		StepVisual_Array1OfCurveStyleFontPattern & ChangeArray1 ();
};


%extend StepVisual_HArray1OfCurveStyleFontPattern {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfCurveStyleFontPattern(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfCurveStyleFontPattern::Handle_StepVisual_HArray1OfCurveStyleFontPattern %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfCurveStyleFontPattern;
class Handle_StepVisual_HArray1OfCurveStyleFontPattern : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfCurveStyleFontPattern();
        Handle_StepVisual_HArray1OfCurveStyleFontPattern(const Handle_StepVisual_HArray1OfCurveStyleFontPattern &aHandle);
        Handle_StepVisual_HArray1OfCurveStyleFontPattern(const StepVisual_HArray1OfCurveStyleFontPattern *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfCurveStyleFontPattern DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfCurveStyleFontPattern {
    StepVisual_HArray1OfCurveStyleFontPattern* _get_reference() {
    return (StepVisual_HArray1OfCurveStyleFontPattern*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfCurveStyleFontPattern {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfCurveStyleFontPattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfDirectionCountSelect;
class StepVisual_HArray1OfDirectionCountSelect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfDirectionCountSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfDirectionCountSelect;
		 StepVisual_HArray1OfDirectionCountSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfDirectionCountSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepVisual_DirectionCountSelect &
	:rtype: None
") StepVisual_HArray1OfDirectionCountSelect;
		 StepVisual_HArray1OfDirectionCountSelect (const Standard_Integer Low,const Standard_Integer Up,const StepVisual_DirectionCountSelect & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_DirectionCountSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_DirectionCountSelect & V);
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
	:type Value: StepVisual_DirectionCountSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_DirectionCountSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_DirectionCountSelect
") Value;
		const StepVisual_DirectionCountSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_DirectionCountSelect
") ChangeValue;
		StepVisual_DirectionCountSelect & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfDirectionCountSelect
") Array1;
		const StepVisual_Array1OfDirectionCountSelect & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfDirectionCountSelect
") ChangeArray1;
		StepVisual_Array1OfDirectionCountSelect & ChangeArray1 ();
};


%extend StepVisual_HArray1OfDirectionCountSelect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfDirectionCountSelect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfDirectionCountSelect::Handle_StepVisual_HArray1OfDirectionCountSelect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfDirectionCountSelect;
class Handle_StepVisual_HArray1OfDirectionCountSelect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfDirectionCountSelect();
        Handle_StepVisual_HArray1OfDirectionCountSelect(const Handle_StepVisual_HArray1OfDirectionCountSelect &aHandle);
        Handle_StepVisual_HArray1OfDirectionCountSelect(const StepVisual_HArray1OfDirectionCountSelect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfDirectionCountSelect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfDirectionCountSelect {
    StepVisual_HArray1OfDirectionCountSelect* _get_reference() {
    return (StepVisual_HArray1OfDirectionCountSelect*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfDirectionCountSelect {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfDirectionCountSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfFillStyleSelect;
class StepVisual_HArray1OfFillStyleSelect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfFillStyleSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfFillStyleSelect;
		 StepVisual_HArray1OfFillStyleSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfFillStyleSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepVisual_FillStyleSelect &
	:rtype: None
") StepVisual_HArray1OfFillStyleSelect;
		 StepVisual_HArray1OfFillStyleSelect (const Standard_Integer Low,const Standard_Integer Up,const StepVisual_FillStyleSelect & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_FillStyleSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_FillStyleSelect & V);
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
	:type Value: StepVisual_FillStyleSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_FillStyleSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_FillStyleSelect
") Value;
		const StepVisual_FillStyleSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_FillStyleSelect
") ChangeValue;
		StepVisual_FillStyleSelect & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfFillStyleSelect
") Array1;
		const StepVisual_Array1OfFillStyleSelect & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfFillStyleSelect
") ChangeArray1;
		StepVisual_Array1OfFillStyleSelect & ChangeArray1 ();
};


%extend StepVisual_HArray1OfFillStyleSelect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfFillStyleSelect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfFillStyleSelect::Handle_StepVisual_HArray1OfFillStyleSelect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfFillStyleSelect;
class Handle_StepVisual_HArray1OfFillStyleSelect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfFillStyleSelect();
        Handle_StepVisual_HArray1OfFillStyleSelect(const Handle_StepVisual_HArray1OfFillStyleSelect &aHandle);
        Handle_StepVisual_HArray1OfFillStyleSelect(const StepVisual_HArray1OfFillStyleSelect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfFillStyleSelect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfFillStyleSelect {
    StepVisual_HArray1OfFillStyleSelect* _get_reference() {
    return (StepVisual_HArray1OfFillStyleSelect*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfFillStyleSelect {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfFillStyleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfInvisibleItem;
class StepVisual_HArray1OfInvisibleItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfInvisibleItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfInvisibleItem;
		 StepVisual_HArray1OfInvisibleItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfInvisibleItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepVisual_InvisibleItem &
	:rtype: None
") StepVisual_HArray1OfInvisibleItem;
		 StepVisual_HArray1OfInvisibleItem (const Standard_Integer Low,const Standard_Integer Up,const StepVisual_InvisibleItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_InvisibleItem &
	:rtype: None
") Init;
		void Init (const StepVisual_InvisibleItem & V);
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
	:type Value: StepVisual_InvisibleItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_InvisibleItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_InvisibleItem
") Value;
		const StepVisual_InvisibleItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_InvisibleItem
") ChangeValue;
		StepVisual_InvisibleItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfInvisibleItem
") Array1;
		const StepVisual_Array1OfInvisibleItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfInvisibleItem
") ChangeArray1;
		StepVisual_Array1OfInvisibleItem & ChangeArray1 ();
};


%extend StepVisual_HArray1OfInvisibleItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfInvisibleItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfInvisibleItem::Handle_StepVisual_HArray1OfInvisibleItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfInvisibleItem;
class Handle_StepVisual_HArray1OfInvisibleItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfInvisibleItem();
        Handle_StepVisual_HArray1OfInvisibleItem(const Handle_StepVisual_HArray1OfInvisibleItem &aHandle);
        Handle_StepVisual_HArray1OfInvisibleItem(const StepVisual_HArray1OfInvisibleItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfInvisibleItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfInvisibleItem {
    StepVisual_HArray1OfInvisibleItem* _get_reference() {
    return (StepVisual_HArray1OfInvisibleItem*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfInvisibleItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfInvisibleItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfLayeredItem;
class StepVisual_HArray1OfLayeredItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfLayeredItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfLayeredItem;
		 StepVisual_HArray1OfLayeredItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfLayeredItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepVisual_LayeredItem &
	:rtype: None
") StepVisual_HArray1OfLayeredItem;
		 StepVisual_HArray1OfLayeredItem (const Standard_Integer Low,const Standard_Integer Up,const StepVisual_LayeredItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_LayeredItem &
	:rtype: None
") Init;
		void Init (const StepVisual_LayeredItem & V);
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
	:type Value: StepVisual_LayeredItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_LayeredItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_LayeredItem
") Value;
		const StepVisual_LayeredItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_LayeredItem
") ChangeValue;
		StepVisual_LayeredItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfLayeredItem
") Array1;
		const StepVisual_Array1OfLayeredItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfLayeredItem
") ChangeArray1;
		StepVisual_Array1OfLayeredItem & ChangeArray1 ();
};


%extend StepVisual_HArray1OfLayeredItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfLayeredItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfLayeredItem::Handle_StepVisual_HArray1OfLayeredItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfLayeredItem;
class Handle_StepVisual_HArray1OfLayeredItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfLayeredItem();
        Handle_StepVisual_HArray1OfLayeredItem(const Handle_StepVisual_HArray1OfLayeredItem &aHandle);
        Handle_StepVisual_HArray1OfLayeredItem(const StepVisual_HArray1OfLayeredItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfLayeredItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfLayeredItem {
    StepVisual_HArray1OfLayeredItem* _get_reference() {
    return (StepVisual_HArray1OfLayeredItem*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfLayeredItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfLayeredItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfPresentationStyleAssignment;
class StepVisual_HArray1OfPresentationStyleAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfPresentationStyleAssignment;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfPresentationStyleAssignment;
		 StepVisual_HArray1OfPresentationStyleAssignment (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfPresentationStyleAssignment;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepVisual_PresentationStyleAssignment &
	:rtype: None
") StepVisual_HArray1OfPresentationStyleAssignment;
		 StepVisual_HArray1OfPresentationStyleAssignment (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepVisual_PresentationStyleAssignment & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepVisual_PresentationStyleAssignment &
	:rtype: None
") Init;
		void Init (const Handle_StepVisual_PresentationStyleAssignment & V);
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
	:type Value: Handle_StepVisual_PresentationStyleAssignment &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepVisual_PresentationStyleAssignment & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepVisual_PresentationStyleAssignment
") Value;
		Handle_StepVisual_PresentationStyleAssignment Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepVisual_PresentationStyleAssignment
") ChangeValue;
		Handle_StepVisual_PresentationStyleAssignment ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfPresentationStyleAssignment
") Array1;
		const StepVisual_Array1OfPresentationStyleAssignment & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfPresentationStyleAssignment
") ChangeArray1;
		StepVisual_Array1OfPresentationStyleAssignment & ChangeArray1 ();
};


%extend StepVisual_HArray1OfPresentationStyleAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfPresentationStyleAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfPresentationStyleAssignment::Handle_StepVisual_HArray1OfPresentationStyleAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfPresentationStyleAssignment;
class Handle_StepVisual_HArray1OfPresentationStyleAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfPresentationStyleAssignment();
        Handle_StepVisual_HArray1OfPresentationStyleAssignment(const Handle_StepVisual_HArray1OfPresentationStyleAssignment &aHandle);
        Handle_StepVisual_HArray1OfPresentationStyleAssignment(const StepVisual_HArray1OfPresentationStyleAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfPresentationStyleAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfPresentationStyleAssignment {
    StepVisual_HArray1OfPresentationStyleAssignment* _get_reference() {
    return (StepVisual_HArray1OfPresentationStyleAssignment*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfPresentationStyleAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfPresentationStyleAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfPresentationStyleSelect;
class StepVisual_HArray1OfPresentationStyleSelect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfPresentationStyleSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfPresentationStyleSelect;
		 StepVisual_HArray1OfPresentationStyleSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfPresentationStyleSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepVisual_PresentationStyleSelect &
	:rtype: None
") StepVisual_HArray1OfPresentationStyleSelect;
		 StepVisual_HArray1OfPresentationStyleSelect (const Standard_Integer Low,const Standard_Integer Up,const StepVisual_PresentationStyleSelect & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_PresentationStyleSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_PresentationStyleSelect & V);
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
	:type Value: StepVisual_PresentationStyleSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_PresentationStyleSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_PresentationStyleSelect
") Value;
		const StepVisual_PresentationStyleSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_PresentationStyleSelect
") ChangeValue;
		StepVisual_PresentationStyleSelect & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfPresentationStyleSelect
") Array1;
		const StepVisual_Array1OfPresentationStyleSelect & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfPresentationStyleSelect
") ChangeArray1;
		StepVisual_Array1OfPresentationStyleSelect & ChangeArray1 ();
};


%extend StepVisual_HArray1OfPresentationStyleSelect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfPresentationStyleSelect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfPresentationStyleSelect::Handle_StepVisual_HArray1OfPresentationStyleSelect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfPresentationStyleSelect;
class Handle_StepVisual_HArray1OfPresentationStyleSelect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfPresentationStyleSelect();
        Handle_StepVisual_HArray1OfPresentationStyleSelect(const Handle_StepVisual_HArray1OfPresentationStyleSelect &aHandle);
        Handle_StepVisual_HArray1OfPresentationStyleSelect(const StepVisual_HArray1OfPresentationStyleSelect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfPresentationStyleSelect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfPresentationStyleSelect {
    StepVisual_HArray1OfPresentationStyleSelect* _get_reference() {
    return (StepVisual_HArray1OfPresentationStyleSelect*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfPresentationStyleSelect {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfPresentationStyleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfStyleContextSelect;
class StepVisual_HArray1OfStyleContextSelect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfStyleContextSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfStyleContextSelect;
		 StepVisual_HArray1OfStyleContextSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfStyleContextSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepVisual_StyleContextSelect &
	:rtype: None
") StepVisual_HArray1OfStyleContextSelect;
		 StepVisual_HArray1OfStyleContextSelect (const Standard_Integer Low,const Standard_Integer Up,const StepVisual_StyleContextSelect & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_StyleContextSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_StyleContextSelect & V);
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
	:type Value: StepVisual_StyleContextSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_StyleContextSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_StyleContextSelect
") Value;
		const StepVisual_StyleContextSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_StyleContextSelect
") ChangeValue;
		StepVisual_StyleContextSelect & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfStyleContextSelect
") Array1;
		const StepVisual_Array1OfStyleContextSelect & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfStyleContextSelect
") ChangeArray1;
		StepVisual_Array1OfStyleContextSelect & ChangeArray1 ();
};


%extend StepVisual_HArray1OfStyleContextSelect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfStyleContextSelect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfStyleContextSelect::Handle_StepVisual_HArray1OfStyleContextSelect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfStyleContextSelect;
class Handle_StepVisual_HArray1OfStyleContextSelect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfStyleContextSelect();
        Handle_StepVisual_HArray1OfStyleContextSelect(const Handle_StepVisual_HArray1OfStyleContextSelect &aHandle);
        Handle_StepVisual_HArray1OfStyleContextSelect(const StepVisual_HArray1OfStyleContextSelect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfStyleContextSelect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfStyleContextSelect {
    StepVisual_HArray1OfStyleContextSelect* _get_reference() {
    return (StepVisual_HArray1OfStyleContextSelect*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfStyleContextSelect {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfStyleContextSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfSurfaceStyleElementSelect;
class StepVisual_HArray1OfSurfaceStyleElementSelect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfSurfaceStyleElementSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfSurfaceStyleElementSelect;
		 StepVisual_HArray1OfSurfaceStyleElementSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfSurfaceStyleElementSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepVisual_SurfaceStyleElementSelect &
	:rtype: None
") StepVisual_HArray1OfSurfaceStyleElementSelect;
		 StepVisual_HArray1OfSurfaceStyleElementSelect (const Standard_Integer Low,const Standard_Integer Up,const StepVisual_SurfaceStyleElementSelect & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_SurfaceStyleElementSelect &
	:rtype: None
") Init;
		void Init (const StepVisual_SurfaceStyleElementSelect & V);
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
	:type Value: StepVisual_SurfaceStyleElementSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_SurfaceStyleElementSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_SurfaceStyleElementSelect
") Value;
		const StepVisual_SurfaceStyleElementSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_SurfaceStyleElementSelect
") ChangeValue;
		StepVisual_SurfaceStyleElementSelect & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfSurfaceStyleElementSelect
") Array1;
		const StepVisual_Array1OfSurfaceStyleElementSelect & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfSurfaceStyleElementSelect
") ChangeArray1;
		StepVisual_Array1OfSurfaceStyleElementSelect & ChangeArray1 ();
};


%extend StepVisual_HArray1OfSurfaceStyleElementSelect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfSurfaceStyleElementSelect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfSurfaceStyleElementSelect::Handle_StepVisual_HArray1OfSurfaceStyleElementSelect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfSurfaceStyleElementSelect;
class Handle_StepVisual_HArray1OfSurfaceStyleElementSelect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfSurfaceStyleElementSelect();
        Handle_StepVisual_HArray1OfSurfaceStyleElementSelect(const Handle_StepVisual_HArray1OfSurfaceStyleElementSelect &aHandle);
        Handle_StepVisual_HArray1OfSurfaceStyleElementSelect(const StepVisual_HArray1OfSurfaceStyleElementSelect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfSurfaceStyleElementSelect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfSurfaceStyleElementSelect {
    StepVisual_HArray1OfSurfaceStyleElementSelect* _get_reference() {
    return (StepVisual_HArray1OfSurfaceStyleElementSelect*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfSurfaceStyleElementSelect {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfSurfaceStyleElementSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_HArray1OfTextOrCharacter;
class StepVisual_HArray1OfTextOrCharacter : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_HArray1OfTextOrCharacter;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepVisual_HArray1OfTextOrCharacter;
		 StepVisual_HArray1OfTextOrCharacter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepVisual_HArray1OfTextOrCharacter;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepVisual_TextOrCharacter &
	:rtype: None
") StepVisual_HArray1OfTextOrCharacter;
		 StepVisual_HArray1OfTextOrCharacter (const Standard_Integer Low,const Standard_Integer Up,const StepVisual_TextOrCharacter & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepVisual_TextOrCharacter &
	:rtype: None
") Init;
		void Init (const StepVisual_TextOrCharacter & V);
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
	:type Value: StepVisual_TextOrCharacter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepVisual_TextOrCharacter & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_TextOrCharacter
") Value;
		const StepVisual_TextOrCharacter & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepVisual_TextOrCharacter
") ChangeValue;
		StepVisual_TextOrCharacter & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfTextOrCharacter
") Array1;
		const StepVisual_Array1OfTextOrCharacter & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepVisual_Array1OfTextOrCharacter
") ChangeArray1;
		StepVisual_Array1OfTextOrCharacter & ChangeArray1 ();
};


%extend StepVisual_HArray1OfTextOrCharacter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_HArray1OfTextOrCharacter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_HArray1OfTextOrCharacter::Handle_StepVisual_HArray1OfTextOrCharacter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_HArray1OfTextOrCharacter;
class Handle_StepVisual_HArray1OfTextOrCharacter : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_HArray1OfTextOrCharacter();
        Handle_StepVisual_HArray1OfTextOrCharacter(const Handle_StepVisual_HArray1OfTextOrCharacter &aHandle);
        Handle_StepVisual_HArray1OfTextOrCharacter(const StepVisual_HArray1OfTextOrCharacter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_HArray1OfTextOrCharacter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_HArray1OfTextOrCharacter {
    StepVisual_HArray1OfTextOrCharacter* _get_reference() {
    return (StepVisual_HArray1OfTextOrCharacter*)$self->Access();
    }
};

%extend Handle_StepVisual_HArray1OfTextOrCharacter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_HArray1OfTextOrCharacter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Invisibility;
class StepVisual_Invisibility : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_Invisibility;
		%feature("autodoc", "	* Returns a Invisibility

	:rtype: None
") StepVisual_Invisibility;
		 StepVisual_Invisibility ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aInvisibleItems:
	:type aInvisibleItems: Handle_StepVisual_HArray1OfInvisibleItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_HArray1OfInvisibleItem & aInvisibleItems);
		%feature("compactdefaultargs") SetInvisibleItems;
		%feature("autodoc", "	:param aInvisibleItems:
	:type aInvisibleItems: Handle_StepVisual_HArray1OfInvisibleItem &
	:rtype: None
") SetInvisibleItems;
		void SetInvisibleItems (const Handle_StepVisual_HArray1OfInvisibleItem & aInvisibleItems);
		%feature("compactdefaultargs") InvisibleItems;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfInvisibleItem
") InvisibleItems;
		Handle_StepVisual_HArray1OfInvisibleItem InvisibleItems ();
		%feature("compactdefaultargs") InvisibleItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepVisual_InvisibleItem
") InvisibleItemsValue;
		StepVisual_InvisibleItem InvisibleItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbInvisibleItems;
		%feature("autodoc", "	:rtype: int
") NbInvisibleItems;
		Standard_Integer NbInvisibleItems ();
};


%extend StepVisual_Invisibility {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_Invisibility(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_Invisibility::Handle_StepVisual_Invisibility %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_Invisibility;
class Handle_StepVisual_Invisibility : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_Invisibility();
        Handle_StepVisual_Invisibility(const Handle_StepVisual_Invisibility &aHandle);
        Handle_StepVisual_Invisibility(const StepVisual_Invisibility *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_Invisibility DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_Invisibility {
    StepVisual_Invisibility* _get_reference() {
    return (StepVisual_Invisibility*)$self->Access();
    }
};

%extend Handle_StepVisual_Invisibility {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_Invisibility {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_InvisibilityContext;
class StepVisual_InvisibilityContext : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_InvisibilityContext;
		%feature("autodoc", "	* Returns a InvisibilityContext SelectType

	:rtype: None
") StepVisual_InvisibilityContext;
		 StepVisual_InvisibilityContext ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a InvisibilityContext Kind Entity that is : 1 -> PresentationRepresentation 2 -> PresentationSet 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "	* returns Value as a PresentationRepresentation (Null if another type)

	:rtype: Handle_StepVisual_PresentationRepresentation
") PresentationRepresentation;
		Handle_StepVisual_PresentationRepresentation PresentationRepresentation ();
		%feature("compactdefaultargs") PresentationSet;
		%feature("autodoc", "	* returns Value as a PresentationSet (Null if another type)

	:rtype: Handle_StepVisual_PresentationSet
") PresentationSet;
		Handle_StepVisual_PresentationSet PresentationSet ();
};


%extend StepVisual_InvisibilityContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_InvisibleItem;
class StepVisual_InvisibleItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_InvisibleItem;
		%feature("autodoc", "	* Returns a InvisibleItem SelectType

	:rtype: None
") StepVisual_InvisibleItem;
		 StepVisual_InvisibleItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a InvisibleItem Kind Entity that is : 1 -> StyledItem 2 -> PresentationLayerAssignment 3 -> PresentationRepresentation 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") StyledItem;
		%feature("autodoc", "	* returns Value as a StyledItem (Null if another type)

	:rtype: Handle_StepVisual_StyledItem
") StyledItem;
		Handle_StepVisual_StyledItem StyledItem ();
		%feature("compactdefaultargs") PresentationLayerAssignment;
		%feature("autodoc", "	* returns Value as a PresentationLayerAssignment (Null if another type)

	:rtype: Handle_StepVisual_PresentationLayerAssignment
") PresentationLayerAssignment;
		Handle_StepVisual_PresentationLayerAssignment PresentationLayerAssignment ();
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "	* returns Value as a PresentationRepresentation (Null if another type)

	:rtype: Handle_StepVisual_PresentationRepresentation
") PresentationRepresentation;
		Handle_StepVisual_PresentationRepresentation PresentationRepresentation ();
};


%extend StepVisual_InvisibleItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_LayeredItem;
class StepVisual_LayeredItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_LayeredItem;
		%feature("autodoc", "	* Returns a LayeredItem SelectType

	:rtype: None
") StepVisual_LayeredItem;
		 StepVisual_LayeredItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a LayeredItem Kind Entity that is : 1 -> PresentationRepresentation 2 -> RepresentationItem 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "	* returns Value as a PresentationRepresentation (Null if another type)

	:rtype: Handle_StepVisual_PresentationRepresentation
") PresentationRepresentation;
		Handle_StepVisual_PresentationRepresentation PresentationRepresentation ();
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "	* returns Value as a RepresentationItem (Null if another type)

	:rtype: Handle_StepRepr_RepresentationItem
") RepresentationItem;
		Handle_StepRepr_RepresentationItem RepresentationItem ();
};


%extend StepVisual_LayeredItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_MarkerMember;
class StepVisual_MarkerMember : public StepData_SelectInt {
	public:
		%feature("compactdefaultargs") StepVisual_MarkerMember;
		%feature("autodoc", "	:rtype: None
") StepVisual_MarkerMember;
		 StepVisual_MarkerMember ();
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
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "	:rtype: char *
") EnumText;
		virtual const char * EnumText ();
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", "	:param val:
	:type val: int
	:param text:
	:type text: char *
	:rtype: void
") SetEnumText;
		virtual void SetEnumText (const Standard_Integer val,const char * text);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param val:
	:type val: StepVisual_MarkerType
	:rtype: None
") SetValue;
		void SetValue (const StepVisual_MarkerType val);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: StepVisual_MarkerType
") Value;
		StepVisual_MarkerType Value ();
};


%extend StepVisual_MarkerMember {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_MarkerMember(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_MarkerMember::Handle_StepVisual_MarkerMember %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_MarkerMember;
class Handle_StepVisual_MarkerMember : public Handle_StepData_SelectInt {

    public:
        // constructors
        Handle_StepVisual_MarkerMember();
        Handle_StepVisual_MarkerMember(const Handle_StepVisual_MarkerMember &aHandle);
        Handle_StepVisual_MarkerMember(const StepVisual_MarkerMember *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_MarkerMember DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_MarkerMember {
    StepVisual_MarkerMember* _get_reference() {
    return (StepVisual_MarkerMember*)$self->Access();
    }
};

%extend Handle_StepVisual_MarkerMember {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_MarkerMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_MarkerSelect;
class StepVisual_MarkerSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_MarkerSelect;
		%feature("autodoc", "	* Returns a MarkerSelect SelectType

	:rtype: None
") StepVisual_MarkerSelect;
		 StepVisual_MarkerSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a MarkerSelect Kind Entity that is : 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a new MarkerMember

	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Returns 1 for a SelectMember enum, named MARKER_TYPE

	:param sm:
	:type sm: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & sm);
		%feature("compactdefaultargs") MarkerMember;
		%feature("autodoc", "	* Gives access to the MarkerMember in order to get/set its value

	:rtype: Handle_StepVisual_MarkerMember
") MarkerMember;
		Handle_StepVisual_MarkerMember MarkerMember ();
};


%extend StepVisual_MarkerSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PlanarExtent;
class StepVisual_PlanarExtent : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepVisual_PlanarExtent;
		%feature("autodoc", "	* Returns a PlanarExtent

	:rtype: None
") StepVisual_PlanarExtent;
		 StepVisual_PlanarExtent ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSizeInX:
	:type aSizeInX: float
	:param aSizeInY:
	:type aSizeInY: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Real aSizeInX,const Standard_Real aSizeInY);
		%feature("compactdefaultargs") SetSizeInX;
		%feature("autodoc", "	:param aSizeInX:
	:type aSizeInX: float
	:rtype: None
") SetSizeInX;
		void SetSizeInX (const Standard_Real aSizeInX);
		%feature("compactdefaultargs") SizeInX;
		%feature("autodoc", "	:rtype: float
") SizeInX;
		Standard_Real SizeInX ();
		%feature("compactdefaultargs") SetSizeInY;
		%feature("autodoc", "	:param aSizeInY:
	:type aSizeInY: float
	:rtype: None
") SetSizeInY;
		void SetSizeInY (const Standard_Real aSizeInY);
		%feature("compactdefaultargs") SizeInY;
		%feature("autodoc", "	:rtype: float
") SizeInY;
		Standard_Real SizeInY ();
};


%extend StepVisual_PlanarExtent {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PlanarExtent(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PlanarExtent::Handle_StepVisual_PlanarExtent %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PlanarExtent;
class Handle_StepVisual_PlanarExtent : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepVisual_PlanarExtent();
        Handle_StepVisual_PlanarExtent(const Handle_StepVisual_PlanarExtent &aHandle);
        Handle_StepVisual_PlanarExtent(const StepVisual_PlanarExtent *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PlanarExtent DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PlanarExtent {
    StepVisual_PlanarExtent* _get_reference() {
    return (StepVisual_PlanarExtent*)$self->Access();
    }
};

%extend Handle_StepVisual_PlanarExtent {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PlanarExtent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PointStyle;
class StepVisual_PointStyle : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_PointStyle;
		%feature("autodoc", "	* Returns a PointStyle

	:rtype: None
") StepVisual_PointStyle;
		 StepVisual_PointStyle ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aMarker:
	:type aMarker: StepVisual_MarkerSelect &
	:param aMarkerSize:
	:type aMarkerSize: StepBasic_SizeSelect &
	:param aMarkerColour:
	:type aMarkerColour: Handle_StepVisual_Colour &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepVisual_MarkerSelect & aMarker,const StepBasic_SizeSelect & aMarkerSize,const Handle_StepVisual_Colour & aMarkerColour);
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
		%feature("compactdefaultargs") SetMarker;
		%feature("autodoc", "	:param aMarker:
	:type aMarker: StepVisual_MarkerSelect &
	:rtype: None
") SetMarker;
		void SetMarker (const StepVisual_MarkerSelect & aMarker);
		%feature("compactdefaultargs") Marker;
		%feature("autodoc", "	:rtype: StepVisual_MarkerSelect
") Marker;
		StepVisual_MarkerSelect Marker ();
		%feature("compactdefaultargs") SetMarkerSize;
		%feature("autodoc", "	:param aMarkerSize:
	:type aMarkerSize: StepBasic_SizeSelect &
	:rtype: None
") SetMarkerSize;
		void SetMarkerSize (const StepBasic_SizeSelect & aMarkerSize);
		%feature("compactdefaultargs") MarkerSize;
		%feature("autodoc", "	:rtype: StepBasic_SizeSelect
") MarkerSize;
		StepBasic_SizeSelect MarkerSize ();
		%feature("compactdefaultargs") SetMarkerColour;
		%feature("autodoc", "	:param aMarkerColour:
	:type aMarkerColour: Handle_StepVisual_Colour &
	:rtype: None
") SetMarkerColour;
		void SetMarkerColour (const Handle_StepVisual_Colour & aMarkerColour);
		%feature("compactdefaultargs") MarkerColour;
		%feature("autodoc", "	:rtype: Handle_StepVisual_Colour
") MarkerColour;
		Handle_StepVisual_Colour MarkerColour ();
};


%extend StepVisual_PointStyle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PointStyle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PointStyle::Handle_StepVisual_PointStyle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PointStyle;
class Handle_StepVisual_PointStyle : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_PointStyle();
        Handle_StepVisual_PointStyle(const Handle_StepVisual_PointStyle &aHandle);
        Handle_StepVisual_PointStyle(const StepVisual_PointStyle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PointStyle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PointStyle {
    StepVisual_PointStyle* _get_reference() {
    return (StepVisual_PointStyle*)$self->Access();
    }
};

%extend Handle_StepVisual_PointStyle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PointStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PreDefinedItem;
class StepVisual_PreDefinedItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_PreDefinedItem;
		%feature("autodoc", "	* Returns a PreDefinedItem

	:rtype: None
") StepVisual_PreDefinedItem;
		 StepVisual_PreDefinedItem ();
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


%extend StepVisual_PreDefinedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PreDefinedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PreDefinedItem::Handle_StepVisual_PreDefinedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PreDefinedItem;
class Handle_StepVisual_PreDefinedItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_PreDefinedItem();
        Handle_StepVisual_PreDefinedItem(const Handle_StepVisual_PreDefinedItem &aHandle);
        Handle_StepVisual_PreDefinedItem(const StepVisual_PreDefinedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PreDefinedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PreDefinedItem {
    StepVisual_PreDefinedItem* _get_reference() {
    return (StepVisual_PreDefinedItem*)$self->Access();
    }
};

%extend Handle_StepVisual_PreDefinedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PreDefinedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationLayerAssignment;
class StepVisual_PresentationLayerAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationLayerAssignment;
		%feature("autodoc", "	* Returns a PresentationLayerAssignment

	:rtype: None
") StepVisual_PresentationLayerAssignment;
		 StepVisual_PresentationLayerAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aAssignedItems:
	:type aAssignedItems: Handle_StepVisual_HArray1OfLayeredItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepVisual_HArray1OfLayeredItem & aAssignedItems);
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
		%feature("compactdefaultargs") SetAssignedItems;
		%feature("autodoc", "	:param aAssignedItems:
	:type aAssignedItems: Handle_StepVisual_HArray1OfLayeredItem &
	:rtype: None
") SetAssignedItems;
		void SetAssignedItems (const Handle_StepVisual_HArray1OfLayeredItem & aAssignedItems);
		%feature("compactdefaultargs") AssignedItems;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfLayeredItem
") AssignedItems;
		Handle_StepVisual_HArray1OfLayeredItem AssignedItems ();
		%feature("compactdefaultargs") AssignedItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepVisual_LayeredItem
") AssignedItemsValue;
		StepVisual_LayeredItem AssignedItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbAssignedItems;
		%feature("autodoc", "	:rtype: int
") NbAssignedItems;
		Standard_Integer NbAssignedItems ();
};


%extend StepVisual_PresentationLayerAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentationLayerAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentationLayerAssignment::Handle_StepVisual_PresentationLayerAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentationLayerAssignment;
class Handle_StepVisual_PresentationLayerAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_PresentationLayerAssignment();
        Handle_StepVisual_PresentationLayerAssignment(const Handle_StepVisual_PresentationLayerAssignment &aHandle);
        Handle_StepVisual_PresentationLayerAssignment(const StepVisual_PresentationLayerAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentationLayerAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentationLayerAssignment {
    StepVisual_PresentationLayerAssignment* _get_reference() {
    return (StepVisual_PresentationLayerAssignment*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentationLayerAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentationLayerAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationLayerUsage;
class StepVisual_PresentationLayerUsage : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationLayerUsage;
		%feature("autodoc", "	:rtype: None
") StepVisual_PresentationLayerUsage;
		 StepVisual_PresentationLayerUsage ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignment:
	:type aAssignment: Handle_StepVisual_PresentationLayerAssignment &
	:param aPresentation:
	:type aPresentation: Handle_StepVisual_PresentationRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepVisual_PresentationLayerAssignment & aAssignment,const Handle_StepVisual_PresentationRepresentation & aPresentation);
		%feature("compactdefaultargs") SetAssignment;
		%feature("autodoc", "	:param aAssignment:
	:type aAssignment: Handle_StepVisual_PresentationLayerAssignment &
	:rtype: None
") SetAssignment;
		void SetAssignment (const Handle_StepVisual_PresentationLayerAssignment & aAssignment);
		%feature("compactdefaultargs") Assignment;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PresentationLayerAssignment
") Assignment;
		Handle_StepVisual_PresentationLayerAssignment Assignment ();
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "	:param aPresentation:
	:type aPresentation: Handle_StepVisual_PresentationRepresentation &
	:rtype: None
") SetPresentation;
		void SetPresentation (const Handle_StepVisual_PresentationRepresentation & aPresentation);
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PresentationRepresentation
") Presentation;
		Handle_StepVisual_PresentationRepresentation Presentation ();
};


%extend StepVisual_PresentationLayerUsage {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentationLayerUsage(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentationLayerUsage::Handle_StepVisual_PresentationLayerUsage %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentationLayerUsage;
class Handle_StepVisual_PresentationLayerUsage : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_PresentationLayerUsage();
        Handle_StepVisual_PresentationLayerUsage(const Handle_StepVisual_PresentationLayerUsage &aHandle);
        Handle_StepVisual_PresentationLayerUsage(const StepVisual_PresentationLayerUsage *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentationLayerUsage DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentationLayerUsage {
    StepVisual_PresentationLayerUsage* _get_reference() {
    return (StepVisual_PresentationLayerUsage*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentationLayerUsage {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentationLayerUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationRepresentation;
class StepVisual_PresentationRepresentation : public StepRepr_Representation {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationRepresentation;
		%feature("autodoc", "	* Returns a PresentationRepresentation

	:rtype: None
") StepVisual_PresentationRepresentation;
		 StepVisual_PresentationRepresentation ();
};


%extend StepVisual_PresentationRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentationRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentationRepresentation::Handle_StepVisual_PresentationRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentationRepresentation;
class Handle_StepVisual_PresentationRepresentation : public Handle_StepRepr_Representation {

    public:
        // constructors
        Handle_StepVisual_PresentationRepresentation();
        Handle_StepVisual_PresentationRepresentation(const Handle_StepVisual_PresentationRepresentation &aHandle);
        Handle_StepVisual_PresentationRepresentation(const StepVisual_PresentationRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentationRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentationRepresentation {
    StepVisual_PresentationRepresentation* _get_reference() {
    return (StepVisual_PresentationRepresentation*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentationRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentationRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationRepresentationSelect;
class StepVisual_PresentationRepresentationSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationRepresentationSelect;
		%feature("autodoc", "	* Returns a PresentationRepresentationSelect SelectType

	:rtype: None
") StepVisual_PresentationRepresentationSelect;
		 StepVisual_PresentationRepresentationSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a PresentationRepresentationSelect Kind Entity that is : 1 -> PresentationRepresentation 2 -> PresentationSet 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "	* returns Value as a PresentationRepresentation (Null if another type)

	:rtype: Handle_StepVisual_PresentationRepresentation
") PresentationRepresentation;
		Handle_StepVisual_PresentationRepresentation PresentationRepresentation ();
		%feature("compactdefaultargs") PresentationSet;
		%feature("autodoc", "	* returns Value as a PresentationSet (Null if another type)

	:rtype: Handle_StepVisual_PresentationSet
") PresentationSet;
		Handle_StepVisual_PresentationSet PresentationSet ();
};


%extend StepVisual_PresentationRepresentationSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationSet;
class StepVisual_PresentationSet : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationSet;
		%feature("autodoc", "	* Returns a PresentationSet

	:rtype: None
") StepVisual_PresentationSet;
		 StepVisual_PresentationSet ();
};


%extend StepVisual_PresentationSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentationSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentationSet::Handle_StepVisual_PresentationSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentationSet;
class Handle_StepVisual_PresentationSet : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_PresentationSet();
        Handle_StepVisual_PresentationSet(const Handle_StepVisual_PresentationSet &aHandle);
        Handle_StepVisual_PresentationSet(const StepVisual_PresentationSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentationSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentationSet {
    StepVisual_PresentationSet* _get_reference() {
    return (StepVisual_PresentationSet*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentationSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentationSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationSize;
class StepVisual_PresentationSize : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationSize;
		%feature("autodoc", "	* Returns a PresentationSize

	:rtype: None
") StepVisual_PresentationSize;
		 StepVisual_PresentationSize ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aUnit:
	:type aUnit: StepVisual_PresentationSizeAssignmentSelect &
	:param aSize:
	:type aSize: Handle_StepVisual_PlanarBox &
	:rtype: void
") Init;
		virtual void Init (const StepVisual_PresentationSizeAssignmentSelect & aUnit,const Handle_StepVisual_PlanarBox & aSize);
		%feature("compactdefaultargs") SetUnit;
		%feature("autodoc", "	:param aUnit:
	:type aUnit: StepVisual_PresentationSizeAssignmentSelect &
	:rtype: None
") SetUnit;
		void SetUnit (const StepVisual_PresentationSizeAssignmentSelect & aUnit);
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "	:rtype: StepVisual_PresentationSizeAssignmentSelect
") Unit;
		StepVisual_PresentationSizeAssignmentSelect Unit ();
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	:param aSize:
	:type aSize: Handle_StepVisual_PlanarBox &
	:rtype: None
") SetSize;
		void SetSize (const Handle_StepVisual_PlanarBox & aSize);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PlanarBox
") Size;
		Handle_StepVisual_PlanarBox Size ();
};


%extend StepVisual_PresentationSize {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentationSize(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentationSize::Handle_StepVisual_PresentationSize %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentationSize;
class Handle_StepVisual_PresentationSize : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_PresentationSize();
        Handle_StepVisual_PresentationSize(const Handle_StepVisual_PresentationSize &aHandle);
        Handle_StepVisual_PresentationSize(const StepVisual_PresentationSize *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentationSize DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentationSize {
    StepVisual_PresentationSize* _get_reference() {
    return (StepVisual_PresentationSize*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentationSize {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentationSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationSizeAssignmentSelect;
class StepVisual_PresentationSizeAssignmentSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationSizeAssignmentSelect;
		%feature("autodoc", "	* Returns a PresentationSizeAssignmentSelect SelectType

	:rtype: None
") StepVisual_PresentationSizeAssignmentSelect;
		 StepVisual_PresentationSizeAssignmentSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a PresentationSizeAssignmentSelect Kind Entity that is : 1 -> PresentationView 2 -> PresentationArea 3 -> AreaInSet 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") PresentationView;
		%feature("autodoc", "	* returns Value as a PresentationView (Null if another type)

	:rtype: Handle_StepVisual_PresentationView
") PresentationView;
		Handle_StepVisual_PresentationView PresentationView ();
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "	* returns Value as a PresentationArea (Null if another type)

	:rtype: Handle_StepVisual_PresentationArea
") PresentationArea;
		Handle_StepVisual_PresentationArea PresentationArea ();
		%feature("compactdefaultargs") AreaInSet;
		%feature("autodoc", "	* returns Value as a AreaInSet (Null if another type)

	:rtype: Handle_StepVisual_AreaInSet
") AreaInSet;
		Handle_StepVisual_AreaInSet AreaInSet ();
};


%extend StepVisual_PresentationSizeAssignmentSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationStyleAssignment;
class StepVisual_PresentationStyleAssignment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationStyleAssignment;
		%feature("autodoc", "	* Returns a PresentationStyleAssignment

	:rtype: None
") StepVisual_PresentationStyleAssignment;
		 StepVisual_PresentationStyleAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfPresentationStyleSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_HArray1OfPresentationStyleSelect & aStyles);
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfPresentationStyleSelect &
	:rtype: None
") SetStyles;
		void SetStyles (const Handle_StepVisual_HArray1OfPresentationStyleSelect & aStyles);
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfPresentationStyleSelect
") Styles;
		Handle_StepVisual_HArray1OfPresentationStyleSelect Styles ();
		%feature("compactdefaultargs") StylesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepVisual_PresentationStyleSelect
") StylesValue;
		StepVisual_PresentationStyleSelect StylesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "	:rtype: int
") NbStyles;
		Standard_Integer NbStyles ();
};


%extend StepVisual_PresentationStyleAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentationStyleAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentationStyleAssignment::Handle_StepVisual_PresentationStyleAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentationStyleAssignment;
class Handle_StepVisual_PresentationStyleAssignment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_PresentationStyleAssignment();
        Handle_StepVisual_PresentationStyleAssignment(const Handle_StepVisual_PresentationStyleAssignment &aHandle);
        Handle_StepVisual_PresentationStyleAssignment(const StepVisual_PresentationStyleAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentationStyleAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentationStyleAssignment {
    StepVisual_PresentationStyleAssignment* _get_reference() {
    return (StepVisual_PresentationStyleAssignment*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentationStyleAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentationStyleAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationStyleSelect;
class StepVisual_PresentationStyleSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationStyleSelect;
		%feature("autodoc", "	* Returns a PresentationStyleSelect SelectType

	:rtype: None
") StepVisual_PresentationStyleSelect;
		 StepVisual_PresentationStyleSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a PresentationStyleSelect Kind Entity that is : 1 -> PointStyle 2 -> CurveStyle 3 -> SurfaceStyleUsage 4 -> SymbolStyle 5 -> FillAreaStyle 6 -> TextStyle 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") PointStyle;
		%feature("autodoc", "	* returns Value as a PointStyle (Null if another type)

	:rtype: Handle_StepVisual_PointStyle
") PointStyle;
		Handle_StepVisual_PointStyle PointStyle ();
		%feature("compactdefaultargs") CurveStyle;
		%feature("autodoc", "	* returns Value as a CurveStyle (Null if another type)

	:rtype: Handle_StepVisual_CurveStyle
") CurveStyle;
		Handle_StepVisual_CurveStyle CurveStyle ();
		%feature("compactdefaultargs") SurfaceStyleUsage;
		%feature("autodoc", "	* returns Value as a SurfaceStyleUsage (Null if another type)

	:rtype: Handle_StepVisual_SurfaceStyleUsage
") SurfaceStyleUsage;
		Handle_StepVisual_SurfaceStyleUsage SurfaceStyleUsage ();
};


%extend StepVisual_PresentationStyleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentedItem;
class StepVisual_PresentedItem : public MMgt_TShared {
	public:
};


%extend StepVisual_PresentedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentedItem::Handle_StepVisual_PresentedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentedItem;
class Handle_StepVisual_PresentedItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_PresentedItem();
        Handle_StepVisual_PresentedItem(const Handle_StepVisual_PresentedItem &aHandle);
        Handle_StepVisual_PresentedItem(const StepVisual_PresentedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentedItem {
    StepVisual_PresentedItem* _get_reference() {
    return (StepVisual_PresentedItem*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentedItemRepresentation;
class StepVisual_PresentedItemRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_PresentedItemRepresentation;
		%feature("autodoc", "	:rtype: None
") StepVisual_PresentedItemRepresentation;
		 StepVisual_PresentedItemRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aPresentation:
	:type aPresentation: StepVisual_PresentationRepresentationSelect &
	:param aItem:
	:type aItem: Handle_StepVisual_PresentedItem &
	:rtype: None
") Init;
		void Init (const StepVisual_PresentationRepresentationSelect & aPresentation,const Handle_StepVisual_PresentedItem & aItem);
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "	:param aPresentation:
	:type aPresentation: StepVisual_PresentationRepresentationSelect &
	:rtype: None
") SetPresentation;
		void SetPresentation (const StepVisual_PresentationRepresentationSelect & aPresentation);
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	:rtype: StepVisual_PresentationRepresentationSelect
") Presentation;
		StepVisual_PresentationRepresentationSelect Presentation ();
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	:param aItem:
	:type aItem: Handle_StepVisual_PresentedItem &
	:rtype: None
") SetItem;
		void SetItem (const Handle_StepVisual_PresentedItem & aItem);
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PresentedItem
") Item;
		Handle_StepVisual_PresentedItem Item ();
};


%extend StepVisual_PresentedItemRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentedItemRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentedItemRepresentation::Handle_StepVisual_PresentedItemRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentedItemRepresentation;
class Handle_StepVisual_PresentedItemRepresentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_PresentedItemRepresentation();
        Handle_StepVisual_PresentedItemRepresentation(const Handle_StepVisual_PresentedItemRepresentation &aHandle);
        Handle_StepVisual_PresentedItemRepresentation(const StepVisual_PresentedItemRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentedItemRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentedItemRepresentation {
    StepVisual_PresentedItemRepresentation* _get_reference() {
    return (StepVisual_PresentedItemRepresentation*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentedItemRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentedItemRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_StyleContextSelect;
class StepVisual_StyleContextSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_StyleContextSelect;
		%feature("autodoc", "	* Returns a StyleContextSelect SelectType

	:rtype: None
") StepVisual_StyleContextSelect;
		 StepVisual_StyleContextSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a StyleContextSelect Kind Entity that is : 1 -> Representation 2 -> RepresentationItem 3 -> PresentationSet 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "	* returns Value as a Representation (Null if another type)

	:rtype: Handle_StepRepr_Representation
") Representation;
		Handle_StepRepr_Representation Representation ();
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "	* returns Value as a RepresentationItem (Null if another type)

	:rtype: Handle_StepRepr_RepresentationItem
") RepresentationItem;
		Handle_StepRepr_RepresentationItem RepresentationItem ();
		%feature("compactdefaultargs") PresentationSet;
		%feature("autodoc", "	* returns Value as a PresentationSet (Null if another type)

	:rtype: Handle_StepVisual_PresentationSet
") PresentationSet;
		Handle_StepVisual_PresentationSet PresentationSet ();
};


%extend StepVisual_StyleContextSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_StyledItem;
class StepVisual_StyledItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepVisual_StyledItem;
		%feature("autodoc", "	* Returns a StyledItem

	:rtype: None
") StepVisual_StyledItem;
		 StepVisual_StyledItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfPresentationStyleAssignment &
	:param aItem:
	:type aItem: Handle_StepRepr_RepresentationItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfPresentationStyleAssignment & aStyles,const Handle_StepRepr_RepresentationItem & aItem);
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfPresentationStyleAssignment &
	:rtype: None
") SetStyles;
		void SetStyles (const Handle_StepVisual_HArray1OfPresentationStyleAssignment & aStyles);
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfPresentationStyleAssignment
") Styles;
		Handle_StepVisual_HArray1OfPresentationStyleAssignment Styles ();
		%feature("compactdefaultargs") StylesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepVisual_PresentationStyleAssignment
") StylesValue;
		Handle_StepVisual_PresentationStyleAssignment StylesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "	:rtype: int
") NbStyles;
		Standard_Integer NbStyles ();
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	:param aItem:
	:type aItem: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetItem;
		void SetItem (const Handle_StepRepr_RepresentationItem & aItem);
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationItem
") Item;
		Handle_StepRepr_RepresentationItem Item ();
};


%extend StepVisual_StyledItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_StyledItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_StyledItem::Handle_StepVisual_StyledItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_StyledItem;
class Handle_StepVisual_StyledItem : public Handle_StepRepr_RepresentationItem {

    public:
        // constructors
        Handle_StepVisual_StyledItem();
        Handle_StepVisual_StyledItem(const Handle_StepVisual_StyledItem &aHandle);
        Handle_StepVisual_StyledItem(const StepVisual_StyledItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_StyledItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_StyledItem {
    StepVisual_StyledItem* _get_reference() {
    return (StepVisual_StyledItem*)$self->Access();
    }
};

%extend Handle_StepVisual_StyledItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_StyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_SurfaceSideStyle;
class StepVisual_SurfaceSideStyle : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_SurfaceSideStyle;
		%feature("autodoc", "	* Returns a SurfaceSideStyle

	:rtype: None
") StepVisual_SurfaceSideStyle;
		 StepVisual_SurfaceSideStyle ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfSurfaceStyleElementSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfSurfaceStyleElementSelect & aStyles);
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
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfSurfaceStyleElementSelect &
	:rtype: None
") SetStyles;
		void SetStyles (const Handle_StepVisual_HArray1OfSurfaceStyleElementSelect & aStyles);
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfSurfaceStyleElementSelect
") Styles;
		Handle_StepVisual_HArray1OfSurfaceStyleElementSelect Styles ();
		%feature("compactdefaultargs") StylesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepVisual_SurfaceStyleElementSelect
") StylesValue;
		StepVisual_SurfaceStyleElementSelect StylesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "	:rtype: int
") NbStyles;
		Standard_Integer NbStyles ();
};


%extend StepVisual_SurfaceSideStyle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_SurfaceSideStyle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_SurfaceSideStyle::Handle_StepVisual_SurfaceSideStyle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_SurfaceSideStyle;
class Handle_StepVisual_SurfaceSideStyle : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_SurfaceSideStyle();
        Handle_StepVisual_SurfaceSideStyle(const Handle_StepVisual_SurfaceSideStyle &aHandle);
        Handle_StepVisual_SurfaceSideStyle(const StepVisual_SurfaceSideStyle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_SurfaceSideStyle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_SurfaceSideStyle {
    StepVisual_SurfaceSideStyle* _get_reference() {
    return (StepVisual_SurfaceSideStyle*)$self->Access();
    }
};

%extend Handle_StepVisual_SurfaceSideStyle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_SurfaceSideStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_SurfaceStyleBoundary;
class StepVisual_SurfaceStyleBoundary : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_SurfaceStyleBoundary;
		%feature("autodoc", "	* Returns a SurfaceStyleBoundary

	:rtype: None
") StepVisual_SurfaceStyleBoundary;
		 StepVisual_SurfaceStyleBoundary ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStyleOfBoundary:
	:type aStyleOfBoundary: Handle_StepVisual_CurveStyle &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_CurveStyle & aStyleOfBoundary);
		%feature("compactdefaultargs") SetStyleOfBoundary;
		%feature("autodoc", "	:param aStyleOfBoundary:
	:type aStyleOfBoundary: Handle_StepVisual_CurveStyle &
	:rtype: None
") SetStyleOfBoundary;
		void SetStyleOfBoundary (const Handle_StepVisual_CurveStyle & aStyleOfBoundary);
		%feature("compactdefaultargs") StyleOfBoundary;
		%feature("autodoc", "	:rtype: Handle_StepVisual_CurveStyle
") StyleOfBoundary;
		Handle_StepVisual_CurveStyle StyleOfBoundary ();
};


%extend StepVisual_SurfaceStyleBoundary {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_SurfaceStyleBoundary(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_SurfaceStyleBoundary::Handle_StepVisual_SurfaceStyleBoundary %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_SurfaceStyleBoundary;
class Handle_StepVisual_SurfaceStyleBoundary : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_SurfaceStyleBoundary();
        Handle_StepVisual_SurfaceStyleBoundary(const Handle_StepVisual_SurfaceStyleBoundary &aHandle);
        Handle_StepVisual_SurfaceStyleBoundary(const StepVisual_SurfaceStyleBoundary *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_SurfaceStyleBoundary DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_SurfaceStyleBoundary {
    StepVisual_SurfaceStyleBoundary* _get_reference() {
    return (StepVisual_SurfaceStyleBoundary*)$self->Access();
    }
};

%extend Handle_StepVisual_SurfaceStyleBoundary {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_SurfaceStyleBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_SurfaceStyleControlGrid;
class StepVisual_SurfaceStyleControlGrid : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_SurfaceStyleControlGrid;
		%feature("autodoc", "	* Returns a SurfaceStyleControlGrid

	:rtype: None
") StepVisual_SurfaceStyleControlGrid;
		 StepVisual_SurfaceStyleControlGrid ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStyleOfControlGrid:
	:type aStyleOfControlGrid: Handle_StepVisual_CurveStyle &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_CurveStyle & aStyleOfControlGrid);
		%feature("compactdefaultargs") SetStyleOfControlGrid;
		%feature("autodoc", "	:param aStyleOfControlGrid:
	:type aStyleOfControlGrid: Handle_StepVisual_CurveStyle &
	:rtype: None
") SetStyleOfControlGrid;
		void SetStyleOfControlGrid (const Handle_StepVisual_CurveStyle & aStyleOfControlGrid);
		%feature("compactdefaultargs") StyleOfControlGrid;
		%feature("autodoc", "	:rtype: Handle_StepVisual_CurveStyle
") StyleOfControlGrid;
		Handle_StepVisual_CurveStyle StyleOfControlGrid ();
};


%extend StepVisual_SurfaceStyleControlGrid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_SurfaceStyleControlGrid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_SurfaceStyleControlGrid::Handle_StepVisual_SurfaceStyleControlGrid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_SurfaceStyleControlGrid;
class Handle_StepVisual_SurfaceStyleControlGrid : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_SurfaceStyleControlGrid();
        Handle_StepVisual_SurfaceStyleControlGrid(const Handle_StepVisual_SurfaceStyleControlGrid &aHandle);
        Handle_StepVisual_SurfaceStyleControlGrid(const StepVisual_SurfaceStyleControlGrid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_SurfaceStyleControlGrid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_SurfaceStyleControlGrid {
    StepVisual_SurfaceStyleControlGrid* _get_reference() {
    return (StepVisual_SurfaceStyleControlGrid*)$self->Access();
    }
};

%extend Handle_StepVisual_SurfaceStyleControlGrid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_SurfaceStyleControlGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_SurfaceStyleElementSelect;
class StepVisual_SurfaceStyleElementSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_SurfaceStyleElementSelect;
		%feature("autodoc", "	* Returns a SurfaceStyleElementSelect SelectType

	:rtype: None
") StepVisual_SurfaceStyleElementSelect;
		 StepVisual_SurfaceStyleElementSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a SurfaceStyleElementSelect Kind Entity that is : 1 -> SurfaceStyleFillArea 2 -> SurfaceStyleBoundary 3 -> SurfaceStyleParameterLine 4 -> SurfaceStyleSilhouette 5 -> SurfaceStyleSegmentationCurve 6 -> SurfaceStyleControlGrid 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") SurfaceStyleFillArea;
		%feature("autodoc", "	* returns Value as a SurfaceStyleFillArea (Null if another type)

	:rtype: Handle_StepVisual_SurfaceStyleFillArea
") SurfaceStyleFillArea;
		Handle_StepVisual_SurfaceStyleFillArea SurfaceStyleFillArea ();
		%feature("compactdefaultargs") SurfaceStyleBoundary;
		%feature("autodoc", "	* returns Value as a SurfaceStyleBoundary (Null if another type)

	:rtype: Handle_StepVisual_SurfaceStyleBoundary
") SurfaceStyleBoundary;
		Handle_StepVisual_SurfaceStyleBoundary SurfaceStyleBoundary ();
		%feature("compactdefaultargs") SurfaceStyleParameterLine;
		%feature("autodoc", "	* returns Value as a SurfaceStyleParameterLine (Null if another type)

	:rtype: Handle_StepVisual_SurfaceStyleParameterLine
") SurfaceStyleParameterLine;
		Handle_StepVisual_SurfaceStyleParameterLine SurfaceStyleParameterLine ();
};


%extend StepVisual_SurfaceStyleElementSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_SurfaceStyleFillArea;
class StepVisual_SurfaceStyleFillArea : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_SurfaceStyleFillArea;
		%feature("autodoc", "	* Returns a SurfaceStyleFillArea

	:rtype: None
") StepVisual_SurfaceStyleFillArea;
		 StepVisual_SurfaceStyleFillArea ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aFillArea:
	:type aFillArea: Handle_StepVisual_FillAreaStyle &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_FillAreaStyle & aFillArea);
		%feature("compactdefaultargs") SetFillArea;
		%feature("autodoc", "	:param aFillArea:
	:type aFillArea: Handle_StepVisual_FillAreaStyle &
	:rtype: None
") SetFillArea;
		void SetFillArea (const Handle_StepVisual_FillAreaStyle & aFillArea);
		%feature("compactdefaultargs") FillArea;
		%feature("autodoc", "	:rtype: Handle_StepVisual_FillAreaStyle
") FillArea;
		Handle_StepVisual_FillAreaStyle FillArea ();
};


%extend StepVisual_SurfaceStyleFillArea {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_SurfaceStyleFillArea(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_SurfaceStyleFillArea::Handle_StepVisual_SurfaceStyleFillArea %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_SurfaceStyleFillArea;
class Handle_StepVisual_SurfaceStyleFillArea : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_SurfaceStyleFillArea();
        Handle_StepVisual_SurfaceStyleFillArea(const Handle_StepVisual_SurfaceStyleFillArea &aHandle);
        Handle_StepVisual_SurfaceStyleFillArea(const StepVisual_SurfaceStyleFillArea *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_SurfaceStyleFillArea DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_SurfaceStyleFillArea {
    StepVisual_SurfaceStyleFillArea* _get_reference() {
    return (StepVisual_SurfaceStyleFillArea*)$self->Access();
    }
};

%extend Handle_StepVisual_SurfaceStyleFillArea {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_SurfaceStyleFillArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_SurfaceStyleParameterLine;
class StepVisual_SurfaceStyleParameterLine : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_SurfaceStyleParameterLine;
		%feature("autodoc", "	* Returns a SurfaceStyleParameterLine

	:rtype: None
") StepVisual_SurfaceStyleParameterLine;
		 StepVisual_SurfaceStyleParameterLine ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStyleOfParameterLines:
	:type aStyleOfParameterLines: Handle_StepVisual_CurveStyle &
	:param aDirectionCounts:
	:type aDirectionCounts: Handle_StepVisual_HArray1OfDirectionCountSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_CurveStyle & aStyleOfParameterLines,const Handle_StepVisual_HArray1OfDirectionCountSelect & aDirectionCounts);
		%feature("compactdefaultargs") SetStyleOfParameterLines;
		%feature("autodoc", "	:param aStyleOfParameterLines:
	:type aStyleOfParameterLines: Handle_StepVisual_CurveStyle &
	:rtype: None
") SetStyleOfParameterLines;
		void SetStyleOfParameterLines (const Handle_StepVisual_CurveStyle & aStyleOfParameterLines);
		%feature("compactdefaultargs") StyleOfParameterLines;
		%feature("autodoc", "	:rtype: Handle_StepVisual_CurveStyle
") StyleOfParameterLines;
		Handle_StepVisual_CurveStyle StyleOfParameterLines ();
		%feature("compactdefaultargs") SetDirectionCounts;
		%feature("autodoc", "	:param aDirectionCounts:
	:type aDirectionCounts: Handle_StepVisual_HArray1OfDirectionCountSelect &
	:rtype: None
") SetDirectionCounts;
		void SetDirectionCounts (const Handle_StepVisual_HArray1OfDirectionCountSelect & aDirectionCounts);
		%feature("compactdefaultargs") DirectionCounts;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfDirectionCountSelect
") DirectionCounts;
		Handle_StepVisual_HArray1OfDirectionCountSelect DirectionCounts ();
		%feature("compactdefaultargs") DirectionCountsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepVisual_DirectionCountSelect
") DirectionCountsValue;
		StepVisual_DirectionCountSelect DirectionCountsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbDirectionCounts;
		%feature("autodoc", "	:rtype: int
") NbDirectionCounts;
		Standard_Integer NbDirectionCounts ();
};


%extend StepVisual_SurfaceStyleParameterLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_SurfaceStyleParameterLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_SurfaceStyleParameterLine::Handle_StepVisual_SurfaceStyleParameterLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_SurfaceStyleParameterLine;
class Handle_StepVisual_SurfaceStyleParameterLine : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_SurfaceStyleParameterLine();
        Handle_StepVisual_SurfaceStyleParameterLine(const Handle_StepVisual_SurfaceStyleParameterLine &aHandle);
        Handle_StepVisual_SurfaceStyleParameterLine(const StepVisual_SurfaceStyleParameterLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_SurfaceStyleParameterLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_SurfaceStyleParameterLine {
    StepVisual_SurfaceStyleParameterLine* _get_reference() {
    return (StepVisual_SurfaceStyleParameterLine*)$self->Access();
    }
};

%extend Handle_StepVisual_SurfaceStyleParameterLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_SurfaceStyleParameterLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_SurfaceStyleSegmentationCurve;
class StepVisual_SurfaceStyleSegmentationCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_SurfaceStyleSegmentationCurve;
		%feature("autodoc", "	* Returns a SurfaceStyleSegmentationCurve

	:rtype: None
") StepVisual_SurfaceStyleSegmentationCurve;
		 StepVisual_SurfaceStyleSegmentationCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStyleOfSegmentationCurve:
	:type aStyleOfSegmentationCurve: Handle_StepVisual_CurveStyle &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_CurveStyle & aStyleOfSegmentationCurve);
		%feature("compactdefaultargs") SetStyleOfSegmentationCurve;
		%feature("autodoc", "	:param aStyleOfSegmentationCurve:
	:type aStyleOfSegmentationCurve: Handle_StepVisual_CurveStyle &
	:rtype: None
") SetStyleOfSegmentationCurve;
		void SetStyleOfSegmentationCurve (const Handle_StepVisual_CurveStyle & aStyleOfSegmentationCurve);
		%feature("compactdefaultargs") StyleOfSegmentationCurve;
		%feature("autodoc", "	:rtype: Handle_StepVisual_CurveStyle
") StyleOfSegmentationCurve;
		Handle_StepVisual_CurveStyle StyleOfSegmentationCurve ();
};


%extend StepVisual_SurfaceStyleSegmentationCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_SurfaceStyleSegmentationCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_SurfaceStyleSegmentationCurve::Handle_StepVisual_SurfaceStyleSegmentationCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_SurfaceStyleSegmentationCurve;
class Handle_StepVisual_SurfaceStyleSegmentationCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_SurfaceStyleSegmentationCurve();
        Handle_StepVisual_SurfaceStyleSegmentationCurve(const Handle_StepVisual_SurfaceStyleSegmentationCurve &aHandle);
        Handle_StepVisual_SurfaceStyleSegmentationCurve(const StepVisual_SurfaceStyleSegmentationCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_SurfaceStyleSegmentationCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_SurfaceStyleSegmentationCurve {
    StepVisual_SurfaceStyleSegmentationCurve* _get_reference() {
    return (StepVisual_SurfaceStyleSegmentationCurve*)$self->Access();
    }
};

%extend Handle_StepVisual_SurfaceStyleSegmentationCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_SurfaceStyleSegmentationCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_SurfaceStyleSilhouette;
class StepVisual_SurfaceStyleSilhouette : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_SurfaceStyleSilhouette;
		%feature("autodoc", "	* Returns a SurfaceStyleSilhouette

	:rtype: None
") StepVisual_SurfaceStyleSilhouette;
		 StepVisual_SurfaceStyleSilhouette ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStyleOfSilhouette:
	:type aStyleOfSilhouette: Handle_StepVisual_CurveStyle &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_CurveStyle & aStyleOfSilhouette);
		%feature("compactdefaultargs") SetStyleOfSilhouette;
		%feature("autodoc", "	:param aStyleOfSilhouette:
	:type aStyleOfSilhouette: Handle_StepVisual_CurveStyle &
	:rtype: None
") SetStyleOfSilhouette;
		void SetStyleOfSilhouette (const Handle_StepVisual_CurveStyle & aStyleOfSilhouette);
		%feature("compactdefaultargs") StyleOfSilhouette;
		%feature("autodoc", "	:rtype: Handle_StepVisual_CurveStyle
") StyleOfSilhouette;
		Handle_StepVisual_CurveStyle StyleOfSilhouette ();
};


%extend StepVisual_SurfaceStyleSilhouette {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_SurfaceStyleSilhouette(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_SurfaceStyleSilhouette::Handle_StepVisual_SurfaceStyleSilhouette %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_SurfaceStyleSilhouette;
class Handle_StepVisual_SurfaceStyleSilhouette : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_SurfaceStyleSilhouette();
        Handle_StepVisual_SurfaceStyleSilhouette(const Handle_StepVisual_SurfaceStyleSilhouette &aHandle);
        Handle_StepVisual_SurfaceStyleSilhouette(const StepVisual_SurfaceStyleSilhouette *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_SurfaceStyleSilhouette DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_SurfaceStyleSilhouette {
    StepVisual_SurfaceStyleSilhouette* _get_reference() {
    return (StepVisual_SurfaceStyleSilhouette*)$self->Access();
    }
};

%extend Handle_StepVisual_SurfaceStyleSilhouette {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_SurfaceStyleSilhouette {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_SurfaceStyleUsage;
class StepVisual_SurfaceStyleUsage : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_SurfaceStyleUsage;
		%feature("autodoc", "	* Returns a SurfaceStyleUsage

	:rtype: None
") StepVisual_SurfaceStyleUsage;
		 StepVisual_SurfaceStyleUsage ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aSide:
	:type aSide: StepVisual_SurfaceSide
	:param aStyle:
	:type aStyle: Handle_StepVisual_SurfaceSideStyle &
	:rtype: void
") Init;
		virtual void Init (const StepVisual_SurfaceSide aSide,const Handle_StepVisual_SurfaceSideStyle & aStyle);
		%feature("compactdefaultargs") SetSide;
		%feature("autodoc", "	:param aSide:
	:type aSide: StepVisual_SurfaceSide
	:rtype: None
") SetSide;
		void SetSide (const StepVisual_SurfaceSide aSide);
		%feature("compactdefaultargs") Side;
		%feature("autodoc", "	:rtype: StepVisual_SurfaceSide
") Side;
		StepVisual_SurfaceSide Side ();
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "	:param aStyle:
	:type aStyle: Handle_StepVisual_SurfaceSideStyle &
	:rtype: None
") SetStyle;
		void SetStyle (const Handle_StepVisual_SurfaceSideStyle & aStyle);
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "	:rtype: Handle_StepVisual_SurfaceSideStyle
") Style;
		Handle_StepVisual_SurfaceSideStyle Style ();
};


%extend StepVisual_SurfaceStyleUsage {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_SurfaceStyleUsage(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_SurfaceStyleUsage::Handle_StepVisual_SurfaceStyleUsage %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_SurfaceStyleUsage;
class Handle_StepVisual_SurfaceStyleUsage : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_SurfaceStyleUsage();
        Handle_StepVisual_SurfaceStyleUsage(const Handle_StepVisual_SurfaceStyleUsage &aHandle);
        Handle_StepVisual_SurfaceStyleUsage(const StepVisual_SurfaceStyleUsage *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_SurfaceStyleUsage DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_SurfaceStyleUsage {
    StepVisual_SurfaceStyleUsage* _get_reference() {
    return (StepVisual_SurfaceStyleUsage*)$self->Access();
    }
};

%extend Handle_StepVisual_SurfaceStyleUsage {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_SurfaceStyleUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_Template;
class StepVisual_Template : public StepRepr_Representation {
	public:
		%feature("compactdefaultargs") StepVisual_Template;
		%feature("autodoc", "	* Returns a Template

	:rtype: None
") StepVisual_Template;
		 StepVisual_Template ();
};


%extend StepVisual_Template {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_Template(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_Template::Handle_StepVisual_Template %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_Template;
class Handle_StepVisual_Template : public Handle_StepRepr_Representation {

    public:
        // constructors
        Handle_StepVisual_Template();
        Handle_StepVisual_Template(const Handle_StepVisual_Template &aHandle);
        Handle_StepVisual_Template(const StepVisual_Template *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_Template DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_Template {
    StepVisual_Template* _get_reference() {
    return (StepVisual_Template*)$self->Access();
    }
};

%extend Handle_StepVisual_Template {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_Template {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_TemplateInstance;
class StepVisual_TemplateInstance : public StepRepr_MappedItem {
	public:
		%feature("compactdefaultargs") StepVisual_TemplateInstance;
		%feature("autodoc", "	* Returns a TemplateInstance

	:rtype: None
") StepVisual_TemplateInstance;
		 StepVisual_TemplateInstance ();
};


%extend StepVisual_TemplateInstance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_TemplateInstance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_TemplateInstance::Handle_StepVisual_TemplateInstance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_TemplateInstance;
class Handle_StepVisual_TemplateInstance : public Handle_StepRepr_MappedItem {

    public:
        // constructors
        Handle_StepVisual_TemplateInstance();
        Handle_StepVisual_TemplateInstance(const Handle_StepVisual_TemplateInstance &aHandle);
        Handle_StepVisual_TemplateInstance(const StepVisual_TemplateInstance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_TemplateInstance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_TemplateInstance {
    StepVisual_TemplateInstance* _get_reference() {
    return (StepVisual_TemplateInstance*)$self->Access();
    }
};

%extend Handle_StepVisual_TemplateInstance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_TemplateInstance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_TextLiteral;
class StepVisual_TextLiteral : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepVisual_TextLiteral;
		%feature("autodoc", "	* Returns a TextLiteral

	:rtype: None
") StepVisual_TextLiteral;
		 StepVisual_TextLiteral ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aLiteral:
	:type aLiteral: Handle_TCollection_HAsciiString &
	:param aPlacement:
	:type aPlacement: StepGeom_Axis2Placement &
	:param aAlignment:
	:type aAlignment: Handle_TCollection_HAsciiString &
	:param aPath:
	:type aPath: StepVisual_TextPath
	:param aFont:
	:type aFont: StepVisual_FontSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aLiteral,const StepGeom_Axis2Placement & aPlacement,const Handle_TCollection_HAsciiString & aAlignment,const StepVisual_TextPath aPath,const StepVisual_FontSelect & aFont);
		%feature("compactdefaultargs") SetLiteral;
		%feature("autodoc", "	:param aLiteral:
	:type aLiteral: Handle_TCollection_HAsciiString &
	:rtype: None
") SetLiteral;
		void SetLiteral (const Handle_TCollection_HAsciiString & aLiteral);
		%feature("compactdefaultargs") Literal;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Literal;
		Handle_TCollection_HAsciiString Literal ();
		%feature("compactdefaultargs") SetPlacement;
		%feature("autodoc", "	:param aPlacement:
	:type aPlacement: StepGeom_Axis2Placement &
	:rtype: None
") SetPlacement;
		void SetPlacement (const StepGeom_Axis2Placement & aPlacement);
		%feature("compactdefaultargs") Placement;
		%feature("autodoc", "	:rtype: StepGeom_Axis2Placement
") Placement;
		StepGeom_Axis2Placement Placement ();
		%feature("compactdefaultargs") SetAlignment;
		%feature("autodoc", "	:param aAlignment:
	:type aAlignment: Handle_TCollection_HAsciiString &
	:rtype: None
") SetAlignment;
		void SetAlignment (const Handle_TCollection_HAsciiString & aAlignment);
		%feature("compactdefaultargs") Alignment;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Alignment;
		Handle_TCollection_HAsciiString Alignment ();
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "	:param aPath:
	:type aPath: StepVisual_TextPath
	:rtype: None
") SetPath;
		void SetPath (const StepVisual_TextPath aPath);
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	:rtype: StepVisual_TextPath
") Path;
		StepVisual_TextPath Path ();
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "	:param aFont:
	:type aFont: StepVisual_FontSelect &
	:rtype: None
") SetFont;
		void SetFont (const StepVisual_FontSelect & aFont);
		%feature("compactdefaultargs") Font;
		%feature("autodoc", "	:rtype: StepVisual_FontSelect
") Font;
		StepVisual_FontSelect Font ();
};


%extend StepVisual_TextLiteral {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_TextLiteral(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_TextLiteral::Handle_StepVisual_TextLiteral %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_TextLiteral;
class Handle_StepVisual_TextLiteral : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepVisual_TextLiteral();
        Handle_StepVisual_TextLiteral(const Handle_StepVisual_TextLiteral &aHandle);
        Handle_StepVisual_TextLiteral(const StepVisual_TextLiteral *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_TextLiteral DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_TextLiteral {
    StepVisual_TextLiteral* _get_reference() {
    return (StepVisual_TextLiteral*)$self->Access();
    }
};

%extend Handle_StepVisual_TextLiteral {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_TextLiteral {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_TextOrCharacter;
class StepVisual_TextOrCharacter : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepVisual_TextOrCharacter;
		%feature("autodoc", "	* Returns a TextOrCharacter SelectType

	:rtype: None
") StepVisual_TextOrCharacter;
		 StepVisual_TextOrCharacter ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a TextOrCharacter Kind Entity that is : 1 -> AnnotationText 2 -> CompositeText 3 -> TextLiteral 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") AnnotationText;
		%feature("autodoc", "	* returns Value as a AnnotationText (Null if another type)

	:rtype: Handle_StepVisual_AnnotationText
") AnnotationText;
		Handle_StepVisual_AnnotationText AnnotationText ();
		%feature("compactdefaultargs") CompositeText;
		%feature("autodoc", "	* returns Value as a CompositeText (Null if another type)

	:rtype: Handle_StepVisual_CompositeText
") CompositeText;
		Handle_StepVisual_CompositeText CompositeText ();
		%feature("compactdefaultargs") TextLiteral;
		%feature("autodoc", "	* returns Value as a TextLiteral (Null if another type)

	:rtype: Handle_StepVisual_TextLiteral
") TextLiteral;
		Handle_StepVisual_TextLiteral TextLiteral ();
};


%extend StepVisual_TextOrCharacter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_TextStyle;
class StepVisual_TextStyle : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_TextStyle;
		%feature("autodoc", "	* Returns a TextStyle

	:rtype: None
") StepVisual_TextStyle;
		 StepVisual_TextStyle ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCharacterAppearance:
	:type aCharacterAppearance: Handle_StepVisual_TextStyleForDefinedFont &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_TextStyleForDefinedFont & aCharacterAppearance);
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
		%feature("compactdefaultargs") SetCharacterAppearance;
		%feature("autodoc", "	:param aCharacterAppearance:
	:type aCharacterAppearance: Handle_StepVisual_TextStyleForDefinedFont &
	:rtype: None
") SetCharacterAppearance;
		void SetCharacterAppearance (const Handle_StepVisual_TextStyleForDefinedFont & aCharacterAppearance);
		%feature("compactdefaultargs") CharacterAppearance;
		%feature("autodoc", "	:rtype: Handle_StepVisual_TextStyleForDefinedFont
") CharacterAppearance;
		Handle_StepVisual_TextStyleForDefinedFont CharacterAppearance ();
};


%extend StepVisual_TextStyle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_TextStyle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_TextStyle::Handle_StepVisual_TextStyle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_TextStyle;
class Handle_StepVisual_TextStyle : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_TextStyle();
        Handle_StepVisual_TextStyle(const Handle_StepVisual_TextStyle &aHandle);
        Handle_StepVisual_TextStyle(const StepVisual_TextStyle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_TextStyle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_TextStyle {
    StepVisual_TextStyle* _get_reference() {
    return (StepVisual_TextStyle*)$self->Access();
    }
};

%extend Handle_StepVisual_TextStyle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_TextStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_TextStyleForDefinedFont;
class StepVisual_TextStyleForDefinedFont : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_TextStyleForDefinedFont;
		%feature("autodoc", "	* Returns a TextStyleForDefinedFont

	:rtype: None
") StepVisual_TextStyleForDefinedFont;
		 StepVisual_TextStyleForDefinedFont ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aTextColour:
	:type aTextColour: Handle_StepVisual_Colour &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_Colour & aTextColour);
		%feature("compactdefaultargs") SetTextColour;
		%feature("autodoc", "	:param aTextColour:
	:type aTextColour: Handle_StepVisual_Colour &
	:rtype: None
") SetTextColour;
		void SetTextColour (const Handle_StepVisual_Colour & aTextColour);
		%feature("compactdefaultargs") TextColour;
		%feature("autodoc", "	:rtype: Handle_StepVisual_Colour
") TextColour;
		Handle_StepVisual_Colour TextColour ();
};


%extend StepVisual_TextStyleForDefinedFont {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_TextStyleForDefinedFont(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_TextStyleForDefinedFont::Handle_StepVisual_TextStyleForDefinedFont %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_TextStyleForDefinedFont;
class Handle_StepVisual_TextStyleForDefinedFont : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_TextStyleForDefinedFont();
        Handle_StepVisual_TextStyleForDefinedFont(const Handle_StepVisual_TextStyleForDefinedFont &aHandle);
        Handle_StepVisual_TextStyleForDefinedFont(const StepVisual_TextStyleForDefinedFont *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_TextStyleForDefinedFont DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_TextStyleForDefinedFont {
    StepVisual_TextStyleForDefinedFont* _get_reference() {
    return (StepVisual_TextStyleForDefinedFont*)$self->Access();
    }
};

%extend Handle_StepVisual_TextStyleForDefinedFont {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_TextStyleForDefinedFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_ViewVolume;
class StepVisual_ViewVolume : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepVisual_ViewVolume;
		%feature("autodoc", "	* Returns a ViewVolume

	:rtype: None
") StepVisual_ViewVolume;
		 StepVisual_ViewVolume ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aProjectionType:
	:type aProjectionType: StepVisual_CentralOrParallel
	:param aProjectionPoint:
	:type aProjectionPoint: Handle_StepGeom_CartesianPoint &
	:param aViewPlaneDistance:
	:type aViewPlaneDistance: float
	:param aFrontPlaneDistance:
	:type aFrontPlaneDistance: float
	:param aFrontPlaneClipping:
	:type aFrontPlaneClipping: bool
	:param aBackPlaneDistance:
	:type aBackPlaneDistance: float
	:param aBackPlaneClipping:
	:type aBackPlaneClipping: bool
	:param aViewVolumeSidesClipping:
	:type aViewVolumeSidesClipping: bool
	:param aViewWindow:
	:type aViewWindow: Handle_StepVisual_PlanarBox &
	:rtype: void
") Init;
		virtual void Init (const StepVisual_CentralOrParallel aProjectionType,const Handle_StepGeom_CartesianPoint & aProjectionPoint,const Standard_Real aViewPlaneDistance,const Standard_Real aFrontPlaneDistance,const Standard_Boolean aFrontPlaneClipping,const Standard_Real aBackPlaneDistance,const Standard_Boolean aBackPlaneClipping,const Standard_Boolean aViewVolumeSidesClipping,const Handle_StepVisual_PlanarBox & aViewWindow);
		%feature("compactdefaultargs") SetProjectionType;
		%feature("autodoc", "	:param aProjectionType:
	:type aProjectionType: StepVisual_CentralOrParallel
	:rtype: None
") SetProjectionType;
		void SetProjectionType (const StepVisual_CentralOrParallel aProjectionType);
		%feature("compactdefaultargs") ProjectionType;
		%feature("autodoc", "	:rtype: StepVisual_CentralOrParallel
") ProjectionType;
		StepVisual_CentralOrParallel ProjectionType ();
		%feature("compactdefaultargs") SetProjectionPoint;
		%feature("autodoc", "	:param aProjectionPoint:
	:type aProjectionPoint: Handle_StepGeom_CartesianPoint &
	:rtype: None
") SetProjectionPoint;
		void SetProjectionPoint (const Handle_StepGeom_CartesianPoint & aProjectionPoint);
		%feature("compactdefaultargs") ProjectionPoint;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianPoint
") ProjectionPoint;
		Handle_StepGeom_CartesianPoint ProjectionPoint ();
		%feature("compactdefaultargs") SetViewPlaneDistance;
		%feature("autodoc", "	:param aViewPlaneDistance:
	:type aViewPlaneDistance: float
	:rtype: None
") SetViewPlaneDistance;
		void SetViewPlaneDistance (const Standard_Real aViewPlaneDistance);
		%feature("compactdefaultargs") ViewPlaneDistance;
		%feature("autodoc", "	:rtype: float
") ViewPlaneDistance;
		Standard_Real ViewPlaneDistance ();
		%feature("compactdefaultargs") SetFrontPlaneDistance;
		%feature("autodoc", "	:param aFrontPlaneDistance:
	:type aFrontPlaneDistance: float
	:rtype: None
") SetFrontPlaneDistance;
		void SetFrontPlaneDistance (const Standard_Real aFrontPlaneDistance);
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "	:rtype: float
") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance ();
		%feature("compactdefaultargs") SetFrontPlaneClipping;
		%feature("autodoc", "	:param aFrontPlaneClipping:
	:type aFrontPlaneClipping: bool
	:rtype: None
") SetFrontPlaneClipping;
		void SetFrontPlaneClipping (const Standard_Boolean aFrontPlaneClipping);
		%feature("compactdefaultargs") FrontPlaneClipping;
		%feature("autodoc", "	:rtype: bool
") FrontPlaneClipping;
		Standard_Boolean FrontPlaneClipping ();
		%feature("compactdefaultargs") SetBackPlaneDistance;
		%feature("autodoc", "	:param aBackPlaneDistance:
	:type aBackPlaneDistance: float
	:rtype: None
") SetBackPlaneDistance;
		void SetBackPlaneDistance (const Standard_Real aBackPlaneDistance);
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "	:rtype: float
") BackPlaneDistance;
		Standard_Real BackPlaneDistance ();
		%feature("compactdefaultargs") SetBackPlaneClipping;
		%feature("autodoc", "	:param aBackPlaneClipping:
	:type aBackPlaneClipping: bool
	:rtype: None
") SetBackPlaneClipping;
		void SetBackPlaneClipping (const Standard_Boolean aBackPlaneClipping);
		%feature("compactdefaultargs") BackPlaneClipping;
		%feature("autodoc", "	:rtype: bool
") BackPlaneClipping;
		Standard_Boolean BackPlaneClipping ();
		%feature("compactdefaultargs") SetViewVolumeSidesClipping;
		%feature("autodoc", "	:param aViewVolumeSidesClipping:
	:type aViewVolumeSidesClipping: bool
	:rtype: None
") SetViewVolumeSidesClipping;
		void SetViewVolumeSidesClipping (const Standard_Boolean aViewVolumeSidesClipping);
		%feature("compactdefaultargs") ViewVolumeSidesClipping;
		%feature("autodoc", "	:rtype: bool
") ViewVolumeSidesClipping;
		Standard_Boolean ViewVolumeSidesClipping ();
		%feature("compactdefaultargs") SetViewWindow;
		%feature("autodoc", "	:param aViewWindow:
	:type aViewWindow: Handle_StepVisual_PlanarBox &
	:rtype: None
") SetViewWindow;
		void SetViewWindow (const Handle_StepVisual_PlanarBox & aViewWindow);
		%feature("compactdefaultargs") ViewWindow;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PlanarBox
") ViewWindow;
		Handle_StepVisual_PlanarBox ViewWindow ();
};


%extend StepVisual_ViewVolume {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_ViewVolume(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_ViewVolume::Handle_StepVisual_ViewVolume %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_ViewVolume;
class Handle_StepVisual_ViewVolume : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepVisual_ViewVolume();
        Handle_StepVisual_ViewVolume(const Handle_StepVisual_ViewVolume &aHandle);
        Handle_StepVisual_ViewVolume(const StepVisual_ViewVolume *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_ViewVolume DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_ViewVolume {
    StepVisual_ViewVolume* _get_reference() {
    return (StepVisual_ViewVolume*)$self->Access();
    }
};

%extend Handle_StepVisual_ViewVolume {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_ViewVolume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_AnnotationOccurrence;
class StepVisual_AnnotationOccurrence : public StepVisual_StyledItem {
	public:
		%feature("compactdefaultargs") StepVisual_AnnotationOccurrence;
		%feature("autodoc", "	* Returns a AnnotationOccurrence

	:rtype: None
") StepVisual_AnnotationOccurrence;
		 StepVisual_AnnotationOccurrence ();
};


%extend StepVisual_AnnotationOccurrence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_AnnotationOccurrence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_AnnotationOccurrence::Handle_StepVisual_AnnotationOccurrence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_AnnotationOccurrence;
class Handle_StepVisual_AnnotationOccurrence : public Handle_StepVisual_StyledItem {

    public:
        // constructors
        Handle_StepVisual_AnnotationOccurrence();
        Handle_StepVisual_AnnotationOccurrence(const Handle_StepVisual_AnnotationOccurrence &aHandle);
        Handle_StepVisual_AnnotationOccurrence(const StepVisual_AnnotationOccurrence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_AnnotationOccurrence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_AnnotationOccurrence {
    StepVisual_AnnotationOccurrence* _get_reference() {
    return (StepVisual_AnnotationOccurrence*)$self->Access();
    }
};

%extend Handle_StepVisual_AnnotationOccurrence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_AnnotationOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_BackgroundColour;
class StepVisual_BackgroundColour : public StepVisual_Colour {
	public:
		%feature("compactdefaultargs") StepVisual_BackgroundColour;
		%feature("autodoc", "	* Returns a BackgroundColour

	:rtype: None
") StepVisual_BackgroundColour;
		 StepVisual_BackgroundColour ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aPresentation:
	:type aPresentation: StepVisual_AreaOrView &
	:rtype: void
") Init;
		virtual void Init (const StepVisual_AreaOrView & aPresentation);
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "	:param aPresentation:
	:type aPresentation: StepVisual_AreaOrView &
	:rtype: None
") SetPresentation;
		void SetPresentation (const StepVisual_AreaOrView & aPresentation);
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	:rtype: StepVisual_AreaOrView
") Presentation;
		StepVisual_AreaOrView Presentation ();
};


%extend StepVisual_BackgroundColour {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_BackgroundColour(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_BackgroundColour::Handle_StepVisual_BackgroundColour %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_BackgroundColour;
class Handle_StepVisual_BackgroundColour : public Handle_StepVisual_Colour {

    public:
        // constructors
        Handle_StepVisual_BackgroundColour();
        Handle_StepVisual_BackgroundColour(const Handle_StepVisual_BackgroundColour &aHandle);
        Handle_StepVisual_BackgroundColour(const StepVisual_BackgroundColour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_BackgroundColour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_BackgroundColour {
    StepVisual_BackgroundColour* _get_reference() {
    return (StepVisual_BackgroundColour*)$self->Access();
    }
};

%extend Handle_StepVisual_BackgroundColour {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_BackgroundColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CameraImage2dWithScale;
class StepVisual_CameraImage2dWithScale : public StepVisual_CameraImage {
	public:
		%feature("compactdefaultargs") StepVisual_CameraImage2dWithScale;
		%feature("autodoc", "	:rtype: None
") StepVisual_CameraImage2dWithScale;
		 StepVisual_CameraImage2dWithScale ();
};


%extend StepVisual_CameraImage2dWithScale {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CameraImage2dWithScale(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CameraImage2dWithScale::Handle_StepVisual_CameraImage2dWithScale %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CameraImage2dWithScale;
class Handle_StepVisual_CameraImage2dWithScale : public Handle_StepVisual_CameraImage {

    public:
        // constructors
        Handle_StepVisual_CameraImage2dWithScale();
        Handle_StepVisual_CameraImage2dWithScale(const Handle_StepVisual_CameraImage2dWithScale &aHandle);
        Handle_StepVisual_CameraImage2dWithScale(const StepVisual_CameraImage2dWithScale *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CameraImage2dWithScale DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CameraImage2dWithScale {
    StepVisual_CameraImage2dWithScale* _get_reference() {
    return (StepVisual_CameraImage2dWithScale*)$self->Access();
    }
};

%extend Handle_StepVisual_CameraImage2dWithScale {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CameraImage2dWithScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CameraImage3dWithScale;
class StepVisual_CameraImage3dWithScale : public StepVisual_CameraImage {
	public:
		%feature("compactdefaultargs") StepVisual_CameraImage3dWithScale;
		%feature("autodoc", "	:rtype: None
") StepVisual_CameraImage3dWithScale;
		 StepVisual_CameraImage3dWithScale ();
};


%extend StepVisual_CameraImage3dWithScale {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CameraImage3dWithScale(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CameraImage3dWithScale::Handle_StepVisual_CameraImage3dWithScale %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CameraImage3dWithScale;
class Handle_StepVisual_CameraImage3dWithScale : public Handle_StepVisual_CameraImage {

    public:
        // constructors
        Handle_StepVisual_CameraImage3dWithScale();
        Handle_StepVisual_CameraImage3dWithScale(const Handle_StepVisual_CameraImage3dWithScale &aHandle);
        Handle_StepVisual_CameraImage3dWithScale(const StepVisual_CameraImage3dWithScale *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CameraImage3dWithScale DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CameraImage3dWithScale {
    StepVisual_CameraImage3dWithScale* _get_reference() {
    return (StepVisual_CameraImage3dWithScale*)$self->Access();
    }
};

%extend Handle_StepVisual_CameraImage3dWithScale {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CameraImage3dWithScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CameraModelD2;
class StepVisual_CameraModelD2 : public StepVisual_CameraModel {
	public:
		%feature("compactdefaultargs") StepVisual_CameraModelD2;
		%feature("autodoc", "	* Returns a CameraModelD2

	:rtype: None
") StepVisual_CameraModelD2;
		 StepVisual_CameraModelD2 ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aViewWindow:
	:type aViewWindow: Handle_StepVisual_PlanarBox &
	:param aViewWindowClipping:
	:type aViewWindowClipping: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_PlanarBox & aViewWindow,const Standard_Boolean aViewWindowClipping);
		%feature("compactdefaultargs") SetViewWindow;
		%feature("autodoc", "	:param aViewWindow:
	:type aViewWindow: Handle_StepVisual_PlanarBox &
	:rtype: None
") SetViewWindow;
		void SetViewWindow (const Handle_StepVisual_PlanarBox & aViewWindow);
		%feature("compactdefaultargs") ViewWindow;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PlanarBox
") ViewWindow;
		Handle_StepVisual_PlanarBox ViewWindow ();
		%feature("compactdefaultargs") SetViewWindowClipping;
		%feature("autodoc", "	:param aViewWindowClipping:
	:type aViewWindowClipping: bool
	:rtype: None
") SetViewWindowClipping;
		void SetViewWindowClipping (const Standard_Boolean aViewWindowClipping);
		%feature("compactdefaultargs") ViewWindowClipping;
		%feature("autodoc", "	:rtype: bool
") ViewWindowClipping;
		Standard_Boolean ViewWindowClipping ();
};


%extend StepVisual_CameraModelD2 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CameraModelD2(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CameraModelD2::Handle_StepVisual_CameraModelD2 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CameraModelD2;
class Handle_StepVisual_CameraModelD2 : public Handle_StepVisual_CameraModel {

    public:
        // constructors
        Handle_StepVisual_CameraModelD2();
        Handle_StepVisual_CameraModelD2(const Handle_StepVisual_CameraModelD2 &aHandle);
        Handle_StepVisual_CameraModelD2(const StepVisual_CameraModelD2 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CameraModelD2 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CameraModelD2 {
    StepVisual_CameraModelD2* _get_reference() {
    return (StepVisual_CameraModelD2*)$self->Access();
    }
};

%extend Handle_StepVisual_CameraModelD2 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CameraModelD2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CameraModelD3;
class StepVisual_CameraModelD3 : public StepVisual_CameraModel {
	public:
		%feature("compactdefaultargs") StepVisual_CameraModelD3;
		%feature("autodoc", "	* Returns a CameraModelD3

	:rtype: None
") StepVisual_CameraModelD3;
		 StepVisual_CameraModelD3 ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aViewReferenceSystem:
	:type aViewReferenceSystem: Handle_StepGeom_Axis2Placement3d &
	:param aPerspectiveOfVolume:
	:type aPerspectiveOfVolume: Handle_StepVisual_ViewVolume &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aViewReferenceSystem,const Handle_StepVisual_ViewVolume & aPerspectiveOfVolume);
		%feature("compactdefaultargs") SetViewReferenceSystem;
		%feature("autodoc", "	:param aViewReferenceSystem:
	:type aViewReferenceSystem: Handle_StepGeom_Axis2Placement3d &
	:rtype: None
") SetViewReferenceSystem;
		void SetViewReferenceSystem (const Handle_StepGeom_Axis2Placement3d & aViewReferenceSystem);
		%feature("compactdefaultargs") ViewReferenceSystem;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis2Placement3d
") ViewReferenceSystem;
		Handle_StepGeom_Axis2Placement3d ViewReferenceSystem ();
		%feature("compactdefaultargs") SetPerspectiveOfVolume;
		%feature("autodoc", "	:param aPerspectiveOfVolume:
	:type aPerspectiveOfVolume: Handle_StepVisual_ViewVolume &
	:rtype: None
") SetPerspectiveOfVolume;
		void SetPerspectiveOfVolume (const Handle_StepVisual_ViewVolume & aPerspectiveOfVolume);
		%feature("compactdefaultargs") PerspectiveOfVolume;
		%feature("autodoc", "	:rtype: Handle_StepVisual_ViewVolume
") PerspectiveOfVolume;
		Handle_StepVisual_ViewVolume PerspectiveOfVolume ();
};


%extend StepVisual_CameraModelD3 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CameraModelD3(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CameraModelD3::Handle_StepVisual_CameraModelD3 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CameraModelD3;
class Handle_StepVisual_CameraModelD3 : public Handle_StepVisual_CameraModel {

    public:
        // constructors
        Handle_StepVisual_CameraModelD3();
        Handle_StepVisual_CameraModelD3(const Handle_StepVisual_CameraModelD3 &aHandle);
        Handle_StepVisual_CameraModelD3(const StepVisual_CameraModelD3 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CameraModelD3 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CameraModelD3 {
    StepVisual_CameraModelD3* _get_reference() {
    return (StepVisual_CameraModelD3*)$self->Access();
    }
};

%extend Handle_StepVisual_CameraModelD3 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CameraModelD3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_ColourSpecification;
class StepVisual_ColourSpecification : public StepVisual_Colour {
	public:
		%feature("compactdefaultargs") StepVisual_ColourSpecification;
		%feature("autodoc", "	* Returns a ColourSpecification

	:rtype: None
") StepVisual_ColourSpecification;
		 StepVisual_ColourSpecification ();
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


%extend StepVisual_ColourSpecification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_ColourSpecification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_ColourSpecification::Handle_StepVisual_ColourSpecification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_ColourSpecification;
class Handle_StepVisual_ColourSpecification : public Handle_StepVisual_Colour {

    public:
        // constructors
        Handle_StepVisual_ColourSpecification();
        Handle_StepVisual_ColourSpecification(const Handle_StepVisual_ColourSpecification &aHandle);
        Handle_StepVisual_ColourSpecification(const StepVisual_ColourSpecification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_ColourSpecification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_ColourSpecification {
    StepVisual_ColourSpecification* _get_reference() {
    return (StepVisual_ColourSpecification*)$self->Access();
    }
};

%extend Handle_StepVisual_ColourSpecification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_ColourSpecification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_CompositeTextWithExtent;
class StepVisual_CompositeTextWithExtent : public StepVisual_CompositeText {
	public:
		%feature("compactdefaultargs") StepVisual_CompositeTextWithExtent;
		%feature("autodoc", "	* Returns a CompositeTextWithExtent

	:rtype: None
") StepVisual_CompositeTextWithExtent;
		 StepVisual_CompositeTextWithExtent ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCollectedText:
	:type aCollectedText: Handle_StepVisual_HArray1OfTextOrCharacter &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfTextOrCharacter & aCollectedText);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCollectedText:
	:type aCollectedText: Handle_StepVisual_HArray1OfTextOrCharacter &
	:param aExtent:
	:type aExtent: Handle_StepVisual_PlanarExtent &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfTextOrCharacter & aCollectedText,const Handle_StepVisual_PlanarExtent & aExtent);
		%feature("compactdefaultargs") SetExtent;
		%feature("autodoc", "	:param aExtent:
	:type aExtent: Handle_StepVisual_PlanarExtent &
	:rtype: None
") SetExtent;
		void SetExtent (const Handle_StepVisual_PlanarExtent & aExtent);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PlanarExtent
") Extent;
		Handle_StepVisual_PlanarExtent Extent ();
};


%extend StepVisual_CompositeTextWithExtent {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_CompositeTextWithExtent(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_CompositeTextWithExtent::Handle_StepVisual_CompositeTextWithExtent %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_CompositeTextWithExtent;
class Handle_StepVisual_CompositeTextWithExtent : public Handle_StepVisual_CompositeText {

    public:
        // constructors
        Handle_StepVisual_CompositeTextWithExtent();
        Handle_StepVisual_CompositeTextWithExtent(const Handle_StepVisual_CompositeTextWithExtent &aHandle);
        Handle_StepVisual_CompositeTextWithExtent(const StepVisual_CompositeTextWithExtent *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_CompositeTextWithExtent DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_CompositeTextWithExtent {
    StepVisual_CompositeTextWithExtent* _get_reference() {
    return (StepVisual_CompositeTextWithExtent*)$self->Access();
    }
};

%extend Handle_StepVisual_CompositeTextWithExtent {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_CompositeTextWithExtent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_ContextDependentInvisibility;
class StepVisual_ContextDependentInvisibility : public StepVisual_Invisibility {
	public:
		%feature("compactdefaultargs") StepVisual_ContextDependentInvisibility;
		%feature("autodoc", "	* Returns a ContextDependentInvisibility

	:rtype: None
") StepVisual_ContextDependentInvisibility;
		 StepVisual_ContextDependentInvisibility ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aInvisibleItems:
	:type aInvisibleItems: Handle_StepVisual_HArray1OfInvisibleItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_HArray1OfInvisibleItem & aInvisibleItems);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aInvisibleItems:
	:type aInvisibleItems: Handle_StepVisual_HArray1OfInvisibleItem &
	:param aPresentationContext:
	:type aPresentationContext: StepVisual_InvisibilityContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_HArray1OfInvisibleItem & aInvisibleItems,const StepVisual_InvisibilityContext & aPresentationContext);
		%feature("compactdefaultargs") SetPresentationContext;
		%feature("autodoc", "	:param aPresentationContext:
	:type aPresentationContext: StepVisual_InvisibilityContext &
	:rtype: None
") SetPresentationContext;
		void SetPresentationContext (const StepVisual_InvisibilityContext & aPresentationContext);
		%feature("compactdefaultargs") PresentationContext;
		%feature("autodoc", "	:rtype: StepVisual_InvisibilityContext
") PresentationContext;
		StepVisual_InvisibilityContext PresentationContext ();
};


%extend StepVisual_ContextDependentInvisibility {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_ContextDependentInvisibility(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_ContextDependentInvisibility::Handle_StepVisual_ContextDependentInvisibility %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_ContextDependentInvisibility;
class Handle_StepVisual_ContextDependentInvisibility : public Handle_StepVisual_Invisibility {

    public:
        // constructors
        Handle_StepVisual_ContextDependentInvisibility();
        Handle_StepVisual_ContextDependentInvisibility(const Handle_StepVisual_ContextDependentInvisibility &aHandle);
        Handle_StepVisual_ContextDependentInvisibility(const StepVisual_ContextDependentInvisibility *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_ContextDependentInvisibility DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_ContextDependentInvisibility {
    StepVisual_ContextDependentInvisibility* _get_reference() {
    return (StepVisual_ContextDependentInvisibility*)$self->Access();
    }
};

%extend Handle_StepVisual_ContextDependentInvisibility {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_ContextDependentInvisibility {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_MechanicalDesignGeometricPresentationRepresentation;
class StepVisual_MechanicalDesignGeometricPresentationRepresentation : public StepVisual_PresentationRepresentation {
	public:
		%feature("compactdefaultargs") StepVisual_MechanicalDesignGeometricPresentationRepresentation;
		%feature("autodoc", "	* Returns a MechanicalDesignGeometricPresentationRepresentation

	:rtype: None
") StepVisual_MechanicalDesignGeometricPresentationRepresentation;
		 StepVisual_MechanicalDesignGeometricPresentationRepresentation ();
};


%extend StepVisual_MechanicalDesignGeometricPresentationRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation::Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation;
class Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation : public Handle_StepVisual_PresentationRepresentation {

    public:
        // constructors
        Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation();
        Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation(const Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation &aHandle);
        Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation(const StepVisual_MechanicalDesignGeometricPresentationRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation {
    StepVisual_MechanicalDesignGeometricPresentationRepresentation* _get_reference() {
    return (StepVisual_MechanicalDesignGeometricPresentationRepresentation*)$self->Access();
    }
};

%extend Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_MechanicalDesignGeometricPresentationRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_OverRidingStyledItem;
class StepVisual_OverRidingStyledItem : public StepVisual_StyledItem {
	public:
		%feature("compactdefaultargs") StepVisual_OverRidingStyledItem;
		%feature("autodoc", "	* Returns a OverRidingStyledItem

	:rtype: None
") StepVisual_OverRidingStyledItem;
		 StepVisual_OverRidingStyledItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfPresentationStyleAssignment &
	:param aItem:
	:type aItem: Handle_StepRepr_RepresentationItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfPresentationStyleAssignment & aStyles,const Handle_StepRepr_RepresentationItem & aItem);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfPresentationStyleAssignment &
	:param aItem:
	:type aItem: Handle_StepRepr_RepresentationItem &
	:param aOverRiddenStyle:
	:type aOverRiddenStyle: Handle_StepVisual_StyledItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfPresentationStyleAssignment & aStyles,const Handle_StepRepr_RepresentationItem & aItem,const Handle_StepVisual_StyledItem & aOverRiddenStyle);
		%feature("compactdefaultargs") SetOverRiddenStyle;
		%feature("autodoc", "	:param aOverRiddenStyle:
	:type aOverRiddenStyle: Handle_StepVisual_StyledItem &
	:rtype: None
") SetOverRiddenStyle;
		void SetOverRiddenStyle (const Handle_StepVisual_StyledItem & aOverRiddenStyle);
		%feature("compactdefaultargs") OverRiddenStyle;
		%feature("autodoc", "	:rtype: Handle_StepVisual_StyledItem
") OverRiddenStyle;
		Handle_StepVisual_StyledItem OverRiddenStyle ();
};


%extend StepVisual_OverRidingStyledItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_OverRidingStyledItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_OverRidingStyledItem::Handle_StepVisual_OverRidingStyledItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_OverRidingStyledItem;
class Handle_StepVisual_OverRidingStyledItem : public Handle_StepVisual_StyledItem {

    public:
        // constructors
        Handle_StepVisual_OverRidingStyledItem();
        Handle_StepVisual_OverRidingStyledItem(const Handle_StepVisual_OverRidingStyledItem &aHandle);
        Handle_StepVisual_OverRidingStyledItem(const StepVisual_OverRidingStyledItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_OverRidingStyledItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_OverRidingStyledItem {
    StepVisual_OverRidingStyledItem* _get_reference() {
    return (StepVisual_OverRidingStyledItem*)$self->Access();
    }
};

%extend Handle_StepVisual_OverRidingStyledItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_OverRidingStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PlanarBox;
class StepVisual_PlanarBox : public StepVisual_PlanarExtent {
	public:
		%feature("compactdefaultargs") StepVisual_PlanarBox;
		%feature("autodoc", "	* Returns a PlanarBox

	:rtype: None
") StepVisual_PlanarBox;
		 StepVisual_PlanarBox ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSizeInX:
	:type aSizeInX: float
	:param aSizeInY:
	:type aSizeInY: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Real aSizeInX,const Standard_Real aSizeInY);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSizeInX:
	:type aSizeInX: float
	:param aSizeInY:
	:type aSizeInY: float
	:param aPlacement:
	:type aPlacement: StepGeom_Axis2Placement &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Real aSizeInX,const Standard_Real aSizeInY,const StepGeom_Axis2Placement & aPlacement);
		%feature("compactdefaultargs") SetPlacement;
		%feature("autodoc", "	:param aPlacement:
	:type aPlacement: StepGeom_Axis2Placement &
	:rtype: None
") SetPlacement;
		void SetPlacement (const StepGeom_Axis2Placement & aPlacement);
		%feature("compactdefaultargs") Placement;
		%feature("autodoc", "	:rtype: StepGeom_Axis2Placement
") Placement;
		StepGeom_Axis2Placement Placement ();
};


%extend StepVisual_PlanarBox {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PlanarBox(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PlanarBox::Handle_StepVisual_PlanarBox %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PlanarBox;
class Handle_StepVisual_PlanarBox : public Handle_StepVisual_PlanarExtent {

    public:
        // constructors
        Handle_StepVisual_PlanarBox();
        Handle_StepVisual_PlanarBox(const Handle_StepVisual_PlanarBox &aHandle);
        Handle_StepVisual_PlanarBox(const StepVisual_PlanarBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PlanarBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PlanarBox {
    StepVisual_PlanarBox* _get_reference() {
    return (StepVisual_PlanarBox*)$self->Access();
    }
};

%extend Handle_StepVisual_PlanarBox {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PlanarBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PreDefinedColour;
class StepVisual_PreDefinedColour : public StepVisual_Colour {
	public:
		%feature("compactdefaultargs") StepVisual_PreDefinedColour;
		%feature("autodoc", "	* Returns a PreDefinedColour

	:rtype: None
") StepVisual_PreDefinedColour;
		 StepVisual_PreDefinedColour ();
		%feature("compactdefaultargs") SetPreDefinedItem;
		%feature("autodoc", "	* set a pre_defined_item part

	:param item:
	:type item: Handle_StepVisual_PreDefinedItem &
	:rtype: None
") SetPreDefinedItem;
		void SetPreDefinedItem (const Handle_StepVisual_PreDefinedItem & item);
		%feature("compactdefaultargs") GetPreDefinedItem;
		%feature("autodoc", "	* return a pre_defined_item part

	:rtype: Handle_StepVisual_PreDefinedItem
") GetPreDefinedItem;
		Handle_StepVisual_PreDefinedItem GetPreDefinedItem ();
};


%extend StepVisual_PreDefinedColour {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PreDefinedColour(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PreDefinedColour::Handle_StepVisual_PreDefinedColour %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PreDefinedColour;
class Handle_StepVisual_PreDefinedColour : public Handle_StepVisual_Colour {

    public:
        // constructors
        Handle_StepVisual_PreDefinedColour();
        Handle_StepVisual_PreDefinedColour(const Handle_StepVisual_PreDefinedColour &aHandle);
        Handle_StepVisual_PreDefinedColour(const StepVisual_PreDefinedColour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PreDefinedColour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PreDefinedColour {
    StepVisual_PreDefinedColour* _get_reference() {
    return (StepVisual_PreDefinedColour*)$self->Access();
    }
};

%extend Handle_StepVisual_PreDefinedColour {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PreDefinedColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PreDefinedCurveFont;
class StepVisual_PreDefinedCurveFont : public StepVisual_PreDefinedItem {
	public:
		%feature("compactdefaultargs") StepVisual_PreDefinedCurveFont;
		%feature("autodoc", "	* Returns a PreDefinedCurveFont

	:rtype: None
") StepVisual_PreDefinedCurveFont;
		 StepVisual_PreDefinedCurveFont ();
};


%extend StepVisual_PreDefinedCurveFont {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PreDefinedCurveFont(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PreDefinedCurveFont::Handle_StepVisual_PreDefinedCurveFont %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PreDefinedCurveFont;
class Handle_StepVisual_PreDefinedCurveFont : public Handle_StepVisual_PreDefinedItem {

    public:
        // constructors
        Handle_StepVisual_PreDefinedCurveFont();
        Handle_StepVisual_PreDefinedCurveFont(const Handle_StepVisual_PreDefinedCurveFont &aHandle);
        Handle_StepVisual_PreDefinedCurveFont(const StepVisual_PreDefinedCurveFont *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PreDefinedCurveFont DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PreDefinedCurveFont {
    StepVisual_PreDefinedCurveFont* _get_reference() {
    return (StepVisual_PreDefinedCurveFont*)$self->Access();
    }
};

%extend Handle_StepVisual_PreDefinedCurveFont {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PreDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PreDefinedTextFont;
class StepVisual_PreDefinedTextFont : public StepVisual_PreDefinedItem {
	public:
		%feature("compactdefaultargs") StepVisual_PreDefinedTextFont;
		%feature("autodoc", "	* Returns a PreDefinedTextFont

	:rtype: None
") StepVisual_PreDefinedTextFont;
		 StepVisual_PreDefinedTextFont ();
};


%extend StepVisual_PreDefinedTextFont {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PreDefinedTextFont(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PreDefinedTextFont::Handle_StepVisual_PreDefinedTextFont %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PreDefinedTextFont;
class Handle_StepVisual_PreDefinedTextFont : public Handle_StepVisual_PreDefinedItem {

    public:
        // constructors
        Handle_StepVisual_PreDefinedTextFont();
        Handle_StepVisual_PreDefinedTextFont(const Handle_StepVisual_PreDefinedTextFont &aHandle);
        Handle_StepVisual_PreDefinedTextFont(const StepVisual_PreDefinedTextFont *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PreDefinedTextFont DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PreDefinedTextFont {
    StepVisual_PreDefinedTextFont* _get_reference() {
    return (StepVisual_PreDefinedTextFont*)$self->Access();
    }
};

%extend Handle_StepVisual_PreDefinedTextFont {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PreDefinedTextFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationArea;
class StepVisual_PresentationArea : public StepVisual_PresentationRepresentation {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationArea;
		%feature("autodoc", "	* Returns a PresentationArea

	:rtype: None
") StepVisual_PresentationArea;
		 StepVisual_PresentationArea ();
};


%extend StepVisual_PresentationArea {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentationArea(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentationArea::Handle_StepVisual_PresentationArea %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentationArea;
class Handle_StepVisual_PresentationArea : public Handle_StepVisual_PresentationRepresentation {

    public:
        // constructors
        Handle_StepVisual_PresentationArea();
        Handle_StepVisual_PresentationArea(const Handle_StepVisual_PresentationArea &aHandle);
        Handle_StepVisual_PresentationArea(const StepVisual_PresentationArea *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentationArea DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentationArea {
    StepVisual_PresentationArea* _get_reference() {
    return (StepVisual_PresentationArea*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentationArea {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentationArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationStyleByContext;
class StepVisual_PresentationStyleByContext : public StepVisual_PresentationStyleAssignment {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationStyleByContext;
		%feature("autodoc", "	* Returns a PresentationStyleByContext

	:rtype: None
") StepVisual_PresentationStyleByContext;
		 StepVisual_PresentationStyleByContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfPresentationStyleSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_HArray1OfPresentationStyleSelect & aStyles);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfPresentationStyleSelect &
	:param aStyleContext:
	:type aStyleContext: StepVisual_StyleContextSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepVisual_HArray1OfPresentationStyleSelect & aStyles,const StepVisual_StyleContextSelect & aStyleContext);
		%feature("compactdefaultargs") SetStyleContext;
		%feature("autodoc", "	:param aStyleContext:
	:type aStyleContext: StepVisual_StyleContextSelect &
	:rtype: None
") SetStyleContext;
		void SetStyleContext (const StepVisual_StyleContextSelect & aStyleContext);
		%feature("compactdefaultargs") StyleContext;
		%feature("autodoc", "	:rtype: StepVisual_StyleContextSelect
") StyleContext;
		StepVisual_StyleContextSelect StyleContext ();
};


%extend StepVisual_PresentationStyleByContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentationStyleByContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentationStyleByContext::Handle_StepVisual_PresentationStyleByContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentationStyleByContext;
class Handle_StepVisual_PresentationStyleByContext : public Handle_StepVisual_PresentationStyleAssignment {

    public:
        // constructors
        Handle_StepVisual_PresentationStyleByContext();
        Handle_StepVisual_PresentationStyleByContext(const Handle_StepVisual_PresentationStyleByContext &aHandle);
        Handle_StepVisual_PresentationStyleByContext(const StepVisual_PresentationStyleByContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentationStyleByContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentationStyleByContext {
    StepVisual_PresentationStyleByContext* _get_reference() {
    return (StepVisual_PresentationStyleByContext*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentationStyleByContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentationStyleByContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_PresentationView;
class StepVisual_PresentationView : public StepVisual_PresentationRepresentation {
	public:
		%feature("compactdefaultargs") StepVisual_PresentationView;
		%feature("autodoc", "	* Returns a PresentationView

	:rtype: None
") StepVisual_PresentationView;
		 StepVisual_PresentationView ();
};


%extend StepVisual_PresentationView {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_PresentationView(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_PresentationView::Handle_StepVisual_PresentationView %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_PresentationView;
class Handle_StepVisual_PresentationView : public Handle_StepVisual_PresentationRepresentation {

    public:
        // constructors
        Handle_StepVisual_PresentationView();
        Handle_StepVisual_PresentationView(const Handle_StepVisual_PresentationView &aHandle);
        Handle_StepVisual_PresentationView(const StepVisual_PresentationView *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_PresentationView DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_PresentationView {
    StepVisual_PresentationView* _get_reference() {
    return (StepVisual_PresentationView*)$self->Access();
    }
};

%extend Handle_StepVisual_PresentationView {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_PresentationView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_TextStyleWithBoxCharacteristics;
class StepVisual_TextStyleWithBoxCharacteristics : public StepVisual_TextStyle {
	public:
		%feature("compactdefaultargs") StepVisual_TextStyleWithBoxCharacteristics;
		%feature("autodoc", "	* Returns a TextStyleWithBoxCharacteristics

	:rtype: None
") StepVisual_TextStyleWithBoxCharacteristics;
		 StepVisual_TextStyleWithBoxCharacteristics ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCharacterAppearance:
	:type aCharacterAppearance: Handle_StepVisual_TextStyleForDefinedFont &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_TextStyleForDefinedFont & aCharacterAppearance);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCharacterAppearance:
	:type aCharacterAppearance: Handle_StepVisual_TextStyleForDefinedFont &
	:param aCharacteristics:
	:type aCharacteristics: Handle_StepVisual_HArray1OfBoxCharacteristicSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_TextStyleForDefinedFont & aCharacterAppearance,const Handle_StepVisual_HArray1OfBoxCharacteristicSelect & aCharacteristics);
		%feature("compactdefaultargs") SetCharacteristics;
		%feature("autodoc", "	:param aCharacteristics:
	:type aCharacteristics: Handle_StepVisual_HArray1OfBoxCharacteristicSelect &
	:rtype: None
") SetCharacteristics;
		void SetCharacteristics (const Handle_StepVisual_HArray1OfBoxCharacteristicSelect & aCharacteristics);
		%feature("compactdefaultargs") Characteristics;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfBoxCharacteristicSelect
") Characteristics;
		Handle_StepVisual_HArray1OfBoxCharacteristicSelect Characteristics ();
		%feature("compactdefaultargs") CharacteristicsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepVisual_BoxCharacteristicSelect
") CharacteristicsValue;
		StepVisual_BoxCharacteristicSelect CharacteristicsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbCharacteristics;
		%feature("autodoc", "	:rtype: int
") NbCharacteristics;
		Standard_Integer NbCharacteristics ();
};


%extend StepVisual_TextStyleWithBoxCharacteristics {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_TextStyleWithBoxCharacteristics(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_TextStyleWithBoxCharacteristics::Handle_StepVisual_TextStyleWithBoxCharacteristics %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_TextStyleWithBoxCharacteristics;
class Handle_StepVisual_TextStyleWithBoxCharacteristics : public Handle_StepVisual_TextStyle {

    public:
        // constructors
        Handle_StepVisual_TextStyleWithBoxCharacteristics();
        Handle_StepVisual_TextStyleWithBoxCharacteristics(const Handle_StepVisual_TextStyleWithBoxCharacteristics &aHandle);
        Handle_StepVisual_TextStyleWithBoxCharacteristics(const StepVisual_TextStyleWithBoxCharacteristics *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_TextStyleWithBoxCharacteristics DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_TextStyleWithBoxCharacteristics {
    StepVisual_TextStyleWithBoxCharacteristics* _get_reference() {
    return (StepVisual_TextStyleWithBoxCharacteristics*)$self->Access();
    }
};

%extend Handle_StepVisual_TextStyleWithBoxCharacteristics {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_TextStyleWithBoxCharacteristics {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_AnnotationTextOccurrence;
class StepVisual_AnnotationTextOccurrence : public StepVisual_AnnotationOccurrence {
	public:
		%feature("compactdefaultargs") StepVisual_AnnotationTextOccurrence;
		%feature("autodoc", "	* Returns a AnnotationTextOccurrence

	:rtype: None
") StepVisual_AnnotationTextOccurrence;
		 StepVisual_AnnotationTextOccurrence ();
};


%extend StepVisual_AnnotationTextOccurrence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_AnnotationTextOccurrence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_AnnotationTextOccurrence::Handle_StepVisual_AnnotationTextOccurrence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_AnnotationTextOccurrence;
class Handle_StepVisual_AnnotationTextOccurrence : public Handle_StepVisual_AnnotationOccurrence {

    public:
        // constructors
        Handle_StepVisual_AnnotationTextOccurrence();
        Handle_StepVisual_AnnotationTextOccurrence(const Handle_StepVisual_AnnotationTextOccurrence &aHandle);
        Handle_StepVisual_AnnotationTextOccurrence(const StepVisual_AnnotationTextOccurrence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_AnnotationTextOccurrence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_AnnotationTextOccurrence {
    StepVisual_AnnotationTextOccurrence* _get_reference() {
    return (StepVisual_AnnotationTextOccurrence*)$self->Access();
    }
};

%extend Handle_StepVisual_AnnotationTextOccurrence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_AnnotationTextOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_ColourRgb;
class StepVisual_ColourRgb : public StepVisual_ColourSpecification {
	public:
		%feature("compactdefaultargs") StepVisual_ColourRgb;
		%feature("autodoc", "	* Returns a ColourRgb

	:rtype: None
") StepVisual_ColourRgb;
		 StepVisual_ColourRgb ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aRed:
	:type aRed: float
	:param aGreen:
	:type aGreen: float
	:param aBlue:
	:type aBlue: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Real aRed,const Standard_Real aGreen,const Standard_Real aBlue);
		%feature("compactdefaultargs") SetRed;
		%feature("autodoc", "	:param aRed:
	:type aRed: float
	:rtype: None
") SetRed;
		void SetRed (const Standard_Real aRed);
		%feature("compactdefaultargs") Red;
		%feature("autodoc", "	:rtype: float
") Red;
		Standard_Real Red ();
		%feature("compactdefaultargs") SetGreen;
		%feature("autodoc", "	:param aGreen:
	:type aGreen: float
	:rtype: None
") SetGreen;
		void SetGreen (const Standard_Real aGreen);
		%feature("compactdefaultargs") Green;
		%feature("autodoc", "	:rtype: float
") Green;
		Standard_Real Green ();
		%feature("compactdefaultargs") SetBlue;
		%feature("autodoc", "	:param aBlue:
	:type aBlue: float
	:rtype: None
") SetBlue;
		void SetBlue (const Standard_Real aBlue);
		%feature("compactdefaultargs") Blue;
		%feature("autodoc", "	:rtype: float
") Blue;
		Standard_Real Blue ();
};


%extend StepVisual_ColourRgb {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_ColourRgb(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_ColourRgb::Handle_StepVisual_ColourRgb %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_ColourRgb;
class Handle_StepVisual_ColourRgb : public Handle_StepVisual_ColourSpecification {

    public:
        // constructors
        Handle_StepVisual_ColourRgb();
        Handle_StepVisual_ColourRgb(const Handle_StepVisual_ColourRgb &aHandle);
        Handle_StepVisual_ColourRgb(const StepVisual_ColourRgb *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_ColourRgb DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_ColourRgb {
    StepVisual_ColourRgb* _get_reference() {
    return (StepVisual_ColourRgb*)$self->Access();
    }
};

%extend Handle_StepVisual_ColourRgb {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_ColourRgb {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_ContextDependentOverRidingStyledItem;
class StepVisual_ContextDependentOverRidingStyledItem : public StepVisual_OverRidingStyledItem {
	public:
		%feature("compactdefaultargs") StepVisual_ContextDependentOverRidingStyledItem;
		%feature("autodoc", "	* Returns a ContextDependentOverRidingStyledItem

	:rtype: None
") StepVisual_ContextDependentOverRidingStyledItem;
		 StepVisual_ContextDependentOverRidingStyledItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfPresentationStyleAssignment &
	:param aItem:
	:type aItem: Handle_StepRepr_RepresentationItem &
	:param aOverRiddenStyle:
	:type aOverRiddenStyle: Handle_StepVisual_StyledItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfPresentationStyleAssignment & aStyles,const Handle_StepRepr_RepresentationItem & aItem,const Handle_StepVisual_StyledItem & aOverRiddenStyle);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aStyles:
	:type aStyles: Handle_StepVisual_HArray1OfPresentationStyleAssignment &
	:param aItem:
	:type aItem: Handle_StepRepr_RepresentationItem &
	:param aOverRiddenStyle:
	:type aOverRiddenStyle: Handle_StepVisual_StyledItem &
	:param aStyleContext:
	:type aStyleContext: Handle_StepVisual_HArray1OfStyleContextSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepVisual_HArray1OfPresentationStyleAssignment & aStyles,const Handle_StepRepr_RepresentationItem & aItem,const Handle_StepVisual_StyledItem & aOverRiddenStyle,const Handle_StepVisual_HArray1OfStyleContextSelect & aStyleContext);
		%feature("compactdefaultargs") SetStyleContext;
		%feature("autodoc", "	:param aStyleContext:
	:type aStyleContext: Handle_StepVisual_HArray1OfStyleContextSelect &
	:rtype: None
") SetStyleContext;
		void SetStyleContext (const Handle_StepVisual_HArray1OfStyleContextSelect & aStyleContext);
		%feature("compactdefaultargs") StyleContext;
		%feature("autodoc", "	:rtype: Handle_StepVisual_HArray1OfStyleContextSelect
") StyleContext;
		Handle_StepVisual_HArray1OfStyleContextSelect StyleContext ();
		%feature("compactdefaultargs") StyleContextValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepVisual_StyleContextSelect
") StyleContextValue;
		StepVisual_StyleContextSelect StyleContextValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbStyleContext;
		%feature("autodoc", "	:rtype: int
") NbStyleContext;
		Standard_Integer NbStyleContext ();
};


%extend StepVisual_ContextDependentOverRidingStyledItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_ContextDependentOverRidingStyledItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_ContextDependentOverRidingStyledItem::Handle_StepVisual_ContextDependentOverRidingStyledItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_ContextDependentOverRidingStyledItem;
class Handle_StepVisual_ContextDependentOverRidingStyledItem : public Handle_StepVisual_OverRidingStyledItem {

    public:
        // constructors
        Handle_StepVisual_ContextDependentOverRidingStyledItem();
        Handle_StepVisual_ContextDependentOverRidingStyledItem(const Handle_StepVisual_ContextDependentOverRidingStyledItem &aHandle);
        Handle_StepVisual_ContextDependentOverRidingStyledItem(const StepVisual_ContextDependentOverRidingStyledItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_ContextDependentOverRidingStyledItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_ContextDependentOverRidingStyledItem {
    StepVisual_ContextDependentOverRidingStyledItem* _get_reference() {
    return (StepVisual_ContextDependentOverRidingStyledItem*)$self->Access();
    }
};

%extend Handle_StepVisual_ContextDependentOverRidingStyledItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_ContextDependentOverRidingStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_DraughtingAnnotationOccurrence;
class StepVisual_DraughtingAnnotationOccurrence : public StepVisual_AnnotationOccurrence {
	public:
		%feature("compactdefaultargs") StepVisual_DraughtingAnnotationOccurrence;
		%feature("autodoc", "	* Returns a DraughtingAnnotationOccurrence

	:rtype: None
") StepVisual_DraughtingAnnotationOccurrence;
		 StepVisual_DraughtingAnnotationOccurrence ();
};


%extend StepVisual_DraughtingAnnotationOccurrence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_DraughtingAnnotationOccurrence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_DraughtingAnnotationOccurrence::Handle_StepVisual_DraughtingAnnotationOccurrence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_DraughtingAnnotationOccurrence;
class Handle_StepVisual_DraughtingAnnotationOccurrence : public Handle_StepVisual_AnnotationOccurrence {

    public:
        // constructors
        Handle_StepVisual_DraughtingAnnotationOccurrence();
        Handle_StepVisual_DraughtingAnnotationOccurrence(const Handle_StepVisual_DraughtingAnnotationOccurrence &aHandle);
        Handle_StepVisual_DraughtingAnnotationOccurrence(const StepVisual_DraughtingAnnotationOccurrence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_DraughtingAnnotationOccurrence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_DraughtingAnnotationOccurrence {
    StepVisual_DraughtingAnnotationOccurrence* _get_reference() {
    return (StepVisual_DraughtingAnnotationOccurrence*)$self->Access();
    }
};

%extend Handle_StepVisual_DraughtingAnnotationOccurrence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_DraughtingAnnotationOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_DraughtingPreDefinedColour;
class StepVisual_DraughtingPreDefinedColour : public StepVisual_PreDefinedColour {
	public:
		%feature("compactdefaultargs") StepVisual_DraughtingPreDefinedColour;
		%feature("autodoc", "	* Returns a DraughtingPreDefinedColour

	:rtype: None
") StepVisual_DraughtingPreDefinedColour;
		 StepVisual_DraughtingPreDefinedColour ();
};


%extend StepVisual_DraughtingPreDefinedColour {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_DraughtingPreDefinedColour(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_DraughtingPreDefinedColour::Handle_StepVisual_DraughtingPreDefinedColour %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_DraughtingPreDefinedColour;
class Handle_StepVisual_DraughtingPreDefinedColour : public Handle_StepVisual_PreDefinedColour {

    public:
        // constructors
        Handle_StepVisual_DraughtingPreDefinedColour();
        Handle_StepVisual_DraughtingPreDefinedColour(const Handle_StepVisual_DraughtingPreDefinedColour &aHandle);
        Handle_StepVisual_DraughtingPreDefinedColour(const StepVisual_DraughtingPreDefinedColour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_DraughtingPreDefinedColour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_DraughtingPreDefinedColour {
    StepVisual_DraughtingPreDefinedColour* _get_reference() {
    return (StepVisual_DraughtingPreDefinedColour*)$self->Access();
    }
};

%extend Handle_StepVisual_DraughtingPreDefinedColour {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_DraughtingPreDefinedColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_DraughtingPreDefinedCurveFont;
class StepVisual_DraughtingPreDefinedCurveFont : public StepVisual_PreDefinedCurveFont {
	public:
		%feature("compactdefaultargs") StepVisual_DraughtingPreDefinedCurveFont;
		%feature("autodoc", "	* Returns a DraughtingPreDefinedCurveFont

	:rtype: None
") StepVisual_DraughtingPreDefinedCurveFont;
		 StepVisual_DraughtingPreDefinedCurveFont ();
};


%extend StepVisual_DraughtingPreDefinedCurveFont {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_DraughtingPreDefinedCurveFont(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_DraughtingPreDefinedCurveFont::Handle_StepVisual_DraughtingPreDefinedCurveFont %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_DraughtingPreDefinedCurveFont;
class Handle_StepVisual_DraughtingPreDefinedCurveFont : public Handle_StepVisual_PreDefinedCurveFont {

    public:
        // constructors
        Handle_StepVisual_DraughtingPreDefinedCurveFont();
        Handle_StepVisual_DraughtingPreDefinedCurveFont(const Handle_StepVisual_DraughtingPreDefinedCurveFont &aHandle);
        Handle_StepVisual_DraughtingPreDefinedCurveFont(const StepVisual_DraughtingPreDefinedCurveFont *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_DraughtingPreDefinedCurveFont DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_DraughtingPreDefinedCurveFont {
    StepVisual_DraughtingPreDefinedCurveFont* _get_reference() {
    return (StepVisual_DraughtingPreDefinedCurveFont*)$self->Access();
    }
};

%extend Handle_StepVisual_DraughtingPreDefinedCurveFont {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_DraughtingPreDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepVisual_MechanicalDesignGeometricPresentationArea;
class StepVisual_MechanicalDesignGeometricPresentationArea : public StepVisual_PresentationArea {
	public:
		%feature("compactdefaultargs") StepVisual_MechanicalDesignGeometricPresentationArea;
		%feature("autodoc", "	* Returns a MechanicalDesignGeometricPresentationArea

	:rtype: None
") StepVisual_MechanicalDesignGeometricPresentationArea;
		 StepVisual_MechanicalDesignGeometricPresentationArea ();
};


%extend StepVisual_MechanicalDesignGeometricPresentationArea {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepVisual_MechanicalDesignGeometricPresentationArea(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepVisual_MechanicalDesignGeometricPresentationArea::Handle_StepVisual_MechanicalDesignGeometricPresentationArea %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepVisual_MechanicalDesignGeometricPresentationArea;
class Handle_StepVisual_MechanicalDesignGeometricPresentationArea : public Handle_StepVisual_PresentationArea {

    public:
        // constructors
        Handle_StepVisual_MechanicalDesignGeometricPresentationArea();
        Handle_StepVisual_MechanicalDesignGeometricPresentationArea(const Handle_StepVisual_MechanicalDesignGeometricPresentationArea &aHandle);
        Handle_StepVisual_MechanicalDesignGeometricPresentationArea(const StepVisual_MechanicalDesignGeometricPresentationArea *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepVisual_MechanicalDesignGeometricPresentationArea DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepVisual_MechanicalDesignGeometricPresentationArea {
    StepVisual_MechanicalDesignGeometricPresentationArea* _get_reference() {
    return (StepVisual_MechanicalDesignGeometricPresentationArea*)$self->Access();
    }
};

%extend Handle_StepVisual_MechanicalDesignGeometricPresentationArea {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepVisual_MechanicalDesignGeometricPresentationArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
