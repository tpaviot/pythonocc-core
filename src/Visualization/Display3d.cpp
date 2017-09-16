/*
##Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)
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

#include "Visualization.h"


Display3d::Display3d()
{
}

Display3d::~Display3d()
{
}

static Handle(OpenGl_GraphicDriver)& GetGraphicDriver()
{
  static Handle(OpenGl_GraphicDriver) aGraphicDriver;
  return aGraphicDriver;
}

void Display3d::Init(long window_handle)
{
  printf(" ###### 3D rendering pipe initialisation #####\n");
	printf("Display3d class initialization starting ...\n");
	// Create graphic driver
  Handle(Aspect_DisplayConnection) aDisplayConnection = new Aspect_DisplayConnection();
  printf("Aspect_DisplayConnection created.\n");
  if (GetGraphicDriver().IsNull())
  {
  GetGraphicDriver() = new OpenGl_GraphicDriver (aDisplayConnection);
  }
  printf("Graphic_Driver created.\n");
  // Create V3dViewer and V3d_View
  myV3dViewer = new V3d_Viewer(GetGraphicDriver(), (short* const)"viewer");
  printf("V3d_Viewer created.\n");
  // Create AISInteractiveViewer
  myAISContext = new AIS_InteractiveContext(myV3dViewer);
  printf("AIS_InteractiveContext created.\n");
  // Create view
  myV3dView = myV3dViewer->CreateView();	
  printf("V3d_View created\n");
  // Create Graphic Window
  #ifdef WNT
      myWindow = new WNT_Window((Aspect_Handle) window_handle);
      printf("WNT window created.\n");
  #elif defined(__APPLE__) && !defined(MACOSX_USE_GLX)
      myWindow = new Cocoa_Window((NSView *) window_handle);
      printf("Cocoa window created.\n");
  #else
      myWindow = new Xw_Window(myAISContext->CurrentViewer()->Driver()->GetDisplayConnection(),
                               (Aspect_Handle) window_handle);
      printf("Xw_Window created.\n");
  #endif
  myV3dView->SetWindow(myWindow);
  if (!myWindow->IsMapped()) myWindow->Map();
  printf("Display3d class successfully initialized.\n");
	printf(" ########################################\n");
}

void Display3d::ChangeRenderingParams(int Method,
                                      Standard_Integer RaytracingDepth,
                                      Standard_Boolean IsShadowEnabled,
                                      Standard_Boolean IsReflectionEnabled,
                                      Standard_Boolean IsAntialiasingEnabled,
                                      Standard_Boolean IsTransparentShadowEnabled,
                                      int StereoMode,
                                      int AnaglyphFilter,
                                      Standard_Boolean ToReverseStereo)
{
  Graphic3d_RenderingParams& aParams = myV3dView->ChangeRenderingParams();
  aParams.Method = (Graphic3d_RenderingMode)Method;
  aParams.RaytracingDepth = RaytracingDepth;
  aParams.IsShadowEnabled = IsShadowEnabled;
  aParams.IsAntialiasingEnabled = IsAntialiasingEnabled;
  aParams.IsReflectionEnabled = IsReflectionEnabled;
  aParams.IsTransparentShadowEnabled = IsTransparentShadowEnabled;
  aParams.StereoMode = (Graphic3d_StereoMode)StereoMode;
  aParams.AnaglyphFilter = (Graphic3d_RenderingParams::Anaglyph)AnaglyphFilter;
  aParams.ToReverseStereo =ToReverseStereo;
  myV3dView->Redraw();
}

void Display3d::SetAnaglyphMode(int mode)
{
  Handle(Graphic3d_Camera) aCamera = myV3dView->Camera();
  Graphic3d_RenderingParams*   aParams   = &myV3dView->ChangeRenderingParams();
  
  aParams->StereoMode = Graphic3d_StereoMode_Anaglyph;
  //aParams->AnaglyphFilter = Graphic3d_RenderingParams::Anaglyph_RedCyan_Simple;
  aParams->AnaglyphFilter = (Graphic3d_RenderingParams::Anaglyph)mode;

  GetGraphicDriver()->ChangeOptions().contextStereo = true;
  aCamera->SetProjectionType (Graphic3d_Camera::Projection_Stereo);
  myV3dView->Redraw();
}

void Display3d::SetVBBO()
{
  GetGraphicDriver()->ChangeOptions().vboDisable = false;
}

void Display3d::UnsetVBBO()
{
  GetGraphicDriver()->ChangeOptions().vboDisable = true;
}

void Display3d::Test()
{
      BRepPrimAPI_MakeBox S(100,50,40);
      Handle(AIS_Shape) anAISShape = new AIS_Shape(S.Shape());
      myAISContext->Display(anAISShape);
      myV3dView->ZFitAll();
      myV3dView->FitAll();
}
