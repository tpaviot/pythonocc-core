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

from OCC.TopoDS import TopoDS_Shape
from OCC.BRepMesh import BRepMesh_IncrementalMesh
from OCC.StlAPI import StlAPI_Reader, StlAPI_Writer

from OCC.BRep import BRep_Builder
from OCC.TopoDS import TopoDS_Compound

from OCC.IGESControl import IGESControl_Reader, IGESControl_Writer
from OCC.STEPControl import STEPControl_Reader, STEPControl_Writer, STEPControl_AsIs
from OCC.Interface import Interface_Static_SetCVal
from OCC.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity

from OCC.TopologyUtils import TopologyExplorer

##########################
# Step import and export #
##########################
def read_step_file(filename, return_as_shapes=False, verbosity=False):
    """ read the STEP file and returns a compound
    filename: the file path
    return_as_shapes: optional, False by default. If True returns a list of shapes,
                      else returns a single compound
    verbosity: optionl, False by default.
    """
    assert os.path.isfile(filename)

    step_reader = STEPControl_Reader()
    status = step_reader.ReadFile(filename)

    if status == IFSelect_RetDone:  # check status
        if verbosity:
            failsonly = False
            step_reader.PrintCheckLoad(failsonly, IFSelect_ItemsByEntity)
            step_reader.PrintCheckTransfer(failsonly, IFSelect_ItemsByEntity)
        ok = step_reader.TransferRoot(1)
        _nbs = step_reader.NbShapes()
        shape_to_return = step_reader.Shape(1)  # a compound
        assert not shape_to_return.IsNull()
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
    assert not a_shape.IsNull()
    assert application_protocol in ["AP203", "AP214IS"]
    if os.path.isfile(filename):
        print("Warning: %s file already exists and will be replaced" % filename)
    # creates and initialise the step exporter
    step_writer = STEPControl_Writer()
    Interface_Static_SetCVal("write.step.schema", "AP203")

    # transfer shapes and write file
    step_writer.Transfer(a_shape, STEPControl_AsIs)
    status = step_writer.Write(filename)

    assert status == IFSelect_RetDone
    assert os.path.isfile(filename)

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
    assert not a_shape.IsNull()
    assert mode in ["ascii", "binary"]
    if os.path.isfile(filename):
        print("Warning: %s file already exists and will be replaced" % filename)
    # first mesh the shape
    mesh = BRepMesh_IncrementalMesh(a_shape, linear_deflection, False, angular_deflection, True)
    #mesh.SetDeflection(0.05)
    mesh.Perform()
    assert mesh.IsDone()

    stl_exporter = StlAPI_Writer()
    if mode == "ascii":
        stl_exporter.SetASCIIMode(True)
    else:  # binary, just set the ASCII flag to False
        stl_exporter.SetASCIIMode(False)
    stl_exporter.Write(a_shape, filename)
    
    assert os.path.isfile(filename)


def read_stl_file(filename):
    """ opens a stl file, reads the content, and returns a BRep topods_shape object
    """
    assert os.path.isfile(filename)

    stl_reader = StlAPI_Reader()
    the_shape = TopoDS_Shape()
    stl_reader.Read(the_shape, filename)

    assert not the_shape.IsNull()

    return the_shape

######################
# IGES import/export #
######################
def read_iges_file(filename, return_as_shapes=False, verbosity=False):
    """ read the IGES file and returns a compound
    filename: the file path
    return_as_shapes: optional, False by default. If True returns a list of shapes,
                      else returns a single compound
    verbosity: optionl, False by default.
    """
    assert os.path.isfile(filename)

    iges_reader = IGESControl_Reader()
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
                aResShape = iges_reader.Shape(1)
                if aResShape.IsNull():
                    print("At least one shape in IGES cannot be transferred")
                else:
                    _shapes.append(aResShape)
            else:
                for i in range(1, nbs+1):
                    aShape = iges_reader.Shape(i)
                    if aShape.IsNull():
                        print("At least one shape in STEP cannot be transferred")
                    else:
                        _shapes.append(aShape)
    # if not return as shapes
    # create a compound and store all shapes
    # TODO
    if not return_as_shapes:
        builder = BRep_Builder()
        Comp = TopoDS_Compound()
        builder.MakeCompound(Comp)
        for s in _shapes:
            builder.Add(Comp, s)
        _shapes=Comp
    return _shapes

def write_iges_file(a_shape, filename):
    """ exports a shape to a STEP file
    a_shape: the topods_shape to export (a compound, a solid etc.)
    filename: the filename
    application protocol: "AP203" or "AP214"
    """
    # a few checks
    assert not a_shape.IsNull()
    if os.path.isfile(filename):
        print("Warning: %s file already exists and will be replaced" % filename)
    # creates and initialise the step exporter
    iges_writer = IGESControl_Writer()
    iges_writer.AddShape(a_shape)
    status = iges_writer.Write(filename)

    assert status == IFSelect_RetDone
    assert os.path.isfile(filename)

if __name__ == "__main__":
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeSphere
    b = BRepPrimAPI_MakeSphere(30.).Shape()
    write_step_file(b, "s_203.stp", application_protocol="AP203")
    write_step_file(b, "s_214.stp", application_protocol="AP214IS")
    b2 = read_step_file("s_203.stp")
    b3 = read_step_file("s_214.stp")
    b3_bis = read_step_file("s_214.stp", return_as_shapes=True)
    write_stl_file(b, "s_stl_ascii.stl")
    write_stl_file(b, "s_stl_binary.stl", mode="binary")
    b4 = read_stl_file("s_stl_ascii.stl")
    b5 = read_stl_file("s_stl_binary.stl")
    # improve the precision by a factor 2
    write_stl_file(b, "s_stl_precise_ascii.stl", linear_deflection=0.1, angular_deflection=0.2)
    b6 = read_stl_file("s_stl_precise_ascii.stl")
    # iges test
    write_iges_file(b, "s_iges.igs")
    b7 = read_iges_file("s_iges.igs")
    print(b7)
    b8 = read_iges_file("s_iges.igs", return_as_shapes=True)
