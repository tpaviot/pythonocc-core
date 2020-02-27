/*
##Copyright 2008-2016 Thomas Paviot (tpaviot@gmail.com)
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
%module Visualization;

%{
#include <Visualization.h>
#include <Standard.hxx>
%}

%include ../SWIG_files/common/ExceptionCatcher.i
%include ../SWIG_files/common/OccHandle.i
%include "python/std_string.i"
%include "std_vector.i"
%include "typemaps.i"

%wrap_handle(AIS_InteractiveContext)
%wrap_handle(V3d_View)
%wrap_handle(V3d_Viewer)

class Display3d {
 public:
    %feature("autodoc", "1");
    Display3d();
    %feature("autodoc", "1");
    ~Display3d();
    %feature("autodoc", "1");
    void Init(const long handle);
    %feature("autodoc", "1");
    void SetAnaglyphMode(int mode);
    %feature("autodoc", "1");
    void SetNbMsaaSample(int nb);
    %feature("autodoc", "1");
    void ChangeRenderingParams(int  Method,
                               int  RaytracingDepth,
                               bool IsShadowEnabled,
                               bool IsReflectionEnabled,
                               bool IsAntialiasingEnabled,
                               bool IsTransparentShadowEnabled,
                               int  StereoMode,
                               int  AnaglyphFilter,
                               bool ToReverseStere);
    %feature("autodoc", "1");
    void EnableVBO();
    %feature("autodoc", "1");
    void DisableVBO();
    %feature("autodoc", "1");
    Handle_V3d_View& GetView();
    %feature("autodoc", "1");
    Handle_V3d_Viewer& GetViewer();
    %feature("autodoc", "1");
    Handle_AIS_InteractiveContext GetContext();
    %feature("autodoc", "1");
    void Test();
    %feature("autodoc", "1");
    bool InitOffscreen(int size_x, int size_y);
    %feature("autodoc", "1");
    bool SetSize(int size_x, int size_y);
    %feature("autodoc", "1");
    bool IsOffscreen();
};

%extend Display3d {
    PyObject* GetImageData(int bufType = 0) {
        const char * data;
        size_t size = 0;
        Graphic3d_BufferType theBufferType = (Graphic3d_BufferType)bufType;

        if ($self->GetImageData(data, size, theBufferType)) {
            return PyBytes_FromStringAndSize(data, (Py_ssize_t)size);
        }
        Py_RETURN_NONE;
    }

    PyObject* GetSize() {
        int size_x;
        int size_y;

        if ($self->GetSize(size_x, size_y)) {
            return Py_BuildValue("ii", size_x, size_y);
        }
        Py_RETURN_NONE;
    }
};
