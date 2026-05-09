/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepprimapi.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<BRepPrimAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
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
#include<TopTools_module.hxx>
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
%import Message.i
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

/* python proxy classes for enums */
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
		/****** BRepPrimAPI_MakeBox::BRepPrimAPI_MakeBox ******/
		/****** md5 signature: f5f3e8f387458c74c4fe999afae32fbe ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox();

		/****** BRepPrimAPI_MakeBox::BRepPrimAPI_MakeBox ******/
		/****** md5 signature: 937966dd01e8a512401063931b57fdd2 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "
Parameters
----------
dx: double
dy: double
dz: double

Return
-------
None

Description
-----------
Make a box with a corner at 0,0,0 and the other dx,dy,dz.
") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox(const double dx, const double dy, const double dz);

		/****** BRepPrimAPI_MakeBox::BRepPrimAPI_MakeBox ******/
		/****** md5 signature: 6d0055549ec6dfca27251cc4df8ecc4d ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
dx: double
dy: double
dz: double

Return
-------
None

Description
-----------
Make a box with a corner at P and size dx, dy, dz.
") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox(const gp_Pnt & P, const double dx, const double dy, const double dz);

		/****** BRepPrimAPI_MakeBox::BRepPrimAPI_MakeBox ******/
		/****** md5 signature: 88341489d41b99815b177eb1d56f447c ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Make a box with corners P1,P2.
") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepPrimAPI_MakeBox::BRepPrimAPI_MakeBox ******/
		/****** md5 signature: 62d7197d5a419199c50ea45238111d09 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeBox;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
dx: double
dy: double
dz: double

Return
-------
None

Description
-----------
Make a box with Ax2 (the left corner and the axis) and size dx, dy, dz.
") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox(const gp_Ax2 & Axes, const double dx, const double dy, const double dz);

		/****** BRepPrimAPI_MakeBox::BackFace ******/
		/****** md5 signature: 3894bccb204a1cd910d97847053a371b ******/
		%feature("compactdefaultargs") BackFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns XMin face.
") BackFace;
		const TopoDS_Face BackFace();

		/****** BRepPrimAPI_MakeBox::BottomFace ******/
		/****** md5 signature: d868072c1474b9c120740f20d5db6dfe ******/
		%feature("compactdefaultargs") BottomFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns ZMin face.
") BottomFace;
		const TopoDS_Face BottomFace();

		/****** BRepPrimAPI_MakeBox::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Stores the solid in myShape.
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepPrimAPI_MakeBox::FrontFace ******/
		/****** md5 signature: dedf687aa14ee674479d6969119aae35 ******/
		%feature("compactdefaultargs") FrontFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns XMax face.
") FrontFace;
		const TopoDS_Face FrontFace();

		/****** BRepPrimAPI_MakeBox::Init ******/
		/****** md5 signature: 9d849b081ec5f6df3095088356f1bca0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theDX: double
theDY: double
theDZ: double

Return
-------
None

Description
-----------
Init a box with a corner at 0,0,0 and the other theDX, theDY, theDZ.
") Init;
		void Init(const double theDX, const double theDY, const double theDZ);

		/****** BRepPrimAPI_MakeBox::Init ******/
		/****** md5 signature: 960e712de0416b89af2b15f9b8a022e7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt
theDX: double
theDY: double
theDZ: double

Return
-------
None

Description
-----------
Init a box with a corner at thePnt and size theDX, theDY, theDZ.
") Init;
		void Init(const gp_Pnt & thePnt, const double theDX, const double theDY, const double theDZ);

		/****** BRepPrimAPI_MakeBox::Init ******/
		/****** md5 signature: dce068f12da326b3308072d0862a796d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
thePnt1: gp_Pnt
thePnt2: gp_Pnt

Return
-------
None

Description
-----------
Init a box with corners thePnt1, thePnt2.
") Init;
		void Init(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2);

		/****** BRepPrimAPI_MakeBox::Init ******/
		/****** md5 signature: a53b44d178a0b95163d710349817ee47 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theAxes: gp_Ax2
theDX: double
theDY: double
theDZ: double

Return
-------
None

Description
-----------
Init a box with Ax2 (the left corner and the theAxes) and size theDX, theDY, theDZ.
") Init;
		void Init(const gp_Ax2 & theAxes, const double theDX, const double theDY, const double theDZ);

		/****** BRepPrimAPI_MakeBox::LeftFace ******/
		/****** md5 signature: 3e2b98663df78556362c180d1b973ba2 ******/
		%feature("compactdefaultargs") LeftFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns YMin face.
") LeftFace;
		const TopoDS_Face LeftFace();

		/****** BRepPrimAPI_MakeBox::RightFace ******/
		/****** md5 signature: 1771860d6171f385bca896b0c7f1c984 ******/
		%feature("compactdefaultargs") RightFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns YMax face.
") RightFace;
		const TopoDS_Face RightFace();

		/****** BRepPrimAPI_MakeBox::Shell ******/
		/****** md5 signature: 642de93edbb586600e27d55251851e8c ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
Returns the constructed box as a shell.
") Shell;
		const TopoDS_Shell Shell();

		/****** BRepPrimAPI_MakeBox::Solid ******/
		/****** md5 signature: 2538cb0f3104aa1b86470e63b7cc116d ******/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Return
-------
TopoDS_Solid

Description
-----------
Returns the constructed box as a solid.
") Solid;
		const TopoDS_Solid Solid();

		/****** BRepPrimAPI_MakeBox::TopFace ******/
		/****** md5 signature: dd32adf6486145b103460dda0a299106 ******/
		%feature("compactdefaultargs") TopFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns ZMax face.
") TopFace;
		const TopoDS_Face TopFace();

		/****** BRepPrimAPI_MakeBox::Wedge ******/
		/****** md5 signature: 27912d8fac61b3f9abbc5a460ec7e7da ******/
		%feature("compactdefaultargs") Wedge;
		%feature("autodoc", "Return
-------
BRepPrim_Wedge

Description
-----------
Returns the internal algorithm.
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
		/****** BRepPrimAPI_MakeHalfSpace::BRepPrimAPI_MakeHalfSpace ******/
		/****** md5 signature: 717e8e66a517ef1c9915fb6c28a55e2c ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeHalfSpace;
		%feature("autodoc", "
Parameters
----------
Face: TopoDS_Face
RefPnt: gp_Pnt

Return
-------
None

Description
-----------
Make a HalfSpace defined with a Face and a Point.
") BRepPrimAPI_MakeHalfSpace;
		 BRepPrimAPI_MakeHalfSpace(const TopoDS_Face & Face, const gp_Pnt & RefPnt);

		/****** BRepPrimAPI_MakeHalfSpace::BRepPrimAPI_MakeHalfSpace ******/
		/****** md5 signature: 265e448a6d4de912d2d0571eebe3c75d ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeHalfSpace;
		%feature("autodoc", "
Parameters
----------
Shell: TopoDS_Shell
RefPnt: gp_Pnt

Return
-------
None

Description
-----------
Make a HalfSpace defined with a Shell and a Point.
") BRepPrimAPI_MakeHalfSpace;
		 BRepPrimAPI_MakeHalfSpace(const TopoDS_Shell & Shell, const gp_Pnt & RefPnt);

		/****** BRepPrimAPI_MakeHalfSpace::Solid ******/
		/****** md5 signature: 0e70c03e20bb23e014ac5417ea4abe26 ******/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Return
-------
TopoDS_Solid

Description
-----------
Returns the constructed half-space as a solid.
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
		/****** BRepPrimAPI_MakeOneAxis::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Stores the solid in myShape.
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepPrimAPI_MakeOneAxis::Face ******/
		/****** md5 signature: d92baec220de1f2e935a9694c6d65407 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the lateral face of the rotational primitive.
") Face;
		const TopoDS_Face Face();

		/****** BRepPrimAPI_MakeOneAxis::OneAxis ******/
		/****** md5 signature: 2a9d987f9bb34e6581ff5416432ff6d1 ******/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Return
-------
void *

Description
-----------
The inherited commands should provide the algorithm. Returned as a pointer.
") OneAxis;
		virtual void * OneAxis();

		/****** BRepPrimAPI_MakeOneAxis::Shell ******/
		/****** md5 signature: 642de93edbb586600e27d55251851e8c ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
Returns the constructed rotational primitive as a shell.
") Shell;
		const TopoDS_Shell Shell();

		/****** BRepPrimAPI_MakeOneAxis::Solid ******/
		/****** md5 signature: 2538cb0f3104aa1b86470e63b7cc116d ******/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Return
-------
TopoDS_Solid

Description
-----------
Returns the constructed rotational primitive as a solid.
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
		/****** BRepPrimAPI_MakeSweep::FirstShape ******/
		/****** md5 signature: e14f1c25ceb92eeb304b34212ae10e14 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the bottom of the sweep.
") FirstShape;
		virtual TopoDS_Shape FirstShape();

		/****** BRepPrimAPI_MakeSweep::LastShape ******/
		/****** md5 signature: 389108f95b0e47bf3500b60f7937bf37 ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the sweep.
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
		/****** BRepPrimAPI_MakeWedge::BRepPrimAPI_MakeWedge ******/
		/****** md5 signature: a7ae90670dbe3ca7c67b4336e52de58b ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "
Parameters
----------
dx: double
dy: double
dz: double
ltx: double

Return
-------
None

Description
-----------
Make a STEP right angular wedge. (ltx >= 0).
") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge(const double dx, const double dy, const double dz, const double ltx);

		/****** BRepPrimAPI_MakeWedge::BRepPrimAPI_MakeWedge ******/
		/****** md5 signature: ac7b618e3772b265734175d29279dd4c ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
dx: double
dy: double
dz: double
ltx: double

Return
-------
None

Description
-----------
Make a STEP right angular wedge. (ltx >= 0).
") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge(const gp_Ax2 & Axes, const double dx, const double dy, const double dz, const double ltx);

		/****** BRepPrimAPI_MakeWedge::BRepPrimAPI_MakeWedge ******/
		/****** md5 signature: 22c587e77c8e714bbbe1a5d3bc5df244 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "
Parameters
----------
dx: double
dy: double
dz: double
xmin: double
zmin: double
xmax: double
zmax: double

Return
-------
None

Description
-----------
Make a wedge. The face at dy is xmin,zmin xmax,zmax.
") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge(const double dx, const double dy, const double dz, const double xmin, const double zmin, const double xmax, const double zmax);

		/****** BRepPrimAPI_MakeWedge::BRepPrimAPI_MakeWedge ******/
		/****** md5 signature: 9fb4cc45ce09ad741de0b2b9cc34876d ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeWedge;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
dx: double
dy: double
dz: double
xmin: double
zmin: double
xmax: double
zmax: double

Return
-------
None

Description
-----------
Make a wedge. The face at dy is xmin,zmin xmax,zmax.
") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge(const gp_Ax2 & Axes, const double dx, const double dy, const double dz, const double xmin, const double zmin, const double xmax, const double zmax);

		/****** BRepPrimAPI_MakeWedge::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Stores the solid in myShape.
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepPrimAPI_MakeWedge::Shell ******/
		/****** md5 signature: 642de93edbb586600e27d55251851e8c ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
Returns the constructed box in the form of a shell.
") Shell;
		const TopoDS_Shell Shell();

		/****** BRepPrimAPI_MakeWedge::Solid ******/
		/****** md5 signature: 2538cb0f3104aa1b86470e63b7cc116d ******/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Return
-------
TopoDS_Solid

Description
-----------
Returns the constructed box in the form of a solid.
") Solid;
		const TopoDS_Solid Solid();

		/****** BRepPrimAPI_MakeWedge::Wedge ******/
		/****** md5 signature: 27912d8fac61b3f9abbc5a460ec7e7da ******/
		%feature("compactdefaultargs") Wedge;
		%feature("autodoc", "Return
-------
BRepPrim_Wedge

Description
-----------
Returns the internal algorithm.
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
		/****** BRepPrimAPI_MakeCone::BRepPrimAPI_MakeCone ******/
		/****** md5 signature: cc4ca43715353f182d3fdacb70cba71b ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "
Parameters
----------
R1: double
R2: double
H: double

Return
-------
None

Description
-----------
Make a cone. 
Input parameter: R1 cone bottom radius, may be null (z = 0) 
Input parameter: R2 cone top radius, may be null (z = H) 
Input parameter: H cone height.
") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone(const double R1, const double R2, const double H);

		/****** BRepPrimAPI_MakeCone::BRepPrimAPI_MakeCone ******/
		/****** md5 signature: 11a558df17048ee7e1248c58d9891653 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "
Parameters
----------
R1: double
R2: double
H: double
angle: double

Return
-------
None

Description
-----------
Make a cone. 
Input parameter: R1 cone bottom radius, may be null (z = 0) 
Input parameter: R2 cone top radius, may be null (z = H) 
Input parameter: H cone height 
Input parameter: angle angle to create a part cone.
") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone(const double R1, const double R2, const double H, const double angle);

		/****** BRepPrimAPI_MakeCone::BRepPrimAPI_MakeCone ******/
		/****** md5 signature: b41cc3e0bf64551b5f682c871a01e4aa ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
R1: double
R2: double
H: double

Return
-------
None

Description
-----------
Make a cone. 
Input parameter: axes coordinate system for the construction of the cone 
Input parameter: R1 cone bottom radius, may be null (z = 0) 
Input parameter: R2 cone top radius, may be null (z = H) 
Input parameter: H cone height.
") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone(const gp_Ax2 & Axes, const double R1, const double R2, const double H);

		/****** BRepPrimAPI_MakeCone::BRepPrimAPI_MakeCone ******/
		/****** md5 signature: e805c104a712ace58635b3a3c1dbcf1d ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCone;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
R1: double
R2: double
H: double
angle: double

Return
-------
None

Description
-----------
Make a cone of height H radius R1 in the plane z = 0, R2 in the plane Z = H. R1 and R2 may be null. Take a section of <angle> Constructs a cone, or a portion of a cone, of height H, and radius R1 in the plane z = 0 and R2 in the plane z = H. The result is a sharp cone if R1 or R2 is equal to 0. The cone is constructed about the 'Z Axis' of either: - the global coordinate system, or - the local coordinate system Axes. It is limited in these coordinate systems as follows: - in the v parametric direction (the Z coordinate), by the two parameter values 0 and H, - and in the u parametric direction (defined by the angle of rotation around the Z axis), in the case of a portion of a cone, by the two parameter values 0 and angle. Angle is given in radians. The resulting shape is composed of: - a lateral conical face - two planar faces in the planes z = 0 and z = H, or only one planar face in one of these two planes if a radius value is null (in the case of a complete cone, these faces are circles), and - and in the case of a portion of a cone, two planar faces to close the shape. (either two parallelograms or two triangles, in the planes u = 0 and u = angle). Exceptions Standard_DomainError if: - H is less than or equal to Precision::Confusion(), or - the half-angle at the apex of the cone, defined by R1, R2 and H, is less than Precision::Confusion()/H, or greater than (Pi/2)-Precision::Confusion()/H.f.
") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone(const gp_Ax2 & Axes, const double R1, const double R2, const double H, const double angle);

		/****** BRepPrimAPI_MakeCone::Cone ******/
		/****** md5 signature: 546b626030aea6b11418d33ecb7d5201 ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
BRepPrim_Cone

Description
-----------
Returns the algorithm.
") Cone;
		BRepPrim_Cone & Cone();

		/****** BRepPrimAPI_MakeCone::OneAxis ******/
		/****** md5 signature: 5d07c962eee6e8e164df8c81d964ebb0 ******/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Return
-------
void *

Description
-----------
Returns the algorithm.
") OneAxis;
		void * OneAxis();

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
		/****** BRepPrimAPI_MakeCylinder::BRepPrimAPI_MakeCylinder ******/
		/****** md5 signature: c1ce14580d83df4dbaea2c82f4fc525c ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
R: double
H: double

Return
-------
None

Description
-----------
Make a cylinder. 
Input parameter: R cylinder radius 
Input parameter: H cylinder height.
") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder(const double R, const double H);

		/****** BRepPrimAPI_MakeCylinder::BRepPrimAPI_MakeCylinder ******/
		/****** md5 signature: 507701dd2cd3cbe81baa2e6a112d6643 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
R: double
H: double
Angle: double

Return
-------
None

Description
-----------
Make a cylinder (part cylinder). 
Input parameter: R cylinder radius 
Input parameter: H cylinder height 
Input parameter: Angle defines the missing portion of the cylinder.
") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder(const double R, const double H, const double Angle);

		/****** BRepPrimAPI_MakeCylinder::BRepPrimAPI_MakeCylinder ******/
		/****** md5 signature: 9181dbcab44a492d1c7ce5ee976d52a3 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
R: double
H: double

Return
-------
None

Description
-----------
Make a cylinder of radius R and length H. 
Input parameter: Axes coordinate system for the construction of the cylinder 
Input parameter: R cylinder radius 
Input parameter: H cylinder height.
") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder(const gp_Ax2 & Axes, const double R, const double H);

		/****** BRepPrimAPI_MakeCylinder::BRepPrimAPI_MakeCylinder ******/
		/****** md5 signature: a401ead28f687f32f2532c0f216bb7ea ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
R: double
H: double
Angle: double

Return
-------
None

Description
-----------
Make a cylinder of radius R and length H with angle H. Constructs - a cylinder of radius R and height H, or - a portion of cylinder of radius R and height H, and of the angle Angle defining the missing portion of the cylinder. The cylinder is constructed about the 'Z Axis' of either: - the global coordinate system, or - the local coordinate system Axes. It is limited in this coordinate system as follows: - in the v parametric direction (the Z axis), by the two parameter values 0 and H, - and in the u parametric direction (the rotation angle around the Z Axis), in the case of a portion of a cylinder, by the two parameter values 0 and Angle. Angle is given in radians. The resulting shape is composed of: - a lateral cylindrical face, - two planar faces in the planes z = 0 and z = H (in the case of a complete cylinder, these faces are circles), and - in case of a portion of a cylinder, two additional planar faces to close the shape.(two rectangles in the planes u = 0 and u = Angle). Exceptions Standard_DomainError if: - R is less than or equal to Precision::Confusion(), or - H is less than or equal to Precision::Confusion().
") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder(const gp_Ax2 & Axes, const double R, const double H, const double Angle);

		/****** BRepPrimAPI_MakeCylinder::Cylinder ******/
		/****** md5 signature: 066e4a931618d7beab7894f68725e17d ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
BRepPrim_Cylinder

Description
-----------
Returns the algorithm.
") Cylinder;
		BRepPrim_Cylinder & Cylinder();

		/****** BRepPrimAPI_MakeCylinder::OneAxis ******/
		/****** md5 signature: 5d07c962eee6e8e164df8c81d964ebb0 ******/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Return
-------
void *

Description
-----------
Returns the algorithm.
") OneAxis;
		void * OneAxis();

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
		/****** BRepPrimAPI_MakePrism::BRepPrimAPI_MakePrism ******/
		/****** md5 signature: b131f9a2282d2f6effb54d25df28e2b0 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakePrism;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
V: gp_Vec
Copy: bool (optional, default to false)
Canonize: bool (optional, default to true)

Return
-------
None

Description
-----------
Builds the prism of base S and vector V. If C is true, S is copied. If Canonize is true then generated surfaces are attempted to be canonized in simple types.
") BRepPrimAPI_MakePrism;
		 BRepPrimAPI_MakePrism(const TopoDS_Shape & S, const gp_Vec & V, const bool Copy = false, const bool Canonize = true);

		/****** BRepPrimAPI_MakePrism::BRepPrimAPI_MakePrism ******/
		/****** md5 signature: 27c904e3150f4257a0e6bcf7e8fd65b3 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakePrism;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
D: gp_Dir
Inf: bool (optional, default to true)
Copy: bool (optional, default to false)
Canonize: bool (optional, default to true)

Return
-------
None

Description
-----------
Builds a semi-infinite or an infinite prism of base S. If Inf is true the prism is infinite, if Inf is false the prism is semi-infinite (in the direction D). If C is true S is copied (for semi-infinite prisms). If Canonize is true then generated surfaces are attempted to be canonized in simple types.
") BRepPrimAPI_MakePrism;
		 BRepPrimAPI_MakePrism(const TopoDS_Shape & S, const gp_Dir & D, const bool Inf = true, const bool Copy = false, const bool Canonize = true);

		/****** BRepPrimAPI_MakePrism::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the resulting shape (redefined from MakeShape).
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepPrimAPI_MakePrism::FirstShape ******/
		/****** md5 signature: cdf66e19ba39bdf16401bc58aff5897f ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the bottom of the prism.
") FirstShape;
		TopoDS_Shape FirstShape();

		/****** BRepPrimAPI_MakePrism::FirstShape ******/
		/****** md5 signature: d4834c8a673a1c89988c330c2f3987cf ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the bottom of the prism. generated with theShape (subShape of the generating shape).
") FirstShape;
		TopoDS_Shape FirstShape(const TopoDS_Shape & theShape);

		/****** BRepPrimAPI_MakePrism::Generated ******/
		/****** md5 signature: afef05048bf0a3f20f9295499d9e5555 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns ListOfShape from TopTools.
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepPrimAPI_MakePrism::IsDeleted ******/
		/****** md5 signature: bccb9782bf72a0b11faae5cda38123ec ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the shape S has been deleted.
") IsDeleted;
		bool IsDeleted(const TopoDS_Shape & S);

		/****** BRepPrimAPI_MakePrism::LastShape ******/
		/****** md5 signature: 07b730c910b364659accaaae17aee8e5 ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the prism. In the case of a finite prism, FirstShape returns the basis of the prism, in other words, S if Copy is false; otherwise, the copy of S belonging to the prism. LastShape returns the copy of S translated by V at the time of construction.
") LastShape;
		TopoDS_Shape LastShape();

		/****** BRepPrimAPI_MakePrism::LastShape ******/
		/****** md5 signature: 3e6d04f0762aab5c300642efe6a9f415 ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the prism. generated with theShape (subShape of the generating shape).
") LastShape;
		TopoDS_Shape LastShape(const TopoDS_Shape & theShape);

		/****** BRepPrimAPI_MakePrism::Prism ******/
		/****** md5 signature: 4299163a83304e02517765adca48c409 ******/
		%feature("compactdefaultargs") Prism;
		%feature("autodoc", "Return
-------
BRepSweep_Prism

Description
-----------
Returns the internal sweeping algorithm.
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
		/****** BRepPrimAPI_MakeRevol::BRepPrimAPI_MakeRevol ******/
		/****** md5 signature: dd0e9dec46a2e962dc52f9669f476acd ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevol;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
A: gp_Ax1
D: double
Copy: bool (optional, default to false)

Return
-------
None

Description
-----------
Builds the Revol of base S, axis A and angle D. If C is true, S is copied.
") BRepPrimAPI_MakeRevol;
		 BRepPrimAPI_MakeRevol(const TopoDS_Shape & S, const gp_Ax1 & A, const double D, const bool Copy = false);

		/****** BRepPrimAPI_MakeRevol::BRepPrimAPI_MakeRevol ******/
		/****** md5 signature: 778839c66a2de77a684817ec1520495e ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevol;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
A: gp_Ax1
Copy: bool (optional, default to false)

Return
-------
None

Description
-----------
Builds the Revol of base S, axis A and angle 2*Pi. If C is true, S is copied.
") BRepPrimAPI_MakeRevol;
		 BRepPrimAPI_MakeRevol(const TopoDS_Shape & S, const gp_Ax1 & A, const bool Copy = false);

		/****** BRepPrimAPI_MakeRevol::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the resulting shape (redefined from MakeShape).
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepPrimAPI_MakeRevol::Degenerated ******/
		/****** md5 signature: 5a6ca09f6a1bae598183796d234dad3c ******/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of degenerated edges.
") Degenerated;
		const TopTools_ListOfShape & Degenerated();

		/****** BRepPrimAPI_MakeRevol::FirstShape ******/
		/****** md5 signature: cdf66e19ba39bdf16401bc58aff5897f ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the first shape of the revol (coinciding with the generating shape).
") FirstShape;
		TopoDS_Shape FirstShape();

		/****** BRepPrimAPI_MakeRevol::FirstShape ******/
		/****** md5 signature: d4834c8a673a1c89988c330c2f3987cf ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the beginning of the revolution, generated with theShape (subShape of the generating shape).
") FirstShape;
		TopoDS_Shape FirstShape(const TopoDS_Shape & theShape);

		/****** BRepPrimAPI_MakeRevol::Generated ******/
		/****** md5 signature: afef05048bf0a3f20f9295499d9e5555 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns list of shape generated from shape S Warning: shape S must be shape of type VERTEX, EDGE, FACE, SOLID. For shapes of other types method always returns empty list.
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepPrimAPI_MakeRevol::HasDegenerated ******/
		/****** md5 signature: 4ae6ec529854fbe7a4b05acee4716b30 ******/
		%feature("compactdefaultargs") HasDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check if there are degenerated edges in the result.
") HasDegenerated;
		bool HasDegenerated();

		/****** BRepPrimAPI_MakeRevol::IsDeleted ******/
		/****** md5 signature: bccb9782bf72a0b11faae5cda38123ec ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the shape S has been deleted.
") IsDeleted;
		bool IsDeleted(const TopoDS_Shape & S);

		/****** BRepPrimAPI_MakeRevol::LastShape ******/
		/****** md5 signature: 07b730c910b364659accaaae17aee8e5 ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the end of the revol.
") LastShape;
		TopoDS_Shape LastShape();

		/****** BRepPrimAPI_MakeRevol::LastShape ******/
		/****** md5 signature: 3e6d04f0762aab5c300642efe6a9f415 ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the end of the revolution, generated with theShape (subShape of the generating shape).
") LastShape;
		TopoDS_Shape LastShape(const TopoDS_Shape & theShape);

		/****** BRepPrimAPI_MakeRevol::Revol ******/
		/****** md5 signature: ee6c1e3b25f5684921520da6a7d86148 ******/
		%feature("compactdefaultargs") Revol;
		%feature("autodoc", "Return
-------
BRepSweep_Revol

Description
-----------
Returns the internal sweeping algorithm.
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
		/****** BRepPrimAPI_MakeRevolution::BRepPrimAPI_MakeRevolution ******/
		/****** md5 signature: 91fd62c84881e21ffc010980de26ffd8 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "
Parameters
----------
Meridian: Geom_Curve

Return
-------
None

Description
-----------
Make a revolution body by rotating a curve around Z.
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const opencascade::handle<Geom_Curve> & Meridian);

		/****** BRepPrimAPI_MakeRevolution::BRepPrimAPI_MakeRevolution ******/
		/****** md5 signature: c70efcebc652d1256d21317de4d482c3 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "
Parameters
----------
Meridian: Geom_Curve
angle: double

Return
-------
None

Description
-----------
Make a revolution body by rotating a curve around Z.
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const opencascade::handle<Geom_Curve> & Meridian, const double angle);

		/****** BRepPrimAPI_MakeRevolution::BRepPrimAPI_MakeRevolution ******/
		/****** md5 signature: 55f0f3d0dc08e8e84ee7917e5f34dacd ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "
Parameters
----------
Meridian: Geom_Curve
VMin: double
VMax: double

Return
-------
None

Description
-----------
Make a revolution body by rotating a curve around Z.
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const opencascade::handle<Geom_Curve> & Meridian, const double VMin, const double VMax);

		/****** BRepPrimAPI_MakeRevolution::BRepPrimAPI_MakeRevolution ******/
		/****** md5 signature: 4b2266cf131ff5cf76e1da41a54cb355 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "
Parameters
----------
Meridian: Geom_Curve
VMin: double
VMax: double
angle: double

Return
-------
None

Description
-----------
Make a revolution body by rotating a curve around Z.
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const opencascade::handle<Geom_Curve> & Meridian, const double VMin, const double VMax, const double angle);

		/****** BRepPrimAPI_MakeRevolution::BRepPrimAPI_MakeRevolution ******/
		/****** md5 signature: 6a88cfda74a6ba83677b39f94d464e41 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
Meridian: Geom_Curve

Return
-------
None

Description
-----------
Make a revolution body by rotating a curve around Z.
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const gp_Ax2 & Axes, const opencascade::handle<Geom_Curve> & Meridian);

		/****** BRepPrimAPI_MakeRevolution::BRepPrimAPI_MakeRevolution ******/
		/****** md5 signature: 6e9ffa2bcc4105b3bed2cef1db0f6842 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
Meridian: Geom_Curve
angle: double

Return
-------
None

Description
-----------
Make a revolution body by rotating a curve around Z.
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const gp_Ax2 & Axes, const opencascade::handle<Geom_Curve> & Meridian, const double angle);

		/****** BRepPrimAPI_MakeRevolution::BRepPrimAPI_MakeRevolution ******/
		/****** md5 signature: f4162f32e67d196ea268a0a90a6d44a0 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
Meridian: Geom_Curve
VMin: double
VMax: double

Return
-------
None

Description
-----------
Make a revolution body by rotating a curve around Z.
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const gp_Ax2 & Axes, const opencascade::handle<Geom_Curve> & Meridian, const double VMin, const double VMax);

		/****** BRepPrimAPI_MakeRevolution::BRepPrimAPI_MakeRevolution ******/
		/****** md5 signature: b13b40fdadd4fd18640f093131778bfe ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeRevolution;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
Meridian: Geom_Curve
VMin: double
VMax: double
angle: double

Return
-------
None

Description
-----------
Make a revolution body by rotating a curve around Z. For all algorithms the resulting shape is composed of - a lateral revolved face, - two planar faces in planes parallel to the plane z = 0, and passing by the extremities of the revolved portion of Meridian, if these points are not on the Z axis (in case of a complete revolved shape, these faces are circles), - and in the case of a portion of a revolved shape, two planar faces to close the shape (in the planes u = 0 and u = angle).
") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution(const gp_Ax2 & Axes, const opencascade::handle<Geom_Curve> & Meridian, const double VMin, const double VMax, const double angle);

		/****** BRepPrimAPI_MakeRevolution::OneAxis ******/
		/****** md5 signature: 5d07c962eee6e8e164df8c81d964ebb0 ******/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Return
-------
void *

Description
-----------
Returns the algorithm.
") OneAxis;
		void * OneAxis();

		/****** BRepPrimAPI_MakeRevolution::Revolution ******/
		/****** md5 signature: 363c8f0934cae14058e70d26a327ed54 ******/
		%feature("compactdefaultargs") Revolution;
		%feature("autodoc", "Return
-------
BRepPrim_Revolution

Description
-----------
Returns the algorithm.
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
		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: 7713016595d7d7de182894ff5c6cbb12 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
R: double

Return
-------
None

Description
-----------
Make a sphere. 
Input parameter: R sphere radius.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const double R);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: 48f8fff49748a1967cc9c86f6bc14154 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
R: double
angle: double

Return
-------
None

Description
-----------
Make a sphere (spherical wedge). 
Input parameter: R sphere radius 
Input parameter: angle angle between the radii lying within the bounding semidisks.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const double R, const double angle);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: bb52c2ff08d4491e56e121b8ea1a64c8 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
R: double
angle1: double
angle2: double

Return
-------
None

Description
-----------
Make a sphere (spherical segment). 
Input parameter: R sphere radius 
Input parameter: angle1 first angle defining a spherical segment 
Input parameter: angle2 second angle defining a spherical segment.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const double R, const double angle1, const double angle2);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: 58157ee428e4c0b58cf9149e0b66b71e ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
R: double
angle1: double
angle2: double
angle3: double

Return
-------
None

Description
-----------
Make a sphere (spherical segment). 
Input parameter: R sphere radius 
Input parameter: angle1 first angle defining a spherical segment 
Input parameter: angle2 second angle defining a spherical segment 
Input parameter: angle3 angle between the radii lying within the bounding semidisks.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const double R, const double angle1, const double angle2, const double angle3);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: b0d3db42f221950b7a65247347650463 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
R: double

Return
-------
None

Description
-----------
Make a sphere. 
Input parameter: Center sphere center coordinates 
Input parameter: R sphere radius.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Pnt & Center, const double R);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: 2c54c4988a5e22fce6dc54e0aa6bc418 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
R: double
angle: double

Return
-------
None

Description
-----------
Make a sphere (spherical wedge). 
Input parameter: Center sphere center coordinates 
Input parameter: R sphere radius 
Input parameter: angle angle between the radii lying within the bounding semidisks.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Pnt & Center, const double R, const double angle);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: 2ea738d401c5be020977fea107d34f96 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
R: double
angle1: double
angle2: double

Return
-------
None

Description
-----------
Make a sphere (spherical segment). 
Input parameter: Center sphere center coordinates 
Input parameter: R sphere radius 
Input parameter: angle1 first angle defining a spherical segment 
Input parameter: angle2 second angle defining a spherical segment.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Pnt & Center, const double R, const double angle1, const double angle2);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: 3adf31699d068a3fbe043745dd849fa4 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
R: double
angle1: double
angle2: double
angle3: double

Return
-------
None

Description
-----------
Make a sphere (spherical segment). 
Input parameter: Center sphere center coordinates 
Input parameter: R sphere radius 
Input parameter: angle1 first angle defining a spherical segment 
Input parameter: angle2 second angle defining a spherical segment 
Input parameter: angle3 angle between the radii lying within the bounding semidisks.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Pnt & Center, const double R, const double angle1, const double angle2, const double angle3);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: 7ce2f667c4c400b54e7e8cf32cd01559 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax2
R: double

Return
-------
None

Description
-----------
Make a sphere. 
Input parameter: Axis coordinate system for the construction of the sphere 
Input parameter: R sphere radius.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Ax2 & Axis, const double R);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: cac613906cfa68b91a1b80e963839365 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax2
R: double
angle: double

Return
-------
None

Description
-----------
Make a sphere (spherical wedge). 
Input parameter: Axis coordinate system for the construction of the sphere 
Input parameter: R sphere radius 
Input parameter: angle angle between the radii lying within the bounding semidisks.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Ax2 & Axis, const double R, const double angle);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: 45cc67601ba3d189ed052addf2874876 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax2
R: double
angle1: double
angle2: double

Return
-------
None

Description
-----------
Make a sphere (spherical segment). 
Input parameter: Axis coordinate system for the construction of the sphere 
Input parameter: R sphere radius 
Input parameter: angle1 first angle defining a spherical segment 
Input parameter: angle2 second angle defining a spherical segment.
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Ax2 & Axis, const double R, const double angle1, const double angle2);

		/****** BRepPrimAPI_MakeSphere::BRepPrimAPI_MakeSphere ******/
		/****** md5 signature: 3b03be65397006699a3c80bbe93e74d9 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeSphere;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax2
R: double
angle1: double
angle2: double
angle3: double

Return
-------
None

Description
-----------
Make a sphere of radius R. For all algorithms The resulting shape is composed of - a lateral spherical face, - two planar faces parallel to the plane z = 0 if the sphere is truncated in the v parametric direction, or only one planar face if angle1 is equal to -p/2 or if angle2 is equal to p/2 (these faces are circles in case of a complete truncated sphere), - and in case of a portion of sphere, two planar faces to shut the shape.(in the planes u = 0 and u = angle).
") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere(const gp_Ax2 & Axis, const double R, const double angle1, const double angle2, const double angle3);

		/****** BRepPrimAPI_MakeSphere::OneAxis ******/
		/****** md5 signature: 5d07c962eee6e8e164df8c81d964ebb0 ******/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Return
-------
void *

Description
-----------
Returns the algorithm.
") OneAxis;
		void * OneAxis();

		/****** BRepPrimAPI_MakeSphere::Sphere ******/
		/****** md5 signature: 6fc1b49d1b0dedbf3c2ae88e9d6c37ca ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
BRepPrim_Sphere

Description
-----------
Returns the algorithm.
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
		/****** BRepPrimAPI_MakeTorus::BRepPrimAPI_MakeTorus ******/
		/****** md5 signature: 6e9b40f6b57a4deafb6d4d5f543a6d1c ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "
Parameters
----------
R1: double
R2: double

Return
-------
None

Description
-----------
Make a torus. 
Input parameter: R1 distance from the center of the pipe to the center of the torus 
Input parameter: R2 radius of the pipe.
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const double R1, const double R2);

		/****** BRepPrimAPI_MakeTorus::BRepPrimAPI_MakeTorus ******/
		/****** md5 signature: 1237a1c3d7c0267dfb9b6e9ea2eb2bf7 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "
Parameters
----------
R1: double
R2: double
angle: double

Return
-------
None

Description
-----------
Make a section of a torus. 
Input parameter: R1 distance from the center of the pipe to the center of the torus 
Input parameter: R2 radius of the pipe 
Input parameter: angle angle to create a torus pipe segment.
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const double R1, const double R2, const double angle);

		/****** BRepPrimAPI_MakeTorus::BRepPrimAPI_MakeTorus ******/
		/****** md5 signature: 400d1745aa1c619b23d487b35a1b620d ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "
Parameters
----------
R1: double
R2: double
angle1: double
angle2: double

Return
-------
None

Description
-----------
Make a torus with angles on the small circle. 
Input parameter: R1 distance from the center of the pipe to the center of the torus 
Input parameter: R2 radius of the pipe 
Input parameter: angle1 first angle to create a torus ring segment 
Input parameter: angle2 second angle to create a torus ring segment.
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const double R1, const double R2, const double angle1, const double angle2);

		/****** BRepPrimAPI_MakeTorus::BRepPrimAPI_MakeTorus ******/
		/****** md5 signature: 58eb6acac38c9ab22b4b2fe303a64dcb ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "
Parameters
----------
R1: double
R2: double
angle1: double
angle2: double
angle: double

Return
-------
None

Description
-----------
Make a torus with angles on the small circle. 
Input parameter: R1 distance from the center of the pipe to the center of the torus 
Input parameter: R2 radius of the pipe 
Input parameter: angle1 first angle to create a torus ring segment 
Input parameter: angle2 second angle to create a torus ring segment 
Input parameter: angle angle to create a torus pipe segment.
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const double R1, const double R2, const double angle1, const double angle2, const double angle);

		/****** BRepPrimAPI_MakeTorus::BRepPrimAPI_MakeTorus ******/
		/****** md5 signature: 1258ec9b9413d2163fdd9c1dd86ff911 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
R1: double
R2: double

Return
-------
None

Description
-----------
Make a torus. 
Input parameter: Axes coordinate system for the construction of the sphere 
Input parameter: R1 distance from the center of the pipe to the center of the torus 
Input parameter: R2 radius of the pipe.
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const gp_Ax2 & Axes, const double R1, const double R2);

		/****** BRepPrimAPI_MakeTorus::BRepPrimAPI_MakeTorus ******/
		/****** md5 signature: e6fa89ed85d6423d14de83a869551770 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
R1: double
R2: double
angle: double

Return
-------
None

Description
-----------
Make a section of a torus. 
Input parameter: Axes coordinate system for the construction of the sphere 
Input parameter: R1 distance from the center of the pipe to the center of the torus 
Input parameter: R2 radius of the pipe 
Input parameter: angle angle to create a torus pipe segment.
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const gp_Ax2 & Axes, const double R1, const double R2, const double angle);

		/****** BRepPrimAPI_MakeTorus::BRepPrimAPI_MakeTorus ******/
		/****** md5 signature: 3c9e6e982b609932e7f4659420e2064b ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
R1: double
R2: double
angle1: double
angle2: double

Return
-------
None

Description
-----------
Make a torus. 
Input parameter: Axes coordinate system for the construction of the sphere 
Input parameter: R1 distance from the center of the pipe to the center of the torus 
Input parameter: R2 radius of the pipe 
Input parameter: angle1 first angle to create a torus ring segment 
Input parameter: angle2 second angle to create a torus ring segment.
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const gp_Ax2 & Axes, const double R1, const double R2, const double angle1, const double angle2);

		/****** BRepPrimAPI_MakeTorus::BRepPrimAPI_MakeTorus ******/
		/****** md5 signature: eb568430b348521f2b379e50baa3b1c6 ******/
		%feature("compactdefaultargs") BRepPrimAPI_MakeTorus;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
R1: double
R2: double
angle1: double
angle2: double
angle: double

Return
-------
None

Description
-----------
Make a section of a torus of radii R1 R2. For all algorithms The resulting shape is composed of - a lateral toroidal face, - two conical faces (defined by the equation v = angle1 and v = angle2) if the sphere is truncated in the v parametric direction (they may be cylindrical faces in some particular conditions), and in case of a portion of torus, two planar faces to close the shape.(in the planes u = 0 and u = angle). Notes: - The u parameter corresponds to a rotation angle around the Z axis. - The circle whose radius is equal to the minor radius, located in the plane defined by the X axis and the Z axis, centered on the X axis, on its positive side, and positioned at a distance from the origin equal to the major radius, is the reference circle of the torus. The rotation around an axis parallel to the Y axis and passing through the center of the reference circle gives the v parameter on the reference circle. The X axis gives the origin of the v parameter. Near 0, as v increases, the Z coordinate increases (following the standard trigonometric convention: Z = r*sin(v)).
") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus(const gp_Ax2 & Axes, const double R1, const double R2, const double angle1, const double angle2, const double angle);

		/****** BRepPrimAPI_MakeTorus::OneAxis ******/
		/****** md5 signature: 5d07c962eee6e8e164df8c81d964ebb0 ******/
		%feature("compactdefaultargs") OneAxis;
		%feature("autodoc", "Return
-------
void *

Description
-----------
Returns the algorithm.
") OneAxis;
		void * OneAxis();

		/****** BRepPrimAPI_MakeTorus::Torus ******/
		/****** md5 signature: fc0c24da1353d28a38727c5a9e0d1470 ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
BRepPrim_Torus

Description
-----------
Returns the algorithm.
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
/* class aliases */
%pythoncode {
}
