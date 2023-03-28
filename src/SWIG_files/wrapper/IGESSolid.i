/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define IGESSOLIDDOCSTRING
"IGESSolid module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_igessolid.html"
%enddef
%module (package="OCC.Core", docstring=IGESSOLIDDOCSTRING) IGESSolid


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<IGESSolid_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<IGESGeom_module.hxx>
#include<Interface_module.hxx>
#include<IGESBasic_module.hxx>
#include<TColgp_module.hxx>
#include<MoniTool_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IGESData.i
%import gp.i
%import TColStd.i
%import IGESGeom.i
%import Interface.i
%import IGESBasic.i
%import TColgp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IGESSolid_Block)
%wrap_handle(IGESSolid_BooleanTree)
%wrap_handle(IGESSolid_ConeFrustum)
%wrap_handle(IGESSolid_ConicalSurface)
%wrap_handle(IGESSolid_Cylinder)
%wrap_handle(IGESSolid_CylindricalSurface)
%wrap_handle(IGESSolid_EdgeList)
%wrap_handle(IGESSolid_Ellipsoid)
%wrap_handle(IGESSolid_Face)
%wrap_handle(IGESSolid_GeneralModule)
%wrap_handle(IGESSolid_Loop)
%wrap_handle(IGESSolid_ManifoldSolid)
%wrap_handle(IGESSolid_PlaneSurface)
%wrap_handle(IGESSolid_Protocol)
%wrap_handle(IGESSolid_ReadWriteModule)
%wrap_handle(IGESSolid_RightAngularWedge)
%wrap_handle(IGESSolid_SelectedComponent)
%wrap_handle(IGESSolid_Shell)
%wrap_handle(IGESSolid_SolidAssembly)
%wrap_handle(IGESSolid_SolidInstance)
%wrap_handle(IGESSolid_SolidOfLinearExtrusion)
%wrap_handle(IGESSolid_SolidOfRevolution)
%wrap_handle(IGESSolid_SpecificModule)
%wrap_handle(IGESSolid_Sphere)
%wrap_handle(IGESSolid_SphericalSurface)
%wrap_handle(IGESSolid_ToroidalSurface)
%wrap_handle(IGESSolid_Torus)
%wrap_handle(IGESSolid_VertexList)
%wrap_handle(IGESSolid_HArray1OfFace)
%wrap_handle(IGESSolid_HArray1OfLoop)
%wrap_handle(IGESSolid_HArray1OfShell)
%wrap_handle(IGESSolid_HArray1OfVertexList)
/* end handles declaration */

/* templates */
%template(IGESSolid_Array1OfFace) NCollection_Array1<opencascade::handle<IGESSolid_Face>>;

%extend NCollection_Array1<opencascade::handle<IGESSolid_Face>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(IGESSolid_Array1OfLoop) NCollection_Array1<opencascade::handle<IGESSolid_Loop>>;

%extend NCollection_Array1<opencascade::handle<IGESSolid_Loop>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(IGESSolid_Array1OfShell) NCollection_Array1<opencascade::handle<IGESSolid_Shell>>;

%extend NCollection_Array1<opencascade::handle<IGESSolid_Shell>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(IGESSolid_Array1OfVertexList) NCollection_Array1<opencascade::handle<IGESSolid_VertexList>>;

%extend NCollection_Array1<opencascade::handle<IGESSolid_VertexList>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <opencascade::handle <IGESSolid_Face>> IGESSolid_Array1OfFace;
typedef NCollection_Array1 <opencascade::handle <IGESSolid_Loop>> IGESSolid_Array1OfLoop;
typedef NCollection_Array1 <opencascade::handle <IGESSolid_Shell>> IGESSolid_Array1OfShell;
typedef NCollection_Array1 <opencascade::handle <IGESSolid_VertexList>> IGESSolid_Array1OfVertexList;
/* end typedefs declaration */

/******************
* class IGESSolid *
******************/
%rename(igessolid) IGESSolid;
class IGESSolid {
	public:
		/****************** Init ******************/
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Prepares dynamic data (protocol, modules) for this package.

Returns
-------
void
") Init;
		static void Init();

		/****************** Protocol ******************/
		/**** md5 signature: da644d4f205a48310cd40d92a98d10ff ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol for this package.

Returns
-------
opencascade::handle<IGESSolid_Protocol>
") Protocol;
		static opencascade::handle<IGESSolid_Protocol> Protocol();

};


%extend IGESSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IGESSolid_Block *
************************/
class IGESSolid_Block : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_Block ******************/
		/**** md5 signature: 1f70eca21f741fa66a90bcf6da8b6110 ****/
		%feature("compactdefaultargs") IGESSolid_Block;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_Block;
		 IGESSolid_Block();

		/****************** Corner ******************/
		/**** md5 signature: fda386c0534e3555b674b5fa7d323198 ****/
		%feature("compactdefaultargs") Corner;
		%feature("autodoc", "Returns the corner point coordinates of the block.

Returns
-------
gp_Pnt
") Corner;
		gp_Pnt Corner();

		/****************** Init ******************/
		/**** md5 signature: e536241fb6e8f6226576a446532ae465 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class block - asize : length in each local directions - acorner : corner point coordinates. default (0,0,0) - axaxis : unit vector defining local x-axis default (1,0,0) - azaxis : unit vector defining local z-axis default (0,0,1).

Parameters
----------
aSize: gp_XYZ
aCorner: gp_XYZ
aXAxis: gp_XYZ
aZAxis: gp_XYZ

Returns
-------
None
") Init;
		void Init(const gp_XYZ & aSize, const gp_XYZ & aCorner, const gp_XYZ & aXAxis, const gp_XYZ & aZAxis);

		/****************** Size ******************/
		/**** md5 signature: 03ffdb400360ad840f77e198ef4df260 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the size of the block.

Returns
-------
gp_XYZ
") Size;
		gp_XYZ Size();

		/****************** TransformedCorner ******************/
		/**** md5 signature: 38bec2d7db20119003075789a0c3d179 ****/
		%feature("compactdefaultargs") TransformedCorner;
		%feature("autodoc", "Returns the corner point coordinates of the block after applying the transformationmatrix.

Returns
-------
gp_Pnt
") TransformedCorner;
		gp_Pnt TransformedCorner();

		/****************** TransformedXAxis ******************/
		/**** md5 signature: 91874a05de65b50c61b6c322912add12 ****/
		%feature("compactdefaultargs") TransformedXAxis;
		%feature("autodoc", "Returns the direction defining the local x-axis after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedXAxis;
		gp_Dir TransformedXAxis();

		/****************** TransformedYAxis ******************/
		/**** md5 signature: 975a8203d2f889c70aba4ccc364f5648 ****/
		%feature("compactdefaultargs") TransformedYAxis;
		%feature("autodoc", "Returns the direction defining the local y-axis after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedYAxis;
		gp_Dir TransformedYAxis();

		/****************** TransformedZAxis ******************/
		/**** md5 signature: 7c451de23c4e606958740b08cecdb471 ****/
		%feature("compactdefaultargs") TransformedZAxis;
		%feature("autodoc", "Returns the direction defining the local z-axis after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedZAxis;
		gp_Dir TransformedZAxis();

		/****************** XAxis ******************/
		/**** md5 signature: 215a9c944bc0106b48b5bef8d83abf2a ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the direction defining the local x-axis.

Returns
-------
gp_Dir
") XAxis;
		gp_Dir XAxis();

		/****************** XLength ******************/
		/**** md5 signature: ce67990e12cd771d97f643f8a8ffae48 ****/
		%feature("compactdefaultargs") XLength;
		%feature("autodoc", "Returns the length of the block along the local x-direction.

Returns
-------
float
") XLength;
		Standard_Real XLength();

		/****************** YAxis ******************/
		/**** md5 signature: a72995a5f378477cdd3907bee256e1cc ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the direction defining the local y-axis it is the cross product of zaxis and xaxis.

Returns
-------
gp_Dir
") YAxis;
		gp_Dir YAxis();

		/****************** YLength ******************/
		/**** md5 signature: 05adb1a279a2a723a9eaad9632c694de ****/
		%feature("compactdefaultargs") YLength;
		%feature("autodoc", "Returns the length of the block along the local y-direction.

Returns
-------
float
") YLength;
		Standard_Real YLength();

		/****************** ZAxis ******************/
		/**** md5 signature: 856a36006cff87299ee97ae4fd9ba362 ****/
		%feature("compactdefaultargs") ZAxis;
		%feature("autodoc", "Returns the direction defining the local x-axis.

Returns
-------
gp_Dir
") ZAxis;
		gp_Dir ZAxis();

		/****************** ZLength ******************/
		/**** md5 signature: ea0e53d0a06ae7ec0b732e1f01fd1c9d ****/
		%feature("compactdefaultargs") ZLength;
		%feature("autodoc", "Returns the length of the block along the local z-direction.

Returns
-------
float
") ZLength;
		Standard_Real ZLength();

};


%make_alias(IGESSolid_Block)

%extend IGESSolid_Block {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESSolid_BooleanTree *
******************************/
class IGESSolid_BooleanTree : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_BooleanTree ******************/
		/**** md5 signature: 92552f5d920d2733eea0b212b762e446 ****/
		%feature("compactdefaultargs") IGESSolid_BooleanTree;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_BooleanTree;
		 IGESSolid_BooleanTree();

		/****************** Init ******************/
		/**** md5 signature: 885c7978084b7a8ad319e0efef48f96b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class booleantree - operands : array containing pointer to de of operands - operations : array containing integer type for operations.

Parameters
----------
operands: IGESData_HArray1OfIGESEntity
operations: TColStd_HArray1OfInteger

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_HArray1OfIGESEntity> & operands, const opencascade::handle<TColStd_HArray1OfInteger> & operations);

		/****************** IsOperand ******************/
		/**** md5 signature: 97c93347a303d6e609b6849b85f4cb3c ****/
		%feature("compactdefaultargs") IsOperand;
		%feature("autodoc", "Returns true if index'th value in the post-order list is an operand; else returns false if it is an integer operations raises exception if index < 1 or index > length().

Parameters
----------
Index: int

Returns
-------
bool
") IsOperand;
		Standard_Boolean IsOperand(const Standard_Integer Index);

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the post-order list.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Operand ******************/
		/**** md5 signature: 3c7ef6744a4b75536d075b195a470b41 ****/
		%feature("compactdefaultargs") Operand;
		%feature("autodoc", "Returns the index'th value in the post-order list only if it is an operand else returns null raises exception if index < 1 or index > length().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Operand;
		opencascade::handle<IGESData_IGESEntity> Operand(const Standard_Integer Index);

		/****************** Operation ******************/
		/**** md5 signature: 7d3a1a81c27d87e441d1a827f5aa2dad ****/
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", "Returns the index'th value in the post-order list only if it is an operation else returns 0 raises exception if index < 1 or index > length().

Parameters
----------
Index: int

Returns
-------
int
") Operation;
		Standard_Integer Operation(const Standard_Integer Index);

};


%make_alias(IGESSolid_BooleanTree)

%extend IGESSolid_BooleanTree {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESSolid_ConeFrustum *
******************************/
class IGESSolid_ConeFrustum : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_ConeFrustum ******************/
		/**** md5 signature: b73c09e19dc0470ae1cc970c66813eec ****/
		%feature("compactdefaultargs") IGESSolid_ConeFrustum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_ConeFrustum;
		 IGESSolid_ConeFrustum();

		/****************** Axis ******************/
		/**** md5 signature: aaa2fda5c52a82f447c01991d32ce52e ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the direction of the axis of the cone frustum.

Returns
-------
gp_Dir
") Axis;
		gp_Dir Axis();

		/****************** FaceCenter ******************/
		/**** md5 signature: 3d303b1eb588b499123435af54376e03 ****/
		%feature("compactdefaultargs") FaceCenter;
		%feature("autodoc", "Returns the center of the larger face of the cone frustum.

Returns
-------
gp_Pnt
") FaceCenter;
		gp_Pnt FaceCenter();

		/****************** Height ******************/
		/**** md5 signature: b7486e9db42a6b5d4ef64408e52d8a4b ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Returns the height of the cone frustum.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Init ******************/
		/**** md5 signature: 58d26524edd4d67f9830f287de2f4d91 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class conefrustum - ht : the height of cone - r1 : radius of the larger face - r2 : radius of the smaller face (default 0) - center : center of the larger face (default (0,0,0)) - anaxis : unit vector in axis direction (default (0,0,1)).

Parameters
----------
Ht: float
R1: float
R2: float
Center: gp_XYZ
anAxis: gp_XYZ

Returns
-------
None
") Init;
		void Init(const Standard_Real Ht, const Standard_Real R1, const Standard_Real R2, const gp_XYZ & Center, const gp_XYZ & anAxis);

		/****************** LargerRadius ******************/
		/**** md5 signature: 370b2df63fb5f4dd4c94bea42b5888d4 ****/
		%feature("compactdefaultargs") LargerRadius;
		%feature("autodoc", "Returns the radius of the larger face of the cone frustum.

Returns
-------
float
") LargerRadius;
		Standard_Real LargerRadius();

		/****************** SmallerRadius ******************/
		/**** md5 signature: 32b56aeec66a0b822aca5659648ce08f ****/
		%feature("compactdefaultargs") SmallerRadius;
		%feature("autodoc", "Returns the radius of the second face of the cone frustum.

Returns
-------
float
") SmallerRadius;
		Standard_Real SmallerRadius();

		/****************** TransformedAxis ******************/
		/**** md5 signature: 988bb846dc3a9d88e859e39c1d608827 ****/
		%feature("compactdefaultargs") TransformedAxis;
		%feature("autodoc", "Returns the direction of the axis of the cone frustum after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedAxis;
		gp_Dir TransformedAxis();

		/****************** TransformedFaceCenter ******************/
		/**** md5 signature: 7caed724a8e6b88b5ab05d6bf1ff916b ****/
		%feature("compactdefaultargs") TransformedFaceCenter;
		%feature("autodoc", "Returns the center of the larger face of the cone frustum after applying transformationmatrix.

Returns
-------
gp_Pnt
") TransformedFaceCenter;
		gp_Pnt TransformedFaceCenter();

};


%make_alias(IGESSolid_ConeFrustum)

%extend IGESSolid_ConeFrustum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESSolid_ConicalSurface *
*********************************/
class IGESSolid_ConicalSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_ConicalSurface ******************/
		/**** md5 signature: 6bab3af3753ad0fce9d68026acc7b1e3 ****/
		%feature("compactdefaultargs") IGESSolid_ConicalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_ConicalSurface;
		 IGESSolid_ConicalSurface();

		/****************** Axis ******************/
		/**** md5 signature: 55248e3d07a3be664e3f68acb723cbc9 ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the direction of the axis.

Returns
-------
opencascade::handle<IGESGeom_Direction>
") Axis;
		opencascade::handle<IGESGeom_Direction> Axis();

		/****************** Init ******************/
		/**** md5 signature: eee237145b2e7f13dc683f8460bfe12d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class conicalsurface - alocation : location of the point on axis - anaxis : direction of the axis - aradius : radius at axis point - anangle : value of semi-angle in degrees (0<angle<90) - arefdir : reference direction (parametrised surface) null if unparametrised surface.

Parameters
----------
aLocation: IGESGeom_Point
anAxis: IGESGeom_Direction
aRadius: float
anAngle: float
aRefdir: IGESGeom_Direction

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESGeom_Point> & aLocation, const opencascade::handle<IGESGeom_Direction> & anAxis, const Standard_Real aRadius, const Standard_Real anAngle, const opencascade::handle<IGESGeom_Direction> & aRefdir);

		/****************** IsParametrised ******************/
		/**** md5 signature: f229b26be1fada6c54e69c27a362f189 ****/
		%feature("compactdefaultargs") IsParametrised;
		%feature("autodoc", "Returns true if form no is 1 else false.

Returns
-------
bool
") IsParametrised;
		Standard_Boolean IsParametrised();

		/****************** LocationPoint ******************/
		/**** md5 signature: 5ccb2ef22209ea9d80237ca7d65492b7 ****/
		%feature("compactdefaultargs") LocationPoint;
		%feature("autodoc", "Returns the location of the point on the axis.

Returns
-------
opencascade::handle<IGESGeom_Point>
") LocationPoint;
		opencascade::handle<IGESGeom_Point> LocationPoint();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius at the axis point.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** ReferenceDir ******************/
		/**** md5 signature: 76dda0b5b133b098645f8ebb558d2baf ****/
		%feature("compactdefaultargs") ReferenceDir;
		%feature("autodoc", "Returns the reference direction of the conical surface in case of parametrised surface. for unparametrised surface it returns null.

Returns
-------
opencascade::handle<IGESGeom_Direction>
") ReferenceDir;
		opencascade::handle<IGESGeom_Direction> ReferenceDir();

		/****************** SemiAngle ******************/
		/**** md5 signature: a49ed9cc6318be7aa50219450c80bb02 ****/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "Returns the semi-angle value.

Returns
-------
float
") SemiAngle;
		Standard_Real SemiAngle();

};


%make_alias(IGESSolid_ConicalSurface)

%extend IGESSolid_ConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESSolid_Cylinder *
***************************/
class IGESSolid_Cylinder : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_Cylinder ******************/
		/**** md5 signature: 594f71c3fd1594422ee8102ed8bb069c ****/
		%feature("compactdefaultargs") IGESSolid_Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_Cylinder;
		 IGESSolid_Cylinder();

		/****************** Axis ******************/
		/**** md5 signature: aaa2fda5c52a82f447c01991d32ce52e ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the vector in axis direction.

Returns
-------
gp_Dir
") Axis;
		gp_Dir Axis();

		/****************** FaceCenter ******************/
		/**** md5 signature: 3d303b1eb588b499123435af54376e03 ****/
		%feature("compactdefaultargs") FaceCenter;
		%feature("autodoc", "Returns the first face center coordinates.

Returns
-------
gp_Pnt
") FaceCenter;
		gp_Pnt FaceCenter();

		/****************** Height ******************/
		/**** md5 signature: b7486e9db42a6b5d4ef64408e52d8a4b ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Returns the cylinder height.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Init ******************/
		/**** md5 signature: 539d6729218610dcc80e28e2ed559f93 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class cylinder - aheight : cylinder height - aradius : cylinder radius - acenter : first face center coordinates (default (0,0,0)) - anaxis : unit vector in axis direction (default (0,0,1)).

Parameters
----------
aHeight: float
aRadius: float
aCenter: gp_XYZ
anAxis: gp_XYZ

Returns
-------
None
") Init;
		void Init(const Standard_Real aHeight, const Standard_Real aRadius, const gp_XYZ & aCenter, const gp_XYZ & anAxis);

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the cylinder radius.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** TransformedAxis ******************/
		/**** md5 signature: 988bb846dc3a9d88e859e39c1d608827 ****/
		%feature("compactdefaultargs") TransformedAxis;
		%feature("autodoc", "Returns the vector in axis direction after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedAxis;
		gp_Dir TransformedAxis();

		/****************** TransformedFaceCenter ******************/
		/**** md5 signature: 7caed724a8e6b88b5ab05d6bf1ff916b ****/
		%feature("compactdefaultargs") TransformedFaceCenter;
		%feature("autodoc", "Returns the first face center after applying transformationmatrix.

Returns
-------
gp_Pnt
") TransformedFaceCenter;
		gp_Pnt TransformedFaceCenter();

};


%make_alias(IGESSolid_Cylinder)

%extend IGESSolid_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESSolid_CylindricalSurface *
*************************************/
class IGESSolid_CylindricalSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_CylindricalSurface ******************/
		/**** md5 signature: 875a82fa645b5ca280069caae7735333 ****/
		%feature("compactdefaultargs") IGESSolid_CylindricalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_CylindricalSurface;
		 IGESSolid_CylindricalSurface();

		/****************** Axis ******************/
		/**** md5 signature: 55248e3d07a3be664e3f68acb723cbc9 ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the direction on the axis.

Returns
-------
opencascade::handle<IGESGeom_Direction>
") Axis;
		opencascade::handle<IGESGeom_Direction> Axis();

		/****************** Init ******************/
		/**** md5 signature: 0426e30dcb2efa093840fd81b4d63bb2 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class cylindricalsurface - alocation : the location of the point on axis - anaxis : the direction of the axis - aradius : the radius at the axis point - arefdir : the reference direction (parametrised surface) default null (unparametrised surface).

Parameters
----------
aLocation: IGESGeom_Point
anAxis: IGESGeom_Direction
aRadius: float
aRefdir: IGESGeom_Direction

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESGeom_Point> & aLocation, const opencascade::handle<IGESGeom_Direction> & anAxis, const Standard_Real aRadius, const opencascade::handle<IGESGeom_Direction> & aRefdir);

		/****************** IsParametrised ******************/
		/**** md5 signature: f229b26be1fada6c54e69c27a362f189 ****/
		%feature("compactdefaultargs") IsParametrised;
		%feature("autodoc", "Returns whether the surface is parametrised or not.

Returns
-------
bool
") IsParametrised;
		Standard_Boolean IsParametrised();

		/****************** LocationPoint ******************/
		/**** md5 signature: 5ccb2ef22209ea9d80237ca7d65492b7 ****/
		%feature("compactdefaultargs") LocationPoint;
		%feature("autodoc", "Returns the point on the axis.

Returns
-------
opencascade::handle<IGESGeom_Point>
") LocationPoint;
		opencascade::handle<IGESGeom_Point> LocationPoint();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius at the axis point.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** ReferenceDir ******************/
		/**** md5 signature: 76dda0b5b133b098645f8ebb558d2baf ****/
		%feature("compactdefaultargs") ReferenceDir;
		%feature("autodoc", "Returns the reference direction only for parametrised surface else returns null.

Returns
-------
opencascade::handle<IGESGeom_Direction>
") ReferenceDir;
		opencascade::handle<IGESGeom_Direction> ReferenceDir();

};


%make_alias(IGESSolid_CylindricalSurface)

%extend IGESSolid_CylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESSolid_EdgeList *
***************************/
class IGESSolid_EdgeList : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_EdgeList ******************/
		/**** md5 signature: 46b16bf3d4c9fa5b3a23610b51f2fa53 ****/
		%feature("compactdefaultargs") IGESSolid_EdgeList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_EdgeList;
		 IGESSolid_EdgeList();

		/****************** Curve ******************/
		/**** md5 signature: 8af4bb4df1918d551be4a03b0b15efd2 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the num'th model space curve raises exception if num <= 0 or num > nbedges().

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Curve;
		opencascade::handle<IGESData_IGESEntity> Curve(const Standard_Integer num);

		/****************** EndVertexIndex ******************/
		/**** md5 signature: 95e269be39b4814cb508e21001c0d149 ****/
		%feature("compactdefaultargs") EndVertexIndex;
		%feature("autodoc", "Returns the index of num'th end vertex in the corresponding end vertex list raises exception if num <= 0 or num > nbedges().

Parameters
----------
num: int

Returns
-------
int
") EndVertexIndex;
		Standard_Integer EndVertexIndex(const Standard_Integer num);

		/****************** EndVertexList ******************/
		/**** md5 signature: 08a5cf3d63e942e9040aed38f0db7fca ****/
		%feature("compactdefaultargs") EndVertexList;
		%feature("autodoc", "Returns the num'th end vertex list raises exception if num <= 0 or num > nbedges().

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESSolid_VertexList>
") EndVertexList;
		opencascade::handle<IGESSolid_VertexList> EndVertexList(const Standard_Integer num);

		/****************** Init ******************/
		/**** md5 signature: 59a7e9c5190d656484c3f2860921d4bf ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class edgelist - curves  : the model space curves - startvertexlist : the vertex list that contains the start vertices - startvertexindex : the index of the vertex in the corresponding vertex list - endvertexlist : the vertex list that contains the end vertices - endvertexindex : the index of the vertex in the corresponding vertex list raises exception if size of curves,startvertexlist,startvertexindex, endvertexlist and endvertexindex do no match.

Parameters
----------
curves: IGESData_HArray1OfIGESEntity
startVertexList: IGESSolid_HArray1OfVertexList
startVertexIndex: TColStd_HArray1OfInteger
endVertexList: IGESSolid_HArray1OfVertexList
endVertexIndex: TColStd_HArray1OfInteger

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_HArray1OfIGESEntity> & curves, const opencascade::handle<IGESSolid_HArray1OfVertexList> & startVertexList, const opencascade::handle<TColStd_HArray1OfInteger> & startVertexIndex, const opencascade::handle<IGESSolid_HArray1OfVertexList> & endVertexList, const opencascade::handle<TColStd_HArray1OfInteger> & endVertexIndex);

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the number of edges in the edge list.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** StartVertexIndex ******************/
		/**** md5 signature: 3f0502a3643ee0c20b07c53a03248a95 ****/
		%feature("compactdefaultargs") StartVertexIndex;
		%feature("autodoc", "Returns the index of num'th start vertex in the corresponding start vertex list raises exception if num <= 0 or num > nbedges().

Parameters
----------
num: int

Returns
-------
int
") StartVertexIndex;
		Standard_Integer StartVertexIndex(const Standard_Integer num);

		/****************** StartVertexList ******************/
		/**** md5 signature: 977fbaccf02bb6e65aa5fe2fc2295a3a ****/
		%feature("compactdefaultargs") StartVertexList;
		%feature("autodoc", "Returns the num'th start vertex list raises exception if num <= 0 or num > nbedges().

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESSolid_VertexList>
") StartVertexList;
		opencascade::handle<IGESSolid_VertexList> StartVertexList(const Standard_Integer num);

};


%make_alias(IGESSolid_EdgeList)

%extend IGESSolid_EdgeList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESSolid_Ellipsoid *
****************************/
class IGESSolid_Ellipsoid : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_Ellipsoid ******************/
		/**** md5 signature: 2daf94aa171c9bbdf5c382665527fa9b ****/
		%feature("compactdefaultargs") IGESSolid_Ellipsoid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_Ellipsoid;
		 IGESSolid_Ellipsoid();

		/****************** Center ******************/
		/**** md5 signature: a0225421bd121773fd44dc2b7d0dfd97 ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns the center of the ellipsoid.

Returns
-------
gp_Pnt
") Center;
		gp_Pnt Center();

		/****************** Init ******************/
		/**** md5 signature: 7c4ca38a6f85d888baca36f0f89a3f47 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class ellipsoid - asize : lengths in the local x,y,z directions - acenter : center point of ellipsoid (default (0,0,0)) - anxaxis : unit vector defining local x-axis default (1,0,0) - anzaxis : unit vector defining local z-axis default (0,0,1).

Parameters
----------
aSize: gp_XYZ
aCenter: gp_XYZ
anXAxis: gp_XYZ
anZAxis: gp_XYZ

Returns
-------
None
") Init;
		void Init(const gp_XYZ & aSize, const gp_XYZ & aCenter, const gp_XYZ & anXAxis, const gp_XYZ & anZAxis);

		/****************** Size ******************/
		/**** md5 signature: 03ffdb400360ad840f77e198ef4df260 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the size.

Returns
-------
gp_XYZ
") Size;
		gp_XYZ Size();

		/****************** TransformedCenter ******************/
		/**** md5 signature: 5d09d843a8d98dff53df916007422526 ****/
		%feature("compactdefaultargs") TransformedCenter;
		%feature("autodoc", "Returns the center of the ellipsoid after applying transformationmatrix.

Returns
-------
gp_Pnt
") TransformedCenter;
		gp_Pnt TransformedCenter();

		/****************** TransformedXAxis ******************/
		/**** md5 signature: 91874a05de65b50c61b6c322912add12 ****/
		%feature("compactdefaultargs") TransformedXAxis;
		%feature("autodoc", "Returns the vector corresponding to the local x-direction after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedXAxis;
		gp_Dir TransformedXAxis();

		/****************** TransformedYAxis ******************/
		/**** md5 signature: 975a8203d2f889c70aba4ccc364f5648 ****/
		%feature("compactdefaultargs") TransformedYAxis;
		%feature("autodoc", "Returns the vector corresponding to the local y-direction (which is got by taking cross product of zaxis and xaxis) after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedYAxis;
		gp_Dir TransformedYAxis();

		/****************** TransformedZAxis ******************/
		/**** md5 signature: 7c451de23c4e606958740b08cecdb471 ****/
		%feature("compactdefaultargs") TransformedZAxis;
		%feature("autodoc", "Returns the vector corresponding to the local z-direction after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedZAxis;
		gp_Dir TransformedZAxis();

		/****************** XAxis ******************/
		/**** md5 signature: 215a9c944bc0106b48b5bef8d83abf2a ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the vector corresponding to the local x-direction.

Returns
-------
gp_Dir
") XAxis;
		gp_Dir XAxis();

		/****************** XLength ******************/
		/**** md5 signature: ce67990e12cd771d97f643f8a8ffae48 ****/
		%feature("compactdefaultargs") XLength;
		%feature("autodoc", "Returns the length in the local x-direction.

Returns
-------
float
") XLength;
		Standard_Real XLength();

		/****************** YAxis ******************/
		/**** md5 signature: a72995a5f378477cdd3907bee256e1cc ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the vector corresponding to the local y-direction which is got by taking cross product of zaxis and xaxis.

Returns
-------
gp_Dir
") YAxis;
		gp_Dir YAxis();

		/****************** YLength ******************/
		/**** md5 signature: 05adb1a279a2a723a9eaad9632c694de ****/
		%feature("compactdefaultargs") YLength;
		%feature("autodoc", "Returns the length in the local y-direction.

Returns
-------
float
") YLength;
		Standard_Real YLength();

		/****************** ZAxis ******************/
		/**** md5 signature: 856a36006cff87299ee97ae4fd9ba362 ****/
		%feature("compactdefaultargs") ZAxis;
		%feature("autodoc", "Returns the vector corresponding to the local z-direction.

Returns
-------
gp_Dir
") ZAxis;
		gp_Dir ZAxis();

		/****************** ZLength ******************/
		/**** md5 signature: ea0e53d0a06ae7ec0b732e1f01fd1c9d ****/
		%feature("compactdefaultargs") ZLength;
		%feature("autodoc", "Returns the length in the local z-direction.

Returns
-------
float
") ZLength;
		Standard_Real ZLength();

};


%make_alias(IGESSolid_Ellipsoid)

%extend IGESSolid_Ellipsoid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IGESSolid_Face *
***********************/
class IGESSolid_Face : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_Face ******************/
		/**** md5 signature: b3d84f506730fcb7e49605cf5d0e999c ****/
		%feature("compactdefaultargs") IGESSolid_Face;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_Face;
		 IGESSolid_Face();

		/****************** HasOuterLoop ******************/
		/**** md5 signature: 0aa187411300c557aa72b53c131fa37f ****/
		%feature("compactdefaultargs") HasOuterLoop;
		%feature("autodoc", "Checks whether there is an outer loop or not.

Returns
-------
bool
") HasOuterLoop;
		Standard_Boolean HasOuterLoop();

		/****************** Init ******************/
		/**** md5 signature: 2e6fe203dc2aff6a50cce12d021110db ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class face - asurface : pointer to the underlying surface - outerloopflag : true means the first loop is the outer loop - loops : array of loops bounding the face.

Parameters
----------
aSurface: IGESData_IGESEntity
outerLoopFlag: bool
loops: IGESSolid_HArray1OfLoop

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & aSurface, const Standard_Boolean outerLoopFlag, const opencascade::handle<IGESSolid_HArray1OfLoop> & loops);

		/****************** Loop ******************/
		/**** md5 signature: 9c1d1361c25a700eca283ac91c9a6868 ****/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "Returns the index'th loop that bounds the face raises exception if index < 0 or index >= nbloops.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESSolid_Loop>
") Loop;
		opencascade::handle<IGESSolid_Loop> Loop(const Standard_Integer Index);

		/****************** NbLoops ******************/
		/**** md5 signature: 76e4754db2b174e8c81d848db945640f ****/
		%feature("compactdefaultargs") NbLoops;
		%feature("autodoc", "Returns the number of the loops bounding the face.

Returns
-------
int
") NbLoops;
		Standard_Integer NbLoops();

		/****************** Surface ******************/
		/**** md5 signature: 21224d36ecde9943682f882d2d37c893 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the underlying surface of the face.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Surface;
		opencascade::handle<IGESData_IGESEntity> Surface();

};


%make_alias(IGESSolid_Face)

%extend IGESSolid_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESSolid_GeneralModule *
********************************/
class IGESSolid_GeneralModule : public IGESData_GeneralModule {
	public:
		/****************** IGESSolid_GeneralModule ******************/
		/**** md5 signature: 965d6644eb365dad299c32946147dc68 ****/
		%feature("compactdefaultargs") IGESSolid_GeneralModule;
		%feature("autodoc", "Creates a generalmodule from igessolid and puts it into generallib.

Returns
-------
None
") IGESSolid_GeneralModule;
		 IGESSolid_GeneralModule();

		/****************** CategoryNumber ******************/
		/**** md5 signature: d812efe400e2084fa824301d3c147806 ****/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "Returns a category number which characterizes an entity shape for all.

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Returns
-------
int
") CategoryNumber;
		virtual Standard_Integer CategoryNumber(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****************** DirChecker ******************/
		/**** md5 signature: 06ffbfa1e4d88543cc06fdf7c67993ee ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns a dirchecker, specific for each type of entity (identified by its case number) : this dirchecker defines constraints which must be respected by the directorypart.

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** NewVoid ******************/
		/**** md5 signature: 8e184c5622d3823d145bc2105790b57a ****/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "Specific creation of a new void entity.

Parameters
----------
CN: int
entto: Standard_Transient

Returns
-------
bool
") NewVoid;
		Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

		/****************** OwnCheckCase ******************/
		/**** md5 signature: a04fd9a5e3c5ef0e136832f7ce57363b ****/
		%feature("compactdefaultargs") OwnCheckCase;
		%feature("autodoc", "Performs specific semantic check for each type of entity.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheckCase;
		void OwnCheckCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopyCase ******************/
		/**** md5 signature: 5c0289b7b5a5ec08bef5e9dac3d445b7 ****/
		%feature("compactdefaultargs") OwnCopyCase;
		%feature("autodoc", "Copies parameters which are specific of each type of entity.

Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Returns
-------
None
") OwnCopyCase;
		void OwnCopyCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, Interface_CopyTool & TC);

		/****************** OwnSharedCase ******************/
		/**** md5 signature: 1d978dfb0f38035ed4292cc342ee187f ****/
		%feature("compactdefaultargs") OwnSharedCase;
		%feature("autodoc", "Lists the entities shared by a given igesentity <ent>, from its specific parameters : specific for each type.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Returns
-------
None
") OwnSharedCase;
		void OwnSharedCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

};


%make_alias(IGESSolid_GeneralModule)

%extend IGESSolid_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IGESSolid_Loop *
***********************/
class IGESSolid_Loop : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_Loop ******************/
		/**** md5 signature: 61b196067fe0c8cd3daa4133151431a5 ****/
		%feature("compactdefaultargs") IGESSolid_Loop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_Loop;
		 IGESSolid_Loop();

		/****************** Edge ******************/
		/**** md5 signature: e07d9973b2c96a77b72ab91071523e79 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return the edgelist or vertexlist corresponding to the index raises exception if index <= 0 or index > nbedges().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Edge;
		opencascade::handle<IGESData_IGESEntity> Edge(const Standard_Integer Index);

		/****************** EdgeType ******************/
		/**** md5 signature: cae627c9525b78c8c24352ca5059f7f2 ****/
		%feature("compactdefaultargs") EdgeType;
		%feature("autodoc", "Returns the type of index'th edge (0 = edge, 1 = vertex) raises exception if index <= 0 or index > nbedges().

Parameters
----------
Index: int

Returns
-------
int
") EdgeType;
		Standard_Integer EdgeType(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: 88d5090062d8398ccff5ab302d9f45f3 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class loop - types  : 0 = edge; 1 = vertex - edges  : pointer to the edgelist or vertexlist - index  : index of the edge into the edgelist vertexlist entity - orient : orientation flag of the edge - nbparametercurves : the number of parameter space curves for each edge - isoparametricflags : the isoparametric flag of the parameter space curve - curves : the parameter space curves raises exception if length of types, edges, index, orient and nbparametercurves do not match or the length of isoparametricflags and curves do not match.

Parameters
----------
types: TColStd_HArray1OfInteger
edges: IGESData_HArray1OfIGESEntity
index: TColStd_HArray1OfInteger
orient: TColStd_HArray1OfInteger
nbParameterCurves: TColStd_HArray1OfInteger
isoparametricFlags: IGESBasic_HArray1OfHArray1OfInteger
curves: IGESBasic_HArray1OfHArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TColStd_HArray1OfInteger> & types, const opencascade::handle<IGESData_HArray1OfIGESEntity> & edges, const opencascade::handle<TColStd_HArray1OfInteger> & index, const opencascade::handle<TColStd_HArray1OfInteger> & orient, const opencascade::handle<TColStd_HArray1OfInteger> & nbParameterCurves, const opencascade::handle<IGESBasic_HArray1OfHArray1OfInteger> & isoparametricFlags, const opencascade::handle<IGESBasic_HArray1OfHArray1OfIGESEntity> & curves);

		/****************** IsBound ******************/
		/**** md5 signature: a38c3281df26ff174ec1be43a13de934 ****/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "Tells if a loop is a bound (fn 1) else it is free (fn 0).

Returns
-------
bool
") IsBound;
		Standard_Boolean IsBound();

		/****************** IsIsoparametric ******************/
		/**** md5 signature: 2492e621f2987e874725148b498182d6 ****/
		%feature("compactdefaultargs") IsIsoparametric;
		%feature("autodoc", "No available documentation.

Parameters
----------
EdgeIndex: int
CurveIndex: int

Returns
-------
bool
") IsIsoparametric;
		Standard_Boolean IsIsoparametric(const Standard_Integer EdgeIndex, const Standard_Integer CurveIndex);

		/****************** ListIndex ******************/
		/**** md5 signature: ffc4a5bdb7700366da79e7951090cd41 ****/
		%feature("compactdefaultargs") ListIndex;
		%feature("autodoc", "Raises exception if num <= 0 or num > nbedges().

Parameters
----------
num: int

Returns
-------
int
") ListIndex;
		Standard_Integer ListIndex(const Standard_Integer num);

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the number of edge tuples.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** NbParameterCurves ******************/
		/**** md5 signature: 53c45e7658a234132e123042f2e66ff5 ****/
		%feature("compactdefaultargs") NbParameterCurves;
		%feature("autodoc", "Return the number of parameter space curves associated with index'th edge raises exception if index <= 0 or index > nbedges().

Parameters
----------
Index: int

Returns
-------
int
") NbParameterCurves;
		Standard_Integer NbParameterCurves(const Standard_Integer Index);

		/****************** Orientation ******************/
		/**** md5 signature: 794eb45cc257c511f6bdea4be4ab9983 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation flag corresponding to index'th edge raises exception if index <= 0 or index > nbedges().

Parameters
----------
Index: int

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation(const Standard_Integer Index);

		/****************** ParametricCurve ******************/
		/**** md5 signature: 7aae6c0e8ec4fffe36eca88d9631c8e5 ****/
		%feature("compactdefaultargs") ParametricCurve;
		%feature("autodoc", "Returns the curveindex'th parameter space curve associated with edgeindex'th edge raises exception if edgeindex <= 0 or edgeindex > nbedges() or if curveindex <= 0 or curveindex > nbparametercurves(edgeindex).

Parameters
----------
EdgeIndex: int
CurveIndex: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") ParametricCurve;
		opencascade::handle<IGESData_IGESEntity> ParametricCurve(const Standard_Integer EdgeIndex, const Standard_Integer CurveIndex);

		/****************** SetBound ******************/
		/**** md5 signature: cc8cbda971f8b4164f959531db66e6e7 ****/
		%feature("compactdefaultargs") SetBound;
		%feature("autodoc", "Sets or unset the bound status (from form number) default is true.

Parameters
----------
bound: bool

Returns
-------
None
") SetBound;
		void SetBound(const Standard_Boolean bound);

};


%make_alias(IGESSolid_Loop)

%extend IGESSolid_Loop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESSolid_ManifoldSolid *
********************************/
class IGESSolid_ManifoldSolid : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_ManifoldSolid ******************/
		/**** md5 signature: beb39bb6beea3e8961d0af57c886bb27 ****/
		%feature("compactdefaultargs") IGESSolid_ManifoldSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_ManifoldSolid;
		 IGESSolid_ManifoldSolid();

		/****************** Init ******************/
		/**** md5 signature: 59391fe003d4500b1e0947cd83aa4cbb ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class manifoldsolid - ashell : pointer to the shell - shellflag : orientation flag of shell - voidshells : the void shells - voidshellflags : orientation of the void shells raises exception if length of voidshells and voidshellflags do not match.

Parameters
----------
aShell: IGESSolid_Shell
shellflag: bool
voidShells: IGESSolid_HArray1OfShell
voidShellFlags: TColStd_HArray1OfInteger

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESSolid_Shell> & aShell, const Standard_Boolean shellflag, const opencascade::handle<IGESSolid_HArray1OfShell> & voidShells, const opencascade::handle<TColStd_HArray1OfInteger> & voidShellFlags);

		/****************** NbVoidShells ******************/
		/**** md5 signature: a1da393d67f3355111761e6b5ccf432c ****/
		%feature("compactdefaultargs") NbVoidShells;
		%feature("autodoc", "Returns the number of void shells.

Returns
-------
int
") NbVoidShells;
		Standard_Integer NbVoidShells();

		/****************** OrientationFlag ******************/
		/**** md5 signature: 92ccedc4092f41bfcf2154e477ca8ec4 ****/
		%feature("compactdefaultargs") OrientationFlag;
		%feature("autodoc", "Returns the orientation flag of the shell.

Returns
-------
bool
") OrientationFlag;
		Standard_Boolean OrientationFlag();

		/****************** Shell ******************/
		/**** md5 signature: 7f666de73ee2207bb6ba7e8d98f93fcb ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the shell entity which is being referred.

Returns
-------
opencascade::handle<IGESSolid_Shell>
") Shell;
		opencascade::handle<IGESSolid_Shell> Shell();

		/****************** VoidOrientationFlag ******************/
		/**** md5 signature: 2d2ba5498f7410c4dfaa9b52b107c786 ****/
		%feature("compactdefaultargs") VoidOrientationFlag;
		%feature("autodoc", "Returns index'th orientation flag. raises exception if index <= 0 or index > nbvoidshells().

Parameters
----------
Index: int

Returns
-------
bool
") VoidOrientationFlag;
		Standard_Boolean VoidOrientationFlag(const Standard_Integer Index);

		/****************** VoidShell ******************/
		/**** md5 signature: 1ac17d177bbfc91c5b7fad61c8a10abe ****/
		%feature("compactdefaultargs") VoidShell;
		%feature("autodoc", "Returns index'th void shell. raises exception if index <= 0 or index > nbvoidshells().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESSolid_Shell>
") VoidShell;
		opencascade::handle<IGESSolid_Shell> VoidShell(const Standard_Integer Index);

};


%make_alias(IGESSolid_ManifoldSolid)

%extend IGESSolid_ManifoldSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESSolid_PlaneSurface *
*******************************/
class IGESSolid_PlaneSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_PlaneSurface ******************/
		/**** md5 signature: 414eb1e59b3eafe20b58d614ebaad955 ****/
		%feature("compactdefaultargs") IGESSolid_PlaneSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_PlaneSurface;
		 IGESSolid_PlaneSurface();

		/****************** Init ******************/
		/**** md5 signature: dba202608838a949aea653b15ba189e5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class planesurface - alocation : the point on the surface - anormal : the surface normal direction - refdir : the reference direction (default null) for unparameterised curves.

Parameters
----------
aLocation: IGESGeom_Point
aNormal: IGESGeom_Direction
refdir: IGESGeom_Direction

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESGeom_Point> & aLocation, const opencascade::handle<IGESGeom_Direction> & aNormal, const opencascade::handle<IGESGeom_Direction> & refdir);

		/****************** IsParametrised ******************/
		/**** md5 signature: f229b26be1fada6c54e69c27a362f189 ****/
		%feature("compactdefaultargs") IsParametrised;
		%feature("autodoc", "Returns true if parameterised, else false.

Returns
-------
bool
") IsParametrised;
		Standard_Boolean IsParametrised();

		/****************** LocationPoint ******************/
		/**** md5 signature: 5ccb2ef22209ea9d80237ca7d65492b7 ****/
		%feature("compactdefaultargs") LocationPoint;
		%feature("autodoc", "Returns the point on the surface.

Returns
-------
opencascade::handle<IGESGeom_Point>
") LocationPoint;
		opencascade::handle<IGESGeom_Point> LocationPoint();

		/****************** Normal ******************/
		/**** md5 signature: b40805aa43058948626e3c6101c2c5b0 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns the normal to the surface.

Returns
-------
opencascade::handle<IGESGeom_Direction>
") Normal;
		opencascade::handle<IGESGeom_Direction> Normal();

		/****************** ReferenceDir ******************/
		/**** md5 signature: 76dda0b5b133b098645f8ebb558d2baf ****/
		%feature("compactdefaultargs") ReferenceDir;
		%feature("autodoc", "Returns the reference direction (for parameterised curve) returns null for unparameterised curve.

Returns
-------
opencascade::handle<IGESGeom_Direction>
") ReferenceDir;
		opencascade::handle<IGESGeom_Direction> ReferenceDir();

};


%make_alias(IGESSolid_PlaneSurface)

%extend IGESSolid_PlaneSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESSolid_Protocol *
***************************/
class IGESSolid_Protocol : public IGESData_Protocol {
	public:
		/****************** IGESSolid_Protocol ******************/
		/**** md5 signature: 628d0c3354e9234ae20ae2a7dc67b766 ****/
		%feature("compactdefaultargs") IGESSolid_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_Protocol;
		 IGESSolid_Protocol();

		/****************** NbResources ******************/
		/**** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resource protocol. here, one (protocol from igesgeom).

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** Resource ******************/
		/**** md5 signature: 26597e9d8db9fc70530508f766cf0d70 ****/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "Returns a resource, given a rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Protocol>
") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****************** TypeNumber ******************/
		/**** md5 signature: f4ed4f2e12d80f3bd752f6dd34ed84b4 ****/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Returns a case number, specific of each recognized type this case number is then used in libraries : the various modules attached to this class of protocol must use them in accordance (for a given value of typenumber, they must consider the same type as the protocol defines).

Parameters
----------
atype: Standard_Type

Returns
-------
int
") TypeNumber;
		virtual Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

};


%make_alias(IGESSolid_Protocol)

%extend IGESSolid_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESSolid_ReadWriteModule *
**********************************/
class IGESSolid_ReadWriteModule : public IGESData_ReadWriteModule {
	public:
		/****************** IGESSolid_ReadWriteModule ******************/
		/**** md5 signature: b92e977f5ac16f71ca693c4a085193e4 ****/
		%feature("compactdefaultargs") IGESSolid_ReadWriteModule;
		%feature("autodoc", "Creates a readwritemodule & puts it into readerlib & writerlib.

Returns
-------
None
") IGESSolid_ReadWriteModule;
		 IGESSolid_ReadWriteModule();

		/****************** CaseIGES ******************/
		/**** md5 signature: de66f0948cefad4e0218511df612ee48 ****/
		%feature("compactdefaultargs") CaseIGES;
		%feature("autodoc", "Defines case numbers for entities of igessolid.

Parameters
----------
typenum: int
formnum: int

Returns
-------
int
") CaseIGES;
		Standard_Integer CaseIGES(const Standard_Integer typenum, const Standard_Integer formnum);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 0815b93d39da58d4605233b1d8695dc9 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file for an entity of igessolid.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 2eb05a73fea84c5ff17867b597f1ca7d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, IGESData_IGESWriter & IW);

};


%make_alias(IGESSolid_ReadWriteModule)

%extend IGESSolid_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESSolid_RightAngularWedge *
************************************/
class IGESSolid_RightAngularWedge : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_RightAngularWedge ******************/
		/**** md5 signature: 733f87d8a651f232810ff8c2a17928cb ****/
		%feature("compactdefaultargs") IGESSolid_RightAngularWedge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_RightAngularWedge;
		 IGESSolid_RightAngularWedge();

		/****************** Corner ******************/
		/**** md5 signature: fda386c0534e3555b674b5fa7d323198 ****/
		%feature("compactdefaultargs") Corner;
		%feature("autodoc", "Returns the corner point coordinates.

Returns
-------
gp_Pnt
") Corner;
		gp_Pnt Corner();

		/****************** Init ******************/
		/**** md5 signature: e30e71e4f93f734d4bcda0c8c50dae62 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class rightangularwedge - asize : the lengths along the local axes - lowx : the length at the smaller x-side - acorner : the corner point coordinates default (0,0,0) - anxaxis : the unit vector defining local x-axis default (1,0,0) - anzaxis : the unit vector defining local z-axis default (0,0,1).

Parameters
----------
aSize: gp_XYZ
lowX: float
aCorner: gp_XYZ
anXAxis: gp_XYZ
anZAxis: gp_XYZ

Returns
-------
None
") Init;
		void Init(const gp_XYZ & aSize, const Standard_Real lowX, const gp_XYZ & aCorner, const gp_XYZ & anXAxis, const gp_XYZ & anZAxis);

		/****************** Size ******************/
		/**** md5 signature: 03ffdb400360ad840f77e198ef4df260 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the size.

Returns
-------
gp_XYZ
") Size;
		gp_XYZ Size();

		/****************** TransformedCorner ******************/
		/**** md5 signature: 38bec2d7db20119003075789a0c3d179 ****/
		%feature("compactdefaultargs") TransformedCorner;
		%feature("autodoc", "Returns the corner point coordinates after applying transformationmatrix.

Returns
-------
gp_Pnt
") TransformedCorner;
		gp_Pnt TransformedCorner();

		/****************** TransformedXAxis ******************/
		/**** md5 signature: 91874a05de65b50c61b6c322912add12 ****/
		%feature("compactdefaultargs") TransformedXAxis;
		%feature("autodoc", "Returns the direction defining the local x-axis after applying the transformationmatrix.

Returns
-------
gp_Dir
") TransformedXAxis;
		gp_Dir TransformedXAxis();

		/****************** TransformedYAxis ******************/
		/**** md5 signature: 975a8203d2f889c70aba4ccc364f5648 ****/
		%feature("compactdefaultargs") TransformedYAxis;
		%feature("autodoc", "Returns the direction defining the local y-axis after applying the transformationmatrix.

Returns
-------
gp_Dir
") TransformedYAxis;
		gp_Dir TransformedYAxis();

		/****************** TransformedZAxis ******************/
		/**** md5 signature: 7c451de23c4e606958740b08cecdb471 ****/
		%feature("compactdefaultargs") TransformedZAxis;
		%feature("autodoc", "Returns the direction defining the local z-axis after applying the transformationmatrix.

Returns
-------
gp_Dir
") TransformedZAxis;
		gp_Dir TransformedZAxis();

		/****************** XAxis ******************/
		/**** md5 signature: 215a9c944bc0106b48b5bef8d83abf2a ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the direction defining the local x-axis.

Returns
-------
gp_Dir
") XAxis;
		gp_Dir XAxis();

		/****************** XBigLength ******************/
		/**** md5 signature: d9287aba325e3e380438336f018a0651 ****/
		%feature("compactdefaultargs") XBigLength;
		%feature("autodoc", "Returns the length along the local x-axis.

Returns
-------
float
") XBigLength;
		Standard_Real XBigLength();

		/****************** XSmallLength ******************/
		/**** md5 signature: 3e0544b48ca90ccca5825cc3cd605658 ****/
		%feature("compactdefaultargs") XSmallLength;
		%feature("autodoc", "Returns the smaller length along the local x-direction at y=ly.

Returns
-------
float
") XSmallLength;
		Standard_Real XSmallLength();

		/****************** YAxis ******************/
		/**** md5 signature: a72995a5f378477cdd3907bee256e1cc ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the direction defining the local y-axis it is got by taking the cross product of zaxis and xaxis.

Returns
-------
gp_Dir
") YAxis;
		gp_Dir YAxis();

		/****************** YLength ******************/
		/**** md5 signature: 05adb1a279a2a723a9eaad9632c694de ****/
		%feature("compactdefaultargs") YLength;
		%feature("autodoc", "Returns the length along the local y-axis.

Returns
-------
float
") YLength;
		Standard_Real YLength();

		/****************** ZAxis ******************/
		/**** md5 signature: 856a36006cff87299ee97ae4fd9ba362 ****/
		%feature("compactdefaultargs") ZAxis;
		%feature("autodoc", "Returns the direction defining the local z-axis.

Returns
-------
gp_Dir
") ZAxis;
		gp_Dir ZAxis();

		/****************** ZLength ******************/
		/**** md5 signature: ea0e53d0a06ae7ec0b732e1f01fd1c9d ****/
		%feature("compactdefaultargs") ZLength;
		%feature("autodoc", "Returns the length along the local z-axis.

Returns
-------
float
") ZLength;
		Standard_Real ZLength();

};


%make_alias(IGESSolid_RightAngularWedge)

%extend IGESSolid_RightAngularWedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESSolid_SelectedComponent *
************************************/
class IGESSolid_SelectedComponent : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_SelectedComponent ******************/
		/**** md5 signature: 4c50a62b2230e9ebd5ae35b257fee6b2 ****/
		%feature("compactdefaultargs") IGESSolid_SelectedComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_SelectedComponent;
		 IGESSolid_SelectedComponent();

		/****************** Component ******************/
		/**** md5 signature: 5d085cd6f6ea79ec51bfa22bb18ffb8d ****/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Returns the boolean tree entity.

Returns
-------
opencascade::handle<IGESSolid_BooleanTree>
") Component;
		opencascade::handle<IGESSolid_BooleanTree> Component();

		/****************** Init ******************/
		/**** md5 signature: 894853e7554e77e069ead9a3ecdaa5f9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class selectedcomponent - anentity : the boolean tree entity - selectpnt : point in or on the desired component.

Parameters
----------
anEntity: IGESSolid_BooleanTree
selectPnt: gp_XYZ

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESSolid_BooleanTree> & anEntity, const gp_XYZ & selectPnt);

		/****************** SelectPoint ******************/
		/**** md5 signature: 5456d52e7966853eb4f76e4daf0ba52e ****/
		%feature("compactdefaultargs") SelectPoint;
		%feature("autodoc", "Returns the point on/in the selected component.

Returns
-------
gp_Pnt
") SelectPoint;
		gp_Pnt SelectPoint();

		/****************** TransformedSelectPoint ******************/
		/**** md5 signature: 3897ae7145b7196b7fe16c7e221a2374 ****/
		%feature("compactdefaultargs") TransformedSelectPoint;
		%feature("autodoc", "Returns the point on/in the selected component after applying transformationmatrix.

Returns
-------
gp_Pnt
") TransformedSelectPoint;
		gp_Pnt TransformedSelectPoint();

};


%make_alias(IGESSolid_SelectedComponent)

%extend IGESSolid_SelectedComponent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IGESSolid_Shell *
************************/
class IGESSolid_Shell : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_Shell ******************/
		/**** md5 signature: 7ecacd0ab60a1abed5c4192b6c5c3e6f ****/
		%feature("compactdefaultargs") IGESSolid_Shell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_Shell;
		 IGESSolid_Shell();

		/****************** Face ******************/
		/**** md5 signature: ec37363999fcae886b2644dbc9d48e8a ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the index'th face entity of the shell raises exception if index <= 0 or index > nbfaces().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESSolid_Face>
") Face;
		opencascade::handle<IGESSolid_Face> Face(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: a6f5ae26b9a09c3b4fceafa4baeccd95 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class shell - allfaces : the faces comprising the shell - allorient : the orientation flags of the shell raises exception if length of allfaces & allorient do not match.

Parameters
----------
allFaces: IGESSolid_HArray1OfFace
allOrient: TColStd_HArray1OfInteger

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESSolid_HArray1OfFace> & allFaces, const opencascade::handle<TColStd_HArray1OfInteger> & allOrient);

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Tells if a shell is closed, i.e. if its formnumber is 1 (this is the default).

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** NbFaces ******************/
		/**** md5 signature: 1f0fd1808c5306ae27c425978ee57bb5 ****/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "Returns the number of the face entities in the shell.

Returns
-------
int
") NbFaces;
		Standard_Integer NbFaces();

		/****************** Orientation ******************/
		/**** md5 signature: 794eb45cc257c511f6bdea4be4ab9983 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of index'th face w.r.t the direction of the underlying surface raises exception if index <= 0 or index > nbfaces().

Parameters
----------
Index: int

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation(const Standard_Integer Index);

		/****************** SetClosed ******************/
		/**** md5 signature: 8aec759a2bffd72162a799621bbeb8a5 ****/
		%feature("compactdefaultargs") SetClosed;
		%feature("autodoc", "Sets or unsets the closed status (formnumber = 1 else 2).

Parameters
----------
closed: bool

Returns
-------
None
") SetClosed;
		void SetClosed(const Standard_Boolean closed);

};


%make_alias(IGESSolid_Shell)

%extend IGESSolid_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESSolid_SolidAssembly *
********************************/
class IGESSolid_SolidAssembly : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_SolidAssembly ******************/
		/**** md5 signature: ec22f8e763ac021c4c524dce95959bdf ****/
		%feature("compactdefaultargs") IGESSolid_SolidAssembly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_SolidAssembly;
		 IGESSolid_SolidAssembly();

		/****************** HasBrep ******************/
		/**** md5 signature: 85aa9303d8033ef239112f1da1286317 ****/
		%feature("compactdefaultargs") HasBrep;
		%feature("autodoc", "Tells if at least one item is a brep, from formnumber.

Returns
-------
bool
") HasBrep;
		Standard_Boolean HasBrep();

		/****************** Init ******************/
		/**** md5 signature: bfe4e7801761864db516bc5eade89b81 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class solidassembly - allitems : the collection of items - allmatrices : transformation matrices corresponding to each item raises exception if the length of allitems & allmatrices do not match.

Parameters
----------
allItems: IGESData_HArray1OfIGESEntity
allMatrices: IGESGeom_HArray1OfTransformationMatrix

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_HArray1OfIGESEntity> & allItems, const opencascade::handle<IGESGeom_HArray1OfTransformationMatrix> & allMatrices);

		/****************** Item ******************/
		/**** md5 signature: 276958ce98b2981b4b49822dd4fce851 ****/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns the index'th item raises exception if index <= 0 or index > nbitems().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Item;
		opencascade::handle<IGESData_IGESEntity> Item(const Standard_Integer Index);

		/****************** NbItems ******************/
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Returns the number of items in the collection.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetBrep ******************/
		/**** md5 signature: d2881c582112727bd9b2d901a0bac27e ****/
		%feature("compactdefaultargs") SetBrep;
		%feature("autodoc", "Sets or unsets the status 'hasbrep' from formnumber default is false.

Parameters
----------
hasbrep: bool

Returns
-------
None
") SetBrep;
		void SetBrep(const Standard_Boolean hasbrep);

		/****************** TransfMatrix ******************/
		/**** md5 signature: d3f5f38842dbd6bd3fb68cc5c8184568 ****/
		%feature("compactdefaultargs") TransfMatrix;
		%feature("autodoc", "Returns the transformation matrix of the index'th item raises exception if index <= 0 or index > nbitems().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESGeom_TransformationMatrix>
") TransfMatrix;
		opencascade::handle<IGESGeom_TransformationMatrix> TransfMatrix(const Standard_Integer Index);

};


%make_alias(IGESSolid_SolidAssembly)

%extend IGESSolid_SolidAssembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESSolid_SolidInstance *
********************************/
class IGESSolid_SolidInstance : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_SolidInstance ******************/
		/**** md5 signature: c5821029119b65c2396622acb234fd37 ****/
		%feature("compactdefaultargs") IGESSolid_SolidInstance;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_SolidInstance;
		 IGESSolid_SolidInstance();

		/****************** Entity ******************/
		/**** md5 signature: 4fa7083416de256c64d37133f4317aa9 ****/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Returns the solid entity.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Entity;
		opencascade::handle<IGESData_IGESEntity> Entity();

		/****************** Init ******************/
		/**** md5 signature: 4e715dbad8433520c735dadd4e1f1223 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class solidinstance - anentity : the entity corresponding to the solid.

Parameters
----------
anEntity: IGESData_IGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & anEntity);

		/****************** IsBrep ******************/
		/**** md5 signature: f3e894e3e5054e58c16603419fbcf032 ****/
		%feature("compactdefaultargs") IsBrep;
		%feature("autodoc", "Tells if a solidinstance is for a brep default is false.

Returns
-------
bool
") IsBrep;
		Standard_Boolean IsBrep();

		/****************** SetBrep ******************/
		/**** md5 signature: df87379315a1ccda236d5810884e92ac ****/
		%feature("compactdefaultargs") SetBrep;
		%feature("autodoc", "Sets or unsets the brep status (formnumber = 1 else 0).

Parameters
----------
brep: bool

Returns
-------
None
") SetBrep;
		void SetBrep(const Standard_Boolean brep);

};


%make_alias(IGESSolid_SolidInstance)

%extend IGESSolid_SolidInstance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESSolid_SolidOfLinearExtrusion *
*****************************************/
class IGESSolid_SolidOfLinearExtrusion : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_SolidOfLinearExtrusion ******************/
		/**** md5 signature: 76352ed2109863037d7494dc9c9e60b7 ****/
		%feature("compactdefaultargs") IGESSolid_SolidOfLinearExtrusion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_SolidOfLinearExtrusion;
		 IGESSolid_SolidOfLinearExtrusion();

		/****************** Curve ******************/
		/**** md5 signature: 336153636f980182862fec8dbbf3288b ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the planar curve that is to be translated.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Curve;
		opencascade::handle<IGESData_IGESEntity> Curve();

		/****************** ExtrusionDirection ******************/
		/**** md5 signature: de3b3674a1dec996d9c445e12bcd7064 ****/
		%feature("compactdefaultargs") ExtrusionDirection;
		%feature("autodoc", "Returns the extrusion direction.

Returns
-------
gp_Dir
") ExtrusionDirection;
		gp_Dir ExtrusionDirection();

		/****************** ExtrusionLength ******************/
		/**** md5 signature: af9f2f352aa32649fa0a98e4cdd82c34 ****/
		%feature("compactdefaultargs") ExtrusionLength;
		%feature("autodoc", "Returns the extrusion length.

Returns
-------
float
") ExtrusionLength;
		Standard_Real ExtrusionLength();

		/****************** Init ******************/
		/**** md5 signature: b07f36a85e533d1c8a27d58237c8dde4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class solidoflinearextrusion - acurve : the planar curve that is to be translated - alength : the length of extrusion - adirection : the vector specifying the direction of extrusion default (0,0,1).

Parameters
----------
aCurve: IGESData_IGESEntity
aLength: float
aDirection: gp_XYZ

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & aCurve, const Standard_Real aLength, const gp_XYZ & aDirection);

		/****************** TransformedExtrusionDirection ******************/
		/**** md5 signature: 1590ba3b33412d743613d8de04074c66 ****/
		%feature("compactdefaultargs") TransformedExtrusionDirection;
		%feature("autodoc", "Returns extrusiondirection after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedExtrusionDirection;
		gp_Dir TransformedExtrusionDirection();

};


%make_alias(IGESSolid_SolidOfLinearExtrusion)

%extend IGESSolid_SolidOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESSolid_SolidOfRevolution *
************************************/
class IGESSolid_SolidOfRevolution : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_SolidOfRevolution ******************/
		/**** md5 signature: ae360f8f9a711b902e4aa4243f7e5f1a ****/
		%feature("compactdefaultargs") IGESSolid_SolidOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_SolidOfRevolution;
		 IGESSolid_SolidOfRevolution();

		/****************** Axis ******************/
		/**** md5 signature: aaa2fda5c52a82f447c01991d32ce52e ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the direction of the axis.

Returns
-------
gp_Dir
") Axis;
		gp_Dir Axis();

		/****************** AxisPoint ******************/
		/**** md5 signature: 41acb83bdd1484c8e39e863e0534c5a8 ****/
		%feature("compactdefaultargs") AxisPoint;
		%feature("autodoc", "Returns the point on the axis.

Returns
-------
gp_Pnt
") AxisPoint;
		gp_Pnt AxisPoint();

		/****************** Curve ******************/
		/**** md5 signature: 336153636f980182862fec8dbbf3288b ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve entity that is to be revolved.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Curve;
		opencascade::handle<IGESData_IGESEntity> Curve();

		/****************** Fraction ******************/
		/**** md5 signature: de50fcbec34f45638dd34f6fc2e3ccce ****/
		%feature("compactdefaultargs") Fraction;
		%feature("autodoc", "Returns the fraction of full rotation that the curve is to be rotated.

Returns
-------
float
") Fraction;
		Standard_Real Fraction();

		/****************** Init ******************/
		/**** md5 signature: d545fe3f3f17905b1c9bb5616eb69488 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class solidofrevolution - acurve : the curve entity that is to be revolved - afract : the fraction of full rotation (default 1.0) - aaxispnt : the point on the axis - adirection : the direction of the axis.

Parameters
----------
aCurve: IGESData_IGESEntity
aFract: float
aAxisPnt: gp_XYZ
aDirection: gp_XYZ

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & aCurve, const Standard_Real aFract, const gp_XYZ & aAxisPnt, const gp_XYZ & aDirection);

		/****************** IsClosedToAxis ******************/
		/**** md5 signature: f07ce9a38ca9384818111595b5abeaf9 ****/
		%feature("compactdefaultargs") IsClosedToAxis;
		%feature("autodoc", "Returns true if form number = 0 if form no is 0, then the curve is closed to axis if 1, the curve is closed to itself.

Returns
-------
bool
") IsClosedToAxis;
		Standard_Boolean IsClosedToAxis();

		/****************** SetClosedToAxis ******************/
		/**** md5 signature: 8bf91bb0bc2459c5241c2724200b825c ****/
		%feature("compactdefaultargs") SetClosedToAxis;
		%feature("autodoc", "Sets the curve to be by default, closed to axis (form 0) if <mode> is true, closed to itself (form 1) else.

Parameters
----------
mode: bool

Returns
-------
None
") SetClosedToAxis;
		void SetClosedToAxis(const Standard_Boolean mode);

		/****************** TransformedAxis ******************/
		/**** md5 signature: 988bb846dc3a9d88e859e39c1d608827 ****/
		%feature("compactdefaultargs") TransformedAxis;
		%feature("autodoc", "Returns the direction of the axis after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedAxis;
		gp_Dir TransformedAxis();

		/****************** TransformedAxisPoint ******************/
		/**** md5 signature: 11cb2b0ab7ce24b456e07576dd7db549 ****/
		%feature("compactdefaultargs") TransformedAxisPoint;
		%feature("autodoc", "Returns the point on the axis after applying trans.matrix.

Returns
-------
gp_Pnt
") TransformedAxisPoint;
		gp_Pnt TransformedAxisPoint();

};


%make_alias(IGESSolid_SolidOfRevolution)

%extend IGESSolid_SolidOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESSolid_SpecificModule *
*********************************/
class IGESSolid_SpecificModule : public IGESData_SpecificModule {
	public:
		/****************** IGESSolid_SpecificModule ******************/
		/**** md5 signature: b48fd049b36793a103b8769c8f43ca28 ****/
		%feature("compactdefaultargs") IGESSolid_SpecificModule;
		%feature("autodoc", "Creates a specificmodule from igessolid & puts it into specificlib.

Returns
-------
None
") IGESSolid_SpecificModule;
		 IGESSolid_SpecificModule();

};


%make_alias(IGESSolid_SpecificModule)

%extend IGESSolid_SpecificModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IGESSolid_Sphere *
*************************/
class IGESSolid_Sphere : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_Sphere ******************/
		/**** md5 signature: 15d873e43d99eb972343454df0d6e4ce ****/
		%feature("compactdefaultargs") IGESSolid_Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_Sphere;
		 IGESSolid_Sphere();

		/****************** Center ******************/
		/**** md5 signature: a0225421bd121773fd44dc2b7d0dfd97 ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns the center of the sphere.

Returns
-------
gp_Pnt
") Center;
		gp_Pnt Center();

		/****************** Init ******************/
		/**** md5 signature: a6abfc20038bf6a835a70631398ec254 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class sphere - aradius : the radius of the sphere - acenter : the center point coordinates (default (0,0,0)).

Parameters
----------
aRadius: float
aCenter: gp_XYZ

Returns
-------
None
") Init;
		void Init(const Standard_Real aRadius, const gp_XYZ & aCenter);

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of the sphere.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** TransformedCenter ******************/
		/**** md5 signature: 5d09d843a8d98dff53df916007422526 ****/
		%feature("compactdefaultargs") TransformedCenter;
		%feature("autodoc", "Returns the center of the sphere after applying transformationmatrix.

Returns
-------
gp_Pnt
") TransformedCenter;
		gp_Pnt TransformedCenter();

};


%make_alias(IGESSolid_Sphere)

%extend IGESSolid_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESSolid_SphericalSurface *
***********************************/
class IGESSolid_SphericalSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_SphericalSurface ******************/
		/**** md5 signature: 00c93b2e81f1784816eb2ba9d451dab6 ****/
		%feature("compactdefaultargs") IGESSolid_SphericalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_SphericalSurface;
		 IGESSolid_SphericalSurface();

		/****************** Axis ******************/
		/**** md5 signature: 55248e3d07a3be664e3f68acb723cbc9 ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the direction of the axis (parametrised surface) null is returned if the surface is not parametrised.

Returns
-------
opencascade::handle<IGESGeom_Direction>
") Axis;
		opencascade::handle<IGESGeom_Direction> Axis();

		/****************** Center ******************/
		/**** md5 signature: 42e5d941280b0bf1c8a75bee7670f91f ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns the center of the spherical surface.

Returns
-------
opencascade::handle<IGESGeom_Point>
") Center;
		opencascade::handle<IGESGeom_Point> Center();

		/****************** Init ******************/
		/**** md5 signature: f7f370f2d63ea8b91e4cac68c9ad9dcc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class sphericalsurface - acenter : the coordinates of the center point - aradius : value of radius - anaxis : the direction of the axis null in case of unparametrised surface - arefdir : the reference direction null in case of unparametrised surface.

Parameters
----------
aCenter: IGESGeom_Point
aRadius: float
anAxis: IGESGeom_Direction
aRefdir: IGESGeom_Direction

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESGeom_Point> & aCenter, const Standard_Real aRadius, const opencascade::handle<IGESGeom_Direction> & anAxis, const opencascade::handle<IGESGeom_Direction> & aRefdir);

		/****************** IsParametrised ******************/
		/**** md5 signature: f229b26be1fada6c54e69c27a362f189 ****/
		%feature("compactdefaultargs") IsParametrised;
		%feature("autodoc", "Returns true if the surface is parametrised, else false.

Returns
-------
bool
") IsParametrised;
		Standard_Boolean IsParametrised();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of the spherical surface.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** ReferenceDir ******************/
		/**** md5 signature: 76dda0b5b133b098645f8ebb558d2baf ****/
		%feature("compactdefaultargs") ReferenceDir;
		%feature("autodoc", "Returns the reference direction (parametrised surface) null is returned if the surface is not parametrised.

Returns
-------
opencascade::handle<IGESGeom_Direction>
") ReferenceDir;
		opencascade::handle<IGESGeom_Direction> ReferenceDir();

		/****************** TransformedCenter ******************/
		/**** md5 signature: 5d09d843a8d98dff53df916007422526 ****/
		%feature("compactdefaultargs") TransformedCenter;
		%feature("autodoc", "Returns the center of the spherical surface after applying transformationmatrix.

Returns
-------
gp_Pnt
") TransformedCenter;
		gp_Pnt TransformedCenter();

};


%make_alias(IGESSolid_SphericalSurface)

%extend IGESSolid_SphericalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESSolid_ToolBlock *
****************************/
class IGESSolid_ToolBlock {
	public:
		/****************** IGESSolid_ToolBlock ******************/
		/**** md5 signature: e364bae9878e2344eeb6d19d4c537f77 ****/
		%feature("compactdefaultargs") IGESSolid_ToolBlock;
		%feature("autodoc", "Returns a toolblock, ready to work.

Returns
-------
None
") IGESSolid_ToolBlock;
		 IGESSolid_ToolBlock();

		/****************** DirChecker ******************/
		/**** md5 signature: 4a796a5cb1dc14d4fd99506d555eed0b ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_Block

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_Block> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 239d48df33a97867e04f68dc3c36ca6e ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_Block
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_Block> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 9d7deb0895ae66872ea6c0e7275c1f71 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_Block
entto: IGESSolid_Block
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_Block> & entfrom, const opencascade::handle<IGESSolid_Block> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 4c162836e2e175ef40cc72777460b4a4 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a block <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_Block
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_Block> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 494ae395a21fc00b043a29e4f1262136 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_Block
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_Block> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: a19a0bb1853c772fae376df787630f9a ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_Block
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_Block> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESSolid_ToolBooleanTree *
**********************************/
class IGESSolid_ToolBooleanTree {
	public:
		/****************** IGESSolid_ToolBooleanTree ******************/
		/**** md5 signature: 7d66780ec705c5d74917df800c2f0c3b ****/
		%feature("compactdefaultargs") IGESSolid_ToolBooleanTree;
		%feature("autodoc", "Returns a toolbooleantree, ready to work.

Returns
-------
None
") IGESSolid_ToolBooleanTree;
		 IGESSolid_ToolBooleanTree();

		/****************** DirChecker ******************/
		/**** md5 signature: f237daabd2bbf5289c3145bd1ef0e286 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_BooleanTree

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_BooleanTree> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 986784576f338e788b73699ac4688557 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_BooleanTree
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_BooleanTree> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 77b119226b9285f73f4d35e3b531e3f0 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_BooleanTree
entto: IGESSolid_BooleanTree
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_BooleanTree> & entfrom, const opencascade::handle<IGESSolid_BooleanTree> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: f3fd673fad7c92964cebbd9659ce52a7 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a booleantree <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_BooleanTree
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_BooleanTree> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 4da13be5d9888669fd14237c443c126f ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_BooleanTree
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_BooleanTree> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 3c16b0c15beda72a48f52f76c2a8a697 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_BooleanTree
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_BooleanTree> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolBooleanTree {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESSolid_ToolConeFrustum *
**********************************/
class IGESSolid_ToolConeFrustum {
	public:
		/****************** IGESSolid_ToolConeFrustum ******************/
		/**** md5 signature: e54597e19b2a7c7516348df40ad82af9 ****/
		%feature("compactdefaultargs") IGESSolid_ToolConeFrustum;
		%feature("autodoc", "Returns a toolconefrustum, ready to work.

Returns
-------
None
") IGESSolid_ToolConeFrustum;
		 IGESSolid_ToolConeFrustum();

		/****************** DirChecker ******************/
		/**** md5 signature: 98097cef0a18e60fd8803abf76a7cd22 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_ConeFrustum

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_ConeFrustum> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 067282f30f38232f5e74707c11859976 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_ConeFrustum
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_ConeFrustum> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: ff4e186c094f8fab0a9e3b3e4f208dc7 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_ConeFrustum
entto: IGESSolid_ConeFrustum
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_ConeFrustum> & entfrom, const opencascade::handle<IGESSolid_ConeFrustum> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 9a802940f113796002b64bb1ad2bd20e ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a conefrustum <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_ConeFrustum
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_ConeFrustum> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: f85604258079e5839dfe30e5baae917d ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_ConeFrustum
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_ConeFrustum> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 8bc7ed8ea5da6b79809569598e2f464c ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_ConeFrustum
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_ConeFrustum> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolConeFrustum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESSolid_ToolConicalSurface *
*************************************/
class IGESSolid_ToolConicalSurface {
	public:
		/****************** IGESSolid_ToolConicalSurface ******************/
		/**** md5 signature: 0305c4dd40b6d2e07ecd5e17f6fa54d7 ****/
		%feature("compactdefaultargs") IGESSolid_ToolConicalSurface;
		%feature("autodoc", "Returns a toolconicalsurface, ready to work.

Returns
-------
None
") IGESSolid_ToolConicalSurface;
		 IGESSolid_ToolConicalSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: 76b5959cf189a3790a19fdc0db71f187 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_ConicalSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_ConicalSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 7c3de847531508498e88b45921395845 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_ConicalSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_ConicalSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 63a91204dca40bd454d73d0f7ac17a36 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_ConicalSurface
entto: IGESSolid_ConicalSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_ConicalSurface> & entfrom, const opencascade::handle<IGESSolid_ConicalSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 2616ee3c7c33bead6e071f19342f22b5 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a conicalsurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_ConicalSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_ConicalSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: eed790c810eeecc584f99125c320b4d5 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_ConicalSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_ConicalSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: d3af2d49bf4eb4dd040707fa51adc0c9 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_ConicalSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_ConicalSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESSolid_ToolCylinder *
*******************************/
class IGESSolid_ToolCylinder {
	public:
		/****************** IGESSolid_ToolCylinder ******************/
		/**** md5 signature: 619f9bbe231ef2dcefaa281942b6e9d4 ****/
		%feature("compactdefaultargs") IGESSolid_ToolCylinder;
		%feature("autodoc", "Returns a toolcylinder, ready to work.

Returns
-------
None
") IGESSolid_ToolCylinder;
		 IGESSolid_ToolCylinder();

		/****************** DirChecker ******************/
		/**** md5 signature: 43105093da438c09e2fa0867b72ad940 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_Cylinder

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_Cylinder> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 2a7f463b4211434b54a719b1d1aa2306 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_Cylinder
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_Cylinder> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: a35f3db01912dcad2ac2ad6f6beb6e74 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_Cylinder
entto: IGESSolid_Cylinder
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_Cylinder> & entfrom, const opencascade::handle<IGESSolid_Cylinder> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 980e2b1dc706ab5443600cdd3c063ec0 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a cylinder <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_Cylinder
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_Cylinder> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 462373927fcd4528ad3b15800429a2a3 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_Cylinder
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_Cylinder> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 67f59b3804c30b790c4b8ddaeec08b95 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_Cylinder
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_Cylinder> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESSolid_ToolCylindricalSurface *
*****************************************/
class IGESSolid_ToolCylindricalSurface {
	public:
		/****************** IGESSolid_ToolCylindricalSurface ******************/
		/**** md5 signature: 4cb7bcba7494183d8ae07112dc6a2529 ****/
		%feature("compactdefaultargs") IGESSolid_ToolCylindricalSurface;
		%feature("autodoc", "Returns a toolcylindricalsurface, ready to work.

Returns
-------
None
") IGESSolid_ToolCylindricalSurface;
		 IGESSolid_ToolCylindricalSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: fbefdbf547acf9a5d067f8b21690e241 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_CylindricalSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_CylindricalSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 88412262d6109d4678c654cc4f2bf00c ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_CylindricalSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_CylindricalSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: e83dc74b88bd801dba795849d3742180 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_CylindricalSurface
entto: IGESSolid_CylindricalSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_CylindricalSurface> & entfrom, const opencascade::handle<IGESSolid_CylindricalSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: ab1554ffd4e07ab5616050022ad6e82a ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a cylindricalsurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_CylindricalSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_CylindricalSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: f17f5e9eef66f2de26e0be674fd24371 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_CylindricalSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_CylindricalSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 1bc432c55cc76a2765cfb6fd5612f8bf ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_CylindricalSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_CylindricalSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolCylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESSolid_ToolEdgeList *
*******************************/
class IGESSolid_ToolEdgeList {
	public:
		/****************** IGESSolid_ToolEdgeList ******************/
		/**** md5 signature: 8927aff8ee7d6f7d3fcf95b306a508ad ****/
		%feature("compactdefaultargs") IGESSolid_ToolEdgeList;
		%feature("autodoc", "Returns a tooledgelist, ready to work.

Returns
-------
None
") IGESSolid_ToolEdgeList;
		 IGESSolid_ToolEdgeList();

		/****************** DirChecker ******************/
		/**** md5 signature: 468fb06bd0bb80c23b018b73b2150498 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_EdgeList

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_EdgeList> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 354471ac881dda6294f0464918b40a61 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_EdgeList
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_EdgeList> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 20dcf064487e2c00f4bcdc93d453b214 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_EdgeList
entto: IGESSolid_EdgeList
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_EdgeList> & entfrom, const opencascade::handle<IGESSolid_EdgeList> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 7ad954985a1dd43b75887f6061eaec85 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a edgelist <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_EdgeList
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_EdgeList> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 185f3005138dfda1a8c47e1d5ac82a73 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_EdgeList
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_EdgeList> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: bf9289632aef9ca541ed25d41b92fdb7 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_EdgeList
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_EdgeList> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolEdgeList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESSolid_ToolEllipsoid *
********************************/
class IGESSolid_ToolEllipsoid {
	public:
		/****************** IGESSolid_ToolEllipsoid ******************/
		/**** md5 signature: 7ba30c8bb7db5bf47020b5dce3c744a0 ****/
		%feature("compactdefaultargs") IGESSolid_ToolEllipsoid;
		%feature("autodoc", "Returns a toolellipsoid, ready to work.

Returns
-------
None
") IGESSolid_ToolEllipsoid;
		 IGESSolid_ToolEllipsoid();

		/****************** DirChecker ******************/
		/**** md5 signature: b4a86bc8317eee44060c8792a87e46ff ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_Ellipsoid

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_Ellipsoid> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: debccc005db4f282cad2bb1776c74e84 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_Ellipsoid
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_Ellipsoid> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 92fbe4142f820026004224ff2dd0c62c ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_Ellipsoid
entto: IGESSolid_Ellipsoid
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_Ellipsoid> & entfrom, const opencascade::handle<IGESSolid_Ellipsoid> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 379bbbe12fb27a51a53d02d9eb6731ad ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a ellipsoid <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_Ellipsoid
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_Ellipsoid> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 38c3f6b5a3da1ea997c4fdda0d48a998 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_Ellipsoid
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_Ellipsoid> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 7a8eae3537c0229c7f5eb2b478698075 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_Ellipsoid
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_Ellipsoid> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolEllipsoid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESSolid_ToolFace *
***************************/
class IGESSolid_ToolFace {
	public:
		/****************** IGESSolid_ToolFace ******************/
		/**** md5 signature: d94fc9e2c646f07df377d8c3cbd7cad9 ****/
		%feature("compactdefaultargs") IGESSolid_ToolFace;
		%feature("autodoc", "Returns a toolface, ready to work.

Returns
-------
None
") IGESSolid_ToolFace;
		 IGESSolid_ToolFace();

		/****************** DirChecker ******************/
		/**** md5 signature: 316e3d0bbfccfff25d678ae08ba1507c ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_Face

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_Face> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 8b98ed0ffff66421fe7a5a90d001e1d8 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_Face
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_Face> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 2c904fa7f3f8bd57d93a7727eb931a47 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_Face
entto: IGESSolid_Face
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_Face> & entfrom, const opencascade::handle<IGESSolid_Face> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 2d44eaf892cf00f4f4c530043767873b ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a face <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_Face
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_Face> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 3d7b347c62135dd76724464998717d05 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_Face
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_Face> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 27c5bc368c3a416b9530cf32b58c854c ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_Face
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_Face> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESSolid_ToolLoop *
***************************/
class IGESSolid_ToolLoop {
	public:
		/****************** IGESSolid_ToolLoop ******************/
		/**** md5 signature: e72c0ee18a6a899acfa7d1459e5426f5 ****/
		%feature("compactdefaultargs") IGESSolid_ToolLoop;
		%feature("autodoc", "Returns a toolloop, ready to work.

Returns
-------
None
") IGESSolid_ToolLoop;
		 IGESSolid_ToolLoop();

		/****************** DirChecker ******************/
		/**** md5 signature: bdc3421671d73256ed513778f1148fdb ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_Loop

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_Loop> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 78ccc50f5c365192bb966b97cccd24e7 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_Loop
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_Loop> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: fa24ffe7e2f394c0bdee6c4ce9ef13c9 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_Loop
entto: IGESSolid_Loop
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_Loop> & entfrom, const opencascade::handle<IGESSolid_Loop> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: ced454681e789fdfa0d05af501a3c5f8 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a loop <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_Loop
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_Loop> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: f92b9bd3a8c38aaf11b4bc3c61ad18f1 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_Loop
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_Loop> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: c79f66901106034c7604cd01e94dc6da ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_Loop
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_Loop> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESSolid_ToolManifoldSolid *
************************************/
class IGESSolid_ToolManifoldSolid {
	public:
		/****************** IGESSolid_ToolManifoldSolid ******************/
		/**** md5 signature: b1897bf0a613dc8fe6a3f2b0c8fe871a ****/
		%feature("compactdefaultargs") IGESSolid_ToolManifoldSolid;
		%feature("autodoc", "Returns a toolmanifoldsolid, ready to work.

Returns
-------
None
") IGESSolid_ToolManifoldSolid;
		 IGESSolid_ToolManifoldSolid();

		/****************** DirChecker ******************/
		/**** md5 signature: 8407c9041f58271c50ffe9711ce7a9f3 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_ManifoldSolid

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_ManifoldSolid> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 3a72dd9fc4547c3fb942517079034f69 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_ManifoldSolid
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_ManifoldSolid> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 76361aed0679233bf409dd9764c7f42d ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_ManifoldSolid
entto: IGESSolid_ManifoldSolid
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_ManifoldSolid> & entfrom, const opencascade::handle<IGESSolid_ManifoldSolid> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 5cc9a65fd638a6d7fda080bec24b6388 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a manifoldsolid <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_ManifoldSolid
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_ManifoldSolid> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 3bab9bc13a7d9e09e6fe580f5d87af32 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_ManifoldSolid
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_ManifoldSolid> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 4308c06199902e4855565d782ecc6af0 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_ManifoldSolid
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_ManifoldSolid> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolManifoldSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESSolid_ToolPlaneSurface *
***********************************/
class IGESSolid_ToolPlaneSurface {
	public:
		/****************** IGESSolid_ToolPlaneSurface ******************/
		/**** md5 signature: 3d0714e8530f9327e15739675bc0e9ed ****/
		%feature("compactdefaultargs") IGESSolid_ToolPlaneSurface;
		%feature("autodoc", "Returns a toolplanesurface, ready to work.

Returns
-------
None
") IGESSolid_ToolPlaneSurface;
		 IGESSolid_ToolPlaneSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: 9b230aaa6a2bc064b39550074e219767 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_PlaneSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_PlaneSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: d11e62f815d105f81251809bdcbbdddd ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_PlaneSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_PlaneSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 5421f6f592271ca339883763a069dba6 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_PlaneSurface
entto: IGESSolid_PlaneSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_PlaneSurface> & entfrom, const opencascade::handle<IGESSolid_PlaneSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 08a46c8fcfd6f263e55516b3cccd1a23 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a planesurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_PlaneSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_PlaneSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: cb5ced2f92ec17f131c1e8b88970e001 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_PlaneSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_PlaneSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 1b88a40f85cb7ec5c3bea8426883a0c3 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_PlaneSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_PlaneSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolPlaneSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESSolid_ToolRightAngularWedge *
****************************************/
class IGESSolid_ToolRightAngularWedge {
	public:
		/****************** IGESSolid_ToolRightAngularWedge ******************/
		/**** md5 signature: 39815a0d0199f0367fe7a8ed92fb035d ****/
		%feature("compactdefaultargs") IGESSolid_ToolRightAngularWedge;
		%feature("autodoc", "Returns a toolrightangularwedge, ready to work.

Returns
-------
None
") IGESSolid_ToolRightAngularWedge;
		 IGESSolid_ToolRightAngularWedge();

		/****************** DirChecker ******************/
		/**** md5 signature: 37d624ed5498a9e018bc35c4072aadd8 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_RightAngularWedge

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_RightAngularWedge> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 247e77da953c02eaa348373f23231700 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_RightAngularWedge
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_RightAngularWedge> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 5284e7a75f3200545255ce83fd57e773 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_RightAngularWedge
entto: IGESSolid_RightAngularWedge
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_RightAngularWedge> & entfrom, const opencascade::handle<IGESSolid_RightAngularWedge> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: dcc2ae710fcde0696bc4aa66765a699a ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a rightangularwedge <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_RightAngularWedge
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_RightAngularWedge> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 8d185063645ed86f17130500b379c400 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_RightAngularWedge
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_RightAngularWedge> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 31fb4fde89fd4e99230ca8de87621cc0 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_RightAngularWedge
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_RightAngularWedge> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolRightAngularWedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESSolid_ToolSelectedComponent *
****************************************/
class IGESSolid_ToolSelectedComponent {
	public:
		/****************** IGESSolid_ToolSelectedComponent ******************/
		/**** md5 signature: 89b6d6b0fdf21a14551efceff9c8ed79 ****/
		%feature("compactdefaultargs") IGESSolid_ToolSelectedComponent;
		%feature("autodoc", "Returns a toolselectedcomponent, ready to work.

Returns
-------
None
") IGESSolid_ToolSelectedComponent;
		 IGESSolid_ToolSelectedComponent();

		/****************** DirChecker ******************/
		/**** md5 signature: cf82a7f0e06155b28177640a639ec8bf ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_SelectedComponent

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_SelectedComponent> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: d513f20e57bfa3c39d72b581a10719aa ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_SelectedComponent
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_SelectedComponent> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: d09286576f3996f9b5f3d482cbd92989 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_SelectedComponent
entto: IGESSolid_SelectedComponent
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_SelectedComponent> & entfrom, const opencascade::handle<IGESSolid_SelectedComponent> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 738a2db8100fd133723e73931bca24ba ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a selectedcomponent <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_SelectedComponent
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_SelectedComponent> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 5060b253e723eb40d7aaa8d2c86c731b ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_SelectedComponent
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_SelectedComponent> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 88ab45aac62dcabfe4767130dab64413 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_SelectedComponent
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_SelectedComponent> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolSelectedComponent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESSolid_ToolShell *
****************************/
class IGESSolid_ToolShell {
	public:
		/****************** IGESSolid_ToolShell ******************/
		/**** md5 signature: 4d445f9aa907174b4ad43186081b90ee ****/
		%feature("compactdefaultargs") IGESSolid_ToolShell;
		%feature("autodoc", "Returns a toolshell, ready to work.

Returns
-------
None
") IGESSolid_ToolShell;
		 IGESSolid_ToolShell();

		/****************** DirChecker ******************/
		/**** md5 signature: f967cc49f10b6265879e8434ac2161af ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_Shell

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_Shell> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: d7e498711d9db126440b8299e54b6699 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_Shell
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_Shell> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 4b2497e4fb008b411b1fe3504d7b1bb0 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_Shell
entto: IGESSolid_Shell
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_Shell> & entfrom, const opencascade::handle<IGESSolid_Shell> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: f6477c52b9e43c6eb48b4bc13e5fbe25 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a shell <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_Shell
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_Shell> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: f9c4b335a89f5504a52f58220736221f ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_Shell
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_Shell> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: e8de886c549db0d9f748de1275655c00 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_Shell
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_Shell> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESSolid_ToolSolidAssembly *
************************************/
class IGESSolid_ToolSolidAssembly {
	public:
		/****************** IGESSolid_ToolSolidAssembly ******************/
		/**** md5 signature: 7f2e6983d757fd72191e1ffb972863ac ****/
		%feature("compactdefaultargs") IGESSolid_ToolSolidAssembly;
		%feature("autodoc", "Returns a toolsolidassembly, ready to work.

Returns
-------
None
") IGESSolid_ToolSolidAssembly;
		 IGESSolid_ToolSolidAssembly();

		/****************** DirChecker ******************/
		/**** md5 signature: cb54e2bde7dd70c2ed584c9f3d1edb7c ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_SolidAssembly

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_SolidAssembly> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 47f9dc173742f2bd698c1abc1dd8a353 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_SolidAssembly
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_SolidAssembly> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 6360a6554de4b76d44a7b663096f5bed ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_SolidAssembly
entto: IGESSolid_SolidAssembly
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_SolidAssembly> & entfrom, const opencascade::handle<IGESSolid_SolidAssembly> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: bbdae44e942a2faa69b55c2151e6f434 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a solidassembly <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_SolidAssembly
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_SolidAssembly> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: db6026b1e01a1ddc618d4696174d9922 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_SolidAssembly
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_SolidAssembly> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: a22fd02ac66b07bd1ed7a2d30d4881eb ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_SolidAssembly
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_SolidAssembly> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolSolidAssembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESSolid_ToolSolidInstance *
************************************/
class IGESSolid_ToolSolidInstance {
	public:
		/****************** IGESSolid_ToolSolidInstance ******************/
		/**** md5 signature: 7131fbce31bce71a789fcb6442f8fcf6 ****/
		%feature("compactdefaultargs") IGESSolid_ToolSolidInstance;
		%feature("autodoc", "Returns a toolsolidinstance, ready to work.

Returns
-------
None
") IGESSolid_ToolSolidInstance;
		 IGESSolid_ToolSolidInstance();

		/****************** DirChecker ******************/
		/**** md5 signature: b9d72877ff741c8b1a5bdfe389ef5260 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_SolidInstance

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_SolidInstance> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: ff453665c21d10da17e58d0cb97c0c84 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_SolidInstance
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_SolidInstance> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: cb4d868ae6806bcdba053055574f962f ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_SolidInstance
entto: IGESSolid_SolidInstance
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_SolidInstance> & entfrom, const opencascade::handle<IGESSolid_SolidInstance> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 31cf351bfd5a996484d866a0b769ca04 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a solidinstance <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_SolidInstance
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_SolidInstance> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: a63fbcd0b28c1ed5c7704fd771ee3a49 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_SolidInstance
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_SolidInstance> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 7e26a8b4f3a9660bf9423549181c307b ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_SolidInstance
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_SolidInstance> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolSolidInstance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class IGESSolid_ToolSolidOfLinearExtrusion *
*********************************************/
class IGESSolid_ToolSolidOfLinearExtrusion {
	public:
		/****************** IGESSolid_ToolSolidOfLinearExtrusion ******************/
		/**** md5 signature: 2a22daf65425fd12573421942b168908 ****/
		%feature("compactdefaultargs") IGESSolid_ToolSolidOfLinearExtrusion;
		%feature("autodoc", "Returns a toolsolidoflinearextrusion, ready to work.

Returns
-------
None
") IGESSolid_ToolSolidOfLinearExtrusion;
		 IGESSolid_ToolSolidOfLinearExtrusion();

		/****************** DirChecker ******************/
		/**** md5 signature: 8d3fd4ebad9b9d32d20ef8f8e8c0905a ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_SolidOfLinearExtrusion

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_SolidOfLinearExtrusion> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 75a3b1ff889e38585a6e94d123597f62 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_SolidOfLinearExtrusion
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_SolidOfLinearExtrusion> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: e73ada6a4b0ac1d0c9c70fb2911051d1 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_SolidOfLinearExtrusion
entto: IGESSolid_SolidOfLinearExtrusion
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_SolidOfLinearExtrusion> & entfrom, const opencascade::handle<IGESSolid_SolidOfLinearExtrusion> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 17f8c669e7c4f382bcedb111b04c0d7e ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a solidoflinearextrusion <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_SolidOfLinearExtrusion
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_SolidOfLinearExtrusion> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 1906a4a8e8ed2a905b30a52488cb83b6 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_SolidOfLinearExtrusion
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_SolidOfLinearExtrusion> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 9fedd16f189198453ce933681b96eaad ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_SolidOfLinearExtrusion
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_SolidOfLinearExtrusion> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolSolidOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESSolid_ToolSolidOfRevolution *
****************************************/
class IGESSolid_ToolSolidOfRevolution {
	public:
		/****************** IGESSolid_ToolSolidOfRevolution ******************/
		/**** md5 signature: f83de1d3c2420a3a2bd94a61b3c2ccc4 ****/
		%feature("compactdefaultargs") IGESSolid_ToolSolidOfRevolution;
		%feature("autodoc", "Returns a toolsolidofrevolution, ready to work.

Returns
-------
None
") IGESSolid_ToolSolidOfRevolution;
		 IGESSolid_ToolSolidOfRevolution();

		/****************** DirChecker ******************/
		/**** md5 signature: 7f11464495a6f22a987407b1e500be85 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_SolidOfRevolution

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_SolidOfRevolution> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 703de5f42d0cac7092e6543f1cd6b038 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_SolidOfRevolution
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_SolidOfRevolution> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 7145ad2e61be6f25cf981133290ed098 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_SolidOfRevolution
entto: IGESSolid_SolidOfRevolution
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_SolidOfRevolution> & entfrom, const opencascade::handle<IGESSolid_SolidOfRevolution> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 21cba3c84e8119490c05e5881158e54e ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a solidofrevolution <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_SolidOfRevolution
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_SolidOfRevolution> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 24c44637672da3e5a2be1e0101d9549b ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_SolidOfRevolution
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_SolidOfRevolution> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: c1e5f786c751f515a897efaa1cce808c ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_SolidOfRevolution
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_SolidOfRevolution> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolSolidOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESSolid_ToolSphere *
*****************************/
class IGESSolid_ToolSphere {
	public:
		/****************** IGESSolid_ToolSphere ******************/
		/**** md5 signature: 367844a66c9fe97b3edbdc3ca37bef0e ****/
		%feature("compactdefaultargs") IGESSolid_ToolSphere;
		%feature("autodoc", "Returns a toolsphere, ready to work.

Returns
-------
None
") IGESSolid_ToolSphere;
		 IGESSolid_ToolSphere();

		/****************** DirChecker ******************/
		/**** md5 signature: ccec3da942602aa701bfb1018729a176 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_Sphere

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_Sphere> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: ff009c914054e3b5cd30cb527f0e8f1c ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_Sphere
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_Sphere> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 1d780f82365e0527b5ba8da3f3451202 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_Sphere
entto: IGESSolid_Sphere
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_Sphere> & entfrom, const opencascade::handle<IGESSolid_Sphere> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 77adb20efffd6effda1758a681ce1393 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a sphere <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_Sphere
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_Sphere> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 4f4b4bb87d10b057db208d907480978c ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_Sphere
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_Sphere> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: caf74068809e8915667406a8098be7d3 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_Sphere
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_Sphere> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolSphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IGESSolid_ToolSphericalSurface *
***************************************/
class IGESSolid_ToolSphericalSurface {
	public:
		/****************** IGESSolid_ToolSphericalSurface ******************/
		/**** md5 signature: 151cec6dda342bd70fe5c9f5dd0fc85d ****/
		%feature("compactdefaultargs") IGESSolid_ToolSphericalSurface;
		%feature("autodoc", "Returns a toolsphericalsurface, ready to work.

Returns
-------
None
") IGESSolid_ToolSphericalSurface;
		 IGESSolid_ToolSphericalSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: fe3290ea246d9755f0de14bbcddd1004 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_SphericalSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_SphericalSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: e41c8e3dac82e800293799ba78010671 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_SphericalSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_SphericalSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: e7c74bf13137adbfa6e38be1ad53439c ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_SphericalSurface
entto: IGESSolid_SphericalSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_SphericalSurface> & entfrom, const opencascade::handle<IGESSolid_SphericalSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: a0086f0134eeb30bf8cb5d6277f3e0f2 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a sphericalsurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_SphericalSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_SphericalSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 90836072806d3dae29d687582b141e2d ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_SphericalSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_SphericalSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 15ce358dc86cdd53ef124cf26bced317 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_SphericalSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_SphericalSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolSphericalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESSolid_ToolToroidalSurface *
**************************************/
class IGESSolid_ToolToroidalSurface {
	public:
		/****************** IGESSolid_ToolToroidalSurface ******************/
		/**** md5 signature: d88a53b0caeebdca4544e5a8158328dc ****/
		%feature("compactdefaultargs") IGESSolid_ToolToroidalSurface;
		%feature("autodoc", "Returns a tooltoroidalsurface, ready to work.

Returns
-------
None
") IGESSolid_ToolToroidalSurface;
		 IGESSolid_ToolToroidalSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: 0cf4c171a90457401e9ae2e5a99f4a6b ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_ToroidalSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_ToroidalSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 5e01a2eec94e4ef7ffc68a0bcc43c41e ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_ToroidalSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_ToroidalSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: f32ed940a46e562b201f87e8d0dd00d1 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_ToroidalSurface
entto: IGESSolid_ToroidalSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_ToroidalSurface> & entfrom, const opencascade::handle<IGESSolid_ToroidalSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: a4bb4e65e1dcff013b3a6af77401345a ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a toroidalsurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_ToroidalSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_ToroidalSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 45465326983e37ae74deecde496834d8 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_ToroidalSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_ToroidalSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 891c2073041f9ca403f24de02c1738c6 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_ToroidalSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_ToroidalSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESSolid_ToolTorus *
****************************/
class IGESSolid_ToolTorus {
	public:
		/****************** IGESSolid_ToolTorus ******************/
		/**** md5 signature: ce0e2170202ce69bdcc973280259a973 ****/
		%feature("compactdefaultargs") IGESSolid_ToolTorus;
		%feature("autodoc", "Returns a tooltorus, ready to work.

Returns
-------
None
") IGESSolid_ToolTorus;
		 IGESSolid_ToolTorus();

		/****************** DirChecker ******************/
		/**** md5 signature: d38846ed37b87655627755adc1ab6661 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_Torus

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_Torus> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 0e206f250091e60284e3dfc07d8bda40 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_Torus
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_Torus> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 815fd1afa78d4d408d4a30d0d231e93f ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_Torus
entto: IGESSolid_Torus
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_Torus> & entfrom, const opencascade::handle<IGESSolid_Torus> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 2fab354eab4f8a23725b1646104f4d56 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a torus <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_Torus
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_Torus> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 2ad9fafc3fbc88bb8b9a2e10a839778a ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_Torus
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_Torus> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 072619ffe3abed538e98cdec4ffe3cc8 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_Torus
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_Torus> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolTorus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESSolid_ToolVertexList *
*********************************/
class IGESSolid_ToolVertexList {
	public:
		/****************** IGESSolid_ToolVertexList ******************/
		/**** md5 signature: 0e866ccbdf4d63accb8e16767a7afefb ****/
		%feature("compactdefaultargs") IGESSolid_ToolVertexList;
		%feature("autodoc", "Returns a toolvertexlist, ready to work.

Returns
-------
None
") IGESSolid_ToolVertexList;
		 IGESSolid_ToolVertexList();

		/****************** DirChecker ******************/
		/**** md5 signature: 87bbed3dfaad75ecbd5a78100e281e40 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESSolid_VertexList

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESSolid_VertexList> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 59a4ffb37f81908b858227081a72e39b ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESSolid_VertexList
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESSolid_VertexList> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 658d99bbe2af4aa86fd91abf6024a028 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESSolid_VertexList
entto: IGESSolid_VertexList
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESSolid_VertexList> & entfrom, const opencascade::handle<IGESSolid_VertexList> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 9ab074d6c79a60dfb076ee37123febb2 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a vertexlist <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESSolid_VertexList
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESSolid_VertexList> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 5fbd734af8cc966d00ab7ff41c63f16e ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESSolid_VertexList
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESSolid_VertexList> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 2df000ff160cf427fbedfad5e90bcaee ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESSolid_VertexList
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESSolid_VertexList> & ent, IGESData_IGESWriter & IW);

};


%extend IGESSolid_ToolVertexList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESSolid_TopoBuilder *
******************************/
class IGESSolid_TopoBuilder {
	public:
		/****************** IGESSolid_TopoBuilder ******************/
		/**** md5 signature: 940a56b38dac04e43719433ca10b8eea ****/
		%feature("compactdefaultargs") IGESSolid_TopoBuilder;
		%feature("autodoc", "Creates an empty topobuilder this creates also a unique vertexlist and a unique edgelist, empty, but which can be referenced from starting.

Returns
-------
None
") IGESSolid_TopoBuilder;
		 IGESSolid_TopoBuilder();

		/****************** AddCurveUV ******************/
		/**** md5 signature: bfb719ffd5450e4d6deacb3c0dff38ca ****/
		%feature("compactdefaultargs") AddCurveUV;
		%feature("autodoc", "Adds a parametric curve (uv) to the current edge(uv).

Parameters
----------
curve: IGESData_IGESEntity
iso: int

Returns
-------
None
") AddCurveUV;
		void AddCurveUV(const opencascade::handle<IGESData_IGESEntity> & curve, const Standard_Integer iso);

		/****************** AddEdge ******************/
		/**** md5 signature: 5e087c07fba01a93540d89a70831850d ****/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "Adds an edge (3d) to the edgelist, defined by a curve and two number of vertex, for start and end.

Parameters
----------
curve: IGESData_IGESEntity
vstart: int
vend: int

Returns
-------
None
") AddEdge;
		void AddEdge(const opencascade::handle<IGESData_IGESEntity> & curve, const Standard_Integer vstart, const Standard_Integer vend);

		/****************** AddInner ******************/
		/**** md5 signature: 2bf362de383d892f9ca41bfed8a72285 ****/
		%feature("compactdefaultargs") AddInner;
		%feature("autodoc", "Closes the current loop and adds it to the list of inner loops for the current face.

Returns
-------
None
") AddInner;
		void AddInner();

		/****************** AddVertex ******************/
		/**** md5 signature: f2e20d9d65eb12624439b66f6a62fe8a ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertex to the vertexlist.

Parameters
----------
val: gp_XYZ

Returns
-------
None
") AddVertex;
		void AddVertex(const gp_XYZ & val);

		/****************** AddVoidShell ******************/
		/**** md5 signature: 5b360e27d98f47fea43f64848c8a42d3 ****/
		%feature("compactdefaultargs") AddVoidShell;
		%feature("autodoc", "Closes the definition of the current shell and adds it to the list of void shells of a solid, with an orientation flag (0/1).

Parameters
----------
orientation: int

Returns
-------
None
") AddVoidShell;
		void AddVoidShell(const Standard_Integer orientation);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Resets the topobuilder for an entirely new operation (with a new edgelist, a new vertexlist, new shells, ...).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Edge ******************/
		/**** md5 signature: 12aaf5ea7bd40c6a976898cb0d8633b3 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the definition of an edge (3d) given its rank.

Parameters
----------
num: int
curve: IGESData_IGESEntity

Returns
-------
vstart: int
vend: int
") Edge;
		void Edge(const Standard_Integer num, opencascade::handle<IGESData_IGESEntity> & curve, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** EdgeList ******************/
		/**** md5 signature: f7a7447e518c742dea1b6c1e179b984b ****/
		%feature("compactdefaultargs") EdgeList;
		%feature("autodoc", "Returns the edgelist. it can be referenced, but it remains empty until call to endshell or endsolid.

Returns
-------
opencascade::handle<IGESSolid_EdgeList>
") EdgeList;
		opencascade::handle<IGESSolid_EdgeList> EdgeList();

		/****************** EndEdge ******************/
		/**** md5 signature: 65e8814ca923699bb7d20c5a10ebd64b ****/
		%feature("compactdefaultargs") EndEdge;
		%feature("autodoc", "Closes the definition of an edge(uv) and adds it to the current loop.

Returns
-------
None
") EndEdge;
		void EndEdge();

		/****************** EndFace ******************/
		/**** md5 signature: 8f9f3b1ebeda4e181217d8ab915d8d9c ****/
		%feature("compactdefaultargs") EndFace;
		%feature("autodoc", "Closes the definition of the current face, fills it and adds it to the current shell with an orientation flag (0/1).

Parameters
----------
orientation: int

Returns
-------
None
") EndFace;
		void EndFace(const Standard_Integer orientation);

		/****************** EndSimpleShell ******************/
		/**** md5 signature: db9613b750f0dd619858642de0a0324b ****/
		%feature("compactdefaultargs") EndSimpleShell;
		%feature("autodoc", "Closes the whole definition as that of a simple shell.

Returns
-------
None
") EndSimpleShell;
		void EndSimpleShell();

		/****************** EndSolid ******************/
		/**** md5 signature: 53fef6268ef2b457c6d5665d8f82187a ****/
		%feature("compactdefaultargs") EndSolid;
		%feature("autodoc", "Closes the whole definition as that of a manifoldsolid its call is exclusive from that of endsimpleshell.

Returns
-------
None
") EndSolid;
		void EndSolid();

		/****************** MakeEdge ******************/
		/**** md5 signature: 65d825380dc9be2b88992719a54e81c2 ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "Defines an edge(uv), to be added in the current loop by endedge <edgetype> gives the type of the edge <edge3d> identifies the edge(3d) used as support the edgelist is always the current one <orientation gives the orientation flag it is then necessary to : - give the parametric curves - close the definition of this edge(uv) by endedge, else the next call to makeedge will erase this one.

Parameters
----------
edgetype: int
edge3d: int
orientation: int

Returns
-------
None
") MakeEdge;
		void MakeEdge(const Standard_Integer edgetype, const Standard_Integer edge3d, const Standard_Integer orientation);

		/****************** MakeFace ******************/
		/**** md5 signature: cd271324977016038bf1996b559c077f ****/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "Begins the definition of a new face, on a surface all loops defined by makeloop will be added in it, according the closing call : setouter for the outer loop (by default, if setouter is not called, no outerloop is defined); addinner for the list of inner loops (there can be none).

Parameters
----------
surface: IGESData_IGESEntity

Returns
-------
None
") MakeFace;
		void MakeFace(const opencascade::handle<IGESData_IGESEntity> & surface);

		/****************** MakeLoop ******************/
		/**** md5 signature: 1a104cdd598a2ba271fe2508de2df4ee ****/
		%feature("compactdefaultargs") MakeLoop;
		%feature("autodoc", "Begins the definition of a new loop : it is the current loop all edges (uv) defined by makeedge/endedge will be added in it the loop can then be referenced but is empty. it will be filled with its edges(uv) by endloop (from setouter/addinner).

Returns
-------
None
") MakeLoop;
		void MakeLoop();

		/****************** MakeShell ******************/
		/**** md5 signature: c9528dfeea969db7071e44fc935475f2 ****/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "Begins the definition of a new shell (either simple or in a solid).

Returns
-------
None
") MakeShell;
		void MakeShell();

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the count of recorded edges (3d).

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** NbVertices ******************/
		/**** md5 signature: 435b05539d6b9d704dc04d9218f26996 ****/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Returns the count of already recorded vertices.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** SetMainShell ******************/
		/**** md5 signature: 81c0f9c2a6ab63a9cf401d39cae738f9 ****/
		%feature("compactdefaultargs") SetMainShell;
		%feature("autodoc", "Closes the definition of the current shell as for the main shell of a solid, with an orientation flag (0/1).

Parameters
----------
orientation: int

Returns
-------
None
") SetMainShell;
		void SetMainShell(const Standard_Integer orientation);

		/****************** SetOuter ******************/
		/**** md5 signature: 93979ebbec562913849e2d8621ef107a ****/
		%feature("compactdefaultargs") SetOuter;
		%feature("autodoc", "Closes the current loop and sets it loop as outer loop. if no current loop has yet been defined, does nothing.

Returns
-------
None
") SetOuter;
		void SetOuter();

		/****************** Shell ******************/
		/**** md5 signature: 7f666de73ee2207bb6ba7e8d98f93fcb ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the current shell. the current shell is created empty by makeshell and filled by endshell.

Returns
-------
opencascade::handle<IGESSolid_Shell>
") Shell;
		opencascade::handle<IGESSolid_Shell> Shell();

		/****************** Solid ******************/
		/**** md5 signature: 9d8b9e89c39824b7cfdc4f8cc2be11bf ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Returns the current manifoldsolid. it is created empty by create and filled by endsolid.

Returns
-------
opencascade::handle<IGESSolid_ManifoldSolid>
") Solid;
		opencascade::handle<IGESSolid_ManifoldSolid> Solid();

		/****************** Vertex ******************/
		/**** md5 signature: 8da7f32012343ebc58008d6414bf78d2 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns a vertex, given its rank.

Parameters
----------
num: int

Returns
-------
gp_XYZ
") Vertex;
		const gp_XYZ Vertex(const Standard_Integer num);

		/****************** VertexList ******************/
		/**** md5 signature: f3b2b6d2527f9f960a7709d58c072574 ****/
		%feature("compactdefaultargs") VertexList;
		%feature("autodoc", "Returns the vertexlist. it can be referenced, but it remains empty until call to endshell or endsolid.

Returns
-------
opencascade::handle<IGESSolid_VertexList>
") VertexList;
		opencascade::handle<IGESSolid_VertexList> VertexList();

};


%extend IGESSolid_TopoBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESSolid_ToroidalSurface *
**********************************/
class IGESSolid_ToroidalSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_ToroidalSurface ******************/
		/**** md5 signature: f41ff8cef3b99625aef6391ab843644d ****/
		%feature("compactdefaultargs") IGESSolid_ToroidalSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_ToroidalSurface;
		 IGESSolid_ToroidalSurface();

		/****************** Axis ******************/
		/**** md5 signature: 55248e3d07a3be664e3f68acb723cbc9 ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the direction of the axis.

Returns
-------
opencascade::handle<IGESGeom_Direction>
") Axis;
		opencascade::handle<IGESGeom_Direction> Axis();

		/****************** Center ******************/
		/**** md5 signature: 42e5d941280b0bf1c8a75bee7670f91f ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns the center point coordinates of the surface.

Returns
-------
opencascade::handle<IGESGeom_Point>
") Center;
		opencascade::handle<IGESGeom_Point> Center();

		/****************** Init ******************/
		/**** md5 signature: 9e8a91fc93c1039c142c047a9bcc6747 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class toroidalsurface - acenter : the center point coordinates - anaxis : the direction of the axis - majradius : the major radius - minradius : the minor radius - refdir : the reference direction (parametrised) default null for unparametrised surface.

Parameters
----------
aCenter: IGESGeom_Point
anAxis: IGESGeom_Direction
majRadius: float
minRadius: float
Refdir: IGESGeom_Direction

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESGeom_Point> & aCenter, const opencascade::handle<IGESGeom_Direction> & anAxis, const Standard_Real majRadius, const Standard_Real minRadius, const opencascade::handle<IGESGeom_Direction> & Refdir);

		/****************** IsParametrised ******************/
		/**** md5 signature: f229b26be1fada6c54e69c27a362f189 ****/
		%feature("compactdefaultargs") IsParametrised;
		%feature("autodoc", "Returns true if the surface is parametrised, else false.

Returns
-------
bool
") IsParametrised;
		Standard_Boolean IsParametrised();

		/****************** MajorRadius ******************/
		/**** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of the surface.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: e1383e2287a25901af1e2b42cc95af4d ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of the surface.

Returns
-------
float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** ReferenceDir ******************/
		/**** md5 signature: 76dda0b5b133b098645f8ebb558d2baf ****/
		%feature("compactdefaultargs") ReferenceDir;
		%feature("autodoc", "Returns the reference direction (parametrised surface) null is returned if the surface is not parametrised.

Returns
-------
opencascade::handle<IGESGeom_Direction>
") ReferenceDir;
		opencascade::handle<IGESGeom_Direction> ReferenceDir();

		/****************** TransformedCenter ******************/
		/**** md5 signature: 5d09d843a8d98dff53df916007422526 ****/
		%feature("compactdefaultargs") TransformedCenter;
		%feature("autodoc", "Returns the center point coordinates of the surface after applying transformationmatrix.

Returns
-------
gp_Pnt
") TransformedCenter;
		gp_Pnt TransformedCenter();

};


%make_alias(IGESSolid_ToroidalSurface)

%extend IGESSolid_ToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IGESSolid_Torus *
************************/
class IGESSolid_Torus : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_Torus ******************/
		/**** md5 signature: 26240a41cfeb81839cf6d1b87dba210b ****/
		%feature("compactdefaultargs") IGESSolid_Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_Torus;
		 IGESSolid_Torus();

		/****************** Axis ******************/
		/**** md5 signature: aaa2fda5c52a82f447c01991d32ce52e ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns direction of the axis.

Returns
-------
gp_Dir
") Axis;
		gp_Dir Axis();

		/****************** AxisPoint ******************/
		/**** md5 signature: 41acb83bdd1484c8e39e863e0534c5a8 ****/
		%feature("compactdefaultargs") AxisPoint;
		%feature("autodoc", "Returns the center of torus.

Returns
-------
gp_Pnt
") AxisPoint;
		gp_Pnt AxisPoint();

		/****************** DiscRadius ******************/
		/**** md5 signature: b837881db24f8432beb987792806269d ****/
		%feature("compactdefaultargs") DiscRadius;
		%feature("autodoc", "Returns the radius of the disc to be revolved.

Returns
-------
float
") DiscRadius;
		Standard_Real DiscRadius();

		/****************** Init ******************/
		/**** md5 signature: 0e9b89a0622e645488cbfe1c5e797cff ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class torus - r1 : distance from center of torus to center of circular disc to be revolved - r2 : radius of circular disc - apoint : center point coordinates (default (0,0,0)) - anaxis : unit vector in axis direction (default (0,0,1)).

Parameters
----------
R1: float
R2: float
aPoint: gp_XYZ
anAxisdir: gp_XYZ

Returns
-------
None
") Init;
		void Init(const Standard_Real R1, const Standard_Real R2, const gp_XYZ & aPoint, const gp_XYZ & anAxisdir);

		/****************** MajorRadius ******************/
		/**** md5 signature: e961bb81456f4d0a6154d0e9401e1ce8 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the distance from the center of torus to the center of the disc to be revolved.

Returns
-------
float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** TransformedAxis ******************/
		/**** md5 signature: 988bb846dc3a9d88e859e39c1d608827 ****/
		%feature("compactdefaultargs") TransformedAxis;
		%feature("autodoc", "Returns direction of the axis after applying transformationmatrix.

Returns
-------
gp_Dir
") TransformedAxis;
		gp_Dir TransformedAxis();

		/****************** TransformedAxisPoint ******************/
		/**** md5 signature: 11cb2b0ab7ce24b456e07576dd7db549 ****/
		%feature("compactdefaultargs") TransformedAxisPoint;
		%feature("autodoc", "Returns the center of torus after applying transformationmatrix.

Returns
-------
gp_Pnt
") TransformedAxisPoint;
		gp_Pnt TransformedAxisPoint();

};


%make_alias(IGESSolid_Torus)

%extend IGESSolid_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESSolid_VertexList *
*****************************/
class IGESSolid_VertexList : public IGESData_IGESEntity {
	public:
		/****************** IGESSolid_VertexList ******************/
		/**** md5 signature: e4f9b46c0bc7b00acc604f144c039ac8 ****/
		%feature("compactdefaultargs") IGESSolid_VertexList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSolid_VertexList;
		 IGESSolid_VertexList();

		/****************** Init ******************/
		/**** md5 signature: 8b9dce89529db881d3747a855dbcfab6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class vertexlist - vertices : the vertices in the list.

Parameters
----------
vertices: TColgp_HArray1OfXYZ

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TColgp_HArray1OfXYZ> & vertices);

		/****************** NbVertices ******************/
		/**** md5 signature: 435b05539d6b9d704dc04d9218f26996 ****/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return the number of vertices in the list.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** Vertex ******************/
		/**** md5 signature: 4d1927f4565cd09560e1dd4574247daa ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the num'th vertex in the list raises exception if num <= 0 or num > nbvertices().

Parameters
----------
num: int

Returns
-------
gp_Pnt
") Vertex;
		gp_Pnt Vertex(const Standard_Integer num);

};


%make_alias(IGESSolid_VertexList)

%extend IGESSolid_VertexList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class IGESSolid_HArray1OfFace : public IGESSolid_Array1OfFace, public Standard_Transient {
  public:
    IGESSolid_HArray1OfFace(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESSolid_HArray1OfFace(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESSolid_Array1OfFace::value_type& theValue);
    IGESSolid_HArray1OfFace(const IGESSolid_Array1OfFace& theOther);
    const IGESSolid_Array1OfFace& Array1();
    IGESSolid_Array1OfFace& ChangeArray1();
};
%make_alias(IGESSolid_HArray1OfFace)


class IGESSolid_HArray1OfLoop : public IGESSolid_Array1OfLoop, public Standard_Transient {
  public:
    IGESSolid_HArray1OfLoop(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESSolid_HArray1OfLoop(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESSolid_Array1OfLoop::value_type& theValue);
    IGESSolid_HArray1OfLoop(const IGESSolid_Array1OfLoop& theOther);
    const IGESSolid_Array1OfLoop& Array1();
    IGESSolid_Array1OfLoop& ChangeArray1();
};
%make_alias(IGESSolid_HArray1OfLoop)


class IGESSolid_HArray1OfShell : public IGESSolid_Array1OfShell, public Standard_Transient {
  public:
    IGESSolid_HArray1OfShell(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESSolid_HArray1OfShell(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESSolid_Array1OfShell::value_type& theValue);
    IGESSolid_HArray1OfShell(const IGESSolid_Array1OfShell& theOther);
    const IGESSolid_Array1OfShell& Array1();
    IGESSolid_Array1OfShell& ChangeArray1();
};
%make_alias(IGESSolid_HArray1OfShell)


class IGESSolid_HArray1OfVertexList : public IGESSolid_Array1OfVertexList, public Standard_Transient {
  public:
    IGESSolid_HArray1OfVertexList(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESSolid_HArray1OfVertexList(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESSolid_Array1OfVertexList::value_type& theValue);
    IGESSolid_HArray1OfVertexList(const IGESSolid_Array1OfVertexList& theOther);
    const IGESSolid_Array1OfVertexList& Array1();
    IGESSolid_Array1OfVertexList& ChangeArray1();
};
%make_alias(IGESSolid_HArray1OfVertexList)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
