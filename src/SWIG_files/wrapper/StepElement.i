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
%define STEPELEMENTDOCSTRING
""
%enddef
%module (package="OCC.Core", docstring=STEPELEMENTDOCSTRING) StepElement

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
%include ../common/OccHandle.i


%include StepElement_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum StepElement_ElementVolume {
	StepElement_Volume = 0,
};

enum StepElement_CurveEdge {
	StepElement_ElementEdge = 0,
};

enum StepElement_Volume3dElementShape {
	StepElement_Hexahedron = 0,
	StepElement_Wedge = 1,
	StepElement_Tetrahedron = 2,
	StepElement_Pyramid = 3,
};

enum StepElement_ElementOrder {
	StepElement_Linear = 0,
	StepElement_Quadratic = 1,
	StepElement_Cubic = 2,
};

enum StepElement_Element2dShape {
	StepElement_Quadrilateral = 0,
	StepElement_Triangle = 1,
};

enum StepElement_EnumeratedCurveElementFreedom {
	StepElement_XTranslation = 0,
	StepElement_YTranslation = 1,
	StepElement_ZTranslation = 2,
	StepElement_XRotation = 3,
	StepElement_YRotation = 4,
	StepElement_ZRotation = 5,
	StepElement_Warp = 6,
	StepElement_None = 7,
};

enum StepElement_EnumeratedVolumeElementPurpose {
	StepElement_StressDisplacement = 0,
};

enum StepElement_EnumeratedSurfaceElementPurpose {
	StepElement_MembraneDirect = 0,
	StepElement_MembraneShear = 1,
	StepElement_BendingDirect = 2,
	StepElement_BendingTorsion = 3,
	StepElement_NormalToPlaneShear = 4,
};

enum StepElement_UnspecifiedValue {
	StepElement_Unspecified = 0,
};

enum StepElement_EnumeratedCurveElementPurpose {
	StepElement_Axial = 0,
	StepElement_YYBending = 1,
	StepElement_ZZBending = 2,
	StepElement_Torsion = 3,
	StepElement_XYShear = 4,
	StepElement_XZShear = 5,
	StepElement_Warping = 6,
};

/* end public enums declaration */

%wrap_handle(StepElement_AnalysisItemWithinRepresentation)
%wrap_handle(StepElement_CurveElementEndReleasePacket)
%wrap_handle(StepElement_CurveElementFreedomMember)
%wrap_handle(StepElement_CurveElementPurposeMember)
%wrap_handle(StepElement_CurveElementSectionDefinition)
%wrap_handle(StepElement_ElementAspectMember)
%wrap_handle(StepElement_ElementDescriptor)
%wrap_handle(StepElement_ElementMaterial)
%wrap_handle(StepElement_HArray1OfCurveElementEndReleasePacket)
%wrap_handle(StepElement_HArray1OfCurveElementSectionDefinition)
%wrap_handle(StepElement_HArray1OfHSequenceOfCurveElementPurposeMember)
%wrap_handle(StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember)
%wrap_handle(StepElement_HArray1OfMeasureOrUnspecifiedValue)
%wrap_handle(StepElement_HArray1OfSurfaceSection)
%wrap_handle(StepElement_HArray1OfVolumeElementPurpose)
%wrap_handle(StepElement_HArray1OfVolumeElementPurposeMember)
%wrap_handle(StepElement_HArray2OfCurveElementPurposeMember)
%wrap_handle(StepElement_HArray2OfSurfaceElementPurpose)
%wrap_handle(StepElement_HArray2OfSurfaceElementPurposeMember)
%wrap_handle(StepElement_HSequenceOfCurveElementPurposeMember)
%wrap_handle(StepElement_HSequenceOfCurveElementSectionDefinition)
%wrap_handle(StepElement_HSequenceOfElementMaterial)
%wrap_handle(StepElement_HSequenceOfSurfaceElementPurposeMember)
%wrap_handle(StepElement_MeasureOrUnspecifiedValueMember)
%wrap_handle(StepElement_SequenceNodeOfSequenceOfCurveElementPurposeMember)
%wrap_handle(StepElement_SequenceNodeOfSequenceOfCurveElementSectionDefinition)
%wrap_handle(StepElement_SequenceNodeOfSequenceOfElementMaterial)
%wrap_handle(StepElement_SequenceNodeOfSequenceOfSurfaceElementPurposeMember)
%wrap_handle(StepElement_SurfaceElementProperty)
%wrap_handle(StepElement_SurfaceElementPurposeMember)
%wrap_handle(StepElement_SurfaceSection)
%wrap_handle(StepElement_SurfaceSectionField)
%wrap_handle(StepElement_VolumeElementPurposeMember)
%wrap_handle(StepElement_Curve3dElementDescriptor)
%wrap_handle(StepElement_CurveElementSectionDerivedDefinitions)
%wrap_handle(StepElement_Surface3dElementDescriptor)
%wrap_handle(StepElement_SurfaceSectionFieldConstant)
%wrap_handle(StepElement_SurfaceSectionFieldVarying)
%wrap_handle(StepElement_UniformSurfaceSection)
%wrap_handle(StepElement_Volume3dElementDescriptor)

%nodefaultctor StepElement_AnalysisItemWithinRepresentation;
class StepElement_AnalysisItemWithinRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_AnalysisItemWithinRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_AnalysisItemWithinRepresentation;
		 StepElement_AnalysisItemWithinRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aItem:
	:type aItem: Handle_StepRepr_RepresentationItem &
	:param aRep:
	:type aRep: Handle_StepRepr_Representation &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepRepr_RepresentationItem & aItem,const Handle_StepRepr_Representation & aRep);
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
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	* Returns field Item

	:rtype: Handle_StepRepr_RepresentationItem
") Item;
		Handle_StepRepr_RepresentationItem Item ();
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	* Set field Item

	:param Item:
	:type Item: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetItem;
		void SetItem (const Handle_StepRepr_RepresentationItem & Item);
		%feature("compactdefaultargs") Rep;
		%feature("autodoc", "	* Returns field Rep

	:rtype: Handle_StepRepr_Representation
") Rep;
		Handle_StepRepr_Representation Rep ();
		%feature("compactdefaultargs") SetRep;
		%feature("autodoc", "	* Set field Rep

	:param Rep:
	:type Rep: Handle_StepRepr_Representation &
	:rtype: None
") SetRep;
		void SetRep (const Handle_StepRepr_Representation & Rep);
};


%make_alias(StepElement_AnalysisItemWithinRepresentation)

%extend StepElement_AnalysisItemWithinRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array1OfCurveElementEndReleasePacket;
class StepElement_Array1OfCurveElementEndReleasePacket {
	public:
		%feature("compactdefaultargs") StepElement_Array1OfCurveElementEndReleasePacket;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfCurveElementEndReleasePacket;
		 StepElement_Array1OfCurveElementEndReleasePacket (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_Array1OfCurveElementEndReleasePacket;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepElement_CurveElementEndReleasePacket &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfCurveElementEndReleasePacket;
		 StepElement_Array1OfCurveElementEndReleasePacket (const Handle_StepElement_CurveElementEndReleasePacket & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_CurveElementEndReleasePacket &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_CurveElementEndReleasePacket & V);
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
	:type Other: StepElement_Array1OfCurveElementEndReleasePacket &
	:rtype: StepElement_Array1OfCurveElementEndReleasePacket
") Assign;
		const StepElement_Array1OfCurveElementEndReleasePacket & Assign (const StepElement_Array1OfCurveElementEndReleasePacket & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array1OfCurveElementEndReleasePacket &
	:rtype: StepElement_Array1OfCurveElementEndReleasePacket
") operator =;
		const StepElement_Array1OfCurveElementEndReleasePacket & operator = (const StepElement_Array1OfCurveElementEndReleasePacket & Other);
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
	:type Value: Handle_StepElement_CurveElementEndReleasePacket &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_CurveElementEndReleasePacket & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementEndReleasePacket
") Value;
		Handle_StepElement_CurveElementEndReleasePacket Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementEndReleasePacket
") ChangeValue;
		Handle_StepElement_CurveElementEndReleasePacket ChangeValue (const Standard_Integer Index);
};



%extend StepElement_Array1OfCurveElementEndReleasePacket {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_Array1OfCurveElementEndReleasePacket {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array1OfCurveElementSectionDefinition;
class StepElement_Array1OfCurveElementSectionDefinition {
	public:
		%feature("compactdefaultargs") StepElement_Array1OfCurveElementSectionDefinition;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfCurveElementSectionDefinition;
		 StepElement_Array1OfCurveElementSectionDefinition (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_Array1OfCurveElementSectionDefinition;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepElement_CurveElementSectionDefinition &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfCurveElementSectionDefinition;
		 StepElement_Array1OfCurveElementSectionDefinition (const Handle_StepElement_CurveElementSectionDefinition & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_CurveElementSectionDefinition & V);
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
	:type Other: StepElement_Array1OfCurveElementSectionDefinition &
	:rtype: StepElement_Array1OfCurveElementSectionDefinition
") Assign;
		const StepElement_Array1OfCurveElementSectionDefinition & Assign (const StepElement_Array1OfCurveElementSectionDefinition & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array1OfCurveElementSectionDefinition &
	:rtype: StepElement_Array1OfCurveElementSectionDefinition
") operator =;
		const StepElement_Array1OfCurveElementSectionDefinition & operator = (const StepElement_Array1OfCurveElementSectionDefinition & Other);
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
	:type Value: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_CurveElementSectionDefinition & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementSectionDefinition
") Value;
		Handle_StepElement_CurveElementSectionDefinition Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementSectionDefinition
") ChangeValue;
		Handle_StepElement_CurveElementSectionDefinition ChangeValue (const Standard_Integer Index);
};



%extend StepElement_Array1OfCurveElementSectionDefinition {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_Array1OfCurveElementSectionDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array1OfHSequenceOfCurveElementPurposeMember;
class StepElement_Array1OfHSequenceOfCurveElementPurposeMember {
	public:
		%feature("compactdefaultargs") StepElement_Array1OfHSequenceOfCurveElementPurposeMember;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfHSequenceOfCurveElementPurposeMember;
		 StepElement_Array1OfHSequenceOfCurveElementPurposeMember (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_Array1OfHSequenceOfCurveElementPurposeMember;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepElement_HSequenceOfCurveElementPurposeMember &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfHSequenceOfCurveElementPurposeMember;
		 StepElement_Array1OfHSequenceOfCurveElementPurposeMember (const Handle_StepElement_HSequenceOfCurveElementPurposeMember & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_HSequenceOfCurveElementPurposeMember &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_HSequenceOfCurveElementPurposeMember & V);
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
	:type Other: StepElement_Array1OfHSequenceOfCurveElementPurposeMember &
	:rtype: StepElement_Array1OfHSequenceOfCurveElementPurposeMember
") Assign;
		const StepElement_Array1OfHSequenceOfCurveElementPurposeMember & Assign (const StepElement_Array1OfHSequenceOfCurveElementPurposeMember & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array1OfHSequenceOfCurveElementPurposeMember &
	:rtype: StepElement_Array1OfHSequenceOfCurveElementPurposeMember
") operator =;
		const StepElement_Array1OfHSequenceOfCurveElementPurposeMember & operator = (const StepElement_Array1OfHSequenceOfCurveElementPurposeMember & Other);
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
	:type Value: Handle_StepElement_HSequenceOfCurveElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_HSequenceOfCurveElementPurposeMember & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_HSequenceOfCurveElementPurposeMember
") Value;
		Handle_StepElement_HSequenceOfCurveElementPurposeMember Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_HSequenceOfCurveElementPurposeMember
") ChangeValue;
		Handle_StepElement_HSequenceOfCurveElementPurposeMember ChangeValue (const Standard_Integer Index);
};



%extend StepElement_Array1OfHSequenceOfCurveElementPurposeMember {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_Array1OfHSequenceOfCurveElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember;
class StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember {
	public:
		%feature("compactdefaultargs") StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember;
		 StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember;
		 StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember (const Handle_StepElement_HSequenceOfSurfaceElementPurposeMember & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_HSequenceOfSurfaceElementPurposeMember & V);
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
	:type Other: StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember &
	:rtype: StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember
") Assign;
		const StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember & Assign (const StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember &
	:rtype: StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember
") operator =;
		const StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember & operator = (const StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember & Other);
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
	:type Value: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_HSequenceOfSurfaceElementPurposeMember & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember
") Value;
		Handle_StepElement_HSequenceOfSurfaceElementPurposeMember Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember
") ChangeValue;
		Handle_StepElement_HSequenceOfSurfaceElementPurposeMember ChangeValue (const Standard_Integer Index);
};



%extend StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array1OfMeasureOrUnspecifiedValue;
class StepElement_Array1OfMeasureOrUnspecifiedValue {
	public:
		%feature("compactdefaultargs") StepElement_Array1OfMeasureOrUnspecifiedValue;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfMeasureOrUnspecifiedValue;
		 StepElement_Array1OfMeasureOrUnspecifiedValue (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_Array1OfMeasureOrUnspecifiedValue;
		%feature("autodoc", "	:param Item:
	:type Item: StepElement_MeasureOrUnspecifiedValue &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfMeasureOrUnspecifiedValue;
		 StepElement_Array1OfMeasureOrUnspecifiedValue (const StepElement_MeasureOrUnspecifiedValue & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") Init;
		void Init (const StepElement_MeasureOrUnspecifiedValue & V);
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
	:type Other: StepElement_Array1OfMeasureOrUnspecifiedValue &
	:rtype: StepElement_Array1OfMeasureOrUnspecifiedValue
") Assign;
		const StepElement_Array1OfMeasureOrUnspecifiedValue & Assign (const StepElement_Array1OfMeasureOrUnspecifiedValue & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array1OfMeasureOrUnspecifiedValue &
	:rtype: StepElement_Array1OfMeasureOrUnspecifiedValue
") operator =;
		const StepElement_Array1OfMeasureOrUnspecifiedValue & operator = (const StepElement_Array1OfMeasureOrUnspecifiedValue & Other);
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
	:type Value: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepElement_MeasureOrUnspecifiedValue & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepElement_MeasureOrUnspecifiedValue
") Value;
		const StepElement_MeasureOrUnspecifiedValue & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepElement_MeasureOrUnspecifiedValue
") ChangeValue;
		StepElement_MeasureOrUnspecifiedValue & ChangeValue (const Standard_Integer Index);
};



%extend StepElement_Array1OfMeasureOrUnspecifiedValue {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_Array1OfMeasureOrUnspecifiedValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array1OfSurfaceSection;
class StepElement_Array1OfSurfaceSection {
	public:
		%feature("compactdefaultargs") StepElement_Array1OfSurfaceSection;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfSurfaceSection;
		 StepElement_Array1OfSurfaceSection (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_Array1OfSurfaceSection;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepElement_SurfaceSection &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfSurfaceSection;
		 StepElement_Array1OfSurfaceSection (const Handle_StepElement_SurfaceSection & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_SurfaceSection &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_SurfaceSection & V);
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
	:type Other: StepElement_Array1OfSurfaceSection &
	:rtype: StepElement_Array1OfSurfaceSection
") Assign;
		const StepElement_Array1OfSurfaceSection & Assign (const StepElement_Array1OfSurfaceSection & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array1OfSurfaceSection &
	:rtype: StepElement_Array1OfSurfaceSection
") operator =;
		const StepElement_Array1OfSurfaceSection & operator = (const StepElement_Array1OfSurfaceSection & Other);
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
	:type Value: Handle_StepElement_SurfaceSection &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_SurfaceSection & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_SurfaceSection
") Value;
		Handle_StepElement_SurfaceSection Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_SurfaceSection
") ChangeValue;
		Handle_StepElement_SurfaceSection ChangeValue (const Standard_Integer Index);
};



%extend StepElement_Array1OfSurfaceSection {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_Array1OfSurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array1OfVolumeElementPurpose;
class StepElement_Array1OfVolumeElementPurpose {
	public:
		%feature("compactdefaultargs") StepElement_Array1OfVolumeElementPurpose;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfVolumeElementPurpose;
		 StepElement_Array1OfVolumeElementPurpose (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_Array1OfVolumeElementPurpose;
		%feature("autodoc", "	:param Item:
	:type Item: StepElement_VolumeElementPurpose &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfVolumeElementPurpose;
		 StepElement_Array1OfVolumeElementPurpose (const StepElement_VolumeElementPurpose & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepElement_VolumeElementPurpose &
	:rtype: None
") Init;
		void Init (const StepElement_VolumeElementPurpose & V);
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
	:type Other: StepElement_Array1OfVolumeElementPurpose &
	:rtype: StepElement_Array1OfVolumeElementPurpose
") Assign;
		const StepElement_Array1OfVolumeElementPurpose & Assign (const StepElement_Array1OfVolumeElementPurpose & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array1OfVolumeElementPurpose &
	:rtype: StepElement_Array1OfVolumeElementPurpose
") operator =;
		const StepElement_Array1OfVolumeElementPurpose & operator = (const StepElement_Array1OfVolumeElementPurpose & Other);
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
	:type Value: StepElement_VolumeElementPurpose &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepElement_VolumeElementPurpose & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepElement_VolumeElementPurpose
") Value;
		const StepElement_VolumeElementPurpose & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepElement_VolumeElementPurpose
") ChangeValue;
		StepElement_VolumeElementPurpose & ChangeValue (const Standard_Integer Index);
};



%extend StepElement_Array1OfVolumeElementPurpose {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_Array1OfVolumeElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array1OfVolumeElementPurposeMember;
class StepElement_Array1OfVolumeElementPurposeMember {
	public:
		%feature("compactdefaultargs") StepElement_Array1OfVolumeElementPurposeMember;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfVolumeElementPurposeMember;
		 StepElement_Array1OfVolumeElementPurposeMember (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_Array1OfVolumeElementPurposeMember;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepElement_VolumeElementPurposeMember &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_Array1OfVolumeElementPurposeMember;
		 StepElement_Array1OfVolumeElementPurposeMember (const Handle_StepElement_VolumeElementPurposeMember & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_VolumeElementPurposeMember &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_VolumeElementPurposeMember & V);
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
	:type Other: StepElement_Array1OfVolumeElementPurposeMember &
	:rtype: StepElement_Array1OfVolumeElementPurposeMember
") Assign;
		const StepElement_Array1OfVolumeElementPurposeMember & Assign (const StepElement_Array1OfVolumeElementPurposeMember & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array1OfVolumeElementPurposeMember &
	:rtype: StepElement_Array1OfVolumeElementPurposeMember
") operator =;
		const StepElement_Array1OfVolumeElementPurposeMember & operator = (const StepElement_Array1OfVolumeElementPurposeMember & Other);
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
	:type Value: Handle_StepElement_VolumeElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_VolumeElementPurposeMember & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_VolumeElementPurposeMember
") Value;
		Handle_StepElement_VolumeElementPurposeMember Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_VolumeElementPurposeMember
") ChangeValue;
		Handle_StepElement_VolumeElementPurposeMember ChangeValue (const Standard_Integer Index);
};



%extend StepElement_Array1OfVolumeElementPurposeMember {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_Array1OfVolumeElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array2OfCurveElementPurposeMember;
class StepElement_Array2OfCurveElementPurposeMember {
	public:
		%feature("compactdefaultargs") StepElement_Array2OfCurveElementPurposeMember;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepElement_Array2OfCurveElementPurposeMember;
		 StepElement_Array2OfCurveElementPurposeMember (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") StepElement_Array2OfCurveElementPurposeMember;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepElement_CurveElementPurposeMember &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepElement_Array2OfCurveElementPurposeMember;
		 StepElement_Array2OfCurveElementPurposeMember (const Handle_StepElement_CurveElementPurposeMember & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_CurveElementPurposeMember & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array2OfCurveElementPurposeMember &
	:rtype: StepElement_Array2OfCurveElementPurposeMember
") Assign;
		const StepElement_Array2OfCurveElementPurposeMember & Assign (const StepElement_Array2OfCurveElementPurposeMember & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array2OfCurveElementPurposeMember &
	:rtype: StepElement_Array2OfCurveElementPurposeMember
") operator =;
		const StepElement_Array2OfCurveElementPurposeMember & operator = (const StepElement_Array2OfCurveElementPurposeMember & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_StepElement_CurveElementPurposeMember & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepElement_CurveElementPurposeMember
") Value;
		Handle_StepElement_CurveElementPurposeMember Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepElement_CurveElementPurposeMember
") ChangeValue;
		Handle_StepElement_CurveElementPurposeMember ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend StepElement_Array2OfCurveElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array2OfSurfaceElementPurpose;
class StepElement_Array2OfSurfaceElementPurpose {
	public:
		%feature("compactdefaultargs") StepElement_Array2OfSurfaceElementPurpose;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepElement_Array2OfSurfaceElementPurpose;
		 StepElement_Array2OfSurfaceElementPurpose (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") StepElement_Array2OfSurfaceElementPurpose;
		%feature("autodoc", "	:param Item:
	:type Item: StepElement_SurfaceElementPurpose &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepElement_Array2OfSurfaceElementPurpose;
		 StepElement_Array2OfSurfaceElementPurpose (const StepElement_SurfaceElementPurpose & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepElement_SurfaceElementPurpose &
	:rtype: None
") Init;
		void Init (const StepElement_SurfaceElementPurpose & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array2OfSurfaceElementPurpose &
	:rtype: StepElement_Array2OfSurfaceElementPurpose
") Assign;
		const StepElement_Array2OfSurfaceElementPurpose & Assign (const StepElement_Array2OfSurfaceElementPurpose & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array2OfSurfaceElementPurpose &
	:rtype: StepElement_Array2OfSurfaceElementPurpose
") operator =;
		const StepElement_Array2OfSurfaceElementPurpose & operator = (const StepElement_Array2OfSurfaceElementPurpose & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: StepElement_SurfaceElementPurpose &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const StepElement_SurfaceElementPurpose & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: StepElement_SurfaceElementPurpose
") Value;
		const StepElement_SurfaceElementPurpose & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: StepElement_SurfaceElementPurpose
") ChangeValue;
		StepElement_SurfaceElementPurpose & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend StepElement_Array2OfSurfaceElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Array2OfSurfaceElementPurposeMember;
class StepElement_Array2OfSurfaceElementPurposeMember {
	public:
		%feature("compactdefaultargs") StepElement_Array2OfSurfaceElementPurposeMember;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepElement_Array2OfSurfaceElementPurposeMember;
		 StepElement_Array2OfSurfaceElementPurposeMember (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") StepElement_Array2OfSurfaceElementPurposeMember;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepElement_SurfaceElementPurposeMember &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepElement_Array2OfSurfaceElementPurposeMember;
		 StepElement_Array2OfSurfaceElementPurposeMember (const Handle_StepElement_SurfaceElementPurposeMember & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_SurfaceElementPurposeMember & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array2OfSurfaceElementPurposeMember &
	:rtype: StepElement_Array2OfSurfaceElementPurposeMember
") Assign;
		const StepElement_Array2OfSurfaceElementPurposeMember & Assign (const StepElement_Array2OfSurfaceElementPurposeMember & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_Array2OfSurfaceElementPurposeMember &
	:rtype: StepElement_Array2OfSurfaceElementPurposeMember
") operator =;
		const StepElement_Array2OfSurfaceElementPurposeMember & operator = (const StepElement_Array2OfSurfaceElementPurposeMember & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_StepElement_SurfaceElementPurposeMember & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") Value;
		Handle_StepElement_SurfaceElementPurposeMember Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") ChangeValue;
		Handle_StepElement_SurfaceElementPurposeMember ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend StepElement_Array2OfSurfaceElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_CurveElementEndReleasePacket;
class StepElement_CurveElementEndReleasePacket : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_CurveElementEndReleasePacket;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_CurveElementEndReleasePacket;
		 StepElement_CurveElementEndReleasePacket ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aReleaseFreedom:
	:type aReleaseFreedom: StepElement_CurveElementFreedom &
	:param aReleaseStiffness:
	:type aReleaseStiffness: float
	:rtype: None
") Init;
		void Init (const StepElement_CurveElementFreedom & aReleaseFreedom,const Standard_Real aReleaseStiffness);
		%feature("compactdefaultargs") ReleaseFreedom;
		%feature("autodoc", "	* Returns field ReleaseFreedom

	:rtype: StepElement_CurveElementFreedom
") ReleaseFreedom;
		StepElement_CurveElementFreedom ReleaseFreedom ();
		%feature("compactdefaultargs") SetReleaseFreedom;
		%feature("autodoc", "	* Set field ReleaseFreedom

	:param ReleaseFreedom:
	:type ReleaseFreedom: StepElement_CurveElementFreedom &
	:rtype: None
") SetReleaseFreedom;
		void SetReleaseFreedom (const StepElement_CurveElementFreedom & ReleaseFreedom);
		%feature("compactdefaultargs") ReleaseStiffness;
		%feature("autodoc", "	* Returns field ReleaseStiffness

	:rtype: float
") ReleaseStiffness;
		Standard_Real ReleaseStiffness ();
		%feature("compactdefaultargs") SetReleaseStiffness;
		%feature("autodoc", "	* Set field ReleaseStiffness

	:param ReleaseStiffness:
	:type ReleaseStiffness: float
	:rtype: None
") SetReleaseStiffness;
		void SetReleaseStiffness (const Standard_Real ReleaseStiffness);
};


%make_alias(StepElement_CurveElementEndReleasePacket)

%extend StepElement_CurveElementEndReleasePacket {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_CurveElementFreedom;
class StepElement_CurveElementFreedom : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepElement_CurveElementFreedom;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_CurveElementFreedom;
		 StepElement_CurveElementFreedom ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of CurveElementFreedom select type return 0

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a items of select member CurveElementFreedomMember 1 -> EnumeratedCurveElementFreedom 2 -> ApplicationDefinedDegreeOfFreedom 0 else

	:param ent:
	:type ent: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a new select member the type CurveElementFreedomMember

	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") SetEnumeratedCurveElementFreedom;
		%feature("autodoc", "	* Set Value for EnumeratedCurveElementFreedom

	:param aVal:
	:type aVal: StepElement_EnumeratedCurveElementFreedom
	:rtype: None
") SetEnumeratedCurveElementFreedom;
		void SetEnumeratedCurveElementFreedom (const StepElement_EnumeratedCurveElementFreedom aVal);
		%feature("compactdefaultargs") EnumeratedCurveElementFreedom;
		%feature("autodoc", "	* Returns Value as EnumeratedCurveElementFreedom (or Null if another type)

	:rtype: StepElement_EnumeratedCurveElementFreedom
") EnumeratedCurveElementFreedom;
		StepElement_EnumeratedCurveElementFreedom EnumeratedCurveElementFreedom ();
		%feature("compactdefaultargs") SetApplicationDefinedDegreeOfFreedom;
		%feature("autodoc", "	* Set Value for ApplicationDefinedDegreeOfFreedom

	:param aVal:
	:type aVal: Handle_TCollection_HAsciiString &
	:rtype: None
") SetApplicationDefinedDegreeOfFreedom;
		void SetApplicationDefinedDegreeOfFreedom (const Handle_TCollection_HAsciiString & aVal);
		%feature("compactdefaultargs") ApplicationDefinedDegreeOfFreedom;
		%feature("autodoc", "	* Returns Value as ApplicationDefinedDegreeOfFreedom (or Null if another type)

	:rtype: Handle_TCollection_HAsciiString
") ApplicationDefinedDegreeOfFreedom;
		Handle_TCollection_HAsciiString ApplicationDefinedDegreeOfFreedom ();
};


%extend StepElement_CurveElementFreedom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_CurveElementFreedomMember;
class StepElement_CurveElementFreedomMember : public StepData_SelectNamed {
	public:
		%feature("compactdefaultargs") StepElement_CurveElementFreedomMember;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_CurveElementFreedomMember;
		 StepElement_CurveElementFreedomMember ();
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	* Returns True if has name

	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns set name

	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set name

	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Tells if the name of a SelectMember matches a given one;

	:param name:
	:type name: char *
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const char * name);
};


%make_alias(StepElement_CurveElementFreedomMember)

%extend StepElement_CurveElementFreedomMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_CurveElementPurpose;
class StepElement_CurveElementPurpose : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepElement_CurveElementPurpose;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_CurveElementPurpose;
		 StepElement_CurveElementPurpose ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of CurveElementPurpose select type return 0

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a items of select member CurveElementPurposeMember 1 -> EnumeratedCurveElementPurpose 2 -> ApplicationDefinedElementPurpose 0 else

	:param ent:
	:type ent: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a new select member the type CurveElementPurposeMember

	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") SetEnumeratedCurveElementPurpose;
		%feature("autodoc", "	* Set Value for EnumeratedCurveElementPurpose

	:param aVal:
	:type aVal: StepElement_EnumeratedCurveElementPurpose
	:rtype: None
") SetEnumeratedCurveElementPurpose;
		void SetEnumeratedCurveElementPurpose (const StepElement_EnumeratedCurveElementPurpose aVal);
		%feature("compactdefaultargs") EnumeratedCurveElementPurpose;
		%feature("autodoc", "	* Returns Value as EnumeratedCurveElementPurpose (or Null if another type)

	:rtype: StepElement_EnumeratedCurveElementPurpose
") EnumeratedCurveElementPurpose;
		StepElement_EnumeratedCurveElementPurpose EnumeratedCurveElementPurpose ();
		%feature("compactdefaultargs") SetApplicationDefinedElementPurpose;
		%feature("autodoc", "	* Set Value for ApplicationDefinedElementPurpose

	:param aVal:
	:type aVal: Handle_TCollection_HAsciiString &
	:rtype: None
") SetApplicationDefinedElementPurpose;
		void SetApplicationDefinedElementPurpose (const Handle_TCollection_HAsciiString & aVal);
		%feature("compactdefaultargs") ApplicationDefinedElementPurpose;
		%feature("autodoc", "	* Returns Value as ApplicationDefinedElementPurpose (or Null if another type)

	:rtype: Handle_TCollection_HAsciiString
") ApplicationDefinedElementPurpose;
		Handle_TCollection_HAsciiString ApplicationDefinedElementPurpose ();
};


%extend StepElement_CurveElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_CurveElementPurposeMember;
class StepElement_CurveElementPurposeMember : public StepData_SelectNamed {
	public:
		%feature("compactdefaultargs") StepElement_CurveElementPurposeMember;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_CurveElementPurposeMember;
		 StepElement_CurveElementPurposeMember ();
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	* Returns True if has name

	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns set name

	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set name

	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Tells if the name of a SelectMember matches a given one;

	:param name:
	:type name: char *
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const char * name);
};


%make_alias(StepElement_CurveElementPurposeMember)

%extend StepElement_CurveElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_CurveElementSectionDefinition;
class StepElement_CurveElementSectionDefinition : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_CurveElementSectionDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_CurveElementSectionDefinition;
		 StepElement_CurveElementSectionDefinition ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aSectionAngle:
	:type aSectionAngle: float
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aDescription,const Standard_Real aSectionAngle);
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
		%feature("compactdefaultargs") SectionAngle;
		%feature("autodoc", "	* Returns field SectionAngle

	:rtype: float
") SectionAngle;
		Standard_Real SectionAngle ();
		%feature("compactdefaultargs") SetSectionAngle;
		%feature("autodoc", "	* Set field SectionAngle

	:param SectionAngle:
	:type SectionAngle: float
	:rtype: None
") SetSectionAngle;
		void SetSectionAngle (const Standard_Real SectionAngle);
};


%make_alias(StepElement_CurveElementSectionDefinition)

%extend StepElement_CurveElementSectionDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_ElementAspect;
class StepElement_ElementAspect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepElement_ElementAspect;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_ElementAspect;
		 StepElement_ElementAspect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ElementAspect select type return 0

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a items of select member ElementAspectMember 1 -> ElementVolume 2 -> Volume3dFace 3 -> Volume2dFace 4 -> Volume3dEdge 5 -> Volume2dEdge 6 -> Surface3dFace 7 -> Surface2dFace 8 -> Surface3dEdge 9 -> Surface2dEdge 10 -> CurveEdge 0 else

	:param ent:
	:type ent: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a new select member the type ElementAspectMember

	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") SetElementVolume;
		%feature("autodoc", "	* Set Value for ElementVolume

	:param aVal:
	:type aVal: StepElement_ElementVolume
	:rtype: None
") SetElementVolume;
		void SetElementVolume (const StepElement_ElementVolume aVal);
		%feature("compactdefaultargs") ElementVolume;
		%feature("autodoc", "	* Returns Value as ElementVolume (or Null if another type)

	:rtype: StepElement_ElementVolume
") ElementVolume;
		StepElement_ElementVolume ElementVolume ();
		%feature("compactdefaultargs") SetVolume3dFace;
		%feature("autodoc", "	* Set Value for Volume3dFace

	:param aVal:
	:type aVal: int
	:rtype: None
") SetVolume3dFace;
		void SetVolume3dFace (const Standard_Integer aVal);
		%feature("compactdefaultargs") Volume3dFace;
		%feature("autodoc", "	* Returns Value as Volume3dFace (or Null if another type)

	:rtype: int
") Volume3dFace;
		Standard_Integer Volume3dFace ();
		%feature("compactdefaultargs") SetVolume2dFace;
		%feature("autodoc", "	* Set Value for Volume2dFace

	:param aVal:
	:type aVal: int
	:rtype: None
") SetVolume2dFace;
		void SetVolume2dFace (const Standard_Integer aVal);
		%feature("compactdefaultargs") Volume2dFace;
		%feature("autodoc", "	* Returns Value as Volume2dFace (or Null if another type)

	:rtype: int
") Volume2dFace;
		Standard_Integer Volume2dFace ();
		%feature("compactdefaultargs") SetVolume3dEdge;
		%feature("autodoc", "	* Set Value for Volume3dEdge

	:param aVal:
	:type aVal: int
	:rtype: None
") SetVolume3dEdge;
		void SetVolume3dEdge (const Standard_Integer aVal);
		%feature("compactdefaultargs") Volume3dEdge;
		%feature("autodoc", "	* Returns Value as Volume3dEdge (or Null if another type)

	:rtype: int
") Volume3dEdge;
		Standard_Integer Volume3dEdge ();
		%feature("compactdefaultargs") SetVolume2dEdge;
		%feature("autodoc", "	* Set Value for Volume2dEdge

	:param aVal:
	:type aVal: int
	:rtype: None
") SetVolume2dEdge;
		void SetVolume2dEdge (const Standard_Integer aVal);
		%feature("compactdefaultargs") Volume2dEdge;
		%feature("autodoc", "	* Returns Value as Volume2dEdge (or Null if another type)

	:rtype: int
") Volume2dEdge;
		Standard_Integer Volume2dEdge ();
		%feature("compactdefaultargs") SetSurface3dFace;
		%feature("autodoc", "	* Set Value for Surface3dFace

	:param aVal:
	:type aVal: int
	:rtype: None
") SetSurface3dFace;
		void SetSurface3dFace (const Standard_Integer aVal);
		%feature("compactdefaultargs") Surface3dFace;
		%feature("autodoc", "	* Returns Value as Surface3dFace (or Null if another type)

	:rtype: int
") Surface3dFace;
		Standard_Integer Surface3dFace ();
		%feature("compactdefaultargs") SetSurface2dFace;
		%feature("autodoc", "	* Set Value for Surface2dFace

	:param aVal:
	:type aVal: int
	:rtype: None
") SetSurface2dFace;
		void SetSurface2dFace (const Standard_Integer aVal);
		%feature("compactdefaultargs") Surface2dFace;
		%feature("autodoc", "	* Returns Value as Surface2dFace (or Null if another type)

	:rtype: int
") Surface2dFace;
		Standard_Integer Surface2dFace ();
		%feature("compactdefaultargs") SetSurface3dEdge;
		%feature("autodoc", "	* Set Value for Surface3dEdge

	:param aVal:
	:type aVal: int
	:rtype: None
") SetSurface3dEdge;
		void SetSurface3dEdge (const Standard_Integer aVal);
		%feature("compactdefaultargs") Surface3dEdge;
		%feature("autodoc", "	* Returns Value as Surface3dEdge (or Null if another type)

	:rtype: int
") Surface3dEdge;
		Standard_Integer Surface3dEdge ();
		%feature("compactdefaultargs") SetSurface2dEdge;
		%feature("autodoc", "	* Set Value for Surface2dEdge

	:param aVal:
	:type aVal: int
	:rtype: None
") SetSurface2dEdge;
		void SetSurface2dEdge (const Standard_Integer aVal);
		%feature("compactdefaultargs") Surface2dEdge;
		%feature("autodoc", "	* Returns Value as Surface2dEdge (or Null if another type)

	:rtype: int
") Surface2dEdge;
		Standard_Integer Surface2dEdge ();
		%feature("compactdefaultargs") SetCurveEdge;
		%feature("autodoc", "	* Set Value for CurveEdge

	:param aVal:
	:type aVal: StepElement_CurveEdge
	:rtype: None
") SetCurveEdge;
		void SetCurveEdge (const StepElement_CurveEdge aVal);
		%feature("compactdefaultargs") CurveEdge;
		%feature("autodoc", "	* Returns Value as CurveEdge (or Null if another type)

	:rtype: StepElement_CurveEdge
") CurveEdge;
		StepElement_CurveEdge CurveEdge ();
};


%extend StepElement_ElementAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_ElementAspectMember;
class StepElement_ElementAspectMember : public StepData_SelectNamed {
	public:
		%feature("compactdefaultargs") StepElement_ElementAspectMember;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_ElementAspectMember;
		 StepElement_ElementAspectMember ();
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	* Returns True if has name

	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns set name

	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set name

	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Tells if the name of a SelectMember matches a given one;

	:param name:
	:type name: char *
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const char * name);
};


%make_alias(StepElement_ElementAspectMember)

%extend StepElement_ElementAspectMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_ElementDescriptor;
class StepElement_ElementDescriptor : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_ElementDescriptor;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_ElementDescriptor;
		 StepElement_ElementDescriptor ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aTopologyOrder:
	:type aTopologyOrder: StepElement_ElementOrder
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const StepElement_ElementOrder aTopologyOrder,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") TopologyOrder;
		%feature("autodoc", "	* Returns field TopologyOrder

	:rtype: StepElement_ElementOrder
") TopologyOrder;
		StepElement_ElementOrder TopologyOrder ();
		%feature("compactdefaultargs") SetTopologyOrder;
		%feature("autodoc", "	* Set field TopologyOrder

	:param TopologyOrder:
	:type TopologyOrder: StepElement_ElementOrder
	:rtype: None
") SetTopologyOrder;
		void SetTopologyOrder (const StepElement_ElementOrder TopologyOrder);
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


%make_alias(StepElement_ElementDescriptor)

%extend StepElement_ElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_ElementMaterial;
class StepElement_ElementMaterial : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_ElementMaterial;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_ElementMaterial;
		 StepElement_ElementMaterial ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aMaterialId:
	:type aMaterialId: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aProperties:
	:type aProperties: Handle_StepRepr_HArray1OfMaterialPropertyRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aMaterialId,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepRepr_HArray1OfMaterialPropertyRepresentation & aProperties);
		%feature("compactdefaultargs") MaterialId;
		%feature("autodoc", "	* Returns field MaterialId

	:rtype: Handle_TCollection_HAsciiString
") MaterialId;
		Handle_TCollection_HAsciiString MaterialId ();
		%feature("compactdefaultargs") SetMaterialId;
		%feature("autodoc", "	* Set field MaterialId

	:param MaterialId:
	:type MaterialId: Handle_TCollection_HAsciiString &
	:rtype: None
") SetMaterialId;
		void SetMaterialId (const Handle_TCollection_HAsciiString & MaterialId);
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
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "	* Returns field Properties

	:rtype: Handle_StepRepr_HArray1OfMaterialPropertyRepresentation
") Properties;
		Handle_StepRepr_HArray1OfMaterialPropertyRepresentation Properties ();
		%feature("compactdefaultargs") SetProperties;
		%feature("autodoc", "	* Set field Properties

	:param Properties:
	:type Properties: Handle_StepRepr_HArray1OfMaterialPropertyRepresentation &
	:rtype: None
") SetProperties;
		void SetProperties (const Handle_StepRepr_HArray1OfMaterialPropertyRepresentation & Properties);
};


%make_alias(StepElement_ElementMaterial)

%extend StepElement_ElementMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray1OfCurveElementEndReleasePacket;
class StepElement_HArray1OfCurveElementEndReleasePacket : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray1OfCurveElementEndReleasePacket;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_HArray1OfCurveElementEndReleasePacket;
		 StepElement_HArray1OfCurveElementEndReleasePacket (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_HArray1OfCurveElementEndReleasePacket;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepElement_CurveElementEndReleasePacket &
	:rtype: None
") StepElement_HArray1OfCurveElementEndReleasePacket;
		 StepElement_HArray1OfCurveElementEndReleasePacket (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepElement_CurveElementEndReleasePacket & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_CurveElementEndReleasePacket &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_CurveElementEndReleasePacket & V);
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
	:type Value: Handle_StepElement_CurveElementEndReleasePacket &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_CurveElementEndReleasePacket & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementEndReleasePacket
") Value;
		Handle_StepElement_CurveElementEndReleasePacket Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementEndReleasePacket
") ChangeValue;
		Handle_StepElement_CurveElementEndReleasePacket ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfCurveElementEndReleasePacket
") Array1;
		const StepElement_Array1OfCurveElementEndReleasePacket & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfCurveElementEndReleasePacket
") ChangeArray1;
		StepElement_Array1OfCurveElementEndReleasePacket & ChangeArray1 ();
};


%make_alias(StepElement_HArray1OfCurveElementEndReleasePacket)


%extend StepElement_HArray1OfCurveElementEndReleasePacket {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_HArray1OfCurveElementEndReleasePacket {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray1OfCurveElementSectionDefinition;
class StepElement_HArray1OfCurveElementSectionDefinition : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray1OfCurveElementSectionDefinition;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_HArray1OfCurveElementSectionDefinition;
		 StepElement_HArray1OfCurveElementSectionDefinition (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_HArray1OfCurveElementSectionDefinition;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") StepElement_HArray1OfCurveElementSectionDefinition;
		 StepElement_HArray1OfCurveElementSectionDefinition (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepElement_CurveElementSectionDefinition & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_CurveElementSectionDefinition & V);
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
	:type Value: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_CurveElementSectionDefinition & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementSectionDefinition
") Value;
		Handle_StepElement_CurveElementSectionDefinition Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementSectionDefinition
") ChangeValue;
		Handle_StepElement_CurveElementSectionDefinition ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfCurveElementSectionDefinition
") Array1;
		const StepElement_Array1OfCurveElementSectionDefinition & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfCurveElementSectionDefinition
") ChangeArray1;
		StepElement_Array1OfCurveElementSectionDefinition & ChangeArray1 ();
};


%make_alias(StepElement_HArray1OfCurveElementSectionDefinition)


%extend StepElement_HArray1OfCurveElementSectionDefinition {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_HArray1OfCurveElementSectionDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray1OfHSequenceOfCurveElementPurposeMember;
class StepElement_HArray1OfHSequenceOfCurveElementPurposeMember : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray1OfHSequenceOfCurveElementPurposeMember;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_HArray1OfHSequenceOfCurveElementPurposeMember;
		 StepElement_HArray1OfHSequenceOfCurveElementPurposeMember (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_HArray1OfHSequenceOfCurveElementPurposeMember;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepElement_HSequenceOfCurveElementPurposeMember &
	:rtype: None
") StepElement_HArray1OfHSequenceOfCurveElementPurposeMember;
		 StepElement_HArray1OfHSequenceOfCurveElementPurposeMember (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepElement_HSequenceOfCurveElementPurposeMember & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_HSequenceOfCurveElementPurposeMember &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_HSequenceOfCurveElementPurposeMember & V);
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
	:type Value: Handle_StepElement_HSequenceOfCurveElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_HSequenceOfCurveElementPurposeMember & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_HSequenceOfCurveElementPurposeMember
") Value;
		Handle_StepElement_HSequenceOfCurveElementPurposeMember Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_HSequenceOfCurveElementPurposeMember
") ChangeValue;
		Handle_StepElement_HSequenceOfCurveElementPurposeMember ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfHSequenceOfCurveElementPurposeMember
") Array1;
		const StepElement_Array1OfHSequenceOfCurveElementPurposeMember & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfHSequenceOfCurveElementPurposeMember
") ChangeArray1;
		StepElement_Array1OfHSequenceOfCurveElementPurposeMember & ChangeArray1 ();
};


%make_alias(StepElement_HArray1OfHSequenceOfCurveElementPurposeMember)


%extend StepElement_HArray1OfHSequenceOfCurveElementPurposeMember {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_HArray1OfHSequenceOfCurveElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember;
class StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember;
		 StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember &
	:rtype: None
") StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember;
		 StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepElement_HSequenceOfSurfaceElementPurposeMember & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_HSequenceOfSurfaceElementPurposeMember & V);
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
	:type Value: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_HSequenceOfSurfaceElementPurposeMember & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember
") Value;
		Handle_StepElement_HSequenceOfSurfaceElementPurposeMember Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember
") ChangeValue;
		Handle_StepElement_HSequenceOfSurfaceElementPurposeMember ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember
") Array1;
		const StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember
") ChangeArray1;
		StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember & ChangeArray1 ();
};


%make_alias(StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember)


%extend StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray1OfMeasureOrUnspecifiedValue;
class StepElement_HArray1OfMeasureOrUnspecifiedValue : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray1OfMeasureOrUnspecifiedValue;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_HArray1OfMeasureOrUnspecifiedValue;
		 StepElement_HArray1OfMeasureOrUnspecifiedValue (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_HArray1OfMeasureOrUnspecifiedValue;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") StepElement_HArray1OfMeasureOrUnspecifiedValue;
		 StepElement_HArray1OfMeasureOrUnspecifiedValue (const Standard_Integer Low,const Standard_Integer Up,const StepElement_MeasureOrUnspecifiedValue & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") Init;
		void Init (const StepElement_MeasureOrUnspecifiedValue & V);
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
	:type Value: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepElement_MeasureOrUnspecifiedValue & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepElement_MeasureOrUnspecifiedValue
") Value;
		const StepElement_MeasureOrUnspecifiedValue & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepElement_MeasureOrUnspecifiedValue
") ChangeValue;
		StepElement_MeasureOrUnspecifiedValue & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfMeasureOrUnspecifiedValue
") Array1;
		const StepElement_Array1OfMeasureOrUnspecifiedValue & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfMeasureOrUnspecifiedValue
") ChangeArray1;
		StepElement_Array1OfMeasureOrUnspecifiedValue & ChangeArray1 ();
};


%make_alias(StepElement_HArray1OfMeasureOrUnspecifiedValue)


%extend StepElement_HArray1OfMeasureOrUnspecifiedValue {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_HArray1OfMeasureOrUnspecifiedValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray1OfSurfaceSection;
class StepElement_HArray1OfSurfaceSection : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray1OfSurfaceSection;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_HArray1OfSurfaceSection;
		 StepElement_HArray1OfSurfaceSection (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_HArray1OfSurfaceSection;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepElement_SurfaceSection &
	:rtype: None
") StepElement_HArray1OfSurfaceSection;
		 StepElement_HArray1OfSurfaceSection (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepElement_SurfaceSection & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_SurfaceSection &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_SurfaceSection & V);
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
	:type Value: Handle_StepElement_SurfaceSection &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_SurfaceSection & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_SurfaceSection
") Value;
		Handle_StepElement_SurfaceSection Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_SurfaceSection
") ChangeValue;
		Handle_StepElement_SurfaceSection ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfSurfaceSection
") Array1;
		const StepElement_Array1OfSurfaceSection & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfSurfaceSection
") ChangeArray1;
		StepElement_Array1OfSurfaceSection & ChangeArray1 ();
};


%make_alias(StepElement_HArray1OfSurfaceSection)


%extend StepElement_HArray1OfSurfaceSection {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_HArray1OfSurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray1OfVolumeElementPurpose;
class StepElement_HArray1OfVolumeElementPurpose : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray1OfVolumeElementPurpose;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_HArray1OfVolumeElementPurpose;
		 StepElement_HArray1OfVolumeElementPurpose (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_HArray1OfVolumeElementPurpose;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepElement_VolumeElementPurpose &
	:rtype: None
") StepElement_HArray1OfVolumeElementPurpose;
		 StepElement_HArray1OfVolumeElementPurpose (const Standard_Integer Low,const Standard_Integer Up,const StepElement_VolumeElementPurpose & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepElement_VolumeElementPurpose &
	:rtype: None
") Init;
		void Init (const StepElement_VolumeElementPurpose & V);
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
	:type Value: StepElement_VolumeElementPurpose &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepElement_VolumeElementPurpose & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepElement_VolumeElementPurpose
") Value;
		const StepElement_VolumeElementPurpose & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepElement_VolumeElementPurpose
") ChangeValue;
		StepElement_VolumeElementPurpose & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfVolumeElementPurpose
") Array1;
		const StepElement_Array1OfVolumeElementPurpose & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfVolumeElementPurpose
") ChangeArray1;
		StepElement_Array1OfVolumeElementPurpose & ChangeArray1 ();
};


%make_alias(StepElement_HArray1OfVolumeElementPurpose)


%extend StepElement_HArray1OfVolumeElementPurpose {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_HArray1OfVolumeElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray1OfVolumeElementPurposeMember;
class StepElement_HArray1OfVolumeElementPurposeMember : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray1OfVolumeElementPurposeMember;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepElement_HArray1OfVolumeElementPurposeMember;
		 StepElement_HArray1OfVolumeElementPurposeMember (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepElement_HArray1OfVolumeElementPurposeMember;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepElement_VolumeElementPurposeMember &
	:rtype: None
") StepElement_HArray1OfVolumeElementPurposeMember;
		 StepElement_HArray1OfVolumeElementPurposeMember (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepElement_VolumeElementPurposeMember & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_VolumeElementPurposeMember &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_VolumeElementPurposeMember & V);
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
	:type Value: Handle_StepElement_VolumeElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_VolumeElementPurposeMember & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_VolumeElementPurposeMember
") Value;
		Handle_StepElement_VolumeElementPurposeMember Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_VolumeElementPurposeMember
") ChangeValue;
		Handle_StepElement_VolumeElementPurposeMember ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfVolumeElementPurposeMember
") Array1;
		const StepElement_Array1OfVolumeElementPurposeMember & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepElement_Array1OfVolumeElementPurposeMember
") ChangeArray1;
		StepElement_Array1OfVolumeElementPurposeMember & ChangeArray1 ();
};


%make_alias(StepElement_HArray1OfVolumeElementPurposeMember)


%extend StepElement_HArray1OfVolumeElementPurposeMember {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepElement_HArray1OfVolumeElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray2OfCurveElementPurposeMember;
class StepElement_HArray2OfCurveElementPurposeMember : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray2OfCurveElementPurposeMember;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepElement_HArray2OfCurveElementPurposeMember;
		 StepElement_HArray2OfCurveElementPurposeMember (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") StepElement_HArray2OfCurveElementPurposeMember;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") StepElement_HArray2OfCurveElementPurposeMember;
		 StepElement_HArray2OfCurveElementPurposeMember (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_StepElement_CurveElementPurposeMember & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_CurveElementPurposeMember & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_StepElement_CurveElementPurposeMember & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepElement_CurveElementPurposeMember
") Value;
		Handle_StepElement_CurveElementPurposeMember Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepElement_CurveElementPurposeMember
") ChangeValue;
		Handle_StepElement_CurveElementPurposeMember ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: StepElement_Array2OfCurveElementPurposeMember
") Array2;
		const StepElement_Array2OfCurveElementPurposeMember & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: StepElement_Array2OfCurveElementPurposeMember
") ChangeArray2;
		StepElement_Array2OfCurveElementPurposeMember & ChangeArray2 ();
};


%make_alias(StepElement_HArray2OfCurveElementPurposeMember)

%extend StepElement_HArray2OfCurveElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray2OfSurfaceElementPurpose;
class StepElement_HArray2OfSurfaceElementPurpose : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray2OfSurfaceElementPurpose;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepElement_HArray2OfSurfaceElementPurpose;
		 StepElement_HArray2OfSurfaceElementPurpose (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") StepElement_HArray2OfSurfaceElementPurpose;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: StepElement_SurfaceElementPurpose &
	:rtype: None
") StepElement_HArray2OfSurfaceElementPurpose;
		 StepElement_HArray2OfSurfaceElementPurpose (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const StepElement_SurfaceElementPurpose & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepElement_SurfaceElementPurpose &
	:rtype: None
") Init;
		void Init (const StepElement_SurfaceElementPurpose & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: StepElement_SurfaceElementPurpose &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const StepElement_SurfaceElementPurpose & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: StepElement_SurfaceElementPurpose
") Value;
		const StepElement_SurfaceElementPurpose & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: StepElement_SurfaceElementPurpose
") ChangeValue;
		StepElement_SurfaceElementPurpose & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: StepElement_Array2OfSurfaceElementPurpose
") Array2;
		const StepElement_Array2OfSurfaceElementPurpose & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: StepElement_Array2OfSurfaceElementPurpose
") ChangeArray2;
		StepElement_Array2OfSurfaceElementPurpose & ChangeArray2 ();
};


%make_alias(StepElement_HArray2OfSurfaceElementPurpose)

%extend StepElement_HArray2OfSurfaceElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HArray2OfSurfaceElementPurposeMember;
class StepElement_HArray2OfSurfaceElementPurposeMember : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HArray2OfSurfaceElementPurposeMember;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepElement_HArray2OfSurfaceElementPurposeMember;
		 StepElement_HArray2OfSurfaceElementPurposeMember (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") StepElement_HArray2OfSurfaceElementPurposeMember;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") StepElement_HArray2OfSurfaceElementPurposeMember;
		 StepElement_HArray2OfSurfaceElementPurposeMember (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_StepElement_SurfaceElementPurposeMember & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_SurfaceElementPurposeMember & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_StepElement_SurfaceElementPurposeMember & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") Value;
		Handle_StepElement_SurfaceElementPurposeMember Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") ChangeValue;
		Handle_StepElement_SurfaceElementPurposeMember ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: StepElement_Array2OfSurfaceElementPurposeMember
") Array2;
		const StepElement_Array2OfSurfaceElementPurposeMember & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: StepElement_Array2OfSurfaceElementPurposeMember
") ChangeArray2;
		StepElement_Array2OfSurfaceElementPurposeMember & ChangeArray2 ();
};


%make_alias(StepElement_HArray2OfSurfaceElementPurposeMember)

%extend StepElement_HArray2OfSurfaceElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HSequenceOfCurveElementPurposeMember;
class StepElement_HSequenceOfCurveElementPurposeMember : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HSequenceOfCurveElementPurposeMember;
		%feature("autodoc", "	:rtype: None
") StepElement_HSequenceOfCurveElementPurposeMember;
		 StepElement_HSequenceOfCurveElementPurposeMember ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_CurveElementPurposeMember & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfCurveElementPurposeMember &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_HSequenceOfCurveElementPurposeMember & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_CurveElementPurposeMember & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfCurveElementPurposeMember &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_HSequenceOfCurveElementPurposeMember & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepElement_CurveElementPurposeMember & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfCurveElementPurposeMember &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepElement_HSequenceOfCurveElementPurposeMember & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepElement_CurveElementPurposeMember & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfCurveElementPurposeMember &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepElement_HSequenceOfCurveElementPurposeMember & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_HSequenceOfCurveElementPurposeMember
") Split;
		Handle_StepElement_HSequenceOfCurveElementPurposeMember Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_StepElement_CurveElementPurposeMember & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_CurveElementPurposeMember
") Value;
		Handle_StepElement_CurveElementPurposeMember Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_CurveElementPurposeMember
") ChangeValue;
		Handle_StepElement_CurveElementPurposeMember ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: StepElement_SequenceOfCurveElementPurposeMember
") Sequence;
		const StepElement_SequenceOfCurveElementPurposeMember & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: StepElement_SequenceOfCurveElementPurposeMember
") ChangeSequence;
		StepElement_SequenceOfCurveElementPurposeMember & ChangeSequence ();
};


%make_alias(StepElement_HSequenceOfCurveElementPurposeMember)

%extend StepElement_HSequenceOfCurveElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HSequenceOfCurveElementSectionDefinition;
class StepElement_HSequenceOfCurveElementSectionDefinition : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HSequenceOfCurveElementSectionDefinition;
		%feature("autodoc", "	:rtype: None
") StepElement_HSequenceOfCurveElementSectionDefinition;
		 StepElement_HSequenceOfCurveElementSectionDefinition ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_CurveElementSectionDefinition & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfCurveElementSectionDefinition &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_HSequenceOfCurveElementSectionDefinition & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_CurveElementSectionDefinition & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfCurveElementSectionDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_HSequenceOfCurveElementSectionDefinition & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepElement_CurveElementSectionDefinition & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfCurveElementSectionDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepElement_HSequenceOfCurveElementSectionDefinition & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepElement_CurveElementSectionDefinition & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfCurveElementSectionDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepElement_HSequenceOfCurveElementSectionDefinition & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_HSequenceOfCurveElementSectionDefinition
") Split;
		Handle_StepElement_HSequenceOfCurveElementSectionDefinition Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_StepElement_CurveElementSectionDefinition & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_CurveElementSectionDefinition
") Value;
		Handle_StepElement_CurveElementSectionDefinition Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_CurveElementSectionDefinition
") ChangeValue;
		Handle_StepElement_CurveElementSectionDefinition ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: StepElement_SequenceOfCurveElementSectionDefinition
") Sequence;
		const StepElement_SequenceOfCurveElementSectionDefinition & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: StepElement_SequenceOfCurveElementSectionDefinition
") ChangeSequence;
		StepElement_SequenceOfCurveElementSectionDefinition & ChangeSequence ();
};


%make_alias(StepElement_HSequenceOfCurveElementSectionDefinition)

%extend StepElement_HSequenceOfCurveElementSectionDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HSequenceOfElementMaterial;
class StepElement_HSequenceOfElementMaterial : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HSequenceOfElementMaterial;
		%feature("autodoc", "	:rtype: None
") StepElement_HSequenceOfElementMaterial;
		 StepElement_HSequenceOfElementMaterial ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepElement_ElementMaterial &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_ElementMaterial & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfElementMaterial &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_HSequenceOfElementMaterial & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepElement_ElementMaterial &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_ElementMaterial & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfElementMaterial &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_HSequenceOfElementMaterial & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_ElementMaterial &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepElement_ElementMaterial & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfElementMaterial &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepElement_HSequenceOfElementMaterial & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_ElementMaterial &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepElement_ElementMaterial & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfElementMaterial &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepElement_HSequenceOfElementMaterial & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_HSequenceOfElementMaterial
") Split;
		Handle_StepElement_HSequenceOfElementMaterial Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_ElementMaterial &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_StepElement_ElementMaterial & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_ElementMaterial
") Value;
		Handle_StepElement_ElementMaterial Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_ElementMaterial
") ChangeValue;
		Handle_StepElement_ElementMaterial ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: StepElement_SequenceOfElementMaterial
") Sequence;
		const StepElement_SequenceOfElementMaterial & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: StepElement_SequenceOfElementMaterial
") ChangeSequence;
		StepElement_SequenceOfElementMaterial & ChangeSequence ();
};


%make_alias(StepElement_HSequenceOfElementMaterial)

%extend StepElement_HSequenceOfElementMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_HSequenceOfSurfaceElementPurposeMember;
class StepElement_HSequenceOfSurfaceElementPurposeMember : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_HSequenceOfSurfaceElementPurposeMember;
		%feature("autodoc", "	:rtype: None
") StepElement_HSequenceOfSurfaceElementPurposeMember;
		 StepElement_HSequenceOfSurfaceElementPurposeMember ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_SurfaceElementPurposeMember & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_HSequenceOfSurfaceElementPurposeMember & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_SurfaceElementPurposeMember & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_HSequenceOfSurfaceElementPurposeMember & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepElement_SurfaceElementPurposeMember & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepElement_HSequenceOfSurfaceElementPurposeMember & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepElement_SurfaceElementPurposeMember & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepElement_HSequenceOfSurfaceElementPurposeMember & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_HSequenceOfSurfaceElementPurposeMember
") Split;
		Handle_StepElement_HSequenceOfSurfaceElementPurposeMember Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_StepElement_SurfaceElementPurposeMember & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") Value;
		Handle_StepElement_SurfaceElementPurposeMember Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") ChangeValue;
		Handle_StepElement_SurfaceElementPurposeMember ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: StepElement_SequenceOfSurfaceElementPurposeMember
") Sequence;
		const StepElement_SequenceOfSurfaceElementPurposeMember & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: StepElement_SequenceOfSurfaceElementPurposeMember
") ChangeSequence;
		StepElement_SequenceOfSurfaceElementPurposeMember & ChangeSequence ();
};


%make_alias(StepElement_HSequenceOfSurfaceElementPurposeMember)

%extend StepElement_HSequenceOfSurfaceElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_MeasureOrUnspecifiedValue;
class StepElement_MeasureOrUnspecifiedValue : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepElement_MeasureOrUnspecifiedValue;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_MeasureOrUnspecifiedValue;
		 StepElement_MeasureOrUnspecifiedValue ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of MeasureOrUnspecifiedValue select type return 0

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a items of select member MeasureOrUnspecifiedValueMember 1 -> ContextDependentMeasure 2 -> UnspecifiedValue 0 else

	:param ent:
	:type ent: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a new select member the type MeasureOrUnspecifiedValueMember

	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") SetContextDependentMeasure;
		%feature("autodoc", "	* Set Value for ContextDependentMeasure

	:param aVal:
	:type aVal: float
	:rtype: None
") SetContextDependentMeasure;
		void SetContextDependentMeasure (const Standard_Real aVal);
		%feature("compactdefaultargs") ContextDependentMeasure;
		%feature("autodoc", "	* Returns Value as ContextDependentMeasure (or Null if another type)

	:rtype: float
") ContextDependentMeasure;
		Standard_Real ContextDependentMeasure ();
		%feature("compactdefaultargs") SetUnspecifiedValue;
		%feature("autodoc", "	* Set Value for UnspecifiedValue

	:param aVal:
	:type aVal: StepElement_UnspecifiedValue
	:rtype: None
") SetUnspecifiedValue;
		void SetUnspecifiedValue (const StepElement_UnspecifiedValue aVal);
		%feature("compactdefaultargs") UnspecifiedValue;
		%feature("autodoc", "	* Returns Value as UnspecifiedValue (or Null if another type)

	:rtype: StepElement_UnspecifiedValue
") UnspecifiedValue;
		StepElement_UnspecifiedValue UnspecifiedValue ();
};


%extend StepElement_MeasureOrUnspecifiedValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_MeasureOrUnspecifiedValueMember;
class StepElement_MeasureOrUnspecifiedValueMember : public StepData_SelectNamed {
	public:
		%feature("compactdefaultargs") StepElement_MeasureOrUnspecifiedValueMember;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_MeasureOrUnspecifiedValueMember;
		 StepElement_MeasureOrUnspecifiedValueMember ();
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	* Returns True if has name

	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns set name

	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set name

	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Tells if the name of a SelectMember matches a given one;

	:param name:
	:type name: char *
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const char * name);
};


%make_alias(StepElement_MeasureOrUnspecifiedValueMember)

%extend StepElement_MeasureOrUnspecifiedValueMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SequenceNodeOfSequenceOfCurveElementPurposeMember;
class StepElement_SequenceNodeOfSequenceOfCurveElementPurposeMember : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StepElement_SequenceNodeOfSequenceOfCurveElementPurposeMember;
		%feature("autodoc", "	:param I:
	:type I: Handle_StepElement_CurveElementPurposeMember &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StepElement_SequenceNodeOfSequenceOfCurveElementPurposeMember;
		 StepElement_SequenceNodeOfSequenceOfCurveElementPurposeMember (const Handle_StepElement_CurveElementPurposeMember & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepElement_CurveElementPurposeMember
") Value;
		Handle_StepElement_CurveElementPurposeMember Value ();
};


%make_alias(StepElement_SequenceNodeOfSequenceOfCurveElementPurposeMember)

%extend StepElement_SequenceNodeOfSequenceOfCurveElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SequenceNodeOfSequenceOfCurveElementSectionDefinition;
class StepElement_SequenceNodeOfSequenceOfCurveElementSectionDefinition : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StepElement_SequenceNodeOfSequenceOfCurveElementSectionDefinition;
		%feature("autodoc", "	:param I:
	:type I: Handle_StepElement_CurveElementSectionDefinition &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StepElement_SequenceNodeOfSequenceOfCurveElementSectionDefinition;
		 StepElement_SequenceNodeOfSequenceOfCurveElementSectionDefinition (const Handle_StepElement_CurveElementSectionDefinition & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepElement_CurveElementSectionDefinition
") Value;
		Handle_StepElement_CurveElementSectionDefinition Value ();
};


%make_alias(StepElement_SequenceNodeOfSequenceOfCurveElementSectionDefinition)

%extend StepElement_SequenceNodeOfSequenceOfCurveElementSectionDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SequenceNodeOfSequenceOfElementMaterial;
class StepElement_SequenceNodeOfSequenceOfElementMaterial : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StepElement_SequenceNodeOfSequenceOfElementMaterial;
		%feature("autodoc", "	:param I:
	:type I: Handle_StepElement_ElementMaterial &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StepElement_SequenceNodeOfSequenceOfElementMaterial;
		 StepElement_SequenceNodeOfSequenceOfElementMaterial (const Handle_StepElement_ElementMaterial & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepElement_ElementMaterial
") Value;
		Handle_StepElement_ElementMaterial Value ();
};


%make_alias(StepElement_SequenceNodeOfSequenceOfElementMaterial)

%extend StepElement_SequenceNodeOfSequenceOfElementMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SequenceNodeOfSequenceOfSurfaceElementPurposeMember;
class StepElement_SequenceNodeOfSequenceOfSurfaceElementPurposeMember : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StepElement_SequenceNodeOfSequenceOfSurfaceElementPurposeMember;
		%feature("autodoc", "	:param I:
	:type I: Handle_StepElement_SurfaceElementPurposeMember &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StepElement_SequenceNodeOfSequenceOfSurfaceElementPurposeMember;
		 StepElement_SequenceNodeOfSequenceOfSurfaceElementPurposeMember (const Handle_StepElement_SurfaceElementPurposeMember & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") Value;
		Handle_StepElement_SurfaceElementPurposeMember Value ();
};


%make_alias(StepElement_SequenceNodeOfSequenceOfSurfaceElementPurposeMember)

%extend StepElement_SequenceNodeOfSequenceOfSurfaceElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SequenceOfCurveElementPurposeMember;
class StepElement_SequenceOfCurveElementPurposeMember : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StepElement_SequenceOfCurveElementPurposeMember;
		%feature("autodoc", "	:rtype: None
") StepElement_SequenceOfCurveElementPurposeMember;
		 StepElement_SequenceOfCurveElementPurposeMember ();
		%feature("compactdefaultargs") StepElement_SequenceOfCurveElementPurposeMember;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfCurveElementPurposeMember &
	:rtype: None
") StepElement_SequenceOfCurveElementPurposeMember;
		 StepElement_SequenceOfCurveElementPurposeMember (const StepElement_SequenceOfCurveElementPurposeMember & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfCurveElementPurposeMember &
	:rtype: StepElement_SequenceOfCurveElementPurposeMember
") Assign;
		const StepElement_SequenceOfCurveElementPurposeMember & Assign (const StepElement_SequenceOfCurveElementPurposeMember & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfCurveElementPurposeMember &
	:rtype: StepElement_SequenceOfCurveElementPurposeMember
") operator =;
		const StepElement_SequenceOfCurveElementPurposeMember & operator = (const StepElement_SequenceOfCurveElementPurposeMember & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_CurveElementPurposeMember & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StepElement_SequenceOfCurveElementPurposeMember &
	:rtype: None
") Append;
		void Append (StepElement_SequenceOfCurveElementPurposeMember & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_CurveElementPurposeMember & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StepElement_SequenceOfCurveElementPurposeMember &
	:rtype: None
") Prepend;
		void Prepend (StepElement_SequenceOfCurveElementPurposeMember & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StepElement_CurveElementPurposeMember & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepElement_SequenceOfCurveElementPurposeMember &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StepElement_SequenceOfCurveElementPurposeMember & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StepElement_CurveElementPurposeMember & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepElement_SequenceOfCurveElementPurposeMember &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StepElement_SequenceOfCurveElementPurposeMember & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StepElement_CurveElementPurposeMember
") First;
		Handle_StepElement_CurveElementPurposeMember First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StepElement_CurveElementPurposeMember
") Last;
		Handle_StepElement_CurveElementPurposeMember Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StepElement_SequenceOfCurveElementPurposeMember &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StepElement_SequenceOfCurveElementPurposeMember & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementPurposeMember
") Value;
		Handle_StepElement_CurveElementPurposeMember Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StepElement_CurveElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_CurveElementPurposeMember & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementPurposeMember
") ChangeValue;
		Handle_StepElement_CurveElementPurposeMember ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend StepElement_SequenceOfCurveElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SequenceOfCurveElementSectionDefinition;
class StepElement_SequenceOfCurveElementSectionDefinition : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StepElement_SequenceOfCurveElementSectionDefinition;
		%feature("autodoc", "	:rtype: None
") StepElement_SequenceOfCurveElementSectionDefinition;
		 StepElement_SequenceOfCurveElementSectionDefinition ();
		%feature("compactdefaultargs") StepElement_SequenceOfCurveElementSectionDefinition;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfCurveElementSectionDefinition &
	:rtype: None
") StepElement_SequenceOfCurveElementSectionDefinition;
		 StepElement_SequenceOfCurveElementSectionDefinition (const StepElement_SequenceOfCurveElementSectionDefinition & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfCurveElementSectionDefinition &
	:rtype: StepElement_SequenceOfCurveElementSectionDefinition
") Assign;
		const StepElement_SequenceOfCurveElementSectionDefinition & Assign (const StepElement_SequenceOfCurveElementSectionDefinition & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfCurveElementSectionDefinition &
	:rtype: StepElement_SequenceOfCurveElementSectionDefinition
") operator =;
		const StepElement_SequenceOfCurveElementSectionDefinition & operator = (const StepElement_SequenceOfCurveElementSectionDefinition & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_CurveElementSectionDefinition & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StepElement_SequenceOfCurveElementSectionDefinition &
	:rtype: None
") Append;
		void Append (StepElement_SequenceOfCurveElementSectionDefinition & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_CurveElementSectionDefinition & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StepElement_SequenceOfCurveElementSectionDefinition &
	:rtype: None
") Prepend;
		void Prepend (StepElement_SequenceOfCurveElementSectionDefinition & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StepElement_CurveElementSectionDefinition & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepElement_SequenceOfCurveElementSectionDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StepElement_SequenceOfCurveElementSectionDefinition & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StepElement_CurveElementSectionDefinition & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepElement_SequenceOfCurveElementSectionDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StepElement_SequenceOfCurveElementSectionDefinition & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StepElement_CurveElementSectionDefinition
") First;
		Handle_StepElement_CurveElementSectionDefinition First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StepElement_CurveElementSectionDefinition
") Last;
		Handle_StepElement_CurveElementSectionDefinition Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StepElement_SequenceOfCurveElementSectionDefinition &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StepElement_SequenceOfCurveElementSectionDefinition & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementSectionDefinition
") Value;
		Handle_StepElement_CurveElementSectionDefinition Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_CurveElementSectionDefinition & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_CurveElementSectionDefinition
") ChangeValue;
		Handle_StepElement_CurveElementSectionDefinition ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend StepElement_SequenceOfCurveElementSectionDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SequenceOfElementMaterial;
class StepElement_SequenceOfElementMaterial : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StepElement_SequenceOfElementMaterial;
		%feature("autodoc", "	:rtype: None
") StepElement_SequenceOfElementMaterial;
		 StepElement_SequenceOfElementMaterial ();
		%feature("compactdefaultargs") StepElement_SequenceOfElementMaterial;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfElementMaterial &
	:rtype: None
") StepElement_SequenceOfElementMaterial;
		 StepElement_SequenceOfElementMaterial (const StepElement_SequenceOfElementMaterial & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfElementMaterial &
	:rtype: StepElement_SequenceOfElementMaterial
") Assign;
		const StepElement_SequenceOfElementMaterial & Assign (const StepElement_SequenceOfElementMaterial & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfElementMaterial &
	:rtype: StepElement_SequenceOfElementMaterial
") operator =;
		const StepElement_SequenceOfElementMaterial & operator = (const StepElement_SequenceOfElementMaterial & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepElement_ElementMaterial &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_ElementMaterial & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StepElement_SequenceOfElementMaterial &
	:rtype: None
") Append;
		void Append (StepElement_SequenceOfElementMaterial & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepElement_ElementMaterial &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_ElementMaterial & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StepElement_SequenceOfElementMaterial &
	:rtype: None
") Prepend;
		void Prepend (StepElement_SequenceOfElementMaterial & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepElement_ElementMaterial &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StepElement_ElementMaterial & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepElement_SequenceOfElementMaterial &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StepElement_SequenceOfElementMaterial & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepElement_ElementMaterial &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StepElement_ElementMaterial & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepElement_SequenceOfElementMaterial &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StepElement_SequenceOfElementMaterial & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StepElement_ElementMaterial
") First;
		Handle_StepElement_ElementMaterial First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StepElement_ElementMaterial
") Last;
		Handle_StepElement_ElementMaterial Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StepElement_SequenceOfElementMaterial &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StepElement_SequenceOfElementMaterial & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_ElementMaterial
") Value;
		Handle_StepElement_ElementMaterial Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StepElement_ElementMaterial &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_ElementMaterial & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_ElementMaterial
") ChangeValue;
		Handle_StepElement_ElementMaterial ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend StepElement_SequenceOfElementMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SequenceOfSurfaceElementPurposeMember;
class StepElement_SequenceOfSurfaceElementPurposeMember : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StepElement_SequenceOfSurfaceElementPurposeMember;
		%feature("autodoc", "	:rtype: None
") StepElement_SequenceOfSurfaceElementPurposeMember;
		 StepElement_SequenceOfSurfaceElementPurposeMember ();
		%feature("compactdefaultargs") StepElement_SequenceOfSurfaceElementPurposeMember;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfSurfaceElementPurposeMember &
	:rtype: None
") StepElement_SequenceOfSurfaceElementPurposeMember;
		 StepElement_SequenceOfSurfaceElementPurposeMember (const StepElement_SequenceOfSurfaceElementPurposeMember & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfSurfaceElementPurposeMember &
	:rtype: StepElement_SequenceOfSurfaceElementPurposeMember
") Assign;
		const StepElement_SequenceOfSurfaceElementPurposeMember & Assign (const StepElement_SequenceOfSurfaceElementPurposeMember & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepElement_SequenceOfSurfaceElementPurposeMember &
	:rtype: StepElement_SequenceOfSurfaceElementPurposeMember
") operator =;
		const StepElement_SequenceOfSurfaceElementPurposeMember & operator = (const StepElement_SequenceOfSurfaceElementPurposeMember & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") Append;
		void Append (const Handle_StepElement_SurfaceElementPurposeMember & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StepElement_SequenceOfSurfaceElementPurposeMember &
	:rtype: None
") Append;
		void Append (StepElement_SequenceOfSurfaceElementPurposeMember & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepElement_SurfaceElementPurposeMember & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StepElement_SequenceOfSurfaceElementPurposeMember &
	:rtype: None
") Prepend;
		void Prepend (StepElement_SequenceOfSurfaceElementPurposeMember & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StepElement_SurfaceElementPurposeMember & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepElement_SequenceOfSurfaceElementPurposeMember &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StepElement_SequenceOfSurfaceElementPurposeMember & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StepElement_SurfaceElementPurposeMember & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepElement_SequenceOfSurfaceElementPurposeMember &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StepElement_SequenceOfSurfaceElementPurposeMember & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") First;
		Handle_StepElement_SurfaceElementPurposeMember First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") Last;
		Handle_StepElement_SurfaceElementPurposeMember Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StepElement_SequenceOfSurfaceElementPurposeMember &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StepElement_SequenceOfSurfaceElementPurposeMember & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") Value;
		Handle_StepElement_SurfaceElementPurposeMember Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StepElement_SurfaceElementPurposeMember &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepElement_SurfaceElementPurposeMember & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepElement_SurfaceElementPurposeMember
") ChangeValue;
		Handle_StepElement_SurfaceElementPurposeMember ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend StepElement_SequenceOfSurfaceElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SurfaceElementProperty;
class StepElement_SurfaceElementProperty : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_SurfaceElementProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_SurfaceElementProperty;
		 StepElement_SurfaceElementProperty ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aPropertyId:
	:type aPropertyId: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aSection:
	:type aSection: Handle_StepElement_SurfaceSectionField &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aPropertyId,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepElement_SurfaceSectionField & aSection);
		%feature("compactdefaultargs") PropertyId;
		%feature("autodoc", "	* Returns field PropertyId

	:rtype: Handle_TCollection_HAsciiString
") PropertyId;
		Handle_TCollection_HAsciiString PropertyId ();
		%feature("compactdefaultargs") SetPropertyId;
		%feature("autodoc", "	* Set field PropertyId

	:param PropertyId:
	:type PropertyId: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPropertyId;
		void SetPropertyId (const Handle_TCollection_HAsciiString & PropertyId);
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
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Returns field Section

	:rtype: Handle_StepElement_SurfaceSectionField
") Section;
		Handle_StepElement_SurfaceSectionField Section ();
		%feature("compactdefaultargs") SetSection;
		%feature("autodoc", "	* Set field Section

	:param Section:
	:type Section: Handle_StepElement_SurfaceSectionField &
	:rtype: None
") SetSection;
		void SetSection (const Handle_StepElement_SurfaceSectionField & Section);
};


%make_alias(StepElement_SurfaceElementProperty)

%extend StepElement_SurfaceElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SurfaceElementPurpose;
class StepElement_SurfaceElementPurpose : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepElement_SurfaceElementPurpose;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_SurfaceElementPurpose;
		 StepElement_SurfaceElementPurpose ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of SurfaceElementPurpose select type return 0

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a items of select member SurfaceElementPurposeMember 1 -> EnumeratedSurfaceElementPurpose 2 -> ApplicationDefinedElementPurpose 0 else

	:param ent:
	:type ent: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a new select member the type SurfaceElementPurposeMember

	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") SetEnumeratedSurfaceElementPurpose;
		%feature("autodoc", "	* Set Value for EnumeratedSurfaceElementPurpose

	:param aVal:
	:type aVal: StepElement_EnumeratedSurfaceElementPurpose
	:rtype: None
") SetEnumeratedSurfaceElementPurpose;
		void SetEnumeratedSurfaceElementPurpose (const StepElement_EnumeratedSurfaceElementPurpose aVal);
		%feature("compactdefaultargs") EnumeratedSurfaceElementPurpose;
		%feature("autodoc", "	* Returns Value as EnumeratedSurfaceElementPurpose (or Null if another type)

	:rtype: StepElement_EnumeratedSurfaceElementPurpose
") EnumeratedSurfaceElementPurpose;
		StepElement_EnumeratedSurfaceElementPurpose EnumeratedSurfaceElementPurpose ();
		%feature("compactdefaultargs") SetApplicationDefinedElementPurpose;
		%feature("autodoc", "	* Set Value for ApplicationDefinedElementPurpose

	:param aVal:
	:type aVal: Handle_TCollection_HAsciiString &
	:rtype: None
") SetApplicationDefinedElementPurpose;
		void SetApplicationDefinedElementPurpose (const Handle_TCollection_HAsciiString & aVal);
		%feature("compactdefaultargs") ApplicationDefinedElementPurpose;
		%feature("autodoc", "	* Returns Value as ApplicationDefinedElementPurpose (or Null if another type)

	:rtype: Handle_TCollection_HAsciiString
") ApplicationDefinedElementPurpose;
		Handle_TCollection_HAsciiString ApplicationDefinedElementPurpose ();
};


%extend StepElement_SurfaceElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SurfaceElementPurposeMember;
class StepElement_SurfaceElementPurposeMember : public StepData_SelectNamed {
	public:
		%feature("compactdefaultargs") StepElement_SurfaceElementPurposeMember;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_SurfaceElementPurposeMember;
		 StepElement_SurfaceElementPurposeMember ();
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	* Returns True if has name

	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns set name

	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set name

	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Tells if the name of a SelectMember matches a given one;

	:param name:
	:type name: char *
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const char * name);
};


%make_alias(StepElement_SurfaceElementPurposeMember)

%extend StepElement_SurfaceElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SurfaceSection;
class StepElement_SurfaceSection : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_SurfaceSection;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_SurfaceSection;
		 StepElement_SurfaceSection ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aOffset:
	:type aOffset: StepElement_MeasureOrUnspecifiedValue &
	:param aNonStructuralMass:
	:type aNonStructuralMass: StepElement_MeasureOrUnspecifiedValue &
	:param aNonStructuralMassOffset:
	:type aNonStructuralMassOffset: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") Init;
		void Init (const StepElement_MeasureOrUnspecifiedValue & aOffset,const StepElement_MeasureOrUnspecifiedValue & aNonStructuralMass,const StepElement_MeasureOrUnspecifiedValue & aNonStructuralMassOffset);
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "	* Returns field Offset

	:rtype: StepElement_MeasureOrUnspecifiedValue
") Offset;
		StepElement_MeasureOrUnspecifiedValue Offset ();
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "	* Set field Offset

	:param Offset:
	:type Offset: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetOffset;
		void SetOffset (const StepElement_MeasureOrUnspecifiedValue & Offset);
		%feature("compactdefaultargs") NonStructuralMass;
		%feature("autodoc", "	* Returns field NonStructuralMass

	:rtype: StepElement_MeasureOrUnspecifiedValue
") NonStructuralMass;
		StepElement_MeasureOrUnspecifiedValue NonStructuralMass ();
		%feature("compactdefaultargs") SetNonStructuralMass;
		%feature("autodoc", "	* Set field NonStructuralMass

	:param NonStructuralMass:
	:type NonStructuralMass: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetNonStructuralMass;
		void SetNonStructuralMass (const StepElement_MeasureOrUnspecifiedValue & NonStructuralMass);
		%feature("compactdefaultargs") NonStructuralMassOffset;
		%feature("autodoc", "	* Returns field NonStructuralMassOffset

	:rtype: StepElement_MeasureOrUnspecifiedValue
") NonStructuralMassOffset;
		StepElement_MeasureOrUnspecifiedValue NonStructuralMassOffset ();
		%feature("compactdefaultargs") SetNonStructuralMassOffset;
		%feature("autodoc", "	* Set field NonStructuralMassOffset

	:param NonStructuralMassOffset:
	:type NonStructuralMassOffset: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetNonStructuralMassOffset;
		void SetNonStructuralMassOffset (const StepElement_MeasureOrUnspecifiedValue & NonStructuralMassOffset);
};


%make_alias(StepElement_SurfaceSection)

%extend StepElement_SurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SurfaceSectionField;
class StepElement_SurfaceSectionField : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepElement_SurfaceSectionField;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_SurfaceSectionField;
		 StepElement_SurfaceSectionField ();
};


%make_alias(StepElement_SurfaceSectionField)

%extend StepElement_SurfaceSectionField {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_VolumeElementPurpose;
class StepElement_VolumeElementPurpose : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepElement_VolumeElementPurpose;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_VolumeElementPurpose;
		 StepElement_VolumeElementPurpose ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of VolumeElementPurpose select type return 0

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a items of select member VolumeElementPurposeMember 1 -> EnumeratedVolumeElementPurpose 2 -> ApplicationDefinedElementPurpose 0 else

	:param ent:
	:type ent: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a new select member the type VolumeElementPurposeMember

	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") SetEnumeratedVolumeElementPurpose;
		%feature("autodoc", "	* Set Value for EnumeratedVolumeElementPurpose

	:param aVal:
	:type aVal: StepElement_EnumeratedVolumeElementPurpose
	:rtype: None
") SetEnumeratedVolumeElementPurpose;
		void SetEnumeratedVolumeElementPurpose (const StepElement_EnumeratedVolumeElementPurpose aVal);
		%feature("compactdefaultargs") EnumeratedVolumeElementPurpose;
		%feature("autodoc", "	* Returns Value as EnumeratedVolumeElementPurpose (or Null if another type)

	:rtype: StepElement_EnumeratedVolumeElementPurpose
") EnumeratedVolumeElementPurpose;
		StepElement_EnumeratedVolumeElementPurpose EnumeratedVolumeElementPurpose ();
		%feature("compactdefaultargs") SetApplicationDefinedElementPurpose;
		%feature("autodoc", "	* Set Value for ApplicationDefinedElementPurpose

	:param aVal:
	:type aVal: Handle_TCollection_HAsciiString &
	:rtype: None
") SetApplicationDefinedElementPurpose;
		void SetApplicationDefinedElementPurpose (const Handle_TCollection_HAsciiString & aVal);
		%feature("compactdefaultargs") ApplicationDefinedElementPurpose;
		%feature("autodoc", "	* Returns Value as ApplicationDefinedElementPurpose (or Null if another type)

	:rtype: Handle_TCollection_HAsciiString
") ApplicationDefinedElementPurpose;
		Handle_TCollection_HAsciiString ApplicationDefinedElementPurpose ();
};


%extend StepElement_VolumeElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_VolumeElementPurposeMember;
class StepElement_VolumeElementPurposeMember : public StepData_SelectNamed {
	public:
		%feature("compactdefaultargs") StepElement_VolumeElementPurposeMember;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_VolumeElementPurposeMember;
		 StepElement_VolumeElementPurposeMember ();
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	* Returns True if has name

	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns set name

	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set name

	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Tells if the name of a SelectMember matches a given one;

	:param name:
	:type name: char *
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const char * name);
};


%make_alias(StepElement_VolumeElementPurposeMember)

%extend StepElement_VolumeElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Curve3dElementDescriptor;
class StepElement_Curve3dElementDescriptor : public StepElement_ElementDescriptor {
	public:
		%feature("compactdefaultargs") StepElement_Curve3dElementDescriptor;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_Curve3dElementDescriptor;
		 StepElement_Curve3dElementDescriptor ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aElementDescriptor_TopologyOrder:
	:type aElementDescriptor_TopologyOrder: StepElement_ElementOrder
	:param aElementDescriptor_Description:
	:type aElementDescriptor_Description: Handle_TCollection_HAsciiString &
	:param aPurpose:
	:type aPurpose: Handle_StepElement_HArray1OfHSequenceOfCurveElementPurposeMember &
	:rtype: None
") Init;
		void Init (const StepElement_ElementOrder aElementDescriptor_TopologyOrder,const Handle_TCollection_HAsciiString & aElementDescriptor_Description,const Handle_StepElement_HArray1OfHSequenceOfCurveElementPurposeMember & aPurpose);
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: Handle_StepElement_HArray1OfHSequenceOfCurveElementPurposeMember
") Purpose;
		Handle_StepElement_HArray1OfHSequenceOfCurveElementPurposeMember Purpose ();
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: Handle_StepElement_HArray1OfHSequenceOfCurveElementPurposeMember &
	:rtype: None
") SetPurpose;
		void SetPurpose (const Handle_StepElement_HArray1OfHSequenceOfCurveElementPurposeMember & Purpose);
};


%make_alias(StepElement_Curve3dElementDescriptor)

%extend StepElement_Curve3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_CurveElementSectionDerivedDefinitions;
class StepElement_CurveElementSectionDerivedDefinitions : public StepElement_CurveElementSectionDefinition {
	public:
		%feature("compactdefaultargs") StepElement_CurveElementSectionDerivedDefinitions;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_CurveElementSectionDerivedDefinitions;
		 StepElement_CurveElementSectionDerivedDefinitions ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aCurveElementSectionDefinition_Description:
	:type aCurveElementSectionDefinition_Description: Handle_TCollection_HAsciiString &
	:param aCurveElementSectionDefinition_SectionAngle:
	:type aCurveElementSectionDefinition_SectionAngle: float
	:param aCrossSectionalArea:
	:type aCrossSectionalArea: float
	:param aShearArea:
	:type aShearArea: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue &
	:param aSecondMomentOfArea:
	:type aSecondMomentOfArea: Handle_TColStd_HArray1OfReal &
	:param aTorsionalConstant:
	:type aTorsionalConstant: float
	:param aWarpingConstant:
	:type aWarpingConstant: StepElement_MeasureOrUnspecifiedValue &
	:param aLocationOfCentroid:
	:type aLocationOfCentroid: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue &
	:param aLocationOfShearCentre:
	:type aLocationOfShearCentre: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue &
	:param aLocationOfNonStructuralMass:
	:type aLocationOfNonStructuralMass: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue &
	:param aNonStructuralMass:
	:type aNonStructuralMass: StepElement_MeasureOrUnspecifiedValue &
	:param aPolarMoment:
	:type aPolarMoment: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aCurveElementSectionDefinition_Description,const Standard_Real aCurveElementSectionDefinition_SectionAngle,const Standard_Real aCrossSectionalArea,const Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue & aShearArea,const Handle_TColStd_HArray1OfReal & aSecondMomentOfArea,const Standard_Real aTorsionalConstant,const StepElement_MeasureOrUnspecifiedValue & aWarpingConstant,const Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue & aLocationOfCentroid,const Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue & aLocationOfShearCentre,const Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue & aLocationOfNonStructuralMass,const StepElement_MeasureOrUnspecifiedValue & aNonStructuralMass,const StepElement_MeasureOrUnspecifiedValue & aPolarMoment);
		%feature("compactdefaultargs") CrossSectionalArea;
		%feature("autodoc", "	* Returns field CrossSectionalArea

	:rtype: float
") CrossSectionalArea;
		Standard_Real CrossSectionalArea ();
		%feature("compactdefaultargs") SetCrossSectionalArea;
		%feature("autodoc", "	* Set field CrossSectionalArea

	:param CrossSectionalArea:
	:type CrossSectionalArea: float
	:rtype: None
") SetCrossSectionalArea;
		void SetCrossSectionalArea (const Standard_Real CrossSectionalArea);
		%feature("compactdefaultargs") ShearArea;
		%feature("autodoc", "	* Returns field ShearArea

	:rtype: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue
") ShearArea;
		Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue ShearArea ();
		%feature("compactdefaultargs") SetShearArea;
		%feature("autodoc", "	* Set field ShearArea

	:param ShearArea:
	:type ShearArea: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue &
	:rtype: None
") SetShearArea;
		void SetShearArea (const Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue & ShearArea);
		%feature("compactdefaultargs") SecondMomentOfArea;
		%feature("autodoc", "	* Returns field SecondMomentOfArea

	:rtype: Handle_TColStd_HArray1OfReal
") SecondMomentOfArea;
		Handle_TColStd_HArray1OfReal SecondMomentOfArea ();
		%feature("compactdefaultargs") SetSecondMomentOfArea;
		%feature("autodoc", "	* Set field SecondMomentOfArea

	:param SecondMomentOfArea:
	:type SecondMomentOfArea: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetSecondMomentOfArea;
		void SetSecondMomentOfArea (const Handle_TColStd_HArray1OfReal & SecondMomentOfArea);
		%feature("compactdefaultargs") TorsionalConstant;
		%feature("autodoc", "	* Returns field TorsionalConstant

	:rtype: float
") TorsionalConstant;
		Standard_Real TorsionalConstant ();
		%feature("compactdefaultargs") SetTorsionalConstant;
		%feature("autodoc", "	* Set field TorsionalConstant

	:param TorsionalConstant:
	:type TorsionalConstant: float
	:rtype: None
") SetTorsionalConstant;
		void SetTorsionalConstant (const Standard_Real TorsionalConstant);
		%feature("compactdefaultargs") WarpingConstant;
		%feature("autodoc", "	* Returns field WarpingConstant

	:rtype: StepElement_MeasureOrUnspecifiedValue
") WarpingConstant;
		StepElement_MeasureOrUnspecifiedValue WarpingConstant ();
		%feature("compactdefaultargs") SetWarpingConstant;
		%feature("autodoc", "	* Set field WarpingConstant

	:param WarpingConstant:
	:type WarpingConstant: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetWarpingConstant;
		void SetWarpingConstant (const StepElement_MeasureOrUnspecifiedValue & WarpingConstant);
		%feature("compactdefaultargs") LocationOfCentroid;
		%feature("autodoc", "	* Returns field LocationOfCentroid

	:rtype: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue
") LocationOfCentroid;
		Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue LocationOfCentroid ();
		%feature("compactdefaultargs") SetLocationOfCentroid;
		%feature("autodoc", "	* Set field LocationOfCentroid

	:param LocationOfCentroid:
	:type LocationOfCentroid: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue &
	:rtype: None
") SetLocationOfCentroid;
		void SetLocationOfCentroid (const Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue & LocationOfCentroid);
		%feature("compactdefaultargs") LocationOfShearCentre;
		%feature("autodoc", "	* Returns field LocationOfShearCentre

	:rtype: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue
") LocationOfShearCentre;
		Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue LocationOfShearCentre ();
		%feature("compactdefaultargs") SetLocationOfShearCentre;
		%feature("autodoc", "	* Set field LocationOfShearCentre

	:param LocationOfShearCentre:
	:type LocationOfShearCentre: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue &
	:rtype: None
") SetLocationOfShearCentre;
		void SetLocationOfShearCentre (const Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue & LocationOfShearCentre);
		%feature("compactdefaultargs") LocationOfNonStructuralMass;
		%feature("autodoc", "	* Returns field LocationOfNonStructuralMass

	:rtype: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue
") LocationOfNonStructuralMass;
		Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue LocationOfNonStructuralMass ();
		%feature("compactdefaultargs") SetLocationOfNonStructuralMass;
		%feature("autodoc", "	* Set field LocationOfNonStructuralMass

	:param LocationOfNonStructuralMass:
	:type LocationOfNonStructuralMass: Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue &
	:rtype: None
") SetLocationOfNonStructuralMass;
		void SetLocationOfNonStructuralMass (const Handle_StepElement_HArray1OfMeasureOrUnspecifiedValue & LocationOfNonStructuralMass);
		%feature("compactdefaultargs") NonStructuralMass;
		%feature("autodoc", "	* Returns field NonStructuralMass

	:rtype: StepElement_MeasureOrUnspecifiedValue
") NonStructuralMass;
		StepElement_MeasureOrUnspecifiedValue NonStructuralMass ();
		%feature("compactdefaultargs") SetNonStructuralMass;
		%feature("autodoc", "	* Set field NonStructuralMass

	:param NonStructuralMass:
	:type NonStructuralMass: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetNonStructuralMass;
		void SetNonStructuralMass (const StepElement_MeasureOrUnspecifiedValue & NonStructuralMass);
		%feature("compactdefaultargs") PolarMoment;
		%feature("autodoc", "	* Returns field PolarMoment

	:rtype: StepElement_MeasureOrUnspecifiedValue
") PolarMoment;
		StepElement_MeasureOrUnspecifiedValue PolarMoment ();
		%feature("compactdefaultargs") SetPolarMoment;
		%feature("autodoc", "	* Set field PolarMoment

	:param PolarMoment:
	:type PolarMoment: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetPolarMoment;
		void SetPolarMoment (const StepElement_MeasureOrUnspecifiedValue & PolarMoment);
};


%make_alias(StepElement_CurveElementSectionDerivedDefinitions)

%extend StepElement_CurveElementSectionDerivedDefinitions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Surface3dElementDescriptor;
class StepElement_Surface3dElementDescriptor : public StepElement_ElementDescriptor {
	public:
		%feature("compactdefaultargs") StepElement_Surface3dElementDescriptor;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_Surface3dElementDescriptor;
		 StepElement_Surface3dElementDescriptor ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aElementDescriptor_TopologyOrder:
	:type aElementDescriptor_TopologyOrder: StepElement_ElementOrder
	:param aElementDescriptor_Description:
	:type aElementDescriptor_Description: Handle_TCollection_HAsciiString &
	:param aPurpose:
	:type aPurpose: Handle_StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember &
	:param aShape:
	:type aShape: StepElement_Element2dShape
	:rtype: None
") Init;
		void Init (const StepElement_ElementOrder aElementDescriptor_TopologyOrder,const Handle_TCollection_HAsciiString & aElementDescriptor_Description,const Handle_StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember & aPurpose,const StepElement_Element2dShape aShape);
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: Handle_StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember
") Purpose;
		Handle_StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember Purpose ();
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: Handle_StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember &
	:rtype: None
") SetPurpose;
		void SetPurpose (const Handle_StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember & Purpose);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns field Shape

	:rtype: StepElement_Element2dShape
") Shape;
		StepElement_Element2dShape Shape ();
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* Set field Shape

	:param Shape:
	:type Shape: StepElement_Element2dShape
	:rtype: None
") SetShape;
		void SetShape (const StepElement_Element2dShape Shape);
};


%make_alias(StepElement_Surface3dElementDescriptor)

%extend StepElement_Surface3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SurfaceSectionFieldConstant;
class StepElement_SurfaceSectionFieldConstant : public StepElement_SurfaceSectionField {
	public:
		%feature("compactdefaultargs") StepElement_SurfaceSectionFieldConstant;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_SurfaceSectionFieldConstant;
		 StepElement_SurfaceSectionFieldConstant ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDefinition:
	:type aDefinition: Handle_StepElement_SurfaceSection &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_SurfaceSection & aDefinition);
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "	* Returns field Definition

	:rtype: Handle_StepElement_SurfaceSection
") Definition;
		Handle_StepElement_SurfaceSection Definition ();
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "	* Set field Definition

	:param Definition:
	:type Definition: Handle_StepElement_SurfaceSection &
	:rtype: None
") SetDefinition;
		void SetDefinition (const Handle_StepElement_SurfaceSection & Definition);
};


%make_alias(StepElement_SurfaceSectionFieldConstant)

%extend StepElement_SurfaceSectionFieldConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_SurfaceSectionFieldVarying;
class StepElement_SurfaceSectionFieldVarying : public StepElement_SurfaceSectionField {
	public:
		%feature("compactdefaultargs") StepElement_SurfaceSectionFieldVarying;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_SurfaceSectionFieldVarying;
		 StepElement_SurfaceSectionFieldVarying ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDefinitions:
	:type aDefinitions: Handle_StepElement_HArray1OfSurfaceSection &
	:param aAdditionalNodeValues:
	:type aAdditionalNodeValues: bool
	:rtype: None
") Init;
		void Init (const Handle_StepElement_HArray1OfSurfaceSection & aDefinitions,const Standard_Boolean aAdditionalNodeValues);
		%feature("compactdefaultargs") Definitions;
		%feature("autodoc", "	* Returns field Definitions

	:rtype: Handle_StepElement_HArray1OfSurfaceSection
") Definitions;
		Handle_StepElement_HArray1OfSurfaceSection Definitions ();
		%feature("compactdefaultargs") SetDefinitions;
		%feature("autodoc", "	* Set field Definitions

	:param Definitions:
	:type Definitions: Handle_StepElement_HArray1OfSurfaceSection &
	:rtype: None
") SetDefinitions;
		void SetDefinitions (const Handle_StepElement_HArray1OfSurfaceSection & Definitions);
		%feature("compactdefaultargs") AdditionalNodeValues;
		%feature("autodoc", "	* Returns field AdditionalNodeValues

	:rtype: bool
") AdditionalNodeValues;
		Standard_Boolean AdditionalNodeValues ();
		%feature("compactdefaultargs") SetAdditionalNodeValues;
		%feature("autodoc", "	* Set field AdditionalNodeValues

	:param AdditionalNodeValues:
	:type AdditionalNodeValues: bool
	:rtype: None
") SetAdditionalNodeValues;
		void SetAdditionalNodeValues (const Standard_Boolean AdditionalNodeValues);
};


%make_alias(StepElement_SurfaceSectionFieldVarying)

%extend StepElement_SurfaceSectionFieldVarying {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_UniformSurfaceSection;
class StepElement_UniformSurfaceSection : public StepElement_SurfaceSection {
	public:
		%feature("compactdefaultargs") StepElement_UniformSurfaceSection;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_UniformSurfaceSection;
		 StepElement_UniformSurfaceSection ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aSurfaceSection_Offset:
	:type aSurfaceSection_Offset: StepElement_MeasureOrUnspecifiedValue &
	:param aSurfaceSection_NonStructuralMass:
	:type aSurfaceSection_NonStructuralMass: StepElement_MeasureOrUnspecifiedValue &
	:param aSurfaceSection_NonStructuralMassOffset:
	:type aSurfaceSection_NonStructuralMassOffset: StepElement_MeasureOrUnspecifiedValue &
	:param aThickness:
	:type aThickness: float
	:param aBendingThickness:
	:type aBendingThickness: StepElement_MeasureOrUnspecifiedValue &
	:param aShearThickness:
	:type aShearThickness: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") Init;
		void Init (const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_Offset,const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_NonStructuralMass,const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_NonStructuralMassOffset,const Standard_Real aThickness,const StepElement_MeasureOrUnspecifiedValue & aBendingThickness,const StepElement_MeasureOrUnspecifiedValue & aShearThickness);
		%feature("compactdefaultargs") Thickness;
		%feature("autodoc", "	* Returns field Thickness

	:rtype: float
") Thickness;
		Standard_Real Thickness ();
		%feature("compactdefaultargs") SetThickness;
		%feature("autodoc", "	* Set field Thickness

	:param Thickness:
	:type Thickness: float
	:rtype: None
") SetThickness;
		void SetThickness (const Standard_Real Thickness);
		%feature("compactdefaultargs") BendingThickness;
		%feature("autodoc", "	* Returns field BendingThickness

	:rtype: StepElement_MeasureOrUnspecifiedValue
") BendingThickness;
		StepElement_MeasureOrUnspecifiedValue BendingThickness ();
		%feature("compactdefaultargs") SetBendingThickness;
		%feature("autodoc", "	* Set field BendingThickness

	:param BendingThickness:
	:type BendingThickness: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetBendingThickness;
		void SetBendingThickness (const StepElement_MeasureOrUnspecifiedValue & BendingThickness);
		%feature("compactdefaultargs") ShearThickness;
		%feature("autodoc", "	* Returns field ShearThickness

	:rtype: StepElement_MeasureOrUnspecifiedValue
") ShearThickness;
		StepElement_MeasureOrUnspecifiedValue ShearThickness ();
		%feature("compactdefaultargs") SetShearThickness;
		%feature("autodoc", "	* Set field ShearThickness

	:param ShearThickness:
	:type ShearThickness: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetShearThickness;
		void SetShearThickness (const StepElement_MeasureOrUnspecifiedValue & ShearThickness);
};


%make_alias(StepElement_UniformSurfaceSection)

%extend StepElement_UniformSurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepElement_Volume3dElementDescriptor;
class StepElement_Volume3dElementDescriptor : public StepElement_ElementDescriptor {
	public:
		%feature("compactdefaultargs") StepElement_Volume3dElementDescriptor;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepElement_Volume3dElementDescriptor;
		 StepElement_Volume3dElementDescriptor ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aElementDescriptor_TopologyOrder:
	:type aElementDescriptor_TopologyOrder: StepElement_ElementOrder
	:param aElementDescriptor_Description:
	:type aElementDescriptor_Description: Handle_TCollection_HAsciiString &
	:param aPurpose:
	:type aPurpose: Handle_StepElement_HArray1OfVolumeElementPurposeMember &
	:param aShape:
	:type aShape: StepElement_Volume3dElementShape
	:rtype: None
") Init;
		void Init (const StepElement_ElementOrder aElementDescriptor_TopologyOrder,const Handle_TCollection_HAsciiString & aElementDescriptor_Description,const Handle_StepElement_HArray1OfVolumeElementPurposeMember & aPurpose,const StepElement_Volume3dElementShape aShape);
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: Handle_StepElement_HArray1OfVolumeElementPurposeMember
") Purpose;
		Handle_StepElement_HArray1OfVolumeElementPurposeMember Purpose ();
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: Handle_StepElement_HArray1OfVolumeElementPurposeMember &
	:rtype: None
") SetPurpose;
		void SetPurpose (const Handle_StepElement_HArray1OfVolumeElementPurposeMember & Purpose);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns field Shape

	:rtype: StepElement_Volume3dElementShape
") Shape;
		StepElement_Volume3dElementShape Shape ();
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* Set field Shape

	:param Shape:
	:type Shape: StepElement_Volume3dElementShape
	:rtype: None
") SetShape;
		void SetShape (const StepElement_Volume3dElementShape Shape);
};


%make_alias(StepElement_Volume3dElementDescriptor)

%extend StepElement_Volume3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
