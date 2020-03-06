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
%define TDATAXTDDOCSTRING
"TDataXtd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tdataxtd.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<TDataXtd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDF_module.hxx>
#include<gp_module.hxx>
#include<TNaming_module.hxx>
#include<TDataStd_module.hxx>
#include<Quantity_module.hxx>
#include<TopoDS_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<TopTools_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<TShort_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDF.i
%import gp.i
%import TNaming.i
%import TDataStd.i
%import Quantity.i
%import TopoDS.i
%import Poly.i
%import TShort.i

%pythoncode {
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

/* python proy classes for enums */
%pythoncode {

class TDataXtd_ConstraintEnum:
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

class TDataXtd_GeometryEnum:
	TDataXtd_ANY_GEOM = 0
	TDataXtd_POINT = 1
	TDataXtd_LINE = 2
	TDataXtd_CIRCLE = 3
	TDataXtd_ELLIPSE = 4
	TDataXtd_SPLINE = 5
	TDataXtd_PLANE = 6
	TDataXtd_CYLINDER = 7
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

%extend NCollection_Array1<gp_Trsf> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
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
		/****************** IDList ******************/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "Appends to <anidlist> the list of the attributes ids of this package. caution: <anidlist> is not cleared before use. print of tdataext enumeration =============================.

Parameters
----------
anIDList: TDF_IDList

Returns
-------
None
") IDList;
		static void IDList(TDF_IDList & anIDList);

};


%extend TDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDataXtd_Axis *
**********************/
class TDataXtd_Axis : public TDF_Attribute {
	public:
		/****************** TDataXtd_Axis ******************/
		%feature("compactdefaultargs") TDataXtd_Axis;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataXtd_Axis;
		 TDataXtd_Axis();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for an axis.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates an axis attribute defined by the label. in the case of a creation of an axis, a compatible named shape should already be associated with label. exceptions standard_nullobject if no compatible named shape is associated with the label.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataXtd_Axis>
") Set;
		static opencascade::handle<TDataXtd_Axis> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, an axis attribute and set <p> as generated in the associated namedshape. axis methods ============.

Parameters
----------
label: TDF_Label
L: gp_Lin

Returns
-------
opencascade::handle<TDataXtd_Axis>
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
		/****************** TDataXtd_Constraint ******************/
		%feature("compactdefaultargs") TDataXtd_Constraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataXtd_Constraint;
		 TDataXtd_Constraint();

		/****************** ClearGeometries ******************/
		%feature("compactdefaultargs") ClearGeometries;
		%feature("autodoc", "Removes the geometries involved in the constraint or dimension from the array of topological attributes where they are stored.

Returns
-------
None
") ClearGeometries;
		void ClearGeometries();

		/****************** CollectChildConstraints ******************/
		%feature("compactdefaultargs") CollectChildConstraints;
		%feature("autodoc", "Collects constraints on childs for label <alabel>.

Parameters
----------
aLabel: TDF_Label
TheList: TDF_LabelList

Returns
-------
None
") CollectChildConstraints;
		static void CollectChildConstraints(const TDF_Label & aLabel, TDF_LabelList & TheList);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetGeometry ******************/
		%feature("compactdefaultargs") GetGeometry;
		%feature("autodoc", "Returns the integer index index used to access the array of the constraint or stored geometries of a dimension index has a value between 1 and 4. methods to write constraint fields (use builder) ==================================.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TNaming_NamedShape>
") GetGeometry;
		opencascade::handle<TNaming_NamedShape> GetGeometry(const Standard_Integer Index);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the guid for constraints.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetPlane ******************/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "Returns the topological attribute of the plane used for planar - i.e., 2d - constraints. this plane is attached to another label. if the constraint is not planar, in other words, 3d, this function will return a null handle.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") GetPlane;
		const opencascade::handle<TNaming_NamedShape> & GetPlane();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of constraint. this will be an element of the tdataxtd_constraintenum enumeration.

Returns
-------
TDataXtd_ConstraintEnum
") GetType;
		TDataXtd_ConstraintEnum GetType();

		/****************** GetValue ******************/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "Returns the value of a dimension. this value is a reference to a tdatastd_real attribute. if the attribute is not a dimension, this value will be 0. use isdimension to test this condition.

Returns
-------
opencascade::handle<TDataStd_Real>
") GetValue;
		const opencascade::handle<TDataStd_Real> & GetValue();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: bool

Returns
-------
None
") Inverted;
		void Inverted(const Standard_Boolean status);

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Inverted;
		Standard_Boolean Inverted();

		/****************** IsDimension ******************/
		%feature("compactdefaultargs") IsDimension;
		%feature("autodoc", "Returns true if this constraint attribute is a dimension, and therefore has a value.

Returns
-------
bool
") IsDimension;
		Standard_Boolean IsDimension();

		/****************** IsPlanar ******************/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Returns true if this constraint attribute is two-dimensional.

Returns
-------
bool
") IsPlanar;
		Standard_Boolean IsPlanar();

		/****************** NbGeometries ******************/
		%feature("compactdefaultargs") NbGeometries;
		%feature("autodoc", "Returns the number of geometry attributes in this constraint attribute. this number will be between 1 and 4.

Returns
-------
int
") NbGeometries;
		Standard_Integer NbGeometries();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: bool

Returns
-------
None
") Reversed;
		void Reversed(const Standard_Boolean status);

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Reversed;
		Standard_Boolean Reversed();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates the 2d constraint attribute defined by the planar topological attribute plane and the label label. constraint methods ==================.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataXtd_Constraint>
") Set;
		static opencascade::handle<TDataXtd_Constraint> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates the constraint attribute defined by the topological attribute g1 and the constraint type type.

Parameters
----------
type: TDataXtd_ConstraintEnum
G1: TNaming_NamedShape

Returns
-------
None
") Set;
		void Set(const TDataXtd_ConstraintEnum type, const opencascade::handle<TNaming_NamedShape> & G1);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates the constraint attribute defined by the topological attributes g1 and g2, and by the constraint type type.

Parameters
----------
type: TDataXtd_ConstraintEnum
G1: TNaming_NamedShape
G2: TNaming_NamedShape

Returns
-------
None
") Set;
		void Set(const TDataXtd_ConstraintEnum type, const opencascade::handle<TNaming_NamedShape> & G1, const opencascade::handle<TNaming_NamedShape> & G2);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates the constraint attribute defined by the topological attributes g1, g2 and g3, and by the constraint type type.

Parameters
----------
type: TDataXtd_ConstraintEnum
G1: TNaming_NamedShape
G2: TNaming_NamedShape
G3: TNaming_NamedShape

Returns
-------
None
") Set;
		void Set(const TDataXtd_ConstraintEnum type, const opencascade::handle<TNaming_NamedShape> & G1, const opencascade::handle<TNaming_NamedShape> & G2, const opencascade::handle<TNaming_NamedShape> & G3);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates the constraint attribute defined by the topological attributes g1, g2, g3 and g4, and by the constraint type type. methods to read constraint fields =================================.

Parameters
----------
type: TDataXtd_ConstraintEnum
G1: TNaming_NamedShape
G2: TNaming_NamedShape
G3: TNaming_NamedShape
G4: TNaming_NamedShape

Returns
-------
None
") Set;
		void Set(const TDataXtd_ConstraintEnum type, const opencascade::handle<TNaming_NamedShape> & G1, const opencascade::handle<TNaming_NamedShape> & G2, const opencascade::handle<TNaming_NamedShape> & G3, const opencascade::handle<TNaming_NamedShape> & G4);

		/****************** SetGeometry ******************/
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", "Finds or creates the underlying geometry of the constraint defined by the topological attribute g and the integer index index.

Parameters
----------
Index: int
G: TNaming_NamedShape

Returns
-------
None
") SetGeometry;
		void SetGeometry(const Standard_Integer Index, const opencascade::handle<TNaming_NamedShape> & G);

		/****************** SetPlane ******************/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "Finds or creates the plane of the 2d constraint attribute, defined by the planar topological attribute plane.

Parameters
----------
plane: TNaming_NamedShape

Returns
-------
None
") SetPlane;
		void SetPlane(const opencascade::handle<TNaming_NamedShape> & plane);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Finds or creates the type of constraint ctr.

Parameters
----------
CTR: TDataXtd_ConstraintEnum

Returns
-------
None
") SetType;
		void SetType(const TDataXtd_ConstraintEnum CTR);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Finds or creates the real number value v of the dimension constraint attribute.

Parameters
----------
V: TDataStd_Real

Returns
-------
None
") SetValue;
		void SetValue(const opencascade::handle<TDataStd_Real> & V);

		/****************** Verified ******************/
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "Returns true if this constraint attribute is valid. by default, true is returned. when the value of a dimension is changed or when a geometry is moved, false is returned until the solver sets it back to true.

Returns
-------
bool
") Verified;
		Standard_Boolean Verified();

		/****************** Verified ******************/
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "Returns true if this constraint attribute defined by status is valid. by default, true is returned. when the value of a dimension is changed or when a geometry is moved, false is returned until the solver sets it back to true. if status is false, verified is set to false.

Parameters
----------
status: bool

Returns
-------
None
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
		/****************** TDataXtd_Geometry ******************/
		%feature("compactdefaultargs") TDataXtd_Geometry;
		%feature("autodoc", "This and the next methods are used to retrieve underlying geometry of the namedshape, even if noone geometry attribute is associated . if not found or not compliant geometry return false.

Returns
-------
None
") TDataXtd_Geometry;
		 TDataXtd_Geometry();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the axis attribute defined by the label l and the axis g.

Parameters
----------
L: TDF_Label
G: gp_Ax1

Returns
-------
bool
") Axis;
		static Standard_Boolean Axis(const TDF_Label & L, gp_Ax1 & G);

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Returns the axis attribute defined by the topological attribute s and the axis g.

Parameters
----------
S: TNaming_NamedShape
G: gp_Ax1

Returns
-------
bool
") Axis;
		static Standard_Boolean Axis(const opencascade::handle<TNaming_NamedShape> & S, gp_Ax1 & G);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns the circle attribute defined by the label l and the circle g.

Parameters
----------
L: TDF_Label
G: gp_Circ

Returns
-------
bool
") Circle;
		static Standard_Boolean Circle(const TDF_Label & L, gp_Circ & G);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns the circle attribute defined by the topological attribute s and the circle g.

Parameters
----------
S: TNaming_NamedShape
G: gp_Circ

Returns
-------
bool
") Circle;
		static Standard_Boolean Circle(const opencascade::handle<TNaming_NamedShape> & S, gp_Circ & G);

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Returns the cylinder attribute defined by the label l and the cylinder g.

Parameters
----------
L: TDF_Label
G: gp_Cylinder

Returns
-------
bool
") Cylinder;
		static Standard_Boolean Cylinder(const TDF_Label & L, gp_Cylinder & G);

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Returns the cylinder attribute defined by the topological attribute s and the cylinder g.

Parameters
----------
S: TNaming_NamedShape
G: gp_Cylinder

Returns
-------
bool
") Cylinder;
		static Standard_Boolean Cylinder(const opencascade::handle<TNaming_NamedShape> & S, gp_Cylinder & G);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Returns the ellipse attribute defined by the label l and the ellipse g.

Parameters
----------
L: TDF_Label
G: gp_Elips

Returns
-------
bool
") Ellipse;
		static Standard_Boolean Ellipse(const TDF_Label & L, gp_Elips & G);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Returns the ellipse attribute defined by the topological attribute s and the ellipse g.

Parameters
----------
S: TNaming_NamedShape
G: gp_Elips

Returns
-------
bool
") Ellipse;
		static Standard_Boolean Ellipse(const opencascade::handle<TNaming_NamedShape> & S, gp_Elips & G);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the guid for geometry attributes.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of geometric construction.

Returns
-------
TDataXtd_GeometryEnum
") GetType;
		TDataXtd_GeometryEnum GetType();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line attribute defined by the label l and the line g.

Parameters
----------
L: TDF_Label
G: gp_Lin

Returns
-------
bool
") Line;
		static Standard_Boolean Line(const TDF_Label & L, gp_Lin & G);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line attribute defined by the topological attribute s and the line g.

Parameters
----------
S: TNaming_NamedShape
G: gp_Lin

Returns
-------
bool
") Line;
		static Standard_Boolean Line(const opencascade::handle<TNaming_NamedShape> & S, gp_Lin & G);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the plane attribute defined by the label l and the plane g.

Parameters
----------
L: TDF_Label
G: gp_Pln

Returns
-------
bool
") Plane;
		static Standard_Boolean Plane(const TDF_Label & L, gp_Pln & G);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the plane attribute defined by the topological attribute s and the plane g.

Parameters
----------
S: TNaming_NamedShape
G: gp_Pln

Returns
-------
bool
") Plane;
		static Standard_Boolean Plane(const opencascade::handle<TNaming_NamedShape> & S, gp_Pln & G);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point attribute defined by the label l and the point g.

Parameters
----------
L: TDF_Label
G: gp_Pnt

Returns
-------
bool
") Point;
		static Standard_Boolean Point(const TDF_Label & L, gp_Pnt & G);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point attribute defined by the topological attribute s and the point g.

Parameters
----------
S: TNaming_NamedShape
G: gp_Pnt

Returns
-------
bool
") Point;
		static Standard_Boolean Point(const opencascade::handle<TNaming_NamedShape> & S, gp_Pnt & G);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Api class methods ================= finds, or creates, a geometry attribute defined by the label label. the default type of geometry is the value any_geom of the enumeration tdataxtd_geometryenum. to specify another value of this enumeration, use the function settype.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataXtd_Geometry>
") Set;
		static opencascade::handle<TDataXtd_Geometry> Set(const TDF_Label & label);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Returns the type of geometric construction t of this attribute. t will be a value of the enumeration tdataxtd_geometryenum.

Parameters
----------
T: TDataXtd_GeometryEnum

Returns
-------
None
") SetType;
		void SetType(const TDataXtd_GeometryEnum T);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the label l used to define the type of geometric construction for the geometry attribute.

Parameters
----------
L: TDF_Label

Returns
-------
TDataXtd_GeometryEnum
") Type;
		static TDataXtd_GeometryEnum Type(const TDF_Label & L);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the topological attribute s used to define the type of geometric construction for the geometry attribute.

Parameters
----------
S: TNaming_NamedShape

Returns
-------
TDataXtd_GeometryEnum
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
		/****************** ComputeTrsfs ******************/
		%feature("compactdefaultargs") ComputeTrsfs;
		%feature("autodoc", "Give the transformations.

Parameters
----------
Trsfs: TDataXtd_Array1OfTrsf

Returns
-------
None
") ComputeTrsfs;
		virtual void ComputeTrsfs(TDataXtd_Array1OfTrsf & Trsfs);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NbTrsfs ******************/
		%feature("compactdefaultargs") NbTrsfs;
		%feature("autodoc", "Give the number of transformation.

Returns
-------
int
") NbTrsfs;
		virtual Standard_Integer NbTrsfs();

		/****************** PatternID ******************/
		%feature("compactdefaultargs") PatternID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
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
class TDataXtd_Placement : public TDF_Attribute {
	public:
		/****************** TDataXtd_Placement ******************/
		%feature("compactdefaultargs") TDataXtd_Placement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataXtd_Placement;
		 TDataXtd_Placement();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, an placement attribute. the placement attribute is returned. placement methods =================.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataXtd_Placement>
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
class TDataXtd_Plane : public TDF_Attribute {
	public:
		/****************** TDataXtd_Plane ******************/
		%feature("compactdefaultargs") TDataXtd_Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataXtd_Plane;
		 TDataXtd_Plane();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= //! returns the guid for plane attributes.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates the plane attribute defined by the label label. warning if you are creating the attribute with this syntax, a planar face should already be associated with label.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataXtd_Plane>
") Set;
		static opencascade::handle<TDataXtd_Plane> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, a plane attribute and sets <p> as generated the associated namedshape. plane methods =============.

Parameters
----------
label: TDF_Label
P: gp_Pln

Returns
-------
opencascade::handle<TDataXtd_Plane>
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
class TDataXtd_Point : public TDF_Attribute {
	public:
		/****************** TDataXtd_Point ******************/
		%feature("compactdefaultargs") TDataXtd_Point;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataXtd_Point;
		 TDataXtd_Point();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= //! returns the guid for point attributes.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the label label as a point attribute. if no object is found, a point attribute is created.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataXtd_Point>
") Set;
		static opencascade::handle<TDataXtd_Point> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the label label as a point attribute containing the point p. if no object is found, a point attribute is created. point methods =============.

Parameters
----------
label: TDF_Label
P: gp_Pnt

Returns
-------
opencascade::handle<TDataXtd_Point>
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
		/****************** TDataXtd_Position ******************/
		%feature("compactdefaultargs") TDataXtd_Position;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataXtd_Position;
		 TDataXtd_Position();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Search label <alabel) for the tdataxtd_position attribute and get its position if found returns true.

Parameters
----------
aLabel: TDF_Label
aPos: gp_Pnt

Returns
-------
bool
") Get;
		static Standard_Boolean Get(const TDF_Label & aLabel, gp_Pnt & aPos);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetPosition ******************/
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") GetPosition;
		const gp_Pnt GetPosition();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty attribute from the good end type. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is different from the 'copy' one, because it is used when copying an attribute from a source structure into a target structure. this method pastes the current attribute to the label corresponding to the insertor. the pasted attribute may be a brand new one or a new version of the previous one.

Parameters
----------
intoAttribute: TDF_Attribute
aRelocTationable: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the contents from <anattribute> into this one. it is used when aborting a transaction.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create if not found the tdataxtd_position attribute set its position to <apos>.

Parameters
----------
aLabel: TDF_Label
aPos: gp_Pnt

Returns
-------
None
") Set;
		static void Set(const TDF_Label & aLabel, const gp_Pnt & aPos);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find an existing, or create an empty, position. the position attribute is returned.

Parameters
----------
aLabel: TDF_Label

Returns
-------
opencascade::handle<TDataXtd_Position>
") Set;
		static opencascade::handle<TDataXtd_Position> Set(const TDF_Label & aLabel);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPos: gp_Pnt

Returns
-------
None
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
		/****************** TDataXtd_Presentation ******************/
		%feature("compactdefaultargs") TDataXtd_Presentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") TDataXtd_Presentation;
		 TDataXtd_Presentation();

		/****************** AddSelectionMode ******************/
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSelectionMode: int
theTransaction: bool,optional
	default value is Standard_True

Returns
-------
None
") AddSelectionMode;
		void AddSelectionMode(const Standard_Integer theSelectionMode, const Standard_Boolean theTransaction = Standard_True);

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_NameOfColor
") Color;
		Quantity_NameOfColor Color();

		/****************** GetDriverGUID ******************/
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "Returns the guid of the driver managing display of associated ais object.

Returns
-------
Standard_GUID
") GetDriverGUID;
		Standard_GUID GetDriverGUID();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetNbSelectionModes ******************/
		%feature("compactdefaultargs") GetNbSelectionModes;
		%feature("autodoc", "Returns the number of selection modes of the attribute. it starts with 1 .. getnbselectionmodes().

Returns
-------
int
") GetNbSelectionModes;
		Standard_Integer GetNbSelectionModes();

		/****************** HasOwnColor ******************/
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnColor;
		Standard_Boolean HasOwnColor();

		/****************** HasOwnMaterial ******************/
		%feature("compactdefaultargs") HasOwnMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnMaterial;
		Standard_Boolean HasOwnMaterial();

		/****************** HasOwnMode ******************/
		%feature("compactdefaultargs") HasOwnMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnMode;
		Standard_Boolean HasOwnMode();

		/****************** HasOwnSelectionMode ******************/
		%feature("compactdefaultargs") HasOwnSelectionMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnSelectionMode;
		Standard_Boolean HasOwnSelectionMode();

		/****************** HasOwnTransparency ******************/
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnTransparency;
		Standard_Boolean HasOwnTransparency();

		/****************** HasOwnWidth ******************/
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnWidth;
		Standard_Boolean HasOwnWidth();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDisplayed;
		Standard_Boolean IsDisplayed();

		/****************** MaterialIndex ******************/
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MaterialIndex;
		Standard_Integer MaterialIndex();

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Mode;
		Standard_Integer Mode();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty attribute from the good end type. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is different from the 'copy' one, because it is used when copying an attribute from a source structure into a target structure. this method pastes the current attribute to the label corresponding to the insertor. the pasted attribute may be a brand new one or a new version of the previous one.

Parameters
----------
intoAttribute: TDF_Attribute
aRelocTationable: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the contents from <anattribute> into this one. it is used when aborting a transaction.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** SelectionMode ******************/
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
index: int,optional
	default value is 1

Returns
-------
int
") SelectionMode;
		Standard_Integer SelectionMode(const int index = 1);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create if not found the tdataxtd_presentation attribute and set its driver guid.

Parameters
----------
theLabel: TDF_Label
theDriverId: Standard_GUID

Returns
-------
opencascade::handle<TDataXtd_Presentation>
") Set;
		static opencascade::handle<TDataXtd_Presentation> Set(const TDF_Label & theLabel, const Standard_GUID & theDriverId);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
theColor: Quantity_NameOfColor

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_NameOfColor theColor);

		/****************** SetDisplayed ******************/
		%feature("compactdefaultargs") SetDisplayed;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIsDisplayed: bool

Returns
-------
None
") SetDisplayed;
		void SetDisplayed(const Standard_Boolean theIsDisplayed);

		/****************** SetDriverGUID ******************/
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "Sets the guid of the driver managing display of associated ais object.

Parameters
----------
theGUID: Standard_GUID

Returns
-------
None
") SetDriverGUID;
		void SetDriverGUID(const Standard_GUID & theGUID);

		/****************** SetMaterialIndex ******************/
		%feature("compactdefaultargs") SetMaterialIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMaterialIndex: int

Returns
-------
None
") SetMaterialIndex;
		void SetMaterialIndex(const Standard_Integer theMaterialIndex);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMode: int

Returns
-------
None
") SetMode;
		void SetMode(const Standard_Integer theMode);

		/****************** SetSelectionMode ******************/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "Sets selection mode. if 'thetransaction' flag is off, modification of the attribute doesn't influence the transaction mechanism (the attribute doesn't participate in undo/redo because of this modification). certainly, if any other data of the attribute is modified (display mode, color, ...), the attribute will be included into undo/redo.

Parameters
----------
theSelectionMode: int
theTransaction: bool,optional
	default value is Standard_True

Returns
-------
None
") SetSelectionMode;
		void SetSelectionMode(const Standard_Integer theSelectionMode, const Standard_Boolean theTransaction = Standard_True);

		/****************** SetTransparency ******************/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: float

Returns
-------
None
") SetTransparency;
		void SetTransparency(const Standard_Real theValue);

		/****************** SetWidth ******************/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "No available documentation.

Parameters
----------
theWidth: float

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Real theWidth);

		/****************** Transparency ******************/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Transparency;
		Standard_Real Transparency();

		/****************** Unset ******************/
		%feature("compactdefaultargs") Unset;
		%feature("autodoc", "Remove attribute of this type from the label.

Parameters
----------
theLabel: TDF_Label

Returns
-------
None
") Unset;
		static void Unset(const TDF_Label & theLabel);

		/****************** UnsetColor ******************/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetColor;
		void UnsetColor();

		/****************** UnsetMaterial ******************/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetMaterial;
		void UnsetMaterial();

		/****************** UnsetMode ******************/
		%feature("compactdefaultargs") UnsetMode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetMode;
		void UnsetMode();

		/****************** UnsetSelectionMode ******************/
		%feature("compactdefaultargs") UnsetSelectionMode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetSelectionMode;
		void UnsetSelectionMode();

		/****************** UnsetTransparency ******************/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetTransparency;
		void UnsetTransparency();

		/****************** UnsetWidth ******************/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetWidth;
		void UnsetWidth();

		/****************** Width ******************/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Width;
		Standard_Real Width();

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
class TDataXtd_Shape : public TDF_Attribute {
	public:
		/****************** TDataXtd_Shape ******************/
		%feature("compactdefaultargs") TDataXtd_Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataXtd_Shape;
		 TDataXtd_Shape();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Class methods ============= try to retrieve a shape attribute at <current> label or in fathers label of <current>. returns true if found and set <s>.

Parameters
----------
current: TDF_Label
S: TDataXtd_Shape

Returns
-------
bool
") Find;
		static Standard_Boolean Find(const TDF_Label & current, opencascade::handle<TDataXtd_Shape> & S);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "The shape from associated namedshape attribute is returned.

Parameters
----------
label: TDF_Label

Returns
-------
TopoDS_Shape
") Get;
		static TopoDS_Shape Get(const TDF_Label & label);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Shape methods ============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** New ******************/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "Find, or create, a shape attribute. the shape attribute is returned. raises if <label> has attribute.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataXtd_Shape>
") New;
		static opencascade::handle<TDataXtd_Shape> New(const TDF_Label & label);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create or update associated namedshape attribute. the shape attribute is returned.

Parameters
----------
label: TDF_Label
shape: TopoDS_Shape

Returns
-------
opencascade::handle<TDataXtd_Shape>
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
		/****************** TDataXtd_Triangulation ******************/
		%feature("compactdefaultargs") TDataXtd_Triangulation;
		%feature("autodoc", "A constructor. don't use it directly, use please the static method set(), which returns the attribute attached to a label.

Returns
-------
None
") TDataXtd_Triangulation;
		 TDataXtd_Triangulation();

		/****************** Deflection ******************/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection of this triangulation.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Deflection ******************/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Sets the deflection of this triangulation to thedeflection. see more on deflection in polygon2d.

Parameters
----------
theDeflection: float

Returns
-------
None
") Deflection;
		void Deflection(const Standard_Real theDeflection);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the underlying triangulation.

Returns
-------
opencascade::handle<Poly_Triangulation>
") Get;
		const opencascade::handle<Poly_Triangulation> & Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the id of the triangulation attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** HasNormals ******************/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Returns standard_true if nodal normals are defined.

Returns
-------
bool
") HasNormals;
		Standard_Boolean HasNormals();

		/****************** HasUVNodes ******************/
		%feature("compactdefaultargs") HasUVNodes;
		%feature("autodoc", "Returns standard_true if 2d nodes are associated with 3d nodes for this triangulation.

Returns
-------
bool
") HasUVNodes;
		Standard_Boolean HasUVNodes();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NbNodes ******************/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns the number of nodes for this triangulation.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** NbTriangles ******************/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Returns the number of triangles for this triangulation.

Returns
-------
int
") NbTriangles;
		Standard_Integer NbTriangles();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Node ******************/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "Returns node at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbnodes.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt
") Node;
		const gp_Pnt Node(const Standard_Integer theIndex);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns normal at the given index. raises standard_outofrange exception.

Parameters
----------
theIndex: int

Returns
-------
gp_Dir
") Normal;
		const gp_Dir Normal(const Standard_Integer theIndex);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveUVNodes ******************/
		%feature("compactdefaultargs") RemoveUVNodes;
		%feature("autodoc", "Deallocates the uv nodes.

Returns
-------
None
") RemoveUVNodes;
		void RemoveUVNodes();

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttribute: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttribute);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a triangulation attribute.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<TDataXtd_Triangulation>
") Set;
		static opencascade::handle<TDataXtd_Triangulation> Set(const TDF_Label & theLabel);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a triangulation attribute. initializes the attribute by a poly_triangulation object.

Parameters
----------
theLabel: TDF_Label
theTriangulation: Poly_Triangulation

Returns
-------
opencascade::handle<TDataXtd_Triangulation>
") Set;
		static opencascade::handle<TDataXtd_Triangulation> Set(const TDF_Label & theLabel, const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the triangulation.

Parameters
----------
theTriangulation: Poly_Triangulation

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****************** SetNode ******************/
		%feature("compactdefaultargs") SetNode;
		%feature("autodoc", "The method differs from poly_triangulation! sets a node at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbnodes.

Parameters
----------
theIndex: int
theNode: gp_Pnt

Returns
-------
None
") SetNode;
		void SetNode(const Standard_Integer theIndex, const gp_Pnt & theNode);

		/****************** SetNormal ******************/
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "Changes normal at the given index. raises standard_outofrange exception.

Parameters
----------
theIndex: int
theNormal: gp_Dir

Returns
-------
None
") SetNormal;
		void SetNormal(const Standard_Integer theIndex, const gp_Dir & theNormal);

		/****************** SetNormals ******************/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "Sets the table of node normals. raises exception if length of thenormals != 3 * nbnodes.

Parameters
----------
theNormals: TShort_HArray1OfShortReal

Returns
-------
None
") SetNormals;
		void SetNormals(const opencascade::handle<TShort_HArray1OfShortReal> & theNormals);

		/****************** SetTriangle ******************/
		%feature("compactdefaultargs") SetTriangle;
		%feature("autodoc", "The method differs from poly_triangulation! sets a triangle at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbtriangles.

Parameters
----------
theIndex: int
theTriangle: Poly_Triangle

Returns
-------
None
") SetTriangle;
		void SetTriangle(const Standard_Integer theIndex, const Poly_Triangle & theTriangle);

		/****************** SetUVNode ******************/
		%feature("compactdefaultargs") SetUVNode;
		%feature("autodoc", "The method differs from poly_triangulation! sets a uvnode at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbnodes.

Parameters
----------
theIndex: int
theUVNode: gp_Pnt2d

Returns
-------
None
") SetUVNode;
		void SetUVNode(const Standard_Integer theIndex, const gp_Pnt2d & theUVNode);

		/****************** Triangle ******************/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "Returns triangle at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbtriangles.

Parameters
----------
theIndex: int

Returns
-------
Poly_Triangle
") Triangle;
		const Poly_Triangle & Triangle(const Standard_Integer theIndex);

		/****************** UVNode ******************/
		%feature("compactdefaultargs") UVNode;
		%feature("autodoc", "Returns uvnode at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbnodes.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt2d
") UVNode;
		const gp_Pnt2d UVNode(const Standard_Integer theIndex);

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
		/****************** TDataXtd_PatternStd ******************/
		%feature("compactdefaultargs") TDataXtd_PatternStd;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataXtd_PatternStd;
		 TDataXtd_PatternStd();

		/****************** Axis1 ******************/
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Axis1: TNaming_NamedShape

Returns
-------
None
") Axis1;
		void Axis1(const opencascade::handle<TNaming_NamedShape> & Axis1);

		/****************** Axis1 ******************/
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") Axis1;
		opencascade::handle<TNaming_NamedShape> Axis1();

		/****************** Axis1Reversed ******************/
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", "No available documentation.

Parameters
----------
Axis1Reversed: bool

Returns
-------
None
") Axis1Reversed;
		void Axis1Reversed(const Standard_Boolean Axis1Reversed);

		/****************** Axis1Reversed ******************/
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Axis1Reversed;
		Standard_Boolean Axis1Reversed();

		/****************** Axis2 ******************/
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Axis2: TNaming_NamedShape

Returns
-------
None
") Axis2;
		void Axis2(const opencascade::handle<TNaming_NamedShape> & Axis2);

		/****************** Axis2 ******************/
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") Axis2;
		opencascade::handle<TNaming_NamedShape> Axis2();

		/****************** Axis2Reversed ******************/
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", "No available documentation.

Parameters
----------
Axis2Reversed: bool

Returns
-------
None
") Axis2Reversed;
		void Axis2Reversed(const Standard_Boolean Axis2Reversed);

		/****************** Axis2Reversed ******************/
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Axis2Reversed;
		Standard_Boolean Axis2Reversed();

		/****************** ComputeTrsfs ******************/
		%feature("compactdefaultargs") ComputeTrsfs;
		%feature("autodoc", "No available documentation.

Parameters
----------
Trsfs: TDataXtd_Array1OfTrsf

Returns
-------
None
") ComputeTrsfs;
		void ComputeTrsfs(TDataXtd_Array1OfTrsf & Trsfs);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetPatternID ******************/
		%feature("compactdefaultargs") GetPatternID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetPatternID;
		static const Standard_GUID & GetPatternID();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
plane: TNaming_NamedShape

Returns
-------
None
") Mirror;
		void Mirror(const opencascade::handle<TNaming_NamedShape> & plane);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") Mirror;
		opencascade::handle<TNaming_NamedShape> Mirror();

		/****************** NbInstances1 ******************/
		%feature("compactdefaultargs") NbInstances1;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbInstances1: TDataStd_Integer

Returns
-------
None
") NbInstances1;
		void NbInstances1(const opencascade::handle<TDataStd_Integer> & NbInstances1);

		/****************** NbInstances1 ******************/
		%feature("compactdefaultargs") NbInstances1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDataStd_Integer>
") NbInstances1;
		opencascade::handle<TDataStd_Integer> NbInstances1();

		/****************** NbInstances2 ******************/
		%feature("compactdefaultargs") NbInstances2;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbInstances2: TDataStd_Integer

Returns
-------
None
") NbInstances2;
		void NbInstances2(const opencascade::handle<TDataStd_Integer> & NbInstances2);

		/****************** NbInstances2 ******************/
		%feature("compactdefaultargs") NbInstances2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDataStd_Integer>
") NbInstances2;
		opencascade::handle<TDataStd_Integer> NbInstances2();

		/****************** NbTrsfs ******************/
		%feature("compactdefaultargs") NbTrsfs;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbTrsfs;
		Standard_Integer NbTrsfs();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** PatternID ******************/
		%feature("compactdefaultargs") PatternID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") PatternID;
		const Standard_GUID & PatternID();

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a patternstd attribute.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataXtd_PatternStd>
") Set;
		static opencascade::handle<TDataXtd_PatternStd> Set(const TDF_Label & label);

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "No available documentation.

Parameters
----------
signature: int

Returns
-------
None
") Signature;
		void Signature(const Standard_Integer signature);

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Signature;
		Standard_Integer Signature();

		/****************** Value1 ******************/
		%feature("compactdefaultargs") Value1;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: TDataStd_Real

Returns
-------
None
") Value1;
		void Value1(const opencascade::handle<TDataStd_Real> & value);

		/****************** Value1 ******************/
		%feature("compactdefaultargs") Value1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDataStd_Real>
") Value1;
		opencascade::handle<TDataStd_Real> Value1();

		/****************** Value2 ******************/
		%feature("compactdefaultargs") Value2;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: TDataStd_Real

Returns
-------
None
") Value2;
		void Value2(const opencascade::handle<TDataStd_Real> & value);

		/****************** Value2 ******************/
		%feature("compactdefaultargs") Value2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDataStd_Real>
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
class TDataXtd_HArray1OfTrsf : public  TDataXtd_Array1OfTrsf, public Standard_Transient {
  public:
    TDataXtd_HArray1OfTrsf(const Standard_Integer theLower, const Standard_Integer theUpper);
    TDataXtd_HArray1OfTrsf(const Standard_Integer theLower, const Standard_Integer theUpper, const  TDataXtd_Array1OfTrsf::value_type& theValue);
    TDataXtd_HArray1OfTrsf(const  TDataXtd_Array1OfTrsf& theOther);
    const  TDataXtd_Array1OfTrsf& Array1();
     TDataXtd_Array1OfTrsf& ChangeArray1();
};
%make_alias(TDataXtd_HArray1OfTrsf)


/* harray2 classes */
/* hsequence classes */
