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
%module MeshDataSource;

%{
#include <MeshDataSource.h>
#include <Standard.hxx>
%}

%include ../SWIG_files/common/ExceptionCatcher.i
%include ../SWIG_files/common/OccHandle.i
%include "python/std_string.i"
%include "std_vector.i"
%include "typemaps.i"


%{
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

%template(vector_float) std::vector<float>;
%template(vector_gp_Pnt) std::vector<gp_Pnt>;
%template(vector_int) std::vector<int>;
%template(vector_vector_int) std::vector< std::vector<int> >;
%template(vector_vec) std::vector<gp_Vec>;
%template(vector_vector_vec) std::vector<std::vector<gp_Vec> >;


%wrap_handle(Mesh_DataSource)

class Mesh_DataSource : public MeshVS_DataSource {
    public:
        Mesh_DataSource(std::vector<gp_Pnt> CoordData, std::vector<std::vector<int>> Ele2NodeData);
        Mesh_DataSource(const opencascade::handle<Poly_Triangulation> & polyTri);
        void SetElemNormals(std::vector<gp_Vec> ElemNormalsData);
        void SetNodeNormals(std::vector<std::vector<gp_Vec>> NodeNormalsData);
        Standard_Boolean GetGeom(const Standard_Integer ID, const Standard_Boolean IsElement, TColStd_Array1OfReal& Coords, Standard_Integer& NbNodes, MeshVS_EntityType& Type);
     	Standard_Boolean GetGeomType(const Standard_Integer ID, const Standard_Boolean IsElement, MeshVS_EntityType& Type);
		Standard_Address GetAddr(const Standard_Integer ID, const Standard_Boolean IsElement);
        const TColStd_PackedMapOfInteger& GetAllNodes();
        const TColStd_PackedMapOfInteger& GetAllElements();
};

%make_alias(Mesh_DataSource)
