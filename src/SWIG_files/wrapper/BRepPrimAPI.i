/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPPRIMAPIDOCSTRING
"BRepPrimAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepprimapi.html"
%enddef
%module (package="OCC.Core", docstring=BREPPRIMAPIDOCSTRING) BRepPrimAPI


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<BRepPrimAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<BRepPrim_module.hxx>
#include<TopTools_module.hxx>
#include<BRepSweep_module.hxx>
#include<Geom_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2d_module.hxx>
#include<BRep_module.hxx>
#include<Message_module.hxx>
#include<BRepTools_module.hxx>
#include<Bnd_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepBuilderAPI.i
%import gp.i
%import TopoDS.i
%import BRepPrim.i
%import TopTools.i
%import BRepSweep.i
%import Geom.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class BRepPrimAPI_MakeBox *
****************************/
class BRepPrimAPI_MakeBox : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepPrimAPI_MakeBox ******************/
		/**** md5 signature: ebf0ba7393f3d2e7a68cf7a20e007a5c ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "Make a box with a corner at 0,0,0 and the other dx,dy,dz.

Parameters
----------
dx: float
dy: float
dz: float

Returns
-------
None
") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox(const Standard_Real dx, const Standard_Real dy, const Standard_Real dz);

		/****************** BRepPrimAPI_MakeBox ******************/
		/**** md5 signature: 1f47b3a80e6137f9ac76cc0962240f27 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "Make a box with a corner at p and size dx, dy, dz.

Parameters
----------
P: gp_Pnt
dx: float
dy: float
dz: float

Returns
-------
None
") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox(const gp_Pnt & P, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz);

		/****************** BRepPrimAPI_MakeBox ******************/
		/**** md5 signature: 88341489d41b99815b177eb1d56f447c ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "Make a box with corners p1,p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepPrimAPI_MakeBox ******************/
		/**** md5 signature: 196c0f2f714dc8f8c28d2f3897f11160 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "Ax2 is the left corner and the axis. constructs a box such that its sides are parallel to the axes of - the global coordinate system, or - the local coordinate system axis. and - with a corner at (0, 0, 0) and of size (dx, dy, dz), or - with a corner at point p and of size (dx, dy, dz), or - with corners at points p1 and p2. exceptions standard_domainerror if: dx, dy, dz are less than or equal to precision::confusion(), or - the vector joining the points p1 and p2 has a component projected onto the global coordinate system less than or equal to precision::confusion(). in these cases, the box would be flat.

Parameters
----------
Axes: gp_Ax2
dx: float
dy: float
dz: float

Returns
-------
None
") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox(const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz);

		/****************** BackFace ******************/
		/**** md5 signature: 3894bccb204a1cd910d97847053a371b ****/
		%feature("compactdefaultargs") BackFace;
		%feature("autodoc", "Returns xmin face.

Returns
-------
TopoDS_Face
") BackFace;
		const TopoDS_Face BackFace();

		/****************** BottomFace ******************/
		/**** md5 signature: d868072c1474b9c120740f20d5db6dfe ****/
		%feature("compactdefaultargs") BottomFace;
		%feature("autodoc", "Returns zmin face.

Returns
-------
TopoDS_Face
") BottomFace;
		const TopoDS_Face BottomFace();

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Stores the solid in myshape.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** FrontFace ******************/
		/**** md5 signature: dedf687aa14ee674479d6969119aae35 ****/
		%feature("compactdefaultargs") FrontFace;
		%feature("autodoc", "Returns xmax face.

Returns
-------
TopoDS_Face
") FrontFace;
		const TopoDS_Face FrontFace();

		/****************** LeftFace ******************/
		/**** md5 signature: 3e2b98663df78556362c180d1b973ba2 ****/
		%feature("compactdefaultargs") LeftFace;
		%feature("autodoc", "Returns ymin face.

Returns
-------
TopoDS_Face
") LeftFace;
		const TopoDS_Face LeftFace();

		/****************** RightFace ******************/
		/**** md5 signature: 1771860d6171f385bca896b0c7f1c984 ****/
		%feature("compactdefaultargs") RightFace;
		%feature("autodoc", "Returns ymax face.

Returns
-------
TopoDS_Face
") RightFace;
		const TopoDS_Face RightFace();

		/****************** Shell ******************/
		/**** md5 signature: 642de93edbb586600e27d55251851e8c ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the constructed box as a shell.

Returns
-------
TopoDS_Shell
") Shell;
		const TopoDS_Shell Shell();

		/****************** Solid ******************/
		/**** md5 signature: 2538cb0f3104aa1b86470e63b7cc116d ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Returns the constructed box as a solid.

Returns
-------
TopoDS_Solid
") Solid;
		const TopoDS_Solid Solid();

		/****************** TopFace ******************/
		/**** md5 signature: dd32adf6486145b103460dda0a299106 ****/
		%feature("compactdefaultargs") TopFace;
		%feature("autodoc", "Returns zmax face.

Returns
-------
TopoDS_Face
") TopFace;
		const TopoDS_Face TopFace();

		/****************** Wedge ******************/
		/**** md5 signature: 27912d8fac61b3f9abbc5a460ec7e7da ****/
		%feature("compactdefaultargs") Wedge;
		%feature("autodoc", "Returns the internal algorithm.

Returns
-------
BRepPrim_Wedge
") Wedge;
		BRepPrim_Wedge & Wedge();

};


%extend BRepPrimAPI_MakeBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepPrimAPI_MakeHalfSpace *
**********************************/
class BRepPrimAPI_MakeHalfSpace : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepPrimAPI_MakeHalfSpace ******************/
		/**** md5 signature: 717e8e66a517ef1c9915fb6c28a55e2c ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeHalfSpace;
		%feature("autodoc", "Make a halfspace defined with a face and a point.

Parameters
----------
Face: TopoDS_Face
RefPnt: gp_Pnt

Returns
-------
None
") BRepPrimAPI_MakeHalfSpace;
		 BRepPrimAPI_MakeHalfSpace(const TopoDS_Face & Face, const gp_Pnt & RefPnt);

		/****************** BRepPrimAPI_MakeHalfSpace ******************/
		/**** md5 signature: 265e448a6d4de912d2d0571eebe3c75d ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeHalfSpace;
		%feature("autodoc", "Make a halfspace defined with a shell and a point.

Parameters
----------
Shell: TopoDS_Shell
RefPnt: gp_Pnt

Returns
-------
None
") BRepPrimAPI_MakeHalfSpace;
		 BRepPrimAPI_MakeHalfSpace(const TopoDS_Shell & Shell, const gp_Pnt & RefPnt);

		/****************** Solid ******************/
		/**** md5 signature: 0e70c03e20bb23e014ac5417ea4abe26 ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Returns the constructed half-space as a solid.

Returns
-------
TopoDS_Solid
") Solid;
		const TopoDS_Solid Solid();

};


%extend BRepPrimAPI_MakeHalfSpace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepPrimAPI_MakeOneAxis *
********************************/
%nodefaultctor BRepPrimAPI_MakeOneAxis;
class BRepPrimAPI_MakeOneAxis : public BRepBuilderAPI_MakeShape {
	public:
		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Stores the solid in myshape.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Face ******************/
		/**** md5 signature: d92baec220de1f2e935a9694c6d65407 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the lateral face of the rotational primitive.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** OneAxis ******************/
		/**** md5 signature: cf848053b2699d381071305b7bd4fea1 ****/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "The inherited commands should provide the algorithm. returned as a pointer.

Returns
-------
Standard_Address
") OneAxis;
		virtual Standard_Address OneAxis();

		/****************** Shell ******************/
		/**** md5 signature: 642de93edbb586600e27d55251851e8c ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the constructed rotational primitive as a shell.

Returns
-------
TopoDS_Shell
") Shell;
		const TopoDS_Shell Shell();

		/****************** Solid ******************/
		/**** md5 signature: 2538cb0f3104aa1b86470e63b7cc116d ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Returns the constructed rotational primitive as a solid.

Returns
-------
TopoDS_Solid
") Solid;
		const TopoDS_Solid Solid();

};


%extend BRepPrimAPI_MakeOneAxis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepPrimAPI_MakeSweep *
******************************/
%nodefaultctor BRepPrimAPI_MakeSweep;
class BRepPrimAPI_MakeSweep : public BRepBuilderAPI_MakeShape {
	public:
		/****************** FirstShape ******************/
		/**** md5 signature: e14f1c25ceb92eeb304b34212ae10e14 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the bottom of the sweep.

Returns
-------
TopoDS_Shape
") FirstShape;
		virtual TopoDS_Shape FirstShape();

		/****************** LastShape ******************/
		/**** md5 signature: 389108f95b0e47bf3500b60f7937bf37 ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the sweep.

Returns
-------
TopoDS_Shape
") LastShape;
		virtual TopoDS_Shape LastShape();

};


%extend BRepPrimAPI_MakeSweep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepPrimAPI_MakeWedge *
******************************/
class BRepPrimAPI_MakeWedge : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepPrimAPI_MakeWedge ******************/
		/**** md5 signature: 62134625daa2054faedb1dbada11fdc5 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "Make a step right angular wedge. (ltx >= 0).

Parameters
----------
dx: float
dy: float
dz: float
ltx: float

Returns
-------
None
") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge(const Standard_Real dx, const Standard_Real dy, const Standard_Real dz, const Standard_Real ltx);

		/****************** BRepPrimAPI_MakeWedge ******************/
		/**** md5 signature: 3c744f19a998b709a424453c25a1bc33 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "Make a step right angular wedge. (ltx >= 0).

Parameters
----------
Axes: gp_Ax2
dx: float
dy: float
dz: float
ltx: float

Returns
-------
None
") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge(const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz, const Standard_Real ltx);

		/****************** BRepPrimAPI_MakeWedge ******************/
		/**** md5 signature: 5ee56d4d1522c7574826ebe7fc2414cf ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "Make a wedge. the face at dy is xmin,zmin xmax,zmax.

Parameters
----------
dx: float
dy: float
dz: float
xmin: float
zmin: float
xmax: float
zmax: float

Returns
-------
None
") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge(const Standard_Real dx, const Standard_Real dy, const Standard_Real dz, const Standard_Real xmin, const Standard_Real zmin, const Standard_Real xmax, const Standard_Real zmax);

		/****************** BRepPrimAPI_MakeWedge ******************/
		/**** md5 signature: e3dffc1a3f5cce6b73dac3d343b705b8 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "Make a wedge. the face at dy is xmin,zmin xmax,zmax.

Parameters
----------
Axes: gp_Ax2
dx: float
dy: float
dz: float
xmin: float
zmin: float
xmax: float
zmax: float

Returns
-------
None
") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge(const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz, const Standard_Real xmin, const Standard_Real zmin, const Standard_Real xmax, const Standard_Real zmax);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Stores the solid in myshape.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Shell ******************/
		/**** md5 signature: 642de93edbb586600e27d55251851e8c ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the constructed box in the form of a shell.

Returns
-------
TopoDS_Shell
") Shell;
		const TopoDS_Shell Shell();

		/****************** Solid ******************/
		/**** md5 signature: 2538cb0f3104aa1b86470e63b7cc116d ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Returns the constructed box in the form of a solid.

Returns
-------
TopoDS_Solid
") Solid;
		const TopoDS_Solid Solid();

		/****************** Wedge ******************/
		/**** md5 signature: 27912d8fac61b3f9abbc5a460ec7e7da ****/
		%feature("compactdefaultargs") Wedge;
		%feature("autodoc", "Returns the internal algorithm.

Returns
-------
BRepPrim_Wedge
") Wedge;
		BRepPrim_Wedge & Wedge();

};


%extend BRepPrimAPI_MakeWedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepPrimAPI_MakeCone *
*****************************/
class BRepPrimAPI_MakeCone : public BRepPrimAPI_MakeOneAxis {
	public:
		/****************** BRepPrimAPI_MakeCone ******************/
		/**** md5 signature: 1512719e2d7e1f0f63aff7bd1c269939 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "Make a cone of height h radius r1 in the plane z = 0, r2 in the plane z = h. r1 and r2 may be null.

Parameters
----------
R1: float
R2: float
H: float

Returns
-------
None
") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone(const Standard_Real R1, const Standard_Real R2, const Standard_Real H);

		/****************** BRepPrimAPI_MakeCone ******************/
		/**** md5 signature: 85895b74d05330efa768b9822d607e5e ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "Make a cone of height h radius r1 in the plane z = 0, r2 in the plane z = h. r1 and r2 may be null. take a section of <angle>.

Parameters
----------
R1: float
R2: float
H: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone(const Standard_Real R1, const Standard_Real R2, const Standard_Real H, const Standard_Real angle);

		/****************** BRepPrimAPI_MakeCone ******************/
		/**** md5 signature: 65a934077d02d97ddd9f6dee217c3210 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "Make a cone of height h radius r1 in the plane z = 0, r2 in the plane z = h. r1 and r2 may be null.

Parameters
----------
Axes: gp_Ax2
R1: float
R2: float
H: float

Returns
-------
None
") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone(const gp_Ax2 & Axes, const Standard_Real R1, const Standard_Real R2, const Standard_Real H);

		/****************** BRepPrimAPI_MakeCone ******************/
		/**** md5 signature: baf140ecd8ab09d6b0000ca2ee3009f9 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "Make a cone of height h radius r1 in the plane z = 0, r2 in the plane z = h. r1 and r2 may be null. take a section of <angle> constructs a cone, or a portion of a cone, of height h, and radius r1 in the plane z = 0 and r2 in the plane z = h. the result is a sharp cone if r1 or r2 is equal to 0. the cone is constructed about the 'z axis' of either: - the global coordinate system, or - the local coordinate system axes. it is limited in these coordinate systems as follows: - in the v parametric direction (the z coordinate), by the two parameter values 0 and h, - and in the u parametric direction (defined by the angle of rotation around the z axis), in the case of a portion of a cone, by the two parameter values 0 and angle. angle is given in radians. the resulting shape is composed of: - a lateral conical face - two planar faces in the planes z = 0 and z = h, or only one planar face in one of these two planes if a radius value is null (in the case of a complete cone, these faces are circles), and - and in the case of a portion of a cone, two planar faces to close the shape. (either two parallelograms or two triangles, in the planes u = 0 and u = angle). exceptions standard_domainerror if: - h is less than or equal to precision::confusion(), or - the half-angle at the apex of the cone, defined by r1, r2 and h, is less than precision::confusion()/h, or greater than (pi/2)-precision::confusion()/h.f.

Parameters
----------
Axes: gp_Ax2
R1: float
R2: float
H: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone(const gp_Ax2 & Axes, const Standard_Real R1, const Standard_Real R2, const Standard_Real H, const Standard_Real angle);

		/****************** Cone ******************/
		/**** md5 signature: 546b626030aea6b11418d33ecb7d5201 ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Returns the algorithm.

Returns
-------
BRepPrim_Cone
") Cone;
		BRepPrim_Cone & Cone();

		/****************** OneAxis ******************/
		/**** md5 signature: 28226bf151c094464d166ab28823351a ****/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Returns the algorithm.

Returns
-------
Standard_Address
") OneAxis;
		Standard_Address OneAxis();

};


%extend BRepPrimAPI_MakeCone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepPrimAPI_MakeCylinder *
*********************************/
class BRepPrimAPI_MakeCylinder : public BRepPrimAPI_MakeOneAxis {
	public:
		/****************** BRepPrimAPI_MakeCylinder ******************/
		/**** md5 signature: 122d3374d1b39c79e589ee7952e79fc5 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "Make a cylinder of radius r and length h.

Parameters
----------
R: float
H: float

Returns
-------
None
") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder(const Standard_Real R, const Standard_Real H);

		/****************** BRepPrimAPI_MakeCylinder ******************/
		/**** md5 signature: b712a40631537cc95a210a45d5a83445 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "Make a cylinder of radius r and length h with angle h.

Parameters
----------
R: float
H: float
Angle: float

Returns
-------
None
") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder(const Standard_Real R, const Standard_Real H, const Standard_Real Angle);

		/****************** BRepPrimAPI_MakeCylinder ******************/
		/**** md5 signature: af20dc797536fde28b46750b4d4c4ba7 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "Make a cylinder of radius r and length h.

Parameters
----------
Axes: gp_Ax2
R: float
H: float

Returns
-------
None
") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder(const gp_Ax2 & Axes, const Standard_Real R, const Standard_Real H);

		/****************** BRepPrimAPI_MakeCylinder ******************/
		/**** md5 signature: c4f1be4b38d4fe585057070954be80b4 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "Make a cylinder of radius r and length h with angle h. constructs - a cylinder of radius r and height h, or - a portion of cylinder of radius r and height h, and of the angle angle defining the missing portion of the cylinder. the cylinder is constructed about the 'z axis' of either: - the global coordinate system, or - the local coordinate system axes. it is limited in this coordinate system as follows: - in the v parametric direction (the z axis), by the two parameter values 0 and h, - and in the u parametric direction (the rotation angle around the z axis), in the case of a portion of a cylinder, by the two parameter values 0 and angle. angle is given in radians. the resulting shape is composed of: - a lateral cylindrical face, - two planar faces in the planes z = 0 and z = h (in the case of a complete cylinder, these faces are circles), and - in case of a portion of a cylinder, two additional planar faces to close the shape.(two rectangles in the planes u = 0 and u = angle). exceptions standard_domainerror if: - r is less than or equal to precision::confusion(), or - h is less than or equal to precision::confusion().

Parameters
----------
Axes: gp_Ax2
R: float
H: float
Angle: float

Returns
-------
None
") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder(const gp_Ax2 & Axes, const Standard_Real R, const Standard_Real H, const Standard_Real Angle);

		/****************** Cylinder ******************/
		/**** md5 signature: 066e4a931618d7beab7894f68725e17d ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Returns the algorithm.

Returns
-------
BRepPrim_Cylinder
") Cylinder;
		BRepPrim_Cylinder & Cylinder();

		/****************** OneAxis ******************/
		/**** md5 signature: 28226bf151c094464d166ab28823351a ****/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Returns the algorithm.

Returns
-------
Standard_Address
") OneAxis;
		Standard_Address OneAxis();

};


%extend BRepPrimAPI_MakeCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepPrimAPI_MakePrism *
******************************/
class BRepPrimAPI_MakePrism : public BRepPrimAPI_MakeSweep {
	public:
		/****************** BRepPrimAPI_MakePrism ******************/
		/**** md5 signature: 7b42e7538866796b05dcf459904fdaca ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakePrism;
		%feature("autodoc", "Builds the prism of base s and vector v. if c is true, s is copied. if canonize is true then generated surfaces are attempted to be canonized in simple types.

Parameters
----------
S: TopoDS_Shape
V: gp_Vec
Copy: bool,optional
	default value is Standard_False
Canonize: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepPrimAPI_MakePrism;
		 BRepPrimAPI_MakePrism(const TopoDS_Shape & S, const gp_Vec & V, const Standard_Boolean Copy = Standard_False, const Standard_Boolean Canonize = Standard_True);

		/****************** BRepPrimAPI_MakePrism ******************/
		/**** md5 signature: fc5e938e92737762a72a63b1ee614f0b ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakePrism;
		%feature("autodoc", "Builds a semi-infinite or an infinite prism of base s. if inf is true the prism is infinite, if inf is false the prism is semi-infinite (in the direction d). if c is true s is copied (for semi-infinite prisms). if canonize is true then generated surfaces are attempted to be canonized in simple types.

Parameters
----------
S: TopoDS_Shape
D: gp_Dir
Inf: bool,optional
	default value is Standard_True
Copy: bool,optional
	default value is Standard_False
Canonize: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepPrimAPI_MakePrism;
		 BRepPrimAPI_MakePrism(const TopoDS_Shape & S, const gp_Dir & D, const Standard_Boolean Inf = Standard_True, const Standard_Boolean Copy = Standard_False, const Standard_Boolean Canonize = Standard_True);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting shape (redefined from makeshape).

Returns
-------
None
") Build;
		virtual void Build();

		/****************** FirstShape ******************/
		/**** md5 signature: 58fcb2a790a0aa12dce93bc2307abc16 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the bottom of the prism.

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape();

		/****************** FirstShape ******************/
		/**** md5 signature: d4834c8a673a1c89988c330c2f3987cf ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the bottom of the prism. generated with theshape (subshape of the generating shape).

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape(const TopoDS_Shape & theShape);

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns listofshape from toptools.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** IsDeleted ******************/
		/**** md5 signature: 28be7c17a3b2776f59567554f488bbf5 ****/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns true if the shape s has been deleted.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****************** LastShape ******************/
		/**** md5 signature: 00d36051126aa083896abae0c2f17b32 ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the prism. in the case of a finite prism, firstshape returns the basis of the prism, in other words, s if copy is false; otherwise, the copy of s belonging to the prism. lastshape returns the copy of s translated by v at the time of construction.

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape();

		/****************** LastShape ******************/
		/**** md5 signature: 3e6d04f0762aab5c300642efe6a9f415 ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the prism. generated with theshape (subshape of the generating shape).

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape(const TopoDS_Shape & theShape);

		/****************** Prism ******************/
		/**** md5 signature: 4299163a83304e02517765adca48c409 ****/
		%feature("compactdefaultargs") Prism;
		%feature("autodoc", "Returns the internal sweeping algorithm.

Returns
-------
BRepSweep_Prism
") Prism;
		const BRepSweep_Prism & Prism();

};


%extend BRepPrimAPI_MakePrism {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepPrimAPI_MakeRevol *
******************************/
class BRepPrimAPI_MakeRevol : public BRepPrimAPI_MakeSweep {
	public:
		/****************** BRepPrimAPI_MakeRevol ******************/
		/**** md5 signature: 5b48cba67a0b18acf09772bfb1856392 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevol;
		%feature("autodoc", "Builds the revol of base s, axis a and angle d. if c is true, s is copied.

Parameters
----------
S: TopoDS_Shape
A: gp_Ax1
D: float
Copy: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepPrimAPI_MakeRevol;
		 BRepPrimAPI_MakeRevol(const TopoDS_Shape & S, const gp_Ax1 & A, const Standard_Real D, const Standard_Boolean Copy = Standard_False);

		/****************** BRepPrimAPI_MakeRevol ******************/
		/**** md5 signature: 1b368e550bab93d291f17aff270a831d ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevol;
		%feature("autodoc", "Builds the revol of base s, axis a and angle 2*pi. if c is true, s is copied.

Parameters
----------
S: TopoDS_Shape
A: gp_Ax1
Copy: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepPrimAPI_MakeRevol;
		 BRepPrimAPI_MakeRevol(const TopoDS_Shape & S, const gp_Ax1 & A, const Standard_Boolean Copy = Standard_False);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting shape (redefined from makeshape).

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Degenerated ******************/
		/**** md5 signature: ff38f303d61ce3594b19f818a854ffa1 ****/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "Returns the list of degenerated edges.

Returns
-------
TopTools_ListOfShape
") Degenerated;
		const TopTools_ListOfShape & Degenerated();

		/****************** FirstShape ******************/
		/**** md5 signature: 58fcb2a790a0aa12dce93bc2307abc16 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the first shape of the revol (coinciding with the generating shape).

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape();

		/****************** FirstShape ******************/
		/**** md5 signature: d4834c8a673a1c89988c330c2f3987cf ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the beginning of the revolution, generated with theshape (subshape of the generating shape).

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape(const TopoDS_Shape & theShape);

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns list of shape generated from shape s warning: shape s must be shape of type vertex, edge, face, solid. for shapes of other types method always returns empty list.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** HasDegenerated ******************/
		/**** md5 signature: 003ea366ae5e63cfa75b4a4a77915921 ****/
		%feature("compactdefaultargs") HasDegenerated;
		%feature("autodoc", "Check if there are degenerated edges in the result.

Returns
-------
bool
") HasDegenerated;
		Standard_Boolean HasDegenerated();

		/****************** IsDeleted ******************/
		/**** md5 signature: 28be7c17a3b2776f59567554f488bbf5 ****/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns true if the shape s has been deleted.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****************** LastShape ******************/
		/**** md5 signature: 00d36051126aa083896abae0c2f17b32 ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the end of the revol.

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape();

		/****************** LastShape ******************/
		/**** md5 signature: 3e6d04f0762aab5c300642efe6a9f415 ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the end of the revolution, generated with theshape (subshape of the generating shape).

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape(const TopoDS_Shape & theShape);

		/****************** Revol ******************/
		/**** md5 signature: ee6c1e3b25f5684921520da6a7d86148 ****/
		%feature("compactdefaultargs") Revol;
		%feature("autodoc", "Returns the internal sweeping algorithm.

Returns
-------
BRepSweep_Revol
") Revol;
		const BRepSweep_Revol & Revol();

};


%extend BRepPrimAPI_MakeRevol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepPrimAPI_MakeRevolution *
***********************************/
class BRepPrimAPI_MakeRevolution : public BRepPrimAPI_MakeOneAxis {
	public:
		/****************** BRepPrimAPI_MakeRevolution ******************/
		/**** md5 signature: 91fd62c84881e21ffc010980de26ffd8 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "Make a revolution body by rotating a curve around z.

Parameters
----------
Meridian: Geom_Curve

Returns
-------
None
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const opencascade::handle<Geom_Curve> & Meridian);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		/**** md5 signature: 7a70a0d027631becf26186b999272310 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "Make a revolution body by rotating a curve around z.

Parameters
----------
Meridian: Geom_Curve
angle: float

Returns
-------
None
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const opencascade::handle<Geom_Curve> & Meridian, const Standard_Real angle);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		/**** md5 signature: 955ba076b18e66c498b5ce77910b4a96 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "Make a revolution body by rotating a curve around z.

Parameters
----------
Meridian: Geom_Curve
VMin: float
VMax: float

Returns
-------
None
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const opencascade::handle<Geom_Curve> & Meridian, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		/**** md5 signature: ebdf463e24bd84a898b941ad1008bcd3 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "Make a revolution body by rotating a curve around z.

Parameters
----------
Meridian: Geom_Curve
VMin: float
VMax: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const opencascade::handle<Geom_Curve> & Meridian, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real angle);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		/**** md5 signature: 6a88cfda74a6ba83677b39f94d464e41 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "Make a revolution body by rotating a curve around z.

Parameters
----------
Axes: gp_Ax2
Meridian: Geom_Curve

Returns
-------
None
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const gp_Ax2 & Axes, const opencascade::handle<Geom_Curve> & Meridian);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		/**** md5 signature: 72cb2c3fe156cfd9207b7edfcc4615be ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "Make a revolution body by rotating a curve around z.

Parameters
----------
Axes: gp_Ax2
Meridian: Geom_Curve
angle: float

Returns
-------
None
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const gp_Ax2 & Axes, const opencascade::handle<Geom_Curve> & Meridian, const Standard_Real angle);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		/**** md5 signature: 3c8bf12156d5b013d9e02c5f4ab5a41f ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "Make a revolution body by rotating a curve around z.

Parameters
----------
Axes: gp_Ax2
Meridian: Geom_Curve
VMin: float
VMax: float

Returns
-------
None
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const gp_Ax2 & Axes, const opencascade::handle<Geom_Curve> & Meridian, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		/**** md5 signature: abdaf65b86668c5864018b07739ef042 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "Make a revolution body by rotating a curve around z. for all algorithms the resulting shape is composed of - a lateral revolved face, - two planar faces in planes parallel to the plane z = 0, and passing by the extremities of the revolved portion of meridian, if these points are not on the z axis (in case of a complete revolved shape, these faces are circles), - and in the case of a portion of a revolved shape, two planar faces to close the shape (in the planes u = 0 and u = angle).

Parameters
----------
Axes: gp_Ax2
Meridian: Geom_Curve
VMin: float
VMax: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const gp_Ax2 & Axes, const opencascade::handle<Geom_Curve> & Meridian, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real angle);

		/****************** OneAxis ******************/
		/**** md5 signature: 28226bf151c094464d166ab28823351a ****/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Returns the algorithm.

Returns
-------
Standard_Address
") OneAxis;
		Standard_Address OneAxis();

		/****************** Revolution ******************/
		/**** md5 signature: 363c8f0934cae14058e70d26a327ed54 ****/
		%feature("compactdefaultargs") Revolution;
		%feature("autodoc", "Returns the algorithm.

Returns
-------
BRepPrim_Revolution
") Revolution;
		BRepPrim_Revolution & Revolution();

};


%extend BRepPrimAPI_MakeRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepPrimAPI_MakeSphere *
*******************************/
class BRepPrimAPI_MakeSphere : public BRepPrimAPI_MakeOneAxis {
	public:
		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: d4c008b020242eeb2a1cf253e7c05dbb ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
R: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const Standard_Real R);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: 0a3f72555d6c11472942f1523e001b32 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
R: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const Standard_Real R, const Standard_Real angle);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: e211e8e1d075f75e54850166aa57aa62 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
R: float
angle1: float
angle2: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const Standard_Real R, const Standard_Real angle1, const Standard_Real angle2);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: e61fc0893a9d99a0a414e6e1a78e6be2 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
R: float
angle1: float
angle2: float
angle3: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const Standard_Real R, const Standard_Real angle1, const Standard_Real angle2, const Standard_Real angle3);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: 8a02cb080894b776cb9184f9db9e1ed9 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
Center: gp_Pnt
R: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Pnt & Center, const Standard_Real R);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: faf79684811fcbfdff68d313175a9f2d ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
Center: gp_Pnt
R: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Pnt & Center, const Standard_Real R, const Standard_Real angle);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: 9da11fccdbffbda96873289a3c23018b ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
Center: gp_Pnt
R: float
angle1: float
angle2: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Pnt & Center, const Standard_Real R, const Standard_Real angle1, const Standard_Real angle2);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: 4926f7918e6569b90190d3e88d475d75 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
Center: gp_Pnt
R: float
angle1: float
angle2: float
angle3: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Pnt & Center, const Standard_Real R, const Standard_Real angle1, const Standard_Real angle2, const Standard_Real angle3);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: f71f5dd4c2e2ceb29229f80617f7b455 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
Axis: gp_Ax2
R: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Ax2 & Axis, const Standard_Real R);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: b83fc82f55c2def18af66a201b36354c ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
Axis: gp_Ax2
R: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Ax2 & Axis, const Standard_Real R, const Standard_Real angle);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: 74ca9fb560c1485db00b034420161dab ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r.

Parameters
----------
Axis: gp_Ax2
R: float
angle1: float
angle2: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Ax2 & Axis, const Standard_Real R, const Standard_Real angle1, const Standard_Real angle2);

		/****************** BRepPrimAPI_MakeSphere ******************/
		/**** md5 signature: f2507ce44805a423ee55a5581c3d41af ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "Make a sphere of radius r. for all algorithms the resulting shape is composed of - a lateral spherical face, - two planar faces parallel to the plane z = 0 if the sphere is truncated in the v parametric direction, or only one planar face if angle1 is equal to -p/2 or if angle2 is equal to p/2 (these faces are circles in case of a complete truncated sphere), - and in case of a portion of sphere, two planar faces to shut the shape.(in the planes u = 0 and u = angle).

Parameters
----------
Axis: gp_Ax2
R: float
angle1: float
angle2: float
angle3: float

Returns
-------
None
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Ax2 & Axis, const Standard_Real R, const Standard_Real angle1, const Standard_Real angle2, const Standard_Real angle3);

		/****************** OneAxis ******************/
		/**** md5 signature: 28226bf151c094464d166ab28823351a ****/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Returns the algorithm.

Returns
-------
Standard_Address
") OneAxis;
		Standard_Address OneAxis();

		/****************** Sphere ******************/
		/**** md5 signature: 6fc1b49d1b0dedbf3c2ae88e9d6c37ca ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Returns the algorithm.

Returns
-------
BRepPrim_Sphere
") Sphere;
		BRepPrim_Sphere & Sphere();

};


%extend BRepPrimAPI_MakeSphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepPrimAPI_MakeTorus *
******************************/
class BRepPrimAPI_MakeTorus : public BRepPrimAPI_MakeOneAxis {
	public:
		/****************** BRepPrimAPI_MakeTorus ******************/
		/**** md5 signature: 79ec4e5628c83853d33b887d898e0976 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "Make a torus of radii r1 r2.

Parameters
----------
R1: float
R2: float

Returns
-------
None
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const Standard_Real R1, const Standard_Real R2);

		/****************** BRepPrimAPI_MakeTorus ******************/
		/**** md5 signature: 630b73fe6c123f9d36bd32f1beaf5fd4 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "Make a section of a torus of radii r1 r2.

Parameters
----------
R1: float
R2: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const Standard_Real R1, const Standard_Real R2, const Standard_Real angle);

		/****************** BRepPrimAPI_MakeTorus ******************/
		/**** md5 signature: 6588729b6703ecb0b0c43e81462643e0 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "Make a torus of radii r2, r2 with angles on the small circle.

Parameters
----------
R1: float
R2: float
angle1: float
angle2: float

Returns
-------
None
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const Standard_Real R1, const Standard_Real R2, const Standard_Real angle1, const Standard_Real angle2);

		/****************** BRepPrimAPI_MakeTorus ******************/
		/**** md5 signature: df71dc26e9d9eb3776b1e633078d7613 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "Make a torus of radii r2, r2 with angles on the small circle.

Parameters
----------
R1: float
R2: float
angle1: float
angle2: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const Standard_Real R1, const Standard_Real R2, const Standard_Real angle1, const Standard_Real angle2, const Standard_Real angle);

		/****************** BRepPrimAPI_MakeTorus ******************/
		/**** md5 signature: 9aa5d83cacd2a9ce2d73751141b464a4 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "Make a torus of radii r1 r2.

Parameters
----------
Axes: gp_Ax2
R1: float
R2: float

Returns
-------
None
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const gp_Ax2 & Axes, const Standard_Real R1, const Standard_Real R2);

		/****************** BRepPrimAPI_MakeTorus ******************/
		/**** md5 signature: ba7819d589c942773681bb3827926736 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "Make a section of a torus of radii r1 r2.

Parameters
----------
Axes: gp_Ax2
R1: float
R2: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const gp_Ax2 & Axes, const Standard_Real R1, const Standard_Real R2, const Standard_Real angle);

		/****************** BRepPrimAPI_MakeTorus ******************/
		/**** md5 signature: 3df636bf3f63fddf3c54f3ce2f5488f5 ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "Make a torus of radii r1 r2.

Parameters
----------
Axes: gp_Ax2
R1: float
R2: float
angle1: float
angle2: float

Returns
-------
None
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const gp_Ax2 & Axes, const Standard_Real R1, const Standard_Real R2, const Standard_Real angle1, const Standard_Real angle2);

		/****************** BRepPrimAPI_MakeTorus ******************/
		/**** md5 signature: 3625d7764b3fedc33ba70ab37375ea8b ****/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "Make a section of a torus of radii r1 r2. for all algorithms the resulting shape is composed of - a lateral toroidal face, - two conical faces (defined by the equation v = angle1 and v = angle2) if the sphere is truncated in the v parametric direction (they may be cylindrical faces in some particular conditions), and in case of a portion of torus, two planar faces to close the shape.(in the planes u = 0 and u = angle). notes: - the u parameter corresponds to a rotation angle around the z axis. - the circle whose radius is equal to the minor radius, located in the plane defined by the x axis and the z axis, centered on the x axis, on its positive side, and positioned at a distance from the origin equal to the major radius, is the reference circle of the torus. the rotation around an axis parallel to the y axis and passing through the center of the reference circle gives the v parameter on the reference circle. the x axis gives the origin of the v parameter. near 0, as v increases, the z coordinate decreases.

Parameters
----------
Axes: gp_Ax2
R1: float
R2: float
angle1: float
angle2: float
angle: float

Returns
-------
None
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const gp_Ax2 & Axes, const Standard_Real R1, const Standard_Real R2, const Standard_Real angle1, const Standard_Real angle2, const Standard_Real angle);

		/****************** OneAxis ******************/
		/**** md5 signature: 28226bf151c094464d166ab28823351a ****/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Returns the algorithm.

Returns
-------
Standard_Address
") OneAxis;
		Standard_Address OneAxis();

		/****************** Torus ******************/
		/**** md5 signature: fc0c24da1353d28a38727c5a9e0d1470 ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Returns the algorithm.

Returns
-------
BRepPrim_Torus
") Torus;
		BRepPrim_Torus & Torus();

};


%extend BRepPrimAPI_MakeTorus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
