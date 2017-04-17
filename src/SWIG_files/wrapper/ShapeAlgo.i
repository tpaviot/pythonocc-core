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
%module (package="OCC") ShapeAlgo

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


%include ShapeAlgo_headers.i


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
/* end public enums declaration */

%rename(shapealgo) ShapeAlgo;
class ShapeAlgo {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Provides initerface to the algorithms from Shape Healing. Creates and initializes default AlgoContainer.

	:rtype: void
") Init;
		static void Init ();
		%feature("compactdefaultargs") SetAlgoContainer;
		%feature("autodoc", "	* Sets default AlgoContainer

	:param aContainer:
	:type aContainer: Handle_ShapeAlgo_AlgoContainer &
	:rtype: void
") SetAlgoContainer;
		static void SetAlgoContainer (const Handle_ShapeAlgo_AlgoContainer & aContainer);
		%feature("compactdefaultargs") AlgoContainer;
		%feature("autodoc", "	* Returns default AlgoContainer

	:rtype: Handle_ShapeAlgo_AlgoContainer
") AlgoContainer;
		static Handle_ShapeAlgo_AlgoContainer AlgoContainer ();
};


%extend ShapeAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeAlgo_ToolContainer;
class ShapeAlgo_ToolContainer : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeAlgo_ToolContainer;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") ShapeAlgo_ToolContainer;
		 ShapeAlgo_ToolContainer ();
		%feature("compactdefaultargs") FixShape;
		%feature("autodoc", "	* Returns ShapeFix_Shape

	:rtype: Handle_ShapeFix_Shape
") FixShape;
		virtual Handle_ShapeFix_Shape FixShape ();
		%feature("compactdefaultargs") EdgeProjAux;
		%feature("autodoc", "	* Returns ShapeFix_EdgeProjAux

	:rtype: Handle_ShapeFix_EdgeProjAux
") EdgeProjAux;
		virtual Handle_ShapeFix_EdgeProjAux EdgeProjAux ();
};


%extend ShapeAlgo_ToolContainer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeAlgo_ToolContainer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeAlgo_ToolContainer::Handle_ShapeAlgo_ToolContainer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeAlgo_ToolContainer;
class Handle_ShapeAlgo_ToolContainer : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeAlgo_ToolContainer();
        Handle_ShapeAlgo_ToolContainer(const Handle_ShapeAlgo_ToolContainer &aHandle);
        Handle_ShapeAlgo_ToolContainer(const ShapeAlgo_ToolContainer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeAlgo_ToolContainer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeAlgo_ToolContainer {
    ShapeAlgo_ToolContainer* _get_reference() {
    return (ShapeAlgo_ToolContainer*)$self->Access();
    }
};

%extend Handle_ShapeAlgo_ToolContainer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeAlgo_ToolContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
