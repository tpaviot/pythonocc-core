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
%module (package="OCC") MeshVS

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


%include MeshVS_headers.i


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
typedef Standard_Integer MeshVS_DisplayModeFlags;
typedef NCollection_List <Handle_TColgp_HArray1OfPnt>::Iterator MeshVS_PolyhedronVertsIter;
typedef NCollection_List <Handle_TColgp_HArray1OfPnt> MeshVS_PolyhedronVerts;
typedef MeshVS_Mesh * MeshVS_MeshPtr;
typedef Standard_Integer MeshVS_BuilderPriority;
typedef std::pair <Standard_Integer , Standard_Integer> MeshVS_NodePair;
/* end typedefs declaration */

/* public enums */
enum  {
	MeshVS_BP_Mesh = 5,
	MeshVS_BP_NodalColor = 10,
	MeshVS_BP_ElemColor = 15,
	MeshVS_BP_Text = 20,
	MeshVS_BP_Vector = 25,
	MeshVS_BP_User = 30,
	MeshVS_BP_Default = MeshVS_BP_User,
};

enum  {
	MeshVS_DMF_WireFrame = 1,
	MeshVS_DMF_Shading = 2,
	MeshVS_DMF_Shrink = 3,
	MeshVS_DMF_OCCMask = ( MeshVS_DMF_WireFrame | MeshVS_DMF_Shading | MeshVS_DMF_Shrink ),
	MeshVS_DMF_VectorDataPrs = 4,
	MeshVS_DMF_NodalColorDataPrs = 8,
	MeshVS_DMF_ElementalColorDataPrs = 16,
	MeshVS_DMF_TextDataPrs = 32,
	MeshVS_DMF_EntitiesWithData = 64,
	MeshVS_DMF_DeformedPrsWireFrame = 128,
	MeshVS_DMF_DeformedPrsShading = 256,
	MeshVS_DMF_DeformedPrsShrink = 384,
	MeshVS_DMF_DeformedMask = ( MeshVS_DMF_DeformedPrsWireFrame | MeshVS_DMF_DeformedPrsShading | MeshVS_DMF_DeformedPrsShrink ),
	MeshVS_DMF_SelectionPrs = 512,
	MeshVS_DMF_HilightPrs = 1024,
	MeshVS_DMF_User = 2048,
};

enum MeshVS_DrawerAttribute {
	MeshVS_DA_InteriorStyle = 0,
	MeshVS_DA_InteriorColor = 1,
	MeshVS_DA_BackInteriorColor = 2,
	MeshVS_DA_EdgeColor = 3,
	MeshVS_DA_EdgeType = 4,
	MeshVS_DA_EdgeWidth = 5,
	MeshVS_DA_HatchStyle = 6,
	MeshVS_DA_FrontMaterial = 7,
	MeshVS_DA_BackMaterial = 8,
	MeshVS_DA_BeamType = 9,
	MeshVS_DA_BeamWidth = 10,
	MeshVS_DA_BeamColor = 11,
	MeshVS_DA_MarkerType = 12,
	MeshVS_DA_MarkerColor = 13,
	MeshVS_DA_MarkerScale = 14,
	MeshVS_DA_TextColor = 15,
	MeshVS_DA_TextHeight = 16,
	MeshVS_DA_TextFont = 17,
	MeshVS_DA_TextExpansionFactor = 18,
	MeshVS_DA_TextSpace = 19,
	MeshVS_DA_TextStyle = 20,
	MeshVS_DA_TextDisplayType = 21,
	MeshVS_DA_TextTexFont = 22,
	MeshVS_DA_TextFontAspect = 23,
	MeshVS_DA_VectorColor = 24,
	MeshVS_DA_VectorMaxLength = 25,
	MeshVS_DA_VectorArrowPart = 26,
	MeshVS_DA_IsAllowOverlapped = 27,
	MeshVS_DA_Reflection = 28,
	MeshVS_DA_ColorReflection = 29,
	MeshVS_DA_ShrinkCoeff = 30,
	MeshVS_DA_MaxFaceNodes = 31,
	MeshVS_DA_ComputeTime = 32,
	MeshVS_DA_ComputeSelectionTime = 33,
	MeshVS_DA_DisplayNodes = 34,
	MeshVS_DA_SelectableAuto = 35,
	MeshVS_DA_ShowEdges = 36,
	MeshVS_DA_SmoothShading = 37,
	MeshVS_DA_SupressBackFaces = 38,
	MeshVS_DA_User = 39,
};

enum MeshVS_EntityType {
	MeshVS_ET_NONE = 0,
	MeshVS_ET_Node = 1,
	MeshVS_ET_0D = 2,
	MeshVS_ET_Link = 4,
	MeshVS_ET_Face = 8,
	MeshVS_ET_Volume = 16,
	MeshVS_ET_Element = MeshVS_ET_0D | MeshVS_ET_Link | MeshVS_ET_Face | MeshVS_ET_Volume,
	MeshVS_ET_All = MeshVS_ET_Element | MeshVS_ET_Node,
};

enum MeshVS_MeshSelectionMethod {
	MeshVS_MSM_PRECISE = 0,
	MeshVS_MSM_NODES = 1,
	MeshVS_MSM_BOX = 2,
};

enum MeshVS_SelectionModeFlags {
	MeshVS_SMF_Mesh = 0,
	MeshVS_SMF_Node = 1,
	MeshVS_SMF_0D = 2,
	MeshVS_SMF_Link = 4,
	MeshVS_SMF_Face = 8,
	MeshVS_SMF_Volume = 16,
	MeshVS_SMF_Element = MeshVS_SMF_0D | MeshVS_SMF_Link | MeshVS_SMF_Face | MeshVS_SMF_Volume,
	MeshVS_SMF_All = MeshVS_SMF_Element | MeshVS_SMF_Node,
	MeshVS_SMF_Group = 256,
};

/* end public enums declaration */

%nodefaultctor MeshVS_Array1OfSequenceOfInteger;
class MeshVS_Array1OfSequenceOfInteger {
	public:
		%feature("compactdefaultargs") MeshVS_Array1OfSequenceOfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") MeshVS_Array1OfSequenceOfInteger;
		 MeshVS_Array1OfSequenceOfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") MeshVS_Array1OfSequenceOfInteger;
		%feature("autodoc", "	:param Item:
	:type Item: TColStd_SequenceOfInteger &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") MeshVS_Array1OfSequenceOfInteger;
		 MeshVS_Array1OfSequenceOfInteger (const TColStd_SequenceOfInteger & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TColStd_SequenceOfInteger &
	:rtype: None
") Init;
		void Init (const TColStd_SequenceOfInteger & V);
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
	:type Other: MeshVS_Array1OfSequenceOfInteger &
	:rtype: MeshVS_Array1OfSequenceOfInteger
") Assign;
		const MeshVS_Array1OfSequenceOfInteger & Assign (const MeshVS_Array1OfSequenceOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_Array1OfSequenceOfInteger &
	:rtype: MeshVS_Array1OfSequenceOfInteger
") operator =;
		const MeshVS_Array1OfSequenceOfInteger & operator = (const MeshVS_Array1OfSequenceOfInteger & Other);
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
	:type Value: TColStd_SequenceOfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_SequenceOfInteger & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_SequenceOfInteger
") Value;
		const TColStd_SequenceOfInteger & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_SequenceOfInteger
") ChangeValue;
		TColStd_SequenceOfInteger & ChangeValue (const Standard_Integer Index);
};


%extend MeshVS_Array1OfSequenceOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class MeshVS_ColorHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: Quantity_Color &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Quantity_Color & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: Quantity_Color &
	:param K2:
	:type K2: Quantity_Color &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Quantity_Color & K1,const Quantity_Color & K2);
};


%extend MeshVS_ColorHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger;
class MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger;
		 MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfColorMapOfInteger &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger;
		 MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger (const MeshVS_DataMapOfColorMapOfInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfColorMapOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfColorMapOfInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Quantity_Color
") Key;
		const Quantity_Color & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_MapOfInteger
") Value;
		const TColStd_MapOfInteger & Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger;
class MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger;
		 MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfHArray1OfSequenceOfInteger &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger;
		 MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger (const MeshVS_DataMapOfHArray1OfSequenceOfInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfHArray1OfSequenceOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfHArray1OfSequenceOfInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MeshVS_HArray1OfSequenceOfInteger
") Value;
		Handle_MeshVS_HArray1OfSequenceOfInteger Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString;
class MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerAsciiString &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString (const MeshVS_DataMapOfIntegerAsciiString & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerAsciiString &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfIntegerAsciiString & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		const TCollection_AsciiString & Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean;
class MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerBoolean &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean (const MeshVS_DataMapOfIntegerBoolean & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerBoolean &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfIntegerBoolean & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: bool
") Value;
		const Standard_Boolean & Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfIntegerColor;
class MeshVS_DataMapIteratorOfDataMapOfIntegerColor : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerColor;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerColor;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerColor ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerColor;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerColor &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerColor;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerColor (const MeshVS_DataMapOfIntegerColor & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerColor &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfIntegerColor & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Quantity_Color
") Value;
		const Quantity_Color & Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfIntegerColor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial;
class MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerMaterial &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial (const MeshVS_DataMapOfIntegerMaterial & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerMaterial &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfIntegerMaterial & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Graphic3d_MaterialAspect
") Value;
		const Graphic3d_MaterialAspect & Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner;
class MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerMeshEntityOwner &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner (const MeshVS_DataMapOfIntegerMeshEntityOwner & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerMeshEntityOwner &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfIntegerMeshEntityOwner & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MeshVS_MeshEntityOwner
") Value;
		Handle_MeshVS_MeshEntityOwner Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfIntegerOwner;
class MeshVS_DataMapIteratorOfDataMapOfIntegerOwner : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerOwner;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerOwner;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerOwner ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerOwner;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerOwner &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerOwner;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerOwner (const MeshVS_DataMapOfIntegerOwner & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerOwner &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfIntegerOwner & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_EntityOwner
") Value;
		Handle_SelectMgr_EntityOwner Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfIntegerOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors;
class MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerTwoColors &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors (const MeshVS_DataMapOfIntegerTwoColors & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerTwoColors &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfIntegerTwoColors & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: MeshVS_TwoColors
") Value;
		const MeshVS_TwoColors & Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfIntegerVector;
class MeshVS_DataMapIteratorOfDataMapOfIntegerVector : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerVector;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerVector;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerVector ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfIntegerVector;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerVector &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfIntegerVector;
		 MeshVS_DataMapIteratorOfDataMapOfIntegerVector (const MeshVS_DataMapOfIntegerVector & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfIntegerVector &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfIntegerVector & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Vec
") Value;
		const gp_Vec  Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfIntegerVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger;
class MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger;
		%feature("autodoc", "	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger;
		 MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger ();
		%feature("compactdefaultargs") MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfTwoColorsMapOfInteger &
	:rtype: None
") MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger;
		 MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger (const MeshVS_DataMapOfTwoColorsMapOfInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_DataMapOfTwoColorsMapOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_DataMapOfTwoColorsMapOfInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: MeshVS_TwoColors
") Key;
		const MeshVS_TwoColors & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_MapOfInteger
") Value;
		const TColStd_MapOfInteger & Value ();
};


%extend MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger;
class MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger;
		%feature("autodoc", "	:param K:
	:type K: Quantity_Color &
	:param I:
	:type I: TColStd_MapOfInteger &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger;
		 MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger (const Quantity_Color & K,const TColStd_MapOfInteger & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Quantity_Color
") Key;
		Quantity_Color & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_MapOfInteger
") Value;
		TColStd_MapOfInteger & Value ();
};


%extend MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger::Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger;
class Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger();
        Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger(const Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger(const MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger {
    MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfColorMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger;
class MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_MeshVS_HArray1OfSequenceOfInteger &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger;
		 MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger (const Standard_Integer & K,const Handle_MeshVS_HArray1OfSequenceOfInteger & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MeshVS_HArray1OfSequenceOfInteger
") Value;
		Handle_MeshVS_HArray1OfSequenceOfInteger Value ();
};


%extend MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger::Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger;
class Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger();
        Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger(const Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger(const MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger {
    MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfHArray1OfSequenceOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString;
class MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TCollection_AsciiString &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString;
		 MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString (const Standard_Integer & K,const TCollection_AsciiString & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		TCollection_AsciiString & Value ();
};


%extend MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString::Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString;
class Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString();
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString(const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString(const MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString {
    MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfIntegerAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfIntegerBoolean;
class MeshVS_DataMapNodeOfDataMapOfIntegerBoolean : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfIntegerBoolean;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: bool
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfIntegerBoolean;
		 MeshVS_DataMapNodeOfDataMapOfIntegerBoolean (const Standard_Integer & K,const Standard_Boolean & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetValue() {
                return (Standard_Boolean) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Boolean value ) {
                $self->Value()=value;
                }
            };
            };


%extend MeshVS_DataMapNodeOfDataMapOfIntegerBoolean {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean::Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean;
class Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean();
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean(const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean(const MeshVS_DataMapNodeOfDataMapOfIntegerBoolean *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean {
    MeshVS_DataMapNodeOfDataMapOfIntegerBoolean* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfIntegerBoolean*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerBoolean {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfIntegerBoolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfIntegerColor;
class MeshVS_DataMapNodeOfDataMapOfIntegerColor : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfIntegerColor;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Quantity_Color &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfIntegerColor;
		 MeshVS_DataMapNodeOfDataMapOfIntegerColor (const Standard_Integer & K,const Quantity_Color & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Quantity_Color
") Value;
		Quantity_Color & Value ();
};


%extend MeshVS_DataMapNodeOfDataMapOfIntegerColor {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor::Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor;
class Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor();
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor(const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor(const MeshVS_DataMapNodeOfDataMapOfIntegerColor *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor {
    MeshVS_DataMapNodeOfDataMapOfIntegerColor* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfIntegerColor*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerColor {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfIntegerColor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfIntegerMaterial;
class MeshVS_DataMapNodeOfDataMapOfIntegerMaterial : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfIntegerMaterial;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Graphic3d_MaterialAspect &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfIntegerMaterial;
		 MeshVS_DataMapNodeOfDataMapOfIntegerMaterial (const Standard_Integer & K,const Graphic3d_MaterialAspect & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Graphic3d_MaterialAspect
") Value;
		Graphic3d_MaterialAspect & Value ();
};


%extend MeshVS_DataMapNodeOfDataMapOfIntegerMaterial {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial::Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial;
class Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial();
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial(const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial(const MeshVS_DataMapNodeOfDataMapOfIntegerMaterial *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial {
    MeshVS_DataMapNodeOfDataMapOfIntegerMaterial* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfIntegerMaterial*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMaterial {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfIntegerMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner;
class MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_MeshVS_MeshEntityOwner &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner;
		 MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner (const Standard_Integer & K,const Handle_MeshVS_MeshEntityOwner & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MeshVS_MeshEntityOwner
") Value;
		Handle_MeshVS_MeshEntityOwner Value ();
};


%extend MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner::Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner;
class Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner();
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner(const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner(const MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner {
    MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfIntegerMeshEntityOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfIntegerOwner;
class MeshVS_DataMapNodeOfDataMapOfIntegerOwner : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfIntegerOwner;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_SelectMgr_EntityOwner &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfIntegerOwner;
		 MeshVS_DataMapNodeOfDataMapOfIntegerOwner (const Standard_Integer & K,const Handle_SelectMgr_EntityOwner & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_EntityOwner
") Value;
		Handle_SelectMgr_EntityOwner Value ();
};


%extend MeshVS_DataMapNodeOfDataMapOfIntegerOwner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner::Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner;
class Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner();
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner(const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner(const MeshVS_DataMapNodeOfDataMapOfIntegerOwner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner {
    MeshVS_DataMapNodeOfDataMapOfIntegerOwner* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfIntegerOwner*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerOwner {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfIntegerOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors;
class MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: MeshVS_TwoColors &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors;
		 MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors (const Standard_Integer & K,const MeshVS_TwoColors & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: MeshVS_TwoColors
") Value;
		MeshVS_TwoColors & Value ();
};


%extend MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors::Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors;
class Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors();
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors(const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors(const MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors {
    MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfIntegerTwoColors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfIntegerVector;
class MeshVS_DataMapNodeOfDataMapOfIntegerVector : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfIntegerVector;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: gp_Vec
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfIntegerVector;
		 MeshVS_DataMapNodeOfDataMapOfIntegerVector (const Standard_Integer & K,const gp_Vec & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Vec
") Value;
		gp_Vec  Value ();
};


%extend MeshVS_DataMapNodeOfDataMapOfIntegerVector {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector::Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector;
class Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector();
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector(const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector(const MeshVS_DataMapNodeOfDataMapOfIntegerVector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector {
    MeshVS_DataMapNodeOfDataMapOfIntegerVector* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfIntegerVector*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfIntegerVector {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfIntegerVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger;
class MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoColors &
	:param I:
	:type I: TColStd_MapOfInteger &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger;
		 MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger (const MeshVS_TwoColors & K,const TColStd_MapOfInteger & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: MeshVS_TwoColors
") Key;
		MeshVS_TwoColors & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_MapOfInteger
") Value;
		TColStd_MapOfInteger & Value ();
};


%extend MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger::Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger;
class Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger();
        Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger(const Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger &aHandle);
        Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger(const MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger {
    MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger* _get_reference() {
    return (MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger*)$self->Access();
    }
};

%extend Handle_MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataMapNodeOfDataMapOfTwoColorsMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfColorMapOfInteger;
class MeshVS_DataMapOfColorMapOfInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfColorMapOfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfColorMapOfInteger;
		 MeshVS_DataMapOfColorMapOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfColorMapOfInteger &
	:rtype: MeshVS_DataMapOfColorMapOfInteger
") Assign;
		MeshVS_DataMapOfColorMapOfInteger & Assign (const MeshVS_DataMapOfColorMapOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfColorMapOfInteger &
	:rtype: MeshVS_DataMapOfColorMapOfInteger
") operator =;
		MeshVS_DataMapOfColorMapOfInteger & operator = (const MeshVS_DataMapOfColorMapOfInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Quantity_Color &
	:param I:
	:type I: TColStd_MapOfInteger &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Quantity_Color & K,const TColStd_MapOfInteger & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Quantity_Color &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Quantity_Color & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Quantity_Color &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Quantity_Color & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Quantity_Color &
	:rtype: TColStd_MapOfInteger
") Find;
		const TColStd_MapOfInteger & Find (const Quantity_Color & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Quantity_Color &
	:rtype: TColStd_MapOfInteger
") ChangeFind;
		TColStd_MapOfInteger & ChangeFind (const Quantity_Color & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Quantity_Color &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Quantity_Color & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Quantity_Color &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Quantity_Color & K);
};


%extend MeshVS_DataMapOfColorMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfHArray1OfSequenceOfInteger;
class MeshVS_DataMapOfHArray1OfSequenceOfInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfHArray1OfSequenceOfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfHArray1OfSequenceOfInteger;
		 MeshVS_DataMapOfHArray1OfSequenceOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfHArray1OfSequenceOfInteger &
	:rtype: MeshVS_DataMapOfHArray1OfSequenceOfInteger
") Assign;
		MeshVS_DataMapOfHArray1OfSequenceOfInteger & Assign (const MeshVS_DataMapOfHArray1OfSequenceOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfHArray1OfSequenceOfInteger &
	:rtype: MeshVS_DataMapOfHArray1OfSequenceOfInteger
") operator =;
		MeshVS_DataMapOfHArray1OfSequenceOfInteger & operator = (const MeshVS_DataMapOfHArray1OfSequenceOfInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_MeshVS_HArray1OfSequenceOfInteger &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Handle_MeshVS_HArray1OfSequenceOfInteger & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_MeshVS_HArray1OfSequenceOfInteger
") Find;
		Handle_MeshVS_HArray1OfSequenceOfInteger Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_MeshVS_HArray1OfSequenceOfInteger
") ChangeFind;
		Handle_MeshVS_HArray1OfSequenceOfInteger ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend MeshVS_DataMapOfHArray1OfSequenceOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfIntegerAsciiString;
class MeshVS_DataMapOfIntegerAsciiString : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfIntegerAsciiString;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfIntegerAsciiString;
		 MeshVS_DataMapOfIntegerAsciiString (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerAsciiString &
	:rtype: MeshVS_DataMapOfIntegerAsciiString
") Assign;
		MeshVS_DataMapOfIntegerAsciiString & Assign (const MeshVS_DataMapOfIntegerAsciiString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerAsciiString &
	:rtype: MeshVS_DataMapOfIntegerAsciiString
") operator =;
		MeshVS_DataMapOfIntegerAsciiString & operator = (const MeshVS_DataMapOfIntegerAsciiString & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TCollection_AsciiString &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const TCollection_AsciiString & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TCollection_AsciiString
") Find;
		const TCollection_AsciiString & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TCollection_AsciiString
") ChangeFind;
		TCollection_AsciiString & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend MeshVS_DataMapOfIntegerAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfIntegerBoolean;
class MeshVS_DataMapOfIntegerBoolean : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfIntegerBoolean;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfIntegerBoolean;
		 MeshVS_DataMapOfIntegerBoolean (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerBoolean &
	:rtype: MeshVS_DataMapOfIntegerBoolean
") Assign;
		MeshVS_DataMapOfIntegerBoolean & Assign (const MeshVS_DataMapOfIntegerBoolean & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerBoolean &
	:rtype: MeshVS_DataMapOfIntegerBoolean
") operator =;
		MeshVS_DataMapOfIntegerBoolean & operator = (const MeshVS_DataMapOfIntegerBoolean & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: bool
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Standard_Boolean & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") Find;
		const Standard_Boolean & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") ChangeFind;
		Standard_Boolean & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend MeshVS_DataMapOfIntegerBoolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfIntegerColor;
class MeshVS_DataMapOfIntegerColor : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfIntegerColor;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfIntegerColor;
		 MeshVS_DataMapOfIntegerColor (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerColor &
	:rtype: MeshVS_DataMapOfIntegerColor
") Assign;
		MeshVS_DataMapOfIntegerColor & Assign (const MeshVS_DataMapOfIntegerColor & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerColor &
	:rtype: MeshVS_DataMapOfIntegerColor
") operator =;
		MeshVS_DataMapOfIntegerColor & operator = (const MeshVS_DataMapOfIntegerColor & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Quantity_Color &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Quantity_Color & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Quantity_Color
") Find;
		const Quantity_Color & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Quantity_Color
") ChangeFind;
		Quantity_Color & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend MeshVS_DataMapOfIntegerColor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfIntegerMaterial;
class MeshVS_DataMapOfIntegerMaterial : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfIntegerMaterial;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfIntegerMaterial;
		 MeshVS_DataMapOfIntegerMaterial (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerMaterial &
	:rtype: MeshVS_DataMapOfIntegerMaterial
") Assign;
		MeshVS_DataMapOfIntegerMaterial & Assign (const MeshVS_DataMapOfIntegerMaterial & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerMaterial &
	:rtype: MeshVS_DataMapOfIntegerMaterial
") operator =;
		MeshVS_DataMapOfIntegerMaterial & operator = (const MeshVS_DataMapOfIntegerMaterial & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Graphic3d_MaterialAspect &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Graphic3d_MaterialAspect & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Graphic3d_MaterialAspect
") Find;
		const Graphic3d_MaterialAspect & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Graphic3d_MaterialAspect
") ChangeFind;
		Graphic3d_MaterialAspect & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend MeshVS_DataMapOfIntegerMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfIntegerMeshEntityOwner;
class MeshVS_DataMapOfIntegerMeshEntityOwner : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfIntegerMeshEntityOwner;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfIntegerMeshEntityOwner;
		 MeshVS_DataMapOfIntegerMeshEntityOwner (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerMeshEntityOwner &
	:rtype: MeshVS_DataMapOfIntegerMeshEntityOwner
") Assign;
		MeshVS_DataMapOfIntegerMeshEntityOwner & Assign (const MeshVS_DataMapOfIntegerMeshEntityOwner & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerMeshEntityOwner &
	:rtype: MeshVS_DataMapOfIntegerMeshEntityOwner
") operator =;
		MeshVS_DataMapOfIntegerMeshEntityOwner & operator = (const MeshVS_DataMapOfIntegerMeshEntityOwner & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_MeshVS_MeshEntityOwner &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Handle_MeshVS_MeshEntityOwner & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_MeshVS_MeshEntityOwner
") Find;
		Handle_MeshVS_MeshEntityOwner Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_MeshVS_MeshEntityOwner
") ChangeFind;
		Handle_MeshVS_MeshEntityOwner ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend MeshVS_DataMapOfIntegerMeshEntityOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfIntegerOwner;
class MeshVS_DataMapOfIntegerOwner : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfIntegerOwner;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfIntegerOwner;
		 MeshVS_DataMapOfIntegerOwner (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerOwner &
	:rtype: MeshVS_DataMapOfIntegerOwner
") Assign;
		MeshVS_DataMapOfIntegerOwner & Assign (const MeshVS_DataMapOfIntegerOwner & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerOwner &
	:rtype: MeshVS_DataMapOfIntegerOwner
") operator =;
		MeshVS_DataMapOfIntegerOwner & operator = (const MeshVS_DataMapOfIntegerOwner & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Handle_SelectMgr_EntityOwner & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_SelectMgr_EntityOwner
") Find;
		Handle_SelectMgr_EntityOwner Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_SelectMgr_EntityOwner
") ChangeFind;
		Handle_SelectMgr_EntityOwner ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend MeshVS_DataMapOfIntegerOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfIntegerTwoColors;
class MeshVS_DataMapOfIntegerTwoColors : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfIntegerTwoColors;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfIntegerTwoColors;
		 MeshVS_DataMapOfIntegerTwoColors (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerTwoColors &
	:rtype: MeshVS_DataMapOfIntegerTwoColors
") Assign;
		MeshVS_DataMapOfIntegerTwoColors & Assign (const MeshVS_DataMapOfIntegerTwoColors & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerTwoColors &
	:rtype: MeshVS_DataMapOfIntegerTwoColors
") operator =;
		MeshVS_DataMapOfIntegerTwoColors & operator = (const MeshVS_DataMapOfIntegerTwoColors & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: MeshVS_TwoColors &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const MeshVS_TwoColors & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: MeshVS_TwoColors
") Find;
		const MeshVS_TwoColors & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: MeshVS_TwoColors
") ChangeFind;
		MeshVS_TwoColors & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend MeshVS_DataMapOfIntegerTwoColors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfIntegerVector;
class MeshVS_DataMapOfIntegerVector : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfIntegerVector;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfIntegerVector;
		 MeshVS_DataMapOfIntegerVector (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerVector &
	:rtype: MeshVS_DataMapOfIntegerVector
") Assign;
		MeshVS_DataMapOfIntegerVector & Assign (const MeshVS_DataMapOfIntegerVector & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfIntegerVector &
	:rtype: MeshVS_DataMapOfIntegerVector
") operator =;
		MeshVS_DataMapOfIntegerVector & operator = (const MeshVS_DataMapOfIntegerVector & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: gp_Vec
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const gp_Vec & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: gp_Vec
") Find;
		const gp_Vec  Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: gp_Vec
") ChangeFind;
		gp_Vec  ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend MeshVS_DataMapOfIntegerVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataMapOfTwoColorsMapOfInteger;
class MeshVS_DataMapOfTwoColorsMapOfInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_DataMapOfTwoColorsMapOfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_DataMapOfTwoColorsMapOfInteger;
		 MeshVS_DataMapOfTwoColorsMapOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfTwoColorsMapOfInteger &
	:rtype: MeshVS_DataMapOfTwoColorsMapOfInteger
") Assign;
		MeshVS_DataMapOfTwoColorsMapOfInteger & Assign (const MeshVS_DataMapOfTwoColorsMapOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_DataMapOfTwoColorsMapOfInteger &
	:rtype: MeshVS_DataMapOfTwoColorsMapOfInteger
") operator =;
		MeshVS_DataMapOfTwoColorsMapOfInteger & operator = (const MeshVS_DataMapOfTwoColorsMapOfInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoColors &
	:param I:
	:type I: TColStd_MapOfInteger &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const MeshVS_TwoColors & K,const TColStd_MapOfInteger & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoColors &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const MeshVS_TwoColors & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoColors &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const MeshVS_TwoColors & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoColors &
	:rtype: TColStd_MapOfInteger
") Find;
		const TColStd_MapOfInteger & Find (const MeshVS_TwoColors & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoColors &
	:rtype: TColStd_MapOfInteger
") ChangeFind;
		TColStd_MapOfInteger & ChangeFind (const MeshVS_TwoColors & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoColors &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const MeshVS_TwoColors & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoColors &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const MeshVS_TwoColors & K);
};


%extend MeshVS_DataMapOfTwoColorsMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataSource;
class MeshVS_DataSource : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "	* Returns geometry information about node or element ID is the numerical identificator of node or element IsElement indicates this ID describe node ( if Standard_False ) or element ( if Standard_True ) Coords is an array of co-ordinates of node(s). For node it is only 3 numbers: X, Y, Z in the strict order For element it is 3*n numbers, where n is number of this element vertices The order is strict also: X1, Y1, Z1, X2,...., where Xi, Yi, Zi are co-ordinates of vertices NbNodes is number of nodes. It is recommended this parameter to be set to 1 for node. Type is type of node or element (from enumeration). It is recommended this parameter to be set to MeshVS_ET_Node for node.

	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:param Coords:
	:type Coords: TColStd_Array1OfReal &
	:param NbNodes:
	:type NbNodes: int &
	:param Type:
	:type Type: MeshVS_EntityType &
	:rtype: bool
") GetGeom;
		virtual Standard_Boolean GetGeom (const Standard_Integer ID,const Standard_Boolean IsElement,TColStd_Array1OfReal & Coords,Standard_Integer &OutValue,MeshVS_EntityType & Type);
		%feature("compactdefaultargs") GetGeomType;
		%feature("autodoc", "	* This method is similar to GetGeom, but returns only element or node type.

	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:param Type:
	:type Type: MeshVS_EntityType &
	:rtype: bool
") GetGeomType;
		virtual Standard_Boolean GetGeomType (const Standard_Integer ID,const Standard_Boolean IsElement,MeshVS_EntityType & Type);
		%feature("compactdefaultargs") Get3DGeom;
		%feature("autodoc", "	* This method returns topology information about 3D-element Returns false if element with ID isn't 3D or because other troubles

	:param ID:
	:type ID: int
	:param NbNodes:
	:type NbNodes: int &
	:param Data:
	:type Data: Handle_MeshVS_HArray1OfSequenceOfInteger &
	:rtype: bool
") Get3DGeom;
		virtual Standard_Boolean Get3DGeom (const Standard_Integer ID,Standard_Integer &OutValue,Handle_MeshVS_HArray1OfSequenceOfInteger & Data);
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", "	* This method returns pointer which represents element or node data structure. This address will be saved in MeshVS_MeshEntityOwner, so that you can access to data structure fast by the method Owner(). In the redefined method you can return NULL. ID is the numerical identificator of node or element IsElement indicates this ID describe node ( if Standard_False ) or element ( if Standard_True )

	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:rtype: Standard_Address
") GetAddr;
		virtual Standard_Address GetAddr (const Standard_Integer ID,const Standard_Boolean IsElement);
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", "	* This method returns information about nodes this element consist of. ID is the numerical identificator of element. NodeIDs is the output array of nodes IDs in correct order, the same as coordinates returned by GetGeom(). NbNodes is number of nodes (number of items set in NodeIDs). Returns False if element does not exist

	:param ID:
	:type ID: int
	:param NodeIDs:
	:type NodeIDs: TColStd_Array1OfInteger &
	:param NbNodes:
	:type NbNodes: int &
	:rtype: bool
") GetNodesByElement;
		virtual Standard_Boolean GetNodesByElement (const Standard_Integer ID,TColStd_Array1OfInteger & NodeIDs,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", "	* This method returns map of all nodes the object consist of.

	:rtype: TColStd_PackedMapOfInteger
") GetAllNodes;
		virtual const TColStd_PackedMapOfInteger & GetAllNodes ();
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", "	* This method returns map of all elements the object consist of.

	:rtype: TColStd_PackedMapOfInteger
") GetAllElements;
		virtual const TColStd_PackedMapOfInteger & GetAllElements ();
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "	* This method calculates normal of face, which is using for correct reflection presentation. There is default method, for advance reflection this method can be redefined. Id is the numerical identificator of only element! Max is maximal number of nodes an element can consist of nx, ny, nz are values whose represent co-ordinates of normal (will be returned) In the redefined method you can return normal with length more then 1, but in this case the appearance of element will be more bright than usual. For ordinary brightness you must return normal with length 1

	:param Id:
	:type Id: int
	:param Max:
	:type Max: int
	:param nx:
	:type nx: float &
	:param ny:
	:type ny: float &
	:param nz:
	:type nz: float &
	:rtype: bool
") GetNormal;
		virtual Standard_Boolean GetNormal (const Standard_Integer Id,const Standard_Integer Max,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetNodeNormal;
		%feature("autodoc", "	* This method return normal of node ranknode of face Id, which is using for smooth shading presentation. Returns false if normal isn't defined.

	:param ranknode:
	:type ranknode: int
	:param ElementId:
	:type ElementId: int
	:param nx:
	:type nx: float &
	:param ny:
	:type ny: float &
	:param nz:
	:type nz: float &
	:rtype: bool
") GetNodeNormal;
		virtual Standard_Boolean GetNodeNormal (const Standard_Integer ranknode,const Standard_Integer ElementId,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetNormalsByElement;
		%feature("autodoc", "	* This method puts components of normal vectors at each node of a mesh face (at each face of a mesh volume) into the output array. Returns false if some problem was detected during calculation of normals. Id is an identifier of the mesh element. IsNodal, when true, means that normals at mesh element nodes are needed. If nodal normals are not available, or IsNodal is false, or the mesh element is a volume, then the output array contents depend on the element type: face: a normal calculated by GetNormal() is duplicated for each node of the face; volume: normals to all faces of the volume are computed (not for each node!). MaxNodes is maximal number of nodes an element can consist of. Normals contains the result.

	:param Id:
	:type Id: int
	:param IsNodal:
	:type IsNodal: bool
	:param MaxNodes:
	:type MaxNodes: int
	:param Normals:
	:type Normals: Handle_TColStd_HArray1OfReal &
	:rtype: bool
") GetNormalsByElement;
		virtual Standard_Boolean GetNormalsByElement (const Standard_Integer Id,const Standard_Boolean IsNodal,const Standard_Integer MaxNodes,Handle_TColStd_HArray1OfReal & Normals);
		%feature("compactdefaultargs") GetAllGroups;
		%feature("autodoc", "	* This method returns map of all groups the object contains.

	:param Ids:
	:type Ids: TColStd_PackedMapOfInteger &
	:rtype: void
") GetAllGroups;
		virtual void GetAllGroups (TColStd_PackedMapOfInteger & Ids);
		%feature("compactdefaultargs") GetGroup;
		%feature("autodoc", "	* This method returns map of all group elements.

	:param Id:
	:type Id: int
	:param Type:
	:type Type: MeshVS_EntityType &
	:param Ids:
	:type Ids: TColStd_PackedMapOfInteger &
	:rtype: bool
") GetGroup;
		virtual Standard_Boolean GetGroup (const Standard_Integer Id,MeshVS_EntityType & Type,TColStd_PackedMapOfInteger & Ids);
		%feature("compactdefaultargs") GetGroupAddr;
		%feature("autodoc", "	* This method returns pointer which represents group data structure. This address will be saved in MeshVS_MeshOwner, so that you can access to data structure fast by the method Owner(). In the redefined method you can return NULL. ID is the numerical identificator of group

	:param ID:
	:type ID: int
	:rtype: Standard_Address
") GetGroupAddr;
		virtual Standard_Address GetGroupAddr (const Standard_Integer ID);
		%feature("compactdefaultargs") IsAdvancedSelectionEnabled;
		%feature("autodoc", "	* Returns True if advanced mesh selection is enabled. Default implementation returns False. It should be redefined to return True for advanced mesh selection activation.

	:rtype: bool
") IsAdvancedSelectionEnabled;
		virtual Standard_Boolean IsAdvancedSelectionEnabled ();
		%feature("compactdefaultargs") GetBoundingBox;
		%feature("autodoc", "	* Returns the bounding box of the whole mesh. It is used in advanced selection mode to define roughly the sensitive area of the mesh. It can be redefined to get access to a box computed in advance.

	:rtype: Bnd_Box
") GetBoundingBox;
		virtual Bnd_Box GetBoundingBox ();
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "	* Returns maps of entities (nodes and elements) detected by mouse click at the point (X,Y) on the current view plane, with the tolerance aTol. DMin - is out argument should return actual detection tolerance. Returns True if something is detected. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.

	:param Prs:
	:type Prs: Handle_MeshVS_Mesh &
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param aTol:
	:type aTol: float
	:param Nodes:
	:type Nodes: Handle_TColStd_HPackedMapOfInteger &
	:param Elements:
	:type Elements: Handle_TColStd_HPackedMapOfInteger &
	:param DMin:
	:type DMin: float &
	:rtype: bool
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities (const Handle_MeshVS_Mesh & Prs,const Standard_Real X,const Standard_Real Y,const Standard_Real aTol,Handle_TColStd_HPackedMapOfInteger & Nodes,Handle_TColStd_HPackedMapOfInteger & Elements,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "	* Returns maps of entities (nodes and elements) detected by mouse selection with rectangular box (XMin, YMin, XMax, YMax) on the current veiw plane, with the tolerance aTol. Returns True if something is detected. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.

	:param Prs:
	:type Prs: Handle_MeshVS_Mesh &
	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:param Nodes:
	:type Nodes: Handle_TColStd_HPackedMapOfInteger &
	:param Elements:
	:type Elements: Handle_TColStd_HPackedMapOfInteger &
	:rtype: bool
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities (const Handle_MeshVS_Mesh & Prs,const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol,Handle_TColStd_HPackedMapOfInteger & Nodes,Handle_TColStd_HPackedMapOfInteger & Elements);
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "	* Returns maps of entities (nodes and elements) detected by mouse selection with the polyline <Polyline> on the current veiw plane, with the tolerance aTol. Returns True if something is detected. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.

	:param Prs:
	:type Prs: Handle_MeshVS_Mesh &
	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:param Nodes:
	:type Nodes: Handle_TColStd_HPackedMapOfInteger &
	:param Elements:
	:type Elements: Handle_TColStd_HPackedMapOfInteger &
	:rtype: bool
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities (const Handle_MeshVS_Mesh & Prs,const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol,Handle_TColStd_HPackedMapOfInteger & Nodes,Handle_TColStd_HPackedMapOfInteger & Elements);
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "	* Filter out the maps of mesh entities so as to keep only the entities that are allowed to be selected according to the current context. Returns True if any of the maps has been changed. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.

	:param Prs:
	:type Prs: Handle_MeshVS_Mesh &
	:param Nodes:
	:type Nodes: Handle_TColStd_HPackedMapOfInteger &
	:param Elements:
	:type Elements: Handle_TColStd_HPackedMapOfInteger &
	:rtype: bool
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities (const Handle_MeshVS_Mesh & Prs,Handle_TColStd_HPackedMapOfInteger & Nodes,Handle_TColStd_HPackedMapOfInteger & Elements);
};


%extend MeshVS_DataSource {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataSource(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataSource::Handle_MeshVS_DataSource %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataSource;
class Handle_MeshVS_DataSource : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MeshVS_DataSource();
        Handle_MeshVS_DataSource(const Handle_MeshVS_DataSource &aHandle);
        Handle_MeshVS_DataSource(const MeshVS_DataSource *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataSource DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataSource {
    MeshVS_DataSource* _get_reference() {
    return (MeshVS_DataSource*)$self->Access();
    }
};

%extend Handle_MeshVS_DataSource {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_Drawer;
class MeshVS_Drawer : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	* This method copies other drawer contents to this.

	:param aDrawer:
	:type aDrawer: Handle_MeshVS_Drawer &
	:rtype: void
") Assign;
		virtual void Assign (const Handle_MeshVS_Drawer & aDrawer);
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: int
	:rtype: None
") SetInteger;
		void SetInteger (const Standard_Integer Key,const Standard_Integer Value);
		%feature("compactdefaultargs") SetDouble;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: float
	:rtype: None
") SetDouble;
		void SetDouble (const Standard_Integer Key,const Standard_Real Value);
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: bool
	:rtype: None
") SetBoolean;
		void SetBoolean (const Standard_Integer Key,const Standard_Boolean Value);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Standard_Integer Key,const Quantity_Color & Value);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: Graphic3d_MaterialAspect &
	:rtype: None
") SetMaterial;
		void SetMaterial (const Standard_Integer Key,const Graphic3d_MaterialAspect & Value);
		%feature("compactdefaultargs") SetAsciiString;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: TCollection_AsciiString &
	:rtype: None
") SetAsciiString;
		void SetAsciiString (const Standard_Integer Key,const TCollection_AsciiString & Value);
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: int &
	:rtype: bool
") GetInteger;
		Standard_Boolean GetInteger (const Standard_Integer Key,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetDouble;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: float &
	:rtype: bool
") GetDouble;
		Standard_Boolean GetDouble (const Standard_Integer Key,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: bool
	:rtype: bool
") GetBoolean;
		Standard_Boolean GetBoolean (const Standard_Integer Key,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: Quantity_Color &
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor (const Standard_Integer Key,Quantity_Color & Value);
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: Graphic3d_MaterialAspect &
	:rtype: bool
") GetMaterial;
		Standard_Boolean GetMaterial (const Standard_Integer Key,Graphic3d_MaterialAspect & Value);
		%feature("compactdefaultargs") GetAsciiString;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:param Value:
	:type Value: TCollection_AsciiString &
	:rtype: bool
") GetAsciiString;
		Standard_Boolean GetAsciiString (const Standard_Integer Key,TCollection_AsciiString & Value);
		%feature("compactdefaultargs") RemoveInteger;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:rtype: bool
") RemoveInteger;
		Standard_Boolean RemoveInteger (const Standard_Integer Key);
		%feature("compactdefaultargs") RemoveDouble;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:rtype: bool
") RemoveDouble;
		Standard_Boolean RemoveDouble (const Standard_Integer Key);
		%feature("compactdefaultargs") RemoveBoolean;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:rtype: bool
") RemoveBoolean;
		Standard_Boolean RemoveBoolean (const Standard_Integer Key);
		%feature("compactdefaultargs") RemoveColor;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:rtype: bool
") RemoveColor;
		Standard_Boolean RemoveColor (const Standard_Integer Key);
		%feature("compactdefaultargs") RemoveMaterial;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:rtype: bool
") RemoveMaterial;
		Standard_Boolean RemoveMaterial (const Standard_Integer Key);
		%feature("compactdefaultargs") RemoveAsciiString;
		%feature("autodoc", "	:param Key:
	:type Key: int
	:rtype: bool
") RemoveAsciiString;
		Standard_Boolean RemoveAsciiString (const Standard_Integer Key);
};


%extend MeshVS_Drawer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_Drawer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_Drawer::Handle_MeshVS_Drawer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_Drawer;
class Handle_MeshVS_Drawer : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MeshVS_Drawer();
        Handle_MeshVS_Drawer(const Handle_MeshVS_Drawer &aHandle);
        Handle_MeshVS_Drawer(const MeshVS_Drawer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_Drawer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_Drawer {
    MeshVS_Drawer* _get_reference() {
    return (MeshVS_Drawer*)$self->Access();
    }
};

%extend Handle_MeshVS_Drawer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_Drawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DummySensitiveEntity;
class MeshVS_DummySensitiveEntity : public SelectBasics_SensitiveEntity {
	public:
		%feature("compactdefaultargs") MeshVS_DummySensitiveEntity;
		%feature("autodoc", "	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: None
") MeshVS_DummySensitiveEntity;
		 MeshVS_DummySensitiveEntity (const Handle_SelectBasics_EntityOwner & theOwnerId);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "	:rtype: void
") BVH;
		virtual void BVH ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") HasInitLocation;
		%feature("autodoc", "	:rtype: bool
") HasInitLocation;
		virtual Standard_Boolean HasInitLocation ();
		%feature("compactdefaultargs") InvInitLocation;
		%feature("autodoc", "	:rtype: gp_Trsf
") InvInitLocation;
		virtual gp_Trsf InvInitLocation ();
};


%extend MeshVS_DummySensitiveEntity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DummySensitiveEntity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DummySensitiveEntity::Handle_MeshVS_DummySensitiveEntity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DummySensitiveEntity;
class Handle_MeshVS_DummySensitiveEntity : public Handle_SelectBasics_SensitiveEntity {

    public:
        // constructors
        Handle_MeshVS_DummySensitiveEntity();
        Handle_MeshVS_DummySensitiveEntity(const Handle_MeshVS_DummySensitiveEntity &aHandle);
        Handle_MeshVS_DummySensitiveEntity(const MeshVS_DummySensitiveEntity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DummySensitiveEntity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DummySensitiveEntity {
    MeshVS_DummySensitiveEntity* _get_reference() {
    return (MeshVS_DummySensitiveEntity*)$self->Access();
    }
};

%extend Handle_MeshVS_DummySensitiveEntity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DummySensitiveEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_HArray1OfSequenceOfInteger;
class MeshVS_HArray1OfSequenceOfInteger : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") MeshVS_HArray1OfSequenceOfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") MeshVS_HArray1OfSequenceOfInteger;
		 MeshVS_HArray1OfSequenceOfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") MeshVS_HArray1OfSequenceOfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: TColStd_SequenceOfInteger &
	:rtype: None
") MeshVS_HArray1OfSequenceOfInteger;
		 MeshVS_HArray1OfSequenceOfInteger (const Standard_Integer Low,const Standard_Integer Up,const TColStd_SequenceOfInteger & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TColStd_SequenceOfInteger &
	:rtype: None
") Init;
		void Init (const TColStd_SequenceOfInteger & V);
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
	:type Value: TColStd_SequenceOfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_SequenceOfInteger & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_SequenceOfInteger
") Value;
		const TColStd_SequenceOfInteger & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_SequenceOfInteger
") ChangeValue;
		TColStd_SequenceOfInteger & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: MeshVS_Array1OfSequenceOfInteger
") Array1;
		const MeshVS_Array1OfSequenceOfInteger & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: MeshVS_Array1OfSequenceOfInteger
") ChangeArray1;
		MeshVS_Array1OfSequenceOfInteger & ChangeArray1 ();
};


%extend MeshVS_HArray1OfSequenceOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_HArray1OfSequenceOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_HArray1OfSequenceOfInteger::Handle_MeshVS_HArray1OfSequenceOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_HArray1OfSequenceOfInteger;
class Handle_MeshVS_HArray1OfSequenceOfInteger : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MeshVS_HArray1OfSequenceOfInteger();
        Handle_MeshVS_HArray1OfSequenceOfInteger(const Handle_MeshVS_HArray1OfSequenceOfInteger &aHandle);
        Handle_MeshVS_HArray1OfSequenceOfInteger(const MeshVS_HArray1OfSequenceOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_HArray1OfSequenceOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_HArray1OfSequenceOfInteger {
    MeshVS_HArray1OfSequenceOfInteger* _get_reference() {
    return (MeshVS_HArray1OfSequenceOfInteger*)$self->Access();
    }
};

%extend Handle_MeshVS_HArray1OfSequenceOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_HArray1OfSequenceOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_MapIteratorOfMapOfTwoNodes;
class MeshVS_MapIteratorOfMapOfTwoNodes : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MeshVS_MapIteratorOfMapOfTwoNodes;
		%feature("autodoc", "	:rtype: None
") MeshVS_MapIteratorOfMapOfTwoNodes;
		 MeshVS_MapIteratorOfMapOfTwoNodes ();
		%feature("compactdefaultargs") MeshVS_MapIteratorOfMapOfTwoNodes;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_MapOfTwoNodes &
	:rtype: None
") MeshVS_MapIteratorOfMapOfTwoNodes;
		 MeshVS_MapIteratorOfMapOfTwoNodes (const MeshVS_MapOfTwoNodes & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MeshVS_MapOfTwoNodes &
	:rtype: None
") Initialize;
		void Initialize (const MeshVS_MapOfTwoNodes & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: MeshVS_TwoNodes
") Key;
		const MeshVS_TwoNodes & Key ();
};


%extend MeshVS_MapIteratorOfMapOfTwoNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_MapOfTwoNodes;
class MeshVS_MapOfTwoNodes : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MeshVS_MapOfTwoNodes;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MeshVS_MapOfTwoNodes;
		 MeshVS_MapOfTwoNodes (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") MeshVS_MapOfTwoNodes;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_MapOfTwoNodes &
	:rtype: None
") MeshVS_MapOfTwoNodes;
		 MeshVS_MapOfTwoNodes (const MeshVS_MapOfTwoNodes & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_MapOfTwoNodes &
	:rtype: MeshVS_MapOfTwoNodes
") Assign;
		MeshVS_MapOfTwoNodes & Assign (const MeshVS_MapOfTwoNodes & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_MapOfTwoNodes &
	:rtype: MeshVS_MapOfTwoNodes
") operator =;
		MeshVS_MapOfTwoNodes & operator = (const MeshVS_MapOfTwoNodes & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: MeshVS_TwoNodes &
	:rtype: bool
") Add;
		Standard_Boolean Add (const MeshVS_TwoNodes & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: MeshVS_TwoNodes &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const MeshVS_TwoNodes & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: MeshVS_TwoNodes &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const MeshVS_TwoNodes & aKey);
};


%extend MeshVS_MapOfTwoNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_Mesh;
class MeshVS_Mesh : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") MeshVS_Mesh;
		%feature("autodoc", "	* Constructor. theIsAllowOverlapped is Standard_True, if it is allowed to draw edges overlapped with beams Its value is stored in drawer

	:param theIsAllowOverlapped: default value is Standard_False
	:type theIsAllowOverlapped: bool
	:rtype: None
") MeshVS_Mesh;
		 MeshVS_Mesh (const Standard_Boolean theIsAllowOverlapped = Standard_False);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes presentation using builders added to sequence. Each builder computes own part of mesh presentation according to its type.

	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager3d &
	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void
") Compute;
		virtual void Compute (const Handle_PrsMgr_PresentationManager3d & PM,const Handle_Prs3d_Presentation & Prs,const Standard_Integer DisplayMode);
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "	* Computes selection according to SelectMode

	:param Sel:
	:type Sel: Handle_SelectMgr_Selection &
	:param SelectMode:
	:type SelectMode: int
	:rtype: void
") ComputeSelection;
		virtual void ComputeSelection (const Handle_SelectMgr_Selection & Sel,const Standard_Integer SelectMode);
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "	* Draw selected owners presentation

	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager3d &
	:param Owners:
	:type Owners: SelectMgr_SequenceOfOwner &
	:rtype: void
") HilightSelected;
		virtual void HilightSelected (const Handle_PrsMgr_PresentationManager3d & PM,const SelectMgr_SequenceOfOwner & Owners);
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "	* Draw hilighted owner presentation

	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager3d &
	:param Color:
	:type Color: Quantity_NameOfColor
	:param Owner:
	:type Owner: Handle_SelectMgr_EntityOwner &
	:rtype: void
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor (const Handle_PrsMgr_PresentationManager3d & PM,const Quantity_NameOfColor Color,const Handle_SelectMgr_EntityOwner & Owner);
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "	* Clears internal selection presentation

	:rtype: void
") ClearSelected;
		virtual void ClearSelected ();
		%feature("compactdefaultargs") GetBuildersCount;
		%feature("autodoc", "	* How many builders there are in sequence

	:rtype: int
") GetBuildersCount;
		Standard_Integer GetBuildersCount ();
		%feature("compactdefaultargs") GetBuilder;
		%feature("autodoc", "	* Returns builder by its index in sequence

	:param Index:
	:type Index: int
	:rtype: Handle_MeshVS_PrsBuilder
") GetBuilder;
		Handle_MeshVS_PrsBuilder GetBuilder (const Standard_Integer Index);
		%feature("compactdefaultargs") GetBuilderById;
		%feature("autodoc", "	* Returns builder by its ID

	:param Id:
	:type Id: int
	:rtype: Handle_MeshVS_PrsBuilder
") GetBuilderById;
		Handle_MeshVS_PrsBuilder GetBuilderById (const Standard_Integer Id);
		%feature("compactdefaultargs") GetFreeId;
		%feature("autodoc", "	* Returns the smallest positive ID, not occupied by any builder. This method using when builder is created with ID = -1

	:rtype: int
") GetFreeId;
		Standard_Integer GetFreeId ();
		%feature("compactdefaultargs") AddBuilder;
		%feature("autodoc", "	* Adds builder to tale of sequence. PrsBuilder is builder to be added If TreatAsHilighter is true, MeshVS_Mesh will use this builder to create presentation of hilighted and selected owners. Only one builder can be hilighter, so that if you call this method with TreatAsHilighter = Standard_True some times, only last builder will be hilighter WARNING: As minimum one builder must be added as hilighter, otherwise selection cannot be computed

	:param Builder:
	:type Builder: Handle_MeshVS_PrsBuilder &
	:param TreatAsHilighter: default value is Standard_False
	:type TreatAsHilighter: bool
	:rtype: None
") AddBuilder;
		void AddBuilder (const Handle_MeshVS_PrsBuilder & Builder,const Standard_Boolean TreatAsHilighter = Standard_False);
		%feature("compactdefaultargs") SetHilighter;
		%feature("autodoc", "	* Changes hilighter ( see above )

	:param Builder:
	:type Builder: Handle_MeshVS_PrsBuilder &
	:rtype: None
") SetHilighter;
		void SetHilighter (const Handle_MeshVS_PrsBuilder & Builder);
		%feature("compactdefaultargs") SetHilighter;
		%feature("autodoc", "	* Sets builder with sequence index 'Index' as hilighter

	:param Index:
	:type Index: int
	:rtype: bool
") SetHilighter;
		Standard_Boolean SetHilighter (const Standard_Integer Index);
		%feature("compactdefaultargs") SetHilighterById;
		%feature("autodoc", "	* Sets builder with identificator 'Id' as hilighter

	:param Id:
	:type Id: int
	:rtype: bool
") SetHilighterById;
		Standard_Boolean SetHilighterById (const Standard_Integer Id);
		%feature("compactdefaultargs") GetHilighter;
		%feature("autodoc", "	* Returns hilighter

	:rtype: Handle_MeshVS_PrsBuilder
") GetHilighter;
		Handle_MeshVS_PrsBuilder GetHilighter ();
		%feature("compactdefaultargs") RemoveBuilder;
		%feature("autodoc", "	* Removes builder from sequence. If it is hilighter, hilighter will be NULL ( Don't remember to set it to other after!!! )

	:param Index:
	:type Index: int
	:rtype: None
") RemoveBuilder;
		void RemoveBuilder (const Standard_Integer Index);
		%feature("compactdefaultargs") RemoveBuilderById;
		%feature("autodoc", "	* Removes builder with identificator Id

	:param Id:
	:type Id: int
	:rtype: None
") RemoveBuilderById;
		void RemoveBuilderById (const Standard_Integer Id);
		%feature("compactdefaultargs") FindBuilder;
		%feature("autodoc", "	* Finds builder by its type the string represents

	:param TypeString:
	:type TypeString: char *
	:rtype: Handle_MeshVS_PrsBuilder
") FindBuilder;
		Handle_MeshVS_PrsBuilder FindBuilder (const char * TypeString);
		%feature("compactdefaultargs") GetOwnerMaps;
		%feature("autodoc", "	* Returns map of owners.

	:param IsElement:
	:type IsElement: bool
	:rtype: MeshVS_DataMapOfIntegerOwner
") GetOwnerMaps;
		const MeshVS_DataMapOfIntegerOwner & GetOwnerMaps (const Standard_Boolean IsElement);
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "	* Returns default builders' data source

	:rtype: Handle_MeshVS_DataSource
") GetDataSource;
		Handle_MeshVS_DataSource GetDataSource ();
		%feature("compactdefaultargs") SetDataSource;
		%feature("autodoc", "	* Sets default builders' data source

	:param aDataSource:
	:type aDataSource: Handle_MeshVS_DataSource &
	:rtype: None
") SetDataSource;
		void SetDataSource (const Handle_MeshVS_DataSource & aDataSource);
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "	* Returns default builders' drawer

	:rtype: Handle_MeshVS_Drawer
") GetDrawer;
		Handle_MeshVS_Drawer GetDrawer ();
		%feature("compactdefaultargs") SetDrawer;
		%feature("autodoc", "	* Sets default builders' drawer

	:param aDrawer:
	:type aDrawer: Handle_MeshVS_Drawer &
	:rtype: None
") SetDrawer;
		void SetDrawer (const Handle_MeshVS_Drawer & aDrawer);
		%feature("compactdefaultargs") IsHiddenElem;
		%feature("autodoc", "	* Returns True if specified element is hidden By default no elements are hidden

	:param ID:
	:type ID: int
	:rtype: bool
") IsHiddenElem;
		Standard_Boolean IsHiddenElem (const Standard_Integer ID);
		%feature("compactdefaultargs") IsHiddenNode;
		%feature("autodoc", "	* Returns True if specified node is hidden. By default all nodes are hidden

	:param ID:
	:type ID: int
	:rtype: bool
") IsHiddenNode;
		Standard_Boolean IsHiddenNode (const Standard_Integer ID);
		%feature("compactdefaultargs") IsSelectableElem;
		%feature("autodoc", "	* Returns True if specified element is not hidden

	:param ID:
	:type ID: int
	:rtype: bool
") IsSelectableElem;
		Standard_Boolean IsSelectableElem (const Standard_Integer ID);
		%feature("compactdefaultargs") IsSelectableNode;
		%feature("autodoc", "	* Returns True if specified node is specified as selectable.

	:param ID:
	:type ID: int
	:rtype: bool
") IsSelectableNode;
		Standard_Boolean IsSelectableNode (const Standard_Integer ID);
		%feature("compactdefaultargs") GetHiddenNodes;
		%feature("autodoc", "	* Returns map of hidden nodes (may be null handle)

	:rtype: Handle_TColStd_HPackedMapOfInteger
") GetHiddenNodes;
		Handle_TColStd_HPackedMapOfInteger GetHiddenNodes ();
		%feature("compactdefaultargs") SetHiddenNodes;
		%feature("autodoc", "	* Sets map of hidden nodes, which shall not be displayed individually. If nodes shared by some elements shall not be drawn, they should be included into that map

	:param Ids:
	:type Ids: Handle_TColStd_HPackedMapOfInteger &
	:rtype: None
") SetHiddenNodes;
		void SetHiddenNodes (const Handle_TColStd_HPackedMapOfInteger & Ids);
		%feature("compactdefaultargs") GetHiddenElems;
		%feature("autodoc", "	* Returns map of hidden elements (may be null handle)

	:rtype: Handle_TColStd_HPackedMapOfInteger
") GetHiddenElems;
		Handle_TColStd_HPackedMapOfInteger GetHiddenElems ();
		%feature("compactdefaultargs") SetHiddenElems;
		%feature("autodoc", "	* Sets map of hidden elements

	:param Ids:
	:type Ids: Handle_TColStd_HPackedMapOfInteger &
	:rtype: None
") SetHiddenElems;
		void SetHiddenElems (const Handle_TColStd_HPackedMapOfInteger & Ids);
		%feature("compactdefaultargs") GetSelectableNodes;
		%feature("autodoc", "	* Returns map of selectable elements (may be null handle)

	:rtype: Handle_TColStd_HPackedMapOfInteger
") GetSelectableNodes;
		Handle_TColStd_HPackedMapOfInteger GetSelectableNodes ();
		%feature("compactdefaultargs") SetSelectableNodes;
		%feature("autodoc", "	* Sets map of selectable nodes.

	:param Ids:
	:type Ids: Handle_TColStd_HPackedMapOfInteger &
	:rtype: None
") SetSelectableNodes;
		void SetSelectableNodes (const Handle_TColStd_HPackedMapOfInteger & Ids);
		%feature("compactdefaultargs") UpdateSelectableNodes;
		%feature("autodoc", "	* Automatically computes selectable nodes; the node is considered as being selectable if it is either not hidden, or is hidden but referred by at least one non-hidden element. Thus all nodes that are visible (either individually, or as ends or corners of elements) are selectable by default.

	:rtype: None
") UpdateSelectableNodes;
		void UpdateSelectableNodes ();
		%feature("compactdefaultargs") GetMeshSelMethod;
		%feature("autodoc", "	* Returns set mesh selection method (see MeshVS.cdl)

	:rtype: MeshVS_MeshSelectionMethod
") GetMeshSelMethod;
		MeshVS_MeshSelectionMethod GetMeshSelMethod ();
		%feature("compactdefaultargs") SetMeshSelMethod;
		%feature("autodoc", "	* Sets mesh selection method (see MeshVS.cdl)

	:param M:
	:type M: MeshVS_MeshSelectionMethod
	:rtype: None
") SetMeshSelMethod;
		void SetMeshSelMethod (const MeshVS_MeshSelectionMethod M);
		%feature("compactdefaultargs") IsWholeMeshOwner;
		%feature("autodoc", "	* Returns True if the given owner represents a whole mesh.

	:param theOwner:
	:type theOwner: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsWholeMeshOwner;
		virtual Standard_Boolean IsWholeMeshOwner (const Handle_SelectMgr_EntityOwner & theOwner);
};


%extend MeshVS_Mesh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_Mesh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_Mesh::Handle_MeshVS_Mesh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_Mesh;
class Handle_MeshVS_Mesh : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_MeshVS_Mesh();
        Handle_MeshVS_Mesh(const Handle_MeshVS_Mesh &aHandle);
        Handle_MeshVS_Mesh(const MeshVS_Mesh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_Mesh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_Mesh {
    MeshVS_Mesh* _get_reference() {
    return (MeshVS_Mesh*)$self->Access();
    }
};

%extend Handle_MeshVS_Mesh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_Mesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_MeshEntityOwner;
class MeshVS_MeshEntityOwner : public SelectMgr_EntityOwner {
	public:
		%feature("compactdefaultargs") MeshVS_MeshEntityOwner;
		%feature("autodoc", "	:param SelObj:
	:type SelObj: SelectMgr_SOPtr &
	:param ID:
	:type ID: int
	:param MeshEntity:
	:type MeshEntity: Standard_Address
	:param Type:
	:type Type: MeshVS_EntityType &
	:param Priority: default value is 0
	:type Priority: int
	:param IsGroup: default value is Standard_False
	:type IsGroup: bool
	:rtype: None
") MeshVS_MeshEntityOwner;
		 MeshVS_MeshEntityOwner (const SelectMgr_SOPtr & SelObj,const Standard_Integer ID,const Standard_Address MeshEntity,const MeshVS_EntityType & Type,const Standard_Integer Priority = 0,const Standard_Boolean IsGroup = Standard_False);
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", "	* Returns an address of element or node data structure

	:rtype: Standard_Address
") Owner;
		Standard_Address Owner ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns type of element or node data structure

	:rtype: MeshVS_EntityType
") Type;
		MeshVS_EntityType Type ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns ID of element or node data structure

	:rtype: int
") ID;
		Standard_Integer ID ();
		%feature("compactdefaultargs") IsGroup;
		%feature("autodoc", "	* Returns true if owner represents group of nodes or elements

	:rtype: bool
") IsGroup;
		Standard_Boolean IsGroup ();
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	* Returns true if owner is hilighted

	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager &
	:param Mode: default value is 0
	:type Mode: int
	:rtype: bool
") IsHilighted;
		virtual Standard_Boolean IsHilighted (const Handle_PrsMgr_PresentationManager & PM,const Standard_Integer Mode = 0);
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "	* Hilights owner

	:rtype: void
") Hilight;
		virtual void Hilight ();
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "	* Hilights owner

	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager &
	:param Mode: default value is 0
	:type Mode: int
	:rtype: void
") Hilight;
		virtual void Hilight (const Handle_PrsMgr_PresentationManager & PM,const Standard_Integer Mode = 0);
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	* Hilights owner with the certain color

	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager3d &
	:param theColor:
	:type theColor: Quantity_NameOfColor
	:param Mode: default value is 0
	:type Mode: int
	:rtype: void
") HilightWithColor;
		virtual void HilightWithColor (const Handle_PrsMgr_PresentationManager3d & PM,const Quantity_NameOfColor theColor,const Standard_Integer Mode = 0);
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	* Strip hilight of owner

	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager &
	:param Mode: default value is 0
	:type Mode: int
	:rtype: void
") Unhilight;
		virtual void Unhilight (const Handle_PrsMgr_PresentationManager & PM,const Standard_Integer Mode = 0);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager &
	:param Mode: default value is 0
	:type Mode: int
	:rtype: void
") Clear;
		virtual void Clear (const Handle_PrsMgr_PresentationManager & PM,const Standard_Integer Mode = 0);
};


%extend MeshVS_MeshEntityOwner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_MeshEntityOwner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_MeshEntityOwner::Handle_MeshVS_MeshEntityOwner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_MeshEntityOwner;
class Handle_MeshVS_MeshEntityOwner : public Handle_SelectMgr_EntityOwner {

    public:
        // constructors
        Handle_MeshVS_MeshEntityOwner();
        Handle_MeshVS_MeshEntityOwner(const Handle_MeshVS_MeshEntityOwner &aHandle);
        Handle_MeshVS_MeshEntityOwner(const MeshVS_MeshEntityOwner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_MeshEntityOwner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_MeshEntityOwner {
    MeshVS_MeshEntityOwner* _get_reference() {
    return (MeshVS_MeshEntityOwner*)$self->Access();
    }
};

%extend Handle_MeshVS_MeshEntityOwner {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_MeshEntityOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_MeshOwner;
class MeshVS_MeshOwner : public SelectMgr_EntityOwner {
	public:
		%feature("compactdefaultargs") MeshVS_MeshOwner;
		%feature("autodoc", "	:param theSelObj:
	:type theSelObj: SelectMgr_SOPtr &
	:param theDS:
	:type theDS: Handle_MeshVS_DataSource &
	:param thePriority: default value is 0
	:type thePriority: int
	:rtype: None
") MeshVS_MeshOwner;
		 MeshVS_MeshOwner (const SelectMgr_SOPtr & theSelObj,const Handle_MeshVS_DataSource & theDS,const Standard_Integer thePriority = 0);
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "	:rtype: Handle_MeshVS_DataSource
") GetDataSource;
		Handle_MeshVS_DataSource GetDataSource ();
		%feature("compactdefaultargs") GetSelectedNodes;
		%feature("autodoc", "	* Returns ids of selected mesh nodes

	:rtype: Handle_TColStd_HPackedMapOfInteger
") GetSelectedNodes;
		Handle_TColStd_HPackedMapOfInteger GetSelectedNodes ();
		%feature("compactdefaultargs") GetSelectedElements;
		%feature("autodoc", "	* Returns ids of selected mesh elements

	:rtype: Handle_TColStd_HPackedMapOfInteger
") GetSelectedElements;
		Handle_TColStd_HPackedMapOfInteger GetSelectedElements ();
		%feature("compactdefaultargs") AddSelectedEntities;
		%feature("autodoc", "	* Saves ids of selected mesh entities

	:param Nodes:
	:type Nodes: Handle_TColStd_HPackedMapOfInteger &
	:param Elems:
	:type Elems: Handle_TColStd_HPackedMapOfInteger &
	:rtype: void
") AddSelectedEntities;
		virtual void AddSelectedEntities (const Handle_TColStd_HPackedMapOfInteger & Nodes,const Handle_TColStd_HPackedMapOfInteger & Elems);
		%feature("compactdefaultargs") ClearSelectedEntities;
		%feature("autodoc", "	* Clears ids of selected mesh entities

	:rtype: void
") ClearSelectedEntities;
		virtual void ClearSelectedEntities ();
		%feature("compactdefaultargs") GetDetectedNodes;
		%feature("autodoc", "	* Returns ids of hilighted mesh nodes

	:rtype: Handle_TColStd_HPackedMapOfInteger
") GetDetectedNodes;
		Handle_TColStd_HPackedMapOfInteger GetDetectedNodes ();
		%feature("compactdefaultargs") GetDetectedElements;
		%feature("autodoc", "	* Returns ids of hilighted mesh elements

	:rtype: Handle_TColStd_HPackedMapOfInteger
") GetDetectedElements;
		Handle_TColStd_HPackedMapOfInteger GetDetectedElements ();
		%feature("compactdefaultargs") SetDetectedEntities;
		%feature("autodoc", "	* Saves ids of hilighted mesh entities

	:param Nodes:
	:type Nodes: Handle_TColStd_HPackedMapOfInteger &
	:param Elems:
	:type Elems: Handle_TColStd_HPackedMapOfInteger &
	:rtype: None
") SetDetectedEntities;
		void SetDetectedEntities (const Handle_TColStd_HPackedMapOfInteger & Nodes,const Handle_TColStd_HPackedMapOfInteger & Elems);
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager3d &
	:param theColor:
	:type theColor: Quantity_NameOfColor
	:param Mode: default value is 0
	:type Mode: int
	:rtype: void
") HilightWithColor;
		virtual void HilightWithColor (const Handle_PrsMgr_PresentationManager3d & PM,const Quantity_NameOfColor theColor,const Standard_Integer Mode = 0);
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager &
	:param Mode: default value is 0
	:type Mode: int
	:rtype: void
") Unhilight;
		virtual void Unhilight (const Handle_PrsMgr_PresentationManager & PM,const Standard_Integer Mode = 0);
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "	:rtype: bool
") IsForcedHilight;
		virtual Standard_Boolean IsForcedHilight ();
};


%extend MeshVS_MeshOwner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_MeshOwner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_MeshOwner::Handle_MeshVS_MeshOwner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_MeshOwner;
class Handle_MeshVS_MeshOwner : public Handle_SelectMgr_EntityOwner {

    public:
        // constructors
        Handle_MeshVS_MeshOwner();
        Handle_MeshVS_MeshOwner(const Handle_MeshVS_MeshOwner &aHandle);
        Handle_MeshVS_MeshOwner(const MeshVS_MeshOwner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_MeshOwner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_MeshOwner {
    MeshVS_MeshOwner* _get_reference() {
    return (MeshVS_MeshOwner*)$self->Access();
    }
};

%extend Handle_MeshVS_MeshOwner {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_MeshOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_PrsBuilder;
class MeshVS_PrsBuilder : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds presentation of certain type of data. Prs is presentation object which this method constructs. IDs is set of numeric identificators forming object appearance. IDsToExclude is set of IDs to exclude from processing. If some entity has been excluded, it is not processed by other builders. IsElement indicates, IDs is identificators of nodes or elements. DisplayMode is numeric constant describing display mode (see MeshVS_DisplayModeFlags.hxx)

	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger &
	:param IsElement:
	:type IsElement: bool
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void
") Build;
		virtual void Build (const Handle_Prs3d_Presentation & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer DisplayMode);
		%feature("compactdefaultargs") CustomBuild;
		%feature("autodoc", "	* This method is called to build presentation of custom elements (they have MeshVS_ET_0D type). IDs is set of numeric identificators of elements for custom building. IDsToExclude is set of IDs to exclude from processing. If some entity has been excluded, it is not processed by other builders. DisplayMode is numeric constant describing display mode (see MeshVS_DisplayModeFlags.hxx)

	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger &
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void
") CustomBuild;
		virtual void CustomBuild (const Handle_Prs3d_Presentation & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Integer DisplayMode);
		%feature("compactdefaultargs") CustomSensitiveEntity;
		%feature("autodoc", "	* This method is called to build sensitive of custom elements ( they have MeshVS_ET_0D type )

	:param Owner:
	:type Owner: Handle_SelectBasics_EntityOwner &
	:param SelectMode:
	:type SelectMode: int
	:rtype: Handle_SelectBasics_SensitiveEntity
") CustomSensitiveEntity;
		virtual Handle_SelectBasics_SensitiveEntity CustomSensitiveEntity (const Handle_SelectBasics_EntityOwner & Owner,const Standard_Integer SelectMode);
		%feature("compactdefaultargs") GetFlags;
		%feature("autodoc", "	* Returns flags, assigned with builder during creation

	:rtype: int
") GetFlags;
		Standard_Integer GetFlags ();
		%feature("compactdefaultargs") TestFlags;
		%feature("autodoc", "	* Test whether display mode has flags assigned with this builder. This method has default implementation and can be redefined for advance behavior Returns Standard_True only if display mode is appropriate for this builder

	:param DisplayMode:
	:type DisplayMode: int
	:rtype: bool
") TestFlags;
		virtual Standard_Boolean TestFlags (const Standard_Integer DisplayMode);
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* Returns builder ID

	:rtype: int
") GetId;
		Standard_Integer GetId ();
		%feature("compactdefaultargs") GetPriority;
		%feature("autodoc", "	* Returns priority; as priority bigger, as soon builder will be called.

	:rtype: int
") GetPriority;
		Standard_Integer GetPriority ();
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "	* Returns custom data source or default ( from MeshVS_Mesh ) if custom is NULL

	:rtype: Handle_MeshVS_DataSource
") GetDataSource;
		Handle_MeshVS_DataSource GetDataSource ();
		%feature("compactdefaultargs") SetDataSource;
		%feature("autodoc", "	* Change custom data source

	:param newDS:
	:type newDS: Handle_MeshVS_DataSource &
	:rtype: None
") SetDataSource;
		void SetDataSource (const Handle_MeshVS_DataSource & newDS);
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "	* Returns custom drawer or default ( from MeshVS_Mesh ) if custom is NULL

	:rtype: Handle_MeshVS_Drawer
") GetDrawer;
		Handle_MeshVS_Drawer GetDrawer ();
		%feature("compactdefaultargs") SetDrawer;
		%feature("autodoc", "	* Change custom drawer

	:param newDr:
	:type newDr: Handle_MeshVS_Drawer &
	:rtype: None
") SetDrawer;
		void SetDrawer (const Handle_MeshVS_Drawer & newDr);
		%feature("compactdefaultargs") SetExcluding;
		%feature("autodoc", "	* Set excluding state. If it is Standard_True, the nodes or elements, processed by current builder will be noted and next builder won't process its.

	:param state:
	:type state: bool
	:rtype: None
") SetExcluding;
		void SetExcluding (const Standard_Boolean state);
		%feature("compactdefaultargs") IsExcludingOn;
		%feature("autodoc", "	* Read excluding state

	:rtype: bool
") IsExcludingOn;
		Standard_Boolean IsExcludingOn ();
		%feature("compactdefaultargs") SetPresentationManager;
		%feature("autodoc", "	* Set presentation manager for builder

	:param thePrsMgr:
	:type thePrsMgr: Handle_PrsMgr_PresentationManager3d &
	:rtype: None
") SetPresentationManager;
		void SetPresentationManager (const Handle_PrsMgr_PresentationManager3d & thePrsMgr);
		%feature("compactdefaultargs") GetPresentationManager;
		%feature("autodoc", "	* Get presentation manager of builder

	:rtype: Handle_PrsMgr_PresentationManager3d
") GetPresentationManager;
		Handle_PrsMgr_PresentationManager3d GetPresentationManager ();
};


%extend MeshVS_PrsBuilder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_PrsBuilder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_PrsBuilder::Handle_MeshVS_PrsBuilder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_PrsBuilder;
class Handle_MeshVS_PrsBuilder : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MeshVS_PrsBuilder();
        Handle_MeshVS_PrsBuilder(const Handle_MeshVS_PrsBuilder &aHandle);
        Handle_MeshVS_PrsBuilder(const MeshVS_PrsBuilder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_PrsBuilder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_PrsBuilder {
    MeshVS_PrsBuilder* _get_reference() {
    return (MeshVS_PrsBuilder*)$self->Access();
    }
};

%extend Handle_MeshVS_PrsBuilder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_PrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_SensitiveFace;
class MeshVS_SensitiveFace : public Select3D_SensitiveFace {
	public:
		%feature("compactdefaultargs") MeshVS_SensitiveFace;
		%feature("autodoc", "	:param theOwner:
	:type theOwner: Handle_SelectBasics_EntityOwner &
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt
	:param theSensType: default value is Select3D_TOS_INTERIOR
	:type theSensType: Select3D_TypeOfSensitivity
	:rtype: None
") MeshVS_SensitiveFace;
		 MeshVS_SensitiveFace (const Handle_SelectBasics_EntityOwner & theOwner,const TColgp_Array1OfPnt & thePoints,const Select3D_TypeOfSensitivity theSensType = Select3D_TOS_INTERIOR);
};


%extend MeshVS_SensitiveFace {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_SensitiveFace(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_SensitiveFace::Handle_MeshVS_SensitiveFace %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_SensitiveFace;
class Handle_MeshVS_SensitiveFace : public Handle_Select3D_SensitiveFace {

    public:
        // constructors
        Handle_MeshVS_SensitiveFace();
        Handle_MeshVS_SensitiveFace(const Handle_MeshVS_SensitiveFace &aHandle);
        Handle_MeshVS_SensitiveFace(const MeshVS_SensitiveFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_SensitiveFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_SensitiveFace {
    MeshVS_SensitiveFace* _get_reference() {
    return (MeshVS_SensitiveFace*)$self->Access();
    }
};

%extend Handle_MeshVS_SensitiveFace {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_SensitiveFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_SensitiveMesh;
class MeshVS_SensitiveMesh : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") MeshVS_SensitiveMesh;
		%feature("autodoc", "	:param theOwner:
	:type theOwner: Handle_SelectBasics_EntityOwner &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") MeshVS_SensitiveMesh;
		 MeshVS_SensitiveMesh (const Handle_SelectBasics_EntityOwner & theOwner,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") GetMode;
		%feature("autodoc", "	:rtype: int
") GetMode;
		Standard_Integer GetMode ();
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of mesh nodes

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of mesh

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of mesh

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
};


%extend MeshVS_SensitiveMesh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_SensitiveMesh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_SensitiveMesh::Handle_MeshVS_SensitiveMesh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_SensitiveMesh;
class Handle_MeshVS_SensitiveMesh : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_MeshVS_SensitiveMesh();
        Handle_MeshVS_SensitiveMesh(const Handle_MeshVS_SensitiveMesh &aHandle);
        Handle_MeshVS_SensitiveMesh(const MeshVS_SensitiveMesh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_SensitiveMesh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_SensitiveMesh {
    MeshVS_SensitiveMesh* _get_reference() {
    return (MeshVS_SensitiveMesh*)$self->Access();
    }
};

%extend Handle_MeshVS_SensitiveMesh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_SensitiveMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_SensitivePolyhedron;
class MeshVS_SensitivePolyhedron : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") MeshVS_SensitivePolyhedron;
		%feature("autodoc", "	:param theOwner:
	:type theOwner: Handle_SelectBasics_EntityOwner &
	:param theNodes:
	:type theNodes: TColgp_Array1OfPnt
	:param theTopo:
	:type theTopo: Handle_MeshVS_HArray1OfSequenceOfInteger &
	:rtype: None
") MeshVS_SensitivePolyhedron;
		 MeshVS_SensitivePolyhedron (const Handle_SelectBasics_EntityOwner & theOwner,const TColgp_Array1OfPnt & theNodes,const Handle_MeshVS_HArray1OfSequenceOfInteger & theTopo);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of nodes of polyhedron

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
};


%extend MeshVS_SensitivePolyhedron {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_SensitivePolyhedron(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_SensitivePolyhedron::Handle_MeshVS_SensitivePolyhedron %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_SensitivePolyhedron;
class Handle_MeshVS_SensitivePolyhedron : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_MeshVS_SensitivePolyhedron();
        Handle_MeshVS_SensitivePolyhedron(const Handle_MeshVS_SensitivePolyhedron &aHandle);
        Handle_MeshVS_SensitivePolyhedron(const MeshVS_SensitivePolyhedron *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_SensitivePolyhedron DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_SensitivePolyhedron {
    MeshVS_SensitivePolyhedron* _get_reference() {
    return (MeshVS_SensitivePolyhedron*)$self->Access();
    }
};

%extend Handle_MeshVS_SensitivePolyhedron {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_SensitivePolyhedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_SensitiveSegment;
class MeshVS_SensitiveSegment : public Select3D_SensitiveSegment {
	public:
		%feature("compactdefaultargs") MeshVS_SensitiveSegment;
		%feature("autodoc", "	:param theOwner:
	:type theOwner: Handle_SelectBasics_EntityOwner &
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:rtype: None
") MeshVS_SensitiveSegment;
		 MeshVS_SensitiveSegment (const Handle_SelectBasics_EntityOwner & theOwner,const gp_Pnt & theFirstPnt,const gp_Pnt & theLastPnt);
};


%extend MeshVS_SensitiveSegment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_SensitiveSegment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_SensitiveSegment::Handle_MeshVS_SensitiveSegment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_SensitiveSegment;
class Handle_MeshVS_SensitiveSegment : public Handle_Select3D_SensitiveSegment {

    public:
        // constructors
        Handle_MeshVS_SensitiveSegment();
        Handle_MeshVS_SensitiveSegment(const Handle_MeshVS_SensitiveSegment &aHandle);
        Handle_MeshVS_SensitiveSegment(const MeshVS_SensitiveSegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_SensitiveSegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_SensitiveSegment {
    MeshVS_SensitiveSegment* _get_reference() {
    return (MeshVS_SensitiveSegment*)$self->Access();
    }
};

%extend Handle_MeshVS_SensitiveSegment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_SensitiveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_SequenceNodeOfSequenceOfPrsBuilder;
class MeshVS_SequenceNodeOfSequenceOfPrsBuilder : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") MeshVS_SequenceNodeOfSequenceOfPrsBuilder;
		%feature("autodoc", "	:param I:
	:type I: Handle_MeshVS_PrsBuilder &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") MeshVS_SequenceNodeOfSequenceOfPrsBuilder;
		 MeshVS_SequenceNodeOfSequenceOfPrsBuilder (const Handle_MeshVS_PrsBuilder & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MeshVS_PrsBuilder
") Value;
		Handle_MeshVS_PrsBuilder Value ();
};


%extend MeshVS_SequenceNodeOfSequenceOfPrsBuilder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder::Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder;
class Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder();
        Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder(const Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder &aHandle);
        Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder(const MeshVS_SequenceNodeOfSequenceOfPrsBuilder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder {
    MeshVS_SequenceNodeOfSequenceOfPrsBuilder* _get_reference() {
    return (MeshVS_SequenceNodeOfSequenceOfPrsBuilder*)$self->Access();
    }
};

%extend Handle_MeshVS_SequenceNodeOfSequenceOfPrsBuilder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_SequenceNodeOfSequenceOfPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_SequenceOfPrsBuilder;
class MeshVS_SequenceOfPrsBuilder : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") MeshVS_SequenceOfPrsBuilder;
		%feature("autodoc", "	:rtype: None
") MeshVS_SequenceOfPrsBuilder;
		 MeshVS_SequenceOfPrsBuilder ();
		%feature("compactdefaultargs") MeshVS_SequenceOfPrsBuilder;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_SequenceOfPrsBuilder &
	:rtype: None
") MeshVS_SequenceOfPrsBuilder;
		 MeshVS_SequenceOfPrsBuilder (const MeshVS_SequenceOfPrsBuilder & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_SequenceOfPrsBuilder &
	:rtype: MeshVS_SequenceOfPrsBuilder
") Assign;
		const MeshVS_SequenceOfPrsBuilder & Assign (const MeshVS_SequenceOfPrsBuilder & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MeshVS_SequenceOfPrsBuilder &
	:rtype: MeshVS_SequenceOfPrsBuilder
") operator =;
		const MeshVS_SequenceOfPrsBuilder & operator = (const MeshVS_SequenceOfPrsBuilder & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_MeshVS_PrsBuilder &
	:rtype: None
") Append;
		void Append (const Handle_MeshVS_PrsBuilder & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: MeshVS_SequenceOfPrsBuilder &
	:rtype: None
") Append;
		void Append (MeshVS_SequenceOfPrsBuilder & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_MeshVS_PrsBuilder &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MeshVS_PrsBuilder & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: MeshVS_SequenceOfPrsBuilder &
	:rtype: None
") Prepend;
		void Prepend (MeshVS_SequenceOfPrsBuilder & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_MeshVS_PrsBuilder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MeshVS_PrsBuilder & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: MeshVS_SequenceOfPrsBuilder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MeshVS_SequenceOfPrsBuilder & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_MeshVS_PrsBuilder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MeshVS_PrsBuilder & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: MeshVS_SequenceOfPrsBuilder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MeshVS_SequenceOfPrsBuilder & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_MeshVS_PrsBuilder
") First;
		Handle_MeshVS_PrsBuilder First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_MeshVS_PrsBuilder
") Last;
		Handle_MeshVS_PrsBuilder Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: MeshVS_SequenceOfPrsBuilder &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,MeshVS_SequenceOfPrsBuilder & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_MeshVS_PrsBuilder
") Value;
		Handle_MeshVS_PrsBuilder Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_MeshVS_PrsBuilder &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_MeshVS_PrsBuilder & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_MeshVS_PrsBuilder
") ChangeValue;
		Handle_MeshVS_PrsBuilder ChangeValue (const Standard_Integer Index);
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


%extend MeshVS_SequenceOfPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_StdMapNodeOfMapOfTwoNodes;
class MeshVS_StdMapNodeOfMapOfTwoNodes : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MeshVS_StdMapNodeOfMapOfTwoNodes;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoNodes &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MeshVS_StdMapNodeOfMapOfTwoNodes;
		 MeshVS_StdMapNodeOfMapOfTwoNodes (const MeshVS_TwoNodes & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: MeshVS_TwoNodes
") Key;
		MeshVS_TwoNodes & Key ();
};


%extend MeshVS_StdMapNodeOfMapOfTwoNodes {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_StdMapNodeOfMapOfTwoNodes(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_StdMapNodeOfMapOfTwoNodes::Handle_MeshVS_StdMapNodeOfMapOfTwoNodes %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_StdMapNodeOfMapOfTwoNodes;
class Handle_MeshVS_StdMapNodeOfMapOfTwoNodes : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MeshVS_StdMapNodeOfMapOfTwoNodes();
        Handle_MeshVS_StdMapNodeOfMapOfTwoNodes(const Handle_MeshVS_StdMapNodeOfMapOfTwoNodes &aHandle);
        Handle_MeshVS_StdMapNodeOfMapOfTwoNodes(const MeshVS_StdMapNodeOfMapOfTwoNodes *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_StdMapNodeOfMapOfTwoNodes DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_StdMapNodeOfMapOfTwoNodes {
    MeshVS_StdMapNodeOfMapOfTwoNodes* _get_reference() {
    return (MeshVS_StdMapNodeOfMapOfTwoNodes*)$self->Access();
    }
};

%extend Handle_MeshVS_StdMapNodeOfMapOfTwoNodes {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_StdMapNodeOfMapOfTwoNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_SymmetricPairHasher;
class MeshVS_SymmetricPairHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param thePair:
	:type thePair: MeshVS_NodePair &
	:param theMaxCode:
	:type theMaxCode: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const MeshVS_NodePair & thePair,const Standard_Integer theMaxCode);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param thePair1:
	:type thePair1: MeshVS_NodePair &
	:param thePair2:
	:type thePair2: MeshVS_NodePair &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const MeshVS_NodePair & thePair1,const MeshVS_NodePair & thePair2);
};


%extend MeshVS_SymmetricPairHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class MeshVS_Tool {
	public:
		%feature("compactdefaultargs") CreateAspectFillArea3d;
		%feature("autodoc", "	* Creates fill area aspect with values from Drawer according to keys from DrawerAttribute

	:param theDr:
	:type theDr: Handle_MeshVS_Drawer &
	:param UseDefaults: default value is Standard_True
	:type UseDefaults: bool
	:rtype: Handle_Graphic3d_AspectFillArea3d
") CreateAspectFillArea3d;
		static Handle_Graphic3d_AspectFillArea3d CreateAspectFillArea3d (const Handle_MeshVS_Drawer & theDr,const Standard_Boolean UseDefaults = Standard_True);
		%feature("compactdefaultargs") CreateAspectFillArea3d;
		%feature("autodoc", "	* Creates fill aspect with values from Drawer according to keys from DrawerAttribute and specific material aspect

	:param theDr:
	:type theDr: Handle_MeshVS_Drawer &
	:param Mat:
	:type Mat: Graphic3d_MaterialAspect &
	:param UseDefaults: default value is Standard_True
	:type UseDefaults: bool
	:rtype: Handle_Graphic3d_AspectFillArea3d
") CreateAspectFillArea3d;
		static Handle_Graphic3d_AspectFillArea3d CreateAspectFillArea3d (const Handle_MeshVS_Drawer & theDr,const Graphic3d_MaterialAspect & Mat,const Standard_Boolean UseDefaults = Standard_True);
		%feature("compactdefaultargs") CreateAspectLine3d;
		%feature("autodoc", "	* Creates line aspect with values from Drawer according to keys from DrawerAttribute

	:param theDr:
	:type theDr: Handle_MeshVS_Drawer &
	:param UseDefaults: default value is Standard_True
	:type UseDefaults: bool
	:rtype: Handle_Graphic3d_AspectLine3d
") CreateAspectLine3d;
		static Handle_Graphic3d_AspectLine3d CreateAspectLine3d (const Handle_MeshVS_Drawer & theDr,const Standard_Boolean UseDefaults = Standard_True);
		%feature("compactdefaultargs") CreateAspectMarker3d;
		%feature("autodoc", "	* Creates marker aspect with values from Drawer according to keys from DrawerAttribute

	:param theDr:
	:type theDr: Handle_MeshVS_Drawer &
	:param UseDefaults: default value is Standard_True
	:type UseDefaults: bool
	:rtype: Handle_Graphic3d_AspectMarker3d
") CreateAspectMarker3d;
		static Handle_Graphic3d_AspectMarker3d CreateAspectMarker3d (const Handle_MeshVS_Drawer & theDr,const Standard_Boolean UseDefaults = Standard_True);
		%feature("compactdefaultargs") CreateAspectText3d;
		%feature("autodoc", "	* Creates text aspect with values from Drawer according to keys from DrawerAttribute

	:param theDr:
	:type theDr: Handle_MeshVS_Drawer &
	:param UseDefaults: default value is Standard_True
	:type UseDefaults: bool
	:rtype: Handle_Graphic3d_AspectText3d
") CreateAspectText3d;
		static Handle_Graphic3d_AspectText3d CreateAspectText3d (const Handle_MeshVS_Drawer & theDr,const Standard_Boolean UseDefaults = Standard_True);
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "	* Get one of normals to polygon described by these points. If the polygon isn't planar, function returns false

	:param Nodes:
	:type Nodes: TColStd_Array1OfReal &
	:param Norm:
	:type Norm: gp_Vec
	:rtype: bool
") GetNormal;
		static Standard_Boolean GetNormal (const TColStd_Array1OfReal & Nodes,gp_Vec & Norm);
		%feature("compactdefaultargs") GetAverageNormal;
		%feature("autodoc", "	* Get an average of normals to non-planar polygon described by these points or compute normal of planar polygon. If the polygon isn't planar, function returns false

	:param Nodes:
	:type Nodes: TColStd_Array1OfReal &
	:param Norm:
	:type Norm: gp_Vec
	:rtype: bool
") GetAverageNormal;
		static Standard_Boolean GetAverageNormal (const TColStd_Array1OfReal & Nodes,gp_Vec & Norm);
};


%extend MeshVS_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_TwoColors;
class MeshVS_TwoColors {
	public:
		unsigned int r1;
		unsigned int g1;
		unsigned int b1;
		unsigned int r2;
		unsigned int g2;
		unsigned int b2;
};


%extend MeshVS_TwoColors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class MeshVS_TwoColorsHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoColors &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const MeshVS_TwoColors & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: MeshVS_TwoColors &
	:param K2:
	:type K2: MeshVS_TwoColors &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const MeshVS_TwoColors & K1,const MeshVS_TwoColors & K2);
};


%extend MeshVS_TwoColorsHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_TwoNodes;
class MeshVS_TwoNodes {
	public:
		int First;
		int Second;
		%feature("compactdefaultargs") MeshVS_TwoNodes;
		%feature("autodoc", "	:param aFirst: default value is 0
	:type aFirst: int
	:param aSecond: default value is 0
	:type aSecond: int
	:rtype: None
") MeshVS_TwoNodes;
		 MeshVS_TwoNodes (Standard_Integer aFirst = 0,Standard_Integer aSecond = 0);
};


%extend MeshVS_TwoNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class MeshVS_TwoNodesHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: MeshVS_TwoNodes &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const MeshVS_TwoNodes & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: MeshVS_TwoNodes &
	:param K2:
	:type K2: MeshVS_TwoNodes &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const MeshVS_TwoNodes & K1,const MeshVS_TwoNodes & K2);
};


%extend MeshVS_TwoNodesHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DataSource3D;
class MeshVS_DataSource3D : public MeshVS_DataSource {
	public:
		%feature("compactdefaultargs") GetPrismTopology;
		%feature("autodoc", "	:param BasePoints:
	:type BasePoints: int
	:rtype: Handle_MeshVS_HArray1OfSequenceOfInteger
") GetPrismTopology;
		Handle_MeshVS_HArray1OfSequenceOfInteger GetPrismTopology (const Standard_Integer BasePoints);
		%feature("compactdefaultargs") GetPyramidTopology;
		%feature("autodoc", "	:param BasePoints:
	:type BasePoints: int
	:rtype: Handle_MeshVS_HArray1OfSequenceOfInteger
") GetPyramidTopology;
		Handle_MeshVS_HArray1OfSequenceOfInteger GetPyramidTopology (const Standard_Integer BasePoints);
		%feature("compactdefaultargs") CreatePrismTopology;
		%feature("autodoc", "	:param BasePoints:
	:type BasePoints: int
	:rtype: Handle_MeshVS_HArray1OfSequenceOfInteger
") CreatePrismTopology;
		static Handle_MeshVS_HArray1OfSequenceOfInteger CreatePrismTopology (const Standard_Integer BasePoints);
		%feature("compactdefaultargs") CreatePyramidTopology;
		%feature("autodoc", "	:param BasePoints:
	:type BasePoints: int
	:rtype: Handle_MeshVS_HArray1OfSequenceOfInteger
") CreatePyramidTopology;
		static Handle_MeshVS_HArray1OfSequenceOfInteger CreatePyramidTopology (const Standard_Integer BasePoints);
};


%extend MeshVS_DataSource3D {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DataSource3D(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DataSource3D::Handle_MeshVS_DataSource3D %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DataSource3D;
class Handle_MeshVS_DataSource3D : public Handle_MeshVS_DataSource {

    public:
        // constructors
        Handle_MeshVS_DataSource3D();
        Handle_MeshVS_DataSource3D(const Handle_MeshVS_DataSource3D &aHandle);
        Handle_MeshVS_DataSource3D(const MeshVS_DataSource3D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DataSource3D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DataSource3D {
    MeshVS_DataSource3D* _get_reference() {
    return (MeshVS_DataSource3D*)$self->Access();
    }
};

%extend Handle_MeshVS_DataSource3D {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DataSource3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_DeformedDataSource;
class MeshVS_DeformedDataSource : public MeshVS_DataSource {
	public:
		%feature("compactdefaultargs") MeshVS_DeformedDataSource;
		%feature("autodoc", "	* Constructor theNonDeformDS is canonical non-deformed data source, by which we are able to calculate deformed mesh geometry theMagnify is coefficient of displacement magnify

	:param theNonDeformDS:
	:type theNonDeformDS: Handle_MeshVS_DataSource &
	:param theMagnify:
	:type theMagnify: float
	:rtype: None
") MeshVS_DeformedDataSource;
		 MeshVS_DeformedDataSource (const Handle_MeshVS_DataSource & theNonDeformDS,const Standard_Real theMagnify);
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:param Coords:
	:type Coords: TColStd_Array1OfReal &
	:param NbNodes:
	:type NbNodes: int &
	:param Type:
	:type Type: MeshVS_EntityType &
	:rtype: bool
") GetGeom;
		virtual Standard_Boolean GetGeom (const Standard_Integer ID,const Standard_Boolean IsElement,TColStd_Array1OfReal & Coords,Standard_Integer &OutValue,MeshVS_EntityType & Type);
		%feature("compactdefaultargs") GetGeomType;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:param Type:
	:type Type: MeshVS_EntityType &
	:rtype: bool
") GetGeomType;
		virtual Standard_Boolean GetGeomType (const Standard_Integer ID,const Standard_Boolean IsElement,MeshVS_EntityType & Type);
		%feature("compactdefaultargs") Get3DGeom;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:param NbNodes:
	:type NbNodes: int &
	:param Data:
	:type Data: Handle_MeshVS_HArray1OfSequenceOfInteger &
	:rtype: bool
") Get3DGeom;
		virtual Standard_Boolean Get3DGeom (const Standard_Integer ID,Standard_Integer &OutValue,Handle_MeshVS_HArray1OfSequenceOfInteger & Data);
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:rtype: Standard_Address
") GetAddr;
		virtual Standard_Address GetAddr (const Standard_Integer ID,const Standard_Boolean IsElement);
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:param NodeIDs:
	:type NodeIDs: TColStd_Array1OfInteger &
	:param NbNodes:
	:type NbNodes: int &
	:rtype: bool
") GetNodesByElement;
		virtual Standard_Boolean GetNodesByElement (const Standard_Integer ID,TColStd_Array1OfInteger & NodeIDs,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", "	:rtype: TColStd_PackedMapOfInteger
") GetAllNodes;
		virtual const TColStd_PackedMapOfInteger & GetAllNodes ();
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", "	:rtype: TColStd_PackedMapOfInteger
") GetAllElements;
		virtual const TColStd_PackedMapOfInteger & GetAllElements ();
		%feature("compactdefaultargs") GetVectors;
		%feature("autodoc", "	* This method returns map of nodal displacement vectors

	:rtype: MeshVS_DataMapOfIntegerVector
") GetVectors;
		const MeshVS_DataMapOfIntegerVector & GetVectors ();
		%feature("compactdefaultargs") SetVectors;
		%feature("autodoc", "	* This method sets map of nodal displacement vectors (Map).

	:param Map:
	:type Map: MeshVS_DataMapOfIntegerVector &
	:rtype: None
") SetVectors;
		void SetVectors (const MeshVS_DataMapOfIntegerVector & Map);
		%feature("compactdefaultargs") GetVector;
		%feature("autodoc", "	* This method returns vector ( Vect ) assigned to node number ID.

	:param ID:
	:type ID: int
	:param Vect:
	:type Vect: gp_Vec
	:rtype: bool
") GetVector;
		Standard_Boolean GetVector (const Standard_Integer ID,gp_Vec & Vect);
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "	* This method sets vector ( Vect ) assigned to node number ID.

	:param ID:
	:type ID: int
	:param Vect:
	:type Vect: gp_Vec
	:rtype: None
") SetVector;
		void SetVector (const Standard_Integer ID,const gp_Vec & Vect);
		%feature("compactdefaultargs") SetNonDeformedDataSource;
		%feature("autodoc", "	:param theDS:
	:type theDS: Handle_MeshVS_DataSource &
	:rtype: None
") SetNonDeformedDataSource;
		void SetNonDeformedDataSource (const Handle_MeshVS_DataSource & theDS);
		%feature("compactdefaultargs") GetNonDeformedDataSource;
		%feature("autodoc", "	* With this methods you can read and change internal canonical data source

	:rtype: Handle_MeshVS_DataSource
") GetNonDeformedDataSource;
		Handle_MeshVS_DataSource GetNonDeformedDataSource ();
		%feature("compactdefaultargs") SetMagnify;
		%feature("autodoc", "	:param theMagnify:
	:type theMagnify: float
	:rtype: None
") SetMagnify;
		void SetMagnify (const Standard_Real theMagnify);
		%feature("compactdefaultargs") GetMagnify;
		%feature("autodoc", "	* With this methods you can read and change magnify coefficient of nodal displacements

	:rtype: float
") GetMagnify;
		Standard_Real GetMagnify ();
};


%extend MeshVS_DeformedDataSource {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_DeformedDataSource(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_DeformedDataSource::Handle_MeshVS_DeformedDataSource %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_DeformedDataSource;
class Handle_MeshVS_DeformedDataSource : public Handle_MeshVS_DataSource {

    public:
        // constructors
        Handle_MeshVS_DeformedDataSource();
        Handle_MeshVS_DeformedDataSource(const Handle_MeshVS_DeformedDataSource &aHandle);
        Handle_MeshVS_DeformedDataSource(const MeshVS_DeformedDataSource *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_DeformedDataSource DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_DeformedDataSource {
    MeshVS_DeformedDataSource* _get_reference() {
    return (MeshVS_DeformedDataSource*)$self->Access();
    }
};

%extend Handle_MeshVS_DeformedDataSource {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_DeformedDataSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_ElementalColorPrsBuilder;
class MeshVS_ElementalColorPrsBuilder : public MeshVS_PrsBuilder {
	public:
		%feature("compactdefaultargs") MeshVS_ElementalColorPrsBuilder;
		%feature("autodoc", "	* Constructor

	:param Parent:
	:type Parent: Handle_MeshVS_Mesh &
	:param Flags: default value is MeshVS_DMF_ElementalColorDataPrs
	:type Flags: MeshVS_DisplayModeFlags &
	:param DS: default value is 0
	:type DS: Handle_MeshVS_DataSource &
	:param Id: default value is -1
	:type Id: int
	:param Priority: default value is MeshVS_BP_ElemColor
	:type Priority: MeshVS_BuilderPriority &
	:rtype: None
") MeshVS_ElementalColorPrsBuilder;
		 MeshVS_ElementalColorPrsBuilder (const Handle_MeshVS_Mesh & Parent,const MeshVS_DisplayModeFlags & Flags = MeshVS_DMF_ElementalColorDataPrs,const Handle_MeshVS_DataSource & DS = 0,const Standard_Integer Id = -1,const MeshVS_BuilderPriority & Priority = MeshVS_BP_ElemColor);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds presentation of elements with assigned colors.

	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger &
	:param IsElement:
	:type IsElement: bool
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void
") Build;
		virtual void Build (const Handle_Prs3d_Presentation & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer DisplayMode);
		%feature("compactdefaultargs") GetColors1;
		%feature("autodoc", "	* Returns map of colors same for front and back side of face.

	:rtype: MeshVS_DataMapOfIntegerColor
") GetColors1;
		const MeshVS_DataMapOfIntegerColor & GetColors1 ();
		%feature("compactdefaultargs") SetColors1;
		%feature("autodoc", "	* Sets map of colors same for front and back side of face.

	:param Map:
	:type Map: MeshVS_DataMapOfIntegerColor &
	:rtype: None
") SetColors1;
		void SetColors1 (const MeshVS_DataMapOfIntegerColor & Map);
		%feature("compactdefaultargs") HasColors1;
		%feature("autodoc", "	* Returns true, if map of colors isn't empty

	:rtype: bool
") HasColors1;
		Standard_Boolean HasColors1 ();
		%feature("compactdefaultargs") GetColor1;
		%feature("autodoc", "	* Returns color assigned with element number ID

	:param ID:
	:type ID: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: bool
") GetColor1;
		Standard_Boolean GetColor1 (const Standard_Integer ID,Quantity_Color & theColor);
		%feature("compactdefaultargs") SetColor1;
		%feature("autodoc", "	* Sets color assigned with element number ID

	:param ID:
	:type ID: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor1;
		void SetColor1 (const Standard_Integer ID,const Quantity_Color & theColor);
		%feature("compactdefaultargs") GetColors2;
		%feature("autodoc", "	* Returns map of different colors for front and back side of face

	:rtype: MeshVS_DataMapOfIntegerTwoColors
") GetColors2;
		const MeshVS_DataMapOfIntegerTwoColors & GetColors2 ();
		%feature("compactdefaultargs") SetColors2;
		%feature("autodoc", "	* Sets map of different colors for front and back side of face

	:param Map:
	:type Map: MeshVS_DataMapOfIntegerTwoColors &
	:rtype: None
") SetColors2;
		void SetColors2 (const MeshVS_DataMapOfIntegerTwoColors & Map);
		%feature("compactdefaultargs") HasColors2;
		%feature("autodoc", "	* Returns true, if map isn't empty

	:rtype: bool
") HasColors2;
		Standard_Boolean HasColors2 ();
		%feature("compactdefaultargs") GetColor2;
		%feature("autodoc", "	* Returns colors assigned with element number ID

	:param ID:
	:type ID: int
	:param theColor:
	:type theColor: MeshVS_TwoColors &
	:rtype: bool
") GetColor2;
		Standard_Boolean GetColor2 (const Standard_Integer ID,MeshVS_TwoColors & theColor);
		%feature("compactdefaultargs") GetColor2;
		%feature("autodoc", "	* Returns colors assigned with element number ID theColor1 is the front element color theColor2 is the back element color

	:param ID:
	:type ID: int
	:param theColor1:
	:type theColor1: Quantity_Color &
	:param theColor2:
	:type theColor2: Quantity_Color &
	:rtype: bool
") GetColor2;
		Standard_Boolean GetColor2 (const Standard_Integer ID,Quantity_Color & theColor1,Quantity_Color & theColor2);
		%feature("compactdefaultargs") SetColor2;
		%feature("autodoc", "	* Sets colors assigned with element number ID

	:param ID:
	:type ID: int
	:param theTwoColors:
	:type theTwoColors: MeshVS_TwoColors &
	:rtype: None
") SetColor2;
		void SetColor2 (const Standard_Integer ID,const MeshVS_TwoColors & theTwoColors);
		%feature("compactdefaultargs") SetColor2;
		%feature("autodoc", "	* Sets color assigned with element number ID theColor1 is the front element color theColor2 is the back element color

	:param ID:
	:type ID: int
	:param theColor1:
	:type theColor1: Quantity_Color &
	:param theColor2:
	:type theColor2: Quantity_Color &
	:rtype: None
") SetColor2;
		void SetColor2 (const Standard_Integer ID,const Quantity_Color & theColor1,const Quantity_Color & theColor2);
};


%extend MeshVS_ElementalColorPrsBuilder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_ElementalColorPrsBuilder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_ElementalColorPrsBuilder::Handle_MeshVS_ElementalColorPrsBuilder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_ElementalColorPrsBuilder;
class Handle_MeshVS_ElementalColorPrsBuilder : public Handle_MeshVS_PrsBuilder {

    public:
        // constructors
        Handle_MeshVS_ElementalColorPrsBuilder();
        Handle_MeshVS_ElementalColorPrsBuilder(const Handle_MeshVS_ElementalColorPrsBuilder &aHandle);
        Handle_MeshVS_ElementalColorPrsBuilder(const MeshVS_ElementalColorPrsBuilder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_ElementalColorPrsBuilder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_ElementalColorPrsBuilder {
    MeshVS_ElementalColorPrsBuilder* _get_reference() {
    return (MeshVS_ElementalColorPrsBuilder*)$self->Access();
    }
};

%extend Handle_MeshVS_ElementalColorPrsBuilder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_ElementalColorPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_MeshPrsBuilder;
class MeshVS_MeshPrsBuilder : public MeshVS_PrsBuilder {
	public:
		%feature("compactdefaultargs") MeshVS_MeshPrsBuilder;
		%feature("autodoc", "	* Creates builder with certain display mode flags, data source, ID and priority

	:param Parent:
	:type Parent: Handle_MeshVS_Mesh &
	:param Flags: default value is MeshVS_DMF_OCCMask
	:type Flags: MeshVS_DisplayModeFlags &
	:param DS: default value is 0
	:type DS: Handle_MeshVS_DataSource &
	:param Id: default value is -1
	:type Id: int
	:param Priority: default value is MeshVS_BP_Mesh
	:type Priority: MeshVS_BuilderPriority &
	:rtype: None
") MeshVS_MeshPrsBuilder;
		 MeshVS_MeshPrsBuilder (const Handle_MeshVS_Mesh & Parent,const MeshVS_DisplayModeFlags & Flags = MeshVS_DMF_OCCMask,const Handle_MeshVS_DataSource & DS = 0,const Standard_Integer Id = -1,const MeshVS_BuilderPriority & Priority = MeshVS_BP_Mesh);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds base mesh presentation by calling the methods below

	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger &
	:param IsElement:
	:type IsElement: bool
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void
") Build;
		virtual void Build (const Handle_Prs3d_Presentation & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer DisplayMode);
		%feature("compactdefaultargs") BuildNodes;
		%feature("autodoc", "	* Builds nodes presentation

	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger &
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void
") BuildNodes;
		virtual void BuildNodes (const Handle_Prs3d_Presentation & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Integer DisplayMode);
		%feature("compactdefaultargs") BuildElements;
		%feature("autodoc", "	* Builds elements presentation

	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger &
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void
") BuildElements;
		virtual void BuildElements (const Handle_Prs3d_Presentation & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Integer DisplayMode);
		%feature("compactdefaultargs") BuildHilightPrs;
		%feature("autodoc", "	* Builds presentation of hilighted entity

	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param IsElement:
	:type IsElement: bool
	:rtype: void
") BuildHilightPrs;
		virtual void BuildHilightPrs (const Handle_Prs3d_Presentation & Prs,const TColStd_PackedMapOfInteger & IDs,const Standard_Boolean IsElement);
		%feature("compactdefaultargs") AddVolumePrs;
		%feature("autodoc", "	* Add to array polygons or polylines representing volume

	:param Topo:
	:type Topo: Handle_MeshVS_HArray1OfSequenceOfInteger &
	:param Nodes:
	:type Nodes: TColStd_Array1OfReal &
	:param NbNodes:
	:type NbNodes: int
	:param Array:
	:type Array: Handle_Graphic3d_ArrayOfPrimitives &
	:param IsReflected:
	:type IsReflected: bool
	:param IsShrinked:
	:type IsShrinked: bool
	:param IsSelect:
	:type IsSelect: bool
	:param ShrinkCoef:
	:type ShrinkCoef: float
	:rtype: void
") AddVolumePrs;
		static void AddVolumePrs (const Handle_MeshVS_HArray1OfSequenceOfInteger & Topo,const TColStd_Array1OfReal & Nodes,const Standard_Integer NbNodes,const Handle_Graphic3d_ArrayOfPrimitives & Array,const Standard_Boolean IsReflected,const Standard_Boolean IsShrinked,const Standard_Boolean IsSelect,const Standard_Real ShrinkCoef);
		%feature("compactdefaultargs") HowManyPrimitives;
		%feature("autodoc", "	* Calculate how many polygons or polylines are necessary to draw passed topology

	:param Topo:
	:type Topo: Handle_MeshVS_HArray1OfSequenceOfInteger &
	:param AsPolygons:
	:type AsPolygons: bool
	:param IsSelect:
	:type IsSelect: bool
	:param NbNodes:
	:type NbNodes: int
	:param Vertices:
	:type Vertices: int &
	:param Bounds:
	:type Bounds: int &
	:rtype: void
") HowManyPrimitives;
		static void HowManyPrimitives (const Handle_MeshVS_HArray1OfSequenceOfInteger & Topo,const Standard_Boolean AsPolygons,const Standard_Boolean IsSelect,const Standard_Integer NbNodes,Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%extend MeshVS_MeshPrsBuilder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_MeshPrsBuilder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_MeshPrsBuilder::Handle_MeshVS_MeshPrsBuilder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_MeshPrsBuilder;
class Handle_MeshVS_MeshPrsBuilder : public Handle_MeshVS_PrsBuilder {

    public:
        // constructors
        Handle_MeshVS_MeshPrsBuilder();
        Handle_MeshVS_MeshPrsBuilder(const Handle_MeshVS_MeshPrsBuilder &aHandle);
        Handle_MeshVS_MeshPrsBuilder(const MeshVS_MeshPrsBuilder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_MeshPrsBuilder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_MeshPrsBuilder {
    MeshVS_MeshPrsBuilder* _get_reference() {
    return (MeshVS_MeshPrsBuilder*)$self->Access();
    }
};

%extend Handle_MeshVS_MeshPrsBuilder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_MeshPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_NodalColorPrsBuilder;
class MeshVS_NodalColorPrsBuilder : public MeshVS_PrsBuilder {
	public:
		%feature("compactdefaultargs") MeshVS_NodalColorPrsBuilder;
		%feature("autodoc", "	:param Parent:
	:type Parent: Handle_MeshVS_Mesh &
	:param Flags: default value is MeshVS_DMF_NodalColorDataPrs
	:type Flags: MeshVS_DisplayModeFlags &
	:param DS: default value is 0
	:type DS: Handle_MeshVS_DataSource &
	:param Id: default value is -1
	:type Id: int
	:param Priority: default value is MeshVS_BP_NodalColor
	:type Priority: MeshVS_BuilderPriority &
	:rtype: None
") MeshVS_NodalColorPrsBuilder;
		 MeshVS_NodalColorPrsBuilder (const Handle_MeshVS_Mesh & Parent,const MeshVS_DisplayModeFlags & Flags = MeshVS_DMF_NodalColorDataPrs,const Handle_MeshVS_DataSource & DS = 0,const Standard_Integer Id = -1,const MeshVS_BuilderPriority & Priority = MeshVS_BP_NodalColor);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds presentation of nodes with assigned color.

	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger &
	:param IsElement:
	:type IsElement: bool
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void
") Build;
		virtual void Build (const Handle_Prs3d_Presentation & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer DisplayMode);
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "	* Returns map of colors assigned to nodes.

	:rtype: MeshVS_DataMapOfIntegerColor
") GetColors;
		const MeshVS_DataMapOfIntegerColor & GetColors ();
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* Sets map of colors assigned to nodes.

	:param Map:
	:type Map: MeshVS_DataMapOfIntegerColor &
	:rtype: None
") SetColors;
		void SetColors (const MeshVS_DataMapOfIntegerColor & Map);
		%feature("compactdefaultargs") HasColors;
		%feature("autodoc", "	* Returns true, if map isn't empty

	:rtype: bool
") HasColors;
		Standard_Boolean HasColors ();
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	* Returns color assigned to single node

	:param ID:
	:type ID: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor (const Standard_Integer ID,Quantity_Color & theColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets color assigned to single node

	:param ID:
	:type ID: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Standard_Integer ID,const Quantity_Color & theColor);
		%feature("compactdefaultargs") UseTexture;
		%feature("autodoc", "	* Specify whether texture must be used to build presentation

	:param theToUse:
	:type theToUse: bool
	:rtype: None
") UseTexture;
		void UseTexture (const Standard_Boolean theToUse);
		%feature("compactdefaultargs") IsUseTexture;
		%feature("autodoc", "	* Verify whether texture is used to build presentation

	:rtype: bool
") IsUseTexture;
		Standard_Boolean IsUseTexture ();
		%feature("compactdefaultargs") SetColorMap;
		%feature("autodoc", "	* Set colors to be used for texrture presentation theColors - colors for valid coordinates (laying in range [0, 1])

	:param theColors:
	:type theColors: Aspect_SequenceOfColor &
	:rtype: None
") SetColorMap;
		void SetColorMap (const Aspect_SequenceOfColor & theColors);
		%feature("compactdefaultargs") GetColorMap;
		%feature("autodoc", "	* Return colors used for texrture presentation

	:rtype: Aspect_SequenceOfColor
") GetColorMap;
		const Aspect_SequenceOfColor & GetColorMap ();
		%feature("compactdefaultargs") SetInvalidColor;
		%feature("autodoc", "	* Set color representing invalid texture coordinate (laying outside range [0, 1])

	:param theInvalidColor:
	:type theInvalidColor: Quantity_Color &
	:rtype: None
") SetInvalidColor;
		void SetInvalidColor (const Quantity_Color & theInvalidColor);
		%feature("compactdefaultargs") GetInvalidColor;
		%feature("autodoc", "	* Return color representing invalid texture coordinate (laying outside range [0, 1])

	:rtype: Quantity_Color
") GetInvalidColor;
		Quantity_Color GetInvalidColor ();
		%feature("compactdefaultargs") SetTextureCoords;
		%feature("autodoc", "	* Specify correspondence between node IDs and texture coordinates (range [0, 1])

	:param theMap:
	:type theMap: TColStd_DataMapOfIntegerReal &
	:rtype: None
") SetTextureCoords;
		void SetTextureCoords (const TColStd_DataMapOfIntegerReal & theMap);
		%feature("compactdefaultargs") GetTextureCoords;
		%feature("autodoc", "	* Get correspondence between node IDs and texture coordinates (range [0, 1])

	:rtype: TColStd_DataMapOfIntegerReal
") GetTextureCoords;
		const TColStd_DataMapOfIntegerReal & GetTextureCoords ();
		%feature("compactdefaultargs") SetTextureCoord;
		%feature("autodoc", "	* Specify correspondence between node ID and texture coordinate (range [0, 1])

	:param theID:
	:type theID: int
	:param theCoord:
	:type theCoord: float
	:rtype: None
") SetTextureCoord;
		void SetTextureCoord (const Standard_Integer theID,const Standard_Real theCoord);
		%feature("compactdefaultargs") GetTextureCoord;
		%feature("autodoc", "	* Return correspondence between node IDs and texture coordinate (range [0, 1])

	:param theID:
	:type theID: int
	:rtype: float
") GetTextureCoord;
		Standard_Real GetTextureCoord (const Standard_Integer theID);
		%feature("compactdefaultargs") AddVolumePrs;
		%feature("autodoc", "	* Add to array polygons or polylines representing volume

	:param theTopo:
	:type theTopo: Handle_MeshVS_HArray1OfSequenceOfInteger &
	:param theNodes:
	:type theNodes: TColStd_Array1OfInteger &
	:param theCoords:
	:type theCoords: TColStd_Array1OfReal &
	:param theArray:
	:type theArray: Handle_Graphic3d_ArrayOfPrimitives &
	:param theIsShaded:
	:type theIsShaded: bool
	:param theNbColors:
	:type theNbColors: int
	:param theNbTexColors:
	:type theNbTexColors: int
	:param theColorRatio:
	:type theColorRatio: float
	:rtype: None
") AddVolumePrs;
		void AddVolumePrs (const Handle_MeshVS_HArray1OfSequenceOfInteger & theTopo,const TColStd_Array1OfInteger & theNodes,const TColStd_Array1OfReal & theCoords,const Handle_Graphic3d_ArrayOfPrimitives & theArray,const Standard_Boolean theIsShaded,const Standard_Integer theNbColors,const Standard_Integer theNbTexColors,const Standard_Real theColorRatio);
};


%extend MeshVS_NodalColorPrsBuilder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_NodalColorPrsBuilder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_NodalColorPrsBuilder::Handle_MeshVS_NodalColorPrsBuilder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_NodalColorPrsBuilder;
class Handle_MeshVS_NodalColorPrsBuilder : public Handle_MeshVS_PrsBuilder {

    public:
        // constructors
        Handle_MeshVS_NodalColorPrsBuilder();
        Handle_MeshVS_NodalColorPrsBuilder(const Handle_MeshVS_NodalColorPrsBuilder &aHandle);
        Handle_MeshVS_NodalColorPrsBuilder(const MeshVS_NodalColorPrsBuilder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_NodalColorPrsBuilder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_NodalColorPrsBuilder {
    MeshVS_NodalColorPrsBuilder* _get_reference() {
    return (MeshVS_NodalColorPrsBuilder*)$self->Access();
    }
};

%extend Handle_MeshVS_NodalColorPrsBuilder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_NodalColorPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_TextPrsBuilder;
class MeshVS_TextPrsBuilder : public MeshVS_PrsBuilder {
	public:
		%feature("compactdefaultargs") MeshVS_TextPrsBuilder;
		%feature("autodoc", "	:param Parent:
	:type Parent: Handle_MeshVS_Mesh &
	:param Height:
	:type Height: float
	:param Color:
	:type Color: Quantity_Color &
	:param Flags: default value is MeshVS_DMF_TextDataPrs
	:type Flags: MeshVS_DisplayModeFlags &
	:param DS: default value is 0
	:type DS: Handle_MeshVS_DataSource &
	:param Id: default value is -1
	:type Id: int
	:param Priority: default value is MeshVS_BP_Text
	:type Priority: MeshVS_BuilderPriority &
	:rtype: None
") MeshVS_TextPrsBuilder;
		 MeshVS_TextPrsBuilder (const Handle_MeshVS_Mesh & Parent,const Standard_Real Height,const Quantity_Color & Color,const MeshVS_DisplayModeFlags & Flags = MeshVS_DMF_TextDataPrs,const Handle_MeshVS_DataSource & DS = 0,const Standard_Integer Id = -1,const MeshVS_BuilderPriority & Priority = MeshVS_BP_Text);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds presentation of text data

	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger &
	:param IsElement:
	:type IsElement: bool
	:param theDisplayMode:
	:type theDisplayMode: int
	:rtype: void
") Build;
		virtual void Build (const Handle_Prs3d_Presentation & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer theDisplayMode);
		%feature("compactdefaultargs") GetTexts;
		%feature("autodoc", "	* Returns map of text assigned with nodes ( IsElement = False ) or elements ( IsElement = True )

	:param IsElement:
	:type IsElement: bool
	:rtype: MeshVS_DataMapOfIntegerAsciiString
") GetTexts;
		const MeshVS_DataMapOfIntegerAsciiString & GetTexts (const Standard_Boolean IsElement);
		%feature("compactdefaultargs") SetTexts;
		%feature("autodoc", "	* Sets map of text assigned with nodes or elements

	:param IsElement:
	:type IsElement: bool
	:param Map:
	:type Map: MeshVS_DataMapOfIntegerAsciiString &
	:rtype: None
") SetTexts;
		void SetTexts (const Standard_Boolean IsElement,const MeshVS_DataMapOfIntegerAsciiString & Map);
		%feature("compactdefaultargs") HasTexts;
		%feature("autodoc", "	* Returns True if map isn't empty

	:param IsElement:
	:type IsElement: bool
	:rtype: bool
") HasTexts;
		Standard_Boolean HasTexts (const Standard_Boolean IsElement);
		%feature("compactdefaultargs") GetText;
		%feature("autodoc", "	* Returns text assigned with single node or element

	:param IsElement:
	:type IsElement: bool
	:param ID:
	:type ID: int
	:param Text:
	:type Text: TCollection_AsciiString &
	:rtype: bool
") GetText;
		Standard_Boolean GetText (const Standard_Boolean IsElement,const Standard_Integer ID,TCollection_AsciiString & Text);
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "	* Sets text assigned with single node or element

	:param IsElement:
	:type IsElement: bool
	:param ID:
	:type ID: int
	:param Text:
	:type Text: TCollection_AsciiString &
	:rtype: None
") SetText;
		void SetText (const Standard_Boolean IsElement,const Standard_Integer ID,const TCollection_AsciiString & Text);
};


%extend MeshVS_TextPrsBuilder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_TextPrsBuilder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_TextPrsBuilder::Handle_MeshVS_TextPrsBuilder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_TextPrsBuilder;
class Handle_MeshVS_TextPrsBuilder : public Handle_MeshVS_PrsBuilder {

    public:
        // constructors
        Handle_MeshVS_TextPrsBuilder();
        Handle_MeshVS_TextPrsBuilder(const Handle_MeshVS_TextPrsBuilder &aHandle);
        Handle_MeshVS_TextPrsBuilder(const MeshVS_TextPrsBuilder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_TextPrsBuilder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_TextPrsBuilder {
    MeshVS_TextPrsBuilder* _get_reference() {
    return (MeshVS_TextPrsBuilder*)$self->Access();
    }
};

%extend Handle_MeshVS_TextPrsBuilder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_TextPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MeshVS_VectorPrsBuilder;
class MeshVS_VectorPrsBuilder : public MeshVS_PrsBuilder {
	public:
		%feature("compactdefaultargs") MeshVS_VectorPrsBuilder;
		%feature("autodoc", "	:param Parent:
	:type Parent: Handle_MeshVS_Mesh &
	:param MaxLength:
	:type MaxLength: float
	:param VectorColor:
	:type VectorColor: Quantity_Color &
	:param Flags: default value is MeshVS_DMF_VectorDataPrs
	:type Flags: MeshVS_DisplayModeFlags &
	:param DS: default value is 0
	:type DS: Handle_MeshVS_DataSource &
	:param Id: default value is -1
	:type Id: int
	:param Priority: default value is MeshVS_BP_Vector
	:type Priority: MeshVS_BuilderPriority &
	:param IsSimplePrs: default value is Standard_False
	:type IsSimplePrs: bool
	:rtype: None
") MeshVS_VectorPrsBuilder;
		 MeshVS_VectorPrsBuilder (const Handle_MeshVS_Mesh & Parent,const Standard_Real MaxLength,const Quantity_Color & VectorColor,const MeshVS_DisplayModeFlags & Flags = MeshVS_DMF_VectorDataPrs,const Handle_MeshVS_DataSource & DS = 0,const Standard_Integer Id = -1,const MeshVS_BuilderPriority & Priority = MeshVS_BP_Vector,const Standard_Boolean IsSimplePrs = Standard_False);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds vector data presentation

	:param Prs:
	:type Prs: Handle_Prs3d_Presentation &
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger &
	:param IsElement:
	:type IsElement: bool
	:param theDisplayMode:
	:type theDisplayMode: int
	:rtype: void
") Build;
		virtual void Build (const Handle_Prs3d_Presentation & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer theDisplayMode);
		%feature("compactdefaultargs") DrawVector;
		%feature("autodoc", "	* Adds to array of polygons and polylines some primitive representing single vector

	:param theTrsf:
	:type theTrsf: gp_Trsf
	:param Length:
	:type Length: float
	:param MaxLength:
	:type MaxLength: float
	:param ArrowPoints:
	:type ArrowPoints: TColgp_Array1OfPnt
	:param Lines:
	:type Lines: Handle_Graphic3d_ArrayOfPrimitives &
	:param ArrowLines:
	:type ArrowLines: Handle_Graphic3d_ArrayOfPrimitives &
	:param Triangles:
	:type Triangles: Handle_Graphic3d_ArrayOfPrimitives &
	:rtype: None
") DrawVector;
		void DrawVector (const gp_Trsf & theTrsf,const Standard_Real Length,const Standard_Real MaxLength,const TColgp_Array1OfPnt & ArrowPoints,const Handle_Graphic3d_ArrayOfPrimitives & Lines,const Handle_Graphic3d_ArrayOfPrimitives & ArrowLines,const Handle_Graphic3d_ArrayOfPrimitives & Triangles);
		%feature("compactdefaultargs") calculateArrow;
		%feature("autodoc", "	* Calculates points of arrow presentation

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Length:
	:type Length: float
	:param ArrowPart:
	:type ArrowPart: float
	:rtype: float
") calculateArrow;
		static Standard_Real calculateArrow (TColgp_Array1OfPnt & Points,const Standard_Real Length,const Standard_Real ArrowPart);
		%feature("compactdefaultargs") GetVectors;
		%feature("autodoc", "	* Returns map of vectors assigned with nodes or elements

	:param IsElement:
	:type IsElement: bool
	:rtype: MeshVS_DataMapOfIntegerVector
") GetVectors;
		const MeshVS_DataMapOfIntegerVector & GetVectors (const Standard_Boolean IsElement);
		%feature("compactdefaultargs") SetVectors;
		%feature("autodoc", "	* Sets map of vectors assigned with nodes or elements

	:param IsElement:
	:type IsElement: bool
	:param Map:
	:type Map: MeshVS_DataMapOfIntegerVector &
	:rtype: None
") SetVectors;
		void SetVectors (const Standard_Boolean IsElement,const MeshVS_DataMapOfIntegerVector & Map);
		%feature("compactdefaultargs") HasVectors;
		%feature("autodoc", "	* Returns true, if map isn't empty

	:param IsElement:
	:type IsElement: bool
	:rtype: bool
") HasVectors;
		Standard_Boolean HasVectors (const Standard_Boolean IsElement);
		%feature("compactdefaultargs") GetVector;
		%feature("autodoc", "	* Returns vector assigned with certain node or element

	:param IsElement:
	:type IsElement: bool
	:param ID:
	:type ID: int
	:param Vect:
	:type Vect: gp_Vec
	:rtype: bool
") GetVector;
		Standard_Boolean GetVector (const Standard_Boolean IsElement,const Standard_Integer ID,gp_Vec & Vect);
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "	* Sets vector assigned with certain node or element

	:param IsElement:
	:type IsElement: bool
	:param ID:
	:type ID: int
	:param Vect:
	:type Vect: gp_Vec
	:rtype: None
") SetVector;
		void SetVector (const Standard_Boolean IsElement,const Standard_Integer ID,const gp_Vec & Vect);
		%feature("compactdefaultargs") GetMinMaxVectorValue;
		%feature("autodoc", "	* Calculates minimal and maximal length of vectors in map ( nodal, if IsElement = False or elemental, if IsElement = True )

	:param IsElement:
	:type IsElement: bool
	:param MinValue:
	:type MinValue: float &
	:param MaxValue:
	:type MaxValue: float &
	:rtype: None
") GetMinMaxVectorValue;
		void GetMinMaxVectorValue (const Standard_Boolean IsElement,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetSimplePrsMode;
		%feature("autodoc", "	* Sets flag that indicates is simple vector arrow mode uses or not default value is False

	:param IsSimpleArrow:
	:type IsSimpleArrow: bool
	:rtype: None
") SetSimplePrsMode;
		void SetSimplePrsMode (const Standard_Boolean IsSimpleArrow);
		%feature("compactdefaultargs") SetSimplePrsParams;
		%feature("autodoc", "	* Sets parameters of simple vector arrwo presentation theLineWidthParam - coefficient of vector line width (to draw line instead of arrow) theStartParam and theEndParam parameters of start and end of thickened ends position of thickening calculates according to parameters and maximum vector length default values are: theLineWidthParam = 2.5 theStartParam = 0.85 theEndParam = 0.95

	:param theLineWidthParam:
	:type theLineWidthParam: float
	:param theStartParam:
	:type theStartParam: float
	:param theEndParam:
	:type theEndParam: float
	:rtype: None
") SetSimplePrsParams;
		void SetSimplePrsParams (const Standard_Real theLineWidthParam,const Standard_Real theStartParam,const Standard_Real theEndParam);
};


%extend MeshVS_VectorPrsBuilder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MeshVS_VectorPrsBuilder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MeshVS_VectorPrsBuilder::Handle_MeshVS_VectorPrsBuilder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MeshVS_VectorPrsBuilder;
class Handle_MeshVS_VectorPrsBuilder : public Handle_MeshVS_PrsBuilder {

    public:
        // constructors
        Handle_MeshVS_VectorPrsBuilder();
        Handle_MeshVS_VectorPrsBuilder(const Handle_MeshVS_VectorPrsBuilder &aHandle);
        Handle_MeshVS_VectorPrsBuilder(const MeshVS_VectorPrsBuilder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MeshVS_VectorPrsBuilder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MeshVS_VectorPrsBuilder {
    MeshVS_VectorPrsBuilder* _get_reference() {
    return (MeshVS_VectorPrsBuilder*)$self->Access();
    }
};

%extend Handle_MeshVS_VectorPrsBuilder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MeshVS_VectorPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
