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
  : myIsOffscreen(false), mySizeX(0), mySizeY(0)
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

//=========================================================
// Function : WClass
// Purpose  :
//=========================================================
static const Handle(Standard_Transient)& WClass()
{
  static Handle(Standard_Transient) aWindowClass;
#ifdef WNT
  if (aWindowClass.IsNull())
  {
    aWindowClass = new WNT_WClass ("PyOCC_Class", (void*)DefWindowProc,
                                   CS_VREDRAW | CS_HREDRAW, 0, 0,
                                   ::LoadCursor (NULL, IDC_ARROW));
  }
#endif
  return aWindowClass;
}


Standard_Boolean Display3d::InitOffscreen(int size_x, int size_y)
{
  printf(" ###### 3D rendering pipe initialisation #####\n");
  printf("Display3d class initialization starting ...\n");

  myIsOffscreen = true;

  // Create graphic driver
  Handle(Aspect_DisplayConnection) aDisplayConnection = new Aspect_DisplayConnection();
  printf("Aspect_DisplayConnection created.\n");
  if (GetGraphicDriver().IsNull())
  {
    GetGraphicDriver() = new OpenGl_GraphicDriver (aDisplayConnection);
  }
  printf("Graphic_Driver created.\n");
  // Create V3dViewer and V3d_View
  myV3dViewer = new V3d_Viewer(GetGraphicDriver());
  printf("V3d_Viewer created.\n");
  // Create AISInteractiveViewer
  myAISContext = new AIS_InteractiveContext(myV3dViewer);
  printf("AIS_InteractiveContext created.\n");
  // Create view
  myV3dView = myV3dViewer->CreateView();  
  printf("V3d_View created\n");

  SetSize(size_x, size_y);

  printf("Display3d class successfully initialized.\n");
  printf(" ########################################\n");
  return true;
}

Standard_Boolean Display3d::IsOffscreen()
{
  return myIsOffscreen;
}

Standard_Boolean Display3d::SetSize(int size_x, int size_y)
{
  if(myIsOffscreen)
  {
    mySizeX = size_x;
    mySizeY = size_y;

#ifdef WNT
      myWindow = new WNT_Window ("PythonOCC",
                                    Handle(WNT_WClass)::DownCast (WClass()),
                                    WS_OVERLAPPEDWINDOW,
                                    0, 0,
                                    size_x, size_y,
                                    Quantity_NOC_BLACK);
      myWindow->SetVirtual (true);
#elif defined(__APPLE__) && !defined(MACOSX_USE_GLX)
      myWindow = new Cocoa_Window("PythonOCC",
                                  0, 0,
                                  size_x, size_y);
      printf("Cocoa window created.\n");
      myWindow->SetVirtual (true);
#else
      myWindow = new Xw_Window (myAISContext->CurrentViewer()->Driver()->GetDisplayConnection(),
                                   "PythonOCC",
                                   0, 0,
                                   size_x, size_y);
      myWindow->SetVirtual (true);
#endif
    myV3dView->SetWindow(myWindow);
    return true;
  }
  return false;
}

Standard_Boolean Display3d::GetSize(int &size_x, int &size_y)
{
  if(myIsOffscreen)
  {
    size_x = mySizeX;
    size_y = mySizeY;
    return true;
  }
  return false;
}

Standard_Boolean Display3d::GetImageData(const char* &data, size_t &size, const Graphic3d_BufferType& theBufferType)
{
  if(myIsOffscreen)
  {
    static Image_PixMap anImage;
    if (myV3dView->ToPixMap (anImage, mySizeX, mySizeY, theBufferType))
    {
      data = (const char*)anImage.Data();
      size = anImage.SizeBytes();
      return true;
    }
  }
  return false;
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
  myV3dViewer = new V3d_Viewer(GetGraphicDriver());
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
  Graphic3d_RenderingParams* aParams = &myV3dView->ChangeRenderingParams();
  
  aParams->StereoMode = Graphic3d_StereoMode_Anaglyph;
  aParams->AnaglyphFilter = (Graphic3d_RenderingParams::Anaglyph)mode;

  GetGraphicDriver()->ChangeOptions().contextStereo = true;
  aCamera->SetProjectionType (Graphic3d_Camera::Projection_Stereo);
  myV3dView->Redraw();
}

void Display3d::EnableVBO()
{
  GetGraphicDriver()->ChangeOptions().vboDisable = false;
}

void Display3d::DisableVBO()
{
  GetGraphicDriver()->ChangeOptions().vboDisable = true;
}

void Display3d::Test()
{
      BRepPrimAPI_MakeBox S(100,50,40);
      Handle(AIS_Shape) anAISShape = new AIS_Shape(S.Shape());
      myAISContext->Display(anAISShape, Standard_False);
      myV3dView->ZFitAll();
      myV3dView->FitAll();
}
