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

#include "TextItem.h"


// create and add to display the text item
TextItem::TextItem (const TCollection_AsciiString& theText,
                    const Standard_Real theX1,
                    const Standard_Real theY1,
                    const Standard_Real theHeight,
                    const TCollection_AsciiString& theFontName,
                    const Quantity_Color& theColor,
                    const Quantity_Color& theSubtitleColor,
                    int theTypeOfDisplay,
                    const Handle(Visual3d_Layer)& theLayer,
                    const Standard_Real scrollX,
                    const Standard_Real scrollY)
 : myX1 (theX1), myY1 (theY1),
   myScrollX(scrollX), myScrollY(scrollY),
   myText (theText),
   myHeight (theHeight),
   myLayer (theLayer),
   myColor (theColor),
   mySubtitleColor (theSubtitleColor),
   myType ((Aspect_TypeOfDisplayText) theTypeOfDisplay),
   myFontName (theFontName)
{
  if (!myLayer.IsNull ())
    myLayer->AddLayerItem (this);
}

// render item
void TextItem::RedrawLayerPrs ()
{
  if (myLayer.IsNull ())
    return;
  myLayer->SetColor (myColor);
  myLayer->SetTextAttributes (myFontName.ToCString (), myType, mySubtitleColor);
  myX1 += myScrollX;
  myY1 += myScrollY;
  myLayer->DrawText (myText.ToCString (), myX1, myY1, myHeight);
}
