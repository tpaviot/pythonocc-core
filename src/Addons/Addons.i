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

%module(package="OCC") Addons
%{
#include <Addons.h>
#include <TextItem.h>
#include <LineItem.h>
#include <TextureItem.h>
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



%feature("compactdefaultargs") text_to_brep;
%feature("autodoc", "	* Creates a shape of the given text. 
	:param text_to_render: Text to render
	:type text_to_render: char *
	:param aFontName: Font name
	:type aFontName: char *
	:param aFontAspect:  Fontaspect, Font_FA_Regular, Font_FA_Bold, Font_FA_Italic or Font_FA_BoldItalic
	:type aFontAspect: Font_FontAspect
	:param aSize: Size of the font
	:type aSize: float
	:param isCompositeCurve:
	:type isCompositeCurve: bool
	:rtype: TopoDS_Shape
") text_to_brep;
TopoDS_Shape text_to_brep(char *text_to_render, char *aFontName, Font_FontAspect aFontAspect, float aSize, bool isCompositeCurve);

%feature("compactdefaultargs") display_available_fonts;
%feature("autodoc", "	* Prints a list of all available fonts.
	:rtype: void
") display_available_fonts;
void display_available_fonts();

%feature("compactdefaultargs") register_font;
%feature("autodoc", "	* Add a font to the available font list. 
	:param aFontPath: Path to the font.
	:type aFontPath: char *
	:rtype: void
") register_font;
void register_font(char *aFontPath);


class TextItem {
 public:
 
	%feature("compactdefaultargs") TextItem;
	%feature("autodoc", "	* Displays a text in the screen
	:param theText: Text to display
	:type theText: const TCollection_AsciiString&
	:param theX1: X-Position on the display
	:type theX1: float
	:param theY1: Y-Position on the display
	:type theY1: float
	:param theHeight: Size of the font
	:type theHeight: float
	:param theFontName: Name of the font
	:type theFontName: const TCollection_AsciiString&
	:param theColor: Rgb color. E.g. Quantity_Color(0..1, 0..1, 0..1, 1)
	:type theColor: const Quantity_Color&
	:param theSubtitleColor: Rgb color of the sub title
	:type theSubtitleColor: const Quantity_Color&
	:param theTypeOfDisplay: Type of display, e.g. Aspect_TODT_NORMAL, Aspect_TODT_SUBTITLE, Aspect_TODT_DEKALE
	:type theTypeOfDisplay: int
	:param theLayer: 
	:type: const Handle_Visual3d_Layer&
	:param ScrollX: 
	:type: const float
	:param Scrolly: 
	:type: const float
") TextItem;
    TextItem(const TCollection_AsciiString& theText,
             float theX1,
             float theY1,
             float theHeight,
             const TCollection_AsciiString& theFontName,
             const Quantity_Color& theColor,
             const Quantity_Color& theSubtitleColor,
             int theTypeOfDisplay,
             const Handle_Visual3d_Layer& theLayer,
             float ScrollX=0.0,
             float ScrollY=0.0);
    void RedrawLayerPrs();
};



class LineItem {
 public:
	%feature("compactdefaultargs") LineItem;
	%feature("autodoc", "	* Creates a shape of the given text
	:param X1: X-Position of the first point 
	:type X1: float
	:param Y1: Y-Position of the first point   
	:type Y1: float        
    :param X2: X-Position of the second point    
    :type X2: float 
    :param Y2: Y-Position of the second point   
    :type Y2: float 
	:param theLayer: The Layer
	:type theLayer: const Handle_Visual3d_Layer&
	:param theType: Type of line: 0..10
	:type theType: int
	:param theWidth: Width of the line
	:type theWidth: float	
	:param theTransp: Transparency: 0..1
	:type theTransp: float	
	:param theColor: Rgb color
	:type theColor: const Quantity_Color &	
   
") LineItem;
    LineItem(float X1, float Y1,
             float X2, float Y2,
             const Handle_Visual3d_Layer& theLayer,
             int theType,
             float theWidth=0.5,
             float theTransp=1,
             const Quantity_Color& theColor=Quantity_Color(Quantity_NOC_WHITE));
    void RedrawLayerPrs();
};


class TextureItem {
public:
	%feature("compactdefaultargs") TextureItem;
	%feature("autodoc", "	* Creates a shape of the given text
	:param theImageFilename: Path to the image
	:type theImageFilename: const TCollection_AsciiString&
	:param theView: The display view
	:type theView: V3d_View *        
    :param theLayer: Layer for the texture
    :type theLayer: const Handle_Visual3d_Layer& 
 
") TextureItem;
    TextureItem(const TCollection_AsciiString& theImageFilename,
                V3d_View* theView,
                const Handle_Visual3d_Layer& theLayer);
    // redraw method
    void RedrawLayerPrs();
    // set position
    void SetAbsolutePosition(int x_abs, int y_abs);
    void SetRelativePosition(int x_percent, int y_percent);
};
