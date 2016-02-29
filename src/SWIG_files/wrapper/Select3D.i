/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Select3D

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


%include Select3D_headers.i


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
enum Select3D_TypeOfSensitivity {
	Select3D_TOS_INTERIOR = 0,
	Select3D_TOS_BOUNDARY = 1,
};

/* end public enums declaration */

%nodefaultctor Select3D_Box2d;
class Select3D_Box2d {
	public:
		%feature("compactdefaultargs") Select3D_Box2d;
		%feature("autodoc", "	:rtype: None
") Select3D_Box2d;
		 Select3D_Box2d ();
		%feature("compactdefaultargs") Select3D_Box2d;
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_Box2d &
	:rtype: None
") Select3D_Box2d;
		 Select3D_Box2d (const Bnd_Box2d & theBox);
		%feature("compactdefaultargs") operator Bnd_Box2d;
		%feature("autodoc", "	:rtype: inline
") operatorBnd_Box2d;
		inline operator Bnd_Box2d ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_Box2d &
	:rtype: inline Select3D_Box2d
") operator=;
		inline Select3D_Box2d operator = (const Bnd_Box2d & theBox);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: inline void
") Update;
		inline void Update (const gp_Pnt2d & thePnt);
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "	:rtype: inline void
") SetVoid;
		inline void SetVoid ();
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "	:rtype: inline bool
") IsVoid;
		inline Standard_Boolean IsVoid ();
};


%nodefaultctor Select3D_ListIteratorOfListOfSensitive;
class Select3D_ListIteratorOfListOfSensitive {
	public:
		%feature("compactdefaultargs") Select3D_ListIteratorOfListOfSensitive;
		%feature("autodoc", "	:rtype: None
") Select3D_ListIteratorOfListOfSensitive;
		 Select3D_ListIteratorOfListOfSensitive ();
		%feature("compactdefaultargs") Select3D_ListIteratorOfListOfSensitive;
		%feature("autodoc", "	:param L:
	:type L: Select3D_ListOfSensitive &
	:rtype: None
") Select3D_ListIteratorOfListOfSensitive;
		 Select3D_ListIteratorOfListOfSensitive (const Select3D_ListOfSensitive & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: Select3D_ListOfSensitive &
	:rtype: None
") Initialize;
		void Initialize (const Select3D_ListOfSensitive & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") Value;
		Handle_Select3D_SensitiveEntity Value ();
};


%nodefaultctor Select3D_ListIteratorOfListOfSensitiveTriangle;
class Select3D_ListIteratorOfListOfSensitiveTriangle {
	public:
		%feature("compactdefaultargs") Select3D_ListIteratorOfListOfSensitiveTriangle;
		%feature("autodoc", "	:rtype: None
") Select3D_ListIteratorOfListOfSensitiveTriangle;
		 Select3D_ListIteratorOfListOfSensitiveTriangle ();
		%feature("compactdefaultargs") Select3D_ListIteratorOfListOfSensitiveTriangle;
		%feature("autodoc", "	:param L:
	:type L: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") Select3D_ListIteratorOfListOfSensitiveTriangle;
		 Select3D_ListIteratorOfListOfSensitiveTriangle (const Select3D_ListOfSensitiveTriangle & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") Initialize;
		void Initialize (const Select3D_ListOfSensitiveTriangle & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveTriangle
") Value;
		Handle_Select3D_SensitiveTriangle Value ();
};


%nodefaultctor Select3D_ListNodeOfListOfSensitive;
class Select3D_ListNodeOfListOfSensitive : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Select3D_ListNodeOfListOfSensitive;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Select3D_ListNodeOfListOfSensitive;
		 Select3D_ListNodeOfListOfSensitive (const Handle_Select3D_SensitiveEntity & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") Value;
		Handle_Select3D_SensitiveEntity Value ();
};


%extend Select3D_ListNodeOfListOfSensitive {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_ListNodeOfListOfSensitive(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_ListNodeOfListOfSensitive::Handle_Select3D_ListNodeOfListOfSensitive %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_ListNodeOfListOfSensitive;
class Handle_Select3D_ListNodeOfListOfSensitive : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Select3D_ListNodeOfListOfSensitive();
        Handle_Select3D_ListNodeOfListOfSensitive(const Handle_Select3D_ListNodeOfListOfSensitive &aHandle);
        Handle_Select3D_ListNodeOfListOfSensitive(const Select3D_ListNodeOfListOfSensitive *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_ListNodeOfListOfSensitive DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_ListNodeOfListOfSensitive {
    Select3D_ListNodeOfListOfSensitive* GetObject() {
    return (Select3D_ListNodeOfListOfSensitive*)$self->Access();
    }
};

%nodefaultctor Select3D_ListNodeOfListOfSensitiveTriangle;
class Select3D_ListNodeOfListOfSensitiveTriangle : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Select3D_ListNodeOfListOfSensitiveTriangle;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Select3D_ListNodeOfListOfSensitiveTriangle;
		 Select3D_ListNodeOfListOfSensitiveTriangle (const Handle_Select3D_SensitiveTriangle & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveTriangle
") Value;
		Handle_Select3D_SensitiveTriangle Value ();
};


%extend Select3D_ListNodeOfListOfSensitiveTriangle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_ListNodeOfListOfSensitiveTriangle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_ListNodeOfListOfSensitiveTriangle::Handle_Select3D_ListNodeOfListOfSensitiveTriangle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_ListNodeOfListOfSensitiveTriangle;
class Handle_Select3D_ListNodeOfListOfSensitiveTriangle : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Select3D_ListNodeOfListOfSensitiveTriangle();
        Handle_Select3D_ListNodeOfListOfSensitiveTriangle(const Handle_Select3D_ListNodeOfListOfSensitiveTriangle &aHandle);
        Handle_Select3D_ListNodeOfListOfSensitiveTriangle(const Select3D_ListNodeOfListOfSensitiveTriangle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_ListNodeOfListOfSensitiveTriangle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_ListNodeOfListOfSensitiveTriangle {
    Select3D_ListNodeOfListOfSensitiveTriangle* GetObject() {
    return (Select3D_ListNodeOfListOfSensitiveTriangle*)$self->Access();
    }
};

%nodefaultctor Select3D_ListOfSensitive;
class Select3D_ListOfSensitive {
	public:
		%feature("compactdefaultargs") Select3D_ListOfSensitive;
		%feature("autodoc", "	:rtype: None
") Select3D_ListOfSensitive;
		 Select3D_ListOfSensitive ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:rtype: None
") Assign;
		void Assign (const Select3D_ListOfSensitive & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:rtype: None
") operator=;
		void operator = (const Select3D_ListOfSensitive & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Select3D_SensitiveEntity & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param theIt:
	:type theIt: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:rtype: None
") Prepend;
		void Prepend (Select3D_ListOfSensitive & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Append;
		void Append (const Handle_Select3D_SensitiveEntity & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param theIt:
	:type theIt: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") Append;
		void Append (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:rtype: None
") Append;
		void Append (Select3D_ListOfSensitive & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") First;
		Handle_Select3D_SensitiveEntity First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") Last;
		Handle_Select3D_SensitiveEntity Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") Remove;
		void Remove (Select3D_ListIteratorOfListOfSensitive & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertBefore;
		void InsertBefore (Select3D_ListOfSensitive & Other,Select3D_ListIteratorOfListOfSensitive & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertAfter;
		void InsertAfter (Select3D_ListOfSensitive & Other,Select3D_ListIteratorOfListOfSensitive & It);
};


%nodefaultctor Select3D_ListOfSensitiveTriangle;
class Select3D_ListOfSensitiveTriangle {
	public:
		%feature("compactdefaultargs") Select3D_ListOfSensitiveTriangle;
		%feature("autodoc", "	:rtype: None
") Select3D_ListOfSensitiveTriangle;
		 Select3D_ListOfSensitiveTriangle ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") Assign;
		void Assign (const Select3D_ListOfSensitiveTriangle & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") operator=;
		void operator = (const Select3D_ListOfSensitiveTriangle & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Select3D_SensitiveTriangle & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:param theIt:
	:type theIt: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") Prepend;
		void Prepend (Select3D_ListOfSensitiveTriangle & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:rtype: None
") Append;
		void Append (const Handle_Select3D_SensitiveTriangle & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:param theIt:
	:type theIt: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") Append;
		void Append (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") Append;
		void Append (Select3D_ListOfSensitiveTriangle & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveTriangle
") First;
		Handle_Select3D_SensitiveTriangle First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveTriangle
") Last;
		Handle_Select3D_SensitiveTriangle Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") Remove;
		void Remove (Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") InsertBefore;
		void InsertBefore (Select3D_ListOfSensitiveTriangle & Other,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") InsertAfter;
		void InsertAfter (Select3D_ListOfSensitiveTriangle & Other,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
};


%nodefaultctor Select3D_Pnt;
class Select3D_Pnt {
	public:
		%feature("compactdefaultargs") operator gp_Pnt;
		%feature("autodoc", "	:rtype: inline
") operatorgp_Pnt;
		inline operator gp_Pnt ();
		%feature("compactdefaultargs") operator gp_XYZ;
		%feature("autodoc", "	:rtype: inline
") operatorgp_XYZ;
		inline operator gp_XYZ ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: inline gp_Pnt
") operator=;
		inline gp_Pnt operator = (const gp_Pnt & thePnt);
};


%nodefaultctor Select3D_Pnt2d;
class Select3D_Pnt2d {
	public:
		%feature("compactdefaultargs") operator gp_Pnt2d;
		%feature("autodoc", "	:rtype: inline
") operatorgp_Pnt2d;
		inline operator gp_Pnt2d ();
		%feature("compactdefaultargs") operator gp_XY;
		%feature("autodoc", "	:rtype: inline
") operatorgp_XY;
		inline operator gp_XY ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: inline gp_Pnt2d
") operator=;
		inline gp_Pnt2d operator = (const gp_Pnt2d & thePnt);
};


%nodefaultctor Select3D_PointData;
class Select3D_PointData {
	public:
		%feature("compactdefaultargs") Select3D_PointData;
		%feature("autodoc", "	:param theNbPoints:
	:type theNbPoints: int
	:rtype: None
") Select3D_PointData;
		 Select3D_PointData (const Standard_Integer theNbPoints);
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: Select3D_Pnt &
	:rtype: None
") SetPnt;
		void SetPnt (const Standard_Integer theIndex,const Select3D_Pnt & theValue);
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: gp_Pnt
	:rtype: None
") SetPnt;
		void SetPnt (const Standard_Integer theIndex,const gp_Pnt & theValue);
		%feature("compactdefaultargs") SetPnt2d;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: Select3D_Pnt2d &
	:rtype: None
") SetPnt2d;
		void SetPnt2d (const Standard_Integer theIndex,const Select3D_Pnt2d & theValue);
		%feature("compactdefaultargs") SetPnt2d;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: gp_Pnt2d
	:rtype: None
") SetPnt2d;
		void SetPnt2d (const Standard_Integer theIndex,const gp_Pnt2d & theValue);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: Select3D_Pnt
") Pnt;
		Select3D_Pnt Pnt (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: Select3D_Pnt2d
") Pnt2d;
		Select3D_Pnt2d Pnt2d (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	:rtype: int
") Size;
		Standard_Integer Size ();
};


%nodefaultctor Select3D_Projector;
class Select3D_Projector : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Select3D_Projector;
		%feature("autodoc", "	* Constructs the 3D projector object defined by the 3D view aView.

	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: None
") Select3D_Projector;
		 Select3D_Projector (const Handle_V3d_View & aView);
		%feature("compactdefaultargs") Select3D_Projector;
		%feature("autodoc", "	:rtype: None
") Select3D_Projector;
		 Select3D_Projector ();
		%feature("compactdefaultargs") Select3D_Projector;
		%feature("autodoc", "	* Creates an axonometric projector. <CS> represents viewing coordinate system and could be constructed from x direction, view plane normal direction, and view point location in world-coordinate space.

	:param CS:
	:type CS: gp_Ax2
	:rtype: None
") Select3D_Projector;
		 Select3D_Projector (const gp_Ax2 & CS);
		%feature("compactdefaultargs") Select3D_Projector;
		%feature("autodoc", "	* Creates a perspective projector. <CS> represents viewing coordinate system and could be constructed from x direction, view plane normal direction, and focal point location in world-coordinate space. <Focus> should represent distance of an eye from view plane in world-coordinate space (focal distance).

	:param CS:
	:type CS: gp_Ax2
	:param Focus:
	:type Focus: float
	:rtype: None
") Select3D_Projector;
		 Select3D_Projector (const gp_Ax2 & CS,const Standard_Real Focus);
		%feature("compactdefaultargs") Select3D_Projector;
		%feature("autodoc", "	* build a Projector from the given transformation. In case, when <T> transformation should represent custom view projection, it could be constructed from two separate components: transposed view orientation matrix and translation of focal point in view-coordiante system. <T> could be built up from x direction, up direction, view plane normal direction vectors and translation with SetValues(...) method, where first row arguments (a11, a12, a13, a14) are x, y, z component of x direction vector, and x value of reversed translation vector. Second row arguments, are x y z for up direction and y value of reversed translation, and the third row defined in the same manner. This also suits for simple perspective view, where <Focus> is the focale distance of an eye from view plane in world-space coordiantes. Note, that in that case amount of perspective distortion (perspective angle) should be defined through focal distance.

	:param T:
	:type T: gp_Trsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:rtype: None
") Select3D_Projector;
		 Select3D_Projector (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("compactdefaultargs") Select3D_Projector;
		%feature("autodoc", "	* build a Projector from the given transformation. In case, when <GT> transformation should represent custom view projection, it could be constructed from two separate components: transposed view orientation matrix and translation of a focal point in view-coordinate system. This also suits for perspective view, with <Focus> that could be equal to distance from an eye to a view plane in world-coordinates (focal distance). The 3x3 transformation matrix is built up from three vectors: x direction, up direction and view plane normal vectors, where each vector is a matrix row. Then <GT> is constructed from matrix and reversed translation with methods SetTranslationPart(..) and SetVectorialPart(..). Note, that in that case amount of perspective distortion (perspective angle) should be defined through focal distance.

	:param GT:
	:type GT: gp_GTrsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:rtype: None
") Select3D_Projector;
		 Select3D_Projector (const gp_GTrsf & GT,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:rtype: None
") Set;
		void Set (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "	* Sets the 3D view V used at the time of construction.

	:param V:
	:type V: Handle_V3d_View &
	:rtype: None
") SetView;
		void SetView (const Handle_V3d_View & V);
		%feature("compactdefaultargs") View;
		%feature("autodoc", "	* Returns the 3D view used at the time of construction.

	:rtype: Handle_V3d_View
") View;
		Handle_V3d_View View ();
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	* to compute with the given scale and translation.

	:param On: default value is Standard_False
	:type On: bool
	:rtype: void
") Scaled;
		virtual void Scaled (const Standard_Boolean On = Standard_False);
		%feature("compactdefaultargs") Perspective;
		%feature("autodoc", "	* Returns True if there is a perspective transformation.

	:rtype: bool
") Perspective;
		Standard_Boolean Perspective ();
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	* Returns the active transformation.

	:rtype: gp_GTrsf
") Transformation;
		const gp_GTrsf  Transformation ();
		%feature("compactdefaultargs") InvertedTransformation;
		%feature("autodoc", "	* Returns the active inverted transformation.

	:rtype: gp_GTrsf
") InvertedTransformation;
		const gp_GTrsf  InvertedTransformation ();
		%feature("compactdefaultargs") FullTransformation;
		%feature("autodoc", "	* Returns the original transformation.

	:rtype: gp_Trsf
") FullTransformation;
		const gp_Trsf  FullTransformation ();
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "	* Returns the focal length.

	:rtype: float
") Focus;
		Standard_Real Focus ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param D:
	:type D: gp_Vec
	:rtype: None
") Transform;
		void Transform (gp_Vec & D);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param Pnt:
	:type Pnt: gp_Pnt
	:rtype: None
") Transform;
		void Transform (gp_Pnt & Pnt);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* Transform and apply perspective if needed.

	:param P:
	:type P: gp_Pnt
	:param Pout:
	:type Pout: gp_Pnt2d
	:rtype: void
") Project;
		virtual void Project (const gp_Pnt & P,gp_Pnt2d & Pout);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* Transform and apply perspective if needed.

	:param P:
	:type P: gp_Pnt
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Project;
		void Project (const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* Transform and apply perspective if needed.

	:param P:
	:type P: gp_Pnt
	:param D1:
	:type D1: gp_Vec
	:param Pout:
	:type Pout: gp_Pnt2d
	:param D1out:
	:type D1out: gp_Vec2d
	:rtype: void
") Project;
		virtual void Project (const gp_Pnt & P,const gp_Vec & D1,gp_Pnt2d & Pout,gp_Vec2d & D1out);
		%feature("compactdefaultargs") Shoot;
		%feature("autodoc", "	* return a line going through the eye towards the 2d point <X,Y>.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: gp_Lin
") Shoot;
		virtual gp_Lin Shoot (const Standard_Real X,const Standard_Real Y);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_GTrsf
	:rtype: None
") Transform;
		void Transform (gp_Pnt & P,const gp_GTrsf & T);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param D:
	:type D: gp_Lin
	:param T:
	:type T: gp_GTrsf
	:rtype: None
") Transform;
		void Transform (gp_Lin & D,const gp_GTrsf & T);
};


%extend Select3D_Projector {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_Projector(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_Projector::Handle_Select3D_Projector %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_Projector;
class Handle_Select3D_Projector : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Select3D_Projector();
        Handle_Select3D_Projector(const Handle_Select3D_Projector &aHandle);
        Handle_Select3D_Projector(const Select3D_Projector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_Projector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_Projector {
    Select3D_Projector* GetObject() {
    return (Select3D_Projector*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitiveEntity;
class Select3D_SensitiveEntity : public SelectBasics_SensitiveEntity {
	public:
		%feature("compactdefaultargs") NeedsConversion;
		%feature("autodoc", "	* Returns true if this framework needs conversion.

	:rtype: bool
") NeedsConversion;
		Standard_Boolean NeedsConversion ();
		%feature("compactdefaultargs") Is3D;
		%feature("autodoc", "	* Returns true if this framework provides 3D information.

	:rtype: bool
") Is3D;
		Standard_Boolean Is3D ();
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* In classes inheriting this framework, you must redefine this function in order to get a sensitive 2D rectangle from a 3D entity. This rectangle is the sensitive zone which makes the 3D entity selectable.

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: void
") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
		%feature("compactdefaultargs") MaxBoxes;
		%feature("autodoc", "	* Returns the max number of sensitive areas returned by this class is 1 by default. Else on must redefine this method.

	:rtype: int
") MaxBoxes;
		virtual Standard_Integer MaxBoxes ();
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	* Originally this method intended to return sensitive entity with new location aLocation, but currently sensitive entities do not hold a location, instead HasLocation() and Location() methods call corresponding entity owner's methods. Thus all entities returned by GetConnected() share the same location propagated from corresponding selectable object. You must redefine this function for any type of sensitive entity which can accept another connected sensitive entity.//can be connected to another sensitive entity.

	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Matches the box defined by the coordinates Xmin, Ymin, Xmax, Ymax with the entity found at that point within the tolerance aTol. Xmin, YMin define the minimum point in the lower left hand corner of the box, and XMax, YMax define the maximum point in the upper right hand corner of the box. You must redefine this function for every inheriting entity. You will have to call this framework inside the redefined function.

	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* prevents from hiding virtual methods...

	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "	* Returns true if this framework has a location defined.

	:rtype: bool
") HasLocation;
		virtual Standard_Boolean HasLocation ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		virtual const TopLoc_Location & Location ();
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	* sets the location to Identity

	:rtype: void
") ResetLocation;
		virtual void ResetLocation ();
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: void
") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* 2 options : <FullDump> = False -> general information //!	 <FullDump> = True -> whole informtion 3D +2d ...

	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("compactdefaultargs") DumpBox;
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param abox:
	:type abox: Bnd_Box2d &
	:rtype: void
") DumpBox;
		static void DumpBox (Standard_OStream & S,const Bnd_Box2d & abox);
		%feature("compactdefaultargs") UpdateLocation;
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: None
") UpdateLocation;
		void UpdateLocation (const TopLoc_Location & aLoc);
};


%extend Select3D_SensitiveEntity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveEntity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveEntity::Handle_Select3D_SensitiveEntity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveEntity;
class Handle_Select3D_SensitiveEntity : public Handle_SelectBasics_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveEntity();
        Handle_Select3D_SensitiveEntity(const Handle_Select3D_SensitiveEntity &aHandle);
        Handle_Select3D_SensitiveEntity(const Select3D_SensitiveEntity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveEntity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveEntity {
    Select3D_SensitiveEntity* GetObject() {
    return (Select3D_SensitiveEntity*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitiveEntitySequence;
class Select3D_SensitiveEntitySequence : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveEntitySequence;
		%feature("autodoc", "	:rtype: None
") Select3D_SensitiveEntitySequence;
		 Select3D_SensitiveEntitySequence ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_SensitiveEntitySequence &
	:rtype: Select3D_SensitiveEntitySequence
") Assign;
		const Select3D_SensitiveEntitySequence & Assign (const Select3D_SensitiveEntitySequence & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_SensitiveEntitySequence &
	:rtype: Select3D_SensitiveEntitySequence
") operator=;
		const Select3D_SensitiveEntitySequence & operator = (const Select3D_SensitiveEntitySequence & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Append;
		void Append (const Handle_Select3D_SensitiveEntity & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Select3D_SensitiveEntitySequence &
	:rtype: None
") Append;
		void Append (Select3D_SensitiveEntitySequence & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Select3D_SensitiveEntity & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Select3D_SensitiveEntitySequence &
	:rtype: None
") Prepend;
		void Prepend (Select3D_SensitiveEntitySequence & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Select3D_SensitiveEntity &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Select3D_SensitiveEntity & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Select3D_SensitiveEntitySequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Select3D_SensitiveEntitySequence & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Select3D_SensitiveEntity &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Select3D_SensitiveEntity & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Select3D_SensitiveEntitySequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Select3D_SensitiveEntitySequence & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") First;
		Handle_Select3D_SensitiveEntity First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") Last;
		Handle_Select3D_SensitiveEntity Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Select3D_SensitiveEntitySequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Select3D_SensitiveEntitySequence & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Select3D_SensitiveEntity
") Value;
		Handle_Select3D_SensitiveEntity Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Select3D_SensitiveEntity & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Select3D_SensitiveEntity
") ChangeValue;
		Handle_Select3D_SensitiveEntity ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%nodefaultctor Select3D_SequenceNodeOfSensitiveEntitySequence;
class Select3D_SequenceNodeOfSensitiveEntitySequence : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Select3D_SequenceNodeOfSensitiveEntitySequence;
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Select3D_SequenceNodeOfSensitiveEntitySequence;
		 Select3D_SequenceNodeOfSensitiveEntitySequence (const Handle_Select3D_SensitiveEntity & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") Value;
		Handle_Select3D_SensitiveEntity Value ();
};


%extend Select3D_SequenceNodeOfSensitiveEntitySequence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SequenceNodeOfSensitiveEntitySequence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SequenceNodeOfSensitiveEntitySequence::Handle_Select3D_SequenceNodeOfSensitiveEntitySequence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SequenceNodeOfSensitiveEntitySequence;
class Handle_Select3D_SequenceNodeOfSensitiveEntitySequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Select3D_SequenceNodeOfSensitiveEntitySequence();
        Handle_Select3D_SequenceNodeOfSensitiveEntitySequence(const Handle_Select3D_SequenceNodeOfSensitiveEntitySequence &aHandle);
        Handle_Select3D_SequenceNodeOfSensitiveEntitySequence(const Select3D_SequenceNodeOfSensitiveEntitySequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SequenceNodeOfSensitiveEntitySequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SequenceNodeOfSensitiveEntitySequence {
    Select3D_SequenceNodeOfSensitiveEntitySequence* GetObject() {
    return (Select3D_SequenceNodeOfSensitiveEntitySequence*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitiveBox;
class Select3D_SensitiveBox : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveBox;
		%feature("autodoc", "	* Constructs a sensitive box object defined by the owner OwnerId, and the bounding box BoundingBox.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param BoundingBox:
	:type BoundingBox: Bnd_Box &
	:rtype: None
") Select3D_SensitiveBox;
		 Select3D_SensitiveBox (const Handle_SelectBasics_EntityOwner & OwnerId,const Bnd_Box & BoundingBox);
		%feature("compactdefaultargs") Select3D_SensitiveBox;
		%feature("autodoc", "	* Constructs a sensitive box object defined by the owner OwnerId, and the coordinates Xmin, YMin, ZMin, XMax, YMax, ZMax. Xmin, YMin and ZMin define the minimum point in the front lower left hand corner of the box, and XMax, YMax and ZMax define the maximum point in the back upper right hand corner of the box.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param ZMin:
	:type ZMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param ZMax:
	:type ZMax: float
	:rtype: None
") Select3D_SensitiveBox;
		 Select3D_SensitiveBox (const Handle_SelectBasics_EntityOwner & OwnerId,const Standard_Real XMin,const Standard_Real YMin,const Standard_Real ZMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real ZMax);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* projection of the sensitive primitive in order to get 2D boxes for the Sort Algorithm

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: None
") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "	* gives the 2D boxes which represent the Box in the selection process...

	:param boxes:
	:type boxes: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") ComputeDepth;
		%feature("autodoc", "	:param EyeLine:
	:type EyeLine: gp_Lin
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	* Returns the sensitive 3D box used at the time of construction.

	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box ();
};


%extend Select3D_SensitiveBox {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveBox(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveBox::Handle_Select3D_SensitiveBox %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveBox;
class Handle_Select3D_SensitiveBox : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveBox();
        Handle_Select3D_SensitiveBox(const Handle_Select3D_SensitiveBox &aHandle);
        Handle_Select3D_SensitiveBox(const Select3D_SensitiveBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveBox {
    Select3D_SensitiveBox* GetObject() {
    return (Select3D_SensitiveBox*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitiveGroup;
class Select3D_SensitiveGroup : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveGroup;
		%feature("autodoc", "	* Constructs an empty sensitive group object. This is a set of sensitive 3D entities. The sensitive entities will be defined using the function Add to fill the entity owner OwnerId. If MatchAll is false, nothing can be added.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param MatchAll: default value is Standard_True
	:type MatchAll: bool
	:rtype: None
") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup (const Handle_SelectBasics_EntityOwner & OwnerId,const Standard_Boolean MatchAll = Standard_True);
		%feature("compactdefaultargs") Select3D_SensitiveGroup;
		%feature("autodoc", "	* Constructs a sensitive group object defined by the list TheList and the entity owner OwnerId. If MatchAll is false, nothing is done.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param TheList:
	:type TheList: Select3D_ListOfSensitive &
	:param MatchAll: default value is Standard_True
	:type MatchAll: bool
	:rtype: None
") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup (const Handle_SelectBasics_EntityOwner & OwnerId,Select3D_ListOfSensitive & TheList,const Standard_Boolean MatchAll = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the list of sensitive entities LL to the empty sensitive group object created at construction time.

	:param LL:
	:type LL: Select3D_ListOfSensitive &
	:rtype: None
") Add;
		void Add (Select3D_ListOfSensitive & LL);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the sensitive entity aSensitive to the non-empty sensitive group object created at construction time.

	:param aSensitive:
	:type aSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Add;
		void Add (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aSensitive:
	:type aSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Remove;
		void Remove (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Removes all sensitive entities from the list used at the time of construction, or added using the function Add.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "	* Returns true if the sensitive entity aSensitive is in the list used at the time of construction, or added using the function Add.

	:param aSensitive:
	:type aSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the requirement that all sensitive entities in the list used at the time of construction, or added using the function Add must be matched.

	:param MustMatchAllEntities:
	:type MustMatchAllEntities: bool
	:rtype: None
") Set;
		void Set (const Standard_Boolean MustMatchAllEntities);
		%feature("compactdefaultargs") MustMatchAll;
		%feature("autodoc", "	* Returns true if all sensitive entities in the list used at the time of construction, or added using the function Add must be matched.

	:rtype: bool
") MustMatchAll;
		Standard_Boolean MustMatchAll ();
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* projection of the sensitive primitive in order to get 2D boxes for the Sort Algorithm

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: None
") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "	* gives the 2D boxes which represent the segment in the selection process...

	:param boxes:
	:type boxes: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("compactdefaultargs") MaxBoxes;
		%feature("autodoc", "	:rtype: int
") MaxBoxes;
		Standard_Integer MaxBoxes ();
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* propagation of location on all the sensitive inside...

	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: None
") SetLocation;
		void SetLocation (const TopLoc_Location & aLoc);
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	* propagation of location on all the sensitive inside...

	:rtype: None
") ResetLocation;
		void ResetLocation ();
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the owner for all entities in group

	:param TheOwnerId:
	:type TheOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Set;
		void Set (const Handle_SelectBasics_EntityOwner & TheOwnerId);
		%feature("compactdefaultargs") GetEntities;
		%feature("autodoc", "	* Gets group content

	:rtype: Select3D_ListOfSensitive
") GetEntities;
		const Select3D_ListOfSensitive & GetEntities ();
};


%extend Select3D_SensitiveGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveGroup::Handle_Select3D_SensitiveGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveGroup;
class Handle_Select3D_SensitiveGroup : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveGroup();
        Handle_Select3D_SensitiveGroup(const Handle_Select3D_SensitiveGroup &aHandle);
        Handle_Select3D_SensitiveGroup(const Select3D_SensitiveGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveGroup {
    Select3D_SensitiveGroup* GetObject() {
    return (Select3D_SensitiveGroup*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitivePoint;
class Select3D_SensitivePoint : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Select3D_SensitivePoint;
		%feature("autodoc", "	* Constructs a sensitive point object defined by the owner OwnerId and the point Point.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") Select3D_SensitivePoint;
		 Select3D_SensitivePoint (const Handle_SelectBasics_EntityOwner & OwnerId,const gp_Pnt & Point);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* //!Converts the stored 3D point into a 2D point according  to <aProjector> ; this method is called by the selection Manager.

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: None
") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "	* stores in <aresult> the 2D sensitive box which represents the point area in the selection process.

	:param aresult:
	:type aresult: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & aresult);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") ComputeDepth;
		%feature("autodoc", "	:param EyeLine:
	:type EyeLine: gp_Lin
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point used at the time of construction.

	:rtype: gp_Pnt
") Point;
		gp_Pnt Point ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
};


%extend Select3D_SensitivePoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitivePoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitivePoint::Handle_Select3D_SensitivePoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitivePoint;
class Handle_Select3D_SensitivePoint : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitivePoint();
        Handle_Select3D_SensitivePoint(const Handle_Select3D_SensitivePoint &aHandle);
        Handle_Select3D_SensitivePoint(const Select3D_SensitivePoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitivePoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitivePoint {
    Select3D_SensitivePoint* GetObject() {
    return (Select3D_SensitivePoint*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitivePoly;
class Select3D_SensitivePoly : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* projection of the sensitive primitive in order to get 2D boxes for the Sort Algorithm

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: void
") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "	* stores in <boxes> the 2D Boxes which represent the sensitive face in the selection algorithm.

	:param boxes:
	:type boxes: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "	* Returns the 3D points of the array used at construction time.

	:param theHArrayOfPnt:
	:type theHArrayOfPnt: Handle_TColgp_HArray1OfPnt
	:rtype: None
") Points3D;
		void Points3D (Handle_TColgp_HArray1OfPnt & theHArrayOfPnt);
		%feature("compactdefaultargs") Points2D;
		%feature("autodoc", "	* Returns the 2D points of the array used at construction time.

	:param theArrayOfPnt2d:
	:type theArrayOfPnt2d: TColgp_Array1OfPnt2d
	:rtype: None
") Points2D;
		void Points2D (TColgp_Array1OfPnt2d & theArrayOfPnt2d);
};


%extend Select3D_SensitivePoly {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitivePoly(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitivePoly::Handle_Select3D_SensitivePoly %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitivePoly;
class Handle_Select3D_SensitivePoly : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitivePoly();
        Handle_Select3D_SensitivePoly(const Handle_Select3D_SensitivePoly &aHandle);
        Handle_Select3D_SensitivePoly(const Select3D_SensitivePoly *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitivePoly DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitivePoly {
    Select3D_SensitivePoly* GetObject() {
    return (Select3D_SensitivePoly*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitiveSegment;
class Select3D_SensitiveSegment : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveSegment;
		%feature("autodoc", "	* Constructs the sensitive segment object defined by the owner OwnerId, the points FirstP, LastP and the maximum number of sensitive bounding boxes MaxRect.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param FirstP:
	:type FirstP: gp_Pnt
	:param LastP:
	:type LastP: gp_Pnt
	:param MaxRect: default value is 1
	:type MaxRect: int
	:rtype: None
") Select3D_SensitiveSegment;
		 Select3D_SensitiveSegment (const Handle_SelectBasics_EntityOwner & OwnerId,const gp_Pnt & FirstP,const gp_Pnt & LastP,const Standard_Integer MaxRect = 1);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the maximum number of sensitive rectangles MaxRect.

	:param MaxRect:
	:type MaxRect: int
	:rtype: None
") Set;
		void Set (const Standard_Integer MaxRect);
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "	* changes the start Point of the Segment;

	:param aPt:
	:type aPt: gp_Pnt
	:rtype: None
") StartPoint;
		void StartPoint (const gp_Pnt & aPt);
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "	* changes the end point of the segment

	:param aPt:
	:type aPt: gp_Pnt
	:rtype: None
") EndPoint;
		void EndPoint (const gp_Pnt & aPt);
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "	* gives the 3D start Point of the Segment

	:rtype: gp_Pnt
") StartPoint;
		gp_Pnt StartPoint ();
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "	* gives the 3D End Point of the Segment

	:rtype: gp_Pnt
") EndPoint;
		gp_Pnt EndPoint ();
		%feature("compactdefaultargs") StartPoint2d;
		%feature("autodoc", "	* gives the 3D start Point of the Segment

	:rtype: gp_Pnt2d
") StartPoint2d;
		gp_Pnt2d StartPoint2d ();
		%feature("compactdefaultargs") EndPoint2d;
		%feature("autodoc", "	* gives the 3D End Point of the Segment

	:rtype: gp_Pnt2d
") EndPoint2d;
		gp_Pnt2d EndPoint2d ();
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* projection of the sensitive primitive in order to get 2D boxes for the Sort Algorithm

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: void
") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "	* gives the 2D boxes which represent the segment in the selection process...

	:param boxes:
	:type boxes: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") ComputeDepth;
		%feature("autodoc", "	:param EyeLine:
	:type EyeLine: gp_Lin
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("compactdefaultargs") MaxBoxes;
		%feature("autodoc", "	* //!returns <mymaxrect>

	:rtype: int
") MaxBoxes;
		Standard_Integer MaxBoxes ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
};


%extend Select3D_SensitiveSegment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveSegment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveSegment::Handle_Select3D_SensitiveSegment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveSegment;
class Handle_Select3D_SensitiveSegment : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveSegment();
        Handle_Select3D_SensitiveSegment(const Handle_Select3D_SensitiveSegment &aHandle);
        Handle_Select3D_SensitiveSegment(const Select3D_SensitiveSegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveSegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveSegment {
    Select3D_SensitiveSegment* GetObject() {
    return (Select3D_SensitiveSegment*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitiveWire;
class Select3D_SensitiveWire : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveWire;
		%feature("autodoc", "	* Constructs a sensitive wire object defined by the owner OwnerId, and the maximum number of sensitive rectangles MaxRect.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param MaxRect: default value is 1
	:type MaxRect: int
	:rtype: None
") Select3D_SensitiveWire;
		 Select3D_SensitiveWire (const Handle_SelectBasics_EntityOwner & OwnerId,const Standard_Integer MaxRect = 1);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the sensitive entity aSensitive to this framework.

	:param aSensitive:
	:type aSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Add;
		void Add (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* projection of the sensitive primitive in order to get 2D boxes for the Sort Algorithm

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: None
") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "	* gives the 2D boxes which represent the segment in the selection process...

	:param boxes:
	:type boxes: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("compactdefaultargs") GetEdges;
		%feature("autodoc", "	* returns the sensitive edges stored in this wire

	:param theEdges:
	:type theEdges: Select3D_SensitiveEntitySequence &
	:rtype: None
") GetEdges;
		void GetEdges (Select3D_SensitiveEntitySequence & theEdges);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* propagation of location on all the sensitive inside...

	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: None
") SetLocation;
		void SetLocation (const TopLoc_Location & aLoc);
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	* propagation of location on all the sensitive inside...

	:rtype: None
") ResetLocation;
		void ResetLocation ();
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") MaxBoxes;
		%feature("autodoc", "	* //!returns <mymaxrect>

	:rtype: int
") MaxBoxes;
		Standard_Integer MaxBoxes ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the owner for all entities in wire

	:param TheOwnerId:
	:type TheOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Set;
		void Set (const Handle_SelectBasics_EntityOwner & TheOwnerId);
		%feature("compactdefaultargs") GetLastDetected;
		%feature("autodoc", "	* //!returns <mymaxrect>

	:rtype: Handle_Select3D_SensitiveEntity
") GetLastDetected;
		Handle_Select3D_SensitiveEntity GetLastDetected ();
};


%extend Select3D_SensitiveWire {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveWire(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveWire::Handle_Select3D_SensitiveWire %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveWire;
class Handle_Select3D_SensitiveWire : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveWire();
        Handle_Select3D_SensitiveWire(const Handle_Select3D_SensitiveWire &aHandle);
        Handle_Select3D_SensitiveWire(const Select3D_SensitiveWire *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveWire DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveWire {
    Select3D_SensitiveWire* GetObject() {
    return (Select3D_SensitiveWire*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitiveCircle;
class Select3D_SensitiveCircle : public Select3D_SensitivePoly {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "	* Constructs the sensitive circle object defined by the owner OwnerId, the circle Circle, the Boolean FilledCircle and the number of points NbOfPoints.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param TheCircle:
	:type TheCircle: Handle_Geom_Circle &
	:param FilledCircle: default value is Standard_False
	:type FilledCircle: bool
	:param NbOfPoints: default value is 6
	:type NbOfPoints: int
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_Geom_Circle & TheCircle,const Standard_Boolean FilledCircle = Standard_False,const Standard_Integer NbOfPoints = 6);
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "	* Constructs the sensitive arc object defined by the owner OwnerId, the circle Circle, the parameters u1 and u2, the Boolean FilledCircle and the number of points NbOfPoints. u1 and u2 define the first and last points of the arc on Circle.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param TheCircle:
	:type TheCircle: Handle_Geom_Circle &
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:param FilledCircle: default value is Standard_False
	:type FilledCircle: bool
	:param NbOfPoints: default value is 6
	:type NbOfPoints: int
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_Geom_Circle & TheCircle,const Standard_Real u1,const Standard_Real u2,const Standard_Boolean FilledCircle = Standard_False,const Standard_Integer NbOfPoints = 6);
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "	* Constructs the sensitive circle object defined by the owner OwnerId, the array of triangles apolyg3d, and the Boolean FilledCircle. apolyg3d is an array of consecutive triangles on the circle. The triangle i+1 lies on the intersection of the tangents to the circle of i and i+2. Note, that the first point of apolyg3d must be equal to the last point of apolyg3d.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param apolyg3d:
	:type apolyg3d: Handle_TColgp_HArray1OfPnt
	:param FilledCircle: default value is Standard_False
	:type FilledCircle: bool
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_TColgp_HArray1OfPnt & apolyg3d,const Standard_Boolean FilledCircle = Standard_False);
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "	* Constructs the sensitive circle object defined by the owner OwnerId, the array of points apolyg3d, and the Boolean FilledCircle. If the length of apolyg3d is more then 1, the first point of apolyg3d must be equal to the last point of apolyg3d.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param apolyg3d:
	:type apolyg3d: TColgp_Array1OfPnt
	:param FilledCircle: default value is Standard_False
	:type FilledCircle: bool
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const TColgp_Array1OfPnt & apolyg3d,const Standard_Boolean FilledCircle = Standard_False);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") ComputeDepth;
		%feature("autodoc", "	* Compute depth of sensitive circle for the detected sub-part. @param thePickLine [in] the picking line. @param theDetectedIndex [in] index of the detected sub-part. returns depth on the picking line.

	:param thePickLine:
	:type thePickLine: gp_Lin
	:param theDetectedIndex:
	:type theDetectedIndex: int
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & thePickLine,const Standard_Integer theDetectedIndex);
		%feature("compactdefaultargs") ArrayBounds;
		%feature("autodoc", "	:param Low:
	:type Low: int &
	:param Up:
	:type Up: int &
	:rtype: None
") ArrayBounds;
		void ArrayBounds (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetPoint3d;
		%feature("autodoc", "	:param rank:
	:type rank: int
	:rtype: gp_Pnt
") GetPoint3d;
		gp_Pnt GetPoint3d (const Standard_Integer rank);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	* Returns the copy of this.

	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & theLocation);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: void
") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
};


%extend Select3D_SensitiveCircle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveCircle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveCircle::Handle_Select3D_SensitiveCircle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveCircle;
class Handle_Select3D_SensitiveCircle : public Handle_Select3D_SensitivePoly {

    public:
        // constructors
        Handle_Select3D_SensitiveCircle();
        Handle_Select3D_SensitiveCircle(const Handle_Select3D_SensitiveCircle &aHandle);
        Handle_Select3D_SensitiveCircle(const Select3D_SensitiveCircle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveCircle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveCircle {
    Select3D_SensitiveCircle* GetObject() {
    return (Select3D_SensitiveCircle*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitiveCurve;
class Select3D_SensitiveCurve : public Select3D_SensitivePoly {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "	* Constructs a sensitive curve object defined by the owner OwnerId, the curve TheCurve, and the maximum number of points on the curve: MaxPoints.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param TheCurve:
	:type TheCurve: Handle_Geom_Curve &
	:param MaxPoints: default value is 17
	:type MaxPoints: int
	:rtype: None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_Geom_Curve & TheCurve,const Standard_Integer MaxPoints = 17);
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "	* Constructs a sensitive curve object defined by the owner OwnerId and the set of points ThePoints.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param ThePoints:
	:type ThePoints: Handle_TColgp_HArray1OfPnt
	:rtype: None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_TColgp_HArray1OfPnt & ThePoints);
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "	* Creation of Sensitive Curve from Points. Warning : This Method should disappear in the next version...

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param ThePoints:
	:type ThePoints: TColgp_Array1OfPnt
	:rtype: None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & OwnerId,const TColgp_Array1OfPnt & ThePoints);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") ComputeDepth;
		%feature("autodoc", "	* Compute depth of sensitive circle for the detected sub-part. @param thePickLine [in] the picking line. @param theDetectedIndex [in] index of the detected sub-part. returns depth on the picking line.

	:param thePickLine:
	:type thePickLine: gp_Lin
	:param theDetectedIndex:
	:type theDetectedIndex: int
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & thePickLine,const Standard_Integer theDetectedIndex);
		%feature("compactdefaultargs") GetLastDetected;
		%feature("autodoc", "	* Gets index of last detected segment

	:rtype: int
") GetLastDetected;
		Standard_Integer GetLastDetected ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	* Returns the copy of this

	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & theLocation);
};


%extend Select3D_SensitiveCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveCurve::Handle_Select3D_SensitiveCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveCurve;
class Handle_Select3D_SensitiveCurve : public Handle_Select3D_SensitivePoly {

    public:
        // constructors
        Handle_Select3D_SensitiveCurve();
        Handle_Select3D_SensitiveCurve(const Handle_Select3D_SensitiveCurve &aHandle);
        Handle_Select3D_SensitiveCurve(const Select3D_SensitiveCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveCurve {
    Select3D_SensitiveCurve* GetObject() {
    return (Select3D_SensitiveCurve*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitiveFace;
class Select3D_SensitiveFace : public Select3D_SensitivePoly {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveFace;
		%feature("autodoc", "	* Constructs a sensitive face object defined by the owner OwnerId, the array of points ThePoints, and the sensitivity type Sensitivity. The array of points is the outer polygon of the geometric face.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param ThePoints:
	:type ThePoints: TColgp_Array1OfPnt
	:param Sensitivity: default value is Select3D_TOS_INTERIOR
	:type Sensitivity: Select3D_TypeOfSensitivity
	:rtype: None
") Select3D_SensitiveFace;
		 Select3D_SensitiveFace (const Handle_SelectBasics_EntityOwner & OwnerId,const TColgp_Array1OfPnt & ThePoints,const Select3D_TypeOfSensitivity Sensitivity = Select3D_TOS_INTERIOR);
		%feature("compactdefaultargs") Select3D_SensitiveFace;
		%feature("autodoc", "	* Constructs a sensitive face object defined by the owner OwnerId, the array of points ThePoints, and the sensitivity type Sensitivity. The array of points is the outer polygon of the geometric face.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param ThePoints:
	:type ThePoints: Handle_TColgp_HArray1OfPnt
	:param Sensitivity: default value is Select3D_TOS_INTERIOR
	:type Sensitivity: Select3D_TypeOfSensitivity
	:rtype: None
") Select3D_SensitiveFace;
		 Select3D_SensitiveFace (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_TColgp_HArray1OfPnt & ThePoints,const Select3D_TypeOfSensitivity Sensitivity = Select3D_TOS_INTERIOR);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") ComputeDepth;
		%feature("autodoc", "	* Computes the depth values for all 3D points defining this face and returns the minimal value among them. If the 'minimal depth' approach is not suitable and gives wrong detection results in some particular case, a custom sensitive face class can redefine this method.

	:param thePickLine:
	:type thePickLine: gp_Lin
	:param theDepthMin:
	:type theDepthMin: float
	:param theDepthMax:
	:type theDepthMax: float
	:rtype: float
") ComputeDepth;
		virtual Standard_Real ComputeDepth (const gp_Lin & thePickLine,const Standard_Real theDepthMin,const Standard_Real theDepthMax);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	* Returns the copy of this

	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & theLocation);
};


%extend Select3D_SensitiveFace {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveFace(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveFace::Handle_Select3D_SensitiveFace %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveFace;
class Handle_Select3D_SensitiveFace : public Handle_Select3D_SensitivePoly {

    public:
        // constructors
        Handle_Select3D_SensitiveFace();
        Handle_Select3D_SensitiveFace(const Handle_Select3D_SensitiveFace &aHandle);
        Handle_Select3D_SensitiveFace(const Select3D_SensitiveFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveFace {
    Select3D_SensitiveFace* GetObject() {
    return (Select3D_SensitiveFace*)$self->Access();
    }
};

%nodefaultctor Select3D_SensitiveTriangle;
class Select3D_SensitiveTriangle : public Select3D_SensitivePoly {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveTriangle;
		%feature("autodoc", "	* Constructs a sensitive triangle object defined by the owner OwnerId, the points P1, P2, P3, and the type of sensitivity Sensitivity.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param Sensitivity: default value is Select3D_TOS_INTERIOR
	:type Sensitivity: Select3D_TypeOfSensitivity
	:rtype: None
") Select3D_SensitiveTriangle;
		 Select3D_SensitiveTriangle (const Handle_SelectBasics_EntityOwner & OwnerId,const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const Select3D_TypeOfSensitivity Sensitivity = Select3D_TOS_INTERIOR);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") ComputeDepth;
		%feature("autodoc", "	:param EyeLine:
	:type EyeLine: gp_Lin
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "	* Returns the 3D points P1, P2, P3 used at the time of construction.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:rtype: None
") Points3D;
		void Points3D (gp_Pnt & P1,gp_Pnt & P2,gp_Pnt & P3);
		%feature("compactdefaultargs") Center3D;
		%feature("autodoc", "	* Returns the center point of the sensitive triangle created at construction time.

	:rtype: gp_Pnt
") Center3D;
		gp_Pnt Center3D ();
		%feature("compactdefaultargs") Center2D;
		%feature("autodoc", "	* WARNING : the returned Values are the original values without the stored location (if there's one). To get the genuine value, One must apply this location (Method Location() )

	:rtype: gp_XY
") Center2D;
		gp_XY Center2D ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param aTol:
	:type aTol: float
	:param Dmin:
	:type Dmin: float &
	:rtype: int
") Status;
		Standard_Integer Status (const Standard_Real X,const Standard_Real Y,const Standard_Real aTol,Standard_Real &OutValue);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Dmin gives the distance between the cdg and aPoint return

	:param p0:
	:type p0: gp_XY
	:param p1:
	:type p1: gp_XY
	:param p2:
	:type p2: gp_XY
	:param aPoint:
	:type aPoint: gp_XY
	:param aTol:
	:type aTol: float
	:param Dmin:
	:type Dmin: float &
	:rtype: int
") Status;
		static Standard_Integer Status (const gp_XY & p0,const gp_XY & p1,const gp_XY & p2,const gp_XY & aPoint,const Standard_Real aTol,Standard_Real &OutValue);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	* Returns the copy of this

	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & theLocation);
};


%extend Select3D_SensitiveTriangle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveTriangle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveTriangle::Handle_Select3D_SensitiveTriangle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveTriangle;
class Handle_Select3D_SensitiveTriangle : public Handle_Select3D_SensitivePoly {

    public:
        // constructors
        Handle_Select3D_SensitiveTriangle();
        Handle_Select3D_SensitiveTriangle(const Handle_Select3D_SensitiveTriangle &aHandle);
        Handle_Select3D_SensitiveTriangle(const Select3D_SensitiveTriangle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveTriangle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveTriangle {
    Select3D_SensitiveTriangle* GetObject() {
    return (Select3D_SensitiveTriangle*)$self->Access();
    }
};

