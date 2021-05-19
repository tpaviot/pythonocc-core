/*
##Copyright 2021 Thomas Paviot (tpaviot@gmail.com)
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
%module MeshDS;

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%{
#define SWIG_FILE_WITH_INIT
%}

%include ../SWIG_files/common/CommonIncludes.i
%include ../SWIG_files/common/ExceptionCatcher.i
%include ../SWIG_files/common/FunctionTransformers.i
%include ../SWIG_files/common/Operators.i
%include ../SWIG_files/common/OccHandle.i
%include ../SWIG_files/common/numpy.i

%include "std_vector.i"
%include "typemaps.i"


%{
#include <MeshDataSource.h>
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<MeshVS_module.hxx>
#include<Geom_module.hxx>
#include<Bnd_module.hxx>
#include<AIS_module.hxx>
#include<V3d_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<Graphic3d_module.hxx>
#include<Message_module.hxx>
#include<Aspect_module.hxx>
#include<TopoDS_module.hxx>
#include<Poly_module.hxx>
#include<StdSelect_module.hxx>
#include<TShort_module.hxx>
#include<Media_module.hxx>
#include<SelectMgr_module.hxx>
#include<TCollection_module.hxx>
#include<Prs3d_module.hxx>
#include<Select3D_module.hxx>
%};

%import Standard.i
%import MeshVS.i
%import Poly.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

%init %{
   import_array();
%}

%template(vector_float) std::vector<float>;
%template(vector_gp_Pnt) std::vector<gp_Pnt>;
%template(vector_int) std::vector<int>;
%template(vector_vector_int) std::vector< std::vector<int> >;
%template(vector_vec) std::vector<gp_Vec>;
%template(vector_vector_vec) std::vector<std::vector<gp_Vec> >;
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* Vertices, int nVerts1, int nVerts2) };
%apply (int* IN_ARRAY2, int DIM1, int DIM2) { (int* Faces, int nFaces1, int nFaces2) };

%wrap_handle(MeshDS_DataSource)

class MeshDS_DataSource : public MeshVS_DataSource {
    public:
        MeshDS_DataSource(std::vector<gp_Pnt> CoordData, std::vector<std::vector<int>> Ele2NodeData);
        MeshDS_DataSource(double* Vertices, int nVerts1, int nVerts2, int* Faces, int nFaces1, int nFaces2);
        MeshDS_DataSource(const opencascade::handle<Poly_Triangulation> & polyTri);
        void SetElemNormals(std::vector<gp_Vec> ElemNormalsData);
        void SetNodeNormals(std::vector<std::vector<gp_Vec>> NodeNormalsData);
        Standard_Boolean GetGeom(Standard_Integer ID, Standard_Boolean IsElement, TColStd_Array1OfReal& Coords, Standard_Integer &OutValue, MeshVS_EntityType& Type);
     	Standard_Boolean GetGeomType(Standard_Integer ID, Standard_Boolean IsElement, MeshVS_EntityType& Type);
		Standard_Address GetAddr(Standard_Integer ID, Standard_Boolean IsElement);
		Standard_Boolean GetNodesByElement(Standard_Integer ID, TColStd_Array1OfInteger& NodeIDs, Standard_Integer &OutValue);
        const TColStd_PackedMapOfInteger& GetAllNodes();
        const TColStd_PackedMapOfInteger& GetAllElements();
        Standard_Boolean GetNormal(Standard_Integer Id, const Standard_Integer Max, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
		Standard_Boolean GetNodeNormal(Standard_Integer rankNode, Standard_Integer ElementId, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);
};

%make_alias(MeshDS_DataSource)

%extend MeshDS_DataSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
