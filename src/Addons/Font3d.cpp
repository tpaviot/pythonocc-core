/*
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
##GNU General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "Addons.h"

TopoDS_Shape text_to_brep(const char* aText,
                          const char* aName,
                          Font_FontAspect aFontAspect,
                          float aSize,
                          bool anIsCompositeCurve)
{

  Standard_Integer anArgIt = 1;

  Font_BRepFont           aFont;
  TCollection_AsciiString aFontName (aName);
  gp_Ax3                  aPenAx3    (gp::XOY());
  gp_Dir                  aNormal    (0.0, 0.0, 1.0);
  gp_Dir                  aDirection (1.0, 0.0, 0.0);
  gp_Pnt                  aPenLoc;

  Graphic3d_HorizontalTextAlignment aHJustification = Graphic3d_HTA_LEFT;
  Graphic3d_VerticalTextAlignment   aVJustification = Graphic3d_VTA_BOTTOM;
  Font_StrictLevel aStrictLevel = Font_StrictLevel_Any;
  

  aFont.SetCompositeCurveMode (anIsCompositeCurve);
  if (!aFont.FindAndInit (aFontName.ToCString(), aFontAspect, aSize, aStrictLevel))
  {
    std::cout << "Error: unable to load Font\n";
    return TopoDS_Shape();
  }

  aPenAx3 = gp_Ax3 (aPenLoc, aNormal, aDirection);

  Font_BRepTextBuilder aBuilder;
  return aBuilder.Perform (aFont, aText, aPenAx3, aHJustification, aVJustification);
}
