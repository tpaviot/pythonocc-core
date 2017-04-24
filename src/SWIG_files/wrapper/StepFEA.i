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
%module (package="OCC") StepFEA

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


%include StepFEA_headers.i


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
enum StepFEA_CoordinateSystemType {
	StepFEA_Cartesian = 0,
	StepFEA_Cylindrical = 1,
	StepFEA_Spherical = 2,
};

enum StepFEA_CurveEdge {
	StepFEA_ElementEdge = 0,
};

enum StepFEA_ElementVolume {
	StepFEA_Volume = 0,
};

enum StepFEA_EnumeratedDegreeOfFreedom {
	StepFEA_XTranslation = 0,
	StepFEA_YTranslation = 1,
	StepFEA_ZTranslation = 2,
	StepFEA_XRotation = 3,
	StepFEA_YRotation = 4,
	StepFEA_ZRotation = 5,
	StepFEA_Warp = 6,
};

enum StepFEA_UnspecifiedValue {
	StepFEA_Unspecified = 0,
};

/* end public enums declaration */

%nodefaultctor StepFEA_Array1OfCurveElementEndOffset;
class StepFEA_Array1OfCurveElementEndOffset {
	public:
		%feature("compactdefaultargs") StepFEA_Array1OfCurveElementEndOffset;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfCurveElementEndOffset;
		 StepFEA_Array1OfCurveElementEndOffset (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_Array1OfCurveElementEndOffset;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepFEA_CurveElementEndOffset &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfCurveElementEndOffset;
		 StepFEA_Array1OfCurveElementEndOffset (const Handle_StepFEA_CurveElementEndOffset & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepFEA_CurveElementEndOffset &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_CurveElementEndOffset & V);
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
	:type Other: StepFEA_Array1OfCurveElementEndOffset &
	:rtype: StepFEA_Array1OfCurveElementEndOffset
") Assign;
		const StepFEA_Array1OfCurveElementEndOffset & Assign (const StepFEA_Array1OfCurveElementEndOffset & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_Array1OfCurveElementEndOffset &
	:rtype: StepFEA_Array1OfCurveElementEndOffset
") operator =;
		const StepFEA_Array1OfCurveElementEndOffset & operator = (const StepFEA_Array1OfCurveElementEndOffset & Other);
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
	:type Value: Handle_StepFEA_CurveElementEndOffset &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_CurveElementEndOffset & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementEndOffset
") Value;
		Handle_StepFEA_CurveElementEndOffset Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementEndOffset
") ChangeValue;
		Handle_StepFEA_CurveElementEndOffset ChangeValue (const Standard_Integer Index);
};


%extend StepFEA_Array1OfCurveElementEndOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_Array1OfCurveElementEndRelease;
class StepFEA_Array1OfCurveElementEndRelease {
	public:
		%feature("compactdefaultargs") StepFEA_Array1OfCurveElementEndRelease;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfCurveElementEndRelease;
		 StepFEA_Array1OfCurveElementEndRelease (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_Array1OfCurveElementEndRelease;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepFEA_CurveElementEndRelease &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfCurveElementEndRelease;
		 StepFEA_Array1OfCurveElementEndRelease (const Handle_StepFEA_CurveElementEndRelease & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepFEA_CurveElementEndRelease &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_CurveElementEndRelease & V);
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
	:type Other: StepFEA_Array1OfCurveElementEndRelease &
	:rtype: StepFEA_Array1OfCurveElementEndRelease
") Assign;
		const StepFEA_Array1OfCurveElementEndRelease & Assign (const StepFEA_Array1OfCurveElementEndRelease & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_Array1OfCurveElementEndRelease &
	:rtype: StepFEA_Array1OfCurveElementEndRelease
") operator =;
		const StepFEA_Array1OfCurveElementEndRelease & operator = (const StepFEA_Array1OfCurveElementEndRelease & Other);
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
	:type Value: Handle_StepFEA_CurveElementEndRelease &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_CurveElementEndRelease & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementEndRelease
") Value;
		Handle_StepFEA_CurveElementEndRelease Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementEndRelease
") ChangeValue;
		Handle_StepFEA_CurveElementEndRelease ChangeValue (const Standard_Integer Index);
};


%extend StepFEA_Array1OfCurveElementEndRelease {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_Array1OfCurveElementInterval;
class StepFEA_Array1OfCurveElementInterval {
	public:
		%feature("compactdefaultargs") StepFEA_Array1OfCurveElementInterval;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfCurveElementInterval;
		 StepFEA_Array1OfCurveElementInterval (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_Array1OfCurveElementInterval;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepFEA_CurveElementInterval &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfCurveElementInterval;
		 StepFEA_Array1OfCurveElementInterval (const Handle_StepFEA_CurveElementInterval & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepFEA_CurveElementInterval &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_CurveElementInterval & V);
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
	:type Other: StepFEA_Array1OfCurveElementInterval &
	:rtype: StepFEA_Array1OfCurveElementInterval
") Assign;
		const StepFEA_Array1OfCurveElementInterval & Assign (const StepFEA_Array1OfCurveElementInterval & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_Array1OfCurveElementInterval &
	:rtype: StepFEA_Array1OfCurveElementInterval
") operator =;
		const StepFEA_Array1OfCurveElementInterval & operator = (const StepFEA_Array1OfCurveElementInterval & Other);
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
	:type Value: Handle_StepFEA_CurveElementInterval &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_CurveElementInterval & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementInterval
") Value;
		Handle_StepFEA_CurveElementInterval Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementInterval
") ChangeValue;
		Handle_StepFEA_CurveElementInterval ChangeValue (const Standard_Integer Index);
};


%extend StepFEA_Array1OfCurveElementInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_Array1OfDegreeOfFreedom;
class StepFEA_Array1OfDegreeOfFreedom {
	public:
		%feature("compactdefaultargs") StepFEA_Array1OfDegreeOfFreedom;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfDegreeOfFreedom;
		 StepFEA_Array1OfDegreeOfFreedom (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_Array1OfDegreeOfFreedom;
		%feature("autodoc", "	:param Item:
	:type Item: StepFEA_DegreeOfFreedom &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfDegreeOfFreedom;
		 StepFEA_Array1OfDegreeOfFreedom (const StepFEA_DegreeOfFreedom & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepFEA_DegreeOfFreedom &
	:rtype: None
") Init;
		void Init (const StepFEA_DegreeOfFreedom & V);
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
	:type Other: StepFEA_Array1OfDegreeOfFreedom &
	:rtype: StepFEA_Array1OfDegreeOfFreedom
") Assign;
		const StepFEA_Array1OfDegreeOfFreedom & Assign (const StepFEA_Array1OfDegreeOfFreedom & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_Array1OfDegreeOfFreedom &
	:rtype: StepFEA_Array1OfDegreeOfFreedom
") operator =;
		const StepFEA_Array1OfDegreeOfFreedom & operator = (const StepFEA_Array1OfDegreeOfFreedom & Other);
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
	:type Value: StepFEA_DegreeOfFreedom &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepFEA_DegreeOfFreedom & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepFEA_DegreeOfFreedom
") Value;
		const StepFEA_DegreeOfFreedom & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepFEA_DegreeOfFreedom
") ChangeValue;
		StepFEA_DegreeOfFreedom & ChangeValue (const Standard_Integer Index);
};


%extend StepFEA_Array1OfDegreeOfFreedom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_Array1OfElementRepresentation;
class StepFEA_Array1OfElementRepresentation {
	public:
		%feature("compactdefaultargs") StepFEA_Array1OfElementRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfElementRepresentation;
		 StepFEA_Array1OfElementRepresentation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_Array1OfElementRepresentation;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepFEA_ElementRepresentation &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfElementRepresentation;
		 StepFEA_Array1OfElementRepresentation (const Handle_StepFEA_ElementRepresentation & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_ElementRepresentation & V);
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
	:type Other: StepFEA_Array1OfElementRepresentation &
	:rtype: StepFEA_Array1OfElementRepresentation
") Assign;
		const StepFEA_Array1OfElementRepresentation & Assign (const StepFEA_Array1OfElementRepresentation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_Array1OfElementRepresentation &
	:rtype: StepFEA_Array1OfElementRepresentation
") operator =;
		const StepFEA_Array1OfElementRepresentation & operator = (const StepFEA_Array1OfElementRepresentation & Other);
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
	:type Value: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_ElementRepresentation & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_ElementRepresentation
") Value;
		Handle_StepFEA_ElementRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_ElementRepresentation
") ChangeValue;
		Handle_StepFEA_ElementRepresentation ChangeValue (const Standard_Integer Index);
};


%extend StepFEA_Array1OfElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_Array1OfNodeRepresentation;
class StepFEA_Array1OfNodeRepresentation {
	public:
		%feature("compactdefaultargs") StepFEA_Array1OfNodeRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfNodeRepresentation;
		 StepFEA_Array1OfNodeRepresentation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_Array1OfNodeRepresentation;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepFEA_NodeRepresentation &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_Array1OfNodeRepresentation;
		 StepFEA_Array1OfNodeRepresentation (const Handle_StepFEA_NodeRepresentation & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_NodeRepresentation & V);
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
	:type Other: StepFEA_Array1OfNodeRepresentation &
	:rtype: StepFEA_Array1OfNodeRepresentation
") Assign;
		const StepFEA_Array1OfNodeRepresentation & Assign (const StepFEA_Array1OfNodeRepresentation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_Array1OfNodeRepresentation &
	:rtype: StepFEA_Array1OfNodeRepresentation
") operator =;
		const StepFEA_Array1OfNodeRepresentation & operator = (const StepFEA_Array1OfNodeRepresentation & Other);
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
	:type Value: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_NodeRepresentation & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_NodeRepresentation
") Value;
		Handle_StepFEA_NodeRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_NodeRepresentation
") ChangeValue;
		Handle_StepFEA_NodeRepresentation ChangeValue (const Standard_Integer Index);
};


%extend StepFEA_Array1OfNodeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_Curve3dElementProperty;
class StepFEA_Curve3dElementProperty : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_Curve3dElementProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_Curve3dElementProperty;
		 StepFEA_Curve3dElementProperty ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aPropertyId:
	:type aPropertyId: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aIntervalDefinitions:
	:type aIntervalDefinitions: Handle_StepFEA_HArray1OfCurveElementInterval &
	:param aEndOffsets:
	:type aEndOffsets: Handle_StepFEA_HArray1OfCurveElementEndOffset &
	:param aEndReleases:
	:type aEndReleases: Handle_StepFEA_HArray1OfCurveElementEndRelease &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aPropertyId,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepFEA_HArray1OfCurveElementInterval & aIntervalDefinitions,const Handle_StepFEA_HArray1OfCurveElementEndOffset & aEndOffsets,const Handle_StepFEA_HArray1OfCurveElementEndRelease & aEndReleases);
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
		%feature("compactdefaultargs") IntervalDefinitions;
		%feature("autodoc", "	* Returns field IntervalDefinitions

	:rtype: Handle_StepFEA_HArray1OfCurveElementInterval
") IntervalDefinitions;
		Handle_StepFEA_HArray1OfCurveElementInterval IntervalDefinitions ();
		%feature("compactdefaultargs") SetIntervalDefinitions;
		%feature("autodoc", "	* Set field IntervalDefinitions

	:param IntervalDefinitions:
	:type IntervalDefinitions: Handle_StepFEA_HArray1OfCurveElementInterval &
	:rtype: None
") SetIntervalDefinitions;
		void SetIntervalDefinitions (const Handle_StepFEA_HArray1OfCurveElementInterval & IntervalDefinitions);
		%feature("compactdefaultargs") EndOffsets;
		%feature("autodoc", "	* Returns field EndOffsets

	:rtype: Handle_StepFEA_HArray1OfCurveElementEndOffset
") EndOffsets;
		Handle_StepFEA_HArray1OfCurveElementEndOffset EndOffsets ();
		%feature("compactdefaultargs") SetEndOffsets;
		%feature("autodoc", "	* Set field EndOffsets

	:param EndOffsets:
	:type EndOffsets: Handle_StepFEA_HArray1OfCurveElementEndOffset &
	:rtype: None
") SetEndOffsets;
		void SetEndOffsets (const Handle_StepFEA_HArray1OfCurveElementEndOffset & EndOffsets);
		%feature("compactdefaultargs") EndReleases;
		%feature("autodoc", "	* Returns field EndReleases

	:rtype: Handle_StepFEA_HArray1OfCurveElementEndRelease
") EndReleases;
		Handle_StepFEA_HArray1OfCurveElementEndRelease EndReleases ();
		%feature("compactdefaultargs") SetEndReleases;
		%feature("autodoc", "	* Set field EndReleases

	:param EndReleases:
	:type EndReleases: Handle_StepFEA_HArray1OfCurveElementEndRelease &
	:rtype: None
") SetEndReleases;
		void SetEndReleases (const Handle_StepFEA_HArray1OfCurveElementEndRelease & EndReleases);
};


%extend StepFEA_Curve3dElementProperty {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_Curve3dElementProperty(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_Curve3dElementProperty::Handle_StepFEA_Curve3dElementProperty %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_Curve3dElementProperty;
class Handle_StepFEA_Curve3dElementProperty : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_Curve3dElementProperty();
        Handle_StepFEA_Curve3dElementProperty(const Handle_StepFEA_Curve3dElementProperty &aHandle);
        Handle_StepFEA_Curve3dElementProperty(const StepFEA_Curve3dElementProperty *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_Curve3dElementProperty DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_Curve3dElementProperty {
    StepFEA_Curve3dElementProperty* _get_reference() {
    return (StepFEA_Curve3dElementProperty*)$self->Access();
    }
};

%extend Handle_StepFEA_Curve3dElementProperty {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_Curve3dElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_CurveElementEndCoordinateSystem;
class StepFEA_CurveElementEndCoordinateSystem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepFEA_CurveElementEndCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_CurveElementEndCoordinateSystem;
		 StepFEA_CurveElementEndCoordinateSystem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of CurveElementEndCoordinateSystem select type 1 -> FeaAxis2Placement3d from StepFEA 2 -> AlignedCurve3dElementCoordinateSystem from StepFEA 3 -> ParametricCurve3dElementCoordinateSystem from StepFEA 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") FeaAxis2Placement3d;
		%feature("autodoc", "	* Returns Value as FeaAxis2Placement3d (or Null if another type)

	:rtype: Handle_StepFEA_FeaAxis2Placement3d
") FeaAxis2Placement3d;
		Handle_StepFEA_FeaAxis2Placement3d FeaAxis2Placement3d ();
		%feature("compactdefaultargs") AlignedCurve3dElementCoordinateSystem;
		%feature("autodoc", "	* Returns Value as AlignedCurve3dElementCoordinateSystem (or Null if another type)

	:rtype: Handle_StepFEA_AlignedCurve3dElementCoordinateSystem
") AlignedCurve3dElementCoordinateSystem;
		Handle_StepFEA_AlignedCurve3dElementCoordinateSystem AlignedCurve3dElementCoordinateSystem ();
		%feature("compactdefaultargs") ParametricCurve3dElementCoordinateSystem;
		%feature("autodoc", "	* Returns Value as ParametricCurve3dElementCoordinateSystem (or Null if another type)

	:rtype: Handle_StepFEA_ParametricCurve3dElementCoordinateSystem
") ParametricCurve3dElementCoordinateSystem;
		Handle_StepFEA_ParametricCurve3dElementCoordinateSystem ParametricCurve3dElementCoordinateSystem ();
};


%extend StepFEA_CurveElementEndCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_CurveElementEndOffset;
class StepFEA_CurveElementEndOffset : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_CurveElementEndOffset;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_CurveElementEndOffset;
		 StepFEA_CurveElementEndOffset ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aCoordinateSystem:
	:type aCoordinateSystem: StepFEA_CurveElementEndCoordinateSystem &
	:param aOffsetVector:
	:type aOffsetVector: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Init;
		void Init (const StepFEA_CurveElementEndCoordinateSystem & aCoordinateSystem,const Handle_TColStd_HArray1OfReal & aOffsetVector);
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "	* Returns field CoordinateSystem

	:rtype: StepFEA_CurveElementEndCoordinateSystem
") CoordinateSystem;
		StepFEA_CurveElementEndCoordinateSystem CoordinateSystem ();
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "	* Set field CoordinateSystem

	:param CoordinateSystem:
	:type CoordinateSystem: StepFEA_CurveElementEndCoordinateSystem &
	:rtype: None
") SetCoordinateSystem;
		void SetCoordinateSystem (const StepFEA_CurveElementEndCoordinateSystem & CoordinateSystem);
		%feature("compactdefaultargs") OffsetVector;
		%feature("autodoc", "	* Returns field OffsetVector

	:rtype: Handle_TColStd_HArray1OfReal
") OffsetVector;
		Handle_TColStd_HArray1OfReal OffsetVector ();
		%feature("compactdefaultargs") SetOffsetVector;
		%feature("autodoc", "	* Set field OffsetVector

	:param OffsetVector:
	:type OffsetVector: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetOffsetVector;
		void SetOffsetVector (const Handle_TColStd_HArray1OfReal & OffsetVector);
};


%extend StepFEA_CurveElementEndOffset {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_CurveElementEndOffset(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_CurveElementEndOffset::Handle_StepFEA_CurveElementEndOffset %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_CurveElementEndOffset;
class Handle_StepFEA_CurveElementEndOffset : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_CurveElementEndOffset();
        Handle_StepFEA_CurveElementEndOffset(const Handle_StepFEA_CurveElementEndOffset &aHandle);
        Handle_StepFEA_CurveElementEndOffset(const StepFEA_CurveElementEndOffset *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_CurveElementEndOffset DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_CurveElementEndOffset {
    StepFEA_CurveElementEndOffset* _get_reference() {
    return (StepFEA_CurveElementEndOffset*)$self->Access();
    }
};

%extend Handle_StepFEA_CurveElementEndOffset {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_CurveElementEndOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_CurveElementEndRelease;
class StepFEA_CurveElementEndRelease : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_CurveElementEndRelease;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_CurveElementEndRelease;
		 StepFEA_CurveElementEndRelease ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aCoordinateSystem:
	:type aCoordinateSystem: StepFEA_CurveElementEndCoordinateSystem &
	:param aReleases:
	:type aReleases: Handle_StepElement_HArray1OfCurveElementEndReleasePacket &
	:rtype: None
") Init;
		void Init (const StepFEA_CurveElementEndCoordinateSystem & aCoordinateSystem,const Handle_StepElement_HArray1OfCurveElementEndReleasePacket & aReleases);
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "	* Returns field CoordinateSystem

	:rtype: StepFEA_CurveElementEndCoordinateSystem
") CoordinateSystem;
		StepFEA_CurveElementEndCoordinateSystem CoordinateSystem ();
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "	* Set field CoordinateSystem

	:param CoordinateSystem:
	:type CoordinateSystem: StepFEA_CurveElementEndCoordinateSystem &
	:rtype: None
") SetCoordinateSystem;
		void SetCoordinateSystem (const StepFEA_CurveElementEndCoordinateSystem & CoordinateSystem);
		%feature("compactdefaultargs") Releases;
		%feature("autodoc", "	* Returns field Releases

	:rtype: Handle_StepElement_HArray1OfCurveElementEndReleasePacket
") Releases;
		Handle_StepElement_HArray1OfCurveElementEndReleasePacket Releases ();
		%feature("compactdefaultargs") SetReleases;
		%feature("autodoc", "	* Set field Releases

	:param Releases:
	:type Releases: Handle_StepElement_HArray1OfCurveElementEndReleasePacket &
	:rtype: None
") SetReleases;
		void SetReleases (const Handle_StepElement_HArray1OfCurveElementEndReleasePacket & Releases);
};


%extend StepFEA_CurveElementEndRelease {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_CurveElementEndRelease(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_CurveElementEndRelease::Handle_StepFEA_CurveElementEndRelease %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_CurveElementEndRelease;
class Handle_StepFEA_CurveElementEndRelease : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_CurveElementEndRelease();
        Handle_StepFEA_CurveElementEndRelease(const Handle_StepFEA_CurveElementEndRelease &aHandle);
        Handle_StepFEA_CurveElementEndRelease(const StepFEA_CurveElementEndRelease *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_CurveElementEndRelease DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_CurveElementEndRelease {
    StepFEA_CurveElementEndRelease* _get_reference() {
    return (StepFEA_CurveElementEndRelease*)$self->Access();
    }
};

%extend Handle_StepFEA_CurveElementEndRelease {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_CurveElementEndRelease {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_CurveElementInterval;
class StepFEA_CurveElementInterval : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_CurveElementInterval;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_CurveElementInterval;
		 StepFEA_CurveElementInterval ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aFinishPosition:
	:type aFinishPosition: Handle_StepFEA_CurveElementLocation &
	:param aEuAngles:
	:type aEuAngles: Handle_StepBasic_EulerAngles &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_CurveElementLocation & aFinishPosition,const Handle_StepBasic_EulerAngles & aEuAngles);
		%feature("compactdefaultargs") FinishPosition;
		%feature("autodoc", "	* Returns field FinishPosition

	:rtype: Handle_StepFEA_CurveElementLocation
") FinishPosition;
		Handle_StepFEA_CurveElementLocation FinishPosition ();
		%feature("compactdefaultargs") SetFinishPosition;
		%feature("autodoc", "	* Set field FinishPosition

	:param FinishPosition:
	:type FinishPosition: Handle_StepFEA_CurveElementLocation &
	:rtype: None
") SetFinishPosition;
		void SetFinishPosition (const Handle_StepFEA_CurveElementLocation & FinishPosition);
		%feature("compactdefaultargs") EuAngles;
		%feature("autodoc", "	* Returns field EuAngles

	:rtype: Handle_StepBasic_EulerAngles
") EuAngles;
		Handle_StepBasic_EulerAngles EuAngles ();
		%feature("compactdefaultargs") SetEuAngles;
		%feature("autodoc", "	* Set field EuAngles

	:param EuAngles:
	:type EuAngles: Handle_StepBasic_EulerAngles &
	:rtype: None
") SetEuAngles;
		void SetEuAngles (const Handle_StepBasic_EulerAngles & EuAngles);
};


%extend StepFEA_CurveElementInterval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_CurveElementInterval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_CurveElementInterval::Handle_StepFEA_CurveElementInterval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_CurveElementInterval;
class Handle_StepFEA_CurveElementInterval : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_CurveElementInterval();
        Handle_StepFEA_CurveElementInterval(const Handle_StepFEA_CurveElementInterval &aHandle);
        Handle_StepFEA_CurveElementInterval(const StepFEA_CurveElementInterval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_CurveElementInterval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_CurveElementInterval {
    StepFEA_CurveElementInterval* _get_reference() {
    return (StepFEA_CurveElementInterval*)$self->Access();
    }
};

%extend Handle_StepFEA_CurveElementInterval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_CurveElementInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_CurveElementLocation;
class StepFEA_CurveElementLocation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_CurveElementLocation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_CurveElementLocation;
		 StepFEA_CurveElementLocation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aCoordinate:
	:type aCoordinate: Handle_StepFEA_FeaParametricPoint &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_FeaParametricPoint & aCoordinate);
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "	* Returns field Coordinate

	:rtype: Handle_StepFEA_FeaParametricPoint
") Coordinate;
		Handle_StepFEA_FeaParametricPoint Coordinate ();
		%feature("compactdefaultargs") SetCoordinate;
		%feature("autodoc", "	* Set field Coordinate

	:param Coordinate:
	:type Coordinate: Handle_StepFEA_FeaParametricPoint &
	:rtype: None
") SetCoordinate;
		void SetCoordinate (const Handle_StepFEA_FeaParametricPoint & Coordinate);
};


%extend StepFEA_CurveElementLocation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_CurveElementLocation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_CurveElementLocation::Handle_StepFEA_CurveElementLocation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_CurveElementLocation;
class Handle_StepFEA_CurveElementLocation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_CurveElementLocation();
        Handle_StepFEA_CurveElementLocation(const Handle_StepFEA_CurveElementLocation &aHandle);
        Handle_StepFEA_CurveElementLocation(const StepFEA_CurveElementLocation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_CurveElementLocation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_CurveElementLocation {
    StepFEA_CurveElementLocation* _get_reference() {
    return (StepFEA_CurveElementLocation*)$self->Access();
    }
};

%extend Handle_StepFEA_CurveElementLocation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_CurveElementLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_DegreeOfFreedom;
class StepFEA_DegreeOfFreedom : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepFEA_DegreeOfFreedom;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_DegreeOfFreedom;
		 StepFEA_DegreeOfFreedom ();
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
		%feature("compactdefaultargs") SetEnumeratedDegreeOfFreedom;
		%feature("autodoc", "	* Returns Value as EnumeratedDegreeOfFreedom (or Null if another type)

	:param aVal:
	:type aVal: StepFEA_EnumeratedDegreeOfFreedom
	:rtype: None
") SetEnumeratedDegreeOfFreedom;
		void SetEnumeratedDegreeOfFreedom (const StepFEA_EnumeratedDegreeOfFreedom aVal);
		%feature("compactdefaultargs") EnumeratedDegreeOfFreedom;
		%feature("autodoc", "	* Returns Value as EnumeratedDegreeOfFreedom (or Null if another type)

	:rtype: StepFEA_EnumeratedDegreeOfFreedom
") EnumeratedDegreeOfFreedom;
		StepFEA_EnumeratedDegreeOfFreedom EnumeratedDegreeOfFreedom ();
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


%extend StepFEA_DegreeOfFreedom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_DegreeOfFreedomMember;
class StepFEA_DegreeOfFreedomMember : public StepData_SelectNamed {
	public:
		%feature("compactdefaultargs") StepFEA_DegreeOfFreedomMember;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_DegreeOfFreedomMember;
		 StepFEA_DegreeOfFreedomMember ();
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


%extend StepFEA_DegreeOfFreedomMember {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_DegreeOfFreedomMember(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_DegreeOfFreedomMember::Handle_StepFEA_DegreeOfFreedomMember %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_DegreeOfFreedomMember;
class Handle_StepFEA_DegreeOfFreedomMember : public Handle_StepData_SelectNamed {

    public:
        // constructors
        Handle_StepFEA_DegreeOfFreedomMember();
        Handle_StepFEA_DegreeOfFreedomMember(const Handle_StepFEA_DegreeOfFreedomMember &aHandle);
        Handle_StepFEA_DegreeOfFreedomMember(const StepFEA_DegreeOfFreedomMember *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_DegreeOfFreedomMember DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_DegreeOfFreedomMember {
    StepFEA_DegreeOfFreedomMember* _get_reference() {
    return (StepFEA_DegreeOfFreedomMember*)$self->Access();
    }
};

%extend Handle_StepFEA_DegreeOfFreedomMember {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_DegreeOfFreedomMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_ElementGeometricRelationship;
class StepFEA_ElementGeometricRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_ElementGeometricRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_ElementGeometricRelationship;
		 StepFEA_ElementGeometricRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aElementRef:
	:type aElementRef: StepFEA_ElementOrElementGroup &
	:param aItem:
	:type aItem: Handle_StepElement_AnalysisItemWithinRepresentation &
	:param aAspect:
	:type aAspect: StepElement_ElementAspect &
	:rtype: None
") Init;
		void Init (const StepFEA_ElementOrElementGroup & aElementRef,const Handle_StepElement_AnalysisItemWithinRepresentation & aItem,const StepElement_ElementAspect & aAspect);
		%feature("compactdefaultargs") ElementRef;
		%feature("autodoc", "	* Returns field ElementRef

	:rtype: StepFEA_ElementOrElementGroup
") ElementRef;
		StepFEA_ElementOrElementGroup ElementRef ();
		%feature("compactdefaultargs") SetElementRef;
		%feature("autodoc", "	* Set field ElementRef

	:param ElementRef:
	:type ElementRef: StepFEA_ElementOrElementGroup &
	:rtype: None
") SetElementRef;
		void SetElementRef (const StepFEA_ElementOrElementGroup & ElementRef);
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	* Returns field Item

	:rtype: Handle_StepElement_AnalysisItemWithinRepresentation
") Item;
		Handle_StepElement_AnalysisItemWithinRepresentation Item ();
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	* Set field Item

	:param Item:
	:type Item: Handle_StepElement_AnalysisItemWithinRepresentation &
	:rtype: None
") SetItem;
		void SetItem (const Handle_StepElement_AnalysisItemWithinRepresentation & Item);
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "	* Returns field Aspect

	:rtype: StepElement_ElementAspect
") Aspect;
		StepElement_ElementAspect Aspect ();
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "	* Set field Aspect

	:param Aspect:
	:type Aspect: StepElement_ElementAspect &
	:rtype: None
") SetAspect;
		void SetAspect (const StepElement_ElementAspect & Aspect);
};


%extend StepFEA_ElementGeometricRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_ElementGeometricRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_ElementGeometricRelationship::Handle_StepFEA_ElementGeometricRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_ElementGeometricRelationship;
class Handle_StepFEA_ElementGeometricRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_ElementGeometricRelationship();
        Handle_StepFEA_ElementGeometricRelationship(const Handle_StepFEA_ElementGeometricRelationship &aHandle);
        Handle_StepFEA_ElementGeometricRelationship(const StepFEA_ElementGeometricRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_ElementGeometricRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_ElementGeometricRelationship {
    StepFEA_ElementGeometricRelationship* _get_reference() {
    return (StepFEA_ElementGeometricRelationship*)$self->Access();
    }
};

%extend Handle_StepFEA_ElementGeometricRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_ElementGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_ElementOrElementGroup;
class StepFEA_ElementOrElementGroup : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepFEA_ElementOrElementGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_ElementOrElementGroup;
		 StepFEA_ElementOrElementGroup ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ElementOrElementGroup select type 1 -> ElementRepresentation from StepFEA 2 -> ElementGroup from StepFEA 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ElementRepresentation;
		%feature("autodoc", "	* Returns Value as ElementRepresentation (or Null if another type)

	:rtype: Handle_StepFEA_ElementRepresentation
") ElementRepresentation;
		Handle_StepFEA_ElementRepresentation ElementRepresentation ();
		%feature("compactdefaultargs") ElementGroup;
		%feature("autodoc", "	* Returns Value as ElementGroup (or Null if another type)

	:rtype: Handle_StepFEA_ElementGroup
") ElementGroup;
		Handle_StepFEA_ElementGroup ElementGroup ();
};


%extend StepFEA_ElementOrElementGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_ElementRepresentation;
class StepFEA_ElementRepresentation : public StepRepr_Representation {
	public:
		%feature("compactdefaultargs") StepFEA_ElementRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_ElementRepresentation;
		 StepFEA_ElementRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentation_Name:
	:type aRepresentation_Name: Handle_TCollection_HAsciiString &
	:param aRepresentation_Items:
	:type aRepresentation_Items: Handle_StepRepr_HArray1OfRepresentationItem &
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: Handle_StepRepr_RepresentationContext &
	:param aNodeList:
	:type aNodeList: Handle_StepFEA_HArray1OfNodeRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentation_Name,const Handle_StepRepr_HArray1OfRepresentationItem & aRepresentation_Items,const Handle_StepRepr_RepresentationContext & aRepresentation_ContextOfItems,const Handle_StepFEA_HArray1OfNodeRepresentation & aNodeList);
		%feature("compactdefaultargs") NodeList;
		%feature("autodoc", "	* Returns field NodeList

	:rtype: Handle_StepFEA_HArray1OfNodeRepresentation
") NodeList;
		Handle_StepFEA_HArray1OfNodeRepresentation NodeList ();
		%feature("compactdefaultargs") SetNodeList;
		%feature("autodoc", "	* Set field NodeList

	:param NodeList:
	:type NodeList: Handle_StepFEA_HArray1OfNodeRepresentation &
	:rtype: None
") SetNodeList;
		void SetNodeList (const Handle_StepFEA_HArray1OfNodeRepresentation & NodeList);
};


%extend StepFEA_ElementRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_ElementRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_ElementRepresentation::Handle_StepFEA_ElementRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_ElementRepresentation;
class Handle_StepFEA_ElementRepresentation : public Handle_StepRepr_Representation {

    public:
        // constructors
        Handle_StepFEA_ElementRepresentation();
        Handle_StepFEA_ElementRepresentation(const Handle_StepFEA_ElementRepresentation &aHandle);
        Handle_StepFEA_ElementRepresentation(const StepFEA_ElementRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_ElementRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_ElementRepresentation {
    StepFEA_ElementRepresentation* _get_reference() {
    return (StepFEA_ElementRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_ElementRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_ElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaAxis2Placement3d;
class StepFEA_FeaAxis2Placement3d : public StepGeom_Axis2Placement3d {
	public:
		%feature("compactdefaultargs") StepFEA_FeaAxis2Placement3d;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaAxis2Placement3d;
		 StepFEA_FeaAxis2Placement3d ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aPlacement_Location:
	:type aPlacement_Location: Handle_StepGeom_CartesianPoint &
	:param hasAxis2Placement3d_Axis:
	:type hasAxis2Placement3d_Axis: bool
	:param aAxis2Placement3d_Axis:
	:type aAxis2Placement3d_Axis: Handle_StepGeom_Direction &
	:param hasAxis2Placement3d_RefDirection:
	:type hasAxis2Placement3d_RefDirection: bool
	:param aAxis2Placement3d_RefDirection:
	:type aAxis2Placement3d_RefDirection: Handle_StepGeom_Direction &
	:param aSystemType:
	:type aSystemType: StepFEA_CoordinateSystemType
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepGeom_CartesianPoint & aPlacement_Location,const Standard_Boolean hasAxis2Placement3d_Axis,const Handle_StepGeom_Direction & aAxis2Placement3d_Axis,const Standard_Boolean hasAxis2Placement3d_RefDirection,const Handle_StepGeom_Direction & aAxis2Placement3d_RefDirection,const StepFEA_CoordinateSystemType aSystemType,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") SystemType;
		%feature("autodoc", "	* Returns field SystemType

	:rtype: StepFEA_CoordinateSystemType
") SystemType;
		StepFEA_CoordinateSystemType SystemType ();
		%feature("compactdefaultargs") SetSystemType;
		%feature("autodoc", "	* Set field SystemType

	:param SystemType:
	:type SystemType: StepFEA_CoordinateSystemType
	:rtype: None
") SetSystemType;
		void SetSystemType (const StepFEA_CoordinateSystemType SystemType);
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


%extend StepFEA_FeaAxis2Placement3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaAxis2Placement3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaAxis2Placement3d::Handle_StepFEA_FeaAxis2Placement3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaAxis2Placement3d;
class Handle_StepFEA_FeaAxis2Placement3d : public Handle_StepGeom_Axis2Placement3d {

    public:
        // constructors
        Handle_StepFEA_FeaAxis2Placement3d();
        Handle_StepFEA_FeaAxis2Placement3d(const Handle_StepFEA_FeaAxis2Placement3d &aHandle);
        Handle_StepFEA_FeaAxis2Placement3d(const StepFEA_FeaAxis2Placement3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaAxis2Placement3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaAxis2Placement3d {
    StepFEA_FeaAxis2Placement3d* _get_reference() {
    return (StepFEA_FeaAxis2Placement3d*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaAxis2Placement3d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaAxis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaCurveSectionGeometricRelationship;
class StepFEA_FeaCurveSectionGeometricRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_FeaCurveSectionGeometricRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaCurveSectionGeometricRelationship;
		 StepFEA_FeaCurveSectionGeometricRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aSectionRef:
	:type aSectionRef: Handle_StepElement_CurveElementSectionDefinition &
	:param aItem:
	:type aItem: Handle_StepElement_AnalysisItemWithinRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_CurveElementSectionDefinition & aSectionRef,const Handle_StepElement_AnalysisItemWithinRepresentation & aItem);
		%feature("compactdefaultargs") SectionRef;
		%feature("autodoc", "	* Returns field SectionRef

	:rtype: Handle_StepElement_CurveElementSectionDefinition
") SectionRef;
		Handle_StepElement_CurveElementSectionDefinition SectionRef ();
		%feature("compactdefaultargs") SetSectionRef;
		%feature("autodoc", "	* Set field SectionRef

	:param SectionRef:
	:type SectionRef: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") SetSectionRef;
		void SetSectionRef (const Handle_StepElement_CurveElementSectionDefinition & SectionRef);
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	* Returns field Item

	:rtype: Handle_StepElement_AnalysisItemWithinRepresentation
") Item;
		Handle_StepElement_AnalysisItemWithinRepresentation Item ();
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	* Set field Item

	:param Item:
	:type Item: Handle_StepElement_AnalysisItemWithinRepresentation &
	:rtype: None
") SetItem;
		void SetItem (const Handle_StepElement_AnalysisItemWithinRepresentation & Item);
};


%extend StepFEA_FeaCurveSectionGeometricRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaCurveSectionGeometricRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaCurveSectionGeometricRelationship::Handle_StepFEA_FeaCurveSectionGeometricRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaCurveSectionGeometricRelationship;
class Handle_StepFEA_FeaCurveSectionGeometricRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_FeaCurveSectionGeometricRelationship();
        Handle_StepFEA_FeaCurveSectionGeometricRelationship(const Handle_StepFEA_FeaCurveSectionGeometricRelationship &aHandle);
        Handle_StepFEA_FeaCurveSectionGeometricRelationship(const StepFEA_FeaCurveSectionGeometricRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaCurveSectionGeometricRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaCurveSectionGeometricRelationship {
    StepFEA_FeaCurveSectionGeometricRelationship* _get_reference() {
    return (StepFEA_FeaCurveSectionGeometricRelationship*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaCurveSectionGeometricRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaCurveSectionGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaGroup;
class StepFEA_FeaGroup : public StepBasic_Group {
	public:
		%feature("compactdefaultargs") StepFEA_FeaGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaGroup;
		 StepFEA_FeaGroup ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aGroup_Name:
	:type aGroup_Name: Handle_TCollection_HAsciiString &
	:param aGroup_Description:
	:type aGroup_Description: Handle_TCollection_HAsciiString &
	:param aModelRef:
	:type aModelRef: Handle_StepFEA_FeaModel &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aGroup_Name,const Handle_TCollection_HAsciiString & aGroup_Description,const Handle_StepFEA_FeaModel & aModelRef);
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "	* Returns field ModelRef

	:rtype: Handle_StepFEA_FeaModel
") ModelRef;
		Handle_StepFEA_FeaModel ModelRef ();
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "	* Set field ModelRef

	:param ModelRef:
	:type ModelRef: Handle_StepFEA_FeaModel &
	:rtype: None
") SetModelRef;
		void SetModelRef (const Handle_StepFEA_FeaModel & ModelRef);
};


%extend StepFEA_FeaGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaGroup::Handle_StepFEA_FeaGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaGroup;
class Handle_StepFEA_FeaGroup : public Handle_StepBasic_Group {

    public:
        // constructors
        Handle_StepFEA_FeaGroup();
        Handle_StepFEA_FeaGroup(const Handle_StepFEA_FeaGroup &aHandle);
        Handle_StepFEA_FeaGroup(const StepFEA_FeaGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaGroup {
    StepFEA_FeaGroup* _get_reference() {
    return (StepFEA_FeaGroup*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaGroup {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaMaterialPropertyRepresentation;
class StepFEA_FeaMaterialPropertyRepresentation : public StepRepr_MaterialPropertyRepresentation {
	public:
		%feature("compactdefaultargs") StepFEA_FeaMaterialPropertyRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaMaterialPropertyRepresentation;
		 StepFEA_FeaMaterialPropertyRepresentation ();
};


%extend StepFEA_FeaMaterialPropertyRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaMaterialPropertyRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaMaterialPropertyRepresentation::Handle_StepFEA_FeaMaterialPropertyRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaMaterialPropertyRepresentation;
class Handle_StepFEA_FeaMaterialPropertyRepresentation : public Handle_StepRepr_MaterialPropertyRepresentation {

    public:
        // constructors
        Handle_StepFEA_FeaMaterialPropertyRepresentation();
        Handle_StepFEA_FeaMaterialPropertyRepresentation(const Handle_StepFEA_FeaMaterialPropertyRepresentation &aHandle);
        Handle_StepFEA_FeaMaterialPropertyRepresentation(const StepFEA_FeaMaterialPropertyRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaMaterialPropertyRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaMaterialPropertyRepresentation {
    StepFEA_FeaMaterialPropertyRepresentation* _get_reference() {
    return (StepFEA_FeaMaterialPropertyRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaMaterialPropertyRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaMaterialPropertyRepresentationItem;
class StepFEA_FeaMaterialPropertyRepresentationItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaMaterialPropertyRepresentationItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaMaterialPropertyRepresentationItem;
		 StepFEA_FeaMaterialPropertyRepresentationItem ();
};


%extend StepFEA_FeaMaterialPropertyRepresentationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaMaterialPropertyRepresentationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaMaterialPropertyRepresentationItem::Handle_StepFEA_FeaMaterialPropertyRepresentationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaMaterialPropertyRepresentationItem;
class Handle_StepFEA_FeaMaterialPropertyRepresentationItem : public Handle_StepRepr_RepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaMaterialPropertyRepresentationItem();
        Handle_StepFEA_FeaMaterialPropertyRepresentationItem(const Handle_StepFEA_FeaMaterialPropertyRepresentationItem &aHandle);
        Handle_StepFEA_FeaMaterialPropertyRepresentationItem(const StepFEA_FeaMaterialPropertyRepresentationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaMaterialPropertyRepresentationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaMaterialPropertyRepresentationItem {
    StepFEA_FeaMaterialPropertyRepresentationItem* _get_reference() {
    return (StepFEA_FeaMaterialPropertyRepresentationItem*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaMaterialPropertyRepresentationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaMaterialPropertyRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaModel;
class StepFEA_FeaModel : public StepRepr_Representation {
	public:
		%feature("compactdefaultargs") StepFEA_FeaModel;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaModel;
		 StepFEA_FeaModel ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentation_Name:
	:type aRepresentation_Name: Handle_TCollection_HAsciiString &
	:param aRepresentation_Items:
	:type aRepresentation_Items: Handle_StepRepr_HArray1OfRepresentationItem &
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: Handle_StepRepr_RepresentationContext &
	:param aCreatingSoftware:
	:type aCreatingSoftware: Handle_TCollection_HAsciiString &
	:param aIntendedAnalysisCode:
	:type aIntendedAnalysisCode: Handle_TColStd_HArray1OfAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aAnalysisType:
	:type aAnalysisType: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentation_Name,const Handle_StepRepr_HArray1OfRepresentationItem & aRepresentation_Items,const Handle_StepRepr_RepresentationContext & aRepresentation_ContextOfItems,const Handle_TCollection_HAsciiString & aCreatingSoftware,const Handle_TColStd_HArray1OfAsciiString & aIntendedAnalysisCode,const Handle_TCollection_HAsciiString & aDescription,const Handle_TCollection_HAsciiString & aAnalysisType);
		%feature("compactdefaultargs") CreatingSoftware;
		%feature("autodoc", "	* Returns field CreatingSoftware

	:rtype: Handle_TCollection_HAsciiString
") CreatingSoftware;
		Handle_TCollection_HAsciiString CreatingSoftware ();
		%feature("compactdefaultargs") SetCreatingSoftware;
		%feature("autodoc", "	* Set field CreatingSoftware

	:param CreatingSoftware:
	:type CreatingSoftware: Handle_TCollection_HAsciiString &
	:rtype: None
") SetCreatingSoftware;
		void SetCreatingSoftware (const Handle_TCollection_HAsciiString & CreatingSoftware);
		%feature("compactdefaultargs") IntendedAnalysisCode;
		%feature("autodoc", "	* Returns field IntendedAnalysisCode

	:rtype: Handle_TColStd_HArray1OfAsciiString
") IntendedAnalysisCode;
		Handle_TColStd_HArray1OfAsciiString IntendedAnalysisCode ();
		%feature("compactdefaultargs") SetIntendedAnalysisCode;
		%feature("autodoc", "	* Set field IntendedAnalysisCode

	:param IntendedAnalysisCode:
	:type IntendedAnalysisCode: Handle_TColStd_HArray1OfAsciiString &
	:rtype: None
") SetIntendedAnalysisCode;
		void SetIntendedAnalysisCode (const Handle_TColStd_HArray1OfAsciiString & IntendedAnalysisCode);
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
		%feature("compactdefaultargs") AnalysisType;
		%feature("autodoc", "	* Returns field AnalysisType

	:rtype: Handle_TCollection_HAsciiString
") AnalysisType;
		Handle_TCollection_HAsciiString AnalysisType ();
		%feature("compactdefaultargs") SetAnalysisType;
		%feature("autodoc", "	* Set field AnalysisType

	:param AnalysisType:
	:type AnalysisType: Handle_TCollection_HAsciiString &
	:rtype: None
") SetAnalysisType;
		void SetAnalysisType (const Handle_TCollection_HAsciiString & AnalysisType);
};


%extend StepFEA_FeaModel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaModel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaModel::Handle_StepFEA_FeaModel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaModel;
class Handle_StepFEA_FeaModel : public Handle_StepRepr_Representation {

    public:
        // constructors
        Handle_StepFEA_FeaModel();
        Handle_StepFEA_FeaModel(const Handle_StepFEA_FeaModel &aHandle);
        Handle_StepFEA_FeaModel(const StepFEA_FeaModel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaModel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaModel {
    StepFEA_FeaModel* _get_reference() {
    return (StepFEA_FeaModel*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaModel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaModelDefinition;
class StepFEA_FeaModelDefinition : public StepRepr_ShapeAspect {
	public:
		%feature("compactdefaultargs") StepFEA_FeaModelDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaModelDefinition;
		 StepFEA_FeaModelDefinition ();
};


%extend StepFEA_FeaModelDefinition {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaModelDefinition(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaModelDefinition::Handle_StepFEA_FeaModelDefinition %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaModelDefinition;
class Handle_StepFEA_FeaModelDefinition : public Handle_StepRepr_ShapeAspect {

    public:
        // constructors
        Handle_StepFEA_FeaModelDefinition();
        Handle_StepFEA_FeaModelDefinition(const Handle_StepFEA_FeaModelDefinition &aHandle);
        Handle_StepFEA_FeaModelDefinition(const StepFEA_FeaModelDefinition *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaModelDefinition DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaModelDefinition {
    StepFEA_FeaModelDefinition* _get_reference() {
    return (StepFEA_FeaModelDefinition*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaModelDefinition {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaModelDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaParametricPoint;
class StepFEA_FeaParametricPoint : public StepGeom_Point {
	public:
		%feature("compactdefaultargs") StepFEA_FeaParametricPoint;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaParametricPoint;
		 StepFEA_FeaParametricPoint ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aCoordinates:
	:type aCoordinates: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_TColStd_HArray1OfReal & aCoordinates);
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "	* Returns field Coordinates

	:rtype: Handle_TColStd_HArray1OfReal
") Coordinates;
		Handle_TColStd_HArray1OfReal Coordinates ();
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "	* Set field Coordinates

	:param Coordinates:
	:type Coordinates: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetCoordinates;
		void SetCoordinates (const Handle_TColStd_HArray1OfReal & Coordinates);
};


%extend StepFEA_FeaParametricPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaParametricPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaParametricPoint::Handle_StepFEA_FeaParametricPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaParametricPoint;
class Handle_StepFEA_FeaParametricPoint : public Handle_StepGeom_Point {

    public:
        // constructors
        Handle_StepFEA_FeaParametricPoint();
        Handle_StepFEA_FeaParametricPoint(const Handle_StepFEA_FeaParametricPoint &aHandle);
        Handle_StepFEA_FeaParametricPoint(const StepFEA_FeaParametricPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaParametricPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaParametricPoint {
    StepFEA_FeaParametricPoint* _get_reference() {
    return (StepFEA_FeaParametricPoint*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaParametricPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaParametricPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaRepresentationItem;
class StepFEA_FeaRepresentationItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaRepresentationItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaRepresentationItem;
		 StepFEA_FeaRepresentationItem ();
};


%extend StepFEA_FeaRepresentationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaRepresentationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaRepresentationItem::Handle_StepFEA_FeaRepresentationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaRepresentationItem;
class Handle_StepFEA_FeaRepresentationItem : public Handle_StepRepr_RepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaRepresentationItem();
        Handle_StepFEA_FeaRepresentationItem(const Handle_StepFEA_FeaRepresentationItem &aHandle);
        Handle_StepFEA_FeaRepresentationItem(const StepFEA_FeaRepresentationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaRepresentationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaRepresentationItem {
    StepFEA_FeaRepresentationItem* _get_reference() {
    return (StepFEA_FeaRepresentationItem*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaRepresentationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaSurfaceSectionGeometricRelationship;
class StepFEA_FeaSurfaceSectionGeometricRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_FeaSurfaceSectionGeometricRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaSurfaceSectionGeometricRelationship;
		 StepFEA_FeaSurfaceSectionGeometricRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aSectionRef:
	:type aSectionRef: Handle_StepElement_SurfaceSection &
	:param aItem:
	:type aItem: Handle_StepElement_AnalysisItemWithinRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepElement_SurfaceSection & aSectionRef,const Handle_StepElement_AnalysisItemWithinRepresentation & aItem);
		%feature("compactdefaultargs") SectionRef;
		%feature("autodoc", "	* Returns field SectionRef

	:rtype: Handle_StepElement_SurfaceSection
") SectionRef;
		Handle_StepElement_SurfaceSection SectionRef ();
		%feature("compactdefaultargs") SetSectionRef;
		%feature("autodoc", "	* Set field SectionRef

	:param SectionRef:
	:type SectionRef: Handle_StepElement_SurfaceSection &
	:rtype: None
") SetSectionRef;
		void SetSectionRef (const Handle_StepElement_SurfaceSection & SectionRef);
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	* Returns field Item

	:rtype: Handle_StepElement_AnalysisItemWithinRepresentation
") Item;
		Handle_StepElement_AnalysisItemWithinRepresentation Item ();
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	* Set field Item

	:param Item:
	:type Item: Handle_StepElement_AnalysisItemWithinRepresentation &
	:rtype: None
") SetItem;
		void SetItem (const Handle_StepElement_AnalysisItemWithinRepresentation & Item);
};


%extend StepFEA_FeaSurfaceSectionGeometricRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaSurfaceSectionGeometricRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaSurfaceSectionGeometricRelationship::Handle_StepFEA_FeaSurfaceSectionGeometricRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaSurfaceSectionGeometricRelationship;
class Handle_StepFEA_FeaSurfaceSectionGeometricRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_FeaSurfaceSectionGeometricRelationship();
        Handle_StepFEA_FeaSurfaceSectionGeometricRelationship(const Handle_StepFEA_FeaSurfaceSectionGeometricRelationship &aHandle);
        Handle_StepFEA_FeaSurfaceSectionGeometricRelationship(const StepFEA_FeaSurfaceSectionGeometricRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaSurfaceSectionGeometricRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaSurfaceSectionGeometricRelationship {
    StepFEA_FeaSurfaceSectionGeometricRelationship* _get_reference() {
    return (StepFEA_FeaSurfaceSectionGeometricRelationship*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaSurfaceSectionGeometricRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaSurfaceSectionGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FreedomAndCoefficient;
class StepFEA_FreedomAndCoefficient : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_FreedomAndCoefficient;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FreedomAndCoefficient;
		 StepFEA_FreedomAndCoefficient ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aFreedom:
	:type aFreedom: StepFEA_DegreeOfFreedom &
	:param aA:
	:type aA: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") Init;
		void Init (const StepFEA_DegreeOfFreedom & aFreedom,const StepElement_MeasureOrUnspecifiedValue & aA);
		%feature("compactdefaultargs") Freedom;
		%feature("autodoc", "	* Returns field Freedom

	:rtype: StepFEA_DegreeOfFreedom
") Freedom;
		StepFEA_DegreeOfFreedom Freedom ();
		%feature("compactdefaultargs") SetFreedom;
		%feature("autodoc", "	* Set field Freedom

	:param Freedom:
	:type Freedom: StepFEA_DegreeOfFreedom &
	:rtype: None
") SetFreedom;
		void SetFreedom (const StepFEA_DegreeOfFreedom & Freedom);
		%feature("compactdefaultargs") A;
		%feature("autodoc", "	* Returns field A

	:rtype: StepElement_MeasureOrUnspecifiedValue
") A;
		StepElement_MeasureOrUnspecifiedValue A ();
		%feature("compactdefaultargs") SetA;
		%feature("autodoc", "	* Set field A

	:param A:
	:type A: StepElement_MeasureOrUnspecifiedValue &
	:rtype: None
") SetA;
		void SetA (const StepElement_MeasureOrUnspecifiedValue & A);
};


%extend StepFEA_FreedomAndCoefficient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FreedomAndCoefficient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FreedomAndCoefficient::Handle_StepFEA_FreedomAndCoefficient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FreedomAndCoefficient;
class Handle_StepFEA_FreedomAndCoefficient : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_FreedomAndCoefficient();
        Handle_StepFEA_FreedomAndCoefficient(const Handle_StepFEA_FreedomAndCoefficient &aHandle);
        Handle_StepFEA_FreedomAndCoefficient(const StepFEA_FreedomAndCoefficient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FreedomAndCoefficient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FreedomAndCoefficient {
    StepFEA_FreedomAndCoefficient* _get_reference() {
    return (StepFEA_FreedomAndCoefficient*)$self->Access();
    }
};

%extend Handle_StepFEA_FreedomAndCoefficient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FreedomAndCoefficient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FreedomsList;
class StepFEA_FreedomsList : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_FreedomsList;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FreedomsList;
		 StepFEA_FreedomsList ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aFreedoms:
	:type aFreedoms: Handle_StepFEA_HArray1OfDegreeOfFreedom &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_HArray1OfDegreeOfFreedom & aFreedoms);
		%feature("compactdefaultargs") Freedoms;
		%feature("autodoc", "	* Returns field Freedoms

	:rtype: Handle_StepFEA_HArray1OfDegreeOfFreedom
") Freedoms;
		Handle_StepFEA_HArray1OfDegreeOfFreedom Freedoms ();
		%feature("compactdefaultargs") SetFreedoms;
		%feature("autodoc", "	* Set field Freedoms

	:param Freedoms:
	:type Freedoms: Handle_StepFEA_HArray1OfDegreeOfFreedom &
	:rtype: None
") SetFreedoms;
		void SetFreedoms (const Handle_StepFEA_HArray1OfDegreeOfFreedom & Freedoms);
};


%extend StepFEA_FreedomsList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FreedomsList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FreedomsList::Handle_StepFEA_FreedomsList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FreedomsList;
class Handle_StepFEA_FreedomsList : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_FreedomsList();
        Handle_StepFEA_FreedomsList(const Handle_StepFEA_FreedomsList &aHandle);
        Handle_StepFEA_FreedomsList(const StepFEA_FreedomsList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FreedomsList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FreedomsList {
    StepFEA_FreedomsList* _get_reference() {
    return (StepFEA_FreedomsList*)$self->Access();
    }
};

%extend Handle_StepFEA_FreedomsList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FreedomsList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_HArray1OfCurveElementEndOffset;
class StepFEA_HArray1OfCurveElementEndOffset : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_HArray1OfCurveElementEndOffset;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_HArray1OfCurveElementEndOffset;
		 StepFEA_HArray1OfCurveElementEndOffset (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_HArray1OfCurveElementEndOffset;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepFEA_CurveElementEndOffset &
	:rtype: None
") StepFEA_HArray1OfCurveElementEndOffset;
		 StepFEA_HArray1OfCurveElementEndOffset (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepFEA_CurveElementEndOffset & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepFEA_CurveElementEndOffset &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_CurveElementEndOffset & V);
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
	:type Value: Handle_StepFEA_CurveElementEndOffset &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_CurveElementEndOffset & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementEndOffset
") Value;
		Handle_StepFEA_CurveElementEndOffset Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementEndOffset
") ChangeValue;
		Handle_StepFEA_CurveElementEndOffset ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfCurveElementEndOffset
") Array1;
		const StepFEA_Array1OfCurveElementEndOffset & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfCurveElementEndOffset
") ChangeArray1;
		StepFEA_Array1OfCurveElementEndOffset & ChangeArray1 ();
};


%extend StepFEA_HArray1OfCurveElementEndOffset {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_HArray1OfCurveElementEndOffset(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_HArray1OfCurveElementEndOffset::Handle_StepFEA_HArray1OfCurveElementEndOffset %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_HArray1OfCurveElementEndOffset;
class Handle_StepFEA_HArray1OfCurveElementEndOffset : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_HArray1OfCurveElementEndOffset();
        Handle_StepFEA_HArray1OfCurveElementEndOffset(const Handle_StepFEA_HArray1OfCurveElementEndOffset &aHandle);
        Handle_StepFEA_HArray1OfCurveElementEndOffset(const StepFEA_HArray1OfCurveElementEndOffset *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_HArray1OfCurveElementEndOffset DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_HArray1OfCurveElementEndOffset {
    StepFEA_HArray1OfCurveElementEndOffset* _get_reference() {
    return (StepFEA_HArray1OfCurveElementEndOffset*)$self->Access();
    }
};

%extend Handle_StepFEA_HArray1OfCurveElementEndOffset {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_HArray1OfCurveElementEndOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_HArray1OfCurveElementEndRelease;
class StepFEA_HArray1OfCurveElementEndRelease : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_HArray1OfCurveElementEndRelease;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_HArray1OfCurveElementEndRelease;
		 StepFEA_HArray1OfCurveElementEndRelease (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_HArray1OfCurveElementEndRelease;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepFEA_CurveElementEndRelease &
	:rtype: None
") StepFEA_HArray1OfCurveElementEndRelease;
		 StepFEA_HArray1OfCurveElementEndRelease (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepFEA_CurveElementEndRelease & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepFEA_CurveElementEndRelease &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_CurveElementEndRelease & V);
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
	:type Value: Handle_StepFEA_CurveElementEndRelease &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_CurveElementEndRelease & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementEndRelease
") Value;
		Handle_StepFEA_CurveElementEndRelease Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementEndRelease
") ChangeValue;
		Handle_StepFEA_CurveElementEndRelease ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfCurveElementEndRelease
") Array1;
		const StepFEA_Array1OfCurveElementEndRelease & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfCurveElementEndRelease
") ChangeArray1;
		StepFEA_Array1OfCurveElementEndRelease & ChangeArray1 ();
};


%extend StepFEA_HArray1OfCurveElementEndRelease {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_HArray1OfCurveElementEndRelease(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_HArray1OfCurveElementEndRelease::Handle_StepFEA_HArray1OfCurveElementEndRelease %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_HArray1OfCurveElementEndRelease;
class Handle_StepFEA_HArray1OfCurveElementEndRelease : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_HArray1OfCurveElementEndRelease();
        Handle_StepFEA_HArray1OfCurveElementEndRelease(const Handle_StepFEA_HArray1OfCurveElementEndRelease &aHandle);
        Handle_StepFEA_HArray1OfCurveElementEndRelease(const StepFEA_HArray1OfCurveElementEndRelease *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_HArray1OfCurveElementEndRelease DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_HArray1OfCurveElementEndRelease {
    StepFEA_HArray1OfCurveElementEndRelease* _get_reference() {
    return (StepFEA_HArray1OfCurveElementEndRelease*)$self->Access();
    }
};

%extend Handle_StepFEA_HArray1OfCurveElementEndRelease {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_HArray1OfCurveElementEndRelease {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_HArray1OfCurveElementInterval;
class StepFEA_HArray1OfCurveElementInterval : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_HArray1OfCurveElementInterval;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_HArray1OfCurveElementInterval;
		 StepFEA_HArray1OfCurveElementInterval (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_HArray1OfCurveElementInterval;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepFEA_CurveElementInterval &
	:rtype: None
") StepFEA_HArray1OfCurveElementInterval;
		 StepFEA_HArray1OfCurveElementInterval (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepFEA_CurveElementInterval & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepFEA_CurveElementInterval &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_CurveElementInterval & V);
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
	:type Value: Handle_StepFEA_CurveElementInterval &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_CurveElementInterval & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementInterval
") Value;
		Handle_StepFEA_CurveElementInterval Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_CurveElementInterval
") ChangeValue;
		Handle_StepFEA_CurveElementInterval ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfCurveElementInterval
") Array1;
		const StepFEA_Array1OfCurveElementInterval & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfCurveElementInterval
") ChangeArray1;
		StepFEA_Array1OfCurveElementInterval & ChangeArray1 ();
};


%extend StepFEA_HArray1OfCurveElementInterval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_HArray1OfCurveElementInterval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_HArray1OfCurveElementInterval::Handle_StepFEA_HArray1OfCurveElementInterval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_HArray1OfCurveElementInterval;
class Handle_StepFEA_HArray1OfCurveElementInterval : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_HArray1OfCurveElementInterval();
        Handle_StepFEA_HArray1OfCurveElementInterval(const Handle_StepFEA_HArray1OfCurveElementInterval &aHandle);
        Handle_StepFEA_HArray1OfCurveElementInterval(const StepFEA_HArray1OfCurveElementInterval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_HArray1OfCurveElementInterval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_HArray1OfCurveElementInterval {
    StepFEA_HArray1OfCurveElementInterval* _get_reference() {
    return (StepFEA_HArray1OfCurveElementInterval*)$self->Access();
    }
};

%extend Handle_StepFEA_HArray1OfCurveElementInterval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_HArray1OfCurveElementInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_HArray1OfDegreeOfFreedom;
class StepFEA_HArray1OfDegreeOfFreedom : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_HArray1OfDegreeOfFreedom;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_HArray1OfDegreeOfFreedom;
		 StepFEA_HArray1OfDegreeOfFreedom (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_HArray1OfDegreeOfFreedom;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepFEA_DegreeOfFreedom &
	:rtype: None
") StepFEA_HArray1OfDegreeOfFreedom;
		 StepFEA_HArray1OfDegreeOfFreedom (const Standard_Integer Low,const Standard_Integer Up,const StepFEA_DegreeOfFreedom & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepFEA_DegreeOfFreedom &
	:rtype: None
") Init;
		void Init (const StepFEA_DegreeOfFreedom & V);
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
	:type Value: StepFEA_DegreeOfFreedom &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepFEA_DegreeOfFreedom & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepFEA_DegreeOfFreedom
") Value;
		const StepFEA_DegreeOfFreedom & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepFEA_DegreeOfFreedom
") ChangeValue;
		StepFEA_DegreeOfFreedom & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfDegreeOfFreedom
") Array1;
		const StepFEA_Array1OfDegreeOfFreedom & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfDegreeOfFreedom
") ChangeArray1;
		StepFEA_Array1OfDegreeOfFreedom & ChangeArray1 ();
};


%extend StepFEA_HArray1OfDegreeOfFreedom {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_HArray1OfDegreeOfFreedom(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_HArray1OfDegreeOfFreedom::Handle_StepFEA_HArray1OfDegreeOfFreedom %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_HArray1OfDegreeOfFreedom;
class Handle_StepFEA_HArray1OfDegreeOfFreedom : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_HArray1OfDegreeOfFreedom();
        Handle_StepFEA_HArray1OfDegreeOfFreedom(const Handle_StepFEA_HArray1OfDegreeOfFreedom &aHandle);
        Handle_StepFEA_HArray1OfDegreeOfFreedom(const StepFEA_HArray1OfDegreeOfFreedom *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_HArray1OfDegreeOfFreedom DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_HArray1OfDegreeOfFreedom {
    StepFEA_HArray1OfDegreeOfFreedom* _get_reference() {
    return (StepFEA_HArray1OfDegreeOfFreedom*)$self->Access();
    }
};

%extend Handle_StepFEA_HArray1OfDegreeOfFreedom {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_HArray1OfDegreeOfFreedom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_HArray1OfElementRepresentation;
class StepFEA_HArray1OfElementRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_HArray1OfElementRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_HArray1OfElementRepresentation;
		 StepFEA_HArray1OfElementRepresentation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_HArray1OfElementRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") StepFEA_HArray1OfElementRepresentation;
		 StepFEA_HArray1OfElementRepresentation (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepFEA_ElementRepresentation & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_ElementRepresentation & V);
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
	:type Value: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_ElementRepresentation & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_ElementRepresentation
") Value;
		Handle_StepFEA_ElementRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_ElementRepresentation
") ChangeValue;
		Handle_StepFEA_ElementRepresentation ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfElementRepresentation
") Array1;
		const StepFEA_Array1OfElementRepresentation & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfElementRepresentation
") ChangeArray1;
		StepFEA_Array1OfElementRepresentation & ChangeArray1 ();
};


%extend StepFEA_HArray1OfElementRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_HArray1OfElementRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_HArray1OfElementRepresentation::Handle_StepFEA_HArray1OfElementRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_HArray1OfElementRepresentation;
class Handle_StepFEA_HArray1OfElementRepresentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_HArray1OfElementRepresentation();
        Handle_StepFEA_HArray1OfElementRepresentation(const Handle_StepFEA_HArray1OfElementRepresentation &aHandle);
        Handle_StepFEA_HArray1OfElementRepresentation(const StepFEA_HArray1OfElementRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_HArray1OfElementRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_HArray1OfElementRepresentation {
    StepFEA_HArray1OfElementRepresentation* _get_reference() {
    return (StepFEA_HArray1OfElementRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_HArray1OfElementRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_HArray1OfElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_HArray1OfNodeRepresentation;
class StepFEA_HArray1OfNodeRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_HArray1OfNodeRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepFEA_HArray1OfNodeRepresentation;
		 StepFEA_HArray1OfNodeRepresentation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepFEA_HArray1OfNodeRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") StepFEA_HArray1OfNodeRepresentation;
		 StepFEA_HArray1OfNodeRepresentation (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepFEA_NodeRepresentation & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_NodeRepresentation & V);
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
	:type Value: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_NodeRepresentation & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_NodeRepresentation
") Value;
		Handle_StepFEA_NodeRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_NodeRepresentation
") ChangeValue;
		Handle_StepFEA_NodeRepresentation ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfNodeRepresentation
") Array1;
		const StepFEA_Array1OfNodeRepresentation & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepFEA_Array1OfNodeRepresentation
") ChangeArray1;
		StepFEA_Array1OfNodeRepresentation & ChangeArray1 ();
};


%extend StepFEA_HArray1OfNodeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_HArray1OfNodeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_HArray1OfNodeRepresentation::Handle_StepFEA_HArray1OfNodeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_HArray1OfNodeRepresentation;
class Handle_StepFEA_HArray1OfNodeRepresentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_HArray1OfNodeRepresentation();
        Handle_StepFEA_HArray1OfNodeRepresentation(const Handle_StepFEA_HArray1OfNodeRepresentation &aHandle);
        Handle_StepFEA_HArray1OfNodeRepresentation(const StepFEA_HArray1OfNodeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_HArray1OfNodeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_HArray1OfNodeRepresentation {
    StepFEA_HArray1OfNodeRepresentation* _get_reference() {
    return (StepFEA_HArray1OfNodeRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_HArray1OfNodeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_HArray1OfNodeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_HSequenceOfCurve3dElementProperty;
class StepFEA_HSequenceOfCurve3dElementProperty : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_HSequenceOfCurve3dElementProperty;
		%feature("autodoc", "	:rtype: None
") StepFEA_HSequenceOfCurve3dElementProperty;
		 StepFEA_HSequenceOfCurve3dElementProperty ();
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
	:type anItem: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_Curve3dElementProperty & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfCurve3dElementProperty &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_HSequenceOfCurve3dElementProperty & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_Curve3dElementProperty & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfCurve3dElementProperty &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_HSequenceOfCurve3dElementProperty & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepFEA_Curve3dElementProperty & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfCurve3dElementProperty &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepFEA_HSequenceOfCurve3dElementProperty & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepFEA_Curve3dElementProperty & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfCurve3dElementProperty &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepFEA_HSequenceOfCurve3dElementProperty & aSequence);
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
	:rtype: Handle_StepFEA_HSequenceOfCurve3dElementProperty
") Split;
		Handle_StepFEA_HSequenceOfCurve3dElementProperty Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_StepFEA_Curve3dElementProperty & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepFEA_Curve3dElementProperty
") Value;
		Handle_StepFEA_Curve3dElementProperty Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepFEA_Curve3dElementProperty
") ChangeValue;
		Handle_StepFEA_Curve3dElementProperty ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: StepFEA_SequenceOfCurve3dElementProperty
") Sequence;
		const StepFEA_SequenceOfCurve3dElementProperty & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: StepFEA_SequenceOfCurve3dElementProperty
") ChangeSequence;
		StepFEA_SequenceOfCurve3dElementProperty & ChangeSequence ();
};


%extend StepFEA_HSequenceOfCurve3dElementProperty {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_HSequenceOfCurve3dElementProperty(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_HSequenceOfCurve3dElementProperty::Handle_StepFEA_HSequenceOfCurve3dElementProperty %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_HSequenceOfCurve3dElementProperty;
class Handle_StepFEA_HSequenceOfCurve3dElementProperty : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_HSequenceOfCurve3dElementProperty();
        Handle_StepFEA_HSequenceOfCurve3dElementProperty(const Handle_StepFEA_HSequenceOfCurve3dElementProperty &aHandle);
        Handle_StepFEA_HSequenceOfCurve3dElementProperty(const StepFEA_HSequenceOfCurve3dElementProperty *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_HSequenceOfCurve3dElementProperty DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_HSequenceOfCurve3dElementProperty {
    StepFEA_HSequenceOfCurve3dElementProperty* _get_reference() {
    return (StepFEA_HSequenceOfCurve3dElementProperty*)$self->Access();
    }
};

%extend Handle_StepFEA_HSequenceOfCurve3dElementProperty {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_HSequenceOfCurve3dElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_HSequenceOfElementGeometricRelationship;
class StepFEA_HSequenceOfElementGeometricRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_HSequenceOfElementGeometricRelationship;
		%feature("autodoc", "	:rtype: None
") StepFEA_HSequenceOfElementGeometricRelationship;
		 StepFEA_HSequenceOfElementGeometricRelationship ();
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
	:type anItem: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_ElementGeometricRelationship & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfElementGeometricRelationship &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_HSequenceOfElementGeometricRelationship & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_ElementGeometricRelationship & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfElementGeometricRelationship &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_HSequenceOfElementGeometricRelationship & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepFEA_ElementGeometricRelationship & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfElementGeometricRelationship &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepFEA_HSequenceOfElementGeometricRelationship & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepFEA_ElementGeometricRelationship & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfElementGeometricRelationship &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepFEA_HSequenceOfElementGeometricRelationship & aSequence);
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
	:rtype: Handle_StepFEA_HSequenceOfElementGeometricRelationship
") Split;
		Handle_StepFEA_HSequenceOfElementGeometricRelationship Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_StepFEA_ElementGeometricRelationship & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepFEA_ElementGeometricRelationship
") Value;
		Handle_StepFEA_ElementGeometricRelationship Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepFEA_ElementGeometricRelationship
") ChangeValue;
		Handle_StepFEA_ElementGeometricRelationship ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: StepFEA_SequenceOfElementGeometricRelationship
") Sequence;
		const StepFEA_SequenceOfElementGeometricRelationship & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: StepFEA_SequenceOfElementGeometricRelationship
") ChangeSequence;
		StepFEA_SequenceOfElementGeometricRelationship & ChangeSequence ();
};


%extend StepFEA_HSequenceOfElementGeometricRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_HSequenceOfElementGeometricRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_HSequenceOfElementGeometricRelationship::Handle_StepFEA_HSequenceOfElementGeometricRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_HSequenceOfElementGeometricRelationship;
class Handle_StepFEA_HSequenceOfElementGeometricRelationship : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_HSequenceOfElementGeometricRelationship();
        Handle_StepFEA_HSequenceOfElementGeometricRelationship(const Handle_StepFEA_HSequenceOfElementGeometricRelationship &aHandle);
        Handle_StepFEA_HSequenceOfElementGeometricRelationship(const StepFEA_HSequenceOfElementGeometricRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_HSequenceOfElementGeometricRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_HSequenceOfElementGeometricRelationship {
    StepFEA_HSequenceOfElementGeometricRelationship* _get_reference() {
    return (StepFEA_HSequenceOfElementGeometricRelationship*)$self->Access();
    }
};

%extend Handle_StepFEA_HSequenceOfElementGeometricRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_HSequenceOfElementGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_HSequenceOfElementRepresentation;
class StepFEA_HSequenceOfElementRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_HSequenceOfElementRepresentation;
		%feature("autodoc", "	:rtype: None
") StepFEA_HSequenceOfElementRepresentation;
		 StepFEA_HSequenceOfElementRepresentation ();
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
	:type anItem: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_ElementRepresentation & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfElementRepresentation &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_HSequenceOfElementRepresentation & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_ElementRepresentation & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfElementRepresentation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_HSequenceOfElementRepresentation & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepFEA_ElementRepresentation & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfElementRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepFEA_HSequenceOfElementRepresentation & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepFEA_ElementRepresentation & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfElementRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepFEA_HSequenceOfElementRepresentation & aSequence);
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
	:rtype: Handle_StepFEA_HSequenceOfElementRepresentation
") Split;
		Handle_StepFEA_HSequenceOfElementRepresentation Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_StepFEA_ElementRepresentation & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepFEA_ElementRepresentation
") Value;
		Handle_StepFEA_ElementRepresentation Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepFEA_ElementRepresentation
") ChangeValue;
		Handle_StepFEA_ElementRepresentation ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: StepFEA_SequenceOfElementRepresentation
") Sequence;
		const StepFEA_SequenceOfElementRepresentation & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: StepFEA_SequenceOfElementRepresentation
") ChangeSequence;
		StepFEA_SequenceOfElementRepresentation & ChangeSequence ();
};


%extend StepFEA_HSequenceOfElementRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_HSequenceOfElementRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_HSequenceOfElementRepresentation::Handle_StepFEA_HSequenceOfElementRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_HSequenceOfElementRepresentation;
class Handle_StepFEA_HSequenceOfElementRepresentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_HSequenceOfElementRepresentation();
        Handle_StepFEA_HSequenceOfElementRepresentation(const Handle_StepFEA_HSequenceOfElementRepresentation &aHandle);
        Handle_StepFEA_HSequenceOfElementRepresentation(const StepFEA_HSequenceOfElementRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_HSequenceOfElementRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_HSequenceOfElementRepresentation {
    StepFEA_HSequenceOfElementRepresentation* _get_reference() {
    return (StepFEA_HSequenceOfElementRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_HSequenceOfElementRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_HSequenceOfElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_HSequenceOfNodeRepresentation;
class StepFEA_HSequenceOfNodeRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepFEA_HSequenceOfNodeRepresentation;
		%feature("autodoc", "	:rtype: None
") StepFEA_HSequenceOfNodeRepresentation;
		 StepFEA_HSequenceOfNodeRepresentation ();
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
	:type anItem: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_NodeRepresentation & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfNodeRepresentation &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_HSequenceOfNodeRepresentation & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_NodeRepresentation & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfNodeRepresentation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_HSequenceOfNodeRepresentation & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepFEA_NodeRepresentation & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfNodeRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepFEA_HSequenceOfNodeRepresentation & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepFEA_NodeRepresentation & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepFEA_HSequenceOfNodeRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepFEA_HSequenceOfNodeRepresentation & aSequence);
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
	:rtype: Handle_StepFEA_HSequenceOfNodeRepresentation
") Split;
		Handle_StepFEA_HSequenceOfNodeRepresentation Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_StepFEA_NodeRepresentation & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepFEA_NodeRepresentation
") Value;
		Handle_StepFEA_NodeRepresentation Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepFEA_NodeRepresentation
") ChangeValue;
		Handle_StepFEA_NodeRepresentation ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: StepFEA_SequenceOfNodeRepresentation
") Sequence;
		const StepFEA_SequenceOfNodeRepresentation & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: StepFEA_SequenceOfNodeRepresentation
") ChangeSequence;
		StepFEA_SequenceOfNodeRepresentation & ChangeSequence ();
};


%extend StepFEA_HSequenceOfNodeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_HSequenceOfNodeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_HSequenceOfNodeRepresentation::Handle_StepFEA_HSequenceOfNodeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_HSequenceOfNodeRepresentation;
class Handle_StepFEA_HSequenceOfNodeRepresentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepFEA_HSequenceOfNodeRepresentation();
        Handle_StepFEA_HSequenceOfNodeRepresentation(const Handle_StepFEA_HSequenceOfNodeRepresentation &aHandle);
        Handle_StepFEA_HSequenceOfNodeRepresentation(const StepFEA_HSequenceOfNodeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_HSequenceOfNodeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_HSequenceOfNodeRepresentation {
    StepFEA_HSequenceOfNodeRepresentation* _get_reference() {
    return (StepFEA_HSequenceOfNodeRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_HSequenceOfNodeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_HSequenceOfNodeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_NodeDefinition;
class StepFEA_NodeDefinition : public StepRepr_ShapeAspect {
	public:
		%feature("compactdefaultargs") StepFEA_NodeDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_NodeDefinition;
		 StepFEA_NodeDefinition ();
};


%extend StepFEA_NodeDefinition {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_NodeDefinition(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_NodeDefinition::Handle_StepFEA_NodeDefinition %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_NodeDefinition;
class Handle_StepFEA_NodeDefinition : public Handle_StepRepr_ShapeAspect {

    public:
        // constructors
        Handle_StepFEA_NodeDefinition();
        Handle_StepFEA_NodeDefinition(const Handle_StepFEA_NodeDefinition &aHandle);
        Handle_StepFEA_NodeDefinition(const StepFEA_NodeDefinition *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_NodeDefinition DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_NodeDefinition {
    StepFEA_NodeDefinition* _get_reference() {
    return (StepFEA_NodeDefinition*)$self->Access();
    }
};

%extend Handle_StepFEA_NodeDefinition {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_NodeDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_NodeRepresentation;
class StepFEA_NodeRepresentation : public StepRepr_Representation {
	public:
		%feature("compactdefaultargs") StepFEA_NodeRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_NodeRepresentation;
		 StepFEA_NodeRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentation_Name:
	:type aRepresentation_Name: Handle_TCollection_HAsciiString &
	:param aRepresentation_Items:
	:type aRepresentation_Items: Handle_StepRepr_HArray1OfRepresentationItem &
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: Handle_StepRepr_RepresentationContext &
	:param aModelRef:
	:type aModelRef: Handle_StepFEA_FeaModel &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentation_Name,const Handle_StepRepr_HArray1OfRepresentationItem & aRepresentation_Items,const Handle_StepRepr_RepresentationContext & aRepresentation_ContextOfItems,const Handle_StepFEA_FeaModel & aModelRef);
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "	* Returns field ModelRef

	:rtype: Handle_StepFEA_FeaModel
") ModelRef;
		Handle_StepFEA_FeaModel ModelRef ();
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "	* Set field ModelRef

	:param ModelRef:
	:type ModelRef: Handle_StepFEA_FeaModel &
	:rtype: None
") SetModelRef;
		void SetModelRef (const Handle_StepFEA_FeaModel & ModelRef);
};


%extend StepFEA_NodeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_NodeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_NodeRepresentation::Handle_StepFEA_NodeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_NodeRepresentation;
class Handle_StepFEA_NodeRepresentation : public Handle_StepRepr_Representation {

    public:
        // constructors
        Handle_StepFEA_NodeRepresentation();
        Handle_StepFEA_NodeRepresentation(const Handle_StepFEA_NodeRepresentation &aHandle);
        Handle_StepFEA_NodeRepresentation(const StepFEA_NodeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_NodeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_NodeRepresentation {
    StepFEA_NodeRepresentation* _get_reference() {
    return (StepFEA_NodeRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_NodeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_NodeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_NodeSet;
class StepFEA_NodeSet : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_NodeSet;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_NodeSet;
		 StepFEA_NodeSet ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aNodes:
	:type aNodes: Handle_StepFEA_HArray1OfNodeRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepFEA_HArray1OfNodeRepresentation & aNodes);
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "	* Returns field Nodes

	:rtype: Handle_StepFEA_HArray1OfNodeRepresentation
") Nodes;
		Handle_StepFEA_HArray1OfNodeRepresentation Nodes ();
		%feature("compactdefaultargs") SetNodes;
		%feature("autodoc", "	* Set field Nodes

	:param Nodes:
	:type Nodes: Handle_StepFEA_HArray1OfNodeRepresentation &
	:rtype: None
") SetNodes;
		void SetNodes (const Handle_StepFEA_HArray1OfNodeRepresentation & Nodes);
};


%extend StepFEA_NodeSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_NodeSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_NodeSet::Handle_StepFEA_NodeSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_NodeSet;
class Handle_StepFEA_NodeSet : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_NodeSet();
        Handle_StepFEA_NodeSet(const Handle_StepFEA_NodeSet &aHandle);
        Handle_StepFEA_NodeSet(const StepFEA_NodeSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_NodeSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_NodeSet {
    StepFEA_NodeSet* _get_reference() {
    return (StepFEA_NodeSet*)$self->Access();
    }
};

%extend Handle_StepFEA_NodeSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_NodeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty;
class StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty;
		%feature("autodoc", "	:param I:
	:type I: Handle_StepFEA_Curve3dElementProperty &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty;
		 StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty (const Handle_StepFEA_Curve3dElementProperty & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepFEA_Curve3dElementProperty
") Value;
		Handle_StepFEA_Curve3dElementProperty Value ();
};


%extend StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty::Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty;
class Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty();
        Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty(const Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty &aHandle);
        Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty(const StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty {
    StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty* _get_reference() {
    return (StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty*)$self->Access();
    }
};

%extend Handle_StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship;
class StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship;
		%feature("autodoc", "	:param I:
	:type I: Handle_StepFEA_ElementGeometricRelationship &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship;
		 StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship (const Handle_StepFEA_ElementGeometricRelationship & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepFEA_ElementGeometricRelationship
") Value;
		Handle_StepFEA_ElementGeometricRelationship Value ();
};


%extend StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship::Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship;
class Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship();
        Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship(const Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship &aHandle);
        Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship(const StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship {
    StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship* _get_reference() {
    return (StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship*)$self->Access();
    }
};

%extend Handle_StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SequenceNodeOfSequenceOfElementRepresentation;
class StepFEA_SequenceNodeOfSequenceOfElementRepresentation : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StepFEA_SequenceNodeOfSequenceOfElementRepresentation;
		%feature("autodoc", "	:param I:
	:type I: Handle_StepFEA_ElementRepresentation &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StepFEA_SequenceNodeOfSequenceOfElementRepresentation;
		 StepFEA_SequenceNodeOfSequenceOfElementRepresentation (const Handle_StepFEA_ElementRepresentation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepFEA_ElementRepresentation
") Value;
		Handle_StepFEA_ElementRepresentation Value ();
};


%extend StepFEA_SequenceNodeOfSequenceOfElementRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation::Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation;
class Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation();
        Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation(const Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation &aHandle);
        Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation(const StepFEA_SequenceNodeOfSequenceOfElementRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation {
    StepFEA_SequenceNodeOfSequenceOfElementRepresentation* _get_reference() {
    return (StepFEA_SequenceNodeOfSequenceOfElementRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_SequenceNodeOfSequenceOfElementRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_SequenceNodeOfSequenceOfElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SequenceNodeOfSequenceOfNodeRepresentation;
class StepFEA_SequenceNodeOfSequenceOfNodeRepresentation : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StepFEA_SequenceNodeOfSequenceOfNodeRepresentation;
		%feature("autodoc", "	:param I:
	:type I: Handle_StepFEA_NodeRepresentation &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StepFEA_SequenceNodeOfSequenceOfNodeRepresentation;
		 StepFEA_SequenceNodeOfSequenceOfNodeRepresentation (const Handle_StepFEA_NodeRepresentation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepFEA_NodeRepresentation
") Value;
		Handle_StepFEA_NodeRepresentation Value ();
};


%extend StepFEA_SequenceNodeOfSequenceOfNodeRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation::Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation;
class Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation();
        Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation(const Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation &aHandle);
        Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation(const StepFEA_SequenceNodeOfSequenceOfNodeRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation {
    StepFEA_SequenceNodeOfSequenceOfNodeRepresentation* _get_reference() {
    return (StepFEA_SequenceNodeOfSequenceOfNodeRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_SequenceNodeOfSequenceOfNodeRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_SequenceNodeOfSequenceOfNodeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SequenceOfCurve3dElementProperty;
class StepFEA_SequenceOfCurve3dElementProperty : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StepFEA_SequenceOfCurve3dElementProperty;
		%feature("autodoc", "	:rtype: None
") StepFEA_SequenceOfCurve3dElementProperty;
		 StepFEA_SequenceOfCurve3dElementProperty ();
		%feature("compactdefaultargs") StepFEA_SequenceOfCurve3dElementProperty;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfCurve3dElementProperty &
	:rtype: None
") StepFEA_SequenceOfCurve3dElementProperty;
		 StepFEA_SequenceOfCurve3dElementProperty (const StepFEA_SequenceOfCurve3dElementProperty & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfCurve3dElementProperty &
	:rtype: StepFEA_SequenceOfCurve3dElementProperty
") Assign;
		const StepFEA_SequenceOfCurve3dElementProperty & Assign (const StepFEA_SequenceOfCurve3dElementProperty & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfCurve3dElementProperty &
	:rtype: StepFEA_SequenceOfCurve3dElementProperty
") operator =;
		const StepFEA_SequenceOfCurve3dElementProperty & operator = (const StepFEA_SequenceOfCurve3dElementProperty & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_Curve3dElementProperty & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StepFEA_SequenceOfCurve3dElementProperty &
	:rtype: None
") Append;
		void Append (StepFEA_SequenceOfCurve3dElementProperty & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_Curve3dElementProperty & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StepFEA_SequenceOfCurve3dElementProperty &
	:rtype: None
") Prepend;
		void Prepend (StepFEA_SequenceOfCurve3dElementProperty & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StepFEA_Curve3dElementProperty & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepFEA_SequenceOfCurve3dElementProperty &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StepFEA_SequenceOfCurve3dElementProperty & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StepFEA_Curve3dElementProperty & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepFEA_SequenceOfCurve3dElementProperty &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StepFEA_SequenceOfCurve3dElementProperty & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StepFEA_Curve3dElementProperty
") First;
		Handle_StepFEA_Curve3dElementProperty First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StepFEA_Curve3dElementProperty
") Last;
		Handle_StepFEA_Curve3dElementProperty Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StepFEA_SequenceOfCurve3dElementProperty &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StepFEA_SequenceOfCurve3dElementProperty & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_Curve3dElementProperty
") Value;
		Handle_StepFEA_Curve3dElementProperty Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_Curve3dElementProperty & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_Curve3dElementProperty
") ChangeValue;
		Handle_StepFEA_Curve3dElementProperty ChangeValue (const Standard_Integer Index);
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


%extend StepFEA_SequenceOfCurve3dElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SequenceOfElementGeometricRelationship;
class StepFEA_SequenceOfElementGeometricRelationship : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StepFEA_SequenceOfElementGeometricRelationship;
		%feature("autodoc", "	:rtype: None
") StepFEA_SequenceOfElementGeometricRelationship;
		 StepFEA_SequenceOfElementGeometricRelationship ();
		%feature("compactdefaultargs") StepFEA_SequenceOfElementGeometricRelationship;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfElementGeometricRelationship &
	:rtype: None
") StepFEA_SequenceOfElementGeometricRelationship;
		 StepFEA_SequenceOfElementGeometricRelationship (const StepFEA_SequenceOfElementGeometricRelationship & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfElementGeometricRelationship &
	:rtype: StepFEA_SequenceOfElementGeometricRelationship
") Assign;
		const StepFEA_SequenceOfElementGeometricRelationship & Assign (const StepFEA_SequenceOfElementGeometricRelationship & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfElementGeometricRelationship &
	:rtype: StepFEA_SequenceOfElementGeometricRelationship
") operator =;
		const StepFEA_SequenceOfElementGeometricRelationship & operator = (const StepFEA_SequenceOfElementGeometricRelationship & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_ElementGeometricRelationship & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StepFEA_SequenceOfElementGeometricRelationship &
	:rtype: None
") Append;
		void Append (StepFEA_SequenceOfElementGeometricRelationship & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_ElementGeometricRelationship & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StepFEA_SequenceOfElementGeometricRelationship &
	:rtype: None
") Prepend;
		void Prepend (StepFEA_SequenceOfElementGeometricRelationship & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StepFEA_ElementGeometricRelationship & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepFEA_SequenceOfElementGeometricRelationship &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StepFEA_SequenceOfElementGeometricRelationship & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StepFEA_ElementGeometricRelationship & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepFEA_SequenceOfElementGeometricRelationship &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StepFEA_SequenceOfElementGeometricRelationship & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StepFEA_ElementGeometricRelationship
") First;
		Handle_StepFEA_ElementGeometricRelationship First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StepFEA_ElementGeometricRelationship
") Last;
		Handle_StepFEA_ElementGeometricRelationship Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StepFEA_SequenceOfElementGeometricRelationship &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StepFEA_SequenceOfElementGeometricRelationship & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_ElementGeometricRelationship
") Value;
		Handle_StepFEA_ElementGeometricRelationship Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_ElementGeometricRelationship & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_ElementGeometricRelationship
") ChangeValue;
		Handle_StepFEA_ElementGeometricRelationship ChangeValue (const Standard_Integer Index);
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


%extend StepFEA_SequenceOfElementGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SequenceOfElementRepresentation;
class StepFEA_SequenceOfElementRepresentation : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StepFEA_SequenceOfElementRepresentation;
		%feature("autodoc", "	:rtype: None
") StepFEA_SequenceOfElementRepresentation;
		 StepFEA_SequenceOfElementRepresentation ();
		%feature("compactdefaultargs") StepFEA_SequenceOfElementRepresentation;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfElementRepresentation &
	:rtype: None
") StepFEA_SequenceOfElementRepresentation;
		 StepFEA_SequenceOfElementRepresentation (const StepFEA_SequenceOfElementRepresentation & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfElementRepresentation &
	:rtype: StepFEA_SequenceOfElementRepresentation
") Assign;
		const StepFEA_SequenceOfElementRepresentation & Assign (const StepFEA_SequenceOfElementRepresentation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfElementRepresentation &
	:rtype: StepFEA_SequenceOfElementRepresentation
") operator =;
		const StepFEA_SequenceOfElementRepresentation & operator = (const StepFEA_SequenceOfElementRepresentation & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_ElementRepresentation & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StepFEA_SequenceOfElementRepresentation &
	:rtype: None
") Append;
		void Append (StepFEA_SequenceOfElementRepresentation & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_ElementRepresentation & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StepFEA_SequenceOfElementRepresentation &
	:rtype: None
") Prepend;
		void Prepend (StepFEA_SequenceOfElementRepresentation & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StepFEA_ElementRepresentation & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepFEA_SequenceOfElementRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StepFEA_SequenceOfElementRepresentation & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StepFEA_ElementRepresentation & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepFEA_SequenceOfElementRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StepFEA_SequenceOfElementRepresentation & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StepFEA_ElementRepresentation
") First;
		Handle_StepFEA_ElementRepresentation First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StepFEA_ElementRepresentation
") Last;
		Handle_StepFEA_ElementRepresentation Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StepFEA_SequenceOfElementRepresentation &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StepFEA_SequenceOfElementRepresentation & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_ElementRepresentation
") Value;
		Handle_StepFEA_ElementRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_ElementRepresentation & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_ElementRepresentation
") ChangeValue;
		Handle_StepFEA_ElementRepresentation ChangeValue (const Standard_Integer Index);
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


%extend StepFEA_SequenceOfElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SequenceOfNodeRepresentation;
class StepFEA_SequenceOfNodeRepresentation : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StepFEA_SequenceOfNodeRepresentation;
		%feature("autodoc", "	:rtype: None
") StepFEA_SequenceOfNodeRepresentation;
		 StepFEA_SequenceOfNodeRepresentation ();
		%feature("compactdefaultargs") StepFEA_SequenceOfNodeRepresentation;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfNodeRepresentation &
	:rtype: None
") StepFEA_SequenceOfNodeRepresentation;
		 StepFEA_SequenceOfNodeRepresentation (const StepFEA_SequenceOfNodeRepresentation & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfNodeRepresentation &
	:rtype: StepFEA_SequenceOfNodeRepresentation
") Assign;
		const StepFEA_SequenceOfNodeRepresentation & Assign (const StepFEA_SequenceOfNodeRepresentation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepFEA_SequenceOfNodeRepresentation &
	:rtype: StepFEA_SequenceOfNodeRepresentation
") operator =;
		const StepFEA_SequenceOfNodeRepresentation & operator = (const StepFEA_SequenceOfNodeRepresentation & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") Append;
		void Append (const Handle_StepFEA_NodeRepresentation & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StepFEA_SequenceOfNodeRepresentation &
	:rtype: None
") Append;
		void Append (StepFEA_SequenceOfNodeRepresentation & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepFEA_NodeRepresentation & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StepFEA_SequenceOfNodeRepresentation &
	:rtype: None
") Prepend;
		void Prepend (StepFEA_SequenceOfNodeRepresentation & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StepFEA_NodeRepresentation & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepFEA_SequenceOfNodeRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StepFEA_SequenceOfNodeRepresentation & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StepFEA_NodeRepresentation & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepFEA_SequenceOfNodeRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StepFEA_SequenceOfNodeRepresentation & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StepFEA_NodeRepresentation
") First;
		Handle_StepFEA_NodeRepresentation First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StepFEA_NodeRepresentation
") Last;
		Handle_StepFEA_NodeRepresentation Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StepFEA_SequenceOfNodeRepresentation &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StepFEA_SequenceOfNodeRepresentation & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_NodeRepresentation
") Value;
		Handle_StepFEA_NodeRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepFEA_NodeRepresentation & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepFEA_NodeRepresentation
") ChangeValue;
		Handle_StepFEA_NodeRepresentation ChangeValue (const Standard_Integer Index);
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


%extend StepFEA_SequenceOfNodeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SymmetricTensor22d;
class StepFEA_SymmetricTensor22d : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepFEA_SymmetricTensor22d;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_SymmetricTensor22d;
		 StepFEA_SymmetricTensor22d ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of SymmetricTensor22d select type 1 -> HArray1OfReal from TColStd 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") AnisotropicSymmetricTensor22d;
		%feature("autodoc", "	* Returns Value as AnisotropicSymmetricTensor22d (or Null if another type)

	:rtype: Handle_TColStd_HArray1OfReal
") AnisotropicSymmetricTensor22d;
		Handle_TColStd_HArray1OfReal AnisotropicSymmetricTensor22d ();
};


%extend StepFEA_SymmetricTensor22d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SymmetricTensor23d;
class StepFEA_SymmetricTensor23d : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepFEA_SymmetricTensor23d;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_SymmetricTensor23d;
		 StepFEA_SymmetricTensor23d ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of SymmetricTensor23d select type return 0

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a items of select member SymmetricTensor23dMember 1 -> IsotropicSymmetricTensor23d 2 -> OrthotropicSymmetricTensor23d 3 -> AnisotropicSymmetricTensor23d 0 else

	:param ent:
	:type ent: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a new select member the type SymmetricTensor23dMember

	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") SetIsotropicSymmetricTensor23d;
		%feature("autodoc", "	* Set Value for IsotropicSymmetricTensor23d

	:param aVal:
	:type aVal: float
	:rtype: None
") SetIsotropicSymmetricTensor23d;
		void SetIsotropicSymmetricTensor23d (const Standard_Real aVal);
		%feature("compactdefaultargs") IsotropicSymmetricTensor23d;
		%feature("autodoc", "	* Returns Value as IsotropicSymmetricTensor23d (or Null if another type)

	:rtype: float
") IsotropicSymmetricTensor23d;
		Standard_Real IsotropicSymmetricTensor23d ();
		%feature("compactdefaultargs") SetOrthotropicSymmetricTensor23d;
		%feature("autodoc", "	* Set Value for OrthotropicSymmetricTensor23d

	:param aVal:
	:type aVal: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetOrthotropicSymmetricTensor23d;
		void SetOrthotropicSymmetricTensor23d (const Handle_TColStd_HArray1OfReal & aVal);
		%feature("compactdefaultargs") OrthotropicSymmetricTensor23d;
		%feature("autodoc", "	* Returns Value as OrthotropicSymmetricTensor23d (or Null if another type)

	:rtype: Handle_TColStd_HArray1OfReal
") OrthotropicSymmetricTensor23d;
		Handle_TColStd_HArray1OfReal OrthotropicSymmetricTensor23d ();
		%feature("compactdefaultargs") SetAnisotropicSymmetricTensor23d;
		%feature("autodoc", "	* Set Value for AnisotropicSymmetricTensor23d

	:param aVal:
	:type aVal: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetAnisotropicSymmetricTensor23d;
		void SetAnisotropicSymmetricTensor23d (const Handle_TColStd_HArray1OfReal & aVal);
		%feature("compactdefaultargs") AnisotropicSymmetricTensor23d;
		%feature("autodoc", "	* Returns Value as AnisotropicSymmetricTensor23d (or Null if another type)

	:rtype: Handle_TColStd_HArray1OfReal
") AnisotropicSymmetricTensor23d;
		Handle_TColStd_HArray1OfReal AnisotropicSymmetricTensor23d ();
};


%extend StepFEA_SymmetricTensor23d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SymmetricTensor23dMember;
class StepFEA_SymmetricTensor23dMember : public StepData_SelectArrReal {
	public:
		%feature("compactdefaultargs") StepFEA_SymmetricTensor23dMember;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_SymmetricTensor23dMember;
		 StepFEA_SymmetricTensor23dMember ();
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


%extend StepFEA_SymmetricTensor23dMember {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_SymmetricTensor23dMember(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_SymmetricTensor23dMember::Handle_StepFEA_SymmetricTensor23dMember %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_SymmetricTensor23dMember;
class Handle_StepFEA_SymmetricTensor23dMember : public Handle_StepData_SelectArrReal {

    public:
        // constructors
        Handle_StepFEA_SymmetricTensor23dMember();
        Handle_StepFEA_SymmetricTensor23dMember(const Handle_StepFEA_SymmetricTensor23dMember &aHandle);
        Handle_StepFEA_SymmetricTensor23dMember(const StepFEA_SymmetricTensor23dMember *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_SymmetricTensor23dMember DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_SymmetricTensor23dMember {
    StepFEA_SymmetricTensor23dMember* _get_reference() {
    return (StepFEA_SymmetricTensor23dMember*)$self->Access();
    }
};

%extend Handle_StepFEA_SymmetricTensor23dMember {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_SymmetricTensor23dMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SymmetricTensor42d;
class StepFEA_SymmetricTensor42d : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepFEA_SymmetricTensor42d;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_SymmetricTensor42d;
		 StepFEA_SymmetricTensor42d ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of SymmetricTensor42d select type 1 -> HArray1OfReal from TColStd 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") AnisotropicSymmetricTensor42d;
		%feature("autodoc", "	* Returns Value as AnisotropicSymmetricTensor42d (or Null if another type)

	:rtype: Handle_TColStd_HArray1OfReal
") AnisotropicSymmetricTensor42d;
		Handle_TColStd_HArray1OfReal AnisotropicSymmetricTensor42d ();
};


%extend StepFEA_SymmetricTensor42d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SymmetricTensor43d;
class StepFEA_SymmetricTensor43d : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepFEA_SymmetricTensor43d;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_SymmetricTensor43d;
		 StepFEA_SymmetricTensor43d ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* return 0

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a items of select member CurveElementFreedomMember 1 -> AnisotropicSymmetricTensor43d 2 -> FeaIsotropicSymmetricTensor43d 3 -> FeaIsoOrthotropicSymmetricTensor43d 4 -> FeaTransverseIsotropicSymmetricTensor43d 5 -> FeaColumnNormalisedOrthotropicSymmetricTensor43d 6 -> FeaColumnNormalisedMonoclinicSymmetricTensor43d 0 else

	:param ent:
	:type ent: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") AnisotropicSymmetricTensor43d;
		%feature("autodoc", "	* Returns Value as AnisotropicSymmetricTensor43d (or Null if another type)

	:rtype: Handle_TColStd_HArray1OfReal
") AnisotropicSymmetricTensor43d;
		Handle_TColStd_HArray1OfReal AnisotropicSymmetricTensor43d ();
		%feature("compactdefaultargs") FeaIsoOrthotropicSymmetricTensor43d;
		%feature("autodoc", "	* Returns Value as FeaIsoOrthotropicSymmetricTensor43d (or Null if another type)

	:rtype: Handle_TColStd_HArray1OfReal
") FeaIsoOrthotropicSymmetricTensor43d;
		Handle_TColStd_HArray1OfReal FeaIsoOrthotropicSymmetricTensor43d ();
		%feature("compactdefaultargs") FeaTransverseIsotropicSymmetricTensor43d;
		%feature("autodoc", "	* Returns Value as FeaTransverseIsotropicSymmetricTensor43d (or Null if another type)

	:rtype: Handle_TColStd_HArray1OfReal
") FeaTransverseIsotropicSymmetricTensor43d;
		Handle_TColStd_HArray1OfReal FeaTransverseIsotropicSymmetricTensor43d ();
		%feature("compactdefaultargs") FeaColumnNormalisedOrthotropicSymmetricTensor43d;
		%feature("autodoc", "	* Returns Value as FeaColumnNormalisedOrthotropicSymmetricTensor43d (or Null if another type)

	:rtype: Handle_TColStd_HArray1OfReal
") FeaColumnNormalisedOrthotropicSymmetricTensor43d;
		Handle_TColStd_HArray1OfReal FeaColumnNormalisedOrthotropicSymmetricTensor43d ();
		%feature("compactdefaultargs") FeaColumnNormalisedMonoclinicSymmetricTensor43d;
		%feature("autodoc", "	* Returns Value as FeaColumnNormalisedMonoclinicSymmetricTensor43d (or Null if another type)

	:rtype: Handle_TColStd_HArray1OfReal
") FeaColumnNormalisedMonoclinicSymmetricTensor43d;
		Handle_TColStd_HArray1OfReal FeaColumnNormalisedMonoclinicSymmetricTensor43d ();
};


%extend StepFEA_SymmetricTensor43d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_SymmetricTensor43dMember;
class StepFEA_SymmetricTensor43dMember : public StepData_SelectArrReal {
	public:
		%feature("compactdefaultargs") StepFEA_SymmetricTensor43dMember;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_SymmetricTensor43dMember;
		 StepFEA_SymmetricTensor43dMember ();
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


%extend StepFEA_SymmetricTensor43dMember {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_SymmetricTensor43dMember(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_SymmetricTensor43dMember::Handle_StepFEA_SymmetricTensor43dMember %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_SymmetricTensor43dMember;
class Handle_StepFEA_SymmetricTensor43dMember : public Handle_StepData_SelectArrReal {

    public:
        // constructors
        Handle_StepFEA_SymmetricTensor43dMember();
        Handle_StepFEA_SymmetricTensor43dMember(const Handle_StepFEA_SymmetricTensor43dMember &aHandle);
        Handle_StepFEA_SymmetricTensor43dMember(const StepFEA_SymmetricTensor43dMember *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_SymmetricTensor43dMember DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_SymmetricTensor43dMember {
    StepFEA_SymmetricTensor43dMember* _get_reference() {
    return (StepFEA_SymmetricTensor43dMember*)$self->Access();
    }
};

%extend Handle_StepFEA_SymmetricTensor43dMember {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_SymmetricTensor43dMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_AlignedCurve3dElementCoordinateSystem;
class StepFEA_AlignedCurve3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_AlignedCurve3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_AlignedCurve3dElementCoordinateSystem;
		 StepFEA_AlignedCurve3dElementCoordinateSystem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aCoordinateSystem:
	:type aCoordinateSystem: Handle_StepFEA_FeaAxis2Placement3d &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepFEA_FeaAxis2Placement3d & aCoordinateSystem);
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "	* Returns field CoordinateSystem

	:rtype: Handle_StepFEA_FeaAxis2Placement3d
") CoordinateSystem;
		Handle_StepFEA_FeaAxis2Placement3d CoordinateSystem ();
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "	* Set field CoordinateSystem

	:param CoordinateSystem:
	:type CoordinateSystem: Handle_StepFEA_FeaAxis2Placement3d &
	:rtype: None
") SetCoordinateSystem;
		void SetCoordinateSystem (const Handle_StepFEA_FeaAxis2Placement3d & CoordinateSystem);
};


%extend StepFEA_AlignedCurve3dElementCoordinateSystem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_AlignedCurve3dElementCoordinateSystem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_AlignedCurve3dElementCoordinateSystem::Handle_StepFEA_AlignedCurve3dElementCoordinateSystem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_AlignedCurve3dElementCoordinateSystem;
class Handle_StepFEA_AlignedCurve3dElementCoordinateSystem : public Handle_StepFEA_FeaRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_AlignedCurve3dElementCoordinateSystem();
        Handle_StepFEA_AlignedCurve3dElementCoordinateSystem(const Handle_StepFEA_AlignedCurve3dElementCoordinateSystem &aHandle);
        Handle_StepFEA_AlignedCurve3dElementCoordinateSystem(const StepFEA_AlignedCurve3dElementCoordinateSystem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_AlignedCurve3dElementCoordinateSystem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_AlignedCurve3dElementCoordinateSystem {
    StepFEA_AlignedCurve3dElementCoordinateSystem* _get_reference() {
    return (StepFEA_AlignedCurve3dElementCoordinateSystem*)$self->Access();
    }
};

%extend Handle_StepFEA_AlignedCurve3dElementCoordinateSystem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_AlignedCurve3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_AlignedSurface3dElementCoordinateSystem;
class StepFEA_AlignedSurface3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_AlignedSurface3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_AlignedSurface3dElementCoordinateSystem;
		 StepFEA_AlignedSurface3dElementCoordinateSystem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aCoordinateSystem:
	:type aCoordinateSystem: Handle_StepFEA_FeaAxis2Placement3d &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepFEA_FeaAxis2Placement3d & aCoordinateSystem);
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "	* Returns field CoordinateSystem

	:rtype: Handle_StepFEA_FeaAxis2Placement3d
") CoordinateSystem;
		Handle_StepFEA_FeaAxis2Placement3d CoordinateSystem ();
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "	* Set field CoordinateSystem

	:param CoordinateSystem:
	:type CoordinateSystem: Handle_StepFEA_FeaAxis2Placement3d &
	:rtype: None
") SetCoordinateSystem;
		void SetCoordinateSystem (const Handle_StepFEA_FeaAxis2Placement3d & CoordinateSystem);
};


%extend StepFEA_AlignedSurface3dElementCoordinateSystem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_AlignedSurface3dElementCoordinateSystem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_AlignedSurface3dElementCoordinateSystem::Handle_StepFEA_AlignedSurface3dElementCoordinateSystem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_AlignedSurface3dElementCoordinateSystem;
class Handle_StepFEA_AlignedSurface3dElementCoordinateSystem : public Handle_StepFEA_FeaRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_AlignedSurface3dElementCoordinateSystem();
        Handle_StepFEA_AlignedSurface3dElementCoordinateSystem(const Handle_StepFEA_AlignedSurface3dElementCoordinateSystem &aHandle);
        Handle_StepFEA_AlignedSurface3dElementCoordinateSystem(const StepFEA_AlignedSurface3dElementCoordinateSystem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_AlignedSurface3dElementCoordinateSystem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_AlignedSurface3dElementCoordinateSystem {
    StepFEA_AlignedSurface3dElementCoordinateSystem* _get_reference() {
    return (StepFEA_AlignedSurface3dElementCoordinateSystem*)$self->Access();
    }
};

%extend Handle_StepFEA_AlignedSurface3dElementCoordinateSystem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_AlignedSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_ArbitraryVolume3dElementCoordinateSystem;
class StepFEA_ArbitraryVolume3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_ArbitraryVolume3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_ArbitraryVolume3dElementCoordinateSystem;
		 StepFEA_ArbitraryVolume3dElementCoordinateSystem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aCoordinateSystem:
	:type aCoordinateSystem: Handle_StepFEA_FeaAxis2Placement3d &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepFEA_FeaAxis2Placement3d & aCoordinateSystem);
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "	* Returns field CoordinateSystem

	:rtype: Handle_StepFEA_FeaAxis2Placement3d
") CoordinateSystem;
		Handle_StepFEA_FeaAxis2Placement3d CoordinateSystem ();
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "	* Set field CoordinateSystem

	:param CoordinateSystem:
	:type CoordinateSystem: Handle_StepFEA_FeaAxis2Placement3d &
	:rtype: None
") SetCoordinateSystem;
		void SetCoordinateSystem (const Handle_StepFEA_FeaAxis2Placement3d & CoordinateSystem);
};


%extend StepFEA_ArbitraryVolume3dElementCoordinateSystem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem::Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem;
class Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem : public Handle_StepFEA_FeaRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem();
        Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem(const Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem &aHandle);
        Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem(const StepFEA_ArbitraryVolume3dElementCoordinateSystem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem {
    StepFEA_ArbitraryVolume3dElementCoordinateSystem* _get_reference() {
    return (StepFEA_ArbitraryVolume3dElementCoordinateSystem*)$self->Access();
    }
};

%extend Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_ArbitraryVolume3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_ConstantSurface3dElementCoordinateSystem;
class StepFEA_ConstantSurface3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_ConstantSurface3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_ConstantSurface3dElementCoordinateSystem;
		 StepFEA_ConstantSurface3dElementCoordinateSystem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aAxis:
	:type aAxis: int
	:param aAngle:
	:type aAngle: float
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Standard_Integer aAxis,const Standard_Real aAngle);
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns field Axis

	:rtype: int
") Axis;
		Standard_Integer Axis ();
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Set field Axis

	:param Axis:
	:type Axis: int
	:rtype: None
") SetAxis;
		void SetAxis (const Standard_Integer Axis);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Returns field Angle

	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* Set field Angle

	:param Angle:
	:type Angle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real Angle);
};


%extend StepFEA_ConstantSurface3dElementCoordinateSystem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_ConstantSurface3dElementCoordinateSystem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_ConstantSurface3dElementCoordinateSystem::Handle_StepFEA_ConstantSurface3dElementCoordinateSystem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_ConstantSurface3dElementCoordinateSystem;
class Handle_StepFEA_ConstantSurface3dElementCoordinateSystem : public Handle_StepFEA_FeaRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_ConstantSurface3dElementCoordinateSystem();
        Handle_StepFEA_ConstantSurface3dElementCoordinateSystem(const Handle_StepFEA_ConstantSurface3dElementCoordinateSystem &aHandle);
        Handle_StepFEA_ConstantSurface3dElementCoordinateSystem(const StepFEA_ConstantSurface3dElementCoordinateSystem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_ConstantSurface3dElementCoordinateSystem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_ConstantSurface3dElementCoordinateSystem {
    StepFEA_ConstantSurface3dElementCoordinateSystem* _get_reference() {
    return (StepFEA_ConstantSurface3dElementCoordinateSystem*)$self->Access();
    }
};

%extend Handle_StepFEA_ConstantSurface3dElementCoordinateSystem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_ConstantSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_Curve3dElementRepresentation;
class StepFEA_Curve3dElementRepresentation : public StepFEA_ElementRepresentation {
	public:
		%feature("compactdefaultargs") StepFEA_Curve3dElementRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_Curve3dElementRepresentation;
		 StepFEA_Curve3dElementRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentation_Name:
	:type aRepresentation_Name: Handle_TCollection_HAsciiString &
	:param aRepresentation_Items:
	:type aRepresentation_Items: Handle_StepRepr_HArray1OfRepresentationItem &
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: Handle_StepRepr_RepresentationContext &
	:param aElementRepresentation_NodeList:
	:type aElementRepresentation_NodeList: Handle_StepFEA_HArray1OfNodeRepresentation &
	:param aModelRef:
	:type aModelRef: Handle_StepFEA_FeaModel3d &
	:param aElementDescriptor:
	:type aElementDescriptor: Handle_StepElement_Curve3dElementDescriptor &
	:param aProperty:
	:type aProperty: Handle_StepFEA_Curve3dElementProperty &
	:param aMaterial:
	:type aMaterial: Handle_StepElement_ElementMaterial &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentation_Name,const Handle_StepRepr_HArray1OfRepresentationItem & aRepresentation_Items,const Handle_StepRepr_RepresentationContext & aRepresentation_ContextOfItems,const Handle_StepFEA_HArray1OfNodeRepresentation & aElementRepresentation_NodeList,const Handle_StepFEA_FeaModel3d & aModelRef,const Handle_StepElement_Curve3dElementDescriptor & aElementDescriptor,const Handle_StepFEA_Curve3dElementProperty & aProperty,const Handle_StepElement_ElementMaterial & aMaterial);
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "	* Returns field ModelRef

	:rtype: Handle_StepFEA_FeaModel3d
") ModelRef;
		Handle_StepFEA_FeaModel3d ModelRef ();
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "	* Set field ModelRef

	:param ModelRef:
	:type ModelRef: Handle_StepFEA_FeaModel3d &
	:rtype: None
") SetModelRef;
		void SetModelRef (const Handle_StepFEA_FeaModel3d & ModelRef);
		%feature("compactdefaultargs") ElementDescriptor;
		%feature("autodoc", "	* Returns field ElementDescriptor

	:rtype: Handle_StepElement_Curve3dElementDescriptor
") ElementDescriptor;
		Handle_StepElement_Curve3dElementDescriptor ElementDescriptor ();
		%feature("compactdefaultargs") SetElementDescriptor;
		%feature("autodoc", "	* Set field ElementDescriptor

	:param ElementDescriptor:
	:type ElementDescriptor: Handle_StepElement_Curve3dElementDescriptor &
	:rtype: None
") SetElementDescriptor;
		void SetElementDescriptor (const Handle_StepElement_Curve3dElementDescriptor & ElementDescriptor);
		%feature("compactdefaultargs") Property;
		%feature("autodoc", "	* Returns field Property

	:rtype: Handle_StepFEA_Curve3dElementProperty
") Property;
		Handle_StepFEA_Curve3dElementProperty Property ();
		%feature("compactdefaultargs") SetProperty;
		%feature("autodoc", "	* Set field Property

	:param Property:
	:type Property: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") SetProperty;
		void SetProperty (const Handle_StepFEA_Curve3dElementProperty & Property);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* Returns field Material

	:rtype: Handle_StepElement_ElementMaterial
") Material;
		Handle_StepElement_ElementMaterial Material ();
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Set field Material

	:param Material:
	:type Material: Handle_StepElement_ElementMaterial &
	:rtype: None
") SetMaterial;
		void SetMaterial (const Handle_StepElement_ElementMaterial & Material);
};


%extend StepFEA_Curve3dElementRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_Curve3dElementRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_Curve3dElementRepresentation::Handle_StepFEA_Curve3dElementRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_Curve3dElementRepresentation;
class Handle_StepFEA_Curve3dElementRepresentation : public Handle_StepFEA_ElementRepresentation {

    public:
        // constructors
        Handle_StepFEA_Curve3dElementRepresentation();
        Handle_StepFEA_Curve3dElementRepresentation(const Handle_StepFEA_Curve3dElementRepresentation &aHandle);
        Handle_StepFEA_Curve3dElementRepresentation(const StepFEA_Curve3dElementRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_Curve3dElementRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_Curve3dElementRepresentation {
    StepFEA_Curve3dElementRepresentation* _get_reference() {
    return (StepFEA_Curve3dElementRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_Curve3dElementRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_Curve3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_CurveElementIntervalConstant;
class StepFEA_CurveElementIntervalConstant : public StepFEA_CurveElementInterval {
	public:
		%feature("compactdefaultargs") StepFEA_CurveElementIntervalConstant;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_CurveElementIntervalConstant;
		 StepFEA_CurveElementIntervalConstant ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aCurveElementInterval_FinishPosition:
	:type aCurveElementInterval_FinishPosition: Handle_StepFEA_CurveElementLocation &
	:param aCurveElementInterval_EuAngles:
	:type aCurveElementInterval_EuAngles: Handle_StepBasic_EulerAngles &
	:param aSection:
	:type aSection: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_CurveElementLocation & aCurveElementInterval_FinishPosition,const Handle_StepBasic_EulerAngles & aCurveElementInterval_EuAngles,const Handle_StepElement_CurveElementSectionDefinition & aSection);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Returns field Section

	:rtype: Handle_StepElement_CurveElementSectionDefinition
") Section;
		Handle_StepElement_CurveElementSectionDefinition Section ();
		%feature("compactdefaultargs") SetSection;
		%feature("autodoc", "	* Set field Section

	:param Section:
	:type Section: Handle_StepElement_CurveElementSectionDefinition &
	:rtype: None
") SetSection;
		void SetSection (const Handle_StepElement_CurveElementSectionDefinition & Section);
};


%extend StepFEA_CurveElementIntervalConstant {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_CurveElementIntervalConstant(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_CurveElementIntervalConstant::Handle_StepFEA_CurveElementIntervalConstant %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_CurveElementIntervalConstant;
class Handle_StepFEA_CurveElementIntervalConstant : public Handle_StepFEA_CurveElementInterval {

    public:
        // constructors
        Handle_StepFEA_CurveElementIntervalConstant();
        Handle_StepFEA_CurveElementIntervalConstant(const Handle_StepFEA_CurveElementIntervalConstant &aHandle);
        Handle_StepFEA_CurveElementIntervalConstant(const StepFEA_CurveElementIntervalConstant *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_CurveElementIntervalConstant DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_CurveElementIntervalConstant {
    StepFEA_CurveElementIntervalConstant* _get_reference() {
    return (StepFEA_CurveElementIntervalConstant*)$self->Access();
    }
};

%extend Handle_StepFEA_CurveElementIntervalConstant {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_CurveElementIntervalConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_CurveElementIntervalLinearlyVarying;
class StepFEA_CurveElementIntervalLinearlyVarying : public StepFEA_CurveElementInterval {
	public:
		%feature("compactdefaultargs") StepFEA_CurveElementIntervalLinearlyVarying;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_CurveElementIntervalLinearlyVarying;
		 StepFEA_CurveElementIntervalLinearlyVarying ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aCurveElementInterval_FinishPosition:
	:type aCurveElementInterval_FinishPosition: Handle_StepFEA_CurveElementLocation &
	:param aCurveElementInterval_EuAngles:
	:type aCurveElementInterval_EuAngles: Handle_StepBasic_EulerAngles &
	:param aSections:
	:type aSections: Handle_StepElement_HArray1OfCurveElementSectionDefinition &
	:rtype: None
") Init;
		void Init (const Handle_StepFEA_CurveElementLocation & aCurveElementInterval_FinishPosition,const Handle_StepBasic_EulerAngles & aCurveElementInterval_EuAngles,const Handle_StepElement_HArray1OfCurveElementSectionDefinition & aSections);
		%feature("compactdefaultargs") Sections;
		%feature("autodoc", "	* Returns field Sections

	:rtype: Handle_StepElement_HArray1OfCurveElementSectionDefinition
") Sections;
		Handle_StepElement_HArray1OfCurveElementSectionDefinition Sections ();
		%feature("compactdefaultargs") SetSections;
		%feature("autodoc", "	* Set field Sections

	:param Sections:
	:type Sections: Handle_StepElement_HArray1OfCurveElementSectionDefinition &
	:rtype: None
") SetSections;
		void SetSections (const Handle_StepElement_HArray1OfCurveElementSectionDefinition & Sections);
};


%extend StepFEA_CurveElementIntervalLinearlyVarying {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_CurveElementIntervalLinearlyVarying(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_CurveElementIntervalLinearlyVarying::Handle_StepFEA_CurveElementIntervalLinearlyVarying %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_CurveElementIntervalLinearlyVarying;
class Handle_StepFEA_CurveElementIntervalLinearlyVarying : public Handle_StepFEA_CurveElementInterval {

    public:
        // constructors
        Handle_StepFEA_CurveElementIntervalLinearlyVarying();
        Handle_StepFEA_CurveElementIntervalLinearlyVarying(const Handle_StepFEA_CurveElementIntervalLinearlyVarying &aHandle);
        Handle_StepFEA_CurveElementIntervalLinearlyVarying(const StepFEA_CurveElementIntervalLinearlyVarying *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_CurveElementIntervalLinearlyVarying DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_CurveElementIntervalLinearlyVarying {
    StepFEA_CurveElementIntervalLinearlyVarying* _get_reference() {
    return (StepFEA_CurveElementIntervalLinearlyVarying*)$self->Access();
    }
};

%extend Handle_StepFEA_CurveElementIntervalLinearlyVarying {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_CurveElementIntervalLinearlyVarying {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_DummyNode;
class StepFEA_DummyNode : public StepFEA_NodeRepresentation {
	public:
		%feature("compactdefaultargs") StepFEA_DummyNode;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_DummyNode;
		 StepFEA_DummyNode ();
};


%extend StepFEA_DummyNode {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_DummyNode(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_DummyNode::Handle_StepFEA_DummyNode %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_DummyNode;
class Handle_StepFEA_DummyNode : public Handle_StepFEA_NodeRepresentation {

    public:
        // constructors
        Handle_StepFEA_DummyNode();
        Handle_StepFEA_DummyNode(const Handle_StepFEA_DummyNode &aHandle);
        Handle_StepFEA_DummyNode(const StepFEA_DummyNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_DummyNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_DummyNode {
    StepFEA_DummyNode* _get_reference() {
    return (StepFEA_DummyNode*)$self->Access();
    }
};

%extend Handle_StepFEA_DummyNode {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_DummyNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_ElementGroup;
class StepFEA_ElementGroup : public StepFEA_FeaGroup {
	public:
		%feature("compactdefaultargs") StepFEA_ElementGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_ElementGroup;
		 StepFEA_ElementGroup ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aGroup_Name:
	:type aGroup_Name: Handle_TCollection_HAsciiString &
	:param aGroup_Description:
	:type aGroup_Description: Handle_TCollection_HAsciiString &
	:param aFeaGroup_ModelRef:
	:type aFeaGroup_ModelRef: Handle_StepFEA_FeaModel &
	:param aElements:
	:type aElements: Handle_StepFEA_HArray1OfElementRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aGroup_Name,const Handle_TCollection_HAsciiString & aGroup_Description,const Handle_StepFEA_FeaModel & aFeaGroup_ModelRef,const Handle_StepFEA_HArray1OfElementRepresentation & aElements);
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "	* Returns field Elements

	:rtype: Handle_StepFEA_HArray1OfElementRepresentation
") Elements;
		Handle_StepFEA_HArray1OfElementRepresentation Elements ();
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "	* Set field Elements

	:param Elements:
	:type Elements: Handle_StepFEA_HArray1OfElementRepresentation &
	:rtype: None
") SetElements;
		void SetElements (const Handle_StepFEA_HArray1OfElementRepresentation & Elements);
};


%extend StepFEA_ElementGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_ElementGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_ElementGroup::Handle_StepFEA_ElementGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_ElementGroup;
class Handle_StepFEA_ElementGroup : public Handle_StepFEA_FeaGroup {

    public:
        // constructors
        Handle_StepFEA_ElementGroup();
        Handle_StepFEA_ElementGroup(const Handle_StepFEA_ElementGroup &aHandle);
        Handle_StepFEA_ElementGroup(const StepFEA_ElementGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_ElementGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_ElementGroup {
    StepFEA_ElementGroup* _get_reference() {
    return (StepFEA_ElementGroup*)$self->Access();
    }
};

%extend Handle_StepFEA_ElementGroup {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_ElementGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaAreaDensity;
class StepFEA_FeaAreaDensity : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaAreaDensity;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaAreaDensity;
		 StepFEA_FeaAreaDensity ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFeaConstant:
	:type aFeaConstant: float
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Standard_Real aFeaConstant);
		%feature("compactdefaultargs") FeaConstant;
		%feature("autodoc", "	* Returns field FeaConstant

	:rtype: float
") FeaConstant;
		Standard_Real FeaConstant ();
		%feature("compactdefaultargs") SetFeaConstant;
		%feature("autodoc", "	* Set field FeaConstant

	:param FeaConstant:
	:type FeaConstant: float
	:rtype: None
") SetFeaConstant;
		void SetFeaConstant (const Standard_Real FeaConstant);
};


%extend StepFEA_FeaAreaDensity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaAreaDensity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaAreaDensity::Handle_StepFEA_FeaAreaDensity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaAreaDensity;
class Handle_StepFEA_FeaAreaDensity : public Handle_StepFEA_FeaMaterialPropertyRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaAreaDensity();
        Handle_StepFEA_FeaAreaDensity(const Handle_StepFEA_FeaAreaDensity &aHandle);
        Handle_StepFEA_FeaAreaDensity(const StepFEA_FeaAreaDensity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaAreaDensity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaAreaDensity {
    StepFEA_FeaAreaDensity* _get_reference() {
    return (StepFEA_FeaAreaDensity*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaAreaDensity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaAreaDensity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaLinearElasticity;
class StepFEA_FeaLinearElasticity : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaLinearElasticity;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaLinearElasticity;
		 StepFEA_FeaLinearElasticity ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor43d &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const StepFEA_SymmetricTensor43d & aFeaConstants);
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "	* Returns field FeaConstants

	:rtype: StepFEA_SymmetricTensor43d
") FeaConstants;
		StepFEA_SymmetricTensor43d FeaConstants ();
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "	* Set field FeaConstants

	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor43d &
	:rtype: None
") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor43d & FeaConstants);
};


%extend StepFEA_FeaLinearElasticity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaLinearElasticity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaLinearElasticity::Handle_StepFEA_FeaLinearElasticity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaLinearElasticity;
class Handle_StepFEA_FeaLinearElasticity : public Handle_StepFEA_FeaMaterialPropertyRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaLinearElasticity();
        Handle_StepFEA_FeaLinearElasticity(const Handle_StepFEA_FeaLinearElasticity &aHandle);
        Handle_StepFEA_FeaLinearElasticity(const StepFEA_FeaLinearElasticity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaLinearElasticity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaLinearElasticity {
    StepFEA_FeaLinearElasticity* _get_reference() {
    return (StepFEA_FeaLinearElasticity*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaLinearElasticity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaLinearElasticity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaMassDensity;
class StepFEA_FeaMassDensity : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaMassDensity;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaMassDensity;
		 StepFEA_FeaMassDensity ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFeaConstant:
	:type aFeaConstant: float
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Standard_Real aFeaConstant);
		%feature("compactdefaultargs") FeaConstant;
		%feature("autodoc", "	* Returns field FeaConstant

	:rtype: float
") FeaConstant;
		Standard_Real FeaConstant ();
		%feature("compactdefaultargs") SetFeaConstant;
		%feature("autodoc", "	* Set field FeaConstant

	:param FeaConstant:
	:type FeaConstant: float
	:rtype: None
") SetFeaConstant;
		void SetFeaConstant (const Standard_Real FeaConstant);
};


%extend StepFEA_FeaMassDensity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaMassDensity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaMassDensity::Handle_StepFEA_FeaMassDensity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaMassDensity;
class Handle_StepFEA_FeaMassDensity : public Handle_StepFEA_FeaMaterialPropertyRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaMassDensity();
        Handle_StepFEA_FeaMassDensity(const Handle_StepFEA_FeaMassDensity &aHandle);
        Handle_StepFEA_FeaMassDensity(const StepFEA_FeaMassDensity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaMassDensity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaMassDensity {
    StepFEA_FeaMassDensity* _get_reference() {
    return (StepFEA_FeaMassDensity*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaMassDensity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaMassDensity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaModel3d;
class StepFEA_FeaModel3d : public StepFEA_FeaModel {
	public:
		%feature("compactdefaultargs") StepFEA_FeaModel3d;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaModel3d;
		 StepFEA_FeaModel3d ();
};


%extend StepFEA_FeaModel3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaModel3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaModel3d::Handle_StepFEA_FeaModel3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaModel3d;
class Handle_StepFEA_FeaModel3d : public Handle_StepFEA_FeaModel {

    public:
        // constructors
        Handle_StepFEA_FeaModel3d();
        Handle_StepFEA_FeaModel3d(const Handle_StepFEA_FeaModel3d &aHandle);
        Handle_StepFEA_FeaModel3d(const StepFEA_FeaModel3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaModel3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaModel3d {
    StepFEA_FeaModel3d* _get_reference() {
    return (StepFEA_FeaModel3d*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaModel3d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaModel3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaMoistureAbsorption;
class StepFEA_FeaMoistureAbsorption : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaMoistureAbsorption;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaMoistureAbsorption;
		 StepFEA_FeaMoistureAbsorption ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor23d &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const StepFEA_SymmetricTensor23d & aFeaConstants);
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "	* Returns field FeaConstants

	:rtype: StepFEA_SymmetricTensor23d
") FeaConstants;
		StepFEA_SymmetricTensor23d FeaConstants ();
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "	* Set field FeaConstants

	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor23d &
	:rtype: None
") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor23d & FeaConstants);
};


%extend StepFEA_FeaMoistureAbsorption {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaMoistureAbsorption(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaMoistureAbsorption::Handle_StepFEA_FeaMoistureAbsorption %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaMoistureAbsorption;
class Handle_StepFEA_FeaMoistureAbsorption : public Handle_StepFEA_FeaMaterialPropertyRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaMoistureAbsorption();
        Handle_StepFEA_FeaMoistureAbsorption(const Handle_StepFEA_FeaMoistureAbsorption &aHandle);
        Handle_StepFEA_FeaMoistureAbsorption(const StepFEA_FeaMoistureAbsorption *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaMoistureAbsorption DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaMoistureAbsorption {
    StepFEA_FeaMoistureAbsorption* _get_reference() {
    return (StepFEA_FeaMoistureAbsorption*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaMoistureAbsorption {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaMoistureAbsorption {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaSecantCoefficientOfLinearThermalExpansion;
class StepFEA_FeaSecantCoefficientOfLinearThermalExpansion : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaSecantCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaSecantCoefficientOfLinearThermalExpansion;
		 StepFEA_FeaSecantCoefficientOfLinearThermalExpansion ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor23d &
	:param aReferenceTemperature:
	:type aReferenceTemperature: float
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const StepFEA_SymmetricTensor23d & aFeaConstants,const Standard_Real aReferenceTemperature);
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "	* Returns field FeaConstants

	:rtype: StepFEA_SymmetricTensor23d
") FeaConstants;
		StepFEA_SymmetricTensor23d FeaConstants ();
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "	* Set field FeaConstants

	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor23d &
	:rtype: None
") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor23d & FeaConstants);
		%feature("compactdefaultargs") ReferenceTemperature;
		%feature("autodoc", "	* Returns field ReferenceTemperature

	:rtype: float
") ReferenceTemperature;
		Standard_Real ReferenceTemperature ();
		%feature("compactdefaultargs") SetReferenceTemperature;
		%feature("autodoc", "	* Set field ReferenceTemperature

	:param ReferenceTemperature:
	:type ReferenceTemperature: float
	:rtype: None
") SetReferenceTemperature;
		void SetReferenceTemperature (const Standard_Real ReferenceTemperature);
};


%extend StepFEA_FeaSecantCoefficientOfLinearThermalExpansion {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion::Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion;
class Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion : public Handle_StepFEA_FeaMaterialPropertyRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion();
        Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion(const Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion &aHandle);
        Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion(const StepFEA_FeaSecantCoefficientOfLinearThermalExpansion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion {
    StepFEA_FeaSecantCoefficientOfLinearThermalExpansion* _get_reference() {
    return (StepFEA_FeaSecantCoefficientOfLinearThermalExpansion*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaSecantCoefficientOfLinearThermalExpansion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaShellBendingStiffness;
class StepFEA_FeaShellBendingStiffness : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaShellBendingStiffness;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaShellBendingStiffness;
		 StepFEA_FeaShellBendingStiffness ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor42d &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const StepFEA_SymmetricTensor42d & aFeaConstants);
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "	* Returns field FeaConstants

	:rtype: StepFEA_SymmetricTensor42d
") FeaConstants;
		StepFEA_SymmetricTensor42d FeaConstants ();
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "	* Set field FeaConstants

	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor42d &
	:rtype: None
") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor42d & FeaConstants);
};


%extend StepFEA_FeaShellBendingStiffness {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaShellBendingStiffness(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaShellBendingStiffness::Handle_StepFEA_FeaShellBendingStiffness %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaShellBendingStiffness;
class Handle_StepFEA_FeaShellBendingStiffness : public Handle_StepFEA_FeaMaterialPropertyRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaShellBendingStiffness();
        Handle_StepFEA_FeaShellBendingStiffness(const Handle_StepFEA_FeaShellBendingStiffness &aHandle);
        Handle_StepFEA_FeaShellBendingStiffness(const StepFEA_FeaShellBendingStiffness *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaShellBendingStiffness DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaShellBendingStiffness {
    StepFEA_FeaShellBendingStiffness* _get_reference() {
    return (StepFEA_FeaShellBendingStiffness*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaShellBendingStiffness {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaShellBendingStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaShellMembraneBendingCouplingStiffness;
class StepFEA_FeaShellMembraneBendingCouplingStiffness : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaShellMembraneBendingCouplingStiffness;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaShellMembraneBendingCouplingStiffness;
		 StepFEA_FeaShellMembraneBendingCouplingStiffness ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor42d &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const StepFEA_SymmetricTensor42d & aFeaConstants);
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "	* Returns field FeaConstants

	:rtype: StepFEA_SymmetricTensor42d
") FeaConstants;
		StepFEA_SymmetricTensor42d FeaConstants ();
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "	* Set field FeaConstants

	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor42d &
	:rtype: None
") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor42d & FeaConstants);
};


%extend StepFEA_FeaShellMembraneBendingCouplingStiffness {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness::Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness;
class Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness : public Handle_StepFEA_FeaMaterialPropertyRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness();
        Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness(const Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness &aHandle);
        Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness(const StepFEA_FeaShellMembraneBendingCouplingStiffness *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness {
    StepFEA_FeaShellMembraneBendingCouplingStiffness* _get_reference() {
    return (StepFEA_FeaShellMembraneBendingCouplingStiffness*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaShellMembraneBendingCouplingStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaShellMembraneStiffness;
class StepFEA_FeaShellMembraneStiffness : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaShellMembraneStiffness;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaShellMembraneStiffness;
		 StepFEA_FeaShellMembraneStiffness ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor42d &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const StepFEA_SymmetricTensor42d & aFeaConstants);
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "	* Returns field FeaConstants

	:rtype: StepFEA_SymmetricTensor42d
") FeaConstants;
		StepFEA_SymmetricTensor42d FeaConstants ();
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "	* Set field FeaConstants

	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor42d &
	:rtype: None
") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor42d & FeaConstants);
};


%extend StepFEA_FeaShellMembraneStiffness {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaShellMembraneStiffness(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaShellMembraneStiffness::Handle_StepFEA_FeaShellMembraneStiffness %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaShellMembraneStiffness;
class Handle_StepFEA_FeaShellMembraneStiffness : public Handle_StepFEA_FeaMaterialPropertyRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaShellMembraneStiffness();
        Handle_StepFEA_FeaShellMembraneStiffness(const Handle_StepFEA_FeaShellMembraneStiffness &aHandle);
        Handle_StepFEA_FeaShellMembraneStiffness(const StepFEA_FeaShellMembraneStiffness *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaShellMembraneStiffness DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaShellMembraneStiffness {
    StepFEA_FeaShellMembraneStiffness* _get_reference() {
    return (StepFEA_FeaShellMembraneStiffness*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaShellMembraneStiffness {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaShellMembraneStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaShellShearStiffness;
class StepFEA_FeaShellShearStiffness : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaShellShearStiffness;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaShellShearStiffness;
		 StepFEA_FeaShellShearStiffness ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor22d &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const StepFEA_SymmetricTensor22d & aFeaConstants);
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "	* Returns field FeaConstants

	:rtype: StepFEA_SymmetricTensor22d
") FeaConstants;
		StepFEA_SymmetricTensor22d FeaConstants ();
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "	* Set field FeaConstants

	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor22d &
	:rtype: None
") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor22d & FeaConstants);
};


%extend StepFEA_FeaShellShearStiffness {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaShellShearStiffness(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaShellShearStiffness::Handle_StepFEA_FeaShellShearStiffness %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaShellShearStiffness;
class Handle_StepFEA_FeaShellShearStiffness : public Handle_StepFEA_FeaMaterialPropertyRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaShellShearStiffness();
        Handle_StepFEA_FeaShellShearStiffness(const Handle_StepFEA_FeaShellShearStiffness &aHandle);
        Handle_StepFEA_FeaShellShearStiffness(const StepFEA_FeaShellShearStiffness *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaShellShearStiffness DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaShellShearStiffness {
    StepFEA_FeaShellShearStiffness* _get_reference() {
    return (StepFEA_FeaShellShearStiffness*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaShellShearStiffness {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaShellShearStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion;
class StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion;
		 StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor23d &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const StepFEA_SymmetricTensor23d & aFeaConstants);
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "	* Returns field FeaConstants

	:rtype: StepFEA_SymmetricTensor23d
") FeaConstants;
		StepFEA_SymmetricTensor23d FeaConstants ();
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "	* Set field FeaConstants

	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor23d &
	:rtype: None
") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor23d & FeaConstants);
};


%extend StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion::Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion;
class Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion : public Handle_StepFEA_FeaMaterialPropertyRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion();
        Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion(const Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion &aHandle);
        Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion(const StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion {
    StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion* _get_reference() {
    return (StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion*)$self->Access();
    }
};

%extend Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_GeometricNode;
class StepFEA_GeometricNode : public StepFEA_NodeRepresentation {
	public:
		%feature("compactdefaultargs") StepFEA_GeometricNode;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_GeometricNode;
		 StepFEA_GeometricNode ();
};


%extend StepFEA_GeometricNode {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_GeometricNode(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_GeometricNode::Handle_StepFEA_GeometricNode %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_GeometricNode;
class Handle_StepFEA_GeometricNode : public Handle_StepFEA_NodeRepresentation {

    public:
        // constructors
        Handle_StepFEA_GeometricNode();
        Handle_StepFEA_GeometricNode(const Handle_StepFEA_GeometricNode &aHandle);
        Handle_StepFEA_GeometricNode(const StepFEA_GeometricNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_GeometricNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_GeometricNode {
    StepFEA_GeometricNode* _get_reference() {
    return (StepFEA_GeometricNode*)$self->Access();
    }
};

%extend Handle_StepFEA_GeometricNode {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_GeometricNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_Node;
class StepFEA_Node : public StepFEA_NodeRepresentation {
	public:
		%feature("compactdefaultargs") StepFEA_Node;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_Node;
		 StepFEA_Node ();
};


%extend StepFEA_Node {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_Node(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_Node::Handle_StepFEA_Node %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_Node;
class Handle_StepFEA_Node : public Handle_StepFEA_NodeRepresentation {

    public:
        // constructors
        Handle_StepFEA_Node();
        Handle_StepFEA_Node(const Handle_StepFEA_Node &aHandle);
        Handle_StepFEA_Node(const StepFEA_Node *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_Node DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_Node {
    StepFEA_Node* _get_reference() {
    return (StepFEA_Node*)$self->Access();
    }
};

%extend Handle_StepFEA_Node {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_Node {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_NodeGroup;
class StepFEA_NodeGroup : public StepFEA_FeaGroup {
	public:
		%feature("compactdefaultargs") StepFEA_NodeGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_NodeGroup;
		 StepFEA_NodeGroup ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aGroup_Name:
	:type aGroup_Name: Handle_TCollection_HAsciiString &
	:param aGroup_Description:
	:type aGroup_Description: Handle_TCollection_HAsciiString &
	:param aFeaGroup_ModelRef:
	:type aFeaGroup_ModelRef: Handle_StepFEA_FeaModel &
	:param aNodes:
	:type aNodes: Handle_StepFEA_HArray1OfNodeRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aGroup_Name,const Handle_TCollection_HAsciiString & aGroup_Description,const Handle_StepFEA_FeaModel & aFeaGroup_ModelRef,const Handle_StepFEA_HArray1OfNodeRepresentation & aNodes);
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "	* Returns field Nodes

	:rtype: Handle_StepFEA_HArray1OfNodeRepresentation
") Nodes;
		Handle_StepFEA_HArray1OfNodeRepresentation Nodes ();
		%feature("compactdefaultargs") SetNodes;
		%feature("autodoc", "	* Set field Nodes

	:param Nodes:
	:type Nodes: Handle_StepFEA_HArray1OfNodeRepresentation &
	:rtype: None
") SetNodes;
		void SetNodes (const Handle_StepFEA_HArray1OfNodeRepresentation & Nodes);
};


%extend StepFEA_NodeGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_NodeGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_NodeGroup::Handle_StepFEA_NodeGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_NodeGroup;
class Handle_StepFEA_NodeGroup : public Handle_StepFEA_FeaGroup {

    public:
        // constructors
        Handle_StepFEA_NodeGroup();
        Handle_StepFEA_NodeGroup(const Handle_StepFEA_NodeGroup &aHandle);
        Handle_StepFEA_NodeGroup(const StepFEA_NodeGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_NodeGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_NodeGroup {
    StepFEA_NodeGroup* _get_reference() {
    return (StepFEA_NodeGroup*)$self->Access();
    }
};

%extend Handle_StepFEA_NodeGroup {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_NodeGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_ParametricCurve3dElementCoordinateDirection;
class StepFEA_ParametricCurve3dElementCoordinateDirection : public StepFEA_FeaRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_ParametricCurve3dElementCoordinateDirection;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_ParametricCurve3dElementCoordinateDirection;
		 StepFEA_ParametricCurve3dElementCoordinateDirection ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aOrientation:
	:type aOrientation: Handle_StepGeom_Direction &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepGeom_Direction & aOrientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Returns field Orientation

	:rtype: Handle_StepGeom_Direction
") Orientation;
		Handle_StepGeom_Direction Orientation ();
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	* Set field Orientation

	:param Orientation:
	:type Orientation: Handle_StepGeom_Direction &
	:rtype: None
") SetOrientation;
		void SetOrientation (const Handle_StepGeom_Direction & Orientation);
};


%extend StepFEA_ParametricCurve3dElementCoordinateDirection {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_ParametricCurve3dElementCoordinateDirection(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_ParametricCurve3dElementCoordinateDirection::Handle_StepFEA_ParametricCurve3dElementCoordinateDirection %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_ParametricCurve3dElementCoordinateDirection;
class Handle_StepFEA_ParametricCurve3dElementCoordinateDirection : public Handle_StepFEA_FeaRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_ParametricCurve3dElementCoordinateDirection();
        Handle_StepFEA_ParametricCurve3dElementCoordinateDirection(const Handle_StepFEA_ParametricCurve3dElementCoordinateDirection &aHandle);
        Handle_StepFEA_ParametricCurve3dElementCoordinateDirection(const StepFEA_ParametricCurve3dElementCoordinateDirection *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_ParametricCurve3dElementCoordinateDirection DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_ParametricCurve3dElementCoordinateDirection {
    StepFEA_ParametricCurve3dElementCoordinateDirection* _get_reference() {
    return (StepFEA_ParametricCurve3dElementCoordinateDirection*)$self->Access();
    }
};

%extend Handle_StepFEA_ParametricCurve3dElementCoordinateDirection {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_ParametricCurve3dElementCoordinateDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_ParametricCurve3dElementCoordinateSystem;
class StepFEA_ParametricCurve3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_ParametricCurve3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_ParametricCurve3dElementCoordinateSystem;
		 StepFEA_ParametricCurve3dElementCoordinateSystem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aDirection:
	:type aDirection: Handle_StepFEA_ParametricCurve3dElementCoordinateDirection &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepFEA_ParametricCurve3dElementCoordinateDirection & aDirection);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns field Direction

	:rtype: Handle_StepFEA_ParametricCurve3dElementCoordinateDirection
") Direction;
		Handle_StepFEA_ParametricCurve3dElementCoordinateDirection Direction ();
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Set field Direction

	:param Direction:
	:type Direction: Handle_StepFEA_ParametricCurve3dElementCoordinateDirection &
	:rtype: None
") SetDirection;
		void SetDirection (const Handle_StepFEA_ParametricCurve3dElementCoordinateDirection & Direction);
};


%extend StepFEA_ParametricCurve3dElementCoordinateSystem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_ParametricCurve3dElementCoordinateSystem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_ParametricCurve3dElementCoordinateSystem::Handle_StepFEA_ParametricCurve3dElementCoordinateSystem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_ParametricCurve3dElementCoordinateSystem;
class Handle_StepFEA_ParametricCurve3dElementCoordinateSystem : public Handle_StepFEA_FeaRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_ParametricCurve3dElementCoordinateSystem();
        Handle_StepFEA_ParametricCurve3dElementCoordinateSystem(const Handle_StepFEA_ParametricCurve3dElementCoordinateSystem &aHandle);
        Handle_StepFEA_ParametricCurve3dElementCoordinateSystem(const StepFEA_ParametricCurve3dElementCoordinateSystem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_ParametricCurve3dElementCoordinateSystem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_ParametricCurve3dElementCoordinateSystem {
    StepFEA_ParametricCurve3dElementCoordinateSystem* _get_reference() {
    return (StepFEA_ParametricCurve3dElementCoordinateSystem*)$self->Access();
    }
};

%extend Handle_StepFEA_ParametricCurve3dElementCoordinateSystem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_ParametricCurve3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_ParametricSurface3dElementCoordinateSystem;
class StepFEA_ParametricSurface3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		%feature("compactdefaultargs") StepFEA_ParametricSurface3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_ParametricSurface3dElementCoordinateSystem;
		 StepFEA_ParametricSurface3dElementCoordinateSystem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aAxis:
	:type aAxis: int
	:param aAngle:
	:type aAngle: float
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Standard_Integer aAxis,const Standard_Real aAngle);
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns field Axis

	:rtype: int
") Axis;
		Standard_Integer Axis ();
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Set field Axis

	:param Axis:
	:type Axis: int
	:rtype: None
") SetAxis;
		void SetAxis (const Standard_Integer Axis);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Returns field Angle

	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* Set field Angle

	:param Angle:
	:type Angle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real Angle);
};


%extend StepFEA_ParametricSurface3dElementCoordinateSystem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_ParametricSurface3dElementCoordinateSystem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_ParametricSurface3dElementCoordinateSystem::Handle_StepFEA_ParametricSurface3dElementCoordinateSystem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_ParametricSurface3dElementCoordinateSystem;
class Handle_StepFEA_ParametricSurface3dElementCoordinateSystem : public Handle_StepFEA_FeaRepresentationItem {

    public:
        // constructors
        Handle_StepFEA_ParametricSurface3dElementCoordinateSystem();
        Handle_StepFEA_ParametricSurface3dElementCoordinateSystem(const Handle_StepFEA_ParametricSurface3dElementCoordinateSystem &aHandle);
        Handle_StepFEA_ParametricSurface3dElementCoordinateSystem(const StepFEA_ParametricSurface3dElementCoordinateSystem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_ParametricSurface3dElementCoordinateSystem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_ParametricSurface3dElementCoordinateSystem {
    StepFEA_ParametricSurface3dElementCoordinateSystem* _get_reference() {
    return (StepFEA_ParametricSurface3dElementCoordinateSystem*)$self->Access();
    }
};

%extend Handle_StepFEA_ParametricSurface3dElementCoordinateSystem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_ParametricSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_Surface3dElementRepresentation;
class StepFEA_Surface3dElementRepresentation : public StepFEA_ElementRepresentation {
	public:
		%feature("compactdefaultargs") StepFEA_Surface3dElementRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_Surface3dElementRepresentation;
		 StepFEA_Surface3dElementRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentation_Name:
	:type aRepresentation_Name: Handle_TCollection_HAsciiString &
	:param aRepresentation_Items:
	:type aRepresentation_Items: Handle_StepRepr_HArray1OfRepresentationItem &
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: Handle_StepRepr_RepresentationContext &
	:param aElementRepresentation_NodeList:
	:type aElementRepresentation_NodeList: Handle_StepFEA_HArray1OfNodeRepresentation &
	:param aModelRef:
	:type aModelRef: Handle_StepFEA_FeaModel3d &
	:param aElementDescriptor:
	:type aElementDescriptor: Handle_StepElement_Surface3dElementDescriptor &
	:param aProperty:
	:type aProperty: Handle_StepElement_SurfaceElementProperty &
	:param aMaterial:
	:type aMaterial: Handle_StepElement_ElementMaterial &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentation_Name,const Handle_StepRepr_HArray1OfRepresentationItem & aRepresentation_Items,const Handle_StepRepr_RepresentationContext & aRepresentation_ContextOfItems,const Handle_StepFEA_HArray1OfNodeRepresentation & aElementRepresentation_NodeList,const Handle_StepFEA_FeaModel3d & aModelRef,const Handle_StepElement_Surface3dElementDescriptor & aElementDescriptor,const Handle_StepElement_SurfaceElementProperty & aProperty,const Handle_StepElement_ElementMaterial & aMaterial);
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "	* Returns field ModelRef

	:rtype: Handle_StepFEA_FeaModel3d
") ModelRef;
		Handle_StepFEA_FeaModel3d ModelRef ();
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "	* Set field ModelRef

	:param ModelRef:
	:type ModelRef: Handle_StepFEA_FeaModel3d &
	:rtype: None
") SetModelRef;
		void SetModelRef (const Handle_StepFEA_FeaModel3d & ModelRef);
		%feature("compactdefaultargs") ElementDescriptor;
		%feature("autodoc", "	* Returns field ElementDescriptor

	:rtype: Handle_StepElement_Surface3dElementDescriptor
") ElementDescriptor;
		Handle_StepElement_Surface3dElementDescriptor ElementDescriptor ();
		%feature("compactdefaultargs") SetElementDescriptor;
		%feature("autodoc", "	* Set field ElementDescriptor

	:param ElementDescriptor:
	:type ElementDescriptor: Handle_StepElement_Surface3dElementDescriptor &
	:rtype: None
") SetElementDescriptor;
		void SetElementDescriptor (const Handle_StepElement_Surface3dElementDescriptor & ElementDescriptor);
		%feature("compactdefaultargs") Property;
		%feature("autodoc", "	* Returns field Property

	:rtype: Handle_StepElement_SurfaceElementProperty
") Property;
		Handle_StepElement_SurfaceElementProperty Property ();
		%feature("compactdefaultargs") SetProperty;
		%feature("autodoc", "	* Set field Property

	:param Property:
	:type Property: Handle_StepElement_SurfaceElementProperty &
	:rtype: None
") SetProperty;
		void SetProperty (const Handle_StepElement_SurfaceElementProperty & Property);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* Returns field Material

	:rtype: Handle_StepElement_ElementMaterial
") Material;
		Handle_StepElement_ElementMaterial Material ();
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Set field Material

	:param Material:
	:type Material: Handle_StepElement_ElementMaterial &
	:rtype: None
") SetMaterial;
		void SetMaterial (const Handle_StepElement_ElementMaterial & Material);
};


%extend StepFEA_Surface3dElementRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_Surface3dElementRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_Surface3dElementRepresentation::Handle_StepFEA_Surface3dElementRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_Surface3dElementRepresentation;
class Handle_StepFEA_Surface3dElementRepresentation : public Handle_StepFEA_ElementRepresentation {

    public:
        // constructors
        Handle_StepFEA_Surface3dElementRepresentation();
        Handle_StepFEA_Surface3dElementRepresentation(const Handle_StepFEA_Surface3dElementRepresentation &aHandle);
        Handle_StepFEA_Surface3dElementRepresentation(const StepFEA_Surface3dElementRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_Surface3dElementRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_Surface3dElementRepresentation {
    StepFEA_Surface3dElementRepresentation* _get_reference() {
    return (StepFEA_Surface3dElementRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_Surface3dElementRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_Surface3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_Volume3dElementRepresentation;
class StepFEA_Volume3dElementRepresentation : public StepFEA_ElementRepresentation {
	public:
		%feature("compactdefaultargs") StepFEA_Volume3dElementRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_Volume3dElementRepresentation;
		 StepFEA_Volume3dElementRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentation_Name:
	:type aRepresentation_Name: Handle_TCollection_HAsciiString &
	:param aRepresentation_Items:
	:type aRepresentation_Items: Handle_StepRepr_HArray1OfRepresentationItem &
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: Handle_StepRepr_RepresentationContext &
	:param aElementRepresentation_NodeList:
	:type aElementRepresentation_NodeList: Handle_StepFEA_HArray1OfNodeRepresentation &
	:param aModelRef:
	:type aModelRef: Handle_StepFEA_FeaModel3d &
	:param aElementDescriptor:
	:type aElementDescriptor: Handle_StepElement_Volume3dElementDescriptor &
	:param aMaterial:
	:type aMaterial: Handle_StepElement_ElementMaterial &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentation_Name,const Handle_StepRepr_HArray1OfRepresentationItem & aRepresentation_Items,const Handle_StepRepr_RepresentationContext & aRepresentation_ContextOfItems,const Handle_StepFEA_HArray1OfNodeRepresentation & aElementRepresentation_NodeList,const Handle_StepFEA_FeaModel3d & aModelRef,const Handle_StepElement_Volume3dElementDescriptor & aElementDescriptor,const Handle_StepElement_ElementMaterial & aMaterial);
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "	* Returns field ModelRef

	:rtype: Handle_StepFEA_FeaModel3d
") ModelRef;
		Handle_StepFEA_FeaModel3d ModelRef ();
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "	* Set field ModelRef

	:param ModelRef:
	:type ModelRef: Handle_StepFEA_FeaModel3d &
	:rtype: None
") SetModelRef;
		void SetModelRef (const Handle_StepFEA_FeaModel3d & ModelRef);
		%feature("compactdefaultargs") ElementDescriptor;
		%feature("autodoc", "	* Returns field ElementDescriptor

	:rtype: Handle_StepElement_Volume3dElementDescriptor
") ElementDescriptor;
		Handle_StepElement_Volume3dElementDescriptor ElementDescriptor ();
		%feature("compactdefaultargs") SetElementDescriptor;
		%feature("autodoc", "	* Set field ElementDescriptor

	:param ElementDescriptor:
	:type ElementDescriptor: Handle_StepElement_Volume3dElementDescriptor &
	:rtype: None
") SetElementDescriptor;
		void SetElementDescriptor (const Handle_StepElement_Volume3dElementDescriptor & ElementDescriptor);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* Returns field Material

	:rtype: Handle_StepElement_ElementMaterial
") Material;
		Handle_StepElement_ElementMaterial Material ();
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Set field Material

	:param Material:
	:type Material: Handle_StepElement_ElementMaterial &
	:rtype: None
") SetMaterial;
		void SetMaterial (const Handle_StepElement_ElementMaterial & Material);
};


%extend StepFEA_Volume3dElementRepresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_Volume3dElementRepresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_Volume3dElementRepresentation::Handle_StepFEA_Volume3dElementRepresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_Volume3dElementRepresentation;
class Handle_StepFEA_Volume3dElementRepresentation : public Handle_StepFEA_ElementRepresentation {

    public:
        // constructors
        Handle_StepFEA_Volume3dElementRepresentation();
        Handle_StepFEA_Volume3dElementRepresentation(const Handle_StepFEA_Volume3dElementRepresentation &aHandle);
        Handle_StepFEA_Volume3dElementRepresentation(const StepFEA_Volume3dElementRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_Volume3dElementRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_Volume3dElementRepresentation {
    StepFEA_Volume3dElementRepresentation* _get_reference() {
    return (StepFEA_Volume3dElementRepresentation*)$self->Access();
    }
};

%extend Handle_StepFEA_Volume3dElementRepresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_Volume3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_NodeWithSolutionCoordinateSystem;
class StepFEA_NodeWithSolutionCoordinateSystem : public StepFEA_Node {
	public:
		%feature("compactdefaultargs") StepFEA_NodeWithSolutionCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_NodeWithSolutionCoordinateSystem;
		 StepFEA_NodeWithSolutionCoordinateSystem ();
};


%extend StepFEA_NodeWithSolutionCoordinateSystem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_NodeWithSolutionCoordinateSystem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_NodeWithSolutionCoordinateSystem::Handle_StepFEA_NodeWithSolutionCoordinateSystem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_NodeWithSolutionCoordinateSystem;
class Handle_StepFEA_NodeWithSolutionCoordinateSystem : public Handle_StepFEA_Node {

    public:
        // constructors
        Handle_StepFEA_NodeWithSolutionCoordinateSystem();
        Handle_StepFEA_NodeWithSolutionCoordinateSystem(const Handle_StepFEA_NodeWithSolutionCoordinateSystem &aHandle);
        Handle_StepFEA_NodeWithSolutionCoordinateSystem(const StepFEA_NodeWithSolutionCoordinateSystem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_NodeWithSolutionCoordinateSystem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_NodeWithSolutionCoordinateSystem {
    StepFEA_NodeWithSolutionCoordinateSystem* _get_reference() {
    return (StepFEA_NodeWithSolutionCoordinateSystem*)$self->Access();
    }
};

%extend Handle_StepFEA_NodeWithSolutionCoordinateSystem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_NodeWithSolutionCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepFEA_NodeWithVector;
class StepFEA_NodeWithVector : public StepFEA_Node {
	public:
		%feature("compactdefaultargs") StepFEA_NodeWithVector;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepFEA_NodeWithVector;
		 StepFEA_NodeWithVector ();
};


%extend StepFEA_NodeWithVector {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepFEA_NodeWithVector(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepFEA_NodeWithVector::Handle_StepFEA_NodeWithVector %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepFEA_NodeWithVector;
class Handle_StepFEA_NodeWithVector : public Handle_StepFEA_Node {

    public:
        // constructors
        Handle_StepFEA_NodeWithVector();
        Handle_StepFEA_NodeWithVector(const Handle_StepFEA_NodeWithVector &aHandle);
        Handle_StepFEA_NodeWithVector(const StepFEA_NodeWithVector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepFEA_NodeWithVector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepFEA_NodeWithVector {
    StepFEA_NodeWithVector* _get_reference() {
    return (StepFEA_NodeWithVector*)$self->Access();
    }
};

%extend Handle_StepFEA_NodeWithVector {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepFEA_NodeWithVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
