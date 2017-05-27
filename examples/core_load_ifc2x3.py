##Copyright 2016 Thomas Paviot (tpaviot@gmail.com)
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

try:
    import ifcopenshell
    import ifcopenshell.geom.occ_utils
except ImportError:
    print("This example requires ifcopenshell for python. Please go to  http://ifcopenshell.org/python.html")

settings = ifcopenshell.geom.settings()
settings.set(settings.USE_PYTHON_OPENCASCADE, True)


# Open the IFC file using IfcOpenShell
print("Opening IFC file ...")
ifc_file = ifcopenshell.open("models/Office_A_20110811.ifc")
print("file opened ...")
# The geometric elements in an IFC file are the IfcProduct elements.
# So these are opened and displayed.
products = ifc_file.by_type("IfcProduct")
product_shapes = []

print("Traverse data with associated 3d geometry")
# For every product a shape is created if the shape has a Representation.
i = 0
for product in products:
    if (product.is_a("IfcOpeningElement") or
         product.is_a("IfcSite") or product.is_a("IfcAnnotation")):
            continue
    if product.Representation is not None:
        print(product)
        shape = ifcopenshell.geom.create_shape(settings, product).geometry
        product_shapes.append((product, shape))
        i += 1
        print(i)
print("data traversed ok: %i repr" % i)

# Initialize a graphical display window
print("Initializing pythonocc display")
from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()
# then pass each shape to the display
nbr_shapes = len(product_shapes)
idx = 0.
for ps in product_shapes:
    display.DisplayShape((ps[1]))
    print("Sending shapes to pythonocc display: %i%%" % int(idx/nbr_shapes*100))
    idx += 1
display.FitAll()
display.display_graduated_trihedron()
start_display()
