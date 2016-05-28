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

#if !defined __OCC3d_Renderer__
#define __OCC3d_Renderer__

#include <AIS_InteractiveContext.hxx>
#include <BRepPrimAPI_MakeBox.hxx>
#include <V3d_Viewer.hxx>
#include <V3d_View.hxx>
#include <AIS_Shape.hxx>
#include <Handle_Graphic3d_GraphicDriver.hxx>
#include <OpenGl_GraphicDriver.hxx>
#include <Aspect_DisplayConnection.hxx>

#include <cstdlib>
  
#ifdef WNT
  #include <WNT_Window.hxx>
#elif defined(__APPLE__) && !defined(MACOSX_USE_GLX)
  #include <Cocoa_Window.hxx>
#else
  #include <Xw_Window.hxx>
#endif

class Display3d 
{	
public:
	Standard_EXPORT Display3d();
	Standard_EXPORT virtual ~Display3d();
	Standard_EXPORT void Init(long window_handle);
	Standard_EXPORT Handle_V3d_View& GetView() {return myV3dView;};
	Standard_EXPORT Handle_V3d_Viewer& GetViewer() {return myV3dViewer;};
	Standard_EXPORT Handle_AIS_InteractiveContext GetContext() {return myAISContext;};
	Standard_EXPORT void Test();
    
protected:
   Handle_AIS_InteractiveContext myAISContext;
   Handle_V3d_Viewer myV3dViewer;
   Handle_V3d_View myV3dView;
   #ifdef WNT
     Handle_WNT_Window myWindow;
   #elif defined(__APPLE__) && !defined(MACOSX_USE_GLX)
     Handle_Cocoa_Window myWindow;
   #else
     Handle_Xw_Window myWindow;
   #endif
};

#endif
