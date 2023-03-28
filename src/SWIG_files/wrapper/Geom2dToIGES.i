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
%define GEOM2DTOIGESDOCSTRING
"Geom2dToIGES module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_geom2dtoiges.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DTOIGESDOCSTRING) Geom2dToIGES


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
#include<Geom2dToIGES_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<Geom2d_module.hxx>
#include<IGESGeom_module.hxx>
#include<MoniTool_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<Interface_module.hxx>
#include<IGESBasic_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IGESData.i
%import Geom2d.i
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

/**********************************
* class Geom2dToIGES_Geom2dEntity *
**********************************/
class Geom2dToIGES_Geom2dEntity {
	public:
		/****************** Geom2dToIGES_Geom2dEntity ******************/
		/**** md5 signature: 6cd00c28c843c56d0cff47db5767ee0e ****/
		%feature("compactdefaultargs") Geom2dToIGES_Geom2dEntity;
		%feature("autodoc", "Creates a tool geom2dentity.

Returns
-------
None
") Geom2dToIGES_Geom2dEntity;
		 Geom2dToIGES_Geom2dEntity();

		/****************** Geom2dToIGES_Geom2dEntity ******************/
		/**** md5 signature: 81ad900772c1548e27ebb1a50d32faea ****/
		%feature("compactdefaultargs") Geom2dToIGES_Geom2dEntity;
		%feature("autodoc", "Creates a tool ready to run and sets its fields as ge's.

Parameters
----------
GE: Geom2dToIGES_Geom2dEntity

Returns
-------
None
") Geom2dToIGES_Geom2dEntity;
		 Geom2dToIGES_Geom2dEntity(const Geom2dToIGES_Geom2dEntity & GE);

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
		%feature("autodoc", "Returns the value of the unitflag of the header of the model in millimeters.

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


%extend Geom2dToIGES_Geom2dEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Geom2dToIGES_Geom2dCurve *
*********************************/
class Geom2dToIGES_Geom2dCurve : public Geom2dToIGES_Geom2dEntity {
	public:
		/****************** Geom2dToIGES_Geom2dCurve ******************/
		/**** md5 signature: 26632668f446696b62f96d7c2adaeffa ****/
		%feature("compactdefaultargs") Geom2dToIGES_Geom2dCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dToIGES_Geom2dCurve;
		 Geom2dToIGES_Geom2dCurve();

		/****************** Geom2dToIGES_Geom2dCurve ******************/
		/**** md5 signature: e5d9723b55cbbbc6f0ea6dd4c7901b09 ****/
		%feature("compactdefaultargs") Geom2dToIGES_Geom2dCurve;
		%feature("autodoc", "Creates a tool geom2dcurve ready to run and sets its fields as g2de's.

Parameters
----------
G2dE: Geom2dToIGES_Geom2dEntity

Returns
-------
None
") Geom2dToIGES_Geom2dCurve;
		 Geom2dToIGES_Geom2dCurve(const Geom2dToIGES_Geom2dEntity & G2dE);

		/****************** Transfer2dCurve ******************/
		/**** md5 signature: 047a8fcf3b58e22cbbbd3b82ecd17e30 ****/
		%feature("compactdefaultargs") Transfer2dCurve;
		%feature("autodoc", "Transfert an entity from geom2d to iges. if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: Geom2d_Curve
Udeb: float
Ufin: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Transfer2dCurve;
		opencascade::handle<IGESData_IGESEntity> Transfer2dCurve(const opencascade::handle<Geom2d_Curve> & start, const Standard_Real Udeb, const Standard_Real Ufin);

};


%extend Geom2dToIGES_Geom2dCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Geom2dToIGES_Geom2dPoint *
*********************************/
class Geom2dToIGES_Geom2dPoint : public Geom2dToIGES_Geom2dEntity {
	public:
		/****************** Geom2dToIGES_Geom2dPoint ******************/
		/**** md5 signature: 855944f171d55e6c5ec549c0cdb4de13 ****/
		%feature("compactdefaultargs") Geom2dToIGES_Geom2dPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dToIGES_Geom2dPoint;
		 Geom2dToIGES_Geom2dPoint();

		/****************** Geom2dToIGES_Geom2dPoint ******************/
		/**** md5 signature: f2f32e8990e443cac432b2e856f622a6 ****/
		%feature("compactdefaultargs") Geom2dToIGES_Geom2dPoint;
		%feature("autodoc", "Creates a tool geom2dpoint ready to run and sets its fields as g2de's.

Parameters
----------
G2dE: Geom2dToIGES_Geom2dEntity

Returns
-------
None
") Geom2dToIGES_Geom2dPoint;
		 Geom2dToIGES_Geom2dPoint(const Geom2dToIGES_Geom2dEntity & G2dE);

		/****************** Transfer2dPoint ******************/
		/**** md5 signature: e39677a006cb3dec10facf253629fa2e ****/
		%feature("compactdefaultargs") Transfer2dPoint;
		%feature("autodoc", "Transfert a point from geom to iges. if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: Geom2d_Point

Returns
-------
opencascade::handle<IGESGeom_Point>
") Transfer2dPoint;
		opencascade::handle<IGESGeom_Point> Transfer2dPoint(const opencascade::handle<Geom2d_Point> & start);

		/****************** Transfer2dPoint ******************/
		/**** md5 signature: 04d4aa0aaee9f79346423ce9f5470610 ****/
		%feature("compactdefaultargs") Transfer2dPoint;
		%feature("autodoc", "Transfert a cartesianpoint from geom to iges. if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: Geom2d_CartesianPoint

Returns
-------
opencascade::handle<IGESGeom_Point>
") Transfer2dPoint;
		opencascade::handle<IGESGeom_Point> Transfer2dPoint(const opencascade::handle<Geom2d_CartesianPoint> & start);

};


%extend Geom2dToIGES_Geom2dPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dToIGES_Geom2dVector *
**********************************/
class Geom2dToIGES_Geom2dVector : public Geom2dToIGES_Geom2dEntity {
	public:
		/****************** Geom2dToIGES_Geom2dVector ******************/
		/**** md5 signature: 10080494ad42f4257e3e75bf74510667 ****/
		%feature("compactdefaultargs") Geom2dToIGES_Geom2dVector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dToIGES_Geom2dVector;
		 Geom2dToIGES_Geom2dVector();

		/****************** Geom2dToIGES_Geom2dVector ******************/
		/**** md5 signature: 847ae25390c32b1b3cab70653d339be8 ****/
		%feature("compactdefaultargs") Geom2dToIGES_Geom2dVector;
		%feature("autodoc", "Creates a tool geom2dvector ready to run and sets its fields as g2de's.

Parameters
----------
G2dE: Geom2dToIGES_Geom2dEntity

Returns
-------
None
") Geom2dToIGES_Geom2dVector;
		 Geom2dToIGES_Geom2dVector(const Geom2dToIGES_Geom2dEntity & G2dE);

		/****************** Transfer2dVector ******************/
		/**** md5 signature: 379f9f761c1c41f73327dd0417be2b52 ****/
		%feature("compactdefaultargs") Transfer2dVector;
		%feature("autodoc", "Transfert a geometryentity which answer true to the member : breptoiges::isgeomvector(geometry). if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: Geom2d_Vector

Returns
-------
opencascade::handle<IGESGeom_Direction>
") Transfer2dVector;
		opencascade::handle<IGESGeom_Direction> Transfer2dVector(const opencascade::handle<Geom2d_Vector> & start);

		/****************** Transfer2dVector ******************/
		/**** md5 signature: 33c82f4956e7d76da7e627da9db039e6 ****/
		%feature("compactdefaultargs") Transfer2dVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom2d_VectorWithMagnitude

Returns
-------
opencascade::handle<IGESGeom_Direction>
") Transfer2dVector;
		opencascade::handle<IGESGeom_Direction> Transfer2dVector(const opencascade::handle<Geom2d_VectorWithMagnitude> & start);

		/****************** Transfer2dVector ******************/
		/**** md5 signature: ca2ffd2510165c6c1c9b40bd31e8b724 ****/
		%feature("compactdefaultargs") Transfer2dVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Geom2d_Direction

Returns
-------
opencascade::handle<IGESGeom_Direction>
") Transfer2dVector;
		opencascade::handle<IGESGeom_Direction> Transfer2dVector(const opencascade::handle<Geom2d_Direction> & start);

};


%extend Geom2dToIGES_Geom2dVector {
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
