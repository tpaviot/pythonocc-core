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

#if !defined __TextureItem__
#define __TextureItem__

#include <Quantity_Color.hxx>
#include <Visual3d_Layer.hxx>
#include <TCollection_AsciiString.hxx>
#include <Image_AlienPixMap.hxx>
#include <Aspect_Window.hxx>

DEFINE_STANDARD_HANDLE(TextureItem, Visual3d_LayerItem)

// this class provides a presentation of text item in v3d view under-/overlayer
class TextureItem : public Visual3d_LayerItem
{
public:
  // constructor
  TextureItem (const TCollection_AsciiString& theImageFilename,
               const Handle(Visual3d_Layer)& theLayer);

  // Destructor.
  ~TextureItem();

  // redraw method
  void RedrawLayerPrs();

  //! Sets texture position in the view port.
  void SetPosition(int x_abs, int y_abs) {x=x_abs;y=y_abs;}

private:
    //! Allocates and initializes the texture.
    void Init (unsigned char* theData);
    Aspect_TypeOfConstraint myPos;
    unsigned int    myTextureId;
    Handle(Visual3d_Layer)   myLayer;
    int             myH;
    int             myW;
    int             x;
    int             y;
};

#endif
