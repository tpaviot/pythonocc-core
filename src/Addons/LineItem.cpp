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

#include "LineItem.h"


// default constructor for line item
LineItem::LineItem(Standard_Real X1, Standard_Real Y1,
                   Standard_Real X2, Standard_Real Y2,
                   const Handle(Visual3d_Layer)& theLayer,
                   int theType,
                   Standard_Real theWidth,
                   Standard_Real theTransp,
                   const Quantity_Color& theColor) :
  myX1(X1), myY1(Y1), myX2(X2), myY2(Y2),
  myWidth(theWidth), myTransparency(theTransp),
  myType(theType), myLayer(theLayer), myColor (theColor)
{
  if (!myLayer.IsNull ())
    myLayer->AddLayerItem (this);
}

// render line
void LineItem::RedrawLayerPrs ()
{
  if (myLayer.IsNull ())
    return;
  myLayer->SetColor(myColor);
  myLayer->SetTransparency((Standard_ShortReal)myTransparency);
  myLayer->SetLineAttributes((Aspect_TypeOfLine)myType, myWidth);
  myLayer->BeginPolyline();
  myLayer->AddVertex(myX1, myY1);
  myLayer->AddVertex(myX2, myY2);
  myLayer->ClosePrimitive();
}
