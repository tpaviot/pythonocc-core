/*
##Copyright 2017 Thomas Paviot (tpaviot@gmail.com)
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
*/

#if !defined __LineItem__
#define __LineItem__

#include <Quantity_Color.hxx>
#include <Visual3d_Layer.hxx>
#include <TCollection_AsciiString.hxx>

DEFINE_STANDARD_HANDLE(LineItem, Visual3d_LayerItem)

// this class provides a presentation of text item in v3d view under-/overlayer
class LineItem : public Visual3d_LayerItem
{
public:
  // constructor
  LineItem(Standard_Real X1, Standard_Real Y1,
           Standard_Real X2, Standard_Real Y2,
           const Handle(Visual3d_Layer)& theLayer,
           int theType = (int)Aspect_TOL_SOLID,
           Standard_Real theWidth    = 0.5,
           Standard_Real theTransp   = 1.0,
           const Quantity_Color& theColor = Quantity_Color(Quantity_NOC_WHITE));
  // redraw method
  void RedrawLayerPrs();

private:
  Standard_Real       myX1, myY1, myX2, myY2;
  Standard_Real       myWidth;
  Standard_Real       myTransparency;
  int                 myType;
  Handle(Visual3d_Layer) myLayer;
  Quantity_Color      myColor;
};

#endif
