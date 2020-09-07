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
%define INTCURVESFACEDOCSTRING
"IntCurvesFace module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intcurvesface.html"
%enddef
%module (package="OCC.Core", docstring=INTCURVESFACEDOCSTRING) IntCurvesFace


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
#include<IntCurvesFace_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Bnd_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<TopLoc_module.hxx>
#include<IntSurf_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Bnd.i
%import gp.i
%import TopAbs.i
%import Adaptor3d.i
%import GeomAbs.i
%import IntCurveSurface.i

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

/**********************************
* class IntCurvesFace_Intersector *
**********************************/
class IntCurvesFace_Intersector {
	public:
		/****************** IntCurvesFace_Intersector ******************/
		/**** md5 signature: a52cfef3564a89d4318791e0ef2ba78a ****/
		%feature("compactdefaultargs") IntCurvesFace_Intersector;
		%feature("autodoc", "Load a face. //! the tolerance <tol> is used to determine if the first point of the segment is near the face. in that case, the parameter of the intersection point on the line can be a negative value (greater than -tol). if arestr = true uv bounding box of face is used to restrict it's underlined surface, otherwise surface is not restricted. if usebtoler = false then the 2d-point of intersection is classified with null-tolerance (relative to face); otherwise it's using maximium between input tolerance(atol) and tolerances of face bounds (edges).

Parameters
----------
F: TopoDS_Face
aTol: float
aRestr: bool,optional
	default value is Standard_True
UseBToler: bool,optional
	default value is Standard_True

Returns
-------
None
") IntCurvesFace_Intersector;
		 IntCurvesFace_Intersector(const TopoDS_Face & F, const Standard_Real aTol, const Standard_Boolean aRestr = Standard_True, const Standard_Boolean UseBToler = Standard_True);

		/****************** Bounding ******************/
		/**** md5 signature: bb711be79be8d737064764272723cdc5 ****/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") Bounding;
		Bnd_Box Bounding();

		/****************** ClassifyUVPoint ******************/
		/**** md5 signature: 6119eba3f802167f8feeb53cf4c276dd ****/
		%feature("compactdefaultargs") ClassifyUVPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
Puv: gp_Pnt2d

Returns
-------
TopAbs_State
") ClassifyUVPoint;
		TopAbs_State ClassifyUVPoint(const gp_Pnt2d & Puv);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the significant face used to determine the intersection.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** GetUseBoundToler ******************/
		/**** md5 signature: a5f9a43c7d4370e89e000b44feefda7a ****/
		%feature("compactdefaultargs") GetUseBoundToler;
		%feature("autodoc", "Returns the boundary tolerance flag.

Returns
-------
bool
") GetUseBoundToler;
		Standard_Boolean GetUseBoundToler();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True is returned when the intersection have been computed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if curve is parallel or belongs face surface this case is recognized only for some pairs of analytical curves and surfaces (plane - line, ...).

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbPnt ******************/
		/**** md5 signature: 7493472b43e2ee7c4bd85784ca2a7eb4 ****/
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPnt;
		Standard_Integer NbPnt();

		/****************** Perform ******************/
		/**** md5 signature: e18419430124de4e84da27951ae80914 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Perform the intersection between the segment l and the loaded face. //! pinf is the smallest parameter on the line psup is the highest parmaeter on the line //! for an infinite line pinf and psup can be +/- reallast.

Parameters
----------
L: gp_Lin
PInf: float
PSup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & L, const Standard_Real PInf, const Standard_Real PSup);

		/****************** Perform ******************/
		/**** md5 signature: 7d7976e9ae0d696e8958c0ec29e3f5bf ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Same method for a hcurve from adaptor3d. pinf an psup can also be - and + inf.

Parameters
----------
HCu: Adaptor3d_HCurve
PInf: float
PSup: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & HCu, const Standard_Real PInf, const Standard_Real PSup);

		/****************** Pnt ******************/
		/**** md5 signature: d0440fe82ac13d790faf173438707e9c ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns the geometric point of the ith intersection between the line and the surface.

Parameters
----------
I: int

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt(const Standard_Integer I);

		/****************** SetUseBoundToler ******************/
		/**** md5 signature: ee0ae617632796bddf249b0f86914544 ****/
		%feature("compactdefaultargs") SetUseBoundToler;
		%feature("autodoc", "Sets the boundary tolerance flag.

Parameters
----------
UseBToler: bool

Returns
-------
None
") SetUseBoundToler;
		void SetUseBoundToler(Standard_Boolean UseBToler);

		/****************** State ******************/
		/**** md5 signature: 3ef584a4c8697b5b43cfa0be6c8072f7 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns the ith state of the point on the face. the values can be either topabs_in ( the point is in the face) or topabs_on ( the point is on a boudary of the face).

Parameters
----------
I: int

Returns
-------
TopAbs_State
") State;
		TopAbs_State State(const Standard_Integer I);

		/****************** SurfaceType ******************/
		/**** md5 signature: 89d52b53be0e28e341c5b5e94282cf10 ****/
		%feature("compactdefaultargs") SurfaceType;
		%feature("autodoc", "Return the surface type.

Returns
-------
GeomAbs_SurfaceType
") SurfaceType;
		GeomAbs_SurfaceType SurfaceType();

		/****************** Transition ******************/
		/**** md5 signature: 33876f9f7fa6077fbaede5c70296e547 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Returns the ith transition of the line on the surface.

Parameters
----------
I: int

Returns
-------
IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition(const Standard_Integer I);

		/****************** UParameter ******************/
		/**** md5 signature: 4e2ab34c664fe365f73ab40bf6b7907c ****/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "Returns the u parameter of the ith intersection point on the surface.

Parameters
----------
I: int

Returns
-------
float
") UParameter;
		Standard_Real UParameter(const Standard_Integer I);

		/****************** VParameter ******************/
		/**** md5 signature: 9b61d482fd013334ec36688975ff9502 ****/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "Returns the v parameter of the ith intersection point on the surface.

Parameters
----------
I: int

Returns
-------
float
") VParameter;
		Standard_Real VParameter(const Standard_Integer I);

		/****************** WParameter ******************/
		/**** md5 signature: dc0b89e88ad9e0b7c00279c03b1e7687 ****/
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "Returns the parameter of the ith intersection point on the line.

Parameters
----------
I: int

Returns
-------
float
") WParameter;
		Standard_Real WParameter(const Standard_Integer I);

};


%extend IntCurvesFace_Intersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IntCurvesFace_ShapeIntersector *
***************************************/
class IntCurvesFace_ShapeIntersector {
	public:
		/****************** IntCurvesFace_ShapeIntersector ******************/
		/**** md5 signature: 3688732279ca6ca15731544cfc75529e ****/
		%feature("compactdefaultargs") IntCurvesFace_ShapeIntersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntCurvesFace_ShapeIntersector;
		 IntCurvesFace_ShapeIntersector();

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Face ******************/
		/**** md5 signature: d1eb857c2a65e9d3cb2fc51a7ab45063 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the significant face used to determine the intersection.

Parameters
----------
I: int

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face(const Standard_Integer I);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True is returned when the intersection have been computed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		/**** md5 signature: c9653eef18e54c8d7dd81abee6a86d25 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sh: TopoDS_Shape
Tol: float

Returns
-------
None
") Load;
		void Load(const TopoDS_Shape & Sh, const Standard_Real Tol);

		/****************** NbPnt ******************/
		/**** md5 signature: 7493472b43e2ee7c4bd85784ca2a7eb4 ****/
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPnt;
		Standard_Integer NbPnt();

		/****************** Perform ******************/
		/**** md5 signature: e18419430124de4e84da27951ae80914 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Perform the intersection between the segment l and the loaded shape. //! pinf is the smallest parameter on the line psup is the highest parammter on the line //! for an infinite line pinf and psup can be +/- reallast.

Parameters
----------
L: gp_Lin
PInf: float
PSup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & L, const Standard_Real PInf, const Standard_Real PSup);

		/****************** Perform ******************/
		/**** md5 signature: 7d7976e9ae0d696e8958c0ec29e3f5bf ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Same method for a hcurve from adaptor3d. pinf an psup can also be - and + inf.

Parameters
----------
HCu: Adaptor3d_HCurve
PInf: float
PSup: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & HCu, const Standard_Real PInf, const Standard_Real PSup);

		/****************** PerformNearest ******************/
		/**** md5 signature: ed809ea9e3a548c6cd15a623c13b9c18 ****/
		%feature("compactdefaultargs") PerformNearest;
		%feature("autodoc", "Perform the intersection between the segment l and the loaded shape. //! pinf is the smallest parameter on the line psup is the highest parammter on the line //! for an infinite line pinf and psup can be +/- reallast.

Parameters
----------
L: gp_Lin
PInf: float
PSup: float

Returns
-------
None
") PerformNearest;
		void PerformNearest(const gp_Lin & L, const Standard_Real PInf, const Standard_Real PSup);

		/****************** Pnt ******************/
		/**** md5 signature: d0440fe82ac13d790faf173438707e9c ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns the geometric point of the ith intersection between the line and the surface.

Parameters
----------
I: int

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt(const Standard_Integer I);

		/****************** SortResult ******************/
		/**** md5 signature: 710973a5fe7c429ac44b8335f6329d05 ****/
		%feature("compactdefaultargs") SortResult;
		%feature("autodoc", "Internal method. sort the result on the curve parameter.

Returns
-------
None
") SortResult;
		void SortResult();

		/****************** State ******************/
		/**** md5 signature: 3ef584a4c8697b5b43cfa0be6c8072f7 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns the ith state of the point on the face. the values can be either topabs_in ( the point is in the face) or topabs_on ( the point is on a boudary of the face).

Parameters
----------
I: int

Returns
-------
TopAbs_State
") State;
		TopAbs_State State(const Standard_Integer I);

		/****************** Transition ******************/
		/**** md5 signature: 33876f9f7fa6077fbaede5c70296e547 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Returns the ith transition of the line on the surface.

Parameters
----------
I: int

Returns
-------
IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition(const Standard_Integer I);

		/****************** UParameter ******************/
		/**** md5 signature: 4e2ab34c664fe365f73ab40bf6b7907c ****/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "Returns the u parameter of the ith intersection point on the surface.

Parameters
----------
I: int

Returns
-------
float
") UParameter;
		Standard_Real UParameter(const Standard_Integer I);

		/****************** VParameter ******************/
		/**** md5 signature: 9b61d482fd013334ec36688975ff9502 ****/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "Returns the v parameter of the ith intersection point on the surface.

Parameters
----------
I: int

Returns
-------
float
") VParameter;
		Standard_Real VParameter(const Standard_Integer I);

		/****************** WParameter ******************/
		/**** md5 signature: dc0b89e88ad9e0b7c00279c03b1e7687 ****/
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "Returns the parameter of the ith intersection point on the line.

Parameters
----------
I: int

Returns
-------
float
") WParameter;
		Standard_Real WParameter(const Standard_Integer I);

};


%extend IntCurvesFace_ShapeIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
