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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define SHAPEALGODOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=SHAPEALGODOCSTRING) ShapeAlgo

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include ShapeAlgo_headers.i

/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(ShapeAlgo_ToolContainer)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(shapealgo) ShapeAlgo;
class ShapeAlgo {
	public:
		%feature("compactdefaultargs") AlgoContainer;
		%feature("autodoc", "	* Returns default AlgoContainer

	:rtype: opencascade::handle<ShapeAlgo_AlgoContainer>
") AlgoContainer;
		static opencascade::handle<ShapeAlgo_AlgoContainer> AlgoContainer ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Provides initerface to the algorithms from Shape Healing. Creates and initializes default AlgoContainer.

	:rtype: void
") Init;
		static void Init ();
		%feature("compactdefaultargs") SetAlgoContainer;
		%feature("autodoc", "	* Sets default AlgoContainer

	:param aContainer:
	:type aContainer: opencascade::handle<ShapeAlgo_AlgoContainer> &
	:rtype: void
") SetAlgoContainer;
		static void SetAlgoContainer (const opencascade::handle<ShapeAlgo_AlgoContainer> & aContainer);
};


%extend ShapeAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeAlgo_ToolContainer;
class ShapeAlgo_ToolContainer : public Standard_Transient {
	public:
		%feature("compactdefaultargs") EdgeProjAux;
		%feature("autodoc", "	* Returns ShapeFix_EdgeProjAux

	:rtype: opencascade::handle<ShapeFix_EdgeProjAux>
") EdgeProjAux;
		virtual opencascade::handle<ShapeFix_EdgeProjAux> EdgeProjAux ();
		%feature("compactdefaultargs") FixShape;
		%feature("autodoc", "	* Returns ShapeFix_Shape

	:rtype: opencascade::handle<ShapeFix_Shape>
") FixShape;
		virtual opencascade::handle<ShapeFix_Shape> FixShape ();
		%feature("compactdefaultargs") ShapeAlgo_ToolContainer;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") ShapeAlgo_ToolContainer;
		 ShapeAlgo_ToolContainer ();
};


%make_alias(ShapeAlgo_ToolContainer)

%extend ShapeAlgo_ToolContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
