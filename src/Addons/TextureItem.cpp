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

#include "TextureItem.h"

#include <OpenGl_GlCore20.hxx>

TextureItem::TextureItem (const TCollection_AsciiString& theImageFilename,
                          const Handle(Visual3d_Layer)& theLayer):
    myLayer(theLayer), x(0), y(0), myTextureId (-1)
{
    Handle(Image_AlienPixMap) theImage=new Image_AlienPixMap();
    theImage->Load(theImageFilename);
    if (!theImage.IsNull()) {
        myW = theImage->Width();
        myH = theImage->Height();
        
        unsigned char *aData = (unsigned char*)Standard::Allocate ((myW * myH) << 2);
        unsigned char *p = aData;
        Standard_Integer i, j;
        Quantity_Color aColor;
        Quantity_Parameter theAlpha;
                
        for ( j = 0; j < myH; j++) {
            for ( i = 0; i < myW; i++ ) {
                aColor = theImage->PixelColor (i, j, theAlpha);
                *p++ = (unsigned char)(255 * aColor.Red());
                *p++ = (unsigned char)(255 * aColor.Green());
                *p++ = (unsigned char)(255 * aColor.Blue());
                *p++ = (unsigned char)(255 * theAlpha);
            }
        }
        Init (aData);
    }
    if (!myLayer.IsNull ())
      myLayer->AddLayerItem (this);
}

/*! Destroys the object and frees all allocated resources.
*/
TextureItem::~TextureItem()
{
    if (myTextureId > 0)
        glDeleteTextures (1, &myTextureId);
    myTextureId = -1;
}

void TextureItem::Init(unsigned char* theData)
{
    glGenTextures(1, &myTextureId);
    glBindTexture(GL_TEXTURE_2D, myTextureId);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

    glPixelStorei(GL_UNPACK_ALIGNMENT, 4);
    glTexImage2D(GL_TEXTURE_2D, 0, 4, myW, myH, 0, GL_RGBA, GL_UNSIGNED_BYTE, theData);

    Standard_Address aData = theData;
    Standard::Free (aData);
}

// render item
void TextureItem::RedrawLayerPrs ()
{
    glEnable(GL_TEXTURE_2D);
    glEnable(GL_BLEND);
    glBindTexture(GL_TEXTURE_2D, myTextureId);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
    glBegin(GL_QUADS);
    
    glTexCoord2f (0.0f, 0.0f); glVertex2f (x, y);
    glTexCoord2f (1.0f, 0.0f); glVertex2f (x + myW, y);
    glTexCoord2f (1.0f, 1.0f); glVertex2f (x + myW, y + myH);
    glTexCoord2f (0.0f, 1.0f); glVertex2f (x, y + myH);

    glEnd();
    glDisable(GL_BLEND);
    glDisable(GL_TEXTURE_2D);
}
