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

// converts text to brep
TopoDS_Shape text_to_brep(char *text_to_render, char* aFontName, Font_FontAspect aFontAspect, Standard_Real aSize, Standard_Boolean isCompositeCurve) { 
  Font_BRepFont    aFont;
  aFont.SetCompositeCurveMode(isCompositeCurve);
  if (aFont.Init (aFontName, aFontAspect, aSize))
  {
    std::cout << "Font " << aFontName << " succesffuly initialized.\n";
  }
  else {
    std::cerr << "Font " << aFontName << " initialization failed.\n";
  }
  return aFont.RenderText(text_to_render);
}

// display_available_fonts
void display_available_fonts() {
  Handle(Font_FontMgr) aMgr = Font_FontMgr::GetInstance();
  for (Font_NListOfSystemFont::Iterator anIter (aMgr->GetAvailableFonts());
         anIter.More(); anIter.Next())
    {
      const Handle(Font_SystemFont)& aFont = anIter.Value();
      std::cout << (aFont->FontName()->String()).ToCString()
            << " " << aFont->FontAspect()
            << " " << (aFont->FontPath()->String()).ToCString() << "_\n";
    }
  }

// register a new font given the font path
// returns the font name
void register_font(char* aFontPath) {
  Handle(Font_FontMgr) aMgr = Font_FontMgr::GetInstance();
  Font_FontAspect  aFontAspect;
  Handle(Font_SystemFont) aFont = aMgr->CheckFont (aFontPath);
  if (aFont.IsNull())
    {
      std::cerr << "Error: font '" << aFontPath << "' is not found!\n";
    }
  else {
      aFontAspect = aFont->FontAspect();
      Handle(TCollection_HAsciiString) aName = aFont->FontName();
      aFont = new Font_SystemFont (aName, aFontAspect, new TCollection_HAsciiString (aFontPath));
      aMgr->RegisterFont (aFont, Standard_True);
      std::cout << "Font name:" << aName->String() << ", Aspect:" << aFontAspect << " successfully registered.\n";
  }
}
