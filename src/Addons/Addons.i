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
%module Addons;

%{
#include <Addons.h>
%}

// Font related functions
enum Font_FontAspect
{
Font_FA_Undefined = 0,
Font_FA_Regular = 1,
Font_FA_Bold = 2,
Font_FA_Italic = 3,
Font_FA_BoldItalic = 4
};

TopoDS_Shape text_to_brep(char *text_to_render, char* aFontName, Font_FontAspect aFontAspect, float aSize, bool isCompositeCurve);
void display_available_fonts();
void register_font(char* aFontPath);
