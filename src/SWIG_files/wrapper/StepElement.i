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
%define STEPELEMENTDOCSTRING
"StepElement module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepelement.html"
%enddef
%module (package="OCC.Core", docstring=STEPELEMENTDOCSTRING) StepElement


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
#include<StepElement_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<StepRepr_module.hxx>
#include<StepData_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<StepBasic_module.hxx>
#include<StepShape_module.hxx>
#include<StepGeom_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import StepRepr.i
%import StepData.i
%import TColStd.i
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

/* handles */
%wrap_handle(StepElement_AnalysisItemWithinRepresentation)
%wrap_handle(StepElement_CurveElementEndReleasePacket)
%wrap_handle(StepElement_CurveElementFreedomMember)
%wrap_handle(StepElement_CurveElementPurposeMember)
%wrap_handle(StepElement_CurveElementSectionDefinition)
%wrap_handle(StepElement_ElementAspectMember)
%wrap_handle(StepElement_ElementDescriptor)
%wrap_handle(StepElement_ElementMaterial)
%wrap_handle(StepElement_MeasureOrUnspecifiedValueMember)
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
%wrap_handle(StepElement_HArray1OfVolumeElementPurpose)
%wrap_handle(StepElement_HArray1OfHSequenceOfCurveElementPurposeMember)
%wrap_handle(StepElement_HArray1OfSurfaceSection)
%wrap_handle(StepElement_HArray1OfCurveElementSectionDefinition)
%wrap_handle(StepElement_HArray1OfMeasureOrUnspecifiedValue)
%wrap_handle(StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember)
%wrap_handle(StepElement_HArray1OfVolumeElementPurposeMember)
%wrap_handle(StepElement_HArray1OfCurveElementEndReleasePacket)
%wrap_handle(StepElement_HArray2OfSurfaceElementPurposeMember)
%wrap_handle(StepElement_HArray2OfSurfaceElementPurpose)
%wrap_handle(StepElement_HArray2OfCurveElementPurposeMember)
%wrap_handle(StepElement_HSequenceOfCurveElementSectionDefinition)
%wrap_handle(StepElement_HSequenceOfCurveElementPurposeMember)
%wrap_handle(StepElement_HSequenceOfElementMaterial)
%wrap_handle(StepElement_HSequenceOfSurfaceElementPurposeMember)
/* end handles declaration */

/* templates */
%template(StepElement_SequenceOfCurveElementSectionDefinition) NCollection_Sequence <opencascade::handle <StepElement_CurveElementSectionDefinition>>;
%template(StepElement_Array2OfCurveElementPurposeMember) NCollection_Array2 <opencascade::handle <StepElement_CurveElementPurposeMember>>;
%template(StepElement_Array1OfCurveElementSectionDefinition) NCollection_Array1 <opencascade::handle <StepElement_CurveElementSectionDefinition>>;

%extend NCollection_Array1 <opencascade::handle <StepElement_CurveElementSectionDefinition>> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepElement_Array1OfHSequenceOfCurveElementPurposeMember) NCollection_Array1 <opencascade::handle <StepElement_HSequenceOfCurveElementPurposeMember>>;

%extend NCollection_Array1 <opencascade::handle <StepElement_HSequenceOfCurveElementPurposeMember>> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepElement_Array1OfVolumeElementPurpose) NCollection_Array1 <StepElement_VolumeElementPurpose>;

%extend NCollection_Array1 <StepElement_VolumeElementPurpose> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepElement_Array1OfCurveElementEndReleasePacket) NCollection_Array1 <opencascade::handle <StepElement_CurveElementEndReleasePacket>>;

%extend NCollection_Array1 <opencascade::handle <StepElement_CurveElementEndReleasePacket>> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepElement_Array1OfMeasureOrUnspecifiedValue) NCollection_Array1 <StepElement_MeasureOrUnspecifiedValue>;

%extend NCollection_Array1 <StepElement_MeasureOrUnspecifiedValue> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepElement_Array2OfSurfaceElementPurpose) NCollection_Array2 <StepElement_SurfaceElementPurpose>;
%template(StepElement_SequenceOfElementMaterial) NCollection_Sequence <opencascade::handle <StepElement_ElementMaterial>>;
%template(StepElement_SequenceOfSurfaceElementPurposeMember) NCollection_Sequence <opencascade::handle <StepElement_SurfaceElementPurposeMember>>;
%template(StepElement_Array1OfSurfaceSection) NCollection_Array1 <opencascade::handle <StepElement_SurfaceSection>>;

%extend NCollection_Array1 <opencascade::handle <StepElement_SurfaceSection>> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember) NCollection_Array1 <opencascade::handle <StepElement_HSequenceOfSurfaceElementPurposeMember>>;

%extend NCollection_Array1 <opencascade::handle <StepElement_HSequenceOfSurfaceElementPurposeMember>> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepElement_Array1OfVolumeElementPurposeMember) NCollection_Array1 <opencascade::handle <StepElement_VolumeElementPurposeMember>>;

%extend NCollection_Array1 <opencascade::handle <StepElement_VolumeElementPurposeMember>> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepElement_Array2OfSurfaceElementPurposeMember) NCollection_Array2 <opencascade::handle <StepElement_SurfaceElementPurposeMember>>;
%template(StepElement_SequenceOfCurveElementPurposeMember) NCollection_Sequence <opencascade::handle <StepElement_CurveElementPurposeMember>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <StepElement_CurveElementSectionDefinition>> StepElement_SequenceOfCurveElementSectionDefinition;
typedef NCollection_Array2 <opencascade::handle <StepElement_CurveElementPurposeMember>> StepElement_Array2OfCurveElementPurposeMember;
typedef NCollection_Array1 <opencascade::handle <StepElement_CurveElementSectionDefinition>> StepElement_Array1OfCurveElementSectionDefinition;
typedef NCollection_Array1 <opencascade::handle <StepElement_HSequenceOfCurveElementPurposeMember>> StepElement_Array1OfHSequenceOfCurveElementPurposeMember;
typedef NCollection_Array1 <StepElement_VolumeElementPurpose> StepElement_Array1OfVolumeElementPurpose;
typedef NCollection_Array1 <opencascade::handle <StepElement_CurveElementEndReleasePacket>> StepElement_Array1OfCurveElementEndReleasePacket;
typedef NCollection_Array1 <StepElement_MeasureOrUnspecifiedValue> StepElement_Array1OfMeasureOrUnspecifiedValue;
typedef NCollection_Array2 <StepElement_SurfaceElementPurpose> StepElement_Array2OfSurfaceElementPurpose;
typedef NCollection_Sequence <opencascade::handle <StepElement_ElementMaterial>> StepElement_SequenceOfElementMaterial;
typedef NCollection_Sequence <opencascade::handle <StepElement_SurfaceElementPurposeMember>> StepElement_SequenceOfSurfaceElementPurposeMember;
typedef NCollection_Array1 <opencascade::handle <StepElement_SurfaceSection>> StepElement_Array1OfSurfaceSection;
typedef NCollection_Array1 <opencascade::handle <StepElement_HSequenceOfSurfaceElementPurposeMember>> StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember;
typedef NCollection_Array1 <opencascade::handle <StepElement_VolumeElementPurposeMember>> StepElement_Array1OfVolumeElementPurposeMember;
typedef NCollection_Array2 <opencascade::handle <StepElement_SurfaceElementPurposeMember>> StepElement_Array2OfSurfaceElementPurposeMember;
typedef NCollection_Sequence <opencascade::handle <StepElement_CurveElementPurposeMember>> StepElement_SequenceOfCurveElementPurposeMember;
/* end typedefs declaration */

/*****************************************************
* class StepElement_AnalysisItemWithinRepresentation *
*****************************************************/
class StepElement_AnalysisItemWithinRepresentation : public Standard_Transient {
	public:
		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns field Description
	:rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aItem:
	:type aItem: StepRepr_RepresentationItem
	:param aRep:
	:type aRep: StepRepr_Representation
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepRepr_RepresentationItem> & aItem,const opencascade::handle<StepRepr_Representation> & aRep);

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "* Returns field Item
	:rtype: opencascade::handle<StepRepr_RepresentationItem>") Item;
		opencascade::handle<StepRepr_RepresentationItem> Item ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns field Name
	:rtype: opencascade::handle<TCollection_HAsciiString>") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();

		/****************** Rep ******************/
		%feature("compactdefaultargs") Rep;
		%feature("autodoc", "* Returns field Rep
	:rtype: opencascade::handle<StepRepr_Representation>") Rep;
		opencascade::handle<StepRepr_Representation> Rep ();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "* Set field Description
	:param Description:
	:type Description: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "* Set field Item
	:param Item:
	:type Item: StepRepr_RepresentationItem
	:rtype: None") SetItem;
		void SetItem (const opencascade::handle<StepRepr_RepresentationItem> & Item);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set field Name
	:param Name:
	:type Name: TCollection_HAsciiString
	:rtype: None") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetRep ******************/
		%feature("compactdefaultargs") SetRep;
		%feature("autodoc", "* Set field Rep
	:param Rep:
	:type Rep: StepRepr_Representation
	:rtype: None") SetRep;
		void SetRep (const opencascade::handle<StepRepr_Representation> & Rep);

		/****************** StepElement_AnalysisItemWithinRepresentation ******************/
		%feature("compactdefaultargs") StepElement_AnalysisItemWithinRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_AnalysisItemWithinRepresentation;
		 StepElement_AnalysisItemWithinRepresentation ();

};


%make_alias(StepElement_AnalysisItemWithinRepresentation)

%extend StepElement_AnalysisItemWithinRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepElement_CurveElementEndReleasePacket *
*************************************************/
class StepElement_CurveElementEndReleasePacket : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aReleaseFreedom:
	:type aReleaseFreedom: StepElement_CurveElementFreedom
	:param aReleaseStiffness:
	:type aReleaseStiffness: float
	:rtype: None") Init;
		void Init (const StepElement_CurveElementFreedom & aReleaseFreedom,const Standard_Real aReleaseStiffness);

		/****************** ReleaseFreedom ******************/
		%feature("compactdefaultargs") ReleaseFreedom;
		%feature("autodoc", "* Returns field ReleaseFreedom
	:rtype: StepElement_CurveElementFreedom") ReleaseFreedom;
		StepElement_CurveElementFreedom ReleaseFreedom ();

		/****************** ReleaseStiffness ******************/
		%feature("compactdefaultargs") ReleaseStiffness;
		%feature("autodoc", "* Returns field ReleaseStiffness
	:rtype: float") ReleaseStiffness;
		Standard_Real ReleaseStiffness ();

		/****************** SetReleaseFreedom ******************/
		%feature("compactdefaultargs") SetReleaseFreedom;
		%feature("autodoc", "* Set field ReleaseFreedom
	:param ReleaseFreedom:
	:type ReleaseFreedom: StepElement_CurveElementFreedom
	:rtype: None") SetReleaseFreedom;
		void SetReleaseFreedom (const StepElement_CurveElementFreedom & ReleaseFreedom);

		/****************** SetReleaseStiffness ******************/
		%feature("compactdefaultargs") SetReleaseStiffness;
		%feature("autodoc", "* Set field ReleaseStiffness
	:param ReleaseStiffness:
	:type ReleaseStiffness: float
	:rtype: None") SetReleaseStiffness;
		void SetReleaseStiffness (const Standard_Real ReleaseStiffness);

		/****************** StepElement_CurveElementEndReleasePacket ******************/
		%feature("compactdefaultargs") StepElement_CurveElementEndReleasePacket;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_CurveElementEndReleasePacket;
		 StepElement_CurveElementEndReleasePacket ();

};


%make_alias(StepElement_CurveElementEndReleasePacket)

%extend StepElement_CurveElementEndReleasePacket {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepElement_CurveElementFreedom *
****************************************/
class StepElement_CurveElementFreedom : public StepData_SelectType {
	public:
		/****************** ApplicationDefinedDegreeOfFreedom ******************/
		%feature("compactdefaultargs") ApplicationDefinedDegreeOfFreedom;
		%feature("autodoc", "* Returns Value as ApplicationDefinedDegreeOfFreedom (or Null if another type)
	:rtype: opencascade::handle<TCollection_HAsciiString>") ApplicationDefinedDegreeOfFreedom;
		opencascade::handle<TCollection_HAsciiString> ApplicationDefinedDegreeOfFreedom ();

		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "* Recognizes a items of select member CurveElementFreedomMember 1 -> EnumeratedCurveElementFreedom 2 -> ApplicationDefinedDegreeOfFreedom 0 else
	:param ent:
	:type ent: StepData_SelectMember
	:rtype: int") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of CurveElementFreedom select type return 0
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** EnumeratedCurveElementFreedom ******************/
		%feature("compactdefaultargs") EnumeratedCurveElementFreedom;
		%feature("autodoc", "* Returns Value as EnumeratedCurveElementFreedom (or Null if another type)
	:rtype: StepElement_EnumeratedCurveElementFreedom") EnumeratedCurveElementFreedom;
		StepElement_EnumeratedCurveElementFreedom EnumeratedCurveElementFreedom ();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "* Returns a new select member the type CurveElementFreedomMember
	:rtype: opencascade::handle<StepData_SelectMember>") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();

		/****************** SetApplicationDefinedDegreeOfFreedom ******************/
		%feature("compactdefaultargs") SetApplicationDefinedDegreeOfFreedom;
		%feature("autodoc", "* Set Value for ApplicationDefinedDegreeOfFreedom
	:param aVal:
	:type aVal: TCollection_HAsciiString
	:rtype: None") SetApplicationDefinedDegreeOfFreedom;
		void SetApplicationDefinedDegreeOfFreedom (const opencascade::handle<TCollection_HAsciiString> & aVal);

		/****************** SetEnumeratedCurveElementFreedom ******************/
		%feature("compactdefaultargs") SetEnumeratedCurveElementFreedom;
		%feature("autodoc", "* Set Value for EnumeratedCurveElementFreedom
	:param aVal:
	:type aVal: StepElement_EnumeratedCurveElementFreedom
	:rtype: None") SetEnumeratedCurveElementFreedom;
		void SetEnumeratedCurveElementFreedom (const StepElement_EnumeratedCurveElementFreedom aVal);

		/****************** StepElement_CurveElementFreedom ******************/
		%feature("compactdefaultargs") StepElement_CurveElementFreedom;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_CurveElementFreedom;
		 StepElement_CurveElementFreedom ();

};


%extend StepElement_CurveElementFreedom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepElement_CurveElementFreedomMember *
**********************************************/
class StepElement_CurveElementFreedomMember : public StepData_SelectNamed {
	public:
		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Returns True if has name
	:rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the name of a SelectMember matches a given one;
	:param name:
	:type name: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns set name
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set name
	:param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** StepElement_CurveElementFreedomMember ******************/
		%feature("compactdefaultargs") StepElement_CurveElementFreedomMember;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_CurveElementFreedomMember;
		 StepElement_CurveElementFreedomMember ();

};


%make_alias(StepElement_CurveElementFreedomMember)

%extend StepElement_CurveElementFreedomMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepElement_CurveElementPurpose *
****************************************/
class StepElement_CurveElementPurpose : public StepData_SelectType {
	public:
		/****************** ApplicationDefinedElementPurpose ******************/
		%feature("compactdefaultargs") ApplicationDefinedElementPurpose;
		%feature("autodoc", "* Returns Value as ApplicationDefinedElementPurpose (or Null if another type)
	:rtype: opencascade::handle<TCollection_HAsciiString>") ApplicationDefinedElementPurpose;
		opencascade::handle<TCollection_HAsciiString> ApplicationDefinedElementPurpose ();

		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "* Recognizes a items of select member CurveElementPurposeMember 1 -> EnumeratedCurveElementPurpose 2 -> ApplicationDefinedElementPurpose 0 else
	:param ent:
	:type ent: StepData_SelectMember
	:rtype: int") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of CurveElementPurpose select type return 0
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** EnumeratedCurveElementPurpose ******************/
		%feature("compactdefaultargs") EnumeratedCurveElementPurpose;
		%feature("autodoc", "* Returns Value as EnumeratedCurveElementPurpose (or Null if another type)
	:rtype: StepElement_EnumeratedCurveElementPurpose") EnumeratedCurveElementPurpose;
		StepElement_EnumeratedCurveElementPurpose EnumeratedCurveElementPurpose ();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "* Returns a new select member the type CurveElementPurposeMember
	:rtype: opencascade::handle<StepData_SelectMember>") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();

		/****************** SetApplicationDefinedElementPurpose ******************/
		%feature("compactdefaultargs") SetApplicationDefinedElementPurpose;
		%feature("autodoc", "* Set Value for ApplicationDefinedElementPurpose
	:param aVal:
	:type aVal: TCollection_HAsciiString
	:rtype: None") SetApplicationDefinedElementPurpose;
		void SetApplicationDefinedElementPurpose (const opencascade::handle<TCollection_HAsciiString> & aVal);

		/****************** SetEnumeratedCurveElementPurpose ******************/
		%feature("compactdefaultargs") SetEnumeratedCurveElementPurpose;
		%feature("autodoc", "* Set Value for EnumeratedCurveElementPurpose
	:param aVal:
	:type aVal: StepElement_EnumeratedCurveElementPurpose
	:rtype: None") SetEnumeratedCurveElementPurpose;
		void SetEnumeratedCurveElementPurpose (const StepElement_EnumeratedCurveElementPurpose aVal);

		/****************** StepElement_CurveElementPurpose ******************/
		%feature("compactdefaultargs") StepElement_CurveElementPurpose;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_CurveElementPurpose;
		 StepElement_CurveElementPurpose ();

};


%extend StepElement_CurveElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepElement_CurveElementPurposeMember *
**********************************************/
class StepElement_CurveElementPurposeMember : public StepData_SelectNamed {
	public:
		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Returns True if has name
	:rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the name of a SelectMember matches a given one;
	:param name:
	:type name: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns set name
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set name
	:param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** StepElement_CurveElementPurposeMember ******************/
		%feature("compactdefaultargs") StepElement_CurveElementPurposeMember;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_CurveElementPurposeMember;
		 StepElement_CurveElementPurposeMember ();

};


%make_alias(StepElement_CurveElementPurposeMember)

%extend StepElement_CurveElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepElement_CurveElementSectionDefinition *
**************************************************/
class StepElement_CurveElementSectionDefinition : public Standard_Transient {
	public:
		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns field Description
	:rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aSectionAngle:
	:type aSectionAngle: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aDescription,const Standard_Real aSectionAngle);

		/****************** SectionAngle ******************/
		%feature("compactdefaultargs") SectionAngle;
		%feature("autodoc", "* Returns field SectionAngle
	:rtype: float") SectionAngle;
		Standard_Real SectionAngle ();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "* Set field Description
	:param Description:
	:type Description: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetSectionAngle ******************/
		%feature("compactdefaultargs") SetSectionAngle;
		%feature("autodoc", "* Set field SectionAngle
	:param SectionAngle:
	:type SectionAngle: float
	:rtype: None") SetSectionAngle;
		void SetSectionAngle (const Standard_Real SectionAngle);

		/****************** StepElement_CurveElementSectionDefinition ******************/
		%feature("compactdefaultargs") StepElement_CurveElementSectionDefinition;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_CurveElementSectionDefinition;
		 StepElement_CurveElementSectionDefinition ();

};


%make_alias(StepElement_CurveElementSectionDefinition)

%extend StepElement_CurveElementSectionDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepElement_ElementAspect *
**********************************/
class StepElement_ElementAspect : public StepData_SelectType {
	public:
		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "* Recognizes a items of select member ElementAspectMember 1 -> ElementVolume 2 -> Volume3dFace 3 -> Volume2dFace 4 -> Volume3dEdge 5 -> Volume2dEdge 6 -> Surface3dFace 7 -> Surface2dFace 8 -> Surface3dEdge 9 -> Surface2dEdge 10 -> CurveEdge 0 else
	:param ent:
	:type ent: StepData_SelectMember
	:rtype: int") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of ElementAspect select type return 0
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** CurveEdge ******************/
		%feature("compactdefaultargs") CurveEdge;
		%feature("autodoc", "* Returns Value as CurveEdge (or Null if another type)
	:rtype: StepElement_CurveEdge") CurveEdge;
		StepElement_CurveEdge CurveEdge ();

		/****************** ElementVolume ******************/
		%feature("compactdefaultargs") ElementVolume;
		%feature("autodoc", "* Returns Value as ElementVolume (or Null if another type)
	:rtype: StepElement_ElementVolume") ElementVolume;
		StepElement_ElementVolume ElementVolume ();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "* Returns a new select member the type ElementAspectMember
	:rtype: opencascade::handle<StepData_SelectMember>") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();

		/****************** SetCurveEdge ******************/
		%feature("compactdefaultargs") SetCurveEdge;
		%feature("autodoc", "* Set Value for CurveEdge
	:param aVal:
	:type aVal: StepElement_CurveEdge
	:rtype: None") SetCurveEdge;
		void SetCurveEdge (const StepElement_CurveEdge aVal);

		/****************** SetElementVolume ******************/
		%feature("compactdefaultargs") SetElementVolume;
		%feature("autodoc", "* Set Value for ElementVolume
	:param aVal:
	:type aVal: StepElement_ElementVolume
	:rtype: None") SetElementVolume;
		void SetElementVolume (const StepElement_ElementVolume aVal);

		/****************** SetSurface2dEdge ******************/
		%feature("compactdefaultargs") SetSurface2dEdge;
		%feature("autodoc", "* Set Value for Surface2dEdge
	:param aVal:
	:type aVal: int
	:rtype: None") SetSurface2dEdge;
		void SetSurface2dEdge (const Standard_Integer aVal);

		/****************** SetSurface2dFace ******************/
		%feature("compactdefaultargs") SetSurface2dFace;
		%feature("autodoc", "* Set Value for Surface2dFace
	:param aVal:
	:type aVal: int
	:rtype: None") SetSurface2dFace;
		void SetSurface2dFace (const Standard_Integer aVal);

		/****************** SetSurface3dEdge ******************/
		%feature("compactdefaultargs") SetSurface3dEdge;
		%feature("autodoc", "* Set Value for Surface3dEdge
	:param aVal:
	:type aVal: int
	:rtype: None") SetSurface3dEdge;
		void SetSurface3dEdge (const Standard_Integer aVal);

		/****************** SetSurface3dFace ******************/
		%feature("compactdefaultargs") SetSurface3dFace;
		%feature("autodoc", "* Set Value for Surface3dFace
	:param aVal:
	:type aVal: int
	:rtype: None") SetSurface3dFace;
		void SetSurface3dFace (const Standard_Integer aVal);

		/****************** SetVolume2dEdge ******************/
		%feature("compactdefaultargs") SetVolume2dEdge;
		%feature("autodoc", "* Set Value for Volume2dEdge
	:param aVal:
	:type aVal: int
	:rtype: None") SetVolume2dEdge;
		void SetVolume2dEdge (const Standard_Integer aVal);

		/****************** SetVolume2dFace ******************/
		%feature("compactdefaultargs") SetVolume2dFace;
		%feature("autodoc", "* Set Value for Volume2dFace
	:param aVal:
	:type aVal: int
	:rtype: None") SetVolume2dFace;
		void SetVolume2dFace (const Standard_Integer aVal);

		/****************** SetVolume3dEdge ******************/
		%feature("compactdefaultargs") SetVolume3dEdge;
		%feature("autodoc", "* Set Value for Volume3dEdge
	:param aVal:
	:type aVal: int
	:rtype: None") SetVolume3dEdge;
		void SetVolume3dEdge (const Standard_Integer aVal);

		/****************** SetVolume3dFace ******************/
		%feature("compactdefaultargs") SetVolume3dFace;
		%feature("autodoc", "* Set Value for Volume3dFace
	:param aVal:
	:type aVal: int
	:rtype: None") SetVolume3dFace;
		void SetVolume3dFace (const Standard_Integer aVal);

		/****************** StepElement_ElementAspect ******************/
		%feature("compactdefaultargs") StepElement_ElementAspect;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_ElementAspect;
		 StepElement_ElementAspect ();

		/****************** Surface2dEdge ******************/
		%feature("compactdefaultargs") Surface2dEdge;
		%feature("autodoc", "* Returns Value as Surface2dEdge (or Null if another type)
	:rtype: int") Surface2dEdge;
		Standard_Integer Surface2dEdge ();

		/****************** Surface2dFace ******************/
		%feature("compactdefaultargs") Surface2dFace;
		%feature("autodoc", "* Returns Value as Surface2dFace (or Null if another type)
	:rtype: int") Surface2dFace;
		Standard_Integer Surface2dFace ();

		/****************** Surface3dEdge ******************/
		%feature("compactdefaultargs") Surface3dEdge;
		%feature("autodoc", "* Returns Value as Surface3dEdge (or Null if another type)
	:rtype: int") Surface3dEdge;
		Standard_Integer Surface3dEdge ();

		/****************** Surface3dFace ******************/
		%feature("compactdefaultargs") Surface3dFace;
		%feature("autodoc", "* Returns Value as Surface3dFace (or Null if another type)
	:rtype: int") Surface3dFace;
		Standard_Integer Surface3dFace ();

		/****************** Volume2dEdge ******************/
		%feature("compactdefaultargs") Volume2dEdge;
		%feature("autodoc", "* Returns Value as Volume2dEdge (or Null if another type)
	:rtype: int") Volume2dEdge;
		Standard_Integer Volume2dEdge ();

		/****************** Volume2dFace ******************/
		%feature("compactdefaultargs") Volume2dFace;
		%feature("autodoc", "* Returns Value as Volume2dFace (or Null if another type)
	:rtype: int") Volume2dFace;
		Standard_Integer Volume2dFace ();

		/****************** Volume3dEdge ******************/
		%feature("compactdefaultargs") Volume3dEdge;
		%feature("autodoc", "* Returns Value as Volume3dEdge (or Null if another type)
	:rtype: int") Volume3dEdge;
		Standard_Integer Volume3dEdge ();

		/****************** Volume3dFace ******************/
		%feature("compactdefaultargs") Volume3dFace;
		%feature("autodoc", "* Returns Value as Volume3dFace (or Null if another type)
	:rtype: int") Volume3dFace;
		Standard_Integer Volume3dFace ();

};


%extend StepElement_ElementAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepElement_ElementAspectMember *
****************************************/
class StepElement_ElementAspectMember : public StepData_SelectNamed {
	public:
		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Returns True if has name
	:rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the name of a SelectMember matches a given one;
	:param name:
	:type name: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns set name
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set name
	:param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** StepElement_ElementAspectMember ******************/
		%feature("compactdefaultargs") StepElement_ElementAspectMember;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_ElementAspectMember;
		 StepElement_ElementAspectMember ();

};


%make_alias(StepElement_ElementAspectMember)

%extend StepElement_ElementAspectMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepElement_ElementDescriptor *
**************************************/
class StepElement_ElementDescriptor : public Standard_Transient {
	public:
		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns field Description
	:rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aTopologyOrder:
	:type aTopologyOrder: StepElement_ElementOrder
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const StepElement_ElementOrder aTopologyOrder,const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "* Set field Description
	:param Description:
	:type Description: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetTopologyOrder ******************/
		%feature("compactdefaultargs") SetTopologyOrder;
		%feature("autodoc", "* Set field TopologyOrder
	:param TopologyOrder:
	:type TopologyOrder: StepElement_ElementOrder
	:rtype: None") SetTopologyOrder;
		void SetTopologyOrder (const StepElement_ElementOrder TopologyOrder);

		/****************** StepElement_ElementDescriptor ******************/
		%feature("compactdefaultargs") StepElement_ElementDescriptor;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_ElementDescriptor;
		 StepElement_ElementDescriptor ();

		/****************** TopologyOrder ******************/
		%feature("compactdefaultargs") TopologyOrder;
		%feature("autodoc", "* Returns field TopologyOrder
	:rtype: StepElement_ElementOrder") TopologyOrder;
		StepElement_ElementOrder TopologyOrder ();

};


%make_alias(StepElement_ElementDescriptor)

%extend StepElement_ElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepElement_ElementMaterial *
************************************/
class StepElement_ElementMaterial : public Standard_Transient {
	public:
		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns field Description
	:rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aMaterialId:
	:type aMaterialId: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aProperties:
	:type aProperties: StepRepr_HArray1OfMaterialPropertyRepresentation
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aMaterialId,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepRepr_HArray1OfMaterialPropertyRepresentation> & aProperties);

		/****************** MaterialId ******************/
		%feature("compactdefaultargs") MaterialId;
		%feature("autodoc", "* Returns field MaterialId
	:rtype: opencascade::handle<TCollection_HAsciiString>") MaterialId;
		opencascade::handle<TCollection_HAsciiString> MaterialId ();

		/****************** Properties ******************/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "* Returns field Properties
	:rtype: opencascade::handle<StepRepr_HArray1OfMaterialPropertyRepresentation>") Properties;
		opencascade::handle<StepRepr_HArray1OfMaterialPropertyRepresentation> Properties ();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "* Set field Description
	:param Description:
	:type Description: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetMaterialId ******************/
		%feature("compactdefaultargs") SetMaterialId;
		%feature("autodoc", "* Set field MaterialId
	:param MaterialId:
	:type MaterialId: TCollection_HAsciiString
	:rtype: None") SetMaterialId;
		void SetMaterialId (const opencascade::handle<TCollection_HAsciiString> & MaterialId);

		/****************** SetProperties ******************/
		%feature("compactdefaultargs") SetProperties;
		%feature("autodoc", "* Set field Properties
	:param Properties:
	:type Properties: StepRepr_HArray1OfMaterialPropertyRepresentation
	:rtype: None") SetProperties;
		void SetProperties (const opencascade::handle<StepRepr_HArray1OfMaterialPropertyRepresentation> & Properties);

		/****************** StepElement_ElementMaterial ******************/
		%feature("compactdefaultargs") StepElement_ElementMaterial;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_ElementMaterial;
		 StepElement_ElementMaterial ();

};


%make_alias(StepElement_ElementMaterial)

%extend StepElement_ElementMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepElement_MeasureOrUnspecifiedValue *
**********************************************/
class StepElement_MeasureOrUnspecifiedValue : public StepData_SelectType {
	public:
		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "* Recognizes a items of select member MeasureOrUnspecifiedValueMember 1 -> ContextDependentMeasure 2 -> UnspecifiedValue 0 else
	:param ent:
	:type ent: StepData_SelectMember
	:rtype: int") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of MeasureOrUnspecifiedValue select type return 0
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ContextDependentMeasure ******************/
		%feature("compactdefaultargs") ContextDependentMeasure;
		%feature("autodoc", "* Returns Value as ContextDependentMeasure (or Null if another type)
	:rtype: float") ContextDependentMeasure;
		Standard_Real ContextDependentMeasure ();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "* Returns a new select member the type MeasureOrUnspecifiedValueMember
	:rtype: opencascade::handle<StepData_SelectMember>") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();

		/****************** SetContextDependentMeasure ******************/
		%feature("compactdefaultargs") SetContextDependentMeasure;
		%feature("autodoc", "* Set Value for ContextDependentMeasure
	:param aVal:
	:type aVal: float
	:rtype: None") SetContextDependentMeasure;
		void SetContextDependentMeasure (const Standard_Real aVal);

		/****************** SetUnspecifiedValue ******************/
		%feature("compactdefaultargs") SetUnspecifiedValue;
		%feature("autodoc", "* Set Value for UnspecifiedValue
	:param aVal:
	:type aVal: StepElement_UnspecifiedValue
	:rtype: None") SetUnspecifiedValue;
		void SetUnspecifiedValue (const StepElement_UnspecifiedValue aVal);

		/****************** StepElement_MeasureOrUnspecifiedValue ******************/
		%feature("compactdefaultargs") StepElement_MeasureOrUnspecifiedValue;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_MeasureOrUnspecifiedValue;
		 StepElement_MeasureOrUnspecifiedValue ();

		/****************** UnspecifiedValue ******************/
		%feature("compactdefaultargs") UnspecifiedValue;
		%feature("autodoc", "* Returns Value as UnspecifiedValue (or Null if another type)
	:rtype: StepElement_UnspecifiedValue") UnspecifiedValue;
		StepElement_UnspecifiedValue UnspecifiedValue ();

};


%extend StepElement_MeasureOrUnspecifiedValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepElement_MeasureOrUnspecifiedValueMember *
****************************************************/
class StepElement_MeasureOrUnspecifiedValueMember : public StepData_SelectNamed {
	public:
		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Returns True if has name
	:rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the name of a SelectMember matches a given one;
	:param name:
	:type name: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns set name
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set name
	:param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** StepElement_MeasureOrUnspecifiedValueMember ******************/
		%feature("compactdefaultargs") StepElement_MeasureOrUnspecifiedValueMember;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_MeasureOrUnspecifiedValueMember;
		 StepElement_MeasureOrUnspecifiedValueMember ();

};


%make_alias(StepElement_MeasureOrUnspecifiedValueMember)

%extend StepElement_MeasureOrUnspecifiedValueMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepElement_SurfaceElementProperty *
*******************************************/
class StepElement_SurfaceElementProperty : public Standard_Transient {
	public:
		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns field Description
	:rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aPropertyId:
	:type aPropertyId: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aSection:
	:type aSection: StepElement_SurfaceSectionField
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aPropertyId,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepElement_SurfaceSectionField> & aSection);

		/****************** PropertyId ******************/
		%feature("compactdefaultargs") PropertyId;
		%feature("autodoc", "* Returns field PropertyId
	:rtype: opencascade::handle<TCollection_HAsciiString>") PropertyId;
		opencascade::handle<TCollection_HAsciiString> PropertyId ();

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "* Returns field Section
	:rtype: opencascade::handle<StepElement_SurfaceSectionField>") Section;
		opencascade::handle<StepElement_SurfaceSectionField> Section ();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "* Set field Description
	:param Description:
	:type Description: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetPropertyId ******************/
		%feature("compactdefaultargs") SetPropertyId;
		%feature("autodoc", "* Set field PropertyId
	:param PropertyId:
	:type PropertyId: TCollection_HAsciiString
	:rtype: None") SetPropertyId;
		void SetPropertyId (const opencascade::handle<TCollection_HAsciiString> & PropertyId);

		/****************** SetSection ******************/
		%feature("compactdefaultargs") SetSection;
		%feature("autodoc", "* Set field Section
	:param Section:
	:type Section: StepElement_SurfaceSectionField
	:rtype: None") SetSection;
		void SetSection (const opencascade::handle<StepElement_SurfaceSectionField> & Section);

		/****************** StepElement_SurfaceElementProperty ******************/
		%feature("compactdefaultargs") StepElement_SurfaceElementProperty;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_SurfaceElementProperty;
		 StepElement_SurfaceElementProperty ();

};


%make_alias(StepElement_SurfaceElementProperty)

%extend StepElement_SurfaceElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepElement_SurfaceElementPurpose *
******************************************/
class StepElement_SurfaceElementPurpose : public StepData_SelectType {
	public:
		/****************** ApplicationDefinedElementPurpose ******************/
		%feature("compactdefaultargs") ApplicationDefinedElementPurpose;
		%feature("autodoc", "* Returns Value as ApplicationDefinedElementPurpose (or Null if another type)
	:rtype: opencascade::handle<TCollection_HAsciiString>") ApplicationDefinedElementPurpose;
		opencascade::handle<TCollection_HAsciiString> ApplicationDefinedElementPurpose ();

		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "* Recognizes a items of select member SurfaceElementPurposeMember 1 -> EnumeratedSurfaceElementPurpose 2 -> ApplicationDefinedElementPurpose 0 else
	:param ent:
	:type ent: StepData_SelectMember
	:rtype: int") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of SurfaceElementPurpose select type return 0
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** EnumeratedSurfaceElementPurpose ******************/
		%feature("compactdefaultargs") EnumeratedSurfaceElementPurpose;
		%feature("autodoc", "* Returns Value as EnumeratedSurfaceElementPurpose (or Null if another type)
	:rtype: StepElement_EnumeratedSurfaceElementPurpose") EnumeratedSurfaceElementPurpose;
		StepElement_EnumeratedSurfaceElementPurpose EnumeratedSurfaceElementPurpose ();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "* Returns a new select member the type SurfaceElementPurposeMember
	:rtype: opencascade::handle<StepData_SelectMember>") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();

		/****************** SetApplicationDefinedElementPurpose ******************/
		%feature("compactdefaultargs") SetApplicationDefinedElementPurpose;
		%feature("autodoc", "* Set Value for ApplicationDefinedElementPurpose
	:param aVal:
	:type aVal: TCollection_HAsciiString
	:rtype: None") SetApplicationDefinedElementPurpose;
		void SetApplicationDefinedElementPurpose (const opencascade::handle<TCollection_HAsciiString> & aVal);

		/****************** SetEnumeratedSurfaceElementPurpose ******************/
		%feature("compactdefaultargs") SetEnumeratedSurfaceElementPurpose;
		%feature("autodoc", "* Set Value for EnumeratedSurfaceElementPurpose
	:param aVal:
	:type aVal: StepElement_EnumeratedSurfaceElementPurpose
	:rtype: None") SetEnumeratedSurfaceElementPurpose;
		void SetEnumeratedSurfaceElementPurpose (const StepElement_EnumeratedSurfaceElementPurpose aVal);

		/****************** StepElement_SurfaceElementPurpose ******************/
		%feature("compactdefaultargs") StepElement_SurfaceElementPurpose;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_SurfaceElementPurpose;
		 StepElement_SurfaceElementPurpose ();

};


%extend StepElement_SurfaceElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepElement_SurfaceElementPurposeMember *
************************************************/
class StepElement_SurfaceElementPurposeMember : public StepData_SelectNamed {
	public:
		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Returns True if has name
	:rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the name of a SelectMember matches a given one;
	:param name:
	:type name: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns set name
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set name
	:param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** StepElement_SurfaceElementPurposeMember ******************/
		%feature("compactdefaultargs") StepElement_SurfaceElementPurposeMember;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_SurfaceElementPurposeMember;
		 StepElement_SurfaceElementPurposeMember ();

};


%make_alias(StepElement_SurfaceElementPurposeMember)

%extend StepElement_SurfaceElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepElement_SurfaceSection *
***********************************/
class StepElement_SurfaceSection : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aOffset:
	:type aOffset: StepElement_MeasureOrUnspecifiedValue
	:param aNonStructuralMass:
	:type aNonStructuralMass: StepElement_MeasureOrUnspecifiedValue
	:param aNonStructuralMassOffset:
	:type aNonStructuralMassOffset: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") Init;
		void Init (const StepElement_MeasureOrUnspecifiedValue & aOffset,const StepElement_MeasureOrUnspecifiedValue & aNonStructuralMass,const StepElement_MeasureOrUnspecifiedValue & aNonStructuralMassOffset);

		/****************** NonStructuralMass ******************/
		%feature("compactdefaultargs") NonStructuralMass;
		%feature("autodoc", "* Returns field NonStructuralMass
	:rtype: StepElement_MeasureOrUnspecifiedValue") NonStructuralMass;
		StepElement_MeasureOrUnspecifiedValue NonStructuralMass ();

		/****************** NonStructuralMassOffset ******************/
		%feature("compactdefaultargs") NonStructuralMassOffset;
		%feature("autodoc", "* Returns field NonStructuralMassOffset
	:rtype: StepElement_MeasureOrUnspecifiedValue") NonStructuralMassOffset;
		StepElement_MeasureOrUnspecifiedValue NonStructuralMassOffset ();

		/****************** Offset ******************/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "* Returns field Offset
	:rtype: StepElement_MeasureOrUnspecifiedValue") Offset;
		StepElement_MeasureOrUnspecifiedValue Offset ();

		/****************** SetNonStructuralMass ******************/
		%feature("compactdefaultargs") SetNonStructuralMass;
		%feature("autodoc", "* Set field NonStructuralMass
	:param NonStructuralMass:
	:type NonStructuralMass: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") SetNonStructuralMass;
		void SetNonStructuralMass (const StepElement_MeasureOrUnspecifiedValue & NonStructuralMass);

		/****************** SetNonStructuralMassOffset ******************/
		%feature("compactdefaultargs") SetNonStructuralMassOffset;
		%feature("autodoc", "* Set field NonStructuralMassOffset
	:param NonStructuralMassOffset:
	:type NonStructuralMassOffset: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") SetNonStructuralMassOffset;
		void SetNonStructuralMassOffset (const StepElement_MeasureOrUnspecifiedValue & NonStructuralMassOffset);

		/****************** SetOffset ******************/
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "* Set field Offset
	:param Offset:
	:type Offset: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") SetOffset;
		void SetOffset (const StepElement_MeasureOrUnspecifiedValue & Offset);

		/****************** StepElement_SurfaceSection ******************/
		%feature("compactdefaultargs") StepElement_SurfaceSection;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_SurfaceSection;
		 StepElement_SurfaceSection ();

};


%make_alias(StepElement_SurfaceSection)

%extend StepElement_SurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepElement_SurfaceSectionField *
****************************************/
class StepElement_SurfaceSectionField : public Standard_Transient {
	public:
		/****************** StepElement_SurfaceSectionField ******************/
		%feature("compactdefaultargs") StepElement_SurfaceSectionField;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_SurfaceSectionField;
		 StepElement_SurfaceSectionField ();

};


%make_alias(StepElement_SurfaceSectionField)

%extend StepElement_SurfaceSectionField {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepElement_VolumeElementPurpose *
*****************************************/
class StepElement_VolumeElementPurpose : public StepData_SelectType {
	public:
		/****************** ApplicationDefinedElementPurpose ******************/
		%feature("compactdefaultargs") ApplicationDefinedElementPurpose;
		%feature("autodoc", "* Returns Value as ApplicationDefinedElementPurpose (or Null if another type)
	:rtype: opencascade::handle<TCollection_HAsciiString>") ApplicationDefinedElementPurpose;
		opencascade::handle<TCollection_HAsciiString> ApplicationDefinedElementPurpose ();

		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "* Recognizes a items of select member VolumeElementPurposeMember 1 -> EnumeratedVolumeElementPurpose 2 -> ApplicationDefinedElementPurpose 0 else
	:param ent:
	:type ent: StepData_SelectMember
	:rtype: int") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of VolumeElementPurpose select type return 0
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** EnumeratedVolumeElementPurpose ******************/
		%feature("compactdefaultargs") EnumeratedVolumeElementPurpose;
		%feature("autodoc", "* Returns Value as EnumeratedVolumeElementPurpose (or Null if another type)
	:rtype: StepElement_EnumeratedVolumeElementPurpose") EnumeratedVolumeElementPurpose;
		StepElement_EnumeratedVolumeElementPurpose EnumeratedVolumeElementPurpose ();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "* Returns a new select member the type VolumeElementPurposeMember
	:rtype: opencascade::handle<StepData_SelectMember>") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();

		/****************** SetApplicationDefinedElementPurpose ******************/
		%feature("compactdefaultargs") SetApplicationDefinedElementPurpose;
		%feature("autodoc", "* Set Value for ApplicationDefinedElementPurpose
	:param aVal:
	:type aVal: TCollection_HAsciiString
	:rtype: None") SetApplicationDefinedElementPurpose;
		void SetApplicationDefinedElementPurpose (const opencascade::handle<TCollection_HAsciiString> & aVal);

		/****************** SetEnumeratedVolumeElementPurpose ******************/
		%feature("compactdefaultargs") SetEnumeratedVolumeElementPurpose;
		%feature("autodoc", "* Set Value for EnumeratedVolumeElementPurpose
	:param aVal:
	:type aVal: StepElement_EnumeratedVolumeElementPurpose
	:rtype: None") SetEnumeratedVolumeElementPurpose;
		void SetEnumeratedVolumeElementPurpose (const StepElement_EnumeratedVolumeElementPurpose aVal);

		/****************** StepElement_VolumeElementPurpose ******************/
		%feature("compactdefaultargs") StepElement_VolumeElementPurpose;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_VolumeElementPurpose;
		 StepElement_VolumeElementPurpose ();

};


%extend StepElement_VolumeElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepElement_VolumeElementPurposeMember *
***********************************************/
class StepElement_VolumeElementPurposeMember : public StepData_SelectNamed {
	public:
		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Returns True if has name
	:rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the name of a SelectMember matches a given one;
	:param name:
	:type name: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns set name
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set name
	:param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** StepElement_VolumeElementPurposeMember ******************/
		%feature("compactdefaultargs") StepElement_VolumeElementPurposeMember;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_VolumeElementPurposeMember;
		 StepElement_VolumeElementPurposeMember ();

};


%make_alias(StepElement_VolumeElementPurposeMember)

%extend StepElement_VolumeElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepElement_Curve3dElementDescriptor *
*********************************************/
class StepElement_Curve3dElementDescriptor : public StepElement_ElementDescriptor {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aElementDescriptor_TopologyOrder:
	:type aElementDescriptor_TopologyOrder: StepElement_ElementOrder
	:param aElementDescriptor_Description:
	:type aElementDescriptor_Description: TCollection_HAsciiString
	:param aPurpose:
	:type aPurpose: StepElement_HArray1OfHSequenceOfCurveElementPurposeMember
	:rtype: None") Init;
		void Init (const StepElement_ElementOrder aElementDescriptor_TopologyOrder,const opencascade::handle<TCollection_HAsciiString> & aElementDescriptor_Description,const opencascade::handle<StepElement_HArray1OfHSequenceOfCurveElementPurposeMember> & aPurpose);

		/****************** Purpose ******************/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "* Returns field Purpose
	:rtype: opencascade::handle<StepElement_HArray1OfHSequenceOfCurveElementPurposeMember>") Purpose;
		opencascade::handle<StepElement_HArray1OfHSequenceOfCurveElementPurposeMember> Purpose ();

		/****************** SetPurpose ******************/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "* Set field Purpose
	:param Purpose:
	:type Purpose: StepElement_HArray1OfHSequenceOfCurveElementPurposeMember
	:rtype: None") SetPurpose;
		void SetPurpose (const opencascade::handle<StepElement_HArray1OfHSequenceOfCurveElementPurposeMember> & Purpose);

		/****************** StepElement_Curve3dElementDescriptor ******************/
		%feature("compactdefaultargs") StepElement_Curve3dElementDescriptor;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_Curve3dElementDescriptor;
		 StepElement_Curve3dElementDescriptor ();

};


%make_alias(StepElement_Curve3dElementDescriptor)

%extend StepElement_Curve3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class StepElement_CurveElementSectionDerivedDefinitions *
**********************************************************/
class StepElement_CurveElementSectionDerivedDefinitions : public StepElement_CurveElementSectionDefinition {
	public:
		/****************** CrossSectionalArea ******************/
		%feature("compactdefaultargs") CrossSectionalArea;
		%feature("autodoc", "* Returns field CrossSectionalArea
	:rtype: float") CrossSectionalArea;
		Standard_Real CrossSectionalArea ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aCurveElementSectionDefinition_Description:
	:type aCurveElementSectionDefinition_Description: TCollection_HAsciiString
	:param aCurveElementSectionDefinition_SectionAngle:
	:type aCurveElementSectionDefinition_SectionAngle: float
	:param aCrossSectionalArea:
	:type aCrossSectionalArea: float
	:param aShearArea:
	:type aShearArea: StepElement_HArray1OfMeasureOrUnspecifiedValue
	:param aSecondMomentOfArea:
	:type aSecondMomentOfArea: TColStd_HArray1OfReal
	:param aTorsionalConstant:
	:type aTorsionalConstant: float
	:param aWarpingConstant:
	:type aWarpingConstant: StepElement_MeasureOrUnspecifiedValue
	:param aLocationOfCentroid:
	:type aLocationOfCentroid: StepElement_HArray1OfMeasureOrUnspecifiedValue
	:param aLocationOfShearCentre:
	:type aLocationOfShearCentre: StepElement_HArray1OfMeasureOrUnspecifiedValue
	:param aLocationOfNonStructuralMass:
	:type aLocationOfNonStructuralMass: StepElement_HArray1OfMeasureOrUnspecifiedValue
	:param aNonStructuralMass:
	:type aNonStructuralMass: StepElement_MeasureOrUnspecifiedValue
	:param aPolarMoment:
	:type aPolarMoment: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aCurveElementSectionDefinition_Description,const Standard_Real aCurveElementSectionDefinition_SectionAngle,const Standard_Real aCrossSectionalArea,const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & aShearArea,const opencascade::handle<TColStd_HArray1OfReal> & aSecondMomentOfArea,const Standard_Real aTorsionalConstant,const StepElement_MeasureOrUnspecifiedValue & aWarpingConstant,const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & aLocationOfCentroid,const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & aLocationOfShearCentre,const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & aLocationOfNonStructuralMass,const StepElement_MeasureOrUnspecifiedValue & aNonStructuralMass,const StepElement_MeasureOrUnspecifiedValue & aPolarMoment);

		/****************** LocationOfCentroid ******************/
		%feature("compactdefaultargs") LocationOfCentroid;
		%feature("autodoc", "* Returns field LocationOfCentroid
	:rtype: opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue>") LocationOfCentroid;
		opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> LocationOfCentroid ();

		/****************** LocationOfNonStructuralMass ******************/
		%feature("compactdefaultargs") LocationOfNonStructuralMass;
		%feature("autodoc", "* Returns field LocationOfNonStructuralMass
	:rtype: opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue>") LocationOfNonStructuralMass;
		opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> LocationOfNonStructuralMass ();

		/****************** LocationOfShearCentre ******************/
		%feature("compactdefaultargs") LocationOfShearCentre;
		%feature("autodoc", "* Returns field LocationOfShearCentre
	:rtype: opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue>") LocationOfShearCentre;
		opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> LocationOfShearCentre ();

		/****************** NonStructuralMass ******************/
		%feature("compactdefaultargs") NonStructuralMass;
		%feature("autodoc", "* Returns field NonStructuralMass
	:rtype: StepElement_MeasureOrUnspecifiedValue") NonStructuralMass;
		StepElement_MeasureOrUnspecifiedValue NonStructuralMass ();

		/****************** PolarMoment ******************/
		%feature("compactdefaultargs") PolarMoment;
		%feature("autodoc", "* Returns field PolarMoment
	:rtype: StepElement_MeasureOrUnspecifiedValue") PolarMoment;
		StepElement_MeasureOrUnspecifiedValue PolarMoment ();

		/****************** SecondMomentOfArea ******************/
		%feature("compactdefaultargs") SecondMomentOfArea;
		%feature("autodoc", "* Returns field SecondMomentOfArea
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") SecondMomentOfArea;
		opencascade::handle<TColStd_HArray1OfReal> SecondMomentOfArea ();

		/****************** SetCrossSectionalArea ******************/
		%feature("compactdefaultargs") SetCrossSectionalArea;
		%feature("autodoc", "* Set field CrossSectionalArea
	:param CrossSectionalArea:
	:type CrossSectionalArea: float
	:rtype: None") SetCrossSectionalArea;
		void SetCrossSectionalArea (const Standard_Real CrossSectionalArea);

		/****************** SetLocationOfCentroid ******************/
		%feature("compactdefaultargs") SetLocationOfCentroid;
		%feature("autodoc", "* Set field LocationOfCentroid
	:param LocationOfCentroid:
	:type LocationOfCentroid: StepElement_HArray1OfMeasureOrUnspecifiedValue
	:rtype: None") SetLocationOfCentroid;
		void SetLocationOfCentroid (const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & LocationOfCentroid);

		/****************** SetLocationOfNonStructuralMass ******************/
		%feature("compactdefaultargs") SetLocationOfNonStructuralMass;
		%feature("autodoc", "* Set field LocationOfNonStructuralMass
	:param LocationOfNonStructuralMass:
	:type LocationOfNonStructuralMass: StepElement_HArray1OfMeasureOrUnspecifiedValue
	:rtype: None") SetLocationOfNonStructuralMass;
		void SetLocationOfNonStructuralMass (const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & LocationOfNonStructuralMass);

		/****************** SetLocationOfShearCentre ******************/
		%feature("compactdefaultargs") SetLocationOfShearCentre;
		%feature("autodoc", "* Set field LocationOfShearCentre
	:param LocationOfShearCentre:
	:type LocationOfShearCentre: StepElement_HArray1OfMeasureOrUnspecifiedValue
	:rtype: None") SetLocationOfShearCentre;
		void SetLocationOfShearCentre (const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & LocationOfShearCentre);

		/****************** SetNonStructuralMass ******************/
		%feature("compactdefaultargs") SetNonStructuralMass;
		%feature("autodoc", "* Set field NonStructuralMass
	:param NonStructuralMass:
	:type NonStructuralMass: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") SetNonStructuralMass;
		void SetNonStructuralMass (const StepElement_MeasureOrUnspecifiedValue & NonStructuralMass);

		/****************** SetPolarMoment ******************/
		%feature("compactdefaultargs") SetPolarMoment;
		%feature("autodoc", "* Set field PolarMoment
	:param PolarMoment:
	:type PolarMoment: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") SetPolarMoment;
		void SetPolarMoment (const StepElement_MeasureOrUnspecifiedValue & PolarMoment);

		/****************** SetSecondMomentOfArea ******************/
		%feature("compactdefaultargs") SetSecondMomentOfArea;
		%feature("autodoc", "* Set field SecondMomentOfArea
	:param SecondMomentOfArea:
	:type SecondMomentOfArea: TColStd_HArray1OfReal
	:rtype: None") SetSecondMomentOfArea;
		void SetSecondMomentOfArea (const opencascade::handle<TColStd_HArray1OfReal> & SecondMomentOfArea);

		/****************** SetShearArea ******************/
		%feature("compactdefaultargs") SetShearArea;
		%feature("autodoc", "* Set field ShearArea
	:param ShearArea:
	:type ShearArea: StepElement_HArray1OfMeasureOrUnspecifiedValue
	:rtype: None") SetShearArea;
		void SetShearArea (const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & ShearArea);

		/****************** SetTorsionalConstant ******************/
		%feature("compactdefaultargs") SetTorsionalConstant;
		%feature("autodoc", "* Set field TorsionalConstant
	:param TorsionalConstant:
	:type TorsionalConstant: float
	:rtype: None") SetTorsionalConstant;
		void SetTorsionalConstant (const Standard_Real TorsionalConstant);

		/****************** SetWarpingConstant ******************/
		%feature("compactdefaultargs") SetWarpingConstant;
		%feature("autodoc", "* Set field WarpingConstant
	:param WarpingConstant:
	:type WarpingConstant: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") SetWarpingConstant;
		void SetWarpingConstant (const StepElement_MeasureOrUnspecifiedValue & WarpingConstant);

		/****************** ShearArea ******************/
		%feature("compactdefaultargs") ShearArea;
		%feature("autodoc", "* Returns field ShearArea
	:rtype: opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue>") ShearArea;
		opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> ShearArea ();

		/****************** StepElement_CurveElementSectionDerivedDefinitions ******************/
		%feature("compactdefaultargs") StepElement_CurveElementSectionDerivedDefinitions;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_CurveElementSectionDerivedDefinitions;
		 StepElement_CurveElementSectionDerivedDefinitions ();

		/****************** TorsionalConstant ******************/
		%feature("compactdefaultargs") TorsionalConstant;
		%feature("autodoc", "* Returns field TorsionalConstant
	:rtype: float") TorsionalConstant;
		Standard_Real TorsionalConstant ();

		/****************** WarpingConstant ******************/
		%feature("compactdefaultargs") WarpingConstant;
		%feature("autodoc", "* Returns field WarpingConstant
	:rtype: StepElement_MeasureOrUnspecifiedValue") WarpingConstant;
		StepElement_MeasureOrUnspecifiedValue WarpingConstant ();

};


%make_alias(StepElement_CurveElementSectionDerivedDefinitions)

%extend StepElement_CurveElementSectionDerivedDefinitions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepElement_Surface3dElementDescriptor *
***********************************************/
class StepElement_Surface3dElementDescriptor : public StepElement_ElementDescriptor {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aElementDescriptor_TopologyOrder:
	:type aElementDescriptor_TopologyOrder: StepElement_ElementOrder
	:param aElementDescriptor_Description:
	:type aElementDescriptor_Description: TCollection_HAsciiString
	:param aPurpose:
	:type aPurpose: StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember
	:param aShape:
	:type aShape: StepElement_Element2dShape
	:rtype: None") Init;
		void Init (const StepElement_ElementOrder aElementDescriptor_TopologyOrder,const opencascade::handle<TCollection_HAsciiString> & aElementDescriptor_Description,const opencascade::handle<StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember> & aPurpose,const StepElement_Element2dShape aShape);

		/****************** Purpose ******************/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "* Returns field Purpose
	:rtype: opencascade::handle<StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember>") Purpose;
		opencascade::handle<StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember> Purpose ();

		/****************** SetPurpose ******************/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "* Set field Purpose
	:param Purpose:
	:type Purpose: StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember
	:rtype: None") SetPurpose;
		void SetPurpose (const opencascade::handle<StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember> & Purpose);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "* Set field Shape
	:param Shape:
	:type Shape: StepElement_Element2dShape
	:rtype: None") SetShape;
		void SetShape (const StepElement_Element2dShape Shape);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns field Shape
	:rtype: StepElement_Element2dShape") Shape;
		StepElement_Element2dShape Shape ();

		/****************** StepElement_Surface3dElementDescriptor ******************/
		%feature("compactdefaultargs") StepElement_Surface3dElementDescriptor;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_Surface3dElementDescriptor;
		 StepElement_Surface3dElementDescriptor ();

};


%make_alias(StepElement_Surface3dElementDescriptor)

%extend StepElement_Surface3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepElement_SurfaceSectionFieldConstant *
************************************************/
class StepElement_SurfaceSectionFieldConstant : public StepElement_SurfaceSectionField {
	public:
		/****************** Definition ******************/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "* Returns field Definition
	:rtype: opencascade::handle<StepElement_SurfaceSection>") Definition;
		opencascade::handle<StepElement_SurfaceSection> Definition ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aDefinition:
	:type aDefinition: StepElement_SurfaceSection
	:rtype: None") Init;
		void Init (const opencascade::handle<StepElement_SurfaceSection> & aDefinition);

		/****************** SetDefinition ******************/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "* Set field Definition
	:param Definition:
	:type Definition: StepElement_SurfaceSection
	:rtype: None") SetDefinition;
		void SetDefinition (const opencascade::handle<StepElement_SurfaceSection> & Definition);

		/****************** StepElement_SurfaceSectionFieldConstant ******************/
		%feature("compactdefaultargs") StepElement_SurfaceSectionFieldConstant;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_SurfaceSectionFieldConstant;
		 StepElement_SurfaceSectionFieldConstant ();

};


%make_alias(StepElement_SurfaceSectionFieldConstant)

%extend StepElement_SurfaceSectionFieldConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepElement_SurfaceSectionFieldVarying *
***********************************************/
class StepElement_SurfaceSectionFieldVarying : public StepElement_SurfaceSectionField {
	public:
		/****************** AdditionalNodeValues ******************/
		%feature("compactdefaultargs") AdditionalNodeValues;
		%feature("autodoc", "* Returns field AdditionalNodeValues
	:rtype: bool") AdditionalNodeValues;
		Standard_Boolean AdditionalNodeValues ();

		/****************** Definitions ******************/
		%feature("compactdefaultargs") Definitions;
		%feature("autodoc", "* Returns field Definitions
	:rtype: opencascade::handle<StepElement_HArray1OfSurfaceSection>") Definitions;
		opencascade::handle<StepElement_HArray1OfSurfaceSection> Definitions ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aDefinitions:
	:type aDefinitions: StepElement_HArray1OfSurfaceSection
	:param aAdditionalNodeValues:
	:type aAdditionalNodeValues: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<StepElement_HArray1OfSurfaceSection> & aDefinitions,const Standard_Boolean aAdditionalNodeValues);

		/****************** SetAdditionalNodeValues ******************/
		%feature("compactdefaultargs") SetAdditionalNodeValues;
		%feature("autodoc", "* Set field AdditionalNodeValues
	:param AdditionalNodeValues:
	:type AdditionalNodeValues: bool
	:rtype: None") SetAdditionalNodeValues;
		void SetAdditionalNodeValues (const Standard_Boolean AdditionalNodeValues);

		/****************** SetDefinitions ******************/
		%feature("compactdefaultargs") SetDefinitions;
		%feature("autodoc", "* Set field Definitions
	:param Definitions:
	:type Definitions: StepElement_HArray1OfSurfaceSection
	:rtype: None") SetDefinitions;
		void SetDefinitions (const opencascade::handle<StepElement_HArray1OfSurfaceSection> & Definitions);

		/****************** StepElement_SurfaceSectionFieldVarying ******************/
		%feature("compactdefaultargs") StepElement_SurfaceSectionFieldVarying;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_SurfaceSectionFieldVarying;
		 StepElement_SurfaceSectionFieldVarying ();

};


%make_alias(StepElement_SurfaceSectionFieldVarying)

%extend StepElement_SurfaceSectionFieldVarying {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepElement_UniformSurfaceSection *
******************************************/
class StepElement_UniformSurfaceSection : public StepElement_SurfaceSection {
	public:
		/****************** BendingThickness ******************/
		%feature("compactdefaultargs") BendingThickness;
		%feature("autodoc", "* Returns field BendingThickness
	:rtype: StepElement_MeasureOrUnspecifiedValue") BendingThickness;
		StepElement_MeasureOrUnspecifiedValue BendingThickness ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aSurfaceSection_Offset:
	:type aSurfaceSection_Offset: StepElement_MeasureOrUnspecifiedValue
	:param aSurfaceSection_NonStructuralMass:
	:type aSurfaceSection_NonStructuralMass: StepElement_MeasureOrUnspecifiedValue
	:param aSurfaceSection_NonStructuralMassOffset:
	:type aSurfaceSection_NonStructuralMassOffset: StepElement_MeasureOrUnspecifiedValue
	:param aThickness:
	:type aThickness: float
	:param aBendingThickness:
	:type aBendingThickness: StepElement_MeasureOrUnspecifiedValue
	:param aShearThickness:
	:type aShearThickness: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") Init;
		void Init (const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_Offset,const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_NonStructuralMass,const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_NonStructuralMassOffset,const Standard_Real aThickness,const StepElement_MeasureOrUnspecifiedValue & aBendingThickness,const StepElement_MeasureOrUnspecifiedValue & aShearThickness);

		/****************** SetBendingThickness ******************/
		%feature("compactdefaultargs") SetBendingThickness;
		%feature("autodoc", "* Set field BendingThickness
	:param BendingThickness:
	:type BendingThickness: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") SetBendingThickness;
		void SetBendingThickness (const StepElement_MeasureOrUnspecifiedValue & BendingThickness);

		/****************** SetShearThickness ******************/
		%feature("compactdefaultargs") SetShearThickness;
		%feature("autodoc", "* Set field ShearThickness
	:param ShearThickness:
	:type ShearThickness: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") SetShearThickness;
		void SetShearThickness (const StepElement_MeasureOrUnspecifiedValue & ShearThickness);

		/****************** SetThickness ******************/
		%feature("compactdefaultargs") SetThickness;
		%feature("autodoc", "* Set field Thickness
	:param Thickness:
	:type Thickness: float
	:rtype: None") SetThickness;
		void SetThickness (const Standard_Real Thickness);

		/****************** ShearThickness ******************/
		%feature("compactdefaultargs") ShearThickness;
		%feature("autodoc", "* Returns field ShearThickness
	:rtype: StepElement_MeasureOrUnspecifiedValue") ShearThickness;
		StepElement_MeasureOrUnspecifiedValue ShearThickness ();

		/****************** StepElement_UniformSurfaceSection ******************/
		%feature("compactdefaultargs") StepElement_UniformSurfaceSection;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_UniformSurfaceSection;
		 StepElement_UniformSurfaceSection ();

		/****************** Thickness ******************/
		%feature("compactdefaultargs") Thickness;
		%feature("autodoc", "* Returns field Thickness
	:rtype: float") Thickness;
		Standard_Real Thickness ();

};


%make_alias(StepElement_UniformSurfaceSection)

%extend StepElement_UniformSurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepElement_Volume3dElementDescriptor *
**********************************************/
class StepElement_Volume3dElementDescriptor : public StepElement_ElementDescriptor {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aElementDescriptor_TopologyOrder:
	:type aElementDescriptor_TopologyOrder: StepElement_ElementOrder
	:param aElementDescriptor_Description:
	:type aElementDescriptor_Description: TCollection_HAsciiString
	:param aPurpose:
	:type aPurpose: StepElement_HArray1OfVolumeElementPurposeMember
	:param aShape:
	:type aShape: StepElement_Volume3dElementShape
	:rtype: None") Init;
		void Init (const StepElement_ElementOrder aElementDescriptor_TopologyOrder,const opencascade::handle<TCollection_HAsciiString> & aElementDescriptor_Description,const opencascade::handle<StepElement_HArray1OfVolumeElementPurposeMember> & aPurpose,const StepElement_Volume3dElementShape aShape);

		/****************** Purpose ******************/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "* Returns field Purpose
	:rtype: opencascade::handle<StepElement_HArray1OfVolumeElementPurposeMember>") Purpose;
		opencascade::handle<StepElement_HArray1OfVolumeElementPurposeMember> Purpose ();

		/****************** SetPurpose ******************/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "* Set field Purpose
	:param Purpose:
	:type Purpose: StepElement_HArray1OfVolumeElementPurposeMember
	:rtype: None") SetPurpose;
		void SetPurpose (const opencascade::handle<StepElement_HArray1OfVolumeElementPurposeMember> & Purpose);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "* Set field Shape
	:param Shape:
	:type Shape: StepElement_Volume3dElementShape
	:rtype: None") SetShape;
		void SetShape (const StepElement_Volume3dElementShape Shape);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns field Shape
	:rtype: StepElement_Volume3dElementShape") Shape;
		StepElement_Volume3dElementShape Shape ();

		/****************** StepElement_Volume3dElementDescriptor ******************/
		%feature("compactdefaultargs") StepElement_Volume3dElementDescriptor;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepElement_Volume3dElementDescriptor;
		 StepElement_Volume3dElementDescriptor ();

};


%make_alias(StepElement_Volume3dElementDescriptor)

%extend StepElement_Volume3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class StepElement_HArray1OfVolumeElementPurpose : public  StepElement_Array1OfVolumeElementPurpose, public Standard_Transient {
  public:
    StepElement_HArray1OfVolumeElementPurpose(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfVolumeElementPurpose(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepElement_Array1OfVolumeElementPurpose::value_type& theValue);
    StepElement_HArray1OfVolumeElementPurpose(const  StepElement_Array1OfVolumeElementPurpose& theOther);
    const  StepElement_Array1OfVolumeElementPurpose& Array1();
     StepElement_Array1OfVolumeElementPurpose& ChangeArray1();
};
%make_alias(StepElement_HArray1OfVolumeElementPurpose)


class StepElement_HArray1OfHSequenceOfCurveElementPurposeMember : public  StepElement_Array1OfHSequenceOfCurveElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HArray1OfHSequenceOfCurveElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfHSequenceOfCurveElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepElement_Array1OfHSequenceOfCurveElementPurposeMember::value_type& theValue);
    StepElement_HArray1OfHSequenceOfCurveElementPurposeMember(const  StepElement_Array1OfHSequenceOfCurveElementPurposeMember& theOther);
    const  StepElement_Array1OfHSequenceOfCurveElementPurposeMember& Array1();
     StepElement_Array1OfHSequenceOfCurveElementPurposeMember& ChangeArray1();
};
%make_alias(StepElement_HArray1OfHSequenceOfCurveElementPurposeMember)


class StepElement_HArray1OfSurfaceSection : public  StepElement_Array1OfSurfaceSection, public Standard_Transient {
  public:
    StepElement_HArray1OfSurfaceSection(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfSurfaceSection(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepElement_Array1OfSurfaceSection::value_type& theValue);
    StepElement_HArray1OfSurfaceSection(const  StepElement_Array1OfSurfaceSection& theOther);
    const  StepElement_Array1OfSurfaceSection& Array1();
     StepElement_Array1OfSurfaceSection& ChangeArray1();
};
%make_alias(StepElement_HArray1OfSurfaceSection)


class StepElement_HArray1OfCurveElementSectionDefinition : public  StepElement_Array1OfCurveElementSectionDefinition, public Standard_Transient {
  public:
    StepElement_HArray1OfCurveElementSectionDefinition(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfCurveElementSectionDefinition(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepElement_Array1OfCurveElementSectionDefinition::value_type& theValue);
    StepElement_HArray1OfCurveElementSectionDefinition(const  StepElement_Array1OfCurveElementSectionDefinition& theOther);
    const  StepElement_Array1OfCurveElementSectionDefinition& Array1();
     StepElement_Array1OfCurveElementSectionDefinition& ChangeArray1();
};
%make_alias(StepElement_HArray1OfCurveElementSectionDefinition)


class StepElement_HArray1OfMeasureOrUnspecifiedValue : public  StepElement_Array1OfMeasureOrUnspecifiedValue, public Standard_Transient {
  public:
    StepElement_HArray1OfMeasureOrUnspecifiedValue(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfMeasureOrUnspecifiedValue(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepElement_Array1OfMeasureOrUnspecifiedValue::value_type& theValue);
    StepElement_HArray1OfMeasureOrUnspecifiedValue(const  StepElement_Array1OfMeasureOrUnspecifiedValue& theOther);
    const  StepElement_Array1OfMeasureOrUnspecifiedValue& Array1();
     StepElement_Array1OfMeasureOrUnspecifiedValue& ChangeArray1();
};
%make_alias(StepElement_HArray1OfMeasureOrUnspecifiedValue)


class StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember : public  StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember::value_type& theValue);
    StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember(const  StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember& theOther);
    const  StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember& Array1();
     StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember& ChangeArray1();
};
%make_alias(StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember)


class StepElement_HArray1OfVolumeElementPurposeMember : public  StepElement_Array1OfVolumeElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HArray1OfVolumeElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfVolumeElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepElement_Array1OfVolumeElementPurposeMember::value_type& theValue);
    StepElement_HArray1OfVolumeElementPurposeMember(const  StepElement_Array1OfVolumeElementPurposeMember& theOther);
    const  StepElement_Array1OfVolumeElementPurposeMember& Array1();
     StepElement_Array1OfVolumeElementPurposeMember& ChangeArray1();
};
%make_alias(StepElement_HArray1OfVolumeElementPurposeMember)


class StepElement_HArray1OfCurveElementEndReleasePacket : public  StepElement_Array1OfCurveElementEndReleasePacket, public Standard_Transient {
  public:
    StepElement_HArray1OfCurveElementEndReleasePacket(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfCurveElementEndReleasePacket(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepElement_Array1OfCurveElementEndReleasePacket::value_type& theValue);
    StepElement_HArray1OfCurveElementEndReleasePacket(const  StepElement_Array1OfCurveElementEndReleasePacket& theOther);
    const  StepElement_Array1OfCurveElementEndReleasePacket& Array1();
     StepElement_Array1OfCurveElementEndReleasePacket& ChangeArray1();
};
%make_alias(StepElement_HArray1OfCurveElementEndReleasePacket)


/* harray2 classes */
class StepElement_HArray2OfSurfaceElementPurposeMember : public  StepElement_Array2OfSurfaceElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HArray2OfSurfaceElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepElement_HArray2OfSurfaceElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  StepElement_Array2OfSurfaceElementPurposeMember::value_type& theValue);
    StepElement_HArray2OfSurfaceElementPurposeMember(const  StepElement_Array2OfSurfaceElementPurposeMember& theOther);
    const  StepElement_Array2OfSurfaceElementPurposeMember& Array2 ();
     StepElement_Array2OfSurfaceElementPurposeMember& ChangeArray2 (); 
};
%make_alias(StepElement_HArray2OfSurfaceElementPurposeMember)


class StepElement_HArray2OfSurfaceElementPurpose : public  StepElement_Array2OfSurfaceElementPurpose, public Standard_Transient {
  public:
    StepElement_HArray2OfSurfaceElementPurpose(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepElement_HArray2OfSurfaceElementPurpose(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  StepElement_Array2OfSurfaceElementPurpose::value_type& theValue);
    StepElement_HArray2OfSurfaceElementPurpose(const  StepElement_Array2OfSurfaceElementPurpose& theOther);
    const  StepElement_Array2OfSurfaceElementPurpose& Array2 ();
     StepElement_Array2OfSurfaceElementPurpose& ChangeArray2 (); 
};
%make_alias(StepElement_HArray2OfSurfaceElementPurpose)


class StepElement_HArray2OfCurveElementPurposeMember : public  StepElement_Array2OfCurveElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HArray2OfCurveElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepElement_HArray2OfCurveElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  StepElement_Array2OfCurveElementPurposeMember::value_type& theValue);
    StepElement_HArray2OfCurveElementPurposeMember(const  StepElement_Array2OfCurveElementPurposeMember& theOther);
    const  StepElement_Array2OfCurveElementPurposeMember& Array2 ();
     StepElement_Array2OfCurveElementPurposeMember& ChangeArray2 (); 
};
%make_alias(StepElement_HArray2OfCurveElementPurposeMember)


/* hsequence classes */
class StepElement_HSequenceOfCurveElementSectionDefinition : public  StepElement_SequenceOfCurveElementSectionDefinition, public Standard_Transient {
  public:
    StepElement_HSequenceOfCurveElementSectionDefinition();
    StepElement_HSequenceOfCurveElementSectionDefinition(const  StepElement_SequenceOfCurveElementSectionDefinition& theOther);
    const  StepElement_SequenceOfCurveElementSectionDefinition& Sequence();
    void Append (const  StepElement_SequenceOfCurveElementSectionDefinition::value_type& theItem);
    void Append ( StepElement_SequenceOfCurveElementSectionDefinition& theSequence);
     StepElement_SequenceOfCurveElementSectionDefinition& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfCurveElementSectionDefinition)


class StepElement_HSequenceOfCurveElementPurposeMember : public  StepElement_SequenceOfCurveElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HSequenceOfCurveElementPurposeMember();
    StepElement_HSequenceOfCurveElementPurposeMember(const  StepElement_SequenceOfCurveElementPurposeMember& theOther);
    const  StepElement_SequenceOfCurveElementPurposeMember& Sequence();
    void Append (const  StepElement_SequenceOfCurveElementPurposeMember::value_type& theItem);
    void Append ( StepElement_SequenceOfCurveElementPurposeMember& theSequence);
     StepElement_SequenceOfCurveElementPurposeMember& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfCurveElementPurposeMember)


class StepElement_HSequenceOfElementMaterial : public  StepElement_SequenceOfElementMaterial, public Standard_Transient {
  public:
    StepElement_HSequenceOfElementMaterial();
    StepElement_HSequenceOfElementMaterial(const  StepElement_SequenceOfElementMaterial& theOther);
    const  StepElement_SequenceOfElementMaterial& Sequence();
    void Append (const  StepElement_SequenceOfElementMaterial::value_type& theItem);
    void Append ( StepElement_SequenceOfElementMaterial& theSequence);
     StepElement_SequenceOfElementMaterial& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfElementMaterial)


class StepElement_HSequenceOfSurfaceElementPurposeMember : public  StepElement_SequenceOfSurfaceElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HSequenceOfSurfaceElementPurposeMember();
    StepElement_HSequenceOfSurfaceElementPurposeMember(const  StepElement_SequenceOfSurfaceElementPurposeMember& theOther);
    const  StepElement_SequenceOfSurfaceElementPurposeMember& Sequence();
    void Append (const  StepElement_SequenceOfSurfaceElementPurposeMember::value_type& theItem);
    void Append ( StepElement_SequenceOfSurfaceElementPurposeMember& theSequence);
     StepElement_SequenceOfSurfaceElementPurposeMember& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfSurfaceElementPurposeMember)


