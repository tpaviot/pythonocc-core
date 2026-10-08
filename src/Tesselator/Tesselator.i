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
%module(threads="1") Tesselator;

%{
#include <ShapeTesselator.h>
#include <TopologyTesselator.h>
#include <Standard.hxx>
#define SWIG_FILE_WITH_INIT
%}

/* The GIL is held by default; TopologyTesselator.Compute releases it while
   it meshes, so that other Python threads run meanwhile */
%nothread;

%include ../SWIG_files/common/ExceptionCatcher.i
%include ../SWIG_files/common/OccHandle.i
%include "python/std_string.i"
%include "std_vector.i"
%include "typemaps.i"

%template(vector_float) std::vector<float>;

%include ../SWIG_files/common/numpy.i

%init %{
/* the init code is in SWIG_mod_exec, returning an int, since SWIG 4.4:
   import_array() returns NULL, i.e. success, if numpy can't be imported */
#if SWIG_VERSION >= 0x040400
        import_array1(-1);
#else
        import_array();
#endif
%}

%pythoncode {
    import numpy as np
}

%apply (float* ARGOUT_ARRAY1, int DIM1) {(float* floatsArgout, int aSizeArgout)};
%apply (unsigned int* ARGOUT_ARRAY1, int DIM1) {(unsigned int* indicesArgout, int aSizeArgout)};

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
        %feature("docstring") Compute "Compute once. Lower mesh_quality gives a finer mesh.
reuse_mesh=True preserves sufficiently fine OCCT triangulations; an existing
finer mesh is not coarsened. The default rebuilds at the requested quality.";
        void Compute(bool compute_edges=false, float mesh_quality=1.0, bool parallel=false, bool reuse_mesh=false);
        void GetVertex(int ivert, float& x, float& y, float& z);
        void GetNormal(int inorm, float& x, float& y, float& z);
        void GetTriangleIndex(int triangleIdx, int& v1, int& v2, int& v3);
        void GetEdgeVertex(int iEdge, int ivert, float& x, float& y, float& z);
        void SetDeviation(double aDeviation);
        double GetDeviation();
        const float* VerticesList();
        const float* NormalsList();
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

%feature("autodoc", "1");
%feature("docstring") TopologyTesselator "A mesh of a shape that keeps its topology.

Face i, edge i and vertex i of the mesh are the sub-shapes of index i in
TopologyExplorer order, which is TopExp::MapShapes order minus one:

- Positions(), Normals(): float32 arrays (N, 3), one row per node; each face
  has its own nodes;
- TriangleIndices(): uint32 array (T, 3) of node indices, the winding of the
  reversed faces swapped so that front faces face out;
- FaceRanges(): uint32 array (F, 2), the first triangle and the number of
  triangles of each face; a face that does not triangulate has an empty
  range;
- EdgePositions(): float32 array (M, 3), the nodes of the edges' polylines;
- EdgeRanges(): uint32 array (E, 2), the first node and the number of nodes
  of each edge; an edge of k nodes has k - 1 segments, a degenerated edge
  none;
- VertexPositions(): float32 array (V, 3), one row per vertex.

The shape is meshed by Compute(mesh_quality=1.0, parallel=True), with the
deflections of ShapeTesselator, and the triangulation is stored on it.
Pass reuse_mesh=True to preserve sufficiently fine existing triangulations;
an existing finer mesh is not coarsened. The default rebuilds the mesh.";

class TopologyTesselator {
    public:
        TopologyTesselator(const TopoDS_Shape& aShape);
        %feature("kwargs") Compute;
        %thread Compute;
        void Compute(double mesh_quality=1.0, bool parallel=true, bool reuse_mesh=false);
        void SetDeviation(double aDeviation);
        double GetDeviation();
        int FaceCount();
        int TriangleCount();
        int NodeCount();
        int EdgeCount();
        int EdgeNodeCount();
        int VertexCount();
};

%extend TopologyTesselator {
    void _Floats(int array_id, float* floatsArgout, int aSizeArgout) {
        const std::vector<float>* source = nullptr;
        switch (array_id) {
            case 0: source = &self->Positions(); break;
            case 1: source = &self->Normals(); break;
            case 2: source = &self->EdgePositions(); break;
            default: source = &self->VertexPositions(); break;
        }
        if (static_cast<size_t>(aSizeArgout) != source->size()) {
            throw Standard_DimensionError("Inconsistent array size");
        }
        std::copy(source->begin(), source->end(), floatsArgout);
    }

    void _Indices(int array_id, unsigned int* indicesArgout, int aSizeArgout) {
        const std::vector<std::uint32_t>* source = nullptr;
        switch (array_id) {
            case 0: source = &self->TriangleIndices(); break;
            case 1: source = &self->FaceRanges(); break;
            default: source = &self->EdgeRanges(); break;
        }
        if (static_cast<size_t>(aSizeArgout) != source->size()) {
            throw Standard_DimensionError("Inconsistent array size");
        }
        std::copy(source->begin(), source->end(), indicesArgout);
    }

    %pythoncode {
    def Positions(self):
        """The nodes of the faces, float32 (N, 3)"""
        return self._Floats(0, 3 * self.NodeCount()).reshape(-1, 3)

    def Normals(self):
        """The normals at the nodes of the faces, float32 (N, 3)"""
        return self._Floats(1, 3 * self.NodeCount()).reshape(-1, 3)

    def TriangleIndices(self):
        """The triangles, as node indices, uint32 (T, 3)"""
        return self._Indices(0, 3 * self.TriangleCount()).reshape(-1, 3)

    def FaceRanges(self):
        """The first triangle and the number of triangles of each face,
        uint32 (F, 2)"""
        return self._Indices(1, 2 * self.FaceCount()).reshape(-1, 2)

    def EdgePositions(self):
        """The nodes of the edges' polylines, float32 (M, 3)"""
        return self._Floats(2, 3 * self.EdgeNodeCount()).reshape(-1, 3)

    def EdgeRanges(self):
        """The first node and the number of nodes of each edge, uint32 (E, 2)"""
        return self._Indices(2, 2 * self.EdgeCount()).reshape(-1, 2)

    def VertexPositions(self):
        """The vertices, float32 (V, 3)"""
        return self._Floats(3, 3 * self.VertexCount()).reshape(-1, 3)
    }
};
