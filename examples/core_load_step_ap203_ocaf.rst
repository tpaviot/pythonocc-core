core_load_step_ap203_ocaf.py
============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_load_step_ap203_ocaf.py

------


Code
^^^^


.. code-block:: python

  from __future__ import print_function
  
  
  from OCC.Core.TCollection import TCollection_ExtendedString
  
  from OCC.Core.TDocStd import Handle_TDocStd_Document
  from OCC.Core.XCAFApp import XCAFApp_Application
  from OCC.Core.XCAFDoc import (XCAFDoc_DocumentTool_ShapeTool,
                           XCAFDoc_DocumentTool_ColorTool,
                           XCAFDoc_DocumentTool_LayerTool,
                           XCAFDoc_DocumentTool_MaterialTool)
  from OCC.Core.STEPCAFControl import STEPCAFControl_Reader
  from OCC.Core.IFSelect import IFSelect_RetDone
  from OCC.Core.TDF import TDF_LabelSequence
  
  from OCC.Display.SimpleGui import init_display
  
  filename = './models/as1_pe_203.stp'
  _shapes = []
  
  # create an handle to a document
  h_doc = Handle_TDocStd_Document()
  
  # Create the application
  app = XCAFApp_Application.GetApplication().GetObject()
  app.NewDocument(TCollection_ExtendedString("MDTV-CAF"), h_doc)
  
  # Get root assembly
  doc = h_doc.GetObject()
  h_shape_tool = XCAFDoc_DocumentTool_ShapeTool(doc.Main())
  l_colors = XCAFDoc_DocumentTool_ColorTool(doc.Main())
  l_layers = XCAFDoc_DocumentTool_LayerTool(doc.Main())
  l_materials = XCAFDoc_DocumentTool_MaterialTool(doc.Main())
  
  step_reader = STEPCAFControl_Reader()
  step_reader.SetColorMode(True)
  step_reader.SetLayerMode(True)
  step_reader.SetNameMode(True)
  step_reader.SetMatMode(True)
  
  status = step_reader.ReadFile(filename)
  if status == IFSelect_RetDone:
      step_reader.Transfer(doc.GetHandle())
  
  labels = TDF_LabelSequence()
  color_labels = TDF_LabelSequence()
  
  shape_tool = h_shape_tool.GetObject()
  h_shape_tool.GetObject().GetFreeShapes(labels)
  
  print("Number of shapes at root :%i" % labels.Length())
  for i in range(labels.Length()):
      sub_shapes_labels = TDF_LabelSequence()
      print("Is Assembly :", shape_tool.IsAssembly(labels.Value(i+1)))
      sub_shapes = shape_tool.GetSubShapes(labels.Value(i+1), sub_shapes_labels)
      print("Number of subshapes in the assemly :%i" % sub_shapes_labels.Length())
  l_colors.GetObject().GetColors(color_labels)
  
  print("Number of colors=%i" % color_labels.Length())
  for i in range(color_labels.Length()):
      color = color_labels.Value(i+1)
      print(color.DumpToString())
  
  for i in range(labels.Length()):
      label = labels.Value(i+1)
      a_shape = h_shape_tool.GetObject().GetShape(label)
      m = l_layers.GetObject().GetLayers(a_shape)
      _shapes.append(a_shape)
  
  #
  # Display
  #
  display, start_display, add_menu, add_function_to_menu = init_display()
  display.DisplayShape(_shapes, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_load_step_ap203_ocaf-1-1511702001.jpeg

