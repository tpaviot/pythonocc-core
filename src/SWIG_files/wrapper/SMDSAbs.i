/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

*/
%module (package="OCC") SMDSAbs

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include SMDSAbs_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum SMDSAbs_ElementType {
	SMDSAbs_All = 0,
	SMDSAbs_Node = 1,
	SMDSAbs_Edge = 2,
	SMDSAbs_Face = 3,
	SMDSAbs_Volume = 4,
	SMDSAbs_0DElement = 5,
	SMDSAbs_NbElementTypes = 6,
};

enum SMDSAbs_GeometryType {
	SMDSGeom_POINT = 0,
	SMDSGeom_EDGE = 1,
	SMDSGeom_TRIANGLE = 2,
	SMDSGeom_QUADRANGLE = 3,
	SMDSGeom_POLYGON = 4,
	SMDSGeom_TETRA = 5,
	SMDSGeom_PYRAMID = 6,
	SMDSGeom_HEXA = 7,
	SMDSGeom_PENTA = 8,
	SMDSGeom_POLYHEDRA = 9,
};

enum SMDSAbs_ElementOrder {
	ORDER_ANY = 0,
	ORDER_LINEAR = 1,
	ORDER_QUADRATIC = 2,
};

enum SMDSAbs_EntityType {
	SMDSEntity_Node = 0,
	SMDSEntity_0D = 1,
	SMDSEntity_Edge = 2,
	SMDSEntity_Quad_Edge = 3,
	SMDSEntity_Triangle = 4,
	SMDSEntity_Quad_Triangle = 5,
	SMDSEntity_Quadrangle = 6,
	SMDSEntity_Quad_Quadrangle = 7,
	SMDSEntity_Polygon = 8,
	SMDSEntity_Quad_Polygon = 9,
	SMDSEntity_Tetra = 10,
	SMDSEntity_Quad_Tetra = 11,
	SMDSEntity_Pyramid = 12,
	SMDSEntity_Quad_Pyramid = 13,
	SMDSEntity_Hexa = 14,
	SMDSEntity_Quad_Hexa = 15,
	SMDSEntity_Penta = 16,
	SMDSEntity_Quad_Penta = 17,
	SMDSEntity_Polyhedra = 18,
	SMDSEntity_Quad_Polyhedra = 19,
	SMDSEntity_Last = 20,
};

/* end public enums declaration */

