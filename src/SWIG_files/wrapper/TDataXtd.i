/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define TDATAXTDDOCSTRING
"TDataXtd module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tdataxtd.html"
%enddef
%module (package="OCC.Core", docstring=TDATAXTDDOCSTRING) TDataXtd


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
#include<TDataXtd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDF_module.hxx>
#include<TDataStd_module.hxx>
#include<gp_module.hxx>
#include<TNaming_module.hxx>
#include<Quantity_module.hxx>
#include<TopoDS_module.hxx>
#include<Poly_module.hxx>
#include<TopTools_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<TShort_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDF.i
%import TDataStd.i
%import gp.i
%import TNaming.i
%import Quantity.i
%import TopoDS.i
%import Poly.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TDataXtd_ConstraintEnum {
	TDataXtd_RADIUS = 0,
	TDataXtd_DIAMETER = 1,
	TDataXtd_MINOR_RADIUS = 2,
	TDataXtd_MAJOR_RADIUS = 3,
	TDataXtd_TANGENT = 4,
	TDataXtd_PARALLEL = 5,
	TDataXtd_PERPENDICULAR = 6,
	TDataXtd_CONCENTRIC = 7,
	TDataXtd_COINCIDENT = 8,
	TDataXtd_DISTANCE = 9,
	TDataXtd_ANGLE = 10,
	TDataXtd_EQUAL_RADIUS = 11,
	TDataXtd_SYMMETRY = 12,
	TDataXtd_MIDPOINT = 13,
	TDataXtd_EQUAL_DISTANCE = 14,
	TDataXtd_FIX = 15,
	TDataXtd_RIGID = 16,
	TDataXtd_FROM = 17,
	TDataXtd_AXIS = 18,
	TDataXtd_MATE = 19,
	TDataXtd_ALIGN_FACES = 20,
	TDataXtd_ALIGN_AXES = 21,
	TDataXtd_AXES_ANGLE = 22,
	TDataXtd_FACES_ANGLE = 23,
	TDataXtd_ROUND = 24,
	TDataXtd_OFFSET = 25,
};

enum TDataXtd_GeometryEnum {
	TDataXtd_ANY_GEOM = 0,
	TDataXtd_POINT = 1,
	TDataXtd_LINE = 2,
	TDataXtd_CIRCLE = 3,
	TDataXtd_ELLIPSE = 4,
	TDataXtd_SPLINE = 5,
	TDataXtd_PLANE = 6,
	TDataXtd_CYLINDER = 7,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TDataXtd_ConstraintEnum(IntEnum):
	TDataXtd_RADIUS = 0
	TDataXtd_DIAMETER = 1
	TDataXtd_MINOR_RADIUS = 2
	TDataXtd_MAJOR_RADIUS = 3
	TDataXtd_TANGENT = 4
	TDataXtd_PARALLEL = 5
	TDataXtd_PERPENDICULAR = 6
	TDataXtd_CONCENTRIC = 7
	TDataXtd_COINCIDENT = 8
	TDataXtd_DISTANCE = 9
	TDataXtd_ANGLE = 10
	TDataXtd_EQUAL_RADIUS = 11
	TDataXtd_SYMMETRY = 12
	TDataXtd_MIDPOINT = 13
	TDataXtd_EQUAL_DISTANCE = 14
	TDataXtd_FIX = 15
	TDataXtd_RIGID = 16
	TDataXtd_FROM = 17
	TDataXtd_AXIS = 18
	TDataXtd_MATE = 19
	TDataXtd_ALIGN_FACES = 20
	TDataXtd_ALIGN_AXES = 21
	TDataXtd_AXES_ANGLE = 22
	TDataXtd_FACES_ANGLE = 23
	TDataXtd_ROUND = 24
	TDataXtd_OFFSET = 25
TDataXtd_RADIUS = TDataXtd_ConstraintEnum.TDataXtd_RADIUS
TDataXtd_DIAMETER = TDataXtd_ConstraintEnum.TDataXtd_DIAMETER
TDataXtd_MINOR_RADIUS = TDataXtd_ConstraintEnum.TDataXtd_MINOR_RADIUS
TDataXtd_MAJOR_RADIUS = TDataXtd_ConstraintEnum.TDataXtd_MAJOR_RADIUS
TDataXtd_TANGENT = TDataXtd_ConstraintEnum.TDataXtd_TANGENT
TDataXtd_PARALLEL = TDataXtd_ConstraintEnum.TDataXtd_PARALLEL
TDataXtd_PERPENDICULAR = TDataXtd_ConstraintEnum.TDataXtd_PERPENDICULAR
TDataXtd_CONCENTRIC = TDataXtd_ConstraintEnum.TDataXtd_CONCENTRIC
TDataXtd_COINCIDENT = TDataXtd_ConstraintEnum.TDataXtd_COINCIDENT
TDataXtd_DISTANCE = TDataXtd_ConstraintEnum.TDataXtd_DISTANCE
TDataXtd_ANGLE = TDataXtd_ConstraintEnum.TDataXtd_ANGLE
TDataXtd_EQUAL_RADIUS = TDataXtd_ConstraintEnum.TDataXtd_EQUAL_RADIUS
TDataXtd_SYMMETRY = TDataXtd_ConstraintEnum.TDataXtd_SYMMETRY
TDataXtd_MIDPOINT = TDataXtd_ConstraintEnum.TDataXtd_MIDPOINT
TDataXtd_EQUAL_DISTANCE = TDataXtd_ConstraintEnum.TDataXtd_EQUAL_DISTANCE
TDataXtd_FIX = TDataXtd_ConstraintEnum.TDataXtd_FIX
TDataXtd_RIGID = TDataXtd_ConstraintEnum.TDataXtd_RIGID
TDataXtd_FROM = TDataXtd_ConstraintEnum.TDataXtd_FROM
TDataXtd_AXIS = TDataXtd_ConstraintEnum.TDataXtd_AXIS
TDataXtd_MATE = TDataXtd_ConstraintEnum.TDataXtd_MATE
TDataXtd_ALIGN_FACES = TDataXtd_ConstraintEnum.TDataXtd_ALIGN_FACES
TDataXtd_ALIGN_AXES = TDataXtd_ConstraintEnum.TDataXtd_ALIGN_AXES
TDataXtd_AXES_ANGLE = TDataXtd_ConstraintEnum.TDataXtd_AXES_ANGLE
TDataXtd_FACES_ANGLE = TDataXtd_ConstraintEnum.TDataXtd_FACES_ANGLE
TDataXtd_ROUND = TDataXtd_ConstraintEnum.TDataXtd_ROUND
TDataXtd_OFFSET = TDataXtd_ConstraintEnum.TDataXtd_OFFSET

class TDataXtd_GeometryEnum(IntEnum):
	TDataXtd_ANY_GEOM = 0
	TDataXtd_POINT = 1
	TDataXtd_LINE = 2
	TDataXtd_CIRCLE = 3
	TDataXtd_ELLIPSE = 4
	TDataXtd_SPLINE = 5
	TDataXtd_PLANE = 6
	TDataXtd_CYLINDER = 7
TDataXtd_ANY_GEOM = TDataXtd_GeometryEnum.TDataXtd_ANY_GEOM
TDataXtd_POINT = TDataXtd_GeometryEnum.TDataXtd_POINT
TDataXtd_LINE = TDataXtd_GeometryEnum.TDataXtd_LINE
TDataXtd_CIRCLE = TDataXtd_GeometryEnum.TDataXtd_CIRCLE
TDataXtd_ELLIPSE = TDataXtd_GeometryEnum.TDataXtd_ELLIPSE
TDataXtd_SPLINE = TDataXtd_GeometryEnum.TDataXtd_SPLINE
TDataXtd_PLANE = TDataXtd_GeometryEnum.TDataXtd_PLANE
TDataXtd_CYLINDER = TDataXtd_GeometryEnum.TDataXtd_CYLINDER
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TDataXtd_Axis)
%wrap_handle(TDataXtd_Constraint)
%wrap_handle(TDataXtd_Geometry)
%wrap_handle(TDataXtd_Pattern)
%wrap_handle(TDataXtd_Placement)
%wrap_handle(TDataXtd_Plane)
%wrap_handle(TDataXtd_Point)
%wrap_handle(TDataXtd_Position)
%wrap_handle(TDataXtd_Presentation)
%wrap_handle(TDataXtd_Shape)
%wrap_handle(TDataXtd_Triangulation)
%wrap_handle(TDataXtd_PatternStd)
/* end handles declaration */

/* templates */
%template(TDataXtd_Array1OfTrsf) NCollection_Array1<gp_Trsf>;
Array1ExtendIter(gp_Trsf)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<gp_Trsf> TDataXtd_Array1OfTrsf;
typedef NCollection_HArray1<gp_Trsf> TDataXtd_HArray1OfTrsf;
/* end typedefs declaration */

/*****************
* class TDataXtd *
*****************/
%rename(tdataxtd) TDataXtd;
class TDataXtd {
	public:
		/****** TDataXtd::IDList ******/
		/****** md5 signature: 13c09c8b61f14a9cf4c6ae6a05704f7d ******/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "
Parameters
----------
anIDList: TDF_IDList

Return
-------
None

Description
-----------
Appends to <anIDList> the list of the attributes IDs of this package. CAUTION: <anIDList> is NOT cleared before use. Print of TDataExt enumeration =============================.
") IDList;
		static void IDList(TDF_IDList & anIDList);

		/****** TDataXtd::Print ******/
		/****** md5 signature: b887e0f1c5d77aad7c10be1a19a24553 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
GEO: TDataXtd_GeometryEnum

Return
-------
S: Standard_OStream

Description
-----------
Prints the name of the geometry dimension <GEO> as a String on the Stream <S> and returns <S>.
") Print;
		static Standard_OStream & Print(const TDataXtd_GeometryEnum GEO, std::ostream &OutValue);

		/****** TDataXtd::Print ******/
		/****** md5 signature: 8cb942ce210f9a734cdf2fc0bed8e8c5 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
CTR: TDataXtd_ConstraintEnum

Return
-------
S: Standard_OStream

Description
-----------
Prints the name of the constraint <CTR> as a String on the Stream <S> and returns <S>.
") Print;
		static Standard_OStream & Print(const TDataXtd_ConstraintEnum CTR, std::ostream &OutValue);

};


%extend TDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDataXtd_Axis *
**********************/
class TDataXtd_Axis : public TDataStd_GenericEmpty {
	public:
		/****** TDataXtd_Axis::TDataXtd_Axis ******/
		/****** md5 signature: d37822b554190af63ff371da2e2d369d ******/
		%feature("compactdefaultargs") TDataXtd_Axis;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataXtd_Axis;
		 TDataXtd_Axis();

		/****** TDataXtd_Axis::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Axis::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= Returns the GUID for an axis.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Axis::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Axis::Set ******/
		/****** md5 signature: a57f6ee26f8dc80f8f292dc25a522351 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataXtd_Axis>

Description
-----------
Finds or creates an axis attribute defined by the label. In the case of a creation of an axis, a compatible named shape should already be associated with label. Exceptions Standard_NullObject if no compatible named shape is associated with the label.
") Set;
		static opencascade::handle<TDataXtd_Axis> Set(const TDF_Label & label);

		/****** TDataXtd_Axis::Set ******/
		/****** md5 signature: b8936a975096f254d7723165a974adbd ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
L: gp_Lin

Return
-------
opencascade::handle<TDataXtd_Axis>

Description
-----------
Axis methods ============.
") Set;
		static opencascade::handle<TDataXtd_Axis> Set(const TDF_Label & label, const gp_Lin & L);

};


%make_alias(TDataXtd_Axis)

%extend TDataXtd_Axis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDataXtd_Constraint *
****************************/
class TDataXtd_Constraint : public TDF_Attribute {
	public:
		/****** TDataXtd_Constraint::TDataXtd_Constraint ******/
		/****** md5 signature: ba09b721464df20354871d687eb36548 ******/
		%feature("compactdefaultargs") TDataXtd_Constraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataXtd_Constraint;
		 TDataXtd_Constraint();

		/****** TDataXtd_Constraint::ClearGeometries ******/
		/****** md5 signature: 0ae37dcba2df4c4e24c7aa924bf6a875 ******/
		%feature("compactdefaultargs") ClearGeometries;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the geometries involved in the constraint or dimension from the array of topological attributes where they are stored.
") ClearGeometries;
		void ClearGeometries();

		/****** TDataXtd_Constraint::CollectChildConstraints ******/
		/****** md5 signature: 985a2bedd7d4bec6368646c8e1b47d6f ******/
		%feature("compactdefaultargs") CollectChildConstraints;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
TheList: TDF_LabelList

Return
-------
None

Description
-----------
collects constraints on Childs for label <aLabel>.
") CollectChildConstraints;
		static void CollectChildConstraints(const TDF_Label & aLabel, TDF_LabelList & TheList);

		/****** TDataXtd_Constraint::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Constraint::GetGeometry ******/
		/****** md5 signature: 4f9d6e3de4c35781e3f1dbe964a3d08b ******/
		%feature("compactdefaultargs") GetGeometry;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns the integer index Index used to access the array of the constraint or stored geometries of a dimension Index has a value between 1 and 4. methods to write constraint fields (use builder) ==================================.
") GetGeometry;
		opencascade::handle<TNaming_NamedShape> GetGeometry(const int Index);

		/****** TDataXtd_Constraint::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the GUID for constraints.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Constraint::GetPlane ******/
		/****** md5 signature: 53b6eb87993d5db144ed04f77438f057 ******/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns the topological attribute of the plane used for planar - i.e., 2D - constraints. This plane is attached to another label. If the constraint is not planar, in other words, 3D, this function will return a null handle.
") GetPlane;
		const opencascade::handle<TNaming_NamedShape> & GetPlane();

		/****** TDataXtd_Constraint::GetType ******/
		/****** md5 signature: 7479148dd7d1d3e76ebd03c19ed9ea13 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
TDataXtd_ConstraintEnum

Description
-----------
Returns the type of constraint. This will be an element of the TDataXtd_ConstraintEnum enumeration.
") GetType;
		TDataXtd_ConstraintEnum GetType();

		/****** TDataXtd_Constraint::GetValue ******/
		/****** md5 signature: 41a61cf36b4a49e99c838ac9f7c300e4 ******/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_Real>

Description
-----------
Returns the value of a dimension. This value is a reference to a TDataStd_Real attribute. If the attribute is not a dimension, this value will be 0. Use IsDimension to test this condition.
") GetValue;
		const opencascade::handle<TDataStd_Real> & GetValue();

		/****** TDataXtd_Constraint::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Constraint::Inverted ******/
		/****** md5 signature: a9374ee0a5fb12f687360207d2e3de7a ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "
Parameters
----------
status: bool

Return
-------
None

Description
-----------
No available documentation.
") Inverted;
		void Inverted(const bool status);

		/****** TDataXtd_Constraint::Inverted ******/
		/****** md5 signature: 22b198e26c1b1054dae457f489d4fe40 ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Inverted;
		bool Inverted();

		/****** TDataXtd_Constraint::IsDimension ******/
		/****** md5 signature: f92e5e6d2d3f14b42a54020355ac8cd5 ******/
		%feature("compactdefaultargs") IsDimension;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this constraint attribute is a dimension, and therefore has a value.
") IsDimension;
		bool IsDimension();

		/****** TDataXtd_Constraint::IsPlanar ******/
		/****** md5 signature: c03409b1e65292924072df1474949f2b ******/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this constraint attribute is two-dimensional.
") IsPlanar;
		bool IsPlanar();

		/****** TDataXtd_Constraint::NbGeometries ******/
		/****** md5 signature: 3360061a4ae99346231d9e7853fad6af ******/
		%feature("compactdefaultargs") NbGeometries;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of geometry attributes in this constraint attribute. This number will be between 1 and 4.
") NbGeometries;
		int NbGeometries();

		/****** TDataXtd_Constraint::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataXtd_Constraint::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataXtd_Constraint::References ******/
		/****** md5 signature: 3409f0ad6db182e1a72fab7b19e8b252 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
DS: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataXtd_Constraint::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataXtd_Constraint::Reversed ******/
		/****** md5 signature: fb8bc7090b9d01db25f7f45ea87ee94b ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "
Parameters
----------
status: bool

Return
-------
None

Description
-----------
No available documentation.
") Reversed;
		void Reversed(const bool status);

		/****** TDataXtd_Constraint::Reversed ******/
		/****** md5 signature: e79c249fa69d975229e2f1cf1552a65d ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Reversed;
		bool Reversed();

		/****** TDataXtd_Constraint::Set ******/
		/****** md5 signature: 82231007e5e6a0bf4c6231f0f9ded144 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataXtd_Constraint>

Description
-----------
Finds or creates the 2D constraint attribute defined by the planar topological attribute plane and the label label. Constraint methods ==================.
") Set;
		static opencascade::handle<TDataXtd_Constraint> Set(const TDF_Label & label);

		/****** TDataXtd_Constraint::Set ******/
		/****** md5 signature: 0bde4eb175da61ec14f6955f49e6b484 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
type: TDataXtd_ConstraintEnum
G1: TNaming_NamedShape

Return
-------
None

Description
-----------
Finds or creates the constraint attribute defined by the topological attribute G1 and the constraint type type.
") Set;
		void Set(const TDataXtd_ConstraintEnum type, const opencascade::handle<TNaming_NamedShape> & G1);

		/****** TDataXtd_Constraint::Set ******/
		/****** md5 signature: af7801346e43167cb8716edd62f36854 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
type: TDataXtd_ConstraintEnum
G1: TNaming_NamedShape
G2: TNaming_NamedShape

Return
-------
None

Description
-----------
Finds or creates the constraint attribute defined by the topological attributes G1 and G2, and by the constraint type type.
") Set;
		void Set(const TDataXtd_ConstraintEnum type, const opencascade::handle<TNaming_NamedShape> & G1, const opencascade::handle<TNaming_NamedShape> & G2);

		/****** TDataXtd_Constraint::Set ******/
		/****** md5 signature: 601a8919cd1a7bceedd4fcb704092bb0 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
type: TDataXtd_ConstraintEnum
G1: TNaming_NamedShape
G2: TNaming_NamedShape
G3: TNaming_NamedShape

Return
-------
None

Description
-----------
Finds or creates the constraint attribute defined by the topological attributes G1, G2 and G3, and by the constraint type type.
") Set;
		void Set(const TDataXtd_ConstraintEnum type, const opencascade::handle<TNaming_NamedShape> & G1, const opencascade::handle<TNaming_NamedShape> & G2, const opencascade::handle<TNaming_NamedShape> & G3);

		/****** TDataXtd_Constraint::Set ******/
		/****** md5 signature: 18cb4b5af28a3cfc7ad2f2ec428dab2f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
type: TDataXtd_ConstraintEnum
G1: TNaming_NamedShape
G2: TNaming_NamedShape
G3: TNaming_NamedShape
G4: TNaming_NamedShape

Return
-------
None

Description
-----------
Finds or creates the constraint attribute defined by the topological attributes G1, G2, G3 and G4, and by the constraint type type. methods to read constraint fields =================================.
") Set;
		void Set(const TDataXtd_ConstraintEnum type, const opencascade::handle<TNaming_NamedShape> & G1, const opencascade::handle<TNaming_NamedShape> & G2, const opencascade::handle<TNaming_NamedShape> & G3, const opencascade::handle<TNaming_NamedShape> & G4);

		/****** TDataXtd_Constraint::SetGeometry ******/
		/****** md5 signature: 300d5c78aaccea6ec8e228eef5a6048e ******/
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", "
Parameters
----------
Index: int
G: TNaming_NamedShape

Return
-------
None

Description
-----------
Finds or creates the underlying geometry of the constraint defined by the topological attribute G and the integer index Index.
") SetGeometry;
		void SetGeometry(const int Index, const opencascade::handle<TNaming_NamedShape> & G);

		/****** TDataXtd_Constraint::SetPlane ******/
		/****** md5 signature: 474c1717fb20f690b7b49c4b1afd120e ******/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "
Parameters
----------
plane: TNaming_NamedShape

Return
-------
None

Description
-----------
Finds or creates the plane of the 2D constraint attribute, defined by the planar topological attribute plane.
") SetPlane;
		void SetPlane(const opencascade::handle<TNaming_NamedShape> & plane);

		/****** TDataXtd_Constraint::SetType ******/
		/****** md5 signature: f302c9b8d4d1e774ccd77d8548c8bd92 ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
CTR: TDataXtd_ConstraintEnum

Return
-------
None

Description
-----------
Finds or creates the type of constraint CTR.
") SetType;
		void SetType(const TDataXtd_ConstraintEnum CTR);

		/****** TDataXtd_Constraint::SetValue ******/
		/****** md5 signature: dab0d141cbfbc53ad648529624364956 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
V: TDataStd_Real

Return
-------
None

Description
-----------
Finds or creates the real number value V of the dimension constraint attribute.
") SetValue;
		void SetValue(const opencascade::handle<TDataStd_Real> & V);

		/****** TDataXtd_Constraint::Verified ******/
		/****** md5 signature: 425d65505f0b3fe9ff46fff1afdfca23 ******/
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this constraint attribute is valid. By default, true is returned. When the value of a dimension is changed or when a geometry is moved, false is returned until the solver sets it back to true.
") Verified;
		bool Verified();

		/****** TDataXtd_Constraint::Verified ******/
		/****** md5 signature: a7badb4b9b2b9effac4b07d5de3360e8 ******/
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "
Parameters
----------
status: bool

Return
-------
None

Description
-----------
Returns true if this constraint attribute defined by status is valid. By default, true is returned. When the value of a dimension is changed or when a geometry is moved, false is returned until the solver sets it back to true. If status is false, Verified is set to false.
") Verified;
		void Verified(const bool status);

};


%make_alias(TDataXtd_Constraint)

%extend TDataXtd_Constraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDataXtd_Geometry *
**************************/
class TDataXtd_Geometry : public TDF_Attribute {
	public:
		/****** TDataXtd_Geometry::TDataXtd_Geometry ******/
		/****** md5 signature: b8974b13707ba244045c3d0306541bbd ******/
		%feature("compactdefaultargs") TDataXtd_Geometry;
		%feature("autodoc", "Return
-------
None

Description
-----------
This and the next methods are used to retrieve underlying geometry of the NamedShape, even if no Geometry Attribute is associated. if not found or not compliant geometry return False.
") TDataXtd_Geometry;
		 TDataXtd_Geometry();

		/****** TDataXtd_Geometry::Axis ******/
		/****** md5 signature: f61ff7f3b08c84f8b95f59aff762ef7a ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
G: gp_Ax1

Return
-------
bool

Description
-----------
Returns the axis attribute defined by the label L and the axis G.
") Axis;
		static bool Axis(const TDF_Label & L, gp_Ax1 & G);

		/****** TDataXtd_Geometry::Axis ******/
		/****** md5 signature: d481f6c2f445e8199ffaaa7b15518414 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "
Parameters
----------
S: TNaming_NamedShape
G: gp_Ax1

Return
-------
bool

Description
-----------
Returns the axis attribute defined by the topological attribute S and the axis G.
") Axis;
		static bool Axis(const opencascade::handle<TNaming_NamedShape> & S, gp_Ax1 & G);

		/****** TDataXtd_Geometry::Circle ******/
		/****** md5 signature: 9533d246caebac9243bf51d38da595b0 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
G: gp_Circ

Return
-------
bool

Description
-----------
Returns the circle attribute defined by the label L and the circle G.
") Circle;
		static bool Circle(const TDF_Label & L, gp_Circ & G);

		/****** TDataXtd_Geometry::Circle ******/
		/****** md5 signature: 6e1886373890f1bfe5fefcb3287db458 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
S: TNaming_NamedShape
G: gp_Circ

Return
-------
bool

Description
-----------
Returns the circle attribute defined by the topological attribute S and the circle G.
") Circle;
		static bool Circle(const opencascade::handle<TNaming_NamedShape> & S, gp_Circ & G);

		/****** TDataXtd_Geometry::Cylinder ******/
		/****** md5 signature: 15c85af6d626f2c2200cf54a20b83087 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
G: gp_Cylinder

Return
-------
bool

Description
-----------
Returns the cylinder attribute defined by the label L and the cylinder G.
") Cylinder;
		static bool Cylinder(const TDF_Label & L, gp_Cylinder & G);

		/****** TDataXtd_Geometry::Cylinder ******/
		/****** md5 signature: f75bf456e8c17014fd751214964a494b ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "
Parameters
----------
S: TNaming_NamedShape
G: gp_Cylinder

Return
-------
bool

Description
-----------
Returns the cylinder attribute defined by the topological attribute S and the cylinder G.
") Cylinder;
		static bool Cylinder(const opencascade::handle<TNaming_NamedShape> & S, gp_Cylinder & G);

		/****** TDataXtd_Geometry::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Geometry::Ellipse ******/
		/****** md5 signature: cc2af7115755f9497deb5c82ea2b7e22 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
G: gp_Elips

Return
-------
bool

Description
-----------
Returns the ellipse attribute defined by the label L and the ellipse G.
") Ellipse;
		static bool Ellipse(const TDF_Label & L, gp_Elips & G);

		/****** TDataXtd_Geometry::Ellipse ******/
		/****** md5 signature: 0e3b5a6800d9a4f2aff235a51a53f78c ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
S: TNaming_NamedShape
G: gp_Elips

Return
-------
bool

Description
-----------
Returns the ellipse attribute defined by the topological attribute S and the ellipse G.
") Ellipse;
		static bool Ellipse(const opencascade::handle<TNaming_NamedShape> & S, gp_Elips & G);

		/****** TDataXtd_Geometry::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the GUID for geometry attributes.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Geometry::GetType ******/
		/****** md5 signature: cefb60883c8f1681f34961b1dc86ce83 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
TDataXtd_GeometryEnum

Description
-----------
Returns the type of geometric construction.
") GetType;
		TDataXtd_GeometryEnum GetType();

		/****** TDataXtd_Geometry::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Geometry::Line ******/
		/****** md5 signature: 8bcaf63b0afdf690508cab5d3fe14762 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
G: gp_Lin

Return
-------
bool

Description
-----------
Returns the line attribute defined by the label L and the line G.
") Line;
		static bool Line(const TDF_Label & L, gp_Lin & G);

		/****** TDataXtd_Geometry::Line ******/
		/****** md5 signature: 9a3ec0cf3d909908d26c8a322718de62 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
S: TNaming_NamedShape
G: gp_Lin

Return
-------
bool

Description
-----------
Returns the line attribute defined by the topological attribute S and the line G.
") Line;
		static bool Line(const opencascade::handle<TNaming_NamedShape> & S, gp_Lin & G);

		/****** TDataXtd_Geometry::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataXtd_Geometry::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataXtd_Geometry::Plane ******/
		/****** md5 signature: 5ba06f9a7ddd44805a9273e5588aa153 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
G: gp_Pln

Return
-------
bool

Description
-----------
Returns the plane attribute defined by the label L and the plane G.
") Plane;
		static bool Plane(const TDF_Label & L, gp_Pln & G);

		/****** TDataXtd_Geometry::Plane ******/
		/****** md5 signature: ca245de1c84b0360a28934ffb042fbff ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "
Parameters
----------
S: TNaming_NamedShape
G: gp_Pln

Return
-------
bool

Description
-----------
Returns the plane attribute defined by the topological attribute S and the plane G.
") Plane;
		static bool Plane(const opencascade::handle<TNaming_NamedShape> & S, gp_Pln & G);

		/****** TDataXtd_Geometry::Point ******/
		/****** md5 signature: 9190cb101c864f93eff3b60950414316 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
G: gp_Pnt

Return
-------
bool

Description
-----------
Returns the point attribute defined by the label L and the point G.
") Point;
		static bool Point(const TDF_Label & L, gp_Pnt & G);

		/****** TDataXtd_Geometry::Point ******/
		/****** md5 signature: ae6561b8b37ec6635a85623a4c1f1936 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
S: TNaming_NamedShape
G: gp_Pnt

Return
-------
bool

Description
-----------
Returns the point attribute defined by the topological attribute S and the point G.
") Point;
		static bool Point(const opencascade::handle<TNaming_NamedShape> & S, gp_Pnt & G);

		/****** TDataXtd_Geometry::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TDataXtd_Geometry::Set ******/
		/****** md5 signature: 65116b6d58e86dec95b155571880c5e2 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataXtd_Geometry>

Description
-----------
API class methods ================= Finds, or creates, a Geometry attribute defined by the label label. The default type of geometry is the value ANY_GEOM of the enumeration TDataXtd_GeometryEnum. To specify another value of this enumeration, use the function SetType.
") Set;
		static opencascade::handle<TDataXtd_Geometry> Set(const TDF_Label & label);

		/****** TDataXtd_Geometry::SetType ******/
		/****** md5 signature: 1bd4e987f8e6ed02dff61f37899e3c74 ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
T: TDataXtd_GeometryEnum

Return
-------
None

Description
-----------
Returns the type of geometric construction T of this attribute. T will be a value of the enumeration TDataXtd_GeometryEnum.
") SetType;
		void SetType(const TDataXtd_GeometryEnum T);

		/****** TDataXtd_Geometry::Type ******/
		/****** md5 signature: ac0513ea4e97eb2fec5e5f46b0a56398 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
TDataXtd_GeometryEnum

Description
-----------
Returns the label L used to define the type of geometric construction for the geometry attribute.
") Type;
		static TDataXtd_GeometryEnum Type(const TDF_Label & L);

		/****** TDataXtd_Geometry::Type ******/
		/****** md5 signature: d1bad04b8ee22ab5e9f1cb61ed815447 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
S: TNaming_NamedShape

Return
-------
TDataXtd_GeometryEnum

Description
-----------
Returns the topological attribute S used to define the type of geometric construction for the geometry attribute.
") Type;
		static TDataXtd_GeometryEnum Type(const opencascade::handle<TNaming_NamedShape> & S);

};


%make_alias(TDataXtd_Geometry)

%extend TDataXtd_Geometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TDataXtd_Pattern *
*************************/
%nodefaultctor TDataXtd_Pattern;
class TDataXtd_Pattern : public TDF_Attribute {
	public:
		/****** TDataXtd_Pattern::ComputeTrsfs ******/
		/****** md5 signature: 29c069b776b5043588acfa1a5008786a ******/
		%feature("compactdefaultargs") ComputeTrsfs;
		%feature("autodoc", "
Parameters
----------
Trsfs: NCollection_Array1<gp_Trsf>

Return
-------
None

Description
-----------
Give the transformations.
") ComputeTrsfs;
		virtual void ComputeTrsfs(NCollection_Array1<gp_Trsf> & Trsfs);

		/****** TDataXtd_Pattern::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Pattern::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Pattern::NbTrsfs ******/
		/****** md5 signature: 96e08fe3d015197e4ca4850d9b5ed37b ******/
		%feature("compactdefaultargs") NbTrsfs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of transformation.
") NbTrsfs;
		virtual int NbTrsfs();

		/****** TDataXtd_Pattern::PatternID ******/
		/****** md5 signature: c7631383b69a6428ee1765b5abfe7cbf ******/
		%feature("compactdefaultargs") PatternID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute.
") PatternID;
		virtual const Standard_GUID & PatternID();

};


%make_alias(TDataXtd_Pattern)

%extend TDataXtd_Pattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDataXtd_Placement *
***************************/
class TDataXtd_Placement : public TDataStd_GenericEmpty {
	public:
		/****** TDataXtd_Placement::TDataXtd_Placement ******/
		/****** md5 signature: 6c8f7f528efec08bb8589703e1543072 ******/
		%feature("compactdefaultargs") TDataXtd_Placement;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataXtd_Placement;
		 TDataXtd_Placement();

		/****** TDataXtd_Placement::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Placement::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods =============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Placement::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Placement::Set ******/
		/****** md5 signature: 00ad14199476dd8efb4e6fb1cb87dcd7 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataXtd_Placement>

Description
-----------
Find, or create, a Placement attribute. Placement attribute is returned. Placement methods =================.
") Set;
		static opencascade::handle<TDataXtd_Placement> Set(const TDF_Label & label);

};


%make_alias(TDataXtd_Placement)

%extend TDataXtd_Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TDataXtd_Plane *
***********************/
class TDataXtd_Plane : public TDataStd_GenericEmpty {
	public:
		/****** TDataXtd_Plane::TDataXtd_Plane ******/
		/****** md5 signature: 9f77a08999233941b32c343f160d4529 ******/
		%feature("compactdefaultargs") TDataXtd_Plane;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataXtd_Plane;
		 TDataXtd_Plane();

		/****** TDataXtd_Plane::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Plane::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= //! Returns the GUID for plane attributes.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Plane::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Plane::Set ******/
		/****** md5 signature: 8970a215afd1ef102a4adb9489b2403e ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataXtd_Plane>

Description
-----------
Finds or creates the plane attribute defined by the label label. Warning If you are creating the attribute with this syntax, a planar face should already be associated with label.
") Set;
		static opencascade::handle<TDataXtd_Plane> Set(const TDF_Label & label);

		/****** TDataXtd_Plane::Set ******/
		/****** md5 signature: 748cce90c51abf21cfb91789090907fc ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
P: gp_Pln

Return
-------
opencascade::handle<TDataXtd_Plane>

Description
-----------
Finds, or creates, a Plane attribute and sets <P> as generated the associated NamedShape. Plane methods =============.
") Set;
		static opencascade::handle<TDataXtd_Plane> Set(const TDF_Label & label, const gp_Pln & P);

};


%make_alias(TDataXtd_Plane)

%extend TDataXtd_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TDataXtd_Point *
***********************/
class TDataXtd_Point : public TDataStd_GenericEmpty {
	public:
		/****** TDataXtd_Point::TDataXtd_Point ******/
		/****** md5 signature: 1b0958f86dad9ecd88e14351ed0b3f5d ******/
		%feature("compactdefaultargs") TDataXtd_Point;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataXtd_Point;
		 TDataXtd_Point();

		/****** TDataXtd_Point::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Point::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= //! Returns the GUID for point attributes.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Point::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Point::Set ******/
		/****** md5 signature: 636d613604a73ff47bd5beab7e7e6975 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataXtd_Point>

Description
-----------
Sets the label Label as a point attribute. If no object is found, a point attribute is created.
") Set;
		static opencascade::handle<TDataXtd_Point> Set(const TDF_Label & label);

		/****** TDataXtd_Point::Set ******/
		/****** md5 signature: f2f12dc39c6780134b5acd9d12a01987 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
P: gp_Pnt

Return
-------
opencascade::handle<TDataXtd_Point>

Description
-----------
Sets the label Label as a point attribute containing the point P. If no object is found, a point attribute is created. Point methods =============.
") Set;
		static opencascade::handle<TDataXtd_Point> Set(const TDF_Label & label, const gp_Pnt & P);

};


%make_alias(TDataXtd_Point)

%extend TDataXtd_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDataXtd_Position *
**************************/
class TDataXtd_Position : public TDF_Attribute {
	public:
		/****** TDataXtd_Position::TDataXtd_Position ******/
		/****** md5 signature: b0a53799e1b5fbd66b3bb4616b2af5ca ******/
		%feature("compactdefaultargs") TDataXtd_Position;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataXtd_Position;
		 TDataXtd_Position();

		/****** TDataXtd_Position::Get ******/
		/****** md5 signature: fee35fd82f04f972c18d37a4bf0d019a ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aPos: gp_Pnt

Return
-------
bool

Description
-----------
Search label <aLabel) for the TDataXtd_Position attribute and get its position if found returns True.
") Get;
		static bool Get(const TDF_Label & aLabel, gp_Pnt & aPos);

		/****** TDataXtd_Position::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Position::GetPosition ******/
		/****** md5 signature: 4006515e473ac2973320f8ab9aa40167 ******/
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") GetPosition;
		const gp_Pnt GetPosition();

		/****** TDataXtd_Position::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Position::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty attribute from the good end type. It is used by the copy algorithm.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataXtd_Position::Paste ******/
		/****** md5 signature: ca00147c679ec8fdf08d12c6ca321a64 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
intoAttribute: TDF_Attribute
aRelocTationable: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****** TDataXtd_Position::Restore ******/
		/****** md5 signature: 41c5f809a59ee36fde865c853768ba6f ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDataXtd_Position::Set ******/
		/****** md5 signature: e0564f75f82af7c65f1d9b89f8e1232a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aPos: gp_Pnt

Return
-------
None

Description
-----------
Create if not found the TDataXtd_Position attribute set its position to <aPos>.
") Set;
		static void Set(const TDF_Label & aLabel, const gp_Pnt & aPos);

		/****** TDataXtd_Position::Set ******/
		/****** md5 signature: 5d2dd421fff031c4cc2c46a6fc935a8c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
opencascade::handle<TDataXtd_Position>

Description
-----------
Find an existing, or create an empty, Position. the Position attribute is returned.
") Set;
		static opencascade::handle<TDataXtd_Position> Set(const TDF_Label & aLabel);

		/****** TDataXtd_Position::SetPosition ******/
		/****** md5 signature: 832a8f3118de3b8c302b0ee3ce94b787 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
aPos: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetPosition;
		void SetPosition(const gp_Pnt & aPos);

};


%make_alias(TDataXtd_Position)

%extend TDataXtd_Position {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDataXtd_Presentation *
******************************/
class TDataXtd_Presentation : public TDF_Attribute {
	public:
		/****** TDataXtd_Presentation::TDataXtd_Presentation ******/
		/****** md5 signature: 100517e7455655aa1566718b13ab74d5 ******/
		%feature("compactdefaultargs") TDataXtd_Presentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") TDataXtd_Presentation;
		 TDataXtd_Presentation();

		/****** TDataXtd_Presentation::AddSelectionMode ******/
		/****** md5 signature: 93f8db4a16ce5f33ce56141d19c3a2c3 ******/
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", "
Parameters
----------
theSelectionMode: int
theTransaction: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") AddSelectionMode;
		void AddSelectionMode(const int theSelectionMode, const bool theTransaction = true);

		/****** TDataXtd_Presentation::BackupCopy ******/
		/****** md5 signature: 37a7ca5257c3a9e95a9390edd8c74378 ******/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy();

		/****** TDataXtd_Presentation::Color ******/
		/****** md5 signature: 2e6350e3294b0d2b2e58bb8ded204984 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_NameOfColor

Description
-----------
No available documentation.
") Color;
		Quantity_NameOfColor Color();

		/****** TDataXtd_Presentation::GetDriverGUID ******/
		/****** md5 signature: 8cfb8f91ff622f4361276ad127a77d5c ******/
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the GUID of the driver managing display of associated AIS object.
") GetDriverGUID;
		Standard_GUID GetDriverGUID();

		/****** TDataXtd_Presentation::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Presentation::GetNbSelectionModes ******/
		/****** md5 signature: 99a39738238e4e23ef3a12766ba03ee4 ******/
		%feature("compactdefaultargs") GetNbSelectionModes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of selection modes of the attribute. It starts with 1 .. GetNbSelectionModes().
") GetNbSelectionModes;
		int GetNbSelectionModes();

		/****** TDataXtd_Presentation::HasOwnColor ******/
		/****** md5 signature: f303300f0264bf37055acb1e9fb7a2c2 ******/
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnColor;
		bool HasOwnColor();

		/****** TDataXtd_Presentation::HasOwnMaterial ******/
		/****** md5 signature: 8b5caa1f734d1508e3e2629c0a75f8d5 ******/
		%feature("compactdefaultargs") HasOwnMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnMaterial;
		bool HasOwnMaterial();

		/****** TDataXtd_Presentation::HasOwnMode ******/
		/****** md5 signature: 5fb7d03e8183a31fbf9e9f252e858666 ******/
		%feature("compactdefaultargs") HasOwnMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnMode;
		bool HasOwnMode();

		/****** TDataXtd_Presentation::HasOwnSelectionMode ******/
		/****** md5 signature: b7f3a7c9a0a1e03ab92ae4d194d7664e ******/
		%feature("compactdefaultargs") HasOwnSelectionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnSelectionMode;
		bool HasOwnSelectionMode();

		/****** TDataXtd_Presentation::HasOwnTransparency ******/
		/****** md5 signature: ff6189613aa25f291c98038cd6d052ec ******/
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnTransparency;
		bool HasOwnTransparency();

		/****** TDataXtd_Presentation::HasOwnWidth ******/
		/****** md5 signature: 38ab6940dfd75ba85e859f8a625bdcbd ******/
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnWidth;
		bool HasOwnWidth();

		/****** TDataXtd_Presentation::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Presentation::IsDisplayed ******/
		/****** md5 signature: e13849d6809fc79274538f37bcdcee34 ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDisplayed;
		bool IsDisplayed();

		/****** TDataXtd_Presentation::MaterialIndex ******/
		/****** md5 signature: 3d644e99eec4aa4dca7c8adc8b13254a ******/
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MaterialIndex;
		int MaterialIndex();

		/****** TDataXtd_Presentation::Mode ******/
		/****** md5 signature: d5d38b16c9c176c269e106cc4f03f640 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Mode;
		int Mode();

		/****** TDataXtd_Presentation::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty attribute from the good end type. It is used by the copy algorithm.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataXtd_Presentation::Paste ******/
		/****** md5 signature: ca00147c679ec8fdf08d12c6ca321a64 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
intoAttribute: TDF_Attribute
aRelocTationable: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****** TDataXtd_Presentation::Restore ******/
		/****** md5 signature: 41c5f809a59ee36fde865c853768ba6f ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDataXtd_Presentation::SelectionMode ******/
		/****** md5 signature: cfd3bc9d26b1f29e3b6bd48ec0a922c4 ******/
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "
Parameters
----------
index: int (optional, default to 1)

Return
-------
int

Description
-----------
No available documentation.
") SelectionMode;
		int SelectionMode(const int index = 1);

		/****** TDataXtd_Presentation::Set ******/
		/****** md5 signature: faa847644e3df3b0b51472eefd2c53fe ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theDriverId: Standard_GUID

Return
-------
opencascade::handle<TDataXtd_Presentation>

Description
-----------
Create if not found the TDataXtd_Presentation attribute and set its driver GUID.
") Set;
		static opencascade::handle<TDataXtd_Presentation> Set(const TDF_Label & theLabel, const Standard_GUID & theDriverId);

		/****** TDataXtd_Presentation::SetColor ******/
		/****** md5 signature: 83d3f4dd42be87fa7f7487635f8d52bb ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_NameOfColor

Return
-------
None

Description
-----------
No available documentation.
") SetColor;
		void SetColor(const Quantity_NameOfColor theColor);

		/****** TDataXtd_Presentation::SetDisplayed ******/
		/****** md5 signature: d49b0bcb81b767d2d8a288fb2f3c434d ******/
		%feature("compactdefaultargs") SetDisplayed;
		%feature("autodoc", "
Parameters
----------
theIsDisplayed: bool

Return
-------
None

Description
-----------
No available documentation.
") SetDisplayed;
		void SetDisplayed(const bool theIsDisplayed);

		/****** TDataXtd_Presentation::SetDriverGUID ******/
		/****** md5 signature: 1c4d545a092206ef51a3bd728b9e3342 ******/
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "
Parameters
----------
theGUID: Standard_GUID

Return
-------
None

Description
-----------
Sets the GUID of the driver managing display of associated AIS object.
") SetDriverGUID;
		void SetDriverGUID(const Standard_GUID & theGUID);

		/****** TDataXtd_Presentation::SetMaterialIndex ******/
		/****** md5 signature: 3091012697fd33d906710c3b721e7ab1 ******/
		%feature("compactdefaultargs") SetMaterialIndex;
		%feature("autodoc", "
Parameters
----------
theMaterialIndex: int

Return
-------
None

Description
-----------
No available documentation.
") SetMaterialIndex;
		void SetMaterialIndex(const int theMaterialIndex);

		/****** TDataXtd_Presentation::SetMode ******/
		/****** md5 signature: c1ad76d6ebccc46b32426f09aefa3bcd ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
No available documentation.
") SetMode;
		void SetMode(const int theMode);

		/****** TDataXtd_Presentation::SetSelectionMode ******/
		/****** md5 signature: 6b9b56ded1508c59a43f641e25f62159 ******/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "
Parameters
----------
theSelectionMode: int
theTransaction: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets selection mode. If 'theTransaction' flag is OFF, modification of the attribute doesn't influence the transaction mechanism (the attribute doesn't participate in undo/redo because of this modification). Certainly, if any other data of the attribute is modified (display mode, color, ...), the attribute will be included into undo/redo.
") SetSelectionMode;
		void SetSelectionMode(const int theSelectionMode, const bool theTransaction = true);

		/****** TDataXtd_Presentation::SetTransparency ******/
		/****** md5 signature: 15710179f010338d4ba072f4639fe9b7 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
No available documentation.
") SetTransparency;
		void SetTransparency(const double theValue);

		/****** TDataXtd_Presentation::SetWidth ******/
		/****** md5 signature: 21c65d91bdf13a0b7ee4810474c15ebb ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: double

Return
-------
None

Description
-----------
No available documentation.
") SetWidth;
		void SetWidth(const double theWidth);

		/****** TDataXtd_Presentation::Transparency ******/
		/****** md5 signature: 080317bfb744c0d6d6d612bb6c05010b ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Transparency;
		double Transparency();

		/****** TDataXtd_Presentation::Unset ******/
		/****** md5 signature: 3db95e6f5d9c4de74c387f4047f8beea ******/
		%feature("compactdefaultargs") Unset;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
None

Description
-----------
Remove attribute of this type from the label.
") Unset;
		static void Unset(const TDF_Label & theLabel);

		/****** TDataXtd_Presentation::UnsetColor ******/
		/****** md5 signature: 188f0bfeebabf5f6612a608155ee828e ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetColor;
		void UnsetColor();

		/****** TDataXtd_Presentation::UnsetMaterial ******/
		/****** md5 signature: c0ec6ffc2a0f74e3dfd084bbc939e3b7 ******/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetMaterial;
		void UnsetMaterial();

		/****** TDataXtd_Presentation::UnsetMode ******/
		/****** md5 signature: 1969d25bd6e2040bca56b4e996ca574d ******/
		%feature("compactdefaultargs") UnsetMode;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetMode;
		void UnsetMode();

		/****** TDataXtd_Presentation::UnsetSelectionMode ******/
		/****** md5 signature: 89ddc27e00f0154704c54c8a8362ad8a ******/
		%feature("compactdefaultargs") UnsetSelectionMode;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetSelectionMode;
		void UnsetSelectionMode();

		/****** TDataXtd_Presentation::UnsetTransparency ******/
		/****** md5 signature: c02684ffb7b785f45f8ce50a07ea682d ******/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetTransparency;
		void UnsetTransparency();

		/****** TDataXtd_Presentation::UnsetWidth ******/
		/****** md5 signature: 18cdd810cf848c52cf981cc677405046 ******/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetWidth;
		void UnsetWidth();

		/****** TDataXtd_Presentation::Width ******/
		/****** md5 signature: 1fd4c6d3d33fbd8b282f769785a59bae ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Width;
		double Width();

		/****** TDataXtd_Presentation::getColorNameFromOldEnum ******/
		/****** md5 signature: 144304eb22e2d6200c39ae9f2749d476 ******/
		%feature("compactdefaultargs") getColorNameFromOldEnum;
		%feature("autodoc", "
Parameters
----------
theOld: int

Return
-------
Quantity_NameOfColor

Description
-----------
Convert values of old Quantity_NameOfColor to new enumeration for reading old documents after #0030969 (Coding Rules - refactor Quantity_Color.cxx color table definition).
") getColorNameFromOldEnum;
		static Quantity_NameOfColor getColorNameFromOldEnum(int theOld);

		/****** TDataXtd_Presentation::getOldColorNameFromNewEnum ******/
		/****** md5 signature: 5da7e9532d9119fa84ba921686bd2743 ******/
		%feature("compactdefaultargs") getOldColorNameFromNewEnum;
		%feature("autodoc", "
Parameters
----------
theNew: Quantity_NameOfColor

Return
-------
int

Description
-----------
Convert Quantity_NameOfColor to old enumeration value for writing documents in compatible format.
") getOldColorNameFromNewEnum;
		static int getOldColorNameFromNewEnum(Quantity_NameOfColor theNew);

};


%make_alias(TDataXtd_Presentation)

%extend TDataXtd_Presentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TDataXtd_Shape *
***********************/
class TDataXtd_Shape : public TDataStd_GenericEmpty {
	public:
		/****** TDataXtd_Shape::TDataXtd_Shape ******/
		/****** md5 signature: 829556aaab1cefa67a3c7754214d6f9e ******/
		%feature("compactdefaultargs") TDataXtd_Shape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataXtd_Shape;
		 TDataXtd_Shape();

		/****** TDataXtd_Shape::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Shape::Find ******/
		/****** md5 signature: c2cb153c6bc9f5c893c2ff74d2377f54 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
current: TDF_Label
S: TDataXtd_Shape

Return
-------
bool

Description
-----------
class methods ============= try to retrieve a Shape attribute at <current> label or in fathers label of <current>. Returns True if found and set <S>.
") Find;
		static bool Find(const TDF_Label & current, opencascade::handle<TDataXtd_Shape> & S);

		/****** TDataXtd_Shape::Get ******/
		/****** md5 signature: 5d0e313c77f1091d6d9b4306d7aa333d ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
TopoDS_Shape

Description
-----------
the Shape from associated NamedShape attribute is returned.
") Get;
		static TopoDS_Shape Get(const TDF_Label & label);

		/****** TDataXtd_Shape::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Shape methods =============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Shape::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Shape::New ******/
		/****** md5 signature: aa830d8126113f57cc04852fa074dd7c ******/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataXtd_Shape>

Description
-----------
Find, or create, a Shape attribute. the Shape attribute is returned. Raises if <label> has attribute.
") New;
		static opencascade::handle<TDataXtd_Shape> New(const TDF_Label & label);

		/****** TDataXtd_Shape::References ******/
		/****** md5 signature: 3409f0ad6db182e1a72fab7b19e8b252 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
DS: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataXtd_Shape::Set ******/
		/****** md5 signature: 5c799b31c146f9513e3b35b06552f58b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
shape: TopoDS_Shape

Return
-------
opencascade::handle<TDataXtd_Shape>

Description
-----------
Create or update associated NamedShape attribute. the Shape attribute is returned.
") Set;
		static opencascade::handle<TDataXtd_Shape> Set(const TDF_Label & label, const TopoDS_Shape & shape);

};


%make_alias(TDataXtd_Shape)

%extend TDataXtd_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TDataXtd_Triangulation *
*******************************/
class TDataXtd_Triangulation : public TDF_Attribute {
	public:
		/****** TDataXtd_Triangulation::TDataXtd_Triangulation ******/
		/****** md5 signature: bee09c6a8c6d388acb27df035eccdb53 ******/
		%feature("compactdefaultargs") TDataXtd_Triangulation;
		%feature("autodoc", "Return
-------
None

Description
-----------
A constructor. Don't use it directly, use please the static method Set(), which returns the attribute attached to a label.
") TDataXtd_Triangulation;
		 TDataXtd_Triangulation();

		/****** TDataXtd_Triangulation::Deflection ******/
		/****** md5 signature: e399c9277ad47611bf921d7ddc9cf5f7 ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the deflection of this triangulation.
") Deflection;
		double Deflection();

		/****** TDataXtd_Triangulation::Deflection ******/
		/****** md5 signature: f0b8f72583aa7010a886d59247e25922 ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "
Parameters
----------
theDeflection: double

Return
-------
None

Description
-----------
Sets the deflection of this triangulation to theDeflection. See more on deflection in Polygon2D.
") Deflection;
		void Deflection(const double theDeflection);

		/****** TDataXtd_Triangulation::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Triangulation::Get ******/
		/****** md5 signature: 1b44a31d5fb6444cba54e6b97ce6cc73 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Returns the underlying triangulation.
") Get;
		const opencascade::handle<Poly_Triangulation> & Get();

		/****** TDataXtd_Triangulation::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the triangulation attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Triangulation::HasNormals ******/
		/****** md5 signature: 7b85da4e15282189c4164fb085476fe7 ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if nodal normals are defined.
") HasNormals;
		bool HasNormals();

		/****** TDataXtd_Triangulation::HasUVNodes ******/
		/****** md5 signature: f61b3a56c8b1d04652a7c83088309a08 ******/
		%feature("compactdefaultargs") HasUVNodes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if 2D nodes are associated with 3D nodes for this triangulation.
") HasUVNodes;
		bool HasUVNodes();

		/****** TDataXtd_Triangulation::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataXtd_Triangulation::NbNodes ******/
		/****** md5 signature: fda73b9559abc1f522e348d360b171ca ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return: the number of nodes for this triangulation.
") NbNodes;
		int NbNodes();

		/****** TDataXtd_Triangulation::NbTriangles ******/
		/****** md5 signature: f8c321c40dc1f5710c6325a5eef3d9fe ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return: the number of triangles for this triangulation.
") NbTriangles;
		int NbTriangles();

		/****** TDataXtd_Triangulation::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataXtd_Triangulation::Node ******/
		/****** md5 signature: a3d2ffc3b0734f343aea5c669d5b90ca ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
Return: node at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbNodes.
") Node;
		gp_Pnt Node(const int theIndex);

		/****** TDataXtd_Triangulation::Normal ******/
		/****** md5 signature: e01bf02e7597bb5cdd5c6e4faf12af87 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Dir

Description
-----------
Return: normal at the given index. Raises Standard_OutOfRange exception.
") Normal;
		gp_Dir Normal(const int theIndex);

		/****** TDataXtd_Triangulation::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataXtd_Triangulation::RemoveUVNodes ******/
		/****** md5 signature: 40045c3c77e535165bfc8c8523acf1d5 ******/
		%feature("compactdefaultargs") RemoveUVNodes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deallocates the UV nodes.
") RemoveUVNodes;
		void RemoveUVNodes();

		/****** TDataXtd_Triangulation::Restore ******/
		/****** md5 signature: e70635824d58f4ccb02d82fd91715d8f ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theAttribute: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttribute);

		/****** TDataXtd_Triangulation::Set ******/
		/****** md5 signature: 38170ebeace0c77f7aa7773082559515 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<TDataXtd_Triangulation>

Description
-----------
Finds or creates a triangulation attribute.
") Set;
		static opencascade::handle<TDataXtd_Triangulation> Set(const TDF_Label & theLabel);

		/****** TDataXtd_Triangulation::Set ******/
		/****** md5 signature: 62d5ab7c92e4f03ff1be0a4498c72c68 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theTriangulation: Poly_Triangulation

Return
-------
opencascade::handle<TDataXtd_Triangulation>

Description
-----------
Finds or creates a triangulation attribute. Initializes the attribute by a Poly_Triangulation object.
") Set;
		static opencascade::handle<TDataXtd_Triangulation> Set(const TDF_Label & theLabel, const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****** TDataXtd_Triangulation::Set ******/
		/****** md5 signature: 0d8f3fd57d28f7f381ea2452e55ff30a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Sets the triangulation.
") Set;
		void Set(const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****** TDataXtd_Triangulation::SetNode ******/
		/****** md5 signature: d199c7a55fe836e0c365e7f5b885cb6a ******/
		%feature("compactdefaultargs") SetNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNode: gp_Pnt

Return
-------
None

Description
-----------
The method differs from Poly_Triangulation! Sets a node at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbNodes.
") SetNode;
		void SetNode(const int theIndex, const gp_Pnt & theNode);

		/****** TDataXtd_Triangulation::SetNormal ******/
		/****** md5 signature: b33a61005887ce548aaeddceed24cdf7 ******/
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNormal: gp_Dir

Return
-------
None

Description
-----------
Changes normal at the given index. Raises Standard_OutOfRange exception.
") SetNormal;
		void SetNormal(const int theIndex, const gp_Dir & theNormal);

		/****** TDataXtd_Triangulation::SetTriangle ******/
		/****** md5 signature: 0316930ff2818bf94dd9c0d4baa3a07f ******/
		%feature("compactdefaultargs") SetTriangle;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theTriangle: Poly_Triangle

Return
-------
None

Description
-----------
The method differs from Poly_Triangulation! Sets a triangle at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbTriangles.
") SetTriangle;
		void SetTriangle(const int theIndex, const Poly_Triangle & theTriangle);

		/****** TDataXtd_Triangulation::SetUVNode ******/
		/****** md5 signature: 72ecabe91b6055c6fcdbe9c263e0e96d ******/
		%feature("compactdefaultargs") SetUVNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theUVNode: gp_Pnt2d

Return
-------
None

Description
-----------
The method differs from Poly_Triangulation! Sets a UVNode at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbNodes.
") SetUVNode;
		void SetUVNode(const int theIndex, const gp_Pnt2d & theUVNode);

		/****** TDataXtd_Triangulation::Triangle ******/
		/****** md5 signature: c7ee71fa8d7e737176bd1e0665ff4849 ******/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
Poly_Triangle

Description
-----------
Return: triangle at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbTriangles.
") Triangle;
		Poly_Triangle Triangle(const int theIndex);

		/****** TDataXtd_Triangulation::UVNode ******/
		/****** md5 signature: 0bd783746879a78ed1a04077daad1114 ******/
		%feature("compactdefaultargs") UVNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt2d

Description
-----------
Return: UVNode at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbNodes.
") UVNode;
		gp_Pnt2d UVNode(const int theIndex);

};


%make_alias(TDataXtd_Triangulation)

%extend TDataXtd_Triangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDataXtd_PatternStd *
****************************/
class TDataXtd_PatternStd : public TDataXtd_Pattern {
	public:
		/****** TDataXtd_PatternStd::TDataXtd_PatternStd ******/
		/****** md5 signature: eb30c537e69ff60395048253a153587a ******/
		%feature("compactdefaultargs") TDataXtd_PatternStd;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataXtd_PatternStd;
		 TDataXtd_PatternStd();

		/****** TDataXtd_PatternStd::Axis1 ******/
		/****** md5 signature: 86b0ae449d54b8f0ab860a15db5375d2 ******/
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", "
Parameters
----------
Axis1: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") Axis1;
		void Axis1(const opencascade::handle<TNaming_NamedShape> & Axis1);

		/****** TDataXtd_PatternStd::Axis1 ******/
		/****** md5 signature: b6f25709522c1266a9b53c97fa979e07 ******/
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") Axis1;
		opencascade::handle<TNaming_NamedShape> Axis1();

		/****** TDataXtd_PatternStd::Axis1Reversed ******/
		/****** md5 signature: adfc3002e8156725b4b9a4525bd61e2f ******/
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", "
Parameters
----------
Axis1Reversed: bool

Return
-------
None

Description
-----------
No available documentation.
") Axis1Reversed;
		void Axis1Reversed(const bool Axis1Reversed);

		/****** TDataXtd_PatternStd::Axis1Reversed ******/
		/****** md5 signature: 26328a2c2895f60b97716fb70cfa7a77 ******/
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Axis1Reversed;
		bool Axis1Reversed();

		/****** TDataXtd_PatternStd::Axis2 ******/
		/****** md5 signature: b14f0654201cbdbf84ba0dcc3c23d506 ******/
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "
Parameters
----------
Axis2: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") Axis2;
		void Axis2(const opencascade::handle<TNaming_NamedShape> & Axis2);

		/****** TDataXtd_PatternStd::Axis2 ******/
		/****** md5 signature: ada3a430ef271e1853c684d660603ea2 ******/
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") Axis2;
		opencascade::handle<TNaming_NamedShape> Axis2();

		/****** TDataXtd_PatternStd::Axis2Reversed ******/
		/****** md5 signature: 2140dcdd8b0155b508a295431c77107f ******/
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", "
Parameters
----------
Axis2Reversed: bool

Return
-------
None

Description
-----------
No available documentation.
") Axis2Reversed;
		void Axis2Reversed(const bool Axis2Reversed);

		/****** TDataXtd_PatternStd::Axis2Reversed ******/
		/****** md5 signature: f4865241b5bfe4ccf42fd4d05fc19c68 ******/
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Axis2Reversed;
		bool Axis2Reversed();

		/****** TDataXtd_PatternStd::ComputeTrsfs ******/
		/****** md5 signature: cf8bce458f2768115d4d209d6742ba44 ******/
		%feature("compactdefaultargs") ComputeTrsfs;
		%feature("autodoc", "
Parameters
----------
Trsfs: NCollection_Array1<gp_Trsf>

Return
-------
None

Description
-----------
No available documentation.
") ComputeTrsfs;
		void ComputeTrsfs(NCollection_Array1<gp_Trsf> & Trsfs);

		/****** TDataXtd_PatternStd::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_PatternStd::GetPatternID ******/
		/****** md5 signature: 96f86031c210757be1a52536bbd3cdef ******/
		%feature("compactdefaultargs") GetPatternID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetPatternID;
		static const Standard_GUID & GetPatternID();

		/****** TDataXtd_PatternStd::Mirror ******/
		/****** md5 signature: dfe173a0381b15a3a26666bafb592d2a ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
plane: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const opencascade::handle<TNaming_NamedShape> & plane);

		/****** TDataXtd_PatternStd::Mirror ******/
		/****** md5 signature: 7be6bc4c00d33b0635b6f77cbe35e4cf ******/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") Mirror;
		opencascade::handle<TNaming_NamedShape> Mirror();

		/****** TDataXtd_PatternStd::NbInstances1 ******/
		/****** md5 signature: eee4073fdd0f341872ef213e40213079 ******/
		%feature("compactdefaultargs") NbInstances1;
		%feature("autodoc", "
Parameters
----------
NbInstances1: TDataStd_Integer

Return
-------
None

Description
-----------
No available documentation.
") NbInstances1;
		void NbInstances1(const opencascade::handle<TDataStd_Integer> & NbInstances1);

		/****** TDataXtd_PatternStd::NbInstances1 ******/
		/****** md5 signature: 1addafbf2c9a7ee0c7b4a0dc81dba46c ******/
		%feature("compactdefaultargs") NbInstances1;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_Integer>

Description
-----------
No available documentation.
") NbInstances1;
		opencascade::handle<TDataStd_Integer> NbInstances1();

		/****** TDataXtd_PatternStd::NbInstances2 ******/
		/****** md5 signature: bb49fd9282bc75ed9533fecc21420c13 ******/
		%feature("compactdefaultargs") NbInstances2;
		%feature("autodoc", "
Parameters
----------
NbInstances2: TDataStd_Integer

Return
-------
None

Description
-----------
No available documentation.
") NbInstances2;
		void NbInstances2(const opencascade::handle<TDataStd_Integer> & NbInstances2);

		/****** TDataXtd_PatternStd::NbInstances2 ******/
		/****** md5 signature: 1eb48d908653588cb7f018a65e4492f4 ******/
		%feature("compactdefaultargs") NbInstances2;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_Integer>

Description
-----------
No available documentation.
") NbInstances2;
		opencascade::handle<TDataStd_Integer> NbInstances2();

		/****** TDataXtd_PatternStd::NbTrsfs ******/
		/****** md5 signature: f9004e1e03aa709c69761e128f8dde7d ******/
		%feature("compactdefaultargs") NbTrsfs;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTrsfs;
		int NbTrsfs();

		/****** TDataXtd_PatternStd::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataXtd_PatternStd::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataXtd_PatternStd::PatternID ******/
		/****** md5 signature: d676497da949f06e76fa720cda1e529b ******/
		%feature("compactdefaultargs") PatternID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") PatternID;
		const Standard_GUID & PatternID();

		/****** TDataXtd_PatternStd::References ******/
		/****** md5 signature: 3de62c613451bbbead6f06af1452fc25 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TDataXtd_PatternStd::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataXtd_PatternStd::Set ******/
		/****** md5 signature: 12adfa3e6ad76d1031da88bc941655c9 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataXtd_PatternStd>

Description
-----------
Find, or create, a PatternStd attribute.
") Set;
		static opencascade::handle<TDataXtd_PatternStd> Set(const TDF_Label & label);

		/****** TDataXtd_PatternStd::Signature ******/
		/****** md5 signature: 8da24d28e2f8ea382c142610002295bf ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "
Parameters
----------
signature: int

Return
-------
None

Description
-----------
No available documentation.
") Signature;
		void Signature(const int signature);

		/****** TDataXtd_PatternStd::Signature ******/
		/****** md5 signature: d9d6377529b210cb2785d4e0f1635e29 ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Signature;
		int Signature();

		/****** TDataXtd_PatternStd::Value1 ******/
		/****** md5 signature: 4acecac6e805777b7b937b7b95f3395c ******/
		%feature("compactdefaultargs") Value1;
		%feature("autodoc", "
Parameters
----------
value: TDataStd_Real

Return
-------
None

Description
-----------
No available documentation.
") Value1;
		void Value1(const opencascade::handle<TDataStd_Real> & value);

		/****** TDataXtd_PatternStd::Value1 ******/
		/****** md5 signature: c2f282c383543d02d730129fae284540 ******/
		%feature("compactdefaultargs") Value1;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_Real>

Description
-----------
No available documentation.
") Value1;
		opencascade::handle<TDataStd_Real> Value1();

		/****** TDataXtd_PatternStd::Value2 ******/
		/****** md5 signature: 101264a48022e7e4d35a4c641f5e9290 ******/
		%feature("compactdefaultargs") Value2;
		%feature("autodoc", "
Parameters
----------
value: TDataStd_Real

Return
-------
None

Description
-----------
No available documentation.
") Value2;
		void Value2(const opencascade::handle<TDataStd_Real> & value);

		/****** TDataXtd_PatternStd::Value2 ******/
		/****** md5 signature: 41ef20cadcfcb3a3313e86bbdde9fbc2 ******/
		%feature("compactdefaultargs") Value2;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_Real>

Description
-----------
No available documentation.
") Value2;
		opencascade::handle<TDataStd_Real> Value2();

};


%make_alias(TDataXtd_PatternStd)

%extend TDataXtd_PatternStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class TDataXtd_HArray1OfTrsf : public NCollection_Array1<gp_Trsf>, public Standard_Transient {
  public:
    TDataXtd_HArray1OfTrsf(const Standard_Integer theLower, const Standard_Integer theUpper);
    TDataXtd_HArray1OfTrsf(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_Trsf>::value_type& theValue);
    TDataXtd_HArray1OfTrsf(const NCollection_Array1<gp_Trsf>& theOther);
    const NCollection_Array1<gp_Trsf>& Array1();
    NCollection_Array1<gp_Trsf>& ChangeArray1();
};
%make_alias(TDataXtd_HArray1OfTrsf)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def tdataxtd_IDList(*args):
	return tdataxtd.IDList(*args)

@deprecated
def tdataxtd_Print(*args):
	return tdataxtd.Print(*args)

@deprecated
def tdataxtd_Print(*args):
	return tdataxtd.Print(*args)

@deprecated
def TDataXtd_Axis_GetID(*args):
	return TDataXtd_Axis.GetID(*args)

@deprecated
def TDataXtd_Axis_Set(*args):
	return TDataXtd_Axis.Set(*args)

@deprecated
def TDataXtd_Axis_Set(*args):
	return TDataXtd_Axis.Set(*args)

@deprecated
def TDataXtd_Constraint_CollectChildConstraints(*args):
	return TDataXtd_Constraint.CollectChildConstraints(*args)

@deprecated
def TDataXtd_Constraint_GetID(*args):
	return TDataXtd_Constraint.GetID(*args)

@deprecated
def TDataXtd_Constraint_Set(*args):
	return TDataXtd_Constraint.Set(*args)

@deprecated
def TDataXtd_Geometry_Axis(*args):
	return TDataXtd_Geometry.Axis(*args)

@deprecated
def TDataXtd_Geometry_Axis(*args):
	return TDataXtd_Geometry.Axis(*args)

@deprecated
def TDataXtd_Geometry_Circle(*args):
	return TDataXtd_Geometry.Circle(*args)

@deprecated
def TDataXtd_Geometry_Circle(*args):
	return TDataXtd_Geometry.Circle(*args)

@deprecated
def TDataXtd_Geometry_Cylinder(*args):
	return TDataXtd_Geometry.Cylinder(*args)

@deprecated
def TDataXtd_Geometry_Cylinder(*args):
	return TDataXtd_Geometry.Cylinder(*args)

@deprecated
def TDataXtd_Geometry_Ellipse(*args):
	return TDataXtd_Geometry.Ellipse(*args)

@deprecated
def TDataXtd_Geometry_Ellipse(*args):
	return TDataXtd_Geometry.Ellipse(*args)

@deprecated
def TDataXtd_Geometry_GetID(*args):
	return TDataXtd_Geometry.GetID(*args)

@deprecated
def TDataXtd_Geometry_Line(*args):
	return TDataXtd_Geometry.Line(*args)

@deprecated
def TDataXtd_Geometry_Line(*args):
	return TDataXtd_Geometry.Line(*args)

@deprecated
def TDataXtd_Geometry_Plane(*args):
	return TDataXtd_Geometry.Plane(*args)

@deprecated
def TDataXtd_Geometry_Plane(*args):
	return TDataXtd_Geometry.Plane(*args)

@deprecated
def TDataXtd_Geometry_Point(*args):
	return TDataXtd_Geometry.Point(*args)

@deprecated
def TDataXtd_Geometry_Point(*args):
	return TDataXtd_Geometry.Point(*args)

@deprecated
def TDataXtd_Geometry_Set(*args):
	return TDataXtd_Geometry.Set(*args)

@deprecated
def TDataXtd_Geometry_Type(*args):
	return TDataXtd_Geometry.Type(*args)

@deprecated
def TDataXtd_Geometry_Type(*args):
	return TDataXtd_Geometry.Type(*args)

@deprecated
def TDataXtd_Pattern_GetID(*args):
	return TDataXtd_Pattern.GetID(*args)

@deprecated
def TDataXtd_Placement_GetID(*args):
	return TDataXtd_Placement.GetID(*args)

@deprecated
def TDataXtd_Placement_Set(*args):
	return TDataXtd_Placement.Set(*args)

@deprecated
def TDataXtd_Plane_GetID(*args):
	return TDataXtd_Plane.GetID(*args)

@deprecated
def TDataXtd_Plane_Set(*args):
	return TDataXtd_Plane.Set(*args)

@deprecated
def TDataXtd_Plane_Set(*args):
	return TDataXtd_Plane.Set(*args)

@deprecated
def TDataXtd_Point_GetID(*args):
	return TDataXtd_Point.GetID(*args)

@deprecated
def TDataXtd_Point_Set(*args):
	return TDataXtd_Point.Set(*args)

@deprecated
def TDataXtd_Point_Set(*args):
	return TDataXtd_Point.Set(*args)

@deprecated
def TDataXtd_Position_Get(*args):
	return TDataXtd_Position.Get(*args)

@deprecated
def TDataXtd_Position_GetID(*args):
	return TDataXtd_Position.GetID(*args)

@deprecated
def TDataXtd_Position_Set(*args):
	return TDataXtd_Position.Set(*args)

@deprecated
def TDataXtd_Position_Set(*args):
	return TDataXtd_Position.Set(*args)

@deprecated
def TDataXtd_Presentation_GetID(*args):
	return TDataXtd_Presentation.GetID(*args)

@deprecated
def TDataXtd_Presentation_Set(*args):
	return TDataXtd_Presentation.Set(*args)

@deprecated
def TDataXtd_Presentation_Unset(*args):
	return TDataXtd_Presentation.Unset(*args)

@deprecated
def TDataXtd_Presentation_getColorNameFromOldEnum(*args):
	return TDataXtd_Presentation.getColorNameFromOldEnum(*args)

@deprecated
def TDataXtd_Presentation_getOldColorNameFromNewEnum(*args):
	return TDataXtd_Presentation.getOldColorNameFromNewEnum(*args)

@deprecated
def TDataXtd_Shape_Find(*args):
	return TDataXtd_Shape.Find(*args)

@deprecated
def TDataXtd_Shape_Get(*args):
	return TDataXtd_Shape.Get(*args)

@deprecated
def TDataXtd_Shape_GetID(*args):
	return TDataXtd_Shape.GetID(*args)

@deprecated
def TDataXtd_Shape_New(*args):
	return TDataXtd_Shape.New(*args)

@deprecated
def TDataXtd_Shape_Set(*args):
	return TDataXtd_Shape.Set(*args)

@deprecated
def TDataXtd_Triangulation_GetID(*args):
	return TDataXtd_Triangulation.GetID(*args)

@deprecated
def TDataXtd_Triangulation_Set(*args):
	return TDataXtd_Triangulation.Set(*args)

@deprecated
def TDataXtd_Triangulation_Set(*args):
	return TDataXtd_Triangulation.Set(*args)

@deprecated
def TDataXtd_PatternStd_GetPatternID(*args):
	return TDataXtd_PatternStd.GetPatternID(*args)

@deprecated
def TDataXtd_PatternStd_Set(*args):
	return TDataXtd_PatternStd.Set(*args)

}
