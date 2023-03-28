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
%define IGESCONVGEOMDOCSTRING
"IGESConvGeom module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_igesconvgeom.html"
%enddef
%module (package="OCC.Core", docstring=IGESCONVGEOMDOCSTRING) IGESConvGeom


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
#include<IGESConvGeom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<IGESGeom_module.hxx>
#include<gp_module.hxx>
#include<IGESBasic_module.hxx>
#include<IGESData_module.hxx>
#include<Message_module.hxx>
#include<MoniTool_module.hxx>
#include<Interface_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import Geom2d.i
%import IGESGeom.i
%import gp.i

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

/*********************
* class IGESConvGeom *
*********************/
%rename(igesconvgeom) IGESConvGeom;
class IGESConvGeom {
	public:
		/****************** IncreaseCurveContinuity ******************/
		/**** md5 signature: e214e1e8d9e2566e9b1816ac87ab6b08 ****/
		%feature("compactdefaultargs") IncreaseCurveContinuity;
		%feature("autodoc", "Tries to increase curve continuity with tolerance <epsgeom> <continuity> is the new desired continuity, can be 1 or 2 (more than 2 is considered as 2). returns the new maximum continuity obtained on all knots. remark that, for instance with <continuity> = 2, even if not all the knots can be passed to c2, all knots which can be are.

Parameters
----------
curve: Geom_BSplineCurve
epsgeom: float
continuity: int,optional
	default value is 2

Returns
-------
int
") IncreaseCurveContinuity;
		static Standard_Integer IncreaseCurveContinuity(const opencascade::handle<Geom_BSplineCurve> & curve, const Standard_Real epsgeom, const Standard_Integer continuity = 2);

		/****************** IncreaseCurveContinuity ******************/
		/**** md5 signature: 2cc5741f0aaa95dc0881ed5ad6584383 ****/
		%feature("compactdefaultargs") IncreaseCurveContinuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
curve: Geom2d_BSplineCurve
epsgeom: float
continuity: int,optional
	default value is 2

Returns
-------
int
") IncreaseCurveContinuity;
		static Standard_Integer IncreaseCurveContinuity(const opencascade::handle<Geom2d_BSplineCurve> & curve, const Standard_Real epsgeom, const Standard_Integer continuity = 2);

		/****************** IncreaseSurfaceContinuity ******************/
		/**** md5 signature: 9367e5891b683d82447422fb7d102cb1 ****/
		%feature("compactdefaultargs") IncreaseSurfaceContinuity;
		%feature("autodoc", "Tries to increase surface continuity with tolerance <epsgeom> <continuity> is the new desired continuity, can be 1 or 2 (more than 2 is considered as 2). returns the new maximum continuity obtained on all knots. remark that, for instance with <continuity> = 2, even if not all the knots can be passed to c2, all knots which can be are.

Parameters
----------
surface: Geom_BSplineSurface
epsgeom: float
continuity: int,optional
	default value is 2

Returns
-------
int
") IncreaseSurfaceContinuity;
		static Standard_Integer IncreaseSurfaceContinuity(const opencascade::handle<Geom_BSplineSurface> & surface, const Standard_Real epsgeom, const Standard_Integer continuity = 2);

		/****************** SplineCurveFromIGES ******************/
		/**** md5 signature: cc3fd17672fcb76055866673e18ca7f2 ****/
		%feature("compactdefaultargs") SplineCurveFromIGES;
		%feature("autodoc", "Basic tool to build curves from igesgeom (arrays of points, transformations, evaluation of points in a datum) converts a splinecurve from iges to a bsplinecurve from cascade <epscoef> gives tolerance to consider coefficient to be nul <epsgeom> gives tolerance to consider poles to be equal the returned value is a status with these possible values : - 0 ok, done - 1 the result is not guaranteed to be c0 (with <epsgeom>) - 2 splinetype not processed (allowed : max 3) (no result produced) - 3 error during creation of control points (no result produced) - 4 polynomial equation is not correct (no result produced) - 5 less than one segment (no result produced).

Parameters
----------
igesent: IGESGeom_SplineCurve
epscoef: float
epsgeom: float
result: Geom_BSplineCurve

Returns
-------
int
") SplineCurveFromIGES;
		static Standard_Integer SplineCurveFromIGES(const opencascade::handle<IGESGeom_SplineCurve> & igesent, const Standard_Real epscoef, const Standard_Real epsgeom, opencascade::handle<Geom_BSplineCurve> & result);

		/****************** SplineSurfaceFromIGES ******************/
		/**** md5 signature: e53f2fb1b1bf98af296290bc7ac88967 ****/
		%feature("compactdefaultargs") SplineSurfaceFromIGES;
		%feature("autodoc", "Converts a splinesurface from iges to a bsplinesurface from cascade <epscoef> gives tolerance to consider coefficient to be nul <epsgeom> gives tolerance to consider poles to be equal the returned value is a status with these possible values : - 0 ok, done - 1 the result is not guaranteed to be c0 (with <epsgeom>) - 2 degree is not compatible with code boundary type (warning) but c0 is ok - 3 idem but c0 is not guaranteed (warning) - 4 degree has been determined to be nul, either in u or v (no result produced) - 5 less than one segment in u or v (no result produced).

Parameters
----------
igesent: IGESGeom_SplineSurface
epscoef: float
epsgeom: float
result: Geom_BSplineSurface

Returns
-------
int
") SplineSurfaceFromIGES;
		static Standard_Integer SplineSurfaceFromIGES(const opencascade::handle<IGESGeom_SplineSurface> & igesent, const Standard_Real epscoef, const Standard_Real epsgeom, opencascade::handle<Geom_BSplineSurface> & result);

};


%extend IGESConvGeom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESConvGeom_GeomBuilder *
*********************************/
class IGESConvGeom_GeomBuilder {
	public:
		/****************** IGESConvGeom_GeomBuilder ******************/
		/**** md5 signature: 0842aa0a614ccade210dccaf2ad40bba ****/
		%feature("compactdefaultargs") IGESConvGeom_GeomBuilder;
		%feature("autodoc", "Creates a geombuilder at initial state.

Returns
-------
None
") IGESConvGeom_GeomBuilder;
		 IGESConvGeom_GeomBuilder();

		/****************** AddVec ******************/
		/**** md5 signature: 3debbf205600ef14f2bf61e93a634953 ****/
		%feature("compactdefaultargs") AddVec;
		%feature("autodoc", "Adds a vector part to the list of points. it will be used for copiousdata, datatype=3, only. addxy and addxyz consider a null vector part (0,0,0) addvec adds to the last added xy or xyz.

Parameters
----------
val: gp_XYZ

Returns
-------
None
") AddVec;
		void AddVec(const gp_XYZ & val);

		/****************** AddXY ******************/
		/**** md5 signature: 8091dc17db6f29fbdfb8164dd8396e1d ****/
		%feature("compactdefaultargs") AddXY;
		%feature("autodoc", "Adds a xy (z=0) to the list of points.

Parameters
----------
val: gp_XY

Returns
-------
None
") AddXY;
		void AddXY(const gp_XY & val);

		/****************** AddXYZ ******************/
		/**** md5 signature: a88a34f668d398d94c14ed4c1b16282c ****/
		%feature("compactdefaultargs") AddXYZ;
		%feature("autodoc", "Adds a xyz to the list of points.

Parameters
----------
val: gp_XYZ

Returns
-------
None
") AddXYZ;
		void AddXYZ(const gp_XYZ & val);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears list of points/vectors and data about transformation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** EvalXYZ ******************/
		/**** md5 signature: f6fca6058af33aed2976cc5cddf273e0 ****/
		%feature("compactdefaultargs") EvalXYZ;
		%feature("autodoc", "Evaluates a xyz value in the position already defined. returns the transformed coordinates. for a 2d definition, x,y will then be used to define a xy and z will be regarded as a z displacement (can be ignored).

Parameters
----------
val: gp_XYZ

Returns
-------
X: float
Y: float
Z: float
") EvalXYZ;
		void EvalXYZ(const gp_XYZ & val, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsIdentity ******************/
		/**** md5 signature: c38f0e0f7a13209171f4210bc9ad93d3 ****/
		%feature("compactdefaultargs") IsIdentity;
		%feature("autodoc", "Returns true if the position is identity.

Returns
-------
bool
") IsIdentity;
		Standard_Boolean IsIdentity();

		/****************** IsTranslation ******************/
		/**** md5 signature: 6ccc5930e9542ec5fcb1f25ab7905e7e ****/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "Returns true if the position is a translation only remark : identity and zonly will answer true.

Returns
-------
bool
") IsTranslation;
		Standard_Boolean IsTranslation();

		/****************** IsZOnly ******************/
		/**** md5 signature: fefa2b28ed7a0b56d7a30e6f2bfc8967 ****/
		%feature("compactdefaultargs") IsZOnly;
		%feature("autodoc", "Returns true if the position corresponds to a z-displacement, i.e. is a translation only, and only on z remark : identity will answer true.

Returns
-------
bool
") IsZOnly;
		Standard_Boolean IsZOnly();

		/****************** MakeCopiousData ******************/
		/**** md5 signature: 1338b34733f2bf1c69b589641d595d98 ****/
		%feature("compactdefaultargs") MakeCopiousData;
		%feature("autodoc", "Makes a copiousdata with the list of recorded points/vectors according to <datatype>, which must be 1,2 or 3 if <polyline> is given true, the copiousdata is coded as a polyline, but <datatype> must not be 3 <datatype> = 1 : common z is computed as average of all z <datatype> = 1 or 2 : vectors are ignored.

Parameters
----------
datatype: int
polyline: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<IGESGeom_CopiousData>
") MakeCopiousData;
		opencascade::handle<IGESGeom_CopiousData> MakeCopiousData(const Standard_Integer datatype, const Standard_Boolean polyline = Standard_False);

		/****************** MakeTransformation ******************/
		/**** md5 signature: d99b49274b64fb3b21c8fe6cd0de93e7 ****/
		%feature("compactdefaultargs") MakeTransformation;
		%feature("autodoc", "Returns the iges transformation which corresponds to the position. even if it is an identity : isidentity should be tested first. <unit> is the unit value in which the model is created : it is used to convert translation part.

Parameters
----------
unit: float,optional
	default value is 1

Returns
-------
opencascade::handle<IGESGeom_TransformationMatrix>
") MakeTransformation;
		opencascade::handle<IGESGeom_TransformationMatrix> MakeTransformation(const Standard_Real unit = 1);

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the count of already recorded points.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: 0626385547aa5a5b142c7ef7bcf15493 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns a point given its rank (if added as xy, z will be 0).

Parameters
----------
num: int

Returns
-------
gp_XYZ
") Point;
		gp_XYZ Point(const Standard_Integer num);

		/****************** Position ******************/
		/**** md5 signature: 2a77af21f488a42515d2df7b28e6f81e ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the position in which the method evalxyz will evaluate a xyz. it can be regarded as defining a local system. it is initially set to identity.

Returns
-------
gp_Trsf
") Position;
		gp_Trsf Position();

		/****************** SetPosition ******************/
		/**** md5 signature: fc33ae0c93ee06f6435de91f38f4244c ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Sets final position from an already defined trsf.

Parameters
----------
pos: gp_Trsf

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Trsf & pos);

		/****************** SetPosition ******************/
		/**** md5 signature: 0a752c4047b4fbbd8f587274431d70bf ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Sets final position from an ax3.

Parameters
----------
pos: gp_Ax3

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax3 & pos);

		/****************** SetPosition ******************/
		/**** md5 signature: a1af988cb15bdebd5ac458277d464bfd ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Sets final position from an ax2.

Parameters
----------
pos: gp_Ax2

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax2 & pos);

		/****************** SetPosition ******************/
		/**** md5 signature: c5a24c5a7ae920d43c419dbc4401feb3 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Sets final position from an ax1 (this means that origin point and z-axis are defined, the other axes are defined arbitrarily).

Parameters
----------
pos: gp_Ax1

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Ax1 & pos);

};


%extend IGESConvGeom_GeomBuilder {
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
