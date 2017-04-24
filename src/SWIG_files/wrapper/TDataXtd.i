/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") TDataXtd

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include TDataXtd_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

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

%rename(tdataxtd) TDataXtd;
class TDataXtd {
	public:
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "	* Appends to <anIDList> the list of the attributes IDs of this package. CAUTION: <anIDList> is NOT cleared before use. Print of TDataExt enumeration =============================

	:param anIDList:
	:type anIDList: TDF_IDList &
	:rtype: void
") IDList;
		static void IDList (TDF_IDList & anIDList);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the name of the geometry dimension <GEO> as a String on the Stream <S> and returns <S>.

	:param GEO:
	:type GEO: TDataXtd_GeometryEnum
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TDataXtd_GeometryEnum GEO,Standard_OStream & S);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the name of the constraint <CTR> as a String on the Stream <S> and returns <S>.

	:param CTR:
	:type CTR: TDataXtd_ConstraintEnum
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TDataXtd_ConstraintEnum CTR,Standard_OStream & S);
};


%extend TDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_Array1OfTrsf;
class TDataXtd_Array1OfTrsf {
	public:
		%feature("compactdefaultargs") TDataXtd_Array1OfTrsf;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TDataXtd_Array1OfTrsf;
		 TDataXtd_Array1OfTrsf (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TDataXtd_Array1OfTrsf;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Trsf
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TDataXtd_Array1OfTrsf;
		 TDataXtd_Array1OfTrsf (const gp_Trsf & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Trsf
	:rtype: None
") Init;
		void Init (const gp_Trsf & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDataXtd_Array1OfTrsf &
	:rtype: TDataXtd_Array1OfTrsf
") Assign;
		const TDataXtd_Array1OfTrsf & Assign (const TDataXtd_Array1OfTrsf & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDataXtd_Array1OfTrsf &
	:rtype: TDataXtd_Array1OfTrsf
") operator =;
		const TDataXtd_Array1OfTrsf & operator = (const TDataXtd_Array1OfTrsf & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: gp_Trsf
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Trsf & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Trsf
") Value;
		const gp_Trsf  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Trsf
") ChangeValue;
		gp_Trsf  ChangeValue (const Standard_Integer Index);
};


%extend TDataXtd_Array1OfTrsf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_Axis;
class TDataXtd_Axis : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for an axis.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an axis attribute defined by the label. In the case of a creation of an axis, a compatible named shape should already be associated with label. Exceptions Standard_NullObject if no compatible named shape is associated with the label.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataXtd_Axis
") Set;
		static Handle_TDataXtd_Axis Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, an Axis attribute and set <P> as generated in the associated NamedShape. Axis methods ============

	:param label:
	:type label: TDF_Label &
	:param L:
	:type L: gp_Lin
	:rtype: Handle_TDataXtd_Axis
") Set;
		static Handle_TDataXtd_Axis Set (const TDF_Label & label,const gp_Lin & L);
		%feature("compactdefaultargs") TDataXtd_Axis;
		%feature("autodoc", "	:rtype: None
") TDataXtd_Axis;
		 TDataXtd_Axis ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDataXtd_Axis {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_Axis(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_Axis::Handle_TDataXtd_Axis %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_Axis;
class Handle_TDataXtd_Axis : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDataXtd_Axis();
        Handle_TDataXtd_Axis(const Handle_TDataXtd_Axis &aHandle);
        Handle_TDataXtd_Axis(const TDataXtd_Axis *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_Axis DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_Axis {
    TDataXtd_Axis* _get_reference() {
    return (TDataXtd_Axis*)$self->Access();
    }
};

%extend Handle_TDataXtd_Axis {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_Axis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_Constraint;
class TDataXtd_Constraint : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the GUID for constraints.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates the 2D constraint attribute defined by the planar topological attribute plane and the label label. Constraint methods ==================

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataXtd_Constraint
") Set;
		static Handle_TDataXtd_Constraint Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataXtd_Constraint;
		%feature("autodoc", "	:rtype: None
") TDataXtd_Constraint;
		 TDataXtd_Constraint ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates the constraint attribute defined by the topological attribute G1 and the constraint type type.

	:param type:
	:type type: TDataXtd_ConstraintEnum
	:param G1:
	:type G1: Handle_TNaming_NamedShape &
	:rtype: None
") Set;
		void Set (const TDataXtd_ConstraintEnum type,const Handle_TNaming_NamedShape & G1);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates the constraint attribute defined by the topological attributes G1 and G2, and by the constraint type type.

	:param type:
	:type type: TDataXtd_ConstraintEnum
	:param G1:
	:type G1: Handle_TNaming_NamedShape &
	:param G2:
	:type G2: Handle_TNaming_NamedShape &
	:rtype: None
") Set;
		void Set (const TDataXtd_ConstraintEnum type,const Handle_TNaming_NamedShape & G1,const Handle_TNaming_NamedShape & G2);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates the constraint attribute defined by the topological attributes G1, G2 and G3, and by the constraint type type.

	:param type:
	:type type: TDataXtd_ConstraintEnum
	:param G1:
	:type G1: Handle_TNaming_NamedShape &
	:param G2:
	:type G2: Handle_TNaming_NamedShape &
	:param G3:
	:type G3: Handle_TNaming_NamedShape &
	:rtype: None
") Set;
		void Set (const TDataXtd_ConstraintEnum type,const Handle_TNaming_NamedShape & G1,const Handle_TNaming_NamedShape & G2,const Handle_TNaming_NamedShape & G3);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates the constraint attribute defined by the topological attributes G1, G2, G3 and G4, and by the constraint type type. methods to read constraint fields =================================

	:param type:
	:type type: TDataXtd_ConstraintEnum
	:param G1:
	:type G1: Handle_TNaming_NamedShape &
	:param G2:
	:type G2: Handle_TNaming_NamedShape &
	:param G3:
	:type G3: Handle_TNaming_NamedShape &
	:param G4:
	:type G4: Handle_TNaming_NamedShape &
	:rtype: None
") Set;
		void Set (const TDataXtd_ConstraintEnum type,const Handle_TNaming_NamedShape & G1,const Handle_TNaming_NamedShape & G2,const Handle_TNaming_NamedShape & G3,const Handle_TNaming_NamedShape & G4);
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "	* Returns true if this constraint attribute is valid. By default, true is returned. When the value of a dimension is changed or when a geometry is moved, false is returned until the solver sets it back to true.

	:rtype: bool
") Verified;
		Standard_Boolean Verified ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of constraint. This will be an element of the TDataXtd_ConstraintEnum enumeration.

	:rtype: TDataXtd_ConstraintEnum
") GetType;
		TDataXtd_ConstraintEnum GetType ();
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "	* Returns true if this constraint attribute is two-dimensional.

	:rtype: bool
") IsPlanar;
		Standard_Boolean IsPlanar ();
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "	* Returns the topological attribute of the plane used for planar - i.e., 2D - constraints. This plane is attached to another label. If the constraint is not planar, in other words, 3D, this function will return a null handle.

	:rtype: Handle_TNaming_NamedShape
") GetPlane;
		Handle_TNaming_NamedShape GetPlane ();
		%feature("compactdefaultargs") IsDimension;
		%feature("autodoc", "	* Returns true if this constraint attribute is a dimension, and therefore has a value.

	:rtype: bool
") IsDimension;
		Standard_Boolean IsDimension ();
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	* Returns the value of a dimension. This value is a reference to a TDataStd_Real attribute. If the attribute is not a dimension, this value will be 0. Use IsDimension to test this condition.

	:rtype: Handle_TDataStd_Real
") GetValue;
		Handle_TDataStd_Real GetValue ();
		%feature("compactdefaultargs") NbGeometries;
		%feature("autodoc", "	* Returns the number of geometry attributes in this constraint attribute. This number will be between 1 and 4.

	:rtype: int
") NbGeometries;
		Standard_Integer NbGeometries ();
		%feature("compactdefaultargs") GetGeometry;
		%feature("autodoc", "	* Returns the integer index Index used to access the array of the constraint or stored geometries of a dimension Index has a value between 1 and 4. methods to write constraint fields (use builder) ==================================

	:param Index:
	:type Index: int
	:rtype: Handle_TNaming_NamedShape
") GetGeometry;
		Handle_TNaming_NamedShape GetGeometry (const Standard_Integer Index);
		%feature("compactdefaultargs") ClearGeometries;
		%feature("autodoc", "	* Removes the geometries involved in the constraint or dimension from the array of topological attributes where they are stored.

	:rtype: None
") ClearGeometries;
		void ClearGeometries ();
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	* Finds or creates the type of constraint CTR.

	:param CTR:
	:type CTR: TDataXtd_ConstraintEnum
	:rtype: None
") SetType;
		void SetType (const TDataXtd_ConstraintEnum CTR);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	* Finds or creates the plane of the 2D constraint attribute, defined by the planar topological attribute plane.

	:param plane:
	:type plane: Handle_TNaming_NamedShape &
	:rtype: None
") SetPlane;
		void SetPlane (const Handle_TNaming_NamedShape & plane);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Finds or creates the real number value V of the dimension constraint attribute.

	:param V:
	:type V: Handle_TDataStd_Real &
	:rtype: None
") SetValue;
		void SetValue (const Handle_TDataStd_Real & V);
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", "	* Finds or creates the underlying geometry of the constraint defined by the topological attribute G and the integer index Index.

	:param Index:
	:type Index: int
	:param G:
	:type G: Handle_TNaming_NamedShape &
	:rtype: None
") SetGeometry;
		void SetGeometry (const Standard_Integer Index,const Handle_TNaming_NamedShape & G);
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "	* Returns true if this constraint attribute defined by status is valid. By default, true is returned. When the value of a dimension is changed or when a geometry is moved, false is returned until the solver sets it back to true. If status is false, Verified is set to false.

	:param status:
	:type status: bool
	:rtype: None
") Verified;
		void Verified (const Standard_Boolean status);
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	:param status:
	:type status: bool
	:rtype: None
") Inverted;
		void Inverted (const Standard_Boolean status);
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	:rtype: bool
") Inverted;
		Standard_Boolean Inverted ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	:param status:
	:type status: bool
	:rtype: None
") Reversed;
		void Reversed (const Standard_Boolean status);
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	:rtype: bool
") Reversed;
		Standard_Boolean Reversed ();
		%feature("compactdefaultargs") CollectChildConstraints;
		%feature("autodoc", "	* collects constraints on Childs for label <aLabel>

	:param aLabel:
	:type aLabel: TDF_Label &
	:param TheList:
	:type TheList: TDF_LabelList &
	:rtype: void
") CollectChildConstraints;
		static void CollectChildConstraints (const TDF_Label & aLabel,TDF_LabelList & TheList);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & DS);
};


%extend TDataXtd_Constraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_Constraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_Constraint::Handle_TDataXtd_Constraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_Constraint;
class Handle_TDataXtd_Constraint : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDataXtd_Constraint();
        Handle_TDataXtd_Constraint(const Handle_TDataXtd_Constraint &aHandle);
        Handle_TDataXtd_Constraint(const TDataXtd_Constraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_Constraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_Constraint {
    TDataXtd_Constraint* _get_reference() {
    return (TDataXtd_Constraint*)$self->Access();
    }
};

%extend Handle_TDataXtd_Constraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_Constraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_Geometry;
class TDataXtd_Geometry : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* API class methods ================= Finds, or creates, a Geometry attribute defined by the label label. The default type of geometry is the value ANY_GEOM of the enumeration TDataXtd_GeometryEnum. To specify another value of this enumeration, use the function SetType.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataXtd_Geometry
") Set;
		static Handle_TDataXtd_Geometry Set (const TDF_Label & label);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the label L used to define the type of geometric construction for the geometry attribute.

	:param L:
	:type L: TDF_Label &
	:rtype: TDataXtd_GeometryEnum
") Type;
		static TDataXtd_GeometryEnum Type (const TDF_Label & L);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the topological attribute S used to define the type of geometric construction for the geometry attribute.

	:param S:
	:type S: Handle_TNaming_NamedShape &
	:rtype: TDataXtd_GeometryEnum
") Type;
		static TDataXtd_GeometryEnum Type (const Handle_TNaming_NamedShape & S);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point attribute defined by the label L and the point G.

	:param L:
	:type L: TDF_Label &
	:param G:
	:type G: gp_Pnt
	:rtype: bool
") Point;
		static Standard_Boolean Point (const TDF_Label & L,gp_Pnt & G);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point attribute defined by the topological attribute S and the point G.

	:param S:
	:type S: Handle_TNaming_NamedShape &
	:param G:
	:type G: gp_Pnt
	:rtype: bool
") Point;
		static Standard_Boolean Point (const Handle_TNaming_NamedShape & S,gp_Pnt & G);
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the axis attribute defined by the label L and the axis G.

	:param L:
	:type L: TDF_Label &
	:param G:
	:type G: gp_Ax1
	:rtype: bool
") Axis;
		static Standard_Boolean Axis (const TDF_Label & L,gp_Ax1 & G);
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	* Returns the axis attribute defined by the topological attribute S and the axis G.

	:param S:
	:type S: Handle_TNaming_NamedShape &
	:param G:
	:type G: gp_Ax1
	:rtype: bool
") Axis;
		static Standard_Boolean Axis (const Handle_TNaming_NamedShape & S,gp_Ax1 & G);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the line attribute defined by the label L and the line G.

	:param L:
	:type L: TDF_Label &
	:param G:
	:type G: gp_Lin
	:rtype: bool
") Line;
		static Standard_Boolean Line (const TDF_Label & L,gp_Lin & G);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the line attribute defined by the topological attribute S and the line G.

	:param S:
	:type S: Handle_TNaming_NamedShape &
	:param G:
	:type G: gp_Lin
	:rtype: bool
") Line;
		static Standard_Boolean Line (const Handle_TNaming_NamedShape & S,gp_Lin & G);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns the circle attribute defined by the label L and the circle G.

	:param L:
	:type L: TDF_Label &
	:param G:
	:type G: gp_Circ
	:rtype: bool
") Circle;
		static Standard_Boolean Circle (const TDF_Label & L,gp_Circ & G);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns the circle attribute defined by the topological attribute S and the circle G.

	:param S:
	:type S: Handle_TNaming_NamedShape &
	:param G:
	:type G: gp_Circ
	:rtype: bool
") Circle;
		static Standard_Boolean Circle (const Handle_TNaming_NamedShape & S,gp_Circ & G);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	* Returns the ellipse attribute defined by the label L and the ellipse G.

	:param L:
	:type L: TDF_Label &
	:param G:
	:type G: gp_Elips
	:rtype: bool
") Ellipse;
		static Standard_Boolean Ellipse (const TDF_Label & L,gp_Elips & G);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	* Returns the ellipse attribute defined by the topological attribute S and the ellipse G.

	:param S:
	:type S: Handle_TNaming_NamedShape &
	:param G:
	:type G: gp_Elips
	:rtype: bool
") Ellipse;
		static Standard_Boolean Ellipse (const Handle_TNaming_NamedShape & S,gp_Elips & G);
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the plane attribute defined by the label L and the plane G.

	:param L:
	:type L: TDF_Label &
	:param G:
	:type G: gp_Pln
	:rtype: bool
") Plane;
		static Standard_Boolean Plane (const TDF_Label & L,gp_Pln & G);
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the plane attribute defined by the topological attribute S and the plane G.

	:param S:
	:type S: Handle_TNaming_NamedShape &
	:param G:
	:type G: gp_Pln
	:rtype: bool
") Plane;
		static Standard_Boolean Plane (const Handle_TNaming_NamedShape & S,gp_Pln & G);
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "	* Returns the cylinder attribute defined by the label L and the cylinder G.

	:param L:
	:type L: TDF_Label &
	:param G:
	:type G: gp_Cylinder
	:rtype: bool
") Cylinder;
		static Standard_Boolean Cylinder (const TDF_Label & L,gp_Cylinder & G);
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "	* Returns the cylinder attribute defined by the topological attribute S and the cylinder G.

	:param S:
	:type S: Handle_TNaming_NamedShape &
	:param G:
	:type G: gp_Cylinder
	:rtype: bool
") Cylinder;
		static Standard_Boolean Cylinder (const Handle_TNaming_NamedShape & S,gp_Cylinder & G);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the GUID for geometry attributes.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") TDataXtd_Geometry;
		%feature("autodoc", "	* This and the next methods are used to retrieve underlying geometry of the NamedShape, even if noone Geometry Attribute is associated . if not found or not compliant geometry return False.

	:rtype: None
") TDataXtd_Geometry;
		 TDataXtd_Geometry ();
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	* Returns the type of geometric construction T of this attribute. T will be a value of the enumeration TDataXtd_GeometryEnum.

	:param T:
	:type T: TDataXtd_GeometryEnum
	:rtype: None
") SetType;
		void SetType (const TDataXtd_GeometryEnum T);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of geometric construction.

	:rtype: TDataXtd_GeometryEnum
") GetType;
		TDataXtd_GeometryEnum GetType ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDataXtd_Geometry {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_Geometry(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_Geometry::Handle_TDataXtd_Geometry %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_Geometry;
class Handle_TDataXtd_Geometry : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDataXtd_Geometry();
        Handle_TDataXtd_Geometry(const Handle_TDataXtd_Geometry &aHandle);
        Handle_TDataXtd_Geometry(const TDataXtd_Geometry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_Geometry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_Geometry {
    TDataXtd_Geometry* _get_reference() {
    return (TDataXtd_Geometry*)$self->Access();
    }
};

%extend Handle_TDataXtd_Geometry {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_Geometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_HArray1OfTrsf;
class TDataXtd_HArray1OfTrsf : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TDataXtd_HArray1OfTrsf;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TDataXtd_HArray1OfTrsf;
		 TDataXtd_HArray1OfTrsf (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TDataXtd_HArray1OfTrsf;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_Trsf
	:rtype: None
") TDataXtd_HArray1OfTrsf;
		 TDataXtd_HArray1OfTrsf (const Standard_Integer Low,const Standard_Integer Up,const gp_Trsf & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Trsf
	:rtype: None
") Init;
		void Init (const gp_Trsf & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: gp_Trsf
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Trsf & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Trsf
") Value;
		const gp_Trsf  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Trsf
") ChangeValue;
		gp_Trsf  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TDataXtd_Array1OfTrsf
") Array1;
		const TDataXtd_Array1OfTrsf & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TDataXtd_Array1OfTrsf
") ChangeArray1;
		TDataXtd_Array1OfTrsf & ChangeArray1 ();
};


%extend TDataXtd_HArray1OfTrsf {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_HArray1OfTrsf(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_HArray1OfTrsf::Handle_TDataXtd_HArray1OfTrsf %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_HArray1OfTrsf;
class Handle_TDataXtd_HArray1OfTrsf : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TDataXtd_HArray1OfTrsf();
        Handle_TDataXtd_HArray1OfTrsf(const Handle_TDataXtd_HArray1OfTrsf &aHandle);
        Handle_TDataXtd_HArray1OfTrsf(const TDataXtd_HArray1OfTrsf *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_HArray1OfTrsf DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_HArray1OfTrsf {
    TDataXtd_HArray1OfTrsf* _get_reference() {
    return (TDataXtd_HArray1OfTrsf*)$self->Access();
    }
};

%extend Handle_TDataXtd_HArray1OfTrsf {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_HArray1OfTrsf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_Pattern;
class TDataXtd_Pattern : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") PatternID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") PatternID;
		virtual const Standard_GUID & PatternID ();
		%feature("compactdefaultargs") NbTrsfs;
		%feature("autodoc", "	* Give the number of transformation

	:rtype: int
") NbTrsfs;
		virtual Standard_Integer NbTrsfs ();
		%feature("compactdefaultargs") ComputeTrsfs;
		%feature("autodoc", "	* Give the transformations

	:param Trsfs:
	:type Trsfs: TDataXtd_Array1OfTrsf &
	:rtype: void
") ComputeTrsfs;
		virtual void ComputeTrsfs (TDataXtd_Array1OfTrsf & Trsfs);
};


%extend TDataXtd_Pattern {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_Pattern(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_Pattern::Handle_TDataXtd_Pattern %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_Pattern;
class Handle_TDataXtd_Pattern : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDataXtd_Pattern();
        Handle_TDataXtd_Pattern(const Handle_TDataXtd_Pattern &aHandle);
        Handle_TDataXtd_Pattern(const TDataXtd_Pattern *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_Pattern DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_Pattern {
    TDataXtd_Pattern* _get_reference() {
    return (TDataXtd_Pattern*)$self->Access();
    }
};

%extend Handle_TDataXtd_Pattern {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_Pattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_Placement;
class TDataXtd_Placement : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, an Placement attribute. the Placement attribute is returned. Placement methods =================

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataXtd_Placement
") Set;
		static Handle_TDataXtd_Placement Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataXtd_Placement;
		%feature("autodoc", "	:rtype: None
") TDataXtd_Placement;
		 TDataXtd_Placement ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDataXtd_Placement {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_Placement(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_Placement::Handle_TDataXtd_Placement %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_Placement;
class Handle_TDataXtd_Placement : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDataXtd_Placement();
        Handle_TDataXtd_Placement(const Handle_TDataXtd_Placement &aHandle);
        Handle_TDataXtd_Placement(const TDataXtd_Placement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_Placement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_Placement {
    TDataXtd_Placement* _get_reference() {
    return (TDataXtd_Placement*)$self->Access();
    }
};

%extend Handle_TDataXtd_Placement {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_Plane;
class TDataXtd_Plane : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= //! Returns the GUID for plane attributes.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates the plane attribute defined by the label label. Warning If you are creating the attribute with this syntax, a planar face should already be associated with label.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataXtd_Plane
") Set;
		static Handle_TDataXtd_Plane Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, a Plane attribute and sets <P> as generated the associated NamedShape. Plane methods =============

	:param label:
	:type label: TDF_Label &
	:param P:
	:type P: gp_Pln
	:rtype: Handle_TDataXtd_Plane
") Set;
		static Handle_TDataXtd_Plane Set (const TDF_Label & label,const gp_Pln & P);
		%feature("compactdefaultargs") TDataXtd_Plane;
		%feature("autodoc", "	:rtype: None
") TDataXtd_Plane;
		 TDataXtd_Plane ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDataXtd_Plane {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_Plane(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_Plane::Handle_TDataXtd_Plane %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_Plane;
class Handle_TDataXtd_Plane : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDataXtd_Plane();
        Handle_TDataXtd_Plane(const Handle_TDataXtd_Plane &aHandle);
        Handle_TDataXtd_Plane(const TDataXtd_Plane *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_Plane DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_Plane {
    TDataXtd_Plane* _get_reference() {
    return (TDataXtd_Plane*)$self->Access();
    }
};

%extend Handle_TDataXtd_Plane {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_Point;
class TDataXtd_Point : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= //! Returns the GUID for point attributes.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the label Label as a point attribute. If no object is found, a point attribute is created.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataXtd_Point
") Set;
		static Handle_TDataXtd_Point Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the label Label as a point attribute containing the point P. If no object is found, a point attribute is created. Point methods =============

	:param label:
	:type label: TDF_Label &
	:param P:
	:type P: gp_Pnt
	:rtype: Handle_TDataXtd_Point
") Set;
		static Handle_TDataXtd_Point Set (const TDF_Label & label,const gp_Pnt & P);
		%feature("compactdefaultargs") TDataXtd_Point;
		%feature("autodoc", "	:rtype: None
") TDataXtd_Point;
		 TDataXtd_Point ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDataXtd_Point {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_Point(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_Point::Handle_TDataXtd_Point %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_Point;
class Handle_TDataXtd_Point : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDataXtd_Point();
        Handle_TDataXtd_Point(const Handle_TDataXtd_Point &aHandle);
        Handle_TDataXtd_Point(const TDataXtd_Point *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_Point DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_Point {
    TDataXtd_Point* _get_reference() {
    return (TDataXtd_Point*)$self->Access();
    }
};

%extend Handle_TDataXtd_Point {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_Position;
class TDataXtd_Position : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Create if not found the TDataXtd_Position attribute set its position to <aPos>

	:param aLabel:
	:type aLabel: TDF_Label &
	:param aPos:
	:type aPos: gp_Pnt
	:rtype: void
") Set;
		static void Set (const TDF_Label & aLabel,const gp_Pnt & aPos);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find an existing, or create an empty, Position. the Position attribute is returned.

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: Handle_TDataXtd_Position
") Set;
		static Handle_TDataXtd_Position Set (const TDF_Label & aLabel);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Search label <aLabel) for the TDataXtd_Position attribute and get its position if found returns True

	:param aLabel:
	:type aLabel: TDF_Label &
	:param aPos:
	:type aPos: gp_Pnt
	:rtype: bool
") Get;
		static Standard_Boolean Get (const TDF_Label & aLabel,gp_Pnt & aPos);
		%feature("compactdefaultargs") TDataXtd_Position;
		%feature("autodoc", "	:rtype: None
") TDataXtd_Position;
		 TDataXtd_Position ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: void
") Restore;
		virtual void Restore (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Returns an new empty attribute from the good end type. It is used by the copy algorithm.

	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.

	:param intoAttribute:
	:type intoAttribute: Handle_TDF_Attribute &
	:param aRelocTationable:
	:type aRelocTationable: Handle_TDF_RelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & intoAttribute,const Handle_TDF_RelocationTable & aRelocTationable);
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetPosition;
		const gp_Pnt  GetPosition ();
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPos:
	:type aPos: gp_Pnt
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Pnt & aPos);
};


%extend TDataXtd_Position {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_Position(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_Position::Handle_TDataXtd_Position %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_Position;
class Handle_TDataXtd_Position : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDataXtd_Position();
        Handle_TDataXtd_Position(const Handle_TDataXtd_Position &aHandle);
        Handle_TDataXtd_Position(const TDataXtd_Position *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_Position DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_Position {
    TDataXtd_Position* _get_reference() {
    return (TDataXtd_Position*)$self->Access();
    }
};

%extend Handle_TDataXtd_Position {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_Position {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_Shape;
class TDataXtd_Shape : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* class methods ============= try to retrieve a Shape attribute at <current> label or in fathers label of <current>. Returns True if found and set <S>.

	:param current:
	:type current: TDF_Label &
	:param S:
	:type S: Handle_TDataXtd_Shape &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & current,Handle_TDataXtd_Shape & S);
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	* Find, or create, a Shape attribute. the Shape attribute is returned. Raises if <label> has attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataXtd_Shape
") New;
		static Handle_TDataXtd_Shape New (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Create or update associated NamedShape attribute. the Shape attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: Handle_TDataXtd_Shape
") Set;
		static Handle_TDataXtd_Shape Set (const TDF_Label & label,const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* the Shape from associated NamedShape attribute is returned.

	:param label:
	:type label: TDF_Label &
	:rtype: TopoDS_Shape
") Get;
		static TopoDS_Shape Get (const TDF_Label & label);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Shape methods ============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") TDataXtd_Shape;
		%feature("autodoc", "	:rtype: None
") TDataXtd_Shape;
		 TDataXtd_Shape ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & DS);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDataXtd_Shape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_Shape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_Shape::Handle_TDataXtd_Shape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_Shape;
class Handle_TDataXtd_Shape : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDataXtd_Shape();
        Handle_TDataXtd_Shape(const Handle_TDataXtd_Shape &aHandle);
        Handle_TDataXtd_Shape(const TDataXtd_Shape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_Shape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_Shape {
    TDataXtd_Shape* _get_reference() {
    return (TDataXtd_Shape*)$self->Access();
    }
};

%extend Handle_TDataXtd_Shape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataXtd_PatternStd;
class TDataXtd_PatternStd : public TDataXtd_Pattern {
	public:
		%feature("compactdefaultargs") GetPatternID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetPatternID;
		static const Standard_GUID & GetPatternID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, a PatternStd attribute

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataXtd_PatternStd
") Set;
		static Handle_TDataXtd_PatternStd Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataXtd_PatternStd;
		%feature("autodoc", "	:rtype: None
") TDataXtd_PatternStd;
		 TDataXtd_PatternStd ();
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:param signature:
	:type signature: int
	:rtype: None
") Signature;
		void Signature (const Standard_Integer signature);
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", "	:param Axis1:
	:type Axis1: Handle_TNaming_NamedShape &
	:rtype: None
") Axis1;
		void Axis1 (const Handle_TNaming_NamedShape & Axis1);
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "	:param Axis2:
	:type Axis2: Handle_TNaming_NamedShape &
	:rtype: None
") Axis2;
		void Axis2 (const Handle_TNaming_NamedShape & Axis2);
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", "	:param Axis1Reversed:
	:type Axis1Reversed: bool
	:rtype: None
") Axis1Reversed;
		void Axis1Reversed (const Standard_Boolean Axis1Reversed);
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", "	:param Axis2Reversed:
	:type Axis2Reversed: bool
	:rtype: None
") Axis2Reversed;
		void Axis2Reversed (const Standard_Boolean Axis2Reversed);
		%feature("compactdefaultargs") Value1;
		%feature("autodoc", "	:param value:
	:type value: Handle_TDataStd_Real &
	:rtype: None
") Value1;
		void Value1 (const Handle_TDataStd_Real & value);
		%feature("compactdefaultargs") Value2;
		%feature("autodoc", "	:param value:
	:type value: Handle_TDataStd_Real &
	:rtype: None
") Value2;
		void Value2 (const Handle_TDataStd_Real & value);
		%feature("compactdefaultargs") NbInstances1;
		%feature("autodoc", "	:param NbInstances1:
	:type NbInstances1: Handle_TDataStd_Integer &
	:rtype: None
") NbInstances1;
		void NbInstances1 (const Handle_TDataStd_Integer & NbInstances1);
		%feature("compactdefaultargs") NbInstances2;
		%feature("autodoc", "	:param NbInstances2:
	:type NbInstances2: Handle_TDataStd_Integer &
	:rtype: None
") NbInstances2;
		void NbInstances2 (const Handle_TDataStd_Integer & NbInstances2);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param plane:
	:type plane: Handle_TNaming_NamedShape &
	:rtype: None
") Mirror;
		void Mirror (const Handle_TNaming_NamedShape & plane);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") Axis1;
		Handle_TNaming_NamedShape Axis1 ();
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") Axis2;
		Handle_TNaming_NamedShape Axis2 ();
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", "	:rtype: bool
") Axis1Reversed;
		Standard_Boolean Axis1Reversed ();
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", "	:rtype: bool
") Axis2Reversed;
		Standard_Boolean Axis2Reversed ();
		%feature("compactdefaultargs") Value1;
		%feature("autodoc", "	:rtype: Handle_TDataStd_Real
") Value1;
		Handle_TDataStd_Real Value1 ();
		%feature("compactdefaultargs") Value2;
		%feature("autodoc", "	:rtype: Handle_TDataStd_Real
") Value2;
		Handle_TDataStd_Real Value2 ();
		%feature("compactdefaultargs") NbInstances1;
		%feature("autodoc", "	:rtype: Handle_TDataStd_Integer
") NbInstances1;
		Handle_TDataStd_Integer NbInstances1 ();
		%feature("compactdefaultargs") NbInstances2;
		%feature("autodoc", "	:rtype: Handle_TDataStd_Integer
") NbInstances2;
		Handle_TDataStd_Integer NbInstances2 ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") Mirror;
		Handle_TNaming_NamedShape Mirror ();
		%feature("compactdefaultargs") NbTrsfs;
		%feature("autodoc", "	:rtype: int
") NbTrsfs;
		Standard_Integer NbTrsfs ();
		%feature("compactdefaultargs") ComputeTrsfs;
		%feature("autodoc", "	:param Trsfs:
	:type Trsfs: TDataXtd_Array1OfTrsf &
	:rtype: None
") ComputeTrsfs;
		void ComputeTrsfs (TDataXtd_Array1OfTrsf & Trsfs);
		%feature("compactdefaultargs") PatternID;
		%feature("autodoc", "	:rtype: Standard_GUID
") PatternID;
		const Standard_GUID & PatternID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & aDataSet);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDataXtd_PatternStd {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDataXtd_PatternStd(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDataXtd_PatternStd::Handle_TDataXtd_PatternStd %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDataXtd_PatternStd;
class Handle_TDataXtd_PatternStd : public Handle_TDataXtd_Pattern {

    public:
        // constructors
        Handle_TDataXtd_PatternStd();
        Handle_TDataXtd_PatternStd(const Handle_TDataXtd_PatternStd &aHandle);
        Handle_TDataXtd_PatternStd(const TDataXtd_PatternStd *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDataXtd_PatternStd DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDataXtd_PatternStd {
    TDataXtd_PatternStd* _get_reference() {
    return (TDataXtd_PatternStd*)$self->Access();
    }
};

%extend Handle_TDataXtd_PatternStd {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDataXtd_PatternStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
