##Copyright 2026 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

"""The providers of the DE (data exchange) framework, one per format"""

import importlib
from pathlib import Path

import pytest
from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Core.DE import DE_Wrapper
from OCC.Core.DESTEP import DESTEP_ConfigurationNode, DESTEP_Parameters
from OCC.Core.Interface import Interface_Static
from OCC.Core.STEPControl import STEPControl_AsIs, STEPControl_Writer
from OCC.Core.TDF import TDF_LabelSequence
from OCC.Core.TDocStd import TDocStd_Document
from OCC.Core.TopAbs import TopAbs_COMPOUND, TopAbs_FACE, TopAbs_SOLID
from OCC.Core.TopoDS import TopoDS_Shape
from OCC.Core.UnitsMethods import UnitsMethods_LengthUnit_Meter
from OCC.Core.XCAFDoc import XCAFDoc_DocumentTool

# module, file extension, format, type of the shape read back (None: export
# only)
SHAPE_PROVIDERS = [
    ("DEBREP", "brep", "BREP", TopAbs_SOLID),
    ("DESTEP", "step", "STEP", TopAbs_SOLID),
    ("DEIGES", "iges", "IGES", TopAbs_COMPOUND),
    ("DESTL", "stl", "STL", TopAbs_FACE),
    ("DEVRML", "wrl", "VRML", TopAbs_COMPOUND),
    ("DEOBJ", "obj", "OBJ", TopAbs_FACE),
    ("DEPLY", "ply", "PLY", None),
    ("DEGLTF", "glb", "GLTF", TopAbs_COMPOUND),
]


@pytest.fixture
def meshed_box() -> TopoDS_Shape:
    box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    # the mesh based formats write the triangulation
    BRepMesh_IncrementalMesh(box, 0.5)
    return box


def make_provider(module_name: str):
    module = importlib.import_module(f"OCC.Core.{module_name}")
    node = getattr(module, f"{module_name}_ConfigurationNode")()
    return node, getattr(module, f"{module_name}_Provider")(node)


@pytest.mark.parametrize(
    ("module_name", "extension", "file_format", "shape_type"), SHAPE_PROVIDERS
)
def test_shape_provider(
    tmp_path: Path, meshed_box, module_name, extension, file_format, shape_type
) -> None:
    node, provider = make_provider(module_name)
    assert provider.GetFormat() == file_format
    assert node.IsExportSupported()
    file_name = str(tmp_path / f"box.{extension}")
    assert provider.Write(file_name, meshed_box)
    assert Path(file_name).stat().st_size > 0
    assert node.IsImportSupported() == (shape_type is not None)
    if shape_type is not None:
        shape = TopoDS_Shape()
        assert provider.Read(file_name, shape)
        assert shape.ShapeType() == shape_type


def test_xcaf_provider(tmp_path: Path, meshed_box) -> None:
    _, provider = make_provider("DEXCAF")
    document = TDocStd_Document("BinXCAF")
    XCAFDoc_DocumentTool.ShapeTool(document.Main()).AddShape(meshed_box)
    file_name = str(tmp_path / "box.xbf")
    assert provider.Write(file_name, document)
    read_document = TDocStd_Document("BinXCAF")
    assert provider.Read(file_name, read_document)
    labels = TDF_LabelSequence()
    XCAFDoc_DocumentTool.ShapeTool(read_document.Main()).GetFreeShapes(labels)
    assert labels.Length() == 1


def test_de_wrapper_dispatch(tmp_path: Path, meshed_box) -> None:
    # the wrapper chooses the provider from the file extension
    wrapper = DE_Wrapper()
    assert wrapper.Bind(DESTEP_ConfigurationNode())
    file_name = str(tmp_path / "box.step")
    assert wrapper.Write(file_name, meshed_box)
    shape = TopoDS_Shape()
    assert wrapper.Read(file_name, shape)
    assert shape.ShapeType() == TopAbs_SOLID


def test_step_parameters_fields(tmp_path: Path, meshed_box) -> None:
    # the parameters are passed to the writer, the global ones are unchanged
    params = DESTEP_Parameters()
    assert params.WriteSchema == DESTEP_Parameters.WriteMode_StepSchema_AP214IS
    params.WriteSchema = DESTEP_Parameters.WriteMode_StepSchema_AP242DIS
    params.WriteProductName = "box"
    assert params.WriteProductName == "box"
    params.WriteUnit = UnitsMethods_LengthUnit_Meter
    assert params.WriteUnit == UnitsMethods_LengthUnit_Meter
    schema = Interface_Static.CVal("write.step.schema")
    writer = STEPControl_Writer()
    writer.Transfer(meshed_box, STEPControl_AsIs, params)
    file_name = tmp_path / "box.step"
    writer.Write(str(file_name))
    assert Interface_Static.CVal("write.step.schema") == schema
    content = file_name.read_text()
    assert "AP242_MANAGED_MODEL_BASED_3D_ENGINEERING" in content
    assert "PRODUCT('box" in content
    assert ".METRE." in content
    # the parameters of a configuration node
    node = DESTEP_ConfigurationNode()
    node.InternalParameters.WriteSchema = DESTEP_Parameters.WriteMode_StepSchema_AP203
    assert (
        node.InternalParameters.WriteSchema
        == DESTEP_Parameters.WriteMode_StepSchema_AP203
    )


def test_provider_internal_parameters(tmp_path: Path, meshed_box) -> None:
    # the parameters of a provider are the fields of a nested struct
    node, provider = make_provider("DESTL")
    assert node.InternalParameters.WriteAscii
    node.InternalParameters.WriteAscii = False
    file_name = tmp_path / "box.stl"
    assert provider.Write(str(file_name), meshed_box)
    assert not file_name.read_bytes().startswith(b"solid")
    node, _ = make_provider("DEGLTF")
    node.InternalParameters.WriteAuthor = "pythonocc"
    assert node.InternalParameters.WriteAuthor == "pythonocc"
    # the global and shape fix parameters of a configuration node
    node, _ = make_provider("DESTEP")
    node.GlobalParameters.LengthUnit = 1000.0
    assert node.GlobalParameters.LengthUnit == 1000.0
    node.ShapeFixParameters.DetalizationLevel = TopAbs_FACE
    assert node.ShapeFixParameters.DetalizationLevel == TopAbs_FACE
