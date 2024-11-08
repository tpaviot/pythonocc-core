/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define TOPODSDOCSTRING
"TopoDS module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_topods.html"
%enddef
%module (package="OCC.Core", docstring=TOPODSDOCSTRING) TopoDS


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


%{
#include<TopoDS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<TCollection_module.hxx>
#include<TopAbs_module.hxx>
#include<TopLoc_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i
%import TCollection.i
%import TopAbs.i
%import TopLoc.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TopoDS_HShape)
%wrap_handle(TopoDS_TShape)
%wrap_handle(TopoDS_TCompSolid)
%wrap_handle(TopoDS_TCompound)
%wrap_handle(TopoDS_TEdge)
%wrap_handle(TopoDS_TFace)
%wrap_handle(TopoDS_TShell)
%wrap_handle(TopoDS_TSolid)
%wrap_handle(TopoDS_TVertex)
%wrap_handle(TopoDS_TWire)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class TopoDS *
***************/
%rename(topods) TopoDS;
class TopoDS {
	public:
		/****************** CompSolid ******************/
		/**** md5 signature: 77482fb5305a905f39420d63ffae3ba2 ****/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_CompSolid

Description
-----------
Casts shape s to the more specialized return type, compsolid. exceptions standard_typemismatch if s cannot be cast to this return type.
") CompSolid;
		static const TopoDS_CompSolid CompSolid(const TopoDS_Shape & S);

		/****************** CompSolid ******************/
		/**** md5 signature: acac3e26b4f9eaee939ae767dc905732 ****/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "
Parameters
----------
&: TopoDS_Shape

Return
-------
TopoDS_CompSolid

Description
-----------
No available documentation.
") CompSolid;
		static TopoDS_CompSolid CompSolid(TopoDS_Shape &);

		/****************** Compound ******************/
		/**** md5 signature: c17cf0d09b6ccab9c17dc865a09c7150 ****/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Compound

Description
-----------
Casts shape s to the more specialized return type, compound. exceptions standard_typemismatch if s cannot be cast to this return type.
") Compound;
		static const TopoDS_Compound Compound(const TopoDS_Shape & S);

		/****************** Compound ******************/
		/**** md5 signature: bbe6e136825d27af4ce8ba843aa4a44e ****/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "
Parameters
----------
&: TopoDS_Shape

Return
-------
TopoDS_Compound

Description
-----------
No available documentation.
") Compound;
		static TopoDS_Compound Compound(TopoDS_Shape &);

		/****************** Edge ******************/
		/**** md5 signature: 2efe03945bfb23dc595529d700df79fe ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Edge

Description
-----------
Casts shape s to the more specialized return type, edge exceptions standard_typemismatch if s cannot be cast to this return type.
") Edge;
		static const TopoDS_Edge Edge(const TopoDS_Shape & S);

		/****************** Edge ******************/
		/**** md5 signature: 605fbe185d4371720726023645d12b9e ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
&: TopoDS_Shape

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		static TopoDS_Edge Edge(TopoDS_Shape &);

		/****************** Face ******************/
		/**** md5 signature: fc38e2ff501b643c83b607450ae60258 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Face

Description
-----------
Casts shape s to the more specialized return type, face. exceptions standard_typemismatch if s cannot be cast to this return type.
") Face;
		static const TopoDS_Face Face(const TopoDS_Shape & S);

		/****************** Face ******************/
		/**** md5 signature: 97d264774f3d915b324d2b5d62bfb31e ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
&: TopoDS_Shape

Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		static TopoDS_Face Face(TopoDS_Shape &);

		/****************** Shell ******************/
		/**** md5 signature: dfadc1f5af3f5b4c35af960076bc47d2 ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shell

Description
-----------
Casts shape s to the more specialized return type, shell. exceptions standard_typemismatch if s cannot be cast to this return type.
") Shell;
		static const TopoDS_Shell Shell(const TopoDS_Shape & S);

		/****************** Shell ******************/
		/**** md5 signature: 5d7348478377e29d3d007b81777cc236 ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "
Parameters
----------
&: TopoDS_Shape

Return
-------
TopoDS_Shell

Description
-----------
No available documentation.
") Shell;
		static TopoDS_Shell Shell(TopoDS_Shape &);

		/****************** Solid ******************/
		/**** md5 signature: 53ff4c77d3412e4bb8f19ba5e83f838c ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Solid

Description
-----------
Casts shape s to the more specialized return type, solid. exceptions standard_typemismatch if s cannot be cast to this return type.
") Solid;
		static const TopoDS_Solid Solid(const TopoDS_Shape & S);

		/****************** Solid ******************/
		/**** md5 signature: e47476ce6c435c36e53fa880bf6bb8e3 ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "
Parameters
----------
&: TopoDS_Shape

Return
-------
TopoDS_Solid

Description
-----------
No available documentation.
") Solid;
		static TopoDS_Solid Solid(TopoDS_Shape &);

		/****************** Vertex ******************/
		/**** md5 signature: 21ffb745f1245cff3cbd88e6c40f3c0b ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Vertex

Description
-----------
Basic tool to access the data structure. casts shape s to the more specialized return type, vertex. exceptions standard_typemismatch if s cannot be cast to this return type.
") Vertex;
		static const TopoDS_Vertex Vertex(const TopoDS_Shape & S);

		/****************** Vertex ******************/
		/**** md5 signature: 80abea55e3497029b89e57d1c21c315c ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
&: TopoDS_Shape

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		static TopoDS_Vertex Vertex(TopoDS_Shape &);

		/****************** Wire ******************/
		/**** md5 signature: 108068a348cc0d726ab22196f451f319 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Wire

Description
-----------
Casts shape s to the more specialized return type, wire. exceptions standard_typemismatch if s cannot be cast to this return type.
") Wire;
		static const TopoDS_Wire Wire(const TopoDS_Shape & S);

		/****************** Wire ******************/
		/**** md5 signature: 0f0c46a4e1cce27ede9c36f04aa5032d ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "
Parameters
----------
&: TopoDS_Shape

Return
-------
TopoDS_Wire

Description
-----------
No available documentation.
") Wire;
		static TopoDS_Wire Wire(TopoDS_Shape &);

};


%extend TopoDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopoDS_AlertAttribute *
******************************/
class TopoDS_AlertAttribute : public Message_AttributeStream {
	public:
		/****************** TopoDS_AlertAttribute ******************/
		/**** md5 signature: e19fe6951fa45f2892842acdec08d481 ****/
		%feature("compactdefaultargs") TopoDS_AlertAttribute;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theName: str (optional, default to TCollection_AsciiString())

Return
-------
None

Description
-----------
Constructor with shape argument.
") TopoDS_AlertAttribute;
		 TopoDS_AlertAttribute(const TopoDS_Shape & theShape, TCollection_AsciiString theName = TCollection_AsciiString());


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** GetShape ******************/
		/**** md5 signature: 7c167c51f2939d15d5bfddc807114b00 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns contained shape.
") GetShape;
		const TopoDS_Shape GetShape();

		/****************** Send ******************/
		/**** md5 signature: f758a2f5fbed2533ad76c7a33e1b30aa ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
theMessenger: Message_Messenger
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Push shape information into messenger.
") Send;
		static void Send(const opencascade::handle<Message_Messenger> & theMessenger, const TopoDS_Shape & theShape);

};


%extend TopoDS_AlertAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopoDS_AlertWithShape *
******************************/
class TopoDS_AlertWithShape : public Message_Alert {
	public:
		/****************** TopoDS_AlertWithShape ******************/
		/**** md5 signature: bf010bf8cf1d603e9238878a8b8fabca ****/
		%feature("compactdefaultargs") TopoDS_AlertWithShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Constructor with shape argument.
") TopoDS_AlertWithShape;
		 TopoDS_AlertWithShape(const TopoDS_Shape & theShape);

		/****************** GetShape ******************/
		/**** md5 signature: 7c167c51f2939d15d5bfddc807114b00 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns contained shape.
") GetShape;
		const TopoDS_Shape GetShape();

		/****************** Merge ******************/
		/**** md5 signature: 35843034c2fcb7185666677c75445acd ****/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "
Parameters
----------
theTarget: Message_Alert

Return
-------
bool

Description
-----------
Returns false.
") Merge;
		virtual Standard_Boolean Merge(const opencascade::handle<Message_Alert> & theTarget);

		/****************** SetShape ******************/
		/**** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Sets the shape.
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****************** SupportsMerge ******************/
		/**** md5 signature: 45abe0601cddac599cb8c2c1cbfefd85 ****/
		%feature("compactdefaultargs") SupportsMerge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false.
") SupportsMerge;
		virtual Standard_Boolean SupportsMerge();

};


%extend TopoDS_AlertWithShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TopoDS_Builder *
***********************/
class TopoDS_Builder {
	public:
		/****************** Add ******************/
		/**** md5 signature: a4d2fabfa32115778f1d6bcf63b2c80a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
C: TopoDS_Shape

Return
-------
None

Description
-----------
Add the shape c in the shape s. exceptions - topods_frozenshape if s is not free and cannot be modified. - topods__uncompatibleshapes if s and c are not compatible.
") Add;
		void Add(TopoDS_Shape & S, const TopoDS_Shape & C);

		/****************** MakeCompSolid ******************/
		/**** md5 signature: 2779417f1bd118d72864dd49941e3476 ****/
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "
Parameters
----------
C: TopoDS_CompSolid

Return
-------
None

Description
-----------
Make an empty composite solid.
") MakeCompSolid;
		void MakeCompSolid(TopoDS_CompSolid & C);

		/****************** MakeCompound ******************/
		/**** md5 signature: 8ef30e3aeaa1e039903e37c7eb6f227a ****/
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "
Parameters
----------
C: TopoDS_Compound

Return
-------
None

Description
-----------
Make an empty compound.
") MakeCompound;
		void MakeCompound(TopoDS_Compound & C);

		/****************** MakeShell ******************/
		/**** md5 signature: 2854985e778e4f5296d3dcce3926dae9 ****/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell

Return
-------
None

Description
-----------
Make an empty shell.
") MakeShell;
		void MakeShell(TopoDS_Shell & S);

		/****************** MakeSolid ******************/
		/**** md5 signature: 72c61c4761a422ab569bc3077fd4e17b ****/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid

Return
-------
None

Description
-----------
Make a solid covering the whole 3d space.
") MakeSolid;
		void MakeSolid(TopoDS_Solid & S);

		/****************** MakeWire ******************/
		/**** md5 signature: a7807363bff6d0d52ee9e63114e705f0 ****/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
Make an empty wire.
") MakeWire;
		void MakeWire(TopoDS_Wire & W);

		/****************** Remove ******************/
		/**** md5 signature: 1aed09a4ee44dda7c9c996d82ce4d414 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
C: TopoDS_Shape

Return
-------
None

Description
-----------
Remove the shape c from the shape s. exceptions topods_frozenshape if s is frozen and cannot be modified.
") Remove;
		void Remove(TopoDS_Shape & S, const TopoDS_Shape & C);

};


%extend TopoDS_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TopoDS_HShape *
**********************/
class TopoDS_HShape : public Standard_Transient {
	public:
		/****************** TopoDS_HShape ******************/
		/**** md5 signature: a6ef1327fe6cad9df6d552af30df6c25 ****/
		%feature("compactdefaultargs") TopoDS_HShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty shape object.
") TopoDS_HShape;
		 TopoDS_HShape();

		/****************** TopoDS_HShape ******************/
		/**** md5 signature: 12d11e8b4cb229fa48747aee89017cfd ****/
		%feature("compactdefaultargs") TopoDS_HShape;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
None

Description
-----------
Constructs a shape object defined by the shape ashape.
") TopoDS_HShape;
		 TopoDS_HShape(const TopoDS_Shape & aShape);

		/****************** ChangeShape ******************/
		/**** md5 signature: 465c12175fb924e02c35f2de6caf5b49 ****/
		%feature("compactdefaultargs") ChangeShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Exchanges the topods_shape object defining this shape for another one referencing the same underlying shape accesses the list of shapes within the underlying shape referenced by the topods_shape object. returns a reference to a topods_shape based on this shape. the topods_shape can be modified.
") ChangeShape;
		TopoDS_Shape ChangeShape();

		/****************** Shape ******************/
		/**** md5 signature: 2159495cdca23673df5e9a9f681faa06 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
None

Description
-----------
Loads this shape with the shape ashape.
") Shape;
		void Shape(const TopoDS_Shape & aShape);

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a reference to a constant topods_shape based on this shape.
") Shape;
		const TopoDS_Shape Shape();

};


%make_alias(TopoDS_HShape)

%extend TopoDS_HShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TopoDS_Iterator *
************************/
class TopoDS_Iterator {
	public:
		/****************** TopoDS_Iterator ******************/
		/**** md5 signature: ef933d0adb0bdf4349f304bda22d288c ****/
		%feature("compactdefaultargs") TopoDS_Iterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty iterator.
") TopoDS_Iterator;
		 TopoDS_Iterator();

		/****************** TopoDS_Iterator ******************/
		/**** md5 signature: 5140035e418f481a1a1b464798561ee9 ****/
		%feature("compactdefaultargs") TopoDS_Iterator;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
cumOri: bool (optional, default to Standard_True)
cumLoc: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates an iterator on <s> sub-shapes. note: - if cumori is true, the function composes all sub-shapes with the orientation of s. - if cumloc is true, the function multiplies all sub-shapes by the location of s, i.e. it applies to each sub-shape the transformation that is associated with s.
") TopoDS_Iterator;
		 TopoDS_Iterator(const TopoDS_Shape & S, const Standard_Boolean cumOri = Standard_True, const Standard_Boolean cumLoc = Standard_True);

		/****************** Initialize ******************/
		/**** md5 signature: eae51e6c922353320397faf3e14bdc47 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
cumOri: bool (optional, default to Standard_True)
cumLoc: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Initializes this iterator with shape s. note: - if cumori is true, the function composes all sub-shapes with the orientation of s. - if cumloc is true, the function multiplies all sub-shapes by the location of s, i.e. it applies to each sub-shape the transformation that is associated with s.
") Initialize;
		void Initialize(const TopoDS_Shape & S, const Standard_Boolean cumOri = Standard_True, const Standard_Boolean cumLoc = Standard_True);

		/****************** More ******************/
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is another sub-shape in the shape which this iterator is scanning.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves on to the next sub-shape in the shape which this iterator is scanning. exceptions standard_nomoreobject if there are no more sub-shapes in the shape.
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: ebbff234a3094c505e960926e0773ed1 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the current sub-shape in the shape which this iterator is scanning. exceptions standard_nosuchobject if there is no current sub-shape.
") Value;
		const TopoDS_Shape Value();

};


%extend TopoDS_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_Shape *
*********************/
class TopoDS_Shape {
	public:
		%feature("autodoc", "1");
		TopoDS_Shape(const TopoDS_Shape arg0);
		/****************** TopoDS_Shape ******************/
		/**** md5 signature: edf08caaf8216af1bae07927d5abddda ****/
		%feature("compactdefaultargs") TopoDS_Shape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a null shape referring to nothing.
") TopoDS_Shape;
		 TopoDS_Shape();

		/****************** Checked ******************/
		/**** md5 signature: a8b84838b155e0f2c75ceed32947100e ****/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the checked flag.
") Checked;
		Standard_Boolean Checked();

		/****************** Checked ******************/
		/**** md5 signature: 6f7fe475bfb2ebdcad97ddf64dd0534c ****/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "
Parameters
----------
theIsChecked: bool

Return
-------
None

Description
-----------
Sets the checked flag.
") Checked;
		void Checked(Standard_Boolean theIsChecked);

		/****************** Closed ******************/
		/**** md5 signature: f94551c898fe323903f1d14861bbe901 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the closedness flag.
") Closed;
		Standard_Boolean Closed();

		/****************** Closed ******************/
		/**** md5 signature: ff8619fc236f7435a92bdca9a0d16193 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
theIsClosed: bool

Return
-------
None

Description
-----------
Sets the closedness flag.
") Closed;
		void Closed(Standard_Boolean theIsClosed);

		/****************** Complement ******************/
		/**** md5 signature: 5445a2200c21648250c6106947f9d63d ****/
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Complements the orientation, using the complement method from the topabs package.
") Complement;
		void Complement();

		/****************** Complemented ******************/
		/**** md5 signature: c44b570f0e4ab4f0fd933e748a5584b2 ****/
		%feature("compactdefaultargs") Complemented;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a shape similar to <self> with the orientation complemented, using the complement method from the topabs package.
") Complemented;
		TopoDS_Shape Complemented();

		/****************** Compose ******************/
		/**** md5 signature: b00257faf0ae2c3380d408ebd84e41ef ****/
		%feature("compactdefaultargs") Compose;
		%feature("autodoc", "
Parameters
----------
theOrient: TopAbs_Orientation

Return
-------
None

Description
-----------
Updates the shape orientation by composition with theorient, using the compose method from the topabs package.
") Compose;
		void Compose(TopAbs_Orientation theOrient);

		/****************** Composed ******************/
		/**** md5 signature: df9ee32a8c057489f0e1e7b4c69ff1ba ****/
		%feature("compactdefaultargs") Composed;
		%feature("autodoc", "
Parameters
----------
theOrient: TopAbs_Orientation

Return
-------
TopoDS_Shape

Description
-----------
Returns a shape similar to <self> with the orientation composed with theorient, using the compose method from the topabs package.
") Composed;
		TopoDS_Shape Composed(TopAbs_Orientation theOrient);

		/****************** Convex ******************/
		/**** md5 signature: efe9b0c153a7f00d69634882071b034b ****/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the convexness flag.
") Convex;
		Standard_Boolean Convex();

		/****************** Convex ******************/
		/**** md5 signature: 2680b89fa5162759d8c7800c264f8f42 ****/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "
Parameters
----------
theIsConvex: bool

Return
-------
None

Description
-----------
Sets the convexness flag.
") Convex;
		void Convex(Standard_Boolean theIsConvex);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** EmptyCopied ******************/
		/**** md5 signature: f9424d26c99f755bc5579214a9cd7453 ****/
		%feature("compactdefaultargs") EmptyCopied;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a new shape with the same orientation and location and a new tshape with the same geometry and no sub-shapes.
") EmptyCopied;
		TopoDS_Shape EmptyCopied();

		/****************** EmptyCopy ******************/
		/**** md5 signature: a7df0c34e1cfde304e21809ef4e73476 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replace <self> by a new shape with the same orientation and location and a new tshape with the same geometry and no sub-shapes.
") EmptyCopy;
		void EmptyCopy();

		/****************** Free ******************/
		/**** md5 signature: 0f8a4dc099aac04a52ab47593952a756 ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the free flag.
") Free;
		Standard_Boolean Free();

		/****************** Free ******************/
		/**** md5 signature: fd04bdf9a77ff277e8a9c89a73733eba ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "
Parameters
----------
theIsFree: bool

Return
-------
None

Description
-----------
Sets the free flag.
") Free;
		void Free(Standard_Boolean theIsFree);

		/****************** Infinite ******************/
		/**** md5 signature: 9f918e9fa7267ec7961ed78dd974f109 ****/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the infinity flag.
") Infinite;
		Standard_Boolean Infinite();

		/****************** Infinite ******************/
		/**** md5 signature: a2693ee14462a14ca45ed7b01f364159 ****/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "
Parameters
----------
theIsInfinite: bool

Return
-------
None

Description
-----------
Sets the infinity flag.
") Infinite;
		void Infinite(Standard_Boolean theIsInfinite);

		/****************** IsEqual ******************/
		/**** md5 signature: 9fcaa9df016676d3d7591d1fe151db2f ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if two shapes are equal, i.e. if they share the same tshape with the same locations and orientations.
") IsEqual;
		Standard_Boolean IsEqual(const TopoDS_Shape & theOther);

		/****************** IsNotEqual ******************/
		/**** md5 signature: 1b49814ef251363cd9a95492cfdef6a8 ****/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "
Parameters
----------
theOther: TopoDS_Shape

Return
-------
bool

Description
-----------
Negation of the isequal method.
") IsNotEqual;
		Standard_Boolean IsNotEqual(const TopoDS_Shape & theOther);

		/****************** IsNull ******************/
		/**** md5 signature: a86f99f80f18afba475b30f6c686c6c8 ****/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this shape is null. in other words, it references no underlying shape with the potential to be given a location and an orientation.
") IsNull;
		Standard_Boolean IsNull();

		/****************** IsPartner ******************/
		/**** md5 signature: 4a5dce39f42efa7247850500468bd032 ****/
		%feature("compactdefaultargs") IsPartner;
		%feature("autodoc", "
Parameters
----------
theOther: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if two shapes are partners, i.e. if they share the same tshape. locations and orientations may differ.
") IsPartner;
		Standard_Boolean IsPartner(const TopoDS_Shape & theOther);

		/****************** IsSame ******************/
		/**** md5 signature: ab65e9443b90d3a756824c7228ce0bb9 ****/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "
Parameters
----------
theOther: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if two shapes are same, i.e. if they share the same tshape with the same locations. orientations may differ.
") IsSame;
		Standard_Boolean IsSame(const TopoDS_Shape & theOther);

		/****************** Located ******************/
		/**** md5 signature: 3f8cd1598c3eb01b43ca976d06905f6f ****/
		%feature("compactdefaultargs") Located;
		%feature("autodoc", "
Parameters
----------
theLoc: TopLoc_Location
theRaiseExc: bool (optional, default to Standard_True)

Return
-------
TopoDS_Shape

Description
-----------
Returns a shape similar to <self> with the local coordinate system set to <loc>.
") Located;
		TopoDS_Shape Located(const TopLoc_Location & theLoc, const Standard_Boolean theRaiseExc = Standard_True);

		/****************** Location ******************/
		/**** md5 signature: 57e4db9c8a7a08cffc827dc50be227c9 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Returns the shape local coordinate system.
") Location;
		const TopLoc_Location & Location();

		/****************** Location ******************/
		/**** md5 signature: 9dfc75484b9577a6acde91d32790727b ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
theLoc: TopLoc_Location
theRaiseExc: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets the shape local coordinate system.
") Location;
		void Location(const TopLoc_Location & theLoc, const Standard_Boolean theRaiseExc = Standard_True);

		/****************** Locked ******************/
		/**** md5 signature: a47aa902e0d0df6fdbe782c3c7f2d1b5 ****/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the locked flag.
") Locked;
		Standard_Boolean Locked();

		/****************** Locked ******************/
		/**** md5 signature: e4e0d1f6c3d0b8b33754ee4ca7b4ca88 ****/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "
Parameters
----------
theIsLocked: bool

Return
-------
None

Description
-----------
Sets the locked flag.
") Locked;
		void Locked(Standard_Boolean theIsLocked);

		/****************** Modified ******************/
		/**** md5 signature: 23f96a9ab7f36b9d00a752024e065b1e ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the modification flag.
") Modified;
		Standard_Boolean Modified();

		/****************** Modified ******************/
		/**** md5 signature: 03454af83e34288052522e1c873bb443 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
theIsModified: bool

Return
-------
None

Description
-----------
Sets the modification flag.
") Modified;
		void Modified(Standard_Boolean theIsModified);

		/****************** Move ******************/
		/**** md5 signature: d7624253a8bf526c57d80a382d92f068 ****/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "
Parameters
----------
thePosition: TopLoc_Location
theRaiseExc: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Multiplies the shape location by theposition.
") Move;
		void Move(const TopLoc_Location & thePosition, const Standard_Boolean theRaiseExc = Standard_True);

		/****************** Moved ******************/
		/**** md5 signature: 2c1c929bc14809beff6d7542a5f68efe ****/
		%feature("compactdefaultargs") Moved;
		%feature("autodoc", "
Parameters
----------
thePosition: TopLoc_Location
theRaiseExc: bool (optional, default to Standard_True)

Return
-------
TopoDS_Shape

Description
-----------
Returns a shape similar to <self> with a location multiplied by theposition.
") Moved;
		TopoDS_Shape Moved(const TopLoc_Location & thePosition, const Standard_Boolean theRaiseExc = Standard_True);

		/****************** NbChildren ******************/
		/**** md5 signature: 112820d06ee986e20c4479ba5bfe3404 ****/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of direct sub-shapes (children). @sa topods_iterator for accessing sub-shapes.
") NbChildren;
		Standard_Integer NbChildren();

		/****************** Nullify ******************/
		/**** md5 signature: bf958a8fb495dbcd033238b0232a20bc ****/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Destroys the reference to the underlying shape stored in this shape. as a result, this shape becomes null.
") Nullify;
		void Nullify();

		/****************** Orientable ******************/
		/**** md5 signature: a4c7ff5e7b547070b53b5622df6b7763 ****/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the orientability flag.
") Orientable;
		Standard_Boolean Orientable();

		/****************** Orientable ******************/
		/**** md5 signature: 53dfd63caccd3cd09b3be20b223481d7 ****/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "
Parameters
----------
theIsOrientable: bool

Return
-------
None

Description
-----------
Sets the orientability flag.
") Orientable;
		void Orientable(const Standard_Boolean theIsOrientable);

		/****************** Orientation ******************/
		/**** md5 signature: 03010048da537511bfd11160d3c898dc ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the shape orientation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Orientation ******************/
		/**** md5 signature: 0d1a798250eed02f47b6d075b65e005b ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
theOrient: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the shape orientation.
") Orientation;
		void Orientation(TopAbs_Orientation theOrient);

		/****************** Oriented ******************/
		/**** md5 signature: 6dd69632c2942d8dbfe6c7264ba4a0aa ****/
		%feature("compactdefaultargs") Oriented;
		%feature("autodoc", "
Parameters
----------
theOrient: TopAbs_Orientation

Return
-------
TopoDS_Shape

Description
-----------
Returns a shape similar to <self> with the orientation set to <or>.
") Oriented;
		TopoDS_Shape Oriented(TopAbs_Orientation theOrient);

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the orientation, using the reverse method from the topabs package.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 5451f523177e720649fdb5522c1ebbf7 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a shape similar to <self> with the orientation reversed, using the reverse method from the topabs package.
") Reversed;
		TopoDS_Shape Reversed();

		/****************** ShapeType ******************/
		/**** md5 signature: 785120710559c16ce1f4c926b5d434aa ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns the value of the topabs_shapeenum enumeration that corresponds to this shape, for example vertex, edge, and so on. exceptions standard_nullobject if this shape is null.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** TShape ******************/
		/**** md5 signature: 039ebb52b4f71627e28e118c3a56ae78 ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns a handle to the actual shape implementation.
") TShape;
		const opencascade::handle<TopoDS_TShape> TShape();

		/****************** TShape ******************/
		/**** md5 signature: e351e596b1be4ca939b9ce9c975bec7b ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "
Parameters
----------
theTShape: TopoDS_TShape

Return
-------
None

Description
-----------
No available documentation.
") TShape;
		void TShape(const opencascade::handle<TopoDS_TShape> & theTShape);


%extend{
    bool __ne_wrapper__(const TopoDS_Shape other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __eq_wrapper__(const TopoDS_Shape other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};



%extend TopoDS_Shape {
    size_t __hash__() {
        std::hash<TopoDS_Shape> shapeHasher;
        size_t hashValue = shapeHasher(*self);
        return hashValue;
    }
};

%extend TopoDS_Shape {
%pythoncode {
    def __getstate__(self):
        from .BRepTools import breptools
        str_shape = breptools.WriteToString(self, True)
        return str_shape
    def __setstate__(self, state):
        from .BRepTools import breptools
        the_shape = breptools.ReadFromString(state)
        self.this = the_shape.this
    }
};
%extend TopoDS_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TopoDS_TShape *
**********************/
%nodefaultctor TopoDS_TShape;
class TopoDS_TShape : public Standard_Transient {
	public:
		/****************** Checked ******************/
		/**** md5 signature: a8b84838b155e0f2c75ceed32947100e ****/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the checked flag.
") Checked;
		Standard_Boolean Checked();

		/****************** Checked ******************/
		/**** md5 signature: 6f7fe475bfb2ebdcad97ddf64dd0534c ****/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "
Parameters
----------
theIsChecked: bool

Return
-------
None

Description
-----------
Sets the checked flag.
") Checked;
		void Checked(Standard_Boolean theIsChecked);

		/****************** Closed ******************/
		/**** md5 signature: f94551c898fe323903f1d14861bbe901 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the closedness flag.
") Closed;
		Standard_Boolean Closed();

		/****************** Closed ******************/
		/**** md5 signature: ff8619fc236f7435a92bdca9a0d16193 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
theIsClosed: bool

Return
-------
None

Description
-----------
Sets the closedness flag.
") Closed;
		void Closed(Standard_Boolean theIsClosed);

		/****************** Convex ******************/
		/**** md5 signature: efe9b0c153a7f00d69634882071b034b ****/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the convexness flag.
") Convex;
		Standard_Boolean Convex();

		/****************** Convex ******************/
		/**** md5 signature: 2680b89fa5162759d8c7800c264f8f42 ****/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "
Parameters
----------
theIsConvex: bool

Return
-------
None

Description
-----------
Sets the convexness flag.
") Convex;
		void Convex(Standard_Boolean theIsConvex);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** EmptyCopy ******************/
		/**** md5 signature: de08b6aae09d9de59b334a4b6c880feb ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns a copy of the tshape with no sub-shapes.
") EmptyCopy;
		virtual opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** Free ******************/
		/**** md5 signature: 0f8a4dc099aac04a52ab47593952a756 ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the free flag.
") Free;
		Standard_Boolean Free();

		/****************** Free ******************/
		/**** md5 signature: fd04bdf9a77ff277e8a9c89a73733eba ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "
Parameters
----------
theIsFree: bool

Return
-------
None

Description
-----------
Sets the free flag.
") Free;
		void Free(Standard_Boolean theIsFree);

		/****************** Infinite ******************/
		/**** md5 signature: 9f918e9fa7267ec7961ed78dd974f109 ****/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the infinity flag.
") Infinite;
		Standard_Boolean Infinite();

		/****************** Infinite ******************/
		/**** md5 signature: a2693ee14462a14ca45ed7b01f364159 ****/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "
Parameters
----------
theIsInfinite: bool

Return
-------
None

Description
-----------
Sets the infinity flag.
") Infinite;
		void Infinite(Standard_Boolean theIsInfinite);

		/****************** Locked ******************/
		/**** md5 signature: a47aa902e0d0df6fdbe782c3c7f2d1b5 ****/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the locked flag.
") Locked;
		Standard_Boolean Locked();

		/****************** Locked ******************/
		/**** md5 signature: e4e0d1f6c3d0b8b33754ee4ca7b4ca88 ****/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "
Parameters
----------
theIsLocked: bool

Return
-------
None

Description
-----------
Sets the locked flag.
") Locked;
		void Locked(Standard_Boolean theIsLocked);

		/****************** Modified ******************/
		/**** md5 signature: 23f96a9ab7f36b9d00a752024e065b1e ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the modification flag.
") Modified;
		Standard_Boolean Modified();

		/****************** Modified ******************/
		/**** md5 signature: 03454af83e34288052522e1c873bb443 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
theIsModified: bool

Return
-------
None

Description
-----------
Sets the modification flag.
") Modified;
		void Modified(Standard_Boolean theIsModified);

		/****************** NbChildren ******************/
		/**** md5 signature: 112820d06ee986e20c4479ba5bfe3404 ****/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of direct sub-shapes (children). @sa topods_iterator for accessing sub-shapes.
") NbChildren;
		Standard_Integer NbChildren();

		/****************** Orientable ******************/
		/**** md5 signature: a4c7ff5e7b547070b53b5622df6b7763 ****/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the orientability flag.
") Orientable;
		Standard_Boolean Orientable();

		/****************** Orientable ******************/
		/**** md5 signature: 85ab9cd6de8af23c76a0b0e4dc4b2ac2 ****/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "
Parameters
----------
theIsOrientable: bool

Return
-------
None

Description
-----------
Sets the orientability flag.
") Orientable;
		void Orientable(Standard_Boolean theIsOrientable);

		/****************** ShapeType ******************/
		/**** md5 signature: bc3cf16d2be321cde120394409d92805 ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns the type as a term of the shapeenum enum: vertex, edge, wire, face, ....
") ShapeType;
		virtual TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TShape)

%extend TopoDS_TShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class hash<TopoDS_CompSolid> *
*******************************/
/******************************
* class hash<TopoDS_Compound> *
******************************/
/**************************
* class hash<TopoDS_Edge> *
**************************/
/**************************
* class hash<TopoDS_Face> *
**************************/
/***************************
* class hash<TopoDS_Shape> *
***************************/
/***************************
* class hash<TopoDS_Shell> *
***************************/
/***************************
* class hash<TopoDS_Solid> *
***************************/
/****************************
* class hash<TopoDS_Vertex> *
****************************/
/**************************
* class hash<TopoDS_Wire> *
**************************/
/*************************
* class TopoDS_CompSolid *
*************************/
class TopoDS_CompSolid : public TopoDS_Shape {
	public:
		/****************** TopoDS_CompSolid ******************/
		/**** md5 signature: 4e70b1dcdd85f3c4a5879f40c5c14bf3 ****/
		%feature("compactdefaultargs") TopoDS_CompSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an undefined compsolid.
") TopoDS_CompSolid;
		 TopoDS_CompSolid();

};


%extend TopoDS_CompSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TopoDS_Compound *
************************/
class TopoDS_Compound : public TopoDS_Shape {
	public:
		/****************** TopoDS_Compound ******************/
		/**** md5 signature: 62e9eeb255aba3f819f1225fe00186c5 ****/
		%feature("compactdefaultargs") TopoDS_Compound;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an undefined compound.
") TopoDS_Compound;
		 TopoDS_Compound();

};


%extend TopoDS_Compound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class TopoDS_Edge *
********************/
class TopoDS_Edge : public TopoDS_Shape {
	public:
		/****************** TopoDS_Edge ******************/
		/**** md5 signature: 9416e6e6aa14e71109ceb91046f13c31 ****/
		%feature("compactdefaultargs") TopoDS_Edge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Undefined edge.
") TopoDS_Edge;
		 TopoDS_Edge();

};


%extend TopoDS_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class TopoDS_Face *
********************/
class TopoDS_Face : public TopoDS_Shape {
	public:
		/****************** TopoDS_Face ******************/
		/**** md5 signature: c7ffccf9e49ec92b2a176332a9b1d12e ****/
		%feature("compactdefaultargs") TopoDS_Face;
		%feature("autodoc", "Return
-------
None

Description
-----------
Undefined face.
") TopoDS_Face;
		 TopoDS_Face();

};


%extend TopoDS_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_Shell *
*********************/
class TopoDS_Shell : public TopoDS_Shape {
	public:
		/****************** TopoDS_Shell ******************/
		/**** md5 signature: e86f38971b810d1bc2e49dcbd1f86083 ****/
		%feature("compactdefaultargs") TopoDS_Shell;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an undefined shell.
") TopoDS_Shell;
		 TopoDS_Shell();

};


%extend TopoDS_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_Solid *
*********************/
class TopoDS_Solid : public TopoDS_Shape {
	public:
		/****************** TopoDS_Solid ******************/
		/**** md5 signature: aef7a16add6d43f5c6e263c45c82e991 ****/
		%feature("compactdefaultargs") TopoDS_Solid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an undefined solid.
") TopoDS_Solid;
		 TopoDS_Solid();

};


%extend TopoDS_Solid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TopoDS_TCompSolid *
**************************/
class TopoDS_TCompSolid : public TopoDS_TShape {
	public:
		/****************** TopoDS_TCompSolid ******************/
		/**** md5 signature: dde6fde09a50aec4102650f73db08af1 ****/
		%feature("compactdefaultargs") TopoDS_TCompSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tcompsolid.
") TopoDS_TCompSolid;
		 TopoDS_TCompSolid();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns an empty tcompsolid.
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns compsolid.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TCompSolid)

%extend TopoDS_TCompSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TopoDS_TCompound *
*************************/
class TopoDS_TCompound : public TopoDS_TShape {
	public:
		/****************** TopoDS_TCompound ******************/
		/**** md5 signature: c02912086778405962c4faf51a73b978 ****/
		%feature("compactdefaultargs") TopoDS_TCompound;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tcompound.
") TopoDS_TCompound;
		 TopoDS_TCompound();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns an empty tcompound.
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns compound.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TCompound)

%extend TopoDS_TCompound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_TEdge *
*********************/
%nodefaultctor TopoDS_TEdge;
class TopoDS_TEdge : public TopoDS_TShape {
	public:
		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns edge.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TEdge)

%extend TopoDS_TEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_TFace *
*********************/
class TopoDS_TFace : public TopoDS_TShape {
	public:
		/****************** TopoDS_TFace ******************/
		/**** md5 signature: 242b056e1964f0687fd9eb7d915dc8a2 ****/
		%feature("compactdefaultargs") TopoDS_TFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tface.
") TopoDS_TFace;
		 TopoDS_TFace();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 3d9756f12a98e8eef17d86b0c132771f ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns an empty tface.
") EmptyCopy;
		virtual opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns face.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TFace)

%extend TopoDS_TFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TopoDS_TShell *
**********************/
class TopoDS_TShell : public TopoDS_TShape {
	public:
		/****************** TopoDS_TShell ******************/
		/**** md5 signature: 96a92473ca9512bdd0b350ad3919d8bc ****/
		%feature("compactdefaultargs") TopoDS_TShell;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tshell.
") TopoDS_TShell;
		 TopoDS_TShell();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns an empty tshell.
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns shell.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TShell)

%extend TopoDS_TShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TopoDS_TSolid *
**********************/
class TopoDS_TSolid : public TopoDS_TShape {
	public:
		/****************** TopoDS_TSolid ******************/
		/**** md5 signature: f5858256cfaf5be35c46e46aff7ef278 ****/
		%feature("compactdefaultargs") TopoDS_TSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tsolid.
") TopoDS_TSolid;
		 TopoDS_TSolid();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns an empty tsolid.
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns solid.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TSolid)

%extend TopoDS_TSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TopoDS_TVertex *
***********************/
%nodefaultctor TopoDS_TVertex;
class TopoDS_TVertex : public TopoDS_TShape {
	public:
		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns vertex.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TVertex)

%extend TopoDS_TVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_TWire *
*********************/
class TopoDS_TWire : public TopoDS_TShape {
	public:
		/****************** TopoDS_TWire ******************/
		/**** md5 signature: bd363cb3b3685f54b42b32d114bf96b9 ****/
		%feature("compactdefaultargs") TopoDS_TWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty twire.
") TopoDS_TWire;
		 TopoDS_TWire();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns an empty twire.
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns wire.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TWire)

%extend TopoDS_TWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TopoDS_Vertex *
**********************/
class TopoDS_Vertex : public TopoDS_Shape {
	public:
		%feature("autodoc", "1");
		TopoDS_Vertex(const TopoDS_Vertex arg0);
		/****************** TopoDS_Vertex ******************/
		/**** md5 signature: a529b84382b7576bf953dad316a4b27f ****/
		%feature("compactdefaultargs") TopoDS_Vertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
Undefined vertex.
") TopoDS_Vertex;
		 TopoDS_Vertex();

};


%extend TopoDS_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class TopoDS_Wire *
********************/
class TopoDS_Wire : public TopoDS_Shape {
	public:
		/****************** TopoDS_Wire ******************/
		/**** md5 signature: 5bad3ab78b3030254c7036e91e02efc6 ****/
		%feature("compactdefaultargs") TopoDS_Wire;
		%feature("autodoc", "Return
-------
None

Description
-----------
Undefined wire.
") TopoDS_Wire;
		 TopoDS_Wire();

};


%extend TopoDS_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def topods_CompSolid(*args):
	return topods.CompSolid(*args)

@deprecated
def topods_CompSolid(*args):
	return topods.CompSolid(*args)

@deprecated
def topods_Compound(*args):
	return topods.Compound(*args)

@deprecated
def topods_Compound(*args):
	return topods.Compound(*args)

@deprecated
def topods_Edge(*args):
	return topods.Edge(*args)

@deprecated
def topods_Edge(*args):
	return topods.Edge(*args)

@deprecated
def topods_Face(*args):
	return topods.Face(*args)

@deprecated
def topods_Face(*args):
	return topods.Face(*args)

@deprecated
def topods_Shell(*args):
	return topods.Shell(*args)

@deprecated
def topods_Shell(*args):
	return topods.Shell(*args)

@deprecated
def topods_Solid(*args):
	return topods.Solid(*args)

@deprecated
def topods_Solid(*args):
	return topods.Solid(*args)

@deprecated
def topods_Vertex(*args):
	return topods.Vertex(*args)

@deprecated
def topods_Vertex(*args):
	return topods.Vertex(*args)

@deprecated
def topods_Wire(*args):
	return topods.Wire(*args)

@deprecated
def topods_Wire(*args):
	return topods.Wire(*args)

@deprecated
def TopoDS_AlertAttribute_Send(*args):
	return TopoDS_AlertAttribute.Send(*args)

}
