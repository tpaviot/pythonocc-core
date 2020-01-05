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
%define TPRSSTDDOCSTRING
"TPrsStd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tprsstd.html"
%enddef
%module (package="OCC.Core", docstring=TPRSSTDDOCSTRING) TPrsStd


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
#include<TPrsStd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDataXtd_module.hxx>
#include<AIS_module.hxx>
#include<TCollection_module.hxx>
#include<TDF_module.hxx>
#include<TDF_module.hxx>
#include<gp_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TopTools_module.hxx>
#include<TCollection_module.hxx>
#include<Geom_module.hxx>
#include<TDataStd_module.hxx>
#include<Aspect_module.hxx>
#include<Visual3d_module.hxx>
#include<TNaming_module.hxx>
#include<Select3D_module.hxx>
#include<TColQuantity_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<Prs3d_module.hxx>
#include<Bnd_module.hxx>
#include<TopLoc_module.hxx>
#include<TShort_module.hxx>
#include<SelectBasics_module.hxx>
#include<TopoDS_module.hxx>
#include<SelectMgr_module.hxx>
#include<PrsMgr_module.hxx>
#include<V3d_module.hxx>
#include<Graphic3d_module.hxx>
#include<StdSelect_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDataXtd.i
%import AIS.i
%import TCollection.i
%import TDF.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(TPrsStd_Driver)
%wrap_handle(TPrsStd_DriverTable)
%wrap_handle(TPrsStd_AxisDriver)
%wrap_handle(TPrsStd_ConstraintDriver)
%wrap_handle(TPrsStd_GeometryDriver)
%wrap_handle(TPrsStd_NamedShapeDriver)
%wrap_handle(TPrsStd_PlaneDriver)
%wrap_handle(TPrsStd_PointDriver)
/* end handles declaration */

/* templates */
%template(TPrsStd_DataMapOfGUIDDriver) NCollection_DataMap <Standard_GUID , opencascade::handle <TPrsStd_Driver>, Standard_GUID>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <Standard_GUID , opencascade::handle <TPrsStd_Driver>, Standard_GUID> TPrsStd_DataMapOfGUIDDriver;
typedef NCollection_DataMap <Standard_GUID , opencascade::handle <TPrsStd_Driver>, Standard_GUID>::Iterator TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver;
/* end typedefs declaration */

/********************************
* class TPrsStd_ConstraintTools *
********************************/
class TPrsStd_ConstraintTools {
	public:
		/****************** ComputeAngle ******************/
		%feature("compactdefaultargs") ComputeAngle;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeAngle;
		static void ComputeAngle (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeAngleForOneFace ******************/
		%feature("compactdefaultargs") ComputeAngleForOneFace;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeAngleForOneFace;
		static void ComputeAngleForOneFace (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeCoincident ******************/
		%feature("compactdefaultargs") ComputeCoincident;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeCoincident;
		static void ComputeCoincident (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeConcentric ******************/
		%feature("compactdefaultargs") ComputeConcentric;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeConcentric;
		static void ComputeConcentric (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeDiameter ******************/
		%feature("compactdefaultargs") ComputeDiameter;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeDiameter;
		static void ComputeDiameter (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeDistance ******************/
		%feature("compactdefaultargs") ComputeDistance;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeDistance;
		static void ComputeDistance (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeEqualDistance ******************/
		%feature("compactdefaultargs") ComputeEqualDistance;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeEqualDistance;
		static void ComputeEqualDistance (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeEqualRadius ******************/
		%feature("compactdefaultargs") ComputeEqualRadius;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeEqualRadius;
		static void ComputeEqualRadius (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeFix ******************/
		%feature("compactdefaultargs") ComputeFix;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeFix;
		static void ComputeFix (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeMaxRadius ******************/
		%feature("compactdefaultargs") ComputeMaxRadius;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeMaxRadius;
		static void ComputeMaxRadius (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeMidPoint ******************/
		%feature("compactdefaultargs") ComputeMidPoint;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeMidPoint;
		static void ComputeMidPoint (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeMinRadius ******************/
		%feature("compactdefaultargs") ComputeMinRadius;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeMinRadius;
		static void ComputeMinRadius (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeOffset ******************/
		%feature("compactdefaultargs") ComputeOffset;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeOffset;
		static void ComputeOffset (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeOthers ******************/
		%feature("compactdefaultargs") ComputeOthers;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeOthers;
		static void ComputeOthers (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeParallel ******************/
		%feature("compactdefaultargs") ComputeParallel;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeParallel;
		static void ComputeParallel (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputePerpendicular ******************/
		%feature("compactdefaultargs") ComputePerpendicular;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputePerpendicular;
		static void ComputePerpendicular (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputePlacement ******************/
		%feature("compactdefaultargs") ComputePlacement;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputePlacement;
		static void ComputePlacement (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeRadius ******************/
		%feature("compactdefaultargs") ComputeRadius;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeRadius;
		static void ComputeRadius (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeRound ******************/
		%feature("compactdefaultargs") ComputeRound;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeRound;
		static void ComputeRound (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeSymmetry ******************/
		%feature("compactdefaultargs") ComputeSymmetry;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeSymmetry;
		static void ComputeSymmetry (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeTangent ******************/
		%feature("compactdefaultargs") ComputeTangent;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") ComputeTangent;
		static void ComputeTangent (const opencascade::handle<TDataXtd_Constraint> & aConst,opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeTextAndValue ******************/
		%feature("compactdefaultargs") ComputeTextAndValue;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param aValue:
	:type aValue: float
	:param aText:
	:type aText: TCollection_ExtendedString
	:param anIsAngle:
	:type anIsAngle: bool
	:rtype: void") ComputeTextAndValue;
		static void ComputeTextAndValue (const opencascade::handle<TDataXtd_Constraint> & aConst,Standard_Real &OutValue,TCollection_ExtendedString & aText,const Standard_Boolean anIsAngle);

		/****************** UpdateOnlyValue ******************/
		%feature("compactdefaultargs") UpdateOnlyValue;
		%feature("autodoc", ":param aConst:
	:type aConst: TDataXtd_Constraint
	:param anAIS:
	:type anAIS: AIS_InteractiveObject
	:rtype: void") UpdateOnlyValue;
		static void UpdateOnlyValue (const opencascade::handle<TDataXtd_Constraint> & aConst,const opencascade::handle<AIS_InteractiveObject> & anAIS);

};


%extend TPrsStd_ConstraintTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TPrsStd_Driver *
***********************/
%nodefaultctor TPrsStd_Driver;
class TPrsStd_Driver : public Standard_Transient {
	public:
		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Updates the interactive object ais with information found on the attributes associated with the label L.
	:param L:
	:type L: TDF_Label
	:param ais:
	:type ais: AIS_InteractiveObject
	:rtype: bool") Update;
		virtual Standard_Boolean Update (const TDF_Label & L,opencascade::handle<AIS_InteractiveObject> & ais);

};


%make_alias(TPrsStd_Driver)

%extend TPrsStd_Driver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TPrsStd_DriverTable *
****************************/
class TPrsStd_DriverTable : public Standard_Transient {
	public:
		/****************** AddDriver ******************/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "* Returns true if the driver has been added successfully to the driver table.
	:param guid:
	:type guid: Standard_GUID
	:param driver:
	:type driver: TPrsStd_Driver
	:rtype: bool") AddDriver;
		Standard_Boolean AddDriver (const Standard_GUID & guid,const opencascade::handle<TPrsStd_Driver> & driver);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Removes all drivers. Returns true if the driver has been removed successfully. If this method is used, the InitStandardDrivers method should be called to fill the table with standard drivers.
	:rtype: None") Clear;
		void Clear ();

		/****************** FindDriver ******************/
		%feature("compactdefaultargs") FindDriver;
		%feature("autodoc", "* Returns true if the driver was found.
	:param guid:
	:type guid: Standard_GUID
	:param driver:
	:type driver: TPrsStd_Driver
	:rtype: bool") FindDriver;
		Standard_Boolean FindDriver (const Standard_GUID & guid,opencascade::handle<TPrsStd_Driver> & driver);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "* Returns the static table. If it does not exist, creates it and fills it with standard drivers.
	:rtype: opencascade::handle<TPrsStd_DriverTable>") Get;
		static opencascade::handle<TPrsStd_DriverTable> Get ();

		/****************** InitStandardDrivers ******************/
		%feature("compactdefaultargs") InitStandardDrivers;
		%feature("autodoc", "* Fills the table with standard drivers
	:rtype: None") InitStandardDrivers;
		void InitStandardDrivers ();

		/****************** RemoveDriver ******************/
		%feature("compactdefaultargs") RemoveDriver;
		%feature("autodoc", "* Removes a driver with the given GUID. Returns true if the driver has been removed successfully.
	:param guid:
	:type guid: Standard_GUID
	:rtype: bool") RemoveDriver;
		Standard_Boolean RemoveDriver (const Standard_GUID & guid);

		/****************** TPrsStd_DriverTable ******************/
		%feature("compactdefaultargs") TPrsStd_DriverTable;
		%feature("autodoc", "* Default constructor
	:rtype: None") TPrsStd_DriverTable;
		 TPrsStd_DriverTable ();

};


%make_alias(TPrsStd_DriverTable)

%extend TPrsStd_DriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TPrsStd_AxisDriver *
***************************/
class TPrsStd_AxisDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_AxisDriver ******************/
		%feature("compactdefaultargs") TPrsStd_AxisDriver;
		%feature("autodoc", "* Constructs an empty axis driver.
	:rtype: None") TPrsStd_AxisDriver;
		 TPrsStd_AxisDriver ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.
	:param aLabel:
	:type aLabel: TDF_Label
	:param anAISObject:
	:type anAISObject: AIS_InteractiveObject
	:rtype: bool") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_AxisDriver)

%extend TPrsStd_AxisDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TPrsStd_ConstraintDriver *
*********************************/
class TPrsStd_ConstraintDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_ConstraintDriver ******************/
		%feature("compactdefaultargs") TPrsStd_ConstraintDriver;
		%feature("autodoc", "* Constructs an empty constraint driver.
	:rtype: None") TPrsStd_ConstraintDriver;
		 TPrsStd_ConstraintDriver ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.
	:param aLabel:
	:type aLabel: TDF_Label
	:param anAISObject:
	:type anAISObject: AIS_InteractiveObject
	:rtype: bool") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_ConstraintDriver)

%extend TPrsStd_ConstraintDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TPrsStd_GeometryDriver *
*******************************/
class TPrsStd_GeometryDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_GeometryDriver ******************/
		%feature("compactdefaultargs") TPrsStd_GeometryDriver;
		%feature("autodoc", "* Constructs an empty geometry driver.
	:rtype: None") TPrsStd_GeometryDriver;
		 TPrsStd_GeometryDriver ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.
	:param aLabel:
	:type aLabel: TDF_Label
	:param anAISObject:
	:type anAISObject: AIS_InteractiveObject
	:rtype: bool") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_GeometryDriver)

%extend TPrsStd_GeometryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TPrsStd_NamedShapeDriver *
*********************************/
class TPrsStd_NamedShapeDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_NamedShapeDriver ******************/
		%feature("compactdefaultargs") TPrsStd_NamedShapeDriver;
		%feature("autodoc", "* Constructs an empty named shape driver.
	:rtype: None") TPrsStd_NamedShapeDriver;
		 TPrsStd_NamedShapeDriver ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.
	:param aLabel:
	:type aLabel: TDF_Label
	:param anAISObject:
	:type anAISObject: AIS_InteractiveObject
	:rtype: bool") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_NamedShapeDriver)

%extend TPrsStd_NamedShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TPrsStd_PlaneDriver *
****************************/
class TPrsStd_PlaneDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_PlaneDriver ******************/
		%feature("compactdefaultargs") TPrsStd_PlaneDriver;
		%feature("autodoc", "* Constructs an empty plane driver.
	:rtype: None") TPrsStd_PlaneDriver;
		 TPrsStd_PlaneDriver ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.
	:param aLabel:
	:type aLabel: TDF_Label
	:param anAISObject:
	:type anAISObject: AIS_InteractiveObject
	:rtype: bool") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_PlaneDriver)

%extend TPrsStd_PlaneDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TPrsStd_PointDriver *
****************************/
class TPrsStd_PointDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_PointDriver ******************/
		%feature("compactdefaultargs") TPrsStd_PointDriver;
		%feature("autodoc", "* Constructs an empty point driver.
	:rtype: None") TPrsStd_PointDriver;
		 TPrsStd_PointDriver ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.
	:param aLabel:
	:type aLabel: TDF_Label
	:param anAISObject:
	:type anAISObject: AIS_InteractiveObject
	:rtype: bool") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_PointDriver)

%extend TPrsStd_PointDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
