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
%define STEPSHAPEDOCSTRING
"StepShape module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepshape.html"
%enddef
%module (package="OCC.Core", docstring=STEPSHAPEDOCSTRING) StepShape


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
#include<StepShape_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepGeom_module.hxx>
#include<TCollection_module.hxx>
#include<StepRepr_module.hxx>
#include<StepData_module.hxx>
#include<StepBasic_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<Interface_module.hxx>
#include<StepBasic_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepGeom.i
%import TCollection.i
%import StepRepr.i
%import StepData.i
%import StepBasic.i
/* public enums */
enum StepShape_AngleRelator {
	StepShape_Equal = 0,
	StepShape_Large = 1,
	StepShape_Small = 2,
};

enum StepShape_BooleanOperator {
	StepShape_boDifference = 0,
	StepShape_boIntersection = 1,
	StepShape_boUnion = 2,
};

/* end public enums declaration */

/* handles */
%wrap_handle(StepShape_Block)
%wrap_handle(StepShape_BooleanResult)
%wrap_handle(StepShape_BoxDomain)
%wrap_handle(StepShape_ConnectedFaceShapeRepresentation)
%wrap_handle(StepShape_ContextDependentShapeRepresentation)
%wrap_handle(StepShape_DefinitionalRepresentationAndShapeRepresentation)
%wrap_handle(StepShape_DimensionalCharacteristicRepresentation)
%wrap_handle(StepShape_DimensionalLocation)
%wrap_handle(StepShape_DimensionalSize)
%wrap_handle(StepShape_EdgeBasedWireframeModel)
%wrap_handle(StepShape_FaceBasedSurfaceModel)
%wrap_handle(StepShape_GeometricSet)
%wrap_handle(StepShape_HalfSpaceSolid)
%wrap_handle(StepShape_LimitsAndFits)
%wrap_handle(StepShape_MeasureQualification)
%wrap_handle(StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem)
%wrap_handle(StepShape_PlusMinusTolerance)
%wrap_handle(StepShape_PrecisionQualifier)
%wrap_handle(StepShape_QualifiedRepresentationItem)
%wrap_handle(StepShape_RightAngularWedge)
%wrap_handle(StepShape_RightCircularCone)
%wrap_handle(StepShape_RightCircularCylinder)
%wrap_handle(StepShape_ShapeDefinitionRepresentation)
%wrap_handle(StepShape_ShapeRepresentation)
%wrap_handle(StepShape_ShellBasedSurfaceModel)
%wrap_handle(StepShape_SolidModel)
%wrap_handle(StepShape_Sphere)
%wrap_handle(StepShape_ToleranceValue)
%wrap_handle(StepShape_TopologicalRepresentationItem)
%wrap_handle(StepShape_Torus)
%wrap_handle(StepShape_TypeQualifier)
%wrap_handle(StepShape_ValueFormatTypeQualifier)
%wrap_handle(StepShape_AdvancedBrepShapeRepresentation)
%wrap_handle(StepShape_AngularLocation)
%wrap_handle(StepShape_AngularSize)
%wrap_handle(StepShape_BoxedHalfSpace)
%wrap_handle(StepShape_CompoundShapeRepresentation)
%wrap_handle(StepShape_ConnectedEdgeSet)
%wrap_handle(StepShape_ConnectedFaceSet)
%wrap_handle(StepShape_CsgShapeRepresentation)
%wrap_handle(StepShape_CsgSolid)
%wrap_handle(StepShape_DimensionalLocationWithPath)
%wrap_handle(StepShape_DimensionalSizeWithPath)
%wrap_handle(StepShape_DirectedDimensionalLocation)
%wrap_handle(StepShape_Edge)
%wrap_handle(StepShape_EdgeBasedWireframeShapeRepresentation)
%wrap_handle(StepShape_Face)
%wrap_handle(StepShape_FaceBound)
%wrap_handle(StepShape_FacetedBrepShapeRepresentation)
%wrap_handle(StepShape_GeometricCurveSet)
%wrap_handle(StepShape_GeometricallyBoundedSurfaceShapeRepresentation)
%wrap_handle(StepShape_GeometricallyBoundedWireframeShapeRepresentation)
%wrap_handle(StepShape_Loop)
%wrap_handle(StepShape_LoopAndPath)
%wrap_handle(StepShape_ManifoldSolidBrep)
%wrap_handle(StepShape_ManifoldSurfaceShapeRepresentation)
%wrap_handle(StepShape_NonManifoldSurfaceShapeRepresentation)
%wrap_handle(StepShape_Path)
%wrap_handle(StepShape_PointRepresentation)
%wrap_handle(StepShape_ShapeDimensionRepresentation)
%wrap_handle(StepShape_ShapeRepresentationWithParameters)
%wrap_handle(StepShape_SolidReplica)
%wrap_handle(StepShape_SweptAreaSolid)
%wrap_handle(StepShape_SweptFaceSolid)
%wrap_handle(StepShape_TransitionalShapeRepresentation)
%wrap_handle(StepShape_Vertex)
%wrap_handle(StepShape_BrepWithVoids)
%wrap_handle(StepShape_ClosedShell)
%wrap_handle(StepShape_ConnectedFaceSubSet)
%wrap_handle(StepShape_EdgeCurve)
%wrap_handle(StepShape_EdgeLoop)
%wrap_handle(StepShape_ExtrudedAreaSolid)
%wrap_handle(StepShape_ExtrudedFaceSolid)
%wrap_handle(StepShape_FaceOuterBound)
%wrap_handle(StepShape_FaceSurface)
%wrap_handle(StepShape_FacetedBrep)
%wrap_handle(StepShape_FacetedBrepAndBrepWithVoids)
%wrap_handle(StepShape_OpenShell)
%wrap_handle(StepShape_OrientedEdge)
%wrap_handle(StepShape_OrientedFace)
%wrap_handle(StepShape_OrientedPath)
%wrap_handle(StepShape_PolyLoop)
%wrap_handle(StepShape_RevolvedAreaSolid)
%wrap_handle(StepShape_RevolvedFaceSolid)
%wrap_handle(StepShape_Subedge)
%wrap_handle(StepShape_Subface)
%wrap_handle(StepShape_VertexLoop)
%wrap_handle(StepShape_VertexPoint)
%wrap_handle(StepShape_AdvancedFace)
%wrap_handle(StepShape_OrientedClosedShell)
%wrap_handle(StepShape_OrientedOpenShell)
%wrap_handle(StepShape_SeamEdge)
%wrap_handle(StepShape_HArray1OfConnectedEdgeSet)
%wrap_handle(StepShape_HArray1OfFaceBound)
%wrap_handle(StepShape_HArray1OfGeometricSetSelect)
%wrap_handle(StepShape_HArray1OfConnectedFaceSet)
%wrap_handle(StepShape_HArray1OfEdge)
%wrap_handle(StepShape_HArray1OfFace)
%wrap_handle(StepShape_HArray1OfShapeDimensionRepresentationItem)
%wrap_handle(StepShape_HArray1OfValueQualifier)
%wrap_handle(StepShape_HArray1OfShell)
%wrap_handle(StepShape_HArray1OfOrientedClosedShell)
%wrap_handle(StepShape_HArray1OfOrientedEdge)
/* end handles declaration */

/* templates */
%template(StepShape_Array1OfConnectedFaceSet) NCollection_Array1 <opencascade::handle <StepShape_ConnectedFaceSet>>;

%extend NCollection_Array1 <opencascade::handle <StepShape_ConnectedFaceSet>> {
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
%template(StepShape_Array1OfValueQualifier) NCollection_Array1 <StepShape_ValueQualifier>;

%extend NCollection_Array1 <StepShape_ValueQualifier> {
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
%template(StepShape_Array1OfShapeDimensionRepresentationItem) NCollection_Array1 <StepShape_ShapeDimensionRepresentationItem>;

%extend NCollection_Array1 <StepShape_ShapeDimensionRepresentationItem> {
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
%template(StepShape_Array1OfConnectedEdgeSet) NCollection_Array1 <opencascade::handle <StepShape_ConnectedEdgeSet>>;

%extend NCollection_Array1 <opencascade::handle <StepShape_ConnectedEdgeSet>> {
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
%template(StepShape_Array1OfFace) NCollection_Array1 <opencascade::handle <StepShape_Face>>;

%extend NCollection_Array1 <opencascade::handle <StepShape_Face>> {
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
%template(StepShape_Array1OfFaceBound) NCollection_Array1 <opencascade::handle <StepShape_FaceBound>>;

%extend NCollection_Array1 <opencascade::handle <StepShape_FaceBound>> {
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
%template(StepShape_Array1OfShell) NCollection_Array1 <StepShape_Shell>;

%extend NCollection_Array1 <StepShape_Shell> {
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
%template(StepShape_Array1OfOrientedEdge) NCollection_Array1 <opencascade::handle <StepShape_OrientedEdge>>;

%extend NCollection_Array1 <opencascade::handle <StepShape_OrientedEdge>> {
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
%template(StepShape_Array1OfGeometricSetSelect) NCollection_Array1 <StepShape_GeometricSetSelect>;

%extend NCollection_Array1 <StepShape_GeometricSetSelect> {
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
%template(StepShape_Array1OfOrientedClosedShell) NCollection_Array1 <opencascade::handle <StepShape_OrientedClosedShell>>;

%extend NCollection_Array1 <opencascade::handle <StepShape_OrientedClosedShell>> {
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
%template(StepShape_Array1OfEdge) NCollection_Array1 <opencascade::handle <StepShape_Edge>>;

%extend NCollection_Array1 <opencascade::handle <StepShape_Edge>> {
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
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <opencascade::handle <StepShape_ConnectedFaceSet>> StepShape_Array1OfConnectedFaceSet;
typedef NCollection_Array1 <StepShape_ValueQualifier> StepShape_Array1OfValueQualifier;
typedef NCollection_Array1 <StepShape_ShapeDimensionRepresentationItem> StepShape_Array1OfShapeDimensionRepresentationItem;
typedef NCollection_Array1 <opencascade::handle <StepShape_ConnectedEdgeSet>> StepShape_Array1OfConnectedEdgeSet;
typedef NCollection_Array1 <opencascade::handle <StepShape_Face>> StepShape_Array1OfFace;
typedef NCollection_Array1 <opencascade::handle <StepShape_FaceBound>> StepShape_Array1OfFaceBound;
typedef NCollection_Array1 <StepShape_Shell> StepShape_Array1OfShell;
typedef NCollection_Array1 <opencascade::handle <StepShape_OrientedEdge>> StepShape_Array1OfOrientedEdge;
typedef NCollection_Array1 <StepShape_GeometricSetSelect> StepShape_Array1OfGeometricSetSelect;
typedef NCollection_Array1 <opencascade::handle <StepShape_OrientedClosedShell>> StepShape_Array1OfOrientedClosedShell;
typedef NCollection_Array1 <opencascade::handle <StepShape_Edge>> StepShape_Array1OfEdge;
/* end typedefs declaration */

/************************
* class StepShape_Block *
************************/
class StepShape_Block : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement3d
	:param aX:
	:type aX: float
	:param aY:
	:type aY: float
	:param aZ:
	:type aZ: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition,const Standard_Real aX,const Standard_Real aY,const Standard_Real aZ);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Axis2Placement3d>") Position;
		opencascade::handle<StepGeom_Axis2Placement3d> Position ();

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", ":param aPosition:
	:type aPosition: StepGeom_Axis2Placement3d
	:rtype: None") SetPosition;
		void SetPosition (const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", ":param aX:
	:type aX: float
	:rtype: None") SetX;
		void SetX (const Standard_Real aX);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", ":param aY:
	:type aY: float
	:rtype: None") SetY;
		void SetY (const Standard_Real aY);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", ":param aZ:
	:type aZ: float
	:rtype: None") SetZ;
		void SetZ (const Standard_Real aZ);

		/****************** StepShape_Block ******************/
		%feature("compactdefaultargs") StepShape_Block;
		%feature("autodoc", "* Returns a Block
	:rtype: None") StepShape_Block;
		 StepShape_Block ();

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", ":rtype: float") X;
		Standard_Real X ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", ":rtype: float") Y;
		Standard_Real Y ();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", ":rtype: float") Z;
		Standard_Real Z ();

};


%make_alias(StepShape_Block)

%extend StepShape_Block {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepShape_BooleanOperand *
*********************************/
class StepShape_BooleanOperand {
	public:
		/****************** BooleanResult ******************/
		%feature("compactdefaultargs") BooleanResult;
		%feature("autodoc", "* returns Value as a BooleanResult (Null if another type)
	:rtype: opencascade::handle<StepShape_BooleanResult>") BooleanResult;
		opencascade::handle<StepShape_BooleanResult> BooleanResult ();

		/****************** CsgPrimitive ******************/
		%feature("compactdefaultargs") CsgPrimitive;
		%feature("autodoc", "* returns Value as a CsgPrimitive (Null if another type) CsgPrimitive is another Select Type
	:rtype: StepShape_CsgPrimitive") CsgPrimitive;
		StepShape_CsgPrimitive CsgPrimitive ();

		/****************** HalfSpaceSolid ******************/
		%feature("compactdefaultargs") HalfSpaceSolid;
		%feature("autodoc", "* returns Value as a HalfSpaceSolid (Null if another type)
	:rtype: opencascade::handle<StepShape_HalfSpaceSolid>") HalfSpaceSolid;
		opencascade::handle<StepShape_HalfSpaceSolid> HalfSpaceSolid ();

		/****************** SetBooleanResult ******************/
		%feature("compactdefaultargs") SetBooleanResult;
		%feature("autodoc", ":param aBooleanResult:
	:type aBooleanResult: StepShape_BooleanResult
	:rtype: None") SetBooleanResult;
		void SetBooleanResult (const opencascade::handle<StepShape_BooleanResult> & aBooleanResult);

		/****************** SetCsgPrimitive ******************/
		%feature("compactdefaultargs") SetCsgPrimitive;
		%feature("autodoc", ":param aCsgPrimitive:
	:type aCsgPrimitive: StepShape_CsgPrimitive
	:rtype: None") SetCsgPrimitive;
		void SetCsgPrimitive (const StepShape_CsgPrimitive & aCsgPrimitive);

		/****************** SetHalfSpaceSolid ******************/
		%feature("compactdefaultargs") SetHalfSpaceSolid;
		%feature("autodoc", ":param aHalfSpaceSolid:
	:type aHalfSpaceSolid: StepShape_HalfSpaceSolid
	:rtype: None") SetHalfSpaceSolid;
		void SetHalfSpaceSolid (const opencascade::handle<StepShape_HalfSpaceSolid> & aHalfSpaceSolid);

		/****************** SetSolidModel ******************/
		%feature("compactdefaultargs") SetSolidModel;
		%feature("autodoc", ":param aSolidModel:
	:type aSolidModel: StepShape_SolidModel
	:rtype: None") SetSolidModel;
		void SetSolidModel (const opencascade::handle<StepShape_SolidModel> & aSolidModel);

		/****************** SetTypeOfContent ******************/
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", ":param aTypeOfContent:
	:type aTypeOfContent: int
	:rtype: None") SetTypeOfContent;
		void SetTypeOfContent (const Standard_Integer aTypeOfContent);

		/****************** SolidModel ******************/
		%feature("compactdefaultargs") SolidModel;
		%feature("autodoc", "* returns Value as a SolidModel (Null if another type)
	:rtype: opencascade::handle<StepShape_SolidModel>") SolidModel;
		opencascade::handle<StepShape_SolidModel> SolidModel ();

		/****************** StepShape_BooleanOperand ******************/
		%feature("compactdefaultargs") StepShape_BooleanOperand;
		%feature("autodoc", "* Returns a BooleanOperand SelectType
	:rtype: None") StepShape_BooleanOperand;
		 StepShape_BooleanOperand ();

		/****************** TypeOfContent ******************/
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", ":rtype: int") TypeOfContent;
		Standard_Integer TypeOfContent ();

};


%extend StepShape_BooleanOperand {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepShape_BooleanResult *
********************************/
class StepShape_BooleanResult : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** FirstOperand ******************/
		%feature("compactdefaultargs") FirstOperand;
		%feature("autodoc", ":rtype: StepShape_BooleanOperand") FirstOperand;
		StepShape_BooleanOperand FirstOperand ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aOperator:
	:type aOperator: StepShape_BooleanOperator
	:param aFirstOperand:
	:type aFirstOperand: StepShape_BooleanOperand
	:param aSecondOperand:
	:type aSecondOperand: StepShape_BooleanOperand
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const StepShape_BooleanOperator aOperator,const StepShape_BooleanOperand & aFirstOperand,const StepShape_BooleanOperand & aSecondOperand);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", ":rtype: StepShape_BooleanOperator") Operator;
		StepShape_BooleanOperator Operator ();

		/****************** SecondOperand ******************/
		%feature("compactdefaultargs") SecondOperand;
		%feature("autodoc", ":rtype: StepShape_BooleanOperand") SecondOperand;
		StepShape_BooleanOperand SecondOperand ();

		/****************** SetFirstOperand ******************/
		%feature("compactdefaultargs") SetFirstOperand;
		%feature("autodoc", ":param aFirstOperand:
	:type aFirstOperand: StepShape_BooleanOperand
	:rtype: None") SetFirstOperand;
		void SetFirstOperand (const StepShape_BooleanOperand & aFirstOperand);

		/****************** SetOperator ******************/
		%feature("compactdefaultargs") SetOperator;
		%feature("autodoc", ":param aOperator:
	:type aOperator: StepShape_BooleanOperator
	:rtype: None") SetOperator;
		void SetOperator (const StepShape_BooleanOperator aOperator);

		/****************** SetSecondOperand ******************/
		%feature("compactdefaultargs") SetSecondOperand;
		%feature("autodoc", ":param aSecondOperand:
	:type aSecondOperand: StepShape_BooleanOperand
	:rtype: None") SetSecondOperand;
		void SetSecondOperand (const StepShape_BooleanOperand & aSecondOperand);

		/****************** StepShape_BooleanResult ******************/
		%feature("compactdefaultargs") StepShape_BooleanResult;
		%feature("autodoc", "* Returns a BooleanResult
	:rtype: None") StepShape_BooleanResult;
		 StepShape_BooleanResult ();

};


%make_alias(StepShape_BooleanResult)

%extend StepShape_BooleanResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepShape_BoxDomain *
****************************/
class StepShape_BoxDomain : public Standard_Transient {
	public:
		/****************** Corner ******************/
		%feature("compactdefaultargs") Corner;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_CartesianPoint>") Corner;
		opencascade::handle<StepGeom_CartesianPoint> Corner ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aCorner:
	:type aCorner: StepGeom_CartesianPoint
	:param aXlength:
	:type aXlength: float
	:param aYlength:
	:type aYlength: float
	:param aZlength:
	:type aZlength: float
	:rtype: None") Init;
		void Init (const opencascade::handle<StepGeom_CartesianPoint> & aCorner,const Standard_Real aXlength,const Standard_Real aYlength,const Standard_Real aZlength);

		/****************** SetCorner ******************/
		%feature("compactdefaultargs") SetCorner;
		%feature("autodoc", ":param aCorner:
	:type aCorner: StepGeom_CartesianPoint
	:rtype: None") SetCorner;
		void SetCorner (const opencascade::handle<StepGeom_CartesianPoint> & aCorner);

		/****************** SetXlength ******************/
		%feature("compactdefaultargs") SetXlength;
		%feature("autodoc", ":param aXlength:
	:type aXlength: float
	:rtype: None") SetXlength;
		void SetXlength (const Standard_Real aXlength);

		/****************** SetYlength ******************/
		%feature("compactdefaultargs") SetYlength;
		%feature("autodoc", ":param aYlength:
	:type aYlength: float
	:rtype: None") SetYlength;
		void SetYlength (const Standard_Real aYlength);

		/****************** SetZlength ******************/
		%feature("compactdefaultargs") SetZlength;
		%feature("autodoc", ":param aZlength:
	:type aZlength: float
	:rtype: None") SetZlength;
		void SetZlength (const Standard_Real aZlength);

		/****************** StepShape_BoxDomain ******************/
		%feature("compactdefaultargs") StepShape_BoxDomain;
		%feature("autodoc", "* Returns a BoxDomain
	:rtype: None") StepShape_BoxDomain;
		 StepShape_BoxDomain ();

		/****************** Xlength ******************/
		%feature("compactdefaultargs") Xlength;
		%feature("autodoc", ":rtype: float") Xlength;
		Standard_Real Xlength ();

		/****************** Ylength ******************/
		%feature("compactdefaultargs") Ylength;
		%feature("autodoc", ":rtype: float") Ylength;
		Standard_Real Ylength ();

		/****************** Zlength ******************/
		%feature("compactdefaultargs") Zlength;
		%feature("autodoc", ":rtype: float") Zlength;
		Standard_Real Zlength ();

};


%make_alias(StepShape_BoxDomain)

%extend StepShape_BoxDomain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepShape_ConnectedFaceShapeRepresentation *
***************************************************/
class StepShape_ConnectedFaceShapeRepresentation : public StepRepr_Representation {
	public:
		/****************** StepShape_ConnectedFaceShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_ConnectedFaceShapeRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_ConnectedFaceShapeRepresentation;
		 StepShape_ConnectedFaceShapeRepresentation ();

};


%make_alias(StepShape_ConnectedFaceShapeRepresentation)

%extend StepShape_ConnectedFaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class StepShape_ContextDependentShapeRepresentation *
******************************************************/
class StepShape_ContextDependentShapeRepresentation : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aRepRel:
	:type aRepRel: StepRepr_ShapeRepresentationRelationship
	:param aProRel:
	:type aProRel: StepRepr_ProductDefinitionShape
	:rtype: None") Init;
		void Init (const opencascade::handle<StepRepr_ShapeRepresentationRelationship> & aRepRel,const opencascade::handle<StepRepr_ProductDefinitionShape> & aProRel);

		/****************** RepresentationRelation ******************/
		%feature("compactdefaultargs") RepresentationRelation;
		%feature("autodoc", ":rtype: opencascade::handle<StepRepr_ShapeRepresentationRelationship>") RepresentationRelation;
		opencascade::handle<StepRepr_ShapeRepresentationRelationship> RepresentationRelation ();

		/****************** RepresentedProductRelation ******************/
		%feature("compactdefaultargs") RepresentedProductRelation;
		%feature("autodoc", ":rtype: opencascade::handle<StepRepr_ProductDefinitionShape>") RepresentedProductRelation;
		opencascade::handle<StepRepr_ProductDefinitionShape> RepresentedProductRelation ();

		/****************** SetRepresentationRelation ******************/
		%feature("compactdefaultargs") SetRepresentationRelation;
		%feature("autodoc", ":param aRepRel:
	:type aRepRel: StepRepr_ShapeRepresentationRelationship
	:rtype: None") SetRepresentationRelation;
		void SetRepresentationRelation (const opencascade::handle<StepRepr_ShapeRepresentationRelationship> & aRepRel);

		/****************** SetRepresentedProductRelation ******************/
		%feature("compactdefaultargs") SetRepresentedProductRelation;
		%feature("autodoc", ":param aProRel:
	:type aProRel: StepRepr_ProductDefinitionShape
	:rtype: None") SetRepresentedProductRelation;
		void SetRepresentedProductRelation (const opencascade::handle<StepRepr_ProductDefinitionShape> & aProRel);

		/****************** StepShape_ContextDependentShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_ContextDependentShapeRepresentation;
		%feature("autodoc", ":rtype: None") StepShape_ContextDependentShapeRepresentation;
		 StepShape_ContextDependentShapeRepresentation ();

};


%make_alias(StepShape_ContextDependentShapeRepresentation)

%extend StepShape_ContextDependentShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepShape_CsgPrimitive *
*******************************/
class StepShape_CsgPrimitive : public StepData_SelectType {
	public:
		/****************** Block ******************/
		%feature("compactdefaultargs") Block;
		%feature("autodoc", "* returns Value as a Block (Null if another type)
	:rtype: opencascade::handle<StepShape_Block>") Block;
		opencascade::handle<StepShape_Block> Block ();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a CsgPrimitive Kind Entity that is : 1 -> Sphere 2 -> Block 3 -> RightAngularWedge 4 -> Torus 5 -> RightCircularCone 6 -> RightCircularCylinder 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** RightAngularWedge ******************/
		%feature("compactdefaultargs") RightAngularWedge;
		%feature("autodoc", "* returns Value as a RightAngularWedge (Null if another type)
	:rtype: opencascade::handle<StepShape_RightAngularWedge>") RightAngularWedge;
		opencascade::handle<StepShape_RightAngularWedge> RightAngularWedge ();

		/****************** RightCircularCone ******************/
		%feature("compactdefaultargs") RightCircularCone;
		%feature("autodoc", "* returns Value as a RightCircularCone (Null if another type)
	:rtype: opencascade::handle<StepShape_RightCircularCone>") RightCircularCone;
		opencascade::handle<StepShape_RightCircularCone> RightCircularCone ();

		/****************** RightCircularCylinder ******************/
		%feature("compactdefaultargs") RightCircularCylinder;
		%feature("autodoc", "* returns Value as a RightCircularCylinder (Null if another type)
	:rtype: opencascade::handle<StepShape_RightCircularCylinder>") RightCircularCylinder;
		opencascade::handle<StepShape_RightCircularCylinder> RightCircularCylinder ();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "* returns Value as a Sphere (Null if another type)
	:rtype: opencascade::handle<StepShape_Sphere>") Sphere;
		opencascade::handle<StepShape_Sphere> Sphere ();

		/****************** StepShape_CsgPrimitive ******************/
		%feature("compactdefaultargs") StepShape_CsgPrimitive;
		%feature("autodoc", "* Returns a CsgPrimitive SelectType
	:rtype: None") StepShape_CsgPrimitive;
		 StepShape_CsgPrimitive ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "* returns Value as a Torus (Null if another type)
	:rtype: opencascade::handle<StepShape_Torus>") Torus;
		opencascade::handle<StepShape_Torus> Torus ();

};


%extend StepShape_CsgPrimitive {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepShape_CsgSelect *
****************************/
class StepShape_CsgSelect {
	public:
		/****************** BooleanResult ******************/
		%feature("compactdefaultargs") BooleanResult;
		%feature("autodoc", "* returns Value as a BooleanResult (Null if another type)
	:rtype: opencascade::handle<StepShape_BooleanResult>") BooleanResult;
		opencascade::handle<StepShape_BooleanResult> BooleanResult ();

		/****************** CsgPrimitive ******************/
		%feature("compactdefaultargs") CsgPrimitive;
		%feature("autodoc", "* returns Value as a CsgPrimitive (Null if another type)
	:rtype: StepShape_CsgPrimitive") CsgPrimitive;
		StepShape_CsgPrimitive CsgPrimitive ();

		/****************** SetBooleanResult ******************/
		%feature("compactdefaultargs") SetBooleanResult;
		%feature("autodoc", ":param aBooleanResult:
	:type aBooleanResult: StepShape_BooleanResult
	:rtype: None") SetBooleanResult;
		void SetBooleanResult (const opencascade::handle<StepShape_BooleanResult> & aBooleanResult);

		/****************** SetCsgPrimitive ******************/
		%feature("compactdefaultargs") SetCsgPrimitive;
		%feature("autodoc", ":param aCsgPrimitive:
	:type aCsgPrimitive: StepShape_CsgPrimitive
	:rtype: None") SetCsgPrimitive;
		void SetCsgPrimitive (const StepShape_CsgPrimitive & aCsgPrimitive);

		/****************** SetTypeOfContent ******************/
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", ":param aTypeOfContent:
	:type aTypeOfContent: int
	:rtype: None") SetTypeOfContent;
		void SetTypeOfContent (const Standard_Integer aTypeOfContent);

		/****************** StepShape_CsgSelect ******************/
		%feature("compactdefaultargs") StepShape_CsgSelect;
		%feature("autodoc", "* Returns a CsgSelect SelectType
	:rtype: None") StepShape_CsgSelect;
		 StepShape_CsgSelect ();

		/****************** TypeOfContent ******************/
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", ":rtype: int") TypeOfContent;
		Standard_Integer TypeOfContent ();

};


%extend StepShape_CsgSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************************
* class StepShape_DefinitionalRepresentationAndShapeRepresentation *
*******************************************************************/
class StepShape_DefinitionalRepresentationAndShapeRepresentation : public StepRepr_DefinitionalRepresentation {
	public:
		/****************** StepShape_DefinitionalRepresentationAndShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_DefinitionalRepresentationAndShapeRepresentation;
		%feature("autodoc", ":rtype: None") StepShape_DefinitionalRepresentationAndShapeRepresentation;
		 StepShape_DefinitionalRepresentationAndShapeRepresentation ();

};


%make_alias(StepShape_DefinitionalRepresentationAndShapeRepresentation)

%extend StepShape_DefinitionalRepresentationAndShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepShape_DimensionalCharacteristic *
********************************************/
class StepShape_DimensionalCharacteristic : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of DimensionalCharacteristic select type 1 -> DimensionalLocation from StepShape 2 -> DimensionalSize from StepShape 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** DimensionalLocation ******************/
		%feature("compactdefaultargs") DimensionalLocation;
		%feature("autodoc", "* Returns Value as DimensionalLocation (or Null if another type)
	:rtype: opencascade::handle<StepShape_DimensionalLocation>") DimensionalLocation;
		opencascade::handle<StepShape_DimensionalLocation> DimensionalLocation ();

		/****************** DimensionalSize ******************/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "* Returns Value as DimensionalSize (or Null if another type)
	:rtype: opencascade::handle<StepShape_DimensionalSize>") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize ();

		/****************** StepShape_DimensionalCharacteristic ******************/
		%feature("compactdefaultargs") StepShape_DimensionalCharacteristic;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_DimensionalCharacteristic;
		 StepShape_DimensionalCharacteristic ();

};


%extend StepShape_DimensionalCharacteristic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class StepShape_DimensionalCharacteristicRepresentation *
**********************************************************/
class StepShape_DimensionalCharacteristicRepresentation : public Standard_Transient {
	public:
		/****************** Dimension ******************/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "* Returns field Dimension
	:rtype: StepShape_DimensionalCharacteristic") Dimension;
		StepShape_DimensionalCharacteristic Dimension ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aDimension:
	:type aDimension: StepShape_DimensionalCharacteristic
	:param aRepresentation:
	:type aRepresentation: StepShape_ShapeDimensionRepresentation
	:rtype: None") Init;
		void Init (const StepShape_DimensionalCharacteristic & aDimension,const opencascade::handle<StepShape_ShapeDimensionRepresentation> & aRepresentation);

		/****************** Representation ******************/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "* Returns field Representation
	:rtype: opencascade::handle<StepShape_ShapeDimensionRepresentation>") Representation;
		opencascade::handle<StepShape_ShapeDimensionRepresentation> Representation ();

		/****************** SetDimension ******************/
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "* Set field Dimension
	:param Dimension:
	:type Dimension: StepShape_DimensionalCharacteristic
	:rtype: None") SetDimension;
		void SetDimension (const StepShape_DimensionalCharacteristic & Dimension);

		/****************** SetRepresentation ******************/
		%feature("compactdefaultargs") SetRepresentation;
		%feature("autodoc", "* Set field Representation
	:param Representation:
	:type Representation: StepShape_ShapeDimensionRepresentation
	:rtype: None") SetRepresentation;
		void SetRepresentation (const opencascade::handle<StepShape_ShapeDimensionRepresentation> & Representation);

		/****************** StepShape_DimensionalCharacteristicRepresentation ******************/
		%feature("compactdefaultargs") StepShape_DimensionalCharacteristicRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_DimensionalCharacteristicRepresentation;
		 StepShape_DimensionalCharacteristicRepresentation ();

};


%make_alias(StepShape_DimensionalCharacteristicRepresentation)

%extend StepShape_DimensionalCharacteristicRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepShape_DimensionalLocation *
**************************************/
class StepShape_DimensionalLocation : public StepRepr_ShapeAspectRelationship {
	public:
		/****************** StepShape_DimensionalLocation ******************/
		%feature("compactdefaultargs") StepShape_DimensionalLocation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_DimensionalLocation;
		 StepShape_DimensionalLocation ();

};


%make_alias(StepShape_DimensionalLocation)

%extend StepShape_DimensionalLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepShape_DimensionalSize *
**********************************/
class StepShape_DimensionalSize : public Standard_Transient {
	public:
		/****************** AppliesTo ******************/
		%feature("compactdefaultargs") AppliesTo;
		%feature("autodoc", "* Returns field AppliesTo
	:rtype: opencascade::handle<StepRepr_ShapeAspect>") AppliesTo;
		opencascade::handle<StepRepr_ShapeAspect> AppliesTo ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aAppliesTo:
	:type aAppliesTo: StepRepr_ShapeAspect
	:param aName:
	:type aName: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const opencascade::handle<StepRepr_ShapeAspect> & aAppliesTo,const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns field Name
	:rtype: opencascade::handle<TCollection_HAsciiString>") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();

		/****************** SetAppliesTo ******************/
		%feature("compactdefaultargs") SetAppliesTo;
		%feature("autodoc", "* Set field AppliesTo
	:param AppliesTo:
	:type AppliesTo: StepRepr_ShapeAspect
	:rtype: None") SetAppliesTo;
		void SetAppliesTo (const opencascade::handle<StepRepr_ShapeAspect> & AppliesTo);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set field Name
	:param Name:
	:type Name: TCollection_HAsciiString
	:rtype: None") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** StepShape_DimensionalSize ******************/
		%feature("compactdefaultargs") StepShape_DimensionalSize;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_DimensionalSize;
		 StepShape_DimensionalSize ();

};


%make_alias(StepShape_DimensionalSize)

%extend StepShape_DimensionalSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepShape_EdgeBasedWireframeModel *
******************************************/
class StepShape_EdgeBasedWireframeModel : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** EbwmBoundary ******************/
		%feature("compactdefaultargs") EbwmBoundary;
		%feature("autodoc", "* Returns field EbwmBoundary
	:rtype: opencascade::handle<StepShape_HArray1OfConnectedEdgeSet>") EbwmBoundary;
		opencascade::handle<StepShape_HArray1OfConnectedEdgeSet> EbwmBoundary ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aEbwmBoundary:
	:type aEbwmBoundary: StepShape_HArray1OfConnectedEdgeSet
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepShape_HArray1OfConnectedEdgeSet> & aEbwmBoundary);

		/****************** SetEbwmBoundary ******************/
		%feature("compactdefaultargs") SetEbwmBoundary;
		%feature("autodoc", "* Set field EbwmBoundary
	:param EbwmBoundary:
	:type EbwmBoundary: StepShape_HArray1OfConnectedEdgeSet
	:rtype: None") SetEbwmBoundary;
		void SetEbwmBoundary (const opencascade::handle<StepShape_HArray1OfConnectedEdgeSet> & EbwmBoundary);

		/****************** StepShape_EdgeBasedWireframeModel ******************/
		%feature("compactdefaultargs") StepShape_EdgeBasedWireframeModel;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_EdgeBasedWireframeModel;
		 StepShape_EdgeBasedWireframeModel ();

};


%make_alias(StepShape_EdgeBasedWireframeModel)

%extend StepShape_EdgeBasedWireframeModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepShape_FaceBasedSurfaceModel *
****************************************/
class StepShape_FaceBasedSurfaceModel : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** FbsmFaces ******************/
		%feature("compactdefaultargs") FbsmFaces;
		%feature("autodoc", "* Returns field FbsmFaces
	:rtype: opencascade::handle<StepShape_HArray1OfConnectedFaceSet>") FbsmFaces;
		opencascade::handle<StepShape_HArray1OfConnectedFaceSet> FbsmFaces ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFbsmFaces:
	:type aFbsmFaces: StepShape_HArray1OfConnectedFaceSet
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepShape_HArray1OfConnectedFaceSet> & aFbsmFaces);

		/****************** SetFbsmFaces ******************/
		%feature("compactdefaultargs") SetFbsmFaces;
		%feature("autodoc", "* Set field FbsmFaces
	:param FbsmFaces:
	:type FbsmFaces: StepShape_HArray1OfConnectedFaceSet
	:rtype: None") SetFbsmFaces;
		void SetFbsmFaces (const opencascade::handle<StepShape_HArray1OfConnectedFaceSet> & FbsmFaces);

		/****************** StepShape_FaceBasedSurfaceModel ******************/
		%feature("compactdefaultargs") StepShape_FaceBasedSurfaceModel;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_FaceBasedSurfaceModel;
		 StepShape_FaceBasedSurfaceModel ();

};


%make_alias(StepShape_FaceBasedSurfaceModel)

%extend StepShape_FaceBasedSurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepShape_GeometricSet *
*******************************/
class StepShape_GeometricSet : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** Elements ******************/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfGeometricSetSelect>") Elements;
		opencascade::handle<StepShape_HArray1OfGeometricSetSelect> Elements ();

		/****************** ElementsValue ******************/
		%feature("compactdefaultargs") ElementsValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: StepShape_GeometricSetSelect") ElementsValue;
		StepShape_GeometricSetSelect ElementsValue (const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aElements:
	:type aElements: StepShape_HArray1OfGeometricSetSelect
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_HArray1OfGeometricSetSelect> & aElements);

		/****************** NbElements ******************/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", ":rtype: int") NbElements;
		Standard_Integer NbElements ();

		/****************** SetElements ******************/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", ":param aElements:
	:type aElements: StepShape_HArray1OfGeometricSetSelect
	:rtype: None") SetElements;
		void SetElements (const opencascade::handle<StepShape_HArray1OfGeometricSetSelect> & aElements);

		/****************** StepShape_GeometricSet ******************/
		%feature("compactdefaultargs") StepShape_GeometricSet;
		%feature("autodoc", "* Returns a GeometricSet
	:rtype: None") StepShape_GeometricSet;
		 StepShape_GeometricSet ();

};


%make_alias(StepShape_GeometricSet)

%extend StepShape_GeometricSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepShape_GeometricSetSelect *
*************************************/
class StepShape_GeometricSetSelect : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a GeometricSetSelect Kind Entity that is : 1 -> Point 2 -> Curve 3 -> Surface 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* returns Value as a Curve (Null if another type)
	:rtype: opencascade::handle<StepGeom_Curve>") Curve;
		opencascade::handle<StepGeom_Curve> Curve ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* returns Value as a Point (Null if another type)
	:rtype: opencascade::handle<StepGeom_Point>") Point;
		opencascade::handle<StepGeom_Point> Point ();

		/****************** StepShape_GeometricSetSelect ******************/
		%feature("compactdefaultargs") StepShape_GeometricSetSelect;
		%feature("autodoc", "* Returns a GeometricSetSelect SelectType
	:rtype: None") StepShape_GeometricSetSelect;
		 StepShape_GeometricSetSelect ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* returns Value as a Surface (Null if another type)
	:rtype: opencascade::handle<StepGeom_Surface>") Surface;
		opencascade::handle<StepGeom_Surface> Surface ();

};


%extend StepShape_GeometricSetSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepShape_HalfSpaceSolid *
*********************************/
class StepShape_HalfSpaceSolid : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** AgreementFlag ******************/
		%feature("compactdefaultargs") AgreementFlag;
		%feature("autodoc", ":rtype: bool") AgreementFlag;
		Standard_Boolean AgreementFlag ();

		/****************** BaseSurface ******************/
		%feature("compactdefaultargs") BaseSurface;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Surface>") BaseSurface;
		opencascade::handle<StepGeom_Surface> BaseSurface ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aBaseSurface:
	:type aBaseSurface: StepGeom_Surface
	:param aAgreementFlag:
	:type aAgreementFlag: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_Surface> & aBaseSurface,const Standard_Boolean aAgreementFlag);

		/****************** SetAgreementFlag ******************/
		%feature("compactdefaultargs") SetAgreementFlag;
		%feature("autodoc", ":param aAgreementFlag:
	:type aAgreementFlag: bool
	:rtype: None") SetAgreementFlag;
		void SetAgreementFlag (const Standard_Boolean aAgreementFlag);

		/****************** SetBaseSurface ******************/
		%feature("compactdefaultargs") SetBaseSurface;
		%feature("autodoc", ":param aBaseSurface:
	:type aBaseSurface: StepGeom_Surface
	:rtype: None") SetBaseSurface;
		void SetBaseSurface (const opencascade::handle<StepGeom_Surface> & aBaseSurface);

		/****************** StepShape_HalfSpaceSolid ******************/
		%feature("compactdefaultargs") StepShape_HalfSpaceSolid;
		%feature("autodoc", "* Returns a HalfSpaceSolid
	:rtype: None") StepShape_HalfSpaceSolid;
		 StepShape_HalfSpaceSolid ();

};


%make_alias(StepShape_HalfSpaceSolid)

%extend StepShape_HalfSpaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepShape_LimitsAndFits *
********************************/
class StepShape_LimitsAndFits : public Standard_Transient {
	public:
		/****************** FormVariance ******************/
		%feature("compactdefaultargs") FormVariance;
		%feature("autodoc", ":rtype: opencascade::handle<TCollection_HAsciiString>") FormVariance;
		opencascade::handle<TCollection_HAsciiString> FormVariance ();

		/****************** Grade ******************/
		%feature("compactdefaultargs") Grade;
		%feature("autodoc", ":rtype: opencascade::handle<TCollection_HAsciiString>") Grade;
		opencascade::handle<TCollection_HAsciiString> Grade ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param form_variance:
	:type form_variance: TCollection_HAsciiString
	:param zone_variance:
	:type zone_variance: TCollection_HAsciiString
	:param grade:
	:type grade: TCollection_HAsciiString
	:param source:
	:type source: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & form_variance,const opencascade::handle<TCollection_HAsciiString> & zone_variance,const opencascade::handle<TCollection_HAsciiString> & grade,const opencascade::handle<TCollection_HAsciiString> & source);

		/****************** SetFormVariance ******************/
		%feature("compactdefaultargs") SetFormVariance;
		%feature("autodoc", ":param form_variance:
	:type form_variance: TCollection_HAsciiString
	:rtype: None") SetFormVariance;
		void SetFormVariance (const opencascade::handle<TCollection_HAsciiString> & form_variance);

		/****************** SetGrade ******************/
		%feature("compactdefaultargs") SetGrade;
		%feature("autodoc", ":param grade:
	:type grade: TCollection_HAsciiString
	:rtype: None") SetGrade;
		void SetGrade (const opencascade::handle<TCollection_HAsciiString> & grade);

		/****************** SetSource ******************/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", ":param source:
	:type source: TCollection_HAsciiString
	:rtype: None") SetSource;
		void SetSource (const opencascade::handle<TCollection_HAsciiString> & source);

		/****************** SetZoneVariance ******************/
		%feature("compactdefaultargs") SetZoneVariance;
		%feature("autodoc", ":param zone_variance:
	:type zone_variance: TCollection_HAsciiString
	:rtype: None") SetZoneVariance;
		void SetZoneVariance (const opencascade::handle<TCollection_HAsciiString> & zone_variance);

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", ":rtype: opencascade::handle<TCollection_HAsciiString>") Source;
		opencascade::handle<TCollection_HAsciiString> Source ();

		/****************** StepShape_LimitsAndFits ******************/
		%feature("compactdefaultargs") StepShape_LimitsAndFits;
		%feature("autodoc", ":rtype: None") StepShape_LimitsAndFits;
		 StepShape_LimitsAndFits ();

		/****************** ZoneVariance ******************/
		%feature("compactdefaultargs") ZoneVariance;
		%feature("autodoc", ":rtype: opencascade::handle<TCollection_HAsciiString>") ZoneVariance;
		opencascade::handle<TCollection_HAsciiString> ZoneVariance ();

};


%make_alias(StepShape_LimitsAndFits)

%extend StepShape_LimitsAndFits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepShape_MeasureQualification *
***************************************/
class StepShape_MeasureQualification : public Standard_Transient {
	public:
		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", ":rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param name:
	:type name: TCollection_HAsciiString
	:param description:
	:type description: TCollection_HAsciiString
	:param qualified_measure:
	:type qualified_measure: StepBasic_MeasureWithUnit
	:param qualifiers:
	:type qualifiers: StepShape_HArray1OfValueQualifier
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & name,const opencascade::handle<TCollection_HAsciiString> & description,const opencascade::handle<StepBasic_MeasureWithUnit> & qualified_measure,const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", ":rtype: opencascade::handle<TCollection_HAsciiString>") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();

		/****************** NbQualifiers ******************/
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", ":rtype: int") NbQualifiers;
		Standard_Integer NbQualifiers ();

		/****************** QualifiedMeasure ******************/
		%feature("compactdefaultargs") QualifiedMeasure;
		%feature("autodoc", ":rtype: opencascade::handle<StepBasic_MeasureWithUnit>") QualifiedMeasure;
		opencascade::handle<StepBasic_MeasureWithUnit> QualifiedMeasure ();

		/****************** Qualifiers ******************/
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfValueQualifier>") Qualifiers;
		opencascade::handle<StepShape_HArray1OfValueQualifier> Qualifiers ();

		/****************** QualifiersValue ******************/
		%feature("compactdefaultargs") QualifiersValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: StepShape_ValueQualifier") QualifiersValue;
		StepShape_ValueQualifier QualifiersValue (const Standard_Integer num);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", ":param description:
	:type description: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", ":param name:
	:type name: TCollection_HAsciiString
	:rtype: None") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** SetQualifiedMeasure ******************/
		%feature("compactdefaultargs") SetQualifiedMeasure;
		%feature("autodoc", ":param qualified_measure:
	:type qualified_measure: StepBasic_MeasureWithUnit
	:rtype: None") SetQualifiedMeasure;
		void SetQualifiedMeasure (const opencascade::handle<StepBasic_MeasureWithUnit> & qualified_measure);

		/****************** SetQualifiers ******************/
		%feature("compactdefaultargs") SetQualifiers;
		%feature("autodoc", ":param qualifiers:
	:type qualifiers: StepShape_HArray1OfValueQualifier
	:rtype: None") SetQualifiers;
		void SetQualifiers (const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** SetQualifiersValue ******************/
		%feature("compactdefaultargs") SetQualifiersValue;
		%feature("autodoc", ":param num:
	:type num: int
	:param aqualifier:
	:type aqualifier: StepShape_ValueQualifier
	:rtype: None") SetQualifiersValue;
		void SetQualifiersValue (const Standard_Integer num,const StepShape_ValueQualifier & aqualifier);

		/****************** StepShape_MeasureQualification ******************/
		%feature("compactdefaultargs") StepShape_MeasureQualification;
		%feature("autodoc", ":rtype: None") StepShape_MeasureQualification;
		 StepShape_MeasureQualification ();

};


%make_alias(StepShape_MeasureQualification)

%extend StepShape_MeasureQualification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************************
* class StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem *
**************************************************************************/
class StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aValueComponent:
	:type aValueComponent: StepBasic_MeasureValueMember
	:param aUnitComponent:
	:type aUnitComponent: StepBasic_Unit
	:param qualifiers:
	:type qualifiers: StepShape_HArray1OfValueQualifier
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_MeasureValueMember> & aValueComponent,const StepBasic_Unit & aUnitComponent,const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** Measure ******************/
		%feature("compactdefaultargs") Measure;
		%feature("autodoc", ":rtype: opencascade::handle<StepBasic_MeasureWithUnit>") Measure;
		opencascade::handle<StepBasic_MeasureWithUnit> Measure ();

		/****************** NbQualifiers ******************/
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", ":rtype: int") NbQualifiers;
		Standard_Integer NbQualifiers ();

		/****************** Qualifiers ******************/
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfValueQualifier>") Qualifiers;
		opencascade::handle<StepShape_HArray1OfValueQualifier> Qualifiers ();

		/****************** QualifiersValue ******************/
		%feature("compactdefaultargs") QualifiersValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: StepShape_ValueQualifier") QualifiersValue;
		StepShape_ValueQualifier QualifiersValue (const Standard_Integer num);

		/****************** SetMeasure ******************/
		%feature("compactdefaultargs") SetMeasure;
		%feature("autodoc", ":param Measure:
	:type Measure: StepBasic_MeasureWithUnit
	:rtype: None") SetMeasure;
		void SetMeasure (const opencascade::handle<StepBasic_MeasureWithUnit> & Measure);

		/****************** SetQualifiers ******************/
		%feature("compactdefaultargs") SetQualifiers;
		%feature("autodoc", ":param qualifiers:
	:type qualifiers: StepShape_HArray1OfValueQualifier
	:rtype: None") SetQualifiers;
		void SetQualifiers (const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** SetQualifiersValue ******************/
		%feature("compactdefaultargs") SetQualifiersValue;
		%feature("autodoc", ":param num:
	:type num: int
	:param aqualifier:
	:type aqualifier: StepShape_ValueQualifier
	:rtype: None") SetQualifiersValue;
		void SetQualifiersValue (const Standard_Integer num,const StepShape_ValueQualifier & aqualifier);

		/****************** StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem ******************/
		%feature("compactdefaultargs") StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem;
		%feature("autodoc", ":rtype: None") StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem;
		 StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem ();

};


%make_alias(StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem)

%extend StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepShape_PlusMinusTolerance *
*************************************/
class StepShape_PlusMinusTolerance : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param range:
	:type range: StepShape_ToleranceMethodDefinition
	:param toleranced_dimension:
	:type toleranced_dimension: StepShape_DimensionalCharacteristic
	:rtype: None") Init;
		void Init (const StepShape_ToleranceMethodDefinition & range,const StepShape_DimensionalCharacteristic & toleranced_dimension);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", ":rtype: StepShape_ToleranceMethodDefinition") Range;
		StepShape_ToleranceMethodDefinition Range ();

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", ":param range:
	:type range: StepShape_ToleranceMethodDefinition
	:rtype: None") SetRange;
		void SetRange (const StepShape_ToleranceMethodDefinition & range);

		/****************** SetTolerancedDimension ******************/
		%feature("compactdefaultargs") SetTolerancedDimension;
		%feature("autodoc", ":param toleranced_dimension:
	:type toleranced_dimension: StepShape_DimensionalCharacteristic
	:rtype: None") SetTolerancedDimension;
		void SetTolerancedDimension (const StepShape_DimensionalCharacteristic & toleranced_dimension);

		/****************** StepShape_PlusMinusTolerance ******************/
		%feature("compactdefaultargs") StepShape_PlusMinusTolerance;
		%feature("autodoc", ":rtype: None") StepShape_PlusMinusTolerance;
		 StepShape_PlusMinusTolerance ();

		/****************** TolerancedDimension ******************/
		%feature("compactdefaultargs") TolerancedDimension;
		%feature("autodoc", ":rtype: StepShape_DimensionalCharacteristic") TolerancedDimension;
		StepShape_DimensionalCharacteristic TolerancedDimension ();

};


%make_alias(StepShape_PlusMinusTolerance)

%extend StepShape_PlusMinusTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepShape_PrecisionQualifier *
*************************************/
class StepShape_PrecisionQualifier : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param precision_value:
	:type precision_value: int
	:rtype: None") Init;
		void Init (const Standard_Integer precision_value);

		/****************** PrecisionValue ******************/
		%feature("compactdefaultargs") PrecisionValue;
		%feature("autodoc", ":rtype: int") PrecisionValue;
		Standard_Integer PrecisionValue ();

		/****************** SetPrecisionValue ******************/
		%feature("compactdefaultargs") SetPrecisionValue;
		%feature("autodoc", ":param precision_value:
	:type precision_value: int
	:rtype: None") SetPrecisionValue;
		void SetPrecisionValue (const Standard_Integer precision_value);

		/****************** StepShape_PrecisionQualifier ******************/
		%feature("compactdefaultargs") StepShape_PrecisionQualifier;
		%feature("autodoc", ":rtype: None") StepShape_PrecisionQualifier;
		 StepShape_PrecisionQualifier ();

};


%make_alias(StepShape_PrecisionQualifier)

%extend StepShape_PrecisionQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepShape_QualifiedRepresentationItem *
**********************************************/
class StepShape_QualifiedRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param qualifiers:
	:type qualifiers: StepShape_HArray1OfValueQualifier
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** NbQualifiers ******************/
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", ":rtype: int") NbQualifiers;
		Standard_Integer NbQualifiers ();

		/****************** Qualifiers ******************/
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfValueQualifier>") Qualifiers;
		opencascade::handle<StepShape_HArray1OfValueQualifier> Qualifiers ();

		/****************** QualifiersValue ******************/
		%feature("compactdefaultargs") QualifiersValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: StepShape_ValueQualifier") QualifiersValue;
		StepShape_ValueQualifier QualifiersValue (const Standard_Integer num);

		/****************** SetQualifiers ******************/
		%feature("compactdefaultargs") SetQualifiers;
		%feature("autodoc", ":param qualifiers:
	:type qualifiers: StepShape_HArray1OfValueQualifier
	:rtype: None") SetQualifiers;
		void SetQualifiers (const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** SetQualifiersValue ******************/
		%feature("compactdefaultargs") SetQualifiersValue;
		%feature("autodoc", ":param num:
	:type num: int
	:param aqualifier:
	:type aqualifier: StepShape_ValueQualifier
	:rtype: None") SetQualifiersValue;
		void SetQualifiersValue (const Standard_Integer num,const StepShape_ValueQualifier & aqualifier);

		/****************** StepShape_QualifiedRepresentationItem ******************/
		%feature("compactdefaultargs") StepShape_QualifiedRepresentationItem;
		%feature("autodoc", ":rtype: None") StepShape_QualifiedRepresentationItem;
		 StepShape_QualifiedRepresentationItem ();

};


%make_alias(StepShape_QualifiedRepresentationItem)

%extend StepShape_QualifiedRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepShape_ReversibleTopologyItem *
*****************************************/
class StepShape_ReversibleTopologyItem : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a ReversibleTopologyItem Kind Entity that is : 1 -> Edge 2 -> Path 3 -> Face 4 -> FaceBound 5 -> ClosedShell 6 -> OpenShell 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ClosedShell ******************/
		%feature("compactdefaultargs") ClosedShell;
		%feature("autodoc", "* returns Value as a ClosedShell (Null if another type)
	:rtype: opencascade::handle<StepShape_ClosedShell>") ClosedShell;
		opencascade::handle<StepShape_ClosedShell> ClosedShell ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* returns Value as a Edge (Null if another type)
	:rtype: opencascade::handle<StepShape_Edge>") Edge;
		opencascade::handle<StepShape_Edge> Edge ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* returns Value as a Face (Null if another type)
	:rtype: opencascade::handle<StepShape_Face>") Face;
		opencascade::handle<StepShape_Face> Face ();

		/****************** FaceBound ******************/
		%feature("compactdefaultargs") FaceBound;
		%feature("autodoc", "* returns Value as a FaceBound (Null if another type)
	:rtype: opencascade::handle<StepShape_FaceBound>") FaceBound;
		opencascade::handle<StepShape_FaceBound> FaceBound ();

		/****************** OpenShell ******************/
		%feature("compactdefaultargs") OpenShell;
		%feature("autodoc", "* returns Value as a OpenShell (Null if another type)
	:rtype: opencascade::handle<StepShape_OpenShell>") OpenShell;
		opencascade::handle<StepShape_OpenShell> OpenShell ();

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "* returns Value as a Path (Null if another type)
	:rtype: opencascade::handle<StepShape_Path>") Path;
		opencascade::handle<StepShape_Path> Path ();

		/****************** StepShape_ReversibleTopologyItem ******************/
		%feature("compactdefaultargs") StepShape_ReversibleTopologyItem;
		%feature("autodoc", "* Returns a ReversibleTopologyItem SelectType
	:rtype: None") StepShape_ReversibleTopologyItem;
		 StepShape_ReversibleTopologyItem ();

};


%extend StepShape_ReversibleTopologyItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepShape_RightAngularWedge *
************************************/
class StepShape_RightAngularWedge : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement3d
	:param aX:
	:type aX: float
	:param aY:
	:type aY: float
	:param aZ:
	:type aZ: float
	:param aLtx:
	:type aLtx: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition,const Standard_Real aX,const Standard_Real aY,const Standard_Real aZ,const Standard_Real aLtx);

		/****************** Ltx ******************/
		%feature("compactdefaultargs") Ltx;
		%feature("autodoc", ":rtype: float") Ltx;
		Standard_Real Ltx ();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Axis2Placement3d>") Position;
		opencascade::handle<StepGeom_Axis2Placement3d> Position ();

		/****************** SetLtx ******************/
		%feature("compactdefaultargs") SetLtx;
		%feature("autodoc", ":param aLtx:
	:type aLtx: float
	:rtype: None") SetLtx;
		void SetLtx (const Standard_Real aLtx);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", ":param aPosition:
	:type aPosition: StepGeom_Axis2Placement3d
	:rtype: None") SetPosition;
		void SetPosition (const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", ":param aX:
	:type aX: float
	:rtype: None") SetX;
		void SetX (const Standard_Real aX);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", ":param aY:
	:type aY: float
	:rtype: None") SetY;
		void SetY (const Standard_Real aY);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", ":param aZ:
	:type aZ: float
	:rtype: None") SetZ;
		void SetZ (const Standard_Real aZ);

		/****************** StepShape_RightAngularWedge ******************/
		%feature("compactdefaultargs") StepShape_RightAngularWedge;
		%feature("autodoc", "* Returns a RightAngularWedge
	:rtype: None") StepShape_RightAngularWedge;
		 StepShape_RightAngularWedge ();

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", ":rtype: float") X;
		Standard_Real X ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", ":rtype: float") Y;
		Standard_Real Y ();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", ":rtype: float") Z;
		Standard_Real Z ();

};


%make_alias(StepShape_RightAngularWedge)

%extend StepShape_RightAngularWedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepShape_RightCircularCone *
************************************/
class StepShape_RightCircularCone : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", ":rtype: float") Height;
		Standard_Real Height ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aPosition:
	:type aPosition: StepGeom_Axis1Placement
	:param aHeight:
	:type aHeight: float
	:param aRadius:
	:type aRadius: float
	:param aSemiAngle:
	:type aSemiAngle: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_Axis1Placement> & aPosition,const Standard_Real aHeight,const Standard_Real aRadius,const Standard_Real aSemiAngle);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Axis1Placement>") Position;
		opencascade::handle<StepGeom_Axis1Placement> Position ();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", ":rtype: float") Radius;
		Standard_Real Radius ();

		/****************** SemiAngle ******************/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", ":rtype: float") SemiAngle;
		Standard_Real SemiAngle ();

		/****************** SetHeight ******************/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", ":param aHeight:
	:type aHeight: float
	:rtype: None") SetHeight;
		void SetHeight (const Standard_Real aHeight);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", ":param aPosition:
	:type aPosition: StepGeom_Axis1Placement
	:rtype: None") SetPosition;
		void SetPosition (const opencascade::handle<StepGeom_Axis1Placement> & aPosition);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", ":param aRadius:
	:type aRadius: float
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real aRadius);

		/****************** SetSemiAngle ******************/
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", ":param aSemiAngle:
	:type aSemiAngle: float
	:rtype: None") SetSemiAngle;
		void SetSemiAngle (const Standard_Real aSemiAngle);

		/****************** StepShape_RightCircularCone ******************/
		%feature("compactdefaultargs") StepShape_RightCircularCone;
		%feature("autodoc", "* Returns a RightCircularCone
	:rtype: None") StepShape_RightCircularCone;
		 StepShape_RightCircularCone ();

};


%make_alias(StepShape_RightCircularCone)

%extend StepShape_RightCircularCone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepShape_RightCircularCylinder *
****************************************/
class StepShape_RightCircularCylinder : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", ":rtype: float") Height;
		Standard_Real Height ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aPosition:
	:type aPosition: StepGeom_Axis1Placement
	:param aHeight:
	:type aHeight: float
	:param aRadius:
	:type aRadius: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_Axis1Placement> & aPosition,const Standard_Real aHeight,const Standard_Real aRadius);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Axis1Placement>") Position;
		opencascade::handle<StepGeom_Axis1Placement> Position ();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", ":rtype: float") Radius;
		Standard_Real Radius ();

		/****************** SetHeight ******************/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", ":param aHeight:
	:type aHeight: float
	:rtype: None") SetHeight;
		void SetHeight (const Standard_Real aHeight);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", ":param aPosition:
	:type aPosition: StepGeom_Axis1Placement
	:rtype: None") SetPosition;
		void SetPosition (const opencascade::handle<StepGeom_Axis1Placement> & aPosition);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", ":param aRadius:
	:type aRadius: float
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real aRadius);

		/****************** StepShape_RightCircularCylinder ******************/
		%feature("compactdefaultargs") StepShape_RightCircularCylinder;
		%feature("autodoc", "* Returns a RightCircularCylinder
	:rtype: None") StepShape_RightCircularCylinder;
		 StepShape_RightCircularCylinder ();

};


%make_alias(StepShape_RightCircularCylinder)

%extend StepShape_RightCircularCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepShape_ShapeDefinitionRepresentation *
************************************************/
class StepShape_ShapeDefinitionRepresentation : public StepRepr_PropertyDefinitionRepresentation {
	public:
		/****************** StepShape_ShapeDefinitionRepresentation ******************/
		%feature("compactdefaultargs") StepShape_ShapeDefinitionRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_ShapeDefinitionRepresentation;
		 StepShape_ShapeDefinitionRepresentation ();

};


%make_alias(StepShape_ShapeDefinitionRepresentation)

%extend StepShape_ShapeDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepShape_ShapeDimensionRepresentationItem *
***************************************************/
class StepShape_ShapeDimensionRepresentationItem : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a ShapeDimensionRepresentationItem Kind Entity that is : 1 -> CompoundRepresentationItem 2 -> DescriptiveRepresentationItem 3 -> MeasureRepresentationItem 4 -> Placement 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** CompoundRepresentationItem ******************/
		%feature("compactdefaultargs") CompoundRepresentationItem;
		%feature("autodoc", "* returns Value as a CompoundRepresentationItem (Null if another type)
	:rtype: opencascade::handle<StepRepr_CompoundRepresentationItem>") CompoundRepresentationItem;
		opencascade::handle<StepRepr_CompoundRepresentationItem> CompoundRepresentationItem ();

		/****************** DescriptiveRepresentationItem ******************/
		%feature("compactdefaultargs") DescriptiveRepresentationItem;
		%feature("autodoc", "* returns Value as a DescriptiveRepresentationItem (Null if another type)
	:rtype: opencascade::handle<StepRepr_DescriptiveRepresentationItem>") DescriptiveRepresentationItem;
		opencascade::handle<StepRepr_DescriptiveRepresentationItem> DescriptiveRepresentationItem ();

		/****************** MeasureRepresentationItem ******************/
		%feature("compactdefaultargs") MeasureRepresentationItem;
		%feature("autodoc", "* returns Value as a MeasureRepresentationItem (Null if another type)
	:rtype: opencascade::handle<StepRepr_MeasureRepresentationItem>") MeasureRepresentationItem;
		opencascade::handle<StepRepr_MeasureRepresentationItem> MeasureRepresentationItem ();

		/****************** Placement ******************/
		%feature("compactdefaultargs") Placement;
		%feature("autodoc", "* returns Value as a Placement (Null if another type)
	:rtype: opencascade::handle<StepGeom_Placement>") Placement;
		opencascade::handle<StepGeom_Placement> Placement ();

		/****************** StepShape_ShapeDimensionRepresentationItem ******************/
		%feature("compactdefaultargs") StepShape_ShapeDimensionRepresentationItem;
		%feature("autodoc", "* Returns a ShapeDimensionRepresentationItem select type
	:rtype: None") StepShape_ShapeDimensionRepresentationItem;
		 StepShape_ShapeDimensionRepresentationItem ();

};


%extend StepShape_ShapeDimensionRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepShape_ShapeRepresentation *
**************************************/
class StepShape_ShapeRepresentation : public StepRepr_Representation {
	public:
		/****************** StepShape_ShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_ShapeRepresentation;
		%feature("autodoc", "* Returns a ShapeRepresentation
	:rtype: None") StepShape_ShapeRepresentation;
		 StepShape_ShapeRepresentation ();

};


%make_alias(StepShape_ShapeRepresentation)

%extend StepShape_ShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepShape_Shell *
************************/
class StepShape_Shell : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a Shell Kind Entity that is : 1 -> OpenShell 2 -> ClosedShell 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ClosedShell ******************/
		%feature("compactdefaultargs") ClosedShell;
		%feature("autodoc", "* returns Value as a ClosedShell (Null if another type)
	:rtype: opencascade::handle<StepShape_ClosedShell>") ClosedShell;
		opencascade::handle<StepShape_ClosedShell> ClosedShell ();

		/****************** OpenShell ******************/
		%feature("compactdefaultargs") OpenShell;
		%feature("autodoc", "* returns Value as a OpenShell (Null if another type)
	:rtype: opencascade::handle<StepShape_OpenShell>") OpenShell;
		opencascade::handle<StepShape_OpenShell> OpenShell ();

		/****************** StepShape_Shell ******************/
		%feature("compactdefaultargs") StepShape_Shell;
		%feature("autodoc", "* Returns a Shell SelectType
	:rtype: None") StepShape_Shell;
		 StepShape_Shell ();

};


%extend StepShape_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepShape_ShellBasedSurfaceModel *
*****************************************/
class StepShape_ShellBasedSurfaceModel : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aSbsmBoundary:
	:type aSbsmBoundary: StepShape_HArray1OfShell
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_HArray1OfShell> & aSbsmBoundary);

		/****************** NbSbsmBoundary ******************/
		%feature("compactdefaultargs") NbSbsmBoundary;
		%feature("autodoc", ":rtype: int") NbSbsmBoundary;
		Standard_Integer NbSbsmBoundary ();

		/****************** SbsmBoundary ******************/
		%feature("compactdefaultargs") SbsmBoundary;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfShell>") SbsmBoundary;
		opencascade::handle<StepShape_HArray1OfShell> SbsmBoundary ();

		/****************** SbsmBoundaryValue ******************/
		%feature("compactdefaultargs") SbsmBoundaryValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: StepShape_Shell") SbsmBoundaryValue;
		StepShape_Shell SbsmBoundaryValue (const Standard_Integer num);

		/****************** SetSbsmBoundary ******************/
		%feature("compactdefaultargs") SetSbsmBoundary;
		%feature("autodoc", ":param aSbsmBoundary:
	:type aSbsmBoundary: StepShape_HArray1OfShell
	:rtype: None") SetSbsmBoundary;
		void SetSbsmBoundary (const opencascade::handle<StepShape_HArray1OfShell> & aSbsmBoundary);

		/****************** StepShape_ShellBasedSurfaceModel ******************/
		%feature("compactdefaultargs") StepShape_ShellBasedSurfaceModel;
		%feature("autodoc", "* Returns a ShellBasedSurfaceModel
	:rtype: None") StepShape_ShellBasedSurfaceModel;
		 StepShape_ShellBasedSurfaceModel ();

};


%make_alias(StepShape_ShellBasedSurfaceModel)

%extend StepShape_ShellBasedSurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepShape_SolidModel *
*****************************/
class StepShape_SolidModel : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** StepShape_SolidModel ******************/
		%feature("compactdefaultargs") StepShape_SolidModel;
		%feature("autodoc", "* Returns a SolidModel
	:rtype: None") StepShape_SolidModel;
		 StepShape_SolidModel ();

};


%make_alias(StepShape_SolidModel)

%extend StepShape_SolidModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepShape_Sphere *
*************************/
class StepShape_Sphere : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** Centre ******************/
		%feature("compactdefaultargs") Centre;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Point>") Centre;
		opencascade::handle<StepGeom_Point> Centre ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aRadius:
	:type aRadius: float
	:param aCentre:
	:type aCentre: StepGeom_Point
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Real aRadius,const opencascade::handle<StepGeom_Point> & aCentre);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", ":rtype: float") Radius;
		Standard_Real Radius ();

		/****************** SetCentre ******************/
		%feature("compactdefaultargs") SetCentre;
		%feature("autodoc", ":param aCentre:
	:type aCentre: StepGeom_Point
	:rtype: None") SetCentre;
		void SetCentre (const opencascade::handle<StepGeom_Point> & aCentre);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", ":param aRadius:
	:type aRadius: float
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real aRadius);

		/****************** StepShape_Sphere ******************/
		%feature("compactdefaultargs") StepShape_Sphere;
		%feature("autodoc", "* Returns a Sphere
	:rtype: None") StepShape_Sphere;
		 StepShape_Sphere ();

};


%make_alias(StepShape_Sphere)

%extend StepShape_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepShape_SurfaceModel *
*******************************/
class StepShape_SurfaceModel : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a SurfaceModel Kind Entity that is : 1 -> ShellBasedSurfaceModel 2 -> FaceBasedSurfaceModel 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ShellBasedSurfaceModel ******************/
		%feature("compactdefaultargs") ShellBasedSurfaceModel;
		%feature("autodoc", "* returns Value as a ShellBasedSurfaceModel (Null if another type)
	:rtype: opencascade::handle<StepShape_ShellBasedSurfaceModel>") ShellBasedSurfaceModel;
		opencascade::handle<StepShape_ShellBasedSurfaceModel> ShellBasedSurfaceModel ();

		/****************** StepShape_SurfaceModel ******************/
		%feature("compactdefaultargs") StepShape_SurfaceModel;
		%feature("autodoc", "* Returns a SurfaceModel SelectType
	:rtype: None") StepShape_SurfaceModel;
		 StepShape_SurfaceModel ();

};


%extend StepShape_SurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepShape_ToleranceMethodDefinition *
********************************************/
class StepShape_ToleranceMethodDefinition : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of ValueQualifier Select Type : 1 -> ToleranceValue from StepShape 2 -> LimitsAndFits from StepShape
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** LimitsAndFits ******************/
		%feature("compactdefaultargs") LimitsAndFits;
		%feature("autodoc", "* Returns Value as LimitsAndFits
	:rtype: opencascade::handle<StepShape_LimitsAndFits>") LimitsAndFits;
		opencascade::handle<StepShape_LimitsAndFits> LimitsAndFits ();

		/****************** StepShape_ToleranceMethodDefinition ******************/
		%feature("compactdefaultargs") StepShape_ToleranceMethodDefinition;
		%feature("autodoc", ":rtype: None") StepShape_ToleranceMethodDefinition;
		 StepShape_ToleranceMethodDefinition ();

		/****************** ToleranceValue ******************/
		%feature("compactdefaultargs") ToleranceValue;
		%feature("autodoc", "* Returns Value as ToleranceValue
	:rtype: opencascade::handle<StepShape_ToleranceValue>") ToleranceValue;
		opencascade::handle<StepShape_ToleranceValue> ToleranceValue ();

};


%extend StepShape_ToleranceMethodDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepShape_ToleranceValue *
*********************************/
class StepShape_ToleranceValue : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param lower_bound:
	:type lower_bound: Standard_Transient
	:param upper_bound:
	:type upper_bound: Standard_Transient
	:rtype: None") Init;
		void Init (const opencascade::handle<Standard_Transient> & lower_bound,const opencascade::handle<Standard_Transient> & upper_bound);

		/****************** LowerBound ******************/
		%feature("compactdefaultargs") LowerBound;
		%feature("autodoc", ":rtype: opencascade::handle<Standard_Transient>") LowerBound;
		opencascade::handle<Standard_Transient> LowerBound ();

		/****************** SetLowerBound ******************/
		%feature("compactdefaultargs") SetLowerBound;
		%feature("autodoc", ":param lower_bound:
	:type lower_bound: Standard_Transient
	:rtype: None") SetLowerBound;
		void SetLowerBound (const opencascade::handle<Standard_Transient> & lower_bound);

		/****************** SetUpperBound ******************/
		%feature("compactdefaultargs") SetUpperBound;
		%feature("autodoc", ":param upper_bound:
	:type upper_bound: Standard_Transient
	:rtype: None") SetUpperBound;
		void SetUpperBound (const opencascade::handle<Standard_Transient> & upper_bound);

		/****************** StepShape_ToleranceValue ******************/
		%feature("compactdefaultargs") StepShape_ToleranceValue;
		%feature("autodoc", ":rtype: None") StepShape_ToleranceValue;
		 StepShape_ToleranceValue ();

		/****************** UpperBound ******************/
		%feature("compactdefaultargs") UpperBound;
		%feature("autodoc", ":rtype: opencascade::handle<Standard_Transient>") UpperBound;
		opencascade::handle<Standard_Transient> UpperBound ();

};


%make_alias(StepShape_ToleranceValue)

%extend StepShape_ToleranceValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepShape_TopologicalRepresentationItem *
************************************************/
class StepShape_TopologicalRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****************** StepShape_TopologicalRepresentationItem ******************/
		%feature("compactdefaultargs") StepShape_TopologicalRepresentationItem;
		%feature("autodoc", "* Returns a TopologicalRepresentationItem
	:rtype: None") StepShape_TopologicalRepresentationItem;
		 StepShape_TopologicalRepresentationItem ();

};


%make_alias(StepShape_TopologicalRepresentationItem)

%extend StepShape_TopologicalRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepShape_Torus *
************************/
class StepShape_Torus : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aPosition:
	:type aPosition: StepGeom_Axis1Placement
	:param aMajorRadius:
	:type aMajorRadius: float
	:param aMinorRadius:
	:type aMinorRadius: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_Axis1Placement> & aPosition,const Standard_Real aMajorRadius,const Standard_Real aMinorRadius);

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", ":rtype: float") MajorRadius;
		Standard_Real MajorRadius ();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", ":rtype: float") MinorRadius;
		Standard_Real MinorRadius ();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Axis1Placement>") Position;
		opencascade::handle<StepGeom_Axis1Placement> Position ();

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", ":param aMajorRadius:
	:type aMajorRadius: float
	:rtype: None") SetMajorRadius;
		void SetMajorRadius (const Standard_Real aMajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", ":param aMinorRadius:
	:type aMinorRadius: float
	:rtype: None") SetMinorRadius;
		void SetMinorRadius (const Standard_Real aMinorRadius);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", ":param aPosition:
	:type aPosition: StepGeom_Axis1Placement
	:rtype: None") SetPosition;
		void SetPosition (const opencascade::handle<StepGeom_Axis1Placement> & aPosition);

		/****************** StepShape_Torus ******************/
		%feature("compactdefaultargs") StepShape_Torus;
		%feature("autodoc", "* Returns a Torus
	:rtype: None") StepShape_Torus;
		 StepShape_Torus ();

};


%make_alias(StepShape_Torus)

%extend StepShape_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepShape_TypeQualifier *
********************************/
class StepShape_TypeQualifier : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param name:
	:type name: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", ":rtype: opencascade::handle<TCollection_HAsciiString>") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", ":param name:
	:type name: TCollection_HAsciiString
	:rtype: None") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** StepShape_TypeQualifier ******************/
		%feature("compactdefaultargs") StepShape_TypeQualifier;
		%feature("autodoc", ":rtype: None") StepShape_TypeQualifier;
		 StepShape_TypeQualifier ();

};


%make_alias(StepShape_TypeQualifier)

%extend StepShape_TypeQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepShape_ValueFormatTypeQualifier *
*******************************************/
class StepShape_ValueFormatTypeQualifier : public Standard_Transient {
	public:
		/****************** FormatType ******************/
		%feature("compactdefaultargs") FormatType;
		%feature("autodoc", "* Returns field FormatType
	:rtype: inline opencascade::handle<TCollection_HAsciiString>") FormatType;
		inline opencascade::handle<TCollection_HAsciiString> FormatType ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Init all field own and inherited
	:param theFormatType:
	:type theFormatType: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theFormatType);

		/****************** SetFormatType ******************/
		%feature("compactdefaultargs") SetFormatType;
		%feature("autodoc", "* Set field FormatType
	:param theFormatType:
	:type theFormatType: TCollection_HAsciiString
	:rtype: inline void") SetFormatType;
		inline void SetFormatType (const opencascade::handle<TCollection_HAsciiString> & theFormatType);

		/****************** StepShape_ValueFormatTypeQualifier ******************/
		%feature("compactdefaultargs") StepShape_ValueFormatTypeQualifier;
		%feature("autodoc", ":rtype: None") StepShape_ValueFormatTypeQualifier;
		 StepShape_ValueFormatTypeQualifier ();

};


%make_alias(StepShape_ValueFormatTypeQualifier)

%extend StepShape_ValueFormatTypeQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepShape_ValueQualifier *
*********************************/
class StepShape_ValueQualifier : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of ValueQualifier Select Type : 1 -> PrecisionQualifier from StepShape 2 -> TypeQualifier from StepShape 3 -> UnceraintyQualifier .. not yet implemented 4 -> ValueFormatTypeQualifier
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** PrecisionQualifier ******************/
		%feature("compactdefaultargs") PrecisionQualifier;
		%feature("autodoc", "* Returns Value as PrecisionQualifier
	:rtype: opencascade::handle<StepShape_PrecisionQualifier>") PrecisionQualifier;
		opencascade::handle<StepShape_PrecisionQualifier> PrecisionQualifier ();

		/****************** StepShape_ValueQualifier ******************/
		%feature("compactdefaultargs") StepShape_ValueQualifier;
		%feature("autodoc", ":rtype: None") StepShape_ValueQualifier;
		 StepShape_ValueQualifier ();

		/****************** TypeQualifier ******************/
		%feature("compactdefaultargs") TypeQualifier;
		%feature("autodoc", "* Returns Value as TypeQualifier
	:rtype: opencascade::handle<StepShape_TypeQualifier>") TypeQualifier;
		opencascade::handle<StepShape_TypeQualifier> TypeQualifier ();

		/****************** ValueFormatTypeQualifier ******************/
		%feature("compactdefaultargs") ValueFormatTypeQualifier;
		%feature("autodoc", "* Returns Value as ValueFormatTypeQualifier
	:rtype: opencascade::handle<StepShape_ValueFormatTypeQualifier>") ValueFormatTypeQualifier;
		opencascade::handle<StepShape_ValueFormatTypeQualifier> ValueFormatTypeQualifier ();

};


%extend StepShape_ValueQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepShape_AdvancedBrepShapeRepresentation *
**************************************************/
class StepShape_AdvancedBrepShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_AdvancedBrepShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_AdvancedBrepShapeRepresentation;
		%feature("autodoc", "* Returns a AdvancedBrepShapeRepresentation
	:rtype: None") StepShape_AdvancedBrepShapeRepresentation;
		 StepShape_AdvancedBrepShapeRepresentation ();

};


%make_alias(StepShape_AdvancedBrepShapeRepresentation)

%extend StepShape_AdvancedBrepShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepShape_AngularLocation *
**********************************/
class StepShape_AngularLocation : public StepShape_DimensionalLocation {
	public:
		/****************** AngleSelection ******************/
		%feature("compactdefaultargs") AngleSelection;
		%feature("autodoc", "* Returns field AngleSelection
	:rtype: StepShape_AngleRelator") AngleSelection;
		StepShape_AngleRelator AngleSelection ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aShapeAspectRelationship_Name:
	:type aShapeAspectRelationship_Name: TCollection_HAsciiString
	:param hasShapeAspectRelationship_Description:
	:type hasShapeAspectRelationship_Description: bool
	:param aShapeAspectRelationship_Description:
	:type aShapeAspectRelationship_Description: TCollection_HAsciiString
	:param aShapeAspectRelationship_RelatingShapeAspect:
	:type aShapeAspectRelationship_RelatingShapeAspect: StepRepr_ShapeAspect
	:param aShapeAspectRelationship_RelatedShapeAspect:
	:type aShapeAspectRelationship_RelatedShapeAspect: StepRepr_ShapeAspect
	:param aAngleSelection:
	:type aAngleSelection: StepShape_AngleRelator
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aShapeAspectRelationship_Name,const Standard_Boolean hasShapeAspectRelationship_Description,const opencascade::handle<TCollection_HAsciiString> & aShapeAspectRelationship_Description,const opencascade::handle<StepRepr_ShapeAspect> & aShapeAspectRelationship_RelatingShapeAspect,const opencascade::handle<StepRepr_ShapeAspect> & aShapeAspectRelationship_RelatedShapeAspect,const StepShape_AngleRelator aAngleSelection);

		/****************** SetAngleSelection ******************/
		%feature("compactdefaultargs") SetAngleSelection;
		%feature("autodoc", "* Set field AngleSelection
	:param AngleSelection:
	:type AngleSelection: StepShape_AngleRelator
	:rtype: None") SetAngleSelection;
		void SetAngleSelection (const StepShape_AngleRelator AngleSelection);

		/****************** StepShape_AngularLocation ******************/
		%feature("compactdefaultargs") StepShape_AngularLocation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_AngularLocation;
		 StepShape_AngularLocation ();

};


%make_alias(StepShape_AngularLocation)

%extend StepShape_AngularLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepShape_AngularSize *
******************************/
class StepShape_AngularSize : public StepShape_DimensionalSize {
	public:
		/****************** AngleSelection ******************/
		%feature("compactdefaultargs") AngleSelection;
		%feature("autodoc", "* Returns field AngleSelection
	:rtype: StepShape_AngleRelator") AngleSelection;
		StepShape_AngleRelator AngleSelection ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aDimensionalSize_AppliesTo:
	:type aDimensionalSize_AppliesTo: StepRepr_ShapeAspect
	:param aDimensionalSize_Name:
	:type aDimensionalSize_Name: TCollection_HAsciiString
	:param aAngleSelection:
	:type aAngleSelection: StepShape_AngleRelator
	:rtype: None") Init;
		void Init (const opencascade::handle<StepRepr_ShapeAspect> & aDimensionalSize_AppliesTo,const opencascade::handle<TCollection_HAsciiString> & aDimensionalSize_Name,const StepShape_AngleRelator aAngleSelection);

		/****************** SetAngleSelection ******************/
		%feature("compactdefaultargs") SetAngleSelection;
		%feature("autodoc", "* Set field AngleSelection
	:param AngleSelection:
	:type AngleSelection: StepShape_AngleRelator
	:rtype: None") SetAngleSelection;
		void SetAngleSelection (const StepShape_AngleRelator AngleSelection);

		/****************** StepShape_AngularSize ******************/
		%feature("compactdefaultargs") StepShape_AngularSize;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_AngularSize;
		 StepShape_AngularSize ();

};


%make_alias(StepShape_AngularSize)

%extend StepShape_AngularSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepShape_BoxedHalfSpace *
*********************************/
class StepShape_BoxedHalfSpace : public StepShape_HalfSpaceSolid {
	public:
		/****************** Enclosure ******************/
		%feature("compactdefaultargs") Enclosure;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_BoxDomain>") Enclosure;
		opencascade::handle<StepShape_BoxDomain> Enclosure ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aBaseSurface:
	:type aBaseSurface: StepGeom_Surface
	:param aAgreementFlag:
	:type aAgreementFlag: bool
	:param aEnclosure:
	:type aEnclosure: StepShape_BoxDomain
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_Surface> & aBaseSurface,const Standard_Boolean aAgreementFlag,const opencascade::handle<StepShape_BoxDomain> & aEnclosure);

		/****************** SetEnclosure ******************/
		%feature("compactdefaultargs") SetEnclosure;
		%feature("autodoc", ":param aEnclosure:
	:type aEnclosure: StepShape_BoxDomain
	:rtype: None") SetEnclosure;
		void SetEnclosure (const opencascade::handle<StepShape_BoxDomain> & aEnclosure);

		/****************** StepShape_BoxedHalfSpace ******************/
		%feature("compactdefaultargs") StepShape_BoxedHalfSpace;
		%feature("autodoc", "* Returns a BoxedHalfSpace
	:rtype: None") StepShape_BoxedHalfSpace;
		 StepShape_BoxedHalfSpace ();

};


%make_alias(StepShape_BoxedHalfSpace)

%extend StepShape_BoxedHalfSpace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepShape_CompoundShapeRepresentation *
**********************************************/
class StepShape_CompoundShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_CompoundShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_CompoundShapeRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_CompoundShapeRepresentation;
		 StepShape_CompoundShapeRepresentation ();

};


%make_alias(StepShape_CompoundShapeRepresentation)

%extend StepShape_CompoundShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepShape_ConnectedEdgeSet *
***********************************/
class StepShape_ConnectedEdgeSet : public StepShape_TopologicalRepresentationItem {
	public:
		/****************** CesEdges ******************/
		%feature("compactdefaultargs") CesEdges;
		%feature("autodoc", "* Returns field CesEdges
	:rtype: opencascade::handle<StepShape_HArray1OfEdge>") CesEdges;
		opencascade::handle<StepShape_HArray1OfEdge> CesEdges ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aCesEdges:
	:type aCesEdges: StepShape_HArray1OfEdge
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepShape_HArray1OfEdge> & aCesEdges);

		/****************** SetCesEdges ******************/
		%feature("compactdefaultargs") SetCesEdges;
		%feature("autodoc", "* Set field CesEdges
	:param CesEdges:
	:type CesEdges: StepShape_HArray1OfEdge
	:rtype: None") SetCesEdges;
		void SetCesEdges (const opencascade::handle<StepShape_HArray1OfEdge> & CesEdges);

		/****************** StepShape_ConnectedEdgeSet ******************/
		%feature("compactdefaultargs") StepShape_ConnectedEdgeSet;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_ConnectedEdgeSet;
		 StepShape_ConnectedEdgeSet ();

};


%make_alias(StepShape_ConnectedEdgeSet)

%extend StepShape_ConnectedEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepShape_ConnectedFaceSet *
***********************************/
class StepShape_ConnectedFaceSet : public StepShape_TopologicalRepresentationItem {
	public:
		/****************** CfsFaces ******************/
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfFace>") CfsFaces;
		virtual opencascade::handle<StepShape_HArray1OfFace> CfsFaces ();

		/****************** CfsFacesValue ******************/
		%feature("compactdefaultargs") CfsFacesValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_Face>") CfsFacesValue;
		virtual opencascade::handle<StepShape_Face> CfsFacesValue (const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aCfsFaces:
	:type aCfsFaces: StepShape_HArray1OfFace
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_HArray1OfFace> & aCfsFaces);

		/****************** NbCfsFaces ******************/
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", ":rtype: int") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces ();

		/****************** SetCfsFaces ******************/
		%feature("compactdefaultargs") SetCfsFaces;
		%feature("autodoc", ":param aCfsFaces:
	:type aCfsFaces: StepShape_HArray1OfFace
	:rtype: void") SetCfsFaces;
		virtual void SetCfsFaces (const opencascade::handle<StepShape_HArray1OfFace> & aCfsFaces);

		/****************** StepShape_ConnectedFaceSet ******************/
		%feature("compactdefaultargs") StepShape_ConnectedFaceSet;
		%feature("autodoc", "* Returns a ConnectedFaceSet
	:rtype: None") StepShape_ConnectedFaceSet;
		 StepShape_ConnectedFaceSet ();

};


%make_alias(StepShape_ConnectedFaceSet)

%extend StepShape_ConnectedFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepShape_CsgShapeRepresentation *
*****************************************/
class StepShape_CsgShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_CsgShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_CsgShapeRepresentation;
		%feature("autodoc", "* Returns a CsgShapeRepresentation
	:rtype: None") StepShape_CsgShapeRepresentation;
		 StepShape_CsgShapeRepresentation ();

};


%make_alias(StepShape_CsgShapeRepresentation)

%extend StepShape_CsgShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepShape_CsgSolid *
***************************/
class StepShape_CsgSolid : public StepShape_SolidModel {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aTreeRootExpression:
	:type aTreeRootExpression: StepShape_CsgSelect
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const StepShape_CsgSelect & aTreeRootExpression);

		/****************** SetTreeRootExpression ******************/
		%feature("compactdefaultargs") SetTreeRootExpression;
		%feature("autodoc", ":param aTreeRootExpression:
	:type aTreeRootExpression: StepShape_CsgSelect
	:rtype: None") SetTreeRootExpression;
		void SetTreeRootExpression (const StepShape_CsgSelect & aTreeRootExpression);

		/****************** StepShape_CsgSolid ******************/
		%feature("compactdefaultargs") StepShape_CsgSolid;
		%feature("autodoc", "* Returns a CsgSolid
	:rtype: None") StepShape_CsgSolid;
		 StepShape_CsgSolid ();

		/****************** TreeRootExpression ******************/
		%feature("compactdefaultargs") TreeRootExpression;
		%feature("autodoc", ":rtype: StepShape_CsgSelect") TreeRootExpression;
		StepShape_CsgSelect TreeRootExpression ();

};


%make_alias(StepShape_CsgSolid)

%extend StepShape_CsgSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepShape_DimensionalLocationWithPath *
**********************************************/
class StepShape_DimensionalLocationWithPath : public StepShape_DimensionalLocation {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aShapeAspectRelationship_Name:
	:type aShapeAspectRelationship_Name: TCollection_HAsciiString
	:param hasShapeAspectRelationship_Description:
	:type hasShapeAspectRelationship_Description: bool
	:param aShapeAspectRelationship_Description:
	:type aShapeAspectRelationship_Description: TCollection_HAsciiString
	:param aShapeAspectRelationship_RelatingShapeAspect:
	:type aShapeAspectRelationship_RelatingShapeAspect: StepRepr_ShapeAspect
	:param aShapeAspectRelationship_RelatedShapeAspect:
	:type aShapeAspectRelationship_RelatedShapeAspect: StepRepr_ShapeAspect
	:param aPath:
	:type aPath: StepRepr_ShapeAspect
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aShapeAspectRelationship_Name,const Standard_Boolean hasShapeAspectRelationship_Description,const opencascade::handle<TCollection_HAsciiString> & aShapeAspectRelationship_Description,const opencascade::handle<StepRepr_ShapeAspect> & aShapeAspectRelationship_RelatingShapeAspect,const opencascade::handle<StepRepr_ShapeAspect> & aShapeAspectRelationship_RelatedShapeAspect,const opencascade::handle<StepRepr_ShapeAspect> & aPath);

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "* Returns field Path
	:rtype: opencascade::handle<StepRepr_ShapeAspect>") Path;
		opencascade::handle<StepRepr_ShapeAspect> Path ();

		/****************** SetPath ******************/
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "* Set field Path
	:param Path:
	:type Path: StepRepr_ShapeAspect
	:rtype: None") SetPath;
		void SetPath (const opencascade::handle<StepRepr_ShapeAspect> & Path);

		/****************** StepShape_DimensionalLocationWithPath ******************/
		%feature("compactdefaultargs") StepShape_DimensionalLocationWithPath;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_DimensionalLocationWithPath;
		 StepShape_DimensionalLocationWithPath ();

};


%make_alias(StepShape_DimensionalLocationWithPath)

%extend StepShape_DimensionalLocationWithPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepShape_DimensionalSizeWithPath *
******************************************/
class StepShape_DimensionalSizeWithPath : public StepShape_DimensionalSize {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aDimensionalSize_AppliesTo:
	:type aDimensionalSize_AppliesTo: StepRepr_ShapeAspect
	:param aDimensionalSize_Name:
	:type aDimensionalSize_Name: TCollection_HAsciiString
	:param aPath:
	:type aPath: StepRepr_ShapeAspect
	:rtype: None") Init;
		void Init (const opencascade::handle<StepRepr_ShapeAspect> & aDimensionalSize_AppliesTo,const opencascade::handle<TCollection_HAsciiString> & aDimensionalSize_Name,const opencascade::handle<StepRepr_ShapeAspect> & aPath);

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "* Returns field Path
	:rtype: opencascade::handle<StepRepr_ShapeAspect>") Path;
		opencascade::handle<StepRepr_ShapeAspect> Path ();

		/****************** SetPath ******************/
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "* Set field Path
	:param Path:
	:type Path: StepRepr_ShapeAspect
	:rtype: None") SetPath;
		void SetPath (const opencascade::handle<StepRepr_ShapeAspect> & Path);

		/****************** StepShape_DimensionalSizeWithPath ******************/
		%feature("compactdefaultargs") StepShape_DimensionalSizeWithPath;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_DimensionalSizeWithPath;
		 StepShape_DimensionalSizeWithPath ();

};


%make_alias(StepShape_DimensionalSizeWithPath)

%extend StepShape_DimensionalSizeWithPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepShape_DirectedDimensionalLocation *
**********************************************/
class StepShape_DirectedDimensionalLocation : public StepShape_DimensionalLocation {
	public:
		/****************** StepShape_DirectedDimensionalLocation ******************/
		%feature("compactdefaultargs") StepShape_DirectedDimensionalLocation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_DirectedDimensionalLocation;
		 StepShape_DirectedDimensionalLocation ();

};


%make_alias(StepShape_DirectedDimensionalLocation)

%extend StepShape_DirectedDimensionalLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepShape_Edge *
***********************/
class StepShape_Edge : public StepShape_TopologicalRepresentationItem {
	public:
		/****************** EdgeEnd ******************/
		%feature("compactdefaultargs") EdgeEnd;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_Vertex>") EdgeEnd;
		virtual opencascade::handle<StepShape_Vertex> EdgeEnd ();

		/****************** EdgeStart ******************/
		%feature("compactdefaultargs") EdgeStart;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_Vertex>") EdgeStart;
		virtual opencascade::handle<StepShape_Vertex> EdgeStart ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aEdgeStart:
	:type aEdgeStart: StepShape_Vertex
	:param aEdgeEnd:
	:type aEdgeEnd: StepShape_Vertex
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_Vertex> & aEdgeStart,const opencascade::handle<StepShape_Vertex> & aEdgeEnd);

		/****************** SetEdgeEnd ******************/
		%feature("compactdefaultargs") SetEdgeEnd;
		%feature("autodoc", ":param aEdgeEnd:
	:type aEdgeEnd: StepShape_Vertex
	:rtype: void") SetEdgeEnd;
		virtual void SetEdgeEnd (const opencascade::handle<StepShape_Vertex> & aEdgeEnd);

		/****************** SetEdgeStart ******************/
		%feature("compactdefaultargs") SetEdgeStart;
		%feature("autodoc", ":param aEdgeStart:
	:type aEdgeStart: StepShape_Vertex
	:rtype: void") SetEdgeStart;
		virtual void SetEdgeStart (const opencascade::handle<StepShape_Vertex> & aEdgeStart);

		/****************** StepShape_Edge ******************/
		%feature("compactdefaultargs") StepShape_Edge;
		%feature("autodoc", "* Returns a Edge
	:rtype: None") StepShape_Edge;
		 StepShape_Edge ();

};


%make_alias(StepShape_Edge)

%extend StepShape_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepShape_EdgeBasedWireframeShapeRepresentation *
********************************************************/
class StepShape_EdgeBasedWireframeShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_EdgeBasedWireframeShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_EdgeBasedWireframeShapeRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_EdgeBasedWireframeShapeRepresentation;
		 StepShape_EdgeBasedWireframeShapeRepresentation ();

};


%make_alias(StepShape_EdgeBasedWireframeShapeRepresentation)

%extend StepShape_EdgeBasedWireframeShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepShape_Face *
***********************/
class StepShape_Face : public StepShape_TopologicalRepresentationItem {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfFaceBound>") Bounds;
		virtual opencascade::handle<StepShape_HArray1OfFaceBound> Bounds ();

		/****************** BoundsValue ******************/
		%feature("compactdefaultargs") BoundsValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_FaceBound>") BoundsValue;
		virtual opencascade::handle<StepShape_FaceBound> BoundsValue (const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aBounds:
	:type aBounds: StepShape_HArray1OfFaceBound
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_HArray1OfFaceBound> & aBounds);

		/****************** NbBounds ******************/
		%feature("compactdefaultargs") NbBounds;
		%feature("autodoc", ":rtype: int") NbBounds;
		virtual Standard_Integer NbBounds ();

		/****************** SetBounds ******************/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", ":param aBounds:
	:type aBounds: StepShape_HArray1OfFaceBound
	:rtype: void") SetBounds;
		virtual void SetBounds (const opencascade::handle<StepShape_HArray1OfFaceBound> & aBounds);

		/****************** StepShape_Face ******************/
		%feature("compactdefaultargs") StepShape_Face;
		%feature("autodoc", "* Returns a Face
	:rtype: None") StepShape_Face;
		 StepShape_Face ();

};


%make_alias(StepShape_Face)

%extend StepShape_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepShape_FaceBound *
****************************/
class StepShape_FaceBound : public StepShape_TopologicalRepresentationItem {
	public:
		/****************** Bound ******************/
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_Loop>") Bound;
		opencascade::handle<StepShape_Loop> Bound ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aBound:
	:type aBound: StepShape_Loop
	:param aOrientation:
	:type aOrientation: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_Loop> & aBound,const Standard_Boolean aOrientation);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: bool") Orientation;
		Standard_Boolean Orientation ();

		/****************** SetBound ******************/
		%feature("compactdefaultargs") SetBound;
		%feature("autodoc", ":param aBound:
	:type aBound: StepShape_Loop
	:rtype: None") SetBound;
		void SetBound (const opencascade::handle<StepShape_Loop> & aBound);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", ":param aOrientation:
	:type aOrientation: bool
	:rtype: None") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);

		/****************** StepShape_FaceBound ******************/
		%feature("compactdefaultargs") StepShape_FaceBound;
		%feature("autodoc", "* Returns a FaceBound
	:rtype: None") StepShape_FaceBound;
		 StepShape_FaceBound ();

};


%make_alias(StepShape_FaceBound)

%extend StepShape_FaceBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepShape_FacetedBrepShapeRepresentation *
*************************************************/
class StepShape_FacetedBrepShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_FacetedBrepShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_FacetedBrepShapeRepresentation;
		%feature("autodoc", "* Returns a FacetedBrepShapeRepresentation
	:rtype: None") StepShape_FacetedBrepShapeRepresentation;
		 StepShape_FacetedBrepShapeRepresentation ();

};


%make_alias(StepShape_FacetedBrepShapeRepresentation)

%extend StepShape_FacetedBrepShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepShape_GeometricCurveSet *
************************************/
class StepShape_GeometricCurveSet : public StepShape_GeometricSet {
	public:
		/****************** StepShape_GeometricCurveSet ******************/
		%feature("compactdefaultargs") StepShape_GeometricCurveSet;
		%feature("autodoc", "* Returns a GeometricCurveSet
	:rtype: None") StepShape_GeometricCurveSet;
		 StepShape_GeometricCurveSet ();

};


%make_alias(StepShape_GeometricCurveSet)

%extend StepShape_GeometricCurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************
* class StepShape_GeometricallyBoundedSurfaceShapeRepresentation *
*****************************************************************/
class StepShape_GeometricallyBoundedSurfaceShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_GeometricallyBoundedSurfaceShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_GeometricallyBoundedSurfaceShapeRepresentation;
		%feature("autodoc", "* Returns a GeometricallyBoundedSurfaceShapeRepresentation
	:rtype: None") StepShape_GeometricallyBoundedSurfaceShapeRepresentation;
		 StepShape_GeometricallyBoundedSurfaceShapeRepresentation ();

};


%make_alias(StepShape_GeometricallyBoundedSurfaceShapeRepresentation)

%extend StepShape_GeometricallyBoundedSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************************
* class StepShape_GeometricallyBoundedWireframeShapeRepresentation *
*******************************************************************/
class StepShape_GeometricallyBoundedWireframeShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_GeometricallyBoundedWireframeShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_GeometricallyBoundedWireframeShapeRepresentation;
		%feature("autodoc", "* Returns a GeometricallyBoundedWireframeShapeRepresentation
	:rtype: None") StepShape_GeometricallyBoundedWireframeShapeRepresentation;
		 StepShape_GeometricallyBoundedWireframeShapeRepresentation ();

};


%make_alias(StepShape_GeometricallyBoundedWireframeShapeRepresentation)

%extend StepShape_GeometricallyBoundedWireframeShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepShape_Loop *
***********************/
class StepShape_Loop : public StepShape_TopologicalRepresentationItem {
	public:
		/****************** StepShape_Loop ******************/
		%feature("compactdefaultargs") StepShape_Loop;
		%feature("autodoc", "* Returns a Loop
	:rtype: None") StepShape_Loop;
		 StepShape_Loop ();

};


%make_alias(StepShape_Loop)

%extend StepShape_Loop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepShape_LoopAndPath *
******************************/
class StepShape_LoopAndPath : public StepShape_TopologicalRepresentationItem {
	public:
		/****************** EdgeList ******************/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfOrientedEdge>") EdgeList;
		opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList ();

		/****************** EdgeListValue ******************/
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_OrientedEdge>") EdgeListValue;
		opencascade::handle<StepShape_OrientedEdge> EdgeListValue (const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aLoop:
	:type aLoop: StepShape_Loop
	:param aPath:
	:type aPath: StepShape_Path
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_Loop> & aLoop,const opencascade::handle<StepShape_Path> & aPath);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aEdgeList:
	:type aEdgeList: StepShape_HArray1OfOrientedEdge
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** Loop ******************/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_Loop>") Loop;
		opencascade::handle<StepShape_Loop> Loop ();

		/****************** NbEdgeList ******************/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", ":rtype: int") NbEdgeList;
		Standard_Integer NbEdgeList ();

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_Path>") Path;
		opencascade::handle<StepShape_Path> Path ();

		/****************** SetEdgeList ******************/
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", ":param aEdgeList:
	:type aEdgeList: StepShape_HArray1OfOrientedEdge
	:rtype: None") SetEdgeList;
		void SetEdgeList (const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** SetLoop ******************/
		%feature("compactdefaultargs") SetLoop;
		%feature("autodoc", ":param aLoop:
	:type aLoop: StepShape_Loop
	:rtype: None") SetLoop;
		void SetLoop (const opencascade::handle<StepShape_Loop> & aLoop);

		/****************** SetPath ******************/
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", ":param aPath:
	:type aPath: StepShape_Path
	:rtype: None") SetPath;
		void SetPath (const opencascade::handle<StepShape_Path> & aPath);

		/****************** StepShape_LoopAndPath ******************/
		%feature("compactdefaultargs") StepShape_LoopAndPath;
		%feature("autodoc", "* Returns a LoopAndPath
	:rtype: None") StepShape_LoopAndPath;
		 StepShape_LoopAndPath ();

};


%make_alias(StepShape_LoopAndPath)

%extend StepShape_LoopAndPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepShape_ManifoldSolidBrep *
************************************/
class StepShape_ManifoldSolidBrep : public StepShape_SolidModel {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aOuter:
	:type aOuter: StepShape_ClosedShell
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_ClosedShell> & aOuter);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aOuter:
	:type aOuter: StepShape_ConnectedFaceSet
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_ConnectedFaceSet> & aOuter);

		/****************** Outer ******************/
		%feature("compactdefaultargs") Outer;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_ConnectedFaceSet>") Outer;
		opencascade::handle<StepShape_ConnectedFaceSet> Outer ();

		/****************** SetOuter ******************/
		%feature("compactdefaultargs") SetOuter;
		%feature("autodoc", ":param aOuter:
	:type aOuter: StepShape_ConnectedFaceSet
	:rtype: None") SetOuter;
		void SetOuter (const opencascade::handle<StepShape_ConnectedFaceSet> & aOuter);

		/****************** StepShape_ManifoldSolidBrep ******************/
		%feature("compactdefaultargs") StepShape_ManifoldSolidBrep;
		%feature("autodoc", "* Returns a ManifoldSolidBrep
	:rtype: None") StepShape_ManifoldSolidBrep;
		 StepShape_ManifoldSolidBrep ();

};


%make_alias(StepShape_ManifoldSolidBrep)

%extend StepShape_ManifoldSolidBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class StepShape_ManifoldSurfaceShapeRepresentation *
*****************************************************/
class StepShape_ManifoldSurfaceShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_ManifoldSurfaceShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_ManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "* Returns a ManifoldSurfaceShapeRepresentation
	:rtype: None") StepShape_ManifoldSurfaceShapeRepresentation;
		 StepShape_ManifoldSurfaceShapeRepresentation ();

};


%make_alias(StepShape_ManifoldSurfaceShapeRepresentation)

%extend StepShape_ManifoldSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepShape_NonManifoldSurfaceShapeRepresentation *
********************************************************/
class StepShape_NonManifoldSurfaceShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_NonManifoldSurfaceShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_NonManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_NonManifoldSurfaceShapeRepresentation;
		 StepShape_NonManifoldSurfaceShapeRepresentation ();

};


%make_alias(StepShape_NonManifoldSurfaceShapeRepresentation)

%extend StepShape_NonManifoldSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepShape_Path *
***********************/
class StepShape_Path : public StepShape_TopologicalRepresentationItem {
	public:
		/****************** EdgeList ******************/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfOrientedEdge>") EdgeList;
		virtual opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList ();

		/****************** EdgeListValue ******************/
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_OrientedEdge>") EdgeListValue;
		virtual opencascade::handle<StepShape_OrientedEdge> EdgeListValue (const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aEdgeList:
	:type aEdgeList: StepShape_HArray1OfOrientedEdge
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** NbEdgeList ******************/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", ":rtype: int") NbEdgeList;
		virtual Standard_Integer NbEdgeList ();

		/****************** SetEdgeList ******************/
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", ":param aEdgeList:
	:type aEdgeList: StepShape_HArray1OfOrientedEdge
	:rtype: void") SetEdgeList;
		virtual void SetEdgeList (const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** StepShape_Path ******************/
		%feature("compactdefaultargs") StepShape_Path;
		%feature("autodoc", "* Returns a Path
	:rtype: None") StepShape_Path;
		 StepShape_Path ();

};


%make_alias(StepShape_Path)

%extend StepShape_Path {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepShape_PointRepresentation *
**************************************/
class StepShape_PointRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_PointRepresentation ******************/
		%feature("compactdefaultargs") StepShape_PointRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_PointRepresentation;
		 StepShape_PointRepresentation ();

};


%make_alias(StepShape_PointRepresentation)

%extend StepShape_PointRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepShape_ShapeDimensionRepresentation *
***********************************************/
class StepShape_ShapeDimensionRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields AP214
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theItems:
	:type theItems: StepRepr_HArray1OfRepresentationItem
	:param theContextOfItems:
	:type theContextOfItems: StepRepr_RepresentationContext
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theItems,const opencascade::handle<StepRepr_RepresentationContext> & theContextOfItems);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields AP242
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theItems:
	:type theItems: StepShape_HArray1OfShapeDimensionRepresentationItem
	:param theContextOfItems:
	:type theContextOfItems: StepRepr_RepresentationContext
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<StepShape_HArray1OfShapeDimensionRepresentationItem> & theItems,const opencascade::handle<StepRepr_RepresentationContext> & theContextOfItems);

		/****************** ItemsAP242 ******************/
		%feature("compactdefaultargs") ItemsAP242;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfShapeDimensionRepresentationItem>") ItemsAP242;
		opencascade::handle<StepShape_HArray1OfShapeDimensionRepresentationItem> ItemsAP242 ();

		/****************** SetItemsAP242 ******************/
		%feature("compactdefaultargs") SetItemsAP242;
		%feature("autodoc", ":param theItems:
	:type theItems: StepShape_HArray1OfShapeDimensionRepresentationItem
	:rtype: None") SetItemsAP242;
		void SetItemsAP242 (const opencascade::handle<StepShape_HArray1OfShapeDimensionRepresentationItem> & theItems);

		/****************** StepShape_ShapeDimensionRepresentation ******************/
		%feature("compactdefaultargs") StepShape_ShapeDimensionRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_ShapeDimensionRepresentation;
		 StepShape_ShapeDimensionRepresentation ();

};


%make_alias(StepShape_ShapeDimensionRepresentation)

%extend StepShape_ShapeDimensionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepShape_ShapeRepresentationWithParameters *
****************************************************/
class StepShape_ShapeRepresentationWithParameters : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_ShapeRepresentationWithParameters ******************/
		%feature("compactdefaultargs") StepShape_ShapeRepresentationWithParameters;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_ShapeRepresentationWithParameters;
		 StepShape_ShapeRepresentationWithParameters ();

};


%make_alias(StepShape_ShapeRepresentationWithParameters)

%extend StepShape_ShapeRepresentationWithParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepShape_SolidReplica *
*******************************/
class StepShape_SolidReplica : public StepShape_SolidModel {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aParentSolid:
	:type aParentSolid: StepShape_SolidModel
	:param aTransformation:
	:type aTransformation: StepGeom_CartesianTransformationOperator3d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_SolidModel> & aParentSolid,const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & aTransformation);

		/****************** ParentSolid ******************/
		%feature("compactdefaultargs") ParentSolid;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_SolidModel>") ParentSolid;
		opencascade::handle<StepShape_SolidModel> ParentSolid ();

		/****************** SetParentSolid ******************/
		%feature("compactdefaultargs") SetParentSolid;
		%feature("autodoc", ":param aParentSolid:
	:type aParentSolid: StepShape_SolidModel
	:rtype: None") SetParentSolid;
		void SetParentSolid (const opencascade::handle<StepShape_SolidModel> & aParentSolid);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", ":param aTransformation:
	:type aTransformation: StepGeom_CartesianTransformationOperator3d
	:rtype: None") SetTransformation;
		void SetTransformation (const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & aTransformation);

		/****************** StepShape_SolidReplica ******************/
		%feature("compactdefaultargs") StepShape_SolidReplica;
		%feature("autodoc", "* Returns a SolidReplica
	:rtype: None") StepShape_SolidReplica;
		 StepShape_SolidReplica ();

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_CartesianTransformationOperator3d>") Transformation;
		opencascade::handle<StepGeom_CartesianTransformationOperator3d> Transformation ();

};


%make_alias(StepShape_SolidReplica)

%extend StepShape_SolidReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepShape_SweptAreaSolid *
*********************************/
class StepShape_SweptAreaSolid : public StepShape_SolidModel {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aSweptArea:
	:type aSweptArea: StepGeom_CurveBoundedSurface
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_CurveBoundedSurface> & aSweptArea);

		/****************** SetSweptArea ******************/
		%feature("compactdefaultargs") SetSweptArea;
		%feature("autodoc", ":param aSweptArea:
	:type aSweptArea: StepGeom_CurveBoundedSurface
	:rtype: None") SetSweptArea;
		void SetSweptArea (const opencascade::handle<StepGeom_CurveBoundedSurface> & aSweptArea);

		/****************** StepShape_SweptAreaSolid ******************/
		%feature("compactdefaultargs") StepShape_SweptAreaSolid;
		%feature("autodoc", "* Returns a SweptAreaSolid
	:rtype: None") StepShape_SweptAreaSolid;
		 StepShape_SweptAreaSolid ();

		/****************** SweptArea ******************/
		%feature("compactdefaultargs") SweptArea;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_CurveBoundedSurface>") SweptArea;
		opencascade::handle<StepGeom_CurveBoundedSurface> SweptArea ();

};


%make_alias(StepShape_SweptAreaSolid)

%extend StepShape_SweptAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepShape_SweptFaceSolid *
*********************************/
class StepShape_SweptFaceSolid : public StepShape_SolidModel {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aSweptArea:
	:type aSweptArea: StepShape_FaceSurface
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_FaceSurface> & aSweptArea);

		/****************** SetSweptFace ******************/
		%feature("compactdefaultargs") SetSweptFace;
		%feature("autodoc", ":param aSweptArea:
	:type aSweptArea: StepShape_FaceSurface
	:rtype: void") SetSweptFace;
		virtual void SetSweptFace (const opencascade::handle<StepShape_FaceSurface> & aSweptArea);

		/****************** StepShape_SweptFaceSolid ******************/
		%feature("compactdefaultargs") StepShape_SweptFaceSolid;
		%feature("autodoc", "* Returns a SweptFaceSolid
	:rtype: None") StepShape_SweptFaceSolid;
		 StepShape_SweptFaceSolid ();

		/****************** SweptFace ******************/
		%feature("compactdefaultargs") SweptFace;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_FaceSurface>") SweptFace;
		virtual opencascade::handle<StepShape_FaceSurface> SweptFace ();

};


%make_alias(StepShape_SweptFaceSolid)

%extend StepShape_SweptFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepShape_TransitionalShapeRepresentation *
**************************************************/
class StepShape_TransitionalShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****************** StepShape_TransitionalShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_TransitionalShapeRepresentation;
		%feature("autodoc", "* Returns a TransitionalShapeRepresentation
	:rtype: None") StepShape_TransitionalShapeRepresentation;
		 StepShape_TransitionalShapeRepresentation ();

};


%make_alias(StepShape_TransitionalShapeRepresentation)

%extend StepShape_TransitionalShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepShape_Vertex *
*************************/
class StepShape_Vertex : public StepShape_TopologicalRepresentationItem {
	public:
		/****************** StepShape_Vertex ******************/
		%feature("compactdefaultargs") StepShape_Vertex;
		%feature("autodoc", "* Returns a Vertex
	:rtype: None") StepShape_Vertex;
		 StepShape_Vertex ();

};


%make_alias(StepShape_Vertex)

%extend StepShape_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepShape_BrepWithVoids *
********************************/
class StepShape_BrepWithVoids : public StepShape_ManifoldSolidBrep {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aOuter:
	:type aOuter: StepShape_ClosedShell
	:param aVoids:
	:type aVoids: StepShape_HArray1OfOrientedClosedShell
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_ClosedShell> & aOuter,const opencascade::handle<StepShape_HArray1OfOrientedClosedShell> & aVoids);

		/****************** NbVoids ******************/
		%feature("compactdefaultargs") NbVoids;
		%feature("autodoc", ":rtype: int") NbVoids;
		Standard_Integer NbVoids ();

		/****************** SetVoids ******************/
		%feature("compactdefaultargs") SetVoids;
		%feature("autodoc", ":param aVoids:
	:type aVoids: StepShape_HArray1OfOrientedClosedShell
	:rtype: None") SetVoids;
		void SetVoids (const opencascade::handle<StepShape_HArray1OfOrientedClosedShell> & aVoids);

		/****************** StepShape_BrepWithVoids ******************/
		%feature("compactdefaultargs") StepShape_BrepWithVoids;
		%feature("autodoc", "* Returns a BrepWithVoids
	:rtype: None") StepShape_BrepWithVoids;
		 StepShape_BrepWithVoids ();

		/****************** Voids ******************/
		%feature("compactdefaultargs") Voids;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfOrientedClosedShell>") Voids;
		opencascade::handle<StepShape_HArray1OfOrientedClosedShell> Voids ();

		/****************** VoidsValue ******************/
		%feature("compactdefaultargs") VoidsValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_OrientedClosedShell>") VoidsValue;
		opencascade::handle<StepShape_OrientedClosedShell> VoidsValue (const Standard_Integer num);

};


%make_alias(StepShape_BrepWithVoids)

%extend StepShape_BrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepShape_ClosedShell *
******************************/
class StepShape_ClosedShell : public StepShape_ConnectedFaceSet {
	public:
		/****************** StepShape_ClosedShell ******************/
		%feature("compactdefaultargs") StepShape_ClosedShell;
		%feature("autodoc", "* Returns a ClosedShell
	:rtype: None") StepShape_ClosedShell;
		 StepShape_ClosedShell ();

};


%make_alias(StepShape_ClosedShell)

%extend StepShape_ClosedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepShape_ConnectedFaceSubSet *
**************************************/
class StepShape_ConnectedFaceSubSet : public StepShape_ConnectedFaceSet {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aConnectedFaceSet_CfsFaces:
	:type aConnectedFaceSet_CfsFaces: StepShape_HArray1OfFace
	:param aParentFaceSet:
	:type aParentFaceSet: StepShape_ConnectedFaceSet
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepShape_HArray1OfFace> & aConnectedFaceSet_CfsFaces,const opencascade::handle<StepShape_ConnectedFaceSet> & aParentFaceSet);

		/****************** ParentFaceSet ******************/
		%feature("compactdefaultargs") ParentFaceSet;
		%feature("autodoc", "* Returns field ParentFaceSet
	:rtype: opencascade::handle<StepShape_ConnectedFaceSet>") ParentFaceSet;
		opencascade::handle<StepShape_ConnectedFaceSet> ParentFaceSet ();

		/****************** SetParentFaceSet ******************/
		%feature("compactdefaultargs") SetParentFaceSet;
		%feature("autodoc", "* Set field ParentFaceSet
	:param ParentFaceSet:
	:type ParentFaceSet: StepShape_ConnectedFaceSet
	:rtype: None") SetParentFaceSet;
		void SetParentFaceSet (const opencascade::handle<StepShape_ConnectedFaceSet> & ParentFaceSet);

		/****************** StepShape_ConnectedFaceSubSet ******************/
		%feature("compactdefaultargs") StepShape_ConnectedFaceSubSet;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_ConnectedFaceSubSet;
		 StepShape_ConnectedFaceSubSet ();

};


%make_alias(StepShape_ConnectedFaceSubSet)

%extend StepShape_ConnectedFaceSubSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepShape_EdgeCurve *
****************************/
class StepShape_EdgeCurve : public StepShape_Edge {
	public:
		/****************** EdgeGeometry ******************/
		%feature("compactdefaultargs") EdgeGeometry;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Curve>") EdgeGeometry;
		opencascade::handle<StepGeom_Curve> EdgeGeometry ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aEdgeStart:
	:type aEdgeStart: StepShape_Vertex
	:param aEdgeEnd:
	:type aEdgeEnd: StepShape_Vertex
	:param aEdgeGeometry:
	:type aEdgeGeometry: StepGeom_Curve
	:param aSameSense:
	:type aSameSense: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_Vertex> & aEdgeStart,const opencascade::handle<StepShape_Vertex> & aEdgeEnd,const opencascade::handle<StepGeom_Curve> & aEdgeGeometry,const Standard_Boolean aSameSense);

		/****************** SameSense ******************/
		%feature("compactdefaultargs") SameSense;
		%feature("autodoc", ":rtype: bool") SameSense;
		Standard_Boolean SameSense ();

		/****************** SetEdgeGeometry ******************/
		%feature("compactdefaultargs") SetEdgeGeometry;
		%feature("autodoc", ":param aEdgeGeometry:
	:type aEdgeGeometry: StepGeom_Curve
	:rtype: None") SetEdgeGeometry;
		void SetEdgeGeometry (const opencascade::handle<StepGeom_Curve> & aEdgeGeometry);

		/****************** SetSameSense ******************/
		%feature("compactdefaultargs") SetSameSense;
		%feature("autodoc", ":param aSameSense:
	:type aSameSense: bool
	:rtype: None") SetSameSense;
		void SetSameSense (const Standard_Boolean aSameSense);

		/****************** StepShape_EdgeCurve ******************/
		%feature("compactdefaultargs") StepShape_EdgeCurve;
		%feature("autodoc", "* Returns a EdgeCurve
	:rtype: None") StepShape_EdgeCurve;
		 StepShape_EdgeCurve ();

};


%make_alias(StepShape_EdgeCurve)

%extend StepShape_EdgeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepShape_EdgeLoop *
***************************/
class StepShape_EdgeLoop : public StepShape_Loop {
	public:
		/****************** EdgeList ******************/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfOrientedEdge>") EdgeList;
		opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList ();

		/****************** EdgeListValue ******************/
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_OrientedEdge>") EdgeListValue;
		opencascade::handle<StepShape_OrientedEdge> EdgeListValue (const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aEdgeList:
	:type aEdgeList: StepShape_HArray1OfOrientedEdge
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** NbEdgeList ******************/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", ":rtype: int") NbEdgeList;
		Standard_Integer NbEdgeList ();

		/****************** SetEdgeList ******************/
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", ":param aEdgeList:
	:type aEdgeList: StepShape_HArray1OfOrientedEdge
	:rtype: None") SetEdgeList;
		void SetEdgeList (const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** StepShape_EdgeLoop ******************/
		%feature("compactdefaultargs") StepShape_EdgeLoop;
		%feature("autodoc", "* Returns a EdgeLoop
	:rtype: None") StepShape_EdgeLoop;
		 StepShape_EdgeLoop ();

};


%make_alias(StepShape_EdgeLoop)

%extend StepShape_EdgeLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepShape_ExtrudedAreaSolid *
************************************/
class StepShape_ExtrudedAreaSolid : public StepShape_SweptAreaSolid {
	public:
		/****************** Depth ******************/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", ":rtype: float") Depth;
		Standard_Real Depth ();

		/****************** ExtrudedDirection ******************/
		%feature("compactdefaultargs") ExtrudedDirection;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Direction>") ExtrudedDirection;
		opencascade::handle<StepGeom_Direction> ExtrudedDirection ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aSweptArea:
	:type aSweptArea: StepGeom_CurveBoundedSurface
	:param aExtrudedDirection:
	:type aExtrudedDirection: StepGeom_Direction
	:param aDepth:
	:type aDepth: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_CurveBoundedSurface> & aSweptArea,const opencascade::handle<StepGeom_Direction> & aExtrudedDirection,const Standard_Real aDepth);

		/****************** SetDepth ******************/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", ":param aDepth:
	:type aDepth: float
	:rtype: None") SetDepth;
		void SetDepth (const Standard_Real aDepth);

		/****************** SetExtrudedDirection ******************/
		%feature("compactdefaultargs") SetExtrudedDirection;
		%feature("autodoc", ":param aExtrudedDirection:
	:type aExtrudedDirection: StepGeom_Direction
	:rtype: None") SetExtrudedDirection;
		void SetExtrudedDirection (const opencascade::handle<StepGeom_Direction> & aExtrudedDirection);

		/****************** StepShape_ExtrudedAreaSolid ******************/
		%feature("compactdefaultargs") StepShape_ExtrudedAreaSolid;
		%feature("autodoc", "* Returns a ExtrudedAreaSolid
	:rtype: None") StepShape_ExtrudedAreaSolid;
		 StepShape_ExtrudedAreaSolid ();

};


%make_alias(StepShape_ExtrudedAreaSolid)

%extend StepShape_ExtrudedAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepShape_ExtrudedFaceSolid *
************************************/
class StepShape_ExtrudedFaceSolid : public StepShape_SweptFaceSolid {
	public:
		/****************** Depth ******************/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", ":rtype: float") Depth;
		Standard_Real Depth ();

		/****************** ExtrudedDirection ******************/
		%feature("compactdefaultargs") ExtrudedDirection;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Direction>") ExtrudedDirection;
		opencascade::handle<StepGeom_Direction> ExtrudedDirection ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aSweptArea:
	:type aSweptArea: StepShape_FaceSurface
	:param aExtrudedDirection:
	:type aExtrudedDirection: StepGeom_Direction
	:param aDepth:
	:type aDepth: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_FaceSurface> & aSweptArea,const opencascade::handle<StepGeom_Direction> & aExtrudedDirection,const Standard_Real aDepth);

		/****************** SetDepth ******************/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", ":param aDepth:
	:type aDepth: float
	:rtype: None") SetDepth;
		void SetDepth (const Standard_Real aDepth);

		/****************** SetExtrudedDirection ******************/
		%feature("compactdefaultargs") SetExtrudedDirection;
		%feature("autodoc", ":param aExtrudedDirection:
	:type aExtrudedDirection: StepGeom_Direction
	:rtype: None") SetExtrudedDirection;
		void SetExtrudedDirection (const opencascade::handle<StepGeom_Direction> & aExtrudedDirection);

		/****************** StepShape_ExtrudedFaceSolid ******************/
		%feature("compactdefaultargs") StepShape_ExtrudedFaceSolid;
		%feature("autodoc", "* Returns a ExtrudedFaceSolid
	:rtype: None") StepShape_ExtrudedFaceSolid;
		 StepShape_ExtrudedFaceSolid ();

};


%make_alias(StepShape_ExtrudedFaceSolid)

%extend StepShape_ExtrudedFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepShape_FaceOuterBound *
*********************************/
class StepShape_FaceOuterBound : public StepShape_FaceBound {
	public:
		/****************** StepShape_FaceOuterBound ******************/
		%feature("compactdefaultargs") StepShape_FaceOuterBound;
		%feature("autodoc", "* Returns a FaceOuterBound
	:rtype: None") StepShape_FaceOuterBound;
		 StepShape_FaceOuterBound ();

};


%make_alias(StepShape_FaceOuterBound)

%extend StepShape_FaceOuterBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepShape_FaceSurface *
******************************/
class StepShape_FaceSurface : public StepShape_Face {
	public:
		/****************** FaceGeometry ******************/
		%feature("compactdefaultargs") FaceGeometry;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Surface>") FaceGeometry;
		opencascade::handle<StepGeom_Surface> FaceGeometry ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aBounds:
	:type aBounds: StepShape_HArray1OfFaceBound
	:param aFaceGeometry:
	:type aFaceGeometry: StepGeom_Surface
	:param aSameSense:
	:type aSameSense: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_HArray1OfFaceBound> & aBounds,const opencascade::handle<StepGeom_Surface> & aFaceGeometry,const Standard_Boolean aSameSense);

		/****************** SameSense ******************/
		%feature("compactdefaultargs") SameSense;
		%feature("autodoc", ":rtype: bool") SameSense;
		Standard_Boolean SameSense ();

		/****************** SetFaceGeometry ******************/
		%feature("compactdefaultargs") SetFaceGeometry;
		%feature("autodoc", ":param aFaceGeometry:
	:type aFaceGeometry: StepGeom_Surface
	:rtype: None") SetFaceGeometry;
		void SetFaceGeometry (const opencascade::handle<StepGeom_Surface> & aFaceGeometry);

		/****************** SetSameSense ******************/
		%feature("compactdefaultargs") SetSameSense;
		%feature("autodoc", ":param aSameSense:
	:type aSameSense: bool
	:rtype: None") SetSameSense;
		void SetSameSense (const Standard_Boolean aSameSense);

		/****************** StepShape_FaceSurface ******************/
		%feature("compactdefaultargs") StepShape_FaceSurface;
		%feature("autodoc", "* Returns a FaceSurface
	:rtype: None") StepShape_FaceSurface;
		 StepShape_FaceSurface ();

};


%make_alias(StepShape_FaceSurface)

%extend StepShape_FaceSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepShape_FacetedBrep *
******************************/
class StepShape_FacetedBrep : public StepShape_ManifoldSolidBrep {
	public:
		/****************** StepShape_FacetedBrep ******************/
		%feature("compactdefaultargs") StepShape_FacetedBrep;
		%feature("autodoc", "* Returns a FacetedBrep
	:rtype: None") StepShape_FacetedBrep;
		 StepShape_FacetedBrep ();

};


%make_alias(StepShape_FacetedBrep)

%extend StepShape_FacetedBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepShape_FacetedBrepAndBrepWithVoids *
**********************************************/
class StepShape_FacetedBrepAndBrepWithVoids : public StepShape_ManifoldSolidBrep {
	public:
		/****************** BrepWithVoids ******************/
		%feature("compactdefaultargs") BrepWithVoids;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_BrepWithVoids>") BrepWithVoids;
		opencascade::handle<StepShape_BrepWithVoids> BrepWithVoids ();

		/****************** FacetedBrep ******************/
		%feature("compactdefaultargs") FacetedBrep;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_FacetedBrep>") FacetedBrep;
		opencascade::handle<StepShape_FacetedBrep> FacetedBrep ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aOuter:
	:type aOuter: StepShape_ClosedShell
	:param aFacetedBrep:
	:type aFacetedBrep: StepShape_FacetedBrep
	:param aBrepWithVoids:
	:type aBrepWithVoids: StepShape_BrepWithVoids
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_ClosedShell> & aOuter,const opencascade::handle<StepShape_FacetedBrep> & aFacetedBrep,const opencascade::handle<StepShape_BrepWithVoids> & aBrepWithVoids);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aOuter:
	:type aOuter: StepShape_ClosedShell
	:param aVoids:
	:type aVoids: StepShape_HArray1OfOrientedClosedShell
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_ClosedShell> & aOuter,const opencascade::handle<StepShape_HArray1OfOrientedClosedShell> & aVoids);

		/****************** NbVoids ******************/
		%feature("compactdefaultargs") NbVoids;
		%feature("autodoc", ":rtype: int") NbVoids;
		Standard_Integer NbVoids ();

		/****************** SetBrepWithVoids ******************/
		%feature("compactdefaultargs") SetBrepWithVoids;
		%feature("autodoc", ":param aBrepWithVoids:
	:type aBrepWithVoids: StepShape_BrepWithVoids
	:rtype: None") SetBrepWithVoids;
		void SetBrepWithVoids (const opencascade::handle<StepShape_BrepWithVoids> & aBrepWithVoids);

		/****************** SetFacetedBrep ******************/
		%feature("compactdefaultargs") SetFacetedBrep;
		%feature("autodoc", ":param aFacetedBrep:
	:type aFacetedBrep: StepShape_FacetedBrep
	:rtype: None") SetFacetedBrep;
		void SetFacetedBrep (const opencascade::handle<StepShape_FacetedBrep> & aFacetedBrep);

		/****************** SetVoids ******************/
		%feature("compactdefaultargs") SetVoids;
		%feature("autodoc", ":param aVoids:
	:type aVoids: StepShape_HArray1OfOrientedClosedShell
	:rtype: None") SetVoids;
		void SetVoids (const opencascade::handle<StepShape_HArray1OfOrientedClosedShell> & aVoids);

		/****************** StepShape_FacetedBrepAndBrepWithVoids ******************/
		%feature("compactdefaultargs") StepShape_FacetedBrepAndBrepWithVoids;
		%feature("autodoc", "* Returns a FacetedBrepAndBrepWithVoids
	:rtype: None") StepShape_FacetedBrepAndBrepWithVoids;
		 StepShape_FacetedBrepAndBrepWithVoids ();

		/****************** Voids ******************/
		%feature("compactdefaultargs") Voids;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfOrientedClosedShell>") Voids;
		opencascade::handle<StepShape_HArray1OfOrientedClosedShell> Voids ();

		/****************** VoidsValue ******************/
		%feature("compactdefaultargs") VoidsValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_OrientedClosedShell>") VoidsValue;
		opencascade::handle<StepShape_OrientedClosedShell> VoidsValue (const Standard_Integer num);

};


%make_alias(StepShape_FacetedBrepAndBrepWithVoids)

%extend StepShape_FacetedBrepAndBrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepShape_OpenShell *
****************************/
class StepShape_OpenShell : public StepShape_ConnectedFaceSet {
	public:
		/****************** StepShape_OpenShell ******************/
		%feature("compactdefaultargs") StepShape_OpenShell;
		%feature("autodoc", "* Returns a OpenShell
	:rtype: None") StepShape_OpenShell;
		 StepShape_OpenShell ();

};


%make_alias(StepShape_OpenShell)

%extend StepShape_OpenShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepShape_OrientedEdge *
*******************************/
class StepShape_OrientedEdge : public StepShape_Edge {
	public:
		/****************** EdgeElement ******************/
		%feature("compactdefaultargs") EdgeElement;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_Edge>") EdgeElement;
		opencascade::handle<StepShape_Edge> EdgeElement ();

		/****************** EdgeEnd ******************/
		%feature("compactdefaultargs") EdgeEnd;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_Vertex>") EdgeEnd;
		virtual opencascade::handle<StepShape_Vertex> EdgeEnd ();

		/****************** EdgeStart ******************/
		%feature("compactdefaultargs") EdgeStart;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_Vertex>") EdgeStart;
		virtual opencascade::handle<StepShape_Vertex> EdgeStart ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aEdgeElement:
	:type aEdgeElement: StepShape_Edge
	:param aOrientation:
	:type aOrientation: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_Edge> & aEdgeElement,const Standard_Boolean aOrientation);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: bool") Orientation;
		Standard_Boolean Orientation ();

		/****************** SetEdgeElement ******************/
		%feature("compactdefaultargs") SetEdgeElement;
		%feature("autodoc", ":param aEdgeElement:
	:type aEdgeElement: StepShape_Edge
	:rtype: None") SetEdgeElement;
		void SetEdgeElement (const opencascade::handle<StepShape_Edge> & aEdgeElement);

		/****************** SetEdgeEnd ******************/
		%feature("compactdefaultargs") SetEdgeEnd;
		%feature("autodoc", ":param aEdgeEnd:
	:type aEdgeEnd: StepShape_Vertex
	:rtype: void") SetEdgeEnd;
		virtual void SetEdgeEnd (const opencascade::handle<StepShape_Vertex> & aEdgeEnd);

		/****************** SetEdgeStart ******************/
		%feature("compactdefaultargs") SetEdgeStart;
		%feature("autodoc", ":param aEdgeStart:
	:type aEdgeStart: StepShape_Vertex
	:rtype: void") SetEdgeStart;
		virtual void SetEdgeStart (const opencascade::handle<StepShape_Vertex> & aEdgeStart);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", ":param aOrientation:
	:type aOrientation: bool
	:rtype: None") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);

		/****************** StepShape_OrientedEdge ******************/
		%feature("compactdefaultargs") StepShape_OrientedEdge;
		%feature("autodoc", "* Returns a OrientedEdge
	:rtype: None") StepShape_OrientedEdge;
		 StepShape_OrientedEdge ();

};


%make_alias(StepShape_OrientedEdge)

%extend StepShape_OrientedEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepShape_OrientedFace *
*******************************/
class StepShape_OrientedFace : public StepShape_Face {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfFaceBound>") Bounds;
		virtual opencascade::handle<StepShape_HArray1OfFaceBound> Bounds ();

		/****************** BoundsValue ******************/
		%feature("compactdefaultargs") BoundsValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_FaceBound>") BoundsValue;
		virtual opencascade::handle<StepShape_FaceBound> BoundsValue (const Standard_Integer num);

		/****************** FaceElement ******************/
		%feature("compactdefaultargs") FaceElement;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_Face>") FaceElement;
		opencascade::handle<StepShape_Face> FaceElement ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aFaceElement:
	:type aFaceElement: StepShape_Face
	:param aOrientation:
	:type aOrientation: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_Face> & aFaceElement,const Standard_Boolean aOrientation);

		/****************** NbBounds ******************/
		%feature("compactdefaultargs") NbBounds;
		%feature("autodoc", ":rtype: int") NbBounds;
		virtual Standard_Integer NbBounds ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: bool") Orientation;
		Standard_Boolean Orientation ();

		/****************** SetBounds ******************/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", ":param aBounds:
	:type aBounds: StepShape_HArray1OfFaceBound
	:rtype: void") SetBounds;
		virtual void SetBounds (const opencascade::handle<StepShape_HArray1OfFaceBound> & aBounds);

		/****************** SetFaceElement ******************/
		%feature("compactdefaultargs") SetFaceElement;
		%feature("autodoc", ":param aFaceElement:
	:type aFaceElement: StepShape_Face
	:rtype: None") SetFaceElement;
		void SetFaceElement (const opencascade::handle<StepShape_Face> & aFaceElement);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", ":param aOrientation:
	:type aOrientation: bool
	:rtype: None") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);

		/****************** StepShape_OrientedFace ******************/
		%feature("compactdefaultargs") StepShape_OrientedFace;
		%feature("autodoc", "* Returns a OrientedFace
	:rtype: None") StepShape_OrientedFace;
		 StepShape_OrientedFace ();

};


%make_alias(StepShape_OrientedFace)

%extend StepShape_OrientedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepShape_OrientedPath *
*******************************/
class StepShape_OrientedPath : public StepShape_Path {
	public:
		/****************** EdgeList ******************/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfOrientedEdge>") EdgeList;
		virtual opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList ();

		/****************** EdgeListValue ******************/
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_OrientedEdge>") EdgeListValue;
		virtual opencascade::handle<StepShape_OrientedEdge> EdgeListValue (const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aPathElement:
	:type aPathElement: StepShape_EdgeLoop
	:param aOrientation:
	:type aOrientation: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_EdgeLoop> & aPathElement,const Standard_Boolean aOrientation);

		/****************** NbEdgeList ******************/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", ":rtype: int") NbEdgeList;
		virtual Standard_Integer NbEdgeList ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: bool") Orientation;
		Standard_Boolean Orientation ();

		/****************** PathElement ******************/
		%feature("compactdefaultargs") PathElement;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_EdgeLoop>") PathElement;
		opencascade::handle<StepShape_EdgeLoop> PathElement ();

		/****************** SetEdgeList ******************/
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", ":param aEdgeList:
	:type aEdgeList: StepShape_HArray1OfOrientedEdge
	:rtype: void") SetEdgeList;
		virtual void SetEdgeList (const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", ":param aOrientation:
	:type aOrientation: bool
	:rtype: None") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);

		/****************** SetPathElement ******************/
		%feature("compactdefaultargs") SetPathElement;
		%feature("autodoc", ":param aPathElement:
	:type aPathElement: StepShape_EdgeLoop
	:rtype: None") SetPathElement;
		void SetPathElement (const opencascade::handle<StepShape_EdgeLoop> & aPathElement);

		/****************** StepShape_OrientedPath ******************/
		%feature("compactdefaultargs") StepShape_OrientedPath;
		%feature("autodoc", "* Returns a OrientedPath
	:rtype: None") StepShape_OrientedPath;
		 StepShape_OrientedPath ();

};


%make_alias(StepShape_OrientedPath)

%extend StepShape_OrientedPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepShape_PolyLoop *
***************************/
class StepShape_PolyLoop : public StepShape_Loop {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aPolygon:
	:type aPolygon: StepGeom_HArray1OfCartesianPoint
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_HArray1OfCartesianPoint> & aPolygon);

		/****************** NbPolygon ******************/
		%feature("compactdefaultargs") NbPolygon;
		%feature("autodoc", ":rtype: int") NbPolygon;
		Standard_Integer NbPolygon ();

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_HArray1OfCartesianPoint>") Polygon;
		opencascade::handle<StepGeom_HArray1OfCartesianPoint> Polygon ();

		/****************** PolygonValue ******************/
		%feature("compactdefaultargs") PolygonValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepGeom_CartesianPoint>") PolygonValue;
		opencascade::handle<StepGeom_CartesianPoint> PolygonValue (const Standard_Integer num);

		/****************** SetPolygon ******************/
		%feature("compactdefaultargs") SetPolygon;
		%feature("autodoc", ":param aPolygon:
	:type aPolygon: StepGeom_HArray1OfCartesianPoint
	:rtype: None") SetPolygon;
		void SetPolygon (const opencascade::handle<StepGeom_HArray1OfCartesianPoint> & aPolygon);

		/****************** StepShape_PolyLoop ******************/
		%feature("compactdefaultargs") StepShape_PolyLoop;
		%feature("autodoc", "* Returns a PolyLoop
	:rtype: None") StepShape_PolyLoop;
		 StepShape_PolyLoop ();

};


%make_alias(StepShape_PolyLoop)

%extend StepShape_PolyLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepShape_RevolvedAreaSolid *
************************************/
class StepShape_RevolvedAreaSolid : public StepShape_SweptAreaSolid {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", ":rtype: float") Angle;
		Standard_Real Angle ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Axis1Placement>") Axis;
		opencascade::handle<StepGeom_Axis1Placement> Axis ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aSweptArea:
	:type aSweptArea: StepGeom_CurveBoundedSurface
	:param aAxis:
	:type aAxis: StepGeom_Axis1Placement
	:param aAngle:
	:type aAngle: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_CurveBoundedSurface> & aSweptArea,const opencascade::handle<StepGeom_Axis1Placement> & aAxis,const Standard_Real aAngle);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", ":param aAngle:
	:type aAngle: float
	:rtype: None") SetAngle;
		void SetAngle (const Standard_Real aAngle);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", ":param aAxis:
	:type aAxis: StepGeom_Axis1Placement
	:rtype: None") SetAxis;
		void SetAxis (const opencascade::handle<StepGeom_Axis1Placement> & aAxis);

		/****************** StepShape_RevolvedAreaSolid ******************/
		%feature("compactdefaultargs") StepShape_RevolvedAreaSolid;
		%feature("autodoc", "* Returns a RevolvedAreaSolid
	:rtype: None") StepShape_RevolvedAreaSolid;
		 StepShape_RevolvedAreaSolid ();

};


%make_alias(StepShape_RevolvedAreaSolid)

%extend StepShape_RevolvedAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepShape_RevolvedFaceSolid *
************************************/
class StepShape_RevolvedFaceSolid : public StepShape_SweptFaceSolid {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", ":rtype: float") Angle;
		Standard_Real Angle ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Axis1Placement>") Axis;
		opencascade::handle<StepGeom_Axis1Placement> Axis ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aSweptArea:
	:type aSweptArea: StepShape_FaceSurface
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_FaceSurface> & aSweptArea);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aSweptArea:
	:type aSweptArea: StepShape_FaceSurface
	:param aAxis:
	:type aAxis: StepGeom_Axis1Placement
	:param aAngle:
	:type aAngle: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_FaceSurface> & aSweptArea,const opencascade::handle<StepGeom_Axis1Placement> & aAxis,const Standard_Real aAngle);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", ":param aAngle:
	:type aAngle: float
	:rtype: None") SetAngle;
		void SetAngle (const Standard_Real aAngle);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", ":param aAxis:
	:type aAxis: StepGeom_Axis1Placement
	:rtype: None") SetAxis;
		void SetAxis (const opencascade::handle<StepGeom_Axis1Placement> & aAxis);

		/****************** StepShape_RevolvedFaceSolid ******************/
		%feature("compactdefaultargs") StepShape_RevolvedFaceSolid;
		%feature("autodoc", "* Returns a RevolvedFaceSolid
	:rtype: None") StepShape_RevolvedFaceSolid;
		 StepShape_RevolvedFaceSolid ();

};


%make_alias(StepShape_RevolvedFaceSolid)

%extend StepShape_RevolvedFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepShape_Subedge *
**************************/
class StepShape_Subedge : public StepShape_Edge {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aEdge_EdgeStart:
	:type aEdge_EdgeStart: StepShape_Vertex
	:param aEdge_EdgeEnd:
	:type aEdge_EdgeEnd: StepShape_Vertex
	:param aParentEdge:
	:type aParentEdge: StepShape_Edge
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepShape_Vertex> & aEdge_EdgeStart,const opencascade::handle<StepShape_Vertex> & aEdge_EdgeEnd,const opencascade::handle<StepShape_Edge> & aParentEdge);

		/****************** ParentEdge ******************/
		%feature("compactdefaultargs") ParentEdge;
		%feature("autodoc", "* Returns field ParentEdge
	:rtype: opencascade::handle<StepShape_Edge>") ParentEdge;
		opencascade::handle<StepShape_Edge> ParentEdge ();

		/****************** SetParentEdge ******************/
		%feature("compactdefaultargs") SetParentEdge;
		%feature("autodoc", "* Set field ParentEdge
	:param ParentEdge:
	:type ParentEdge: StepShape_Edge
	:rtype: None") SetParentEdge;
		void SetParentEdge (const opencascade::handle<StepShape_Edge> & ParentEdge);

		/****************** StepShape_Subedge ******************/
		%feature("compactdefaultargs") StepShape_Subedge;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_Subedge;
		 StepShape_Subedge ();

};


%make_alias(StepShape_Subedge)

%extend StepShape_Subedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepShape_Subface *
**************************/
class StepShape_Subface : public StepShape_Face {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFace_Bounds:
	:type aFace_Bounds: StepShape_HArray1OfFaceBound
	:param aParentFace:
	:type aParentFace: StepShape_Face
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepShape_HArray1OfFaceBound> & aFace_Bounds,const opencascade::handle<StepShape_Face> & aParentFace);

		/****************** ParentFace ******************/
		%feature("compactdefaultargs") ParentFace;
		%feature("autodoc", "* Returns field ParentFace
	:rtype: opencascade::handle<StepShape_Face>") ParentFace;
		opencascade::handle<StepShape_Face> ParentFace ();

		/****************** SetParentFace ******************/
		%feature("compactdefaultargs") SetParentFace;
		%feature("autodoc", "* Set field ParentFace
	:param ParentFace:
	:type ParentFace: StepShape_Face
	:rtype: None") SetParentFace;
		void SetParentFace (const opencascade::handle<StepShape_Face> & ParentFace);

		/****************** StepShape_Subface ******************/
		%feature("compactdefaultargs") StepShape_Subface;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_Subface;
		 StepShape_Subface ();

};


%make_alias(StepShape_Subface)

%extend StepShape_Subface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepShape_VertexLoop *
*****************************/
class StepShape_VertexLoop : public StepShape_Loop {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aLoopVertex:
	:type aLoopVertex: StepShape_Vertex
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_Vertex> & aLoopVertex);

		/****************** LoopVertex ******************/
		%feature("compactdefaultargs") LoopVertex;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_Vertex>") LoopVertex;
		opencascade::handle<StepShape_Vertex> LoopVertex ();

		/****************** SetLoopVertex ******************/
		%feature("compactdefaultargs") SetLoopVertex;
		%feature("autodoc", ":param aLoopVertex:
	:type aLoopVertex: StepShape_Vertex
	:rtype: None") SetLoopVertex;
		void SetLoopVertex (const opencascade::handle<StepShape_Vertex> & aLoopVertex);

		/****************** StepShape_VertexLoop ******************/
		%feature("compactdefaultargs") StepShape_VertexLoop;
		%feature("autodoc", "* Returns a VertexLoop
	:rtype: None") StepShape_VertexLoop;
		 StepShape_VertexLoop ();

};


%make_alias(StepShape_VertexLoop)

%extend StepShape_VertexLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepShape_VertexPoint *
******************************/
class StepShape_VertexPoint : public StepShape_Vertex {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aVertexGeometry:
	:type aVertexGeometry: StepGeom_Point
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepGeom_Point> & aVertexGeometry);

		/****************** SetVertexGeometry ******************/
		%feature("compactdefaultargs") SetVertexGeometry;
		%feature("autodoc", ":param aVertexGeometry:
	:type aVertexGeometry: StepGeom_Point
	:rtype: None") SetVertexGeometry;
		void SetVertexGeometry (const opencascade::handle<StepGeom_Point> & aVertexGeometry);

		/****************** StepShape_VertexPoint ******************/
		%feature("compactdefaultargs") StepShape_VertexPoint;
		%feature("autodoc", "* Returns a VertexPoint
	:rtype: None") StepShape_VertexPoint;
		 StepShape_VertexPoint ();

		/****************** VertexGeometry ******************/
		%feature("compactdefaultargs") VertexGeometry;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Point>") VertexGeometry;
		opencascade::handle<StepGeom_Point> VertexGeometry ();

};


%make_alias(StepShape_VertexPoint)

%extend StepShape_VertexPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepShape_AdvancedFace *
*******************************/
class StepShape_AdvancedFace : public StepShape_FaceSurface {
	public:
		/****************** StepShape_AdvancedFace ******************/
		%feature("compactdefaultargs") StepShape_AdvancedFace;
		%feature("autodoc", "* Returns a AdvancedFace
	:rtype: None") StepShape_AdvancedFace;
		 StepShape_AdvancedFace ();

};


%make_alias(StepShape_AdvancedFace)

%extend StepShape_AdvancedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepShape_OrientedClosedShell *
**************************************/
class StepShape_OrientedClosedShell : public StepShape_ClosedShell {
	public:
		/****************** CfsFaces ******************/
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfFace>") CfsFaces;
		virtual opencascade::handle<StepShape_HArray1OfFace> CfsFaces ();

		/****************** CfsFacesValue ******************/
		%feature("compactdefaultargs") CfsFacesValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_Face>") CfsFacesValue;
		virtual opencascade::handle<StepShape_Face> CfsFacesValue (const Standard_Integer num);

		/****************** ClosedShellElement ******************/
		%feature("compactdefaultargs") ClosedShellElement;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_ClosedShell>") ClosedShellElement;
		opencascade::handle<StepShape_ClosedShell> ClosedShellElement ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aClosedShellElement:
	:type aClosedShellElement: StepShape_ClosedShell
	:param aOrientation:
	:type aOrientation: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_ClosedShell> & aClosedShellElement,const Standard_Boolean aOrientation);

		/****************** NbCfsFaces ******************/
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", ":rtype: int") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: bool") Orientation;
		Standard_Boolean Orientation ();

		/****************** SetCfsFaces ******************/
		%feature("compactdefaultargs") SetCfsFaces;
		%feature("autodoc", ":param aCfsFaces:
	:type aCfsFaces: StepShape_HArray1OfFace
	:rtype: void") SetCfsFaces;
		virtual void SetCfsFaces (const opencascade::handle<StepShape_HArray1OfFace> & aCfsFaces);

		/****************** SetClosedShellElement ******************/
		%feature("compactdefaultargs") SetClosedShellElement;
		%feature("autodoc", ":param aClosedShellElement:
	:type aClosedShellElement: StepShape_ClosedShell
	:rtype: None") SetClosedShellElement;
		void SetClosedShellElement (const opencascade::handle<StepShape_ClosedShell> & aClosedShellElement);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", ":param aOrientation:
	:type aOrientation: bool
	:rtype: None") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);

		/****************** StepShape_OrientedClosedShell ******************/
		%feature("compactdefaultargs") StepShape_OrientedClosedShell;
		%feature("autodoc", "* Returns a OrientedClosedShell
	:rtype: None") StepShape_OrientedClosedShell;
		 StepShape_OrientedClosedShell ();

};


%make_alias(StepShape_OrientedClosedShell)

%extend StepShape_OrientedClosedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepShape_OrientedOpenShell *
************************************/
class StepShape_OrientedOpenShell : public StepShape_OpenShell {
	public:
		/****************** CfsFaces ******************/
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_HArray1OfFace>") CfsFaces;
		virtual opencascade::handle<StepShape_HArray1OfFace> CfsFaces ();

		/****************** CfsFacesValue ******************/
		%feature("compactdefaultargs") CfsFacesValue;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<StepShape_Face>") CfsFacesValue;
		virtual opencascade::handle<StepShape_Face> CfsFacesValue (const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aOpenShellElement:
	:type aOpenShellElement: StepShape_OpenShell
	:param aOrientation:
	:type aOrientation: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepShape_OpenShell> & aOpenShellElement,const Standard_Boolean aOrientation);

		/****************** NbCfsFaces ******************/
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", ":rtype: int") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces ();

		/****************** OpenShellElement ******************/
		%feature("compactdefaultargs") OpenShellElement;
		%feature("autodoc", ":rtype: opencascade::handle<StepShape_OpenShell>") OpenShellElement;
		opencascade::handle<StepShape_OpenShell> OpenShellElement ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: bool") Orientation;
		Standard_Boolean Orientation ();

		/****************** SetCfsFaces ******************/
		%feature("compactdefaultargs") SetCfsFaces;
		%feature("autodoc", ":param aCfsFaces:
	:type aCfsFaces: StepShape_HArray1OfFace
	:rtype: void") SetCfsFaces;
		virtual void SetCfsFaces (const opencascade::handle<StepShape_HArray1OfFace> & aCfsFaces);

		/****************** SetOpenShellElement ******************/
		%feature("compactdefaultargs") SetOpenShellElement;
		%feature("autodoc", ":param aOpenShellElement:
	:type aOpenShellElement: StepShape_OpenShell
	:rtype: None") SetOpenShellElement;
		void SetOpenShellElement (const opencascade::handle<StepShape_OpenShell> & aOpenShellElement);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", ":param aOrientation:
	:type aOrientation: bool
	:rtype: None") SetOrientation;
		void SetOrientation (const Standard_Boolean aOrientation);

		/****************** StepShape_OrientedOpenShell ******************/
		%feature("compactdefaultargs") StepShape_OrientedOpenShell;
		%feature("autodoc", "* Returns a OrientedOpenShell
	:rtype: None") StepShape_OrientedOpenShell;
		 StepShape_OrientedOpenShell ();

};


%make_alias(StepShape_OrientedOpenShell)

%extend StepShape_OrientedOpenShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepShape_SeamEdge *
***************************/
class StepShape_SeamEdge : public StepShape_OrientedEdge {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aOrientedEdge_EdgeElement:
	:type aOrientedEdge_EdgeElement: StepShape_Edge
	:param aOrientedEdge_Orientation:
	:type aOrientedEdge_Orientation: bool
	:param aPcurveReference:
	:type aPcurveReference: StepGeom_Pcurve
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepShape_Edge> & aOrientedEdge_EdgeElement,const Standard_Boolean aOrientedEdge_Orientation,const opencascade::handle<StepGeom_Pcurve> & aPcurveReference);

		/****************** PcurveReference ******************/
		%feature("compactdefaultargs") PcurveReference;
		%feature("autodoc", "* Returns field PcurveReference
	:rtype: opencascade::handle<StepGeom_Pcurve>") PcurveReference;
		opencascade::handle<StepGeom_Pcurve> PcurveReference ();

		/****************** SetPcurveReference ******************/
		%feature("compactdefaultargs") SetPcurveReference;
		%feature("autodoc", "* Set field PcurveReference
	:param PcurveReference:
	:type PcurveReference: StepGeom_Pcurve
	:rtype: None") SetPcurveReference;
		void SetPcurveReference (const opencascade::handle<StepGeom_Pcurve> & PcurveReference);

		/****************** StepShape_SeamEdge ******************/
		%feature("compactdefaultargs") StepShape_SeamEdge;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepShape_SeamEdge;
		 StepShape_SeamEdge ();

};


%make_alias(StepShape_SeamEdge)

%extend StepShape_SeamEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class StepShape_HArray1OfConnectedEdgeSet : public  StepShape_Array1OfConnectedEdgeSet, public Standard_Transient {
  public:
    StepShape_HArray1OfConnectedEdgeSet(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfConnectedEdgeSet(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfConnectedEdgeSet::value_type& theValue);
    StepShape_HArray1OfConnectedEdgeSet(const  StepShape_Array1OfConnectedEdgeSet& theOther);
    const  StepShape_Array1OfConnectedEdgeSet& Array1();
     StepShape_Array1OfConnectedEdgeSet& ChangeArray1();
};
%make_alias(StepShape_HArray1OfConnectedEdgeSet)


class StepShape_HArray1OfFaceBound : public  StepShape_Array1OfFaceBound, public Standard_Transient {
  public:
    StepShape_HArray1OfFaceBound(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfFaceBound(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfFaceBound::value_type& theValue);
    StepShape_HArray1OfFaceBound(const  StepShape_Array1OfFaceBound& theOther);
    const  StepShape_Array1OfFaceBound& Array1();
     StepShape_Array1OfFaceBound& ChangeArray1();
};
%make_alias(StepShape_HArray1OfFaceBound)


class StepShape_HArray1OfGeometricSetSelect : public  StepShape_Array1OfGeometricSetSelect, public Standard_Transient {
  public:
    StepShape_HArray1OfGeometricSetSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfGeometricSetSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfGeometricSetSelect::value_type& theValue);
    StepShape_HArray1OfGeometricSetSelect(const  StepShape_Array1OfGeometricSetSelect& theOther);
    const  StepShape_Array1OfGeometricSetSelect& Array1();
     StepShape_Array1OfGeometricSetSelect& ChangeArray1();
};
%make_alias(StepShape_HArray1OfGeometricSetSelect)


class StepShape_HArray1OfConnectedFaceSet : public  StepShape_Array1OfConnectedFaceSet, public Standard_Transient {
  public:
    StepShape_HArray1OfConnectedFaceSet(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfConnectedFaceSet(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfConnectedFaceSet::value_type& theValue);
    StepShape_HArray1OfConnectedFaceSet(const  StepShape_Array1OfConnectedFaceSet& theOther);
    const  StepShape_Array1OfConnectedFaceSet& Array1();
     StepShape_Array1OfConnectedFaceSet& ChangeArray1();
};
%make_alias(StepShape_HArray1OfConnectedFaceSet)


class StepShape_HArray1OfEdge : public  StepShape_Array1OfEdge, public Standard_Transient {
  public:
    StepShape_HArray1OfEdge(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfEdge(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfEdge::value_type& theValue);
    StepShape_HArray1OfEdge(const  StepShape_Array1OfEdge& theOther);
    const  StepShape_Array1OfEdge& Array1();
     StepShape_Array1OfEdge& ChangeArray1();
};
%make_alias(StepShape_HArray1OfEdge)


class StepShape_HArray1OfFace : public  StepShape_Array1OfFace, public Standard_Transient {
  public:
    StepShape_HArray1OfFace(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfFace(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfFace::value_type& theValue);
    StepShape_HArray1OfFace(const  StepShape_Array1OfFace& theOther);
    const  StepShape_Array1OfFace& Array1();
     StepShape_Array1OfFace& ChangeArray1();
};
%make_alias(StepShape_HArray1OfFace)


class StepShape_HArray1OfShapeDimensionRepresentationItem : public  StepShape_Array1OfShapeDimensionRepresentationItem, public Standard_Transient {
  public:
    StepShape_HArray1OfShapeDimensionRepresentationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfShapeDimensionRepresentationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfShapeDimensionRepresentationItem::value_type& theValue);
    StepShape_HArray1OfShapeDimensionRepresentationItem(const  StepShape_Array1OfShapeDimensionRepresentationItem& theOther);
    const  StepShape_Array1OfShapeDimensionRepresentationItem& Array1();
     StepShape_Array1OfShapeDimensionRepresentationItem& ChangeArray1();
};
%make_alias(StepShape_HArray1OfShapeDimensionRepresentationItem)


class StepShape_HArray1OfValueQualifier : public  StepShape_Array1OfValueQualifier, public Standard_Transient {
  public:
    StepShape_HArray1OfValueQualifier(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfValueQualifier(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfValueQualifier::value_type& theValue);
    StepShape_HArray1OfValueQualifier(const  StepShape_Array1OfValueQualifier& theOther);
    const  StepShape_Array1OfValueQualifier& Array1();
     StepShape_Array1OfValueQualifier& ChangeArray1();
};
%make_alias(StepShape_HArray1OfValueQualifier)


class StepShape_HArray1OfShell : public  StepShape_Array1OfShell, public Standard_Transient {
  public:
    StepShape_HArray1OfShell(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfShell(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfShell::value_type& theValue);
    StepShape_HArray1OfShell(const  StepShape_Array1OfShell& theOther);
    const  StepShape_Array1OfShell& Array1();
     StepShape_Array1OfShell& ChangeArray1();
};
%make_alias(StepShape_HArray1OfShell)


class StepShape_HArray1OfOrientedClosedShell : public  StepShape_Array1OfOrientedClosedShell, public Standard_Transient {
  public:
    StepShape_HArray1OfOrientedClosedShell(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfOrientedClosedShell(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfOrientedClosedShell::value_type& theValue);
    StepShape_HArray1OfOrientedClosedShell(const  StepShape_Array1OfOrientedClosedShell& theOther);
    const  StepShape_Array1OfOrientedClosedShell& Array1();
     StepShape_Array1OfOrientedClosedShell& ChangeArray1();
};
%make_alias(StepShape_HArray1OfOrientedClosedShell)


class StepShape_HArray1OfOrientedEdge : public  StepShape_Array1OfOrientedEdge, public Standard_Transient {
  public:
    StepShape_HArray1OfOrientedEdge(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfOrientedEdge(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepShape_Array1OfOrientedEdge::value_type& theValue);
    StepShape_HArray1OfOrientedEdge(const  StepShape_Array1OfOrientedEdge& theOther);
    const  StepShape_Array1OfOrientedEdge& Array1();
     StepShape_Array1OfOrientedEdge& ChangeArray1();
};
%make_alias(StepShape_HArray1OfOrientedEdge)


/* harray2 classes */
/* hsequence classes */
