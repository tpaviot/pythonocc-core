##Copyright 2018-2024 Thomas Paviot (tpaviot@gmail.com)
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
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

"""Import and export of shapes to and from the STEP, IGES, STL, BREP,
glTF, OBJ, PLY, X3D and SVG formats."""

import os
import warnings
from typing import Any, Optional, Union

from OCC.Core.Bnd import Bnd_Box2d
from OCC.Core.BRep import BRep_Builder, BRep_Tool
from OCC.Core.BRepBuilderAPI import (
    BRepBuilderAPI_MakeSolid,
    BRepBuilderAPI_Sewing,
    BRepBuilderAPI_Transform,
)
from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh
from OCC.Core.BRepTools import breptools
from OCC.Core.gp import gp_Dir, gp_Pnt, gp_Pnt2d
from OCC.Core.IFSelect import IFSelect_ItemsByEntity, IFSelect_RetDone
from OCC.Core.IGESControl import (
    IGESControl_Controller,
    IGESControl_Reader,
    IGESControl_Writer,
)
from OCC.Core.Interface import Interface_Static
from OCC.Core.Message import Message_ProgressRange
from OCC.Core.Quantity import Quantity_Color, Quantity_TOC_RGB
from OCC.Core.RWGltf import RWGltf_CafReader, RWGltf_CafWriter
from OCC.Core.RWMesh import (
    RWMesh_CoordinateSystem_negZfwd_posYup,
    RWMesh_CoordinateSystem_posYfwd_posZup,
)
from OCC.Core.RWObj import RWObj_CafWriter
from OCC.Core.RWPly import RWPly_CafWriter
from OCC.Core.STEPCAFControl import STEPCAFControl_Reader
from OCC.Core.STEPControl import (
    STEPControl_AsIs,
    STEPControl_Reader,
    STEPControl_Writer,
)
from OCC.Core.StlAPI import StlAPI_Writer, stlapi
from OCC.Core.TCollection import TCollection_AsciiString
from OCC.Core.TColStd import TColStd_IndexedDataMapOfStringString
from OCC.Core.TDF import TDF_Label, TDF_LabelSequence
from OCC.Core.TDocStd import TDocStd_Document
from OCC.Core.TopLoc import TopLoc_Location
from OCC.Core.TopoDS import TopoDS_Compound, TopoDS_Edge, TopoDS_Shape
from OCC.Core.UnitsMethods import unitsmethods
from OCC.Core.XCAFDoc import (
    XCAFDoc_ColorCurv,
    XCAFDoc_ColorGen,
    XCAFDoc_ColorSurf,
    XCAFDoc_ColorTool,
    XCAFDoc_DocumentTool,
)
from OCC.Extend.TopologyUtils import (
    TopologyExplorer,
    discretize_edge,
    get_sorted_hlr_edges,
)

try:
    import svgwrite

    HAVE_SVGWRITE = True
except ImportError:
    HAVE_SVGWRITE = False


def check_svgwrite_installed():
    """Raises OSError if the optional svgwrite package is not available."""
    if not HAVE_SVGWRITE:
        raise OSError(
            "svg exporter not available because the svgwrite package is not "
            "installed, use $pip install svgwrite"
        )


##########################
# Step import and export #
##########################
def read_step_file(
    filename: str, as_compound: bool = True, verbosity: bool = False
) -> Union[TopoDS_Shape, list[TopoDS_Shape]]:
    """Read a STEP file and return the contained shape(s).

    Args:
        filename: Path to the STEP file to read
        as_compound: If True, combine multiple shapes into a single compound.
                    Defaults to True.
        verbosity: If True, print detailed information during import.
                  Defaults to False.

    Returns:
        Either a single TopoDS_Shape (if as_compound=True or only one shape present)
        or a list of TopoDS_Shape objects

    Raises:
        FileNotFoundError: If the specified file does not exist
        AssertionError: If there are errors during STEP file reading or conversion
    """
    if not os.path.isfile(filename):
        raise FileNotFoundError(f"STEP file not found: {filename}")

    step_reader = STEPControl_Reader()
    status = step_reader.ReadFile(filename)

    if status != IFSelect_RetDone:
        raise AssertionError("Error: can't read file.")

    if verbosity:
        step_reader.PrintCheckLoad(False, IFSelect_ItemsByEntity)
        step_reader.PrintCheckTransfer(False, IFSelect_ItemsByEntity)

    transfer_result = step_reader.TransferRoots()
    if not transfer_result:
        raise AssertionError("Transfer failed.")

    nb_shapes = step_reader.NbShapes()
    if nb_shapes == 0:
        raise AssertionError("No shape to transfer.")

    # a null shape is returned as None, e.g. for a file without geometry
    shapes = []
    for i in range(1, nb_shapes + 1):
        shape = step_reader.Shape(i)
        if shape is not None and not shape.IsNull():
            shapes.append(shape)
    if not shapes:
        raise AssertionError("No shape to transfer.")

    if len(shapes) == 1:
        return shapes[0] if as_compound else shapes

    if as_compound:
        compound = TopoDS_Compound()
        builder = BRep_Builder()
        builder.MakeCompound(compound)
        for shape in shapes:
            builder.Add(compound, shape)
        return compound

    return shapes


def write_step_file(
    shape: TopoDS_Shape, filename: str, application_protocol: str = "AP203"
) -> None:
    """Export a shape to STEP format.

    Args:
        shape: The shape to export
        filename: Target STEP file path
        application_protocol: STEP format version to use.
                            Can be "AP203" (basic geometry),
                            "AP214IS" (colors and layers),
                            or "AP242DIS" (latest version with PMI support).
                            Defaults to "AP203".

    Raises:
        AssertionError: If shape is null or protocol is invalid
        IOError: If export fails
    """
    if shape.IsNull():
        raise AssertionError("Shape is null.")

    if application_protocol not in ["AP203", "AP214IS", "AP242DIS"]:
        raise AssertionError(
            "application_protocol must be either AP203, AP214IS or AP242DIS. "
            f"You passed {application_protocol}."
        )

    if os.path.isfile(filename):
        warnings.warn(f"{filename} already exists and will be replaced", stacklevel=2)

    if application_protocol != "AP242DIS":
        # e.g. the faces of a shape read from a glTF, STL or OBJ file: only
        # their triangulation can be exported, as AP242 tessellated geometry
        nb_mesh_faces = sum(
            1
            for face in TopologyExplorer(shape).faces()
            if BRep_Tool.Surface(face) is None
        )
        if nb_mesh_faces > 0:
            warnings.warn(
                f"{nb_mesh_faces} face(s) without geometric surface, e.g. read "
                "from a mesh file, are not exported with "
                f"{application_protocol}: use application_protocol='AP242DIS'",
                stacklevel=2,
            )

    # the writer defines the write.step.* parameters: create it first, else
    # the schema is not set at the first call
    writer = STEPControl_Writer()
    # the schema is a global parameter: restore it once the file is written
    previous_schema = Interface_Static.CVal("write.step.schema")
    Interface_Static.SetCVal("write.step.schema", application_protocol)
    try:
        # Convert and write shape
        writer.Transfer(shape, STEPControl_AsIs)
        status = writer.Write(filename)
    finally:
        Interface_Static.SetCVal("write.step.schema", previous_schema)

    if status != IFSelect_RetDone:
        raise OSError("Error while writing shape to STEP file.")
    if not os.path.isfile(filename):
        raise OSError(f"{filename} not saved to filesystem.")


def read_step_file_with_names_colors(
    filename: str,
) -> dict[TopoDS_Shape, list[Union[str, Quantity_Color]]]:
    """
    Reads a STEP file and extracts shapes with their names and colors using OCAF.

    This function processes a STEP file, including its assembly structure,
    and returns a dictionary mapping each shape to its name and color.

    :param filename: The path to the STEP file.
    :return: A dictionary where keys are TopoDS_Shape objects and values are
             lists containing the shape's name and its Quantity_Color.
    :raises FileNotFoundError: If the specified file does not exist.
    """
    if not os.path.isfile(filename):
        raise FileNotFoundError(f"{filename} not found.")
    # the list:
    output_shapes = {}

    # create an handle to a document
    doc = TDocStd_Document("pythonocc-doc-step-import")

    # Get root assembly
    shape_tool = XCAFDoc_DocumentTool.ShapeTool(doc.Main())
    color_tool = XCAFDoc_DocumentTool.ColorTool(doc.Main())
    # layer_tool = XCAFDoc_DocumentTool_LayerTool(doc.Main())
    # mat_tool = XCAFDoc_DocumentTool_MaterialTool(doc.Main())

    step_reader = STEPCAFControl_Reader()
    step_reader.SetColorMode(True)
    step_reader.SetLayerMode(True)
    step_reader.SetNameMode(True)
    step_reader.SetMatMode(True)
    step_reader.SetGDTMode(True)

    status = step_reader.ReadFile(filename)
    if status != IFSelect_RetDone:
        raise OSError(f"Error while reading STEP file {filename}.")
    step_reader.Transfer(doc)

    locs = []
    color_types = (XCAFDoc_ColorGen, XCAFDoc_ColorSurf, XCAFDoc_ColorCurv)

    def _get_color(shape, label):
        """Returns the instance color of the shape, or the color of its label,
        or a default grey color."""
        color = Quantity_Color(0.5, 0.5, 0.5, Quantity_TOC_RGB)  # default color
        if any(
            color_tool.GetInstanceColor(shape, t, color) for t in color_types
        ) or any(XCAFDoc_ColorTool.GetColor(label, t, color) for t in color_types):
            for color_type in color_types:
                color_tool.SetInstanceColor(shape, color_type, color)
        return color

    def _get_sub_shapes(lab):
        if shape_tool.IsAssembly(lab):
            l_c = TDF_LabelSequence()
            shape_tool.GetComponents(lab, l_c)
            for i in range(l_c.Length()):
                label = l_c.Value(i + 1)
                if shape_tool.IsReference(label):
                    label_reference = TDF_Label()
                    shape_tool.GetReferredShape(label, label_reference)
                    locs.append(shape_tool.GetLocation(label))
                    _get_sub_shapes(label_reference)
                    locs.pop()

        elif shape_tool.IsSimpleShape(lab):
            shape = shape_tool.GetShape(lab)

            loc = TopLoc_Location()
            for location in locs:
                loc = loc.Multiplied(location)

            c = _get_color(shape, lab)
            shape_disp = BRepBuilderAPI_Transform(shape, loc.Transformation()).Shape()
            if shape_disp not in output_shapes:
                output_shapes[shape_disp] = [lab.GetLabelName(), c]

            l_subss = TDF_LabelSequence()
            shape_tool.GetSubShapes(lab, l_subss)
            for i in range(l_subss.Length()):
                lab_subs = l_subss.Value(i + 1)
                shape_sub = shape_tool.GetShape(lab_subs)
                c = _get_color(shape_sub, lab_subs)
                # position the subshape to display
                shape_to_disp = BRepBuilderAPI_Transform(
                    shape_sub, loc.Transformation()
                ).Shape()
                if shape_to_disp not in output_shapes:
                    output_shapes[shape_to_disp] = [lab_subs.GetLabelName(), c]

    labels = TDF_LabelSequence()
    shape_tool.GetFreeShapes(labels)
    for i in range(labels.Length()):
        _get_sub_shapes(labels.Value(i + 1))
    return output_shapes


#########################
# STL import and export #
#########################
def write_stl_file(
    shape: TopoDS_Shape,
    filename: str,
    mode: str = "ascii",
    linear_deflection: float = 0.9,
    angular_deflection: float = 0.5,
) -> None:
    """
    Export a shape to STL format.

    The shape is first meshed using the specified deflection parameters before export.

    :param shape: The shape to export.
    :param filename: Target STL file path.
    :param mode: Export format, either "ascii" or "binary". Defaults to "ascii".
    :param linear_deflection: Maximum distance between mesh and actual surface.
                              Lower values produce more accurate but larger meshes.
                              Defaults to 0.9.
    :param angular_deflection: Maximum angle between mesh elements in radians.
                               Lower values produce smoother meshes.
                               Defaults to 0.5.
    :raises AssertionError: If shape is null or meshing fails.
    :raises IOError: If export fails.
    """
    if shape.IsNull():
        raise AssertionError("Shape is null.")

    if mode not in ["ascii", "binary"]:
        raise AssertionError("mode should be either ascii or binary")

    if os.path.isfile(filename):
        warnings.warn(f"{filename} already exists and will be replaced", stacklevel=2)

    # Mesh the shape
    mesh = BRepMesh_IncrementalMesh(
        shape, linear_deflection, False, angular_deflection, True
    )
    mesh.Perform()
    if not mesh.IsDone():
        raise AssertionError("Mesh is not done.")

    # Export to STL
    writer = StlAPI_Writer()
    writer.SetASCIIMode(mode == "ascii")
    if not writer.Write(shape, filename) or not os.path.isfile(filename):
        raise OSError("File not written to disk.")


def read_stl_file(
    filename: str, sew_shape: bool = False, make_solid: bool = False
) -> TopoDS_Shape:
    """
    Reads an STL file and returns a TopoDS_Shape.

    :param filename: The path to the STL file.
    :param sew_shape: sew all triangular faces after loading
    :param make_solid: fill the surfacic mesh to return a TopoDS_Solid
    :return: The shape read from the file.
    :raises FileNotFoundError: If the specified file does not exist.
    :raises AssertionError: If the shape in the file is null.
    """
    if not os.path.isfile(filename):
        raise FileNotFoundError(f"{filename} not found.")

    if not sew_shape and make_solid:
        raise AssertionError("Please enable sew_shape in order to make solid.")

    the_shape = TopoDS_Shape()
    stlapi.Read(the_shape, filename)

    if the_shape.IsNull():
        raise AssertionError("Shape is null.")

    if sew_shape:
        sewer = BRepBuilderAPI_Sewing()
        sewer.Add(the_shape)
        sewer.Perform()
        sewed_shape = sewer.SewedShape()

        if make_solid:
            return BRepBuilderAPI_MakeSolid(sewed_shape).Shape()

        # Return the sewed shape
        return sewed_shape

    return the_shape


######################
# IGES import/export #
######################
def read_iges_file(
    filename: str,
    return_as_shapes: bool = False,
    verbosity: bool = False,
    visible_only: bool = False,
) -> list[TopoDS_Shape]:
    """
    Reads an IGES file and returns the shapes.

    :param filename: The path to the IGES file.
    :param return_as_shapes: If True, returns a list of shapes. Otherwise, returns
                             a single compound shape. Defaults to False.
    :param verbosity: If True, prints detailed information during import.
                      Defaults to False.
    :param visible_only: If True, only reads visible entities. Defaults to False.
    :return: A list of shapes or a single compound shape.
    :raises FileNotFoundError: If the specified file does not exist.
    :raises IOError: If the file cannot be read.
    """
    if not os.path.isfile(filename):
        raise FileNotFoundError(f"{filename} not found.")

    IGESControl_Controller.Init()

    iges_reader = IGESControl_Reader()
    iges_reader.SetReadVisible(visible_only)
    status = iges_reader.ReadFile(filename)

    if status != IFSelect_RetDone:  # check status
        raise OSError("Cannot read IGES file")

    if verbosity:
        failsonly = False
        iges_reader.PrintCheckLoad(failsonly, IFSelect_ItemsByEntity)
        iges_reader.PrintCheckTransfer(failsonly, IFSelect_ItemsByEntity)
    iges_reader.ClearShapes()
    iges_reader.TransferRoots()
    nbr = iges_reader.NbShapes()

    _shapes = []
    for i in range(1, nbr + 1):
        a_shp = iges_reader.Shape(i)
        if not a_shp.IsNull():
            _shapes.append(a_shp)

    # create a compound and store all shapes
    if not return_as_shapes:
        builder = BRep_Builder()
        compound = TopoDS_Compound()
        builder.MakeCompound(compound)
        for s in _shapes:
            builder.Add(compound, s)
        return [compound]

    return _shapes


def write_iges_file(a_shape: TopoDS_Shape, filename: str):
    """
    Exports a shape to an IGES file.

    :param a_shape: The TopoDS_Shape to export.
    :param filename: The path to the output IGES file.
    :raises AssertionError: If the shape is null or the export fails.
    :raises IOError: If the file cannot be written to disk.
    """
    # a few checks
    if a_shape.IsNull():
        raise AssertionError("Shape is null.")
    if os.path.isfile(filename):
        warnings.warn(f"{filename} already exists and will be replaced", stacklevel=2)
    # create and initialize the step exporter
    iges_writer = IGESControl_Writer()
    iges_writer.AddShape(a_shape)
    status = iges_writer.Write(filename)

    if status != IFSelect_RetDone:
        raise AssertionError("Not done.")
    if not os.path.isfile(filename):
        raise OSError("File not written to disk.")


##############
# SVG export #
##############
def edge_to_svg_polyline(
    topods_edge: TopoDS_Edge, tol: float = 0.1, unit: str = "mm"
) -> tuple[Any, Bnd_Box2d]:
    """
    Converts a TopoDS_Edge to an SVG polyline.

    :param topods_edge: The edge to convert.
    :param tol: The tolerance for discretization. Defaults to 0.1.
    :param unit: The unit of the coordinates ('mm' or 'm'). Defaults to 'mm'.
    :return: A tuple containing the svgwrite.shapes.Polyline and the 2D bounding box.
    """
    check_svgwrite_installed()

    unit_factor = 1  # by default

    if unit == "mm":
        unit_factor = 1
    elif unit == "m":
        unit_factor = 1e3

    points_3d = discretize_edge(topods_edge, tol)
    points_2d = []
    box2d = Bnd_Box2d()

    for point in points_3d:
        # we tak only the first 2 coordinates (x and y, leave z)
        x_p = -point[0] * unit_factor
        y_p = point[1] * unit_factor
        box2d.Add(gp_Pnt2d(x_p, y_p))
        points_2d.append((x_p, y_p))

    return svgwrite.shapes.Polyline(points_2d, fill="none"), box2d


def export_shape_to_svg(
    shape: TopoDS_Shape,
    filename: Optional[str] = None,
    width: int = 800,
    height: int = 600,
    margin_left: int = 10,
    margin_top: int = 30,
    export_hidden_edges: bool = True,
    location: Optional[gp_Pnt] = None,
    direction: Optional[gp_Dir] = None,
    color: str = "black",
    line_width: str = "1px",
    unit: str = "mm",
) -> Union[bool, str]:
    """
    Exports a shape to an SVG file or string.

    :param shape: The TopoDS_Shape to export.
    :param filename: If provided, the path to save the SVG file.
    :param width: The width of the SVG canvas in pixels.
    :param height: The height of the SVG canvas in pixels.
    :param margin_left: The left margin in pixels.
    :param margin_top: The top margin in pixels.
    :param export_hidden_edges: If True, hidden edges are drawn with a dashed line.
    :param location: The viewpoint location for HLR, the origin by default.
    :param direction: The view direction for HLR, (1, 1, 1) by default.
    :param color: The color of the lines.
    :param line_width: The width of the lines.
    :param unit: The unit of the coordinates ('mm' or 'm').
    :return: The SVG content as a string if no filename is provided, otherwise True.
    :raises AssertionError: If the shape is null or the export fails.
    """
    check_svgwrite_installed()

    if shape.IsNull():
        raise AssertionError("shape is Null")
    if location is None:
        location = gp_Pnt(0, 0, 0)
    if direction is None:
        direction = gp_Dir(1, 1, 1)

    # find all edges
    visible_edges, hidden_edges = get_sorted_hlr_edges(
        shape,
        position=location,
        direction=direction,
        export_hidden_edges=export_hidden_edges,
    )

    # compute polylines for all edges
    # we compute a global 2d bounding box as well, to be able to compute
    # the scale factor and translation vector to apply to all 2d edges so that
    # they fit the svg canva
    global_2d_bounding_box = Bnd_Box2d()

    polylines = []
    for visible_edge in visible_edges:
        visible_svg_line, visible_edge_box2d = edge_to_svg_polyline(
            visible_edge, 0.1, unit
        )
        polylines.append(visible_svg_line)
        global_2d_bounding_box.Add(visible_edge_box2d)
    if export_hidden_edges:
        for hidden_edge in hidden_edges:
            hidden_svg_line, hidden_edge_box2d = edge_to_svg_polyline(
                hidden_edge, 0.1, unit
            )
            # hidden lines are dashed style
            hidden_svg_line.dasharray([5, 5])
            polylines.append(hidden_svg_line)
            global_2d_bounding_box.Add(hidden_edge_box2d)

    # translate and scale polylines

    # first compute shape translation and scale according to size/margins
    x_min, y_min, x_max, y_max = global_2d_bounding_box.Get()
    bb2d_width = x_max - x_min
    bb2d_height = y_max - y_min

    # build the svg drawing
    dwg = svgwrite.Drawing(filename, (width, height), debug=False)
    # adjust the view box so that the lines fit then svg canvas
    dwg.viewbox(
        x_min - margin_left,
        y_min - margin_top,
        bb2d_width + 2 * margin_left,
        bb2d_height + 2 * margin_top,
    )

    for polyline in polylines:
        # apply color and style
        polyline.stroke(color, width=line_width, linecap="round")
        # then adds the polyline to the svg canva
        dwg.add(polyline)

    # export to string or file according to the user choice
    if filename is not None:
        dwg.save()
        if not os.path.isfile(filename):
            raise AssertionError("svg export failed")
        return True
    return dwg.tostring()


def _mesh_shape_to_document(
    a_shape: TopoDS_Shape, doc_name: str
) -> tuple[TDocStd_Document, TColStd_IndexedDataMapOfStringString]:
    """
    Meshes a shape and adds it to a new XCAF document, for the mesh writers.

    :param a_shape: The TopoDS_Shape to mesh. Its previous triangulation is removed.
    :param doc_name: The name of the document.
    :return: The document and the file metadata.
    """
    doc = TDocStd_Document(doc_name)
    shape_tool = XCAFDoc_DocumentTool.ShapeTool(doc.Main())

    # mesh shape, with a linear deflection of 1.0
    breptools.Clean(a_shape)
    BRepMesh_IncrementalMesh(a_shape, 1.0)

    shape_tool.AddShape(a_shape)

    # metadata
    a_file_info = TColStd_IndexedDataMapOfStringString()
    a_file_info.Add(
        TCollection_AsciiString("Authors"), TCollection_AsciiString("pythonocc")
    )
    return doc, a_file_info


#################################################
# ply export (write not avaiable from upstream) #
#################################################
def write_ply_file(a_shape: TopoDS_Shape, ply_filename: str):
    """
    Exports a shape to a PLY file using OCAF.

    :param a_shape: The TopoDS_Shape to export.
    :param ply_filename: The path to the output PLY file.
    """
    doc, a_file_info = _mesh_shape_to_document(a_shape, "pythonocc-doc-ply-export")

    rwply_writer = RWPly_CafWriter(ply_filename)

    rwply_writer.SetNormals(True)
    rwply_writer.SetColors(True)
    rwply_writer.SetTexCoords(True)
    rwply_writer.SetPartId(True)
    rwply_writer.SetFaceId(True)

    if not rwply_writer.Perform(doc, a_file_info, Message_ProgressRange()):
        raise OSError("Error while writing shape to PLY file.")


#################################################
# Obj export (write not avaiable from upstream) #
#################################################
def write_obj_file(a_shape: TopoDS_Shape, obj_filename: str):
    """
    Exports a shape to an OBJ file using OCAF.

    :param a_shape: The TopoDS_Shape to export.
    :param obj_filename: The path to the output OBJ file.
    """
    doc, a_file_info = _mesh_shape_to_document(a_shape, "pythonocc-doc-obj-export")

    rwobj_writer = RWObj_CafWriter(obj_filename)

    # apply a scale factor of 0.001 to mimic conversion from m to mm
    csc = rwobj_writer.ChangeCoordinateSystemConverter()

    system_unit_factor = unitsmethods.GetCasCadeLengthUnit() * 0.001
    csc.SetInputLengthUnit(system_unit_factor)
    csc.SetOutputLengthUnit(system_unit_factor)
    csc.SetInputCoordinateSystem(RWMesh_CoordinateSystem_posYfwd_posZup)
    csc.SetOutputCoordinateSystem(RWMesh_CoordinateSystem_negZfwd_posYup)

    rwobj_writer.SetCoordinateSystemConverter(csc)

    if not rwobj_writer.Perform(doc, a_file_info, Message_ProgressRange()):
        raise OSError("Error while writing shape to OBJ file.")


########
# gltf #
########
def read_gltf_file(
    filename: str,
    is_parallel: bool = False,
    is_double_precision: bool = False,
    skip_late_data_loading: bool = False,
    keep_late_data: bool = True,
    verbose: bool = False,
    load_all_scenes: bool = False,
) -> list[TopoDS_Shape]:
    """
    Reads a glTF file and returns the shape.

    :param filename: The path to the glTF file.
    :param is_parallel: If True, uses parallel processing. Defaults to False.
    :param is_double_precision: If True, uses double precision. Defaults to False.
    :param skip_late_data_loading: If True, skips loading late data. Defaults to False.
    :param keep_late_data: If True, keeps late data. Defaults to True.
    :param verbose: If True, prints debug messages. Defaults to False.
    :param load_all_scenes: If True, loads all scenes. Defaults to False.
    :return: A list containing the read shape.
    :raises FileNotFoundError: If the specified file does not exist.
    :raises IOError: If the file cannot be read.
    """
    if not os.path.isfile(filename):
        raise FileNotFoundError(f"{filename} not found.")

    gltf_reader = RWGltf_CafReader()
    gltf_reader.SetSystemCoordinateSystem(RWMesh_CoordinateSystem_posYfwd_posZup)
    gltf_reader.SetParallel(is_parallel)
    gltf_reader.SetDoublePrecision(is_double_precision)
    gltf_reader.SetToSkipLateDataLoading(skip_late_data_loading)
    gltf_reader.SetToKeepLateData(keep_late_data)
    gltf_reader.SetToPrintDebugMessages(verbose)
    gltf_reader.SetLoadAllScenes(load_all_scenes)

    if not gltf_reader.Perform(filename, Message_ProgressRange()):
        raise OSError("Error while reading GLTF file.")

    return [gltf_reader.SingleShape()]


def write_gltf_file(a_shape: TopoDS_Shape, gltf_filename: str, binary=True):
    """
    Exports a shape to a glTF file using OCAF.

    :param a_shape: The TopoDS_Shape to export.
    :param gltf_filename: The path to the output glTF file.
    :param binary: If True, exports to a binary glTF (.glb) file. Defaults to True.
    :raises IOError: If the export fails.
    """
    doc, a_file_info = _mesh_shape_to_document(a_shape, "pythonocc-doc-gltf-export")

    rwgltf_writer = RWGltf_CafWriter(gltf_filename, binary)

    if not rwgltf_writer.Perform(doc, a_file_info, Message_ProgressRange()):
        raise OSError("Error while writing shape to GLTF file.")
