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

static Handle(Graphic3d_GraphicDriver)& GetGraphicDriver()
{
  static Handle(Graphic3d_GraphicDriver) aGraphicDriver;
  return aGraphicDriver;
}

void Display3d::Init(long window_handle,
                     bool ffpEnabled,
                     bool buffersNoSwapEnabled,
                     bool glslWarningsEnabled)
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

  // set OpenGL variables
  myV3dViewer = new V3d_Viewer(GetGraphicDriver(), (short* const)"viewer");
  Handle(OpenGl_GraphicDriver) aDriver = Handle(OpenGl_GraphicDriver)::DownCast (myV3dViewer->Driver());

  // Enables FFP (fixed-function pipeline), do not use built-in GLSL programs
  // (ON by default on desktop OpenGL and OFF on OpenGL ES)
  aDriver->ChangeOptions().ffpEnable = ffpEnabled;

  // Specify that driver should not swap back/front buffers at the end of frame
  // Useful when OCCT Viewer is integrated into existing OpenGL rendering pipeline as part
  // thus swapping part is performed outside ( eg, let Qt handle this )
  // Standard_False by default.
  aDriver->ChangeOptions().buffersNoSwap = buffersNoSwapEnabled;

  // Print GLSL program compilation/linkage warnings, if any
  aDriver->ChangeOptions().glslWarnings = glslWarningsEnabled;

  printf("V3d_Viewer created.\n");
  myV3dView = myV3dViewer->CreateView();	
  printf("V3d_View created\n");
  myV3dView->SetWindow(myWindow);
  if (!myWindow->IsMapped()) myWindow->Map();
	// Create AISInteractiveViewer
	myAISContext = new AIS_InteractiveContext(myV3dViewer);
	printf("AIS_InteractiveContext created.\n");
  printf("Display3d class successfully initialized.\n");
	printf(" ########################################\n");
}

//void Display3d::ChangeRenderingParams( // Specifies rendering mode
//                            // - Graphic3d_RM_RASTERIZATION: enables OpenGL rasterization mode;
//                            // - Graphic3d_RM_RAYTRACING: enables GPU ray-tracing mode.
//                            int RenderingMethod,
//                            // Maximum ray-tracing depth.
//                            int RaytracingDepth,
//                            // Enables/disables shadows rendering.
//                            bool IsShadowEnabled,
//                            // Enables/disables specular reflections.
//                            bool IsReflectionEnabled,
//                            // Enables/disables adaptive anti-aliasing.
//                            bool IsAntialiasingEnabled,
//                            // Enables/disables light propagation through transparent media.
//                            bool IsTransparentShadowEnabled)
//{
//  myV3dView->ChangeRenderingParams().Method = RenderingMethod
//  myV3dView->ChangeRenderingParams().RaytracingDepth = RaytracingDepth
//  myV3dView->ChangeRenderingParams().IsShadowEnabled = IsShadowEnabled
//  myV3dView->ChangeRenderingParams().IsReflectionEnabled = IsReflectionEnabled
//  myV3dView->ChangeRenderingParams().IsAntialiasingEnabled = IsAntialiasingEnabled
//  myV3dView->ChangeRenderingParams().IsTransparentShadowEnabled = IsTransparentShadowEnabled
//}

void Display3d::Test()
{
      BRepPrimAPI_MakeBox S(100,50,40);
      Handle(AIS_Shape) anAISShape = new AIS_Shape(S.Shape());
      myAISContext->Display(anAISShape);
      myV3dView->ZFitAll();
      myV3dView->FitAll();
}
