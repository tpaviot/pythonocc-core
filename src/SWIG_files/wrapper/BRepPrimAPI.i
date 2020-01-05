/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

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
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "* Make a box with a corner at 0,0,0 and the other dx,dy,dz
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:rtype: None") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox (const Standard_Real dx,const Standard_Real dy,const Standard_Real dz);

		/****************** BRepPrimAPI_MakeBox ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "* Make a box with a corner at P and size dx, dy, dz.
	:param P:
	:type P: gp_Pnt
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:rtype: None") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox (const gp_Pnt & P,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz);

		/****************** BRepPrimAPI_MakeBox ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "* Make a box with corners P1,P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** BRepPrimAPI_MakeBox ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "* Ax2 is the left corner and the axis. Constructs a box such that its sides are parallel to the axes of - the global coordinate system, or - the local coordinate system Axis. and - with a corner at (0, 0, 0) and of size (dx, dy, dz), or - with a corner at point P and of size (dx, dy, dz), or - with corners at points P1 and P2. Exceptions Standard_DomainError if: dx, dy, dz are less than or equal to Precision::Confusion(), or - the vector joining the points P1 and P2 has a component projected onto the global coordinate system less than or equal to Precision::Confusion(). In these cases, the box would be flat.
	:param Axes:
	:type Axes: gp_Ax2
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:rtype: None") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox (const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz);

		/****************** BackFace ******************/
		%feature("compactdefaultargs") BackFace;
		%feature("autodoc", "* Returns XMin face
	:rtype: TopoDS_Face") BackFace;
		const TopoDS_Face  BackFace ();

		/****************** BottomFace ******************/
		%feature("compactdefaultargs") BottomFace;
		%feature("autodoc", "* Returns ZMin face
	:rtype: TopoDS_Face") BottomFace;
		const TopoDS_Face  BottomFace ();

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Stores the solid in myShape.
	:rtype: void") Build;
		virtual void Build ();

		/****************** FrontFace ******************/
		%feature("compactdefaultargs") FrontFace;
		%feature("autodoc", "* Returns XMax face
	:rtype: TopoDS_Face") FrontFace;
		const TopoDS_Face  FrontFace ();

		/****************** LeftFace ******************/
		%feature("compactdefaultargs") LeftFace;
		%feature("autodoc", "* Returns YMin face
	:rtype: TopoDS_Face") LeftFace;
		const TopoDS_Face  LeftFace ();

		/****************** RightFace ******************/
		%feature("compactdefaultargs") RightFace;
		%feature("autodoc", "* Returns YMax face
	:rtype: TopoDS_Face") RightFace;
		const TopoDS_Face  RightFace ();

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "* Returns the constructed box as a shell.
	:rtype: TopoDS_Shell") Shell;
		const TopoDS_Shell  Shell ();

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "* Returns the constructed box as a solid.
	:rtype: TopoDS_Solid") Solid;
		const TopoDS_Solid  Solid ();

		/****************** TopFace ******************/
		%feature("compactdefaultargs") TopFace;
		%feature("autodoc", "* Returns ZMax face
	:rtype: TopoDS_Face") TopFace;
		const TopoDS_Face  TopFace ();

		/****************** Wedge ******************/
		%feature("compactdefaultargs") Wedge;
		%feature("autodoc", "* Returns the internal algorithm.
	:rtype: BRepPrim_Wedge") Wedge;
		BRepPrim_Wedge & Wedge ();

		/****************** operator TopoDS_Shell ******************/
		%feature("compactdefaultargs") operator TopoDS_Shell;
		%feature("autodoc", ":rtype:") operator TopoDS_Shell;
		 operator TopoDS_Shell ();

		/****************** operator TopoDS_Solid ******************/
		%feature("compactdefaultargs") operator TopoDS_Solid;
		%feature("autodoc", ":rtype:") operator TopoDS_Solid;
		 operator TopoDS_Solid ();

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
		%feature("compactdefaultargs") BRepPrimAPI_MakeHalfSpace;
		%feature("autodoc", "* Make a HalfSpace defined with a Face and a Point.
	:param Face:
	:type Face: TopoDS_Face
	:param RefPnt:
	:type RefPnt: gp_Pnt
	:rtype: None") BRepPrimAPI_MakeHalfSpace;
		 BRepPrimAPI_MakeHalfSpace (const TopoDS_Face & Face,const gp_Pnt & RefPnt);

		/****************** BRepPrimAPI_MakeHalfSpace ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeHalfSpace;
		%feature("autodoc", "* Make a HalfSpace defined with a Shell and a Point.
	:param Shell:
	:type Shell: TopoDS_Shell
	:param RefPnt:
	:type RefPnt: gp_Pnt
	:rtype: None") BRepPrimAPI_MakeHalfSpace;
		 BRepPrimAPI_MakeHalfSpace (const TopoDS_Shell & Shell,const gp_Pnt & RefPnt);

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "* Returns the constructed half-space as a solid.
	:rtype: TopoDS_Solid") Solid;
		const TopoDS_Solid  Solid ();

		/****************** operator TopoDS_Solid ******************/
		%feature("compactdefaultargs") operator TopoDS_Solid;
		%feature("autodoc", ":rtype:") operator TopoDS_Solid;
		 operator TopoDS_Solid ();

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
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Stores the solid in myShape.
	:rtype: void") Build;
		virtual void Build ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Returns the lateral face of the rotational primitive.
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** OneAxis ******************/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "* The inherited commands should provide the algorithm. Returned as a pointer.
	:rtype: Standard_Address") OneAxis;
		virtual Standard_Address OneAxis ();

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "* Returns the constructed rotational primitive as a shell.
	:rtype: TopoDS_Shell") Shell;
		const TopoDS_Shell  Shell ();

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "* Returns the constructed rotational primitive as a solid.
	:rtype: TopoDS_Solid") Solid;
		const TopoDS_Solid  Solid ();

		/****************** operator TopoDS_Face ******************/
		%feature("compactdefaultargs") operator TopoDS_Face;
		%feature("autodoc", ":rtype:") operator TopoDS_Face;
		 operator TopoDS_Face ();

		/****************** operator TopoDS_Shell ******************/
		%feature("compactdefaultargs") operator TopoDS_Shell;
		%feature("autodoc", ":rtype:") operator TopoDS_Shell;
		 operator TopoDS_Shell ();

		/****************** operator TopoDS_Solid ******************/
		%feature("compactdefaultargs") operator TopoDS_Solid;
		%feature("autodoc", ":rtype:") operator TopoDS_Solid;
		 operator TopoDS_Solid ();

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
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the bottom of the sweep.
	:rtype: TopoDS_Shape") FirstShape;
		virtual TopoDS_Shape FirstShape ();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the top of the sweep.
	:rtype: TopoDS_Shape") LastShape;
		virtual TopoDS_Shape LastShape ();

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
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "* Make a STEP right angular wedge. (ltx >= 0)
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:param ltx:
	:type ltx: float
	:rtype: None") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge (const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real ltx);

		/****************** BRepPrimAPI_MakeWedge ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "* Make a STEP right angular wedge. (ltx >= 0)
	:param Axes:
	:type Axes: gp_Ax2
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:param ltx:
	:type ltx: float
	:rtype: None") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge (const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real ltx);

		/****************** BRepPrimAPI_MakeWedge ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "* Make a wedge. The face at dy is xmin,zmin xmax,zmax
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:param xmin:
	:type xmin: float
	:param zmin:
	:type zmin: float
	:param xmax:
	:type xmax: float
	:param zmax:
	:type zmax: float
	:rtype: None") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge (const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real xmin,const Standard_Real zmin,const Standard_Real xmax,const Standard_Real zmax);

		/****************** BRepPrimAPI_MakeWedge ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "* Make a wedge. The face at dy is xmin,zmin xmax,zmax
	:param Axes:
	:type Axes: gp_Ax2
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:param xmin:
	:type xmin: float
	:param zmin:
	:type zmin: float
	:param xmax:
	:type xmax: float
	:param zmax:
	:type zmax: float
	:rtype: None") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge (const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real xmin,const Standard_Real zmin,const Standard_Real xmax,const Standard_Real zmax);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Stores the solid in myShape.
	:rtype: void") Build;
		virtual void Build ();

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "* Returns the constructed box in the form of a shell.
	:rtype: TopoDS_Shell") Shell;
		const TopoDS_Shell  Shell ();

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "* Returns the constructed box in the form of a solid.
	:rtype: TopoDS_Solid") Solid;
		const TopoDS_Solid  Solid ();

		/****************** Wedge ******************/
		%feature("compactdefaultargs") Wedge;
		%feature("autodoc", "* Returns the internal algorithm.
	:rtype: BRepPrim_Wedge") Wedge;
		BRepPrim_Wedge & Wedge ();

		/****************** operator TopoDS_Shell ******************/
		%feature("compactdefaultargs") operator TopoDS_Shell;
		%feature("autodoc", ":rtype:") operator TopoDS_Shell;
		 operator TopoDS_Shell ();

		/****************** operator TopoDS_Solid ******************/
		%feature("compactdefaultargs") operator TopoDS_Solid;
		%feature("autodoc", ":rtype:") operator TopoDS_Solid;
		 operator TopoDS_Solid ();

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
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "* Make a cone of height H radius R1 in the plane z = 0, R2 in the plane Z = H. R1 and R2 may be null.
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param H:
	:type H: float
	:rtype: None") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone (const Standard_Real R1,const Standard_Real R2,const Standard_Real H);

		/****************** BRepPrimAPI_MakeCone ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "* Make a cone of height H radius R1 in the plane z = 0, R2 in the plane Z = H. R1 and R2 may be null. Take a section of <angle>
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param H:
	:type H: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone (const Standard_Real R1,const Standard_Real R2,const Standard_Real H,const Standard_Real angle);

		/****************** BRepPrimAPI_MakeCone ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "* Make a cone of height H radius R1 in the plane z = 0, R2 in the plane Z = H. R1 and R2 may be null.
	:param Axes:
	:type Axes: gp_Ax2
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param H:
	:type H: float
	:rtype: None") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real H);

		/****************** BRepPrimAPI_MakeCone ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "* Make a cone of height H radius R1 in the plane z = 0, R2 in the plane Z = H. R1 and R2 may be null. Take a section of <angle> Constructs a cone, or a portion of a cone, of height H, and radius R1 in the plane z = 0 and R2 in the plane z = H. The result is a sharp cone if R1 or R2 is equal to 0. The cone is constructed about the 'Z Axis' of either: - the global coordinate system, or - the local coordinate system Axes. It is limited in these coordinate systems as follows: - in the v parametric direction (the Z coordinate), by the two parameter values 0 and H, - and in the u parametric direction (defined by the angle of rotation around the Z axis), in the case of a portion of a cone, by the two parameter values 0 and angle. Angle is given in radians. The resulting shape is composed of: - a lateral conical face - two planar faces in the planes z = 0 and z = H, or only one planar face in one of these two planes if a radius value is null (in the case of a complete cone, these faces are circles), and - and in the case of a portion of a cone, two planar faces to close the shape. (either two parallelograms or two triangles, in the planes u = 0 and u = angle). Exceptions Standard_DomainError if: - H is less than or equal to Precision::Confusion(), or - the half-angle at the apex of the cone, defined by R1, R2 and H, is less than Precision::Confusion()/H, or greater than (Pi/2)-Precision::Confusion()/H.f
	:param Axes:
	:type Axes: gp_Ax2
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param H:
	:type H: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real H,const Standard_Real angle);

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "* Missing detailed docstring.
	:rtype: BRepPrim_Cone") Cone;
		BRepPrim_Cone & Cone ();

		/****************** OneAxis ******************/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "* Missing detailed docstring.
	:rtype: Standard_Address") OneAxis;
		Standard_Address OneAxis ();

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
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "* Make a cylinder of radius R and length H.
	:param R:
	:type R: float
	:param H:
	:type H: float
	:rtype: None") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder (const Standard_Real R,const Standard_Real H);

		/****************** BRepPrimAPI_MakeCylinder ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "* Make a cylinder of radius R and length H with angle H.
	:param R:
	:type R: float
	:param H:
	:type H: float
	:param Angle:
	:type Angle: float
	:rtype: None") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder (const Standard_Real R,const Standard_Real H,const Standard_Real Angle);

		/****************** BRepPrimAPI_MakeCylinder ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "* Make a cylinder of radius R and length H.
	:param Axes:
	:type Axes: gp_Ax2
	:param R:
	:type R: float
	:param H:
	:type H: float
	:rtype: None") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder (const gp_Ax2 & Axes,const Standard_Real R,const Standard_Real H);

		/****************** BRepPrimAPI_MakeCylinder ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "* Make a cylinder of radius R and length H with angle H. Constructs - a cylinder of radius R and height H, or - a portion of cylinder of radius R and height H, and of the angle Angle defining the missing portion of the cylinder. The cylinder is constructed about the 'Z Axis' of either: - the global coordinate system, or - the local coordinate system Axes. It is limited in this coordinate system as follows: - in the v parametric direction (the Z axis), by the two parameter values 0 and H, - and in the u parametric direction (the rotation angle around the Z Axis), in the case of a portion of a cylinder, by the two parameter values 0 and Angle. Angle is given in radians. The resulting shape is composed of: - a lateral cylindrical face, - two planar faces in the planes z = 0 and z = H (in the case of a complete cylinder, these faces are circles), and - in case of a portion of a cylinder, two additional planar faces to close the shape.(two rectangles in the planes u = 0 and u = Angle). Exceptions Standard_DomainError if: - R is less than or equal to Precision::Confusion(), or - H is less than or equal to Precision::Confusion().
	:param Axes:
	:type Axes: gp_Ax2
	:param R:
	:type R: float
	:param H:
	:type H: float
	:param Angle:
	:type Angle: float
	:rtype: None") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder (const gp_Ax2 & Axes,const Standard_Real R,const Standard_Real H,const Standard_Real Angle);

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "* Missing detailed docstring.
	:rtype: BRepPrim_Cylinder") Cylinder;
		BRepPrim_Cylinder & Cylinder ();

		/****************** OneAxis ******************/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "* Missing detailed docstring.
	:rtype: Standard_Address") OneAxis;
		Standard_Address OneAxis ();

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
		%feature("compactdefaultargs") BRepPrimAPI_MakePrism;
		%feature("autodoc", "* Builds the prism of base S and vector V. If C is true, S is copied. If Canonize is true then generated surfaces are attempted to be canonized in simple types
	:param S:
	:type S: TopoDS_Shape
	:param V:
	:type V: gp_Vec
	:param Copy: default value is Standard_False
	:type Copy: bool
	:param Canonize: default value is Standard_True
	:type Canonize: bool
	:rtype: None") BRepPrimAPI_MakePrism;
		 BRepPrimAPI_MakePrism (const TopoDS_Shape & S,const gp_Vec & V,const Standard_Boolean Copy = Standard_False,const Standard_Boolean Canonize = Standard_True);

		/****************** BRepPrimAPI_MakePrism ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakePrism;
		%feature("autodoc", "* Builds a semi-infinite or an infinite prism of base S. If Inf is true the prism is infinite, if Inf is false the prism is semi-infinite (in the direction D). If C is true S is copied (for semi-infinite prisms). If Canonize is true then generated surfaces are attempted to be canonized in simple types
	:param S:
	:type S: TopoDS_Shape
	:param D:
	:type D: gp_Dir
	:param Inf: default value is Standard_True
	:type Inf: bool
	:param Copy: default value is Standard_False
	:type Copy: bool
	:param Canonize: default value is Standard_True
	:type Canonize: bool
	:rtype: None") BRepPrimAPI_MakePrism;
		 BRepPrimAPI_MakePrism (const TopoDS_Shape & S,const gp_Dir & D,const Standard_Boolean Inf = Standard_True,const Standard_Boolean Copy = Standard_False,const Standard_Boolean Canonize = Standard_True);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds the resulting shape (redefined from MakeShape).
	:rtype: void") Build;
		virtual void Build ();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the bottom of the prism.
	:rtype: TopoDS_Shape") FirstShape;
		TopoDS_Shape FirstShape ();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the bottom of the prism. generated with theShape (subShape of the generating shape).
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: TopoDS_Shape") FirstShape;
		TopoDS_Shape FirstShape (const TopoDS_Shape & theShape);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns ListOfShape from TopTools.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "* Returns true if the shape S has been deleted.
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the top of the prism. In the case of a finite prism, FirstShape returns the basis of the prism, in other words, S if Copy is false; otherwise, the copy of S belonging to the prism. LastShape returns the copy of S translated by V at the time of construction.
	:rtype: TopoDS_Shape") LastShape;
		TopoDS_Shape LastShape ();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the top of the prism. generated with theShape (subShape of the generating shape).
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: TopoDS_Shape") LastShape;
		TopoDS_Shape LastShape (const TopoDS_Shape & theShape);

		/****************** Prism ******************/
		%feature("compactdefaultargs") Prism;
		%feature("autodoc", "* Returns the internal sweeping algorithm.
	:rtype: BRepSweep_Prism") Prism;
		const BRepSweep_Prism & Prism ();

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
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevol;
		%feature("autodoc", "* Builds the Revol of base S, axis A and angle D. If C is true, S is copied.
	:param S:
	:type S: TopoDS_Shape
	:param A:
	:type A: gp_Ax1
	:param D:
	:type D: float
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None") BRepPrimAPI_MakeRevol;
		 BRepPrimAPI_MakeRevol (const TopoDS_Shape & S,const gp_Ax1 & A,const Standard_Real D,const Standard_Boolean Copy = Standard_False);

		/****************** BRepPrimAPI_MakeRevol ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevol;
		%feature("autodoc", "* Builds the Revol of base S, axis A and angle 2*Pi. If C is true, S is copied.
	:param S:
	:type S: TopoDS_Shape
	:param A:
	:type A: gp_Ax1
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None") BRepPrimAPI_MakeRevol;
		 BRepPrimAPI_MakeRevol (const TopoDS_Shape & S,const gp_Ax1 & A,const Standard_Boolean Copy = Standard_False);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds the resulting shape (redefined from MakeShape).
	:rtype: void") Build;
		virtual void Build ();

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "* Returns the list of degenerated edges
	:rtype: TopTools_ListOfShape") Degenerated;
		const TopTools_ListOfShape & Degenerated ();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "* Returns the first shape of the revol (coinciding with the generating shape).
	:rtype: TopoDS_Shape") FirstShape;
		TopoDS_Shape FirstShape ();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the beginning of the revolution, generated with theShape (subShape of the generating shape).
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: TopoDS_Shape") FirstShape;
		TopoDS_Shape FirstShape (const TopoDS_Shape & theShape);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns list of shape generated from shape S Warning: shape S must be shape of type VERTEX, EDGE, FACE, SOLID. For shapes of other types method always returns empty list
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);

		/****************** HasDegenerated ******************/
		%feature("compactdefaultargs") HasDegenerated;
		%feature("autodoc", "* Check if there are degenerated edges in the result.
	:rtype: bool") HasDegenerated;
		Standard_Boolean HasDegenerated ();

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "* Returns true if the shape S has been deleted.
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the end of the revol.
	:rtype: TopoDS_Shape") LastShape;
		TopoDS_Shape LastShape ();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the end of the revolution, generated with theShape (subShape of the generating shape).
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: TopoDS_Shape") LastShape;
		TopoDS_Shape LastShape (const TopoDS_Shape & theShape);

		/****************** Revol ******************/
		%feature("compactdefaultargs") Revol;
		%feature("autodoc", "* Returns the internal sweeping algorithm.
	:rtype: BRepSweep_Revol") Revol;
		const BRepSweep_Revol & Revol ();

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
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "* Make a revolution body by rotating a curve around Z.
	:param Meridian:
	:type Meridian: Geom_Curve
	:rtype: None") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const opencascade::handle<Geom_Curve> & Meridian);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "* Make a revolution body by rotating a curve around Z.
	:param Meridian:
	:type Meridian: Geom_Curve
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const opencascade::handle<Geom_Curve> & Meridian,const Standard_Real angle);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "* Make a revolution body by rotating a curve around Z.
	:param Meridian:
	:type Meridian: Geom_Curve
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const opencascade::handle<Geom_Curve> & Meridian,const Standard_Real VMin,const Standard_Real VMax);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "* Make a revolution body by rotating a curve around Z.
	:param Meridian:
	:type Meridian: Geom_Curve
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const opencascade::handle<Geom_Curve> & Meridian,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real angle);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "* Make a revolution body by rotating a curve around Z.
	:param Axes:
	:type Axes: gp_Ax2
	:param Meridian:
	:type Meridian: Geom_Curve
	:rtype: None") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const gp_Ax2 & Axes,const opencascade::handle<Geom_Curve> & Meridian);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "* Make a revolution body by rotating a curve around Z.
	:param Axes:
	:type Axes: gp_Ax2
	:param Meridian:
	:type Meridian: Geom_Curve
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const gp_Ax2 & Axes,const opencascade::handle<Geom_Curve> & Meridian,const Standard_Real angle);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "* Make a revolution body by rotating a curve around Z.
	:param Axes:
	:type Axes: gp_Ax2
	:param Meridian:
	:type Meridian: Geom_Curve
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const gp_Ax2 & Axes,const opencascade::handle<Geom_Curve> & Meridian,const Standard_Real VMin,const Standard_Real VMax);

		/****************** BRepPrimAPI_MakeRevolution ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "* Make a revolution body by rotating a curve around Z. For all algorithms the resulting shape is composed of - a lateral revolved face, - two planar faces in planes parallel to the plane z = 0, and passing by the extremities of the revolved portion of Meridian, if these points are not on the Z axis (in case of a complete revolved shape, these faces are circles), - and in the case of a portion of a revolved shape, two planar faces to close the shape (in the planes u = 0 and u = angle).
	:param Axes:
	:type Axes: gp_Ax2
	:param Meridian:
	:type Meridian: Geom_Curve
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const gp_Ax2 & Axes,const opencascade::handle<Geom_Curve> & Meridian,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real angle);

		/****************** OneAxis ******************/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "* Missing detailed docstring.
	:rtype: Standard_Address") OneAxis;
		Standard_Address OneAxis ();

		/****************** Revolution ******************/
		%feature("compactdefaultargs") Revolution;
		%feature("autodoc", "* Missing detailed docstring.
	:rtype: BRepPrim_Revolution") Revolution;
		BRepPrim_Revolution & Revolution ();

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
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param R:
	:type R: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const Standard_Real R);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param R:
	:type R: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const Standard_Real R,const Standard_Real angle);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param R:
	:type R: float
	:param angle1:
	:type angle1: float
	:param angle2:
	:type angle2: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param R:
	:type R: float
	:param angle1:
	:type angle1: float
	:param angle2:
	:type angle2: float
	:param angle3:
	:type angle3: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle3);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param Center:
	:type Center: gp_Pnt
	:param R:
	:type R: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Pnt & Center,const Standard_Real R);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param Center:
	:type Center: gp_Pnt
	:param R:
	:type R: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Pnt & Center,const Standard_Real R,const Standard_Real angle);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param Center:
	:type Center: gp_Pnt
	:param R:
	:type R: float
	:param angle1:
	:type angle1: float
	:param angle2:
	:type angle2: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Pnt & Center,const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param Center:
	:type Center: gp_Pnt
	:param R:
	:type R: float
	:param angle1:
	:type angle1: float
	:param angle2:
	:type angle2: float
	:param angle3:
	:type angle3: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Pnt & Center,const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle3);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param Axis:
	:type Axis: gp_Ax2
	:param R:
	:type R: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Ax2 & Axis,const Standard_Real R);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param Axis:
	:type Axis: gp_Ax2
	:param R:
	:type R: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Ax2 & Axis,const Standard_Real R,const Standard_Real angle);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R.
	:param Axis:
	:type Axis: gp_Ax2
	:param R:
	:type R: float
	:param angle1:
	:type angle1: float
	:param angle2:
	:type angle2: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Ax2 & Axis,const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2);

		/****************** BRepPrimAPI_MakeSphere ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "* Make a sphere of radius R. For all algorithms The resulting shape is composed of - a lateral spherical face, - two planar faces parallel to the plane z = 0 if the sphere is truncated in the v parametric direction, or only one planar face if angle1 is equal to -p/2 or if angle2 is equal to p/2 (these faces are circles in case of a complete truncated sphere), - and in case of a portion of sphere, two planar faces to shut the shape.(in the planes u = 0 and u = angle).
	:param Axis:
	:type Axis: gp_Ax2
	:param R:
	:type R: float
	:param angle1:
	:type angle1: float
	:param angle2:
	:type angle2: float
	:param angle3:
	:type angle3: float
	:rtype: None") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Ax2 & Axis,const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle3);

		/****************** OneAxis ******************/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "* Missing detailed docstring.
	:rtype: Standard_Address") OneAxis;
		Standard_Address OneAxis ();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "* Missing detailed docstring.
	:rtype: BRepPrim_Sphere") Sphere;
		BRepPrim_Sphere & Sphere ();

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
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "* Make a torus of radii R1 R2.
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:rtype: None") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const Standard_Real R1,const Standard_Real R2);

		/****************** BRepPrimAPI_MakeTorus ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "* Make a section of a torus of radii R1 R2.
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const Standard_Real R1,const Standard_Real R2,const Standard_Real angle);

		/****************** BRepPrimAPI_MakeTorus ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "* Make a torus of radii R2, R2 with angles on the small circle.
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param angle1:
	:type angle1: float
	:param angle2:
	:type angle2: float
	:rtype: None") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const Standard_Real R1,const Standard_Real R2,const Standard_Real angle1,const Standard_Real angle2);

		/****************** BRepPrimAPI_MakeTorus ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "* Make a torus of radii R2, R2 with angles on the small circle.
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param angle1:
	:type angle1: float
	:param angle2:
	:type angle2: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const Standard_Real R1,const Standard_Real R2,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle);

		/****************** BRepPrimAPI_MakeTorus ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "* Make a torus of radii R1 R2.
	:param Axes:
	:type Axes: gp_Ax2
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:rtype: None") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2);

		/****************** BRepPrimAPI_MakeTorus ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "* Make a section of a torus of radii R1 R2.
	:param Axes:
	:type Axes: gp_Ax2
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real angle);

		/****************** BRepPrimAPI_MakeTorus ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "* Make a torus of radii R1 R2.
	:param Axes:
	:type Axes: gp_Ax2
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param angle1:
	:type angle1: float
	:param angle2:
	:type angle2: float
	:rtype: None") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real angle1,const Standard_Real angle2);

		/****************** BRepPrimAPI_MakeTorus ******************/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "* Make a section of a torus of radii R1 R2. For all algorithms The resulting shape is composed of - a lateral toroidal face, - two conical faces (defined by the equation v = angle1 and v = angle2) if the sphere is truncated in the v parametric direction (they may be cylindrical faces in some particular conditions), and in case of a portion of torus, two planar faces to close the shape.(in the planes u = 0 and u = angle). Notes: - The u parameter corresponds to a rotation angle around the Z axis. - The circle whose radius is equal to the minor radius, located in the plane defined by the X axis and the Z axis, centered on the X axis, on its positive side, and positioned at a distance from the origin equal to the major radius, is the reference circle of the torus. The rotation around an axis parallel to the Y axis and passing through the center of the reference circle gives the v parameter on the reference circle. The X axis gives the origin of the v parameter. Near 0, as v increases, the Z coordinate decreases.
	:param Axes:
	:type Axes: gp_Ax2
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param angle1:
	:type angle1: float
	:param angle2:
	:type angle2: float
	:param angle:
	:type angle: float
	:rtype: None") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle);

		/****************** OneAxis ******************/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "* Missing detailed docstring.
	:rtype: Standard_Address") OneAxis;
		Standard_Address OneAxis ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "* Missing detailed docstring.
	:rtype: BRepPrim_Torus") Torus;
		BRepPrim_Torus & Torus ();

};


%extend BRepPrimAPI_MakeTorus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
