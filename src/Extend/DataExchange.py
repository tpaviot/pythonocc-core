##Copyright 2018 Thomas Paviot (tpaviot@gmail.com)
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

import os

from OCC.Core.TopoDS import TopoDS_Shape
from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh
from OCC.Core.StlAPI import StlAPI_Reader, StlAPI_Writer
from OCC.Core.BRep import BRep_Builder
from OCC.Core.TopoDS import TopoDS_Compound
from OCC.Core.IGESControl import IGESControl_Reader, IGESControl_Writer
from OCC.Core.STEPControl import STEPControl_Reader, STEPControl_Writer, STEPControl_AsIs
from OCC.Core.Interface import Interface_Static_SetCVal
from OCC.Core.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity
from OCC.Core.TDocStd import TDocStd_Document
from OCC.Core.XCAFDoc import (XCAFDoc_DocumentTool_ShapeTool,
                              XCAFDoc_DocumentTool_ColorTool)
from OCC.Core.STEPCAFControl import STEPCAFControl_Reader
from OCC.Core.TDF import TDF_LabelSequence, TDF_Label, TDF_Tool
from OCC.Core.TDataStd import TDataStd_Name, TDataStd_Name_GetID
from OCC.Core.TCollection import TCollection_ExtendedString, TCollection_AsciiString
from OCC.Core.Quantity import Quantity_Color
from OCC.Core.TopLoc import TopLoc_Location
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_Transform

from OCC.Extend.TopologyUtils import TopologyExplorer


##########################
# Step import and export #
##########################
def read_step_file(filename, return_as_shapes=False, verbosity=False):
    """ read the STEP file and returns a compound
    filename: the file path
    return_as_shapes: optional, False by default. If True returns a list of shapes,
                      else returns a single compound
    verbosity: optional, False by default.
    """
    if not os.path.isfile(filename):
        raise FileNotFoundError("%s not found." % filename)

    step_reader = STEPControl_Reader()
    status = step_reader.ReadFile(filename)

    if status == IFSelect_RetDone:  # check status
        if verbosity:
            failsonly = False
            step_reader.PrintCheckLoad(failsonly, IFSelect_ItemsByEntity)
            step_reader.PrintCheckTransfer(failsonly, IFSelect_ItemsByEntity)
        transfer_result = step_reader.TransferRoot(1)
        if not transfer_result:
            raise AssertionError("Transfer failed.")
        _nbs = step_reader.NbShapes()
        if _nbs != 1:
            raise AssertionError("Number of shapes is not one.")
        shape_to_return = step_reader.Shape(1)  # a compound
        if shape_to_return.IsNull():
            raise AssertionError("Shape is null.")
    else:
        raise AssertionError("Error: can't read file.")
    if return_as_shapes:
        shape_to_return = TopologyExplorer(shape_to_return).solids()

    return shape_to_return


def write_step_file(a_shape, filename, application_protocol="AP203"):
    """ exports a shape to a STEP file
    a_shape: the topods_shape to export (a compound, a solid etc.)
    filename: the filename
    application protocol: "AP203" or "AP214"
    """
    # a few checks
    if a_shape.IsNull():
        raise AssertionError("Shape %s is null." % a_shape)
    if application_protocol not in ["AP203", "AP214IS"]:
        raise AssertionError("application_protocol must be either AP203 or AP214IS. You passed %s." % application_protocol)
    if os.path.isfile(filename):
        print("Warning: %s file already exists and will be replaced" % filename)
    # creates and initialise the step exporter
    step_writer = STEPControl_Writer()
    Interface_Static_SetCVal("write.step.schema", application_protocol)

    # transfer shapes and write file
    step_writer.Transfer(a_shape, STEPControl_AsIs)
    status = step_writer.Write(filename)

    if not status == IFSelect_RetDone:
        raise AssertionError("Error while writing shape to STEP file.")
    if not os.path.isfile(filename):
        raise AssertionError("File %s was not saved to filesystem." % filename)


def read_step_file_with_names_colors(filename):
    """ Returns list of tuples (topods_shape, label, color)
    Use OCAF.
    """
    if not os.path.isfile(filename):
        raise FileNotFoundError("%s not found." % filename)
    # the list:
    output_shapes = []
    # create an handle to a document
    doc = TDocStd_Document(TCollection_ExtendedString("pythonocc-doc"))

    # Get root assembly
    shape_tool = XCAFDoc_DocumentTool_ShapeTool(doc.Main())
    color_tool = XCAFDoc_DocumentTool_ColorTool(doc.Main())
    #layer_tool = XCAFDoc_DocumentTool_LayerTool(doc.Main())
    #mat_tool = XCAFDoc_DocumentTool_MaterialTool(doc.Main())

    step_reader = STEPCAFControl_Reader()
    step_reader.SetColorMode(True)
    step_reader.SetLayerMode(True)
    step_reader.SetNameMode(True)
    step_reader.SetMatMode(True)

    status = step_reader.ReadFile(filename)
    if status == IFSelect_RetDone:
        step_reader.Transfer(doc)

    shape_tool.SetAutoNaming(True)

    
    #lvl = 0
    locs = []
    #cnt = 0

    def _get_label_name(lab):
        entry = TCollection_AsciiString()
        TDF_Tool.Entry(lab, entry)
        n = TDataStd_Name()
        lab.FindAttribute(TDataStd_Name_GetID(), n)
        if n:
            return n.Get().PrintToString()
        return "No Name"

    def _get_sub_shapes(lab, loc):
        #global cnt, lvl
        #cnt += 1
        #print("\n[%d] level %d, handling LABEL %s\n" % (cnt, lvl, _get_label_name(lab)))
        #print()
        #print(lab.DumpToString())
        #print()
        #print("Is Assembly    :", shape_tool.IsAssembly(lab))
        #print("Is Free        :", shape_tool.IsFree(lab))
        #print("Is Shape       :", shape_tool.IsShape(lab))
        #print("Is Compound    :", shape_tool.IsCompound(lab))
        #print("Is Component   :", shape_tool.IsComponent(lab))
        #print("Is SimpleShape :", shape_tool.IsSimpleShape(lab))
        #print("Is Reference   :", shape_tool.IsReference(lab))

        #users = TDF_LabelSequence()
        #users_cnt = shape_tool.GetUsers(lab, users)
        #print("Nr Users       :", users_cnt)

        l_subss = TDF_LabelSequence()
        shape_tool.GetSubShapes(lab, l_subss)
        #print("Nb subshapes   :", l_subss.Length())
        l_comps = TDF_LabelSequence()
        shape_tool.GetComponents(lab, l_comps)
        #print("Nb components  :", l_comps.Length())
        #print()

        if shape_tool.IsAssembly(lab):
            l_c = TDF_LabelSequence()
            shape_tool.GetComponents(lab, l_c)
            for i in range(l_c.Length()):
                label = l_c.Value(i+1)
                if shape_tool.IsReference(label):
                    #print("\n########  reference label :", label)
                    label_reference = TDF_Label()
                    shape_tool.GetReferredShape(label, label_reference)
                    loc = shape_tool.GetLocation(label)
                    #print("    loc          :", loc)
                    #trans = loc.Transformation()
                    #print("    tran form    :", trans.Form())
                    #rot = trans.GetRotation()
                    #print("    rotation     :", rot)
                    #print("    X            :", rot.X())
                    #print("    Y            :", rot.Y())
                    #print("    Z            :", rot.Z())
                    #print("    W            :", rot.W())
                    #tran = trans.TranslationPart()
                    #print("    translation  :", tran)
                    #print("    X            :", tran.X())
                    #print("    Y            :", tran.Y())
                    #print("    Z            :", tran.Z())

                    locs.append(loc)
                    #print(">>>>")
                    #lvl += 1
                    _get_sub_shapes(label_reference, loc)
                    #lvl -= 1
                    #print("<<<<")
                    locs.pop()

        elif shape_tool.IsSimpleShape(lab):
            #print("\n########  simpleshape label :", lab)
            shape = shape_tool.GetShape(lab)
            #print("    all ass locs   :", locs)

            loc = TopLoc_Location()
            for i in range(len(locs)):
                #print("    take loc       :", locs[i])
                loc = loc.Multiplied(locs[i])

            #trans = loc.Transformation()
            #print("    FINAL loc    :")
            #print("    tran form    :", trans.Form())
            #rot = trans.GetRotation()
            #print("    rotation     :", rot)
            #print("    X            :", rot.X())
            #print("    Y            :", rot.Y())
            #print("    Z            :", rot.Z())
            #print("    W            :", rot.W())
            #tran = trans.TranslationPart()
            #print("    translation  :", tran)
            #print("    X            :", tran.X())
            #print("    Y            :", tran.Y())
            #print("    Z            :", tran.Z())
            shape = BRepBuilderAPI_Transform(shape, loc.Transformation()).Shape()

            c = Quantity_Color()
            colorSet = False
            if (color_tool.GetInstanceColor(shape, 0, c) or
                    color_tool.GetInstanceColor(shape, 1, c) or
                    color_tool.GetInstanceColor(shape, 2, c)):
                for i in (0, 1, 2):
                    color_tool.SetInstanceColor(shape, i, c)
                colorSet = True
                n = c.Name(c.Red(), c.Green(), c.Blue())
                #print('    instance color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())

            if not colorSet:
                if (color_tool.GetColor(lab, 0, c) or
                        color_tool.GetColor(lab, 1, c) or
                        color_tool.GetColor(lab, 2, c)):
                    for i in (0, 1, 2):
                        color_tool.SetInstanceColor(shape, i, c)

                    n = c.Name(c.Red(), c.Green(), c.Blue())
                    print('    shape color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())

                #n = c.Name(c.Red(), c.Green(), c.Blue())
                #print('    shape color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())

            for i in range(l_subss.Length()):
                lab = l_subss.Value(i+1)
                print("\n########  simpleshape subshape label :", lab)
                shape_sub = shape_tool.GetShape(lab)

                c = Quantity_Color()
                colorSet = False
                if (color_tool.GetInstanceColor(shape_sub, 0, c) or
                        color_tool.GetInstanceColor(shape_sub, 1, c) or
                        color_tool.GetInstanceColor(shape_sub, 2, c)):
                    for i in (0, 1, 2):
                        color_tool.SetInstanceColor(shape_sub, i, c)
                    colorSet = True
                    n = c.Name(c.Red(), c.Green(), c.Blue())
                    #print('    instance color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())

                if not colorSet:
                    if (color_tool.GetColor(lab, 0, c) or
                            color_tool.GetColor(lab, 1, c) or
                            color_tool.GetColor(lab, 2, c)):
                        for i in (0, 1, 2):
                            color_tool.SetInstanceColor(shape, i, c)

                        n = c.Name(c.Red(), c.Green(), c.Blue())
                        #print('    shape color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())

            output_shapes.append([shape, _get_label_name(lab), c])


    def _get_shapes():
        labels = TDF_LabelSequence()
        shape_tool.GetFreeShapes(labels)
        #global cnt
        #cnt += 1

        print()
        print("Number of shapes at root :", labels.Length())
        print()
        root = labels.Value(1)

        _get_sub_shapes(root, None)
    _get_shapes()
    return output_shapes


#########################
# STL import and export #
#########################
def write_stl_file(a_shape, filename, mode="ascii", linear_deflection=0.9, angular_deflection=0.5):
    """ export the shape to a STL file
    Be careful, the shape first need to be explicitely meshed using BRepMesh_IncrementalMesh
    a_shape: the topods_shape to export
    filename: the filename
    mode: optional, "ascii" by default. Can either be "binary"
    linear_deflection: optional, default to 0.001. Lower, more occurate mesh
    angular_deflection: optional, default to 0.5. Lower, more accurate_mesh
    """
    if a_shape.IsNull():
        raise AssertionError("Shape is null.")
    if mode not in ["ascii", "binary"]:
        raise AssertionError("mode should be either ascii or binary")
    if os.path.isfile(filename):
        print("Warning: %s file already exists and will be replaced" % filename)
    # first mesh the shape
    mesh = BRepMesh_IncrementalMesh(a_shape, linear_deflection, False, angular_deflection, True)
    #mesh.SetDeflection(0.05)
    mesh.Perform()
    if not mesh.IsDone():
        raise AssertionError("Mesh is not done.")

    stl_exporter = StlAPI_Writer()
    if mode == "ascii":
        stl_exporter.SetASCIIMode(True)
    else:  # binary, just set the ASCII flag to False
        stl_exporter.SetASCIIMode(False)
    stl_exporter.Write(a_shape, filename)

    if not os.path.isfile(filename):
        raise IOError("File not written to disk.")


def read_stl_file(filename):
    """ opens a stl file, reads the content, and returns a BRep topods_shape object
    """
    if not os.path.isfile(filename):
        raise FileNotFoundError("%s not found." % filename)

    stl_reader = StlAPI_Reader()
    the_shape = TopoDS_Shape()
    stl_reader.Read(the_shape, filename)

    if the_shape.IsNull():
        raise AssertionError("Shape is null.")

    return the_shape

######################
# IGES import/export #
######################
def read_iges_file(filename, return_as_shapes=False, verbosity=False, visible_only=False):
    """ read the IGES file and returns a compound
    filename: the file path
    return_as_shapes: optional, False by default. If True returns a list of shapes,
                      else returns a single compound
    verbosity: optionl, False by default.
    """
    if not os.path.isfile(filename):
        raise FileNotFoundError("%s not found." % filename)

    iges_reader = IGESControl_Reader()
    iges_reader.SetReadVisible(visible_only)
    status = iges_reader.ReadFile(filename)

    _shapes = []

    if status == IFSelect_RetDone:  # check status
        if verbosity:
            failsonly = False
            iges_reader.PrintCheckLoad(failsonly, IFSelect_ItemsByEntity)
            iges_reader.PrintCheckTransfer(failsonly, IFSelect_ItemsByEntity)
        iges_reader.TransferRoots()
        nbr = iges_reader.NbRootsForTransfer()
        for n in range(1, nbr+1):
            nbs = iges_reader.NbShapes()
            if nbs == 0:
                print("At least one shape in IGES cannot be transfered")
            elif nbr == 1 and nbs == 1:
                a_res_shape = iges_reader.Shape(1)
                if a_res_shape.IsNull():
                    print("At least one shape in IGES cannot be transferred")
                else:
                    _shapes.append(a_res_shape)
            else:
                for i in range(1, nbs+1):
                    a_shape = iges_reader.Shape(i)
                    if a_shape.IsNull():
                        print("At least one shape in STEP cannot be transferred")
                    else:
                        _shapes.append(a_shape)
    # if not return as shapes
    # create a compound and store all shapes
    if not return_as_shapes:
        builder = BRep_Builder()
        compound = TopoDS_Compound()
        builder.MakeCompound(compound)
        for s in _shapes:
            builder.Add(compound, s)
        _shapes = compound
    return _shapes

def write_iges_file(a_shape, filename):
    """ exports a shape to a STEP file
    a_shape: the topods_shape to export (a compound, a solid etc.)
    filename: the filename
    application protocol: "AP203" or "AP214"
    """
    # a few checks
    if a_shape.IsNull():
        raise AssertionError("Shape is null.")
    if os.path.isfile(filename):
        print("Warning: %s file already exists and will be replaced" % filename)
    # creates and initialise the step exporter
    iges_writer = IGESControl_Writer()
    iges_writer.AddShape(a_shape)
    status = iges_writer.Write(filename)

    if status != IFSelect_RetDone:
        raise AssertionError("Not done.")
    if not os.path.isfile(filename):
        raise IOError("File not written to disk.")

if __name__ == "__main__":
    from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeSphere
    sphere_shape = BRepPrimAPI_MakeSphere(30.).Shape()
    write_step_file(sphere_shape, "s_203.stp", application_protocol="AP203")
    write_step_file(sphere_shape, "s_214.stp", application_protocol="AP214IS")
    read_step_file("s_203.stp")
    read_step_file("s_214.stp")
    read_step_file("s_214.stp", return_as_shapes=True)
    write_stl_file(sphere_shape, "s_stl_ascii.stl")
    write_stl_file(sphere_shape, "s_stl_binary.stl", mode="binary")
    read_stl_file("s_stl_ascii.stl")
    read_stl_file("s_stl_binary.stl")
    # improve the precision by a factor 2
    write_stl_file(sphere_shape, "s_stl_precise_ascii.stl", linear_deflection=0.1, angular_deflection=0.2)
    read_stl_file("s_stl_precise_ascii.stl")
    # iges test
    write_iges_file(sphere_shape, "s_iges.igs")
    read_iges_file("s_iges.igs")
    read_iges_file("s_iges.igs", return_as_shapes=True)
    # test step with colors
    read_step_file_with_names_colors("s_214.stp")
