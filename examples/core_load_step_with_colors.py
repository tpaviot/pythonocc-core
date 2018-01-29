##Copyright 2010-2014 Thomas Paviot (tpaviot@gmail.com)
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

from __future__ import print_function

import sys

from OCC.Core.TDocStd import Handle_TDocStd_Document
from OCC.Core.XCAFApp import XCAFApp_Application
from OCC.Core.XCAFDoc import (XCAFDoc_DocumentTool_ShapeTool,
                         XCAFDoc_DocumentTool_ColorTool,
                         XCAFDoc_DocumentTool_LayerTool,
                         XCAFDoc_DocumentTool_MaterialTool)
from OCC.Core.STEPCAFControl import STEPCAFControl_Reader
from OCC.Core.IFSelect import IFSelect_RetDone
from OCC.Core.TDF import TDF_LabelSequence, TDF_Label, TDF_Tool
from OCC.Core.TDataStd import Handle_TDataStd_Name, TDataStd_Name_GetID
from OCC.Core.TCollection import TCollection_ExtendedString, TCollection_AsciiString
from OCC.Core.Quantity import Quantity_Color
from OCC.Core.TopLoc import TopLoc_Location
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_Transform
from OCC.Display.SimpleGui import init_display

filename = './models/as1-oc-214.stp'

# create an handle to a document
h_doc = Handle_TDocStd_Document()

# Create the application
app = XCAFApp_Application.GetApplication().GetObject()
app.NewDocument(TCollection_ExtendedString("MDTV-CAF"), h_doc)

# Get root assembly
doc = h_doc.GetObject()
h_shape_tool = XCAFDoc_DocumentTool_ShapeTool(doc.Main())
h_color_tool = XCAFDoc_DocumentTool_ColorTool(doc.Main())
h_layer_tool = XCAFDoc_DocumentTool_LayerTool(doc.Main())
h_mat_tool = XCAFDoc_DocumentTool_MaterialTool(doc.Main())

step_reader = STEPCAFControl_Reader()
step_reader.SetColorMode(True)
step_reader.SetLayerMode(True)
step_reader.SetNameMode(True)
step_reader.SetMatMode(True)

status = step_reader.ReadFile(filename)
if status == IFSelect_RetDone:
    step_reader.Transfer(doc.GetHandle())

shape_tool = h_shape_tool.GetObject()
shape_tool.SetAutoNaming(True)

color_tool = h_color_tool.GetObject()

lvl = 0
locs = []
cnt = 0

def get_label_name(lab):
    entry = TCollection_AsciiString()
    TDF_Tool.Entry(lab, entry)
    N = Handle_TDataStd_Name()
    lab.FindAttribute(TDataStd_Name_GetID(), N)
    n = N.GetObject()
    if n:
        return n.Get().PrintToString()
    return "No Name"

def getSubShapes(lab, loc):
    global cnt, lvl
    cnt += 1
    print("\n[%d] level %d, handling LABEL %s\n" % (cnt, lvl, get_label_name(lab)))
    print()
    print(lab.DumpToString())
    print()
    print("Is Assembly    :", shape_tool.IsAssembly(lab))
    print("Is Free        :", shape_tool.IsFree(lab))
    print("Is Shape       :", shape_tool.IsShape(lab))
    print("Is Compound    :", shape_tool.IsCompound(lab))
    print("Is Component   :", shape_tool.IsComponent(lab))
    print("Is SimpleShape :", shape_tool.IsSimpleShape(lab))
    print("Is Reference   :", shape_tool.IsReference(lab))

    users = TDF_LabelSequence()
    users_cnt = shape_tool.GetUsers(lab, users)
    print("Nr Users       :", users_cnt)

    l_subss = TDF_LabelSequence()
    shape_tool.GetSubShapes(lab, l_subss)
    print("Nb subshapes   :", l_subss.Length())
    l_comps = TDF_LabelSequence()
    shape_tool.GetComponents(lab, l_comps)
    print("Nb components  :", l_comps.Length())
    print()

    if shape_tool.IsAssembly(lab):
        l_c = TDF_LabelSequence()
        shape_tool.GetComponents(lab, l_c)
        for i in range(l_c.Length()):
            label = l_c.Value(i+1)
            if shape_tool.IsReference(label):
                print("\n########  reference label :", label)
                label_reference = TDF_Label()
                shape_tool.GetReferredShape(label, label_reference)
                loc = shape_tool.GetLocation(label)
                print("    loc          :", loc)
                trans = loc.Transformation()
                print("    tran form    :", trans.Form())
                rot = trans.GetRotation()
                print("    rotation     :", rot)
                print("    X            :", rot.X())
                print("    Y            :", rot.Y())
                print("    Z            :", rot.Z())
                print("    W            :", rot.W())
                tran = trans.TranslationPart()
                print("    translation  :", tran)
                print("    X            :", tran.X())
                print("    Y            :", tran.Y())
                print("    Z            :", tran.Z())

                locs.append(loc)
                print(">>>>")
                lvl += 1
                getSubShapes(label_reference, loc)
                lvl -= 1
                print("<<<<")
                locs.pop()

    elif shape_tool.IsSimpleShape(lab):
        print("\n########  simpleshape label :", lab)
        shape = shape_tool.GetShape(lab)
        print("    all ass locs   :", locs)

        loc = TopLoc_Location()
        for i in range(len(locs)):
            print("    take loc       :", locs[i])
            loc = loc.Multiplied(locs[i])

        trans = loc.Transformation()
        print("    FINAL loc    :")
        print("    tran form    :", trans.Form())
        rot = trans.GetRotation()
        print("    rotation     :", rot)
        print("    X            :", rot.X())
        print("    Y            :", rot.Y())
        print("    Z            :", rot.Z())
        print("    W            :", rot.W())
        tran = trans.TranslationPart()
        print("    translation  :", tran)
        print("    X            :", tran.X())
        print("    Y            :", tran.Y())
        print("    Z            :", tran.Z())
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
            print('    instance color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())

        if not colorSet:
            if (color_tool.GetColor(lab, 0, c) or
                    color_tool.GetColor(lab, 1, c) or
                    color_tool.GetColor(lab, 2, c)):
                for i in (0, 1, 2):
                    color_tool.SetInstanceColor(shape, i, c)

                n = c.Name(c.Red(), c.Green(), c.Blue())
                print('    shape color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())

        # n = c.Name(c.Red(), c.Green(), c.Blue())
        # print('    color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())
        # Display shape
        display.DisplayColoredShape(shape, c)

        for i in range(l_subss.Length()):
            lab = l_subss.Value(i+1)
            print("\n########  simpleshape subshape label :", lab)
            shape = shape_tool.GetShape(lab)

            c = Quantity_Color()
            colorSet = False
            if (color_tool.GetInstanceColor(shape, 0, c) or
                    color_tool.GetInstanceColor(shape, 1, c) or
                    color_tool.GetInstanceColor(shape, 2, c)):
                for i in (0, 1, 2):
                    color_tool.SetInstanceColor(shape, i, c)
                colorSet = True
                n = c.Name(c.Red(), c.Green(), c.Blue())
                print('    instance color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())

            if not colorSet:
                if (color_tool.GetColor(lab, 0, c) or
                        color_tool.GetColor(lab, 1, c) or
                        color_tool.GetColor(lab, 2, c)):
                    for i in (0, 1, 2):
                        color_tool.SetInstanceColor(shape, i, c)

                    n = c.Name(c.Red(), c.Green(), c.Blue())
                    print('    shape color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())

            # n = c.Name(c.Red(), c.Green(), c.Blue())
            # print('    color Name & RGB: ', c, n, c.Red(), c.Green(), c.Blue())
            # Display shape
            display.DisplayColoredShape(shape, c)

def getShapes():
    labels = TDF_LabelSequence()
    h_shape_tool.GetObject().GetFreeShapes(labels)
    global cnt
    cnt += 1

    print()
    print("Number of shapes at root :", labels.Length())
    print()
    root = labels.Value(1)

    getSubShapes(root, None)

def run(event=None):
    display.EraseAll()
    getShapes()
    print()
    print("Handled %d labels" % cnt)
    print()
    display.FitAll()

def exit(event=None):
    sys.exit()

if __name__ == '__main__':
    display, start_display, add_menu, add_function_to_menu = init_display()
    add_menu('STEP import')
    add_function_to_menu('STEP import', run)
    add_function_to_menu('STEP import', exit)
    start_display()
