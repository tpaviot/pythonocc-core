/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
#include<TopoDS_module.hxx>
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

%pythoncode {
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class StepShape_AngleRelator:
	StepShape_Equal = 0
	StepShape_Large = 1
	StepShape_Small = 2

class StepShape_BooleanOperator:
	StepShape_boDifference = 0
	StepShape_boIntersection = 1
	StepShape_boUnion = 2
};
/* end python proxy for enums */

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
%template(StepShape_Array1OfConnectedEdgeSet) NCollection_Array1<opencascade::handle<StepShape_ConnectedEdgeSet>>;

%extend NCollection_Array1<opencascade::handle<StepShape_ConnectedEdgeSet>> {
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
%template(StepShape_Array1OfConnectedFaceSet) NCollection_Array1<opencascade::handle<StepShape_ConnectedFaceSet>>;

%extend NCollection_Array1<opencascade::handle<StepShape_ConnectedFaceSet>> {
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
%template(StepShape_Array1OfEdge) NCollection_Array1<opencascade::handle<StepShape_Edge>>;

%extend NCollection_Array1<opencascade::handle<StepShape_Edge>> {
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
%template(StepShape_Array1OfFace) NCollection_Array1<opencascade::handle<StepShape_Face>>;

%extend NCollection_Array1<opencascade::handle<StepShape_Face>> {
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
%template(StepShape_Array1OfFaceBound) NCollection_Array1<opencascade::handle<StepShape_FaceBound>>;

%extend NCollection_Array1<opencascade::handle<StepShape_FaceBound>> {
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
%template(StepShape_Array1OfGeometricSetSelect) NCollection_Array1<StepShape_GeometricSetSelect>;

%extend NCollection_Array1<StepShape_GeometricSetSelect> {
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
%template(StepShape_Array1OfOrientedClosedShell) NCollection_Array1<opencascade::handle<StepShape_OrientedClosedShell>>;

%extend NCollection_Array1<opencascade::handle<StepShape_OrientedClosedShell>> {
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
%template(StepShape_Array1OfOrientedEdge) NCollection_Array1<opencascade::handle<StepShape_OrientedEdge>>;

%extend NCollection_Array1<opencascade::handle<StepShape_OrientedEdge>> {
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
%template(StepShape_Array1OfShapeDimensionRepresentationItem) NCollection_Array1<StepShape_ShapeDimensionRepresentationItem>;

%extend NCollection_Array1<StepShape_ShapeDimensionRepresentationItem> {
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
%template(StepShape_Array1OfShell) NCollection_Array1<StepShape_Shell>;

%extend NCollection_Array1<StepShape_Shell> {
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
%template(StepShape_Array1OfValueQualifier) NCollection_Array1<StepShape_ValueQualifier>;

%extend NCollection_Array1<StepShape_ValueQualifier> {
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
typedef NCollection_Array1<opencascade::handle<StepShape_ConnectedEdgeSet>> StepShape_Array1OfConnectedEdgeSet;
typedef NCollection_Array1<opencascade::handle<StepShape_ConnectedFaceSet>> StepShape_Array1OfConnectedFaceSet;
typedef NCollection_Array1<opencascade::handle<StepShape_Edge>> StepShape_Array1OfEdge;
typedef NCollection_Array1<opencascade::handle<StepShape_Face>> StepShape_Array1OfFace;
typedef NCollection_Array1<opencascade::handle<StepShape_FaceBound>> StepShape_Array1OfFaceBound;
typedef NCollection_Array1<StepShape_GeometricSetSelect> StepShape_Array1OfGeometricSetSelect;
typedef NCollection_Array1<opencascade::handle<StepShape_OrientedClosedShell>> StepShape_Array1OfOrientedClosedShell;
typedef NCollection_Array1<opencascade::handle<StepShape_OrientedEdge>> StepShape_Array1OfOrientedEdge;
typedef NCollection_Array1<StepShape_ShapeDimensionRepresentationItem> StepShape_Array1OfShapeDimensionRepresentationItem;
typedef NCollection_Array1<StepShape_Shell> StepShape_Array1OfShell;
typedef NCollection_Array1<StepShape_ValueQualifier> StepShape_Array1OfValueQualifier;
/* end typedefs declaration */

/************************
* class StepShape_Block *
************************/
class StepShape_Block : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** StepShape_Block ******************/
		%feature("compactdefaultargs") StepShape_Block;
		%feature("autodoc", "Returns a block.

Returns
-------
None
") StepShape_Block;
		 StepShape_Block();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement3d
aX: float
aY: float
aZ: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition, const Standard_Real aX, const Standard_Real aY, const Standard_Real aZ);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis2Placement3d>
") Position;
		opencascade::handle<StepGeom_Axis2Placement3d> Position();

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPosition: StepGeom_Axis2Placement3d

Returns
-------
None
") SetPosition;
		void SetPosition(const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "No available documentation.

Parameters
----------
aX: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real aX);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "No available documentation.

Parameters
----------
aY: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real aY);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "No available documentation.

Parameters
----------
aZ: float

Returns
-------
None
") SetZ;
		void SetZ(const Standard_Real aZ);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Z;
		Standard_Real Z();

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
		/****************** StepShape_BooleanOperand ******************/
		%feature("compactdefaultargs") StepShape_BooleanOperand;
		%feature("autodoc", "Returns a booleanoperand selecttype.

Returns
-------
None
") StepShape_BooleanOperand;
		 StepShape_BooleanOperand();

		/****************** BooleanResult ******************/
		%feature("compactdefaultargs") BooleanResult;
		%feature("autodoc", "Returns value as a booleanresult (null if another type).

Returns
-------
opencascade::handle<StepShape_BooleanResult>
") BooleanResult;
		opencascade::handle<StepShape_BooleanResult> BooleanResult();

		/****************** CsgPrimitive ******************/
		%feature("compactdefaultargs") CsgPrimitive;
		%feature("autodoc", "Returns value as a csgprimitive (null if another type) csgprimitive is another select type.

Returns
-------
StepShape_CsgPrimitive
") CsgPrimitive;
		StepShape_CsgPrimitive CsgPrimitive();

		/****************** HalfSpaceSolid ******************/
		%feature("compactdefaultargs") HalfSpaceSolid;
		%feature("autodoc", "Returns value as a halfspacesolid (null if another type).

Returns
-------
opencascade::handle<StepShape_HalfSpaceSolid>
") HalfSpaceSolid;
		opencascade::handle<StepShape_HalfSpaceSolid> HalfSpaceSolid();

		/****************** SetBooleanResult ******************/
		%feature("compactdefaultargs") SetBooleanResult;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBooleanResult: StepShape_BooleanResult

Returns
-------
None
") SetBooleanResult;
		void SetBooleanResult(const opencascade::handle<StepShape_BooleanResult> & aBooleanResult);

		/****************** SetCsgPrimitive ******************/
		%feature("compactdefaultargs") SetCsgPrimitive;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCsgPrimitive: StepShape_CsgPrimitive

Returns
-------
None
") SetCsgPrimitive;
		void SetCsgPrimitive(const StepShape_CsgPrimitive & aCsgPrimitive);

		/****************** SetHalfSpaceSolid ******************/
		%feature("compactdefaultargs") SetHalfSpaceSolid;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHalfSpaceSolid: StepShape_HalfSpaceSolid

Returns
-------
None
") SetHalfSpaceSolid;
		void SetHalfSpaceSolid(const opencascade::handle<StepShape_HalfSpaceSolid> & aHalfSpaceSolid);

		/****************** SetSolidModel ******************/
		%feature("compactdefaultargs") SetSolidModel;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSolidModel: StepShape_SolidModel

Returns
-------
None
") SetSolidModel;
		void SetSolidModel(const opencascade::handle<StepShape_SolidModel> & aSolidModel);

		/****************** SetTypeOfContent ******************/
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTypeOfContent: int

Returns
-------
None
") SetTypeOfContent;
		void SetTypeOfContent(const Standard_Integer aTypeOfContent);

		/****************** SolidModel ******************/
		%feature("compactdefaultargs") SolidModel;
		%feature("autodoc", "Returns value as a solidmodel (null if another type).

Returns
-------
opencascade::handle<StepShape_SolidModel>
") SolidModel;
		opencascade::handle<StepShape_SolidModel> SolidModel();

		/****************** TypeOfContent ******************/
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") TypeOfContent;
		Standard_Integer TypeOfContent();

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
		/****************** StepShape_BooleanResult ******************/
		%feature("compactdefaultargs") StepShape_BooleanResult;
		%feature("autodoc", "Returns a booleanresult.

Returns
-------
None
") StepShape_BooleanResult;
		 StepShape_BooleanResult();

		/****************** FirstOperand ******************/
		%feature("compactdefaultargs") FirstOperand;
		%feature("autodoc", "No available documentation.

Returns
-------
StepShape_BooleanOperand
") FirstOperand;
		StepShape_BooleanOperand FirstOperand();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aOperator: StepShape_BooleanOperator
aFirstOperand: StepShape_BooleanOperand
aSecondOperand: StepShape_BooleanOperand

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepShape_BooleanOperator aOperator, const StepShape_BooleanOperand & aFirstOperand, const StepShape_BooleanOperand & aSecondOperand);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
StepShape_BooleanOperator
") Operator;
		StepShape_BooleanOperator Operator();

		/****************** SecondOperand ******************/
		%feature("compactdefaultargs") SecondOperand;
		%feature("autodoc", "No available documentation.

Returns
-------
StepShape_BooleanOperand
") SecondOperand;
		StepShape_BooleanOperand SecondOperand();

		/****************** SetFirstOperand ******************/
		%feature("compactdefaultargs") SetFirstOperand;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFirstOperand: StepShape_BooleanOperand

Returns
-------
None
") SetFirstOperand;
		void SetFirstOperand(const StepShape_BooleanOperand & aFirstOperand);

		/****************** SetOperator ******************/
		%feature("compactdefaultargs") SetOperator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOperator: StepShape_BooleanOperator

Returns
-------
None
") SetOperator;
		void SetOperator(const StepShape_BooleanOperator aOperator);

		/****************** SetSecondOperand ******************/
		%feature("compactdefaultargs") SetSecondOperand;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSecondOperand: StepShape_BooleanOperand

Returns
-------
None
") SetSecondOperand;
		void SetSecondOperand(const StepShape_BooleanOperand & aSecondOperand);

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
		/****************** StepShape_BoxDomain ******************/
		%feature("compactdefaultargs") StepShape_BoxDomain;
		%feature("autodoc", "Returns a boxdomain.

Returns
-------
None
") StepShape_BoxDomain;
		 StepShape_BoxDomain();

		/****************** Corner ******************/
		%feature("compactdefaultargs") Corner;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_CartesianPoint>
") Corner;
		opencascade::handle<StepGeom_CartesianPoint> Corner();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCorner: StepGeom_CartesianPoint
aXlength: float
aYlength: float
aZlength: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepGeom_CartesianPoint> & aCorner, const Standard_Real aXlength, const Standard_Real aYlength, const Standard_Real aZlength);

		/****************** SetCorner ******************/
		%feature("compactdefaultargs") SetCorner;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCorner: StepGeom_CartesianPoint

Returns
-------
None
") SetCorner;
		void SetCorner(const opencascade::handle<StepGeom_CartesianPoint> & aCorner);

		/****************** SetXlength ******************/
		%feature("compactdefaultargs") SetXlength;
		%feature("autodoc", "No available documentation.

Parameters
----------
aXlength: float

Returns
-------
None
") SetXlength;
		void SetXlength(const Standard_Real aXlength);

		/****************** SetYlength ******************/
		%feature("compactdefaultargs") SetYlength;
		%feature("autodoc", "No available documentation.

Parameters
----------
aYlength: float

Returns
-------
None
") SetYlength;
		void SetYlength(const Standard_Real aYlength);

		/****************** SetZlength ******************/
		%feature("compactdefaultargs") SetZlength;
		%feature("autodoc", "No available documentation.

Parameters
----------
aZlength: float

Returns
-------
None
") SetZlength;
		void SetZlength(const Standard_Real aZlength);

		/****************** Xlength ******************/
		%feature("compactdefaultargs") Xlength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Xlength;
		Standard_Real Xlength();

		/****************** Ylength ******************/
		%feature("compactdefaultargs") Ylength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Ylength;
		Standard_Real Ylength();

		/****************** Zlength ******************/
		%feature("compactdefaultargs") Zlength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Zlength;
		Standard_Real Zlength();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_ConnectedFaceShapeRepresentation;
		 StepShape_ConnectedFaceShapeRepresentation();

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
		/****************** StepShape_ContextDependentShapeRepresentation ******************/
		%feature("compactdefaultargs") StepShape_ContextDependentShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_ContextDependentShapeRepresentation;
		 StepShape_ContextDependentShapeRepresentation();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRepRel: StepRepr_ShapeRepresentationRelationship
aProRel: StepRepr_ProductDefinitionShape

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepRepr_ShapeRepresentationRelationship> & aRepRel, const opencascade::handle<StepRepr_ProductDefinitionShape> & aProRel);

		/****************** RepresentationRelation ******************/
		%feature("compactdefaultargs") RepresentationRelation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ShapeRepresentationRelationship>
") RepresentationRelation;
		opencascade::handle<StepRepr_ShapeRepresentationRelationship> RepresentationRelation();

		/****************** RepresentedProductRelation ******************/
		%feature("compactdefaultargs") RepresentedProductRelation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionShape>
") RepresentedProductRelation;
		opencascade::handle<StepRepr_ProductDefinitionShape> RepresentedProductRelation();

		/****************** SetRepresentationRelation ******************/
		%feature("compactdefaultargs") SetRepresentationRelation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRepRel: StepRepr_ShapeRepresentationRelationship

Returns
-------
None
") SetRepresentationRelation;
		void SetRepresentationRelation(const opencascade::handle<StepRepr_ShapeRepresentationRelationship> & aRepRel);

		/****************** SetRepresentedProductRelation ******************/
		%feature("compactdefaultargs") SetRepresentedProductRelation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aProRel: StepRepr_ProductDefinitionShape

Returns
-------
None
") SetRepresentedProductRelation;
		void SetRepresentedProductRelation(const opencascade::handle<StepRepr_ProductDefinitionShape> & aProRel);

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
		/****************** StepShape_CsgPrimitive ******************/
		%feature("compactdefaultargs") StepShape_CsgPrimitive;
		%feature("autodoc", "Returns a csgprimitive selecttype.

Returns
-------
None
") StepShape_CsgPrimitive;
		 StepShape_CsgPrimitive();

		/****************** Block ******************/
		%feature("compactdefaultargs") Block;
		%feature("autodoc", "Returns value as a block (null if another type).

Returns
-------
opencascade::handle<StepShape_Block>
") Block;
		opencascade::handle<StepShape_Block> Block();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a csgprimitive kind entity that is : 1 -> sphere 2 -> block 3 -> rightangularwedge 4 -> torus 5 -> rightcircularcone 6 -> rightcircularcylinder 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** RightAngularWedge ******************/
		%feature("compactdefaultargs") RightAngularWedge;
		%feature("autodoc", "Returns value as a rightangularwedge (null if another type).

Returns
-------
opencascade::handle<StepShape_RightAngularWedge>
") RightAngularWedge;
		opencascade::handle<StepShape_RightAngularWedge> RightAngularWedge();

		/****************** RightCircularCone ******************/
		%feature("compactdefaultargs") RightCircularCone;
		%feature("autodoc", "Returns value as a rightcircularcone (null if another type).

Returns
-------
opencascade::handle<StepShape_RightCircularCone>
") RightCircularCone;
		opencascade::handle<StepShape_RightCircularCone> RightCircularCone();

		/****************** RightCircularCylinder ******************/
		%feature("compactdefaultargs") RightCircularCylinder;
		%feature("autodoc", "Returns value as a rightcircularcylinder (null if another type).

Returns
-------
opencascade::handle<StepShape_RightCircularCylinder>
") RightCircularCylinder;
		opencascade::handle<StepShape_RightCircularCylinder> RightCircularCylinder();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Returns value as a sphere (null if another type).

Returns
-------
opencascade::handle<StepShape_Sphere>
") Sphere;
		opencascade::handle<StepShape_Sphere> Sphere();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Returns value as a torus (null if another type).

Returns
-------
opencascade::handle<StepShape_Torus>
") Torus;
		opencascade::handle<StepShape_Torus> Torus();

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
		/****************** StepShape_CsgSelect ******************/
		%feature("compactdefaultargs") StepShape_CsgSelect;
		%feature("autodoc", "Returns a csgselect selecttype.

Returns
-------
None
") StepShape_CsgSelect;
		 StepShape_CsgSelect();

		/****************** BooleanResult ******************/
		%feature("compactdefaultargs") BooleanResult;
		%feature("autodoc", "Returns value as a booleanresult (null if another type).

Returns
-------
opencascade::handle<StepShape_BooleanResult>
") BooleanResult;
		opencascade::handle<StepShape_BooleanResult> BooleanResult();

		/****************** CsgPrimitive ******************/
		%feature("compactdefaultargs") CsgPrimitive;
		%feature("autodoc", "Returns value as a csgprimitive (null if another type).

Returns
-------
StepShape_CsgPrimitive
") CsgPrimitive;
		StepShape_CsgPrimitive CsgPrimitive();

		/****************** SetBooleanResult ******************/
		%feature("compactdefaultargs") SetBooleanResult;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBooleanResult: StepShape_BooleanResult

Returns
-------
None
") SetBooleanResult;
		void SetBooleanResult(const opencascade::handle<StepShape_BooleanResult> & aBooleanResult);

		/****************** SetCsgPrimitive ******************/
		%feature("compactdefaultargs") SetCsgPrimitive;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCsgPrimitive: StepShape_CsgPrimitive

Returns
-------
None
") SetCsgPrimitive;
		void SetCsgPrimitive(const StepShape_CsgPrimitive & aCsgPrimitive);

		/****************** SetTypeOfContent ******************/
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTypeOfContent: int

Returns
-------
None
") SetTypeOfContent;
		void SetTypeOfContent(const Standard_Integer aTypeOfContent);

		/****************** TypeOfContent ******************/
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") TypeOfContent;
		Standard_Integer TypeOfContent();

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_DefinitionalRepresentationAndShapeRepresentation;
		 StepShape_DefinitionalRepresentationAndShapeRepresentation();

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
		/****************** StepShape_DimensionalCharacteristic ******************/
		%feature("compactdefaultargs") StepShape_DimensionalCharacteristic;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalCharacteristic;
		 StepShape_DimensionalCharacteristic();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of dimensionalcharacteristic select type 1 -> dimensionallocation from stepshape 2 -> dimensionalsize from stepshape 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DimensionalLocation ******************/
		%feature("compactdefaultargs") DimensionalLocation;
		%feature("autodoc", "Returns value as dimensionallocation (or null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalLocation>
") DimensionalLocation;
		opencascade::handle<StepShape_DimensionalLocation> DimensionalLocation();

		/****************** DimensionalSize ******************/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Returns value as dimensionalsize (or null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalSize>
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

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
		/****************** StepShape_DimensionalCharacteristicRepresentation ******************/
		%feature("compactdefaultargs") StepShape_DimensionalCharacteristicRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalCharacteristicRepresentation;
		 StepShape_DimensionalCharacteristicRepresentation();

		/****************** Dimension ******************/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Returns field dimension.

Returns
-------
StepShape_DimensionalCharacteristic
") Dimension;
		StepShape_DimensionalCharacteristic Dimension();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aDimension: StepShape_DimensionalCharacteristic
aRepresentation: StepShape_ShapeDimensionRepresentation

Returns
-------
None
") Init;
		void Init(const StepShape_DimensionalCharacteristic & aDimension, const opencascade::handle<StepShape_ShapeDimensionRepresentation> & aRepresentation);

		/****************** Representation ******************/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns field representation.

Returns
-------
opencascade::handle<StepShape_ShapeDimensionRepresentation>
") Representation;
		opencascade::handle<StepShape_ShapeDimensionRepresentation> Representation();

		/****************** SetDimension ******************/
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "Set field dimension.

Parameters
----------
Dimension: StepShape_DimensionalCharacteristic

Returns
-------
None
") SetDimension;
		void SetDimension(const StepShape_DimensionalCharacteristic & Dimension);

		/****************** SetRepresentation ******************/
		%feature("compactdefaultargs") SetRepresentation;
		%feature("autodoc", "Set field representation.

Parameters
----------
Representation: StepShape_ShapeDimensionRepresentation

Returns
-------
None
") SetRepresentation;
		void SetRepresentation(const opencascade::handle<StepShape_ShapeDimensionRepresentation> & Representation);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalLocation;
		 StepShape_DimensionalLocation();

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
		/****************** StepShape_DimensionalSize ******************/
		%feature("compactdefaultargs") StepShape_DimensionalSize;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalSize;
		 StepShape_DimensionalSize();

		/****************** AppliesTo ******************/
		%feature("compactdefaultargs") AppliesTo;
		%feature("autodoc", "Returns field appliesto.

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") AppliesTo;
		opencascade::handle<StepRepr_ShapeAspect> AppliesTo();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aAppliesTo: StepRepr_ShapeAspect
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepRepr_ShapeAspect> & aAppliesTo, const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetAppliesTo ******************/
		%feature("compactdefaultargs") SetAppliesTo;
		%feature("autodoc", "Set field appliesto.

Parameters
----------
AppliesTo: StepRepr_ShapeAspect

Returns
-------
None
") SetAppliesTo;
		void SetAppliesTo(const opencascade::handle<StepRepr_ShapeAspect> & AppliesTo);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

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
		/****************** StepShape_EdgeBasedWireframeModel ******************/
		%feature("compactdefaultargs") StepShape_EdgeBasedWireframeModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_EdgeBasedWireframeModel;
		 StepShape_EdgeBasedWireframeModel();

		/****************** EbwmBoundary ******************/
		%feature("compactdefaultargs") EbwmBoundary;
		%feature("autodoc", "Returns field ebwmboundary.

Returns
-------
opencascade::handle<StepShape_HArray1OfConnectedEdgeSet>
") EbwmBoundary;
		opencascade::handle<StepShape_HArray1OfConnectedEdgeSet> EbwmBoundary();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aEbwmBoundary: StepShape_HArray1OfConnectedEdgeSet

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepShape_HArray1OfConnectedEdgeSet> & aEbwmBoundary);

		/****************** SetEbwmBoundary ******************/
		%feature("compactdefaultargs") SetEbwmBoundary;
		%feature("autodoc", "Set field ebwmboundary.

Parameters
----------
EbwmBoundary: StepShape_HArray1OfConnectedEdgeSet

Returns
-------
None
") SetEbwmBoundary;
		void SetEbwmBoundary(const opencascade::handle<StepShape_HArray1OfConnectedEdgeSet> & EbwmBoundary);

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
		/****************** StepShape_FaceBasedSurfaceModel ******************/
		%feature("compactdefaultargs") StepShape_FaceBasedSurfaceModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_FaceBasedSurfaceModel;
		 StepShape_FaceBasedSurfaceModel();

		/****************** FbsmFaces ******************/
		%feature("compactdefaultargs") FbsmFaces;
		%feature("autodoc", "Returns field fbsmfaces.

Returns
-------
opencascade::handle<StepShape_HArray1OfConnectedFaceSet>
") FbsmFaces;
		opencascade::handle<StepShape_HArray1OfConnectedFaceSet> FbsmFaces();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFbsmFaces: StepShape_HArray1OfConnectedFaceSet

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepShape_HArray1OfConnectedFaceSet> & aFbsmFaces);

		/****************** SetFbsmFaces ******************/
		%feature("compactdefaultargs") SetFbsmFaces;
		%feature("autodoc", "Set field fbsmfaces.

Parameters
----------
FbsmFaces: StepShape_HArray1OfConnectedFaceSet

Returns
-------
None
") SetFbsmFaces;
		void SetFbsmFaces(const opencascade::handle<StepShape_HArray1OfConnectedFaceSet> & FbsmFaces);

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
		/****************** StepShape_GeometricSet ******************/
		%feature("compactdefaultargs") StepShape_GeometricSet;
		%feature("autodoc", "Returns a geometricset.

Returns
-------
None
") StepShape_GeometricSet;
		 StepShape_GeometricSet();

		/****************** Elements ******************/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfGeometricSetSelect>
") Elements;
		opencascade::handle<StepShape_HArray1OfGeometricSetSelect> Elements();

		/****************** ElementsValue ******************/
		%feature("compactdefaultargs") ElementsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepShape_GeometricSetSelect
") ElementsValue;
		StepShape_GeometricSetSelect ElementsValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aElements: StepShape_HArray1OfGeometricSetSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_HArray1OfGeometricSetSelect> & aElements);

		/****************** NbElements ******************/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbElements;
		Standard_Integer NbElements();

		/****************** SetElements ******************/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "No available documentation.

Parameters
----------
aElements: StepShape_HArray1OfGeometricSetSelect

Returns
-------
None
") SetElements;
		void SetElements(const opencascade::handle<StepShape_HArray1OfGeometricSetSelect> & aElements);

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
		/****************** StepShape_GeometricSetSelect ******************/
		%feature("compactdefaultargs") StepShape_GeometricSetSelect;
		%feature("autodoc", "Returns a geometricsetselect selecttype.

Returns
-------
None
") StepShape_GeometricSetSelect;
		 StepShape_GeometricSetSelect();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a geometricsetselect kind entity that is : 1 -> point 2 -> curve 3 -> surface 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns value as a curve (null if another type).

Returns
-------
opencascade::handle<StepGeom_Curve>
") Curve;
		opencascade::handle<StepGeom_Curve> Curve();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns value as a point (null if another type).

Returns
-------
opencascade::handle<StepGeom_Point>
") Point;
		opencascade::handle<StepGeom_Point> Point();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns value as a surface (null if another type).

Returns
-------
opencascade::handle<StepGeom_Surface>
") Surface;
		opencascade::handle<StepGeom_Surface> Surface();

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
		/****************** StepShape_HalfSpaceSolid ******************/
		%feature("compactdefaultargs") StepShape_HalfSpaceSolid;
		%feature("autodoc", "Returns a halfspacesolid.

Returns
-------
None
") StepShape_HalfSpaceSolid;
		 StepShape_HalfSpaceSolid();

		/****************** AgreementFlag ******************/
		%feature("compactdefaultargs") AgreementFlag;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AgreementFlag;
		Standard_Boolean AgreementFlag();

		/****************** BaseSurface ******************/
		%feature("compactdefaultargs") BaseSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Surface>
") BaseSurface;
		opencascade::handle<StepGeom_Surface> BaseSurface();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aBaseSurface: StepGeom_Surface
aAgreementFlag: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Surface> & aBaseSurface, const Standard_Boolean aAgreementFlag);

		/****************** SetAgreementFlag ******************/
		%feature("compactdefaultargs") SetAgreementFlag;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAgreementFlag: bool

Returns
-------
None
") SetAgreementFlag;
		void SetAgreementFlag(const Standard_Boolean aAgreementFlag);

		/****************** SetBaseSurface ******************/
		%feature("compactdefaultargs") SetBaseSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBaseSurface: StepGeom_Surface

Returns
-------
None
") SetBaseSurface;
		void SetBaseSurface(const opencascade::handle<StepGeom_Surface> & aBaseSurface);

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
		/****************** StepShape_LimitsAndFits ******************/
		%feature("compactdefaultargs") StepShape_LimitsAndFits;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_LimitsAndFits;
		 StepShape_LimitsAndFits();

		/****************** FormVariance ******************/
		%feature("compactdefaultargs") FormVariance;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FormVariance;
		opencascade::handle<TCollection_HAsciiString> FormVariance();

		/****************** Grade ******************/
		%feature("compactdefaultargs") Grade;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Grade;
		opencascade::handle<TCollection_HAsciiString> Grade();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
form_variance: TCollection_HAsciiString
zone_variance: TCollection_HAsciiString
grade: TCollection_HAsciiString
source: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & form_variance, const opencascade::handle<TCollection_HAsciiString> & zone_variance, const opencascade::handle<TCollection_HAsciiString> & grade, const opencascade::handle<TCollection_HAsciiString> & source);

		/****************** SetFormVariance ******************/
		%feature("compactdefaultargs") SetFormVariance;
		%feature("autodoc", "No available documentation.

Parameters
----------
form_variance: TCollection_HAsciiString

Returns
-------
None
") SetFormVariance;
		void SetFormVariance(const opencascade::handle<TCollection_HAsciiString> & form_variance);

		/****************** SetGrade ******************/
		%feature("compactdefaultargs") SetGrade;
		%feature("autodoc", "No available documentation.

Parameters
----------
grade: TCollection_HAsciiString

Returns
-------
None
") SetGrade;
		void SetGrade(const opencascade::handle<TCollection_HAsciiString> & grade);

		/****************** SetSource ******************/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "No available documentation.

Parameters
----------
source: TCollection_HAsciiString

Returns
-------
None
") SetSource;
		void SetSource(const opencascade::handle<TCollection_HAsciiString> & source);

		/****************** SetZoneVariance ******************/
		%feature("compactdefaultargs") SetZoneVariance;
		%feature("autodoc", "No available documentation.

Parameters
----------
zone_variance: TCollection_HAsciiString

Returns
-------
None
") SetZoneVariance;
		void SetZoneVariance(const opencascade::handle<TCollection_HAsciiString> & zone_variance);

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Source;
		opencascade::handle<TCollection_HAsciiString> Source();

		/****************** ZoneVariance ******************/
		%feature("compactdefaultargs") ZoneVariance;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ZoneVariance;
		opencascade::handle<TCollection_HAsciiString> ZoneVariance();

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
		/****************** StepShape_MeasureQualification ******************/
		%feature("compactdefaultargs") StepShape_MeasureQualification;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_MeasureQualification;
		 StepShape_MeasureQualification();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: TCollection_HAsciiString
description: TCollection_HAsciiString
qualified_measure: StepBasic_MeasureWithUnit
qualifiers: StepShape_HArray1OfValueQualifier

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & name, const opencascade::handle<TCollection_HAsciiString> & description, const opencascade::handle<StepBasic_MeasureWithUnit> & qualified_measure, const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbQualifiers ******************/
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbQualifiers;
		Standard_Integer NbQualifiers();

		/****************** QualifiedMeasure ******************/
		%feature("compactdefaultargs") QualifiedMeasure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") QualifiedMeasure;
		opencascade::handle<StepBasic_MeasureWithUnit> QualifiedMeasure();

		/****************** Qualifiers ******************/
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfValueQualifier>
") Qualifiers;
		opencascade::handle<StepShape_HArray1OfValueQualifier> Qualifiers();

		/****************** QualifiersValue ******************/
		%feature("compactdefaultargs") QualifiersValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepShape_ValueQualifier
") QualifiersValue;
		StepShape_ValueQualifier QualifiersValue(const Standard_Integer num);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** SetQualifiedMeasure ******************/
		%feature("compactdefaultargs") SetQualifiedMeasure;
		%feature("autodoc", "No available documentation.

Parameters
----------
qualified_measure: StepBasic_MeasureWithUnit

Returns
-------
None
") SetQualifiedMeasure;
		void SetQualifiedMeasure(const opencascade::handle<StepBasic_MeasureWithUnit> & qualified_measure);

		/****************** SetQualifiers ******************/
		%feature("compactdefaultargs") SetQualifiers;
		%feature("autodoc", "No available documentation.

Parameters
----------
qualifiers: StepShape_HArray1OfValueQualifier

Returns
-------
None
") SetQualifiers;
		void SetQualifiers(const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** SetQualifiersValue ******************/
		%feature("compactdefaultargs") SetQualifiersValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
aqualifier: StepShape_ValueQualifier

Returns
-------
None
") SetQualifiersValue;
		void SetQualifiersValue(const Standard_Integer num, const StepShape_ValueQualifier & aqualifier);

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
		/****************** StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem ******************/
		%feature("compactdefaultargs") StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem;
		 StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aValueComponent: StepBasic_MeasureValueMember
aUnitComponent: StepBasic_Unit
qualifiers: StepShape_HArray1OfValueQualifier

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureValueMember> & aValueComponent, const StepBasic_Unit & aUnitComponent, const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** Measure ******************/
		%feature("compactdefaultargs") Measure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") Measure;
		opencascade::handle<StepBasic_MeasureWithUnit> Measure();

		/****************** NbQualifiers ******************/
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbQualifiers;
		Standard_Integer NbQualifiers();

		/****************** Qualifiers ******************/
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfValueQualifier>
") Qualifiers;
		opencascade::handle<StepShape_HArray1OfValueQualifier> Qualifiers();

		/****************** QualifiersValue ******************/
		%feature("compactdefaultargs") QualifiersValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepShape_ValueQualifier
") QualifiersValue;
		StepShape_ValueQualifier QualifiersValue(const Standard_Integer num);

		/****************** SetMeasure ******************/
		%feature("compactdefaultargs") SetMeasure;
		%feature("autodoc", "No available documentation.

Parameters
----------
Measure: StepBasic_MeasureWithUnit

Returns
-------
None
") SetMeasure;
		void SetMeasure(const opencascade::handle<StepBasic_MeasureWithUnit> & Measure);

		/****************** SetQualifiers ******************/
		%feature("compactdefaultargs") SetQualifiers;
		%feature("autodoc", "No available documentation.

Parameters
----------
qualifiers: StepShape_HArray1OfValueQualifier

Returns
-------
None
") SetQualifiers;
		void SetQualifiers(const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** SetQualifiersValue ******************/
		%feature("compactdefaultargs") SetQualifiersValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
aqualifier: StepShape_ValueQualifier

Returns
-------
None
") SetQualifiersValue;
		void SetQualifiersValue(const Standard_Integer num, const StepShape_ValueQualifier & aqualifier);

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
		/****************** StepShape_PlusMinusTolerance ******************/
		%feature("compactdefaultargs") StepShape_PlusMinusTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_PlusMinusTolerance;
		 StepShape_PlusMinusTolerance();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
range: StepShape_ToleranceMethodDefinition
toleranced_dimension: StepShape_DimensionalCharacteristic

Returns
-------
None
") Init;
		void Init(const StepShape_ToleranceMethodDefinition & range, const StepShape_DimensionalCharacteristic & toleranced_dimension);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "No available documentation.

Returns
-------
StepShape_ToleranceMethodDefinition
") Range;
		StepShape_ToleranceMethodDefinition Range();

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
range: StepShape_ToleranceMethodDefinition

Returns
-------
None
") SetRange;
		void SetRange(const StepShape_ToleranceMethodDefinition & range);

		/****************** SetTolerancedDimension ******************/
		%feature("compactdefaultargs") SetTolerancedDimension;
		%feature("autodoc", "No available documentation.

Parameters
----------
toleranced_dimension: StepShape_DimensionalCharacteristic

Returns
-------
None
") SetTolerancedDimension;
		void SetTolerancedDimension(const StepShape_DimensionalCharacteristic & toleranced_dimension);

		/****************** TolerancedDimension ******************/
		%feature("compactdefaultargs") TolerancedDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
StepShape_DimensionalCharacteristic
") TolerancedDimension;
		StepShape_DimensionalCharacteristic TolerancedDimension();

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
		/****************** StepShape_PrecisionQualifier ******************/
		%feature("compactdefaultargs") StepShape_PrecisionQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_PrecisionQualifier;
		 StepShape_PrecisionQualifier();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
precision_value: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer precision_value);

		/****************** PrecisionValue ******************/
		%feature("compactdefaultargs") PrecisionValue;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") PrecisionValue;
		Standard_Integer PrecisionValue();

		/****************** SetPrecisionValue ******************/
		%feature("compactdefaultargs") SetPrecisionValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
precision_value: int

Returns
-------
None
") SetPrecisionValue;
		void SetPrecisionValue(const Standard_Integer precision_value);

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
		/****************** StepShape_QualifiedRepresentationItem ******************/
		%feature("compactdefaultargs") StepShape_QualifiedRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_QualifiedRepresentationItem;
		 StepShape_QualifiedRepresentationItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
qualifiers: StepShape_HArray1OfValueQualifier

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** NbQualifiers ******************/
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbQualifiers;
		Standard_Integer NbQualifiers();

		/****************** Qualifiers ******************/
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfValueQualifier>
") Qualifiers;
		opencascade::handle<StepShape_HArray1OfValueQualifier> Qualifiers();

		/****************** QualifiersValue ******************/
		%feature("compactdefaultargs") QualifiersValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepShape_ValueQualifier
") QualifiersValue;
		StepShape_ValueQualifier QualifiersValue(const Standard_Integer num);

		/****************** SetQualifiers ******************/
		%feature("compactdefaultargs") SetQualifiers;
		%feature("autodoc", "No available documentation.

Parameters
----------
qualifiers: StepShape_HArray1OfValueQualifier

Returns
-------
None
") SetQualifiers;
		void SetQualifiers(const opencascade::handle<StepShape_HArray1OfValueQualifier> & qualifiers);

		/****************** SetQualifiersValue ******************/
		%feature("compactdefaultargs") SetQualifiersValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
aqualifier: StepShape_ValueQualifier

Returns
-------
None
") SetQualifiersValue;
		void SetQualifiersValue(const Standard_Integer num, const StepShape_ValueQualifier & aqualifier);

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
		/****************** StepShape_ReversibleTopologyItem ******************/
		%feature("compactdefaultargs") StepShape_ReversibleTopologyItem;
		%feature("autodoc", "Returns a reversibletopologyitem selecttype.

Returns
-------
None
") StepShape_ReversibleTopologyItem;
		 StepShape_ReversibleTopologyItem();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a reversibletopologyitem kind entity that is : 1 -> edge 2 -> path 3 -> face 4 -> facebound 5 -> closedshell 6 -> openshell 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ClosedShell ******************/
		%feature("compactdefaultargs") ClosedShell;
		%feature("autodoc", "Returns value as a closedshell (null if another type).

Returns
-------
opencascade::handle<StepShape_ClosedShell>
") ClosedShell;
		opencascade::handle<StepShape_ClosedShell> ClosedShell();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns value as a edge (null if another type).

Returns
-------
opencascade::handle<StepShape_Edge>
") Edge;
		opencascade::handle<StepShape_Edge> Edge();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns value as a face (null if another type).

Returns
-------
opencascade::handle<StepShape_Face>
") Face;
		opencascade::handle<StepShape_Face> Face();

		/****************** FaceBound ******************/
		%feature("compactdefaultargs") FaceBound;
		%feature("autodoc", "Returns value as a facebound (null if another type).

Returns
-------
opencascade::handle<StepShape_FaceBound>
") FaceBound;
		opencascade::handle<StepShape_FaceBound> FaceBound();

		/****************** OpenShell ******************/
		%feature("compactdefaultargs") OpenShell;
		%feature("autodoc", "Returns value as a openshell (null if another type).

Returns
-------
opencascade::handle<StepShape_OpenShell>
") OpenShell;
		opencascade::handle<StepShape_OpenShell> OpenShell();

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Returns value as a path (null if another type).

Returns
-------
opencascade::handle<StepShape_Path>
") Path;
		opencascade::handle<StepShape_Path> Path();

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
		/****************** StepShape_RightAngularWedge ******************/
		%feature("compactdefaultargs") StepShape_RightAngularWedge;
		%feature("autodoc", "Returns a rightangularwedge.

Returns
-------
None
") StepShape_RightAngularWedge;
		 StepShape_RightAngularWedge();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement3d
aX: float
aY: float
aZ: float
aLtx: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition, const Standard_Real aX, const Standard_Real aY, const Standard_Real aZ, const Standard_Real aLtx);

		/****************** Ltx ******************/
		%feature("compactdefaultargs") Ltx;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Ltx;
		Standard_Real Ltx();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis2Placement3d>
") Position;
		opencascade::handle<StepGeom_Axis2Placement3d> Position();

		/****************** SetLtx ******************/
		%feature("compactdefaultargs") SetLtx;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLtx: float

Returns
-------
None
") SetLtx;
		void SetLtx(const Standard_Real aLtx);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPosition: StepGeom_Axis2Placement3d

Returns
-------
None
") SetPosition;
		void SetPosition(const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "No available documentation.

Parameters
----------
aX: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real aX);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "No available documentation.

Parameters
----------
aY: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real aY);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "No available documentation.

Parameters
----------
aZ: float

Returns
-------
None
") SetZ;
		void SetZ(const Standard_Real aZ);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Z;
		Standard_Real Z();

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
		/****************** StepShape_RightCircularCone ******************/
		%feature("compactdefaultargs") StepShape_RightCircularCone;
		%feature("autodoc", "Returns a rightcircularcone.

Returns
-------
None
") StepShape_RightCircularCone;
		 StepShape_RightCircularCone();

		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis1Placement
aHeight: float
aRadius: float
aSemiAngle: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis1Placement> & aPosition, const Standard_Real aHeight, const Standard_Real aRadius, const Standard_Real aSemiAngle);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Position;
		opencascade::handle<StepGeom_Axis1Placement> Position();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SemiAngle ******************/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") SemiAngle;
		Standard_Real SemiAngle();

		/****************** SetHeight ******************/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHeight: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real aHeight);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPosition: StepGeom_Axis1Placement

Returns
-------
None
") SetPosition;
		void SetPosition(const opencascade::handle<StepGeom_Axis1Placement> & aPosition);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRadius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real aRadius);

		/****************** SetSemiAngle ******************/
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSemiAngle: float

Returns
-------
None
") SetSemiAngle;
		void SetSemiAngle(const Standard_Real aSemiAngle);

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
		/****************** StepShape_RightCircularCylinder ******************/
		%feature("compactdefaultargs") StepShape_RightCircularCylinder;
		%feature("autodoc", "Returns a rightcircularcylinder.

Returns
-------
None
") StepShape_RightCircularCylinder;
		 StepShape_RightCircularCylinder();

		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis1Placement
aHeight: float
aRadius: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis1Placement> & aPosition, const Standard_Real aHeight, const Standard_Real aRadius);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Position;
		opencascade::handle<StepGeom_Axis1Placement> Position();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetHeight ******************/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHeight: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real aHeight);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPosition: StepGeom_Axis1Placement

Returns
-------
None
") SetPosition;
		void SetPosition(const opencascade::handle<StepGeom_Axis1Placement> & aPosition);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRadius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real aRadius);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_ShapeDefinitionRepresentation;
		 StepShape_ShapeDefinitionRepresentation();

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
		/****************** StepShape_ShapeDimensionRepresentationItem ******************/
		%feature("compactdefaultargs") StepShape_ShapeDimensionRepresentationItem;
		%feature("autodoc", "Returns a shapedimensionrepresentationitem select type.

Returns
-------
None
") StepShape_ShapeDimensionRepresentationItem;
		 StepShape_ShapeDimensionRepresentationItem();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a shapedimensionrepresentationitem kind entity that is : 1 -> compoundrepresentationitem 2 -> descriptiverepresentationitem 3 -> measurerepresentationitem 4 -> placement 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** CompoundRepresentationItem ******************/
		%feature("compactdefaultargs") CompoundRepresentationItem;
		%feature("autodoc", "Returns value as a compoundrepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_CompoundRepresentationItem>
") CompoundRepresentationItem;
		opencascade::handle<StepRepr_CompoundRepresentationItem> CompoundRepresentationItem();

		/****************** DescriptiveRepresentationItem ******************/
		%feature("compactdefaultargs") DescriptiveRepresentationItem;
		%feature("autodoc", "Returns value as a descriptiverepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_DescriptiveRepresentationItem>
") DescriptiveRepresentationItem;
		opencascade::handle<StepRepr_DescriptiveRepresentationItem> DescriptiveRepresentationItem();

		/****************** MeasureRepresentationItem ******************/
		%feature("compactdefaultargs") MeasureRepresentationItem;
		%feature("autodoc", "Returns value as a measurerepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_MeasureRepresentationItem>
") MeasureRepresentationItem;
		opencascade::handle<StepRepr_MeasureRepresentationItem> MeasureRepresentationItem();

		/****************** Placement ******************/
		%feature("compactdefaultargs") Placement;
		%feature("autodoc", "Returns value as a placement (null if another type).

Returns
-------
opencascade::handle<StepGeom_Placement>
") Placement;
		opencascade::handle<StepGeom_Placement> Placement();

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
		%feature("autodoc", "Returns a shaperepresentation.

Returns
-------
None
") StepShape_ShapeRepresentation;
		 StepShape_ShapeRepresentation();

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
		/****************** StepShape_Shell ******************/
		%feature("compactdefaultargs") StepShape_Shell;
		%feature("autodoc", "Returns a shell selecttype.

Returns
-------
None
") StepShape_Shell;
		 StepShape_Shell();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a shell kind entity that is : 1 -> openshell 2 -> closedshell 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ClosedShell ******************/
		%feature("compactdefaultargs") ClosedShell;
		%feature("autodoc", "Returns value as a closedshell (null if another type).

Returns
-------
opencascade::handle<StepShape_ClosedShell>
") ClosedShell;
		opencascade::handle<StepShape_ClosedShell> ClosedShell();

		/****************** OpenShell ******************/
		%feature("compactdefaultargs") OpenShell;
		%feature("autodoc", "Returns value as a openshell (null if another type).

Returns
-------
opencascade::handle<StepShape_OpenShell>
") OpenShell;
		opencascade::handle<StepShape_OpenShell> OpenShell();

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
		/****************** StepShape_ShellBasedSurfaceModel ******************/
		%feature("compactdefaultargs") StepShape_ShellBasedSurfaceModel;
		%feature("autodoc", "Returns a shellbasedsurfacemodel.

Returns
-------
None
") StepShape_ShellBasedSurfaceModel;
		 StepShape_ShellBasedSurfaceModel();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aSbsmBoundary: StepShape_HArray1OfShell

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_HArray1OfShell> & aSbsmBoundary);

		/****************** NbSbsmBoundary ******************/
		%feature("compactdefaultargs") NbSbsmBoundary;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSbsmBoundary;
		Standard_Integer NbSbsmBoundary();

		/****************** SbsmBoundary ******************/
		%feature("compactdefaultargs") SbsmBoundary;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfShell>
") SbsmBoundary;
		opencascade::handle<StepShape_HArray1OfShell> SbsmBoundary();

		/****************** SbsmBoundaryValue ******************/
		%feature("compactdefaultargs") SbsmBoundaryValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepShape_Shell
") SbsmBoundaryValue;
		StepShape_Shell SbsmBoundaryValue(const Standard_Integer num);

		/****************** SetSbsmBoundary ******************/
		%feature("compactdefaultargs") SetSbsmBoundary;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSbsmBoundary: StepShape_HArray1OfShell

Returns
-------
None
") SetSbsmBoundary;
		void SetSbsmBoundary(const opencascade::handle<StepShape_HArray1OfShell> & aSbsmBoundary);

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
		%feature("autodoc", "Returns a solidmodel.

Returns
-------
None
") StepShape_SolidModel;
		 StepShape_SolidModel();

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
		/****************** StepShape_Sphere ******************/
		%feature("compactdefaultargs") StepShape_Sphere;
		%feature("autodoc", "Returns a sphere.

Returns
-------
None
") StepShape_Sphere;
		 StepShape_Sphere();

		/****************** Centre ******************/
		%feature("compactdefaultargs") Centre;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Point>
") Centre;
		opencascade::handle<StepGeom_Point> Centre();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aRadius: float
aCentre: StepGeom_Point

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Real aRadius, const opencascade::handle<StepGeom_Point> & aCentre);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetCentre ******************/
		%feature("compactdefaultargs") SetCentre;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCentre: StepGeom_Point

Returns
-------
None
") SetCentre;
		void SetCentre(const opencascade::handle<StepGeom_Point> & aCentre);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRadius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real aRadius);

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
		/****************** StepShape_SurfaceModel ******************/
		%feature("compactdefaultargs") StepShape_SurfaceModel;
		%feature("autodoc", "Returns a surfacemodel selecttype.

Returns
-------
None
") StepShape_SurfaceModel;
		 StepShape_SurfaceModel();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a surfacemodel kind entity that is : 1 -> shellbasedsurfacemodel 2 -> facebasedsurfacemodel 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ShellBasedSurfaceModel ******************/
		%feature("compactdefaultargs") ShellBasedSurfaceModel;
		%feature("autodoc", "Returns value as a shellbasedsurfacemodel (null if another type).

Returns
-------
opencascade::handle<StepShape_ShellBasedSurfaceModel>
") ShellBasedSurfaceModel;
		opencascade::handle<StepShape_ShellBasedSurfaceModel> ShellBasedSurfaceModel();

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
		/****************** StepShape_ToleranceMethodDefinition ******************/
		%feature("compactdefaultargs") StepShape_ToleranceMethodDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_ToleranceMethodDefinition;
		 StepShape_ToleranceMethodDefinition();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of valuequalifier select type : 1 -> tolerancevalue from stepshape 2 -> limitsandfits from stepshape.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** LimitsAndFits ******************/
		%feature("compactdefaultargs") LimitsAndFits;
		%feature("autodoc", "Returns value as limitsandfits.

Returns
-------
opencascade::handle<StepShape_LimitsAndFits>
") LimitsAndFits;
		opencascade::handle<StepShape_LimitsAndFits> LimitsAndFits();

		/****************** ToleranceValue ******************/
		%feature("compactdefaultargs") ToleranceValue;
		%feature("autodoc", "Returns value as tolerancevalue.

Returns
-------
opencascade::handle<StepShape_ToleranceValue>
") ToleranceValue;
		opencascade::handle<StepShape_ToleranceValue> ToleranceValue();

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
		/****************** StepShape_ToleranceValue ******************/
		%feature("compactdefaultargs") StepShape_ToleranceValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_ToleranceValue;
		 StepShape_ToleranceValue();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
lower_bound: Standard_Transient
upper_bound: Standard_Transient

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Standard_Transient> & lower_bound, const opencascade::handle<Standard_Transient> & upper_bound);

		/****************** LowerBound ******************/
		%feature("compactdefaultargs") LowerBound;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Transient>
") LowerBound;
		opencascade::handle<Standard_Transient> LowerBound();

		/****************** SetLowerBound ******************/
		%feature("compactdefaultargs") SetLowerBound;
		%feature("autodoc", "No available documentation.

Parameters
----------
lower_bound: Standard_Transient

Returns
-------
None
") SetLowerBound;
		void SetLowerBound(const opencascade::handle<Standard_Transient> & lower_bound);

		/****************** SetUpperBound ******************/
		%feature("compactdefaultargs") SetUpperBound;
		%feature("autodoc", "No available documentation.

Parameters
----------
upper_bound: Standard_Transient

Returns
-------
None
") SetUpperBound;
		void SetUpperBound(const opencascade::handle<Standard_Transient> & upper_bound);

		/****************** UpperBound ******************/
		%feature("compactdefaultargs") UpperBound;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Transient>
") UpperBound;
		opencascade::handle<Standard_Transient> UpperBound();

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
		%feature("autodoc", "Returns a topologicalrepresentationitem.

Returns
-------
None
") StepShape_TopologicalRepresentationItem;
		 StepShape_TopologicalRepresentationItem();

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
		/****************** StepShape_Torus ******************/
		%feature("compactdefaultargs") StepShape_Torus;
		%feature("autodoc", "Returns a torus.

Returns
-------
None
") StepShape_Torus;
		 StepShape_Torus();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis1Placement
aMajorRadius: float
aMinorRadius: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis1Placement> & aPosition, const Standard_Real aMajorRadius, const Standard_Real aMinorRadius);

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Position;
		opencascade::handle<StepGeom_Axis1Placement> Position();

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMajorRadius: float

Returns
-------
None
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real aMajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMinorRadius: float

Returns
-------
None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real aMinorRadius);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPosition: StepGeom_Axis1Placement

Returns
-------
None
") SetPosition;
		void SetPosition(const opencascade::handle<StepGeom_Axis1Placement> & aPosition);

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
		/****************** StepShape_TypeQualifier ******************/
		%feature("compactdefaultargs") StepShape_TypeQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_TypeQualifier;
		 StepShape_TypeQualifier();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & name);

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
		/****************** StepShape_ValueFormatTypeQualifier ******************/
		%feature("compactdefaultargs") StepShape_ValueFormatTypeQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_ValueFormatTypeQualifier;
		 StepShape_ValueFormatTypeQualifier();

		/****************** FormatType ******************/
		%feature("compactdefaultargs") FormatType;
		%feature("autodoc", "Returns field formattype.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FormatType;
		opencascade::handle<TCollection_HAsciiString> FormatType();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init all field own and inherited.

Parameters
----------
theFormatType: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theFormatType);

		/****************** SetFormatType ******************/
		%feature("compactdefaultargs") SetFormatType;
		%feature("autodoc", "Set field formattype.

Parameters
----------
theFormatType: TCollection_HAsciiString

Returns
-------
None
") SetFormatType;
		void SetFormatType(const opencascade::handle<TCollection_HAsciiString> & theFormatType);

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
		/****************** StepShape_ValueQualifier ******************/
		%feature("compactdefaultargs") StepShape_ValueQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_ValueQualifier;
		 StepShape_ValueQualifier();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of valuequalifier select type : 1 -> precisionqualifier from stepshape 2 -> typequalifier from stepshape 3 -> unceraintyqualifier .. not yet implemented 4 -> valueformattypequalifier.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** PrecisionQualifier ******************/
		%feature("compactdefaultargs") PrecisionQualifier;
		%feature("autodoc", "Returns value as precisionqualifier.

Returns
-------
opencascade::handle<StepShape_PrecisionQualifier>
") PrecisionQualifier;
		opencascade::handle<StepShape_PrecisionQualifier> PrecisionQualifier();

		/****************** TypeQualifier ******************/
		%feature("compactdefaultargs") TypeQualifier;
		%feature("autodoc", "Returns value as typequalifier.

Returns
-------
opencascade::handle<StepShape_TypeQualifier>
") TypeQualifier;
		opencascade::handle<StepShape_TypeQualifier> TypeQualifier();

		/****************** ValueFormatTypeQualifier ******************/
		%feature("compactdefaultargs") ValueFormatTypeQualifier;
		%feature("autodoc", "Returns value as valueformattypequalifier.

Returns
-------
opencascade::handle<StepShape_ValueFormatTypeQualifier>
") ValueFormatTypeQualifier;
		opencascade::handle<StepShape_ValueFormatTypeQualifier> ValueFormatTypeQualifier();

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
		%feature("autodoc", "Returns a advancedbrepshaperepresentation.

Returns
-------
None
") StepShape_AdvancedBrepShapeRepresentation;
		 StepShape_AdvancedBrepShapeRepresentation();

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
		/****************** StepShape_AngularLocation ******************/
		%feature("compactdefaultargs") StepShape_AngularLocation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_AngularLocation;
		 StepShape_AngularLocation();

		/****************** AngleSelection ******************/
		%feature("compactdefaultargs") AngleSelection;
		%feature("autodoc", "Returns field angleselection.

Returns
-------
StepShape_AngleRelator
") AngleSelection;
		StepShape_AngleRelator AngleSelection();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aShapeAspectRelationship_Name: TCollection_HAsciiString
hasShapeAspectRelationship_Description: bool
aShapeAspectRelationship_Description: TCollection_HAsciiString
aShapeAspectRelationship_RelatingShapeAspect: StepRepr_ShapeAspect
aShapeAspectRelationship_RelatedShapeAspect: StepRepr_ShapeAspect
aAngleSelection: StepShape_AngleRelator

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aShapeAspectRelationship_Name, const Standard_Boolean hasShapeAspectRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aShapeAspectRelationship_Description, const opencascade::handle<StepRepr_ShapeAspect> & aShapeAspectRelationship_RelatingShapeAspect, const opencascade::handle<StepRepr_ShapeAspect> & aShapeAspectRelationship_RelatedShapeAspect, const StepShape_AngleRelator aAngleSelection);

		/****************** SetAngleSelection ******************/
		%feature("compactdefaultargs") SetAngleSelection;
		%feature("autodoc", "Set field angleselection.

Parameters
----------
AngleSelection: StepShape_AngleRelator

Returns
-------
None
") SetAngleSelection;
		void SetAngleSelection(const StepShape_AngleRelator AngleSelection);

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
		/****************** StepShape_AngularSize ******************/
		%feature("compactdefaultargs") StepShape_AngularSize;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_AngularSize;
		 StepShape_AngularSize();

		/****************** AngleSelection ******************/
		%feature("compactdefaultargs") AngleSelection;
		%feature("autodoc", "Returns field angleselection.

Returns
-------
StepShape_AngleRelator
") AngleSelection;
		StepShape_AngleRelator AngleSelection();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aDimensionalSize_AppliesTo: StepRepr_ShapeAspect
aDimensionalSize_Name: TCollection_HAsciiString
aAngleSelection: StepShape_AngleRelator

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepRepr_ShapeAspect> & aDimensionalSize_AppliesTo, const opencascade::handle<TCollection_HAsciiString> & aDimensionalSize_Name, const StepShape_AngleRelator aAngleSelection);

		/****************** SetAngleSelection ******************/
		%feature("compactdefaultargs") SetAngleSelection;
		%feature("autodoc", "Set field angleselection.

Parameters
----------
AngleSelection: StepShape_AngleRelator

Returns
-------
None
") SetAngleSelection;
		void SetAngleSelection(const StepShape_AngleRelator AngleSelection);

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
		/****************** StepShape_BoxedHalfSpace ******************/
		%feature("compactdefaultargs") StepShape_BoxedHalfSpace;
		%feature("autodoc", "Returns a boxedhalfspace.

Returns
-------
None
") StepShape_BoxedHalfSpace;
		 StepShape_BoxedHalfSpace();

		/****************** Enclosure ******************/
		%feature("compactdefaultargs") Enclosure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_BoxDomain>
") Enclosure;
		opencascade::handle<StepShape_BoxDomain> Enclosure();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aBaseSurface: StepGeom_Surface
aAgreementFlag: bool
aEnclosure: StepShape_BoxDomain

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Surface> & aBaseSurface, const Standard_Boolean aAgreementFlag, const opencascade::handle<StepShape_BoxDomain> & aEnclosure);

		/****************** SetEnclosure ******************/
		%feature("compactdefaultargs") SetEnclosure;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEnclosure: StepShape_BoxDomain

Returns
-------
None
") SetEnclosure;
		void SetEnclosure(const opencascade::handle<StepShape_BoxDomain> & aEnclosure);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_CompoundShapeRepresentation;
		 StepShape_CompoundShapeRepresentation();

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
		/****************** StepShape_ConnectedEdgeSet ******************/
		%feature("compactdefaultargs") StepShape_ConnectedEdgeSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_ConnectedEdgeSet;
		 StepShape_ConnectedEdgeSet();

		/****************** CesEdges ******************/
		%feature("compactdefaultargs") CesEdges;
		%feature("autodoc", "Returns field cesedges.

Returns
-------
opencascade::handle<StepShape_HArray1OfEdge>
") CesEdges;
		opencascade::handle<StepShape_HArray1OfEdge> CesEdges();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aCesEdges: StepShape_HArray1OfEdge

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepShape_HArray1OfEdge> & aCesEdges);

		/****************** SetCesEdges ******************/
		%feature("compactdefaultargs") SetCesEdges;
		%feature("autodoc", "Set field cesedges.

Parameters
----------
CesEdges: StepShape_HArray1OfEdge

Returns
-------
None
") SetCesEdges;
		void SetCesEdges(const opencascade::handle<StepShape_HArray1OfEdge> & CesEdges);

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
		/****************** StepShape_ConnectedFaceSet ******************/
		%feature("compactdefaultargs") StepShape_ConnectedFaceSet;
		%feature("autodoc", "Returns a connectedfaceset.

Returns
-------
None
") StepShape_ConnectedFaceSet;
		 StepShape_ConnectedFaceSet();

		/****************** CfsFaces ******************/
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfFace>
") CfsFaces;
		virtual opencascade::handle<StepShape_HArray1OfFace> CfsFaces();

		/****************** CfsFacesValue ******************/
		%feature("compactdefaultargs") CfsFacesValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_Face>
") CfsFacesValue;
		virtual opencascade::handle<StepShape_Face> CfsFacesValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aCfsFaces: StepShape_HArray1OfFace

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_HArray1OfFace> & aCfsFaces);

		/****************** NbCfsFaces ******************/
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces();

		/****************** SetCfsFaces ******************/
		%feature("compactdefaultargs") SetCfsFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCfsFaces: StepShape_HArray1OfFace

Returns
-------
None
") SetCfsFaces;
		virtual void SetCfsFaces(const opencascade::handle<StepShape_HArray1OfFace> & aCfsFaces);

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
		%feature("autodoc", "Returns a csgshaperepresentation.

Returns
-------
None
") StepShape_CsgShapeRepresentation;
		 StepShape_CsgShapeRepresentation();

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
		/****************** StepShape_CsgSolid ******************/
		%feature("compactdefaultargs") StepShape_CsgSolid;
		%feature("autodoc", "Returns a csgsolid.

Returns
-------
None
") StepShape_CsgSolid;
		 StepShape_CsgSolid();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aTreeRootExpression: StepShape_CsgSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepShape_CsgSelect & aTreeRootExpression);

		/****************** SetTreeRootExpression ******************/
		%feature("compactdefaultargs") SetTreeRootExpression;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTreeRootExpression: StepShape_CsgSelect

Returns
-------
None
") SetTreeRootExpression;
		void SetTreeRootExpression(const StepShape_CsgSelect & aTreeRootExpression);

		/****************** TreeRootExpression ******************/
		%feature("compactdefaultargs") TreeRootExpression;
		%feature("autodoc", "No available documentation.

Returns
-------
StepShape_CsgSelect
") TreeRootExpression;
		StepShape_CsgSelect TreeRootExpression();

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
		/****************** StepShape_DimensionalLocationWithPath ******************/
		%feature("compactdefaultargs") StepShape_DimensionalLocationWithPath;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalLocationWithPath;
		 StepShape_DimensionalLocationWithPath();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aShapeAspectRelationship_Name: TCollection_HAsciiString
hasShapeAspectRelationship_Description: bool
aShapeAspectRelationship_Description: TCollection_HAsciiString
aShapeAspectRelationship_RelatingShapeAspect: StepRepr_ShapeAspect
aShapeAspectRelationship_RelatedShapeAspect: StepRepr_ShapeAspect
aPath: StepRepr_ShapeAspect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aShapeAspectRelationship_Name, const Standard_Boolean hasShapeAspectRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aShapeAspectRelationship_Description, const opencascade::handle<StepRepr_ShapeAspect> & aShapeAspectRelationship_RelatingShapeAspect, const opencascade::handle<StepRepr_ShapeAspect> & aShapeAspectRelationship_RelatedShapeAspect, const opencascade::handle<StepRepr_ShapeAspect> & aPath);

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Returns field path.

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") Path;
		opencascade::handle<StepRepr_ShapeAspect> Path();

		/****************** SetPath ******************/
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "Set field path.

Parameters
----------
Path: StepRepr_ShapeAspect

Returns
-------
None
") SetPath;
		void SetPath(const opencascade::handle<StepRepr_ShapeAspect> & Path);

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
		/****************** StepShape_DimensionalSizeWithPath ******************/
		%feature("compactdefaultargs") StepShape_DimensionalSizeWithPath;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalSizeWithPath;
		 StepShape_DimensionalSizeWithPath();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aDimensionalSize_AppliesTo: StepRepr_ShapeAspect
aDimensionalSize_Name: TCollection_HAsciiString
aPath: StepRepr_ShapeAspect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepRepr_ShapeAspect> & aDimensionalSize_AppliesTo, const opencascade::handle<TCollection_HAsciiString> & aDimensionalSize_Name, const opencascade::handle<StepRepr_ShapeAspect> & aPath);

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Returns field path.

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") Path;
		opencascade::handle<StepRepr_ShapeAspect> Path();

		/****************** SetPath ******************/
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "Set field path.

Parameters
----------
Path: StepRepr_ShapeAspect

Returns
-------
None
") SetPath;
		void SetPath(const opencascade::handle<StepRepr_ShapeAspect> & Path);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DirectedDimensionalLocation;
		 StepShape_DirectedDimensionalLocation();

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
		/****************** StepShape_Edge ******************/
		%feature("compactdefaultargs") StepShape_Edge;
		%feature("autodoc", "Returns a edge.

Returns
-------
None
") StepShape_Edge;
		 StepShape_Edge();

		/****************** EdgeEnd ******************/
		%feature("compactdefaultargs") EdgeEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Vertex>
") EdgeEnd;
		virtual opencascade::handle<StepShape_Vertex> EdgeEnd();

		/****************** EdgeStart ******************/
		%feature("compactdefaultargs") EdgeStart;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Vertex>
") EdgeStart;
		virtual opencascade::handle<StepShape_Vertex> EdgeStart();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aEdgeStart: StepShape_Vertex
aEdgeEnd: StepShape_Vertex

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_Vertex> & aEdgeStart, const opencascade::handle<StepShape_Vertex> & aEdgeEnd);

		/****************** SetEdgeEnd ******************/
		%feature("compactdefaultargs") SetEdgeEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEdgeEnd: StepShape_Vertex

Returns
-------
None
") SetEdgeEnd;
		virtual void SetEdgeEnd(const opencascade::handle<StepShape_Vertex> & aEdgeEnd);

		/****************** SetEdgeStart ******************/
		%feature("compactdefaultargs") SetEdgeStart;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEdgeStart: StepShape_Vertex

Returns
-------
None
") SetEdgeStart;
		virtual void SetEdgeStart(const opencascade::handle<StepShape_Vertex> & aEdgeStart);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_EdgeBasedWireframeShapeRepresentation;
		 StepShape_EdgeBasedWireframeShapeRepresentation();

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
		/****************** StepShape_Face ******************/
		%feature("compactdefaultargs") StepShape_Face;
		%feature("autodoc", "Returns a face.

Returns
-------
None
") StepShape_Face;
		 StepShape_Face();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfFaceBound>
") Bounds;
		virtual opencascade::handle<StepShape_HArray1OfFaceBound> Bounds();

		/****************** BoundsValue ******************/
		%feature("compactdefaultargs") BoundsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_FaceBound>
") BoundsValue;
		virtual opencascade::handle<StepShape_FaceBound> BoundsValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aBounds: StepShape_HArray1OfFaceBound

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_HArray1OfFaceBound> & aBounds);

		/****************** NbBounds ******************/
		%feature("compactdefaultargs") NbBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbBounds;
		virtual Standard_Integer NbBounds();

		/****************** SetBounds ******************/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBounds: StepShape_HArray1OfFaceBound

Returns
-------
None
") SetBounds;
		virtual void SetBounds(const opencascade::handle<StepShape_HArray1OfFaceBound> & aBounds);

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
		/****************** StepShape_FaceBound ******************/
		%feature("compactdefaultargs") StepShape_FaceBound;
		%feature("autodoc", "Returns a facebound.

Returns
-------
None
") StepShape_FaceBound;
		 StepShape_FaceBound();

		/****************** Bound ******************/
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Loop>
") Bound;
		opencascade::handle<StepShape_Loop> Bound();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aBound: StepShape_Loop
aOrientation: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_Loop> & aBound, const Standard_Boolean aOrientation);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetBound ******************/
		%feature("compactdefaultargs") SetBound;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBound: StepShape_Loop

Returns
-------
None
") SetBound;
		void SetBound(const opencascade::handle<StepShape_Loop> & aBound);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOrientation: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Standard_Boolean aOrientation);

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
		%feature("autodoc", "Returns a facetedbrepshaperepresentation.

Returns
-------
None
") StepShape_FacetedBrepShapeRepresentation;
		 StepShape_FacetedBrepShapeRepresentation();

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
		%feature("autodoc", "Returns a geometriccurveset.

Returns
-------
None
") StepShape_GeometricCurveSet;
		 StepShape_GeometricCurveSet();

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
		%feature("autodoc", "Returns a geometricallyboundedsurfaceshaperepresentation.

Returns
-------
None
") StepShape_GeometricallyBoundedSurfaceShapeRepresentation;
		 StepShape_GeometricallyBoundedSurfaceShapeRepresentation();

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
		%feature("autodoc", "Returns a geometricallyboundedwireframeshaperepresentation.

Returns
-------
None
") StepShape_GeometricallyBoundedWireframeShapeRepresentation;
		 StepShape_GeometricallyBoundedWireframeShapeRepresentation();

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
		%feature("autodoc", "Returns a loop.

Returns
-------
None
") StepShape_Loop;
		 StepShape_Loop();

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
		/****************** StepShape_LoopAndPath ******************/
		%feature("compactdefaultargs") StepShape_LoopAndPath;
		%feature("autodoc", "Returns a loopandpath.

Returns
-------
None
") StepShape_LoopAndPath;
		 StepShape_LoopAndPath();

		/****************** EdgeList ******************/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedEdge>
") EdgeList;
		opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList();

		/****************** EdgeListValue ******************/
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_OrientedEdge>
") EdgeListValue;
		opencascade::handle<StepShape_OrientedEdge> EdgeListValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aLoop: StepShape_Loop
aPath: StepShape_Path

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_Loop> & aLoop, const opencascade::handle<StepShape_Path> & aPath);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aEdgeList: StepShape_HArray1OfOrientedEdge

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** Loop ******************/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Loop>
") Loop;
		opencascade::handle<StepShape_Loop> Loop();

		/****************** NbEdgeList ******************/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdgeList;
		Standard_Integer NbEdgeList();

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Path>
") Path;
		opencascade::handle<StepShape_Path> Path();

		/****************** SetEdgeList ******************/
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEdgeList: StepShape_HArray1OfOrientedEdge

Returns
-------
None
") SetEdgeList;
		void SetEdgeList(const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** SetLoop ******************/
		%feature("compactdefaultargs") SetLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLoop: StepShape_Loop

Returns
-------
None
") SetLoop;
		void SetLoop(const opencascade::handle<StepShape_Loop> & aLoop);

		/****************** SetPath ******************/
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPath: StepShape_Path

Returns
-------
None
") SetPath;
		void SetPath(const opencascade::handle<StepShape_Path> & aPath);

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
		/****************** StepShape_ManifoldSolidBrep ******************/
		%feature("compactdefaultargs") StepShape_ManifoldSolidBrep;
		%feature("autodoc", "Returns a manifoldsolidbrep.

Returns
-------
None
") StepShape_ManifoldSolidBrep;
		 StepShape_ManifoldSolidBrep();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aOuter: StepShape_ClosedShell

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_ClosedShell> & aOuter);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aOuter: StepShape_ConnectedFaceSet

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_ConnectedFaceSet> & aOuter);

		/****************** Outer ******************/
		%feature("compactdefaultargs") Outer;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_ConnectedFaceSet>
") Outer;
		opencascade::handle<StepShape_ConnectedFaceSet> Outer();

		/****************** SetOuter ******************/
		%feature("compactdefaultargs") SetOuter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOuter: StepShape_ConnectedFaceSet

Returns
-------
None
") SetOuter;
		void SetOuter(const opencascade::handle<StepShape_ConnectedFaceSet> & aOuter);

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
		%feature("autodoc", "Returns a manifoldsurfaceshaperepresentation.

Returns
-------
None
") StepShape_ManifoldSurfaceShapeRepresentation;
		 StepShape_ManifoldSurfaceShapeRepresentation();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_NonManifoldSurfaceShapeRepresentation;
		 StepShape_NonManifoldSurfaceShapeRepresentation();

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
		/****************** StepShape_Path ******************/
		%feature("compactdefaultargs") StepShape_Path;
		%feature("autodoc", "Returns a path.

Returns
-------
None
") StepShape_Path;
		 StepShape_Path();

		/****************** EdgeList ******************/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedEdge>
") EdgeList;
		virtual opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList();

		/****************** EdgeListValue ******************/
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_OrientedEdge>
") EdgeListValue;
		virtual opencascade::handle<StepShape_OrientedEdge> EdgeListValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aEdgeList: StepShape_HArray1OfOrientedEdge

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** NbEdgeList ******************/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdgeList;
		virtual Standard_Integer NbEdgeList();

		/****************** SetEdgeList ******************/
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEdgeList: StepShape_HArray1OfOrientedEdge

Returns
-------
None
") SetEdgeList;
		virtual void SetEdgeList(const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_PointRepresentation;
		 StepShape_PointRepresentation();

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
		/****************** StepShape_ShapeDimensionRepresentation ******************/
		%feature("compactdefaultargs") StepShape_ShapeDimensionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_ShapeDimensionRepresentation;
		 StepShape_ShapeDimensionRepresentation();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields ap214.

Parameters
----------
theName: TCollection_HAsciiString
theItems: StepRepr_HArray1OfRepresentationItem
theContextOfItems: StepRepr_RepresentationContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theItems, const opencascade::handle<StepRepr_RepresentationContext> & theContextOfItems);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields ap242.

Parameters
----------
theName: TCollection_HAsciiString
theItems: StepShape_HArray1OfShapeDimensionRepresentationItem
theContextOfItems: StepRepr_RepresentationContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepShape_HArray1OfShapeDimensionRepresentationItem> & theItems, const opencascade::handle<StepRepr_RepresentationContext> & theContextOfItems);

		/****************** ItemsAP242 ******************/
		%feature("compactdefaultargs") ItemsAP242;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfShapeDimensionRepresentationItem>
") ItemsAP242;
		opencascade::handle<StepShape_HArray1OfShapeDimensionRepresentationItem> ItemsAP242();

		/****************** SetItemsAP242 ******************/
		%feature("compactdefaultargs") SetItemsAP242;
		%feature("autodoc", "No available documentation.

Parameters
----------
theItems: StepShape_HArray1OfShapeDimensionRepresentationItem

Returns
-------
None
") SetItemsAP242;
		void SetItemsAP242(const opencascade::handle<StepShape_HArray1OfShapeDimensionRepresentationItem> & theItems);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_ShapeRepresentationWithParameters;
		 StepShape_ShapeRepresentationWithParameters();

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
		/****************** StepShape_SolidReplica ******************/
		%feature("compactdefaultargs") StepShape_SolidReplica;
		%feature("autodoc", "Returns a solidreplica.

Returns
-------
None
") StepShape_SolidReplica;
		 StepShape_SolidReplica();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aParentSolid: StepShape_SolidModel
aTransformation: StepGeom_CartesianTransformationOperator3d

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_SolidModel> & aParentSolid, const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & aTransformation);

		/****************** ParentSolid ******************/
		%feature("compactdefaultargs") ParentSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_SolidModel>
") ParentSolid;
		opencascade::handle<StepShape_SolidModel> ParentSolid();

		/****************** SetParentSolid ******************/
		%feature("compactdefaultargs") SetParentSolid;
		%feature("autodoc", "No available documentation.

Parameters
----------
aParentSolid: StepShape_SolidModel

Returns
-------
None
") SetParentSolid;
		void SetParentSolid(const opencascade::handle<StepShape_SolidModel> & aParentSolid);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTransformation: StepGeom_CartesianTransformationOperator3d

Returns
-------
None
") SetTransformation;
		void SetTransformation(const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & aTransformation);

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_CartesianTransformationOperator3d>
") Transformation;
		opencascade::handle<StepGeom_CartesianTransformationOperator3d> Transformation();

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
		/****************** StepShape_SweptAreaSolid ******************/
		%feature("compactdefaultargs") StepShape_SweptAreaSolid;
		%feature("autodoc", "Returns a sweptareasolid.

Returns
-------
None
") StepShape_SweptAreaSolid;
		 StepShape_SweptAreaSolid();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aSweptArea: StepGeom_CurveBoundedSurface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_CurveBoundedSurface> & aSweptArea);

		/****************** SetSweptArea ******************/
		%feature("compactdefaultargs") SetSweptArea;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSweptArea: StepGeom_CurveBoundedSurface

Returns
-------
None
") SetSweptArea;
		void SetSweptArea(const opencascade::handle<StepGeom_CurveBoundedSurface> & aSweptArea);

		/****************** SweptArea ******************/
		%feature("compactdefaultargs") SweptArea;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_CurveBoundedSurface>
") SweptArea;
		opencascade::handle<StepGeom_CurveBoundedSurface> SweptArea();

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
		/****************** StepShape_SweptFaceSolid ******************/
		%feature("compactdefaultargs") StepShape_SweptFaceSolid;
		%feature("autodoc", "Returns a sweptfacesolid.

Returns
-------
None
") StepShape_SweptFaceSolid;
		 StepShape_SweptFaceSolid();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aSweptArea: StepShape_FaceSurface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_FaceSurface> & aSweptArea);

		/****************** SetSweptFace ******************/
		%feature("compactdefaultargs") SetSweptFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSweptArea: StepShape_FaceSurface

Returns
-------
None
") SetSweptFace;
		virtual void SetSweptFace(const opencascade::handle<StepShape_FaceSurface> & aSweptArea);

		/****************** SweptFace ******************/
		%feature("compactdefaultargs") SweptFace;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_FaceSurface>
") SweptFace;
		virtual opencascade::handle<StepShape_FaceSurface> SweptFace();

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
		%feature("autodoc", "Returns a transitionalshaperepresentation.

Returns
-------
None
") StepShape_TransitionalShapeRepresentation;
		 StepShape_TransitionalShapeRepresentation();

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
		%feature("autodoc", "Returns a vertex.

Returns
-------
None
") StepShape_Vertex;
		 StepShape_Vertex();

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
		/****************** StepShape_BrepWithVoids ******************/
		%feature("compactdefaultargs") StepShape_BrepWithVoids;
		%feature("autodoc", "Returns a brepwithvoids.

Returns
-------
None
") StepShape_BrepWithVoids;
		 StepShape_BrepWithVoids();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aOuter: StepShape_ClosedShell
aVoids: StepShape_HArray1OfOrientedClosedShell

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_ClosedShell> & aOuter, const opencascade::handle<StepShape_HArray1OfOrientedClosedShell> & aVoids);

		/****************** NbVoids ******************/
		%feature("compactdefaultargs") NbVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVoids;
		Standard_Integer NbVoids();

		/****************** SetVoids ******************/
		%feature("compactdefaultargs") SetVoids;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVoids: StepShape_HArray1OfOrientedClosedShell

Returns
-------
None
") SetVoids;
		void SetVoids(const opencascade::handle<StepShape_HArray1OfOrientedClosedShell> & aVoids);

		/****************** Voids ******************/
		%feature("compactdefaultargs") Voids;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedClosedShell>
") Voids;
		opencascade::handle<StepShape_HArray1OfOrientedClosedShell> Voids();

		/****************** VoidsValue ******************/
		%feature("compactdefaultargs") VoidsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_OrientedClosedShell>
") VoidsValue;
		opencascade::handle<StepShape_OrientedClosedShell> VoidsValue(const Standard_Integer num);

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
		%feature("autodoc", "Returns a closedshell.

Returns
-------
None
") StepShape_ClosedShell;
		 StepShape_ClosedShell();

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
		/****************** StepShape_ConnectedFaceSubSet ******************/
		%feature("compactdefaultargs") StepShape_ConnectedFaceSubSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_ConnectedFaceSubSet;
		 StepShape_ConnectedFaceSubSet();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aConnectedFaceSet_CfsFaces: StepShape_HArray1OfFace
aParentFaceSet: StepShape_ConnectedFaceSet

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepShape_HArray1OfFace> & aConnectedFaceSet_CfsFaces, const opencascade::handle<StepShape_ConnectedFaceSet> & aParentFaceSet);

		/****************** ParentFaceSet ******************/
		%feature("compactdefaultargs") ParentFaceSet;
		%feature("autodoc", "Returns field parentfaceset.

Returns
-------
opencascade::handle<StepShape_ConnectedFaceSet>
") ParentFaceSet;
		opencascade::handle<StepShape_ConnectedFaceSet> ParentFaceSet();

		/****************** SetParentFaceSet ******************/
		%feature("compactdefaultargs") SetParentFaceSet;
		%feature("autodoc", "Set field parentfaceset.

Parameters
----------
ParentFaceSet: StepShape_ConnectedFaceSet

Returns
-------
None
") SetParentFaceSet;
		void SetParentFaceSet(const opencascade::handle<StepShape_ConnectedFaceSet> & ParentFaceSet);

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
		/****************** StepShape_EdgeCurve ******************/
		%feature("compactdefaultargs") StepShape_EdgeCurve;
		%feature("autodoc", "Returns a edgecurve.

Returns
-------
None
") StepShape_EdgeCurve;
		 StepShape_EdgeCurve();

		/****************** EdgeGeometry ******************/
		%feature("compactdefaultargs") EdgeGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Curve>
") EdgeGeometry;
		opencascade::handle<StepGeom_Curve> EdgeGeometry();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aEdgeStart: StepShape_Vertex
aEdgeEnd: StepShape_Vertex
aEdgeGeometry: StepGeom_Curve
aSameSense: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_Vertex> & aEdgeStart, const opencascade::handle<StepShape_Vertex> & aEdgeEnd, const opencascade::handle<StepGeom_Curve> & aEdgeGeometry, const Standard_Boolean aSameSense);

		/****************** SameSense ******************/
		%feature("compactdefaultargs") SameSense;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SameSense;
		Standard_Boolean SameSense();

		/****************** SetEdgeGeometry ******************/
		%feature("compactdefaultargs") SetEdgeGeometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEdgeGeometry: StepGeom_Curve

Returns
-------
None
") SetEdgeGeometry;
		void SetEdgeGeometry(const opencascade::handle<StepGeom_Curve> & aEdgeGeometry);

		/****************** SetSameSense ******************/
		%feature("compactdefaultargs") SetSameSense;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSameSense: bool

Returns
-------
None
") SetSameSense;
		void SetSameSense(const Standard_Boolean aSameSense);

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
		/****************** StepShape_EdgeLoop ******************/
		%feature("compactdefaultargs") StepShape_EdgeLoop;
		%feature("autodoc", "Returns a edgeloop.

Returns
-------
None
") StepShape_EdgeLoop;
		 StepShape_EdgeLoop();

		/****************** EdgeList ******************/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedEdge>
") EdgeList;
		opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList();

		/****************** EdgeListValue ******************/
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_OrientedEdge>
") EdgeListValue;
		opencascade::handle<StepShape_OrientedEdge> EdgeListValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aEdgeList: StepShape_HArray1OfOrientedEdge

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** NbEdgeList ******************/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdgeList;
		Standard_Integer NbEdgeList();

		/****************** SetEdgeList ******************/
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEdgeList: StepShape_HArray1OfOrientedEdge

Returns
-------
None
") SetEdgeList;
		void SetEdgeList(const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

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
		/****************** StepShape_ExtrudedAreaSolid ******************/
		%feature("compactdefaultargs") StepShape_ExtrudedAreaSolid;
		%feature("autodoc", "Returns a extrudedareasolid.

Returns
-------
None
") StepShape_ExtrudedAreaSolid;
		 StepShape_ExtrudedAreaSolid();

		/****************** Depth ******************/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Depth;
		Standard_Real Depth();

		/****************** ExtrudedDirection ******************/
		%feature("compactdefaultargs") ExtrudedDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Direction>
") ExtrudedDirection;
		opencascade::handle<StepGeom_Direction> ExtrudedDirection();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aSweptArea: StepGeom_CurveBoundedSurface
aExtrudedDirection: StepGeom_Direction
aDepth: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_CurveBoundedSurface> & aSweptArea, const opencascade::handle<StepGeom_Direction> & aExtrudedDirection, const Standard_Real aDepth);

		/****************** SetDepth ******************/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDepth: float

Returns
-------
None
") SetDepth;
		void SetDepth(const Standard_Real aDepth);

		/****************** SetExtrudedDirection ******************/
		%feature("compactdefaultargs") SetExtrudedDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
aExtrudedDirection: StepGeom_Direction

Returns
-------
None
") SetExtrudedDirection;
		void SetExtrudedDirection(const opencascade::handle<StepGeom_Direction> & aExtrudedDirection);

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
		/****************** StepShape_ExtrudedFaceSolid ******************/
		%feature("compactdefaultargs") StepShape_ExtrudedFaceSolid;
		%feature("autodoc", "Returns a extrudedfacesolid.

Returns
-------
None
") StepShape_ExtrudedFaceSolid;
		 StepShape_ExtrudedFaceSolid();

		/****************** Depth ******************/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Depth;
		Standard_Real Depth();

		/****************** ExtrudedDirection ******************/
		%feature("compactdefaultargs") ExtrudedDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Direction>
") ExtrudedDirection;
		opencascade::handle<StepGeom_Direction> ExtrudedDirection();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aSweptArea: StepShape_FaceSurface
aExtrudedDirection: StepGeom_Direction
aDepth: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_FaceSurface> & aSweptArea, const opencascade::handle<StepGeom_Direction> & aExtrudedDirection, const Standard_Real aDepth);

		/****************** SetDepth ******************/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDepth: float

Returns
-------
None
") SetDepth;
		void SetDepth(const Standard_Real aDepth);

		/****************** SetExtrudedDirection ******************/
		%feature("compactdefaultargs") SetExtrudedDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
aExtrudedDirection: StepGeom_Direction

Returns
-------
None
") SetExtrudedDirection;
		void SetExtrudedDirection(const opencascade::handle<StepGeom_Direction> & aExtrudedDirection);

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
		%feature("autodoc", "Returns a faceouterbound.

Returns
-------
None
") StepShape_FaceOuterBound;
		 StepShape_FaceOuterBound();

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
		/****************** StepShape_FaceSurface ******************/
		%feature("compactdefaultargs") StepShape_FaceSurface;
		%feature("autodoc", "Returns a facesurface.

Returns
-------
None
") StepShape_FaceSurface;
		 StepShape_FaceSurface();

		/****************** FaceGeometry ******************/
		%feature("compactdefaultargs") FaceGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Surface>
") FaceGeometry;
		opencascade::handle<StepGeom_Surface> FaceGeometry();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aBounds: StepShape_HArray1OfFaceBound
aFaceGeometry: StepGeom_Surface
aSameSense: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_HArray1OfFaceBound> & aBounds, const opencascade::handle<StepGeom_Surface> & aFaceGeometry, const Standard_Boolean aSameSense);

		/****************** SameSense ******************/
		%feature("compactdefaultargs") SameSense;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SameSense;
		Standard_Boolean SameSense();

		/****************** SetFaceGeometry ******************/
		%feature("compactdefaultargs") SetFaceGeometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFaceGeometry: StepGeom_Surface

Returns
-------
None
") SetFaceGeometry;
		void SetFaceGeometry(const opencascade::handle<StepGeom_Surface> & aFaceGeometry);

		/****************** SetSameSense ******************/
		%feature("compactdefaultargs") SetSameSense;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSameSense: bool

Returns
-------
None
") SetSameSense;
		void SetSameSense(const Standard_Boolean aSameSense);

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
		%feature("autodoc", "Returns a facetedbrep.

Returns
-------
None
") StepShape_FacetedBrep;
		 StepShape_FacetedBrep();

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
		/****************** StepShape_FacetedBrepAndBrepWithVoids ******************/
		%feature("compactdefaultargs") StepShape_FacetedBrepAndBrepWithVoids;
		%feature("autodoc", "Returns a facetedbrepandbrepwithvoids.

Returns
-------
None
") StepShape_FacetedBrepAndBrepWithVoids;
		 StepShape_FacetedBrepAndBrepWithVoids();

		/****************** BrepWithVoids ******************/
		%feature("compactdefaultargs") BrepWithVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_BrepWithVoids>
") BrepWithVoids;
		opencascade::handle<StepShape_BrepWithVoids> BrepWithVoids();

		/****************** FacetedBrep ******************/
		%feature("compactdefaultargs") FacetedBrep;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_FacetedBrep>
") FacetedBrep;
		opencascade::handle<StepShape_FacetedBrep> FacetedBrep();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aOuter: StepShape_ClosedShell
aFacetedBrep: StepShape_FacetedBrep
aBrepWithVoids: StepShape_BrepWithVoids

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_ClosedShell> & aOuter, const opencascade::handle<StepShape_FacetedBrep> & aFacetedBrep, const opencascade::handle<StepShape_BrepWithVoids> & aBrepWithVoids);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aOuter: StepShape_ClosedShell
aVoids: StepShape_HArray1OfOrientedClosedShell

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_ClosedShell> & aOuter, const opencascade::handle<StepShape_HArray1OfOrientedClosedShell> & aVoids);

		/****************** NbVoids ******************/
		%feature("compactdefaultargs") NbVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVoids;
		Standard_Integer NbVoids();

		/****************** SetBrepWithVoids ******************/
		%feature("compactdefaultargs") SetBrepWithVoids;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBrepWithVoids: StepShape_BrepWithVoids

Returns
-------
None
") SetBrepWithVoids;
		void SetBrepWithVoids(const opencascade::handle<StepShape_BrepWithVoids> & aBrepWithVoids);

		/****************** SetFacetedBrep ******************/
		%feature("compactdefaultargs") SetFacetedBrep;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFacetedBrep: StepShape_FacetedBrep

Returns
-------
None
") SetFacetedBrep;
		void SetFacetedBrep(const opencascade::handle<StepShape_FacetedBrep> & aFacetedBrep);

		/****************** SetVoids ******************/
		%feature("compactdefaultargs") SetVoids;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVoids: StepShape_HArray1OfOrientedClosedShell

Returns
-------
None
") SetVoids;
		void SetVoids(const opencascade::handle<StepShape_HArray1OfOrientedClosedShell> & aVoids);

		/****************** Voids ******************/
		%feature("compactdefaultargs") Voids;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedClosedShell>
") Voids;
		opencascade::handle<StepShape_HArray1OfOrientedClosedShell> Voids();

		/****************** VoidsValue ******************/
		%feature("compactdefaultargs") VoidsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_OrientedClosedShell>
") VoidsValue;
		opencascade::handle<StepShape_OrientedClosedShell> VoidsValue(const Standard_Integer num);

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
		%feature("autodoc", "Returns a openshell.

Returns
-------
None
") StepShape_OpenShell;
		 StepShape_OpenShell();

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
		/****************** StepShape_OrientedEdge ******************/
		%feature("compactdefaultargs") StepShape_OrientedEdge;
		%feature("autodoc", "Returns a orientededge.

Returns
-------
None
") StepShape_OrientedEdge;
		 StepShape_OrientedEdge();

		/****************** EdgeElement ******************/
		%feature("compactdefaultargs") EdgeElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Edge>
") EdgeElement;
		opencascade::handle<StepShape_Edge> EdgeElement();

		/****************** EdgeEnd ******************/
		%feature("compactdefaultargs") EdgeEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Vertex>
") EdgeEnd;
		virtual opencascade::handle<StepShape_Vertex> EdgeEnd();

		/****************** EdgeStart ******************/
		%feature("compactdefaultargs") EdgeStart;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Vertex>
") EdgeStart;
		virtual opencascade::handle<StepShape_Vertex> EdgeStart();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aEdgeElement: StepShape_Edge
aOrientation: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_Edge> & aEdgeElement, const Standard_Boolean aOrientation);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetEdgeElement ******************/
		%feature("compactdefaultargs") SetEdgeElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEdgeElement: StepShape_Edge

Returns
-------
None
") SetEdgeElement;
		void SetEdgeElement(const opencascade::handle<StepShape_Edge> & aEdgeElement);

		/****************** SetEdgeEnd ******************/
		%feature("compactdefaultargs") SetEdgeEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEdgeEnd: StepShape_Vertex

Returns
-------
None
") SetEdgeEnd;
		virtual void SetEdgeEnd(const opencascade::handle<StepShape_Vertex> & aEdgeEnd);

		/****************** SetEdgeStart ******************/
		%feature("compactdefaultargs") SetEdgeStart;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEdgeStart: StepShape_Vertex

Returns
-------
None
") SetEdgeStart;
		virtual void SetEdgeStart(const opencascade::handle<StepShape_Vertex> & aEdgeStart);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOrientation: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Standard_Boolean aOrientation);

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
		/****************** StepShape_OrientedFace ******************/
		%feature("compactdefaultargs") StepShape_OrientedFace;
		%feature("autodoc", "Returns a orientedface.

Returns
-------
None
") StepShape_OrientedFace;
		 StepShape_OrientedFace();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfFaceBound>
") Bounds;
		virtual opencascade::handle<StepShape_HArray1OfFaceBound> Bounds();

		/****************** BoundsValue ******************/
		%feature("compactdefaultargs") BoundsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_FaceBound>
") BoundsValue;
		virtual opencascade::handle<StepShape_FaceBound> BoundsValue(const Standard_Integer num);

		/****************** FaceElement ******************/
		%feature("compactdefaultargs") FaceElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Face>
") FaceElement;
		opencascade::handle<StepShape_Face> FaceElement();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aFaceElement: StepShape_Face
aOrientation: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_Face> & aFaceElement, const Standard_Boolean aOrientation);

		/****************** NbBounds ******************/
		%feature("compactdefaultargs") NbBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbBounds;
		virtual Standard_Integer NbBounds();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetBounds ******************/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBounds: StepShape_HArray1OfFaceBound

Returns
-------
None
") SetBounds;
		virtual void SetBounds(const opencascade::handle<StepShape_HArray1OfFaceBound> & aBounds);

		/****************** SetFaceElement ******************/
		%feature("compactdefaultargs") SetFaceElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFaceElement: StepShape_Face

Returns
-------
None
") SetFaceElement;
		void SetFaceElement(const opencascade::handle<StepShape_Face> & aFaceElement);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOrientation: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Standard_Boolean aOrientation);

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
		/****************** StepShape_OrientedPath ******************/
		%feature("compactdefaultargs") StepShape_OrientedPath;
		%feature("autodoc", "Returns a orientedpath.

Returns
-------
None
") StepShape_OrientedPath;
		 StepShape_OrientedPath();

		/****************** EdgeList ******************/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedEdge>
") EdgeList;
		virtual opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList();

		/****************** EdgeListValue ******************/
		%feature("compactdefaultargs") EdgeListValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_OrientedEdge>
") EdgeListValue;
		virtual opencascade::handle<StepShape_OrientedEdge> EdgeListValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aPathElement: StepShape_EdgeLoop
aOrientation: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_EdgeLoop> & aPathElement, const Standard_Boolean aOrientation);

		/****************** NbEdgeList ******************/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdgeList;
		virtual Standard_Integer NbEdgeList();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** PathElement ******************/
		%feature("compactdefaultargs") PathElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_EdgeLoop>
") PathElement;
		opencascade::handle<StepShape_EdgeLoop> PathElement();

		/****************** SetEdgeList ******************/
		%feature("compactdefaultargs") SetEdgeList;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEdgeList: StepShape_HArray1OfOrientedEdge

Returns
-------
None
") SetEdgeList;
		virtual void SetEdgeList(const opencascade::handle<StepShape_HArray1OfOrientedEdge> & aEdgeList);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOrientation: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Standard_Boolean aOrientation);

		/****************** SetPathElement ******************/
		%feature("compactdefaultargs") SetPathElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPathElement: StepShape_EdgeLoop

Returns
-------
None
") SetPathElement;
		void SetPathElement(const opencascade::handle<StepShape_EdgeLoop> & aPathElement);

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
		/****************** StepShape_PolyLoop ******************/
		%feature("compactdefaultargs") StepShape_PolyLoop;
		%feature("autodoc", "Returns a polyloop.

Returns
-------
None
") StepShape_PolyLoop;
		 StepShape_PolyLoop();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aPolygon: StepGeom_HArray1OfCartesianPoint

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_HArray1OfCartesianPoint> & aPolygon);

		/****************** NbPolygon ******************/
		%feature("compactdefaultargs") NbPolygon;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPolygon;
		Standard_Integer NbPolygon();

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_HArray1OfCartesianPoint>
") Polygon;
		opencascade::handle<StepGeom_HArray1OfCartesianPoint> Polygon();

		/****************** PolygonValue ******************/
		%feature("compactdefaultargs") PolygonValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepGeom_CartesianPoint>
") PolygonValue;
		opencascade::handle<StepGeom_CartesianPoint> PolygonValue(const Standard_Integer num);

		/****************** SetPolygon ******************/
		%feature("compactdefaultargs") SetPolygon;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPolygon: StepGeom_HArray1OfCartesianPoint

Returns
-------
None
") SetPolygon;
		void SetPolygon(const opencascade::handle<StepGeom_HArray1OfCartesianPoint> & aPolygon);

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
		/****************** StepShape_RevolvedAreaSolid ******************/
		%feature("compactdefaultargs") StepShape_RevolvedAreaSolid;
		%feature("autodoc", "Returns a revolvedareasolid.

Returns
-------
None
") StepShape_RevolvedAreaSolid;
		 StepShape_RevolvedAreaSolid();

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Axis;
		opencascade::handle<StepGeom_Axis1Placement> Axis();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aSweptArea: StepGeom_CurveBoundedSurface
aAxis: StepGeom_Axis1Placement
aAngle: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_CurveBoundedSurface> & aSweptArea, const opencascade::handle<StepGeom_Axis1Placement> & aAxis, const Standard_Real aAngle);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAngle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real aAngle);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAxis: StepGeom_Axis1Placement

Returns
-------
None
") SetAxis;
		void SetAxis(const opencascade::handle<StepGeom_Axis1Placement> & aAxis);

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
		/****************** StepShape_RevolvedFaceSolid ******************/
		%feature("compactdefaultargs") StepShape_RevolvedFaceSolid;
		%feature("autodoc", "Returns a revolvedfacesolid.

Returns
-------
None
") StepShape_RevolvedFaceSolid;
		 StepShape_RevolvedFaceSolid();

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Axis;
		opencascade::handle<StepGeom_Axis1Placement> Axis();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aSweptArea: StepShape_FaceSurface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_FaceSurface> & aSweptArea);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aSweptArea: StepShape_FaceSurface
aAxis: StepGeom_Axis1Placement
aAngle: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_FaceSurface> & aSweptArea, const opencascade::handle<StepGeom_Axis1Placement> & aAxis, const Standard_Real aAngle);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAngle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real aAngle);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAxis: StepGeom_Axis1Placement

Returns
-------
None
") SetAxis;
		void SetAxis(const opencascade::handle<StepGeom_Axis1Placement> & aAxis);

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
		/****************** StepShape_Subedge ******************/
		%feature("compactdefaultargs") StepShape_Subedge;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_Subedge;
		 StepShape_Subedge();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aEdge_EdgeStart: StepShape_Vertex
aEdge_EdgeEnd: StepShape_Vertex
aParentEdge: StepShape_Edge

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepShape_Vertex> & aEdge_EdgeStart, const opencascade::handle<StepShape_Vertex> & aEdge_EdgeEnd, const opencascade::handle<StepShape_Edge> & aParentEdge);

		/****************** ParentEdge ******************/
		%feature("compactdefaultargs") ParentEdge;
		%feature("autodoc", "Returns field parentedge.

Returns
-------
opencascade::handle<StepShape_Edge>
") ParentEdge;
		opencascade::handle<StepShape_Edge> ParentEdge();

		/****************** SetParentEdge ******************/
		%feature("compactdefaultargs") SetParentEdge;
		%feature("autodoc", "Set field parentedge.

Parameters
----------
ParentEdge: StepShape_Edge

Returns
-------
None
") SetParentEdge;
		void SetParentEdge(const opencascade::handle<StepShape_Edge> & ParentEdge);

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
		/****************** StepShape_Subface ******************/
		%feature("compactdefaultargs") StepShape_Subface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_Subface;
		 StepShape_Subface();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFace_Bounds: StepShape_HArray1OfFaceBound
aParentFace: StepShape_Face

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepShape_HArray1OfFaceBound> & aFace_Bounds, const opencascade::handle<StepShape_Face> & aParentFace);

		/****************** ParentFace ******************/
		%feature("compactdefaultargs") ParentFace;
		%feature("autodoc", "Returns field parentface.

Returns
-------
opencascade::handle<StepShape_Face>
") ParentFace;
		opencascade::handle<StepShape_Face> ParentFace();

		/****************** SetParentFace ******************/
		%feature("compactdefaultargs") SetParentFace;
		%feature("autodoc", "Set field parentface.

Parameters
----------
ParentFace: StepShape_Face

Returns
-------
None
") SetParentFace;
		void SetParentFace(const opencascade::handle<StepShape_Face> & ParentFace);

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
		/****************** StepShape_VertexLoop ******************/
		%feature("compactdefaultargs") StepShape_VertexLoop;
		%feature("autodoc", "Returns a vertexloop.

Returns
-------
None
") StepShape_VertexLoop;
		 StepShape_VertexLoop();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aLoopVertex: StepShape_Vertex

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_Vertex> & aLoopVertex);

		/****************** LoopVertex ******************/
		%feature("compactdefaultargs") LoopVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Vertex>
") LoopVertex;
		opencascade::handle<StepShape_Vertex> LoopVertex();

		/****************** SetLoopVertex ******************/
		%feature("compactdefaultargs") SetLoopVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLoopVertex: StepShape_Vertex

Returns
-------
None
") SetLoopVertex;
		void SetLoopVertex(const opencascade::handle<StepShape_Vertex> & aLoopVertex);

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
		/****************** StepShape_VertexPoint ******************/
		%feature("compactdefaultargs") StepShape_VertexPoint;
		%feature("autodoc", "Returns a vertexpoint.

Returns
-------
None
") StepShape_VertexPoint;
		 StepShape_VertexPoint();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aVertexGeometry: StepGeom_Point

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Point> & aVertexGeometry);

		/****************** SetVertexGeometry ******************/
		%feature("compactdefaultargs") SetVertexGeometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVertexGeometry: StepGeom_Point

Returns
-------
None
") SetVertexGeometry;
		void SetVertexGeometry(const opencascade::handle<StepGeom_Point> & aVertexGeometry);

		/****************** VertexGeometry ******************/
		%feature("compactdefaultargs") VertexGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Point>
") VertexGeometry;
		opencascade::handle<StepGeom_Point> VertexGeometry();

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
		%feature("autodoc", "Returns a advancedface.

Returns
-------
None
") StepShape_AdvancedFace;
		 StepShape_AdvancedFace();

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
		/****************** StepShape_OrientedClosedShell ******************/
		%feature("compactdefaultargs") StepShape_OrientedClosedShell;
		%feature("autodoc", "Returns a orientedclosedshell.

Returns
-------
None
") StepShape_OrientedClosedShell;
		 StepShape_OrientedClosedShell();

		/****************** CfsFaces ******************/
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfFace>
") CfsFaces;
		virtual opencascade::handle<StepShape_HArray1OfFace> CfsFaces();

		/****************** CfsFacesValue ******************/
		%feature("compactdefaultargs") CfsFacesValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_Face>
") CfsFacesValue;
		virtual opencascade::handle<StepShape_Face> CfsFacesValue(const Standard_Integer num);

		/****************** ClosedShellElement ******************/
		%feature("compactdefaultargs") ClosedShellElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_ClosedShell>
") ClosedShellElement;
		opencascade::handle<StepShape_ClosedShell> ClosedShellElement();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aClosedShellElement: StepShape_ClosedShell
aOrientation: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_ClosedShell> & aClosedShellElement, const Standard_Boolean aOrientation);

		/****************** NbCfsFaces ******************/
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetCfsFaces ******************/
		%feature("compactdefaultargs") SetCfsFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCfsFaces: StepShape_HArray1OfFace

Returns
-------
None
") SetCfsFaces;
		virtual void SetCfsFaces(const opencascade::handle<StepShape_HArray1OfFace> & aCfsFaces);

		/****************** SetClosedShellElement ******************/
		%feature("compactdefaultargs") SetClosedShellElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
aClosedShellElement: StepShape_ClosedShell

Returns
-------
None
") SetClosedShellElement;
		void SetClosedShellElement(const opencascade::handle<StepShape_ClosedShell> & aClosedShellElement);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOrientation: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Standard_Boolean aOrientation);

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
		/****************** StepShape_OrientedOpenShell ******************/
		%feature("compactdefaultargs") StepShape_OrientedOpenShell;
		%feature("autodoc", "Returns a orientedopenshell.

Returns
-------
None
") StepShape_OrientedOpenShell;
		 StepShape_OrientedOpenShell();

		/****************** CfsFaces ******************/
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfFace>
") CfsFaces;
		virtual opencascade::handle<StepShape_HArray1OfFace> CfsFaces();

		/****************** CfsFacesValue ******************/
		%feature("compactdefaultargs") CfsFacesValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepShape_Face>
") CfsFacesValue;
		virtual opencascade::handle<StepShape_Face> CfsFacesValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aOpenShellElement: StepShape_OpenShell
aOrientation: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepShape_OpenShell> & aOpenShellElement, const Standard_Boolean aOrientation);

		/****************** NbCfsFaces ******************/
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces();

		/****************** OpenShellElement ******************/
		%feature("compactdefaultargs") OpenShellElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_OpenShell>
") OpenShellElement;
		opencascade::handle<StepShape_OpenShell> OpenShellElement();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetCfsFaces ******************/
		%feature("compactdefaultargs") SetCfsFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCfsFaces: StepShape_HArray1OfFace

Returns
-------
None
") SetCfsFaces;
		virtual void SetCfsFaces(const opencascade::handle<StepShape_HArray1OfFace> & aCfsFaces);

		/****************** SetOpenShellElement ******************/
		%feature("compactdefaultargs") SetOpenShellElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOpenShellElement: StepShape_OpenShell

Returns
-------
None
") SetOpenShellElement;
		void SetOpenShellElement(const opencascade::handle<StepShape_OpenShell> & aOpenShellElement);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOrientation: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Standard_Boolean aOrientation);

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
		/****************** StepShape_SeamEdge ******************/
		%feature("compactdefaultargs") StepShape_SeamEdge;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_SeamEdge;
		 StepShape_SeamEdge();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aOrientedEdge_EdgeElement: StepShape_Edge
aOrientedEdge_Orientation: bool
aPcurveReference: StepGeom_Pcurve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepShape_Edge> & aOrientedEdge_EdgeElement, const Standard_Boolean aOrientedEdge_Orientation, const opencascade::handle<StepGeom_Pcurve> & aPcurveReference);

		/****************** PcurveReference ******************/
		%feature("compactdefaultargs") PcurveReference;
		%feature("autodoc", "Returns field pcurvereference.

Returns
-------
opencascade::handle<StepGeom_Pcurve>
") PcurveReference;
		opencascade::handle<StepGeom_Pcurve> PcurveReference();

		/****************** SetPcurveReference ******************/
		%feature("compactdefaultargs") SetPcurveReference;
		%feature("autodoc", "Set field pcurvereference.

Parameters
----------
PcurveReference: StepGeom_Pcurve

Returns
-------
None
") SetPcurveReference;
		void SetPcurveReference(const opencascade::handle<StepGeom_Pcurve> & PcurveReference);

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
