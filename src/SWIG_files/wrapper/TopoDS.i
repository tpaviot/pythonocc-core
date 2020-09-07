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
%define TOPODSDOCSTRING
"TopoDS module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topods.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<TopoDS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
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
%import TopAbs.i
%import TopLoc.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
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
%template(TopoDS_ListIteratorOfListOfShape) NCollection_TListIterator<TopoDS_Shape>;
%template(TopoDS_ListOfShape) NCollection_List<TopoDS_Shape>;

%extend NCollection_List<TopoDS_Shape> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_List<TopoDS_Shape>::Iterator TopoDS_ListIteratorOfListOfShape;
typedef NCollection_List<TopoDS_Shape> TopoDS_ListOfShape;
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
		%feature("autodoc", "Casts shape s to the more specialized return type, compsolid. exceptions standard_typemismatch if s cannot be cast to this return type.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_CompSolid
") CompSolid;
		static const TopoDS_CompSolid CompSolid(const TopoDS_Shape & S);

		/****************** CompSolid ******************/
		/**** md5 signature: acac3e26b4f9eaee939ae767dc905732 ****/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TopoDS_Shape

Returns
-------
TopoDS_CompSolid
") CompSolid;
		static TopoDS_CompSolid CompSolid(TopoDS_Shape &);

		/****************** Compound ******************/
		/**** md5 signature: c17cf0d09b6ccab9c17dc865a09c7150 ****/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "Casts shape s to the more specialized return type, compound. exceptions standard_typemismatch if s cannot be cast to this return type.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Compound
") Compound;
		static const TopoDS_Compound Compound(const TopoDS_Shape & S);

		/****************** Compound ******************/
		/**** md5 signature: bbe6e136825d27af4ce8ba843aa4a44e ****/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TopoDS_Shape

Returns
-------
TopoDS_Compound
") Compound;
		static TopoDS_Compound Compound(TopoDS_Shape &);

		/****************** Edge ******************/
		/**** md5 signature: 2efe03945bfb23dc595529d700df79fe ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Casts shape s to the more specialized return type, edge exceptions standard_typemismatch if s cannot be cast to this return type.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Edge
") Edge;
		static const TopoDS_Edge Edge(const TopoDS_Shape & S);

		/****************** Edge ******************/
		/**** md5 signature: 605fbe185d4371720726023645d12b9e ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TopoDS_Shape

Returns
-------
TopoDS_Edge
") Edge;
		static TopoDS_Edge Edge(TopoDS_Shape &);

		/****************** Face ******************/
		/**** md5 signature: fc38e2ff501b643c83b607450ae60258 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Casts shape s to the more specialized return type, face. exceptions standard_typemismatch if s cannot be cast to this return type.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Face
") Face;
		static const TopoDS_Face Face(const TopoDS_Shape & S);

		/****************** Face ******************/
		/**** md5 signature: 97d264774f3d915b324d2b5d62bfb31e ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TopoDS_Shape

Returns
-------
TopoDS_Face
") Face;
		static TopoDS_Face Face(TopoDS_Shape &);

		/****************** Shell ******************/
		/**** md5 signature: dfadc1f5af3f5b4c35af960076bc47d2 ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Casts shape s to the more specialized return type, shell. exceptions standard_typemismatch if s cannot be cast to this return type.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shell
") Shell;
		static const TopoDS_Shell Shell(const TopoDS_Shape & S);

		/****************** Shell ******************/
		/**** md5 signature: 5d7348478377e29d3d007b81777cc236 ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TopoDS_Shape

Returns
-------
TopoDS_Shell
") Shell;
		static TopoDS_Shell Shell(TopoDS_Shape &);

		/****************** Solid ******************/
		/**** md5 signature: 53ff4c77d3412e4bb8f19ba5e83f838c ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Casts shape s to the more specialized return type, solid. exceptions standard_typemismatch if s cannot be cast to this return type.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Solid
") Solid;
		static const TopoDS_Solid Solid(const TopoDS_Shape & S);

		/****************** Solid ******************/
		/**** md5 signature: e47476ce6c435c36e53fa880bf6bb8e3 ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TopoDS_Shape

Returns
-------
TopoDS_Solid
") Solid;
		static TopoDS_Solid Solid(TopoDS_Shape &);

		/****************** Vertex ******************/
		/**** md5 signature: 21ffb745f1245cff3cbd88e6c40f3c0b ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Basic tool to access the data structure. casts shape s to the more specialized return type, vertex. exceptions standard_typemismatch if s cannot be cast to this return type.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Vertex
") Vertex;
		static const TopoDS_Vertex Vertex(const TopoDS_Shape & S);

		/****************** Vertex ******************/
		/**** md5 signature: 80abea55e3497029b89e57d1c21c315c ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TopoDS_Shape

Returns
-------
TopoDS_Vertex
") Vertex;
		static TopoDS_Vertex Vertex(TopoDS_Shape &);

		/****************** Wire ******************/
		/**** md5 signature: 108068a348cc0d726ab22196f451f319 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Casts shape s to the more specialized return type, wire. exceptions standard_typemismatch if s cannot be cast to this return type.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Wire
") Wire;
		static const TopoDS_Wire Wire(const TopoDS_Shape & S);

		/****************** Wire ******************/
		/**** md5 signature: 0f0c46a4e1cce27ede9c36f04aa5032d ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TopoDS_Shape

Returns
-------
TopoDS_Wire
") Wire;
		static TopoDS_Wire Wire(TopoDS_Shape &);

};


%extend TopoDS {
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
		%feature("autodoc", "Constructor with shape argument.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") TopoDS_AlertWithShape;
		 TopoDS_AlertWithShape(const TopoDS_Shape & theShape);

		/****************** GetShape ******************/
		/**** md5 signature: 7c167c51f2939d15d5bfddc807114b00 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Returns contained shape.

Returns
-------
TopoDS_Shape
") GetShape;
		const TopoDS_Shape GetShape();

		/****************** Merge ******************/
		/**** md5 signature: 35843034c2fcb7185666677c75445acd ****/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "Returns false.

Parameters
----------
theTarget: Message_Alert

Returns
-------
bool
") Merge;
		virtual Standard_Boolean Merge(const opencascade::handle<Message_Alert> & theTarget);

		/****************** SetShape ******************/
		/**** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets the shape.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****************** SupportsMerge ******************/
		/**** md5 signature: 45abe0601cddac599cb8c2c1cbfefd85 ****/
		%feature("compactdefaultargs") SupportsMerge;
		%feature("autodoc", "Returns false.

Returns
-------
bool
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
		%feature("autodoc", "Add the shape c in the shape s. exceptions - topods_frozenshape if s is not free and cannot be modified. - topods__uncompatibleshapes if s and c are not compatible.

Parameters
----------
S: TopoDS_Shape
C: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(TopoDS_Shape & S, const TopoDS_Shape & C);

		/****************** MakeCompSolid ******************/
		/**** md5 signature: 2779417f1bd118d72864dd49941e3476 ****/
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "Make an empty composite solid.

Parameters
----------
C: TopoDS_CompSolid

Returns
-------
None
") MakeCompSolid;
		void MakeCompSolid(TopoDS_CompSolid & C);

		/****************** MakeCompound ******************/
		/**** md5 signature: 8ef30e3aeaa1e039903e37c7eb6f227a ****/
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "Make an empty compound.

Parameters
----------
C: TopoDS_Compound

Returns
-------
None
") MakeCompound;
		void MakeCompound(TopoDS_Compound & C);

		/****************** MakeShell ******************/
		/**** md5 signature: 2854985e778e4f5296d3dcce3926dae9 ****/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "Make an empty shell.

Parameters
----------
S: TopoDS_Shell

Returns
-------
None
") MakeShell;
		void MakeShell(TopoDS_Shell & S);

		/****************** MakeSolid ******************/
		/**** md5 signature: 72c61c4761a422ab569bc3077fd4e17b ****/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "Make a solid covering the whole 3d space.

Parameters
----------
S: TopoDS_Solid

Returns
-------
None
") MakeSolid;
		void MakeSolid(TopoDS_Solid & S);

		/****************** MakeWire ******************/
		/**** md5 signature: a7807363bff6d0d52ee9e63114e705f0 ****/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "Make an empty wire.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") MakeWire;
		void MakeWire(TopoDS_Wire & W);

		/****************** Remove ******************/
		/**** md5 signature: 1aed09a4ee44dda7c9c996d82ce4d414 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove the shape c from the shape s. exceptions topods_frozenshape if s is frozen and cannot be modified.

Parameters
----------
S: TopoDS_Shape
C: TopoDS_Shape

Returns
-------
None
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
		%feature("autodoc", "Constructs an empty shape object.

Returns
-------
None
") TopoDS_HShape;
		 TopoDS_HShape();

		/****************** TopoDS_HShape ******************/
		/**** md5 signature: 12d11e8b4cb229fa48747aee89017cfd ****/
		%feature("compactdefaultargs") TopoDS_HShape;
		%feature("autodoc", "Constructs a shape object defined by the shape ashape.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
None
") TopoDS_HShape;
		 TopoDS_HShape(const TopoDS_Shape & aShape);

		/****************** ChangeShape ******************/
		/**** md5 signature: 465c12175fb924e02c35f2de6caf5b49 ****/
		%feature("compactdefaultargs") ChangeShape;
		%feature("autodoc", "Exchanges the topods_shape object defining this shape for another one referencing the same underlying shape accesses the list of shapes within the underlying shape referenced by the topods_shape object. returns a reference to a topods_shape based on this shape. the topods_shape can be modified.

Returns
-------
TopoDS_Shape
") ChangeShape;
		TopoDS_Shape ChangeShape();

		/****************** Shape ******************/
		/**** md5 signature: 2159495cdca23673df5e9a9f681faa06 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Loads this shape with the shape ashape.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
None
") Shape;
		void Shape(const TopoDS_Shape & aShape);

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns a reference to a constant topods_shape based on this shape.

Returns
-------
TopoDS_Shape
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
		/**** md5 signature: ac26a9b0545000f39f1f87020b9c6d8f ****/
		%feature("compactdefaultargs") TopoDS_Iterator;
		%feature("autodoc", "Creates an empty iterator.

Returns
-------
None
") TopoDS_Iterator;
		 TopoDS_Iterator();

		/****************** TopoDS_Iterator ******************/
		/**** md5 signature: 93466b331bcaf0b64fd63be7d5336b8a ****/
		%feature("compactdefaultargs") TopoDS_Iterator;
		%feature("autodoc", "Creates an iterator on <s> sub-shapes. note: - if cumori is true, the function composes all sub-shapes with the orientation of s. - if cumloc is true, the function multiplies all sub-shapes by the location of s, i.e. it applies to each sub-shape the transformation that is associated with s.

Parameters
----------
S: TopoDS_Shape
cumOri: bool,optional
	default value is Standard_True
cumLoc: bool,optional
	default value is Standard_True

Returns
-------
None
") TopoDS_Iterator;
		 TopoDS_Iterator(const TopoDS_Shape & S, const Standard_Boolean cumOri = Standard_True, const Standard_Boolean cumLoc = Standard_True);

		/****************** Initialize ******************/
		/**** md5 signature: eae51e6c922353320397faf3e14bdc47 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes this iterator with shape s. note: - if cumori is true, the function composes all sub-shapes with the orientation of s. - if cumloc is true, the function multiplies all sub-shapes by the location of s, i.e. it applies to each sub-shape the transformation that is associated with s.

Parameters
----------
S: TopoDS_Shape
cumOri: bool,optional
	default value is Standard_True
cumLoc: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Shape & S, const Standard_Boolean cumOri = Standard_True, const Standard_Boolean cumLoc = Standard_True);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is another sub-shape in the shape which this iterator is scanning.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves on to the next sub-shape in the shape which this iterator is scanning. exceptions standard_nomoreobject if there are no more sub-shapes in the shape.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current sub-shape in the shape which this iterator is scanning. exceptions standard_nosuchobject if there is no current sub-shape.

Returns
-------
TopoDS_Shape
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
		%feature("autodoc", "Creates a null shape referring to nothing.

Returns
-------
None
") TopoDS_Shape;
		 TopoDS_Shape();

		/****************** Checked ******************/
		/**** md5 signature: a8b84838b155e0f2c75ceed32947100e ****/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "Returns the checked flag.

Returns
-------
bool
") Checked;
		Standard_Boolean Checked();

		/****************** Checked ******************/
		/**** md5 signature: 6f7fe475bfb2ebdcad97ddf64dd0534c ****/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "Sets the checked flag.

Parameters
----------
theIsChecked: bool

Returns
-------
None
") Checked;
		void Checked(Standard_Boolean theIsChecked);

		/****************** Closed ******************/
		/**** md5 signature: f94551c898fe323903f1d14861bbe901 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns the closedness flag.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** Closed ******************/
		/**** md5 signature: ff8619fc236f7435a92bdca9a0d16193 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Sets the closedness flag.

Parameters
----------
theIsClosed: bool

Returns
-------
None
") Closed;
		void Closed(Standard_Boolean theIsClosed);

		/****************** Complement ******************/
		/**** md5 signature: 5445a2200c21648250c6106947f9d63d ****/
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "Complements the orientation, using the complement method from the topabs package.

Returns
-------
None
") Complement;
		void Complement();

		/****************** Complemented ******************/
		/**** md5 signature: c44b570f0e4ab4f0fd933e748a5584b2 ****/
		%feature("compactdefaultargs") Complemented;
		%feature("autodoc", "Returns a shape similar to <self> with the orientation complemented, using the complement method from the topabs package.

Returns
-------
TopoDS_Shape
") Complemented;
		TopoDS_Shape Complemented();

		/****************** Compose ******************/
		/**** md5 signature: b00257faf0ae2c3380d408ebd84e41ef ****/
		%feature("compactdefaultargs") Compose;
		%feature("autodoc", "Updates the shape orientation by composition with theorient, using the compose method from the topabs package.

Parameters
----------
theOrient: TopAbs_Orientation

Returns
-------
None
") Compose;
		void Compose(TopAbs_Orientation theOrient);

		/****************** Composed ******************/
		/**** md5 signature: df9ee32a8c057489f0e1e7b4c69ff1ba ****/
		%feature("compactdefaultargs") Composed;
		%feature("autodoc", "Returns a shape similar to <self> with the orientation composed with theorient, using the compose method from the topabs package.

Parameters
----------
theOrient: TopAbs_Orientation

Returns
-------
TopoDS_Shape
") Composed;
		TopoDS_Shape Composed(TopAbs_Orientation theOrient);

		/****************** Convex ******************/
		/**** md5 signature: efe9b0c153a7f00d69634882071b034b ****/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "Returns the convexness flag.

Returns
-------
bool
") Convex;
		Standard_Boolean Convex();

		/****************** Convex ******************/
		/**** md5 signature: 2680b89fa5162759d8c7800c264f8f42 ****/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "Sets the convexness flag.

Parameters
----------
theIsConvex: bool

Returns
-------
None
") Convex;
		void Convex(Standard_Boolean theIsConvex);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** EmptyCopied ******************/
		/**** md5 signature: f9424d26c99f755bc5579214a9cd7453 ****/
		%feature("compactdefaultargs") EmptyCopied;
		%feature("autodoc", "Returns a new shape with the same orientation and location and a new tshape with the same geometry and no sub-shapes.

Returns
-------
TopoDS_Shape
") EmptyCopied;
		TopoDS_Shape EmptyCopied();

		/****************** EmptyCopy ******************/
		/**** md5 signature: a7df0c34e1cfde304e21809ef4e73476 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Replace <self> by a new shape with the same orientation and location and a new tshape with the same geometry and no sub-shapes.

Returns
-------
None
") EmptyCopy;
		void EmptyCopy();

		/****************** Free ******************/
		/**** md5 signature: 0f8a4dc099aac04a52ab47593952a756 ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Returns the free flag.

Returns
-------
bool
") Free;
		Standard_Boolean Free();

		/****************** Free ******************/
		/**** md5 signature: fd04bdf9a77ff277e8a9c89a73733eba ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Sets the free flag.

Parameters
----------
theIsFree: bool

Returns
-------
None
") Free;
		void Free(Standard_Boolean theIsFree);

		/****************** HashCode ******************/
		/**** md5 signature: 63d1f963e092468b3b680fe64f4cfd8b ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Returns a hashed value denoting <self>. this value is in the range [1, theupperbound]. it is computed from the tshape and the location. the orientation is not used. @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theUpperBound: int

Returns
-------
int
") HashCode;
		Standard_Integer HashCode(Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };

		/****************** Infinite ******************/
		/**** md5 signature: 9f918e9fa7267ec7961ed78dd974f109 ****/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Returns the infinity flag.

Returns
-------
bool
") Infinite;
		Standard_Boolean Infinite();

		/****************** Infinite ******************/
		/**** md5 signature: a2693ee14462a14ca45ed7b01f364159 ****/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Sets the infinity flag.

Parameters
----------
theIsInfinite: bool

Returns
-------
None
") Infinite;
		void Infinite(Standard_Boolean theIsInfinite);

		/****************** IsEqual ******************/
		/**** md5 signature: 9fcaa9df016676d3d7591d1fe151db2f ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if two shapes are equal, i.e. if they share the same tshape with the same locations and orientations.

Parameters
----------
theOther: TopoDS_Shape

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const TopoDS_Shape & theOther);

		/****************** IsNotEqual ******************/
		/**** md5 signature: 1b49814ef251363cd9a95492cfdef6a8 ****/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "Negation of the isequal method.

Parameters
----------
theOther: TopoDS_Shape

Returns
-------
bool
") IsNotEqual;
		Standard_Boolean IsNotEqual(const TopoDS_Shape & theOther);

		/****************** IsNull ******************/
		/**** md5 signature: a86f99f80f18afba475b30f6c686c6c8 ****/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Returns true if this shape is null. in other words, it references no underlying shape with the potential to be given a location and an orientation.

Returns
-------
bool
") IsNull;
		Standard_Boolean IsNull();

		/****************** IsPartner ******************/
		/**** md5 signature: 4a5dce39f42efa7247850500468bd032 ****/
		%feature("compactdefaultargs") IsPartner;
		%feature("autodoc", "Returns true if two shapes are partners, i.e. if they share the same tshape. locations and orientations may differ.

Parameters
----------
theOther: TopoDS_Shape

Returns
-------
bool
") IsPartner;
		Standard_Boolean IsPartner(const TopoDS_Shape & theOther);

		/****************** IsSame ******************/
		/**** md5 signature: ab65e9443b90d3a756824c7228ce0bb9 ****/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "Returns true if two shapes are same, i.e. if they share the same tshape with the same locations. orientations may differ.

Parameters
----------
theOther: TopoDS_Shape

Returns
-------
bool
") IsSame;
		Standard_Boolean IsSame(const TopoDS_Shape & theOther);

		/****************** Located ******************/
		/**** md5 signature: a25465c897f6848d7c1167dfb7b66062 ****/
		%feature("compactdefaultargs") Located;
		%feature("autodoc", "Returns a shape similar to <self> with the local coordinate system set to <loc>.

Parameters
----------
theLoc: TopLoc_Location

Returns
-------
TopoDS_Shape
") Located;
		TopoDS_Shape Located(const TopLoc_Location & theLoc);

		/****************** Location ******************/
		/**** md5 signature: 57e4db9c8a7a08cffc827dc50be227c9 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the shape local coordinate system.

Returns
-------
TopLoc_Location
") Location;
		const TopLoc_Location & Location();

		/****************** Location ******************/
		/**** md5 signature: 7dad156a2ecc5319358e11a9fba30480 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Sets the shape local coordinate system.

Parameters
----------
theLoc: TopLoc_Location

Returns
-------
None
") Location;
		void Location(const TopLoc_Location & theLoc);

		/****************** Locked ******************/
		/**** md5 signature: a47aa902e0d0df6fdbe782c3c7f2d1b5 ****/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "Returns the locked flag.

Returns
-------
bool
") Locked;
		Standard_Boolean Locked();

		/****************** Locked ******************/
		/**** md5 signature: e4e0d1f6c3d0b8b33754ee4ca7b4ca88 ****/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "Sets the locked flag.

Parameters
----------
theIsLocked: bool

Returns
-------
None
") Locked;
		void Locked(Standard_Boolean theIsLocked);

		/****************** Modified ******************/
		/**** md5 signature: 23f96a9ab7f36b9d00a752024e065b1e ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the modification flag.

Returns
-------
bool
") Modified;
		Standard_Boolean Modified();

		/****************** Modified ******************/
		/**** md5 signature: 03454af83e34288052522e1c873bb443 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Sets the modification flag.

Parameters
----------
theIsModified: bool

Returns
-------
None
") Modified;
		void Modified(Standard_Boolean theIsModified);

		/****************** Move ******************/
		/**** md5 signature: 4e6861a9800338674d407bb4a78df69f ****/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Multiplies the shape location by theposition.

Parameters
----------
thePosition: TopLoc_Location

Returns
-------
None
") Move;
		void Move(const TopLoc_Location & thePosition);

		/****************** Moved ******************/
		/**** md5 signature: 39f007d8497487ec0d169e6006debb60 ****/
		%feature("compactdefaultargs") Moved;
		%feature("autodoc", "Returns a shape similar to <self> with a location multiplied by theposition.

Parameters
----------
thePosition: TopLoc_Location

Returns
-------
TopoDS_Shape
") Moved;
		TopoDS_Shape Moved(const TopLoc_Location & thePosition);

		/****************** NbChildren ******************/
		/**** md5 signature: 112820d06ee986e20c4479ba5bfe3404 ****/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Returns the number of direct sub-shapes (children). @sa topods_iterator for accessing sub-shapes.

Returns
-------
int
") NbChildren;
		Standard_Integer NbChildren();

		/****************** Nullify ******************/
		/**** md5 signature: bf958a8fb495dbcd033238b0232a20bc ****/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Destroys the reference to the underlying shape stored in this shape. as a result, this shape becomes null.

Returns
-------
None
") Nullify;
		void Nullify();

		/****************** Orientable ******************/
		/**** md5 signature: a4c7ff5e7b547070b53b5622df6b7763 ****/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "Returns the orientability flag.

Returns
-------
bool
") Orientable;
		Standard_Boolean Orientable();

		/****************** Orientable ******************/
		/**** md5 signature: 53dfd63caccd3cd09b3be20b223481d7 ****/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "Sets the orientability flag.

Parameters
----------
theIsOrientable: bool

Returns
-------
None
") Orientable;
		void Orientable(const Standard_Boolean theIsOrientable);

		/****************** Orientation ******************/
		/**** md5 signature: 03010048da537511bfd11160d3c898dc ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the shape orientation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Orientation ******************/
		/**** md5 signature: 0d1a798250eed02f47b6d075b65e005b ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Sets the shape orientation.

Parameters
----------
theOrient: TopAbs_Orientation

Returns
-------
None
") Orientation;
		void Orientation(TopAbs_Orientation theOrient);

		/****************** Oriented ******************/
		/**** md5 signature: 6dd69632c2942d8dbfe6c7264ba4a0aa ****/
		%feature("compactdefaultargs") Oriented;
		%feature("autodoc", "Returns a shape similar to <self> with the orientation set to <or>.

Parameters
----------
theOrient: TopAbs_Orientation

Returns
-------
TopoDS_Shape
") Oriented;
		TopoDS_Shape Oriented(TopAbs_Orientation theOrient);

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the orientation, using the reverse method from the topabs package.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 5451f523177e720649fdb5522c1ebbf7 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Returns a shape similar to <self> with the orientation reversed, using the reverse method from the topabs package.

Returns
-------
TopoDS_Shape
") Reversed;
		TopoDS_Shape Reversed();

		/****************** ShapeType ******************/
		/**** md5 signature: 785120710559c16ce1f4c926b5d434aa ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns the value of the topabs_shapeenum enumeration that corresponds to this shape, for example vertex, edge, and so on. exceptions standard_nullobject if this shape is null.

Returns
-------
TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** TShape ******************/
		/**** md5 signature: 039ebb52b4f71627e28e118c3a56ae78 ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "Returns a handle to the actual shape implementation.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		const opencascade::handle<TopoDS_TShape> TShape();

		/****************** TShape ******************/
		/**** md5 signature: e351e596b1be4ca939b9ce9c975bec7b ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTShape: TopoDS_TShape

Returns
-------
None
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
%pythoncode {
	def __getstate__(self):
		from .BRepTools import BRepTools_ShapeSet
		ss = BRepTools_ShapeSet()
		ss.Add(self)
		str_shape = ss.WriteToString()
		indx = ss.Locations().Index(self.Location())
		return str_shape, indx
	def __setstate__(self, state):
		from .BRepTools import BRepTools_ShapeSet
		topods_str, indx = state
		ss = BRepTools_ShapeSet()
		ss.ReadFromString(topods_str)
		the_shape = ss.Shape(ss.NbShapes())
		location = ss.Locations().Location(indx)
		the_shape.Location(location)
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
		%feature("autodoc", "Returns the checked flag.

Returns
-------
bool
") Checked;
		Standard_Boolean Checked();

		/****************** Checked ******************/
		/**** md5 signature: 6f7fe475bfb2ebdcad97ddf64dd0534c ****/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "Sets the checked flag.

Parameters
----------
theIsChecked: bool

Returns
-------
None
") Checked;
		void Checked(Standard_Boolean theIsChecked);

		/****************** Closed ******************/
		/**** md5 signature: f94551c898fe323903f1d14861bbe901 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns the closedness flag.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** Closed ******************/
		/**** md5 signature: ff8619fc236f7435a92bdca9a0d16193 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Sets the closedness flag.

Parameters
----------
theIsClosed: bool

Returns
-------
None
") Closed;
		void Closed(Standard_Boolean theIsClosed);

		/****************** Convex ******************/
		/**** md5 signature: efe9b0c153a7f00d69634882071b034b ****/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "Returns the convexness flag.

Returns
-------
bool
") Convex;
		Standard_Boolean Convex();

		/****************** Convex ******************/
		/**** md5 signature: 2680b89fa5162759d8c7800c264f8f42 ****/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "Sets the convexness flag.

Parameters
----------
theIsConvex: bool

Returns
-------
None
") Convex;
		void Convex(Standard_Boolean theIsConvex);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** EmptyCopy ******************/
		/**** md5 signature: de08b6aae09d9de59b334a4b6c880feb ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns a copy of the tshape with no sub-shapes.

Returns
-------
opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		virtual opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** Free ******************/
		/**** md5 signature: 0f8a4dc099aac04a52ab47593952a756 ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Returns the free flag.

Returns
-------
bool
") Free;
		Standard_Boolean Free();

		/****************** Free ******************/
		/**** md5 signature: fd04bdf9a77ff277e8a9c89a73733eba ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Sets the free flag.

Parameters
----------
theIsFree: bool

Returns
-------
None
") Free;
		void Free(Standard_Boolean theIsFree);

		/****************** Infinite ******************/
		/**** md5 signature: 9f918e9fa7267ec7961ed78dd974f109 ****/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Returns the infinity flag.

Returns
-------
bool
") Infinite;
		Standard_Boolean Infinite();

		/****************** Infinite ******************/
		/**** md5 signature: a2693ee14462a14ca45ed7b01f364159 ****/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Sets the infinity flag.

Parameters
----------
theIsInfinite: bool

Returns
-------
None
") Infinite;
		void Infinite(Standard_Boolean theIsInfinite);

		/****************** Locked ******************/
		/**** md5 signature: a47aa902e0d0df6fdbe782c3c7f2d1b5 ****/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "Returns the locked flag.

Returns
-------
bool
") Locked;
		Standard_Boolean Locked();

		/****************** Locked ******************/
		/**** md5 signature: e4e0d1f6c3d0b8b33754ee4ca7b4ca88 ****/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "Sets the locked flag.

Parameters
----------
theIsLocked: bool

Returns
-------
None
") Locked;
		void Locked(Standard_Boolean theIsLocked);

		/****************** Modified ******************/
		/**** md5 signature: 23f96a9ab7f36b9d00a752024e065b1e ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the modification flag.

Returns
-------
bool
") Modified;
		Standard_Boolean Modified();

		/****************** Modified ******************/
		/**** md5 signature: 03454af83e34288052522e1c873bb443 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Sets the modification flag.

Parameters
----------
theIsModified: bool

Returns
-------
None
") Modified;
		void Modified(Standard_Boolean theIsModified);

		/****************** NbChildren ******************/
		/**** md5 signature: 112820d06ee986e20c4479ba5bfe3404 ****/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Returns the number of direct sub-shapes (children). @sa topods_iterator for accessing sub-shapes.

Returns
-------
int
") NbChildren;
		Standard_Integer NbChildren();

		/****************** Orientable ******************/
		/**** md5 signature: a4c7ff5e7b547070b53b5622df6b7763 ****/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "Returns the orientability flag.

Returns
-------
bool
") Orientable;
		Standard_Boolean Orientable();

		/****************** Orientable ******************/
		/**** md5 signature: 85ab9cd6de8af23c76a0b0e4dc4b2ac2 ****/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "Sets the orientability flag.

Parameters
----------
theIsOrientable: bool

Returns
-------
None
") Orientable;
		void Orientable(Standard_Boolean theIsOrientable);

		/****************** ShapeType ******************/
		/**** md5 signature: bc3cf16d2be321cde120394409d92805 ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns the type as a term of the shapeenum enum : vertex, edge, wire, face, ....

Returns
-------
TopAbs_ShapeEnum
") ShapeType;
		virtual TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TShape)

%extend TopoDS_TShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TopoDS_CompSolid *
*************************/
class TopoDS_CompSolid : public TopoDS_Shape {
	public:
		/****************** TopoDS_CompSolid ******************/
		/**** md5 signature: 81a2d394d7066c960d9b2c542e737183 ****/
		%feature("compactdefaultargs") TopoDS_CompSolid;
		%feature("autodoc", "Constructs an undefined compsolid.

Returns
-------
None
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
		/**** md5 signature: 8cbdc34d3d5ac0c9181f908949a30ec5 ****/
		%feature("compactdefaultargs") TopoDS_Compound;
		%feature("autodoc", "Constructs an undefined compound.

Returns
-------
None
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
		/**** md5 signature: 24f17faffc9220258aaf8f49f905587d ****/
		%feature("compactdefaultargs") TopoDS_Edge;
		%feature("autodoc", "Undefined edge.

Returns
-------
None
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
		/**** md5 signature: 8ea316a9eb86a247f40f1855b303da4a ****/
		%feature("compactdefaultargs") TopoDS_Face;
		%feature("autodoc", "Undefined face.

Returns
-------
None
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
		/**** md5 signature: 6c2c7afd029247018dcce6e7019961b6 ****/
		%feature("compactdefaultargs") TopoDS_Shell;
		%feature("autodoc", "Constructs an undefined shell.

Returns
-------
None
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
		/**** md5 signature: 27228574635e72d535f1813662c47439 ****/
		%feature("compactdefaultargs") TopoDS_Solid;
		%feature("autodoc", "Constructs an undefined solid.

Returns
-------
None
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
		%feature("autodoc", "Creates an empty tcompsolid.

Returns
-------
None
") TopoDS_TCompSolid;
		 TopoDS_TCompSolid();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty tcompsolid.

Returns
-------
opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns compsolid.

Returns
-------
TopAbs_ShapeEnum
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
		%feature("autodoc", "Creates an empty tcompound.

Returns
-------
None
") TopoDS_TCompound;
		 TopoDS_TCompound();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty tcompound.

Returns
-------
opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns compound.

Returns
-------
TopAbs_ShapeEnum
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
		%feature("autodoc", "Returns edge.

Returns
-------
TopAbs_ShapeEnum
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
		%feature("autodoc", "Creates an empty tface.

Returns
-------
None
") TopoDS_TFace;
		 TopoDS_TFace();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 3d9756f12a98e8eef17d86b0c132771f ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty tface.

Returns
-------
opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		virtual opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns face.

Returns
-------
TopAbs_ShapeEnum
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
		%feature("autodoc", "Creates an empty tshell.

Returns
-------
None
") TopoDS_TShell;
		 TopoDS_TShell();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty tshell.

Returns
-------
opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns shell.

Returns
-------
TopAbs_ShapeEnum
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
		%feature("autodoc", "Creates an empty tsolid.

Returns
-------
None
") TopoDS_TSolid;
		 TopoDS_TSolid();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty tsolid.

Returns
-------
opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns solid.

Returns
-------
TopAbs_ShapeEnum
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
		%feature("autodoc", "Returns vertex.

Returns
-------
TopAbs_ShapeEnum
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
		%feature("autodoc", "Creates an empty twire.

Returns
-------
None
") TopoDS_TWire;
		 TopoDS_TWire();

		/****************** EmptyCopy ******************/
		/**** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ****/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty twire.

Returns
-------
opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		/**** md5 signature: faceece8da45e6450f36fc31be8b3c6a ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns wire.

Returns
-------
TopAbs_ShapeEnum
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
		/**** md5 signature: 6e05aeb40aeec3c0acc661c2013c12a2 ****/
		%feature("compactdefaultargs") TopoDS_Vertex;
		%feature("autodoc", "Undefined vertex.

Returns
-------
None
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
		/**** md5 signature: 4ea4cbfc05e07a09a47af95d1f3de96b ****/
		%feature("compactdefaultargs") TopoDS_Wire;
		%feature("autodoc", "Undefined wire.

Returns
-------
None
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
