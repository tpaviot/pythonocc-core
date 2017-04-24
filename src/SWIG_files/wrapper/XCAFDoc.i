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
%module (package="OCC") XCAFDoc

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


%include XCAFDoc_headers.i


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
enum XCAFDoc_ColorType {
	XCAFDoc_ColorGen = 0,
	XCAFDoc_ColorSurf = 1,
	XCAFDoc_ColorCurv = 2,
};

/* end public enums declaration */

%rename(xcafdoc) XCAFDoc;
class XCAFDoc {
	public:
		%feature("compactdefaultargs") AssemblyGUID;
		%feature("autodoc", "	* Returns GUID for UAttribute identifying assembly

	:rtype: Standard_GUID
") AssemblyGUID;
		static Standard_GUID AssemblyGUID ();
		%feature("compactdefaultargs") ShapeRefGUID;
		%feature("autodoc", "	* Returns GUID for TreeNode representing assembly link

	:rtype: Standard_GUID
") ShapeRefGUID;
		static Standard_GUID ShapeRefGUID ();
		%feature("compactdefaultargs") ColorRefGUID;
		%feature("autodoc", "	* Return GUIDs for TreeNode representing specified types of colors

	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: Standard_GUID
") ColorRefGUID;
		static Standard_GUID ColorRefGUID (const XCAFDoc_ColorType type);
		%feature("compactdefaultargs") DimTolRefGUID;
		%feature("autodoc", "	* Return GUIDs for TreeNode representing specified types of DGT

	:rtype: Standard_GUID
") DimTolRefGUID;
		static Standard_GUID DimTolRefGUID ();
		%feature("compactdefaultargs") DatumRefGUID;
		%feature("autodoc", "	* Return GUIDs for TreeNode representing specified types of datum

	:rtype: Standard_GUID
") DatumRefGUID;
		static Standard_GUID DatumRefGUID ();
		%feature("compactdefaultargs") DatumTolRefGUID;
		%feature("autodoc", "	* Return GUIDs for TreeNode representing connections Datum-Toler

	:rtype: Standard_GUID
") DatumTolRefGUID;
		static Standard_GUID DatumTolRefGUID ();
		%feature("compactdefaultargs") LayerRefGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") LayerRefGUID;
		static Standard_GUID LayerRefGUID ();
		%feature("compactdefaultargs") MaterialRefGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") MaterialRefGUID;
		static Standard_GUID MaterialRefGUID ();
		%feature("compactdefaultargs") InvisibleGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") InvisibleGUID;
		static Standard_GUID InvisibleGUID ();
		%feature("compactdefaultargs") ExternRefGUID;
		%feature("autodoc", "	* Returns GUID for UAttribute identifying external reference on no-step file

	:rtype: Standard_GUID
") ExternRefGUID;
		static Standard_GUID ExternRefGUID ();
		%feature("compactdefaultargs") SHUORefGUID;
		%feature("autodoc", "	* Returns GUID for UAttribute identifying specified higher usage occurrence

	:rtype: Standard_GUID
") SHUORefGUID;
		static Standard_GUID SHUORefGUID ();
};


%extend XCAFDoc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_Area;
class XCAFDoc_Area : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_Area;
		%feature("autodoc", "	* class methods =============

	:rtype: None
") XCAFDoc_Area;
		 XCAFDoc_Area ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets a value of volume

	:param vol:
	:type vol: float
	:rtype: None
") Set;
		void Set (const Standard_Real vol);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, an Area attribute and set its value

	:param label:
	:type label: TDF_Label &
	:param area:
	:type area: float
	:rtype: Handle_XCAFDoc_Area
") Set;
		static Handle_XCAFDoc_Area Set (const TDF_Label & label,const Standard_Real area);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: float
") Get;
		Standard_Real Get ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns volume of area as argument and succes status returns false if no such attribute at the <label>

	:param label:
	:type label: TDF_Label &
	:param area:
	:type area: float &
	:rtype: bool
") Get;
		static Standard_Boolean Get (const TDF_Label & label,Standard_Real &OutValue);
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


%extend XCAFDoc_Area {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_Area(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_Area::Handle_XCAFDoc_Area %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_Area;
class Handle_XCAFDoc_Area : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_Area();
        Handle_XCAFDoc_Area(const Handle_XCAFDoc_Area &aHandle);
        Handle_XCAFDoc_Area(const XCAFDoc_Area *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_Area DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_Area {
    XCAFDoc_Area* _get_reference() {
    return (XCAFDoc_Area*)$self->Access();
    }
};

%extend Handle_XCAFDoc_Area {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_Area {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_Centroid;
class XCAFDoc_Centroid : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_Centroid;
		%feature("autodoc", "	* class methods =============

	:rtype: None
") XCAFDoc_Centroid;
		 XCAFDoc_Centroid ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, a Location attribute and set it's value the Location attribute is returned. Location methods ===============

	:param label:
	:type label: TDF_Label &
	:param pnt:
	:type pnt: gp_Pnt
	:rtype: Handle_XCAFDoc_Centroid
") Set;
		static Handle_XCAFDoc_Centroid Set (const TDF_Label & label,const gp_Pnt & pnt);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param pnt:
	:type pnt: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & pnt);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: gp_Pnt
") Get;
		gp_Pnt Get ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns point as argument returns false if no such attribute at the <label>

	:param label:
	:type label: TDF_Label &
	:param pnt:
	:type pnt: gp_Pnt
	:rtype: bool
") Get;
		static Standard_Boolean Get (const TDF_Label & label,gp_Pnt & pnt);
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


%extend XCAFDoc_Centroid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_Centroid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_Centroid::Handle_XCAFDoc_Centroid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_Centroid;
class Handle_XCAFDoc_Centroid : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_Centroid();
        Handle_XCAFDoc_Centroid(const Handle_XCAFDoc_Centroid &aHandle);
        Handle_XCAFDoc_Centroid(const XCAFDoc_Centroid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_Centroid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_Centroid {
    XCAFDoc_Centroid* _get_reference() {
    return (XCAFDoc_Centroid*)$self->Access();
    }
};

%extend Handle_XCAFDoc_Centroid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_Centroid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_Color;
class XCAFDoc_Color : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_Color;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_Color;
		 XCAFDoc_Color ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label &
	:param C:
	:type C: Quantity_Color &
	:rtype: Handle_XCAFDoc_Color
") Set;
		static Handle_XCAFDoc_Color Set (const TDF_Label & label,const Quantity_Color & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label &
	:param C:
	:type C: Quantity_NameOfColor
	:rtype: Handle_XCAFDoc_Color
") Set;
		static Handle_XCAFDoc_Color Set (const TDF_Label & label,const Quantity_NameOfColor C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, a Color attribute and set it's value the Color attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: Handle_XCAFDoc_Color
") Set;
		static Handle_XCAFDoc_Color Set (const TDF_Label & label,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: Quantity_Color &
	:rtype: None
") Set;
		void Set (const Quantity_Color & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: Quantity_NameOfColor
	:rtype: None
") Set;
		void Set (const Quantity_NameOfColor C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: None
") Set;
		void Set (const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	:rtype: Quantity_Color
") GetColor;
		const Quantity_Color & GetColor ();
		%feature("compactdefaultargs") GetNOC;
		%feature("autodoc", "	:rtype: Quantity_NameOfColor
") GetNOC;
		Quantity_NameOfColor GetNOC ();
		%feature("compactdefaultargs") GetRGB;
		%feature("autodoc", "	* Returns True if there is a reference on the same label

	:param R:
	:type R: float &
	:param G:
	:type G: float &
	:param B:
	:type B: float &
	:rtype: None
") GetRGB;
		void GetRGB (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
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
};


%extend XCAFDoc_Color {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_Color(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_Color::Handle_XCAFDoc_Color %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_Color;
class Handle_XCAFDoc_Color : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_Color();
        Handle_XCAFDoc_Color(const Handle_XCAFDoc_Color &aHandle);
        Handle_XCAFDoc_Color(const XCAFDoc_Color *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_Color DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_Color {
    XCAFDoc_Color* _get_reference() {
    return (XCAFDoc_Color*)$self->Access();
    }
};

%extend Handle_XCAFDoc_Color {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_Color {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_ColorTool;
class XCAFDoc_ColorTool : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_ColorTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_ColorTool;
		 XCAFDoc_ColorTool ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Creates (if not exist) ColorTool.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_XCAFDoc_ColorTool
") Set;
		static Handle_XCAFDoc_ColorTool Set (const TDF_Label & L);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "	* returns the label under which colors are stored

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel ();
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "	* Returns internal XCAFDoc_ShapeTool tool

	:rtype: Handle_XCAFDoc_ShapeTool
") ShapeTool;
		Handle_XCAFDoc_ShapeTool ShapeTool ();
		%feature("compactdefaultargs") IsColor;
		%feature("autodoc", "	* Returns True if label belongs to a colortable and is a color definition

	:param lab:
	:type lab: TDF_Label &
	:rtype: bool
") IsColor;
		Standard_Boolean IsColor (const TDF_Label & lab);
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	* Returns color defined by label lab Returns False if the label is not in colortable or does not define a color

	:param lab:
	:type lab: TDF_Label &
	:param col:
	:type col: Quantity_Color &
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor (const TDF_Label & lab,Quantity_Color & col);
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "	* Finds a color definition in a colortable and returns its label if found Returns False if color is not found in colortable

	:param col:
	:type col: Quantity_Color &
	:param lab:
	:type lab: TDF_Label &
	:rtype: bool
") FindColor;
		Standard_Boolean FindColor (const Quantity_Color & col,TDF_Label & lab);
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "	* Finds a color definition in a colortable and returns its label if found (or Null label else)

	:param col:
	:type col: Quantity_Color &
	:rtype: TDF_Label
") FindColor;
		TDF_Label FindColor (const Quantity_Color & col);
		%feature("compactdefaultargs") AddColor;
		%feature("autodoc", "	* Adds a color definition to a colortable and returns its label (returns existing label if the same color is already defined)

	:param col:
	:type col: Quantity_Color &
	:rtype: TDF_Label
") AddColor;
		TDF_Label AddColor (const Quantity_Color & col);
		%feature("compactdefaultargs") RemoveColor;
		%feature("autodoc", "	* Removes color from the colortable

	:param lab:
	:type lab: TDF_Label &
	:rtype: None
") RemoveColor;
		void RemoveColor (const TDF_Label & lab);
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "	* Returns a sequence of colors currently stored in the colortable

	:param Labels:
	:type Labels: TDF_LabelSequence &
	:rtype: None
") GetColors;
		void GetColors (TDF_LabelSequence & Labels);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color defined by <colorL>. Color of shape is defined following way in dependance with type of color. If type of color is XCAFDoc_ColorGen - then this color defines default color for surfaces and curves. If for shape color with types XCAFDoc_ColorSurf or XCAFDoc_ColorCurv is specified then such color overrides generic color.

	:param L:
	:type L: TDF_Label &
	:param colorL:
	:type colorL: TDF_Label &
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: None
") SetColor;
		void SetColor (const TDF_Label & L,const TDF_Label & colorL,const XCAFDoc_ColorType type);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color <Color> in the colortable Adds a color as necessary

	:param L:
	:type L: TDF_Label &
	:param Color:
	:type Color: Quantity_Color &
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: None
") SetColor;
		void SetColor (const TDF_Label & L,const Quantity_Color & Color,const XCAFDoc_ColorType type);
		%feature("compactdefaultargs") UnSetColor;
		%feature("autodoc", "	* Removes a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color

	:param L:
	:type L: TDF_Label &
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: None
") UnSetColor;
		void UnSetColor (const TDF_Label & L,const XCAFDoc_ColorType type);
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "	* Returns True if label <L> has a color assignment of the type <type>

	:param L:
	:type L: TDF_Label &
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet (const TDF_Label & L,const XCAFDoc_ColorType type);
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	* Returns label with color assigned to <L> as <type> Returns False if no such color is assigned

	:param L:
	:type L: TDF_Label &
	:param type:
	:type type: XCAFDoc_ColorType
	:param colorL:
	:type colorL: TDF_Label &
	:rtype: bool
") GetColor;
		static Standard_Boolean GetColor (const TDF_Label & L,const XCAFDoc_ColorType type,TDF_Label & colorL);
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	* Returns color assigned to <L> as <type> Returns False if no such color is assigned

	:param L:
	:type L: TDF_Label &
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_Color &
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor (const TDF_Label & L,const XCAFDoc_ColorType type,Quantity_Color & color);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color defined by <colorL> Returns False if cannot find a label for shape S

	:param S:
	:type S: TopoDS_Shape &
	:param colorL:
	:type colorL: TDF_Label &
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") SetColor;
		Standard_Boolean SetColor (const TopoDS_Shape & S,const TDF_Label & colorL,const XCAFDoc_ColorType type);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color <Color> in the colortable Adds a color as necessary Returns False if cannot find a label for shape S

	:param S:
	:type S: TopoDS_Shape &
	:param Color:
	:type Color: Quantity_Color &
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") SetColor;
		Standard_Boolean SetColor (const TopoDS_Shape & S,const Quantity_Color & Color,const XCAFDoc_ColorType type);
		%feature("compactdefaultargs") UnSetColor;
		%feature("autodoc", "	* Removes a link with GUID defined by <type> (see XCAFDoc::ColorRefGUID()) from label <L> to color Returns True if such link existed

	:param S:
	:type S: TopoDS_Shape &
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") UnSetColor;
		Standard_Boolean UnSetColor (const TopoDS_Shape & S,const XCAFDoc_ColorType type);
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "	* Returns True if label <L> has a color assignment of the type <type>

	:param S:
	:type S: TopoDS_Shape &
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet (const TopoDS_Shape & S,const XCAFDoc_ColorType type);
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	* Returns label with color assigned to <L> as <type> Returns False if no such color is assigned

	:param S:
	:type S: TopoDS_Shape &
	:param type:
	:type type: XCAFDoc_ColorType
	:param colorL:
	:type colorL: TDF_Label &
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor (const TopoDS_Shape & S,const XCAFDoc_ColorType type,TDF_Label & colorL);
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	* Returns color assigned to <L> as <type> Returns False if no such color is assigned

	:param S:
	:type S: TopoDS_Shape &
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_Color &
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor (const TopoDS_Shape & S,const XCAFDoc_ColorType type,Quantity_Color & color);
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "	* Return True if object on this label is visible, False if invisible.

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsVisible;
		Standard_Boolean IsVisible (const TDF_Label & L);
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "	* Set the visibility of object on label. Do nothing if there no any object. Set UAttribute with corresponding GUID.

	:param shapeLabel:
	:type shapeLabel: TDF_Label &
	:param isvisible: default value is Standard_True
	:type isvisible: bool
	:rtype: None
") SetVisibility;
		void SetVisibility (const TDF_Label & shapeLabel,const Standard_Boolean isvisible = Standard_True);
		%feature("compactdefaultargs") SetInstanceColor;
		%feature("autodoc", "	* Sets the color of component that styled with SHUO structure Returns False if no sush component found NOTE: create SHUO structeure if it is necessary and if <isCreateSHUO>

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_Color &
	:param isCreateSHUO: default value is Standard_True
	:type isCreateSHUO: bool
	:rtype: bool
") SetInstanceColor;
		Standard_Boolean SetInstanceColor (const TopoDS_Shape & theShape,const XCAFDoc_ColorType type,const Quantity_Color & color,const Standard_Boolean isCreateSHUO = Standard_True);
		%feature("compactdefaultargs") GetInstanceColor;
		%feature("autodoc", "	* Gets the color of component that styled with SHUO structure Returns False if no sush component or color type

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_Color &
	:rtype: bool
") GetInstanceColor;
		Standard_Boolean GetInstanceColor (const TopoDS_Shape & theShape,const XCAFDoc_ColorType type,Quantity_Color & color);
		%feature("compactdefaultargs") IsInstanceVisible;
		%feature("autodoc", "	* Gets the visibility status of component that styled with SHUO structure Returns False if no sush component

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") IsInstanceVisible;
		Standard_Boolean IsInstanceVisible (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") ReverseChainsOfTreeNodes;
		%feature("autodoc", "	* Reverses order in chains of TreeNodes (from Last to First) under each Color Label since we became to use function ::Prepend() instead of ::Append() in method SetColor() for acceleration

	:rtype: bool
") ReverseChainsOfTreeNodes;
		Standard_Boolean ReverseChainsOfTreeNodes ();
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
};


%extend XCAFDoc_ColorTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_ColorTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_ColorTool::Handle_XCAFDoc_ColorTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_ColorTool;
class Handle_XCAFDoc_ColorTool : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_ColorTool();
        Handle_XCAFDoc_ColorTool(const Handle_XCAFDoc_ColorTool &aHandle);
        Handle_XCAFDoc_ColorTool(const XCAFDoc_ColorTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_ColorTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_ColorTool {
    XCAFDoc_ColorTool* _get_reference() {
    return (XCAFDoc_ColorTool*)$self->Access();
    }
};

%extend Handle_XCAFDoc_ColorTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_ColorTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel;
class XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel;
		 XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel ();
		%feature("compactdefaultargs") XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel;
		%feature("autodoc", "	:param aMap:
	:type aMap: XCAFDoc_DataMapOfShapeLabel &
	:rtype: None
") XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel;
		 XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel (const XCAFDoc_DataMapOfShapeLabel & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: XCAFDoc_DataMapOfShapeLabel &
	:rtype: None
") Initialize;
		void Initialize (const XCAFDoc_DataMapOfShapeLabel & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_Label
") Value;
		const TDF_Label & Value ();
};


%extend XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_DataMapNodeOfDataMapOfShapeLabel;
class XCAFDoc_DataMapNodeOfDataMapOfShapeLabel : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") XCAFDoc_DataMapNodeOfDataMapOfShapeLabel;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TDF_Label &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") XCAFDoc_DataMapNodeOfDataMapOfShapeLabel;
		 XCAFDoc_DataMapNodeOfDataMapOfShapeLabel (const TopoDS_Shape & K,const TDF_Label & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_Label
") Value;
		TDF_Label & Value ();
};


%extend XCAFDoc_DataMapNodeOfDataMapOfShapeLabel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel::Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel;
class Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel();
        Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel(const Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel &aHandle);
        Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel(const XCAFDoc_DataMapNodeOfDataMapOfShapeLabel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel {
    XCAFDoc_DataMapNodeOfDataMapOfShapeLabel* _get_reference() {
    return (XCAFDoc_DataMapNodeOfDataMapOfShapeLabel*)$self->Access();
    }
};

%extend Handle_XCAFDoc_DataMapNodeOfDataMapOfShapeLabel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_DataMapNodeOfDataMapOfShapeLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_DataMapOfShapeLabel;
class XCAFDoc_DataMapOfShapeLabel : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") XCAFDoc_DataMapOfShapeLabel;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") XCAFDoc_DataMapOfShapeLabel;
		 XCAFDoc_DataMapOfShapeLabel (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFDoc_DataMapOfShapeLabel &
	:rtype: XCAFDoc_DataMapOfShapeLabel
") Assign;
		XCAFDoc_DataMapOfShapeLabel & Assign (const XCAFDoc_DataMapOfShapeLabel & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFDoc_DataMapOfShapeLabel &
	:rtype: XCAFDoc_DataMapOfShapeLabel
") operator =;
		XCAFDoc_DataMapOfShapeLabel & operator = (const XCAFDoc_DataMapOfShapeLabel & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TDF_Label &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TDF_Label & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TDF_Label
") Find;
		const TDF_Label & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TDF_Label
") ChangeFind;
		TDF_Label & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend XCAFDoc_DataMapOfShapeLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_Datum;
class XCAFDoc_Datum : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_Datum;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_Datum;
		 XCAFDoc_Datum ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param anIdentification:
	:type anIdentification: Handle_TCollection_HAsciiString &
	:rtype: Handle_XCAFDoc_Datum
") Set;
		static Handle_XCAFDoc_Datum Set (const TDF_Label & label,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_TCollection_HAsciiString & anIdentification);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param anIdentification:
	:type anIdentification: Handle_TCollection_HAsciiString &
	:rtype: None
") Set;
		void Set (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_TCollection_HAsciiString & anIdentification);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetName;
		Handle_TCollection_HAsciiString GetName ();
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetDescription;
		Handle_TCollection_HAsciiString GetDescription ();
		%feature("compactdefaultargs") GetIdentification;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetIdentification;
		Handle_TCollection_HAsciiString GetIdentification ();
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
};


%extend XCAFDoc_Datum {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_Datum(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_Datum::Handle_XCAFDoc_Datum %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_Datum;
class Handle_XCAFDoc_Datum : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_Datum();
        Handle_XCAFDoc_Datum(const Handle_XCAFDoc_Datum &aHandle);
        Handle_XCAFDoc_Datum(const XCAFDoc_Datum *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_Datum DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_Datum {
    XCAFDoc_Datum* _get_reference() {
    return (XCAFDoc_Datum*)$self->Access();
    }
};

%extend Handle_XCAFDoc_Datum {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_Datum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_DimTol;
class XCAFDoc_DimTol : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_DimTol;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_DimTol;
		 XCAFDoc_DimTol ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label &
	:param kind:
	:type kind: int
	:param aVal:
	:type aVal: Handle_TColStd_HArray1OfReal &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: Handle_XCAFDoc_DimTol
") Set;
		static Handle_XCAFDoc_DimTol Set (const TDF_Label & label,const Standard_Integer kind,const Handle_TColStd_HArray1OfReal & aVal,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param kind:
	:type kind: int
	:param aVal:
	:type aVal: Handle_TColStd_HArray1OfReal &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") Set;
		void Set (const Standard_Integer kind,const Handle_TColStd_HArray1OfReal & aVal,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") GetKind;
		%feature("autodoc", "	:rtype: int
") GetKind;
		Standard_Integer GetKind ();
		%feature("compactdefaultargs") GetVal;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") GetVal;
		Handle_TColStd_HArray1OfReal GetVal ();
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetName;
		Handle_TCollection_HAsciiString GetName ();
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetDescription;
		Handle_TCollection_HAsciiString GetDescription ();
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
};


%extend XCAFDoc_DimTol {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_DimTol(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_DimTol::Handle_XCAFDoc_DimTol %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_DimTol;
class Handle_XCAFDoc_DimTol : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_DimTol();
        Handle_XCAFDoc_DimTol(const Handle_XCAFDoc_DimTol &aHandle);
        Handle_XCAFDoc_DimTol(const XCAFDoc_DimTol *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_DimTol DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_DimTol {
    XCAFDoc_DimTol* _get_reference() {
    return (XCAFDoc_DimTol*)$self->Access();
    }
};

%extend Handle_XCAFDoc_DimTol {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_DimTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_DimTolTool;
class XCAFDoc_DimTolTool : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_DimTolTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_DimTolTool;
		 XCAFDoc_DimTolTool ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Creates (if not exist) DimTolTool.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_XCAFDoc_DimTolTool
") Set;
		static Handle_XCAFDoc_DimTolTool Set (const TDF_Label & L);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "	* returns the label under which colors are stored

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel ();
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "	* Returns internal XCAFDoc_ShapeTool tool

	:rtype: Handle_XCAFDoc_ShapeTool
") ShapeTool;
		Handle_XCAFDoc_ShapeTool ShapeTool ();
		%feature("compactdefaultargs") IsDimTol;
		%feature("autodoc", "	* Returns True if label belongs to a dimtoltable and is a DimTol definition

	:param lab:
	:type lab: TDF_Label &
	:rtype: bool
") IsDimTol;
		Standard_Boolean IsDimTol (const TDF_Label & lab);
		%feature("compactdefaultargs") GetDimTolLabels;
		%feature("autodoc", "	* Returns a sequence of D&GTs currently stored in the DGTtable

	:param Labels:
	:type Labels: TDF_LabelSequence &
	:rtype: None
") GetDimTolLabels;
		void GetDimTolLabels (TDF_LabelSequence & Labels);
		%feature("compactdefaultargs") FindDimTol;
		%feature("autodoc", "	* Finds a dimtol definition in a DGTtable and returns its label if found Returns False if dimtol is not found in DGTtable

	:param kind:
	:type kind: int
	:param aVal:
	:type aVal: Handle_TColStd_HArray1OfReal &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param lab:
	:type lab: TDF_Label &
	:rtype: bool
") FindDimTol;
		Standard_Boolean FindDimTol (const Standard_Integer kind,const Handle_TColStd_HArray1OfReal & aVal,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,TDF_Label & lab);
		%feature("compactdefaultargs") FindDimTol;
		%feature("autodoc", "	* Finds a dimtol definition in a DGTtable and returns its label if found (or Null label else)

	:param kind:
	:type kind: int
	:param aVal:
	:type aVal: Handle_TColStd_HArray1OfReal &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: TDF_Label
") FindDimTol;
		TDF_Label FindDimTol (const Standard_Integer kind,const Handle_TColStd_HArray1OfReal & aVal,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") AddDimTol;
		%feature("autodoc", "	* Adds a dimtol definition to a DGTtable and returns its label

	:param kind:
	:type kind: int
	:param aVal:
	:type aVal: Handle_TColStd_HArray1OfReal &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: TDF_Label
") AddDimTol;
		TDF_Label AddDimTol (const Standard_Integer kind,const Handle_TColStd_HArray1OfReal & aVal,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") SetDimTol;
		%feature("autodoc", "	* Sets a link with GUID

	:param L:
	:type L: TDF_Label &
	:param DimTolL:
	:type DimTolL: TDF_Label &
	:rtype: None
") SetDimTol;
		void SetDimTol (const TDF_Label & L,const TDF_Label & DimTolL);
		%feature("compactdefaultargs") SetDimTol;
		%feature("autodoc", "	* Sets a link with GUID Adds a DimTol as necessary

	:param L:
	:type L: TDF_Label &
	:param kind:
	:type kind: int
	:param aVal:
	:type aVal: Handle_TColStd_HArray1OfReal &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: TDF_Label
") SetDimTol;
		TDF_Label SetDimTol (const TDF_Label & L,const Standard_Integer kind,const Handle_TColStd_HArray1OfReal & aVal,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") GetRefShapeLabel;
		%feature("autodoc", "	* Returns ShapeL defined for label DimTolL Returns False if the DimTolL is not in DGTtable

	:param DimTolL:
	:type DimTolL: TDF_Label &
	:param ShapeL:
	:type ShapeL: TDF_Label &
	:rtype: bool
") GetRefShapeLabel;
		Standard_Boolean GetRefShapeLabel (const TDF_Label & DimTolL,TDF_Label & ShapeL);
		%feature("compactdefaultargs") GetRefDGTLabels;
		%feature("autodoc", "	* Returns all DimTol labels defined for label ShapeL

	:param ShapeL:
	:type ShapeL: TDF_Label &
	:param DimTols:
	:type DimTols: TDF_LabelSequence &
	:rtype: bool
") GetRefDGTLabels;
		Standard_Boolean GetRefDGTLabels (const TDF_Label & ShapeL,TDF_LabelSequence & DimTols);
		%feature("compactdefaultargs") GetDimTol;
		%feature("autodoc", "	* Returns dimtol assigned to <DimTolL> Returns False if no such dimtol is assigned

	:param DimTolL:
	:type DimTolL: TDF_Label &
	:param kind:
	:type kind: int &
	:param aVal:
	:type aVal: Handle_TColStd_HArray1OfReal &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: bool
") GetDimTol;
		Standard_Boolean GetDimTol (const TDF_Label & DimTolL,Standard_Integer &OutValue,Handle_TColStd_HArray1OfReal & aVal,Handle_TCollection_HAsciiString & aName,Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") IsDatum;
		%feature("autodoc", "	* Returns True if label belongs to a dimtoltable and is a Datum definition

	:param lab:
	:type lab: TDF_Label &
	:rtype: bool
") IsDatum;
		Standard_Boolean IsDatum (const TDF_Label & lab);
		%feature("compactdefaultargs") GetDatumLabels;
		%feature("autodoc", "	* Returns a sequence of Datumss currently stored in the DGTtable

	:param Labels:
	:type Labels: TDF_LabelSequence &
	:rtype: None
") GetDatumLabels;
		void GetDatumLabels (TDF_LabelSequence & Labels);
		%feature("compactdefaultargs") FindDatum;
		%feature("autodoc", "	* Finds a datum and returns its label if found

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param anIdentification:
	:type anIdentification: Handle_TCollection_HAsciiString &
	:param lab:
	:type lab: TDF_Label &
	:rtype: bool
") FindDatum;
		Standard_Boolean FindDatum (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_TCollection_HAsciiString & anIdentification,TDF_Label & lab);
		%feature("compactdefaultargs") AddDatum;
		%feature("autodoc", "	* Adds a datum definition to a DGTtable and returns its label

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param anIdentification:
	:type anIdentification: Handle_TCollection_HAsciiString &
	:rtype: TDF_Label
") AddDatum;
		TDF_Label AddDatum (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_TCollection_HAsciiString & anIdentification);
		%feature("compactdefaultargs") SetDatum;
		%feature("autodoc", "	* Sets a link with GUID

	:param L:
	:type L: TDF_Label &
	:param DatumL:
	:type DatumL: TDF_Label &
	:rtype: None
") SetDatum;
		void SetDatum (const TDF_Label & L,const TDF_Label & DatumL);
		%feature("compactdefaultargs") SetDatum;
		%feature("autodoc", "	* Sets a link with GUID for Datum Adds a Datum as necessary Sets connection between Datum and Tolerance

	:param L:
	:type L: TDF_Label &
	:param TolerL:
	:type TolerL: TDF_Label &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param anIdentification:
	:type anIdentification: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDatum;
		void SetDatum (const TDF_Label & L,const TDF_Label & TolerL,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_TCollection_HAsciiString & anIdentification);
		%feature("compactdefaultargs") GetDatum;
		%feature("autodoc", "	* Returns datum assigned to <DatumL> Returns False if no such datum is assigned

	:param DatumL:
	:type DatumL: TDF_Label &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param anIdentification:
	:type anIdentification: Handle_TCollection_HAsciiString &
	:rtype: bool
") GetDatum;
		Standard_Boolean GetDatum (const TDF_Label & DatumL,Handle_TCollection_HAsciiString & aName,Handle_TCollection_HAsciiString & aDescription,Handle_TCollection_HAsciiString & anIdentification);
		%feature("compactdefaultargs") GetDatumTolerLabels;
		%feature("autodoc", "	* Returns all Datum labels defined for label DimTolL

	:param DimTolL:
	:type DimTolL: TDF_Label &
	:param Datums:
	:type Datums: TDF_LabelSequence &
	:rtype: bool
") GetDatumTolerLabels;
		Standard_Boolean GetDatumTolerLabels (const TDF_Label & DimTolL,TDF_LabelSequence & Datums);
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
};


%extend XCAFDoc_DimTolTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_DimTolTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_DimTolTool::Handle_XCAFDoc_DimTolTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_DimTolTool;
class Handle_XCAFDoc_DimTolTool : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_DimTolTool();
        Handle_XCAFDoc_DimTolTool(const Handle_XCAFDoc_DimTolTool &aHandle);
        Handle_XCAFDoc_DimTolTool(const XCAFDoc_DimTolTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_DimTolTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_DimTolTool {
    XCAFDoc_DimTolTool* _get_reference() {
    return (XCAFDoc_DimTolTool*)$self->Access();
    }
};

%extend Handle_XCAFDoc_DimTolTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_DimTolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_DocumentTool;
class XCAFDoc_DocumentTool : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Create (if not exist) DocumentTool attribute on 0.1 label if <IsAcces> is true, else on <L> label. This label will be returned by DocLabel(); If the attribute is already set it won't be reset on <L> even if <IsAcces> is false. ColorTool and ShapeTool attributes are also set by this method.

	:param L:
	:type L: TDF_Label &
	:param IsAcces: default value is Standard_True
	:type IsAcces: bool
	:rtype: Handle_XCAFDoc_DocumentTool
") Set;
		static Handle_XCAFDoc_DocumentTool Set (const TDF_Label & L,const Standard_Boolean IsAcces = Standard_True);
		%feature("compactdefaultargs") IsXCAFDocument;
		%feature("autodoc", "	:param Doc:
	:type Doc: Handle_TDocStd_Document &
	:rtype: bool
") IsXCAFDocument;
		static Standard_Boolean IsXCAFDocument (const Handle_TDocStd_Document & Doc);
		%feature("compactdefaultargs") DocLabel;
		%feature("autodoc", "	* Returns label where the DocumentTool attribute is or 0.1 if DocumentTool is not yet set.

	:param acces:
	:type acces: TDF_Label &
	:rtype: TDF_Label
") DocLabel;
		static TDF_Label DocLabel (const TDF_Label & acces);
		%feature("compactdefaultargs") ShapesLabel;
		%feature("autodoc", "	* Returns sub-label of DocLabel() with tag 1.

	:param acces:
	:type acces: TDF_Label &
	:rtype: TDF_Label
") ShapesLabel;
		static TDF_Label ShapesLabel (const TDF_Label & acces);
		%feature("compactdefaultargs") ColorsLabel;
		%feature("autodoc", "	* Returns sub-label of DocLabel() with tag 2.

	:param acces:
	:type acces: TDF_Label &
	:rtype: TDF_Label
") ColorsLabel;
		static TDF_Label ColorsLabel (const TDF_Label & acces);
		%feature("compactdefaultargs") LayersLabel;
		%feature("autodoc", "	* Returns sub-label of DocLabel() with tag 3.

	:param acces:
	:type acces: TDF_Label &
	:rtype: TDF_Label
") LayersLabel;
		static TDF_Label LayersLabel (const TDF_Label & acces);
		%feature("compactdefaultargs") DGTsLabel;
		%feature("autodoc", "	* Returns sub-label of DocLabel() with tag 4.

	:param acces:
	:type acces: TDF_Label &
	:rtype: TDF_Label
") DGTsLabel;
		static TDF_Label DGTsLabel (const TDF_Label & acces);
		%feature("compactdefaultargs") MaterialsLabel;
		%feature("autodoc", "	* Returns sub-label of DocLabel() with tag 5.

	:param acces:
	:type acces: TDF_Label &
	:rtype: TDF_Label
") MaterialsLabel;
		static TDF_Label MaterialsLabel (const TDF_Label & acces);
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "	* Creates (if it does not exist) ShapeTool attribute on ShapesLabel().

	:param acces:
	:type acces: TDF_Label &
	:rtype: Handle_XCAFDoc_ShapeTool
") ShapeTool;
		static Handle_XCAFDoc_ShapeTool ShapeTool (const TDF_Label & acces);
		%feature("compactdefaultargs") ColorTool;
		%feature("autodoc", "	* Creates (if it does not exist) ColorTool attribute on ColorsLabel().

	:param acces:
	:type acces: TDF_Label &
	:rtype: Handle_XCAFDoc_ColorTool
") ColorTool;
		static Handle_XCAFDoc_ColorTool ColorTool (const TDF_Label & acces);
		%feature("compactdefaultargs") LayerTool;
		%feature("autodoc", "	* Creates (if it does not exist) LayerTool attribute on LayersLabel().

	:param acces:
	:type acces: TDF_Label &
	:rtype: Handle_XCAFDoc_LayerTool
") LayerTool;
		static Handle_XCAFDoc_LayerTool LayerTool (const TDF_Label & acces);
		%feature("compactdefaultargs") DimTolTool;
		%feature("autodoc", "	* Creates (if it does not exist) DimTolTool attribute on DGTsLabel().

	:param acces:
	:type acces: TDF_Label &
	:rtype: Handle_XCAFDoc_DimTolTool
") DimTolTool;
		static Handle_XCAFDoc_DimTolTool DimTolTool (const TDF_Label & acces);
		%feature("compactdefaultargs") MaterialTool;
		%feature("autodoc", "	* Creates (if it does not exist) DimTolTool attribute on DGTsLabel().

	:param acces:
	:type acces: TDF_Label &
	:rtype: Handle_XCAFDoc_MaterialTool
") MaterialTool;
		static Handle_XCAFDoc_MaterialTool MaterialTool (const TDF_Label & acces);
		%feature("compactdefaultargs") XCAFDoc_DocumentTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_DocumentTool;
		 XCAFDoc_DocumentTool ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* to be called when reading this attribute from file

	:rtype: None
") Init;
		void Init ();
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
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Unregisters the document holding this attribute from an internal global map of XDE documents.

	:rtype: void
") Destroy;
		virtual void Destroy ();
};


%extend XCAFDoc_DocumentTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_DocumentTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_DocumentTool::Handle_XCAFDoc_DocumentTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_DocumentTool;
class Handle_XCAFDoc_DocumentTool : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_DocumentTool();
        Handle_XCAFDoc_DocumentTool(const Handle_XCAFDoc_DocumentTool &aHandle);
        Handle_XCAFDoc_DocumentTool(const XCAFDoc_DocumentTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_DocumentTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_DocumentTool {
    XCAFDoc_DocumentTool* _get_reference() {
    return (XCAFDoc_DocumentTool*)$self->Access();
    }
};

%extend Handle_XCAFDoc_DocumentTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_DocumentTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_GraphNode;
class XCAFDoc_GraphNode : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* class methods working on the node =================================== Shortcut to search a Graph node attribute with default GraphID. Returns true if found.

	:param L:
	:type L: TDF_Label &
	:param G:
	:type G: Handle_XCAFDoc_GraphNode &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & L,Handle_XCAFDoc_GraphNode & G);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or Creates a GraphNode attribute on the label <L> with the default Graph ID, returned by the method <GetDefaultGraphID>. Returns the created/found GraphNode attribute.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_XCAFDoc_GraphNode
") Set;
		static Handle_XCAFDoc_GraphNode Set (const TDF_Label & L);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or Creates a GraphNode attribute on the label <L>, with an explicit tree ID. <ExplicitGraphID> is the ID returned by <TDF_Attribute::ID> method. Returns the found/created GraphNode attribute.

	:param L:
	:type L: TDF_Label &
	:param ExplicitGraphID:
	:type ExplicitGraphID: Standard_GUID &
	:rtype: Handle_XCAFDoc_GraphNode
") Set;
		static Handle_XCAFDoc_GraphNode Set (const TDF_Label & L,const Standard_GUID & ExplicitGraphID);
		%feature("compactdefaultargs") GetDefaultGraphID;
		%feature("autodoc", "	* returns a default Graph ID. this ID is used by the <Set> method without explicit tree ID. Instance methods: ================

	:rtype: Standard_GUID
") GetDefaultGraphID;
		static const Standard_GUID & GetDefaultGraphID ();
		%feature("compactdefaultargs") XCAFDoc_GraphNode;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_GraphNode;
		 XCAFDoc_GraphNode ();
		%feature("compactdefaultargs") SetGraphID;
		%feature("autodoc", "	:param explicitID:
	:type explicitID: Standard_GUID &
	:rtype: None
") SetGraphID;
		void SetGraphID (const Standard_GUID & explicitID);
		%feature("compactdefaultargs") SetFather;
		%feature("autodoc", "	* Set GraphNode <F> as father of me and returns index of <F> in Sequence that containing Fathers GraphNodes. return index of <F> from GraphNodeSequnece

	:param F:
	:type F: Handle_XCAFDoc_GraphNode &
	:rtype: int
") SetFather;
		Standard_Integer SetFather (const Handle_XCAFDoc_GraphNode & F);
		%feature("compactdefaultargs") SetChild;
		%feature("autodoc", "	* Set GraphNode <Ch> as child of me and returns index of <Ch> in Sequence that containing Children GraphNodes. return index of <Ch> from GraphNodeSequnece

	:param Ch:
	:type Ch: Handle_XCAFDoc_GraphNode &
	:rtype: int
") SetChild;
		Standard_Integer SetChild (const Handle_XCAFDoc_GraphNode & Ch);
		%feature("compactdefaultargs") UnSetFather;
		%feature("autodoc", "	* Remove <F> from Fathers GraphNodeSequence. and remove link between father and child.

	:param F:
	:type F: Handle_XCAFDoc_GraphNode &
	:rtype: None
") UnSetFather;
		void UnSetFather (const Handle_XCAFDoc_GraphNode & F);
		%feature("compactdefaultargs") UnSetFather;
		%feature("autodoc", "	* Remove Father GraphNode by index from Fathers GraphNodeSequence. and remove link between father and child.

	:param Findex:
	:type Findex: int
	:rtype: None
") UnSetFather;
		void UnSetFather (const Standard_Integer Findex);
		%feature("compactdefaultargs") UnSetChild;
		%feature("autodoc", "	* Remove <Ch> from GraphNodeSequence. and remove link between father and child.

	:param Ch:
	:type Ch: Handle_XCAFDoc_GraphNode &
	:rtype: None
") UnSetChild;
		void UnSetChild (const Handle_XCAFDoc_GraphNode & Ch);
		%feature("compactdefaultargs") UnSetChild;
		%feature("autodoc", "	* Remove Child GraphNode by index from Children GraphNodeSequence. and remove link between father and child.

	:param Chindex:
	:type Chindex: int
	:rtype: None
") UnSetChild;
		void UnSetChild (const Standard_Integer Chindex);
		%feature("compactdefaultargs") GetFather;
		%feature("autodoc", "	* Return GraphNode by index from GraphNodeSequence.

	:param Findex:
	:type Findex: int
	:rtype: Handle_XCAFDoc_GraphNode
") GetFather;
		Handle_XCAFDoc_GraphNode GetFather (const Standard_Integer Findex);
		%feature("compactdefaultargs") GetChild;
		%feature("autodoc", "	* Return GraphNode by index from GraphNodeSequence.

	:param Chindex:
	:type Chindex: int
	:rtype: Handle_XCAFDoc_GraphNode
") GetChild;
		Handle_XCAFDoc_GraphNode GetChild (const Standard_Integer Chindex);
		%feature("compactdefaultargs") FatherIndex;
		%feature("autodoc", "	* Return index of <F>, or zero if there is no such Graphnode.

	:param F:
	:type F: Handle_XCAFDoc_GraphNode &
	:rtype: int
") FatherIndex;
		Standard_Integer FatherIndex (const Handle_XCAFDoc_GraphNode & F);
		%feature("compactdefaultargs") ChildIndex;
		%feature("autodoc", "	* Return index of <Ch>, or zero if there is no such Graphnode.

	:param Ch:
	:type Ch: Handle_XCAFDoc_GraphNode &
	:rtype: int
") ChildIndex;
		Standard_Integer ChildIndex (const Handle_XCAFDoc_GraphNode & Ch);
		%feature("compactdefaultargs") IsFather;
		%feature("autodoc", "	* returns True if <self> is father of <Ch>.

	:param Ch:
	:type Ch: Handle_XCAFDoc_GraphNode &
	:rtype: bool
") IsFather;
		Standard_Boolean IsFather (const Handle_XCAFDoc_GraphNode & Ch);
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "	* returns True if <self> is child of <F>.

	:param F:
	:type F: Handle_XCAFDoc_GraphNode &
	:rtype: bool
") IsChild;
		Standard_Boolean IsChild (const Handle_XCAFDoc_GraphNode & F);
		%feature("compactdefaultargs") NbFathers;
		%feature("autodoc", "	* return Number of Fathers GraphNodes.

	:rtype: int
") NbFathers;
		Standard_Integer NbFathers ();
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "	* return Number of Childrens GraphNodes. Implementation of Attribute methods: ===================================

	:rtype: int
") NbChildren;
		Standard_Integer NbChildren ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the Graph ID (default or explicit one depending onthe Set method used).

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: void
") Restore;
		virtual void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
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
        		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "	:rtype: void
") BeforeForget;
		virtual void BeforeForget ();
};


%extend XCAFDoc_GraphNode {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_GraphNode(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_GraphNode::Handle_XCAFDoc_GraphNode %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_GraphNode;
class Handle_XCAFDoc_GraphNode : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_GraphNode();
        Handle_XCAFDoc_GraphNode(const Handle_XCAFDoc_GraphNode &aHandle);
        Handle_XCAFDoc_GraphNode(const XCAFDoc_GraphNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_GraphNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_GraphNode {
    XCAFDoc_GraphNode* _get_reference() {
    return (XCAFDoc_GraphNode*)$self->Access();
    }
};

%extend Handle_XCAFDoc_GraphNode {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_GraphNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_GraphNodeSequence;
class XCAFDoc_GraphNodeSequence : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") XCAFDoc_GraphNodeSequence;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_GraphNodeSequence;
		 XCAFDoc_GraphNodeSequence ();
		%feature("compactdefaultargs") XCAFDoc_GraphNodeSequence;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFDoc_GraphNodeSequence &
	:rtype: None
") XCAFDoc_GraphNodeSequence;
		 XCAFDoc_GraphNodeSequence (const XCAFDoc_GraphNodeSequence & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFDoc_GraphNodeSequence &
	:rtype: XCAFDoc_GraphNodeSequence
") Assign;
		const XCAFDoc_GraphNodeSequence & Assign (const XCAFDoc_GraphNodeSequence & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFDoc_GraphNodeSequence &
	:rtype: XCAFDoc_GraphNodeSequence
") operator =;
		const XCAFDoc_GraphNodeSequence & operator = (const XCAFDoc_GraphNodeSequence & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_XCAFDoc_GraphNode &
	:rtype: None
") Append;
		void Append (const Handle_XCAFDoc_GraphNode & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: XCAFDoc_GraphNodeSequence &
	:rtype: None
") Append;
		void Append (XCAFDoc_GraphNodeSequence & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_XCAFDoc_GraphNode &
	:rtype: None
") Prepend;
		void Prepend (const Handle_XCAFDoc_GraphNode & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: XCAFDoc_GraphNodeSequence &
	:rtype: None
") Prepend;
		void Prepend (XCAFDoc_GraphNodeSequence & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_XCAFDoc_GraphNode &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_XCAFDoc_GraphNode & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: XCAFDoc_GraphNodeSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,XCAFDoc_GraphNodeSequence & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_XCAFDoc_GraphNode &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_XCAFDoc_GraphNode & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: XCAFDoc_GraphNodeSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,XCAFDoc_GraphNodeSequence & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_XCAFDoc_GraphNode
") First;
		Handle_XCAFDoc_GraphNode First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_XCAFDoc_GraphNode
") Last;
		Handle_XCAFDoc_GraphNode Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: XCAFDoc_GraphNodeSequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,XCAFDoc_GraphNodeSequence & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_XCAFDoc_GraphNode
") Value;
		Handle_XCAFDoc_GraphNode Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_XCAFDoc_GraphNode &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_XCAFDoc_GraphNode & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_XCAFDoc_GraphNode
") ChangeValue;
		Handle_XCAFDoc_GraphNode ChangeValue (const Standard_Integer Index);
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


%extend XCAFDoc_GraphNodeSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_LayerTool;
class XCAFDoc_LayerTool : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_LayerTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_LayerTool;
		 XCAFDoc_LayerTool ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Creates (if not exist) LayerTool.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_XCAFDoc_LayerTool
") Set;
		static Handle_XCAFDoc_LayerTool Set (const TDF_Label & L);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "	* returns the label under which Layers are stored

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel ();
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "	* Returns internal XCAFDoc_ShapeTool tool

	:rtype: Handle_XCAFDoc_ShapeTool
") ShapeTool;
		Handle_XCAFDoc_ShapeTool ShapeTool ();
		%feature("compactdefaultargs") IsLayer;
		%feature("autodoc", "	* Returns True if label belongs to a Layertable and is a Layer definition

	:param lab:
	:type lab: TDF_Label &
	:rtype: bool
") IsLayer;
		Standard_Boolean IsLayer (const TDF_Label & lab);
		%feature("compactdefaultargs") GetLayer;
		%feature("autodoc", "	* Returns Layer defined by label lab Returns False if the label is not in Layertable or does not define a Layer

	:param lab:
	:type lab: TDF_Label &
	:param aLayer:
	:type aLayer: TCollection_ExtendedString &
	:rtype: bool
") GetLayer;
		Standard_Boolean GetLayer (const TDF_Label & lab,TCollection_ExtendedString & aLayer);
		%feature("compactdefaultargs") FindLayer;
		%feature("autodoc", "	* Finds a Layer definition in a Layertable and returns its label if found Returns False if Layer is not found in Layertable

	:param aLayer:
	:type aLayer: TCollection_ExtendedString &
	:param lab:
	:type lab: TDF_Label &
	:rtype: bool
") FindLayer;
		Standard_Boolean FindLayer (const TCollection_ExtendedString & aLayer,TDF_Label & lab);
		%feature("compactdefaultargs") FindLayer;
		%feature("autodoc", "	* Finds a Layer definition in a Layertable and returns its label if found (or Null label else)

	:param aLayer:
	:type aLayer: TCollection_ExtendedString &
	:rtype: TDF_Label
") FindLayer;
		TDF_Label FindLayer (const TCollection_ExtendedString & aLayer);
		%feature("compactdefaultargs") AddLayer;
		%feature("autodoc", "	* Adds a Layer definition to a Layertable and returns its label (returns existing label if the same Layer is already defined)

	:param aLayer:
	:type aLayer: TCollection_ExtendedString &
	:rtype: TDF_Label
") AddLayer;
		TDF_Label AddLayer (const TCollection_ExtendedString & aLayer);
		%feature("compactdefaultargs") RemoveLayer;
		%feature("autodoc", "	* Removes Layer from the Layertable

	:param lab:
	:type lab: TDF_Label &
	:rtype: None
") RemoveLayer;
		void RemoveLayer (const TDF_Label & lab);
		%feature("compactdefaultargs") GetLayerLabels;
		%feature("autodoc", "	* Returns a sequence of Layers currently stored in the Layertable

	:param Labels:
	:type Labels: TDF_LabelSequence &
	:rtype: None
") GetLayerLabels;
		void GetLayerLabels (TDF_LabelSequence & Labels);
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "	* Sets a link from label <L> to Layer defined by <LayerL> optional parametr <shapeInOneLayer> show could shape be in number of layers or only in one.

	:param L:
	:type L: TDF_Label &
	:param LayerL:
	:type LayerL: TDF_Label &
	:param shapeInOneLayer: default value is Standard_False
	:type shapeInOneLayer: bool
	:rtype: None
") SetLayer;
		void SetLayer (const TDF_Label & L,const TDF_Label & LayerL,const Standard_Boolean shapeInOneLayer = Standard_False);
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "	* Sets a link from label <L> to Layer <aLayer> in the Layertable Adds a Layer as necessary optional parametr <shapeInOneLayer> show could shape be in number of layers or only in one.

	:param L:
	:type L: TDF_Label &
	:param aLayer:
	:type aLayer: TCollection_ExtendedString &
	:param shapeInOneLayer: default value is Standard_False
	:type shapeInOneLayer: bool
	:rtype: None
") SetLayer;
		void SetLayer (const TDF_Label & L,const TCollection_ExtendedString & aLayer,const Standard_Boolean shapeInOneLayer = Standard_False);
		%feature("compactdefaultargs") UnSetLayers;
		%feature("autodoc", "	* Removes a link from label <L> to all layers

	:param L:
	:type L: TDF_Label &
	:rtype: None
") UnSetLayers;
		void UnSetLayers (const TDF_Label & L);
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "	* Remove link from label <L> and Layer <aLayer>. returns False if no such layer.

	:param L:
	:type L: TDF_Label &
	:param aLayer:
	:type aLayer: TCollection_ExtendedString &
	:rtype: bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer (const TDF_Label & L,const TCollection_ExtendedString & aLayer);
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "	* Remove link from label <L> and Layer <aLayerL>. returns False if <aLayerL> is not a layer label.

	:param L:
	:type L: TDF_Label &
	:param aLayerL:
	:type aLayerL: TDF_Label &
	:rtype: bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer (const TDF_Label & L,const TDF_Label & aLayerL);
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "	* Returns True if label <L> has a Layer assosiated with the <aLayer>.

	:param L:
	:type L: TDF_Label &
	:param aLayer:
	:type aLayer: TCollection_ExtendedString &
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet (const TDF_Label & L,const TCollection_ExtendedString & aLayer);
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "	* Returns True if label <L> has a Layer assosiated with the <aLayerL> label.

	:param L:
	:type L: TDF_Label &
	:param aLayerL:
	:type aLayerL: TDF_Label &
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet (const TDF_Label & L,const TDF_Label & aLayerL);
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "	* Return sequence of strings <aLayerS> that assosiated with label <L>.

	:param L:
	:type L: TDF_Label &
	:param aLayerS:
	:type aLayerS: Handle_TColStd_HSequenceOfExtendedString &
	:rtype: bool
") GetLayers;
		Standard_Boolean GetLayers (const TDF_Label & L,Handle_TColStd_HSequenceOfExtendedString & aLayerS);
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "	* Return sequence of labels <aLayerSL> that assosiated with label <L>.

	:param L:
	:type L: TDF_Label &
	:param aLayerLS:
	:type aLayerLS: TDF_LabelSequence &
	:rtype: bool
") GetLayers;
		Standard_Boolean GetLayers (const TDF_Label & L,TDF_LabelSequence & aLayerLS);
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "	* Return sequence of strings that assosiated with label <L>.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_TColStd_HSequenceOfExtendedString
") GetLayers;
		Handle_TColStd_HSequenceOfExtendedString GetLayers (const TDF_Label & L);
		%feature("compactdefaultargs") GetShapesOfLayer;
		%feature("autodoc", "	* Return sequanese of shape labels that assigned with layers to <ShLabels>.

	:param layerL:
	:type layerL: TDF_Label &
	:param ShLabels:
	:type ShLabels: TDF_LabelSequence &
	:rtype: None
") GetShapesOfLayer;
		void GetShapesOfLayer (const TDF_Label & layerL,TDF_LabelSequence & ShLabels);
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "	* Return True if layer is visible, False if invisible.

	:param layerL:
	:type layerL: TDF_Label &
	:rtype: bool
") IsVisible;
		Standard_Boolean IsVisible (const TDF_Label & layerL);
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "	* Set the visibility of layer. If layer is invisible when on it's layer will set UAttribute with corresponding GUID.

	:param layerL:
	:type layerL: TDF_Label &
	:param isvisible: default value is Standard_True
	:type isvisible: bool
	:rtype: None
") SetVisibility;
		void SetVisibility (const TDF_Label & layerL,const Standard_Boolean isvisible = Standard_True);
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "	* Sets a link from label that containig shape <Sh> with layer that situated at label <LayerL>. optional parametr <shapeInOneLayer> show could shape be in number of layers or only in one. return False if no such shape <Sh> or label <LayerL>

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param LayerL:
	:type LayerL: TDF_Label &
	:param shapeInOneLayer: default value is Standard_False
	:type shapeInOneLayer: bool
	:rtype: bool
") SetLayer;
		Standard_Boolean SetLayer (const TopoDS_Shape & Sh,const TDF_Label & LayerL,const Standard_Boolean shapeInOneLayer = Standard_False);
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "	* Sets a link from label that containig shape <Sh> with layer <aLayer>. Add <aLayer> to LayerTable if nessesery. optional parametr <shapeInOneLayer> show could shape be in number of layers or only in one. return False if no such shape <Sh>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param aLayer:
	:type aLayer: TCollection_ExtendedString &
	:param shapeInOneLayer: default value is Standard_False
	:type shapeInOneLayer: bool
	:rtype: bool
") SetLayer;
		Standard_Boolean SetLayer (const TopoDS_Shape & Sh,const TCollection_ExtendedString & aLayer,const Standard_Boolean shapeInOneLayer = Standard_False);
		%feature("compactdefaultargs") UnSetLayers;
		%feature("autodoc", "	* Remove link between shape <Sh> and all Layers at LayerTable. return False if no such shape <Sh> in XCAF Document.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:rtype: bool
") UnSetLayers;
		Standard_Boolean UnSetLayers (const TopoDS_Shape & Sh);
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "	* Remove link between shape <Sh> and layer <aLayer>. returns False if no such layer <aLayer> or shape <Sh>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param aLayer:
	:type aLayer: TCollection_ExtendedString &
	:rtype: bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer (const TopoDS_Shape & Sh,const TCollection_ExtendedString & aLayer);
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "	* Remove link between shape <Sh> and layer <aLayerL>. returns False if no such layer <aLayerL> or shape <Sh>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param aLayerL:
	:type aLayerL: TDF_Label &
	:rtype: bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer (const TopoDS_Shape & Sh,const TDF_Label & aLayerL);
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "	* Returns True if shape <Sh> has a Layer assosiated with the <aLayer>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param aLayer:
	:type aLayer: TCollection_ExtendedString &
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet (const TopoDS_Shape & Sh,const TCollection_ExtendedString & aLayer);
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "	* Returns True if shape <Sh> has a Layer assosiated with the <aLayerL>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param aLayerL:
	:type aLayerL: TDF_Label &
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet (const TopoDS_Shape & Sh,const TDF_Label & aLayerL);
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "	* Return sequence of strings <aLayerS> that assosiated with shape <Sh>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param aLayerS:
	:type aLayerS: Handle_TColStd_HSequenceOfExtendedString &
	:rtype: bool
") GetLayers;
		Standard_Boolean GetLayers (const TopoDS_Shape & Sh,Handle_TColStd_HSequenceOfExtendedString & aLayerS);
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "	* Return sequence of labels <aLayerLS> that assosiated with shape <Sh>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param aLayerLS:
	:type aLayerLS: TDF_LabelSequence &
	:rtype: bool
") GetLayers;
		Standard_Boolean GetLayers (const TopoDS_Shape & Sh,TDF_LabelSequence & aLayerLS);
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "	* Return sequence of strings that assosiated with shape <Sh>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:rtype: Handle_TColStd_HSequenceOfExtendedString
") GetLayers;
		Handle_TColStd_HSequenceOfExtendedString GetLayers (const TopoDS_Shape & Sh);
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
};


%extend XCAFDoc_LayerTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_LayerTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_LayerTool::Handle_XCAFDoc_LayerTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_LayerTool;
class Handle_XCAFDoc_LayerTool : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_LayerTool();
        Handle_XCAFDoc_LayerTool(const Handle_XCAFDoc_LayerTool &aHandle);
        Handle_XCAFDoc_LayerTool(const XCAFDoc_LayerTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_LayerTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_LayerTool {
    XCAFDoc_LayerTool* _get_reference() {
    return (XCAFDoc_LayerTool*)$self->Access();
    }
};

%extend Handle_XCAFDoc_LayerTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_LayerTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_Location;
class XCAFDoc_Location : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_Location;
		%feature("autodoc", "	* class methods =============

	:rtype: None
") XCAFDoc_Location;
		 XCAFDoc_Location ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, a Location attribute and set it's value the Location attribute is returned. Location methods ===============

	:param label:
	:type label: TDF_Label &
	:param Loc:
	:type Loc: TopLoc_Location &
	:rtype: Handle_XCAFDoc_Location
") Set;
		static Handle_XCAFDoc_Location Set (const TDF_Label & label,const TopLoc_Location & Loc);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Loc:
	:type Loc: TopLoc_Location &
	:rtype: None
") Set;
		void Set (const TopLoc_Location & Loc);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns True if there is a reference on the same label

	:rtype: TopLoc_Location
") Get;
		const TopLoc_Location & Get ();
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
};


%extend XCAFDoc_Location {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_Location(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_Location::Handle_XCAFDoc_Location %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_Location;
class Handle_XCAFDoc_Location : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_Location();
        Handle_XCAFDoc_Location(const Handle_XCAFDoc_Location &aHandle);
        Handle_XCAFDoc_Location(const XCAFDoc_Location *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_Location DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_Location {
    XCAFDoc_Location* _get_reference() {
    return (XCAFDoc_Location*)$self->Access();
    }
};

%extend Handle_XCAFDoc_Location {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_Location {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_Material;
class XCAFDoc_Material : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_Material;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_Material;
		 XCAFDoc_Material ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aDensity:
	:type aDensity: float
	:param aDensName:
	:type aDensName: Handle_TCollection_HAsciiString &
	:param aDensValType:
	:type aDensValType: Handle_TCollection_HAsciiString &
	:rtype: Handle_XCAFDoc_Material
") Set;
		static Handle_XCAFDoc_Material Set (const TDF_Label & label,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Standard_Real aDensity,const Handle_TCollection_HAsciiString & aDensName,const Handle_TCollection_HAsciiString & aDensValType);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aDensity:
	:type aDensity: float
	:param aDensName:
	:type aDensName: Handle_TCollection_HAsciiString &
	:param aDensValType:
	:type aDensValType: Handle_TCollection_HAsciiString &
	:rtype: None
") Set;
		void Set (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Standard_Real aDensity,const Handle_TCollection_HAsciiString & aDensName,const Handle_TCollection_HAsciiString & aDensValType);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetName;
		Handle_TCollection_HAsciiString GetName ();
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetDescription;
		Handle_TCollection_HAsciiString GetDescription ();
		%feature("compactdefaultargs") GetDensity;
		%feature("autodoc", "	:rtype: float
") GetDensity;
		Standard_Real GetDensity ();
		%feature("compactdefaultargs") GetDensName;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetDensName;
		Handle_TCollection_HAsciiString GetDensName ();
		%feature("compactdefaultargs") GetDensValType;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetDensValType;
		Handle_TCollection_HAsciiString GetDensValType ();
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
};


%extend XCAFDoc_Material {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_Material(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_Material::Handle_XCAFDoc_Material %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_Material;
class Handle_XCAFDoc_Material : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_Material();
        Handle_XCAFDoc_Material(const Handle_XCAFDoc_Material &aHandle);
        Handle_XCAFDoc_Material(const XCAFDoc_Material *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_Material DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_Material {
    XCAFDoc_Material* _get_reference() {
    return (XCAFDoc_Material*)$self->Access();
    }
};

%extend Handle_XCAFDoc_Material {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_MaterialTool;
class XCAFDoc_MaterialTool : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_MaterialTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_MaterialTool;
		 XCAFDoc_MaterialTool ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Creates (if not exist) MaterialTool.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_XCAFDoc_MaterialTool
") Set;
		static Handle_XCAFDoc_MaterialTool Set (const TDF_Label & L);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "	* returns the label under which colors are stored

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel ();
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "	* Returns internal XCAFDoc_ShapeTool tool

	:rtype: Handle_XCAFDoc_ShapeTool
") ShapeTool;
		Handle_XCAFDoc_ShapeTool ShapeTool ();
		%feature("compactdefaultargs") IsMaterial;
		%feature("autodoc", "	* Returns True if label belongs to a material table and is a Material definition

	:param lab:
	:type lab: TDF_Label &
	:rtype: bool
") IsMaterial;
		Standard_Boolean IsMaterial (const TDF_Label & lab);
		%feature("compactdefaultargs") GetMaterialLabels;
		%feature("autodoc", "	* Returns a sequence of materials currently stored in the material table

	:param Labels:
	:type Labels: TDF_LabelSequence &
	:rtype: None
") GetMaterialLabels;
		void GetMaterialLabels (TDF_LabelSequence & Labels);
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "	* Adds a Material definition to a table and returns its label

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aDensity:
	:type aDensity: float
	:param aDensName:
	:type aDensName: Handle_TCollection_HAsciiString &
	:param aDensValType:
	:type aDensValType: Handle_TCollection_HAsciiString &
	:rtype: TDF_Label
") AddMaterial;
		TDF_Label AddMaterial (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Standard_Real aDensity,const Handle_TCollection_HAsciiString & aDensName,const Handle_TCollection_HAsciiString & aDensValType);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets a link with GUID

	:param L:
	:type L: TDF_Label &
	:param MatL:
	:type MatL: TDF_Label &
	:rtype: None
") SetMaterial;
		void SetMaterial (const TDF_Label & L,const TDF_Label & MatL);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets a link with GUID Adds a Material as necessary

	:param L:
	:type L: TDF_Label &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aDensity:
	:type aDensity: float
	:param aDensName:
	:type aDensName: Handle_TCollection_HAsciiString &
	:param aDensValType:
	:type aDensValType: Handle_TCollection_HAsciiString &
	:rtype: None
") SetMaterial;
		void SetMaterial (const TDF_Label & L,const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Standard_Real aDensity,const Handle_TCollection_HAsciiString & aDensName,const Handle_TCollection_HAsciiString & aDensValType);
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "	* Returns Material assigned to <MatL> Returns False if no such Material is assigned

	:param MatL:
	:type MatL: TDF_Label &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aDensity:
	:type aDensity: float &
	:param aDensName:
	:type aDensName: Handle_TCollection_HAsciiString &
	:param aDensValType:
	:type aDensValType: Handle_TCollection_HAsciiString &
	:rtype: bool
") GetMaterial;
		Standard_Boolean GetMaterial (const TDF_Label & MatL,Handle_TCollection_HAsciiString & aName,Handle_TCollection_HAsciiString & aDescription,Standard_Real &OutValue,Handle_TCollection_HAsciiString & aDensName,Handle_TCollection_HAsciiString & aDensValType);
		%feature("compactdefaultargs") GetDensityForShape;
		%feature("autodoc", "	* Find referred material and return density from it if no material --> return 0

	:param ShapeL:
	:type ShapeL: TDF_Label &
	:rtype: float
") GetDensityForShape;
		static Standard_Real GetDensityForShape (const TDF_Label & ShapeL);
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
};


%extend XCAFDoc_MaterialTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_MaterialTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_MaterialTool::Handle_XCAFDoc_MaterialTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_MaterialTool;
class Handle_XCAFDoc_MaterialTool : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_MaterialTool();
        Handle_XCAFDoc_MaterialTool(const Handle_XCAFDoc_MaterialTool &aHandle);
        Handle_XCAFDoc_MaterialTool(const XCAFDoc_MaterialTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_MaterialTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_MaterialTool {
    XCAFDoc_MaterialTool* _get_reference() {
    return (XCAFDoc_MaterialTool*)$self->Access();
    }
};

%extend Handle_XCAFDoc_MaterialTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_MaterialTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_SequenceNodeOfGraphNodeSequence;
class XCAFDoc_SequenceNodeOfGraphNodeSequence : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") XCAFDoc_SequenceNodeOfGraphNodeSequence;
		%feature("autodoc", "	:param I:
	:type I: Handle_XCAFDoc_GraphNode &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") XCAFDoc_SequenceNodeOfGraphNodeSequence;
		 XCAFDoc_SequenceNodeOfGraphNodeSequence (const Handle_XCAFDoc_GraphNode & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_XCAFDoc_GraphNode
") Value;
		Handle_XCAFDoc_GraphNode Value ();
};


%extend XCAFDoc_SequenceNodeOfGraphNodeSequence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence::Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence;
class Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence();
        Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence(const Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence &aHandle);
        Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence(const XCAFDoc_SequenceNodeOfGraphNodeSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence {
    XCAFDoc_SequenceNodeOfGraphNodeSequence* _get_reference() {
    return (XCAFDoc_SequenceNodeOfGraphNodeSequence*)$self->Access();
    }
};

%extend Handle_XCAFDoc_SequenceNodeOfGraphNodeSequence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_SequenceNodeOfGraphNodeSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_ShapeMapTool;
class XCAFDoc_ShapeMapTool : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Create (if not exist) ShapeTool from XCAFDoc on <L>.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_XCAFDoc_ShapeMapTool
") Set;
		static Handle_XCAFDoc_ShapeMapTool Set (const TDF_Label & L);
		%feature("compactdefaultargs") XCAFDoc_ShapeMapTool;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") XCAFDoc_ShapeMapTool;
		 XCAFDoc_ShapeMapTool ();
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "	* Checks whether shape <sub> is subshape of shape stored on label shapeL

	:param sub:
	:type sub: TopoDS_Shape &
	:rtype: bool
") IsSubShape;
		Standard_Boolean IsSubShape (const TopoDS_Shape & sub);
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* Sets representation (TopoDS_Shape) for top-level shape

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") SetShape;
		void SetShape (const TopoDS_Shape & S);
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
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfShape
") GetMap;
		const TopTools_IndexedMapOfShape & GetMap ();
};


%extend XCAFDoc_ShapeMapTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_ShapeMapTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_ShapeMapTool::Handle_XCAFDoc_ShapeMapTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_ShapeMapTool;
class Handle_XCAFDoc_ShapeMapTool : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_ShapeMapTool();
        Handle_XCAFDoc_ShapeMapTool(const Handle_XCAFDoc_ShapeMapTool &aHandle);
        Handle_XCAFDoc_ShapeMapTool(const XCAFDoc_ShapeMapTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_ShapeMapTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_ShapeMapTool {
    XCAFDoc_ShapeMapTool* _get_reference() {
    return (XCAFDoc_ShapeMapTool*)$self->Access();
    }
};

%extend Handle_XCAFDoc_ShapeMapTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_ShapeMapTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_ShapeTool;
class XCAFDoc_ShapeTool : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Create (if not exist) ShapeTool from XCAFDoc on <L>.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_XCAFDoc_ShapeTool
") Set;
		static Handle_XCAFDoc_ShapeTool Set (const TDF_Label & L);
		%feature("compactdefaultargs") XCAFDoc_ShapeTool;
		%feature("autodoc", "	* Creates an empty tool Creates a tool to work with a document <Doc> Attaches to label XCAFDoc::LabelShapes()

	:rtype: None
") XCAFDoc_ShapeTool;
		 XCAFDoc_ShapeTool ();
		%feature("compactdefaultargs") IsTopLevel;
		%feature("autodoc", "	* Returns True if the label is a label of top-level shape, as opposed to component of assembly or subshape

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsTopLevel;
		Standard_Boolean IsTopLevel (const TDF_Label & L);
		%feature("compactdefaultargs") IsFree;
		%feature("autodoc", "	* Returns True if the label is not used by any assembly, i.e. contains sublabels which are assembly components This is relevant only if IsShape() is True (There is no Father TreeNode on this <L>)

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsFree;
		static Standard_Boolean IsFree (const TDF_Label & L);
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "	* Returns True if the label represents a shape (simple shape, assembly or reference)

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsShape;
		static Standard_Boolean IsShape (const TDF_Label & L);
		%feature("compactdefaultargs") IsSimpleShape;
		%feature("autodoc", "	* Returns True if the label is a label of simple shape

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsSimpleShape;
		static Standard_Boolean IsSimpleShape (const TDF_Label & L);
		%feature("compactdefaultargs") IsReference;
		%feature("autodoc", "	* Return true if <L> is a located instance of other shape i.e. reference

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsReference;
		static Standard_Boolean IsReference (const TDF_Label & L);
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "	* Returns True if the label is a label of assembly, i.e. contains sublabels which are assembly components This is relevant only if IsShape() is True

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsAssembly;
		static Standard_Boolean IsAssembly (const TDF_Label & L);
		%feature("compactdefaultargs") IsComponent;
		%feature("autodoc", "	* Return true if <L> is reference serving as component of assembly

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsComponent;
		static Standard_Boolean IsComponent (const TDF_Label & L);
		%feature("compactdefaultargs") IsCompound;
		%feature("autodoc", "	* Returns True if the label is a label of compound, i.e. contains some sublabels This is relevant only if IsShape() is True

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsCompound;
		static Standard_Boolean IsCompound (const TDF_Label & L);
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "	* Return true if <L> is subshape of the top-level shape

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsSubShape;
		static Standard_Boolean IsSubShape (const TDF_Label & L);
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "	* Checks whether shape <sub> is subshape of shape stored on label shapeL

	:param shapeL:
	:type shapeL: TDF_Label &
	:param sub:
	:type sub: TopoDS_Shape &
	:rtype: bool
") IsSubShape;
		Standard_Boolean IsSubShape (const TDF_Label & shapeL,const TopoDS_Shape & sub);
		%feature("compactdefaultargs") SearchUsingMap;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param L:
	:type L: TDF_Label &
	:param findWithoutLoc:
	:type findWithoutLoc: bool
	:param findSubshape:
	:type findSubshape: bool
	:rtype: bool
") SearchUsingMap;
		Standard_Boolean SearchUsingMap (const TopoDS_Shape & S,TDF_Label & L,const Standard_Boolean findWithoutLoc,const Standard_Boolean findSubshape);
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "	* General tool to find a (sub) shape in the document * If findInstance is True, and S has a non-null location, first tries to find the shape among the top-level shapes with this location * If not found, and findComponent is True, tries to find the shape among the components of assemblies * If not found, tries to find the shape without location among top-level shapes * If not found and findSubshape is True, tries to find a shape as a subshape of top-level simple shapes Returns False if nothing is found

	:param S:
	:type S: TopoDS_Shape &
	:param L:
	:type L: TDF_Label &
	:param findInstance: default value is Standard_True
	:type findInstance: bool
	:param findComponent: default value is Standard_True
	:type findComponent: bool
	:param findSubshape: default value is Standard_True
	:type findSubshape: bool
	:rtype: bool
") Search;
		Standard_Boolean Search (const TopoDS_Shape & S,TDF_Label & L,const Standard_Boolean findInstance = Standard_True,const Standard_Boolean findComponent = Standard_True,const Standard_Boolean findSubshape = Standard_True);
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "	* Returns the label corresponding to shape S (searches among top-level shapes, not including subcomponents of assemblies) If findInstance is False (default), searches for the non-located shape (i.e. among original shapes) If findInstance is True, searches for the shape with the same location, including shape instances Return True if <S> is found.

	:param S:
	:type S: TopoDS_Shape &
	:param L:
	:type L: TDF_Label &
	:param findInstance: default value is Standard_False
	:type findInstance: bool
	:rtype: bool
") FindShape;
		Standard_Boolean FindShape (const TopoDS_Shape & S,TDF_Label & L,const Standard_Boolean findInstance = Standard_False);
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "	* Does the same as previous method Returns Null label if not found

	:param S:
	:type S: TopoDS_Shape &
	:param findInstance: default value is Standard_False
	:type findInstance: bool
	:rtype: TDF_Label
") FindShape;
		TDF_Label FindShape (const TopoDS_Shape & S,const Standard_Boolean findInstance = Standard_False);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	* To get TopoDS_Shape from shape's label For component, returns new shape with correct location Returns False if label does not contain shape

	:param L:
	:type L: TDF_Label &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") GetShape;
		static Standard_Boolean GetShape (const TDF_Label & L,TopoDS_Shape & S);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	* To get TopoDS_Shape from shape's label For component, returns new shape with correct location Returns Null shape if label does not contain shape

	:param L:
	:type L: TDF_Label &
	:rtype: TopoDS_Shape
") GetShape;
		static TopoDS_Shape GetShape (const TDF_Label & L);
		%feature("compactdefaultargs") NewShape;
		%feature("autodoc", "	* Creates new (empty) top-level shape. Initially it holds empty TopoDS_Compound

	:rtype: TDF_Label
") NewShape;
		TDF_Label NewShape ();
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* Sets representation (TopoDS_Shape) for top-level shape

	:param L:
	:type L: TDF_Label &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") SetShape;
		void SetShape (const TDF_Label & L,const TopoDS_Shape & S);
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	* Adds a new top-level (creates and returns a new label) If makeAssembly is True, treats TopAbs_COMPOUND shapes as assemblies (creates assembly structure). NOTE: <makePrepare> replace components without location in assmebly by located components to avoid some problems. If AutoNaming() is True then automatically attaches names.

	:param S:
	:type S: TopoDS_Shape &
	:param makeAssembly: default value is Standard_True
	:type makeAssembly: bool
	:param makePrepare: default value is Standard_True
	:type makePrepare: bool
	:rtype: TDF_Label
") AddShape;
		TDF_Label AddShape (const TopoDS_Shape & S,const Standard_Boolean makeAssembly = Standard_True,const Standard_Boolean makePrepare = Standard_True);
		%feature("compactdefaultargs") RemoveShape;
		%feature("autodoc", "	* Removes shape (whole label and all its sublabels) If removeCompletely is true, removes complete shape If removeCompletely is false, removes instance(location) only Returns False (and does nothing) if shape is not free or is not top-level shape

	:param L:
	:type L: TDF_Label &
	:param removeCompletely: default value is Standard_True
	:type removeCompletely: bool
	:rtype: bool
") RemoveShape;
		Standard_Boolean RemoveShape (const TDF_Label & L,const Standard_Boolean removeCompletely = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* set hasComponents into false

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") SetAutoNaming;
		%feature("autodoc", "	* Sets auto-naming mode to <V>. If True then for added shapes, links, assemblies and SHUO's, the TDataStd_Name attribute is automatically added. For shapes it contains a shape type (e.g. 'SOLID', 'SHELL', etc); for links it has a form '=>[0:1:1:2]' (where a tag is a label containing a shape without a location); for assemblies it is 'ASSEMBLY', and 'SHUO' for SHUO's. This setting is global; it cannot be made a member function as it is used by static methods as well. By default, auto-naming is enabled. See also AutoNaming().

	:param V:
	:type V: bool
	:rtype: void
") SetAutoNaming;
		static void SetAutoNaming (const Standard_Boolean V);
		%feature("compactdefaultargs") AutoNaming;
		%feature("autodoc", "	* Returns current auto-naming mode. See SetAutoNaming() for description.

	:rtype: bool
") AutoNaming;
		static Standard_Boolean AutoNaming ();
		%feature("compactdefaultargs") ComputeShapes;
		%feature("autodoc", "	* recursive

	:param L:
	:type L: TDF_Label &
	:rtype: None
") ComputeShapes;
		void ComputeShapes (const TDF_Label & L);
		%feature("compactdefaultargs") ComputeSimpleShapes;
		%feature("autodoc", "	* Compute a sequence of simple shapes

	:rtype: None
") ComputeSimpleShapes;
		void ComputeSimpleShapes ();
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "	* Returns a sequence of all top-level shapes

	:param Labels:
	:type Labels: TDF_LabelSequence &
	:rtype: None
") GetShapes;
		void GetShapes (TDF_LabelSequence & Labels);
		%feature("compactdefaultargs") GetFreeShapes;
		%feature("autodoc", "	* Returns a sequence of all top-level shapes which are free (i.e. not referred by any other)

	:param FreeLabels:
	:type FreeLabels: TDF_LabelSequence &
	:rtype: None
") GetFreeShapes;
		void GetFreeShapes (TDF_LabelSequence & FreeLabels);
		%feature("compactdefaultargs") GetUsers;
		%feature("autodoc", "	* Returns list of labels which refer shape L as component Returns number of users (0 if shape is free)

	:param L:
	:type L: TDF_Label &
	:param Labels:
	:type Labels: TDF_LabelSequence &
	:param getsubchilds: default value is Standard_False
	:type getsubchilds: bool
	:rtype: int
") GetUsers;
		static Standard_Integer GetUsers (const TDF_Label & L,TDF_LabelSequence & Labels,const Standard_Boolean getsubchilds = Standard_False);
		%feature("compactdefaultargs") GetLocation;
		%feature("autodoc", "	* Returns location of instance

	:param L:
	:type L: TDF_Label &
	:rtype: TopLoc_Location
") GetLocation;
		static TopLoc_Location GetLocation (const TDF_Label & L);
		%feature("compactdefaultargs") GetReferredShape;
		%feature("autodoc", "	* Returns label which corresponds to a shape referred by L Returns False if label is not reference

	:param L:
	:type L: TDF_Label &
	:param Label:
	:type Label: TDF_Label &
	:rtype: bool
") GetReferredShape;
		static Standard_Boolean GetReferredShape (const TDF_Label & L,TDF_Label & Label);
		%feature("compactdefaultargs") NbComponents;
		%feature("autodoc", "	* Returns number of Assembles components

	:param L:
	:type L: TDF_Label &
	:param getsubchilds: default value is Standard_False
	:type getsubchilds: bool
	:rtype: int
") NbComponents;
		static Standard_Integer NbComponents (const TDF_Label & L,const Standard_Boolean getsubchilds = Standard_False);
		%feature("compactdefaultargs") GetComponents;
		%feature("autodoc", "	* Returns list of components of assembly Returns False if label is not assembly

	:param L:
	:type L: TDF_Label &
	:param Labels:
	:type Labels: TDF_LabelSequence &
	:param getsubchilds: default value is Standard_False
	:type getsubchilds: bool
	:rtype: bool
") GetComponents;
		static Standard_Boolean GetComponents (const TDF_Label & L,TDF_LabelSequence & Labels,const Standard_Boolean getsubchilds = Standard_False);
		%feature("compactdefaultargs") AddComponent;
		%feature("autodoc", "	* Adds a component given by its label and location to the assembly Note: assembly must be IsAssembly() or IsSimpleShape()

	:param assembly:
	:type assembly: TDF_Label &
	:param comp:
	:type comp: TDF_Label &
	:param Loc:
	:type Loc: TopLoc_Location &
	:rtype: TDF_Label
") AddComponent;
		TDF_Label AddComponent (const TDF_Label & assembly,const TDF_Label & comp,const TopLoc_Location & Loc);
		%feature("compactdefaultargs") AddComponent;
		%feature("autodoc", "	* Adds a shape (located) as a component to the assembly If necessary, creates an additional top-level shape for component and return the Label of component. If expand is True and component is Compound, it will be created as assembly also Note: assembly must be IsAssembly() or IsSimpleShape()

	:param assembly:
	:type assembly: TDF_Label &
	:param comp:
	:type comp: TopoDS_Shape &
	:param expand: default value is Standard_False
	:type expand: bool
	:rtype: TDF_Label
") AddComponent;
		TDF_Label AddComponent (const TDF_Label & assembly,const TopoDS_Shape & comp,const Standard_Boolean expand = Standard_False);
		%feature("compactdefaultargs") RemoveComponent;
		%feature("autodoc", "	* Removes a component from its assembly

	:param comp:
	:type comp: TDF_Label &
	:rtype: None
") RemoveComponent;
		void RemoveComponent (const TDF_Label & comp);
		%feature("compactdefaultargs") UpdateAssembly;
		%feature("autodoc", "	* Update an assembly at label <L>

	:param L:
	:type L: TDF_Label &
	:rtype: None
") UpdateAssembly;
		void UpdateAssembly (const TDF_Label & L);
		%feature("compactdefaultargs") FindSubShape;
		%feature("autodoc", "	* Finds a label for subshape <sub> of shape stored on label shapeL Returns Null label if it is not found

	:param shapeL:
	:type shapeL: TDF_Label &
	:param sub:
	:type sub: TopoDS_Shape &
	:param L:
	:type L: TDF_Label &
	:rtype: bool
") FindSubShape;
		Standard_Boolean FindSubShape (const TDF_Label & shapeL,const TopoDS_Shape & sub,TDF_Label & L);
		%feature("compactdefaultargs") AddSubShape;
		%feature("autodoc", "	* Adds a label for subshape <sub> of shape stored on label shapeL Returns Null label if it is not subshape

	:param shapeL:
	:type shapeL: TDF_Label &
	:param sub:
	:type sub: TopoDS_Shape &
	:rtype: TDF_Label
") AddSubShape;
		TDF_Label AddSubShape (const TDF_Label & shapeL,const TopoDS_Shape & sub);
		%feature("compactdefaultargs") FindMainShapeUsingMap;
		%feature("autodoc", "	:param sub:
	:type sub: TopoDS_Shape &
	:rtype: TDF_Label
") FindMainShapeUsingMap;
		TDF_Label FindMainShapeUsingMap (const TopoDS_Shape & sub);
		%feature("compactdefaultargs") FindMainShape;
		%feature("autodoc", "	* Performs a search among top-level shapes to find the shape containing <sub> as subshape Checks only simple shapes, and returns the first found label (which should be the only one for valid model)

	:param sub:
	:type sub: TopoDS_Shape &
	:rtype: TDF_Label
") FindMainShape;
		TDF_Label FindMainShape (const TopoDS_Shape & sub);
		%feature("compactdefaultargs") GetSubShapes;
		%feature("autodoc", "	* Returns list of labels identifying subshapes of the given shape Returns False if no subshapes are placed on that label

	:param L:
	:type L: TDF_Label &
	:param Labels:
	:type Labels: TDF_LabelSequence &
	:rtype: bool
") GetSubShapes;
		static Standard_Boolean GetSubShapes (const TDF_Label & L,TDF_LabelSequence & Labels);
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "	* returns the label under which shapes are stored

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param theDumpLog:
	:type theDumpLog: Standard_OStream &
	:param deep: default value is Standard_False
	:type deep: bool
	:rtype: None
") Dump;
		void Dump (Standard_OStream & theDumpLog,const Standard_Boolean deep = Standard_False);
		%feature("compactdefaultargs") DumpShape;
		%feature("autodoc", "	* Print to ostream <theDumpLog> type of shape found on <L> label and the entry of <L>, with <level> tabs before. If <deep>, print also TShape and Location addresses

	:param theDumpLog:
	:type theDumpLog: Standard_OStream &
	:param L:
	:type L: TDF_Label &
	:param level: default value is 0
	:type level: int
	:param deep: default value is Standard_False
	:type deep: bool
	:rtype: void
") DumpShape;
		static void DumpShape (Standard_OStream & theDumpLog,const TDF_Label & L,const Standard_Integer level = 0,const Standard_Boolean deep = Standard_False);
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
		%feature("compactdefaultargs") IsExternRef;
		%feature("autodoc", "	* Returns True if the label is a label of external references, i.e. there are some reference on the no-step files, which are described in document only their names

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsExternRef;
		static Standard_Boolean IsExternRef (const TDF_Label & L);
		%feature("compactdefaultargs") SetExternRefs;
		%feature("autodoc", "	* Sets the names of references on the no-step files

	:param SHAS:
	:type SHAS: TColStd_SequenceOfHAsciiString &
	:rtype: TDF_Label
") SetExternRefs;
		TDF_Label SetExternRefs (const TColStd_SequenceOfHAsciiString & SHAS);
		%feature("compactdefaultargs") SetExternRefs;
		%feature("autodoc", "	* Sets the names of references on the no-step files

	:param L:
	:type L: TDF_Label &
	:param SHAS:
	:type SHAS: TColStd_SequenceOfHAsciiString &
	:rtype: None
") SetExternRefs;
		void SetExternRefs (const TDF_Label & L,const TColStd_SequenceOfHAsciiString & SHAS);
		%feature("compactdefaultargs") GetExternRefs;
		%feature("autodoc", "	* Gets the names of references on the no-step files

	:param L:
	:type L: TDF_Label &
	:param SHAS:
	:type SHAS: TColStd_SequenceOfHAsciiString &
	:rtype: void
") GetExternRefs;
		static void GetExternRefs (const TDF_Label & L,TColStd_SequenceOfHAsciiString & SHAS);
		%feature("compactdefaultargs") SetSHUO;
		%feature("autodoc", "	* Sets the SHUO structure between upper_usage and next_usage create multy-level (if number of labels > 2) SHUO from first to last Initialise out <MainSHUOAttr> by main upper_usage SHUO attribute. Returns False if some of labels in not component label

	:param Labels:
	:type Labels: TDF_LabelSequence &
	:param MainSHUOAttr:
	:type MainSHUOAttr: Handle_XCAFDoc_GraphNode &
	:rtype: bool
") SetSHUO;
		Standard_Boolean SetSHUO (const TDF_LabelSequence & Labels,Handle_XCAFDoc_GraphNode & MainSHUOAttr);
		%feature("compactdefaultargs") GetSHUO;
		%feature("autodoc", "	* Returns founded SHUO GraphNode attribute <aSHUOAttr> Returns false in other case

	:param SHUOLabel:
	:type SHUOLabel: TDF_Label &
	:param aSHUOAttr:
	:type aSHUOAttr: Handle_XCAFDoc_GraphNode &
	:rtype: bool
") GetSHUO;
		static Standard_Boolean GetSHUO (const TDF_Label & SHUOLabel,Handle_XCAFDoc_GraphNode & aSHUOAttr);
		%feature("compactdefaultargs") GetAllComponentSHUO;
		%feature("autodoc", "	* Returns founded SHUO GraphNodes of indicated component Returns false in other case

	:param CompLabel:
	:type CompLabel: TDF_Label &
	:param SHUOAttrs:
	:type SHUOAttrs: TDF_AttributeSequence &
	:rtype: bool
") GetAllComponentSHUO;
		static Standard_Boolean GetAllComponentSHUO (const TDF_Label & CompLabel,TDF_AttributeSequence & SHUOAttrs);
		%feature("compactdefaultargs") GetSHUOUpperUsage;
		%feature("autodoc", "	* Returns the sequence of labels of SHUO attributes, which is upper_usage for this next_usage SHUO attribute (that indicated by label) NOTE: returns upper_usages only on one level (not recurse) NOTE: do not clear the sequence before filling

	:param NextUsageL:
	:type NextUsageL: TDF_Label &
	:param Labels:
	:type Labels: TDF_LabelSequence &
	:rtype: bool
") GetSHUOUpperUsage;
		static Standard_Boolean GetSHUOUpperUsage (const TDF_Label & NextUsageL,TDF_LabelSequence & Labels);
		%feature("compactdefaultargs") GetSHUONextUsage;
		%feature("autodoc", "	* Returns the sequence of labels of SHUO attributes, which is next_usage for this upper_usage SHUO attribute (that indicated by label) NOTE: returns next_usages only on one level (not recurse) NOTE: do not clear the sequence before filling

	:param UpperUsageL:
	:type UpperUsageL: TDF_Label &
	:param Labels:
	:type Labels: TDF_LabelSequence &
	:rtype: bool
") GetSHUONextUsage;
		static Standard_Boolean GetSHUONextUsage (const TDF_Label & UpperUsageL,TDF_LabelSequence & Labels);
		%feature("compactdefaultargs") RemoveSHUO;
		%feature("autodoc", "	* Remove SHUO from component sublabel, remove all dependencies on other SHUO. Returns False if cannot remove SHUO dependencies. NOTE: remove any styles that associated with this SHUO.

	:param SHUOLabel:
	:type SHUOLabel: TDF_Label &
	:rtype: bool
") RemoveSHUO;
		Standard_Boolean RemoveSHUO (const TDF_Label & SHUOLabel);
		%feature("compactdefaultargs") FindComponent;
		%feature("autodoc", "	* Serach the path of labels in the document, that corresponds the component from any assembly Try to search the sequence of labels with location that produce this shape as component of any assembly NOTE: Clear sequence of labels before filling

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param Labels:
	:type Labels: TDF_LabelSequence &
	:rtype: bool
") FindComponent;
		Standard_Boolean FindComponent (const TopoDS_Shape & theShape,TDF_LabelSequence & Labels);
		%feature("compactdefaultargs") GetSHUOInstance;
		%feature("autodoc", "	* Search for the component shape that styled by shuo Returns null shape if no any shape is found.

	:param theSHUO:
	:type theSHUO: Handle_XCAFDoc_GraphNode &
	:rtype: TopoDS_Shape
") GetSHUOInstance;
		TopoDS_Shape GetSHUOInstance (const Handle_XCAFDoc_GraphNode & theSHUO);
		%feature("compactdefaultargs") SetInstanceSHUO;
		%feature("autodoc", "	* Search for the component shape by labelks path and set SHUO structure for founded label structure Returns null attribute if no component in any assembly found.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: Handle_XCAFDoc_GraphNode
") SetInstanceSHUO;
		Handle_XCAFDoc_GraphNode SetInstanceSHUO (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") GetAllSHUOInstances;
		%feature("autodoc", "	* Seaching for component shapes that styled by shuo Returns empty sequence of shape if no any shape is found.

	:param theSHUO:
	:type theSHUO: Handle_XCAFDoc_GraphNode &
	:param theSHUOShapeSeq:
	:type theSHUOShapeSeq: TopTools_SequenceOfShape &
	:rtype: bool
") GetAllSHUOInstances;
		Standard_Boolean GetAllSHUOInstances (const Handle_XCAFDoc_GraphNode & theSHUO,TopTools_SequenceOfShape & theSHUOShapeSeq);
		%feature("compactdefaultargs") FindSHUO;
		%feature("autodoc", "	* Searchs the SHUO by labels of components from upper_usage componet to next_usage Returns null attribute if no SHUO found

	:param Labels:
	:type Labels: TDF_LabelSequence &
	:param theSHUOAttr:
	:type theSHUOAttr: Handle_XCAFDoc_GraphNode &
	:rtype: bool
") FindSHUO;
		static Standard_Boolean FindSHUO (const TDF_LabelSequence & Labels,Handle_XCAFDoc_GraphNode & theSHUOAttr);
};


%extend XCAFDoc_ShapeTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_ShapeTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_ShapeTool::Handle_XCAFDoc_ShapeTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_ShapeTool;
class Handle_XCAFDoc_ShapeTool : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_ShapeTool();
        Handle_XCAFDoc_ShapeTool(const Handle_XCAFDoc_ShapeTool &aHandle);
        Handle_XCAFDoc_ShapeTool(const XCAFDoc_ShapeTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_ShapeTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_ShapeTool {
    XCAFDoc_ShapeTool* _get_reference() {
    return (XCAFDoc_ShapeTool*)$self->Access();
    }
};

%extend Handle_XCAFDoc_ShapeTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_ShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDoc_Volume;
class XCAFDoc_Volume : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") XCAFDoc_Volume;
		%feature("autodoc", "	* class methods =============

	:rtype: None
") XCAFDoc_Volume;
		 XCAFDoc_Volume ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets a value of volume

	:param vol:
	:type vol: float
	:rtype: None
") Set;
		void Set (const Standard_Real vol);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, an Volume attribute and set its value

	:param label:
	:type label: TDF_Label &
	:param vol:
	:type vol: float
	:rtype: Handle_XCAFDoc_Volume
") Set;
		static Handle_XCAFDoc_Volume Set (const TDF_Label & label,const Standard_Real vol);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: float
") Get;
		Standard_Real Get ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns volume as argument returns false if no such attribute at the <label>

	:param label:
	:type label: TDF_Label &
	:param vol:
	:type vol: float &
	:rtype: bool
") Get;
		static Standard_Boolean Get (const TDF_Label & label,Standard_Real &OutValue);
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


%extend XCAFDoc_Volume {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFDoc_Volume(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFDoc_Volume::Handle_XCAFDoc_Volume %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFDoc_Volume;
class Handle_XCAFDoc_Volume : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_XCAFDoc_Volume();
        Handle_XCAFDoc_Volume(const Handle_XCAFDoc_Volume &aHandle);
        Handle_XCAFDoc_Volume(const XCAFDoc_Volume *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFDoc_Volume DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFDoc_Volume {
    XCAFDoc_Volume* _get_reference() {
    return (XCAFDoc_Volume*)$self->Access();
    }
};

%extend Handle_XCAFDoc_Volume {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFDoc_Volume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
