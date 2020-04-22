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
%module Tesselator;

%{
#include <ShapeTesselator.h>
#include <Standard.hxx>
%}

%include ../SWIG_files/common/ExceptionCatcher.i
%include ../SWIG_files/common/OccHandle.i
%include "python/std_string.i"
%include "std_vector.i"
%include "typemaps.i"

%template(vector_float) std::vector<float>;

%typemap(out) float [ANY] {
  int i;
  $result = PyList_New($1_dim0);
  for (i = 0; i < $1_dim0; i++) {
    PyObject *o = PyFloat_FromFloat((float) $1[i]);
    PyList_SetItem($result,i,o);
  }
}

%apply int& OUTPUT {int& v1, int& v2, int& v3}
%apply float& OUTPUT {float& x, float& y, float& z}

class ShapeTesselator {
    public:
        %feature("autodoc", "1");
        ShapeTesselator(TopoDS_Shape aShape);
        %feature("autodoc", "1");
        ~ShapeTesselator();
        %feature("kwargs") Compute;
        void Compute(bool compute_edges=false, float mesh_quality=1.0, bool parallel=false);
        void GetVertex(int ivert, float& x, float& y, float& z);
        void GetNormal(int inorm, float& x, float& y, float& z);
        void GetTriangleIndex(int triangleIdx, int& v1, int& v2, int& v3);
        void GetEdgeVertex(int iEdge, int ivert, float& x, float& y, float& z);
        float* VerticesList();
        int ObjGetTriangleCount();
        int ObjGetInvalidTriangleCount();
        int ObjGetVertexCount();
        int ObjGetNormalCount();
        int ObjGetEdgeCount();
        int ObjEdgeGetVertexCount(int iEdge);
        std::string ExportShapeToX3DTriangleSet();
        std::string ExportShapeToThreejsJSONString(char *shape_function_name);
        %feature("kwargs") ExportShapeToX3D;
        void ExportShapeToX3D(char *filename, int diffR=1, int diffG=0, int diffB=0);
        std::vector<float> GetVerticesPositionAsTuple();
        std::vector<float> GetNormalsAsTuple();
};
