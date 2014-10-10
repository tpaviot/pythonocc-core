/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module ShapeAlgo

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include ShapeAlgo_required_python_modules.i
%include ShapeAlgo_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(shapealgo) ShapeAlgo;
%nodefaultctor ShapeAlgo;
class ShapeAlgo {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static void

Provides initerface to the algorithms from Shape Healing.  Creates and initializes default AlgoContainer.") Init;
		static void Init ();
		%feature("autodoc", "Args:
	aContainer(Handle_ShapeAlgo_AlgoContainer)

Returns:
	static void

Sets default AlgoContainer") SetAlgoContainer;
		static void SetAlgoContainer (const Handle_ShapeAlgo_AlgoContainer & aContainer);
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_ShapeAlgo_AlgoContainer

Returns default AlgoContainer") AlgoContainer;
		static Handle_ShapeAlgo_AlgoContainer AlgoContainer ();
};


%feature("shadow") ShapeAlgo::~ShapeAlgo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAlgo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAlgo_ToolContainer;
class ShapeAlgo_ToolContainer : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeAlgo_ToolContainer;
		 ShapeAlgo_ToolContainer ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_ShapeFix_Shape

Returns ShapeFix_Shape") FixShape;
		virtual Handle_ShapeFix_Shape FixShape ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_ShapeFix_EdgeProjAux

Returns ShapeFix_EdgeProjAux") EdgeProjAux;
		virtual Handle_ShapeFix_EdgeProjAux EdgeProjAux ();
};


%feature("shadow") ShapeAlgo_ToolContainer::~ShapeAlgo_ToolContainer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAlgo_ToolContainer {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeAlgo_ToolContainer {
	Handle_ShapeAlgo_ToolContainer GetHandle() {
	return *(Handle_ShapeAlgo_ToolContainer*) &$self;
	}
};

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
    ShapeAlgo_ToolContainer* GetObject() {
    return (ShapeAlgo_ToolContainer*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeAlgo_ToolContainer::~Handle_ShapeAlgo_ToolContainer %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeAlgo_ToolContainer {
    void _kill_pointed() {
        delete $self;
    }
};

