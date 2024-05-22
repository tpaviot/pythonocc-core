/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPINTCURVESURFACEDOCSTRING
"BRepIntCurveSurface module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_brepintcurvesurface.html"
%enddef
%module (package="OCC.Core", docstring=BREPINTCURVESURFACEDOCSTRING) BRepIntCurveSurface


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


%{
#include<BRepIntCurveSurface_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<gp_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<TopAbs_module.hxx>
#include<Bnd_module.hxx>
#include<TopLoc_module.hxx>
#include<IntSurf_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import GeomAdaptor.i
%import gp.i
%import IntCurveSurface.i
%import TopAbs.i

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

/**********************************
* class BRepIntCurveSurface_Inter *
**********************************/
class BRepIntCurveSurface_Inter {
	public:
		/****************** BRepIntCurveSurface_Inter ******************/
		/**** md5 signature: b746fb1d3b88cfc1c23fbf7d63f720ba ****/
		%feature("compactdefaultargs") BRepIntCurveSurface_Inter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor;.
") BRepIntCurveSurface_Inter;
		 BRepIntCurveSurface_Inter();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the current face.
") Face;
		const TopoDS_Face Face();

		/****************** Init ******************/
		/**** md5 signature: 07985eba3bf85498690ed01b37f51fca ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theCurve: GeomAdaptor_Curve
theTol: float

Return
-------
None

Description
-----------
Load the shape, the curve and initialize the tolerance used for the classification.
") Init;
		void Init(const TopoDS_Shape & theShape, const GeomAdaptor_Curve & theCurve, const Standard_Real theTol);

		/****************** Init ******************/
		/**** md5 signature: 3b1e312f54bb7607e78407ff166c1205 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theLine: gp_Lin
theTol: float

Return
-------
None

Description
-----------
Load the shape, the curve and initialize the tolerance used for the classification.
") Init;
		void Init(const TopoDS_Shape & theShape, const gp_Lin & theLine, const Standard_Real theTol);

		/****************** Init ******************/
		/**** md5 signature: 520ca4890c4d0b4a44c85c9b44d9905c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theCurve: GeomAdaptor_Curve

Return
-------
None

Description
-----------
Method to find intersections of specified curve with loaded shape.
") Init;
		void Init(const GeomAdaptor_Curve & theCurve);

		/****************** Load ******************/
		/**** md5 signature: a747fed191518a6d90101ad47bb98e22 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theTol: float

Return
-------
None

Description
-----------
Load the shape, and initialize the tolerance used for the classification.
") Load;
		void Load(const TopoDS_Shape & theShape, const Standard_Real theTol);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a current face.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the next intersection point to check.
") Next;
		void Next();

		/****************** Pnt ******************/
		/**** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the current geometric point.
") Pnt;
		const gp_Pnt Pnt();

		/****************** Point ******************/
		/**** md5 signature: 39b389cfd53f7848e2a79affac9ccd3b ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
IntCurveSurface_IntersectionPoint

Description
-----------
Returns the current intersection point.
") Point;
		IntCurveSurface_IntersectionPoint Point();

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the current state (in or on).
") State;
		TopAbs_State State();

		/****************** Transition ******************/
		/**** md5 signature: bd528dc9c78a60a5b26409b8cf4f3afe ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
IntCurveSurface_TransitionOnCurve

Description
-----------
Returns the transition of the line on the surface (in or out or unknown).
") Transition;
		IntCurveSurface_TransitionOnCurve Transition();

		/****************** U ******************/
		/**** md5 signature: dd41b21b6ce05c48c2d8d002663816e1 ****/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the u parameter of the current point on the current face.
") U;
		Standard_Real U();

		/****************** V ******************/
		/**** md5 signature: a561db1f9ebb0e926d3862b2e88ce187 ****/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the v parameter of the current point on the current face.
") V;
		Standard_Real V();

		/****************** W ******************/
		/**** md5 signature: dde24677dd63b48ccacea2fe8006eed7 ****/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter of the current point on the curve.
") W;
		Standard_Real W();

};


%extend BRepIntCurveSurface_Inter {
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
