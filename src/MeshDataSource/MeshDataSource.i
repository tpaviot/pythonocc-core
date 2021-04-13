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

%template(vector_float) std::vector<float>;
%template(vector_gp_Pnt) std::vector<gp_Pnt>;
%template(vector_int) std::vector<int>;
%template(vector_vector_int) std::vector< std::vector<int> >;
%template(vector_vec) std::vector<gp_Vec>;
%template(vector_vector_vec) std::vector<std::vector<gp_Vec> >;


%wrap_handle(Mesh_DataSource)

class Mesh_DataSource {
    public:
        Mesh_DataSource(std::vector<gp_Pnt> CoordData, std::vector<std::vector<int>> Ele2NodeData);
        void SetElemNormals(std::vector<gp_Vec> ElemNormalsData);
        void SetNodeNormals(std::vector<std::vector<gp_Vec>> NodeNormalsData);
        const TColStd_PackedMapOfInteger& GetAllNodes();
        const TColStd_PackedMapOfInteger& GetAllElements();
};

%make_alias(Mesh_DataSource)
