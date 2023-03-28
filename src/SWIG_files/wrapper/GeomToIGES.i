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
%define GEOMTOIGESDOCSTRING
"GeomToIGES module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_geomtoiges.html"
%enddef
%module (package="OCC.Core", docstring=GEOMTOIGESDOCSTRING) GeomToIGES


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
#include<GeomToIGES_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<Geom_module.hxx>
#include<IGESGeom_module.hxx>
#include<MoniTool_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<TopoDS_module.hxx>
#include<IGESBasic_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IGESData.i
%import Geom.i
%import IGESGeom.i

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

/******************************
* class GeomToIGES_GeomEntity *
******************************/
class GeomToIGES_GeomEntity {
	public:
		/****************** GeomToIGES_GeomEntity ******************/
		/**** md5 signature: 439ea60874c34665470aa8a241c0ae1b ****/
		%feature("compactdefaultargs") GeomToIGES_GeomEntity;
		%feature("autodoc", "Creates a tool geomentity.

Returns
-------
None
") GeomToIGES_GeomEntity;
		 GeomToIGES_GeomEntity();

		/****************** GeomToIGES_GeomEntity ******************/
		/**** md5 signature: e886cc5f8a4ebb86bfa4d883cad903ce ****/
		%feature("compactdefaultargs") GeomToIGES_GeomEntity;
		%feature("autodoc", "Creates a tool ready to run and sets its fields as ge's.

Parameters
----------
GE: GeomToIGES_GeomEntity

Returns
-------
None
") GeomToIGES_GeomEntity;
		 GeomToIGES_GeomEntity(const GeomToIGES_GeomEntity & GE);

		/****************** GetModel ******************/
		/**** md5 signature: 903699a7f01ab7b92813659a6c19f871 ****/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "Returns the value of 'themodel'.

Returns
-------
opencascade::handle<IGESData_IGESModel>
") GetModel;
		opencascade::handle<IGESData_IGESModel> GetModel();

		/****************** GetUnit ******************/
		/**** md5 signature: 039a57c9f6b7a42814266e23014d7f99 ****/
		%feature("compactdefaultargs") GetUnit;
		%feature("autodoc", "Returns the value of the unitflag of the header of the model in meters.

Returns
-------
float
") GetUnit;
		Standard_Real GetUnit();

		/****************** SetModel ******************/
		/**** md5 signature: 57ee68a1eb65ee7bf7cf629e19bb0af7 ****/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Set the value of 'themodel'.

Parameters
----------
model: IGESData_IGESModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<IGESData_IGESModel> & model);

		/****************** SetUnit ******************/
		/**** md5 signature: 73321041ecd31c6fea7b6ac6251d3959 ****/
		%feature("compactdefaultargs") SetUnit;
		%feature("autodoc", "Sets the value of the unitflag.

Parameters
----------
unit: float

Returns
-------
None
") SetUnit;
		void SetUnit(const Standard_Real unit);

};


%extend GeomToIGES_GeomEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomToIGES_GeomCurve *
*****************************/
class GeomToIGES_GeomCurve : public GeomToIGES_GeomEntity {
	public:
		/****************** GeomToIGES_GeomCurve ******************/
		/**** md5 signature: b9befa4b49b320c3f5d51d6f2cc13a3e ****/
		%feature("compactdefaultargs") GeomToIGES_GeomCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomToIGES_GeomCurve;
		 GeomToIGES_GeomCurve();

		/****************** GeomToIGES_GeomCurve ******************/
		/**** md5 signature: 15c236fa3a9c8d4a5465e019c10c2bc5 ****/
		%feature("compactdefaultargs") GeomToIGES_GeomCurve;
		%feature("autodoc", "Creates a tool geomcurve ready to run and sets its fields as ge's.

Parameters
----------
GE: GeomToIGES_GeomEntity

Returns
-------
None
") GeomToIGES_GeomCurve;
		 GeomToIGES_GeomCurve(const GeomToIGES_GeomEntity & GE);

		/****************** TransferCurve ******************/
		/**** md5 signature: a93d705f3e375009170ef920f2304e67 ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "Transfert a geometryentity which answer true to the member : breptoiges::isgeomcurve(geometry). if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: Geom_Curve
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_Curve> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: e6941734ed937f149d387e1fa4a45a05 ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_BoundedCurve
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_BoundedCurve> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: e96951f1e98805517fbb2e09604791b0 ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_BSplineCurve
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_BSplineCurve> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: cec471c8092de8057be5dd1066ca4760 ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_BezierCurve
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_BezierCurve> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: b400805865f130b456b952c2c4ec2ef7 ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_TrimmedCurve
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_TrimmedCurve> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: c382000f0413db33c4552ff65153c36e ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_Conic
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_Conic> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: c050f63e8559f35042164b752a30b54d ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_Circle
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_Circle> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: 6ac78c7aa49e955226d391e3e63bf989 ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_Ellipse
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_Ellipse> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: 061bd2caf440f45b5361104e3e58e0c7 ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_Hyperbola
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_Hyperbola> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: 78cf11e88168bf1fe835a1c970fd4a3f ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_Line
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_Line> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: 4371484a92d8a67141da5c2da12f0fb2 ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_Parabola
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_Parabola> & start, const Standard_Real Udeb, const Standard_Real Ufin);

		/****************** TransferCurve ******************/
		/**** md5 signature: 9c17c12367a4595f3833038e30b53d09 ****/
		%feature("compactdefaultargs") TransferCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_OffsetCurve
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCurve;
		opencascade::handle<IGESData_IGESEntity> TransferCurve(const opencascade::handle<Geom_OffsetCurve> & start, const Standard_Real Udeb, const Standard_Real Ufin);

};


%extend GeomToIGES_GeomCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomToIGES_GeomPoint *
*****************************/
class GeomToIGES_GeomPoint : public GeomToIGES_GeomEntity {
	public:
		/****************** GeomToIGES_GeomPoint ******************/
		/**** md5 signature: 707c98884e2e1d3d1af6f41f8ec4c234 ****/
		%feature("compactdefaultargs") GeomToIGES_GeomPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomToIGES_GeomPoint;
		 GeomToIGES_GeomPoint();

		/****************** GeomToIGES_GeomPoint ******************/
		/**** md5 signature: eaabc3232002e5dcaa07c7ac9139a4ba ****/
		%feature("compactdefaultargs") GeomToIGES_GeomPoint;
		%feature("autodoc", "Creates a tool geompoint ready to run and sets its fields as ge's.

Parameters
----------
GE: GeomToIGES_GeomEntity

Returns
-------
None
") GeomToIGES_GeomPoint;
		 GeomToIGES_GeomPoint(const GeomToIGES_GeomEntity & GE);

		/****************** TransferPoint ******************/
		/**** md5 signature: d05da5b17a4c9be13078b7c29103b6bd ****/
		%feature("compactdefaultargs") TransferPoint;
		%feature("autodoc", "Transfert a point from geom to iges. if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: Geom_Point

Returns
-------
opencascade::handle<IGESGeom_Point>
") TransferPoint;
		opencascade::handle<IGESGeom_Point> TransferPoint(const opencascade::handle<Geom_Point> & start);

		/****************** TransferPoint ******************/
		/**** md5 signature: ac5c182a746a569355c6b7a17b20533f ****/
		%feature("compactdefaultargs") TransferPoint;
		%feature("autodoc", "Transfert a cartesianpoint from geom to iges. if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: Geom_CartesianPoint

Returns
-------
opencascade::handle<IGESGeom_Point>
") TransferPoint;
		opencascade::handle<IGESGeom_Point> TransferPoint(const opencascade::handle<Geom_CartesianPoint> & start);

};


%extend GeomToIGES_GeomPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomToIGES_GeomSurface *
*******************************/
class GeomToIGES_GeomSurface : public GeomToIGES_GeomEntity {
	public:
		/****************** GeomToIGES_GeomSurface ******************/
		/**** md5 signature: a5c148f0d95649b5aa8443f8705520df ****/
		%feature("compactdefaultargs") GeomToIGES_GeomSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomToIGES_GeomSurface;
		 GeomToIGES_GeomSurface();

		/****************** GeomToIGES_GeomSurface ******************/
		/**** md5 signature: a0214d5aa89925e1f8ba766050c53cee ****/
		%feature("compactdefaultargs") GeomToIGES_GeomSurface;
		%feature("autodoc", "Creates a tool geomsurface ready to run and sets its fields as ge's.

Parameters
----------
GE: GeomToIGES_GeomEntity

Returns
-------
None
") GeomToIGES_GeomSurface;
		 GeomToIGES_GeomSurface(const GeomToIGES_GeomEntity & GE);

		/****************** GetAnalyticMode ******************/
		/**** md5 signature: 1f73c2d42debddded3b6a29e1fa1d09a ****/
		%feature("compactdefaultargs") GetAnalyticMode;
		%feature("autodoc", "Returns flag for writing elementary surfaces.

Returns
-------
bool
") GetAnalyticMode;
		Standard_Boolean GetAnalyticMode();

		/****************** GetBRepMode ******************/
		/**** md5 signature: a6a1e0e72d1966719332c5d28692d5b4 ****/
		%feature("compactdefaultargs") GetBRepMode;
		%feature("autodoc", "Returns brep mode flag.

Returns
-------
bool
") GetBRepMode;
		Standard_Boolean GetBRepMode();

		/****************** Length ******************/
		/**** md5 signature: 7a11021be5ff74a321b964da373ca8bd ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the value of 'thelength'.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** SetAnalyticMode ******************/
		/**** md5 signature: c28943137c1b6838dea2078d9dc50304 ****/
		%feature("compactdefaultargs") SetAnalyticMode;
		%feature("autodoc", "Setst flag for writing elementary surfaces.

Parameters
----------
flag: bool

Returns
-------
None
") SetAnalyticMode;
		void SetAnalyticMode(const Standard_Boolean flag);

		/****************** SetBRepMode ******************/
		/**** md5 signature: 91e2e30ab51f50d9e0bdc6177082d9f3 ****/
		%feature("compactdefaultargs") SetBRepMode;
		%feature("autodoc", "Sets brep mode flag.

Parameters
----------
flag: bool

Returns
-------
None
") SetBRepMode;
		void SetBRepMode(const Standard_Boolean flag);

		/****************** TransferConicalSurface ******************/
		/**** md5 signature: 7502eedc3212593f163cfd41f23d1d2d ****/
		%feature("compactdefaultargs") TransferConicalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_ConicalSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferConicalSurface;
		opencascade::handle<IGESData_IGESEntity> TransferConicalSurface(const opencascade::handle<Geom_ConicalSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferCylindricalSurface ******************/
		/**** md5 signature: 35ae436f7ffa5b176f48a718a441820d ****/
		%feature("compactdefaultargs") TransferCylindricalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_CylindricalSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCylindricalSurface;
		opencascade::handle<IGESData_IGESEntity> TransferCylindricalSurface(const opencascade::handle<Geom_CylindricalSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferPlaneSurface ******************/
		/**** md5 signature: 9006d94ed5d4cb58ec695922a8936620 ****/
		%feature("compactdefaultargs") TransferPlaneSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_Plane
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferPlaneSurface;
		opencascade::handle<IGESData_IGESEntity> TransferPlaneSurface(const opencascade::handle<Geom_Plane> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSphericalSurface ******************/
		/**** md5 signature: e26ea8e84b0dfd9204cfad5293036f5f ****/
		%feature("compactdefaultargs") TransferSphericalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_SphericalSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSphericalSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSphericalSurface(const opencascade::handle<Geom_SphericalSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: 0c868c8d881dcd673a48229e9b6ec2ca ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "Transfert a geometryentity which answer true to the member : breptoiges::isgeomsurface(geometry). if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: Geom_Surface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_Surface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: b4ea4dbf91a7ddd5adbf7f2a7caf888f ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_BoundedSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_BoundedSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: 77e79da1e4236132b2994631e95a5eba ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_BSplineSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_BSplineSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: 99d9ed2ddf7311a9fc7879fe8479280c ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_BezierSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_BezierSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: d368a7d001480694980db91020aa5bd8 ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_RectangularTrimmedSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_RectangularTrimmedSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: 5768076dd00b1a27f3d3e63f717ee71b ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_ElementarySurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_ElementarySurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: af1825cac6fc34cbe7ae03f4188b6397 ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_Plane
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_Plane> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: 1e12c7f17fd403f30eff030fb9bac75d ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_CylindricalSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_CylindricalSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: e30a7916a8be4bbd2d71e05008fe4da9 ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_ConicalSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_ConicalSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: 3ae035c144a32377921d3690160acd44 ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_SphericalSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_SphericalSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: d0f593783f2cd5522dc5c6ab93c028b2 ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_ToroidalSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_ToroidalSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: 3e583010d82232266b34d30d12633fcb ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_SweptSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_SweptSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: 11cca735b0b06fad8cd50babd4ab47e5 ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_SurfaceOfLinearExtrusion
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_SurfaceOfLinearExtrusion> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: 4c2685d748f1f302c008619f99db7d33 ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_SurfaceOfRevolution
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_SurfaceOfRevolution> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferSurface ******************/
		/**** md5 signature: 385ba68dcf75cb2ace9e45302dc528b0 ****/
		%feature("compactdefaultargs") TransferSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_OffsetSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferSurface;
		opencascade::handle<IGESData_IGESEntity> TransferSurface(const opencascade::handle<Geom_OffsetSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

		/****************** TransferToroidalSurface ******************/
		/**** md5 signature: 59779d3eb9a0bd67c4a0dc406da156ce ****/
		%feature("compactdefaultargs") TransferToroidalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_ToroidalSurface
Udeb: float
Ufin: float
Vdeb: float
Vfin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferToroidalSurface;
		opencascade::handle<IGESData_IGESEntity> TransferToroidalSurface(const opencascade::handle<Geom_ToroidalSurface> & start, const Standard_Real Udeb, const Standard_Real Ufin, const Standard_Real Vdeb, const Standard_Real Vfin);

};


%extend GeomToIGES_GeomSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomToIGES_GeomVector *
******************************/
class GeomToIGES_GeomVector : public GeomToIGES_GeomEntity {
	public:
		/****************** GeomToIGES_GeomVector ******************/
		/**** md5 signature: 80f16764acbb9a85ab6b03faf18b7d07 ****/
		%feature("compactdefaultargs") GeomToIGES_GeomVector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomToIGES_GeomVector;
		 GeomToIGES_GeomVector();

		/****************** GeomToIGES_GeomVector ******************/
		/**** md5 signature: e0d424f7c8286b297705587ba50a5dcc ****/
		%feature("compactdefaultargs") GeomToIGES_GeomVector;
		%feature("autodoc", "Creates a tool geomvector ready to run and sets its fields as ge's.

Parameters
----------
GE: GeomToIGES_GeomEntity

Returns
-------
None
") GeomToIGES_GeomVector;
		 GeomToIGES_GeomVector(const GeomToIGES_GeomEntity & GE);

		/****************** TransferVector ******************/
		/**** md5 signature: f1ab734db6d1e477786dda558052e585 ****/
		%feature("compactdefaultargs") TransferVector;
		%feature("autodoc", "Transfert a geometryentity which answer true to the member : breptoiges::isgeomvector(geometry). if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: Geom_Vector

Returns
-------
opencascade::handle<IGESGeom_Direction>
") TransferVector;
		opencascade::handle<IGESGeom_Direction> TransferVector(const opencascade::handle<Geom_Vector> & start);

		/****************** TransferVector ******************/
		/**** md5 signature: 4bd441f76695b23828fe9f04b2772e12 ****/
		%feature("compactdefaultargs") TransferVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_VectorWithMagnitude

Returns
-------
opencascade::handle<IGESGeom_Direction>
") TransferVector;
		opencascade::handle<IGESGeom_Direction> TransferVector(const opencascade::handle<Geom_VectorWithMagnitude> & start);

		/****************** TransferVector ******************/
		/**** md5 signature: cabb21979ee32f0cc41cdd1c5c4a920a ****/
		%feature("compactdefaultargs") TransferVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom_Direction

Returns
-------
opencascade::handle<IGESGeom_Direction>
") TransferVector;
		opencascade::handle<IGESGeom_Direction> TransferVector(const opencascade::handle<Geom_Direction> & start);

};


%extend GeomToIGES_GeomVector {
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
