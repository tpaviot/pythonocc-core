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
%module (package="OCC") Extrema

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


%include Extrema_headers.i


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
typedef NCollection_UBTree <Standard_Integer , Bnd_Sphere> Extrema_UBTreeOfSphere;
typedef NCollection_UBTreeFiller <Standard_Integer , Bnd_Sphere> Extrema_UBTreeFillerOfSphere;
typedef NCollection_Handle <Extrema_UBTreeOfSphere> Extrema_HUBTreeOfSphere;
/* end typedefs declaration */

/* public enums */
enum Extrema_ElementType {
	Extrema_Node = 0,
	Extrema_UIsoEdge = 1,
	Extrema_VIsoEdge = 2,
	Extrema_Face = 3,
};

enum Extrema_ExtAlgo {
	Extrema_ExtAlgo_Grad = 0,
	Extrema_ExtAlgo_Tree = 1,
};

enum Extrema_ExtFlag {
	Extrema_ExtFlag_MIN = 0,
	Extrema_ExtFlag_MAX = 1,
	Extrema_ExtFlag_MINMAX = 2,
};

/* end public enums declaration */

%nodefaultctor Extrema_Array1OfPOnCurv;
class Extrema_Array1OfPOnCurv {
	public:
		%feature("compactdefaultargs") Extrema_Array1OfPOnCurv;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Extrema_Array1OfPOnCurv;
		 Extrema_Array1OfPOnCurv (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Extrema_Array1OfPOnCurv;
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnCurv &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Extrema_Array1OfPOnCurv;
		 Extrema_Array1OfPOnCurv (const Extrema_POnCurv & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv & V);
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
	:type Other: Extrema_Array1OfPOnCurv &
	:rtype: Extrema_Array1OfPOnCurv
") Assign;
		const Extrema_Array1OfPOnCurv & Assign (const Extrema_Array1OfPOnCurv & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array1OfPOnCurv &
	:rtype: Extrema_Array1OfPOnCurv
") operator =;
		const Extrema_Array1OfPOnCurv & operator = (const Extrema_Array1OfPOnCurv & Other);
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
	:type Value: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
};


%extend Extrema_Array1OfPOnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_Array1OfPOnCurv2d;
class Extrema_Array1OfPOnCurv2d {
	public:
		%feature("compactdefaultargs") Extrema_Array1OfPOnCurv2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Extrema_Array1OfPOnCurv2d;
		 Extrema_Array1OfPOnCurv2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Extrema_Array1OfPOnCurv2d;
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnCurv2d &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Extrema_Array1OfPOnCurv2d;
		 Extrema_Array1OfPOnCurv2d (const Extrema_POnCurv2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv2d & V);
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
	:type Other: Extrema_Array1OfPOnCurv2d &
	:rtype: Extrema_Array1OfPOnCurv2d
") Assign;
		const Extrema_Array1OfPOnCurv2d & Assign (const Extrema_Array1OfPOnCurv2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array1OfPOnCurv2d &
	:rtype: Extrema_Array1OfPOnCurv2d
") operator =;
		const Extrema_Array1OfPOnCurv2d & operator = (const Extrema_Array1OfPOnCurv2d & Other);
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
	:type Value: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
};


%extend Extrema_Array1OfPOnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_Array1OfPOnSurf;
class Extrema_Array1OfPOnSurf {
	public:
		%feature("compactdefaultargs") Extrema_Array1OfPOnSurf;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Extrema_Array1OfPOnSurf;
		 Extrema_Array1OfPOnSurf (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Extrema_Array1OfPOnSurf;
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnSurf &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Extrema_Array1OfPOnSurf;
		 Extrema_Array1OfPOnSurf (const Extrema_POnSurf & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurf & V);
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
	:type Other: Extrema_Array1OfPOnSurf &
	:rtype: Extrema_Array1OfPOnSurf
") Assign;
		const Extrema_Array1OfPOnSurf & Assign (const Extrema_Array1OfPOnSurf & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array1OfPOnSurf &
	:rtype: Extrema_Array1OfPOnSurf
") operator =;
		const Extrema_Array1OfPOnSurf & operator = (const Extrema_Array1OfPOnSurf & Other);
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
	:type Value: Extrema_POnSurf &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnSurf & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnSurf
") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnSurf
") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Index);
};


%extend Extrema_Array1OfPOnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_Array2OfPOnCurv;
class Extrema_Array2OfPOnCurv {
	public:
		%feature("compactdefaultargs") Extrema_Array2OfPOnCurv;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_Array2OfPOnCurv;
		 Extrema_Array2OfPOnCurv (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Extrema_Array2OfPOnCurv;
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnCurv &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_Array2OfPOnCurv;
		 Extrema_Array2OfPOnCurv (const Extrema_POnCurv & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnCurv &
	:rtype: Extrema_Array2OfPOnCurv
") Assign;
		const Extrema_Array2OfPOnCurv & Assign (const Extrema_Array2OfPOnCurv & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnCurv &
	:rtype: Extrema_Array2OfPOnCurv
") operator =;
		const Extrema_Array2OfPOnCurv & operator = (const Extrema_Array2OfPOnCurv & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend Extrema_Array2OfPOnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_Array2OfPOnCurv2d;
class Extrema_Array2OfPOnCurv2d {
	public:
		%feature("compactdefaultargs") Extrema_Array2OfPOnCurv2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_Array2OfPOnCurv2d;
		 Extrema_Array2OfPOnCurv2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Extrema_Array2OfPOnCurv2d;
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnCurv2d &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_Array2OfPOnCurv2d;
		 Extrema_Array2OfPOnCurv2d (const Extrema_POnCurv2d & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv2d & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnCurv2d &
	:rtype: Extrema_Array2OfPOnCurv2d
") Assign;
		const Extrema_Array2OfPOnCurv2d & Assign (const Extrema_Array2OfPOnCurv2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnCurv2d &
	:rtype: Extrema_Array2OfPOnCurv2d
") operator =;
		const Extrema_Array2OfPOnCurv2d & operator = (const Extrema_Array2OfPOnCurv2d & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend Extrema_Array2OfPOnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_Array2OfPOnSurf;
class Extrema_Array2OfPOnSurf {
	public:
		%feature("compactdefaultargs") Extrema_Array2OfPOnSurf;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_Array2OfPOnSurf;
		 Extrema_Array2OfPOnSurf (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Extrema_Array2OfPOnSurf;
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnSurf &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_Array2OfPOnSurf;
		 Extrema_Array2OfPOnSurf (const Extrema_POnSurf & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurf & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnSurf &
	:rtype: Extrema_Array2OfPOnSurf
") Assign;
		const Extrema_Array2OfPOnSurf & Assign (const Extrema_Array2OfPOnSurf & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnSurf &
	:rtype: Extrema_Array2OfPOnSurf
") operator =;
		const Extrema_Array2OfPOnSurf & operator = (const Extrema_Array2OfPOnSurf & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Extrema_POnSurf &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurf & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnSurf
") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnSurf
") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend Extrema_Array2OfPOnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_Array2OfPOnSurfParams;
class Extrema_Array2OfPOnSurfParams {
	public:
		%feature("compactdefaultargs") Extrema_Array2OfPOnSurfParams;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_Array2OfPOnSurfParams;
		 Extrema_Array2OfPOnSurfParams (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Extrema_Array2OfPOnSurfParams;
		%feature("autodoc", "	:param Item:
	:type Item: Extrema_POnSurfParams &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_Array2OfPOnSurfParams;
		 Extrema_Array2OfPOnSurfParams (const Extrema_POnSurfParams & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurfParams &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurfParams & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnSurfParams &
	:rtype: Extrema_Array2OfPOnSurfParams
") Assign;
		const Extrema_Array2OfPOnSurfParams & Assign (const Extrema_Array2OfPOnSurfParams & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_Array2OfPOnSurfParams &
	:rtype: Extrema_Array2OfPOnSurfParams
") operator =;
		const Extrema_Array2OfPOnSurfParams & operator = (const Extrema_Array2OfPOnSurfParams & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Extrema_POnSurfParams &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurfParams & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnSurfParams
") Value;
		const Extrema_POnSurfParams & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnSurfParams
") ChangeValue;
		Extrema_POnSurfParams & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend Extrema_Array2OfPOnSurfParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_CCLocFOfLocECC;
class Extrema_CCLocFOfLocECC : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC;
		%feature("autodoc", "	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECC;
		 Extrema_CCLocFOfLocECC (const Standard_Real thetol = 1.0e-10);
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECC;
		 Extrema_CCLocFOfLocECC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real thetol = 1.0e-10);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param C1:
	:type C1: Adaptor3d_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C1);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("compactdefaultargs") CurvePtr;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: math_Vector &
	:param theUlast:
	:type theUlast: math_Vector &
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%extend Extrema_CCLocFOfLocECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_CCLocFOfLocECC2d;
class Extrema_CCLocFOfLocECC2d : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC2d;
		%feature("autodoc", "	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECC2d;
		 Extrema_CCLocFOfLocECC2d (const Standard_Real thetol = 1.0e-10);
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC2d;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECC2d;
		 Extrema_CCLocFOfLocECC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real thetol = 1.0e-10);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor2d_Curve2d & C1);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("compactdefaultargs") CurvePtr;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: math_Vector &
	:param theUlast:
	:type theUlast: math_Vector &
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%extend Extrema_CCLocFOfLocECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Extrema_Curve2dTool {
	public:
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Adaptor2d_Curve2d & C,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const Adaptor2d_Curve2d & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") Period;
		static Standard_Real Period (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Adaptor2d_Curve2d & C,const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") D0;
		static void D0 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") D3;
		static void D3 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Adaptor2d_Curve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Adaptor2d_Curve2d & C,const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") Degree;
		static Standard_Integer Degree (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: bool
") IsRational;
		static Standard_Boolean IsRational (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") NbPoles;
		static Standard_Integer NbPoles (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") NbKnots;
		static Standard_Integer NbKnots (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Adaptor2d_Curve2d & C);
};


%extend Extrema_Curve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Extrema_CurveTool {
	public:
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (Adaptor3d_Curve & C,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param C:
	:type C: Adaptor3d_Curve &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (Adaptor3d_Curve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float
") Period;
		static Standard_Real Period (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Adaptor3d_Curve & C,const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Adaptor3d_Curve & C,const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Adaptor3d_Curve & C,const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Lin
") Line;
		static gp_Lin Line (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Circ
") Circle;
		static gp_Circ Circle (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Elips
") Ellipse;
		static gp_Elips Ellipse (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Parab
") Parabola;
		static gp_Parab Parabola (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: int
") Degree;
		static Standard_Integer Degree (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: bool
") IsRational;
		static Standard_Boolean IsRational (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: int
") NbPoles;
		static Standard_Integer NbPoles (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: int
") NbKnots;
		static Standard_Integer NbKnots (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: Handle_Geom_BezierCurve
") Bezier;
		static Handle_Geom_BezierCurve Bezier (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const Adaptor3d_Curve & C);
};


%extend Extrema_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ECC;
class Extrema_ECC {
	public:
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "	:rtype: None
") Extrema_ECC;
		 Extrema_ECC ();
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:rtype: None
") Extrema_ECC;
		 Extrema_ECC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2);
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:rtype: None
") Extrema_ECC;
		 Extrema_ECC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup);
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:rtype: None
") SetParams;
		void SetParams (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%extend Extrema_ECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ECC2d;
class Extrema_ECC2d {
	public:
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ECC2d;
		 Extrema_ECC2d ();
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_ECC2d;
		 Extrema_ECC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2);
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:rtype: None
") Extrema_ECC2d;
		 Extrema_ECC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup);
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:rtype: None
") SetParams;
		void SetParams (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%extend Extrema_ECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ELPCOfLocateExtPC;
class Extrema_ELPCOfLocateExtPC {
	public:
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P1,gp_Pnt & P2);
};


%extend Extrema_ELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ELPCOfLocateExtPC2d;
class Extrema_ELPCOfLocateExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P1,gp_Pnt2d & P2);
};


%extend Extrema_ELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_EPCOfELPCOfLocateExtPC;
class Extrema_EPCOfELPCOfLocateExtPC {
	public:
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
};


%extend Extrema_EPCOfELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_EPCOfELPCOfLocateExtPC2d;
class Extrema_EPCOfELPCOfLocateExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
};


%extend Extrema_EPCOfELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_EPCOfExtPC;
class Extrema_EPCOfExtPC {
	public:
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC ();
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
};


%extend Extrema_EPCOfExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_EPCOfExtPC2d;
class Extrema_EPCOfExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d ();
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
};


%extend Extrema_EPCOfExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtCC;
class Extrema_ExtCC {
	public:
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC;
		 Extrema_ExtCC (const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "	* It calculates all the distances.

	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC;
		 Extrema_ExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "	* It calculates all the distances.

	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC;
		 Extrema_ExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") SetRange;
		void SetRange (const Standard_Integer theRank,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Integer theRank,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the two curves are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the curve is a trimmed curve, dist11 is a square distance between the point on C1 of parameter FirstParameter and the point of parameter FirstParameter on C2.

	:param dist11:
	:type dist11: float &
	:param distP12:
	:type distP12: float &
	:param distP21:
	:type distP21: float &
	:param distP22:
	:type distP22: float &
	:param P11:
	:type P11: gp_Pnt
	:param P12:
	:type P12: gp_Pnt
	:param P21:
	:type P21: gp_Pnt
	:param P22:
	:type P22: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P11,gp_Pnt & P12,gp_Pnt & P21,gp_Pnt & P22);
};


%extend Extrema_ExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtCC2d;
class Extrema_ExtCC2d {
	public:
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d ();
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "	* It calculates all the distances.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "	* It calculates all the distances.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* initializes the fields.

	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the two curves are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the curve is a trimmed curve, dist11 is a square distance between the point on C1 of parameter FirstParameter and the point of parameter FirstParameter on C2.

	:param dist11:
	:type dist11: float &
	:param distP12:
	:type distP12: float &
	:param distP21:
	:type distP21: float &
	:param distP22:
	:type distP22: float &
	:param P11:
	:type P11: gp_Pnt2d
	:param P12:
	:type P12: gp_Pnt2d
	:param P21:
	:type P21: gp_Pnt2d
	:param P22:
	:type P22: gp_Pnt2d
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P11,gp_Pnt2d & P12,gp_Pnt2d & P21,gp_Pnt2d & P22);
};


%extend Extrema_ExtCC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtCS;
class Extrema_ExtCS {
	public:
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtCS;
		 Extrema_ExtCS ();
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "	* It calculates all the distances between C and S.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param TolC:
	:type TolC: float
	:param TolS:
	:type TolS: float
	:rtype: None
") Extrema_ExtCS;
		 Extrema_ExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real TolC,const Standard_Real TolS);
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "	* It calculates all the distances between C and S. UCinf and UCmax are the start and end parameters of the curve.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param UCinf:
	:type UCinf: float
	:param UCsup:
	:type UCsup: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolC:
	:type TolC: float
	:param TolS:
	:type TolS: float
	:rtype: None
") Extrema_ExtCS;
		 Extrema_ExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real UCinf,const Standard_Real UCsup,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolC,const Standard_Real TolS);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S:
	:type S: Adaptor3d_Surface &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolC:
	:type TolC: float
	:param TolS:
	:type TolS: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolC,const Standard_Real TolS);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the distances. An exception is raised if the fieds have not been initialized.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the curve is on a parallel surface.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnSurf & P2);
};


%extend Extrema_ExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtElC;
class Extrema_ExtElC {
	public:
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC ();
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between two lines. AngTol is used to test if the lines are parallel: Angle(C1,C2) < AngTol.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Lin
	:param AngTol:
	:type AngTol: float
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Lin & C2,const Standard_Real AngTol);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a line and a circle.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Circ
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Circ & C2,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a line and an elipse.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Elips
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Elips & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a line and a hyperbola.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Hypr
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Hypr & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a line and a parabola.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Parab & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between two circles. The circles can be parallel or identical.

	:param C1:
	:type C1: gp_Circ
	:param C2:
	:type C2: gp_Circ
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Circ & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a circle and an elipse.

	:param C1:
	:type C1: gp_Circ
	:param C2:
	:type C2: gp_Elips
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Elips & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a circle and a hyperbola.

	:param C1:
	:type C1: gp_Circ
	:param C2:
	:type C2: gp_Hypr
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Hypr & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a circle and a parabola.

	:param C1:
	:type C1: gp_Circ
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Parab & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between two elipses. The elipses can be parallel or identical.

	:param C1:
	:type C1: gp_Elips
	:param C2:
	:type C2: gp_Elips
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Elips & C1,const gp_Elips & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between an elipse and a hyperbola.

	:param C1:
	:type C1: gp_Elips
	:param C2:
	:type C2: gp_Hypr
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Elips & C1,const gp_Hypr & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between an elipse and a parabola.

	:param C1:
	:type C1: gp_Elips
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Elips & C1,const gp_Parab & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between two hyperbolas. The hyperbolas can be parallel or identical.

	:param C1:
	:type C1: gp_Hypr
	:param C2:
	:type C2: gp_Hypr
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Hypr & C1,const gp_Hypr & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a hyperbola and a parabola.

	:param C1:
	:type C1: gp_Hypr
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Hypr & C1,const gp_Parab & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between two parabolas The parabolas can be parallel or identical.

	:param C1:
	:type C1: gp_Parab
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Parab & C1,const gp_Parab & C2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the two curves are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%extend Extrema_ExtElC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtElC2d;
class Extrema_ExtElC2d {
	public:
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d ();
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between two lines. AngTol is used to test if the lines are parallel: Angle(C1,C2) < AngTol.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Lin2d
	:param AngTol:
	:type AngTol: float
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Lin2d & C2,const Standard_Real AngTol);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a line and a circle.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Circ2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Circ2d & C2,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a line and an elipse.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Elips2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Elips2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a line and a hyperbola.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Hypr2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Hypr2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a line and a parabola.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Parab2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between two circles. The circles can be parallel or identical.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Circ2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Circ2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a circle and an elipse.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Elips2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Elips2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a circle and a hyperbola.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Hypr2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Hypr2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a circle and a parabola.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Parab2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between two elipses. The elipses can be parallel or identical.

	:param C1:
	:type C1: gp_Elips2d
	:param C2:
	:type C2: gp_Elips2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Elips2d & C1,const gp_Elips2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between an elipse and a hyperbola.

	:param C1:
	:type C1: gp_Elips2d
	:param C2:
	:type C2: gp_Hypr2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Elips2d & C1,const gp_Hypr2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between an elipse and a parabola.

	:param C1:
	:type C1: gp_Elips2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Elips2d & C1,const gp_Parab2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between two hyperbolas. The hyperbolas can be parallel or identical.

	:param C1:
	:type C1: gp_Hypr2d
	:param C2:
	:type C2: gp_Hypr2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Hypr2d & C1,const gp_Hypr2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a hyperbola and a parabola.

	:param C1:
	:type C1: gp_Hypr2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Hypr2d & C1,const gp_Parab2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between two parabolas The parabolas can be parallel or identical.

	:param C1:
	:type C1: gp_Parab2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Parab2d & C1,const gp_Parab2d & C2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the two curves are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%extend Extrema_ExtElC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtElCS;
class Extrema_ExtElCS {
	public:
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS ();
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a line and a plane. The line can be on the plane or on a parallel plane.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Pln
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Pln & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Pln & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a line and a cylinder.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Cylinder & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Cylinder & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a line and a cone.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cone
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Cone & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cone
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Cone & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a line and a sphere.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Sphere & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Sphere & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a line and a torus.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Torus
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Torus & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Torus
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Torus & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a circle and a plane.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Pln
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Pln & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Pln & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a circle and a cylinder.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Cylinder & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Cylinder & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a circle and a cone.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cone
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Cone & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cone
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Cone & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a circle and a sphere.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Sphere & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Sphere & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a circle and a torus.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Torus
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Torus & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Torus
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Torus & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a hyperbola and a plane.

	:param C:
	:type C: gp_Hypr
	:param S:
	:type S: gp_Pln
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Hypr & C,const gp_Pln & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Hypr
	:param S:
	:type S: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Hypr & C,const gp_Pln & S);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the curve is on a parallel surface.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the curve, P2 on the surface.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnSurf & P2);
};


%extend Extrema_ExtElCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtElSS;
class Extrema_ExtElSS {
	public:
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS ();
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between 2 planes. These planes can be parallel.

	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Pln
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Pln & S1,const gp_Pln & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Pln & S1,const gp_Pln & S2);
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between a plane and a sphere.

	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Pln & S1,const gp_Sphere & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Pln & S1,const gp_Sphere & S2);
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between 2 spheres. These spheres can be parallel.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Sphere & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Sphere & S2);
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between a sphere and a cylinder.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cylinder
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Cylinder & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cylinder
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Cylinder & S2);
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between a sphere and a cone.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cone
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Cone & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cone
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Cone & S2);
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between a sphere and a torus.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Torus
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Torus & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Torus
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Torus & S2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the two surfaces are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points for the Nth resulting distance. P1 is on the first surface, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnSurf &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnSurf & P1,Extrema_POnSurf & P2);
};


%extend Extrema_ExtElSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPC;
class Extrema_ExtPC {
	public:
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPC;
		 Extrema_ExtPC ();
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC;
		 Extrema_ExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC;
		 Extrema_ExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P1,gp_Pnt & P2);
};


%extend Extrema_ExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPC2d;
class Extrema_ExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d ();
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P1,gp_Pnt2d & P2);
};


%extend Extrema_ExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPElC;
class Extrema_ExtPElC {
	public:
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC ();
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	* Calculates the extremum distance between the point P and the segment [Uinf,Usup] of the line C.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Lin
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Lin & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Lin
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Lin & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	* Calculates the 2 extremum distances between the point P and the segment [Uinf,Usup] of the circle C. Tol is used to determine if P is on the axis of the circle or if an extremum is on an endpoint of the segment. If P is on the axis of the circle, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Circ
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Circ & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Circ
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Circ & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the elipse C. Tol is used to determine if the point is on the axis of the elipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. If P is on the axis of the elipse, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Elips
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Elips & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Elips
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Elips & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	* Calculates the extremum distances between the point P and the segment [Uinf,Usup] of the hyperbola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Hypr
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Hypr & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Hypr
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Hypr & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the parabola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Parab
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Parab & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Parab
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Parab & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the Nth extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
};


%extend Extrema_ExtPElC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPElC2d;
class Extrema_ExtPElC2d {
	public:
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d ();
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	* Calculates the extremum distance between the point P and the segment [Uinf,Usup] of the line L.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Lin2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Lin2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Lin2d & L,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	* Calculates the 2 extremum distances between the point P and the segment [Uinf,Usup] of the circle C. Tol is used to determine if P is on the axis of the circle or if an extremum is on an endpoint of the segment. If P is on the axis of the circle, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Circ2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Circ2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Circ2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Circ2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the elipse C. Tol is used to determine if the point is on the axis of the elipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. If P is on the axis of the elipse, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Elips2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Elips2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Elips2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Elips2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	* Calculates the extremum distances between the point P and the segment [Uinf,Usup] of the hyperbola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Hypr2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Hypr2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Hypr2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Hypr2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the parabola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Parab2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Parab2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Parab2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Parab2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the Nth extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
};


%extend Extrema_ExtPElC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPElS;
class Extrema_ExtPElS {
	public:
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS ();
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	* It calculates all the distances between a point and a cylinder from gp. Tol is used to test if the point is on the axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cylinder
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Cylinder & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cylinder
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Cylinder & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	* It calculates all the distances between a point and a plane from gp. Tol is used to test if the point is on the plane.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Pln
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Pln & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Pln
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Pln & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	* It calculates all the distances between a point and a cone from gp. Tol is used to test if the point is at the apex or on the axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Cone & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Cone & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	* It calculates all the distances between a point and a torus from gp. Tol is used to test if the point is on the axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Torus & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Torus & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	* It calculates all the distances between a point and a sphere from gp. Tol is used to test if the point is at the center.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Sphere & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Sphere & S,const Standard_Real Tol);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%extend Extrema_ExtPElS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPExtS;
class Extrema_ExtPExtS : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS ();
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a Surface.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Handle_Adaptor3d_HSurfaceOfLinearExtrusion &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS (const gp_Pnt & P,const Handle_Adaptor3d_HSurfaceOfLinearExtrusion & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a Surface.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Handle_Adaptor3d_HSurfaceOfLinearExtrusion &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS (const gp_Pnt & P,const Handle_Adaptor3d_HSurfaceOfLinearExtrusion & S,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S:
	:type S: Handle_Adaptor3d_HSurfaceOfLinearExtrusion &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Handle_Adaptor3d_HSurfaceOfLinearExtrusion & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%extend Extrema_ExtPExtS {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_ExtPExtS(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_ExtPExtS::Handle_Extrema_ExtPExtS %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_ExtPExtS;
class Handle_Extrema_ExtPExtS : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Extrema_ExtPExtS();
        Handle_Extrema_ExtPExtS(const Handle_Extrema_ExtPExtS &aHandle);
        Handle_Extrema_ExtPExtS(const Extrema_ExtPExtS *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_ExtPExtS DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_ExtPExtS {
    Extrema_ExtPExtS* _get_reference() {
    return (Extrema_ExtPExtS*)$self->Access();
    }
};

%extend Handle_Extrema_ExtPExtS {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_ExtPExtS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPRevS;
class Extrema_ExtPRevS : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS ();
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a SurfacePtr from Adaptor3d.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Handle_Adaptor3d_HSurfaceOfRevolution &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS (const gp_Pnt & P,const Handle_Adaptor3d_HSurfaceOfRevolution & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a SurfacePtr from Adaptor3d.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Handle_Adaptor3d_HSurfaceOfRevolution &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS (const gp_Pnt & P,const Handle_Adaptor3d_HSurfaceOfRevolution & S,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurfaceOfRevolution &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Handle_Adaptor3d_HSurfaceOfRevolution & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%extend Extrema_ExtPRevS {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_ExtPRevS(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_ExtPRevS::Handle_Extrema_ExtPRevS %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_ExtPRevS;
class Handle_Extrema_ExtPRevS : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Extrema_ExtPRevS();
        Handle_Extrema_ExtPRevS(const Handle_Extrema_ExtPRevS &aHandle);
        Handle_Extrema_ExtPRevS(const Extrema_ExtPRevS *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_ExtPRevS DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_ExtPRevS {
    Extrema_ExtPRevS* _get_reference() {
    return (Extrema_ExtPRevS*)$self->Access();
    }
};

%extend Handle_Extrema_ExtPRevS {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_ExtPRevS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPS;
class Extrema_ExtPS {
	public:
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPS;
		 Extrema_ExtPS ();
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "	* It calculates all the distances. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_ExtPS;
		 Extrema_ExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "	* It calculates all the distances. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_ExtPS;
		 Extrema_ExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S:
	:type S: Adaptor3d_Surface &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the distances. An exception is raised if the fieds have not been initialized.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the surface is a trimmed surface, dUfVf is a square distance between <P> and the point of parameter FirstUParameter and FirstVParameter <PUfVf>. dUfVl is a square distance between <P> and the point of parameter FirstUParameter and LastVParameter <PUfVl>. dUlVf is a square distance between <P> and the point of parameter LastUParameter and FirstVParameter <PUlVf>. dUlVl is a square distance between <P> and the point of parameter LastUParameter and LastVParameter <PUlVl>.

	:param dUfVf:
	:type dUfVf: float &
	:param dUfVl:
	:type dUfVl: float &
	:param dUlVf:
	:type dUlVf: float &
	:param dUlVl:
	:type dUlVl: float &
	:param PUfVf:
	:type PUfVf: gp_Pnt
	:param PUfVl:
	:type PUfVl: gp_Pnt
	:param PUlVf:
	:type PUlVf: gp_Pnt
	:param PUlVl:
	:type PUlVl: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & PUfVf,gp_Pnt & PUfVl,gp_Pnt & PUlVf,gp_Pnt & PUlVl);
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "	:param F:
	:type F: Extrema_ExtFlag
	:rtype: None
") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "	:param A:
	:type A: Extrema_ExtAlgo
	:rtype: None
") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
};


%extend Extrema_ExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtSS;
class Extrema_ExtSS {
	public:
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtSS;
		 Extrema_ExtSS ();
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "	* It calculates all the distances between S1 and S2.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param TolS1:
	:type TolS1: float
	:param TolS2:
	:type TolS2: float
	:rtype: None
") Extrema_ExtSS;
		 Extrema_ExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real TolS1,const Standard_Real TolS2);
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "	* It calculates all the distances between S1 and S2.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param Uinf1:
	:type Uinf1: float
	:param Usup1:
	:type Usup1: float
	:param Vinf1:
	:type Vinf1: float
	:param Vsup1:
	:type Vsup1: float
	:param Uinf2:
	:type Uinf2: float
	:param Usup2:
	:type Usup2: float
	:param Vinf2:
	:type Vinf2: float
	:param Vsup2:
	:type Vsup2: float
	:param TolS1:
	:type TolS1: float
	:param TolS2:
	:type TolS2: float
	:rtype: None
") Extrema_ExtSS;
		 Extrema_ExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real Uinf1,const Standard_Real Usup1,const Standard_Real Vinf1,const Standard_Real Vsup1,const Standard_Real Uinf2,const Standard_Real Usup2,const Standard_Real Vinf2,const Standard_Real Vsup2,const Standard_Real TolS1,const Standard_Real TolS2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S2:
	:type S2: Adaptor3d_Surface &
	:param Uinf2:
	:type Uinf2: float
	:param Usup2:
	:type Usup2: float
	:param Vinf2:
	:type Vinf2: float
	:param Vsup2:
	:type Vsup2: float
	:param TolS1:
	:type TolS1: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Real Uinf2,const Standard_Real Usup2,const Standard_Real Vinf2,const Standard_Real Vsup2,const Standard_Real TolS1);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the distances. An exception is raised if the fieds have not been initialized.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param Uinf1:
	:type Uinf1: float
	:param Usup1:
	:type Usup1: float
	:param Vinf1:
	:type Vinf1: float
	:param Vsup1:
	:type Vsup1: float
	:param TolS1:
	:type TolS1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real Uinf1,const Standard_Real Usup1,const Standard_Real Vinf1,const Standard_Real Vsup1,const Standard_Real TolS1);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the curve is on a parallel surface.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnSurf &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnSurf & P1,Extrema_POnSurf & P2);
};


%extend Extrema_ExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_FuncExtCS;
class Extrema_FuncExtCS : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "	:rtype: None
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS ();
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculation of Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Calculation of Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculation of Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "	* Returns the Nth extremum on C.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "	* Return the Nth extremum on S.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface (const Standard_Integer N);
};


%extend Extrema_FuncExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_FuncExtPS;
class Extrema_FuncExtPS : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Extrema_FuncExtPS;
		%feature("autodoc", "	:rtype: None
") Extrema_FuncExtPS;
		 Extrema_FuncExtPS ();
		%feature("compactdefaultargs") Extrema_FuncExtPS;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Extrema_FuncExtPS;
		 Extrema_FuncExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculate Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Calculate Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculate Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Nth extremum.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%extend Extrema_FuncExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_FuncExtSS;
class Extrema_FuncExtSS : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "	:rtype: None
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS ();
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:rtype: None
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculate Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Calculate Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculate Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	* Return the Nth extremum on S1.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1 (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	* Renvoie le Nieme extremum sur S2.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2 (const Standard_Integer N);
};


%extend Extrema_FuncExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenExtCS;
class Extrema_GenExtCS {
	public:
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenExtCS;
		 Extrema_GenExtCS ();
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surfaces. NbU and NbV are used to locate the close points on the surface and NbT on the curve to find the zeros.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbT:
	:type NbT: int
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtCS;
		 Extrema_GenExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer NbT,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbT,NbU and NbV are used to locate the close points to find the zeros.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbT:
	:type NbT: int
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param tmin:
	:type tmin: float
	:param tsup:
	:type tsup: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtCS;
		 Extrema_GenExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer NbT,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real tmin,const Standard_Real tsup,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real Tol2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with S An exception is raised if the fields have not been initialized.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbT:
	:type NbT: int
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Integer NbT,const Standard_Real Tol1);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with C An exception is raised if the fields have not been initialized.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbT:
	:type NbT: int
	:param tmin:
	:type tmin: float
	:param tsup:
	:type tsup: float
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Integer NbT,const Standard_Real tmin,const Standard_Real tsup,const Standard_Real Tol1);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface (const Standard_Integer N);
};


%extend Extrema_GenExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenExtPS;
class Extrema_GenExtPS {
	public:
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenExtPS;
		 Extrema_GenExtPS ();
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_GenExtPS;
		 Extrema_GenExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_GenExtPS;
		 Extrema_GenExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "	:param F:
	:type F: Extrema_ExtFlag
	:rtype: None
") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "	:param A:
	:type A: Extrema_ExtAlgo
	:rtype: None
") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%extend Extrema_GenExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenExtSS;
class Extrema_GenExtSS {
	public:
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenExtSS;
		 Extrema_GenExtSS ();
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surfaces. NbU and NbV are used to locate the close points to find the zeros.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtSS;
		 Extrema_GenExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param U1min:
	:type U1min: float
	:param U1sup:
	:type U1sup: float
	:param V1min:
	:type V1min: float
	:param V1sup:
	:type V1sup: float
	:param U2min:
	:type U2min: float
	:param U2sup:
	:type U2sup: float
	:param V2min:
	:type V2min: float
	:param V2sup:
	:type V2sup: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtSS;
		 Extrema_GenExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real U1min,const Standard_Real U1sup,const Standard_Real V1min,const Standard_Real V1sup,const Standard_Real U2min,const Standard_Real U2sup,const Standard_Real V2min,const Standard_Real V2sup,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param U2min:
	:type U2min: float
	:param U2sup:
	:type U2sup: float
	:param V2min:
	:type V2min: float
	:param V2sup:
	:type V2sup: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real U2min,const Standard_Real U2sup,const Standard_Real V2min,const Standard_Real V2sup,const Standard_Real Tol2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with S1 An exception is raised if the fields have not been initialized.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real Tol1);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done withS1 An exception is raised if the fields have not been initialized.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param U1min:
	:type U1min: float
	:param U1sup:
	:type U1sup: float
	:param V1min:
	:type V1min: float
	:param V1sup:
	:type V1sup: float
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real U1min,const Standard_Real U1sup,const Standard_Real V1min,const Standard_Real V1sup,const Standard_Real Tol1);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1 (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2 (const Standard_Integer N);
};


%extend Extrema_GenExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenLocateExtCS;
class Extrema_GenLocateExtCS {
	public:
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS ();
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "	* Calculates the distance with two close points. The close points are defined by the parameter values T for C and (U,V) for S. The function F(t,u,v)=distance(C(t),S(u,v)) has an extremun when gradient(F)=0. The algorithm searchs a zero near the close points.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param T:
	:type T: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real T,const Standard_Real U,const Standard_Real V,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param T:
	:type T: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real T,const Standard_Real U,const Standard_Real V,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "	* Returns the point of the extremum distance on C.

	:rtype: Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve ();
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "	* Returns the point of the extremum distance on S.

	:rtype: Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface ();
};


%extend Extrema_GenLocateExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenLocateExtPS;
class Extrema_GenLocateExtPS {
	public:
		%feature("compactdefaultargs") Extrema_GenLocateExtPS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS ();
		%feature("compactdefaultargs") Extrema_GenLocateExtPS;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter values U0 and V0. The function F(u,v)=distance(S(u,v),p) has an extremun when gradient(F)=0. The algorithm searchs a zero near the close point.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the extremum distance.

	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point ();
};


%extend Extrema_GenLocateExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenLocateExtSS;
class Extrema_GenLocateExtSS {
	public:
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS ();
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "	* Calculates the distance with two close points. The close points are defined by the parameter values (U1,V1) for S1 and (U2,V2) for S2. The function F(u1,v1,u2,v2)=distance(S1(u1,v1),S2(u2,v2)) has an extremun when gradient(F)=0. The algorithm searchs a zero near the close points.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	* Returns the point of the extremum distance on S1.

	:rtype: Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1 ();
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	* Returns the point of the extremum distance on S2.

	:rtype: Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2 ();
};


%extend Extrema_GenLocateExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GlobOptFuncCCC0;
class Extrema_GlobOptFuncCCC0 : public math_MultipleVarFunction {
	public:
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:rtype: None
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0 (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2);
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0 (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
};


%extend Extrema_GlobOptFuncCCC0 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GlobOptFuncCCC1;
class Extrema_GlobOptFuncCCC1 : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:rtype: None
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1 (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2);
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1 (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
};


%extend Extrema_GlobOptFuncCCC1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GlobOptFuncCCC2;
class Extrema_GlobOptFuncCCC2 : public math_MultipleVarFunctionWithHessian {
	public:
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:rtype: None
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2 (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2);
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2 (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:param H:
	:type H: math_Matrix &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G,math_Matrix & H);
};


%extend Extrema_GlobOptFuncCCC2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GlobOptFuncCS;
class Extrema_GlobOptFuncCS : public math_MultipleVarFunctionWithHessian {
	public:
		%feature("compactdefaultargs") Extrema_GlobOptFuncCS;
		%feature("autodoc", "	* Curve and surface should exist during all the lifetime of Extrema_GlobOptFuncCS.

	:param C:
	:type C: Adaptor3d_Curve *
	:param S:
	:type S: Adaptor3d_Surface *
	:rtype: None
") Extrema_GlobOptFuncCS;
		 Extrema_GlobOptFuncCS (const Adaptor3d_Curve * C,const Adaptor3d_Surface * S);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param theX:
	:type theX: math_Vector &
	:param theF:
	:type theF: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & theX,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param theX:
	:type theX: math_Vector &
	:param theG:
	:type theG: math_Vector &
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient (const math_Vector & theX,math_Vector & theG);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param theX:
	:type theX: math_Vector &
	:param theF:
	:type theF: float &
	:param theG:
	:type theG: math_Vector &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & theX,Standard_Real &OutValue,math_Vector & theG);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param theX:
	:type theX: math_Vector &
	:param theF:
	:type theF: float &
	:param theG:
	:type theG: math_Vector &
	:param theH:
	:type theH: math_Matrix &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & theX,Standard_Real &OutValue,math_Vector & theG,math_Matrix & theH);
};


%extend Extrema_GlobOptFuncCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_HArray1OfPOnCurv;
class Extrema_HArray1OfPOnCurv : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Extrema_HArray1OfPOnCurv;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Extrema_HArray1OfPOnCurv;
		 Extrema_HArray1OfPOnCurv (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Extrema_HArray1OfPOnCurv;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Extrema_HArray1OfPOnCurv;
		 Extrema_HArray1OfPOnCurv (const Standard_Integer Low,const Standard_Integer Up,const Extrema_POnCurv & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv & V);
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
	:type Value: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnCurv
") Array1;
		const Extrema_Array1OfPOnCurv & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnCurv
") ChangeArray1;
		Extrema_Array1OfPOnCurv & ChangeArray1 ();
};


%extend Extrema_HArray1OfPOnCurv {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_HArray1OfPOnCurv(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_HArray1OfPOnCurv::Handle_Extrema_HArray1OfPOnCurv %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_HArray1OfPOnCurv;
class Handle_Extrema_HArray1OfPOnCurv : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray1OfPOnCurv();
        Handle_Extrema_HArray1OfPOnCurv(const Handle_Extrema_HArray1OfPOnCurv &aHandle);
        Handle_Extrema_HArray1OfPOnCurv(const Extrema_HArray1OfPOnCurv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray1OfPOnCurv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray1OfPOnCurv {
    Extrema_HArray1OfPOnCurv* _get_reference() {
    return (Extrema_HArray1OfPOnCurv*)$self->Access();
    }
};

%extend Handle_Extrema_HArray1OfPOnCurv {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_HArray1OfPOnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_HArray1OfPOnCurv2d;
class Extrema_HArray1OfPOnCurv2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Extrema_HArray1OfPOnCurv2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Extrema_HArray1OfPOnCurv2d;
		 Extrema_HArray1OfPOnCurv2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Extrema_HArray1OfPOnCurv2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Extrema_HArray1OfPOnCurv2d;
		 Extrema_HArray1OfPOnCurv2d (const Standard_Integer Low,const Standard_Integer Up,const Extrema_POnCurv2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv2d & V);
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
	:type Value: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnCurv2d
") Array1;
		const Extrema_Array1OfPOnCurv2d & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnCurv2d
") ChangeArray1;
		Extrema_Array1OfPOnCurv2d & ChangeArray1 ();
};


%extend Extrema_HArray1OfPOnCurv2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_HArray1OfPOnCurv2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_HArray1OfPOnCurv2d::Handle_Extrema_HArray1OfPOnCurv2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_HArray1OfPOnCurv2d;
class Handle_Extrema_HArray1OfPOnCurv2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray1OfPOnCurv2d();
        Handle_Extrema_HArray1OfPOnCurv2d(const Handle_Extrema_HArray1OfPOnCurv2d &aHandle);
        Handle_Extrema_HArray1OfPOnCurv2d(const Extrema_HArray1OfPOnCurv2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray1OfPOnCurv2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray1OfPOnCurv2d {
    Extrema_HArray1OfPOnCurv2d* _get_reference() {
    return (Extrema_HArray1OfPOnCurv2d*)$self->Access();
    }
};

%extend Handle_Extrema_HArray1OfPOnCurv2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_HArray1OfPOnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_HArray1OfPOnSurf;
class Extrema_HArray1OfPOnSurf : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Extrema_HArray1OfPOnSurf;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Extrema_HArray1OfPOnSurf;
		 Extrema_HArray1OfPOnSurf (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Extrema_HArray1OfPOnSurf;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Extrema_HArray1OfPOnSurf;
		 Extrema_HArray1OfPOnSurf (const Standard_Integer Low,const Standard_Integer Up,const Extrema_POnSurf & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurf & V);
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
	:type Value: Extrema_POnSurf &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnSurf & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnSurf
") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnSurf
") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnSurf
") Array1;
		const Extrema_Array1OfPOnSurf & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: Extrema_Array1OfPOnSurf
") ChangeArray1;
		Extrema_Array1OfPOnSurf & ChangeArray1 ();
};


%extend Extrema_HArray1OfPOnSurf {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_HArray1OfPOnSurf(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_HArray1OfPOnSurf::Handle_Extrema_HArray1OfPOnSurf %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_HArray1OfPOnSurf;
class Handle_Extrema_HArray1OfPOnSurf : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray1OfPOnSurf();
        Handle_Extrema_HArray1OfPOnSurf(const Handle_Extrema_HArray1OfPOnSurf &aHandle);
        Handle_Extrema_HArray1OfPOnSurf(const Extrema_HArray1OfPOnSurf *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray1OfPOnSurf DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray1OfPOnSurf {
    Extrema_HArray1OfPOnSurf* _get_reference() {
    return (Extrema_HArray1OfPOnSurf*)$self->Access();
    }
};

%extend Handle_Extrema_HArray1OfPOnSurf {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_HArray1OfPOnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_HArray2OfPOnCurv;
class Extrema_HArray2OfPOnCurv : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Extrema_HArray2OfPOnCurv;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_HArray2OfPOnCurv;
		 Extrema_HArray2OfPOnCurv (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Extrema_HArray2OfPOnCurv;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Extrema_HArray2OfPOnCurv;
		 Extrema_HArray2OfPOnCurv (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnCurv & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnCurv
") Array2;
		const Extrema_Array2OfPOnCurv & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnCurv
") ChangeArray2;
		Extrema_Array2OfPOnCurv & ChangeArray2 ();
};


%extend Extrema_HArray2OfPOnCurv {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_HArray2OfPOnCurv(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_HArray2OfPOnCurv::Handle_Extrema_HArray2OfPOnCurv %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_HArray2OfPOnCurv;
class Handle_Extrema_HArray2OfPOnCurv : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnCurv();
        Handle_Extrema_HArray2OfPOnCurv(const Handle_Extrema_HArray2OfPOnCurv &aHandle);
        Handle_Extrema_HArray2OfPOnCurv(const Extrema_HArray2OfPOnCurv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnCurv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnCurv {
    Extrema_HArray2OfPOnCurv* _get_reference() {
    return (Extrema_HArray2OfPOnCurv*)$self->Access();
    }
};

%extend Handle_Extrema_HArray2OfPOnCurv {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_HArray2OfPOnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_HArray2OfPOnCurv2d;
class Extrema_HArray2OfPOnCurv2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Extrema_HArray2OfPOnCurv2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_HArray2OfPOnCurv2d;
		 Extrema_HArray2OfPOnCurv2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Extrema_HArray2OfPOnCurv2d;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Extrema_HArray2OfPOnCurv2d;
		 Extrema_HArray2OfPOnCurv2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnCurv2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnCurv2d &
	:rtype: None
") Init;
		void Init (const Extrema_POnCurv2d & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnCurv2d
") Array2;
		const Extrema_Array2OfPOnCurv2d & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnCurv2d
") ChangeArray2;
		Extrema_Array2OfPOnCurv2d & ChangeArray2 ();
};


%extend Extrema_HArray2OfPOnCurv2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_HArray2OfPOnCurv2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_HArray2OfPOnCurv2d::Handle_Extrema_HArray2OfPOnCurv2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_HArray2OfPOnCurv2d;
class Handle_Extrema_HArray2OfPOnCurv2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnCurv2d();
        Handle_Extrema_HArray2OfPOnCurv2d(const Handle_Extrema_HArray2OfPOnCurv2d &aHandle);
        Handle_Extrema_HArray2OfPOnCurv2d(const Extrema_HArray2OfPOnCurv2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnCurv2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnCurv2d {
    Extrema_HArray2OfPOnCurv2d* _get_reference() {
    return (Extrema_HArray2OfPOnCurv2d*)$self->Access();
    }
};

%extend Handle_Extrema_HArray2OfPOnCurv2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_HArray2OfPOnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_HArray2OfPOnSurf;
class Extrema_HArray2OfPOnSurf : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Extrema_HArray2OfPOnSurf;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_HArray2OfPOnSurf;
		 Extrema_HArray2OfPOnSurf (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Extrema_HArray2OfPOnSurf;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Extrema_HArray2OfPOnSurf;
		 Extrema_HArray2OfPOnSurf (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnSurf & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurf &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurf & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Extrema_POnSurf &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurf & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnSurf
") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnSurf
") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnSurf
") Array2;
		const Extrema_Array2OfPOnSurf & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnSurf
") ChangeArray2;
		Extrema_Array2OfPOnSurf & ChangeArray2 ();
};


%extend Extrema_HArray2OfPOnSurf {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_HArray2OfPOnSurf(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_HArray2OfPOnSurf::Handle_Extrema_HArray2OfPOnSurf %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_HArray2OfPOnSurf;
class Handle_Extrema_HArray2OfPOnSurf : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnSurf();
        Handle_Extrema_HArray2OfPOnSurf(const Handle_Extrema_HArray2OfPOnSurf &aHandle);
        Handle_Extrema_HArray2OfPOnSurf(const Extrema_HArray2OfPOnSurf *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnSurf DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnSurf {
    Extrema_HArray2OfPOnSurf* _get_reference() {
    return (Extrema_HArray2OfPOnSurf*)$self->Access();
    }
};

%extend Handle_Extrema_HArray2OfPOnSurf {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_HArray2OfPOnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_HArray2OfPOnSurfParams;
class Extrema_HArray2OfPOnSurfParams : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Extrema_HArray2OfPOnSurfParams;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Extrema_HArray2OfPOnSurfParams;
		 Extrema_HArray2OfPOnSurfParams (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Extrema_HArray2OfPOnSurfParams;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Extrema_POnSurfParams &
	:rtype: None
") Extrema_HArray2OfPOnSurfParams;
		 Extrema_HArray2OfPOnSurfParams (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnSurfParams & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Extrema_POnSurfParams &
	:rtype: None
") Init;
		void Init (const Extrema_POnSurfParams & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Extrema_POnSurfParams &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurfParams & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnSurfParams
") Value;
		const Extrema_POnSurfParams & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Extrema_POnSurfParams
") ChangeValue;
		Extrema_POnSurfParams & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnSurfParams
") Array2;
		const Extrema_Array2OfPOnSurfParams & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: Extrema_Array2OfPOnSurfParams
") ChangeArray2;
		Extrema_Array2OfPOnSurfParams & ChangeArray2 ();
};


%extend Extrema_HArray2OfPOnSurfParams {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_HArray2OfPOnSurfParams(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_HArray2OfPOnSurfParams::Handle_Extrema_HArray2OfPOnSurfParams %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_HArray2OfPOnSurfParams;
class Handle_Extrema_HArray2OfPOnSurfParams : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnSurfParams();
        Handle_Extrema_HArray2OfPOnSurfParams(const Handle_Extrema_HArray2OfPOnSurfParams &aHandle);
        Handle_Extrema_HArray2OfPOnSurfParams(const Extrema_HArray2OfPOnSurfParams *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnSurfParams DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnSurfParams {
    Extrema_HArray2OfPOnSurfParams* _get_reference() {
    return (Extrema_HArray2OfPOnSurfParams*)$self->Access();
    }
};

%extend Handle_Extrema_HArray2OfPOnSurfParams {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_HArray2OfPOnSurfParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocECC;
class Extrema_LocECC {
	public:
		%feature("compactdefaultargs") Extrema_LocECC;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_LocECC;
		 Extrema_LocECC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%extend Extrema_LocECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocECC2d;
class Extrema_LocECC2d {
	public:
		%feature("compactdefaultargs") Extrema_LocECC2d;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_LocECC2d;
		 Extrema_LocECC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%extend Extrema_LocECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocEPCOfLocateExtPC;
class Extrema_LocEPCOfLocateExtPC {
	public:
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real U0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point ();
};


%extend Extrema_LocEPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocEPCOfLocateExtPC2d;
class Extrema_LocEPCOfLocateExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point ();
};


%extend Extrema_LocEPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocateExtCC;
class Extrema_LocateExtCC {
	public:
		%feature("compactdefaultargs") Extrema_LocateExtCC;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searchs the zero near the close point.

	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:rtype: None
") Extrema_LocateExtCC;
		 Extrema_LocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U0,const Standard_Real V0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.

	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%extend Extrema_LocateExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocateExtCC2d;
class Extrema_LocateExtCC2d {
	public:
		%feature("compactdefaultargs") Extrema_LocateExtCC2d;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searchs the zero near the close point.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:rtype: None
") Extrema_LocateExtCC2d;
		 Extrema_LocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U0,const Standard_Real V0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.

	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%extend Extrema_LocateExtCC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocateExtPC;
class Extrema_LocateExtPC {
	public:
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC ();
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real U0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point ();
};


%extend Extrema_LocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocateExtPC2d;
class Extrema_LocateExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point ();
};


%extend Extrema_LocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCFOfEPCOfELPCOfLocateExtPC;
class Extrema_PCFOfEPCOfELPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
class Extrema_PCFOfEPCOfELPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCFOfEPCOfExtPC;
class Extrema_PCFOfEPCOfExtPC : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC ();
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%extend Extrema_PCFOfEPCOfExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCFOfEPCOfExtPC2d;
class Extrema_PCFOfEPCOfExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d ();
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%extend Extrema_PCFOfEPCOfExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCLocFOfLocEPCOfLocateExtPC;
class Extrema_PCLocFOfLocEPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%extend Extrema_PCLocFOfLocEPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
class Extrema_PCLocFOfLocEPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%extend Extrema_PCLocFOfLocEPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_POnCurv;
class Extrema_POnCurv {
	public:
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "	:rtype: None
") Extrema_POnCurv;
		 Extrema_POnCurv ();
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") Extrema_POnCurv;
		 Extrema_POnCurv (const Standard_Real U,const gp_Pnt & P);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetValues;
		void SetValues (const Standard_Real U,const gp_Pnt & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") _CSFDB_GetExtrema_POnCurvmyU;
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetExtrema_POnCurvmyU;
		Standard_Real _CSFDB_GetExtrema_POnCurvmyU ();
		%feature("compactdefaultargs") _CSFDB_SetExtrema_POnCurvmyU;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetExtrema_POnCurvmyU;
		void _CSFDB_SetExtrema_POnCurvmyU (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_GetExtrema_POnCurvmyP;
		%feature("autodoc", "	:rtype: gp_Pnt
") _CSFDB_GetExtrema_POnCurvmyP;
		const gp_Pnt  _CSFDB_GetExtrema_POnCurvmyP ();
};


%extend Extrema_POnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_POnCurv2d;
class Extrema_POnCurv2d {
	public:
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "	:rtype: None
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d ();
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d (const Standard_Real U,const gp_Pnt2d & P);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetValues;
		void SetValues (const Standard_Real U,const gp_Pnt2d & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") _CSFDB_GetExtrema_POnCurv2dmyU;
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetExtrema_POnCurv2dmyU;
		Standard_Real _CSFDB_GetExtrema_POnCurv2dmyU ();
		%feature("compactdefaultargs") _CSFDB_SetExtrema_POnCurv2dmyU;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetExtrema_POnCurv2dmyU;
		void _CSFDB_SetExtrema_POnCurv2dmyU (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_GetExtrema_POnCurv2dmyP;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") _CSFDB_GetExtrema_POnCurv2dmyP;
		const gp_Pnt2d  _CSFDB_GetExtrema_POnCurv2dmyP ();
};


%extend Extrema_POnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_POnSurf;
class Extrema_POnSurf {
	public:
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "	* Creation of an indefinite point on surface.

	:rtype: None
") Extrema_POnSurf;
		 Extrema_POnSurf ();
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "	* Creation of a point on surface with parameter values on the surface and a Pnt from gp.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") Extrema_POnSurf;
		 Extrema_POnSurf (const Standard_Real U,const Standard_Real V,const gp_Pnt & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the 3d point.

	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	* Sets the params of current POnSurf instance. (e.g. to the point to be projected).

	:param theU:
	:type theU: float
	:param theV:
	:type theV: float
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Real theU,const Standard_Real theV,const gp_Pnt & thePnt);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter values on the surface.

	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Parameter;
		void Parameter (Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Extrema_POnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
class Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC
") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Assign (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC
") operator =;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & operator = (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
class Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d
") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Assign (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d
") operator =;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & operator = (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfExtPC;
class Extrema_SeqPCOfPCFOfEPCOfExtPC : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SeqPCOfPCFOfEPCOfExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfExtPC;
		 Extrema_SeqPCOfPCFOfEPCOfExtPC ();
		%feature("compactdefaultargs") Extrema_SeqPCOfPCFOfEPCOfExtPC;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfExtPC;
		 Extrema_SeqPCOfPCFOfEPCOfExtPC (const Extrema_SeqPCOfPCFOfEPCOfExtPC & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfExtPC
") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC & Assign (const Extrema_SeqPCOfPCFOfEPCOfExtPC & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfExtPC
") operator =;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC & operator = (const Extrema_SeqPCOfPCFOfEPCOfExtPC & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCFOfEPCOfExtPC &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SeqPCOfPCFOfEPCOfExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfExtPC2d;
class Extrema_SeqPCOfPCFOfEPCOfExtPC2d : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SeqPCOfPCFOfEPCOfExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfExtPC2d;
		 Extrema_SeqPCOfPCFOfEPCOfExtPC2d ();
		%feature("compactdefaultargs") Extrema_SeqPCOfPCFOfEPCOfExtPC2d;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") Extrema_SeqPCOfPCFOfEPCOfExtPC2d;
		 Extrema_SeqPCOfPCFOfEPCOfExtPC2d (const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfExtPC2d
") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Assign (const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: Extrema_SeqPCOfPCFOfEPCOfExtPC2d
") operator =;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & operator = (const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCFOfEPCOfExtPC2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SeqPCOfPCFOfEPCOfExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC;
class Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC;
		 Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC;
		 Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC
") Assign;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Assign (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC
") operator =;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & operator = (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
class Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d
") Assign;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Assign (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d
") operator =;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & operator = (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") Append;
		void Append (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCLocFOfLocECC;
class Extrema_SeqPOnCOfCCLocFOfLocECC : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SeqPOnCOfCCLocFOfLocECC;
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPOnCOfCCLocFOfLocECC;
		 Extrema_SeqPOnCOfCCLocFOfLocECC ();
		%feature("compactdefaultargs") Extrema_SeqPOnCOfCCLocFOfLocECC;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCLocFOfLocECC &
	:rtype: None
") Extrema_SeqPOnCOfCCLocFOfLocECC;
		 Extrema_SeqPOnCOfCCLocFOfLocECC (const Extrema_SeqPOnCOfCCLocFOfLocECC & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCLocFOfLocECC &
	:rtype: Extrema_SeqPOnCOfCCLocFOfLocECC
") Assign;
		const Extrema_SeqPOnCOfCCLocFOfLocECC & Assign (const Extrema_SeqPOnCOfCCLocFOfLocECC & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCLocFOfLocECC &
	:rtype: Extrema_SeqPOnCOfCCLocFOfLocECC
") operator =;
		const Extrema_SeqPOnCOfCCLocFOfLocECC & operator = (const Extrema_SeqPOnCOfCCLocFOfLocECC & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC &
	:rtype: None
") Append;
		void Append (Extrema_SeqPOnCOfCCLocFOfLocECC & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCLocFOfLocECC & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SeqPOnCOfCCLocFOfLocECC &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SeqPOnCOfCCLocFOfLocECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCLocFOfLocECC2d;
class Extrema_SeqPOnCOfCCLocFOfLocECC2d : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SeqPOnCOfCCLocFOfLocECC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_SeqPOnCOfCCLocFOfLocECC2d;
		 Extrema_SeqPOnCOfCCLocFOfLocECC2d ();
		%feature("compactdefaultargs") Extrema_SeqPOnCOfCCLocFOfLocECC2d;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCLocFOfLocECC2d &
	:rtype: None
") Extrema_SeqPOnCOfCCLocFOfLocECC2d;
		 Extrema_SeqPOnCOfCCLocFOfLocECC2d (const Extrema_SeqPOnCOfCCLocFOfLocECC2d & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCLocFOfLocECC2d &
	:rtype: Extrema_SeqPOnCOfCCLocFOfLocECC2d
") Assign;
		const Extrema_SeqPOnCOfCCLocFOfLocECC2d & Assign (const Extrema_SeqPOnCOfCCLocFOfLocECC2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SeqPOnCOfCCLocFOfLocECC2d &
	:rtype: Extrema_SeqPOnCOfCCLocFOfLocECC2d
") operator =;
		const Extrema_SeqPOnCOfCCLocFOfLocECC2d & operator = (const Extrema_SeqPOnCOfCCLocFOfLocECC2d & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC2d &
	:rtype: None
") Append;
		void Append (Extrema_SeqPOnCOfCCLocFOfLocECC2d & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCLocFOfLocECC2d & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC2d & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SeqPOnCOfCCLocFOfLocECC2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC2d & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SeqPOnCOfCCLocFOfLocECC2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC2d & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SeqPOnCOfCCLocFOfLocECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC::Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC* _get_reference() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d::Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d* _get_reference() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC::Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC* _get_reference() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d::Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d* _get_reference() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC;
class Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC;
		 Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC::Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC(const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC(const Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
    Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC* _get_reference() {
    return (Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
class Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d::Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d(const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d(const Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
    Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d* _get_reference() {
    return (Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC;
class Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC;
		 Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC::Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC(const Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC {
    Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC* _get_reference() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d;
class Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d;
		 Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d::Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d(const Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d {
    Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d* _get_reference() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSequenceOfPOnCurv;
class Extrema_SequenceNodeOfSequenceOfPOnCurv : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSequenceOfPOnCurv;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSequenceOfPOnCurv;
		 Extrema_SequenceNodeOfSequenceOfPOnCurv (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Value;
		Extrema_POnCurv & Value ();
};


%extend Extrema_SequenceNodeOfSequenceOfPOnCurv {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv::Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv;
class Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv();
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv(const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv &aHandle);
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv(const Extrema_SequenceNodeOfSequenceOfPOnCurv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv {
    Extrema_SequenceNodeOfSequenceOfPOnCurv* _get_reference() {
    return (Extrema_SequenceNodeOfSequenceOfPOnCurv*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSequenceOfPOnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSequenceOfPOnCurv2d;
class Extrema_SequenceNodeOfSequenceOfPOnCurv2d : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSequenceOfPOnCurv2d;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSequenceOfPOnCurv2d;
		 Extrema_SequenceNodeOfSequenceOfPOnCurv2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%extend Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d::Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d;
class Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d();
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d(const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d &aHandle);
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d(const Extrema_SequenceNodeOfSequenceOfPOnCurv2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
    Extrema_SequenceNodeOfSequenceOfPOnCurv2d* _get_reference() {
    return (Extrema_SequenceNodeOfSequenceOfPOnCurv2d*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceNodeOfSequenceOfPOnSurf;
class Extrema_SequenceNodeOfSequenceOfPOnSurf : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Extrema_SequenceNodeOfSequenceOfPOnSurf;
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnSurf &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Extrema_SequenceNodeOfSequenceOfPOnSurf;
		 Extrema_SequenceNodeOfSequenceOfPOnSurf (const Extrema_POnSurf & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Extrema_POnSurf
") Value;
		Extrema_POnSurf & Value ();
};


%extend Extrema_SequenceNodeOfSequenceOfPOnSurf {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf::Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf;
class Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf();
        Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf(const Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf &aHandle);
        Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf(const Extrema_SequenceNodeOfSequenceOfPOnSurf *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf {
    Extrema_SequenceNodeOfSequenceOfPOnSurf* _get_reference() {
    return (Extrema_SequenceNodeOfSequenceOfPOnSurf*)$self->Access();
    }
};

%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Extrema_SequenceNodeOfSequenceOfPOnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceOfPOnCurv;
class Extrema_SequenceOfPOnCurv : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SequenceOfPOnCurv;
		%feature("autodoc", "	:rtype: None
") Extrema_SequenceOfPOnCurv;
		 Extrema_SequenceOfPOnCurv ();
		%feature("compactdefaultargs") Extrema_SequenceOfPOnCurv;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnCurv &
	:rtype: None
") Extrema_SequenceOfPOnCurv;
		 Extrema_SequenceOfPOnCurv (const Extrema_SequenceOfPOnCurv & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnCurv &
	:rtype: Extrema_SequenceOfPOnCurv
") Assign;
		const Extrema_SequenceOfPOnCurv & Assign (const Extrema_SequenceOfPOnCurv & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnCurv &
	:rtype: Extrema_SequenceOfPOnCurv
") operator =;
		const Extrema_SequenceOfPOnCurv & operator = (const Extrema_SequenceOfPOnCurv & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnCurv &
	:rtype: None
") Append;
		void Append (Extrema_SequenceOfPOnCurv & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnCurv &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SequenceOfPOnCurv & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SequenceOfPOnCurv &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SequenceOfPOnCurv & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SequenceOfPOnCurv &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SequenceOfPOnCurv & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") First;
		const Extrema_POnCurv & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnCurv
") Last;
		const Extrema_POnCurv & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SequenceOfPOnCurv &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SequenceOfPOnCurv & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnCurv &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv
") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SequenceOfPOnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceOfPOnCurv2d;
class Extrema_SequenceOfPOnCurv2d : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SequenceOfPOnCurv2d;
		%feature("autodoc", "	:rtype: None
") Extrema_SequenceOfPOnCurv2d;
		 Extrema_SequenceOfPOnCurv2d ();
		%feature("compactdefaultargs") Extrema_SequenceOfPOnCurv2d;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") Extrema_SequenceOfPOnCurv2d;
		 Extrema_SequenceOfPOnCurv2d (const Extrema_SequenceOfPOnCurv2d & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnCurv2d &
	:rtype: Extrema_SequenceOfPOnCurv2d
") Assign;
		const Extrema_SequenceOfPOnCurv2d & Assign (const Extrema_SequenceOfPOnCurv2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnCurv2d &
	:rtype: Extrema_SequenceOfPOnCurv2d
") operator =;
		const Extrema_SequenceOfPOnCurv2d & operator = (const Extrema_SequenceOfPOnCurv2d & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") Append;
		void Append (Extrema_SequenceOfPOnCurv2d & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SequenceOfPOnCurv2d & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SequenceOfPOnCurv2d & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SequenceOfPOnCurv2d & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SequenceOfPOnCurv2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SequenceOfPOnCurv2d & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SequenceOfPOnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_SequenceOfPOnSurf;
class Extrema_SequenceOfPOnSurf : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Extrema_SequenceOfPOnSurf;
		%feature("autodoc", "	:rtype: None
") Extrema_SequenceOfPOnSurf;
		 Extrema_SequenceOfPOnSurf ();
		%feature("compactdefaultargs") Extrema_SequenceOfPOnSurf;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnSurf &
	:rtype: None
") Extrema_SequenceOfPOnSurf;
		 Extrema_SequenceOfPOnSurf (const Extrema_SequenceOfPOnSurf & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnSurf &
	:rtype: Extrema_SequenceOfPOnSurf
") Assign;
		const Extrema_SequenceOfPOnSurf & Assign (const Extrema_SequenceOfPOnSurf & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Extrema_SequenceOfPOnSurf &
	:rtype: Extrema_SequenceOfPOnSurf
") operator =;
		const Extrema_SequenceOfPOnSurf & operator = (const Extrema_SequenceOfPOnSurf & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnSurf &
	:rtype: None
") Append;
		void Append (const Extrema_POnSurf & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnSurf &
	:rtype: None
") Append;
		void Append (Extrema_SequenceOfPOnSurf & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnSurf &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnSurf & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Extrema_SequenceOfPOnSurf &
	:rtype: None
") Prepend;
		void Prepend (Extrema_SequenceOfPOnSurf & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnSurf &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnSurf & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SequenceOfPOnSurf &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SequenceOfPOnSurf & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Extrema_POnSurf &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnSurf & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Extrema_SequenceOfPOnSurf &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SequenceOfPOnSurf & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Extrema_POnSurf
") First;
		const Extrema_POnSurf & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Extrema_POnSurf
") Last;
		const Extrema_POnSurf & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Extrema_SequenceOfPOnSurf &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Extrema_SequenceOfPOnSurf & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnSurf
") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Extrema_POnSurf &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnSurf & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Extrema_POnSurf
") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Index);
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


%extend Extrema_SequenceOfPOnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_POnSurfParams;
class Extrema_POnSurfParams : public Extrema_POnSurf {
	public:
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams ();
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "	* Creation of a point on surface with parameter values on the surface and a Pnt from gp.

	:param theU:
	:type theU: float
	:param theV:
	:type theV: float
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams (const Standard_Real theU,const Standard_Real theV,const gp_Pnt & thePnt);
		%feature("compactdefaultargs") SetSqrDistance;
		%feature("autodoc", "	* Sets the square distance from this point to another one (e.g. to the point to be projected).

	:param theSqrDistance:
	:type theSqrDistance: float
	:rtype: None
") SetSqrDistance;
		void SetSqrDistance (const Standard_Real theSqrDistance);
		%feature("compactdefaultargs") GetSqrDistance;
		%feature("autodoc", "	* Query the square distance from this point to another one.

	:rtype: float
") GetSqrDistance;
		Standard_Real GetSqrDistance ();
		%feature("compactdefaultargs") SetElementType;
		%feature("autodoc", "	* Sets the element type on which this point is situated.

	:param theElementType:
	:type theElementType: Extrema_ElementType
	:rtype: None
") SetElementType;
		void SetElementType (const Extrema_ElementType theElementType);
		%feature("compactdefaultargs") GetElementType;
		%feature("autodoc", "	* Query the element type on which this point is situated.

	:rtype: Extrema_ElementType
") GetElementType;
		Extrema_ElementType GetElementType ();
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "	* Sets the U and V indices of an element that contains this point.

	:param theIndexU:
	:type theIndexU: int
	:param theIndexV:
	:type theIndexV: int
	:rtype: None
") SetIndices;
		void SetIndices (const Standard_Integer theIndexU,const Standard_Integer theIndexV);
		%feature("compactdefaultargs") GetIndices;
		%feature("autodoc", "	* Query the U and V indices of an element that contains this point.

	:param theIndexU:
	:type theIndexU: int &
	:param theIndexV:
	:type theIndexV: int &
	:rtype: None
") GetIndices;
		void GetIndices (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%extend Extrema_POnSurfParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
