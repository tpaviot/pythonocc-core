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
%template(TDataXtd_Array1OfTrsf) NCollection_Array1 <gp_Trsf>;

%extend NCollection_Array1 <gp_Trsf> {
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
typedef NCollection_Array1 <gp_Trsf> TDataXtd_Array1OfTrsf;
/* end typedefs declaration */

/*****************
* class TDataXtd *
*****************/
%rename(tdataxtd) TDataXtd;
class TDataXtd {
	public:
		/****************** IDList ******************/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "* Appends to <anIDList> the list of the attributes IDs of this package. CAUTION: <anIDList> is NOT cleared before use. Print of TDataExt enumeration =============================
	:param anIDList:
	:type anIDList: TDF_IDList
	:rtype: void") IDList;
		static void IDList (TDF_IDList & anIDList);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints the name of the geometry dimension <GEO> as a String on the Stream <S> and returns <S>.
	:param GEO:
	:type GEO: TDataXtd_GeometryEnum
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TDataXtd_GeometryEnum GEO,Standard_OStream & S);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints the name of the constraint <CTR> as a String on the Stream <S> and returns <S>.
	:param CTR:
	:type CTR: TDataXtd_ConstraintEnum
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TDataXtd_ConstraintEnum CTR,Standard_OStream & S);

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

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* class methods ============= Returns the GUID for an axis.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param with:
	:type with: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or creates an axis attribute defined by the label. In the case of a creation of an axis, a compatible named shape should already be associated with label. Exceptions Standard_NullObject if no compatible named shape is associated with the label.
	:param label:
	:type label: TDF_Label
	:rtype: opencascade::handle<TDataXtd_Axis>") Set;
		static opencascade::handle<TDataXtd_Axis> Set (const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Find, or create, an Axis attribute and set <P> as generated in the associated NamedShape. Axis methods ============
	:param label:
	:type label: TDF_Label
	:param L:
	:type L: gp_Lin
	:rtype: opencascade::handle<TDataXtd_Axis>") Set;
		static opencascade::handle<TDataXtd_Axis> Set (const TDF_Label & label,const gp_Lin & L);

		/****************** TDataXtd_Axis ******************/
		%feature("compactdefaultargs") TDataXtd_Axis;
		%feature("autodoc", ":rtype: None") TDataXtd_Axis;
		 TDataXtd_Axis ();

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
		/****************** ClearGeometries ******************/
		%feature("compactdefaultargs") ClearGeometries;
		%feature("autodoc", "* Removes the geometries involved in the constraint or dimension from the array of topological attributes where they are stored.
	:rtype: None") ClearGeometries;
		void ClearGeometries ();

		/****************** CollectChildConstraints ******************/
		%feature("compactdefaultargs") CollectChildConstraints;
		%feature("autodoc", "* collects constraints on Childs for label <aLabel>
	:param aLabel:
	:type aLabel: TDF_Label
	:param TheList:
	:type TheList: TDF_LabelList
	:rtype: void") CollectChildConstraints;
		static void CollectChildConstraints (const TDF_Label & aLabel,TDF_LabelList & TheList);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetGeometry ******************/
		%feature("compactdefaultargs") GetGeometry;
		%feature("autodoc", "* Returns the integer index Index used to access the array of the constraint or stored geometries of a dimension Index has a value between 1 and 4. methods to write constraint fields (use builder) ==================================
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<TNaming_NamedShape>") GetGeometry;
		opencascade::handle<TNaming_NamedShape> GetGeometry (const Standard_Integer Index);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Returns the GUID for constraints.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** GetPlane ******************/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "* Returns the topological attribute of the plane used for planar - i.e., 2D - constraints. This plane is attached to another label. If the constraint is not planar, in other words, 3D, this function will return a null handle.
	:rtype: opencascade::handle<TNaming_NamedShape>") GetPlane;
		const opencascade::handle<TNaming_NamedShape> & GetPlane ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of constraint. This will be an element of the TDataXtd_ConstraintEnum enumeration.
	:rtype: TDataXtd_ConstraintEnum") GetType;
		TDataXtd_ConstraintEnum GetType ();

		/****************** GetValue ******************/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "* Returns the value of a dimension. This value is a reference to a TDataStd_Real attribute. If the attribute is not a dimension, this value will be 0. Use IsDimension to test this condition.
	:rtype: opencascade::handle<TDataStd_Real>") GetValue;
		const opencascade::handle<TDataStd_Real> & GetValue ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", ":param status:
	:type status: bool
	:rtype: None") Inverted;
		void Inverted (const Standard_Boolean status);

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", ":rtype: bool") Inverted;
		Standard_Boolean Inverted ();

		/****************** IsDimension ******************/
		%feature("compactdefaultargs") IsDimension;
		%feature("autodoc", "* Returns true if this constraint attribute is a dimension, and therefore has a value.
	:rtype: bool") IsDimension;
		Standard_Boolean IsDimension ();

		/****************** IsPlanar ******************/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "* Returns true if this constraint attribute is two-dimensional.
	:rtype: bool") IsPlanar;
		Standard_Boolean IsPlanar ();

		/****************** NbGeometries ******************/
		%feature("compactdefaultargs") NbGeometries;
		%feature("autodoc", "* Returns the number of geometry attributes in this constraint attribute. This number will be between 1 and 4.
	:rtype: int") NbGeometries;
		Standard_Integer NbGeometries ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", ":param DS:
	:type DS: TDF_DataSet
	:rtype: void") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & DS);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param With:
	:type With: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", ":param status:
	:type status: bool
	:rtype: None") Reversed;
		void Reversed (const Standard_Boolean status);

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", ":rtype: bool") Reversed;
		Standard_Boolean Reversed ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or creates the 2D constraint attribute defined by the planar topological attribute plane and the label label. Constraint methods ==================
	:param label:
	:type label: TDF_Label
	:rtype: opencascade::handle<TDataXtd_Constraint>") Set;
		static opencascade::handle<TDataXtd_Constraint> Set (const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or creates the constraint attribute defined by the topological attribute G1 and the constraint type type.
	:param type:
	:type type: TDataXtd_ConstraintEnum
	:param G1:
	:type G1: TNaming_NamedShape
	:rtype: None") Set;
		void Set (const TDataXtd_ConstraintEnum type,const opencascade::handle<TNaming_NamedShape> & G1);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or creates the constraint attribute defined by the topological attributes G1 and G2, and by the constraint type type.
	:param type:
	:type type: TDataXtd_ConstraintEnum
	:param G1:
	:type G1: TNaming_NamedShape
	:param G2:
	:type G2: TNaming_NamedShape
	:rtype: None") Set;
		void Set (const TDataXtd_ConstraintEnum type,const opencascade::handle<TNaming_NamedShape> & G1,const opencascade::handle<TNaming_NamedShape> & G2);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or creates the constraint attribute defined by the topological attributes G1, G2 and G3, and by the constraint type type.
	:param type:
	:type type: TDataXtd_ConstraintEnum
	:param G1:
	:type G1: TNaming_NamedShape
	:param G2:
	:type G2: TNaming_NamedShape
	:param G3:
	:type G3: TNaming_NamedShape
	:rtype: None") Set;
		void Set (const TDataXtd_ConstraintEnum type,const opencascade::handle<TNaming_NamedShape> & G1,const opencascade::handle<TNaming_NamedShape> & G2,const opencascade::handle<TNaming_NamedShape> & G3);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or creates the constraint attribute defined by the topological attributes G1, G2, G3 and G4, and by the constraint type type. methods to read constraint fields =================================
	:param type:
	:type type: TDataXtd_ConstraintEnum
	:param G1:
	:type G1: TNaming_NamedShape
	:param G2:
	:type G2: TNaming_NamedShape
	:param G3:
	:type G3: TNaming_NamedShape
	:param G4:
	:type G4: TNaming_NamedShape
	:rtype: None") Set;
		void Set (const TDataXtd_ConstraintEnum type,const opencascade::handle<TNaming_NamedShape> & G1,const opencascade::handle<TNaming_NamedShape> & G2,const opencascade::handle<TNaming_NamedShape> & G3,const opencascade::handle<TNaming_NamedShape> & G4);

		/****************** SetGeometry ******************/
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", "* Finds or creates the underlying geometry of the constraint defined by the topological attribute G and the integer index Index.
	:param Index:
	:type Index: int
	:param G:
	:type G: TNaming_NamedShape
	:rtype: None") SetGeometry;
		void SetGeometry (const Standard_Integer Index,const opencascade::handle<TNaming_NamedShape> & G);

		/****************** SetPlane ******************/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "* Finds or creates the plane of the 2D constraint attribute, defined by the planar topological attribute plane.
	:param plane:
	:type plane: TNaming_NamedShape
	:rtype: None") SetPlane;
		void SetPlane (const opencascade::handle<TNaming_NamedShape> & plane);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Finds or creates the type of constraint CTR.
	:param CTR:
	:type CTR: TDataXtd_ConstraintEnum
	:rtype: None") SetType;
		void SetType (const TDataXtd_ConstraintEnum CTR);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Finds or creates the real number value V of the dimension constraint attribute.
	:param V:
	:type V: TDataStd_Real
	:rtype: None") SetValue;
		void SetValue (const opencascade::handle<TDataStd_Real> & V);

		/****************** TDataXtd_Constraint ******************/
		%feature("compactdefaultargs") TDataXtd_Constraint;
		%feature("autodoc", ":rtype: None") TDataXtd_Constraint;
		 TDataXtd_Constraint ();

		/****************** Verified ******************/
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "* Returns true if this constraint attribute is valid. By default, true is returned. When the value of a dimension is changed or when a geometry is moved, false is returned until the solver sets it back to true.
	:rtype: bool") Verified;
		Standard_Boolean Verified ();

		/****************** Verified ******************/
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "* Returns true if this constraint attribute defined by status is valid. By default, true is returned. When the value of a dimension is changed or when a geometry is moved, false is returned until the solver sets it back to true. If status is false, Verified is set to false.
	:param status:
	:type status: bool
	:rtype: None") Verified;
		void Verified (const Standard_Boolean status);

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
		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the axis attribute defined by the label L and the axis G.
	:param L:
	:type L: TDF_Label
	:param G:
	:type G: gp_Ax1
	:rtype: bool") Axis;
		static Standard_Boolean Axis (const TDF_Label & L,gp_Ax1 & G);

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the axis attribute defined by the topological attribute S and the axis G.
	:param S:
	:type S: TNaming_NamedShape
	:param G:
	:type G: gp_Ax1
	:rtype: bool") Axis;
		static Standard_Boolean Axis (const opencascade::handle<TNaming_NamedShape> & S,gp_Ax1 & G);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "* Returns the circle attribute defined by the label L and the circle G.
	:param L:
	:type L: TDF_Label
	:param G:
	:type G: gp_Circ
	:rtype: bool") Circle;
		static Standard_Boolean Circle (const TDF_Label & L,gp_Circ & G);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "* Returns the circle attribute defined by the topological attribute S and the circle G.
	:param S:
	:type S: TNaming_NamedShape
	:param G:
	:type G: gp_Circ
	:rtype: bool") Circle;
		static Standard_Boolean Circle (const opencascade::handle<TNaming_NamedShape> & S,gp_Circ & G);

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "* Returns the cylinder attribute defined by the label L and the cylinder G.
	:param L:
	:type L: TDF_Label
	:param G:
	:type G: gp_Cylinder
	:rtype: bool") Cylinder;
		static Standard_Boolean Cylinder (const TDF_Label & L,gp_Cylinder & G);

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "* Returns the cylinder attribute defined by the topological attribute S and the cylinder G.
	:param S:
	:type S: TNaming_NamedShape
	:param G:
	:type G: gp_Cylinder
	:rtype: bool") Cylinder;
		static Standard_Boolean Cylinder (const opencascade::handle<TNaming_NamedShape> & S,gp_Cylinder & G);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "* Returns the ellipse attribute defined by the label L and the ellipse G.
	:param L:
	:type L: TDF_Label
	:param G:
	:type G: gp_Elips
	:rtype: bool") Ellipse;
		static Standard_Boolean Ellipse (const TDF_Label & L,gp_Elips & G);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "* Returns the ellipse attribute defined by the topological attribute S and the ellipse G.
	:param S:
	:type S: TNaming_NamedShape
	:param G:
	:type G: gp_Elips
	:rtype: bool") Ellipse;
		static Standard_Boolean Ellipse (const opencascade::handle<TNaming_NamedShape> & S,gp_Elips & G);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Returns the GUID for geometry attributes.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of geometric construction.
	:rtype: TDataXtd_GeometryEnum") GetType;
		TDataXtd_GeometryEnum GetType ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the line attribute defined by the label L and the line G.
	:param L:
	:type L: TDF_Label
	:param G:
	:type G: gp_Lin
	:rtype: bool") Line;
		static Standard_Boolean Line (const TDF_Label & L,gp_Lin & G);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the line attribute defined by the topological attribute S and the line G.
	:param S:
	:type S: TNaming_NamedShape
	:param G:
	:type G: gp_Lin
	:rtype: bool") Line;
		static Standard_Boolean Line (const opencascade::handle<TNaming_NamedShape> & S,gp_Lin & G);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "* Returns the plane attribute defined by the label L and the plane G.
	:param L:
	:type L: TDF_Label
	:param G:
	:type G: gp_Pln
	:rtype: bool") Plane;
		static Standard_Boolean Plane (const TDF_Label & L,gp_Pln & G);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "* Returns the plane attribute defined by the topological attribute S and the plane G.
	:param S:
	:type S: TNaming_NamedShape
	:param G:
	:type G: gp_Pln
	:rtype: bool") Plane;
		static Standard_Boolean Plane (const opencascade::handle<TNaming_NamedShape> & S,gp_Pln & G);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point attribute defined by the label L and the point G.
	:param L:
	:type L: TDF_Label
	:param G:
	:type G: gp_Pnt
	:rtype: bool") Point;
		static Standard_Boolean Point (const TDF_Label & L,gp_Pnt & G);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point attribute defined by the topological attribute S and the point G.
	:param S:
	:type S: TNaming_NamedShape
	:param G:
	:type G: gp_Pnt
	:rtype: bool") Point;
		static Standard_Boolean Point (const opencascade::handle<TNaming_NamedShape> & S,gp_Pnt & G);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param with:
	:type with: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* API class methods ================= Finds, or creates, a Geometry attribute defined by the label label. The default type of geometry is the value ANY_GEOM of the enumeration TDataXtd_GeometryEnum. To specify another value of this enumeration, use the function SetType.
	:param label:
	:type label: TDF_Label
	:rtype: opencascade::handle<TDataXtd_Geometry>") Set;
		static opencascade::handle<TDataXtd_Geometry> Set (const TDF_Label & label);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Returns the type of geometric construction T of this attribute. T will be a value of the enumeration TDataXtd_GeometryEnum.
	:param T:
	:type T: TDataXtd_GeometryEnum
	:rtype: None") SetType;
		void SetType (const TDataXtd_GeometryEnum T);

		/****************** TDataXtd_Geometry ******************/
		%feature("compactdefaultargs") TDataXtd_Geometry;
		%feature("autodoc", "* This and the next methods are used to retrieve underlying geometry of the NamedShape, even if noone Geometry Attribute is associated . if not found or not compliant geometry return False.
	:rtype: None") TDataXtd_Geometry;
		 TDataXtd_Geometry ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the label L used to define the type of geometric construction for the geometry attribute.
	:param L:
	:type L: TDF_Label
	:rtype: TDataXtd_GeometryEnum") Type;
		static TDataXtd_GeometryEnum Type (const TDF_Label & L);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the topological attribute S used to define the type of geometric construction for the geometry attribute.
	:param S:
	:type S: TNaming_NamedShape
	:rtype: TDataXtd_GeometryEnum") Type;
		static TDataXtd_GeometryEnum Type (const opencascade::handle<TNaming_NamedShape> & S);

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
		%feature("autodoc", "* Give the transformations
	:param Trsfs:
	:type Trsfs: TDataXtd_Array1OfTrsf
	:rtype: void") ComputeTrsfs;
		virtual void ComputeTrsfs (TDataXtd_Array1OfTrsf & Trsfs);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", ":rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* Returns the ID of the attribute.
	:rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NbTrsfs ******************/
		%feature("compactdefaultargs") NbTrsfs;
		%feature("autodoc", "* Give the number of transformation
	:rtype: int") NbTrsfs;
		virtual Standard_Integer NbTrsfs ();

		/****************** PatternID ******************/
		%feature("compactdefaultargs") PatternID;
		%feature("autodoc", "* Returns the ID of the attribute.
	:rtype: Standard_GUID") PatternID;
		virtual const Standard_GUID & PatternID ();

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

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* class methods =============
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param With:
	:type With: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Find, or create, an Placement attribute. the Placement attribute is returned. Placement methods =================
	:param label:
	:type label: TDF_Label
	:rtype: opencascade::handle<TDataXtd_Placement>") Set;
		static opencascade::handle<TDataXtd_Placement> Set (const TDF_Label & label);

		/****************** TDataXtd_Placement ******************/
		%feature("compactdefaultargs") TDataXtd_Placement;
		%feature("autodoc", ":rtype: None") TDataXtd_Placement;
		 TDataXtd_Placement ();

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

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* class methods ============= //! Returns the GUID for plane attributes.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param With:
	:type With: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or creates the plane attribute defined by the label label. Warning If you are creating the attribute with this syntax, a planar face should already be associated with label.
	:param label:
	:type label: TDF_Label
	:rtype: opencascade::handle<TDataXtd_Plane>") Set;
		static opencascade::handle<TDataXtd_Plane> Set (const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds, or creates, a Plane attribute and sets <P> as generated the associated NamedShape. Plane methods =============
	:param label:
	:type label: TDF_Label
	:param P:
	:type P: gp_Pln
	:rtype: opencascade::handle<TDataXtd_Plane>") Set;
		static opencascade::handle<TDataXtd_Plane> Set (const TDF_Label & label,const gp_Pln & P);

		/****************** TDataXtd_Plane ******************/
		%feature("compactdefaultargs") TDataXtd_Plane;
		%feature("autodoc", ":rtype: None") TDataXtd_Plane;
		 TDataXtd_Plane ();

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

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* class methods ============= //! Returns the GUID for point attributes.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param With:
	:type With: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the label Label as a point attribute. If no object is found, a point attribute is created.
	:param label:
	:type label: TDF_Label
	:rtype: opencascade::handle<TDataXtd_Point>") Set;
		static opencascade::handle<TDataXtd_Point> Set (const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the label Label as a point attribute containing the point P. If no object is found, a point attribute is created. Point methods =============
	:param label:
	:type label: TDF_Label
	:param P:
	:type P: gp_Pnt
	:rtype: opencascade::handle<TDataXtd_Point>") Set;
		static opencascade::handle<TDataXtd_Point> Set (const TDF_Label & label,const gp_Pnt & P);

		/****************** TDataXtd_Point ******************/
		%feature("compactdefaultargs") TDataXtd_Point;
		%feature("autodoc", ":rtype: None") TDataXtd_Point;
		 TDataXtd_Point ();

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
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "* Search label <aLabel) for the TDataXtd_Position attribute and get its position if found returns True
	:param aLabel:
	:type aLabel: TDF_Label
	:param aPos:
	:type aPos: gp_Pnt
	:rtype: bool") Get;
		static Standard_Boolean Get (const TDF_Label & aLabel,gp_Pnt & aPos);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Returns the ID of the attribute.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** GetPosition ******************/
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", ":rtype: gp_Pnt") GetPosition;
		const gp_Pnt  GetPosition ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* Returns the ID of the attribute.
	:rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "* Returns an new empty attribute from the good end type. It is used by the copy algorithm.
	:rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "* This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.
	:param intoAttribute:
	:type intoAttribute: TDF_Attribute
	:param aRelocTationable:
	:type aRelocTationable: TDF_RelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & intoAttribute,const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "* Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: void") Restore;
		virtual void Restore (const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Create if not found the TDataXtd_Position attribute set its position to <aPos>
	:param aLabel:
	:type aLabel: TDF_Label
	:param aPos:
	:type aPos: gp_Pnt
	:rtype: void") Set;
		static void Set (const TDF_Label & aLabel,const gp_Pnt & aPos);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Find an existing, or create an empty, Position. the Position attribute is returned.
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: opencascade::handle<TDataXtd_Position>") Set;
		static opencascade::handle<TDataXtd_Position> Set (const TDF_Label & aLabel);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", ":param aPos:
	:type aPos: gp_Pnt
	:rtype: None") SetPosition;
		void SetPosition (const gp_Pnt & aPos);

		/****************** TDataXtd_Position ******************/
		%feature("compactdefaultargs") TDataXtd_Position;
		%feature("autodoc", ":rtype: None") TDataXtd_Position;
		 TDataXtd_Position ();

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
		/****************** AddSelectionMode ******************/
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", ":param theSelectionMode:
	:type theSelectionMode: int
	:param theTransaction: default value is Standard_True
	:type theTransaction: bool
	:rtype: None") AddSelectionMode;
		void AddSelectionMode (const Standard_Integer theSelectionMode,const Standard_Boolean theTransaction = Standard_True);

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy ();

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", ":rtype: Quantity_NameOfColor") Color;
		Quantity_NameOfColor Color ();

		/****************** GetDriverGUID ******************/
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "* //!@name Access to data Returns the GUID of the driver managing display of associated AIS object
	:rtype: Standard_GUID") GetDriverGUID;
		Standard_GUID GetDriverGUID ();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Returns the ID of the attribute.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** GetNbSelectionModes ******************/
		%feature("compactdefaultargs") GetNbSelectionModes;
		%feature("autodoc", "* Returns the number of selection modes of the attribute. It starts with 1 .. GetNbSelectionModes().
	:rtype: int") GetNbSelectionModes;
		Standard_Integer GetNbSelectionModes ();

		/****************** HasOwnColor ******************/
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", ":rtype: bool") HasOwnColor;
		Standard_Boolean HasOwnColor ();

		/****************** HasOwnMaterial ******************/
		%feature("compactdefaultargs") HasOwnMaterial;
		%feature("autodoc", ":rtype: bool") HasOwnMaterial;
		Standard_Boolean HasOwnMaterial ();

		/****************** HasOwnMode ******************/
		%feature("compactdefaultargs") HasOwnMode;
		%feature("autodoc", ":rtype: bool") HasOwnMode;
		Standard_Boolean HasOwnMode ();

		/****************** HasOwnSelectionMode ******************/
		%feature("compactdefaultargs") HasOwnSelectionMode;
		%feature("autodoc", ":rtype: bool") HasOwnSelectionMode;
		Standard_Boolean HasOwnSelectionMode ();

		/****************** HasOwnTransparency ******************/
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", ":rtype: bool") HasOwnTransparency;
		Standard_Boolean HasOwnTransparency ();

		/****************** HasOwnWidth ******************/
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", ":rtype: bool") HasOwnWidth;
		Standard_Boolean HasOwnWidth ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* Returns the ID of the attribute.
	:rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", ":rtype: bool") IsDisplayed;
		Standard_Boolean IsDisplayed ();

		/****************** MaterialIndex ******************/
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", ":rtype: int") MaterialIndex;
		Standard_Integer MaterialIndex ();

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", ":rtype: int") Mode;
		Standard_Integer Mode ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "* Returns an new empty attribute from the good end type. It is used by the copy algorithm.
	:rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "* This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.
	:param intoAttribute:
	:type intoAttribute: TDF_Attribute
	:param aRelocTationable:
	:type aRelocTationable: TDF_RelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & intoAttribute,const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "* Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: void") Restore;
		virtual void Restore (const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** SelectionMode ******************/
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", ":param index: default value is 1
	:type index: int
	:rtype: int") SelectionMode;
		Standard_Integer SelectionMode (const int index = 1);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Create if not found the TDataXtd_Presentation attribute and set its driver GUID
	:param theLabel:
	:type theLabel: TDF_Label
	:param theDriverId:
	:type theDriverId: Standard_GUID
	:rtype: opencascade::handle<TDataXtd_Presentation>") Set;
		static opencascade::handle<TDataXtd_Presentation> Set (const TDF_Label & theLabel,const Standard_GUID & theDriverId);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", ":param theColor:
	:type theColor: Quantity_NameOfColor
	:rtype: None") SetColor;
		void SetColor (const Quantity_NameOfColor theColor);

		/****************** SetDisplayed ******************/
		%feature("compactdefaultargs") SetDisplayed;
		%feature("autodoc", ":param theIsDisplayed:
	:type theIsDisplayed: bool
	:rtype: None") SetDisplayed;
		void SetDisplayed (const Standard_Boolean theIsDisplayed);

		/****************** SetDriverGUID ******************/
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "* Sets the GUID of the driver managing display of associated AIS object
	:param theGUID:
	:type theGUID: Standard_GUID
	:rtype: None") SetDriverGUID;
		void SetDriverGUID (const Standard_GUID & theGUID);

		/****************** SetMaterialIndex ******************/
		%feature("compactdefaultargs") SetMaterialIndex;
		%feature("autodoc", ":param theMaterialIndex:
	:type theMaterialIndex: int
	:rtype: None") SetMaterialIndex;
		void SetMaterialIndex (const Standard_Integer theMaterialIndex);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", ":param theMode:
	:type theMode: int
	:rtype: None") SetMode;
		void SetMode (const Standard_Integer theMode);

		/****************** SetSelectionMode ******************/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "* Sets selection mode. If 'theTransaction' flag is OFF, modification of the attribute doesn't influence the transaction mechanism (the attribute doesn't participate in undo/redo because of this modification). Certainly, if any other data of the attribute is modified (display mode, color, ...), the attribute will be included into undo/redo.
	:param theSelectionMode:
	:type theSelectionMode: int
	:param theTransaction: default value is Standard_True
	:type theTransaction: bool
	:rtype: None") SetSelectionMode;
		void SetSelectionMode (const Standard_Integer theSelectionMode,const Standard_Boolean theTransaction = Standard_True);

		/****************** SetTransparency ******************/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", ":param theValue:
	:type theValue: float
	:rtype: None") SetTransparency;
		void SetTransparency (const Standard_Real theValue);

		/****************** SetWidth ******************/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", ":param theWidth:
	:type theWidth: float
	:rtype: None") SetWidth;
		void SetWidth (const Standard_Real theWidth);

		/****************** TDataXtd_Presentation ******************/
		%feature("compactdefaultargs") TDataXtd_Presentation;
		%feature("autodoc", "* //!@name Attribute mechanics Empty constructor
	:rtype: None") TDataXtd_Presentation;
		 TDataXtd_Presentation ();

		/****************** Transparency ******************/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", ":rtype: float") Transparency;
		Standard_Real Transparency ();

		/****************** Unset ******************/
		%feature("compactdefaultargs") Unset;
		%feature("autodoc", "* Remove attribute of this type from the label
	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: void") Unset;
		static void Unset (const TDF_Label & theLabel);

		/****************** UnsetColor ******************/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", ":rtype: None") UnsetColor;
		void UnsetColor ();

		/****************** UnsetMaterial ******************/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", ":rtype: None") UnsetMaterial;
		void UnsetMaterial ();

		/****************** UnsetMode ******************/
		%feature("compactdefaultargs") UnsetMode;
		%feature("autodoc", ":rtype: None") UnsetMode;
		void UnsetMode ();

		/****************** UnsetSelectionMode ******************/
		%feature("compactdefaultargs") UnsetSelectionMode;
		%feature("autodoc", ":rtype: None") UnsetSelectionMode;
		void UnsetSelectionMode ();

		/****************** UnsetTransparency ******************/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", ":rtype: None") UnsetTransparency;
		void UnsetTransparency ();

		/****************** UnsetWidth ******************/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", ":rtype: None") UnsetWidth;
		void UnsetWidth ();

		/****************** Width ******************/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", ":rtype: float") Width;
		Standard_Real Width ();

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

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "* class methods ============= try to retrieve a Shape attribute at <current> label or in fathers label of <current>. Returns True if found and set <S>.
	:param current:
	:type current: TDF_Label
	:param S:
	:type S: TDataXtd_Shape
	:rtype: bool") Find;
		static Standard_Boolean Find (const TDF_Label & current,opencascade::handle<TDataXtd_Shape> & S);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "* the Shape from associated NamedShape attribute is returned.
	:param label:
	:type label: TDF_Label
	:rtype: TopoDS_Shape") Get;
		static TopoDS_Shape Get (const TDF_Label & label);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Shape methods ============
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** New ******************/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "* Find, or create, a Shape attribute. the Shape attribute is returned. Raises if <label> has attribute.
	:param label:
	:type label: TDF_Label
	:rtype: opencascade::handle<TDataXtd_Shape>") New;
		static opencascade::handle<TDataXtd_Shape> New (const TDF_Label & label);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", ":param DS:
	:type DS: TDF_DataSet
	:rtype: void") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & DS);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param with:
	:type with: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Create or update associated NamedShape attribute. the Shape attribute is returned.
	:param label:
	:type label: TDF_Label
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: opencascade::handle<TDataXtd_Shape>") Set;
		static opencascade::handle<TDataXtd_Shape> Set (const TDF_Label & label,const TopoDS_Shape & shape);

		/****************** TDataXtd_Shape ******************/
		%feature("compactdefaultargs") TDataXtd_Shape;
		%feature("autodoc", ":rtype: None") TDataXtd_Shape;
		 TDataXtd_Shape ();

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
		/****************** Deflection ******************/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "* Poly_Triangulation methods The methods are 'covered' by this attribute to prevent direct modification of the mesh. There is no performance problem to call Poly_Triangulation method through this attribute. The most of the methods are considered as 'inline' by the compiler in release mode. Returns the deflection of this triangulation.
	:rtype: float") Deflection;
		Standard_Real Deflection ();

		/****************** Deflection ******************/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "* Sets the deflection of this triangulation to theDeflection. See more on deflection in Polygon2D
	:param theDeflection:
	:type theDeflection: float
	:rtype: None") Deflection;
		void Deflection (const Standard_Real theDeflection);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "* Returns the underlying triangulation.
	:rtype: opencascade::handle<Poly_Triangulation>") Get;
		const opencascade::handle<Poly_Triangulation> & Get ();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Static methods Returns the ID of the triangulation attribute.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** HasNormals ******************/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "* Returns Standard_True if nodal normals are defined.
	:rtype: bool") HasNormals;
		Standard_Boolean HasNormals ();

		/****************** HasUVNodes ******************/
		%feature("compactdefaultargs") HasUVNodes;
		%feature("autodoc", "* returns Standard_True if 2D nodes are associated with 3D nodes for this triangulation.
	:rtype: bool") HasUVNodes;
		Standard_Boolean HasUVNodes ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* Inherited attribute methods
	:rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NbNodes ******************/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "* returns the number of nodes for this triangulation.
	:rtype: int") NbNodes;
		Standard_Integer NbNodes ();

		/****************** NbTriangles ******************/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "* returns the number of triangles for this triangulation.
	:rtype: int") NbTriangles;
		Standard_Integer NbTriangles ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Node ******************/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "* returns node at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbNodes.
	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt") Node;
		const gp_Pnt  Node (const Standard_Integer theIndex);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* returns normal at the given index. Raises Standard_OutOfRange exception.
	:param theIndex:
	:type theIndex: int
	:rtype: gp_Dir") Normal;
		const gp_Dir Normal (const Standard_Integer theIndex);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveUVNodes ******************/
		%feature("compactdefaultargs") RemoveUVNodes;
		%feature("autodoc", "* Deallocates the UV nodes.
	:rtype: None") RemoveUVNodes;
		void RemoveUVNodes ();

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param theAttribute:
	:type theAttribute: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & theAttribute);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or creates a triangulation attribute.
	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<TDataXtd_Triangulation>") Set;
		static opencascade::handle<TDataXtd_Triangulation> Set (const TDF_Label & theLabel);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or creates a triangulation attribute. Initializes the attribute by a Poly_Triangulation object.
	:param theLabel:
	:type theLabel: TDF_Label
	:param theTriangulation:
	:type theTriangulation: Poly_Triangulation
	:rtype: opencascade::handle<TDataXtd_Triangulation>") Set;
		static opencascade::handle<TDataXtd_Triangulation> Set (const TDF_Label & theLabel,const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the triangulation.
	:param theTriangulation:
	:type theTriangulation: Poly_Triangulation
	:rtype: None") Set;
		void Set (const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****************** SetNode ******************/
		%feature("compactdefaultargs") SetNode;
		%feature("autodoc", "* The method differs from Poly_Triangulation! Sets a node at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbNodes.
	:param theIndex:
	:type theIndex: int
	:param theNode:
	:type theNode: gp_Pnt
	:rtype: None") SetNode;
		void SetNode (const Standard_Integer theIndex,const gp_Pnt & theNode);

		/****************** SetNormal ******************/
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "* Changes normal at the given index. Raises Standard_OutOfRange exception.
	:param theIndex:
	:type theIndex: int
	:param theNormal:
	:type theNormal: gp_Dir
	:rtype: None") SetNormal;
		void SetNormal (const Standard_Integer theIndex,const gp_Dir & theNormal);

		/****************** SetNormals ******************/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "* Sets the table of node normals. Raises exception if length of theNormals != 3 * NbNodes
	:param theNormals:
	:type theNormals: TShort_HArray1OfShortReal
	:rtype: None") SetNormals;
		void SetNormals (const opencascade::handle<TShort_HArray1OfShortReal> & theNormals);

		/****************** SetTriangle ******************/
		%feature("compactdefaultargs") SetTriangle;
		%feature("autodoc", "* The method differs from Poly_Triangulation! Sets a triangle at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbTriangles.
	:param theIndex:
	:type theIndex: int
	:param theTriangle:
	:type theTriangle: Poly_Triangle
	:rtype: None") SetTriangle;
		void SetTriangle (const Standard_Integer theIndex,const Poly_Triangle & theTriangle);

		/****************** SetUVNode ******************/
		%feature("compactdefaultargs") SetUVNode;
		%feature("autodoc", "* The method differs from Poly_Triangulation! Sets a UVNode at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbNodes.
	:param theIndex:
	:type theIndex: int
	:param theUVNode:
	:type theUVNode: gp_Pnt2d
	:rtype: None") SetUVNode;
		void SetUVNode (const Standard_Integer theIndex,const gp_Pnt2d & theUVNode);

		/****************** TDataXtd_Triangulation ******************/
		%feature("compactdefaultargs") TDataXtd_Triangulation;
		%feature("autodoc", "* Object methods A constructor. Don't use it directly, use please the static method Set(), which returns the attribute attached to a label.
	:rtype: None") TDataXtd_Triangulation;
		 TDataXtd_Triangulation ();

		/****************** Triangle ******************/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "* returns triangle at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbTriangles.
	:param theIndex:
	:type theIndex: int
	:rtype: Poly_Triangle") Triangle;
		const Poly_Triangle & Triangle (const Standard_Integer theIndex);

		/****************** UVNode ******************/
		%feature("compactdefaultargs") UVNode;
		%feature("autodoc", "* returns UVNode at the given index. Raises Standard_OutOfRange exception if theIndex is less than 1 or greater than NbNodes.
	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt2d") UVNode;
		const gp_Pnt2d  UVNode (const Standard_Integer theIndex);

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
		/****************** Axis1 ******************/
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", ":param Axis1:
	:type Axis1: TNaming_NamedShape
	:rtype: None") Axis1;
		void Axis1 (const opencascade::handle<TNaming_NamedShape> & Axis1);

		/****************** Axis1 ******************/
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", ":rtype: opencascade::handle<TNaming_NamedShape>") Axis1;
		opencascade::handle<TNaming_NamedShape> Axis1 ();

		/****************** Axis1Reversed ******************/
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", ":param Axis1Reversed:
	:type Axis1Reversed: bool
	:rtype: None") Axis1Reversed;
		void Axis1Reversed (const Standard_Boolean Axis1Reversed);

		/****************** Axis1Reversed ******************/
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", ":rtype: bool") Axis1Reversed;
		Standard_Boolean Axis1Reversed ();

		/****************** Axis2 ******************/
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", ":param Axis2:
	:type Axis2: TNaming_NamedShape
	:rtype: None") Axis2;
		void Axis2 (const opencascade::handle<TNaming_NamedShape> & Axis2);

		/****************** Axis2 ******************/
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", ":rtype: opencascade::handle<TNaming_NamedShape>") Axis2;
		opencascade::handle<TNaming_NamedShape> Axis2 ();

		/****************** Axis2Reversed ******************/
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", ":param Axis2Reversed:
	:type Axis2Reversed: bool
	:rtype: None") Axis2Reversed;
		void Axis2Reversed (const Standard_Boolean Axis2Reversed);

		/****************** Axis2Reversed ******************/
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", ":rtype: bool") Axis2Reversed;
		Standard_Boolean Axis2Reversed ();

		/****************** ComputeTrsfs ******************/
		%feature("compactdefaultargs") ComputeTrsfs;
		%feature("autodoc", ":param Trsfs:
	:type Trsfs: TDataXtd_Array1OfTrsf
	:rtype: None") ComputeTrsfs;
		void ComputeTrsfs (TDataXtd_Array1OfTrsf & Trsfs);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetPatternID ******************/
		%feature("compactdefaultargs") GetPatternID;
		%feature("autodoc", ":rtype: Standard_GUID") GetPatternID;
		static const Standard_GUID & GetPatternID ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param plane:
	:type plane: TNaming_NamedShape
	:rtype: None") Mirror;
		void Mirror (const opencascade::handle<TNaming_NamedShape> & plane);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":rtype: opencascade::handle<TNaming_NamedShape>") Mirror;
		opencascade::handle<TNaming_NamedShape> Mirror ();

		/****************** NbInstances1 ******************/
		%feature("compactdefaultargs") NbInstances1;
		%feature("autodoc", ":param NbInstances1:
	:type NbInstances1: TDataStd_Integer
	:rtype: None") NbInstances1;
		void NbInstances1 (const opencascade::handle<TDataStd_Integer> & NbInstances1);

		/****************** NbInstances1 ******************/
		%feature("compactdefaultargs") NbInstances1;
		%feature("autodoc", ":rtype: opencascade::handle<TDataStd_Integer>") NbInstances1;
		opencascade::handle<TDataStd_Integer> NbInstances1 ();

		/****************** NbInstances2 ******************/
		%feature("compactdefaultargs") NbInstances2;
		%feature("autodoc", ":param NbInstances2:
	:type NbInstances2: TDataStd_Integer
	:rtype: None") NbInstances2;
		void NbInstances2 (const opencascade::handle<TDataStd_Integer> & NbInstances2);

		/****************** NbInstances2 ******************/
		%feature("compactdefaultargs") NbInstances2;
		%feature("autodoc", ":rtype: opencascade::handle<TDataStd_Integer>") NbInstances2;
		opencascade::handle<TDataStd_Integer> NbInstances2 ();

		/****************** NbTrsfs ******************/
		%feature("compactdefaultargs") NbTrsfs;
		%feature("autodoc", ":rtype: int") NbTrsfs;
		Standard_Integer NbTrsfs ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** PatternID ******************/
		%feature("compactdefaultargs") PatternID;
		%feature("autodoc", ":rtype: Standard_GUID") PatternID;
		const Standard_GUID & PatternID ();

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", ":param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: void") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param With:
	:type With: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Find, or create, a PatternStd attribute
	:param label:
	:type label: TDF_Label
	:rtype: opencascade::handle<TDataXtd_PatternStd>") Set;
		static opencascade::handle<TDataXtd_PatternStd> Set (const TDF_Label & label);

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", ":param signature:
	:type signature: int
	:rtype: None") Signature;
		void Signature (const Standard_Integer signature);

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", ":rtype: int") Signature;
		Standard_Integer Signature ();

		/****************** TDataXtd_PatternStd ******************/
		%feature("compactdefaultargs") TDataXtd_PatternStd;
		%feature("autodoc", ":rtype: None") TDataXtd_PatternStd;
		 TDataXtd_PatternStd ();

		/****************** Value1 ******************/
		%feature("compactdefaultargs") Value1;
		%feature("autodoc", ":param value:
	:type value: TDataStd_Real
	:rtype: None") Value1;
		void Value1 (const opencascade::handle<TDataStd_Real> & value);

		/****************** Value1 ******************/
		%feature("compactdefaultargs") Value1;
		%feature("autodoc", ":rtype: opencascade::handle<TDataStd_Real>") Value1;
		opencascade::handle<TDataStd_Real> Value1 ();

		/****************** Value2 ******************/
		%feature("compactdefaultargs") Value2;
		%feature("autodoc", ":param value:
	:type value: TDataStd_Real
	:rtype: None") Value2;
		void Value2 (const opencascade::handle<TDataStd_Real> & value);

		/****************** Value2 ******************/
		%feature("compactdefaultargs") Value2;
		%feature("autodoc", ":rtype: opencascade::handle<TDataStd_Real>") Value2;
		opencascade::handle<TDataStd_Real> Value2 ();

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
