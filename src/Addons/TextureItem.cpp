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

#include <GL/gl.h>
#include <GL/glu.h>

TextureItem::TextureItem (const TCollection_AsciiString& theImageFilename,
                          V3d_View* theView,
                          const Handle(Visual3d_Layer)& theLayer):
    myLayer(theLayer), myView(theView), x(0), y(0), TypeOfPosition(0), myTextureId (-1)
{
    Handle(Image_AlienPixMap) theImage=new Image_AlienPixMap();
    theImage->Load(theImageFilename);
    if (!theImage.IsNull()) {
        myW = theImage->Width();
        myH = theImage->Height();
        
        unsigned char *aData = (unsigned char*)Standard::Allocate ((myW * myH) << 2);
        unsigned char *p = aData;
        Standard_Integer x, y;
        Quantity_Color aColor;
        Quantity_Parameter theAlpha;
                
        for ( y = 0; y < myH; y++) {
            for ( x = 0; x < myW; x++ ) {
                aColor = theImage->PixelColor (x, y, theAlpha);
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
    //int aW, aH;
    //myView->Window()->Size (aW, aH);
    //float aCoord[4][4][2] = {
    //    { {0, aH - myH}, {myW, aH - myH}, {myW, aH}, {0, aH} }, //Aspect_TOC_BOTTOM_LEFT
    //    { {aW - myW, aH - myH}, {aW, aH - myH}, {aW, aH}, {aW - myW, aH} }, //Aspect_TOC_BOTTOM_RIGHT
    //    { {0, 0}, {myW, 0}, {myW, myH}, {0, myH} }, //Aspect_TOC_TOP_LEFT
    //    { {aW - myW, 0}, {aW, 0}, {aW, myH}, {aW - myW, myH} }  //Aspect_TOC_TOP_RIGHT
    //};
    //int n = myPos - Aspect_TOC_BOTTOM_LEFT;

    glEnable(GL_TEXTURE_2D);
    glEnable(GL_BLEND);
    glBindTexture(GL_TEXTURE_2D, myTextureId);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
    glBegin(GL_QUADS);
    if (TypeOfPosition==0) {//absolute}
      glTexCoord2f (0.0f, 0.0f); glVertex2f (x, y);
      glTexCoord2f (1.0f, 0.0f); glVertex2f (x + myW, y);
      glTexCoord2f (1.0f, 1.0f); glVertex2f (x + myW, y + myH);
      glTexCoord2f (0.0f, 1.0f); glVertex2f (x, y + myH);
    }
    else if (TypeOfPosition==1) {//relative
        printf("relative\n");
      int aW, aH;
      myView->Window()->Size (aW, aH);
      glTexCoord2f (0.0f, 0.0f); glVertex2f (x*aW, y*aH);
      glTexCoord2f (1.0f, 0.0f); glVertex2f (x*aW + myW, y*aH);
      glTexCoord2f (1.0f, 1.0f); glVertex2f (x*aW + myW, y*aH + myH);
      glTexCoord2f (0.0f, 1.0f); glVertex2f (x*aW, y*aH + myH);
    }
    glEnd();
    glDisable(GL_BLEND);
    glDisable(GL_TEXTURE_2D);
}
