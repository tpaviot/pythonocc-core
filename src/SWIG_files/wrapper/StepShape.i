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
from enum import IntEnum
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

class StepShape_AngleRelator(IntEnum):
	StepShape_Equal = 0
	StepShape_Large = 1
	StepShape_Small = 2
StepShape_Equal = StepShape_AngleRelator.StepShape_Equal
StepShape_Large = StepShape_AngleRelator.StepShape_Large
StepShape_Small = StepShape_AngleRelator.StepShape_Small

class StepShape_BooleanOperator(IntEnum):
	StepShape_boDifference = 0
	StepShape_boIntersection = 1
	StepShape_boUnion = 2
StepShape_boDifference = StepShape_BooleanOperator.StepShape_boDifference
StepShape_boIntersection = StepShape_BooleanOperator.StepShape_boIntersection
StepShape_boUnion = StepShape_BooleanOperator.StepShape_boUnion
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
		/**** md5 signature: 6db340225ea4766c0839017e2f9a7cbd ****/
		%feature("compactdefaultargs") StepShape_Block;
		%feature("autodoc", "Returns a block.

Returns
-------
None
") StepShape_Block;
		 StepShape_Block();

		/****************** Init ******************/
		/**** md5 signature: c76beee8bc29e462a8e6c05250a357d6 ****/
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
		/**** md5 signature: 713393f125742d29dd4ad15bf921e26c ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis2Placement3d>
") Position;
		opencascade::handle<StepGeom_Axis2Placement3d> Position();

		/****************** SetPosition ******************/
		/**** md5 signature: cdf6c501d6290f351d285af3749a1167 ****/
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
		/**** md5 signature: 02cb0e3539e6b062d99f07cef9c7100a ****/
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
		/**** md5 signature: a92223e5030169abff888bfa87b3ac2e ****/
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
		/**** md5 signature: 2f0b912393dc71f7c38c47c52b326af5 ****/
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
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 87b89b9e016f37b0146cf52868684676 ****/
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
		/**** md5 signature: 2c3a9a46600e93e5a5be0ada693d97aa ****/
		%feature("compactdefaultargs") StepShape_BooleanOperand;
		%feature("autodoc", "Returns a booleanoperand selecttype.

Returns
-------
None
") StepShape_BooleanOperand;
		 StepShape_BooleanOperand();

		/****************** BooleanResult ******************/
		/**** md5 signature: 936cb49177830d9114b2b778741090de ****/
		%feature("compactdefaultargs") BooleanResult;
		%feature("autodoc", "Returns value as a booleanresult (null if another type).

Returns
-------
opencascade::handle<StepShape_BooleanResult>
") BooleanResult;
		opencascade::handle<StepShape_BooleanResult> BooleanResult();

		/****************** CsgPrimitive ******************/
		/**** md5 signature: e00c9a5971ab18cc33fa5abeb166281c ****/
		%feature("compactdefaultargs") CsgPrimitive;
		%feature("autodoc", "Returns value as a csgprimitive (null if another type) csgprimitive is another select type.

Returns
-------
StepShape_CsgPrimitive
") CsgPrimitive;
		StepShape_CsgPrimitive CsgPrimitive();

		/****************** HalfSpaceSolid ******************/
		/**** md5 signature: cb1dff70680f5fb9cefe28476ac90637 ****/
		%feature("compactdefaultargs") HalfSpaceSolid;
		%feature("autodoc", "Returns value as a halfspacesolid (null if another type).

Returns
-------
opencascade::handle<StepShape_HalfSpaceSolid>
") HalfSpaceSolid;
		opencascade::handle<StepShape_HalfSpaceSolid> HalfSpaceSolid();

		/****************** SetBooleanResult ******************/
		/**** md5 signature: 8063406dd7135e5b233a13506d119830 ****/
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
		/**** md5 signature: 1054e65e7d1ce0757a35c9539a6862d2 ****/
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
		/**** md5 signature: 5675189743d6ba4a899f4ee3aa75c228 ****/
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
		/**** md5 signature: 71230403e7a7ee0a671b5b87dedc152e ****/
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
		/**** md5 signature: 64ebf9bba16f3a3a03b5db3858660432 ****/
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
		/**** md5 signature: 5bdd7fa5a7b0835829bd2bdd7df6b60a ****/
		%feature("compactdefaultargs") SolidModel;
		%feature("autodoc", "Returns value as a solidmodel (null if another type).

Returns
-------
opencascade::handle<StepShape_SolidModel>
") SolidModel;
		opencascade::handle<StepShape_SolidModel> SolidModel();

		/****************** TypeOfContent ******************/
		/**** md5 signature: ca265bcca49d9306f069cd5137aa4464 ****/
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
		/**** md5 signature: fd3b423f1fd6f7dc920809d95dcd60c7 ****/
		%feature("compactdefaultargs") StepShape_BooleanResult;
		%feature("autodoc", "Returns a booleanresult.

Returns
-------
None
") StepShape_BooleanResult;
		 StepShape_BooleanResult();

		/****************** FirstOperand ******************/
		/**** md5 signature: bb511058a77731ecabf428cd68fdfa09 ****/
		%feature("compactdefaultargs") FirstOperand;
		%feature("autodoc", "No available documentation.

Returns
-------
StepShape_BooleanOperand
") FirstOperand;
		StepShape_BooleanOperand FirstOperand();

		/****************** Init ******************/
		/**** md5 signature: ed1dafcb00677c3482120de66c744302 ****/
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
		/**** md5 signature: d5f19901bad89bb2b978d40aa8deddcc ****/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
StepShape_BooleanOperator
") Operator;
		StepShape_BooleanOperator Operator();

		/****************** SecondOperand ******************/
		/**** md5 signature: 11e9978db226c73950611f3a07bb49be ****/
		%feature("compactdefaultargs") SecondOperand;
		%feature("autodoc", "No available documentation.

Returns
-------
StepShape_BooleanOperand
") SecondOperand;
		StepShape_BooleanOperand SecondOperand();

		/****************** SetFirstOperand ******************/
		/**** md5 signature: a88435b42783ab6be3b8e960265b236e ****/
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
		/**** md5 signature: 1e5d6952931ea0cd9ea299af454a779d ****/
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
		/**** md5 signature: 538a2a3c896399d37a802bd40ef21265 ****/
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
		/**** md5 signature: 2e6b9b41ba9ab55112491e9f8db805e2 ****/
		%feature("compactdefaultargs") StepShape_BoxDomain;
		%feature("autodoc", "Returns a boxdomain.

Returns
-------
None
") StepShape_BoxDomain;
		 StepShape_BoxDomain();

		/****************** Corner ******************/
		/**** md5 signature: 62c3e43ea6463e54d5eeb8e1f407f1a2 ****/
		%feature("compactdefaultargs") Corner;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_CartesianPoint>
") Corner;
		opencascade::handle<StepGeom_CartesianPoint> Corner();

		/****************** Init ******************/
		/**** md5 signature: 0b56f9ef99583eec43dc55a2a29782e4 ****/
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
		/**** md5 signature: 7e3619fe335983e3bacce9216a7a81a8 ****/
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
		/**** md5 signature: 229b158440b3041c34ee744f8461f442 ****/
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
		/**** md5 signature: 5f027226a33c6c9f34a098606e2e9699 ****/
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
		/**** md5 signature: 71c172d23a7c95aa9df38d09ab7b34eb ****/
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
		/**** md5 signature: ce67990e12cd771d97f643f8a8ffae48 ****/
		%feature("compactdefaultargs") Xlength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Xlength;
		Standard_Real Xlength();

		/****************** Ylength ******************/
		/**** md5 signature: 05adb1a279a2a723a9eaad9632c694de ****/
		%feature("compactdefaultargs") Ylength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Ylength;
		Standard_Real Ylength();

		/****************** Zlength ******************/
		/**** md5 signature: ea0e53d0a06ae7ec0b732e1f01fd1c9d ****/
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
		/**** md5 signature: e21579b29045d4ed5f8ef9bc423a739d ****/
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
		/**** md5 signature: 0d56fb9852e32d3fad8848b88ee0fe64 ****/
		%feature("compactdefaultargs") StepShape_ContextDependentShapeRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_ContextDependentShapeRepresentation;
		 StepShape_ContextDependentShapeRepresentation();

		/****************** Init ******************/
		/**** md5 signature: c77d68bee7bf14de2661575ea82d4058 ****/
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
		/**** md5 signature: 6dc94a1bdbc4fe79380db0fc9423bd9a ****/
		%feature("compactdefaultargs") RepresentationRelation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ShapeRepresentationRelationship>
") RepresentationRelation;
		opencascade::handle<StepRepr_ShapeRepresentationRelationship> RepresentationRelation();

		/****************** RepresentedProductRelation ******************/
		/**** md5 signature: 4ef204e164dacfb43a466203e6dbcf99 ****/
		%feature("compactdefaultargs") RepresentedProductRelation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionShape>
") RepresentedProductRelation;
		opencascade::handle<StepRepr_ProductDefinitionShape> RepresentedProductRelation();

		/****************** SetRepresentationRelation ******************/
		/**** md5 signature: 4b26da28ea0c3b861c1f5798539c3267 ****/
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
		/**** md5 signature: 4c1a30dccaf9a101ce6d4ca88004f17a ****/
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
		/**** md5 signature: 66cd629f562e40d65b8a8e8183abacc4 ****/
		%feature("compactdefaultargs") StepShape_CsgPrimitive;
		%feature("autodoc", "Returns a csgprimitive selecttype.

Returns
-------
None
") StepShape_CsgPrimitive;
		 StepShape_CsgPrimitive();

		/****************** Block ******************/
		/**** md5 signature: 6807083113fcea7280da6ec974793e3e ****/
		%feature("compactdefaultargs") Block;
		%feature("autodoc", "Returns value as a block (null if another type).

Returns
-------
opencascade::handle<StepShape_Block>
") Block;
		opencascade::handle<StepShape_Block> Block();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 8d890065e625dbe6820a13b7dccdbb19 ****/
		%feature("compactdefaultargs") RightAngularWedge;
		%feature("autodoc", "Returns value as a rightangularwedge (null if another type).

Returns
-------
opencascade::handle<StepShape_RightAngularWedge>
") RightAngularWedge;
		opencascade::handle<StepShape_RightAngularWedge> RightAngularWedge();

		/****************** RightCircularCone ******************/
		/**** md5 signature: 22b7fca30efc19a32fad78ee91d96441 ****/
		%feature("compactdefaultargs") RightCircularCone;
		%feature("autodoc", "Returns value as a rightcircularcone (null if another type).

Returns
-------
opencascade::handle<StepShape_RightCircularCone>
") RightCircularCone;
		opencascade::handle<StepShape_RightCircularCone> RightCircularCone();

		/****************** RightCircularCylinder ******************/
		/**** md5 signature: b5c3d463da16886620e5f0a587296c3d ****/
		%feature("compactdefaultargs") RightCircularCylinder;
		%feature("autodoc", "Returns value as a rightcircularcylinder (null if another type).

Returns
-------
opencascade::handle<StepShape_RightCircularCylinder>
") RightCircularCylinder;
		opencascade::handle<StepShape_RightCircularCylinder> RightCircularCylinder();

		/****************** Sphere ******************/
		/**** md5 signature: a553832d5d6bd7362b74ed7dd8abb6ee ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Returns value as a sphere (null if another type).

Returns
-------
opencascade::handle<StepShape_Sphere>
") Sphere;
		opencascade::handle<StepShape_Sphere> Sphere();

		/****************** Torus ******************/
		/**** md5 signature: 17757206a55791cc6c9f18f3c919b899 ****/
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
		/**** md5 signature: 1cde12de0f879823839b1aa41cc298d4 ****/
		%feature("compactdefaultargs") StepShape_CsgSelect;
		%feature("autodoc", "Returns a csgselect selecttype.

Returns
-------
None
") StepShape_CsgSelect;
		 StepShape_CsgSelect();

		/****************** BooleanResult ******************/
		/**** md5 signature: 936cb49177830d9114b2b778741090de ****/
		%feature("compactdefaultargs") BooleanResult;
		%feature("autodoc", "Returns value as a booleanresult (null if another type).

Returns
-------
opencascade::handle<StepShape_BooleanResult>
") BooleanResult;
		opencascade::handle<StepShape_BooleanResult> BooleanResult();

		/****************** CsgPrimitive ******************/
		/**** md5 signature: e00c9a5971ab18cc33fa5abeb166281c ****/
		%feature("compactdefaultargs") CsgPrimitive;
		%feature("autodoc", "Returns value as a csgprimitive (null if another type).

Returns
-------
StepShape_CsgPrimitive
") CsgPrimitive;
		StepShape_CsgPrimitive CsgPrimitive();

		/****************** SetBooleanResult ******************/
		/**** md5 signature: 8063406dd7135e5b233a13506d119830 ****/
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
		/**** md5 signature: 1054e65e7d1ce0757a35c9539a6862d2 ****/
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
		/**** md5 signature: 64ebf9bba16f3a3a03b5db3858660432 ****/
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
		/**** md5 signature: ca265bcca49d9306f069cd5137aa4464 ****/
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
		/**** md5 signature: 433fde4af2915e2bb9cc8fa4c11b0c16 ****/
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
		/**** md5 signature: cd3486e9d0ffd4fd32ba337a7b84941f ****/
		%feature("compactdefaultargs") StepShape_DimensionalCharacteristic;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalCharacteristic;
		 StepShape_DimensionalCharacteristic();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 9f4321c54d42036b4fc910a64a234600 ****/
		%feature("compactdefaultargs") DimensionalLocation;
		%feature("autodoc", "Returns value as dimensionallocation (or null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalLocation>
") DimensionalLocation;
		opencascade::handle<StepShape_DimensionalLocation> DimensionalLocation();

		/****************** DimensionalSize ******************/
		/**** md5 signature: b3d1e5ecfb9af68552cff269c1a5a7db ****/
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
		/**** md5 signature: 9424ebd935451b71a77e5c73b706cc49 ****/
		%feature("compactdefaultargs") StepShape_DimensionalCharacteristicRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalCharacteristicRepresentation;
		 StepShape_DimensionalCharacteristicRepresentation();

		/****************** Dimension ******************/
		/**** md5 signature: 40d2e931cc1c83a7256b47a0efc4d4ef ****/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Returns field dimension.

Returns
-------
StepShape_DimensionalCharacteristic
") Dimension;
		StepShape_DimensionalCharacteristic Dimension();

		/****************** Init ******************/
		/**** md5 signature: ea8a155a3a00afd150add80eaa017506 ****/
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
		/**** md5 signature: 6e322e562313498185dd0a2bf69ec8ac ****/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns field representation.

Returns
-------
opencascade::handle<StepShape_ShapeDimensionRepresentation>
") Representation;
		opencascade::handle<StepShape_ShapeDimensionRepresentation> Representation();

		/****************** SetDimension ******************/
		/**** md5 signature: fada4ec8a3aeb968060771e7c646d0fe ****/
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
		/**** md5 signature: ffc1d00d880e3d05174716214818cb0b ****/
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
		/**** md5 signature: 48f5af444d80de0e60abeabb4f500c64 ****/
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
		/**** md5 signature: 523a49c52b2df60dd7f512917392e871 ****/
		%feature("compactdefaultargs") StepShape_DimensionalSize;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalSize;
		 StepShape_DimensionalSize();

		/****************** AppliesTo ******************/
		/**** md5 signature: fbc592b24c41a2a4d6865e4603e6e87f ****/
		%feature("compactdefaultargs") AppliesTo;
		%feature("autodoc", "Returns field appliesto.

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") AppliesTo;
		opencascade::handle<StepRepr_ShapeAspect> AppliesTo();

		/****************** Init ******************/
		/**** md5 signature: c5affe217bc54e5e47925d14a500666c ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetAppliesTo ******************/
		/**** md5 signature: b712506f3b74966cebd0dceb9b451108 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 939c16c2d8689b0197f9ed59eecbd17d ****/
		%feature("compactdefaultargs") StepShape_EdgeBasedWireframeModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_EdgeBasedWireframeModel;
		 StepShape_EdgeBasedWireframeModel();

		/****************** EbwmBoundary ******************/
		/**** md5 signature: da2f1fe63244168588b1b4b3c55dece7 ****/
		%feature("compactdefaultargs") EbwmBoundary;
		%feature("autodoc", "Returns field ebwmboundary.

Returns
-------
opencascade::handle<StepShape_HArray1OfConnectedEdgeSet>
") EbwmBoundary;
		opencascade::handle<StepShape_HArray1OfConnectedEdgeSet> EbwmBoundary();

		/****************** Init ******************/
		/**** md5 signature: e1eef31d0f89d46803931e9cc424f35c ****/
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
		/**** md5 signature: 266ac741a96218bd04361ae2f8950735 ****/
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
		/**** md5 signature: cbc0644622b75e8d7346e9b3906c24f3 ****/
		%feature("compactdefaultargs") StepShape_FaceBasedSurfaceModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_FaceBasedSurfaceModel;
		 StepShape_FaceBasedSurfaceModel();

		/****************** FbsmFaces ******************/
		/**** md5 signature: f0003d5b4479fe6a9c8fd60a5c743cbd ****/
		%feature("compactdefaultargs") FbsmFaces;
		%feature("autodoc", "Returns field fbsmfaces.

Returns
-------
opencascade::handle<StepShape_HArray1OfConnectedFaceSet>
") FbsmFaces;
		opencascade::handle<StepShape_HArray1OfConnectedFaceSet> FbsmFaces();

		/****************** Init ******************/
		/**** md5 signature: bc6d8b381449330d5740e888859868ff ****/
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
		/**** md5 signature: dff5070e59f8079821a173286a8de307 ****/
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
		/**** md5 signature: 80a988004dfb6409fe99a0296684d508 ****/
		%feature("compactdefaultargs") StepShape_GeometricSet;
		%feature("autodoc", "Returns a geometricset.

Returns
-------
None
") StepShape_GeometricSet;
		 StepShape_GeometricSet();

		/****************** Elements ******************/
		/**** md5 signature: 38a8e570b20eba76f6fac400b06e25a2 ****/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfGeometricSetSelect>
") Elements;
		opencascade::handle<StepShape_HArray1OfGeometricSetSelect> Elements();

		/****************** ElementsValue ******************/
		/**** md5 signature: b843fcc67ebf985c06ed6a5176c14e9b ****/
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
		/**** md5 signature: 7e7a430ed1de43edada3713d649ff22a ****/
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
		/**** md5 signature: bda4abdd1e5bc28bcadae491494177fe ****/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbElements;
		Standard_Integer NbElements();

		/****************** SetElements ******************/
		/**** md5 signature: e66bcb53df8f8c086e4f936c7b9c3c48 ****/
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
		/**** md5 signature: d8ded3218e2de39eecf17d89c9a79782 ****/
		%feature("compactdefaultargs") StepShape_GeometricSetSelect;
		%feature("autodoc", "Returns a geometricsetselect selecttype.

Returns
-------
None
") StepShape_GeometricSetSelect;
		 StepShape_GeometricSetSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 29742eb86c60e95cfe724318fdd485f7 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns value as a curve (null if another type).

Returns
-------
opencascade::handle<StepGeom_Curve>
") Curve;
		opencascade::handle<StepGeom_Curve> Curve();

		/****************** Point ******************/
		/**** md5 signature: db63e48703c2eadc7e9f9f9f66bbb87d ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns value as a point (null if another type).

Returns
-------
opencascade::handle<StepGeom_Point>
") Point;
		opencascade::handle<StepGeom_Point> Point();

		/****************** Surface ******************/
		/**** md5 signature: c2398e6bbff81fe9609620c081466496 ****/
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
		/**** md5 signature: cf870ecacbf3dc6b7bed90af461026c7 ****/
		%feature("compactdefaultargs") StepShape_HalfSpaceSolid;
		%feature("autodoc", "Returns a halfspacesolid.

Returns
-------
None
") StepShape_HalfSpaceSolid;
		 StepShape_HalfSpaceSolid();

		/****************** AgreementFlag ******************/
		/**** md5 signature: 8b04579db7361451e8f23b9c89f50be8 ****/
		%feature("compactdefaultargs") AgreementFlag;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AgreementFlag;
		Standard_Boolean AgreementFlag();

		/****************** BaseSurface ******************/
		/**** md5 signature: b04fb8bbd601e9e73bc1f0cd379199de ****/
		%feature("compactdefaultargs") BaseSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Surface>
") BaseSurface;
		opencascade::handle<StepGeom_Surface> BaseSurface();

		/****************** Init ******************/
		/**** md5 signature: e4bb65b274276f6f9025836a9629f68b ****/
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
		/**** md5 signature: 9cf46b848d7dc31233772e392fb5cc8f ****/
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
		/**** md5 signature: 408569ff50581b62fcb0560e242897b6 ****/
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
		/**** md5 signature: 33c9647314cf457ee55391707b946438 ****/
		%feature("compactdefaultargs") StepShape_LimitsAndFits;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_LimitsAndFits;
		 StepShape_LimitsAndFits();

		/****************** FormVariance ******************/
		/**** md5 signature: 36ca825d4b05a885137411091b0b4d4c ****/
		%feature("compactdefaultargs") FormVariance;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FormVariance;
		opencascade::handle<TCollection_HAsciiString> FormVariance();

		/****************** Grade ******************/
		/**** md5 signature: 50a7c2372b6d7f9cc7e7c1765c552a07 ****/
		%feature("compactdefaultargs") Grade;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Grade;
		opencascade::handle<TCollection_HAsciiString> Grade();

		/****************** Init ******************/
		/**** md5 signature: 13ac4400dbb998ee74f7d8a758f30488 ****/
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
		/**** md5 signature: 7c680b050a668fe52574ecb95489afbe ****/
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
		/**** md5 signature: 7108dfd13e1eec89094905d4dcbbf2b0 ****/
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
		/**** md5 signature: 2a4009d9d2395f3b92f971af6e326153 ****/
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
		/**** md5 signature: 55d39989214de17f5a201c5171584e99 ****/
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
		/**** md5 signature: 11761fc70ff0a5837bb4209ca964e007 ****/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Source;
		opencascade::handle<TCollection_HAsciiString> Source();

		/****************** ZoneVariance ******************/
		/**** md5 signature: 63e53f55c3968da8de83a632dfd28a51 ****/
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
		/**** md5 signature: e641bc2640c3cafa41449e3cbcb076f1 ****/
		%feature("compactdefaultargs") StepShape_MeasureQualification;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_MeasureQualification;
		 StepShape_MeasureQualification();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		/**** md5 signature: 92e898fc7b473a7ce4e67630717433fd ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbQualifiers ******************/
		/**** md5 signature: 258f0b2eed3bf7fc2c402f8ee844defe ****/
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbQualifiers;
		Standard_Integer NbQualifiers();

		/****************** QualifiedMeasure ******************/
		/**** md5 signature: 93c8513871fd2d8ced038bcd7bea02df ****/
		%feature("compactdefaultargs") QualifiedMeasure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") QualifiedMeasure;
		opencascade::handle<StepBasic_MeasureWithUnit> QualifiedMeasure();

		/****************** Qualifiers ******************/
		/**** md5 signature: db76bd6ba663e85baa44919cc7af6b05 ****/
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfValueQualifier>
") Qualifiers;
		opencascade::handle<StepShape_HArray1OfValueQualifier> Qualifiers();

		/****************** QualifiersValue ******************/
		/**** md5 signature: d915ef6153300bbf48bd4a8a4ce90d04 ****/
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
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 1ba41e095c08297f6c7d78779b25ceb2 ****/
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
		/**** md5 signature: 52e1c72f673dbabad77679cd11862d6c ****/
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
		/**** md5 signature: 5e8388e6143ea875986ea400384a3f94 ****/
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
		/**** md5 signature: d88d3e71dd13cf86f2607c00cf87eaf0 ****/
		%feature("compactdefaultargs") StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem;
		 StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem();

		/****************** Init ******************/
		/**** md5 signature: 06e58608636022bba99d627e70ea259a ****/
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
		/**** md5 signature: cebce694e5bf47672e110f61cddfb670 ****/
		%feature("compactdefaultargs") Measure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") Measure;
		opencascade::handle<StepBasic_MeasureWithUnit> Measure();

		/****************** NbQualifiers ******************/
		/**** md5 signature: 258f0b2eed3bf7fc2c402f8ee844defe ****/
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbQualifiers;
		Standard_Integer NbQualifiers();

		/****************** Qualifiers ******************/
		/**** md5 signature: db76bd6ba663e85baa44919cc7af6b05 ****/
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfValueQualifier>
") Qualifiers;
		opencascade::handle<StepShape_HArray1OfValueQualifier> Qualifiers();

		/****************** QualifiersValue ******************/
		/**** md5 signature: d915ef6153300bbf48bd4a8a4ce90d04 ****/
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
		/**** md5 signature: 86afc1371188d09e472e16eae3622dde ****/
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
		/**** md5 signature: 52e1c72f673dbabad77679cd11862d6c ****/
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
		/**** md5 signature: 5e8388e6143ea875986ea400384a3f94 ****/
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
		/**** md5 signature: 7f3eaeb7c0bef31335738f42133fd5c8 ****/
		%feature("compactdefaultargs") StepShape_PlusMinusTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_PlusMinusTolerance;
		 StepShape_PlusMinusTolerance();

		/****************** Init ******************/
		/**** md5 signature: b1bc91370520e0768de04c8965898bb6 ****/
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
		/**** md5 signature: 2e7f08f1876fb19571e691d95cbd7540 ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "No available documentation.

Returns
-------
StepShape_ToleranceMethodDefinition
") Range;
		StepShape_ToleranceMethodDefinition Range();

		/****************** SetRange ******************/
		/**** md5 signature: 4276c063f70b5757973810168fd58d89 ****/
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
		/**** md5 signature: 22c2c770e1d3ec57330b8006f215afea ****/
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
		/**** md5 signature: d93f9df0558ec47c1504db75017ad004 ****/
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
		/**** md5 signature: 34e680362e93c24d7b49c6cc624c5307 ****/
		%feature("compactdefaultargs") StepShape_PrecisionQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_PrecisionQualifier;
		 StepShape_PrecisionQualifier();

		/****************** Init ******************/
		/**** md5 signature: 0defd7c439432b0600726883a7d7aa6b ****/
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
		/**** md5 signature: da540f26114bfd9de6ac56f04fa0763c ****/
		%feature("compactdefaultargs") PrecisionValue;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") PrecisionValue;
		Standard_Integer PrecisionValue();

		/****************** SetPrecisionValue ******************/
		/**** md5 signature: c358b4b5d703ba86f22d0e4041e9b972 ****/
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
		/**** md5 signature: 5bfb94e7036f65f38ac284278053508b ****/
		%feature("compactdefaultargs") StepShape_QualifiedRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_QualifiedRepresentationItem;
		 StepShape_QualifiedRepresentationItem();

		/****************** Init ******************/
		/**** md5 signature: 21c78b44fc7b48ecda18a2b5bc37ca7a ****/
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
		/**** md5 signature: 258f0b2eed3bf7fc2c402f8ee844defe ****/
		%feature("compactdefaultargs") NbQualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbQualifiers;
		Standard_Integer NbQualifiers();

		/****************** Qualifiers ******************/
		/**** md5 signature: db76bd6ba663e85baa44919cc7af6b05 ****/
		%feature("compactdefaultargs") Qualifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfValueQualifier>
") Qualifiers;
		opencascade::handle<StepShape_HArray1OfValueQualifier> Qualifiers();

		/****************** QualifiersValue ******************/
		/**** md5 signature: d915ef6153300bbf48bd4a8a4ce90d04 ****/
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
		/**** md5 signature: 52e1c72f673dbabad77679cd11862d6c ****/
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
		/**** md5 signature: 5e8388e6143ea875986ea400384a3f94 ****/
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
		/**** md5 signature: a3c26ffe52445be67b5062bf4c1ad327 ****/
		%feature("compactdefaultargs") StepShape_ReversibleTopologyItem;
		%feature("autodoc", "Returns a reversibletopologyitem selecttype.

Returns
-------
None
") StepShape_ReversibleTopologyItem;
		 StepShape_ReversibleTopologyItem();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 2d65970d6ce1d1039658d8fb7b61c087 ****/
		%feature("compactdefaultargs") ClosedShell;
		%feature("autodoc", "Returns value as a closedshell (null if another type).

Returns
-------
opencascade::handle<StepShape_ClosedShell>
") ClosedShell;
		opencascade::handle<StepShape_ClosedShell> ClosedShell();

		/****************** Edge ******************/
		/**** md5 signature: 6eccb4cb63dbfc116c3a6a3f77934b1d ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns value as a edge (null if another type).

Returns
-------
opencascade::handle<StepShape_Edge>
") Edge;
		opencascade::handle<StepShape_Edge> Edge();

		/****************** Face ******************/
		/**** md5 signature: cb3fb10fb42f13714d2b79863e6a19e2 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns value as a face (null if another type).

Returns
-------
opencascade::handle<StepShape_Face>
") Face;
		opencascade::handle<StepShape_Face> Face();

		/****************** FaceBound ******************/
		/**** md5 signature: f26bba69ddc3a90f5fe390e35d86d003 ****/
		%feature("compactdefaultargs") FaceBound;
		%feature("autodoc", "Returns value as a facebound (null if another type).

Returns
-------
opencascade::handle<StepShape_FaceBound>
") FaceBound;
		opencascade::handle<StepShape_FaceBound> FaceBound();

		/****************** OpenShell ******************/
		/**** md5 signature: e15047575419644b2285b9ff8143fc06 ****/
		%feature("compactdefaultargs") OpenShell;
		%feature("autodoc", "Returns value as a openshell (null if another type).

Returns
-------
opencascade::handle<StepShape_OpenShell>
") OpenShell;
		opencascade::handle<StepShape_OpenShell> OpenShell();

		/****************** Path ******************/
		/**** md5 signature: 70a013beb029bdf0f121d725b800b390 ****/
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
		/**** md5 signature: 4310be5b12754e418c5b32602e89d64d ****/
		%feature("compactdefaultargs") StepShape_RightAngularWedge;
		%feature("autodoc", "Returns a rightangularwedge.

Returns
-------
None
") StepShape_RightAngularWedge;
		 StepShape_RightAngularWedge();

		/****************** Init ******************/
		/**** md5 signature: 1b42c5563e795dd86ea067b0201d11ce ****/
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
		/**** md5 signature: dd73f00eee7e2cb9a608ca46e88f62b5 ****/
		%feature("compactdefaultargs") Ltx;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Ltx;
		Standard_Real Ltx();

		/****************** Position ******************/
		/**** md5 signature: 713393f125742d29dd4ad15bf921e26c ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis2Placement3d>
") Position;
		opencascade::handle<StepGeom_Axis2Placement3d> Position();

		/****************** SetLtx ******************/
		/**** md5 signature: e977cfd3df727219424a34e2c836c216 ****/
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
		/**** md5 signature: cdf6c501d6290f351d285af3749a1167 ****/
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
		/**** md5 signature: 02cb0e3539e6b062d99f07cef9c7100a ****/
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
		/**** md5 signature: a92223e5030169abff888bfa87b3ac2e ****/
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
		/**** md5 signature: 2f0b912393dc71f7c38c47c52b326af5 ****/
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
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 87b89b9e016f37b0146cf52868684676 ****/
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
		/**** md5 signature: 64844c2e3e7a493166904c9527da2a01 ****/
		%feature("compactdefaultargs") StepShape_RightCircularCone;
		%feature("autodoc", "Returns a rightcircularcone.

Returns
-------
None
") StepShape_RightCircularCone;
		 StepShape_RightCircularCone();

		/****************** Height ******************/
		/**** md5 signature: b7486e9db42a6b5d4ef64408e52d8a4b ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Init ******************/
		/**** md5 signature: eeebb23b814c89f9d4d2ff2f0d807d05 ****/
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
		/**** md5 signature: 918aab4ca578aee84a42715e0e4bc04d ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Position;
		opencascade::handle<StepGeom_Axis1Placement> Position();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SemiAngle ******************/
		/**** md5 signature: a49ed9cc6318be7aa50219450c80bb02 ****/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") SemiAngle;
		Standard_Real SemiAngle();

		/****************** SetHeight ******************/
		/**** md5 signature: b595945ce652624ed7910bc5ffdf66ae ****/
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
		/**** md5 signature: fdfcf5eaecc90e8d09f373ca67be8707 ****/
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
		/**** md5 signature: 75bdaaca53fe512f9758601eef8521b0 ****/
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
		/**** md5 signature: 4cae67aa8c3d2c284909ca56f055ccb0 ****/
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
		/**** md5 signature: 8c75a07e158c7efeaa78c276b000d3ec ****/
		%feature("compactdefaultargs") StepShape_RightCircularCylinder;
		%feature("autodoc", "Returns a rightcircularcylinder.

Returns
-------
None
") StepShape_RightCircularCylinder;
		 StepShape_RightCircularCylinder();

		/****************** Height ******************/
		/**** md5 signature: b7486e9db42a6b5d4ef64408e52d8a4b ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Init ******************/
		/**** md5 signature: e4a765d4bec535c304476caa45b09afe ****/
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
		/**** md5 signature: 918aab4ca578aee84a42715e0e4bc04d ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Position;
		opencascade::handle<StepGeom_Axis1Placement> Position();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetHeight ******************/
		/**** md5 signature: b595945ce652624ed7910bc5ffdf66ae ****/
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
		/**** md5 signature: fdfcf5eaecc90e8d09f373ca67be8707 ****/
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
		/**** md5 signature: 75bdaaca53fe512f9758601eef8521b0 ****/
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
		/**** md5 signature: 4b2bf92ad87962f993208301e66f03d5 ****/
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
		/**** md5 signature: b6483414f4cff3b04fab433b1f4feae7 ****/
		%feature("compactdefaultargs") StepShape_ShapeDimensionRepresentationItem;
		%feature("autodoc", "Returns a shapedimensionrepresentationitem select type.

Returns
-------
None
") StepShape_ShapeDimensionRepresentationItem;
		 StepShape_ShapeDimensionRepresentationItem();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: b772a37c4ce7cc97d17dfc99f4f1701c ****/
		%feature("compactdefaultargs") CompoundRepresentationItem;
		%feature("autodoc", "Returns value as a compoundrepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_CompoundRepresentationItem>
") CompoundRepresentationItem;
		opencascade::handle<StepRepr_CompoundRepresentationItem> CompoundRepresentationItem();

		/****************** DescriptiveRepresentationItem ******************/
		/**** md5 signature: 4b416f021b07f6695ff165a1f2e8b731 ****/
		%feature("compactdefaultargs") DescriptiveRepresentationItem;
		%feature("autodoc", "Returns value as a descriptiverepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_DescriptiveRepresentationItem>
") DescriptiveRepresentationItem;
		opencascade::handle<StepRepr_DescriptiveRepresentationItem> DescriptiveRepresentationItem();

		/****************** MeasureRepresentationItem ******************/
		/**** md5 signature: 935340871b120d19ae40bf488305af88 ****/
		%feature("compactdefaultargs") MeasureRepresentationItem;
		%feature("autodoc", "Returns value as a measurerepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_MeasureRepresentationItem>
") MeasureRepresentationItem;
		opencascade::handle<StepRepr_MeasureRepresentationItem> MeasureRepresentationItem();

		/****************** Placement ******************/
		/**** md5 signature: bd5accab02a906f6ba18e628ec47916e ****/
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
		/**** md5 signature: 6f04e04028267b737bdf902421dd1235 ****/
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
		/**** md5 signature: 9e5018be7ee8f9cf3138dbb09aaf6209 ****/
		%feature("compactdefaultargs") StepShape_Shell;
		%feature("autodoc", "Returns a shell selecttype.

Returns
-------
None
") StepShape_Shell;
		 StepShape_Shell();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 2d65970d6ce1d1039658d8fb7b61c087 ****/
		%feature("compactdefaultargs") ClosedShell;
		%feature("autodoc", "Returns value as a closedshell (null if another type).

Returns
-------
opencascade::handle<StepShape_ClosedShell>
") ClosedShell;
		opencascade::handle<StepShape_ClosedShell> ClosedShell();

		/****************** OpenShell ******************/
		/**** md5 signature: e15047575419644b2285b9ff8143fc06 ****/
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
		/**** md5 signature: bb8bfb5ba422c85158d17106eca2c6a9 ****/
		%feature("compactdefaultargs") StepShape_ShellBasedSurfaceModel;
		%feature("autodoc", "Returns a shellbasedsurfacemodel.

Returns
-------
None
") StepShape_ShellBasedSurfaceModel;
		 StepShape_ShellBasedSurfaceModel();

		/****************** Init ******************/
		/**** md5 signature: babcdcefbec0f9b8fee99991f7665d0a ****/
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
		/**** md5 signature: 1757c84b5952a71047c115df252dcf8c ****/
		%feature("compactdefaultargs") NbSbsmBoundary;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSbsmBoundary;
		Standard_Integer NbSbsmBoundary();

		/****************** SbsmBoundary ******************/
		/**** md5 signature: c1d06c2b5fe6a57ecec72e3980ae9d46 ****/
		%feature("compactdefaultargs") SbsmBoundary;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfShell>
") SbsmBoundary;
		opencascade::handle<StepShape_HArray1OfShell> SbsmBoundary();

		/****************** SbsmBoundaryValue ******************/
		/**** md5 signature: 6a3520cfcbeb49b4118ff4afc4d00924 ****/
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
		/**** md5 signature: 28179b46c336395857f73161dd442967 ****/
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
		/**** md5 signature: beeb325cbb099bc648ce193dcb555164 ****/
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
		/**** md5 signature: b8a94bc4629e435c473ef6e1ed090897 ****/
		%feature("compactdefaultargs") StepShape_Sphere;
		%feature("autodoc", "Returns a sphere.

Returns
-------
None
") StepShape_Sphere;
		 StepShape_Sphere();

		/****************** Centre ******************/
		/**** md5 signature: ff0fb1287b5cde8bc080d58fad25c0a8 ****/
		%feature("compactdefaultargs") Centre;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Point>
") Centre;
		opencascade::handle<StepGeom_Point> Centre();

		/****************** Init ******************/
		/**** md5 signature: c415b7217ed95fd8baa3cc4d7d466c46 ****/
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
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetCentre ******************/
		/**** md5 signature: 67782548b5af30d88b2d3f9a63d25857 ****/
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
		/**** md5 signature: 75bdaaca53fe512f9758601eef8521b0 ****/
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
		/**** md5 signature: 6311fd27355267591c50d27aaa3ac8fe ****/
		%feature("compactdefaultargs") StepShape_SurfaceModel;
		%feature("autodoc", "Returns a surfacemodel selecttype.

Returns
-------
None
") StepShape_SurfaceModel;
		 StepShape_SurfaceModel();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: aa3343fc93557e2b54e1f833462a8840 ****/
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
		/**** md5 signature: bee62b3b97f5ce8962e210d706e71338 ****/
		%feature("compactdefaultargs") StepShape_ToleranceMethodDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_ToleranceMethodDefinition;
		 StepShape_ToleranceMethodDefinition();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 1ab1b5daa9ab6dc771f9e703aa71f29c ****/
		%feature("compactdefaultargs") LimitsAndFits;
		%feature("autodoc", "Returns value as limitsandfits.

Returns
-------
opencascade::handle<StepShape_LimitsAndFits>
") LimitsAndFits;
		opencascade::handle<StepShape_LimitsAndFits> LimitsAndFits();

		/****************** ToleranceValue ******************/
		/**** md5 signature: 87c6f3e8f6307b06b700a15388442d70 ****/
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
		/**** md5 signature: 0ef25a10435f142efb4df604cb1bdc9a ****/
		%feature("compactdefaultargs") StepShape_ToleranceValue;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_ToleranceValue;
		 StepShape_ToleranceValue();

		/****************** Init ******************/
		/**** md5 signature: 4eb6dc5f5cf08c7fb2e5deaae3c7bed7 ****/
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
		/**** md5 signature: a0121849afc464f8cc9f38e49905265b ****/
		%feature("compactdefaultargs") LowerBound;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Transient>
") LowerBound;
		opencascade::handle<Standard_Transient> LowerBound();

		/****************** SetLowerBound ******************/
		/**** md5 signature: 85b28b56bdf5762dac4664e03949dc55 ****/
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
		/**** md5 signature: 7eb4dcd859dc96d6baebd106ac841b09 ****/
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
		/**** md5 signature: 7f5251dc232462e87a5f0025bd297a86 ****/
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
		/**** md5 signature: 46dbe8cb9914d4c8b9a9986639fcac63 ****/
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
		/**** md5 signature: ccf73bb0b7a71ddf736d492caa88f313 ****/
		%feature("compactdefaultargs") StepShape_Torus;
		%feature("autodoc", "Returns a torus.

Returns
-------
None
") StepShape_Torus;
		 StepShape_Torus();

		/****************** Init ******************/
		/**** md5 signature: eadfe0accb50124b1aee8e645603305c ****/
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
		/**** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: e1383e2287a25901af1e2b42cc95af4d ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Position ******************/
		/**** md5 signature: 918aab4ca578aee84a42715e0e4bc04d ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Position;
		opencascade::handle<StepGeom_Axis1Placement> Position();

		/****************** SetMajorRadius ******************/
		/**** md5 signature: 19063cd2e5c489f1f2f903c09d028591 ****/
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
		/**** md5 signature: 0929ce2e2ad5f01b2a0006efb5c74779 ****/
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
		/**** md5 signature: fdfcf5eaecc90e8d09f373ca67be8707 ****/
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
		/**** md5 signature: 161d564baaa463429c000c2091a2dd4b ****/
		%feature("compactdefaultargs") StepShape_TypeQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_TypeQualifier;
		 StepShape_TypeQualifier();

		/****************** Init ******************/
		/**** md5 signature: d5673a0aed03428a920ab03b9d356327 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 6518741aab4db4d5dcf19db9c25d518a ****/
		%feature("compactdefaultargs") StepShape_ValueFormatTypeQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_ValueFormatTypeQualifier;
		 StepShape_ValueFormatTypeQualifier();

		/****************** FormatType ******************/
		/**** md5 signature: cfaea7ad78352e8b3e55198d22572995 ****/
		%feature("compactdefaultargs") FormatType;
		%feature("autodoc", "Returns field formattype.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FormatType;
		opencascade::handle<TCollection_HAsciiString> FormatType();

		/****************** Init ******************/
		/**** md5 signature: 12ee23b91d7748b17508842b62fb6d40 ****/
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
		/**** md5 signature: 277a15fbd97073cbde80db83ebe63020 ****/
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
		/**** md5 signature: bcb5e4d986c13d5afac5c7dba3ca7801 ****/
		%feature("compactdefaultargs") StepShape_ValueQualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepShape_ValueQualifier;
		 StepShape_ValueQualifier();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: cf5430497780c213bc1fbd7ec7889e1c ****/
		%feature("compactdefaultargs") PrecisionQualifier;
		%feature("autodoc", "Returns value as precisionqualifier.

Returns
-------
opencascade::handle<StepShape_PrecisionQualifier>
") PrecisionQualifier;
		opencascade::handle<StepShape_PrecisionQualifier> PrecisionQualifier();

		/****************** TypeQualifier ******************/
		/**** md5 signature: 1f550abbe963a92ef273a1ba53ea7755 ****/
		%feature("compactdefaultargs") TypeQualifier;
		%feature("autodoc", "Returns value as typequalifier.

Returns
-------
opencascade::handle<StepShape_TypeQualifier>
") TypeQualifier;
		opencascade::handle<StepShape_TypeQualifier> TypeQualifier();

		/****************** ValueFormatTypeQualifier ******************/
		/**** md5 signature: 67bd3696d970bd9d9b645ec71aae2bf6 ****/
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
		/**** md5 signature: ed58329e9a739a8c36736441cfba8604 ****/
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
		/**** md5 signature: 3ba23a1053201ae211708edec1d696c3 ****/
		%feature("compactdefaultargs") StepShape_AngularLocation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_AngularLocation;
		 StepShape_AngularLocation();

		/****************** AngleSelection ******************/
		/**** md5 signature: 7b0a2df445a0c390a882488a93d8157a ****/
		%feature("compactdefaultargs") AngleSelection;
		%feature("autodoc", "Returns field angleselection.

Returns
-------
StepShape_AngleRelator
") AngleSelection;
		StepShape_AngleRelator AngleSelection();

		/****************** Init ******************/
		/**** md5 signature: e4f2cba7db8519ffd9a6bce95fbcb1ac ****/
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
		/**** md5 signature: a2b4d999fc24b95bc53e1a8aaaf424ea ****/
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
		/**** md5 signature: 22cb4ba120d4b84bd605507769592843 ****/
		%feature("compactdefaultargs") StepShape_AngularSize;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_AngularSize;
		 StepShape_AngularSize();

		/****************** AngleSelection ******************/
		/**** md5 signature: 7b0a2df445a0c390a882488a93d8157a ****/
		%feature("compactdefaultargs") AngleSelection;
		%feature("autodoc", "Returns field angleselection.

Returns
-------
StepShape_AngleRelator
") AngleSelection;
		StepShape_AngleRelator AngleSelection();

		/****************** Init ******************/
		/**** md5 signature: 4dfc7f6ed30752c9b2986dfad28656a2 ****/
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
		/**** md5 signature: a2b4d999fc24b95bc53e1a8aaaf424ea ****/
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
		/**** md5 signature: 95f97a8ada6b606f1ff746bfdc34cd51 ****/
		%feature("compactdefaultargs") StepShape_BoxedHalfSpace;
		%feature("autodoc", "Returns a boxedhalfspace.

Returns
-------
None
") StepShape_BoxedHalfSpace;
		 StepShape_BoxedHalfSpace();

		/****************** Enclosure ******************/
		/**** md5 signature: 4a009e61a3dc7c2e708fd49f1e679e88 ****/
		%feature("compactdefaultargs") Enclosure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_BoxDomain>
") Enclosure;
		opencascade::handle<StepShape_BoxDomain> Enclosure();

		/****************** Init ******************/
		/**** md5 signature: 01348f8395cf70ca7043ca64555c8b9a ****/
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
		/**** md5 signature: 95e32e90afd31415a4a8d4a80fb1c059 ****/
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
		/**** md5 signature: 1c3fe4b9a1e12a59609d3e64522d2290 ****/
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
		/**** md5 signature: cda7db1bb8f95e5ab24fad2c0ad2c6b8 ****/
		%feature("compactdefaultargs") StepShape_ConnectedEdgeSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_ConnectedEdgeSet;
		 StepShape_ConnectedEdgeSet();

		/****************** CesEdges ******************/
		/**** md5 signature: 7e018c003984ea736e031bfdd0965ab1 ****/
		%feature("compactdefaultargs") CesEdges;
		%feature("autodoc", "Returns field cesedges.

Returns
-------
opencascade::handle<StepShape_HArray1OfEdge>
") CesEdges;
		opencascade::handle<StepShape_HArray1OfEdge> CesEdges();

		/****************** Init ******************/
		/**** md5 signature: 9c989c2b875aa985d92c7fc01d36c9fb ****/
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
		/**** md5 signature: 66d189bb77366301218ed63f09b6004c ****/
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
		/**** md5 signature: 18d213aee5b6f7a389b52f4b74f98c66 ****/
		%feature("compactdefaultargs") StepShape_ConnectedFaceSet;
		%feature("autodoc", "Returns a connectedfaceset.

Returns
-------
None
") StepShape_ConnectedFaceSet;
		 StepShape_ConnectedFaceSet();

		/****************** CfsFaces ******************/
		/**** md5 signature: afaeff0a9d409daf11b0a02399d23bd5 ****/
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfFace>
") CfsFaces;
		virtual opencascade::handle<StepShape_HArray1OfFace> CfsFaces();

		/****************** CfsFacesValue ******************/
		/**** md5 signature: 466d34acaf469d11f6f1c0e29fe73313 ****/
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
		/**** md5 signature: d0d68be3daff7ff64423a93a520b0cb9 ****/
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
		/**** md5 signature: ae68772a1d19455ea3b16f5c681e5ac4 ****/
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces();

		/****************** SetCfsFaces ******************/
		/**** md5 signature: 2780a2f57758d8b7d3236b1241523af0 ****/
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
		/**** md5 signature: 918cff6ea0773a902a3df1d97becab18 ****/
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
		/**** md5 signature: 28f33ab90a8ed0f8ff25577da51da246 ****/
		%feature("compactdefaultargs") StepShape_CsgSolid;
		%feature("autodoc", "Returns a csgsolid.

Returns
-------
None
") StepShape_CsgSolid;
		 StepShape_CsgSolid();

		/****************** Init ******************/
		/**** md5 signature: 11cc784a740ca6d16b031443357443b8 ****/
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
		/**** md5 signature: 5fc25b5548a8f4d551bf7e50f5ae3ad7 ****/
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
		/**** md5 signature: cb275ca6ae73b5e6b562ef1495d869cd ****/
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
		/**** md5 signature: eaaf4926f7379d22cf8ef1c796ec7859 ****/
		%feature("compactdefaultargs") StepShape_DimensionalLocationWithPath;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalLocationWithPath;
		 StepShape_DimensionalLocationWithPath();

		/****************** Init ******************/
		/**** md5 signature: 542cb539fbe685cf6356df79c23494b2 ****/
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
		/**** md5 signature: 713772bfa292e0035d1282ffaea482a4 ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Returns field path.

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") Path;
		opencascade::handle<StepRepr_ShapeAspect> Path();

		/****************** SetPath ******************/
		/**** md5 signature: 241a227b433438ea95ff06afec85337e ****/
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
		/**** md5 signature: 17a7804bc39d5e3097954c519974d6a4 ****/
		%feature("compactdefaultargs") StepShape_DimensionalSizeWithPath;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_DimensionalSizeWithPath;
		 StepShape_DimensionalSizeWithPath();

		/****************** Init ******************/
		/**** md5 signature: b0699c07d94bd6a3dabb6411a9ed6dee ****/
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
		/**** md5 signature: 713772bfa292e0035d1282ffaea482a4 ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Returns field path.

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") Path;
		opencascade::handle<StepRepr_ShapeAspect> Path();

		/****************** SetPath ******************/
		/**** md5 signature: 241a227b433438ea95ff06afec85337e ****/
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
		/**** md5 signature: cbbea99857a4783e157a2ae3ca51ac08 ****/
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
		/**** md5 signature: 461e85914b5ac2613f1902f9fe223340 ****/
		%feature("compactdefaultargs") StepShape_Edge;
		%feature("autodoc", "Returns a edge.

Returns
-------
None
") StepShape_Edge;
		 StepShape_Edge();

		/****************** EdgeEnd ******************/
		/**** md5 signature: b59da77057ebed17c33adbae70c29832 ****/
		%feature("compactdefaultargs") EdgeEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Vertex>
") EdgeEnd;
		virtual opencascade::handle<StepShape_Vertex> EdgeEnd();

		/****************** EdgeStart ******************/
		/**** md5 signature: 27831da311d9b8fe5f46fdd0c07d6dec ****/
		%feature("compactdefaultargs") EdgeStart;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Vertex>
") EdgeStart;
		virtual opencascade::handle<StepShape_Vertex> EdgeStart();

		/****************** Init ******************/
		/**** md5 signature: 5fe4bf5257abf2d519f58a890f2030a4 ****/
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
		/**** md5 signature: 32605f8fad356dba0a329fc1a7b4e03d ****/
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
		/**** md5 signature: 3d590eac3c51dbc25fa0963bffa97225 ****/
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
		/**** md5 signature: 2fe1de0a8f11b12115d0f535f8fcac9e ****/
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
		/**** md5 signature: 7b7a04639ace35b0c3a429440ef6c7ca ****/
		%feature("compactdefaultargs") StepShape_Face;
		%feature("autodoc", "Returns a face.

Returns
-------
None
") StepShape_Face;
		 StepShape_Face();

		/****************** Bounds ******************/
		/**** md5 signature: 4515f8d5973c81fafdffc6ae3e5cc84e ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfFaceBound>
") Bounds;
		virtual opencascade::handle<StepShape_HArray1OfFaceBound> Bounds();

		/****************** BoundsValue ******************/
		/**** md5 signature: eb74d37e538c48b6a782434230722d17 ****/
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
		/**** md5 signature: d2d1dddbdab7edb03de197f48668a8a3 ****/
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
		/**** md5 signature: ba6842706132f743269de4e971a5015e ****/
		%feature("compactdefaultargs") NbBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbBounds;
		virtual Standard_Integer NbBounds();

		/****************** SetBounds ******************/
		/**** md5 signature: f60816a870a0f98672acc999fa7b750d ****/
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
		/**** md5 signature: ed56c708bb7310cb4a6d6572e7db8531 ****/
		%feature("compactdefaultargs") StepShape_FaceBound;
		%feature("autodoc", "Returns a facebound.

Returns
-------
None
") StepShape_FaceBound;
		 StepShape_FaceBound();

		/****************** Bound ******************/
		/**** md5 signature: 916713a5288b3e86d72c603c81400f18 ****/
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Loop>
") Bound;
		opencascade::handle<StepShape_Loop> Bound();

		/****************** Init ******************/
		/**** md5 signature: 0762e63b160d0ac1eacbda02296eef62 ****/
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
		/**** md5 signature: 52870aef84fd5af1a31fb4fa930c7f18 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetBound ******************/
		/**** md5 signature: ec5a38713386a1af500e6b0da5d83300 ****/
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
		/**** md5 signature: 6f9691e070f8a78a962e8069b1bcc7d0 ****/
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
		/**** md5 signature: f433a1277b2223b66180c510dc7c99bb ****/
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
		/**** md5 signature: d571f8aa55b6dce3e8aec740a82c9ac8 ****/
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
		/**** md5 signature: ea729716644d61eb23dcd866e558aa6b ****/
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
		/**** md5 signature: b9430a965c7b9b693d1ecb10ce387564 ****/
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
		/**** md5 signature: 23d48363f0f0a5edf75dca65a6202d84 ****/
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
		/**** md5 signature: 83e7b5b6ec67fb4c791ebdaaad936337 ****/
		%feature("compactdefaultargs") StepShape_LoopAndPath;
		%feature("autodoc", "Returns a loopandpath.

Returns
-------
None
") StepShape_LoopAndPath;
		 StepShape_LoopAndPath();

		/****************** EdgeList ******************/
		/**** md5 signature: 7059cc673bf899319cd93c43c3ea2f21 ****/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedEdge>
") EdgeList;
		opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList();

		/****************** EdgeListValue ******************/
		/**** md5 signature: 0d67ed1d1f47d10bdd669dfe1ab18741 ****/
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
		/**** md5 signature: a5dfc420b1f7aeca8ed3b47dc89a44b3 ****/
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
		/**** md5 signature: 7fe8de96530a82cd75bb2b8c929b072c ****/
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
		/**** md5 signature: f652913b7c4b894441725a83cb117195 ****/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Loop>
") Loop;
		opencascade::handle<StepShape_Loop> Loop();

		/****************** NbEdgeList ******************/
		/**** md5 signature: ed64407a13b02bbbcfdecd6e92bc43b5 ****/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdgeList;
		Standard_Integer NbEdgeList();

		/****************** Path ******************/
		/**** md5 signature: 70a013beb029bdf0f121d725b800b390 ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Path>
") Path;
		opencascade::handle<StepShape_Path> Path();

		/****************** SetEdgeList ******************/
		/**** md5 signature: 6a5df1246b2355adf84bf81d40677491 ****/
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
		/**** md5 signature: 3a2d8eadbfda92800e911c985713fe3c ****/
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
		/**** md5 signature: 5fb3a08dea47c3243c26c67f479e409b ****/
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
		/**** md5 signature: ac78dea473a8facd33dce0f039aa2974 ****/
		%feature("compactdefaultargs") StepShape_ManifoldSolidBrep;
		%feature("autodoc", "Returns a manifoldsolidbrep.

Returns
-------
None
") StepShape_ManifoldSolidBrep;
		 StepShape_ManifoldSolidBrep();

		/****************** Init ******************/
		/**** md5 signature: f4134c586a7826b01f01445c7498ae93 ****/
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
		/**** md5 signature: aeb67ff4d1cc74acb5e0fa252ac9f4c0 ****/
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
		/**** md5 signature: 3e45884f0f18f8aefd0978c54ecb443f ****/
		%feature("compactdefaultargs") Outer;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_ConnectedFaceSet>
") Outer;
		opencascade::handle<StepShape_ConnectedFaceSet> Outer();

		/****************** SetOuter ******************/
		/**** md5 signature: f8f81fa32b617979e082d298c93c5c5e ****/
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
		/**** md5 signature: b7a8e90762780de02b3b00a6b4ad00a4 ****/
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
		/**** md5 signature: 4d92cd8ef8ea3ddbd3797a4e6c17ee79 ****/
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
		/**** md5 signature: 885aa53448f5ccd3c9fe2a645e4291f9 ****/
		%feature("compactdefaultargs") StepShape_Path;
		%feature("autodoc", "Returns a path.

Returns
-------
None
") StepShape_Path;
		 StepShape_Path();

		/****************** EdgeList ******************/
		/**** md5 signature: d26f703a268a786f736dd75de6762c85 ****/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedEdge>
") EdgeList;
		virtual opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList();

		/****************** EdgeListValue ******************/
		/**** md5 signature: 48d12206608d94416dd74af995e65659 ****/
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
		/**** md5 signature: 7fe8de96530a82cd75bb2b8c929b072c ****/
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
		/**** md5 signature: 2b135593104de258fc3bbb1ae738707d ****/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdgeList;
		virtual Standard_Integer NbEdgeList();

		/****************** SetEdgeList ******************/
		/**** md5 signature: 7e591646abca4abf313b5bebb89276a2 ****/
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
		/**** md5 signature: 1d5efbc74dc739eec22b763769511d14 ****/
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
		/**** md5 signature: a3ea04d34cbfa8e5b000df35ee87d4ba ****/
		%feature("compactdefaultargs") StepShape_ShapeDimensionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_ShapeDimensionRepresentation;
		 StepShape_ShapeDimensionRepresentation();

		/****************** Init ******************/
		/**** md5 signature: 1739f1f045640a687c8df3c9459f73e0 ****/
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
		/**** md5 signature: 7cea80a52099fce7e99608aa8c3751bf ****/
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
		/**** md5 signature: c5013c74c7d36d8d4b8b7e5180eea8c1 ****/
		%feature("compactdefaultargs") ItemsAP242;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfShapeDimensionRepresentationItem>
") ItemsAP242;
		opencascade::handle<StepShape_HArray1OfShapeDimensionRepresentationItem> ItemsAP242();

		/****************** SetItemsAP242 ******************/
		/**** md5 signature: 2c022b02732d80531f2442353adb6ef1 ****/
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
		/**** md5 signature: fc915b075be8b03631388f71e15356c4 ****/
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
		/**** md5 signature: 1de1df1504081b9255a7ccd11618364a ****/
		%feature("compactdefaultargs") StepShape_SolidReplica;
		%feature("autodoc", "Returns a solidreplica.

Returns
-------
None
") StepShape_SolidReplica;
		 StepShape_SolidReplica();

		/****************** Init ******************/
		/**** md5 signature: b37ac445434a04a1962b1e1218bfddf5 ****/
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
		/**** md5 signature: ce5c844540926204ea208d77a212f676 ****/
		%feature("compactdefaultargs") ParentSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_SolidModel>
") ParentSolid;
		opencascade::handle<StepShape_SolidModel> ParentSolid();

		/****************** SetParentSolid ******************/
		/**** md5 signature: 1ab8d7645bffe23a3b5d12d75e731325 ****/
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
		/**** md5 signature: 43b9583a6f9680b7ec648567817072eb ****/
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
		/**** md5 signature: 7299aa422e83c646b54dcb0065f3d3a3 ****/
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
		/**** md5 signature: 31f8c4bfcdf08bb1c34d44926446ee4a ****/
		%feature("compactdefaultargs") StepShape_SweptAreaSolid;
		%feature("autodoc", "Returns a sweptareasolid.

Returns
-------
None
") StepShape_SweptAreaSolid;
		 StepShape_SweptAreaSolid();

		/****************** Init ******************/
		/**** md5 signature: cc5ae324f5a47b5393dc10fb5ddffdc0 ****/
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
		/**** md5 signature: 1b4f7f1c3803514b60199163c6c921b8 ****/
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
		/**** md5 signature: 216c4ed3a930883b5630452fa0e457d1 ****/
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
		/**** md5 signature: b4691fcdc43571f083a526a1e2ec11b1 ****/
		%feature("compactdefaultargs") StepShape_SweptFaceSolid;
		%feature("autodoc", "Returns a sweptfacesolid.

Returns
-------
None
") StepShape_SweptFaceSolid;
		 StepShape_SweptFaceSolid();

		/****************** Init ******************/
		/**** md5 signature: fe2b7c33719458fa1cf0a44dc72476d7 ****/
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
		/**** md5 signature: b9614e053c6fa75cee2ad34f1239d547 ****/
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
		/**** md5 signature: 7a3d8322e3544b8ba423e2f3765bea28 ****/
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
		/**** md5 signature: ebc44cdfc48c5329a317ace11db767df ****/
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
		/**** md5 signature: 239d141153607f24bc31b90b676c2682 ****/
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
		/**** md5 signature: f894636c903f51e6e65a8342f1627243 ****/
		%feature("compactdefaultargs") StepShape_BrepWithVoids;
		%feature("autodoc", "Returns a brepwithvoids.

Returns
-------
None
") StepShape_BrepWithVoids;
		 StepShape_BrepWithVoids();

		/****************** Init ******************/
		/**** md5 signature: 96c1459943706941f0f9d97f88a3cbfb ****/
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
		/**** md5 signature: 43d36e9e25be55a1423ccdb24beca7ff ****/
		%feature("compactdefaultargs") NbVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVoids;
		Standard_Integer NbVoids();

		/****************** SetVoids ******************/
		/**** md5 signature: 8a6633c74f222f4cf6e453fa9f474589 ****/
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
		/**** md5 signature: 63b6808712308ed5b0c78350606ed428 ****/
		%feature("compactdefaultargs") Voids;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedClosedShell>
") Voids;
		opencascade::handle<StepShape_HArray1OfOrientedClosedShell> Voids();

		/****************** VoidsValue ******************/
		/**** md5 signature: 069e7e54cebcabad7cb584ac4b644c9f ****/
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
		/**** md5 signature: 102587eeadfdcc06ec7627042e26376c ****/
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
		/**** md5 signature: 9143efbe3c561c5f42060c9a65ab18a9 ****/
		%feature("compactdefaultargs") StepShape_ConnectedFaceSubSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_ConnectedFaceSubSet;
		 StepShape_ConnectedFaceSubSet();

		/****************** Init ******************/
		/**** md5 signature: daa9019a2694912ae45ffa92151fcb09 ****/
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
		/**** md5 signature: fb7362a7a27a0c47b6febb2fb8adc703 ****/
		%feature("compactdefaultargs") ParentFaceSet;
		%feature("autodoc", "Returns field parentfaceset.

Returns
-------
opencascade::handle<StepShape_ConnectedFaceSet>
") ParentFaceSet;
		opencascade::handle<StepShape_ConnectedFaceSet> ParentFaceSet();

		/****************** SetParentFaceSet ******************/
		/**** md5 signature: 4462135d64e6be81933cf688d9779a7d ****/
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
		/**** md5 signature: bd4579df495e4438c3049cb2d73d2603 ****/
		%feature("compactdefaultargs") StepShape_EdgeCurve;
		%feature("autodoc", "Returns a edgecurve.

Returns
-------
None
") StepShape_EdgeCurve;
		 StepShape_EdgeCurve();

		/****************** EdgeGeometry ******************/
		/**** md5 signature: 9f53e3d90426754ec0201fc4f49a1964 ****/
		%feature("compactdefaultargs") EdgeGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Curve>
") EdgeGeometry;
		opencascade::handle<StepGeom_Curve> EdgeGeometry();

		/****************** Init ******************/
		/**** md5 signature: d1d4f44c89c9845370487fc5f432ce9b ****/
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
		/**** md5 signature: 738a5547658f3a15a3a7e5e372f16add ****/
		%feature("compactdefaultargs") SameSense;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SameSense;
		Standard_Boolean SameSense();

		/****************** SetEdgeGeometry ******************/
		/**** md5 signature: 9dbe98ecd62eb7d03a994c9c54a22742 ****/
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
		/**** md5 signature: 2608ebad93831004ef1c8f76b311e415 ****/
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
		/**** md5 signature: a6e17e45aab8cb3ea6341b5f030ee3a2 ****/
		%feature("compactdefaultargs") StepShape_EdgeLoop;
		%feature("autodoc", "Returns a edgeloop.

Returns
-------
None
") StepShape_EdgeLoop;
		 StepShape_EdgeLoop();

		/****************** EdgeList ******************/
		/**** md5 signature: 7059cc673bf899319cd93c43c3ea2f21 ****/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedEdge>
") EdgeList;
		opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList();

		/****************** EdgeListValue ******************/
		/**** md5 signature: 0d67ed1d1f47d10bdd669dfe1ab18741 ****/
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
		/**** md5 signature: 7fe8de96530a82cd75bb2b8c929b072c ****/
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
		/**** md5 signature: ed64407a13b02bbbcfdecd6e92bc43b5 ****/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdgeList;
		Standard_Integer NbEdgeList();

		/****************** SetEdgeList ******************/
		/**** md5 signature: 6a5df1246b2355adf84bf81d40677491 ****/
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
		/**** md5 signature: 643a49ec7bee54e4ca400c29d4e2e09c ****/
		%feature("compactdefaultargs") StepShape_ExtrudedAreaSolid;
		%feature("autodoc", "Returns a extrudedareasolid.

Returns
-------
None
") StepShape_ExtrudedAreaSolid;
		 StepShape_ExtrudedAreaSolid();

		/****************** Depth ******************/
		/**** md5 signature: de7560cf701656c85d7ea3c1f074fd03 ****/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Depth;
		Standard_Real Depth();

		/****************** ExtrudedDirection ******************/
		/**** md5 signature: f8e5bba2daff6b6bf9f6fb392a52aeb3 ****/
		%feature("compactdefaultargs") ExtrudedDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Direction>
") ExtrudedDirection;
		opencascade::handle<StepGeom_Direction> ExtrudedDirection();

		/****************** Init ******************/
		/**** md5 signature: 391ecfdd1e66114739547ae1f14d1a41 ****/
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
		/**** md5 signature: 4ed376ce95444c7357cf149677ef5fde ****/
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
		/**** md5 signature: 1c5f83c5d5063dc5c85f92609a3bd0f2 ****/
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
		/**** md5 signature: 8c02b626a42998e12ff270800b20a228 ****/
		%feature("compactdefaultargs") StepShape_ExtrudedFaceSolid;
		%feature("autodoc", "Returns a extrudedfacesolid.

Returns
-------
None
") StepShape_ExtrudedFaceSolid;
		 StepShape_ExtrudedFaceSolid();

		/****************** Depth ******************/
		/**** md5 signature: de7560cf701656c85d7ea3c1f074fd03 ****/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Depth;
		Standard_Real Depth();

		/****************** ExtrudedDirection ******************/
		/**** md5 signature: f8e5bba2daff6b6bf9f6fb392a52aeb3 ****/
		%feature("compactdefaultargs") ExtrudedDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Direction>
") ExtrudedDirection;
		opencascade::handle<StepGeom_Direction> ExtrudedDirection();

		/****************** Init ******************/
		/**** md5 signature: ae8da19f90d802f46ef36e81cb03ff12 ****/
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
		/**** md5 signature: 4ed376ce95444c7357cf149677ef5fde ****/
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
		/**** md5 signature: 1c5f83c5d5063dc5c85f92609a3bd0f2 ****/
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
		/**** md5 signature: abc6e7c1d0751817b2e120dcd79f4b0d ****/
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
		/**** md5 signature: db2bbe17c7c67f7266d106fc75c2e615 ****/
		%feature("compactdefaultargs") StepShape_FaceSurface;
		%feature("autodoc", "Returns a facesurface.

Returns
-------
None
") StepShape_FaceSurface;
		 StepShape_FaceSurface();

		/****************** FaceGeometry ******************/
		/**** md5 signature: 30d2e2711de2cb7a6f3bc16c0582f526 ****/
		%feature("compactdefaultargs") FaceGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Surface>
") FaceGeometry;
		opencascade::handle<StepGeom_Surface> FaceGeometry();

		/****************** Init ******************/
		/**** md5 signature: 5f9eafc4a41135bbcf8324be55b5fb08 ****/
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
		/**** md5 signature: 738a5547658f3a15a3a7e5e372f16add ****/
		%feature("compactdefaultargs") SameSense;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SameSense;
		Standard_Boolean SameSense();

		/****************** SetFaceGeometry ******************/
		/**** md5 signature: 6be62d344ee70b0abc5ab62db7d6820d ****/
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
		/**** md5 signature: 2608ebad93831004ef1c8f76b311e415 ****/
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
		/**** md5 signature: 6dc0963d1e1287777ec4f2ab8f3e73dd ****/
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
		/**** md5 signature: 512ecd5b6e2c2406ef681679e0612087 ****/
		%feature("compactdefaultargs") StepShape_FacetedBrepAndBrepWithVoids;
		%feature("autodoc", "Returns a facetedbrepandbrepwithvoids.

Returns
-------
None
") StepShape_FacetedBrepAndBrepWithVoids;
		 StepShape_FacetedBrepAndBrepWithVoids();

		/****************** BrepWithVoids ******************/
		/**** md5 signature: c5e21b1c3bd8f904d4a4fbd5996ba5cb ****/
		%feature("compactdefaultargs") BrepWithVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_BrepWithVoids>
") BrepWithVoids;
		opencascade::handle<StepShape_BrepWithVoids> BrepWithVoids();

		/****************** FacetedBrep ******************/
		/**** md5 signature: a9c1cc895ec000603d11774387aed412 ****/
		%feature("compactdefaultargs") FacetedBrep;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_FacetedBrep>
") FacetedBrep;
		opencascade::handle<StepShape_FacetedBrep> FacetedBrep();

		/****************** Init ******************/
		/**** md5 signature: 0e3231a7dd4a6884015c0db5130d3e80 ****/
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
		/**** md5 signature: 96c1459943706941f0f9d97f88a3cbfb ****/
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
		/**** md5 signature: 43d36e9e25be55a1423ccdb24beca7ff ****/
		%feature("compactdefaultargs") NbVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVoids;
		Standard_Integer NbVoids();

		/****************** SetBrepWithVoids ******************/
		/**** md5 signature: 000094cab3447dcc85652524599ab556 ****/
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
		/**** md5 signature: bc6610bfd52cb360b9901024d81b74ca ****/
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
		/**** md5 signature: 8a6633c74f222f4cf6e453fa9f474589 ****/
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
		/**** md5 signature: 63b6808712308ed5b0c78350606ed428 ****/
		%feature("compactdefaultargs") Voids;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedClosedShell>
") Voids;
		opencascade::handle<StepShape_HArray1OfOrientedClosedShell> Voids();

		/****************** VoidsValue ******************/
		/**** md5 signature: 069e7e54cebcabad7cb584ac4b644c9f ****/
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
		/**** md5 signature: 1b8de3db4ad00a7bf220bacef09cddd2 ****/
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
		/**** md5 signature: 8713397fe87f206b22cfc6bac5d6f630 ****/
		%feature("compactdefaultargs") StepShape_OrientedEdge;
		%feature("autodoc", "Returns a orientededge.

Returns
-------
None
") StepShape_OrientedEdge;
		 StepShape_OrientedEdge();

		/****************** EdgeElement ******************/
		/**** md5 signature: 9946a501ce95c77ec4c123f6f89176ed ****/
		%feature("compactdefaultargs") EdgeElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Edge>
") EdgeElement;
		opencascade::handle<StepShape_Edge> EdgeElement();

		/****************** EdgeEnd ******************/
		/**** md5 signature: c71f1ea527a26a3e63b9385e3ab5fbc9 ****/
		%feature("compactdefaultargs") EdgeEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Vertex>
") EdgeEnd;
		virtual opencascade::handle<StepShape_Vertex> EdgeEnd();

		/****************** EdgeStart ******************/
		/**** md5 signature: bdcd99e04dd03be5c8a81e37f1bdba23 ****/
		%feature("compactdefaultargs") EdgeStart;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Vertex>
") EdgeStart;
		virtual opencascade::handle<StepShape_Vertex> EdgeStart();

		/****************** Init ******************/
		/**** md5 signature: d724ac46cf806b472ecdb8f03fdf4bd3 ****/
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
		/**** md5 signature: 52870aef84fd5af1a31fb4fa930c7f18 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetEdgeElement ******************/
		/**** md5 signature: fdcfcef167d68c5092c15fafa27c2f13 ****/
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
		/**** md5 signature: 6cfa4e91dc48860a48ac90f310cad010 ****/
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
		/**** md5 signature: a1b8ce1a2ac98253db0e0880eb353332 ****/
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
		/**** md5 signature: 6f9691e070f8a78a962e8069b1bcc7d0 ****/
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
		/**** md5 signature: 6cf08b1ce0a1ead5dce076c6311a0337 ****/
		%feature("compactdefaultargs") StepShape_OrientedFace;
		%feature("autodoc", "Returns a orientedface.

Returns
-------
None
") StepShape_OrientedFace;
		 StepShape_OrientedFace();

		/****************** Bounds ******************/
		/**** md5 signature: ebc2031d8aa6db0f42e3454166b879b1 ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfFaceBound>
") Bounds;
		virtual opencascade::handle<StepShape_HArray1OfFaceBound> Bounds();

		/****************** BoundsValue ******************/
		/**** md5 signature: 847f17989726c809d4bfa2b7a23932f5 ****/
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
		/**** md5 signature: 451dd8f17aa20797dd37ac38b347b034 ****/
		%feature("compactdefaultargs") FaceElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Face>
") FaceElement;
		opencascade::handle<StepShape_Face> FaceElement();

		/****************** Init ******************/
		/**** md5 signature: ee419631284909206102fc950f9fbd1f ****/
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
		/**** md5 signature: 7eced1c3c834c876eb4528e637979e50 ****/
		%feature("compactdefaultargs") NbBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbBounds;
		virtual Standard_Integer NbBounds();

		/****************** Orientation ******************/
		/**** md5 signature: 52870aef84fd5af1a31fb4fa930c7f18 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetBounds ******************/
		/**** md5 signature: 5ac1b867a7655b708b375b64f020242d ****/
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
		/**** md5 signature: 4f96abb4f0ba73ab6f9930fbcc07e5f7 ****/
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
		/**** md5 signature: 6f9691e070f8a78a962e8069b1bcc7d0 ****/
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
		/**** md5 signature: 638469b2924301da2d1fa681f3ae02c9 ****/
		%feature("compactdefaultargs") StepShape_OrientedPath;
		%feature("autodoc", "Returns a orientedpath.

Returns
-------
None
") StepShape_OrientedPath;
		 StepShape_OrientedPath();

		/****************** EdgeList ******************/
		/**** md5 signature: 09301ae6ed85b2d655b74a0c10794c27 ****/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfOrientedEdge>
") EdgeList;
		virtual opencascade::handle<StepShape_HArray1OfOrientedEdge> EdgeList();

		/****************** EdgeListValue ******************/
		/**** md5 signature: bf48afbd82a21d0a1d5227ce0a124a70 ****/
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
		/**** md5 signature: 5b52fb65e9d760c46698e212cca14ac2 ****/
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
		/**** md5 signature: ca23197ee4ec843cc4d3a7ff580473d2 ****/
		%feature("compactdefaultargs") NbEdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdgeList;
		virtual Standard_Integer NbEdgeList();

		/****************** Orientation ******************/
		/**** md5 signature: 52870aef84fd5af1a31fb4fa930c7f18 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** PathElement ******************/
		/**** md5 signature: 59bec9a372bde8454753ed32eee5c884 ****/
		%feature("compactdefaultargs") PathElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_EdgeLoop>
") PathElement;
		opencascade::handle<StepShape_EdgeLoop> PathElement();

		/****************** SetEdgeList ******************/
		/**** md5 signature: 0c1a20a8a88ae402ca4248bc4c8b4202 ****/
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
		/**** md5 signature: 6f9691e070f8a78a962e8069b1bcc7d0 ****/
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
		/**** md5 signature: f455cbd9190424bd17cb213d187c852c ****/
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
		/**** md5 signature: 9c8db5451380660ce5a90c9ded2d5878 ****/
		%feature("compactdefaultargs") StepShape_PolyLoop;
		%feature("autodoc", "Returns a polyloop.

Returns
-------
None
") StepShape_PolyLoop;
		 StepShape_PolyLoop();

		/****************** Init ******************/
		/**** md5 signature: d12fecb2c1b75899baa1aca937dfc133 ****/
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
		/**** md5 signature: ef7a97dc4b942bf442319b75a65baf04 ****/
		%feature("compactdefaultargs") NbPolygon;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPolygon;
		Standard_Integer NbPolygon();

		/****************** Polygon ******************/
		/**** md5 signature: 12aa5f1e67f72665edac7a0d798bb40d ****/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_HArray1OfCartesianPoint>
") Polygon;
		opencascade::handle<StepGeom_HArray1OfCartesianPoint> Polygon();

		/****************** PolygonValue ******************/
		/**** md5 signature: 5b621a57e5f7ac2735286e2bc5d31a7b ****/
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
		/**** md5 signature: 6d6394f686952ae51be43dac564ae41f ****/
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
		/**** md5 signature: 5e7782f6cf88e4fd121ffd07e16ae238 ****/
		%feature("compactdefaultargs") StepShape_RevolvedAreaSolid;
		%feature("autodoc", "Returns a revolvedareasolid.

Returns
-------
None
") StepShape_RevolvedAreaSolid;
		 StepShape_RevolvedAreaSolid();

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Axis ******************/
		/**** md5 signature: c5d82199bce2fc1972c4d0bf0946e3b2 ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Axis;
		opencascade::handle<StepGeom_Axis1Placement> Axis();

		/****************** Init ******************/
		/**** md5 signature: dc3cb02984d59a4323acf5e0e873ac1a ****/
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
		/**** md5 signature: bae7a4d675d363cefe680523e72e869e ****/
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
		/**** md5 signature: 65b42bb2ca1d1ac71c758bb93fd8ddca ****/
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
		/**** md5 signature: 9f3de32f1e87a7b880811d2abb7cdd96 ****/
		%feature("compactdefaultargs") StepShape_RevolvedFaceSolid;
		%feature("autodoc", "Returns a revolvedfacesolid.

Returns
-------
None
") StepShape_RevolvedFaceSolid;
		 StepShape_RevolvedFaceSolid();

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Axis ******************/
		/**** md5 signature: c5d82199bce2fc1972c4d0bf0946e3b2 ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis1Placement>
") Axis;
		opencascade::handle<StepGeom_Axis1Placement> Axis();

		/****************** Init ******************/
		/**** md5 signature: fe2b7c33719458fa1cf0a44dc72476d7 ****/
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
		/**** md5 signature: 018bc86830d6474432d29853fe048946 ****/
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
		/**** md5 signature: bae7a4d675d363cefe680523e72e869e ****/
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
		/**** md5 signature: 65b42bb2ca1d1ac71c758bb93fd8ddca ****/
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
		/**** md5 signature: 6ab5a1a97add0f13cd4b575039716611 ****/
		%feature("compactdefaultargs") StepShape_Subedge;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_Subedge;
		 StepShape_Subedge();

		/****************** Init ******************/
		/**** md5 signature: c4d1dc76e0a3e6a1b5517ea4fa4f2eef ****/
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
		/**** md5 signature: ec23f654b0bb1f9e611201473ed4ee8e ****/
		%feature("compactdefaultargs") ParentEdge;
		%feature("autodoc", "Returns field parentedge.

Returns
-------
opencascade::handle<StepShape_Edge>
") ParentEdge;
		opencascade::handle<StepShape_Edge> ParentEdge();

		/****************** SetParentEdge ******************/
		/**** md5 signature: 39c595a9b2cb7a9331bbab3385bbe473 ****/
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
		/**** md5 signature: ba686ba0872922cd5ba7d6319e83324d ****/
		%feature("compactdefaultargs") StepShape_Subface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_Subface;
		 StepShape_Subface();

		/****************** Init ******************/
		/**** md5 signature: 9a0bfb744ac90fe5456f96969f483ba2 ****/
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
		/**** md5 signature: 51c5277caa4f09b077301c4e0e7e180b ****/
		%feature("compactdefaultargs") ParentFace;
		%feature("autodoc", "Returns field parentface.

Returns
-------
opencascade::handle<StepShape_Face>
") ParentFace;
		opencascade::handle<StepShape_Face> ParentFace();

		/****************** SetParentFace ******************/
		/**** md5 signature: eabf417f9e9acc1bd7c6722811cf8d57 ****/
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
		/**** md5 signature: 44d21e75f007bfa34c16f02faf3395fe ****/
		%feature("compactdefaultargs") StepShape_VertexLoop;
		%feature("autodoc", "Returns a vertexloop.

Returns
-------
None
") StepShape_VertexLoop;
		 StepShape_VertexLoop();

		/****************** Init ******************/
		/**** md5 signature: f8e904038955ca847b1e3514a0a56705 ****/
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
		/**** md5 signature: 293cfab3d5650b9cef17d416ac192acd ****/
		%feature("compactdefaultargs") LoopVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_Vertex>
") LoopVertex;
		opencascade::handle<StepShape_Vertex> LoopVertex();

		/****************** SetLoopVertex ******************/
		/**** md5 signature: f054309baa544bf01e17207db3f22629 ****/
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
		/**** md5 signature: f27b235d322cc7516e4f9872e9c46553 ****/
		%feature("compactdefaultargs") StepShape_VertexPoint;
		%feature("autodoc", "Returns a vertexpoint.

Returns
-------
None
") StepShape_VertexPoint;
		 StepShape_VertexPoint();

		/****************** Init ******************/
		/**** md5 signature: fd9bcb351a628224651d0178c0fbd875 ****/
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
		/**** md5 signature: 80d1ef41b1bac3c5866dfab5cff6bd47 ****/
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
		/**** md5 signature: 90336c9a62400b84625202f62f2b9879 ****/
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
		/**** md5 signature: c63f560831ecfd3983bdfa65d1c04c10 ****/
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
		/**** md5 signature: 4dd87013eb6e0d552f3288ea9b4fccdb ****/
		%feature("compactdefaultargs") StepShape_OrientedClosedShell;
		%feature("autodoc", "Returns a orientedclosedshell.

Returns
-------
None
") StepShape_OrientedClosedShell;
		 StepShape_OrientedClosedShell();

		/****************** CfsFaces ******************/
		/**** md5 signature: 2113b17f9f962175b52409fe74619d8b ****/
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfFace>
") CfsFaces;
		virtual opencascade::handle<StepShape_HArray1OfFace> CfsFaces();

		/****************** CfsFacesValue ******************/
		/**** md5 signature: e0e66a7aed6653f3091d9024f7051ac0 ****/
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
		/**** md5 signature: 5c1f8599769be2efee163dcf2de578aa ****/
		%feature("compactdefaultargs") ClosedShellElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_ClosedShell>
") ClosedShellElement;
		opencascade::handle<StepShape_ClosedShell> ClosedShellElement();

		/****************** Init ******************/
		/**** md5 signature: cbbae2107ed556a37034db279ab9fbda ****/
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
		/**** md5 signature: faf3b1196dda847054783ec0cb3f3fdf ****/
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces();

		/****************** Orientation ******************/
		/**** md5 signature: 52870aef84fd5af1a31fb4fa930c7f18 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetCfsFaces ******************/
		/**** md5 signature: 80fd7ec3be516188a38cc7f5dccaed97 ****/
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
		/**** md5 signature: fc53cd1031dc353a6c94705f98c71b4b ****/
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
		/**** md5 signature: 6f9691e070f8a78a962e8069b1bcc7d0 ****/
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
		/**** md5 signature: 0eb149dc40bf0bd50c8a04a9b6ee89ad ****/
		%feature("compactdefaultargs") StepShape_OrientedOpenShell;
		%feature("autodoc", "Returns a orientedopenshell.

Returns
-------
None
") StepShape_OrientedOpenShell;
		 StepShape_OrientedOpenShell();

		/****************** CfsFaces ******************/
		/**** md5 signature: 2113b17f9f962175b52409fe74619d8b ****/
		%feature("compactdefaultargs") CfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_HArray1OfFace>
") CfsFaces;
		virtual opencascade::handle<StepShape_HArray1OfFace> CfsFaces();

		/****************** CfsFacesValue ******************/
		/**** md5 signature: e0e66a7aed6653f3091d9024f7051ac0 ****/
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
		/**** md5 signature: c7f4aa3b7d0f37915793f4df05e53850 ****/
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
		/**** md5 signature: faf3b1196dda847054783ec0cb3f3fdf ****/
		%feature("compactdefaultargs") NbCfsFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCfsFaces;
		virtual Standard_Integer NbCfsFaces();

		/****************** OpenShellElement ******************/
		/**** md5 signature: 71bc62c85f2f9b31ef51fe749f03c760 ****/
		%feature("compactdefaultargs") OpenShellElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepShape_OpenShell>
") OpenShellElement;
		opencascade::handle<StepShape_OpenShell> OpenShellElement();

		/****************** Orientation ******************/
		/**** md5 signature: 52870aef84fd5af1a31fb4fa930c7f18 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetCfsFaces ******************/
		/**** md5 signature: 80fd7ec3be516188a38cc7f5dccaed97 ****/
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
		/**** md5 signature: b7d967d72833f8e5989bb20c977d4d6a ****/
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
		/**** md5 signature: 6f9691e070f8a78a962e8069b1bcc7d0 ****/
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
		/**** md5 signature: a2b681e1bd7253af27a1c181a1b57b9b ****/
		%feature("compactdefaultargs") StepShape_SeamEdge;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepShape_SeamEdge;
		 StepShape_SeamEdge();

		/****************** Init ******************/
		/**** md5 signature: 44730356750f3b276ac9107496e23c68 ****/
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
		/**** md5 signature: 6c85179dc2cfa34e53057f25ff967ab7 ****/
		%feature("compactdefaultargs") PcurveReference;
		%feature("autodoc", "Returns field pcurvereference.

Returns
-------
opencascade::handle<StepGeom_Pcurve>
") PcurveReference;
		opencascade::handle<StepGeom_Pcurve> PcurveReference();

		/****************** SetPcurveReference ******************/
		/**** md5 signature: 3a145cb69cb5d5711b8b1cb00a266267 ****/
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

class StepShape_HArray1OfConnectedEdgeSet : public StepShape_Array1OfConnectedEdgeSet, public Standard_Transient {
  public:
    StepShape_HArray1OfConnectedEdgeSet(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfConnectedEdgeSet(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfConnectedEdgeSet::value_type& theValue);
    StepShape_HArray1OfConnectedEdgeSet(const StepShape_Array1OfConnectedEdgeSet& theOther);
    const StepShape_Array1OfConnectedEdgeSet& Array1();
    StepShape_Array1OfConnectedEdgeSet& ChangeArray1();
};
%make_alias(StepShape_HArray1OfConnectedEdgeSet)


class StepShape_HArray1OfFaceBound : public StepShape_Array1OfFaceBound, public Standard_Transient {
  public:
    StepShape_HArray1OfFaceBound(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfFaceBound(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfFaceBound::value_type& theValue);
    StepShape_HArray1OfFaceBound(const StepShape_Array1OfFaceBound& theOther);
    const StepShape_Array1OfFaceBound& Array1();
    StepShape_Array1OfFaceBound& ChangeArray1();
};
%make_alias(StepShape_HArray1OfFaceBound)


class StepShape_HArray1OfGeometricSetSelect : public StepShape_Array1OfGeometricSetSelect, public Standard_Transient {
  public:
    StepShape_HArray1OfGeometricSetSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfGeometricSetSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfGeometricSetSelect::value_type& theValue);
    StepShape_HArray1OfGeometricSetSelect(const StepShape_Array1OfGeometricSetSelect& theOther);
    const StepShape_Array1OfGeometricSetSelect& Array1();
    StepShape_Array1OfGeometricSetSelect& ChangeArray1();
};
%make_alias(StepShape_HArray1OfGeometricSetSelect)


class StepShape_HArray1OfConnectedFaceSet : public StepShape_Array1OfConnectedFaceSet, public Standard_Transient {
  public:
    StepShape_HArray1OfConnectedFaceSet(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfConnectedFaceSet(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfConnectedFaceSet::value_type& theValue);
    StepShape_HArray1OfConnectedFaceSet(const StepShape_Array1OfConnectedFaceSet& theOther);
    const StepShape_Array1OfConnectedFaceSet& Array1();
    StepShape_Array1OfConnectedFaceSet& ChangeArray1();
};
%make_alias(StepShape_HArray1OfConnectedFaceSet)


class StepShape_HArray1OfEdge : public StepShape_Array1OfEdge, public Standard_Transient {
  public:
    StepShape_HArray1OfEdge(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfEdge(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfEdge::value_type& theValue);
    StepShape_HArray1OfEdge(const StepShape_Array1OfEdge& theOther);
    const StepShape_Array1OfEdge& Array1();
    StepShape_Array1OfEdge& ChangeArray1();
};
%make_alias(StepShape_HArray1OfEdge)


class StepShape_HArray1OfFace : public StepShape_Array1OfFace, public Standard_Transient {
  public:
    StepShape_HArray1OfFace(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfFace(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfFace::value_type& theValue);
    StepShape_HArray1OfFace(const StepShape_Array1OfFace& theOther);
    const StepShape_Array1OfFace& Array1();
    StepShape_Array1OfFace& ChangeArray1();
};
%make_alias(StepShape_HArray1OfFace)


class StepShape_HArray1OfShapeDimensionRepresentationItem : public StepShape_Array1OfShapeDimensionRepresentationItem, public Standard_Transient {
  public:
    StepShape_HArray1OfShapeDimensionRepresentationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfShapeDimensionRepresentationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfShapeDimensionRepresentationItem::value_type& theValue);
    StepShape_HArray1OfShapeDimensionRepresentationItem(const StepShape_Array1OfShapeDimensionRepresentationItem& theOther);
    const StepShape_Array1OfShapeDimensionRepresentationItem& Array1();
    StepShape_Array1OfShapeDimensionRepresentationItem& ChangeArray1();
};
%make_alias(StepShape_HArray1OfShapeDimensionRepresentationItem)


class StepShape_HArray1OfValueQualifier : public StepShape_Array1OfValueQualifier, public Standard_Transient {
  public:
    StepShape_HArray1OfValueQualifier(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfValueQualifier(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfValueQualifier::value_type& theValue);
    StepShape_HArray1OfValueQualifier(const StepShape_Array1OfValueQualifier& theOther);
    const StepShape_Array1OfValueQualifier& Array1();
    StepShape_Array1OfValueQualifier& ChangeArray1();
};
%make_alias(StepShape_HArray1OfValueQualifier)


class StepShape_HArray1OfShell : public StepShape_Array1OfShell, public Standard_Transient {
  public:
    StepShape_HArray1OfShell(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfShell(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfShell::value_type& theValue);
    StepShape_HArray1OfShell(const StepShape_Array1OfShell& theOther);
    const StepShape_Array1OfShell& Array1();
    StepShape_Array1OfShell& ChangeArray1();
};
%make_alias(StepShape_HArray1OfShell)


class StepShape_HArray1OfOrientedClosedShell : public StepShape_Array1OfOrientedClosedShell, public Standard_Transient {
  public:
    StepShape_HArray1OfOrientedClosedShell(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfOrientedClosedShell(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfOrientedClosedShell::value_type& theValue);
    StepShape_HArray1OfOrientedClosedShell(const StepShape_Array1OfOrientedClosedShell& theOther);
    const StepShape_Array1OfOrientedClosedShell& Array1();
    StepShape_Array1OfOrientedClosedShell& ChangeArray1();
};
%make_alias(StepShape_HArray1OfOrientedClosedShell)


class StepShape_HArray1OfOrientedEdge : public StepShape_Array1OfOrientedEdge, public Standard_Transient {
  public:
    StepShape_HArray1OfOrientedEdge(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepShape_HArray1OfOrientedEdge(const Standard_Integer theLower, const Standard_Integer theUpper, const StepShape_Array1OfOrientedEdge::value_type& theValue);
    StepShape_HArray1OfOrientedEdge(const StepShape_Array1OfOrientedEdge& theOther);
    const StepShape_Array1OfOrientedEdge& Array1();
    StepShape_Array1OfOrientedEdge& ChangeArray1();
};
%make_alias(StepShape_HArray1OfOrientedEdge)

/* harray2 classes */
/* hsequence classes */
