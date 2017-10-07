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

#if !defined __TextItem__
#define __TextItem__

#include <Quantity_Color.hxx>
#include <Visual3d_Layer.hxx>
#include <TCollection_AsciiString.hxx>

DEFINE_STANDARD_HANDLE(TextItem, Visual3d_LayerItem)

// this class provides a presentation of text item in v3d view under-/overlayer
class TextItem : public Visual3d_LayerItem
{
public:
  // constructor
  TextItem(const TCollection_AsciiString& theText,
           const Standard_Real theX1,
           const Standard_Real theY1,
           const Standard_Real theHeight,
           const TCollection_AsciiString& theFontName,
           const Quantity_Color& theColor,
           const Quantity_Color& theSubtitleColor,
           int theTypeOfDisplay,
           const Handle(Visual3d_Layer)& theLayer,
           const Standard_Real scrollX=0.0,
           const Standard_Real scrollY=0.0);

  // redraw method
  void RedrawLayerPrs();

private:

  Standard_Real            myX1;
  Standard_Real            myY1;
  TCollection_AsciiString  myText;
  Standard_Real            myHeight;
  Handle(Visual3d_Layer)   myLayer;
  Quantity_Color           myColor;
  Quantity_Color           mySubtitleColor;
  Aspect_TypeOfDisplayText myType;
  TCollection_AsciiString  myFontName;
  Standard_Real            myScrollX;
  Standard_Real            myScrollY;
};

#endif
