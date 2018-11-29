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
%define STEPFEADOCSTRING
""
%enddef
%module (package="OCC.Core", docstring=STEPFEADOCSTRING) StepFEA

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


%include StepFEA_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum StepFEA_ElementVolume {
	StepFEA_Volume = 0,
};

enum StepFEA_CoordinateSystemType {
	StepFEA_Cartesian = 0,
	StepFEA_Cylindrical = 1,
	StepFEA_Spherical = 2,
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

enum StepFEA_CurveEdge {
	StepFEA_ElementEdge = 0,
};

enum StepFEA_UnspecifiedValue {
	StepFEA_Unspecified = 0,
};

/* end public enums declaration */

%wrap_handle(StepFEA_Curve3dElementProperty)
%wrap_handle(StepFEA_CurveElementEndOffset)
%wrap_handle(StepFEA_CurveElementEndRelease)
%wrap_handle(StepFEA_CurveElementInterval)
%wrap_handle(StepFEA_CurveElementLocation)
%wrap_handle(StepFEA_DegreeOfFreedomMember)
%wrap_handle(StepFEA_ElementGeometricRelationship)
%wrap_handle(StepFEA_ElementRepresentation)
%wrap_handle(StepFEA_FeaAxis2Placement3d)
%wrap_handle(StepFEA_FeaCurveSectionGeometricRelationship)
%wrap_handle(StepFEA_FeaGroup)
%wrap_handle(StepFEA_FeaMaterialPropertyRepresentation)
%wrap_handle(StepFEA_FeaMaterialPropertyRepresentationItem)
%wrap_handle(StepFEA_FeaModel)
%wrap_handle(StepFEA_FeaModelDefinition)
%wrap_handle(StepFEA_FeaParametricPoint)
%wrap_handle(StepFEA_FeaRepresentationItem)
%wrap_handle(StepFEA_FeaSurfaceSectionGeometricRelationship)
%wrap_handle(StepFEA_FreedomAndCoefficient)
%wrap_handle(StepFEA_FreedomsList)
%wrap_handle(StepFEA_HArray1OfCurveElementEndOffset)
%wrap_handle(StepFEA_HArray1OfCurveElementEndRelease)
%wrap_handle(StepFEA_HArray1OfCurveElementInterval)
%wrap_handle(StepFEA_HArray1OfDegreeOfFreedom)
%wrap_handle(StepFEA_HArray1OfElementRepresentation)
%wrap_handle(StepFEA_HArray1OfNodeRepresentation)
%wrap_handle(StepFEA_HSequenceOfCurve3dElementProperty)
%wrap_handle(StepFEA_HSequenceOfElementGeometricRelationship)
%wrap_handle(StepFEA_HSequenceOfElementRepresentation)
%wrap_handle(StepFEA_HSequenceOfNodeRepresentation)
%wrap_handle(StepFEA_NodeDefinition)
%wrap_handle(StepFEA_NodeRepresentation)
%wrap_handle(StepFEA_NodeSet)
%wrap_handle(StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty)
%wrap_handle(StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship)
%wrap_handle(StepFEA_SequenceNodeOfSequenceOfElementRepresentation)
%wrap_handle(StepFEA_SequenceNodeOfSequenceOfNodeRepresentation)
%wrap_handle(StepFEA_SymmetricTensor23dMember)
%wrap_handle(StepFEA_SymmetricTensor43dMember)
%wrap_handle(StepFEA_AlignedCurve3dElementCoordinateSystem)
%wrap_handle(StepFEA_AlignedSurface3dElementCoordinateSystem)
%wrap_handle(StepFEA_ArbitraryVolume3dElementCoordinateSystem)
%wrap_handle(StepFEA_ConstantSurface3dElementCoordinateSystem)
%wrap_handle(StepFEA_Curve3dElementRepresentation)
%wrap_handle(StepFEA_CurveElementIntervalConstant)
%wrap_handle(StepFEA_CurveElementIntervalLinearlyVarying)
%wrap_handle(StepFEA_DummyNode)
%wrap_handle(StepFEA_ElementGroup)
%wrap_handle(StepFEA_FeaAreaDensity)
%wrap_handle(StepFEA_FeaLinearElasticity)
%wrap_handle(StepFEA_FeaMassDensity)
%wrap_handle(StepFEA_FeaModel3d)
%wrap_handle(StepFEA_FeaMoistureAbsorption)
%wrap_handle(StepFEA_FeaSecantCoefficientOfLinearThermalExpansion)
%wrap_handle(StepFEA_FeaShellBendingStiffness)
%wrap_handle(StepFEA_FeaShellMembraneBendingCouplingStiffness)
%wrap_handle(StepFEA_FeaShellMembraneStiffness)
%wrap_handle(StepFEA_FeaShellShearStiffness)
%wrap_handle(StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion)
%wrap_handle(StepFEA_GeometricNode)
%wrap_handle(StepFEA_Node)
%wrap_handle(StepFEA_NodeGroup)
%wrap_handle(StepFEA_ParametricCurve3dElementCoordinateDirection)
%wrap_handle(StepFEA_ParametricCurve3dElementCoordinateSystem)
%wrap_handle(StepFEA_ParametricSurface3dElementCoordinateSystem)
%wrap_handle(StepFEA_Surface3dElementRepresentation)
%wrap_handle(StepFEA_Volume3dElementRepresentation)
%wrap_handle(StepFEA_NodeWithSolutionCoordinateSystem)
%wrap_handle(StepFEA_NodeWithVector)

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


%make_alias(StepFEA_Curve3dElementProperty)

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


%make_alias(StepFEA_CurveElementEndOffset)

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


%make_alias(StepFEA_CurveElementEndRelease)

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


%make_alias(StepFEA_CurveElementInterval)

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


%make_alias(StepFEA_CurveElementLocation)

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


%make_alias(StepFEA_DegreeOfFreedomMember)

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


%make_alias(StepFEA_ElementGeometricRelationship)

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


%make_alias(StepFEA_ElementRepresentation)

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


%make_alias(StepFEA_FeaAxis2Placement3d)

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


%make_alias(StepFEA_FeaCurveSectionGeometricRelationship)

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


%make_alias(StepFEA_FeaGroup)

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


%make_alias(StepFEA_FeaMaterialPropertyRepresentation)

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


%make_alias(StepFEA_FeaMaterialPropertyRepresentationItem)

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


%make_alias(StepFEA_FeaModel)

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


%make_alias(StepFEA_FeaModelDefinition)

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


%make_alias(StepFEA_FeaParametricPoint)

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


%make_alias(StepFEA_FeaRepresentationItem)

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


%make_alias(StepFEA_FeaSurfaceSectionGeometricRelationship)

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


%make_alias(StepFEA_FreedomAndCoefficient)

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


%make_alias(StepFEA_FreedomsList)

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


%make_alias(StepFEA_HArray1OfCurveElementEndOffset)


%extend StepFEA_HArray1OfCurveElementEndOffset {
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


%make_alias(StepFEA_HArray1OfCurveElementEndRelease)


%extend StepFEA_HArray1OfCurveElementEndRelease {
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


%make_alias(StepFEA_HArray1OfCurveElementInterval)


%extend StepFEA_HArray1OfCurveElementInterval {
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


%make_alias(StepFEA_HArray1OfDegreeOfFreedom)


%extend StepFEA_HArray1OfDegreeOfFreedom {
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


%make_alias(StepFEA_HArray1OfElementRepresentation)


%extend StepFEA_HArray1OfElementRepresentation {
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


%make_alias(StepFEA_HArray1OfNodeRepresentation)


%extend StepFEA_HArray1OfNodeRepresentation {
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


%make_alias(StepFEA_HSequenceOfCurve3dElementProperty)

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


%make_alias(StepFEA_HSequenceOfElementGeometricRelationship)

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


%make_alias(StepFEA_HSequenceOfElementRepresentation)

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


%make_alias(StepFEA_HSequenceOfNodeRepresentation)

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


%make_alias(StepFEA_NodeDefinition)

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


%make_alias(StepFEA_NodeRepresentation)

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


%make_alias(StepFEA_NodeSet)

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


%make_alias(StepFEA_SequenceNodeOfSequenceOfCurve3dElementProperty)

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


%make_alias(StepFEA_SequenceNodeOfSequenceOfElementGeometricRelationship)

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


%make_alias(StepFEA_SequenceNodeOfSequenceOfElementRepresentation)

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


%make_alias(StepFEA_SequenceNodeOfSequenceOfNodeRepresentation)

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


%make_alias(StepFEA_SymmetricTensor23dMember)

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


%make_alias(StepFEA_SymmetricTensor43dMember)

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


%make_alias(StepFEA_AlignedCurve3dElementCoordinateSystem)

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


%make_alias(StepFEA_AlignedSurface3dElementCoordinateSystem)

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


%make_alias(StepFEA_ArbitraryVolume3dElementCoordinateSystem)

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


%make_alias(StepFEA_ConstantSurface3dElementCoordinateSystem)

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


%make_alias(StepFEA_Curve3dElementRepresentation)

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


%make_alias(StepFEA_CurveElementIntervalConstant)

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


%make_alias(StepFEA_CurveElementIntervalLinearlyVarying)

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


%make_alias(StepFEA_DummyNode)

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


%make_alias(StepFEA_ElementGroup)

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


%make_alias(StepFEA_FeaAreaDensity)

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


%make_alias(StepFEA_FeaLinearElasticity)

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


%make_alias(StepFEA_FeaMassDensity)

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


%make_alias(StepFEA_FeaModel3d)

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


%make_alias(StepFEA_FeaMoistureAbsorption)

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


%make_alias(StepFEA_FeaSecantCoefficientOfLinearThermalExpansion)

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


%make_alias(StepFEA_FeaShellBendingStiffness)

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


%make_alias(StepFEA_FeaShellMembraneBendingCouplingStiffness)

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


%make_alias(StepFEA_FeaShellMembraneStiffness)

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


%make_alias(StepFEA_FeaShellShearStiffness)

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


%make_alias(StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion)

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


%make_alias(StepFEA_GeometricNode)

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


%make_alias(StepFEA_Node)

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


%make_alias(StepFEA_NodeGroup)

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


%make_alias(StepFEA_ParametricCurve3dElementCoordinateDirection)

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


%make_alias(StepFEA_ParametricCurve3dElementCoordinateSystem)

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


%make_alias(StepFEA_ParametricSurface3dElementCoordinateSystem)

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


%make_alias(StepFEA_Surface3dElementRepresentation)

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


%make_alias(StepFEA_Volume3dElementRepresentation)

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


%make_alias(StepFEA_NodeWithSolutionCoordinateSystem)

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


%make_alias(StepFEA_NodeWithVector)

%extend StepFEA_NodeWithVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
