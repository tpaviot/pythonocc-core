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
%wrap_handle(TDataXtd_HArray1OfTrsf)
/* end handles declaration */

/* templates */
%template(TDataXtd_Array1OfTrsf) NCollection_Array1<gp_Trsf>;
Array1ExtendIter(gp_Trsf)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<gp_Trsf> TDataXtd_Array1OfTrsf;
/* end typedefs declaration */

/*****************
* class TDataXtd *
*****************/
%rename(tdataxtd) TDataXtd;
class TDataXtd {
	public:
		/****** TDataXtd::IDList ******/
		/****** md5 signature: 97de0b35f4f6abc04a631c65d32bacc4 ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
Find, or create, an Axis attribute and set <P> as generated in the associated NamedShape. Axis methods ============.
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
		/****** md5 signature: 07c7b27c8bb0fdd807e59992f4de6d32 ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Constraint::GetGeometry ******/
		/****** md5 signature: 11769af2e389c68724cfcb5f085ee941 ******/
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
		opencascade::handle<TNaming_NamedShape> GetGeometry(const Standard_Integer Index);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 028a39ec2b8dc2c380306522212d3935 ******/
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
		void Inverted(const Standard_Boolean status);

		/****** TDataXtd_Constraint::Inverted ******/
		/****** md5 signature: dcbb88049134fcba1d00a24f941e901d ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Inverted;
		Standard_Boolean Inverted();

		/****** TDataXtd_Constraint::IsDimension ******/
		/****** md5 signature: ceba0536be3febc9c1b26338e2d92d79 ******/
		%feature("compactdefaultargs") IsDimension;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this constraint attribute is a dimension, and therefore has a value.
") IsDimension;
		Standard_Boolean IsDimension();

		/****** TDataXtd_Constraint::IsPlanar ******/
		/****** md5 signature: c4cb6ad82acdd7a7d12e9af1bea21482 ******/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this constraint attribute is two-dimensional.
") IsPlanar;
		Standard_Boolean IsPlanar();

		/****** TDataXtd_Constraint::NbGeometries ******/
		/****** md5 signature: a13234cb29e36dbe43a1363db56d5ecf ******/
		%feature("compactdefaultargs") NbGeometries;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of geometry attributes in this constraint attribute. This number will be between 1 and 4.
") NbGeometries;
		Standard_Integer NbGeometries();

		/****** TDataXtd_Constraint::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: f171ce811dbfb205236d26e3cbf15450 ******/
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
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataXtd_Constraint::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 97515e41b97b33f8a427c966867570b6 ******/
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
		void Reversed(const Standard_Boolean status);

		/****** TDataXtd_Constraint::Reversed ******/
		/****** md5 signature: 9c23a22dddad6f7f4c70acdb99e6a2e9 ******/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Reversed;
		Standard_Boolean Reversed();

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
		/****** md5 signature: b50d93fb0400c4e3f8d6f2f32eccb3ef ******/
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
		void SetGeometry(const Standard_Integer Index, const opencascade::handle<TNaming_NamedShape> & G);

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
		/****** md5 signature: 04dfe0820fb92025a78356897d0723b1 ******/
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this constraint attribute is valid. By default, true is returned. When the value of a dimension is changed or when a geometry is moved, false is returned until the solver sets it back to true.
") Verified;
		Standard_Boolean Verified();

		/****** TDataXtd_Constraint::Verified ******/
		/****** md5 signature: 6a2719dcf9be895809d8b31c3b24364f ******/
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
		void Verified(const Standard_Boolean status);

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
		/****** md5 signature: 03db28fb6ba0e7b3f564c3338430f360 ******/
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
		static Standard_Boolean Axis(const TDF_Label & L, gp_Ax1 & G);

		/****** TDataXtd_Geometry::Axis ******/
		/****** md5 signature: 4d3d95e974783bd649a8505590b6dd36 ******/
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
		static Standard_Boolean Axis(const opencascade::handle<TNaming_NamedShape> & S, gp_Ax1 & G);

		/****** TDataXtd_Geometry::Circle ******/
		/****** md5 signature: 248bf5b6e0014427fd072c884f1794cf ******/
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
		static Standard_Boolean Circle(const TDF_Label & L, gp_Circ & G);

		/****** TDataXtd_Geometry::Circle ******/
		/****** md5 signature: d40b90920f2b01233f78593d73449e81 ******/
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
		static Standard_Boolean Circle(const opencascade::handle<TNaming_NamedShape> & S, gp_Circ & G);

		/****** TDataXtd_Geometry::Cylinder ******/
		/****** md5 signature: ada7f324025ac3ee1384f6a4ad043c5b ******/
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
		static Standard_Boolean Cylinder(const TDF_Label & L, gp_Cylinder & G);

		/****** TDataXtd_Geometry::Cylinder ******/
		/****** md5 signature: eddf731ed6cc5d97ebb3af9355e9ef9f ******/
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
		static Standard_Boolean Cylinder(const opencascade::handle<TNaming_NamedShape> & S, gp_Cylinder & G);

		/****** TDataXtd_Geometry::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Geometry::Ellipse ******/
		/****** md5 signature: 8f6f76d68f97a2ead65bf6d14c1f45c2 ******/
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
		static Standard_Boolean Ellipse(const TDF_Label & L, gp_Elips & G);

		/****** TDataXtd_Geometry::Ellipse ******/
		/****** md5 signature: cd28adb6f18bacb8121456db406fdf03 ******/
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
		static Standard_Boolean Ellipse(const opencascade::handle<TNaming_NamedShape> & S, gp_Elips & G);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: f52c96dfa0302cf65b15eecee49becc3 ******/
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
		static Standard_Boolean Line(const TDF_Label & L, gp_Lin & G);

		/****** TDataXtd_Geometry::Line ******/
		/****** md5 signature: 6f3102f44149a948d45818b064b81344 ******/
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
		static Standard_Boolean Line(const opencascade::handle<TNaming_NamedShape> & S, gp_Lin & G);

		/****** TDataXtd_Geometry::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: aa166596ae5f9f678edb7f098fe3ce91 ******/
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
		static Standard_Boolean Plane(const TDF_Label & L, gp_Pln & G);

		/****** TDataXtd_Geometry::Plane ******/
		/****** md5 signature: 826f0176ed0f1eae441ff1b22beb9a66 ******/
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
		static Standard_Boolean Plane(const opencascade::handle<TNaming_NamedShape> & S, gp_Pln & G);

		/****** TDataXtd_Geometry::Point ******/
		/****** md5 signature: d8520245bbcc61ec401cec3d031fc2f4 ******/
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
		static Standard_Boolean Point(const TDF_Label & L, gp_Pnt & G);

		/****** TDataXtd_Geometry::Point ******/
		/****** md5 signature: ee32b7e57a772bb1399bb4b79da9d466 ******/
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
		static Standard_Boolean Point(const opencascade::handle<TNaming_NamedShape> & S, gp_Pnt & G);

		/****** TDataXtd_Geometry::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: c5454a8fa108eca814397ba8ff0982c2 ******/
		%feature("compactdefaultargs") ComputeTrsfs;
		%feature("autodoc", "
Parameters
----------
Trsfs: TDataXtd_Array1OfTrsf

Return
-------
None

Description
-----------
Give the transformations.
") ComputeTrsfs;
		virtual void ComputeTrsfs(TDataXtd_Array1OfTrsf & Trsfs);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: a121b2599d6d720d51398ae0115f4a2b ******/
		%feature("compactdefaultargs") NbTrsfs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of transformation.
") NbTrsfs;
		virtual Standard_Integer NbTrsfs();

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
Find, or create, an Placement attribute. the Placement attribute is returned. Placement methods =================.
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: e58c12592e7db5eae33b2b87d2b4f6cc ******/
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
		static Standard_Boolean Get(const TDF_Label & aLabel, gp_Pnt & aPos);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty attribute from the good end type. It is used by the copy algorithm.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataXtd_Position::Paste ******/
		/****** md5 signature: 53b4ec32bedd752fc0ccd186074f75ef ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****** TDataXtd_Position::Restore ******/
		/****** md5 signature: c280e51bf6f4f3b5011b0c3698dfb001 ******/
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
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

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
		/****** md5 signature: 2f3915cde2340bc54ca93c55af007d81 ******/
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", "
Parameters
----------
theSelectionMode: int
theTransaction: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") AddSelectionMode;
		void AddSelectionMode(const Standard_Integer theSelectionMode, const Standard_Boolean theTransaction = Standard_True);

		/****** TDataXtd_Presentation::BackupCopy ******/
		/****** md5 signature: be67c343943ad438128f575f7f5feaa1 ******/
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
		/****** md5 signature: eb4c6588e6d12a452658a67633c2de5c ******/
		%feature("compactdefaultargs") GetNbSelectionModes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of selection modes of the attribute. It starts with 1 .. GetNbSelectionModes().
") GetNbSelectionModes;
		Standard_Integer GetNbSelectionModes();

		/****** TDataXtd_Presentation::HasOwnColor ******/
		/****** md5 signature: 85391f94ad8ed41de9ce9852009b8711 ******/
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnColor;
		Standard_Boolean HasOwnColor();

		/****** TDataXtd_Presentation::HasOwnMaterial ******/
		/****** md5 signature: 8effeb2715386f4facabb7e016d6f914 ******/
		%feature("compactdefaultargs") HasOwnMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnMaterial;
		Standard_Boolean HasOwnMaterial();

		/****** TDataXtd_Presentation::HasOwnMode ******/
		/****** md5 signature: db54ff723646ecb3cccdfb673c54283e ******/
		%feature("compactdefaultargs") HasOwnMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnMode;
		Standard_Boolean HasOwnMode();

		/****** TDataXtd_Presentation::HasOwnSelectionMode ******/
		/****** md5 signature: ca04b4e9e4c94e4c0b6ce42053c9e30a ******/
		%feature("compactdefaultargs") HasOwnSelectionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnSelectionMode;
		Standard_Boolean HasOwnSelectionMode();

		/****** TDataXtd_Presentation::HasOwnTransparency ******/
		/****** md5 signature: 518151389a72b3ced0d8dc79dc662dca ******/
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnTransparency;
		Standard_Boolean HasOwnTransparency();

		/****** TDataXtd_Presentation::HasOwnWidth ******/
		/****** md5 signature: 76ebaa4394d15efba17d3ac7ce584080 ******/
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnWidth;
		Standard_Boolean HasOwnWidth();

		/****** TDataXtd_Presentation::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 04882eded547dac4e4f59f67e903fed8 ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDisplayed;
		Standard_Boolean IsDisplayed();

		/****** TDataXtd_Presentation::MaterialIndex ******/
		/****** md5 signature: 7f09321d0051e340f7605b34099ebb08 ******/
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MaterialIndex;
		Standard_Integer MaterialIndex();

		/****** TDataXtd_Presentation::Mode ******/
		/****** md5 signature: d1320a8f2b0a14003883efd9407c24ac ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Mode;
		Standard_Integer Mode();

		/****** TDataXtd_Presentation::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty attribute from the good end type. It is used by the copy algorithm.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataXtd_Presentation::Paste ******/
		/****** md5 signature: 53b4ec32bedd752fc0ccd186074f75ef ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****** TDataXtd_Presentation::Restore ******/
		/****** md5 signature: c280e51bf6f4f3b5011b0c3698dfb001 ******/
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
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDataXtd_Presentation::SelectionMode ******/
		/****** md5 signature: eaeec5c5007ba0b6cda5dcd31d7352bb ******/
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
		Standard_Integer SelectionMode(const int index = 1);

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
		/****** md5 signature: 8aea42092ccc7172bb08a47879bf623c ******/
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
		void SetDisplayed(const Standard_Boolean theIsDisplayed);

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
		/****** md5 signature: dcbff4c6466e0b24368d052895e358dd ******/
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
		void SetMaterialIndex(const Standard_Integer theMaterialIndex);

		/****** TDataXtd_Presentation::SetMode ******/
		/****** md5 signature: fca52190dcdc18b7bad2a81829b4e979 ******/
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
		void SetMode(const Standard_Integer theMode);

		/****** TDataXtd_Presentation::SetSelectionMode ******/
		/****** md5 signature: 96f14deb237436f152baf69a8590e0a7 ******/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "
Parameters
----------
theSelectionMode: int
theTransaction: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets selection mode. If 'theTransaction' flag is OFF, modification of the attribute doesn't influence the transaction mechanism (the attribute doesn't participate in undo/redo because of this modification). Certainly, if any other data of the attribute is modified (display mode, color, ...), the attribute will be included into undo/redo.
") SetSelectionMode;
		void SetSelectionMode(const Standard_Integer theSelectionMode, const Standard_Boolean theTransaction = Standard_True);

		/****** TDataXtd_Presentation::SetTransparency ******/
		/****** md5 signature: e9c4cf884db0f83417459b5ca9783c51 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
No available documentation.
") SetTransparency;
		void SetTransparency(const Standard_Real theValue);

		/****** TDataXtd_Presentation::SetWidth ******/
		/****** md5 signature: 6f3db9da77eb657791447ad521f2bf74 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: float

Return
-------
None

Description
-----------
No available documentation.
") SetWidth;
		void SetWidth(const Standard_Real theWidth);

		/****** TDataXtd_Presentation::Transparency ******/
		/****** md5 signature: 395111f5ce5a38f6b8d6009c7b6b1222 ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Transparency;
		Standard_Real Transparency();

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
		/****** md5 signature: e40fe8cb5cdcf41ad2ab06ede13e859b ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Width;
		Standard_Real Width();

		/****** TDataXtd_Presentation::getColorNameFromOldEnum ******/
		/****** md5 signature: ab68ddac1b40714d4433bd7b78a9cab8 ******/
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
		static Quantity_NameOfColor getColorNameFromOldEnum(Standard_Integer theOld);

		/****** TDataXtd_Presentation::getOldColorNameFromNewEnum ******/
		/****** md5 signature: 1fedd82c4dd7e3ca0773863813c046d6 ******/
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
		static Standard_Integer getOldColorNameFromNewEnum(Quantity_NameOfColor theNew);

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataXtd_Shape::Find ******/
		/****** md5 signature: b7eef569fb5abc3a63bf9482c967edfd ******/
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
		static Standard_Boolean Find(const TDF_Label & current, opencascade::handle<TDataXtd_Shape> & S);

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
Shape methods ============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataXtd_Shape::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: f171ce811dbfb205236d26e3cbf15450 ******/
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
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

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
		/****** md5 signature: cc0b59ab46f82f52f9a9398cfae7702b ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the deflection of this triangulation.
") Deflection;
		Standard_Real Deflection();

		/****** TDataXtd_Triangulation::Deflection ******/
		/****** md5 signature: e3314129dc278c4d2782072a6d9cb7bb ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "
Parameters
----------
theDeflection: float

Return
-------
None

Description
-----------
Sets the deflection of this triangulation to theDeflection. See more on deflection in Polygon2D.
") Deflection;
		void Deflection(const Standard_Real theDeflection);

		/****** TDataXtd_Triangulation::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

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
		/****** md5 signature: 181f2084bd118d7033834a50e616fde5 ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if nodal normals are defined.
") HasNormals;
		Standard_Boolean HasNormals();

		/****** TDataXtd_Triangulation::HasUVNodes ******/
		/****** md5 signature: 737532dee6e8cd1688ace4b8cd5ea181 ******/
		%feature("compactdefaultargs") HasUVNodes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: Standard_True if 2D nodes are associated with 3D nodes for this triangulation.
") HasUVNodes;
		Standard_Boolean HasUVNodes();

		/****** TDataXtd_Triangulation::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: b2716f774ff961df1fa7782a7d1f28be ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return: the number of nodes for this triangulation.
") NbNodes;
		Standard_Integer NbNodes();

		/****** TDataXtd_Triangulation::NbTriangles ******/
		/****** md5 signature: c1e2294db77a16b75e32923c5461b457 ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return: the number of triangles for this triangulation.
") NbTriangles;
		Standard_Integer NbTriangles();

		/****** TDataXtd_Triangulation::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: e94431a8a9e60fd5ee7dc3e879ed9254 ******/
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
		gp_Pnt Node(const Standard_Integer theIndex);

		/****** TDataXtd_Triangulation::Normal ******/
		/****** md5 signature: 1f8c1bc50986664ddc2a6444da0aec81 ******/
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
		gp_Dir Normal(const Standard_Integer theIndex);

		/****** TDataXtd_Triangulation::Paste ******/
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: e1457e927b6cb3b622a5f3603feeee39 ******/
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
		/****** md5 signature: c9bc54dc6c0b2f4a71030b502a3e2b92 ******/
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
		void SetNode(const Standard_Integer theIndex, const gp_Pnt & theNode);

		/****** TDataXtd_Triangulation::SetNormal ******/
		/****** md5 signature: 16090a2b1fc1f76d31b9afd2a0c42cc1 ******/
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
		void SetNormal(const Standard_Integer theIndex, const gp_Dir & theNormal);

		/****** TDataXtd_Triangulation::SetTriangle ******/
		/****** md5 signature: 4802341912a18dadbd9ddb25cc7c33be ******/
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
		void SetTriangle(const Standard_Integer theIndex, const Poly_Triangle & theTriangle);

		/****** TDataXtd_Triangulation::SetUVNode ******/
		/****** md5 signature: 7c1d13161b5be4ef9c47f833c3a1c108 ******/
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
		void SetUVNode(const Standard_Integer theIndex, const gp_Pnt2d & theUVNode);

		/****** TDataXtd_Triangulation::Triangle ******/
		/****** md5 signature: cfec7bae58a426adb2df65595a28d88f ******/
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
		Poly_Triangle Triangle(const Standard_Integer theIndex);

		/****** TDataXtd_Triangulation::UVNode ******/
		/****** md5 signature: 8deb1f90810778dff4fdcd7f6ef2228d ******/
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
		gp_Pnt2d UVNode(const Standard_Integer theIndex);

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
		/****** md5 signature: 0d87df094f654b46fedbf1afc325bc74 ******/
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
		void Axis1Reversed(const Standard_Boolean Axis1Reversed);

		/****** TDataXtd_PatternStd::Axis1Reversed ******/
		/****** md5 signature: 748890eb3a523fc88b7545480645036e ******/
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Axis1Reversed;
		Standard_Boolean Axis1Reversed();

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
		/****** md5 signature: c3bd7a3b18ffe8c9d8e584da7d2ed095 ******/
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
		void Axis2Reversed(const Standard_Boolean Axis2Reversed);

		/****** TDataXtd_PatternStd::Axis2Reversed ******/
		/****** md5 signature: 6c76dd6edff17470f3a999274b5d8e48 ******/
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Axis2Reversed;
		Standard_Boolean Axis2Reversed();

		/****** TDataXtd_PatternStd::ComputeTrsfs ******/
		/****** md5 signature: 9f3293cc73b6d3d9a8645a4ee62f7d09 ******/
		%feature("compactdefaultargs") ComputeTrsfs;
		%feature("autodoc", "
Parameters
----------
Trsfs: TDataXtd_Array1OfTrsf

Return
-------
None

Description
-----------
No available documentation.
") ComputeTrsfs;
		void ComputeTrsfs(TDataXtd_Array1OfTrsf & Trsfs);

		/****** TDataXtd_PatternStd::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

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
		/****** md5 signature: aa9aab239a001e0a5472a94a5cafa31b ******/
		%feature("compactdefaultargs") NbTrsfs;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTrsfs;
		Standard_Integer NbTrsfs();

		/****** TDataXtd_PatternStd::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: af593b6d99715444618a7949758e157b ******/
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
		/****** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ******/
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
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TDataXtd_PatternStd::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 1533ffd9fb8eca2dfdc85e12e5ea67c9 ******/
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
		void Signature(const Standard_Integer signature);

		/****** TDataXtd_PatternStd::Signature ******/
		/****** md5 signature: bf7e7ab4d72ba06a0010abbc8f149662 ******/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Signature;
		Standard_Integer Signature();

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

class TDataXtd_HArray1OfTrsf : public TDataXtd_Array1OfTrsf, public Standard_Transient {
  public:
    TDataXtd_HArray1OfTrsf(const Standard_Integer theLower, const Standard_Integer theUpper);
    TDataXtd_HArray1OfTrsf(const Standard_Integer theLower, const Standard_Integer theUpper, const TDataXtd_Array1OfTrsf::value_type& theValue);
    TDataXtd_HArray1OfTrsf(const TDataXtd_Array1OfTrsf& theOther);
    const TDataXtd_Array1OfTrsf& Array1();
    TDataXtd_Array1OfTrsf& ChangeArray1();
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
